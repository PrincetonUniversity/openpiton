// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: iop.v
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

module sparc_tri (
 input                                  gclk
,input                                  reset_l
,output                                 spc_grst_l

,output [`PCX_REQTYPE_WIDTH-1:0]        transducer_l15_rqtype
,output [`L15_AMO_OP_WIDTH-1:0]         transducer_l15_amo_op

,output                                 transducer_l15_nc
,output [`PCX_SIZE_FIELD_WIDTH-1:0]     transducer_l15_size
,output [`L15_THREADID_MASK]            transducer_l15_threadid
,output                                 transducer_l15_prefetch
,output                                 transducer_l15_invalidate_cacheline
,output                                 transducer_l15_blockstore
,output                                 transducer_l15_blockinitstore
,output [1:0]                           transducer_l15_l1rplway
,output                                 transducer_l15_val
,output [`L15_PADDR_HI:0]               transducer_l15_address
,output [63:0]                          transducer_l15_data
,output [63:0]                          transducer_l15_data_next_entry
,output [`TLB_CSM_WIDTH-1:0]            transducer_l15_csm_data

,input                                  l15_transducer_ack
,input                                  l15_transducer_header_ack

,input                                  l15_transducer_val
,input [3:0]                            l15_transducer_returntype
,input                                  l15_transducer_l2miss
,input [1:0]                            l15_transducer_error
,input                                  l15_transducer_noncacheable
,input                                  l15_transducer_atomic
,input [`L15_THREADID_MASK]             l15_transducer_threadid
,input                                  l15_transducer_prefetch
,input                                  l15_transducer_f4b
,input [63:0]                           l15_transducer_data_0
,input [63:0]                           l15_transducer_data_1
,input [63:0]                           l15_transducer_data_2
,input [63:0]                           l15_transducer_data_3
,input                                  l15_transducer_inval_icache_all_way
,input                                  l15_transducer_inval_dcache_all_way
,input [15:4]                           l15_transducer_inval_address_15_4
,input                                  l15_transducer_cross_invalidate
,input [1:0]                            l15_transducer_cross_invalidate_way
,input                                  l15_transducer_inval_dcache_inval
,input                                  l15_transducer_inval_icache_inval
,input [1:0]                            l15_transducer_inval_way
,input                                  l15_transducer_blockinitstore

,output                                 transducer_l15_req_ack

// sram interface
,output [`SRAM_WRAPPER_BUS_WIDTH-1:0]   srams_rtap_data
,input [`BIST_OP_WIDTH-1:0]             rtap_srams_bist_command
,input [`SRAM_WRAPPER_BUS_WIDTH-1:0]    rtap_srams_bist_data

// jtag debug
,output [`CORE_JTAG_BUS_WIDTH-1:0]      core_rtap_data
,input                                  rtap_core_val
,input  [1:0]                           rtap_core_threadid
,input  [`JTAG_CORE_ID_WIDTH-1:0]       rtap_core_id
,input  [47:0]                          rtap_core_data

);

wire   [4:0]                        pcx_transducer_req;
wire                                pcx_transducer_atomic_req;
wire   [123:0]                      pcx_transducer_data;

