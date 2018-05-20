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

`include "mc_define.h"

module mc_top (
    output                          mc_ui_clk,
    output                          mc_ui_clk_sync_rst,
    input                           core_ref_clk,
    input                           test_start,

     input   [`NOC_DATA_WIDTH-1:0]   mc_flit_in_data,
     input                           mc_flit_in_val,
     output                          mc_flit_in_rdy,

     output  [`NOC_DATA_WIDTH-1:0]   mc_flit_out_data,
     output                          mc_flit_out_val,
     input                           mc_flit_out_rdy,

    input                               uart_mig_en,           
    input   [`MIG_APP_CMD_WIDTH-1 :0]   uart_mig_cmd,          
    input   [`MIG_APP_ADDR_WIDTH-1:0]   uart_mig_addr,         
    output                              uart_mig_rdy,          
    input                               uart_mig_wdf_wren,     
    input   [`MIG_APP_DATA_WIDTH-1:0]   uart_mig_wdf_data,     
    input   [`MIG_APP_MASK_WIDTH-1:0]   uart_mig_wdf_mask,     
    input                               uart_mig_wdf_end,      
    output                              uart_mig_wdf_rdy,

    input                           sys_clk,

`ifdef VC707_BOARD
    output  [13:0]                  ddr3_addr,
    output  [2:0]                   ddr3_ba,
    output                          ddr3_ras_n,
    output                          ddr3_cas_n,
    inout   [63:0]                  ddr3_dq,
    inout   [7:0]                   ddr3_dqs_n,
    inout   [7:0]                   ddr3_dqs_p,
    output                          ddr3_we_n,
    output                          ddr3_reset_n,
    output  [0:0]                   ddr3_ck_p,
    output  [0:0]                   ddr3_ck_n,
    output  [0:0]                   ddr3_cke,
    output  [0:0]                   ddr3_cs_n,
    output  [7:0]                   ddr3_dm,
    output  [0:0]                   ddr3_odt,
`elsif NEXYS4DDR_BOARD
    output  [12:0]                  ddr2_addr,
    output  [2:0]                   ddr2_ba,
    output                          ddr2_cas_n,
    output  [0:0]                   ddr2_ck_n,
    output  [0:0]                   ddr2_ck_p,
    output  [0:0]                   ddr2_cke,
    output                          ddr2_ras_n,
    output                          ddr2_we_n,
    inout   [15:0]                  ddr2_dq,
    inout   [1:0]                   ddr2_dqs_n,
    inout   [1:0]                   ddr2_dqs_p,
    output  [0:0]                   ddr2_cs_n,
    output  [1:0]                   ddr2_dm,
    output  [0:0]                   ddr2_odt,
`elsif GENESYS2_BOARD
    output  [14:0]                  ddr3_addr,
    output  [2:0]                   ddr3_ba,
    output                          ddr3_cas_n,
    output  [0:0]                   ddr3_ck_n,
    output  [0:0]                   ddr3_ck_p,
    output  [0:0]                   ddr3_cke,
    output                          ddr3_ras_n,
    output                          ddr3_reset_n,
    output                          ddr3_we_n,
    inout   [31:0]                  ddr3_dq,
    inout   [3:0]                   ddr3_dqs_n,
    inout   [3:0]                   ddr3_dqs_p,
    output                          init_calib_complete,
    output  [0:0]                   ddr3_cs_n,
    output  [3:0]                   ddr3_dm,
    output  [0:0]                   ddr3_odt,
`elsif NEXYSVIDEO_BOARD
    output  [14:0]                  ddr3_addr,
    output  [2:0]                   ddr3_ba,
    output                          ddr3_cas_n,
    output  [0:0]                   ddr3_ck_n,
    output  [0:0]                   ddr3_ck_p,
    output  [0:0]                   ddr3_cke,
    output                          ddr3_ras_n,
    output                          ddr3_reset_n,
    output                          ddr3_we_n,
    inout   [15:0]                  ddr3_dq,
    inout   [1:0]                   ddr3_dqs_n,
    inout   [1:0]                   ddr3_dqs_p,
    output  [1:0]                   ddr3_dm,
    output  [0:0]                   ddr3_odt,
`endif
    
    output                          init_calib_complete_out,
    input                           sys_rst_n
);
reg     [31:0]          delay_cnt;
reg                     ui_clk_syn_rst_delayed;
wire                    init_calib_complete;
wire                    afifo_rst_1;
wire                    afifo_rst_2;

 wire                                      app_en;
 wire    [`MIG_APP_CMD_WIDTH-1 :0]         app_cmd;
 wire    [`MIG_APP_ADDR_WIDTH-1:0]         app_addr;
 wire                                      app_rdy;
 wire                                      app_wdf_wren;
 wire    [`MIG_APP_DATA_WIDTH-1:0]         app_wdf_data;
 wire    [`MIG_APP_MASK_WIDTH-1:0]         app_wdf_mask;
 wire                                      app_wdf_rdy;
 wire                                      app_wdf_end;
 wire    [`MIG_APP_DATA_WIDTH-1:0]         app_rd_data;
 wire                                      app_rd_data_end;
 wire                                      app_rd_data_valid;

 wire                                      core_app_en;
 wire    [`MIG_APP_CMD_WIDTH-1 :0]         core_app_cmd;
 wire    [`MIG_APP_ADDR_WIDTH-1:0]         core_app_addr;
 wire                                      core_app_rdy;
 wire                                      core_app_wdf_wren;
 wire    [`MIG_APP_DATA_WIDTH-1:0]         core_app_wdf_data;
 wire    [`MIG_APP_MASK_WIDTH-1:0]         core_app_wdf_mask;
 wire                                      core_app_wdf_rdy;
 wire                                      core_app_wdf_end;
 wire    [`MIG_APP_DATA_WIDTH-1:0]         core_app_rd_data;
 wire                                      core_app_rd_data_end;
 wire                                      core_app_rd_data_valid;


