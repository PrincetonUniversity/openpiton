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
//  Filename      : l2_pipe2.v
//  Created On    : 2014-04-03
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : Pipeline 2 for the L2 cache
//
//
//====================================================================================================


`include "l2.tmp.h"
`include "define.tmp.h"

module l2_pipe2(

    input wire clk,
    input wire rst_n,
    `ifndef NO_RTL_CSM
    input wire csm_en,
    `endif
    //inputs from NOC3
   
    input wire noc_valid_in,
    input wire [`NOC_DATA_WIDTH-1:0] noc_data_in,
    output wire noc_ready_in,

    input wire [`L2_MSHR_STATE_BITS-1:0] mshr_state_out,
    input wire [`L2_MSHR_ARRAY_WIDTH-1:0] mshr_data_out,

    `ifndef NO_RTL_CSM
    input wire broadcast_counter_zero,
    input wire broadcast_counter_max,
    input wire [`MSG_SRC_CHIPID_WIDTH-1:0] broadcast_chipid_out,
    input wire [`MSG_SRC_X_WIDTH-1:0] broadcast_x_out,
    input wire [`MSG_SRC_Y_WIDTH-1:0] broadcast_y_out,
    `endif

    input wire [`L2_STATE_ARRAY_WIDTH-1:0] state_data_out,
    
    input wire [`L2_TAG_ARRAY_WIDTH-1:0] tag_data_out,

    input wire [`L2_DIR_ARRAY_WIDTH-1:0] dir_data_out,


    output wire mshr_rd_en,
    output wire mshr_wr_state_en,
    output wire mshr_wr_data_en,
    output wire [`L2_MSHR_STATE_BITS-1:0] mshr_state_in,
    output wire [`L2_MSHR_ARRAY_WIDTH-1:0] mshr_data_in,
    output wire [`L2_MSHR_ARRAY_WIDTH-1:0] mshr_data_mask_in,
    output wire [`L2_MSHR_INDEX_WIDTH-1:0] mshr_rd_index_in,
    output wire [`L2_MSHR_INDEX_WIDTH-1:0] mshr_wr_index_in,
    output wire mshr_inc_counter_en,

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

    output wire smc_wr_en,
    output wire [`L2_SMC_ADDR_WIDTH-1:0] smc_wr_addr_in,
    output wire [`L2_SMC_DATA_IN_WIDTH-1:0] smc_data_in,
    `endif

    output wire valid_S1,
    output wire valid_S2,
    output wire valid_S3,

    output wire [`MSG_TYPE_WIDTH-1:0] msg_type_S1,
    output wire [`MSG_TYPE_WIDTH-1:0] msg_type_S2,
    output wire [`MSG_TYPE_WIDTH-1:0] msg_type_S3,

    output wire [`PHY_ADDR_WIDTH-1:0] addr_S1,
    output wire [`PHY_ADDR_WIDTH-1:0] addr_S2,
    output wire [`PHY_ADDR_WIDTH-1:0] addr_S3,

    output wire active_S1,
    output wire active_S2,
    output wire active_S3
);


wire [`MSG_TYPE_WIDTH-1:0] msg_type;
wire [`MSG_LENGTH_WIDTH-1:0] msg_length;
wire [`MSG_MSHRID_WIDTH-1:0] msg_mshrid;
wire [`MSG_DATA_SIZE_WIDTH-1:0] msg_data_size;
wire [`MSG_CACHE_TYPE_WIDTH-1:0] msg_cache_type;
wire [`MSG_SUBLINE_ID_WIDTH-1:0] msg_subline_id;
wire [`MSG_LAST_SUBLINE_WIDTH-1:0] msg_last_subline;
wire [`MSG_MESI_BITS-1:0] msg_mesi;
wire [`PHY_ADDR_WIDTH-1:0] msg_addr;
wire [`MSG_SRC_CHIPID_WIDTH-1:0] msg_src_chipid;
wire [`MSG_SRC_X_WIDTH-1:0] msg_src_x;
wire [`MSG_SRC_Y_WIDTH-1:0] msg_src_y;
wire [`MSG_SRC_FBITS_WIDTH-1:0] msg_src_fbits;
wire [`MSG_SDID_WIDTH-1:0] msg_sdid;
wire [`MSG_LSID_WIDTH-1:0] msg_lsid;


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
`ifndef NO_RTL_CSM
wire mshr_smc_miss;
`endif
wire mshr_recycled;
wire mshr_inv_fwd_pending;

wire msg_header_valid;
wire [`L2_P2_HEADER_BUF_IN_WIDTH-1:0] msg_header;
wire msg_header_ready;

wire msg_data_valid;
wire [`L2_P2_DATA_BUF_IN_WIDTH-1:0] msg_data;
wire msg_data_ready;

//wire valid_S1;
wire stall_S1;
wire msg_from_mshr_S1;
//wire [`PHY_ADDR_WIDTH-1:0] addr_S1;
wire is_same_address_S1;


//wire valid_S2;
wire stall_S2;
wire stall_before_S2;
wire msg_from_mshr_S2;
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
wire dir_clr_en_S2;
wire l2_load_64B_S2;
wire l2_load_32B_S2;
wire [`L2_DATA_SUBLINE_WIDTH-1:0] l2_load_data_subline_S2;
//wire [`PHY_ADDR_WIDTH-1:0] addr_S2;
wire l2_tag_hit_S2;
wire [`L2_WAYS_WIDTH-1:0] l2_way_sel_S2;
wire l2_evict_S2;
wire l2_wb_S2;
wire [`L2_OWNER_BITS-1:0] l2_way_state_owner_S2;
wire [`L2_MESI_BITS-1:0] l2_way_state_mesi_S2;
wire [`L2_VD_BITS-1:0] l2_way_state_vd_S2;
wire [`L2_SUBLINE_BITS-1:0] l2_way_state_subline_S2;
wire [`L2_DI_BIT-1:0] l2_way_state_cache_type_S2;
wire addr_l2_aligned_S2;
wire subline_valid_S2;
wire [`MSG_LSID_WIDTH-1:0] lsid_S2;

//wire valid_S3;
wire stall_S3;
//wire [`PHY_ADDR_WIDTH-1:0] addr_S3;

assign msg_type_S1 = msg_type;


l2_pipe2_buf_in buf_in(
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
    .msg_mesi           (msg_mesi),
    .msg_l2_miss        (),
    .msg_subline_id     (msg_subline_id),
    .msg_last_subline   (msg_last_subline),
    .msg_addr           (msg_addr),
    .msg_src_chipid     (msg_src_chipid),
    .msg_src_x          (msg_src_x),
    .msg_src_y          (msg_src_y),
    .msg_src_fbits      (msg_src_fbits),
    .msg_sdid           (msg_sdid),
    .msg_lsid           (msg_lsid)
);

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
    .smc_miss_out       (),
    `endif    
    .recycled           (mshr_recycled),
    .inv_fwd_pending    (mshr_inv_fwd_pending)

);


l2_pipe2_ctrl ctrl(

    .clk                        (clk),
    .rst_n                      (rst_n),
    `ifndef NO_RTL_CSM
    .csm_en                     (csm_en),
    `endif

    .msg_header_valid_S1        (msg_header_valid),
    .msg_type_S1                (msg_type),
    .msg_length_S1              (msg_length),
    .msg_data_size_S1           (msg_data_size),
    .msg_cache_type_S1          (msg_cache_type),
    .msg_last_subline_S1        (msg_last_subline),
    .msg_mesi_S1                (msg_mesi),
    .mshr_msg_type_S1           (mshr_msg_type),
    .mshr_l2_miss_S1            (mshr_l2_miss),
    .mshr_data_size_S1          (mshr_data_size),
    .mshr_cache_type_S1         (mshr_cache_type),
    `ifndef NO_RTL_CSM 
    .mshr_smc_miss_S1           (mshr_smc_miss),
    `endif
    .mshr_state_out_S1          (mshr_state_out),
    .mshr_inv_fwd_pending_S1    (mshr_inv_fwd_pending),
    .addr_S1                    (addr_S1),
    .is_same_address_S1         (is_same_address_S1),
   
    .l2_tag_hit_S2              (l2_tag_hit_S2),
    .l2_way_sel_S2              (l2_way_sel_S2),
    .l2_wb_S2                   (l2_wb_S2),
    .l2_way_state_owner_S2      (l2_way_state_owner_S2),
    .l2_way_state_mesi_S2       (l2_way_state_mesi_S2),
    .l2_way_state_vd_S2         (l2_way_state_vd_S2),
    .l2_way_state_subline_S2    (l2_way_state_subline_S2),
    .l2_way_state_cache_type_S2 (l2_way_state_cache_type_S2),
    .addr_l2_aligned_S2         (addr_l2_aligned_S2),
    .subline_valid_S2           (subline_valid_S2),
    .msg_data_valid_S2          (msg_data_valid),
    `ifndef NO_RTL_CSM
    .broadcast_counter_zero_S2  (broadcast_counter_zero),
    .broadcast_counter_max_S2   (broadcast_counter_max),
    .broadcast_chipid_out_S2    (broadcast_chipid_out),
    .broadcast_x_out_S2         (broadcast_x_out),
    .broadcast_y_out_S2         (broadcast_y_out),
    `endif
    .lsid_S2                    (lsid_S2),
    .addr_S2                    (addr_S2),


    .addr_S3                    (addr_S3),

    .valid_S1                   (valid_S1),  
    .stall_S1                   (stall_S1), 
    .active_S1                  (active_S1),   
    .msg_from_mshr_S1           (msg_from_mshr_S1), 
    .mshr_rd_en_S1              (mshr_rd_en),
    .msg_header_ready_S1        (msg_header_ready),
    .tag_clk_en_S1              (tag_clk_en),
    .tag_rdw_en_S1              (tag_rdw_en),
    .state_rd_en_S1             (state_rd_en),

    .valid_S2                   (valid_S2),    
    .stall_S2                   (stall_S2), 
    .stall_before_S2            (stall_before_S2), 
    .active_S2                  (active_S2), 
    .msg_from_mshr_S2           (msg_from_mshr_S2),
    .msg_type_S2                (msg_type_S2),
    .data_size_S2               (data_size_S2),
    .cache_type_S2              (cache_type_S2),
    .dir_clk_en_S2              (dir_clk_en),
    .dir_rdw_en_S2              (dir_rdw_en),
    .dir_clr_en_S2              (dir_clr_en_S2),
    .data_clk_en_S2             (data_clk_en),
    .data_rdw_en_S2             (data_rdw_en),
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
    .l2_load_64B_S2             (l2_load_64B_S2),
    .l2_load_32B_S2             (l2_load_32B_S2),
    .l2_load_data_subline_S2    (l2_load_data_subline_S2),
    .msg_data_ready_S2          (msg_data_ready),
    `ifndef NO_RTL_CSM
    .smc_wr_en_S2               (smc_wr_en),
    .broadcast_counter_op_S2    (broadcast_counter_op),
    .broadcast_counter_op_val_S2(broadcast_counter_op_val),
    `endif

    .valid_S3                   (valid_S3),    
    .stall_S3                   (stall_S3), 
    .active_S3                  (active_S3),   
    .msg_type_S3                (msg_type_S3),
    .mshr_wr_state_en_S3        (mshr_wr_state_en),
    .mshr_wr_data_en_S3         (mshr_wr_data_en),
    .mshr_state_in_S3           (mshr_state_in),
    .mshr_inc_counter_en_S3     (mshr_inc_counter_en),
    .state_wr_en_S3             (state_wr_en)
);


l2_pipe2_dpath dpath(
    .clk                        (clk),
    .rst_n                      (rst_n),
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
    .msg_addr_S1                (msg_addr),
    .msg_type_S1                (msg_type),
    .msg_subline_id_S1          (msg_subline_id),
    .msg_mshrid_S1              (msg_mshrid),
    .msg_src_chipid_S1          (msg_src_chipid),
    .msg_src_x_S1               (msg_src_x),
    .msg_src_y_S1               (msg_src_y),
    .msg_src_fbits_S1           (msg_src_fbits),
    .msg_sdid_S1                (msg_sdid),
    .msg_lsid_S1                (msg_lsid),
    .valid_S1                   (valid_S1),
    .stall_S1                   (stall_S1),
    .msg_from_mshr_S1           (msg_from_mshr_S1), 

    .state_data_S2              (state_data_out),
    .tag_data_S2                (tag_data_out),
    .msg_data_S2                (msg_data),
    .msg_from_mshr_S2           (msg_from_mshr_S2),
    .msg_type_S2                (msg_type_S2),
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
    .dir_clr_en_S2              (dir_clr_en_S2),
    .l2_load_64B_S2             (l2_load_64B_S2),
    .l2_load_32B_S2             (l2_load_32B_S2),
    .l2_load_data_subline_S2    (l2_load_data_subline_S2),
    .valid_S2                   (valid_S2),
    .stall_S2                   (stall_S2),
    .stall_before_S2            (stall_before_S2), 


    .valid_S3                   (valid_S3),
    .stall_S3                   (stall_S3),

    .addr_S1                    (addr_S1),
    .mshr_rd_index_S1           (mshr_rd_index_in),
    .tag_addr_S1                (tag_addr),
    .state_rd_addr_S1           (state_rd_addr),
    .tag_data_in_S1             (tag_data_in),  
    .tag_data_mask_in_S1        (tag_data_mask_in),
    .is_same_address_S1         (is_same_address_S1),

    .addr_S2                    (addr_S2),
    .l2_tag_hit_S2              (l2_tag_hit_S2),
    .l2_way_sel_S2              (l2_way_sel_S2),
    .l2_wb_S2                   (l2_wb_S2),
    .l2_way_state_owner_S2      (l2_way_state_owner_S2),
    .l2_way_state_mesi_S2       (l2_way_state_mesi_S2),
    .l2_way_state_vd_S2         (l2_way_state_vd_S2),    
    .l2_way_state_subline_S2    (l2_way_state_subline_S2),
    .l2_way_state_cache_type_S2 (l2_way_state_cache_type_S2),
    .addr_l2_aligned_S2         (addr_l2_aligned_S2),
    .subline_valid_S2           (subline_valid_S2),
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
    .mshr_wr_index_S3           (mshr_wr_index_in),
    .mshr_data_in_S3            (mshr_data_in),
    .mshr_data_mask_in_S3       (mshr_data_mask_in),
    .state_wr_addr_S3           (state_wr_addr),
    .state_data_in_S3           (state_data_in),
    .state_data_mask_in_S3      (state_data_mask_in)
);


endmodule
