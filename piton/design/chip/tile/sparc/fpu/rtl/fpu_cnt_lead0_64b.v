// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_cnt_lead0_64b.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
///////////////////////////////////////////////////////////////////////////////
//
//	64 bit lead 0 counter.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_cnt_lead0_64b (
        din,

        lead0
);


input [63:0]    din;                    // data in- count its leading 0's

output [5:0]    lead0;                  // number of leading 0's in data in


wire		din_63_60_eq_0;
wire		din_63_62_eq_0;
wire		lead0_63_60_0;
wire		din_59_56_eq_0;
wire		din_59_58_eq_0;
wire		lead0_59_56_0;
wire		din_55_52_eq_0;
wire		din_55_54_eq_0;
wire		lead0_55_52_0;
wire		din_51_48_eq_0;
wire		din_51_50_eq_0;
wire		lead0_51_48_0;
wire		din_47_44_eq_0;
wire		din_47_46_eq_0;
wire		lead0_47_44_0;
wire		din_43_40_eq_0;
wire		din_43_42_eq_0;
wire		lead0_43_40_0;
wire		din_39_36_eq_0;
wire		din_39_38_eq_0;
wire		lead0_39_36_0;
wire		din_35_32_eq_0;
wire		din_35_34_eq_0;
wire		lead0_35_32_0;
wire		din_31_28_eq_0;
wire		din_31_30_eq_0;
wire		lead0_31_28_0;
wire		din_27_24_eq_0;
wire		din_27_26_eq_0;
wire		lead0_27_24_0;
wire		din_23_20_eq_0;
wire		din_23_22_eq_0;
wire		lead0_23_20_0;
wire		din_19_16_eq_0;
wire		din_19_18_eq_0;
wire		lead0_19_16_0;
wire		din_15_12_eq_0;
wire		din_15_14_eq_0;
wire		lead0_15_12_0;
wire		din_11_8_eq_0;
wire		din_11_10_eq_0;
wire		lead0_11_8_0;
wire		din_7_4_eq_0;
wire		din_7_6_eq_0;
wire		lead0_7_4_0;
wire		din_3_0_eq_0;
wire		din_3_2_eq_0;
wire		lead0_3_0_0;
wire		din_63_56_eq_0;
wire		lead0_63_56_1;
wire		lead0_63_56_0;
wire		din_55_48_eq_0;
wire		lead0_55_48_1;
wire		lead0_55_48_0;
wire		din_47_40_eq_0;
wire		lead0_47_40_1;
wire		lead0_47_40_0;
wire		din_39_32_eq_0;
wire		lead0_39_32_1;
wire		lead0_39_32_0;
wire		din_31_24_eq_0;
wire		lead0_31_24_1;
wire		lead0_31_24_0;
wire		din_23_16_eq_0;
wire		lead0_23_16_1;
wire		lead0_23_16_0;
wire		din_15_8_eq_0;
wire		lead0_15_8_1;
wire		lead0_15_8_0;
wire		din_7_0_eq_0;
wire		lead0_7_0_1;
wire		lead0_7_0_0;
wire		din_63_48_eq_0;
wire		lead0_63_48_2;
wire		lead0_63_48_1;
wire		lead0_63_48_0;
wire		din_47_32_eq_0;
wire		lead0_47_32_2;
wire		lead0_47_32_1;
wire		lead0_47_32_0;
wire		din_31_16_eq_0;
wire		lead0_31_16_2;
wire		lead0_31_16_1;
wire		lead0_31_16_0;
wire		din_15_0_eq_0;
wire		lead0_15_0_2;
wire		lead0_15_0_1;
wire		lead0_15_0_0;
wire		din_63_32_eq_0;
wire		lead0_63_32_3;
wire		lead0_63_32_2;
wire		lead0_63_32_1;
wire		din_31_0_eq_0;
wire		lead0_31_0_3;
wire		lead0_31_0_2;
wire		lead0_31_0_1;
wire		lead0_31_0_0;
wire		lead0_6;
wire		lead0_5;
wire		lead0_4;
wire		lead0_3;
wire		lead0_2;
wire		lead0_1;
wire		lead0_0;
wire [5:0]	lead0;