wire                                      app_sr_req;
wire                                      app_ref_req;
wire                                      app_zq_req;
wire                                      app_sr_active;
wire                                      app_ref_ack;
wire                                      app_zq_ack;
wire                                      ui_clk;
wire                                      ui_clk_sync_rst;

reg afifo_ui_rst_r;
reg afifo_ui_rst_r_r;

reg ui_clk_sync_rst_r;
reg ui_clk_sync_rst_r_r;

// needed for correct rst of async fifo
always @(posedge core_ref_clk) begin
    if (~sys_rst_n)
        delay_cnt <= 32'h1ff;
    else begin
        delay_cnt <= (delay_cnt != 0) & ~ui_clk_sync_rst_r_r ? delay_cnt - 1 : delay_cnt;
    end
end

always @(posedge core_ref_clk) begin
    if (ui_clk_sync_rst)
        ui_clk_syn_rst_delayed <= 1'b1;
    else begin
        ui_clk_syn_rst_delayed <= delay_cnt != 0;
    end
end

assign mc_ui_clk            = ui_clk;
assign mc_ui_clk_sync_rst   = ui_clk_syn_rst_delayed;

assign init_calib_complete_out = init_calib_complete & ~ui_clk_syn_rst_delayed;
assign afifo_rst_1 = ui_clk_syn_rst_delayed;


always @(posedge ui_clk) begin
    afifo_ui_rst_r <= afifo_rst_1;
    afifo_ui_rst_r_r <= afifo_ui_rst_r;
end


always @(posedge core_ref_clk) begin
    ui_clk_sync_rst_r   <= ui_clk_sync_rst;
    ui_clk_sync_rst_r_r <= ui_clk_sync_rst_r;
end

assign afifo_rst_2 = afifo_ui_rst_r_r | ui_clk_sync_rst;

