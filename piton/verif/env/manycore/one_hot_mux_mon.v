// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: one_hot_mux_mon.v
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
////////////////////////////////////////////////////////////////////////////////
// WARNING: Do not modify this file directly. This file was generated using pal.
// Please make all modifications to one_hot_mux_mon.vpal and run
// % pal -r -o one_hot_mux_mon.v one_hot_mux_mon.vpal to generate this file.
//
//
////////////////////////////////////////////////////////////////////////////////

`include "cross_module.h"
`include "sys.h"
`include "iop.h"

module one_hot_mux_mon ();

wire clk = cmp_top.iop.sparc0.rclk ;
wire rst_l = cmp_top.iop.sparc0.spc_grst_l ;
reg check_on ;
reg rst_done ;

////////////////////////////////////////////////////////////////////////////////
// Look for proper reset deassertion
////////////////////////////////////////////////////////////////////////////////

initial begin
  rst_done = 1'b0 ;
  repeat (4) @(posedge cmp_top.iop.sparc0.rclk) ;
  @(posedge cmp_top.iop.sparc0.spc_grst_l) ;
  repeat (4) @(posedge cmp_top.iop.sparc0.rclk) ;
  rst_done = 1'b1 ;
end

////////////////////////////////////////////////////////////////////////////////
// enable/disable using a +arg
////////////////////////////////////////////////////////////////////////////////

initial begin
  check_on = 0 ;
  if ($test$plusargs("one_hot_mux_mon_on")) begin
    check_on = 1 ;
  end
end

////////////////////////////////////////////////////////////////////////////////
// check one hot sel for 3 sel muxes
////////////////////////////////////////////////////////////////////////////////

task one_hot_mux3 ;
  input rst_l ;
  input [2:0] sel ;
  input [4095:0] name ;

  if (rst_l) begin
    if ((sel !== 3'b001) &&
        (sel !== 3'b010) && 
        (sel !== 3'b100)) begin
      $display("%0d : ERROR : %0s is not one hot, it has the value %3b\n", $time, name, sel) ;
      $finish() ;
    end
  end
endtask

////////////////////////////////////////////////////////////////////////////////
// check one hot sel for 4 sel muxes
////////////////////////////////////////////////////////////////////////////////

task one_hot_mux4 ;
  input rst_l ;
  input [3:0] sel ;
  input [4095:0] name ;

  if (rst_l) begin
    if ((sel !== 4'b0001) &&
        (sel !== 4'b0010) &&
        (sel !== 4'b0100) &&
        (sel !== 4'b1000)) begin
      $display("%0d : ERROR : %0s is not one hot, it has the value %4b\n", $time, name, sel) ;
      $finish() ;
    end
  end
endtask


`ifdef RTL_SPARC0

always @(posedge clk) begin
  if (rst_done && check_on) begin
    one_hot_mux3 (rst_l, `TOP_DESIGN.sparc0.ifu.icd.icden_mux.sel, "sparc0.ifu.icd.icden_mux") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.dcdp.align_byte1_1h_mx.sel, "sparc0.lsu.dcdp.align_byte1_1h_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.dcdp.align_byte2_1st_mx.sel, "sparc0.lsu.dcdp.align_byte2_1st_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.dcdp.align_byte3_1st_mx.sel, "sparc0.lsu.dcdp.align_byte3_1st_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.dctldp.tlb_ctxt_mux.sel, "sparc0.lsu.dctldp.tlb_ctxt_mux") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.qdp1.ldbyp0_data_mx.sel, "sparc0.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc0.lsu.qdp1.ldbyp0_ldxa_mx") ;
`ifdef FPGA_SYN_1THREAD

`elsif THREADS_1

`elsif THREADS_2

    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.qdp1.ldbyp1_data_mx.sel, "sparc0.lsu.qdp1.ldbyp1_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.qdp1.ldbyp1_ldxa_mx.sel, "sparc0.lsu.qdp1.ldbyp1_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.qdp1.lmq_dthrd_sel1.sel, "sparc0.lsu.qdp1.lmq_dthrd_sel1") ;

