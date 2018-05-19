// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: trig_event.v
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
`ifdef FPGA_SYN
`define FPGA_SYN_IDCT
`define FPGA_SYN_IRF
`endif

module trig_event( /*AUTOARG*/
   // Inputs
   clk
   );
 `define DUMP 0
   input clk;
   
   integer handle;

`ifdef GATE_SIM
`else

`ifdef DRAM_SAT
`else
/*--------------------------------------------------------------------------
 create verilog event here.
 -------------------------------------------------------------------------*/
   reg [63:0] data;
   //counter for cache invalidation
   reg 	      start_counter;
   reg [7:0]  active_cpu;
   reg 	      ok_reset;
  
  initial begin
     active_cpu = 8'hff;
 `ifdef RTL_SPARC0
     active_cpu[0] = 1'b0;
 `endif
 `ifdef RTL_SPARC1
     active_cpu[1] = 1'b0;
 `endif
 `ifdef RTL_SPARC2
     active_cpu[2] = 1'b0;
 `endif
 `ifdef RTL_SPARC3
     active_cpu[3] = 1'b0;
 `endif
 `ifdef RTL_SPARC4
     active_cpu[4] = 1'b0;
 `endif
 `ifdef RTL_SPARC5
     active_cpu[5] = 1'b0;
 `endif
 `ifdef RTL_SPARC6
     active_cpu[6] = 1'b0;
 `endif
 `ifdef RTL_SPARC7
     active_cpu[7] = 1'b0;
 `endif
   // save valid pointer.
     start_counter = 1'b0;
  end // initial begin
   reg [5:0] scrub0, scrub1, scrub2, scrub3;

`ifdef FPGA_SYN_IRF
   reg [71:0] active_win [127:0];
   integer i;
