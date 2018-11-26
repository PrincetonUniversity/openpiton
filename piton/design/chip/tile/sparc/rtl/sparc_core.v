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


// `include "sys.h"
`include "iop.h"
`include "define.tmp.h"

`ifdef L15_EXTRA_DEBUG
`default_nettype none
`endif
// Note: adapted from iop_fpga.v
module sparc_core(
    input wire gclk,
    input wire reset_l,
    input wire pcx_spc0_grant_px,
    input wire [144:0] cpx_spc0_data_cx2,

    output wire spc_grst_l,
    output wire [4:0] spc0_pcx_req_pq,
    output wire spc0_pcx_atom_pq,

    // sram interface
    output wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] srams_rtap_data,
    input wire  [`BIST_OP_WIDTH-1:0] rtap_srams_bist_command,
    input wire  [`SRAM_WRAPPER_BUS_WIDTH-1:0] rtap_srams_bist_data,

    // jtag debug
    output wire [`CORE_JTAG_BUS_WIDTH-1:0] core_rtap_data,
    input wire rtap_core_val,
    input wire [1:0] rtap_core_threadid,
    input wire [`JTAG_CORE_ID_WIDTH-1:0]  rtap_core_id,
    input wire [47:0] rtap_core_data,

    `ifndef NO_RTL_CSM
    output wire [`TLB_CSM] spc0_pcx_csm_pa,
    `endif
    output wire [123:0] spc0_pcx_data_pa

);

// WIRE Definitions for unused outputs
// wire     spc_scanout0;
// wire     spc_scanout1;
// wire     tst_ctu_mbist_done;
// wire     tst_ctu_mbist_fail;

// WIRE Definitions for constraint
// wire  [3:0] const_cpuid = 4'b0000;
// wire  [7:0] const_maskid = 8'h20;
// wire     ctu_tst_mbist_enable = 1'b0;
// wire     ctu_tst_macrotest = 1'b0;
// wire     ctu_tst_scan_disable = 1'b0;
// wire     ctu_tst_short_chain = 1'b0;
// wire     global_shift_enable = 1'b0;
// wire     ctu_tst_scanmode = 1'b0;
// wire     spc_scanin0 = 1'b0;
// wire     spc_scanin1 = 1'b0;

// Reset Related Signals
// wire     cluster_cken;
// wire     cmp_grst_l;
// wire     cmp_arst_l;
// wire     ctu_tst_pre_grst_l;
// wire     adbginit_l;
// wire     gdbginit_l;
// reg      reset_l_int;
// reg      sync;

// // Reset Logic
// assign cmp_arst_l = reset_l_int;
// assign adbginit_l = reset_l_int;

// reg [7:0] reset_delay;

// // Synchronize the incoming reset net into the gclk domain
// always @(posedge gclk) begin
//     {reset_l_int, sync} <= {sync, reset_l};
// end

// always @(posedge gclk) begin
//     if(~reset_l_int) begin
//         reset_delay <= 8'b0;
//     end else
//         if(reset_delay != 8'hff)
//             reset_delay <= reset_delay + 8'b1;
// end

// assign cluster_cken = (reset_delay > 8'd20) ? 1'b1 : 1'b0;
// assign ctu_tst_pre_grst_l = (reset_delay > 8'd60) ? 1'b1 : 1'b0;
// assign gdbginit_l = (reset_delay > 8'd120) ? 1'b1 : 1'b0;
// assign cmp_grst_l = (reset_delay > 8'd120) ? 1'b1 : 1'b0;

// Reset Logic
// assign cmp_arst_l = reset_l;
// assign adbginit_l = reset_l;

// assign cluster_cken = 1'b1;
// assign ctu_tst_pre_grst_l = reset_l;
// assign gdbginit_l = reset_l;
// assign cmp_grst_l = reset_l;



sparc sparc0 (

     `ifndef NO_RTL_CSM
     .spc_pcx_csm_pa        (spc0_pcx_csm_pa),
     `endif
     .spc_grst_l            (spc_grst_l),
    .spc_pcx_req_pq         (spc0_pcx_req_pq),
    .spc_pcx_atom_pq     (spc0_pcx_atom_pq),
    .spc_pcx_data_pa     (spc0_pcx_data_pa),
    // .spc_scanout0        (spc_scanout0),
    // .spc_scanout1        (spc_scanout1),
    // .tst_ctu_mbist_done     (tst_ctu_mbist_done),
    // .tst_ctu_mbist_fail     (tst_ctu_mbist_fail),
    .pcx_spc_grant_px    ({4'bx, pcx_spc0_grant_px}),
    .cpx_spc_data_rdy_cx2      (1'bx),
    .cpx_spc_data_cx2    (cpx_spc0_data_cx2),
    // .const_cpuid         (const_cpuid),
    // .const_maskid        (const_maskid),
    // .ctu_tst_mbist_enable      (ctu_tst_mbist_enable),
    // .ctu_tst_macrotest      (ctu_tst_macrotest),
    // .ctu_tst_scan_disable      (ctu_tst_scan_disable),
    // .ctu_tst_short_chain    (ctu_tst_short_chain),
    // .global_shift_enable    (global_shift_enable),
    // .ctu_tst_scanmode    (ctu_tst_scanmode),
    // .spc_scanin0         (spc_scanin0),
    // .spc_scanin1         (spc_scanin1),

    // Clocking
    // .cluster_cken        (cluster_cken),
    .gclk          (gclk),
    // .cmp_grst_l       (cmp_grst_l),
    .cmp_arst_l       (reset_l),
    // .ctu_tst_pre_grst_l     (ctu_tst_pre_grst_l),
    // .adbginit_l       (adbginit_l),
    // .gdbginit_l       (gdbginit_l),

    // interface to srams
    .srams_rtap_data (srams_rtap_data),
    .rtap_srams_bist_command (rtap_srams_bist_command),
    .rtap_srams_bist_data (rtap_srams_bist_data),

    .core_rtap_data          (core_rtap_data),
    .rtap_core_val         (rtap_core_val),
    .rtap_core_threadid         (rtap_core_threadid),
    .rtap_core_id         (rtap_core_id),
    .rtap_core_data         ({{(`CORE_JTAG_BUS_WIDTH - 48){1'bx}}, rtap_core_data})

    );

// dummy test
//assign srams_rtap_data = rtap_srams_bist_data;


endmodule


