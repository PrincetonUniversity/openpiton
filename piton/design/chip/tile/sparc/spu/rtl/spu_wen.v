// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: spu_wen.v
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
//      Description:    this block generates the write enables for 
//			various registers in spu.   
//			Storage for valid bits also are here.
*/
////////////////////////////////////////////////////////////////////////

module spu_wen (

/*outputs*/

spu_wen_maln_wen,
spu_wen_vld_maln,

spu_wen_mast_ack,

spu_wen_mald_ack,

spu_wen_ldst_pcx_vld,

spu_wen_allma_stacks_ok,

spu_wen_ma_unc_err_pulse,
spu_wen_ma_unc_err,
spu_wen_ma_cor_err,

spu_wen_pckt_req,

/*inputs*/

spu_mald_ldreq,
spu_mactl_streq,


lsu_spu_vload_rtntyp,
lsu_spu_vload_vld,

lsu_spu_st_ack_tid,
lsu_spu_st_asop,
lsu_spu_st_ackvld,
lsu_spu_ld_ack_tid,
lsu_spu_ld_asop,
lsu_spu_ld_ackvld,

spu_mald_done,
spu_mald_rstln,



lsu_spu_strm_ack_cmplt,

l2_err,


spu_mactl_uncerr_rst,

cpuid,

se,
reset,
rclk);

input reset;
input rclk;
input se;

input [1:0] l2_err;

input spu_mald_ldreq;
input spu_mactl_streq;

input [3:0]	lsu_spu_vload_rtntyp;
input 		lsu_spu_vload_vld;

input [1:0] 	lsu_spu_st_ack_tid;
input 		lsu_spu_st_asop;
input 		lsu_spu_st_ackvld;

input [1:0] 	lsu_spu_ld_ack_tid;
input 		lsu_spu_ld_asop;
input 		lsu_spu_ld_ackvld;

input spu_mald_done;
input spu_mald_rstln;



input [1:0] lsu_spu_strm_ack_cmplt;


input [2:0] cpuid;

input spu_mactl_uncerr_rst;

// -----------------------------------------------------

output spu_wen_mast_ack;

output spu_wen_maln_wen;
output spu_wen_mald_ack;
output spu_wen_vld_maln;

output spu_wen_ldst_pcx_vld;

output spu_wen_allma_stacks_ok;

output spu_wen_ma_unc_err_pulse;
output spu_wen_ma_unc_err;
output spu_wen_ma_cor_err;

output [122:104] spu_wen_pckt_req;

// -----------------------------------------------------
// -----------------------------------------------------
// -----------------------------------------------------
wire spu_wen_maln_wen_local;
// -----------------------------------------------------
// -----------------------------------------------------
// -----------------------------------------------------
// -----------------------------------------------------
// -----------------------------------------------------
// -----------------------------------------------------

wire [1:0] l2_err_q;
wire spu_wen_maln_wen_local_q;

dff_s  #(3) l2_err_ff (
        .din({l2_err[1:0], spu_wen_maln_wen_local}) , 
        .q({l2_err_q[1:0], spu_wen_maln_wen_local_q}),
        .clk (rclk), .se(se), .si(), .so()); 

wire spu_wen_ma_unc_err_decode = l2_err_q[1] & spu_wen_maln_wen_local_q;

assign spu_wen_ma_unc_err_pulse = spu_wen_ma_unc_err_decode;

wire spu_wen_ma_cor_err = ~l2_err_q[1] & l2_err_q[0] & spu_wen_maln_wen_local_q;

dffre_s  #(1) ma_unc_err_ff (
        .din(1'b1) ,
        .q(spu_wen_ma_unc_err),
        .en(spu_wen_ma_unc_err_decode),
        .rst(reset | spu_mactl_uncerr_rst), .clk (rclk), .se(se), .si(), .so());

 
// -----------------------------------------------------

assign spu_wen_ldst_pcx_vld = spu_mald_ldreq | spu_mactl_streq;

