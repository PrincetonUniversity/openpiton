// asynchronous, dual-clock FIFO.
//  - not "first-word-fall-through" 
//  - 1-cycle read delay
`ifdef PITON_FPGA_SYNTH
`define USE_XILINX_XPM
`endif
module async_fifo (
    rst,
    wr_clk, wr_en, din, full,
    rd_clk, rd_en, dout, empty);

    // -----------------------------------------------------------------------
    // parameter declarations
    // -----------------------------------------------------------------------
    parameter WIDTH = 32;
    parameter DEPTH_LOG2 = 6;   // DEPTH = 64

    localparam DEPTH = 1 << DEPTH_LOG2;

    // -----------------------------------------------------------------------
    // port declarations
    // -----------------------------------------------------------------------
    // cross-domain
    input wire rst;     // asynchronous reset, works in both time domains

    // writing time domain
    input  wire                 wr_clk;
    input  wire                 wr_en;
    input  wire [WIDTH - 1:0]   din;
    output wire                 full;

    // reading time domain
    input  wire                 rd_clk;
    input  wire                 rd_en;
    output wire [WIDTH - 1:0]   dout;
    output wire                 empty;

`ifdef USE_XILINX_XPM
    wire wr_rst_busy, raw_full;
    wire rd_rst_busy, raw_empty;

    assign full = wr_rst_busy || raw_full;
    assign empty = rd_rst_busy || raw_empty;

    xpm_fifo_async #(
        .FIFO_WRITE_DEPTH(DEPTH)
        ,.WRITE_DATA_WIDTH(WIDTH)
        ,.FULL_RESET_VALUE(0)
        ,.READ_MODE("std")
        ,.FIFO_READ_LATENCY(1)
        ,.READ_DATA_WIDTH(WIDTH)
        ,.CDC_SYNC_STAGES(4)
    ) xpm_fifo_async_inst (
        .rst(rst)
        ,.wr_clk(wr_clk)
        ,.wr_en(wr_en)
        ,.din(din)
        ,.full(raw_full)
        ,.wr_rst_busy(wr_rst_busy)
        ,.rd_clk(rd_clk)
        ,.rd_en(rd_en)
        ,.dout(dout)
        ,.empty(raw_empty)
        ,.rd_rst_busy(rd_rst_busy)
        );
`else
    // -----------------------------------------------------------------------
    // wire declarations
    // -----------------------------------------------------------------------
    // cross-domain
    reg  [WIDTH - 1:0]      mem     [DEPTH-1:0];

    // writing time domain
    reg  [DEPTH_LOG2:0]     wr_ptr;
    wire [DEPTH_LOG2:0]     rd_ptr_sync;

    // reading time domain
    reg  [DEPTH_LOG2:0]     rd_ptr;
    wire [DEPTH_LOG2:0]     wr_ptr_sync;
    reg  [WIDTH - 1:0]      dout_f;

    // -----------------------------------------------------------------------
    // combinational logic
    // -----------------------------------------------------------------------
    // writing time domain
    assign full = (rd_ptr_sync == {~wr_ptr[DEPTH_LOG2], wr_ptr[DEPTH_LOG2 - 1:0]});

    // reading time domain
    assign dout = dout_f;
    assign empty = (wr_ptr_sync == rd_ptr);

    // -----------------------------------------------------------------------
    // sequential logic
    // -----------------------------------------------------------------------
    // writing time domain
    always @(posedge wr_clk or posedge rst) begin
        if (rst) begin
            wr_ptr  <=  {(DEPTH_LOG2 + 1){1'b0}};
        end else begin
            if (!full && wr_en) begin
                mem[wr_ptr[DEPTH_LOG2 - 1:0]]   <=  din;
                wr_ptr  <=  wr_ptr + 1;
            end
        end
    end

    // reading time domain
    always @(posedge rd_clk or posedge rst) begin
        if (rst) begin
            rd_ptr  <=  {(DEPTH_LOG2 + 1){1'b0}};
            dout_f  <=  {WIDTH{1'b0}};
        end else begin
            if (!empty && rd_en) begin
                dout_f  <=  mem[rd_ptr[DEPTH_LOG2 - 1:0]];
                rd_ptr  <=  rd_ptr + 1;
            end
        end
    end

    // -----------------------------------------------------------------------
    // gray synchronizer
    // -----------------------------------------------------------------------
    // writing to reading
    wire [DEPTH_LOG2:0] wr_ptr_gray_sync;
    reg  [DEPTH_LOG2:0] wr_ptr_sync_f;

    cdc_bits #(
        .WIDTH(DEPTH_LOG2 + 1)
    ) wr_to_rd (
        .rst(rst)
        ,.src_clk(wr_clk)
        ,.src({wr_ptr[DEPTH_LOG2], wr_ptr[DEPTH_LOG2:1] ^ wr_ptr[DEPTH_LOG2-1:0]})
        ,.dst_clk(rd_clk)
        ,.dst(wr_ptr_gray_sync)
        );

    genvar wr_gv;
    generate for (wr_gv = 0; wr_gv <= DEPTH_LOG2; wr_gv = wr_gv + 1) begin
        always @(posedge rd_clk or posedge rst) begin
            if (rst) begin
                wr_ptr_sync_f[wr_gv]    <=  1'b0;
            end else begin
                wr_ptr_sync_f[wr_gv]    <=  ^ wr_ptr_gray_sync[DEPTH_LOG2:wr_gv];
            end
        end
    end endgenerate

    assign wr_ptr_sync = wr_ptr_sync_f;

    // reading to writing
    wire [DEPTH_LOG2:0] rd_ptr_gray_sync;
    reg  [DEPTH_LOG2:0] rd_ptr_sync_f;

    cdc_bits #(
        .WIDTH(DEPTH_LOG2 + 1)
    ) rd_to_wr (
        .rst(rst)
        ,.src_clk(rd_clk)
        ,.src({rd_ptr[DEPTH_LOG2], rd_ptr[DEPTH_LOG2:1] ^ rd_ptr[DEPTH_LOG2-1:0]})
        ,.dst_clk(wr_clk)
        ,.dst(rd_ptr_gray_sync)
        );

    genvar rd_gv;
    generate for (rd_gv = 0; rd_gv <= DEPTH_LOG2; rd_gv = rd_gv + 1) begin
        always @(posedge wr_clk or rst) begin
            if (rst) begin
                rd_ptr_sync_f[rd_gv]    <=  1'b0;
            end else begin
                rd_ptr_sync_f[rd_gv]    <=  ^ rd_ptr_gray_sync[DEPTH_LOG2:rd_gv];
            end
        end
    end endgenerate

    assign rd_ptr_sync = rd_ptr_sync_f;
`endif

endmodule
