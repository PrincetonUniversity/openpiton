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

`include "define.tmp.h"
`include "mc_define.h"
`include "chipset_define.vh"

module uart_top (
    input                                   axi_clk,
    input                                   rst_n,
   
    output                                  uart_tx,
    input                                   uart_rx,
    output                  uart_interrupt,

    input                                   uart_lb_sw,

    input                                   uart_boot_en,
    input                                   uart_timeout_en,
    output                                  test_start,
    input                                   test_good_end,
    input                                   test_bad_end,
    output                                  uart_rst_out_n,
    input                                   init_calib_complete,

    input [`NOC_CHIPID_WIDTH-1:0]          chip_id,
    input [`NOC_X_WIDTH-1:0]                x_id,
    input [`NOC_Y_WIDTH-1:0]                y_id,
    // receive request/send response
    input                                   xbar_uart_noc2_valid,
    input [`NOC_DATA_WIDTH-1:0]             xbar_uart_noc2_data,     
    output                                  uart_xbar_noc2_ready,

    output                                  uart_xbar_noc3_valid,
    output [`NOC_DATA_WIDTH-1:0]            uart_xbar_noc3_data,  
    input                                   xbar_uart_noc3_ready,
    
    // send request/receive response
    output                                  uart_xbar_noc2_valid,
    output [`NOC_DATA_WIDTH-1:0]            uart_xbar_noc2_data,  
    input                                   xbar_uart_noc2_ready,

    input                                   xbar_uart_noc3_valid,
    input [`NOC_DATA_WIDTH-1:0]             xbar_uart_noc3_data,     
    output                                  uart_xbar_noc3_ready
);

wire  uart16550_tx;
wire  uart16550_rx;

`ifdef PITONSYS_UART_BOOT
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
`endif

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

wire              init_done;
wire              atg_init_done;
wire              writer_start;
wire              writer_finish;
wire  [2:0]       writer_str_sel;
wire              reader_start;
wire              reader_stop;


wire [12:0]                        core_axi_awaddr;
wire                               core_axi_awvalid;
wire                               core_axi_awready;
wire [31:0]                        core_axi_wdata;
wire [3:0]                         core_axi_wstrb;
wire                               core_axi_wvalid;
wire                               core_axi_wready;
wire [1:0]                         core_axi_bresp;
wire                               core_axi_bvalid;
wire                               core_axi_bready;
wire [12:0]                        core_axi_araddr;
wire                               core_axi_arvalid;
wire                               core_axi_arready;
wire [31:0]                        core_axi_rdata;
wire [1:0]                         core_axi_rresp;
wire                               core_axi_rvalid;
wire                               core_axi_rready;


// put don't touch back on these
(* DONT_TOUCH = "yes" *)wire    [`NOC_DATA_WIDTH-1:0]  core_axi_awaddr_unmasked;
(* DONT_TOUCH = "yes" *)wire    [`NOC_DATA_WIDTH-1:0]  core_axi_araddr_unmasked;

assign core_axi_awaddr = (core_axi_awaddr_unmasked[12:0] << 2)  | 13'h1000;
assign core_axi_araddr = (core_axi_araddr_unmasked[12:0] << 2)  | 13'h1000;

assign uart_xbar_noc3_ready = 1'b1;

noc_axilite_bridge #(
    .SLAVE_RESP_BYTEWIDTH   (1)
) noc_axilite_bridge (
    .clk                    (axi_clk                ),
    .rst                    (~rst_n             ),  // TODO: rewrite to positive ?
           
    .splitter_bridge_val    (xbar_uart_noc2_valid   ),
    .splitter_bridge_data   (xbar_uart_noc2_data  ),
    .bridge_splitter_rdy    (uart_xbar_noc2_ready   ),

    .bridge_splitter_val    (uart_xbar_noc3_valid   ),
    .bridge_splitter_data   (uart_xbar_noc3_data  ),
    .splitter_bridge_rdy    (xbar_uart_noc3_ready   ),
       
    //axi lite signals             
    //write address channel
    .m_axi_awaddr        (core_axi_awaddr_unmasked),
    .m_axi_awvalid       (core_axi_awvalid),
    .m_axi_awready       (core_axi_awready),

    //write data channel
    .m_axi_wdata         (core_axi_wdata),
    .m_axi_wstrb         (core_axi_wstrb),
    .m_axi_wvalid        (core_axi_wvalid),
    .m_axi_wready        (core_axi_wready),

    //read address channel
    .m_axi_araddr        (core_axi_araddr_unmasked),
    .m_axi_arvalid       (core_axi_arvalid),
    .m_axi_arready       (core_axi_arready),

    //read data channel
    .m_axi_rdata         (core_axi_rdata),
    .m_axi_rresp         (core_axi_rresp),
    .m_axi_rvalid        (core_axi_rvalid),
    .m_axi_rready        (core_axi_rready),

    //write response channel
    .m_axi_bresp         (core_axi_bresp),
    .m_axi_bvalid        (core_axi_bvalid),
    .m_axi_bready        (core_axi_bready)
    
);
// control of loopback
assign uart_tx        = uart_lb_sw ? uart_rx  : uart16550_tx;
assign uart16550_rx   = uart_rx; 

