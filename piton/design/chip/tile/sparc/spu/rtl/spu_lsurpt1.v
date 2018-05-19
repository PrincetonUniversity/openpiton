// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: spu_lsurpt1.v
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


module spu_lsurpt1 (


/*outputs*/
so,

spu_lsu_ldxa_data_w2,
spu_lsu_ldxa_data_vld_w2,
spu_lsu_ldxa_tid_w2,

spu_lsu_ldst_pckt,


spu_lsurpt1_rs3_data_g2,


spu_lsu_ldxa_illgl_va_w2,

spu_lsurpt1_stb_empty,

spu_lsurpt_cpx_data_out,

spu_ifu_ttype_tid_w2,

spu_lsu_unc_error_w2,

spu_ifu_err_addr_w2,

spu_lsu_stxa_ack_tid,

/*inputs*/

spu_ctl_ldxa_illgl_va_w,

spu_madp_ldxa_data,

spu_ldstreq_pcx,

spu_ctl_ldxa_data_vld_w2,
spu_ctl_ldxa_tid_w2,


exu_lsu_rs3_data_e,

lsu_spu_stb_empty,

spu_lsurpt_cpx_data_in,

spu_wen_pcx_wen,
spu_wen_pcx_7170_sel,

spu_ifu_ttype_tid_w,

spu_lsu_unc_error_w,

spu_lsu_stxa_ack_tid_ctl,



si,se,
//tmb_l,

reset_l,
rclk);

// ---------------------------------------------------------------------
input rclk;
input reset_l;
input se;
input si;
//input tmb_l;

input [63:0] spu_madp_ldxa_data;

input [122:0] spu_ldstreq_pcx;

input spu_ctl_ldxa_data_vld_w2;
input [1:0] spu_ctl_ldxa_tid_w2;


input [63:0] exu_lsu_rs3_data_e;

input spu_ctl_ldxa_illgl_va_w;

input [3:0] lsu_spu_stb_empty;

input [134:0] spu_lsurpt_cpx_data_in;

input spu_wen_pcx_wen;
input spu_wen_pcx_7170_sel;

input [1:0] spu_ifu_ttype_tid_w;

input spu_lsu_unc_error_w;

input [1:0] spu_lsu_stxa_ack_tid_ctl;
// ---------------------------------------------------------------------
output [122:0] spu_lsu_ldst_pckt;

output [63:0] spu_lsu_ldxa_data_w2;
output spu_lsu_ldxa_data_vld_w2;
output [1:0] spu_lsu_ldxa_tid_w2;


output [63:0] spu_lsurpt1_rs3_data_g2;


output  spu_lsu_ldxa_illgl_va_w2;

output [3:0] spu_lsurpt1_stb_empty;

output [134:0] spu_lsurpt_cpx_data_out;

output [1:0] spu_ifu_ttype_tid_w2;

output spu_lsu_unc_error_w2;

output [39:4] spu_ifu_err_addr_w2;

output [1:0] spu_lsu_stxa_ack_tid;


output so;
// ---------------------------------------------------------------------


dffe_s #(121) pcx_ff (
        .din({spu_ldstreq_pcx[122:72],spu_ldstreq_pcx[69:0]}) ,
        .q({spu_lsu_ldst_pckt[122:72],spu_lsu_ldst_pckt[69:0]}),
        .en(spu_wen_pcx_wen), .clk (rclk), .se(1'b0),.si (),.so ()
        );


// bank select needs to be fast.
//assign spu_lsu_ldst_pckt[71:70] = spu_ldstreq_pcx[71:70];

wire [71:70] spu_ldstreq_pcx_q;
dffe_s #(2) pcx_7170_ff (
        .din(spu_ldstreq_pcx[71:70]) ,
        .q(spu_ldstreq_pcx_q[71:70]),
        .en(spu_wen_pcx_wen), .clk (rclk), .se(1'b0),.si (),.so ()
        );

dp_mux2es #(2) pcx_7170_mx (
        .in0    (spu_ldstreq_pcx_q[71:70]),
        .in1    (spu_ldstreq_pcx[71:70]),
        .sel    (spu_wen_pcx_7170_sel),
        .dout   (spu_lsu_ldst_pckt[71:70]));


