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

/*
 *  Description:
 *      This module encapsulates different Execution Drafting synchronization methods
 *      into one module and multiplexes between them based on configuration bits.  It
 *      also supplies more succinct inputs to the synchronization methods derived from
 *      signals from the IFU and derives the correct outputs to go to the IFU.
 *
 *  Note: While the interface to this module supports 4 threads, the logic only supports 2
 */

module sparc_ifu_esl
(
    input               clk,
    input               rst_n,

    // Configuration bits input
    input               config_esl_en,
    input [1:0]         config_esl_sync_method,

    // LFSR management signals for RTSM
    input [15:0]        config_esl_lfsr_seed,
    input               config_esl_lfsr_ld,

    // Threshold configuration signal for PC difference
    input [49:0]        config_esl_pc_diff_thresh,

    // Counter timeout configuration value
    input [15:0]        config_esl_counter_timeout,

    // Active threads from thread FSMs
    input [3:0]         swl_esl_thr_active,

    // Threads ready from thread FSMs, both
    // non-speculative ready and speculative ready
    input [3:0]         swl_esl_thr_urdy,
    input [3:0]         swl_esl_thr_sprdy_or_urdy,
    input [3:0]         swl_esl_thr_sprdy_or_urdy_next,

    // Use speculative ready vector, meaning no
    // thread is non-speculatively ready
    input               swl_esl_use_spec,

    // Thread in F stage
    input [3:0]         fcl_esl_thr_f,

    // Instructions to be in S2 TIRs next
    input [32:0]        fdp_esl_t0inst_next_s2,
`ifndef CONFIG_NUM_THREADS
    input [32:0]        fdp_esl_t1inst_next_s2,
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
    input [32:0]        fdp_esl_t1inst_next_s2,
`elsif THREADS_3
    input [32:0]        fdp_esl_t1inst_next_s2,
    input [32:0]        fdp_esl_t2inst_next_s2,
`else
    input [32:0]        fdp_esl_t1inst_next_s2,
    input [32:0]        fdp_esl_t2inst_next_s2,
    input [32:0]        fdp_esl_t3inst_next_s2,
`endif
`endif

    // Physical address of above instructions
    input [39:2]        fdp_esl_t0inst_paddr_next_s2,
`ifndef CONFIG_NUM_THREADS
    input [39:2]        fdp_esl_t1inst_paddr_next_s2,
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
    input [39:2]        fdp_esl_t1inst_paddr_next_s2,
`elsif THREADS_3
    input [39:2]        fdp_esl_t1inst_paddr_next_s2,
    input [39:2]        fdp_esl_t2inst_paddr_next_s2,
`else
    input [39:2]        fdp_esl_t1inst_paddr_next_s2,
    input [39:2]        fdp_esl_t2inst_paddr_next_s2,
    input [39:2]        fdp_esl_t3inst_paddr_next_s2,
`endif
`endif

    // Virtual address of above instructions
    input [48:0]        fdp_esl_t0pc_next_s2,
`ifndef CONFIG_NUM_THREADS
    input [48:0]        fdp_esl_t1pc_next_s2,
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
    input [48:0]        fdp_esl_t1pc_next_s2,
`elsif THREADS_3
    input [48:0]        fdp_esl_t1pc_next_s2,
    input [48:0]        fdp_esl_t2pc_next_s2,
`else
    input [48:0]        fdp_esl_t1pc_next_s2,
    input [48:0]        fdp_esl_t2pc_next_s2,
    input [48:0]        fdp_esl_t3pc_next_s2,
`endif
`endif

    // Above instructions valid on the next cycle?
    input [3:0]         fcl_esl_tinst_vld_next_s,

    // Branch taken in E and M stage (taken in M stage if br was taken in previous stage)
    input               fcl_esl_brtaken_e,
    input               fcl_esl_brtaken_m,

    // Threads in E and M
    input [3:0]         fcl_esl_thr_e,
    input [3:0]         fcl_esl_thr_m,

    // Valid instructions in D, E and M
    input               fcl_esl_inst_vld_d,
    input               fcl_esl_inst_vld_e,
    input               fcl_esl_inst_vld_m,

    // Trap on this cycle
    input [3:0]         fcl_esl_thr_trap_bf,

    // Rollback on this cycle
    input               fcl_esl_rb_stg_s,

    // Unresolved branch instructions
    input               dcl_esl_br_inst_d,
    input               dcl_esl_br_inst_e,

    // Whether a branch target pc is in bf of f
    input [3:0]         fdp_esl_brtrp_target_pc_bf_f,

    // Whether there is an outstanding I-cache miss to thr0
    input               swl_esl_icmiss_out,

    // Next thread to fetch for
    output [3:0]        esl_fcl_nextthr_bf,

    // Stall fetch (i.e. should it fetch)
    output              esl_fcl_stall_bf,

    // Whether to switch to esl_fcl_nextthr_bf
    output              esl_fcl_switch_bf,

    // Sync PCs between leader and follower threads
    output              esl_fdp_sync_pcs_bf,

    // If the thread to be issued is ready (i.e. should it be issued)
    output              esl_fcl_ntr_s,

    // Issue previously issued instruction for
    // next thread
    output              esl_fdp_issue_prev_inst_next_s,

    // Output signal to force s2 to be running on next cycle
    output              esl_fcl_force_running_s
);

    //
    // Parameter Definitions
    //

    //
    // Signal Declarations
    //

    // Derived inputs to thread select modules
    reg         esl_tirs_eql_s;
    reg [1:0]   esl_t0inst_next_op1;
    reg [1:0]   esl_t1inst_next_op1;
    reg [2:0]   esl_t0inst_next_op2;
    reg [2:0]   esl_t1inst_next_op2;
    reg [5:0]   esl_t0inst_next_op3;
    reg [5:0]   esl_t1inst_next_op3;
    reg [8:0]   esl_t0inst_next_opf;
    reg [8:0]   esl_t1inst_next_opf;
    reg [2:0]   esl_t0inst_next_br_rcond;
    reg [2:0]   esl_t1inst_next_br_rcond;
    reg [3:0]   esl_t0inst_next_br_cond;
    reg [3:0]   esl_t1inst_next_br_cond;
    reg [4:0]   esl_t0inst_next_fcn;
    reg [4:0]   esl_t1inst_next_fcn;
    reg [5:0]   esl_t0inst_next_opf_low;
    reg [5:0]   esl_t1inst_next_opf_low;
    reg [3:0]   esl_t0inst_next_mv_cond;
    reg [3:0]   esl_t1inst_next_mv_cond;
    reg [2:0]   esl_t0inst_next_mv_rcond;
    reg [2:0]   esl_t1inst_next_mv_rcond;
    reg         esl_t0inst_next_x;
    reg         esl_t1inst_next_x;
    reg [4:0]   esl_t0inst_next_rd;
    reg [4:0]   esl_t1inst_next_rd;
    reg         esl_tirs_op1_eql;
    reg         esl_tirs_op2_eql;
    reg         esl_tirs_op3_eql;
    reg         esl_tirs_opf_eql;
    reg         esl_tirs_br_rcond_eql;
    reg         esl_tirs_br_cond_eql;
    reg         esl_tirs_fcn_eql;
    reg         esl_tirs_opf_low_eql;
    reg         esl_tirs_mv_cond_eql;
    reg         esl_tirs_mv_rcond_eql;
    reg         esl_tirs_x_eql;
    reg         esl_tirs_rd_eql;
    reg         esl_ops_eql_s;
    reg         esl_pcs_pa_eql_s;
    reg         esl_ctrl_flow_diverged_late_s;
    reg         esl_pcs_pa_page_bndry_s;
    reg         esl_any_trap_bf;
    reg [49:0]  esl_pc_va_diff_s;
    reg [49:0]  esl_pc_va_diff_offset_s;
    reg [49:0]  esl_pc_va_diff_abs_s;
    reg [3:0]   esl_min_pc_va_s;
    reg         esl_pc_va_diff_lt_thresh_s;
    reg         esl_pcs_va_eql_s;
    reg         esl_unresolved_br;
    reg         esl_brtrp_target_pc_bf_f;

    // Register that may be updated with PC VA difference
    // for offset calculation
    reg [49:0]  esl_pc_va_diff_offset_f;

    // Control outputs from ESL FSM to offset register
    wire        esl_pc_va_diff_offset_we;
    wire        esl_pc_va_diff_offset_clear;

`ifdef CONFIG_NUM_THREADS
`ifdef FPGA_SYN_1THREAD
    wire [32:0]        fdp_esl_t1inst_next_s2;
    wire [39:2]        fdp_esl_t1inst_paddr_next_s2;
    wire [48:0]        fdp_esl_t1pc_next_s2;
`elsif THREADS_1
    wire [32:0]        fdp_esl_t1inst_next_s2;
    wire [39:2]        fdp_esl_t1inst_paddr_next_s2;
    wire [48:0]        fdp_esl_t1pc_next_s2;
`endif
`endif

    //
    // Sequential Logic
    //

    // Register that gets updated with PC VA difference
    // when instructed to do so
    always @ (posedge clk)
    begin
        if (~rst_n | esl_pc_va_diff_offset_clear)
            esl_pc_va_diff_offset_f <= 50'b0;
        else if (esl_pc_va_diff_offset_we)
            esl_pc_va_diff_offset_f <= esl_pc_va_diff_s;
    end

    //
    // Combinational Logic
    //

    // Derive inputs to sub-synchronization modules
    always @ *
    begin
        // Thread instructions equal
        esl_tirs_eql_s = (fdp_esl_t0inst_next_s2 == fdp_esl_t1inst_next_s2);
      
        // Thread instructions opcodes
        esl_t0inst_next_op1 = fdp_esl_t0inst_next_s2[31:30];
        esl_t1inst_next_op1 = fdp_esl_t1inst_next_s2[31:30];
        esl_t0inst_next_op2 = fdp_esl_t0inst_next_s2[24:22];
        esl_t1inst_next_op2 = fdp_esl_t1inst_next_s2[24:22];
        esl_t0inst_next_op3 = fdp_esl_t0inst_next_s2[24:19];
        esl_t1inst_next_op3 = fdp_esl_t1inst_next_s2[24:19];
        esl_t0inst_next_opf = fdp_esl_t0inst_next_s2[13:5];
        esl_t1inst_next_opf = fdp_esl_t1inst_next_s2[13:5];
        esl_t0inst_next_br_rcond = fdp_esl_t0inst_next_s2[27:25];
        esl_t1inst_next_br_rcond = fdp_esl_t1inst_next_s2[27:25];
        esl_t0inst_next_br_cond = fdp_esl_t0inst_next_s2[28:25];
        esl_t1inst_next_br_cond = fdp_esl_t1inst_next_s2[28:25];
        esl_t0inst_next_fcn = fdp_esl_t0inst_next_s2[29:25];
        esl_t1inst_next_fcn = fdp_esl_t1inst_next_s2[29:25];
        esl_t0inst_next_opf_low = fdp_esl_t0inst_next_s2[10:5];
        esl_t1inst_next_opf_low = fdp_esl_t1inst_next_s2[10:5];
        esl_t0inst_next_mv_cond = fdp_esl_t0inst_next_s2[17:14];
        esl_t1inst_next_mv_cond = fdp_esl_t1inst_next_s2[17:14];
        esl_t0inst_next_mv_rcond = fdp_esl_t0inst_next_s2[12:10];
        esl_t1inst_next_mv_rcond = fdp_esl_t1inst_next_s2[12:10];
        esl_t0inst_next_x = fdp_esl_t0inst_next_s2[12];
        esl_t1inst_next_x = fdp_esl_t1inst_next_s2[12];
        esl_t0inst_next_rd = fdp_esl_t0inst_next_s2[29:25];
        esl_t1inst_next_rd = fdp_esl_t1inst_next_s2[29:25];    
    
        // Thread instruction opcodes equal
        esl_tirs_op1_eql = (esl_t0inst_next_op1 == esl_t1inst_next_op1);
        esl_tirs_op2_eql = (esl_t0inst_next_op2 == esl_t1inst_next_op2);
        esl_tirs_op3_eql = (esl_t0inst_next_op3 == esl_t1inst_next_op3);
        esl_tirs_opf_eql = (esl_t0inst_next_opf == esl_t1inst_next_opf);
        esl_tirs_br_rcond_eql = (esl_t0inst_next_br_rcond == esl_t1inst_next_br_rcond);
        esl_tirs_br_cond_eql = (esl_t0inst_next_br_cond == esl_t1inst_next_br_cond);
        esl_tirs_fcn_eql = (esl_t0inst_next_fcn == esl_t1inst_next_fcn);
        esl_tirs_opf_low_eql = (esl_t0inst_next_opf_low == esl_t1inst_next_opf_low);
        esl_tirs_mv_cond_eql = (esl_t0inst_next_mv_cond == esl_t1inst_next_mv_cond);
        esl_tirs_mv_rcond_eql = (esl_t0inst_next_mv_rcond == esl_t1inst_next_mv_rcond);
        esl_tirs_x_eql = (esl_t0inst_next_x == esl_t1inst_next_x);
        esl_tirs_rd_eql = (esl_t0inst_next_rd == esl_t1inst_next_rd);

        // Determine if opcode of two instructions is equal
        // This logic is derived from SPARC V9 instruction formats
        case (esl_t0inst_next_op1)
            2'b00:
            begin
                // Branchs and SETHI, need to check op2
                
                // If branch on integer register with predication, need to
                // check rcond code
                if (esl_t0inst_next_op2 == 3'b011)
                    esl_ops_eql_s = esl_tirs_op1_eql & esl_tirs_op2_eql & esl_tirs_br_rcond_eql;
                // If branch on floating-point condition codes or branch on floating
                // point condition codes with prediction or branch on integer
                // condition codes or branch on integer condition codes with
                // prediction, need to check cond code
                else if (esl_t0inst_next_op2 == 3'b110 || esl_t0inst_next_op2 == 3'b101 || 
                         esl_t0inst_next_op2 == 3'b010 || esl_t0inst_next_op2 == 3'b001)
                    esl_ops_eql_s = esl_tirs_op1_eql & esl_tirs_op2_eql & esl_tirs_br_cond_eql;
                // Otherwise, just need to check op2
                else
                    esl_ops_eql_s = esl_tirs_op1_eql & esl_tirs_op2_eql;
            end
            2'b01:
            begin
                // Call instruction, just need to check op1
                esl_ops_eql_s = esl_tirs_op1_eql;
            end
            2'b10:
            begin
                // Arithmetic and Misc. (FP) instructions

                // If Done/Retry, need to check fcn
                if (esl_t0inst_next_op3 == 6'b111110)
                begin
                    esl_ops_eql_s = esl_tirs_op1_eql & esl_tirs_op3_eql & esl_tirs_fcn_eql;
                end
                // If floating-point add or subtract or floating-point compare
                // or floating-point to integer conversion or convert between
                // floating point formats or convert integer to floating-point
                // or floating-point move or floating-point muldiv, or floating-point
                // square root or floating-point move on condition or impl. dep., 
                // need to check opf
                else if (esl_t0inst_next_op3 == 6'b110100 || esl_t0inst_next_op3 == 6'b110101 ||
                         esl_t0inst_next_op3 == 6'b110110)
                begin
                    // If floating point move on condition, need to check cond
                    if (esl_t0inst_next_op3 == 6'b110101 &&
                        (esl_t0inst_next_opf_low == 6'b000001 ||
                         esl_t0inst_next_opf_low == 6'b000010 ||
                         esl_t0inst_next_opf_low == 6'b000011))
                        esl_ops_eql_s = esl_tirs_op1_eql & esl_tirs_op3_eql & esl_tirs_opf_low_eql &
                                        esl_tirs_mv_cond_eql;
                    // If floating point move on integer condition, need to check rcond
                    else if (esl_t0inst_next_op3 == 6'b110101 &&
                        (esl_t0inst_next_opf_low[4:0] == 5'b00101 ||
                         esl_t0inst_next_opf_low[4:0] == 5'b00110 ||
                         esl_t0inst_next_opf_low[4:0] == 5'b00111))
                        esl_ops_eql_s = esl_tirs_op1_eql & esl_tirs_op3_eql & esl_tirs_opf_low_eql &
                                        esl_tirs_mv_rcond_eql;
                    // Otherwise, just need to check opf
                    else
                        esl_ops_eql_s = esl_tirs_op1_eql & esl_tirs_op3_eql & esl_tirs_opf_eql;
                end
                // If move on condition, need to check cond
                else if (esl_t0inst_next_op3 == 6'b101100)
                begin
                    esl_ops_eql_s = esl_tirs_op1_eql & esl_tirs_op3_eql & esl_tirs_mv_cond_eql;
                end
                // If move on regiser condition, need to check rcond
                else if (esl_t0inst_next_op3 == 6'b101111)
                begin
                    esl_ops_eql_s = esl_tirs_op1_eql & esl_tirs_op3_eql & esl_tirs_mv_rcond_eql;
                end
                // If save or restore, need to check fcn
                else if (esl_t0inst_next_op3 == 6'b110001)
                begin
                    esl_ops_eql_s = esl_tirs_op1_eql & esl_tirs_op3_eql & esl_tirs_fcn_eql;
                end
                // If a shift type, need to check x
                else if (esl_t0inst_next_op3 == 6'b100101 || esl_t0inst_next_op3 == 6'b100110 ||
                         esl_t0inst_next_op3 == 6'b100111)
                begin    
                    esl_ops_eql_s = esl_tirs_op1_eql & esl_tirs_op3_eql & esl_tirs_x_eql;
                end
                // If software initiated reset, need to check rd
                else if (esl_t0inst_next_op3 == 6'b110000 && esl_t0inst_next_rd == 5'b01111)
                begin
                    esl_ops_eql_s = esl_tirs_op1_eql & esl_tirs_op3_eql & esl_tirs_rd_eql;
                end
                // If trap on integer condition codes, need to check cond
                else if (esl_t0inst_next_op3 == 6'b111010)
                begin
                    esl_ops_eql_s = esl_tirs_op1_eql & esl_tirs_op3_eql & esl_tirs_br_cond_eql;
                end
                // Otherwise, just need to check op3
                else
                begin
                    esl_ops_eql_s = esl_tirs_op1_eql & esl_tirs_op3_eql;
                end
            end
            2'b11:
            begin
                // Loads and Stores, need to check op3
                
                // If load/store floating point state register, need to check rd
                if (esl_t0inst_next_op3 == 6'b100001 || esl_t0inst_next_op3 == 6'b100101)
                    esl_ops_eql_s = esl_tirs_op1_eql & esl_tirs_op3_eql & esl_tirs_rd_eql;
                // If prefetch, need to check fcn
                else if (esl_t0inst_next_op3 == 6'b101101 || esl_t0inst_next_op3 == 6'b111101)
                    esl_ops_eql_s = esl_tirs_op1_eql & esl_tirs_op3_eql & esl_tirs_fcn_eql;
                // Otherwise, just need to check op3
                else
                    esl_ops_eql_s = esl_tirs_op1_eql & esl_tirs_op3_eql;
            end
            default:
                esl_ops_eql_s = 1'bx;
        endcase

        // Thread PC physical addresses equal
        esl_pcs_pa_eql_s = (fdp_esl_t0inst_paddr_next_s2 == fdp_esl_t1inst_paddr_next_s2) &
                           fcl_esl_tinst_vld_next_s[0] & fcl_esl_tinst_vld_next_s[1];

        // Control flow diverged
        esl_ctrl_flow_diverged_late_s = ((fcl_esl_brtaken_e & ~fcl_esl_brtaken_m) |
                                         (~fcl_esl_brtaken_e & fcl_esl_brtaken_m)) &
                                        (fcl_esl_thr_e == 4'b0010) &
                                        (fcl_esl_thr_m == 4'b0001) &
                                        fcl_esl_inst_vld_e & fcl_esl_inst_vld_m;

        // Check if this is the last instruction in a page (i.e. PA mod 8K is 8K - 4)
        esl_pcs_pa_page_bndry_s = ({fdp_esl_t0inst_paddr_next_s2, 2'b0} % 40'd8192) == 40'd8188;

        // Check if any trap occurred
        esl_any_trap_bf = fcl_esl_thr_trap_bf[0] | fcl_esl_thr_trap_bf[1];

        // Difference in PCs
        esl_pc_va_diff_s = ({1'b0, fdp_esl_t0pc_next_s2} - {1'b0, fdp_esl_t1pc_next_s2});

        // Difference in PCs plus offset
        esl_pc_va_diff_offset_s = esl_pc_va_diff_s + esl_pc_va_diff_offset_f;
        
        // Take absolute value of difference
        esl_pc_va_diff_abs_s = esl_pc_va_diff_offset_s;
        if (esl_pc_va_diff_abs_s[49])
            esl_pc_va_diff_abs_s = (~esl_pc_va_diff_abs_s) + 1;

        // Get minimum PC
        if (~esl_pc_va_diff_offset_s[49])
            esl_min_pc_va_s = 4'b0010;
        else
            esl_min_pc_va_s = 4'b0001;

        // Evaluate if difference is less than thresh
        esl_pc_va_diff_lt_thresh_s = (esl_pc_va_diff_abs_s < config_esl_pc_diff_thresh);

        // Evaluate if VA PCs are equal (including offset)
        esl_pcs_va_eql_s = (esl_pc_va_diff_offset_s == 50'b0);

        // Any unresolved branches in pipe?
        esl_unresolved_br = (dcl_esl_br_inst_d & fcl_esl_inst_vld_d) |
                            (dcl_esl_br_inst_e & fcl_esl_inst_vld_e);

        // A branch or trap PC is in bf or f
        esl_brtrp_target_pc_bf_f = |fdp_esl_brtrp_target_pc_bf_f[1:0];
    end

    //
    // Sub-module Instantiations
    //

    // FSM submodule - implements generic FSM logic for all synchronization
    // methods and multiplexes the synchronization method specific portion
    // according to config_esl_sync_method
    sparc_ifu_esl_fsm esl_fsm
    (
        .clk (clk),
        .rst_n (rst_n),
        .config_esl_en (config_esl_en),
        .config_esl_sync_method (config_esl_sync_method),
        .config_esl_counter_timeout (config_esl_counter_timeout),
        .config_esl_lfsr_seed (config_esl_lfsr_seed),
        .config_esl_lfsr_ld (config_esl_lfsr_ld),
        .swl_esl_thr_active (swl_esl_thr_active),
        .swl_esl_thr_urdy (swl_esl_thr_urdy),
        .swl_esl_thr_sprdy_or_urdy (swl_esl_thr_sprdy_or_urdy),
        .swl_esl_thr_sprdy_or_urdy_next (swl_esl_thr_sprdy_or_urdy_next),
        .swl_esl_use_spec (swl_esl_use_spec),
        .fcl_esl_tinst_vld_s (fcl_esl_tinst_vld_next_s),
        .fcl_esl_thr_f (fcl_esl_thr_f),
        .fcl_esl_rb_stg_s (fcl_esl_rb_stg_s),
        .esl_tirs_eql_s (esl_tirs_eql_s),
        .esl_ops_eql_s (esl_ops_eql_s),
        .esl_pcs_pa_eql_s (esl_pcs_pa_eql_s),
        .esl_ctrl_flow_diverged_late_s (esl_ctrl_flow_diverged_late_s),
        .esl_pcs_pa_page_bndry_s (esl_pcs_pa_page_bndry_s),
        .esl_any_trap_bf (esl_any_trap_bf),
        .esl_min_pc_va_s (esl_min_pc_va_s),
        .esl_pc_va_diff_lt_thresh_s (esl_pc_va_diff_lt_thresh_s),
        .esl_pcs_va_eql_s (esl_pcs_va_eql_s),
        .esl_unresolved_br (esl_unresolved_br),
        .esl_brtrp_target_pc_bf_f (esl_brtrp_target_pc_bf_f),
        .swl_esl_icmiss_out (swl_esl_icmiss_out),
        .esl_fcl_nextthr_bf (esl_fcl_nextthr_bf),
        .esl_fcl_stall_bf (esl_fcl_stall_bf),
        .esl_fcl_switch_bf (esl_fcl_switch_bf),
        .esl_fdp_sync_pcs_bf (esl_fdp_sync_pcs_bf),
        .esl_fcl_ntr_s (esl_fcl_ntr_s),
        .esl_fdp_issue_prev_inst_next_s (esl_fdp_issue_prev_inst_next_s),
        .esl_fcl_force_running_s (esl_fcl_force_running_s),
        .esl_pc_va_diff_offset_we (esl_pc_va_diff_offset_we),
        .esl_pc_va_diff_offset_clear (esl_pc_va_diff_offset_clear)
    );

endmodule
