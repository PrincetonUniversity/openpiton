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

module l15_wrap
(
    input wire clk,
    input wire rst_n,

    input wire           pcx_req_0,
    input wire           pcx_atomic_req,
    
    input wire   [123:117] pcx_data_123_117,
    input wire   [112:0]   pcx_data_112_0,
    `ifndef NO_RTL_CSM
    input wire   [`TLB_CSM_WIDTH-1:0] pcx_csm,
    `endif
    input wire noc1_out_rdy,
    input wire noc2_in_val,
    input wire [`NOC_DATA_WIDTH-1:0] noc2_in_data,
    input wire noc3_out_rdy,
    input wire dmbr_l15_stall,
    input wire [`NOC_CHIPID_WIDTH-1:0] chipid,
    input wire [`NOC_X_WIDTH-1:0] coreid_x,
    input wire [`NOC_Y_WIDTH-1:0] coreid_y,

    // input from config registers to pipeline
    input wire [63:0] config_l15_read_res_data_s3,
    input wire config_csm_en,
    input wire [5:0] config_system_tile_count_5_0,
    input wire [`HOME_ALLOC_METHOD_WIDTH-1:0] config_home_alloc_method, 
    input wire [`L15_HMT_BASE_ADDR_WIDTH-1:0] config_hmt_base,

    output wire [4:0]     pcx_grant,
    output wire           cpx_data_ready,
    output wire [144:0]   cpx_data,
    output wire noc1_out_val,
    output wire [`NOC_DATA_WIDTH-1:0] noc1_out_data,
    output wire noc2_in_rdy,
    output wire noc3_out_val,
    output wire [`NOC_DATA_WIDTH-1:0] noc3_out_data,
    // output wire pcx_req_squashed,
    output wire                       l15_dmbr_l1missIn,
    output wire [`DMBR_TAG_WIDTH-1:0] l15_dmbr_l1missTag,
    output wire                       l15_dmbr_l2responseIn,
    output wire                       l15_dmbr_l2missIn,
    output wire [`DMBR_TAG_WIDTH-1:0] l15_dmbr_l2missTag,

    // output to config registers to pipeline
    output wire l15_config_req_val_s2,
    output wire l15_config_req_rw_s2,
    output wire [63:0] l15_config_write_req_data_s2,
    output wire [`CONFIG_REG_ADDRESS_MASK] l15_config_req_address_s2,

    // sram interface
    output wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] srams_rtap_data,
    input wire  [`BIST_OP_WIDTH-1:0] rtap_srams_bist_command,
    input wire  [`SRAM_WRAPPER_BUS_WIDTH-1:0] rtap_srams_bist_data
);

    wire [4:0] pcx_req = {4'bx, pcx_req_0};
    wire [123:0] pcx_data = {pcx_data_123_117, 4'bx, pcx_data_112_0};
    wire [31:0] config_system_tile_count = {26'bx, config_system_tile_count_5_0};

    l15 l15(
        .clk(clk),
        .rst_n(rst_n),

        .pcx_req(pcx_req),
        .pcx_atomic_req(pcx_atomic_req),
        .pcx_data(pcx_data),
        `ifndef NO_RTL_CSM
        .pcx_csm(pcx_csm),
        `endif
        .noc1_out_rdy(noc1_out_rdy),
        .noc2_in_val(noc2_in_val),
        .noc2_in_data(noc2_in_data),
        .noc3_out_rdy(noc3_out_rdy),
        .dmbr_l15_stall(dmbr_l15_stall),
        .chipid(chipid),
        .coreid_x(coreid_x),
        .coreid_y(coreid_y),

        .pcx_grant(pcx_grant),
        .cpx_data_ready(cpx_data_ready),
        .cpx_data(cpx_data),
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
