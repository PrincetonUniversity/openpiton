// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: test_stub_bist.v
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
// ____________________________________________________________________________
//
//  test_stub_bist - Test Stub with BIST Support
// ____________________________________________________________________________
//
// Description: DBB interface for test signal generation and BIST execution
// ____________________________________________________________________________

module test_stub_bist (/*AUTOARG*/
// Outputs
mux_drive_disable, mem_write_disable, sehold, se, testmode_l, 
mem_bypass, so_0, so_1, so_2, so, tst_ctu_mbist_done, 
tst_ctu_mbist_fail, bist_ctl_reg_out, mbist_bisi_mode, 
mbist_stop_on_next_fail, mbist_stop_on_fail, mbist_loop_mode, 
mbist_loop_on_addr, mbist_data_mode, mbist_start, 
// Inputs
ctu_tst_pre_grst_l, arst_l, cluster_grst_l, global_shift_enable, 
ctu_tst_scan_disable, ctu_tst_scanmode, ctu_tst_macrotest, 
ctu_tst_short_chain, long_chain_so_0, short_chain_so_0, 
long_chain_so_1, short_chain_so_1, long_chain_so_2, short_chain_so_2, 
si, ctu_tst_mbist_enable, rclk, bist_ctl_reg_in, bist_ctl_reg_wr_en, 
mbist_done, mbist_err
);

// Scan interface

input          ctu_tst_pre_grst_l;
input 	       arst_l;
input 	       cluster_grst_l;
input 	       global_shift_enable;
input 	       ctu_tst_scan_disable;
input 	       ctu_tst_scanmode;
input 	       ctu_tst_macrotest;
input 	       ctu_tst_short_chain;
input 	       long_chain_so_0;
input 	       short_chain_so_0;
input 	       long_chain_so_1;
input 	       short_chain_so_1;
input 	       long_chain_so_2;
input 	       short_chain_so_2;
input 	       si;
output 	       mux_drive_disable;
output 	       mem_write_disable;
output 	       sehold;
output 	       se;
output 	       testmode_l;
output 	       mem_bypass;
output 	       so_0;
output 	       so_1;
output 	       so_2;
output 	       so;

// Global BIST control interface

input          ctu_tst_mbist_enable;
output         tst_ctu_mbist_done;
output         tst_ctu_mbist_fail;

// CSR interface

input 	       rclk;
input  [6:0]   bist_ctl_reg_in;
input 	       bist_ctl_reg_wr_en;
output [10:0]  bist_ctl_reg_out;

// BIST diagnostic interface

input          mbist_done;
input  [2:0]   mbist_err;
output         mbist_bisi_mode;
output 	       mbist_stop_on_next_fail;
output 	       mbist_stop_on_fail;
output 	       mbist_loop_mode;
output 	       mbist_loop_on_addr;
output 	       mbist_data_mode;
output 	       mbist_start;

// Internal wires

wire           csr_write;               // write enable for bist_ctl_reg
wire 	       mbist_enable_d1;         // delayed version of ctu_tst_mbist_enable
wire 	       mbist_enable_d2;         // delayed version of mbist_enable_d1
wire 	       mbist_stop_serial_in;    // delayed version of mbist_start
wire [6:0]     bist_diag_mode;          // data written to bist_ctl_reg
wire 	       mbist_done_delayed;      // flopped version of mbist_done
wire 	       clr_mbist_ctl_l;         // flag to clear mbist control bits
wire 	       mbist_fail_flag;         // summation of array error signals
wire           serial_setup_mode;       // serial setup mode flag
wire           serial_setup_mode_ctl;   // serial setup mode control
wire           serial_setup_start;      // edge to enable serial setup mode
wire 	       serial_setup_enable;     // kick off serial setup mode
wire           serial_setup_stop;       // reset for serial setup mode
wire 	       serial_setup_valid;      // bist start qualifier
wire 	       si;                      // scanin place holder
wire 	       so;                      // scanout place holder

// Scan control

test_stub_scan scan_ctls (
			  .ctu_tst_pre_grst_l(ctu_tst_pre_grst_l),
			  .arst_l(arst_l),
			  .global_shift_enable(global_shift_enable),
			  .ctu_tst_scan_disable(ctu_tst_scan_disable),
			  .ctu_tst_scanmode(ctu_tst_scanmode),
			  .ctu_tst_macrotest(ctu_tst_macrotest),
			  .ctu_tst_short_chain(ctu_tst_short_chain),
			  .long_chain_so_0(long_chain_so_0),
			  .short_chain_so_0(short_chain_so_0),
  			  .long_chain_so_1(long_chain_so_1),
  			  .short_chain_so_1(short_chain_so_1),
  			  .long_chain_so_2(long_chain_so_2),
 			  .short_chain_so_2(short_chain_so_2),
			  .mux_drive_disable(mux_drive_disable),
			  .mem_write_disable(mem_write_disable),
 			  .sehold(sehold),
  			  .se(se),
			  .testmode_l(testmode_l),
 			  .mem_bypass(mem_bypass),
			  .so_0(so_0),
  			  .so_1(so_1),
			  .so_2(so_2)
			  );

