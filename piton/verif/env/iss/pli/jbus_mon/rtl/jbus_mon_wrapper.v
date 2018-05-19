// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: jbus_mon_wrapper.v
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
//////////////////////////////////////////////////////////////////////////////
//
//  Description:        hooks PLI monitor into simulation top level jbus signals
//  Top level Module:   jbus_monitor
//  Where Instantiated: sys.v
//
//////////////////////////////////////////////////////////////////////////////

`ifdef JBI_SAT
  `define SYS                 jbus_top
`else
  `define SYS                 cmp_top
`endif

module jbus_monitor(
        jbus_j_ad,
        jbus_j_req_out_l_0,
        jbus_j_req_out_l_1,
        jbus_j_req_out_l_2,
        jbus_j_req_out_l_3,
        jbus_j_req_out_l_4,
        jbus_j_req_out_l_5,
        jbus_j_req_out_l_6,
        jbus_j_adp,
        jbus_j_adtype,
        jbus_j_pack0,
        jbus_j_pack1,
        jbus_j_pack2,
        jbus_j_pack3,
        jbus_j_pack4,
        jbus_j_pack5,
        jbus_j_pack6,
        jbus_j_par,
        jbus_j_rst,
        jbus_j_por,
        jbus_j_clk,
        jbus_j_err,
        jbus_j_change_l,
        local_ports
);

input [5:0] jbus_j_req_out_l_0;
input [5:0] jbus_j_req_out_l_1;
input [5:0] jbus_j_req_out_l_2;
input [5:0] jbus_j_req_out_l_3;
input [5:0] jbus_j_req_out_l_4;
input [5:0] jbus_j_req_out_l_5;
input [5:0] jbus_j_req_out_l_6;
inout [127:0] jbus_j_ad;
inout [7:0] jbus_j_adtype;
inout [3:0] jbus_j_adp;
input [2:0] jbus_j_pack0;
input [2:0] jbus_j_pack1;
input [2:0] jbus_j_pack2;
input [2:0] jbus_j_pack3;
input [2:0] jbus_j_pack4;
input [2:0] jbus_j_pack5;
input [2:0] jbus_j_pack6;
input jbus_j_par;
input jbus_j_rst;
input jbus_j_por;
input jbus_j_clk;
input [6:0] local_ports;
input [6:0] jbus_j_err;
input jbus_j_change_l;

reg [5:0] j_req_out_l_0;
reg [5:0] j_req_out_l_1;
reg [5:0] j_req_out_l_2;
reg [5:0] j_req_out_l_3;
reg [5:0] j_req_out_l_4;
reg [5:0] j_req_out_l_5;
reg [5:0] j_req_out_l_6;
reg [6:0] j_err;
reg j_change_l;
reg [127:0] j_ad;
reg [7:0] j_adtype;
reg [3:0] j_adp;
reg [2:0] j_pack0;
reg [2:0] j_pack1;
reg [2:0] j_pack2;
reg [2:0] j_pack3;
reg [2:0] j_pack4;
reg [2:0] j_pack5;
reg [2:0] j_pack6;
reg j_par;
reg j_rst;
reg j_clk;
reg j_por;
reg [127:0] transaction_name;
wire [127:0] jbus_transaction;
reg bus_is_idle;
reg uncompleted_accesses;

`ifdef NO_JBUS_MON
`else
initial begin
  j_rst = 1'b0;
  $new_jbus_mon_cycle(
         j_ad, j_adtype, j_adp,
         j_req_out_l_0, j_req_out_l_1, j_req_out_l_2,
         j_req_out_l_3, j_req_out_l_4, j_req_out_l_5,
         j_req_out_l_6,
         j_pack0, j_pack1, j_pack2,
         j_pack3, j_pack4, j_pack5, j_pack6, j_par, j_rst, j_por, local_ports, j_err, j_change_l);
  $new_jbus_check_cycle(
         j_ad, j_adtype, j_adp,
         j_req_out_l_0, j_req_out_l_1, j_req_out_l_2,
         j_req_out_l_3, j_req_out_l_4, j_req_out_l_5,
         j_req_out_l_6,
         j_pack0, j_pack1, j_pack2,
         j_pack3, j_pack4, j_pack5, j_pack6, j_par, j_rst, j_por, local_ports, j_err, j_change_l);
end

always @(posedge jbus_j_clk) begin
  //$display("%b %h %h %b", jbus_j_req, jbus_j_ad[127:64], jbus_j_ad[63:0], jbus_j_adtype);

  $new_jbus_mon_cycle(
         jbus_j_ad, jbus_j_adtype, jbus_j_adp,
         jbus_j_req_out_l_0, jbus_j_req_out_l_1, jbus_j_req_out_l_2,
         jbus_j_req_out_l_3, jbus_j_req_out_l_4, jbus_j_req_out_l_5,
         jbus_j_req_out_l_6,
         jbus_j_pack0, jbus_j_pack1, jbus_j_pack2,
         jbus_j_pack3, jbus_j_pack4, jbus_j_pack5, jbus_j_pack6,
         jbus_j_par, jbus_j_rst, jbus_j_por,
         local_ports, jbus_j_err, jbus_j_change_l);
  $new_jbus_check_cycle(
         jbus_j_ad, jbus_j_adtype, jbus_j_adp,
         jbus_j_req_out_l_0, jbus_j_req_out_l_1, jbus_j_req_out_l_2,
         jbus_j_req_out_l_3, jbus_j_req_out_l_4, jbus_j_req_out_l_5,
         jbus_j_req_out_l_6,
         jbus_j_pack0, jbus_j_pack1, jbus_j_pack2,
         jbus_j_pack3, jbus_j_pack4, jbus_j_pack5, jbus_j_pack6,
         jbus_j_par, jbus_j_rst, jbus_j_por,
         local_ports, jbus_j_err, jbus_j_change_l);
  #1
  $jbus_mon_outputs(bus_is_idle, uncompleted_accesses);
  $jbus_check_outputs(j_ad, j_adtype, j_adp, transaction_name);
end
assign jbus_j_ad = j_ad;
assign jbus_j_adp = j_adp;
assign jbus_j_adtype = j_adtype;
assign jbus_transaction = transaction_name;
`endif
endmodule
