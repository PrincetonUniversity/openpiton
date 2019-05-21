// Cross-domain pulse synchronizer
`ifdef PITON_FPGA_SYNTH
`define USE_XILINX_XPM
`endif
module cdc_pulse (
    rst,
    src_clk, src,
    dst_clk, dst
    );

    input  wire     rst;

    input  wire     src_clk;
    input  wire     src;

    input  wire     dst_clk;
    output wire     dst;

`ifdef USE_XILINX_XPM
    xpm_cdc_pulse #(
        .DEST_SYNC_FF(4)
        ,.REG_OUTPUT(1)
        ,.RST_USED(1)
    ) xpm_cdc_pulse_inst (
        .src_clk(src_clk)
        ,.src_rst(rst)
        ,.src_pulse(src)
        ,.dest_clk(dst_clk)
        ,.dest_rst(rst)
        ,.dest_pulse(dst)
        );
`else
    reg [1:0] src_f, dst_f;
    wire dst_edge;
    reg src_edge;

    cdc_bits #(
        .WIDTH(1)
    ) cdc_edge (
        .rst(rst)
        ,.src_clk(src_clk)
        ,.src(src_edge)
        ,.dst_clk(dst_clk)
        ,.dst(dst_edge)
        );

    always @(posedge src_clk or posedge rst) begin
        if (rst) begin
            src_f       <= {src, src};
            src_edge    <= 1'b0;
        end else begin
            src_f       <= {src_f[0], src};

            if (src_f == 2'b01) begin
                src_edge    <= ~src_edge;
            end else begin
                src_edge    <= src_edge;
            end
        end
    end

    always @(posedge dst_clk or posedge rst) begin
        if (rst) begin
            dst_f       <= 2'b00;
        end else begin
            dst_f       <= {dst_f[0], dst_edge};
        end
    end

    assign dst = ^ dst_f;
`endif

endmodule
