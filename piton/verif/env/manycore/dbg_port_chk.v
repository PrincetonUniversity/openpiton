// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: dbg_port_chk.v
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
// Debug Port A and Debug Port B checker
//
// This checker verifies the functionality of the debug port a and debug port b
// interfaces of the Niagara chip. It is also responsible for verifying the trigout
// and trigin functionality.
// This checker also provides all the permutations of Debug Port A outputs (excluding
// l2c transactions) so that the tester team can select the type of output at runtime
// on the tester and have the expected waveform without having to rerun the test case
// in simulation.
//
// Date: December 2003
//
////////////////////////////////////////////////////////////////////////////////

`include "sys.h"
`include "iop.h"

module dbg_port_chk () ;

// signals from the rtl
wire iobdg_dbg_portb_hi_dbg_en ;
wire iobdg_dbg_portb_lo_dbg_en ;
wire iob_io_dbg_en ;
wire creg_dbg_l2_vis_ctrl_2 ;

wire pcx_sctag0_data_rdy_px2 ;
wire pcx_sctag1_data_rdy_px2 ;
wire pcx_sctag2_data_rdy_px2 ;
wire pcx_sctag3_data_rdy_px2 ;

// l2 queue
reg  [47:0] l2q [31:0] ;
reg  [5:0]  l2q_rd_ptr ;
reg  [5:0]  l2q_rd_ptr_d1 ;
reg  [5:0]  l2q_wr_ptr ;
reg  [5:0]  l2q_rd_ptr_cmp ;
reg  [5:0]  l2q_wr_ptr_jbus ;
reg  [5:0]  l2q_wr_ptr_jbus_d1 ;
reg         l2q_drop ;
wire        l2q_full ;
wire        l2q_empty ;
wire        l2q_rd ;
wire        l2q_wr ;
wire        l2q_wr_a ;
wire        l2q_wr_b ;
wire [5:0]  l2q_wr_ptr_ns ;
wire [5:0]  l2q_rd_ptr_ns ;
reg  [7:0]  l2q_timestamp ;
wire [7:0]  l2q_timestamp_ns ;
reg  [47:0] l2q_data ;
reg         l2q_data_vld ;

wire [47:0] l2_bus ;
reg  [39:0] l2_dbgbus_01_d1 ;
reg  [39:0] l2_dbgbus_23_d1 ;
reg  [39:0] l2_dbgbus_01_d2 ;
reg  [39:0] l2_dbgbus_23_d2 ;

// replicate all control registers
reg [63:0] iob_vis_select_cfg ; // 0x98_0000_1000
reg [63:0] l2_vis_control_cfg ; // 0x98_0000_1800
reg [63:0] l2_vis_mask_a_cfg ; // 0x98_0000_1820
reg [63:0] l2_vis_mask_b_cfg ; // 0x98_0000_1828
reg [63:0] l2_vis_compare_a_cfg ; // 0x98_0000_1830
reg [63:0] l2_vis_compare_b_cfg ; // 0x98_0000_1838
reg [63:0] l2_trig_delay_cfg ; // 0x98_0000_1840
reg [63:0] db_enet_control_cfg ; // 0x98_0000_2000
reg [63:0] db_enet_idleval_cfg ; // 0x98_0000_2008
reg [63:0] l2c0_control_reg_cfg ; // 0xA9_0000_0000
reg [63:0] l2c1_control_reg_cfg ; // 0xA9_0000_0040
reg [63:0] l2c2_control_reg_cfg ; // 0xA9_0000_0080
reg [63:0] l2c3_control_reg_cfg ; // 0xA9_0000_00c0
reg [63:0] db_jbus_control_cfg ; // 0x98_0000_2100
reg [63:0] db_jbus_mask_a_hi_cfg ; // 0x98_0000_2140
reg [63:0] db_jbus_compare_a_hi_cfg ; // 0x98_0000_2148
reg [63:0] db_jbus_count_a_hi_cfg ; // 0x98_0000_2150
reg [63:0] db_jbus_mask_b_hi_cfg ; // 0x98_0000_2160
reg [63:0] db_jbus_compare_b_hi_cfg ; // 0x98_0000_2168
reg [63:0] db_jbus_count_b_hi_cfg ; // 0x98_0000_2170
reg [63:0] db_jbus_mask_a_lo_cfg ; // 0x98_0000_2180
reg [63:0] db_jbus_compare_a_lo_cfg ; // 0x98_0000_2188
reg [63:0] db_jbus_count_a_lo_cfg ; // 0x98_0000_2190
reg [63:0] db_jbus_mask_b_lo_cfg ; // 0x98_0000_21a0
reg [63:0] db_jbus_compare_b_lo_cfg ; // 0x98_0000_21a8
reg [63:0] db_jbus_count_b_lo_cfg ; // 0x98_0000_21b0

// replicate the iob debug port buses
wire [43:0] iob_vis_port_0111 ;
reg  [43:0] iob_vis_port_0111_d ;
wire [43:0] iob_vis_port_0110 ;
reg  [43:0] iob_vis_port_0110_d ;
wire [43:0] iob_vis_port_0011 ;
reg  [43:0] iob_vis_port_0011_d ;
wire [43:0] iob_vis_port_0010 ;
wire [43:0] iob_vis_port_0001 ;
reg  [43:0] iob_vis_port_0001_d ;
wire [43:0] iob_vis_port_0000 ;
wire [43:0] iob_vis_port ;
reg  [43:0] iob_vis_port_d ;

// replicate the debug port a buses
wire [39:0] debug_port_a_0100 ;
wire [39:0] debug_port_a_0011 ;
wire [39:0] debug_port_a_0010 ;
wire [39:0] debug_port_a_0001 ;
wire [39:0] debug_port_a_0000 ;
wire [39:0] debug_port_a ;
wire debug_port_a_vld ;

// permutations of debug port a
wire [39:0] debug_porta_0100_iob_0000 ;
wire [39:0] debug_porta_0010_iob_0000 ;
wire [39:0] debug_porta_0010_iob_0001 ;
wire [39:0] debug_porta_0010_iob_0010 ;
wire [39:0] debug_porta_0010_iob_0011 ;
wire [39:0] debug_porta_0010_iob_0110 ;
wire [39:0] debug_porta_0010_iob_0111 ;
wire [39:0] debug_porta_0011_iob_0111 ;
wire [39:0] debug_porta_0011_iob_0110 ;
wire [39:0] debug_porta_0011_iob_0011 ;

wire        debug_porta_0100_iob_0000_vld ;
wire        debug_porta_0010_iob_0000_vld ;
wire        debug_porta_0010_iob_0001_vld ;
wire        debug_porta_0010_iob_0010_vld ;
wire        debug_porta_0010_iob_0011_vld ;
wire        debug_porta_0010_iob_0110_vld ;
wire        debug_porta_0010_iob_0111_vld ;
wire        debug_porta_0011_iob_0111_vld ;
wire        debug_porta_0011_iob_0110_vld ;
wire        debug_porta_0011_iob_0011_vld ;

wire [39:0] dbg_dq_a4i0 ;
wire [39:0] dbg_dq_a2i0 ;
wire [39:0] dbg_dq_a2i1 ;
wire [39:0] dbg_dq_a2i2 ;
wire [39:0] dbg_dq_a2i3 ;
wire [39:0] dbg_dq_a2i6 ;
wire [39:0] dbg_dq_a2i7 ;
wire [39:0] dbg_dq_a3i7 ;
wire [39:0] dbg_dq_a3i6 ;
wire [39:0] dbg_dq_a3i3 ;

wire [39:0] dbg_dq_porta_0100_iob_0000 ;
reg  [39:0] dbg_dq_porta_0100_iob_0000_d1 ;
reg  [39:0] dbg_dq_porta_0100_iob_0000_d2 ;
reg  [39:0] dbg_dq_porta_0100_iob_0000_d3 ;

wire [39:0] dbg_dq_porta_0010_iob_0000 ;
reg  [39:0] dbg_dq_porta_0010_iob_0000_d1 ;
reg  [39:0] dbg_dq_porta_0010_iob_0000_d2 ;
reg  [39:0] dbg_dq_porta_0010_iob_0000_d3 ;

wire [39:0] dbg_dq_porta_0010_iob_0001 ;
reg  [39:0] dbg_dq_porta_0010_iob_0001_d1 ;
reg  [39:0] dbg_dq_porta_0010_iob_0001_d2 ;
reg  [39:0] dbg_dq_porta_0010_iob_0001_d3 ;

wire [39:0] dbg_dq_porta_0010_iob_0010 ;
reg  [39:0] dbg_dq_porta_0010_iob_0010_d1 ;
reg  [39:0] dbg_dq_porta_0010_iob_0010_d2 ;
reg  [39:0] dbg_dq_porta_0010_iob_0010_d3 ;

wire [39:0] dbg_dq_porta_0010_iob_0011 ;
reg  [39:0] dbg_dq_porta_0010_iob_0011_d1 ;
reg  [39:0] dbg_dq_porta_0010_iob_0011_d2 ;
reg  [39:0] dbg_dq_porta_0010_iob_0011_d3 ;

wire [39:0] dbg_dq_porta_0010_iob_0110 ;
reg  [39:0] dbg_dq_porta_0010_iob_0110_d1 ;
reg  [39:0] dbg_dq_porta_0010_iob_0110_d2 ;
reg  [39:0] dbg_dq_porta_0010_iob_0110_d3 ;

wire [39:0] dbg_dq_porta_0010_iob_0111 ;
reg  [39:0] dbg_dq_porta_0010_iob_0111_d1 ;
reg  [39:0] dbg_dq_porta_0010_iob_0111_d2 ;
reg  [39:0] dbg_dq_porta_0010_iob_0111_d3 ;

wire [39:0] dbg_dq_porta_0011_iob_0111 ;
reg  [39:0] dbg_dq_porta_0011_iob_0111_d1 ;
reg  [39:0] dbg_dq_porta_0011_iob_0111_d2 ;
reg  [39:0] dbg_dq_porta_0011_iob_0111_d3 ;

wire [39:0] dbg_dq_porta_0011_iob_0110 ;
reg  [39:0] dbg_dq_porta_0011_iob_0110_d1 ;
reg  [39:0] dbg_dq_porta_0011_iob_0110_d2 ;
reg  [39:0] dbg_dq_porta_0011_iob_0110_d3 ;

