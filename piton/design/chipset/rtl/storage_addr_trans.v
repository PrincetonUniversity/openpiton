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

//-----------------------------------------
// Auto generated mapping module
// It is provided for test: unknown 
//-----------------------------------------
 module storage_addr_trans #(parameter MEM_ADDR_WIDTH=64, VA_ADDR_WIDTH=40, STORAGE_ADDR_WIDTH=12)
(
    input       [VA_ADDR_WIDTH-1:0]         va_byte_addr,
    
    output      [STORAGE_ADDR_WIDTH-1:0]    storage_addr_out,
    output                                  hit_any_section
);

wire [63:0] storage_addr;

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
wire [63:0]                      bram_addr_24;
wire [63:0]                      bram_addr_25;
wire [63:0]                      bram_addr_26;
wire [63:0]                      bram_addr_27;
wire [63:0]                      bram_addr_28;
wire [63:0]                      bram_addr_29;
wire [63:0]                      bram_addr_30;
wire [63:0]                      bram_addr_31;
wire [63:0]                      bram_addr_32;
wire [63:0]                      bram_addr_33;
wire [63:0]                      bram_addr_34;
wire [63:0]                      bram_addr_35;
wire [63:0]                      bram_addr_36;
wire [63:0]                      bram_addr_37;
wire [63:0]                      bram_addr_38;
wire [63:0]                      bram_addr_39;
wire [63:0]                      bram_addr_40;
wire [63:0]                      bram_addr_41;
wire [63:0]                      bram_addr_42;
wire [63:0]                      bram_addr_43;
wire [63:0]                      bram_addr_44;
wire [63:0]                      bram_addr_45;
wire [63:0]                      bram_addr_46;
wire [63:0]                      bram_addr_47;
wire [63:0]                      bram_addr_48;
wire [63:0]                      bram_addr_49;
wire [63:0]                      bram_addr_50;
wire [63:0]                      bram_addr_51;
wire [63:0]                      bram_addr_52;
wire [63:0]                      bram_addr_53;
wire [63:0]                      bram_addr_54;
wire [63:0]                      bram_addr_55;
wire [63:0]                      bram_addr_56;
wire [63:0]                      bram_addr_57;
wire [63:0]                      bram_addr_58;
wire [63:0]                      bram_addr_59;
wire [63:0]                      bram_addr_60;
wire [63:0]                      bram_addr_61;
wire [63:0]                      bram_addr_62;
wire [63:0]                      bram_addr_63;
wire [63:0]                      bram_addr_64;
wire [63:0]                      bram_addr_65;
wire [63:0]                      bram_addr_66;
wire [63:0]                      bram_addr_67;
wire [63:0]                      bram_addr_68;
wire [63:0]                      bram_addr_69;
wire [63:0]                      bram_addr_70;
wire [63:0]                      bram_addr_71;
wire [63:0]                      bram_addr_72;
wire [63:0]                      bram_addr_73;
wire [63:0]                      bram_addr_74;
wire [63:0]                      bram_addr_75;
wire [63:0]                      bram_addr_76;
wire [63:0]                      bram_addr_77;
wire [63:0]                      bram_addr_78;
wire [63:0]                      bram_addr_79;
wire [63:0]                      bram_addr_80;
wire [63:0]                      bram_addr_81;
wire [63:0]                      bram_addr_82;
wire [63:0]                      bram_addr_83;
wire [63:0]                      bram_addr_84;
wire [63:0]                      bram_addr_85;
wire [63:0]                      bram_addr_86;
wire [63:0]                      bram_addr_87;
wire [63:0]                      bram_addr_88;
wire [63:0]                      bram_addr_89;
wire [63:0]                      bram_addr_90;
wire [63:0]                      bram_addr_91;
wire [63:0]                      bram_addr_92;
wire [63:0]                      bram_addr_93;
wire [63:0]                      bram_addr_94;
wire [63:0]                      bram_addr_95;
wire [63:0]                      bram_addr_96;
wire [63:0]                      bram_addr_97;
wire [63:0]                      bram_addr_98;
wire [63:0]                      bram_addr_99;
wire [63:0]                      bram_addr_100;
wire [63:0]                      bram_addr_101;
wire [63:0]                      bram_addr_102;
wire [63:0]                      bram_addr_103;
wire [63:0]                      bram_addr_104;
wire [63:0]                      bram_addr_105;
wire [63:0]                      bram_addr_106;
wire [63:0]                      bram_addr_107;
wire [63:0]                      bram_addr_108;
wire [63:0]                      bram_addr_109;
wire [63:0]                      bram_addr_110;
wire [63:0]                      bram_addr_111;
wire [63:0]                      bram_addr_112;
wire [63:0]                      bram_addr_113;
wire [63:0]                      bram_addr_114;
wire [63:0]                      bram_addr_115;
wire [63:0]                      bram_addr_116;
wire [63:0]                      bram_addr_117;
wire [63:0]                      bram_addr_118;
wire [63:0]                      bram_addr_119;
wire [63:0]                      bram_addr_120;
wire [63:0]                      bram_addr_121;
wire [63:0]                      bram_addr_122;
wire [63:0]                      bram_addr_123;
wire [63:0]                      bram_addr_124;
wire [63:0]                      bram_addr_125;
wire [63:0]                      bram_addr_126;
wire [63:0]                      bram_addr_127;
wire [63:0]                      bram_addr_128;
wire [63:0]                      bram_addr_129;
wire [63:0]                      bram_addr_130;
wire [63:0]                      bram_addr_131;
wire [63:0]                      bram_addr_132;
wire [63:0]                      bram_addr_133;
wire [63:0]                      bram_addr_134;
wire [63:0]                      bram_addr_135;
wire [63:0]                      bram_addr_136;
wire [63:0]                      bram_addr_137;
wire [63:0]                      bram_addr_138;
wire [63:0]                      bram_addr_139;
wire [63:0]                      bram_addr_140;
wire [63:0]                      bram_addr_141;
wire [63:0]                      bram_addr_142;
wire [63:0]                      bram_addr_143;
wire [63:0]                      bram_addr_144;
wire [63:0]                      bram_addr_145;
wire [63:0]                      bram_addr_146;
wire [63:0]                      bram_addr_147;
wire [63:0]                      bram_addr_148;
wire [63:0]                      bram_addr_149;

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
wire                          in_section_24;
wire                          in_section_25;
wire                          in_section_26;
wire                          in_section_27;
wire                          in_section_28;
wire                          in_section_29;
wire                          in_section_30;
wire                          in_section_31;
wire                          in_section_32;
wire                          in_section_33;
wire                          in_section_34;
wire                          in_section_35;
wire                          in_section_36;
wire                          in_section_37;
wire                          in_section_38;
wire                          in_section_39;
wire                          in_section_40;
wire                          in_section_41;
wire                          in_section_42;
wire                          in_section_43;
wire                          in_section_44;
wire                          in_section_45;
wire                          in_section_46;
wire                          in_section_47;
wire                          in_section_48;
wire                          in_section_49;
wire                          in_section_50;
wire                          in_section_51;
wire                          in_section_52;
wire                          in_section_53;
wire                          in_section_54;
wire                          in_section_55;
wire                          in_section_56;
wire                          in_section_57;
wire                          in_section_58;
wire                          in_section_59;
wire                          in_section_60;
wire                          in_section_61;
wire                          in_section_62;
wire                          in_section_63;
wire                          in_section_64;
wire                          in_section_65;
wire                          in_section_66;
wire                          in_section_67;
wire                          in_section_68;
wire                          in_section_69;
wire                          in_section_70;
wire                          in_section_71;
wire                          in_section_72;
wire                          in_section_73;
wire                          in_section_74;
wire                          in_section_75;
wire                          in_section_76;
wire                          in_section_77;
wire                          in_section_78;
wire                          in_section_79;
wire                          in_section_80;
wire                          in_section_81;
wire                          in_section_82;
wire                          in_section_83;
wire                          in_section_84;
wire                          in_section_85;
wire                          in_section_86;
wire                          in_section_87;
wire                          in_section_88;
wire                          in_section_89;
wire                          in_section_90;
wire                          in_section_91;
wire                          in_section_92;
wire                          in_section_93;
wire                          in_section_94;
wire                          in_section_95;
wire                          in_section_96;
wire                          in_section_97;
wire                          in_section_98;
wire                          in_section_99;
wire                          in_section_100;
wire                          in_section_101;
wire                          in_section_102;
wire                          in_section_103;
wire                          in_section_104;
wire                          in_section_105;
wire                          in_section_106;
wire                          in_section_107;
wire                          in_section_108;
wire                          in_section_109;
wire                          in_section_110;
wire                          in_section_111;
wire                          in_section_112;
wire                          in_section_113;
wire                          in_section_114;
wire                          in_section_115;
wire                          in_section_116;
wire                          in_section_117;
wire                          in_section_118;
wire                          in_section_119;
wire                          in_section_120;
wire                          in_section_121;
wire                          in_section_122;
wire                          in_section_123;
wire                          in_section_124;
wire                          in_section_125;
wire                          in_section_126;
wire                          in_section_127;
wire                          in_section_128;
wire                          in_section_129;
wire                          in_section_130;
wire                          in_section_131;
wire                          in_section_132;
wire                          in_section_133;
wire                          in_section_134;
wire                          in_section_135;
wire                          in_section_136;
wire                          in_section_137;
wire                          in_section_138;
wire                          in_section_139;
wire                          in_section_140;
wire                          in_section_141;
wire                          in_section_142;
wire                          in_section_143;
wire                          in_section_144;
wire                          in_section_145;
wire                          in_section_146;
wire                          in_section_147;
wire                          in_section_148;
wire                          in_section_149;

