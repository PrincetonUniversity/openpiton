
`include "mc_define.h"

`include "noc_axi4_bridge_define.vh"

module alveo_shell_top (

    input  logic       pcie_refclk_clk_n    ,
    input  logic       pcie_refclk_clk_p    ,
    input  logic       pcie_perstn          ,		
    input  logic [15:0] pci_express_x16_rxn  ,
    input  logic [15:0] pci_express_x16_rxp  ,
    output logic [15:0] pci_express_x16_txn  ,
    output logic [15:0] pci_express_x16_txp  ,
    input  logic       resetn               ,

    output logic       c0_ddr4_act_n,
    output logic [16:0] c0_ddr4_adr,
    output logic [1:0] c0_ddr4_ba,
    output logic [1:0] c0_ddr4_bg,
    output logic [0:0] c0_ddr4_ck_c,
    output logic [0:0] c0_ddr4_ck_t,
    output logic [0:0] c0_ddr4_cke,
    output logic [0:0] c0_ddr4_cs_n,
    inout wire [71:0] c0_ddr4_dq,
    inout wire [17:0] c0_ddr4_dqs_c,
    inout wire [17:0] c0_ddr4_dqs_t,
    output logic [0:0] c0_ddr4_odt,
    output logic c0_ddr4_par,
    output logic c0_ddr4_reset_n,
    output logic c0_ddr4_ui_clk_sync_rst,

	// Reference clock
    input logic c0_sysclk_clk_n,
    input logic c0_sysclk_clk_p,
	// input mc_clk                  							,
	// input mc_rstn                 							,
    output logic   chip_rstn                                           ,
	input  logic   chipset_clk             							,
	input  logic chipset_rstn	          							,
    output logic  c0_init_calib_complete,
	
	input  logic  [`NOC_DATA_WIDTH-1:0]   mem_flit_in_data      ,
    input  logic                          mem_flit_in_val       ,
    output logic                          mem_flit_in_rdy       ,

    output logic  [`NOC_DATA_WIDTH-1:0]   mem_flit_out_data     ,
    output logic                          mem_flit_out_val      ,
    input  logic                          mem_flit_out_rdy     
);

	logic mc_rst;
	logic mc_clk;


	logic                                trans_fifo_val;
	logic    [`NOC_DATA_WIDTH-1:0]       trans_fifo_data;
	logic                                trans_fifo_rdy;

	logic                                fifo_trans_val;
	logic    [`NOC_DATA_WIDTH-1:0]       fifo_trans_data;
	logic                                fifo_trans_rdy;

	logic [`AXI4_ID_WIDTH     -1:0]     m_axi_awid;
	logic [`AXI4_ADDR_WIDTH   -1:0]     m_axi_awaddr;
	logic [`AXI4_LEN_WIDTH    -1:0]     m_axi_awlen;
	logic [`AXI4_SIZE_WIDTH   -1:0]     m_axi_awsize;
	logic [`AXI4_BURST_WIDTH  -1:0]     m_axi_awburst;
	logic                               m_axi_awlock;
	logic [`AXI4_CACHE_WIDTH  -1:0]     m_axi_awcache;
	logic [`AXI4_PROT_WIDTH   -1:0]     m_axi_awprot;
	logic [`AXI4_QOS_WIDTH    -1:0]     m_axi_awqos;
	logic [`AXI4_REGION_WIDTH -1:0]     m_axi_awregion;
	logic [`AXI4_USER_WIDTH   -1:0]     m_axi_awuser;
	logic                               m_axi_awvalid;
	logic                               m_axi_awready;

	logic  [`AXI4_ID_WIDTH     -1:0]    m_axi_wid;
	logic  [`AXI4_DATA_WIDTH   -1:0]    m_axi_wdata;
	logic  [`AXI4_STRB_WIDTH   -1:0]    m_axi_wstrb;
	logic                               m_axi_wlast;
	logic  [`AXI4_USER_WIDTH   -1:0]    m_axi_wuser;
	logic                               m_axi_wvalid;
	logic                               m_axi_wready;
	
	logic  [`AXI4_ID_WIDTH     -1:0]    m_axi_arid;
	logic  [`AXI4_ADDR_WIDTH   -1:0]    m_axi_araddr;
	logic  [`AXI4_LEN_WIDTH    -1:0]    m_axi_arlen;
	logic  [`AXI4_SIZE_WIDTH   -1:0]    m_axi_arsize;
	logic  [`AXI4_BURST_WIDTH  -1:0]    m_axi_arburst;
	logic                               m_axi_arlock;
	logic  [`AXI4_CACHE_WIDTH  -1:0]    m_axi_arcache;
	logic  [`AXI4_PROT_WIDTH   -1:0]    m_axi_arprot;
	logic  [`AXI4_QOS_WIDTH    -1:0]    m_axi_arqos;
	logic  [`AXI4_REGION_WIDTH -1:0]    m_axi_arregion;
	logic  [`AXI4_USER_WIDTH   -1:0]    m_axi_aruser;
	logic                               m_axi_arvalid;
	logic                               m_axi_arready;
	
	logic  [`AXI4_ID_WIDTH     -1:0]    m_axi_rid;
	logic  [`AXI4_DATA_WIDTH   -1:0]    m_axi_rdata;
	logic  [`AXI4_RESP_WIDTH   -1:0]    m_axi_rresp;
	logic                               m_axi_rlast;
	logic  [`AXI4_USER_WIDTH   -1:0]    m_axi_ruser;
	logic                               m_axi_rvalid;
	logic                               m_axi_rready;
	
	logic  [`AXI4_ID_WIDTH     -1:0]    m_axi_bid;
	logic  [`AXI4_RESP_WIDTH   -1:0]    m_axi_bresp;
	logic  [`AXI4_USER_WIDTH   -1:0]    m_axi_buser;
	logic                               m_axi_bvalid;
	logic                               m_axi_bready;

	noc_bidir_afifo  mig_afifo  (
		.clk_1           ( chipset_clk      ),
		.rst_1           ( ~chipset_rstn    ),

		.clk_2           ( mc_clk            ),
		.rst_2           ( mc_rst            ),

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
		.rst_n              ( 	~mc_rst 		), 
		.uart_boot_en       ( 	1'b0			),
		.phy_init_done      ( 	c0_init_calib_complete	),

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

		.c0_sysclk_clk_p           ( c0_sysclk_clk_p           ),
		.c0_sysclk_clk_n           ( c0_sysclk_clk_n           ),
		.c0_ddr4_ui_clk            ( mc_clk                    ),
		.c0_ddr4_ui_clk_sync_rst   ( mc_rst                    ),
		.c0_init_calib_complete    ( c0_init_calib_complete    ),

		// DDR4 physicall interface
		.c0_ddr4_act_n             ( c0_ddr4_act_n                 ), // cas_n, ras_n and we_n are multiplexed in ddr4
		.c0_ddr4_adr               ( c0_ddr4_adr                  ),
		.c0_ddr4_ba                ( c0_ddr4_ba                    ),
		.c0_ddr4_bg                ( c0_ddr4_bg                    ), // bank group address
		.c0_ddr4_ck_t              ( c0_ddr4_ck_t                  ),
		.c0_ddr4_ck_c              ( c0_ddr4_ck_c                  ),
		.c0_ddr4_cke               ( c0_ddr4_cke                   ),
		.c0_ddr4_cs_n              ( c0_ddr4_cs_n                  ),
		.c0_ddr4_dq                ( c0_ddr4_dq                    ), 
		.c0_ddr4_dqs_c             ( c0_ddr4_dqs_c                 ), 
		.c0_ddr4_dqs_t             ( c0_ddr4_dqs_t                 ), 
		.c0_ddr4_odt               ( c0_ddr4_odt                   ),
		.c0_ddr4_par               ( c0_ddr4_par                   ),                        // output logic c0_ddr4_parity
		.c0_ddr4_reset_n           ( c0_ddr4_reset_n               ),

		// DDR4 control interface, not used, grounded
		.c0_ddr4_s_axi_ctrl_awvalid(1'b0                  ),  // input logic c0_ddr4_s_axi_ctrl_awvalid
		.c0_ddr4_s_axi_ctrl_awready(                      ),  // output logic c0_ddr4_s_axi_ctrl_awready
		.c0_ddr4_s_axi_ctrl_awaddr (32'b0                 ),    // input logic [31 : 0] c0_ddr4_s_axi_ctrl_awaddr
		.c0_ddr4_s_axi_ctrl_wvalid (1'b0                  ),    // input logic c0_ddr4_s_axi_ctrl_wvalid
		.c0_ddr4_s_axi_ctrl_wready (                      ),    // output logic c0_ddr4_s_axi_ctrl_wready
		.c0_ddr4_s_axi_ctrl_wdata  (32'b0                 ),      // input logic [31 : 0] c0_ddr4_s_axi_ctrl_wdata
		.c0_ddr4_s_axi_ctrl_bvalid (                      ),    // output logic c0_ddr4_s_axi_ctrl_bvalid
		.c0_ddr4_s_axi_ctrl_bready (1'b0                  ),    // input logic c0_ddr4_s_axi_ctrl_bready
		.c0_ddr4_s_axi_ctrl_bresp  (                      ),      // output logic [1 : 0] c0_ddr4_s_axi_ctrl_bresp
		.c0_ddr4_s_axi_ctrl_arvalid(1'b0                  ),  // input logic c0_ddr4_s_axi_ctrl_arvalid
		.c0_ddr4_s_axi_ctrl_arready(                      ),  // output logic c0_ddr4_s_axi_ctrl_arready
		.c0_ddr4_s_axi_ctrl_araddr (32'b0                 ),    // input logic [31 : 0] c0_ddr4_s_axi_ctrl_araddr
		.c0_ddr4_s_axi_ctrl_rvalid (                      ),    // output logic c0_ddr4_s_axi_ctrl_rvalid
		.c0_ddr4_s_axi_ctrl_rready (1'b0                  ),    // input logic c0_ddr4_s_axi_ctrl_rready
		.c0_ddr4_s_axi_ctrl_rdata  (                      ),      // output logic [31 : 0] c0_ddr4_s_axi_ctrl_rdata
		.c0_ddr4_s_axi_ctrl_rresp  (                      ),      // output logic [1 : 0] c0_ddr4_s_axi_ctrl_rresp

		.chip_rstn                 (	chip_rstn         ),

		// AXI4 Memory Interface
		.c0_ddr4_s_axi_awid    ( m_axi_awid),                  // input logic [15 : 0] c0_ddr4_s_axi_awid
		.c0_ddr4_s_axi_awaddr    ( m_axi_awaddr),              // input logic [34 : 0] c0_ddr4_s_axi_awaddr
		.c0_ddr4_s_axi_awlen    ( m_axi_awlen),                // input logic [7 : 0] c0_ddr4_s_axi_awlen
		.c0_ddr4_s_axi_awsize    ( m_axi_awsize),              // input logic [2 : 0] c0_ddr4_s_axi_awsize
		.c0_ddr4_s_axi_awburst    ( m_axi_awburst),            // input logic [1 : 0] c0_ddr4_s_axi_awburst
		.c0_ddr4_s_axi_awlock    ( m_axi_awlock),              // input logic [0 : 0] c0_ddr4_s_axi_awlock
		.c0_ddr4_s_axi_awcache    ( m_axi_awcache),            // input logic [3 : 0] c0_ddr4_s_axi_awcache
		.c0_ddr4_s_axi_awprot    ( m_axi_awprot),              // input logic [2 : 0] c0_ddr4_s_axi_awprot
		.c0_ddr4_s_axi_awqos    ( m_axi_awqos),                // input logic [3 : 0] c0_ddr4_s_axi_awqos
		.c0_ddr4_s_axi_awvalid    ( m_axi_awvalid),            // input logic c0_ddr4_s_axi_awvalid
		.c0_ddr4_s_axi_awready    ( m_axi_awready),            // output logic c0_ddr4_s_axi_awready
		.c0_ddr4_s_axi_wdata    ( m_axi_wdata),                // input logic [511 : 0] c0_ddr4_s_axi_wdata
		.c0_ddr4_s_axi_wstrb    ( m_axi_wstrb),                // input logic [63 : 0] c0_ddr4_s_axi_wstrb
		.c0_ddr4_s_axi_wlast    ( m_axi_wlast),                // input logic c0_ddr4_s_axi_wlast
		.c0_ddr4_s_axi_wvalid    ( m_axi_wvalid),              // input logic c0_ddr4_s_axi_wvalid
		.c0_ddr4_s_axi_wready    ( m_axi_wready),              // output logic c0_ddr4_s_axi_wready
		.c0_ddr4_s_axi_bready    ( m_axi_bready),              // input logic c0_ddr4_s_axi_bready
		.c0_ddr4_s_axi_bid    ( m_axi_bid),                    // output logic [15 : 0] c0_ddr4_s_axi_bid
		.c0_ddr4_s_axi_bresp    ( m_axi_bresp),                // output logic [1 : 0] c0_ddr4_s_axi_bresp
		.c0_ddr4_s_axi_bvalid    ( m_axi_bvalid),              // output logic c0_ddr4_s_axi_bvalid
		.c0_ddr4_s_axi_arid    ( m_axi_arid),                  // input logic [15 : 0] c0_ddr4_s_axi_arid
		.c0_ddr4_s_axi_araddr    ( m_axi_araddr),              // input logic [34 : 0] c0_ddr4_s_axi_araddr
		.c0_ddr4_s_axi_arlen    ( m_axi_arlen),                // input logic [7 : 0] c0_ddr4_s_axi_arlen
		.c0_ddr4_s_axi_arsize    ( m_axi_arsize),              // input logic [2 : 0] c0_ddr4_s_axi_arsize
		.c0_ddr4_s_axi_arburst    ( m_axi_arburst),            // input logic [1 : 0] c0_ddr4_s_axi_arburst
		.c0_ddr4_s_axi_arlock    ( m_axi_arlock),              // input logic [0 : 0] c0_ddr4_s_axi_arlock
		.c0_ddr4_s_axi_arcache    ( m_axi_arcache),            // input logic [3 : 0] c0_ddr4_s_axi_arcache
		.c0_ddr4_s_axi_arprot    ( m_axi_arprot),              // input logic [2 : 0] c0_ddr4_s_axi_arprot
		.c0_ddr4_s_axi_arqos    ( m_axi_arqos),                // input logic [3 : 0] c0_ddr4_s_axi_arqos
		.c0_ddr4_s_axi_arvalid    ( m_axi_arvalid),            // input logic c0_ddr4_s_axi_arvalid
		.c0_ddr4_s_axi_arready    ( m_axi_arready),            // output logic c0_ddr4_s_axi_arready
		.c0_ddr4_s_axi_rready    ( m_axi_rready),              // input logic c0_ddr4_s_axi_rready
		.c0_ddr4_s_axi_rlast    ( m_axi_rlast),                // output logic c0_ddr4_s_axi_rlast
		.c0_ddr4_s_axi_rvalid    ( m_axi_rvalid),              // output logic c0_ddr4_s_axi_rvalid
		.c0_ddr4_s_axi_rresp    ( m_axi_rresp),                // output logic [1 : 0] c0_ddr4_s_axi_rresp
		.c0_ddr4_s_axi_rid    ( m_axi_rid),                    // output logic [15 : 0] c0_ddr4_s_axi_rid
		.c0_ddr4_s_axi_rdata    ( m_axi_rdata),                 // output logic [511 : 0] c0_ddr4_s_axi_rdata
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

