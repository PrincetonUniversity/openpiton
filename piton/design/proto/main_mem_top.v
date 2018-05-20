// ========== Copyright Header Begin ============================================
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
// ========== Copyright Header End ============================================

module mc_top (
    input           clk,
    input           rst_n,

    input  [FLIT_SIZE-1:0] flit_in;
input  flit_in_val;
output flit_in_rdy;

output [FLIT_SIZE-1:0] flit_out;  // TODO: Alexey: was it a bug?
output flit_out_val;
input  flit_out_rdy;

    inout [63:0]ddr3_dq;
  inout [7:0]ddr3_dqs_n;
  inout [7:0]ddr3_dqs_p;
  output [13:0]ddr3_addr;
  output [2:0]ddr3_ba;
  output ddr3_ras_n;
  output ddr3_cas_n;
  output ddr3_we_n;
  output ddr3_reset_n;
  output [0:0]ddr3_ck_p;
  output [0:0]ddr3_ck_n;
  output [0:0]ddr3_cke;
  output [0:0]ddr3_cs_n;
  output [7:0]ddr3_dm;
  output [0:0]ddr3_odt;
  input sys_clk_p;
  input sys_clk_n;
  
  output ui_clk;
  output ui_clk_sync_rst;

  output init_calib_complete;
  input sys_rst;

    
);