wire spu_lsu_load_req = spu_mald_ldreq;
wire spu_lsu_store_req = spu_mactl_streq;
// -----------------------------------------------------


wire [1:0] lsu_spu_st_ack_tid_q;
dff_s #(2) lsu_spu_st_ack_tid_ff (
        .din(lsu_spu_st_ack_tid[1:0]) , 
        .q(lsu_spu_st_ack_tid_q[1:0]),
        .clk (rclk), .se(se), .si(), .so()); 

wire lsu_spu_st_asop_q;
dff_s #(1) lsu_spu_st_asop_ff (
        .din(lsu_spu_st_asop) , 
        .q(lsu_spu_st_asop_q),
        .clk (rclk), .se(se), .si(), .so()); 


wire [1:0] lsu_spu_ld_ack_tid_q;
dff_s #(2) lsu_spu_ld_ack_tid_ff (
        .din(lsu_spu_ld_ack_tid[1:0]) , 
        .q(lsu_spu_ld_ack_tid_q[1:0]),
        .clk (rclk), .se(se), .si(), .so()); 

wire lsu_spu_ld_asop_q;
dff_s #(1) lsu_spu_ld_asop_ff (
        .din(lsu_spu_ld_asop) ,
        .q(lsu_spu_ld_asop_q),
        .clk (rclk), .se(se), .si(), .so());




// -----------------------------------------------------
// -----------------------------------------------------
// -----------------------------------------------------

//wire spu_wen_tid_bit0 = spu_rrstr_streq_mx2sel[0] | spu_rrld_ldreq_mx2sel; 
//wire spu_wen_tid_bit0 = 1'b0; 

wire spu_wen_ma_st_req_q;
dff_s #(1) spu_wen_ma_st_req_ff (
        .din(spu_lsu_store_req) ,
        .q(spu_wen_ma_st_req_q),
        .clk (rclk), .se(se), .si(), .so());

// -----------------------------------------------------
// -----------------------------------------------------
// -----------------------------------------------------
// ^^^^^^^^^^ LOAD RETURN FROM L2 ^^^^^^^^^^^^^^
// -----------------------------------------------------

wire load_rtntyp = (lsu_spu_vload_rtntyp[3:0] == 4'b0010);


/*
wire spu_wen_maln_wen =   lsu_spu_vload_vld & ~lsu_spu_vload_bid & 
			   lsu_spu_vload_asop & load_rtntyp & 
			   (2'b00 == lsu_spu_vload_data_tid[1:0]);
*/

// wire spu_wen_maln_wen_prequal =   lsu_spu_vload_vld & ~lsu_spu_vload_data_tid[0];

wire spu_wen_maln_wen =  lsu_spu_vload_vld & load_rtntyp ; 

assign spu_wen_maln_wen_local = spu_wen_maln_wen;


// ------------------------------------------------------------
// load/store acks from lsu captured in spu.
// ------------------------------------------------------------


wire spu_wen_mast_ack_prequal = (lsu_spu_st_ack_tid_q[1:0] == 2'b00) & lsu_spu_st_asop_q &
				spu_lsu_store_req;

wire spu_wen_mast_ack = lsu_spu_st_ackvld & spu_wen_mast_ack_prequal;


wire spu_wen_mald_ack_prequal = (lsu_spu_ld_ack_tid_q[1:0] == 2'b00) & lsu_spu_ld_asop_q &
				spu_lsu_load_req & ~spu_lsu_store_req;

wire spu_wen_mald_ack = lsu_spu_ld_ackvld & spu_wen_mald_ack_prequal;


// =================================================================
// ----------------------------------------------------------------- 
// ----------------------------------------------------------------- 
// ***************** MA STUFF **************************************

wire spu_wen_ma_reset = reset;

// ----------------------------------------------------------------- 

wire reset_vld_maln = spu_wen_ma_reset | spu_mald_rstln | spu_mald_done ;

// ----------------------------------------------------------------- 

dffre_s  #(1) maln_vld_bit_ff (
        .din(1'b1) , 
        .q(spu_wen_vld_maln),
        .en(spu_wen_maln_wen_local), 
        .rst(reset_vld_maln), .clk (rclk), .se(se), .si(), .so()); 

// =================================================================
// ----------------------------------------------------------------- 

// -----------------------------------------------------------------
// -----------------------------------------------------------------
// -----------------------------------------------------------------
// -----------------------------------------------------------------
// -----------------------------------------------------------------
// ^^^^^^^^^^ STORE RETURN FROM L2 ^^^^^^^^^^^^^^
// -----------------------------------------------------------------
// -----------------------------------------------------------------

wire [1:0] lsu_spu_strm_ack_cmplt_q;

dff_s  #(2) lsu_spu_strm_ff (
        .din(lsu_spu_strm_ack_cmplt[1:0]) ,
        .q(lsu_spu_strm_ack_cmplt_q[1:0]),
        .clk (rclk), .se(se), .si(), .so());

wire lsu_spu_st_ackvld_q;
dff_s  #(1) lsu_spu_st_ackvld_ff (
        .din(lsu_spu_st_ackvld) ,
        .q(lsu_spu_st_ackvld_q),
        .clk (rclk), .se(se), .si(), .so());

wire spu_wen_ma_st_req_qq;
dff_s  #(1) spu_wen_ma_st_req_q_ff (
        .din(spu_wen_ma_st_req_q) ,
        .q(spu_wen_ma_st_req_qq),
        .clk (rclk), .se(se), .si(), .so());