`elsif THREADS_3

    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.qdp1.ldbyp1_data_mx.sel, "sparc0.lsu.qdp1.ldbyp1_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.qdp1.ldbyp1_ldxa_mx.sel, "sparc0.lsu.qdp1.ldbyp1_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.qdp1.ldbyp2_data_mx.sel, "sparc0.lsu.qdp1.ldbyp2_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.qdp1.ldbyp2_ldxa_mx.sel, "sparc0.lsu.qdp1.ldbyp2_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.qdp1.lmq_dthrd_sel1.sel, "sparc0.lsu.qdp1.lmq_dthrd_sel1") ;

`else
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.qdp1.ldbyp1_data_mx.sel, "sparc0.lsu.qdp1.ldbyp1_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.qdp1.ldbyp1_ldxa_mx.sel, "sparc0.lsu.qdp1.ldbyp1_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.qdp1.ldbyp2_data_mx.sel, "sparc0.lsu.qdp1.ldbyp2_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.qdp1.ldbyp2_ldxa_mx.sel, "sparc0.lsu.qdp1.ldbyp2_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.qdp1.ldbyp3_data_mx.sel, "sparc0.lsu.qdp1.ldbyp3_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.qdp1.ldbyp3_ldxa_mx.sel, "sparc0.lsu.qdp1.ldbyp3_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.qdp1.lmq_dthrd_sel1.sel, "sparc0.lsu.qdp1.lmq_dthrd_sel1") ;
`endif
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.stb_rwdp.swap_byte0_mx.sel, "sparc0.lsu.stb_rwdp.swap_byte0_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.stb_rwdp.swap_byte1_mx.sel, "sparc0.lsu.stb_rwdp.swap_byte1_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.stb_rwdp.swap_byte2_mx.sel, "sparc0.lsu.stb_rwdp.swap_byte2_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.stb_rwdp.swap_byte3_mx.sel, "sparc0.lsu.stb_rwdp.swap_byte3_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.stb_rwdp.swap_byte4_mx.sel, "sparc0.lsu.stb_rwdp.swap_byte4_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.stb_rwdp.swap_byte5_mx.sel, "sparc0.lsu.stb_rwdp.swap_byte5_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.stb_rwdp.swap_byte6_mx.sel, "sparc0.lsu.stb_rwdp.swap_byte6_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.stb_rwdp.swap_byte7_mx.sel, "sparc0.lsu.stb_rwdp.swap_byte7_mx") ;
    one_hot_mux3 (rst_l, `TOP_DESIGN.sparc0.tlu.mmu_dp.dtag_access_dsel.sel, "sparc0.tlu.mmu_dp.dtag_access_dsel") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc0.lsu.qdp2.st_dcfill_wrway_sel_b54.sel, "sparc0.lsu.qdp2.st_dcfill_wrway_sel_b54") ;
  end
end

`endif


`ifdef RTL_SPARC1

always @(posedge clk) begin
  if (rst_done && check_on) begin
    one_hot_mux3 (rst_l, `TOP_DESIGN.sparc1.ifu.icd.icden_mux.sel, "sparc1.ifu.icd.icden_mux") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.dcdp.align_byte1_1h_mx.sel, "sparc1.lsu.dcdp.align_byte1_1h_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.dcdp.align_byte2_1st_mx.sel, "sparc1.lsu.dcdp.align_byte2_1st_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.dcdp.align_byte3_1st_mx.sel, "sparc1.lsu.dcdp.align_byte3_1st_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.dctldp.tlb_ctxt_mux.sel, "sparc1.lsu.dctldp.tlb_ctxt_mux") ;

`ifdef THREADS_1
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.qdp1.ldbyp0_data_mx.sel, "sparc1.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc1.lsu.qdp1.ldbyp0_ldxa_mx") ;
`elsif THREADS_2
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.qdp1.ldbyp0_data_mx.sel, "sparc1.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc1.lsu.qdp1.ldbyp0_ldxa_mx") ; 
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.qdp1.ldbyp1_data_mx.sel, "sparc1.lsu.qdp1.ldbyp1_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.qdp1.ldbyp1_ldxa_mx.sel, "sparc1.lsu.qdp1.ldbyp1_ldxa_mx") ;
`elsif THREADS_3
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.qdp1.ldbyp0_data_mx.sel, "sparc1.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc1.lsu.qdp1.ldbyp0_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.qdp1.ldbyp1_data_mx.sel, "sparc1.lsu.qdp1.ldbyp1_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.qdp1.ldbyp1_ldxa_mx.sel, "sparc1.lsu.qdp1.ldbyp1_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.qdp1.ldbyp2_data_mx.sel, "sparc1.lsu.qdp1.ldbyp2_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.qdp1.ldbyp2_ldxa_mx.sel, "sparc1.lsu.qdp1.ldbyp2_ldxa_mx") ;
`else
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.qdp1.ldbyp0_data_mx.sel, "sparc1.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc1.lsu.qdp1.ldbyp0_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.qdp1.ldbyp1_data_mx.sel, "sparc1.lsu.qdp1.ldbyp1_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.qdp1.ldbyp1_ldxa_mx.sel, "sparc1.lsu.qdp1.ldbyp1_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.qdp1.ldbyp2_data_mx.sel, "sparc1.lsu.qdp1.ldbyp2_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.qdp1.ldbyp2_ldxa_mx.sel, "sparc1.lsu.qdp1.ldbyp2_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.qdp1.ldbyp3_data_mx.sel, "sparc1.lsu.qdp1.ldbyp3_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.qdp1.ldbyp3_ldxa_mx.sel, "sparc1.lsu.qdp1.ldbyp3_ldxa_mx") ;
`endif
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.qdp1.lmq_dthrd_sel1.sel, "sparc1.lsu.qdp1.lmq_dthrd_sel1") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.stb_rwdp.swap_byte0_mx.sel, "sparc1.lsu.stb_rwdp.swap_byte0_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.stb_rwdp.swap_byte1_mx.sel, "sparc1.lsu.stb_rwdp.swap_byte1_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.stb_rwdp.swap_byte2_mx.sel, "sparc1.lsu.stb_rwdp.swap_byte2_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.stb_rwdp.swap_byte3_mx.sel, "sparc1.lsu.stb_rwdp.swap_byte3_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.stb_rwdp.swap_byte4_mx.sel, "sparc1.lsu.stb_rwdp.swap_byte4_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.stb_rwdp.swap_byte5_mx.sel, "sparc1.lsu.stb_rwdp.swap_byte5_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.stb_rwdp.swap_byte6_mx.sel, "sparc1.lsu.stb_rwdp.swap_byte6_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.stb_rwdp.swap_byte7_mx.sel, "sparc1.lsu.stb_rwdp.swap_byte7_mx") ;
    one_hot_mux3 (rst_l, `TOP_DESIGN.sparc1.tlu.mmu_dp.dtag_access_dsel.sel, "sparc1.tlu.mmu_dp.dtag_access_dsel") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc1.lsu.qdp2.st_dcfill_wrway_sel_b54.sel, "sparc1.lsu.qdp2.st_dcfill_wrway_sel_b54") ;
  end
end

`endif


`ifdef RTL_SPARC2

always @(posedge clk) begin
  if (rst_done && check_on) begin
    one_hot_mux3 (rst_l, `TOP_DESIGN.sparc2.ifu.icd.icden_mux.sel, "sparc2.ifu.icd.icden_mux") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.dcdp.align_byte1_1h_mx.sel, "sparc2.lsu.dcdp.align_byte1_1h_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.dcdp.align_byte2_1st_mx.sel, "sparc2.lsu.dcdp.align_byte2_1st_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.dcdp.align_byte3_1st_mx.sel, "sparc2.lsu.dcdp.align_byte3_1st_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.dctldp.tlb_ctxt_mux.sel, "sparc2.lsu.dctldp.tlb_ctxt_mux") ;
