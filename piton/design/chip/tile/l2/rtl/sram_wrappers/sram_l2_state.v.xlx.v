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

module sram_l2_state
(
input wire MEMCLK,
input wire RESET_N,
input wire CEA,

`ifdef L2_32K_4WAY
   input wire [6:0] AA,
   input wire [6:0] AB,
`else    // assume 64K in other case
   input wire [7:0] AA,
   input wire [7:0] AB,
`endif

input wire RDWENA,
input wire CEB,
input wire RDWENB,
input wire [65:0] BWA,
input wire [65:0] DINA,
output wire [65:0] DOUTA,
input wire [65:0] BWB,
input wire [65:0] DINB,
output wire [65:0] DOUTB,
input wire [`BIST_OP_WIDTH-1:0] BIST_COMMAND,
input wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] BIST_DIN,
output reg [`SRAM_WRAPPER_BUS_WIDTH-1:0] BIST_DOUT,
input wire [`BIST_ID_WIDTH-1:0] SRAMID
);

reg            write_en_muxed;
reg   [21:0]   wen_mask_muxed;
reg   [175:0]  data_in_muxed;
reg   [7:0]    AB_muxed;

wire           write_en;
wire           read_en;
wire  [21:0]   wen_mask;
wire  [175:0]  data_in;
wire  [175:0]  data_out;

assign write_en   = CEB & (RDWENB == 1'b0);
assign read_en    = CEA & (RDWENA == 1'b1);

// for BWB next bits are the same:
// 2b, 4b, {2,2,1,4,6}x4
assign wen_mask   = {BWB[64],BWB[60],
                     BWB[58],BWB[56],BWB[55],BWB[51],BWB[45],
                     BWB[43],BWB[41],BWB[40],BWB[36],BWB[30],
                     BWB[28],BWB[26],BWB[25],BWB[21],BWB[15],
                     BWB[13],BWB[11],BWB[10],BWB[6], BWB[0]   };

assign data_in    = {6'b0,DINB[65:64],4'b0,DINB[63:60],
                     6'b0,DINB[59:58],6'b0,DINB[57:56],7'b0,DINB[55],4'b0,DINB[54:51],2'b0,DINB[50:45],
                     6'b0,DINB[44:43],6'b0,DINB[42:41],7'b0,DINB[40],4'b0,DINB[39:36],2'b0,DINB[35:30],
                     6'b0,DINB[29:28],6'b0,DINB[27:26],7'b0,DINB[25],4'b0,DINB[24:21],2'b0,DINB[20:15],
                     6'b0,DINB[14:13],6'b0,DINB[12:11],7'b0,DINB[10],4'b0,DINB[9:6],  2'b0,DINB[5:0]};

assign DOUTA      = {data_out[169:168],data_out[163:160],
                     data_out[153:152],data_out[145:144],data_out[136],data_out[131:128],data_out[125:120],
                     data_out[113:112],data_out[105:104],data_out[96], data_out[91:88],  data_out[85:80  ],
                     data_out[73:72],  data_out[65:64],  data_out[56], data_out[51:48],  data_out[45:40  ],
                     data_out[33:32],  data_out[25:24],  data_out[16], data_out[11:8],   data_out[5:0    ] };

always @*
   BIST_DOUT = {`SRAM_WRAPPER_BUS_WIDTH{1'b0}};

`ifdef L2_32K_4WAY
   bram_2p_128x176 mem ( // for 32k L2
`else 
   bram_2p_256x176 mem ( // 64K L2
`endif
   .clka    (MEMCLK     ),
   .ena     (write_en_muxed   ),
   .wea     (wen_mask_muxed   ),
   .addra   (AB_muxed         ),
   .dina    (data_in_muxed    ),
   .douta   (           ),
  
   .clkb    (MEMCLK     ),
   .enb     (read_en    ),
   .web     ({22{1'b0}} ),   // added because us DRC error 23-20
   .addrb   (AA         ),
   .dinb    ({176{1'b0}}),
   .doutb   (data_out   )
);


localparam INIT_STATE = 1'd0;
localparam DONE_STATE  = 1'd1;

localparam INDEX_WIDTH = 8;
localparam DATA_WIDTH = 66;

reg [INDEX_WIDTH-1:0] bist_index;
reg [INDEX_WIDTH-1:0] bist_index_next;
reg init_done;
reg init_done_next;

always @ (posedge MEMCLK)
begin
   if (!RESET_N)
   begin
      bist_index <= 0;
      init_done <= 0;
   end
   else
   begin
      bist_index <= bist_index_next;
      init_done <= init_done_next;
   end
end

always @ *
begin
   bist_index_next = init_done ? bist_index : bist_index + 1;
   init_done_next = ((|(~bist_index)) == 0) | init_done;
end

always @ *
begin
   if (!init_done)
   begin
      write_en_muxed = 1'b1;
      wen_mask_muxed = ~(22'b0);
      data_in_muxed = 176'b0;
      AB_muxed = bist_index;
   end
   else
   begin
      write_en_muxed = write_en;
      wen_mask_muxed = wen_mask;
      data_in_muxed = data_in;
      AB_muxed = AB;
   end
end

endmodule
