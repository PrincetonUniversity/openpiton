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
//  Filename      : l2_pipe1.v
//  Created On    : 2014-02-20
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : Pipeline 1 for the L2 cache
//
//
//====================================================================================================


`include "l2.tmp.h"
`include "define.tmp.h"

module l2_pipe1(

    input wire clk,
    input wire rst_n,
    input wire [`NOC_NODEID_WIDTH-1:0] my_nodeid,
    `ifndef NO_RTL_CSM
    input wire csm_en,
    `endif
    input wire [`L2_SMT_BASE_ADDR_WIDTH-1:0] smt_base_addr,
  
   //inputs from NOC1
   
    input wire noc_valid_in,
    input wire [`NOC_DATA_WIDTH-1:0] noc_data_in,
    output wire noc_ready_in,
    

    //outputs to NOC2
   
    output wire noc_valid_out,
    output wire [`NOC_DATA_WIDTH-1:0] noc_data_out,
    input wire  noc_ready_out,

    input wire pipe2_valid_S1,
    input wire pipe2_valid_S2,
    input wire pipe2_valid_S3,
    input wire [`MSG_TYPE_WIDTH-1:0] pipe2_msg_type_S1,
    input wire [`MSG_TYPE_WIDTH-1:0] pipe2_msg_type_S2,
    input wire [`MSG_TYPE_WIDTH-1:0] pipe2_msg_type_S3,
    input wire [`PHY_ADDR_WIDTH-1:0] pipe2_addr_S1,
    input wire [`PHY_ADDR_WIDTH-1:0] pipe2_addr_S2,
    input wire [`PHY_ADDR_WIDTH-1:0] pipe2_addr_S3,
    input wire global_stall_S1,
    input wire global_stall_S2,
    input wire global_stall_S4,

    input wire mshr_hit,
`ifdef NO_L2_CAM_MSHR
    input wire [`L2_MSHR_ARRAY_WIDTH-1:0] mshr_data_out,
`else
    input wire [`L2_MSHR_ARRAY_WIDTH-1:0] cam_mshr_data_out,
    input wire [`L2_MSHR_ARRAY_WIDTH-1:0] pending_mshr_data_out,
`endif // L2_CAM_MSHR
    input wire [`L2_OWNER_BITS-1:0] mshr_inv_counter_out,
    input wire [`L2_MSHR_INDEX_WIDTH:0] mshr_empty_slots,
    input wire mshr_pending,
    input wire [`L2_MSHR_INDEX_WIDTH-1:0] mshr_pending_index,
    input wire [`L2_MSHR_INDEX_WIDTH-1:0] mshr_empty_index,

    `ifndef NO_RTL_CSM
    input wire broadcast_counter_zero,
    input wire broadcast_counter_max,
    input wire broadcast_counter_avail,
    input wire [`MSG_SRC_CHIPID_WIDTH-1:0] broadcast_chipid_out,
    input wire [`MSG_SRC_X_WIDTH-1:0] broadcast_x_out,
    input wire [`MSG_SRC_Y_WIDTH-1:0] broadcast_y_out,
    `endif

    input wire [`L2_STATE_ARRAY_WIDTH-1:0] state_data_out,
    
    input wire [`L2_TAG_ARRAY_WIDTH-1:0] tag_data_out,

    input wire [`L2_DIR_ARRAY_WIDTH-1:0] dir_data_out,

    input wire [`L2_DATA_ARRAY_WIDTH-1:0] data_data_out,

    `ifndef NO_RTL_CSM
    input wire smc_hit,
    input wire [`L2_SMC_DATA_OUT_WIDTH-1:0] smc_data_out,
    input wire [`L2_SMC_VALID_WIDTH-1:0] smc_valid_out,
    input wire [`L2_SMC_TAG_WIDTH-1:0] smc_tag_out,
    `endif

    input wire [`L2_P1_DATA_BUF_IN_WIDTH-1:0] reg_data_out,

    output wire mshr_cam_en,
    output wire mshr_wr_state_en,
    output wire mshr_wr_data_en,
    output wire mshr_pending_ready,
    output wire [`L2_MSHR_STATE_BITS-1:0] mshr_state_in,
    output wire [`L2_MSHR_ARRAY_WIDTH-1:0] mshr_data_in,
    output wire [`L2_MSHR_ARRAY_WIDTH-1:0] mshr_data_mask_in,
    output wire [`L2_MSHR_INDEX_WIDTH-1:0] mshr_inv_counter_rd_index_in,
    output wire [`L2_MSHR_INDEX_WIDTH-1:0] mshr_wr_index_in,
    output wire [`L2_MSHR_ADDR_IN_WIDTH-1:0] mshr_addr_in,

    output wire state_rd_en,
    output wire state_wr_en,
    output wire [`L2_STATE_INDEX_WIDTH-1:0] state_rd_addr,
    output wire [`L2_STATE_INDEX_WIDTH-1:0] state_wr_addr,
    output wire [`L2_STATE_ARRAY_WIDTH-1:0] state_data_in,
    output wire [`L2_STATE_ARRAY_WIDTH-1:0] state_data_mask_in,


    output wire tag_clk_en,
    output wire tag_rdw_en,
    output wire [`L2_TAG_INDEX_WIDTH-1:0] tag_addr,
    output wire [`L2_TAG_ARRAY_WIDTH-1:0] tag_data_in,
    output wire [`L2_TAG_ARRAY_WIDTH-1:0] tag_data_mask_in,

    output wire dir_clk_en,
    output wire dir_rdw_en,
    output wire [`L2_DIR_INDEX_WIDTH-1:0] dir_addr,
    output wire [`L2_DIR_ARRAY_WIDTH-1:0] dir_data_in,
    output wire [`L2_DIR_ARRAY_WIDTH-1:0] dir_data_mask_in,

    output wire data_clk_en,
    output wire data_rdw_en,
    output wire [`L2_DATA_INDEX_WIDTH-1:0] data_addr,
    output wire [`L2_DATA_ARRAY_WIDTH-1:0] data_data_in,
    output wire [`L2_DATA_ARRAY_WIDTH-1:0] data_data_mask_in,

    `ifndef NO_RTL_CSM
    output wire [`CS_OP_WIDTH-1:0] broadcast_counter_op,
    output wire broadcast_counter_op_val,
    `endif

    `ifndef NO_RTL_CSM
    output wire smc_rd_en,
    output wire [`L2_SMC_ADDR_WIDTH-1:0] smc_rd_addr_in,
    output wire smc_rd_diag_en,
    output wire smc_flush_en,
    output wire [`L2_ADDR_OP_WIDTH-1:0] smc_addr_op,
    output wire smc_wr_en,
    output wire smc_wr_diag_en,
    output wire [`L2_SMC_ADDR_WIDTH-1:0] smc_wr_addr_in,
    output wire [`L2_SMC_DATA_IN_WIDTH-1:0] smc_data_in,
    `endif

    output wire l2_access_valid,
    output wire l2_miss_valid,
    output wire data_ecc_corr_error,
    output wire data_ecc_uncorr_error,
    output wire [`L2_DATA_INDEX_WIDTH-1:0] data_ecc_addr,
    output wire [`PHY_ADDR_WIDTH-1:0] error_addr,

    output wire reg_rd_en,
    output wire reg_wr_en,
    output wire [`L2_ADDR_TYPE_WIDTH-1:0] reg_rd_addr_type,
    output wire [`L2_ADDR_TYPE_WIDTH-1:0] reg_wr_addr_type,
    output wire [`L2_P1_DATA_BUF_IN_WIDTH-1:0] reg_data_in

);


wire [`MSG_TYPE_WIDTH-1:0] msg_type;
wire [`MSG_LENGTH_WIDTH-1:0] msg_length;
wire [`MSG_MSHRID_WIDTH-1:0] msg_mshrid;
wire [`MSG_DATA_SIZE_WIDTH-1:0] msg_data_size;
wire [`MSG_CACHE_TYPE_WIDTH-1:0] msg_cache_type;
wire [`PHY_ADDR_WIDTH-1:0] msg_addr;
wire [`MSG_SRC_CHIPID_WIDTH-1:0] msg_src_chipid;
wire [`MSG_SRC_X_WIDTH-1:0] msg_src_x;
wire [`MSG_SRC_Y_WIDTH-1:0] msg_src_y;
wire [`MSG_SRC_FBITS_WIDTH-1:0] msg_src_fbits;
wire [`MSG_SDID_WIDTH-1:0] msg_sdid;
wire [`MSG_LSID_WIDTH-1:0] msg_lsid;

`ifdef NO_L2_CAM_MSHR
wire [`MSG_TYPE_WIDTH-1:0] mshr_msg_type;
wire [`MSG_MSHRID_WIDTH-1:0] mshr_mshrid;
wire [`MSG_DATA_SIZE_WIDTH-1:0] mshr_data_size;
wire [`MSG_CACHE_TYPE_WIDTH-1:0] mshr_cache_type;
wire [`PHY_ADDR_WIDTH-1:0] mshr_addr;
wire [`L2_WAYS_WIDTH-1:0] mshr_way;
wire [`MSG_L2_MISS_BITS-1:0] mshr_l2_miss;
wire [`MSG_SRC_CHIPID_WIDTH-1:0] mshr_src_chipid;
wire [`MSG_SRC_X_WIDTH-1:0] mshr_src_x;
wire [`MSG_SRC_Y_WIDTH-1:0] mshr_src_y;
wire [`MSG_SRC_FBITS_WIDTH-1:0] mshr_src_fbits;
wire [`MSG_SDID_WIDTH-1:0] mshr_sdid;
wire [`MSG_LSID_WIDTH-1:0] mshr_lsid;
wire [`MSG_LSID_WIDTH-1:0] mshr_miss_lsid;
`else
wire [`MSG_TYPE_WIDTH-1:0] cam_mshr_msg_type;
wire [`MSG_MSHRID_WIDTH-1:0] cam_mshr_mshrid;
wire [`MSG_DATA_SIZE_WIDTH-1:0] cam_mshr_data_size;
wire [`MSG_CACHE_TYPE_WIDTH-1:0] cam_mshr_cache_type;
wire [`PHY_ADDR_WIDTH-1:0] cam_mshr_addr;
wire [`L2_WAYS_WIDTH-1:0] cam_mshr_way;
wire [`MSG_L2_MISS_BITS-1:0] cam_mshr_l2_miss;
wire [`MSG_SRC_CHIPID_WIDTH-1:0] cam_mshr_src_chipid;
wire [`MSG_SRC_X_WIDTH-1:0] cam_mshr_src_x;
wire [`MSG_SRC_Y_WIDTH-1:0] cam_mshr_src_y;
wire [`MSG_SRC_FBITS_WIDTH-1:0] cam_mshr_src_fbits;
wire [`MSG_SDID_WIDTH-1:0] cam_mshr_sdid;
wire [`MSG_LSID_WIDTH-1:0] cam_mshr_lsid;
wire [`MSG_LSID_WIDTH-1:0] cam_mshr_miss_lsid;
`endif // L2_CAM_MSHR
`ifndef NO_RTL_CSM
`ifdef NO_L2_CAM_MSHR
wire mshr_smc_miss;
`else
wire cam_mshr_smc_miss;
`endif // L2_CAM_MSHR
`endif
`ifdef NO_L2_CAM_MSHR
wire mshr_recycled;
`else
wire cam_mshr_recycled;

wire [`MSG_TYPE_WIDTH-1:0] pending_mshr_msg_type;
wire [`MSG_MSHRID_WIDTH-1:0] pending_mshr_mshrid;
wire [`MSG_DATA_SIZE_WIDTH-1:0] pending_mshr_data_size;
wire [`MSG_CACHE_TYPE_WIDTH-1:0] pending_mshr_cache_type;
wire [`PHY_ADDR_WIDTH-1:0] pending_mshr_addr;
wire [`L2_WAYS_WIDTH-1:0] pending_mshr_way;
wire [`MSG_L2_MISS_BITS-1:0] pending_mshr_l2_miss;
wire [`MSG_SRC_CHIPID_WIDTH-1:0] pending_mshr_src_chipid;
wire [`MSG_SRC_X_WIDTH-1:0] pending_mshr_src_x;
wire [`MSG_SRC_Y_WIDTH-1:0] pending_mshr_src_y;
wire [`MSG_SRC_FBITS_WIDTH-1:0] pending_mshr_src_fbits;
wire [`MSG_SDID_WIDTH-1:0] pending_mshr_sdid;
wire [`MSG_LSID_WIDTH-1:0] pending_mshr_lsid;
wire [`MSG_LSID_WIDTH-1:0] pending_mshr_miss_lsid;
`ifndef NO_RTL_CSM
wire pending_mshr_smc_miss;
`endif
wire pending_mshr_recycled;
`endif // L2_CAM_MSHR

wire msg_header_valid;
wire [`L2_P1_HEADER_BUF_IN_WIDTH-1:0] msg_header;
wire msg_header_ready;

wire msg_data_valid;
wire [`L2_P1_DATA_BUF_IN_WIDTH-1:0] msg_data;
wire msg_data_ready;


wire valid_S1; 
wire stall_S1;  
wire msg_from_mshr_S1;
wire [`PHY_ADDR_WIDTH-1:0] addr_S1;
wire dis_flush_S1;


wire [`L2_AMO_ALU_OP_WIDTH-1:0] amo_alu_op_S2;

wire valid_S2; 
wire stall_S2;  
wire stall_before_S2; 
wire stall_real_S2; 
wire msg_from_mshr_S2;
wire [`MSG_TYPE_WIDTH-1:0] msg_type_S2;
wire [`MSG_DATA_SIZE_WIDTH-1:0] data_size_S2;
wire [`MSG_CACHE_TYPE_WIDTH-1:0] cache_type_S2;
wire state_owner_en_S2;
wire [`CS_OP_WIDTH-1:0] state_owner_op_S2;
wire state_subline_en_S2;
wire [`CS_OP_WIDTH-1:0] state_subline_op_S2;
wire state_di_en_S2;
wire state_vd_en_S2;
wire [`L2_VD_BITS-1:0] state_vd_S2;
wire state_mesi_en_S2;
wire [`L2_MESI_BITS-1:0] state_mesi_S2;
wire state_lru_en_S2;
wire [`L2_LRU_OP_BITS-1:0] state_lru_op_S2;
wire state_rb_en_S2;
wire l2_ifill_32B_S2;
wire [`L2_DATA_SUBLINE_WIDTH-1:0] l2_load_data_subline_S2;
wire [`PHY_ADDR_WIDTH-1:0] addr_S2;
wire l2_tag_hit_S2;
wire l2_evict_S2;
wire l2_wb_S2;
wire [`L2_MESI_BITS-1:0] l2_way_state_mesi_S2;
wire [`L2_VD_BITS-1:0] l2_way_state_vd_S2;
wire [`L2_DI_BIT-1:0] l2_way_state_cache_type_S2;
wire [`L2_SUBLINE_BITS-1:0] l2_way_state_subline_S2;
wire [`CS_OP_WIDTH-1:0] dir_op_S2;
wire req_from_owner_S2;
wire addr_l2_aligned_S2;
wire special_addr_type_S2;
wire [`MSG_LSID_WIDTH-1:0] lsid_S2;
wire state_load_sdid_S2;


wire valid_S3; 
wire stall_S3;  
wire stall_before_S3; 
wire [`PHY_ADDR_WIDTH-1:0] addr_S3;

wire valid_S4;    
wire stall_S4;
wire stall_before_S4; 
wire [`L2_OWNER_BITS-1:0] dir_sharer_S4;
wire [`L2_OWNER_BITS-1:0] dir_sharer_counter_S4;
wire cas_cmp_en_S4;
wire [`MSG_DATA_SIZE_WIDTH-1:0] cas_cmp_data_size_S4;
wire [`PHY_ADDR_WIDTH-1:0] addr_S4;
wire l2_evict_S4;
wire l2_tag_hit_S4;
wire [`L2_MESI_BITS-1:0] l2_way_state_mesi_S4;
wire [`L2_OWNER_BITS-1:0] l2_way_state_owner_S4;
wire [`L2_VD_BITS-1:0] l2_way_state_vd_S4;
wire [`L2_SUBLINE_BITS-1:0] l2_way_state_subline_S4;
wire [`L2_DI_BIT-1:0] l2_way_state_cache_type_S4;
wire [`MSG_MSHRID_WIDTH-1:0] mshrid_S4;
wire req_from_owner_S4;
wire cas_cmp_S4;
wire atomic_read_data_en_S4;
wire [`MSG_TYPE_WIDTH-1:0] msg_type_S4;
wire [`MSG_DATA_SIZE_WIDTH-1:0] data_size_S4;
wire [`MSG_CACHE_TYPE_WIDTH-1:0] cache_type_S4;
wire [`MSG_L2_MISS_BITS-1:0] l2_miss_S4;
wire [`MSG_LSID_WIDTH-1:0] mshr_miss_lsid_S4;
wire [`MSG_LSID_WIDTH-1:0] lsid_S4;
wire special_addr_type_S4;
wire state_wr_sel_S4;
wire [`L2_DIR_ARRAY_WIDTH-1:0] dir_data_S4;
wire [`L2_DIR_ARRAY_WIDTH-1:0] dir_data_sel_S4;
`ifndef NO_RTL_CSM
wire smc_miss_S4;
wire stall_smc_buf_S4;
`endif    
wire msg_from_mshr_S4;
wire req_recycle_S4;
wire inv_fwd_pending_S4;

