# Copyright (c) 2016 Princeton University
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of Princeton University nor the
#       names of its contributors may be used to endorse or promote products
#       derived from this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# Constraints specific to this module

# Generate clocks (all units in ps)
create_clock -name rclk -period $CPU_CLOCK_PERIOD -waveform "0 [expr $CPU_CLOCK_PERIOD / 2.0]" rclk
#set_clock_uncertainty -setup 60 rclk
#set_clock_uncertainty -hold 60 rclk
#set_clock_transition 20 rclk 
set_dont_touch_network rclk

# Set input and output delay
# set_input_delay 150 -clock rclk -max [all_inputs]
# set_input_delay 100 -clock rclk -min [all_inputs]
# set_output_delay 200 -clock rclk -max [all_outputs]
# set_output_delay 150 -clock rclk -min [all_outputs]

# Set output load
set_load 4.0 [all_outputs]
if {$CONSTRAINTS_DRIVING_CELL != "" && $CONSTRAINTS_DRIVING_CELLLIB != ""} {
    set_driving_cell -lib_cell $CONSTRAINTS_DRIVING_CELL -library $CONSTRAINTS_DRIVING_CELLLIB -no_design_rule [all_inputs]
}

# auto_constraint_clk
# rclk



# auto_constraint_reset
# arst_l
# grst_l



# auto_constraint_input register






# auto_constraint_output register
# ffu_ifu_cc_w2
# ffu_ifu_err_reg_w2
# ffu_ifu_err_synd_w2
# ffu_ifu_fpop_done_w2
# ffu_ifu_fst_ce_w
# ffu_ifu_inj_ack
# ffu_ifu_stallreq
# ffu_ifu_tid_w2
# ffu_lsu_blk_st_va_e
# ffu_tlu_trap_ieee754
# ffu_exu_rsr_data_m
# srams_rtap_data




# auto_constraint_output combinational_3
# ffu_ifu_cc_vld_w2
# ffu_ifu_ecc_ce_w2
# ffu_ifu_ecc_ue_w2
# ffu_lsu_blk_st_e
# ffu_lsu_fpop_rq_vld
# ffu_lsu_kill_fst_w
# ffu_tlu_fpu_cmplt
# ffu_tlu_fpu_tid
# ffu_tlu_ill_inst_m
# ffu_tlu_trap_other
# ffu_tlu_trap_ue




# auto_constraint_output combinational_4
# ffu_lsu_data // critical path with the LSU, 4, and 3 is too short





# auto_constraint_output combinational_7





