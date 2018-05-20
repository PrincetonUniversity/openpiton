// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: spu_madp.v
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
//      Description:    MA datapath .
*/
////////////////////////////////////////////////////////////////////////

//PITON_PROTO enables all FPGA related modifications
`ifdef PITON_PROTO 
`define FPGA_SYN_CLK_EN
`define FPGA_SYN_CLK_DFF
`endif

module spu_madp (

/*outputs*/
spu_madp_evedata,
spu_madp_odddata,

spu_mul_op2_data,

spu_madp_m_lt_n,
spu_madp_m_eq_n,

spu_madp_store_data,

spu_madp_cout_oprnd_sub_mod,

spu_madp_e_eq_one,

spu_madp_mpa_addr_out,

spu_madp_perr,

so,

spu_mul_op1_data,

spu_madp_maaddr_reg,

spu_madp_ldxa_data,

/*inputs*/

spu_mamul_oprnd2_wen,
spu_mamul_oprnd2_bypass,

mul_data_out,

spu_mared_data_sel_l,
spu_mared_rdn_wen,
spu_mared_cin_oprnd_sub_mod,

spu_maexp_e_data_wen,
spu_maexp_shift_e,

spu_maaddr_mpa_incr_val,
spu_maaddr_mpa_wen,
spu_maaddr_mpa_addrinc,
spu_mactl_mpa_sel,

spu_mactl_ldop,
spu_mactl_madp_parflop_wen,

spu_mactl_memmxsel_l,

spu_mactl_force_perr,

spu_mamem_rd_eve_data,
spu_mamem_rd_odd_data,

spu_mamul_oprnd1_mxsel_l,
spu_maaddr_mamem_eveodd_sel_l,
spu_mamul_oprnd1_wen,

exu_spu_st_rs3_data_g2,

lsu_spu_vload_data,
spu_mactl_mactl_reg,
spu_wen_maln_wen,
spu_mactl_mpa_wen,
spu_mactl_maaddr_wen,
spu_mactl_manp_wen,

spu_mactl_ldxa_data_w_sel_l,
spu_mactl_ldxa_data_w_select,

se,
si,
sehold,

rclk);

// ---------------------------------------------------------

input rclk;


input spu_mamul_oprnd2_wen;
input spu_mamul_oprnd2_bypass;

input [63:0] mul_data_out;

input [3:0] spu_mared_data_sel_l;
input spu_mared_rdn_wen;
input spu_mared_cin_oprnd_sub_mod;

input spu_maexp_e_data_wen;
input spu_maexp_shift_e;

input [4:0] spu_maaddr_mpa_incr_val;
input spu_maaddr_mpa_wen;
input spu_maaddr_mpa_addrinc;
input spu_mactl_mpa_sel;

input spu_mactl_ldop;
input spu_mactl_madp_parflop_wen;

input [2:0] spu_mactl_memmxsel_l;


input spu_mactl_force_perr;
input spu_wen_maln_wen;
input spu_mactl_mpa_wen;
input spu_mactl_maaddr_wen;
input spu_mactl_manp_wen;

input [3:0] spu_mactl_ldxa_data_w_sel_l;
input spu_mactl_ldxa_data_w_select;

input se;
input si;
input sehold;

input [65:0] spu_mamem_rd_eve_data;
input [65:0] spu_mamem_rd_odd_data;

input [2:0] spu_mamul_oprnd1_mxsel_l;
input [3:0] spu_maaddr_mamem_eveodd_sel_l;
input spu_mamul_oprnd1_wen;


input [63:0] exu_spu_st_rs3_data_g2;

input [13:0] spu_mactl_mactl_reg;
input [127:0] lsu_spu_vload_data;
// ---------------------------------------------------------

output [65:0] spu_madp_evedata;
output [65:0] spu_madp_odddata;

output [63:0] spu_mul_op2_data;

output spu_madp_m_lt_n;
output spu_madp_m_eq_n;

output spu_madp_cout_oprnd_sub_mod;

output [63:0] spu_madp_store_data;


output spu_madp_e_eq_one;