// TODO: zeroed based on example simulation of MIG7
assign app_ref_req = 1'b0;
assign app_sr_req = 1'b0;
assign app_zq_req = 1'b0;

 wire                              trans_fifo_val;
 wire    [`NOC_DATA_WIDTH-1:0]     trans_fifo_data;
 wire                              trans_fifo_rdy;

 wire                              fifo_trans_val;
 wire    [`NOC_DATA_WIDTH-1:0]     fifo_trans_data;
 wire                              fifo_trans_rdy;

// ui_clk - fast mem clk - clk2
// 
mig_async_fifo  mig_async_fifo  (
    .clk_1           (core_ref_clk      ),
    .rst_1           (afifo_rst_1       ),
    .flit_in_val_1   (mc_flit_in_val    ),
    .flit_in_data_1  (mc_flit_in_data   ),
    .flit_in_rdy_1   (mc_flit_in_rdy    ),

    .clk_2           (ui_clk            ),
    .rst_2           (afifo_rst_2       ),
    .flit_in_val_2   (trans_fifo_val    ),
    .flit_in_data_2  (trans_fifo_data   ),
    .flit_in_rdy_2   (trans_fifo_rdy    ),

    .flit_out_data_1 (mc_flit_out_data  ),
    .flit_out_val_1  (mc_flit_out_val   ),
    .flit_out_rdy_1  (mc_flit_out_rdy   ),

    .flit_out_val_2  (fifo_trans_val    ),
    .flit_out_data_2 (fifo_trans_data   ),
    .flit_out_rdy_2  (fifo_trans_rdy    )
);

pkt_trans_dp_wide    #  (
    .MIG_APP_ADDR_WIDTH (`MIG_APP_ADDR_WIDTH        ),
    .MIG_APP_DATA_WIDTH (`MIG_APP_DATA_WIDTH        )
)   pkt_trans_dp_wide   (
    .clk                (ui_clk                     ),  // from MC
    .rst                (ui_clk_sync_rst            ),  // from MC

    .flit_in            (fifo_trans_data            ),
    .flit_in_val        (fifo_trans_val             ),
    .flit_in_rdy        (fifo_trans_rdy             ),
    .flit_out           (trans_fifo_data            ),
    .flit_out_val       (trans_fifo_val             ),
    .flit_out_rdy       (trans_fifo_rdy             ),

    .app_rdy            (core_app_rdy               ),
    .app_wdf_rdy        (core_app_wdf_rdy           ),
    .app_rd_data        (core_app_rd_data           ),
    .app_rd_data_end    (core_app_rd_data_end       ),
    .app_rd_data_valid  (core_app_rd_data_valid     ),
    .phy_init_done      (init_calib_complete        ),

    .app_wdf_wren_reg   (core_app_wdf_wren          ),
    .app_wdf_data_out   (core_app_wdf_data          ),
    .app_wdf_mask_out   (core_app_wdf_mask          ),
    .app_wdf_end_out    (core_app_wdf_end           ),
    .app_addr_out       (core_app_addr              ),
    .app_en_reg         (core_app_en                ),
    .app_cmd_reg        (core_app_cmd               )
);