wire    [27:0]          app_addr;
        wire    [2:0]           app_cmd;
        wire                    app_en;
        wire    [511:0]         app_wdf_data;
        wire                    app_wdf_end;
        wire                    app_wdf_wren;
        wire    [511:0]         app_rd_data;
        wire                    app_rd_data_end;
        wire                    app_rd_data_valid;
        wire                    app_rdy;
        wire                    app_wdf_rdy;
        wire                    app_sr_req;
        wire                    app_ref_req;
        wire                    app_zq_req;
        wire                    app_sr_active;
        wire                    app_ref_ack;
        wire                    app_zq_ack;
        wire                    ui_clk;
        wire                    ui_clk_sync_rst;
        wire    [63:0]          app_wdf_mask;

        pkt_trans_dp    pkt_trans_dp    (
            .clk                (ui_clk                     ),  // from MC
            .rst                (ui_clk_sync_rst            ),  // from MC

            .flit_in            (splitter_mem_noc2_data     ),
            .flit_in_val        (splitter_mem_noc2_valid    ),
            .flit_in_rdy        (splitter_mem_noc2_ready    ),
            .flit_out           (mem_splitter_noc3_data     ),
            .flit_out_val       (mem_splitter_noc3_valid    ),
            .flit_out_rdy       (mem_splitter_noc3_ready    ),

            .app_rdy            (app_rdy                    ),
            .app_wdf_rdy        (app_wdf_rdy                ),
            .app_rd_data        (app_rd_data                ),
            .app_rd_data_end    (app_rd_data_end            ),
            .app_rd_data_valid  (app_rd_data_valid          ),
            .phy_init_done      (phy_init_done              ),
            .app_wdf_wren       (app_wdf_wren               ),
            .app_wdf_data       (app_wdf_data               ),
            .app_wdf_mask       (app_wdf_mask               ),
            .app_wdf_end        (app_wdf_end                ),
            .app_addr           (app_addr                   ),
            .app_en             (app_en                     ),
            .app_cmd            (app_cmd                    )
        );

        mig_7series_0   mc_ddr3_top (
            // Memory interface ports
            .ddr3_addr                      (ddr3_addr),  // output [13:0]      ddr3_addr
            .ddr3_ba                        (ddr3_ba),  // output [2:0]     ddr3_ba
            .ddr3_cas_n                     (ddr3_cas_n),  // output            ddr3_cas_n
            .ddr3_ck_n                      (ddr3_ck_n),  // output [0:0]       ddr3_ck_n
            .ddr3_ck_p                      (ddr3_ck_p),  // output [0:0]       ddr3_ck_p
            .ddr3_cke                       (ddr3_cke),  // output [0:0]        ddr3_cke
            .ddr3_ras_n                     (ddr3_ras_n),  // output            ddr3_ras_n
            .ddr3_reset_n                   (ddr3_reset_n),  // output          ddr3_reset_n
            .ddr3_we_n                      (ddr3_we_n),  // output         ddr3_we_n
            .ddr3_dq                        (ddr3_dq),  // inout [63:0]     ddr3_dq
            .ddr3_dqs_n                     (ddr3_dqs_n),  // inout [7:0]       ddr3_dqs_n
            .ddr3_dqs_p                     (ddr3_dqs_p),  // inout [7:0]       ddr3_dqs_p
            .init_calib_complete            (init_calib_complete),  // output           init_calib_complete
              
            .ddr3_cs_n                      (ddr3_cs_n),  // output [0:0]       ddr3_cs_n
            .ddr3_dm                        (ddr3_dm),  // output [7:0]     ddr3_dm
            .ddr3_odt                       (ddr3_odt),  // output [0:0]        ddr3_odt
            // Application interface ports
            .app_addr                       (app_addr),  // input [27:0]        app_addr
            .app_cmd                        (app_cmd),  // input [2:0]      app_cmd
            .app_en                         (app_en),  // input             app_en
            .app_wdf_data                   (app_wdf_data),  // input [511:0]       app_wdf_data
            .app_wdf_end                    (app_wdf_end),  // input                app_wdf_end
            .app_wdf_wren                   (app_wdf_wren),  // input               app_wdf_wren
            .app_rd_data                    (app_rd_data),  // output [511:0]       app_rd_data
            .app_rd_data_end                (app_rd_data_end),  // output           app_rd_data_end
            .app_rd_data_valid              (app_rd_data_valid),  // output         app_rd_data_valid
            .app_rdy                        (app_rdy),  // output           app_rdy
            .app_wdf_rdy                    (app_wdf_rdy),  // output           app_wdf_rdy
            .app_sr_req                     (app_sr_req),  // input         app_sr_req
            .app_ref_req                    (app_ref_req),  // input            app_ref_req
            .app_zq_req                     (app_zq_req),  // input         app_zq_req
            .app_sr_active                  (app_sr_active),  // output         app_sr_active
            .app_ref_ack                    (app_ref_ack),  // output           app_ref_ack
            .app_zq_ack                     (app_zq_ack),  // output            app_zq_ack
            .ui_clk                         (ui_clk),  // output            ui_clk
            .ui_clk_sync_rst                (ui_clk_sync_rst),  // output           ui_clk_sync_rst
            .app_wdf_mask                   (app_wdf_mask),  // input [63:0]        app_wdf_mask
            // Debug Ports
            .ddr3_ila_basic                 (ddr3_ila_basic),  // output [119:0]                               ddr3_ila_basic
            .ddr3_ila_wrpath                (ddr3_ila_wrpath),  // output [390:0]                               ddr3_ila_wrpath
            .ddr3_ila_rdpath                (ddr3_ila_rdpath),  // output [1023:0]                              ddr3_ila_rdpath
            .ddr3_vio_sync_out              (ddr3_vio_sync_out),  // input [13:0]                                 ddr3_vio_sync_out
            .dbg_pi_counter_read_val        (dbg_pi_counter_read_val),  // output [5:0]         dbg_pi_counter_read_val
            .dbg_sel_pi_incdec              (dbg_sel_pi_incdec),  // input          dbg_sel_pi_incdec
            .dbg_po_counter_read_val        (dbg_po_counter_read_val),  // output [8:0]         dbg_po_counter_read_val
            .dbg_sel_po_incdec              (dbg_sel_po_incdec),  // input          dbg_sel_po_incdec
            .dbg_byte_sel                   (dbg_byte_sel),  // input [3:0]         dbg_byte_sel
            .dbg_pi_f_inc                   (dbg_pi_f_inc),  // input           dbg_pi_f_inc
            .dbg_pi_f_dec                   (dbg_pi_f_dec),  // input           dbg_pi_f_dec
            .dbg_po_f_inc                   (dbg_po_f_inc),  // input           dbg_po_f_inc
            .dbg_po_f_stg23_sel             (dbg_po_f_stg23_sel),  // input         dbg_po_f_stg23_sel
            .dbg_po_f_dec                   (dbg_po_f_dec),  // input           dbg_po_f_dec
            // System Clock Ports
            .sys_clk_p                      (clk_p),  // input             sys_clk_p
            .sys_clk_n                      (clk_n),  // input             sys_clk_n
            .sys_rst                        (sys_rst) // input sys_rst
        );

endmodule 