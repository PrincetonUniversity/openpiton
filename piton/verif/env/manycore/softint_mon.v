// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: softint_mon.v
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
///////////////////////////////////////////////////////////////////////
// softint_mon.v
//
// Description:
// This file contains monitors required for the SOFTINT register part
// TLU (Trap Logic Unit) verification.
//
///////////////////////////////////////////////////////////////////////

`include "cross_module.tmp.h"

module softint_mon(/*AUTOARG*/
	rtl_softint0,
	rtl_softint1,
	rtl_softint2,
	rtl_softint3,
	rtl_wsr_data_w,
	rtl_sftint_en_l_g,
	rtl_sftint_b0_en,
	rtl_tickcmp_int,
	rtl_sftint_b16_en,
	rtl_stickcmp_int,
	rtl_sftint_b15_en,
	rtl_pib_picl_wrap,
	rtl_pib_pich_wrap,
	rtl_wr_sftint_l_g,
	rtl_set_sftint_l_g,
	rtl_clr_sftint_l_g,
	rtl_clk,
	rtl_reset,
	core_id
	);

  input [16:0]	rtl_softint0;
  input [16:0]	rtl_softint1;
  input [16:0]	rtl_softint2;
  input [16:0]	rtl_softint3;
  input [16:0]	rtl_wsr_data_w;
  input [3:0]	rtl_sftint_en_l_g;
  input [3:0]	rtl_sftint_b0_en;
  input [3:0]	rtl_tickcmp_int;
  input [3:0]	rtl_sftint_b16_en;
  input [3:0]	rtl_stickcmp_int;
  input [3:0]	rtl_sftint_b15_en;
  input [3:0]	rtl_pib_picl_wrap;
  input [3:0]	rtl_pib_pich_wrap;
  input		rtl_wr_sftint_l_g;
  input		rtl_set_sftint_l_g;
  input		rtl_clr_sftint_l_g;
  input		rtl_clk;
  input		rtl_reset;
  input [9:0]	core_id;

/*
  wire [16:0]	rtl_softint0 = `TOP_DESIGN.sparc0.tlu.tdp.sftint0;
  wire [16:0]	rtl_softint1 = `TOP_DESIGN.sparc0.tlu.tdp.sftint1;
  wire [16:0]	rtl_softint2 = `TOP_DESIGN.sparc0.tlu.tdp.sftint2;
  wire [16:0]	rtl_softint3 = `TOP_DESIGN.sparc0.tlu.tdp.sftint3;
  wire [16:0]	rtl_wsr_data_w  = `TOP_DESIGN.sparc0.tlu.tdp.wsr_data_w;
  wire [3:0]	rtl_sftint_en_l_g = `TOP_DESIGN.sparc0.tlu.tdp.tlu_sftint_en_l_g;
  wire [3:0]	rtl_sftint_b0_en = `TOP_DESIGN.sparc0.tlu.tdp.sftint_b0_en;
  wire [3:0]	rtl_tickcmp_int = `TOP_DESIGN.sparc0.tlu.tdp.tickcmp_int;
  wire [3:0]	rtl_sftint_b16_en = `TOP_DESIGN.sparc0.tlu.tdp.sftint_b16_en;
  wire [3:0]	rtl_stickcmp_int = `TOP_DESIGN.sparc0.tlu.tdp.stickcmp_int;
  wire [3:0]	rtl_sftint_b15_en = `TOP_DESIGN.sparc0.tlu.tdp.sftint_b15_en;
  wire [3:0]	rtl_pib_picl_wrap = `TOP_DESIGN.sparc0.tlu.tdp.pib_picl_wrap;
  wire [3:0]	rtl_pib_pich_wrap = `TOP_DESIGN.sparc0.tlu.tdp.pib_pich_wrap;
  wire		rtl_wr_sftint_l_g = `TOP_DESIGN.sparc0.tlu.tdp.tlu_wr_sftint_l_g;
  wire		rtl_set_sftint_l_g = `TOP_DESIGN.sparc0.tlu.tdp.tlu_set_sftint_l_g;
  wire		rtl_clr_sftint_l_g = `TOP_DESIGN.sparc0.tlu.tdp.tlu_clr_sftint_l_g;
  wire		rtl_clk = `TOP_DESIGN.sparc0.tlu.tdp.rclk;
  wire		rtl_reset = `TOP_DESIGN.sparc0.tlu.tdp.tlu_rst;
*/

  wire		rst_l = ~rtl_reset;
  reg	[16:0]	local_softint0;
  reg	[16:0]	local_softint1;
  reg	[16:0]	local_softint2;
  reg	[16:0]	local_softint3;

  reg		enable;
  //============
  // initialize
  initial begin
    enable = 1'b1;
    if ($test$plusargs("turn_off_softint_check")) enable = 1'b0;
    //else if ($test$plusargs("turn_on_softint_monitor")) enable = 1'b1;
    if (enable) $display("Info: ***** Enabling the SOFTINT-Register Checker *****");
    else        $display("Info: ***** Disabling the SOFTINT-Register Checker *****");
    //local_softint0[16:0] <= {17{1'b0}};
    //local_softint1[16:0] <= {17{1'b0}};
    //local_softint2[16:0] <= {17{1'b0}};
    //local_softint3[16:0] <= {17{1'b0}};
  end

  //=========================
  // SOFTINT0 register update
`ifndef VERILATOR
  always @(posedge rtl_clk or rtl_reset) begin