mig_mux   mig_mux (
  .mux_sel                  (test_start             ),

  .uart_mig_en              (uart_mig_en            ),
  .uart_mig_cmd             (uart_mig_cmd           ),
  .uart_mig_addr            (uart_mig_addr          ),
  .uart_mig_rdy             (uart_mig_rdy           ),
  .uart_mig_wdf_wren        (uart_mig_wdf_wren      ),
  .uart_mig_wdf_data        (uart_mig_wdf_data      ),
  .uart_mig_wdf_mask        (uart_mig_wdf_mask      ),
  .uart_mig_wdf_end         (uart_mig_wdf_end       ),
  .uart_mig_wdf_rdy         (uart_mig_wdf_rdy       ),

  .core_app_en              (core_app_en            ),
  .core_app_cmd             (core_app_cmd           ),
  .core_app_addr            (core_app_addr          ),
  .core_app_rdy             (core_app_rdy           ),
  .core_app_wdf_wren        (core_app_wdf_wren      ),
  .core_app_wdf_data        (core_app_wdf_data      ),
  .core_app_wdf_mask        (core_app_wdf_mask      ),
  .core_app_wdf_end         (core_app_wdf_end       ),
  .core_app_wdf_rdy         (core_app_wdf_rdy       ),
  .core_app_rd_data_valid   (core_app_rd_data_valid ),
  .core_app_rd_data_end     (core_app_rd_data_end   ),
  .core_app_rd_data         (core_app_rd_data       ),

  .app_en                   (app_en                 ),
  .app_cmd                  (app_cmd                ),
  .app_addr                 (app_addr               ),
  .app_rdy                  (app_rdy                ),
  .app_wdf_wren             (app_wdf_wren           ),
  .app_wdf_data             (app_wdf_data           ),
  .app_wdf_mask             (app_wdf_mask           ),
  .app_wdf_end              (app_wdf_end            ),
  .app_wdf_rdy              (app_wdf_rdy            ),
  .app_rd_data_valid        (app_rd_data_valid      ),
  .app_rd_data_end          (app_rd_data_end        ),
  .app_rd_data              (app_rd_data            )
);