`endif

   //invalidate the l2 data.
   initial repeat(1) @(negedge `SCPATH0.l2_bypass_mode_on)$stale_dram(0);//bank 0
   initial repeat(1) @(negedge `SCPATH1.l2_bypass_mode_on)$stale_dram(1);
   initial repeat(1) @(negedge `SCPATH2.l2_bypass_mode_on)$stale_dram(2);
   initial repeat(1) @(negedge `SCPATH3.l2_bypass_mode_on)$stale_dram(3);
   
   always @(posedge clk)begin
      scrub0 <= {6{!`SCPATH0.arbctl.diag_or_tecc_write_px2}} & {6{!`SCPATH0.arbctl.inc_tag_ecc_cnt_c2}};
      scrub1 <= {6{!`SCPATH1.arbctl.diag_or_tecc_write_px2}} & {6{!`SCPATH1.arbctl.inc_tag_ecc_cnt_c2}};
      scrub2 <= {6{!`SCPATH2.arbctl.diag_or_tecc_write_px2}} & {6{!`SCPATH2.arbctl.inc_tag_ecc_cnt_c2}};
      scrub3 <= {6{!`SCPATH3.arbctl.diag_or_tecc_write_px2}} & {6{!`SCPATH3.arbctl.inc_tag_ecc_cnt_c2}};
   end

   //acc_en_d1 & wr_en_d1
   //do l2 error enjection here.
   always @(posedge clk) begin
      $l2_error_enjection(//bank 0
			  //tag
			  {`SCPATH0.tag.subbankab.wren_d1, `SCPATH0.tag.subbank89.wren_d1, 
			   `SCPATH0.tag.subbank67.wren_d1, `SCPATH0.tag.subbank45.wren_d1, 
			   `SCPATH0.tag.subbank23.wren_d1, `SCPATH0.tag.subbank01.wren_d1} & scrub0,
			  
			  {`SCPATH0.tag.subbankab.index_d1, `SCPATH0.tag.subbank89.index_d1,
			   `SCPATH0.tag.subbank67.index_d1, `SCPATH0.tag.subbank45.index_d1,
			   `SCPATH0.tag.subbank23.index_d1, `SCPATH0.tag.subbank01.index_d1}, 

			  {`SCPATH0.tag.subbankab.way_d1, `SCPATH0.tag.subbank89.way_d1,
			   `SCPATH0.tag.subbank67.way_d1, `SCPATH0.tag.subbank45.way_d1,
			   `SCPATH0.tag.subbank23.way_d1, `SCPATH0.tag.subbank01.way_d1},
			  
			  //tag data 12 ways
			  `SCPATH0.tag.subbank01.way0,
			  `SCPATH0.tag.subbank01.way1,
			  `SCPATH0.tag.subbank23.way0,
			  `SCPATH0.tag.subbank23.way1,
			  `SCPATH0.tag.subbank45.way0,
			  `SCPATH0.tag.subbank45.way1,
			  `SCPATH0.tag.subbank67.way0,
			  `SCPATH0.tag.subbank67.way1,
			  `SCPATH0.tag.subbank89.way0,
			  `SCPATH0.tag.subbank89.way1,
			  `SCPATH0.tag.subbankab.way0,
			  `SCPATH0.tag.subbankab.way1,
			  
			  //data section
			  //sub 0
			  {`SCDPATH0.subbank_0.data_array_2.mem_1.way_sel_d1   &
			   {2{`SCDPATH0.subbank_0.data_array_2.mem_1.acc_en_d1 &&
			      `SCDPATH0.subbank_0.data_array_2.mem_1.wr_en_d1}},
			   
			   `SCDPATH0.subbank_0.data_array_2.mem_0.way_sel_d1   &
			   {2{`SCDPATH0.subbank_0.data_array_2.mem_0.acc_en_d1 &&
			      `SCDPATH0.subbank_0.data_array_2.mem_0.wr_en_d1}},
			   
			   `SCDPATH0.subbank_0.data_array_1.mem_1.way_sel_d1   &
			   {2{`SCDPATH0.subbank_0.data_array_1.mem_1.acc_en_d1 &&
			       `SCDPATH0.subbank_0.data_array_1.mem_1.wr_en_d1}},
			   
			   `SCDPATH0.subbank_0.data_array_1.mem_0.way_sel_d1   &
			   {2{`SCDPATH0.subbank_0.data_array_1.mem_0.acc_en_d1 &&
			       `SCDPATH0.subbank_0.data_array_1.mem_0.wr_en_d1}},
			   
			   `SCDPATH0.subbank_0.data_array_0.mem_1.way_sel_d1   &
			   {2{`SCDPATH0.subbank_0.data_array_0.mem_1.acc_en_d1 &&
			       `SCDPATH0.subbank_0.data_array_0.mem_1.wr_en_d1}},
			   
			   `SCDPATH0.subbank_0.data_array_0.mem_0.way_sel_d1   &
			   {2{`SCDPATH0.subbank_0.data_array_0.mem_0.acc_en_d1 &&
			      `SCDPATH0.subbank_0.data_array_0.mem_0.wr_en_d1}}},
			  
			  {`SCDPATH0.subbank_0.data_array_2.mem_1.set_d1,
			   `SCDPATH0.subbank_0.data_array_2.mem_0.set_d1,
			   `SCDPATH0.subbank_0.data_array_1.mem_1.set_d1,
			   `SCDPATH0.subbank_0.data_array_1.mem_0.set_d1,
			   `SCDPATH0.subbank_0.data_array_0.mem_1.set_d1,
			   `SCDPATH0.subbank_0.data_array_0.mem_0.set_d1},

			  `SCDPATH0.subbank_0.data_array_0.mem_0.way0_decc,
			  `SCDPATH0.subbank_0.data_array_0.mem_0.way1_decc,
			  `SCDPATH0.subbank_0.data_array_0.mem_1.way0_decc,
			  `SCDPATH0.subbank_0.data_array_0.mem_1.way1_decc,
			  `SCDPATH0.subbank_0.data_array_1.mem_0.way0_decc,
			  `SCDPATH0.subbank_0.data_array_1.mem_0.way1_decc,
			  `SCDPATH0.subbank_0.data_array_1.mem_1.way0_decc,
			  `SCDPATH0.subbank_0.data_array_1.mem_1.way1_decc,
			  `SCDPATH0.subbank_0.data_array_2.mem_0.way0_decc,
			  `SCDPATH0.subbank_0.data_array_2.mem_0.way1_decc,
			  `SCDPATH0.subbank_0.data_array_2.mem_1.way0_decc,
			  `SCDPATH0.subbank_0.data_array_2.mem_1.way1_decc,

			  //sub 1
			   {`SCDPATH0.subbank_1.data_array_2.mem_1.way_sel_d1   &
			   {2{`SCDPATH0.subbank_1.data_array_2.mem_1.acc_en_d1 &&
			      `SCDPATH0.subbank_1.data_array_2.mem_1.wr_en_d1}},
			   
			   `SCDPATH0.subbank_1.data_array_2.mem_0.way_sel_d1   &
			   {2{`SCDPATH0.subbank_1.data_array_2.mem_0.acc_en_d1 &&
			      `SCDPATH0.subbank_1.data_array_2.mem_0.wr_en_d1}},
			   
			   `SCDPATH0.subbank_1.data_array_1.mem_1.way_sel_d1   &
			   {2{`SCDPATH0.subbank_1.data_array_1.mem_1.acc_en_d1 &&
			       `SCDPATH0.subbank_1.data_array_1.mem_1.wr_en_d1}},
			   
			   `SCDPATH0.subbank_1.data_array_1.mem_0.way_sel_d1   &
			   {2{`SCDPATH0.subbank_1.data_array_1.mem_0.acc_en_d1 &&
			       `SCDPATH0.subbank_1.data_array_1.mem_0.wr_en_d1}},
			   
			   `SCDPATH0.subbank_1.data_array_0.mem_1.way_sel_d1   &
			   {2{`SCDPATH0.subbank_1.data_array_0.mem_1.acc_en_d1 &&
			       `SCDPATH0.subbank_1.data_array_0.mem_1.wr_en_d1}},
			   
			   `SCDPATH0.subbank_1.data_array_0.mem_0.way_sel_d1   &
			   {2{`SCDPATH0.subbank_1.data_array_0.mem_0.acc_en_d1 &&
			      `SCDPATH0.subbank_1.data_array_0.mem_0.wr_en_d1}}},
			  
			  {`SCDPATH0.subbank_1.data_array_2.mem_1.set_d1,
			   `SCDPATH0.subbank_1.data_array_2.mem_0.set_d1,
			   `SCDPATH0.subbank_1.data_array_1.mem_1.set_d1,
			   `SCDPATH0.subbank_1.data_array_1.mem_0.set_d1,
			   `SCDPATH0.subbank_1.data_array_0.mem_1.set_d1,
			   `SCDPATH0.subbank_1.data_array_0.mem_0.set_d1},

			  `SCDPATH0.subbank_1.data_array_0.mem_0.way0_decc,
			  `SCDPATH0.subbank_1.data_array_0.mem_0.way1_decc,
			  `SCDPATH0.subbank_1.data_array_0.mem_1.way0_decc,
			  `SCDPATH0.subbank_1.data_array_0.mem_1.way1_decc,
			  `SCDPATH0.subbank_1.data_array_1.mem_0.way0_decc,
			  `SCDPATH0.subbank_1.data_array_1.mem_0.way1_decc,
			  `SCDPATH0.subbank_1.data_array_1.mem_1.way0_decc,
			  `SCDPATH0.subbank_1.data_array_1.mem_1.way1_decc,
			  `SCDPATH0.subbank_1.data_array_2.mem_0.way0_decc,
			  `SCDPATH0.subbank_1.data_array_2.mem_0.way1_decc,
			  `SCDPATH0.subbank_1.data_array_2.mem_1.way0_decc,
			  `SCDPATH0.subbank_1.data_array_2.mem_1.way1_decc,
			   //sub 2
			  {`SCDPATH0.subbank_2.data_array_2.mem_1.way_sel_d1   &
			   {2{`SCDPATH0.subbank_2.data_array_2.mem_1.acc_en_d1 &&
			      `SCDPATH0.subbank_2.data_array_2.mem_1.wr_en_d1}},
			   
			   `SCDPATH0.subbank_2.data_array_2.mem_0.way_sel_d1   &
			   {2{`SCDPATH0.subbank_2.data_array_2.mem_0.acc_en_d1 &&
			      `SCDPATH0.subbank_2.data_array_2.mem_0.wr_en_d1}},
			   
			   `SCDPATH0.subbank_2.data_array_1.mem_1.way_sel_d1   &
			   {2{`SCDPATH0.subbank_2.data_array_1.mem_1.acc_en_d1 &&
			       `SCDPATH0.subbank_2.data_array_1.mem_1.wr_en_d1}},
			   
			   `SCDPATH0.subbank_2.data_array_1.mem_0.way_sel_d1   &
			   {2{`SCDPATH0.subbank_2.data_array_1.mem_0.acc_en_d1 &&
			       `SCDPATH0.subbank_2.data_array_1.mem_0.wr_en_d1}},
			   
			   `SCDPATH0.subbank_2.data_array_0.mem_1.way_sel_d1   &
			   {2{`SCDPATH0.subbank_2.data_array_0.mem_1.acc_en_d1 &&
			       `SCDPATH0.subbank_2.data_array_0.mem_1.wr_en_d1}},
			   
			   `SCDPATH0.subbank_2.data_array_0.mem_0.way_sel_d1   &
			   {2{`SCDPATH0.subbank_2.data_array_0.mem_0.acc_en_d1 &&
			      `SCDPATH0.subbank_2.data_array_0.mem_0.wr_en_d1}}},
			  
			  {`SCDPATH0.subbank_2.data_array_2.mem_1.set_d1,
			   `SCDPATH0.subbank_2.data_array_2.mem_0.set_d1,
			   `SCDPATH0.subbank_2.data_array_1.mem_1.set_d1,
			   `SCDPATH0.subbank_2.data_array_1.mem_0.set_d1,
			   `SCDPATH0.subbank_2.data_array_0.mem_1.set_d1,
			   `SCDPATH0.subbank_2.data_array_0.mem_0.set_d1},

			  `SCDPATH0.subbank_2.data_array_0.mem_0.way0_decc,
			  `SCDPATH0.subbank_2.data_array_0.mem_0.way1_decc,
			  `SCDPATH0.subbank_2.data_array_0.mem_1.way0_decc,
			  `SCDPATH0.subbank_2.data_array_0.mem_1.way1_decc,
			  `SCDPATH0.subbank_2.data_array_1.mem_0.way0_decc,
			  `SCDPATH0.subbank_2.data_array_1.mem_0.way1_decc,
			  `SCDPATH0.subbank_2.data_array_1.mem_1.way0_decc,
			  `SCDPATH0.subbank_2.data_array_1.mem_1.way1_decc,
			  `SCDPATH0.subbank_2.data_array_2.mem_0.way0_decc,
			  `SCDPATH0.subbank_2.data_array_2.mem_0.way1_decc,
			  `SCDPATH0.subbank_2.data_array_2.mem_1.way0_decc,
			  `SCDPATH0.subbank_2.data_array_2.mem_1.way1_decc,
			    //sub 3
			 
			  {`SCDPATH0.subbank_3.data_array_2.mem_1.way_sel_d1   &
			   {2{`SCDPATH0.subbank_3.data_array_2.mem_1.acc_en_d1 &&
			      `SCDPATH0.subbank_3.data_array_2.mem_1.wr_en_d1}},
			   
			   `SCDPATH0.subbank_3.data_array_2.mem_0.way_sel_d1   &
			   {2{`SCDPATH0.subbank_3.data_array_2.mem_0.acc_en_d1 &&
			      `SCDPATH0.subbank_3.data_array_2.mem_0.wr_en_d1}},
			   
			   `SCDPATH0.subbank_3.data_array_1.mem_1.way_sel_d1   &
			   {2{`SCDPATH0.subbank_3.data_array_1.mem_1.acc_en_d1 &&
			       `SCDPATH0.subbank_3.data_array_1.mem_1.wr_en_d1}},
			   
			   `SCDPATH0.subbank_3.data_array_1.mem_0.way_sel_d1   &
			   {2{`SCDPATH0.subbank_3.data_array_1.mem_0.acc_en_d1 &&
			       `SCDPATH0.subbank_3.data_array_1.mem_0.wr_en_d1}},
			   
			   `SCDPATH0.subbank_3.data_array_0.mem_1.way_sel_d1   &
			   {2{`SCDPATH0.subbank_3.data_array_0.mem_1.acc_en_d1 &&
			       `SCDPATH0.subbank_3.data_array_0.mem_1.wr_en_d1}},
			   
			   `SCDPATH0.subbank_3.data_array_0.mem_0.way_sel_d1   &
			   {2{`SCDPATH0.subbank_3.data_array_0.mem_0.acc_en_d1 &&
			      `SCDPATH0.subbank_3.data_array_0.mem_0.wr_en_d1}}},
			  
			  {`SCDPATH0.subbank_3.data_array_2.mem_1.set_d1,
			   `SCDPATH0.subbank_3.data_array_2.mem_0.set_d1,
			   `SCDPATH0.subbank_3.data_array_1.mem_1.set_d1,
			   `SCDPATH0.subbank_3.data_array_1.mem_0.set_d1,
			   `SCDPATH0.subbank_3.data_array_0.mem_1.set_d1,
			   `SCDPATH0.subbank_3.data_array_0.mem_0.set_d1},

			  `SCDPATH0.subbank_3.data_array_0.mem_0.way0_decc,
			  `SCDPATH0.subbank_3.data_array_0.mem_0.way1_decc,
			  `SCDPATH0.subbank_3.data_array_0.mem_1.way0_decc,
			  `SCDPATH0.subbank_3.data_array_0.mem_1.way1_decc,
			  `SCDPATH0.subbank_3.data_array_1.mem_0.way0_decc,
			  `SCDPATH0.subbank_3.data_array_1.mem_0.way1_decc,
			  `SCDPATH0.subbank_3.data_array_1.mem_1.way0_decc,
			  `SCDPATH0.subbank_3.data_array_1.mem_1.way1_decc,
			  `SCDPATH0.subbank_3.data_array_2.mem_0.way0_decc,
			  `SCDPATH0.subbank_3.data_array_2.mem_0.way1_decc,
			  `SCDPATH0.subbank_3.data_array_2.mem_1.way0_decc,
			  `SCDPATH0.subbank_3.data_array_2.mem_1.way1_decc,
			  
			  //bank 1
			  //tag
			  {`SCPATH1.tag.subbankab.wren_d1, `SCPATH1.tag.subbank89.wren_d1, 
			   `SCPATH1.tag.subbank67.wren_d1, `SCPATH1.tag.subbank45.wren_d1, 
			   `SCPATH1.tag.subbank23.wren_d1, `SCPATH1.tag.subbank01.wren_d1} & scrub1,
			  
			  {`SCPATH1.tag.subbankab.index_d1, `SCPATH1.tag.subbank89.index_d1,
			   `SCPATH1.tag.subbank67.index_d1, `SCPATH1.tag.subbank45.index_d1,
			   `SCPATH1.tag.subbank23.index_d1, `SCPATH1.tag.subbank01.index_d1}, 

			  {`SCPATH1.tag.subbankab.way_d1, `SCPATH1.tag.subbank89.way_d1,
			   `SCPATH1.tag.subbank67.way_d1, `SCPATH1.tag.subbank45.way_d1,
			   `SCPATH1.tag.subbank23.way_d1, `SCPATH1.tag.subbank01.way_d1},
			  
			  //tag data 12 ways
			  `SCPATH1.tag.subbank01.way0,
			  `SCPATH1.tag.subbank01.way1,
			  `SCPATH1.tag.subbank23.way0,
			  `SCPATH1.tag.subbank23.way1,
			  `SCPATH1.tag.subbank45.way0,
			  `SCPATH1.tag.subbank45.way1,
			  `SCPATH1.tag.subbank67.way0,
			  `SCPATH1.tag.subbank67.way1,
			  `SCPATH1.tag.subbank89.way0,
			  `SCPATH1.tag.subbank89.way1,
			  `SCPATH1.tag.subbankab.way0,
			  `SCPATH1.tag.subbankab.way1,
			  //data section
			  //sub 0
		
			  {`SCDPATH1.subbank_0.data_array_2.mem_1.way_sel_d1   &
			   {2{`SCDPATH1.subbank_0.data_array_2.mem_1.acc_en_d1 &&
			      `SCDPATH1.subbank_0.data_array_2.mem_1.wr_en_d1}},
			   
			   `SCDPATH1.subbank_0.data_array_2.mem_0.way_sel_d1   &
			   {2{`SCDPATH1.subbank_0.data_array_2.mem_0.acc_en_d1 &&
			      `SCDPATH1.subbank_0.data_array_2.mem_0.wr_en_d1}},
			   
			   `SCDPATH1.subbank_0.data_array_1.mem_1.way_sel_d1   &
			   {2{`SCDPATH1.subbank_0.data_array_1.mem_1.acc_en_d1 &&
			       `SCDPATH1.subbank_0.data_array_1.mem_1.wr_en_d1}},
			   
			   `SCDPATH1.subbank_0.data_array_1.mem_0.way_sel_d1   &
			   {2{`SCDPATH1.subbank_0.data_array_1.mem_0.acc_en_d1 &&
			       `SCDPATH1.subbank_0.data_array_1.mem_0.wr_en_d1}},
			   
			   `SCDPATH1.subbank_0.data_array_0.mem_1.way_sel_d1   &
			   {2{`SCDPATH1.subbank_0.data_array_0.mem_1.acc_en_d1 &&
			       `SCDPATH1.subbank_0.data_array_0.mem_1.wr_en_d1}},
			   
			   `SCDPATH1.subbank_0.data_array_0.mem_0.way_sel_d1   &
			   {2{`SCDPATH1.subbank_0.data_array_0.mem_0.acc_en_d1 &&
			      `SCDPATH1.subbank_0.data_array_0.mem_0.wr_en_d1}}},
			  
			  {`SCDPATH1.subbank_0.data_array_2.mem_1.set_d1,
			   `SCDPATH1.subbank_0.data_array_2.mem_0.set_d1,
			   `SCDPATH1.subbank_0.data_array_1.mem_1.set_d1,
			   `SCDPATH1.subbank_0.data_array_1.mem_0.set_d1,
			   `SCDPATH1.subbank_0.data_array_0.mem_1.set_d1,
			   `SCDPATH1.subbank_0.data_array_0.mem_0.set_d1},

			  `SCDPATH1.subbank_0.data_array_0.mem_0.way0_decc,
			  `SCDPATH1.subbank_0.data_array_0.mem_0.way1_decc,
			  `SCDPATH1.subbank_0.data_array_0.mem_1.way0_decc,
			  `SCDPATH1.subbank_0.data_array_0.mem_1.way1_decc,
			  `SCDPATH1.subbank_0.data_array_1.mem_0.way0_decc,
			  `SCDPATH1.subbank_0.data_array_1.mem_0.way1_decc,
			  `SCDPATH1.subbank_0.data_array_1.mem_1.way0_decc,
			  `SCDPATH1.subbank_0.data_array_1.mem_1.way1_decc,
			  `SCDPATH1.subbank_0.data_array_2.mem_0.way0_decc,
			  `SCDPATH1.subbank_0.data_array_2.mem_0.way1_decc,
			  `SCDPATH1.subbank_0.data_array_2.mem_1.way0_decc,
			  `SCDPATH1.subbank_0.data_array_2.mem_1.way1_decc,

			  //sub 1
			  {`SCDPATH1.subbank_1.data_array_2.mem_1.way_sel_d1   &
			   {2{`SCDPATH1.subbank_1.data_array_2.mem_1.acc_en_d1 &&
			      `SCDPATH1.subbank_1.data_array_2.mem_1.wr_en_d1}},
			   
			   `SCDPATH1.subbank_1.data_array_2.mem_0.way_sel_d1   &
			   {2{`SCDPATH1.subbank_1.data_array_2.mem_0.acc_en_d1 &&
			      `SCDPATH1.subbank_1.data_array_2.mem_0.wr_en_d1}},
			   
			   `SCDPATH1.subbank_1.data_array_1.mem_1.way_sel_d1   &
			   {2{`SCDPATH1.subbank_1.data_array_1.mem_1.acc_en_d1 &&
			       `SCDPATH1.subbank_1.data_array_1.mem_1.wr_en_d1}},
			   
			   `SCDPATH1.subbank_1.data_array_1.mem_0.way_sel_d1   &
			   {2{`SCDPATH1.subbank_1.data_array_1.mem_0.acc_en_d1 &&
			       `SCDPATH1.subbank_1.data_array_1.mem_0.wr_en_d1}},
			   
			   `SCDPATH1.subbank_1.data_array_0.mem_1.way_sel_d1   &
			   {2{`SCDPATH1.subbank_1.data_array_0.mem_1.acc_en_d1 &&
			       `SCDPATH1.subbank_1.data_array_0.mem_1.wr_en_d1}},
			   
			   `SCDPATH1.subbank_1.data_array_0.mem_0.way_sel_d1   &
			   {2{`SCDPATH1.subbank_1.data_array_0.mem_0.acc_en_d1 &&
			      `SCDPATH1.subbank_1.data_array_0.mem_0.wr_en_d1}}},
			  
			  {`SCDPATH1.subbank_1.data_array_2.mem_1.set_d1,
			   `SCDPATH1.subbank_1.data_array_2.mem_0.set_d1,
			   `SCDPATH1.subbank_1.data_array_1.mem_1.set_d1,
			   `SCDPATH1.subbank_1.data_array_1.mem_0.set_d1,
			   `SCDPATH1.subbank_1.data_array_0.mem_1.set_d1,
			   `SCDPATH1.subbank_1.data_array_0.mem_0.set_d1},

			  `SCDPATH1.subbank_1.data_array_0.mem_0.way0_decc,
			  `SCDPATH1.subbank_1.data_array_0.mem_0.way1_decc,
			  `SCDPATH1.subbank_1.data_array_0.mem_1.way0_decc,
			  `SCDPATH1.subbank_1.data_array_0.mem_1.way1_decc,
			  `SCDPATH1.subbank_1.data_array_1.mem_0.way0_decc,
			  `SCDPATH1.subbank_1.data_array_1.mem_0.way1_decc,
			  `SCDPATH1.subbank_1.data_array_1.mem_1.way0_decc,
			  `SCDPATH1.subbank_1.data_array_1.mem_1.way1_decc,
			  `SCDPATH1.subbank_1.data_array_2.mem_0.way0_decc,
			  `SCDPATH1.subbank_1.data_array_2.mem_0.way1_decc,
			  `SCDPATH1.subbank_1.data_array_2.mem_1.way0_decc,
			  `SCDPATH1.subbank_1.data_array_2.mem_1.way1_decc,
			   //sub 2
			  {`SCDPATH1.subbank_2.data_array_2.mem_1.way_sel_d1   &
			   {2{`SCDPATH1.subbank_2.data_array_2.mem_1.acc_en_d1 &&
			      `SCDPATH1.subbank_2.data_array_2.mem_1.wr_en_d1}},
			   
			   `SCDPATH1.subbank_2.data_array_2.mem_0.way_sel_d1   &
			   {2{`SCDPATH1.subbank_2.data_array_2.mem_0.acc_en_d1 &&
			      `SCDPATH1.subbank_2.data_array_2.mem_0.wr_en_d1}},
			   
			   `SCDPATH1.subbank_2.data_array_1.mem_1.way_sel_d1   &
			   {2{`SCDPATH1.subbank_2.data_array_1.mem_1.acc_en_d1 &&
			       `SCDPATH1.subbank_2.data_array_1.mem_1.wr_en_d1}},
			   
			   `SCDPATH1.subbank_2.data_array_1.mem_0.way_sel_d1   &
			   {2{`SCDPATH1.subbank_2.data_array_1.mem_0.acc_en_d1 &&
			       `SCDPATH1.subbank_2.data_array_1.mem_0.wr_en_d1}},
			   
			   `SCDPATH1.subbank_2.data_array_0.mem_1.way_sel_d1   &
			   {2{`SCDPATH1.subbank_2.data_array_0.mem_1.acc_en_d1 &&
			       `SCDPATH1.subbank_2.data_array_0.mem_1.wr_en_d1}},
			   
			   `SCDPATH1.subbank_2.data_array_0.mem_0.way_sel_d1   &
			   {2{`SCDPATH1.subbank_2.data_array_0.mem_0.acc_en_d1 &&
			      `SCDPATH1.subbank_2.data_array_0.mem_0.wr_en_d1}}},
			  
			  {`SCDPATH1.subbank_2.data_array_2.mem_1.set_d1,
			   `SCDPATH1.subbank_2.data_array_2.mem_0.set_d1,
			   `SCDPATH1.subbank_2.data_array_1.mem_1.set_d1,
			   `SCDPATH1.subbank_2.data_array_1.mem_0.set_d1,
			   `SCDPATH1.subbank_2.data_array_0.mem_1.set_d1,
			   `SCDPATH1.subbank_2.data_array_0.mem_0.set_d1},

			  `SCDPATH1.subbank_2.data_array_0.mem_0.way0_decc,
			  `SCDPATH1.subbank_2.data_array_0.mem_0.way1_decc,
			  `SCDPATH1.subbank_2.data_array_0.mem_1.way0_decc,
			  `SCDPATH1.subbank_2.data_array_0.mem_1.way1_decc,
			  `SCDPATH1.subbank_2.data_array_1.mem_0.way0_decc,
			  `SCDPATH1.subbank_2.data_array_1.mem_0.way1_decc,
			  `SCDPATH1.subbank_2.data_array_1.mem_1.way0_decc,
			  `SCDPATH1.subbank_2.data_array_1.mem_1.way1_decc,
			  `SCDPATH1.subbank_2.data_array_2.mem_0.way0_decc,
			  `SCDPATH1.subbank_2.data_array_2.mem_0.way1_decc,
			  `SCDPATH1.subbank_2.data_array_2.mem_1.way0_decc,
			  `SCDPATH1.subbank_2.data_array_2.mem_1.way1_decc,
			    //sub 3
			  
			  {`SCDPATH1.subbank_3.data_array_2.mem_1.way_sel_d1   &
			   {2{`SCDPATH1.subbank_3.data_array_2.mem_1.acc_en_d1 &&
			      `SCDPATH1.subbank_3.data_array_2.mem_1.wr_en_d1}},
			   
			   `SCDPATH1.subbank_3.data_array_2.mem_0.way_sel_d1   &
			   {2{`SCDPATH1.subbank_3.data_array_2.mem_0.acc_en_d1 &&
			      `SCDPATH1.subbank_3.data_array_2.mem_0.wr_en_d1}},
			   
			   `SCDPATH1.subbank_3.data_array_1.mem_1.way_sel_d1   &
			   {2{`SCDPATH1.subbank_3.data_array_1.mem_1.acc_en_d1 &&
			      `SCDPATH1.subbank_3.data_array_1.mem_1.wr_en_d1}},
			   
			   `SCDPATH1.subbank_3.data_array_1.mem_0.way_sel_d1   &
			   {2{`SCDPATH1.subbank_3.data_array_1.mem_0.acc_en_d1 &&
			       `SCDPATH1.subbank_3.data_array_1.mem_0.wr_en_d1}},
			   
			   `SCDPATH1.subbank_3.data_array_0.mem_1.way_sel_d1   &
			   {2{`SCDPATH1.subbank_3.data_array_0.mem_1.acc_en_d1 &&
			      `SCDPATH1.subbank_3.data_array_0.mem_1.wr_en_d1}},
			   
			   `SCDPATH1.subbank_3.data_array_0.mem_0.way_sel_d1   &
			   {2{`SCDPATH1.subbank_3.data_array_0.mem_0.acc_en_d1 &&
			       `SCDPATH1.subbank_3.data_array_0.mem_0.wr_en_d1}}},
			  
			  {`SCDPATH1.subbank_3.data_array_2.mem_1.set_d1,
			   `SCDPATH1.subbank_3.data_array_2.mem_0.set_d1,
			   `SCDPATH1.subbank_3.data_array_1.mem_1.set_d1,
			   `SCDPATH1.subbank_3.data_array_1.mem_0.set_d1,
			   `SCDPATH1.subbank_3.data_array_0.mem_1.set_d1,
			   `SCDPATH1.subbank_3.data_array_0.mem_0.set_d1},

			  `SCDPATH1.subbank_3.data_array_0.mem_0.way0_decc,
			  `SCDPATH1.subbank_3.data_array_0.mem_0.way1_decc,
			  `SCDPATH1.subbank_3.data_array_0.mem_1.way0_decc,
			  `SCDPATH1.subbank_3.data_array_0.mem_1.way1_decc,
			  `SCDPATH1.subbank_3.data_array_1.mem_0.way0_decc,
			  `SCDPATH1.subbank_3.data_array_1.mem_0.way1_decc,
			  `SCDPATH1.subbank_3.data_array_1.mem_1.way0_decc,
			  `SCDPATH1.subbank_3.data_array_1.mem_1.way1_decc,
			  `SCDPATH1.subbank_3.data_array_2.mem_0.way0_decc,
			  `SCDPATH1.subbank_3.data_array_2.mem_0.way1_decc,
			  `SCDPATH1.subbank_3.data_array_2.mem_1.way0_decc,
			  `SCDPATH1.subbank_3.data_array_2.mem_1.way1_decc,
			  //bank 2
			  //tag
			  {`SCPATH2.tag.subbankab.wren_d1, `SCPATH2.tag.subbank89.wren_d1, 
			   `SCPATH2.tag.subbank67.wren_d1, `SCPATH2.tag.subbank45.wren_d1, 
			   `SCPATH2.tag.subbank23.wren_d1, `SCPATH2.tag.subbank01.wren_d1} & scrub2,
			  
			  {`SCPATH2.tag.subbankab.index_d1, `SCPATH2.tag.subbank89.index_d1,
			   `SCPATH2.tag.subbank67.index_d1, `SCPATH2.tag.subbank45.index_d1,
			   `SCPATH2.tag.subbank23.index_d1, `SCPATH2.tag.subbank01.index_d1}, 

			  {`SCPATH2.tag.subbankab.way_d1, `SCPATH2.tag.subbank89.way_d1,
			   `SCPATH2.tag.subbank67.way_d1, `SCPATH2.tag.subbank45.way_d1,
			   `SCPATH2.tag.subbank23.way_d1, `SCPATH2.tag.subbank01.way_d1},
			  
			  //tag data 12 ways
			  `SCPATH2.tag.subbank01.way0,
			  `SCPATH2.tag.subbank01.way1,
			  `SCPATH2.tag.subbank23.way0,
			  `SCPATH2.tag.subbank23.way1,
			  `SCPATH2.tag.subbank45.way0,
			  `SCPATH2.tag.subbank45.way1,
			  `SCPATH2.tag.subbank67.way0,
			  `SCPATH2.tag.subbank67.way1,
			  `SCPATH2.tag.subbank89.way0,
			  `SCPATH2.tag.subbank89.way1,
			  `SCPATH2.tag.subbankab.way0,
			  `SCPATH2.tag.subbankab.way1,
			  //data section
			  //sub 0
			  
			  {`SCDPATH2.subbank_0.data_array_2.mem_1.way_sel_d1   &
			   {2{`SCDPATH2.subbank_0.data_array_2.mem_1.acc_en_d1 &&
			      `SCDPATH2.subbank_0.data_array_2.mem_1.wr_en_d1}},
			   
			   `SCDPATH2.subbank_0.data_array_2.mem_0.way_sel_d1   &
			   {2{`SCDPATH2.subbank_0.data_array_2.mem_0.acc_en_d1 &&
			      `SCDPATH2.subbank_0.data_array_2.mem_0.wr_en_d1}},
			   
			   `SCDPATH2.subbank_0.data_array_1.mem_1.way_sel_d1   &
			   {2{`SCDPATH2.subbank_0.data_array_1.mem_1.acc_en_d1 &&
			      `SCDPATH2.subbank_0.data_array_1.mem_1.wr_en_d1}},
			   
			   `SCDPATH2.subbank_0.data_array_1.mem_0.way_sel_d1   &
			   {2{`SCDPATH2.subbank_0.data_array_1.mem_0.acc_en_d1 &&
			       `SCDPATH2.subbank_0.data_array_1.mem_0.wr_en_d1}},
			   
			   `SCDPATH2.subbank_0.data_array_0.mem_1.way_sel_d1   &
			   {2{`SCDPATH2.subbank_0.data_array_0.mem_1.acc_en_d1 &&
			      `SCDPATH2.subbank_0.data_array_0.mem_1.wr_en_d1}},
			   
			   `SCDPATH2.subbank_0.data_array_0.mem_0.way_sel_d1   &
			   {2{`SCDPATH2.subbank_0.data_array_0.mem_0.acc_en_d1 &&
			       `SCDPATH2.subbank_0.data_array_0.mem_0.wr_en_d1}}},
			  
			  {`SCDPATH2.subbank_0.data_array_2.mem_1.set_d1,
			   `SCDPATH2.subbank_0.data_array_2.mem_0.set_d1,
			   `SCDPATH2.subbank_0.data_array_1.mem_1.set_d1,
			   `SCDPATH2.subbank_0.data_array_1.mem_0.set_d1,
			   `SCDPATH2.subbank_0.data_array_0.mem_1.set_d1,
			   `SCDPATH2.subbank_0.data_array_0.mem_0.set_d1},

			  `SCDPATH2.subbank_0.data_array_0.mem_0.way0_decc,
			  `SCDPATH2.subbank_0.data_array_0.mem_0.way1_decc,
			  `SCDPATH2.subbank_0.data_array_0.mem_1.way0_decc,
			  `SCDPATH2.subbank_0.data_array_0.mem_1.way1_decc,
			  `SCDPATH2.subbank_0.data_array_1.mem_0.way0_decc,
			  `SCDPATH2.subbank_0.data_array_1.mem_0.way1_decc,
			  `SCDPATH2.subbank_0.data_array_1.mem_1.way0_decc,
			  `SCDPATH2.subbank_0.data_array_1.mem_1.way1_decc,
			  `SCDPATH2.subbank_0.data_array_2.mem_0.way0_decc,
			  `SCDPATH2.subbank_0.data_array_2.mem_0.way1_decc,
			  `SCDPATH2.subbank_0.data_array_2.mem_1.way0_decc,
			  `SCDPATH2.subbank_0.data_array_2.mem_1.way1_decc,

			  //sub 1
			 
			  {`SCDPATH2.subbank_1.data_array_2.mem_1.way_sel_d1   &
			   {2{`SCDPATH2.subbank_1.data_array_2.mem_1.acc_en_d1 &&
			      `SCDPATH2.subbank_1.data_array_2.mem_1.wr_en_d1}},
			   
			   `SCDPATH2.subbank_1.data_array_2.mem_0.way_sel_d1   &
			   {2{`SCDPATH2.subbank_1.data_array_2.mem_0.acc_en_d1 &&
			      `SCDPATH2.subbank_1.data_array_2.mem_0.wr_en_d1}},
			   
			   `SCDPATH2.subbank_1.data_array_1.mem_1.way_sel_d1   &
			   {2{`SCDPATH2.subbank_1.data_array_1.mem_1.acc_en_d1 &&
			      `SCDPATH2.subbank_1.data_array_1.mem_1.wr_en_d1}},
			   
			   `SCDPATH2.subbank_1.data_array_1.mem_0.way_sel_d1   &
			   {2{`SCDPATH2.subbank_1.data_array_1.mem_0.acc_en_d1 &&
			       `SCDPATH2.subbank_1.data_array_1.mem_0.wr_en_d1}},
			   
			   `SCDPATH2.subbank_1.data_array_0.mem_1.way_sel_d1   &
			   {2{`SCDPATH2.subbank_1.data_array_0.mem_1.acc_en_d1 &&
			      `SCDPATH2.subbank_1.data_array_0.mem_1.wr_en_d1}},
			   
			   `SCDPATH2.subbank_1.data_array_0.mem_0.way_sel_d1   &
			   {2{`SCDPATH2.subbank_1.data_array_0.mem_0.acc_en_d1 &&
			       `SCDPATH2.subbank_1.data_array_0.mem_0.wr_en_d1}}},
			  
			  {`SCDPATH2.subbank_1.data_array_2.mem_1.set_d1,
			   `SCDPATH2.subbank_1.data_array_2.mem_0.set_d1,
			   `SCDPATH2.subbank_1.data_array_1.mem_1.set_d1,
			   `SCDPATH2.subbank_1.data_array_1.mem_0.set_d1,
			   `SCDPATH2.subbank_1.data_array_0.mem_1.set_d1,
			   `SCDPATH2.subbank_1.data_array_0.mem_0.set_d1},

			  `SCDPATH2.subbank_1.data_array_0.mem_0.way0_decc,
			  `SCDPATH2.subbank_1.data_array_0.mem_0.way1_decc,
			  `SCDPATH2.subbank_1.data_array_0.mem_1.way0_decc,
			  `SCDPATH2.subbank_1.data_array_0.mem_1.way1_decc,
			  `SCDPATH2.subbank_1.data_array_1.mem_0.way0_decc,
			  `SCDPATH2.subbank_1.data_array_1.mem_0.way1_decc,
			  `SCDPATH2.subbank_1.data_array_1.mem_1.way0_decc,
			  `SCDPATH2.subbank_1.data_array_1.mem_1.way1_decc,
			  `SCDPATH2.subbank_1.data_array_2.mem_0.way0_decc,
			  `SCDPATH2.subbank_1.data_array_2.mem_0.way1_decc,
			  `SCDPATH2.subbank_1.data_array_2.mem_1.way0_decc,
			  `SCDPATH2.subbank_1.data_array_2.mem_1.way1_decc,
			   //sub 2
			  {`SCDPATH2.subbank_2.data_array_2.mem_1.way_sel_d1   &
			   {2{`SCDPATH2.subbank_2.data_array_2.mem_1.acc_en_d1 &&
			      `SCDPATH2.subbank_2.data_array_2.mem_1.wr_en_d1}},
			   
			   `SCDPATH2.subbank_2.data_array_2.mem_0.way_sel_d1   &
			   {2{`SCDPATH2.subbank_2.data_array_2.mem_0.acc_en_d1 &&
			      `SCDPATH2.subbank_2.data_array_2.mem_0.wr_en_d1}},
			   
			   `SCDPATH2.subbank_2.data_array_1.mem_1.way_sel_d1   &
			   {2{`SCDPATH2.subbank_2.data_array_1.mem_1.acc_en_d1 &&
			      `SCDPATH2.subbank_2.data_array_1.mem_1.wr_en_d1}},
			   
			   `SCDPATH2.subbank_2.data_array_1.mem_0.way_sel_d1   &
			   {2{`SCDPATH2.subbank_2.data_array_1.mem_0.acc_en_d1 &&
			       `SCDPATH2.subbank_2.data_array_1.mem_0.wr_en_d1}},
			   
			   `SCDPATH2.subbank_2.data_array_0.mem_1.way_sel_d1   &
			   {2{`SCDPATH2.subbank_2.data_array_0.mem_1.acc_en_d1 &&
			      `SCDPATH2.subbank_2.data_array_0.mem_1.wr_en_d1}},
			   
			   `SCDPATH2.subbank_2.data_array_0.mem_0.way_sel_d1   &
			   {2{`SCDPATH2.subbank_2.data_array_0.mem_0.acc_en_d1 &&
			      `SCDPATH2.subbank_2.data_array_0.mem_0.wr_en_d1}}},
			  
			  {`SCDPATH2.subbank_2.data_array_2.mem_1.set_d1,
			   `SCDPATH2.subbank_2.data_array_2.mem_0.set_d1,
			   `SCDPATH2.subbank_2.data_array_1.mem_1.set_d1,
			   `SCDPATH2.subbank_2.data_array_1.mem_0.set_d1,
			   `SCDPATH2.subbank_2.data_array_0.mem_1.set_d1,
			   `SCDPATH2.subbank_2.data_array_0.mem_0.set_d1},

			  `SCDPATH2.subbank_2.data_array_0.mem_0.way0_decc,
			  `SCDPATH2.subbank_2.data_array_0.mem_0.way1_decc,
			  `SCDPATH2.subbank_2.data_array_0.mem_1.way0_decc,
			  `SCDPATH2.subbank_2.data_array_0.mem_1.way1_decc,
			  `SCDPATH2.subbank_2.data_array_1.mem_0.way0_decc,
			  `SCDPATH2.subbank_2.data_array_1.mem_0.way1_decc,
			  `SCDPATH2.subbank_2.data_array_1.mem_1.way0_decc,
			  `SCDPATH2.subbank_2.data_array_1.mem_1.way1_decc,
			  `SCDPATH2.subbank_2.data_array_2.mem_0.way0_decc,
			  `SCDPATH2.subbank_2.data_array_2.mem_0.way1_decc,
			  `SCDPATH2.subbank_2.data_array_2.mem_1.way0_decc,
			  `SCDPATH2.subbank_2.data_array_2.mem_1.way1_decc,
			    //sub 3
			  
			  {`SCDPATH2.subbank_3.data_array_2.mem_1.way_sel_d1   &
			   {2{`SCDPATH2.subbank_3.data_array_2.mem_1.acc_en_d1 &&
			      `SCDPATH2.subbank_3.data_array_2.mem_1.wr_en_d1}},
			   
			   `SCDPATH2.subbank_3.data_array_2.mem_0.way_sel_d1   &
			   {2{`SCDPATH2.subbank_3.data_array_2.mem_0.acc_en_d1 &&
			      `SCDPATH2.subbank_3.data_array_2.mem_0.wr_en_d1}},
			   
			   `SCDPATH2.subbank_3.data_array_1.mem_1.way_sel_d1   &
			   {2{`SCDPATH2.subbank_3.data_array_1.mem_1.acc_en_d1 &&
			      `SCDPATH2.subbank_3.data_array_1.mem_1.wr_en_d1}},
			   
			   `SCDPATH2.subbank_3.data_array_1.mem_0.way_sel_d1   &
			   {2{`SCDPATH2.subbank_3.data_array_1.mem_0.acc_en_d1 &&
			       `SCDPATH2.subbank_3.data_array_1.mem_0.wr_en_d1}},
			   
			   `SCDPATH2.subbank_3.data_array_0.mem_1.way_sel_d1   &
			   {2{`SCDPATH2.subbank_3.data_array_0.mem_1.acc_en_d1 &&
			      `SCDPATH2.subbank_3.data_array_0.mem_1.wr_en_d1}},
			   
			   `SCDPATH2.subbank_3.data_array_0.mem_0.way_sel_d1   &
			   {2{`SCDPATH2.subbank_3.data_array_0.mem_0.acc_en_d1 &&
			       `SCDPATH2.subbank_3.data_array_0.mem_0.wr_en_d1}}},
			  
			  {`SCDPATH2.subbank_3.data_array_2.mem_1.set_d1,
			   `SCDPATH2.subbank_3.data_array_2.mem_0.set_d1,
			   `SCDPATH2.subbank_3.data_array_1.mem_1.set_d1,
			   `SCDPATH2.subbank_3.data_array_1.mem_0.set_d1,
			   `SCDPATH2.subbank_3.data_array_0.mem_1.set_d1,
			   `SCDPATH2.subbank_3.data_array_0.mem_0.set_d1},

			  `SCDPATH2.subbank_3.data_array_0.mem_0.way0_decc,
			  `SCDPATH2.subbank_3.data_array_0.mem_0.way1_decc,
			  `SCDPATH2.subbank_3.data_array_0.mem_1.way0_decc,
			  `SCDPATH2.subbank_3.data_array_0.mem_1.way1_decc,
			  `SCDPATH2.subbank_3.data_array_1.mem_0.way0_decc,
			  `SCDPATH2.subbank_3.data_array_1.mem_0.way1_decc,
			  `SCDPATH2.subbank_3.data_array_1.mem_1.way0_decc,
			  `SCDPATH2.subbank_3.data_array_1.mem_1.way1_decc,
			  `SCDPATH2.subbank_3.data_array_2.mem_0.way0_decc,
			  `SCDPATH2.subbank_3.data_array_2.mem_0.way1_decc,
			  `SCDPATH2.subbank_3.data_array_2.mem_1.way0_decc,
			  `SCDPATH2.subbank_3.data_array_2.mem_1.way1_decc,
			  //bank 3
			  //tag
			  {`SCPATH3.tag.subbankab.wren_d1, `SCPATH3.tag.subbank89.wren_d1, 
			   `SCPATH3.tag.subbank67.wren_d1, `SCPATH3.tag.subbank45.wren_d1, 
			   `SCPATH3.tag.subbank23.wren_d1, `SCPATH3.tag.subbank01.wren_d1} & scrub3,
			  
			  {`SCPATH3.tag.subbankab.index_d1, `SCPATH3.tag.subbank89.index_d1,
			   `SCPATH3.tag.subbank67.index_d1, `SCPATH3.tag.subbank45.index_d1,
			   `SCPATH3.tag.subbank23.index_d1, `SCPATH3.tag.subbank01.index_d1}, 

			  {`SCPATH3.tag.subbankab.way_d1, `SCPATH3.tag.subbank89.way_d1,
			   `SCPATH3.tag.subbank67.way_d1, `SCPATH3.tag.subbank45.way_d1,
			   `SCPATH3.tag.subbank23.way_d1, `SCPATH3.tag.subbank01.way_d1},
			  
			  //tag data 12 ways
			  `SCPATH3.tag.subbank01.way0,
			  `SCPATH3.tag.subbank01.way1,
			  `SCPATH3.tag.subbank23.way0,
			  `SCPATH3.tag.subbank23.way1,
			  `SCPATH3.tag.subbank45.way0,
			  `SCPATH3.tag.subbank45.way1,
			  `SCPATH3.tag.subbank67.way0,
			  `SCPATH3.tag.subbank67.way1,
			  `SCPATH3.tag.subbank89.way0,
			  `SCPATH3.tag.subbank89.way1,
			  `SCPATH3.tag.subbankab.way0,
			  `SCPATH3.tag.subbankab.way1,
			  //data section
			  //sub 3
			
			  {`SCDPATH3.subbank_0.data_array_2.mem_1.way_sel_d1   &
			   {2{`SCDPATH3.subbank_0.data_array_2.mem_1.acc_en_d1 &&
			      `SCDPATH3.subbank_0.data_array_2.mem_1.wr_en_d1}},
			   
			   `SCDPATH3.subbank_0.data_array_2.mem_0.way_sel_d1   &
			   {2{`SCDPATH3.subbank_0.data_array_2.mem_0.acc_en_d1 &&
			      `SCDPATH3.subbank_0.data_array_2.mem_0.wr_en_d1}},
			   
			   `SCDPATH3.subbank_0.data_array_1.mem_1.way_sel_d1   &
			   {2{`SCDPATH3.subbank_0.data_array_1.mem_1.acc_en_d1 &&
			      `SCDPATH3.subbank_0.data_array_1.mem_1.wr_en_d1}},
			   
			   `SCDPATH3.subbank_0.data_array_1.mem_0.way_sel_d1   &
			   {2{`SCDPATH3.subbank_0.data_array_1.mem_0.acc_en_d1 &&
			       `SCDPATH3.subbank_0.data_array_1.mem_0.wr_en_d1}},
			   
			   `SCDPATH3.subbank_0.data_array_0.mem_1.way_sel_d1   &
			   {2{`SCDPATH3.subbank_0.data_array_0.mem_1.acc_en_d1 &&
			      `SCDPATH3.subbank_0.data_array_0.mem_1.wr_en_d1}},
			   
			   `SCDPATH3.subbank_0.data_array_0.mem_0.way_sel_d1   &
			   {2{`SCDPATH3.subbank_0.data_array_0.mem_0.acc_en_d1 &&
			      `SCDPATH3.subbank_0.data_array_0.mem_0.wr_en_d1}}},
			  
			  {`SCDPATH3.subbank_0.data_array_2.mem_1.set_d1,
			   `SCDPATH3.subbank_0.data_array_2.mem_0.set_d1,
			   `SCDPATH3.subbank_0.data_array_1.mem_1.set_d1,
			   `SCDPATH3.subbank_0.data_array_1.mem_0.set_d1,
			   `SCDPATH3.subbank_0.data_array_0.mem_1.set_d1,
			   `SCDPATH3.subbank_0.data_array_0.mem_0.set_d1},

			  `SCDPATH3.subbank_0.data_array_0.mem_0.way0_decc,
			  `SCDPATH3.subbank_0.data_array_0.mem_0.way1_decc,
			  `SCDPATH3.subbank_0.data_array_0.mem_1.way0_decc,
			  `SCDPATH3.subbank_0.data_array_0.mem_1.way1_decc,
			  `SCDPATH3.subbank_0.data_array_1.mem_0.way0_decc,
			  `SCDPATH3.subbank_0.data_array_1.mem_0.way1_decc,
			  `SCDPATH3.subbank_0.data_array_1.mem_1.way0_decc,
			  `SCDPATH3.subbank_0.data_array_1.mem_1.way1_decc,
			  `SCDPATH3.subbank_0.data_array_2.mem_0.way0_decc,
			  `SCDPATH3.subbank_0.data_array_2.mem_0.way1_decc,
			  `SCDPATH3.subbank_0.data_array_2.mem_1.way0_decc,
			  `SCDPATH3.subbank_0.data_array_2.mem_1.way1_decc,

			  //sub 1
			  
			  {`SCDPATH3.subbank_1.data_array_2.mem_1.way_sel_d1   &
			   {2{`SCDPATH3.subbank_1.data_array_2.mem_1.acc_en_d1 &&
			      `SCDPATH3.subbank_1.data_array_2.mem_1.wr_en_d1}},
			   
			   `SCDPATH3.subbank_1.data_array_2.mem_0.way_sel_d1   &
			   {2{`SCDPATH3.subbank_1.data_array_2.mem_0.acc_en_d1 &&
			      `SCDPATH3.subbank_1.data_array_2.mem_0.wr_en_d1}},
			   
			   `SCDPATH3.subbank_1.data_array_1.mem_1.way_sel_d1   &
			   {2{`SCDPATH3.subbank_1.data_array_1.mem_1.acc_en_d1 &&
			      `SCDPATH3.subbank_1.data_array_1.mem_1.wr_en_d1}},
			   
			   `SCDPATH3.subbank_1.data_array_1.mem_0.way_sel_d1   &
			   {2{`SCDPATH3.subbank_1.data_array_1.mem_0.acc_en_d1 &&
			       `SCDPATH3.subbank_1.data_array_1.mem_0.wr_en_d1}},
			   
			   `SCDPATH3.subbank_1.data_array_0.mem_1.way_sel_d1   &
			   {2{`SCDPATH3.subbank_1.data_array_0.mem_1.acc_en_d1 &&
			      `SCDPATH3.subbank_1.data_array_0.mem_1.wr_en_d1}},
			   
			   `SCDPATH3.subbank_1.data_array_0.mem_0.way_sel_d1   &
			   {2{`SCDPATH3.subbank_1.data_array_0.mem_0.acc_en_d1 &&
			      `SCDPATH3.subbank_1.data_array_0.mem_0.wr_en_d1}}},
			  
			  {`SCDPATH3.subbank_1.data_array_2.mem_1.set_d1,
			   `SCDPATH3.subbank_1.data_array_2.mem_0.set_d1,
			   `SCDPATH3.subbank_1.data_array_1.mem_1.set_d1,
			   `SCDPATH3.subbank_1.data_array_1.mem_0.set_d1,
			   `SCDPATH3.subbank_1.data_array_0.mem_1.set_d1,
			   `SCDPATH3.subbank_1.data_array_0.mem_0.set_d1},

			  `SCDPATH3.subbank_1.data_array_0.mem_0.way0_decc,
			  `SCDPATH3.subbank_1.data_array_0.mem_0.way1_decc,
			  `SCDPATH3.subbank_1.data_array_0.mem_1.way0_decc,
			  `SCDPATH3.subbank_1.data_array_0.mem_1.way1_decc,
			  `SCDPATH3.subbank_1.data_array_1.mem_0.way0_decc,
			  `SCDPATH3.subbank_1.data_array_1.mem_0.way1_decc,
			  `SCDPATH3.subbank_1.data_array_1.mem_1.way0_decc,
			  `SCDPATH3.subbank_1.data_array_1.mem_1.way1_decc,
			  `SCDPATH3.subbank_1.data_array_2.mem_0.way0_decc,
			  `SCDPATH3.subbank_1.data_array_2.mem_0.way1_decc,
			  `SCDPATH3.subbank_1.data_array_2.mem_1.way0_decc,
			  `SCDPATH3.subbank_1.data_array_2.mem_1.way1_decc,
			   //sub 2
			   {`SCDPATH3.subbank_2.data_array_2.mem_1.way_sel_d1   &
			   {2{`SCDPATH3.subbank_2.data_array_2.mem_1.acc_en_d1 &&
			      `SCDPATH3.subbank_2.data_array_2.mem_1.wr_en_d1}},
			   
			   `SCDPATH3.subbank_2.data_array_2.mem_0.way_sel_d1   &
			   {2{`SCDPATH3.subbank_2.data_array_2.mem_0.acc_en_d1 &&
			      `SCDPATH3.subbank_2.data_array_2.mem_0.wr_en_d1}},
			   
			   `SCDPATH3.subbank_2.data_array_1.mem_1.way_sel_d1   &
			   {2{`SCDPATH3.subbank_2.data_array_1.mem_1.acc_en_d1 &&
			      `SCDPATH3.subbank_2.data_array_1.mem_1.wr_en_d1}},
			   
			   `SCDPATH3.subbank_2.data_array_1.mem_0.way_sel_d1   &
			   {2{`SCDPATH3.subbank_2.data_array_1.mem_0.acc_en_d1 &&
			       `SCDPATH3.subbank_2.data_array_1.mem_0.wr_en_d1}},
			   
			   `SCDPATH3.subbank_2.data_array_0.mem_1.way_sel_d1   &
			   {2{`SCDPATH3.subbank_2.data_array_0.mem_1.acc_en_d1 &&
			      `SCDPATH3.subbank_2.data_array_0.mem_1.wr_en_d1}},
			   
			   `SCDPATH3.subbank_2.data_array_0.mem_0.way_sel_d1   &
			   {2{`SCDPATH3.subbank_2.data_array_0.mem_0.acc_en_d1 &&
			      `SCDPATH3.subbank_2.data_array_0.mem_0.wr_en_d1}}},
			  
			  {`SCDPATH3.subbank_2.data_array_2.mem_1.set_d1,
			   `SCDPATH3.subbank_2.data_array_2.mem_0.set_d1,
			   `SCDPATH3.subbank_2.data_array_1.mem_1.set_d1,
			   `SCDPATH3.subbank_2.data_array_1.mem_0.set_d1,
			   `SCDPATH3.subbank_2.data_array_0.mem_1.set_d1,
			   `SCDPATH3.subbank_2.data_array_0.mem_0.set_d1},

			  `SCDPATH3.subbank_2.data_array_0.mem_0.way0_decc,
			  `SCDPATH3.subbank_2.data_array_0.mem_0.way1_decc,
			  `SCDPATH3.subbank_2.data_array_0.mem_1.way0_decc,
			  `SCDPATH3.subbank_2.data_array_0.mem_1.way1_decc,
			  `SCDPATH3.subbank_2.data_array_1.mem_0.way0_decc,
			  `SCDPATH3.subbank_2.data_array_1.mem_0.way1_decc,
			  `SCDPATH3.subbank_2.data_array_1.mem_1.way0_decc,
			  `SCDPATH3.subbank_2.data_array_1.mem_1.way1_decc,
			  `SCDPATH3.subbank_2.data_array_2.mem_0.way0_decc,
			  `SCDPATH3.subbank_2.data_array_2.mem_0.way1_decc,
			  `SCDPATH3.subbank_2.data_array_2.mem_1.way0_decc,
			  `SCDPATH3.subbank_2.data_array_2.mem_1.way1_decc,
			    //sub 3
			  
			  {`SCDPATH3.subbank_3.data_array_2.mem_1.way_sel_d1   &
			   {2{`SCDPATH3.subbank_3.data_array_2.mem_1.acc_en_d1 &&
			      `SCDPATH3.subbank_3.data_array_2.mem_1.wr_en_d1}},
			   
			   `SCDPATH3.subbank_3.data_array_2.mem_0.way_sel_d1   &
			   {2{`SCDPATH3.subbank_3.data_array_2.mem_0.acc_en_d1 &&
			      `SCDPATH3.subbank_3.data_array_2.mem_0.wr_en_d1}},
			   
			   `SCDPATH3.subbank_3.data_array_1.mem_1.way_sel_d1   &
			   {2{`SCDPATH3.subbank_3.data_array_1.mem_1.acc_en_d1 &&
			      `SCDPATH3.subbank_3.data_array_1.mem_1.wr_en_d1}},
			   
			   `SCDPATH3.subbank_3.data_array_1.mem_0.way_sel_d1   &
			   {2{`SCDPATH3.subbank_3.data_array_1.mem_0.acc_en_d1 &&
			      `SCDPATH3.subbank_3.data_array_1.mem_0.wr_en_d1}},
			   
			   `SCDPATH3.subbank_3.data_array_0.mem_1.way_sel_d1   &
			   {2{`SCDPATH3.subbank_3.data_array_0.mem_1.acc_en_d1 &&
			      `SCDPATH3.subbank_3.data_array_0.mem_1.wr_en_d1}},
			   
			   `SCDPATH3.subbank_3.data_array_0.mem_0.way_sel_d1   &
			   {2{`SCDPATH3.subbank_3.data_array_0.mem_0.acc_en_d1 &&
			      `SCDPATH3.subbank_3.data_array_0.mem_0.wr_en_d1}}},
			  
			  {`SCDPATH3.subbank_3.data_array_2.mem_1.set_d1,
			   `SCDPATH3.subbank_3.data_array_2.mem_0.set_d1,
			   `SCDPATH3.subbank_3.data_array_1.mem_1.set_d1,
			   `SCDPATH3.subbank_3.data_array_1.mem_0.set_d1,
			   `SCDPATH3.subbank_3.data_array_0.mem_1.set_d1,
			   `SCDPATH3.subbank_3.data_array_0.mem_0.set_d1},

			  `SCDPATH3.subbank_3.data_array_0.mem_0.way0_decc,
			  `SCDPATH3.subbank_3.data_array_0.mem_0.way1_decc,
			  `SCDPATH3.subbank_3.data_array_0.mem_1.way0_decc,
			  `SCDPATH3.subbank_3.data_array_0.mem_1.way1_decc,
			  `SCDPATH3.subbank_3.data_array_1.mem_0.way0_decc,
			  `SCDPATH3.subbank_3.data_array_1.mem_0.way1_decc,
			  `SCDPATH3.subbank_3.data_array_1.mem_1.way0_decc,
			  `SCDPATH3.subbank_3.data_array_1.mem_1.way1_decc,
			  `SCDPATH3.subbank_3.data_array_2.mem_0.way0_decc,
			  `SCDPATH3.subbank_3.data_array_2.mem_0.way1_decc,
			  `SCDPATH3.subbank_3.data_array_2.mem_1.way0_decc,
			  `SCDPATH3.subbank_3.data_array_2.mem_1.way1_decc
			 );
      
      //invalidate l1 and l2 cache
      if(start_counter)$pc_trigger_event(2, 
					 start_counter,
					 //bank0
					 `SCPATH0.mbctl.mb_valid,
					 //bank0
					 `SCPATH1.mbctl.mb_valid,
					 //bank0
					 `SCPATH2.mbctl.mb_valid,
					 //bank0
					 `SCPATH3.mbctl.mb_valid,
					 `ifdef RTL_SPARC0
					 //sparc0
					 {`SPCPATH0.lsu.lsu_ifu_stbcnt0,`SPCPATH0.lsu.lsu_ifu_stbcnt1,
					  `SPCPATH0.lsu.lsu_ifu_stbcnt2,`SPCPATH0.lsu.lsu_ifu_stbcnt3},
`ifdef FPGA_SYN_IDCT
{`ICVPATH0.idcv_ary_1111,`ICVPATH0.idcv_ary_1110,
 `ICVPATH0.idcv_ary_1101,`ICVPATH0.idcv_ary_1100,
 `ICVPATH0.idcv_ary_1011,`ICVPATH0.idcv_ary_1010,
 `ICVPATH0.idcv_ary_1001,`ICVPATH0.idcv_ary_1000,
 `ICVPATH0.idcv_ary_0111,`ICVPATH0.idcv_ary_0110,
 `ICVPATH0.idcv_ary_0101,`ICVPATH0.idcv_ary_0100,
 `ICVPATH0.idcv_ary_0011,`ICVPATH0.idcv_ary_0010,
 `ICVPATH0.idcv_ary_0001,`ICVPATH0.idcv_ary_0000},
{`DVLD0.idcv_ary_1111,`DVLD0.idcv_ary_1110,
 `DVLD0.idcv_ary_1101,`DVLD0.idcv_ary_1100,
 `DVLD0.idcv_ary_1011,`DVLD0.idcv_ary_1010,
 `DVLD0.idcv_ary_1001,`DVLD0.idcv_ary_1000,
 `DVLD0.idcv_ary_0111,`DVLD0.idcv_ary_0110,
 `DVLD0.idcv_ary_0101,`DVLD0.idcv_ary_0100,
 `DVLD0.idcv_ary_0011,`DVLD0.idcv_ary_0010,
 `DVLD0.idcv_ary_0001,`DVLD0.idcv_ary_0000},
`else
					 `ICVPATH0.idcv_ary,
					 `DVLD0.idcv_ary,
`endif // FPGA_SYN
					 `else
					 1'b0,//dummy
					 1'b0,
					 1'b0,
					 `endif
					`ifdef RTL_SPARC1
					 //sparc1
					 {`SPCPATH1.lsu.lsu_ifu_stbcnt0,`SPCPATH1.lsu.lsu_ifu_stbcnt1,
					  `SPCPATH1.lsu.lsu_ifu_stbcnt2,`SPCPATH1.lsu.lsu_ifu_stbcnt3},
`ifdef FPGA_SYN_IDCT
{`ICVPATH1.idcv_ary_1111,`ICVPATH1.idcv_ary_1110,
 `ICVPATH1.idcv_ary_1101,`ICVPATH1.idcv_ary_1100,
 `ICVPATH1.idcv_ary_1011,`ICVPATH1.idcv_ary_1010,
 `ICVPATH1.idcv_ary_1001,`ICVPATH1.idcv_ary_1000,
 `ICVPATH1.idcv_ary_0111,`ICVPATH1.idcv_ary_0110,
 `ICVPATH1.idcv_ary_0101,`ICVPATH1.idcv_ary_0100,
 `ICVPATH1.idcv_ary_0011,`ICVPATH1.idcv_ary_0010,
 `ICVPATH1.idcv_ary_0001,`ICVPATH1.idcv_ary_0000},
{`DVLD1.idcv_ary_1111,`DVLD1.idcv_ary_1110,
 `DVLD1.idcv_ary_1101,`DVLD1.idcv_ary_1100,
 `DVLD1.idcv_ary_1011,`DVLD1.idcv_ary_1010,
 `DVLD1.idcv_ary_1001,`DVLD1.idcv_ary_1000,
 `DVLD1.idcv_ary_0111,`DVLD1.idcv_ary_0110,
 `DVLD1.idcv_ary_0101,`DVLD1.idcv_ary_0100,
 `DVLD1.idcv_ary_0011,`DVLD1.idcv_ary_0010,
 `DVLD1.idcv_ary_0001,`DVLD1.idcv_ary_0000},
`else
					 `ICVPATH1.idcv_ary,
					 `DVLD1.idcv_ary,
`endif // FPGA_SYN
					 `else
					 1'b0,//dummy
					 1'b0,
					 1'b0,
					 `endif
					 `ifdef RTL_SPARC2
					 //sparc2
					 {`SPCPATH2.lsu.lsu_ifu_stbcnt0,`SPCPATH2.lsu.lsu_ifu_stbcnt1,
					  `SPCPATH2.lsu.lsu_ifu_stbcnt2,`SPCPATH2.lsu.lsu_ifu_stbcnt3},
`ifdef FPGA_SYN_IDCT
{`ICVPATH2.idcv_ary_1111,`ICVPATH2.idcv_ary_1110,
 `ICVPATH2.idcv_ary_1101,`ICVPATH2.idcv_ary_1100,
 `ICVPATH2.idcv_ary_1011,`ICVPATH2.idcv_ary_1010,
 `ICVPATH2.idcv_ary_1001,`ICVPATH2.idcv_ary_1000,
 `ICVPATH2.idcv_ary_0111,`ICVPATH2.idcv_ary_0110,
 `ICVPATH2.idcv_ary_0101,`ICVPATH2.idcv_ary_0100,
 `ICVPATH2.idcv_ary_0011,`ICVPATH2.idcv_ary_0010,
 `ICVPATH2.idcv_ary_0001,`ICVPATH2.idcv_ary_0000},
{`DVLD2.idcv_ary_1111,`DVLD2.idcv_ary_1110,
 `DVLD2.idcv_ary_1101,`DVLD2.idcv_ary_1100,
 `DVLD2.idcv_ary_1011,`DVLD2.idcv_ary_1010,
 `DVLD2.idcv_ary_1001,`DVLD2.idcv_ary_1000,
 `DVLD2.idcv_ary_0111,`DVLD2.idcv_ary_0110,
 `DVLD2.idcv_ary_0101,`DVLD2.idcv_ary_0100,
 `DVLD2.idcv_ary_0011,`DVLD2.idcv_ary_0010,
 `DVLD2.idcv_ary_0001,`DVLD2.idcv_ary_0000},
`else
					 `ICVPATH2.idcv_ary,
					 `DVLD2.idcv_ary,
`endif // FPGA_SYN
					 `else
					 1'b0,//dummy
					 1'b0,
					 1'b0,
					 `endif
					`ifdef RTL_SPARC3
					 //sparc3
					 {`SPCPATH3.lsu.lsu_ifu_stbcnt0,`SPCPATH3.lsu.lsu_ifu_stbcnt1,
					  `SPCPATH3.lsu.lsu_ifu_stbcnt2,`SPCPATH3.lsu.lsu_ifu_stbcnt3},
`ifdef FPGA_SYN_IDCT
{`ICVPATH3.idcv_ary_1111,`ICVPATH3.idcv_ary_1110,
 `ICVPATH3.idcv_ary_1101,`ICVPATH3.idcv_ary_1100,
 `ICVPATH3.idcv_ary_1011,`ICVPATH3.idcv_ary_1010,
 `ICVPATH3.idcv_ary_1001,`ICVPATH3.idcv_ary_1000,
 `ICVPATH3.idcv_ary_0111,`ICVPATH3.idcv_ary_0110,
 `ICVPATH3.idcv_ary_0101,`ICVPATH3.idcv_ary_0100,
 `ICVPATH3.idcv_ary_0011,`ICVPATH3.idcv_ary_0010,
 `ICVPATH3.idcv_ary_0001,`ICVPATH3.idcv_ary_0000},
{`DVLD3.idcv_ary_1111,`DVLD3.idcv_ary_1110,
 `DVLD3.idcv_ary_1101,`DVLD3.idcv_ary_1100,
 `DVLD3.idcv_ary_1011,`DVLD3.idcv_ary_1010,
 `DVLD3.idcv_ary_1001,`DVLD3.idcv_ary_1000,
 `DVLD3.idcv_ary_0111,`DVLD3.idcv_ary_0110,
 `DVLD3.idcv_ary_0101,`DVLD3.idcv_ary_0100,
 `DVLD3.idcv_ary_0011,`DVLD3.idcv_ary_0010,
 `DVLD3.idcv_ary_0001,`DVLD3.idcv_ary_0000},
`else
					 `ICVPATH3.idcv_ary,
					 `DVLD3.idcv_ary,
`endif // FPGA_SYN
					 `else
					 1'b0,//dummy
					 1'b0,
					 1'b0,
					 `endif // !`ifdef RTL_SPARC0
					 `ifdef RTL_SPARC4
					 //sparc4
					 {`SPCPATH4.lsu.lsu_ifu_stbcnt0,`SPCPATH4.lsu.lsu_ifu_stbcnt1,
					  `SPCPATH4.lsu.lsu_ifu_stbcnt2,`SPCPATH4.lsu.lsu_ifu_stbcnt3},
`ifdef FPGA_SYN_IDCT
{`ICVPATH4.idcv_ary_1111,`ICVPATH4.idcv_ary_1110,
 `ICVPATH4.idcv_ary_1101,`ICVPATH4.idcv_ary_1100,
 `ICVPATH4.idcv_ary_1011,`ICVPATH4.idcv_ary_1010,
 `ICVPATH4.idcv_ary_1001,`ICVPATH4.idcv_ary_1000,
 `ICVPATH4.idcv_ary_0111,`ICVPATH4.idcv_ary_0110,
 `ICVPATH4.idcv_ary_0101,`ICVPATH4.idcv_ary_0100,
 `ICVPATH4.idcv_ary_0011,`ICVPATH4.idcv_ary_0010,
 `ICVPATH4.idcv_ary_0001,`ICVPATH4.idcv_ary_0000},
{`DVLD4.idcv_ary_1111,`DVLD4.idcv_ary_1110,
 `DVLD4.idcv_ary_1101,`DVLD4.idcv_ary_1100,
 `DVLD4.idcv_ary_1011,`DVLD4.idcv_ary_1010,
 `DVLD4.idcv_ary_1001,`DVLD4.idcv_ary_1000,
 `DVLD4.idcv_ary_0111,`DVLD4.idcv_ary_0110,
 `DVLD4.idcv_ary_0101,`DVLD4.idcv_ary_0100,
 `DVLD4.idcv_ary_0011,`DVLD4.idcv_ary_0010,
 `DVLD4.idcv_ary_0001,`DVLD4.idcv_ary_0000},
`else
					 `ICVPATH4.idcv_ary,
					 `DVLD4.idcv_ary,
`endif // FPGA_SYN
					 `else
					 1'b0,//dummy
					 1'b0,
					 1'b0,
					 `endif
					`ifdef RTL_SPARC5
					 //sparc0
					 {`SPCPATH5.lsu.lsu_ifu_stbcnt0,`SPCPATH5.lsu.lsu_ifu_stbcnt1,
					  `SPCPATH5.lsu.lsu_ifu_stbcnt2,`SPCPATH5.lsu.lsu_ifu_stbcnt3},
`ifdef FPGA_SYN_IDCT
{`ICVPATH5.idcv_ary_1111,`ICVPATH5.idcv_ary_1110,
 `ICVPATH5.idcv_ary_1101,`ICVPATH5.idcv_ary_1100,
 `ICVPATH5.idcv_ary_1011,`ICVPATH5.idcv_ary_1010,
 `ICVPATH5.idcv_ary_1001,`ICVPATH5.idcv_ary_1000,
 `ICVPATH5.idcv_ary_0111,`ICVPATH5.idcv_ary_0110,
 `ICVPATH5.idcv_ary_0101,`ICVPATH5.idcv_ary_0100,
 `ICVPATH5.idcv_ary_0011,`ICVPATH5.idcv_ary_0010,
 `ICVPATH5.idcv_ary_0001,`ICVPATH5.idcv_ary_0000},
{`DVLD5.idcv_ary_1111,`DVLD5.idcv_ary_1110,
 `DVLD5.idcv_ary_1101,`DVLD5.idcv_ary_1100,
 `DVLD5.idcv_ary_1011,`DVLD5.idcv_ary_1010,
 `DVLD5.idcv_ary_1001,`DVLD5.idcv_ary_1000,
 `DVLD5.idcv_ary_0111,`DVLD5.idcv_ary_0110,
 `DVLD5.idcv_ary_0101,`DVLD5.idcv_ary_0100,
 `DVLD5.idcv_ary_0011,`DVLD5.idcv_ary_0010,
 `DVLD5.idcv_ary_0001,`DVLD5.idcv_ary_0000},
`else
					 `ICVPATH5.idcv_ary,
					 `DVLD5.idcv_ary,
`endif // FPGA_SYN
					 `else
					 1'b0,//dummy
					 1'b0,
					 1'b0,
					 `endif
					 `ifdef RTL_SPARC6
					 //sparc0
					 {`SPCPATH6.lsu.lsu_ifu_stbcnt0,`SPCPATH6.lsu.lsu_ifu_stbcnt1,
					  `SPCPATH6.lsu.lsu_ifu_stbcnt2,`SPCPATH6.lsu.lsu_ifu_stbcnt3},
`ifdef FPGA_SYN_IDCT
{`ICVPATH6.idcv_ary_1111,`ICVPATH6.idcv_ary_1110,
 `ICVPATH6.idcv_ary_1101,`ICVPATH6.idcv_ary_1100,
 `ICVPATH6.idcv_ary_1011,`ICVPATH6.idcv_ary_1010,
 `ICVPATH6.idcv_ary_1001,`ICVPATH6.idcv_ary_1000,
 `ICVPATH6.idcv_ary_0111,`ICVPATH6.idcv_ary_0110,
 `ICVPATH6.idcv_ary_0101,`ICVPATH6.idcv_ary_0100,
 `ICVPATH6.idcv_ary_0011,`ICVPATH6.idcv_ary_0010,
 `ICVPATH6.idcv_ary_0001,`ICVPATH6.idcv_ary_0000},
{`DVLD6.idcv_ary_1111,`DVLD6.idcv_ary_1110,
 `DVLD6.idcv_ary_1101,`DVLD6.idcv_ary_1100,
 `DVLD6.idcv_ary_1011,`DVLD6.idcv_ary_1010,
 `DVLD6.idcv_ary_1001,`DVLD6.idcv_ary_1000,
 `DVLD6.idcv_ary_0111,`DVLD6.idcv_ary_0110,
 `DVLD6.idcv_ary_0101,`DVLD6.idcv_ary_0100,
 `DVLD6.idcv_ary_0011,`DVLD6.idcv_ary_0010,
 `DVLD6.idcv_ary_0001,`DVLD6.idcv_ary_0000},
`else
					 `ICVPATH6.idcv_ary,
					 `DVLD6.idcv_ary,
`endif // FPGA_SYN
					 `else
					 1'b0,//dummy
					 1'b0,
					 1'b0,
					 `endif
					`ifdef RTL_SPARC7
					 //sparc7
					 {`SPCPATH7.lsu.lsu_ifu_stbcnt0,`SPCPATH7.lsu.lsu_ifu_stbcnt1,
					  `SPCPATH7.lsu.lsu_ifu_stbcnt2,`SPCPATH7.lsu.lsu_ifu_stbcnt3},
`ifdef FPGA_SYN_IDCT
{`ICVPATH7.idcv_ary_1111,`ICVPATH7.idcv_ary_1110,
 `ICVPATH7.idcv_ary_1101,`ICVPATH7.idcv_ary_1100,
 `ICVPATH7.idcv_ary_1011,`ICVPATH7.idcv_ary_1010,
 `ICVPATH7.idcv_ary_1001,`ICVPATH7.idcv_ary_1000,
 `ICVPATH7.idcv_ary_0111,`ICVPATH7.idcv_ary_0110,
 `ICVPATH7.idcv_ary_0101,`ICVPATH7.idcv_ary_0100,
 `ICVPATH7.idcv_ary_0011,`ICVPATH7.idcv_ary_0010,
 `ICVPATH7.idcv_ary_0001,`ICVPATH7.idcv_ary_0000},
{`DVLD7.idcv_ary_1111,`DVLD7.idcv_ary_1110,
 `DVLD7.idcv_ary_1101,`DVLD7.idcv_ary_1100,
 `DVLD7.idcv_ary_1011,`DVLD7.idcv_ary_1010,
 `DVLD7.idcv_ary_1001,`DVLD7.idcv_ary_1000,
 `DVLD7.idcv_ary_0111,`DVLD7.idcv_ary_0110,
 `DVLD7.idcv_ary_0101,`DVLD7.idcv_ary_0100,
 `DVLD7.idcv_ary_0011,`DVLD7.idcv_ary_0010,
 `DVLD7.idcv_ary_0001,`DVLD7.idcv_ary_0000},
`else
					 `ICVPATH7.idcv_ary,
					 `DVLD7.idcv_ary,
`endif // FPGA_SYN
					 `else
					 1'b0,//dummy
					 1'b0,
					 1'b0,
					 `endif
					 );
   end // always @ (posedge clk)
   
   //monitor pc and instruction done
   //E-stage, D-stage, M-stage, and W-stage
   //l1 & l2 invalide here
    always @(posedge clk) begin
 `ifdef RTL_SPARC0
       if(`PC_CMP.spc0_inst_done)begin
