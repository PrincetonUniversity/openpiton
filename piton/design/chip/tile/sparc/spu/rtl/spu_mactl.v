// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: spu_mactl.v
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
//      Description:    control for MA. 
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////


module spu_mactl (

/*outputs*/
spu_mactl_iss_pulse,
spu_mactl_mpa_wen,
spu_mactl_maaddr_wen,
spu_mactl_manp_wen,

spu_mactl_ldop,
spu_mactl_stop,
spu_mactl_mulop,
spu_mactl_redop,
spu_mactl_expop,

spu_mactl_memmxsel_l,

spu_mactl_memeve_wen,
spu_mactl_memodd_wen,

spu_mactl_mamem_ren,
spu_mactl_mamem_wen,

spu_mactl_iss_pulse_dly,

spu_mactl_ldxa_data_w_sel_l,
spu_mactl_ldxa_data_w_select,

spu_mactl_mpa_sel,

spu_mactl_madp_parflop_wen,

spu_lsu_ldxa_data_vld_w2,
spu_lsu_ldxa_tid_w2,
spu_lsu_stxa_ack,

spu_lsu_stxa_ack_tid,

spu_mactl_ldxa_mactl_reg,

spu_mactl_force_perr,

spu_ifu_ttype_w2,
spu_ifu_ttype_vld_w2,
spu_ifu_ttype_tid_w,

spu_tlu_rsrv_illgl_m,


spu_ifu_corr_err_w2,
spu_ifu_unc_err_w,
spu_lsu_unc_error_w,

spu_ifu_mamem_err_w,
spu_ifu_int_w2,
spu_lsu_ldxa_illgl_va_w2,


spu_mactl_streq,

spu_mactl_ctl_reset,
spu_mactl_mem_reset_l,


spu_mactl_ma_kill_op,

spu_mactl_stxa_force_abort,

spu_mactl_mactl_len,

spu_mactl_uncerr_rst,

spu_mactl_iss_pulse_pre,

spu_mactl_pcx_wen,
spu_mactl_pcx_7170_sel,

spu_mactl_perr_set,

/*inputs*/

spu_mast_streq,


lsu_spu_stb_empty,

spu_maaddr_maaddr_0,
spu_maaddr_mpa_3,

spu_mald_memwen,
spu_mamul_memwen,
spu_mamul_memren,
spu_maaeqb_memwen,
spu_maaeqb_memren,

spu_mared_memren,
spu_mared_memwen,

spu_mast_memren,

lsu_spu_early_flush_g,
tlu_spu_flush_w,
ifu_spu_flush_w,
ifu_spu_inst_vld_w,
lsu_spu_asi_state_e,
ifu_lsu_ld_inst_e,
ifu_lsu_st_inst_e,
ifu_lsu_alt_space_e,
ifu_tlu_thrid_e,
exu_lsu_ldst_va_e,

spu_mald_done_set,
spu_mast_done_set,
spu_mared_done_set,
spu_maexp_done_set,

spu_maexp_memren,

spu_maaddr_nooddwr_on_leneq1,

spu_mared_not_idle,
spu_mamul_oprnd2_bypass,

spu_madp_perr,

ma_ctl_reg_data,

ifu_spu_trap_ack,


spu_mactl_rsrv_data_e,



spu_maaddr_len_cntr,


spu_wen_ma_unc_err,
spu_wen_ma_cor_err,

ifu_spu_nceen,

lsu_spu_ldst_ack,
mux_drive_disable,


se,
grst_l,
arst_l,
rclk);

// ---------------------------------------------
input grst_l;
input arst_l;
input rclk;
input se;


input spu_mald_memwen;
input spu_mamul_memwen;
input spu_mamul_memren;
input spu_maaeqb_memwen;
input spu_maaeqb_memren;

input spu_maaddr_maaddr_0;
input  spu_maaddr_mpa_3;

input  spu_mared_memren;
input  spu_mared_memwen;

input  spu_mast_memren;


input lsu_spu_early_flush_g;
input tlu_spu_flush_w;
input ifu_spu_flush_w;
input ifu_spu_inst_vld_w;
input [7:0] lsu_spu_asi_state_e;
input ifu_lsu_ld_inst_e;
input ifu_lsu_st_inst_e;
input ifu_lsu_alt_space_e;
input [1:0] ifu_tlu_thrid_e;
input [7:0] exu_lsu_ldst_va_e;

input spu_mald_done_set;
input spu_mast_done_set;
input spu_mared_done_set;
input spu_maexp_done_set;

input spu_maexp_memren;

input spu_maaddr_nooddwr_on_leneq1;

input spu_mared_not_idle;
input spu_mamul_oprnd2_bypass;

input spu_madp_perr;

input [13:0] ma_ctl_reg_data;

input ifu_spu_trap_ack;


input [2:0] spu_mactl_rsrv_data_e;



input [3:0] lsu_spu_stb_empty;

input spu_mast_streq;

input [5:0] spu_maaddr_len_cntr;



input spu_wen_ma_unc_err;
input spu_wen_ma_cor_err;


input [3:0] ifu_spu_nceen;

input lsu_spu_ldst_ack;
input mux_drive_disable;

// ---------------------------------------------

output spu_mactl_iss_pulse;

output spu_mactl_mpa_wen;
output spu_mactl_maaddr_wen;
output spu_mactl_manp_wen;

output spu_mactl_ldop;
output spu_mactl_stop;
output spu_mactl_mulop;
output spu_mactl_redop;
output spu_mactl_expop;

output [2:0] spu_mactl_memmxsel_l;

output spu_mactl_memeve_wen;
output spu_mactl_memodd_wen;

output spu_mactl_mamem_ren;
output spu_mactl_mamem_wen;

output spu_mactl_iss_pulse_dly;

output [3:0] spu_mactl_ldxa_data_w_sel_l;
output spu_mactl_ldxa_data_w_select;

output spu_mactl_mpa_sel;

output spu_mactl_madp_parflop_wen;

output spu_lsu_ldxa_data_vld_w2;
output [1:0] spu_lsu_ldxa_tid_w2;
output spu_lsu_stxa_ack;
output [1:0] spu_lsu_stxa_ack_tid;


output [13:0] spu_mactl_ldxa_mactl_reg;

output spu_mactl_force_perr;

output spu_ifu_ttype_w2;
output spu_ifu_ttype_vld_w2;
output [1:0] spu_ifu_ttype_tid_w;

output spu_tlu_rsrv_illgl_m;


output spu_ifu_corr_err_w2;
output spu_ifu_unc_err_w;
output spu_lsu_unc_error_w;

output spu_ifu_mamem_err_w;
output spu_ifu_int_w2;
output spu_lsu_ldxa_illgl_va_w2;

output spu_mactl_streq;

output spu_mactl_ctl_reset;
output spu_mactl_mem_reset_l;


output spu_mactl_ma_kill_op;

output spu_mactl_stxa_force_abort;

output [5:0] spu_mactl_mactl_len;

output spu_mactl_uncerr_rst;

output spu_mactl_iss_pulse_pre;

output spu_mactl_pcx_wen;
output spu_mactl_pcx_7170_sel;

output spu_mactl_perr_set;


// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------

wire [1:0] spu_mactl_ldxa_tid_g2;
wire [1:0] spu_mactl_ldxa_tid_w;
wire spu_mactl_clr_busy_bit;
wire spu_mactl_busy_bit_wen,spu_mactl_busy_bit_wrdata;

wire clr_busy_bit_when_masync;

wire spu_mactl_mactl_wen;
wire ma_op_done;
wire spu_mactl_rsrv_done_set;
wire spu_mactl_rsrv_wrdetect_m;
wire spu_mactl_perr_set_int;
wire spu_mactl_disable_stxa_ack_g2;
wire wait_4stb_tobecome_empty;
wire waiting_4stb_tobecome_empty;
wire spu_lsu_stxa_ack_q_buf;

wire wait4_trap_ack_set;

wire spu_mactl_nceen_4int;

wire spu_ifu_mamem_unc_w2;
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------

/*
dffrl_async ma_mem_rst (.din (grst_l),
                        .q   (spu_mactl_mem_reset_l),
                        .clk (rclk),
                        .rst_l (arst_l), .se(se), .si(), .so());
*/

wire spu_mactl_ctl_rst_l;
dffrl_async ma_enc_rst (.din (grst_l),
                        .q   (spu_mactl_ctl_rst_l),
                        .clk (rclk),
                        .rst_l (arst_l), .se(se), .si(), .so());