mig_7series_0   mig_7series_0 (
    // Memory interface ports
`ifdef VC707_BOARD
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
`elsif NEXYS4DDR_BOARD
    .ddr2_addr                      (ddr2_addr),  // output [12:0]                       ddr2_addr
    .ddr2_ba                        (ddr2_ba),  // output [2:0]                      ddr2_ba
    .ddr2_cas_n                     (ddr2_cas_n),  // output                                       ddr2_cas_n
    .ddr2_ck_n                      (ddr2_ck_n),  // output [0:0]                        ddr2_ck_n
    .ddr2_ck_p                      (ddr2_ck_p),  // output [0:0]                        ddr2_ck_p
    .ddr2_cke                       (ddr2_cke),  // output [0:0]                       ddr2_cke
    .ddr2_ras_n                     (ddr2_ras_n),  // output                                       ddr2_ras_n
    .ddr2_we_n                      (ddr2_we_n),  // output                                       ddr2_we_n
    .ddr2_dq                        (ddr2_dq),  // inout [15:0]                         ddr2_dq
    .ddr2_dqs_n                     (ddr2_dqs_n),  // inout [1:0]                        ddr2_dqs_n
    .ddr2_dqs_p                     (ddr2_dqs_p),  // inout [1:0]                        ddr2_dqs_p
    .init_calib_complete            (init_calib_complete),  // output                                       init_calib_complete
      
    .ddr2_cs_n                      (ddr2_cs_n),  // output [0:0]           ddr2_cs_n
    .ddr2_dm                        (ddr2_dm),  // output [1:0]                        ddr2_dm
    .ddr2_odt                       (ddr2_odt),  // output [0:0]                       ddr2_odt
`elsif GENESYS2_BOARD
    // Memory interface ports
    .ddr3_addr                      (ddr3_addr),  // output [14:0]      ddr3_addr
    .ddr3_ba                        (ddr3_ba),  // output [2:0]     ddr3_ba
    .ddr3_cas_n                     (ddr3_cas_n),  // output            ddr3_cas_n
    .ddr3_ck_n                      (ddr3_ck_n),  // output [0:0]       ddr3_ck_n
    .ddr3_ck_p                      (ddr3_ck_p),  // output [0:0]       ddr3_ck_p
    .ddr3_cke                       (ddr3_cke),  // output [0:0]        ddr3_cke
    .ddr3_ras_n                     (ddr3_ras_n),  // output            ddr3_ras_n
    .ddr3_reset_n                   (ddr3_reset_n),  // output          ddr3_reset_n
    .ddr3_we_n                      (ddr3_we_n),  // output         ddr3_we_n
    .ddr3_dq                        (ddr3_dq),  // inout [31:0]     ddr3_dq
    .ddr3_dqs_n                     (ddr3_dqs_n),  // inout [3:0]       ddr3_dqs_n
    .ddr3_dqs_p                     (ddr3_dqs_p),  // inout [3:0]       ddr3_dqs_p
    .init_calib_complete            (init_calib_complete),  // output           init_calib_complete
    
    .ddr3_cs_n                      (ddr3_cs_n),  // output [0:0]       ddr3_cs_n
    .ddr3_dm                        (ddr3_dm),  // output [3:0]     ddr3_dm
    .ddr3_odt                       (ddr3_odt),  // output [0:0]        ddr3_odt
`elsif NEXYSVIDEO_BOARD
 // Memory interface ports
    .ddr3_addr                      (ddr3_addr),  // output [14:0]      ddr3_addr
    .ddr3_ba                        (ddr3_ba),  // output [2:0]     ddr3_ba
    .ddr3_cas_n                     (ddr3_cas_n),  // output            ddr3_cas_n
    .ddr3_ck_n                      (ddr3_ck_n),  // output [0:0]       ddr3_ck_n
    .ddr3_ck_p                      (ddr3_ck_p),  // output [0:0]       ddr3_ck_p
    .ddr3_cke                       (ddr3_cke),  // output [0:0]        ddr3_cke
    .ddr3_ras_n                     (ddr3_ras_n),  // output            ddr3_ras_n
    .ddr3_reset_n                   (ddr3_reset_n),  // output          ddr3_reset_n
    .ddr3_we_n                      (ddr3_we_n),  // output         ddr3_we_n
    .ddr3_dq                        (ddr3_dq),  // inout [15:0]     ddr3_dq
    .ddr3_dqs_n                     (ddr3_dqs_n),  // inout [1:0]       ddr3_dqs_n
    .ddr3_dqs_p                     (ddr3_dqs_p),  // inout [1:0]       ddr3_dqs_p
    .init_calib_complete            (init_calib_complete),  // output           init_calib_complete
      
    .ddr3_dm                        (ddr3_dm),  // output [1:0]     ddr3_dm
    .ddr3_odt                       (ddr3_odt),  // output [0:0]        ddr3_odt
`endif

    // Application interface ports
    .app_addr                       (app_addr),
    .app_cmd                        (app_cmd),
    .app_en                         (app_en),
    .app_wdf_data                   (app_wdf_data),
    .app_wdf_end                    (app_wdf_end),
    .app_wdf_wren                   (app_wdf_wren),
    .app_rd_data                    (app_rd_data),
    .app_rd_data_end                (app_rd_data_end),
    .app_rd_data_valid              (app_rd_data_valid),
    .app_rdy                        (app_rdy),
    .app_wdf_rdy                    (app_wdf_rdy),
    .app_sr_req                     (app_sr_req),
    .app_ref_req                    (app_ref_req),
    .app_zq_req                     (app_zq_req),
    .app_sr_active                  (app_sr_active),
    .app_ref_ack                    (app_ref_ack),
    .app_zq_ack                     (app_zq_ack),
    .ui_clk                         (ui_clk),
    .ui_clk_sync_rst                (ui_clk_sync_rst),
    .app_wdf_mask                   (app_wdf_mask),

    // System Clock Ports
    .sys_clk_i                      (sys_clk),
    .sys_rst                        (sys_rst_n)
);


`ifdef PITON_PROTO
`ifndef PITON_PROTO_NO_MON

    always @(posedge ui_clk) begin
        if (app_en) begin
            $display("MC_TOP: command to MIG. Addr: 0x%x, cmd: 0x%x at", app_addr, app_cmd, $time);
        end

        if (app_wdf_wren) begin
            $display("MC_TOP: writing data 0x%x to memory at", app_wdf_data, $time);
        end

        if (app_rd_data_valid) begin
            $display("MC_TOP: read data 0x%x from memory at", app_rd_data, $time);
        end
    end

`endif  // PITON_PROTO_NO_MON
`endif  // PITON_PROTO

endmodule 