wire msg_send_valid;
wire msg_send_ready;
wire [`L2_P1_BUF_OUT_MODE_WIDTH-1:0] msg_send_mode;
wire [`MSG_TYPE_WIDTH-1:0] msg_send_type;
wire [`MSG_TYPE_WIDTH-1:0] msg_send_type_pre;
wire [`MSG_LENGTH_WIDTH-1:0] msg_send_length;
wire [`MSG_DATA_SIZE_WIDTH-1:0] msg_send_data_size;
wire [`MSG_CACHE_TYPE_WIDTH-1:0] msg_send_cache_type;
wire [`MSG_L2_MISS_BITS-1:0] msg_send_l2_miss;
wire [`MSG_MESI_BITS-1:0] msg_send_mesi;
wire [`MSG_MSHRID_WIDTH-1:0] msg_send_mshrid;
wire [`MSG_SUBLINE_VECTOR_WIDTH-1:0] msg_send_subline_vector;
wire [`PHY_ADDR_WIDTH-1:0] msg_send_addr;
wire [`MSG_SRC_CHIPID_WIDTH-1:0] msg_send_dst_chipid;
wire [`MSG_SRC_X_WIDTH-1:0] msg_send_dst_x;
wire [`MSG_SRC_Y_WIDTH-1:0] msg_send_dst_y;
wire [`MSG_SRC_FBITS_WIDTH-1:0] msg_send_dst_fbits;
wire [`NOC_DATA_WIDTH*2-1:0] msg_send_data;
wire [`NOC_DATA_WIDTH*3-1:0] msg_send_header;


assign error_addr = addr_S4;

l2_pipe1_buf_in buf_in(
    .clk                    (clk),
    .rst_n                  (rst_n),

    .valid_in               (noc_valid_in),
    .data_in                (noc_data_in),
    .ready_in               (noc_ready_in),

    .msg_header_valid_out   (msg_header_valid),
    .msg_header_out         (msg_header),
    .msg_header_ready_out   (msg_header_ready),

    .msg_data_valid_out     (msg_data_valid),
    .msg_data_out           (msg_data),
    .msg_data_ready_out     (msg_data_ready)
);


l2_decoder decoder(
    .msg_header         (msg_header),
    .msg_type           (msg_type),
    .msg_length         (msg_length),
    .msg_mshrid         (msg_mshrid),
    .msg_data_size      (msg_data_size),
    .msg_cache_type     (msg_cache_type),
    .msg_subline_vector (),
    .msg_mesi           (),
    .msg_l2_miss        (),
    .msg_subline_id     (),
    .msg_last_subline   (),
    .msg_addr           (msg_addr),
    .msg_src_chipid     (msg_src_chipid),
    .msg_src_x          (msg_src_x),
    .msg_src_y          (msg_src_y),
    .msg_src_fbits      (msg_src_fbits),
    .msg_sdid           (msg_sdid),
    .msg_lsid           (msg_lsid)
);

`ifdef NO_L2_CAM_MSHR
l2_mshr_decoder mshr_decoder(

    .data_in            (mshr_data_out),
    .addr_out           (mshr_addr),
    .way_out            (mshr_way),
    .mshrid_out         (mshr_mshrid),
    .cache_type_out     (mshr_cache_type),
    .data_size_out      (mshr_data_size),
    .msg_type_out       (mshr_msg_type),
    .msg_l2_miss_out    (mshr_l2_miss),
    .src_chipid_out     (mshr_src_chipid),
    .src_x_out          (mshr_src_x),
    .src_y_out          (mshr_src_y),
    .src_fbits_out      (mshr_src_fbits),
    .sdid_out           (mshr_sdid),
    .lsid_out           (mshr_lsid),
    .miss_lsid_out      (mshr_miss_lsid),
    `ifndef NO_RTL_CSM
    .smc_miss_out       (mshr_smc_miss),
    `else
    .smc_miss_out       (0),
    `endif
    .recycled           (mshr_recycled),
    .inv_fwd_pending    ()
);
`else
// reg [`L2_MSHR_ARRAY_WIDTH-1:0] mshr_data_out;
// always @ * begin
//     if (mshr_cam_en)
//         mshr_data_out = cam_mshr_data_out;
//     else
//         mshr_data_out = pending_mshr_data_out;
// end

l2_mshr_decoder cam_mshr_decoder(

    // .cam_data_in            (cam_mshr_data_out),
    // .pending_data_in            (pending_mshr_data_out),
    .data_in            (cam_mshr_data_out),
    .addr_out           (cam_mshr_addr),
    .way_out            (cam_mshr_way),
    .mshrid_out         (cam_mshr_mshrid),
    .cache_type_out     (cam_mshr_cache_type), 
    .data_size_out      (cam_mshr_data_size),
    .msg_type_out       (cam_mshr_msg_type),
    .msg_l2_miss_out    (cam_mshr_l2_miss),
    .src_chipid_out     (cam_mshr_src_chipid),
    .src_x_out          (cam_mshr_src_x),
    .src_y_out          (cam_mshr_src_y),
    .src_fbits_out      (cam_mshr_src_fbits),
    .sdid_out           (cam_mshr_sdid),
    .lsid_out           (cam_mshr_lsid),
    .miss_lsid_out      (cam_mshr_miss_lsid),
    `ifndef NO_RTL_CSM
    .smc_miss_out       (cam_mshr_smc_miss),
    `else
    .smc_miss_out       (0),
    `endif
    .recycled           (cam_mshr_recycled),
    .inv_fwd_pending    ()
);

l2_mshr_decoder pending_mshr_decoder(

    // .cam_data_in            (cam_mshr_data_out),
    // .pending_data_in            (pending_mshr_data_out),
    .data_in            (pending_mshr_data_out),
    .addr_out           (pending_mshr_addr),
    .way_out            (pending_mshr_way),
    .mshrid_out         (pending_mshr_mshrid),
    .cache_type_out     (pending_mshr_cache_type), 
    .data_size_out      (pending_mshr_data_size),
    .msg_type_out       (pending_mshr_msg_type),
    .msg_l2_miss_out    (pending_mshr_l2_miss),
    .src_chipid_out     (pending_mshr_src_chipid),
    .src_x_out          (pending_mshr_src_x),
    .src_y_out          (pending_mshr_src_y),
    .src_fbits_out      (pending_mshr_src_fbits),
    .sdid_out           (pending_mshr_sdid),
    .lsid_out           (pending_mshr_lsid),
    .miss_lsid_out      (pending_mshr_miss_lsid),
    `ifndef NO_RTL_CSM
    .smc_miss_out       (pending_mshr_smc_miss),
    `else
    .smc_miss_out       (0),
    `endif
    .recycled           (pending_mshr_recycled),
    .inv_fwd_pending    ()
);
`endif // L2_CAM_MSHR

l2_pipe1_ctrl ctrl(

    .clk                        (clk),
    .rst_n                      (rst_n),
    `ifndef NO_RTL_CSM
    .csm_en                     (csm_en),
    `endif

    .pipe2_valid_S1             (pipe2_valid_S1),
    .pipe2_valid_S2             (pipe2_valid_S2),
    .pipe2_valid_S3             (pipe2_valid_S3),
    .pipe2_msg_type_S1          (pipe2_msg_type_S1),
    .pipe2_msg_type_S2          (pipe2_msg_type_S2),
    .pipe2_msg_type_S3          (pipe2_msg_type_S3),
    .pipe2_addr_S1              (pipe2_addr_S1),
    .pipe2_addr_S2              (pipe2_addr_S2),
    .pipe2_addr_S3              (pipe2_addr_S3),

    .global_stall_S1            (global_stall_S1),
    .msg_header_valid_S1        (msg_header_valid),
    .msg_type_S1                (msg_type),
    .msg_data_size_S1           (msg_data_size),
    .msg_cache_type_S1          (msg_cache_type),
    .mshr_hit_S1                (mshr_hit),
`ifdef NO_L2_CAM_MSHR
    .mshr_msg_type_S1           (mshr_msg_type),
    .mshr_l2_miss_S1            (mshr_l2_miss),
    .mshr_data_size_S1          (mshr_data_size),
    .mshr_cache_type_S1         (mshr_cache_type),
`else
    .cam_mshr_msg_type_S1       (cam_mshr_msg_type),
    .cam_mshr_l2_miss_S1        (cam_mshr_l2_miss),
    .cam_mshr_data_size_S1      (cam_mshr_data_size),
    .cam_mshr_cache_type_S1     (cam_mshr_cache_type), 
`endif // L2_CAM_MSHR
    .mshr_pending_S1            (mshr_pending),
    .mshr_pending_index_S1      (mshr_pending_index),
    .mshr_empty_slots_S1        (mshr_empty_slots),
    `ifndef NO_RTL_CSM
`ifdef NO_L2_CAM_MSHR
    .mshr_smc_miss_S1           (mshr_smc_miss),
`else
    .cam_mshr_smc_miss_S1       (cam_mshr_smc_miss),
`endif // L2_CAM_MSHR
    `endif
`ifndef NO_L2_CAM_MSHR
    .pending_mshr_msg_type_S1           (pending_mshr_msg_type),
    .pending_mshr_l2_miss_S1            (pending_mshr_l2_miss),
    .pending_mshr_data_size_S1          (pending_mshr_data_size),
    .pending_mshr_cache_type_S1         (pending_mshr_cache_type), 
    `ifndef NO_RTL_CSM
    .pending_mshr_smc_miss_S1           (pending_mshr_smc_miss),
    `endif
`endif // L2_CAM_MSHR
    .msg_data_valid_S1          (msg_data_valid),
    .addr_S1                    (addr_S1),
   
    .global_stall_S2            (global_stall_S2),
    .l2_tag_hit_S2              (l2_tag_hit_S2),
    .l2_evict_S2                (l2_evict_S2),
    .l2_wb_S2                   (l2_wb_S2),
    .l2_way_state_mesi_S2       (l2_way_state_mesi_S2),
    .l2_way_state_vd_S2         (l2_way_state_vd_S2),
    .l2_way_state_cache_type_S2 (l2_way_state_cache_type_S2),
    .l2_way_state_subline_S2    (l2_way_state_subline_S2),
    .req_from_owner_S2          (req_from_owner_S2),
    .addr_l2_aligned_S2         (addr_l2_aligned_S2),
    .lsid_S2                    (lsid_S2),
    .msg_data_valid_S2          (msg_data_valid),
    .addr_S2                    (addr_S2),

    .dir_data_S3                (dir_data_out),
    .addr_S3                    (addr_S3),

    .global_stall_S4            (global_stall_S4),
    .l2_evict_S4                (l2_evict_S4),
    .l2_tag_hit_S4              (l2_tag_hit_S4),
    .l2_way_state_mesi_S4       (l2_way_state_mesi_S4),
    .l2_way_state_owner_S4      (l2_way_state_owner_S4),
    .l2_way_state_vd_S4         (l2_way_state_vd_S4),
    .l2_way_state_subline_S4    (l2_way_state_subline_S4),
    .l2_way_state_cache_type_S4 (l2_way_state_cache_type_S4),
    .mshrid_S4                  (mshrid_S4),
    .req_from_owner_S4          (req_from_owner_S4),
    .mshr_miss_lsid_S4          (mshr_miss_lsid_S4),
    .lsid_S4                    (lsid_S4),
    .addr_S4                    (addr_S4),
    .cas_cmp_S4                 (cas_cmp_S4),
    .msg_send_ready_S4          (msg_send_ready),
    .mshr_empty_index_S4        (mshr_empty_index),
    
    `ifndef NO_RTL_CSM
    .smc_hit_S4                 (smc_hit),
    .broadcast_counter_zero_S4  (broadcast_counter_zero),
    .broadcast_counter_max_S4   (broadcast_counter_max),
    .broadcast_counter_avail_S4 (broadcast_counter_avail),
    .broadcast_chipid_out_S4    (broadcast_chipid_out),
    .broadcast_x_out_S4         (broadcast_x_out),
    .broadcast_y_out_S4         (broadcast_y_out),
    `endif

    .valid_S1                   (valid_S1),  
    .stall_S1                   (stall_S1),    
    .msg_from_mshr_S1           (msg_from_mshr_S1), 
    .dis_flush_S1               (dis_flush_S1),
    .mshr_cam_en_S1             (mshr_cam_en),
    .mshr_pending_ready_S1      (mshr_pending_ready),
    .msg_header_ready_S1        (msg_header_ready),
    .tag_clk_en_S1              (tag_clk_en),
    .tag_rdw_en_S1              (tag_rdw_en),
    .state_rd_en_S1             (state_rd_en),
    .reg_wr_en_S1               (reg_wr_en),
    .reg_wr_addr_type_S1        (reg_wr_addr_type),


    .valid_S2                   (valid_S2),    
    .stall_S2                   (stall_S2), 
    .stall_before_S2            (stall_before_S2), 
    .stall_real_S2              (stall_real_S2),
    .msg_type_S2                (msg_type_S2),
    .msg_from_mshr_S2           (msg_from_mshr_S2),
    .special_addr_type_S2       (special_addr_type_S2),
    .dir_clk_en_S2              (dir_clk_en),
    .dir_rdw_en_S2              (dir_rdw_en),
    .dir_op_S2                  (dir_op_S2),
    .data_clk_en_S2             (data_clk_en),
    .data_rdw_en_S2             (data_rdw_en),
    .amo_alu_op_S2              (amo_alu_op_S2),
    .data_size_S2               (data_size_S2),
    .cache_type_S2              (cache_type_S2),
    .state_owner_en_S2          (state_owner_en_S2),
    .state_owner_op_S2          (state_owner_op_S2),
    .state_subline_en_S2        (state_subline_en_S2),
    .state_subline_op_S2        (state_subline_op_S2),   
    .state_di_en_S2             (state_di_en_S2),
    .state_vd_en_S2             (state_vd_en_S2),
    .state_vd_S2                (state_vd_S2),
    .state_mesi_en_S2           (state_mesi_en_S2),
    .state_mesi_S2              (state_mesi_S2),
    .state_lru_en_S2            (state_lru_en_S2),
    .state_lru_op_S2            (state_lru_op_S2),
    .state_rb_en_S2             (state_rb_en_S2),
    .state_load_sdid_S2         (state_load_sdid_S2),
    .l2_ifill_32B_S2            (l2_ifill_32B_S2),
    .l2_load_data_subline_S2    (l2_load_data_subline_S2),
    .msg_data_ready_S2          (msg_data_ready),
    `ifndef NO_RTL_CSM
    .smc_wr_en_S2               (smc_wr_en),
    .smc_wr_diag_en_S2          (smc_wr_diag_en),
    .smc_flush_en_S2            (smc_flush_en),
    .smc_addr_op_S2             (smc_addr_op),
    `endif    

    .valid_S3                   (valid_S3),    
    .stall_S3                   (stall_S3), 
    .stall_before_S3            (stall_before_S3), 

    .valid_S4                   (valid_S4),    
    .stall_S4                   (stall_S4), 
    .stall_before_S4            (stall_before_S4),
    `ifndef NO_RTL_CSM 
    .stall_smc_buf_S4           (stall_smc_buf_S4),
    `endif
    .msg_from_mshr_S4           (msg_from_mshr_S4),
    .req_recycle_S4             (req_recycle_S4),
    .inv_fwd_pending_S4         (inv_fwd_pending_S4),
    .dir_sharer_S4              (dir_sharer_S4),
    .dir_sharer_counter_S4      (dir_sharer_counter_S4),
    .cas_cmp_en_S4              (cas_cmp_en_S4),
    .atomic_read_data_en_S4     (atomic_read_data_en_S4),
    .cas_cmp_data_size_S4       (cas_cmp_data_size_S4),
    .msg_send_valid_S4          (msg_send_valid),
    .msg_send_mode_S4           (msg_send_mode),
    .msg_send_type_S4           (msg_send_type),
    .msg_send_type_pre_S4       (msg_send_type_pre),
    .msg_send_length_S4         (msg_send_length),
    .msg_send_data_size_S4      (msg_send_data_size),
    .msg_send_cache_type_S4     (msg_send_cache_type),
    .msg_send_mesi_S4           (msg_send_mesi),
    .msg_send_l2_miss_S4        (msg_send_l2_miss),
    .msg_send_mshrid_S4         (msg_send_mshrid),
    .msg_send_subline_vector_S4 (msg_send_subline_vector),
    .special_addr_type_S4       (special_addr_type_S4),
    .dir_data_sel_S4            (dir_data_sel_S4),
    .dir_data_S4                (dir_data_S4),
    .msg_type_S4                (msg_type_S4),
    .data_size_S4               (data_size_S4),
    .cache_type_S4              (cache_type_S4),
    .l2_miss_S4                 (l2_miss_S4),
    `ifndef NO_RTL_CSM
    .smc_miss_S4                (smc_miss_S4),
    `endif
    .mshr_wr_data_en_S4         (mshr_wr_data_en),
    .mshr_wr_state_en_S4        (mshr_wr_state_en),
    .mshr_state_in_S4           (mshr_state_in),
    .mshr_wr_index_in_S4        (mshr_wr_index_in),    
    .mshr_inv_counter_rd_index_in_S4(mshr_inv_counter_rd_index_in),    
    .state_wr_sel_S4            (state_wr_sel_S4),
    .state_wr_en_S4             (state_wr_en),
    `ifndef NO_RTL_CSM
    .broadcast_counter_op_S4    (broadcast_counter_op),
    .broadcast_counter_op_val_S4(broadcast_counter_op_val),
    `endif
    
    `ifndef NO_RTL_CSM
    .smc_rd_diag_en_buf_S4      (smc_rd_diag_en),
    .smc_rd_en_buf_S4           (smc_rd_en),
    `endif

    .l2_access_valid_S4         (l2_access_valid),
    .l2_miss_valid_S4           (l2_miss_valid),
    .reg_rd_en_S4               (reg_rd_en),
    .reg_rd_addr_type_S4        (reg_rd_addr_type)


);


l2_pipe1_dpath dpath(
    .clk                        (clk),
    .rst_n                      (rst_n),
    `ifndef NO_RTL_CSM
    .csm_en                     (csm_en),
    `endif
    .smt_base_addr              (smt_base_addr),
    
`ifdef NO_L2_CAM_MSHR
    .mshr_addr_S1               (mshr_addr),
    .mshr_mshrid_S1             (mshr_mshrid),
    .mshr_way_S1                (mshr_way),
    .mshr_src_chipid_S1         (mshr_src_chipid),
    .mshr_src_x_S1              (mshr_src_x),
    .mshr_src_y_S1              (mshr_src_y),
    .mshr_src_fbits_S1          (mshr_src_fbits),
    .mshr_sdid_S1               (mshr_sdid),
    .mshr_lsid_S1               (mshr_lsid),
    .mshr_miss_lsid_S1          (mshr_miss_lsid),
    .mshr_recycled_S1           (mshr_recycled),
`else
    .cam_mshr_addr_S1           (cam_mshr_addr),
    .cam_mshr_mshrid_S1         (cam_mshr_mshrid),
    .cam_mshr_way_S1            (cam_mshr_way),
    .cam_mshr_src_chipid_S1     (cam_mshr_src_chipid),
    .cam_mshr_src_x_S1          (cam_mshr_src_x),
    .cam_mshr_src_y_S1          (cam_mshr_src_y),
    .cam_mshr_src_fbits_S1      (cam_mshr_src_fbits),
    .cam_mshr_sdid_S1           (cam_mshr_sdid),
    .cam_mshr_lsid_S1           (cam_mshr_lsid),
    .cam_mshr_miss_lsid_S1      (cam_mshr_miss_lsid),
    .cam_mshr_recycled_S1       (cam_mshr_recycled),
    
    .mshr_pending_S1            (mshr_pending),
    .pending_mshr_addr_S1       (pending_mshr_addr),
    .pending_mshr_mshrid_S1     (pending_mshr_mshrid),
    .pending_mshr_way_S1        (pending_mshr_way),
    .pending_mshr_src_chipid_S1 (pending_mshr_src_chipid),
    .pending_mshr_src_x_S1      (pending_mshr_src_x),
    .pending_mshr_src_y_S1      (pending_mshr_src_y),
    .pending_mshr_src_fbits_S1  (pending_mshr_src_fbits),
    .pending_mshr_sdid_S1       (pending_mshr_sdid),
    .pending_mshr_lsid_S1       (pending_mshr_lsid),
    .pending_mshr_miss_lsid_S1  (pending_mshr_miss_lsid),
    .pending_mshr_recycled_S1   (pending_mshr_recycled),
`endif // L2_CAM_MSHR

    .dis_flush_S1               (dis_flush_S1),
    .msg_addr_S1                (msg_addr),
    .msg_mshrid_S1              (msg_mshrid),
    .msg_src_chipid_S1          (msg_src_chipid),
    .msg_src_x_S1               (msg_src_x),
    .msg_src_y_S1               (msg_src_y),
    .msg_src_fbits_S1           (msg_src_fbits),
    .msg_sdid_S1                (msg_sdid),
    .msg_lsid_S1                (msg_lsid),
    .msg_data_S1                (msg_data),
    .valid_S1                   (valid_S1),
    .stall_S1                   (stall_S1),
    .msg_from_mshr_S1           (msg_from_mshr_S1), 


    .state_data_S2              (state_data_out),
    .tag_data_S2                (tag_data_out),
    .msg_data_S2                (msg_data),
    .msg_type_S2                (msg_type_S2),
    .msg_from_mshr_S2           (msg_from_mshr_S2),
    .special_addr_type_S2       (special_addr_type_S2),
    .data_size_S2               (data_size_S2),
    .cache_type_S2              (cache_type_S2),
    .state_owner_en_S2          (state_owner_en_S2),
    .state_owner_op_S2          (state_owner_op_S2), 
    .state_subline_en_S2        (state_subline_en_S2),
    .state_subline_op_S2        (state_subline_op_S2),
    .state_di_en_S2             (state_di_en_S2),
    .state_vd_en_S2             (state_vd_en_S2),
    .state_vd_S2                (state_vd_S2),
    .state_mesi_en_S2           (state_mesi_en_S2),
    .state_mesi_S2              (state_mesi_S2),
    .state_lru_en_S2            (state_lru_en_S2),
    .state_lru_op_S2            (state_lru_op_S2),
    .state_rb_en_S2             (state_rb_en_S2),
    .state_load_sdid_S2         (state_load_sdid_S2),
    .dir_op_S2                  (dir_op_S2),
    .l2_ifill_32B_S2            (l2_ifill_32B_S2),
    .l2_load_data_subline_S2    (l2_load_data_subline_S2),
    .valid_S2                   (valid_S2),
    .stall_S2                   (stall_S2),
    .stall_before_S2            (stall_before_S2), 
    .data_clk_en_S2             (data_clk_en),
    .stall_real_S2              (stall_real_S2),
    .amo_alu_op_S2              (amo_alu_op_S2),

    .valid_S3                   (valid_S3),
    .stall_S3                   (stall_S3),
    .stall_before_S3            (stall_before_S3), 
    .data_data_S3               (data_data_out),

    .valid_S4                   (valid_S4),
    .stall_S4                   (stall_S4),
    .stall_before_S4            (stall_before_S4),
    `ifndef NO_RTL_CSM 
    .stall_smc_buf_S4           (stall_smc_buf_S4),
    `endif
    .msg_from_mshr_S4           (msg_from_mshr_S4),
    .req_recycle_S4             (req_recycle_S4),
    .inv_fwd_pending_S4         (inv_fwd_pending_S4),
    .cas_cmp_en_S4              (cas_cmp_en_S4),    
    .atomic_read_data_en_S4     (atomic_read_data_en_S4),
    .cas_cmp_data_size_S4       (cas_cmp_data_size_S4),
    .dir_sharer_S4              (dir_sharer_S4),
    .dir_sharer_counter_S4      (dir_sharer_counter_S4),
    .mshr_inv_counter_out_S4    (mshr_inv_counter_out),
    .special_addr_type_S4       (special_addr_type_S4),
    .dir_data_sel_S4            (dir_data_sel_S4),
    .dir_data_S4                (dir_data_S4),
    .msg_send_type_S4           (msg_send_type),
    .msg_send_length_S4         (msg_send_length),
    .my_nodeid_chipid_S4        (my_nodeid[`NOC_NODEID_CHIPID]),
    .my_nodeid_x_S4             (my_nodeid[`NOC_NODEID_X]),
    .my_nodeid_y_S4             (my_nodeid[`NOC_NODEID_Y]),
    .state_wr_sel_S4            (state_wr_sel_S4),
    .msg_type_S4                (msg_type_S4),
    .msg_send_type_pre_S4       (msg_send_type_pre),
    .data_size_S4               (data_size_S4),
    .cache_type_S4              (cache_type_S4),
    .l2_miss_S4                 (l2_miss_S4),

    `ifndef NO_RTL_CSM
    .smc_miss_S4                (smc_miss_S4),
    .smc_data_out_S4            (smc_data_out),
    .smc_valid_out_S4           (smc_valid_out),
    .smc_tag_out_S4             (smc_tag_out),
    `endif
    .reg_data_out_S4            (reg_data_out),
    `ifndef NO_RTL_CSM
    .broadcast_chipid_out_S4    (broadcast_chipid_out),
    .broadcast_x_out_S4         (broadcast_x_out),
    .broadcast_y_out_S4         (broadcast_y_out),
    `endif
 
    .addr_S1                    (addr_S1),
    .mshr_addr_in_S1            (mshr_addr_in),
    .tag_addr_S1                (tag_addr),
    .tag_data_in_S1             (tag_data_in),  
    .tag_data_mask_in_S1        (tag_data_mask_in),
    .state_rd_addr_S1           (state_rd_addr),
    .reg_data_in_S1             (reg_data_in),

    .addr_S2                    (addr_S2),
    .l2_tag_hit_S2              (l2_tag_hit_S2),
    .l2_evict_S2                (l2_evict_S2),
    .l2_wb_S2                   (l2_wb_S2),
    .l2_way_state_mesi_S2       (l2_way_state_mesi_S2),
    .l2_way_state_vd_S2         (l2_way_state_vd_S2),    
    .l2_way_state_cache_type_S2 (l2_way_state_cache_type_S2),
    .l2_way_state_subline_S2    (l2_way_state_subline_S2),
    .req_from_owner_S2          (req_from_owner_S2),
    .addr_l2_aligned_S2         (addr_l2_aligned_S2),
    .lsid_S2                    (lsid_S2),
    .dir_addr_S2                (dir_addr),
    .dir_data_in_S2             (dir_data_in),
    .dir_data_mask_in_S2        (dir_data_mask_in),
    .data_addr_S2               (data_addr),
    .data_data_in_S2            (data_data_in),
    .data_data_mask_in_S2       (data_data_mask_in),

    `ifndef NO_RTL_CSM
    .smc_wr_addr_in_S2          (smc_wr_addr_in),
    .smc_data_in_S2             (smc_data_in),
    `endif

    .addr_S3                    (addr_S3),

    .addr_S4                    (addr_S4),
    .data_addr_S4               (data_ecc_addr),
    .l2_evict_S4                (l2_evict_S4),
    .l2_tag_hit_S4              (l2_tag_hit_S4),
    .l2_way_state_mesi_S4       (l2_way_state_mesi_S4),
    .l2_way_state_owner_S4      (l2_way_state_owner_S4),
    .l2_way_state_vd_S4         (l2_way_state_vd_S4),
    .l2_way_state_subline_S4    (l2_way_state_subline_S4),
    .l2_way_state_cache_type_S4 (l2_way_state_cache_type_S4),
    .mshrid_S4                  (mshrid_S4),
    .req_from_owner_S4          (req_from_owner_S4),
    .mshr_miss_lsid_S4          (mshr_miss_lsid_S4),
    .lsid_S4                    (lsid_S4),
    .corr_error_S4              (data_ecc_corr_error),
    .uncorr_error_S4            (data_ecc_uncorr_error),
    .cas_cmp_S4                 (cas_cmp_S4),
    .msg_send_addr_S4           (msg_send_addr),
    .msg_send_dst_chipid_S4     (msg_send_dst_chipid),
    .msg_send_dst_x_S4          (msg_send_dst_x),
    .msg_send_dst_y_S4          (msg_send_dst_y),
    .msg_send_dst_fbits_S4      (msg_send_dst_fbits),
    .msg_send_data_S4           (msg_send_data),
    .mshr_data_in_S4            (mshr_data_in),
    .mshr_data_mask_in_S4       (mshr_data_mask_in),

    `ifndef NO_RTL_CSM
    .smc_rd_addr_in_buf_S4      (smc_rd_addr_in),
    `endif

    .state_wr_addr_S4           (state_wr_addr),
    .state_data_in_S4           (state_data_in),
    .state_data_mask_in_S4      (state_data_mask_in)

);

l2_encoder encoder(
    .msg_dst_chipid             (msg_send_dst_chipid),
    .msg_dst_x                  (msg_send_dst_x),
    .msg_dst_y                  (msg_send_dst_y),
    .msg_dst_fbits              (msg_send_dst_fbits),
    .msg_length                 (msg_send_length),
    .msg_type                   (msg_send_type),
    .msg_mshrid                 (msg_send_mshrid),
    .msg_data_size              (msg_send_data_size),
    .msg_cache_type             (msg_send_cache_type),
    .msg_subline_vector         (msg_send_subline_vector),
    .msg_mesi                   (msg_send_mesi),
    .msg_l2_miss                (msg_send_l2_miss),
    .msg_subline_id             ({`MSG_SUBLINE_ID_WIDTH{1'b0}}),
    .msg_last_subline           ({`MSG_LAST_SUBLINE_WIDTH{1'b0}}),
    .msg_addr                   (msg_send_addr),
    .msg_src_chipid             (my_nodeid[`NOC_NODEID_CHIPID]),
    .msg_src_x                  (my_nodeid[`NOC_NODEID_X]),
    .msg_src_y                  (my_nodeid[`NOC_NODEID_Y]),
    .msg_src_fbits              (my_nodeid[`NOC_NODEID_FBITS]),
    .msg_sdid                   ({`MSG_SDID_WIDTH{1'b0}}),
    .msg_lsid                   ({`MSG_LSID_WIDTH{1'b0}}),
    .msg_header                 (msg_send_header)
);



l2_pipe1_buf_out buf_out(
    .clk                (clk),
    .rst_n              (rst_n),
    .mode_in            (msg_send_mode),
    .valid_in           (msg_send_valid),
    .data_in            ({msg_send_data, msg_send_header}),
    .ready_in           (msg_send_ready),
    .valid_out          (noc_valid_out),
    .data_out           (noc_data_out),
    .ready_out          (noc_ready_out)
);



endmodule