wire ma_stack_decr_sel = lsu_spu_strm_ack_cmplt_q[0] | lsu_spu_strm_ack_cmplt_q[1];


wire ma_stack_incr_sel = spu_wen_ma_st_req_qq & lsu_spu_st_ackvld_q;


wire ma_stack_cntr_wen  = ma_stack_incr_sel | ma_stack_decr_sel ;


// -----------------------------------------------------------------
// -----------------------------------------------------------------
// ^^^^^^^^^^ STORE ACK COUNTERS ^^^^^^^^^^^^
// -----------------------------------------------------------------
// -----------------------------------------------------------------
wire [5:0] ma_stack_cntr_q, ma_stack_incrdecr_val;


// -----------------------------------------------------------------
// -----------------------------------------------------------------
// ^^^^^^ MA ST_ACK ^^^^^^^^
// -----------------------------------------------------------------
/*
assign ma_stack_incr_val[5:0] = ma_stack_cntr_q[5:0] + 6'b000001;
assign ma_stack_decr_val[5:0] = ma_stack_cntr_q[5:0] - 6'b000001;

assign ma_stack_incrdecr_val[5:0] = ma_stack_incr_sel ?    ma_stack_incr_val[5:0] :
								ma_stack_decr_val[5:0];
*/

assign ma_stack_incrdecr_val[5:0] =  ma_stack_cntr_q[5:0] + {5'b00000,ma_stack_incr_sel} -
					{4'b0000,lsu_spu_strm_ack_cmplt_q[1:0]};

dffre_s  #(6) ma_stack_cntr_ff (
        .din(ma_stack_incrdecr_val[5:0]) ,
        .q(ma_stack_cntr_q[5:0]),
        .en(ma_stack_cntr_wen),
        .rst(reset), .clk (rclk), .se(se), .si(), .so());


assign spu_wen_allma_stacks_ok = ~(|ma_stack_cntr_q[5:0]) ;


// -----------------------------------------------------------------
// -----------------------------------------------------------------

dp_mux2es #(19) ldstreq_misc_mx (
        .in0    ({6'b001001,cpuid[2:0],1'b0,1'b0,8'b00000100}),
        .in1    ({6'b001011,cpuid[2:0],1'b0,1'b0,8'b00010000}),
        .sel    (spu_lsu_store_req),
        .dout   (spu_wen_pckt_req[122:104]));


endmodule