output [38:3] spu_madp_mpa_addr_out;

output spu_madp_perr;

output so;

output [63:0] spu_mul_op1_data;

output [47:0] spu_madp_maaddr_reg;

output [63:0] spu_madp_ldxa_data;

// ---------------------------------------------------------
// ---------------------------------------------------------

wire [47:0] spu_madp_maaddr_reg_int;
wire [39:0] spu_madp_mpa_addr;

wire [63:0] spu_madp_oprnd2_data;
wire [64:0] oprand_minus_modulus_or_mpa;
wire [63:0] spu_madp_modulus;
//wire [63:0] spu_madp_modulus_b;
wire [63:0] spu_madp_mpa_or_m,spu_madp_mpa_or_n_b;
wire [39:0] spu_madp_mpa_mx;
wire carry_out;
wire [63:0] mulorred_data;
wire [63:0] spu_madp_exp_e_data,spu_madp_exp_e_data_q;
wire [63:0] mulorred_data_q;
wire [63:0] mul_ldlower_data_mx;
wire [1:0] mul_ldlower_data_par;
wire [1:0] mem_ldupper_data_par;
wire [1:0] mul_ldlower_data_par_pre;
wire [1:0] mem_ldupper_data_par_pre;
wire [63:0] mem_ldupper_data_mx;
wire [65:0] spu_madp_odddata_mx;
wire [63:0] spu_madp_mem_rd_data;
wire [65:0] spu_madp_evedata_mx;


wire [65:0] spu_mamem_rd_data_unbuf;
wire [63:0] spu_mamem_rd_data;

wire [1:0] spu_madp_rdmem_pargen;

wire [38:3] spu_madp_mpa_reg;
wire [63:0] spu_madp_manp_reg;
wire [63:0] spu_madp_lnupper_data;
wire [63:0] spu_madp_lnlower_data;

// ---------------------------------------------------------
// ---------------------------------------------------------
// ---------------------------------------------------------

wire testmode_l = ~se;

// ---------------------------------------------------------
// ---------------------------------------------------------
// ---------------------------------------------------------
// ---------------------------------------------------------
// Arrange the parity bits accordingly 
wire [63:0] read_data_q;
wire [1:0] spu_madp_par_data;


dp_mux4ds #(66) mamem_rd_data_mx (
        .in0    (spu_mamem_rd_eve_data[65:0]),
        .in1    (spu_mamem_rd_odd_data[65:0]),
        .in2    ({2'b11,64'h0000000000000000}),
        .in3    ({spu_madp_par_data[1:0],read_data_q[63:0]}),// added for dft to test downstream logic.
        .sel0_l (spu_maaddr_mamem_eveodd_sel_l[0]),
        .sel1_l (spu_maaddr_mamem_eveodd_sel_l[1]),
        .sel2_l (spu_maaddr_mamem_eveodd_sel_l[2]),
        .sel3_l (spu_maaddr_mamem_eveodd_sel_l[3]),
        .dout   (spu_mamem_rd_data_unbuf[65:0]));

assign spu_mamem_rd_data[63:0] = spu_mamem_rd_data_unbuf[63:0];// used internal decouple from critical path
                                                                // make sure its buffered buf_x10 not critical


wire mem_rddata_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf mem_rddata_lcd (.clk(mem_rddata_clk), .rclk(rclk), 
                         .enb_l(~spu_mamul_oprnd1_wen), .tmb_l(testmode_l));
`endif

`ifdef FPGA_SYN_CLK_DFF
dffe_s #(64) mem_rddata_ff (
        .din(spu_mamem_rd_data_unbuf[63:0]) ,
        .q(read_data_q[63:0]),
        .en (~(~spu_mamul_oprnd1_wen)), .clk(rclk), .se(1'b0),.si (),.so ()
        );
`else
dff_s #(64) mem_rddata_ff (
        .din(spu_mamem_rd_data_unbuf[63:0]) ,
        .q(read_data_q[63:0]),
        .clk (mem_rddata_clk), .se(1'b0),.si (),.so ()
        );
`endif

