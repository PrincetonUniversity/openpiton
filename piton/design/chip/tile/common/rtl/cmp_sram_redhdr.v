// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: cmp_sram_redhdr.v
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
//
//    Cluster Name:  Efuse Cluster
//    Unit Name:  cmp_redhdr (sram redundancy header)
//    Block Name: EFC
//
//    This is the header used to read and write the fuse values to the
//    RAM blocks.  It is used to drive the ICD, DCD and L2T.  It is
//    outside the array it is driving.
//
//    Top level signal renaming:
//       s/ary/<your_ary_name>/g
//       s/xfuse/<your_ary_initial>fuse/g
//
//       E.g.  fuse_ary_wren -> fuse_icd_wren
//             efc_spc_xfuse_data -> efc_spc_ifuse_data, efc_sct_fuse_data
//
//-----------------------------------------------------------------------------
`include "sys.h"
`include "iop.h"

//PITON_PROTO enables all FPGA related modifications
`ifdef PITON_PROTO 
`define FPGA_SYN_CLK
`endif

// trin: remove logic by default
`define FPGA_SYN_CLK

module cmp_sram_redhdr (/*AUTOARG*/
   // Outputs
   fuse_ary_wren, fuse_ary_rid, fuse_ary_repair_value, 
   fuse_ary_repair_en, spc_efc_xfuse_data, scanout, 
   // Inputs
   rclk, se, scanin, arst_l, testmode_l, efc_spc_fuse_clk1, 
   efc_spc_fuse_clk2, efc_spc_xfuse_data, efc_spc_xfuse_ashift, 
   efc_spc_xfuse_dshift, ary_fuse_repair_value, ary_fuse_repair_en
   );

   input		rclk;
   input		se;
   input		scanin;			// CMP clock, L1 phase
   input    arst_l;
   input    testmode_l;

   // eFuse controller interface
   input		efc_spc_fuse_clk1;
   input		efc_spc_fuse_clk2;
   input		efc_spc_xfuse_data;
   input		efc_spc_xfuse_ashift;	// addr shift; low during rst
   input		efc_spc_xfuse_dshift;	// data shift; low during rst

   // interface to cache redundancy logic
   input [7:0] ary_fuse_repair_value;  //data out for redundancy register
   input [1:0] ary_fuse_repair_en;     //enable bits out 
   

   // outputs
   // interface to icache
   output      fuse_ary_wren;         //redundancy reg wr enable, qualified
   output [5:0] fuse_ary_rid;         //redundancy register id
   output [7:0] fuse_ary_repair_value;//data in for redundancy register
   output [1:0] fuse_ary_repair_en;   //enable bits to turn on redundancy

   // serial rd data to controller
   output       spc_efc_xfuse_data;

   // normal scan out
   output       scanout;