# auto_constraint_port_list
    # input                rclk,
    # input                arst_l,
    # input                grst_l,
    # input                lsu_ffu_st_dtlb_perr_g,
    # input                exu_ffu_ist_e,    
    # input [1:0]          ifu_ffu_tid_d,
    # input [63:0]         cpx_fpu_data,
    # input                cpx_vld,
    # input                cpx_fcmp,
    # input [3:0]          cpx_req,
    # input [1:0]          cpx_fccval,
    # input [4:0]          cpx_fpexc,
    # input [31:0]         exu_ffu_gsr_mask_m,
    # input [4:0]          exu_ffu_gsr_scale_m,
    # input [2:0]          exu_ffu_gsr_align_m,
    # input [2:0]          exu_ffu_gsr_rnd_m,
    # input                ifu_ffu_ldst_single_d,
    # output [80:0]        ffu_lsu_data,
    # output [3:0]         ffu_ifu_cc_vld_w2,
    # output [7:0]         ffu_ifu_cc_w2,
    # output               ffu_ifu_ecc_ce_w2,      
    # output               ffu_ifu_ecc_ue_w2,
    # output [5:0]         ffu_ifu_err_reg_w2,
    # output [13:0]        ffu_ifu_err_synd_w2,
    # output               ffu_ifu_fpop_done_w2,
    # output               ffu_ifu_fst_ce_w,
    # output               ffu_ifu_inj_ack,
    # output               ffu_ifu_stallreq,
    # output [1:0]         ffu_ifu_tid_w2,
    # output               ffu_lsu_blk_st_e,
    # output [5:3]         ffu_lsu_blk_st_va_e,
    # output               ffu_lsu_fpop_rq_vld,
    # output               ffu_lsu_kill_fst_w,
    # output               ffu_tlu_fpu_cmplt,
    # output [1:0]         ffu_tlu_fpu_tid,
    # output               ffu_tlu_ill_inst_m,
    # output               ffu_tlu_trap_ieee754,
    # output               ffu_tlu_trap_other,
    # output               ffu_tlu_trap_ue,
    # output [63:0]        ffu_exu_rsr_data_m,
    # input                exu_ffu_wsr_inst_e,
    # input                ifu_exu_disable_ce_e,
    # input [6:0]          ifu_exu_ecc_mask,
    # input                ifu_exu_nceen_e,
    # input [1:0]          ifu_ffu_fcc_num_d,
    # input                ifu_ffu_fld_d,
    # input                ifu_ffu_fpop1_d,
    # input                ifu_ffu_fpop2_d,
    # input [8:0]          ifu_ffu_fpopcode_d,
    # input [4:0]          ifu_ffu_frd_d,
    # input [4:0]          ifu_ffu_frs1_d,        
    # input [4:0]          ifu_ffu_frs2_d,
    # input                ifu_ffu_fst_d,
    # input                ifu_ffu_inj_frferr,
    # input                ifu_ffu_ldfsr_d,
    # input                ifu_ffu_ldxfsr_d,
    # input                ifu_ffu_mvcnd_m,
    # input                ifu_ffu_quad_op_e,
    # input                ifu_ffu_stfsr_d,
    # input                ifu_ffu_visop_d,
    # input                ifu_lsu_ld_inst_e,
    # input                ifu_tlu_flsh_inst_e,  
    # input                ifu_tlu_flush_w,
    # input                ifu_tlu_inst_vld_w,
    # input [6:0]          ifu_tlu_sraddr_d,
    # input                lsu_ffu_ack,
    # input [2:0]          lsu_ffu_bld_cnt_w,
    # input                lsu_ffu_blk_asi_e,
    # input                lsu_ffu_flush_pipe_w,
    # input [63:0]         lsu_ffu_ld_data,
    # input                lsu_ffu_ld_vld,
    # input                lsu_ffu_stb_full0,
    # input                lsu_ffu_stb_full1,
    # input                lsu_ffu_stb_full2,      
    # input                lsu_ffu_stb_full3,
    # output [`SRAM_WRAPPER_BUS_WIDTH-1:0] srams_rtap_data,
    # input  [`BIST_OP_WIDTH-1:0] rtap_srams_bist_command,
    # input  [`SRAM_WRAPPER_BUS_WIDTH-1:0] rtap_srams_bist_data













