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

module uart_top (
    input                                   axi_clk,    // system clock - 29 MHz
    input                                   rst_n,

    input                                   mig_ui_clk,
    
    output                                  uart_tx,
    input                                   uart_rx,
    output				    uart_interrupt,

    input                                   uart_lb_sw,

    output                                  test_start,

     input     [12:0]                        core_axi_awaddr,
     input                                   core_axi_awvalid,
     output                                  core_axi_awready,
     input     [31:0]                        core_axi_wdata,
     input     [3:0]                         core_axi_wstrb,
     input                                   core_axi_wvalid,
     output                                  core_axi_wready,
    output    [1:0]                         core_axi_bresp,
    output                                  core_axi_bvalid,
    input                                   core_axi_bready,
    input     [12:0]                        core_axi_araddr,
    input                                   core_axi_arvalid,
    output                                  core_axi_arready,
     output    [31:0]                        core_axi_rdata,
     output    [1:0]                         core_axi_rresp,
     output                                  core_axi_rvalid,
     input                                   core_axi_rready,
    
    output                                  uart_mig_en,           
    output    [`MIG_APP_CMD_WIDTH-1 :0]     uart_mig_cmd,          
    output    [`MIG_APP_ADDR_WIDTH-1:0]     uart_mig_addr,         
    input                                   uart_mig_rdy,          
    output                                  uart_mig_wdf_wren,     
    output    [`MIG_APP_DATA_WIDTH-1:0]     uart_mig_wdf_data,     
    output    [`MIG_APP_MASK_WIDTH-1:0]     uart_mig_wdf_mask,     
    output                                  uart_mig_wdf_end,      
    input                                   uart_mig_wdf_rdy
);

wire  uart16550_tx;
wire  uart16550_rx;

// init ATG <-> UART mux
wire  [12:0]      init_axi_awaddr;
wire              init_axi_awvalid;
wire              init_axi_awready;
wire  [31:0]      init_axi_wdata;
wire  [3:0 ]      init_axi_wstrb;
wire              init_axi_wvalid;
wire              init_axi_wready;
wire  [1:0]       init_axi_bresp;
wire              init_axi_bvalid;
wire              init_axi_bready;

// UART writer <-> UART
wire  [12:0]      writer_axi_awaddr;
wire              writer_axi_awvalid;
wire              writer_axi_awready;
wire  [31:0]      writer_axi_wdata;
wire  [3:0]       writer_axi_wstrb;
wire              writer_axi_wvalid;
wire              writer_axi_wready;
wire  [1:0]       writer_axi_bresp;
wire              writer_axi_bvalid;
wire              writer_axi_bready;
wire  [31:0]      writer_axi_araddr;
wire              writer_axi_arvalid;
wire              writer_axi_arready;
wire  [31:0]      writer_axi_rdata;
wire  [1:0]       writer_axi_rresp;
wire              writer_axi_rvalid;
wire              writer_axi_rready;

wire  [31:0]      reader_axi_araddr;
wire              reader_axi_arvalid;
wire              reader_axi_arready;
wire  [31:0]      reader_axi_rdata;
wire  [1:0]       reader_axi_rresp;
wire              reader_axi_rvalid;
wire              reader_axi_rready;

// UART mux <-> UART
wire  [12:0]      s_axi_awaddr;
wire              s_axi_awvalid;
wire              s_axi_awready;
wire  [31:0]      s_axi_wdata;
wire  [3:0 ]      s_axi_wstrb;
wire              s_axi_wvalid;
wire              s_axi_wready;
wire  [1:0]       s_axi_bresp;
wire              s_axi_bvalid;
wire              s_axi_bready;
wire  [12:0]      s_axi_araddr;
wire              s_axi_arvalid;
wire              s_axi_arready;
wire  [31:0]      s_axi_rdata;
wire  [1:0]       s_axi_rresp;
wire              s_axi_rvalid;
wire              s_axi_rready;

