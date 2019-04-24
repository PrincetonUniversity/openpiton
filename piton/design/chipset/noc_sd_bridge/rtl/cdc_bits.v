// Cross-domain bit(s) synchronizer
//  - if WIDTH is greater than 1, the bits are independently synced. do not use
//      this directly for bus signals.
module cdc_bits (
    rst,
    src_clk, src,
    dst_clk, dst
    );

    parameter WIDTH = 1;

    input  wire                 rst;

    input  wire                 src_clk;
    input  wire [WIDTH - 1:0]   src;

    input  wire                 dst_clk;
    output wire [WIDTH - 1:0]   dst;

`ifdef USE_XILINX_XPM
    xpm_cdc_array_single #(
        .DEST_SYNC_FF(4)
        ,.WIDTH(WIDTH)
        ,.SRC_INPUT_REG(1)
    ) xpm_cdc_array_single_inst (
        .src_clk(src_clk)
        ,.src_in(src)
        ,.dest_clk(dst_clk)
        ,.dest_out(dst)
        );
`else
    reg [WIDTH - 1:0]   dst_f;
    assign dst = dst_f;

    genvar i;
    generate for (i = 0; i < WIDTH; i = i + 1) begin: cdc_bit
        reg [3:0] bit_f;   // 4-stage synchronizer

        always @(posedge src_clk or posedge rst) begin
            if (rst) begin
                bit_f[0]    <=  1'b0;
            end else begin
                bit_f[0]    <=  src[i];
            end
        end

        always @(posedge dst_clk or posedge rst) begin
            if (rst) begin
                {dst_f[i], bit_f[3:1]}  <=  4'h0;
            end else begin
                {dst_f[i], bit_f[3:1]}  <=  bit_f;
            end
        end
    end endgenerate
`endif

endmodule