`ifdef FPGA_SYN_IRF
`ifdef FPGA_SYN_1THREAD
    active_win[0]    = `SPARC_REG0.bw_r_irf_core.register00.onereg;
    active_win[4]    = `SPARC_REG0.bw_r_irf_core.register01.onereg;
    active_win[8]    = `SPARC_REG0.bw_r_irf_core.register02.onereg;
    active_win[12]   = `SPARC_REG0.bw_r_irf_core.register03.onereg;
    active_win[16]   = `SPARC_REG0.bw_r_irf_core.register04.onereg;
    active_win[20]   = `SPARC_REG0.bw_r_irf_core.register05.onereg;
    active_win[24]   = `SPARC_REG0.bw_r_irf_core.register06.onereg;
    active_win[28]   = `SPARC_REG0.bw_r_irf_core.register07.onereg;
    active_win[32]   = `SPARC_REG0.bw_r_irf_core.register08.onereg;
    active_win[36]   = `SPARC_REG0.bw_r_irf_core.register09.onereg;
    active_win[40]   = `SPARC_REG0.bw_r_irf_core.register10.onereg;
    active_win[44]   = `SPARC_REG0.bw_r_irf_core.register11.onereg;
    active_win[48]   = `SPARC_REG0.bw_r_irf_core.register12.onereg;
    active_win[52]   = `SPARC_REG0.bw_r_irf_core.register13.onereg;
    active_win[56]   = `SPARC_REG0.bw_r_irf_core.register14.onereg;
    active_win[60]   = `SPARC_REG0.bw_r_irf_core.register15.onereg;
    active_win[64]   = `SPARC_REG0.bw_r_irf_core.register16.onereg;
    active_win[68]   = `SPARC_REG0.bw_r_irf_core.register17.onereg;
    active_win[72]   = `SPARC_REG0.bw_r_irf_core.register18.onereg;
    active_win[76]   = `SPARC_REG0.bw_r_irf_core.register19.onereg;
    active_win[80]   = `SPARC_REG0.bw_r_irf_core.register20.onereg;
    active_win[84]   = `SPARC_REG0.bw_r_irf_core.register21.onereg;
    active_win[88]   = `SPARC_REG0.bw_r_irf_core.register22.onereg;
    active_win[92]   = `SPARC_REG0.bw_r_irf_core.register23.onereg;
    active_win[96]   = `SPARC_REG0.bw_r_irf_core.register24.onereg;
    active_win[100]  = `SPARC_REG0.bw_r_irf_core.register25.onereg;
    active_win[104]  = `SPARC_REG0.bw_r_irf_core.register26.onereg;
    active_win[108]  = `SPARC_REG0.bw_r_irf_core.register27.onereg;
    active_win[112]  = `SPARC_REG0.bw_r_irf_core.register28.onereg;
    active_win[116]  = `SPARC_REG0.bw_r_irf_core.register29.onereg;
    active_win[120]  = `SPARC_REG0.bw_r_irf_core.register30.onereg;
    active_win[124]  = `SPARC_REG0.bw_r_irf_core.register31.onereg;
