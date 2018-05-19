// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: dram_mon.v
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
////////////////////////////////////////////////////////;
// dram_mon.vpal
//
// Description: DRAM Monitor for an aide to coverage objects for DRAM
// THIS FILE HAS TO BE TRANSFORMED TO dram_mon.v by running
// pal -r $(PAL_OPTS) -o dram_mon.v dram_mon.vpal or most probably just
// pal -r -o dram_mon.v dram_mon.vpal
////////////////////////////////////////////////////////


`include "cross_module.h"

// locally used defines
`define DRAM_L2IF0 `DCTLPATH0.dramctl0.dram_l2if
`define DRAM_L2IF1 `DCTLPATH0.dramctl1.dram_l2if
`define DRAM_L2IF2 `DCTLPATH1.dramctl0.dram_l2if
`define DRAM_L2IF3 `DCTLPATH1.dramctl1.dram_l2if
`define DRAM_DP0 `DCTLPATH0.dramctl0.dram_dctl.dram_dp
`define DRAM_DP1 `DCTLPATH0.dramctl1.dram_dctl.dram_dp
`define DRAM_DP2 `DCTLPATH1.dramctl0.dram_dctl.dram_dp
`define DRAM_DP3 `DCTLPATH1.dramctl1.dram_dctl.dram_dp



module dram_mon ( clk, rst_l);

//--------------------------------------------------------------------------------------
// Interface (note that most of the stuff is cross-module referencing,
// so the interface is minimal
//--------------------------------------------------------------------------------------
  input clk;		// the cpu clock
  input rst_l;		// reset (active low).

//--------------------------------------------------------------------------------------
// a variable which decides should we print all dram_mon messages
//--------------------------------------------------------------------------------------
  reg dram_mon_msg;
  initial
  begin
    if( $test$plusargs("dram_mon_msg") ) 
      dram_mon_msg = 1'b1;
    else
      dram_mon_msg= 1'b0;
  end

// other declarations
//--------------------------------------------------------------------------------------
integer i,j;
// This has to be a define and its value need be updated depending on max time 
// allowed in the que, 1000 for now
wire [20:0] MAX_TIME = 1000000;



// logic for for 2-state simulation
wire                   dram_rst_l_sig    = `DRAM_PATH0.rst_l;
reg dram_rst_l;
initial dram_rst_l = 0 ;

always @(posedge clk) begin
  while (dram_rst_l_sig !== 0) @(posedge clk) ;
  dram_rst_l = 0 ;
  while (dram_rst_l_sig !== 1) @(posedge clk) ;
  dram_rst_l = 1 ;
end


// address for schooming read and write with same address
// actual address is 0, but this is updated to indicate the autoprecharge condition.
wire [31:0] SCHMOO_RD_WR_ADDR = 32'h400; // identical to que_rd_addr_picked[31:0]
// cacheline not considered in the above case, it it here.
wire [34:0] SCHMOO_SCRB_ADDR  = {SCHMOO_RD_WR_ADDR[31:3], 3'b000, SCHMOO_RD_WR_ADDR[2:0]};

//wire                   dram_rst_l    = `DRAM_PATH0.rst_l;
wire                   cmp_clk       = `DCTLPATH0.cmp_rclk;
wire                   cmp_rst_l     = `DCTLPATH0.cmp_rst_l;
//--------------------------------------------------------------------------------------
// RD and WR fifo 
//--------------------------------------------------------------------------------------
//`define DRAM_PATH0 `DRAM_PATH0.dramctl0.dram_dctl.dram_que
//`define DRAM_PATH1 `DRAM_PATH0.dramctl1.dram_dctl.dram_que
//`define DRAM_PATH2 `DRAM_PATH1.dramctl0.dram_dctl.dram_que
//`define DRAM_PATH3 `DRAM_PATH1.dramctl1.dram_dctl.dram_que
   // read que request 
   wire                   dram_Ch0_rd_req    = `DRAM_PATH0.que_rd_req;
   wire    [2:0]          dram_Ch0_rd_id     = `DRAM_PATH0.que_rd_id0;
   // read que
   wire  [39:0] 	  dram_Ch0_rd_q_0 	= {`DRAM_PATH0.readqbank0vld0, 
                                                   `DRAM_PATH0.readqbank0id0[2:0],
                                                   `DRAM_PATH0.readqbank0addr0[35:0]};
   wire  [39:0] 	  dram_Ch0_rd_q_1 	= {`DRAM_PATH0.readqbank0vld1,
                                                   `DRAM_PATH0.readqbank0id1[2:0],
                                                   `DRAM_PATH0.readqbank0addr1[35:0]};
   wire  [39:0] 	  dram_Ch0_rd_q_2 	= {`DRAM_PATH0.readqbank0vld2,
                                                   `DRAM_PATH0.readqbank0id2[2:0],
                                                   `DRAM_PATH0.readqbank0addr2[35:0]};
   wire  [39:0] 	  dram_Ch0_rd_q_3 	= {`DRAM_PATH0.readqbank0vld3,
                                                   `DRAM_PATH0.readqbank0id3[2:0],
                                                   `DRAM_PATH0.readqbank0addr3[35:0]};
   wire  [39:0] 	  dram_Ch0_rd_q_4 	= {`DRAM_PATH0.readqbank0vld4,
                                                   `DRAM_PATH0.readqbank0id4[2:0],
                                                   `DRAM_PATH0.readqbank0addr4[35:0]};
   wire  [39:0] 	  dram_Ch0_rd_q_5 	= {`DRAM_PATH0.readqbank0vld5,
                                                   `DRAM_PATH0.readqbank0id5[2:0],
                                                   `DRAM_PATH0.readqbank0addr5[35:0]};
   wire  [39:0] 	  dram_Ch0_rd_q_6 	= {`DRAM_PATH0.readqbank0vld6,
                                                   `DRAM_PATH0.readqbank0id6[2:0],
                                                   `DRAM_PATH0.readqbank0addr6[35:0]};
   wire  [39:0] 	  dram_Ch0_rd_q_7 	= {`DRAM_PATH0.readqbank0vld7,
                                                   `DRAM_PATH0.readqbank0id7[2:0],
                                                   `DRAM_PATH0.readqbank0addr7[35:0]};

   reg   [39:0]           dram_Ch0_rd_q[7:0];
   // read que collapsing fifo
   wire  [8:0]   	  dram_Ch0_rd_colps_q_0 	= {`DRAM_PATH0.que_b0_index_ent0[8:0]};
   wire  [8:0]   	  dram_Ch0_rd_colps_q_1 	= {`DRAM_PATH0.que_b0_index_ent1[8:0]};
   wire  [8:0]   	  dram_Ch0_rd_colps_q_2 	= {`DRAM_PATH0.que_b0_index_ent2[8:0]};
   wire  [8:0]   	  dram_Ch0_rd_colps_q_3 	= {`DRAM_PATH0.que_b0_index_ent3[8:0]};
   wire  [8:0]   	  dram_Ch0_rd_colps_q_4 	= {`DRAM_PATH0.que_b0_index_ent4[8:0]};
   wire  [8:0]   	  dram_Ch0_rd_colps_q_5 	= {`DRAM_PATH0.que_b0_index_ent5[8:0]};
   wire  [8:0]   	  dram_Ch0_rd_colps_q_6 	= {`DRAM_PATH0.que_b0_index_ent6[8:0]};
   wire  [8:0]   	  dram_Ch0_rd_colps_q_7 	= {`DRAM_PATH0.que_b0_index_ent7[8:0]};

   reg   [8:0]   	  dram_Ch0_rd_colps_q[7:0];

   // read que write pointer 
   wire  [7:0]   	  dram_Ch0_rd_que_wr_ptr 	= {`DRAM_PATH0.rqb0entry7wren,
                                                           `DRAM_PATH0.rqb0entry6wren,
                                                           `DRAM_PATH0.rqb0entry5wren,
                                                           `DRAM_PATH0.rqb0entry4wren,
                                                           `DRAM_PATH0.rqb0entry3wren,
                                                           `DRAM_PATH0.rqb0entry2wren,
                                                           `DRAM_PATH0.rqb0entry1wren,
                                                           `DRAM_PATH0.rqb0entry0wren};
   // read que read pointer 
   wire  [7:0]   	  dram_Ch0_rd_que_rd_ptr 	= {`DRAM_PATH0.readqbank0vld7reset,
                                                           `DRAM_PATH0.readqbank0vld6reset,
                                                           `DRAM_PATH0.readqbank0vld5reset,
                                                           `DRAM_PATH0.readqbank0vld4reset,
                                                           `DRAM_PATH0.readqbank0vld3reset,
                                                           `DRAM_PATH0.readqbank0vld2reset,
                                                           `DRAM_PATH0.readqbank0vld1reset,
                                                           `DRAM_PATH0.readqbank0vld0reset};

   // write que request 
   wire                   dram_Ch0_wr_req    = `DRAM_PATH0.que_wr_req;
   wire    [2:0]          dram_Ch0_wr_addr   = `DRAM_PATH0.que_cpu_wr_addr;
   // read que
   wire  [40:0] 	  dram_Ch0_wr_q_0 	= {`DRAM_PATH0.writeqbank0vld0,    
                                                   `DRAM_PATH0.writeqbank0vld0_arb,
                                                   `DRAM_PATH0.writeqaddr0[2:0],
                                                   `DRAM_PATH0.writeqbank0addr0[35:0]};
   wire  [40:0] 	  dram_Ch0_wr_q_1 	= {`DRAM_PATH0.writeqbank0vld1,
                                                   `DRAM_PATH0.writeqbank0vld1_arb,
                                                   `DRAM_PATH0.writeqaddr1[2:0],
                                                   `DRAM_PATH0.writeqbank0addr1[35:0]};
   wire  [40:0] 	  dram_Ch0_wr_q_2 	= {`DRAM_PATH0.writeqbank0vld2,
                                                   `DRAM_PATH0.writeqbank0vld2_arb,
                                                   `DRAM_PATH0.writeqaddr2[2:0],
                                                   `DRAM_PATH0.writeqbank0addr2[35:0]};
   wire  [40:0] 	  dram_Ch0_wr_q_3 	= {`DRAM_PATH0.writeqbank0vld3,
                                                   `DRAM_PATH0.writeqbank0vld3_arb,
                                                   `DRAM_PATH0.writeqaddr3[2:0],
                                                   `DRAM_PATH0.writeqbank0addr3[35:0]};
   wire  [40:0] 	  dram_Ch0_wr_q_4 	= {`DRAM_PATH0.writeqbank0vld4,
                                                   `DRAM_PATH0.writeqbank0vld4_arb,
                                                   `DRAM_PATH0.writeqaddr4[2:0],
                                                   `DRAM_PATH0.writeqbank0addr4[35:0]};
   wire  [40:0] 	  dram_Ch0_wr_q_5 	= {`DRAM_PATH0.writeqbank0vld5,
                                                   `DRAM_PATH0.writeqbank0vld5_arb,
                                                   `DRAM_PATH0.writeqaddr5[2:0],
                                                   `DRAM_PATH0.writeqbank0addr5[35:0]};
   wire  [40:0] 	  dram_Ch0_wr_q_6 	= {`DRAM_PATH0.writeqbank0vld6,
                                                   `DRAM_PATH0.writeqbank0vld6_arb,
                                                   `DRAM_PATH0.writeqaddr6[2:0],
                                                   `DRAM_PATH0.writeqbank0addr6[35:0]};
   wire  [40:0] 	  dram_Ch0_wr_q_7 	= {`DRAM_PATH0.writeqbank0vld7,
                                                   `DRAM_PATH0.writeqbank0vld7_arb,
                                                   `DRAM_PATH0.writeqaddr7[2:0],
                                                   `DRAM_PATH0.writeqbank0addr7[35:0]};
   reg   [40:0]           dram_Ch0_wr_q[7:0];

   // to not set valid for the fifo monitor
   wire                   dram_Ch0_pa_err   = `DRAM_L2IF0.l2if_split_wr_addr[32];

   // write que collapsing fifo
   wire  [8:0]   	  dram_Ch0_wr_colps_q_0 	= {`DRAM_PATH0.que_b0_wr_index_ent0[8:0]};
   wire  [8:0]   	  dram_Ch0_wr_colps_q_1 	= {`DRAM_PATH0.que_b0_wr_index_ent1[8:0]};
   wire  [8:0]   	  dram_Ch0_wr_colps_q_2 	= {`DRAM_PATH0.que_b0_wr_index_ent2[8:0]};
   wire  [8:0]   	  dram_Ch0_wr_colps_q_3 	= {`DRAM_PATH0.que_b0_wr_index_ent3[8:0]};
   wire  [8:0]   	  dram_Ch0_wr_colps_q_4 	= {`DRAM_PATH0.que_b0_wr_index_ent4[8:0]};
   wire  [8:0]   	  dram_Ch0_wr_colps_q_5 	= {`DRAM_PATH0.que_b0_wr_index_ent5[8:0]};
   wire  [8:0]   	  dram_Ch0_wr_colps_q_6 	= {`DRAM_PATH0.que_b0_wr_index_ent6[8:0]};
   wire  [8:0]   	  dram_Ch0_wr_colps_q_7 	= {`DRAM_PATH0.que_b0_wr_index_ent7[8:0]};

   reg   [8:0]   	  dram_Ch0_wr_colps_q[7:0];

   // write que write pointer 
   wire  [7:0]   	  dram_Ch0_wr_que_wr_ptr 	= {`DRAM_PATH0.wqb0entry7wren,
                                                           `DRAM_PATH0.wqb0entry6wren,
                                                           `DRAM_PATH0.wqb0entry5wren,
                                                           `DRAM_PATH0.wqb0entry4wren,
                                                           `DRAM_PATH0.wqb0entry3wren,
                                                           `DRAM_PATH0.wqb0entry2wren,
                                                           `DRAM_PATH0.wqb0entry1wren,
                                                           `DRAM_PATH0.wqb0entry0wren};
   // write que arb read pointer 
   wire  [7:0]   	  dram_Ch0_wr_que_rd_ptr_arb	= {`DRAM_PATH0.writeqbank0vld7reset_arb,
                                                           `DRAM_PATH0.writeqbank0vld6reset_arb,
                                                           `DRAM_PATH0.writeqbank0vld5reset_arb,
                                                           `DRAM_PATH0.writeqbank0vld4reset_arb,
                                                           `DRAM_PATH0.writeqbank0vld3reset_arb,
                                                           `DRAM_PATH0.writeqbank0vld2reset_arb,
                                                           `DRAM_PATH0.writeqbank0vld1reset_arb,
                                                           `DRAM_PATH0.writeqbank0vld0reset_arb};
   // write que data read pointer 
   wire  [7:0]   	  dram_Ch0_wr_que_rd_ptr 	= {`DRAM_PATH0.writeqbank0vld7reset,
                                                           `DRAM_PATH0.writeqbank0vld6reset,
                                                           `DRAM_PATH0.writeqbank0vld5reset,
                                                           `DRAM_PATH0.writeqbank0vld4reset,
                                                           `DRAM_PATH0.writeqbank0vld3reset,
                                                           `DRAM_PATH0.writeqbank0vld2reset,
                                                           `DRAM_PATH0.writeqbank0vld1reset,
                                                           `DRAM_PATH0.writeqbank0vld0reset};
   wire  [4:0]   	  dram_Ch0_que_mem_addr 	=  `DRAM_PATH0.que_mem_addr;

// These signals are currently not used in cov obj
// enable for 8 deep collps rd fifo
   wire  [7:0]            dram_Ch0_que_b0_index_en   = {`DRAM_PATH0.que_b0_index7_en,
                                                           `DRAM_PATH0.que_b0_index6_en,
                                                           `DRAM_PATH0.que_b0_index5_en,
                                                           `DRAM_PATH0.que_b0_index4_en,
                                                           `DRAM_PATH0.que_b0_index3_en,
                                                           `DRAM_PATH0.que_b0_index2_en,
                                                           `DRAM_PATH0.que_b0_index1_en,
                                                           `DRAM_PATH0.que_b0_index0_en};
// These signals are currently not used in cov obj
// enable for 8 deep collps wr fifo
   wire  [7:0]            dram_Ch0_que_b0_wr_index_en= {`DRAM_PATH0.que_b0_wr_index7_en,
                                                           `DRAM_PATH0.que_b0_wr_index6_en,
                                                           `DRAM_PATH0.que_b0_wr_index5_en,
                                                           `DRAM_PATH0.que_b0_wr_index4_en,
                                                           `DRAM_PATH0.que_b0_wr_index3_en,
                                                           `DRAM_PATH0.que_b0_wr_index2_en,
                                                           `DRAM_PATH0.que_b0_wr_index1_en,
                                                           `DRAM_PATH0.que_b0_wr_index0_en};

// These signals are currently not used in cov obj
// indicating that the rd is picked the moment it comes in, if to the same bank no req pend/no refresh
   wire  [7:0]            dram_Ch0_que_b0_rd_in_val  =  `DRAM_PATH0.que_b0_rd_in_val;

// indicates that the RAS is all ready to go (met the timing w.r.t. other req )
   wire  [7:0]            dram_Ch0_b_ras_pend_req    = {`DRAM_PATH0.b7_ras_pend_req,
                                                           `DRAM_PATH0.b6_ras_pend_req,
                                                           `DRAM_PATH0.b5_ras_pend_req,
                                                           `DRAM_PATH0.b4_ras_pend_req,
                                                           `DRAM_PATH0.b3_ras_pend_req,
                                                           `DRAM_PATH0.b2_ras_pend_req,
                                                           `DRAM_PATH0.b1_ras_pend_req,
                                                           `DRAM_PATH0.b0_ras_pend_req};
   wire  [7:0]            dram_Ch0_que_ras_picked    =  `DRAM_PATH0.que_ras_picked;

// indicates that the CAS is all ready to go (met the timing w.r.t. other req )
   wire  [7:0]            dram_Ch0_b_cas_pend_req    = {`DRAM_PATH0.b7_cas_pend_req,
                                                           `DRAM_PATH0.b6_cas_pend_req,
                                                           `DRAM_PATH0.b5_cas_pend_req,
                                                           `DRAM_PATH0.b4_cas_pend_req,
                                                           `DRAM_PATH0.b3_cas_pend_req,
                                                           `DRAM_PATH0.b2_cas_pend_req,
                                                           `DRAM_PATH0.b1_cas_pend_req,
                                                           `DRAM_PATH0.b0_cas_pend_req};
   wire  [7:0]            dram_Ch0_que_cas_picked    =  `DRAM_PATH0.que_cas_picked_d1;
// rd hits a wr in the wr Q
   wire                   dram_Ch0_que_rd_wr_hit     =  `DRAM_PATH0.que_b0_wr_index_pend;

// Signals that will be used to detect oldest entry to the same bank.
   // in 2 channel mode this is the real indicator that the request is picked from this channel
   wire                   dram_Ch0_que_this_ch_picked     =  (~`DRAM_PATH0.que_channel_disabled) ?
                           `DRAM_PATH0.que_ras_bank_picked_en && ~`DRAM_PATH0.que_channel_picked_internal:
                           `DRAM_PATH0.que_ras_bank_picked_en &&  `DRAM_PATH0.que_channel_picked_internal;
 
   wire  [2:0]            dram_Ch0_que_b0_index_picked        =  `DRAM_PATH0.que_b0_index_picked;
   wire                   dram_Ch0_que_b0_rd_picked           =  `DRAM_PATH0.que_b0_rd_picked;
   wire                   dram_Ch0_que_b0_wr_picked           =  `DRAM_PATH0.que_b0_wr_picked;
   wire                   dram_Ch0_que_b0_cmd_picked          =  `DRAM_PATH0.que_b0_cmd_picked;


//----------------------------------------------------------------------------------------
// Refresh to go and all CAS request to same CS are done, no new RAS issued.
//----------------------------------------------------------------------------------------
   wire  [4:0]   	  dram_Ch0_que_pos    	       = `DRAM_PATH0.que_int_pos;
   wire          	  dram_Ch0_que_ref_go 	       = `DRAM_PATH0.que_ref_go;
   wire          	  dram_Ch0_que_hw_selfrsh 	       = `DRAM_PATH0.que_hw_selfrsh;
   wire  [7:0]   	  dram_Ch0_que_cas_valid 	       = `DRAM_PATH0.que_cas_valid;
   wire  [1:0]   	  dram_Ch0_b0_phy_bank_bits 	       = `DRAM_PATH0.b0_phy_bank_bits;
   wire  [1:0]   	  dram_Ch0_b1_phy_bank_bits 	       = `DRAM_PATH0.b1_phy_bank_bits;
   wire  [1:0]   	  dram_Ch0_b2_phy_bank_bits 	       = `DRAM_PATH0.b2_phy_bank_bits;
   wire  [1:0]   	  dram_Ch0_b3_phy_bank_bits 	       = `DRAM_PATH0.b3_phy_bank_bits;
   wire  [1:0]   	  dram_Ch0_b4_phy_bank_bits 	       = `DRAM_PATH0.b4_phy_bank_bits;
   wire  [1:0]   	  dram_Ch0_b5_phy_bank_bits 	       = `DRAM_PATH0.b5_phy_bank_bits;
   wire  [1:0]   	  dram_Ch0_b6_phy_bank_bits 	       = `DRAM_PATH0.b6_phy_bank_bits;
   wire  [1:0]   	  dram_Ch0_b7_phy_bank_bits 	       = `DRAM_PATH0.b7_phy_bank_bits;
   reg   [1:0]   	  dram_Ch0_b_phy_bank_bits[7:0];

   wire  [1:0]   	  dram_Ch0_que_refresh_rank 	       = `DRAM_PATH0.que_refresh_rank;


//----------------------------------------------------------------------------------------
// Starvation counter causing the wr to have priority. 
//----------------------------------------------------------------------------------------
   wire  [7:0]   	  dram_Ch0_que_pick_wr_first 	= `DRAM_PATH0.que_pick_wr_first;

//----------------------------------------------------------------------------------------
// Scrub Related
//----------------------------------------------------------------------------------------
   // picking the que_split_scrb_addr as _que_scrb_addr_picked_
   wire  [35:0]   	  dram_Ch0_que_scrb_addr_picked 	= `DRAM_PATH0.que_split_scrb_addr;
   wire           	  dram_Ch0_que_scrb_picked 		= `DRAM_PATH0.que_scrb_picked;
   wire           	  dram_Ch0_que_scrb_rd_picked 	= `DRAM_PATH0.que_scrb_rd_picked;
   wire           	  dram_Ch0_que_ras_bank_picked_en 	= `DRAM_PATH0.que_ras_bank_picked_en;
   wire           	  dram_Ch0_que_scrb_write_req 	= `DRAM_PATH0.que_scrb_write_req;

// req valid and scrb valid, the scrb should be cleared first
   wire  [7:0]   	  dram_Ch0_que_l2req_valid 	=  `DRAM_PATH0.que_bank_l2req_valids | 
							   `DRAM_PATH0.ch1_que_l2req_valids;
   wire  [7:0]   	  dram_Ch0_scrb_indx_val   	=  `DRAM_PATH0.que_scrb_indx_val;

//----------------------------------------------------------------------------------------
// Dram Registers
//----------------------------------------------------------------------------------------
   wire  [8:0]   	  dram_Ch0_chip_config_reg 	        = `DRAM_PATH0.chip_config_reg[8:0];
   wire  [2:0]   	  dram_Ch0_mode_reg        	        = `DRAM_PATH0.mode_reg[6:4];
   wire  [3:0]   	  dram_Ch0_rrd_reg        	        = `DRAM_PATH0.rrd_reg;
   wire  [4:0]   	  dram_Ch0_rc_reg         	        = `DRAM_PATH0.rc_reg;
   wire  [3:0]   	  dram_Ch0_rcd_reg         	        = `DRAM_PATH0.rcd_reg;
   wire  [3:0]   	  dram_Ch0_wtr_dly_reg         	= `DRAM_PATH0.wtr_dly_reg;
   wire  [3:0]   	  dram_Ch0_rtw_dly_reg         	= `DRAM_PATH0.rtw_dly_reg;
   wire  [3:0]   	  dram_Ch0_rtp_reg         		= `DRAM_PATH0.rtp_reg;
   wire  [3:0]   	  dram_Ch0_ras_reg         		= `DRAM_PATH0.ras_reg;
   wire  [3:0]   	  dram_Ch0_rp_reg          		= `DRAM_PATH0.rp_reg;
   wire  [3:0]   	  dram_Ch0_wr_reg          		= `DRAM_PATH0.wr_reg;
   wire  [1:0]   	  dram_Ch0_mrd_reg          		= `DRAM_PATH0.mrd_reg;
   wire  [1:0]   	  dram_Ch0_iwtr_reg          	= `DRAM_PATH0.iwtr_reg;
   wire  [14:0]   	  dram_Ch0_ext_mode_reg2          	= `DRAM_PATH0.ext_mode_reg2;
   wire  [14:0]   	  dram_Ch0_ext_mode_reg1          	= `DRAM_PATH0.ext_mode_reg1;
   wire  [14:0]   	  dram_Ch0_ext_mode_reg3          	= `DRAM_PATH0.ext_mode_reg3;
   wire          	  dram_Ch0_que_eight_bank_mode       = `DRAM_PATH0.que_eight_bank_mode;
   wire          	  dram_Ch0_que_rank1_present         = `DRAM_PATH0.que_rank1_present;
   wire          	  dram_Ch0_que_channel_disabled      = `DRAM_PATH0.que_channel_disabled;
   wire          	  dram_Ch0_que_addr_bank_low_sel     = `DRAM_PATH0.que_addr_bank_low_sel;
   wire          	  dram_Ch0_que_init     		= `DRAM_PATH0.que_init;
   wire  [2:0]   	  dram_Ch0_que_data_del_cnt          = `DRAM_PATH0.que_data_del_cnt;
   wire          	  dram_Ch0_dram_io_pad_clk_inv       = `DRAM_PATH0.dram_io_pad_clk_inv;
   wire  [1:0]   	  dram_Ch0_dram_io_ptr_clk_inv       = `DRAM_PATH0.dram_io_ptr_clk_inv;
   wire          	  dram_Ch0_que_wr_mode_reg_done      = `DRAM_PATH0.que_wr_mode_reg_done;
   wire          	  dram_Ch0_que_init_status_reg       = `DRAM_PATH0.que_init_status_reg;
   wire  [3:0]   	  dram_Ch0_que_dimms_present         = `DRAM_PATH0.que_dimms_present;
   wire          	  dram_Ch0_dram_fail_over_mode       = `DRAM_PATH0.dram_fail_over_mode;
   wire  [31:0]  	  dram_Ch0_dram_fail_over_mask       = `DRAM_PATH0.dram_fail_over_mask;
   wire          	  dram_Ch0_que_dbg_trig_en	        = `DRAM_PATH0.que_dbg_trig_en;
   wire  [22:0]  	  dram_Ch0_que_err_sts_reg	        = `DRAM_PATH0.que_err_sts_reg;
   wire  [35:0]  	  dram_Ch0_que_err_addr_reg	        = `DRAM_PATH0.que_err_addr_reg;
   wire          	  dram_Ch0_err_inj_reg	        = `DRAM_PATH0.err_inj_reg;
   wire          	  dram_Ch0_sshot_err_reg	        = `DRAM_PATH0.sshot_err_reg;
   wire  [1:0]  	  dram_Ch0_que_err_cnt  	        = `DRAM_PATH0.que_err_cnt[17:16];
   wire  [31:0]  	  dram_Ch0_que_err_loc  	        = `DRAM_PATH0.que_err_loc;

   // NACK - for non existant register read
   wire          	  dram_Ch0_que_l2if_ack_vld	        = `DRAM_PATH0.que_l2if_ack_vld;
   wire          	  dram_Ch0_que_l2if_nack_vld	        = `DRAM_PATH0.que_l2if_nack_vld;

   wire          	  dram_Ch0_que_init_dram_done	= `DRAM_PATH0.que_init_dram_done;

//----------------------------------------------------------------------------------------
// Dram l2if interface
//----------------------------------------------------------------------------------------
   wire          	  dram_Ch0_sctag_dram_rd_req 	= `DRAM_L2IF0.sctag_dram_rd_req;
   wire  [2:0]   	  dram_Ch0_sctag_dram_rd_req_id 	= `DRAM_L2IF0.sctag_dram_rd_req_id;
   wire  [39:5]   	  dram_Ch0_sctag_dram_addr      	= `DRAM_L2IF0.sctag_dram_addr;
   wire          	  dram_Ch0_sctag_dram_rd_dummy_req 	= `DRAM_L2IF0.sctag_dram_rd_dummy_req;
   wire          	  dram_Ch0_dram_sctag_rd_ack       	= `DRAM_L2IF0.dram_sctag_rd_ack;
   wire          	  dram_Ch0_sctag_dram_wr_req 	= `DRAM_L2IF0.sctag_dram_wr_req;
   wire          	  dram_Ch0_sctag_dram_data_vld 	= `DRAM_L2IF0.sctag_dram_data_vld;
   wire  [63:0]  	  dram_Ch0_sctag_dram_wr_data 	= `DRAM_L2IF0.sctag_dram_wr_data;
   wire          	  dram_Ch0_dram_sctag_wr_ack       	= `DRAM_L2IF0.dram_sctag_wr_ack;
   wire          	  dram_Ch0_dram_sctag_data_vld     	= `DRAM_L2IF0.dram_sctag_data_vld;
   wire  [127:0] 	  dram_Ch0_dram_sctag_data         	= `DRAM_L2IF0.dram_sctag_data;
   wire  [2:0]   	  dram_Ch0_dram_sctag_rd_req_id    	= `DRAM_L2IF0.dram_sctag_rd_req_id;
   wire  [3:0]   	  dram_Ch0_l2if_b0_rd_val          	= `DRAM_L2IF0.l2if_b0_rd_val;
   wire  [3:0]   	  dram_Ch0_l2if_b1_rd_val          	= `DRAM_L2IF0.l2if_b1_rd_val;
   wire  [3:0]   	  dram_Ch0_l2if_b0_wr_val          	= `DRAM_L2IF0.l2if_b0_wr_val;
   wire  [3:0]   	  dram_Ch0_l2if_b1_wr_val          	= `DRAM_L2IF0.l2if_b1_wr_val;
   wire  [5:0]   	  dram_Ch0_l2if_wr_b0_data_addr      = `DRAM_L2IF0.l2if_wr_b0_data_addr;

   // Signals on L2 Interface that indicates Error
   wire          	  dram_Ch0_dram_sctag_secc_err       = `DRAM_L2IF0.dram_sctag_secc_err;
   wire          	  dram_Ch0_dram_sctag_pa_err         = `DRAM_L2IF0.dram_sctag_pa_err;
   wire          	  dram_Ch0_dram_sctag_mecc_err       = `DRAM_L2IF0.dram_sctag_mecc_err;
   wire          	  dram_Ch0_dram_sctag_scb_secc_err   = `DRAM_L2IF0.dram_sctag_scb_secc_err;
   wire          	  dram_Ch0_dram_sctag_scb_mecc_err   = `DRAM_L2IF0.dram_sctag_scb_mecc_err;

   // Error signal for update of error status, error location and error address register.
   //wire          	  dram_Ch0_l2if_scrb_val_d2          = `DRAM_L2IF0.l2if_scrb_val_d3;
   // l2if_scrb_data_val is now qualifying scrb in the rtl
   wire          	  dram_Ch0_l2if_scrb_val_d2          = `DRAM_L2IF0.l2if_scrb_data_val;
// qualified with vld since they can be on due to residual ( previous error )
   wire          	  dram_Ch0_l2if_secc_err             = `DRAM_L2IF0.l2if_secc_err && (`DRAM_L2IF0.dram_sctag_data_vld_d2 || `DRAM_L2IF0.l2if_scrb_data_val);
   wire          	  dram_Ch0_l2if_mecc_err_partial     = `DRAM_L2IF0.l2if_mecc_err_partial && (`DRAM_L2IF0.dram_sctag_data_vld_d2 || `DRAM_L2IF0.l2if_scrb_data_val);
   wire          	  dram_Ch0_l2if_pa_err               = `DRAM_L2IF0.l2if_pa_err && `DRAM_L2IF0.dram_sctag_data_vld_d2;
   wire  [6:0]   	  dram_Ch0_err_sts_reg               = `DRAM_L2IF0.err_sts_reg[22:16];
   wire          	  dram_Ch0_l2if_err_sts_reg_en6      = `DRAM_L2IF0.l2if_err_sts_reg_en6;
   wire          	  dram_Ch0_l2if_err_sts_reg_en5      = `DRAM_L2IF0.l2if_err_sts_reg_en5;
   wire          	  dram_Ch0_l2if_err_sts_reg_en4      = `DRAM_L2IF0.l2if_err_sts_reg_en4;
   wire          	  dram_Ch0_l2if_err_sts_reg_en3      = `DRAM_L2IF0.l2if_err_sts_reg_en3;
   wire          	  dram_Ch0_l2if_err_sts_reg_en2      = `DRAM_L2IF0.l2if_err_sts_reg_en2;
   wire          	  dram_Ch0_l2if_err_sts_reg_en1      = `DRAM_L2IF0.l2if_err_sts_reg_en1;
   wire          	  dram_Ch0_l2if_err_sts_reg_en0      = `DRAM_L2IF0.l2if_err_sts_reg_en0;
   wire          	  dram_Ch0_l2if_err_sts_reg_en       = `DRAM_L2IF0.l2if_err_sts_reg_en;
   wire          	  dram_Ch0_l2if_err_addr_reg_en      = `DRAM_L2IF0.l2if_err_addr_reg_en;
   wire          	  dram_Ch0_l2if_secc_loc_en          = `DRAM_L2IF0.l2if_secc_loc_en;

   wire  [3:0]   	  dram_Ch0_cpu_wr_addr               = `DRAM_L2IF0.dram_cpu_wr_addr;
   wire  [3:0]   	  dram_Ch0_cpu_wr_en                 = `DRAM_L2IF0.dram_cpu_wr_en;

   wire          	  dram_Ch0_clspine_dram_tx_sync 	= `DRAM_L2IF0.dram_dram_tx_sync;

// l2if wr entry valid ( for the actual data valid creation)
   wire  [7:0]            dram_Ch0_l2if_wr_entry             = {
                                                                  `DRAM_L2IF0.l2if_wr_entry7,
                                                                  `DRAM_L2IF0.l2if_wr_entry6,
                                                                  `DRAM_L2IF0.l2if_wr_entry5,
                                                                  `DRAM_L2IF0.l2if_wr_entry4,
                                                                  `DRAM_L2IF0.l2if_wr_entry3,
                                                                  `DRAM_L2IF0.l2if_wr_entry2,
                                                                  `DRAM_L2IF0.l2if_wr_entry1,
                                                                  `DRAM_L2IF0.l2if_wr_entry0
                                                                  };

// enabled for 8 deep FIFO that expects the first data to come back
   wire  [7:0]            dram_Ch0_l2if_data_ret_fifo_en     = {
                                                                  `DRAM_L2IF0.l2if_fifo_ent7_en,
                                                                  `DRAM_L2IF0.l2if_fifo_ent6_en,
                                                                  `DRAM_L2IF0.l2if_fifo_ent5_en,
                                                                  `DRAM_L2IF0.l2if_fifo_ent4_en,
                                                                  `DRAM_L2IF0.l2if_fifo_ent3_en,
                                                                  `DRAM_L2IF0.l2if_fifo_ent2_en,
                                                                  `DRAM_L2IF0.l2if_fifo_ent1_en,
                                                                  `DRAM_L2IF0.l2if_fifo_ent0_en
                                                                  };



  wire   [8:0]            dram_Ch0_rd_adr_info_hi		 = {
                                                                  `DRAM_L2IF0.l2if_addr_bank_low_sel,
                                                                  `DRAM_L2IF0.dram_rd_addr_gen_hi.addr_err,
                                                                  `DRAM_L2IF0.dram_rd_addr_gen_hi.stack_adr,
                                                                  `DRAM_L2IF0.dram_rd_addr_gen_hi.rank_adr,
                                                                  `DRAM_L2IF0.dram_rd_addr_gen_hi.bank_adr[2] && `DRAM_L2IF0.dram_rd_addr_gen_hi.eight_bank_mode,
                                                                  `DRAM_L2IF0.dram_rd_addr_gen_hi.bank_adr[1:0],
                                                                  `DRAM_L2IF0.dram_rd_addr_gen_hi.eight_bank_mode,
                                                                  `DRAM_L2IF0.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };
  wire   [8:0]            dram_Ch0_wr_adr_info_hi		 = {
                                                                  `DRAM_L2IF0.l2if_addr_bank_low_sel,
                                                                  `DRAM_L2IF0.dram_wr_addr_gen_hi.addr_err,
                                                                  `DRAM_L2IF0.dram_wr_addr_gen_hi.stack_adr,
                                                                  `DRAM_L2IF0.dram_wr_addr_gen_hi.rank_adr,
                                                                  `DRAM_L2IF0.dram_wr_addr_gen_hi.bank_adr[2] && `DRAM_L2IF0.dram_wr_addr_gen_hi.eight_bank_mode,
                                                                  `DRAM_L2IF0.dram_wr_addr_gen_hi.bank_adr[1:0],
                                                                  `DRAM_L2IF0.dram_wr_addr_gen_hi.eight_bank_mode,
                                                                  `DRAM_L2IF0.dram_wr_addr_gen_hi.two_channel_mode
                                                                  };
  wire   [8:0]            dram_Ch0_rd_adr_info_lo		 = {
                                                                  `DRAM_L2IF0.l2if_addr_bank_low_sel,
                                                                  `DRAM_L2IF0.dram_rd_addr_gen_lo.addr_err,
                                                                  `DRAM_L2IF0.dram_rd_addr_gen_lo.stack_adr,
                                                                  `DRAM_L2IF0.dram_rd_addr_gen_lo.rank_adr,
                                                                  `DRAM_L2IF0.dram_rd_addr_gen_lo.bank_adr[2] && `DRAM_L2IF0.dram_rd_addr_gen_lo.eight_bank_mode,
                                                                  `DRAM_L2IF0.dram_rd_addr_gen_lo.bank_adr[1:0],
                                                                  `DRAM_L2IF0.dram_rd_addr_gen_lo.eight_bank_mode,
                                                                  `DRAM_L2IF0.dram_rd_addr_gen_lo.two_channel_mode
                                                                  };
  wire   [8:0]            dram_Ch0_wr_adr_info_lo		 = {
                                                                  `DRAM_L2IF0.l2if_addr_bank_low_sel,
                                                                  `DRAM_L2IF0.dram_wr_addr_gen_lo.addr_err,
                                                                  `DRAM_L2IF0.dram_wr_addr_gen_lo.stack_adr,
                                                                  `DRAM_L2IF0.dram_wr_addr_gen_lo.rank_adr,
                                                                  `DRAM_L2IF0.dram_wr_addr_gen_lo.bank_adr[2] && `DRAM_L2IF0.dram_wr_addr_gen_lo.eight_bank_mode,
                                                                  `DRAM_L2IF0.dram_wr_addr_gen_lo.bank_adr[1:0],
                                                                  `DRAM_L2IF0.dram_wr_addr_gen_lo.eight_bank_mode,
                                                                  `DRAM_L2IF0.dram_wr_addr_gen_lo.two_channel_mode
                                                                  };
                                                                 

 
//----------------------------------------------------------------------------------------
// Dram DP 
//----------------------------------------------------------------------------------------
   wire  [3:0]            dram_Ch0_dp_pioson_l2_data          = `DRAM_DP0.dp_pioson_l2_data;
   wire  [1:0]            dram_Ch0_dp_pioson_l2_chunk         = `DRAM_DP0.dp_pioson_l2_chunk;

//----------------------------------------------------------------------------------------
// Performance counters
//----------------------------------------------------------------------------------------

   wire  [7:0]            dram_Ch0_perf_cntl          = `DRAM_PATH0.que_perf_cntl_reg;
   wire                   dram_Ch0_cnt0_sticky_bit    = `DRAM_PATH0.que_perf_cnt0_reg[31];
   wire                   dram_Ch0_cnt1_sticky_bit    = `DRAM_PATH0.que_perf_cnt1_reg[31];

//----------------------------------------------------------------------------------------
// for line coverage
//----------------------------------------------------------------------------------------
//   wire  [2:0] 		  dram_Ch0_que_wl_addr_cnt0 =  `DRAM_PATH0.que_wl_addr_cnt0;
//   wire  [2:0] 		  dram_Ch0_que_wl_addr_cnt1 =  `DRAM_PATH0.que_wl_addr_cnt1;
//   wire  [2:0] 		  dram_Ch0_que_wl_data_addr0_load_cas2 =  `DRAM_PATH0.que_wl_data_addr0_load_cas2;
//   wire  [2:0] 		  dram_Ch0_que_wl_data_addr0_load =  `DRAM_PATH0.que_wl_data_addr0_load;
//   wire  [2:0] 		  dram_Ch0_que_wl_data_addr1_load =  `DRAM_PATH0.que_wl_data_addr1_load;
//

//----------------------------------------------------------------------------------------
// RAS/CAS/CS/BANK for observing the target pattern of the x-action ( which CS/which BANK)
//----------------------------------------------------------------------------------------

   wire                   dram_Ch0_RAS_L          = `TOP_MOD_INST.DRAM0_RAS_L;
   wire                   dram_Ch0_CAS_L          = `TOP_MOD_INST.DRAM0_CAS_L;
   wire                   dram_Ch0_WE_L           = `TOP_MOD_INST.DRAM0_WE_L;
   wire  [2:0]            dram_Ch0_BA             = `TOP_MOD_INST.DRAM0_BA;
   wire  [3:0]            dram_Ch0_CS_L           = `TOP_MOD_INST.DRAM0_CS_L;
   wire  [14:0]           dram_Ch0_ADDR           = `TOP_MOD_INST.DRAM0_ADDR;

   // read que request 
   wire                   dram_Ch1_rd_req    = `DRAM_PATH1.que_rd_req;
   wire    [2:0]          dram_Ch1_rd_id     = `DRAM_PATH1.que_rd_id0;
   // read que
   wire  [39:0] 	  dram_Ch1_rd_q_0 	= {`DRAM_PATH1.readqbank0vld0, 
                                                   `DRAM_PATH1.readqbank0id0[2:0],
                                                   `DRAM_PATH1.readqbank0addr0[35:0]};
   wire  [39:0] 	  dram_Ch1_rd_q_1 	= {`DRAM_PATH1.readqbank0vld1,
                                                   `DRAM_PATH1.readqbank0id1[2:0],
                                                   `DRAM_PATH1.readqbank0addr1[35:0]};
   wire  [39:0] 	  dram_Ch1_rd_q_2 	= {`DRAM_PATH1.readqbank0vld2,
                                                   `DRAM_PATH1.readqbank0id2[2:0],
                                                   `DRAM_PATH1.readqbank0addr2[35:0]};
   wire  [39:0] 	  dram_Ch1_rd_q_3 	= {`DRAM_PATH1.readqbank0vld3,
                                                   `DRAM_PATH1.readqbank0id3[2:0],
                                                   `DRAM_PATH1.readqbank0addr3[35:0]};
   wire  [39:0] 	  dram_Ch1_rd_q_4 	= {`DRAM_PATH1.readqbank0vld4,
                                                   `DRAM_PATH1.readqbank0id4[2:0],
                                                   `DRAM_PATH1.readqbank0addr4[35:0]};
   wire  [39:0] 	  dram_Ch1_rd_q_5 	= {`DRAM_PATH1.readqbank0vld5,
                                                   `DRAM_PATH1.readqbank0id5[2:0],
                                                   `DRAM_PATH1.readqbank0addr5[35:0]};
   wire  [39:0] 	  dram_Ch1_rd_q_6 	= {`DRAM_PATH1.readqbank0vld6,
                                                   `DRAM_PATH1.readqbank0id6[2:0],
                                                   `DRAM_PATH1.readqbank0addr6[35:0]};
   wire  [39:0] 	  dram_Ch1_rd_q_7 	= {`DRAM_PATH1.readqbank0vld7,
                                                   `DRAM_PATH1.readqbank0id7[2:0],
                                                   `DRAM_PATH1.readqbank0addr7[35:0]};

   reg   [39:0]           dram_Ch1_rd_q[7:0];
   // read que collapsing fifo
   wire  [8:0]   	  dram_Ch1_rd_colps_q_0 	= {`DRAM_PATH1.que_b0_index_ent0[8:0]};
   wire  [8:0]   	  dram_Ch1_rd_colps_q_1 	= {`DRAM_PATH1.que_b0_index_ent1[8:0]};
   wire  [8:0]   	  dram_Ch1_rd_colps_q_2 	= {`DRAM_PATH1.que_b0_index_ent2[8:0]};
   wire  [8:0]   	  dram_Ch1_rd_colps_q_3 	= {`DRAM_PATH1.que_b0_index_ent3[8:0]};
   wire  [8:0]   	  dram_Ch1_rd_colps_q_4 	= {`DRAM_PATH1.que_b0_index_ent4[8:0]};
   wire  [8:0]   	  dram_Ch1_rd_colps_q_5 	= {`DRAM_PATH1.que_b0_index_ent5[8:0]};
   wire  [8:0]   	  dram_Ch1_rd_colps_q_6 	= {`DRAM_PATH1.que_b0_index_ent6[8:0]};
   wire  [8:0]   	  dram_Ch1_rd_colps_q_7 	= {`DRAM_PATH1.que_b0_index_ent7[8:0]};

   reg   [8:0]   	  dram_Ch1_rd_colps_q[7:0];

   // read que write pointer 
   wire  [7:0]   	  dram_Ch1_rd_que_wr_ptr 	= {`DRAM_PATH1.rqb0entry7wren,
                                                           `DRAM_PATH1.rqb0entry6wren,
                                                           `DRAM_PATH1.rqb0entry5wren,
                                                           `DRAM_PATH1.rqb0entry4wren,
                                                           `DRAM_PATH1.rqb0entry3wren,
                                                           `DRAM_PATH1.rqb0entry2wren,
                                                           `DRAM_PATH1.rqb0entry1wren,
                                                           `DRAM_PATH1.rqb0entry0wren};
   // read que read pointer 
   wire  [7:0]   	  dram_Ch1_rd_que_rd_ptr 	= {`DRAM_PATH1.readqbank0vld7reset,
                                                           `DRAM_PATH1.readqbank0vld6reset,
                                                           `DRAM_PATH1.readqbank0vld5reset,
                                                           `DRAM_PATH1.readqbank0vld4reset,
                                                           `DRAM_PATH1.readqbank0vld3reset,
                                                           `DRAM_PATH1.readqbank0vld2reset,
                                                           `DRAM_PATH1.readqbank0vld1reset,
                                                           `DRAM_PATH1.readqbank0vld0reset};

   // write que request 
   wire                   dram_Ch1_wr_req    = `DRAM_PATH1.que_wr_req;
   wire    [2:0]          dram_Ch1_wr_addr   = `DRAM_PATH1.que_cpu_wr_addr;
   // read que
   wire  [40:0] 	  dram_Ch1_wr_q_0 	= {`DRAM_PATH1.writeqbank0vld0,    
                                                   `DRAM_PATH1.writeqbank0vld0_arb,
                                                   `DRAM_PATH1.writeqaddr0[2:0],
                                                   `DRAM_PATH1.writeqbank0addr0[35:0]};
   wire  [40:0] 	  dram_Ch1_wr_q_1 	= {`DRAM_PATH1.writeqbank0vld1,
                                                   `DRAM_PATH1.writeqbank0vld1_arb,
                                                   `DRAM_PATH1.writeqaddr1[2:0],
                                                   `DRAM_PATH1.writeqbank0addr1[35:0]};
   wire  [40:0] 	  dram_Ch1_wr_q_2 	= {`DRAM_PATH1.writeqbank0vld2,
                                                   `DRAM_PATH1.writeqbank0vld2_arb,
                                                   `DRAM_PATH1.writeqaddr2[2:0],
                                                   `DRAM_PATH1.writeqbank0addr2[35:0]};
   wire  [40:0] 	  dram_Ch1_wr_q_3 	= {`DRAM_PATH1.writeqbank0vld3,
                                                   `DRAM_PATH1.writeqbank0vld3_arb,
                                                   `DRAM_PATH1.writeqaddr3[2:0],
                                                   `DRAM_PATH1.writeqbank0addr3[35:0]};
   wire  [40:0] 	  dram_Ch1_wr_q_4 	= {`DRAM_PATH1.writeqbank0vld4,
                                                   `DRAM_PATH1.writeqbank0vld4_arb,
                                                   `DRAM_PATH1.writeqaddr4[2:0],
                                                   `DRAM_PATH1.writeqbank0addr4[35:0]};
   wire  [40:0] 	  dram_Ch1_wr_q_5 	= {`DRAM_PATH1.writeqbank0vld5,
                                                   `DRAM_PATH1.writeqbank0vld5_arb,
                                                   `DRAM_PATH1.writeqaddr5[2:0],
                                                   `DRAM_PATH1.writeqbank0addr5[35:0]};
   wire  [40:0] 	  dram_Ch1_wr_q_6 	= {`DRAM_PATH1.writeqbank0vld6,
                                                   `DRAM_PATH1.writeqbank0vld6_arb,
                                                   `DRAM_PATH1.writeqaddr6[2:0],
                                                   `DRAM_PATH1.writeqbank0addr6[35:0]};
   wire  [40:0] 	  dram_Ch1_wr_q_7 	= {`DRAM_PATH1.writeqbank0vld7,
                                                   `DRAM_PATH1.writeqbank0vld7_arb,
                                                   `DRAM_PATH1.writeqaddr7[2:0],
                                                   `DRAM_PATH1.writeqbank0addr7[35:0]};
   reg   [40:0]           dram_Ch1_wr_q[7:0];

   // to not set valid for the fifo monitor
   wire                   dram_Ch1_pa_err   = `DRAM_L2IF1.l2if_split_wr_addr[32];

   // write que collapsing fifo
   wire  [8:0]   	  dram_Ch1_wr_colps_q_0 	= {`DRAM_PATH1.que_b0_wr_index_ent0[8:0]};
   wire  [8:0]   	  dram_Ch1_wr_colps_q_1 	= {`DRAM_PATH1.que_b0_wr_index_ent1[8:0]};
   wire  [8:0]   	  dram_Ch1_wr_colps_q_2 	= {`DRAM_PATH1.que_b0_wr_index_ent2[8:0]};
   wire  [8:0]   	  dram_Ch1_wr_colps_q_3 	= {`DRAM_PATH1.que_b0_wr_index_ent3[8:0]};
   wire  [8:0]   	  dram_Ch1_wr_colps_q_4 	= {`DRAM_PATH1.que_b0_wr_index_ent4[8:0]};
   wire  [8:0]   	  dram_Ch1_wr_colps_q_5 	= {`DRAM_PATH1.que_b0_wr_index_ent5[8:0]};
   wire  [8:0]   	  dram_Ch1_wr_colps_q_6 	= {`DRAM_PATH1.que_b0_wr_index_ent6[8:0]};
   wire  [8:0]   	  dram_Ch1_wr_colps_q_7 	= {`DRAM_PATH1.que_b0_wr_index_ent7[8:0]};

   reg   [8:0]   	  dram_Ch1_wr_colps_q[7:0];

   // write que write pointer 
   wire  [7:0]   	  dram_Ch1_wr_que_wr_ptr 	= {`DRAM_PATH1.wqb0entry7wren,
                                                           `DRAM_PATH1.wqb0entry6wren,
                                                           `DRAM_PATH1.wqb0entry5wren,
                                                           `DRAM_PATH1.wqb0entry4wren,
                                                           `DRAM_PATH1.wqb0entry3wren,
                                                           `DRAM_PATH1.wqb0entry2wren,
                                                           `DRAM_PATH1.wqb0entry1wren,
                                                           `DRAM_PATH1.wqb0entry0wren};
   // write que arb read pointer 
   wire  [7:0]   	  dram_Ch1_wr_que_rd_ptr_arb	= {`DRAM_PATH1.writeqbank0vld7reset_arb,
                                                           `DRAM_PATH1.writeqbank0vld6reset_arb,
                                                           `DRAM_PATH1.writeqbank0vld5reset_arb,
                                                           `DRAM_PATH1.writeqbank0vld4reset_arb,
                                                           `DRAM_PATH1.writeqbank0vld3reset_arb,
                                                           `DRAM_PATH1.writeqbank0vld2reset_arb,
                                                           `DRAM_PATH1.writeqbank0vld1reset_arb,
                                                           `DRAM_PATH1.writeqbank0vld0reset_arb};
   // write que data read pointer 
   wire  [7:0]   	  dram_Ch1_wr_que_rd_ptr 	= {`DRAM_PATH1.writeqbank0vld7reset,
                                                           `DRAM_PATH1.writeqbank0vld6reset,
                                                           `DRAM_PATH1.writeqbank0vld5reset,
                                                           `DRAM_PATH1.writeqbank0vld4reset,
                                                           `DRAM_PATH1.writeqbank0vld3reset,
                                                           `DRAM_PATH1.writeqbank0vld2reset,
                                                           `DRAM_PATH1.writeqbank0vld1reset,
                                                           `DRAM_PATH1.writeqbank0vld0reset};
   wire  [4:0]   	  dram_Ch1_que_mem_addr 	=  `DRAM_PATH1.que_mem_addr;

// These signals are currently not used in cov obj
// enable for 8 deep collps rd fifo
   wire  [7:0]            dram_Ch1_que_b0_index_en   = {`DRAM_PATH1.que_b0_index7_en,
                                                           `DRAM_PATH1.que_b0_index6_en,
                                                           `DRAM_PATH1.que_b0_index5_en,
                                                           `DRAM_PATH1.que_b0_index4_en,
                                                           `DRAM_PATH1.que_b0_index3_en,
                                                           `DRAM_PATH1.que_b0_index2_en,
                                                           `DRAM_PATH1.que_b0_index1_en,
                                                           `DRAM_PATH1.que_b0_index0_en};
// These signals are currently not used in cov obj
// enable for 8 deep collps wr fifo
   wire  [7:0]            dram_Ch1_que_b0_wr_index_en= {`DRAM_PATH1.que_b0_wr_index7_en,
                                                           `DRAM_PATH1.que_b0_wr_index6_en,
                                                           `DRAM_PATH1.que_b0_wr_index5_en,
                                                           `DRAM_PATH1.que_b0_wr_index4_en,
                                                           `DRAM_PATH1.que_b0_wr_index3_en,
                                                           `DRAM_PATH1.que_b0_wr_index2_en,
                                                           `DRAM_PATH1.que_b0_wr_index1_en,
                                                           `DRAM_PATH1.que_b0_wr_index0_en};

// These signals are currently not used in cov obj
// indicating that the rd is picked the moment it comes in, if to the same bank no req pend/no refresh
   wire  [7:0]            dram_Ch1_que_b0_rd_in_val  =  `DRAM_PATH1.que_b0_rd_in_val;

// indicates that the RAS is all ready to go (met the timing w.r.t. other req )
   wire  [7:0]            dram_Ch1_b_ras_pend_req    = {`DRAM_PATH1.b7_ras_pend_req,
                                                           `DRAM_PATH1.b6_ras_pend_req,
                                                           `DRAM_PATH1.b5_ras_pend_req,
                                                           `DRAM_PATH1.b4_ras_pend_req,
                                                           `DRAM_PATH1.b3_ras_pend_req,
                                                           `DRAM_PATH1.b2_ras_pend_req,
                                                           `DRAM_PATH1.b1_ras_pend_req,
                                                           `DRAM_PATH1.b0_ras_pend_req};
   wire  [7:0]            dram_Ch1_que_ras_picked    =  `DRAM_PATH1.que_ras_picked;

// indicates that the CAS is all ready to go (met the timing w.r.t. other req )
   wire  [7:0]            dram_Ch1_b_cas_pend_req    = {`DRAM_PATH1.b7_cas_pend_req,
                                                           `DRAM_PATH1.b6_cas_pend_req,
                                                           `DRAM_PATH1.b5_cas_pend_req,
                                                           `DRAM_PATH1.b4_cas_pend_req,
                                                           `DRAM_PATH1.b3_cas_pend_req,
                                                           `DRAM_PATH1.b2_cas_pend_req,
                                                           `DRAM_PATH1.b1_cas_pend_req,
                                                           `DRAM_PATH1.b0_cas_pend_req};
   wire  [7:0]            dram_Ch1_que_cas_picked    =  `DRAM_PATH1.que_cas_picked_d1;
// rd hits a wr in the wr Q
   wire                   dram_Ch1_que_rd_wr_hit     =  `DRAM_PATH1.que_b0_wr_index_pend;

// Signals that will be used to detect oldest entry to the same bank.
   // in 2 channel mode this is the real indicator that the request is picked from this channel
   wire                   dram_Ch1_que_this_ch_picked     =  (~`DRAM_PATH1.que_channel_disabled) ?
                           `DRAM_PATH1.que_ras_bank_picked_en && ~`DRAM_PATH1.que_channel_picked_internal:
                           `DRAM_PATH1.que_ras_bank_picked_en &&  `DRAM_PATH1.que_channel_picked_internal;
 
   wire  [2:0]            dram_Ch1_que_b0_index_picked        =  `DRAM_PATH1.que_b0_index_picked;
   wire                   dram_Ch1_que_b0_rd_picked           =  `DRAM_PATH1.que_b0_rd_picked;
   wire                   dram_Ch1_que_b0_wr_picked           =  `DRAM_PATH1.que_b0_wr_picked;
   wire                   dram_Ch1_que_b0_cmd_picked          =  `DRAM_PATH1.que_b0_cmd_picked;


//----------------------------------------------------------------------------------------
// Refresh to go and all CAS request to same CS are done, no new RAS issued.
//----------------------------------------------------------------------------------------
   wire  [4:0]   	  dram_Ch1_que_pos    	       = `DRAM_PATH1.que_int_pos;
   wire          	  dram_Ch1_que_ref_go 	       = `DRAM_PATH1.que_ref_go;
   wire          	  dram_Ch1_que_hw_selfrsh 	       = `DRAM_PATH1.que_hw_selfrsh;
   wire  [7:0]   	  dram_Ch1_que_cas_valid 	       = `DRAM_PATH1.que_cas_valid;
   wire  [1:0]   	  dram_Ch1_b0_phy_bank_bits 	       = `DRAM_PATH1.b0_phy_bank_bits;
   wire  [1:0]   	  dram_Ch1_b1_phy_bank_bits 	       = `DRAM_PATH1.b1_phy_bank_bits;
   wire  [1:0]   	  dram_Ch1_b2_phy_bank_bits 	       = `DRAM_PATH1.b2_phy_bank_bits;
   wire  [1:0]   	  dram_Ch1_b3_phy_bank_bits 	       = `DRAM_PATH1.b3_phy_bank_bits;
   wire  [1:0]   	  dram_Ch1_b4_phy_bank_bits 	       = `DRAM_PATH1.b4_phy_bank_bits;
   wire  [1:0]   	  dram_Ch1_b5_phy_bank_bits 	       = `DRAM_PATH1.b5_phy_bank_bits;
   wire  [1:0]   	  dram_Ch1_b6_phy_bank_bits 	       = `DRAM_PATH1.b6_phy_bank_bits;
   wire  [1:0]   	  dram_Ch1_b7_phy_bank_bits 	       = `DRAM_PATH1.b7_phy_bank_bits;
   reg   [1:0]   	  dram_Ch1_b_phy_bank_bits[7:0];

   wire  [1:0]   	  dram_Ch1_que_refresh_rank 	       = `DRAM_PATH1.que_refresh_rank;


//----------------------------------------------------------------------------------------
// Starvation counter causing the wr to have priority. 
//----------------------------------------------------------------------------------------
   wire  [7:0]   	  dram_Ch1_que_pick_wr_first 	= `DRAM_PATH1.que_pick_wr_first;

//----------------------------------------------------------------------------------------
// Scrub Related
//----------------------------------------------------------------------------------------
   // picking the que_split_scrb_addr as _que_scrb_addr_picked_
   wire  [35:0]   	  dram_Ch1_que_scrb_addr_picked 	= `DRAM_PATH1.que_split_scrb_addr;
   wire           	  dram_Ch1_que_scrb_picked 		= `DRAM_PATH1.que_scrb_picked;
   wire           	  dram_Ch1_que_scrb_rd_picked 	= `DRAM_PATH1.que_scrb_rd_picked;
   wire           	  dram_Ch1_que_ras_bank_picked_en 	= `DRAM_PATH1.que_ras_bank_picked_en;
   wire           	  dram_Ch1_que_scrb_write_req 	= `DRAM_PATH1.que_scrb_write_req;

// req valid and scrb valid, the scrb should be cleared first
   wire  [7:0]   	  dram_Ch1_que_l2req_valid 	=  `DRAM_PATH1.que_bank_l2req_valids | 
							   `DRAM_PATH1.ch1_que_l2req_valids;
   wire  [7:0]   	  dram_Ch1_scrb_indx_val   	=  `DRAM_PATH1.que_scrb_indx_val;

//----------------------------------------------------------------------------------------
// Dram Registers
//----------------------------------------------------------------------------------------
   wire  [8:0]   	  dram_Ch1_chip_config_reg 	        = `DRAM_PATH1.chip_config_reg[8:0];
   wire  [2:0]   	  dram_Ch1_mode_reg        	        = `DRAM_PATH1.mode_reg[6:4];
   wire  [3:0]   	  dram_Ch1_rrd_reg        	        = `DRAM_PATH1.rrd_reg;
   wire  [4:0]   	  dram_Ch1_rc_reg         	        = `DRAM_PATH1.rc_reg;
   wire  [3:0]   	  dram_Ch1_rcd_reg         	        = `DRAM_PATH1.rcd_reg;
   wire  [3:0]   	  dram_Ch1_wtr_dly_reg         	= `DRAM_PATH1.wtr_dly_reg;
   wire  [3:0]   	  dram_Ch1_rtw_dly_reg         	= `DRAM_PATH1.rtw_dly_reg;
   wire  [3:0]   	  dram_Ch1_rtp_reg         		= `DRAM_PATH1.rtp_reg;
   wire  [3:0]   	  dram_Ch1_ras_reg         		= `DRAM_PATH1.ras_reg;
   wire  [3:0]   	  dram_Ch1_rp_reg          		= `DRAM_PATH1.rp_reg;
   wire  [3:0]   	  dram_Ch1_wr_reg          		= `DRAM_PATH1.wr_reg;
   wire  [1:0]   	  dram_Ch1_mrd_reg          		= `DRAM_PATH1.mrd_reg;
   wire  [1:0]   	  dram_Ch1_iwtr_reg          	= `DRAM_PATH1.iwtr_reg;
   wire  [14:0]   	  dram_Ch1_ext_mode_reg2          	= `DRAM_PATH1.ext_mode_reg2;
   wire  [14:0]   	  dram_Ch1_ext_mode_reg1          	= `DRAM_PATH1.ext_mode_reg1;
   wire  [14:0]   	  dram_Ch1_ext_mode_reg3          	= `DRAM_PATH1.ext_mode_reg3;
   wire          	  dram_Ch1_que_eight_bank_mode       = `DRAM_PATH1.que_eight_bank_mode;
   wire          	  dram_Ch1_que_rank1_present         = `DRAM_PATH1.que_rank1_present;
   wire          	  dram_Ch1_que_channel_disabled      = `DRAM_PATH1.que_channel_disabled;
   wire          	  dram_Ch1_que_addr_bank_low_sel     = `DRAM_PATH1.que_addr_bank_low_sel;
   wire          	  dram_Ch1_que_init     		= `DRAM_PATH1.que_init;
   wire  [2:0]   	  dram_Ch1_que_data_del_cnt          = `DRAM_PATH1.que_data_del_cnt;
   wire          	  dram_Ch1_dram_io_pad_clk_inv       = `DRAM_PATH1.dram_io_pad_clk_inv;
   wire  [1:0]   	  dram_Ch1_dram_io_ptr_clk_inv       = `DRAM_PATH1.dram_io_ptr_clk_inv;
   wire          	  dram_Ch1_que_wr_mode_reg_done      = `DRAM_PATH1.que_wr_mode_reg_done;
   wire          	  dram_Ch1_que_init_status_reg       = `DRAM_PATH1.que_init_status_reg;
   wire  [3:0]   	  dram_Ch1_que_dimms_present         = `DRAM_PATH1.que_dimms_present;
   wire          	  dram_Ch1_dram_fail_over_mode       = `DRAM_PATH1.dram_fail_over_mode;
   wire  [31:0]  	  dram_Ch1_dram_fail_over_mask       = `DRAM_PATH1.dram_fail_over_mask;
   wire          	  dram_Ch1_que_dbg_trig_en	        = `DRAM_PATH1.que_dbg_trig_en;
   wire  [22:0]  	  dram_Ch1_que_err_sts_reg	        = `DRAM_PATH1.que_err_sts_reg;
   wire  [35:0]  	  dram_Ch1_que_err_addr_reg	        = `DRAM_PATH1.que_err_addr_reg;
   wire          	  dram_Ch1_err_inj_reg	        = `DRAM_PATH1.err_inj_reg;
   wire          	  dram_Ch1_sshot_err_reg	        = `DRAM_PATH1.sshot_err_reg;
   wire  [1:0]  	  dram_Ch1_que_err_cnt  	        = `DRAM_PATH1.que_err_cnt[17:16];
   wire  [31:0]  	  dram_Ch1_que_err_loc  	        = `DRAM_PATH1.que_err_loc;

   // NACK - for non existant register read
   wire          	  dram_Ch1_que_l2if_ack_vld	        = `DRAM_PATH1.que_l2if_ack_vld;
   wire          	  dram_Ch1_que_l2if_nack_vld	        = `DRAM_PATH1.que_l2if_nack_vld;

   wire          	  dram_Ch1_que_init_dram_done	= `DRAM_PATH1.que_init_dram_done;

//----------------------------------------------------------------------------------------
// Dram l2if interface
//----------------------------------------------------------------------------------------
   wire          	  dram_Ch1_sctag_dram_rd_req 	= `DRAM_L2IF1.sctag_dram_rd_req;
   wire  [2:0]   	  dram_Ch1_sctag_dram_rd_req_id 	= `DRAM_L2IF1.sctag_dram_rd_req_id;
   wire  [39:5]   	  dram_Ch1_sctag_dram_addr      	= `DRAM_L2IF1.sctag_dram_addr;
   wire          	  dram_Ch1_sctag_dram_rd_dummy_req 	= `DRAM_L2IF1.sctag_dram_rd_dummy_req;
   wire          	  dram_Ch1_dram_sctag_rd_ack       	= `DRAM_L2IF1.dram_sctag_rd_ack;
   wire          	  dram_Ch1_sctag_dram_wr_req 	= `DRAM_L2IF1.sctag_dram_wr_req;
   wire          	  dram_Ch1_sctag_dram_data_vld 	= `DRAM_L2IF1.sctag_dram_data_vld;
   wire  [63:0]  	  dram_Ch1_sctag_dram_wr_data 	= `DRAM_L2IF1.sctag_dram_wr_data;
   wire          	  dram_Ch1_dram_sctag_wr_ack       	= `DRAM_L2IF1.dram_sctag_wr_ack;
   wire          	  dram_Ch1_dram_sctag_data_vld     	= `DRAM_L2IF1.dram_sctag_data_vld;
   wire  [127:0] 	  dram_Ch1_dram_sctag_data         	= `DRAM_L2IF1.dram_sctag_data;
   wire  [2:0]   	  dram_Ch1_dram_sctag_rd_req_id    	= `DRAM_L2IF1.dram_sctag_rd_req_id;
   wire  [3:0]   	  dram_Ch1_l2if_b0_rd_val          	= `DRAM_L2IF1.l2if_b0_rd_val;
   wire  [3:0]   	  dram_Ch1_l2if_b1_rd_val          	= `DRAM_L2IF1.l2if_b1_rd_val;
   wire  [3:0]   	  dram_Ch1_l2if_b0_wr_val          	= `DRAM_L2IF1.l2if_b0_wr_val;
   wire  [3:0]   	  dram_Ch1_l2if_b1_wr_val          	= `DRAM_L2IF1.l2if_b1_wr_val;
   wire  [5:0]   	  dram_Ch1_l2if_wr_b0_data_addr      = `DRAM_L2IF1.l2if_wr_b0_data_addr;

   // Signals on L2 Interface that indicates Error
   wire          	  dram_Ch1_dram_sctag_secc_err       = `DRAM_L2IF1.dram_sctag_secc_err;
   wire          	  dram_Ch1_dram_sctag_pa_err         = `DRAM_L2IF1.dram_sctag_pa_err;
   wire          	  dram_Ch1_dram_sctag_mecc_err       = `DRAM_L2IF1.dram_sctag_mecc_err;
   wire          	  dram_Ch1_dram_sctag_scb_secc_err   = `DRAM_L2IF1.dram_sctag_scb_secc_err;
   wire          	  dram_Ch1_dram_sctag_scb_mecc_err   = `DRAM_L2IF1.dram_sctag_scb_mecc_err;

   // Error signal for update of error status, error location and error address register.
   //wire          	  dram_Ch1_l2if_scrb_val_d2          = `DRAM_L2IF1.l2if_scrb_val_d3;
   // l2if_scrb_data_val is now qualifying scrb in the rtl
   wire          	  dram_Ch1_l2if_scrb_val_d2          = `DRAM_L2IF1.l2if_scrb_data_val;
// qualified with vld since they can be on due to residual ( previous error )
   wire          	  dram_Ch1_l2if_secc_err             = `DRAM_L2IF1.l2if_secc_err && (`DRAM_L2IF1.dram_sctag_data_vld_d2 || `DRAM_L2IF1.l2if_scrb_data_val);
   wire          	  dram_Ch1_l2if_mecc_err_partial     = `DRAM_L2IF1.l2if_mecc_err_partial && (`DRAM_L2IF1.dram_sctag_data_vld_d2 || `DRAM_L2IF1.l2if_scrb_data_val);
   wire          	  dram_Ch1_l2if_pa_err               = `DRAM_L2IF1.l2if_pa_err && `DRAM_L2IF1.dram_sctag_data_vld_d2;
   wire  [6:0]   	  dram_Ch1_err_sts_reg               = `DRAM_L2IF1.err_sts_reg[22:16];
   wire          	  dram_Ch1_l2if_err_sts_reg_en6      = `DRAM_L2IF1.l2if_err_sts_reg_en6;
   wire          	  dram_Ch1_l2if_err_sts_reg_en5      = `DRAM_L2IF1.l2if_err_sts_reg_en5;
   wire          	  dram_Ch1_l2if_err_sts_reg_en4      = `DRAM_L2IF1.l2if_err_sts_reg_en4;
   wire          	  dram_Ch1_l2if_err_sts_reg_en3      = `DRAM_L2IF1.l2if_err_sts_reg_en3;
   wire          	  dram_Ch1_l2if_err_sts_reg_en2      = `DRAM_L2IF1.l2if_err_sts_reg_en2;
   wire          	  dram_Ch1_l2if_err_sts_reg_en1      = `DRAM_L2IF1.l2if_err_sts_reg_en1;
   wire          	  dram_Ch1_l2if_err_sts_reg_en0      = `DRAM_L2IF1.l2if_err_sts_reg_en0;
   wire          	  dram_Ch1_l2if_err_sts_reg_en       = `DRAM_L2IF1.l2if_err_sts_reg_en;
   wire          	  dram_Ch1_l2if_err_addr_reg_en      = `DRAM_L2IF1.l2if_err_addr_reg_en;
   wire          	  dram_Ch1_l2if_secc_loc_en          = `DRAM_L2IF1.l2if_secc_loc_en;

   wire  [3:0]   	  dram_Ch1_cpu_wr_addr               = `DRAM_L2IF1.dram_cpu_wr_addr;
   wire  [3:0]   	  dram_Ch1_cpu_wr_en                 = `DRAM_L2IF1.dram_cpu_wr_en;

   wire          	  dram_Ch1_clspine_dram_tx_sync 	= `DRAM_L2IF1.dram_dram_tx_sync;

// l2if wr entry valid ( for the actual data valid creation)
   wire  [7:0]            dram_Ch1_l2if_wr_entry             = {
                                                                  `DRAM_L2IF1.l2if_wr_entry7,
                                                                  `DRAM_L2IF1.l2if_wr_entry6,
                                                                  `DRAM_L2IF1.l2if_wr_entry5,
                                                                  `DRAM_L2IF1.l2if_wr_entry4,
                                                                  `DRAM_L2IF1.l2if_wr_entry3,
                                                                  `DRAM_L2IF1.l2if_wr_entry2,
                                                                  `DRAM_L2IF1.l2if_wr_entry1,
                                                                  `DRAM_L2IF1.l2if_wr_entry0
                                                                  };

// enabled for 8 deep FIFO that expects the first data to come back
   wire  [7:0]            dram_Ch1_l2if_data_ret_fifo_en     = {
                                                                  `DRAM_L2IF1.l2if_fifo_ent7_en,
                                                                  `DRAM_L2IF1.l2if_fifo_ent6_en,
                                                                  `DRAM_L2IF1.l2if_fifo_ent5_en,
                                                                  `DRAM_L2IF1.l2if_fifo_ent4_en,
                                                                  `DRAM_L2IF1.l2if_fifo_ent3_en,
                                                                  `DRAM_L2IF1.l2if_fifo_ent2_en,
                                                                  `DRAM_L2IF1.l2if_fifo_ent1_en,
                                                                  `DRAM_L2IF1.l2if_fifo_ent0_en
                                                                  };



  wire   [8:0]            dram_Ch1_rd_adr_info_hi		 = {
                                                                  `DRAM_L2IF1.l2if_addr_bank_low_sel,
                                                                  `DRAM_L2IF1.dram_rd_addr_gen_hi.addr_err,
                                                                  `DRAM_L2IF1.dram_rd_addr_gen_hi.stack_adr,
                                                                  `DRAM_L2IF1.dram_rd_addr_gen_hi.rank_adr,
                                                                  `DRAM_L2IF1.dram_rd_addr_gen_hi.bank_adr[2] && `DRAM_L2IF1.dram_rd_addr_gen_hi.eight_bank_mode,
                                                                  `DRAM_L2IF1.dram_rd_addr_gen_hi.bank_adr[1:0],
                                                                  `DRAM_L2IF1.dram_rd_addr_gen_hi.eight_bank_mode,
                                                                  `DRAM_L2IF1.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };
  wire   [8:0]            dram_Ch1_wr_adr_info_hi		 = {
                                                                  `DRAM_L2IF1.l2if_addr_bank_low_sel,
                                                                  `DRAM_L2IF1.dram_wr_addr_gen_hi.addr_err,
                                                                  `DRAM_L2IF1.dram_wr_addr_gen_hi.stack_adr,
                                                                  `DRAM_L2IF1.dram_wr_addr_gen_hi.rank_adr,
                                                                  `DRAM_L2IF1.dram_wr_addr_gen_hi.bank_adr[2] && `DRAM_L2IF1.dram_wr_addr_gen_hi.eight_bank_mode,
                                                                  `DRAM_L2IF1.dram_wr_addr_gen_hi.bank_adr[1:0],
                                                                  `DRAM_L2IF1.dram_wr_addr_gen_hi.eight_bank_mode,
                                                                  `DRAM_L2IF1.dram_wr_addr_gen_hi.two_channel_mode
                                                                  };
  wire   [8:0]            dram_Ch1_rd_adr_info_lo		 = {
                                                                  `DRAM_L2IF1.l2if_addr_bank_low_sel,
                                                                  `DRAM_L2IF1.dram_rd_addr_gen_lo.addr_err,
                                                                  `DRAM_L2IF1.dram_rd_addr_gen_lo.stack_adr,
                                                                  `DRAM_L2IF1.dram_rd_addr_gen_lo.rank_adr,
                                                                  `DRAM_L2IF1.dram_rd_addr_gen_lo.bank_adr[2] && `DRAM_L2IF1.dram_rd_addr_gen_lo.eight_bank_mode,
                                                                  `DRAM_L2IF1.dram_rd_addr_gen_lo.bank_adr[1:0],
                                                                  `DRAM_L2IF1.dram_rd_addr_gen_lo.eight_bank_mode,
                                                                  `DRAM_L2IF1.dram_rd_addr_gen_lo.two_channel_mode
                                                                  };
  wire   [8:0]            dram_Ch1_wr_adr_info_lo		 = {
                                                                  `DRAM_L2IF1.l2if_addr_bank_low_sel,
                                                                  `DRAM_L2IF1.dram_wr_addr_gen_lo.addr_err,
                                                                  `DRAM_L2IF1.dram_wr_addr_gen_lo.stack_adr,
                                                                  `DRAM_L2IF1.dram_wr_addr_gen_lo.rank_adr,
                                                                  `DRAM_L2IF1.dram_wr_addr_gen_lo.bank_adr[2] && `DRAM_L2IF1.dram_wr_addr_gen_lo.eight_bank_mode,
                                                                  `DRAM_L2IF1.dram_wr_addr_gen_lo.bank_adr[1:0],
                                                                  `DRAM_L2IF1.dram_wr_addr_gen_lo.eight_bank_mode,
                                                                  `DRAM_L2IF1.dram_wr_addr_gen_lo.two_channel_mode
                                                                  };
                                                                 

 
//----------------------------------------------------------------------------------------
// Dram DP 
//----------------------------------------------------------------------------------------
   wire  [3:0]            dram_Ch1_dp_pioson_l2_data          = `DRAM_DP1.dp_pioson_l2_data;
   wire  [1:0]            dram_Ch1_dp_pioson_l2_chunk         = `DRAM_DP1.dp_pioson_l2_chunk;

//----------------------------------------------------------------------------------------
// Performance counters
//----------------------------------------------------------------------------------------

   wire  [7:0]            dram_Ch1_perf_cntl          = `DRAM_PATH1.que_perf_cntl_reg;
   wire                   dram_Ch1_cnt0_sticky_bit    = `DRAM_PATH1.que_perf_cnt0_reg[31];
   wire                   dram_Ch1_cnt1_sticky_bit    = `DRAM_PATH1.que_perf_cnt1_reg[31];

//----------------------------------------------------------------------------------------
// for line coverage
//----------------------------------------------------------------------------------------
//   wire  [2:0] 		  dram_Ch1_que_wl_addr_cnt0 =  `DRAM_PATH1.que_wl_addr_cnt0;
//   wire  [2:0] 		  dram_Ch1_que_wl_addr_cnt1 =  `DRAM_PATH1.que_wl_addr_cnt1;
//   wire  [2:0] 		  dram_Ch1_que_wl_data_addr0_load_cas2 =  `DRAM_PATH1.que_wl_data_addr0_load_cas2;
//   wire  [2:0] 		  dram_Ch1_que_wl_data_addr0_load =  `DRAM_PATH1.que_wl_data_addr0_load;
//   wire  [2:0] 		  dram_Ch1_que_wl_data_addr1_load =  `DRAM_PATH1.que_wl_data_addr1_load;
//

//----------------------------------------------------------------------------------------
// RAS/CAS/CS/BANK for observing the target pattern of the x-action ( which CS/which BANK)
//----------------------------------------------------------------------------------------

   wire                   dram_Ch1_RAS_L          = `TOP_MOD_INST.DRAM1_RAS_L;
   wire                   dram_Ch1_CAS_L          = `TOP_MOD_INST.DRAM1_CAS_L;
   wire                   dram_Ch1_WE_L           = `TOP_MOD_INST.DRAM1_WE_L;
   wire  [2:0]            dram_Ch1_BA             = `TOP_MOD_INST.DRAM1_BA;
   wire  [3:0]            dram_Ch1_CS_L           = `TOP_MOD_INST.DRAM1_CS_L;
   wire  [14:0]           dram_Ch1_ADDR           = `TOP_MOD_INST.DRAM1_ADDR;

   // read que request 
   wire                   dram_Ch2_rd_req    = `DRAM_PATH2.que_rd_req;
   wire    [2:0]          dram_Ch2_rd_id     = `DRAM_PATH2.que_rd_id0;
   // read que
   wire  [39:0] 	  dram_Ch2_rd_q_0 	= {`DRAM_PATH2.readqbank0vld0, 
                                                   `DRAM_PATH2.readqbank0id0[2:0],
                                                   `DRAM_PATH2.readqbank0addr0[35:0]};
   wire  [39:0] 	  dram_Ch2_rd_q_1 	= {`DRAM_PATH2.readqbank0vld1,
                                                   `DRAM_PATH2.readqbank0id1[2:0],
                                                   `DRAM_PATH2.readqbank0addr1[35:0]};
   wire  [39:0] 	  dram_Ch2_rd_q_2 	= {`DRAM_PATH2.readqbank0vld2,
                                                   `DRAM_PATH2.readqbank0id2[2:0],
                                                   `DRAM_PATH2.readqbank0addr2[35:0]};
   wire  [39:0] 	  dram_Ch2_rd_q_3 	= {`DRAM_PATH2.readqbank0vld3,
                                                   `DRAM_PATH2.readqbank0id3[2:0],
                                                   `DRAM_PATH2.readqbank0addr3[35:0]};
   wire  [39:0] 	  dram_Ch2_rd_q_4 	= {`DRAM_PATH2.readqbank0vld4,
                                                   `DRAM_PATH2.readqbank0id4[2:0],
                                                   `DRAM_PATH2.readqbank0addr4[35:0]};
   wire  [39:0] 	  dram_Ch2_rd_q_5 	= {`DRAM_PATH2.readqbank0vld5,
                                                   `DRAM_PATH2.readqbank0id5[2:0],
                                                   `DRAM_PATH2.readqbank0addr5[35:0]};
   wire  [39:0] 	  dram_Ch2_rd_q_6 	= {`DRAM_PATH2.readqbank0vld6,
                                                   `DRAM_PATH2.readqbank0id6[2:0],
                                                   `DRAM_PATH2.readqbank0addr6[35:0]};
   wire  [39:0] 	  dram_Ch2_rd_q_7 	= {`DRAM_PATH2.readqbank0vld7,
                                                   `DRAM_PATH2.readqbank0id7[2:0],
                                                   `DRAM_PATH2.readqbank0addr7[35:0]};

   reg   [39:0]           dram_Ch2_rd_q[7:0];
   // read que collapsing fifo
   wire  [8:0]   	  dram_Ch2_rd_colps_q_0 	= {`DRAM_PATH2.que_b0_index_ent0[8:0]};
   wire  [8:0]   	  dram_Ch2_rd_colps_q_1 	= {`DRAM_PATH2.que_b0_index_ent1[8:0]};
   wire  [8:0]   	  dram_Ch2_rd_colps_q_2 	= {`DRAM_PATH2.que_b0_index_ent2[8:0]};
   wire  [8:0]   	  dram_Ch2_rd_colps_q_3 	= {`DRAM_PATH2.que_b0_index_ent3[8:0]};
   wire  [8:0]   	  dram_Ch2_rd_colps_q_4 	= {`DRAM_PATH2.que_b0_index_ent4[8:0]};
   wire  [8:0]   	  dram_Ch2_rd_colps_q_5 	= {`DRAM_PATH2.que_b0_index_ent5[8:0]};
   wire  [8:0]   	  dram_Ch2_rd_colps_q_6 	= {`DRAM_PATH2.que_b0_index_ent6[8:0]};
   wire  [8:0]   	  dram_Ch2_rd_colps_q_7 	= {`DRAM_PATH2.que_b0_index_ent7[8:0]};

   reg   [8:0]   	  dram_Ch2_rd_colps_q[7:0];

   // read que write pointer 
   wire  [7:0]   	  dram_Ch2_rd_que_wr_ptr 	= {`DRAM_PATH2.rqb0entry7wren,
                                                           `DRAM_PATH2.rqb0entry6wren,
                                                           `DRAM_PATH2.rqb0entry5wren,
                                                           `DRAM_PATH2.rqb0entry4wren,
                                                           `DRAM_PATH2.rqb0entry3wren,
                                                           `DRAM_PATH2.rqb0entry2wren,
                                                           `DRAM_PATH2.rqb0entry1wren,
                                                           `DRAM_PATH2.rqb0entry0wren};
   // read que read pointer 
   wire  [7:0]   	  dram_Ch2_rd_que_rd_ptr 	= {`DRAM_PATH2.readqbank0vld7reset,
                                                           `DRAM_PATH2.readqbank0vld6reset,
                                                           `DRAM_PATH2.readqbank0vld5reset,
                                                           `DRAM_PATH2.readqbank0vld4reset,
                                                           `DRAM_PATH2.readqbank0vld3reset,
                                                           `DRAM_PATH2.readqbank0vld2reset,
                                                           `DRAM_PATH2.readqbank0vld1reset,
                                                           `DRAM_PATH2.readqbank0vld0reset};

   // write que request 
   wire                   dram_Ch2_wr_req    = `DRAM_PATH2.que_wr_req;
   wire    [2:0]          dram_Ch2_wr_addr   = `DRAM_PATH2.que_cpu_wr_addr;
   // read que
   wire  [40:0] 	  dram_Ch2_wr_q_0 	= {`DRAM_PATH2.writeqbank0vld0,    
                                                   `DRAM_PATH2.writeqbank0vld0_arb,
                                                   `DRAM_PATH2.writeqaddr0[2:0],
                                                   `DRAM_PATH2.writeqbank0addr0[35:0]};
   wire  [40:0] 	  dram_Ch2_wr_q_1 	= {`DRAM_PATH2.writeqbank0vld1,
                                                   `DRAM_PATH2.writeqbank0vld1_arb,
                                                   `DRAM_PATH2.writeqaddr1[2:0],
                                                   `DRAM_PATH2.writeqbank0addr1[35:0]};
   wire  [40:0] 	  dram_Ch2_wr_q_2 	= {`DRAM_PATH2.writeqbank0vld2,
                                                   `DRAM_PATH2.writeqbank0vld2_arb,
                                                   `DRAM_PATH2.writeqaddr2[2:0],
                                                   `DRAM_PATH2.writeqbank0addr2[35:0]};
   wire  [40:0] 	  dram_Ch2_wr_q_3 	= {`DRAM_PATH2.writeqbank0vld3,
                                                   `DRAM_PATH2.writeqbank0vld3_arb,
                                                   `DRAM_PATH2.writeqaddr3[2:0],
                                                   `DRAM_PATH2.writeqbank0addr3[35:0]};
   wire  [40:0] 	  dram_Ch2_wr_q_4 	= {`DRAM_PATH2.writeqbank0vld4,
                                                   `DRAM_PATH2.writeqbank0vld4_arb,
                                                   `DRAM_PATH2.writeqaddr4[2:0],
                                                   `DRAM_PATH2.writeqbank0addr4[35:0]};
   wire  [40:0] 	  dram_Ch2_wr_q_5 	= {`DRAM_PATH2.writeqbank0vld5,
                                                   `DRAM_PATH2.writeqbank0vld5_arb,
                                                   `DRAM_PATH2.writeqaddr5[2:0],
                                                   `DRAM_PATH2.writeqbank0addr5[35:0]};
   wire  [40:0] 	  dram_Ch2_wr_q_6 	= {`DRAM_PATH2.writeqbank0vld6,
                                                   `DRAM_PATH2.writeqbank0vld6_arb,
                                                   `DRAM_PATH2.writeqaddr6[2:0],
                                                   `DRAM_PATH2.writeqbank0addr6[35:0]};
   wire  [40:0] 	  dram_Ch2_wr_q_7 	= {`DRAM_PATH2.writeqbank0vld7,
                                                   `DRAM_PATH2.writeqbank0vld7_arb,
                                                   `DRAM_PATH2.writeqaddr7[2:0],
                                                   `DRAM_PATH2.writeqbank0addr7[35:0]};
   reg   [40:0]           dram_Ch2_wr_q[7:0];

   // to not set valid for the fifo monitor
   wire                   dram_Ch2_pa_err   = `DRAM_L2IF2.l2if_split_wr_addr[32];

   // write que collapsing fifo
   wire  [8:0]   	  dram_Ch2_wr_colps_q_0 	= {`DRAM_PATH2.que_b0_wr_index_ent0[8:0]};
   wire  [8:0]   	  dram_Ch2_wr_colps_q_1 	= {`DRAM_PATH2.que_b0_wr_index_ent1[8:0]};
   wire  [8:0]   	  dram_Ch2_wr_colps_q_2 	= {`DRAM_PATH2.que_b0_wr_index_ent2[8:0]};
   wire  [8:0]   	  dram_Ch2_wr_colps_q_3 	= {`DRAM_PATH2.que_b0_wr_index_ent3[8:0]};
   wire  [8:0]   	  dram_Ch2_wr_colps_q_4 	= {`DRAM_PATH2.que_b0_wr_index_ent4[8:0]};
   wire  [8:0]   	  dram_Ch2_wr_colps_q_5 	= {`DRAM_PATH2.que_b0_wr_index_ent5[8:0]};
   wire  [8:0]   	  dram_Ch2_wr_colps_q_6 	= {`DRAM_PATH2.que_b0_wr_index_ent6[8:0]};
   wire  [8:0]   	  dram_Ch2_wr_colps_q_7 	= {`DRAM_PATH2.que_b0_wr_index_ent7[8:0]};

   reg   [8:0]   	  dram_Ch2_wr_colps_q[7:0];

   // write que write pointer 
   wire  [7:0]   	  dram_Ch2_wr_que_wr_ptr 	= {`DRAM_PATH2.wqb0entry7wren,
                                                           `DRAM_PATH2.wqb0entry6wren,
                                                           `DRAM_PATH2.wqb0entry5wren,
                                                           `DRAM_PATH2.wqb0entry4wren,
                                                           `DRAM_PATH2.wqb0entry3wren,
                                                           `DRAM_PATH2.wqb0entry2wren,
                                                           `DRAM_PATH2.wqb0entry1wren,
                                                           `DRAM_PATH2.wqb0entry0wren};
   // write que arb read pointer 
   wire  [7:0]   	  dram_Ch2_wr_que_rd_ptr_arb	= {`DRAM_PATH2.writeqbank0vld7reset_arb,
                                                           `DRAM_PATH2.writeqbank0vld6reset_arb,
                                                           `DRAM_PATH2.writeqbank0vld5reset_arb,
                                                           `DRAM_PATH2.writeqbank0vld4reset_arb,
                                                           `DRAM_PATH2.writeqbank0vld3reset_arb,
                                                           `DRAM_PATH2.writeqbank0vld2reset_arb,
                                                           `DRAM_PATH2.writeqbank0vld1reset_arb,
                                                           `DRAM_PATH2.writeqbank0vld0reset_arb};
   // write que data read pointer 
   wire  [7:0]   	  dram_Ch2_wr_que_rd_ptr 	= {`DRAM_PATH2.writeqbank0vld7reset,
                                                           `DRAM_PATH2.writeqbank0vld6reset,
                                                           `DRAM_PATH2.writeqbank0vld5reset,
                                                           `DRAM_PATH2.writeqbank0vld4reset,
                                                           `DRAM_PATH2.writeqbank0vld3reset,
                                                           `DRAM_PATH2.writeqbank0vld2reset,
                                                           `DRAM_PATH2.writeqbank0vld1reset,
                                                           `DRAM_PATH2.writeqbank0vld0reset};
   wire  [4:0]   	  dram_Ch2_que_mem_addr 	=  `DRAM_PATH2.que_mem_addr;

// These signals are currently not used in cov obj
// enable for 8 deep collps rd fifo
   wire  [7:0]            dram_Ch2_que_b0_index_en   = {`DRAM_PATH2.que_b0_index7_en,
                                                           `DRAM_PATH2.que_b0_index6_en,
                                                           `DRAM_PATH2.que_b0_index5_en,
                                                           `DRAM_PATH2.que_b0_index4_en,
                                                           `DRAM_PATH2.que_b0_index3_en,
                                                           `DRAM_PATH2.que_b0_index2_en,
                                                           `DRAM_PATH2.que_b0_index1_en,
                                                           `DRAM_PATH2.que_b0_index0_en};
// These signals are currently not used in cov obj
// enable for 8 deep collps wr fifo
   wire  [7:0]            dram_Ch2_que_b0_wr_index_en= {`DRAM_PATH2.que_b0_wr_index7_en,
                                                           `DRAM_PATH2.que_b0_wr_index6_en,
                                                           `DRAM_PATH2.que_b0_wr_index5_en,
                                                           `DRAM_PATH2.que_b0_wr_index4_en,
                                                           `DRAM_PATH2.que_b0_wr_index3_en,
                                                           `DRAM_PATH2.que_b0_wr_index2_en,
                                                           `DRAM_PATH2.que_b0_wr_index1_en,
                                                           `DRAM_PATH2.que_b0_wr_index0_en};

// These signals are currently not used in cov obj
// indicating that the rd is picked the moment it comes in, if to the same bank no req pend/no refresh
   wire  [7:0]            dram_Ch2_que_b0_rd_in_val  =  `DRAM_PATH2.que_b0_rd_in_val;

// indicates that the RAS is all ready to go (met the timing w.r.t. other req )
   wire  [7:0]            dram_Ch2_b_ras_pend_req    = {`DRAM_PATH2.b7_ras_pend_req,
                                                           `DRAM_PATH2.b6_ras_pend_req,
                                                           `DRAM_PATH2.b5_ras_pend_req,
                                                           `DRAM_PATH2.b4_ras_pend_req,
                                                           `DRAM_PATH2.b3_ras_pend_req,
                                                           `DRAM_PATH2.b2_ras_pend_req,
                                                           `DRAM_PATH2.b1_ras_pend_req,
                                                           `DRAM_PATH2.b0_ras_pend_req};
   wire  [7:0]            dram_Ch2_que_ras_picked    =  `DRAM_PATH2.que_ras_picked;

// indicates that the CAS is all ready to go (met the timing w.r.t. other req )
   wire  [7:0]            dram_Ch2_b_cas_pend_req    = {`DRAM_PATH2.b7_cas_pend_req,
                                                           `DRAM_PATH2.b6_cas_pend_req,
                                                           `DRAM_PATH2.b5_cas_pend_req,
                                                           `DRAM_PATH2.b4_cas_pend_req,
                                                           `DRAM_PATH2.b3_cas_pend_req,
                                                           `DRAM_PATH2.b2_cas_pend_req,
                                                           `DRAM_PATH2.b1_cas_pend_req,
                                                           `DRAM_PATH2.b0_cas_pend_req};
   wire  [7:0]            dram_Ch2_que_cas_picked    =  `DRAM_PATH2.que_cas_picked_d1;
// rd hits a wr in the wr Q
   wire                   dram_Ch2_que_rd_wr_hit     =  `DRAM_PATH2.que_b0_wr_index_pend;

// Signals that will be used to detect oldest entry to the same bank.
   // in 2 channel mode this is the real indicator that the request is picked from this channel
   wire                   dram_Ch2_que_this_ch_picked     =  (~`DRAM_PATH2.que_channel_disabled) ?
                           `DRAM_PATH2.que_ras_bank_picked_en && ~`DRAM_PATH2.que_channel_picked_internal:
                           `DRAM_PATH2.que_ras_bank_picked_en &&  `DRAM_PATH2.que_channel_picked_internal;
 
   wire  [2:0]            dram_Ch2_que_b0_index_picked        =  `DRAM_PATH2.que_b0_index_picked;
   wire                   dram_Ch2_que_b0_rd_picked           =  `DRAM_PATH2.que_b0_rd_picked;
   wire                   dram_Ch2_que_b0_wr_picked           =  `DRAM_PATH2.que_b0_wr_picked;
   wire                   dram_Ch2_que_b0_cmd_picked          =  `DRAM_PATH2.que_b0_cmd_picked;


//----------------------------------------------------------------------------------------
// Refresh to go and all CAS request to same CS are done, no new RAS issued.
//----------------------------------------------------------------------------------------
   wire  [4:0]   	  dram_Ch2_que_pos    	       = `DRAM_PATH2.que_int_pos;
   wire          	  dram_Ch2_que_ref_go 	       = `DRAM_PATH2.que_ref_go;
   wire          	  dram_Ch2_que_hw_selfrsh 	       = `DRAM_PATH2.que_hw_selfrsh;
   wire  [7:0]   	  dram_Ch2_que_cas_valid 	       = `DRAM_PATH2.que_cas_valid;
   wire  [1:0]   	  dram_Ch2_b0_phy_bank_bits 	       = `DRAM_PATH2.b0_phy_bank_bits;
   wire  [1:0]   	  dram_Ch2_b1_phy_bank_bits 	       = `DRAM_PATH2.b1_phy_bank_bits;
   wire  [1:0]   	  dram_Ch2_b2_phy_bank_bits 	       = `DRAM_PATH2.b2_phy_bank_bits;
   wire  [1:0]   	  dram_Ch2_b3_phy_bank_bits 	       = `DRAM_PATH2.b3_phy_bank_bits;
   wire  [1:0]   	  dram_Ch2_b4_phy_bank_bits 	       = `DRAM_PATH2.b4_phy_bank_bits;
   wire  [1:0]   	  dram_Ch2_b5_phy_bank_bits 	       = `DRAM_PATH2.b5_phy_bank_bits;
   wire  [1:0]   	  dram_Ch2_b6_phy_bank_bits 	       = `DRAM_PATH2.b6_phy_bank_bits;
   wire  [1:0]   	  dram_Ch2_b7_phy_bank_bits 	       = `DRAM_PATH2.b7_phy_bank_bits;
   reg   [1:0]   	  dram_Ch2_b_phy_bank_bits[7:0];

   wire  [1:0]   	  dram_Ch2_que_refresh_rank 	       = `DRAM_PATH2.que_refresh_rank;


//----------------------------------------------------------------------------------------
// Starvation counter causing the wr to have priority. 
//----------------------------------------------------------------------------------------
   wire  [7:0]   	  dram_Ch2_que_pick_wr_first 	= `DRAM_PATH2.que_pick_wr_first;

//----------------------------------------------------------------------------------------
// Scrub Related
//----------------------------------------------------------------------------------------
   // picking the que_split_scrb_addr as _que_scrb_addr_picked_
   wire  [35:0]   	  dram_Ch2_que_scrb_addr_picked 	= `DRAM_PATH2.que_split_scrb_addr;
   wire           	  dram_Ch2_que_scrb_picked 		= `DRAM_PATH2.que_scrb_picked;
   wire           	  dram_Ch2_que_scrb_rd_picked 	= `DRAM_PATH2.que_scrb_rd_picked;
   wire           	  dram_Ch2_que_ras_bank_picked_en 	= `DRAM_PATH2.que_ras_bank_picked_en;
   wire           	  dram_Ch2_que_scrb_write_req 	= `DRAM_PATH2.que_scrb_write_req;

// req valid and scrb valid, the scrb should be cleared first
   wire  [7:0]   	  dram_Ch2_que_l2req_valid 	=  `DRAM_PATH2.que_bank_l2req_valids | 
							   `DRAM_PATH2.ch1_que_l2req_valids;
   wire  [7:0]   	  dram_Ch2_scrb_indx_val   	=  `DRAM_PATH2.que_scrb_indx_val;

//----------------------------------------------------------------------------------------
// Dram Registers
//----------------------------------------------------------------------------------------
   wire  [8:0]   	  dram_Ch2_chip_config_reg 	        = `DRAM_PATH2.chip_config_reg[8:0];
   wire  [2:0]   	  dram_Ch2_mode_reg        	        = `DRAM_PATH2.mode_reg[6:4];
   wire  [3:0]   	  dram_Ch2_rrd_reg        	        = `DRAM_PATH2.rrd_reg;
   wire  [4:0]   	  dram_Ch2_rc_reg         	        = `DRAM_PATH2.rc_reg;
   wire  [3:0]   	  dram_Ch2_rcd_reg         	        = `DRAM_PATH2.rcd_reg;
   wire  [3:0]   	  dram_Ch2_wtr_dly_reg         	= `DRAM_PATH2.wtr_dly_reg;
   wire  [3:0]   	  dram_Ch2_rtw_dly_reg         	= `DRAM_PATH2.rtw_dly_reg;
   wire  [3:0]   	  dram_Ch2_rtp_reg         		= `DRAM_PATH2.rtp_reg;
   wire  [3:0]   	  dram_Ch2_ras_reg         		= `DRAM_PATH2.ras_reg;
   wire  [3:0]   	  dram_Ch2_rp_reg          		= `DRAM_PATH2.rp_reg;
   wire  [3:0]   	  dram_Ch2_wr_reg          		= `DRAM_PATH2.wr_reg;
   wire  [1:0]   	  dram_Ch2_mrd_reg          		= `DRAM_PATH2.mrd_reg;
   wire  [1:0]   	  dram_Ch2_iwtr_reg          	= `DRAM_PATH2.iwtr_reg;
   wire  [14:0]   	  dram_Ch2_ext_mode_reg2          	= `DRAM_PATH2.ext_mode_reg2;
   wire  [14:0]   	  dram_Ch2_ext_mode_reg1          	= `DRAM_PATH2.ext_mode_reg1;
   wire  [14:0]   	  dram_Ch2_ext_mode_reg3          	= `DRAM_PATH2.ext_mode_reg3;
   wire          	  dram_Ch2_que_eight_bank_mode       = `DRAM_PATH2.que_eight_bank_mode;
   wire          	  dram_Ch2_que_rank1_present         = `DRAM_PATH2.que_rank1_present;
   wire          	  dram_Ch2_que_channel_disabled      = `DRAM_PATH2.que_channel_disabled;
   wire          	  dram_Ch2_que_addr_bank_low_sel     = `DRAM_PATH2.que_addr_bank_low_sel;
   wire          	  dram_Ch2_que_init     		= `DRAM_PATH2.que_init;
   wire  [2:0]   	  dram_Ch2_que_data_del_cnt          = `DRAM_PATH2.que_data_del_cnt;
   wire          	  dram_Ch2_dram_io_pad_clk_inv       = `DRAM_PATH2.dram_io_pad_clk_inv;
   wire  [1:0]   	  dram_Ch2_dram_io_ptr_clk_inv       = `DRAM_PATH2.dram_io_ptr_clk_inv;
   wire          	  dram_Ch2_que_wr_mode_reg_done      = `DRAM_PATH2.que_wr_mode_reg_done;
   wire          	  dram_Ch2_que_init_status_reg       = `DRAM_PATH2.que_init_status_reg;
   wire  [3:0]   	  dram_Ch2_que_dimms_present         = `DRAM_PATH2.que_dimms_present;
   wire          	  dram_Ch2_dram_fail_over_mode       = `DRAM_PATH2.dram_fail_over_mode;
   wire  [31:0]  	  dram_Ch2_dram_fail_over_mask       = `DRAM_PATH2.dram_fail_over_mask;
   wire          	  dram_Ch2_que_dbg_trig_en	        = `DRAM_PATH2.que_dbg_trig_en;
   wire  [22:0]  	  dram_Ch2_que_err_sts_reg	        = `DRAM_PATH2.que_err_sts_reg;
   wire  [35:0]  	  dram_Ch2_que_err_addr_reg	        = `DRAM_PATH2.que_err_addr_reg;
   wire          	  dram_Ch2_err_inj_reg	        = `DRAM_PATH2.err_inj_reg;
   wire          	  dram_Ch2_sshot_err_reg	        = `DRAM_PATH2.sshot_err_reg;
   wire  [1:0]  	  dram_Ch2_que_err_cnt  	        = `DRAM_PATH2.que_err_cnt[17:16];
   wire  [31:0]  	  dram_Ch2_que_err_loc  	        = `DRAM_PATH2.que_err_loc;

   // NACK - for non existant register read
   wire          	  dram_Ch2_que_l2if_ack_vld	        = `DRAM_PATH2.que_l2if_ack_vld;
   wire          	  dram_Ch2_que_l2if_nack_vld	        = `DRAM_PATH2.que_l2if_nack_vld;

   wire          	  dram_Ch2_que_init_dram_done	= `DRAM_PATH2.que_init_dram_done;

//----------------------------------------------------------------------------------------
// Dram l2if interface
//----------------------------------------------------------------------------------------
   wire          	  dram_Ch2_sctag_dram_rd_req 	= `DRAM_L2IF2.sctag_dram_rd_req;
   wire  [2:0]   	  dram_Ch2_sctag_dram_rd_req_id 	= `DRAM_L2IF2.sctag_dram_rd_req_id;
   wire  [39:5]   	  dram_Ch2_sctag_dram_addr      	= `DRAM_L2IF2.sctag_dram_addr;
   wire          	  dram_Ch2_sctag_dram_rd_dummy_req 	= `DRAM_L2IF2.sctag_dram_rd_dummy_req;
   wire          	  dram_Ch2_dram_sctag_rd_ack       	= `DRAM_L2IF2.dram_sctag_rd_ack;
   wire          	  dram_Ch2_sctag_dram_wr_req 	= `DRAM_L2IF2.sctag_dram_wr_req;
   wire          	  dram_Ch2_sctag_dram_data_vld 	= `DRAM_L2IF2.sctag_dram_data_vld;
   wire  [63:0]  	  dram_Ch2_sctag_dram_wr_data 	= `DRAM_L2IF2.sctag_dram_wr_data;
   wire          	  dram_Ch2_dram_sctag_wr_ack       	= `DRAM_L2IF2.dram_sctag_wr_ack;
   wire          	  dram_Ch2_dram_sctag_data_vld     	= `DRAM_L2IF2.dram_sctag_data_vld;
   wire  [127:0] 	  dram_Ch2_dram_sctag_data         	= `DRAM_L2IF2.dram_sctag_data;
   wire  [2:0]   	  dram_Ch2_dram_sctag_rd_req_id    	= `DRAM_L2IF2.dram_sctag_rd_req_id;
   wire  [3:0]   	  dram_Ch2_l2if_b0_rd_val          	= `DRAM_L2IF2.l2if_b0_rd_val;
   wire  [3:0]   	  dram_Ch2_l2if_b1_rd_val          	= `DRAM_L2IF2.l2if_b1_rd_val;
   wire  [3:0]   	  dram_Ch2_l2if_b0_wr_val          	= `DRAM_L2IF2.l2if_b0_wr_val;
   wire  [3:0]   	  dram_Ch2_l2if_b1_wr_val          	= `DRAM_L2IF2.l2if_b1_wr_val;
   wire  [5:0]   	  dram_Ch2_l2if_wr_b0_data_addr      = `DRAM_L2IF2.l2if_wr_b0_data_addr;

   // Signals on L2 Interface that indicates Error
   wire          	  dram_Ch2_dram_sctag_secc_err       = `DRAM_L2IF2.dram_sctag_secc_err;
   wire          	  dram_Ch2_dram_sctag_pa_err         = `DRAM_L2IF2.dram_sctag_pa_err;
   wire          	  dram_Ch2_dram_sctag_mecc_err       = `DRAM_L2IF2.dram_sctag_mecc_err;
   wire          	  dram_Ch2_dram_sctag_scb_secc_err   = `DRAM_L2IF2.dram_sctag_scb_secc_err;
   wire          	  dram_Ch2_dram_sctag_scb_mecc_err   = `DRAM_L2IF2.dram_sctag_scb_mecc_err;

   // Error signal for update of error status, error location and error address register.
   //wire          	  dram_Ch2_l2if_scrb_val_d2          = `DRAM_L2IF2.l2if_scrb_val_d3;
   // l2if_scrb_data_val is now qualifying scrb in the rtl
   wire          	  dram_Ch2_l2if_scrb_val_d2          = `DRAM_L2IF2.l2if_scrb_data_val;
// qualified with vld since they can be on due to residual ( previous error )
   wire          	  dram_Ch2_l2if_secc_err             = `DRAM_L2IF2.l2if_secc_err && (`DRAM_L2IF2.dram_sctag_data_vld_d2 || `DRAM_L2IF2.l2if_scrb_data_val);
   wire          	  dram_Ch2_l2if_mecc_err_partial     = `DRAM_L2IF2.l2if_mecc_err_partial && (`DRAM_L2IF2.dram_sctag_data_vld_d2 || `DRAM_L2IF2.l2if_scrb_data_val);
   wire          	  dram_Ch2_l2if_pa_err               = `DRAM_L2IF2.l2if_pa_err && `DRAM_L2IF2.dram_sctag_data_vld_d2;
   wire  [6:0]   	  dram_Ch2_err_sts_reg               = `DRAM_L2IF2.err_sts_reg[22:16];
   wire          	  dram_Ch2_l2if_err_sts_reg_en6      = `DRAM_L2IF2.l2if_err_sts_reg_en6;
   wire          	  dram_Ch2_l2if_err_sts_reg_en5      = `DRAM_L2IF2.l2if_err_sts_reg_en5;
   wire          	  dram_Ch2_l2if_err_sts_reg_en4      = `DRAM_L2IF2.l2if_err_sts_reg_en4;
   wire          	  dram_Ch2_l2if_err_sts_reg_en3      = `DRAM_L2IF2.l2if_err_sts_reg_en3;
   wire          	  dram_Ch2_l2if_err_sts_reg_en2      = `DRAM_L2IF2.l2if_err_sts_reg_en2;
   wire          	  dram_Ch2_l2if_err_sts_reg_en1      = `DRAM_L2IF2.l2if_err_sts_reg_en1;
   wire          	  dram_Ch2_l2if_err_sts_reg_en0      = `DRAM_L2IF2.l2if_err_sts_reg_en0;
   wire          	  dram_Ch2_l2if_err_sts_reg_en       = `DRAM_L2IF2.l2if_err_sts_reg_en;
   wire          	  dram_Ch2_l2if_err_addr_reg_en      = `DRAM_L2IF2.l2if_err_addr_reg_en;
   wire          	  dram_Ch2_l2if_secc_loc_en          = `DRAM_L2IF2.l2if_secc_loc_en;

   wire  [3:0]   	  dram_Ch2_cpu_wr_addr               = `DRAM_L2IF2.dram_cpu_wr_addr;
   wire  [3:0]   	  dram_Ch2_cpu_wr_en                 = `DRAM_L2IF2.dram_cpu_wr_en;

   wire          	  dram_Ch2_clspine_dram_tx_sync 	= `DRAM_L2IF2.dram_dram_tx_sync;

// l2if wr entry valid ( for the actual data valid creation)
   wire  [7:0]            dram_Ch2_l2if_wr_entry             = {
                                                                  `DRAM_L2IF2.l2if_wr_entry7,
                                                                  `DRAM_L2IF2.l2if_wr_entry6,
                                                                  `DRAM_L2IF2.l2if_wr_entry5,
                                                                  `DRAM_L2IF2.l2if_wr_entry4,
                                                                  `DRAM_L2IF2.l2if_wr_entry3,
                                                                  `DRAM_L2IF2.l2if_wr_entry2,
                                                                  `DRAM_L2IF2.l2if_wr_entry1,
                                                                  `DRAM_L2IF2.l2if_wr_entry0
                                                                  };

// enabled for 8 deep FIFO that expects the first data to come back
   wire  [7:0]            dram_Ch2_l2if_data_ret_fifo_en     = {
                                                                  `DRAM_L2IF2.l2if_fifo_ent7_en,
                                                                  `DRAM_L2IF2.l2if_fifo_ent6_en,
                                                                  `DRAM_L2IF2.l2if_fifo_ent5_en,
                                                                  `DRAM_L2IF2.l2if_fifo_ent4_en,
                                                                  `DRAM_L2IF2.l2if_fifo_ent3_en,
                                                                  `DRAM_L2IF2.l2if_fifo_ent2_en,
                                                                  `DRAM_L2IF2.l2if_fifo_ent1_en,
                                                                  `DRAM_L2IF2.l2if_fifo_ent0_en
                                                                  };



  wire   [8:0]            dram_Ch2_rd_adr_info_hi		 = {
                                                                  `DRAM_L2IF2.l2if_addr_bank_low_sel,
                                                                  `DRAM_L2IF2.dram_rd_addr_gen_hi.addr_err,
                                                                  `DRAM_L2IF2.dram_rd_addr_gen_hi.stack_adr,
                                                                  `DRAM_L2IF2.dram_rd_addr_gen_hi.rank_adr,
                                                                  `DRAM_L2IF2.dram_rd_addr_gen_hi.bank_adr[2] && `DRAM_L2IF2.dram_rd_addr_gen_hi.eight_bank_mode,
                                                                  `DRAM_L2IF2.dram_rd_addr_gen_hi.bank_adr[1:0],
                                                                  `DRAM_L2IF2.dram_rd_addr_gen_hi.eight_bank_mode,
                                                                  `DRAM_L2IF2.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };
  wire   [8:0]            dram_Ch2_wr_adr_info_hi		 = {
                                                                  `DRAM_L2IF2.l2if_addr_bank_low_sel,
                                                                  `DRAM_L2IF2.dram_wr_addr_gen_hi.addr_err,
                                                                  `DRAM_L2IF2.dram_wr_addr_gen_hi.stack_adr,
                                                                  `DRAM_L2IF2.dram_wr_addr_gen_hi.rank_adr,
                                                                  `DRAM_L2IF2.dram_wr_addr_gen_hi.bank_adr[2] && `DRAM_L2IF2.dram_wr_addr_gen_hi.eight_bank_mode,
                                                                  `DRAM_L2IF2.dram_wr_addr_gen_hi.bank_adr[1:0],
                                                                  `DRAM_L2IF2.dram_wr_addr_gen_hi.eight_bank_mode,
                                                                  `DRAM_L2IF2.dram_wr_addr_gen_hi.two_channel_mode
                                                                  };
  wire   [8:0]            dram_Ch2_rd_adr_info_lo		 = {
                                                                  `DRAM_L2IF2.l2if_addr_bank_low_sel,
                                                                  `DRAM_L2IF2.dram_rd_addr_gen_lo.addr_err,
                                                                  `DRAM_L2IF2.dram_rd_addr_gen_lo.stack_adr,
                                                                  `DRAM_L2IF2.dram_rd_addr_gen_lo.rank_adr,
                                                                  `DRAM_L2IF2.dram_rd_addr_gen_lo.bank_adr[2] && `DRAM_L2IF2.dram_rd_addr_gen_lo.eight_bank_mode,
                                                                  `DRAM_L2IF2.dram_rd_addr_gen_lo.bank_adr[1:0],
                                                                  `DRAM_L2IF2.dram_rd_addr_gen_lo.eight_bank_mode,
                                                                  `DRAM_L2IF2.dram_rd_addr_gen_lo.two_channel_mode
                                                                  };
  wire   [8:0]            dram_Ch2_wr_adr_info_lo		 = {
                                                                  `DRAM_L2IF2.l2if_addr_bank_low_sel,
                                                                  `DRAM_L2IF2.dram_wr_addr_gen_lo.addr_err,
                                                                  `DRAM_L2IF2.dram_wr_addr_gen_lo.stack_adr,
                                                                  `DRAM_L2IF2.dram_wr_addr_gen_lo.rank_adr,
                                                                  `DRAM_L2IF2.dram_wr_addr_gen_lo.bank_adr[2] && `DRAM_L2IF2.dram_wr_addr_gen_lo.eight_bank_mode,
                                                                  `DRAM_L2IF2.dram_wr_addr_gen_lo.bank_adr[1:0],
                                                                  `DRAM_L2IF2.dram_wr_addr_gen_lo.eight_bank_mode,
                                                                  `DRAM_L2IF2.dram_wr_addr_gen_lo.two_channel_mode
                                                                  };
                                                                 

 
//----------------------------------------------------------------------------------------
// Dram DP 
//----------------------------------------------------------------------------------------
   wire  [3:0]            dram_Ch2_dp_pioson_l2_data          = `DRAM_DP2.dp_pioson_l2_data;
   wire  [1:0]            dram_Ch2_dp_pioson_l2_chunk         = `DRAM_DP2.dp_pioson_l2_chunk;

//----------------------------------------------------------------------------------------
// Performance counters
//----------------------------------------------------------------------------------------

   wire  [7:0]            dram_Ch2_perf_cntl          = `DRAM_PATH2.que_perf_cntl_reg;
   wire                   dram_Ch2_cnt0_sticky_bit    = `DRAM_PATH2.que_perf_cnt0_reg[31];
   wire                   dram_Ch2_cnt1_sticky_bit    = `DRAM_PATH2.que_perf_cnt1_reg[31];

//----------------------------------------------------------------------------------------
// for line coverage
//----------------------------------------------------------------------------------------
//   wire  [2:0] 		  dram_Ch2_que_wl_addr_cnt0 =  `DRAM_PATH2.que_wl_addr_cnt0;
//   wire  [2:0] 		  dram_Ch2_que_wl_addr_cnt1 =  `DRAM_PATH2.que_wl_addr_cnt1;
//   wire  [2:0] 		  dram_Ch2_que_wl_data_addr0_load_cas2 =  `DRAM_PATH2.que_wl_data_addr0_load_cas2;
//   wire  [2:0] 		  dram_Ch2_que_wl_data_addr0_load =  `DRAM_PATH2.que_wl_data_addr0_load;
//   wire  [2:0] 		  dram_Ch2_que_wl_data_addr1_load =  `DRAM_PATH2.que_wl_data_addr1_load;
//

//----------------------------------------------------------------------------------------
// RAS/CAS/CS/BANK for observing the target pattern of the x-action ( which CS/which BANK)
//----------------------------------------------------------------------------------------

   wire                   dram_Ch2_RAS_L          = `TOP_MOD_INST.DRAM2_RAS_L;
   wire                   dram_Ch2_CAS_L          = `TOP_MOD_INST.DRAM2_CAS_L;
   wire                   dram_Ch2_WE_L           = `TOP_MOD_INST.DRAM2_WE_L;
   wire  [2:0]            dram_Ch2_BA             = `TOP_MOD_INST.DRAM2_BA;
   wire  [3:0]            dram_Ch2_CS_L           = `TOP_MOD_INST.DRAM2_CS_L;
   wire  [14:0]           dram_Ch2_ADDR           = `TOP_MOD_INST.DRAM2_ADDR;

   // read que request 
   wire                   dram_Ch3_rd_req    = `DRAM_PATH3.que_rd_req;
   wire    [2:0]          dram_Ch3_rd_id     = `DRAM_PATH3.que_rd_id0;
   // read que
   wire  [39:0] 	  dram_Ch3_rd_q_0 	= {`DRAM_PATH3.readqbank0vld0, 
                                                   `DRAM_PATH3.readqbank0id0[2:0],
                                                   `DRAM_PATH3.readqbank0addr0[35:0]};
   wire  [39:0] 	  dram_Ch3_rd_q_1 	= {`DRAM_PATH3.readqbank0vld1,
                                                   `DRAM_PATH3.readqbank0id1[2:0],
                                                   `DRAM_PATH3.readqbank0addr1[35:0]};
   wire  [39:0] 	  dram_Ch3_rd_q_2 	= {`DRAM_PATH3.readqbank0vld2,
                                                   `DRAM_PATH3.readqbank0id2[2:0],
                                                   `DRAM_PATH3.readqbank0addr2[35:0]};
   wire  [39:0] 	  dram_Ch3_rd_q_3 	= {`DRAM_PATH3.readqbank0vld3,
                                                   `DRAM_PATH3.readqbank0id3[2:0],
                                                   `DRAM_PATH3.readqbank0addr3[35:0]};
   wire  [39:0] 	  dram_Ch3_rd_q_4 	= {`DRAM_PATH3.readqbank0vld4,
                                                   `DRAM_PATH3.readqbank0id4[2:0],
                                                   `DRAM_PATH3.readqbank0addr4[35:0]};
   wire  [39:0] 	  dram_Ch3_rd_q_5 	= {`DRAM_PATH3.readqbank0vld5,
                                                   `DRAM_PATH3.readqbank0id5[2:0],
                                                   `DRAM_PATH3.readqbank0addr5[35:0]};
   wire  [39:0] 	  dram_Ch3_rd_q_6 	= {`DRAM_PATH3.readqbank0vld6,
                                                   `DRAM_PATH3.readqbank0id6[2:0],
                                                   `DRAM_PATH3.readqbank0addr6[35:0]};
   wire  [39:0] 	  dram_Ch3_rd_q_7 	= {`DRAM_PATH3.readqbank0vld7,
                                                   `DRAM_PATH3.readqbank0id7[2:0],
                                                   `DRAM_PATH3.readqbank0addr7[35:0]};

   reg   [39:0]           dram_Ch3_rd_q[7:0];
   // read que collapsing fifo
   wire  [8:0]   	  dram_Ch3_rd_colps_q_0 	= {`DRAM_PATH3.que_b0_index_ent0[8:0]};
   wire  [8:0]   	  dram_Ch3_rd_colps_q_1 	= {`DRAM_PATH3.que_b0_index_ent1[8:0]};
   wire  [8:0]   	  dram_Ch3_rd_colps_q_2 	= {`DRAM_PATH3.que_b0_index_ent2[8:0]};
   wire  [8:0]   	  dram_Ch3_rd_colps_q_3 	= {`DRAM_PATH3.que_b0_index_ent3[8:0]};
   wire  [8:0]   	  dram_Ch3_rd_colps_q_4 	= {`DRAM_PATH3.que_b0_index_ent4[8:0]};
   wire  [8:0]   	  dram_Ch3_rd_colps_q_5 	= {`DRAM_PATH3.que_b0_index_ent5[8:0]};
   wire  [8:0]   	  dram_Ch3_rd_colps_q_6 	= {`DRAM_PATH3.que_b0_index_ent6[8:0]};
   wire  [8:0]   	  dram_Ch3_rd_colps_q_7 	= {`DRAM_PATH3.que_b0_index_ent7[8:0]};

   reg   [8:0]   	  dram_Ch3_rd_colps_q[7:0];

   // read que write pointer 
   wire  [7:0]   	  dram_Ch3_rd_que_wr_ptr 	= {`DRAM_PATH3.rqb0entry7wren,
                                                           `DRAM_PATH3.rqb0entry6wren,
                                                           `DRAM_PATH3.rqb0entry5wren,
                                                           `DRAM_PATH3.rqb0entry4wren,
                                                           `DRAM_PATH3.rqb0entry3wren,
                                                           `DRAM_PATH3.rqb0entry2wren,
                                                           `DRAM_PATH3.rqb0entry1wren,
                                                           `DRAM_PATH3.rqb0entry0wren};
   // read que read pointer 
   wire  [7:0]   	  dram_Ch3_rd_que_rd_ptr 	= {`DRAM_PATH3.readqbank0vld7reset,
                                                           `DRAM_PATH3.readqbank0vld6reset,
                                                           `DRAM_PATH3.readqbank0vld5reset,
                                                           `DRAM_PATH3.readqbank0vld4reset,
                                                           `DRAM_PATH3.readqbank0vld3reset,
                                                           `DRAM_PATH3.readqbank0vld2reset,
                                                           `DRAM_PATH3.readqbank0vld1reset,
                                                           `DRAM_PATH3.readqbank0vld0reset};

   // write que request 
   wire                   dram_Ch3_wr_req    = `DRAM_PATH3.que_wr_req;
   wire    [2:0]          dram_Ch3_wr_addr   = `DRAM_PATH3.que_cpu_wr_addr;
   // read que
   wire  [40:0] 	  dram_Ch3_wr_q_0 	= {`DRAM_PATH3.writeqbank0vld0,    
                                                   `DRAM_PATH3.writeqbank0vld0_arb,
                                                   `DRAM_PATH3.writeqaddr0[2:0],
                                                   `DRAM_PATH3.writeqbank0addr0[35:0]};
   wire  [40:0] 	  dram_Ch3_wr_q_1 	= {`DRAM_PATH3.writeqbank0vld1,
                                                   `DRAM_PATH3.writeqbank0vld1_arb,
                                                   `DRAM_PATH3.writeqaddr1[2:0],
                                                   `DRAM_PATH3.writeqbank0addr1[35:0]};
   wire  [40:0] 	  dram_Ch3_wr_q_2 	= {`DRAM_PATH3.writeqbank0vld2,
                                                   `DRAM_PATH3.writeqbank0vld2_arb,
                                                   `DRAM_PATH3.writeqaddr2[2:0],
                                                   `DRAM_PATH3.writeqbank0addr2[35:0]};
   wire  [40:0] 	  dram_Ch3_wr_q_3 	= {`DRAM_PATH3.writeqbank0vld3,
                                                   `DRAM_PATH3.writeqbank0vld3_arb,
                                                   `DRAM_PATH3.writeqaddr3[2:0],
                                                   `DRAM_PATH3.writeqbank0addr3[35:0]};
   wire  [40:0] 	  dram_Ch3_wr_q_4 	= {`DRAM_PATH3.writeqbank0vld4,
                                                   `DRAM_PATH3.writeqbank0vld4_arb,
                                                   `DRAM_PATH3.writeqaddr4[2:0],
                                                   `DRAM_PATH3.writeqbank0addr4[35:0]};
   wire  [40:0] 	  dram_Ch3_wr_q_5 	= {`DRAM_PATH3.writeqbank0vld5,
                                                   `DRAM_PATH3.writeqbank0vld5_arb,
                                                   `DRAM_PATH3.writeqaddr5[2:0],
                                                   `DRAM_PATH3.writeqbank0addr5[35:0]};
   wire  [40:0] 	  dram_Ch3_wr_q_6 	= {`DRAM_PATH3.writeqbank0vld6,
                                                   `DRAM_PATH3.writeqbank0vld6_arb,
                                                   `DRAM_PATH3.writeqaddr6[2:0],
                                                   `DRAM_PATH3.writeqbank0addr6[35:0]};
   wire  [40:0] 	  dram_Ch3_wr_q_7 	= {`DRAM_PATH3.writeqbank0vld7,
                                                   `DRAM_PATH3.writeqbank0vld7_arb,
                                                   `DRAM_PATH3.writeqaddr7[2:0],
                                                   `DRAM_PATH3.writeqbank0addr7[35:0]};
   reg   [40:0]           dram_Ch3_wr_q[7:0];

   // to not set valid for the fifo monitor
   wire                   dram_Ch3_pa_err   = `DRAM_L2IF3.l2if_split_wr_addr[32];

   // write que collapsing fifo
   wire  [8:0]   	  dram_Ch3_wr_colps_q_0 	= {`DRAM_PATH3.que_b0_wr_index_ent0[8:0]};
   wire  [8:0]   	  dram_Ch3_wr_colps_q_1 	= {`DRAM_PATH3.que_b0_wr_index_ent1[8:0]};
   wire  [8:0]   	  dram_Ch3_wr_colps_q_2 	= {`DRAM_PATH3.que_b0_wr_index_ent2[8:0]};
   wire  [8:0]   	  dram_Ch3_wr_colps_q_3 	= {`DRAM_PATH3.que_b0_wr_index_ent3[8:0]};
   wire  [8:0]   	  dram_Ch3_wr_colps_q_4 	= {`DRAM_PATH3.que_b0_wr_index_ent4[8:0]};
   wire  [8:0]   	  dram_Ch3_wr_colps_q_5 	= {`DRAM_PATH3.que_b0_wr_index_ent5[8:0]};
   wire  [8:0]   	  dram_Ch3_wr_colps_q_6 	= {`DRAM_PATH3.que_b0_wr_index_ent6[8:0]};
   wire  [8:0]   	  dram_Ch3_wr_colps_q_7 	= {`DRAM_PATH3.que_b0_wr_index_ent7[8:0]};

   reg   [8:0]   	  dram_Ch3_wr_colps_q[7:0];

   // write que write pointer 
   wire  [7:0]   	  dram_Ch3_wr_que_wr_ptr 	= {`DRAM_PATH3.wqb0entry7wren,
                                                           `DRAM_PATH3.wqb0entry6wren,
                                                           `DRAM_PATH3.wqb0entry5wren,
                                                           `DRAM_PATH3.wqb0entry4wren,
                                                           `DRAM_PATH3.wqb0entry3wren,
                                                           `DRAM_PATH3.wqb0entry2wren,
                                                           `DRAM_PATH3.wqb0entry1wren,
                                                           `DRAM_PATH3.wqb0entry0wren};
   // write que arb read pointer 
   wire  [7:0]   	  dram_Ch3_wr_que_rd_ptr_arb	= {`DRAM_PATH3.writeqbank0vld7reset_arb,
                                                           `DRAM_PATH3.writeqbank0vld6reset_arb,
                                                           `DRAM_PATH3.writeqbank0vld5reset_arb,
                                                           `DRAM_PATH3.writeqbank0vld4reset_arb,
                                                           `DRAM_PATH3.writeqbank0vld3reset_arb,
                                                           `DRAM_PATH3.writeqbank0vld2reset_arb,
                                                           `DRAM_PATH3.writeqbank0vld1reset_arb,
                                                           `DRAM_PATH3.writeqbank0vld0reset_arb};
   // write que data read pointer 
   wire  [7:0]   	  dram_Ch3_wr_que_rd_ptr 	= {`DRAM_PATH3.writeqbank0vld7reset,
                                                           `DRAM_PATH3.writeqbank0vld6reset,
                                                           `DRAM_PATH3.writeqbank0vld5reset,
                                                           `DRAM_PATH3.writeqbank0vld4reset,
                                                           `DRAM_PATH3.writeqbank0vld3reset,
                                                           `DRAM_PATH3.writeqbank0vld2reset,
                                                           `DRAM_PATH3.writeqbank0vld1reset,
                                                           `DRAM_PATH3.writeqbank0vld0reset};
   wire  [4:0]   	  dram_Ch3_que_mem_addr 	=  `DRAM_PATH3.que_mem_addr;

// These signals are currently not used in cov obj
// enable for 8 deep collps rd fifo
   wire  [7:0]            dram_Ch3_que_b0_index_en   = {`DRAM_PATH3.que_b0_index7_en,
                                                           `DRAM_PATH3.que_b0_index6_en,
                                                           `DRAM_PATH3.que_b0_index5_en,
                                                           `DRAM_PATH3.que_b0_index4_en,
                                                           `DRAM_PATH3.que_b0_index3_en,
                                                           `DRAM_PATH3.que_b0_index2_en,
                                                           `DRAM_PATH3.que_b0_index1_en,
                                                           `DRAM_PATH3.que_b0_index0_en};
// These signals are currently not used in cov obj
// enable for 8 deep collps wr fifo
   wire  [7:0]            dram_Ch3_que_b0_wr_index_en= {`DRAM_PATH3.que_b0_wr_index7_en,
                                                           `DRAM_PATH3.que_b0_wr_index6_en,
                                                           `DRAM_PATH3.que_b0_wr_index5_en,
                                                           `DRAM_PATH3.que_b0_wr_index4_en,
                                                           `DRAM_PATH3.que_b0_wr_index3_en,
                                                           `DRAM_PATH3.que_b0_wr_index2_en,
                                                           `DRAM_PATH3.que_b0_wr_index1_en,
                                                           `DRAM_PATH3.que_b0_wr_index0_en};

// These signals are currently not used in cov obj
// indicating that the rd is picked the moment it comes in, if to the same bank no req pend/no refresh
   wire  [7:0]            dram_Ch3_que_b0_rd_in_val  =  `DRAM_PATH3.que_b0_rd_in_val;

// indicates that the RAS is all ready to go (met the timing w.r.t. other req )
   wire  [7:0]            dram_Ch3_b_ras_pend_req    = {`DRAM_PATH3.b7_ras_pend_req,
                                                           `DRAM_PATH3.b6_ras_pend_req,
                                                           `DRAM_PATH3.b5_ras_pend_req,
                                                           `DRAM_PATH3.b4_ras_pend_req,
                                                           `DRAM_PATH3.b3_ras_pend_req,
                                                           `DRAM_PATH3.b2_ras_pend_req,
                                                           `DRAM_PATH3.b1_ras_pend_req,
                                                           `DRAM_PATH3.b0_ras_pend_req};
   wire  [7:0]            dram_Ch3_que_ras_picked    =  `DRAM_PATH3.que_ras_picked;

// indicates that the CAS is all ready to go (met the timing w.r.t. other req )
   wire  [7:0]            dram_Ch3_b_cas_pend_req    = {`DRAM_PATH3.b7_cas_pend_req,
                                                           `DRAM_PATH3.b6_cas_pend_req,
                                                           `DRAM_PATH3.b5_cas_pend_req,
                                                           `DRAM_PATH3.b4_cas_pend_req,
                                                           `DRAM_PATH3.b3_cas_pend_req,
                                                           `DRAM_PATH3.b2_cas_pend_req,
                                                           `DRAM_PATH3.b1_cas_pend_req,
                                                           `DRAM_PATH3.b0_cas_pend_req};
   wire  [7:0]            dram_Ch3_que_cas_picked    =  `DRAM_PATH3.que_cas_picked_d1;
// rd hits a wr in the wr Q
   wire                   dram_Ch3_que_rd_wr_hit     =  `DRAM_PATH3.que_b0_wr_index_pend;

// Signals that will be used to detect oldest entry to the same bank.
   // in 2 channel mode this is the real indicator that the request is picked from this channel
   wire                   dram_Ch3_que_this_ch_picked     =  (~`DRAM_PATH3.que_channel_disabled) ?
                           `DRAM_PATH3.que_ras_bank_picked_en && ~`DRAM_PATH3.que_channel_picked_internal:
                           `DRAM_PATH3.que_ras_bank_picked_en &&  `DRAM_PATH3.que_channel_picked_internal;
 
   wire  [2:0]            dram_Ch3_que_b0_index_picked        =  `DRAM_PATH3.que_b0_index_picked;
   wire                   dram_Ch3_que_b0_rd_picked           =  `DRAM_PATH3.que_b0_rd_picked;
   wire                   dram_Ch3_que_b0_wr_picked           =  `DRAM_PATH3.que_b0_wr_picked;
   wire                   dram_Ch3_que_b0_cmd_picked          =  `DRAM_PATH3.que_b0_cmd_picked;


//----------------------------------------------------------------------------------------
// Refresh to go and all CAS request to same CS are done, no new RAS issued.
//----------------------------------------------------------------------------------------
   wire  [4:0]   	  dram_Ch3_que_pos    	       = `DRAM_PATH3.que_int_pos;
   wire          	  dram_Ch3_que_ref_go 	       = `DRAM_PATH3.que_ref_go;
   wire          	  dram_Ch3_que_hw_selfrsh 	       = `DRAM_PATH3.que_hw_selfrsh;
   wire  [7:0]   	  dram_Ch3_que_cas_valid 	       = `DRAM_PATH3.que_cas_valid;
   wire  [1:0]   	  dram_Ch3_b0_phy_bank_bits 	       = `DRAM_PATH3.b0_phy_bank_bits;
   wire  [1:0]   	  dram_Ch3_b1_phy_bank_bits 	       = `DRAM_PATH3.b1_phy_bank_bits;
   wire  [1:0]   	  dram_Ch3_b2_phy_bank_bits 	       = `DRAM_PATH3.b2_phy_bank_bits;
   wire  [1:0]   	  dram_Ch3_b3_phy_bank_bits 	       = `DRAM_PATH3.b3_phy_bank_bits;
   wire  [1:0]   	  dram_Ch3_b4_phy_bank_bits 	       = `DRAM_PATH3.b4_phy_bank_bits;
   wire  [1:0]   	  dram_Ch3_b5_phy_bank_bits 	       = `DRAM_PATH3.b5_phy_bank_bits;
   wire  [1:0]   	  dram_Ch3_b6_phy_bank_bits 	       = `DRAM_PATH3.b6_phy_bank_bits;
   wire  [1:0]   	  dram_Ch3_b7_phy_bank_bits 	       = `DRAM_PATH3.b7_phy_bank_bits;
   reg   [1:0]   	  dram_Ch3_b_phy_bank_bits[7:0];

   wire  [1:0]   	  dram_Ch3_que_refresh_rank 	       = `DRAM_PATH3.que_refresh_rank;


//----------------------------------------------------------------------------------------
// Starvation counter causing the wr to have priority. 
//----------------------------------------------------------------------------------------
   wire  [7:0]   	  dram_Ch3_que_pick_wr_first 	= `DRAM_PATH3.que_pick_wr_first;

//----------------------------------------------------------------------------------------
// Scrub Related
//----------------------------------------------------------------------------------------
   // picking the que_split_scrb_addr as _que_scrb_addr_picked_
   wire  [35:0]   	  dram_Ch3_que_scrb_addr_picked 	= `DRAM_PATH3.que_split_scrb_addr;
   wire           	  dram_Ch3_que_scrb_picked 		= `DRAM_PATH3.que_scrb_picked;
   wire           	  dram_Ch3_que_scrb_rd_picked 	= `DRAM_PATH3.que_scrb_rd_picked;
   wire           	  dram_Ch3_que_ras_bank_picked_en 	= `DRAM_PATH3.que_ras_bank_picked_en;
   wire           	  dram_Ch3_que_scrb_write_req 	= `DRAM_PATH3.que_scrb_write_req;

// req valid and scrb valid, the scrb should be cleared first
   wire  [7:0]   	  dram_Ch3_que_l2req_valid 	=  `DRAM_PATH3.que_bank_l2req_valids | 
							   `DRAM_PATH3.ch1_que_l2req_valids;
   wire  [7:0]   	  dram_Ch3_scrb_indx_val   	=  `DRAM_PATH3.que_scrb_indx_val;

//----------------------------------------------------------------------------------------
// Dram Registers
//----------------------------------------------------------------------------------------
   wire  [8:0]   	  dram_Ch3_chip_config_reg 	        = `DRAM_PATH3.chip_config_reg[8:0];
   wire  [2:0]   	  dram_Ch3_mode_reg        	        = `DRAM_PATH3.mode_reg[6:4];
   wire  [3:0]   	  dram_Ch3_rrd_reg        	        = `DRAM_PATH3.rrd_reg;
   wire  [4:0]   	  dram_Ch3_rc_reg         	        = `DRAM_PATH3.rc_reg;
   wire  [3:0]   	  dram_Ch3_rcd_reg         	        = `DRAM_PATH3.rcd_reg;
   wire  [3:0]   	  dram_Ch3_wtr_dly_reg         	= `DRAM_PATH3.wtr_dly_reg;
   wire  [3:0]   	  dram_Ch3_rtw_dly_reg         	= `DRAM_PATH3.rtw_dly_reg;
   wire  [3:0]   	  dram_Ch3_rtp_reg         		= `DRAM_PATH3.rtp_reg;
   wire  [3:0]   	  dram_Ch3_ras_reg         		= `DRAM_PATH3.ras_reg;
   wire  [3:0]   	  dram_Ch3_rp_reg          		= `DRAM_PATH3.rp_reg;
   wire  [3:0]   	  dram_Ch3_wr_reg          		= `DRAM_PATH3.wr_reg;
   wire  [1:0]   	  dram_Ch3_mrd_reg          		= `DRAM_PATH3.mrd_reg;
   wire  [1:0]   	  dram_Ch3_iwtr_reg          	= `DRAM_PATH3.iwtr_reg;
   wire  [14:0]   	  dram_Ch3_ext_mode_reg2          	= `DRAM_PATH3.ext_mode_reg2;
   wire  [14:0]   	  dram_Ch3_ext_mode_reg1          	= `DRAM_PATH3.ext_mode_reg1;
   wire  [14:0]   	  dram_Ch3_ext_mode_reg3          	= `DRAM_PATH3.ext_mode_reg3;
   wire          	  dram_Ch3_que_eight_bank_mode       = `DRAM_PATH3.que_eight_bank_mode;
   wire          	  dram_Ch3_que_rank1_present         = `DRAM_PATH3.que_rank1_present;
   wire          	  dram_Ch3_que_channel_disabled      = `DRAM_PATH3.que_channel_disabled;
   wire          	  dram_Ch3_que_addr_bank_low_sel     = `DRAM_PATH3.que_addr_bank_low_sel;
   wire          	  dram_Ch3_que_init     		= `DRAM_PATH3.que_init;
   wire  [2:0]   	  dram_Ch3_que_data_del_cnt          = `DRAM_PATH3.que_data_del_cnt;
   wire          	  dram_Ch3_dram_io_pad_clk_inv       = `DRAM_PATH3.dram_io_pad_clk_inv;
   wire  [1:0]   	  dram_Ch3_dram_io_ptr_clk_inv       = `DRAM_PATH3.dram_io_ptr_clk_inv;
   wire          	  dram_Ch3_que_wr_mode_reg_done      = `DRAM_PATH3.que_wr_mode_reg_done;
   wire          	  dram_Ch3_que_init_status_reg       = `DRAM_PATH3.que_init_status_reg;
   wire  [3:0]   	  dram_Ch3_que_dimms_present         = `DRAM_PATH3.que_dimms_present;
   wire          	  dram_Ch3_dram_fail_over_mode       = `DRAM_PATH3.dram_fail_over_mode;
   wire  [31:0]  	  dram_Ch3_dram_fail_over_mask       = `DRAM_PATH3.dram_fail_over_mask;
   wire          	  dram_Ch3_que_dbg_trig_en	        = `DRAM_PATH3.que_dbg_trig_en;
   wire  [22:0]  	  dram_Ch3_que_err_sts_reg	        = `DRAM_PATH3.que_err_sts_reg;
   wire  [35:0]  	  dram_Ch3_que_err_addr_reg	        = `DRAM_PATH3.que_err_addr_reg;
   wire          	  dram_Ch3_err_inj_reg	        = `DRAM_PATH3.err_inj_reg;
   wire          	  dram_Ch3_sshot_err_reg	        = `DRAM_PATH3.sshot_err_reg;
   wire  [1:0]  	  dram_Ch3_que_err_cnt  	        = `DRAM_PATH3.que_err_cnt[17:16];
   wire  [31:0]  	  dram_Ch3_que_err_loc  	        = `DRAM_PATH3.que_err_loc;

   // NACK - for non existant register read
   wire          	  dram_Ch3_que_l2if_ack_vld	        = `DRAM_PATH3.que_l2if_ack_vld;
   wire          	  dram_Ch3_que_l2if_nack_vld	        = `DRAM_PATH3.que_l2if_nack_vld;

   wire          	  dram_Ch3_que_init_dram_done	= `DRAM_PATH3.que_init_dram_done;

//----------------------------------------------------------------------------------------
// Dram l2if interface
//----------------------------------------------------------------------------------------
   wire          	  dram_Ch3_sctag_dram_rd_req 	= `DRAM_L2IF3.sctag_dram_rd_req;
   wire  [2:0]   	  dram_Ch3_sctag_dram_rd_req_id 	= `DRAM_L2IF3.sctag_dram_rd_req_id;
   wire  [39:5]   	  dram_Ch3_sctag_dram_addr      	= `DRAM_L2IF3.sctag_dram_addr;
   wire          	  dram_Ch3_sctag_dram_rd_dummy_req 	= `DRAM_L2IF3.sctag_dram_rd_dummy_req;
   wire          	  dram_Ch3_dram_sctag_rd_ack       	= `DRAM_L2IF3.dram_sctag_rd_ack;
   wire          	  dram_Ch3_sctag_dram_wr_req 	= `DRAM_L2IF3.sctag_dram_wr_req;
   wire          	  dram_Ch3_sctag_dram_data_vld 	= `DRAM_L2IF3.sctag_dram_data_vld;
   wire  [63:0]  	  dram_Ch3_sctag_dram_wr_data 	= `DRAM_L2IF3.sctag_dram_wr_data;
   wire          	  dram_Ch3_dram_sctag_wr_ack       	= `DRAM_L2IF3.dram_sctag_wr_ack;
   wire          	  dram_Ch3_dram_sctag_data_vld     	= `DRAM_L2IF3.dram_sctag_data_vld;
   wire  [127:0] 	  dram_Ch3_dram_sctag_data         	= `DRAM_L2IF3.dram_sctag_data;
   wire  [2:0]   	  dram_Ch3_dram_sctag_rd_req_id    	= `DRAM_L2IF3.dram_sctag_rd_req_id;
   wire  [3:0]   	  dram_Ch3_l2if_b0_rd_val          	= `DRAM_L2IF3.l2if_b0_rd_val;
   wire  [3:0]   	  dram_Ch3_l2if_b1_rd_val          	= `DRAM_L2IF3.l2if_b1_rd_val;
   wire  [3:0]   	  dram_Ch3_l2if_b0_wr_val          	= `DRAM_L2IF3.l2if_b0_wr_val;
   wire  [3:0]   	  dram_Ch3_l2if_b1_wr_val          	= `DRAM_L2IF3.l2if_b1_wr_val;
   wire  [5:0]   	  dram_Ch3_l2if_wr_b0_data_addr      = `DRAM_L2IF3.l2if_wr_b0_data_addr;

   // Signals on L2 Interface that indicates Error
   wire          	  dram_Ch3_dram_sctag_secc_err       = `DRAM_L2IF3.dram_sctag_secc_err;
   wire          	  dram_Ch3_dram_sctag_pa_err         = `DRAM_L2IF3.dram_sctag_pa_err;
   wire          	  dram_Ch3_dram_sctag_mecc_err       = `DRAM_L2IF3.dram_sctag_mecc_err;
   wire          	  dram_Ch3_dram_sctag_scb_secc_err   = `DRAM_L2IF3.dram_sctag_scb_secc_err;
   wire          	  dram_Ch3_dram_sctag_scb_mecc_err   = `DRAM_L2IF3.dram_sctag_scb_mecc_err;

   // Error signal for update of error status, error location and error address register.
   //wire          	  dram_Ch3_l2if_scrb_val_d2          = `DRAM_L2IF3.l2if_scrb_val_d3;
   // l2if_scrb_data_val is now qualifying scrb in the rtl
   wire          	  dram_Ch3_l2if_scrb_val_d2          = `DRAM_L2IF3.l2if_scrb_data_val;
// qualified with vld since they can be on due to residual ( previous error )
   wire          	  dram_Ch3_l2if_secc_err             = `DRAM_L2IF3.l2if_secc_err && (`DRAM_L2IF3.dram_sctag_data_vld_d2 || `DRAM_L2IF3.l2if_scrb_data_val);
   wire          	  dram_Ch3_l2if_mecc_err_partial     = `DRAM_L2IF3.l2if_mecc_err_partial && (`DRAM_L2IF3.dram_sctag_data_vld_d2 || `DRAM_L2IF3.l2if_scrb_data_val);
   wire          	  dram_Ch3_l2if_pa_err               = `DRAM_L2IF3.l2if_pa_err && `DRAM_L2IF3.dram_sctag_data_vld_d2;
   wire  [6:0]   	  dram_Ch3_err_sts_reg               = `DRAM_L2IF3.err_sts_reg[22:16];
   wire          	  dram_Ch3_l2if_err_sts_reg_en6      = `DRAM_L2IF3.l2if_err_sts_reg_en6;
   wire          	  dram_Ch3_l2if_err_sts_reg_en5      = `DRAM_L2IF3.l2if_err_sts_reg_en5;
   wire          	  dram_Ch3_l2if_err_sts_reg_en4      = `DRAM_L2IF3.l2if_err_sts_reg_en4;
   wire          	  dram_Ch3_l2if_err_sts_reg_en3      = `DRAM_L2IF3.l2if_err_sts_reg_en3;
   wire          	  dram_Ch3_l2if_err_sts_reg_en2      = `DRAM_L2IF3.l2if_err_sts_reg_en2;
   wire          	  dram_Ch3_l2if_err_sts_reg_en1      = `DRAM_L2IF3.l2if_err_sts_reg_en1;
   wire          	  dram_Ch3_l2if_err_sts_reg_en0      = `DRAM_L2IF3.l2if_err_sts_reg_en0;
   wire          	  dram_Ch3_l2if_err_sts_reg_en       = `DRAM_L2IF3.l2if_err_sts_reg_en;
   wire          	  dram_Ch3_l2if_err_addr_reg_en      = `DRAM_L2IF3.l2if_err_addr_reg_en;
   wire          	  dram_Ch3_l2if_secc_loc_en          = `DRAM_L2IF3.l2if_secc_loc_en;

   wire  [3:0]   	  dram_Ch3_cpu_wr_addr               = `DRAM_L2IF3.dram_cpu_wr_addr;
   wire  [3:0]   	  dram_Ch3_cpu_wr_en                 = `DRAM_L2IF3.dram_cpu_wr_en;

   wire          	  dram_Ch3_clspine_dram_tx_sync 	= `DRAM_L2IF3.dram_dram_tx_sync;

// l2if wr entry valid ( for the actual data valid creation)
   wire  [7:0]            dram_Ch3_l2if_wr_entry             = {
                                                                  `DRAM_L2IF3.l2if_wr_entry7,
                                                                  `DRAM_L2IF3.l2if_wr_entry6,
                                                                  `DRAM_L2IF3.l2if_wr_entry5,
                                                                  `DRAM_L2IF3.l2if_wr_entry4,
                                                                  `DRAM_L2IF3.l2if_wr_entry3,
                                                                  `DRAM_L2IF3.l2if_wr_entry2,
                                                                  `DRAM_L2IF3.l2if_wr_entry1,
                                                                  `DRAM_L2IF3.l2if_wr_entry0
                                                                  };

// enabled for 8 deep FIFO that expects the first data to come back
   wire  [7:0]            dram_Ch3_l2if_data_ret_fifo_en     = {
                                                                  `DRAM_L2IF3.l2if_fifo_ent7_en,
                                                                  `DRAM_L2IF3.l2if_fifo_ent6_en,
                                                                  `DRAM_L2IF3.l2if_fifo_ent5_en,
                                                                  `DRAM_L2IF3.l2if_fifo_ent4_en,
                                                                  `DRAM_L2IF3.l2if_fifo_ent3_en,
                                                                  `DRAM_L2IF3.l2if_fifo_ent2_en,
                                                                  `DRAM_L2IF3.l2if_fifo_ent1_en,
                                                                  `DRAM_L2IF3.l2if_fifo_ent0_en
                                                                  };



  wire   [8:0]            dram_Ch3_rd_adr_info_hi		 = {
                                                                  `DRAM_L2IF3.l2if_addr_bank_low_sel,
                                                                  `DRAM_L2IF3.dram_rd_addr_gen_hi.addr_err,
                                                                  `DRAM_L2IF3.dram_rd_addr_gen_hi.stack_adr,
                                                                  `DRAM_L2IF3.dram_rd_addr_gen_hi.rank_adr,
                                                                  `DRAM_L2IF3.dram_rd_addr_gen_hi.bank_adr[2] && `DRAM_L2IF3.dram_rd_addr_gen_hi.eight_bank_mode,
                                                                  `DRAM_L2IF3.dram_rd_addr_gen_hi.bank_adr[1:0],
                                                                  `DRAM_L2IF3.dram_rd_addr_gen_hi.eight_bank_mode,
                                                                  `DRAM_L2IF3.dram_rd_addr_gen_hi.two_channel_mode
                                                                  };
  wire   [8:0]            dram_Ch3_wr_adr_info_hi		 = {
                                                                  `DRAM_L2IF3.l2if_addr_bank_low_sel,
                                                                  `DRAM_L2IF3.dram_wr_addr_gen_hi.addr_err,
                                                                  `DRAM_L2IF3.dram_wr_addr_gen_hi.stack_adr,
                                                                  `DRAM_L2IF3.dram_wr_addr_gen_hi.rank_adr,
                                                                  `DRAM_L2IF3.dram_wr_addr_gen_hi.bank_adr[2] && `DRAM_L2IF3.dram_wr_addr_gen_hi.eight_bank_mode,
                                                                  `DRAM_L2IF3.dram_wr_addr_gen_hi.bank_adr[1:0],
                                                                  `DRAM_L2IF3.dram_wr_addr_gen_hi.eight_bank_mode,
                                                                  `DRAM_L2IF3.dram_wr_addr_gen_hi.two_channel_mode
                                                                  };
  wire   [8:0]            dram_Ch3_rd_adr_info_lo		 = {
                                                                  `DRAM_L2IF3.l2if_addr_bank_low_sel,
                                                                  `DRAM_L2IF3.dram_rd_addr_gen_lo.addr_err,
                                                                  `DRAM_L2IF3.dram_rd_addr_gen_lo.stack_adr,
                                                                  `DRAM_L2IF3.dram_rd_addr_gen_lo.rank_adr,
                                                                  `DRAM_L2IF3.dram_rd_addr_gen_lo.bank_adr[2] && `DRAM_L2IF3.dram_rd_addr_gen_lo.eight_bank_mode,
                                                                  `DRAM_L2IF3.dram_rd_addr_gen_lo.bank_adr[1:0],
                                                                  `DRAM_L2IF3.dram_rd_addr_gen_lo.eight_bank_mode,
                                                                  `DRAM_L2IF3.dram_rd_addr_gen_lo.two_channel_mode
                                                                  };
  wire   [8:0]            dram_Ch3_wr_adr_info_lo		 = {
                                                                  `DRAM_L2IF3.l2if_addr_bank_low_sel,
                                                                  `DRAM_L2IF3.dram_wr_addr_gen_lo.addr_err,
                                                                  `DRAM_L2IF3.dram_wr_addr_gen_lo.stack_adr,
                                                                  `DRAM_L2IF3.dram_wr_addr_gen_lo.rank_adr,
                                                                  `DRAM_L2IF3.dram_wr_addr_gen_lo.bank_adr[2] && `DRAM_L2IF3.dram_wr_addr_gen_lo.eight_bank_mode,
                                                                  `DRAM_L2IF3.dram_wr_addr_gen_lo.bank_adr[1:0],
                                                                  `DRAM_L2IF3.dram_wr_addr_gen_lo.eight_bank_mode,
                                                                  `DRAM_L2IF3.dram_wr_addr_gen_lo.two_channel_mode
                                                                  };
                                                                 

 
//----------------------------------------------------------------------------------------
// Dram DP 
//----------------------------------------------------------------------------------------
   wire  [3:0]            dram_Ch3_dp_pioson_l2_data          = `DRAM_DP3.dp_pioson_l2_data;
   wire  [1:0]            dram_Ch3_dp_pioson_l2_chunk         = `DRAM_DP3.dp_pioson_l2_chunk;

//----------------------------------------------------------------------------------------
// Performance counters
//----------------------------------------------------------------------------------------

   wire  [7:0]            dram_Ch3_perf_cntl          = `DRAM_PATH3.que_perf_cntl_reg;
   wire                   dram_Ch3_cnt0_sticky_bit    = `DRAM_PATH3.que_perf_cnt0_reg[31];
   wire                   dram_Ch3_cnt1_sticky_bit    = `DRAM_PATH3.que_perf_cnt1_reg[31];

//----------------------------------------------------------------------------------------
// for line coverage
//----------------------------------------------------------------------------------------
//   wire  [2:0] 		  dram_Ch3_que_wl_addr_cnt0 =  `DRAM_PATH3.que_wl_addr_cnt0;
//   wire  [2:0] 		  dram_Ch3_que_wl_addr_cnt1 =  `DRAM_PATH3.que_wl_addr_cnt1;
//   wire  [2:0] 		  dram_Ch3_que_wl_data_addr0_load_cas2 =  `DRAM_PATH3.que_wl_data_addr0_load_cas2;
//   wire  [2:0] 		  dram_Ch3_que_wl_data_addr0_load =  `DRAM_PATH3.que_wl_data_addr0_load;
//   wire  [2:0] 		  dram_Ch3_que_wl_data_addr1_load =  `DRAM_PATH3.que_wl_data_addr1_load;
//

//----------------------------------------------------------------------------------------
// RAS/CAS/CS/BANK for observing the target pattern of the x-action ( which CS/which BANK)
//----------------------------------------------------------------------------------------

   wire                   dram_Ch3_RAS_L          = `TOP_MOD_INST.DRAM3_RAS_L;
   wire                   dram_Ch3_CAS_L          = `TOP_MOD_INST.DRAM3_CAS_L;
   wire                   dram_Ch3_WE_L           = `TOP_MOD_INST.DRAM3_WE_L;
   wire  [2:0]            dram_Ch3_BA             = `TOP_MOD_INST.DRAM3_BA;
   wire  [3:0]            dram_Ch3_CS_L           = `TOP_MOD_INST.DRAM3_CS_L;
   wire  [14:0]           dram_Ch3_ADDR           = `TOP_MOD_INST.DRAM3_ADDR;


  wire                   dram_dram_cken = `DCTLPATH0.clk_dram_dram_cken;     // ddr clock enable
  wire                   dram_jbus_cken = `DCTLPATH0.clk_dram_jbus_cken;     // jbus clock enable
  wire                   dram_cmp_cken  = `DCTLPATH0.clk_dram_cmp_cken;      // cmp clock enable

  wire                   dram_grst_l = `DCTLPATH0.dram_grst_l; 
  wire                   jbus_grst_l = `DCTLPATH0.jbus_grst_l;            // active low reset signal
  wire                   cmp_grst_l  = `DCTLPATH0.cmp_grst_l;            // active low reset signal


// Put till i release the dram cov to cmp level
//`ifdef DRAM_SAT

always @ (dram_dram_cken or dram_grst_l)
begin
if (!$test$plusargs("DISABLE_RST_CKEN_CHK")) begin 
  if  (!dram_dram_cken &&  dram_grst_l ) begin 
   // error 
   finish_test(" ERROR : DRAM Clock enable and RST are not asserted properly",0);
  end 
end 
end 

always @ (dram_jbus_cken or dram_grst_l)
begin
if (!$test$plusargs("DISABLE_RST_CKEN_CHK")) begin 
  if  (!dram_jbus_cken &&  jbus_grst_l ) begin 
   // error 
   finish_test(" ERROR : JBUS Clock enable and RST are not asserted properly",0);
  end 
end 
end 

always @ (dram_cmp_cken or cmp_grst_l)
begin
if (!$test$plusargs("DISABLE_RST_CKEN_CHK")) begin 
  if  (!dram_cmp_cken &&  cmp_grst_l ) begin 
   // error 
   finish_test(" ERROR : CMP Clock enable and RST are not asserted properly",0);
  end 
end 
end 


//----------------------------------------------------------------------------------------
//  Fifo conditions
//----------------------------------------------------------------------------------------

// combining for better indexing

//rd q
always @(dram_Ch0_rd_q_0 or dram_Ch0_rd_q_1 or dram_Ch0_rd_q_2 or dram_Ch0_rd_q_3 or 
         dram_Ch0_rd_q_4 or dram_Ch0_rd_q_5 or dram_Ch0_rd_q_6 or dram_Ch0_rd_q_7 or dram_rst_l)
begin 
    dram_Ch0_rd_q[0] = dram_Ch0_rd_q_0;
    dram_Ch0_rd_q[1] = dram_Ch0_rd_q_1;
    dram_Ch0_rd_q[2] = dram_Ch0_rd_q_2;
    dram_Ch0_rd_q[3] = dram_Ch0_rd_q_3;
    dram_Ch0_rd_q[4] = dram_Ch0_rd_q_4;
    dram_Ch0_rd_q[5] = dram_Ch0_rd_q_5;
    dram_Ch0_rd_q[6] = dram_Ch0_rd_q_6;
    dram_Ch0_rd_q[7] = dram_Ch0_rd_q_7;
end
always @(dram_Ch1_rd_q_0 or dram_Ch1_rd_q_1 or dram_Ch1_rd_q_2 or dram_Ch1_rd_q_3 or 
         dram_Ch1_rd_q_4 or dram_Ch1_rd_q_5 or dram_Ch1_rd_q_6 or dram_Ch1_rd_q_7 or dram_rst_l)
begin 
    dram_Ch1_rd_q[0] = dram_Ch1_rd_q_0;
    dram_Ch1_rd_q[1] = dram_Ch1_rd_q_1;
    dram_Ch1_rd_q[2] = dram_Ch1_rd_q_2;
    dram_Ch1_rd_q[3] = dram_Ch1_rd_q_3;
    dram_Ch1_rd_q[4] = dram_Ch1_rd_q_4;
    dram_Ch1_rd_q[5] = dram_Ch1_rd_q_5;
    dram_Ch1_rd_q[6] = dram_Ch1_rd_q_6;
    dram_Ch1_rd_q[7] = dram_Ch1_rd_q_7;
end
always @(dram_Ch2_rd_q_0 or dram_Ch2_rd_q_1 or dram_Ch2_rd_q_2 or dram_Ch2_rd_q_3 or 
         dram_Ch2_rd_q_4 or dram_Ch2_rd_q_5 or dram_Ch2_rd_q_6 or dram_Ch2_rd_q_7 or dram_rst_l)
begin 
    dram_Ch2_rd_q[0] = dram_Ch2_rd_q_0;
    dram_Ch2_rd_q[1] = dram_Ch2_rd_q_1;
    dram_Ch2_rd_q[2] = dram_Ch2_rd_q_2;
    dram_Ch2_rd_q[3] = dram_Ch2_rd_q_3;
    dram_Ch2_rd_q[4] = dram_Ch2_rd_q_4;
    dram_Ch2_rd_q[5] = dram_Ch2_rd_q_5;
    dram_Ch2_rd_q[6] = dram_Ch2_rd_q_6;
    dram_Ch2_rd_q[7] = dram_Ch2_rd_q_7;
end
always @(dram_Ch3_rd_q_0 or dram_Ch3_rd_q_1 or dram_Ch3_rd_q_2 or dram_Ch3_rd_q_3 or 
         dram_Ch3_rd_q_4 or dram_Ch3_rd_q_5 or dram_Ch3_rd_q_6 or dram_Ch3_rd_q_7 or dram_rst_l)
begin 
    dram_Ch3_rd_q[0] = dram_Ch3_rd_q_0;
    dram_Ch3_rd_q[1] = dram_Ch3_rd_q_1;
    dram_Ch3_rd_q[2] = dram_Ch3_rd_q_2;
    dram_Ch3_rd_q[3] = dram_Ch3_rd_q_3;
    dram_Ch3_rd_q[4] = dram_Ch3_rd_q_4;
    dram_Ch3_rd_q[5] = dram_Ch3_rd_q_5;
    dram_Ch3_rd_q[6] = dram_Ch3_rd_q_6;
    dram_Ch3_rd_q[7] = dram_Ch3_rd_q_7;
end

// rd colps fifo
always @( dram_Ch0_rd_colps_q_0 or  dram_Ch0_rd_colps_q_1 or dram_Ch0_rd_colps_q_2 or
          dram_Ch0_rd_colps_q_3 or  dram_Ch0_rd_colps_q_4 or dram_Ch0_rd_colps_q_5 or 
          dram_Ch0_rd_colps_q_6 or  dram_Ch0_rd_colps_q_7 or dram_rst_l)
begin 
    dram_Ch0_rd_colps_q[0] = dram_Ch0_rd_colps_q_0;
    dram_Ch0_rd_colps_q[1] = dram_Ch0_rd_colps_q_1;
    dram_Ch0_rd_colps_q[2] = dram_Ch0_rd_colps_q_2;
    dram_Ch0_rd_colps_q[3] = dram_Ch0_rd_colps_q_3;
    dram_Ch0_rd_colps_q[4] = dram_Ch0_rd_colps_q_4;
    dram_Ch0_rd_colps_q[5] = dram_Ch0_rd_colps_q_5;
    dram_Ch0_rd_colps_q[6] = dram_Ch0_rd_colps_q_6;
    dram_Ch0_rd_colps_q[7] = dram_Ch0_rd_colps_q_7;
end
always @( dram_Ch1_rd_colps_q_0 or  dram_Ch1_rd_colps_q_1 or dram_Ch1_rd_colps_q_2 or
          dram_Ch1_rd_colps_q_3 or  dram_Ch1_rd_colps_q_4 or dram_Ch1_rd_colps_q_5 or 
          dram_Ch1_rd_colps_q_6 or  dram_Ch1_rd_colps_q_7 or dram_rst_l)
begin 
    dram_Ch1_rd_colps_q[0] = dram_Ch1_rd_colps_q_0;
    dram_Ch1_rd_colps_q[1] = dram_Ch1_rd_colps_q_1;
    dram_Ch1_rd_colps_q[2] = dram_Ch1_rd_colps_q_2;
    dram_Ch1_rd_colps_q[3] = dram_Ch1_rd_colps_q_3;
    dram_Ch1_rd_colps_q[4] = dram_Ch1_rd_colps_q_4;
    dram_Ch1_rd_colps_q[5] = dram_Ch1_rd_colps_q_5;
    dram_Ch1_rd_colps_q[6] = dram_Ch1_rd_colps_q_6;
    dram_Ch1_rd_colps_q[7] = dram_Ch1_rd_colps_q_7;
end
always @( dram_Ch2_rd_colps_q_0 or  dram_Ch2_rd_colps_q_1 or dram_Ch2_rd_colps_q_2 or
          dram_Ch2_rd_colps_q_3 or  dram_Ch2_rd_colps_q_4 or dram_Ch2_rd_colps_q_5 or 
          dram_Ch2_rd_colps_q_6 or  dram_Ch2_rd_colps_q_7 or dram_rst_l)
begin 
    dram_Ch2_rd_colps_q[0] = dram_Ch2_rd_colps_q_0;
    dram_Ch2_rd_colps_q[1] = dram_Ch2_rd_colps_q_1;
    dram_Ch2_rd_colps_q[2] = dram_Ch2_rd_colps_q_2;
    dram_Ch2_rd_colps_q[3] = dram_Ch2_rd_colps_q_3;
    dram_Ch2_rd_colps_q[4] = dram_Ch2_rd_colps_q_4;
    dram_Ch2_rd_colps_q[5] = dram_Ch2_rd_colps_q_5;
    dram_Ch2_rd_colps_q[6] = dram_Ch2_rd_colps_q_6;
    dram_Ch2_rd_colps_q[7] = dram_Ch2_rd_colps_q_7;
end
always @( dram_Ch3_rd_colps_q_0 or  dram_Ch3_rd_colps_q_1 or dram_Ch3_rd_colps_q_2 or
          dram_Ch3_rd_colps_q_3 or  dram_Ch3_rd_colps_q_4 or dram_Ch3_rd_colps_q_5 or 
          dram_Ch3_rd_colps_q_6 or  dram_Ch3_rd_colps_q_7 or dram_rst_l)
begin 
    dram_Ch3_rd_colps_q[0] = dram_Ch3_rd_colps_q_0;
    dram_Ch3_rd_colps_q[1] = dram_Ch3_rd_colps_q_1;
    dram_Ch3_rd_colps_q[2] = dram_Ch3_rd_colps_q_2;
    dram_Ch3_rd_colps_q[3] = dram_Ch3_rd_colps_q_3;
    dram_Ch3_rd_colps_q[4] = dram_Ch3_rd_colps_q_4;
    dram_Ch3_rd_colps_q[5] = dram_Ch3_rd_colps_q_5;
    dram_Ch3_rd_colps_q[6] = dram_Ch3_rd_colps_q_6;
    dram_Ch3_rd_colps_q[7] = dram_Ch3_rd_colps_q_7;
end


//wr q
always @(dram_Ch0_wr_q_0 or dram_Ch0_wr_q_1 or dram_Ch0_wr_q_2 or dram_Ch0_wr_q_3 or 
         dram_Ch0_wr_q_4 or dram_Ch0_wr_q_5 or dram_Ch0_wr_q_6 or dram_Ch0_wr_q_7 or dram_rst_l)
begin 
    dram_Ch0_wr_q[0] = dram_Ch0_wr_q_0;
    dram_Ch0_wr_q[1] = dram_Ch0_wr_q_1;
    dram_Ch0_wr_q[2] = dram_Ch0_wr_q_2;
    dram_Ch0_wr_q[3] = dram_Ch0_wr_q_3;
    dram_Ch0_wr_q[4] = dram_Ch0_wr_q_4;
    dram_Ch0_wr_q[5] = dram_Ch0_wr_q_5;
    dram_Ch0_wr_q[6] = dram_Ch0_wr_q_6;
    dram_Ch0_wr_q[7] = dram_Ch0_wr_q_7;
end
always @(dram_Ch1_wr_q_0 or dram_Ch1_wr_q_1 or dram_Ch1_wr_q_2 or dram_Ch1_wr_q_3 or 
         dram_Ch1_wr_q_4 or dram_Ch1_wr_q_5 or dram_Ch1_wr_q_6 or dram_Ch1_wr_q_7 or dram_rst_l)
begin 
    dram_Ch1_wr_q[0] = dram_Ch1_wr_q_0;
    dram_Ch1_wr_q[1] = dram_Ch1_wr_q_1;
    dram_Ch1_wr_q[2] = dram_Ch1_wr_q_2;
    dram_Ch1_wr_q[3] = dram_Ch1_wr_q_3;
    dram_Ch1_wr_q[4] = dram_Ch1_wr_q_4;
    dram_Ch1_wr_q[5] = dram_Ch1_wr_q_5;
    dram_Ch1_wr_q[6] = dram_Ch1_wr_q_6;
    dram_Ch1_wr_q[7] = dram_Ch1_wr_q_7;
end
always @(dram_Ch2_wr_q_0 or dram_Ch2_wr_q_1 or dram_Ch2_wr_q_2 or dram_Ch2_wr_q_3 or 
         dram_Ch2_wr_q_4 or dram_Ch2_wr_q_5 or dram_Ch2_wr_q_6 or dram_Ch2_wr_q_7 or dram_rst_l)
begin 
    dram_Ch2_wr_q[0] = dram_Ch2_wr_q_0;
    dram_Ch2_wr_q[1] = dram_Ch2_wr_q_1;
    dram_Ch2_wr_q[2] = dram_Ch2_wr_q_2;
    dram_Ch2_wr_q[3] = dram_Ch2_wr_q_3;
    dram_Ch2_wr_q[4] = dram_Ch2_wr_q_4;
    dram_Ch2_wr_q[5] = dram_Ch2_wr_q_5;
    dram_Ch2_wr_q[6] = dram_Ch2_wr_q_6;
    dram_Ch2_wr_q[7] = dram_Ch2_wr_q_7;
end
always @(dram_Ch3_wr_q_0 or dram_Ch3_wr_q_1 or dram_Ch3_wr_q_2 or dram_Ch3_wr_q_3 or 
         dram_Ch3_wr_q_4 or dram_Ch3_wr_q_5 or dram_Ch3_wr_q_6 or dram_Ch3_wr_q_7 or dram_rst_l)
begin 
    dram_Ch3_wr_q[0] = dram_Ch3_wr_q_0;
    dram_Ch3_wr_q[1] = dram_Ch3_wr_q_1;
    dram_Ch3_wr_q[2] = dram_Ch3_wr_q_2;
    dram_Ch3_wr_q[3] = dram_Ch3_wr_q_3;
    dram_Ch3_wr_q[4] = dram_Ch3_wr_q_4;
    dram_Ch3_wr_q[5] = dram_Ch3_wr_q_5;
    dram_Ch3_wr_q[6] = dram_Ch3_wr_q_6;
    dram_Ch3_wr_q[7] = dram_Ch3_wr_q_7;
end

// wr colps fifo
always @( dram_Ch0_wr_colps_q_0 or  dram_Ch0_wr_colps_q_1 or dram_Ch0_wr_colps_q_2 or
          dram_Ch0_wr_colps_q_3 or  dram_Ch0_wr_colps_q_4 or dram_Ch0_wr_colps_q_5 or 
          dram_Ch0_wr_colps_q_6 or  dram_Ch0_wr_colps_q_7  or dram_rst_l)
begin 
    dram_Ch0_wr_colps_q[0] = dram_Ch0_wr_colps_q_0;
    dram_Ch0_wr_colps_q[1] = dram_Ch0_wr_colps_q_1;
    dram_Ch0_wr_colps_q[2] = dram_Ch0_wr_colps_q_2;
    dram_Ch0_wr_colps_q[3] = dram_Ch0_wr_colps_q_3;
    dram_Ch0_wr_colps_q[4] = dram_Ch0_wr_colps_q_4;
    dram_Ch0_wr_colps_q[5] = dram_Ch0_wr_colps_q_5;
    dram_Ch0_wr_colps_q[6] = dram_Ch0_wr_colps_q_6;
    dram_Ch0_wr_colps_q[7] = dram_Ch0_wr_colps_q_7;
end
always @( dram_Ch1_wr_colps_q_0 or  dram_Ch1_wr_colps_q_1 or dram_Ch1_wr_colps_q_2 or
          dram_Ch1_wr_colps_q_3 or  dram_Ch1_wr_colps_q_4 or dram_Ch1_wr_colps_q_5 or 
          dram_Ch1_wr_colps_q_6 or  dram_Ch1_wr_colps_q_7  or dram_rst_l)
begin 
    dram_Ch1_wr_colps_q[0] = dram_Ch1_wr_colps_q_0;
    dram_Ch1_wr_colps_q[1] = dram_Ch1_wr_colps_q_1;
    dram_Ch1_wr_colps_q[2] = dram_Ch1_wr_colps_q_2;
    dram_Ch1_wr_colps_q[3] = dram_Ch1_wr_colps_q_3;
    dram_Ch1_wr_colps_q[4] = dram_Ch1_wr_colps_q_4;
    dram_Ch1_wr_colps_q[5] = dram_Ch1_wr_colps_q_5;
    dram_Ch1_wr_colps_q[6] = dram_Ch1_wr_colps_q_6;
    dram_Ch1_wr_colps_q[7] = dram_Ch1_wr_colps_q_7;
end
always @( dram_Ch2_wr_colps_q_0 or  dram_Ch2_wr_colps_q_1 or dram_Ch2_wr_colps_q_2 or
          dram_Ch2_wr_colps_q_3 or  dram_Ch2_wr_colps_q_4 or dram_Ch2_wr_colps_q_5 or 
          dram_Ch2_wr_colps_q_6 or  dram_Ch2_wr_colps_q_7  or dram_rst_l)
begin 
    dram_Ch2_wr_colps_q[0] = dram_Ch2_wr_colps_q_0;
    dram_Ch2_wr_colps_q[1] = dram_Ch2_wr_colps_q_1;
    dram_Ch2_wr_colps_q[2] = dram_Ch2_wr_colps_q_2;
    dram_Ch2_wr_colps_q[3] = dram_Ch2_wr_colps_q_3;
    dram_Ch2_wr_colps_q[4] = dram_Ch2_wr_colps_q_4;
    dram_Ch2_wr_colps_q[5] = dram_Ch2_wr_colps_q_5;
    dram_Ch2_wr_colps_q[6] = dram_Ch2_wr_colps_q_6;
    dram_Ch2_wr_colps_q[7] = dram_Ch2_wr_colps_q_7;
end
always @( dram_Ch3_wr_colps_q_0 or  dram_Ch3_wr_colps_q_1 or dram_Ch3_wr_colps_q_2 or
          dram_Ch3_wr_colps_q_3 or  dram_Ch3_wr_colps_q_4 or dram_Ch3_wr_colps_q_5 or 
          dram_Ch3_wr_colps_q_6 or  dram_Ch3_wr_colps_q_7  or dram_rst_l)
begin 
    dram_Ch3_wr_colps_q[0] = dram_Ch3_wr_colps_q_0;
    dram_Ch3_wr_colps_q[1] = dram_Ch3_wr_colps_q_1;
    dram_Ch3_wr_colps_q[2] = dram_Ch3_wr_colps_q_2;
    dram_Ch3_wr_colps_q[3] = dram_Ch3_wr_colps_q_3;
    dram_Ch3_wr_colps_q[4] = dram_Ch3_wr_colps_q_4;
    dram_Ch3_wr_colps_q[5] = dram_Ch3_wr_colps_q_5;
    dram_Ch3_wr_colps_q[6] = dram_Ch3_wr_colps_q_6;
    dram_Ch3_wr_colps_q[7] = dram_Ch3_wr_colps_q_7;
end

// wr colps fifo
always @( dram_Ch0_b0_phy_bank_bits or  dram_Ch0_b1_phy_bank_bits or  dram_Ch0_b2_phy_bank_bits or
          dram_Ch0_b3_phy_bank_bits or  dram_Ch0_b4_phy_bank_bits or  dram_Ch0_b5_phy_bank_bits or
          dram_Ch0_b6_phy_bank_bits or  dram_Ch0_b7_phy_bank_bits  or dram_rst_l)
begin 
    dram_Ch0_b_phy_bank_bits[0] = dram_Ch0_b0_phy_bank_bits;
    dram_Ch0_b_phy_bank_bits[1] = dram_Ch0_b1_phy_bank_bits;
    dram_Ch0_b_phy_bank_bits[2] = dram_Ch0_b2_phy_bank_bits;
    dram_Ch0_b_phy_bank_bits[3] = dram_Ch0_b3_phy_bank_bits;
    dram_Ch0_b_phy_bank_bits[4] = dram_Ch0_b4_phy_bank_bits;
    dram_Ch0_b_phy_bank_bits[5] = dram_Ch0_b5_phy_bank_bits;
    dram_Ch0_b_phy_bank_bits[6] = dram_Ch0_b6_phy_bank_bits;
    dram_Ch0_b_phy_bank_bits[7] = dram_Ch0_b7_phy_bank_bits;
end
always @( dram_Ch1_b0_phy_bank_bits or  dram_Ch1_b1_phy_bank_bits or  dram_Ch1_b2_phy_bank_bits or
          dram_Ch1_b3_phy_bank_bits or  dram_Ch1_b4_phy_bank_bits or  dram_Ch1_b5_phy_bank_bits or
          dram_Ch1_b6_phy_bank_bits or  dram_Ch1_b7_phy_bank_bits  or dram_rst_l)
begin 
    dram_Ch1_b_phy_bank_bits[0] = dram_Ch1_b0_phy_bank_bits;
    dram_Ch1_b_phy_bank_bits[1] = dram_Ch1_b1_phy_bank_bits;
    dram_Ch1_b_phy_bank_bits[2] = dram_Ch1_b2_phy_bank_bits;
    dram_Ch1_b_phy_bank_bits[3] = dram_Ch1_b3_phy_bank_bits;
    dram_Ch1_b_phy_bank_bits[4] = dram_Ch1_b4_phy_bank_bits;
    dram_Ch1_b_phy_bank_bits[5] = dram_Ch1_b5_phy_bank_bits;
    dram_Ch1_b_phy_bank_bits[6] = dram_Ch1_b6_phy_bank_bits;
    dram_Ch1_b_phy_bank_bits[7] = dram_Ch1_b7_phy_bank_bits;
end
always @( dram_Ch2_b0_phy_bank_bits or  dram_Ch2_b1_phy_bank_bits or  dram_Ch2_b2_phy_bank_bits or
          dram_Ch2_b3_phy_bank_bits or  dram_Ch2_b4_phy_bank_bits or  dram_Ch2_b5_phy_bank_bits or
          dram_Ch2_b6_phy_bank_bits or  dram_Ch2_b7_phy_bank_bits  or dram_rst_l)
begin 
    dram_Ch2_b_phy_bank_bits[0] = dram_Ch2_b0_phy_bank_bits;
    dram_Ch2_b_phy_bank_bits[1] = dram_Ch2_b1_phy_bank_bits;
    dram_Ch2_b_phy_bank_bits[2] = dram_Ch2_b2_phy_bank_bits;
    dram_Ch2_b_phy_bank_bits[3] = dram_Ch2_b3_phy_bank_bits;
    dram_Ch2_b_phy_bank_bits[4] = dram_Ch2_b4_phy_bank_bits;
    dram_Ch2_b_phy_bank_bits[5] = dram_Ch2_b5_phy_bank_bits;
    dram_Ch2_b_phy_bank_bits[6] = dram_Ch2_b6_phy_bank_bits;
    dram_Ch2_b_phy_bank_bits[7] = dram_Ch2_b7_phy_bank_bits;
end
always @( dram_Ch3_b0_phy_bank_bits or  dram_Ch3_b1_phy_bank_bits or  dram_Ch3_b2_phy_bank_bits or
          dram_Ch3_b3_phy_bank_bits or  dram_Ch3_b4_phy_bank_bits or  dram_Ch3_b5_phy_bank_bits or
          dram_Ch3_b6_phy_bank_bits or  dram_Ch3_b7_phy_bank_bits  or dram_rst_l)
begin 
    dram_Ch3_b_phy_bank_bits[0] = dram_Ch3_b0_phy_bank_bits;
    dram_Ch3_b_phy_bank_bits[1] = dram_Ch3_b1_phy_bank_bits;
    dram_Ch3_b_phy_bank_bits[2] = dram_Ch3_b2_phy_bank_bits;
    dram_Ch3_b_phy_bank_bits[3] = dram_Ch3_b3_phy_bank_bits;
    dram_Ch3_b_phy_bank_bits[4] = dram_Ch3_b4_phy_bank_bits;
    dram_Ch3_b_phy_bank_bits[5] = dram_Ch3_b5_phy_bank_bits;
    dram_Ch3_b_phy_bank_bits[6] = dram_Ch3_b6_phy_bank_bits;
    dram_Ch3_b_phy_bank_bits[7] = dram_Ch3_b7_phy_bank_bits;
end


//=====================================================================
// READ Q
//=====================================================================

// detecting rd q full  
reg dram_Ch0_rd_q_full;
reg [3:0]  dram_Ch0_rd_q_cnt;
reg rd_q_full_0;
reg [39:0] rd_q_loc_0;
reg [3:0]  rd_q_cnt_0;

always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch0_rd_q_full <= 1'b0;
   dram_Ch0_rd_q_cnt  <= 4'b0;
  end
  else
   begin 
    rd_q_full_0 = 1;
    rd_q_cnt_0  = 0;
    for (i=0;i<8;i=i+1) begin 
     rd_q_loc_0  = dram_Ch0_rd_q[i];
     // if the read falls on same clock as write ( request served on same clock as it was received )
     //rd_q_full_0 = (rd_q_loc_0[39] && !dram_Ch0_rd_que_rd_ptr[i]) && rd_q_full_0;
     rd_q_full_0 = (rd_q_loc_0[39] && rd_q_full_0);
     rd_q_cnt_0  =  rd_q_cnt_0 + (rd_q_loc_0[39] && !dram_Ch0_rd_que_rd_ptr[i]);
    end
   dram_Ch0_rd_q_full <= rd_q_full_0;
   dram_Ch0_rd_q_cnt  <= rd_q_cnt_0;
  end
end
reg dram_Ch1_rd_q_full;
reg [3:0]  dram_Ch1_rd_q_cnt;
reg rd_q_full_1;
reg [39:0] rd_q_loc_1;
reg [3:0]  rd_q_cnt_1;

always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch1_rd_q_full <= 1'b0;
   dram_Ch1_rd_q_cnt  <= 4'b0;
  end
  else
   begin 
    rd_q_full_1 = 1;
    rd_q_cnt_1  = 0;
    for (i=0;i<8;i=i+1) begin 
     rd_q_loc_1  = dram_Ch1_rd_q[i];
     // if the read falls on same clock as write ( request served on same clock as it was received )
     //rd_q_full_1 = (rd_q_loc_1[39] && !dram_Ch1_rd_que_rd_ptr[i]) && rd_q_full_1;
     rd_q_full_1 = (rd_q_loc_1[39] && rd_q_full_1);
     rd_q_cnt_1  =  rd_q_cnt_1 + (rd_q_loc_1[39] && !dram_Ch1_rd_que_rd_ptr[i]);
    end
   dram_Ch1_rd_q_full <= rd_q_full_1;
   dram_Ch1_rd_q_cnt  <= rd_q_cnt_1;
  end
end
reg dram_Ch2_rd_q_full;
reg [3:0]  dram_Ch2_rd_q_cnt;
reg rd_q_full_2;
reg [39:0] rd_q_loc_2;
reg [3:0]  rd_q_cnt_2;

always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch2_rd_q_full <= 1'b0;
   dram_Ch2_rd_q_cnt  <= 4'b0;
  end
  else
   begin 
    rd_q_full_2 = 1;
    rd_q_cnt_2  = 0;
    for (i=0;i<8;i=i+1) begin 
     rd_q_loc_2  = dram_Ch2_rd_q[i];
     // if the read falls on same clock as write ( request served on same clock as it was received )
     //rd_q_full_2 = (rd_q_loc_2[39] && !dram_Ch2_rd_que_rd_ptr[i]) && rd_q_full_2;
     rd_q_full_2 = (rd_q_loc_2[39] && rd_q_full_2);
     rd_q_cnt_2  =  rd_q_cnt_2 + (rd_q_loc_2[39] && !dram_Ch2_rd_que_rd_ptr[i]);
    end
   dram_Ch2_rd_q_full <= rd_q_full_2;
   dram_Ch2_rd_q_cnt  <= rd_q_cnt_2;
  end
end
reg dram_Ch3_rd_q_full;
reg [3:0]  dram_Ch3_rd_q_cnt;
reg rd_q_full_3;
reg [39:0] rd_q_loc_3;
reg [3:0]  rd_q_cnt_3;

always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch3_rd_q_full <= 1'b0;
   dram_Ch3_rd_q_cnt  <= 4'b0;
  end
  else
   begin 
    rd_q_full_3 = 1;
    rd_q_cnt_3  = 0;
    for (i=0;i<8;i=i+1) begin 
     rd_q_loc_3  = dram_Ch3_rd_q[i];
     // if the read falls on same clock as write ( request served on same clock as it was received )
     //rd_q_full_3 = (rd_q_loc_3[39] && !dram_Ch3_rd_que_rd_ptr[i]) && rd_q_full_3;
     rd_q_full_3 = (rd_q_loc_3[39] && rd_q_full_3);
     rd_q_cnt_3  =  rd_q_cnt_3 + (rd_q_loc_3[39] && !dram_Ch3_rd_que_rd_ptr[i]);
    end
   dram_Ch3_rd_q_full <= rd_q_full_3;
   dram_Ch3_rd_q_cnt  <= rd_q_cnt_3;
  end
end


// Rd Q latency counting 

reg [31:0]  dram_Ch0_rd_q_lat;
always @(posedge clk)
begin
  if (dram_Ch0_que_init_dram_done)
   begin
    dram_Ch0_rd_q_lat  <= dram_Ch0_rd_q_lat + dram_Ch0_rd_q_cnt;
   end else begin 
    dram_Ch0_rd_q_lat  <= 4'b0;
  end
end
reg [31:0]  dram_Ch1_rd_q_lat;
always @(posedge clk)
begin
  if (dram_Ch1_que_init_dram_done)
   begin
    dram_Ch1_rd_q_lat  <= dram_Ch1_rd_q_lat + dram_Ch1_rd_q_cnt;
   end else begin 
    dram_Ch1_rd_q_lat  <= 4'b0;
  end
end
reg [31:0]  dram_Ch2_rd_q_lat;
always @(posedge clk)
begin
  if (dram_Ch2_que_init_dram_done)
   begin
    dram_Ch2_rd_q_lat  <= dram_Ch2_rd_q_lat + dram_Ch2_rd_q_cnt;
   end else begin 
    dram_Ch2_rd_q_lat  <= 4'b0;
  end
end
reg [31:0]  dram_Ch3_rd_q_lat;
always @(posedge clk)
begin
  if (dram_Ch3_que_init_dram_done)
   begin
    dram_Ch3_rd_q_lat  <= dram_Ch3_rd_q_lat + dram_Ch3_rd_q_cnt;
   end else begin 
    dram_Ch3_rd_q_lat  <= 4'b0;
  end
end


// detecting rd collapsing fifo full
reg dram_Ch0_rd_colps_q_full;
reg colps_rd_q_full_0;
reg [8:0] colps_rd_q_loc_0;
reg [3:0] dram_Ch0_rd_colps_q_cnt;
reg [3:0] colps_rd_q_cnt_0;
reg [2:0] colps_rd_indx_0;
reg       colps_rd_rst_vld_0;
always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch0_rd_colps_q_full <= 1'b0;
   dram_Ch0_rd_colps_q_cnt  <= 1'b0;
   end
  else
   begin 
    colps_rd_q_full_0 = 1;
    colps_rd_q_cnt_0 = 0;
    // extract the index for which the reset occured
    colps_rd_rst_vld_0   = 0;
    for (i=0;i<8;i=i+1) begin 
      if (dram_Ch0_rd_que_rd_ptr[i]) begin 
        colps_rd_indx_0 = i;
        colps_rd_rst_vld_0   = 1;
      end
    end
    for (i=0;i<8;i=i+1) begin 
     colps_rd_q_loc_0  = dram_Ch0_rd_colps_q[i];
      if (colps_rd_rst_vld_0 == 1) begin 
       if ((colps_rd_q_loc_0[5:3] != colps_rd_indx_0) || ~colps_rd_q_loc_0[6]) begin 
        colps_rd_q_full_0 = colps_rd_q_loc_0[6]  && colps_rd_q_full_0;
        colps_rd_q_cnt_0  = colps_rd_q_cnt_0 + colps_rd_q_loc_0[6];
       end
      end else begin 
        colps_rd_q_full_0 = colps_rd_q_loc_0[6]  && colps_rd_q_full_0;
        colps_rd_q_cnt_0  = colps_rd_q_cnt_0 + colps_rd_q_loc_0[6];
      end
    end
   dram_Ch0_rd_colps_q_full <= colps_rd_q_full_0;
   dram_Ch0_rd_colps_q_cnt  <= colps_rd_q_cnt_0;

  end
end
reg dram_Ch1_rd_colps_q_full;
reg colps_rd_q_full_1;
reg [8:0] colps_rd_q_loc_1;
reg [3:0] dram_Ch1_rd_colps_q_cnt;
reg [3:0] colps_rd_q_cnt_1;
reg [2:0] colps_rd_indx_1;
reg       colps_rd_rst_vld_1;
always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch1_rd_colps_q_full <= 1'b0;
   dram_Ch1_rd_colps_q_cnt  <= 1'b0;
   end
  else
   begin 
    colps_rd_q_full_1 = 1;
    colps_rd_q_cnt_1 = 0;
    // extract the index for which the reset occured
    colps_rd_rst_vld_1   = 0;
    for (i=0;i<8;i=i+1) begin 
      if (dram_Ch1_rd_que_rd_ptr[i]) begin 
        colps_rd_indx_1 = i;
        colps_rd_rst_vld_1   = 1;
      end
    end
    for (i=0;i<8;i=i+1) begin 
     colps_rd_q_loc_1  = dram_Ch1_rd_colps_q[i];
      if (colps_rd_rst_vld_1 == 1) begin 
       if ((colps_rd_q_loc_1[5:3] != colps_rd_indx_1) || ~colps_rd_q_loc_1[6]) begin 
        colps_rd_q_full_1 = colps_rd_q_loc_1[6]  && colps_rd_q_full_1;
        colps_rd_q_cnt_1  = colps_rd_q_cnt_1 + colps_rd_q_loc_1[6];
       end
      end else begin 
        colps_rd_q_full_1 = colps_rd_q_loc_1[6]  && colps_rd_q_full_1;
        colps_rd_q_cnt_1  = colps_rd_q_cnt_1 + colps_rd_q_loc_1[6];
      end
    end
   dram_Ch1_rd_colps_q_full <= colps_rd_q_full_1;
   dram_Ch1_rd_colps_q_cnt  <= colps_rd_q_cnt_1;

  end
end
reg dram_Ch2_rd_colps_q_full;
reg colps_rd_q_full_2;
reg [8:0] colps_rd_q_loc_2;
reg [3:0] dram_Ch2_rd_colps_q_cnt;
reg [3:0] colps_rd_q_cnt_2;
reg [2:0] colps_rd_indx_2;
reg       colps_rd_rst_vld_2;
always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch2_rd_colps_q_full <= 1'b0;
   dram_Ch2_rd_colps_q_cnt  <= 1'b0;
   end
  else
   begin 
    colps_rd_q_full_2 = 1;
    colps_rd_q_cnt_2 = 0;
    // extract the index for which the reset occured
    colps_rd_rst_vld_2   = 0;
    for (i=0;i<8;i=i+1) begin 
      if (dram_Ch2_rd_que_rd_ptr[i]) begin 
        colps_rd_indx_2 = i;
        colps_rd_rst_vld_2   = 1;
      end
    end
    for (i=0;i<8;i=i+1) begin 
     colps_rd_q_loc_2  = dram_Ch2_rd_colps_q[i];
      if (colps_rd_rst_vld_2 == 1) begin 
       if ((colps_rd_q_loc_2[5:3] != colps_rd_indx_2) || ~colps_rd_q_loc_2[6]) begin 
        colps_rd_q_full_2 = colps_rd_q_loc_2[6]  && colps_rd_q_full_2;
        colps_rd_q_cnt_2  = colps_rd_q_cnt_2 + colps_rd_q_loc_2[6];
       end
      end else begin 
        colps_rd_q_full_2 = colps_rd_q_loc_2[6]  && colps_rd_q_full_2;
        colps_rd_q_cnt_2  = colps_rd_q_cnt_2 + colps_rd_q_loc_2[6];
      end
    end
   dram_Ch2_rd_colps_q_full <= colps_rd_q_full_2;
   dram_Ch2_rd_colps_q_cnt  <= colps_rd_q_cnt_2;

  end
end
reg dram_Ch3_rd_colps_q_full;
reg colps_rd_q_full_3;
reg [8:0] colps_rd_q_loc_3;
reg [3:0] dram_Ch3_rd_colps_q_cnt;
reg [3:0] colps_rd_q_cnt_3;
reg [2:0] colps_rd_indx_3;
reg       colps_rd_rst_vld_3;
always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch3_rd_colps_q_full <= 1'b0;
   dram_Ch3_rd_colps_q_cnt  <= 1'b0;
   end
  else
   begin 
    colps_rd_q_full_3 = 1;
    colps_rd_q_cnt_3 = 0;
    // extract the index for which the reset occured
    colps_rd_rst_vld_3   = 0;
    for (i=0;i<8;i=i+1) begin 
      if (dram_Ch3_rd_que_rd_ptr[i]) begin 
        colps_rd_indx_3 = i;
        colps_rd_rst_vld_3   = 1;
      end
    end
    for (i=0;i<8;i=i+1) begin 
     colps_rd_q_loc_3  = dram_Ch3_rd_colps_q[i];
      if (colps_rd_rst_vld_3 == 1) begin 
       if ((colps_rd_q_loc_3[5:3] != colps_rd_indx_3) || ~colps_rd_q_loc_3[6]) begin 
        colps_rd_q_full_3 = colps_rd_q_loc_3[6]  && colps_rd_q_full_3;
        colps_rd_q_cnt_3  = colps_rd_q_cnt_3 + colps_rd_q_loc_3[6];
       end
      end else begin 
        colps_rd_q_full_3 = colps_rd_q_loc_3[6]  && colps_rd_q_full_3;
        colps_rd_q_cnt_3  = colps_rd_q_cnt_3 + colps_rd_q_loc_3[6];
      end
    end
   dram_Ch3_rd_colps_q_full <= colps_rd_q_full_3;
   dram_Ch3_rd_colps_q_cnt  <= colps_rd_q_cnt_3;

  end
end


// detecting rd q empty  
reg dram_Ch0_rd_q_empty;
reg rd_q_empty_0;
reg [39:0] rd_q_loc1_0;
always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch0_rd_q_empty <= 1'b0;
   end
  else
   begin 
    rd_q_empty_0 = 0;
    for (i=0;i<8;i=i+1) begin 
     rd_q_loc1_0  = dram_Ch0_rd_q[i];
     rd_q_empty_0 = rd_q_loc1_0[39] || rd_q_empty_0;
    end
   dram_Ch0_rd_q_empty <= ~rd_q_empty_0;

   end
end
reg dram_Ch1_rd_q_empty;
reg rd_q_empty_1;
reg [39:0] rd_q_loc1_1;
always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch1_rd_q_empty <= 1'b0;
   end
  else
   begin 
    rd_q_empty_1 = 0;
    for (i=0;i<8;i=i+1) begin 
     rd_q_loc1_1  = dram_Ch1_rd_q[i];
     rd_q_empty_1 = rd_q_loc1_1[39] || rd_q_empty_1;
    end
   dram_Ch1_rd_q_empty <= ~rd_q_empty_1;

   end
end
reg dram_Ch2_rd_q_empty;
reg rd_q_empty_2;
reg [39:0] rd_q_loc1_2;
always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch2_rd_q_empty <= 1'b0;
   end
  else
   begin 
    rd_q_empty_2 = 0;
    for (i=0;i<8;i=i+1) begin 
     rd_q_loc1_2  = dram_Ch2_rd_q[i];
     rd_q_empty_2 = rd_q_loc1_2[39] || rd_q_empty_2;
    end
   dram_Ch2_rd_q_empty <= ~rd_q_empty_2;

   end
end
reg dram_Ch3_rd_q_empty;
reg rd_q_empty_3;
reg [39:0] rd_q_loc1_3;
always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch3_rd_q_empty <= 1'b0;
   end
  else
   begin 
    rd_q_empty_3 = 0;
    for (i=0;i<8;i=i+1) begin 
     rd_q_loc1_3  = dram_Ch3_rd_q[i];
     rd_q_empty_3 = rd_q_loc1_3[39] || rd_q_empty_3;
    end
   dram_Ch3_rd_q_empty <= ~rd_q_empty_3;

   end
end

// detecting rd collapsing fifo empty
reg dram_Ch0_rd_colps_q_empty;
reg colps_rd_q_empty_0;
reg [8:0] colps_rd_q_loc1_0;
always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch0_rd_colps_q_empty <= 1'b0;
   end
  else
   begin 
    colps_rd_q_empty_0 = 0;
    for (i=0;i<8;i=i+1) begin 
     colps_rd_q_loc1_0  = dram_Ch0_rd_colps_q[i];
     colps_rd_q_empty_0 = colps_rd_q_loc1_0[6] || colps_rd_q_empty_0;
    end
   dram_Ch0_rd_colps_q_empty <= ~colps_rd_q_empty_0;
  end
end
reg dram_Ch1_rd_colps_q_empty;
reg colps_rd_q_empty_1;
reg [8:0] colps_rd_q_loc1_1;
always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch1_rd_colps_q_empty <= 1'b0;
   end
  else
   begin 
    colps_rd_q_empty_1 = 0;
    for (i=0;i<8;i=i+1) begin 
     colps_rd_q_loc1_1  = dram_Ch1_rd_colps_q[i];
     colps_rd_q_empty_1 = colps_rd_q_loc1_1[6] || colps_rd_q_empty_1;
    end
   dram_Ch1_rd_colps_q_empty <= ~colps_rd_q_empty_1;
  end
end
reg dram_Ch2_rd_colps_q_empty;
reg colps_rd_q_empty_2;
reg [8:0] colps_rd_q_loc1_2;
always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch2_rd_colps_q_empty <= 1'b0;
   end
  else
   begin 
    colps_rd_q_empty_2 = 0;
    for (i=0;i<8;i=i+1) begin 
     colps_rd_q_loc1_2  = dram_Ch2_rd_colps_q[i];
     colps_rd_q_empty_2 = colps_rd_q_loc1_2[6] || colps_rd_q_empty_2;
    end
   dram_Ch2_rd_colps_q_empty <= ~colps_rd_q_empty_2;
  end
end
reg dram_Ch3_rd_colps_q_empty;
reg colps_rd_q_empty_3;
reg [8:0] colps_rd_q_loc1_3;
always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch3_rd_colps_q_empty <= 1'b0;
   end
  else
   begin 
    colps_rd_q_empty_3 = 0;
    for (i=0;i<8;i=i+1) begin 
     colps_rd_q_loc1_3  = dram_Ch3_rd_colps_q[i];
     colps_rd_q_empty_3 = colps_rd_q_loc1_3[6] || colps_rd_q_empty_3;
    end
   dram_Ch3_rd_colps_q_empty <= ~colps_rd_q_empty_3;
  end
end

// cross between rd q and rd collapsing fifo
reg [2:0]  rd_index_0;
reg [2:0]  curr_index_0;
reg [39:0] rd_q_0;
reg [8:0] colps_rd_q_loc2_0;
always @(posedge clk)
begin
  if (~dram_rst_l)
   begin
   end

  else
   begin

    // collapsing fifo indexes to the read q. If there is no 
    // corresponding valid entry then error.
    for(i=0;i<8;i=i+1) begin 
      colps_rd_q_loc2_0  = dram_Ch0_rd_colps_q[i];
       if (colps_rd_q_loc2_0[6]) begin 
         rd_index_0 = colps_rd_q_loc2_0[5:3];
         rd_q_0     = dram_Ch0_rd_q[rd_index_0];
          if (rd_q_0[39] == 1'b0 ) begin
           $display("ERROR : In dram channel 0 ");
           finish_test("RD Q : No valid entry in RD Q for entry in collpsing rd fifo", 0);
          end 
       end
    end

    // all entries in the collapsing fifo should be unique
    for(i=0;i<8;i=i+1) begin 
      colps_rd_q_loc2_0  = dram_Ch0_rd_colps_q[i];
       if (colps_rd_q_loc2_0[6]) begin 
       curr_index_0 = colps_rd_q_loc2_0[5:3];
       for(j=i+1;j<8;j=j+1) begin 
         colps_rd_q_loc2_0  = dram_Ch0_rd_colps_q[j];
          if (colps_rd_q_loc2_0[6] && ( colps_rd_q_loc2_0[5:3] == curr_index_0)) begin
           $display("ERROR : In dram channel 0 ");
           finish_test(" RD Q : The valid entries in the read collapsing fifo are not unique ", 0);
          end 
       end
       end
    end
     
  end
end   
reg [2:0]  rd_index_1;
reg [2:0]  curr_index_1;
reg [39:0] rd_q_1;
reg [8:0] colps_rd_q_loc2_1;
always @(posedge clk)
begin
  if (~dram_rst_l)
   begin
   end

  else
   begin

    // collapsing fifo indexes to the read q. If there is no 
    // corresponding valid entry then error.
    for(i=0;i<8;i=i+1) begin 
      colps_rd_q_loc2_1  = dram_Ch1_rd_colps_q[i];
       if (colps_rd_q_loc2_1[6]) begin 
         rd_index_1 = colps_rd_q_loc2_1[5:3];
         rd_q_1     = dram_Ch1_rd_q[rd_index_1];
          if (rd_q_1[39] == 1'b0 ) begin
           $display("ERROR : In dram channel 1 ");
           finish_test("RD Q : No valid entry in RD Q for entry in collpsing rd fifo", 1);
          end 
       end
    end

    // all entries in the collapsing fifo should be unique
    for(i=0;i<8;i=i+1) begin 
      colps_rd_q_loc2_1  = dram_Ch1_rd_colps_q[i];
       if (colps_rd_q_loc2_1[6]) begin 
       curr_index_1 = colps_rd_q_loc2_1[5:3];
       for(j=i+1;j<8;j=j+1) begin 
         colps_rd_q_loc2_1  = dram_Ch1_rd_colps_q[j];
          if (colps_rd_q_loc2_1[6] && ( colps_rd_q_loc2_1[5:3] == curr_index_1)) begin
           $display("ERROR : In dram channel 1 ");
           finish_test(" RD Q : The valid entries in the read collapsing fifo are not unique ", 1);
          end 
       end
       end
    end
     
  end
end   
reg [2:0]  rd_index_2;
reg [2:0]  curr_index_2;
reg [39:0] rd_q_2;
reg [8:0] colps_rd_q_loc2_2;
always @(posedge clk)
begin
  if (~dram_rst_l)
   begin
   end

  else
   begin

    // collapsing fifo indexes to the read q. If there is no 
    // corresponding valid entry then error.
    for(i=0;i<8;i=i+1) begin 
      colps_rd_q_loc2_2  = dram_Ch2_rd_colps_q[i];
       if (colps_rd_q_loc2_2[6]) begin 
         rd_index_2 = colps_rd_q_loc2_2[5:3];
         rd_q_2     = dram_Ch2_rd_q[rd_index_2];
          if (rd_q_2[39] == 1'b0 ) begin
           $display("ERROR : In dram channel 2 ");
           finish_test("RD Q : No valid entry in RD Q for entry in collpsing rd fifo", 2);
          end 
       end
    end

    // all entries in the collapsing fifo should be unique
    for(i=0;i<8;i=i+1) begin 
      colps_rd_q_loc2_2  = dram_Ch2_rd_colps_q[i];
       if (colps_rd_q_loc2_2[6]) begin 
       curr_index_2 = colps_rd_q_loc2_2[5:3];
       for(j=i+1;j<8;j=j+1) begin 
         colps_rd_q_loc2_2  = dram_Ch2_rd_colps_q[j];
          if (colps_rd_q_loc2_2[6] && ( colps_rd_q_loc2_2[5:3] == curr_index_2)) begin
           $display("ERROR : In dram channel 2 ");
           finish_test(" RD Q : The valid entries in the read collapsing fifo are not unique ", 2);
          end 
       end
       end
    end
     
  end
end   
reg [2:0]  rd_index_3;
reg [2:0]  curr_index_3;
reg [39:0] rd_q_3;
reg [8:0] colps_rd_q_loc2_3;
always @(posedge clk)
begin
  if (~dram_rst_l)
   begin
   end

  else
   begin

    // collapsing fifo indexes to the read q. If there is no 
    // corresponding valid entry then error.
    for(i=0;i<8;i=i+1) begin 
      colps_rd_q_loc2_3  = dram_Ch3_rd_colps_q[i];
       if (colps_rd_q_loc2_3[6]) begin 
         rd_index_3 = colps_rd_q_loc2_3[5:3];
         rd_q_3     = dram_Ch3_rd_q[rd_index_3];
          if (rd_q_3[39] == 1'b0 ) begin
           $display("ERROR : In dram channel 3 ");
           finish_test("RD Q : No valid entry in RD Q for entry in collpsing rd fifo", 3);
          end 
       end
    end

    // all entries in the collapsing fifo should be unique
    for(i=0;i<8;i=i+1) begin 
      colps_rd_q_loc2_3  = dram_Ch3_rd_colps_q[i];
       if (colps_rd_q_loc2_3[6]) begin 
       curr_index_3 = colps_rd_q_loc2_3[5:3];
       for(j=i+1;j<8;j=j+1) begin 
         colps_rd_q_loc2_3  = dram_Ch3_rd_colps_q[j];
          if (colps_rd_q_loc2_3[6] && ( colps_rd_q_loc2_3[5:3] == curr_index_3)) begin
           $display("ERROR : In dram channel 3 ");
           finish_test(" RD Q : The valid entries in the read collapsing fifo are not unique ", 3);
          end 
       end
       end
    end
     
  end
end   

// This can actually happen. The ack should not be given if the fifo is full
// rd fifo full and write to read fifo
//.       for ( 4 = 0; 4 < 4; 4++ ) {
//always @( dram_Ch4_rd_colps_q_full or dram_Ch4_rd_q_full or dram_Ch4_rd_req )
//begin 
//if (dram_rst_l) begin 
// if ((dram_Ch4_rd_colps_q_full || dram_Ch4_rd_q_full) && dram_Ch4_rd_req)
//  begin 
//    $display("ERROR : In dram channel 4 ");
//    finish_test(" RD Q : Error Read Q full and writing into the Read Q ", 4);
//  end
//end
//end
//.}

// rd reqid in use and read with the same id
 reg [39:0] rd_q_loc2_0;
always @( posedge clk)
begin 
if (dram_rst_l) begin 
  if ( dram_Ch0_rd_req) begin 
    for(i=0;i<8;i=i+1) begin 
     rd_q_loc2_0  = dram_Ch0_rd_q[i];
      if ((rd_q_loc2_0[38:36] == dram_Ch0_rd_id) && rd_q_loc2_0[39]) begin 
        $display("ERROR : In dram channel 0 ");
        finish_test(" RD Q : Error Read Request ID in use and Rd with same ID issued ", 0);
      end
    end
  end
end
end

 reg [39:0] rd_q_loc2_1;
always @( posedge clk)
begin 
if (dram_rst_l) begin 
  if ( dram_Ch1_rd_req) begin 
    for(i=0;i<8;i=i+1) begin 
     rd_q_loc2_1  = dram_Ch1_rd_q[i];
      if ((rd_q_loc2_1[38:36] == dram_Ch1_rd_id) && rd_q_loc2_1[39]) begin 
        $display("ERROR : In dram channel 1 ");
        finish_test(" RD Q : Error Read Request ID in use and Rd with same ID issued ", 1);
      end
    end
  end
end
end

 reg [39:0] rd_q_loc2_2;
always @( posedge clk)
begin 
if (dram_rst_l) begin 
  if ( dram_Ch2_rd_req) begin 
    for(i=0;i<8;i=i+1) begin 
     rd_q_loc2_2  = dram_Ch2_rd_q[i];
      if ((rd_q_loc2_2[38:36] == dram_Ch2_rd_id) && rd_q_loc2_2[39]) begin 
        $display("ERROR : In dram channel 2 ");
        finish_test(" RD Q : Error Read Request ID in use and Rd with same ID issued ", 2);
      end
    end
  end
end
end

 reg [39:0] rd_q_loc2_3;
always @( posedge clk)
begin 
if (dram_rst_l) begin 
  if ( dram_Ch3_rd_req) begin 
    for(i=0;i<8;i=i+1) begin 
     rd_q_loc2_3  = dram_Ch3_rd_q[i];
      if ((rd_q_loc2_3[38:36] == dram_Ch3_rd_id) && rd_q_loc2_3[39]) begin 
        $display("ERROR : In dram channel 3 ");
        finish_test(" RD Q : Error Read Request ID in use and Rd with same ID issued ", 3);
      end
    end
  end
end
end



// count for rd q and collapsing fifo not same
always @( dram_Ch0_rd_colps_q_cnt or dram_Ch0_rd_q_cnt)
begin 
if (dram_rst_l) begin 
 if ( dram_Ch0_rd_colps_q_cnt != dram_Ch0_rd_q_cnt) 
  begin 
   $display("ERROR : In dram channel 0 ");
   finish_test(" RD Q :  Error Read Q and read collapse fifo entries count not same", 0);
  end
end
end
always @( dram_Ch1_rd_colps_q_cnt or dram_Ch1_rd_q_cnt)
begin 
if (dram_rst_l) begin 
 if ( dram_Ch1_rd_colps_q_cnt != dram_Ch1_rd_q_cnt) 
  begin 
   $display("ERROR : In dram channel 1 ");
   finish_test(" RD Q :  Error Read Q and read collapse fifo entries count not same", 1);
  end
end
end
always @( dram_Ch2_rd_colps_q_cnt or dram_Ch2_rd_q_cnt)
begin 
if (dram_rst_l) begin 
 if ( dram_Ch2_rd_colps_q_cnt != dram_Ch2_rd_q_cnt) 
  begin 
   $display("ERROR : In dram channel 2 ");
   finish_test(" RD Q :  Error Read Q and read collapse fifo entries count not same", 2);
  end
end
end
always @( dram_Ch3_rd_colps_q_cnt or dram_Ch3_rd_q_cnt)
begin 
if (dram_rst_l) begin 
 if ( dram_Ch3_rd_colps_q_cnt != dram_Ch3_rd_q_cnt) 
  begin 
   $display("ERROR : In dram channel 3 ");
   finish_test(" RD Q :  Error Read Q and read collapse fifo entries count not same", 3);
  end
end
end

// rd q valid and data written ( overwritting an existing entry )
 reg [39:0] rd_q_loc3_0;
always @( posedge clk)
//always @ (dram_Ch0_rd_que_wr_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    rd_q_loc3_0  = dram_Ch0_rd_q[i];
    if ((dram_Ch0_rd_que_wr_ptr[i] == 1'b1) && (rd_q_loc3_0[39] == 1'b1)) begin 
     $display("ERROR : In dram channel 0 ");
     finish_test(" RD Q :  Read Q : OverWriting to a valid RD Q location", 0);
    end  
  end
end
end
 reg [39:0] rd_q_loc3_1;
always @( posedge clk)
//always @ (dram_Ch1_rd_que_wr_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    rd_q_loc3_1  = dram_Ch1_rd_q[i];
    if ((dram_Ch1_rd_que_wr_ptr[i] == 1'b1) && (rd_q_loc3_1[39] == 1'b1)) begin 
     $display("ERROR : In dram channel 1 ");
     finish_test(" RD Q :  Read Q : OverWriting to a valid RD Q location", 1);
    end  
  end
end
end
 reg [39:0] rd_q_loc3_2;
always @( posedge clk)
//always @ (dram_Ch2_rd_que_wr_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    rd_q_loc3_2  = dram_Ch2_rd_q[i];
    if ((dram_Ch2_rd_que_wr_ptr[i] == 1'b1) && (rd_q_loc3_2[39] == 1'b1)) begin 
     $display("ERROR : In dram channel 2 ");
     finish_test(" RD Q :  Read Q : OverWriting to a valid RD Q location", 2);
    end  
  end
end
end
 reg [39:0] rd_q_loc3_3;
always @( posedge clk)
//always @ (dram_Ch3_rd_que_wr_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    rd_q_loc3_3  = dram_Ch3_rd_q[i];
    if ((dram_Ch3_rd_que_wr_ptr[i] == 1'b1) && (rd_q_loc3_3[39] == 1'b1)) begin 
     $display("ERROR : In dram channel 3 ");
     finish_test(" RD Q :  Read Q : OverWriting to a valid RD Q location", 3);
    end  
  end
end
end

// rd q not valid and data read ( rd_ptr for rd que asserted ) 
 reg [39:0] rd_q_loc4_0;
always @( posedge clk)
//always @ (dram_Ch0_rd_que_rd_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    rd_q_loc4_0  = dram_Ch0_rd_q[i];
    if ((dram_Ch0_rd_que_rd_ptr[i] == 1'b1) && (rd_q_loc4_0[39] == 1'b0)) begin 
     $display("ERROR : In dram channel 0 ");
     finish_test(" RD Q :  Clearing a RD Q location which is not valid", 0);
    end  
  end
end
end
 reg [39:0] rd_q_loc4_1;
always @( posedge clk)
//always @ (dram_Ch1_rd_que_rd_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    rd_q_loc4_1  = dram_Ch1_rd_q[i];
    if ((dram_Ch1_rd_que_rd_ptr[i] == 1'b1) && (rd_q_loc4_1[39] == 1'b0)) begin 
     $display("ERROR : In dram channel 1 ");
     finish_test(" RD Q :  Clearing a RD Q location which is not valid", 1);
    end  
  end
end
end
 reg [39:0] rd_q_loc4_2;
always @( posedge clk)
//always @ (dram_Ch2_rd_que_rd_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    rd_q_loc4_2  = dram_Ch2_rd_q[i];
    if ((dram_Ch2_rd_que_rd_ptr[i] == 1'b1) && (rd_q_loc4_2[39] == 1'b0)) begin 
     $display("ERROR : In dram channel 2 ");
     finish_test(" RD Q :  Clearing a RD Q location which is not valid", 2);
    end  
  end
end
end
 reg [39:0] rd_q_loc4_3;
always @( posedge clk)
//always @ (dram_Ch3_rd_que_rd_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    rd_q_loc4_3  = dram_Ch3_rd_q[i];
    if ((dram_Ch3_rd_que_rd_ptr[i] == 1'b1) && (rd_q_loc4_3[39] == 1'b0)) begin 
     $display("ERROR : In dram channel 3 ");
     finish_test(" RD Q :  Clearing a RD Q location which is not valid", 3);
    end  
  end
end
end


// Monitor allocation and deallocation time for each entry in the rd q
 reg [39:0] rd_q_loc5_0;
reg [10:0]  dram_Ch0_rd_q_cntr [7:0];
wire [10:0] dram_Ch0_rd_q_cntr_0 = dram_Ch0_rd_q_cntr[0];
wire [10:0] dram_Ch0_rd_q_cntr_1 = dram_Ch0_rd_q_cntr[1];
wire [10:0] dram_Ch0_rd_q_cntr_2 = dram_Ch0_rd_q_cntr[2];
wire [10:0] dram_Ch0_rd_q_cntr_3 = dram_Ch0_rd_q_cntr[3];
wire [10:0] dram_Ch0_rd_q_cntr_4 = dram_Ch0_rd_q_cntr[4];
wire [10:0] dram_Ch0_rd_q_cntr_5 = dram_Ch0_rd_q_cntr[5];
wire [10:0] dram_Ch0_rd_q_cntr_6 = dram_Ch0_rd_q_cntr[6];
wire [10:0] dram_Ch0_rd_q_cntr_7 = dram_Ch0_rd_q_cntr[7];

reg [10:0] dram_Ch0_rd_q_cnt_max;
reg [2:0]  dram_Ch0_rd_q_cnt_max_entry;

 reg [40:0] wr_q_loc7_0;
always @ (posedge clk)
begin 
  if (~dram_rst_l)
   begin
       dram_Ch0_rd_q_cnt_max = 0;
       dram_Ch0_rd_q_cnt_max_entry = 0;
     for(i=0;i<8;i=i+1) begin 
       dram_Ch0_rd_q_cntr[i] = 0;
     end
   end
  else
   begin
    if (dram_Ch0_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      rd_q_loc5_0  = dram_Ch0_rd_q[i];
      dram_Ch0_rd_q_cntr[i] <= (rd_q_loc5_0[39] == 1'b1) ? dram_Ch0_rd_q_cntr[i] + 1 : 0;
       if ( dram_Ch0_rd_q_cntr[i] > dram_Ch0_rd_q_cnt_max ) begin 
         dram_Ch0_rd_q_cnt_max = dram_Ch0_rd_q_cntr[i];
         dram_Ch0_rd_q_cnt_max_entry = i;
       end
       if ( dram_Ch0_rd_q_cntr[i] > MAX_TIME ) begin 
         $display("ERROR : In dram channel 0 ");
         finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 0);
       end  
     end
    end
   end
end
 reg [39:0] rd_q_loc5_1;
reg [10:0]  dram_Ch1_rd_q_cntr [7:0];
wire [10:0] dram_Ch1_rd_q_cntr_0 = dram_Ch1_rd_q_cntr[0];
wire [10:0] dram_Ch1_rd_q_cntr_1 = dram_Ch1_rd_q_cntr[1];
wire [10:0] dram_Ch1_rd_q_cntr_2 = dram_Ch1_rd_q_cntr[2];
wire [10:0] dram_Ch1_rd_q_cntr_3 = dram_Ch1_rd_q_cntr[3];
wire [10:0] dram_Ch1_rd_q_cntr_4 = dram_Ch1_rd_q_cntr[4];
wire [10:0] dram_Ch1_rd_q_cntr_5 = dram_Ch1_rd_q_cntr[5];
wire [10:0] dram_Ch1_rd_q_cntr_6 = dram_Ch1_rd_q_cntr[6];
wire [10:0] dram_Ch1_rd_q_cntr_7 = dram_Ch1_rd_q_cntr[7];

reg [10:0] dram_Ch1_rd_q_cnt_max;
reg [2:0]  dram_Ch1_rd_q_cnt_max_entry;

 reg [40:0] wr_q_loc7_1;
always @ (posedge clk)
begin 
  if (~dram_rst_l)
   begin
       dram_Ch1_rd_q_cnt_max = 0;
       dram_Ch1_rd_q_cnt_max_entry = 0;
     for(i=0;i<8;i=i+1) begin 
       dram_Ch1_rd_q_cntr[i] = 0;
     end
   end
  else
   begin
    if (dram_Ch1_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      rd_q_loc5_1  = dram_Ch1_rd_q[i];
      dram_Ch1_rd_q_cntr[i] <= (rd_q_loc5_1[39] == 1'b1) ? dram_Ch1_rd_q_cntr[i] + 1 : 0;
       if ( dram_Ch1_rd_q_cntr[i] > dram_Ch1_rd_q_cnt_max ) begin 
         dram_Ch1_rd_q_cnt_max = dram_Ch1_rd_q_cntr[i];
         dram_Ch1_rd_q_cnt_max_entry = i;
       end
       if ( dram_Ch1_rd_q_cntr[i] > MAX_TIME ) begin 
         $display("ERROR : In dram channel 1 ");
         finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 1);
       end  
     end
    end
   end
end
 reg [39:0] rd_q_loc5_2;
reg [10:0]  dram_Ch2_rd_q_cntr [7:0];
wire [10:0] dram_Ch2_rd_q_cntr_0 = dram_Ch2_rd_q_cntr[0];
wire [10:0] dram_Ch2_rd_q_cntr_1 = dram_Ch2_rd_q_cntr[1];
wire [10:0] dram_Ch2_rd_q_cntr_2 = dram_Ch2_rd_q_cntr[2];
wire [10:0] dram_Ch2_rd_q_cntr_3 = dram_Ch2_rd_q_cntr[3];
wire [10:0] dram_Ch2_rd_q_cntr_4 = dram_Ch2_rd_q_cntr[4];
wire [10:0] dram_Ch2_rd_q_cntr_5 = dram_Ch2_rd_q_cntr[5];
wire [10:0] dram_Ch2_rd_q_cntr_6 = dram_Ch2_rd_q_cntr[6];
wire [10:0] dram_Ch2_rd_q_cntr_7 = dram_Ch2_rd_q_cntr[7];

reg [10:0] dram_Ch2_rd_q_cnt_max;
reg [2:0]  dram_Ch2_rd_q_cnt_max_entry;

 reg [40:0] wr_q_loc7_2;
always @ (posedge clk)
begin 
  if (~dram_rst_l)
   begin
       dram_Ch2_rd_q_cnt_max = 0;
       dram_Ch2_rd_q_cnt_max_entry = 0;
     for(i=0;i<8;i=i+1) begin 
       dram_Ch2_rd_q_cntr[i] = 0;
     end
   end
  else
   begin
    if (dram_Ch2_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      rd_q_loc5_2  = dram_Ch2_rd_q[i];
      dram_Ch2_rd_q_cntr[i] <= (rd_q_loc5_2[39] == 1'b1) ? dram_Ch2_rd_q_cntr[i] + 1 : 0;
       if ( dram_Ch2_rd_q_cntr[i] > dram_Ch2_rd_q_cnt_max ) begin 
         dram_Ch2_rd_q_cnt_max = dram_Ch2_rd_q_cntr[i];
         dram_Ch2_rd_q_cnt_max_entry = i;
       end
       if ( dram_Ch2_rd_q_cntr[i] > MAX_TIME ) begin 
         $display("ERROR : In dram channel 2 ");
         finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 2);
       end  
     end
    end
   end
end
 reg [39:0] rd_q_loc5_3;
reg [10:0]  dram_Ch3_rd_q_cntr [7:0];
wire [10:0] dram_Ch3_rd_q_cntr_0 = dram_Ch3_rd_q_cntr[0];
wire [10:0] dram_Ch3_rd_q_cntr_1 = dram_Ch3_rd_q_cntr[1];
wire [10:0] dram_Ch3_rd_q_cntr_2 = dram_Ch3_rd_q_cntr[2];
wire [10:0] dram_Ch3_rd_q_cntr_3 = dram_Ch3_rd_q_cntr[3];
wire [10:0] dram_Ch3_rd_q_cntr_4 = dram_Ch3_rd_q_cntr[4];
wire [10:0] dram_Ch3_rd_q_cntr_5 = dram_Ch3_rd_q_cntr[5];
wire [10:0] dram_Ch3_rd_q_cntr_6 = dram_Ch3_rd_q_cntr[6];
wire [10:0] dram_Ch3_rd_q_cntr_7 = dram_Ch3_rd_q_cntr[7];

reg [10:0] dram_Ch3_rd_q_cnt_max;
reg [2:0]  dram_Ch3_rd_q_cnt_max_entry;

 reg [40:0] wr_q_loc7_3;
always @ (posedge clk)
begin 
  if (~dram_rst_l)
   begin
       dram_Ch3_rd_q_cnt_max = 0;
       dram_Ch3_rd_q_cnt_max_entry = 0;
     for(i=0;i<8;i=i+1) begin 
       dram_Ch3_rd_q_cntr[i] = 0;
     end
   end
  else
   begin
    if (dram_Ch3_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      rd_q_loc5_3  = dram_Ch3_rd_q[i];
      dram_Ch3_rd_q_cntr[i] <= (rd_q_loc5_3[39] == 1'b1) ? dram_Ch3_rd_q_cntr[i] + 1 : 0;
       if ( dram_Ch3_rd_q_cntr[i] > dram_Ch3_rd_q_cnt_max ) begin 
         dram_Ch3_rd_q_cnt_max = dram_Ch3_rd_q_cntr[i];
         dram_Ch3_rd_q_cnt_max_entry = i;
       end
       if ( dram_Ch3_rd_q_cntr[i] > MAX_TIME ) begin 
         $display("ERROR : In dram channel 3 ");
         finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 3);
       end  
     end
    end
   end
end

// Monitor a case when the rd_req comes when the queue is full.
// Then q goes from full to not full and that read is taken.

reg [1:0] dram_rd_req_q_full_Ch0_rd_taken_state;
wire      dram_rd_q_full_Ch0_l2 = ((&dram_Ch0_l2if_b0_rd_val) && (&dram_Ch0_l2if_b1_rd_val));
always @ (posedge cmp_clk)
begin
  if (~cmp_rst_l)
   begin
    dram_rd_req_q_full_Ch0_rd_taken_state <= 2'b00;
   end
  else
   begin

   case(dram_rd_req_q_full_Ch0_rd_taken_state)
    2'b00 : begin 
               if (dram_Ch0_sctag_dram_rd_req && dram_rd_q_full_Ch0_l2)
                 dram_rd_req_q_full_Ch0_rd_taken_state <= 2'b01;
              end
    2'b01 : begin 
               if (dram_Ch0_sctag_dram_rd_req && ~dram_rd_q_full_Ch0_l2)
                 dram_rd_req_q_full_Ch0_rd_taken_state <= 2'b10;
              end
    2'b10 : begin 
               if (~dram_Ch0_sctag_dram_rd_req)
                 dram_rd_req_q_full_Ch0_rd_taken_state <= 2'b11;
              end
    2'b11 : begin 
                 dram_rd_req_q_full_Ch0_rd_taken_state <= 2'b00;
              end
    default : begin 
                 dram_rd_req_q_full_Ch0_rd_taken_state <= 2'b00;
              end

   endcase
  end 
end
reg [1:0] dram_rd_req_q_full_Ch1_rd_taken_state;
wire      dram_rd_q_full_Ch1_l2 = ((&dram_Ch1_l2if_b0_rd_val) && (&dram_Ch1_l2if_b1_rd_val));
always @ (posedge cmp_clk)
begin
  if (~cmp_rst_l)
   begin
    dram_rd_req_q_full_Ch1_rd_taken_state <= 2'b00;
   end
  else
   begin

   case(dram_rd_req_q_full_Ch1_rd_taken_state)
    2'b00 : begin 
               if (dram_Ch1_sctag_dram_rd_req && dram_rd_q_full_Ch1_l2)
                 dram_rd_req_q_full_Ch1_rd_taken_state <= 2'b01;
              end
    2'b01 : begin 
               if (dram_Ch1_sctag_dram_rd_req && ~dram_rd_q_full_Ch1_l2)
                 dram_rd_req_q_full_Ch1_rd_taken_state <= 2'b10;
              end
    2'b10 : begin 
               if (~dram_Ch1_sctag_dram_rd_req)
                 dram_rd_req_q_full_Ch1_rd_taken_state <= 2'b11;
              end
    2'b11 : begin 
                 dram_rd_req_q_full_Ch1_rd_taken_state <= 2'b00;
              end
    default : begin 
                 dram_rd_req_q_full_Ch1_rd_taken_state <= 2'b00;
              end

   endcase
  end 
end
reg [1:0] dram_rd_req_q_full_Ch2_rd_taken_state;
wire      dram_rd_q_full_Ch2_l2 = ((&dram_Ch2_l2if_b0_rd_val) && (&dram_Ch2_l2if_b1_rd_val));
always @ (posedge cmp_clk)
begin
  if (~cmp_rst_l)
   begin
    dram_rd_req_q_full_Ch2_rd_taken_state <= 2'b00;
   end
  else
   begin

   case(dram_rd_req_q_full_Ch2_rd_taken_state)
    2'b00 : begin 
               if (dram_Ch2_sctag_dram_rd_req && dram_rd_q_full_Ch2_l2)
                 dram_rd_req_q_full_Ch2_rd_taken_state <= 2'b01;
              end
    2'b01 : begin 
               if (dram_Ch2_sctag_dram_rd_req && ~dram_rd_q_full_Ch2_l2)
                 dram_rd_req_q_full_Ch2_rd_taken_state <= 2'b10;
              end
    2'b10 : begin 
               if (~dram_Ch2_sctag_dram_rd_req)
                 dram_rd_req_q_full_Ch2_rd_taken_state <= 2'b11;
              end
    2'b11 : begin 
                 dram_rd_req_q_full_Ch2_rd_taken_state <= 2'b00;
              end
    default : begin 
                 dram_rd_req_q_full_Ch2_rd_taken_state <= 2'b00;
              end

   endcase
  end 
end
reg [1:0] dram_rd_req_q_full_Ch3_rd_taken_state;
wire      dram_rd_q_full_Ch3_l2 = ((&dram_Ch3_l2if_b0_rd_val) && (&dram_Ch3_l2if_b1_rd_val));
always @ (posedge cmp_clk)
begin
  if (~cmp_rst_l)
   begin
    dram_rd_req_q_full_Ch3_rd_taken_state <= 2'b00;
   end
  else
   begin

   case(dram_rd_req_q_full_Ch3_rd_taken_state)
    2'b00 : begin 
               if (dram_Ch3_sctag_dram_rd_req && dram_rd_q_full_Ch3_l2)
                 dram_rd_req_q_full_Ch3_rd_taken_state <= 2'b01;
              end
    2'b01 : begin 
               if (dram_Ch3_sctag_dram_rd_req && ~dram_rd_q_full_Ch3_l2)
                 dram_rd_req_q_full_Ch3_rd_taken_state <= 2'b10;
              end
    2'b10 : begin 
               if (~dram_Ch3_sctag_dram_rd_req)
                 dram_rd_req_q_full_Ch3_rd_taken_state <= 2'b11;
              end
    2'b11 : begin 
                 dram_rd_req_q_full_Ch3_rd_taken_state <= 2'b00;
              end
    default : begin 
                 dram_rd_req_q_full_Ch3_rd_taken_state <= 2'b00;
              end

   endcase
  end 
end



//=====================================================================
// WRITE Q
//=====================================================================

// detecting wr q full  
reg dram_Ch0_wr_q_full;
reg dram_Ch0_wr_q_full_arb;
reg [3:0]  dram_Ch0_wr_q_cnt;
reg [3:0]  dram_Ch0_wr_q_cnt_arb;
reg wr_q_full_0;
reg wr_q_full_0_arb;
reg [40:0] wr_q_loc_0;
reg [3:0]  wr_q_cnt_0;
reg [3:0]  wr_q_cnt_0_arb;

always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
    dram_Ch0_wr_q_full     <= 1'b0;
    dram_Ch0_wr_q_full_arb <= 1'b0;
    dram_Ch0_wr_q_cnt      <= 4'b0;
    dram_Ch0_wr_q_cnt_arb  <= 4'b0;
   end
  else
   begin 
    wr_q_full_0 = 1;
    wr_q_full_0_arb = 1;
    wr_q_cnt_0  = 0;
    wr_q_cnt_0_arb  = 0;
    for (i=0;i<8;i=i+1) begin 
     wr_q_loc_0  = dram_Ch0_wr_q[i];
     wr_q_full_0 = wr_q_loc_0[40] && wr_q_full_0;
     //wr_q_full_0_arb = (wr_q_loc_0[39] && !dram_Ch0_wr_que_rd_ptr_arb[i]) && wr_q_full_0_arb;
     wr_q_full_0_arb = (wr_q_loc_0[39] && wr_q_full_0_arb);
     wr_q_cnt_0  =  wr_q_cnt_0 + wr_q_loc_0[40];
     wr_q_cnt_0_arb  =  wr_q_cnt_0_arb + (wr_q_loc_0[39] && !dram_Ch0_wr_que_rd_ptr_arb[i]);
    end
   dram_Ch0_wr_q_full     <= wr_q_full_0;
   dram_Ch0_wr_q_full_arb <= wr_q_full_0_arb;
   dram_Ch0_wr_q_cnt      <= wr_q_cnt_0;
   dram_Ch0_wr_q_cnt_arb  <= wr_q_cnt_0_arb;
   end
end
reg dram_Ch1_wr_q_full;
reg dram_Ch1_wr_q_full_arb;
reg [3:0]  dram_Ch1_wr_q_cnt;
reg [3:0]  dram_Ch1_wr_q_cnt_arb;
reg wr_q_full_1;
reg wr_q_full_1_arb;
reg [40:0] wr_q_loc_1;
reg [3:0]  wr_q_cnt_1;
reg [3:0]  wr_q_cnt_1_arb;

always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
    dram_Ch1_wr_q_full     <= 1'b0;
    dram_Ch1_wr_q_full_arb <= 1'b0;
    dram_Ch1_wr_q_cnt      <= 4'b0;
    dram_Ch1_wr_q_cnt_arb  <= 4'b0;
   end
  else
   begin 
    wr_q_full_1 = 1;
    wr_q_full_1_arb = 1;
    wr_q_cnt_1  = 0;
    wr_q_cnt_1_arb  = 0;
    for (i=0;i<8;i=i+1) begin 
     wr_q_loc_1  = dram_Ch1_wr_q[i];
     wr_q_full_1 = wr_q_loc_1[40] && wr_q_full_1;
     //wr_q_full_1_arb = (wr_q_loc_1[39] && !dram_Ch1_wr_que_rd_ptr_arb[i]) && wr_q_full_1_arb;
     wr_q_full_1_arb = (wr_q_loc_1[39] && wr_q_full_1_arb);
     wr_q_cnt_1  =  wr_q_cnt_1 + wr_q_loc_1[40];
     wr_q_cnt_1_arb  =  wr_q_cnt_1_arb + (wr_q_loc_1[39] && !dram_Ch1_wr_que_rd_ptr_arb[i]);
    end
   dram_Ch1_wr_q_full     <= wr_q_full_1;
   dram_Ch1_wr_q_full_arb <= wr_q_full_1_arb;
   dram_Ch1_wr_q_cnt      <= wr_q_cnt_1;
   dram_Ch1_wr_q_cnt_arb  <= wr_q_cnt_1_arb;
   end
end
reg dram_Ch2_wr_q_full;
reg dram_Ch2_wr_q_full_arb;
reg [3:0]  dram_Ch2_wr_q_cnt;
reg [3:0]  dram_Ch2_wr_q_cnt_arb;
reg wr_q_full_2;
reg wr_q_full_2_arb;
reg [40:0] wr_q_loc_2;
reg [3:0]  wr_q_cnt_2;
reg [3:0]  wr_q_cnt_2_arb;

always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
    dram_Ch2_wr_q_full     <= 1'b0;
    dram_Ch2_wr_q_full_arb <= 1'b0;
    dram_Ch2_wr_q_cnt      <= 4'b0;
    dram_Ch2_wr_q_cnt_arb  <= 4'b0;
   end
  else
   begin 
    wr_q_full_2 = 1;
    wr_q_full_2_arb = 1;
    wr_q_cnt_2  = 0;
    wr_q_cnt_2_arb  = 0;
    for (i=0;i<8;i=i+1) begin 
     wr_q_loc_2  = dram_Ch2_wr_q[i];
     wr_q_full_2 = wr_q_loc_2[40] && wr_q_full_2;
     //wr_q_full_2_arb = (wr_q_loc_2[39] && !dram_Ch2_wr_que_rd_ptr_arb[i]) && wr_q_full_2_arb;
     wr_q_full_2_arb = (wr_q_loc_2[39] && wr_q_full_2_arb);
     wr_q_cnt_2  =  wr_q_cnt_2 + wr_q_loc_2[40];
     wr_q_cnt_2_arb  =  wr_q_cnt_2_arb + (wr_q_loc_2[39] && !dram_Ch2_wr_que_rd_ptr_arb[i]);
    end
   dram_Ch2_wr_q_full     <= wr_q_full_2;
   dram_Ch2_wr_q_full_arb <= wr_q_full_2_arb;
   dram_Ch2_wr_q_cnt      <= wr_q_cnt_2;
   dram_Ch2_wr_q_cnt_arb  <= wr_q_cnt_2_arb;
   end
end
reg dram_Ch3_wr_q_full;
reg dram_Ch3_wr_q_full_arb;
reg [3:0]  dram_Ch3_wr_q_cnt;
reg [3:0]  dram_Ch3_wr_q_cnt_arb;
reg wr_q_full_3;
reg wr_q_full_3_arb;
reg [40:0] wr_q_loc_3;
reg [3:0]  wr_q_cnt_3;
reg [3:0]  wr_q_cnt_3_arb;

always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
    dram_Ch3_wr_q_full     <= 1'b0;
    dram_Ch3_wr_q_full_arb <= 1'b0;
    dram_Ch3_wr_q_cnt      <= 4'b0;
    dram_Ch3_wr_q_cnt_arb  <= 4'b0;
   end
  else
   begin 
    wr_q_full_3 = 1;
    wr_q_full_3_arb = 1;
    wr_q_cnt_3  = 0;
    wr_q_cnt_3_arb  = 0;
    for (i=0;i<8;i=i+1) begin 
     wr_q_loc_3  = dram_Ch3_wr_q[i];
     wr_q_full_3 = wr_q_loc_3[40] && wr_q_full_3;
     //wr_q_full_3_arb = (wr_q_loc_3[39] && !dram_Ch3_wr_que_rd_ptr_arb[i]) && wr_q_full_3_arb;
     wr_q_full_3_arb = (wr_q_loc_3[39] && wr_q_full_3_arb);
     wr_q_cnt_3  =  wr_q_cnt_3 + wr_q_loc_3[40];
     wr_q_cnt_3_arb  =  wr_q_cnt_3_arb + (wr_q_loc_3[39] && !dram_Ch3_wr_que_rd_ptr_arb[i]);
    end
   dram_Ch3_wr_q_full     <= wr_q_full_3;
   dram_Ch3_wr_q_full_arb <= wr_q_full_3_arb;
   dram_Ch3_wr_q_cnt      <= wr_q_cnt_3;
   dram_Ch3_wr_q_cnt_arb  <= wr_q_cnt_3_arb;
   end
end

// Wr Q latency counting 

reg [31:0]  dram_Ch0_wr_q_lat;
wire [33:0]  dram_Ch0_rd_n_wr_q_lat;
always @(posedge clk)
begin
  if (dram_Ch0_que_init_dram_done)
   begin
    dram_Ch0_wr_q_lat  <= dram_Ch0_wr_q_lat + dram_Ch0_wr_q_cnt_arb;
   end else begin 
    dram_Ch0_wr_q_lat  <= 4'b0;
  end
end

assign  dram_Ch0_rd_n_wr_q_lat =  dram_Ch0_rd_q_lat +  dram_Ch0_wr_q_lat;
reg [31:0]  dram_Ch1_wr_q_lat;
wire [33:0]  dram_Ch1_rd_n_wr_q_lat;
always @(posedge clk)
begin
  if (dram_Ch1_que_init_dram_done)
   begin
    dram_Ch1_wr_q_lat  <= dram_Ch1_wr_q_lat + dram_Ch1_wr_q_cnt_arb;
   end else begin 
    dram_Ch1_wr_q_lat  <= 4'b0;
  end
end

assign  dram_Ch1_rd_n_wr_q_lat =  dram_Ch1_rd_q_lat +  dram_Ch1_wr_q_lat;
reg [31:0]  dram_Ch2_wr_q_lat;
wire [33:0]  dram_Ch2_rd_n_wr_q_lat;
always @(posedge clk)
begin
  if (dram_Ch2_que_init_dram_done)
   begin
    dram_Ch2_wr_q_lat  <= dram_Ch2_wr_q_lat + dram_Ch2_wr_q_cnt_arb;
   end else begin 
    dram_Ch2_wr_q_lat  <= 4'b0;
  end
end

assign  dram_Ch2_rd_n_wr_q_lat =  dram_Ch2_rd_q_lat +  dram_Ch2_wr_q_lat;
reg [31:0]  dram_Ch3_wr_q_lat;
wire [33:0]  dram_Ch3_rd_n_wr_q_lat;
always @(posedge clk)
begin
  if (dram_Ch3_que_init_dram_done)
   begin
    dram_Ch3_wr_q_lat  <= dram_Ch3_wr_q_lat + dram_Ch3_wr_q_cnt_arb;
   end else begin 
    dram_Ch3_wr_q_lat  <= 4'b0;
  end
end

assign  dram_Ch3_rd_n_wr_q_lat =  dram_Ch3_rd_q_lat +  dram_Ch3_wr_q_lat;

// detecting wr collapsing fifo full
reg dram_Ch0_wr_colps_q_full;
reg colps_wr_q_full_0;
reg [8:0] colps_wr_q_loc_0;
reg [3:0] dram_Ch0_wr_colps_q_cnt;
reg [3:0] colps_wr_q_cnt_0;
reg [2:0] colps_wr_indx_0;
reg       colps_wr_rst_vld_0;
always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch0_wr_colps_q_full <= 1'b0;
   dram_Ch0_wr_colps_q_cnt  <= 1'b0;
   end
  else
   begin 
    colps_wr_q_full_0 = 1;
    colps_wr_q_cnt_0 = 0;

    // extract the index for which the reset occured
    colps_wr_rst_vld_0   = 0;
    for (i=0;i<8;i=i+1) begin
      if (dram_Ch0_wr_que_rd_ptr_arb[i]) begin
        colps_wr_indx_0 = i;
        colps_wr_rst_vld_0   = 1;
      end
    end
    for (i=0;i<8;i=i+1) begin
     colps_wr_q_loc_0  = dram_Ch0_wr_colps_q[i];
      if (colps_wr_rst_vld_0 == 1) begin
       if ((colps_wr_q_loc_0[5:3] != colps_wr_indx_0) || ~colps_wr_q_loc_0[6]) begin
        colps_wr_q_full_0 = colps_wr_q_loc_0[6]  && colps_wr_q_full_0;
        colps_wr_q_cnt_0  = colps_wr_q_cnt_0 + colps_wr_q_loc_0[6];
       end
      end else begin
        colps_wr_q_full_0 = colps_wr_q_loc_0[6]  && colps_wr_q_full_0;
        colps_wr_q_cnt_0  = colps_wr_q_cnt_0 + colps_wr_q_loc_0[6];
      end
    end

   dram_Ch0_wr_colps_q_full <= colps_wr_q_full_0;
   dram_Ch0_wr_colps_q_cnt  <= colps_wr_q_cnt_0;

   end
end
reg dram_Ch1_wr_colps_q_full;
reg colps_wr_q_full_1;
reg [8:0] colps_wr_q_loc_1;
reg [3:0] dram_Ch1_wr_colps_q_cnt;
reg [3:0] colps_wr_q_cnt_1;
reg [2:0] colps_wr_indx_1;
reg       colps_wr_rst_vld_1;
always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch1_wr_colps_q_full <= 1'b0;
   dram_Ch1_wr_colps_q_cnt  <= 1'b0;
   end
  else
   begin 
    colps_wr_q_full_1 = 1;
    colps_wr_q_cnt_1 = 0;

    // extract the index for which the reset occured
    colps_wr_rst_vld_1   = 0;
    for (i=0;i<8;i=i+1) begin
      if (dram_Ch1_wr_que_rd_ptr_arb[i]) begin
        colps_wr_indx_1 = i;
        colps_wr_rst_vld_1   = 1;
      end
    end
    for (i=0;i<8;i=i+1) begin
     colps_wr_q_loc_1  = dram_Ch1_wr_colps_q[i];
      if (colps_wr_rst_vld_1 == 1) begin
       if ((colps_wr_q_loc_1[5:3] != colps_wr_indx_1) || ~colps_wr_q_loc_1[6]) begin
        colps_wr_q_full_1 = colps_wr_q_loc_1[6]  && colps_wr_q_full_1;
        colps_wr_q_cnt_1  = colps_wr_q_cnt_1 + colps_wr_q_loc_1[6];
       end
      end else begin
        colps_wr_q_full_1 = colps_wr_q_loc_1[6]  && colps_wr_q_full_1;
        colps_wr_q_cnt_1  = colps_wr_q_cnt_1 + colps_wr_q_loc_1[6];
      end
    end

   dram_Ch1_wr_colps_q_full <= colps_wr_q_full_1;
   dram_Ch1_wr_colps_q_cnt  <= colps_wr_q_cnt_1;

   end
end
reg dram_Ch2_wr_colps_q_full;
reg colps_wr_q_full_2;
reg [8:0] colps_wr_q_loc_2;
reg [3:0] dram_Ch2_wr_colps_q_cnt;
reg [3:0] colps_wr_q_cnt_2;
reg [2:0] colps_wr_indx_2;
reg       colps_wr_rst_vld_2;
always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch2_wr_colps_q_full <= 1'b0;
   dram_Ch2_wr_colps_q_cnt  <= 1'b0;
   end
  else
   begin 
    colps_wr_q_full_2 = 1;
    colps_wr_q_cnt_2 = 0;

    // extract the index for which the reset occured
    colps_wr_rst_vld_2   = 0;
    for (i=0;i<8;i=i+1) begin
      if (dram_Ch2_wr_que_rd_ptr_arb[i]) begin
        colps_wr_indx_2 = i;
        colps_wr_rst_vld_2   = 1;
      end
    end
    for (i=0;i<8;i=i+1) begin
     colps_wr_q_loc_2  = dram_Ch2_wr_colps_q[i];
      if (colps_wr_rst_vld_2 == 1) begin
       if ((colps_wr_q_loc_2[5:3] != colps_wr_indx_2) || ~colps_wr_q_loc_2[6]) begin
        colps_wr_q_full_2 = colps_wr_q_loc_2[6]  && colps_wr_q_full_2;
        colps_wr_q_cnt_2  = colps_wr_q_cnt_2 + colps_wr_q_loc_2[6];
       end
      end else begin
        colps_wr_q_full_2 = colps_wr_q_loc_2[6]  && colps_wr_q_full_2;
        colps_wr_q_cnt_2  = colps_wr_q_cnt_2 + colps_wr_q_loc_2[6];
      end
    end

   dram_Ch2_wr_colps_q_full <= colps_wr_q_full_2;
   dram_Ch2_wr_colps_q_cnt  <= colps_wr_q_cnt_2;

   end
end
reg dram_Ch3_wr_colps_q_full;
reg colps_wr_q_full_3;
reg [8:0] colps_wr_q_loc_3;
reg [3:0] dram_Ch3_wr_colps_q_cnt;
reg [3:0] colps_wr_q_cnt_3;
reg [2:0] colps_wr_indx_3;
reg       colps_wr_rst_vld_3;
always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch3_wr_colps_q_full <= 1'b0;
   dram_Ch3_wr_colps_q_cnt  <= 1'b0;
   end
  else
   begin 
    colps_wr_q_full_3 = 1;
    colps_wr_q_cnt_3 = 0;

    // extract the index for which the reset occured
    colps_wr_rst_vld_3   = 0;
    for (i=0;i<8;i=i+1) begin
      if (dram_Ch3_wr_que_rd_ptr_arb[i]) begin
        colps_wr_indx_3 = i;
        colps_wr_rst_vld_3   = 1;
      end
    end
    for (i=0;i<8;i=i+1) begin
     colps_wr_q_loc_3  = dram_Ch3_wr_colps_q[i];
      if (colps_wr_rst_vld_3 == 1) begin
       if ((colps_wr_q_loc_3[5:3] != colps_wr_indx_3) || ~colps_wr_q_loc_3[6]) begin
        colps_wr_q_full_3 = colps_wr_q_loc_3[6]  && colps_wr_q_full_3;
        colps_wr_q_cnt_3  = colps_wr_q_cnt_3 + colps_wr_q_loc_3[6];
       end
      end else begin
        colps_wr_q_full_3 = colps_wr_q_loc_3[6]  && colps_wr_q_full_3;
        colps_wr_q_cnt_3  = colps_wr_q_cnt_3 + colps_wr_q_loc_3[6];
      end
    end

   dram_Ch3_wr_colps_q_full <= colps_wr_q_full_3;
   dram_Ch3_wr_colps_q_cnt  <= colps_wr_q_cnt_3;

   end
end


// detecting wr q empty  
reg dram_Ch0_wr_q_empty;
reg dram_Ch0_wr_q_empty_arb;
reg wr_q_empty_0;
reg wr_q_empty_0_arb;
reg [40:0] wr_q_loc1_0;
always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch0_wr_q_empty <= 1'b0;
   dram_Ch0_wr_q_empty_arb <= 1'b0;
   end
  else
   begin 
    wr_q_empty_0 = 0;
    wr_q_empty_0_arb = 0;
    for (i=0;i<8;i=i+1) begin 
     wr_q_loc1_0  = dram_Ch0_wr_q[i];
     wr_q_empty_0 = wr_q_loc1_0[40] || wr_q_empty_0;
     wr_q_empty_0_arb = wr_q_loc1_0[39] || wr_q_empty_0_arb;
    end
   dram_Ch0_wr_q_empty <= ~wr_q_empty_0;
   dram_Ch0_wr_q_empty_arb <= ~wr_q_empty_0_arb;

  end
end
reg dram_Ch1_wr_q_empty;
reg dram_Ch1_wr_q_empty_arb;
reg wr_q_empty_1;
reg wr_q_empty_1_arb;
reg [40:0] wr_q_loc1_1;
always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch1_wr_q_empty <= 1'b0;
   dram_Ch1_wr_q_empty_arb <= 1'b0;
   end
  else
   begin 
    wr_q_empty_1 = 0;
    wr_q_empty_1_arb = 0;
    for (i=0;i<8;i=i+1) begin 
     wr_q_loc1_1  = dram_Ch1_wr_q[i];
     wr_q_empty_1 = wr_q_loc1_1[40] || wr_q_empty_1;
     wr_q_empty_1_arb = wr_q_loc1_1[39] || wr_q_empty_1_arb;
    end
   dram_Ch1_wr_q_empty <= ~wr_q_empty_1;
   dram_Ch1_wr_q_empty_arb <= ~wr_q_empty_1_arb;

  end
end
reg dram_Ch2_wr_q_empty;
reg dram_Ch2_wr_q_empty_arb;
reg wr_q_empty_2;
reg wr_q_empty_2_arb;
reg [40:0] wr_q_loc1_2;
always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch2_wr_q_empty <= 1'b0;
   dram_Ch2_wr_q_empty_arb <= 1'b0;
   end
  else
   begin 
    wr_q_empty_2 = 0;
    wr_q_empty_2_arb = 0;
    for (i=0;i<8;i=i+1) begin 
     wr_q_loc1_2  = dram_Ch2_wr_q[i];
     wr_q_empty_2 = wr_q_loc1_2[40] || wr_q_empty_2;
     wr_q_empty_2_arb = wr_q_loc1_2[39] || wr_q_empty_2_arb;
    end
   dram_Ch2_wr_q_empty <= ~wr_q_empty_2;
   dram_Ch2_wr_q_empty_arb <= ~wr_q_empty_2_arb;

  end
end
reg dram_Ch3_wr_q_empty;
reg dram_Ch3_wr_q_empty_arb;
reg wr_q_empty_3;
reg wr_q_empty_3_arb;
reg [40:0] wr_q_loc1_3;
always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch3_wr_q_empty <= 1'b0;
   dram_Ch3_wr_q_empty_arb <= 1'b0;
   end
  else
   begin 
    wr_q_empty_3 = 0;
    wr_q_empty_3_arb = 0;
    for (i=0;i<8;i=i+1) begin 
     wr_q_loc1_3  = dram_Ch3_wr_q[i];
     wr_q_empty_3 = wr_q_loc1_3[40] || wr_q_empty_3;
     wr_q_empty_3_arb = wr_q_loc1_3[39] || wr_q_empty_3_arb;
    end
   dram_Ch3_wr_q_empty <= ~wr_q_empty_3;
   dram_Ch3_wr_q_empty_arb <= ~wr_q_empty_3_arb;

  end
end

// detecting wr collapsing fifo empty
reg dram_Ch0_wr_colps_q_empty;
reg colps_wr_q_empty_0;
reg [8:0] colps_wr_q_loc1_0;

always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch0_wr_colps_q_empty <= 1'b0;
   end
  else
   begin 
    colps_wr_q_empty_0 = 0;
    for (i=0;i<8;i=i+1) begin 
     colps_wr_q_loc1_0  = dram_Ch0_wr_colps_q[i];
     colps_wr_q_empty_0 = colps_wr_q_loc1_0[6] || colps_wr_q_empty_0;
    end
   dram_Ch0_wr_colps_q_empty <= ~colps_wr_q_empty_0;
  end
end
reg dram_Ch1_wr_colps_q_empty;
reg colps_wr_q_empty_1;
reg [8:0] colps_wr_q_loc1_1;

always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch1_wr_colps_q_empty <= 1'b0;
   end
  else
   begin 
    colps_wr_q_empty_1 = 0;
    for (i=0;i<8;i=i+1) begin 
     colps_wr_q_loc1_1  = dram_Ch1_wr_colps_q[i];
     colps_wr_q_empty_1 = colps_wr_q_loc1_1[6] || colps_wr_q_empty_1;
    end
   dram_Ch1_wr_colps_q_empty <= ~colps_wr_q_empty_1;
  end
end
reg dram_Ch2_wr_colps_q_empty;
reg colps_wr_q_empty_2;
reg [8:0] colps_wr_q_loc1_2;

always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch2_wr_colps_q_empty <= 1'b0;
   end
  else
   begin 
    colps_wr_q_empty_2 = 0;
    for (i=0;i<8;i=i+1) begin 
     colps_wr_q_loc1_2  = dram_Ch2_wr_colps_q[i];
     colps_wr_q_empty_2 = colps_wr_q_loc1_2[6] || colps_wr_q_empty_2;
    end
   dram_Ch2_wr_colps_q_empty <= ~colps_wr_q_empty_2;
  end
end
reg dram_Ch3_wr_colps_q_empty;
reg colps_wr_q_empty_3;
reg [8:0] colps_wr_q_loc1_3;

always @(posedge clk)
begin 
  if (~dram_rst_l) 
   begin 
   dram_Ch3_wr_colps_q_empty <= 1'b0;
   end
  else
   begin 
    colps_wr_q_empty_3 = 0;
    for (i=0;i<8;i=i+1) begin 
     colps_wr_q_loc1_3  = dram_Ch3_wr_colps_q[i];
     colps_wr_q_empty_3 = colps_wr_q_loc1_3[6] || colps_wr_q_empty_3;
    end
   dram_Ch3_wr_colps_q_empty <= ~colps_wr_q_empty_3;
  end
end

// cross between wr q and wr collapsing fifo
reg [2:0]  wr_index_0;
reg [2:0]  wr_curr_index_0;
reg [40:0] wr_q_0;
reg [8:0] colps_wr_q_loc2_0;

always @(posedge clk)
begin
  if (~dram_rst_l)
   begin
   end

  else
   begin

    // collapsing fifo indexes to the read q. If there is no 
    // corresponding valid entry then error.
    for(i=0;i<8;i=i+1) begin 
      colps_wr_q_loc2_0  = dram_Ch0_wr_colps_q[i];
       if (colps_wr_q_loc2_0[6]) begin 
         wr_index_0 = colps_wr_q_loc2_0[5:3];
         wr_q_0     = dram_Ch0_wr_q[wr_index_0];
          if ((wr_q_0[39] == 1'b0) || (wr_q_0[40] == 1'b0)) begin
            $display("ERROR : In dram channel 0 ");
            finish_test(" WR Q : No valid entry in WR Q for entry in collpsing WR fifo ", 0);
          end 
       end
    end

    // all entries in the collapsing fifo should be unique
    for(i=0;i<8;i=i+1) begin 
      colps_wr_q_loc2_0  = dram_Ch0_wr_colps_q[i];
       if (colps_wr_q_loc2_0[6]) begin 
       wr_curr_index_0 = colps_wr_q_loc2_0[5:3];
       for(j=i+1;j<8;j=j+1) begin 
         colps_wr_q_loc2_0  = dram_Ch0_wr_colps_q[j];
          if (colps_wr_q_loc2_0[6] && ( colps_wr_q_loc2_0[5:3] == wr_curr_index_0)) begin
            $display("ERROR : In dram channel 0 ");
            finish_test(" WR Q : The valid entries in the write collapsing fifo are not unique", 0);
          end 
       end
       end
    end
     
  end
end   
reg [2:0]  wr_index_1;
reg [2:0]  wr_curr_index_1;
reg [40:0] wr_q_1;
reg [8:0] colps_wr_q_loc2_1;

always @(posedge clk)
begin
  if (~dram_rst_l)
   begin
   end

  else
   begin

    // collapsing fifo indexes to the read q. If there is no 
    // corresponding valid entry then error.
    for(i=0;i<8;i=i+1) begin 
      colps_wr_q_loc2_1  = dram_Ch1_wr_colps_q[i];
       if (colps_wr_q_loc2_1[6]) begin 
         wr_index_1 = colps_wr_q_loc2_1[5:3];
         wr_q_1     = dram_Ch1_wr_q[wr_index_1];
          if ((wr_q_1[39] == 1'b0) || (wr_q_1[40] == 1'b0)) begin
            $display("ERROR : In dram channel 1 ");
            finish_test(" WR Q : No valid entry in WR Q for entry in collpsing WR fifo ", 1);
          end 
       end
    end

    // all entries in the collapsing fifo should be unique
    for(i=0;i<8;i=i+1) begin 
      colps_wr_q_loc2_1  = dram_Ch1_wr_colps_q[i];
       if (colps_wr_q_loc2_1[6]) begin 
       wr_curr_index_1 = colps_wr_q_loc2_1[5:3];
       for(j=i+1;j<8;j=j+1) begin 
         colps_wr_q_loc2_1  = dram_Ch1_wr_colps_q[j];
          if (colps_wr_q_loc2_1[6] && ( colps_wr_q_loc2_1[5:3] == wr_curr_index_1)) begin
            $display("ERROR : In dram channel 1 ");
            finish_test(" WR Q : The valid entries in the write collapsing fifo are not unique", 1);
          end 
       end
       end
    end
     
  end
end   
reg [2:0]  wr_index_2;
reg [2:0]  wr_curr_index_2;
reg [40:0] wr_q_2;
reg [8:0] colps_wr_q_loc2_2;

always @(posedge clk)
begin
  if (~dram_rst_l)
   begin
   end

  else
   begin

    // collapsing fifo indexes to the read q. If there is no 
    // corresponding valid entry then error.
    for(i=0;i<8;i=i+1) begin 
      colps_wr_q_loc2_2  = dram_Ch2_wr_colps_q[i];
       if (colps_wr_q_loc2_2[6]) begin 
         wr_index_2 = colps_wr_q_loc2_2[5:3];
         wr_q_2     = dram_Ch2_wr_q[wr_index_2];
          if ((wr_q_2[39] == 1'b0) || (wr_q_2[40] == 1'b0)) begin
            $display("ERROR : In dram channel 2 ");
            finish_test(" WR Q : No valid entry in WR Q for entry in collpsing WR fifo ", 2);
          end 
       end
    end

    // all entries in the collapsing fifo should be unique
    for(i=0;i<8;i=i+1) begin 
      colps_wr_q_loc2_2  = dram_Ch2_wr_colps_q[i];
       if (colps_wr_q_loc2_2[6]) begin 
       wr_curr_index_2 = colps_wr_q_loc2_2[5:3];
       for(j=i+1;j<8;j=j+1) begin 
         colps_wr_q_loc2_2  = dram_Ch2_wr_colps_q[j];
          if (colps_wr_q_loc2_2[6] && ( colps_wr_q_loc2_2[5:3] == wr_curr_index_2)) begin
            $display("ERROR : In dram channel 2 ");
            finish_test(" WR Q : The valid entries in the write collapsing fifo are not unique", 2);
          end 
       end
       end
    end
     
  end
end   
reg [2:0]  wr_index_3;
reg [2:0]  wr_curr_index_3;
reg [40:0] wr_q_3;
reg [8:0] colps_wr_q_loc2_3;

always @(posedge clk)
begin
  if (~dram_rst_l)
   begin
   end

  else
   begin

    // collapsing fifo indexes to the read q. If there is no 
    // corresponding valid entry then error.
    for(i=0;i<8;i=i+1) begin 
      colps_wr_q_loc2_3  = dram_Ch3_wr_colps_q[i];
       if (colps_wr_q_loc2_3[6]) begin 
         wr_index_3 = colps_wr_q_loc2_3[5:3];
         wr_q_3     = dram_Ch3_wr_q[wr_index_3];
          if ((wr_q_3[39] == 1'b0) || (wr_q_3[40] == 1'b0)) begin
            $display("ERROR : In dram channel 3 ");
            finish_test(" WR Q : No valid entry in WR Q for entry in collpsing WR fifo ", 3);
          end 
       end
    end

    // all entries in the collapsing fifo should be unique
    for(i=0;i<8;i=i+1) begin 
      colps_wr_q_loc2_3  = dram_Ch3_wr_colps_q[i];
       if (colps_wr_q_loc2_3[6]) begin 
       wr_curr_index_3 = colps_wr_q_loc2_3[5:3];
       for(j=i+1;j<8;j=j+1) begin 
         colps_wr_q_loc2_3  = dram_Ch3_wr_colps_q[j];
          if (colps_wr_q_loc2_3[6] && ( colps_wr_q_loc2_3[5:3] == wr_curr_index_3)) begin
            $display("ERROR : In dram channel 3 ");
            finish_test(" WR Q : The valid entries in the write collapsing fifo are not unique", 3);
          end 
       end
       end
    end
     
  end
end   

// wr que or arb request valid without data valid
 reg [40:0] wr_q_loc2_0;
always @( posedge clk) 
begin
if (dram_rst_l) begin
    for(i=0;i<8;i=i+1) begin
     wr_q_loc2_0  = dram_Ch0_wr_q[i];
      if (wr_q_loc2_0[39] && !wr_q_loc2_0[40]) begin
        $display("ERROR : In dram channel 0 ");
        finish_test(" WR Q :  Arb wr req valid and data valid not Valid ", 0);
      end
    end
end
end

 reg [40:0] wr_q_loc2_1;
always @( posedge clk) 
begin
if (dram_rst_l) begin
    for(i=0;i<8;i=i+1) begin
     wr_q_loc2_1  = dram_Ch1_wr_q[i];
      if (wr_q_loc2_1[39] && !wr_q_loc2_1[40]) begin
        $display("ERROR : In dram channel 1 ");
        finish_test(" WR Q :  Arb wr req valid and data valid not Valid ", 1);
      end
    end
end
end

 reg [40:0] wr_q_loc2_2;
always @( posedge clk) 
begin
if (dram_rst_l) begin
    for(i=0;i<8;i=i+1) begin
     wr_q_loc2_2  = dram_Ch2_wr_q[i];
      if (wr_q_loc2_2[39] && !wr_q_loc2_2[40]) begin
        $display("ERROR : In dram channel 2 ");
        finish_test(" WR Q :  Arb wr req valid and data valid not Valid ", 2);
      end
    end
end
end

 reg [40:0] wr_q_loc2_3;
always @( posedge clk) 
begin
if (dram_rst_l) begin
    for(i=0;i<8;i=i+1) begin
     wr_q_loc2_3  = dram_Ch3_wr_q[i];
      if (wr_q_loc2_3[39] && !wr_q_loc2_3[40]) begin
        $display("ERROR : In dram channel 3 ");
        finish_test(" WR Q :  Arb wr req valid and data valid not Valid ", 3);
      end
    end
end
end


// actual data valid creation.
reg [7:0] dram_Ch0_wr_que_dv_actual;
reg [7:0] dram_Ch0_l2if_wr_entry_d1;
always @( posedge clk)
begin
if (~dram_rst_l) begin
  dram_Ch0_wr_que_dv_actual[7:0] <= 8'b0;
  dram_Ch0_l2if_wr_entry_d1[7:0] <= 8'b0;
end else begin 
  dram_Ch0_l2if_wr_entry_d1[7:0] <= dram_Ch0_l2if_wr_entry[7:0];
    for(i=0;i<8;i=i+1) begin
      if (dram_Ch0_wr_que_rd_ptr[i]) begin 
        dram_Ch0_wr_que_dv_actual[i] <= 1'b0;
      end else begin 
       if (dram_Ch0_l2if_wr_entry[i] == 1) begin 
        dram_Ch0_wr_que_dv_actual[i] <= 1'b1;
       end
      end
    end
end
end

reg [7:0] dram_Ch1_wr_que_dv_actual;
reg [7:0] dram_Ch1_l2if_wr_entry_d1;
always @( posedge clk)
begin
if (~dram_rst_l) begin
  dram_Ch1_wr_que_dv_actual[7:0] <= 8'b0;
  dram_Ch1_l2if_wr_entry_d1[7:0] <= 8'b0;
end else begin 
  dram_Ch1_l2if_wr_entry_d1[7:0] <= dram_Ch1_l2if_wr_entry[7:0];
    for(i=0;i<8;i=i+1) begin
      if (dram_Ch1_wr_que_rd_ptr[i]) begin 
        dram_Ch1_wr_que_dv_actual[i] <= 1'b0;
      end else begin 
       if (dram_Ch1_l2if_wr_entry[i] == 1) begin 
        dram_Ch1_wr_que_dv_actual[i] <= 1'b1;
       end
      end
    end
end
end

reg [7:0] dram_Ch2_wr_que_dv_actual;
reg [7:0] dram_Ch2_l2if_wr_entry_d1;
always @( posedge clk)
begin
if (~dram_rst_l) begin
  dram_Ch2_wr_que_dv_actual[7:0] <= 8'b0;
  dram_Ch2_l2if_wr_entry_d1[7:0] <= 8'b0;
end else begin 
  dram_Ch2_l2if_wr_entry_d1[7:0] <= dram_Ch2_l2if_wr_entry[7:0];
    for(i=0;i<8;i=i+1) begin
      if (dram_Ch2_wr_que_rd_ptr[i]) begin 
        dram_Ch2_wr_que_dv_actual[i] <= 1'b0;
      end else begin 
       if (dram_Ch2_l2if_wr_entry[i] == 1) begin 
        dram_Ch2_wr_que_dv_actual[i] <= 1'b1;
       end
      end
    end
end
end

reg [7:0] dram_Ch3_wr_que_dv_actual;
reg [7:0] dram_Ch3_l2if_wr_entry_d1;
always @( posedge clk)
begin
if (~dram_rst_l) begin
  dram_Ch3_wr_que_dv_actual[7:0] <= 8'b0;
  dram_Ch3_l2if_wr_entry_d1[7:0] <= 8'b0;
end else begin 
  dram_Ch3_l2if_wr_entry_d1[7:0] <= dram_Ch3_l2if_wr_entry[7:0];
    for(i=0;i<8;i=i+1) begin
      if (dram_Ch3_wr_que_rd_ptr[i]) begin 
        dram_Ch3_wr_que_dv_actual[i] <= 1'b0;
      end else begin 
       if (dram_Ch3_l2if_wr_entry[i] == 1) begin 
        dram_Ch3_wr_que_dv_actual[i] <= 1'b1;
       end
      end
    end
end
end



//=====================================================================
//  Monitor for making sure that valid data is there in the fifo when 
//  write data is read from the DRAM Side. ( Data valid before CAS issued ) 
//=====================================================================


wire [63:0] dv_0;
reg  [63:0] dv_0_reg;

wire [3:0]  wr_en_0   = dram_Ch0_cpu_wr_en;
wire [3:0]  wr_addr_0 = dram_Ch0_cpu_wr_addr;
wire        rd_en_0   = dram_Ch0_que_mem_addr[4];
wire [3:0]  rd_addr_0 = dram_Ch0_que_mem_addr[3:0];

// there are 0-63 data valids, each (of the 4) instance in dram_mem.v
// has 64 bit data. total size per instance = 16 deep.
//  $p dv index
//  $q 0 1 2 3 
//  $r addr
assign dv_0[0] =  ((!wr_en_0[0] && (wr_addr_0 == 0) && !dram_Ch0_pa_err) || dv_0_reg[0] ) && 
                 ~((rd_addr_0 == 0) && !rd_en_0);
assign dv_0[1] =  ((!wr_en_0[1] && (wr_addr_0 == 0) && !dram_Ch0_pa_err) || dv_0_reg[1] ) && 
                 ~((rd_addr_0 == 0) && !rd_en_0);
assign dv_0[2] =  ((!wr_en_0[2] && (wr_addr_0 == 0) && !dram_Ch0_pa_err) || dv_0_reg[2] ) && 
                 ~((rd_addr_0 == 0) && !rd_en_0);
assign dv_0[3] =  ((!wr_en_0[3] && (wr_addr_0 == 0) && !dram_Ch0_pa_err) || dv_0_reg[3] ) && 
                 ~((rd_addr_0 == 0) && !rd_en_0);
assign dv_0[4] =  ((!wr_en_0[0] && (wr_addr_0 == 1) && !dram_Ch0_pa_err) || dv_0_reg[4] ) && 
                 ~((rd_addr_0 == 1) && !rd_en_0);
assign dv_0[5] =  ((!wr_en_0[1] && (wr_addr_0 == 1) && !dram_Ch0_pa_err) || dv_0_reg[5] ) && 
                 ~((rd_addr_0 == 1) && !rd_en_0);
assign dv_0[6] =  ((!wr_en_0[2] && (wr_addr_0 == 1) && !dram_Ch0_pa_err) || dv_0_reg[6] ) && 
                 ~((rd_addr_0 == 1) && !rd_en_0);
assign dv_0[7] =  ((!wr_en_0[3] && (wr_addr_0 == 1) && !dram_Ch0_pa_err) || dv_0_reg[7] ) && 
                 ~((rd_addr_0 == 1) && !rd_en_0);
assign dv_0[8] =  ((!wr_en_0[0] && (wr_addr_0 == 2) && !dram_Ch0_pa_err) || dv_0_reg[8] ) && 
                 ~((rd_addr_0 == 2) && !rd_en_0);
assign dv_0[9] =  ((!wr_en_0[1] && (wr_addr_0 == 2) && !dram_Ch0_pa_err) || dv_0_reg[9] ) && 
                 ~((rd_addr_0 == 2) && !rd_en_0);
assign dv_0[10] =  ((!wr_en_0[2] && (wr_addr_0 == 2) && !dram_Ch0_pa_err) || dv_0_reg[10] ) && 
                 ~((rd_addr_0 == 2) && !rd_en_0);
assign dv_0[11] =  ((!wr_en_0[3] && (wr_addr_0 == 2) && !dram_Ch0_pa_err) || dv_0_reg[11] ) && 
                 ~((rd_addr_0 == 2) && !rd_en_0);
assign dv_0[12] =  ((!wr_en_0[0] && (wr_addr_0 == 3) && !dram_Ch0_pa_err) || dv_0_reg[12] ) && 
                 ~((rd_addr_0 == 3) && !rd_en_0);
assign dv_0[13] =  ((!wr_en_0[1] && (wr_addr_0 == 3) && !dram_Ch0_pa_err) || dv_0_reg[13] ) && 
                 ~((rd_addr_0 == 3) && !rd_en_0);
assign dv_0[14] =  ((!wr_en_0[2] && (wr_addr_0 == 3) && !dram_Ch0_pa_err) || dv_0_reg[14] ) && 
                 ~((rd_addr_0 == 3) && !rd_en_0);
assign dv_0[15] =  ((!wr_en_0[3] && (wr_addr_0 == 3) && !dram_Ch0_pa_err) || dv_0_reg[15] ) && 
                 ~((rd_addr_0 == 3) && !rd_en_0);
assign dv_0[16] =  ((!wr_en_0[0] && (wr_addr_0 == 4) && !dram_Ch0_pa_err) || dv_0_reg[16] ) && 
                 ~((rd_addr_0 == 4) && !rd_en_0);
assign dv_0[17] =  ((!wr_en_0[1] && (wr_addr_0 == 4) && !dram_Ch0_pa_err) || dv_0_reg[17] ) && 
                 ~((rd_addr_0 == 4) && !rd_en_0);
assign dv_0[18] =  ((!wr_en_0[2] && (wr_addr_0 == 4) && !dram_Ch0_pa_err) || dv_0_reg[18] ) && 
                 ~((rd_addr_0 == 4) && !rd_en_0);
assign dv_0[19] =  ((!wr_en_0[3] && (wr_addr_0 == 4) && !dram_Ch0_pa_err) || dv_0_reg[19] ) && 
                 ~((rd_addr_0 == 4) && !rd_en_0);
assign dv_0[20] =  ((!wr_en_0[0] && (wr_addr_0 == 5) && !dram_Ch0_pa_err) || dv_0_reg[20] ) && 
                 ~((rd_addr_0 == 5) && !rd_en_0);
assign dv_0[21] =  ((!wr_en_0[1] && (wr_addr_0 == 5) && !dram_Ch0_pa_err) || dv_0_reg[21] ) && 
                 ~((rd_addr_0 == 5) && !rd_en_0);
assign dv_0[22] =  ((!wr_en_0[2] && (wr_addr_0 == 5) && !dram_Ch0_pa_err) || dv_0_reg[22] ) && 
                 ~((rd_addr_0 == 5) && !rd_en_0);
assign dv_0[23] =  ((!wr_en_0[3] && (wr_addr_0 == 5) && !dram_Ch0_pa_err) || dv_0_reg[23] ) && 
                 ~((rd_addr_0 == 5) && !rd_en_0);
assign dv_0[24] =  ((!wr_en_0[0] && (wr_addr_0 == 6) && !dram_Ch0_pa_err) || dv_0_reg[24] ) && 
                 ~((rd_addr_0 == 6) && !rd_en_0);
assign dv_0[25] =  ((!wr_en_0[1] && (wr_addr_0 == 6) && !dram_Ch0_pa_err) || dv_0_reg[25] ) && 
                 ~((rd_addr_0 == 6) && !rd_en_0);
assign dv_0[26] =  ((!wr_en_0[2] && (wr_addr_0 == 6) && !dram_Ch0_pa_err) || dv_0_reg[26] ) && 
                 ~((rd_addr_0 == 6) && !rd_en_0);
assign dv_0[27] =  ((!wr_en_0[3] && (wr_addr_0 == 6) && !dram_Ch0_pa_err) || dv_0_reg[27] ) && 
                 ~((rd_addr_0 == 6) && !rd_en_0);
assign dv_0[28] =  ((!wr_en_0[0] && (wr_addr_0 == 7) && !dram_Ch0_pa_err) || dv_0_reg[28] ) && 
                 ~((rd_addr_0 == 7) && !rd_en_0);
assign dv_0[29] =  ((!wr_en_0[1] && (wr_addr_0 == 7) && !dram_Ch0_pa_err) || dv_0_reg[29] ) && 
                 ~((rd_addr_0 == 7) && !rd_en_0);
assign dv_0[30] =  ((!wr_en_0[2] && (wr_addr_0 == 7) && !dram_Ch0_pa_err) || dv_0_reg[30] ) && 
                 ~((rd_addr_0 == 7) && !rd_en_0);
assign dv_0[31] =  ((!wr_en_0[3] && (wr_addr_0 == 7) && !dram_Ch0_pa_err) || dv_0_reg[31] ) && 
                 ~((rd_addr_0 == 7) && !rd_en_0);
assign dv_0[32] =  ((!wr_en_0[0] && (wr_addr_0 == 8) && !dram_Ch0_pa_err) || dv_0_reg[32] ) && 
                 ~((rd_addr_0 == 8) && !rd_en_0);
assign dv_0[33] =  ((!wr_en_0[1] && (wr_addr_0 == 8) && !dram_Ch0_pa_err) || dv_0_reg[33] ) && 
                 ~((rd_addr_0 == 8) && !rd_en_0);
assign dv_0[34] =  ((!wr_en_0[2] && (wr_addr_0 == 8) && !dram_Ch0_pa_err) || dv_0_reg[34] ) && 
                 ~((rd_addr_0 == 8) && !rd_en_0);
assign dv_0[35] =  ((!wr_en_0[3] && (wr_addr_0 == 8) && !dram_Ch0_pa_err) || dv_0_reg[35] ) && 
                 ~((rd_addr_0 == 8) && !rd_en_0);
assign dv_0[36] =  ((!wr_en_0[0] && (wr_addr_0 == 9) && !dram_Ch0_pa_err) || dv_0_reg[36] ) && 
                 ~((rd_addr_0 == 9) && !rd_en_0);
assign dv_0[37] =  ((!wr_en_0[1] && (wr_addr_0 == 9) && !dram_Ch0_pa_err) || dv_0_reg[37] ) && 
                 ~((rd_addr_0 == 9) && !rd_en_0);
assign dv_0[38] =  ((!wr_en_0[2] && (wr_addr_0 == 9) && !dram_Ch0_pa_err) || dv_0_reg[38] ) && 
                 ~((rd_addr_0 == 9) && !rd_en_0);
assign dv_0[39] =  ((!wr_en_0[3] && (wr_addr_0 == 9) && !dram_Ch0_pa_err) || dv_0_reg[39] ) && 
                 ~((rd_addr_0 == 9) && !rd_en_0);
assign dv_0[40] =  ((!wr_en_0[0] && (wr_addr_0 == 10) && !dram_Ch0_pa_err) || dv_0_reg[40] ) && 
                 ~((rd_addr_0 == 10) && !rd_en_0);
assign dv_0[41] =  ((!wr_en_0[1] && (wr_addr_0 == 10) && !dram_Ch0_pa_err) || dv_0_reg[41] ) && 
                 ~((rd_addr_0 == 10) && !rd_en_0);
assign dv_0[42] =  ((!wr_en_0[2] && (wr_addr_0 == 10) && !dram_Ch0_pa_err) || dv_0_reg[42] ) && 
                 ~((rd_addr_0 == 10) && !rd_en_0);
assign dv_0[43] =  ((!wr_en_0[3] && (wr_addr_0 == 10) && !dram_Ch0_pa_err) || dv_0_reg[43] ) && 
                 ~((rd_addr_0 == 10) && !rd_en_0);
assign dv_0[44] =  ((!wr_en_0[0] && (wr_addr_0 == 11) && !dram_Ch0_pa_err) || dv_0_reg[44] ) && 
                 ~((rd_addr_0 == 11) && !rd_en_0);
assign dv_0[45] =  ((!wr_en_0[1] && (wr_addr_0 == 11) && !dram_Ch0_pa_err) || dv_0_reg[45] ) && 
                 ~((rd_addr_0 == 11) && !rd_en_0);
assign dv_0[46] =  ((!wr_en_0[2] && (wr_addr_0 == 11) && !dram_Ch0_pa_err) || dv_0_reg[46] ) && 
                 ~((rd_addr_0 == 11) && !rd_en_0);
assign dv_0[47] =  ((!wr_en_0[3] && (wr_addr_0 == 11) && !dram_Ch0_pa_err) || dv_0_reg[47] ) && 
                 ~((rd_addr_0 == 11) && !rd_en_0);
assign dv_0[48] =  ((!wr_en_0[0] && (wr_addr_0 == 12) && !dram_Ch0_pa_err) || dv_0_reg[48] ) && 
                 ~((rd_addr_0 == 12) && !rd_en_0);
assign dv_0[49] =  ((!wr_en_0[1] && (wr_addr_0 == 12) && !dram_Ch0_pa_err) || dv_0_reg[49] ) && 
                 ~((rd_addr_0 == 12) && !rd_en_0);
assign dv_0[50] =  ((!wr_en_0[2] && (wr_addr_0 == 12) && !dram_Ch0_pa_err) || dv_0_reg[50] ) && 
                 ~((rd_addr_0 == 12) && !rd_en_0);
assign dv_0[51] =  ((!wr_en_0[3] && (wr_addr_0 == 12) && !dram_Ch0_pa_err) || dv_0_reg[51] ) && 
                 ~((rd_addr_0 == 12) && !rd_en_0);
assign dv_0[52] =  ((!wr_en_0[0] && (wr_addr_0 == 13) && !dram_Ch0_pa_err) || dv_0_reg[52] ) && 
                 ~((rd_addr_0 == 13) && !rd_en_0);
assign dv_0[53] =  ((!wr_en_0[1] && (wr_addr_0 == 13) && !dram_Ch0_pa_err) || dv_0_reg[53] ) && 
                 ~((rd_addr_0 == 13) && !rd_en_0);
assign dv_0[54] =  ((!wr_en_0[2] && (wr_addr_0 == 13) && !dram_Ch0_pa_err) || dv_0_reg[54] ) && 
                 ~((rd_addr_0 == 13) && !rd_en_0);
assign dv_0[55] =  ((!wr_en_0[3] && (wr_addr_0 == 13) && !dram_Ch0_pa_err) || dv_0_reg[55] ) && 
                 ~((rd_addr_0 == 13) && !rd_en_0);
assign dv_0[56] =  ((!wr_en_0[0] && (wr_addr_0 == 14) && !dram_Ch0_pa_err) || dv_0_reg[56] ) && 
                 ~((rd_addr_0 == 14) && !rd_en_0);
assign dv_0[57] =  ((!wr_en_0[1] && (wr_addr_0 == 14) && !dram_Ch0_pa_err) || dv_0_reg[57] ) && 
                 ~((rd_addr_0 == 14) && !rd_en_0);
assign dv_0[58] =  ((!wr_en_0[2] && (wr_addr_0 == 14) && !dram_Ch0_pa_err) || dv_0_reg[58] ) && 
                 ~((rd_addr_0 == 14) && !rd_en_0);
assign dv_0[59] =  ((!wr_en_0[3] && (wr_addr_0 == 14) && !dram_Ch0_pa_err) || dv_0_reg[59] ) && 
                 ~((rd_addr_0 == 14) && !rd_en_0);
assign dv_0[60] =  ((!wr_en_0[0] && (wr_addr_0 == 15) && !dram_Ch0_pa_err) || dv_0_reg[60] ) && 
                 ~((rd_addr_0 == 15) && !rd_en_0);
assign dv_0[61] =  ((!wr_en_0[1] && (wr_addr_0 == 15) && !dram_Ch0_pa_err) || dv_0_reg[61] ) && 
                 ~((rd_addr_0 == 15) && !rd_en_0);
assign dv_0[62] =  ((!wr_en_0[2] && (wr_addr_0 == 15) && !dram_Ch0_pa_err) || dv_0_reg[62] ) && 
                 ~((rd_addr_0 == 15) && !rd_en_0);
assign dv_0[63] =  ((!wr_en_0[3] && (wr_addr_0 == 15) && !dram_Ch0_pa_err) || dv_0_reg[63] ) && 
                 ~((rd_addr_0 == 15) && !rd_en_0);

always @(posedge cmp_clk) begin 
  if (~cmp_rst_l)
   begin
         dv_0_reg <= 64'b0; 
   end
  else begin
         dv_0_reg <= dv_0;
  end
end

// actual monitor
// if read and the locations dv not valid
// monitoring in cmp_clk and so should be monitored only on the first clock
// after which the rd may be valid in the dram clock 
reg  cmp_rst_l_0_1;
reg  [4:0] addr_reg_0;
always @ (posedge cmp_clk)
begin 
if($test$plusargs("WARM_RESET") || $test$plusargs("freq_change")) begin
end else begin 

// need to delay as on 1st dram clk after reset the rd_en has still not
cmp_rst_l_0_1 <= cmp_rst_l;
addr_reg_0     <= {rd_en_0, rd_addr_0};
if (cmp_rst_l_0_1 && (~rd_en_0) && (addr_reg_0 != {rd_en_0, rd_addr_0})) begin
 if (!dv_0_reg[rd_addr_0*4] || !dv_0_reg[rd_addr_0*4 + 1] || 
     !dv_0_reg[rd_addr_0*4 + 2] || !dv_0_reg[rd_addr_0*4 + 3] ) begin 
     $display("ERROR : In dram channel 0 ");
     $display(" At time %0d fifo address = %x is read but not valid, fifo valids = %x", $time, rd_addr_0, dv_0_reg);
     finish_test(" CAS Issued Data not valid ", 0);
  end  
end  
end  
end  


// if write and the locations dv already valid
always @ (posedge cmp_clk)
begin 
if (cmp_rst_l && (~wr_en_0[0])) begin
 if (dv_0_reg[wr_addr_0*4 + 0]) begin 
     $display("ERROR : In dram channel 0 ");
     $display(" At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, wr_addr_0,wr_en_0, dv_0_reg);
     finish_test(" Data Overwritten in write fifo ", 0);
  end  
end  
if (cmp_rst_l && (~wr_en_0[1])) begin
 if (dv_0_reg[wr_addr_0*4 + 1]) begin 
     $display("ERROR : In dram channel 0 ");
     $display(" At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, wr_addr_0,wr_en_0, dv_0_reg);
     finish_test(" Data Overwritten in write fifo ", 0);
  end  
end  
if (cmp_rst_l && (~wr_en_0[2])) begin
 if (dv_0_reg[wr_addr_0*4 + 2]) begin 
     $display("ERROR : In dram channel 0 ");
     $display(" At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, wr_addr_0,wr_en_0, dv_0_reg);
     finish_test(" Data Overwritten in write fifo ", 0);
  end  
end  
if (cmp_rst_l && (~wr_en_0[3])) begin
 if (dv_0_reg[wr_addr_0*4 + 3]) begin 
     $display("ERROR : In dram channel 0 ");
     $display(" At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, wr_addr_0,wr_en_0, dv_0_reg);
     finish_test(" Data Overwritten in write fifo ", 0);
  end  
end  
end  


wire [63:0] dv_1;
reg  [63:0] dv_1_reg;

wire [3:0]  wr_en_1   = dram_Ch1_cpu_wr_en;
wire [3:0]  wr_addr_1 = dram_Ch1_cpu_wr_addr;
wire        rd_en_1   = dram_Ch1_que_mem_addr[4];
wire [3:0]  rd_addr_1 = dram_Ch1_que_mem_addr[3:0];

// there are 0-63 data valids, each (of the 4) instance in dram_mem.v
// has 64 bit data. total size per instance = 16 deep.
//  $p dv index
//  $q 0 1 2 3 
//  $r addr
assign dv_1[0] =  ((!wr_en_1[0] && (wr_addr_1 == 0) && !dram_Ch1_pa_err) || dv_1_reg[0] ) && 
                 ~((rd_addr_1 == 0) && !rd_en_1);
assign dv_1[1] =  ((!wr_en_1[1] && (wr_addr_1 == 0) && !dram_Ch1_pa_err) || dv_1_reg[1] ) && 
                 ~((rd_addr_1 == 0) && !rd_en_1);
assign dv_1[2] =  ((!wr_en_1[2] && (wr_addr_1 == 0) && !dram_Ch1_pa_err) || dv_1_reg[2] ) && 
                 ~((rd_addr_1 == 0) && !rd_en_1);
assign dv_1[3] =  ((!wr_en_1[3] && (wr_addr_1 == 0) && !dram_Ch1_pa_err) || dv_1_reg[3] ) && 
                 ~((rd_addr_1 == 0) && !rd_en_1);
assign dv_1[4] =  ((!wr_en_1[0] && (wr_addr_1 == 1) && !dram_Ch1_pa_err) || dv_1_reg[4] ) && 
                 ~((rd_addr_1 == 1) && !rd_en_1);
assign dv_1[5] =  ((!wr_en_1[1] && (wr_addr_1 == 1) && !dram_Ch1_pa_err) || dv_1_reg[5] ) && 
                 ~((rd_addr_1 == 1) && !rd_en_1);
assign dv_1[6] =  ((!wr_en_1[2] && (wr_addr_1 == 1) && !dram_Ch1_pa_err) || dv_1_reg[6] ) && 
                 ~((rd_addr_1 == 1) && !rd_en_1);
assign dv_1[7] =  ((!wr_en_1[3] && (wr_addr_1 == 1) && !dram_Ch1_pa_err) || dv_1_reg[7] ) && 
                 ~((rd_addr_1 == 1) && !rd_en_1);
assign dv_1[8] =  ((!wr_en_1[0] && (wr_addr_1 == 2) && !dram_Ch1_pa_err) || dv_1_reg[8] ) && 
                 ~((rd_addr_1 == 2) && !rd_en_1);
assign dv_1[9] =  ((!wr_en_1[1] && (wr_addr_1 == 2) && !dram_Ch1_pa_err) || dv_1_reg[9] ) && 
                 ~((rd_addr_1 == 2) && !rd_en_1);
assign dv_1[10] =  ((!wr_en_1[2] && (wr_addr_1 == 2) && !dram_Ch1_pa_err) || dv_1_reg[10] ) && 
                 ~((rd_addr_1 == 2) && !rd_en_1);
assign dv_1[11] =  ((!wr_en_1[3] && (wr_addr_1 == 2) && !dram_Ch1_pa_err) || dv_1_reg[11] ) && 
                 ~((rd_addr_1 == 2) && !rd_en_1);
assign dv_1[12] =  ((!wr_en_1[0] && (wr_addr_1 == 3) && !dram_Ch1_pa_err) || dv_1_reg[12] ) && 
                 ~((rd_addr_1 == 3) && !rd_en_1);
assign dv_1[13] =  ((!wr_en_1[1] && (wr_addr_1 == 3) && !dram_Ch1_pa_err) || dv_1_reg[13] ) && 
                 ~((rd_addr_1 == 3) && !rd_en_1);
assign dv_1[14] =  ((!wr_en_1[2] && (wr_addr_1 == 3) && !dram_Ch1_pa_err) || dv_1_reg[14] ) && 
                 ~((rd_addr_1 == 3) && !rd_en_1);
assign dv_1[15] =  ((!wr_en_1[3] && (wr_addr_1 == 3) && !dram_Ch1_pa_err) || dv_1_reg[15] ) && 
                 ~((rd_addr_1 == 3) && !rd_en_1);
assign dv_1[16] =  ((!wr_en_1[0] && (wr_addr_1 == 4) && !dram_Ch1_pa_err) || dv_1_reg[16] ) && 
                 ~((rd_addr_1 == 4) && !rd_en_1);
assign dv_1[17] =  ((!wr_en_1[1] && (wr_addr_1 == 4) && !dram_Ch1_pa_err) || dv_1_reg[17] ) && 
                 ~((rd_addr_1 == 4) && !rd_en_1);
assign dv_1[18] =  ((!wr_en_1[2] && (wr_addr_1 == 4) && !dram_Ch1_pa_err) || dv_1_reg[18] ) && 
                 ~((rd_addr_1 == 4) && !rd_en_1);
assign dv_1[19] =  ((!wr_en_1[3] && (wr_addr_1 == 4) && !dram_Ch1_pa_err) || dv_1_reg[19] ) && 
                 ~((rd_addr_1 == 4) && !rd_en_1);
assign dv_1[20] =  ((!wr_en_1[0] && (wr_addr_1 == 5) && !dram_Ch1_pa_err) || dv_1_reg[20] ) && 
                 ~((rd_addr_1 == 5) && !rd_en_1);
assign dv_1[21] =  ((!wr_en_1[1] && (wr_addr_1 == 5) && !dram_Ch1_pa_err) || dv_1_reg[21] ) && 
                 ~((rd_addr_1 == 5) && !rd_en_1);
assign dv_1[22] =  ((!wr_en_1[2] && (wr_addr_1 == 5) && !dram_Ch1_pa_err) || dv_1_reg[22] ) && 
                 ~((rd_addr_1 == 5) && !rd_en_1);
assign dv_1[23] =  ((!wr_en_1[3] && (wr_addr_1 == 5) && !dram_Ch1_pa_err) || dv_1_reg[23] ) && 
                 ~((rd_addr_1 == 5) && !rd_en_1);
assign dv_1[24] =  ((!wr_en_1[0] && (wr_addr_1 == 6) && !dram_Ch1_pa_err) || dv_1_reg[24] ) && 
                 ~((rd_addr_1 == 6) && !rd_en_1);
assign dv_1[25] =  ((!wr_en_1[1] && (wr_addr_1 == 6) && !dram_Ch1_pa_err) || dv_1_reg[25] ) && 
                 ~((rd_addr_1 == 6) && !rd_en_1);
assign dv_1[26] =  ((!wr_en_1[2] && (wr_addr_1 == 6) && !dram_Ch1_pa_err) || dv_1_reg[26] ) && 
                 ~((rd_addr_1 == 6) && !rd_en_1);
assign dv_1[27] =  ((!wr_en_1[3] && (wr_addr_1 == 6) && !dram_Ch1_pa_err) || dv_1_reg[27] ) && 
                 ~((rd_addr_1 == 6) && !rd_en_1);
assign dv_1[28] =  ((!wr_en_1[0] && (wr_addr_1 == 7) && !dram_Ch1_pa_err) || dv_1_reg[28] ) && 
                 ~((rd_addr_1 == 7) && !rd_en_1);
assign dv_1[29] =  ((!wr_en_1[1] && (wr_addr_1 == 7) && !dram_Ch1_pa_err) || dv_1_reg[29] ) && 
                 ~((rd_addr_1 == 7) && !rd_en_1);
assign dv_1[30] =  ((!wr_en_1[2] && (wr_addr_1 == 7) && !dram_Ch1_pa_err) || dv_1_reg[30] ) && 
                 ~((rd_addr_1 == 7) && !rd_en_1);
assign dv_1[31] =  ((!wr_en_1[3] && (wr_addr_1 == 7) && !dram_Ch1_pa_err) || dv_1_reg[31] ) && 
                 ~((rd_addr_1 == 7) && !rd_en_1);
assign dv_1[32] =  ((!wr_en_1[0] && (wr_addr_1 == 8) && !dram_Ch1_pa_err) || dv_1_reg[32] ) && 
                 ~((rd_addr_1 == 8) && !rd_en_1);
assign dv_1[33] =  ((!wr_en_1[1] && (wr_addr_1 == 8) && !dram_Ch1_pa_err) || dv_1_reg[33] ) && 
                 ~((rd_addr_1 == 8) && !rd_en_1);
assign dv_1[34] =  ((!wr_en_1[2] && (wr_addr_1 == 8) && !dram_Ch1_pa_err) || dv_1_reg[34] ) && 
                 ~((rd_addr_1 == 8) && !rd_en_1);
assign dv_1[35] =  ((!wr_en_1[3] && (wr_addr_1 == 8) && !dram_Ch1_pa_err) || dv_1_reg[35] ) && 
                 ~((rd_addr_1 == 8) && !rd_en_1);
assign dv_1[36] =  ((!wr_en_1[0] && (wr_addr_1 == 9) && !dram_Ch1_pa_err) || dv_1_reg[36] ) && 
                 ~((rd_addr_1 == 9) && !rd_en_1);
assign dv_1[37] =  ((!wr_en_1[1] && (wr_addr_1 == 9) && !dram_Ch1_pa_err) || dv_1_reg[37] ) && 
                 ~((rd_addr_1 == 9) && !rd_en_1);
assign dv_1[38] =  ((!wr_en_1[2] && (wr_addr_1 == 9) && !dram_Ch1_pa_err) || dv_1_reg[38] ) && 
                 ~((rd_addr_1 == 9) && !rd_en_1);
assign dv_1[39] =  ((!wr_en_1[3] && (wr_addr_1 == 9) && !dram_Ch1_pa_err) || dv_1_reg[39] ) && 
                 ~((rd_addr_1 == 9) && !rd_en_1);
assign dv_1[40] =  ((!wr_en_1[0] && (wr_addr_1 == 10) && !dram_Ch1_pa_err) || dv_1_reg[40] ) && 
                 ~((rd_addr_1 == 10) && !rd_en_1);
assign dv_1[41] =  ((!wr_en_1[1] && (wr_addr_1 == 10) && !dram_Ch1_pa_err) || dv_1_reg[41] ) && 
                 ~((rd_addr_1 == 10) && !rd_en_1);
assign dv_1[42] =  ((!wr_en_1[2] && (wr_addr_1 == 10) && !dram_Ch1_pa_err) || dv_1_reg[42] ) && 
                 ~((rd_addr_1 == 10) && !rd_en_1);
assign dv_1[43] =  ((!wr_en_1[3] && (wr_addr_1 == 10) && !dram_Ch1_pa_err) || dv_1_reg[43] ) && 
                 ~((rd_addr_1 == 10) && !rd_en_1);
assign dv_1[44] =  ((!wr_en_1[0] && (wr_addr_1 == 11) && !dram_Ch1_pa_err) || dv_1_reg[44] ) && 
                 ~((rd_addr_1 == 11) && !rd_en_1);
assign dv_1[45] =  ((!wr_en_1[1] && (wr_addr_1 == 11) && !dram_Ch1_pa_err) || dv_1_reg[45] ) && 
                 ~((rd_addr_1 == 11) && !rd_en_1);
assign dv_1[46] =  ((!wr_en_1[2] && (wr_addr_1 == 11) && !dram_Ch1_pa_err) || dv_1_reg[46] ) && 
                 ~((rd_addr_1 == 11) && !rd_en_1);
assign dv_1[47] =  ((!wr_en_1[3] && (wr_addr_1 == 11) && !dram_Ch1_pa_err) || dv_1_reg[47] ) && 
                 ~((rd_addr_1 == 11) && !rd_en_1);
assign dv_1[48] =  ((!wr_en_1[0] && (wr_addr_1 == 12) && !dram_Ch1_pa_err) || dv_1_reg[48] ) && 
                 ~((rd_addr_1 == 12) && !rd_en_1);
assign dv_1[49] =  ((!wr_en_1[1] && (wr_addr_1 == 12) && !dram_Ch1_pa_err) || dv_1_reg[49] ) && 
                 ~((rd_addr_1 == 12) && !rd_en_1);
assign dv_1[50] =  ((!wr_en_1[2] && (wr_addr_1 == 12) && !dram_Ch1_pa_err) || dv_1_reg[50] ) && 
                 ~((rd_addr_1 == 12) && !rd_en_1);
assign dv_1[51] =  ((!wr_en_1[3] && (wr_addr_1 == 12) && !dram_Ch1_pa_err) || dv_1_reg[51] ) && 
                 ~((rd_addr_1 == 12) && !rd_en_1);
assign dv_1[52] =  ((!wr_en_1[0] && (wr_addr_1 == 13) && !dram_Ch1_pa_err) || dv_1_reg[52] ) && 
                 ~((rd_addr_1 == 13) && !rd_en_1);
assign dv_1[53] =  ((!wr_en_1[1] && (wr_addr_1 == 13) && !dram_Ch1_pa_err) || dv_1_reg[53] ) && 
                 ~((rd_addr_1 == 13) && !rd_en_1);
assign dv_1[54] =  ((!wr_en_1[2] && (wr_addr_1 == 13) && !dram_Ch1_pa_err) || dv_1_reg[54] ) && 
                 ~((rd_addr_1 == 13) && !rd_en_1);
assign dv_1[55] =  ((!wr_en_1[3] && (wr_addr_1 == 13) && !dram_Ch1_pa_err) || dv_1_reg[55] ) && 
                 ~((rd_addr_1 == 13) && !rd_en_1);
assign dv_1[56] =  ((!wr_en_1[0] && (wr_addr_1 == 14) && !dram_Ch1_pa_err) || dv_1_reg[56] ) && 
                 ~((rd_addr_1 == 14) && !rd_en_1);
assign dv_1[57] =  ((!wr_en_1[1] && (wr_addr_1 == 14) && !dram_Ch1_pa_err) || dv_1_reg[57] ) && 
                 ~((rd_addr_1 == 14) && !rd_en_1);
assign dv_1[58] =  ((!wr_en_1[2] && (wr_addr_1 == 14) && !dram_Ch1_pa_err) || dv_1_reg[58] ) && 
                 ~((rd_addr_1 == 14) && !rd_en_1);
assign dv_1[59] =  ((!wr_en_1[3] && (wr_addr_1 == 14) && !dram_Ch1_pa_err) || dv_1_reg[59] ) && 
                 ~((rd_addr_1 == 14) && !rd_en_1);
assign dv_1[60] =  ((!wr_en_1[0] && (wr_addr_1 == 15) && !dram_Ch1_pa_err) || dv_1_reg[60] ) && 
                 ~((rd_addr_1 == 15) && !rd_en_1);
assign dv_1[61] =  ((!wr_en_1[1] && (wr_addr_1 == 15) && !dram_Ch1_pa_err) || dv_1_reg[61] ) && 
                 ~((rd_addr_1 == 15) && !rd_en_1);
assign dv_1[62] =  ((!wr_en_1[2] && (wr_addr_1 == 15) && !dram_Ch1_pa_err) || dv_1_reg[62] ) && 
                 ~((rd_addr_1 == 15) && !rd_en_1);
assign dv_1[63] =  ((!wr_en_1[3] && (wr_addr_1 == 15) && !dram_Ch1_pa_err) || dv_1_reg[63] ) && 
                 ~((rd_addr_1 == 15) && !rd_en_1);

always @(posedge cmp_clk) begin 
  if (~cmp_rst_l)
   begin
         dv_1_reg <= 64'b0; 
   end
  else begin
         dv_1_reg <= dv_1;
  end
end

// actual monitor
// if read and the locations dv not valid
// monitoring in cmp_clk and so should be monitored only on the first clock
// after which the rd may be valid in the dram clock 
reg  cmp_rst_l_1_1;
reg  [4:0] addr_reg_1;
always @ (posedge cmp_clk)
begin 
if($test$plusargs("WARM_RESET") || $test$plusargs("freq_change")) begin
end else begin 

// need to delay as on 1st dram clk after reset the rd_en has still not
cmp_rst_l_1_1 <= cmp_rst_l;
addr_reg_1     <= {rd_en_1, rd_addr_1};
if (cmp_rst_l_1_1 && (~rd_en_1) && (addr_reg_1 != {rd_en_1, rd_addr_1})) begin
 if (!dv_1_reg[rd_addr_1*4] || !dv_1_reg[rd_addr_1*4 + 1] || 
     !dv_1_reg[rd_addr_1*4 + 2] || !dv_1_reg[rd_addr_1*4 + 3] ) begin 
     $display("ERROR : In dram channel 1 ");
     $display(" At time %0d fifo address = %x is read but not valid, fifo valids = %x", $time, rd_addr_1, dv_1_reg);
     finish_test(" CAS Issued Data not valid ", 1);
  end  
end  
end  
end  


// if write and the locations dv already valid
always @ (posedge cmp_clk)
begin 
if (cmp_rst_l && (~wr_en_1[0])) begin
 if (dv_1_reg[wr_addr_1*4 + 0]) begin 
     $display("ERROR : In dram channel 1 ");
     $display(" At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, wr_addr_1,wr_en_1, dv_1_reg);
     finish_test(" Data Overwritten in write fifo ", 1);
  end  
end  
if (cmp_rst_l && (~wr_en_1[1])) begin
 if (dv_1_reg[wr_addr_1*4 + 1]) begin 
     $display("ERROR : In dram channel 1 ");
     $display(" At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, wr_addr_1,wr_en_1, dv_1_reg);
     finish_test(" Data Overwritten in write fifo ", 1);
  end  
end  
if (cmp_rst_l && (~wr_en_1[2])) begin
 if (dv_1_reg[wr_addr_1*4 + 2]) begin 
     $display("ERROR : In dram channel 1 ");
     $display(" At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, wr_addr_1,wr_en_1, dv_1_reg);
     finish_test(" Data Overwritten in write fifo ", 1);
  end  
end  
if (cmp_rst_l && (~wr_en_1[3])) begin
 if (dv_1_reg[wr_addr_1*4 + 3]) begin 
     $display("ERROR : In dram channel 1 ");
     $display(" At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, wr_addr_1,wr_en_1, dv_1_reg);
     finish_test(" Data Overwritten in write fifo ", 1);
  end  
end  
end  


wire [63:0] dv_2;
reg  [63:0] dv_2_reg;

wire [3:0]  wr_en_2   = dram_Ch2_cpu_wr_en;
wire [3:0]  wr_addr_2 = dram_Ch2_cpu_wr_addr;
wire        rd_en_2   = dram_Ch2_que_mem_addr[4];
wire [3:0]  rd_addr_2 = dram_Ch2_que_mem_addr[3:0];

// there are 0-63 data valids, each (of the 4) instance in dram_mem.v
// has 64 bit data. total size per instance = 16 deep.
//  $p dv index
//  $q 0 1 2 3 
//  $r addr
assign dv_2[0] =  ((!wr_en_2[0] && (wr_addr_2 == 0) && !dram_Ch2_pa_err) || dv_2_reg[0] ) && 
                 ~((rd_addr_2 == 0) && !rd_en_2);
assign dv_2[1] =  ((!wr_en_2[1] && (wr_addr_2 == 0) && !dram_Ch2_pa_err) || dv_2_reg[1] ) && 
                 ~((rd_addr_2 == 0) && !rd_en_2);
assign dv_2[2] =  ((!wr_en_2[2] && (wr_addr_2 == 0) && !dram_Ch2_pa_err) || dv_2_reg[2] ) && 
                 ~((rd_addr_2 == 0) && !rd_en_2);
assign dv_2[3] =  ((!wr_en_2[3] && (wr_addr_2 == 0) && !dram_Ch2_pa_err) || dv_2_reg[3] ) && 
                 ~((rd_addr_2 == 0) && !rd_en_2);
assign dv_2[4] =  ((!wr_en_2[0] && (wr_addr_2 == 1) && !dram_Ch2_pa_err) || dv_2_reg[4] ) && 
                 ~((rd_addr_2 == 1) && !rd_en_2);
assign dv_2[5] =  ((!wr_en_2[1] && (wr_addr_2 == 1) && !dram_Ch2_pa_err) || dv_2_reg[5] ) && 
                 ~((rd_addr_2 == 1) && !rd_en_2);
assign dv_2[6] =  ((!wr_en_2[2] && (wr_addr_2 == 1) && !dram_Ch2_pa_err) || dv_2_reg[6] ) && 
                 ~((rd_addr_2 == 1) && !rd_en_2);
assign dv_2[7] =  ((!wr_en_2[3] && (wr_addr_2 == 1) && !dram_Ch2_pa_err) || dv_2_reg[7] ) && 
                 ~((rd_addr_2 == 1) && !rd_en_2);
assign dv_2[8] =  ((!wr_en_2[0] && (wr_addr_2 == 2) && !dram_Ch2_pa_err) || dv_2_reg[8] ) && 
                 ~((rd_addr_2 == 2) && !rd_en_2);
assign dv_2[9] =  ((!wr_en_2[1] && (wr_addr_2 == 2) && !dram_Ch2_pa_err) || dv_2_reg[9] ) && 
                 ~((rd_addr_2 == 2) && !rd_en_2);
assign dv_2[10] =  ((!wr_en_2[2] && (wr_addr_2 == 2) && !dram_Ch2_pa_err) || dv_2_reg[10] ) && 
                 ~((rd_addr_2 == 2) && !rd_en_2);
assign dv_2[11] =  ((!wr_en_2[3] && (wr_addr_2 == 2) && !dram_Ch2_pa_err) || dv_2_reg[11] ) && 
                 ~((rd_addr_2 == 2) && !rd_en_2);
assign dv_2[12] =  ((!wr_en_2[0] && (wr_addr_2 == 3) && !dram_Ch2_pa_err) || dv_2_reg[12] ) && 
                 ~((rd_addr_2 == 3) && !rd_en_2);
assign dv_2[13] =  ((!wr_en_2[1] && (wr_addr_2 == 3) && !dram_Ch2_pa_err) || dv_2_reg[13] ) && 
                 ~((rd_addr_2 == 3) && !rd_en_2);
assign dv_2[14] =  ((!wr_en_2[2] && (wr_addr_2 == 3) && !dram_Ch2_pa_err) || dv_2_reg[14] ) && 
                 ~((rd_addr_2 == 3) && !rd_en_2);
assign dv_2[15] =  ((!wr_en_2[3] && (wr_addr_2 == 3) && !dram_Ch2_pa_err) || dv_2_reg[15] ) && 
                 ~((rd_addr_2 == 3) && !rd_en_2);
assign dv_2[16] =  ((!wr_en_2[0] && (wr_addr_2 == 4) && !dram_Ch2_pa_err) || dv_2_reg[16] ) && 
                 ~((rd_addr_2 == 4) && !rd_en_2);
assign dv_2[17] =  ((!wr_en_2[1] && (wr_addr_2 == 4) && !dram_Ch2_pa_err) || dv_2_reg[17] ) && 
                 ~((rd_addr_2 == 4) && !rd_en_2);
assign dv_2[18] =  ((!wr_en_2[2] && (wr_addr_2 == 4) && !dram_Ch2_pa_err) || dv_2_reg[18] ) && 
                 ~((rd_addr_2 == 4) && !rd_en_2);
assign dv_2[19] =  ((!wr_en_2[3] && (wr_addr_2 == 4) && !dram_Ch2_pa_err) || dv_2_reg[19] ) && 
                 ~((rd_addr_2 == 4) && !rd_en_2);
assign dv_2[20] =  ((!wr_en_2[0] && (wr_addr_2 == 5) && !dram_Ch2_pa_err) || dv_2_reg[20] ) && 
                 ~((rd_addr_2 == 5) && !rd_en_2);
assign dv_2[21] =  ((!wr_en_2[1] && (wr_addr_2 == 5) && !dram_Ch2_pa_err) || dv_2_reg[21] ) && 
                 ~((rd_addr_2 == 5) && !rd_en_2);
assign dv_2[22] =  ((!wr_en_2[2] && (wr_addr_2 == 5) && !dram_Ch2_pa_err) || dv_2_reg[22] ) && 
                 ~((rd_addr_2 == 5) && !rd_en_2);
assign dv_2[23] =  ((!wr_en_2[3] && (wr_addr_2 == 5) && !dram_Ch2_pa_err) || dv_2_reg[23] ) && 
                 ~((rd_addr_2 == 5) && !rd_en_2);
assign dv_2[24] =  ((!wr_en_2[0] && (wr_addr_2 == 6) && !dram_Ch2_pa_err) || dv_2_reg[24] ) && 
                 ~((rd_addr_2 == 6) && !rd_en_2);
assign dv_2[25] =  ((!wr_en_2[1] && (wr_addr_2 == 6) && !dram_Ch2_pa_err) || dv_2_reg[25] ) && 
                 ~((rd_addr_2 == 6) && !rd_en_2);
assign dv_2[26] =  ((!wr_en_2[2] && (wr_addr_2 == 6) && !dram_Ch2_pa_err) || dv_2_reg[26] ) && 
                 ~((rd_addr_2 == 6) && !rd_en_2);
assign dv_2[27] =  ((!wr_en_2[3] && (wr_addr_2 == 6) && !dram_Ch2_pa_err) || dv_2_reg[27] ) && 
                 ~((rd_addr_2 == 6) && !rd_en_2);
assign dv_2[28] =  ((!wr_en_2[0] && (wr_addr_2 == 7) && !dram_Ch2_pa_err) || dv_2_reg[28] ) && 
                 ~((rd_addr_2 == 7) && !rd_en_2);
assign dv_2[29] =  ((!wr_en_2[1] && (wr_addr_2 == 7) && !dram_Ch2_pa_err) || dv_2_reg[29] ) && 
                 ~((rd_addr_2 == 7) && !rd_en_2);
assign dv_2[30] =  ((!wr_en_2[2] && (wr_addr_2 == 7) && !dram_Ch2_pa_err) || dv_2_reg[30] ) && 
                 ~((rd_addr_2 == 7) && !rd_en_2);
assign dv_2[31] =  ((!wr_en_2[3] && (wr_addr_2 == 7) && !dram_Ch2_pa_err) || dv_2_reg[31] ) && 
                 ~((rd_addr_2 == 7) && !rd_en_2);
assign dv_2[32] =  ((!wr_en_2[0] && (wr_addr_2 == 8) && !dram_Ch2_pa_err) || dv_2_reg[32] ) && 
                 ~((rd_addr_2 == 8) && !rd_en_2);
assign dv_2[33] =  ((!wr_en_2[1] && (wr_addr_2 == 8) && !dram_Ch2_pa_err) || dv_2_reg[33] ) && 
                 ~((rd_addr_2 == 8) && !rd_en_2);
assign dv_2[34] =  ((!wr_en_2[2] && (wr_addr_2 == 8) && !dram_Ch2_pa_err) || dv_2_reg[34] ) && 
                 ~((rd_addr_2 == 8) && !rd_en_2);
assign dv_2[35] =  ((!wr_en_2[3] && (wr_addr_2 == 8) && !dram_Ch2_pa_err) || dv_2_reg[35] ) && 
                 ~((rd_addr_2 == 8) && !rd_en_2);
assign dv_2[36] =  ((!wr_en_2[0] && (wr_addr_2 == 9) && !dram_Ch2_pa_err) || dv_2_reg[36] ) && 
                 ~((rd_addr_2 == 9) && !rd_en_2);
assign dv_2[37] =  ((!wr_en_2[1] && (wr_addr_2 == 9) && !dram_Ch2_pa_err) || dv_2_reg[37] ) && 
                 ~((rd_addr_2 == 9) && !rd_en_2);
assign dv_2[38] =  ((!wr_en_2[2] && (wr_addr_2 == 9) && !dram_Ch2_pa_err) || dv_2_reg[38] ) && 
                 ~((rd_addr_2 == 9) && !rd_en_2);
assign dv_2[39] =  ((!wr_en_2[3] && (wr_addr_2 == 9) && !dram_Ch2_pa_err) || dv_2_reg[39] ) && 
                 ~((rd_addr_2 == 9) && !rd_en_2);
assign dv_2[40] =  ((!wr_en_2[0] && (wr_addr_2 == 10) && !dram_Ch2_pa_err) || dv_2_reg[40] ) && 
                 ~((rd_addr_2 == 10) && !rd_en_2);
assign dv_2[41] =  ((!wr_en_2[1] && (wr_addr_2 == 10) && !dram_Ch2_pa_err) || dv_2_reg[41] ) && 
                 ~((rd_addr_2 == 10) && !rd_en_2);
assign dv_2[42] =  ((!wr_en_2[2] && (wr_addr_2 == 10) && !dram_Ch2_pa_err) || dv_2_reg[42] ) && 
                 ~((rd_addr_2 == 10) && !rd_en_2);
assign dv_2[43] =  ((!wr_en_2[3] && (wr_addr_2 == 10) && !dram_Ch2_pa_err) || dv_2_reg[43] ) && 
                 ~((rd_addr_2 == 10) && !rd_en_2);
assign dv_2[44] =  ((!wr_en_2[0] && (wr_addr_2 == 11) && !dram_Ch2_pa_err) || dv_2_reg[44] ) && 
                 ~((rd_addr_2 == 11) && !rd_en_2);
assign dv_2[45] =  ((!wr_en_2[1] && (wr_addr_2 == 11) && !dram_Ch2_pa_err) || dv_2_reg[45] ) && 
                 ~((rd_addr_2 == 11) && !rd_en_2);
assign dv_2[46] =  ((!wr_en_2[2] && (wr_addr_2 == 11) && !dram_Ch2_pa_err) || dv_2_reg[46] ) && 
                 ~((rd_addr_2 == 11) && !rd_en_2);
assign dv_2[47] =  ((!wr_en_2[3] && (wr_addr_2 == 11) && !dram_Ch2_pa_err) || dv_2_reg[47] ) && 
                 ~((rd_addr_2 == 11) && !rd_en_2);
assign dv_2[48] =  ((!wr_en_2[0] && (wr_addr_2 == 12) && !dram_Ch2_pa_err) || dv_2_reg[48] ) && 
                 ~((rd_addr_2 == 12) && !rd_en_2);
assign dv_2[49] =  ((!wr_en_2[1] && (wr_addr_2 == 12) && !dram_Ch2_pa_err) || dv_2_reg[49] ) && 
                 ~((rd_addr_2 == 12) && !rd_en_2);
assign dv_2[50] =  ((!wr_en_2[2] && (wr_addr_2 == 12) && !dram_Ch2_pa_err) || dv_2_reg[50] ) && 
                 ~((rd_addr_2 == 12) && !rd_en_2);
assign dv_2[51] =  ((!wr_en_2[3] && (wr_addr_2 == 12) && !dram_Ch2_pa_err) || dv_2_reg[51] ) && 
                 ~((rd_addr_2 == 12) && !rd_en_2);
assign dv_2[52] =  ((!wr_en_2[0] && (wr_addr_2 == 13) && !dram_Ch2_pa_err) || dv_2_reg[52] ) && 
                 ~((rd_addr_2 == 13) && !rd_en_2);
assign dv_2[53] =  ((!wr_en_2[1] && (wr_addr_2 == 13) && !dram_Ch2_pa_err) || dv_2_reg[53] ) && 
                 ~((rd_addr_2 == 13) && !rd_en_2);
assign dv_2[54] =  ((!wr_en_2[2] && (wr_addr_2 == 13) && !dram_Ch2_pa_err) || dv_2_reg[54] ) && 
                 ~((rd_addr_2 == 13) && !rd_en_2);
assign dv_2[55] =  ((!wr_en_2[3] && (wr_addr_2 == 13) && !dram_Ch2_pa_err) || dv_2_reg[55] ) && 
                 ~((rd_addr_2 == 13) && !rd_en_2);
assign dv_2[56] =  ((!wr_en_2[0] && (wr_addr_2 == 14) && !dram_Ch2_pa_err) || dv_2_reg[56] ) && 
                 ~((rd_addr_2 == 14) && !rd_en_2);
assign dv_2[57] =  ((!wr_en_2[1] && (wr_addr_2 == 14) && !dram_Ch2_pa_err) || dv_2_reg[57] ) && 
                 ~((rd_addr_2 == 14) && !rd_en_2);
assign dv_2[58] =  ((!wr_en_2[2] && (wr_addr_2 == 14) && !dram_Ch2_pa_err) || dv_2_reg[58] ) && 
                 ~((rd_addr_2 == 14) && !rd_en_2);
assign dv_2[59] =  ((!wr_en_2[3] && (wr_addr_2 == 14) && !dram_Ch2_pa_err) || dv_2_reg[59] ) && 
                 ~((rd_addr_2 == 14) && !rd_en_2);
assign dv_2[60] =  ((!wr_en_2[0] && (wr_addr_2 == 15) && !dram_Ch2_pa_err) || dv_2_reg[60] ) && 
                 ~((rd_addr_2 == 15) && !rd_en_2);
assign dv_2[61] =  ((!wr_en_2[1] && (wr_addr_2 == 15) && !dram_Ch2_pa_err) || dv_2_reg[61] ) && 
                 ~((rd_addr_2 == 15) && !rd_en_2);
assign dv_2[62] =  ((!wr_en_2[2] && (wr_addr_2 == 15) && !dram_Ch2_pa_err) || dv_2_reg[62] ) && 
                 ~((rd_addr_2 == 15) && !rd_en_2);
assign dv_2[63] =  ((!wr_en_2[3] && (wr_addr_2 == 15) && !dram_Ch2_pa_err) || dv_2_reg[63] ) && 
                 ~((rd_addr_2 == 15) && !rd_en_2);

always @(posedge cmp_clk) begin 
  if (~cmp_rst_l)
   begin
         dv_2_reg <= 64'b0; 
   end
  else begin
         dv_2_reg <= dv_2;
  end
end

// actual monitor
// if read and the locations dv not valid
// monitoring in cmp_clk and so should be monitored only on the first clock
// after which the rd may be valid in the dram clock 
reg  cmp_rst_l_2_1;
reg  [4:0] addr_reg_2;
always @ (posedge cmp_clk)
begin 
if($test$plusargs("WARM_RESET") || $test$plusargs("freq_change")) begin
end else begin 

// need to delay as on 1st dram clk after reset the rd_en has still not
cmp_rst_l_2_1 <= cmp_rst_l;
addr_reg_2     <= {rd_en_2, rd_addr_2};
if (cmp_rst_l_2_1 && (~rd_en_2) && (addr_reg_2 != {rd_en_2, rd_addr_2})) begin
 if (!dv_2_reg[rd_addr_2*4] || !dv_2_reg[rd_addr_2*4 + 1] || 
     !dv_2_reg[rd_addr_2*4 + 2] || !dv_2_reg[rd_addr_2*4 + 3] ) begin 
     $display("ERROR : In dram channel 2 ");
     $display(" At time %0d fifo address = %x is read but not valid, fifo valids = %x", $time, rd_addr_2, dv_2_reg);
     finish_test(" CAS Issued Data not valid ", 2);
  end  
end  
end  
end  


// if write and the locations dv already valid
always @ (posedge cmp_clk)
begin 
if (cmp_rst_l && (~wr_en_2[0])) begin
 if (dv_2_reg[wr_addr_2*4 + 0]) begin 
     $display("ERROR : In dram channel 2 ");
     $display(" At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, wr_addr_2,wr_en_2, dv_2_reg);
     finish_test(" Data Overwritten in write fifo ", 2);
  end  
end  
if (cmp_rst_l && (~wr_en_2[1])) begin
 if (dv_2_reg[wr_addr_2*4 + 1]) begin 
     $display("ERROR : In dram channel 2 ");
     $display(" At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, wr_addr_2,wr_en_2, dv_2_reg);
     finish_test(" Data Overwritten in write fifo ", 2);
  end  
end  
if (cmp_rst_l && (~wr_en_2[2])) begin
 if (dv_2_reg[wr_addr_2*4 + 2]) begin 
     $display("ERROR : In dram channel 2 ");
     $display(" At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, wr_addr_2,wr_en_2, dv_2_reg);
     finish_test(" Data Overwritten in write fifo ", 2);
  end  
end  
if (cmp_rst_l && (~wr_en_2[3])) begin
 if (dv_2_reg[wr_addr_2*4 + 3]) begin 
     $display("ERROR : In dram channel 2 ");
     $display(" At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, wr_addr_2,wr_en_2, dv_2_reg);
     finish_test(" Data Overwritten in write fifo ", 2);
  end  
end  
end  


wire [63:0] dv_3;
reg  [63:0] dv_3_reg;

wire [3:0]  wr_en_3   = dram_Ch3_cpu_wr_en;
wire [3:0]  wr_addr_3 = dram_Ch3_cpu_wr_addr;
wire        rd_en_3   = dram_Ch3_que_mem_addr[4];
wire [3:0]  rd_addr_3 = dram_Ch3_que_mem_addr[3:0];

// there are 0-63 data valids, each (of the 4) instance in dram_mem.v
// has 64 bit data. total size per instance = 16 deep.
//  $p dv index
//  $q 0 1 2 3 
//  $r addr
assign dv_3[0] =  ((!wr_en_3[0] && (wr_addr_3 == 0) && !dram_Ch3_pa_err) || dv_3_reg[0] ) && 
                 ~((rd_addr_3 == 0) && !rd_en_3);
assign dv_3[1] =  ((!wr_en_3[1] && (wr_addr_3 == 0) && !dram_Ch3_pa_err) || dv_3_reg[1] ) && 
                 ~((rd_addr_3 == 0) && !rd_en_3);
assign dv_3[2] =  ((!wr_en_3[2] && (wr_addr_3 == 0) && !dram_Ch3_pa_err) || dv_3_reg[2] ) && 
                 ~((rd_addr_3 == 0) && !rd_en_3);
assign dv_3[3] =  ((!wr_en_3[3] && (wr_addr_3 == 0) && !dram_Ch3_pa_err) || dv_3_reg[3] ) && 
                 ~((rd_addr_3 == 0) && !rd_en_3);
assign dv_3[4] =  ((!wr_en_3[0] && (wr_addr_3 == 1) && !dram_Ch3_pa_err) || dv_3_reg[4] ) && 
                 ~((rd_addr_3 == 1) && !rd_en_3);
assign dv_3[5] =  ((!wr_en_3[1] && (wr_addr_3 == 1) && !dram_Ch3_pa_err) || dv_3_reg[5] ) && 
                 ~((rd_addr_3 == 1) && !rd_en_3);
assign dv_3[6] =  ((!wr_en_3[2] && (wr_addr_3 == 1) && !dram_Ch3_pa_err) || dv_3_reg[6] ) && 
                 ~((rd_addr_3 == 1) && !rd_en_3);
assign dv_3[7] =  ((!wr_en_3[3] && (wr_addr_3 == 1) && !dram_Ch3_pa_err) || dv_3_reg[7] ) && 
                 ~((rd_addr_3 == 1) && !rd_en_3);
assign dv_3[8] =  ((!wr_en_3[0] && (wr_addr_3 == 2) && !dram_Ch3_pa_err) || dv_3_reg[8] ) && 
                 ~((rd_addr_3 == 2) && !rd_en_3);
assign dv_3[9] =  ((!wr_en_3[1] && (wr_addr_3 == 2) && !dram_Ch3_pa_err) || dv_3_reg[9] ) && 
                 ~((rd_addr_3 == 2) && !rd_en_3);
assign dv_3[10] =  ((!wr_en_3[2] && (wr_addr_3 == 2) && !dram_Ch3_pa_err) || dv_3_reg[10] ) && 
                 ~((rd_addr_3 == 2) && !rd_en_3);
assign dv_3[11] =  ((!wr_en_3[3] && (wr_addr_3 == 2) && !dram_Ch3_pa_err) || dv_3_reg[11] ) && 
                 ~((rd_addr_3 == 2) && !rd_en_3);
assign dv_3[12] =  ((!wr_en_3[0] && (wr_addr_3 == 3) && !dram_Ch3_pa_err) || dv_3_reg[12] ) && 
                 ~((rd_addr_3 == 3) && !rd_en_3);
assign dv_3[13] =  ((!wr_en_3[1] && (wr_addr_3 == 3) && !dram_Ch3_pa_err) || dv_3_reg[13] ) && 
                 ~((rd_addr_3 == 3) && !rd_en_3);
assign dv_3[14] =  ((!wr_en_3[2] && (wr_addr_3 == 3) && !dram_Ch3_pa_err) || dv_3_reg[14] ) && 
                 ~((rd_addr_3 == 3) && !rd_en_3);
assign dv_3[15] =  ((!wr_en_3[3] && (wr_addr_3 == 3) && !dram_Ch3_pa_err) || dv_3_reg[15] ) && 
                 ~((rd_addr_3 == 3) && !rd_en_3);
assign dv_3[16] =  ((!wr_en_3[0] && (wr_addr_3 == 4) && !dram_Ch3_pa_err) || dv_3_reg[16] ) && 
                 ~((rd_addr_3 == 4) && !rd_en_3);
assign dv_3[17] =  ((!wr_en_3[1] && (wr_addr_3 == 4) && !dram_Ch3_pa_err) || dv_3_reg[17] ) && 
                 ~((rd_addr_3 == 4) && !rd_en_3);
assign dv_3[18] =  ((!wr_en_3[2] && (wr_addr_3 == 4) && !dram_Ch3_pa_err) || dv_3_reg[18] ) && 
                 ~((rd_addr_3 == 4) && !rd_en_3);
assign dv_3[19] =  ((!wr_en_3[3] && (wr_addr_3 == 4) && !dram_Ch3_pa_err) || dv_3_reg[19] ) && 
                 ~((rd_addr_3 == 4) && !rd_en_3);
assign dv_3[20] =  ((!wr_en_3[0] && (wr_addr_3 == 5) && !dram_Ch3_pa_err) || dv_3_reg[20] ) && 
                 ~((rd_addr_3 == 5) && !rd_en_3);
assign dv_3[21] =  ((!wr_en_3[1] && (wr_addr_3 == 5) && !dram_Ch3_pa_err) || dv_3_reg[21] ) && 
                 ~((rd_addr_3 == 5) && !rd_en_3);
assign dv_3[22] =  ((!wr_en_3[2] && (wr_addr_3 == 5) && !dram_Ch3_pa_err) || dv_3_reg[22] ) && 
                 ~((rd_addr_3 == 5) && !rd_en_3);
assign dv_3[23] =  ((!wr_en_3[3] && (wr_addr_3 == 5) && !dram_Ch3_pa_err) || dv_3_reg[23] ) && 
                 ~((rd_addr_3 == 5) && !rd_en_3);
assign dv_3[24] =  ((!wr_en_3[0] && (wr_addr_3 == 6) && !dram_Ch3_pa_err) || dv_3_reg[24] ) && 
                 ~((rd_addr_3 == 6) && !rd_en_3);
assign dv_3[25] =  ((!wr_en_3[1] && (wr_addr_3 == 6) && !dram_Ch3_pa_err) || dv_3_reg[25] ) && 
                 ~((rd_addr_3 == 6) && !rd_en_3);
assign dv_3[26] =  ((!wr_en_3[2] && (wr_addr_3 == 6) && !dram_Ch3_pa_err) || dv_3_reg[26] ) && 
                 ~((rd_addr_3 == 6) && !rd_en_3);
assign dv_3[27] =  ((!wr_en_3[3] && (wr_addr_3 == 6) && !dram_Ch3_pa_err) || dv_3_reg[27] ) && 
                 ~((rd_addr_3 == 6) && !rd_en_3);
assign dv_3[28] =  ((!wr_en_3[0] && (wr_addr_3 == 7) && !dram_Ch3_pa_err) || dv_3_reg[28] ) && 
                 ~((rd_addr_3 == 7) && !rd_en_3);
assign dv_3[29] =  ((!wr_en_3[1] && (wr_addr_3 == 7) && !dram_Ch3_pa_err) || dv_3_reg[29] ) && 
                 ~((rd_addr_3 == 7) && !rd_en_3);
assign dv_3[30] =  ((!wr_en_3[2] && (wr_addr_3 == 7) && !dram_Ch3_pa_err) || dv_3_reg[30] ) && 
                 ~((rd_addr_3 == 7) && !rd_en_3);
assign dv_3[31] =  ((!wr_en_3[3] && (wr_addr_3 == 7) && !dram_Ch3_pa_err) || dv_3_reg[31] ) && 
                 ~((rd_addr_3 == 7) && !rd_en_3);
assign dv_3[32] =  ((!wr_en_3[0] && (wr_addr_3 == 8) && !dram_Ch3_pa_err) || dv_3_reg[32] ) && 
                 ~((rd_addr_3 == 8) && !rd_en_3);
assign dv_3[33] =  ((!wr_en_3[1] && (wr_addr_3 == 8) && !dram_Ch3_pa_err) || dv_3_reg[33] ) && 
                 ~((rd_addr_3 == 8) && !rd_en_3);
assign dv_3[34] =  ((!wr_en_3[2] && (wr_addr_3 == 8) && !dram_Ch3_pa_err) || dv_3_reg[34] ) && 
                 ~((rd_addr_3 == 8) && !rd_en_3);
assign dv_3[35] =  ((!wr_en_3[3] && (wr_addr_3 == 8) && !dram_Ch3_pa_err) || dv_3_reg[35] ) && 
                 ~((rd_addr_3 == 8) && !rd_en_3);
assign dv_3[36] =  ((!wr_en_3[0] && (wr_addr_3 == 9) && !dram_Ch3_pa_err) || dv_3_reg[36] ) && 
                 ~((rd_addr_3 == 9) && !rd_en_3);
assign dv_3[37] =  ((!wr_en_3[1] && (wr_addr_3 == 9) && !dram_Ch3_pa_err) || dv_3_reg[37] ) && 
                 ~((rd_addr_3 == 9) && !rd_en_3);
assign dv_3[38] =  ((!wr_en_3[2] && (wr_addr_3 == 9) && !dram_Ch3_pa_err) || dv_3_reg[38] ) && 
                 ~((rd_addr_3 == 9) && !rd_en_3);
assign dv_3[39] =  ((!wr_en_3[3] && (wr_addr_3 == 9) && !dram_Ch3_pa_err) || dv_3_reg[39] ) && 
                 ~((rd_addr_3 == 9) && !rd_en_3);
assign dv_3[40] =  ((!wr_en_3[0] && (wr_addr_3 == 10) && !dram_Ch3_pa_err) || dv_3_reg[40] ) && 
                 ~((rd_addr_3 == 10) && !rd_en_3);
assign dv_3[41] =  ((!wr_en_3[1] && (wr_addr_3 == 10) && !dram_Ch3_pa_err) || dv_3_reg[41] ) && 
                 ~((rd_addr_3 == 10) && !rd_en_3);
assign dv_3[42] =  ((!wr_en_3[2] && (wr_addr_3 == 10) && !dram_Ch3_pa_err) || dv_3_reg[42] ) && 
                 ~((rd_addr_3 == 10) && !rd_en_3);
assign dv_3[43] =  ((!wr_en_3[3] && (wr_addr_3 == 10) && !dram_Ch3_pa_err) || dv_3_reg[43] ) && 
                 ~((rd_addr_3 == 10) && !rd_en_3);
assign dv_3[44] =  ((!wr_en_3[0] && (wr_addr_3 == 11) && !dram_Ch3_pa_err) || dv_3_reg[44] ) && 
                 ~((rd_addr_3 == 11) && !rd_en_3);
assign dv_3[45] =  ((!wr_en_3[1] && (wr_addr_3 == 11) && !dram_Ch3_pa_err) || dv_3_reg[45] ) && 
                 ~((rd_addr_3 == 11) && !rd_en_3);
assign dv_3[46] =  ((!wr_en_3[2] && (wr_addr_3 == 11) && !dram_Ch3_pa_err) || dv_3_reg[46] ) && 
                 ~((rd_addr_3 == 11) && !rd_en_3);
assign dv_3[47] =  ((!wr_en_3[3] && (wr_addr_3 == 11) && !dram_Ch3_pa_err) || dv_3_reg[47] ) && 
                 ~((rd_addr_3 == 11) && !rd_en_3);
assign dv_3[48] =  ((!wr_en_3[0] && (wr_addr_3 == 12) && !dram_Ch3_pa_err) || dv_3_reg[48] ) && 
                 ~((rd_addr_3 == 12) && !rd_en_3);
assign dv_3[49] =  ((!wr_en_3[1] && (wr_addr_3 == 12) && !dram_Ch3_pa_err) || dv_3_reg[49] ) && 
                 ~((rd_addr_3 == 12) && !rd_en_3);
assign dv_3[50] =  ((!wr_en_3[2] && (wr_addr_3 == 12) && !dram_Ch3_pa_err) || dv_3_reg[50] ) && 
                 ~((rd_addr_3 == 12) && !rd_en_3);
assign dv_3[51] =  ((!wr_en_3[3] && (wr_addr_3 == 12) && !dram_Ch3_pa_err) || dv_3_reg[51] ) && 
                 ~((rd_addr_3 == 12) && !rd_en_3);
assign dv_3[52] =  ((!wr_en_3[0] && (wr_addr_3 == 13) && !dram_Ch3_pa_err) || dv_3_reg[52] ) && 
                 ~((rd_addr_3 == 13) && !rd_en_3);
assign dv_3[53] =  ((!wr_en_3[1] && (wr_addr_3 == 13) && !dram_Ch3_pa_err) || dv_3_reg[53] ) && 
                 ~((rd_addr_3 == 13) && !rd_en_3);
assign dv_3[54] =  ((!wr_en_3[2] && (wr_addr_3 == 13) && !dram_Ch3_pa_err) || dv_3_reg[54] ) && 
                 ~((rd_addr_3 == 13) && !rd_en_3);
assign dv_3[55] =  ((!wr_en_3[3] && (wr_addr_3 == 13) && !dram_Ch3_pa_err) || dv_3_reg[55] ) && 
                 ~((rd_addr_3 == 13) && !rd_en_3);
assign dv_3[56] =  ((!wr_en_3[0] && (wr_addr_3 == 14) && !dram_Ch3_pa_err) || dv_3_reg[56] ) && 
                 ~((rd_addr_3 == 14) && !rd_en_3);
assign dv_3[57] =  ((!wr_en_3[1] && (wr_addr_3 == 14) && !dram_Ch3_pa_err) || dv_3_reg[57] ) && 
                 ~((rd_addr_3 == 14) && !rd_en_3);
assign dv_3[58] =  ((!wr_en_3[2] && (wr_addr_3 == 14) && !dram_Ch3_pa_err) || dv_3_reg[58] ) && 
                 ~((rd_addr_3 == 14) && !rd_en_3);
assign dv_3[59] =  ((!wr_en_3[3] && (wr_addr_3 == 14) && !dram_Ch3_pa_err) || dv_3_reg[59] ) && 
                 ~((rd_addr_3 == 14) && !rd_en_3);
assign dv_3[60] =  ((!wr_en_3[0] && (wr_addr_3 == 15) && !dram_Ch3_pa_err) || dv_3_reg[60] ) && 
                 ~((rd_addr_3 == 15) && !rd_en_3);
assign dv_3[61] =  ((!wr_en_3[1] && (wr_addr_3 == 15) && !dram_Ch3_pa_err) || dv_3_reg[61] ) && 
                 ~((rd_addr_3 == 15) && !rd_en_3);
assign dv_3[62] =  ((!wr_en_3[2] && (wr_addr_3 == 15) && !dram_Ch3_pa_err) || dv_3_reg[62] ) && 
                 ~((rd_addr_3 == 15) && !rd_en_3);
assign dv_3[63] =  ((!wr_en_3[3] && (wr_addr_3 == 15) && !dram_Ch3_pa_err) || dv_3_reg[63] ) && 
                 ~((rd_addr_3 == 15) && !rd_en_3);

always @(posedge cmp_clk) begin 
  if (~cmp_rst_l)
   begin
         dv_3_reg <= 64'b0; 
   end
  else begin
         dv_3_reg <= dv_3;
  end
end

// actual monitor
// if read and the locations dv not valid
// monitoring in cmp_clk and so should be monitored only on the first clock
// after which the rd may be valid in the dram clock 
reg  cmp_rst_l_3_1;
reg  [4:0] addr_reg_3;
always @ (posedge cmp_clk)
begin 
if($test$plusargs("WARM_RESET") || $test$plusargs("freq_change")) begin
end else begin 

// need to delay as on 1st dram clk after reset the rd_en has still not
cmp_rst_l_3_1 <= cmp_rst_l;
addr_reg_3     <= {rd_en_3, rd_addr_3};
if (cmp_rst_l_3_1 && (~rd_en_3) && (addr_reg_3 != {rd_en_3, rd_addr_3})) begin
 if (!dv_3_reg[rd_addr_3*4] || !dv_3_reg[rd_addr_3*4 + 1] || 
     !dv_3_reg[rd_addr_3*4 + 2] || !dv_3_reg[rd_addr_3*4 + 3] ) begin 
     $display("ERROR : In dram channel 3 ");
     $display(" At time %0d fifo address = %x is read but not valid, fifo valids = %x", $time, rd_addr_3, dv_3_reg);
     finish_test(" CAS Issued Data not valid ", 3);
  end  
end  
end  
end  


// if write and the locations dv already valid
always @ (posedge cmp_clk)
begin 
if (cmp_rst_l && (~wr_en_3[0])) begin
 if (dv_3_reg[wr_addr_3*4 + 0]) begin 
     $display("ERROR : In dram channel 3 ");
     $display(" At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, wr_addr_3,wr_en_3, dv_3_reg);
     finish_test(" Data Overwritten in write fifo ", 3);
  end  
end  
if (cmp_rst_l && (~wr_en_3[1])) begin
 if (dv_3_reg[wr_addr_3*4 + 1]) begin 
     $display("ERROR : In dram channel 3 ");
     $display(" At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, wr_addr_3,wr_en_3, dv_3_reg);
     finish_test(" Data Overwritten in write fifo ", 3);
  end  
end  
if (cmp_rst_l && (~wr_en_3[2])) begin
 if (dv_3_reg[wr_addr_3*4 + 2]) begin 
     $display("ERROR : In dram channel 3 ");
     $display(" At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, wr_addr_3,wr_en_3, dv_3_reg);
     finish_test(" Data Overwritten in write fifo ", 3);
  end  
end  
if (cmp_rst_l && (~wr_en_3[3])) begin
 if (dv_3_reg[wr_addr_3*4 + 3]) begin 
     $display("ERROR : In dram channel 3 ");
     $display(" At time %0d fifo address = %x, wr_enable = %x, is written but already valid, fifo valids = %x", $time, wr_addr_3,wr_en_3, dv_3_reg);
     finish_test(" Data Overwritten in write fifo ", 3);
  end  
end  
end  





// This can actually happen. The ack should not be given if the fifo is full
// wr fifo full and write to write fifo
//.       for ( 4 = 0; 4 < 4; 4++ ) {
//always @( dram_Ch4_wr_colps_q_full or dram_Ch4_wr_q_full or dram_Ch4_wr_req )
//begin 
//if (dram_rst_l) begin
// if ((dram_Ch4_wr_colps_q_full || dram_Ch4_wr_q_full) && dram_Ch4_wr_req)
//  begin 
//    $display("ERROR : In dram channel 4 ");
//    finish_test(" WR Q :  Error Write Q full and Writing into the Write Q ", 4);
//  end
//end
//end
//.}

// Commenting this one as the write can come to the
// dram_que, though a wrenb would be prevented due to
// que full condition.
// This monitor should monitor the wr fifo, but 
// we already have valids for that, so commenting this!
// 07-29-03
// wr addr has data and writing to the same address
// 
//.       for ( 4 = 0; 4 < 4; 4++ ) {
// reg [40:0] wr_q_loc3_4;
//always @( posedge clk)
//begin 
//if (dram_rst_l) begin
//  if ( dram_Ch4_wr_req) begin
//    for(i=0;i<8;i=i+1) begin 
//     wr_q_loc3_4  = dram_Ch4_wr_q[i];
//      if ((wr_q_loc3_4[38:36] == dram_Ch4_wr_addr) && (wr_q_loc3_4[40] || wr_q_loc3_4[39])) begin 
//       $display("ERROR : In dram channel 4 ");
//       finish_test(" WR Q : Write Address in use and WR with same Address Issued ", 4);
//      end
//    end
//  end
//end
//end
//
//.}


// count for wr q and collapsing fifo not same
always @( dram_Ch0_wr_colps_q_cnt or dram_Ch0_wr_q_cnt_arb)
begin 
if (dram_rst_l) begin
 if ( dram_Ch0_wr_colps_q_cnt != dram_Ch0_wr_q_cnt_arb) 
  begin 
   $display("ERROR : In dram channel 0 ");
   finish_test("WR Q : Write Arb Q and Write Collapse fifo entries count not same", 0);
  end
end
end
always @( dram_Ch1_wr_colps_q_cnt or dram_Ch1_wr_q_cnt_arb)
begin 
if (dram_rst_l) begin
 if ( dram_Ch1_wr_colps_q_cnt != dram_Ch1_wr_q_cnt_arb) 
  begin 
   $display("ERROR : In dram channel 1 ");
   finish_test("WR Q : Write Arb Q and Write Collapse fifo entries count not same", 1);
  end
end
end
always @( dram_Ch2_wr_colps_q_cnt or dram_Ch2_wr_q_cnt_arb)
begin 
if (dram_rst_l) begin
 if ( dram_Ch2_wr_colps_q_cnt != dram_Ch2_wr_q_cnt_arb) 
  begin 
   $display("ERROR : In dram channel 2 ");
   finish_test("WR Q : Write Arb Q and Write Collapse fifo entries count not same", 2);
  end
end
end
always @( dram_Ch3_wr_colps_q_cnt or dram_Ch3_wr_q_cnt_arb)
begin 
if (dram_rst_l) begin
 if ( dram_Ch3_wr_colps_q_cnt != dram_Ch3_wr_q_cnt_arb) 
  begin 
   $display("ERROR : In dram channel 3 ");
   finish_test("WR Q : Write Arb Q and Write Collapse fifo entries count not same", 3);
  end
end
end

// wr q valid and data written ( overwritting an existing entry )
 reg [40:0] wr_q_loc4_0;
always @ (dram_Ch0_wr_que_wr_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    wr_q_loc4_0  = dram_Ch0_wr_q[i];
    if ((dram_Ch0_wr_que_wr_ptr[i] == 1'b1) && ((wr_q_loc4_0[39] || wr_q_loc4_0[40]) == 1'b1)) begin 
     $display("ERROR : In dram channel 0 ");
     finish_test(" WR Q : OverWriting to a valid WR Q location", 0);
    end  
  end
end
end
 reg [40:0] wr_q_loc4_1;
always @ (dram_Ch1_wr_que_wr_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    wr_q_loc4_1  = dram_Ch1_wr_q[i];
    if ((dram_Ch1_wr_que_wr_ptr[i] == 1'b1) && ((wr_q_loc4_1[39] || wr_q_loc4_1[40]) == 1'b1)) begin 
     $display("ERROR : In dram channel 1 ");
     finish_test(" WR Q : OverWriting to a valid WR Q location", 1);
    end  
  end
end
end
 reg [40:0] wr_q_loc4_2;
always @ (dram_Ch2_wr_que_wr_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    wr_q_loc4_2  = dram_Ch2_wr_q[i];
    if ((dram_Ch2_wr_que_wr_ptr[i] == 1'b1) && ((wr_q_loc4_2[39] || wr_q_loc4_2[40]) == 1'b1)) begin 
     $display("ERROR : In dram channel 2 ");
     finish_test(" WR Q : OverWriting to a valid WR Q location", 2);
    end  
  end
end
end
 reg [40:0] wr_q_loc4_3;
always @ (dram_Ch3_wr_que_wr_ptr) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    wr_q_loc4_3  = dram_Ch3_wr_q[i];
    if ((dram_Ch3_wr_que_wr_ptr[i] == 1'b1) && ((wr_q_loc4_3[39] || wr_q_loc4_3[40]) == 1'b1)) begin 
     $display("ERROR : In dram channel 3 ");
     finish_test(" WR Q : OverWriting to a valid WR Q location", 3);
    end  
  end
end
end

// wr q not valid and data read ( rd_ptr for wr que arb asserted ) 
 reg [40:0] wr_q_loc5_0;
always @ (posedge clk)
//always @ (dram_Ch0_wr_que_rd_ptr_arb) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    wr_q_loc5_0  = dram_Ch0_wr_q[i];
    if ((dram_Ch0_wr_que_rd_ptr_arb[i] == 1'b1) && (wr_q_loc5_0[40] == 1'b0)) begin 
     $display("ERROR : In dram channel 0 ");
     finish_test(" WR Q : Clearing a WR Q location on arbitration which is not valid ", 0);
    end  
  end
end
end
 reg [40:0] wr_q_loc5_1;
always @ (posedge clk)
//always @ (dram_Ch1_wr_que_rd_ptr_arb) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    wr_q_loc5_1  = dram_Ch1_wr_q[i];
    if ((dram_Ch1_wr_que_rd_ptr_arb[i] == 1'b1) && (wr_q_loc5_1[40] == 1'b0)) begin 
     $display("ERROR : In dram channel 1 ");
     finish_test(" WR Q : Clearing a WR Q location on arbitration which is not valid ", 1);
    end  
  end
end
end
 reg [40:0] wr_q_loc5_2;
always @ (posedge clk)
//always @ (dram_Ch2_wr_que_rd_ptr_arb) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    wr_q_loc5_2  = dram_Ch2_wr_q[i];
    if ((dram_Ch2_wr_que_rd_ptr_arb[i] == 1'b1) && (wr_q_loc5_2[40] == 1'b0)) begin 
     $display("ERROR : In dram channel 2 ");
     finish_test(" WR Q : Clearing a WR Q location on arbitration which is not valid ", 2);
    end  
  end
end
end
 reg [40:0] wr_q_loc5_3;
always @ (posedge clk)
//always @ (dram_Ch3_wr_que_rd_ptr_arb) 
begin 
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    wr_q_loc5_3  = dram_Ch3_wr_q[i];
    if ((dram_Ch3_wr_que_rd_ptr_arb[i] == 1'b1) && (wr_q_loc5_3[40] == 1'b0)) begin 
     $display("ERROR : In dram channel 3 ");
     finish_test(" WR Q : Clearing a WR Q location on arbitration which is not valid ", 3);
    end  
  end
end
end

// wr q not valid and data read ( rd_ptr for wr que asserted ) 
 reg [40:0] wr_q_loc6_0;
always @ (posedge clk)
//always @ (dram_Ch0_wr_que_rd_ptr) 
begin 
     //$display(" at time %0d dram_Ch0_wr_que_rd_ptr = %x", $time, dram_Ch0_wr_que_rd_ptr);
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    wr_q_loc6_0  = dram_Ch0_wr_q[i];
    if ((dram_Ch0_wr_que_rd_ptr[i] == 1'b1) && (wr_q_loc6_0[40] == 1'b0)) begin 
     $display("dram_Ch0_wr_que_rd_ptr = %x", dram_Ch0_wr_que_rd_ptr);
     $display("ERROR : In dram channel 0 ");
     finish_test(" WR Q : Clearing a WR Q location which is not valid ", 0);
    end  
  end
end
end
 reg [40:0] wr_q_loc6_1;
always @ (posedge clk)
//always @ (dram_Ch1_wr_que_rd_ptr) 
begin 
     //$display(" at time %0d dram_Ch1_wr_que_rd_ptr = %x", $time, dram_Ch1_wr_que_rd_ptr);
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    wr_q_loc6_1  = dram_Ch1_wr_q[i];
    if ((dram_Ch1_wr_que_rd_ptr[i] == 1'b1) && (wr_q_loc6_1[40] == 1'b0)) begin 
     $display("dram_Ch1_wr_que_rd_ptr = %x", dram_Ch1_wr_que_rd_ptr);
     $display("ERROR : In dram channel 1 ");
     finish_test(" WR Q : Clearing a WR Q location which is not valid ", 1);
    end  
  end
end
end
 reg [40:0] wr_q_loc6_2;
always @ (posedge clk)
//always @ (dram_Ch2_wr_que_rd_ptr) 
begin 
     //$display(" at time %0d dram_Ch2_wr_que_rd_ptr = %x", $time, dram_Ch2_wr_que_rd_ptr);
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    wr_q_loc6_2  = dram_Ch2_wr_q[i];
    if ((dram_Ch2_wr_que_rd_ptr[i] == 1'b1) && (wr_q_loc6_2[40] == 1'b0)) begin 
     $display("dram_Ch2_wr_que_rd_ptr = %x", dram_Ch2_wr_que_rd_ptr);
     $display("ERROR : In dram channel 2 ");
     finish_test(" WR Q : Clearing a WR Q location which is not valid ", 2);
    end  
  end
end
end
 reg [40:0] wr_q_loc6_3;
always @ (posedge clk)
//always @ (dram_Ch3_wr_que_rd_ptr) 
begin 
     //$display(" at time %0d dram_Ch3_wr_que_rd_ptr = %x", $time, dram_Ch3_wr_que_rd_ptr);
if (dram_rst_l) begin
  for(i=0;i<8;i=i+1) begin 
    wr_q_loc6_3  = dram_Ch3_wr_q[i];
    if ((dram_Ch3_wr_que_rd_ptr[i] == 1'b1) && (wr_q_loc6_3[40] == 1'b0)) begin 
     $display("dram_Ch3_wr_que_rd_ptr = %x", dram_Ch3_wr_que_rd_ptr);
     $display("ERROR : In dram channel 3 ");
     finish_test(" WR Q : Clearing a WR Q location which is not valid ", 3);
    end  
  end
end
end


// Monitor allocation and deallocation time for each entry in the wr q
reg [10:0]  dram_Ch0_wr_q_cntr [7:0];
wire [10:0] dram_Ch0_wr_q_cntr_0 = dram_Ch0_wr_q_cntr[0];
wire [10:0] dram_Ch0_wr_q_cntr_1 = dram_Ch0_wr_q_cntr[1];
wire [10:0] dram_Ch0_wr_q_cntr_2 = dram_Ch0_wr_q_cntr[2];
wire [10:0] dram_Ch0_wr_q_cntr_3 = dram_Ch0_wr_q_cntr[3];
wire [10:0] dram_Ch0_wr_q_cntr_4 = dram_Ch0_wr_q_cntr[4];
wire [10:0] dram_Ch0_wr_q_cntr_5 = dram_Ch0_wr_q_cntr[5];
wire [10:0] dram_Ch0_wr_q_cntr_6 = dram_Ch0_wr_q_cntr[6];
wire [10:0] dram_Ch0_wr_q_cntr_7 = dram_Ch0_wr_q_cntr[7];


always @ (posedge clk)
begin 
  if (~dram_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch0_wr_q_cntr[i] = 0;
     end
   end
  else
   begin
    if (dram_Ch0_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      wr_q_loc7_0  = dram_Ch0_wr_q[i];
      dram_Ch0_wr_q_cntr[i] <= (wr_q_loc7_0[39] == 1'b1) ? dram_Ch0_wr_q_cntr[i] + 1 : 0;
       if ( dram_Ch0_wr_q_cntr[i] > MAX_TIME ) begin 
         $display("ERROR : In dram channel 0 ");
         finish_test(" WR Q : Entry in read que for more that MAX_TIME clocks ", 0);
       end  
     end
    end
   end
end
reg [10:0]  dram_Ch1_wr_q_cntr [7:0];
wire [10:0] dram_Ch1_wr_q_cntr_0 = dram_Ch1_wr_q_cntr[0];
wire [10:0] dram_Ch1_wr_q_cntr_1 = dram_Ch1_wr_q_cntr[1];
wire [10:0] dram_Ch1_wr_q_cntr_2 = dram_Ch1_wr_q_cntr[2];
wire [10:0] dram_Ch1_wr_q_cntr_3 = dram_Ch1_wr_q_cntr[3];
wire [10:0] dram_Ch1_wr_q_cntr_4 = dram_Ch1_wr_q_cntr[4];
wire [10:0] dram_Ch1_wr_q_cntr_5 = dram_Ch1_wr_q_cntr[5];
wire [10:0] dram_Ch1_wr_q_cntr_6 = dram_Ch1_wr_q_cntr[6];
wire [10:0] dram_Ch1_wr_q_cntr_7 = dram_Ch1_wr_q_cntr[7];


always @ (posedge clk)
begin 
  if (~dram_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch1_wr_q_cntr[i] = 0;
     end
   end
  else
   begin
    if (dram_Ch1_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      wr_q_loc7_1  = dram_Ch1_wr_q[i];
      dram_Ch1_wr_q_cntr[i] <= (wr_q_loc7_1[39] == 1'b1) ? dram_Ch1_wr_q_cntr[i] + 1 : 0;
       if ( dram_Ch1_wr_q_cntr[i] > MAX_TIME ) begin 
         $display("ERROR : In dram channel 1 ");
         finish_test(" WR Q : Entry in read que for more that MAX_TIME clocks ", 1);
       end  
     end
    end
   end
end
reg [10:0]  dram_Ch2_wr_q_cntr [7:0];
wire [10:0] dram_Ch2_wr_q_cntr_0 = dram_Ch2_wr_q_cntr[0];
wire [10:0] dram_Ch2_wr_q_cntr_1 = dram_Ch2_wr_q_cntr[1];
wire [10:0] dram_Ch2_wr_q_cntr_2 = dram_Ch2_wr_q_cntr[2];
wire [10:0] dram_Ch2_wr_q_cntr_3 = dram_Ch2_wr_q_cntr[3];
wire [10:0] dram_Ch2_wr_q_cntr_4 = dram_Ch2_wr_q_cntr[4];
wire [10:0] dram_Ch2_wr_q_cntr_5 = dram_Ch2_wr_q_cntr[5];
wire [10:0] dram_Ch2_wr_q_cntr_6 = dram_Ch2_wr_q_cntr[6];
wire [10:0] dram_Ch2_wr_q_cntr_7 = dram_Ch2_wr_q_cntr[7];


always @ (posedge clk)
begin 
  if (~dram_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch2_wr_q_cntr[i] = 0;
     end
   end
  else
   begin
    if (dram_Ch2_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      wr_q_loc7_2  = dram_Ch2_wr_q[i];
      dram_Ch2_wr_q_cntr[i] <= (wr_q_loc7_2[39] == 1'b1) ? dram_Ch2_wr_q_cntr[i] + 1 : 0;
       if ( dram_Ch2_wr_q_cntr[i] > MAX_TIME ) begin 
         $display("ERROR : In dram channel 2 ");
         finish_test(" WR Q : Entry in read que for more that MAX_TIME clocks ", 2);
       end  
     end
    end
   end
end
reg [10:0]  dram_Ch3_wr_q_cntr [7:0];
wire [10:0] dram_Ch3_wr_q_cntr_0 = dram_Ch3_wr_q_cntr[0];
wire [10:0] dram_Ch3_wr_q_cntr_1 = dram_Ch3_wr_q_cntr[1];
wire [10:0] dram_Ch3_wr_q_cntr_2 = dram_Ch3_wr_q_cntr[2];
wire [10:0] dram_Ch3_wr_q_cntr_3 = dram_Ch3_wr_q_cntr[3];
wire [10:0] dram_Ch3_wr_q_cntr_4 = dram_Ch3_wr_q_cntr[4];
wire [10:0] dram_Ch3_wr_q_cntr_5 = dram_Ch3_wr_q_cntr[5];
wire [10:0] dram_Ch3_wr_q_cntr_6 = dram_Ch3_wr_q_cntr[6];
wire [10:0] dram_Ch3_wr_q_cntr_7 = dram_Ch3_wr_q_cntr[7];


always @ (posedge clk)
begin 
  if (~dram_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch3_wr_q_cntr[i] = 0;
     end
   end
  else
   begin
    if (dram_Ch3_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      wr_q_loc7_3  = dram_Ch3_wr_q[i];
      dram_Ch3_wr_q_cntr[i] <= (wr_q_loc7_3[39] == 1'b1) ? dram_Ch3_wr_q_cntr[i] + 1 : 0;
       if ( dram_Ch3_wr_q_cntr[i] > MAX_TIME ) begin 
         $display("ERROR : In dram channel 3 ");
         finish_test(" WR Q : Entry in read que for more that MAX_TIME clocks ", 3);
       end  
     end
    end
   end
end


// Monitor a case when the wr_req comes when the queue is full.
// Then q goes from full to not full and that read is taken.
reg [1:0] dram_wr_req_q_full_Ch0_wr_taken_state;
wire      dram_wr_q_full_Ch0_l2 = ((&dram_Ch0_l2if_b0_wr_val) && (&dram_Ch0_l2if_b1_wr_val));
always @ (posedge cmp_clk)
begin
  if (~cmp_rst_l)
   begin
    dram_wr_req_q_full_Ch0_wr_taken_state <= 2'b00;
   end
  else
   begin

   case(dram_wr_req_q_full_Ch0_wr_taken_state)
    2'b00 : begin 
               if (dram_Ch0_sctag_dram_wr_req && dram_wr_q_full_Ch0_l2)
                 dram_wr_req_q_full_Ch0_wr_taken_state <= 2'b01;
              end
    2'b01 : begin 
               if (dram_Ch0_sctag_dram_wr_req && ~dram_wr_q_full_Ch0_l2)
                 dram_wr_req_q_full_Ch0_wr_taken_state <= 2'b10;
              end
    2'b10 : begin 
               if (~dram_Ch0_sctag_dram_wr_req)
                 dram_wr_req_q_full_Ch0_wr_taken_state <= 2'b11;
              end
    2'b11 : begin 
                 dram_wr_req_q_full_Ch0_wr_taken_state <= 2'b00;
              end
    default : begin 
                 dram_wr_req_q_full_Ch0_wr_taken_state <= 2'b00;
              end

   endcase
  end 
end
reg [1:0] dram_wr_req_q_full_Ch1_wr_taken_state;
wire      dram_wr_q_full_Ch1_l2 = ((&dram_Ch1_l2if_b0_wr_val) && (&dram_Ch1_l2if_b1_wr_val));
always @ (posedge cmp_clk)
begin
  if (~cmp_rst_l)
   begin
    dram_wr_req_q_full_Ch1_wr_taken_state <= 2'b00;
   end
  else
   begin

   case(dram_wr_req_q_full_Ch1_wr_taken_state)
    2'b00 : begin 
               if (dram_Ch1_sctag_dram_wr_req && dram_wr_q_full_Ch1_l2)
                 dram_wr_req_q_full_Ch1_wr_taken_state <= 2'b01;
              end
    2'b01 : begin 
               if (dram_Ch1_sctag_dram_wr_req && ~dram_wr_q_full_Ch1_l2)
                 dram_wr_req_q_full_Ch1_wr_taken_state <= 2'b10;
              end
    2'b10 : begin 
               if (~dram_Ch1_sctag_dram_wr_req)
                 dram_wr_req_q_full_Ch1_wr_taken_state <= 2'b11;
              end
    2'b11 : begin 
                 dram_wr_req_q_full_Ch1_wr_taken_state <= 2'b00;
              end
    default : begin 
                 dram_wr_req_q_full_Ch1_wr_taken_state <= 2'b00;
              end

   endcase
  end 
end
reg [1:0] dram_wr_req_q_full_Ch2_wr_taken_state;
wire      dram_wr_q_full_Ch2_l2 = ((&dram_Ch2_l2if_b0_wr_val) && (&dram_Ch2_l2if_b1_wr_val));
always @ (posedge cmp_clk)
begin
  if (~cmp_rst_l)
   begin
    dram_wr_req_q_full_Ch2_wr_taken_state <= 2'b00;
   end
  else
   begin

   case(dram_wr_req_q_full_Ch2_wr_taken_state)
    2'b00 : begin 
               if (dram_Ch2_sctag_dram_wr_req && dram_wr_q_full_Ch2_l2)
                 dram_wr_req_q_full_Ch2_wr_taken_state <= 2'b01;
              end
    2'b01 : begin 
               if (dram_Ch2_sctag_dram_wr_req && ~dram_wr_q_full_Ch2_l2)
                 dram_wr_req_q_full_Ch2_wr_taken_state <= 2'b10;
              end
    2'b10 : begin 
               if (~dram_Ch2_sctag_dram_wr_req)
                 dram_wr_req_q_full_Ch2_wr_taken_state <= 2'b11;
              end
    2'b11 : begin 
                 dram_wr_req_q_full_Ch2_wr_taken_state <= 2'b00;
              end
    default : begin 
                 dram_wr_req_q_full_Ch2_wr_taken_state <= 2'b00;
              end

   endcase
  end 
end
reg [1:0] dram_wr_req_q_full_Ch3_wr_taken_state;
wire      dram_wr_q_full_Ch3_l2 = ((&dram_Ch3_l2if_b0_wr_val) && (&dram_Ch3_l2if_b1_wr_val));
always @ (posedge cmp_clk)
begin
  if (~cmp_rst_l)
   begin
    dram_wr_req_q_full_Ch3_wr_taken_state <= 2'b00;
   end
  else
   begin

   case(dram_wr_req_q_full_Ch3_wr_taken_state)
    2'b00 : begin 
               if (dram_Ch3_sctag_dram_wr_req && dram_wr_q_full_Ch3_l2)
                 dram_wr_req_q_full_Ch3_wr_taken_state <= 2'b01;
              end
    2'b01 : begin 
               if (dram_Ch3_sctag_dram_wr_req && ~dram_wr_q_full_Ch3_l2)
                 dram_wr_req_q_full_Ch3_wr_taken_state <= 2'b10;
              end
    2'b10 : begin 
               if (~dram_Ch3_sctag_dram_wr_req)
                 dram_wr_req_q_full_Ch3_wr_taken_state <= 2'b11;
              end
    2'b11 : begin 
                 dram_wr_req_q_full_Ch3_wr_taken_state <= 2'b00;
              end
    default : begin 
                 dram_wr_req_q_full_Ch3_wr_taken_state <= 2'b00;
              end

   endcase
  end 
end


//=====================================================================
//  Monitor for observing the oldest rd/wr to the bank is picked
//=====================================================================

reg [2:0] st_indx_rd_0;
reg [2:0] st_indx_rd_tmp_0;
reg       flag_rd_0;
reg       flag_wr_0;
reg [8:0] curr_bank_rd_0, ltst_bank_rd_0, curr_rd_ent_0;
reg [2:0] st_indx_wr_0;
reg [2:0] st_indx_wr_tmp_0;
reg [8:0] curr_bank_wr_0, ltst_bank_wr_0, curr_wr_ent_0;

always @ (posedge clk)
begin
  if (~dram_rst_l)
   begin
   end
  else begin 
    //if (dram_Ch0_que_ras_bank_picked_en && dram_Ch0_que_b0_rd_picked && ~dram_Ch0_que_scrb_picked && ~dram_Ch0_que_b0_cmd_picked) begin 
    // even when rd_picked is 0, when cmd is 0 , rd picked
    if (dram_Ch0_que_this_ch_picked &&  ~dram_Ch0_que_scrb_picked && ~dram_Ch0_que_b0_cmd_picked) begin 
      st_indx_rd_tmp_0 = dram_Ch0_que_b0_index_picked;
      // from the index extract the bank info from the collps ques
      flag_rd_0 = 0;
       for(i= 0;i<8;i=i+1) begin 
        if(~flag_rd_0) begin 
         curr_rd_ent_0 = dram_Ch0_rd_colps_q[i];
         flag_rd_0 = (curr_rd_ent_0[6] && (curr_rd_ent_0[5:3] == st_indx_rd_tmp_0));
         curr_bank_rd_0 = (flag_rd_0) ? curr_rd_ent_0 : 0;
         st_indx_rd_0   = (flag_rd_0) ? i : 7;
        end
       end

      //curr_bank_rd_0 = dram_Ch0_rd_colps_q[st_indx_rd_0];
     for(i= st_indx_rd_0+1;i<8;i=i+1) begin 
       ltst_bank_rd_0 = dram_Ch0_rd_colps_q[i];
       // chip select (phy bank) and logical bank should be same
       if (({curr_bank_rd_0[8:7], curr_bank_rd_0[2:0]} == {ltst_bank_rd_0[8:7], ltst_bank_rd_0[2:0]}) && ltst_bank_rd_0[6] ) begin 
         $display("ERROR : In dram channel 0 ");
         $display(" at time %0d select index = %d and index = %d, index picked = %x", $time, st_indx_rd_0, i,dram_Ch0_que_b0_index_picked);
          for(j= 0;j<8;j=j+1) begin
         $display(" at time %0d collapsing fifo entry[%d] = %x", $time, j, dram_Ch0_rd_colps_q[j]);
          end
         finish_test(" OLD_ENTRY_PEND (RD Q) : Oldest pending entry in the Q not selected ", 0);
       end
     end
    end

    //if (dram_Ch0_que_ras_bank_picked_en && dram_Ch0_que_b0_wr_picked && ~dram_Ch0_que_scrb_picked && dram_Ch0_que_b0_cmd_picked) begin 
    // cmd picked = 1, wr picked
    if (dram_Ch0_que_this_ch_picked && ~dram_Ch0_que_scrb_picked && dram_Ch0_que_b0_cmd_picked) begin 
      st_indx_wr_tmp_0 = dram_Ch0_que_b0_index_picked;
      // from the index extract the bank info from the collps ques
      flag_wr_0 = 0;
       for(i= 0;i<8;i=i+1) begin 
        if(~flag_wr_0) begin 
         curr_wr_ent_0 = dram_Ch0_wr_colps_q[i];
         flag_wr_0 = (curr_wr_ent_0[6] && (curr_wr_ent_0[5:3] == st_indx_wr_tmp_0));
         curr_bank_wr_0 = (flag_wr_0) ? curr_wr_ent_0 : 0;
         st_indx_wr_0   = (flag_wr_0) ? i : 7; 
        end
       end

      //curr_bank_wr_0 = dram_Ch0_wr_colps_q[st_indx_wr_0];
     for(i= st_indx_wr_0+1;i<8;i=i+1) begin 
       ltst_bank_wr_0 = dram_Ch0_wr_colps_q[i];
       if (({curr_bank_wr_0[8:7], curr_bank_wr_0[2:0]} == {ltst_bank_wr_0[8:7], ltst_bank_wr_0[2:0]}) && ltst_bank_wr_0[6] ) begin 
         $display("ERROR : In dram channel 0 ");
         $display(" at time %0d select index = %d and index = %d, index picked = %x", $time, st_indx_wr_0, i,dram_Ch0_que_b0_index_picked);
          for(j= 0;j<8;j=j+1) begin
         $display(" at time %0d collapsing fifo entry[%d] = %x", $time, j, dram_Ch0_wr_colps_q[j]);
          end
         $display(" at time %0d select index = %d and index = %d", $time, st_indx_wr_0, i);
         finish_test(" OLD_ENTRY_PEND (WR Q) : Oldest pending entry in the Q not selected ", 0);
       end
     end
    end

  end

end

reg [2:0] st_indx_rd_1;
reg [2:0] st_indx_rd_tmp_1;
reg       flag_rd_1;
reg       flag_wr_1;
reg [8:0] curr_bank_rd_1, ltst_bank_rd_1, curr_rd_ent_1;
reg [2:0] st_indx_wr_1;
reg [2:0] st_indx_wr_tmp_1;
reg [8:0] curr_bank_wr_1, ltst_bank_wr_1, curr_wr_ent_1;

always @ (posedge clk)
begin
  if (~dram_rst_l)
   begin
   end
  else begin 
    //if (dram_Ch1_que_ras_bank_picked_en && dram_Ch1_que_b0_rd_picked && ~dram_Ch1_que_scrb_picked && ~dram_Ch1_que_b0_cmd_picked) begin 
    // even when rd_picked is 0, when cmd is 0 , rd picked
    if (dram_Ch1_que_this_ch_picked &&  ~dram_Ch1_que_scrb_picked && ~dram_Ch1_que_b0_cmd_picked) begin 
      st_indx_rd_tmp_1 = dram_Ch1_que_b0_index_picked;
      // from the index extract the bank info from the collps ques
      flag_rd_1 = 0;
       for(i= 0;i<8;i=i+1) begin 
        if(~flag_rd_1) begin 
         curr_rd_ent_1 = dram_Ch1_rd_colps_q[i];
         flag_rd_1 = (curr_rd_ent_1[6] && (curr_rd_ent_1[5:3] == st_indx_rd_tmp_1));
         curr_bank_rd_1 = (flag_rd_1) ? curr_rd_ent_1 : 0;
         st_indx_rd_1   = (flag_rd_1) ? i : 7;
        end
       end

      //curr_bank_rd_1 = dram_Ch1_rd_colps_q[st_indx_rd_1];
     for(i= st_indx_rd_1+1;i<8;i=i+1) begin 
       ltst_bank_rd_1 = dram_Ch1_rd_colps_q[i];
       // chip select (phy bank) and logical bank should be same
       if (({curr_bank_rd_1[8:7], curr_bank_rd_1[2:0]} == {ltst_bank_rd_1[8:7], ltst_bank_rd_1[2:0]}) && ltst_bank_rd_1[6] ) begin 
         $display("ERROR : In dram channel 1 ");
         $display(" at time %0d select index = %d and index = %d, index picked = %x", $time, st_indx_rd_1, i,dram_Ch1_que_b0_index_picked);
          for(j= 0;j<8;j=j+1) begin
         $display(" at time %0d collapsing fifo entry[%d] = %x", $time, j, dram_Ch1_rd_colps_q[j]);
          end
         finish_test(" OLD_ENTRY_PEND (RD Q) : Oldest pending entry in the Q not selected ", 1);
       end
     end
    end

    //if (dram_Ch1_que_ras_bank_picked_en && dram_Ch1_que_b0_wr_picked && ~dram_Ch1_que_scrb_picked && dram_Ch1_que_b0_cmd_picked) begin 
    // cmd picked = 1, wr picked
    if (dram_Ch1_que_this_ch_picked && ~dram_Ch1_que_scrb_picked && dram_Ch1_que_b0_cmd_picked) begin 
      st_indx_wr_tmp_1 = dram_Ch1_que_b0_index_picked;
      // from the index extract the bank info from the collps ques
      flag_wr_1 = 0;
       for(i= 0;i<8;i=i+1) begin 
        if(~flag_wr_1) begin 
         curr_wr_ent_1 = dram_Ch1_wr_colps_q[i];
         flag_wr_1 = (curr_wr_ent_1[6] && (curr_wr_ent_1[5:3] == st_indx_wr_tmp_1));
         curr_bank_wr_1 = (flag_wr_1) ? curr_wr_ent_1 : 0;
         st_indx_wr_1   = (flag_wr_1) ? i : 7; 
        end
       end

      //curr_bank_wr_1 = dram_Ch1_wr_colps_q[st_indx_wr_1];
     for(i= st_indx_wr_1+1;i<8;i=i+1) begin 
       ltst_bank_wr_1 = dram_Ch1_wr_colps_q[i];
       if (({curr_bank_wr_1[8:7], curr_bank_wr_1[2:0]} == {ltst_bank_wr_1[8:7], ltst_bank_wr_1[2:0]}) && ltst_bank_wr_1[6] ) begin 
         $display("ERROR : In dram channel 1 ");
         $display(" at time %0d select index = %d and index = %d, index picked = %x", $time, st_indx_wr_1, i,dram_Ch1_que_b0_index_picked);
          for(j= 0;j<8;j=j+1) begin
         $display(" at time %0d collapsing fifo entry[%d] = %x", $time, j, dram_Ch1_wr_colps_q[j]);
          end
         $display(" at time %0d select index = %d and index = %d", $time, st_indx_wr_1, i);
         finish_test(" OLD_ENTRY_PEND (WR Q) : Oldest pending entry in the Q not selected ", 1);
       end
     end
    end

  end

end

reg [2:0] st_indx_rd_2;
reg [2:0] st_indx_rd_tmp_2;
reg       flag_rd_2;
reg       flag_wr_2;
reg [8:0] curr_bank_rd_2, ltst_bank_rd_2, curr_rd_ent_2;
reg [2:0] st_indx_wr_2;
reg [2:0] st_indx_wr_tmp_2;
reg [8:0] curr_bank_wr_2, ltst_bank_wr_2, curr_wr_ent_2;

always @ (posedge clk)
begin
  if (~dram_rst_l)
   begin
   end
  else begin 
    //if (dram_Ch2_que_ras_bank_picked_en && dram_Ch2_que_b0_rd_picked && ~dram_Ch2_que_scrb_picked && ~dram_Ch2_que_b0_cmd_picked) begin 
    // even when rd_picked is 0, when cmd is 0 , rd picked
    if (dram_Ch2_que_this_ch_picked &&  ~dram_Ch2_que_scrb_picked && ~dram_Ch2_que_b0_cmd_picked) begin 
      st_indx_rd_tmp_2 = dram_Ch2_que_b0_index_picked;
      // from the index extract the bank info from the collps ques
      flag_rd_2 = 0;
       for(i= 0;i<8;i=i+1) begin 
        if(~flag_rd_2) begin 
         curr_rd_ent_2 = dram_Ch2_rd_colps_q[i];
         flag_rd_2 = (curr_rd_ent_2[6] && (curr_rd_ent_2[5:3] == st_indx_rd_tmp_2));
         curr_bank_rd_2 = (flag_rd_2) ? curr_rd_ent_2 : 0;
         st_indx_rd_2   = (flag_rd_2) ? i : 7;
        end
       end

      //curr_bank_rd_2 = dram_Ch2_rd_colps_q[st_indx_rd_2];
     for(i= st_indx_rd_2+1;i<8;i=i+1) begin 
       ltst_bank_rd_2 = dram_Ch2_rd_colps_q[i];
       // chip select (phy bank) and logical bank should be same
       if (({curr_bank_rd_2[8:7], curr_bank_rd_2[2:0]} == {ltst_bank_rd_2[8:7], ltst_bank_rd_2[2:0]}) && ltst_bank_rd_2[6] ) begin 
         $display("ERROR : In dram channel 2 ");
         $display(" at time %0d select index = %d and index = %d, index picked = %x", $time, st_indx_rd_2, i,dram_Ch2_que_b0_index_picked);
          for(j= 0;j<8;j=j+1) begin
         $display(" at time %0d collapsing fifo entry[%d] = %x", $time, j, dram_Ch2_rd_colps_q[j]);
          end
         finish_test(" OLD_ENTRY_PEND (RD Q) : Oldest pending entry in the Q not selected ", 2);
       end
     end
    end

    //if (dram_Ch2_que_ras_bank_picked_en && dram_Ch2_que_b0_wr_picked && ~dram_Ch2_que_scrb_picked && dram_Ch2_que_b0_cmd_picked) begin 
    // cmd picked = 1, wr picked
    if (dram_Ch2_que_this_ch_picked && ~dram_Ch2_que_scrb_picked && dram_Ch2_que_b0_cmd_picked) begin 
      st_indx_wr_tmp_2 = dram_Ch2_que_b0_index_picked;
      // from the index extract the bank info from the collps ques
      flag_wr_2 = 0;
       for(i= 0;i<8;i=i+1) begin 
        if(~flag_wr_2) begin 
         curr_wr_ent_2 = dram_Ch2_wr_colps_q[i];
         flag_wr_2 = (curr_wr_ent_2[6] && (curr_wr_ent_2[5:3] == st_indx_wr_tmp_2));
         curr_bank_wr_2 = (flag_wr_2) ? curr_wr_ent_2 : 0;
         st_indx_wr_2   = (flag_wr_2) ? i : 7; 
        end
       end

      //curr_bank_wr_2 = dram_Ch2_wr_colps_q[st_indx_wr_2];
     for(i= st_indx_wr_2+1;i<8;i=i+1) begin 
       ltst_bank_wr_2 = dram_Ch2_wr_colps_q[i];
       if (({curr_bank_wr_2[8:7], curr_bank_wr_2[2:0]} == {ltst_bank_wr_2[8:7], ltst_bank_wr_2[2:0]}) && ltst_bank_wr_2[6] ) begin 
         $display("ERROR : In dram channel 2 ");
         $display(" at time %0d select index = %d and index = %d, index picked = %x", $time, st_indx_wr_2, i,dram_Ch2_que_b0_index_picked);
          for(j= 0;j<8;j=j+1) begin
         $display(" at time %0d collapsing fifo entry[%d] = %x", $time, j, dram_Ch2_wr_colps_q[j]);
          end
         $display(" at time %0d select index = %d and index = %d", $time, st_indx_wr_2, i);
         finish_test(" OLD_ENTRY_PEND (WR Q) : Oldest pending entry in the Q not selected ", 2);
       end
     end
    end

  end

end

reg [2:0] st_indx_rd_3;
reg [2:0] st_indx_rd_tmp_3;
reg       flag_rd_3;
reg       flag_wr_3;
reg [8:0] curr_bank_rd_3, ltst_bank_rd_3, curr_rd_ent_3;
reg [2:0] st_indx_wr_3;
reg [2:0] st_indx_wr_tmp_3;
reg [8:0] curr_bank_wr_3, ltst_bank_wr_3, curr_wr_ent_3;

always @ (posedge clk)
begin
  if (~dram_rst_l)
   begin
   end
  else begin 
    //if (dram_Ch3_que_ras_bank_picked_en && dram_Ch3_que_b0_rd_picked && ~dram_Ch3_que_scrb_picked && ~dram_Ch3_que_b0_cmd_picked) begin 
    // even when rd_picked is 0, when cmd is 0 , rd picked
    if (dram_Ch3_que_this_ch_picked &&  ~dram_Ch3_que_scrb_picked && ~dram_Ch3_que_b0_cmd_picked) begin 
      st_indx_rd_tmp_3 = dram_Ch3_que_b0_index_picked;
      // from the index extract the bank info from the collps ques
      flag_rd_3 = 0;
       for(i= 0;i<8;i=i+1) begin 
        if(~flag_rd_3) begin 
         curr_rd_ent_3 = dram_Ch3_rd_colps_q[i];
         flag_rd_3 = (curr_rd_ent_3[6] && (curr_rd_ent_3[5:3] == st_indx_rd_tmp_3));
         curr_bank_rd_3 = (flag_rd_3) ? curr_rd_ent_3 : 0;
         st_indx_rd_3   = (flag_rd_3) ? i : 7;
        end
       end

      //curr_bank_rd_3 = dram_Ch3_rd_colps_q[st_indx_rd_3];
     for(i= st_indx_rd_3+1;i<8;i=i+1) begin 
       ltst_bank_rd_3 = dram_Ch3_rd_colps_q[i];
       // chip select (phy bank) and logical bank should be same
       if (({curr_bank_rd_3[8:7], curr_bank_rd_3[2:0]} == {ltst_bank_rd_3[8:7], ltst_bank_rd_3[2:0]}) && ltst_bank_rd_3[6] ) begin 
         $display("ERROR : In dram channel 3 ");
         $display(" at time %0d select index = %d and index = %d, index picked = %x", $time, st_indx_rd_3, i,dram_Ch3_que_b0_index_picked);
          for(j= 0;j<8;j=j+1) begin
         $display(" at time %0d collapsing fifo entry[%d] = %x", $time, j, dram_Ch3_rd_colps_q[j]);
          end
         finish_test(" OLD_ENTRY_PEND (RD Q) : Oldest pending entry in the Q not selected ", 3);
       end
     end
    end

    //if (dram_Ch3_que_ras_bank_picked_en && dram_Ch3_que_b0_wr_picked && ~dram_Ch3_que_scrb_picked && dram_Ch3_que_b0_cmd_picked) begin 
    // cmd picked = 1, wr picked
    if (dram_Ch3_que_this_ch_picked && ~dram_Ch3_que_scrb_picked && dram_Ch3_que_b0_cmd_picked) begin 
      st_indx_wr_tmp_3 = dram_Ch3_que_b0_index_picked;
      // from the index extract the bank info from the collps ques
      flag_wr_3 = 0;
       for(i= 0;i<8;i=i+1) begin 
        if(~flag_wr_3) begin 
         curr_wr_ent_3 = dram_Ch3_wr_colps_q[i];
         flag_wr_3 = (curr_wr_ent_3[6] && (curr_wr_ent_3[5:3] == st_indx_wr_tmp_3));
         curr_bank_wr_3 = (flag_wr_3) ? curr_wr_ent_3 : 0;
         st_indx_wr_3   = (flag_wr_3) ? i : 7; 
        end
       end

      //curr_bank_wr_3 = dram_Ch3_wr_colps_q[st_indx_wr_3];
     for(i= st_indx_wr_3+1;i<8;i=i+1) begin 
       ltst_bank_wr_3 = dram_Ch3_wr_colps_q[i];
       if (({curr_bank_wr_3[8:7], curr_bank_wr_3[2:0]} == {ltst_bank_wr_3[8:7], ltst_bank_wr_3[2:0]}) && ltst_bank_wr_3[6] ) begin 
         $display("ERROR : In dram channel 3 ");
         $display(" at time %0d select index = %d and index = %d, index picked = %x", $time, st_indx_wr_3, i,dram_Ch3_que_b0_index_picked);
          for(j= 0;j<8;j=j+1) begin
         $display(" at time %0d collapsing fifo entry[%d] = %x", $time, j, dram_Ch3_wr_colps_q[j]);
          end
         $display(" at time %0d select index = %d and index = %d", $time, st_indx_wr_3, i);
         finish_test(" OLD_ENTRY_PEND (WR Q) : Oldest pending entry in the Q not selected ", 3);
       end
     end
    end

  end

end



//=====================================================================
//  Monitor Rd sequencing : when wr to same address pending , rd 
//  (same address as wr) should not be issued
//=====================================================================



reg [39:0] rd_ent0_0;
always @(posedge dram_Ch0_wr_q_0[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent0_0 =  dram_Ch0_rd_q[i];
        if((dram_Ch0_wr_q_0[35:0] == rd_ent0_0[35:0]) && rd_ent0_0[39]) begin 
           $display("ERROR : In dram channel 0 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 0 ", $time, i, rd_ent0_0[35:0]);

           finish_test("RD/WR Sequencing violation  ", 0);
          end
       end
end

reg [39:0] rd_ent0_1;
always @(posedge dram_Ch0_wr_q_1[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent0_1 =  dram_Ch0_rd_q[i];
        if((dram_Ch0_wr_q_1[35:0] == rd_ent0_1[35:0]) && rd_ent0_1[39]) begin 
           $display("ERROR : In dram channel 0 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 1 ", $time, i, rd_ent0_1[35:0]);

           finish_test("RD/WR Sequencing violation  ", 0);
          end
       end
end

reg [39:0] rd_ent0_2;
always @(posedge dram_Ch0_wr_q_2[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent0_2 =  dram_Ch0_rd_q[i];
        if((dram_Ch0_wr_q_2[35:0] == rd_ent0_2[35:0]) && rd_ent0_2[39]) begin 
           $display("ERROR : In dram channel 0 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 2 ", $time, i, rd_ent0_2[35:0]);

           finish_test("RD/WR Sequencing violation  ", 0);
          end
       end
end

reg [39:0] rd_ent0_3;
always @(posedge dram_Ch0_wr_q_3[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent0_3 =  dram_Ch0_rd_q[i];
        if((dram_Ch0_wr_q_3[35:0] == rd_ent0_3[35:0]) && rd_ent0_3[39]) begin 
           $display("ERROR : In dram channel 0 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 3 ", $time, i, rd_ent0_3[35:0]);

           finish_test("RD/WR Sequencing violation  ", 0);
          end
       end
end

reg [39:0] rd_ent0_4;
always @(posedge dram_Ch0_wr_q_4[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent0_4 =  dram_Ch0_rd_q[i];
        if((dram_Ch0_wr_q_4[35:0] == rd_ent0_4[35:0]) && rd_ent0_4[39]) begin 
           $display("ERROR : In dram channel 0 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 4 ", $time, i, rd_ent0_4[35:0]);

           finish_test("RD/WR Sequencing violation  ", 0);
          end
       end
end

reg [39:0] rd_ent0_5;
always @(posedge dram_Ch0_wr_q_5[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent0_5 =  dram_Ch0_rd_q[i];
        if((dram_Ch0_wr_q_5[35:0] == rd_ent0_5[35:0]) && rd_ent0_5[39]) begin 
           $display("ERROR : In dram channel 0 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 5 ", $time, i, rd_ent0_5[35:0]);

           finish_test("RD/WR Sequencing violation  ", 0);
          end
       end
end

reg [39:0] rd_ent0_6;
always @(posedge dram_Ch0_wr_q_6[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent0_6 =  dram_Ch0_rd_q[i];
        if((dram_Ch0_wr_q_6[35:0] == rd_ent0_6[35:0]) && rd_ent0_6[39]) begin 
           $display("ERROR : In dram channel 0 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 6 ", $time, i, rd_ent0_6[35:0]);

           finish_test("RD/WR Sequencing violation  ", 0);
          end
       end
end

reg [39:0] rd_ent0_7;
always @(posedge dram_Ch0_wr_q_7[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent0_7 =  dram_Ch0_rd_q[i];
        if((dram_Ch0_wr_q_7[35:0] == rd_ent0_7[35:0]) && rd_ent0_7[39]) begin 
           $display("ERROR : In dram channel 0 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 7 ", $time, i, rd_ent0_7[35:0]);

           finish_test("RD/WR Sequencing violation  ", 0);
          end
       end
end

reg [39:0] rd_ent1_0;
always @(posedge dram_Ch1_wr_q_0[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent1_0 =  dram_Ch1_rd_q[i];
        if((dram_Ch1_wr_q_0[35:0] == rd_ent1_0[35:0]) && rd_ent1_0[39]) begin 
           $display("ERROR : In dram channel 1 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 0 ", $time, i, rd_ent1_0[35:0]);

           finish_test("RD/WR Sequencing violation  ", 1);
          end
       end
end

reg [39:0] rd_ent1_1;
always @(posedge dram_Ch1_wr_q_1[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent1_1 =  dram_Ch1_rd_q[i];
        if((dram_Ch1_wr_q_1[35:0] == rd_ent1_1[35:0]) && rd_ent1_1[39]) begin 
           $display("ERROR : In dram channel 1 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 1 ", $time, i, rd_ent1_1[35:0]);

           finish_test("RD/WR Sequencing violation  ", 1);
          end
       end
end

reg [39:0] rd_ent1_2;
always @(posedge dram_Ch1_wr_q_2[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent1_2 =  dram_Ch1_rd_q[i];
        if((dram_Ch1_wr_q_2[35:0] == rd_ent1_2[35:0]) && rd_ent1_2[39]) begin 
           $display("ERROR : In dram channel 1 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 2 ", $time, i, rd_ent1_2[35:0]);

           finish_test("RD/WR Sequencing violation  ", 1);
          end
       end
end

reg [39:0] rd_ent1_3;
always @(posedge dram_Ch1_wr_q_3[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent1_3 =  dram_Ch1_rd_q[i];
        if((dram_Ch1_wr_q_3[35:0] == rd_ent1_3[35:0]) && rd_ent1_3[39]) begin 
           $display("ERROR : In dram channel 1 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 3 ", $time, i, rd_ent1_3[35:0]);

           finish_test("RD/WR Sequencing violation  ", 1);
          end
       end
end

reg [39:0] rd_ent1_4;
always @(posedge dram_Ch1_wr_q_4[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent1_4 =  dram_Ch1_rd_q[i];
        if((dram_Ch1_wr_q_4[35:0] == rd_ent1_4[35:0]) && rd_ent1_4[39]) begin 
           $display("ERROR : In dram channel 1 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 4 ", $time, i, rd_ent1_4[35:0]);

           finish_test("RD/WR Sequencing violation  ", 1);
          end
       end
end

reg [39:0] rd_ent1_5;
always @(posedge dram_Ch1_wr_q_5[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent1_5 =  dram_Ch1_rd_q[i];
        if((dram_Ch1_wr_q_5[35:0] == rd_ent1_5[35:0]) && rd_ent1_5[39]) begin 
           $display("ERROR : In dram channel 1 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 5 ", $time, i, rd_ent1_5[35:0]);

           finish_test("RD/WR Sequencing violation  ", 1);
          end
       end
end

reg [39:0] rd_ent1_6;
always @(posedge dram_Ch1_wr_q_6[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent1_6 =  dram_Ch1_rd_q[i];
        if((dram_Ch1_wr_q_6[35:0] == rd_ent1_6[35:0]) && rd_ent1_6[39]) begin 
           $display("ERROR : In dram channel 1 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 6 ", $time, i, rd_ent1_6[35:0]);

           finish_test("RD/WR Sequencing violation  ", 1);
          end
       end
end

reg [39:0] rd_ent1_7;
always @(posedge dram_Ch1_wr_q_7[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent1_7 =  dram_Ch1_rd_q[i];
        if((dram_Ch1_wr_q_7[35:0] == rd_ent1_7[35:0]) && rd_ent1_7[39]) begin 
           $display("ERROR : In dram channel 1 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 7 ", $time, i, rd_ent1_7[35:0]);

           finish_test("RD/WR Sequencing violation  ", 1);
          end
       end
end

reg [39:0] rd_ent2_0;
always @(posedge dram_Ch2_wr_q_0[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent2_0 =  dram_Ch2_rd_q[i];
        if((dram_Ch2_wr_q_0[35:0] == rd_ent2_0[35:0]) && rd_ent2_0[39]) begin 
           $display("ERROR : In dram channel 2 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 0 ", $time, i, rd_ent2_0[35:0]);

           finish_test("RD/WR Sequencing violation  ", 2);
          end
       end
end

reg [39:0] rd_ent2_1;
always @(posedge dram_Ch2_wr_q_1[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent2_1 =  dram_Ch2_rd_q[i];
        if((dram_Ch2_wr_q_1[35:0] == rd_ent2_1[35:0]) && rd_ent2_1[39]) begin 
           $display("ERROR : In dram channel 2 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 1 ", $time, i, rd_ent2_1[35:0]);

           finish_test("RD/WR Sequencing violation  ", 2);
          end
       end
end

reg [39:0] rd_ent2_2;
always @(posedge dram_Ch2_wr_q_2[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent2_2 =  dram_Ch2_rd_q[i];
        if((dram_Ch2_wr_q_2[35:0] == rd_ent2_2[35:0]) && rd_ent2_2[39]) begin 
           $display("ERROR : In dram channel 2 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 2 ", $time, i, rd_ent2_2[35:0]);

           finish_test("RD/WR Sequencing violation  ", 2);
          end
       end
end

reg [39:0] rd_ent2_3;
always @(posedge dram_Ch2_wr_q_3[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent2_3 =  dram_Ch2_rd_q[i];
        if((dram_Ch2_wr_q_3[35:0] == rd_ent2_3[35:0]) && rd_ent2_3[39]) begin 
           $display("ERROR : In dram channel 2 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 3 ", $time, i, rd_ent2_3[35:0]);

           finish_test("RD/WR Sequencing violation  ", 2);
          end
       end
end

reg [39:0] rd_ent2_4;
always @(posedge dram_Ch2_wr_q_4[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent2_4 =  dram_Ch2_rd_q[i];
        if((dram_Ch2_wr_q_4[35:0] == rd_ent2_4[35:0]) && rd_ent2_4[39]) begin 
           $display("ERROR : In dram channel 2 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 4 ", $time, i, rd_ent2_4[35:0]);

           finish_test("RD/WR Sequencing violation  ", 2);
          end
       end
end

reg [39:0] rd_ent2_5;
always @(posedge dram_Ch2_wr_q_5[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent2_5 =  dram_Ch2_rd_q[i];
        if((dram_Ch2_wr_q_5[35:0] == rd_ent2_5[35:0]) && rd_ent2_5[39]) begin 
           $display("ERROR : In dram channel 2 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 5 ", $time, i, rd_ent2_5[35:0]);

           finish_test("RD/WR Sequencing violation  ", 2);
          end
       end
end

reg [39:0] rd_ent2_6;
always @(posedge dram_Ch2_wr_q_6[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent2_6 =  dram_Ch2_rd_q[i];
        if((dram_Ch2_wr_q_6[35:0] == rd_ent2_6[35:0]) && rd_ent2_6[39]) begin 
           $display("ERROR : In dram channel 2 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 6 ", $time, i, rd_ent2_6[35:0]);

           finish_test("RD/WR Sequencing violation  ", 2);
          end
       end
end

reg [39:0] rd_ent2_7;
always @(posedge dram_Ch2_wr_q_7[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent2_7 =  dram_Ch2_rd_q[i];
        if((dram_Ch2_wr_q_7[35:0] == rd_ent2_7[35:0]) && rd_ent2_7[39]) begin 
           $display("ERROR : In dram channel 2 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 7 ", $time, i, rd_ent2_7[35:0]);

           finish_test("RD/WR Sequencing violation  ", 2);
          end
       end
end

reg [39:0] rd_ent3_0;
always @(posedge dram_Ch3_wr_q_0[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent3_0 =  dram_Ch3_rd_q[i];
        if((dram_Ch3_wr_q_0[35:0] == rd_ent3_0[35:0]) && rd_ent3_0[39]) begin 
           $display("ERROR : In dram channel 3 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 0 ", $time, i, rd_ent3_0[35:0]);

           finish_test("RD/WR Sequencing violation  ", 3);
          end
       end
end

reg [39:0] rd_ent3_1;
always @(posedge dram_Ch3_wr_q_1[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent3_1 =  dram_Ch3_rd_q[i];
        if((dram_Ch3_wr_q_1[35:0] == rd_ent3_1[35:0]) && rd_ent3_1[39]) begin 
           $display("ERROR : In dram channel 3 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 1 ", $time, i, rd_ent3_1[35:0]);

           finish_test("RD/WR Sequencing violation  ", 3);
          end
       end
end

reg [39:0] rd_ent3_2;
always @(posedge dram_Ch3_wr_q_2[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent3_2 =  dram_Ch3_rd_q[i];
        if((dram_Ch3_wr_q_2[35:0] == rd_ent3_2[35:0]) && rd_ent3_2[39]) begin 
           $display("ERROR : In dram channel 3 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 2 ", $time, i, rd_ent3_2[35:0]);

           finish_test("RD/WR Sequencing violation  ", 3);
          end
       end
end

reg [39:0] rd_ent3_3;
always @(posedge dram_Ch3_wr_q_3[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent3_3 =  dram_Ch3_rd_q[i];
        if((dram_Ch3_wr_q_3[35:0] == rd_ent3_3[35:0]) && rd_ent3_3[39]) begin 
           $display("ERROR : In dram channel 3 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 3 ", $time, i, rd_ent3_3[35:0]);

           finish_test("RD/WR Sequencing violation  ", 3);
          end
       end
end

reg [39:0] rd_ent3_4;
always @(posedge dram_Ch3_wr_q_4[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent3_4 =  dram_Ch3_rd_q[i];
        if((dram_Ch3_wr_q_4[35:0] == rd_ent3_4[35:0]) && rd_ent3_4[39]) begin 
           $display("ERROR : In dram channel 3 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 4 ", $time, i, rd_ent3_4[35:0]);

           finish_test("RD/WR Sequencing violation  ", 3);
          end
       end
end

reg [39:0] rd_ent3_5;
always @(posedge dram_Ch3_wr_q_5[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent3_5 =  dram_Ch3_rd_q[i];
        if((dram_Ch3_wr_q_5[35:0] == rd_ent3_5[35:0]) && rd_ent3_5[39]) begin 
           $display("ERROR : In dram channel 3 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 5 ", $time, i, rd_ent3_5[35:0]);

           finish_test("RD/WR Sequencing violation  ", 3);
          end
       end
end

reg [39:0] rd_ent3_6;
always @(posedge dram_Ch3_wr_q_6[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent3_6 =  dram_Ch3_rd_q[i];
        if((dram_Ch3_wr_q_6[35:0] == rd_ent3_6[35:0]) && rd_ent3_6[39]) begin 
           $display("ERROR : In dram channel 3 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 6 ", $time, i, rd_ent3_6[35:0]);

           finish_test("RD/WR Sequencing violation  ", 3);
          end
       end
end

reg [39:0] rd_ent3_7;
always @(posedge dram_Ch3_wr_q_7[39]) begin 
      for (i=0;i<8;i=i+1) begin
        rd_ent3_7 =  dram_Ch3_rd_q[i];
        if((dram_Ch3_wr_q_7[35:0] == rd_ent3_7[35:0]) && rd_ent3_7[39]) begin 
           $display("ERROR : In dram channel 3 ");
           $display(" At time %0d rd entry %d which is address = %x, has a match with incoming write entry at WR Q location 7 ", $time, i, rd_ent3_7[35:0]);

           finish_test("RD/WR Sequencing violation  ", 3);
          end
       end
end


//=====================================================================
//  Monitor to count ras and cas pending
//=====================================================================

reg [3:0] dram_Ch0_ras_pend_cnt;
reg [3:0] dram_Ch0_cas_pend_cnt;
reg [3:0] cnt_0;
always @ (posedge clk)
begin
  if (~dram_rst_l)
   begin
          dram_Ch0_ras_pend_cnt <= 4'b0;
          dram_Ch0_cas_pend_cnt <= 4'b0;
   end
  else begin 
    cnt_0 = 0;
    for(i=0;i<8;i=i+1) begin 
       cnt_0 = cnt_0 + dram_Ch0_b_ras_pend_req[i];
    end
       dram_Ch0_ras_pend_cnt <= cnt_0;
    cnt_0 = 0;

    for(i=0;i<8;i=i+1) begin 
       cnt_0 = cnt_0 + dram_Ch0_b_cas_pend_req[i];
    end
       dram_Ch0_cas_pend_cnt <= cnt_0;
  end
end

reg [3:0] dram_Ch1_ras_pend_cnt;
reg [3:0] dram_Ch1_cas_pend_cnt;
reg [3:0] cnt_1;
always @ (posedge clk)
begin
  if (~dram_rst_l)
   begin
          dram_Ch1_ras_pend_cnt <= 4'b0;
          dram_Ch1_cas_pend_cnt <= 4'b0;
   end
  else begin 
    cnt_1 = 0;
    for(i=0;i<8;i=i+1) begin 
       cnt_1 = cnt_1 + dram_Ch1_b_ras_pend_req[i];
    end
       dram_Ch1_ras_pend_cnt <= cnt_1;
    cnt_1 = 0;

    for(i=0;i<8;i=i+1) begin 
       cnt_1 = cnt_1 + dram_Ch1_b_cas_pend_req[i];
    end
       dram_Ch1_cas_pend_cnt <= cnt_1;
  end
end

reg [3:0] dram_Ch2_ras_pend_cnt;
reg [3:0] dram_Ch2_cas_pend_cnt;
reg [3:0] cnt_2;
always @ (posedge clk)
begin
  if (~dram_rst_l)
   begin
          dram_Ch2_ras_pend_cnt <= 4'b0;
          dram_Ch2_cas_pend_cnt <= 4'b0;
   end
  else begin 
    cnt_2 = 0;
    for(i=0;i<8;i=i+1) begin 
       cnt_2 = cnt_2 + dram_Ch2_b_ras_pend_req[i];
    end
       dram_Ch2_ras_pend_cnt <= cnt_2;
    cnt_2 = 0;

    for(i=0;i<8;i=i+1) begin 
       cnt_2 = cnt_2 + dram_Ch2_b_cas_pend_req[i];
    end
       dram_Ch2_cas_pend_cnt <= cnt_2;
  end
end

reg [3:0] dram_Ch3_ras_pend_cnt;
reg [3:0] dram_Ch3_cas_pend_cnt;
reg [3:0] cnt_3;
always @ (posedge clk)
begin
  if (~dram_rst_l)
   begin
          dram_Ch3_ras_pend_cnt <= 4'b0;
          dram_Ch3_cas_pend_cnt <= 4'b0;
   end
  else begin 
    cnt_3 = 0;
    for(i=0;i<8;i=i+1) begin 
       cnt_3 = cnt_3 + dram_Ch3_b_ras_pend_req[i];
    end
       dram_Ch3_ras_pend_cnt <= cnt_3;
    cnt_3 = 0;

    for(i=0;i<8;i=i+1) begin 
       cnt_3 = cnt_3 + dram_Ch3_b_cas_pend_req[i];
    end
       dram_Ch3_cas_pend_cnt <= cnt_3;
  end
end


//=====================================================================
//  Monitor that no rd/wr request comes before the
//  previous one has been acked
//=====================================================================

reg    dram_Ch0_rd_record;
reg    dram_Ch0_wr_record;
reg    dram_Ch0_wr_vld_record;
reg [7:0]   dram_Ch0_wr_vld_record_pipe;
always @ (posedge cmp_clk)
begin
  if (~cmp_rst_l)
   begin
          dram_Ch0_rd_record <= 1'b0;
          dram_Ch0_wr_record <= 1'b0;
          dram_Ch0_wr_vld_record <= 1'b0;
          dram_Ch0_wr_vld_record_pipe  <= 8'b0000_0001;
   end
  else begin

     // Read Req and ack
     if (dram_Ch0_sctag_dram_rd_req) dram_Ch0_rd_record  <= 1'b1;
     if (dram_Ch0_dram_sctag_rd_ack) dram_Ch0_rd_record  <= 1'b0;

      if (dram_Ch0_rd_record && dram_Ch0_sctag_dram_rd_req) begin 
         $display("ERROR : In dram channel 0 ");
         finish_test(" Rd Ack Monitor : RD ack pending, new RD issued", 0);
      end
      if (~dram_Ch0_rd_record && dram_Ch0_dram_sctag_rd_ack) begin 
         $display("ERROR : In dram channel 0 ");
         finish_test(" Rd Ack Monitor : RD REQ not pending, RD ack issued", 0);
      end

     // Write Req and ack
     if (dram_Ch0_sctag_dram_wr_req) dram_Ch0_wr_record  <= 1'b1;
     if (dram_Ch0_dram_sctag_wr_ack) dram_Ch0_wr_record  <= 1'b1;
     if (dram_Ch0_sctag_dram_data_vld && dram_Ch0_wr_record && !dram_Ch0_wr_vld_record) begin 
         dram_Ch0_wr_vld_record  <= 1'b1;
         dram_Ch0_wr_vld_record_pipe  <= 8'b0000_0001;
     end
     if (dram_Ch0_sctag_dram_data_vld && dram_Ch0_wr_vld_record) dram_Ch0_wr_vld_record_pipe <= {dram_Ch0_wr_vld_record_pipe[6:0],1'b0}; 
     if (dram_Ch0_wr_vld_record_pipe[6] && dram_Ch0_sctag_dram_data_vld) begin 
         dram_Ch0_wr_record  <= 1'b0;
         dram_Ch0_wr_vld_record  <= 1'b0;
     end

      if ((dram_Ch0_wr_record || dram_Ch0_wr_vld_record) && dram_Ch0_sctag_dram_wr_req) begin 
         $display("ERROR : In dram channel 0 ");
         finish_test(" Wr Ack Monitor : Wr ack/data valid pending, new Wr issued", 0);
      end
      if (~dram_Ch0_wr_record && dram_Ch0_dram_sctag_wr_ack) begin
         $display("ERROR : In dram channel 0 ");
         finish_test(" Wr Ack Monitor : Wr REQ not pending, Wr ack issued", 0);
      end
      if (~dram_Ch0_wr_record && dram_Ch0_sctag_dram_data_vld) begin
         $display("ERROR : In dram channel 0 ");
         finish_test(" Wr Ack Monitor : Wr REQ not pending, Wr Data Valid issued", 0);
      end

   
  end
end


reg    dram_Ch1_rd_record;
reg    dram_Ch1_wr_record;
reg    dram_Ch1_wr_vld_record;
reg [7:0]   dram_Ch1_wr_vld_record_pipe;
always @ (posedge cmp_clk)
begin
  if (~cmp_rst_l)
   begin
          dram_Ch1_rd_record <= 1'b0;
          dram_Ch1_wr_record <= 1'b0;
          dram_Ch1_wr_vld_record <= 1'b0;
          dram_Ch1_wr_vld_record_pipe  <= 8'b0000_0001;
   end
  else begin

     // Read Req and ack
     if (dram_Ch1_sctag_dram_rd_req) dram_Ch1_rd_record  <= 1'b1;
     if (dram_Ch1_dram_sctag_rd_ack) dram_Ch1_rd_record  <= 1'b0;

      if (dram_Ch1_rd_record && dram_Ch1_sctag_dram_rd_req) begin 
         $display("ERROR : In dram channel 1 ");
         finish_test(" Rd Ack Monitor : RD ack pending, new RD issued", 1);
      end
      if (~dram_Ch1_rd_record && dram_Ch1_dram_sctag_rd_ack) begin 
         $display("ERROR : In dram channel 1 ");
         finish_test(" Rd Ack Monitor : RD REQ not pending, RD ack issued", 1);
      end

     // Write Req and ack
     if (dram_Ch1_sctag_dram_wr_req) dram_Ch1_wr_record  <= 1'b1;
     if (dram_Ch1_dram_sctag_wr_ack) dram_Ch1_wr_record  <= 1'b1;
     if (dram_Ch1_sctag_dram_data_vld && dram_Ch1_wr_record && !dram_Ch1_wr_vld_record) begin 
         dram_Ch1_wr_vld_record  <= 1'b1;
         dram_Ch1_wr_vld_record_pipe  <= 8'b0000_0001;
     end
     if (dram_Ch1_sctag_dram_data_vld && dram_Ch1_wr_vld_record) dram_Ch1_wr_vld_record_pipe <= {dram_Ch1_wr_vld_record_pipe[6:0],1'b0}; 
     if (dram_Ch1_wr_vld_record_pipe[6] && dram_Ch1_sctag_dram_data_vld) begin 
         dram_Ch1_wr_record  <= 1'b0;
         dram_Ch1_wr_vld_record  <= 1'b0;
     end

      if ((dram_Ch1_wr_record || dram_Ch1_wr_vld_record) && dram_Ch1_sctag_dram_wr_req) begin 
         $display("ERROR : In dram channel 1 ");
         finish_test(" Wr Ack Monitor : Wr ack/data valid pending, new Wr issued", 1);
      end
      if (~dram_Ch1_wr_record && dram_Ch1_dram_sctag_wr_ack) begin
         $display("ERROR : In dram channel 1 ");
         finish_test(" Wr Ack Monitor : Wr REQ not pending, Wr ack issued", 1);
      end
      if (~dram_Ch1_wr_record && dram_Ch1_sctag_dram_data_vld) begin
         $display("ERROR : In dram channel 1 ");
         finish_test(" Wr Ack Monitor : Wr REQ not pending, Wr Data Valid issued", 1);
      end

   
  end
end


reg    dram_Ch2_rd_record;
reg    dram_Ch2_wr_record;
reg    dram_Ch2_wr_vld_record;
reg [7:0]   dram_Ch2_wr_vld_record_pipe;
always @ (posedge cmp_clk)
begin
  if (~cmp_rst_l)
   begin
          dram_Ch2_rd_record <= 1'b0;
          dram_Ch2_wr_record <= 1'b0;
          dram_Ch2_wr_vld_record <= 1'b0;
          dram_Ch2_wr_vld_record_pipe  <= 8'b0000_0001;
   end
  else begin

     // Read Req and ack
     if (dram_Ch2_sctag_dram_rd_req) dram_Ch2_rd_record  <= 1'b1;
     if (dram_Ch2_dram_sctag_rd_ack) dram_Ch2_rd_record  <= 1'b0;

      if (dram_Ch2_rd_record && dram_Ch2_sctag_dram_rd_req) begin 
         $display("ERROR : In dram channel 2 ");
         finish_test(" Rd Ack Monitor : RD ack pending, new RD issued", 2);
      end
      if (~dram_Ch2_rd_record && dram_Ch2_dram_sctag_rd_ack) begin 
         $display("ERROR : In dram channel 2 ");
         finish_test(" Rd Ack Monitor : RD REQ not pending, RD ack issued", 2);
      end

     // Write Req and ack
     if (dram_Ch2_sctag_dram_wr_req) dram_Ch2_wr_record  <= 1'b1;
     if (dram_Ch2_dram_sctag_wr_ack) dram_Ch2_wr_record  <= 1'b1;
     if (dram_Ch2_sctag_dram_data_vld && dram_Ch2_wr_record && !dram_Ch2_wr_vld_record) begin 
         dram_Ch2_wr_vld_record  <= 1'b1;
         dram_Ch2_wr_vld_record_pipe  <= 8'b0000_0001;
     end
     if (dram_Ch2_sctag_dram_data_vld && dram_Ch2_wr_vld_record) dram_Ch2_wr_vld_record_pipe <= {dram_Ch2_wr_vld_record_pipe[6:0],1'b0}; 
     if (dram_Ch2_wr_vld_record_pipe[6] && dram_Ch2_sctag_dram_data_vld) begin 
         dram_Ch2_wr_record  <= 1'b0;
         dram_Ch2_wr_vld_record  <= 1'b0;
     end

      if ((dram_Ch2_wr_record || dram_Ch2_wr_vld_record) && dram_Ch2_sctag_dram_wr_req) begin 
         $display("ERROR : In dram channel 2 ");
         finish_test(" Wr Ack Monitor : Wr ack/data valid pending, new Wr issued", 2);
      end
      if (~dram_Ch2_wr_record && dram_Ch2_dram_sctag_wr_ack) begin
         $display("ERROR : In dram channel 2 ");
         finish_test(" Wr Ack Monitor : Wr REQ not pending, Wr ack issued", 2);
      end
      if (~dram_Ch2_wr_record && dram_Ch2_sctag_dram_data_vld) begin
         $display("ERROR : In dram channel 2 ");
         finish_test(" Wr Ack Monitor : Wr REQ not pending, Wr Data Valid issued", 2);
      end

   
  end
end


reg    dram_Ch3_rd_record;
reg    dram_Ch3_wr_record;
reg    dram_Ch3_wr_vld_record;
reg [7:0]   dram_Ch3_wr_vld_record_pipe;
always @ (posedge cmp_clk)
begin
  if (~cmp_rst_l)
   begin
          dram_Ch3_rd_record <= 1'b0;
          dram_Ch3_wr_record <= 1'b0;
          dram_Ch3_wr_vld_record <= 1'b0;
          dram_Ch3_wr_vld_record_pipe  <= 8'b0000_0001;
   end
  else begin

     // Read Req and ack
     if (dram_Ch3_sctag_dram_rd_req) dram_Ch3_rd_record  <= 1'b1;
     if (dram_Ch3_dram_sctag_rd_ack) dram_Ch3_rd_record  <= 1'b0;

      if (dram_Ch3_rd_record && dram_Ch3_sctag_dram_rd_req) begin 
         $display("ERROR : In dram channel 3 ");
         finish_test(" Rd Ack Monitor : RD ack pending, new RD issued", 3);
      end
      if (~dram_Ch3_rd_record && dram_Ch3_dram_sctag_rd_ack) begin 
         $display("ERROR : In dram channel 3 ");
         finish_test(" Rd Ack Monitor : RD REQ not pending, RD ack issued", 3);
      end

     // Write Req and ack
     if (dram_Ch3_sctag_dram_wr_req) dram_Ch3_wr_record  <= 1'b1;
     if (dram_Ch3_dram_sctag_wr_ack) dram_Ch3_wr_record  <= 1'b1;
     if (dram_Ch3_sctag_dram_data_vld && dram_Ch3_wr_record && !dram_Ch3_wr_vld_record) begin 
         dram_Ch3_wr_vld_record  <= 1'b1;
         dram_Ch3_wr_vld_record_pipe  <= 8'b0000_0001;
     end
     if (dram_Ch3_sctag_dram_data_vld && dram_Ch3_wr_vld_record) dram_Ch3_wr_vld_record_pipe <= {dram_Ch3_wr_vld_record_pipe[6:0],1'b0}; 
     if (dram_Ch3_wr_vld_record_pipe[6] && dram_Ch3_sctag_dram_data_vld) begin 
         dram_Ch3_wr_record  <= 1'b0;
         dram_Ch3_wr_vld_record  <= 1'b0;
     end

      if ((dram_Ch3_wr_record || dram_Ch3_wr_vld_record) && dram_Ch3_sctag_dram_wr_req) begin 
         $display("ERROR : In dram channel 3 ");
         finish_test(" Wr Ack Monitor : Wr ack/data valid pending, new Wr issued", 3);
      end
      if (~dram_Ch3_wr_record && dram_Ch3_dram_sctag_wr_ack) begin
         $display("ERROR : In dram channel 3 ");
         finish_test(" Wr Ack Monitor : Wr REQ not pending, Wr ack issued", 3);
      end
      if (~dram_Ch3_wr_record && dram_Ch3_sctag_dram_data_vld) begin
         $display("ERROR : In dram channel 3 ");
         finish_test(" Wr Ack Monitor : Wr REQ not pending, Wr Data Valid issued", 3);
      end

   
  end
end




// Monitor Rd req to Rd data vld ( data return) latency
reg [13:0]  dram_Ch0_rd_req_ack_cntr [7:0];
wire [13:0] dram_Ch0_rd_req_ack_cntr_0 = dram_Ch0_rd_req_ack_cntr[0];
wire [13:0] dram_Ch0_rd_req_ack_cntr_1 = dram_Ch0_rd_req_ack_cntr[1];
wire [13:0] dram_Ch0_rd_req_ack_cntr_2 = dram_Ch0_rd_req_ack_cntr[2];
wire [13:0] dram_Ch0_rd_req_ack_cntr_3 = dram_Ch0_rd_req_ack_cntr[3];
wire [13:0] dram_Ch0_rd_req_ack_cntr_4 = dram_Ch0_rd_req_ack_cntr[4];
wire [13:0] dram_Ch0_rd_req_ack_cntr_5 = dram_Ch0_rd_req_ack_cntr[5];
wire [13:0] dram_Ch0_rd_req_ack_cntr_6 = dram_Ch0_rd_req_ack_cntr[6];
wire [13:0] dram_Ch0_rd_req_ack_cntr_7 = dram_Ch0_rd_req_ack_cntr[7];

reg [7:0]  dram_Ch0_rd_req_pend;


always @ (posedge cmp_clk)
begin 
  if (~cmp_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch0_rd_req_ack_cntr[i] = 0;
     end
       dram_Ch0_rd_req_pend <= 0;
   end
  else
   begin
     if (dram_Ch0_sctag_dram_rd_req && !dram_Ch0_sctag_dram_rd_dummy_req)   dram_Ch0_rd_req_pend[dram_Ch0_sctag_dram_rd_req_id]  <= 1'b1;
     if (dram_Ch0_dram_sctag_data_vld) dram_Ch0_rd_req_pend[dram_Ch0_dram_sctag_rd_req_id]  <= 1'b0;

    if (dram_Ch0_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      dram_Ch0_rd_req_ack_cntr[i] <= (dram_Ch0_rd_req_pend[i] == 1'b1) ? dram_Ch0_rd_req_ack_cntr[i] + 1 : 0;
       //if ( dram_Ch0_rd_req_ack_cntr[i] > MAX_TIME ) begin 
       //  $display("ERROR : In dram channel 0 ");
       //  finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 0);
       //end  
     end // end for
    end  // end if

   // Monitor that if request to the same id has not yet got the data back and a 
   // request with the same id is issued.
    if (dram_Ch0_sctag_dram_rd_req) begin 
      if (dram_Ch0_rd_req_pend[dram_Ch0_sctag_dram_rd_req_id] == 1'b1 ) begin 
        $display("ERROR : In dram channel 0 ");
        finish_test(" L2-DRAM : Error Read Request ID in use and Rd with same ID issued ", 0); 
      end
    end  

   end  // end of begin (else)
end // end always
reg [13:0]  dram_Ch1_rd_req_ack_cntr [7:0];
wire [13:0] dram_Ch1_rd_req_ack_cntr_0 = dram_Ch1_rd_req_ack_cntr[0];
wire [13:0] dram_Ch1_rd_req_ack_cntr_1 = dram_Ch1_rd_req_ack_cntr[1];
wire [13:0] dram_Ch1_rd_req_ack_cntr_2 = dram_Ch1_rd_req_ack_cntr[2];
wire [13:0] dram_Ch1_rd_req_ack_cntr_3 = dram_Ch1_rd_req_ack_cntr[3];
wire [13:0] dram_Ch1_rd_req_ack_cntr_4 = dram_Ch1_rd_req_ack_cntr[4];
wire [13:0] dram_Ch1_rd_req_ack_cntr_5 = dram_Ch1_rd_req_ack_cntr[5];
wire [13:0] dram_Ch1_rd_req_ack_cntr_6 = dram_Ch1_rd_req_ack_cntr[6];
wire [13:0] dram_Ch1_rd_req_ack_cntr_7 = dram_Ch1_rd_req_ack_cntr[7];

reg [7:0]  dram_Ch1_rd_req_pend;


always @ (posedge cmp_clk)
begin 
  if (~cmp_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch1_rd_req_ack_cntr[i] = 0;
     end
       dram_Ch1_rd_req_pend <= 0;
   end
  else
   begin
     if (dram_Ch1_sctag_dram_rd_req && !dram_Ch1_sctag_dram_rd_dummy_req)   dram_Ch1_rd_req_pend[dram_Ch1_sctag_dram_rd_req_id]  <= 1'b1;
     if (dram_Ch1_dram_sctag_data_vld) dram_Ch1_rd_req_pend[dram_Ch1_dram_sctag_rd_req_id]  <= 1'b0;

    if (dram_Ch1_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      dram_Ch1_rd_req_ack_cntr[i] <= (dram_Ch1_rd_req_pend[i] == 1'b1) ? dram_Ch1_rd_req_ack_cntr[i] + 1 : 0;
       //if ( dram_Ch1_rd_req_ack_cntr[i] > MAX_TIME ) begin 
       //  $display("ERROR : In dram channel 1 ");
       //  finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 1);
       //end  
     end // end for
    end  // end if

   // Monitor that if request to the same id has not yet got the data back and a 
   // request with the same id is issued.
    if (dram_Ch1_sctag_dram_rd_req) begin 
      if (dram_Ch1_rd_req_pend[dram_Ch1_sctag_dram_rd_req_id] == 1'b1 ) begin 
        $display("ERROR : In dram channel 1 ");
        finish_test(" L2-DRAM : Error Read Request ID in use and Rd with same ID issued ", 1); 
      end
    end  

   end  // end of begin (else)
end // end always
reg [13:0]  dram_Ch2_rd_req_ack_cntr [7:0];
wire [13:0] dram_Ch2_rd_req_ack_cntr_0 = dram_Ch2_rd_req_ack_cntr[0];
wire [13:0] dram_Ch2_rd_req_ack_cntr_1 = dram_Ch2_rd_req_ack_cntr[1];
wire [13:0] dram_Ch2_rd_req_ack_cntr_2 = dram_Ch2_rd_req_ack_cntr[2];
wire [13:0] dram_Ch2_rd_req_ack_cntr_3 = dram_Ch2_rd_req_ack_cntr[3];
wire [13:0] dram_Ch2_rd_req_ack_cntr_4 = dram_Ch2_rd_req_ack_cntr[4];
wire [13:0] dram_Ch2_rd_req_ack_cntr_5 = dram_Ch2_rd_req_ack_cntr[5];
wire [13:0] dram_Ch2_rd_req_ack_cntr_6 = dram_Ch2_rd_req_ack_cntr[6];
wire [13:0] dram_Ch2_rd_req_ack_cntr_7 = dram_Ch2_rd_req_ack_cntr[7];

reg [7:0]  dram_Ch2_rd_req_pend;


always @ (posedge cmp_clk)
begin 
  if (~cmp_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch2_rd_req_ack_cntr[i] = 0;
     end
       dram_Ch2_rd_req_pend <= 0;
   end
  else
   begin
     if (dram_Ch2_sctag_dram_rd_req && !dram_Ch2_sctag_dram_rd_dummy_req)   dram_Ch2_rd_req_pend[dram_Ch2_sctag_dram_rd_req_id]  <= 1'b1;
     if (dram_Ch2_dram_sctag_data_vld) dram_Ch2_rd_req_pend[dram_Ch2_dram_sctag_rd_req_id]  <= 1'b0;

    if (dram_Ch2_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      dram_Ch2_rd_req_ack_cntr[i] <= (dram_Ch2_rd_req_pend[i] == 1'b1) ? dram_Ch2_rd_req_ack_cntr[i] + 1 : 0;
       //if ( dram_Ch2_rd_req_ack_cntr[i] > MAX_TIME ) begin 
       //  $display("ERROR : In dram channel 2 ");
       //  finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 2);
       //end  
     end // end for
    end  // end if

   // Monitor that if request to the same id has not yet got the data back and a 
   // request with the same id is issued.
    if (dram_Ch2_sctag_dram_rd_req) begin 
      if (dram_Ch2_rd_req_pend[dram_Ch2_sctag_dram_rd_req_id] == 1'b1 ) begin 
        $display("ERROR : In dram channel 2 ");
        finish_test(" L2-DRAM : Error Read Request ID in use and Rd with same ID issued ", 2); 
      end
    end  

   end  // end of begin (else)
end // end always
reg [13:0]  dram_Ch3_rd_req_ack_cntr [7:0];
wire [13:0] dram_Ch3_rd_req_ack_cntr_0 = dram_Ch3_rd_req_ack_cntr[0];
wire [13:0] dram_Ch3_rd_req_ack_cntr_1 = dram_Ch3_rd_req_ack_cntr[1];
wire [13:0] dram_Ch3_rd_req_ack_cntr_2 = dram_Ch3_rd_req_ack_cntr[2];
wire [13:0] dram_Ch3_rd_req_ack_cntr_3 = dram_Ch3_rd_req_ack_cntr[3];
wire [13:0] dram_Ch3_rd_req_ack_cntr_4 = dram_Ch3_rd_req_ack_cntr[4];
wire [13:0] dram_Ch3_rd_req_ack_cntr_5 = dram_Ch3_rd_req_ack_cntr[5];
wire [13:0] dram_Ch3_rd_req_ack_cntr_6 = dram_Ch3_rd_req_ack_cntr[6];
wire [13:0] dram_Ch3_rd_req_ack_cntr_7 = dram_Ch3_rd_req_ack_cntr[7];

reg [7:0]  dram_Ch3_rd_req_pend;


always @ (posedge cmp_clk)
begin 
  if (~cmp_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch3_rd_req_ack_cntr[i] = 0;
     end
       dram_Ch3_rd_req_pend <= 0;
   end
  else
   begin
     if (dram_Ch3_sctag_dram_rd_req && !dram_Ch3_sctag_dram_rd_dummy_req)   dram_Ch3_rd_req_pend[dram_Ch3_sctag_dram_rd_req_id]  <= 1'b1;
     if (dram_Ch3_dram_sctag_data_vld) dram_Ch3_rd_req_pend[dram_Ch3_dram_sctag_rd_req_id]  <= 1'b0;

    if (dram_Ch3_que_init_dram_done == 1'b1 ) begin 
     for(i=0;i<8;i=i+1) begin 
      dram_Ch3_rd_req_ack_cntr[i] <= (dram_Ch3_rd_req_pend[i] == 1'b1) ? dram_Ch3_rd_req_ack_cntr[i] + 1 : 0;
       //if ( dram_Ch3_rd_req_ack_cntr[i] > MAX_TIME ) begin 
       //  $display("ERROR : In dram channel 3 ");
       //  finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 3);
       //end  
     end // end for
    end  // end if

   // Monitor that if request to the same id has not yet got the data back and a 
   // request with the same id is issued.
    if (dram_Ch3_sctag_dram_rd_req) begin 
      if (dram_Ch3_rd_req_pend[dram_Ch3_sctag_dram_rd_req_id] == 1'b1 ) begin 
        $display("ERROR : In dram channel 3 ");
        finish_test(" L2-DRAM : Error Read Request ID in use and Rd with same ID issued ", 3); 
      end
    end  

   end  // end of begin (else)
end // end always



// Monitor Wr req to Wr ack 
reg [10:0]  dram_Ch0_wr_req_ack_cntr;

reg  dram_Ch0_wr_req_pend;


always @ (posedge cmp_clk)
begin 
  if (~cmp_rst_l)
   begin
       dram_Ch0_wr_req_ack_cntr = 0;
       dram_Ch0_wr_req_pend <= 0;
   end
  else
   begin
     if (dram_Ch0_sctag_dram_wr_req) dram_Ch0_wr_req_pend  <= 1'b1;
     if (dram_Ch0_dram_sctag_wr_ack) dram_Ch0_wr_req_pend  <= 1'b0;

    if (dram_Ch0_que_init_dram_done == 1'b1 ) begin 
      dram_Ch0_wr_req_ack_cntr <= (dram_Ch0_wr_req_pend == 1'b1) ? dram_Ch0_wr_req_ack_cntr + 1 : 0;
       //if ( dram_Ch0_wr_req_ack_cntr[i] > MAX_TIME ) begin 
       //  $display("ERROR : In dram channel 0 ");
       //  finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 0);
       //end  
    end
   end
end
reg [10:0]  dram_Ch1_wr_req_ack_cntr;

reg  dram_Ch1_wr_req_pend;


always @ (posedge cmp_clk)
begin 
  if (~cmp_rst_l)
   begin
       dram_Ch1_wr_req_ack_cntr = 0;
       dram_Ch1_wr_req_pend <= 0;
   end
  else
   begin
     if (dram_Ch1_sctag_dram_wr_req) dram_Ch1_wr_req_pend  <= 1'b1;
     if (dram_Ch1_dram_sctag_wr_ack) dram_Ch1_wr_req_pend  <= 1'b0;

    if (dram_Ch1_que_init_dram_done == 1'b1 ) begin 
      dram_Ch1_wr_req_ack_cntr <= (dram_Ch1_wr_req_pend == 1'b1) ? dram_Ch1_wr_req_ack_cntr + 1 : 0;
       //if ( dram_Ch1_wr_req_ack_cntr[i] > MAX_TIME ) begin 
       //  $display("ERROR : In dram channel 1 ");
       //  finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 1);
       //end  
    end
   end
end
reg [10:0]  dram_Ch2_wr_req_ack_cntr;

reg  dram_Ch2_wr_req_pend;


always @ (posedge cmp_clk)
begin 
  if (~cmp_rst_l)
   begin
       dram_Ch2_wr_req_ack_cntr = 0;
       dram_Ch2_wr_req_pend <= 0;
   end
  else
   begin
     if (dram_Ch2_sctag_dram_wr_req) dram_Ch2_wr_req_pend  <= 1'b1;
     if (dram_Ch2_dram_sctag_wr_ack) dram_Ch2_wr_req_pend  <= 1'b0;

    if (dram_Ch2_que_init_dram_done == 1'b1 ) begin 
      dram_Ch2_wr_req_ack_cntr <= (dram_Ch2_wr_req_pend == 1'b1) ? dram_Ch2_wr_req_ack_cntr + 1 : 0;
       //if ( dram_Ch2_wr_req_ack_cntr[i] > MAX_TIME ) begin 
       //  $display("ERROR : In dram channel 2 ");
       //  finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 2);
       //end  
    end
   end
end
reg [10:0]  dram_Ch3_wr_req_ack_cntr;

reg  dram_Ch3_wr_req_pend;


always @ (posedge cmp_clk)
begin 
  if (~cmp_rst_l)
   begin
       dram_Ch3_wr_req_ack_cntr = 0;
       dram_Ch3_wr_req_pend <= 0;
   end
  else
   begin
     if (dram_Ch3_sctag_dram_wr_req) dram_Ch3_wr_req_pend  <= 1'b1;
     if (dram_Ch3_dram_sctag_wr_ack) dram_Ch3_wr_req_pend  <= 1'b0;

    if (dram_Ch3_que_init_dram_done == 1'b1 ) begin 
      dram_Ch3_wr_req_ack_cntr <= (dram_Ch3_wr_req_pend == 1'b1) ? dram_Ch3_wr_req_ack_cntr + 1 : 0;
       //if ( dram_Ch3_wr_req_ack_cntr[i] > MAX_TIME ) begin 
       //  $display("ERROR : In dram channel 3 ");
       //  finish_test(" RD Q :   Entry in read que for more that MAX_TIME clocks ", 3);
       //end  
    end
   end
end

//=====================================================================
//  Monitor to make sure that after refresh process has been initiated
//  all the CAS to same CS are cleared and no more RAS issued
//=====================================================================

reg [1:0] dram_Ch0_refresh_all_clr_mon_state;
reg [7:0] cas_valid_0;
reg       dram_Ch0_que_ref_go_d1;

initial 
 begin 
    dram_Ch0_refresh_all_clr_mon_state = 2'b00;
    dram_Ch0_que_ref_go_d1 = 1'b0;
 end

always @ (posedge clk)
begin
if ( ((($test$plusargs("RANK_DIMM")) || ($test$plusargs("STACK_DIMM"))) == 0) ) begin 
  if (~dram_rst_l)
   begin
    dram_Ch0_refresh_all_clr_mon_state <= 2'b00;
    dram_Ch0_que_ref_go_d1 <= 1'b0;
   end
  else
   begin
    dram_Ch0_que_ref_go_d1 <= (dram_Ch0_que_ref_go || dram_Ch0_que_hw_selfrsh) && (dram_Ch0_que_pos == 5'ha);

   case(dram_Ch0_refresh_all_clr_mon_state)
    2'b00 : begin 
               if (dram_Ch0_que_ref_go_d1) begin 
                 dram_Ch0_refresh_all_clr_mon_state <= 2'b01;
                 cas_valid_0 <= dram_Ch0_que_cas_valid;
               end
            end
    2'b01 : begin 
               if (dram_Ch0_que_pos == 5'hc) 
                 dram_Ch0_refresh_all_clr_mon_state <= 2'b10;
               else begin 
                // monitor that no new cas valid turns up, indicating RAS issued
                for(i=0;i<8;i=i+1) begin
                  if (!cas_valid_0[i] && dram_Ch0_que_cas_valid[i]) begin 
                    $display("ERROR : In dram channel 0 ");
                    finish_test(" Refresh Monitor : RAS issued after refresh process started ", 0);
                  end
                end
              end
            end
    2'b10 : begin 
                 dram_Ch0_refresh_all_clr_mon_state <= 2'b00;
               // check that all the CAS to same CS issued
                for(i=0;i<8;i=i+1) begin
                  if (dram_Ch0_que_cas_valid[i] && (dram_Ch0_b_phy_bank_bits[i] == dram_Ch0_que_refresh_rank)) begin 
                    $display("ERROR : In dram channel 0 ");
                    finish_test(" Refresh Monitor : CAS to same CS as refresh pending and refresh issued", 0);
                  end
                end
            end
    default : begin 
                 dram_Ch0_refresh_all_clr_mon_state <= 2'b00;
              end

   endcase
  end 
 end // testplus
end
reg [1:0] dram_Ch1_refresh_all_clr_mon_state;
reg [7:0] cas_valid_1;
reg       dram_Ch1_que_ref_go_d1;

initial 
 begin 
    dram_Ch1_refresh_all_clr_mon_state = 2'b00;
    dram_Ch1_que_ref_go_d1 = 1'b0;
 end

always @ (posedge clk)
begin
if ( ((($test$plusargs("RANK_DIMM")) || ($test$plusargs("STACK_DIMM"))) == 0) ) begin 
  if (~dram_rst_l)
   begin
    dram_Ch1_refresh_all_clr_mon_state <= 2'b00;
    dram_Ch1_que_ref_go_d1 <= 1'b0;
   end
  else
   begin
    dram_Ch1_que_ref_go_d1 <= (dram_Ch1_que_ref_go || dram_Ch1_que_hw_selfrsh) && (dram_Ch1_que_pos == 5'ha);

   case(dram_Ch1_refresh_all_clr_mon_state)
    2'b00 : begin 
               if (dram_Ch1_que_ref_go_d1) begin 
                 dram_Ch1_refresh_all_clr_mon_state <= 2'b01;
                 cas_valid_1 <= dram_Ch1_que_cas_valid;
               end
            end
    2'b01 : begin 
               if (dram_Ch1_que_pos == 5'hc) 
                 dram_Ch1_refresh_all_clr_mon_state <= 2'b10;
               else begin 
                // monitor that no new cas valid turns up, indicating RAS issued
                for(i=0;i<8;i=i+1) begin
                  if (!cas_valid_1[i] && dram_Ch1_que_cas_valid[i]) begin 
                    $display("ERROR : In dram channel 1 ");
                    finish_test(" Refresh Monitor : RAS issued after refresh process started ", 1);
                  end
                end
              end
            end
    2'b10 : begin 
                 dram_Ch1_refresh_all_clr_mon_state <= 2'b00;
               // check that all the CAS to same CS issued
                for(i=0;i<8;i=i+1) begin
                  if (dram_Ch1_que_cas_valid[i] && (dram_Ch1_b_phy_bank_bits[i] == dram_Ch1_que_refresh_rank)) begin 
                    $display("ERROR : In dram channel 1 ");
                    finish_test(" Refresh Monitor : CAS to same CS as refresh pending and refresh issued", 1);
                  end
                end
            end
    default : begin 
                 dram_Ch1_refresh_all_clr_mon_state <= 2'b00;
              end

   endcase
  end 
 end // testplus
end
reg [1:0] dram_Ch2_refresh_all_clr_mon_state;
reg [7:0] cas_valid_2;
reg       dram_Ch2_que_ref_go_d1;

initial 
 begin 
    dram_Ch2_refresh_all_clr_mon_state = 2'b00;
    dram_Ch2_que_ref_go_d1 = 1'b0;
 end

always @ (posedge clk)
begin
if ( ((($test$plusargs("RANK_DIMM")) || ($test$plusargs("STACK_DIMM"))) == 0) ) begin 
  if (~dram_rst_l)
   begin
    dram_Ch2_refresh_all_clr_mon_state <= 2'b00;
    dram_Ch2_que_ref_go_d1 <= 1'b0;
   end
  else
   begin
    dram_Ch2_que_ref_go_d1 <= (dram_Ch2_que_ref_go || dram_Ch2_que_hw_selfrsh) && (dram_Ch2_que_pos == 5'ha);

   case(dram_Ch2_refresh_all_clr_mon_state)
    2'b00 : begin 
               if (dram_Ch2_que_ref_go_d1) begin 
                 dram_Ch2_refresh_all_clr_mon_state <= 2'b01;
                 cas_valid_2 <= dram_Ch2_que_cas_valid;
               end
            end
    2'b01 : begin 
               if (dram_Ch2_que_pos == 5'hc) 
                 dram_Ch2_refresh_all_clr_mon_state <= 2'b10;
               else begin 
                // monitor that no new cas valid turns up, indicating RAS issued
                for(i=0;i<8;i=i+1) begin
                  if (!cas_valid_2[i] && dram_Ch2_que_cas_valid[i]) begin 
                    $display("ERROR : In dram channel 2 ");
                    finish_test(" Refresh Monitor : RAS issued after refresh process started ", 2);
                  end
                end
              end
            end
    2'b10 : begin 
                 dram_Ch2_refresh_all_clr_mon_state <= 2'b00;
               // check that all the CAS to same CS issued
                for(i=0;i<8;i=i+1) begin
                  if (dram_Ch2_que_cas_valid[i] && (dram_Ch2_b_phy_bank_bits[i] == dram_Ch2_que_refresh_rank)) begin 
                    $display("ERROR : In dram channel 2 ");
                    finish_test(" Refresh Monitor : CAS to same CS as refresh pending and refresh issued", 2);
                  end
                end
            end
    default : begin 
                 dram_Ch2_refresh_all_clr_mon_state <= 2'b00;
              end

   endcase
  end 
 end // testplus
end
reg [1:0] dram_Ch3_refresh_all_clr_mon_state;
reg [7:0] cas_valid_3;
reg       dram_Ch3_que_ref_go_d1;

initial 
 begin 
    dram_Ch3_refresh_all_clr_mon_state = 2'b00;
    dram_Ch3_que_ref_go_d1 = 1'b0;
 end

always @ (posedge clk)
begin
if ( ((($test$plusargs("RANK_DIMM")) || ($test$plusargs("STACK_DIMM"))) == 0) ) begin 
  if (~dram_rst_l)
   begin
    dram_Ch3_refresh_all_clr_mon_state <= 2'b00;
    dram_Ch3_que_ref_go_d1 <= 1'b0;
   end
  else
   begin
    dram_Ch3_que_ref_go_d1 <= (dram_Ch3_que_ref_go || dram_Ch3_que_hw_selfrsh) && (dram_Ch3_que_pos == 5'ha);

   case(dram_Ch3_refresh_all_clr_mon_state)
    2'b00 : begin 
               if (dram_Ch3_que_ref_go_d1) begin 
                 dram_Ch3_refresh_all_clr_mon_state <= 2'b01;
                 cas_valid_3 <= dram_Ch3_que_cas_valid;
               end
            end
    2'b01 : begin 
               if (dram_Ch3_que_pos == 5'hc) 
                 dram_Ch3_refresh_all_clr_mon_state <= 2'b10;
               else begin 
                // monitor that no new cas valid turns up, indicating RAS issued
                for(i=0;i<8;i=i+1) begin
                  if (!cas_valid_3[i] && dram_Ch3_que_cas_valid[i]) begin 
                    $display("ERROR : In dram channel 3 ");
                    finish_test(" Refresh Monitor : RAS issued after refresh process started ", 3);
                  end
                end
              end
            end
    2'b10 : begin 
                 dram_Ch3_refresh_all_clr_mon_state <= 2'b00;
               // check that all the CAS to same CS issued
                for(i=0;i<8;i=i+1) begin
                  if (dram_Ch3_que_cas_valid[i] && (dram_Ch3_b_phy_bank_bits[i] == dram_Ch3_que_refresh_rank)) begin 
                    $display("ERROR : In dram channel 3 ");
                    finish_test(" Refresh Monitor : CAS to same CS as refresh pending and refresh issued", 3);
                  end
                end
            end
    default : begin 
                 dram_Ch3_refresh_all_clr_mon_state <= 2'b00;
              end

   endcase
  end 
 end // testplus
end

//=====================================================================
// Monitor for read write with same address, schmoo 
//=====================================================================
reg  dram_Ch0_rd_req_2a_addr_vld;
reg  req_2a_addr_0;
reg [39:0] samp_addr_rd_q_loc_0;

//        (que_rd_addr_picked[31:0] == {writeqbank0addr0[35], writeqbank0addr0[33:6],
//         writeqbank0addr0[2:0]}) & writeqbank0vld0_arb |

always @( dram_Ch0_rd_q_0 or dram_Ch0_rd_q_1 or dram_Ch0_rd_q_1 or dram_Ch0_rd_q_3 or
          dram_Ch0_rd_q_4 or dram_Ch0_rd_q_5 or dram_Ch0_rd_q_6 or dram_Ch0_rd_q_7)
begin 
     req_2a_addr_0 = 0;
    for (i=0;i<8;i=i+1) begin
     samp_addr_rd_q_loc_0  = dram_Ch0_rd_q[i];
     req_2a_addr_0 = (samp_addr_rd_q_loc_0[39] && ({samp_addr_rd_q_loc_0[35], samp_addr_rd_q_loc_0[33:6],samp_addr_rd_q_loc_0[2:0]} == SCHMOO_RD_WR_ADDR)) || req_2a_addr_0;
    end
 
    dram_Ch0_rd_req_2a_addr_vld <= req_2a_addr_0;
    

end
 
reg  dram_Ch0_wr_req_2a_addr_vld;
reg  req_2a_addr1_0;
reg [39:0] samp_addr_wr_q_loc_0;

//        (que_wr_addr_picked[31:0] == {writeqbank0addr0[35], writeqbank0addr0[33:6],
//         writeqbank0addr0[2:0]}) & writeqbank0vld0_arb |

always @( dram_Ch0_wr_q_0 or dram_Ch0_wr_q_1 or dram_Ch0_wr_q_1 or dram_Ch0_wr_q_3 or
          dram_Ch0_wr_q_4 or dram_Ch0_wr_q_5 or dram_Ch0_wr_q_6 or dram_Ch0_wr_q_7)
begin 
     req_2a_addr1_0 = 0;
    for (i=0;i<8;i=i+1) begin
     samp_addr_wr_q_loc_0  = dram_Ch0_wr_q[i];
     req_2a_addr1_0 = (samp_addr_wr_q_loc_0[39] && ({samp_addr_wr_q_loc_0[35], samp_addr_wr_q_loc_0[33:6],samp_addr_wr_q_loc_0[2:0]} == SCHMOO_RD_WR_ADDR)) || req_2a_addr1_0;
    end
 
    dram_Ch0_wr_req_2a_addr_vld <= req_2a_addr1_0;
    

end
reg  dram_Ch1_rd_req_2a_addr_vld;
reg  req_2a_addr_1;
reg [39:0] samp_addr_rd_q_loc_1;

//        (que_rd_addr_picked[31:0] == {writeqbank0addr0[35], writeqbank0addr0[33:6],
//         writeqbank0addr0[2:0]}) & writeqbank0vld0_arb |

always @( dram_Ch1_rd_q_0 or dram_Ch1_rd_q_1 or dram_Ch1_rd_q_1 or dram_Ch1_rd_q_3 or
          dram_Ch1_rd_q_4 or dram_Ch1_rd_q_5 or dram_Ch1_rd_q_6 or dram_Ch1_rd_q_7)
begin 
     req_2a_addr_1 = 0;
    for (i=0;i<8;i=i+1) begin
     samp_addr_rd_q_loc_1  = dram_Ch1_rd_q[i];
     req_2a_addr_1 = (samp_addr_rd_q_loc_1[39] && ({samp_addr_rd_q_loc_1[35], samp_addr_rd_q_loc_1[33:6],samp_addr_rd_q_loc_1[2:0]} == SCHMOO_RD_WR_ADDR)) || req_2a_addr_1;
    end
 
    dram_Ch1_rd_req_2a_addr_vld <= req_2a_addr_1;
    

end
 
reg  dram_Ch1_wr_req_2a_addr_vld;
reg  req_2a_addr1_1;
reg [39:0] samp_addr_wr_q_loc_1;

//        (que_wr_addr_picked[31:0] == {writeqbank0addr0[35], writeqbank0addr0[33:6],
//         writeqbank0addr0[2:0]}) & writeqbank0vld0_arb |

always @( dram_Ch1_wr_q_0 or dram_Ch1_wr_q_1 or dram_Ch1_wr_q_1 or dram_Ch1_wr_q_3 or
          dram_Ch1_wr_q_4 or dram_Ch1_wr_q_5 or dram_Ch1_wr_q_6 or dram_Ch1_wr_q_7)
begin 
     req_2a_addr1_1 = 0;
    for (i=0;i<8;i=i+1) begin
     samp_addr_wr_q_loc_1  = dram_Ch1_wr_q[i];
     req_2a_addr1_1 = (samp_addr_wr_q_loc_1[39] && ({samp_addr_wr_q_loc_1[35], samp_addr_wr_q_loc_1[33:6],samp_addr_wr_q_loc_1[2:0]} == SCHMOO_RD_WR_ADDR)) || req_2a_addr1_1;
    end
 
    dram_Ch1_wr_req_2a_addr_vld <= req_2a_addr1_1;
    

end
reg  dram_Ch2_rd_req_2a_addr_vld;
reg  req_2a_addr_2;
reg [39:0] samp_addr_rd_q_loc_2;

//        (que_rd_addr_picked[31:0] == {writeqbank0addr0[35], writeqbank0addr0[33:6],
//         writeqbank0addr0[2:0]}) & writeqbank0vld0_arb |

always @( dram_Ch2_rd_q_0 or dram_Ch2_rd_q_1 or dram_Ch2_rd_q_1 or dram_Ch2_rd_q_3 or
          dram_Ch2_rd_q_4 or dram_Ch2_rd_q_5 or dram_Ch2_rd_q_6 or dram_Ch2_rd_q_7)
begin 
     req_2a_addr_2 = 0;
    for (i=0;i<8;i=i+1) begin
     samp_addr_rd_q_loc_2  = dram_Ch2_rd_q[i];
     req_2a_addr_2 = (samp_addr_rd_q_loc_2[39] && ({samp_addr_rd_q_loc_2[35], samp_addr_rd_q_loc_2[33:6],samp_addr_rd_q_loc_2[2:0]} == SCHMOO_RD_WR_ADDR)) || req_2a_addr_2;
    end
 
    dram_Ch2_rd_req_2a_addr_vld <= req_2a_addr_2;
    

end
 
reg  dram_Ch2_wr_req_2a_addr_vld;
reg  req_2a_addr1_2;
reg [39:0] samp_addr_wr_q_loc_2;

//        (que_wr_addr_picked[31:0] == {writeqbank0addr0[35], writeqbank0addr0[33:6],
//         writeqbank0addr0[2:0]}) & writeqbank0vld0_arb |

always @( dram_Ch2_wr_q_0 or dram_Ch2_wr_q_1 or dram_Ch2_wr_q_1 or dram_Ch2_wr_q_3 or
          dram_Ch2_wr_q_4 or dram_Ch2_wr_q_5 or dram_Ch2_wr_q_6 or dram_Ch2_wr_q_7)
begin 
     req_2a_addr1_2 = 0;
    for (i=0;i<8;i=i+1) begin
     samp_addr_wr_q_loc_2  = dram_Ch2_wr_q[i];
     req_2a_addr1_2 = (samp_addr_wr_q_loc_2[39] && ({samp_addr_wr_q_loc_2[35], samp_addr_wr_q_loc_2[33:6],samp_addr_wr_q_loc_2[2:0]} == SCHMOO_RD_WR_ADDR)) || req_2a_addr1_2;
    end
 
    dram_Ch2_wr_req_2a_addr_vld <= req_2a_addr1_2;
    

end
reg  dram_Ch3_rd_req_2a_addr_vld;
reg  req_2a_addr_3;
reg [39:0] samp_addr_rd_q_loc_3;

//        (que_rd_addr_picked[31:0] == {writeqbank0addr0[35], writeqbank0addr0[33:6],
//         writeqbank0addr0[2:0]}) & writeqbank0vld0_arb |

always @( dram_Ch3_rd_q_0 or dram_Ch3_rd_q_1 or dram_Ch3_rd_q_1 or dram_Ch3_rd_q_3 or
          dram_Ch3_rd_q_4 or dram_Ch3_rd_q_5 or dram_Ch3_rd_q_6 or dram_Ch3_rd_q_7)
begin 
     req_2a_addr_3 = 0;
    for (i=0;i<8;i=i+1) begin
     samp_addr_rd_q_loc_3  = dram_Ch3_rd_q[i];
     req_2a_addr_3 = (samp_addr_rd_q_loc_3[39] && ({samp_addr_rd_q_loc_3[35], samp_addr_rd_q_loc_3[33:6],samp_addr_rd_q_loc_3[2:0]} == SCHMOO_RD_WR_ADDR)) || req_2a_addr_3;
    end
 
    dram_Ch3_rd_req_2a_addr_vld <= req_2a_addr_3;
    

end
 
reg  dram_Ch3_wr_req_2a_addr_vld;
reg  req_2a_addr1_3;
reg [39:0] samp_addr_wr_q_loc_3;

//        (que_wr_addr_picked[31:0] == {writeqbank0addr0[35], writeqbank0addr0[33:6],
//         writeqbank0addr0[2:0]}) & writeqbank0vld0_arb |

always @( dram_Ch3_wr_q_0 or dram_Ch3_wr_q_1 or dram_Ch3_wr_q_1 or dram_Ch3_wr_q_3 or
          dram_Ch3_wr_q_4 or dram_Ch3_wr_q_5 or dram_Ch3_wr_q_6 or dram_Ch3_wr_q_7)
begin 
     req_2a_addr1_3 = 0;
    for (i=0;i<8;i=i+1) begin
     samp_addr_wr_q_loc_3  = dram_Ch3_wr_q[i];
     req_2a_addr1_3 = (samp_addr_wr_q_loc_3[39] && ({samp_addr_wr_q_loc_3[35], samp_addr_wr_q_loc_3[33:6],samp_addr_wr_q_loc_3[2:0]} == SCHMOO_RD_WR_ADDR)) || req_2a_addr1_3;
    end
 
    dram_Ch3_wr_req_2a_addr_vld <= req_2a_addr1_3;
    

end

//=====================================================================
// Monitor scrub to the same address as wr read
// Acrub address asssumed valid from scrb read to write. 
// We are xing between the scrub happening and a valid data 
//  to same address in rd/wr q
//=====================================================================

reg  dram_Ch0_scrb_req_vld;
wire dram_Ch0_scrb_req_2a_addr_vld;


always @(posedge clk) 
begin 
  if (~dram_rst_l)
   begin
    dram_Ch0_scrb_req_vld <= 1'b0;
   end
  else begin 
    if (dram_Ch0_que_scrb_picked && dram_Ch0_que_scrb_rd_picked && dram_Ch0_que_ras_bank_picked_en) begin 
      dram_Ch0_scrb_req_vld <= 1'b1;
    end else if (dram_Ch0_que_scrb_write_req) begin 
      dram_Ch0_scrb_req_vld <= 1'b0;
    end
  end
end


assign      dram_Ch0_scrb_req_2a_addr_vld = ({dram_Ch0_que_scrb_addr_picked[35], dram_Ch0_que_scrb_addr_picked[33:0]} == SCHMOO_SCRB_ADDR) && dram_Ch0_scrb_req_vld;
 
reg  dram_Ch1_scrb_req_vld;
wire dram_Ch1_scrb_req_2a_addr_vld;


always @(posedge clk) 
begin 
  if (~dram_rst_l)
   begin
    dram_Ch1_scrb_req_vld <= 1'b0;
   end
  else begin 
    if (dram_Ch1_que_scrb_picked && dram_Ch1_que_scrb_rd_picked && dram_Ch1_que_ras_bank_picked_en) begin 
      dram_Ch1_scrb_req_vld <= 1'b1;
    end else if (dram_Ch1_que_scrb_write_req) begin 
      dram_Ch1_scrb_req_vld <= 1'b0;
    end
  end
end


assign      dram_Ch1_scrb_req_2a_addr_vld = ({dram_Ch1_que_scrb_addr_picked[35], dram_Ch1_que_scrb_addr_picked[33:0]} == SCHMOO_SCRB_ADDR) && dram_Ch1_scrb_req_vld;
 
reg  dram_Ch2_scrb_req_vld;
wire dram_Ch2_scrb_req_2a_addr_vld;


always @(posedge clk) 
begin 
  if (~dram_rst_l)
   begin
    dram_Ch2_scrb_req_vld <= 1'b0;
   end
  else begin 
    if (dram_Ch2_que_scrb_picked && dram_Ch2_que_scrb_rd_picked && dram_Ch2_que_ras_bank_picked_en) begin 
      dram_Ch2_scrb_req_vld <= 1'b1;
    end else if (dram_Ch2_que_scrb_write_req) begin 
      dram_Ch2_scrb_req_vld <= 1'b0;
    end
  end
end


assign      dram_Ch2_scrb_req_2a_addr_vld = ({dram_Ch2_que_scrb_addr_picked[35], dram_Ch2_que_scrb_addr_picked[33:0]} == SCHMOO_SCRB_ADDR) && dram_Ch2_scrb_req_vld;
 
reg  dram_Ch3_scrb_req_vld;
wire dram_Ch3_scrb_req_2a_addr_vld;


always @(posedge clk) 
begin 
  if (~dram_rst_l)
   begin
    dram_Ch3_scrb_req_vld <= 1'b0;
   end
  else begin 
    if (dram_Ch3_que_scrb_picked && dram_Ch3_que_scrb_rd_picked && dram_Ch3_que_ras_bank_picked_en) begin 
      dram_Ch3_scrb_req_vld <= 1'b1;
    end else if (dram_Ch3_que_scrb_write_req) begin 
      dram_Ch3_scrb_req_vld <= 1'b0;
    end
  end
end


assign      dram_Ch3_scrb_req_2a_addr_vld = ({dram_Ch3_que_scrb_addr_picked[35], dram_Ch3_que_scrb_addr_picked[33:0]} == SCHMOO_SCRB_ADDR) && dram_Ch3_scrb_req_vld;
 

// Monitor Traffic on each CS
reg [10:0]  dram_Ch0_cs0_bank_req_cntr [7:0];
wire [10:0] dram_Ch0_cs0_bank_req_cntr_0 = dram_Ch0_cs0_bank_req_cntr[0];
wire [10:0] dram_Ch0_cs0_bank_req_cntr_1 = dram_Ch0_cs0_bank_req_cntr[1];
wire [10:0] dram_Ch0_cs0_bank_req_cntr_2 = dram_Ch0_cs0_bank_req_cntr[2];
wire [10:0] dram_Ch0_cs0_bank_req_cntr_3 = dram_Ch0_cs0_bank_req_cntr[3];
wire [10:0] dram_Ch0_cs0_bank_req_cntr_4 = dram_Ch0_cs0_bank_req_cntr[4];
wire [10:0] dram_Ch0_cs0_bank_req_cntr_5 = dram_Ch0_cs0_bank_req_cntr[5];
wire [10:0] dram_Ch0_cs0_bank_req_cntr_6 = dram_Ch0_cs0_bank_req_cntr[6];
wire [10:0] dram_Ch0_cs0_bank_req_cntr_7 = dram_Ch0_cs0_bank_req_cntr[7];
reg [10:0]  dram_Ch0_cs1_bank_req_cntr [7:0];
wire [10:0] dram_Ch0_cs1_bank_req_cntr_0 = dram_Ch0_cs1_bank_req_cntr[0];
wire [10:0] dram_Ch0_cs1_bank_req_cntr_1 = dram_Ch0_cs1_bank_req_cntr[1];
wire [10:0] dram_Ch0_cs1_bank_req_cntr_2 = dram_Ch0_cs1_bank_req_cntr[2];
wire [10:0] dram_Ch0_cs1_bank_req_cntr_3 = dram_Ch0_cs1_bank_req_cntr[3];
wire [10:0] dram_Ch0_cs1_bank_req_cntr_4 = dram_Ch0_cs1_bank_req_cntr[4];
wire [10:0] dram_Ch0_cs1_bank_req_cntr_5 = dram_Ch0_cs1_bank_req_cntr[5];
wire [10:0] dram_Ch0_cs1_bank_req_cntr_6 = dram_Ch0_cs1_bank_req_cntr[6];
wire [10:0] dram_Ch0_cs1_bank_req_cntr_7 = dram_Ch0_cs1_bank_req_cntr[7];
reg [10:0]  dram_Ch0_cs2_bank_req_cntr [7:0];
wire [10:0] dram_Ch0_cs2_bank_req_cntr_0 = dram_Ch0_cs2_bank_req_cntr[0];
wire [10:0] dram_Ch0_cs2_bank_req_cntr_1 = dram_Ch0_cs2_bank_req_cntr[1];
wire [10:0] dram_Ch0_cs2_bank_req_cntr_2 = dram_Ch0_cs2_bank_req_cntr[2];
wire [10:0] dram_Ch0_cs2_bank_req_cntr_3 = dram_Ch0_cs2_bank_req_cntr[3];
wire [10:0] dram_Ch0_cs2_bank_req_cntr_4 = dram_Ch0_cs2_bank_req_cntr[4];
wire [10:0] dram_Ch0_cs2_bank_req_cntr_5 = dram_Ch0_cs2_bank_req_cntr[5];
wire [10:0] dram_Ch0_cs2_bank_req_cntr_6 = dram_Ch0_cs2_bank_req_cntr[6];
wire [10:0] dram_Ch0_cs2_bank_req_cntr_7 = dram_Ch0_cs2_bank_req_cntr[7];
reg [10:0]  dram_Ch0_cs3_bank_req_cntr [7:0];
wire [10:0] dram_Ch0_cs3_bank_req_cntr_0 = dram_Ch0_cs3_bank_req_cntr[0];
wire [10:0] dram_Ch0_cs3_bank_req_cntr_1 = dram_Ch0_cs3_bank_req_cntr[1];
wire [10:0] dram_Ch0_cs3_bank_req_cntr_2 = dram_Ch0_cs3_bank_req_cntr[2];
wire [10:0] dram_Ch0_cs3_bank_req_cntr_3 = dram_Ch0_cs3_bank_req_cntr[3];
wire [10:0] dram_Ch0_cs3_bank_req_cntr_4 = dram_Ch0_cs3_bank_req_cntr[4];
wire [10:0] dram_Ch0_cs3_bank_req_cntr_5 = dram_Ch0_cs3_bank_req_cntr[5];
wire [10:0] dram_Ch0_cs3_bank_req_cntr_6 = dram_Ch0_cs3_bank_req_cntr[6];
wire [10:0] dram_Ch0_cs3_bank_req_cntr_7 = dram_Ch0_cs3_bank_req_cntr[7];


always @ (posedge clk)
begin 
  if (~dram_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch0_cs0_bank_req_cntr[i] = 0;
       dram_Ch0_cs1_bank_req_cntr[i] = 0;
       dram_Ch0_cs2_bank_req_cntr[i] = 0;
       dram_Ch0_cs3_bank_req_cntr[i] = 0;
     end
   end
  else
   begin
     if ( !dram_Ch0_RAS_L && dram_Ch0_CAS_L && dram_Ch0_WE_L ) begin 
       case (dram_Ch0_CS_L) 
               4'b1110 : dram_Ch0_cs0_bank_req_cntr[dram_Ch0_BA] = dram_Ch0_cs0_bank_req_cntr[dram_Ch0_BA] + 1; 
               4'b1101 : dram_Ch0_cs1_bank_req_cntr[dram_Ch0_BA] = dram_Ch0_cs1_bank_req_cntr[dram_Ch0_BA] + 1; 
               4'b1011 : dram_Ch0_cs2_bank_req_cntr[dram_Ch0_BA] = dram_Ch0_cs2_bank_req_cntr[dram_Ch0_BA] + 1; 
               4'b0111 : dram_Ch0_cs3_bank_req_cntr[dram_Ch0_BA] = dram_Ch0_cs3_bank_req_cntr[dram_Ch0_BA] + 1; 
               default : begin 
                      $display("ERROR : In dram channel 0 ");
		      $display(" At time %0d CS_L = %x ", $time, dram_Ch0_CS_L);
                      finish_test(" Wrong CS  : CS_L should not have more that 1 device selected ", 0);
                    end
           
        endcase
     end
    end
end
reg [10:0]  dram_Ch1_cs0_bank_req_cntr [7:0];
wire [10:0] dram_Ch1_cs0_bank_req_cntr_0 = dram_Ch1_cs0_bank_req_cntr[0];
wire [10:0] dram_Ch1_cs0_bank_req_cntr_1 = dram_Ch1_cs0_bank_req_cntr[1];
wire [10:0] dram_Ch1_cs0_bank_req_cntr_2 = dram_Ch1_cs0_bank_req_cntr[2];
wire [10:0] dram_Ch1_cs0_bank_req_cntr_3 = dram_Ch1_cs0_bank_req_cntr[3];
wire [10:0] dram_Ch1_cs0_bank_req_cntr_4 = dram_Ch1_cs0_bank_req_cntr[4];
wire [10:0] dram_Ch1_cs0_bank_req_cntr_5 = dram_Ch1_cs0_bank_req_cntr[5];
wire [10:0] dram_Ch1_cs0_bank_req_cntr_6 = dram_Ch1_cs0_bank_req_cntr[6];
wire [10:0] dram_Ch1_cs0_bank_req_cntr_7 = dram_Ch1_cs0_bank_req_cntr[7];
reg [10:0]  dram_Ch1_cs1_bank_req_cntr [7:0];
wire [10:0] dram_Ch1_cs1_bank_req_cntr_0 = dram_Ch1_cs1_bank_req_cntr[0];
wire [10:0] dram_Ch1_cs1_bank_req_cntr_1 = dram_Ch1_cs1_bank_req_cntr[1];
wire [10:0] dram_Ch1_cs1_bank_req_cntr_2 = dram_Ch1_cs1_bank_req_cntr[2];
wire [10:0] dram_Ch1_cs1_bank_req_cntr_3 = dram_Ch1_cs1_bank_req_cntr[3];
wire [10:0] dram_Ch1_cs1_bank_req_cntr_4 = dram_Ch1_cs1_bank_req_cntr[4];
wire [10:0] dram_Ch1_cs1_bank_req_cntr_5 = dram_Ch1_cs1_bank_req_cntr[5];
wire [10:0] dram_Ch1_cs1_bank_req_cntr_6 = dram_Ch1_cs1_bank_req_cntr[6];
wire [10:0] dram_Ch1_cs1_bank_req_cntr_7 = dram_Ch1_cs1_bank_req_cntr[7];
reg [10:0]  dram_Ch1_cs2_bank_req_cntr [7:0];
wire [10:0] dram_Ch1_cs2_bank_req_cntr_0 = dram_Ch1_cs2_bank_req_cntr[0];
wire [10:0] dram_Ch1_cs2_bank_req_cntr_1 = dram_Ch1_cs2_bank_req_cntr[1];
wire [10:0] dram_Ch1_cs2_bank_req_cntr_2 = dram_Ch1_cs2_bank_req_cntr[2];
wire [10:0] dram_Ch1_cs2_bank_req_cntr_3 = dram_Ch1_cs2_bank_req_cntr[3];
wire [10:0] dram_Ch1_cs2_bank_req_cntr_4 = dram_Ch1_cs2_bank_req_cntr[4];
wire [10:0] dram_Ch1_cs2_bank_req_cntr_5 = dram_Ch1_cs2_bank_req_cntr[5];
wire [10:0] dram_Ch1_cs2_bank_req_cntr_6 = dram_Ch1_cs2_bank_req_cntr[6];
wire [10:0] dram_Ch1_cs2_bank_req_cntr_7 = dram_Ch1_cs2_bank_req_cntr[7];
reg [10:0]  dram_Ch1_cs3_bank_req_cntr [7:0];
wire [10:0] dram_Ch1_cs3_bank_req_cntr_0 = dram_Ch1_cs3_bank_req_cntr[0];
wire [10:0] dram_Ch1_cs3_bank_req_cntr_1 = dram_Ch1_cs3_bank_req_cntr[1];
wire [10:0] dram_Ch1_cs3_bank_req_cntr_2 = dram_Ch1_cs3_bank_req_cntr[2];
wire [10:0] dram_Ch1_cs3_bank_req_cntr_3 = dram_Ch1_cs3_bank_req_cntr[3];
wire [10:0] dram_Ch1_cs3_bank_req_cntr_4 = dram_Ch1_cs3_bank_req_cntr[4];
wire [10:0] dram_Ch1_cs3_bank_req_cntr_5 = dram_Ch1_cs3_bank_req_cntr[5];
wire [10:0] dram_Ch1_cs3_bank_req_cntr_6 = dram_Ch1_cs3_bank_req_cntr[6];
wire [10:0] dram_Ch1_cs3_bank_req_cntr_7 = dram_Ch1_cs3_bank_req_cntr[7];


always @ (posedge clk)
begin 
  if (~dram_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch1_cs0_bank_req_cntr[i] = 0;
       dram_Ch1_cs1_bank_req_cntr[i] = 0;
       dram_Ch1_cs2_bank_req_cntr[i] = 0;
       dram_Ch1_cs3_bank_req_cntr[i] = 0;
     end
   end
  else
   begin
     if ( !dram_Ch1_RAS_L && dram_Ch1_CAS_L && dram_Ch1_WE_L ) begin 
       case (dram_Ch1_CS_L) 
               4'b1110 : dram_Ch1_cs0_bank_req_cntr[dram_Ch1_BA] = dram_Ch1_cs0_bank_req_cntr[dram_Ch1_BA] + 1; 
               4'b1101 : dram_Ch1_cs1_bank_req_cntr[dram_Ch1_BA] = dram_Ch1_cs1_bank_req_cntr[dram_Ch1_BA] + 1; 
               4'b1011 : dram_Ch1_cs2_bank_req_cntr[dram_Ch1_BA] = dram_Ch1_cs2_bank_req_cntr[dram_Ch1_BA] + 1; 
               4'b0111 : dram_Ch1_cs3_bank_req_cntr[dram_Ch1_BA] = dram_Ch1_cs3_bank_req_cntr[dram_Ch1_BA] + 1; 
               default : begin 
                      $display("ERROR : In dram channel 1 ");
		      $display(" At time %0d CS_L = %x ", $time, dram_Ch1_CS_L);
                      finish_test(" Wrong CS  : CS_L should not have more that 1 device selected ", 1);
                    end
           
        endcase
     end
    end
end
reg [10:0]  dram_Ch2_cs0_bank_req_cntr [7:0];
wire [10:0] dram_Ch2_cs0_bank_req_cntr_0 = dram_Ch2_cs0_bank_req_cntr[0];
wire [10:0] dram_Ch2_cs0_bank_req_cntr_1 = dram_Ch2_cs0_bank_req_cntr[1];
wire [10:0] dram_Ch2_cs0_bank_req_cntr_2 = dram_Ch2_cs0_bank_req_cntr[2];
wire [10:0] dram_Ch2_cs0_bank_req_cntr_3 = dram_Ch2_cs0_bank_req_cntr[3];
wire [10:0] dram_Ch2_cs0_bank_req_cntr_4 = dram_Ch2_cs0_bank_req_cntr[4];
wire [10:0] dram_Ch2_cs0_bank_req_cntr_5 = dram_Ch2_cs0_bank_req_cntr[5];
wire [10:0] dram_Ch2_cs0_bank_req_cntr_6 = dram_Ch2_cs0_bank_req_cntr[6];
wire [10:0] dram_Ch2_cs0_bank_req_cntr_7 = dram_Ch2_cs0_bank_req_cntr[7];
reg [10:0]  dram_Ch2_cs1_bank_req_cntr [7:0];
wire [10:0] dram_Ch2_cs1_bank_req_cntr_0 = dram_Ch2_cs1_bank_req_cntr[0];
wire [10:0] dram_Ch2_cs1_bank_req_cntr_1 = dram_Ch2_cs1_bank_req_cntr[1];
wire [10:0] dram_Ch2_cs1_bank_req_cntr_2 = dram_Ch2_cs1_bank_req_cntr[2];
wire [10:0] dram_Ch2_cs1_bank_req_cntr_3 = dram_Ch2_cs1_bank_req_cntr[3];
wire [10:0] dram_Ch2_cs1_bank_req_cntr_4 = dram_Ch2_cs1_bank_req_cntr[4];
wire [10:0] dram_Ch2_cs1_bank_req_cntr_5 = dram_Ch2_cs1_bank_req_cntr[5];
wire [10:0] dram_Ch2_cs1_bank_req_cntr_6 = dram_Ch2_cs1_bank_req_cntr[6];
wire [10:0] dram_Ch2_cs1_bank_req_cntr_7 = dram_Ch2_cs1_bank_req_cntr[7];
reg [10:0]  dram_Ch2_cs2_bank_req_cntr [7:0];
wire [10:0] dram_Ch2_cs2_bank_req_cntr_0 = dram_Ch2_cs2_bank_req_cntr[0];
wire [10:0] dram_Ch2_cs2_bank_req_cntr_1 = dram_Ch2_cs2_bank_req_cntr[1];
wire [10:0] dram_Ch2_cs2_bank_req_cntr_2 = dram_Ch2_cs2_bank_req_cntr[2];
wire [10:0] dram_Ch2_cs2_bank_req_cntr_3 = dram_Ch2_cs2_bank_req_cntr[3];
wire [10:0] dram_Ch2_cs2_bank_req_cntr_4 = dram_Ch2_cs2_bank_req_cntr[4];
wire [10:0] dram_Ch2_cs2_bank_req_cntr_5 = dram_Ch2_cs2_bank_req_cntr[5];
wire [10:0] dram_Ch2_cs2_bank_req_cntr_6 = dram_Ch2_cs2_bank_req_cntr[6];
wire [10:0] dram_Ch2_cs2_bank_req_cntr_7 = dram_Ch2_cs2_bank_req_cntr[7];
reg [10:0]  dram_Ch2_cs3_bank_req_cntr [7:0];
wire [10:0] dram_Ch2_cs3_bank_req_cntr_0 = dram_Ch2_cs3_bank_req_cntr[0];
wire [10:0] dram_Ch2_cs3_bank_req_cntr_1 = dram_Ch2_cs3_bank_req_cntr[1];
wire [10:0] dram_Ch2_cs3_bank_req_cntr_2 = dram_Ch2_cs3_bank_req_cntr[2];
wire [10:0] dram_Ch2_cs3_bank_req_cntr_3 = dram_Ch2_cs3_bank_req_cntr[3];
wire [10:0] dram_Ch2_cs3_bank_req_cntr_4 = dram_Ch2_cs3_bank_req_cntr[4];
wire [10:0] dram_Ch2_cs3_bank_req_cntr_5 = dram_Ch2_cs3_bank_req_cntr[5];
wire [10:0] dram_Ch2_cs3_bank_req_cntr_6 = dram_Ch2_cs3_bank_req_cntr[6];
wire [10:0] dram_Ch2_cs3_bank_req_cntr_7 = dram_Ch2_cs3_bank_req_cntr[7];


always @ (posedge clk)
begin 
  if (~dram_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch2_cs0_bank_req_cntr[i] = 0;
       dram_Ch2_cs1_bank_req_cntr[i] = 0;
       dram_Ch2_cs2_bank_req_cntr[i] = 0;
       dram_Ch2_cs3_bank_req_cntr[i] = 0;
     end
   end
  else
   begin
     if ( !dram_Ch2_RAS_L && dram_Ch2_CAS_L && dram_Ch2_WE_L ) begin 
       case (dram_Ch2_CS_L) 
               4'b1110 : dram_Ch2_cs0_bank_req_cntr[dram_Ch2_BA] = dram_Ch2_cs0_bank_req_cntr[dram_Ch2_BA] + 1; 
               4'b1101 : dram_Ch2_cs1_bank_req_cntr[dram_Ch2_BA] = dram_Ch2_cs1_bank_req_cntr[dram_Ch2_BA] + 1; 
               4'b1011 : dram_Ch2_cs2_bank_req_cntr[dram_Ch2_BA] = dram_Ch2_cs2_bank_req_cntr[dram_Ch2_BA] + 1; 
               4'b0111 : dram_Ch2_cs3_bank_req_cntr[dram_Ch2_BA] = dram_Ch2_cs3_bank_req_cntr[dram_Ch2_BA] + 1; 
               default : begin 
                      $display("ERROR : In dram channel 2 ");
		      $display(" At time %0d CS_L = %x ", $time, dram_Ch2_CS_L);
                      finish_test(" Wrong CS  : CS_L should not have more that 1 device selected ", 2);
                    end
           
        endcase
     end
    end
end
reg [10:0]  dram_Ch3_cs0_bank_req_cntr [7:0];
wire [10:0] dram_Ch3_cs0_bank_req_cntr_0 = dram_Ch3_cs0_bank_req_cntr[0];
wire [10:0] dram_Ch3_cs0_bank_req_cntr_1 = dram_Ch3_cs0_bank_req_cntr[1];
wire [10:0] dram_Ch3_cs0_bank_req_cntr_2 = dram_Ch3_cs0_bank_req_cntr[2];
wire [10:0] dram_Ch3_cs0_bank_req_cntr_3 = dram_Ch3_cs0_bank_req_cntr[3];
wire [10:0] dram_Ch3_cs0_bank_req_cntr_4 = dram_Ch3_cs0_bank_req_cntr[4];
wire [10:0] dram_Ch3_cs0_bank_req_cntr_5 = dram_Ch3_cs0_bank_req_cntr[5];
wire [10:0] dram_Ch3_cs0_bank_req_cntr_6 = dram_Ch3_cs0_bank_req_cntr[6];
wire [10:0] dram_Ch3_cs0_bank_req_cntr_7 = dram_Ch3_cs0_bank_req_cntr[7];
reg [10:0]  dram_Ch3_cs1_bank_req_cntr [7:0];
wire [10:0] dram_Ch3_cs1_bank_req_cntr_0 = dram_Ch3_cs1_bank_req_cntr[0];
wire [10:0] dram_Ch3_cs1_bank_req_cntr_1 = dram_Ch3_cs1_bank_req_cntr[1];
wire [10:0] dram_Ch3_cs1_bank_req_cntr_2 = dram_Ch3_cs1_bank_req_cntr[2];
wire [10:0] dram_Ch3_cs1_bank_req_cntr_3 = dram_Ch3_cs1_bank_req_cntr[3];
wire [10:0] dram_Ch3_cs1_bank_req_cntr_4 = dram_Ch3_cs1_bank_req_cntr[4];
wire [10:0] dram_Ch3_cs1_bank_req_cntr_5 = dram_Ch3_cs1_bank_req_cntr[5];
wire [10:0] dram_Ch3_cs1_bank_req_cntr_6 = dram_Ch3_cs1_bank_req_cntr[6];
wire [10:0] dram_Ch3_cs1_bank_req_cntr_7 = dram_Ch3_cs1_bank_req_cntr[7];
reg [10:0]  dram_Ch3_cs2_bank_req_cntr [7:0];
wire [10:0] dram_Ch3_cs2_bank_req_cntr_0 = dram_Ch3_cs2_bank_req_cntr[0];
wire [10:0] dram_Ch3_cs2_bank_req_cntr_1 = dram_Ch3_cs2_bank_req_cntr[1];
wire [10:0] dram_Ch3_cs2_bank_req_cntr_2 = dram_Ch3_cs2_bank_req_cntr[2];
wire [10:0] dram_Ch3_cs2_bank_req_cntr_3 = dram_Ch3_cs2_bank_req_cntr[3];
wire [10:0] dram_Ch3_cs2_bank_req_cntr_4 = dram_Ch3_cs2_bank_req_cntr[4];
wire [10:0] dram_Ch3_cs2_bank_req_cntr_5 = dram_Ch3_cs2_bank_req_cntr[5];
wire [10:0] dram_Ch3_cs2_bank_req_cntr_6 = dram_Ch3_cs2_bank_req_cntr[6];
wire [10:0] dram_Ch3_cs2_bank_req_cntr_7 = dram_Ch3_cs2_bank_req_cntr[7];
reg [10:0]  dram_Ch3_cs3_bank_req_cntr [7:0];
wire [10:0] dram_Ch3_cs3_bank_req_cntr_0 = dram_Ch3_cs3_bank_req_cntr[0];
wire [10:0] dram_Ch3_cs3_bank_req_cntr_1 = dram_Ch3_cs3_bank_req_cntr[1];
wire [10:0] dram_Ch3_cs3_bank_req_cntr_2 = dram_Ch3_cs3_bank_req_cntr[2];
wire [10:0] dram_Ch3_cs3_bank_req_cntr_3 = dram_Ch3_cs3_bank_req_cntr[3];
wire [10:0] dram_Ch3_cs3_bank_req_cntr_4 = dram_Ch3_cs3_bank_req_cntr[4];
wire [10:0] dram_Ch3_cs3_bank_req_cntr_5 = dram_Ch3_cs3_bank_req_cntr[5];
wire [10:0] dram_Ch3_cs3_bank_req_cntr_6 = dram_Ch3_cs3_bank_req_cntr[6];
wire [10:0] dram_Ch3_cs3_bank_req_cntr_7 = dram_Ch3_cs3_bank_req_cntr[7];


always @ (posedge clk)
begin 
  if (~dram_rst_l)
   begin
     for(i=0;i<8;i=i+1) begin 
       dram_Ch3_cs0_bank_req_cntr[i] = 0;
       dram_Ch3_cs1_bank_req_cntr[i] = 0;
       dram_Ch3_cs2_bank_req_cntr[i] = 0;
       dram_Ch3_cs3_bank_req_cntr[i] = 0;
     end
   end
  else
   begin
     if ( !dram_Ch3_RAS_L && dram_Ch3_CAS_L && dram_Ch3_WE_L ) begin 
       case (dram_Ch3_CS_L) 
               4'b1110 : dram_Ch3_cs0_bank_req_cntr[dram_Ch3_BA] = dram_Ch3_cs0_bank_req_cntr[dram_Ch3_BA] + 1; 
               4'b1101 : dram_Ch3_cs1_bank_req_cntr[dram_Ch3_BA] = dram_Ch3_cs1_bank_req_cntr[dram_Ch3_BA] + 1; 
               4'b1011 : dram_Ch3_cs2_bank_req_cntr[dram_Ch3_BA] = dram_Ch3_cs2_bank_req_cntr[dram_Ch3_BA] + 1; 
               4'b0111 : dram_Ch3_cs3_bank_req_cntr[dram_Ch3_BA] = dram_Ch3_cs3_bank_req_cntr[dram_Ch3_BA] + 1; 
               default : begin 
                      $display("ERROR : In dram channel 3 ");
		      $display(" At time %0d CS_L = %x ", $time, dram_Ch3_CS_L);
                      finish_test(" Wrong CS  : CS_L should not have more that 1 device selected ", 3);
                    end
           
        endcase
     end
    end
end


//`endif // DRAM_SAT

//=====================================================================
// Monitor to print out basic RAS/CAS - Read/Write/Refresh 
// Bank/Channel/CS info
//=====================================================================


reg [1:0] this_cs_0;
always @ (posedge clk)
begin 
     case (dram_Ch0_CS_L) 
       4'b1110 : this_cs_0 = 0;
       4'b1101 : this_cs_0 = 1;
       4'b1011 : this_cs_0 = 2;
       4'b0111 : this_cs_0 = 3;
       default : this_cs_0 = 0;
     endcase

     if ( !dram_Ch0_RAS_L && dram_Ch0_CAS_L && dram_Ch0_WE_L ) begin 
       $display("%0d:DRAM_MON[%0d] -> RAS issued       :: CS%d Row = %x Bank = %x", $time,0,this_cs_0,dram_Ch0_ADDR,dram_Ch0_BA);
     end

     if ( dram_Ch0_RAS_L && !dram_Ch0_CAS_L && !dram_Ch0_WE_L ) begin 
       $display("%0d:DRAM_MON[%0d] -> WRITE CAS issued :: CS%d Col = %x Bank = %x", $time,0,this_cs_0,dram_Ch0_ADDR,dram_Ch0_BA);
     end

     if ( dram_Ch0_RAS_L && !dram_Ch0_CAS_L && dram_Ch0_WE_L ) begin 
       $display("%0d:DRAM_MON[%0d] -> READ  CAS issued :: CS%d Col = %x Bank = %x", $time,0,this_cs_0,dram_Ch0_ADDR,dram_Ch0_BA);
     end

     if ( !dram_Ch0_RAS_L && !dram_Ch0_CAS_L && dram_Ch0_WE_L ) begin 
       $display("%0d:DRAM_MON[%0d] -> AREFRSH issued   :: CS%d", $time,0,this_cs_0);
     end
end

reg [1:0] this_cs_1;
always @ (posedge clk)
begin 
     case (dram_Ch1_CS_L) 
       4'b1110 : this_cs_1 = 0;
       4'b1101 : this_cs_1 = 1;
       4'b1011 : this_cs_1 = 2;
       4'b0111 : this_cs_1 = 3;
       default : this_cs_1 = 0;
     endcase

     if ( !dram_Ch1_RAS_L && dram_Ch1_CAS_L && dram_Ch1_WE_L ) begin 
       $display("%0d:DRAM_MON[%0d] -> RAS issued       :: CS%d Row = %x Bank = %x", $time,1,this_cs_1,dram_Ch1_ADDR,dram_Ch1_BA);
     end

     if ( dram_Ch1_RAS_L && !dram_Ch1_CAS_L && !dram_Ch1_WE_L ) begin 
       $display("%0d:DRAM_MON[%0d] -> WRITE CAS issued :: CS%d Col = %x Bank = %x", $time,1,this_cs_1,dram_Ch1_ADDR,dram_Ch1_BA);
     end

     if ( dram_Ch1_RAS_L && !dram_Ch1_CAS_L && dram_Ch1_WE_L ) begin 
       $display("%0d:DRAM_MON[%0d] -> READ  CAS issued :: CS%d Col = %x Bank = %x", $time,1,this_cs_1,dram_Ch1_ADDR,dram_Ch1_BA);
     end

     if ( !dram_Ch1_RAS_L && !dram_Ch1_CAS_L && dram_Ch1_WE_L ) begin 
       $display("%0d:DRAM_MON[%0d] -> AREFRSH issued   :: CS%d", $time,1,this_cs_1);
     end
end

reg [1:0] this_cs_2;
always @ (posedge clk)
begin 
     case (dram_Ch2_CS_L) 
       4'b1110 : this_cs_2 = 0;
       4'b1101 : this_cs_2 = 1;
       4'b1011 : this_cs_2 = 2;
       4'b0111 : this_cs_2 = 3;
       default : this_cs_2 = 0;
     endcase

     if ( !dram_Ch2_RAS_L && dram_Ch2_CAS_L && dram_Ch2_WE_L ) begin 
       $display("%0d:DRAM_MON[%0d] -> RAS issued       :: CS%d Row = %x Bank = %x", $time,2,this_cs_2,dram_Ch2_ADDR,dram_Ch2_BA);
     end

     if ( dram_Ch2_RAS_L && !dram_Ch2_CAS_L && !dram_Ch2_WE_L ) begin 
       $display("%0d:DRAM_MON[%0d] -> WRITE CAS issued :: CS%d Col = %x Bank = %x", $time,2,this_cs_2,dram_Ch2_ADDR,dram_Ch2_BA);
     end

     if ( dram_Ch2_RAS_L && !dram_Ch2_CAS_L && dram_Ch2_WE_L ) begin 
       $display("%0d:DRAM_MON[%0d] -> READ  CAS issued :: CS%d Col = %x Bank = %x", $time,2,this_cs_2,dram_Ch2_ADDR,dram_Ch2_BA);
     end

     if ( !dram_Ch2_RAS_L && !dram_Ch2_CAS_L && dram_Ch2_WE_L ) begin 
       $display("%0d:DRAM_MON[%0d] -> AREFRSH issued   :: CS%d", $time,2,this_cs_2);
     end
end

reg [1:0] this_cs_3;
always @ (posedge clk)
begin 
     case (dram_Ch3_CS_L) 
       4'b1110 : this_cs_3 = 0;
       4'b1101 : this_cs_3 = 1;
       4'b1011 : this_cs_3 = 2;
       4'b0111 : this_cs_3 = 3;
       default : this_cs_3 = 0;
     endcase

     if ( !dram_Ch3_RAS_L && dram_Ch3_CAS_L && dram_Ch3_WE_L ) begin 
       $display("%0d:DRAM_MON[%0d] -> RAS issued       :: CS%d Row = %x Bank = %x", $time,3,this_cs_3,dram_Ch3_ADDR,dram_Ch3_BA);
     end

     if ( dram_Ch3_RAS_L && !dram_Ch3_CAS_L && !dram_Ch3_WE_L ) begin 
       $display("%0d:DRAM_MON[%0d] -> WRITE CAS issued :: CS%d Col = %x Bank = %x", $time,3,this_cs_3,dram_Ch3_ADDR,dram_Ch3_BA);
     end

     if ( dram_Ch3_RAS_L && !dram_Ch3_CAS_L && dram_Ch3_WE_L ) begin 
       $display("%0d:DRAM_MON[%0d] -> READ  CAS issued :: CS%d Col = %x Bank = %x", $time,3,this_cs_3,dram_Ch3_ADDR,dram_Ch3_BA);
     end

     if ( !dram_Ch3_RAS_L && !dram_Ch3_CAS_L && dram_Ch3_WE_L ) begin 
       $display("%0d:DRAM_MON[%0d] -> AREFRSH issued   :: CS%d", $time,3,this_cs_3);
     end
end

//=====================================================================
// Monitor to print out L2-DRAM RD/WR and RD Response
//=====================================================================




reg [39:0] this_addr_0;
reg        dvld_dly1_0;
reg        dvld_dly2_0;
reg        dvld_dly3_0;
reg [2:0]  rqid_dly1_0;
reg [2:0]  rqid_dly2_0;
reg [2:0]  rqid_dly3_0;
reg [1:0]  ch_0;

reg [2:0]  wr_data_cntr_0;
reg [511:0]  wr_data_0;
reg [39:0]   wr_addr_mon_0;

reg [39:0]  dram_Ch0_addr_store [7:0];

initial 
begin 
 wr_data_cntr_0 = 0;
 wr_data_0 = 0;
 wr_addr_mon_0 = 0;
end

always @ (posedge cmp_clk)
begin
  if (cmp_rst_l) begin 

   dvld_dly1_0 <= dram_Ch0_dram_sctag_data_vld;
   dvld_dly2_0 <= dvld_dly1_0;
   dvld_dly3_0 <= dvld_dly2_0;
 
   rqid_dly1_0 <= dram_Ch0_dram_sctag_rd_req_id;
   rqid_dly2_0 <= rqid_dly1_0;
   rqid_dly3_0 <= rqid_dly2_0;

     this_addr_0 = {dram_Ch0_sctag_dram_addr, 5'b0};


     // Read Req 
     if (dram_Ch0_sctag_dram_rd_req && !dram_Ch0_sctag_dram_rd_dummy_req) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Read       :: ReqId = %x, Addr = %x ", $time,0,dram_Ch0_sctag_dram_rd_req_id,this_addr_0);
        dram_Ch0_addr_store[dram_Ch0_sctag_dram_rd_req_id] <= this_addr_0;
     end

     if (dram_Ch0_sctag_dram_rd_req && dram_Ch0_sctag_dram_rd_dummy_req) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Dummy Read :: ReqId = %x, Addr = %x ", $time,0,dram_Ch0_sctag_dram_rd_req_id,this_addr_0);
        dram_Ch0_addr_store[dram_Ch0_sctag_dram_rd_req_id] <= this_addr_0;
     end

     // Write Req 
     if (dram_Ch0_sctag_dram_wr_req ) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Write      ::            Addr = %x ", $time,0,this_addr_0);
        wr_addr_mon_0 = this_addr_0;
     end

     if (dram_Ch0_sctag_dram_data_vld) begin 
       wr_data_0 = {wr_data_0,dram_Ch0_sctag_dram_wr_data};
      if ( wr_data_cntr_0 == 3'b111 ) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Write Data ::            Addr = %x, Data = %x ", $time,0, wr_addr_mon_0, wr_data_0);
      end
       wr_data_cntr_0 = wr_data_cntr_0 + 1;
     end

     // Read Data
     if (dvld_dly3_0 == 1'b1) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Read Data  :: ReqId = %x, Addr = %x, Data = %x ", $time,0,rqid_dly3_0,dram_Ch0_addr_store[rqid_dly3_0],dram_Ch0_dram_sctag_data);
     end
   
     // MECC
     if ((dvld_dly3_0 == 1'b1) && (dram_Ch0_dram_sctag_mecc_err == 1'b1) && (dram_Ch0_dram_sctag_pa_err != 1'b1)) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> MECC Uncorr err  :: ReqId = %x, Addr = %x, {RAS_AD=%d,CAS_AD=%d,RANK=%d,STACK=%d}", $time,0,rqid_dly3_0,dram_Ch0_addr_store[rqid_dly3_0], dram_Ch0_chip_config_reg[8:5], dram_Ch0_chip_config_reg[4:1],dram_Ch0_que_rank1_present, dram_Ch0_chip_config_reg[0]);
     end

     // MECC OOB
     if ((dvld_dly3_0 == 1'b1) && (dram_Ch0_dram_sctag_mecc_err == 1'b1) && (dram_Ch0_dram_sctag_pa_err == 1'b1)) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> OOB - MECC Uncorr err  :: ReqId = %x, Addr = %x, {RAS_AD=%d,CAS_AD=%d,RANK=%d,STACK=%d}", $time,0,rqid_dly3_0,dram_Ch0_addr_store[rqid_dly3_0], dram_Ch0_chip_config_reg[8:5], dram_Ch0_chip_config_reg[4:1],dram_Ch0_que_rank1_present, dram_Ch0_chip_config_reg[0]);
     end

     // SECC
     if ((dvld_dly3_0 == 1'b1) && (dram_Ch0_dram_sctag_secc_err == 1'b1)) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> SECC Corr err  :: ReqId = %x, Addr = %x", $time,0,rqid_dly3_0,dram_Ch0_addr_store[rqid_dly3_0]);
     end

     if (dram_Ch0_dram_sctag_scb_secc_err == 1'b1) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Scrub  SECC err Detected   ", $time,0);
	if($test$plusargs("FINISH_ON_SCRB_ERR")) begin
          finish_test(" Scrub error SECC detected", 0);
	end
     end

     if (dram_Ch0_dram_sctag_scb_mecc_err == 1'b1) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Scrub  MECC err Detected   ", $time,0);
	if($test$plusargs("FINISH_ON_SCRB_ERR")) begin
          finish_test(" Scrub error MECC detected", 0);
	end
     end

   end

end




reg [39:0] this_addr_1;
reg        dvld_dly1_1;
reg        dvld_dly2_1;
reg        dvld_dly3_1;
reg [2:0]  rqid_dly1_1;
reg [2:0]  rqid_dly2_1;
reg [2:0]  rqid_dly3_1;
reg [1:0]  ch_1;

reg [2:0]  wr_data_cntr_1;
reg [511:0]  wr_data_1;
reg [39:0]   wr_addr_mon_1;

reg [39:0]  dram_Ch1_addr_store [7:0];

initial 
begin 
 wr_data_cntr_1 = 0;
 wr_data_1 = 0;
 wr_addr_mon_1 = 0;
end

always @ (posedge cmp_clk)
begin
  if (cmp_rst_l) begin 

   dvld_dly1_1 <= dram_Ch1_dram_sctag_data_vld;
   dvld_dly2_1 <= dvld_dly1_1;
   dvld_dly3_1 <= dvld_dly2_1;
 
   rqid_dly1_1 <= dram_Ch1_dram_sctag_rd_req_id;
   rqid_dly2_1 <= rqid_dly1_1;
   rqid_dly3_1 <= rqid_dly2_1;

     this_addr_1 = {dram_Ch1_sctag_dram_addr, 5'b0};


     // Read Req 
     if (dram_Ch1_sctag_dram_rd_req && !dram_Ch1_sctag_dram_rd_dummy_req) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Read       :: ReqId = %x, Addr = %x ", $time,2,dram_Ch1_sctag_dram_rd_req_id,this_addr_1);
        dram_Ch1_addr_store[dram_Ch1_sctag_dram_rd_req_id] <= this_addr_1;
     end

     if (dram_Ch1_sctag_dram_rd_req && dram_Ch1_sctag_dram_rd_dummy_req) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Dummy Read :: ReqId = %x, Addr = %x ", $time,2,dram_Ch1_sctag_dram_rd_req_id,this_addr_1);
        dram_Ch1_addr_store[dram_Ch1_sctag_dram_rd_req_id] <= this_addr_1;
     end

     // Write Req 
     if (dram_Ch1_sctag_dram_wr_req ) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Write      ::            Addr = %x ", $time,2,this_addr_1);
        wr_addr_mon_1 = this_addr_1;
     end

     if (dram_Ch1_sctag_dram_data_vld) begin 
       wr_data_1 = {wr_data_1,dram_Ch1_sctag_dram_wr_data};
      if ( wr_data_cntr_1 == 3'b111 ) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Write Data ::            Addr = %x, Data = %x ", $time,2, wr_addr_mon_1, wr_data_1);
      end
       wr_data_cntr_1 = wr_data_cntr_1 + 1;
     end

     // Read Data
     if (dvld_dly3_1 == 1'b1) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Read Data  :: ReqId = %x, Addr = %x, Data = %x ", $time,2,rqid_dly3_1,dram_Ch1_addr_store[rqid_dly3_1],dram_Ch1_dram_sctag_data);
     end
   
     // MECC
     if ((dvld_dly3_1 == 1'b1) && (dram_Ch1_dram_sctag_mecc_err == 1'b1) && (dram_Ch1_dram_sctag_pa_err != 1'b1)) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> MECC Uncorr err  :: ReqId = %x, Addr = %x, {RAS_AD=%d,CAS_AD=%d,RANK=%d,STACK=%d}", $time,2,rqid_dly3_1,dram_Ch1_addr_store[rqid_dly3_1], dram_Ch1_chip_config_reg[8:5], dram_Ch1_chip_config_reg[4:1],dram_Ch1_que_rank1_present, dram_Ch1_chip_config_reg[0]);
     end

     // MECC OOB
     if ((dvld_dly3_1 == 1'b1) && (dram_Ch1_dram_sctag_mecc_err == 1'b1) && (dram_Ch1_dram_sctag_pa_err == 1'b1)) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> OOB - MECC Uncorr err  :: ReqId = %x, Addr = %x, {RAS_AD=%d,CAS_AD=%d,RANK=%d,STACK=%d}", $time,2,rqid_dly3_1,dram_Ch1_addr_store[rqid_dly3_1], dram_Ch1_chip_config_reg[8:5], dram_Ch1_chip_config_reg[4:1],dram_Ch1_que_rank1_present, dram_Ch1_chip_config_reg[0]);
     end

     // SECC
     if ((dvld_dly3_1 == 1'b1) && (dram_Ch1_dram_sctag_secc_err == 1'b1)) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> SECC Corr err  :: ReqId = %x, Addr = %x", $time,2,rqid_dly3_1,dram_Ch1_addr_store[rqid_dly3_1]);
     end

     if (dram_Ch1_dram_sctag_scb_secc_err == 1'b1) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Scrub  SECC err Detected   ", $time,2);
	if($test$plusargs("FINISH_ON_SCRB_ERR")) begin
          finish_test(" Scrub error SECC detected", 1);
	end
     end

     if (dram_Ch1_dram_sctag_scb_mecc_err == 1'b1) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Scrub  MECC err Detected   ", $time,2);
	if($test$plusargs("FINISH_ON_SCRB_ERR")) begin
          finish_test(" Scrub error MECC detected", 1);
	end
     end

   end

end




reg [39:0] this_addr_2;
reg        dvld_dly1_2;
reg        dvld_dly2_2;
reg        dvld_dly3_2;
reg [2:0]  rqid_dly1_2;
reg [2:0]  rqid_dly2_2;
reg [2:0]  rqid_dly3_2;
reg [1:0]  ch_2;

reg [2:0]  wr_data_cntr_2;
reg [511:0]  wr_data_2;
reg [39:0]   wr_addr_mon_2;

reg [39:0]  dram_Ch2_addr_store [7:0];

initial 
begin 
 wr_data_cntr_2 = 0;
 wr_data_2 = 0;
 wr_addr_mon_2 = 0;
end

always @ (posedge cmp_clk)
begin
  if (cmp_rst_l) begin 

   dvld_dly1_2 <= dram_Ch2_dram_sctag_data_vld;
   dvld_dly2_2 <= dvld_dly1_2;
   dvld_dly3_2 <= dvld_dly2_2;
 
   rqid_dly1_2 <= dram_Ch2_dram_sctag_rd_req_id;
   rqid_dly2_2 <= rqid_dly1_2;
   rqid_dly3_2 <= rqid_dly2_2;

     this_addr_2 = {dram_Ch2_sctag_dram_addr, 5'b0};


     // Read Req 
     if (dram_Ch2_sctag_dram_rd_req && !dram_Ch2_sctag_dram_rd_dummy_req) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Read       :: ReqId = %x, Addr = %x ", $time,1,dram_Ch2_sctag_dram_rd_req_id,this_addr_2);
        dram_Ch2_addr_store[dram_Ch2_sctag_dram_rd_req_id] <= this_addr_2;
     end

     if (dram_Ch2_sctag_dram_rd_req && dram_Ch2_sctag_dram_rd_dummy_req) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Dummy Read :: ReqId = %x, Addr = %x ", $time,1,dram_Ch2_sctag_dram_rd_req_id,this_addr_2);
        dram_Ch2_addr_store[dram_Ch2_sctag_dram_rd_req_id] <= this_addr_2;
     end

     // Write Req 
     if (dram_Ch2_sctag_dram_wr_req ) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Write      ::            Addr = %x ", $time,1,this_addr_2);
        wr_addr_mon_2 = this_addr_2;
     end

     if (dram_Ch2_sctag_dram_data_vld) begin 
       wr_data_2 = {wr_data_2,dram_Ch2_sctag_dram_wr_data};
      if ( wr_data_cntr_2 == 3'b111 ) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Write Data ::            Addr = %x, Data = %x ", $time,1, wr_addr_mon_2, wr_data_2);
      end
       wr_data_cntr_2 = wr_data_cntr_2 + 1;
     end

     // Read Data
     if (dvld_dly3_2 == 1'b1) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Read Data  :: ReqId = %x, Addr = %x, Data = %x ", $time,1,rqid_dly3_2,dram_Ch2_addr_store[rqid_dly3_2],dram_Ch2_dram_sctag_data);
     end
   
     // MECC
     if ((dvld_dly3_2 == 1'b1) && (dram_Ch2_dram_sctag_mecc_err == 1'b1) && (dram_Ch2_dram_sctag_pa_err != 1'b1)) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> MECC Uncorr err  :: ReqId = %x, Addr = %x, {RAS_AD=%d,CAS_AD=%d,RANK=%d,STACK=%d}", $time,1,rqid_dly3_2,dram_Ch2_addr_store[rqid_dly3_2], dram_Ch2_chip_config_reg[8:5], dram_Ch2_chip_config_reg[4:1],dram_Ch2_que_rank1_present, dram_Ch2_chip_config_reg[0]);
     end

     // MECC OOB
     if ((dvld_dly3_2 == 1'b1) && (dram_Ch2_dram_sctag_mecc_err == 1'b1) && (dram_Ch2_dram_sctag_pa_err == 1'b1)) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> OOB - MECC Uncorr err  :: ReqId = %x, Addr = %x, {RAS_AD=%d,CAS_AD=%d,RANK=%d,STACK=%d}", $time,1,rqid_dly3_2,dram_Ch2_addr_store[rqid_dly3_2], dram_Ch2_chip_config_reg[8:5], dram_Ch2_chip_config_reg[4:1],dram_Ch2_que_rank1_present, dram_Ch2_chip_config_reg[0]);
     end

     // SECC
     if ((dvld_dly3_2 == 1'b1) && (dram_Ch2_dram_sctag_secc_err == 1'b1)) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> SECC Corr err  :: ReqId = %x, Addr = %x", $time,1,rqid_dly3_2,dram_Ch2_addr_store[rqid_dly3_2]);
     end

     if (dram_Ch2_dram_sctag_scb_secc_err == 1'b1) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Scrub  SECC err Detected   ", $time,1);
	if($test$plusargs("FINISH_ON_SCRB_ERR")) begin
          finish_test(" Scrub error SECC detected", 2);
	end
     end

     if (dram_Ch2_dram_sctag_scb_mecc_err == 1'b1) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Scrub  MECC err Detected   ", $time,1);
	if($test$plusargs("FINISH_ON_SCRB_ERR")) begin
          finish_test(" Scrub error MECC detected", 2);
	end
     end

   end

end




reg [39:0] this_addr_3;
reg        dvld_dly1_3;
reg        dvld_dly2_3;
reg        dvld_dly3_3;
reg [2:0]  rqid_dly1_3;
reg [2:0]  rqid_dly2_3;
reg [2:0]  rqid_dly3_3;
reg [1:0]  ch_3;

reg [2:0]  wr_data_cntr_3;
reg [511:0]  wr_data_3;
reg [39:0]   wr_addr_mon_3;

reg [39:0]  dram_Ch3_addr_store [7:0];

initial 
begin 
 wr_data_cntr_3 = 0;
 wr_data_3 = 0;
 wr_addr_mon_3 = 0;
end

always @ (posedge cmp_clk)
begin
  if (cmp_rst_l) begin 

   dvld_dly1_3 <= dram_Ch3_dram_sctag_data_vld;
   dvld_dly2_3 <= dvld_dly1_3;
   dvld_dly3_3 <= dvld_dly2_3;
 
   rqid_dly1_3 <= dram_Ch3_dram_sctag_rd_req_id;
   rqid_dly2_3 <= rqid_dly1_3;
   rqid_dly3_3 <= rqid_dly2_3;

     this_addr_3 = {dram_Ch3_sctag_dram_addr, 5'b0};


     // Read Req 
     if (dram_Ch3_sctag_dram_rd_req && !dram_Ch3_sctag_dram_rd_dummy_req) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Read       :: ReqId = %x, Addr = %x ", $time,3,dram_Ch3_sctag_dram_rd_req_id,this_addr_3);
        dram_Ch3_addr_store[dram_Ch3_sctag_dram_rd_req_id] <= this_addr_3;
     end

     if (dram_Ch3_sctag_dram_rd_req && dram_Ch3_sctag_dram_rd_dummy_req) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Dummy Read :: ReqId = %x, Addr = %x ", $time,3,dram_Ch3_sctag_dram_rd_req_id,this_addr_3);
        dram_Ch3_addr_store[dram_Ch3_sctag_dram_rd_req_id] <= this_addr_3;
     end

     // Write Req 
     if (dram_Ch3_sctag_dram_wr_req ) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Write      ::            Addr = %x ", $time,3,this_addr_3);
        wr_addr_mon_3 = this_addr_3;
     end

     if (dram_Ch3_sctag_dram_data_vld) begin 
       wr_data_3 = {wr_data_3,dram_Ch3_sctag_dram_wr_data};
      if ( wr_data_cntr_3 == 3'b111 ) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Write Data ::            Addr = %x, Data = %x ", $time,3, wr_addr_mon_3, wr_data_3);
      end
       wr_data_cntr_3 = wr_data_cntr_3 + 1;
     end

     // Read Data
     if (dvld_dly3_3 == 1'b1) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Read Data  :: ReqId = %x, Addr = %x, Data = %x ", $time,3,rqid_dly3_3,dram_Ch3_addr_store[rqid_dly3_3],dram_Ch3_dram_sctag_data);
     end
   
     // MECC
     if ((dvld_dly3_3 == 1'b1) && (dram_Ch3_dram_sctag_mecc_err == 1'b1) && (dram_Ch3_dram_sctag_pa_err != 1'b1)) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> MECC Uncorr err  :: ReqId = %x, Addr = %x, {RAS_AD=%d,CAS_AD=%d,RANK=%d,STACK=%d}", $time,3,rqid_dly3_3,dram_Ch3_addr_store[rqid_dly3_3], dram_Ch3_chip_config_reg[8:5], dram_Ch3_chip_config_reg[4:1],dram_Ch3_que_rank1_present, dram_Ch3_chip_config_reg[0]);
     end

     // MECC OOB
     if ((dvld_dly3_3 == 1'b1) && (dram_Ch3_dram_sctag_mecc_err == 1'b1) && (dram_Ch3_dram_sctag_pa_err == 1'b1)) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> OOB - MECC Uncorr err  :: ReqId = %x, Addr = %x, {RAS_AD=%d,CAS_AD=%d,RANK=%d,STACK=%d}", $time,3,rqid_dly3_3,dram_Ch3_addr_store[rqid_dly3_3], dram_Ch3_chip_config_reg[8:5], dram_Ch3_chip_config_reg[4:1],dram_Ch3_que_rank1_present, dram_Ch3_chip_config_reg[0]);
     end

     // SECC
     if ((dvld_dly3_3 == 1'b1) && (dram_Ch3_dram_sctag_secc_err == 1'b1)) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> SECC Corr err  :: ReqId = %x, Addr = %x", $time,3,rqid_dly3_3,dram_Ch3_addr_store[rqid_dly3_3]);
     end

     if (dram_Ch3_dram_sctag_scb_secc_err == 1'b1) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Scrub  SECC err Detected   ", $time,3);
	if($test$plusargs("FINISH_ON_SCRB_ERR")) begin
          finish_test(" Scrub error SECC detected", 3);
	end
     end

     if (dram_Ch3_dram_sctag_scb_mecc_err == 1'b1) begin 
       $display("%0d:L2_DRAM_MON[%0d] -> Scrub  MECC err Detected   ", $time,3);
	if($test$plusargs("FINISH_ON_SCRB_ERR")) begin
          finish_test(" Scrub error MECC detected", 3);
	end
     end

   end

end


//=====================================================================
// This task allows some more clocks and kills the test
//=====================================================================
task finish_test;
input [512:0] message;
input [2:0]   id;

begin
  $display("%0d ERROR: DRAM Channel %d %s", $time, id, message);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
`ifdef MODELSIM  
  $display ("dram_mon", "DRAM monitor exited") ;
`else
  $error ("dram_mon", "DRAM monitor exited") ;
`endif
end
endtask

endmodule
