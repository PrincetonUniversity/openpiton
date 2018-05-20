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

module oled_transform (
    input                   sys_clk,
    input                   sys_rst_n,

    input                   oled_val,
    input       [1:0]       oled_row,
    input       [3:0]       oled_col,
    input       [7:0]       oled_char,
    output                  oled_done,

    output  reg             ext_spi_val,
    output  reg  [7:0]      ext_spi_data,
    output  reg             ext_spi_dc,
    input                   ext_spi_cmpl
);
localparam IDLE         = 0;
localparam SPI_SENT     = 1;
localparam WAIT_COMPL   = 2;

localparam SPI_IN_OLED  = 8;

reg [1:0]       state;
reg [2:0]       spi_cnt;
reg             processing;

wire [7:0]      char_map [7:0];
wire [7:0]      char_cell [7:0];
reg  [63:0]     char_map_table[127:0];

reg [7:0]       table_index;

assign oled_done = processing & (spi_cnt == (SPI_IN_OLED - 1)) & ext_spi_cmpl;

always @(posedge sys_clk) begin
    if (~sys_rst_n) begin
        state <= IDLE;
        ext_spi_val <= 1'b0;
        ext_spi_dc <= 1'b1;
        spi_cnt <= 3'b0;
    end
    else begin
        case (state)
        IDLE: begin
            state <= oled_val ? SPI_SENT : state;
            spi_cnt <= 3'b0;
        end
        SPI_SENT: begin
            state           <= WAIT_COMPL;
            ext_spi_val     <= 1'b1;
            ext_spi_dc      <= 1'b1;
            ext_spi_data    <= char_cell[spi_cnt];
        end
        WAIT_COMPL: begin
            state <= ext_spi_cmpl   ? (spi_cnt == (SPI_IN_OLED-1) ? IDLE : SPI_SENT)
                                    : state;
            ext_spi_val <= 1'b0;
            spi_cnt <= ext_spi_cmpl & 
                       (spi_cnt != (SPI_IN_OLED-1) ) ? spi_cnt + 1 : spi_cnt;
        end
        default: begin
        end
        endcase
    end
end

always @(posedge sys_clk) begin
    if (~sys_rst_n) begin
        processing <= 1'b0;
    end
    else begin
        processing <= oled_val  ? 1'b1 : 
                      oled_done ? 1'b0 : processing;
    end
end


assign {char_map[0],
        char_map[1],
        char_map[2],
        char_map[3],
        char_map[4],
        char_map[5],
        char_map[6],
        char_map[7] } = char_map_table[table_index];

generate begin
    genvar i, j;
    for (i = 0; i < 8; i = i + 1) begin: col
        for (j = 0; j < 8; j = j + 1) begin: row
            assign char_cell[i][j] = char_map[j][i];
        end
    end
end
endgenerate

always @(posedge sys_clk) begin
    if (~sys_rst_n) begin
        table_index <= 5'b0;
    end
    else begin
        table_index <= oled_val ? oled_char : table_index;
    end   
end