wire spu_mactl_ctl_rst_local = ~spu_mactl_ctl_rst_l;

assign spu_mactl_ctl_reset = ~spu_mactl_ctl_rst_l;
   
assign spu_mactl_mem_reset_l = ~spu_mactl_ctl_rst_local;

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
wire spu_mactl_stxa_2ctl_reg;
wire stxa_2ctl_reg = spu_mactl_stxa_2ctl_reg;
wire ma_op_complete, spu_mactl_done;
wire ma_op_complete_mask;
wire [1:0] spu_thrid_m,spu_thrid_g;
wire [1:0] spu_thrid_g2;
// -----------------------------------------------------------------
// -----------------------------------------------------------------
// -----------------------------------------------------------------

wire wait4_trap_ack_stxa2ctl = wait4_trap_ack_set & stxa_2ctl_reg;

// -----------------------------------------------------------------
// -----------------------------------------------------------------
// -----------------------------------------------------------------
// -----------------------------------------------------------------
wire  state_reset = spu_mactl_ctl_rst_local | spu_mactl_done ;
// -------------------------------------------------------------------------

/*************
state
-----
00	idle
01	operation inprogress
10	wait state
11	abort
**************/
dff_s    #(1) state_00_ff (
        .din(nxt_state_00) ,
        .q(cur_state_00),
        .clk (rclk), .se(se), .si(), .so());

dffr_s  #(1) state_01_ff (
        .din(nxt_state_01) ,
        .q(cur_state_01),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so());

dffr_s  #(1) state_10_ff (
        .din(nxt_state_10) ,
        .q(cur_state_10),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so());

dffr_s  #(1) state_11_ff (
        .din(nxt_state_11) ,
        .q(cur_state_11),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so());
// -------------------------------------------------------------------------
// transition to 00 state.

assign spu_mactl_done = cur_state_01 & ~stxa_2ctl_reg & ma_op_complete_mask;

assign  nxt_state_00 = (
                         state_reset | spu_mactl_done |
                         (cur_state_00 & ~stxa_2ctl_reg ));

// -------------------------------------------------------------------------
// transition to 01 state.

wire tr2state01_frm_state00 = cur_state_00 & stxa_2ctl_reg & ~wait_4stb_tobecome_empty &
								~wait4_trap_ack_stxa2ctl; 
wire tr2state01_frm_state10 = cur_state_10 & ~(stxa_2ctl_reg | waiting_4stb_tobecome_empty |
								wait4_trap_ack_set); 

assign  nxt_state_01 = (
			 tr2state01_frm_state00 |
			 tr2state01_frm_state10 |
                         (cur_state_01 & ~stxa_2ctl_reg & ~ma_op_complete_mask));

// -------------------------------------------------------------------------
// transition to 10 state.

wire tr2state10_frm_state11 = cur_state_11 & ~stxa_2ctl_reg & ma_op_complete_mask; 
wire tr2state10_frm_state10 = cur_state_10 & (stxa_2ctl_reg | waiting_4stb_tobecome_empty |
								wait4_trap_ack_set); 
wire tr2state10_frm_state00 = cur_state_00 & (wait_4stb_tobecome_empty | wait4_trap_ack_stxa2ctl); 

assign  nxt_state_10 = (
                         tr2state10_frm_state00 | tr2state10_frm_state11 | tr2state10_frm_state10 );

// -------------------------------------------------------------------------
// transition to 11 state.

wire tr2state11_frm_state01 = cur_state_01 & stxa_2ctl_reg; 
wire tr2state11_frm_state11 = cur_state_11 & (stxa_2ctl_reg | ~ma_op_complete_mask); 

assign  nxt_state_11 = (
                         tr2state11_frm_state11 | tr2state11_frm_state01 );


// -------------------------------------------------------------------------

assign spu_mactl_mactl_wen = tr2state01_frm_state00 | tr2state01_frm_state10;

wire spu_mactl_mactl_iss_mxsel = tr2state01_frm_state00;
wire spu_mactl_mactl_wen_a_reg = stxa_2ctl_reg;


wire tr2state01_frm_state00_q,tr2state01_frm_state00_qq;
dff_s  #(2) tr2state01_frm_state00_dly_ff (
        .din({tr2state01_frm_state00,tr2state01_frm_state00_q}) ,
        .q({tr2state01_frm_state00_q,tr2state01_frm_state00_qq}),
        .clk (rclk), .se(se), .si(), .so());

wire tr2state01_frm_state10_q,tr2state01_frm_state10_qq;
dff_s  #(2) tr2state01_frm_state10_dly_ff (
        .din({tr2state01_frm_state10,tr2state01_frm_state10_q}) ,
        .q({tr2state01_frm_state10_q,tr2state01_frm_state10_qq}),
        .clk (rclk), .se(se), .si(), .so());

// since there is a 2 cycle delay between stxa to ctlreg and issue signal getting
// asserted and clear of all *_done_set signals. Need to mask out the qualification
// with ma_complete for these 2 cycles.
assign ma_op_complete_mask = ma_op_complete & ~(tr2state01_frm_state00_q |
				tr2state01_frm_state00_qq) & ~(tr2state01_frm_state10_q |
                                tr2state01_frm_state10_qq);

assign spu_mactl_stxa_force_abort = cur_state_11;

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// 				CTL REG
// -------------------------------------------------------------------------
wire [13:0] spu_mactl_mactl_reg;
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
wire [13:0] spu_mactl_young_ctlreg_data;
wire [13:0] spu_mactl_ctlreg_data_mxout;
// wire [1:0] old_ctlreg_issue_tid;
wire [1:0] young_ctlreg_issue_tid;
wire [1:0] ctlreg_tid_4cmp_2ldxa_tid;
wire ldxa_tid_match_ctlreg_tid_g2;

dffre_s  #(16) young_ctl_reg_ff (
        .din({spu_thrid_g2[1:0], ma_ctl_reg_data[13:0]}) ,
        .q({young_ctlreg_issue_tid[1:0],spu_mactl_young_ctlreg_data[13:0]}),
        .en(spu_mactl_mactl_wen_a_reg),
        .rst(spu_mactl_ctl_rst_local), .clk (rclk), .se(se), .si(), .so());


assign spu_mactl_ctlreg_data_mxout[13:0] = spu_mactl_mactl_iss_mxsel ? 
						 ma_ctl_reg_data[13:0] :
						 spu_mactl_young_ctlreg_data[13:0];

assign spu_mactl_ldxa_mactl_reg[13:0] = (cur_state_01 | cur_state_00) ? spu_mactl_mactl_reg[13:0] :
							spu_mactl_young_ctlreg_data[13:0];

assign ctlreg_tid_4cmp_2ldxa_tid[1:0] = (cur_state_01 | cur_state_00) ? spu_mactl_mactl_reg[12:11] :
							spu_mactl_young_ctlreg_data[12:11];

/*
replaced this with following since an ldxatosync followed and stxa2ctl was getting the incoorect timing
for compare of tids

assign ldxa_tid_match_ctlreg_tid_g = (ctlreg_tid_4cmp_2ldxa_tid[1:0] == spu_thrid_g[1:0]);

dff_s #(1) ldxa_tid_match_ctl_reg_tid_ff (
        .din(ldxa_tid_match_ctlreg_tid_g) ,
        .q(ldxa_tid_match_ctlreg_tid_g2),
        .clk (rclk), .se(se), .si(), .so()); 
*/

assign ldxa_tid_match_ctlreg_tid_g2 = (ctlreg_tid_4cmp_2ldxa_tid[1:0] == spu_thrid_g2[1:0]);
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
wire spu_mactl_busy_bit;
mux2ds #(1) busy_bit_mx (
        .in0    (spu_mactl_busy_bit_wrdata),
        .in1    (spu_mactl_ctlreg_data_mxout[10]),
        .sel0    (spu_mactl_busy_bit_wen),
        .sel1    (~spu_mactl_busy_bit_wen),
        .dout   (spu_mactl_busy_bit));

dffre_s  #(1) ctl_reg_busybit_ff (
        .din(spu_mactl_busy_bit ) ,
        .q(spu_mactl_mactl_reg[10]),
        .en(spu_mactl_busy_bit_wen),
        .rst(spu_mactl_ctl_rst_local|spu_mactl_clr_busy_bit), .clk (rclk), .se(se), .si(), .so());

///wire ma_is_busy = spu_mactl_mactl_reg[10];