`ifdef FPGA_SYN_CLK
   assign fuse_ary_wren = 1'b0;
   assign fuse_ary_rid = 6'b0;
   assign fuse_ary_repair_value = 8'b0;
   assign fuse_ary_repair_en = 2'b0;
   assign spc_efc_xfuse_data = 1'b0;
   assign scanout = 1'b0;
`else

   // local signals
   wire         clk;
   wire         int_clk1;
   wire         int_clk2;
   wire         int_scanout; // !! hook up to last flop in scan chain !!
   wire         int_scanin;  // !! hook up to 1st flop in scan chain !!

   wire [6:0]   addr_shft_nxt;
   wire [6:0]   addr_shft_ff;
   wire         addr_shft_en;
   wire         wren_bit;

   wire [11:0]  data_shft_nxt;
   wire [11:0]  data_shft_ff;
   wire         data_shft_en;

   wire         dshift_dly1_ff;
   wire         dshift_dly2_ff;
   wire         ashift_dly1_ff;
   wire         ashift_dly2_ff;
   wire         wren_ff;
   wire         wren_ph1;
   wire         rden_ph1;

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   // End of automatics

   //
   // Code Begins Here
   //

   assign       clk = rclk;
   
   //  Test logic
   assign       int_clk1 = (~testmode_l) ? rclk : efc_spc_fuse_clk1;
   assign       int_clk2 = (~testmode_l) ? rclk : efc_spc_fuse_clk2;
   assign       int_scanout = 1'b0; 

   // Need latch to avoid hold time problems
   // connect int_scanout to last flop in scan chain
   bw_u1_scanlg_2x so_lockup(.so (scanout), 
                             .sd (int_scanout), 
                             .ck (clk),  .se(se));
   // connect int_scanin to first flop in scan chain
   bw_u1_scanlg_2x si_lockup(.so (int_scanin),
                             .sd (scanin), 
                             .ck (clk), .se(se));

   //  Shift registers
   //  Address
   assign   addr_shft_en = efc_spc_xfuse_ashift;
   assign   addr_shft_nxt = {addr_shft_ff[5:0], efc_spc_xfuse_data};

   dffe_s #(7) addr_shft_reg (.din  (addr_shft_nxt), 
		                        .q    (addr_shft_ff), 
                            .en   (addr_shft_en), 
                            .clk  (int_clk1), .se(se), .si(), .so());
   
   assign   fuse_ary_rid[5:0] = addr_shft_ff[6:1];
   assign   wren_bit = addr_shft_ff[0];

   // Data
   assign   data_shft_en = efc_spc_xfuse_dshift | dshift_dly1_ff | rden_ph1;

   // mux2es
   assign   data_shft_nxt = rden_ph1
            ? {{3{ary_fuse_repair_en[1]}},
               ary_fuse_repair_value[7:0], 
               ary_fuse_repair_en[0]}
            : {data_shft_ff[10:0], 
               efc_spc_xfuse_data};
   
   // 10:9 is unused
   dffe_s #(12) 	 data_shft_reg (.din  (data_shft_nxt),
			                          .q    (data_shft_ff), 
                                .en   (data_shft_en), 
                                .clk  (int_clk1), .se(se), .si(), .so());
   
   assign   fuse_ary_repair_value = data_shft_ff[8:1];
   assign   fuse_ary_repair_en    = {(data_shft_ff[11] & wren_ff),
                                     (data_shft_ff[0] & wren_ff)};

   // Control
   dff_s #(1) ashift_dly1_reg (.din (efc_spc_xfuse_ashift), 
                             .q   (ashift_dly1_ff),
				                     .clk (int_clk1), .se(se), .si(), .so());
   dff_s #(1) ashift_dly2_reg (.din (ashift_dly1_ff), 
                             .q   (ashift_dly2_ff),
				                     .clk (int_clk1), .se(se), .si(), .so());

   dffrl_async #(1) dshift_dly1_reg (.din (efc_spc_xfuse_dshift), 
                             .q   (dshift_dly1_ff), 
                             .rst_l (arst_l),
				                     .clk (int_clk1), .se(se), .si(), .so());
   dffrl_async #(1) dshift_dly2_reg (.din (dshift_dly1_ff), 
                             .q   (dshift_dly2_ff), 
                             .rst_l (arst_l),
				                     .clk (int_clk1), .se(se), .si(), .so());
   
   assign   wren_ph1 = dshift_dly2_ff && ~dshift_dly1_ff && wren_bit;
   assign   rden_ph1 = ashift_dly2_ff && ~ashift_dly1_ff && ~wren_bit;

   // use phase two for wren since array writes in phase one
   dffrl_async #(1) wren_reg (.din  (wren_ph1), 
                      .q     (wren_ff),
                      .rst_l (arst_l),
				              .clk   (int_clk2), .se(se), .si(), .so());

   // address is never shifted out
   assign   spc_efc_xfuse_data = data_shft_ff[11];
   assign   fuse_ary_wren = wren_ff & testmode_l;
`endif
   
endmodule // cmp_sram_redhdr

// Local Variables:
// verilog-library-directories:("." "../../common/rtl")
// verilog-library-files:      ("../../common/rtl/swrvr_clib.v")
// verilog-auto-sense-defines-constant:t
// End:
