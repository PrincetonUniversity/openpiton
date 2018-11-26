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
 *      This module implements the generic portions of the Execution Drafting
 *      FSM.  Anything common to all synchronization methods is implemented
 *      here.  
 *
 *  Note: While the interface to this module supports 4 threads, the logic
 *  only supports 2
 */

`include "define.tmp.h"

module sparc_ifu_esl_fsm
(
    input               clk,
    input               rst_n,

    // Configuration bits input
    input               config_esl_en,
    input [1:0]         config_esl_sync_method,

    // Counter timeout configuration value
    input [15:0]        config_esl_counter_timeout,

    // LFSR management signals
    input [15:0]        config_esl_lfsr_seed,
    input               config_esl_lfsr_ld,

    // Thread active signals from FSM
    input [3:0]         swl_esl_thr_active,

    // Thread ready signals from FSM, both non-speculative
    // ready and speculative ready
    input [3:0]         swl_esl_thr_urdy,
    input [3:0]         swl_esl_thr_sprdy_or_urdy,
    input [3:0]         swl_esl_thr_sprdy_or_urdy_next,

    // Whether to use speculative rdy vector, meaning
    // there is no non-speculative ready thread
    input               swl_esl_use_spec,

    // Instructions valid in S
    input [3:0]         fcl_esl_tinst_vld_s,

    // Thread in F stage
    input [3:0]         fcl_esl_thr_f,

    // Rollback on this cycle
    input               fcl_esl_rb_stg_s,

    // Information about threads in thread select stage
    input               esl_tirs_eql_s,
    input               esl_ops_eql_s,
    input               esl_pcs_pa_eql_s,
    input               esl_ctrl_flow_diverged_late_s,
    input               esl_pcs_pa_page_bndry_s,
    input               esl_any_trap_bf,
    input [3:0]         esl_min_pc_va_s,
    input               esl_pc_va_diff_lt_thresh_s,
    input               esl_pcs_va_eql_s,
    input               esl_unresolved_br,
    input               esl_brtrp_target_pc_bf_f,
    input               swl_esl_icmiss_out,

    // Synchronization output
    output reg [3:0]    esl_fcl_nextthr_bf,
    output reg          esl_fcl_stall_bf,
    output reg          esl_fcl_switch_bf,
    output reg          esl_fdp_sync_pcs_bf,
    output reg          esl_fcl_ntr_s,
    output reg          esl_fdp_issue_prev_inst_next_s,
    output reg          esl_fcl_force_running_s,
    output reg          esl_pc_va_diff_offset_we,
    output reg          esl_pc_va_diff_offset_clear
);

    //
    // Parameter Definitions
    //

    // State definitions
    localparam  DIVERGED = 0;
    localparam  DIVERGED_DRAFT = 1;
    localparam  CONVERGED = 2;
    localparam  CONVERGED_DRAFT = 3;
    localparam  DIVERGED_DIFFERENT_CODE_RCFG0 = 4;
    localparam  RCFG1 = 5;
    localparam  RCFG2 = 6;
    localparam  RCFG3 = 7;

    //
    // Signal Declarations
    //
    
    // LFSR control and output
    reg         esl_lfsr_step;
    wire        pseudo_rand_f;

    // Timeout counter control and output
    reg                                         esl_timeout_counter_step;
    reg                                         esl_timeout_counter_clear;
    reg                                         esl_timeout_counter_set;
    wire [`ED_TIMEOUT_COUNTER_BIT_WIDTH-1:0]    esl_timeout_counter_count_f;

    // Shift Register control and output
    reg                                         esl_timeout_shiftreg_step;
    reg                                         esl_timeout_shiftreg_set;
    wire [`ED_TIMEOUT_COUNTER_BIT_WIDTH-1:0]    esl_timeout_shiftreg_f;

    // Control signals for comparator for timeout control.
    // 1'b1 - Compare to configured timeout
    // 1'b0 - Compare to shift register
    reg                                         esl_timeout_counter_cmp_config;

    // Next state output decisions
    wire [2:0]  esl_stsm_state_next;
    wire [2:0]  esl_rtsm_state_next;
    wire [2:0]  esl_htsm_state_next;
    wire [2:0]  esl_rcfg_state_next;

    // Thread select output decisions
    wire [3:0]  esl_stsm_fcl_nextthr_bf;
    wire [3:0]  esl_rtsm_fcl_nextthr_bf;
    wire [3:0]  esl_htsm_fcl_nextthr_bf;
    wire [3:0]  esl_rcfg_fcl_nextthr_bf;

    // Thread switch output decisions
    wire        esl_stsm_fcl_switch_bf;
    wire        esl_rtsm_fcl_switch_bf;
    wire        esl_htsm_fcl_switch_bf;
    wire        esl_rcfg_fcl_switch_bf;

    // Thread switch out/ready output decisions
    wire        esl_stsm_fcl_ntr_s;
    wire        esl_rtsm_fcl_ntr_s;
    wire        esl_htsm_fcl_ntr_s;
    wire        esl_rcfg_fcl_ntr_s;

    // LFSR step outputs
    wire        esl_stsm_lfsr_step;
    wire        esl_rtsm_lfsr_step;
    wire        esl_htsm_lfsr_step;
    wire        esl_rcfg_lfsr_step;

    // Timeout counter step and clear outputs
    wire        esl_stsm_timeout_counter_step;
    wire        esl_stsm_timeout_counter_clear;
    wire        esl_stsm_timeout_counter_set;
    wire        esl_rtsm_timeout_counter_step;
    wire        esl_rtsm_timeout_counter_clear;
    wire        esl_rtsm_timeout_counter_set;
    wire        esl_htsm_timeout_counter_step;
    wire        esl_htsm_timeout_counter_clear;
    wire        esl_htsm_timeout_counter_set;
    wire        esl_rcfg_timeout_counter_step;
    wire        esl_rcfg_timeout_counter_clear;
    wire        esl_rcfg_timeout_counter_set;

    // Shift register step and set outputs
    wire        esl_stsm_timeout_shiftreg_step;
    wire        esl_stsm_timeout_shiftreg_set;
    wire        esl_rtsm_timeout_shiftreg_step;
    wire        esl_rtsm_timeout_shiftreg_set;
    wire        esl_htsm_timeout_shiftreg_step;
    wire        esl_htsm_timeout_shiftreg_set;
    wire        esl_rcfg_timeout_shiftreg_step;
    wire        esl_rcfg_timeout_shiftreg_set;

    // Timeout counter comparison control signal output
    wire        esl_stsm_timeout_counter_cmp_config;
    wire        esl_rtsm_timeout_counter_cmp_config;
    wire        esl_htsm_timeout_counter_cmp_config;
    wire        esl_rcfg_timeout_counter_cmp_config;

    // Counter timeout comparison result
    reg         esl_counter_timeout;

    // Offset register control outputs
    wire        esl_stsm_pc_va_diff_offset_we;
    wire        esl_stsm_pc_va_diff_offset_clear;
    wire        esl_rtsm_pc_va_diff_offset_we;
    wire        esl_rtsm_pc_va_diff_offset_clear;
    wire        esl_htsm_pc_va_diff_offset_we;
    wire        esl_htsm_pc_va_diff_offset_clear;
    wire        esl_rcfg_pc_va_diff_offset_we;
    wire        esl_rcfg_pc_va_diff_offset_clear;

    // State declarations
    reg [2:0]   state_f;
    reg [2:0]   state_prev_f;
    reg [2:0]   state_next;

    // Signals to trigger the sync method submodules
    // that we need a thread select decision from it
    reg         esl_stsm_trigger;
    reg         esl_rtsm_trigger;
    reg         esl_htsm_trigger;
    reg         esl_rcfg_trigger; 

    //
    // Sequential Logic
    //

    // State sequential logic
    always @ (posedge clk)
    begin
        if (~rst_n)
        begin
            state_f <= DIVERGED;
            state_prev_f <= DIVERGED;
        end
        else
        begin
            state_f <= state_next;
            state_prev_f <= state_f;
        end
    end

    //
    // Combinational Logic
    //

    // Next state and output logic
    always @ *
    begin
        // Default values
        state_next = state_f;
        esl_fcl_nextthr_bf = 4'b0000;
        esl_fcl_stall_bf = 1'b0;
        esl_fcl_switch_bf = 1'b0;
        esl_fdp_sync_pcs_bf = 1'b0;
        esl_fcl_ntr_s = 1'b0;
        esl_fdp_issue_prev_inst_next_s = 1'b0;
        esl_fcl_force_running_s = 1'b0;
        esl_stsm_trigger = 1'b0;
        esl_rtsm_trigger = 1'b0;
        esl_htsm_trigger = 1'b0;
        esl_rcfg_trigger = 1'b0;

        // If no threads are active, just idle
        if (swl_esl_thr_active == 4'b0000)
        begin
            state_next = DIVERGED;
            esl_fcl_nextthr_bf = 4'b0000;
            esl_fcl_stall_bf = 1'b0;
            esl_fcl_switch_bf = 1'b0;
            esl_fdp_sync_pcs_bf = 1'b0;
            esl_fcl_ntr_s = 1'b0; 
            esl_fdp_issue_prev_inst_next_s = 1'b0;
            esl_fcl_force_running_s = 1'b0;
        end
        // If only thr0 is active, just select it
        else if (swl_esl_thr_active == 4'b0001)
        begin
            state_next = DIVERGED;
            esl_fcl_nextthr_bf = 4'b0001;
            esl_fcl_stall_bf = 1'b0;
            esl_fcl_switch_bf = swl_esl_thr_sprdy_or_urdy[0];
            esl_fdp_sync_pcs_bf = 1'b0;
            esl_fcl_ntr_s = swl_esl_thr_sprdy_or_urdy[0];
            esl_fdp_issue_prev_inst_next_s = 1'b0;
            esl_fcl_force_running_s = 1'b0;
        end
        // If only thr1 is active, just select it
        else if (swl_esl_thr_active == 4'b0010)
        begin
            state_next = DIVERGED;
            esl_fcl_nextthr_bf = 4'b0010;
            esl_fcl_stall_bf = 1'b0;
            esl_fcl_switch_bf = swl_esl_thr_sprdy_or_urdy[1];
            esl_fdp_sync_pcs_bf = 1'b0;
            esl_fcl_ntr_s = swl_esl_thr_sprdy_or_urdy[1];
            esl_fdp_issue_prev_inst_next_s = 1'b0;
            esl_fcl_force_running_s = 1'b0;
        end
        // Otherwise, if both threads are active - need to synchronize
        else if (swl_esl_thr_active == 4'b0011)
        begin
            case (state_f)
                DIVERGED:
                begin
                    // Never stall, sync PCs, issue prev instruction 
                    // next, or force running in diverged case
                    esl_fcl_stall_bf = 1'b0;
                    esl_fdp_sync_pcs_bf = 1'b0;
                    esl_fdp_issue_prev_inst_next_s = 1'b0;
                    esl_fcl_force_running_s = 1'b0;
                    // Trigger configured sync method module
                    // and accept outputs from it
                    case (config_esl_sync_method)
                        `ED_STSM:
                        begin
                            esl_stsm_trigger    = 1'b1;
                            state_next          = esl_stsm_state_next;
                            esl_fcl_nextthr_bf  = esl_stsm_fcl_nextthr_bf;
                            esl_fcl_switch_bf   = esl_stsm_fcl_switch_bf;
                            esl_fcl_ntr_s       = esl_stsm_fcl_ntr_s;
                        end
                        `ED_RTSM:
                        begin
                            esl_rtsm_trigger    = 1'b1;
                            state_next          = esl_rtsm_state_next;
                            esl_fcl_nextthr_bf  = esl_rtsm_fcl_nextthr_bf;
                            esl_fcl_switch_bf   = esl_rtsm_fcl_switch_bf;
                            esl_fcl_ntr_s       = esl_rtsm_fcl_ntr_s; 
                        end
                        `ED_HTSM:
                        begin
                            esl_htsm_trigger    = 1'b1;
                            state_next          = esl_htsm_state_next;
                            esl_fcl_nextthr_bf  = esl_htsm_fcl_nextthr_bf;
                            esl_fcl_switch_bf   = esl_htsm_fcl_switch_bf;
                            esl_fcl_ntr_s       = esl_htsm_fcl_ntr_s;
                        end
                        `ED_RCFG:
                        begin
                            esl_rcfg_trigger    = 1'b1;
                            state_next          = esl_rcfg_state_next;
                            esl_fcl_nextthr_bf  = esl_rcfg_fcl_nextthr_bf;
                            esl_fcl_switch_bf   = esl_rcfg_fcl_switch_bf;
                            esl_fcl_ntr_s       = esl_rcfg_fcl_ntr_s;
                        end
                        default:
                        begin
                            state_next          = 3'bx;
                            esl_fcl_nextthr_bf  = 4'bx;
                            esl_fcl_switch_bf   = 1'bx;
                            esl_fcl_ntr_s       = 1'bx;
                        end
                    endcase
                end
                DIVERGED_DRAFT:
                begin
                    // Select thr1 and go back to diverged
                    state_next = DIVERGED;
                    esl_fcl_nextthr_bf = 4'b0010;
                    esl_fcl_stall_bf = 1'b0;
                    esl_fcl_switch_bf = 1'b1;
                    esl_fdp_sync_pcs_bf = 1'b0;
                    esl_fcl_ntr_s = 1'b1;
                    esl_fdp_issue_prev_inst_next_s = 1'b0;
                    esl_fcl_force_running_s = 1'b0;
                end
                CONVERGED:
                begin
                    // If we diverge due to a page boundary, a branch,
                    // a trap, or a rollback, start fetching for thr1 
                    // again and go to diverged (should reconverge very
                    // quickly after a rollback)
                    if (esl_pcs_pa_page_bndry_s | esl_ctrl_flow_diverged_late_s | 
                        esl_any_trap_bf | fcl_esl_rb_stg_s)
                    begin
                        state_next = DIVERGED;
                        esl_fcl_nextthr_bf = 4'b0010;
                        esl_fcl_stall_bf = 1'b0;
                        esl_fcl_switch_bf = swl_esl_thr_sprdy_or_urdy[1];
                        // BUG FIX: Fixes bug of executing an instruction
                        // twice in this case. The instruction for thread
                        // 0 may have just executed on the previous cycle
                        // if we went from CONVERGED->DIVERGED->CONVERGED
                        // without stalling at all.  Thus, the PC just got
                        // updated and we need to synchronize for one more
                        // cycle.  However, in all other cases we should
                        // not sync the PCs, since they may diverge and
                        // we are asking to fetch for thread 1 on the next
                        // cycle, which causes thread 1's PC to change.
                        // BE CAREFUL CHANGING THIS
                        if (state_prev_f != CONVERGED)
                            esl_fdp_sync_pcs_bf = 1'b1;
                        else
                            esl_fdp_sync_pcs_bf = 1'b0;
                        esl_fcl_ntr_s = swl_esl_thr_sprdy_or_urdy[1];
                        esl_fdp_issue_prev_inst_next_s = 1'b0;
                        esl_fcl_force_running_s = 1'b0;
                    end
                    // If at least one thread is not ready, we will just wait
                    // TODO: We may want to change this
                    else if (!(swl_esl_thr_sprdy_or_urdy[0] && 
                               (swl_esl_thr_sprdy_or_urdy[1] || swl_esl_thr_sprdy_or_urdy_next[1])))
                    begin
                        state_next = CONVERGED;
                        esl_fcl_nextthr_bf = 4'b0000;
                        esl_fcl_stall_bf = 1'b0;
                        esl_fcl_switch_bf = 1'b0;
                        // BUG FIX: In the case an I-cache miss occurs,
                        // we do not want to sync the pcs until we know
                        // we are not going to diverge due to a branch later.
                        // If we have a branch followed by another instruction
                        // that misses in the I-cache, thread1 does not
                        // get info that it also missed in the cache
                        // and may skip the instruction that missed
                        if (swl_esl_icmiss_out && esl_unresolved_br)
                            esl_fdp_sync_pcs_bf = 1'b0;
                        else
                            esl_fdp_sync_pcs_bf = 1'b1;
                        esl_fcl_ntr_s = 1'b1; // Note: This switches out any running thread
                        esl_fdp_issue_prev_inst_next_s = 1'b0;
                        esl_fcl_force_running_s = 1'b0;
                    end
                    // Otherwise, both threads are ready
                    else
                    begin 
                        // If instruction for thr0 is not ready, need to wait
                        if (!fcl_esl_tinst_vld_s[0])
                        begin
                            state_next = CONVERGED;
                            esl_fcl_nextthr_bf = 4'b0001;
                            esl_fcl_stall_bf = 1'b0;
                            esl_fcl_switch_bf = 1'b1;
                            esl_fdp_sync_pcs_bf = 1'b1;
                            esl_fcl_ntr_s = 1'b1;
                            esl_fdp_issue_prev_inst_next_s = 1'b0;
                            esl_fcl_force_running_s = 1'b0;
                        end
                        // Otherwise, both threads are ready and 
                        // thr0 instruction is ready
                        else
                        begin
                            state_next = CONVERGED_DRAFT;
                            esl_fcl_nextthr_bf = 4'b0001;
                            esl_fcl_stall_bf = 1'b0;
                            esl_fcl_switch_bf = 1'b1;
                            esl_fdp_sync_pcs_bf = 1'b1;
                            esl_fcl_ntr_s = 1'b1;
                            esl_fdp_issue_prev_inst_next_s = 1'b0;
                            esl_fcl_force_running_s = 1'b0;
                        end
                    end 
                end
                CONVERGED_DRAFT:
                begin
                    // If we diverge due to a page boundary, a branch,
                    // a trap, or a rollback, start fetching for thr1 
                    // again and go to diverged (should reconverge very
                    // quickly after a rollback)  
                    if (esl_pcs_pa_page_bndry_s | esl_ctrl_flow_diverged_late_s |
                        esl_any_trap_bf | fcl_esl_rb_stg_s)
                    begin
                        state_next = DIVERGED;
                        esl_fcl_nextthr_bf = 4'b0010;
                        esl_fcl_stall_bf = 1'b0;
                        esl_fcl_switch_bf = swl_esl_thr_sprdy_or_urdy[1];
                        esl_fdp_sync_pcs_bf = 1'b0;
                        esl_fcl_ntr_s = swl_esl_thr_sprdy_or_urdy[1];
                        // BUFIX: If the instruction was rolled back,
                        // then NOP is in the previous instruction
                        // register as the previous instruction
                        // was killed. It may be possible to 
                        // grab that instruction from not being
                        // MUXED to a NOP before the execdraft
                        // replay mux to improve performance, but
                        // leaving this as a TODO
                        // BUG FIX: Trap takes precedence over rollback,
                        // need to still draft in case of trap
                        if (fcl_esl_rb_stg_s && !esl_any_trap_bf)
                        begin
                            esl_fdp_issue_prev_inst_next_s = 1'b0;
                            esl_fcl_force_running_s = 1'b0;
                        end
                        else
                        begin
                            esl_fdp_issue_prev_inst_next_s = 1'b1;
                            esl_fcl_force_running_s = 1'b1;
                        end
                    end
                    // Otherwise, we issue previous instruction for thr1
                    // and do not fetch
                    else
                    begin
                        state_next = CONVERGED;
                        esl_fcl_nextthr_bf = 4'b0010;
                        esl_fcl_stall_bf = 1'b1;
                        esl_fcl_switch_bf = 1'b1;
                        esl_fdp_sync_pcs_bf = 1'b1;
                        esl_fcl_ntr_s = 1'b1;
                        esl_fdp_issue_prev_inst_next_s = 1'b1;
                        esl_fcl_force_running_s = 1'b1;
                    end
                end
                DIVERGED_DIFFERENT_CODE_RCFG0:
                begin
                    // Never stall, sync PCs, issue prev instruction 
                    // next, or force running in diverged case
                    esl_fcl_stall_bf = 1'b0;
                    esl_fdp_sync_pcs_bf = 1'b0;
                    esl_fdp_issue_prev_inst_next_s = 1'b0;
                    esl_fcl_force_running_s = 1'b0;
                    // Trigger configured sync method module
                    // and accept outputs from it
                    case (config_esl_sync_method)
                        `ED_STSM:
                        begin
                            esl_stsm_trigger    = 1'b1;
                            state_next          = esl_stsm_state_next;
                            esl_fcl_nextthr_bf  = esl_stsm_fcl_nextthr_bf;
                            esl_fcl_switch_bf   = esl_stsm_fcl_switch_bf;
                            esl_fcl_ntr_s       = esl_stsm_fcl_ntr_s;
                        end
                        `ED_RTSM:
                        begin
                            esl_rtsm_trigger    = 1'b1;
                            state_next          = esl_rtsm_state_next;
                            esl_fcl_nextthr_bf  = esl_rtsm_fcl_nextthr_bf;
                            esl_fcl_switch_bf   = esl_rtsm_fcl_switch_bf;
                            esl_fcl_ntr_s       = esl_rtsm_fcl_ntr_s;
                        end
                        `ED_HTSM:
                        begin
                            esl_htsm_trigger    = 1'b1;
                            state_next          = esl_htsm_state_next;
                            esl_fcl_nextthr_bf  = esl_htsm_fcl_nextthr_bf;
                            esl_fcl_switch_bf   = esl_htsm_fcl_switch_bf;
                            esl_fcl_ntr_s       = esl_htsm_fcl_ntr_s;
                        end
                        `ED_RCFG:
                        begin
                            esl_rcfg_trigger    = 1'b1;
                            state_next          = esl_rcfg_state_next;
                            esl_fcl_nextthr_bf  = esl_rcfg_fcl_nextthr_bf;
                            esl_fcl_switch_bf   = esl_rcfg_fcl_switch_bf;
                            esl_fcl_ntr_s       = esl_rcfg_fcl_ntr_s;
                        end
                        default:
                        begin
                            state_next          = 3'bx;
                            esl_fcl_nextthr_bf  = 4'bx;
                            esl_fcl_switch_bf   = 1'bx;
                            esl_fcl_ntr_s       = 1'bx;
                        end
                    endcase 
                end
                RCFG1:
                begin
                    // Never stall, sync PCs, issue prev instruction 
                    // next, or force running in diverged case
                    esl_fcl_stall_bf = 1'b0;
                    esl_fdp_sync_pcs_bf = 1'b0;
                    esl_fdp_issue_prev_inst_next_s = 1'b0;
                    esl_fcl_force_running_s = 1'b0;
                    // Trigger configured sync method module
                    // and accept outputs from it
                    case (config_esl_sync_method)
                        `ED_STSM:
                        begin
                            esl_stsm_trigger    = 1'b1;
                            state_next          = esl_stsm_state_next;
                            esl_fcl_nextthr_bf  = esl_stsm_fcl_nextthr_bf;
                            esl_fcl_switch_bf   = esl_stsm_fcl_switch_bf;
                            esl_fcl_ntr_s       = esl_stsm_fcl_ntr_s;
                        end
                        `ED_RTSM:
                        begin
                            esl_rtsm_trigger    = 1'b1;
                            state_next          = esl_rtsm_state_next;
                            esl_fcl_nextthr_bf  = esl_rtsm_fcl_nextthr_bf;
                            esl_fcl_switch_bf   = esl_rtsm_fcl_switch_bf;
                            esl_fcl_ntr_s       = esl_rtsm_fcl_ntr_s;
                        end
                        `ED_HTSM:
                        begin
                            esl_htsm_trigger    = 1'b1;
                            state_next          = esl_htsm_state_next;
                            esl_fcl_nextthr_bf  = esl_htsm_fcl_nextthr_bf;
                            esl_fcl_switch_bf   = esl_htsm_fcl_switch_bf;
                            esl_fcl_ntr_s       = esl_htsm_fcl_ntr_s;
                        end
                        `ED_RCFG:
                        begin
                            esl_rcfg_trigger    = 1'b1;
                            state_next          = esl_rcfg_state_next;
                            esl_fcl_nextthr_bf  = esl_rcfg_fcl_nextthr_bf;
                            esl_fcl_switch_bf   = esl_rcfg_fcl_switch_bf;
                            esl_fcl_ntr_s       = esl_rcfg_fcl_ntr_s;
                        end
                        default:
                        begin
                            state_next          = 3'bx;
                            esl_fcl_nextthr_bf  = 4'bx;
                            esl_fcl_switch_bf   = 1'bx;
                            esl_fcl_ntr_s       = 1'bx;
                        end
                    endcase
                end
                RCFG2:
                begin
                    // Never stall, sync PCs, issue prev instruction 
                    // next, or force running in diverged case
                    esl_fcl_stall_bf = 1'b0;
                    esl_fdp_sync_pcs_bf = 1'b0;
                    esl_fdp_issue_prev_inst_next_s = 1'b0;
                    esl_fcl_force_running_s = 1'b0;
                    // Trigger configured sync method module
                    // and accept outputs from it
                    case (config_esl_sync_method)
                        `ED_STSM:
                        begin
                            esl_stsm_trigger    = 1'b1;
                            state_next          = esl_stsm_state_next;
                            esl_fcl_nextthr_bf  = esl_stsm_fcl_nextthr_bf;
                            esl_fcl_switch_bf   = esl_stsm_fcl_switch_bf;
                            esl_fcl_ntr_s       = esl_stsm_fcl_ntr_s;
                        end
                        `ED_RTSM:
                        begin
                            esl_rtsm_trigger    = 1'b1;
                            state_next          = esl_rtsm_state_next;
                            esl_fcl_nextthr_bf  = esl_rtsm_fcl_nextthr_bf;
                            esl_fcl_switch_bf   = esl_rtsm_fcl_switch_bf;
                            esl_fcl_ntr_s       = esl_rtsm_fcl_ntr_s;
                        end
                        `ED_HTSM:
                        begin
                            esl_htsm_trigger    = 1'b1;
                            state_next          = esl_htsm_state_next;
                            esl_fcl_nextthr_bf  = esl_htsm_fcl_nextthr_bf;
                            esl_fcl_switch_bf   = esl_htsm_fcl_switch_bf;
                            esl_fcl_ntr_s       = esl_htsm_fcl_ntr_s;
                        end
                        `ED_RCFG:
                        begin
                            esl_rcfg_trigger    = 1'b1;
                            state_next          = esl_rcfg_state_next;
                            esl_fcl_nextthr_bf  = esl_rcfg_fcl_nextthr_bf;
                            esl_fcl_switch_bf   = esl_rcfg_fcl_switch_bf;
                            esl_fcl_ntr_s       = esl_rcfg_fcl_ntr_s;
                        end
                        default:
                        begin
                            state_next          = 3'bx;
                            esl_fcl_nextthr_bf  = 4'bx;
                            esl_fcl_switch_bf   = 1'bx;
                            esl_fcl_ntr_s       = 1'bx;
                        end
                    endcase
                end
                RCFG3:
                begin
                    // Never stall, sync PCs, issue prev instruction 
                    // next, or force running in diverged case
                    esl_fcl_stall_bf = 1'b0;
                    esl_fdp_sync_pcs_bf = 1'b0;
                    esl_fdp_issue_prev_inst_next_s = 1'b0;
                    esl_fcl_force_running_s = 1'b0;
                    // Trigger configured sync method module
                    // and accept outputs from it
                    case (config_esl_sync_method)
                        `ED_STSM:
                        begin
                            esl_stsm_trigger    = 1'b1;
                            state_next          = esl_stsm_state_next;
                            esl_fcl_nextthr_bf  = esl_stsm_fcl_nextthr_bf;
                            esl_fcl_switch_bf   = esl_stsm_fcl_switch_bf;
                            esl_fcl_ntr_s       = esl_stsm_fcl_ntr_s;
                        end
                        `ED_RTSM:
                        begin
                            esl_rtsm_trigger    = 1'b1;
                            state_next          = esl_rtsm_state_next;
                            esl_fcl_nextthr_bf  = esl_rtsm_fcl_nextthr_bf;
                            esl_fcl_switch_bf   = esl_rtsm_fcl_switch_bf;
                            esl_fcl_ntr_s       = esl_rtsm_fcl_ntr_s;
                        end
                        `ED_HTSM:
                        begin
                            esl_htsm_trigger    = 1'b1;
                            state_next          = esl_htsm_state_next;
                            esl_fcl_nextthr_bf  = esl_htsm_fcl_nextthr_bf;
                            esl_fcl_switch_bf   = esl_htsm_fcl_switch_bf;
                            esl_fcl_ntr_s       = esl_htsm_fcl_ntr_s;
                        end
                        `ED_RCFG:
                        begin
                            esl_rcfg_trigger    = 1'b1;
                            state_next          = esl_rcfg_state_next;
                            esl_fcl_nextthr_bf  = esl_rcfg_fcl_nextthr_bf;
                            esl_fcl_switch_bf   = esl_rcfg_fcl_switch_bf;
                            esl_fcl_ntr_s       = esl_rcfg_fcl_ntr_s;
                        end
                        default:
                        begin
                            state_next          = 3'bx;
                            esl_fcl_nextthr_bf  = 4'bx;
                            esl_fcl_switch_bf   = 1'bx;
                            esl_fcl_ntr_s       = 1'bx;
                        end
                    endcase
                end
                default:
                begin
                    state_next = 3'bx;
                    esl_fcl_nextthr_bf = 4'bxxxx;
                    esl_fcl_stall_bf = 1'bx;
                    esl_fcl_switch_bf = 1'bx;
                    esl_fdp_sync_pcs_bf = 1'bx;
                    esl_fcl_ntr_s = 1'bx;
                    esl_fdp_issue_prev_inst_next_s = 1'bx;
                    esl_fcl_force_running_s = 1'bx;
                end 
            endcase
        end
    end

    // Signal multiplexing for signals going into shared submodules (counter, LFSR
    // and offset register)
    always @ *
    begin
        case (config_esl_sync_method)
            `ED_STSM:
            begin
                esl_lfsr_step = esl_stsm_lfsr_step;
                esl_timeout_counter_step = esl_stsm_timeout_counter_step;
                esl_timeout_counter_clear = esl_stsm_timeout_counter_clear;
                esl_timeout_counter_set = esl_stsm_timeout_counter_set;
                esl_pc_va_diff_offset_we = esl_stsm_pc_va_diff_offset_we;
                esl_pc_va_diff_offset_clear = esl_stsm_pc_va_diff_offset_clear;
                esl_timeout_shiftreg_step = esl_stsm_timeout_shiftreg_step;
                esl_timeout_shiftreg_set = esl_stsm_timeout_shiftreg_set;
                esl_timeout_counter_cmp_config = esl_stsm_timeout_counter_cmp_config;
            end
            `ED_RTSM:
            begin
                esl_lfsr_step = esl_rtsm_lfsr_step;
                esl_timeout_counter_step = esl_rtsm_timeout_counter_step;
                esl_timeout_counter_clear = esl_rtsm_timeout_counter_clear;
                esl_timeout_counter_set = esl_rtsm_timeout_counter_set;
                esl_pc_va_diff_offset_we = esl_rtsm_pc_va_diff_offset_we;
                esl_pc_va_diff_offset_clear = esl_rtsm_pc_va_diff_offset_clear;
                esl_timeout_shiftreg_step = esl_rtsm_timeout_shiftreg_step;
                esl_timeout_shiftreg_set = esl_rtsm_timeout_shiftreg_set;
                esl_timeout_counter_cmp_config = esl_rtsm_timeout_counter_cmp_config;
            end
            `ED_HTSM:
            begin
                esl_lfsr_step = esl_htsm_lfsr_step;
                esl_timeout_counter_step = esl_htsm_timeout_counter_step;
                esl_timeout_counter_clear = esl_htsm_timeout_counter_clear;
                esl_timeout_counter_set = esl_htsm_timeout_counter_set;
                esl_pc_va_diff_offset_we = esl_htsm_pc_va_diff_offset_we;
                esl_pc_va_diff_offset_clear = esl_htsm_pc_va_diff_offset_clear;
                esl_timeout_shiftreg_step = esl_htsm_timeout_shiftreg_step;
                esl_timeout_shiftreg_set = esl_htsm_timeout_shiftreg_set;
                esl_timeout_counter_cmp_config = esl_htsm_timeout_counter_cmp_config;
            end
            `ED_RCFG:
            begin
                esl_lfsr_step = esl_rcfg_lfsr_step;
                esl_timeout_counter_step = esl_rcfg_timeout_counter_step;
                esl_timeout_counter_clear = esl_rcfg_timeout_counter_clear;
                esl_timeout_counter_set = esl_rcfg_timeout_counter_set;
                esl_pc_va_diff_offset_we = esl_rcfg_pc_va_diff_offset_we;
                esl_pc_va_diff_offset_clear = esl_rcfg_pc_va_diff_offset_clear;
                esl_timeout_shiftreg_step = esl_rcfg_timeout_shiftreg_step;
                esl_timeout_shiftreg_set = esl_rcfg_timeout_shiftreg_set;
                esl_timeout_counter_cmp_config = esl_rcfg_timeout_counter_cmp_config;
            end
            default:
            begin
                esl_lfsr_step = 1'bx;
                esl_timeout_counter_step = 1'bx;
                esl_timeout_counter_clear = 1'bx;
                esl_timeout_counter_set = 1'bx;
                esl_pc_va_diff_offset_we = 1'bx;
                esl_pc_va_diff_offset_clear = 1'bx;
                esl_timeout_shiftreg_step = 1'bx;
                esl_timeout_shiftreg_set = 1'bx;
            end
        endcase 
    end

    // Counter threshold comparisons
    always @ *
    begin
        esl_counter_timeout = (esl_timeout_counter_count_f >= 
                              (esl_timeout_counter_cmp_config ? config_esl_counter_timeout 
                                                              : esl_timeout_shiftreg_f));
    end

    //
    // Sub-module instantiations
    //

    // LFSR for pseudo random bits (shared resource)
    sparc_ifu_esl_lfsr lfsr
    (
        .clk (clk),
        .rst_n (rst_n),
        .lfsr_seed (config_esl_lfsr_seed),
        .lfsr_ld (config_esl_lfsr_ld),
        .lfsr_step (config_esl_en & esl_lfsr_step),
        .lfsr_state_f (),
        .lfsr_out_f (pseudo_rand_f)
    );

    // Timeout counter (shared resource)
    sparc_ifu_esl_counter 
    #(
        .COUNT_BIT_WIDTH (`ED_TIMEOUT_COUNTER_BIT_WIDTH)
    ) cfg_timeout_counter
    (
        .clk (clk),
        .rst_n (rst_n),
        .step (config_esl_en & esl_timeout_counter_step),
        .clear (config_esl_en & esl_timeout_counter_clear),
        .set (config_esl_en & esl_timeout_counter_set),
        .count_f (esl_timeout_counter_count_f)
    );

    // Shift register which sets one of the possible timeouts
    // for above counter (shared resource)
    sparc_ifu_esl_shiftreg 
    #(
        .SHIFT_REG_BIT_WIDTH (`ED_TIMEOUT_COUNTER_BIT_WIDTH)
    ) timeout_shiftreg
    (
        .clk (clk),
        .rst_n (rst_n),
        .step (config_esl_en & esl_timeout_shiftreg_step),
        .set (config_esl_en & esl_timeout_shiftreg_set),
        .shift_reg_f (esl_timeout_shiftreg_f)
    );

    // STSM synchronization mechanism
    sparc_ifu_esl_stsm 
    #(
        .DIVERGED (DIVERGED),
        .DIVERGED_DRAFT (DIVERGED_DRAFT),
        .CONVERGED (CONVERGED),
        .CONVERGED_DRAFT (CONVERGED_DRAFT),
        .DIVERGED_DIFFERENT_CODE_RCFG0 (DIVERGED_DIFFERENT_CODE_RCFG0),
        .RCFG1 (RCFG1),
        .RCFG2 (RCFG2),
        .RCFG3 (RCFG3)
    ) stsm
    (
        .esl_stsm_trigger (esl_stsm_trigger),
        .esl_state_f (state_f),
        .swl_esl_thr_sprdy_or_urdy (swl_esl_thr_sprdy_or_urdy),
        .fcl_esl_tinst_vld_s (fcl_esl_tinst_vld_s),
        .esl_pc_va_diff_lt_thresh_s (esl_pc_va_diff_lt_thresh_s),
        .esl_counter_timeout (esl_counter_timeout),
        .esl_min_pc_va_s (esl_min_pc_va_s),
        .fcl_esl_thr_f (fcl_esl_thr_f),
        .esl_tirs_eql_s (esl_tirs_eql_s),
        .esl_ops_eql_s (esl_ops_eql_s),
        .esl_pcs_pa_eql_s (esl_pcs_pa_eql_s),
        .esl_unresolved_br (esl_unresolved_br),
        .esl_brtrp_target_pc_bf_f (esl_brtrp_target_pc_bf_f),
        .esl_stsm_state_next (esl_stsm_state_next),
        .esl_stsm_fcl_nextthr_bf (esl_stsm_fcl_nextthr_bf),
        .esl_stsm_fcl_switch_bf (esl_stsm_fcl_switch_bf),
        .esl_stsm_fcl_ntr_s (esl_stsm_fcl_ntr_s),
        .esl_stsm_lfsr_step (esl_stsm_lfsr_step),
        .esl_stsm_timeout_counter_step (esl_stsm_timeout_counter_step),
        .esl_stsm_timeout_counter_clear (esl_stsm_timeout_counter_clear),
        .esl_stsm_timeout_counter_set (esl_stsm_timeout_counter_set),
        .esl_stsm_pc_va_diff_offset_we (esl_stsm_pc_va_diff_offset_we),
        .esl_stsm_pc_va_diff_offset_clear (esl_stsm_pc_va_diff_offset_clear),
        .esl_stsm_timeout_shiftreg_step (esl_stsm_timeout_shiftreg_step),
        .esl_stsm_timeout_shiftreg_set (esl_stsm_timeout_shiftreg_set),
        .esl_stsm_timeout_counter_cmp_config (esl_stsm_timeout_counter_cmp_config)
    );

    // RTSM synchronization mechanism
    sparc_ifu_esl_rtsm 
    #(
        .DIVERGED (DIVERGED),
        .DIVERGED_DRAFT (DIVERGED_DRAFT),
        .CONVERGED (CONVERGED),
        .CONVERGED_DRAFT (CONVERGED_DRAFT),
        .DIVERGED_DIFFERENT_CODE_RCFG0 (DIVERGED_DIFFERENT_CODE_RCFG0),
        .RCFG1 (RCFG1),
        .RCFG2 (RCFG2),
        .RCFG3 (RCFG3)
    ) rtsm
    (
        .esl_rtsm_trigger (esl_rtsm_trigger),
        .esl_state_f (state_f),
        .swl_esl_thr_sprdy_or_urdy (swl_esl_thr_sprdy_or_urdy),
        .fcl_esl_tinst_vld_s (fcl_esl_tinst_vld_s),
        .pseudo_rand_f (pseudo_rand_f),
        .fcl_esl_thr_f (fcl_esl_thr_f),
        .esl_tirs_eql_s (esl_tirs_eql_s),
        .esl_ops_eql_s (esl_ops_eql_s),
        .esl_pcs_pa_eql_s (esl_pcs_pa_eql_s),
        .esl_unresolved_br (esl_unresolved_br),
        .esl_brtrp_target_pc_bf_f (esl_brtrp_target_pc_bf_f),
        .esl_rtsm_state_next (esl_rtsm_state_next),
        .esl_rtsm_fcl_nextthr_bf (esl_rtsm_fcl_nextthr_bf),
        .esl_rtsm_fcl_switch_bf (esl_rtsm_fcl_switch_bf),
        .esl_rtsm_fcl_ntr_s (esl_rtsm_fcl_ntr_s),
        .esl_rtsm_lfsr_step (esl_rtsm_lfsr_step),
        .esl_rtsm_timeout_counter_step (esl_rtsm_timeout_counter_step),
        .esl_rtsm_timeout_counter_clear (esl_rtsm_timeout_counter_clear),
        .esl_rtsm_timeout_counter_set (esl_rtsm_timeout_counter_set),
        .esl_rtsm_pc_va_diff_offset_we (esl_rtsm_pc_va_diff_offset_we),
        .esl_rtsm_pc_va_diff_offset_clear (esl_rtsm_pc_va_diff_offset_clear),
        .esl_rtsm_timeout_shiftreg_step (esl_rtsm_timeout_shiftreg_step),
        .esl_rtsm_timeout_shiftreg_set (esl_rtsm_timeout_shiftreg_set),
        .esl_rtsm_timeout_counter_cmp_config (esl_rtsm_timeout_counter_cmp_config)
    );

    // HTSM synchronization mechanism
    sparc_ifu_esl_htsm
    #(
        .DIVERGED (DIVERGED),
        .DIVERGED_DRAFT (DIVERGED_DRAFT),
        .CONVERGED (CONVERGED),
        .CONVERGED_DRAFT (CONVERGED_DRAFT),
        .DIVERGED_DIFFERENT_CODE_RCFG0 (DIVERGED_DIFFERENT_CODE_RCFG0),
        .RCFG1 (RCFG1),
        .RCFG2 (RCFG2),
        .RCFG3 (RCFG3)
    ) htsm
    (
        .clk (clk),
        .rst_n (rst_n),
        .esl_htsm_trigger (esl_htsm_trigger),
        .esl_state_f (state_f),
        .swl_esl_thr_sprdy_or_urdy (swl_esl_thr_sprdy_or_urdy),
        .fcl_esl_tinst_vld_s (fcl_esl_tinst_vld_s),
        .pseudo_rand_f (pseudo_rand_f),
        .esl_pc_va_diff_lt_thresh_s (esl_pc_va_diff_lt_thresh_s),
        .esl_counter_timeout (esl_counter_timeout),
        .esl_shiftreg_lsb (esl_timeout_shiftreg_f[0]),
        .esl_min_pc_va_s (esl_min_pc_va_s),
        .esl_pcs_va_eql_s (esl_pcs_va_eql_s),
        .fcl_esl_thr_f (fcl_esl_thr_f),
        .esl_tirs_eql_s (esl_tirs_eql_s),
        .esl_ops_eql_s (esl_ops_eql_s),
        .esl_pcs_pa_eql_s (esl_pcs_pa_eql_s),
        .esl_unresolved_br (esl_unresolved_br),
        .esl_brtrp_target_pc_bf_f (esl_brtrp_target_pc_bf_f),
        .esl_htsm_state_next (esl_htsm_state_next),
        .esl_htsm_fcl_nextthr_bf (esl_htsm_fcl_nextthr_bf),
        .esl_htsm_fcl_switch_bf (esl_htsm_fcl_switch_bf),
        .esl_htsm_fcl_ntr_s (esl_htsm_fcl_ntr_s),
        .esl_htsm_lfsr_step (esl_htsm_lfsr_step),
        .esl_htsm_timeout_counter_step (esl_htsm_timeout_counter_step),
        .esl_htsm_timeout_counter_clear (esl_htsm_timeout_counter_clear),
        .esl_htsm_timeout_counter_set (esl_htsm_timeout_counter_set),
        .esl_htsm_pc_va_diff_offset_we (esl_htsm_pc_va_diff_offset_we),
        .esl_htsm_pc_va_diff_offset_clear (esl_htsm_pc_va_diff_offset_clear),
        .esl_htsm_timeout_shiftreg_step (esl_htsm_timeout_shiftreg_step),
        .esl_htsm_timeout_shiftreg_set (esl_htsm_timeout_shiftreg_set),
        .esl_htsm_timeout_counter_cmp_config (esl_htsm_timeout_counter_cmp_config)
    );

endmodule