/*
dffre_s  #(9) mactl_reg_ff (
        .din({spu_mactl_ctlreg_data_mxout[15:11],spu_mactl_ctlreg_data_mxout[9:6]}) ,
        .q({old_ctlreg_issue_tid[1:0], spu_mactl_mactl_reg[13:11],spu_mactl_mactl_reg[9:6]}),
        .en(spu_mactl_mactl_wen),
        .rst(spu_mactl_ctl_rst_local), .clk (rclk), .se(se), .si(), .so());
*/

dffre_s  #(7) mactl_reg_ff (
        .din({spu_mactl_ctlreg_data_mxout[13:11],spu_mactl_ctlreg_data_mxout[9:6]}) ,
        .q({spu_mactl_mactl_reg[13:11],spu_mactl_mactl_reg[9:6]}),
        .en(spu_mactl_mactl_wen),
        .rst(spu_mactl_ctl_rst_local), .clk (rclk), .se(se), .si(), .so());


wire spu_mactl_int_set = spu_mactl_mactl_reg[9];



/////////   NEED TO DO LEN UPDATE AT THE END also

wire [5:0] spu_mactl_len_cntr_mx;
dffre_s  #(6) mactl_reg_len_ff (
        .din(spu_mactl_len_cntr_mx[5:0]) ,
        .q(spu_mactl_mactl_reg[5:0]),
        .en(spu_mactl_mactl_wen | spu_mast_streq),
        .rst(spu_mactl_ctl_rst_local), .clk (rclk), .se(se), .si(), .so());


assign spu_mactl_mactl_len = spu_mactl_mactl_reg[5:0];

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// LEN field update


assign spu_mactl_len_cntr_mx[5:0] = (spu_maaddr_len_cntr[5:0] & {6{~spu_mactl_mactl_wen}}) |
					(spu_mactl_ctlreg_data_mxout[5:0] & {6{spu_mactl_mactl_wen}}) ;



// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// stb empty logic

wire allow_stxaack_waiting4trapack_pulse;

wire spu_thrid_decode_tid0 = ~spu_thrid_g2[1] & ~spu_thrid_g2[0];
wire spu_thrid_decode_tid1 = ~spu_thrid_g2[1] & spu_thrid_g2[0];
wire spu_thrid_decode_tid2 = spu_thrid_g2[1] & ~spu_thrid_g2[0];
wire spu_thrid_decode_tid3 = spu_thrid_g2[1] & spu_thrid_g2[0];


wire stb_isempty =
                                (lsu_spu_stb_empty[0] & spu_thrid_decode_tid0) |
                                (lsu_spu_stb_empty[1] & spu_thrid_decode_tid1) |
                                (lsu_spu_stb_empty[2] & spu_thrid_decode_tid2) |
                                (lsu_spu_stb_empty[3] & spu_thrid_decode_tid3) ;


wire wait_4stb_empty_wen = stxa_2ctl_reg & ~stb_isempty;
wire wait_4stb_empty_rst = (stxa_2ctl_reg & stb_isempty) | 
				tr2state01_frm_state10 |
				(allow_stxaack_waiting4trapack_pulse & ~wait_4stb_empty_wen) ;

assign spu_mactl_disable_stxa_ack_g2 = wait_4stb_empty_wen;
assign wait_4stb_tobecome_empty = wait_4stb_empty_wen;

wire waiting_4stb_empty_set;
dffre_s #(1) wait_4stb_empty_ff (
        .din(1'b1) ,
        .q(waiting_4stb_empty_set),
        .en(wait_4stb_empty_wen),
        .rst(spu_mactl_ctl_rst_local | wait_4stb_empty_rst), .clk (rclk), .se(se), .si(), .so()); 

wire young_thrid_decode_tid0 = ~young_ctlreg_issue_tid[1] & ~young_ctlreg_issue_tid[0];
wire young_thrid_decode_tid1 = ~young_ctlreg_issue_tid[1] & young_ctlreg_issue_tid[0];
wire young_thrid_decode_tid2 = young_ctlreg_issue_tid[1] & ~young_ctlreg_issue_tid[0];
wire young_thrid_decode_tid3 = young_ctlreg_issue_tid[1] & young_ctlreg_issue_tid[0];

wire stb_hasbecome_empty_while_instate10 =
                                (lsu_spu_stb_empty[0] & young_thrid_decode_tid0) |
                                (lsu_spu_stb_empty[1] & young_thrid_decode_tid1) |
                                (lsu_spu_stb_empty[2] & young_thrid_decode_tid2) |
                                (lsu_spu_stb_empty[3] & young_thrid_decode_tid3) ;

assign waiting_4stb_tobecome_empty  = (~stb_hasbecome_empty_while_instate10 & waiting_4stb_empty_set) | 
										wait_4stb_empty_wen;

wire allow_stxa_ack_while_instate10 = 
	//(waiting_4stb_empty_set & wait_4stb_empty_wen & cur_state_10) | // when in state10 & waiting 
	//(waiting_4stb_empty_set & wait_4stb_empty_wen ) | // when in state10 & waiting 
	(waiting_4stb_empty_set & stxa_2ctl_reg ) | // when in state10 & waiting 
									// 4stb_empty & there is stxa_2ctlreg.
	(waiting_4stb_empty_set & tr2state01_frm_state10 & stb_hasbecome_empty_while_instate10) | // when in state10 & 
									// waiting 4stb_empty and stb becomes empty. 
	allow_stxaack_waiting4trapack_pulse;



wire delayed_allow_stxa_ack;
wire delayed_allow_stxa_ack_pre = (stxa_2ctl_reg & stb_isempty & waiting_4stb_empty_set) |
					(spu_lsu_stxa_ack_q_buf & stxa_2ctl_reg & stb_isempty);//this is to resolve
									//b-b-b stxa's

wire waiting_4stb_empty_set_dly;
dff_s #(1) waiting_4stb_empty_set_dly_ff (
        .din(waiting_4stb_empty_set) ,
        .q(waiting_4stb_empty_set_dly),
        .clk (rclk), .se(se), .si(), .so());

wire waiting_4stb_empty_set_dly2;
dff_s #(1) waiting_4stb_empty_set_dly2_ff (
        .din(waiting_4stb_empty_set_dly) ,
        .q(waiting_4stb_empty_set_dly2),
        .clk (rclk), .se(se), .si(), .so());


wire delayed_allow_stxa_ack_pre_qual = delayed_allow_stxa_ack_pre & (waiting_4stb_empty_set |
						waiting_4stb_empty_set_dly | waiting_4stb_empty_set_dly2);

dffr_s #(1) delayed_allow_stxa_ack_pre_ff (
        .din(delayed_allow_stxa_ack_pre_qual) ,
        .q(delayed_allow_stxa_ack),
        .rst(spu_mactl_ctl_rst_local), .clk (rclk), .se(se), .si(), .so());

// ################################################################################ 
// ECO bug5326.
// this is related to stxa not getting acked when in state 10 and stb becomes empty and wait4_trap_ack is
// asserted and becaues of this tr2state01_frm_state10 does not occur and as a result no ack is sent out
// and when stb becomes empty(wait4_trap_ack is still waiting for ack) still no ack and stxa hangs.

wire  allow_stxaack_waiting4trapack = waiting_4stb_empty_set & stb_hasbecome_empty_while_instate10 & 
						cur_state_10 & wait4_trap_ack_set;

wire allow_stxaack_waiting4trapack_q;
dff_s  #(1) allow_stxaack_waiting4trapack_ff (
        .din(allow_stxaack_waiting4trapack) ,
        .q(allow_stxaack_waiting4trapack_q),
        .clk (rclk), .se(se), .si(), .so()); 

assign allow_stxaack_waiting4trapack_pulse = ~allow_stxaack_waiting4trapack_q & allow_stxaack_waiting4trapack;

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------

/*
dffr_s  #(1) spu_mactl_streq_ff (
        .din(spu_mast_streq) ,
        .q(spu_mactl_streq),
        .rst(lsu_spu_ldst_ack),
        .clk (rclk), .se(se), .si(), .so()); 
*/

wire spu_mactl_streq_set;
dffre_s  #(1) spu_mactl_streq_ff (
        .din(1'b1) ,
        .q(spu_mactl_streq_set),
        .en(spu_mast_streq),
        .rst(spu_mactl_ctl_rst_local | lsu_spu_ldst_ack), .clk (rclk), .se(se), .si(), .so());

//assign spu_mactl_streq = spu_mast_streq | spu_mactl_streq_set;
assign spu_mactl_streq = spu_mactl_streq_set ;


wire spu_mactl_pcx_7170_sel_pre = spu_mast_streq | spu_mactl_ldop;

