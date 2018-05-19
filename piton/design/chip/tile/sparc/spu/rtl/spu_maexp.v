// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: spu_maexp.v
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

module spu_maexp (

/*outputs*/
spu_maexp_e_rd_oprnd_sel,
spu_maexp_shift_e,
spu_maexp_e_data_wen,
spu_maexp_incr_es_ptr,

spu_maexp_es_max_init,
spu_maexp_es_e_ptr_rst,

spu_maexp_done_set,
spu_maexp_memren,

spu_maexp_start_mulred_aequb,
spu_maexp_start_mulred_anoteqb,

spu_mactl_stxa_force_abort,

/*inputs*/
spu_maaddr_esmax,
spu_maaddr_esmod64,
spu_madp_e_eq_one,
spu_mared_red_done,

spu_mactl_iss_pulse_dly,
spu_mactl_expop,

spu_mactl_kill_op,

se,
reset,
rclk);

input reset;
input rclk;
input se;

input spu_maaddr_esmax;
input spu_maaddr_esmod64;
input spu_madp_e_eq_one;
input spu_mared_red_done;

input spu_mactl_iss_pulse_dly;
input spu_mactl_expop;
input spu_mactl_kill_op;
input spu_mactl_stxa_force_abort;
// --------------------------------------------------------------------------------

output spu_maexp_e_rd_oprnd_sel;
output spu_maexp_shift_e;
output spu_maexp_e_data_wen;
output spu_maexp_incr_es_ptr;
output spu_maexp_es_max_init;
output spu_maexp_es_e_ptr_rst;

output spu_maexp_done_set;
output spu_maexp_memren;

output spu_maexp_start_mulred_aequb;
output spu_maexp_start_mulred_anoteqb;

// --------------------------------------------------------------------------------
// --------------------------------------------------------------------------------

wire spu_maexp_exp_done,tr2idle_frm_esmax,tr2rde_frm_idle,tr2rde_frm_esmax,
     tr2gotomulred1_frm_rde,tr2gotomulred1_frm_esmax,tr2echk_frm_gotomulred1,
     tr2gotomulred2_frm_echk,tr2esmax_frm_gotomulred2,tr2esmax_frm_echk;
// --------------------------------------------------------------------------------
// --------------------------------------------------------------------------------
wire cur_rde_state;
wire local_stxa_abort;
// --------------------------------------------------------------------------------
// --------------------------------------------------------------------------------
// -------------------------------------------------------------------------
// we need a state set to indcate exp is done, and when an
// masync gets issued later, then the load asi is returned.
wire spu_maexp_done_wen = (spu_maexp_exp_done | spu_mactl_kill_op |
					local_stxa_abort) & spu_mactl_expop ;
wire spu_maexp_done_rst = reset | spu_mactl_iss_pulse_dly;

dffre_s    #(1) spu_maexp_done_ff (
        .din(1'b1) , 
        .q(spu_maexp_done_set),
        .en(spu_maexp_done_wen),
        .rst(spu_maexp_done_rst), .clk (rclk), .se(se), .si(), .so()); 

// --------------------------------------------------------------------------------


// this was causing rd and wr contention in idct when running random diags. cur_rde_state
//cause perr which caused expop to go to idle, but maaeqb state machine was in progress
//and then a ldop was started which caused a rd of mem for ldop and a write during
//maaeqb op in progress.

//assign local_stxa_abort = (cur_rde_state | spu_mared_red_done)  & spu_mactl_stxa_force_abort;
assign local_stxa_abort =  spu_mared_red_done & spu_mactl_stxa_force_abort;

wire state_reset = reset | spu_maexp_exp_done | spu_mactl_kill_op |
					local_stxa_abort;

// -------------------------------------------------------------------------------
// -------------------------------------------------------------------------------

wire expop_start = spu_mactl_iss_pulse_dly & spu_mactl_expop;

// -------------------------------------------------------------------------------
// -------------------------------------------------------------------------------
// -------------------------------------------------------------------------------
// -------------------------------------------------------------------------------
dff_s    #(1) idle_state_ff (
        .din(nxt_idle_state) , 
        .q(cur_idle_state),
        .clk (rclk), .se(se), .si(), .so()); 

dffr_s  #(1) rde_state_ff (
        .din(nxt_rde_state) ,
        .q(cur_rde_state),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so());

dffr_s  #(1) gotomulred1_state_ff (
        .din(nxt_gotomulred1_state) , 
        .q(cur_gotomulred1_state),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so()); 

dffr_s  #(1) echk_state_ff (
        .din(nxt_echk_state) ,
        .q(cur_echk_state),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so());

dffr_s  #(1) gotomulred2_state_ff (
        .din(nxt_gotomulred2_state) ,
        .q(cur_gotomulred2_state),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so());

dffr_s  #(1) esmax_state_ff (
        .din(nxt_esmax_state) ,
        .q(cur_esmax_state),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so());

