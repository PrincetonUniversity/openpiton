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

module mig_mux (
  input                                   mux_sel,

  input                                   uart_mig_en,      
  input   [`MIG_APP_CMD_WIDTH-1 :0]       uart_mig_cmd,     
  input   [`MIG_APP_ADDR_WIDTH-1:0]       uart_mig_addr,    
  output                                  uart_mig_rdy,
  input                                   uart_mig_wdf_wren,
  input   [`MIG_APP_DATA_WIDTH-1:0]       uart_mig_wdf_data,
  input   [`MIG_APP_MASK_WIDTH-1:0]       uart_mig_wdf_mask,
  input                                   uart_mig_wdf_end, 
  output                                  uart_mig_wdf_rdy,
  
  input                                   core_app_en,      
  input   [`MIG_APP_CMD_WIDTH-1 :0]       core_app_cmd,    
  input   [`MIG_APP_ADDR_WIDTH-1:0]       core_app_addr,    
  output                                  core_app_rdy,
  input                                   core_app_wdf_wren,
  input   [`MIG_APP_DATA_WIDTH-1:0]       core_app_wdf_data,
  input   [`MIG_APP_MASK_WIDTH-1:0]       core_app_wdf_mask,
  input                                   core_app_wdf_end, 
  output                                  core_app_wdf_rdy,
  output                                  core_app_rd_data_valid,
  output                                  core_app_rd_data_end,  
  output  [`MIG_APP_DATA_WIDTH-1:0]       core_app_rd_data,
           
  output  reg                             app_en,           
  output  reg [`MIG_APP_CMD_WIDTH-1 :0]   app_cmd,          
  output  reg [`MIG_APP_ADDR_WIDTH-1:0]   app_addr,         
  input                                   app_rdy,          
  output  reg                             app_wdf_wren,     
  output  reg [`MIG_APP_DATA_WIDTH-1:0]   app_wdf_data,     
  output  reg [`MIG_APP_MASK_WIDTH-1:0]   app_wdf_mask,     
  output  reg                             app_wdf_end,      
  input                                   app_wdf_rdy,      
  input                                   app_rd_data_valid,
  input                                   app_rd_data_end,  
  input       [`MIG_APP_DATA_WIDTH-1:0]   app_rd_data  
);

localparam  UART  = 0;
localparam  CORE  = 1;

always @(*) begin
  case (mux_sel)
  UART: begin
    app_en        = uart_mig_en;
    app_cmd       = uart_mig_cmd;
    app_addr      = uart_mig_addr;
    app_wdf_wren  = uart_mig_wdf_wren;
    app_wdf_data  = uart_mig_wdf_data;
    app_wdf_mask  = uart_mig_wdf_mask;
    app_wdf_end   = uart_mig_wdf_end;
  end
  CORE: begin
    app_en        = core_app_en;
    app_cmd       = core_app_cmd;
    app_addr      = core_app_addr;
    app_wdf_wren  = core_app_wdf_wren;
    app_wdf_data  = core_app_wdf_data;
    app_wdf_mask  = core_app_wdf_mask;
    app_wdf_end   = core_app_wdf_end;
  end
  default: begin
  end
  endcase
end

assign uart_mig_rdy             = app_rdy;
assign uart_mig_wdf_rdy         = app_wdf_rdy;

assign core_app_rdy             = app_rdy;
assign core_app_wdf_rdy         = app_wdf_rdy;
assign core_app_rd_data_valid   = app_rd_data_valid;
assign core_app_rd_data_end     = app_rd_data_end;
assign core_app_rd_data         = app_rd_data;


endmodule