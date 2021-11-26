`include "define.tmp.h"
`include "piton_system.vh"
`include "jtag.vh"
`include "mc_define.h"
`include "noc_axi4_bridge_define.vh"

module STM (

	// wire clocks
	input   
                                       core_ref_clk,
	// Resets
	// reset is assumed to be asynchronous
	input                                       rst_n,

	// Debug
   input                                       ndmreset_i,    // non-debug module reset
   input   [`NUM_TILES-1:0]                    debug_req_i,   // async debug request
   output  [`NUM_TILES-1:0]                    unavailable_o, // communicate whether the hart is unavailable (e.g.: power down)
   
   // CLINT
   input   [`NUM_TILES-1:0]                    timer_irq_i,   // Timer interrupts
   input   [`NUM_TILES-1:0]                    ipi_i,         // software interrupt (a.k.a inter-process-interrupt)
   
   // PLIC
   input   [`NUM_TILES*2-1:0]                  irq_i,          // level sensitive IR lines, mip & sip (async)
   
   // AXI interface
   // Address Write Channel
   output wire [`AXI4_ID_WIDTH     -1:0]    m_axi_awid,
   output wire [`AXI4_ADDR_WIDTH   -1:0]    m_axi_awaddr,
   output wire [`AXI4_LEN_WIDTH    -1:0]    m_axi_awlen,
   output wire [`AXI4_SIZE_WIDTH   -1:0]    m_axi_awsize,
   output wire [`AXI4_BURST_WIDTH  -1:0]    m_axi_awburst,
   output wire                              m_axi_awlock,
   output wire [`AXI4_CACHE_WIDTH  -1:0]    m_axi_awcache,
   output wire [`AXI4_PROT_WIDTH   -1:0]    m_axi_awprot,
   output wire [`AXI4_QOS_WIDTH    -1:0]    m_axi_awqos,
   output wire [`AXI4_REGION_WIDTH -1:0]    m_axi_awregion,
   output wire [`AXI4_USER_WIDTH   -1:0]    m_axi_awuser,
   output wire                              m_axi_awvalid,
   input  wire                              m_axi_awready,

   // Write Data Channel
   output wire  [`AXI4_ID_WIDTH     -1:0]    m_axi_wid,
   output wire  [`AXI4_DATA_WIDTH   -1:0]    m_axi_wdata,
   output wire  [`AXI4_STRB_WIDTH   -1:0]    m_axi_wstrb,
   output wire                               m_axi_wlast,
   output wire  [`AXI4_USER_WIDTH   -1:0]    m_axi_wuser,
   output wire                               m_axi_wvalid,
   input  wire                               m_axi_wready,

   // Address Read Channel
   output wire  [`AXI4_ID_WIDTH     -1:0]    m_axi_arid,
   output wire  [`AXI4_ADDR_WIDTH   -1:0]    m_axi_araddr,
   output wire  [`AXI4_LEN_WIDTH    -1:0]    m_axi_arlen,
   output wire  [`AXI4_SIZE_WIDTH   -1:0]    m_axi_arsize,
   output wire  [`AXI4_BURST_WIDTH  -1:0]    m_axi_arburst,
   output wire                               m_axi_arlock,
   output wire  [`AXI4_CACHE_WIDTH  -1:0]    m_axi_arcache,
   output wire  [`AXI4_PROT_WIDTH   -1:0]    m_axi_arprot,
   output wire  [`AXI4_QOS_WIDTH    -1:0]    m_axi_arqos,
   output wire  [`AXI4_REGION_WIDTH -1:0]    m_axi_arregion,
   output wire  [`AXI4_USER_WIDTH   -1:0]    m_axi_aruser,
   output wire                               m_axi_arvalid,
   input  wire                               m_axi_arready,

   // Read Data Channel
   input  wire  [`AXI4_ID_WIDTH     -1:0]    m_axi_rid,
   input  wire  [`AXI4_DATA_WIDTH   -1:0]    m_axi_rdata,
   input  wire  [`AXI4_RESP_WIDTH   -1:0]    m_axi_rresp,
   input  wire                               m_axi_rlast,
   input  wire  [`AXI4_USER_WIDTH   -1:0]    m_axi_ruser,
   input  wire                               m_axi_rvalid,
   output wire                               m_axi_rready,

   // Ack Channel
   input  wire  [`AXI4_ID_WIDTH     -1:0]    m_axi_bid,
   input  wire  [`AXI4_RESP_WIDTH   -1:0]    m_axi_bresp,
   input  wire  [`AXI4_USER_WIDTH   -1:0]    m_axi_buser,
   input  wire                               m_axi_bvalid,
   output wire                               m_axi_bready
);


wire                                       processor_offchip_noc2_valid;
wire [`NOC_DATA_WIDTH-1:0]                 processor_offchip_noc2_data;
wire                                       processor_offchip_noc2_yummy;

wire                                       offchip_processor_noc3_valid;
wire  [`NOC_DATA_WIDTH-1:0]                offchip_processor_noc3_data;
wire                                       offchip_processor_noc3_yummy;

wire                                       valrdy_processor_offchip_noc2_valid;
wire [`NOC_DATA_WIDTH-1:0]                 valrdy_processor_offchip_noc2_data;
wire                                       valrdy_processor_offchip_noc2_ready;