# auto_constraint_text_begin
## autoport resetlist
set_input_delay $RESET_INPUT_DELAY -clock rclk -max [get_ports arst_l]
set_input_delay [expr $RESET_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports arst_l]
set_input_delay $RESET_INPUT_DELAY -clock rclk -max [get_ports grst_l]
set_input_delay [expr $RESET_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports grst_l]
## autoport portlist
set_input_delay $COM_INPUT_DELAY_5 -clock rclk -max [get_ports lsu_ffu_st_dtlb_perr_g]
set_input_delay [expr $COM_INPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports lsu_ffu_st_dtlb_perr_g]
set_input_delay $INFERRED_REG_INPUT_DELAY -clock rclk -max [get_ports exu_ffu_ist_e]
set_input_delay [expr $INFERRED_REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports exu_ffu_ist_e]
set_input_delay $COM_INPUT_DELAY_3 -clock rclk -max [get_ports ifu_ffu_tid_d[*]]
set_input_delay [expr $COM_INPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_ffu_tid_d[*]]
set_input_delay $COM_INPUT_DELAY_3 -clock rclk -max [get_ports cpx_fpu_data[*]]
set_input_delay [expr $COM_INPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports cpx_fpu_data[*]]
set_input_delay $COM_INPUT_DELAY_3 -clock rclk -max [get_ports cpx_vld]
set_input_delay [expr $COM_INPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports cpx_vld]
set_input_delay $COM_INPUT_DELAY_3 -clock rclk -max [get_ports cpx_fcmp]
set_input_delay [expr $COM_INPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports cpx_fcmp]
set_input_delay $COM_INPUT_DELAY_3 -clock rclk -max [get_ports cpx_req[*]]
set_input_delay [expr $COM_INPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports cpx_req[*]]
set_input_delay $COM_INPUT_DELAY_3 -clock rclk -max [get_ports cpx_fccval[*]]
set_input_delay [expr $COM_INPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports cpx_fccval[*]]
set_input_delay $COM_INPUT_DELAY_3 -clock rclk -max [get_ports cpx_fpexc[*]]
set_input_delay [expr $COM_INPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports cpx_fpexc[*]]
set_input_delay $INFERRED_REG_INPUT_DELAY -clock rclk -max [get_ports exu_ffu_gsr_mask_m[*]]
set_input_delay [expr $INFERRED_REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports exu_ffu_gsr_mask_m[*]]
set_input_delay $INFERRED_REG_INPUT_DELAY -clock rclk -max [get_ports exu_ffu_gsr_scale_m[*]]
set_input_delay [expr $INFERRED_REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports exu_ffu_gsr_scale_m[*]]
set_input_delay $INFERRED_REG_INPUT_DELAY -clock rclk -max [get_ports exu_ffu_gsr_align_m[*]]
set_input_delay [expr $INFERRED_REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports exu_ffu_gsr_align_m[*]]
set_input_delay $INFERRED_REG_INPUT_DELAY -clock rclk -max [get_ports exu_ffu_gsr_rnd_m[*]]
set_input_delay [expr $INFERRED_REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports exu_ffu_gsr_rnd_m[*]]
set_input_delay $COM_INPUT_DELAY_3 -clock rclk -max [get_ports ifu_ffu_ldst_single_d]
set_input_delay [expr $COM_INPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_ffu_ldst_single_d]
set_output_delay $COM_OUTPUT_DELAY_4 -clock rclk -max [get_ports ffu_lsu_data[*]]
set_output_delay [expr $COM_OUTPUT_DELAY_4 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ffu_lsu_data[*]]
set_output_delay $COM_OUTPUT_DELAY_3 -clock rclk -max [get_ports ffu_ifu_cc_vld_w2[*]]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ffu_ifu_cc_vld_w2[*]]
set_output_delay $REG_OUTPUT_DELAY -clock rclk -max [get_ports ffu_ifu_cc_w2[*]]
set_output_delay [expr $REG_OUTPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ffu_ifu_cc_w2[*]]
set_output_delay $COM_OUTPUT_DELAY_3 -clock rclk -max [get_ports ffu_ifu_ecc_ce_w2]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ffu_ifu_ecc_ce_w2]
set_output_delay $COM_OUTPUT_DELAY_3 -clock rclk -max [get_ports ffu_ifu_ecc_ue_w2]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ffu_ifu_ecc_ue_w2]
set_output_delay $REG_OUTPUT_DELAY -clock rclk -max [get_ports ffu_ifu_err_reg_w2[*]]
set_output_delay [expr $REG_OUTPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ffu_ifu_err_reg_w2[*]]
set_output_delay $REG_OUTPUT_DELAY -clock rclk -max [get_ports ffu_ifu_err_synd_w2[*]]
set_output_delay [expr $REG_OUTPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ffu_ifu_err_synd_w2[*]]
set_output_delay $REG_OUTPUT_DELAY -clock rclk -max [get_ports ffu_ifu_fpop_done_w2]
set_output_delay [expr $REG_OUTPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ffu_ifu_fpop_done_w2]
set_output_delay $REG_OUTPUT_DELAY -clock rclk -max [get_ports ffu_ifu_fst_ce_w]
set_output_delay [expr $REG_OUTPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ffu_ifu_fst_ce_w]
set_output_delay $REG_OUTPUT_DELAY -clock rclk -max [get_ports ffu_ifu_inj_ack]
set_output_delay [expr $REG_OUTPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ffu_ifu_inj_ack]
set_output_delay $REG_OUTPUT_DELAY -clock rclk -max [get_ports ffu_ifu_stallreq]
set_output_delay [expr $REG_OUTPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ffu_ifu_stallreq]
set_output_delay $REG_OUTPUT_DELAY -clock rclk -max [get_ports ffu_ifu_tid_w2[*]]
set_output_delay [expr $REG_OUTPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ffu_ifu_tid_w2[*]]
set_output_delay $COM_OUTPUT_DELAY_3 -clock rclk -max [get_ports ffu_lsu_blk_st_e]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ffu_lsu_blk_st_e]
set_output_delay $REG_OUTPUT_DELAY -clock rclk -max [get_ports ffu_lsu_blk_st_va_e[*]]
set_output_delay [expr $REG_OUTPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ffu_lsu_blk_st_va_e[*]]
set_output_delay $COM_OUTPUT_DELAY_3 -clock rclk -max [get_ports ffu_lsu_fpop_rq_vld]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ffu_lsu_fpop_rq_vld]
set_output_delay $COM_OUTPUT_DELAY_3 -clock rclk -max [get_ports ffu_lsu_kill_fst_w]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ffu_lsu_kill_fst_w]
set_output_delay $COM_OUTPUT_DELAY_3 -clock rclk -max [get_ports ffu_tlu_fpu_cmplt]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ffu_tlu_fpu_cmplt]
set_output_delay $COM_OUTPUT_DELAY_3 -clock rclk -max [get_ports ffu_tlu_fpu_tid[*]]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ffu_tlu_fpu_tid[*]]
set_output_delay $COM_OUTPUT_DELAY_3 -clock rclk -max [get_ports ffu_tlu_ill_inst_m]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ffu_tlu_ill_inst_m]
set_output_delay $REG_OUTPUT_DELAY -clock rclk -max [get_ports ffu_tlu_trap_ieee754]
set_output_delay [expr $REG_OUTPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ffu_tlu_trap_ieee754]
set_output_delay $COM_OUTPUT_DELAY_3 -clock rclk -max [get_ports ffu_tlu_trap_other]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ffu_tlu_trap_other]
set_output_delay $COM_OUTPUT_DELAY_3 -clock rclk -max [get_ports ffu_tlu_trap_ue]
set_output_delay [expr $COM_OUTPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ffu_tlu_trap_ue]
set_output_delay $REG_OUTPUT_DELAY -clock rclk -max [get_ports ffu_exu_rsr_data_m[*]]
set_output_delay [expr $REG_OUTPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ffu_exu_rsr_data_m[*]]
set_input_delay $INFERRED_REG_INPUT_DELAY -clock rclk -max [get_ports exu_ffu_wsr_inst_e]
set_input_delay [expr $INFERRED_REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports exu_ffu_wsr_inst_e]
set_input_delay $INFERRED_REG_INPUT_DELAY -clock rclk -max [get_ports ifu_exu_disable_ce_e]
set_input_delay [expr $INFERRED_REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_exu_disable_ce_e]
set_input_delay $INFERRED_REG_INPUT_DELAY -clock rclk -max [get_ports ifu_exu_ecc_mask[*]]
set_input_delay [expr $INFERRED_REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_exu_ecc_mask[*]]
set_input_delay $INFERRED_REG_INPUT_DELAY -clock rclk -max [get_ports ifu_exu_nceen_e]
set_input_delay [expr $INFERRED_REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_exu_nceen_e]
set_input_delay $INFERRED_REG_INPUT_DELAY -clock rclk -max [get_ports ifu_ffu_fcc_num_d[*]]
set_input_delay [expr $INFERRED_REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_ffu_fcc_num_d[*]]
set_input_delay $COM_INPUT_DELAY_4 -clock rclk -max [get_ports ifu_ffu_fld_d]
set_input_delay [expr $COM_INPUT_DELAY_4 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_ffu_fld_d]
set_input_delay $COM_INPUT_DELAY_4 -clock rclk -max [get_ports ifu_ffu_fpop1_d]
set_input_delay [expr $COM_INPUT_DELAY_4 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_ffu_fpop1_d]
set_input_delay $COM_INPUT_DELAY_4 -clock rclk -max [get_ports ifu_ffu_fpop2_d]
set_input_delay [expr $COM_INPUT_DELAY_4 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_ffu_fpop2_d]
set_input_delay $INFERRED_REG_INPUT_DELAY -clock rclk -max [get_ports ifu_ffu_fpopcode_d[*]]
set_input_delay [expr $INFERRED_REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_ffu_fpopcode_d[*]]
set_input_delay $INFERRED_REG_INPUT_DELAY -clock rclk -max [get_ports ifu_ffu_frd_d[*]]
set_input_delay [expr $INFERRED_REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_ffu_frd_d[*]]
set_input_delay $INFERRED_REG_INPUT_DELAY -clock rclk -max [get_ports ifu_ffu_frs1_d[*]]
set_input_delay [expr $INFERRED_REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_ffu_frs1_d[*]]
set_input_delay $INFERRED_REG_INPUT_DELAY -clock rclk -max [get_ports ifu_ffu_frs2_d[*]]
set_input_delay [expr $INFERRED_REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_ffu_frs2_d[*]]
set_input_delay $COM_INPUT_DELAY_4 -clock rclk -max [get_ports ifu_ffu_fst_d]
set_input_delay [expr $COM_INPUT_DELAY_4 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_ffu_fst_d]
set_input_delay $COM_INPUT_DELAY_3 -clock rclk -max [get_ports ifu_ffu_inj_frferr]
set_input_delay [expr $COM_INPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_ffu_inj_frferr]
set_input_delay $COM_INPUT_DELAY_3 -clock rclk -max [get_ports ifu_ffu_ldfsr_d]
set_input_delay [expr $COM_INPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_ffu_ldfsr_d]
set_input_delay $COM_INPUT_DELAY_3 -clock rclk -max [get_ports ifu_ffu_ldxfsr_d]
set_input_delay [expr $COM_INPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_ffu_ldxfsr_d]
set_input_delay $INFERRED_REG_INPUT_DELAY -clock rclk -max [get_ports ifu_ffu_mvcnd_m]
set_input_delay [expr $INFERRED_REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_ffu_mvcnd_m]
set_input_delay $INFERRED_REG_INPUT_DELAY -clock rclk -max [get_ports ifu_ffu_quad_op_e]
set_input_delay [expr $INFERRED_REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_ffu_quad_op_e]
set_input_delay $COM_INPUT_DELAY_3 -clock rclk -max [get_ports ifu_ffu_stfsr_d]
set_input_delay [expr $COM_INPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_ffu_stfsr_d]
set_input_delay $COM_INPUT_DELAY_4 -clock rclk -max [get_ports ifu_ffu_visop_d]
set_input_delay [expr $COM_INPUT_DELAY_4 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_ffu_visop_d]
set_input_delay $INFERRED_REG_INPUT_DELAY -clock rclk -max [get_ports ifu_lsu_ld_inst_e]
set_input_delay [expr $INFERRED_REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_lsu_ld_inst_e]
set_input_delay $INFERRED_REG_INPUT_DELAY -clock rclk -max [get_ports ifu_tlu_flsh_inst_e]
set_input_delay [expr $INFERRED_REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_tlu_flsh_inst_e]
set_input_delay $INFERRED_REG_INPUT_DELAY -clock rclk -max [get_ports ifu_tlu_flush_w]
set_input_delay [expr $INFERRED_REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_tlu_flush_w]
set_input_delay $INFERRED_REG_INPUT_DELAY -clock rclk -max [get_ports ifu_tlu_inst_vld_w]
set_input_delay [expr $INFERRED_REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_tlu_inst_vld_w]
set_input_delay $COM_INPUT_DELAY_4 -clock rclk -max [get_ports ifu_tlu_sraddr_d[*]]
set_input_delay [expr $COM_INPUT_DELAY_4 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports ifu_tlu_sraddr_d[*]]
set_input_delay $INFERRED_REG_INPUT_DELAY -clock rclk -max [get_ports lsu_ffu_ack]
set_input_delay [expr $INFERRED_REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports lsu_ffu_ack]
set_input_delay $INFERRED_REG_INPUT_DELAY -clock rclk -max [get_ports lsu_ffu_bld_cnt_w[*]]
set_input_delay [expr $INFERRED_REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports lsu_ffu_bld_cnt_w[*]]
set_input_delay $INFERRED_REG_INPUT_DELAY -clock rclk -max [get_ports lsu_ffu_blk_asi_e]
set_input_delay [expr $INFERRED_REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports lsu_ffu_blk_asi_e]
set_input_delay $COM_INPUT_DELAY_4 -clock rclk -max [get_ports lsu_ffu_flush_pipe_w]
set_input_delay [expr $COM_INPUT_DELAY_4 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports lsu_ffu_flush_pipe_w]
set_input_delay $COM_INPUT_DELAY_5 -clock rclk -max [get_ports lsu_ffu_ld_data[*]]
set_input_delay [expr $COM_INPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports lsu_ffu_ld_data[*]]
set_input_delay $INFERRED_REG_INPUT_DELAY -clock rclk -max [get_ports lsu_ffu_ld_vld]
set_input_delay [expr $INFERRED_REG_INPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports lsu_ffu_ld_vld]
set_input_delay $COM_INPUT_DELAY_3 -clock rclk -max [get_ports lsu_ffu_stb_full0]
set_input_delay [expr $COM_INPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports lsu_ffu_stb_full0]
set_input_delay $COM_INPUT_DELAY_3 -clock rclk -max [get_ports lsu_ffu_stb_full1]
set_input_delay [expr $COM_INPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports lsu_ffu_stb_full1]
set_input_delay $COM_INPUT_DELAY_3 -clock rclk -max [get_ports lsu_ffu_stb_full2]
set_input_delay [expr $COM_INPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports lsu_ffu_stb_full2]
set_input_delay $COM_INPUT_DELAY_3 -clock rclk -max [get_ports lsu_ffu_stb_full3]
set_input_delay [expr $COM_INPUT_DELAY_3 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports lsu_ffu_stb_full3]
set_output_delay $REG_OUTPUT_DELAY -clock rclk -max [get_ports srams_rtap_data[*]]
set_output_delay [expr $REG_OUTPUT_DELAY - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports srams_rtap_data[*]]
set_input_delay $COM_INPUT_DELAY_5 -clock rclk -max [get_ports rtap_srams_bist_command[*]]
set_input_delay [expr $COM_INPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports rtap_srams_bist_command[*]]
set_input_delay $COM_INPUT_DELAY_5 -clock rclk -max [get_ports rtap_srams_bist_data[*]]
set_input_delay [expr $COM_INPUT_DELAY_5 - $HOLD_DELAY_MARGIN] -clock rclk -min [get_ports rtap_srams_bist_data[*]]
# auto_constraint_text_end