//Previously missing wires
wire        lead0_63_32_0;

///////////////////////////////////////////////////////////////////////////////
//
//      Instantiations of lead 0 building blocks.
//
///////////////////////////////////////////////////////////////////////////////

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_63_60 (
	.din			(din[63:60]),

	.din_3_0_eq_0		(din_63_60_eq_0),
	.din_3_2_eq_0		(din_63_62_eq_0),
	.lead0_4b_0		(lead0_63_60_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_59_56 (
        .din                    (din[59:56]),

        .din_3_0_eq_0           (din_59_56_eq_0),
        .din_3_2_eq_0           (din_59_58_eq_0),
        .lead0_4b_0             (lead0_59_56_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_55_52 (
        .din                    (din[55:52]),

        .din_3_0_eq_0           (din_55_52_eq_0),
        .din_3_2_eq_0           (din_55_54_eq_0),
        .lead0_4b_0             (lead0_55_52_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_51_48 (
        .din                    (din[51:48]),

        .din_3_0_eq_0           (din_51_48_eq_0),
        .din_3_2_eq_0           (din_51_50_eq_0),
        .lead0_4b_0             (lead0_51_48_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_47_44 (
        .din                    (din[47:44]),

        .din_3_0_eq_0           (din_47_44_eq_0),
        .din_3_2_eq_0           (din_47_46_eq_0),
        .lead0_4b_0             (lead0_47_44_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_43_40 (
        .din                    (din[43:40]),

        .din_3_0_eq_0           (din_43_40_eq_0),
        .din_3_2_eq_0           (din_43_42_eq_0),
        .lead0_4b_0             (lead0_43_40_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_39_36 (
        .din                    (din[39:36]),

        .din_3_0_eq_0           (din_39_36_eq_0),
        .din_3_2_eq_0           (din_39_38_eq_0),
        .lead0_4b_0             (lead0_39_36_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_35_32 (
        .din                    (din[35:32]),

        .din_3_0_eq_0           (din_35_32_eq_0),
        .din_3_2_eq_0           (din_35_34_eq_0),
        .lead0_4b_0             (lead0_35_32_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_31_28 (
        .din                    (din[31:28]),

        .din_3_0_eq_0           (din_31_28_eq_0),
        .din_3_2_eq_0           (din_31_30_eq_0),
        .lead0_4b_0             (lead0_31_28_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_27_24 (
        .din                    (din[27:24]),

        .din_3_0_eq_0           (din_27_24_eq_0),
        .din_3_2_eq_0           (din_27_26_eq_0),
        .lead0_4b_0             (lead0_27_24_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_23_20 (
        .din                    (din[23:20]),

        .din_3_0_eq_0           (din_23_20_eq_0),
        .din_3_2_eq_0           (din_23_22_eq_0),
        .lead0_4b_0             (lead0_23_20_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_19_16 (
        .din                    (din[19:16]),

        .din_3_0_eq_0           (din_19_16_eq_0),
        .din_3_2_eq_0           (din_19_18_eq_0),
        .lead0_4b_0             (lead0_19_16_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_15_12 (
        .din                    (din[15:12]),

        .din_3_0_eq_0           (din_15_12_eq_0),
        .din_3_2_eq_0           (din_15_14_eq_0),
        .lead0_4b_0             (lead0_15_12_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_11_8 (
        .din                    (din[11:8]),

        .din_3_0_eq_0           (din_11_8_eq_0),
        .din_3_2_eq_0           (din_11_10_eq_0),
        .lead0_4b_0             (lead0_11_8_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_7_4 (
        .din                    (din[7:4]),

        .din_3_0_eq_0           (din_7_4_eq_0),
        .din_3_2_eq_0           (din_7_6_eq_0),
        .lead0_4b_0             (lead0_7_4_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_3_0 (
        .din                    (din[3:0]),

        .din_3_0_eq_0           (din_3_0_eq_0),
        .din_3_2_eq_0           (din_3_2_eq_0),
        .lead0_4b_0             (lead0_3_0_0)
);


fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_63_56 (
	.din_7_4_eq_0		(din_63_60_eq_0),
	.din_7_6_eq_0		(din_63_62_eq_0),
	.lead0_4b_0_hi		(lead0_63_60_0),
	.din_3_0_eq_0		(din_59_56_eq_0),
	.din_3_2_eq_0		(din_59_58_eq_0),
	.lead0_4b_0_lo		(lead0_59_56_0),

	.din_7_0_eq_0		(din_63_56_eq_0),
	.lead0_8b_1		(lead0_63_56_1),
	.lead0_8b_0		(lead0_63_56_0)
);

fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_55_48 (
        .din_7_4_eq_0           (din_55_52_eq_0),
        .din_7_6_eq_0           (din_55_54_eq_0),
        .lead0_4b_0_hi          (lead0_55_52_0),
        .din_3_0_eq_0           (din_51_48_eq_0),
        .din_3_2_eq_0           (din_51_50_eq_0),
        .lead0_4b_0_lo          (lead0_51_48_0),

        .din_7_0_eq_0           (din_55_48_eq_0),
        .lead0_8b_1             (lead0_55_48_1),
        .lead0_8b_0             (lead0_55_48_0)
);

fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_47_40 (
        .din_7_4_eq_0           (din_47_44_eq_0),
        .din_7_6_eq_0           (din_47_46_eq_0),
        .lead0_4b_0_hi          (lead0_47_44_0),
        .din_3_0_eq_0           (din_43_40_eq_0),
        .din_3_2_eq_0           (din_43_42_eq_0),
        .lead0_4b_0_lo          (lead0_43_40_0),

        .din_7_0_eq_0           (din_47_40_eq_0),
        .lead0_8b_1             (lead0_47_40_1),
        .lead0_8b_0             (lead0_47_40_0)
);

fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_39_32 (
        .din_7_4_eq_0           (din_39_36_eq_0),
        .din_7_6_eq_0           (din_39_38_eq_0),
        .lead0_4b_0_hi          (lead0_39_36_0),
        .din_3_0_eq_0           (din_35_32_eq_0),
        .din_3_2_eq_0           (din_35_34_eq_0),
        .lead0_4b_0_lo          (lead0_35_32_0),

        .din_7_0_eq_0           (din_39_32_eq_0),
        .lead0_8b_1             (lead0_39_32_1),
        .lead0_8b_0             (lead0_39_32_0)
);

fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_31_24 (
        .din_7_4_eq_0           (din_31_28_eq_0),
        .din_7_6_eq_0           (din_31_30_eq_0),
        .lead0_4b_0_hi          (lead0_31_28_0),
        .din_3_0_eq_0           (din_27_24_eq_0),
        .din_3_2_eq_0           (din_27_26_eq_0),
        .lead0_4b_0_lo          (lead0_27_24_0),

        .din_7_0_eq_0           (din_31_24_eq_0),
        .lead0_8b_1             (lead0_31_24_1),
        .lead0_8b_0             (lead0_31_24_0)
);

fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_23_16 (
        .din_7_4_eq_0           (din_23_20_eq_0),
        .din_7_6_eq_0           (din_23_22_eq_0),
        .lead0_4b_0_hi          (lead0_23_20_0),
        .din_3_0_eq_0           (din_19_16_eq_0),
        .din_3_2_eq_0           (din_19_18_eq_0),
        .lead0_4b_0_lo          (lead0_19_16_0),

        .din_7_0_eq_0           (din_23_16_eq_0),
        .lead0_8b_1             (lead0_23_16_1),
        .lead0_8b_0             (lead0_23_16_0)
);

fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_15_8 (
        .din_7_4_eq_0           (din_15_12_eq_0),
        .din_7_6_eq_0           (din_15_14_eq_0),
        .lead0_4b_0_hi          (lead0_15_12_0),
        .din_3_0_eq_0           (din_11_8_eq_0),
        .din_3_2_eq_0           (din_11_10_eq_0),
        .lead0_4b_0_lo          (lead0_11_8_0),

        .din_7_0_eq_0           (din_15_8_eq_0),
        .lead0_8b_1             (lead0_15_8_1),
        .lead0_8b_0             (lead0_15_8_0)
);

fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_7_0 (
        .din_7_4_eq_0           (din_7_4_eq_0),
        .din_7_6_eq_0           (din_7_6_eq_0),
        .lead0_4b_0_hi          (lead0_7_4_0),
        .din_3_0_eq_0           (din_3_0_eq_0),
        .din_3_2_eq_0           (din_3_2_eq_0),
        .lead0_4b_0_lo          (lead0_3_0_0),

        .din_7_0_eq_0           (din_7_0_eq_0),
        .lead0_8b_1             (lead0_7_0_1),
        .lead0_8b_0             (lead0_7_0_0)
);


fpu_cnt_lead0_lvl3 i_fpu_cnt_lead0_lvl3_63_48 (
	.din_15_8_eq_0		(din_63_56_eq_0),
	.din_15_12_eq_0		(din_63_60_eq_0),
	.lead0_8b_1_hi		(lead0_63_56_1),
	.lead0_8b_0_hi		(lead0_63_56_0),
	.din_7_0_eq_0		(din_55_48_eq_0),
	.din_7_4_eq_0		(din_55_52_eq_0),
	.lead0_8b_1_lo		(lead0_55_48_1),
	.lead0_8b_0_lo		(lead0_55_48_0),

	.din_15_0_eq_0		(din_63_48_eq_0),
	.lead0_16b_2		(lead0_63_48_2),
	.lead0_16b_1		(lead0_63_48_1),
	.lead0_16b_0		(lead0_63_48_0)
);

fpu_cnt_lead0_lvl3 i_fpu_cnt_lead0_lvl3_47_32 (
        .din_15_8_eq_0          (din_47_40_eq_0),
        .din_15_12_eq_0         (din_47_44_eq_0),
        .lead0_8b_1_hi          (lead0_47_40_1),
        .lead0_8b_0_hi          (lead0_47_40_0),
        .din_7_0_eq_0           (din_39_32_eq_0),
        .din_7_4_eq_0           (din_39_36_eq_0),
        .lead0_8b_1_lo          (lead0_39_32_1),
        .lead0_8b_0_lo          (lead0_39_32_0),

        .din_15_0_eq_0          (din_47_32_eq_0),
        .lead0_16b_2            (lead0_47_32_2),
        .lead0_16b_1            (lead0_47_32_1),
        .lead0_16b_0            (lead0_47_32_0)
);

fpu_cnt_lead0_lvl3 i_fpu_cnt_lead0_lvl3_31_16 (
        .din_15_8_eq_0          (din_31_24_eq_0),
        .din_15_12_eq_0         (din_31_28_eq_0),
        .lead0_8b_1_hi          (lead0_31_24_1),
        .lead0_8b_0_hi          (lead0_31_24_0),
        .din_7_0_eq_0           (din_23_16_eq_0),
        .din_7_4_eq_0           (din_23_20_eq_0),
        .lead0_8b_1_lo          (lead0_23_16_1),
        .lead0_8b_0_lo          (lead0_23_16_0),

        .din_15_0_eq_0          (din_31_16_eq_0),
        .lead0_16b_2            (lead0_31_16_2),
        .lead0_16b_1            (lead0_31_16_1),
        .lead0_16b_0            (lead0_31_16_0)
);

fpu_cnt_lead0_lvl3 i_fpu_cnt_lead0_lvl3_15_0 (
        .din_15_8_eq_0          (din_15_8_eq_0),
        .din_15_12_eq_0         (din_15_12_eq_0),
        .lead0_8b_1_hi          (lead0_15_8_1),
        .lead0_8b_0_hi          (lead0_15_8_0),
        .din_7_0_eq_0           (din_7_0_eq_0),
        .din_7_4_eq_0           (din_7_4_eq_0),
        .lead0_8b_1_lo          (lead0_7_0_1),
        .lead0_8b_0_lo          (lead0_7_0_0),

        .din_15_0_eq_0          (din_15_0_eq_0),
        .lead0_16b_2            (lead0_15_0_2),
        .lead0_16b_1            (lead0_15_0_1),
        .lead0_16b_0            (lead0_15_0_0)
);


fpu_cnt_lead0_lvl4 i_fpu_cnt_lead0_lvl4_63_32 (
	.din_31_16_eq_0		(din_63_48_eq_0),
	.din_31_24_eq_0		(din_63_56_eq_0),
	.lead0_16b_2_hi		(lead0_63_48_2),
	.lead0_16b_1_hi		(lead0_63_48_1),
	.lead0_16b_0_hi		(lead0_63_48_0),
	.din_15_0_eq_0		(din_47_32_eq_0),
	.din_15_8_eq_0		(din_47_40_eq_0),
	.lead0_16b_2_lo		(lead0_47_32_2),
	.lead0_16b_1_lo		(lead0_47_32_1),
	.lead0_16b_0_lo		(lead0_47_32_0),

	.din_31_0_eq_0		(din_63_32_eq_0),
	.lead0_32b_3		(lead0_63_32_3),
	.lead0_32b_2		(lead0_63_32_2),
	.lead0_32b_1		(lead0_63_32_1),
	.lead0_32b_0		(lead0_63_32_0)
);

fpu_cnt_lead0_lvl4 i_fpu_cnt_lead0_lvl4_31_0 (
        .din_31_16_eq_0         (din_31_16_eq_0),
        .din_31_24_eq_0         (din_31_24_eq_0),
        .lead0_16b_2_hi         (lead0_31_16_2),
        .lead0_16b_1_hi         (lead0_31_16_1),
        .lead0_16b_0_hi         (lead0_31_16_0),
        .din_15_0_eq_0          (din_15_0_eq_0),
        .din_15_8_eq_0          (din_15_8_eq_0),
        .lead0_16b_2_lo         (lead0_15_0_2),
        .lead0_16b_1_lo         (lead0_15_0_1),
        .lead0_16b_0_lo         (lead0_15_0_0),

        .din_31_0_eq_0          (din_31_0_eq_0),
        .lead0_32b_3            (lead0_31_0_3),
        .lead0_32b_2            (lead0_31_0_2),
        .lead0_32b_1            (lead0_31_0_1),
        .lead0_32b_0            (lead0_31_0_0)
);


assign lead0_6= din_63_32_eq_0 && din_31_0_eq_0;

assign lead0_5= (!lead0_6) && din_63_32_eq_0;

assign lead0_4= ((!din_63_32_eq_0) && din_63_48_eq_0)
		|| (din_63_32_eq_0 && din_31_16_eq_0 && (!lead0_6));

assign lead0_3= ((!din_63_32_eq_0) && lead0_63_32_3)
		|| (din_63_32_eq_0 && lead0_31_0_3 && (!lead0_6));

assign lead0_2= ((!din_63_32_eq_0) && lead0_63_32_2)
		|| (din_63_32_eq_0 && lead0_31_0_2 && (!lead0_6));
 
assign lead0_1= ((!din_63_32_eq_0) && lead0_63_32_1)
		|| (din_63_32_eq_0 && lead0_31_0_1 && (!lead0_6));
 
assign lead0_0= ((!din_63_32_eq_0) && lead0_63_32_0)
		|| (din_63_32_eq_0 && lead0_31_0_0 && (!lead0_6));

assign lead0[5:0]= {lead0_5, lead0_4, lead0_3, lead0_2, lead0_1,
		lead0_0};


endmodule


