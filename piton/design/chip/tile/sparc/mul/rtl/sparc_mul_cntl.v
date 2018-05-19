// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_mul_cntl.v
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
module sparc_mul_cntl(
  ecl_mul_req_vld,
  spu_mul_req_vld,
  spu_mul_acc,
  spu_mul_areg_shf,
  spu_mul_areg_rst,
  spu_mul_mulres_lshft,
  c0_act,
  spick,
  byp_sel,
  byp_imm,
  acc_imm,
  acc_actc2,
  acc_actc3,
  acc_actc5,
  acc_reg_enb,
  acc_reg_rst,
  acc_reg_shf,
  x2,
  mul_ecl_ack,
  mul_spu_ack,
  mul_spu_shf_ack,
  rst_l,
  rclk
  );

input		rclk;
input		rst_l;			// System rest 
input		ecl_mul_req_vld; 	// Input request from EXU to MUL
input		spu_mul_req_vld;	// Input request from SPU to MUL
input		spu_mul_acc;		// 1: SPU mul op req will accumulate the ACCUM register 
input 		spu_mul_areg_shf;	// ACCUM shift right 64-bit
input 		spu_mul_areg_rst;	// ACCUM reset; initialization of modular multiplication
input		spu_mul_mulres_lshft;	// For x2 of op1*op2*2 left shift
output		c0_act;			// cycle-0 of muliplier operation
output		spick;
output		byp_sel;		// Bypass mux control
output		byp_imm;
output		acc_imm;
output		acc_actc2, acc_actc3;	// accumulate enable for LSB-32 and All-96
output		acc_actc5;		// accumulate enable for LSB-32 and All-96
output		acc_reg_enb;		// ACCUM register enable
output		acc_reg_rst;		// ACCUM register reset
output		acc_reg_shf;		// ACCUM register shift select
output		x2;
output		mul_ecl_ack;		// Ack EXU multiplier operation is accepted.
output		mul_spu_ack;		// Ack SPU multiplier operation is accepted.
output		mul_spu_shf_ack;	// Ack SPU shift operation is accepted.

reg 		mul_ecl_ack_d;
reg		mul_spu_ack_d;
reg		c1_act;			// Squash all mul requests from EXU and SPU if c1_act = 1
reg		c2_act;			// Squash bypass ACCUM mul request from SPU if c2_act = 1
reg		c3_act;			// Enable >>32 results back to CSA2 if c3_act = 1
reg		favor_e;		// Flag for alternate picker, favor to EXU if f_state = 1
reg 		acc_actc1, acc_actc2, acc_actc3, acc_actc4, acc_actc5;
reg		acc_reg_shf, acc_reg_rst; 

wire		exu_req_vld, spu_req_vld;
wire		epick;			// Internal pick signals of exu, spu multiplier
wire		nobyps;			// Squash SPU bypass mul requests nobyps = 1
wire		noshft;			// Squash SPU bypass mul requests noshft = 1
wire		acc_reg_shf_in;
wire 		spu_mul_byp = ~spu_mul_acc ; 
wire		clk;


/////////////////////////////////////////
// Requests picker and general control //
/////////////////////////////////////////

assign clk = rclk ;

assign	c0_act = epick | spick ;				// Cycle0 of multiplier operation
//assign	c1_act = mul_ecl_ack_d | mul_spu_ack_d ;		// Cycle1 of multiplier operation
assign  nobyps = c1_act | acc_actc2 | acc_actc3 | acc_actc4 ; 	// Cycles prevent the SPU bypass 

assign  x2 = spick & spu_mul_mulres_lshft;

assign	exu_req_vld = ecl_mul_req_vld & ~c1_act ;
assign	spu_req_vld = spu_mul_req_vld & ~c1_act & ~(nobyps & spu_mul_byp); 

assign	epick = exu_req_vld & ( favor_e | ~spu_req_vld) ; 
assign  spick = spu_req_vld & (~favor_e | ~exu_req_vld) ;

// moved this one cycle earlier   
assign    mul_spu_ack = rst_l & spick ;
assign    mul_ecl_ack = rst_l & epick ;
   
always @(posedge clk)
  begin
	mul_ecl_ack_d <= rst_l & epick ;
	mul_spu_ack_d <= rst_l & spick ;
	c1_act <= rst_l & c0_act ;
	c2_act <= rst_l & c1_act ; 
	c3_act <= rst_l & c2_act ; 

	favor_e <= rst_l & (mul_spu_ack_d & ~mul_ecl_ack_d);		
  end

/////////////////////////////////////////////////
// SPU accumulate and bypass and shift control //
/////////////////////////////////////////////////

assign 	byp_sel = spick & spu_mul_byp ;	// SPU bypass operand is picked 

//////////////////////////////////////////////////////////////////////////
//	No ACCUM >>= 64 allow if there are 				//
//	1) accumulate mul before cycle4 which need to updated ACCUM	//
//	2) Any mul at cyc3 which will use the same output mux at cyc-5	//
//////////////////////////////////////////////////////////////////////////
assign  noshft = acc_actc1 | acc_actc2 | c3_act | acc_actc4 ;

						// Squash shifr if:
assign  acc_reg_shf_in =   spu_mul_areg_shf &	// No shift request
			  ~noshft	    &	// SPU accum mul in cycle1~4 or EXU mul in cycle3
			  ~acc_reg_shf ;	// reset SPU shift request for 1-cycle for signal upate

always @(posedge clk)
  begin
	acc_reg_shf <= rst_l & acc_reg_shf_in ;		// latch ACCUM reg shift control

	acc_reg_rst <=  spu_mul_areg_rst ;		// latch input control of ACCUM reg reset

        acc_actc1 <= rst_l & (spick & spu_mul_acc) ;	// SPU MAC in cycle 1
        acc_actc2 <= rst_l & acc_actc1 ;			// SPU MAC in cycle 2 
        acc_actc3 <= rst_l & acc_actc2 ;			// SPU MAC in cycle 3 
        acc_actc4 <= rst_l & acc_actc3 ;			// SPU MAC in cycle 4 
        acc_actc5 <= rst_l & acc_actc4 ;			// SPU MAC in cycle 5 
  end

assign  mul_spu_shf_ack = acc_reg_shf;

assign 	byp_imm = acc_actc5 ;

assign 	acc_imm = (acc_actc2 & acc_actc4) | ((acc_actc2 | acc_actc3) & acc_actc5)  ; 

assign 	acc_reg_enb = acc_actc5 | acc_reg_shf;		// enable of ACCUM registers 


endmodule // sparc_mul_cntl