`else
    active_win[0]    = `SPARC_REG0.bw_r_irf_core.register00.reg_th0;
    active_win[1]    = `SPARC_REG0.bw_r_irf_core.register00.reg_th1;
    active_win[2]    = `SPARC_REG0.bw_r_irf_core.register00.reg_th2;
    active_win[3]    = `SPARC_REG0.bw_r_irf_core.register00.reg_th3;
    active_win[4]    = `SPARC_REG0.bw_r_irf_core.register01.reg_th0;
    active_win[5]    = `SPARC_REG0.bw_r_irf_core.register01.reg_th1;
    active_win[6]    = `SPARC_REG0.bw_r_irf_core.register01.reg_th2;
    active_win[7]    = `SPARC_REG0.bw_r_irf_core.register01.reg_th3;
    active_win[8]    = `SPARC_REG0.bw_r_irf_core.register02.reg_th0;
    active_win[9]    = `SPARC_REG0.bw_r_irf_core.register02.reg_th1;
    active_win[10]   = `SPARC_REG0.bw_r_irf_core.register02.reg_th2;
    active_win[11]   = `SPARC_REG0.bw_r_irf_core.register02.reg_th3;
    active_win[12]   = `SPARC_REG0.bw_r_irf_core.register03.reg_th0;
    active_win[13]   = `SPARC_REG0.bw_r_irf_core.register03.reg_th1;
    active_win[14]   = `SPARC_REG0.bw_r_irf_core.register03.reg_th2;
    active_win[15]   = `SPARC_REG0.bw_r_irf_core.register03.reg_th3;
    active_win[16]   = `SPARC_REG0.bw_r_irf_core.register04.reg_th0;
    active_win[17]   = `SPARC_REG0.bw_r_irf_core.register04.reg_th1;
    active_win[18]   = `SPARC_REG0.bw_r_irf_core.register04.reg_th2;
    active_win[19]   = `SPARC_REG0.bw_r_irf_core.register04.reg_th3;
    active_win[20]   = `SPARC_REG0.bw_r_irf_core.register05.reg_th0;
    active_win[21]   = `SPARC_REG0.bw_r_irf_core.register05.reg_th1;
    active_win[22]   = `SPARC_REG0.bw_r_irf_core.register05.reg_th2;
    active_win[23]   = `SPARC_REG0.bw_r_irf_core.register05.reg_th3;
    active_win[24]   = `SPARC_REG0.bw_r_irf_core.register06.reg_th0;
    active_win[25]   = `SPARC_REG0.bw_r_irf_core.register06.reg_th1;
    active_win[26]   = `SPARC_REG0.bw_r_irf_core.register06.reg_th2;
    active_win[27]   = `SPARC_REG0.bw_r_irf_core.register06.reg_th3;
    active_win[28]   = `SPARC_REG0.bw_r_irf_core.register07.reg_th0;
    active_win[29]   = `SPARC_REG0.bw_r_irf_core.register07.reg_th1;
    active_win[30]   = `SPARC_REG0.bw_r_irf_core.register07.reg_th2;
    active_win[31]   = `SPARC_REG0.bw_r_irf_core.register07.reg_th3;
    active_win[32]   = `SPARC_REG0.bw_r_irf_core.register08.reg_th0;
    active_win[33]   = `SPARC_REG0.bw_r_irf_core.register08.reg_th1;
    active_win[34]   = `SPARC_REG0.bw_r_irf_core.register08.reg_th2;
    active_win[35]   = `SPARC_REG0.bw_r_irf_core.register08.reg_th3;
    active_win[36]   = `SPARC_REG0.bw_r_irf_core.register09.reg_th0;
    active_win[37]   = `SPARC_REG0.bw_r_irf_core.register09.reg_th1;
    active_win[38]   = `SPARC_REG0.bw_r_irf_core.register09.reg_th2;
    active_win[39]   = `SPARC_REG0.bw_r_irf_core.register09.reg_th3;
    active_win[40]   = `SPARC_REG0.bw_r_irf_core.register10.reg_th0;
    active_win[41]   = `SPARC_REG0.bw_r_irf_core.register10.reg_th1;
    active_win[42]   = `SPARC_REG0.bw_r_irf_core.register10.reg_th2;
    active_win[43]   = `SPARC_REG0.bw_r_irf_core.register10.reg_th3;
    active_win[44]   = `SPARC_REG0.bw_r_irf_core.register11.reg_th0;
    active_win[45]   = `SPARC_REG0.bw_r_irf_core.register11.reg_th1;
    active_win[46]   = `SPARC_REG0.bw_r_irf_core.register11.reg_th2;
    active_win[47]   = `SPARC_REG0.bw_r_irf_core.register11.reg_th3;
    active_win[48]   = `SPARC_REG0.bw_r_irf_core.register12.reg_th0;
    active_win[49]   = `SPARC_REG0.bw_r_irf_core.register12.reg_th1;
    active_win[50]   = `SPARC_REG0.bw_r_irf_core.register12.reg_th2;
    active_win[51]   = `SPARC_REG0.bw_r_irf_core.register12.reg_th3;
    active_win[52]   = `SPARC_REG0.bw_r_irf_core.register13.reg_th0;
    active_win[53]   = `SPARC_REG0.bw_r_irf_core.register13.reg_th1;
    active_win[54]   = `SPARC_REG0.bw_r_irf_core.register13.reg_th2;
    active_win[55]   = `SPARC_REG0.bw_r_irf_core.register13.reg_th3;
    active_win[56]   = `SPARC_REG0.bw_r_irf_core.register14.reg_th0;
    active_win[57]   = `SPARC_REG0.bw_r_irf_core.register14.reg_th1;
    active_win[58]   = `SPARC_REG0.bw_r_irf_core.register14.reg_th2;
    active_win[59]   = `SPARC_REG0.bw_r_irf_core.register14.reg_th3;
    active_win[60]   = `SPARC_REG0.bw_r_irf_core.register15.reg_th0;
    active_win[61]   = `SPARC_REG0.bw_r_irf_core.register15.reg_th1;
    active_win[62]   = `SPARC_REG0.bw_r_irf_core.register15.reg_th2;
    active_win[63]   = `SPARC_REG0.bw_r_irf_core.register15.reg_th3;
    active_win[64]   = `SPARC_REG0.bw_r_irf_core.register16.reg_th0;
    active_win[65]   = `SPARC_REG0.bw_r_irf_core.register16.reg_th1;
    active_win[66]   = `SPARC_REG0.bw_r_irf_core.register16.reg_th2;
    active_win[67]   = `SPARC_REG0.bw_r_irf_core.register16.reg_th3;
    active_win[68]   = `SPARC_REG0.bw_r_irf_core.register17.reg_th0;
    active_win[69]   = `SPARC_REG0.bw_r_irf_core.register17.reg_th1;
    active_win[70]   = `SPARC_REG0.bw_r_irf_core.register17.reg_th2;
    active_win[71]   = `SPARC_REG0.bw_r_irf_core.register17.reg_th3;
    active_win[72]   = `SPARC_REG0.bw_r_irf_core.register18.reg_th0;
    active_win[73]   = `SPARC_REG0.bw_r_irf_core.register18.reg_th1;
    active_win[74]   = `SPARC_REG0.bw_r_irf_core.register18.reg_th2;
    active_win[75]   = `SPARC_REG0.bw_r_irf_core.register18.reg_th3;
    active_win[76]   = `SPARC_REG0.bw_r_irf_core.register19.reg_th0;
    active_win[77]   = `SPARC_REG0.bw_r_irf_core.register19.reg_th1;
    active_win[78]   = `SPARC_REG0.bw_r_irf_core.register19.reg_th2;
    active_win[79]   = `SPARC_REG0.bw_r_irf_core.register19.reg_th3;
    active_win[80]   = `SPARC_REG0.bw_r_irf_core.register20.reg_th0;
    active_win[81]   = `SPARC_REG0.bw_r_irf_core.register20.reg_th1;
    active_win[82]   = `SPARC_REG0.bw_r_irf_core.register20.reg_th2;
    active_win[83]   = `SPARC_REG0.bw_r_irf_core.register20.reg_th3;
    active_win[84]   = `SPARC_REG0.bw_r_irf_core.register21.reg_th0;
    active_win[85]   = `SPARC_REG0.bw_r_irf_core.register21.reg_th1;
    active_win[86]   = `SPARC_REG0.bw_r_irf_core.register21.reg_th2;
    active_win[87]   = `SPARC_REG0.bw_r_irf_core.register21.reg_th3;
    active_win[88]   = `SPARC_REG0.bw_r_irf_core.register22.reg_th0;
    active_win[89]   = `SPARC_REG0.bw_r_irf_core.register22.reg_th1;
    active_win[90]   = `SPARC_REG0.bw_r_irf_core.register22.reg_th2;
    active_win[91]   = `SPARC_REG0.bw_r_irf_core.register22.reg_th3;
    active_win[92]   = `SPARC_REG0.bw_r_irf_core.register23.reg_th0;
    active_win[93]   = `SPARC_REG0.bw_r_irf_core.register23.reg_th1;
    active_win[94]   = `SPARC_REG0.bw_r_irf_core.register23.reg_th2;
    active_win[95]   = `SPARC_REG0.bw_r_irf_core.register23.reg_th3;
    active_win[96]   = `SPARC_REG0.bw_r_irf_core.register24.reg_th0;
    active_win[97]   = `SPARC_REG0.bw_r_irf_core.register24.reg_th1;
    active_win[98]   = `SPARC_REG0.bw_r_irf_core.register24.reg_th2;
    active_win[99]   = `SPARC_REG0.bw_r_irf_core.register24.reg_th3;
    active_win[100]  = `SPARC_REG0.bw_r_irf_core.register25.reg_th0;
    active_win[101]  = `SPARC_REG0.bw_r_irf_core.register25.reg_th1;
    active_win[102]  = `SPARC_REG0.bw_r_irf_core.register25.reg_th2;
    active_win[103]  = `SPARC_REG0.bw_r_irf_core.register25.reg_th3;
    active_win[104]  = `SPARC_REG0.bw_r_irf_core.register26.reg_th0;
    active_win[105]  = `SPARC_REG0.bw_r_irf_core.register26.reg_th1;
    active_win[106]  = `SPARC_REG0.bw_r_irf_core.register26.reg_th2;
    active_win[107]  = `SPARC_REG0.bw_r_irf_core.register26.reg_th3;
    active_win[108]  = `SPARC_REG0.bw_r_irf_core.register27.reg_th0;
    active_win[109]  = `SPARC_REG0.bw_r_irf_core.register27.reg_th1;
    active_win[110]  = `SPARC_REG0.bw_r_irf_core.register27.reg_th2;
    active_win[111]  = `SPARC_REG0.bw_r_irf_core.register27.reg_th3;
    active_win[112]  = `SPARC_REG0.bw_r_irf_core.register28.reg_th0;
    active_win[113]  = `SPARC_REG0.bw_r_irf_core.register28.reg_th1;
    active_win[114]  = `SPARC_REG0.bw_r_irf_core.register28.reg_th2;
    active_win[115]  = `SPARC_REG0.bw_r_irf_core.register28.reg_th3;
    active_win[116]  = `SPARC_REG0.bw_r_irf_core.register29.reg_th0;
    active_win[117]  = `SPARC_REG0.bw_r_irf_core.register29.reg_th1;
    active_win[118]  = `SPARC_REG0.bw_r_irf_core.register29.reg_th2;
    active_win[119]  = `SPARC_REG0.bw_r_irf_core.register29.reg_th3;
    active_win[120]  = `SPARC_REG0.bw_r_irf_core.register30.reg_th0;
    active_win[121]  = `SPARC_REG0.bw_r_irf_core.register30.reg_th1;
    active_win[122]  = `SPARC_REG0.bw_r_irf_core.register30.reg_th2;
    active_win[123]  = `SPARC_REG0.bw_r_irf_core.register30.reg_th3;
    active_win[124]  = `SPARC_REG0.bw_r_irf_core.register31.reg_th0;
    active_win[125]  = `SPARC_REG0.bw_r_irf_core.register31.reg_th1;
    active_win[126]  = `SPARC_REG0.bw_r_irf_core.register31.reg_th2;
    active_win[127]  = `SPARC_REG0.bw_r_irf_core.register31.reg_th3;
`endif
`endif
	  $pc_trigger_event(1'b1, 
			    `SPCPATH0.ifu.fdp.pc_w,
			    `SPCPATH0.ifu.fcl.sas_thrid_w,
`ifdef FPGA_SYN_IRF
			    active_win,