`ifdef THREADS_1
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.qdp1.ldbyp0_data_mx.sel, "sparc2.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc2.lsu.qdp1.ldbyp0_ldxa_mx") ; 
`elsif THREADS_2
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.qdp1.ldbyp0_data_mx.sel, "sparc2.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc2.lsu.qdp1.ldbyp0_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.qdp1.ldbyp1_data_mx.sel, "sparc2.lsu.qdp1.ldbyp1_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.qdp1.ldbyp1_ldxa_mx.sel, "sparc2.lsu.qdp1.ldbyp1_ldxa_mx") ;
`elsif THREADS_3
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.qdp1.ldbyp0_data_mx.sel, "sparc2.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc2.lsu.qdp1.ldbyp0_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.qdp1.ldbyp1_data_mx.sel, "sparc2.lsu.qdp1.ldbyp1_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.qdp1.ldbyp1_ldxa_mx.sel, "sparc2.lsu.qdp1.ldbyp1_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.qdp1.ldbyp2_data_mx.sel, "sparc2.lsu.qdp1.ldbyp2_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.qdp1.ldbyp2_ldxa_mx.sel, "sparc2.lsu.qdp1.ldbyp2_ldxa_mx") ;
`else
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.qdp1.ldbyp0_data_mx.sel, "sparc2.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc2.lsu.qdp1.ldbyp0_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.qdp1.ldbyp1_data_mx.sel, "sparc2.lsu.qdp1.ldbyp1_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.qdp1.ldbyp1_ldxa_mx.sel, "sparc2.lsu.qdp1.ldbyp1_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.qdp1.ldbyp2_data_mx.sel, "sparc2.lsu.qdp1.ldbyp2_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.qdp1.ldbyp2_ldxa_mx.sel, "sparc2.lsu.qdp1.ldbyp2_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.qdp1.ldbyp3_data_mx.sel, "sparc2.lsu.qdp1.ldbyp3_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.qdp1.ldbyp3_ldxa_mx.sel, "sparc2.lsu.qdp1.ldbyp3_ldxa_mx") ;
`endif
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.qdp1.lmq_dthrd_sel1.sel, "sparc2.lsu.qdp1.lmq_dthrd_sel1") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.stb_rwdp.swap_byte0_mx.sel, "sparc2.lsu.stb_rwdp.swap_byte0_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.stb_rwdp.swap_byte1_mx.sel, "sparc2.lsu.stb_rwdp.swap_byte1_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.stb_rwdp.swap_byte2_mx.sel, "sparc2.lsu.stb_rwdp.swap_byte2_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.stb_rwdp.swap_byte3_mx.sel, "sparc2.lsu.stb_rwdp.swap_byte3_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.stb_rwdp.swap_byte4_mx.sel, "sparc2.lsu.stb_rwdp.swap_byte4_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.stb_rwdp.swap_byte5_mx.sel, "sparc2.lsu.stb_rwdp.swap_byte5_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.stb_rwdp.swap_byte6_mx.sel, "sparc2.lsu.stb_rwdp.swap_byte6_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.stb_rwdp.swap_byte7_mx.sel, "sparc2.lsu.stb_rwdp.swap_byte7_mx") ;
    one_hot_mux3 (rst_l, `TOP_DESIGN.sparc2.tlu.mmu_dp.dtag_access_dsel.sel, "sparc2.tlu.mmu_dp.dtag_access_dsel") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc2.lsu.qdp2.st_dcfill_wrway_sel_b54.sel, "sparc2.lsu.qdp2.st_dcfill_wrway_sel_b54") ;
  end
end

`endif


`ifdef RTL_SPARC3