// -------------------------------------------------------------------------------
// -------------------------------------------------------------------------------
// -------------------------------------------------------------------------------
// -------------------------------------------------------------------------------
// -------------------------------------------------------------------------------
// transition to idle state

assign tr2idle_frm_esmax = spu_maaddr_esmax & cur_esmax_state;

assign spu_maexp_exp_done = tr2idle_frm_esmax;

assign  nxt_idle_state = (
                         state_reset | 
                         tr2idle_frm_esmax |
                         (cur_idle_state & ~expop_start));

// -------------------------------------------------------------------------------
// transition to rde state

assign tr2rde_frm_idle = cur_idle_state & expop_start;

/*
wire dly_tr2rde_frm_idle;
dff_s #(1) dly_tr2rde_frm_idle_ff (
        .din(tr2rde_frm_idle) ,
        .q(dly_tr2rde_frm_idle),
        .clk (rclk), 
        .clk (rclk)
        , .se(se), .si(), .so());
*/


assign tr2rde_frm_esmax = cur_esmax_state & ~spu_maaddr_esmax & spu_maaddr_esmod64;

assign nxt_rde_state = (
                          tr2rde_frm_idle |
                          tr2rde_frm_esmax );

// -------------------------------------------------------------------------------
// transition to gotomulred1 state

assign tr2gotomulred1_frm_rde = cur_rde_state; 
assign tr2gotomulred1_frm_esmax = cur_esmax_state & ~spu_maaddr_esmax & 
						~spu_maaddr_esmod64; 

assign nxt_gotomulred1_state = (
                          tr2gotomulred1_frm_rde |
                          tr2gotomulred1_frm_esmax |
			  (cur_gotomulred1_state & ~spu_mared_red_done) );

// -------------------------------------------------------------------------------
// transition to echk state

assign tr2echk_frm_gotomulred1 = cur_gotomulred1_state & spu_mared_red_done; 

assign nxt_echk_state = (
			  tr2echk_frm_gotomulred1);

// -------------------------------------------------------------------------------
// transition to gotomulred2 state

assign tr2gotomulred2_frm_echk = cur_echk_state & spu_madp_e_eq_one; 

assign nxt_gotomulred2_state = (
			  tr2gotomulred2_frm_echk |
			  (cur_gotomulred2_state & ~spu_mared_red_done) );

// -------------------------------------------------------------------------------
// transition to esmax state


assign tr2esmax_frm_gotomulred2 = cur_gotomulred2_state & spu_mared_red_done; 
assign tr2esmax_frm_echk = cur_echk_state & ~spu_madp_e_eq_one; 

assign nxt_esmax_state = (
			  tr2esmax_frm_gotomulred2 |
			  tr2esmax_frm_echk);

// -------------------------------------------------------------------------------
// -------------------------------------------------------------------------------
// -------------------------------------------------------------------------------
// -------------------------------------------------------------------------------
// SEL XXNM OR XANM

/*
wire spu_maexp_xxnm_sel_set = tr2rde_frm_idle | tr2esmax_frm_echk | 
					tr2esmax_frm_gotomulred2;

wire spu_maexp_xxnm_sel_rst = state_reset | tr2echk_frm_gotomulred1; 

dffre_s #(1) xxnm_set_ff (
        .din(1'b1) , 
        .q(spu_maexp_xxnm_sel_q),
        .en(spu_maexp_xxnm_sel_set), 
        .rst(spu_maexp_xxnm_sel_rst), .clk (rclk), 
        .rst(spu_maexp_xxnm_sel_rst), .clk (rclk)
        , .se(se), .si(), .so()); 

assign spu_maexp_b_to_x_sel = spu_maexp_xxnm_sel_q;
assign spu_maexp_b_to_a_sel = ~spu_maexp_xxnm_sel_q;
*/

// -------------------------------------------------------------------------------

assign spu_maexp_e_rd_oprnd_sel = tr2rde_frm_idle | tr2rde_frm_esmax;
assign spu_maexp_memren = spu_maexp_e_rd_oprnd_sel;

assign spu_maexp_shift_e = nxt_esmax_state; // muxsel in madp
// write enable when data is from mamem or a shift write
assign spu_maexp_e_data_wen = cur_rde_state | nxt_esmax_state;

//assign spu_maexp_incr_es_ptr = tr2echk_frm_gotomulred1;
assign spu_maexp_incr_es_ptr = tr2rde_frm_esmax | tr2gotomulred1_frm_esmax;

assign spu_maexp_es_max_init = tr2rde_frm_idle;

assign spu_maexp_es_e_ptr_rst = state_reset;
// -------------------------------------------------------------------------------


//assign spu_maexp_start_mulred = tr2gotomulred1_frm_rde | tr2gotomulred1_frm_esmax |
//			  		tr2gotomulred2_frm_echk ;


assign spu_maexp_start_mulred_aequb = tr2gotomulred1_frm_rde | tr2gotomulred1_frm_esmax;
assign spu_maexp_start_mulred_anoteqb = tr2gotomulred2_frm_echk;




// -------------------------------------------------------------------------------

endmodule