`ifdef PITON_BOARD
  assign init_done = 1'b1;
`else   // PITON_BOARD
  `ifndef PITON_FPGA_MC_SIM
    `ifdef PITONSYS_UART_BOOT
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
        
        .done                     (atg_init_done    ),  // output wire done
        .status                   ()   // output wire [31 : 0] status
      );
      assign init_done = atg_init_done & init_calib_complete;
    `else   // PITONSYS_UART_BOOT
      assign init_done = 1'b1;
    `endif  // PITONSYS_UART_BOOT
  `endif  // PITON_FPGA_MC_SIM
`endif  // PITON_BOARD

`ifndef PITON_FPGA_MC_SIM
  `ifdef PITONSYS_UART_BOOT
    uart_writer     uart_writer (
      .axi_clk              (axi_clk              ),
      .axi_rst_n            (rst_n                ),

      .start                (writer_start         ),
      .finish               (writer_finish        ),
      .str_sel              (writer_str_sel       ),

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
  `else   // PITONSYS_UART_BOOT
    assign writer_finish      = 1'b1;
  `endif  // PITONSYS_UART_BOOT
`endif

`ifdef PITONSYS_UART_BOOT
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

    .chip_id              (chip_id),
    .x_id                 (x_id),
    .y_id                 (y_id),

    .noc_valid            (uart_xbar_noc2_valid ),
    .noc_data             (uart_xbar_noc2_data  ),
    .noc_ready            (xbar_uart_noc2_ready )
  );
`else   // PITONSYS_UART_BOOT
  assign reader_stop = 1'b1;
`endif  // PITONSYS_UART_BOOT

`ifdef PITONSYS_UART_RESET
  uart_reseter uart_reseter(
    .axi_clk(axi_clk),
    .axi_rst_n(rst_n),

    .axi_rdata(s_axi_rdata),
    .axi_rvalid(s_axi_rvalid),
    .axi_rready(s_axi_rready),
    .axi_araddr    (s_axi_araddr),
    .axi_arvalid   (s_axi_arvalid),
    .axi_arready   (s_axi_arready),
    
    .uart_rst_out_n(uart_rst_out_n)
  );
`else 
  assign uart_rst_out_n = 1'b1;
`endif

uart_mux   uart_mux (
  .axi_clk              (axi_clk            ),
  .axi_rst_n            (rst_n              ),

  .uart_boot_en         (uart_boot_en       ),
  .uart_timeout_en      (uart_timeout_en    ),
  .init_done            (init_done          ),
  .writer_start         (writer_start       ),
  .writer_finish        (writer_finish      ),
  .writer_str_sel       (writer_str_sel     ),
  .reader_start         (reader_start       ),
  .reader_stop          (reader_stop        ),
  .test_start           (test_start         ),

  .test_good_end        (test_good_end      ),
  .test_bad_end         (test_bad_end       ),

`ifdef PITONSYS_UART_BOOT
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
`endif // PITONSYS_UART_BOOT

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


`ifdef PITON_BOARD
  reg             uart_byte_bvalid;
  wire    [7:0]   uart_r_data;
  wire            uart_w_ready;


  // Write ACK
  always @(posedge axi_clk) begin
    if (~rst_n)
      uart_byte_bvalid <= 1'b0;
    else
      uart_byte_bvalid <= s_axi_wvalid                      ? 1'b1  :
                          uart_byte_bvalid &  s_axi_bready  ? 1'b0  : uart_byte_bvalid;
  end

  assign s_axi_bvalid = uart_byte_bvalid;

  assign s_axi_rdata = {4{uart_r_data}};

  assign s_axi_wready   = uart_w_ready;
  assign s_axi_awready  = uart_w_ready;
  assign s_axi_arready  = 1'b1;   // TODO: check!


  UART    # (
      .ClockFreq      (100000000          ),
      .Baud           (115200             ),
      .Width          (8                  ),
      .Parity         (0                  ),
      .StopBits       (1                  )
  ) UART    (
      .Clock          (axi_clk            ),
      .Reset          (~rst_n             ),

      .DataIn         (s_axi_wdata[7:0]   ), 
      .DataInValid    (s_axi_wvalid       ), 
      .DataInReady    (uart_w_ready       ),

      .DataOut        (uart_r_data        ), 
      .DataOutValid   (s_axi_rvalid       ), 
      .DataOutReady   (s_axi_rready       ), 
      .SIn            (uart16550_rx       ), 
      .SOut           (uart16550_tx       )
  );
`else   // PITON_BOARD
  `ifdef PITON_UART16550
    `ifdef PITON_FPGA_MC_SIM
      assign s_axi_awready = 1'b1;
      assign s_axi_wready = 1'b1;
      assign s_axi_arready = 1'b1;
    `else
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
    `endif  // PITON_FPGA_MC_SIM
  `endif  // PITON_UART16550
`endif  // PITON_BOARD

endmodule
