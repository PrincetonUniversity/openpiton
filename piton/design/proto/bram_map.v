/*
Copyright (c) 2015 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

//-----------------------------------------
// Auto generated mapping module
//-----------------------------------------
 module bram_map #(parameter MEM_ADDR_WIDTH=64, PHY_ADDR_WIDTH=40, BRAM_ADDR_WIDTH=12)
(
    input       [PHY_ADDR_WIDTH-1:0]    msg_addr,
    
    output      [BRAM_ADDR_WIDTH-1:0]   bram_blk_addr,
    output                              hit_any_section
);

wire [63:0]                      bram_addr_0;
wire [63:0]                      bram_addr_1;
wire [63:0]                      bram_addr_2;
wire [63:0]                      bram_addr_3;
wire [63:0]                      bram_addr_4;
wire [63:0]                      bram_addr_5;
wire [63:0]                      bram_addr_6;
wire [63:0]                      bram_addr_7;
wire [63:0]                      bram_addr_8;
wire [63:0]                      bram_addr_9;
wire [63:0]                      bram_addr_10;
wire [63:0]                      bram_addr_11;
wire [63:0]                      bram_addr_12;
wire [63:0]                      bram_addr_13;
wire [63:0]                      bram_addr_14;
wire [63:0]                      bram_addr_15;
wire [63:0]                      bram_addr_16;
wire [63:0]                      bram_addr_17;
wire [63:0]                      bram_addr_18;
wire [63:0]                      bram_addr_19;
wire [63:0]                      bram_addr_20;
wire [63:0]                      bram_addr_21;
wire [63:0]                      bram_addr_22;
wire [63:0]                      bram_addr_23;

wire                          in_section_0;
wire                          in_section_1;
wire                          in_section_2;
wire                          in_section_3;
wire                          in_section_4;
wire                          in_section_5;
wire                          in_section_6;
wire                          in_section_7;
wire                          in_section_8;
wire                          in_section_9;
wire                          in_section_10;
wire                          in_section_11;
wire                          in_section_12;
wire                          in_section_13;
wire                          in_section_14;
wire                          in_section_15;
wire                          in_section_16;
wire                          in_section_17;
wire                          in_section_18;
wire                          in_section_19;
wire                          in_section_20;
wire                          in_section_21;
wire                          in_section_22;
wire                          in_section_23;

assign bram_addr_0 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'hfff0000000) >> 6) + 0;
assign bram_addr_1 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'hfff0000380) >> 6) + 1;
assign bram_addr_2 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'h400c0) >> 6) + 3;
assign bram_addr_3 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'h4c000) >> 6) + 11;
assign bram_addr_4 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'h4c400) >> 6) + 12;
assign bram_addr_5 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'h1000900) >> 6) + 15;
assign bram_addr_6 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'h80c80) >> 6) + 20;
assign bram_addr_7 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'h84180) >> 6) + 21;
assign bram_addr_8 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'h1100144000) >> 6) + 23;
assign bram_addr_9 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'h1000180) >> 6) + 24;
assign bram_addr_10 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'h1101834000) >> 6) + 25;
assign bram_addr_11 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'h10001225c0) >> 6) + 28;
assign bram_addr_12 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'h83140) >> 6) + 29;
assign bram_addr_13 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'h84340) >> 6) + 32;
assign bram_addr_14 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'h80d00) >> 6) + 36;
assign bram_addr_15 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'h5002180) >> 6) + 37;
assign bram_addr_16 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'h1101c34000) >> 6) + 38;
assign bram_addr_17 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'h1000122540) >> 6) + 39;
assign bram_addr_18 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'h2000000) >> 6) + 40;
assign bram_addr_19 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'h1130000000) >> 6) + 41;
assign bram_addr_20 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'h6000000) >> 6) + 43;
assign bram_addr_21 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'h1170000000) >> 6) + 44;
assign bram_addr_22 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'h1000122000) >> 6) + 46;
assign bram_addr_23 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'h807c0) >> 6) + 47;

assign in_section_0 = (msg_addr >= 64'hfff0000000) & (msg_addr < 64'hfff0000040);
assign in_section_1 = (msg_addr >= 64'hfff0000380) & (msg_addr < 64'hfff0000400);
assign in_section_2 = (msg_addr >= 64'h400c0) & (msg_addr < 64'h402c0);
assign in_section_3 = (msg_addr >= 64'h4c000) & (msg_addr < 64'h4c040);
assign in_section_4 = (msg_addr >= 64'h4c400) & (msg_addr < 64'h4c4c0);
assign in_section_5 = (msg_addr >= 64'h1000900) & (msg_addr < 64'h1000a40);
assign in_section_6 = (msg_addr >= 64'h80c80) & (msg_addr < 64'h80cc0);
assign in_section_7 = (msg_addr >= 64'h84180) & (msg_addr < 64'h84200);
assign in_section_8 = (msg_addr >= 64'h1100144000) & (msg_addr < 64'h1100144040);
assign in_section_9 = (msg_addr >= 64'h1000180) & (msg_addr < 64'h10001c0);
assign in_section_10 = (msg_addr >= 64'h1101834000) & (msg_addr < 64'h11018340c0);
assign in_section_11 = (msg_addr >= 64'h10001225c0) & (msg_addr < 64'h1000122600);
assign in_section_12 = (msg_addr >= 64'h83140) & (msg_addr < 64'h83200);
assign in_section_13 = (msg_addr >= 64'h84340) & (msg_addr < 64'h84440);
assign in_section_14 = (msg_addr >= 64'h80d00) & (msg_addr < 64'h80d40);
assign in_section_15 = (msg_addr >= 64'h5002180) & (msg_addr < 64'h50021c0);
assign in_section_16 = (msg_addr >= 64'h1101c34000) & (msg_addr < 64'h1101c34040);
assign in_section_17 = (msg_addr >= 64'h1000122540) & (msg_addr < 64'h1000122580);
assign in_section_18 = (msg_addr >= 64'h2000000) & (msg_addr < 64'h2000040);
assign in_section_19 = (msg_addr >= 64'h1130000000) & (msg_addr < 64'h1130000080);
assign in_section_20 = (msg_addr >= 64'h6000000) & (msg_addr < 64'h6000040);
assign in_section_21 = (msg_addr >= 64'h1170000000) & (msg_addr < 64'h1170000080);
assign in_section_22 = (msg_addr >= 64'h1000122000) & (msg_addr < 64'h1000122040);
assign in_section_23 = (msg_addr >= 64'h807c0) & (msg_addr < 64'h80800);

assign bram_blk_addr =
({BRAM_ADDR_WIDTH{in_section_0}} & bram_addr_0[BRAM_ADDR_WIDTH-1:0])|
({BRAM_ADDR_WIDTH{in_section_1}} & bram_addr_1[BRAM_ADDR_WIDTH-1:0])|
({BRAM_ADDR_WIDTH{in_section_2}} & bram_addr_2[BRAM_ADDR_WIDTH-1:0])|
({BRAM_ADDR_WIDTH{in_section_3}} & bram_addr_3[BRAM_ADDR_WIDTH-1:0])|
({BRAM_ADDR_WIDTH{in_section_4}} & bram_addr_4[BRAM_ADDR_WIDTH-1:0])|
({BRAM_ADDR_WIDTH{in_section_5}} & bram_addr_5[BRAM_ADDR_WIDTH-1:0])|
({BRAM_ADDR_WIDTH{in_section_6}} & bram_addr_6[BRAM_ADDR_WIDTH-1:0])|
({BRAM_ADDR_WIDTH{in_section_7}} & bram_addr_7[BRAM_ADDR_WIDTH-1:0])|
({BRAM_ADDR_WIDTH{in_section_8}} & bram_addr_8[BRAM_ADDR_WIDTH-1:0])|
({BRAM_ADDR_WIDTH{in_section_9}} & bram_addr_9[BRAM_ADDR_WIDTH-1:0])|
({BRAM_ADDR_WIDTH{in_section_10}} & bram_addr_10[BRAM_ADDR_WIDTH-1:0])|
({BRAM_ADDR_WIDTH{in_section_11}} & bram_addr_11[BRAM_ADDR_WIDTH-1:0])|
({BRAM_ADDR_WIDTH{in_section_12}} & bram_addr_12[BRAM_ADDR_WIDTH-1:0])|
({BRAM_ADDR_WIDTH{in_section_13}} & bram_addr_13[BRAM_ADDR_WIDTH-1:0])|
({BRAM_ADDR_WIDTH{in_section_14}} & bram_addr_14[BRAM_ADDR_WIDTH-1:0])|
({BRAM_ADDR_WIDTH{in_section_15}} & bram_addr_15[BRAM_ADDR_WIDTH-1:0])|
({BRAM_ADDR_WIDTH{in_section_16}} & bram_addr_16[BRAM_ADDR_WIDTH-1:0])|
({BRAM_ADDR_WIDTH{in_section_17}} & bram_addr_17[BRAM_ADDR_WIDTH-1:0])|
({BRAM_ADDR_WIDTH{in_section_18}} & bram_addr_18[BRAM_ADDR_WIDTH-1:0])|
({BRAM_ADDR_WIDTH{in_section_19}} & bram_addr_19[BRAM_ADDR_WIDTH-1:0])|
({BRAM_ADDR_WIDTH{in_section_20}} & bram_addr_20[BRAM_ADDR_WIDTH-1:0])|
({BRAM_ADDR_WIDTH{in_section_21}} & bram_addr_21[BRAM_ADDR_WIDTH-1:0])|
({BRAM_ADDR_WIDTH{in_section_22}} & bram_addr_22[BRAM_ADDR_WIDTH-1:0])|
({BRAM_ADDR_WIDTH{in_section_23}} & bram_addr_23[BRAM_ADDR_WIDTH-1:0]);

assign hit_any_section = 
in_section_0 |
in_section_1 |
in_section_2 |
in_section_3 |
in_section_4 |
in_section_5 |
in_section_6 |
in_section_7 |
in_section_8 |
in_section_9 |
in_section_10 |
in_section_11 |
in_section_12 |
in_section_13 |
in_section_14 |
in_section_15 |
in_section_16 |
in_section_17 |
in_section_18 |
in_section_19 |
in_section_20 |
in_section_21 |
in_section_22 |
in_section_23 ;

endmodule
//-----------------------------------------
// End of auto generated mapping
//-----------------------------------------