always @(posedge clk) begin
  if (rst_done && check_on) begin
    one_hot_mux3 (rst_l, `TOP_DESIGN.sparc3.ifu.icd.icden_mux.sel, "sparc3.ifu.icd.icden_mux") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.dcdp.align_byte1_1h_mx.sel, "sparc3.lsu.dcdp.align_byte1_1h_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.dcdp.align_byte2_1st_mx.sel, "sparc3.lsu.dcdp.align_byte2_1st_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.dcdp.align_byte3_1st_mx.sel, "sparc3.lsu.dcdp.align_byte3_1st_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.dctldp.tlb_ctxt_mux.sel, "sparc3.lsu.dctldp.tlb_ctxt_mux") ;
`ifdef THREADS_1
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.qdp1.ldbyp0_data_mx.sel, "sparc3.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc3.lsu.qdp1.ldbyp0_ldxa_mx") ;
`elsif THREADS_2
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.qdp1.ldbyp0_data_mx.sel, "sparc3.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc3.lsu.qdp1.ldbyp0_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.qdp1.ldbyp1_data_mx.sel, "sparc3.lsu.qdp1.ldbyp1_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.qdp1.ldbyp1_ldxa_mx.sel, "sparc3.lsu.qdp1.ldbyp1_ldxa_mx") ;
`elsif THREADS_3
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.qdp1.ldbyp0_data_mx.sel, "sparc3.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc3.lsu.qdp1.ldbyp0_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.qdp1.ldbyp1_data_mx.sel, "sparc3.lsu.qdp1.ldbyp1_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.qdp1.ldbyp1_ldxa_mx.sel, "sparc3.lsu.qdp1.ldbyp1_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.qdp1.ldbyp2_data_mx.sel, "sparc3.lsu.qdp1.ldbyp2_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.qdp1.ldbyp2_ldxa_mx.sel, "sparc3.lsu.qdp1.ldbyp2_ldxa_mx") ;
`else
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.qdp1.ldbyp0_data_mx.sel, "sparc3.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc3.lsu.qdp1.ldbyp0_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.qdp1.ldbyp1_data_mx.sel, "sparc3.lsu.qdp1.ldbyp1_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.qdp1.ldbyp1_ldxa_mx.sel, "sparc3.lsu.qdp1.ldbyp1_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.qdp1.ldbyp2_data_mx.sel, "sparc3.lsu.qdp1.ldbyp2_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.qdp1.ldbyp2_ldxa_mx.sel, "sparc3.lsu.qdp1.ldbyp2_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.qdp1.ldbyp3_data_mx.sel, "sparc3.lsu.qdp1.ldbyp3_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.qdp1.ldbyp3_ldxa_mx.sel, "sparc3.lsu.qdp1.ldbyp3_ldxa_mx") ;
`endif
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.qdp1.lmq_dthrd_sel1.sel, "sparc3.lsu.qdp1.lmq_dthrd_sel1") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.stb_rwdp.swap_byte0_mx.sel, "sparc3.lsu.stb_rwdp.swap_byte0_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.stb_rwdp.swap_byte1_mx.sel, "sparc3.lsu.stb_rwdp.swap_byte1_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.stb_rwdp.swap_byte2_mx.sel, "sparc3.lsu.stb_rwdp.swap_byte2_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.stb_rwdp.swap_byte3_mx.sel, "sparc3.lsu.stb_rwdp.swap_byte3_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.stb_rwdp.swap_byte4_mx.sel, "sparc3.lsu.stb_rwdp.swap_byte4_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.stb_rwdp.swap_byte5_mx.sel, "sparc3.lsu.stb_rwdp.swap_byte5_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.stb_rwdp.swap_byte6_mx.sel, "sparc3.lsu.stb_rwdp.swap_byte6_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.stb_rwdp.swap_byte7_mx.sel, "sparc3.lsu.stb_rwdp.swap_byte7_mx") ;
    one_hot_mux3 (rst_l, `TOP_DESIGN.sparc3.tlu.mmu_dp.dtag_access_dsel.sel, "sparc3.tlu.mmu_dp.dtag_access_dsel") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc3.lsu.qdp2.st_dcfill_wrway_sel_b54.sel, "sparc3.lsu.qdp2.st_dcfill_wrway_sel_b54") ;
  end
end

`endif


`ifdef RTL_SPARC4

always @(posedge clk) begin
  if (rst_done && check_on) begin
    one_hot_mux3 (rst_l, `TOP_DESIGN.sparc4.ifu.icd.icden_mux.sel, "sparc4.ifu.icd.icden_mux") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.dcdp.align_byte1_1h_mx.sel, "sparc4.lsu.dcdp.align_byte1_1h_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.dcdp.align_byte2_1st_mx.sel, "sparc4.lsu.dcdp.align_byte2_1st_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.dcdp.align_byte3_1st_mx.sel, "sparc4.lsu.dcdp.align_byte3_1st_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.dctldp.tlb_ctxt_mux.sel, "sparc4.lsu.dctldp.tlb_ctxt_mux") ;