// UART reader <-> MIG 7
wire                              reader_mig_val;
wire  [`MIG_APP_ADDR_WIDTH-1:0]   reader_afifo_addr;
wire  [`MIG_APP_DATA_WIDTH-1:0]   reader_afifo_data;
wire  [`MIG_APP_MASK_WIDTH-1:0]   reader_afifo_mask;

wire                          afifo_r_val;
wire                          afifo_empty;
wire                          afifo_valid;
wire  [`MIG_APP_ADDR_WIDTH+`MIG_APP_DATA_WIDTH+`MIG_APP_MASK_WIDTH-1:0] mig_afifo_din;
wire  [`MIG_APP_ADDR_WIDTH+`MIG_APP_DATA_WIDTH+`MIG_APP_MASK_WIDTH-1:0] mig_afifo_dout;
// wire  [AFIFO_DATA_WIDTH-1:0]  mig_afifo_din;
// wire  [AFIFO_DATA_WIDTH-1:0]  mig_afifo_dout;

wire              init_done;
wire              writer_start;
wire              writer_finish;
wire              reader_start;
wire              reader_stop;
wire              test_finish;

assign  test_finish = 1'b0; // TODO: change for running the next test

// control of loopback
assign uart_tx        = uart_lb_sw ? uart_rx  : uart16550_tx;
assign uart16550_rx   = uart_rx; 


atg_uart_init  atg_uart_init (
  .s_axi_aclk               (axi_clk          ),  // input wire s_axi_aclk
  .s_axi_aresetn            (rst_n            ),  // input wire s_axi_aresetn

  .m_axi_lite_ch1_awaddr    (init_axi_awaddr  ),  // output wire [31 : 0] m_axi_lite_ch1_awaddr
  .m_axi_lite_ch1_awprot    (  ),  // output wire [2 : 0] m_axi_lite_ch1_awprot
  .m_axi_lite_ch1_awvalid   (init_axi_awvalid ),  // output wire m_axi_lite_ch1_awvalid
  .m_axi_lite_ch1_awready   (init_axi_awready ),  // input wire m_axi_lite_ch1_awready
  
  .m_axi_lite_ch1_wdata     (init_axi_wdata   ),  // output wire [31 : 0] m_axi_lite_ch1_wdata
  .m_axi_lite_ch1_wstrb     (init_axi_wstrb   ),  // output wire [3 : 0] m_axi_lite_ch1_wstrb
  .m_axi_lite_ch1_wvalid    (init_axi_wvalid  ),  // output wire m_axi_lite_ch1_wvalid
  .m_axi_lite_ch1_wready    (init_axi_wready  ),  // input wire m_axi_lite_ch1_wready
  
  .m_axi_lite_ch1_bresp     (init_axi_bresp   ),  // input wire [1 : 0] m_axi_lite_ch1_bresp
  .m_axi_lite_ch1_bvalid    (init_axi_bvalid  ),  // input wire m_axi_lite_ch1_bvalid
  .m_axi_lite_ch1_bready    (init_axi_bready  ),  // output wire m_axi_lite_ch1_bready
  
  .done                     (init_done        ),  // output wire done
  .status                   ()   // output wire [31 : 0] status
);

uart_writer     uart_writer (
  .axi_clk              (axi_clk              ),
  .axi_rst_n            (rst_n                ),

  .start                (writer_start         ),
  .finish               (writer_finish        ),

  .m_axi_awaddr         (writer_axi_awaddr    ),
  .m_axi_awvalid        (writer_axi_awvalid   ),
  .m_axi_awready        (writer_axi_awready   ),
  .m_axi_wdata          (writer_axi_wdata     ),
  .m_axi_wstrb          (writer_axi_wstrb     ),
  .m_axi_wvalid         (writer_axi_wvalid    ),
  .m_axi_wready         (writer_axi_wready    ),
  .m_axi_bresp          (writer_axi_bresp     ),
  .m_axi_bvalid         (writer_axi_bvalid    ),
  .m_axi_bready         (writer_axi_bready    ),
  .m_axi_araddr         (writer_axi_araddr    ),
  .m_axi_arvalid        (writer_axi_arvalid   ),
  .m_axi_arready        (writer_axi_arready   ),
  .m_axi_rdata          (writer_axi_rdata     ),
  .m_axi_rresp          (writer_axi_rresp     ),
  .m_axi_rvalid         (writer_axi_rvalid    ),
  .m_axi_rready         (writer_axi_rready    )
);

uart_reader   uart_reader (
  .axi_clk              (axi_clk              ),
  .axi_rst_n            (rst_n                ),

  .start                (reader_start         ),
  .stop                 (reader_stop          ),

  .m_axi_araddr         (reader_axi_araddr    ),
  .m_axi_arvalid        (reader_axi_arvalid   ),
  .m_axi_arready        (reader_axi_arready   ),
  .m_axi_rdata          (reader_axi_rdata     ),
  .m_axi_rresp          (reader_axi_rresp     ),
  .m_axi_rvalid         (reader_axi_rvalid    ),
  .m_axi_rready         (reader_axi_rready    ),

  .mig_val              (reader_mig_val       ),
  .mig_addr             (reader_afifo_addr    ),              
  .mig_data             (reader_afifo_data    ),           
  .mig_mask             (reader_afifo_mask    )
);

uart_mux   uart_mux (
  .axi_clk              (axi_clk            ),
  .axi_rst_n            (rst_n              ),

  .init_done            (init_done          ),
  .writer_start         (writer_start       ),
  .writer_finish        (writer_finish      ),
  .reader_start         (reader_start       ),
  .reader_stop          (reader_stop        ),
  .test_start           (test_start         ),
  .test_finish          (test_finish        ),

  .init_axi_awaddr      (init_axi_awaddr    ), 
  .init_axi_awvalid     (init_axi_awvalid   ),
  .init_axi_awready     (init_axi_awready   ),
  .init_axi_wdata       (init_axi_wdata     ),  
  .init_axi_wstrb       (init_axi_wstrb     ),  
  .init_axi_wvalid      (init_axi_wvalid    ), 
  .init_axi_wready      (init_axi_wready    ), 
  .init_axi_bresp       (init_axi_bresp     ),  
  .init_axi_bvalid      (init_axi_bvalid    ), 
  .init_axi_bready      (init_axi_bready    ),

  .writer_axi_awaddr    (writer_axi_awaddr  ),
  .writer_axi_awvalid   (writer_axi_awvalid ),
  .writer_axi_awready   (writer_axi_awready ),
  .writer_axi_wdata     (writer_axi_wdata   ),
  .writer_axi_wstrb     (writer_axi_wstrb   ),
  .writer_axi_wvalid    (writer_axi_wvalid  ),
  .writer_axi_wready    (writer_axi_wready  ),
  .writer_axi_bresp     (writer_axi_bresp   ),
  .writer_axi_bvalid    (writer_axi_bvalid  ),
  .writer_axi_bready    (writer_axi_bready  ),
  .writer_axi_araddr    (writer_axi_araddr  ),
  .writer_axi_arvalid   (writer_axi_arvalid ),
  .writer_axi_arready   (writer_axi_arready ),
  .writer_axi_rdata     (writer_axi_rdata   ),
  .writer_axi_rresp     (writer_axi_rresp   ),
  .writer_axi_rvalid    (writer_axi_rvalid  ),
  .writer_axi_rready    (writer_axi_rready  ),

  .reader_axi_araddr    (reader_axi_araddr  ),
  .reader_axi_arvalid   (reader_axi_arvalid ),
  .reader_axi_arready   (reader_axi_arready ),
  .reader_axi_rdata     (reader_axi_rdata   ),
  .reader_axi_rresp     (reader_axi_rresp   ),
  .reader_axi_rvalid    (reader_axi_rvalid  ),
  .reader_axi_rready    (reader_axi_rready  ),

  .core_axi_awaddr      (core_axi_awaddr    ),
  .core_axi_awvalid     (core_axi_awvalid   ),
  .core_axi_awready     (core_axi_awready   ),
  .core_axi_wdata       (core_axi_wdata     ),
  .core_axi_wstrb       (core_axi_wstrb     ),
  .core_axi_wvalid      (core_axi_wvalid    ),
  .core_axi_wready      (core_axi_wready    ),
  .core_axi_bresp       (core_axi_bresp     ),
  .core_axi_bvalid      (core_axi_bvalid    ),
  .core_axi_bready      (core_axi_bready    ),
  .core_axi_araddr      (core_axi_araddr    ),
  .core_axi_arvalid     (core_axi_arvalid   ),
  .core_axi_arready     (core_axi_arready   ),
  .core_axi_rdata       (core_axi_rdata     ),
  .core_axi_rresp       (core_axi_rresp     ),
  .core_axi_rvalid      (core_axi_rvalid    ),
  .core_axi_rready      (core_axi_rready    ),

  .s_axi_awaddr         (s_axi_awaddr       ),
  .s_axi_awvalid        (s_axi_awvalid      ),
  .s_axi_awready        (s_axi_awready      ),
  .s_axi_wdata          (s_axi_wdata        ),
  .s_axi_wstrb          (s_axi_wstrb        ),
  .s_axi_wvalid         (s_axi_wvalid       ),
  .s_axi_wready         (s_axi_wready       ),
  .s_axi_bresp          (s_axi_bresp        ),
  .s_axi_bvalid         (s_axi_bvalid       ),
  .s_axi_bready         (s_axi_bready       ),
  .s_axi_araddr         (s_axi_araddr       ),
  .s_axi_arvalid        (s_axi_arvalid      ),
  .s_axi_arready        (s_axi_arready      ),
  .s_axi_rdata          (s_axi_rdata        ),
  .s_axi_rresp          (s_axi_rresp        ),
  .s_axi_rvalid         (s_axi_rvalid       ),
  .s_axi_rready         (s_axi_rready       ) 
);




uart_16550   uart_16550 (
  .s_axi_aclk       (axi_clk          ),  // input wire s_axi_aclk
  .s_axi_aresetn    (rst_n            ),  // input wire s_axi_aresetn
  .ip2intc_irpt     (uart_interrupt   ),  // output wire ip2intc_irpt
  .freeze           (1'b0             ),  // input wire freeze

  // write address channel
  .s_axi_awaddr     (s_axi_awaddr     ),  // input wire [12 : 0] s_axi_awaddr
  .s_axi_awvalid    (s_axi_awvalid    ),  // input wire s_axi_awvalid
  .s_axi_awready    (s_axi_awready    ),  // output wire s_axi_awready
  
  // write data channel
  .s_axi_wdata      (s_axi_wdata      ),  // input wire [31 : 0] s_axi_wdata
  .s_axi_wstrb      (s_axi_wstrb      ),  // input wire [3 : 0] s_axi_wstrb
  .s_axi_wvalid     (s_axi_wvalid     ),  // input wire s_axi_wvalid
  .s_axi_wready     (s_axi_wready     ),  // output wire s_axi_wready
  
  // write responce channel
  .s_axi_bresp      (s_axi_bresp      ),  // output wire [1 : 0] s_axi_bresp
  .s_axi_bvalid     (s_axi_bvalid     ),  // output wire s_axi_bvalid
  .s_axi_bready     (s_axi_bready     ),  // input wire s_axi_bready
  
  // read adress channel
  .s_axi_araddr     (s_axi_araddr     ),  // input wire [12 : 0] s_axi_araddr
  .s_axi_arvalid    (s_axi_arvalid    ),  // input wire s_axi_arvalid
  .s_axi_arready    (s_axi_arready    ),  // output wire s_axi_arready
  
  // read data channel
  .s_axi_rdata      (s_axi_rdata      ),  // output wire [31 : 0] s_axi_rdata
  .s_axi_rresp      (s_axi_rresp      ),  // output wire [1 : 0] s_axi_rresp
  .s_axi_rvalid     (s_axi_rvalid     ),  // output wire s_axi_rvalid
  .s_axi_rready     (s_axi_rready     ),  // input wire s_axi_rready

  .baudoutn         (),   
  .ctsn             (1'b0),  
  .dcdn             (1'b0),  
  .ddis             (),   
  .dsrn             (1'b0),  
  .dtrn             (),   
  .out1n            (),   
  .out2n            (),   
  .rin              (1'b0),  
  .rtsn             (),   
  .rxrdyn           (),   
  .sin              (uart16550_rx),  
  .sout             (uart16550_tx),  
  .txrdyn           ()    
);

assign mig_afifo_din  = {reader_afifo_addr, reader_afifo_data, reader_afifo_mask};
assign afifo_r_val    = ~afifo_empty & uart_mig_rdy & uart_mig_wdf_rdy;
assign uart_mig_en    = afifo_r_val;
assign uart_mig_cmd   = `MIG_WR_CMD;
assign uart_mig_wdf_wren   = afifo_r_val;
assign uart_mig_wdf_end    = 1'b1;
assign {uart_mig_addr, uart_mig_wdf_data, uart_mig_wdf_mask} = mig_afifo_dout;

uart_mig_afifo  uart_mig_afifo (
  .rst      (~rst_n           ),
  .wr_clk   (axi_clk          ),
  .rd_clk   (mig_ui_clk       ),
  .din      (mig_afifo_din    ),
  .wr_en    (reader_mig_val   ),
  .rd_en    (afifo_r_val      ),
  .dout     (mig_afifo_dout   ),
  .full     (                 ),
  .empty    (afifo_empty      ),
  .valid    (afifo_valid      )
);

endmodule
