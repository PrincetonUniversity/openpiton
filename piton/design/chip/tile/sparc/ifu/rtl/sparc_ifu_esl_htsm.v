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
 *      This module implements the portions of the Execution Drafting FSM
 *      that are specific to HTSM.
 */

module sparc_ifu_esl_htsm
#(
    parameter DIVERGED = 0,
    parameter DIVERGED_DRAFT = 1,
    parameter CONVERGED = 2,
    parameter CONVERGED_DRAFT = 3,
    parameter DIVERGED_DIFFERENT_CODE_RCFG0 = 4,
    parameter RCFG1 = 5,
    parameter RCFG2 = 6,
    parameter RCFG3 = 7
)
(
    input               clk,
    input               rst_n,

    // Trigger for condition where this module
    // makes the thread select decision
    input               esl_htsm_trigger,
   
    // Current state of ESL FSM
    input [2:0]         esl_state_f,

    // Thread ready signals
    input [3:0]         swl_esl_thr_sprdy_or_urdy,

    // Instructions valid in S
    input [3:0]         fcl_esl_tinst_vld_s,

    // Pseudo-random bit
    input               pseudo_rand_f,

    // Difference in VA PCs lessthan the threshold
    input               esl_pc_va_diff_lt_thresh_s,

    // The counter reached the configured timeout value
    input               esl_counter_timeout,

    // The LSB of the shift register
    input               esl_shiftreg_lsb,

    // Thread with minimum PC
    input [3:0]         esl_min_pc_va_s,

    // VA PCs equal (including offset)
    input               esl_pcs_va_eql_s,

    // Thread in the F stage
    input [3:0]         fcl_esl_thr_f,

    // Information about thread instructions
    input               esl_tirs_eql_s,
    input               esl_ops_eql_s,
    input               esl_pcs_pa_eql_s,

    // Unresolved branch in pipe
    input               esl_unresolved_br,

    // Branch or trap PC in bf or f
    input               esl_brtrp_target_pc_bf_f,

    // Outputs to core and ED FSM
    output reg [2:0]    esl_htsm_state_next,
    output reg [3:0]    esl_htsm_fcl_nextthr_bf,
    output reg          esl_htsm_fcl_switch_bf,
    output reg          esl_htsm_fcl_ntr_s,
    output reg          esl_htsm_lfsr_step,
    output reg          esl_htsm_timeout_counter_step,
    output reg          esl_htsm_timeout_counter_clear,
    output reg          esl_htsm_timeout_counter_set,
    output reg          esl_htsm_pc_va_diff_offset_we,
    output reg          esl_htsm_pc_va_diff_offset_clear,
    output reg          esl_htsm_timeout_shiftreg_step,
    output reg          esl_htsm_timeout_shiftreg_set,
    output reg          esl_htsm_timeout_counter_cmp_config
);

    //
    // Signal Declarations
    //
    
    // Register to keep track of which thread we are issuing
    // when sliding thread past each other
    reg esl_htsm_sliding_thread_f;
    reg esl_htsm_sliding_thread_next;

    //
    // Sequential Logic
    //
    
    // Flip-flop to keep track of which thread is sliding
    always @ (posedge clk)
    begin
        if (~rst_n)
            esl_htsm_sliding_thread_f <= 1'b0;
        else
            esl_htsm_sliding_thread_f <= esl_htsm_sliding_thread_next;
    end
    

    //
    // Combinational Logic
    //

    always @ *
    begin
        // LFSR should always be running
        esl_htsm_lfsr_step = 1'b1;

        // Default is to clear the counter
        esl_htsm_timeout_counter_step = 1'b0;
        esl_htsm_timeout_counter_clear = 1'b1;
        esl_htsm_timeout_counter_set = 1'b0;

        // Default is not to set the offset register
        esl_htsm_pc_va_diff_offset_we = 1'b0;
        esl_htsm_pc_va_diff_offset_clear = 1'b0;

        // Default is to set the timeout shift register
        esl_htsm_timeout_shiftreg_step = 1'b0;
        esl_htsm_timeout_shiftreg_set = 1'b1;

        // Default is to keep the same sliding thread
        esl_htsm_sliding_thread_next = esl_htsm_sliding_thread_f;

        // Default to comparing with configured timeout
        esl_htsm_timeout_counter_cmp_config = 1'b1;

        // Look for trigger in diverged state
        if (esl_htsm_trigger && (esl_state_f == DIVERGED))
        begin
            // Always compare to configured timeout when in diverged
            esl_htsm_timeout_counter_cmp_config = 1'b1;
            // If at least one thread is not ready, we will just wait
            // TODO: We may want to change this
            if (!(swl_esl_thr_sprdy_or_urdy[0] && swl_esl_thr_sprdy_or_urdy[1]))
            begin
                esl_htsm_state_next = DIVERGED;
                esl_htsm_fcl_nextthr_bf = 4'b0000;
                esl_htsm_fcl_switch_bf = 1'b0;
                esl_htsm_fcl_ntr_s = 1'b1; // Note: this switches out any running threads

                // Leave counter alone
                esl_htsm_timeout_counter_step = 1'b0;
                esl_htsm_timeout_counter_clear = 1'b0;
                esl_htsm_timeout_counter_set = 1'b0;

                // Leave the shift register alone
                esl_htsm_timeout_shiftreg_step = 1'b0;
                esl_htsm_timeout_shiftreg_set = 1'b0;

                // Keep same sliding thread
                esl_htsm_sliding_thread_next = esl_htsm_sliding_thread_f;
            end
            // Otherwise, both threads are ready
            else
            begin
                // If both instructions are not ready, we will just wait
                // TODO: We may want to change this
                if (!(fcl_esl_tinst_vld_s[0] && fcl_esl_tinst_vld_s[1]))
                begin
                    esl_htsm_state_next = DIVERGED;
                    // If both instructions are not ready, alternate fetching threads
                    if (!fcl_esl_tinst_vld_s[0] && !fcl_esl_tinst_vld_s[1])
                    begin
                        if (fcl_esl_thr_f == 4'b0001)
                            esl_htsm_fcl_nextthr_bf = 4'b0010;
                        else
                            esl_htsm_fcl_nextthr_bf = 4'b0001;
                    end
                    // If only thr0 instruction is not ready, select it
                    else if(!fcl_esl_tinst_vld_s[0])
                    begin
                        esl_htsm_fcl_nextthr_bf = 4'b0001;
                    end
                    // If only thr1 instruction is not ready, select it
                    else if (!fcl_esl_tinst_vld_s[1])
                    begin
                        esl_htsm_fcl_nextthr_bf = 4'b0010;
                    end
                    else
                    begin
                        esl_htsm_fcl_nextthr_bf = 4'bxxxx;
                    end
                    esl_htsm_fcl_switch_bf = 1'b1;
                    esl_htsm_fcl_ntr_s = 1'b1;

                    // Leave counter alone
                    esl_htsm_timeout_counter_step = 1'b0;
                    esl_htsm_timeout_counter_clear = 1'b0;
                    esl_htsm_timeout_counter_set = 1'b0;

                    // Leave the shift register alone
                    esl_htsm_timeout_shiftreg_step = 1'b0;
                    esl_htsm_timeout_shiftreg_set = 1'b0;

                    // Keep same sliding thread
                    esl_htsm_sliding_thread_next = esl_htsm_sliding_thread_f;
                end
                // Otherwise, both threads are ready and both instructions are ready                     
                else
                begin
                    // Check if instructions match or opcodes match
                    if (esl_tirs_eql_s || esl_ops_eql_s)
                    begin
                        // If phys address of PCs are equal,
                        // we have converged
                        if (esl_pcs_pa_eql_s && !esl_unresolved_br && !esl_brtrp_target_pc_bf_f)
                            esl_htsm_state_next = CONVERGED_DRAFT;
                        // Otherwise, we will just draft these
                        // instructions and come back to diverged
                        else
                            esl_htsm_state_next = DIVERGED_DRAFT; 

                        // Select thr0 for next cycle
                        esl_htsm_fcl_nextthr_bf = 4'b0001;
                        esl_htsm_fcl_switch_bf = 1'b1;
                        esl_htsm_fcl_ntr_s = 1'b1;

                        // Clear counter
                        esl_htsm_timeout_counter_step = 1'b0;
                        esl_htsm_timeout_counter_clear = 1'b1;
                        esl_htsm_timeout_counter_set = 1'b0;

                        // Set the shift register back to 1
                        esl_htsm_timeout_shiftreg_step = 1'b0;
                        esl_htsm_timeout_shiftreg_set = 1'b1;

                        // Thread 0 becomes sliding thread
                        esl_htsm_sliding_thread_next = 1'b0;
                    end
                    else
                    begin
                        // If the VA PCs + offset are equal, we must go to diverged
                        // different code, issuing thread0, and begin sliding threads
                        // past each other
                        if (esl_pcs_va_eql_s)
                        begin
                            // Go to diverged different code
                            esl_htsm_state_next = DIVERGED_DIFFERENT_CODE_RCFG0;

                            // Select thread 0
                            esl_htsm_fcl_nextthr_bf = 4'b0001;
                            
                            // Executed one for thread0 which is where we need
                            // to start, so we will reset this counter here to
                            // start counting for thread 1
                            esl_htsm_timeout_counter_step = 1'b0;
                            esl_htsm_timeout_counter_clear = 1'b0;
                            esl_htsm_timeout_counter_set = 1'b1;
                            
                            // Shift the shift register
                            esl_htsm_timeout_shiftreg_step = 1'b1;
                            esl_htsm_timeout_shiftreg_set = 1'b0;

                            // Thread 1 is now the sliding thread
                            esl_htsm_sliding_thread_next = 1'b1; 
                        end
                        // Otherwise, do the same as STSM except choose random thread
                        // when beyond the threshold
                        else
                        begin
                            // Always stay in diverged state
                            esl_htsm_state_next = DIVERGED;
                            // Select thread with the minimum VA PC if the difference is less
                            // than a threshold, otherwise alternate
                            if (esl_pc_va_diff_lt_thresh_s)
                            begin
                                // If we have hit the timeout in selecting the minimum PC,
                                // select the maximum PC
                                if (esl_counter_timeout)
                                begin
                                    if (esl_min_pc_va_s == 4'b0001)
                                        esl_htsm_fcl_nextthr_bf = 4'b0010;
                                    else
                                        esl_htsm_fcl_nextthr_bf = 4'b0001;

                                    // Clear the timer
                                    esl_htsm_timeout_counter_step = 1'b0;
                                    esl_htsm_timeout_counter_clear = 1'b1;
                                    esl_htsm_timeout_counter_set = 1'b0;
                                end
                                // Otherwise, select minimum PC and increment timeout
                                else
                                begin
                                    esl_htsm_fcl_nextthr_bf = esl_min_pc_va_s;

                                    // Increment counter
                                    esl_htsm_timeout_counter_step = 1'b1;
                                    esl_htsm_timeout_counter_clear = 1'b0;
                                    esl_htsm_timeout_counter_set = 1'b0;
                                end
                            end
                            else
                            begin
                                // Select random thread
                                if (pseudo_rand_f)
                                    esl_htsm_fcl_nextthr_bf = 4'b0010;
                                else
                                    esl_htsm_fcl_nextthr_bf = 4'b0001;
 
                                // Clear the timer
                                esl_htsm_timeout_counter_step = 1'b0;
                                esl_htsm_timeout_counter_clear = 1'b1;
                                esl_htsm_timeout_counter_set = 1'b0;
                            end
                        end
                        esl_htsm_fcl_switch_bf = 1'b1;
                        esl_htsm_fcl_ntr_s = 1'b1;

                        // Reset the shiftreg
                        esl_htsm_timeout_shiftreg_step = 1'b0;
                        esl_htsm_timeout_shiftreg_set = 1'b1;

                        // Keep same sliding thread
                        esl_htsm_sliding_thread_next = esl_htsm_sliding_thread_f;
                    end
                end
            end
        end
        else if (esl_htsm_trigger && (esl_state_f == DIVERGED_DIFFERENT_CODE_RCFG0))
        begin
            // Always compare to shift register in this state
            esl_htsm_timeout_counter_cmp_config = 1'b0;
            // If at least one thread is not ready, we will just wait
            // TODO: We may want to change this
            if (!(swl_esl_thr_sprdy_or_urdy[0] && swl_esl_thr_sprdy_or_urdy[1]))
            begin
                esl_htsm_state_next = DIVERGED_DIFFERENT_CODE_RCFG0;
                esl_htsm_fcl_nextthr_bf = 4'b0000;
                esl_htsm_fcl_switch_bf = 1'b0;
                esl_htsm_fcl_ntr_s = 1'b1; // Note: this switches out any running threads

                // Leave the timeout counter alone
                esl_htsm_timeout_counter_step = 1'b0;
                esl_htsm_timeout_counter_clear = 1'b0;
                esl_htsm_timeout_counter_set = 1'b0;

                // Leave the shift register alone
                esl_htsm_timeout_shiftreg_step = 1'b0;
                esl_htsm_timeout_shiftreg_set = 1'b0;

                // Keep same sliding thread
                esl_htsm_sliding_thread_next = esl_htsm_sliding_thread_f;

                // Do not set offset
                esl_htsm_pc_va_diff_offset_we = 1'b0;
                esl_htsm_pc_va_diff_offset_clear = 1'b0;
            end
            // Otherwise, both threads are ready
            else
            begin 
                // If both instructions are not ready, we will just wait
                // TODO: We may want to change this
                if (!(fcl_esl_tinst_vld_s[0] && fcl_esl_tinst_vld_s[1]))
                begin
                    esl_htsm_state_next = DIVERGED_DIFFERENT_CODE_RCFG0;
                    // If both instructions are not ready, alternate fetching threads
                    if (!fcl_esl_tinst_vld_s[0] && !fcl_esl_tinst_vld_s[1])
                    begin
                        if (fcl_esl_thr_f == 4'b0001)
                            esl_htsm_fcl_nextthr_bf = 4'b0010;
                        else
                            esl_htsm_fcl_nextthr_bf = 4'b0001;
                    end
                    // If only thr0 instruction is not ready, select it
                    else if(!fcl_esl_tinst_vld_s[0])
                    begin
                        esl_htsm_fcl_nextthr_bf = 4'b0001;
                    end
                    // If only thr1 instruction is not ready, select it
                    else if (!fcl_esl_tinst_vld_s[1])
                    begin
                        esl_htsm_fcl_nextthr_bf = 4'b0010;
                    end
                    else
                    begin
                        esl_htsm_fcl_nextthr_bf = 4'bxxxx;
                    end
                    esl_htsm_fcl_switch_bf = 1'b1;
                    esl_htsm_fcl_ntr_s = 1'b1;

                    // Leave the timeout counter alone
                    esl_htsm_timeout_counter_step = 1'b0;
                    esl_htsm_timeout_counter_clear = 1'b0;
                    esl_htsm_timeout_counter_set = 1'b0;

                    // Leave the shift register alone
                    esl_htsm_timeout_shiftreg_step = 1'b0;
                    esl_htsm_timeout_shiftreg_set = 1'b0;

                    // Keep same sliding thread
                    esl_htsm_sliding_thread_next = esl_htsm_sliding_thread_f;

                    // Do not set offset
                    esl_htsm_pc_va_diff_offset_we = 1'b0;
                    esl_htsm_pc_va_diff_offset_clear = 1'b0;
                end
                // Otherwise, both threads are ready and both instructions are ready                     
                else
                begin
                    // Check if instructions match or opcodes match
                    if (esl_tirs_eql_s || esl_ops_eql_s)
                    begin
                        // If phys address of PCs are equal,
                        // we have converged, update offset
                        if (esl_pcs_pa_eql_s && !esl_unresolved_br && !esl_brtrp_target_pc_bf_f)
                        begin
                            esl_htsm_state_next = CONVERGED_DRAFT;

                            // Update offset to current difference in VA's
                            esl_htsm_pc_va_diff_offset_we = 1'b1;
                            esl_htsm_pc_va_diff_offset_clear = 1'b0;
                        end
                        // Otherwise, we will just draft these
                        // instructions and come back to diverged
                        else
                        begin
                            esl_htsm_state_next = DIVERGED_DRAFT;
    
                            // Do not update offset
                            esl_htsm_pc_va_diff_offset_we = 1'b0;
                            esl_htsm_pc_va_diff_offset_clear = 1'b0;
                        end

                        // Select thr0 for next cycle
                        esl_htsm_fcl_nextthr_bf = 4'b0001;
                        esl_htsm_fcl_switch_bf = 1'b1;
                        esl_htsm_fcl_ntr_s = 1'b1;

                        // Clear the timeout counter
                        esl_htsm_timeout_counter_step = 1'b0;
                        esl_htsm_timeout_counter_clear = 1'b1;
                        esl_htsm_timeout_counter_set = 1'b0;

                        // Reset the shift register
                        esl_htsm_timeout_shiftreg_step = 1'b0;
                        esl_htsm_timeout_shiftreg_set = 1'b1;

                        // Sliding thread is back to thread 0
                        esl_htsm_sliding_thread_next = 1'b0;
                    end
                    else
                    begin
                        // The LSB of the shift register should only
                        // ever be 1 after the shift register rolls
                        // around and not when we first enter this state
                        // (shiftreg should be 16'b2 entering this state
                        // for the first time). In the case the shiftreg
                        // rolls around, we declare diverged
                        if (esl_shiftreg_lsb)
                        begin
                            esl_htsm_state_next = DIVERGED;
                                
                            // Issue the current sliding thread
                            if (esl_htsm_sliding_thread_f)
                                esl_htsm_fcl_nextthr_bf = 4'b0010;
                            else
                                esl_htsm_fcl_nextthr_bf = 4'b0001;
                            esl_htsm_fcl_switch_bf = 1'b1;
                            esl_htsm_fcl_ntr_s = 1'b1;

                            // Clear the timeout counter
                            esl_htsm_timeout_counter_step = 1'b0;
                            esl_htsm_timeout_counter_clear = 1'b1;
                            esl_htsm_timeout_counter_set = 1'b0;

                            // Reset the shift register
                            esl_htsm_timeout_shiftreg_step = 1'b0;
                            esl_htsm_timeout_shiftreg_set = 1'b1;

                            // Sliding thread is back to thread 0
                            esl_htsm_sliding_thread_next = 1'b0;
                        end
                        // Check if the counter reached the shift register value
                        else if (esl_counter_timeout)
                        begin
                            esl_htsm_state_next = DIVERGED_DIFFERENT_CODE_RCFG0;
                            
                            // If so, issue the sliding thread,
                            // reset shift reg counter, shift
                            // the shift register, and invert
                            // sliding thread
                            if (esl_htsm_sliding_thread_f)
                                esl_htsm_fcl_nextthr_bf = 4'b0010;
                            else
                                esl_htsm_fcl_nextthr_bf = 4'b0001;
                            esl_htsm_fcl_switch_bf = 1'b1;
                            esl_htsm_fcl_ntr_s = 1'b1;

                            // Set the timeout counter
                            esl_htsm_timeout_counter_step = 1'b0;
                            esl_htsm_timeout_counter_clear = 1'b0;
                            esl_htsm_timeout_counter_set = 1'b1;

                            // Step the shift register
                            esl_htsm_timeout_shiftreg_step = 1'b1;
                            esl_htsm_timeout_shiftreg_set = 1'b1;

                            // Invert sliding thread
                            esl_htsm_sliding_thread_next = ~esl_htsm_sliding_thread_f;
                        end
                        else
                        begin
                            esl_htsm_state_next = DIVERGED_DIFFERENT_CODE_RCFG0;
                            
                            // If not, issue the sliding thread and
                            // increment counter
                            if (esl_htsm_sliding_thread_f)
                                esl_htsm_fcl_nextthr_bf = 4'b0010;
                            else
                                esl_htsm_fcl_nextthr_bf = 4'b0001;
                            esl_htsm_fcl_switch_bf = 1'b1;
                            esl_htsm_fcl_ntr_s = 1'b1;
                           
                            // Step the timeout counter
                            esl_htsm_timeout_counter_step = 1'b1;
                            esl_htsm_timeout_counter_clear = 1'b0;
                            esl_htsm_timeout_counter_set = 1'b0;
 
                            // Leave the shift register alone
                            esl_htsm_timeout_shiftreg_step = 1'b0;
                            esl_htsm_timeout_shiftreg_set = 1'b0;

                            // Same sliding thread
                            esl_htsm_sliding_thread_next = esl_htsm_sliding_thread_f;
                        end

                        // Do not set the offset register
                        esl_htsm_pc_va_diff_offset_we = 1'b0; 
                        esl_htsm_pc_va_diff_offset_clear = 1'b0;
                    end
                end
            end
        end
        else if (esl_htsm_trigger && (esl_state_f == RCFG1))
        begin
            // Try to recover
            esl_htsm_state_next = DIVERGED;
            esl_htsm_fcl_nextthr_bf = 4'b0000;
            esl_htsm_fcl_switch_bf = 1'b0;
            esl_htsm_fcl_ntr_s = 1'b0;
        end
        else if (esl_htsm_trigger && (esl_state_f == RCFG2))
        begin
            // Try to recover
            esl_htsm_state_next = DIVERGED;
            esl_htsm_fcl_nextthr_bf = 4'b0000;
            esl_htsm_fcl_switch_bf = 1'b0;
            esl_htsm_fcl_ntr_s = 1'b0;
        end
        else if (esl_htsm_trigger && (esl_state_f == RCFG3))
        begin
            // Try to recover
            esl_htsm_state_next = DIVERGED;
            esl_htsm_fcl_nextthr_bf = 4'b0000;
            esl_htsm_fcl_switch_bf = 1'b0;
            esl_htsm_fcl_ntr_s = 1'b0;
        end
        else
        begin
            esl_htsm_state_next = 3'bxx;
            esl_htsm_fcl_nextthr_bf = 4'bxxxx;
            esl_htsm_fcl_switch_bf = 1'bx;
            esl_htsm_fcl_ntr_s = 1'bx;
        end
    end

endmodule
