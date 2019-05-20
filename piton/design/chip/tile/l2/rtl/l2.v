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

//==================================================================================================
//  Filename      : l2.v
//  Created On    : 2014-02-20
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : main verilog file for the L2 cache
//
//
//==================================================================================================

`include "l2.tmp.h"
`include "define.tmp.h"

module l2(

    input wire clk,
    input wire rst_n,

    input wire [`NOC_CHIPID_WIDTH-1:0] chipid,
    input wire [`NOC_X_WIDTH-1:0] coreid_x,
    input wire [`NOC_Y_WIDTH-1:0] coreid_y,

    input wire noc1_valid_in,
    input wire [`NOC_DATA_WIDTH-1:0] noc1_data_in,
    output wire noc1_ready_in,


    input wire noc3_valid_in,
    input wire [`NOC_DATA_WIDTH-1:0] noc3_data_in,
    output wire noc3_ready_in,

    output wire noc2_valid_out,
    output wire [`NOC_DATA_WIDTH-1:0] noc2_data_out,
    input wire noc2_ready_out,

    // sram interface
    output wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] srams_rtap_data,
    input wire  [`BIST_OP_WIDTH-1:0] rtap_srams_bist_command,
    input wire  [`SRAM_WRAPPER_BUS_WIDTH-1:0] rtap_srams_bist_data
);

// sram
wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] data_rtap_data;
wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] dir_rtap_data;
wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] tag_rtap_data;
wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] state_rtap_data;
assign srams_rtap_data = data_rtap_data
                            | dir_rtap_data
                            | tag_rtap_data
                            | state_rtap_data;

localparam y = 1'b1;
localparam n = 1'b0;


wire mshr_cam_en_p1;
wire mshr_wr_state_en_p1;
wire mshr_wr_data_en_p1;
wire mshr_pending_ready_p1;
wire [`L2_MSHR_STATE_BITS-1:0] mshr_state_in_p1;
wire [`L2_MSHR_ARRAY_WIDTH-1:0] mshr_data_in_p1;
wire [`L2_MSHR_ARRAY_WIDTH-1:0] mshr_data_mask_in_p1;
wire [`L2_MSHR_INDEX_WIDTH-1:0] mshr_inv_counter_rd_index_in_p1;
wire [`L2_MSHR_INDEX_WIDTH-1:0] mshr_wr_index_in_p1;
wire [`L2_MSHR_ADDR_IN_WIDTH-1:0] mshr_addr_in_p1;

wire mshr_rd_en_p2;
wire mshr_wr_state_en_p2;
wire mshr_wr_data_en_p2;
wire mshr_inc_counter_en_p2;
wire [`L2_MSHR_STATE_BITS-1:0] mshr_state_in_p2;
wire [`L2_MSHR_ARRAY_WIDTH-1:0] mshr_data_in_p2;
wire [`L2_MSHR_ARRAY_WIDTH-1:0] mshr_data_mask_in_p2;
wire [`L2_MSHR_INDEX_WIDTH-1:0] mshr_rd_index_in_p2;
wire [`L2_MSHR_INDEX_WIDTH-1:0] mshr_wr_index_in_p2;

wire mshr_hit;
wire [`L2_MSHR_INDEX_WIDTH-1:0] mshr_hit_index;
`ifdef NO_L2_CAM_MSHR
wire [`L2_MSHR_STATE_BITS-1:0] mshr_state_out;
wire [`L2_MSHR_ARRAY_WIDTH-1:0] mshr_data_out;
`else
wire [`L2_MSHR_STATE_BITS-1:0] rd_mshr_state_out;
wire [`L2_MSHR_ARRAY_WIDTH-1:0] rd_mshr_data_out;
// wire [`L2_MSHR_STATE_BITS-1:0] cam_mshr_state_out;
wire [`L2_MSHR_ARRAY_WIDTH-1:0] cam_mshr_data_out;
wire [`L2_MSHR_ARRAY_WIDTH-1:0] pending_mshr_data_out;
`endif

wire [`L2_OWNER_BITS-1:0] mshr_inv_counter_out;
wire [`L2_MSHR_INDEX_WIDTH:0] mshr_empty_slots;
wire mshr_pending;
wire [`L2_MSHR_INDEX_WIDTH-1:0] mshr_pending_index;
wire [`L2_MSHR_INDEX_WIDTH-1:0] mshr_empty_index;

wire state_rd_en_p1;
wire state_wr_en_p1;
wire [`L2_STATE_INDEX_WIDTH-1:0] state_rd_addr_p1;
wire [`L2_STATE_INDEX_WIDTH-1:0] state_wr_addr_p1;
wire [`L2_STATE_ARRAY_WIDTH-1:0] state_data_in_p1;
wire [`L2_STATE_ARRAY_WIDTH-1:0] state_data_mask_in_p1;

wire state_rd_en_p2;
wire state_wr_en_p2;
wire [`L2_STATE_INDEX_WIDTH-1:0] state_rd_addr_p2;
wire [`L2_STATE_INDEX_WIDTH-1:0] state_wr_addr_p2;
wire [`L2_STATE_ARRAY_WIDTH-1:0] state_data_in_p2;
wire [`L2_STATE_ARRAY_WIDTH-1:0] state_data_mask_in_p2;

wire [`L2_STATE_ARRAY_WIDTH-1:0] state_data_out;

