// Copyright (c) 2016 Princeton University
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

module host(
    input       clk,
    input       rst_n,

    output      serial_tx,
    input       serial_rx
);
localparam  EOF = -1;
localparam  MAX_RCV_CHAR = 16;


integer             file_dscr;
reg     [31:0]      char;

wire                uart_in_ready;
reg                 uart_in_valid;
reg     [7:0]       uart_in_data;
wire                uart_in_accepted;

wire                uart_out_valid;
wire    [7:0]       uart_out_data;
wire                uart_out_ready;

reg                 fpga_ready;
reg     [7:0]       rcv_chars [MAX_RCV_CHAR-1:0];
reg     [3:0]       rcv_chars_cnt;

reg     [8*1024:1]  env_path;

initial begin
    $value$plusargs("env_path=%s", env_path);
    file_dscr = $fopen({env_path, "test.ustr"}, "r");
    if (file_dscr == 0) begin
        $display("Can't open file");
        $finish;
    end
end

always @(posedge clk) begin
    if (~rst_n) begin
    end
    else begin
        if (uart_in_accepted) begin
            $fscanf(file_dscr, "%2h", char);
            if ($feof(file_dscr)) begin
                $fclose(file_dscr);
                #100000 $finish;
            end
            else begin
                $display("char = %2h", char);
                uart_in_data <= char[7:0];
            end
        end
    end
end

assign uart_in_accepted = uart_in_valid & uart_in_ready;

always @(posedge clk) begin
    if (~rst_n)
        uart_in_valid   <= 1'b0;
    else
        uart_in_valid   <= fpga_ready ? 1'b1 : uart_in_valid; 
end

always @(posedge clk) begin
    if (~rst_n)
        rcv_chars_cnt   <= 4'b0;
    else
        rcv_chars_cnt   <= uart_out_valid ? rcv_chars_cnt + 1 : rcv_chars_cnt;
end

generate
    genvar i;
    for (i = 0; i < MAX_RCV_CHAR; i = i + 1) begin: rcv_chars_gen
        always @(posedge clk) begin
            if (~rst_n)
                rcv_chars[i] <= 8'h0;
            else
                rcv_chars[i] <= (i == rcv_chars_cnt) & uart_out_valid ? uart_out_data : rcv_chars[i];
        end
    end
endgenerate

// "DONE" = 8'h44 8'h4f 8'h4e 8'h45 
always @(posedge clk) begin
    if (~rst_n)
        fpga_ready  <= 1'b0;
    else
        fpga_ready  <=  fpga_ready      ? 1'b1      :
                        (rcv_chars[0] == 8'h44) &
                        (rcv_chars[1] == 8'h4f) &
                        (rcv_chars[2] == 8'h4e) &
                        (rcv_chars[3] == 8'h45)     ;
end

//---------------------------------------------------------------
assign  uart_out_ready = 1'b1;

UART    # (
  .ClockFreq      (`CLK_FREQUENCY   ),
  .Baud           (`UART_BAUD_RATE  ),
  .Width          (`UART_WIDTH      ),
  .Parity         (`UART_PARITY     ),
  .StopBits       (`UART_STOP_BITS  )
) UART    (
  .Clock          (clk              ),
  .Reset          (~rst_n           ),

  .DataIn         (uart_in_data     ), 
  .DataInValid    (uart_in_valid    ), 
  .DataInReady    (uart_in_ready    ),

  .DataOut        (uart_out_data    ), 
  .DataOutValid   (uart_out_valid   ), 
  .DataOutReady   (uart_out_ready   ), 
  .SIn            (serial_rx        ), 
  .SOut           (serial_tx        )
);


endmodule