`ifdef THREADS_1
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.qdp1.ldbyp0_data_mx.sel, "sparc4.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc4.lsu.qdp1.ldbyp0_ldxa_mx") ;
`elsif THREADS_2
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.qdp1.ldbyp0_data_mx.sel, "sparc4.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc4.lsu.qdp1.ldbyp0_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.qdp1.ldbyp1_data_mx.sel, "sparc4.lsu.qdp1.ldbyp1_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.qdp1.ldbyp1_ldxa_mx.sel, "sparc4.lsu.qdp1.ldbyp1_ldxa_mx") ;
`elsif THREADS_3
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.qdp1.ldbyp0_data_mx.sel, "sparc4.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc4.lsu.qdp1.ldbyp0_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.qdp1.ldbyp1_data_mx.sel, "sparc4.lsu.qdp1.ldbyp1_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.qdp1.ldbyp1_ldxa_mx.sel, "sparc4.lsu.qdp1.ldbyp1_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.qdp1.ldbyp2_data_mx.sel, "sparc4.lsu.qdp1.ldbyp2_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.qdp1.ldbyp2_ldxa_mx.sel, "sparc4.lsu.qdp1.ldbyp2_ldxa_mx") ;
`else
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.qdp1.ldbyp0_data_mx.sel, "sparc4.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc4.lsu.qdp1.ldbyp0_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.qdp1.ldbyp1_data_mx.sel, "sparc4.lsu.qdp1.ldbyp1_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.qdp1.ldbyp1_ldxa_mx.sel, "sparc4.lsu.qdp1.ldbyp1_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.qdp1.ldbyp2_data_mx.sel, "sparc4.lsu.qdp1.ldbyp2_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.qdp1.ldbyp2_ldxa_mx.sel, "sparc4.lsu.qdp1.ldbyp2_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.qdp1.ldbyp3_data_mx.sel, "sparc4.lsu.qdp1.ldbyp3_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.qdp1.ldbyp3_ldxa_mx.sel, "sparc4.lsu.qdp1.ldbyp3_ldxa_mx") ;
`endif
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.qdp1.lmq_dthrd_sel1.sel, "sparc4.lsu.qdp1.lmq_dthrd_sel1") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.stb_rwdp.swap_byte0_mx.sel, "sparc4.lsu.stb_rwdp.swap_byte0_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.stb_rwdp.swap_byte1_mx.sel, "sparc4.lsu.stb_rwdp.swap_byte1_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.stb_rwdp.swap_byte2_mx.sel, "sparc4.lsu.stb_rwdp.swap_byte2_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.stb_rwdp.swap_byte3_mx.sel, "sparc4.lsu.stb_rwdp.swap_byte3_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.stb_rwdp.swap_byte4_mx.sel, "sparc4.lsu.stb_rwdp.swap_byte4_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.stb_rwdp.swap_byte5_mx.sel, "sparc4.lsu.stb_rwdp.swap_byte5_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.stb_rwdp.swap_byte6_mx.sel, "sparc4.lsu.stb_rwdp.swap_byte6_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.stb_rwdp.swap_byte7_mx.sel, "sparc4.lsu.stb_rwdp.swap_byte7_mx") ;
    one_hot_mux3 (rst_l, `TOP_DESIGN.sparc4.tlu.mmu_dp.dtag_access_dsel.sel, "sparc4.tlu.mmu_dp.dtag_access_dsel") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc4.lsu.qdp2.st_dcfill_wrway_sel_b54.sel, "sparc4.lsu.qdp2.st_dcfill_wrway_sel_b54") ;
  end
end

`endif


`ifdef RTL_SPARC5

