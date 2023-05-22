
`include "mc_define.h"

module u200_shell_top (

    input         pcie_refclk_clk_n    ,
    input         pcie_refclk_clk_p    ,
    input         pcie_perstn          ,		
    input  [15:0] pci_express_x16_rxn  ,
    input  [15:0] pci_express_x16_rxp  ,
    output [15:0] pci_express_x16_txn  ,
    output [15:0] pci_express_x16_txp  ,
    input         resetn               ,

    output [1:0] c0_ddr4_ba,
    output [1:0] c0_ddr4_bg,
    output [0:0] c0_ddr4_ck_c,
    output [0:0] c0_ddr4_ck_t,
    output [0:0] c0_ddr4_cke,
    output [0:0] c0_ddr4_cs_n,
    inout [71:0] c0_ddr4_dq,
    inout [17:0] c0_ddr4_dqs_c,
    inout [17:0] c0_ddr4_dqs_t,
    output [0:0] c0_ddr4_odt,
    output c0_ddr4_par,
    output c0_ddr4_reset_n,
    output c0_ddr4_ui_clk_sync_rst,
    // Reference clock
    input c0_sysclk_clk_n,
    input c0_sysclk_clk_p,
	// input mc_clk                  							,
	// input mc_rstn                 							,
    output  chip_rstn                                           ,
	input   chipset_clk             							,
	output chipset_rstn	          							,
    output c0_init_calib_complete,
	
	input   [`NOC_DATA_WIDTH-1:0]   mem_flit_in_data      ,
    input                           mem_flit_in_val       ,
    output                          mem_flit_in_rdy       ,

    output  [`NOC_DATA_WIDTH-1:0]   mem_flit_out_data     ,
    output                          mem_flit_out_val      ,
    input                           mem_flit_out_rdy      ,
								   							    
	
    output wire [`AXI4_ID_WIDTH     -1:0]    m_axi_awid  	,
    output wire [`AXI4_ADDR_WIDTH   -1:0]    m_axi_awaddr 	,
    output wire [`AXI4_LEN_WIDTH    -1:0]    m_axi_awlen  	,
    output wire [`AXI4_SIZE_WIDTH   -1:0]    m_axi_awsize 	,
    output wire [`AXI4_BURST_WIDTH  -1:0]    m_axi_awburst	,
    output wire                              m_axi_awlock 	,
    output wire [`AXI4_CACHE_WIDTH  -1:0]    m_axi_awcache	,
    output wire [`AXI4_PROT_WIDTH   -1:0]    m_axi_awprot 	,
    output wire [`AXI4_QOS_WIDTH    -1:0]    m_axi_awqos  	,
    output wire [`AXI4_REGION_WIDTH -1:0]    m_axi_awregion	,
    output wire [`AXI4_USER_WIDTH   -1:0]    m_axi_awuser	,
    output wire                              m_axi_awvalid	,
    input  wire                              m_axi_awready	,

    output wire  [`AXI4_ID_WIDTH     -1:0]    m_axi_wid		,
    output wire  [`AXI4_DATA_WIDTH   -1:0]    m_axi_wdata	,
    output wire  [`AXI4_STRB_WIDTH   -1:0]    m_axi_wstrb	,
    output wire                               m_axi_wlast	,
    output wire  [`AXI4_USER_WIDTH   -1:0]    m_axi_wuser	,
    output wire                               m_axi_wvalid	,
    input  wire                               m_axi_wready	,

    output wire  [`AXI4_ID_WIDTH     -1:0]    m_axi_arid	,
    output wire  [`AXI4_ADDR_WIDTH   -1:0]    m_axi_araddr	,
    output wire  [`AXI4_LEN_WIDTH    -1:0]    m_axi_arlen	,
    output wire  [`AXI4_SIZE_WIDTH   -1:0]    m_axi_arsize	,
    output wire  [`AXI4_BURST_WIDTH  -1:0]    m_axi_arburst	,
    output wire                               m_axi_arlock	,
    output wire  [`AXI4_CACHE_WIDTH  -1:0]    m_axi_arcache	,
    output wire  [`AXI4_PROT_WIDTH   -1:0]    m_axi_arprot	,
    output wire  [`AXI4_QOS_WIDTH    -1:0]    m_axi_arqos	,
    output wire  [`AXI4_REGION_WIDTH -1:0]    m_axi_arregion,
    output wire  [`AXI4_USER_WIDTH   -1:0]    m_axi_aruser	,
    output wire                               m_axi_arvalid	,
    input  wire                               m_axi_arready	,

    input  wire  [`AXI4_ID_WIDTH     -1:0]    m_axi_rid		,
    input  wire  [`AXI4_DATA_WIDTH   -1:0]    m_axi_rdata	,
    input  wire  [`AXI4_RESP_WIDTH   -1:0]    m_axi_rresp	,
    input  wire                               m_axi_rlast	,
    input  wire  [`AXI4_USER_WIDTH   -1:0]    m_axi_ruser	,
    input  wire                               m_axi_rvalid	,
    output wire                               m_axi_rready	,

    input  wire  [`AXI4_ID_WIDTH     -1:0]    m_axi_bid		,
    input  wire  [`AXI4_RESP_WIDTH   -1:0]    m_axi_bresp	,
    input  wire  [`AXI4_USER_WIDTH   -1:0]    m_axi_buser	,
    input  wire                               m_axi_bvalid	,
    output wire                               m_axi_bready
);


	wire                                trans_fifo_val;
	wire    [`NOC_DATA_WIDTH-1:0]       trans_fifo_data;
	wire                                trans_fifo_rdy;

	wire                                fifo_trans_val;
	wire    [`NOC_DATA_WIDTH-1:0]       fifo_trans_data;
	wire                                fifo_trans_rdy;


	noc_bidir_afifo  mig_afifo  (
		.clk_1           ( chipset_clk      ),
		.rst_1           ( ~chipset_rstn    ),

		.clk_2           ( mc_clk            ),
		.rst_2           ( ~mc_rstn          ),

		// CPU --> MIG
		.flit_in_val_1   ( mem_flit_in_val   ),
		.flit_in_data_1  ( mem_flit_in_data  ),
		.flit_in_rdy_1   ( mem_flit_in_rdy   ),

		.flit_out_val_2  ( fifo_trans_val    ),
		.flit_out_data_2 ( fifo_trans_data   ),
		.flit_out_rdy_2  ( fifo_trans_rdy    ),

		// MIG --> CPU
		.flit_in_val_2   ( trans_fifo_val    ),
		.flit_in_data_2  ( trans_fifo_data   ),
		.flit_in_rdy_2   ( trans_fifo_rdy    ),

		.flit_out_val_1  ( mem_flit_out_val   ),
		.flit_out_data_1 ( mem_flit_out_data  ),
		.flit_out_rdy_1  ( mem_flit_out_rdy   )
	);
		

	noc_axi4_bridge noc_axi4_bridge  (
		.clk                ( 	mc_clk  		),  
		.rst_n              ( 	mc_rstn 		), 
		.uart_boot_en       ( 	1'b0			),
		.phy_init_done      ( 	init_calib_complete	),

		.src_bridge_vr_noc2_val ( fifo_trans_val	),
		.src_bridge_vr_noc2_dat ( fifo_trans_data	),
		.src_bridge_vr_noc2_rdy ( fifo_trans_rdy	),

		.bridge_dst_vr_noc3_val ( trans_fifo_val	),
		.bridge_dst_vr_noc3_dat ( trans_fifo_data	),
		.bridge_dst_vr_noc3_rdy ( trans_fifo_rdy	),

		.m_axi_awid    			( m_axi_awid		),
		.m_axi_awaddr    		( m_axi_awaddr		),
		.m_axi_awlen    		( m_axi_awlen		),
		.m_axi_awsize    		( m_axi_awsize		),
		.m_axi_awburst    		( m_axi_awburst		),
		.m_axi_awlock    		( m_axi_awlock		),
		.m_axi_awcache    		( m_axi_awcache		),
		.m_axi_awprot    		( m_axi_awprot		),
		.m_axi_awqos    		( m_axi_awqos		),
		.m_axi_awregion    		( m_axi_awregion	),
		.m_axi_awuser    		( m_axi_awuser		),
		.m_axi_awvalid    		( m_axi_awvalid		),
		.m_axi_awready    		( m_axi_awready		),

		.m_axi_wid    			( m_axi_wid			),
		.m_axi_wdata    		( m_axi_wdata		),
		.m_axi_wstrb    		( m_axi_wstrb		),
		.m_axi_wlast    		( m_axi_wlast		),
		.m_axi_wuser    		( m_axi_wuser		),
		.m_axi_wvalid    		( m_axi_wvalid		),
		.m_axi_wready    		( m_axi_wready		),

		.m_axi_bid    			( m_axi_bid			),
		.m_axi_bresp    		( m_axi_bresp		),
		.m_axi_buser    		( m_axi_buser		),
		.m_axi_bvalid    		( m_axi_bvalid		),
		.m_axi_bready    		( m_axi_bready		),

		.m_axi_arid    			( m_axi_arid		),
		.m_axi_araddr    		( m_axi_araddr		),
		.m_axi_arlen    		( m_axi_arlen		),
		.m_axi_arsize    		( m_axi_arsize		),
		.m_axi_arburst    		( m_axi_arburst		),
		.m_axi_arlock    		( m_axi_arlock		),
		.m_axi_arcache    		( m_axi_arcache		),
		.m_axi_arprot    		( m_axi_arprot		),
		.m_axi_arqos    		( m_axi_arqos		),
		.m_axi_arregion    		( m_axi_arregion	),
		.m_axi_aruser    		( m_axi_aruser		),
		.m_axi_arvalid    		( m_axi_arvalid		),
		.m_axi_arready    		( m_axi_arready		),

		.m_axi_rid    			( m_axi_rid),
		.m_axi_rdata    		( m_axi_rdata		),
		.m_axi_rresp    		( m_axi_rresp		),
		.m_axi_rlast    		( m_axi_rlast		),
		.m_axi_ruser    		( m_axi_ruser		),
		.m_axi_rvalid    		( m_axi_rvalid		),
		.m_axi_rready    		( m_axi_rready		)		
		
		);

	meep_shell meep_shell_i (

		.c0_sysclk_clk_p           ( sys_clk_p                 ),
		.c0_sysclk_clk_n           ( sys_clk_n                 ),
		.c0_ddr4_ui_clk            ( mc_clk                    ),
		.c0_ddr4_ui_clk_sync_rst   ( mc_rstn                   ),
		.c0_init_calib_complete    ( init_calib_complete       ),

		// DDR4 physicall interface
		.c0_ddr4_act_n             ( ddr_act_n                 ), // cas_n, ras_n and we_n are multiplexed in ddr4
		.c0_ddr4_adr               ( ddr_addr                  ),
		.c0_ddr4_ba                ( ddr_ba                    ),
		.c0_ddr4_bg                ( ddr_bg                    ), // bank group address
		.c0_ddr4_ck_t              ( ddr_ck_p                  ),
		.c0_ddr4_ck_c              ( ddr_ck_n                  ),
		.c0_ddr4_cke               ( ddr_cke                   ),
		.c0_ddr4_cs_n              ( ddr_cs_n                  ),
		.c0_ddr4_dq                ( ddr_dq                    ), 
		.c0_ddr4_dqs_c             ( ddr_dqs_n                 ), 
		.c0_ddr4_dqs_t             ( ddr_dqs_p                 ), 
		.c0_ddr4_odt               ( ddr_odt                   ),
		.c0_ddr4_par               ( ddr_parity                ),                        // output wire c0_ddr4_parity
		.c0_ddr4_reset_n           ( ddr_reset_n               ),

		// DDR4 control interface, not used, grounded
		.c0_ddr4_s_axi_ctrl_awvalid(1'b0                  ),  // input wire c0_ddr4_s_axi_ctrl_awvalid
		.c0_ddr4_s_axi_ctrl_awready(                      ),  // output wire c0_ddr4_s_axi_ctrl_awready
		.c0_ddr4_s_axi_ctrl_awaddr (32'b0                 ),    // input wire [31 : 0] c0_ddr4_s_axi_ctrl_awaddr
		.c0_ddr4_s_axi_ctrl_wvalid (1'b0                  ),    // input wire c0_ddr4_s_axi_ctrl_wvalid
		.c0_ddr4_s_axi_ctrl_wready (                      ),    // output wire c0_ddr4_s_axi_ctrl_wready
		.c0_ddr4_s_axi_ctrl_wdata  (32'b0                 ),      // input wire [31 : 0] c0_ddr4_s_axi_ctrl_wdata
		.c0_ddr4_s_axi_ctrl_bvalid (                      ),    // output wire c0_ddr4_s_axi_ctrl_bvalid
		.c0_ddr4_s_axi_ctrl_bready (1'b0                  ),    // input wire c0_ddr4_s_axi_ctrl_bready
		.c0_ddr4_s_axi_ctrl_bresp  (                      ),      // output wire [1 : 0] c0_ddr4_s_axi_ctrl_bresp
		.c0_ddr4_s_axi_ctrl_arvalid(1'b0                  ),  // input wire c0_ddr4_s_axi_ctrl_arvalid
		.c0_ddr4_s_axi_ctrl_arready(                      ),  // output wire c0_ddr4_s_axi_ctrl_arready
		.c0_ddr4_s_axi_ctrl_araddr (32'b0                 ),    // input wire [31 : 0] c0_ddr4_s_axi_ctrl_araddr
		.c0_ddr4_s_axi_ctrl_rvalid (                      ),    // output wire c0_ddr4_s_axi_ctrl_rvalid
		.c0_ddr4_s_axi_ctrl_rready (1'b0                  ),    // input wire c0_ddr4_s_axi_ctrl_rready
		.c0_ddr4_s_axi_ctrl_rdata  (                      ),      // output wire [31 : 0] c0_ddr4_s_axi_ctrl_rdata
		.c0_ddr4_s_axi_ctrl_rresp  (                      ),      // output wire [1 : 0] c0_ddr4_s_axi_ctrl_rresp

		.chip_rstn                 (	chip_rstn         ),

		// AXI4 Memory Interface
		.c0_ddr4_s_axi_awid    ( m_axi_awid),                  // input wire [15 : 0] c0_ddr4_s_axi_awid
		.c0_ddr4_s_axi_awaddr    ( m_axi_awaddr),              // input wire [34 : 0] c0_ddr4_s_axi_awaddr
		.c0_ddr4_s_axi_awlen    ( m_axi_awlen),                // input wire [7 : 0] c0_ddr4_s_axi_awlen
		.c0_ddr4_s_axi_awsize    ( m_axi_awsize),              // input wire [2 : 0] c0_ddr4_s_axi_awsize
		.c0_ddr4_s_axi_awburst    ( m_axi_awburst),            // input wire [1 : 0] c0_ddr4_s_axi_awburst
		.c0_ddr4_s_axi_awlock    ( m_axi_awlock),              // input wire [0 : 0] c0_ddr4_s_axi_awlock
		.c0_ddr4_s_axi_awcache    ( m_axi_awcache),            // input wire [3 : 0] c0_ddr4_s_axi_awcache
		.c0_ddr4_s_axi_awprot    ( m_axi_awprot),              // input wire [2 : 0] c0_ddr4_s_axi_awprot
		.c0_ddr4_s_axi_awqos    ( m_axi_awqos),                // input wire [3 : 0] c0_ddr4_s_axi_awqos
		.c0_ddr4_s_axi_awvalid    ( m_axi_awvalid),            // input wire c0_ddr4_s_axi_awvalid
		.c0_ddr4_s_axi_awready    ( m_axi_awready),            // output wire c0_ddr4_s_axi_awready
		.c0_ddr4_s_axi_wdata    ( m_axi_wdata),                // input wire [511 : 0] c0_ddr4_s_axi_wdata
		.c0_ddr4_s_axi_wstrb    ( m_axi_wstrb),                // input wire [63 : 0] c0_ddr4_s_axi_wstrb
		.c0_ddr4_s_axi_wlast    ( m_axi_wlast),                // input wire c0_ddr4_s_axi_wlast
		.c0_ddr4_s_axi_wvalid    ( m_axi_wvalid),              // input wire c0_ddr4_s_axi_wvalid
		.c0_ddr4_s_axi_wready    ( m_axi_wready),              // output wire c0_ddr4_s_axi_wready
		.c0_ddr4_s_axi_bready    ( m_axi_bready),              // input wire c0_ddr4_s_axi_bready
		.c0_ddr4_s_axi_bid    ( m_axi_bid),                    // output wire [15 : 0] c0_ddr4_s_axi_bid
		.c0_ddr4_s_axi_bresp    ( m_axi_bresp),                // output wire [1 : 0] c0_ddr4_s_axi_bresp
		.c0_ddr4_s_axi_bvalid    ( m_axi_bvalid),              // output wire c0_ddr4_s_axi_bvalid
		.c0_ddr4_s_axi_arid    ( m_axi_arid),                  // input wire [15 : 0] c0_ddr4_s_axi_arid
		.c0_ddr4_s_axi_araddr    ( m_axi_araddr),              // input wire [34 : 0] c0_ddr4_s_axi_araddr
		.c0_ddr4_s_axi_arlen    ( m_axi_arlen),                // input wire [7 : 0] c0_ddr4_s_axi_arlen
		.c0_ddr4_s_axi_arsize    ( m_axi_arsize),              // input wire [2 : 0] c0_ddr4_s_axi_arsize
		.c0_ddr4_s_axi_arburst    ( m_axi_arburst),            // input wire [1 : 0] c0_ddr4_s_axi_arburst
		.c0_ddr4_s_axi_arlock    ( m_axi_arlock),              // input wire [0 : 0] c0_ddr4_s_axi_arlock
		.c0_ddr4_s_axi_arcache    ( m_axi_arcache),            // input wire [3 : 0] c0_ddr4_s_axi_arcache
		.c0_ddr4_s_axi_arprot    ( m_axi_arprot),              // input wire [2 : 0] c0_ddr4_s_axi_arprot
		.c0_ddr4_s_axi_arqos    ( m_axi_arqos),                // input wire [3 : 0] c0_ddr4_s_axi_arqos
		.c0_ddr4_s_axi_arvalid    ( m_axi_arvalid),            // input wire c0_ddr4_s_axi_arvalid
		.c0_ddr4_s_axi_arready    ( m_axi_arready),            // output wire c0_ddr4_s_axi_arready
		.c0_ddr4_s_axi_rready    ( m_axi_rready),              // input wire c0_ddr4_s_axi_rready
		.c0_ddr4_s_axi_rlast    ( m_axi_rlast),                // output wire c0_ddr4_s_axi_rlast
		.c0_ddr4_s_axi_rvalid    ( m_axi_rvalid),              // output wire c0_ddr4_s_axi_rvalid
		.c0_ddr4_s_axi_rresp    ( m_axi_rresp),                // output wire [1 : 0] c0_ddr4_s_axi_rresp
		.c0_ddr4_s_axi_rid    ( m_axi_rid),                    // output wire [15 : 0] c0_ddr4_s_axi_rid
		.c0_ddr4_s_axi_rdata    ( m_axi_rdata),                 // output wire [511 : 0] c0_ddr4_s_axi_rdata
		// PCIe 
		.pci_express_x16_rxn(pci_express_x16_rxn),
		.pci_express_x16_rxp(pci_express_x16_rxp),
		.pci_express_x16_txn(pci_express_x16_txn),
		.pci_express_x16_txp(pci_express_x16_txp),
		.pcie_perstn(pcie_perstn),
		.pcie_refclk_clk_n(pcie_refclk_clk_n),
		.pcie_refclk_clk_p(pcie_refclk_clk_p),
		.resetn(resetn)
		);

		
endmodule		