`else
  always @(posedge rtl_clk) begin
`endif
/*
  always @(rtl_reset or negedge rtl_sftint_en_l_g[0] or negedge rtl_wr_sftint_l_g or negedge rtl_set_sftint_l_g or negedge rtl_clr_sftint_l_g) begin
#1
*/
    if (rtl_reset) begin
      local_softint0[14:1] <= {14{1'b0}};
    end
    else if (~rtl_sftint_en_l_g[0]) begin
      if      (~rtl_wr_sftint_l_g)  local_softint0[14:1] <= rtl_wsr_data_w[14:1];
      else if (~rtl_set_sftint_l_g) local_softint0[14:1] <= (local_softint0[14:1] | rtl_wsr_data_w[14:1]);
      else if (~rtl_clr_sftint_l_g) local_softint0[14:1] <= (local_softint0[14:1] & ~rtl_wsr_data_w[14:1]);
      else                          local_softint0[14:1] <= local_softint0[14:1];
    end
    else begin
      local_softint0[14:1] <= local_softint0[14:1];
    end
  end // always
`ifndef VERILATOR
  always @(posedge rtl_clk or rtl_reset) begin
`else
  always @(posedge rtl_clk) begin
`endif
/*
  always @(rtl_reset or posedge rtl_sftint_b0_en[0] or posedge rtl_tickcmp_int[0] or negedge rtl_wr_sftint_l_g or negedge rtl_set_sftint_l_g or negedge rtl_clr_sftint_l_g) begin
#1
*/
    if (rtl_reset) begin
      local_softint0[0] <= 1'b0;
    end
    else if (rtl_sftint_b0_en[0]) begin
      if      (rtl_tickcmp_int[0])  local_softint0[0] <= 1'b1;
      else if (~rtl_wr_sftint_l_g)  local_softint0[0] <= rtl_wsr_data_w[0];
      else if (~rtl_set_sftint_l_g) local_softint0[0] <= (local_softint0[0] | rtl_wsr_data_w[0]);
      else if (~rtl_clr_sftint_l_g) local_softint0[0] <= (local_softint0[0] & ~rtl_wsr_data_w[0]);
      else                          local_softint0[0] <= local_softint0[0];
    end
    else begin
      local_softint0[0] <= local_softint0[0];
    end
  end // always
`ifndef VERILATOR
  always @(posedge rtl_clk or rtl_reset) begin
`else
  always @(posedge rtl_clk) begin
`endif
/*
  always @(rtl_reset or posedge rtl_sftint_b16_en[0] or posedge rtl_stickcmp_int[0] or negedge rtl_wr_sftint_l_g or negedge rtl_set_sftint_l_g or negedge rtl_clr_sftint_l_g) begin
#1
*/
    if (rtl_reset) begin
      local_softint0[16] <= 1'b0;
    end
    else if (rtl_sftint_b16_en[0]) begin
      if      (rtl_stickcmp_int[0]) local_softint0[16] <= 1'b1;
      else if (~rtl_wr_sftint_l_g)  local_softint0[16] <= rtl_wsr_data_w[16];
      else if (~rtl_set_sftint_l_g) local_softint0[16] <= (local_softint0[16] | rtl_wsr_data_w[16]);
      else if (~rtl_clr_sftint_l_g) local_softint0[16] <= (local_softint0[16] & ~rtl_wsr_data_w[16]);
      else                          local_softint0[16] <= local_softint0[16];
    end
    else begin
      local_softint0[16] <= local_softint0[16];
    end
  end // always
`ifndef VERILATOR
  always @(posedge rtl_clk or rtl_reset) begin
`else
  always @(posedge rtl_clk) begin
`endif
/*
  always @(rtl_reset or posedge rtl_sftint_b15_en[0] or posedge rtl_pib_picl_wrap[0] or posedge rtl_pib_pich_wrap[0] or negedge rtl_wr_sftint_l_g or negedge rtl_set_sftint_l_g or negedge rtl_clr_sftint_l_g) begin
#1
*/
    if (rtl_reset) begin
      local_softint0[15] <= 1'b0;
    end
    else if (rtl_sftint_b15_en[0]) begin
      if      (rtl_pib_picl_wrap[0] | rtl_pib_pich_wrap[0])  local_softint0[15] <= 1'b1;
      else if (~rtl_wr_sftint_l_g)  local_softint0[15] <= rtl_wsr_data_w[15];
      else if (~rtl_set_sftint_l_g) local_softint0[15] <= (local_softint0[15] | rtl_wsr_data_w[15]);
      else if (~rtl_clr_sftint_l_g) local_softint0[15] <= (local_softint0[15] & ~rtl_wsr_data_w[15]);
      else                          local_softint0[15] <= local_softint0[15];
    end
    else begin
      local_softint0[15] <= local_softint0[15];
    end
  end // always

  always @(rtl_softint0) begin
    if (rtl_softint0 != local_softint0) begin
      if (enable & rst_l) begin
        $display("*ERROR*: %0d: softint_mon: Thread0 SOFTINT register MISMATCH: RTL(17'h%x) Vs Expected(17'h%x)", $time, rtl_softint0[16:0], local_softint0[16:0]);
        $display("*Info*: softint_mon: Use -sim_run_args=+turn_off_softint_monitor to disable the softint_mon");
        `MONITOR_PATH.fail("softint_mon: Thread0 SOFTINT register mismatch");
      end
      else begin
        $display("*WARNING*: %0d: softint_mon: Thread0 SOFTINT register MISMATCH: RTL(17'h%x) Vs Expected(17'h%x)", $time, rtl_softint0[16:0], local_softint0[16:0]);
      end
    end
`ifndef VERILATOR
    else begin
      $display("*Info*: %0d: softint_mon: Thread0 SOFTINT register MATCH: RTL(17'h%x) Vs Expected(17'h%x)", $time, rtl_softint0[16:0], local_softint0[16:0]);
    end
`endif // ifndef VERILATOR
  end
  //=========================
  // SOFTINT1 register update
`ifndef VERILATOR
  always @(posedge rtl_clk or rtl_reset) begin
`else
  always @(posedge rtl_clk) begin
`endif
/*
  always @(rtl_reset or negedge rtl_sftint_en_l_g[1] or negedge rtl_wr_sftint_l_g or negedge rtl_set_sftint_l_g or negedge rtl_clr_sftint_l_g) begin
#1
*/
    if (rtl_reset) begin
      local_softint1[14:1] <= {14{1'b0}};
    end
    else if (~rtl_sftint_en_l_g[1]) begin
      if      (~rtl_wr_sftint_l_g)  local_softint1[14:1] <= rtl_wsr_data_w[14:1];
      else if (~rtl_set_sftint_l_g) local_softint1[14:1] <= (local_softint1[14:1] | rtl_wsr_data_w[14:1]);
      else if (~rtl_clr_sftint_l_g) local_softint1[14:1] <= (local_softint1[14:1] & ~rtl_wsr_data_w[14:1]);
      else                          local_softint1[14:1] <= local_softint1[14:1];
    end
    else begin
      local_softint1[14:1] <= local_softint1[14:1];
    end
  end // always
`ifndef VERILATOR
  always @(posedge rtl_clk or rtl_reset) begin
`else
  always @(posedge rtl_clk) begin
`endif
/*
  always @(rtl_reset or posedge rtl_sftint_b0_en[1] or posedge rtl_tickcmp_int[1] or negedge rtl_wr_sftint_l_g or negedge rtl_set_sftint_l_g or negedge rtl_clr_sftint_l_g) begin
#1
*/
    if (rtl_reset) begin
      local_softint1[0] <= 1'b0;
    end
    else if (rtl_sftint_b0_en[1]) begin
      if      (rtl_tickcmp_int[1])  local_softint1[0] <= 1'b1;
      else if (~rtl_wr_sftint_l_g)  local_softint1[0] <= rtl_wsr_data_w[0];
      else if (~rtl_set_sftint_l_g) local_softint1[0] <= (local_softint1[0] | rtl_wsr_data_w[0]);
      else if (~rtl_clr_sftint_l_g) local_softint1[0] <= (local_softint1[0] & ~rtl_wsr_data_w[0]);
      else                          local_softint1[0] <= local_softint1[0];
    end
    else begin
      local_softint1[0] <= local_softint1[0];
    end
  end // always
`ifndef VERILATOR
  always @(posedge rtl_clk or rtl_reset) begin
`else
  always @(posedge rtl_clk) begin
`endif
/*
  always @(rtl_reset or posedge rtl_sftint_b16_en[1] or posedge rtl_stickcmp_int[1] or negedge rtl_wr_sftint_l_g or negedge rtl_set_sftint_l_g or negedge rtl_clr_sftint_l_g) begin
#1
*/
    if (rtl_reset) begin
      local_softint1[16] <= 1'b0;
    end
    else if (rtl_sftint_b16_en[1]) begin
      if      (rtl_stickcmp_int[1]) local_softint1[16] <= 1'b1;
      else if (~rtl_wr_sftint_l_g)  local_softint1[16] <= rtl_wsr_data_w[16];
      else if (~rtl_set_sftint_l_g) local_softint1[16] <= (local_softint1[16] | rtl_wsr_data_w[16]);
      else if (~rtl_clr_sftint_l_g) local_softint1[16] <= (local_softint1[16] & ~rtl_wsr_data_w[16]);
      else                          local_softint1[16] <= local_softint1[16];
    end
    else begin
      local_softint1[16] <= local_softint1[16];
    end
  end // always
`ifndef VERILATOR
  always @(posedge rtl_clk or rtl_reset) begin
`else
  always @(posedge rtl_clk) begin
`endif
/*
  always @(rtl_reset or posedge rtl_sftint_b15_en[1] or posedge rtl_pib_picl_wrap[1] or posedge rtl_pib_pich_wrap[1] or negedge rtl_wr_sftint_l_g or negedge rtl_set_sftint_l_g or negedge rtl_clr_sftint_l_g) begin
#1
*/
    if (rtl_reset) begin
      local_softint1[15] <= 1'b0;
    end
    else if (rtl_sftint_b15_en[1]) begin
      if      (rtl_pib_picl_wrap[1] | rtl_pib_pich_wrap[1])  local_softint1[15] <= 1'b1;
      else if (~rtl_wr_sftint_l_g)  local_softint1[15] <= rtl_wsr_data_w[15];
      else if (~rtl_set_sftint_l_g) local_softint1[15] <= (local_softint1[15] | rtl_wsr_data_w[15]);
      else if (~rtl_clr_sftint_l_g) local_softint1[15] <= (local_softint1[15] & ~rtl_wsr_data_w[15]);
      else                          local_softint1[15] <= local_softint1[15];
    end
    else begin
      local_softint1[15] <= local_softint1[15];
    end
  end // always

  always @(rtl_softint1) begin
    if (rtl_softint1 != local_softint1) begin
      if (enable & rst_l) begin
        $display("*ERROR*: %0d: softint_mon: Thread1 SOFTINT register MISMATCH: RTL(17'h%x) Vs Expected(17'h%x)", $time, rtl_softint1[16:0], local_softint1[16:0]);
        $display("*Info*: softint_mon: Use -sim_run_args=+turn_off_softint_monitor to disable the softint_mon");
        `MONITOR_PATH.fail("softint_mon: Thread1 SOFTINT register mismatch");
      end
      else begin
        $display("*WARNING*: %0d: softint_mon: Thread1 SOFTINT register MISMATCH: RTL(17'h%x) Vs Expected(17'h%x)", $time, rtl_softint1[16:0], local_softint1[16:0]);
      end
    end
`ifndef VERILATOR
    else begin
      $display("*Info*: %0d: softint_mon: Thread1 SOFTINT register MATCH: RTL(17'h%x) Vs Expected(17'h%x)", $time, rtl_softint1[16:0], local_softint1[16:0]);
    end
`endif // ifndef VERILATOR
  end
  //=========================
  // SOFTINT2 register update
`ifndef VERILATOR
  always @(posedge rtl_clk or rtl_reset) begin
`else
  always @(posedge rtl_clk) begin
`endif
/*
  always @(rtl_reset or negedge rtl_sftint_en_l_g[2] or negedge rtl_wr_sftint_l_g or negedge rtl_set_sftint_l_g or negedge rtl_clr_sftint_l_g) begin
#1
*/
    if (rtl_reset) begin
      local_softint2[14:1] <= {14{1'b0}};
    end
    else if (~rtl_sftint_en_l_g[2]) begin
      if      (~rtl_wr_sftint_l_g)  local_softint2[14:1] <= rtl_wsr_data_w[14:1];
      else if (~rtl_set_sftint_l_g) local_softint2[14:1] <= (local_softint2[14:1] | rtl_wsr_data_w[14:1]);
      else if (~rtl_clr_sftint_l_g) local_softint2[14:1] <= (local_softint2[14:1] & ~rtl_wsr_data_w[14:1]);
      else                          local_softint2[14:1] <= local_softint2[14:1];
    end
    else begin
      local_softint2[14:1] <= local_softint2[14:1];
    end
  end // always
`ifndef VERILATOR
  always @(posedge rtl_clk or rtl_reset) begin
`else
  always @(posedge rtl_clk) begin
`endif
/*
  always @(rtl_reset or posedge rtl_sftint_b0_en[2] or posedge rtl_tickcmp_int[2] or negedge rtl_wr_sftint_l_g or negedge rtl_set_sftint_l_g or negedge rtl_clr_sftint_l_g) begin
#1
*/
    if (rtl_reset) begin
      local_softint2[0] <= 1'b0;
    end
    else if (rtl_sftint_b0_en[2]) begin
      if      (rtl_tickcmp_int[2])  local_softint2[0] <= 1'b1;
      else if (~rtl_wr_sftint_l_g)  local_softint2[0] <= rtl_wsr_data_w[0];
      else if (~rtl_set_sftint_l_g) local_softint2[0] <= (local_softint2[0] | rtl_wsr_data_w[0]);
      else if (~rtl_clr_sftint_l_g) local_softint2[0] <= (local_softint2[0] & ~rtl_wsr_data_w[0]);
      else                          local_softint2[0] <= local_softint2[0];
    end
    else begin
      local_softint2[0] <= local_softint2[0];
    end
  end // always
`ifndef VERILATOR
  always @(posedge rtl_clk or rtl_reset) begin
`else
  always @(posedge rtl_clk) begin
`endif
/*
  always @(rtl_reset or posedge rtl_sftint_b16_en[2] or posedge rtl_stickcmp_int[2] or negedge rtl_wr_sftint_l_g or negedge rtl_set_sftint_l_g or negedge rtl_clr_sftint_l_g) begin
#1
*/
    if (rtl_reset) begin
      local_softint2[16] <= 1'b0;
    end
    else if (rtl_sftint_b16_en[2]) begin
      if      (rtl_stickcmp_int[2]) local_softint2[16] <= 1'b1;
      else if (~rtl_wr_sftint_l_g)  local_softint2[16] <= rtl_wsr_data_w[16];
      else if (~rtl_set_sftint_l_g) local_softint2[16] <= (local_softint2[16] | rtl_wsr_data_w[16]);
      else if (~rtl_clr_sftint_l_g) local_softint2[16] <= (local_softint2[16] & ~rtl_wsr_data_w[16]);
      else                          local_softint2[16] <= local_softint2[16];
    end
    else begin
      local_softint2[16] <= local_softint2[16];
    end
  end // always
`ifndef VERILATOR
  always @(posedge rtl_clk or rtl_reset) begin
`else
  always @(posedge rtl_clk) begin
`endif
/*
  always @(rtl_reset or posedge rtl_sftint_b15_en[2] or posedge rtl_pib_picl_wrap[2] or posedge rtl_pib_pich_wrap[2] or negedge rtl_wr_sftint_l_g or negedge rtl_set_sftint_l_g or negedge rtl_clr_sftint_l_g) begin
#1
*/
    if (rtl_reset) begin
      local_softint2[15] <= 1'b0;
    end
    else if (rtl_sftint_b15_en[2]) begin
      if      (rtl_pib_picl_wrap[2] | rtl_pib_pich_wrap[2])  local_softint2[15] <= 1'b1;
      else if (~rtl_wr_sftint_l_g)  local_softint2[15] <= rtl_wsr_data_w[15];
      else if (~rtl_set_sftint_l_g) local_softint2[15] <= (local_softint2[15] | rtl_wsr_data_w[15]);
      else if (~rtl_clr_sftint_l_g) local_softint2[15] <= (local_softint2[15] & ~rtl_wsr_data_w[15]);
      else                          local_softint2[15] <= local_softint2[15];
    end
    else begin
      local_softint2[15] <= local_softint2[15];
    end
  end // always

  always @(rtl_softint2) begin
    if (rtl_softint2 != local_softint2) begin
      if (enable & rst_l) begin
        $display("*ERROR*: %0d: softint_mon: Thread2 SOFTINT register MISMATCH: RTL(17'h%x) Vs Expected(17'h%x)", $time, rtl_softint2[16:0], local_softint2[16:0]);
        $display("*Info*: softint_mon: Use -sim_run_args=+turn_off_softint_monitor to disable the softint_mon");
        `MONITOR_PATH.fail("softint_mon: Thread2 SOFTINT register mismatch");
      end
      else begin
        $display("*WARNING*: %0d: softint_mon: Thread2 SOFTINT register MISMATCH: RTL(17'h%x) Vs Expected(17'h%x)", $time, rtl_softint2[16:0], local_softint2[16:0]);
      end
    end
`ifndef VERILATOR
    else begin
      $display("*Info*: %0d: softint_mon: Thread2 SOFTINT register MATCH: RTL(17'h%x) Vs Expected(17'h%x)", $time, rtl_softint2[16:0], local_softint2[16:0]);
    end
`endif // ifndef VERILATOR
  end
  //=========================
  // SOFTINT3 register update
`ifndef VERILATOR
  always @(posedge rtl_clk or rtl_reset) begin
`else
  always @(posedge rtl_clk) begin
`endif
/*
  always @(rtl_reset or negedge rtl_sftint_en_l_g[3] or negedge rtl_wr_sftint_l_g or negedge rtl_set_sftint_l_g or negedge rtl_clr_sftint_l_g) begin
#1
*/
    if (rtl_reset) begin
      local_softint3[14:1] <= {14{1'b0}};
    end
    else if (~rtl_sftint_en_l_g[3]) begin
      if      (~rtl_wr_sftint_l_g)  local_softint3[14:1] <= rtl_wsr_data_w[14:1];
      else if (~rtl_set_sftint_l_g) local_softint3[14:1] <= (local_softint3[14:1] | rtl_wsr_data_w[14:1]);
      else if (~rtl_clr_sftint_l_g) local_softint3[14:1] <= (local_softint3[14:1] & ~rtl_wsr_data_w[14:1]);
      else                          local_softint3[14:1] <= local_softint3[14:1];
    end
    else begin
      local_softint3[14:1] <= local_softint3[14:1];
    end
  end // always
`ifndef VERILATOR
  always @(posedge rtl_clk or rtl_reset) begin
`else
  always @(posedge rtl_clk) begin
`endif
/*
  always @(rtl_reset or posedge rtl_sftint_b0_en[3] or posedge rtl_tickcmp_int[3] or negedge rtl_wr_sftint_l_g or negedge rtl_set_sftint_l_g or negedge rtl_clr_sftint_l_g) begin
#1
*/
    if (rtl_reset) begin
      local_softint3[0] <= 1'b0;
    end
    else if (rtl_sftint_b0_en[3]) begin
      if      (rtl_tickcmp_int[3])  local_softint3[0] <= 1'b1;
      else if (~rtl_wr_sftint_l_g)  local_softint3[0] <= rtl_wsr_data_w[0];
      else if (~rtl_set_sftint_l_g) local_softint3[0] <= (local_softint3[0] | rtl_wsr_data_w[0]);
      else if (~rtl_clr_sftint_l_g) local_softint3[0] <= (local_softint3[0] & ~rtl_wsr_data_w[0]);
      else                          local_softint3[0] <= local_softint3[0];
    end
    else begin
      local_softint3[0] <= local_softint3[0];
    end
  end // always
`ifndef VERILATOR
  always @(posedge rtl_clk or rtl_reset) begin
`else
  always @(posedge rtl_clk) begin
`endif
/*
  always @(rtl_reset or posedge rtl_sftint_b16_en[3] or posedge rtl_stickcmp_int[3] or negedge rtl_wr_sftint_l_g or negedge rtl_set_sftint_l_g or negedge rtl_clr_sftint_l_g) begin
#1
*/
    if (rtl_reset) begin
      local_softint3[16] <= 1'b0;
    end
    else if (rtl_sftint_b16_en[3]) begin
      if      (rtl_stickcmp_int[3]) local_softint3[16] <= 1'b1;
      else if (~rtl_wr_sftint_l_g)  local_softint3[16] <= rtl_wsr_data_w[16];
      else if (~rtl_set_sftint_l_g) local_softint3[16] <= (local_softint3[16] | rtl_wsr_data_w[16]);
      else if (~rtl_clr_sftint_l_g) local_softint3[16] <= (local_softint3[16] & ~rtl_wsr_data_w[16]);
      else                          local_softint3[16] <= local_softint3[16];
    end
    else begin
      local_softint3[16] <= local_softint3[16];
    end
  end // always
`ifndef VERILATOR
  always @(posedge rtl_clk or rtl_reset) begin
`else
  always @(posedge rtl_clk) begin
`endif
/*
  always @(rtl_reset or posedge rtl_sftint_b15_en[3] or posedge rtl_pib_picl_wrap[3] or posedge rtl_pib_pich_wrap[3] or negedge rtl_wr_sftint_l_g or negedge rtl_set_sftint_l_g or negedge rtl_clr_sftint_l_g) begin
#1
*/
    if (rtl_reset) begin
      local_softint3[15] <= 1'b0;
    end
    else if (rtl_sftint_b15_en[3]) begin
      if      (rtl_pib_picl_wrap[3] | rtl_pib_pich_wrap[3])  local_softint3[15] <= 1'b1;
      else if (~rtl_wr_sftint_l_g)  local_softint3[15] <= rtl_wsr_data_w[15];
      else if (~rtl_set_sftint_l_g) local_softint3[15] <= (local_softint3[15] | rtl_wsr_data_w[15]);
      else if (~rtl_clr_sftint_l_g) local_softint3[15] <= (local_softint3[15] & ~rtl_wsr_data_w[15]);
      else                          local_softint3[15] <= local_softint3[15];
    end
    else begin
      local_softint3[15] <= local_softint3[15];
    end
  end // always

  always @(rtl_softint3) begin
    if (rtl_softint3 != local_softint3) begin
      if (enable & rst_l) begin
        $display("*ERROR*: %0d: softint_mon: Thread3 SOFTINT register MISMATCH: RTL(17'h%x) Vs Expected(17'h%x)", $time, rtl_softint3[16:0], local_softint3[16:0]);
        $display("*Info*: softint_mon: Use -sim_run_args=+turn_off_softint_monitor to disable the softint_mon");
        `MONITOR_PATH.fail("softint_mon: Thread3 SOFTINT register mismatch");
      end
      else begin
        $display("*WARNING*: %0d: softint_mon: Thread3 SOFTINT register MISMATCH: RTL(17'h%x) Vs Expected(17'h%x)", $time, rtl_softint3[16:0], local_softint3[16:0]);
      end
    end
`ifndef VERILATOR
    else begin
      $display("*Info*: %0d: softint_mon: Thread3 SOFTINT register MATCH: RTL(17'h%x) Vs Expected(17'h%x)", $time, rtl_softint3[16:0], local_softint3[16:0]);
    end
`endif // ifndef VERILATOR
  end

endmodule
////////////////////////// //T H E    E N D //////////////////////////