wire [39:0] dbg_dq_porta_0011_iob_0011 ;
reg  [39:0] dbg_dq_porta_0011_iob_0011_d1 ;
reg  [39:0] dbg_dq_porta_0011_iob_0011_d2 ;
reg  [39:0] dbg_dq_porta_0011_iob_0011_d3 ;

// pcx_iob transacton type
wire [1:0] ttype ;
wire soh ;
wire soh_0111 ;
wire soh_0110 ;
wire soh_0011 ;

// debug port b
wire [47:0]   dbg_portb_100 ;
wire          dbg_portb_100_vld ;
wire [47:0]   dbg_portb_011 ;
wire          dbg_portb_011_vld ;
wire [47:0]   dbg_portb_hi_010 ;
wire          dbg_portb_hi_010_vld ;
wire [47:0]   dbg_portb_lo_010 ;
wire          dbg_portb_lo_010_vld ;
wire [47:0]   dbg_portb_000 ;
wire          dbg_portb_000_vld ;
wire [47:0]   dbg_portb_lo_sel ;
wire          dbg_portb_lo_vld_sel ;
wire [47:0]   dbg_portb_lo ;
wire          dbg_portb_lo_vld ;
wire [47:0]   dbg_portb_hi_sel ;
wire          dbg_portb_hi_vld_sel ;
wire [47:0]   dbg_portb_hi ;
wire          dbg_portb_hi_vld ;

reg  [47:0]   dbg_portb_lo_d1 ;
reg  [47:0]   dbg_portb_lo_d2 ;
reg  [47:0]   dbg_portb_hi_d1 ;
reg  [47:0]   dbg_portb_hi_d2 ;
reg           dbg_portb_lo_vld_d1 ;
reg           dbg_portb_lo_vld_d2 ;
reg           dbg_portb_hi_vld_d1 ;
reg           dbg_portb_hi_vld_d2 ;

wire [43:0]   dbg_portb_mask_a_lo ;
wire [43:0]   dbg_portb_mask_b_lo ;
wire [43:0]   dbg_portb_mask_a_hi ;
wire [43:0]   dbg_portb_mask_b_hi ;

// debug port a
wire [39:0] dbg_dq ;
reg  [39:0] dbg_dq_d1 ;
reg  [39:0] dbg_dq_d2 ;
reg  [39:0] dbg_dq_d3 ;

// debug port pins
wire [39:0] dbg_dq_pin ;
reg         dbg_trigout_pin ;

// sctag interface signals
wire         l2_dbgbus_rdy ;
wire [39:0]  l2_dbgbus ;

wire [39:0]  l2_mask_a ;
wire [39:0]  l2_mask_b ;

// checker control signals
wire         error_dbg_dq ;
wire         error_dbg_trigout ;
wire         error_dbg_portb_lo ;
wire         error_dbg_portb_hi ;
wire         error_dbg_portb_hi_vld ;
wire         error_dbg_portb_lo_vld ;

reg          dbg_portb_hi_en;
reg          dbg_portb_lo_en;
reg          dbg_porta_en;
reg          trig_out_en ;
reg          dbg_port_chk_on ;

// debug trigout signals
reg          dbg_trigout_ps ;
wire         dbg_trigout_ns ;
reg  [31:0]  l2_trig_delay_cnt_ps ;
wire [31:0]  l2_trig_delay_cnt_ns ;


////////////////////////////////////////////////////////////////////////////////
// this checker is disabled by default and must be explicitly turned on
////////////////////////////////////////////////////////////////////////////////

initial
begin
  dbg_port_chk_on= 1'b0;

  if( $test$plusargs("dbg_port_chk_on") ) begin
    dbg_port_chk_on = 1'b1;
  end
end

////////////////////////////////////////////////////////////////////////////////
// compare expected and actual output
////////////////////////////////////////////////////////////////////////////////

initial dbg_portb_hi_en = 1'b0 ;
initial dbg_portb_lo_en = 1'b0 ;
initial dbg_porta_en = 1'b0 ;
initial trig_out_en = 1'b0 ;