dff_s  #(1) spu_mactl_pcx_7170_sel_ff (
        .din(spu_mactl_pcx_7170_sel_pre) ,
        .q(spu_mactl_pcx_7170_sel),
        .clk (rclk), .se(se), .si(), .so());

dff_s  #(1) spu_mactl_pcx_wen_ff (
        .din(spu_mactl_pcx_7170_sel_pre) ,
        .q(spu_mactl_pcx_wen),
        .clk (rclk), .se(se), .si(), .so());

/*
assign spu_mactl_pcx_7170_sel = spu_mast_streq_q | spu_mactl_ldop;
assign spu_mactl_pcx_wen = spu_mactl_pcx_7170_sel;
*/

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// SETTING THE BUSY BIT.
// -------------------------------------------------------------------------
// when spu_mactl_iss_pulse_dly is set busy_bit is set and when operation
// is done it is cleared.


assign spu_mactl_busy_bit_wen = spu_mactl_iss_pulse_dly |  
                                        spu_mactl_mactl_wen;

assign spu_mactl_busy_bit_wrdata = spu_mactl_iss_pulse_dly;



wire clr_busy_bit_when_maint = spu_mactl_int_set & ifu_spu_trap_ack;
//wire clr_busy_bit_when_maint = spu_mactl_int_set & 1'b0;

//wire spu_mactl_clr_all_done_set = clr_busy_bit_when_maint;

assign spu_mactl_clr_busy_bit = clr_busy_bit_when_masync | clr_busy_bit_when_maint;


/******************************************************************************/
// completion by interrupt.
// ----------------------------------------

wire done_set_pulse_q;
dff_s  #(1) doneset_pulse_ff (
        .din(ma_op_done) ,
        .q(done_set_pulse_q),
        .clk (rclk), .se(se), .si(), .so()); 


wire spu_mactl_ttype_vld = (~done_set_pulse_q & ma_op_done & spu_mactl_int_set) &
					(cur_state_00 | cur_state_01) & ~stxa_2ctl_reg ; 
									// prevent from sending completion
									// interrupt when in abort mode.

wire spu_mactl_ttype_vld_dly;
dff_s    #(1) ma_ttype_vld_ff (
        .din(spu_mactl_ttype_vld) ,
        .q(spu_mactl_ttype_vld_dly),
        .clk (rclk), .se(se), .si(), .so());

// ----------------------------------------
// ----ttype logic, 1 => 74(ma), 0 => 70(enc); enc has higher priority.
wire spu_mactl_ttype;
assign spu_mactl_ttype = 1'b1; 

// ----------------------------------------
// ----tid logic
assign spu_ifu_ttype_tid_w = spu_mactl_int_set ? spu_mactl_mactl_reg[12:11] :
						spu_mactl_ldxa_tid_g2[1:0];// changed to _g2 since
										//ifu_errctl flops it as well.

// ----------------------------------------
dff_s    #(2) spu_ifu_ttype_ff (
        .din({spu_mactl_ttype,spu_mactl_ttype_vld_dly}) ,
        .q({spu_ifu_ttype_w2,spu_ifu_ttype_vld_w2}),
        .clk (rclk), .se(se), .si(), .so());

// ----------------------------------------

wire ctl_tid_decode0 = ~spu_mactl_mactl_reg[12] & ~spu_mactl_mactl_reg[11];
wire ctl_tid_decode1 = ~spu_mactl_mactl_reg[12] & spu_mactl_mactl_reg[11];
wire ctl_tid_decode2 = spu_mactl_mactl_reg[12] & ~spu_mactl_mactl_reg[11];
wire ctl_tid_decode3 = spu_mactl_mactl_reg[12] & spu_mactl_mactl_reg[11];

//wire [3:0] ifu_spu_nceen_q;
assign spu_mactl_nceen_4int =
                                (ifu_spu_nceen[0] & ctl_tid_decode0) |
                                (ifu_spu_nceen[1] & ctl_tid_decode1) |
                                (ifu_spu_nceen[2] & ctl_tid_decode2) |
                                (ifu_spu_nceen[3] & ctl_tid_decode3) ;

// ----------------------------------------

wire wait4_trap_ack_rst = spu_ifu_mamem_unc_w2 & spu_mactl_nceen_4int ;

dffre_s  #(1) wait4_trap_ack_ff (
        .din(1'b1) ,
        .q(wait4_trap_ack_set),
        .en(spu_mactl_ttype_vld),
        .rst(spu_mactl_ctl_rst_local | ifu_spu_trap_ack | wait4_trap_ack_rst), .clk (rclk), .se(se), .si(), .so());


// -------------------------------------------------------------------------
// ***************** VA COMPARES ********************
// -------------------------------------------------------------------------
wire [7:0] spu_ldst_va_m,spu_ldst_va_m_buf,spu_ldst_va_g;
wire spu_mactl_mactl_va_vld_g;

wire spu_mactl_masync_va_vld_g 	= (spu_ldst_va_g[7:0] == 8'ha0);
wire spu_mactl_mpa_va_vld_g 	= (spu_ldst_va_g[7:0] == 8'h88);
wire spu_mactl_maaddr_va_vld_g 	= (spu_ldst_va_g[7:0] == 8'h90);
wire spu_mactl_manp_va_vld_g 	= (spu_ldst_va_g[7:0] == 8'h98);

wire spu_mactl_mactl_va_vld_m 	= (spu_ldst_va_m[7:0] == 8'h80);

dff_s  #(1) spu_mactl_mactl_va_vld_m_ff (
        .din(spu_mactl_mactl_va_vld_m) ,
        .q(spu_mactl_mactl_va_vld_g),
        .clk (rclk), .se(se), .si(), .so());


wire spu_mactl_ma_va_vld_g = spu_mactl_masync_va_vld_g | spu_mactl_mpa_va_vld_g |
					spu_mactl_maaddr_va_vld_g | spu_mactl_manp_va_vld_g |
					spu_mactl_mactl_va_vld_g;

wire spu_mactl_illgl_va_g = ~spu_mactl_ma_va_vld_g ;


wire spu_mactl_masync_va_vld_g2, spu_mactl_mpa_va_vld_g2, spu_mactl_maaddr_va_vld_g2,
                        spu_mactl_manp_va_vld_g2, spu_mactl_mactl_va_vld_g2, spu_mactl_illgl_va_g2;

dff_s  #(6) mactl_va_vld_g2_ff (
        .din({spu_mactl_masync_va_vld_g, spu_mactl_mpa_va_vld_g, spu_mactl_maaddr_va_vld_g,
			spu_mactl_manp_va_vld_g, spu_mactl_mactl_va_vld_g, spu_mactl_illgl_va_g}) ,
        .q({spu_mactl_masync_va_vld_g2, spu_mactl_mpa_va_vld_g2, spu_mactl_maaddr_va_vld_g2,
                        spu_mactl_manp_va_vld_g2, spu_mactl_mactl_va_vld_g2, spu_mactl_illgl_va_g2}),
        .clk (rclk), .se(se), .si(), .so());



// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------

wire spu_ld_inst_m,spu_st_inst_m,spu_alt_space_m;
wire spu_mactl_asi_is_40_m;
wire spu_mactl_asi_is_40_m_buf;
wire spu_mactl_asi_is_40_e;

dff_s  #(13) ifu_spu_pipe_ff (
        .din({ifu_lsu_ld_inst_e,ifu_lsu_st_inst_e,ifu_lsu_alt_space_e,
              ifu_tlu_thrid_e[1:0],exu_lsu_ldst_va_e[7:0]}) ,
        .q({spu_ld_inst_m,spu_st_inst_m,spu_alt_space_m,
              spu_thrid_m[1:0],spu_ldst_va_m[7:0]}),
        .clk (rclk), .se(se), .si(), .so());

assign spu_ldst_va_m_buf = spu_ldst_va_m;

// asi addr = 80

wire spu_mactl_mactl_wen_m_prequal = spu_mactl_asi_is_40_m_buf & spu_alt_space_m & spu_st_inst_m ;
/*
wire spu_mactl_mactl_wen_m = spu_mactl_mactl_va_vld_m & spu_mactl_asi_is_40_m &
				spu_alt_space_m & spu_st_inst_m ;
*/
                                //ifu_tlu_inst_vld_m;

wire spu_mactl_mactl_wen_m = spu_mactl_mactl_va_vld_m & spu_mactl_mactl_wen_m_prequal ;

wire spu_mactl_mactl_wen_g;
dff_s  #(1) spu_mactl_mactl_ack_ff (
        .din(spu_mactl_mactl_wen_m) ,
        .q(spu_mactl_mactl_wen_g),
        .clk (rclk), .se(se), .si(), .so());


///wire spu_mactl_mactl_wen_busy_m = spu_mactl_mactl_wen_m & ~ma_is_busy;
// wire spu_mactl_mactl_wen_vld_m = spu_mactl_mactl_wen_busy_m & ifu_tlu_inst_vld_m;

/*
wire spu_mactl_mactl_wen_busy_g;
dff_s  #(1) spu_mactl_mactl_wen_busy_m_ff (
        .din(spu_mactl_mactl_wen_busy_m) ,
        .q(spu_mactl_mactl_wen_busy_g),
        .clk (rclk), .se(se), .si(), .so());

wire spu_mactl_mactl_wen_vld_g = spu_mactl_mactl_wen_busy_g & ifu_spu_inst_vld_w;

*/


wire spu_mactl_mactl_wen_vld_g = spu_mactl_mactl_wen_g & ifu_spu_inst_vld_w;

wire spu_mactl_mactl_wen_vld_g2;
dff_s  #(1) spu_mactl_mactl_wen_vld_g_ff (
        .din(spu_mactl_mactl_wen_vld_g) ,
        .q(spu_mactl_mactl_wen_vld_g2),
        .clk (rclk), .se(se), .si(), .so());



