/*
Copyright (c) 2015 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

// This module wraps the L1.5 and ties unused signals

`include "l15.tmp.h"

module l15_wrap (
    input                                   clk,
    input                                   rst_n,

    input [4:0]                             transducer_l15_rqtype,
    input [`L15_AMO_OP_WIDTH-1:0]           transducer_l15_amo_op,
    input                                   transducer_l15_nc,
    input [2:0]                             transducer_l15_size,
    input [`L15_THREADID_MASK]              transducer_l15_threadid,
    input                                   transducer_l15_prefetch,
    input                                   transducer_l15_invalidate_cacheline,
    input                                   transducer_l15_blockstore,
    input                                   transducer_l15_blockinitstore,
    input [1:0]                             transducer_l15_l1rplway,
    input                                   transducer_l15_val,
    input [39:0]                            transducer_l15_address,
    input [63:0]                            transducer_l15_data,
    input [63:0]                            transducer_l15_data_next_entry,
    input [`TLB_CSM_WIDTH-1:0]              transducer_l15_csm_data,

    output                                  l15_transducer_ack,
    output                                  l15_transducer_header_ack,

    output                                  l15_transducer_val,
    output [3:0]                            l15_transducer_returntype,
    output                                  l15_transducer_l2miss,
    output [1:0]                            l15_transducer_error,
    output                                  l15_transducer_noncacheable,
    output                                  l15_transducer_atomic,
    output [`L15_THREADID_MASK]             l15_transducer_threadid,
    output                                  l15_transducer_prefetch,
    output                                  l15_transducer_f4b,
    output [63:0]                           l15_transducer_data_0,
    output [63:0]                           l15_transducer_data_1,
    output [63:0]                           l15_transducer_data_2,
    output [63:0]                           l15_transducer_data_3,
    output                                  l15_transducer_inval_icache_all_way,
    output                                  l15_transducer_inval_dcache_all_way,
    output [15:4]                           l15_transducer_inval_address_15_4,
    output                                  l15_transducer_cross_invalidate,
    output [1:0]                            l15_transducer_cross_invalidate_way,
    output                                  l15_transducer_inval_dcache_inval,
    output                                  l15_transducer_inval_icache_inval,
    output [1:0]                            l15_transducer_inval_way,
    output                                  l15_transducer_blockinitstore,

    input                                   transducer_l15_req_ack,

    input                                   noc1_out_rdy,
    input                                   noc2_in_val,
    input [`NOC_DATA_WIDTH-1:0]             noc2_in_data,
    input                                   noc3_out_rdy,
    input                                   dmbr_l15_stall,
    input [`NOC_CHIPID_WIDTH-1:0]           chipid,
    input [`NOC_X_WIDTH-1:0]                coreid_x,
    input [`NOC_Y_WIDTH-1:0]                coreid_y,

    // input from config registers to pipeline
    input [63:0]                            config_l15_read_res_data_s3,
    input                                   config_csm_en,
    input [5:0]                             config_system_tile_count_5_0,
    input [`HOME_ALLOC_METHOD_WIDTH-1:0]    config_home_alloc_method, 
    input [`L15_HMT_BASE_ADDR_WIDTH-1:0]    config_hmt_base,

    output                                  noc1_out_val,
    output [`NOC_DATA_WIDTH-1:0]            noc1_out_data,
    output                                  noc2_in_rdy,
    output                                  noc3_out_val,
    output [`NOC_DATA_WIDTH-1:0]            noc3_out_data,
    // output wire pcx_req_squashed,
    output                                  l15_dmbr_l1missIn,
    output [`DMBR_TAG_WIDTH-1:0]            l15_dmbr_l1missTag,
    output                                  l15_dmbr_l2responseIn,
    output                                  l15_dmbr_l2missIn,
    output [`DMBR_TAG_WIDTH-1:0]            l15_dmbr_l2missTag,

    // output to config registers to pipeline
    output                                  l15_config_req_val_s2,
    output                                  l15_config_req_rw_s2,
    output [63:0]                           l15_config_write_req_data_s2,
    output [`CONFIG_REG_ADDRESS_MASK]       l15_config_req_address_s2,

    // sram interface
    output [`SRAM_WRAPPER_BUS_WIDTH-1:0]    srams_rtap_data,
    input  [`BIST_OP_WIDTH-1:0]             rtap_srams_bist_command,
    input  [`SRAM_WRAPPER_BUS_WIDTH-1:0]    rtap_srams_bist_data
);

    wire [31:0]   config_system_tile_count = {26'bx, config_system_tile_count_5_0};
   
    l15 l15 (
        .clk(clk),
        .rst_n(rst_n),

        .transducer_l15_rqtype              (transducer_l15_rqtype),
        .transducer_l15_amo_op              (transducer_l15_amo_op),
        .transducer_l15_nc                  (transducer_l15_nc),
        .transducer_l15_size                (transducer_l15_size),
        // .pcxdecoder_l15_invalall         (transducer_l15_invalall),
        .transducer_l15_threadid            (transducer_l15_threadid),
        .transducer_l15_prefetch            (transducer_l15_prefetch),
        .transducer_l15_blockstore          (transducer_l15_blockstore),
        .transducer_l15_blockinitstore      (transducer_l15_blockinitstore),
        .transducer_l15_l1rplway            (transducer_l15_l1rplway),
        .transducer_l15_val                 (transducer_l15_val),
        .transducer_l15_invalidate_cacheline(transducer_l15_invalidate_cacheline),
        .transducer_l15_address             (transducer_l15_address),
        .transducer_l15_csm_data            (transducer_l15_csm_data),
        .transducer_l15_data                (transducer_l15_data),
        .transducer_l15_data_next_entry     (transducer_l15_data_next_entry),

        .l15_transducer_ack                 (l15_transducer_ack),
        .l15_transducer_header_ack          (l15_transducer_header_ack),
                               
        .l15_transducer_val                 (l15_transducer_val),
        .l15_transducer_returntype          (l15_transducer_returntype),
        .l15_transducer_l2miss              (l15_transducer_l2miss),
        .l15_transducer_error               (l15_transducer_error),
        .l15_transducer_noncacheable        (l15_transducer_noncacheable),
        .l15_transducer_atomic              (l15_transducer_atomic),
        .l15_transducer_threadid            (l15_transducer_threadid),
        .l15_transducer_prefetch            (l15_transducer_prefetch),
        .l15_transducer_f4b                 (l15_transducer_f4b),
        .l15_transducer_data_0              (l15_transducer_data_0),
        .l15_transducer_data_1              (l15_transducer_data_1),
        .l15_transducer_data_2              (l15_transducer_data_2),
        .l15_transducer_data_3              (l15_transducer_data_3),
        .l15_transducer_inval_icache_all_way(l15_transducer_inval_icache_all_way),
        .l15_transducer_inval_dcache_all_way(l15_transducer_inval_dcache_all_way),
        .l15_transducer_inval_address_15_4  (l15_transducer_inval_address_15_4),
        .l15_transducer_cross_invalidate    (l15_transducer_cross_invalidate),
        .l15_transducer_cross_invalidate_way(l15_transducer_cross_invalidate_way),
        .l15_transducer_inval_dcache_inval  (l15_transducer_inval_dcache_inval),
        .l15_transducer_inval_icache_inval  (l15_transducer_inval_icache_inval),
        .l15_transducer_inval_way           (l15_transducer_inval_way),
        .l15_transducer_blockinitstore      (l15_transducer_blockinitstore),

        .transducer_l15_req_ack             (transducer_l15_req_ack),

        .noc1_out_rdy(noc1_out_rdy),
        .noc2_in_val(noc2_in_val),
        .noc2_in_data(noc2_in_data),
        .noc3_out_rdy(noc3_out_rdy),
        .dmbr_l15_stall(dmbr_l15_stall),
        .chipid(chipid),
        .coreid_x(coreid_x),
        .coreid_y(coreid_y),

        .noc1_out_val(noc1_out_val),
        .noc1_out_data(noc1_out_data),
        .noc2_in_rdy(noc2_in_rdy),
        .noc3_out_val(noc3_out_val),
        .noc3_out_data(noc3_out_data),
        // .pcx_req_squashed(pcx_req_squashed),
        .l15_dmbr_l1missIn(l15_dmbr_l1missIn),
        .l15_dmbr_l1missTag(l15_dmbr_l1missTag),
        .l15_dmbr_l2missIn(l15_dmbr_l2missIn),
        .l15_dmbr_l2missTag(l15_dmbr_l2missTag),
        .l15_dmbr_l2responseIn(l15_dmbr_l2responseIn),

        // config registers
        .l15_config_req_val_s2(l15_config_req_val_s2),
        .l15_config_req_rw_s2(l15_config_req_rw_s2),
        .l15_config_write_req_data_s2(l15_config_write_req_data_s2),
        .l15_config_req_address_s2(l15_config_req_address_s2),
        .config_l15_read_res_data_s3(config_l15_read_res_data_s3),

        // config regs
        .config_csm_en(config_csm_en),
        .config_hmt_base(config_hmt_base),
        .config_system_tile_count(config_system_tile_count),
        .config_home_alloc_method(config_home_alloc_method),
        
        // sram interfaces
        .srams_rtap_data (srams_rtap_data),
        .rtap_srams_bist_command (rtap_srams_bist_command),
        .rtap_srams_bist_data (rtap_srams_bist_data)
    );

endmodule