assign bram_addr_0 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h40000) >> 5) + 0;
assign bram_addr_1 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h4c000) >> 5) + 60;
assign bram_addr_2 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h80000) >> 5) + 128;
assign bram_addr_3 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h8c000) >> 5) + 1152;
assign bram_addr_4 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h100000) >> 5) + 5282;
assign bram_addr_5 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h150000) >> 5) + 5794;
assign bram_addr_6 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h180000) >> 5) + 7074;
assign bram_addr_7 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h190000) >> 5) + 7330;
assign bram_addr_8 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1b0000) >> 5) + 7332;
assign bram_addr_9 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h250000) >> 5) + 7364;
assign bram_addr_10 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h258000) >> 5) + 7370;
assign bram_addr_11 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h260000) >> 5) + 7376;
assign bram_addr_12 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h268000) >> 5) + 7382;
assign bram_addr_13 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h300000) >> 5) + 7388;
assign bram_addr_14 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h500000) >> 5) + 7900;
assign bram_addr_15 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h700000) >> 5) + 8412;
assign bram_addr_16 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1000000) >> 5) + 8924;
assign bram_addr_17 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1000800) >> 5) + 8940;
assign bram_addr_18 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1001800) >> 5) + 8962;
assign bram_addr_19 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1002800) >> 5) + 8964;
assign bram_addr_20 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1003800) >> 5) + 8966;
assign bram_addr_21 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1600000) >> 5) + 8968;
assign bram_addr_22 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h2000000) >> 5) + 9002;
assign bram_addr_23 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h2001a80) >> 5) + 9152;
assign bram_addr_24 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h2003fc0) >> 5) + 9154;
assign bram_addr_25 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h3006000) >> 5) + 9156;
assign bram_addr_26 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h3008000) >> 5) + 9162;
assign bram_addr_27 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h5000000) >> 5) + 9164;
assign bram_addr_28 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h5000780) >> 5) + 9174;
assign bram_addr_29 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h5001280) >> 5) + 9216;
assign bram_addr_30 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h5001880) >> 5) + 9224;
assign bram_addr_31 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h5002180) >> 5) + 9246;
assign bram_addr_32 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h6000000) >> 5) + 9250;
assign bram_addr_33 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h6001280) >> 5) + 9352;
assign bram_addr_34 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h6002180) >> 5) + 9430;
assign bram_addr_35 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h6003fc0) >> 5) + 9434;
assign bram_addr_36 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h8000000) >> 5) + 9436;
assign bram_addr_37 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h13002000) >> 5) + 9438;
assign bram_addr_38 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h13006000) >> 5) + 9448;
assign bram_addr_39 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h20000000) >> 5) + 9454;
assign bram_addr_40 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h20006000) >> 5) + 9966;
assign bram_addr_41 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h20008000) >> 5) + 9970;
assign bram_addr_42 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h40008000) >> 5) + 9972;
assign bram_addr_43 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h40010000) >> 5) + 10036;
assign bram_addr_44 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h41000000) >> 5) + 10040;
assign bram_addr_45 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h60000000) >> 5) + 10042;
assign bram_addr_46 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h100188000) >> 5) + 26938;
assign bram_addr_47 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h100250000) >> 5) + 26940;
assign bram_addr_48 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h100260000) >> 5) + 26942;
assign bram_addr_49 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1002a0000) >> 5) + 26944;
assign bram_addr_50 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1002a8000) >> 5) + 26946;
assign bram_addr_51 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1002c0000) >> 5) + 26948;
assign bram_addr_52 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1002c8000) >> 5) + 26950;
assign bram_addr_53 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h100350000) >> 5) + 26952;
assign bram_addr_54 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h100360000) >> 5) + 26954;
assign bram_addr_55 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h100380000) >> 5) + 26956;
assign bram_addr_56 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1005b0000) >> 5) + 26958;
assign bram_addr_57 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h100780000) >> 5) + 26960;
assign bram_addr_58 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h110000000) >> 5) + 26962;
assign bram_addr_59 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h120000000) >> 5) + 26964;
assign bram_addr_60 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1000000000) >> 5) + 26966;
assign bram_addr_61 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1000120000) >> 5) + 26968;
assign bram_addr_62 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1000150000) >> 5) + 32712;
assign bram_addr_63 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1000160000) >> 5) + 33736;
assign bram_addr_64 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1000180000) >> 5) + 33738;
assign bram_addr_65 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1000250000) >> 5) + 33994;
assign bram_addr_66 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1000258000) >> 5) + 34000;
assign bram_addr_67 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1000260000) >> 5) + 34006;
assign bram_addr_68 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1000268000) >> 5) + 34012;
assign bram_addr_69 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1000310000) >> 5) + 34018;
assign bram_addr_70 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1001100000) >> 5) + 34020;
assign bram_addr_71 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1001300000) >> 5) + 34532;
assign bram_addr_72 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1001500000) >> 5) + 35044;
assign bram_addr_73 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1001700000) >> 5) + 35556;
assign bram_addr_74 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1003000000) >> 5) + 36068;
assign bram_addr_75 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1003006000) >> 5) + 36070;
assign bram_addr_76 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1003008000) >> 5) + 36072;
assign bram_addr_77 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1004000000) >> 5) + 36074;
assign bram_addr_78 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1010160000) >> 5) + 36076;
assign bram_addr_79 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1013004000) >> 5) + 52460;
assign bram_addr_80 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1020006000) >> 5) + 52972;
assign bram_addr_81 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1020008000) >> 5) + 52976;
assign bram_addr_82 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h102000c000) >> 5) + 53232;
assign bram_addr_83 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1020018000) >> 5) + 53238;
assign bram_addr_84 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h102001a000) >> 5) + 53240;
assign bram_addr_85 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h102001c000) >> 5) + 53242;
assign bram_addr_86 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1040000000) >> 5) + 53498;
assign bram_addr_87 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1040008000) >> 5) + 53504;
assign bram_addr_88 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1040018000) >> 5) + 53568;
assign bram_addr_89 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1041000000) >> 5) + 54080;
assign bram_addr_90 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1070000000) >> 5) + 54082;
assign bram_addr_91 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100144000) >> 5) + 54338;
assign bram_addr_92 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100150000) >> 5) + 54340;
assign bram_addr_93 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100160000) >> 5) + 54376;
assign bram_addr_94 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100170000) >> 5) + 54380;
assign bram_addr_95 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100180000) >> 5) + 54404;
assign bram_addr_96 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100190000) >> 5) + 54408;
assign bram_addr_97 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100250000) >> 5) + 54412;
assign bram_addr_98 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100258000) >> 5) + 54414;
assign bram_addr_99 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100260000) >> 5) + 54416;
assign bram_addr_100 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100268000) >> 5) + 54418;
assign bram_addr_101 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100270000) >> 5) + 54420;
assign bram_addr_102 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100278000) >> 5) + 54422;
assign bram_addr_103 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100280000) >> 5) + 54424;
assign bram_addr_104 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100288000) >> 5) + 54426;
assign bram_addr_105 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100290000) >> 5) + 54428;
assign bram_addr_106 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100298000) >> 5) + 54430;
assign bram_addr_107 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h11002a0000) >> 5) + 54432;
assign bram_addr_108 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h11002a8000) >> 5) + 54434;
assign bram_addr_109 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h11002b0000) >> 5) + 54436;
assign bram_addr_110 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h11002b8000) >> 5) + 54438;
assign bram_addr_111 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h11002c0000) >> 5) + 54440;
assign bram_addr_112 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h11002c8000) >> 5) + 54442;
assign bram_addr_113 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h11002d0000) >> 5) + 54444;
assign bram_addr_114 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h11002d8000) >> 5) + 54446;
assign bram_addr_115 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h11002e0000) >> 5) + 54448;
assign bram_addr_116 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h11002e8000) >> 5) + 54450;
assign bram_addr_117 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h11002f0000) >> 5) + 54452;
assign bram_addr_118 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h11002f8000) >> 5) + 54454;
assign bram_addr_119 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100300000) >> 5) + 54456;
assign bram_addr_120 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100308000) >> 5) + 54458;
assign bram_addr_121 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100310000) >> 5) + 54460;
assign bram_addr_122 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100318000) >> 5) + 54462;
assign bram_addr_123 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100320000) >> 5) + 54464;
assign bram_addr_124 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100328000) >> 5) + 54466;
assign bram_addr_125 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100330000) >> 5) + 54468;
assign bram_addr_126 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100338000) >> 5) + 54470;
assign bram_addr_127 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100340000) >> 5) + 54472;
assign bram_addr_128 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100348000) >> 5) + 54474;
assign bram_addr_129 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100350000) >> 5) + 54476;
assign bram_addr_130 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100358000) >> 5) + 54478;
assign bram_addr_131 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100360000) >> 5) + 54480;
assign bram_addr_132 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100368000) >> 5) + 54482;
assign bram_addr_133 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100370000) >> 5) + 54484;
assign bram_addr_134 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h11005b0000) >> 5) + 54486;
assign bram_addr_135 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1100780000) >> 5) + 54488;
assign bram_addr_136 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1101834000) >> 5) + 54490;
assign bram_addr_137 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1101c34000) >> 5) + 54502;
assign bram_addr_138 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1103000000) >> 5) + 54550;
assign bram_addr_139 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1104000000) >> 5) + 54552;
assign bram_addr_140 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1106000000) >> 5) + 54554;
assign bram_addr_141 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1110000000) >> 5) + 54556;
assign bram_addr_142 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1120000000) >> 5) + 54558;
assign bram_addr_143 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1130000000) >> 5) + 54560;
assign bram_addr_144 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1170000000) >> 5) + 55584;
assign bram_addr_145 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1178020000) >> 5) + 72480;
assign bram_addr_146 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h1178030000) >> 5) + 72482;
assign bram_addr_147 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'hfff0000000) >> 5) + 72484;
assign bram_addr_148 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'hfff0002000) >> 5) + 72516;
assign bram_addr_149 = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'hfff0010000) >> 5) + 72518;

