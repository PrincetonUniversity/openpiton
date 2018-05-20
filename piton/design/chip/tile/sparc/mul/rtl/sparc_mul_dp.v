// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_mul_dp.v
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
//PITON_PROTO enables all FPGA related modifications
`ifdef PITON_PROTO 
`define FPGA_SYN_CLK_EN
`define FPGA_SYN_CLK_DFF
`endif

module sparc_mul_dp(
  ecl_mul_rs1_data,
  ecl_mul_rs2_data,
  spu_mul_op1_data,
  spu_mul_op2_data,
  valid,
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
  mul_data_out,
  rst_l,
  si,
  so,
  se,
  rclk
  );

input [63:0]	ecl_mul_rs1_data;	// EXU mul operand 1
input [63:0]	ecl_mul_rs2_data;	// EXU mul operand 2
input [63:0]	spu_mul_op1_data;	// SPU mul operand 1	
input [63:0]	spu_mul_op2_data;	// SPU mul operand 2	
input		valid;			// begin cyc0 of MUL operation
input 		spick;			// Internal pick signals of exu, spu multiplier 
input		byp_sel;		// SPU bypass ACCUM[63:0] as operand 
input		byp_imm;		// SPU bypss action from mout immediately 
input		acc_imm;		// SPU accumlate from mout immediately
input		acc_actc2, acc_actc3;	// accumulate enable for LSB-32 and All-96
input		acc_actc5;		// accumulate enable for LSB-32 and All-96
input		acc_reg_enb;		// ACCUM register enable
input		acc_reg_rst;		// ACCUM register reset
input 		acc_reg_shf;		// ACCUM shift right 64-bit
input		x2;			// for op1*op2*2
input		rst_l;			// system  reset
input		si;			// si
input		se;			// scan_enable
input		rclk;
output		so;			// so
output [63:0]	mul_data_out;		// Multiplier outputs

wire  [63:0]	mul_op1_d, mul_op2_d, bypreg;
wire  [63:32]	mux1_reg, mux1_mou;
wire  [96:0]    mux2_reg, areg;
wire  [135:0]	mout, acc_reg_in, acc_reg;
wire 		op2_s0, op2_s1, op2_s2;
wire 		acc_reg_shf2, clk_enb1;
wire 		clk;

assign clk = rclk ;

///////////////////////////////////////////////////////////////////////////////
////// 	op1 inputs mux between EXU and SPU 
///////////////////////////////////////////////////////////////////////////////

  assign mul_op1_d = ({64{spick}}  & spu_mul_op1_data) |
                     ({64{~spick}} & ecl_mul_rs1_data );

///////////////////////////////////////////////////////////////////////////////
////// 	op2 inputs mux between EXU, SPU and bypass from ACCUM register
///////////////////////////////////////////////////////////////////////////////
  
  assign op2_s0 = ~spick;
  assign op2_s1 = spick & byp_sel ; 
  assign op2_s2 = spick & ~byp_sel ; 
  assign mul_op2_d = (op2_s0 & op2_s1)|(op2_s0 & op2_s2)|(op2_s1 & op2_s2) ? 64'hxx :
                     (op2_s0 ? ecl_mul_rs2_data : 
		     (op2_s1 ? bypreg : 
		     (op2_s2 ? spu_mul_op2_data : 64'hxx)
		      ));
 
///////////////////////////////////////////////////////////////////////////////
//////	Accumulate input muxes 
///////////////////////////////////////////////////////////////////////////////

// MUX1: Pass acc_reg[31:0] at cyc2 of SPU accumulate, otherwise acc_reg[63:32] 
  assign mux1_reg[63:32] = acc_actc2 ? acc_reg[31:0] 
				     : acc_reg[63:32] ;

// Bypass mout[31:0] (mul core output) of MAC1 at cyc5 when the lower 32-bit 
// 	  are ready but not lateched into acc_reg yet.
//
//  MAC1: cyc1	|cyc2	|cyc3 	|	cyc4	| 	cyc5	| 	cyc6
//		|	|	|		|  mout[31:0] 	|  acc_reg[128:0]	
//		|	|	|		|  bypass	|  latched out
//	
//  MAC2: 			|	cyc1	|	cyc2	|	
//				|		|  ACCUM from 	|	
//				|		|  mout[31:0]	|
//						
  assign mux1_mou[63:32] = (acc_actc2 & acc_actc5) ? mout[31:0]
				     		   : mout[63:32] ;

// MUX2: Immediate bypass from mout (output of mul core)
  assign mux2_reg[96:0]  = acc_imm   ? {mout[128:64],mux1_mou[63:32]}
                                     : {acc_reg[128:64],mux1_reg[63:32]};

// Enable of accumulate reg input to multipler core
  assign areg[96:32] = mux2_reg[96:32] & {65{acc_actc3}} ;
  assign areg[31:0] =  mux2_reg[31:0]  & {32{(acc_actc3 | acc_actc2)}};



///////////////////////////////////////////////////////////////////////////////
//////	Multiplier core connection
///////////////////////////////////////////////////////////////////////////////

  mul64		mulcore(.rs1_l	(~mul_op1_d),
			.rs2	(mul_op2_d),
			.valid	(valid),
			.areg	(areg),
			.accreg	(acc_reg[135:129]),
			.x2	(x2),
			.out	(mout),
			.rclk	(clk),
			.si	(),
			.so	(),
			.se	(se),
			.mul_rst_l (rst_l),
			.mul_step  (1'b1)
			);
			
///////////////////////////////////////////////////////////////////////////////
/////	ACCUM register and right shift muxes
///////////////////////////////////////////////////////////////////////////////

  dff_s        	dffshf (.din    (acc_reg_shf),
                        .clk    (clk),
                        .q      (acc_reg_shf2),
                        .se     (se),
                        .si     (),
                        .so     ()
                        );

  assign acc_reg_in  =	acc_reg_shf  ?	{64'b0,acc_reg[135:64]}
				     :	mout ;

  assign mul_data_out =	acc_reg_shf2 ?	acc_reg[63:0]
				     :	mout[63:0]	;

`ifdef FPGA_SYN_CLK_DFF
  dffre_s  #(136)  accum  (.din    (acc_reg_in),
                        .rst    (acc_reg_rst),
                        .en (acc_reg_enb | acc_reg_rst), .clk(clk), //manually fixed
                        .q      (acc_reg),
                        .se     (se),
                        .si     (),
                        .so     ()
                        );
`else
  dffr_s  #(136)  accum  (.din    (acc_reg_in),
                        .rst    (acc_reg_rst),
                        .clk    (clk_enb1),
                        .q      (acc_reg),
                        .se     (se),
                        .si     (),
                        .so     ()
                        );
`endif

`ifdef FPGA_SYN_CLK_EN
`else
  clken_buf     ckbuf_1(.clk(clk_enb1), .rclk(clk), .enb_l(~(acc_reg_enb | acc_reg_rst)), .tmb_l(~se));
`endif


  assign bypreg =  byp_imm ? mout[63:0]
			   : acc_reg[63:0] ;

endmodule 

