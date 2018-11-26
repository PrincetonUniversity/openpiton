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


`include "define.tmp.h"

`ifdef PITON_PROTO
`ifdef FPGA_SYN_1THREAD
`define ED_ENABLE_BIT 0
`else
`define ED_ENABLE_BIT 1
`endif
`else
`define ED_ENABLE_BIT 1
`endif


module cfg_asi ( // Inputs
    clk,
    rst_n,
    ifu_lsu_alt_space_e,
    ifu_lsu_ld_inst_e,
    ifu_lsu_st_inst_e,
    ifu_tlu_thrid_e,
    lsu_spu_asi_state_e,
    exu_lsu_ldst_va_e,
    lsu_tlu_rs3_data_g,
    // Outputs
    cfg_asi_lsu_ldxa_vld_w2,
    cfg_asi_lsu_ldxa_tid_w2,
    cfg_asi_lsu_ldxa_data_w2,
    cfg_dtu_esl_en,

    cfg_dtu_esl_sync_method,
    cfg_esl_lfsr_seed,
    cfg_esl_lfsr_ld,
    cfg_esl_pc_diff_thresh,
    cfg_esl_counter_timeout,
    
    cfg_ifu_csm_itlb_state,
    cfg_ifu_csm_itlb_chipid,
    cfg_ifu_csm_itlb_x,
    cfg_ifu_csm_itlb_y,
    cfg_ifu_csm_itlb_hdid,
    cfg_ifu_csm_itlb_hd_size,
    cfg_ifu_csm_itlb_sdid,
    cfg_ifu_csm_itlb_lsid,

    cfg_lsu_csm_dtlb_state,
    cfg_lsu_csm_dtlb_chipid,
    cfg_lsu_csm_dtlb_x,
    cfg_lsu_csm_dtlb_y,
    cfg_lsu_csm_dtlb_hdid,
    cfg_lsu_csm_dtlb_hd_size,
    cfg_lsu_csm_dtlb_sdid,
    cfg_lsu_csm_dtlb_lsid

);
    // ... [input/output/wire declarations] ...
    input        clk;
    input        rst_n;
    input        ifu_lsu_alt_space_e;
    input        ifu_lsu_ld_inst_e;
    input        ifu_lsu_st_inst_e;
    input [1:0]  ifu_tlu_thrid_e;
    input [7:0]  lsu_spu_asi_state_e;
    input [47:0] exu_lsu_ldst_va_e; // Unused - could pipe through stages for special operations
    input [63:0] lsu_tlu_rs3_data_g;
    // Outputs
    output            cfg_asi_lsu_ldxa_vld_w2;
    output     [1:0]  cfg_asi_lsu_ldxa_tid_w2;
    output reg [63:0] cfg_asi_lsu_ldxa_data_w2; 
    output            cfg_dtu_esl_en;
    output [1:0]      cfg_dtu_esl_sync_method;
    output [15:0]     cfg_esl_lfsr_seed;
    output            cfg_esl_lfsr_ld;
    output [49:0]     cfg_esl_pc_diff_thresh;
    output [15:0]     cfg_esl_counter_timeout;

    output [`CFG_CSM_STATE_WIDTH-1:0]   cfg_ifu_csm_itlb_state;
    output [`NOC_CHIPID_WIDTH-1:0]      cfg_ifu_csm_itlb_chipid;
    output [`NOC_X_WIDTH-1:0]           cfg_ifu_csm_itlb_x;
    output [`NOC_Y_WIDTH-1:0]           cfg_ifu_csm_itlb_y;
    output [`MSG_HDID_WIDTH-1:0]        cfg_ifu_csm_itlb_hdid;
    output [`MSG_LHID_WIDTH-1:0]        cfg_ifu_csm_itlb_hd_size;
    output [`MSG_SDID_WIDTH-1:0]        cfg_ifu_csm_itlb_sdid;
    output [`MSG_LSID_WIDTH-1:0]        cfg_ifu_csm_itlb_lsid;

    output [`CFG_CSM_STATE_WIDTH-1:0]   cfg_lsu_csm_dtlb_state;
    output [`NOC_CHIPID_WIDTH-1:0]      cfg_lsu_csm_dtlb_chipid;
    output [`NOC_X_WIDTH-1:0]           cfg_lsu_csm_dtlb_x;
    output [`NOC_Y_WIDTH-1:0]           cfg_lsu_csm_dtlb_y;
    output [`MSG_HDID_WIDTH-1:0]        cfg_lsu_csm_dtlb_hdid;
    output [`MSG_LHID_WIDTH-1:0]        cfg_lsu_csm_dtlb_hd_size;
    output [`MSG_SDID_WIDTH-1:0]        cfg_lsu_csm_dtlb_sdid;
    output [`MSG_LSID_WIDTH-1:0]        cfg_lsu_csm_dtlb_lsid;


    // Actual configuration registers
    reg [`CFG_DATA_WIDTH-1:0]   cfg_regs [`CFG_NUM_REGS-1:0];

    // Enable signals for loading/storing ASI in the E stage
    wire asi_ld_e = ifu_lsu_alt_space_e & ifu_lsu_ld_inst_e &
                  ( lsu_spu_asi_state_e == 8'h1A );
    wire asi_st_e = ifu_lsu_alt_space_e & ifu_lsu_st_inst_e & 
                  ( lsu_spu_asi_state_e == 8'h1A );

    // ...[Pipe asi_ld_e to stage W2 and asi_st_e to stage W/G] ... 
    // [through stages E -> M -> W/G -> W2]
    //
    // Can also pipe the VA for special operations
    // based upon the VA.
    reg         asi_ld_m;
    reg         asi_ld_w;
    reg         asi_ld_w2;
    reg         asi_st_m;
    reg         asi_st_g;
    reg [1:0]   ifu_tlu_thrid_m;
    reg [1:0]   ifu_tlu_thrid_w;
    reg [1:0]   ifu_tlu_thrid_w2;
    reg [47:0]  exu_lsu_ldst_va_m;
    reg [47:0]  exu_lsu_ldst_va_w;
    reg [47:0]  exu_lsu_ldst_va_w2;

    always @(posedge clk) begin
        if (~rst_n) begin
            asi_ld_m  <= 1'b0;
            asi_ld_w  <= 1'b0;
            asi_ld_w2 <= 1'b0;

            asi_st_m  <= 1'b0;
            asi_st_g  <= 1'b0;

            ifu_tlu_thrid_m  <= 2'b00;
            ifu_tlu_thrid_w  <= 2'b00;
            ifu_tlu_thrid_w2 <= 2'b00;
            
            exu_lsu_ldst_va_m <= 48'b0;
            exu_lsu_ldst_va_w <= 48'b0;
            exu_lsu_ldst_va_w2 <= 48'b0;
        end
        else begin
            asi_ld_m  <= asi_ld_e;
            asi_ld_w  <= asi_ld_m;
            asi_ld_w2 <= asi_ld_w;

            asi_st_m  <= asi_st_e;
            asi_st_g  <= asi_st_m;

            ifu_tlu_thrid_m  <= ifu_tlu_thrid_e;
            ifu_tlu_thrid_w  <= ifu_tlu_thrid_m;
            ifu_tlu_thrid_w2 <= ifu_tlu_thrid_w;
            
            exu_lsu_ldst_va_m <= exu_lsu_ldst_va_e;
            exu_lsu_ldst_va_w <= exu_lsu_ldst_va_m;
            exu_lsu_ldst_va_w2 <= exu_lsu_ldst_va_w;
        end
    end

    // Our internal register is written by the store ASI and
    // read by the load ASI instructions
    always @(posedge clk) begin
        if (~rst_n) begin
            cfg_regs[`CFG_ED0_INDEX] <= `CFG_ED0_DEFAULT;
            cfg_regs[`CFG_ED1_INDEX] <= `CFG_ED1_DEFAULT;
            cfg_regs[`CFG_CSM_ITLB_INDEX] <= `CFG_CSM_ITLB_DEFAULT;
            cfg_regs[`CFG_CSM_DTLB_INDEX] <= `CFG_CSM_DTLB_DEFAULT;
        end
        else if (asi_st_g) begin
            cfg_regs[exu_lsu_ldst_va_w[(`CFG_LOG2_NUM_REGS-1)+3:3]] <= lsu_tlu_rs3_data_g;
        end
    end

    // Configuration register loads
    always @ * begin
        if (asi_ld_w2) begin
            cfg_asi_lsu_ldxa_data_w2 = cfg_regs[exu_lsu_ldst_va_w2[(`CFG_LOG2_NUM_REGS-1)+3:3]];
        end
        else begin
            cfg_asi_lsu_ldxa_data_w2 = 64'b0;
        end
    end
    
    //OpenSPARC T1 Internals reg code:
    //dffe #(64)
    //internal_ff ( .clk ( clk ), .en ( asi_st_g ),
    //               .din ( lsu_tlu_rs3_data_g ),
    //               .q   ( cfg_asi_lsu_ldxa_data_w2 ) );

    // Valid signal and TID asserted at the appropriate stage
    assign cfg_asi_lsu_ldxa_vld_w2 = asi_ld_w2;
    assign cfg_asi_lsu_ldxa_tid_w2 = ifu_tlu_thrid_w2;

    assign cfg_dtu_esl_en = cfg_regs[`CFG_ED0_INDEX][`CFG_ED0_ENABLE_POS] & `ED_ENABLE_BIT;
    assign cfg_dtu_esl_sync_method = cfg_regs[`CFG_ED0_INDEX][`CFG_ED0_SYNC_METHOD];
    assign cfg_esl_lfsr_seed = cfg_regs[`CFG_ED0_INDEX][`CFG_ED0_LFSR_SEED_POS];
    assign cfg_esl_lfsr_ld = cfg_regs[`CFG_ED0_INDEX][`CFG_ED0_LFSR_LOAD_POS];
    assign cfg_esl_counter_timeout = cfg_regs[`CFG_ED0_INDEX][`CFG_ED0_COUNTER_TIMEOUT];
    assign cfg_esl_pc_diff_thresh = cfg_regs[`CFG_ED1_INDEX][`CFG_ED1_PC_DIFF_THRESH_POS];

    
    assign cfg_ifu_csm_itlb_state = cfg_regs[`CFG_CSM_ITLB_INDEX][`CFG_CSM_STATE_POS];
    assign cfg_ifu_csm_itlb_chipid = cfg_regs[`CFG_CSM_ITLB_INDEX][`CFG_CSM_CHIPID_POS];
    assign cfg_ifu_csm_itlb_x = cfg_regs[`CFG_CSM_ITLB_INDEX][`CFG_CSM_X_POS];
    assign cfg_ifu_csm_itlb_y = cfg_regs[`CFG_CSM_ITLB_INDEX][`CFG_CSM_Y_POS];
    assign cfg_ifu_csm_itlb_hdid = cfg_regs[`CFG_CSM_ITLB_INDEX][`CFG_CSM_HDID_POS];
    assign cfg_ifu_csm_itlb_hd_size = cfg_regs[`CFG_CSM_ITLB_INDEX][`CFG_CSM_HD_SIZE_POS];
    assign cfg_ifu_csm_itlb_sdid = cfg_regs[`CFG_CSM_ITLB_INDEX][`CFG_CSM_SDID_POS];
    assign cfg_ifu_csm_itlb_lsid = cfg_regs[`CFG_CSM_ITLB_INDEX][`CFG_CSM_LSID_POS];

    assign cfg_lsu_csm_dtlb_state = cfg_regs[`CFG_CSM_DTLB_INDEX][`CFG_CSM_STATE_POS];
    assign cfg_lsu_csm_dtlb_chipid = cfg_regs[`CFG_CSM_DTLB_INDEX][`CFG_CSM_CHIPID_POS];
    assign cfg_lsu_csm_dtlb_x = cfg_regs[`CFG_CSM_DTLB_INDEX][`CFG_CSM_X_POS];
    assign cfg_lsu_csm_dtlb_y = cfg_regs[`CFG_CSM_DTLB_INDEX][`CFG_CSM_Y_POS];
    assign cfg_lsu_csm_dtlb_hdid = cfg_regs[`CFG_CSM_DTLB_INDEX][`CFG_CSM_HDID_POS];
    assign cfg_lsu_csm_dtlb_hd_size = cfg_regs[`CFG_CSM_DTLB_INDEX][`CFG_CSM_HD_SIZE_POS];
    assign cfg_lsu_csm_dtlb_sdid = cfg_regs[`CFG_CSM_DTLB_INDEX][`CFG_CSM_SDID_POS];
    assign cfg_lsu_csm_dtlb_lsid = cfg_regs[`CFG_CSM_DTLB_INDEX][`CFG_CSM_LSID_POS];


endmodule