assign in_section_0 = (va_byte_addr >= 64'h40000) & (va_byte_addr < 64'h40780);
assign in_section_1 = (va_byte_addr >= 64'h4c000) & (va_byte_addr < 64'h4c880);
assign in_section_2 = (va_byte_addr >= 64'h80000) & (va_byte_addr < 64'h88000);
assign in_section_3 = (va_byte_addr >= 64'h8c000) & (va_byte_addr < 64'hac440);
assign in_section_4 = (va_byte_addr >= 64'h100000) & (va_byte_addr < 64'h104000);
assign in_section_5 = (va_byte_addr >= 64'h150000) & (va_byte_addr < 64'h15a000);
assign in_section_6 = (va_byte_addr >= 64'h180000) & (va_byte_addr < 64'h182000);
assign in_section_7 = (va_byte_addr >= 64'h190000) & (va_byte_addr < 64'h190040);
assign in_section_8 = (va_byte_addr >= 64'h1b0000) & (va_byte_addr < 64'h1b0400);
assign in_section_9 = (va_byte_addr >= 64'h250000) & (va_byte_addr < 64'h2500c0);
assign in_section_10 = (va_byte_addr >= 64'h258000) & (va_byte_addr < 64'h2580c0);
assign in_section_11 = (va_byte_addr >= 64'h260000) & (va_byte_addr < 64'h2600c0);
assign in_section_12 = (va_byte_addr >= 64'h268000) & (va_byte_addr < 64'h2680c0);
assign in_section_13 = (va_byte_addr >= 64'h300000) & (va_byte_addr < 64'h304000);
assign in_section_14 = (va_byte_addr >= 64'h500000) & (va_byte_addr < 64'h504000);
assign in_section_15 = (va_byte_addr >= 64'h700000) & (va_byte_addr < 64'h704000);
assign in_section_16 = (va_byte_addr >= 64'h1000000) & (va_byte_addr < 64'h1000200);
assign in_section_17 = (va_byte_addr >= 64'h1000800) & (va_byte_addr < 64'h1000ac0);
assign in_section_18 = (va_byte_addr >= 64'h1001800) & (va_byte_addr < 64'h1001840);
assign in_section_19 = (va_byte_addr >= 64'h1002800) & (va_byte_addr < 64'h1002840);
assign in_section_20 = (va_byte_addr >= 64'h1003800) & (va_byte_addr < 64'h1003840);
assign in_section_21 = (va_byte_addr >= 64'h1600000) & (va_byte_addr < 64'h1600440);
assign in_section_22 = (va_byte_addr >= 64'h2000000) & (va_byte_addr < 64'h20012c0);
assign in_section_23 = (va_byte_addr >= 64'h2001a80) & (va_byte_addr < 64'h2001ac0);
assign in_section_24 = (va_byte_addr >= 64'h2003fc0) & (va_byte_addr < 64'h2004000);
assign in_section_25 = (va_byte_addr >= 64'h3006000) & (va_byte_addr < 64'h30060c0);
assign in_section_26 = (va_byte_addr >= 64'h3008000) & (va_byte_addr < 64'h3008040);
assign in_section_27 = (va_byte_addr >= 64'h5000000) & (va_byte_addr < 64'h5000140);
assign in_section_28 = (va_byte_addr >= 64'h5000780) & (va_byte_addr < 64'h5000cc0);
assign in_section_29 = (va_byte_addr >= 64'h5001280) & (va_byte_addr < 64'h5001380);
assign in_section_30 = (va_byte_addr >= 64'h5001880) & (va_byte_addr < 64'h5001b40);
assign in_section_31 = (va_byte_addr >= 64'h5002180) & (va_byte_addr < 64'h5002200);
assign in_section_32 = (va_byte_addr >= 64'h6000000) & (va_byte_addr < 64'h6000cc0);
assign in_section_33 = (va_byte_addr >= 64'h6001280) & (va_byte_addr < 64'h6001c40);
assign in_section_34 = (va_byte_addr >= 64'h6002180) & (va_byte_addr < 64'h6002200);
assign in_section_35 = (va_byte_addr >= 64'h6003fc0) & (va_byte_addr < 64'h6004000);
assign in_section_36 = (va_byte_addr >= 64'h8000000) & (va_byte_addr < 64'h8000040);
assign in_section_37 = (va_byte_addr >= 64'h13002000) & (va_byte_addr < 64'h13002140);
assign in_section_38 = (va_byte_addr >= 64'h13006000) & (va_byte_addr < 64'h130060c0);
assign in_section_39 = (va_byte_addr >= 64'h20000000) & (va_byte_addr < 64'h20004000);
assign in_section_40 = (va_byte_addr >= 64'h20006000) & (va_byte_addr < 64'h20006080);
assign in_section_41 = (va_byte_addr >= 64'h20008000) & (va_byte_addr < 64'h20008040);
assign in_section_42 = (va_byte_addr >= 64'h40008000) & (va_byte_addr < 64'h40008800);
assign in_section_43 = (va_byte_addr >= 64'h40010000) & (va_byte_addr < 64'h40010080);
assign in_section_44 = (va_byte_addr >= 64'h41000000) & (va_byte_addr < 64'h41000040);
assign in_section_45 = (va_byte_addr >= 64'h60000000) & (va_byte_addr < 64'h60084000);
assign in_section_46 = (va_byte_addr >= 64'h100188000) & (va_byte_addr < 64'h100188040);
assign in_section_47 = (va_byte_addr >= 64'h100250000) & (va_byte_addr < 64'h100250040);
assign in_section_48 = (va_byte_addr >= 64'h100260000) & (va_byte_addr < 64'h100260040);
assign in_section_49 = (va_byte_addr >= 64'h1002a0000) & (va_byte_addr < 64'h1002a0040);
assign in_section_50 = (va_byte_addr >= 64'h1002a8000) & (va_byte_addr < 64'h1002a8040);
assign in_section_51 = (va_byte_addr >= 64'h1002c0000) & (va_byte_addr < 64'h1002c0040);
assign in_section_52 = (va_byte_addr >= 64'h1002c8000) & (va_byte_addr < 64'h1002c8040);
assign in_section_53 = (va_byte_addr >= 64'h100350000) & (va_byte_addr < 64'h100350040);
assign in_section_54 = (va_byte_addr >= 64'h100360000) & (va_byte_addr < 64'h100360040);
assign in_section_55 = (va_byte_addr >= 64'h100380000) & (va_byte_addr < 64'h100380040);
assign in_section_56 = (va_byte_addr >= 64'h1005b0000) & (va_byte_addr < 64'h1005b0040);
assign in_section_57 = (va_byte_addr >= 64'h100780000) & (va_byte_addr < 64'h100780040);
assign in_section_58 = (va_byte_addr >= 64'h110000000) & (va_byte_addr < 64'h110000040);
assign in_section_59 = (va_byte_addr >= 64'h120000000) & (va_byte_addr < 64'h120000040);
assign in_section_60 = (va_byte_addr >= 64'h1000000000) & (va_byte_addr < 64'h1000000040);
assign in_section_61 = (va_byte_addr >= 64'h1000120000) & (va_byte_addr < 64'h100014ce00);
assign in_section_62 = (va_byte_addr >= 64'h1000150000) & (va_byte_addr < 64'h1000158000);
assign in_section_63 = (va_byte_addr >= 64'h1000160000) & (va_byte_addr < 64'h1000160040);
assign in_section_64 = (va_byte_addr >= 64'h1000180000) & (va_byte_addr < 64'h1000182000);
assign in_section_65 = (va_byte_addr >= 64'h1000250000) & (va_byte_addr < 64'h10002500c0);
assign in_section_66 = (va_byte_addr >= 64'h1000258000) & (va_byte_addr < 64'h10002580c0);
assign in_section_67 = (va_byte_addr >= 64'h1000260000) & (va_byte_addr < 64'h10002600c0);
assign in_section_68 = (va_byte_addr >= 64'h1000268000) & (va_byte_addr < 64'h10002680c0);
assign in_section_69 = (va_byte_addr >= 64'h1000310000) & (va_byte_addr < 64'h1000310040);
assign in_section_70 = (va_byte_addr >= 64'h1001100000) & (va_byte_addr < 64'h1001104000);
assign in_section_71 = (va_byte_addr >= 64'h1001300000) & (va_byte_addr < 64'h1001304000);
assign in_section_72 = (va_byte_addr >= 64'h1001500000) & (va_byte_addr < 64'h1001504000);
assign in_section_73 = (va_byte_addr >= 64'h1001700000) & (va_byte_addr < 64'h1001704000);
assign in_section_74 = (va_byte_addr >= 64'h1003000000) & (va_byte_addr < 64'h1003000040);
assign in_section_75 = (va_byte_addr >= 64'h1003006000) & (va_byte_addr < 64'h1003006040);
assign in_section_76 = (va_byte_addr >= 64'h1003008000) & (va_byte_addr < 64'h1003008040);
assign in_section_77 = (va_byte_addr >= 64'h1004000000) & (va_byte_addr < 64'h1004000040);
assign in_section_78 = (va_byte_addr >= 64'h1010160000) & (va_byte_addr < 64'h10101e0000);
assign in_section_79 = (va_byte_addr >= 64'h1013004000) & (va_byte_addr < 64'h1013008000);
assign in_section_80 = (va_byte_addr >= 64'h1020006000) & (va_byte_addr < 64'h1020006080);
assign in_section_81 = (va_byte_addr >= 64'h1020008000) & (va_byte_addr < 64'h102000a000);
assign in_section_82 = (va_byte_addr >= 64'h102000c000) & (va_byte_addr < 64'h102000c0c0);
assign in_section_83 = (va_byte_addr >= 64'h1020018000) & (va_byte_addr < 64'h1020018040);
assign in_section_84 = (va_byte_addr >= 64'h102001a000) & (va_byte_addr < 64'h102001a040);
assign in_section_85 = (va_byte_addr >= 64'h102001c000) & (va_byte_addr < 64'h102001e000);
assign in_section_86 = (va_byte_addr >= 64'h1040000000) & (va_byte_addr < 64'h10400000c0);
assign in_section_87 = (va_byte_addr >= 64'h1040008000) & (va_byte_addr < 64'h1040008800);
assign in_section_88 = (va_byte_addr >= 64'h1040018000) & (va_byte_addr < 64'h104001c000);
assign in_section_89 = (va_byte_addr >= 64'h1041000000) & (va_byte_addr < 64'h1041000040);
assign in_section_90 = (va_byte_addr >= 64'h1070000000) & (va_byte_addr < 64'h1070002000);
assign in_section_91 = (va_byte_addr >= 64'h1100144000) & (va_byte_addr < 64'h1100144040);
assign in_section_92 = (va_byte_addr >= 64'h1100150000) & (va_byte_addr < 64'h1100150480);
assign in_section_93 = (va_byte_addr >= 64'h1100160000) & (va_byte_addr < 64'h1100160080);
assign in_section_94 = (va_byte_addr >= 64'h1100170000) & (va_byte_addr < 64'h1100170300);
assign in_section_95 = (va_byte_addr >= 64'h1100180000) & (va_byte_addr < 64'h1100180080);
assign in_section_96 = (va_byte_addr >= 64'h1100190000) & (va_byte_addr < 64'h1100190080);
assign in_section_97 = (va_byte_addr >= 64'h1100250000) & (va_byte_addr < 64'h1100250040);
assign in_section_98 = (va_byte_addr >= 64'h1100258000) & (va_byte_addr < 64'h1100258040);
assign in_section_99 = (va_byte_addr >= 64'h1100260000) & (va_byte_addr < 64'h1100260040);
assign in_section_100 = (va_byte_addr >= 64'h1100268000) & (va_byte_addr < 64'h1100268040);
assign in_section_101 = (va_byte_addr >= 64'h1100270000) & (va_byte_addr < 64'h1100270040);
assign in_section_102 = (va_byte_addr >= 64'h1100278000) & (va_byte_addr < 64'h1100278040);
assign in_section_103 = (va_byte_addr >= 64'h1100280000) & (va_byte_addr < 64'h1100280040);
assign in_section_104 = (va_byte_addr >= 64'h1100288000) & (va_byte_addr < 64'h1100288040);
assign in_section_105 = (va_byte_addr >= 64'h1100290000) & (va_byte_addr < 64'h1100290040);
assign in_section_106 = (va_byte_addr >= 64'h1100298000) & (va_byte_addr < 64'h1100298040);
assign in_section_107 = (va_byte_addr >= 64'h11002a0000) & (va_byte_addr < 64'h11002a0040);
assign in_section_108 = (va_byte_addr >= 64'h11002a8000) & (va_byte_addr < 64'h11002a8040);
assign in_section_109 = (va_byte_addr >= 64'h11002b0000) & (va_byte_addr < 64'h11002b0040);
assign in_section_110 = (va_byte_addr >= 64'h11002b8000) & (va_byte_addr < 64'h11002b8040);
assign in_section_111 = (va_byte_addr >= 64'h11002c0000) & (va_byte_addr < 64'h11002c0040);
assign in_section_112 = (va_byte_addr >= 64'h11002c8000) & (va_byte_addr < 64'h11002c8040);
assign in_section_113 = (va_byte_addr >= 64'h11002d0000) & (va_byte_addr < 64'h11002d0040);
assign in_section_114 = (va_byte_addr >= 64'h11002d8000) & (va_byte_addr < 64'h11002d8040);
assign in_section_115 = (va_byte_addr >= 64'h11002e0000) & (va_byte_addr < 64'h11002e0040);
assign in_section_116 = (va_byte_addr >= 64'h11002e8000) & (va_byte_addr < 64'h11002e8040);
assign in_section_117 = (va_byte_addr >= 64'h11002f0000) & (va_byte_addr < 64'h11002f0040);
assign in_section_118 = (va_byte_addr >= 64'h11002f8000) & (va_byte_addr < 64'h11002f8040);
assign in_section_119 = (va_byte_addr >= 64'h1100300000) & (va_byte_addr < 64'h1100300040);
assign in_section_120 = (va_byte_addr >= 64'h1100308000) & (va_byte_addr < 64'h1100308040);
assign in_section_121 = (va_byte_addr >= 64'h1100310000) & (va_byte_addr < 64'h1100310040);
assign in_section_122 = (va_byte_addr >= 64'h1100318000) & (va_byte_addr < 64'h1100318040);
assign in_section_123 = (va_byte_addr >= 64'h1100320000) & (va_byte_addr < 64'h1100320040);
assign in_section_124 = (va_byte_addr >= 64'h1100328000) & (va_byte_addr < 64'h1100328040);
assign in_section_125 = (va_byte_addr >= 64'h1100330000) & (va_byte_addr < 64'h1100330040);
assign in_section_126 = (va_byte_addr >= 64'h1100338000) & (va_byte_addr < 64'h1100338040);
assign in_section_127 = (va_byte_addr >= 64'h1100340000) & (va_byte_addr < 64'h1100340040);
assign in_section_128 = (va_byte_addr >= 64'h1100348000) & (va_byte_addr < 64'h1100348040);
assign in_section_129 = (va_byte_addr >= 64'h1100350000) & (va_byte_addr < 64'h1100350040);
assign in_section_130 = (va_byte_addr >= 64'h1100358000) & (va_byte_addr < 64'h1100358040);
assign in_section_131 = (va_byte_addr >= 64'h1100360000) & (va_byte_addr < 64'h1100360040);
assign in_section_132 = (va_byte_addr >= 64'h1100368000) & (va_byte_addr < 64'h1100368040);
assign in_section_133 = (va_byte_addr >= 64'h1100370000) & (va_byte_addr < 64'h1100370040);
assign in_section_134 = (va_byte_addr >= 64'h11005b0000) & (va_byte_addr < 64'h11005b0040);
assign in_section_135 = (va_byte_addr >= 64'h1100780000) & (va_byte_addr < 64'h1100780040);
assign in_section_136 = (va_byte_addr >= 64'h1101834000) & (va_byte_addr < 64'h1101834180);
assign in_section_137 = (va_byte_addr >= 64'h1101c34000) & (va_byte_addr < 64'h1101c34600);
assign in_section_138 = (va_byte_addr >= 64'h1103000000) & (va_byte_addr < 64'h1103000040);
assign in_section_139 = (va_byte_addr >= 64'h1104000000) & (va_byte_addr < 64'h1104000040);
assign in_section_140 = (va_byte_addr >= 64'h1106000000) & (va_byte_addr < 64'h1106000040);
assign in_section_141 = (va_byte_addr >= 64'h1110000000) & (va_byte_addr < 64'h1110000040);
assign in_section_142 = (va_byte_addr >= 64'h1120000000) & (va_byte_addr < 64'h1120000040);
assign in_section_143 = (va_byte_addr >= 64'h1130000000) & (va_byte_addr < 64'h1130008000);
assign in_section_144 = (va_byte_addr >= 64'h1170000000) & (va_byte_addr < 64'h1170084000);
assign in_section_145 = (va_byte_addr >= 64'h1178020000) & (va_byte_addr < 64'h1178020040);
assign in_section_146 = (va_byte_addr >= 64'h1178030000) & (va_byte_addr < 64'h1178030040);
assign in_section_147 = (va_byte_addr >= 64'hfff0000000) & (va_byte_addr < 64'hfff0000400);
assign in_section_148 = (va_byte_addr >= 64'hfff0002000) & (va_byte_addr < 64'hfff0002040);
assign in_section_149 = (va_byte_addr >= 64'hfff0010000) & (va_byte_addr < 64'hfff0010040);