wire [63:0] spu_mul_op1_data_unbuf;
dp_mux3ds #(64) oprnd1_mx (
        .in0    (read_data_q[63:0]),
        .in1    (spu_mamem_rd_data_unbuf[63:0]),
        .in2    (spu_madp_manp_reg[63:0]),
        .sel0_l (spu_mamul_oprnd1_mxsel_l[0]),
        .sel1_l (spu_mamul_oprnd1_mxsel_l[1]),
        .sel2_l (spu_mamul_oprnd1_mxsel_l[2]),
        .dout   (spu_mul_op1_data_unbuf[63:0]));

assign spu_mul_op1_data[63:0] = spu_mul_op1_data_unbuf[63:0]; // this is critical going to mul unit.

// --------- parity logic
wire [1:0] spu_madp_mamem_rddata_par;
assign spu_madp_mamem_rddata_par[1:0] = spu_mamem_rd_data_unbuf[65:64]; // its going out buffer.

// place the following flop on the left handside.
dff_s    #(2) par_ff (
        .din(spu_madp_mamem_rddata_par[1:0]) ,
        .q(spu_madp_par_data[1:0]),
        .clk (rclk), .se(se), .si(), .so());

// upper=parity for [63:32], lower= parity for [31:0]
wire spu_madp_upper_perr = spu_madp_par_data[1] ^ ~spu_madp_rdmem_pargen[1];
wire spu_madp_lower_perr = spu_madp_par_data[0] ^ ~spu_madp_rdmem_pargen[0];

assign spu_madp_perr = spu_madp_upper_perr | spu_madp_lower_perr;

// ############################################################
// ---------------------------------------------------------
// ---------------------------------------------------------
// ---------------------------------------------------------

wire spu_mactl_ldop_q;
dff_s  #(1) ldop_ff (
        .din(spu_mactl_ldop) ,
        .q(spu_mactl_ldop_q),
        .clk (rclk), .se(se),.si (),.so ()
        );

wire spu_madp_ldop_q_buf1 = spu_mactl_ldop_q;
wire spu_madp_ldop_q_buf2 = spu_mactl_ldop_q;

// ############################################################

// ############################################################

// ############################################################
// ---------------------------------------------------------
// ------------ OPERAND1 and OPERAND2 to mul unit ----------
// ---------------------------------------------------------
// ---------------------------------------------------------
// operand2 = A,M,ACCUM
// operand1 = B,N,NP
// ---------------------------------------------------------

dp_mux2es #(64) oprnd2_mx2 (
        .in0    (spu_mamem_rd_data[63:0]),
        .in1    (mul_data_out[63:0]),
        .sel    (spu_mamul_oprnd2_bypass),
        .dout   (spu_madp_oprnd2_data[63:0]));


wire oprnd2_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf oprnd2_lcd (
                        .clk(oprnd2_clk), .rclk(rclk),
                        .enb_l(~spu_mamul_oprnd2_wen), .tmb_l(testmode_l));
`endif

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(64) oprnd2_ff (
        .din(spu_madp_oprnd2_data[63:0]) ,
        .q(spu_mul_op2_data[63:0]),
        .en (~(~spu_mamul_oprnd2_wen)), .clk(rclk), .se(1'b0),.si (),.so ()
        );
`else
dff_s  #(64) oprnd2_ff (
        .din(spu_madp_oprnd2_data[63:0]) ,
        .q(spu_mul_op2_data[63:0]),
        .clk (oprnd2_clk), .se(1'b0),.si (),.so ()
        );