`else
			    `SPARC_REG0.active_window,
`endif
			    3'b000,
			    start_counter, 
			    active_cpu
			    );
`ifdef FPGA_SYN_IRF
`ifdef FPGA_SYN_1THREAD
    `SPARC_REG0.bw_r_irf_core.register00.onereg = active_win[0];
    `SPARC_REG0.bw_r_irf_core.register01.onereg = active_win[4];
    `SPARC_REG0.bw_r_irf_core.register02.onereg = active_win[8];
    `SPARC_REG0.bw_r_irf_core.register03.onereg = active_win[12];
    `SPARC_REG0.bw_r_irf_core.register04.onereg = active_win[16];
    `SPARC_REG0.bw_r_irf_core.register05.onereg = active_win[20];
    `SPARC_REG0.bw_r_irf_core.register06.onereg = active_win[24];
    `SPARC_REG0.bw_r_irf_core.register07.onereg = active_win[28];
    `SPARC_REG0.bw_r_irf_core.register08.onereg = active_win[32];
    `SPARC_REG0.bw_r_irf_core.register09.onereg = active_win[36];
    `SPARC_REG0.bw_r_irf_core.register10.onereg = active_win[40];
    `SPARC_REG0.bw_r_irf_core.register11.onereg = active_win[44];
    `SPARC_REG0.bw_r_irf_core.register12.onereg = active_win[48];
    `SPARC_REG0.bw_r_irf_core.register13.onereg = active_win[52];
    `SPARC_REG0.bw_r_irf_core.register14.onereg = active_win[56];
    `SPARC_REG0.bw_r_irf_core.register15.onereg = active_win[60];
    `SPARC_REG0.bw_r_irf_core.register16.onereg = active_win[64];
    `SPARC_REG0.bw_r_irf_core.register17.onereg = active_win[68];
    `SPARC_REG0.bw_r_irf_core.register18.onereg = active_win[72];
    `SPARC_REG0.bw_r_irf_core.register19.onereg = active_win[76];
    `SPARC_REG0.bw_r_irf_core.register20.onereg = active_win[80];
    `SPARC_REG0.bw_r_irf_core.register21.onereg = active_win[84];
    `SPARC_REG0.bw_r_irf_core.register22.onereg = active_win[88];
    `SPARC_REG0.bw_r_irf_core.register23.onereg = active_win[92];
    `SPARC_REG0.bw_r_irf_core.register24.onereg = active_win[96];
    `SPARC_REG0.bw_r_irf_core.register25.onereg = active_win[100];
    `SPARC_REG0.bw_r_irf_core.register26.onereg = active_win[104];
    `SPARC_REG0.bw_r_irf_core.register27.onereg = active_win[108];
    `SPARC_REG0.bw_r_irf_core.register28.onereg = active_win[112];
    `SPARC_REG0.bw_r_irf_core.register29.onereg = active_win[116];
    `SPARC_REG0.bw_r_irf_core.register30.onereg = active_win[120];
    `SPARC_REG0.bw_r_irf_core.register31.onereg = active_win[124];
`else
    `SPARC_REG0.bw_r_irf_core.register00.reg_th0 = active_win[0];
    `SPARC_REG0.bw_r_irf_core.register00.reg_th1 = active_win[1];
    `SPARC_REG0.bw_r_irf_core.register00.reg_th2 = active_win[2];
    `SPARC_REG0.bw_r_irf_core.register00.reg_th3 = active_win[3];
    `SPARC_REG0.bw_r_irf_core.register01.reg_th0 = active_win[4];
    `SPARC_REG0.bw_r_irf_core.register01.reg_th1 = active_win[5];
    `SPARC_REG0.bw_r_irf_core.register01.reg_th2 = active_win[6];
    `SPARC_REG0.bw_r_irf_core.register01.reg_th3 = active_win[7];
    `SPARC_REG0.bw_r_irf_core.register02.reg_th0 = active_win[8];
    `SPARC_REG0.bw_r_irf_core.register02.reg_th1 = active_win[9];
    `SPARC_REG0.bw_r_irf_core.register02.reg_th2 = active_win[10];
    `SPARC_REG0.bw_r_irf_core.register02.reg_th3 = active_win[11];
    `SPARC_REG0.bw_r_irf_core.register03.reg_th0 = active_win[12];
    `SPARC_REG0.bw_r_irf_core.register03.reg_th1 = active_win[13];
    `SPARC_REG0.bw_r_irf_core.register03.reg_th2 = active_win[14];
    `SPARC_REG0.bw_r_irf_core.register03.reg_th3 = active_win[15];
    `SPARC_REG0.bw_r_irf_core.register04.reg_th0 = active_win[16];
    `SPARC_REG0.bw_r_irf_core.register04.reg_th1 = active_win[17];
    `SPARC_REG0.bw_r_irf_core.register04.reg_th2 = active_win[18];
    `SPARC_REG0.bw_r_irf_core.register04.reg_th3 = active_win[19];
    `SPARC_REG0.bw_r_irf_core.register05.reg_th0 = active_win[20];
    `SPARC_REG0.bw_r_irf_core.register05.reg_th1 = active_win[21];
    `SPARC_REG0.bw_r_irf_core.register05.reg_th2 = active_win[22];
    `SPARC_REG0.bw_r_irf_core.register05.reg_th3 = active_win[23];
    `SPARC_REG0.bw_r_irf_core.register06.reg_th0 = active_win[24];
    `SPARC_REG0.bw_r_irf_core.register06.reg_th1 = active_win[25];
    `SPARC_REG0.bw_r_irf_core.register06.reg_th2 = active_win[26];
    `SPARC_REG0.bw_r_irf_core.register06.reg_th3 = active_win[27];
    `SPARC_REG0.bw_r_irf_core.register07.reg_th0 = active_win[28];
    `SPARC_REG0.bw_r_irf_core.register07.reg_th1 = active_win[29];
    `SPARC_REG0.bw_r_irf_core.register07.reg_th2 = active_win[30];
    `SPARC_REG0.bw_r_irf_core.register07.reg_th3 = active_win[31];
    `SPARC_REG0.bw_r_irf_core.register08.reg_th0 = active_win[32];
    `SPARC_REG0.bw_r_irf_core.register08.reg_th1 = active_win[33];
    `SPARC_REG0.bw_r_irf_core.register08.reg_th2 = active_win[34];
    `SPARC_REG0.bw_r_irf_core.register08.reg_th3 = active_win[35];
    `SPARC_REG0.bw_r_irf_core.register09.reg_th0 = active_win[36];
    `SPARC_REG0.bw_r_irf_core.register09.reg_th1 = active_win[37];
    `SPARC_REG0.bw_r_irf_core.register09.reg_th2 = active_win[38];
    `SPARC_REG0.bw_r_irf_core.register09.reg_th3 = active_win[39];
    `SPARC_REG0.bw_r_irf_core.register10.reg_th0 = active_win[40];
    `SPARC_REG0.bw_r_irf_core.register10.reg_th1 = active_win[41];
    `SPARC_REG0.bw_r_irf_core.register10.reg_th2 = active_win[42];
    `SPARC_REG0.bw_r_irf_core.register10.reg_th3 = active_win[43];
    `SPARC_REG0.bw_r_irf_core.register11.reg_th0 = active_win[44];
    `SPARC_REG0.bw_r_irf_core.register11.reg_th1 = active_win[45];
    `SPARC_REG0.bw_r_irf_core.register11.reg_th2 = active_win[46];
    `SPARC_REG0.bw_r_irf_core.register11.reg_th3 = active_win[47];
    `SPARC_REG0.bw_r_irf_core.register12.reg_th0 = active_win[48];
    `SPARC_REG0.bw_r_irf_core.register12.reg_th1 = active_win[49];
    `SPARC_REG0.bw_r_irf_core.register12.reg_th2 = active_win[50];
    `SPARC_REG0.bw_r_irf_core.register12.reg_th3 = active_win[51];
    `SPARC_REG0.bw_r_irf_core.register13.reg_th0 = active_win[52];
    `SPARC_REG0.bw_r_irf_core.register13.reg_th1 = active_win[53];
    `SPARC_REG0.bw_r_irf_core.register13.reg_th2 = active_win[54];
    `SPARC_REG0.bw_r_irf_core.register13.reg_th3 = active_win[55];
    `SPARC_REG0.bw_r_irf_core.register14.reg_th0 = active_win[56];
    `SPARC_REG0.bw_r_irf_core.register14.reg_th1 = active_win[57];
    `SPARC_REG0.bw_r_irf_core.register14.reg_th2 = active_win[58];
    `SPARC_REG0.bw_r_irf_core.register14.reg_th3 = active_win[59];
    `SPARC_REG0.bw_r_irf_core.register15.reg_th0 = active_win[60];
    `SPARC_REG0.bw_r_irf_core.register15.reg_th1 = active_win[61];
    `SPARC_REG0.bw_r_irf_core.register15.reg_th2 = active_win[62];
    `SPARC_REG0.bw_r_irf_core.register15.reg_th3 = active_win[63];
    `SPARC_REG0.bw_r_irf_core.register16.reg_th0 = active_win[64];
    `SPARC_REG0.bw_r_irf_core.register16.reg_th1 = active_win[65];
    `SPARC_REG0.bw_r_irf_core.register16.reg_th2 = active_win[66];
    `SPARC_REG0.bw_r_irf_core.register16.reg_th3 = active_win[67];
    `SPARC_REG0.bw_r_irf_core.register17.reg_th0 = active_win[68];
    `SPARC_REG0.bw_r_irf_core.register17.reg_th1 = active_win[69];
    `SPARC_REG0.bw_r_irf_core.register17.reg_th2 = active_win[70];
    `SPARC_REG0.bw_r_irf_core.register17.reg_th3 = active_win[71];
    `SPARC_REG0.bw_r_irf_core.register18.reg_th0 = active_win[72];
    `SPARC_REG0.bw_r_irf_core.register18.reg_th1 = active_win[73];
    `SPARC_REG0.bw_r_irf_core.register18.reg_th2 = active_win[74];
    `SPARC_REG0.bw_r_irf_core.register18.reg_th3 = active_win[75];
    `SPARC_REG0.bw_r_irf_core.register19.reg_th0 = active_win[76];
    `SPARC_REG0.bw_r_irf_core.register19.reg_th1 = active_win[77];
    `SPARC_REG0.bw_r_irf_core.register19.reg_th2 = active_win[78];
    `SPARC_REG0.bw_r_irf_core.register19.reg_th3 = active_win[79];
    `SPARC_REG0.bw_r_irf_core.register20.reg_th0 = active_win[80];
    `SPARC_REG0.bw_r_irf_core.register20.reg_th1 = active_win[81];
    `SPARC_REG0.bw_r_irf_core.register20.reg_th2 = active_win[82];
    `SPARC_REG0.bw_r_irf_core.register20.reg_th3 = active_win[83];
    `SPARC_REG0.bw_r_irf_core.register21.reg_th0 = active_win[84];
    `SPARC_REG0.bw_r_irf_core.register21.reg_th1 = active_win[85];
    `SPARC_REG0.bw_r_irf_core.register21.reg_th2 = active_win[86];
    `SPARC_REG0.bw_r_irf_core.register21.reg_th3 = active_win[87];
    `SPARC_REG0.bw_r_irf_core.register22.reg_th0 = active_win[88];
    `SPARC_REG0.bw_r_irf_core.register22.reg_th1 = active_win[89];
    `SPARC_REG0.bw_r_irf_core.register22.reg_th2 = active_win[90];
    `SPARC_REG0.bw_r_irf_core.register22.reg_th3 = active_win[91];
    `SPARC_REG0.bw_r_irf_core.register23.reg_th0 = active_win[92];
    `SPARC_REG0.bw_r_irf_core.register23.reg_th1 = active_win[93];
    `SPARC_REG0.bw_r_irf_core.register23.reg_th2 = active_win[94];
    `SPARC_REG0.bw_r_irf_core.register23.reg_th3 = active_win[95];
    `SPARC_REG0.bw_r_irf_core.register24.reg_th0 = active_win[96];
    `SPARC_REG0.bw_r_irf_core.register24.reg_th1 = active_win[97];
    `SPARC_REG0.bw_r_irf_core.register24.reg_th2 = active_win[98];
    `SPARC_REG0.bw_r_irf_core.register24.reg_th3 = active_win[99];
    `SPARC_REG0.bw_r_irf_core.register25.reg_th0 = active_win[100];
    `SPARC_REG0.bw_r_irf_core.register25.reg_th1 = active_win[101];
    `SPARC_REG0.bw_r_irf_core.register25.reg_th2 = active_win[102];
    `SPARC_REG0.bw_r_irf_core.register25.reg_th3 = active_win[103];
    `SPARC_REG0.bw_r_irf_core.register26.reg_th0 = active_win[104];
    `SPARC_REG0.bw_r_irf_core.register26.reg_th1 = active_win[105];
    `SPARC_REG0.bw_r_irf_core.register26.reg_th2 = active_win[106];
    `SPARC_REG0.bw_r_irf_core.register26.reg_th3 = active_win[107];
    `SPARC_REG0.bw_r_irf_core.register27.reg_th0 = active_win[108];
    `SPARC_REG0.bw_r_irf_core.register27.reg_th1 = active_win[109];
    `SPARC_REG0.bw_r_irf_core.register27.reg_th2 = active_win[110];
    `SPARC_REG0.bw_r_irf_core.register27.reg_th3 = active_win[111];
    `SPARC_REG0.bw_r_irf_core.register28.reg_th0 = active_win[112];
    `SPARC_REG0.bw_r_irf_core.register28.reg_th1 = active_win[113];
    `SPARC_REG0.bw_r_irf_core.register28.reg_th2 = active_win[114];
    `SPARC_REG0.bw_r_irf_core.register28.reg_th3 = active_win[115];
    `SPARC_REG0.bw_r_irf_core.register29.reg_th0 = active_win[116];
    `SPARC_REG0.bw_r_irf_core.register29.reg_th1 = active_win[117];
    `SPARC_REG0.bw_r_irf_core.register29.reg_th2 = active_win[118];
    `SPARC_REG0.bw_r_irf_core.register29.reg_th3 = active_win[119];
    `SPARC_REG0.bw_r_irf_core.register30.reg_th0 = active_win[120];
    `SPARC_REG0.bw_r_irf_core.register30.reg_th1 = active_win[121];
    `SPARC_REG0.bw_r_irf_core.register30.reg_th2 = active_win[122];
    `SPARC_REG0.bw_r_irf_core.register30.reg_th3 = active_win[123];
    `SPARC_REG0.bw_r_irf_core.register31.reg_th0 = active_win[124];
    `SPARC_REG0.bw_r_irf_core.register31.reg_th1 = active_win[125];
    `SPARC_REG0.bw_r_irf_core.register31.reg_th2 = active_win[126];
    `SPARC_REG0.bw_r_irf_core.register31.reg_th3 = active_win[127];