assign storage_addr =
({STORAGE_ADDR_WIDTH{in_section_0}} & bram_addr_0[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_1}} & bram_addr_1[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_2}} & bram_addr_2[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_3}} & bram_addr_3[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_4}} & bram_addr_4[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_5}} & bram_addr_5[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_6}} & bram_addr_6[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_7}} & bram_addr_7[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_8}} & bram_addr_8[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_9}} & bram_addr_9[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_10}} & bram_addr_10[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_11}} & bram_addr_11[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_12}} & bram_addr_12[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_13}} & bram_addr_13[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_14}} & bram_addr_14[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_15}} & bram_addr_15[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_16}} & bram_addr_16[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_17}} & bram_addr_17[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_18}} & bram_addr_18[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_19}} & bram_addr_19[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_20}} & bram_addr_20[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_21}} & bram_addr_21[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_22}} & bram_addr_22[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_23}} & bram_addr_23[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_24}} & bram_addr_24[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_25}} & bram_addr_25[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_26}} & bram_addr_26[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_27}} & bram_addr_27[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_28}} & bram_addr_28[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_29}} & bram_addr_29[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_30}} & bram_addr_30[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_31}} & bram_addr_31[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_32}} & bram_addr_32[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_33}} & bram_addr_33[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_34}} & bram_addr_34[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_35}} & bram_addr_35[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_36}} & bram_addr_36[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_37}} & bram_addr_37[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_38}} & bram_addr_38[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_39}} & bram_addr_39[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_40}} & bram_addr_40[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_41}} & bram_addr_41[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_42}} & bram_addr_42[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_43}} & bram_addr_43[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_44}} & bram_addr_44[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_45}} & bram_addr_45[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_46}} & bram_addr_46[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_47}} & bram_addr_47[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_48}} & bram_addr_48[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_49}} & bram_addr_49[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_50}} & bram_addr_50[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_51}} & bram_addr_51[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_52}} & bram_addr_52[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_53}} & bram_addr_53[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_54}} & bram_addr_54[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_55}} & bram_addr_55[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_56}} & bram_addr_56[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_57}} & bram_addr_57[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_58}} & bram_addr_58[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_59}} & bram_addr_59[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_60}} & bram_addr_60[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_61}} & bram_addr_61[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_62}} & bram_addr_62[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_63}} & bram_addr_63[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_64}} & bram_addr_64[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_65}} & bram_addr_65[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_66}} & bram_addr_66[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_67}} & bram_addr_67[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_68}} & bram_addr_68[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_69}} & bram_addr_69[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_70}} & bram_addr_70[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_71}} & bram_addr_71[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_72}} & bram_addr_72[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_73}} & bram_addr_73[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_74}} & bram_addr_74[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_75}} & bram_addr_75[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_76}} & bram_addr_76[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_77}} & bram_addr_77[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_78}} & bram_addr_78[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_79}} & bram_addr_79[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_80}} & bram_addr_80[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_81}} & bram_addr_81[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_82}} & bram_addr_82[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_83}} & bram_addr_83[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_84}} & bram_addr_84[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_85}} & bram_addr_85[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_86}} & bram_addr_86[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_87}} & bram_addr_87[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_88}} & bram_addr_88[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_89}} & bram_addr_89[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_90}} & bram_addr_90[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_91}} & bram_addr_91[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_92}} & bram_addr_92[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_93}} & bram_addr_93[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_94}} & bram_addr_94[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_95}} & bram_addr_95[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_96}} & bram_addr_96[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_97}} & bram_addr_97[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_98}} & bram_addr_98[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_99}} & bram_addr_99[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_100}} & bram_addr_100[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_101}} & bram_addr_101[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_102}} & bram_addr_102[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_103}} & bram_addr_103[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_104}} & bram_addr_104[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_105}} & bram_addr_105[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_106}} & bram_addr_106[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_107}} & bram_addr_107[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_108}} & bram_addr_108[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_109}} & bram_addr_109[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_110}} & bram_addr_110[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_111}} & bram_addr_111[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_112}} & bram_addr_112[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_113}} & bram_addr_113[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_114}} & bram_addr_114[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_115}} & bram_addr_115[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_116}} & bram_addr_116[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_117}} & bram_addr_117[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_118}} & bram_addr_118[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_119}} & bram_addr_119[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_120}} & bram_addr_120[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_121}} & bram_addr_121[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_122}} & bram_addr_122[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_123}} & bram_addr_123[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_124}} & bram_addr_124[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_125}} & bram_addr_125[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_126}} & bram_addr_126[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_127}} & bram_addr_127[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_128}} & bram_addr_128[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_129}} & bram_addr_129[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_130}} & bram_addr_130[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_131}} & bram_addr_131[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_132}} & bram_addr_132[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_133}} & bram_addr_133[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_134}} & bram_addr_134[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_135}} & bram_addr_135[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_136}} & bram_addr_136[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_137}} & bram_addr_137[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_138}} & bram_addr_138[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_139}} & bram_addr_139[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_140}} & bram_addr_140[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_141}} & bram_addr_141[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_142}} & bram_addr_142[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_143}} & bram_addr_143[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_144}} & bram_addr_144[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_145}} & bram_addr_145[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_146}} & bram_addr_146[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_147}} & bram_addr_147[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_148}} & bram_addr_148[STORAGE_ADDR_WIDTH-1:0])|
({STORAGE_ADDR_WIDTH{in_section_149}} & bram_addr_149[STORAGE_ADDR_WIDTH-1:0]);