always @(posedge clk) begin
  if (rst_done && check_on) begin
    one_hot_mux3 (rst_l, `TOP_DESIGN.sparc5.ifu.icd.icden_mux.sel, "sparc5.ifu.icd.icden_mux") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.dcdp.align_byte1_1h_mx.sel, "sparc5.lsu.dcdp.align_byte1_1h_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.dcdp.align_byte2_1st_mx.sel, "sparc5.lsu.dcdp.align_byte2_1st_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.dcdp.align_byte3_1st_mx.sel, "sparc5.lsu.dcdp.align_byte3_1st_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.dctldp.tlb_ctxt_mux.sel, "sparc5.lsu.dctldp.tlb_ctxt_mux") ;
`ifdef THREADS_1
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.qdp1.ldbyp0_data_mx.sel, "sparc5.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc5.lsu.qdp1.ldbyp0_ldxa_mx") ;
`elsif THREADS_2
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.qdp1.ldbyp0_data_mx.sel, "sparc5.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc5.lsu.qdp1.ldbyp0_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.qdp1.ldbyp1_data_mx.sel, "sparc5.lsu.qdp1.ldbyp1_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.qdp1.ldbyp1_ldxa_mx.sel, "sparc5.lsu.qdp1.ldbyp1_ldxa_mx") ;
`elsif THREADS_3
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.qdp1.ldbyp0_data_mx.sel, "sparc5.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc5.lsu.qdp1.ldbyp0_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.qdp1.ldbyp1_data_mx.sel, "sparc5.lsu.qdp1.ldbyp1_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.qdp1.ldbyp1_ldxa_mx.sel, "sparc5.lsu.qdp1.ldbyp1_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.qdp1.ldbyp2_data_mx.sel, "sparc5.lsu.qdp1.ldbyp2_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.qdp1.ldbyp2_ldxa_mx.sel, "sparc5.lsu.qdp1.ldbyp2_ldxa_mx") ;
`else
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.qdp1.ldbyp0_data_mx.sel, "sparc5.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc5.lsu.qdp1.ldbyp0_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.qdp1.ldbyp1_data_mx.sel, "sparc5.lsu.qdp1.ldbyp1_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.qdp1.ldbyp1_ldxa_mx.sel, "sparc5.lsu.qdp1.ldbyp1_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.qdp1.ldbyp2_data_mx.sel, "sparc5.lsu.qdp1.ldbyp2_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.qdp1.ldbyp2_ldxa_mx.sel, "sparc5.lsu.qdp1.ldbyp2_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.qdp1.ldbyp3_data_mx.sel, "sparc5.lsu.qdp1.ldbyp3_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.qdp1.ldbyp3_ldxa_mx.sel, "sparc5.lsu.qdp1.ldbyp3_ldxa_mx") ;
`endif
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.qdp1.lmq_dthrd_sel1.sel, "sparc5.lsu.qdp1.lmq_dthrd_sel1") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.stb_rwdp.swap_byte0_mx.sel, "sparc5.lsu.stb_rwdp.swap_byte0_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.stb_rwdp.swap_byte1_mx.sel, "sparc5.lsu.stb_rwdp.swap_byte1_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.stb_rwdp.swap_byte2_mx.sel, "sparc5.lsu.stb_rwdp.swap_byte2_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.stb_rwdp.swap_byte3_mx.sel, "sparc5.lsu.stb_rwdp.swap_byte3_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.stb_rwdp.swap_byte4_mx.sel, "sparc5.lsu.stb_rwdp.swap_byte4_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.stb_rwdp.swap_byte5_mx.sel, "sparc5.lsu.stb_rwdp.swap_byte5_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.stb_rwdp.swap_byte6_mx.sel, "sparc5.lsu.stb_rwdp.swap_byte6_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.stb_rwdp.swap_byte7_mx.sel, "sparc5.lsu.stb_rwdp.swap_byte7_mx") ;
    one_hot_mux3 (rst_l, `TOP_DESIGN.sparc5.tlu.mmu_dp.dtag_access_dsel.sel, "sparc5.tlu.mmu_dp.dtag_access_dsel") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc5.lsu.qdp2.st_dcfill_wrway_sel_b54.sel, "sparc5.lsu.qdp2.st_dcfill_wrway_sel_b54") ;
  end
end

`endif


`ifdef RTL_SPARC6

always @(posedge clk) begin
  if (rst_done && check_on) begin
    one_hot_mux3 (rst_l, `TOP_DESIGN.sparc6.ifu.icd.icden_mux.sel, "sparc6.ifu.icd.icden_mux") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.dcdp.align_byte1_1h_mx.sel, "sparc6.lsu.dcdp.align_byte1_1h_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.dcdp.align_byte2_1st_mx.sel, "sparc6.lsu.dcdp.align_byte2_1st_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.dcdp.align_byte3_1st_mx.sel, "sparc6.lsu.dcdp.align_byte3_1st_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.dctldp.tlb_ctxt_mux.sel, "sparc6.lsu.dctldp.tlb_ctxt_mux") ;
`ifdef THREADS_1
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.qdp1.ldbyp0_data_mx.sel, "sparc6.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc6.lsu.qdp1.ldbyp0_ldxa_mx") ;
`elsif THREADS_2
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.qdp1.ldbyp0_data_mx.sel, "sparc6.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc6.lsu.qdp1.ldbyp0_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.qdp1.ldbyp1_data_mx.sel, "sparc6.lsu.qdp1.ldbyp1_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.qdp1.ldbyp1_ldxa_mx.sel, "sparc6.lsu.qdp1.ldbyp1_ldxa_mx") ;
`elsif THREADS_3
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.qdp1.ldbyp0_data_mx.sel, "sparc6.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc6.lsu.qdp1.ldbyp0_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.qdp1.ldbyp1_data_mx.sel, "sparc6.lsu.qdp1.ldbyp1_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.qdp1.ldbyp1_ldxa_mx.sel, "sparc6.lsu.qdp1.ldbyp1_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.qdp1.ldbyp2_data_mx.sel, "sparc6.lsu.qdp1.ldbyp2_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.qdp1.ldbyp2_ldxa_mx.sel, "sparc6.lsu.qdp1.ldbyp2_ldxa_mx") ;
`else
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.qdp1.ldbyp0_data_mx.sel, "sparc6.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc6.lsu.qdp1.ldbyp0_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.qdp1.ldbyp1_data_mx.sel, "sparc6.lsu.qdp1.ldbyp1_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.qdp1.ldbyp1_ldxa_mx.sel, "sparc6.lsu.qdp1.ldbyp1_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.qdp1.ldbyp2_data_mx.sel, "sparc6.lsu.qdp1.ldbyp2_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.qdp1.ldbyp2_ldxa_mx.sel, "sparc6.lsu.qdp1.ldbyp2_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.qdp1.ldbyp3_data_mx.sel, "sparc6.lsu.qdp1.ldbyp3_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.qdp1.ldbyp3_ldxa_mx.sel, "sparc6.lsu.qdp1.ldbyp3_ldxa_mx") ;
`endif
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.qdp1.lmq_dthrd_sel1.sel, "sparc6.lsu.qdp1.lmq_dthrd_sel1") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.stb_rwdp.swap_byte0_mx.sel, "sparc6.lsu.stb_rwdp.swap_byte0_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.stb_rwdp.swap_byte1_mx.sel, "sparc6.lsu.stb_rwdp.swap_byte1_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.stb_rwdp.swap_byte2_mx.sel, "sparc6.lsu.stb_rwdp.swap_byte2_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.stb_rwdp.swap_byte3_mx.sel, "sparc6.lsu.stb_rwdp.swap_byte3_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.stb_rwdp.swap_byte4_mx.sel, "sparc6.lsu.stb_rwdp.swap_byte4_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.stb_rwdp.swap_byte5_mx.sel, "sparc6.lsu.stb_rwdp.swap_byte5_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.stb_rwdp.swap_byte6_mx.sel, "sparc6.lsu.stb_rwdp.swap_byte6_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.stb_rwdp.swap_byte7_mx.sel, "sparc6.lsu.stb_rwdp.swap_byte7_mx") ;
    one_hot_mux3 (rst_l, `TOP_DESIGN.sparc6.tlu.mmu_dp.dtag_access_dsel.sel, "sparc6.tlu.mmu_dp.dtag_access_dsel") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc6.lsu.qdp2.st_dcfill_wrway_sel_b54.sel, "sparc6.lsu.qdp2.st_dcfill_wrway_sel_b54") ;
  end