wire                                       valrdy_offchip_processor_noc3_valid;
wire  [`NOC_DATA_WIDTH-1:0]                valrdy_offchip_processor_noc3_data;
wire                                       valrdy_offchip_processor_noc3_ready;
credit_to_valrdy noc2_credit_to_valrdy (
   .clk(core_ref_clk),
   .reset(rst_n),
   //credit based interface
   .data_in(processor_offchip_noc2_data),
   .valid_in(processor_offchip_noc2_valid),
   .yummy_in(processor_offchip_noc2_yummy),

   //val/rdy interface
   .data_out(valrdy_processor_offchip_noc2_data),
   .valid_out(valrdy_processor_offchip_noc2_valid),
   .ready_out(valrdy_processor_offchip_noc2_ready)
);

credit_to_valrdy noc3_credit_to_valrdy (
   .clk(core_ref_clk),
   .reset(rst_n),
   //credit based interface
   .data_in(offchip_processor_noc3_data),
   .valid_in(offchip_processor_noc3_valid),
   .yummy_in(offchip_processor_noc3_yummy),

   //val/rdy interface
   .data_out(valrdy_offchip_processor_noc3_data),
   .valid_out(valrdy_offchip_processor_noc3_valid),
   .ready_out(valrdy_offchip_processor_noc3_ready)
);

chip alex_chip(
   // wire clocks
   .core_ref_clk(core_ref_clk),

   // Resets
   // reset is assumed to be asynchronous
   .rst_n(rst_n),

   .processor_offchip_noc2_valid(processor_offchip_noc2_valid),
   .processor_offchip_noc2_data(processor_offchip_noc2_data),
   .processor_offchip_noc2_yummy(processor_offchip_noc2_yummy),

   .offchip_processor_noc3_valid(offchip_processor_noc3_valid),
   .offchip_processor_noc3_data(offchip_processor_noc3_data),
   .offchip_processor_noc3_yummy(offchip_processor_noc3_yummy),

    // Debug
    .ndmreset_i(ndmreset_i),    // non-debug module reset
    .debug_req_i(debug_req_i),   // async debug request
    .unavailable_o(unavailable_o), // communicate whether the hart is unavailable (e.g.: power down)
    // CLINT
    .timer_irq_i(timer_irq_i),   // Timer interrupts
    .ipi_i(ipi_i),         // software interrupt (a.k.a inter-process-interrupt)
    // PLIC
    .irq_i(irq_i)          // level sensitive IR lines, mip & sip (async)

);

noc_axi4_bridge alex_to_alsaqr(
	// Clock + Reset
    .clk(core_ref_clk),
    .rst_n(rst_n),
    .uart_boot_en(),
    .phy_init_done(),

    // Noc interface
    .src_bridge_vr_noc2_val(valrdy_processor_offchip_noc2_valid),
    .src_bridge_vr_noc2_dat(valrdy_processor_offchip_noc2_data),
    .src_bridge_vr_noc2_rdy(valrdy_processor_offchip_noc2_ready),
    .bridge_dst_vr_noc3_val(valrdy_offchip_processor_noc3_valid),
    .bridge_dst_vr_noc3_dat(valrdy_offchip_processor_noc3_data),
    .bridge_dst_vr_noc3_rdy(valrdy_offchip_processor_noc3_yummy),

    // AXI interface
    .m_axi_awid(m_axi_awid),
    .m_axi_awaddr(m_axi_awaddr),
    .m_axi_awlen(m_axi_awlen),
    .m_axi_awsize(m_axi_awsize),
    .m_axi_awburst(m_axi_awburst),
    .m_axi_awlock(m_axi_awlock),
    .m_axi_awcache(m_axi_awcache),
    .m_axi_awprot(m_axi_awprot),
    .m_axi_awqos(m_axi_awqos),
    .m_axi_awregion(m_axi_awregion),
    .m_axi_awuser(m_axi_awuser),
    .m_axi_awvalid(m_axi_awvalid),
    .m_axi_awready(m_axi_awready),

    .m_axi_wid(m_axi_wid),
    .m_axi_wdata(m_axi_wdata),
    .m_axi_wstrb(m_axi_wstrb),
    .m_axi_wlast(m_axi_wlast),
    .m_axi_wuser(m_axi_wuser),
    .m_axi_wvalid(m_axi_wvalid),
    .m_axi_wready(m_axi_wready),

    .m_axi_arid(m_axi_arid),
    .m_axi_araddr(m_axi_araddr),
    .m_axi_arlen(m_axi_arlen),
    .m_axi_arsize(m_axi_arsize),
    .m_axi_arburst(m_axi_arburst),
    .m_axi_arlock(m_axi_arlock),
    .m_axi_arcache(m_axi_arcache),
    .m_axi_arprot(m_axi_arprot),
    .m_axi_arqos(m_axi_arqos),
    .m_axi_arregion(m_axi_arregion),
    .m_axi_aruser(m_axi_aruser),
    .m_axi_arvalid(m_axi_arvalid),
    .m_axi_arready(m_axi_arready),

    .m_axi_rid(m_axi_rid),
    .m_axi_rdata(m_axi_rdata),
   	.m_axi_rresp(m_axi_rresp),
   	.m_axi_rlast(m_axi_rlast),
   	.m_axi_ruser(m_axi_ruser),
   	.m_axi_rvalid(m_axi_rvalid),
   	.m_axi_rready(m_axi_rready),

   	.m_axi_bid(m_axi_bid),
   	.m_axi_bresp(m_axi_bresp),
   	.m_axi_buser(m_axi_buser),
   	.m_axi_bvalid(m_axi_bvalid),
   	.m_axi_bready(m_axi_bready)

);

endmodule