assign storage_addr_out = {storage_addr, 3'b0};

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
in_section_23 |
in_section_24 |
in_section_25 |
in_section_26 |
in_section_27 |
in_section_28 |
in_section_29 |
in_section_30 |
in_section_31 |
in_section_32 |
in_section_33 |
in_section_34 |
in_section_35 |
in_section_36 |
in_section_37 |
in_section_38 |
in_section_39 |
in_section_40 |
in_section_41 |
in_section_42 |
in_section_43 |
in_section_44 |
in_section_45 |
in_section_46 |
in_section_47 |
in_section_48 |
in_section_49 |
in_section_50 |
in_section_51 |
in_section_52 |
in_section_53 |
in_section_54 |
in_section_55 |
in_section_56 |
in_section_57 |
in_section_58 |
in_section_59 |
in_section_60 |
in_section_61 |
in_section_62 |
in_section_63 |
in_section_64 |
in_section_65 |
in_section_66 |
in_section_67 |
in_section_68 |
in_section_69 |
in_section_70 |
in_section_71 |
in_section_72 |
in_section_73 |
in_section_74 |
in_section_75 |
in_section_76 |
in_section_77 |
in_section_78 |
in_section_79 |
in_section_80 |
in_section_81 |
in_section_82 |
in_section_83 |
in_section_84 |
in_section_85 |
in_section_86 |
in_section_87 |
in_section_88 |
in_section_89 |
in_section_90 |
in_section_91 |
in_section_92 |
in_section_93 |
in_section_94 |
in_section_95 |
in_section_96 |
in_section_97 |
in_section_98 |
in_section_99 |
in_section_100 |
in_section_101 |
in_section_102 |
in_section_103 |
in_section_104 |
in_section_105 |
in_section_106 |
in_section_107 |
in_section_108 |
in_section_109 |
in_section_110 |
in_section_111 |
in_section_112 |
in_section_113 |
in_section_114 |
in_section_115 |
in_section_116 |
in_section_117 |
in_section_118 |
in_section_119 |
in_section_120 |
in_section_121 |
in_section_122 |
in_section_123 |
in_section_124 |
in_section_125 |
in_section_126 |
in_section_127 |
in_section_128 |
in_section_129 |
in_section_130 |
in_section_131 |
in_section_132 |
in_section_133 |
in_section_134 |
in_section_135 |
in_section_136 |
in_section_137 |
in_section_138 |
in_section_139 |
in_section_140 |
in_section_141 |
in_section_142 |
in_section_143 |
in_section_144 |
in_section_145 |
in_section_146 |
in_section_147 |
in_section_148 |
in_section_149 ;

endmodule
//-----------------------------------------
// End of auto generated mapping
//-----------------------------------------