`ifdef GATE_SIM_IOBDG
`else
assign iobdg_dbg_portb_hi_dbg_en = cmp_top.iop.iobdg.iobdg_dbg.iobdg_dbg_portb_hi.dbg_en ;
assign iobdg_dbg_portb_lo_dbg_en = cmp_top.iop.iobdg.iobdg_dbg.iobdg_dbg_portb_lo.dbg_en ;
assign iob_io_dbg_en = cmp_top.iop.iobdg.iobdg_dbg.iobdg_dbg_porta.iob_io_dbg_en ;
assign creg_dbg_l2_vis_ctrl_2 = cmp_top.iop.iobdg.iobdg_dbg.iobdg_dbg_l2.creg_dbg_l2_vis_ctrl[2] ;
`endif // ifdef GATE_SIM_IOBDG


always @(iobdg_dbg_portb_hi_dbg_en or db_jbus_control_cfg[16]) begin
  dbg_portb_hi_en = 1'b0 ;
  if (iobdg_dbg_portb_hi_dbg_en === 1'b1 && db_jbus_control_cfg[16] === 1'b1 ) begin
    repeat (4) @(posedge cmp_top.iop.iobdg.jbus_rclk) ;
    dbg_portb_hi_en = 1'b1 ;
  end
end

always @(iobdg_dbg_portb_lo_dbg_en or db_jbus_control_cfg[16]) begin
  dbg_portb_lo_en = 1'b0 ;
  if (iobdg_dbg_portb_lo_dbg_en === 1'b1  && db_jbus_control_cfg[16] === 1'b1 ) begin
    repeat (4) @(posedge cmp_top.iop.iobdg.jbus_rclk) ;
    dbg_portb_lo_en = 1'b1 ;
  end
end

always @(iob_io_dbg_en) begin
  dbg_porta_en = 1'b0 ;
  if (iob_io_dbg_en === 1'b1) begin
    repeat (4) @(posedge cmp_top.iop.iobdg.jbus_rclk) ;
    dbg_porta_en = 1'b1 ;
  end
end

wire l2_armin;

always @(creg_dbg_l2_vis_ctrl_2 or l2_armin) begin
  trig_out_en = 1'b0 ;
  if (creg_dbg_l2_vis_ctrl_2 === 1'b1 || l2_armin === 1'b1) begin
    repeat (4) @(posedge cmp_top.iop.iobdg.jbus_rclk) ;
    trig_out_en = 1'b1 ;
  end
end


always @(posedge cmp_top.iop.iobdg.jbus_rclk) begin
  if (error_dbg_dq && dbg_port_chk_on && dbg_porta_en) begin
    $display ("Error on cmp_top.DBG_DQ from dbg_port_chk") ;
    repeat (4) @(posedge cmp_top.iop.iobdg.jbus_rclk) ; 
    $finish () ;
  end

  if (error_dbg_trigout && dbg_port_chk_on && trig_out_en) begin
    $display ("Error on cmp_top.J_ERR from dbg_port_chk") ;
    repeat (4) @(posedge cmp_top.iop.iobdg.jbus_rclk) ; 
    $finish () ;
  end

  if (error_dbg_portb_lo_vld && dbg_port_chk_on && dbg_portb_lo_en) begin
    $display ("Error on cmp_top.iop.iob_jbi_dbg_lo_vld from dbg_port_chk") ;
    repeat (4) @(posedge cmp_top.iop.iobdg.jbus_rclk) ; 
    $finish () ;
  end

  if (error_dbg_portb_hi_vld && dbg_port_chk_on && dbg_portb_hi_en) begin
    $display ("Error on cmp_top.iop.iob_jbi_dbg_hi_vld from dbg_port_chk") ;
    repeat (4) @(posedge cmp_top.iop.iobdg.jbus_rclk) ; 
    $finish () ;
  end
  
  // verify ???
  if (error_dbg_portb_lo && dbg_port_chk_on && dbg_portb_lo_en && dbg_portb_lo_vld_d2) begin
    $display ("Error on cmp_top.iop.iob_jbi_dbg_lo_data from dbg_port_chk") ;
    repeat (4) @(posedge cmp_top.iop.iobdg.jbus_rclk) ; 
    $finish () ;
  end
  
  // verify ???
  if (error_dbg_portb_hi && dbg_port_chk_on && dbg_portb_hi_en && dbg_portb_hi_vld_d2) begin
    $display ("Error on cmp_top.iop.iob_jbi_dbg_hi_data from dbg_port_chk") ;
    repeat (4) @(posedge cmp_top.iop.iobdg.jbus_rclk) ; 
    $finish () ;
  end
end

assign error_dbg_portb_lo_vld = (cmp_top.iop.iob_jbi_dbg_lo_vld === dbg_portb_lo_vld_d2) ? 1'b0 : 1'b1 ;
assign error_dbg_portb_hi_vld = (cmp_top.iop.iob_jbi_dbg_hi_vld === dbg_portb_hi_vld_d2) ? 1'b0 : 1'b1 ;
assign error_dbg_portb_lo = (cmp_top.iop.iob_jbi_dbg_lo_data === dbg_portb_lo_d2) ? 1'b0 : 1'b1 ;
assign error_dbg_portb_hi = (cmp_top.iop.iob_jbi_dbg_hi_data === dbg_portb_hi_d2) ? 1'b0 : 1'b1 ;
assign error_dbg_dq = (cmp_top.DBG_DQ === dbg_dq_pin) ? 1'b0 : 1'b1 ;
//assign error_dbg_trigout = (cmp_top.J_ERR === dbg_trigout_pin) ? 1'b0 : 1'b1 ;
assign error_dbg_trigout = (cmp_top.iop.iob_ctu_l2_tr === dbg_trigout_pin) ? 1'b0 : 1'b1 ;

// drive the debug port a pins

//assign dbg_dq = (debug_port_a_vld == 1'b1) && (iob_io_dbg_en === 1'b1) ? debug_port_a :
//                (debug_port_a_vld == 1'b0) && (iob_io_dbg_en === 1'b1) ? db_enet_idleval_cfg [39:0] :
//                40'hffffffffff ;
assign dbg_dq = (debug_port_a_vld == 1'b1) ? debug_port_a :
                (debug_port_a_vld == 1'b0) ? db_enet_idleval_cfg [39:0] :
                40'hffffffffff ;

// select transaction type

`ifdef GATE_SIM_IOBDG
assign ttype = (cmp_top.iop.iobdg.c2i_packet [`UCB_PKT_HI:`UCB_PKT_LO] == `UCB_READ_REQ) ? 2'b00 :
               (cmp_top.iop.iobdg.c2i_packet [`UCB_PKT_HI:`UCB_PKT_LO] == `UCB_WRITE_REQ) ? 2'b01 :
               (cmp_top.iop.iobdg.c2i_packet [`UCB_PKT_HI:`UCB_PKT_LO] == `UCB_IFILL_REQ) ? 2'b10 :
               2'b11 ;
`else
assign ttype = (cmp_top.iop.iobdg.c2i.c2i_sdp.c2i_packet [`UCB_PKT_HI:`UCB_PKT_LO] == `UCB_READ_REQ) ? 2'b00 :
               (cmp_top.iop.iobdg.c2i.c2i_sdp.c2i_packet [`UCB_PKT_HI:`UCB_PKT_LO] == `UCB_WRITE_REQ) ? 2'b01 :
               (cmp_top.iop.iobdg.c2i.c2i_sdp.c2i_packet [`UCB_PKT_HI:`UCB_PKT_LO] == `UCB_IFILL_REQ) ? 2'b10 :
               2'b11 ;
`endif

assign soh = ((~iob_vis_port_d [43]) & iob_vis_port [43]) |
             ((~iob_vis_port_d [41]) & iob_vis_port [41]) |
             ((~iob_vis_port_d [39]) & iob_vis_port [39]) |
             ((~iob_vis_port_d [37]) & iob_vis_port [37]) |
             ((~iob_vis_port_d [35]) & iob_vis_port [35]) |
             ((~iob_vis_port_d [33]) & iob_vis_port [33]) ;

assign soh_0111 = ((~iob_vis_port_0111_d [43]) & iob_vis_port_0111 [43]) |
                  ((~iob_vis_port_0111_d [41]) & iob_vis_port_0111 [41]) |
                  ((~iob_vis_port_0111_d [39]) & iob_vis_port_0111 [39]) |
                  ((~iob_vis_port_0111_d [37]) & iob_vis_port_0111 [37]) |
                  ((~iob_vis_port_0111_d [35]) & iob_vis_port_0111 [35]) |
                  ((~iob_vis_port_0111_d [33]) & iob_vis_port_0111 [33]) ;

assign soh_0110 = ((~iob_vis_port_0110_d [43]) & iob_vis_port_0110 [43]) |
                  ((~iob_vis_port_0110_d [41]) & iob_vis_port_0110 [41]) |
                  ((~iob_vis_port_0110_d [39]) & iob_vis_port_0110 [39]) |
                  ((~iob_vis_port_0110_d [37]) & iob_vis_port_0110 [37]) |
                  ((~iob_vis_port_0110_d [35]) & iob_vis_port_0110 [35]) |
                  ((~iob_vis_port_0110_d [33]) & iob_vis_port_0110 [33]) ;

assign soh_0011 = ((~iob_vis_port_0011_d [43]) & iob_vis_port_0011 [43]) |
                  ((~iob_vis_port_0011_d [41]) & iob_vis_port_0011 [41]) |
                  ((~iob_vis_port_0011_d [39]) & iob_vis_port_0011 [39]) |
                  ((~iob_vis_port_0011_d [37]) & iob_vis_port_0011 [37]) |
                  ((~iob_vis_port_0011_d [35]) & iob_vis_port_0011 [35]) |
                  ((~iob_vis_port_0011_d [33]) & iob_vis_port_0011 [33]) ;

// delay debug port a bus to match output pins

always @(posedge cmp_top.iop.iobdg.jbus_rclk) begin
  dbg_dq_d3 <= dbg_dq_d2 ;
  dbg_dq_d2 <= dbg_dq_d1 ;
  dbg_dq_d1 <= dbg_dq ;
end

assign #1 dbg_dq_pin = dbg_dq_d3 ;

// drive debug port a bus

assign debug_port_a_vld = (db_enet_control_cfg [3:0] === 4'b0100) ? iob_vis_port [43] :
                          (db_enet_control_cfg [3:0] === 4'b0011) ? (iob_vis_port [43] & (~iob_vis_port [42])) |
                                                                    (iob_vis_port [41] & (~iob_vis_port [40])) |
                                                                    (iob_vis_port [39] & (~iob_vis_port [38])) |
                                                                    (iob_vis_port [37] & (~iob_vis_port [36])) |
                                                                    (iob_vis_port [35] & (~iob_vis_port [34])) |
                                                                    (iob_vis_port [33] & (~iob_vis_port [32])) :
                          (db_enet_control_cfg [3:0] === 4'b0010) ? 1'b1 :
                          (db_enet_control_cfg [3:0] === 4'b0001) ? l2q_data_vld :
                          (db_enet_control_cfg [3:0] === 4'b0000) ? l2q_data_vld :
                          1'b0 ;

assign debug_port_a = (db_enet_control_cfg [3:0] === 4'b0100) ? debug_port_a_0100 :
                      (db_enet_control_cfg [3:0] === 4'b0011) ? debug_port_a_0011 :
                      (db_enet_control_cfg [3:0] === 4'b0010) ? debug_port_a_0010 :
                      (db_enet_control_cfg [3:0] === 4'b0001) ? debug_port_a_0001 :
                      (db_enet_control_cfg [3:0] === 4'b0000) ? debug_port_a_0000 :
                      40'hXXXXXXXXXX ;

assign debug_port_a_0100 = {
                            iob_vis_port [39:35],
                            iob_vis_port [41],  // check with Bill
                            iob_vis_port [33:0]
                           } ;

assign debug_port_a_0011 = {
                            1'b0,
                            soh,
                            (iob_vis_port [43] & (~iob_vis_port [42])),
                            (iob_vis_port [41] & (~iob_vis_port [40])),
                            (iob_vis_port [39] & (~iob_vis_port [38])),
                            (iob_vis_port [37] & (~iob_vis_port [36])),
                            (iob_vis_port [35] & (~iob_vis_port [34])),
                            (iob_vis_port [33] & (~iob_vis_port [32])),
                            iob_vis_port [31:0]
                           } ;

assign debug_port_a_0010 = {
                            iob_vis_port [39:0]
                           } ;

assign debug_port_a_0001 = {l2q_data [39:30], l2q_data [47:40], l2q_data[21:0]} ;

assign debug_port_a_0000 = l2q_data ;

////////////////////////////////////////////////////////////////////////////////
// drive all the permutations of debug port a and iob vis for the tester patterns
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// debug port a - 0010 & iob vis - 0000
////////////////////////////////////////////////////////////////////////////////

assign #1 dbg_dq_a4i0 = dbg_dq_porta_0100_iob_0000_d3 ;

always @(posedge cmp_top.iop.iobdg.jbus_rclk) begin
  dbg_dq_porta_0100_iob_0000_d3 <= dbg_dq_porta_0100_iob_0000_d2 ;
  dbg_dq_porta_0100_iob_0000_d2 <= dbg_dq_porta_0100_iob_0000_d1 ;
  dbg_dq_porta_0100_iob_0000_d1 <= dbg_dq_porta_0100_iob_0000 ;
end

assign dbg_dq_porta_0100_iob_0000 = (debug_porta_0100_iob_0000_vld) ? debug_porta_0100_iob_0000 :
                                    (~debug_porta_0100_iob_0000_vld) ? db_enet_idleval_cfg [39:0] :
                                    40'hXXXXXXXXXX ;

assign debug_porta_0100_iob_0000_vld = iob_vis_port_0000 [43] ;

assign debug_porta_0100_iob_0000 = {
                                    iob_vis_port_0000 [39:35],
                                    iob_vis_port_0000 [40],
                                    iob_vis_port_0000 [33:0]
                                   } ;

////////////////////////////////////////////////////////////////////////////////
// debug port a - 0010 & iob vis - 0000
////////////////////////////////////////////////////////////////////////////////

assign #1 dbg_dq_a2i0 = dbg_dq_porta_0010_iob_0000_d3 ;

always @(posedge cmp_top.iop.iobdg.jbus_rclk) begin
  dbg_dq_porta_0010_iob_0000_d3 <= dbg_dq_porta_0010_iob_0000_d2 ;
  dbg_dq_porta_0010_iob_0000_d2 <= dbg_dq_porta_0010_iob_0000_d1 ;
  dbg_dq_porta_0010_iob_0000_d1 <= dbg_dq_porta_0010_iob_0000 ;
end

assign dbg_dq_porta_0010_iob_0000 = (debug_porta_0010_iob_0000_vld) ? debug_porta_0010_iob_0000 :
                                    (~debug_porta_0010_iob_0000_vld) ? db_enet_idleval_cfg [39:0] :
                                    40'hXXXXXXXXXX ;

assign debug_porta_0010_iob_0000_vld = 1'b1 ;

assign debug_porta_0010_iob_0000 = iob_vis_port_0000 [39:0] ;

////////////////////////////////////////////////////////////////////////////////
// debug port a - 0010 & iob vis - 0001
////////////////////////////////////////////////////////////////////////////////

assign #1 dbg_dq_a2i1 = dbg_dq_porta_0010_iob_0001_d3 ;

always @(posedge cmp_top.iop.iobdg.jbus_rclk) begin
  dbg_dq_porta_0010_iob_0001_d3 <= dbg_dq_porta_0010_iob_0001_d2 ;
  dbg_dq_porta_0010_iob_0001_d2 <= dbg_dq_porta_0010_iob_0001_d1 ;
  dbg_dq_porta_0010_iob_0001_d1 <= dbg_dq_porta_0010_iob_0001 ;
end

assign dbg_dq_porta_0010_iob_0001 = (debug_porta_0010_iob_0001_vld) ? debug_porta_0010_iob_0001 :
                                    (~debug_porta_0010_iob_0001_vld) ? db_enet_idleval_cfg [39:0] :
                                    40'hXXXXXXXXXX ;

assign debug_porta_0010_iob_0001_vld = 1'b1 ;

assign debug_porta_0010_iob_0001 = iob_vis_port_0001 [39:0] ;

////////////////////////////////////////////////////////////////////////////////
// debug port a - 0010 & iob vis - 0010
////////////////////////////////////////////////////////////////////////////////

assign #1 dbg_dq_a2i2 = dbg_dq_porta_0010_iob_0010_d3 ;

always @(posedge cmp_top.iop.iobdg.jbus_rclk) begin
  dbg_dq_porta_0010_iob_0010_d3 <= dbg_dq_porta_0010_iob_0010_d2 ;
  dbg_dq_porta_0010_iob_0010_d2 <= dbg_dq_porta_0010_iob_0010_d1 ;
  dbg_dq_porta_0010_iob_0010_d1 <= dbg_dq_porta_0010_iob_0010 ;
end

assign dbg_dq_porta_0010_iob_0010 = (debug_porta_0010_iob_0010_vld) ? debug_porta_0010_iob_0010 :
                                    (~debug_porta_0010_iob_0010_vld) ? db_enet_idleval_cfg [39:0] :
                                    40'hXXXXXXXXXX ;

assign debug_porta_0010_iob_0010_vld = 1'b1 ;

assign debug_porta_0010_iob_0010 = iob_vis_port_0010 [39:0] ;

////////////////////////////////////////////////////////////////////////////////
// debug port a - 0010 & iob vis - 0011
////////////////////////////////////////////////////////////////////////////////

assign #1 dbg_dq_a2i3 = dbg_dq_porta_0010_iob_0011_d3 ;

always @(posedge cmp_top.iop.iobdg.jbus_rclk) begin
  dbg_dq_porta_0010_iob_0011_d3 <= dbg_dq_porta_0010_iob_0011_d2 ;
  dbg_dq_porta_0010_iob_0011_d2 <= dbg_dq_porta_0010_iob_0011_d1 ;
  dbg_dq_porta_0010_iob_0011_d1 <= dbg_dq_porta_0010_iob_0011 ;
end

assign dbg_dq_porta_0010_iob_0011 = (debug_porta_0010_iob_0011_vld) ? debug_porta_0010_iob_0011 :
                                    (~debug_porta_0010_iob_0011_vld) ? db_enet_idleval_cfg [39:0] :
                                    40'hXXXXXXXXXX ;

assign debug_porta_0010_iob_0011_vld = 1'b1 ;

assign debug_porta_0010_iob_0011 = iob_vis_port_0011 [39:0] ;

////////////////////////////////////////////////////////////////////////////////
// debug port a - 0010 & iob vis - 0110
////////////////////////////////////////////////////////////////////////////////

assign #1 dbg_dq_a2i6 = dbg_dq_porta_0010_iob_0110_d3 ;

always @(posedge cmp_top.iop.iobdg.jbus_rclk) begin
  dbg_dq_porta_0010_iob_0110_d3 <= dbg_dq_porta_0010_iob_0110_d2 ;
  dbg_dq_porta_0010_iob_0110_d2 <= dbg_dq_porta_0010_iob_0110_d1 ;
  dbg_dq_porta_0010_iob_0110_d1 <= dbg_dq_porta_0010_iob_0110 ;
end

assign dbg_dq_porta_0010_iob_0110 = (debug_porta_0010_iob_0110_vld) ? debug_porta_0010_iob_0110 :
                                    (~debug_porta_0010_iob_0110_vld) ? db_enet_idleval_cfg [39:0] :
                                    40'hXXXXXXXXXX ;

assign debug_porta_0010_iob_0110_vld = 1'b1 ;

assign debug_porta_0010_iob_0110 = iob_vis_port_0110 [39:0] ;

////////////////////////////////////////////////////////////////////////////////
// debug port a - 0010 & iob vis - 0111
////////////////////////////////////////////////////////////////////////////////

assign #1 dbg_dq_a2i7 = dbg_dq_porta_0010_iob_0111_d3 ;

always @(posedge cmp_top.iop.iobdg.jbus_rclk) begin
  dbg_dq_porta_0010_iob_0111_d3 <= dbg_dq_porta_0010_iob_0111_d2 ;
  dbg_dq_porta_0010_iob_0111_d2 <= dbg_dq_porta_0010_iob_0111_d1 ;
  dbg_dq_porta_0010_iob_0111_d1 <= dbg_dq_porta_0010_iob_0111 ;
end

assign dbg_dq_porta_0010_iob_0111 = (debug_porta_0010_iob_0111_vld) ? debug_porta_0010_iob_0111 :
                                    (~debug_porta_0010_iob_0111_vld) ? db_enet_idleval_cfg [39:0] :
                                    40'hXXXXXXXXXX ;

assign debug_porta_0010_iob_0111_vld = 1'b1 ;

assign debug_porta_0010_iob_0111 = iob_vis_port_0111 [39:0] ;

////////////////////////////////////////////////////////////////////////////////
// debug port a - 0011 & iob vis - 0111
////////////////////////////////////////////////////////////////////////////////

assign #1 dbg_dq_a3i7 = dbg_dq_porta_0011_iob_0111_d3 ;

always @(posedge cmp_top.iop.iobdg.jbus_rclk) begin
  dbg_dq_porta_0011_iob_0111_d3 <= dbg_dq_porta_0011_iob_0111_d2 ;
  dbg_dq_porta_0011_iob_0111_d2 <= dbg_dq_porta_0011_iob_0111_d1 ;
  dbg_dq_porta_0011_iob_0111_d1 <= dbg_dq_porta_0011_iob_0111 ;
end

assign dbg_dq_porta_0011_iob_0111 = (debug_porta_0011_iob_0111_vld) ? debug_porta_0011_iob_0111 :
                                    (~debug_porta_0011_iob_0111_vld) ? db_enet_idleval_cfg [39:0] :
                                    40'hXXXXXXXXXX ;

assign debug_porta_0011_iob_0111_vld = iob_vis_port_0111 [43] | iob_vis_port_0111 [41] | iob_vis_port_0111 [39] | iob_vis_port_0111 [37] | iob_vis_port_0111 [35] | iob_vis_port_0111 [33] ;

assign debug_porta_0011_iob_0111 = {
                            1'b0,
                            soh_0111,
                            (iob_vis_port_0111 [43] & (~iob_vis_port_0111 [42])),
                            (iob_vis_port_0111 [41] & (~iob_vis_port_0111 [40])),
                            (iob_vis_port_0111 [39] & (~iob_vis_port_0111 [38])),
                            (iob_vis_port_0111 [37] & (~iob_vis_port_0111 [36])),
                            (iob_vis_port_0111 [35] & (~iob_vis_port_0111 [34])),
                            (iob_vis_port_0111 [33] & (~iob_vis_port_0111 [32])),
                            iob_vis_port_0111 [31:0]
                           } ;

////////////////////////////////////////////////////////////////////////////////
// debug port a - 0011 & iob vis - 0110
////////////////////////////////////////////////////////////////////////////////

assign #1 dbg_dq_a3i6 = dbg_dq_porta_0011_iob_0110_d3 ;

always @(posedge cmp_top.iop.iobdg.jbus_rclk) begin
  dbg_dq_porta_0011_iob_0110_d3 <= dbg_dq_porta_0011_iob_0110_d2 ;
  dbg_dq_porta_0011_iob_0110_d2 <= dbg_dq_porta_0011_iob_0110_d1 ;
  dbg_dq_porta_0011_iob_0110_d1 <= dbg_dq_porta_0011_iob_0110 ;
end

assign dbg_dq_porta_0011_iob_0110 = (debug_porta_0011_iob_0110_vld) ? debug_porta_0011_iob_0110 :
                                    (~debug_porta_0011_iob_0110_vld) ? db_enet_idleval_cfg [39:0] :
                                    40'hXXXXXXXXXX ;

assign debug_porta_0011_iob_0110_vld = iob_vis_port_0110 [43] | iob_vis_port_0110 [41] | iob_vis_port_0110 [39] | iob_vis_port_0110 [37] | iob_vis_port_0110 [35] | iob_vis_port_0110 [33] ;

assign debug_porta_0011_iob_0110 = {
                            1'b0,
                            soh_0110,
                            (iob_vis_port_0110 [43] & (~iob_vis_port_0110 [42])),
                            (iob_vis_port_0110 [41] & (~iob_vis_port_0110 [40])),
                            (iob_vis_port_0110 [39] & (~iob_vis_port_0110 [38])),
                            (iob_vis_port_0110 [37] & (~iob_vis_port_0110 [36])),
                            (iob_vis_port_0110 [35] & (~iob_vis_port_0110 [34])),
                            (iob_vis_port_0110 [33] & (~iob_vis_port_0110 [32])),
                            iob_vis_port_0110 [31:0]
                           } ;

////////////////////////////////////////////////////////////////////////////////
// debug port a - 0011 & iob vis - 0011
////////////////////////////////////////////////////////////////////////////////

assign #1 dbg_dq_a3i3 = dbg_dq_porta_0011_iob_0011_d3 ;

always @(posedge cmp_top.iop.iobdg.jbus_rclk) begin
  dbg_dq_porta_0011_iob_0011_d3 <= dbg_dq_porta_0011_iob_0011_d2 ;
  dbg_dq_porta_0011_iob_0011_d2 <= dbg_dq_porta_0011_iob_0011_d1 ;
  dbg_dq_porta_0011_iob_0011_d1 <= dbg_dq_porta_0011_iob_0011 ;
end

assign dbg_dq_porta_0011_iob_0011 = (debug_porta_0011_iob_0011_vld) ? debug_porta_0011_iob_0011 :
                                    (~debug_porta_0011_iob_0011_vld) ? db_enet_idleval_cfg [39:0] :
                                    40'hXXXXXXXXXX ;

assign debug_porta_0011_iob_0011_vld = iob_vis_port_0011 [43]  | iob_vis_port_0011 [41] | iob_vis_port_0011 [39] | iob_vis_port_0011 [37] | iob_vis_port_0011 [35] | iob_vis_port_0011 [33] ;

assign debug_porta_0011_iob_0011 = {
                            1'b0,
                            soh_0011,
                            (iob_vis_port_0011 [43] & (~iob_vis_port_0011 [42])),
                            (iob_vis_port_0011 [41] & (~iob_vis_port_0011 [40])),
                            (iob_vis_port_0011 [39] & (~iob_vis_port_0011 [38])),
                            (iob_vis_port_0011 [37] & (~iob_vis_port_0011 [36])),
                            (iob_vis_port_0011 [35] & (~iob_vis_port_0011 [34])),
                            (iob_vis_port_0011 [33] & (~iob_vis_port_0011 [32])),
                            iob_vis_port_0011 [31:0]
                           } ;

////////////////////////////////////////////////////////////////////////////////
// drive the iob debug port buses
////////////////////////////////////////////////////////////////////////////////

assign iob_vis_port = (iob_vis_select_cfg [3:0] === 4'b0111) ? iob_vis_port_0111 :
                      (iob_vis_select_cfg [3:0] === 4'b0110) ? iob_vis_port_0110 :
                      (iob_vis_select_cfg [3:0] === 4'b0011) ? iob_vis_port_0011 :
                      (iob_vis_select_cfg [3:0] === 4'b0010) ? iob_vis_port_0010 :
                      (iob_vis_select_cfg [3:0] === 4'b0001) ? iob_vis_port_0001 :
                      (iob_vis_select_cfg [3:0] === 4'b0000) ? iob_vis_port_0000 :
                      44'h0 ;

always @(posedge cmp_top.iop.iobdg.jbus_rclk) begin
  iob_vis_port_d <= iob_vis_port ;
  iob_vis_port_0111_d <= iob_vis_port_0111 ;
  iob_vis_port_0110_d <= iob_vis_port_0110 ;
  iob_vis_port_0011_d <= iob_vis_port_0011 ;
  iob_vis_port_0001_d <= iob_vis_port_0001 ;
end

assign iob_vis_port_0111 = {
                            cmp_top.iop.jbi_iob_spi_vld,      // spi ack vld
                            cmp_top.iop.iob_jbi_spi_stall,    // spi ack stall
                            cmp_top.iop.iob_jbi_spi_vld,      // spi req vld
                            cmp_top.iop.jbi_iob_spi_stall,    // spi req stall

                            cmp_top.iop.dram13_iob_vld,       // dram1 ack vld
                            cmp_top.iop.iob_dram13_stall,     // dram1 ack stall
                            cmp_top.iop.iob_dram13_vld,       // dram1 req vld
                            cmp_top.iop.dram13_iob_stall,     // dram1 req stall

                            cmp_top.iop.dram02_iob_vld,       // dram0 ack vld
                            cmp_top.iop.iob_dram02_stall,     // dram 0 ack stall
                            cmp_top.iop.iob_dram02_vld,       // dram0 req vld
                            cmp_top.iop.dram02_iob_stall,     // dram0 req stall

                            cmp_top.iop.dram13_iob_data,       // dram1 ack
                            cmp_top.iop.iob_dram13_data,       // dram1 req
                            cmp_top.iop.dram02_iob_data,       // dram0 ack
                            cmp_top.iop.iob_dram02_data,       // dram0 req
                            8'h00,
                            cmp_top.iop.jbi_iob_spi_data,      // spi ack
                            cmp_top.iop.iob_jbi_spi_data       // spi req
                           };

assign iob_vis_port_0110 = {
                            cmp_top.iop.tap_iob_vld,           // tap ack vld
                            cmp_top.iop.iob_tap_stall,         // tap ack stall
                            cmp_top.iop.iob_tap_vld,           // tap req vld
                            cmp_top.iop.tap_iob_stall,         // tap req stall
                            4'h0,
                            cmp_top.iop.clsp_iob_vld,          // ctu ack vld
                            cmp_top.iop.iob_clsp_stall,        // ctu ack stall
                            cmp_top.iop.iob_clsp_vld,          // ctu req vld
                            cmp_top.iop.clsp_iob_stall,        // ctu req stall
                            8'h00,
                            cmp_top.iop.clsp_iob_data,         // ctu ack
                            cmp_top.iop.iob_clsp_data,         // ctu req
                            cmp_top.iop.tap_iob_data,          // tap ack
                            cmp_top.iop.iob_tap_data           // tap req
                           } ;

assign iob_vis_port_0011 = {
                            cmp_top.iop.jbi_iob_pio_vld,           // jbi ack vld
                            cmp_top.iop.iob_jbi_pio_stall,         // jbi ack stall
                            cmp_top.iop.iob_jbi_pio_vld,           // jbi req vld
                            cmp_top.iop.jbi_iob_pio_stall,         // jbi req stall
                            24'h000000,
                            cmp_top.iop.jbi_iob_pio_data           // jbi ack
                           } ;

assign iob_vis_port_0010 = {
                            cmp_top.iop.jbi_iob_pio_vld,           // jbi ack vld
                            cmp_top.iop.iob_jbi_pio_stall,         // jbi ack stall
                            cmp_top.iop.iob_jbi_pio_vld,           // jbi req vld
                            cmp_top.iop.jbi_iob_pio_stall,         // jbi req stall
                            cmp_top.iop.jbi_iob_pio_data [15:8],   // jbi ack [15:8]
                            cmp_top.iop.iob_jbi_pio_data [63:32]   // jbi req [63:32]
                           } ;

assign iob_vis_port_0001 = {
                            cmp_top.iop.jbi_iob_pio_vld,           // jbi ack vld
                            cmp_top.iop.iob_jbi_pio_stall,         // jbi ack stall
                            cmp_top.iop.iob_jbi_pio_vld,           // jbi req vld
                            cmp_top.iop.jbi_iob_pio_stall,         // jbi req stall
                            cmp_top.iop.jbi_iob_pio_data [7:0],    // jbi ack [7:0]
                            cmp_top.iop.iob_jbi_pio_data [31:0]    // jbi req [31:0]
                           } ;

`ifdef GATE_SIM_IOBDG
assign iob_vis_port_0000 = {
                            cmp_top.iop.iobdg.ucb_buf_acpt,
                            ttype,
                            cmp_top.iop.iobdg.c2i_packet [`UCB_THR_HI:`UCB_THR_LO],
                            cmp_top.iop.iobdg.c2i_packet [`UCB_ADDR_LO+37:`UCB_ADDR_LO+3]
                           } ;
`else
assign iob_vis_port_0000 = {
                            cmp_top.iop.iobdg.c2i.c2i_sctrl.ucb_buf_acpt,
                            ttype,
                            cmp_top.iop.iobdg.c2i.c2i_sdp.c2i_packet [`UCB_THR_HI:`UCB_THR_LO],
                            cmp_top.iop.iobdg.c2i.c2i_sdp.c2i_packet [`UCB_ADDR_LO+37:`UCB_ADDR_LO+3]
                           } ;
`endif

//`ifdef GATE_SIM_IOBDG
//assign iob_vis_port_0000 = {
//                            cmp_top.iop.iobdg.c2i_packet_vld,
//                            ttype,
//                            cmp_top.iop.iobdg.c2i_packet [`UCB_THR_HI:`UCB_THR_LO],
//                            cmp_top.iop.iobdg.c2i_packet [`UCB_ADDR_LO+37:`UCB_ADDR_LO+3]
//                           } ;
//`else
//assign iob_vis_port_0000 = {
//                            cmp_top.iop.iobdg.c2i.c2i_sctrl.c2i_packet_vld,
//                            ttype,
//                            cmp_top.iop.iobdg.c2i.c2i_sdp.c2i_packet [`UCB_THR_HI:`UCB_THR_LO],
//                            cmp_top.iop.iobdg.c2i.c2i_sdp.c2i_packet [`UCB_ADDR_LO+37:`UCB_ADDR_LO+3]
//                           } ;
//`endif





// 
wire    io_trigin ;
wire    io_trigin_pulse;
reg     io_trigin_d1;
reg     io_trigin_d2;
reg     io_trigin_d3;

`ifdef GATE_SIM_IOBDG
`else
assign io_trigin = cmp_top.iop.iobdg.io_trigin ;
`endif

always @(posedge cmp_top.iop.iobdg.jbus_rclk)  begin
  io_trigin_d1 <= io_trigin ;
  io_trigin_d2 <= io_trigin_d1 ;
  io_trigin_d3 <= io_trigin_d2 ;
end

assign io_trigin_pulse = io_trigin_d2 & ~io_trigin_d3 ? 1 : 0;
assign l2_armin = db_enet_control_cfg[5] & io_trigin_pulse ? 1 : 0;


////////////////////////////////////////////////////////////////////////////////
// watch the pcx bus for config cycles
////////////////////////////////////////////////////////////////////////////////

`ifdef GATE_SIM_SCTAG
  assign pcx_sctag0_data_rdy_px2 = cmp_top.iop.sctag0.iqctl.ff_pcx_sctag_data_rdy_px2_q_tmp ;
  assign pcx_sctag1_data_rdy_px2 = cmp_top.iop.sctag1.iqctl.ff_pcx_sctag_data_rdy_px2_q_tmp ;
  assign pcx_sctag2_data_rdy_px2 = cmp_top.iop.sctag2.iqctl.ff_pcx_sctag_data_rdy_px2_q_tmp ;
  assign pcx_sctag3_data_rdy_px2 = cmp_top.iop.sctag3.iqctl.ff_pcx_sctag_data_rdy_px2_q_tmp ;
`else
  assign pcx_sctag0_data_rdy_px2 = cmp_top.iop.sctag0.iqctl.pcx_sctag_data_rdy_px2 ;
  assign pcx_sctag1_data_rdy_px2 = cmp_top.iop.sctag1.iqctl.pcx_sctag_data_rdy_px2 ;
  assign pcx_sctag2_data_rdy_px2 = cmp_top.iop.sctag2.iqctl.pcx_sctag_data_rdy_px2 ;
  assign pcx_sctag3_data_rdy_px2 = cmp_top.iop.sctag3.iqctl.pcx_sctag_data_rdy_px2 ;
`endif

always @(posedge cmp_top.iop.iobdg.cmp_rclk)  begin

  if ((cmp_top.iop.pcx_iob_data_rdy_px2) &&
      (cmp_top.iop.pcx_iob_data_px2 [`PCX_VLD]) &&
      (cmp_top.iop.pcx_iob_data_px2 [`PCX_RQ_HI:`PCX_RQ_LO] == `STORE_RQ)
     ) begin

    case (cmp_top.iop.pcx_iob_data_px2 [`PCX_AD_HI:`PCX_AD_LO])
      40'h98_0000_1000 : iob_vis_select_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
      40'h98_0000_1800 : l2_vis_control_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
      40'h98_0000_1820 : l2_vis_mask_a_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
      40'h98_0000_1828 : l2_vis_mask_b_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
      40'h98_0000_1830 : l2_vis_compare_a_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
      40'h98_0000_1838 : l2_vis_compare_b_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
      40'h98_0000_1840 : l2_trig_delay_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
      40'h98_0000_2000 : db_enet_control_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
      40'h98_0000_2008 : db_enet_idleval_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
      40'hA9_0000_0000 : l2c0_control_reg_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
      40'hA9_0000_0040 : l2c1_control_reg_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
      40'hA9_0000_0080 : l2c2_control_reg_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
      40'hA9_0000_00c0 : l2c3_control_reg_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
      40'h98_0000_2100 : db_jbus_control_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
      40'h98_0000_2140 : db_jbus_mask_a_hi_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
      40'h98_0000_2148 : db_jbus_compare_a_hi_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
      40'h98_0000_2150 : db_jbus_count_a_hi_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
      40'h98_0000_2160 : db_jbus_mask_b_hi_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
      40'h98_0000_2168 : db_jbus_compare_b_hi_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
      40'h98_0000_2170 : db_jbus_count_b_hi_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
      40'h98_0000_2180 : db_jbus_mask_a_lo_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
      40'h98_0000_2188 : db_jbus_compare_a_lo_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
      40'h98_0000_2190 : db_jbus_count_a_lo_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
      40'h98_0000_21a0 : db_jbus_mask_b_lo_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
      40'h98_0000_21a8 : db_jbus_compare_b_lo_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
      40'h98_0000_21b0 : db_jbus_count_b_lo_cfg = cmp_top.iop.pcx_iob_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
    endcase // case

  end // if
      
  if ((pcx_sctag0_data_rdy_px2) &&
      (cmp_top.iop.sctag0.pcx_sctag_data_px2 [`PCX_VLD]) &&
      (cmp_top.iop.sctag0.pcx_sctag_data_px2 [`PCX_RQ_HI:`PCX_RQ_LO] == `STORE_RQ) &&
      (cmp_top.iop.sctag0.pcx_sctag_data_px2 [`PCX_AD_HI:`PCX_AD_LO] == 40'ha9_0000_0000)
     ) begin
      l2c0_control_reg_cfg = cmp_top.iop.sctag0.pcx_sctag_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
  end // if

  if ((pcx_sctag1_data_rdy_px2) &&
      (cmp_top.iop.sctag1.pcx_sctag_data_px2 [`PCX_VLD]) &&
      (cmp_top.iop.sctag1.pcx_sctag_data_px2 [`PCX_RQ_HI:`PCX_RQ_LO] == `STORE_RQ) &&
      (cmp_top.iop.sctag1.pcx_sctag_data_px2 [`PCX_AD_HI:`PCX_AD_LO] == 40'ha9_0000_0040)
     ) begin
      l2c1_control_reg_cfg = cmp_top.iop.sctag1.pcx_sctag_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
  end // if

  if ((pcx_sctag2_data_rdy_px2) &&
      (cmp_top.iop.sctag2.pcx_sctag_data_px2 [`PCX_VLD]) &&
      (cmp_top.iop.sctag2.pcx_sctag_data_px2 [`PCX_RQ_HI:`PCX_RQ_LO] == `STORE_RQ) &&
      (cmp_top.iop.sctag2.pcx_sctag_data_px2 [`PCX_AD_HI:`PCX_AD_LO] == 40'ha9_0000_0080)
     ) begin
      l2c2_control_reg_cfg = cmp_top.iop.sctag2.pcx_sctag_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
  end // if

  if ((pcx_sctag3_data_rdy_px2) &&
      (cmp_top.iop.sctag3.pcx_sctag_data_px2 [`PCX_VLD]) &&
      (cmp_top.iop.sctag3.pcx_sctag_data_px2 [`PCX_RQ_HI:`PCX_RQ_LO] == `STORE_RQ) &&
      (cmp_top.iop.sctag3.pcx_sctag_data_px2 [`PCX_AD_HI:`PCX_AD_LO] == 40'ha9_0000_00c0)
     ) begin
      l2c3_control_reg_cfg = cmp_top.iop.sctag3.pcx_sctag_data_px2 [`PCX_DA_HI:`PCX_DA_LO] ;
  end // if
end

////////////////////////////////////////////////////////////////////////////////
// l2 visibility ports
////////////////////////////////////////////////////////////////////////////////

// watch the l2c buses for valid cycles

initial begin
  l2_dbgbus_01_d1<= 40'h0000000000 ;
  l2_dbgbus_23_d1<= 40'h0000000000 ;
  l2_dbgbus_01_d2<= 40'h0000000000 ;
  l2_dbgbus_23_d2<= 40'h0000000000 ;
end

always @(posedge cmp_top.iop.iobdg.cmp_rclk) begin
  l2_dbgbus_01_d1 <= cmp_top.iop.l2_dbgbus_01 ;
  l2_dbgbus_23_d1 <= cmp_top.iop.l2_dbgbus_23 ;
  l2_dbgbus_01_d2 <= l2_dbgbus_01_d1 ; 
  l2_dbgbus_23_d2 <= l2_dbgbus_23_d1 ; 
end

assign l2_dbgbus = l2c0_control_reg_cfg [20] | l2c1_control_reg_cfg [20] ? l2_dbgbus_01_d2 :
                   l2c2_control_reg_cfg [20] | l2c3_control_reg_cfg [20] ? l2_dbgbus_23_d2 :
                   40'hXXXXXXXXXX ;

assign l2_dbgbus_rdy = l2c0_control_reg_cfg [20] | l2c1_control_reg_cfg [20] ? l2_dbgbus_01_d2 [39] :
                       l2c2_control_reg_cfg [20] | l2c3_control_reg_cfg [20] ? l2_dbgbus_23_d2 [39] :
                       1'bX ;

assign l2_bus = {
                  l2q_timestamp [7:0],
                  l2_dbgbus [38:35],
                  l2q_drop,
                  l2_dbgbus [34:0]
                } ;

assign l2_mask_a = 
                 l2_dbgbus [38:0]
                 &
                 {
                   l2_vis_mask_a_cfg [51:48],   // 4
                   l2_vis_mask_a_cfg [44:40],   // 5
                   l2_vis_mask_a_cfg [33:8],    // 26
                   l2_vis_mask_a_cfg [5:2]      // 5
                 } ;

assign l2_mask_b = 
                 l2_dbgbus [38:0]
                 &
                 {
                   l2_vis_mask_b_cfg [51:48],   // 4
                   l2_vis_mask_b_cfg [44:40],   // 5
                   l2_vis_mask_b_cfg [33:8],    // 26
                   l2_vis_mask_b_cfg [5:2]      // 5
                 } ;

assign l2q_wr_a   = (l2_vis_control_cfg [3] &&
                   l2_dbgbus_rdy &&
                   (l2_mask_a === {
                                  l2_vis_compare_a_cfg [51:48],
                                  l2_vis_compare_a_cfg [44:40],
                                  l2_vis_compare_a_cfg [33:8],
                                  l2_vis_compare_a_cfg [5:2]
                                 })
                  ) ? 1 : 0 ;

assign l2q_wr_b   = (l2_vis_control_cfg [3] &&
                   l2_dbgbus_rdy &&
                   (l2_mask_b === {
                                  l2_vis_compare_b_cfg [51:48],
                                  l2_vis_compare_b_cfg [44:40],
                                  l2_vis_compare_b_cfg [33:8],
                                  l2_vis_compare_b_cfg [5:2]
                                 })
                  ) ? 1 : 0 ;

assign l2q_wr    = l2q_wr_a || l2q_wr_b;


// l2 queue

initial begin
  l2q_rd_ptr = 6'b000000 ;
  l2q_rd_ptr_d1 = 6'b000000 ;
  l2q_wr_ptr = 6'b000000 ;
  l2q_rd_ptr_cmp = 6'b000000 ;
  l2q_wr_ptr_jbus = 6'b000000 ;
  l2q_drop = 1'b0 ;
end

assign l2q_wr_ptr_ns = l2q_wr_ptr + 1 ;
assign l2q_full  = ((l2q_rd_ptr_cmp [4:0] == l2q_wr_ptr_ns [4:0]) && (l2q_rd_ptr_cmp [5] != l2q_wr_ptr_ns [5])) ? 1'b1 : 1'b0 ;

always @(posedge cmp_top.iop.iobdg.cmp_rclk) begin
  if (l2q_wr) begin
    l2q [l2q_wr_ptr[4:0]] <= l2_bus ;
  end

  if (l2q_wr && ~l2q_full) begin
    l2q_wr_ptr <= l2q_wr_ptr_ns ;
    l2q_drop <= 1'b0 ;
  end

  if (l2q_wr && l2q_full) begin
    l2q_drop <= 1'b1 ;
  end

  if (cmp_top.iop.iobdg.rx_sync) begin
    l2q_rd_ptr_cmp <= l2q_rd_ptr_d1 ;
  end

  if (cmp_top.iop.iobdg.tx_sync) begin
    l2q_wr_ptr_jbus <= l2q_wr_ptr ;
  end

end

assign l2q_rd_ptr_ns = l2q_rd_ptr + 1 ;
assign l2q_empty = (l2q_rd_ptr == l2q_wr_ptr_jbus_d1) ? 1'b1 : 1'b0 ;
assign l2q_rd = ~l2q_empty ;
integer i;

initial
  begin
    for(i=0; i< 32; i=i+1)
    begin
     l2q[i] = 48'hffffffffffff;
    end
  end


always @(posedge cmp_top.iop.iobdg.jbus_rclk) begin
  if (l2q_rd) begin
    l2q_rd_ptr <= l2q_rd_ptr_ns ;
  end

  l2q_rd_ptr_d1 <= l2q_rd_ptr ;

  l2q_data_vld <= l2q_rd ;
  l2q_data <= l2q [l2q_rd_ptr[4:0]] ;

  l2q_wr_ptr_jbus_d1 <= l2q_wr_ptr_jbus ;
end

assign l2q_timestamp_ns = (cmp_top.iop.iobdg.rst_l == 1'b0) ? 8'h00 : (l2q_timestamp + 1) ;

always @(posedge cmp_top.iop.iobdg.cmp_rclk) begin
  l2q_timestamp <= l2q_timestamp_ns ;
end

////////////////////////////////////////////////////////////////////////////////
// trigout
////////////////////////////////////////////////////////////////////////////////

reg dbg_trigout;
reg dbg_trigout_cmpclk;
reg dbg_trigout_jbusclk;

initial begin
  l2_trig_delay_cnt_ps = 8'h00 ;
  dbg_trigout_ps = 1'b0 ;
  dbg_trigout_pin = 1'b0 ;
  dbg_trigout = 1'b0 ;
  dbg_trigout_cmpclk = 1'b0 ;
  dbg_trigout_jbusclk = 1'b0 ;
end

assign l2_trig_delay_cnt_ns = (l2q_wr_b && l2_vis_control_cfg [2]) ? l2_trig_delay_cfg [31:0] :
                              ((l2_trig_delay_cnt_ps !== 8'h00) &&  l2_vis_control_cfg [2]) ?  l2_trig_delay_cnt_ps - 1 :
                              8'h00 ;

always @(posedge cmp_top.iop.iobdg.cmp_rclk) begin
  l2_trig_delay_cnt_ps <= l2_trig_delay_cnt_ns ;
end

assign dbg_trigout_ns = ((l2_trig_delay_cnt_ps === 8'h01) && (l2_trig_delay_cnt_ns === 8'h00)) ? 1'b1 :
                        1'b0 ;

always @(posedge cmp_top.iop.iobdg.cmp_rclk) begin
  dbg_trigout_ps <= dbg_trigout_ns ;
end

always @(posedge cmp_top.iop.iobdg.cmp_rclk) begin
  if(dbg_trigout_ns) begin
    dbg_trigout <= 1'b1 ;
  end
  else if(cmp_top.iop.iobdg.tx_sync) begin
    dbg_trigout <= 1'b0 ;
  end
end

always @(posedge cmp_top.iop.iobdg.cmp_rclk) begin
  if(cmp_top.iop.iobdg.tx_sync) begin
    dbg_trigout_cmpclk <= dbg_trigout ;
  end 
end

always @(posedge cmp_top.iop.iobdg.jbus_rclk) begin
    dbg_trigout_jbusclk <= dbg_trigout_cmpclk ;
    dbg_trigout_pin     <= dbg_trigout_jbusclk ;
end


////////////////////////////////////////////////////////////////////////////////
// debug port b
////////////////////////////////////////////////////////////////////////////////

always @(posedge cmp_top.iop.iobdg.jbus_rclk) begin
   dbg_portb_lo_d1 <= dbg_portb_lo ;
   dbg_portb_lo_d2 <= dbg_portb_lo_d1 ;
   dbg_portb_hi_d1 <= dbg_portb_hi ;
   dbg_portb_hi_d2 <= dbg_portb_hi_d1 ;
   dbg_portb_lo_vld_d1 <= dbg_portb_lo_vld ;
   dbg_portb_lo_vld_d2 <= dbg_portb_lo_vld_d1 ;
   dbg_portb_hi_vld_d1 <= dbg_portb_hi_vld ;
   dbg_portb_hi_vld_d2 <= dbg_portb_hi_vld_d1 ;
end

wire        dbg_portb_lo_vo_a;
wire        dbg_portb_lo_vo_b;
reg  [7:0]  dbg_portb_lo_count_a;
reg  [7:0]  dbg_portb_lo_count_b;
wire        dbg_portb_lo_hit_a;
wire        dbg_portb_lo_hit_b;

initial
begin
 dbg_portb_lo_count_a = 8'h00;
 dbg_portb_lo_count_b = 8'h00;
end

assign      dbg_portb_lo_vo_a    = db_jbus_count_a_lo_cfg[8];
assign      dbg_portb_lo_vo_b    = db_jbus_count_b_lo_cfg[8];

//assign      dbg_portb_lo_hit_a = (db_jbus_mask_a_lo_cfg [45] &
//                            ((~db_jbus_mask_a_lo_cfg [44]) & (dbg_portb_mask_a_lo [43:0] === db_jbus_compare_a_lo_cfg  [43:0])) |
//                            (( db_jbus_mask_a_lo_cfg [44]) & (dbg_portb_mask_a_lo [43:0] !== db_jbus_compare_a_lo_cfg  [43:0]))
//                          ) ? 1'b1 : 1'b0 ;
//
//assign      dbg_portb_lo_hit_b = (db_jbus_mask_b_lo_cfg [45] &
//                            ((~db_jbus_mask_b_lo_cfg [44]) & (dbg_portb_mask_b_lo [43:0] === db_jbus_compare_b_lo_cfg  [43:0])) |
//                            (( db_jbus_mask_b_lo_cfg [44]) & (dbg_portb_mask_b_lo [43:0] !== db_jbus_compare_b_lo_cfg  [43:0]))
//                          ) ? 1'b1 : 1'b0 ;
assign      dbg_portb_lo_hit_a = (db_jbus_mask_a_lo_cfg [45] &
                            ((~db_jbus_mask_a_lo_cfg [44]) & (dbg_portb_mask_a_lo [43:0] == db_jbus_compare_a_lo_cfg  [43:0])) |
                            (( db_jbus_mask_a_lo_cfg [44]) & (dbg_portb_mask_a_lo [43:0] != db_jbus_compare_a_lo_cfg  [43:0]))
                          ) ;

assign      dbg_portb_lo_hit_b = (db_jbus_mask_b_lo_cfg [45] &
                            ((~db_jbus_mask_b_lo_cfg [44]) & (dbg_portb_mask_b_lo [43:0] == db_jbus_compare_b_lo_cfg  [43:0])) |
                            (( db_jbus_mask_b_lo_cfg [44]) & (dbg_portb_mask_b_lo [43:0] != db_jbus_compare_b_lo_cfg  [43:0]))
                          ) ;

always @(posedge cmp_top.iop.iobdg.jbus_rclk) begin
   if(dbg_portb_lo_hit_a) begin
      dbg_portb_lo_count_a = db_jbus_count_a_lo_cfg[7:0]; 
   end 
   else if(dbg_portb_lo_count_a != 0) begin
      dbg_portb_lo_count_a = dbg_portb_lo_count_a - 1 ;
   end

   if(dbg_portb_lo_hit_b) begin 
      dbg_portb_lo_count_b = db_jbus_count_b_lo_cfg[7:0]; 
   end 
   else if(dbg_portb_lo_count_b != 0) begin
      dbg_portb_lo_count_b = dbg_portb_lo_count_b - 1 ;
   end
end

assign dbg_portb_lo_vld = (db_jbus_control_cfg[16] & (dbg_portb_lo_hit_a || dbg_portb_lo_hit_b || 
                          ((|dbg_portb_lo_count_a) & ((dbg_portb_lo_vld_sel & dbg_portb_lo_vo_a) || ~dbg_portb_lo_vo_a)) ||
                          ((|dbg_portb_lo_count_b) & ((dbg_portb_lo_vld_sel & dbg_portb_lo_vo_b) || ~dbg_portb_lo_vo_b)))) ?1'b1 : 1'b0 ; 



//assign dbg_portb_lo_vld = (db_jbus_mask_a_lo_cfg [45] &
//                            ((~db_jbus_mask_a_lo_cfg [44]) & (dbg_portb_mask_a_lo [43:0] === db_jbus_compare_a_lo_cfg  [43:0])) |
//                            (( db_jbus_mask_a_lo_cfg [44]) & (dbg_portb_mask_a_lo [43:0] !== db_jbus_compare_a_lo_cfg  [43:0]))
//                          ) | 
//                          (db_jbus_mask_b_lo_cfg [45] &
//                            ((~db_jbus_mask_b_lo_cfg [44]) & (dbg_portb_mask_b_lo [43:0] === db_jbus_compare_b_lo_cfg  [43:0])) |
//                            (( db_jbus_mask_b_lo_cfg [44]) & (dbg_portb_mask_b_lo [43:0] !== db_jbus_compare_b_lo_cfg  [43:0]))
//                          ) ? 1'b1 : 1'b0 ;

//assign dbg_portb_mask_a_lo = (db_jbus_control_cfg [2:0] === 3'b100) ? {dbg_portb_lo_sel [43:41], dbg_portb_lo_vld, dbg_portb_lo_sel [39:0]} & db_jbus_mask_a_lo_cfg [43:0] :
//                             dbg_portb_lo_sel & db_jbus_mask_a_lo_cfg [43:0] ;
//
//assign dbg_portb_mask_b_lo = (db_jbus_control_cfg [2:0] === 3'b100) ? {dbg_portb_lo_sel [43:41], dbg_portb_lo_vld, dbg_portb_lo_sel [39:0]} & db_jbus_mask_b_lo_cfg [43:0] :
//                             dbg_portb_lo_sel & db_jbus_mask_a_lo_cfg [43:0] ;
assign dbg_portb_mask_a_lo =  {dbg_portb_lo_sel [43:41], dbg_portb_lo_vld, dbg_portb_lo_sel [39:0]} & db_jbus_mask_a_lo_cfg [43:0] ;
assign dbg_portb_mask_b_lo =  {dbg_portb_lo_sel [43:41], dbg_portb_lo_vld, dbg_portb_lo_sel [39:0]} & db_jbus_mask_b_lo_cfg [43:0] ;


assign dbg_portb_lo_sel = (db_jbus_control_cfg [2:0] === 3'b000) ? dbg_portb_000 :
                          (db_jbus_control_cfg [2:0] === 3'b010) ? dbg_portb_lo_010 :
                          (db_jbus_control_cfg [2:0] === 3'b011) ? dbg_portb_011 :
                          (db_jbus_control_cfg [2:0] === 3'b100) ? dbg_portb_100 :
                          48'hXXXXXXXXXXXX ;

assign dbg_portb_lo_vld_sel = (db_jbus_control_cfg [2:0] === 3'b000) ? dbg_portb_000_vld :
                          (db_jbus_control_cfg [2:0] === 3'b010) ? dbg_portb_lo_010_vld :
                          (db_jbus_control_cfg [2:0] === 3'b011) ? dbg_portb_011_vld :
                          (db_jbus_control_cfg [2:0] === 3'b100) ? dbg_portb_100_vld :
                          48'hXXXXXXXXXXXX ;


//assign dbg_portb_lo = dbg_portb_lo_vld_sel ? dbg_portb_lo_sel : 48'hffffffffffff ;
assign dbg_portb_lo = db_jbus_control_cfg[16] ? dbg_portb_lo_sel : 48'h0 ;


wire        dbg_portb_hi_vo_a;
wire        dbg_portb_hi_vo_b;
reg  [7:0]  dbg_portb_hi_count_a;
reg  [7:0]  dbg_portb_hi_count_b;
wire        dbg_portb_hi_hit_a;
wire        dbg_portb_hi_hit_b;

initial
begin
 dbg_portb_hi_count_a = 8'h00;
 dbg_portb_hi_count_b = 8'h00;
end


assign      dbg_portb_hi_vo_a    = db_jbus_count_a_hi_cfg[8];
assign      dbg_portb_hi_vo_b    = db_jbus_count_b_hi_cfg[8];

//assign      dbg_portb_hi_hit_a = (db_jbus_mask_a_hi_cfg [45] &
//                            ((~db_jbus_mask_a_hi_cfg [44]) & (dbg_portb_mask_a_hi [43:0] === db_jbus_compare_a_hi_cfg  [43:0])) |
//                            (( db_jbus_mask_a_hi_cfg [44]) & (dbg_portb_mask_a_hi [43:0] !== db_jbus_compare_a_hi_cfg  [43:0]))
//                          ) ? 1'b1 : 1'b0 ;
//
//assign      dbg_portb_hi_hit_b = (db_jbus_mask_b_hi_cfg [45] &
//                            ((~db_jbus_mask_b_hi_cfg [44]) & (dbg_portb_mask_b_hi [43:0] === db_jbus_compare_b_hi_cfg  [43:0])) |
//                            (( db_jbus_mask_b_hi_cfg [44]) & (dbg_portb_mask_b_hi [43:0] !== db_jbus_compare_b_hi_cfg  [43:0]))
//                          ) ? 1'b1 : 1'b0 ;

assign      dbg_portb_hi_hit_a = (db_jbus_mask_a_hi_cfg [45] &
                            ((~db_jbus_mask_a_hi_cfg [44]) & (dbg_portb_mask_a_hi [43:0] == db_jbus_compare_a_hi_cfg  [43:0])) |
                            (( db_jbus_mask_a_hi_cfg [44]) & (dbg_portb_mask_a_hi [43:0] != db_jbus_compare_a_hi_cfg  [43:0]))
                          ) ;

assign      dbg_portb_hi_hit_b = (db_jbus_mask_b_hi_cfg [45] &
                            ((~db_jbus_mask_b_hi_cfg [44]) & (dbg_portb_mask_b_hi [43:0] == db_jbus_compare_b_hi_cfg  [43:0])) |
                            (( db_jbus_mask_b_hi_cfg [44]) & (dbg_portb_mask_b_hi [43:0] != db_jbus_compare_b_hi_cfg  [43:0]))
                          ) ;
always @(posedge cmp_top.iop.iobdg.jbus_rclk) begin
   if(dbg_portb_hi_hit_a) begin
      dbg_portb_hi_count_a = db_jbus_count_a_hi_cfg[7:0];
   end
   else if(dbg_portb_hi_count_a != 0) begin
      dbg_portb_hi_count_a = dbg_portb_hi_count_a - 1 ;
   end

   if(dbg_portb_hi_hit_b) begin
      dbg_portb_hi_count_b = db_jbus_count_b_hi_cfg[7:0];
   end
   else if(dbg_portb_hi_count_b != 0) begin
      dbg_portb_hi_count_b = dbg_portb_hi_count_b - 1 ;
   end
end

assign dbg_portb_hi_vld = (db_jbus_control_cfg[16] & (dbg_portb_hi_hit_a | dbg_portb_hi_hit_b ||
                          ((|dbg_portb_hi_count_a) & ((dbg_portb_hi_vld_sel & dbg_portb_hi_vo_a) || ~dbg_portb_hi_vo_a)) ||
                          ((|dbg_portb_hi_count_b) & ((dbg_portb_hi_vld_sel & dbg_portb_hi_vo_b) || ~dbg_portb_hi_vo_b)))) ? 1'b1 : 1'b0 ;


//assign dbg_portb_hi_vld = (db_jbus_mask_a_hi_cfg [45] &
//                            ((~db_jbus_mask_a_hi_cfg [44]) & (dbg_portb_mask_a_hi [43:0] === db_jbus_compare_a_hi_cfg  [43:0])) |
//                            (( db_jbus_mask_a_hi_cfg [44]) & (dbg_portb_mask_a_hi [43:0] !== db_jbus_compare_a_hi_cfg  [43:0]))
//                          ) | 
//                          (db_jbus_mask_b_hi_cfg [45] &
//                            ((~db_jbus_mask_b_hi_cfg [44]) & (dbg_portb_mask_b_hi [43:0] === db_jbus_compare_b_hi_cfg  [43:0])) |
//                            (( db_jbus_mask_b_hi_cfg [44]) & (dbg_portb_mask_b_hi [43:0] !== db_jbus_compare_b_hi_cfg  [43:0]))
//                          ) ? 1'b1 : 1'b0 ;

//assign dbg_portb_mask_a_hi = (db_jbus_control_cfg [6:4] === 3'b100) ? {dbg_portb_hi_sel [43:41], dbg_portb_hi_vld, dbg_portb_hi_sel [39:0]} & db_jbus_mask_a_hi_cfg [43:0] :
//                             dbg_portb_hi_sel & db_jbus_mask_a_hi_cfg [43:0] ;
//
//assign dbg_portb_mask_b_hi = (db_jbus_control_cfg [6:4] === 3'b100) ? {dbg_portb_hi_sel [43:41], dbg_portb_hi_vld, dbg_portb_hi_sel [39:0]} & db_jbus_mask_b_hi_cfg [43:0] :
//                             dbg_portb_hi_sel & db_jbus_mask_b_hi_cfg [43:0] ;

assign dbg_portb_mask_a_hi =  {dbg_portb_hi_sel [43:41], dbg_portb_hi_vld, dbg_portb_hi_sel [39:0]} & db_jbus_mask_a_hi_cfg [43:0] ;
assign dbg_portb_mask_b_hi =  {dbg_portb_hi_sel [43:41], dbg_portb_hi_vld, dbg_portb_hi_sel [39:0]} & db_jbus_mask_b_hi_cfg [43:0] ;


assign dbg_portb_hi_sel = (db_jbus_control_cfg [6:4] === 3'b000) ? dbg_portb_000 :
                          (db_jbus_control_cfg [6:4] === 3'b010) ? dbg_portb_hi_010 :
                          (db_jbus_control_cfg [6:4] === 3'b011) ? dbg_portb_011 :
                          (db_jbus_control_cfg [6:4] === 3'b100) ? dbg_portb_100 :
                          48'hXXXXXXXXXXXX ;

assign dbg_portb_hi_vld_sel = (db_jbus_control_cfg [6:4] === 3'b000) ? dbg_portb_000_vld :
                          (db_jbus_control_cfg [6:4] === 3'b010) ? dbg_portb_hi_010_vld :
                          (db_jbus_control_cfg [6:4] === 3'b011) ? dbg_portb_011_vld :
                          (db_jbus_control_cfg [6:4] === 3'b100) ? dbg_portb_100_vld :
                          48'hXXXXXXXXXXXX ;

//assign dbg_portb_hi = dbg_portb_hi_vld_sel ? dbg_portb_hi_sel : 48'hffffffffffff ;
assign dbg_portb_hi = db_jbus_control_cfg[16] ? dbg_portb_hi_sel : 48'h0 ;

assign dbg_portb_100_vld = 1'b1 ;

assign dbg_portb_100 = {4'b0000,
                        iob_vis_port [43:0]} ;

assign dbg_portb_011_vld = (iob_vis_port [43] & (~iob_vis_port [42])) |
                           (iob_vis_port [41] & (~iob_vis_port [40])) |
                           (iob_vis_port [39] & (~iob_vis_port [38])) |
                           (iob_vis_port [37] & (~iob_vis_port [36])) |
                           (iob_vis_port [35] & (~iob_vis_port [34])) |
                           (iob_vis_port [33] & (~iob_vis_port [32])) ;

assign dbg_portb_011 = {4'b0000,
                        (~iob_vis_port_d [43]) & iob_vis_port [43],
                        (~iob_vis_port_d [41]) & iob_vis_port [41],
                        iob_vis_port [43] & (~iob_vis_port [42]),
                        iob_vis_port [41] & (~iob_vis_port [40]),
                        (~iob_vis_port_d [39]) & iob_vis_port [39],
                        (~iob_vis_port_d [37]) & iob_vis_port [37],
                        (~iob_vis_port_d [35]) & iob_vis_port [35],
                        (~iob_vis_port_d [33]) & iob_vis_port [33],
                        iob_vis_port [39] & (~iob_vis_port [38]),
                        iob_vis_port [37] & (~iob_vis_port [36]),
                        iob_vis_port [35] & (~iob_vis_port [34]),
                        iob_vis_port [33] & (~iob_vis_port [32]),
                        iob_vis_port [31:0]} ;


assign dbg_portb_hi_010_vld = (iob_vis_port [43] & (~iob_vis_port [42])) |
                              (iob_vis_port [41] & (~iob_vis_port [40])) ;

assign dbg_portb_hi_010 = {4'b0000,
                        (~iob_vis_port_d [43]) & iob_vis_port [43],
                        (~iob_vis_port_d [41]) & iob_vis_port [41],
                        iob_vis_port [43] & (~iob_vis_port [42]),
                        iob_vis_port [41] & (~iob_vis_port [40]),
                        iob_vis_port [39:0]} ;

//assign dbg_portb_lo_010_vld = (iob_vis_port_0001 [43] & (~iob_vis_port_0001 [42])) |
//                              (iob_vis_port_0001 [41] & (~iob_vis_port_0001 [40])) ;
assign dbg_portb_lo_010_vld = (iob_vis_port [43] & (~iob_vis_port [42])) |
                              (iob_vis_port [41] & (~iob_vis_port [40])) ;

assign dbg_portb_lo_010 = {4'b0000,
                           (~iob_vis_port_d [43]) & iob_vis_port [43],
                           (~iob_vis_port_d [41]) & iob_vis_port [41],
                           iob_vis_port [43] & (~iob_vis_port [42]),
                           iob_vis_port [41] & (~iob_vis_port [40]),
                           iob_vis_port_0001 [39:0]};

assign dbg_portb_000_vld = l2q_data_vld ;

assign dbg_portb_000 = l2q_data [47:0];

endmodule