always @(posedge sys_clk) begin
    char_map_table[32] <= 64'h0000000000000000;     // Space
    char_map_table[33] <= 64'h183C3C1818001800;   // !
    char_map_table[34] <= 64'h3636000000000000;   // "
    char_map_table[35] <= 64'h36367F367F363600;   // #
    char_map_table[36] <= 64'h0C3E031E301F0C00;   // $
    char_map_table[37] <= 64'h006333180C666300;   // %
    char_map_table[38] <= 64'h1C361C6E3B336E00;   // &
    char_map_table[39] <= 64'h0606030000000000;   // '
    char_map_table[40] <= 64'h180C0606060C1800;   // (
    char_map_table[41] <= 64'h060C1818180C0600;   // )
    char_map_table[42] <= 64'h00663CFF3C660000;   // *
    char_map_table[43] <= 64'h000C0C3F0C0C0000;   // +
    char_map_table[44] <= 64'h00000000000C0C06;   // ,
    char_map_table[45] <= 64'h0000003F00000000;   // -
    char_map_table[46] <= 64'h00000000000C0C00;   // .
    char_map_table[47] <= 64'h6030180C06030100;   // /
    char_map_table[48] <= 64'h3E63737B6F673E00;   // 0
    char_map_table[49] <= 64'h0C0E0C0C0C0C3F00;   // 1
    char_map_table[50] <= 64'h1E33301C06333F00;   // 2
    char_map_table[51] <= 64'h1E33301C30331E00;   // 3
    char_map_table[52] <= 64'h383C36337F307800;   // 4
    char_map_table[53] <= 64'h3F031F3030331E00;   // 5
    char_map_table[54] <= 64'h1C06031F33331E00;   // 6
    char_map_table[55] <= 64'h3F3330180C0C0C00;   // 7
    char_map_table[56] <= 64'h1E33331E33331E00;   // 8
    char_map_table[57] <= 64'h1E33333E30180E00;   // 9
    char_map_table[58] <= 64'h000C0C00000C0Cx00;   // :
    char_map_table[59] <= 64'h000C0C00000C0Cx06;   // //
    char_map_table[60] <= 64'h180C0603060C18x00;   // <
    char_map_table[61] <= 64'h00003F00003F00x00;   // =
    char_map_table[62] <= 64'h060C1830180C06x00;   // >
    char_map_table[63] <= 64'h1E3330180C000Cx00;   // ?
    char_map_table[64] <= 64'h3E637B7B7B031Ex00;   // @
    char_map_table[65] <= 64'h0C1E33333F333300;  // A
    char_map_table[66] <= 64'h3F66663E66663F00;  // B
    char_map_table[67] <= 64'h3C66030303663C00;  // C
    char_map_table[68] <= 64'h1F36666666361F00;  // D
    char_map_table[69] <= 64'h7F46161E16467F00;  // E
    char_map_table[70] <= 64'h7F46161E16060F00;  // F
    char_map_table[71] <= 64'h3C66030373667C00;  // G
    char_map_table[72] <= 64'h3333333F33333300;  // H
    char_map_table[73] <= 64'h1E0C0C0C0C0C1E00;  // I
    char_map_table[74] <= 64'h7830303033331E00;  // J
    char_map_table[75] <= 64'h6766361E36666700;  // K
    char_map_table[76] <= 64'h0F06060646667F00;  // L
    char_map_table[77] <= 64'h63777F7F6B636300;  // M
    char_map_table[78] <= 64'h63676F7B73636300;  // N
    char_map_table[79] <= 64'h1C36636363361C00;  // O
    char_map_table[80] <= 64'h3F66663E06060F00;  // P
    char_map_table[81] <= 64'h1E3333333B1E3800;  // Q
    char_map_table[82] <= 64'h3F66663E36666700;  // R
    char_map_table[83] <= 64'h1E33070E38331E00;  // S
    char_map_table[84] <= 64'h3F2D0C0C0C0C1E00;  // T
    char_map_table[85] <= 64'h3333333333333F00;  // U
    char_map_table[86] <= 64'h33333333331E0C00;  // V
    char_map_table[87] <= 64'h6363636B7F776300;  // W
    char_map_table[88] <= 64'h6363361C1C366300;  // X
    char_map_table[89] <= 64'h3333331E0C0C1E00;  // Y
    char_map_table[90] <= 64'h7F6331184C667F00;  // Z
    char_map_table[91] <= 64'h1E06060606061E00;   // [
    char_map_table[92] <= 64'h03060C1830604000;   // \
    char_map_table[93] <= 64'h1E18181818181E00;   // ]
    char_map_table[94] <= 64'h081C366300000000;   // ^
    char_map_table[95] <= 64'h00000000000000FF;   // _
    char_map_table[96] <= 64'h0C0C180000000000;   // `
    char_map_table[97] <= 64'h00001E303E336E00;      //  a
    char_map_table[98] <= 64'h0706063E66663B00;      //  b
    char_map_table[99] <= 64'h00001E3303331E00;      //  c
    char_map_table[100] <= 64'h3830303e33336E00;     //  d
    char_map_table[101] <= 64'h00001E333f031E00;     //  e
    char_map_table[102] <= 64'h1C36060f06060F00;     //  f
    char_map_table[103] <= 64'h00006E33333E301F;     //  g
    char_map_table[104] <= 64'h0706366E66666700;     //  h
    char_map_table[105] <= 64'h0C000E0C0C0C1E00;     //  i
    char_map_table[106] <= 64'h300030303033331E;     //  j
    char_map_table[107] <= 64'h070666361E366700;     //  k
    char_map_table[108] <= 64'h0E0C0C0C0C0C1E00;     //  l
    char_map_table[109] <= 64'h0000337F7F6B6300;     //  m
    char_map_table[110] <= 64'h00001F3333333300;     //  n
    char_map_table[111] <= 64'h00001E3333331E00;     //  o
    char_map_table[112] <= 64'h00003B66663E060F;     //  p
    char_map_table[113] <= 64'h00006E33333E3078;     //  q
    char_map_table[114] <= 64'h00003B6E66060F00;     //  r
    char_map_table[115] <= 64'h00003E031E301F00;     //  s
    char_map_table[116] <= 64'h080C3E0C0C2C1800;     //  t
    char_map_table[117] <= 64'h0000333333336E00;     //  u
    char_map_table[118] <= 64'h00003333331E0C00;     //  v
    char_map_table[119] <= 64'h0000636B7F7F3600;     //  w
    char_map_table[120] <= 64'h000063361C366300;     //  x
    char_map_table[121] <= 64'h00003333333E301F;     //  y
    char_map_table[122] <= 64'h00003F190C263F00;     //  z
    char_map_table[123] <= 64'h380C0C070C0C3800;   //  {
    char_map_table[124] <= 64'h1818180018181800;   //  |
    char_map_table[125] <= 64'h070C0C380C0C0700;   //  }
    char_map_table[126] <= 64'h6E3B000000000000;   //  ~
    char_map_table[127] <= 64'h0000000000000000;   // 
end



endmodule