// BIST control

assign csr_write = bist_ctl_reg_wr_en | serial_setup_mode;
assign mbist_done_delayed = bist_ctl_reg_out[10];
assign clr_mbist_ctl_l = cluster_grst_l & ~serial_setup_start;
assign {mbist_bisi_mode,
	   mbist_stop_on_next_fail,
	   mbist_stop_on_fail,
	   mbist_loop_mode,
	   mbist_loop_on_addr,
	   mbist_data_mode,
	   mbist_start
	   } = bist_ctl_reg_out[6:0];

// Software accessible CSR (parallel interface)
//
// Bit  Type Function
// ---  ____ -----------------
//  10   S   Done flag
//   9   S   Array 2 fail flag
//   8   S   Array 1 fail flag
//   7   S   Array 0 fail flag
//   6   C   Bisi mode
//   5   C   Stop on next fail
//   4   C   Stop on fail
//   3   C   Loop
//   2   C   Loop on address
//   1   C   User data mode
//   0   C   Start

dffrl_ns #(4) bist_ctl_reg_10_7 (
				 .din({mbist_done,mbist_err[2:0]}),
				 .clk(rclk),
				 .rst_l(cluster_grst_l),
				 .q(bist_ctl_reg_out[10:7])
				 );

dffrle_ns #(1) bist_ctl_reg_6 (
                               .din(bist_diag_mode[6]),
                               .clk(rclk),
			       .rst_l(clr_mbist_ctl_l),
		               .en(csr_write),
		     	       .q(bist_ctl_reg_out[6])
			       );
					       
dffrle_ns #(5) bist_ctl_reg_5_1 (
				 .din(bist_diag_mode[5:1]),
				 .clk(rclk),
				 .rst_l(clr_mbist_ctl_l),
				 .en(csr_write),
				 .q(bist_ctl_reg_out[5:1])
				 );

dffrle_ns #(1) bist_ctl_reg_0 (
			       .din(bist_diag_mode[0]),
			       .clk(rclk),
			       .rst_l(clr_mbist_ctl_l),
			       .en(csr_write),
			       .q(bist_ctl_reg_out[0])
			       );

// CTU serial BIST interface. Bit ordering is 5,4,3,2,1,6,0.

assign tst_ctu_mbist_done = mbist_done_delayed;
assign mbist_fail_flag = |mbist_err[2:0];
assign serial_setup_start = mbist_enable_d1 & ~mbist_enable_d2 & ~serial_setup_mode;
assign serial_setup_stop = cluster_grst_l & ~serial_setup_valid;
assign serial_setup_enable = serial_setup_start | serial_setup_mode;
assign bist_diag_mode[5:1] = serial_setup_mode ? {mbist_enable_d2, bist_ctl_reg_out[5:2]} : bist_ctl_reg_in[5:1];
assign bist_diag_mode[6]   = serial_setup_mode ? bist_ctl_reg_out[1] : bist_ctl_reg_in[6];
assign bist_diag_mode[0]   = serial_setup_mode ? bist_ctl_reg_out[6] & serial_setup_valid : bist_ctl_reg_in[0];

dff_ns #(1) tst_ctu_mbist_fail_reg (
				    .din(mbist_fail_flag),
				    .clk(rclk),
				    .q(tst_ctu_mbist_fail)
				    );

dff_ns #(1) mbist_enable_d1_reg (
			              .din(ctu_tst_mbist_enable),
			              .clk(rclk),
			              .q(mbist_enable_d1)
  			              );

dff_ns #(1) mbist_enable_d2_reg (
			              .din(mbist_enable_d1),
			              .clk(rclk),
			              .q(mbist_enable_d2)
  			              );

dff_ns #(1) serial_setup_valid_reg (
			            .din(bist_ctl_reg_out[6]),
			            .clk(rclk),
			            .q(serial_setup_valid)
  			            );

dffrl_ns #(1) serial_setup_mode_reg (
       			             .din (serial_setup_enable),
				     .clk(rclk),
				     .rst_l(serial_setup_stop),
				     .q(serial_setup_mode)
				     );

endmodule // test_stub_bist