dff_s  #(10) spu_pipe_ff (
        .din({spu_thrid_m[1:0],spu_ldst_va_m_buf[7:0]}),
        .q({spu_thrid_g[1:0],spu_ldst_va_g[7:0]}),
        .clk (rclk), .se(se), .si(), .so());


dff_s  #(2) tid_g2_ff (
        .din(spu_thrid_g[1:0]) ,
        .q(spu_thrid_g2[1:0]),
        .clk (rclk), .se(se), .si(), .so());

/*
wire [7:0] spu_mactl_asi_state_m;
dff_s  #(8) spu_mactl_asi_state_ff (
        .din(lsu_spu_asi_state_e[7:0]) ,
        .q(spu_mactl_asi_state_m[7:0]),
        .clk (rclk), .se(se), .si(), .so());
*/

assign spu_mactl_asi_is_40_e = (lsu_spu_asi_state_e[7:0] == 8'h40);

dff_s  #(2) spu_mactl_asi_is_40_e_ff (
        .din({spu_mactl_asi_is_40_e, spu_mactl_asi_is_40_e}) ,
        .q({spu_mactl_asi_is_40_m, spu_mactl_asi_is_40_m_buf}),
        .clk (rclk), .se(se), .si(), .so());

wire spu_mactl_asi40_alt_st_m = spu_mactl_asi_is_40_m & spu_alt_space_m & spu_st_inst_m ; 
wire spu_mactl_asi40_alt_ld_m = spu_mactl_asi_is_40_m & spu_alt_space_m & spu_ld_inst_m ; 

// wire spu_mactl_asi40_alt_st_vld_m = spu_mactl_asi40_alt_st_m & ifu_tlu_inst_vld_m;
// wire spu_mactl_asi40_alt_ld_vld_m = spu_mactl_asi40_alt_ld_m & ifu_tlu_inst_vld_m;


wire spu_mactl_asi40_alt_st_g,spu_mactl_asi40_alt_ld_g;
dff_s  #(2) vld_ldst_alt_asi40_ff (
        .din({spu_mactl_asi40_alt_st_m,spu_mactl_asi40_alt_ld_m}) ,
        .q({spu_mactl_asi40_alt_st_g,spu_mactl_asi40_alt_ld_g}),
        .clk (rclk), .se(se), .si(), .so());


wire spu_mactl_asi40_alt_st_vld_g = spu_mactl_asi40_alt_st_g & ifu_spu_inst_vld_w;
wire spu_mactl_asi40_alt_ld_vld_g = spu_mactl_asi40_alt_ld_g & ifu_spu_inst_vld_w;


wire spu_mactl_asi40_alt_st_vld_g2,spu_mactl_asi40_alt_ld_vld_g2;
dff_s  #(2) vld_ldst_alt_asi40_g2_ff (
        .din({spu_mactl_asi40_alt_st_vld_g,spu_mactl_asi40_alt_ld_vld_g}) ,
        .q({spu_mactl_asi40_alt_st_vld_g2,spu_mactl_asi40_alt_ld_vld_g2}),
        .clk (rclk), .se(se), .si(), .so());



wire all_flush = lsu_spu_early_flush_g | tlu_spu_flush_w | ifu_spu_flush_w;

wire spu_mactl_flush_g2;
dff_s  #(1) flush_ff (
        .din(all_flush) ,
        .q(spu_mactl_flush_g2),
        .clk (rclk), .se(se), .si(), .so());


wire spu_mactl_st_asi_vld = spu_mactl_asi40_alt_st_vld_g2 & ~spu_mactl_flush_g2;
wire spu_mactl_ld_asi_vld = spu_mactl_asi40_alt_ld_vld_g2 & ~spu_mactl_flush_g2;


wire spu_mactl_st_asi_vld_local = spu_mactl_st_asi_vld;
wire spu_mactl_ld_asi_vld_local = spu_mactl_ld_asi_vld;

wire spu_mactl_illgl_va_vld_g2 = spu_mactl_illgl_va_g2 & spu_mactl_ld_asi_vld_local;



// -------------------------------------------------------------------------
// ******************* ST ASI ***********************
// -------------------------------------------------------------------------
// ST ASI decode and generate write enables.

// asi addr = 88
assign spu_mactl_mpa_wen = spu_mactl_mpa_va_vld_g2 & spu_mactl_st_asi_vld_local ; 

// asi addr = 90
assign spu_mactl_maaddr_wen = spu_mactl_maaddr_va_vld_g2 & spu_mactl_st_asi_vld_local ; 

// asi addr = 98
assign spu_mactl_manp_wen = spu_mactl_manp_va_vld_g2 & spu_mactl_st_asi_vld_local ; 

// asi addr = 80
assign spu_mactl_stxa_2ctl_reg = spu_mactl_mactl_wen_vld_g2 & ~spu_mactl_flush_g2 ;



// -------------------------------------------------------------------------
// STXA ACK 
// -------------------------------------------------------------------------
wire spu_lsu_stxa_ack_g2;
wire disable_stxa_ack_4b2b_same_tid;

wire spu_lsu_stxa_ack_g2_prequal = ( spu_mactl_stxa_2ctl_reg & ~spu_mactl_disable_stxa_ack_g2) |
				allow_stxa_ack_while_instate10 |
				delayed_allow_stxa_ack;

assign spu_lsu_stxa_ack_g2 = spu_lsu_stxa_ack_g2_prequal & ~disable_stxa_ack_4b2b_same_tid;

dff_s  #(1) stxa_ack_g2_ff (
        .din(spu_lsu_stxa_ack_g2) ,
        .q(spu_lsu_stxa_ack),
        .clk (rclk), .se(se), .si(), .so());

assign spu_lsu_stxa_ack_q_buf = spu_lsu_stxa_ack;

assign spu_lsu_stxa_ack_tid[1:0] =  (allow_stxa_ack_while_instate10 |
				     delayed_allow_stxa_ack) ? young_ctlreg_issue_tid[1:0] :
									spu_thrid_g2[1:0]; 


// following is to avoid the case when the logic generates a b2b stxa ack for the same tid.
wire [1:0] spu_lsu_stxa_ack_tid_g3;
dff_s  #(2) stxa_ack_tid_g2_ff (
        .din(spu_lsu_stxa_ack_tid[1:0]) ,
        .q(spu_lsu_stxa_ack_tid_g3[1:0]),
        .clk (rclk), .se(se), .si(), .so());

wire g2_g3_tids_match = (spu_lsu_stxa_ack_tid[1:0] == spu_lsu_stxa_ack_tid_g3[1:0]);

assign disable_stxa_ack_4b2b_same_tid = spu_lsu_stxa_ack & g2_g3_tids_match;

// -------------------------------------------------------------------------
// ******************* LD ASI ***********************
// -------------------------------------------------------------------------
// LD ASI decode and generate write enables.
wire masync_set;
wire spu_mactl_masync_ldxa;
wire spu_mactl_masync_ldxa_sel;
wire spu_mactl_masync_ldxa_sel_pre;
// asi addr = A0

assign spu_mactl_masync_ldxa = spu_mactl_masync_va_vld_g2 & spu_mactl_ld_asi_vld_local;

