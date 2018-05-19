// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_ifu_sscan.v
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

// trin (10/11/14):
// I'm rewriting this so data doesn't have to be shifted out
//  bit by bit

// module sparc_ifu_sscan( ctu_sscan_snap, ctu_sscan_se, lsu_sscan_test_data, 
// tlu_sscan_test_data, swl_sscan_thrstate, ifq_sscan_test_data, sparc_sscan_so, rclk, si, so, se);

// input ctu_sscan_snap;
// // input ctu_sscan_se;
// // input ctu_tck;
// // input si;
// // input se;
// input [10:0] swl_sscan_thrstate;
// input [3:0] ifq_sscan_test_data;
// input [15:0] lsu_sscan_test_data;
// input [62:0] tlu_sscan_test_data;
// input rclk;

// // output sparc_sscan_so;
// // output so;
// output 

//////////////////////////////////////////////////////////////////

// wire snap_f;
// wire [93:0] snap_data, snap_data_f, snap_data_ff;

// `ifdef CONNECT_SHADOW_SCAN
// wire [92:0] sscan_shift_data;
// `endif

////////

// dff_s #(1) snap_inst0(.q(snap_f), .din(ctu_sscan_snap), .clk(rclk), .se(se), .si(), .so());

// assign snap_data = {ifq_sscan_test_data, tlu_sscan_test_data, lsu_sscan_test_data, swl_sscan_thrstate};

// dffe_s #(94) snap_inst1(.q(snap_data_f), .din(snap_data), .clk(rclk), .en(snap_f), .se(se), .si(), .so());

// `ifdef CONNECT_SHADOW_SCAN
// dff_sscan #(94) snap_inst2(.q(snap_data_ff), .din(snap_data_f), .clk(ctu_tck), .se(ctu_sscan_se), 
// 		     .si({sscan_shift_data, 1'b0}),
// 		     .so({sparc_sscan_so, sscan_shift_data}));
// `else
// dff_s #(94) snap_inst2(.q(snap_data_ff), .din(snap_data_f), .clk(ctu_tck), .se(ctu_sscan_se), 
// 		     .si(), .so());

// assign sparc_sscan_so = 1'b0;
// `endif

// sink #(94) s0(.in (snap_data_ff));

module sparc_ifu_sscan(
    input wire [10:0] swl_sscan_thrstate,
    input wire [3:0] ifq_sscan_test_data,
    input wire [15:0] lsu_sscan_test_data,
    input wire [62:0] tlu_sscan_test_data,
    input wire rclk,

    // jtag debug
    output reg [`CORE_JTAG_BUS_WIDTH-1:0] core_rtap_data,
    input wire rtap_core_val,
    input wire [1:0] rtap_core_threadid,
    input wire [`JTAG_CORE_ID_WIDTH-1:0]  rtap_core_id,
    input wire [`CORE_JTAG_BUS_WIDTH-1:0] rtap_core_data
    // output reg [93:0] sparc_sscan
    );

reg [93:0] snap_data;
reg [93:0] snap_data_next;
reg rtap_sscan_snap;
reg rtap_sscan_snap_f;

always @ (posedge rclk)
begin
    snap_data <= snap_data_next;
    rtap_sscan_snap_f <= rtap_sscan_snap;
end

always @ *
begin
    rtap_sscan_snap = 0;
    if (rtap_core_val && rtap_core_id == `JTAG_CORE_ID_IFU_SSCAN)
        rtap_sscan_snap = 1'b1;

    if (rtap_sscan_snap)
        snap_data_next = {ifq_sscan_test_data, tlu_sscan_test_data, lsu_sscan_test_data, swl_sscan_thrstate};
    else
        snap_data_next = snap_data;

    core_rtap_data = 0;
    if (rtap_sscan_snap_f)
        core_rtap_data = snap_data;
end

endmodule     