assign spu_ifu_err_addr_w2[39:8] = spu_ldstreq_pcx[103:72]; // buf_10x
assign spu_ifu_err_addr_w2[7:6] = spu_ldstreq_pcx[71:70]; // very critical to not overload double 
							  // buffer(buf_2x+buf10x)
assign spu_ifu_err_addr_w2[5:4] = spu_ldstreq_pcx[69:68]; // buf_10x

// ---------------------------------------------------------------------


dff_s #(64) ldxa_data_ff (
        .din(spu_madp_ldxa_data[63:0]) ,
        .q(spu_lsu_ldxa_data_w2[63:0]),
        .clk (rclk), .se(1'b0),.si (),.so ()
        );

dff_s #(2) ldxa_tid_ff (
        .din(spu_ctl_ldxa_tid_w2[1:0]) ,
        .q(spu_lsu_ldxa_tid_w2[1:0]),
        .clk (rclk), .se(1'b0),.si (),.so ()
        );


wire reset = ~reset_l;

dffr_s #(1) ldxa_vld_ff (
        .din(spu_ctl_ldxa_data_vld_w2) ,
        .q(spu_lsu_ldxa_data_vld_w2),
	.rst(reset),
        .clk (rclk), .se(1'b0),.si (),.so ()
	);

dffr_s #(1) illgl_va_ff (
        .din(spu_ctl_ldxa_illgl_va_w) ,
        .q(spu_lsu_ldxa_illgl_va_w2),
	.rst(reset),
        .clk (rclk), .se(1'b0),.si (),.so ()
	);

//---------------------------------------------

wire [63:0] spu_lsurpt1_rs3_data_m, spu_lsurpt1_rs3_data_g;

dff_s #(64) exu_rs3_data_e_ff (
        .din(exu_lsu_rs3_data_e[63:0]) ,
        .q(spu_lsurpt1_rs3_data_m[63:0]),
        .clk (rclk), .se(1'b0),.si (),.so ()
        );

dff_s #(64) spu_rs3_data_m_ff (
        .din(spu_lsurpt1_rs3_data_m[63:0]) ,
        .q(spu_lsurpt1_rs3_data_g[63:0]),
        .clk (rclk), .se(1'b0),.si (),.so ()
        );

dff_s #(64) spu_rs3_data_g_ff (
        .din(spu_lsurpt1_rs3_data_g[63:0]) ,
        .q(spu_lsurpt1_rs3_data_g2[63:0]),
        .clk (rclk), .se(1'b0),.si (),.so ()
        );


//---------------------------------------------
//---------------------------------------------

// port postion should be: input on the BOTTOM and output on TOP.

dff_s #(4) lsu_spu_stb_empty_ff (
        .din(lsu_spu_stb_empty[3:0]) ,
        .q(spu_lsurpt1_stb_empty[3:0]),
        .clk (rclk), .se(1'b0), .si(), .so());


//---------------------------------------------
//---------------------------------------------

// port postion should be: input on the BOTTOM and output on TOP.

assign spu_lsurpt_cpx_data_out[134:0] = spu_lsurpt_cpx_data_in[134:0];


//---------------------------------------------
//---------------------------------------------

// place all the following flops on the right hand side. inputs located on the top
// and outputs located on the bottom.


dff_s  #(2) spu_ifu_ttype_tid_w2_ff (
        .din(spu_ifu_ttype_tid_w[1:0]) ,
        .q(spu_ifu_ttype_tid_w2[1:0]),
        .clk (rclk), .se(se), .si(), .so());


dff_s  #(1) spu_lsu_unc_error_w2_ff (
        .din(spu_lsu_unc_error_w) ,
        .q(spu_lsu_unc_error_w2),
        .clk (rclk), .se(se), .si(), .so());

dff_s  #(2) spu_lsu_stxa_ack_tid_ff (
        .din(spu_lsu_stxa_ack_tid_ctl[1:0]) ,
        .q(spu_lsu_stxa_ack_tid[1:0]),
        .clk (rclk), .se(se), .si(), .so());

endmodule