end

`endif


`ifdef RTL_SPARC7

always @(posedge clk) begin
  if (rst_done && check_on) begin
    one_hot_mux3 (rst_l, `TOP_DESIGN.sparc7.ifu.icd.icden_mux.sel, "sparc7.ifu.icd.icden_mux") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.dcdp.align_byte1_1h_mx.sel, "sparc7.lsu.dcdp.align_byte1_1h_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.dcdp.align_byte2_1st_mx.sel, "sparc7.lsu.dcdp.align_byte2_1st_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.dcdp.align_byte3_1st_mx.sel, "sparc7.lsu.dcdp.align_byte3_1st_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.dctldp.tlb_ctxt_mux.sel, "sparc7.lsu.dctldp.tlb_ctxt_mux") ;
`ifdef THREADS_1
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.qdp1.ldbyp0_data_mx.sel, "sparc7.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc7.lsu.qdp1.ldbyp0_ldxa_mx") ;
`elsif THREADS_2
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.qdp1.ldbyp0_data_mx.sel, "sparc7.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc7.lsu.qdp1.ldbyp0_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.qdp1.ldbyp1_data_mx.sel, "sparc7.lsu.qdp1.ldbyp1_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.qdp1.ldbyp1_ldxa_mx.sel, "sparc7.lsu.qdp1.ldbyp1_ldxa_mx") ; 
`elsif THREADS_3
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.qdp1.ldbyp0_data_mx.sel, "sparc7.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc7.lsu.qdp1.ldbyp0_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.qdp1.ldbyp1_data_mx.sel, "sparc7.lsu.qdp1.ldbyp1_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.qdp1.ldbyp1_ldxa_mx.sel, "sparc7.lsu.qdp1.ldbyp1_ldxa_mx") ; 
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.qdp1.ldbyp2_data_mx.sel, "sparc7.lsu.qdp1.ldbyp2_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.qdp1.ldbyp2_ldxa_mx.sel, "sparc7.lsu.qdp1.ldbyp2_ldxa_mx") ;
`else
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.qdp1.ldbyp0_data_mx.sel, "sparc7.lsu.qdp1.ldbyp0_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.qdp1.ldbyp0_ldxa_mx.sel, "sparc7.lsu.qdp1.ldbyp0_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.qdp1.ldbyp1_data_mx.sel, "sparc7.lsu.qdp1.ldbyp1_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.qdp1.ldbyp1_ldxa_mx.sel, "sparc7.lsu.qdp1.ldbyp1_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.qdp1.ldbyp2_data_mx.sel, "sparc7.lsu.qdp1.ldbyp2_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.qdp1.ldbyp2_ldxa_mx.sel, "sparc7.lsu.qdp1.ldbyp2_ldxa_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.qdp1.ldbyp3_data_mx.sel, "sparc7.lsu.qdp1.ldbyp3_data_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.qdp1.ldbyp3_ldxa_mx.sel, "sparc7.lsu.qdp1.ldbyp3_ldxa_mx") ;
`endif
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.qdp1.lmq_dthrd_sel1.sel, "sparc7.lsu.qdp1.lmq_dthrd_sel1") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.stb_rwdp.swap_byte0_mx.sel, "sparc7.lsu.stb_rwdp.swap_byte0_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.stb_rwdp.swap_byte1_mx.sel, "sparc7.lsu.stb_rwdp.swap_byte1_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.stb_rwdp.swap_byte2_mx.sel, "sparc7.lsu.stb_rwdp.swap_byte2_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.stb_rwdp.swap_byte3_mx.sel, "sparc7.lsu.stb_rwdp.swap_byte3_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.stb_rwdp.swap_byte4_mx.sel, "sparc7.lsu.stb_rwdp.swap_byte4_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.stb_rwdp.swap_byte5_mx.sel, "sparc7.lsu.stb_rwdp.swap_byte5_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.stb_rwdp.swap_byte6_mx.sel, "sparc7.lsu.stb_rwdp.swap_byte6_mx") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.stb_rwdp.swap_byte7_mx.sel, "sparc7.lsu.stb_rwdp.swap_byte7_mx") ;
    one_hot_mux3 (rst_l, `TOP_DESIGN.sparc7.tlu.mmu_dp.dtag_access_dsel.sel, "sparc7.tlu.mmu_dp.dtag_access_dsel") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sparc7.lsu.qdp2.st_dcfill_wrway_sel_b54.sel, "sparc7.lsu.qdp2.st_dcfill_wrway_sel_b54") ;
  end
end

`endif



`ifdef RTL_SCTAG0

always @(posedge clk) begin
  if (rst_done && check_on) begin
    one_hot_mux4 (rst_l, `TOP_DESIGN.sctag0.oqdp.mux_tmp_inv_data_c7.sel, "sctag0.oqdp.mux_tmp_inv_data_c7") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sctag0.tagdp.mux_lru_tag.sel, "sctag0.tagdp.mux_lru_tag") ;
    one_hot_mux3 (rst_l, `TOP_DESIGN.sctag0.tagl_dp_1.mux_tag_triad0.sel, "sctag0.tagl_dp_1.mux_tag_triad0") ;
    one_hot_mux3 (rst_l, `TOP_DESIGN.sctag0.tagl_dp_1.mux_tag_triad1.sel, "sctag0.tagl_dp_1.mux_tag_triad1") ;
    one_hot_mux3 (rst_l, `TOP_DESIGN.sctag0.tagl_dp_2.mux_tag_triad0.sel, "sctag0.tagl_dp_1.mux_tag_triad0") ;
    one_hot_mux3 (rst_l, `TOP_DESIGN.sctag0.tagl_dp_2.mux_tag_triad1.sel, "sctag0.tagl_dp_1.mux_tag_triad1") ;
  end