`endif
`endif

    end
 `endif
 `ifdef RTL_SPARC1
       if(`PC_CMP.spc1_inst_done)begin
`ifdef FPGA_SYN
    for (i = 0; i < 4; i = i+1)
    begin
	active_win[i]    = `SPARC_REG1.active_window_00000[i];
	active_win[4+i]  = `SPARC_REG1.active_window_00001[i];
	active_win[8+i]  = `SPARC_REG1.active_window_00010[i];
	active_win[12+i] = `SPARC_REG1.active_window_00011[i];
	active_win[16+i] = `SPARC_REG1.active_window_00100[i];
	active_win[20+i] = `SPARC_REG1.active_window_00101[i];
	active_win[24+i] = `SPARC_REG1.active_window_00110[i];
	active_win[28+i] = `SPARC_REG1.active_window_00111[i];
	active_win[32+i] = `SPARC_REG1.active_window_01000[i];
	active_win[36+i] = `SPARC_REG1.active_window_01001[i];
	active_win[40+i] = `SPARC_REG1.active_window_01010[i];
	active_win[44+i] = `SPARC_REG1.active_window_01011[i];
	active_win[48+i] = `SPARC_REG1.active_window_01100[i];
	active_win[52+i] = `SPARC_REG1.active_window_01101[i];
	active_win[56+i] = `SPARC_REG1.active_window_01110[i];
	active_win[60+i] = `SPARC_REG1.active_window_01111[i];
	active_win[64+i] = `SPARC_REG1.active_window_10000[i];
	active_win[68+i] = `SPARC_REG1.active_window_10001[i];
	active_win[72+i] = `SPARC_REG1.active_window_10010[i];
	active_win[76+i] = `SPARC_REG1.active_window_10011[i];
	active_win[80+i] = `SPARC_REG1.active_window_10100[i];
	active_win[84+i] = `SPARC_REG1.active_window_10101[i];
	active_win[88+i] = `SPARC_REG1.active_window_10110[i];
	active_win[92+i] = `SPARC_REG1.active_window_10111[i];
	active_win[96+i] = `SPARC_REG1.active_window_11000[i];
	active_win[100+i] = `SPARC_REG1.active_window_11001[i];
	active_win[104+i] = `SPARC_REG1.active_window_11010[i];
	active_win[108+i] = `SPARC_REG1.active_window_11011[i];
	active_win[112+i] = `SPARC_REG1.active_window_11100[i];
	active_win[116+i] = `SPARC_REG1.active_window_11101[i];
	active_win[120+i] = `SPARC_REG1.active_window_11110[i];
	active_win[124+i] = `SPARC_REG1.active_window_11111[i];
    end
`endif
	 $pc_trigger_event(1'b1,
			   `SPCPATH1.ifu.fdp.pc_w,
			   `SPCPATH1.ifu.fcl.sas_thrid_w,
`ifdef FPGA_SYN
			    active_win,
`else
			   `SPARC_REG1.active_window,
`endif
			   3'b001,
			   start_counter, 
			   active_cpu
			    );
`ifdef FPGA_SYN
    for (i = 0; i < 4; i = i+1)
    begin
	`SPARC_REG1.active_window_00000[i] = active_win[i];
	`SPARC_REG1.active_window_00001[i] = active_win[4+i];
	`SPARC_REG1.active_window_00010[i] = active_win[8+i];
	`SPARC_REG1.active_window_00011[i] = active_win[12+i];
	`SPARC_REG1.active_window_00100[i] = active_win[16+i];
	`SPARC_REG1.active_window_00101[i] = active_win[20+i];
	`SPARC_REG1.active_window_00110[i] = active_win[24+i];
	`SPARC_REG1.active_window_00111[i] = active_win[28+i];
	`SPARC_REG1.active_window_01000[i] = active_win[32+i];
	`SPARC_REG1.active_window_01001[i] = active_win[36+i];
	`SPARC_REG1.active_window_01010[i] = active_win[40+i];
	`SPARC_REG1.active_window_01011[i] = active_win[44+i];
	`SPARC_REG1.active_window_01100[i] = active_win[48+i];
	`SPARC_REG1.active_window_01101[i] = active_win[52+i];
	`SPARC_REG1.active_window_01110[i] = active_win[56+i];
	`SPARC_REG1.active_window_01111[i] = active_win[60+i];
	`SPARC_REG1.active_window_10000[i] = active_win[64+i];
	`SPARC_REG1.active_window_10001[i] = active_win[68+i];
	`SPARC_REG1.active_window_10010[i] = active_win[72+i];
	`SPARC_REG1.active_window_10011[i] = active_win[76+i];
	`SPARC_REG1.active_window_10100[i] = active_win[80+i];
	`SPARC_REG1.active_window_10101[i] = active_win[84+i];
	`SPARC_REG1.active_window_10110[i] = active_win[88+i];
	`SPARC_REG1.active_window_10111[i] = active_win[92+i];
	`SPARC_REG1.active_window_11000[i] = active_win[96+i];
	`SPARC_REG1.active_window_11001[i] = active_win[100+i];
	`SPARC_REG1.active_window_11010[i] = active_win[104+i];
	`SPARC_REG1.active_window_11011[i] = active_win[108+i];
	`SPARC_REG1.active_window_11100[i] = active_win[112+i];
	`SPARC_REG1.active_window_11101[i] = active_win[116+i];
	`SPARC_REG1.active_window_11110[i] = active_win[120+i];
	`SPARC_REG1.active_window_11111[i] = active_win[124+i];
    end
`endif
       end
   `endif
   `ifdef RTL_SPARC2
       if(`PC_CMP.spc2_inst_done)begin
