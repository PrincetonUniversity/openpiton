// Copyright (c) 2015 Princeton University
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

//==================================================================================================
//  Filename      : l2_mon.v
//  Created On    : 2014-05-08
//  Last Modified : 2014-05-08
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : Monitors for the L2 cache
//
//
//====================================================================================================




`include "sys.h"
`include "iop.h"
`include "cross_module.h"

module l2_mon (
    input wire clk
);

always @ (posedge clk)
begin
    `ifdef RTL_SPARC0
    if (`L2_TOP0.pipe2.ctrl.mshr_rd_en_S1 && (~`L2_TOP0.pipe2.ctrl.msg_from_mshr_S1) 
    && (`L2_TOP0.pipe2.ctrl.msg_type_S1 != `MSG_TYPE_INV_FWDACK))
    begin
        $display("TILE0-------------------------------------");
        $display($time);
        $display("L2 ERROR: Request into pipe2 cannot find corresponding entry in the MSHR");
        $display("-------------------------------------------");
    end
    `endif

    `ifdef RTL_SPARC1
    if (`L2_TOP1.pipe2.ctrl.mshr_rd_en_S1 && (~`L2_TOP1.pipe2.ctrl.msg_from_mshr_S1) 
    && (`L2_TOP1.pipe2.ctrl.msg_type_S1 != `MSG_TYPE_INV_FWDACK))
    begin
        $display("TILE1-------------------------------------");
        $display($time);
        $display("L2 ERROR: Request into pipe2 cannot find corresponding entry in the MSHR");
        $display("-------------------------------------------");
    `endif
end


always @ (posedge clk)
begin
    `ifdef RTL_SPARC0
    if (`L2_TOP0.pipe1.ctrl.valid_S1 && !`L2_TOP0.pipe1.ctrl.stall_S1)
    begin
        $display("TILE0-------------------------------------");
        $display($time);
        $write("P1S1 msg type: ");
        print_msg_type(`L2_TOP0.pipe1.ctrl.msg_type_trans_S1);
        $display("Data_size: %b, cache_type: %b", `L2_TOP0.pipe1.ctrl.data_size_S1, `L2_TOP0.pipe1.ctrl.cache_type_S1);
        $display("P1S1 valid: stall: %b, stall_pre: %b, stall_hazard: %b, stall_mshr: %b",
                  `L2_TOP0.pipe1.ctrl.stall_S1, `L2_TOP0.pipe1.ctrl.stall_pre_S1, 
                  `L2_TOP0.pipe1.ctrl.stall_hazard_S1, `L2_TOP0.pipe1.ctrl.stall_mshr_S1);
        $display("Control signals: %b", `L2_TOP0.pipe1.ctrl.cs_S1);
        $display("Msg from mshr: %b", `L2_TOP0.pipe1.ctrl.msg_from_mshr_S1);
        $display("P1S1 addr: 0x%h", `L2_TOP0.pipe1.dpath.addr_S1);
        $display("Mshr_addr: 0x%h", `L2_TOP0.pipe1.dpath.mshr_addr_in_S1);
        $display("Tag_addr: 0x%h", `L2_TOP0.pipe1.dpath.tag_addr_S1,);
        $display("State_rd_addr: 0x%h",`L2_TOP0.pipe1.dpath.state_rd_addr_S1);
        $display("src x: %b, src y: %b", `L2_TOP0.pipe1.dpath.src_x_S1, `L2_TOP0.pipe1.dpath.src_y_S1);

    end
    if (`L2_TOP0.pipe1.ctrl.valid_S2 && !`L2_TOP0.pipe1.ctrl.stall_real_S2)
    begin
        $display("TILE0-------------------------------------");
        $display($time);
        $write("P1S2 msg type: ");
        print_msg_type(`L2_TOP0.pipe1.ctrl.msg_type_S2_f);
        $display("Data_size: %b, cache_type: %b", `L2_TOP0.pipe1.ctrl.data_size_S2_f, `L2_TOP0.pipe1.ctrl.cache_type_S2_f);
        $display("P1S2 valid: stall: %b, stall_pre: %b, stall_real: %b, stall_load: %b",
                  `L2_TOP0.pipe1.ctrl.stall_S2, `L2_TOP0.pipe1.ctrl.stall_pre_S2, 
                  `L2_TOP0.pipe1.ctrl.stall_real_S2, `L2_TOP0.pipe1.ctrl.stall_load_S2);
        $display("Control signals: %b", `L2_TOP0.pipe1.ctrl.cs_S2);
        $display("Msg from mshr: %b", `L2_TOP0.pipe1.ctrl.msg_from_mshr_S2);
        $display("P1S2 addr: 0x%h", `L2_TOP0.pipe1.dpath.addr_S2);
        $display("P1S2 valid: l2_way_sel: %b, l2_hit: %b, l2_evict: %b, l2_wb: %b",
                  `L2_TOP0.pipe1.dpath.l2_way_sel_S2, `L2_TOP0.pipe1.dpath.l2_tag_hit_S2, 
                  `L2_TOP0.pipe1.dpath.l2_evict_S2, `L2_TOP0.pipe1.dpath.l2_wb_S2);
        $display("State VD bits: %b %b %b %b", 
                `L2_TOP0.pipe1.dpath.state_way_S2[3][`L2_STATE_VD], `L2_TOP0.pipe1.dpath.state_way_S2[2][`L2_STATE_VD],
                `L2_TOP0.pipe1.dpath.state_way_S2[1][`L2_STATE_VD], `L2_TOP0.pipe1.dpath.state_way_S2[0][`L2_STATE_VD]);
        $display("State: rb: %b, lru: %b, mesi: %b, vd: %b, subline: %b, cache_type: %b, owner: %b",
                 `L2_TOP0.pipe1.dpath.l2_rb_bits_S2, `L2_TOP0.pipe1.dpath.l2_lru_bits_S2,`L2_TOP0.pipe1.dpath.l2_way_state_mesi_S2, 
                 `L2_TOP0.pipe1.dpath.l2_way_state_vd_S2, `L2_TOP0.pipe1.dpath.l2_way_state_subline_S2, 
                 `L2_TOP0.pipe1.dpath.l2_way_state_cache_type_S2, `L2_TOP0.pipe1.dpath.l2_way_state_owner_S2);
        $display("State data: 0x%h", `L2_TOP0.pipe1.dpath.state_data_trans_S2);
        $display("Tag data: 0x%h", `L2_TOP0.pipe1.dpath.tag_data_trans_S2);
        $display("Dir addr: 0x%h", `L2_TOP0.pipe1.dpath.dir_addr_S2);
        $display("Dir data: 0x%h", `L2_TOP0.pipe1.dpath.dir_data_in_S2);
        $display("Dir data mask: 0x%h", `L2_TOP0.pipe1.dpath.dir_data_mask_in_S2);
        $display("Data addr: 0x%h", `L2_TOP0.pipe1.dpath.data_addr_S2);
        $display("Data data: 0x%h", `L2_TOP0.pipe1.dpath.data_data_in_S2);
        $display("Data data mask: 0x%h", `L2_TOP0.pipe1.dpath.data_data_mask_in_S2);
        $display("src x: %b, src y: %b", `L2_TOP0.pipe1.dpath.src_x_S2_f, `L2_TOP0.pipe1.dpath.src_y_S2_f);


    end
    if (`L2_TOP0.pipe1.ctrl.valid_S3 && !`L2_TOP0.pipe1.ctrl.stall_real_S3)
    begin
        $display("TILE0-------------------------------------");
        $display($time);
        $write("P1S3 msg type: ");
        print_msg_type(`L2_TOP0.pipe1.ctrl.msg_type_S3_f);
        $display("Data_size: %b, cache_type: %b", `L2_TOP0.pipe1.ctrl.data_size_S3_f, `L2_TOP0.pipe1.ctrl.cache_type_S3_f);
        $display("P1S3 valid: stall: %b, msg_stall: %b, dir_data_stall: %b",
                  `L2_TOP0.pipe1.ctrl.stall_S3, `L2_TOP0.pipe1.ctrl.msg_stall_S3, `L2_TOP0.pipe1.ctrl.dir_data_stall_S3);
        $display("Control signals: %b", `L2_TOP0.pipe1.ctrl.cs_S3);
        $display("Dir data: 0x%h", `L2_TOP0.pipe1.ctrl.dir_data_S3);
        $display("Mshr state wr enable: %b", `L2_TOP0.pipe1.ctrl.mshr_wr_state_en_S3);
        $display("SMC rd enable: %b", `L2_TOP0.pipe1.ctrl.smc_rd_en_S3);
        $display("SMC miss: %b", `L2_TOP0.pipe1.ctrl.smc_miss_S3);
        $display("State wr enable: %b", `L2_TOP0.pipe1.ctrl.state_wr_en_S3);
        $display("State wr addr: 0x%h", `L2_TOP0.pipe1.dpath.state_wr_addr_S3);
        $display("State wr data: 0x%h", `L2_TOP0.pipe1.dpath.state_data_in_S3);
        $display("State wr data mask: 0x%h", `L2_TOP0.pipe1.dpath.state_data_mask_in_S3);
        $display("Msg send valid: %b, mode: %b, length: %b", `L2_TOP0.pipe1.ctrl.msg_send_valid_S3, 
                  `L2_TOP0.pipe1.ctrl.msg_send_mode_S3,`L2_TOP0.pipe1.ctrl.msg_send_length_S3);
        $write("Msg send type: ");
        print_msg_type(`L2_TOP0.pipe1.ctrl.msg_send_type_S3);
        $display("Msg send data_size: %b, cache_type: %b, mesi: %b, l2_miss: %b, mshrid: %b, subline_vector: %b", 
        `L2_TOP0.pipe1.ctrl.msg_send_data_size_S3, `L2_TOP0.pipe1.ctrl.msg_send_cache_type_S3, 
        `L2_TOP0.pipe1.ctrl.msg_send_mesi_S3, `L2_TOP0.pipe1.ctrl.msg_send_l2_miss_S3, 
        `L2_TOP0.pipe1.ctrl.msg_send_mshrid_S3, `L2_TOP0.pipe1.ctrl.msg_send_subline_vector_S3);
        $display("Msg from mshr: %b", `L2_TOP0.pipe1.ctrl.msg_from_mshr_S3_f);
        $display("P1S3 addr: 0x%h", `L2_TOP0.pipe1.dpath.addr_S3);
        $display("P1S3 valid: l2_hit: %b, l2_evict: %b",
                  `L2_TOP0.pipe1.dpath.l2_tag_hit_S3, `L2_TOP0.pipe1.dpath.l2_evict_S3);
        $display("Data data: 0x%h", `L2_TOP0.pipe1.dpath.data_data_S3);
        $display("State:mesi: %b, vd: %b, subline: %b, cache_type: %b, owner: %b",
                 `L2_TOP0.pipe1.dpath.l2_way_state_mesi_S3, `L2_TOP0.pipe1.dpath.l2_way_state_vd_S3, 
                 `L2_TOP0.pipe1.dpath.l2_way_state_subline_S3, `L2_TOP0.pipe1.dpath.l2_way_state_cache_type_S3, 
                 `L2_TOP0.pipe1.dpath.l2_way_state_owner_S3_f);
        $display("Msg send: addr: 0x%h, dst_x: %b, dst_y: %b, dst_fbits: %b", `L2_TOP0.pipe1.dpath.msg_send_addr_S3, 
                 `L2_TOP0.pipe1.dpath.msg_send_dst_x_S3, `L2_TOP0.pipe1.dpath.msg_send_dst_y_S3, 
                 `L2_TOP0.pipe1.dpath.msg_send_dst_fbits_S3);
        $display("Msg send data: 0x%h", `L2_TOP0.pipe1.dpath.msg_send_data_S3);
        $display("src x: %b, src y: %b", `L2_TOP0.pipe1.dpath.src_x_S3_f, `L2_TOP0.pipe1.dpath.src_y_S3_f);

    end


    if (`L2_TOP0.pipe2.ctrl.valid_S1 && !`L2_TOP0.pipe2.ctrl.stall_S1)
    begin
        $display("TILE0-------------------------------------");
        $display($time);
        $write("P2S1 msg type: ");
        print_msg_type(`L2_TOP0.pipe2.ctrl.msg_type_S1);
        $display("Data_size: %b, cache_type: %b, last_subline: %b", `L2_TOP0.pipe2.ctrl.data_size_S1, 
                `L2_TOP0.pipe2.ctrl.cache_type_S1, `L2_TOP0.pipe2.ctrl.msg_last_subline_S1);
        $display("P2S1 valid: stall: %b, stall_pre: %b, stall_hazard: %b",
                `L2_TOP0.pipe2.ctrl.stall_S1, `L2_TOP0.pipe2.ctrl.stall_pre_S1, `L2_TOP0.pipe2.ctrl.stall_hazard_S1);
        $display("Control signals: %b", `L2_TOP0.pipe2.ctrl.cs_S1);
        $display("Msg from mshr: %b", `L2_TOP0.pipe2.ctrl.msg_from_mshr_S1);
        $display("P2S1 addr: 0x%h", `L2_TOP0.pipe2.dpath.addr_S1);
        $display("Mshr_rd_index: %b", `L2_TOP0.pipe2.dpath.mshr_rd_index_S1);
        $display("Tag_addr: 0x%h", `L2_TOP0.pipe2.dpath.tag_addr_S1,);
        $display("Tag_data_in: 0x%h", `L2_TOP0.pipe2.dpath.tag_data_in_S1,);
        $display("Tag_data_mask_in: 0x%h", `L2_TOP0.pipe2.dpath.tag_data_mask_in_S1,);
        $display("State_rd_addr: 0x%h",`L2_TOP0.pipe2.dpath.state_rd_addr_S1);
        $display("src x: %b, src y: %b", `L2_TOP0.pipe2.dpath.src_x_S1, `L2_TOP0.pipe2.dpath.src_y_S1);

    end


    if (`L2_TOP0.pipe2.ctrl.valid_S2 && !`L2_TOP0.pipe2.ctrl.stall_real_S2)
    begin
        $display("TILE0-------------------------------------");
        $display($time);
        $write("P2S2 msg type: ");
        print_msg_type(`L2_TOP0.pipe2.ctrl.msg_type_S2_f);
        $display("Data_size: %b, cache_type: %b, last_subline: %b", `L2_TOP0.pipe2.ctrl.data_size_S2_f, 
                 `L2_TOP0.pipe2.ctrl.cache_type_S2_f, `L2_TOP0.pipe2.ctrl.msg_last_subline_S2_f);
        $display("P2S2 valid: stall: %b, stall_real: %b, stall_load: %b",
                  `L2_TOP0.pipe2.ctrl.stall_S2, `L2_TOP0.pipe2.ctrl.stall_real_S2, `L2_TOP0.pipe2.ctrl.stall_load_S2);
        $display("Control signals: %b", `L2_TOP0.pipe2.ctrl.cs_S2);
        $display("Msg from mshr: %b", `L2_TOP0.pipe2.ctrl.msg_from_mshr_S2);
        $display("SMC wr enable: %b", `L2_TOP0.pipe2.ctrl.smc_wr_en_S2);
        $display("P2S2 addr: 0x%h", `L2_TOP0.pipe2.dpath.addr_S2);
        $display("P2S2 valid: l2_way_sel: %b, l2_hit: %b, l2_wb: %b",
                  `L2_TOP0.pipe2.dpath.l2_way_sel_S2, `L2_TOP0.pipe2.dpath.l2_tag_hit_S2, `L2_TOP0.pipe2.dpath.l2_wb_S2);
        $display("state: mesi: %b, vd: %b, subline: %b, cache_type: %b, owner: %b",
                 `L2_TOP0.pipe2.dpath.l2_way_state_mesi_S2, `L2_TOP0.pipe2.dpath.l2_way_state_vd_S2, 
                 `L2_TOP0.pipe2.dpath.l2_way_state_subline_S2, `L2_TOP0.pipe2.dpath.l2_way_state_cache_type_S2, 
                 `L2_TOP0.pipe2.dpath.l2_way_state_owner_S2);
        $display("Dir addr: 0x%h", `L2_TOP0.pipe2.dpath.dir_addr_S2);
        $display("Dir data: 0x%h", `L2_TOP0.pipe2.dpath.dir_data_in_S2);
        $display("Dir data mask: 0x%h", `L2_TOP0.pipe2.dpath.dir_data_mask_in_S2);
        $display("Data addr: 0x%h", `L2_TOP0.pipe2.dpath.data_addr_S2);
        $display("Data data: 0x%h", `L2_TOP0.pipe2.dpath.data_data_in_S2);
        $display("Data data mask: 0x%h", `L2_TOP0.pipe2.dpath.data_data_mask_in_S2);
        $display("src x: %b, src y: %b", `L2_TOP0.pipe2.dpath.src_x_S2_f, `L2_TOP0.pipe2.dpath.src_y_S2_f);

    end
    if (`L2_TOP0.pipe2.ctrl.valid_S3 && !`L2_TOP0.pipe2.ctrl.stall_S3)
    begin
        $display("TILE0-------------------------------------");
        $display($time);
        $write("P2S3 msg type: ");
        $display("Mshr wr index: %b", `L2_TOP0.pipe2.dpath.mshr_wr_index_S3);
        $display("Mshr state wr enable: 0x%h", `L2_TOP0.pipe2.ctrl.mshr_wr_state_en_S3);
        $display("State wr enable: 0x%h", `L2_TOP0.pipe2.ctrl.state_wr_en_S3);
        $display("State wr addr: 0x%h", `L2_TOP0.pipe2.dpath.state_wr_addr_S3);
        $display("State wr data: 0x%h", `L2_TOP0.pipe2.dpath.state_data_in_S3);
        $display("State wr data mask: 0x%h", `L2_TOP0.pipe2.dpath.state_data_mask_in_S3);

    end
    `endif



    `ifdef RTL_SPARC1
    if (`L2_TOP1.pipe1.ctrl.valid_S1 && !`L2_TOP1.pipe1.ctrl.stall_S1)
    begin
        $display("TILE1-------------------------------------");
        $display($time);
        $write("P1S1 msg type: ");
        print_msg_type(`L2_TOP1.pipe1.ctrl.msg_type_trans_S1);
        $display("Data_size: %b, cache_type: %b", `L2_TOP1.pipe1.ctrl.data_size_S1, `L2_TOP1.pipe1.ctrl.cache_type_S1);
        $display("P1S1 valid: stall: %b, stall_pre: %b, stall_hazard: %b, stall_mshr: %b",
                  `L2_TOP1.pipe1.ctrl.stall_S1, `L2_TOP1.pipe1.ctrl.stall_pre_S1, 
                  `L2_TOP1.pipe1.ctrl.stall_hazard_S1, `L2_TOP1.pipe1.ctrl.stall_mshr_S1);
        $display("Control signals: %b", `L2_TOP1.pipe1.ctrl.cs_S1);
        $display("Msg from mshr: %b", `L2_TOP1.pipe1.ctrl.msg_from_mshr_S1);
        $display("P1S1 addr: 0x%h", `L2_TOP1.pipe1.dpath.addr_S1);
        $display("Mshr_addr: 0x%h", `L2_TOP1.pipe1.dpath.mshr_addr_in_S1);
        $display("Tag_addr: 0x%h", `L2_TOP1.pipe1.dpath.tag_addr_S1,);
        $display("State_rd_addr: 0x%h",`L2_TOP1.pipe1.dpath.state_rd_addr_S1);
        $display("src x: %b, src y: %b", `L2_TOP1.pipe1.dpath.src_x_S1, `L2_TOP1.pipe1.dpath.src_y_S1);

    end
    if (`L2_TOP1.pipe1.ctrl.valid_S2 && !`L2_TOP1.pipe1.ctrl.stall_real_S2)
    begin
        $display("TILE1-------------------------------------");
        $display($time);
        $write("P1S2 msg type: ");
        print_msg_type(`L2_TOP1.pipe1.ctrl.msg_type_S2_f);
        $display("Data_size: %b, cache_type: %b", `L2_TOP1.pipe1.ctrl.data_size_S2_f, `L2_TOP1.pipe1.ctrl.cache_type_S2_f);
        $display("P1S2 valid: stall: %b, stall_pre: %b, stall_real: %b, stall_load: %b",
                  `L2_TOP1.pipe1.ctrl.stall_S2, `L2_TOP1.pipe1.ctrl.stall_pre_S2, 
                  `L2_TOP1.pipe1.ctrl.stall_real_S2, `L2_TOP1.pipe1.ctrl.stall_load_S2);
        $display("Control signals: %b", `L2_TOP1.pipe1.ctrl.cs_S2);
        $display("Msg from mshr: %b", `L2_TOP1.pipe1.ctrl.msg_from_mshr_S2);
        $display("P1S2 addr: 0x%h", `L2_TOP1.pipe1.dpath.addr_S2);
        $display("P1S2 valid: l2_way_sel: %b, l2_hit: %b, l2_evict: %b, l2_wb: %b",
                  `L2_TOP1.pipe1.dpath.l2_way_sel_S2, `L2_TOP1.pipe1.dpath.l2_tag_hit_S2, 
                  `L2_TOP1.pipe1.dpath.l2_evict_S2, `L2_TOP1.pipe1.dpath.l2_wb_S2);
        $display("State VD bits: %b %b %b %b", 
                `L2_TOP1.pipe1.dpath.state_way_S2[3][`L2_STATE_VD], `L2_TOP1.pipe1.dpath.state_way_S2[2][`L2_STATE_VD],
                `L2_TOP1.pipe1.dpath.state_way_S2[1][`L2_STATE_VD], `L2_TOP1.pipe1.dpath.state_way_S2[0][`L2_STATE_VD]);
        $display("State: rb: %b, lru: %b, mesi: %b, vd: %b, subline: %b, cache_type: %b, owner: %b",
                 `L2_TOP1.pipe1.dpath.l2_rb_bits_S2, `L2_TOP1.pipe1.dpath.l2_lru_bits_S2,`L2_TOP1.pipe1.dpath.l2_way_state_mesi_S2, 
                 `L2_TOP1.pipe1.dpath.l2_way_state_vd_S2, `L2_TOP1.pipe1.dpath.l2_way_state_subline_S2, 
                 `L2_TOP1.pipe1.dpath.l2_way_state_cache_type_S2, `L2_TOP1.pipe1.dpath.l2_way_state_owner_S2);
        $display("Tag data: 0x%h", `L2_TOP1.pipe1.dpath.tag_data_trans_S2);
        $display("Dir addr: 0x%h", `L2_TOP1.pipe1.dpath.dir_addr_S2);
        $display("Dir data: 0x%h", `L2_TOP1.pipe1.dpath.dir_data_in_S2);
        $display("Dir data mask: 0x%h", `L2_TOP1.pipe1.dpath.dir_data_mask_in_S2);
        $display("Data addr: 0x%h", `L2_TOP1.pipe1.dpath.data_addr_S2);
        $display("Data data: 0x%h", `L2_TOP1.pipe1.dpath.data_data_in_S2);
        $display("Data data mask: 0x%h", `L2_TOP1.pipe1.dpath.data_data_mask_in_S2);
        $display("src x: %b, src y: %b", `L2_TOP1.pipe1.dpath.src_x_S2_f, `L2_TOP1.pipe1.dpath.src_y_S2_f);


    end
    if (`L2_TOP1.pipe1.ctrl.valid_S3 && !`L2_TOP1.pipe1.ctrl.stall_real_S3)
    begin
        $display("TILE1-------------------------------------");
        $display($time);
        $write("P1S3 msg type: ");
        print_msg_type(`L2_TOP1.pipe1.ctrl.msg_type_S3_f);
        $display("Data_size: %b, cache_type: %b", `L2_TOP1.pipe1.ctrl.data_size_S3_f, `L2_TOP1.pipe1.ctrl.cache_type_S3_f);
        $display("P1S3 valid: stall: %b, msg_stall: %b, dir_data_stall: %b",
                  `L2_TOP1.pipe1.ctrl.stall_S3, `L2_TOP1.pipe1.ctrl.msg_stall_S3, `L2_TOP1.pipe1.ctrl.dir_data_stall_S3);
        $display("Control signals: %b", `L2_TOP1.pipe1.ctrl.cs_S3);
        $display("Dir data: 0x%h", `L2_TOP1.pipe1.ctrl.dir_data_S3);
        $display("Mshr state wr enable: %b", `L2_TOP1.pipe1.ctrl.mshr_wr_state_en_S3);
        $display("SMC rd enable: %b", `L2_TOP1.pipe1.ctrl.smc_rd_en_S3);
        $display("SMC miss: %b", `L2_TOP1.pipe1.ctrl.smc_miss_S3);
        $display("State wr enable: %b", `L2_TOP1.pipe1.ctrl.state_wr_en_S3);
        $display("State wr addr: 0x%h", `L2_TOP1.pipe1.dpath.state_wr_addr_S3);
        $display("State wr data: 0x%h", `L2_TOP1.pipe1.dpath.state_data_in_S3);
        $display("State wr data mask: 0x%h", `L2_TOP1.pipe1.dpath.state_data_mask_in_S3);
        $display("Msg send valid: %b, mode: %b, length: %b", `L2_TOP1.pipe1.ctrl.msg_send_valid_S3, 
                  `L2_TOP1.pipe1.ctrl.msg_send_mode_S3,`L2_TOP1.pipe1.ctrl.msg_send_length_S3);
        $write("Msg send type: ");
        print_msg_type(`L2_TOP1.pipe1.ctrl.msg_send_type_S3);
        $display("Msg send data_size: %b, cache_type: %b, mesi: %b, l2_miss: %b, mshrid: %b, subline_vector: %b", 
        `L2_TOP1.pipe1.ctrl.msg_send_data_size_S3, `L2_TOP1.pipe1.ctrl.msg_send_cache_type_S3, 
        `L2_TOP1.pipe1.ctrl.msg_send_mesi_S3, `L2_TOP1.pipe1.ctrl.msg_send_l2_miss_S3, 
        `L2_TOP1.pipe1.ctrl.msg_send_mshrid_S3, `L2_TOP1.pipe1.ctrl.msg_send_subline_vector_S3);
        $display("Msg from mshr: %b", `L2_TOP1.pipe1.ctrl.msg_from_mshr_S3_f);
        $display("P1S3 addr: 0x%h", `L2_TOP1.pipe1.dpath.addr_S3);
        $display("P1S3 valid: l2_hit: %b, l2_evict: %b",
                  `L2_TOP1.pipe1.dpath.l2_tag_hit_S3, `L2_TOP1.pipe1.dpath.l2_evict_S3);
        $display("Data data: 0x%h", `L2_TOP1.pipe1.dpath.data_data_S3);
        $display("State:mesi: %b, vd: %b, subline: %b, cache_type: %b, owner: %b",
                 `L2_TOP1.pipe1.dpath.l2_way_state_mesi_S3, `L2_TOP1.pipe1.dpath.l2_way_state_vd_S3, 
                 `L2_TOP1.pipe1.dpath.l2_way_state_subline_S3, `L2_TOP1.pipe1.dpath.l2_way_state_cache_type_S3, 
                 `L2_TOP1.pipe1.dpath.l2_way_state_owner_S3_f);
        $display("Msg send: addr: 0x%h, dst_x: %b, dst_y: %b, dst_fbits: %b", `L2_TOP1.pipe1.dpath.msg_send_addr_S3, 
                 `L2_TOP1.pipe1.dpath.msg_send_dst_x_S3, `L2_TOP1.pipe1.dpath.msg_send_dst_y_S3, 
                 `L2_TOP1.pipe1.dpath.msg_send_dst_fbits_S3);
        $display("Msg send data: 0x%h", `L2_TOP1.pipe1.dpath.msg_send_data_S3);
        $display("src x: %b, src y: %b", `L2_TOP1.pipe1.dpath.src_x_S3_f, `L2_TOP1.pipe1.dpath.src_y_S3_f);

    end


    if (`L2_TOP1.pipe2.ctrl.valid_S1 && !`L2_TOP1.pipe2.ctrl.stall_S1)
    begin
        $display("TILE1-------------------------------------");
        $display($time);
        $write("P2S1 msg type: ");
        print_msg_type(`L2_TOP1.pipe2.ctrl.msg_type_S1);
        $display("Data_size: %b, cache_type: %b, last_subline: %b", `L2_TOP1.pipe2.ctrl.data_size_S1, 
                `L2_TOP1.pipe2.ctrl.cache_type_S1, `L2_TOP1.pipe2.ctrl.msg_last_subline_S1);
        $display("P2S1 valid: stall: %b, stall_pre: %b, stall_hazard: %b",
                `L2_TOP1.pipe2.ctrl.stall_S1, `L2_TOP1.pipe2.ctrl.stall_pre_S1, `L2_TOP1.pipe2.ctrl.stall_hazard_S1);
        $display("Control signals: %b", `L2_TOP1.pipe2.ctrl.cs_S1);
        $display("Msg from mshr: %b", `L2_TOP1.pipe2.ctrl.msg_from_mshr_S1);
        $display("P2S1 addr: 0x%h", `L2_TOP1.pipe2.dpath.addr_S1);
        $display("Mshr_rd_index: %b", `L2_TOP1.pipe2.dpath.mshr_rd_index_S1);
        $display("Tag_addr: 0x%h", `L2_TOP1.pipe2.dpath.tag_addr_S1,);
        $display("Tag_data_in: 0x%h", `L2_TOP1.pipe2.dpath.tag_data_in_S1,);
        $display("Tag_data_mask_in: 0x%h", `L2_TOP1.pipe2.dpath.tag_data_mask_in_S1,);
        $display("State_rd_addr: 0x%h",`L2_TOP1.pipe2.dpath.state_rd_addr_S1);
        $display("src x: %b, src y: %b", `L2_TOP1.pipe2.dpath.src_x_S1, `L2_TOP1.pipe2.dpath.src_y_S1);

    end


    if (`L2_TOP1.pipe2.ctrl.valid_S2 && !`L2_TOP1.pipe2.ctrl.stall_S2)
    begin
        $display("TILE1-------------------------------------");
        $display($time);
        $write("P2S2 msg type: ");
        print_msg_type(`L2_TOP1.pipe2.ctrl.msg_type_S2_f);
        $display("Data_size: %b, cache_type: %b, last_subline: %b", `L2_TOP1.pipe2.ctrl.data_size_S2_f, 
                 `L2_TOP1.pipe2.ctrl.cache_type_S2_f, `L2_TOP1.pipe2.ctrl.msg_last_subline_S2_f);
        $display("P2S2 valid: stall: %b, stall_real: %b, stall_load: %b",
                  `L2_TOP1.pipe2.ctrl.stall_S2, `L2_TOP1.pipe2.ctrl.stall_real_S2, `L2_TOP1.pipe2.ctrl.stall_load_S2);
        $display("Control signals: %b", `L2_TOP1.pipe2.ctrl.cs_S2);
        $display("Msg from mshr: %b", `L2_TOP1.pipe2.ctrl.msg_from_mshr_S2);
        $display("SMC wr enable: %b", `L2_TOP1.pipe2.ctrl.smc_wr_en_S2);
        $display("Msg from mshr: %b", `L2_TOP1.pipe2.ctrl.msg_from_mshr_S2);
        $display("P2S2 addr: 0x%h", `L2_TOP1.pipe2.dpath.addr_S2);
        $display("P2S2 valid: l2_way_sel: %b, l2_hit: %b, l2_wb: %b",
                  `L2_TOP1.pipe2.dpath.l2_way_sel_S2, `L2_TOP1.pipe2.dpath.l2_tag_hit_S2, `L2_TOP1.pipe2.dpath.l2_wb_S2);
        $display("state: mesi: %b, vd: %b, subline: %b, cache_type: %b, owner: %b",
                 `L2_TOP1.pipe2.dpath.l2_way_state_mesi_S2, `L2_TOP1.pipe2.dpath.l2_way_state_vd_S2, 
                 `L2_TOP1.pipe2.dpath.l2_way_state_subline_S2, `L2_TOP1.pipe2.dpath.l2_way_state_cache_type_S2, 
                 `L2_TOP1.pipe2.dpath.l2_way_state_owner_S2);
        $display("Dir addr: 0x%h", `L2_TOP1.pipe2.dpath.dir_addr_S2);
        $display("Dir data: 0x%h", `L2_TOP1.pipe2.dpath.dir_data_in_S2);
        $display("Dir data mask: 0x%h", `L2_TOP1.pipe2.dpath.dir_data_mask_in_S2);
        $display("Data addr: 0x%h", `L2_TOP1.pipe2.dpath.data_addr_S2);
        $display("Data data: 0x%h", `L2_TOP1.pipe2.dpath.data_data_in_S2);
        $display("Data data mask: 0x%h", `L2_TOP1.pipe2.dpath.data_data_mask_in_S2);
        $display("src x: %b, src y: %b", `L2_TOP1.pipe2.dpath.src_x_S2_f, `L2_TOP1.pipe2.dpath.src_y_S2_f);

    end
    if (`L2_TOP1.pipe2.ctrl.valid_S3 && !`L2_TOP1.pipe2.ctrl.stall_S3)
    begin
        $display("TILE1-------------------------------------");
        $display($time);
        $write("P2S3 msg type: ");
        $display("Mshr wr index: %b", `L2_TOP1.pipe2.dpath.mshr_wr_index_S3);
        $display("Mshr state wr enable: 0x%h", `L2_TOP1.pipe2.ctrl.mshr_wr_state_en_S3);
        $display("State wr enable: 0x%h", `L2_TOP1.pipe2.ctrl.state_wr_en_S3);
        $display("State wr addr: 0x%h", `L2_TOP1.pipe2.dpath.state_wr_addr_S3);
        $display("State wr data: 0x%h", `L2_TOP1.pipe2.dpath.state_data_in_S3);
        $display("State wr data mask: 0x%h", `L2_TOP1.pipe2.dpath.state_data_mask_in_S3);

    end

    `endif


end






task print_msg_type;
input [`MSG_TYPE_WIDTH-1:0] msg_type;
begin
    case (msg_type)
        `MSG_TYPE_LOAD_REQ              : $write("    ld_req     ");
        `MSG_TYPE_PREFETCH_REQ          : $write("   pref_req    ");
        `MSG_TYPE_STORE_REQ             : $write("    st_req     ");
        `MSG_TYPE_BLK_STORE_REQ         : $write("  blk_st_req   ");
        `MSG_TYPE_BLKINIT_STORE_REQ     : $write(" blkinit_st_req");
        `MSG_TYPE_CAS_REQ               : $write("    cas_req    ");
        `MSG_TYPE_CAS_P1_REQ            : $write("  cas_p1_req   ");
        `MSG_TYPE_CAS_P2Y_REQ           : $write("  cas_p2y_req  ");
        `MSG_TYPE_CAS_P2N_REQ           : $write("  cas_p2n_req  ");
        `MSG_TYPE_SWAP_REQ              : $write("    swap_req   ");
        `MSG_TYPE_SWAP_P1_REQ           : $write("  swap_p1_req  ");
        `MSG_TYPE_SWAP_P2_REQ           : $write("  swap_p2_req  ");
        `MSG_TYPE_WB_REQ                : $write("     wb_req    ");
        `MSG_TYPE_WBGUARD_REQ           : $write("   wbgrd_req   ");
        `MSG_TYPE_NC_LOAD_REQ           : $write("   nc_ld_req   ");
        `MSG_TYPE_NC_STORE_REQ          : $write("   nc_st_req   ");
        `MSG_TYPE_LOAD_FWD              : $write("     ld_fwd    ");
        `MSG_TYPE_STORE_FWD             : $write("     st_fwd    ");
        `MSG_TYPE_INV_FWD               : $write("    inv_fwd    ");
        `MSG_TYPE_LOAD_MEM              : $write("     ld_mem    ");
        `MSG_TYPE_STORE_MEM             : $write("     st_mem    ");
        `MSG_TYPE_LOAD_FWDACK           : $write("   ld_fwdack   ");
        `MSG_TYPE_STORE_FWDACK          : $write("   st_fwdack   ");
        `MSG_TYPE_INV_FWDACK            : $write("   inv_fwdack  ");
        `MSG_TYPE_LOAD_MEM_ACK          : $write("   ld_mem_ack  ");
        `MSG_TYPE_STORE_MEM_ACK         : $write("   st_mem_ack  ");
        `MSG_TYPE_NC_LOAD_MEM_ACK       : $write(" nc_ld_mem_ack ");
        `MSG_TYPE_NC_STORE_MEM_ACK      : $write(" nc_st_mem_ack ");
        `MSG_TYPE_NODATA_ACK            : $write("   nodata_ack  ");
        `MSG_TYPE_DATA_ACK              : $write("    data_ack   ");
        `MSG_TYPE_INTERRUPT_FWD         : $write("     int_fwd   ");
        `MSG_TYPE_INTERRUPT             : $write("       int     ");
        default                         : $write("      undef    ");
    endcase
end
endtask








endmodule