end

`endif


`ifdef RTL_SCTAG1

always @(posedge clk) begin
  if (rst_done && check_on) begin
    one_hot_mux4 (rst_l, `TOP_DESIGN.sctag1.oqdp.mux_tmp_inv_data_c7.sel, "sctag1.oqdp.mux_tmp_inv_data_c7") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sctag1.tagdp.mux_lru_tag.sel, "sctag1.tagdp.mux_lru_tag") ;
    one_hot_mux3 (rst_l, `TOP_DESIGN.sctag1.tagl_dp_1.mux_tag_triad0.sel, "sctag1.tagl_dp_1.mux_tag_triad0") ;
    one_hot_mux3 (rst_l, `TOP_DESIGN.sctag1.tagl_dp_1.mux_tag_triad1.sel, "sctag1.tagl_dp_1.mux_tag_triad1") ;
    one_hot_mux3 (rst_l, `TOP_DESIGN.sctag1.tagl_dp_2.mux_tag_triad0.sel, "sctag1.tagl_dp_1.mux_tag_triad0") ;
    one_hot_mux3 (rst_l, `TOP_DESIGN.sctag1.tagl_dp_2.mux_tag_triad1.sel, "sctag1.tagl_dp_1.mux_tag_triad1") ;
  end
end

`endif


`ifdef RTL_SCTAG2

always @(posedge clk) begin
  if (rst_done && check_on) begin
    one_hot_mux4 (rst_l, `TOP_DESIGN.sctag2.oqdp.mux_tmp_inv_data_c7.sel, "sctag2.oqdp.mux_tmp_inv_data_c7") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sctag2.tagdp.mux_lru_tag.sel, "sctag2.tagdp.mux_lru_tag") ;
    one_hot_mux3 (rst_l, `TOP_DESIGN.sctag2.tagl_dp_1.mux_tag_triad0.sel, "sctag2.tagl_dp_1.mux_tag_triad0") ;
    one_hot_mux3 (rst_l, `TOP_DESIGN.sctag2.tagl_dp_1.mux_tag_triad1.sel, "sctag2.tagl_dp_1.mux_tag_triad1") ;
    one_hot_mux3 (rst_l, `TOP_DESIGN.sctag2.tagl_dp_2.mux_tag_triad0.sel, "sctag2.tagl_dp_1.mux_tag_triad0") ;
    one_hot_mux3 (rst_l, `TOP_DESIGN.sctag2.tagl_dp_2.mux_tag_triad1.sel, "sctag2.tagl_dp_1.mux_tag_triad1") ;
  end
end

`endif


`ifdef RTL_SCTAG3

always @(posedge clk) begin
  if (rst_done && check_on) begin
    one_hot_mux4 (rst_l, `TOP_DESIGN.sctag3.oqdp.mux_tmp_inv_data_c7.sel, "sctag3.oqdp.mux_tmp_inv_data_c7") ;
    one_hot_mux4 (rst_l, `TOP_DESIGN.sctag3.tagdp.mux_lru_tag.sel, "sctag3.tagdp.mux_lru_tag") ;
    one_hot_mux3 (rst_l, `TOP_DESIGN.sctag3.tagl_dp_1.mux_tag_triad0.sel, "sctag3.tagl_dp_1.mux_tag_triad0") ;
    one_hot_mux3 (rst_l, `TOP_DESIGN.sctag3.tagl_dp_1.mux_tag_triad1.sel, "sctag3.tagl_dp_1.mux_tag_triad1") ;
    one_hot_mux3 (rst_l, `TOP_DESIGN.sctag3.tagl_dp_2.mux_tag_triad0.sel, "sctag3.tagl_dp_1.mux_tag_triad0") ;
    one_hot_mux3 (rst_l, `TOP_DESIGN.sctag3.tagl_dp_2.mux_tag_triad1.sel, "sctag3.tagl_dp_1.mux_tag_triad1") ;
  end
end

`endif


endmodule