//wire spu_mactl_masync_ldxa_qual = spu_mactl_masync_ldxa & ~masync_set;
wire spu_mactl_masync_ldxa_qual = spu_mactl_masync_ldxa & ldxa_tid_match_ctlreg_tid_g2;

wire spu_mactl_masync_ldxa_rst = spu_mactl_ctl_rst_local | spu_mactl_masync_ldxa_sel_pre;

wire [1:0] masync_tid;

dffre_s  #(3) masync_ff (
        .din({1'b1,spu_thrid_g2[1:0]}) ,
        .q({masync_set,masync_tid[1:0]}),
        .en(spu_mactl_masync_ldxa_qual),
        .rst(spu_mactl_masync_ldxa_rst), .clk (rclk), .se(se), .si(), .so());

//wire multi_masync_ldxa_sel = masync_set & spu_mactl_masync_ldxa;
//&&&&&&&&&&&&&&&&&&&&&
// following should signal to lsu spu_lsu_ldxa_data_vld and also spu_lsu_illgl_va.
//&&&&&&&&&&&&&&&&&&&&&

wire ldxa_2masync_tid_notmatch_ctlreg_tid = ~ldxa_tid_match_ctlreg_tid_g2 & spu_mactl_masync_ldxa;


wire spu_mactl_rst_done_set;
dffre_s #(1) spu_mactl_rst_done_ff (
        .din(1'b1) ,
        .q(spu_mactl_rst_done_set),
        .en(spu_mactl_ctl_rst_local),
        .rst(spu_mactl_iss_pulse_dly), .clk (rclk), .se(se), .si(), .so()); 


assign ma_op_done = spu_mald_done_set | spu_mared_done_set | spu_mast_done_set |
			spu_maexp_done_set | spu_mactl_rsrv_done_set | spu_mactl_rst_done_set;

assign ma_op_complete = spu_mald_done_set | spu_mared_done_set | spu_mast_done_set |
				spu_maexp_done_set;


//&&&&&&&&&&&&&&&&&&&&&
// mask(or delay) ma_op_done if ldxa to mpa_maaddr_manp_mactl register's is in progress to avoid conflicts
// with masync response when operation completes/aborts.
//&&&&&&&&&&&&&&&&&&&&&


wire spu_mactl_mask_done_set_4abort = cur_state_11 | cur_state_10 | tr2state01_frm_state10_q |
									tr2state01_frm_state10_qq;



wire spu_mactl_ldxa_mpa_maaddr_manp_mactl;

wire spu_mactl_masync_ldxa_set = ma_op_done & masync_set & ~spu_mactl_ldxa_mpa_maaddr_manp_mactl &
							~spu_mactl_masync_ldxa & // this is when ldxa to masync and
										// compleion occur at same time
							~spu_mactl_mask_done_set_4abort; 

wire masync_pulse_q;

dff_s  #(1) masync_pulse_ff (
	.din(spu_mactl_masync_ldxa_set) ,
	.q(masync_pulse_q),
	.clk (rclk), .se(se), .si(), .so());


//&&&&&&&&&&&&&&&&&&&&&
// following _pre signal is to signal an operation completed normally or was aborted.
//&&&&&&&&&&&&&&&&&&&&&

assign spu_mactl_masync_ldxa_sel_pre = (~masync_pulse_q & spu_mactl_masync_ldxa_set) |
					(masync_set & stxa_2ctl_reg); //this unblocks ldxa to sync reg since
									// this is an abort

assign spu_mactl_masync_ldxa_sel = spu_mactl_masync_ldxa_sel_pre | ldxa_2masync_tid_notmatch_ctlreg_tid;

//&&&&&&&&&&&&&&&&&&&&&
// mask out clearing the busy bit when another stxa is aborting the older operation. Since the timing
// of setting the busy bit is earlier than clearing it. So in this case the busy bit set for younger
// operation will be cleared when ldxa to sync is reponded as a result of the abort. And we want to avoid that.
//&&&&&&&&&&&&&&&&&&&&&

assign clr_busy_bit_when_masync = spu_mactl_masync_ldxa_sel_pre & ~(masync_set & stxa_2ctl_reg);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// asi addr = 88
wire spu_mactl_mpa_ldxa_g2 = spu_mactl_mpa_va_vld_g2 & spu_mactl_ld_asi_vld_local ; 

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// asi addr = 90
wire spu_mactl_maaddr_ldxa_g2 = spu_mactl_maaddr_va_vld_g2 & spu_mactl_ld_asi_vld_local ; 

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// asi addr = 98
wire spu_mactl_manp_ldxa_g2 = spu_mactl_manp_va_vld_g2 & spu_mactl_ld_asi_vld_local ; 

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// asi addr = 80
wire spu_mactl_mactl_ldxa_g2 = spu_mactl_mactl_va_vld_g2 & spu_mactl_ld_asi_vld_local ; 

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
/*
assign spu_mactl_ldxa_tid_g2[1:0] = (({2{spu_mactl_mpa_ldxa_g2}} & spu_thrid_g2[1:0]) |
                                    ({2{spu_mactl_maaddr_ldxa_g2}} & spu_thrid_g2[1:0]) |
                                    ({2{spu_mactl_manp_ldxa_g2}} & spu_thrid_g2[1:0]) |
                                    ({2{spu_mactl_mactl_ldxa_g2}} & spu_thrid_g2[1:0]) |
                                    ({2{spu_mactl_masync_ldxa_sel}} & masync_tid[1:0]) );
*/


assign spu_mactl_ldxa_tid_g2[1:0] = spu_mactl_masync_ldxa_sel_pre ? masync_tid[1:0] :
									spu_thrid_g2[1:0];

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

assign spu_mactl_ldxa_mpa_maaddr_manp_mactl = spu_mactl_mpa_ldxa_g2 | spu_mactl_maaddr_ldxa_g2 |
						spu_mactl_manp_ldxa_g2 | spu_mactl_mactl_ldxa_g2;

wire spu_mactl_ldxa_data_vld_g2 = 	spu_mactl_ldxa_mpa_maaddr_manp_mactl |
					spu_mactl_illgl_va_vld_g2 |
					spu_mactl_masync_ldxa_sel;

// any ldxa to masync reg that its tid does not match tid of ctlreg should generate an
// illgl_va to lsu, so lsu silently drops it(no writes to the reg file).

wire illgl_va_vld_or_drop_ldxa2masync = spu_mactl_illgl_va_vld_g2 | ldxa_2masync_tid_notmatch_ctlreg_tid |
						(masync_set & stxa_2ctl_reg);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// fix for bug 4918, when ldxa to tid3 which causes illl_va and masyc completion to another tid 
// that causes unc_err. both of these happen at the same time, need to delay unc_err.

wire spu_mactl_ldxa_data_vld_qual = spu_mactl_masync_ldxa_sel | spu_mactl_ldxa_mpa_maaddr_manp_mactl; 

wire spu_mactl_illgl_va_vld_w;
wire spu_mactl_ldxa_data_vld_qual_w;
dff_s #(1) spu_mactl_ldxa_data_vld_qual_ff (
        .din(spu_mactl_ldxa_data_vld_qual) ,
        .q(spu_mactl_ldxa_data_vld_qual_w),
        .clk (rclk), .se(se), .si(), .so());

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
wire spu_mactl_ldxa_data_vld_w;
dff_s  #(4) ldxa_tid_vld_ff (
        //.din({spu_mactl_ldxa_tid_g2[1:0],spu_mactl_ldxa_data_vld_g2, spu_mactl_illgl_va_vld_g2}) ,

        .din({spu_mactl_ldxa_tid_g2[1:0],spu_mactl_ldxa_data_vld_g2, illgl_va_vld_or_drop_ldxa2masync}) ,
        .q({spu_mactl_ldxa_tid_w[1:0],spu_mactl_ldxa_data_vld_w, spu_mactl_illgl_va_vld_w}),
        .clk (rclk), .se(se), .si(), .so());


assign spu_lsu_ldxa_data_vld_w2 = spu_mactl_ldxa_data_vld_w ;
assign spu_lsu_ldxa_tid_w2[1:0] = spu_mactl_ldxa_tid_w[1:0] ;

wire spu_mactl_perr_rst;
assign spu_lsu_ldxa_illgl_va_w2 = spu_mactl_illgl_va_vld_w & ~spu_lsu_unc_error_w;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

wire [3:0] spu_mactl_ldxa_data_g2_sel;
wire spu_mactl_ldxa_data_g2_select;

