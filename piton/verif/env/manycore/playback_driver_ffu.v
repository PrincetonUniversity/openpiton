// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: playback_driver.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
//`timescale 1ps/1ps
`define ARM_UD_MODEL
module playback_driver();

parameter	inputwidth=270;
parameter	outputwidth=198;
parameter	clockwidth=1;

reg [256*8-1:0] stimfile;
reg [256*8-1:0] iofile;


initial begin
stimfile = "not_provided";
if($test$plusargs("stim_file")) begin
$value$plusargs("stim_file=%s", stimfile);
end
end


reg	[inputwidth-1:0]	input_vector;
reg	[inputwidth-1:0]	input_vector_a;
reg	[outputwidth-1:0]	output_vector_ref;
wire				clock_vector;
reg             core_ref_clk;



initial begin
core_ref_clk = 1'b0;
forever #714 core_ref_clk = ~core_ref_clk;
end



assign clock_vector = core_ref_clk;

integer fid, code;
integer	mismatch;
integer cycle;

initial begin
  fid = $fopen(stimfile, "r");
end


always @(posedge clock_vector) begin
  #300;
  input_vector = input_vector_a;
  code = $fscanf(fid, "%b\n", input_vector_a);
  if(code == 0 || code == -1) begin 
    if(mismatch == 0)
      $display("Playback PASSED!");
   else
      $display("Playback FAILED with %1d mismatches!", mismatch);
    $finish; 
  end
  @(negedge clock_vector);
  #200;
  $fscanf(fid, "%b\n", output_vector_ref);
end



task displayMismatch;
input [7:0] port;
input exp;
input got;
begin
end
endtask



wire	[outputwidth-1:0]	output_vector;
reg	[outputwidth-1:0]	output_vector_mask;
wire	[outputwidth-1:0]	output_vector_masked;
wire	[outputwidth-1:0]	output_vector_ref_masked;



    wire clk;
    wire clk_en;


    wire                arst_l;
    wire                grst_l;

    wire                lsu_ffu_st_dtlb_perr_g;
    wire                exu_ffu_ist_e;    
    wire [1:0]          ifu_ffu_tid_d;
    wire [63:0]         cpx_fpu_data;
    wire                cpx_vld;
    wire                cpx_fcmp;
    wire [3:0]          cpx_req;
    wire [1:0]          cpx_fccval;
    wire [4:0]          cpx_fpexc;
    wire [31:0]         exu_ffu_gsr_mask_m;
    wire [4:0]          exu_ffu_gsr_scale_m;
    wire [2:0]          exu_ffu_gsr_align_m;
    wire [2:0]          exu_ffu_gsr_rnd_m;
    wire                ifu_ffu_ldst_single_d;
    // wire                mux_drive_disable;
    // wire                mem_write_disable;
    

    wire [80:0]        ffu_lsu_data;
    wire [3:0]         ffu_ifu_cc_vld_w2;
    wire [7:0]         ffu_ifu_cc_w2;
    wire               ffu_ifu_ecc_ce_w2;      
    wire               ffu_ifu_ecc_ue_w2;
    wire [5:0]         ffu_ifu_err_reg_w2;
    wire [13:0]        ffu_ifu_err_synd_w2;
    wire               ffu_ifu_fpop_done_w2;
    wire               ffu_ifu_fst_ce_w;
    wire               ffu_ifu_inj_ack;
    wire               ffu_ifu_stallreq;
    wire [1:0]         ffu_ifu_tid_w2;
    wire               ffu_lsu_blk_st_e;
    wire [5:3]         ffu_lsu_blk_st_va_e;
    wire               ffu_lsu_fpop_rq_vld;
    wire               ffu_lsu_kill_fst_w;
    wire               ffu_tlu_fpu_cmplt;
    wire [1:0]         ffu_tlu_fpu_tid;
    wire               ffu_tlu_ill_inst_m;
    wire               ffu_tlu_trap_ieee754;
    wire               ffu_tlu_trap_other;
    wire               ffu_tlu_trap_ue;
    wire [63:0]        ffu_exu_rsr_data_m;
    wire                exu_ffu_wsr_inst_e;
    wire                ifu_exu_disable_ce_e;
    wire [6:0]          ifu_exu_ecc_mask;
    wire                ifu_exu_nceen_e;
    wire [1:0]          ifu_ffu_fcc_num_d;
    wire                ifu_ffu_fld_d;
    wire                ifu_ffu_fpop1_d;
    wire                ifu_ffu_fpop2_d;
    wire [8:0]          ifu_ffu_fpopcode_d;
    wire [4:0]          ifu_ffu_frd_d;
    wire [4:0]          ifu_ffu_frs1_d;        
    wire [4:0]          ifu_ffu_frs2_d;
    wire                ifu_ffu_fst_d;
    wire                ifu_ffu_inj_frferr;
    wire                ifu_ffu_ldfsr_d;
    wire                ifu_ffu_ldxfsr_d;
    wire                ifu_ffu_mvcnd_m;
    wire                ifu_ffu_quad_op_e;
    wire                ifu_ffu_stfsr_d;
    wire                ifu_ffu_visop_d;
    wire                ifu_lsu_ld_inst_e;
    wire                ifu_tlu_flsh_inst_e;  
    wire                ifu_tlu_flush_w;
    wire                ifu_tlu_inst_vld_w;
    wire [6:0]          ifu_tlu_sraddr_d;
    wire                lsu_ffu_ack;
    wire [2:0]          lsu_ffu_bld_cnt_w;
    wire                lsu_ffu_blk_asi_e;
    wire                lsu_ffu_flush_pipe_w;
    wire [63:0]         lsu_ffu_ld_data;
    wire                lsu_ffu_ld_vld;
    wire                lsu_ffu_stb_full0;
    wire                lsu_ffu_stb_full1;
    wire                lsu_ffu_stb_full2;      
    wire                lsu_ffu_stb_full3;

    // sram wrapper interface
    wire [4-1:0] srams_rtap_data;
    wire  [4-1:0] rtap_srams_bist_command;
    wire  [4-1:0] rtap_srams_bist_data;





sparc_ffu_nospu_wrap ffu(
                 // reset stuff
                 .grst_l                (grst_l),
                 .arst_l                (arst_l),
                 
                // eco 6529 .
                .lsu_ffu_st_dtlb_perr_g      (lsu_ffu_st_dtlb_perr_g),

                 .exu_ffu_ist_e         (exu_ffu_ist_e),
                 .ifu_ffu_tid_d         (ifu_ffu_tid_d),
                 .cpx_fpu_data          (cpx_fpu_data),
                 .cpx_vld             (cpx_vld),
                 .cpx_fcmp            (cpx_fcmp),
                 .cpx_req             (cpx_req),
                 .cpx_fccval          (cpx_fccval),
                 .cpx_fpexc           (cpx_fpexc),                   
                 .exu_ffu_gsr_mask_m  (exu_ffu_gsr_mask_m),
                 .exu_ffu_gsr_scale_m (exu_ffu_gsr_scale_m),
                 .exu_ffu_gsr_align_m (exu_ffu_gsr_align_m),
                 .exu_ffu_gsr_rnd_m   (exu_ffu_gsr_rnd_m),
                 .ifu_ffu_ldst_single_d   (ifu_ffu_ldst_single_d),
                     /*AUTOINST*/
                 // Outputs
                 .ffu_lsu_data          (ffu_lsu_data[80:0]),
                 .ffu_ifu_cc_vld_w2     (ffu_ifu_cc_vld_w2[3:0]),
                 .ffu_ifu_cc_w2         (ffu_ifu_cc_w2[7:0]),
                 .ffu_ifu_ecc_ce_w2     (ffu_ifu_ecc_ce_w2),
                 .ffu_ifu_ecc_ue_w2     (ffu_ifu_ecc_ue_w2),
                 .ffu_ifu_err_reg_w2    (ffu_ifu_err_reg_w2[5:0]),
                 .ffu_ifu_err_synd_w2   (ffu_ifu_err_synd_w2[13:0]),
                 .ffu_ifu_fpop_done_w2  (ffu_ifu_fpop_done_w2),
                 .ffu_ifu_fst_ce_w      (ffu_ifu_fst_ce_w),
                 .ffu_ifu_inj_ack       (ffu_ifu_inj_ack),
                 .ffu_ifu_stallreq      (ffu_ifu_stallreq),
                 .ffu_ifu_tid_w2        (ffu_ifu_tid_w2[1:0]),
                 .ffu_lsu_blk_st_e      (ffu_lsu_blk_st_e),
                 .ffu_lsu_blk_st_va_e   (ffu_lsu_blk_st_va_e[5:3]),
                 .ffu_lsu_fpop_rq_vld   (ffu_lsu_fpop_rq_vld),
                 .ffu_lsu_kill_fst_w    (ffu_lsu_kill_fst_w),
                 .ffu_tlu_fpu_cmplt     (ffu_tlu_fpu_cmplt),
                 .ffu_tlu_fpu_tid       (ffu_tlu_fpu_tid[1:0]),
                 .ffu_tlu_ill_inst_m    (ffu_tlu_ill_inst_m),
                 .ffu_tlu_trap_ieee754  (ffu_tlu_trap_ieee754),
                 .ffu_tlu_trap_other    (ffu_tlu_trap_other),
                 .ffu_tlu_trap_ue       (ffu_tlu_trap_ue),
                 .ffu_exu_rsr_data_m    (ffu_exu_rsr_data_m[63:0]),
                 // Inputs
                 .exu_ffu_wsr_inst_e    (exu_ffu_wsr_inst_e),
                 .ifu_exu_disable_ce_e  (ifu_exu_disable_ce_e),
                 .ifu_exu_ecc_mask      (ifu_exu_ecc_mask[6:0]),
                 .ifu_exu_nceen_e       (ifu_exu_nceen_e),
                 .ifu_ffu_fcc_num_d     (ifu_ffu_fcc_num_d[1:0]),
                 .ifu_ffu_fld_d         (ifu_ffu_fld_d),
                 .ifu_ffu_fpop1_d       (ifu_ffu_fpop1_d),
                 .ifu_ffu_fpop2_d       (ifu_ffu_fpop2_d),
                 .ifu_ffu_fpopcode_d    (ifu_ffu_fpopcode_d[8:0]),
                 .ifu_ffu_frd_d         (ifu_ffu_frd_d[4:0]),
                 .ifu_ffu_frs1_d        (ifu_ffu_frs1_d[4:0]),
                 .ifu_ffu_frs2_d        (ifu_ffu_frs2_d[4:0]),
                 .ifu_ffu_fst_d         (ifu_ffu_fst_d),
                 .ifu_ffu_inj_frferr    (ifu_ffu_inj_frferr),
                 .ifu_ffu_ldfsr_d       (ifu_ffu_ldfsr_d),
                 .ifu_ffu_ldxfsr_d      (ifu_ffu_ldxfsr_d),
                 .ifu_ffu_mvcnd_m       (ifu_ffu_mvcnd_m),
                 .ifu_ffu_quad_op_e     (ifu_ffu_quad_op_e),
                 .ifu_ffu_stfsr_d       (ifu_ffu_stfsr_d),
                 .ifu_ffu_visop_d       (ifu_ffu_visop_d),
                 .ifu_lsu_ld_inst_e     (ifu_lsu_ld_inst_e),
                 .ifu_tlu_flsh_inst_e   (ifu_tlu_flsh_inst_e),
                 .ifu_tlu_flush_w       (ifu_tlu_flush_w),
                 .ifu_tlu_inst_vld_w    (ifu_tlu_inst_vld_w),
                 .ifu_tlu_sraddr_d      (ifu_tlu_sraddr_d[6:0]),
                 .lsu_ffu_ack           (lsu_ffu_ack),
                 .lsu_ffu_bld_cnt_w     (lsu_ffu_bld_cnt_w[2:0]),
                 .lsu_ffu_blk_asi_e     (lsu_ffu_blk_asi_e),
                 .lsu_ffu_flush_pipe_w  (lsu_ffu_flush_pipe_w),
                 .lsu_ffu_ld_data       (lsu_ffu_ld_data[63:0]),
                 .lsu_ffu_ld_vld        (lsu_ffu_ld_vld),
                 .lsu_ffu_stb_full0     (lsu_ffu_stb_full0),
                 .lsu_ffu_stb_full1     (lsu_ffu_stb_full1),
                 .lsu_ffu_stb_full2     (lsu_ffu_stb_full2),
                 .lsu_ffu_stb_full3     (lsu_ffu_stb_full3),
                 .rclk                  (clk),

                 .srams_rtap_data (srams_rtap_data),
                 .rtap_srams_bist_command (rtap_srams_bist_command),
                 .rtap_srams_bist_data (rtap_srams_bist_data)
                 );


task generate_mask;
integer i;
begin
for(i=0;i<outputwidth;i=i+1)
  output_vector_mask[i] = (output_vector_ref[i] === 1'b0) | (output_vector_ref[i] === 1'b1);
end
endtask


assign {
    arst_l,
    grst_l,
    lsu_ffu_st_dtlb_perr_g,
    exu_ffu_ist_e,
    ifu_ffu_tid_d,
    cpx_fpu_data,
    cpx_vld,
    cpx_fcmp,
    cpx_req,
    cpx_fccval,
    cpx_fpexc,
    exu_ffu_gsr_mask_m,
    exu_ffu_gsr_scale_m,
    exu_ffu_gsr_align_m,
    exu_ffu_gsr_rnd_m,
    ifu_ffu_ldst_single_d,
    exu_ffu_wsr_inst_e,
    ifu_exu_disable_ce_e,
    ifu_exu_ecc_mask,
    ifu_exu_nceen_e,
    ifu_ffu_fcc_num_d,
    ifu_ffu_fld_d,
    ifu_ffu_fpop1_d,
    ifu_ffu_fpop2_d,
    ifu_ffu_fpopcode_d,
    ifu_ffu_frd_d,
    ifu_ffu_frs1_d,        
    ifu_ffu_frs2_d,
    ifu_ffu_fst_d,
    ifu_ffu_inj_frferr,
    ifu_ffu_ldfsr_d,
    ifu_ffu_ldxfsr_d,
    ifu_ffu_mvcnd_m,
    ifu_ffu_quad_op_e,
    ifu_ffu_stfsr_d,
    ifu_ffu_visop_d,
    ifu_lsu_ld_inst_e,
    ifu_tlu_flsh_inst_e,  
    ifu_tlu_flush_w,
    ifu_tlu_inst_vld_w,
    ifu_tlu_sraddr_d,
    lsu_ffu_ack,
    lsu_ffu_bld_cnt_w,
    lsu_ffu_blk_asi_e,
    lsu_ffu_flush_pipe_w,
    lsu_ffu_ld_data,
    lsu_ffu_ld_vld,
    lsu_ffu_stb_full0,
    lsu_ffu_stb_full1,
    lsu_ffu_stb_full2,      
    lsu_ffu_stb_full3,
    rtap_srams_bist_command,
    rtap_srams_bist_data

} = input_vector;

assign output_vector = {
   ffu_lsu_data,
   ffu_ifu_cc_vld_w2,
   ffu_ifu_cc_w2,
   ffu_ifu_ecc_ce_w2,      
   ffu_ifu_ecc_ue_w2,
   ffu_ifu_err_reg_w2,
   ffu_ifu_err_synd_w2,
   ffu_ifu_fpop_done_w2,
   ffu_ifu_fst_ce_w,
   ffu_ifu_inj_ack,
   ffu_ifu_stallreq,
   ffu_ifu_tid_w2,
   ffu_lsu_blk_st_e,
   ffu_lsu_blk_st_va_e,
   ffu_lsu_fpop_rq_vld,
   ffu_lsu_kill_fst_w,
   ffu_tlu_fpu_cmplt,
   ffu_tlu_fpu_tid,
   ffu_tlu_ill_inst_m,
   ffu_tlu_trap_ieee754,
   ffu_tlu_trap_other,
   ffu_tlu_trap_ue,
   ffu_exu_rsr_data_m,
   srams_rtap_data
};


assign clk = clk_en? clock_vector : 1'b0;





assign output_vector_ref_masked = output_vector_ref & output_vector_mask;
assign output_vector_masked = output_vector & output_vector_mask;

always @(output_vector_ref)
  generate_mask;

integer i;
initial generate_mask;

initial mismatch = 0;
initial cycle = 0;

always @(negedge clock_vector) begin
  cycle = cycle + 1;
  if(cycle > 2)
  begin
  if(output_vector_ref_masked !== output_vector_masked) begin
    mismatch = mismatch + 1;
    for(i=0;i<outputwidth;i=i+1)
      if(output_vector_ref_masked[i] !== output_vector_masked[i])
	 displayMismatch(i, output_vector_ref_masked[i], output_vector_masked[i]);
    $display("Number of cycles mismatched %d\n",mismatch);
  end
  end
end

endmodule

module cmp_top();

playback_driver iop();

`ifdef DUMP_ON

initial
  if($test$plusargs("dump"))
    $fsdbDumpvars(0, cmp_top.iop);

`endif

endmodule