`ifdef FPGA_SYN
    for (i = 0; i < 4; i = i+1)
    begin
	active_win[i]    = `SPARC_REG2.active_window_00000[i];
	active_win[4+i]  = `SPARC_REG2.active_window_00001[i];
	active_win[8+i]  = `SPARC_REG2.active_window_00010[i];
	active_win[12+i] = `SPARC_REG2.active_window_00011[i];
	active_win[16+i] = `SPARC_REG2.active_window_00100[i];
	active_win[20+i] = `SPARC_REG2.active_window_00101[i];
	active_win[24+i] = `SPARC_REG2.active_window_00110[i];
	active_win[28+i] = `SPARC_REG2.active_window_00111[i];
	active_win[32+i] = `SPARC_REG2.active_window_01000[i];
	active_win[36+i] = `SPARC_REG2.active_window_01001[i];
	active_win[40+i] = `SPARC_REG2.active_window_01010[i];
	active_win[44+i] = `SPARC_REG2.active_window_01011[i];
	active_win[48+i] = `SPARC_REG2.active_window_01100[i];
	active_win[52+i] = `SPARC_REG2.active_window_01101[i];
	active_win[56+i] = `SPARC_REG2.active_window_01110[i];
	active_win[60+i] = `SPARC_REG2.active_window_01111[i];
	active_win[64+i] = `SPARC_REG2.active_window_10000[i];
	active_win[68+i] = `SPARC_REG2.active_window_10001[i];
	active_win[72+i] = `SPARC_REG2.active_window_10010[i];
	active_win[76+i] = `SPARC_REG2.active_window_10011[i];
	active_win[80+i] = `SPARC_REG2.active_window_10100[i];
	active_win[84+i] = `SPARC_REG2.active_window_10101[i];
	active_win[88+i] = `SPARC_REG2.active_window_10110[i];
	active_win[92+i] = `SPARC_REG2.active_window_10111[i];
	active_win[96+i] = `SPARC_REG2.active_window_11000[i];
	active_win[100+i] = `SPARC_REG2.active_window_11001[i];
	active_win[104+i] = `SPARC_REG2.active_window_11010[i];
	active_win[108+i] = `SPARC_REG2.active_window_11011[i];
	active_win[112+i] = `SPARC_REG2.active_window_11100[i];
	active_win[116+i] = `SPARC_REG2.active_window_11101[i];
	active_win[120+i] = `SPARC_REG2.active_window_11110[i];
	active_win[124+i] = `SPARC_REG2.active_window_11111[i];
    end
`endif
	   $pc_trigger_event(1'b1,
			     `SPCPATH2.ifu.fdp.pc_w,
			     `SPCPATH2.ifu.fcl.sas_thrid_w,
`ifdef FPGA_SYN
			    active_win,
`else
			     `SPARC_REG2.active_window,
`endif
			     3'b010,
			     start_counter
			    );
`ifdef FPGA_SYN
    for (i = 0; i < 4; i = i+1)
    begin
	`SPARC_REG2.active_window_00000[i] = active_win[i];
	`SPARC_REG2.active_window_00001[i] = active_win[4+i];
	`SPARC_REG2.active_window_00010[i] = active_win[8+i];
	`SPARC_REG2.active_window_00011[i] = active_win[12+i];
	`SPARC_REG2.active_window_00100[i] = active_win[16+i];
	`SPARC_REG2.active_window_00101[i] = active_win[20+i];
	`SPARC_REG2.active_window_00110[i] = active_win[24+i];
	`SPARC_REG2.active_window_00111[i] = active_win[28+i];
	`SPARC_REG2.active_window_01000[i] = active_win[32+i];
	`SPARC_REG2.active_window_01001[i] = active_win[36+i];
	`SPARC_REG2.active_window_01010[i] = active_win[40+i];
	`SPARC_REG2.active_window_01011[i] = active_win[44+i];
	`SPARC_REG2.active_window_01100[i] = active_win[48+i];
	`SPARC_REG2.active_window_01101[i] = active_win[52+i];
	`SPARC_REG2.active_window_01110[i] = active_win[56+i];
	`SPARC_REG2.active_window_01111[i] = active_win[60+i];
	`SPARC_REG2.active_window_10000[i] = active_win[64+i];
	`SPARC_REG2.active_window_10001[i] = active_win[68+i];
	`SPARC_REG2.active_window_10010[i] = active_win[72+i];
	`SPARC_REG2.active_window_10011[i] = active_win[76+i];
	`SPARC_REG2.active_window_10100[i] = active_win[80+i];
	`SPARC_REG2.active_window_10101[i] = active_win[84+i];
	`SPARC_REG2.active_window_10110[i] = active_win[88+i];
	`SPARC_REG2.active_window_10111[i] = active_win[92+i];
	`SPARC_REG2.active_window_11000[i] = active_win[96+i];
	`SPARC_REG2.active_window_11001[i] = active_win[100+i];
	`SPARC_REG2.active_window_11010[i] = active_win[104+i];
	`SPARC_REG2.active_window_11011[i] = active_win[108+i];
	`SPARC_REG2.active_window_11100[i] = active_win[112+i];
	`SPARC_REG2.active_window_11101[i] = active_win[116+i];
	`SPARC_REG2.active_window_11110[i] = active_win[120+i];
	`SPARC_REG2.active_window_11111[i] = active_win[124+i];
    end
`endif
       end
   `endif
   `ifdef RTL_SPARC3
       if(`PC_CMP.spc3_inst_done)begin
`ifdef FPGA_SYN
    for (i = 0; i < 4; i = i+1)
    begin
	active_win[i]    = `SPARC_REG3.active_window_00000[i];
	active_win[4+i]  = `SPARC_REG3.active_window_00001[i];
	active_win[8+i]  = `SPARC_REG3.active_window_00010[i];
	active_win[12+i] = `SPARC_REG3.active_window_00011[i];
	active_win[16+i] = `SPARC_REG3.active_window_00100[i];
	active_win[20+i] = `SPARC_REG3.active_window_00101[i];
	active_win[24+i] = `SPARC_REG3.active_window_00110[i];
	active_win[28+i] = `SPARC_REG3.active_window_00111[i];
	active_win[32+i] = `SPARC_REG3.active_window_01000[i];
	active_win[36+i] = `SPARC_REG3.active_window_01001[i];
	active_win[40+i] = `SPARC_REG3.active_window_01010[i];
	active_win[44+i] = `SPARC_REG3.active_window_01011[i];
	active_win[48+i] = `SPARC_REG3.active_window_01100[i];
	active_win[52+i] = `SPARC_REG3.active_window_01101[i];
	active_win[56+i] = `SPARC_REG3.active_window_01110[i];
	active_win[60+i] = `SPARC_REG3.active_window_01111[i];
	active_win[64+i] = `SPARC_REG3.active_window_10000[i];
	active_win[68+i] = `SPARC_REG3.active_window_10001[i];
	active_win[72+i] = `SPARC_REG3.active_window_10010[i];
	active_win[76+i] = `SPARC_REG3.active_window_10011[i];
	active_win[80+i] = `SPARC_REG3.active_window_10100[i];
	active_win[84+i] = `SPARC_REG3.active_window_10101[i];
	active_win[88+i] = `SPARC_REG3.active_window_10110[i];
	active_win[92+i] = `SPARC_REG3.active_window_10111[i];
	active_win[96+i] = `SPARC_REG3.active_window_11000[i];
	active_win[100+i] = `SPARC_REG3.active_window_11001[i];
	active_win[104+i] = `SPARC_REG3.active_window_11010[i];
	active_win[108+i] = `SPARC_REG3.active_window_11011[i];
	active_win[112+i] = `SPARC_REG3.active_window_11100[i];
	active_win[116+i] = `SPARC_REG3.active_window_11101[i];
	active_win[120+i] = `SPARC_REG3.active_window_11110[i];
	active_win[124+i] = `SPARC_REG3.active_window_11111[i];
    end
`endif
	  $pc_trigger_event(1'b1,
			    `SPCPATH3.ifu.fdp.pc_w,
			    `SPCPATH3.ifu.fcl.sas_thrid_w,
`ifdef FPGA_SYN
			    active_win,
`else
			    `SPARC_REG3.active_window,
`endif
			    3'b011,
			    start_counter,
			    active_cpu
			    );
`ifdef FPGA_SYN
    for (i = 0; i < 4; i = i+1)
    begin
	`SPARC_REG3.active_window_00000[i] = active_win[i];
	`SPARC_REG3.active_window_00001[i] = active_win[4+i];
	`SPARC_REG3.active_window_00010[i] = active_win[8+i];
	`SPARC_REG3.active_window_00011[i] = active_win[12+i];
	`SPARC_REG3.active_window_00100[i] = active_win[16+i];
	`SPARC_REG3.active_window_00101[i] = active_win[20+i];
	`SPARC_REG3.active_window_00110[i] = active_win[24+i];
	`SPARC_REG3.active_window_00111[i] = active_win[28+i];
	`SPARC_REG3.active_window_01000[i] = active_win[32+i];
	`SPARC_REG3.active_window_01001[i] = active_win[36+i];
	`SPARC_REG3.active_window_01010[i] = active_win[40+i];
	`SPARC_REG3.active_window_01011[i] = active_win[44+i];
	`SPARC_REG3.active_window_01100[i] = active_win[48+i];
	`SPARC_REG3.active_window_01101[i] = active_win[52+i];
	`SPARC_REG3.active_window_01110[i] = active_win[56+i];
	`SPARC_REG3.active_window_01111[i] = active_win[60+i];
	`SPARC_REG3.active_window_10000[i] = active_win[64+i];
	`SPARC_REG3.active_window_10001[i] = active_win[68+i];
	`SPARC_REG3.active_window_10010[i] = active_win[72+i];
	`SPARC_REG3.active_window_10011[i] = active_win[76+i];
	`SPARC_REG3.active_window_10100[i] = active_win[80+i];
	`SPARC_REG3.active_window_10101[i] = active_win[84+i];
	`SPARC_REG3.active_window_10110[i] = active_win[88+i];
	`SPARC_REG3.active_window_10111[i] = active_win[92+i];
	`SPARC_REG3.active_window_11000[i] = active_win[96+i];
	`SPARC_REG3.active_window_11001[i] = active_win[100+i];
	`SPARC_REG3.active_window_11010[i] = active_win[104+i];
	`SPARC_REG3.active_window_11011[i] = active_win[108+i];
	`SPARC_REG3.active_window_11100[i] = active_win[112+i];
	`SPARC_REG3.active_window_11101[i] = active_win[116+i];
	`SPARC_REG3.active_window_11110[i] = active_win[120+i];
	`SPARC_REG3.active_window_11111[i] = active_win[124+i];
    end
`endif
	  end
   `endif
   `ifdef RTL_SPARC4
       if(`PC_CMP.spc4_inst_done)begin
`ifdef FPGA_SYN
    for (i = 0; i < 4; i = i+1)
    begin
	active_win[i]    = `SPARC_REG4.active_window_00000[i];
	active_win[4+i]  = `SPARC_REG4.active_window_00001[i];
	active_win[8+i]  = `SPARC_REG4.active_window_00010[i];
	active_win[12+i] = `SPARC_REG4.active_window_00011[i];
	active_win[16+i] = `SPARC_REG4.active_window_00100[i];
	active_win[20+i] = `SPARC_REG4.active_window_00101[i];
	active_win[24+i] = `SPARC_REG4.active_window_00110[i];
	active_win[28+i] = `SPARC_REG4.active_window_00111[i];
	active_win[32+i] = `SPARC_REG4.active_window_01000[i];
	active_win[36+i] = `SPARC_REG4.active_window_01001[i];
	active_win[40+i] = `SPARC_REG4.active_window_01010[i];
	active_win[44+i] = `SPARC_REG4.active_window_01011[i];
	active_win[48+i] = `SPARC_REG4.active_window_01100[i];
	active_win[52+i] = `SPARC_REG4.active_window_01101[i];
	active_win[56+i] = `SPARC_REG4.active_window_01110[i];
	active_win[60+i] = `SPARC_REG4.active_window_01111[i];
	active_win[64+i] = `SPARC_REG4.active_window_10000[i];
	active_win[68+i] = `SPARC_REG4.active_window_10001[i];
	active_win[72+i] = `SPARC_REG4.active_window_10010[i];
	active_win[76+i] = `SPARC_REG4.active_window_10011[i];
	active_win[80+i] = `SPARC_REG4.active_window_10100[i];
	active_win[84+i] = `SPARC_REG4.active_window_10101[i];
	active_win[88+i] = `SPARC_REG4.active_window_10110[i];
	active_win[92+i] = `SPARC_REG4.active_window_10111[i];
	active_win[96+i] = `SPARC_REG4.active_window_11000[i];
	active_win[100+i] = `SPARC_REG4.active_window_11001[i];
	active_win[104+i] = `SPARC_REG4.active_window_11010[i];
	active_win[108+i] = `SPARC_REG4.active_window_11011[i];
	active_win[112+i] = `SPARC_REG4.active_window_11100[i];
	active_win[116+i] = `SPARC_REG4.active_window_11101[i];
	active_win[120+i] = `SPARC_REG4.active_window_11110[i];
	active_win[124+i] = `SPARC_REG4.active_window_11111[i];
    end
`endif
	 $pc_trigger_event(1'b1,
			   `SPCPATH4.ifu.fdp.pc_w,
			   `SPCPATH4.ifu.fcl.sas_thrid_w,
`ifdef FPGA_SYN
			    active_win,
`else
			   `SPARC_REG4.active_window,
`endif
			   3'b100,
			   start_counter,
			   active_cpu
			    );
`ifdef FPGA_SYN
    for (i = 0; i < 4; i = i+1)
    begin
	`SPARC_REG4.active_window_00000[i] = active_win[i];
	`SPARC_REG4.active_window_00001[i] = active_win[4+i];
	`SPARC_REG4.active_window_00010[i] = active_win[8+i];
	`SPARC_REG4.active_window_00011[i] = active_win[12+i];
	`SPARC_REG4.active_window_00100[i] = active_win[16+i];
	`SPARC_REG4.active_window_00101[i] = active_win[20+i];
	`SPARC_REG4.active_window_00110[i] = active_win[24+i];
	`SPARC_REG4.active_window_00111[i] = active_win[28+i];
	`SPARC_REG4.active_window_01000[i] = active_win[32+i];
	`SPARC_REG4.active_window_01001[i] = active_win[36+i];
	`SPARC_REG4.active_window_01010[i] = active_win[40+i];
	`SPARC_REG4.active_window_01011[i] = active_win[44+i];
	`SPARC_REG4.active_window_01100[i] = active_win[48+i];
	`SPARC_REG4.active_window_01101[i] = active_win[52+i];
	`SPARC_REG4.active_window_01110[i] = active_win[56+i];
	`SPARC_REG4.active_window_01111[i] = active_win[60+i];
	`SPARC_REG4.active_window_10000[i] = active_win[64+i];
	`SPARC_REG4.active_window_10001[i] = active_win[68+i];
	`SPARC_REG4.active_window_10010[i] = active_win[72+i];
	`SPARC_REG4.active_window_10011[i] = active_win[76+i];
	`SPARC_REG4.active_window_10100[i] = active_win[80+i];
	`SPARC_REG4.active_window_10101[i] = active_win[84+i];
	`SPARC_REG4.active_window_10110[i] = active_win[88+i];
	`SPARC_REG4.active_window_10111[i] = active_win[92+i];
	`SPARC_REG4.active_window_11000[i] = active_win[96+i];
	`SPARC_REG4.active_window_11001[i] = active_win[100+i];
	`SPARC_REG4.active_window_11010[i] = active_win[104+i];
	`SPARC_REG4.active_window_11011[i] = active_win[108+i];
	`SPARC_REG4.active_window_11100[i] = active_win[112+i];
	`SPARC_REG4.active_window_11101[i] = active_win[116+i];
	`SPARC_REG4.active_window_11110[i] = active_win[120+i];
	`SPARC_REG4.active_window_11111[i] = active_win[124+i];
    end
`endif
       end
   `endif
       
 `ifdef RTL_SPARC5
       if(`PC_CMP.spc5_inst_done)begin
`ifdef FPGA_SYN
    for (i = 0; i < 4; i = i+1)
    begin
	active_win[i]    = `SPARC_REG5.active_window_00000[i];
	active_win[4+i]  = `SPARC_REG5.active_window_00001[i];
	active_win[8+i]  = `SPARC_REG5.active_window_00010[i];
	active_win[12+i] = `SPARC_REG5.active_window_00011[i];
	active_win[16+i] = `SPARC_REG5.active_window_00100[i];
	active_win[20+i] = `SPARC_REG5.active_window_00101[i];
	active_win[24+i] = `SPARC_REG5.active_window_00110[i];
	active_win[28+i] = `SPARC_REG5.active_window_00111[i];
	active_win[32+i] = `SPARC_REG5.active_window_01000[i];
	active_win[36+i] = `SPARC_REG5.active_window_01001[i];
	active_win[40+i] = `SPARC_REG5.active_window_01010[i];
	active_win[44+i] = `SPARC_REG5.active_window_01011[i];
	active_win[48+i] = `SPARC_REG5.active_window_01100[i];
	active_win[52+i] = `SPARC_REG5.active_window_01101[i];
	active_win[56+i] = `SPARC_REG5.active_window_01110[i];
	active_win[60+i] = `SPARC_REG5.active_window_01111[i];
	active_win[64+i] = `SPARC_REG5.active_window_10000[i];
	active_win[68+i] = `SPARC_REG5.active_window_10001[i];
	active_win[72+i] = `SPARC_REG5.active_window_10010[i];
	active_win[76+i] = `SPARC_REG5.active_window_10011[i];
	active_win[80+i] = `SPARC_REG5.active_window_10100[i];
	active_win[84+i] = `SPARC_REG5.active_window_10101[i];
	active_win[88+i] = `SPARC_REG5.active_window_10110[i];
	active_win[92+i] = `SPARC_REG5.active_window_10111[i];
	active_win[96+i] = `SPARC_REG5.active_window_11000[i];
	active_win[100+i] = `SPARC_REG5.active_window_11001[i];
	active_win[104+i] = `SPARC_REG5.active_window_11010[i];
	active_win[108+i] = `SPARC_REG5.active_window_11011[i];
	active_win[112+i] = `SPARC_REG5.active_window_11100[i];
	active_win[116+i] = `SPARC_REG5.active_window_11101[i];
	active_win[120+i] = `SPARC_REG5.active_window_11110[i];
	active_win[124+i] = `SPARC_REG5.active_window_11111[i];
    end
`endif
	  $pc_trigger_event(1'b1,
			    `SPCPATH5.ifu.fdp.pc_w,
			    `SPCPATH5.ifu.fcl.sas_thrid_w,
`ifdef FPGA_SYN
			    active_win,
`else
			    `SPARC_REG5.active_window,
`endif
			    3'b101,
			    start_counter,
			    active_cpu
			    );
`ifdef FPGA_SYN
    for (i = 0; i < 4; i = i+1)
    begin
	`SPARC_REG5.active_window_00000[i] = active_win[i];
	`SPARC_REG5.active_window_00001[i] = active_win[4+i];
	`SPARC_REG5.active_window_00010[i] = active_win[8+i];
	`SPARC_REG5.active_window_00011[i] = active_win[12+i];
	`SPARC_REG5.active_window_00100[i] = active_win[16+i];
	`SPARC_REG5.active_window_00101[i] = active_win[20+i];
	`SPARC_REG5.active_window_00110[i] = active_win[24+i];
	`SPARC_REG5.active_window_00111[i] = active_win[28+i];
	`SPARC_REG5.active_window_01000[i] = active_win[32+i];
	`SPARC_REG5.active_window_01001[i] = active_win[36+i];
	`SPARC_REG5.active_window_01010[i] = active_win[40+i];
	`SPARC_REG5.active_window_01011[i] = active_win[44+i];
	`SPARC_REG5.active_window_01100[i] = active_win[48+i];
	`SPARC_REG5.active_window_01101[i] = active_win[52+i];
	`SPARC_REG5.active_window_01110[i] = active_win[56+i];
	`SPARC_REG5.active_window_01111[i] = active_win[60+i];
	`SPARC_REG5.active_window_10000[i] = active_win[64+i];
	`SPARC_REG5.active_window_10001[i] = active_win[68+i];
	`SPARC_REG5.active_window_10010[i] = active_win[72+i];
	`SPARC_REG5.active_window_10011[i] = active_win[76+i];
	`SPARC_REG5.active_window_10100[i] = active_win[80+i];
	`SPARC_REG5.active_window_10101[i] = active_win[84+i];
	`SPARC_REG5.active_window_10110[i] = active_win[88+i];
	`SPARC_REG5.active_window_10111[i] = active_win[92+i];
	`SPARC_REG5.active_window_11000[i] = active_win[96+i];
	`SPARC_REG5.active_window_11001[i] = active_win[100+i];
	`SPARC_REG5.active_window_11010[i] = active_win[104+i];
	`SPARC_REG5.active_window_11011[i] = active_win[108+i];
	`SPARC_REG5.active_window_11100[i] = active_win[112+i];
	`SPARC_REG5.active_window_11101[i] = active_win[116+i];
	`SPARC_REG5.active_window_11110[i] = active_win[120+i];
	`SPARC_REG5.active_window_11111[i] = active_win[124+i];
    end
`endif
       end
 `endif
 `ifdef RTL_SPARC6
       if(`PC_CMP.spc6_inst_done)begin