/******				*************
assign spu_mactl_ldxa_data_g2_sel[3:0] = {spu_mactl_mactl_ldxa_g2,
					 spu_mactl_manp_ldxa_g2,
					 spu_mactl_maaddr_ldxa_g2,
					 spu_mactl_mpa_ldxa_g2};
*******				*************/


assign spu_mactl_ldxa_data_g2_sel[0] = spu_mactl_mpa_ldxa_g2;
assign spu_mactl_ldxa_data_g2_sel[1] = ~spu_mactl_mpa_ldxa_g2 & spu_mactl_maaddr_ldxa_g2;
assign spu_mactl_ldxa_data_g2_sel[2] = ~spu_mactl_mpa_ldxa_g2 & ~spu_mactl_maaddr_ldxa_g2 &
                                                spu_mactl_manp_ldxa_g2;
assign spu_mactl_ldxa_data_g2_sel[3] = ~spu_mactl_mpa_ldxa_g2 & ~spu_mactl_maaddr_ldxa_g2 &
                                                ~spu_mactl_manp_ldxa_g2;




assign spu_mactl_ldxa_data_g2_select = ~(spu_mactl_mactl_ldxa_g2 |
                                         spu_mactl_manp_ldxa_g2 |
                                         spu_mactl_maaddr_ldxa_g2 |
                                         spu_mactl_mpa_ldxa_g2);

wire [3:0] spu_mactl_ldxa_data_w_sel;
dff_s  #(5) ldxa_data_sel_ff (
        .din({spu_mactl_ldxa_data_g2_sel[3:0],spu_mactl_ldxa_data_g2_select}) ,
        .q({spu_mactl_ldxa_data_w_sel[3:0],spu_mactl_ldxa_data_w_select}),
        .clk (rclk), .se(se), .si(), .so());


wire [3:0] spu_mactl_ldxa_data_w_sel_s;
assign spu_mactl_ldxa_data_w_sel_s[0] = spu_mactl_ldxa_data_w_sel[0] | mux_drive_disable;
assign spu_mactl_ldxa_data_w_sel_s[1] = spu_mactl_ldxa_data_w_sel[1] & ~mux_drive_disable;
assign spu_mactl_ldxa_data_w_sel_s[2] = spu_mactl_ldxa_data_w_sel[2] & ~mux_drive_disable;
assign spu_mactl_ldxa_data_w_sel_s[3] = spu_mactl_ldxa_data_w_sel[3] & ~mux_drive_disable;


assign spu_mactl_ldxa_data_w_sel_l = ~spu_mactl_ldxa_data_w_sel_s;

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// reserve bit write detect. Kill start signal(spu_encctl_iss_pulse_dly) and
// signal a completion signal.
// ---------------------------------------------------

wire [2:0] spu_mactl_op_field_e;
//wire [2:0] spu_mactl_op_field_m;

assign spu_mactl_op_field_e[2:0] = spu_mactl_rsrv_data_e[2:0];

wire spu_mactl_rsrv_wrdetect_e = spu_mactl_op_field_e[2] & ~(~(spu_mactl_op_field_e[1]|spu_mactl_op_field_e[0]));

wire spu_mactl_rsrv_wrdetect_noqual_m;
dff_s #(1) spu_mactl_rsrv_wrdetect_e_ff (
        .din(spu_mactl_rsrv_wrdetect_e) ,
        .q(spu_mactl_rsrv_wrdetect_noqual_m),
        .clk (rclk), .se(se), .si(), .so());

assign spu_mactl_rsrv_wrdetect_m = spu_mactl_rsrv_wrdetect_noqual_m & spu_mactl_mactl_wen_m;

/*
dffr_s #(3) rsrv_data_ff (
        .din(spu_mactl_rsrv_data_e[2:0]) ,
        .q(spu_mactl_op_field_m[2:0]),
        .rst(spu_mactl_ctl_rst_local), .clk (rclk), .se(se), .si(), .so());


assign spu_mactl_rsrv_wrdetect_m =
		spu_mactl_op_field_m[2] & ~(~(spu_mactl_op_field_m[1]|spu_mactl_op_field_m[0])) &
		spu_mactl_mactl_wen_m;

*/
 
wire spu_mactl_rsrv_done_wen; 
wire spu_mactl_rsrv_done_rst = spu_mactl_ctl_rst_local | spu_mactl_iss_pulse_dly;

dffre_s #(1) spu_mactl_rsrv_done_ff (
        .din(1'b1) ,
        .q(spu_mactl_rsrv_done_set),
        .en(spu_mactl_rsrv_done_wen),
        .rst(spu_mactl_rsrv_done_rst), .clk (rclk), .se(se), .si(), .so());

wire spu_mactl_rsrv_wrdetect_m2;

dff_s #(1) spu_mactl_rsrv_wrdetect_m_ff (
        .din(spu_mactl_rsrv_wrdetect_m) ,
        .q(spu_mactl_rsrv_wrdetect_m2),
        .clk (rclk), .se(se), .si(), .so());


assign spu_tlu_rsrv_illgl_m = spu_mactl_rsrv_wrdetect_m ;

// ----------------------------------------------

wire spu_mactl_rsrv_wrdetect_m3;
dff_s #(1) spu_mactl_rsrv_wrdetect_m2_ff (
        .din(spu_mactl_rsrv_wrdetect_m2) ,
        .q(spu_mactl_rsrv_wrdetect_m3),
        .clk (rclk), .se(se), .si(), .so());

wire ifu_spu_inst_vld_w2;
dff_s #(1) ifu_spu_inst_vld_w_dff (
        .din(ifu_spu_inst_vld_w) ,
        .q(ifu_spu_inst_vld_w2),
        .clk (rclk), .se(se), .si(), .so());

assign spu_mactl_rsrv_done_wen = ~spu_mactl_flush_g2 & ifu_spu_inst_vld_w2 & spu_mactl_rsrv_wrdetect_m3;

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// ^^^^^^^^^^^^^^ ISSUE VALID SIGNAL ^^^^^^^^^^^^^^
// -------------------------------------------------------------------------
wire maop_vld_set;

wire maop_vld_rst = spu_mactl_ctl_rst_local | spu_mactl_iss_pulse_dly;

wire maop_vld_wen = spu_mactl_mactl_wen & ~spu_mactl_rsrv_wrdetect_m3;

assign spu_mactl_iss_pulse_pre = maop_vld_wen;

dffre_s  #(1) maop_vld_ff (
        .din(1'b1) ,
        .q(maop_vld_set),
        .en(maop_vld_wen),
        .rst(maop_vld_rst), .clk (rclk), .se(se), .si(), .so());

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
wire maop_vld_set_q;

dff_s  #(1) iss_pulse_ff (
        .din(maop_vld_set) ,
        .q(maop_vld_set_q),
        .clk (rclk), .se(se), .si(), .so());


assign spu_mactl_iss_pulse = ~maop_vld_set_q & maop_vld_set;

dff_s  #(1) iss_pulse_dly_ff (
        .din(spu_mactl_iss_pulse) ,
        .q(spu_mactl_iss_pulse_dly),
        .clk (rclk), .se(se), .si(), .so());

// -------------------------------------------------------------------------
// ^^^^^^^^^^^^^^^ OPCODE DECODE ^^^^^^^^^^^^^^^^
// -------------------------------------------------------------------------
// OPCODE decode.
wire [2:0] spu_madp_mactl_op;

assign spu_madp_mactl_op = spu_mactl_mactl_reg[8:6];

wire spu_mactl_ldop_pre = ~(|spu_madp_mactl_op[2:0]) ;

wire spu_mactl_stop_pre = ~spu_madp_mactl_op[2] & ~spu_madp_mactl_op[1] & 
				spu_madp_mactl_op[0];

wire spu_mactl_mulop_pre = ~spu_madp_mactl_op[2] & spu_madp_mactl_op[1] & 
				~spu_madp_mactl_op[0];

wire spu_mactl_redop_pre = ~spu_madp_mactl_op[2] & spu_madp_mactl_op[1] & 
				spu_madp_mactl_op[0] ;

wire spu_mactl_expop_pre = spu_madp_mactl_op[2] & ~spu_madp_mactl_op[1] & 
				~spu_madp_mactl_op[0];

dff_s #(1) ldop_ff (
        .din(spu_mactl_ldop_pre) ,
        .q(spu_mactl_ldop),
        .clk (rclk), .se(se), .si(), .so());

dff_s #(1) stop_ff (
        .din(spu_mactl_stop_pre) ,
        .q(spu_mactl_stop),
        .clk (rclk), .se(se), .si(), .so());