wire tag_clk_en_p1;
wire tag_rdw_en_p1;
wire [`L2_TAG_INDEX_WIDTH-1:0] tag_addr_p1;
wire [`L2_TAG_ARRAY_WIDTH-1:0] tag_data_in_p1;
wire [`L2_TAG_ARRAY_WIDTH-1:0] tag_data_mask_in_p1;

wire tag_clk_en_p2;
wire tag_rdw_en_p2;
wire [`L2_TAG_INDEX_WIDTH-1:0] tag_addr_p2;
wire [`L2_TAG_ARRAY_WIDTH-1:0] tag_data_in_p2;
wire [`L2_TAG_ARRAY_WIDTH-1:0] tag_data_mask_in_p2;

wire [`L2_TAG_ARRAY_WIDTH-1:0] tag_data_out;

wire dir_clk_en_p1;
wire dir_rdw_en_p1;
wire [`L2_DIR_INDEX_WIDTH-1:0] dir_addr_p1;
wire [`L2_DIR_ARRAY_WIDTH-1:0] dir_data_in_p1;
wire [`L2_DIR_ARRAY_WIDTH-1:0] dir_data_mask_in_p1;

wire dir_clk_en_p2;
wire dir_rdw_en_p2;
wire [`L2_DIR_INDEX_WIDTH-1:0] dir_addr_p2;
wire [`L2_DIR_ARRAY_WIDTH-1:0] dir_data_in_p2;
wire [`L2_DIR_ARRAY_WIDTH-1:0] dir_data_mask_in_p2;

wire [`L2_DIR_ARRAY_WIDTH-1:0] dir_data_out;