`endif

// ----------------------
// operand1 mux was moved to spu_mamem.v


// ############################################################
// ---------------------------------------------------------
// ------------ muxing of MPA with reduction operands ------
// ---------------------------------------------------------
// ---------------------------------------------------------

//assign spu_madp_modulus_b = ~spu_madp_modulus;


wire spu_mactl_mpa_sel_q_upper,spu_mactl_mpa_sel_q_lower;

dff_s  #(1) spu_mactl_mpa_sel_upper_ff (
        .din(spu_mactl_mpa_sel) ,
        .q(spu_mactl_mpa_sel_q_upper),
        .clk (rclk), .se(1'b0),.si (),.so ()
        );

dff_s  #(1) spu_mactl_mpa_sel_lower_ff (
        .din(spu_mactl_mpa_sel) ,
        .q(spu_mactl_mpa_sel_q_lower),
        .clk (rclk), .se(1'b0),.si (),.so ()
        );

wire spu_madp_mpa_sel_q_buf1_upper = spu_mactl_mpa_sel_q_upper;
wire spu_madp_mpa_sel_q_buf1_lower = spu_mactl_mpa_sel_q_lower;
wire spu_madp_mpa_sel_q_buf2_upper = spu_mactl_mpa_sel_q_upper;
wire spu_madp_mpa_sel_q_buf2_lower = spu_mactl_mpa_sel_q_lower;

dp_mux2es #(32) mpa_or_m_mx_upper (
        .in0    (spu_mul_op2_data[63:32]),
        .in1    ({24'h000000,spu_madp_mpa_addr[39:32]}),
        .sel    (spu_madp_mpa_sel_q_buf1_upper),
        .dout   (spu_madp_mpa_or_m[63:32]));

dp_mux2es #(32) mpa_or_m_mx_lower (
        .in0    (spu_mul_op2_data[31:0]),
        .in1    (spu_madp_mpa_addr[31:0]),
        .sel    (spu_madp_mpa_sel_q_buf1_lower),
        .dout   (spu_madp_mpa_or_m[31:0]));


/*
dp_mux2es #(64) mpa_or_n_mx (
        .in0    (spu_madp_modulus_b[63:0]),
        .in1    ({56'h00000000000000,3'b000,spu_maaddr_mpa_incr_val[4:0]}),
        .sel    (spu_mactl_mpa_sel),
        .dout   (spu_madp_mpa_or_n_b[63:0]));
*/


wire [4:0] spu_maaddr_mpa_incr_val_q;
dff_s  #(5) spu_maaddr_mpa_incr_val_ff (
        .din(spu_maaddr_mpa_incr_val[4:0]) ,
        .q(spu_maaddr_mpa_incr_val_q[4:0]),
        .clk (rclk), .se(1'b0), .si(), .so());

wire [4:0] spu_maaddr_mpa_incr_val_q_l = ~spu_maaddr_mpa_incr_val_q;


wire [63:0] spu_madp_mpa_or_n;

dp_mux2es #(32) mpa_or_n_mx_upper (
        .in0    (spu_madp_modulus[63:32]),
        .in1    (32'hffffffff),
        .sel    (spu_madp_mpa_sel_q_buf2_upper),
        .dout   (spu_madp_mpa_or_n[63:32]));

dp_mux2es #(32) mpa_or_n_mx_lower (
        .in0    (spu_madp_modulus[31:0]),
        .in1    ({24'hffffff,3'b111,spu_maaddr_mpa_incr_val_q_l[4:0]}),
        .sel    (spu_madp_mpa_sel_q_buf2_lower),
        .dout   (spu_madp_mpa_or_n[31:0]));

assign spu_madp_mpa_or_n_b = ~spu_madp_mpa_or_n;



// ------------------------
dp_mux2es  #(40) mpa_pa_iss_mx (
        .in0    ({1'b0,spu_madp_mpa_reg[38:3],3'b000}),
        .in1    (oprand_minus_modulus_or_mpa[39:0]),
        .sel    (spu_maaddr_mpa_addrinc),
        .dout   (spu_madp_mpa_mx[39:0]));


wire mpa_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf mpa_lcd (
                        .clk(mpa_clk), .rclk(rclk),
                        .enb_l(~spu_maaddr_mpa_wen), .tmb_l(testmode_l));
`endif

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(40) mpa_ff  (
        .din({spu_madp_mpa_mx[39:3],3'b000}) ,
        .q(spu_madp_mpa_addr[39:0]),
        .en (~(~spu_maaddr_mpa_wen)), .clk(rclk), .se(1'b0),.si (),.so ()
        );
`else
dff_s  #(40) mpa_ff  (
        .din({spu_madp_mpa_mx[39:3],3'b000}) ,
        .q(spu_madp_mpa_addr[39:0]),
        .clk (mpa_clk), .se(1'b0),.si (),.so ()
        );
`endif

assign spu_madp_mpa_addr_out[38:3] = spu_madp_mpa_addr[38:3];

// ############################################################
// ---------------------------------------------------------
// ------------ MOD REDUCTION DATAPATH ---------------------
// ---------------------------------------------------------
// ---------------------------------------------------------

wire modulus_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf modulus_lcd (
                        .clk(modulus_clk), .rclk(rclk),
                        .enb_l(~spu_mared_rdn_wen), .tmb_l(testmode_l));
`endif

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(64) modulus_ff (
        .din(spu_mamem_rd_data[63:0]) ,
        .q(spu_madp_modulus[63:0]),
        .en (~(~spu_mared_rdn_wen)), .clk(rclk), .se(1'b0),.si (),.so ()
        );
`else
dff_s  #(64) modulus_ff (
        .din(spu_mamem_rd_data[63:0]) ,
        .q(spu_madp_modulus[63:0]),
        .clk (modulus_clk), .se(1'b0),.si (),.so ()
        );
`endif


// USE 64BIT ADDER FROM LIB.
assign oprand_minus_modulus_or_mpa[64:0] = {1'b0,spu_madp_mpa_or_m[63:0]} +
				    {1'b0,spu_madp_mpa_or_n_b[63:0]} +
				    {64'h0000000000000000,spu_mared_cin_oprnd_sub_mod};

assign carry_out = oprand_minus_modulus_or_mpa[64];

assign spu_madp_cout_oprnd_sub_mod = carry_out;

assign spu_madp_m_lt_n = ~carry_out;

// USE 64BIT COMPARATOR FROM LIB.
assign spu_madp_m_eq_n = (spu_mul_op2_data[63:0] == spu_madp_modulus[63:0]);

dp_mux4ds #(64) modred_data_mx3  (
        .in0    (mul_data_out[63:0]),
        .in1    (64'h0000000000000000), 		// wr0tox
        .in2    (spu_mul_op2_data[63:0]), 		// wrmtox
        .in3    (oprand_minus_modulus_or_mpa[63:0]), 	// wrstox
        .sel0_l   (spu_mared_data_sel_l[0]),
        .sel1_l   (spu_mared_data_sel_l[1]),
        .sel2_l   (spu_mared_data_sel_l[2]),
        .sel3_l   (spu_mared_data_sel_l[3]),
        .dout   (mulorred_data[63:0]));


assign spu_madp_store_data[63:0] = spu_madp_modulus[63:0];


// ############################################################
// ---------------------------------------------------------
// ------------ MOD EXPONENTIATION DATAPATH ----------------
// ---------------------------------------------------------
// ---------------------------------------------------------

dp_mux2es #(64) exp_e_data_mx (
        .in0    (spu_mamem_rd_data[63:0]),
        .in1    ({spu_madp_exp_e_data_q[62:0],1'b0}),
        .sel    (spu_maexp_shift_e),
        .dout   (spu_madp_exp_e_data[63:0]));


wire exp_e_data_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf exp_e_data_lcd (
                        .clk(exp_e_data_clk), .rclk(rclk),
                        .enb_l(~spu_maexp_e_data_wen), .tmb_l(testmode_l));
`endif

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(64) exp_e_data_ff (
        .din(spu_madp_exp_e_data[63:0]) ,
        .q(spu_madp_exp_e_data_q[63:0]),
        .en (~(~spu_maexp_e_data_wen)), .clk(rclk), .se(1'b0),.si (),.so ()
        );
`else
dff_s  #(64) exp_e_data_ff (
        .din(spu_madp_exp_e_data[63:0]) ,
        .q(spu_madp_exp_e_data_q[63:0]),
        .clk (exp_e_data_clk), .se(1'b0),.si (),.so ()
        );
`endif

assign spu_madp_e_eq_one = spu_madp_exp_e_data_q[63];


// ############################################################
// ---------------------------------------------------------
// ------------ MA PARITY DATAPATH ----------------
// ---------------------------------------------------------
// ---------------------------------------------------------
wire [63:0] mem_ldupper_data_mx_l;

wire mulorred_data_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf mulorred_data_lcd (
                        .clk(mulorred_data_clk), .rclk(rclk),
                        .enb_l(~spu_mactl_madp_parflop_wen), .tmb_l(testmode_l));
`endif

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(64) mulorred_data_ff (
        .din(mulorred_data[63:0]) ,
        .q(mulorred_data_q[63:0]),
        .en (~(~spu_mactl_madp_parflop_wen)), .clk(rclk), .se(1'b0),.si (),.so ()
        );
`else
dff_s  #(64) mulorred_data_ff (
        .din(mulorred_data[63:0]) ,
        .q(mulorred_data_q[63:0]),
        .clk (mulorred_data_clk), .se(1'b0),.si (),.so ()
        );
`endif

dp_mux2es #(64) mul_ldlower_mx (
        .in0    (mulorred_data_q[63:0]),
        .in1    (spu_madp_lnlower_data[63:0]),
        .sel    (spu_madp_ldop_q_buf1),
        .dout   (mul_ldlower_data_mx[63:0]));

wire [63:0] mul_ldlower_data_mx_l;
assign mul_ldlower_data_mx_l = ~mul_ldlower_data_mx;	//to match gatemap.

// USE THE LIBRARY MACRO FOR THE FOLLOWING PARITY GENERATORS.
assign mul_ldlower_data_par_pre[1] = (^mul_ldlower_data_mx_l[63:32]);	//to match gatemap.
assign mul_ldlower_data_par_pre[0] = (^mul_ldlower_data_mx_l[31:0]);	//to match gatemap.

assign mul_ldlower_data_par[1] = mul_ldlower_data_par_pre[1] ^ spu_mactl_force_perr;
assign mul_ldlower_data_par[0] = mul_ldlower_data_par_pre[0] ^ spu_mactl_force_perr;


wire [65:0] spu_madp_odddata_mx_l;

dp_mux3ds #(66) odd_data_mx (
        .in0    ({mul_ldlower_data_par[1:0],mul_ldlower_data_mx_l[63:0]}),
        .in1    ({mem_ldupper_data_par[1:0],mem_ldupper_data_mx_l[63:0]}),
        .in2    ({mul_ldlower_data_par[1:0],mul_ldlower_data_mx_l[63:0]}),
        .sel0_l    (spu_mactl_memmxsel_l[0]),
        .sel1_l    (spu_mactl_memmxsel_l[1]),
        .sel2_l    (spu_mactl_memmxsel_l[2]),
        .dout   (spu_madp_odddata_mx_l[65:0]));


assign spu_madp_odddata_mx = ~spu_madp_odddata_mx_l;	//to match gatemap.


wire [65:0] spu_madp_odddata_mx_sehold;
dp_mux2es #(66) odddata_mx_sehold (
        .in0    (spu_madp_odddata_mx[65:0]),
        .in1    (spu_madp_odddata[65:0]),
        .sel    (sehold),
        .dout   (spu_madp_odddata_mx_sehold[65:0]));

dff_s  #(66) mul_ldlower_ff (
        .din(spu_madp_odddata_mx_sehold[65:0]) ,
        .q(spu_madp_odddata[65:0]),
        .clk (rclk), .se(1'b0),.si (),.so ()
        );


// ---------------------------------------------------------

dff_s  #(64) mem_data_ff (
        .din(spu_mamem_rd_data[63:0]) ,
        .q(spu_madp_mem_rd_data[63:0]),
        .clk (rclk), .se(1'b0),.si (),.so ()
        );

// ---------------------------------------------------------

dp_mux2es #(64) mem_ldupper_mx (
        .in0    (spu_madp_mem_rd_data[63:0]),
        .in1    (spu_madp_lnupper_data[63:0]),
        .sel    (spu_madp_ldop_q_buf2),
        .dout   (mem_ldupper_data_mx[63:0]));

assign mem_ldupper_data_mx_l = ~mem_ldupper_data_mx;

// USE THE LIBRARY MACRO FOR THE FOLLOWING PARITY GENERATORS.
assign mem_ldupper_data_par_pre[1] = (^mem_ldupper_data_mx_l[63:32]);
assign mem_ldupper_data_par_pre[0] = (^mem_ldupper_data_mx_l[31:0]);

assign mem_ldupper_data_par[1] = mem_ldupper_data_par_pre[1] ^ spu_mactl_force_perr;
assign mem_ldupper_data_par[0] = mem_ldupper_data_par_pre[0] ^ spu_mactl_force_perr;

wire [65:0] spu_madp_evedata_mx_l;
dp_mux3ds #(66) eve_data_mx (
        .in0    ({mem_ldupper_data_par[1:0],mem_ldupper_data_mx_l[63:0]}),
        .in1    ({mul_ldlower_data_par[1:0],mul_ldlower_data_mx_l[63:0]}),
        .in2    ({mul_ldlower_data_par[1:0],mul_ldlower_data_mx_l[63:0]}),
        .sel0_l    (spu_mactl_memmxsel_l[0]),
        .sel1_l    (spu_mactl_memmxsel_l[1]),
        .sel2_l    (spu_mactl_memmxsel_l[2]),
        .dout   (spu_madp_evedata_mx_l[65:0]));

assign spu_madp_evedata_mx = ~spu_madp_evedata_mx_l;


wire [65:0] spu_madp_evedata_mx_sehold;
dp_mux2es #(66) evedata_mx_sehold (
        .in0    (spu_madp_evedata_mx[65:0]),
        .in1    (spu_madp_evedata[65:0]),
        .sel    (sehold),
        .dout   (spu_madp_evedata_mx_sehold[65:0]));

dff_s  #(66) mem_ldupper_ff (
        .din(spu_madp_evedata_mx_sehold[65:0]) ,
        .q(spu_madp_evedata[65:0]),
        .clk (rclk), .se(1'b0),.si (),.so ()
        );



// ---------------------------------------------------------
// following is for readmem parity check only performed in spu_mactl.v
assign spu_madp_rdmem_pargen[1:0] = mem_ldupper_data_par_pre[1:0];

// ---------------------------------------------------------
// ---------------------------------------------------------

// ############################################################
// ---------------------------------------------------------
// ---------------------------------------------------------
// ------- MA ASI REGISTERS

wire mampa_reg_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf mampa_reg_lcd (
                        .clk(mampa_reg_clk), .rclk(rclk), 
                        .enb_l(~spu_mactl_mpa_wen), .tmb_l(testmode_l));
`endif

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(36) mampa_reg_ff (
        .din(exu_spu_st_rs3_data_g2[38:3]) , 
        .q(spu_madp_mpa_reg[38:3]),
        .en (~(~spu_mactl_mpa_wen)), .clk(rclk), .se(1'b0),.si(),.so()
        ); 
`else
dff_s  #(36) mampa_reg_ff (
        .din(exu_spu_st_rs3_data_g2[38:3]) , 
        .q(spu_madp_mpa_reg[38:3]),
        .clk (mampa_reg_clk), .se(1'b0),.si(),.so()
        ); 
`endif

wire maaddr_reg_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf maaddr_reg_lcd (
                        .clk(maaddr_reg_clk), .rclk(rclk), 
                        .enb_l(~spu_mactl_maaddr_wen), .tmb_l(testmode_l));
`endif

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(48) maaddr_reg_ff (
        .din(exu_spu_st_rs3_data_g2[47:0]) , 
        .q(spu_madp_maaddr_reg_int[47:0]),
        .en (~(~spu_mactl_maaddr_wen)), .clk(rclk), .se(1'b0),.si (),.so ()
        ); 
`else
dff_s  #(48) maaddr_reg_ff (
        .din(exu_spu_st_rs3_data_g2[47:0]) , 
        .q(spu_madp_maaddr_reg_int[47:0]),
        .clk (maaddr_reg_clk), .se(1'b0),.si (),.so ()
        ); 
`endif


assign spu_madp_maaddr_reg[47:0] = spu_madp_maaddr_reg_int[47:0];


wire manp_reg_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf manp_reg_lcd (
                        .clk(manp_reg_clk), .rclk(rclk),
                        .enb_l(~spu_mactl_manp_wen), .tmb_l(testmode_l));
`endif

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(64) manp_reg_ff (
        .din(exu_spu_st_rs3_data_g2[63:0]) , 
        .q(spu_madp_manp_reg[63:0]),
        .en (~(~spu_mactl_manp_wen)), .clk(rclk), .se(1'b0),.si (),.so ()
        ); 
`else
dff_s  #(64) manp_reg_ff (
        .din(exu_spu_st_rs3_data_g2[63:0]) , 
        .q(spu_madp_manp_reg[63:0]),
        .clk (manp_reg_clk), .se(1'b0),.si (),.so ()
        ); 
`endif

wire [63:0] spu_madp_ldxa_data_a;
dp_mux4ds #(64) ldxa_data_a_mx  (
        .in0    ({24'h000000,1'b0,spu_madp_mpa_reg[38:3],3'b000}),
        .in1    ({16'h0000,spu_madp_maaddr_reg_int[47:0]}),
        .in2    (spu_madp_manp_reg[63:0]),
        .in3    ({50'b00000000000000000000000000000000000000000000000000,spu_mactl_mactl_reg[13:0]}),
        .sel0_l   (spu_mactl_ldxa_data_w_sel_l[0]),
        .sel1_l   (spu_mactl_ldxa_data_w_sel_l[1]),
        .sel2_l   (spu_mactl_ldxa_data_w_sel_l[2]),
        .sel3_l   (spu_mactl_ldxa_data_w_sel_l[3]),
        .dout   (spu_madp_ldxa_data_a[63:0]));

dp_mux2es #(64) ldxa_data_mx (
        .in0    (spu_madp_ldxa_data_a[63:0]),
        .in1    (64'h0000000000000000),
        .sel    (spu_mactl_ldxa_data_w_select),
        .dout   (spu_madp_ldxa_data[63:0]));



// ############################################################
// ------------------------------------------------------------
// load buffer.
// ------------------------------------------------------------
// ------------------------------------------------------------

wire lnupper_data_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf lnupper_data_lcd (
                        .clk(lnupper_data_clk), .rclk(rclk),
                        .enb_l(~spu_wen_maln_wen), .tmb_l(testmode_l));
`endif

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(64) lnupper_data_ff (
        .din(lsu_spu_vload_data[127:64]) ,
        .q(spu_madp_lnupper_data[63:0]),
        .en (~(~spu_wen_maln_wen)), .clk(rclk), .se(1'b0),.si (),.so ()
        );
`else
dff_s  #(64) lnupper_data_ff (
        .din(lsu_spu_vload_data[127:64]) ,
        .q(spu_madp_lnupper_data[63:0]),
        .clk (lnupper_data_clk), .se(1'b0),.si (),.so ()
        );
`endif

wire lnlower_data_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf lnlower_data_lcd (
                        .clk(lnlower_data_clk), .rclk(rclk),
                        .enb_l(~spu_wen_maln_wen), .tmb_l(testmode_l));
`endif

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(64) lnlower_data_ff (
        .din(lsu_spu_vload_data[63:0]) ,
        .q(spu_madp_lnlower_data[63:0]),
        .en (~(~spu_wen_maln_wen)), .clk(rclk), .se(1'b0),.si (),.so ()
        );
`else
dff_s  #(64) lnlower_data_ff (
        .din(lsu_spu_vload_data[63:0]) ,
        .q(spu_madp_lnlower_data[63:0]),
        .clk (lnlower_data_clk), .se(1'b0),.si (),.so ()
        );
`endif


// ############################################################


endmodule