dff_s #(1) mulop_ff (
        .din(spu_mactl_mulop_pre) ,
        .q(spu_mactl_mulop),
        .clk (rclk), .se(se), .si(), .so());

dff_s #(1) redop_ff (
        .din(spu_mactl_redop_pre) ,
        .q(spu_mactl_redop),
        .clk (rclk), .se(se), .si(), .so());

dff_s #(1) expop_ff (
        .din(spu_mactl_expop_pre) ,
        .q(spu_mactl_expop),
        .clk (rclk), .se(se), .si(), .so());


// -------------------------------------------------------------------------

assign spu_mactl_mpa_sel = spu_mactl_ldop | spu_mactl_stop;

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// ^^^^^^^^^^^^^^^ MEM WR/D ENABLE ^^^^^^^^^^^^^^^
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// the follwoing are for MAMEM(load) write and mux selection
/*******************************

MPA[3] MAADDR[0] | 
------------------------------
  0      0 	 | 128b	| eve+odd | mxsel[0]
  0      1 	 | 64b	| odd	  | mxsel[1]
  1      0 	 | 64b	| eve	  | mxsel[1]
  1      1 	 | 64b	| odd	  | mxsel[0]

********************************/

wire spu_mactl_memwen = spu_mamul_memwen | spu_maaeqb_memwen | spu_mald_memwen | spu_mared_memwen;
wire spu_mactl_memren = spu_mamul_memren | spu_maaeqb_memren |spu_mared_memren | spu_mast_memren |
				spu_maexp_memren;

assign spu_mactl_memeve_wen = ~spu_maaddr_maaddr_0 & spu_mactl_memwen;
assign spu_mactl_memodd_wen = (spu_maaddr_maaddr_0 & spu_mactl_memwen) | 
			(spu_mald_memwen & ~spu_maaddr_maaddr_0 & ~spu_maaddr_mpa_3 &
				spu_maaddr_nooddwr_on_leneq1);

wire mem_swap = (~spu_maaddr_mpa_3 & spu_maaddr_maaddr_0) |
	   	  (spu_maaddr_mpa_3 & ~spu_maaddr_maaddr_0);

wire [2:0] spu_mactl_memmxsel;
assign spu_mactl_memmxsel[2] = ~spu_mactl_ldop_pre; // its a mulop
assign spu_mactl_memmxsel[1] = spu_mactl_ldop_pre & mem_swap ;
assign spu_mactl_memmxsel[0] = spu_mactl_ldop_pre & ~mem_swap;

assign spu_mactl_memmxsel_l[2:0] = ~spu_mactl_memmxsel[2:0];
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------

assign spu_mactl_mamem_ren = spu_mactl_memren;
assign spu_mactl_mamem_wen = spu_mactl_memwen;

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// ^^^^^^^^^^^^^^ FLOP ENABLE FOR MA MUL/RED OPERATIONS ^^^^^^^^^^
// -------------------------------------------------------------------------

assign spu_mactl_madp_parflop_wen = spu_mared_not_idle | spu_mamul_oprnd2_bypass;

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// ^^^^^^^^^^^^ PERR ^^^^^^^^^^^^^^
// -------------------------------------------------------------------------

wire spu_mactl_mamem_ren_dly1,spu_mactl_mamem_ren_dly2;
dff_s    #(2) dly_ren_ff (
        .din({spu_mactl_mamem_ren,spu_mactl_mamem_ren_dly1}) ,
        .q({spu_mactl_mamem_ren_dly1,spu_mactl_mamem_ren_dly2}),
        .clk (rclk), .se(se), .si(), .so());


wire spu_mactl_perr_wen = spu_madp_perr & spu_mactl_mamem_ren_dly2;

dffre_s  #(1) perr_ff (
        .din(1'b1) ,
        .q(spu_mactl_perr_set_int),
        .en(spu_mactl_perr_wen),
        //.rst(spu_mactl_ctl_rst_local | spu_mactl_iss_pulse_dly), .clk (rclk), .se(se), .si(), .so());
        .rst(spu_mactl_ctl_rst_local | spu_mactl_perr_rst), .clk (rclk), .se(se), .si(), .so());

assign spu_mactl_perr_set = spu_mactl_perr_set_int;

wire spu_mactl_perr_kill_op;
dff_s  #(1) perr_dly_ff (
        .din(spu_mactl_perr_wen) ,
        .q(spu_mactl_perr_kill_op),
        .clk (rclk), .se(se), .si(), .so());



assign spu_mactl_ma_kill_op = spu_mactl_perr_kill_op;

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------

// force perr during ma_ldop for testing only.
/*
wire [3:0] dumy_cntr_add,dumy_cntr_q;

wire dummy_count_eq = (dumy_cntr_q[3:0] == 4'b1001);
assign dumy_cntr_add[3:0] = dumy_cntr_q[3:0] + 4'b0001;

dffre_s  #(4) dumy_cntr_ff (
        .din(dumy_cntr_add[3:0]) ,
        .q(dumy_cntr_q[3:0]),
        .en(spu_mactl_ldop & lsu_spu_ldst_ack),
        .rst(spu_mactl_ctl_rst_local | (dummy_count_eq&lsu_spu_ldst_ack)  | spu_mactl_iss_pulse), .clk (rclk), .se(se), .si(), .so());

*/

//assign spu_mactl_force_perr = spu_mactl_mactl_reg[13] | (dummy_count_eq & spu_mactl_ldop);
assign spu_mactl_force_perr = spu_mactl_mactl_reg[13] ;


// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------


wire ldxa_tid_decode0 = ~spu_mactl_ldxa_tid_w[1] & ~spu_mactl_ldxa_tid_w[0];
wire ldxa_tid_decode1 = ~spu_mactl_ldxa_tid_w[1] & spu_mactl_ldxa_tid_w[0];
wire ldxa_tid_decode2 = spu_mactl_ldxa_tid_w[1] & ~spu_mactl_ldxa_tid_w[0];
wire ldxa_tid_decode3 = spu_mactl_ldxa_tid_w[1] & spu_mactl_ldxa_tid_w[0];

/*
dff_s  #(4) ifu_spu_nceen_ff (
        .din(ifu_spu_nceen[3:0]) ,
        .q(ifu_spu_nceen_q[3:0]),
        .clk (rclk), .se(se), .si(), .so()); 
*/

wire spu_mactl_nceen_w = 
                                (ifu_spu_nceen[0] & ldxa_tid_decode0) |
                                (ifu_spu_nceen[1] & ldxa_tid_decode1) |
                                (ifu_spu_nceen[2] & ldxa_tid_decode2) |
                                (ifu_spu_nceen[3] & ldxa_tid_decode3) ;

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------


wire spu_ifu_corr_err_w =  spu_wen_ma_cor_err; // this is a pulse. 

dff_s  #(1) spu_ifu_corr_err_w2_ff (
        .din(spu_ifu_corr_err_w) ,
        .q(spu_ifu_corr_err_w2),
        .clk (rclk), .se(se), .si(), .so());

// ------------------------------------------------


wire spu_ifu_unc_err_w =  (spu_mactl_ttype_vld_dly | spu_mactl_ldxa_data_vld_qual_w) & 
						spu_wen_ma_unc_err;

assign spu_mactl_uncerr_rst = spu_ifu_unc_err_w;
// ------------------------------------------------

wire spu_lsu_unc_error_w = spu_mactl_ldxa_data_vld_qual_w &  spu_mactl_nceen_w & ~spu_mactl_int_set &
				(spu_mactl_perr_set_int | spu_wen_ma_unc_err) ;

// ------------------------------------------------

wire spu_ifu_mamem_err_w = (spu_mactl_ttype_vld_dly | spu_mactl_ldxa_data_vld_qual_w) & 
						spu_mactl_perr_set_int;

assign spu_mactl_perr_rst = spu_ifu_mamem_err_w;
// ------------------------------------------------

wire spu_ifu_int_set = spu_mactl_int_set;


dff_s  #(1) spu_ifu_int_w2_ff (
        .din(spu_ifu_int_set ) ,
        .q(spu_ifu_int_w2),
        .clk (rclk), .se(se), .si(), .so());

// ------------------------------------------------

wire spu_ifu_mamem_unc_w = spu_ifu_unc_err_w | spu_ifu_mamem_err_w;


dff_s  #(1) spu_ifu_mamem_unc_ff (
        .din(spu_ifu_mamem_unc_w ) ,
        .q(spu_ifu_mamem_unc_w2),
        .clk (rclk), .se(se), .si(), .so());


endmodule