`ifndef NO_RTL_CSM
wire   [`TLB_CSM]                   pcx_transducer_csm;
`endif

wire [4:0]                          transducer_pcx_grant;
// is actually cpx_data_valid
wire                                transducer_cpx_data_ready;
wire [144:0]                        transducer_cpx_data;

wire                                cpx_arb_spc_data_rdy;
wire [144:0]                        cpx_arb_spc_data;
wire [4:0]                          cpx_arb_spc_grant;

// the cpx arbitrator should give priority to the L1.5
// when communicating with the sparc core
wire [144:0]                        fpu_arb_data;
wire                                fpu_arb_data_rdy;
wire                                fpu_arb_grant;

sparc_core core(
    .gclk                       (gclk)
    ,.reset_l                   (reset_l)
    ,.spc_grst_l                (spc_grst_l)
    ,.spc0_pcx_req_pq           (pcx_transducer_req)
    ,.spc0_pcx_atom_pq          (pcx_transducer_atomic_req)
    ,.spc0_pcx_data_pa          (pcx_transducer_data)
    `ifndef NO_RTL_CSM
    ,.spc0_pcx_csm_pa           (pcx_transducer_csm)
    `endif
    ,.pcx_spc0_grant_px         (cpx_arb_spc_grant[0])
    ,.cpx_spc0_data_cx2         (cpx_arb_spc_data)
 
    // sram interfaces
    ,.srams_rtap_data           (srams_rtap_data)
    ,.rtap_srams_bist_command   (rtap_srams_bist_command)
    ,.rtap_srams_bist_data      (rtap_srams_bist_data)
 
    ,.core_rtap_data            (core_rtap_data)
    ,.rtap_core_val             (rtap_core_val)
    ,.rtap_core_threadid        (rtap_core_threadid)
    ,.rtap_core_id              (rtap_core_id)
    ,.rtap_core_data            (rtap_core_data)
);

/////////
// FPU //
/////////

fpu_arb_wrap fpu_arb_wrap(
    .clk                        (gclk)
    ,.rst_n                     (reset_l)

    ,.pcx_fpio_data_px2_67_0    (pcx_transducer_data[67:0])
    ,.pcx_fpio_data_px2_79_72   (pcx_transducer_data[79:72])
    ,.pcx_fpio_data_px2_116_112 (pcx_transducer_data[116:112])
    ,.pcx_fpio_data_px2_123_118 (pcx_transducer_data[123:118])

    ,.l15_fp_rdy                (transducer_cpx_data_ready)

    ,.fpu_arb_data_rdy          (fpu_arb_data_rdy)
    ,.fpu_arb_data              (fpu_arb_data)
    ,.fpu_arb_grant             (fpu_arb_grant)
);

////////////////////
// CPX Arbitrator //
////////////////////

cpx_arbitrator cpx_arbitrator(
    .clk                    (gclk)
    ,.rst_n                 (reset_l)

    ,.rtap_arb_req_val      (rtap_arb_req_val)
    ,.rtap_arb_req_data     (rtap_arb_req_data)
    ,.rtap_arb_req_threadid (rtap_arb_req_threadid)

    ,.uncore_spc_data_ready (transducer_cpx_data_ready)
    ,.uncore_spc_data       (transducer_cpx_data)
    ,.uncore_spc_grant      (transducer_pcx_grant)

    ,.fpu_arb_data_rdy      (fpu_arb_data_rdy)
    ,.fpu_arb_data          (fpu_arb_data)
    ,.fpu_arb_grant         (fpu_arb_grant)

    ,.cpx_arb_spc_data_rdy  (cpx_arb_spc_data_rdy)
    ,.cpx_arb_spc_data      (cpx_arb_spc_data)
    ,.cpx_arb_spc_grant     (cpx_arb_spc_grant)
);

ccx_l15_transducer ccx_l15_transducer(
    .clk                                    (gclk)
    ,.rst_n                                 (reset_l)

    ,.pcx_transducer_req_0                  (pcx_transducer_req[0])
    ,.pcx_transducer_atomic_req             (pcx_transducer_atomic_req)
    ,.pcx_transducer_data_123_117           (pcx_transducer_data[123:117])
    ,.pcx_transducer_data_112_0             (pcx_transducer_data[112:0])

    `ifndef NO_RTL_CSM
    ,.pcx_transducer_csm                    (pcx_transducer_csm)
    `endif

    ,.transducer_pcx_grant                  (transducer_pcx_grant)
    ,.transducer_cpx_data_ready             (transducer_cpx_data_ready)
    ,.transducer_cpx_data                   (transducer_cpx_data)

    ,.l15_transducer_ack                    (l15_transducer_ack)
    ,.l15_transducer_header_ack             (l15_transducer_header_ack)

    ,.transducer_l15_rqtype                 (transducer_l15_rqtype)
    ,.transducer_l15_amo_op                 (transducer_l15_amo_op)
    ,.transducer_l15_size                   (transducer_l15_size)
    ,.transducer_l15_val                    (transducer_l15_val)
    ,.transducer_l15_address                (transducer_l15_address)
    ,.transducer_l15_data                   (transducer_l15_data)

    ,.transducer_l15_nc                     (transducer_l15_nc)
    ,.transducer_l15_threadid               (transducer_l15_threadid)
    ,.transducer_l15_prefetch               (transducer_l15_prefetch)
    ,.transducer_l15_blockstore             (transducer_l15_blockstore)
    ,.transducer_l15_blockinitstore         (transducer_l15_blockinitstore)
    ,.transducer_l15_l1rplway               (transducer_l15_l1rplway)
    ,.transducer_l15_invalidate_cacheline   (transducer_l15_invalidate_cacheline)
    ,.transducer_l15_csm_data               (transducer_l15_csm_data)
    ,.transducer_l15_data_next_entry        (transducer_l15_data_next_entry)

    ,.l15_transducer_val                    (l15_transducer_val)
    ,.l15_transducer_returntype             (l15_transducer_returntype)
    ,.l15_transducer_l2miss                 (l15_transducer_l2miss)
    ,.l15_transducer_error                  (l15_transducer_error)
    ,.l15_transducer_noncacheable           (l15_transducer_noncacheable)
    ,.l15_transducer_atomic                 (l15_transducer_atomic)
    ,.l15_transducer_threadid               (l15_transducer_threadid)
    ,.l15_transducer_prefetch               (l15_transducer_prefetch)
    ,.l15_transducer_f4b                    (l15_transducer_f4b)
    ,.l15_transducer_data_0                 (l15_transducer_data_0)
    ,.l15_transducer_data_1                 (l15_transducer_data_1)
    ,.l15_transducer_data_2                 (l15_transducer_data_2)
    ,.l15_transducer_data_3                 (l15_transducer_data_3)
    ,.l15_transducer_inval_icache_all_way   (l15_transducer_inval_icache_all_way)
    ,.l15_transducer_inval_dcache_all_way   (l15_transducer_inval_dcache_all_way)
    ,.l15_transducer_inval_address_15_4     (l15_transducer_inval_address_15_4)
    ,.l15_transducer_cross_invalidate       (l15_transducer_cross_invalidate)
    ,.l15_transducer_cross_invalidate_way   (l15_transducer_cross_invalidate_way)
    ,.l15_transducer_inval_dcache_inval     (l15_transducer_inval_dcache_inval)
    ,.l15_transducer_inval_icache_inval     (l15_transducer_inval_icache_inval)
    ,.l15_transducer_inval_way              (l15_transducer_inval_way)
    ,.l15_transducer_blockinitstore         (l15_transducer_blockinitstore)

    ,.transducer_l15_req_ack                (transducer_l15_req_ack)
);

endmodule