`ifdef FPGA_SYN
    for (i = 0; i < 4; i = i+1)
    begin
	active_win[i]    = `SPARC_REG6.active_window_00000[i];
	active_win[4+i]  = `SPARC_REG6.active_window_00001[i];
	active_win[8+i]  = `SPARC_REG6.active_window_00010[i];
	active_win[12+i] = `SPARC_REG6.active_window_00011[i];
	active_win[16+i] = `SPARC_REG6.active_window_00100[i];
	active_win[20+i] = `SPARC_REG6.active_window_00101[i];
	active_win[24+i] = `SPARC_REG6.active_window_00110[i];
	active_win[28+i] = `SPARC_REG6.active_window_00111[i];
	active_win[32+i] = `SPARC_REG6.active_window_01000[i];
	active_win[36+i] = `SPARC_REG6.active_window_01001[i];
	active_win[40+i] = `SPARC_REG6.active_window_01010[i];
	active_win[44+i] = `SPARC_REG6.active_window_01011[i];
	active_win[48+i] = `SPARC_REG6.active_window_01100[i];
	active_win[52+i] = `SPARC_REG6.active_window_01101[i];
	active_win[56+i] = `SPARC_REG6.active_window_01110[i];
	active_win[60+i] = `SPARC_REG6.active_window_01111[i];
	active_win[64+i] = `SPARC_REG6.active_window_10000[i];
	active_win[68+i] = `SPARC_REG6.active_window_10001[i];
	active_win[72+i] = `SPARC_REG6.active_window_10010[i];
	active_win[76+i] = `SPARC_REG6.active_window_10011[i];
	active_win[80+i] = `SPARC_REG6.active_window_10100[i];
	active_win[84+i] = `SPARC_REG6.active_window_10101[i];
	active_win[88+i] = `SPARC_REG6.active_window_10110[i];
	active_win[92+i] = `SPARC_REG6.active_window_10111[i];
	active_win[96+i] = `SPARC_REG6.active_window_11000[i];
	active_win[100+i] = `SPARC_REG6.active_window_11001[i];
	active_win[104+i] = `SPARC_REG6.active_window_11010[i];
	active_win[108+i] = `SPARC_REG6.active_window_11011[i];
	active_win[112+i] = `SPARC_REG6.active_window_11100[i];
	active_win[116+i] = `SPARC_REG6.active_window_11101[i];
	active_win[120+i] = `SPARC_REG6.active_window_11110[i];
	active_win[124+i] = `SPARC_REG6.active_window_11111[i];
    end
`endif
	   $pc_trigger_event(1'b1,
			     `SPCPATH6.ifu.fdp.pc_w,
			     `SPCPATH6.ifu.fcl.sas_thrid_w,
`ifdef FPGA_SYN
			    active_win,
`else
			     `SPARC_REG6.active_window,
`endif
			     3'b110,
			     start_counter,
			     active_cpu 
			    );
`ifdef FPGA_SYN
    for (i = 0; i < 4; i = i+1)
    begin
	`SPARC_REG6.active_window_00000[i] = active_win[i];
	`SPARC_REG6.active_window_00001[i] = active_win[4+i];
	`SPARC_REG6.active_window_00010[i] = active_win[8+i];
	`SPARC_REG6.active_window_00011[i] = active_win[12+i];
	`SPARC_REG6.active_window_00100[i] = active_win[16+i];
	`SPARC_REG6.active_window_00101[i] = active_win[20+i];
	`SPARC_REG6.active_window_00110[i] = active_win[24+i];
	`SPARC_REG6.active_window_00111[i] = active_win[28+i];
	`SPARC_REG6.active_window_01000[i] = active_win[32+i];
	`SPARC_REG6.active_window_01001[i] = active_win[36+i];
	`SPARC_REG6.active_window_01010[i] = active_win[40+i];
	`SPARC_REG6.active_window_01011[i] = active_win[44+i];
	`SPARC_REG6.active_window_01100[i] = active_win[48+i];
	`SPARC_REG6.active_window_01101[i] = active_win[52+i];
	`SPARC_REG6.active_window_01110[i] = active_win[56+i];
	`SPARC_REG6.active_window_01111[i] = active_win[60+i];
	`SPARC_REG6.active_window_10000[i] = active_win[64+i];
	`SPARC_REG6.active_window_10001[i] = active_win[68+i];
	`SPARC_REG6.active_window_10010[i] = active_win[72+i];
	`SPARC_REG6.active_window_10011[i] = active_win[76+i];
	`SPARC_REG6.active_window_10100[i] = active_win[80+i];
	`SPARC_REG6.active_window_10101[i] = active_win[84+i];
	`SPARC_REG6.active_window_10110[i] = active_win[88+i];
	`SPARC_REG6.active_window_10111[i] = active_win[92+i];
	`SPARC_REG6.active_window_11000[i] = active_win[96+i];
	`SPARC_REG6.active_window_11001[i] = active_win[100+i];
	`SPARC_REG6.active_window_11010[i] = active_win[104+i];
	`SPARC_REG6.active_window_11011[i] = active_win[108+i];
	`SPARC_REG6.active_window_11100[i] = active_win[112+i];
	`SPARC_REG6.active_window_11101[i] = active_win[116+i];
	`SPARC_REG6.active_window_11110[i] = active_win[120+i];
	`SPARC_REG6.active_window_11111[i] = active_win[124+i];
    end
`endif
       end
 `endif
 `ifdef RTL_SPARC7
       if(`PC_CMP.spc7_inst_done)begin
`ifdef FPGA_SYN
    for (i = 0; i < 4; i = i+1)
    begin
	active_win[i]    = `SPARC_REG7.active_window_00000[i];
	active_win[4+i]  = `SPARC_REG7.active_window_00001[i];
	active_win[8+i]  = `SPARC_REG7.active_window_00010[i];
	active_win[12+i] = `SPARC_REG7.active_window_00011[i];
	active_win[16+i] = `SPARC_REG7.active_window_00100[i];
	active_win[20+i] = `SPARC_REG7.active_window_00101[i];
	active_win[24+i] = `SPARC_REG7.active_window_00110[i];
	active_win[28+i] = `SPARC_REG7.active_window_00111[i];
	active_win[32+i] = `SPARC_REG7.active_window_01000[i];
	active_win[36+i] = `SPARC_REG7.active_window_01001[i];
	active_win[40+i] = `SPARC_REG7.active_window_01010[i];
	active_win[44+i] = `SPARC_REG7.active_window_01011[i];
	active_win[48+i] = `SPARC_REG7.active_window_01100[i];
	active_win[52+i] = `SPARC_REG7.active_window_01101[i];
	active_win[56+i] = `SPARC_REG7.active_window_01110[i];
	active_win[60+i] = `SPARC_REG7.active_window_01111[i];
	active_win[64+i] = `SPARC_REG7.active_window_10000[i];
	active_win[68+i] = `SPARC_REG7.active_window_10001[i];
	active_win[72+i] = `SPARC_REG7.active_window_10010[i];
	active_win[76+i] = `SPARC_REG7.active_window_10011[i];
	active_win[80+i] = `SPARC_REG7.active_window_10100[i];
	active_win[84+i] = `SPARC_REG7.active_window_10101[i];
	active_win[88+i] = `SPARC_REG7.active_window_10110[i];
	active_win[92+i] = `SPARC_REG7.active_window_10111[i];
	active_win[96+i] = `SPARC_REG7.active_window_11000[i];
	active_win[100+i] = `SPARC_REG7.active_window_11001[i];
	active_win[104+i] = `SPARC_REG7.active_window_11010[i];
	active_win[108+i] = `SPARC_REG7.active_window_11011[i];
	active_win[112+i] = `SPARC_REG7.active_window_11100[i];
	active_win[116+i] = `SPARC_REG7.active_window_11101[i];
	active_win[120+i] = `SPARC_REG7.active_window_11110[i];
	active_win[124+i] = `SPARC_REG7.active_window_11111[i];
    end
`endif
	  $pc_trigger_event(1'b1,
			    `SPCPATH7.ifu.fdp.pc_w,
			    `SPCPATH7.ifu.fcl.sas_thrid_w,
`ifdef FPGA_SYN
			    active_win,
`else
			    `SPARC_REG7.active_window,
`endif
			    3'b111,
			    start_counter,
			    active_cpu
			    );
`ifdef FPGA_SYN
    for (i = 0; i < 4; i = i+1)
    begin
	`SPARC_REG7.active_window_00000[i] = active_win[i];
	`SPARC_REG7.active_window_00001[i] = active_win[4+i];
	`SPARC_REG7.active_window_00010[i] = active_win[8+i];
	`SPARC_REG7.active_window_00011[i] = active_win[12+i];
	`SPARC_REG7.active_window_00100[i] = active_win[16+i];
	`SPARC_REG7.active_window_00101[i] = active_win[20+i];
	`SPARC_REG7.active_window_00110[i] = active_win[24+i];
	`SPARC_REG7.active_window_00111[i] = active_win[28+i];
	`SPARC_REG7.active_window_01000[i] = active_win[32+i];
	`SPARC_REG7.active_window_01001[i] = active_win[36+i];
	`SPARC_REG7.active_window_01010[i] = active_win[40+i];
	`SPARC_REG7.active_window_01011[i] = active_win[44+i];
	`SPARC_REG7.active_window_01100[i] = active_win[48+i];
	`SPARC_REG7.active_window_01101[i] = active_win[52+i];
	`SPARC_REG7.active_window_01110[i] = active_win[56+i];
	`SPARC_REG7.active_window_01111[i] = active_win[60+i];
	`SPARC_REG7.active_window_10000[i] = active_win[64+i];
	`SPARC_REG7.active_window_10001[i] = active_win[68+i];
	`SPARC_REG7.active_window_10010[i] = active_win[72+i];
	`SPARC_REG7.active_window_10011[i] = active_win[76+i];
	`SPARC_REG7.active_window_10100[i] = active_win[80+i];
	`SPARC_REG7.active_window_10101[i] = active_win[84+i];
	`SPARC_REG7.active_window_10110[i] = active_win[88+i];
	`SPARC_REG7.active_window_10111[i] = active_win[92+i];
	`SPARC_REG7.active_window_11000[i] = active_win[96+i];
	`SPARC_REG7.active_window_11001[i] = active_win[100+i];
	`SPARC_REG7.active_window_11010[i] = active_win[104+i];
	`SPARC_REG7.active_window_11011[i] = active_win[108+i];
	`SPARC_REG7.active_window_11100[i] = active_win[112+i];
	`SPARC_REG7.active_window_11101[i] = active_win[116+i];
	`SPARC_REG7.active_window_11110[i] = active_win[120+i];
	`SPARC_REG7.active_window_11111[i] = active_win[124+i];
    end
`endif
       end
       
 `endif //  `ifdef RTL_SPARC7
    end // always @ (posedge clk)
 `endif // DRAM_SAT
`endif // ifdef GATE_SIM

`ifdef GATE_SIM_SPARC
   wire sas_m0, sas_m1, sas_m2, sas_m3, sas_m4, sas_m5, sas_m6, sas_m7;
   reg 	spc0_inst_done, spc1_inst_done, spc2_inst_done, spc3_inst_done,
	spc4_inst_done, spc5_inst_done, spc6_inst_done, spc7_inst_done;
   
 `ifdef RTL_SPARC0
   assign sas_m0    = `INSTPATH0.runw_ff_u_dff_0_.d &
                      (~`INSTPATH0.exu_ifu_ecc_ce_m | `INSTPATH0.trapm_ff_u_dff_0_.q);
 `else
   assign sas_m0 = 0;
 `endif
   
 `ifdef RTL_SPARC1
   assign sas_m1    = `INSTPATH1.runw_ff_u_dff_0_.d &
                      (~`INSTPATH1.exu_ifu_ecc_ce_m | `INSTPATH1.trapm_ff_u_dff_0_.q);
 `else
   assign sas_m1 = 0;
 `endif
 `ifdef RTL_SPARC2
   assign sas_m2    = `INSTPATH2.runw_ff_u_dff_0_.d &
                      (~`INSTPATH2.exu_ifu_ecc_ce_m | `INSTPATH2.trapm_ff_u_dff_0_.q);
 `else
   assign sas_m2 = 0;
 `endif
   
 `ifdef RTL_SPARC3
   assign sas_m3    = `INSTPATH3.runw_ff_u_dff_0_.d &
                      (~`INSTPATH3.exu_ifu_ecc_ce_m | `INSTPATH3.trapm_ff_u_dff_0_.q);
 `else
   assign sas_m3 = 0;
 `endif
   `ifdef RTL_SPARC4
   assign sas_m4    = `INSTPATH4.runw_ff_u_dff_0_.d &
                      (~`INSTPATH4.exu_ifu_ecc_ce_m | `INSTPATH4.trapm_ff_u_dff_0_.q);
 `else
   assign sas_m4 = 0;
 `endif
   
 `ifdef RTL_SPARC5
   assign sas_m5    = `INSTPATH5.runw_ff_u_dff_0_.d &
                      (~`INSTPATH5.exu_ifu_ecc_ce_m | `INSTPATH5.trapm_ff_u_dff_0_.q);
 `else
   assign sas_m5 = 0;
 `endif
 `ifdef RTL_SPARC6
   assign sas_m6    = `INSTPATH6.runw_ff_u_dff_0_.d &
                      (~`INSTPATH6.exu_ifu_ecc_ce_m | `INSTPATH6.trapm_ff_u_dff_0_.q);
 `else
   assign sas_m6 = 0;
 `endif
   
 `ifdef RTL_SPARC7
   assign sas_m7    = `INSTPATH7.runw_ff_u_dff_0_.d &
                      (~`INSTPATH7.exu_ifu_ecc_ce_m | `INSTPATH7.trapm_ff_u_dff_0_.q);
 `else
   assign sas_m7 = 0;
 `endif
   
  always @(posedge clk) begin
     spc0_inst_done <= sas_m0;
     spc1_inst_done <= sas_m1;
     spc2_inst_done <= sas_m2;
     spc3_inst_done <= sas_m3;
     spc4_inst_done <= sas_m4;
     spc5_inst_done <= sas_m5;
     spc6_inst_done <= sas_m6;
     spc7_inst_done <= sas_m7;
  end
   
    always @(posedge clk) begin
 `ifdef RTL_SPARC0
       if(spc0_inst_done)begin
	  $pc_trigger_event(1'b1, 
			    `SPCPATH0.ifu_fdp.pc_w
			    );
       end
 `endif
 `ifdef RTL_SPARC1
       if(spc1_inst_done)begin
	  $pc_trigger_event(1'b1, 
			    `SPCPATH1.ifu_fdp.pc_w
			    );
       end
 `endif  
 `ifdef RTL_SPARC2
       if(spc2_inst_done)begin
	  $pc_trigger_event(1'b1, 
			    `SPCPATH2.ifu_fdp.pc_w
			    );
       end
 `endif
 `ifdef RTL_SPARC3
       if(spc3_inst_done)begin
	  $pc_trigger_event(1'b1, 
			    `SPCPATH3.ifu_fdp.pc_w
			    );
       end
 `endif  
  `ifdef RTL_SPARC4
       if(spc4_inst_done)begin
	  $pc_trigger_event(1'b1, 
			    `SPCPATH4.ifu_fdp.pc_w
			    );
       end
 `endif
 `ifdef RTL_SPARC5
       if(spc5_inst_done)begin
	  $pc_trigger_event(1'b1, 
			    `SPCPATH5.ifu_fdp.pc_w
			    );
       end
 `endif  
 `ifdef RTL_SPARC6
       if(spc6_inst_done)begin
	  $pc_trigger_event(1'b1, 
			    `SPCPATH6.ifu_fdp.pc_w
			    );
       end
 `endif
 `ifdef RTL_SPARC7
       if(spc7_inst_done)begin
	  $pc_trigger_event(1'b1, 
			    `SPCPATH7.ifu_fdp.pc_w
			    );
       end
 `endif  
    end // always @ (posedge clk)
`endif // ifdef GATE_SIM_SPARC

   //force signal
   task action;
      input [1023:0]  string;
      input [255:0]   val;
      input [7:0]     msb;
      input [7:0]     lsb;
      input [7:0]     type;
      begin
	 @(posedge clk)
	begin
	   case(type)
	     0 : $v_force(string, val);
	     1 : $v_dump(string);
	     2 : $v_delay(string);
	  endcase // case(msb)
	end
      end 
      
   endtask // force_sign

   //read data from sparce memory
   task read;
      input [63:0]  addr;
      output [127:0] data;
      begin
	 $read_mem(handle, data, addr);
      end
   endtask // read

   //write data into sparce memory
   task write;
      input [63:0]  addr;
      input [127:0] data;
      $write_mem(handle, data, addr);
   endtask // write

endmodule 