wire data_clk_en_p1;
wire data_rdw_en_p1;
wire [`L2_DATA_INDEX_WIDTH-1:0] data_addr_p1;
wire [`L2_DATA_ARRAY_WIDTH-1:0] data_data_in_p1;
wire [`L2_DATA_ARRAY_WIDTH-1:0] data_data_mask_in_p1;

wire data_clk_en_p2;
wire data_rdw_en_p2;
wire [`L2_DATA_INDEX_WIDTH-1:0] data_addr_p2;
wire [`L2_DATA_ARRAY_WIDTH-1:0] data_data_in_p2;
wire [`L2_DATA_ARRAY_WIDTH-1:0] data_data_mask_in_p2;
wire [`L2_DATA_ARRAY_WIDTH-1:0] data_data_out;

`ifndef NO_RTL_CSM
wire smc_rd_en;
wire smc_rd_diag_en;
wire smc_wr_diag_en;
wire smc_flush_en;
wire [`L2_ADDR_OP_WIDTH-1:0] smc_addr_op;
wire [`L2_SMC_ADDR_WIDTH-1:0] smc_rd_addr_in;

wire smc_wr_en_p1;
wire [`L2_SMC_ADDR_WIDTH-1:0] smc_wr_addr_in_p1;
wire [`L2_SMC_DATA_IN_WIDTH-1:0] smc_data_in_p1;

wire smc_wr_en_p2;
wire [`L2_SMC_ADDR_WIDTH-1:0] smc_wr_addr_in_p2;
wire [`L2_SMC_DATA_IN_WIDTH-1:0] smc_data_in_p2;

wire [`CS_OP_WIDTH-1:0] broadcast_counter_op_p1;
wire broadcast_counter_op_val_p1;

wire [`CS_OP_WIDTH-1:0] broadcast_counter_op_p2;
wire broadcast_counter_op_val_p2;

wire smc_hit;
wire [`L2_SMC_DATA_OUT_WIDTH-1:0] smc_data_out;
wire [`L2_SMC_VALID_WIDTH-1:0] smc_valid_out;
wire [`L2_SMC_TAG_WIDTH-1:0] smc_tag_out;

wire broadcast_counter_zero1;
wire broadcast_counter_max1;
wire broadcast_counter_avail1;
wire [`MSG_SRC_CHIPID_WIDTH-1:0] broadcast_chipid_out1;
wire [`MSG_SRC_X_WIDTH-1:0] broadcast_x_out1;
wire [`MSG_SRC_Y_WIDTH-1:0] broadcast_y_out1;

wire broadcast_counter_zero2;
wire broadcast_counter_max2;
wire broadcast_counter_avail2;
wire [`MSG_SRC_CHIPID_WIDTH-1:0] broadcast_chipid_out2;
wire [`MSG_SRC_X_WIDTH-1:0] broadcast_x_out2;
wire [`MSG_SRC_Y_WIDTH-1:0] broadcast_y_out2;
`endif

wire reg_rd_en;
wire reg_wr_en;
wire [`L2_ADDR_TYPE_WIDTH-1:0] reg_rd_addr_type;
wire [`L2_ADDR_TYPE_WIDTH-1:0] reg_wr_addr_type;
wire [`L2_REG_WIDTH-1:0] reg_data_out;
wire [`L2_REG_WIDTH-1:0] reg_data_in;
wire l2_access_valid;
wire l2_miss_valid;
wire data_ecc_corr_error;
wire data_ecc_uncorr_error;
wire [`L2_DATA_INDEX_WIDTH-1:0] data_ecc_addr;
wire [`PHY_ADDR_WIDTH-1:0] error_addr;
wire [`NOC_NODEID_WIDTH-1:0] my_nodeid;
wire [`L2_COREID_WIDTH-1:0] core_max;
`ifndef NO_RTL_CSM
wire csm_en;
`endif
wire [`L2_SMT_BASE_ADDR_WIDTH-1:0] smt_base_addr;


wire pipe2_valid_S1;
wire pipe2_valid_S2;
wire pipe2_valid_S3;



wire [`MSG_TYPE_WIDTH-1:0] pipe2_msg_type_S1;
wire [`MSG_TYPE_WIDTH-1:0] pipe2_msg_type_S2;
wire [`MSG_TYPE_WIDTH-1:0] pipe2_msg_type_S3;

wire [`PHY_ADDR_WIDTH-1:0] pipe2_addr_S1;
wire [`PHY_ADDR_WIDTH-1:0] pipe2_addr_S2;
wire [`PHY_ADDR_WIDTH-1:0] pipe2_addr_S3;

wire active_S1;
wire active_S2;
wire active_S3;





l2_config_regs config_regs(

    .clk                    (clk),
    .rst_n                  (rst_n),
    .chipid                 (chipid),
    .coreid_x               (coreid_x),
    .coreid_y               (coreid_y),
    .l2_access_valid        (l2_access_valid),
    .l2_miss_valid          (l2_miss_valid),
    .data_ecc_corr_error    (data_ecc_corr_error),
    .data_ecc_uncorr_error  (data_ecc_uncorr_error),
    .data_ecc_addr          (data_ecc_addr),
    .error_addr             (error_addr),
    .reg_rd_en              (reg_rd_en),
    .reg_wr_en              (reg_wr_en),
    .reg_rd_addr_type       (reg_rd_addr_type),
    .reg_wr_addr_type       (reg_wr_addr_type),
    .reg_data_in            (reg_data_in),

    .reg_data_out           (reg_data_out),
    .my_nodeid              (my_nodeid),
    .core_max               (core_max),
    `ifndef NO_RTL_CSM
    .csm_en                 (csm_en),
    `else
    .csm_en                 (),
    `endif
    .smt_base_addr          (smt_base_addr)

);




l2_mshr_wrap mshr_wrap(
    .clk                    (clk),
    .rst_n                  (rst_n),
`ifdef NO_L2_CAM_MSHR
    .pipe_rd_sel            (active_S1),
`endif
    .pipe_wr_sel            (active_S3),

`ifdef NO_L2_CAM_MSHR
    .rd_en1                 (1'b0),
`endif
    .cam_en1                (mshr_cam_en_p1),
    .wr_state_en1           (mshr_wr_state_en_p1),
    .wr_data_en1            (mshr_wr_data_en_p1),
    .pending_ready1         (mshr_pending_ready_p1),
    .state_in1              (mshr_state_in_p1),
    .data_in1               (mshr_data_in_p1),
    .data_mask_in1          (mshr_data_mask_in_p1),
`ifdef NO_L2_CAM_MSHR
    .rd_index_in1           ({`L2_MSHR_INDEX_WIDTH{1'b0}}),
`endif
    .inv_counter_rd_index_in1(mshr_inv_counter_rd_index_in_p1),
    .wr_index_in1           (mshr_wr_index_in_p1),
    .addr_in1               (mshr_addr_in_p1),

`ifdef NO_L2_CAM_MSHR
    .rd_en2                 (mshr_rd_en_p2),
    .cam_en2                (1'b0),
`endif
    .wr_state_en2           (mshr_wr_state_en_p2),
    .wr_data_en2            (mshr_wr_data_en_p2),
`ifdef NO_L2_CAM_MSHR
    .pending_ready2         (1'b0), 
`endif
    .inc_counter_en2        (mshr_inc_counter_en_p2),
    .state_in2              (mshr_state_in_p2),
    .data_in2               (mshr_data_in_p2),
    .data_mask_in2          (mshr_data_mask_in_p2),
    .rd_index_in2           (mshr_rd_index_in_p2),
    .wr_index_in2           (mshr_wr_index_in_p2),
`ifdef NO_L2_CAM_MSHR
    .addr_in2               ({`L2_MSHR_ADDR_IN_WIDTH{1'b0}}),
`endif

    .hit                    (mshr_hit),
    .hit_index              (mshr_hit_index),
`ifdef NO_L2_CAM_MSHR
    .state_out              (mshr_state_out),
    .data_out               (mshr_data_out),
`else
    .rd_state_out           (rd_mshr_state_out),
    .rd_data_out            (rd_mshr_data_out),
    // .cam_state_out       (cam_mshr_state_out),
    .cam_data_out           (cam_mshr_data_out),
    .pending_data_out       (pending_mshr_data_out),
`endif
    .inv_counter_out        (mshr_inv_counter_out), 
    .empty_slots            (mshr_empty_slots),
    .pending                (mshr_pending),
    .pending_index          (mshr_pending_index),
    .empty_index            (mshr_empty_index)
);

l2_state_wrap state_wrap(
    .clk                    (clk),
    .rst_n                  (rst_n),
    .pdout_en               (1'b0),
    .deepsleep              (1'b0),
    .pipe_rd_sel            (active_S1),
    .pipe_wr_sel            (active_S3),

    .rd_en1                 (state_rd_en_p1),
    .wr_en1                 (state_wr_en_p1),
    .rd_addr1               (state_rd_addr_p1),
    .wr_addr1               (state_wr_addr_p1),
    .data_in1               (state_data_in_p1),
    .data_mask_in1          (state_data_mask_in_p1),

    .rd_en2                 (state_rd_en_p2),
    .wr_en2                 (state_wr_en_p2),
    .rd_addr2               (state_rd_addr_p2),
    .wr_addr2               (state_wr_addr_p2),
    .data_in2               (state_data_in_p2),
    .data_mask_in2          (state_data_mask_in_p2),

    .data_out               (state_data_out),
    .pdata_out              (),

    // sram interfaces
    .srams_rtap_data (state_rtap_data),
    .rtap_srams_bist_command (rtap_srams_bist_command),
    .rtap_srams_bist_data (rtap_srams_bist_data)
);

l2_tag_wrap tag_wrap(
    .clk                    (clk),
    .rst_n                  (rst_n),
    .pdout_en               (1'b0),
    .deepsleep              (1'b0),
    .pipe_sel               (active_S1),

    .clk_en1                (tag_clk_en_p1),
    .rdw_en1                (tag_rdw_en_p1),
    .addr1                  (tag_addr_p1),
    .data_in1               (tag_data_in_p1),
    .data_mask_in1          (tag_data_mask_in_p1),

    .clk_en2                (tag_clk_en_p2),
    .rdw_en2                (tag_rdw_en_p2),
    .addr2                  (tag_addr_p2),
    .data_in2               (tag_data_in_p2),
    .data_mask_in2          (tag_data_mask_in_p2),


    .data_out               (tag_data_out),
    .pdata_out              (),

    // sram interfaces
    .srams_rtap_data (tag_rtap_data),
    .rtap_srams_bist_command (rtap_srams_bist_command),
    .rtap_srams_bist_data (rtap_srams_bist_data)
);

l2_dir_wrap dir_wrap(
    .clk                    (clk),
    .rst_n                  (rst_n),
    .pdout_en               (1'b0),
    .deepsleep              (1'b0),
    .pipe_sel               (active_S2),

    .clk_en1                (dir_clk_en_p1),
    .rdw_en1                (dir_rdw_en_p1),
    .addr1                  (dir_addr_p1),
    .data_in1               (dir_data_in_p1),
    .data_mask_in1          (dir_data_mask_in_p1),

    .clk_en2                (dir_clk_en_p2),
    .rdw_en2                (dir_rdw_en_p2),
    .addr2                  (dir_addr_p2),
    .data_in2               (dir_data_in_p2),
    .data_mask_in2          (dir_data_mask_in_p2),


    .data_out               (dir_data_out),
    .pdata_out              (),

    // sram interfaces
    .srams_rtap_data (dir_rtap_data),
    .rtap_srams_bist_command (rtap_srams_bist_command),
    .rtap_srams_bist_data (rtap_srams_bist_data)
);

l2_data_wrap data_wrap(
    .clk                    (clk),
    .rst_n                  (rst_n),
    .pdout_en               (1'b0),
    .deepsleep              (1'b0),
    .pipe_sel               (active_S2),

    .clk_en1                (data_clk_en_p1),
    .rdw_en1                (data_rdw_en_p1),
    .addr1                  (data_addr_p1),
    .data_in1               (data_data_in_p1),
    .data_mask_in1          (data_data_mask_in_p1),

    .clk_en2                (data_clk_en_p2),
    .rdw_en2                (data_rdw_en_p2),
    .addr2                  (data_addr_p2),
    .data_in2               (data_data_in_p2),
    .data_mask_in2          (data_data_mask_in_p2),


    .data_out               (data_data_out),
    .pdata_out              (),

    // sram interfaces
    .srams_rtap_data (data_rtap_data),
    .rtap_srams_bist_command (rtap_srams_bist_command),
    .rtap_srams_bist_data (rtap_srams_bist_data)
);

`ifndef NO_RTL_CSM
l2_smc_wrap smc_wrap(
    .clk                    (clk),
    .rst_n                  (rst_n),
    .pipe_sel               (active_S2),
    .rd_en                  (smc_rd_en),
    .rd_diag_en             (smc_rd_diag_en),
    .flush_en               (smc_flush_en),
    .addr_op                (smc_addr_op),
    .rd_addr_in             (smc_rd_addr_in),

    .wr_en1                 (smc_wr_en_p1),
    .wr_addr_in1            (smc_wr_addr_in_p1),
    .data_in1               (smc_data_in_p1),
    .wr_diag_en1            (smc_wr_diag_en),

    .wr_en2                 (smc_wr_en_p2),
    .wr_addr_in2            (smc_wr_addr_in_p2),
    .data_in2               (smc_data_in_p2),
    .wr_diag_en2            (1'b0),

    .hit                    (smc_hit),
    .data_out               (smc_data_out),
    .valid_out              (smc_valid_out),
    .tag_out                (smc_tag_out)
);

l2_broadcast_counter_wrap l2_broadcast_counter_wrap(
    .clk                    (clk),
    .rst_n                  (rst_n),
    .chipid_max             (core_max[`L2_CORE_CHIPID]),
    .x_max                  (core_max[`L2_CORE_X]),
    .y_max                  (core_max[`L2_CORE_Y]),
    .pipe_sel               (active_S2),

    .counter_op1            (broadcast_counter_op_p1),
    .counter_op_val1        (broadcast_counter_op_val_p1),

    .counter_op2            (broadcast_counter_op_p2),
    .counter_op_val2        (broadcast_counter_op_val_p2),

    .zero1                  (broadcast_counter_zero1),
    .max1                   (broadcast_counter_max1),
    .avail1                 (broadcast_counter_avail1),
    .chipid_out1            (broadcast_chipid_out1),
    .x_out1                 (broadcast_x_out1),
    .y_out1                 (broadcast_y_out1),

    .zero2                  (broadcast_counter_zero2),
    .max2                   (broadcast_counter_max2),
    .avail2                 (broadcast_counter_avail2),
    .chipid_out2            (broadcast_chipid_out2),
    .x_out2                 (broadcast_x_out2),
    .y_out2                 (broadcast_y_out2)
);

`endif

l2_pipe1 pipe1(
    .clk                    (clk),
    .rst_n                  (rst_n),
    .my_nodeid              (my_nodeid),
    `ifndef NO_RTL_CSM
    .csm_en                 (csm_en),
    `endif
    .smt_base_addr          (smt_base_addr),

    .noc_valid_in           (noc1_valid_in),
    .noc_data_in            (noc1_data_in),
    .noc_ready_in           (noc1_ready_in),

    .noc_valid_out          (noc2_valid_out),
    .noc_data_out           (noc2_data_out),
    .noc_ready_out          (noc2_ready_out),


    .pipe2_valid_S1         (pipe2_valid_S1),
    .pipe2_valid_S2         (pipe2_valid_S2),
    .pipe2_valid_S3         (pipe2_valid_S3),
    .pipe2_msg_type_S1      (pipe2_msg_type_S1),
    .pipe2_msg_type_S2      (pipe2_msg_type_S2),
    .pipe2_msg_type_S3      (pipe2_msg_type_S3),
    .pipe2_addr_S1          (pipe2_addr_S1),
    .pipe2_addr_S2          (pipe2_addr_S2),
    .pipe2_addr_S3          (pipe2_addr_S3),
    .global_stall_S1        (active_S1),
    .global_stall_S2        (active_S2),
    .global_stall_S4        (active_S3),

    .mshr_hit               (mshr_hit),
`ifdef NO_L2_CAM_MSHR
    .mshr_data_out          (mshr_data_out),
`else
    .cam_mshr_data_out      (cam_mshr_data_out),
    .pending_mshr_data_out  (pending_mshr_data_out),
`endif
    .mshr_inv_counter_out   (mshr_inv_counter_out),
    .mshr_empty_slots       (mshr_empty_slots),
    .mshr_pending           (mshr_pending),
    .mshr_pending_index     (mshr_pending_index),
    .mshr_empty_index       (mshr_empty_index),

    `ifndef NO_RTL_CSM
    .broadcast_counter_zero (broadcast_counter_zero1),
    .broadcast_counter_max  (broadcast_counter_max1),
    .broadcast_counter_avail(broadcast_counter_avail1),
    .broadcast_chipid_out   (broadcast_chipid_out1),
    .broadcast_x_out        (broadcast_x_out1),
    .broadcast_y_out        (broadcast_y_out1),
    `endif

    .state_data_out         (state_data_out),
    .tag_data_out           (tag_data_out),
    .dir_data_out           (dir_data_out),
    .data_data_out          (data_data_out),

    .l2_access_valid        (l2_access_valid),
    .l2_miss_valid          (l2_miss_valid),
    .data_ecc_corr_error    (data_ecc_corr_error),
    .data_ecc_uncorr_error  (data_ecc_uncorr_error),
    .data_ecc_addr          (data_ecc_addr),
    .error_addr             (error_addr),

    .reg_rd_en              (reg_rd_en),
    .reg_wr_en              (reg_wr_en),
    .reg_rd_addr_type       (reg_rd_addr_type),
    .reg_wr_addr_type       (reg_wr_addr_type),

    .reg_data_out           (reg_data_out),
    .reg_data_in            (reg_data_in),

    .mshr_cam_en            (mshr_cam_en_p1),
    .mshr_wr_state_en       (mshr_wr_state_en_p1),
    .mshr_wr_data_en        (mshr_wr_data_en_p1),
    .mshr_pending_ready     (mshr_pending_ready_p1),
    .mshr_state_in          (mshr_state_in_p1),
    .mshr_data_in           (mshr_data_in_p1),
    .mshr_data_mask_in      (mshr_data_mask_in_p1),
    .mshr_inv_counter_rd_index_in(mshr_inv_counter_rd_index_in_p1),
    .mshr_wr_index_in       (mshr_wr_index_in_p1),
    .mshr_addr_in           (mshr_addr_in_p1),

    .state_rd_en            (state_rd_en_p1),
    .state_wr_en            (state_wr_en_p1),
    .state_rd_addr          (state_rd_addr_p1),
    .state_wr_addr          (state_wr_addr_p1),
    .state_data_in          (state_data_in_p1),
    .state_data_mask_in     (state_data_mask_in_p1),

    .tag_clk_en             (tag_clk_en_p1),
    .tag_rdw_en             (tag_rdw_en_p1),
    .tag_addr               (tag_addr_p1),
    .tag_data_in            (tag_data_in_p1),
    .tag_data_mask_in       (tag_data_mask_in_p1),

    .dir_clk_en             (dir_clk_en_p1),
    .dir_rdw_en             (dir_rdw_en_p1),
    .dir_addr               (dir_addr_p1),
    .dir_data_in            (dir_data_in_p1),
    .dir_data_mask_in       (dir_data_mask_in_p1),

    `ifndef NO_RTL_CSM
    .broadcast_counter_op   (broadcast_counter_op_p1),
    .broadcast_counter_op_val(broadcast_counter_op_val_p1),

    .smc_rd_en              (smc_rd_en),
    .smc_rd_addr_in         (smc_rd_addr_in),
    .smc_rd_diag_en         (smc_rd_diag_en),
    .smc_flush_en           (smc_flush_en),
    .smc_addr_op            (smc_addr_op),
    .smc_wr_diag_en         (smc_wr_diag_en),
    .smc_wr_en              (smc_wr_en_p1),
    .smc_wr_addr_in         (smc_wr_addr_in_p1),
    .smc_data_in            (smc_data_in_p1),
    .smc_hit                (smc_hit),
    .smc_data_out           (smc_data_out),
    .smc_valid_out          (smc_valid_out),
    .smc_tag_out            (smc_tag_out),
    `endif

    .data_clk_en            (data_clk_en_p1),
    .data_rdw_en            (data_rdw_en_p1),
    .data_addr              (data_addr_p1),
    .data_data_in           (data_data_in_p1),
    .data_data_mask_in      (data_data_mask_in_p1)

);



l2_pipe2 pipe2(
    .clk                    (clk),
    .rst_n                  (rst_n),
    `ifndef NO_RTL_CSM
    .csm_en                 (csm_en),
    `endif
    .noc_valid_in           (noc3_valid_in),
    .noc_data_in            (noc3_data_in),
    .noc_ready_in           (noc3_ready_in),

`ifdef NO_L2_CAM_MSHR
    .mshr_state_out         (mshr_state_out),
    .mshr_data_out          (mshr_data_out),
`else
    .mshr_state_out         (rd_mshr_state_out),
    .mshr_data_out          (rd_mshr_data_out),
`endif

    `ifndef NO_RTL_CSM
    .broadcast_counter_zero (broadcast_counter_zero2),
    .broadcast_counter_max  (broadcast_counter_max2),
    .broadcast_chipid_out   (broadcast_chipid_out2),
    .broadcast_x_out        (broadcast_x_out2),
    .broadcast_y_out        (broadcast_y_out2),
    `endif

    .state_data_out         (state_data_out),
    .tag_data_out           (tag_data_out),
    .dir_data_out           (dir_data_out),

    .mshr_rd_en             (mshr_rd_en_p2),
    .mshr_wr_state_en       (mshr_wr_state_en_p2),
    .mshr_wr_data_en        (mshr_wr_data_en_p2),
    .mshr_inc_counter_en    (mshr_inc_counter_en_p2),
    .mshr_state_in          (mshr_state_in_p2),
    .mshr_data_in           (mshr_data_in_p2),
    .mshr_data_mask_in      (mshr_data_mask_in_p2),
    .mshr_rd_index_in       (mshr_rd_index_in_p2),
    .mshr_wr_index_in       (mshr_wr_index_in_p2),

    .state_rd_en            (state_rd_en_p2),
    .state_wr_en            (state_wr_en_p2),
    .state_rd_addr          (state_rd_addr_p2),
    .state_wr_addr          (state_wr_addr_p2),
    .state_data_in          (state_data_in_p2),
    .state_data_mask_in     (state_data_mask_in_p2),

    .tag_clk_en             (tag_clk_en_p2),
    .tag_rdw_en             (tag_rdw_en_p2),
    .tag_addr               (tag_addr_p2),
    .tag_data_in            (tag_data_in_p2),
    .tag_data_mask_in       (tag_data_mask_in_p2),

    .dir_clk_en             (dir_clk_en_p2),
    .dir_rdw_en             (dir_rdw_en_p2),
    .dir_addr               (dir_addr_p2),
    .dir_data_in            (dir_data_in_p2),
    .dir_data_mask_in       (dir_data_mask_in_p2),

    .data_clk_en            (data_clk_en_p2),
    .data_rdw_en            (data_rdw_en_p2),
    .data_addr              (data_addr_p2),
    .data_data_in           (data_data_in_p2),
    .data_data_mask_in      (data_data_mask_in_p2),


    `ifndef NO_RTL_CSM
    .broadcast_counter_op   (broadcast_counter_op_p2),
    .broadcast_counter_op_val(broadcast_counter_op_val_p2),

    .smc_wr_en              (smc_wr_en_p2),
    .smc_wr_addr_in         (smc_wr_addr_in_p2),
    .smc_data_in            (smc_data_in_p2),
    `endif

    .valid_S1               (pipe2_valid_S1),
    .valid_S2               (pipe2_valid_S2),
    .valid_S3               (pipe2_valid_S3),
    .msg_type_S1            (pipe2_msg_type_S1),
    .msg_type_S2            (pipe2_msg_type_S2),
    .msg_type_S3            (pipe2_msg_type_S3),
    .addr_S1                (pipe2_addr_S1),
    .addr_S2                (pipe2_addr_S2),
    .addr_S3                (pipe2_addr_S3),
    .active_S1              (active_S1),
    .active_S2              (active_S2),
    .active_S3              (active_S3)
);

endmodule
