// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: bw_r_icd.v
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
 //  Module Name:  bw_r_icd
 //  Description:
 //    The ICD contains the icache data.
 //    32B line size.
 //    Write BW: 16B
 //    Read BW: 16Bx2 (fetdata and topdata), collapsed to 4Bx2
 //    Associativity: 4
 //    Write boundary: 34b (32b inst + parity + predec bit)
 //    NOTES:
 //    1. No clock enable.  Rd/Wr enable is used to trigger the
 //    operation.
 //    2. 2:1 mux on address input.  Selects provided externally.
 //    3. 3:1 mux on data input.   Selects provided and guaranteed
 //    exclusive, externally.
 //
 */


////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
//`include "sys.h" // system level definition file which contains the
// time scale definition


////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////

`include "ifu.tmp.h"


`ifdef SIM_FPGA_SYN_SRAM_LSU_ICACHE // simulation flag
`define PITON_PROTO
`endif

`ifdef FPGA_FORCE_SRAM_LSU_ICACHE
`undef PITON_PROTO
`endif

//PITON_PROTO enables all FPGA related modifications
`ifdef PITON_PROTO
`define FPGA_SYN_ICD
`else
`define SRAM_LSU_ICACHE
`endif

`ifdef FPGA_SYN_ICD

module bw_r_icd(icd_wsel_fetdata_s1, icd_wsel_topdata_s1, icd_fuse_repair_value,
    // sram wrapper interface
    sram_icache_w10_rtap_data,
    sram_icache_w32_rtap_data,
    rtap_srams_bist_command,
    rtap_srams_bist_data,

	icd_fuse_repair_en, so, rclk, se, si, reset_l, sehold, fdp_icd_index_bf,
	ifq_icd_index_bf, fcl_icd_index_sel_ifq_bf, ifq_icd_wrway_bf,
	ifq_icd_worden_bf, ifq_icd_wrdata_i2, fcl_icd_rdreq_bf,
	fcl_icd_wrreq_bf, bist_ic_data, rst_tri_en, ifq_icd_data_sel_old_i2,
	ifq_icd_data_sel_fill_i2, ifq_icd_data_sel_bist_i2, fuse_icd_wren,
	fuse_icd_rid, fuse_icd_repair_value, fuse_icd_repair_en,
	efc_spc_fuse_clk1);

    // sram wrapper interface
    output [`SRAM_WRAPPER_BUS_WIDTH-1:0] sram_icache_w10_rtap_data;
    output [`SRAM_WRAPPER_BUS_WIDTH-1:0] sram_icache_w32_rtap_data;
    // dummy output for the reference model
    assign sram_icache_w10_rtap_data = 0;
    assign sram_icache_w32_rtap_data = 0;
    input  [`BIST_OP_WIDTH-1:0] rtap_srams_bist_command;
    input  [`SRAM_WRAPPER_BUS_WIDTH-1:0] rtap_srams_bist_data;

	input			rclk;
	input			se;
	input			si;
	input			reset_l;
	input			sehold;
	input	[`IC_IDX_HI:2]		fdp_icd_index_bf;
	input	[`IC_IDX_HI:2]		ifq_icd_index_bf;
	input			fcl_icd_index_sel_ifq_bf;
	input	[1:0]		ifq_icd_wrway_bf;
	input	[3:0]		ifq_icd_worden_bf;
	input	[135:0]		ifq_icd_wrdata_i2;
	input			fcl_icd_rdreq_bf;
	input			fcl_icd_wrreq_bf;
	input	[7:0]		bist_ic_data;
	input			rst_tri_en;
	input			ifq_icd_data_sel_old_i2;
	input			ifq_icd_data_sel_fill_i2;
	input			ifq_icd_data_sel_bist_i2;
	input			fuse_icd_wren;
	input	[3:0]		fuse_icd_rid;
	input	[7:0]		fuse_icd_repair_value;
	input	[1:0]		fuse_icd_repair_en;
	input			efc_spc_fuse_clk1;
	output	[135:0]		icd_wsel_fetdata_s1;
	output	[135:0]		icd_wsel_topdata_s1;
	output	[7:0]		icd_fuse_repair_value;
	output	[1:0]		icd_fuse_repair_en;
	output			so;

	reg	[7:0]		icd_fuse_repair_value;
	reg	[1:0]		icd_fuse_repair_en;
	reg	[135:0]		fetdata_f;
	reg	[135:0]		topdata_f;
	reg	[135:0]		fetdata_sa;
	reg	[135:0]		topdata_sa;
	reg	[135:0]		fetdata_s1;
	reg	[135:0]		topdata_s1;
	wire			clk;
	wire	[135:0]		next_wrdata_bf;
	wire	[135:0]		wrdata_f;
	wire	[135:0]		bist_data_expand;
    `ifdef FPGA_SYN_ALTERA
        reg	[`IC_IDX_HI:2]		index_bf;
    `else
        wire [`IC_IDX_HI:2]     index_bf;
    `endif
	reg	[`IC_IDX_HI:2]		index_f;
	reg	[`IC_IDX_HI:0]		wr_index0;
	reg	[`IC_IDX_HI:0]		wr_index1;
	reg	[`IC_IDX_HI:0]		wr_index2;
	reg	[`IC_IDX_HI:0]		wr_index3;
	reg			rdreq_f;
	reg			wrreq_f;
	reg	[3:0]		worden_f;
	reg	[1:0]		wrway_f;
    `ifdef FPGA_SYN_ALTERA

        reg [33:0]     icdata_ary_00_00  [255:0] /* synthesis syn_ramstyle = block_ram  */ ;/* syn_ramstyle = no_rw_check */
        reg [33:0]     icdata_ary_00_01  [255:0] /* synthesis syn_ramstyle = block_ram  */ ;/* syn_ramstyle = no_rw_check */
        reg [33:0]     icdata_ary_00_10  [255:0] /* synthesis syn_ramstyle = block_ram  */ ;/* syn_ramstyle = no_rw_check */
        reg [33:0]     icdata_ary_00_11  [255:0] /* synthesis syn_ramstyle = block_ram  */ ;/* syn_ramstyle = no_rw_check */
        reg [33:0]     icdata_ary_01_00  [255:0] /* synthesis syn_ramstyle = block_ram  */ ;/* syn_ramstyle = no_rw_check */
        reg [33:0]     icdata_ary_01_01  [255:0] /* synthesis syn_ramstyle = block_ram  */ ;/* syn_ramstyle = no_rw_check */
        reg [33:0]     icdata_ary_01_10  [255:0] /* synthesis syn_ramstyle = block_ram  */ ;/* syn_ramstyle = no_rw_check */
        reg [33:0]     icdata_ary_01_11  [255:0] /* synthesis syn_ramstyle = block_ram  */ ;/* syn_ramstyle = no_rw_check */
        reg [33:0]     icdata_ary_10_00  [255:0] /* synthesis syn_ramstyle = block_ram  */ ;/* syn_ramstyle = no_rw_check */
        reg [33:0]     icdata_ary_10_01  [255:0] /* synthesis syn_ramstyle = block_ram  */ ;/* syn_ramstyle = no_rw_check */
        reg [33:0]     icdata_ary_10_10  [255:0] /* synthesis syn_ramstyle = block_ram  */ ;/* syn_ramstyle = no_rw_check */
        reg [33:0]     icdata_ary_10_11  [255:0] /* synthesis syn_ramstyle = block_ram  */ ;/* syn_ramstyle = no_rw_check */
        reg [33:0]     icdata_ary_11_00  [255:0] /* synthesis syn_ramstyle = block_ram  */ ;/* syn_ramstyle = no_rw_check */
        reg [33:0]     icdata_ary_11_01  [255:0] /* synthesis syn_ramstyle = block_ram  */ ;/* syn_ramstyle = no_rw_check */
        reg [33:0]     icdata_ary_11_10  [255:0] /* synthesis syn_ramstyle = block_ram  */ ;/* syn_ramstyle = no_rw_check */
        reg [33:0]     icdata_ary_11_11  [255:0] /* synthesis syn_ramstyle = block_ram  */ ;/* syn_ramstyle = no_rw_check */
    `else
        reg [33:0]     icdata_ary_00_00  [255:0] /* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */ ;
        reg [33:0]     icdata_ary_00_01  [255:0] /* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */ ;
        reg [33:0]     icdata_ary_00_10  [255:0] /* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */ ;
        reg [33:0]     icdata_ary_00_11  [255:0] /* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */ ;
        reg [33:0]     icdata_ary_01_00  [255:0] /* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */ ;
        reg [33:0]     icdata_ary_01_01  [255:0] /* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */ ;
        reg [33:0]     icdata_ary_01_10  [255:0] /* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */ ;
        reg [33:0]     icdata_ary_01_11  [255:0] /* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */ ;
        reg [33:0]     icdata_ary_10_00  [255:0] /* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */ ;
        reg [33:0]     icdata_ary_10_01  [255:0] /* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */ ;
        reg [33:0]     icdata_ary_10_10  [255:0] /* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */ ;
        reg [33:0]     icdata_ary_10_11  [255:0] /* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */ ;
        reg [33:0]     icdata_ary_11_00  [255:0] /* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */ ;
        reg [33:0]     icdata_ary_11_01  [255:0] /* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */ ;
        reg [33:0]     icdata_ary_11_10  [255:0] /* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */ ;
        reg [33:0]     icdata_ary_11_11  [255:0] /* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */ ;
    `endif





	assign clk = rclk;
    `ifdef FPGA_SYN_ALTERA
    `else
        assign index_bf = (fcl_icd_index_sel_ifq_bf ? ifq_icd_index_bf :
            fdp_icd_index_bf);
    `endif
//	assign index_bf = (fcl_icd_index_sel_ifq_bf ? ifq_icd_index_bf :
//		fdp_icd_index_bf);
  	wire [`IC_IDX_HI:2] top_index = {index_f[`IC_IDX_HI:3] , 1'b1};

	assign bist_data_expand = 136'b0;
	assign icd_wsel_fetdata_s1 = fetdata_s1;
	assign icd_wsel_topdata_s1 = topdata_s1;

	mux3ds #(136) icden_mux(
		.dout				(next_wrdata_bf),
		.in0				(wrdata_f),
		.in1				(ifq_icd_wrdata_i2),
		.in2				(bist_data_expand),
		.sel0				(ifq_icd_data_sel_old_i2),
		.sel1				(ifq_icd_data_sel_fill_i2),
		.sel2				(ifq_icd_data_sel_bist_i2));
	dffe_s #(136) wrdata_reg(
		.din				(next_wrdata_bf),
		.clk				(clk),
		.q				(wrdata_f),
		.en				((~sehold)),
		.se				(se),
		.si				(),
		.so				());

	always @(posedge clk) begin
	  if (~sehold) begin
	    rdreq_f <= fcl_icd_rdreq_bf;
	    wrreq_f <= fcl_icd_wrreq_bf;
        `ifdef FPGA_SYN_ALTERA
        `else
            index_f <= index_bf;
        `endif
	    wrway_f <= ifq_icd_wrway_bf;
	    worden_f <= ifq_icd_worden_bf;
	    wr_index0 <= {index_bf[`IC_IDX_HI:4], 2'b0, ifq_icd_wrway_bf};
	    wr_index1 <= {index_bf[`IC_IDX_HI:4], 2'b1, ifq_icd_wrway_bf};
	    wr_index2 <= {index_bf[`IC_IDX_HI:4], 2'b10, ifq_icd_wrway_bf};
	    wr_index3 <= {index_bf[`IC_IDX_HI:4], 2'b11, ifq_icd_wrway_bf};
	  end
	  fetdata_s1 <= fetdata_f;
	  topdata_s1 <= topdata_f;
  end


	reg [33:0] fetch_00_00;
	reg [33:0] fetch_00_01;
	reg [33:0] fetch_00_10;
	reg [33:0] fetch_00_11;

	reg [33:0] fetch_01_00;
	reg [33:0] fetch_01_01;
	reg [33:0] fetch_01_10;
	reg [33:0] fetch_01_11;

	reg [33:0] fetch_10_00;
	reg [33:0] fetch_10_01;
	reg [33:0] fetch_10_10;
	reg [33:0] fetch_10_11;

	reg [33:0] fetch_11_00;
	reg [33:0] fetch_11_01;
	reg [33:0] fetch_11_10;
	reg [33:0] fetch_11_11;
    `ifdef FPGA_SYN_ALTERA

	reg [33:0] fetch_00_00_d;
	reg [33:0] fetch_00_01_d;
	reg [33:0] fetch_00_10_d;
	reg [33:0] fetch_00_11_d;

	reg [33:0] fetch_01_00_d;
	reg [33:0] fetch_01_01_d;
	reg [33:0] fetch_01_10_d;
	reg [33:0] fetch_01_11_d;

	reg [33:0] fetch_10_00_d;
	reg [33:0] fetch_10_01_d;
	reg [33:0] fetch_10_10_d;
	reg [33:0] fetch_10_11_d;

	reg [33:0] fetch_11_00_d;
	reg [33:0] fetch_11_01_d;
	reg [33:0] fetch_11_10_d;
	reg [33:0] fetch_11_11_d;
    reg        delay_half_cycle;


	always @(negedge clk) begin // Sandeep Changed this to negedge clock from posedge clock
        // Can we push the reads to the next negedge? Delay this read!! Looks
        // like the previous write does not get through
    `else
    always @(posedge clk) begin
    `endif
	  fetch_00_00 <= icdata_ary_00_00[index_bf[`IC_IDX_HI:4]];
	  fetch_00_01 <= icdata_ary_00_01[index_bf[`IC_IDX_HI:4]];
	  fetch_00_10 <= icdata_ary_00_10[index_bf[`IC_IDX_HI:4]];
	  fetch_00_11 <= icdata_ary_00_11[index_bf[`IC_IDX_HI:4]];

	  fetch_01_00 <= icdata_ary_01_00[index_bf[`IC_IDX_HI:4]];
	  fetch_01_01 <= icdata_ary_01_01[index_bf[`IC_IDX_HI:4]];
	  fetch_01_10 <= icdata_ary_01_10[index_bf[`IC_IDX_HI:4]];
	  fetch_01_11 <= icdata_ary_01_11[index_bf[`IC_IDX_HI:4]];

	  fetch_10_00 <= icdata_ary_10_00[index_bf[`IC_IDX_HI:4]];
	  fetch_10_01 <= icdata_ary_10_01[index_bf[`IC_IDX_HI:4]];
	  fetch_10_10 <= icdata_ary_10_10[index_bf[`IC_IDX_HI:4]];
	  fetch_10_11 <= icdata_ary_10_11[index_bf[`IC_IDX_HI:4]];

	  fetch_11_00 <= icdata_ary_11_00[index_bf[`IC_IDX_HI:4]];
	  fetch_11_01 <= icdata_ary_11_01[index_bf[`IC_IDX_HI:4]];
	  fetch_11_10 <= icdata_ary_11_10[index_bf[`IC_IDX_HI:4]];
	  fetch_11_11 <= icdata_ary_11_11[index_bf[`IC_IDX_HI:4]];
      `ifdef FPGA_SYN_ALTERA
          index_f <= index_bf; // Sandeep moved this logic 1/2 cycle forward for altera
          index_bf <= (fcl_icd_index_sel_ifq_bf ? ifq_icd_index_bf : // Moved this logic from a continuous assignment to a synchronous assignment
              fdp_icd_index_bf);
      `endif
	end


	always @(index_f or rdreq_f or fetch_00_00 or fetch_01_00 or fetch_10_00 or fetch_11_00
				    or fetch_00_01 or fetch_01_01 or fetch_10_01 or fetch_11_01
				    or fetch_00_10 or fetch_01_10 or fetch_10_10 or fetch_11_10
				    or fetch_00_11 or fetch_01_11 or fetch_10_11 or fetch_11_11) begin
//	  if (rdreq_f) begin
	    case(index_f[3:2])
	      2'b00: fetdata_f[33:0] = fetch_00_00;
	      2'b01: fetdata_f[33:0] = fetch_01_00;
	      2'b10: fetdata_f[33:0] = fetch_10_00;
	      2'b11: fetdata_f[33:0] = fetch_11_00;
	    endcase
	    case(index_f[3:2])
	      2'b00: fetdata_f[67:34] = fetch_00_01;
	      2'b01: fetdata_f[67:34] = fetch_01_01;
	      2'b10: fetdata_f[67:34] = fetch_10_01;
	      2'b11: fetdata_f[67:34] = fetch_11_01;
	    endcase
	    case(index_f[3:2])
	      2'b00: fetdata_f[101:68] = fetch_00_10;
	      2'b01: fetdata_f[101:68] = fetch_01_10;
	      2'b10: fetdata_f[101:68] = fetch_10_10;
	      2'b11: fetdata_f[101:68] = fetch_11_10;
	    endcase
	    case(index_f[3:2])
	      2'b00: fetdata_f[135:102] = fetch_00_11;
	      2'b01: fetdata_f[135:102] = fetch_01_11;
	      2'b10: fetdata_f[135:102] = fetch_10_11;
	      2'b11: fetdata_f[135:102] = fetch_11_11;
	    endcase
	    case(index_f[3])
              1'b0: topdata_f[33:0] = fetch_01_00;
	      1'b1: topdata_f[33:0] = fetch_11_00;
	    endcase
	    case(index_f[3])
              1'b0: topdata_f[67:34] = fetch_01_01;
	      1'b1: topdata_f[67:34] = fetch_11_01;
	    endcase
	    case(index_f[3])
              1'b0: topdata_f[101:68] = fetch_01_10;
	      1'b1: topdata_f[101:68] = fetch_11_10;
	    endcase
	    case(index_f[3])
              1'b0: topdata_f[135:102] = fetch_01_11;
	      1'b1: topdata_f[135:102] = fetch_11_11;
	    endcase
	  end
//	  else
//	    begin
//	      fetdata_f = 136'b0;
//	      topdata_f = 136'b0;
//	    end
//	end

	always @(negedge clk) begin // Writes happening at the negedge
	  if (wrreq_f & (~rst_tri_en)) begin
	    if (worden_f[0]) begin
	      if (wr_index0[1:0] == 2'b0) begin
		icdata_ary_00_00[wr_index0[`IC_IDX_HI:4]] <= wrdata_f[135:102];
	      end
	      if (wr_index0[1:0] == 2'b1) begin
		icdata_ary_00_01[wr_index0[`IC_IDX_HI:4]] <= wrdata_f[135:102];
	      end
	      if (wr_index0[1:0] == 2'b10) begin
		icdata_ary_00_10[wr_index0[`IC_IDX_HI:4]] <= wrdata_f[135:102];
	      end
	      if (wr_index0[1:0] == 2'b11) begin
		icdata_ary_00_11[wr_index0[`IC_IDX_HI:4]] <= wrdata_f[135:102];
	      end
	    end
	    if (worden_f[1]) begin
	      if (wr_index1[1:0] == 2'b0) begin
		icdata_ary_01_00[wr_index1[`IC_IDX_HI:4]] <= wrdata_f[101:68];
	      end
	      if (wr_index1[1:0] == 2'b1) begin
		icdata_ary_01_01[wr_index1[`IC_IDX_HI:4]] <= wrdata_f[101:68];
	      end
	      if (wr_index1[1:0] == 2'b10) begin
		icdata_ary_01_10[wr_index1[`IC_IDX_HI:4]] <= wrdata_f[101:68];
	      end
	      if (wr_index1[1:0] == 2'b11) begin
		icdata_ary_01_11[wr_index1[`IC_IDX_HI:4]] <= wrdata_f[101:68];
	      end
	    end
	    if (worden_f[2]) begin
	      if (wr_index2[1:0] == 2'b0) begin
		icdata_ary_10_00[wr_index2[`IC_IDX_HI:4]] <= wrdata_f[67:34];
	      end
	      if (wr_index2[1:0] == 2'b1) begin
		icdata_ary_10_01[wr_index2[`IC_IDX_HI:4]] <= wrdata_f[67:34];
	      end
	      if (wr_index2[1:0] == 2'b10) begin
		icdata_ary_10_10[wr_index2[`IC_IDX_HI:4]] <= wrdata_f[67:34];
	      end
	      if (wr_index2[1:0] == 2'b11) begin
		icdata_ary_10_11[wr_index2[`IC_IDX_HI:4]] <= wrdata_f[67:34];
	      end
	    end
	    if (worden_f[3]) begin
	      if (wr_index3[1:0] == 2'b0) begin
		icdata_ary_11_00[wr_index3[`IC_IDX_HI:4]] <= wrdata_f[33:0];
	      end
	      if (wr_index3[1:0] == 2'b1) begin
		icdata_ary_11_01[wr_index3[`IC_IDX_HI:4]] <= wrdata_f[33:0];
	      end
	      if (wr_index3[1:0] == 2'b10) begin
		icdata_ary_11_10[wr_index3[`IC_IDX_HI:4]] <= wrdata_f[33:0];
	      end
	      if (wr_index3[1:0] == 2'b11) begin
		icdata_ary_11_11[wr_index3[`IC_IDX_HI:4]] <= wrdata_f[33:0];
	      end
	    end
	  end
	end
endmodule

`endif

`ifdef SRAM_LSU_ICACHE

module bw_r_icd(

    // sram wrapper interface
    sram_icache_w10_rtap_data,
    sram_icache_w32_rtap_data,
    rtap_srams_bist_command,
    rtap_srams_bist_data,


    icd_wsel_fetdata_s1, icd_wsel_topdata_s1, icd_fuse_repair_value,
    icd_fuse_repair_en, so, rclk, se, si, reset_l, sehold, fdp_icd_index_bf,
    ifq_icd_index_bf, fcl_icd_index_sel_ifq_bf, ifq_icd_wrway_bf,
    ifq_icd_worden_bf, ifq_icd_wrdata_i2, fcl_icd_rdreq_bf,
    fcl_icd_wrreq_bf, bist_ic_data, rst_tri_en, ifq_icd_data_sel_old_i2,
    ifq_icd_data_sel_fill_i2, ifq_icd_data_sel_bist_i2, fuse_icd_wren,
    fuse_icd_rid, fuse_icd_repair_value, fuse_icd_repair_en,
    efc_spc_fuse_clk1);

    // sram wrapper interface
    output [`SRAM_WRAPPER_BUS_WIDTH-1:0] sram_icache_w10_rtap_data;
    output [`SRAM_WRAPPER_BUS_WIDTH-1:0] sram_icache_w32_rtap_data;
    input  [`BIST_OP_WIDTH-1:0] rtap_srams_bist_command;
    input  [`SRAM_WRAPPER_BUS_WIDTH-1:0] rtap_srams_bist_data;

    input           rclk;
    input           se;
    input           si;
    input           reset_l;
    input           sehold;
    input   [`IC_IDX_HI:2]      fdp_icd_index_bf;
    input   [`IC_IDX_HI:2]      ifq_icd_index_bf;
    input           fcl_icd_index_sel_ifq_bf;
    input   [1:0]       ifq_icd_wrway_bf;
    input   [3:0]       ifq_icd_worden_bf;
    input   [135:0]     ifq_icd_wrdata_i2;
    input           fcl_icd_rdreq_bf;
    input           fcl_icd_wrreq_bf;
    input   [7:0]       bist_ic_data;
    input           rst_tri_en;
    input           ifq_icd_data_sel_old_i2;
    input           ifq_icd_data_sel_fill_i2;
    input           ifq_icd_data_sel_bist_i2;
    input           fuse_icd_wren;
    input   [3:0]       fuse_icd_rid;
    input   [7:0]       fuse_icd_repair_value;
    input   [1:0]       fuse_icd_repair_en;
    input           efc_spc_fuse_clk1;
    output  [135:0]     icd_wsel_fetdata_s1;
    output  [135:0]     icd_wsel_topdata_s1;
    output  [7:0]       icd_fuse_repair_value;
    output  [1:0]       icd_fuse_repair_en;
    output          so;

    reg [7:0]       icd_fuse_repair_value;
    reg [1:0]       icd_fuse_repair_en;
    reg [135:0]     fetdata_f;
    reg [135:0]     topdata_f;
    // reg [135:0]     fetdata_sa;
    // reg [135:0]     topdata_sa;
    reg [135:0]     fetdata_s1;
    reg [135:0]     topdata_s1;
    wire            clk;
    wire    [135:0]     next_wrdata_bf;
    reg    [135:0]     wrdata_f;
    wire    [135:0]     bist_data_expand;
    wire [`IC_IDX_HI:2]     index_bf;
    reg [`IC_IDX_HI:2]      index_f;
    reg [`IC_IDX_HI:2]      index_s1;
    // reg [`IC_IDX_HI:0]      wr_index0;
    // reg [`IC_IDX_HI:0]      wr_index1;
    // reg [`IC_IDX_HI:0]      wr_index2;
    // reg [`IC_IDX_HI:0]      wr_index3;
    // reg         rdreq_f;
    // reg         wrreq_f;
    // reg [3:0]       worden_f;
    reg [1:0]       wrway_f;


    assign clk = rclk;
    assign index_bf = (fcl_icd_index_sel_ifq_bf ? ifq_icd_index_bf :
        fdp_icd_index_bf);

    // wire [`IC_IDX_HI:2] top_index = {index_f[`IC_IDX_HI:3] , 1'b1};

    always @ (posedge clk)
    begin
        wrway_f <= ifq_icd_wrway_bf;
        index_f <= index_bf;
        index_s1 <= index_f;
    end

    assign bist_data_expand = 136'b0;
    assign icd_wsel_fetdata_s1 = fetdata_s1;
    assign icd_wsel_topdata_s1 = topdata_s1;

    // mux3ds #(136) icden_mux(
    //     .dout               (next_wrdata_bf),
    //     .in0                (wrdata_f),
    //     .in1                (ifq_icd_wrdata_i2),
    //     .in2                (bist_data_expand),
    //     .sel0               (ifq_icd_data_sel_old_i2),
    //     .sel1               (ifq_icd_data_sel_fill_i2),
    //     .sel2               (ifq_icd_data_sel_bist_i2));
    // dffe_s #(136) wrdata_reg(
    //     .din                (next_wrdata_bf),
    //     .clk                (clk),
    //     .q              (wrdata_f),
    //     .en             ((~sehold)),
    //     .se             (se));

    assign next_wrdata_bf = ifq_icd_data_sel_old_i2 ? wrdata_f :
                            ifq_icd_data_sel_fill_i2 ? ifq_icd_wrdata_i2 : bist_data_expand;

    always @ (posedge clk)
    begin
        wrdata_f <= next_wrdata_bf;
    end

    wire  [543:0] read_data_f;
    wire [543:0] wrdata_expanded_bf;
    reg  [543:0] wrmask_expanded_bf;
    wire [135:0] wrmask_bf;

sram_l1i_data icache_way_10
(
    .MEMCLK(rclk),
    .RESET_N(reset_l),
    .CE(fcl_icd_rdreq_bf | fcl_icd_wrreq_bf),
    .A(index_bf[`IC_IDX_HI:4]),
    .DIN(wrdata_expanded_bf[271:0]),
    .BW(wrmask_expanded_bf[271:0]),
    .RDWEN(~fcl_icd_wrreq_bf),
    .DOUT(read_data_f[271:0]),

    .BIST_COMMAND(rtap_srams_bist_command),
    .BIST_DIN(rtap_srams_bist_data),
    .BIST_DOUT(sram_icache_w10_rtap_data),
    .SRAMID(`BIST_ID_L1_ICACHE_W10)
);


sram_l1i_data icache_way_32
(
    .MEMCLK(rclk),
    .RESET_N(reset_l),
    .CE(fcl_icd_rdreq_bf | fcl_icd_wrreq_bf),
    .A(index_bf[`IC_IDX_HI:4]),
    .DIN(wrdata_expanded_bf[543:272]),
    .BW(wrmask_expanded_bf[543:272]),
    .RDWEN(~fcl_icd_wrreq_bf),
    .DOUT(read_data_f[543:272]),

    .BIST_COMMAND(rtap_srams_bist_command),
    .BIST_DIN(rtap_srams_bist_data),
    .BIST_DOUT(sram_icache_w32_rtap_data),
    .SRAMID(`BIST_ID_L1_ICACHE_W32)
);


    // reg  [543:0] read_data_s1;
    wire [33:0]     icdata_ary_00_00;
    wire [33:0]     icdata_ary_00_01;
    wire [33:0]     icdata_ary_00_10;
    wire [33:0]     icdata_ary_00_11;
    wire [33:0]     icdata_ary_01_00;
    wire [33:0]     icdata_ary_01_01;
    wire [33:0]     icdata_ary_01_10;
    wire [33:0]     icdata_ary_01_11;
    wire [33:0]     icdata_ary_10_00;
    wire [33:0]     icdata_ary_10_01;
    wire [33:0]     icdata_ary_10_10;
    wire [33:0]     icdata_ary_10_11;
    wire [33:0]     icdata_ary_11_00;
    wire [33:0]     icdata_ary_11_01;
    wire [33:0]     icdata_ary_11_10;
    wire [33:0]     icdata_ary_11_11;
    // reg [135:0]     fetdata_s1;
    // reg [135:0]     topdata_s1;

    assign {icdata_ary_11_00,icdata_ary_11_01,icdata_ary_11_10,icdata_ary_11_11,
            icdata_ary_10_00,icdata_ary_10_01,icdata_ary_10_10,icdata_ary_10_11,
            icdata_ary_01_00,icdata_ary_01_01,icdata_ary_01_10,icdata_ary_01_11,
            icdata_ary_00_00,icdata_ary_00_01,icdata_ary_00_10,icdata_ary_00_11} = read_data_f;

    // way, word

    always @ *
    begin
      case (index_f[3:2])
        2'b00:
        begin
          fetdata_f = {icdata_ary_11_00, icdata_ary_10_00, icdata_ary_01_00, icdata_ary_00_00};
          topdata_f = {icdata_ary_11_01, icdata_ary_10_01, icdata_ary_01_01, icdata_ary_00_01};
        end
        2'b01:
        begin
          fetdata_f = {icdata_ary_11_01, icdata_ary_10_01, icdata_ary_01_01, icdata_ary_00_01};
          topdata_f = {icdata_ary_11_01, icdata_ary_10_01, icdata_ary_01_01, icdata_ary_00_01};
        end
        2'b10:
        begin
          fetdata_f = {icdata_ary_11_10, icdata_ary_10_10, icdata_ary_01_10, icdata_ary_00_10};
          topdata_f = {icdata_ary_11_11, icdata_ary_10_11, icdata_ary_01_11, icdata_ary_00_11};
        end
        2'b11:
        begin
          fetdata_f = {icdata_ary_11_11, icdata_ary_10_11, icdata_ary_01_11, icdata_ary_00_11};
          topdata_f = {icdata_ary_11_11, icdata_ary_10_11, icdata_ary_01_11, icdata_ary_00_11};
        end
      endcase
    end

    // always @ (posedge clk)
    // begin
    // end

    ///WRITE

    assign wrdata_expanded_bf = {4{next_wrdata_bf}};
    assign wrmask_bf = {{34{ifq_icd_worden_bf[0]}},{34{ifq_icd_worden_bf[1]}},{34{ifq_icd_worden_bf[2]}},{34{ifq_icd_worden_bf[3]}}};

    always @ *
    begin
        case (ifq_icd_wrway_bf)
          2'b11:
          begin
            wrmask_expanded_bf = {wrmask_bf, 136'b0, 136'b0, 136'b0};
          end
          2'b10:
          begin
            wrmask_expanded_bf = {136'b0, wrmask_bf, 136'b0, 136'b0};
          end
          2'b01:
          begin
            wrmask_expanded_bf = {136'b0, 136'b0, wrmask_bf, 136'b0};
          end
          2'b00:
          begin
            wrmask_expanded_bf = {136'b0, 136'b0, 136'b0, wrmask_bf};
          end
        endcase
    end

    always @ (posedge clk)
    begin
        fetdata_s1 <= fetdata_f;
        topdata_s1 <= topdata_f;
    end


endmodule


`endif // IBM


`ifdef SIM_FPGA_SYN_SRAM_LSU_ICACHE // simulation flag
`undef PITON_PROTO
`endif

`ifdef FPGA_FORCE_SRAM_LSU_ICACHE
`define PITON_PROTO
`endif
