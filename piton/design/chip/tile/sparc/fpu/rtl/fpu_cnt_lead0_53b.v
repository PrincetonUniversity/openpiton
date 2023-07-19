// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_cnt_lead0_53b.v
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
//	53 bit lead 0 counter.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_cnt_lead0_53b (
	din,

	lead0
);


input [52:0]	din;			// data in- count its leading 0's

output [5:0]	lead0;			// number of leading 0's in data in


wire		din_52_49_eq_0;
wire		din_52_51_eq_0;
wire		lead0_52_49_0;
wire		din_48_45_eq_0;
wire		din_48_47_eq_0;
wire		lead0_48_45_0;
wire		din_44_41_eq_0;
wire		din_44_43_eq_0;
wire		lead0_44_41_0;
wire		din_40_37_eq_0;
wire		din_40_39_eq_0;
wire		lead0_40_37_0;
wire		din_36_33_eq_0;
wire		din_36_35_eq_0;
wire		lead0_36_33_0;
wire		din_32_29_eq_0;
wire		din_32_31_eq_0;
wire		lead0_32_29_0;
wire		din_28_25_eq_0;
wire		din_28_27_eq_0;
wire		lead0_28_25_0;
wire		din_24_21_eq_0;
wire		din_24_23_eq_0;
wire		lead0_24_21_0;
wire		din_20_17_eq_0;
wire		din_20_19_eq_0;
wire		lead0_20_17_0;
wire		din_16_13_eq_0;
wire		din_16_15_eq_0;
wire		lead0_16_13_0;
wire		din_12_9_eq_0;
wire		din_12_11_eq_0;
wire		lead0_12_9_0;
wire		din_8_5_eq_0;
wire		din_8_7_eq_0;
wire		lead0_8_5_0;
wire		din_4_1_eq_0;
wire		din_4_3_eq_0;
wire		lead0_4_1_0;
wire		lead0_0_0;
wire		din_52_45_eq_0;
wire		lead0_52_45_1;
wire		lead0_52_45_0;
wire		din_44_37_eq_0;
wire		lead0_44_37_1;
wire		lead0_44_37_0;
wire		din_36_29_eq_0;
wire		lead0_36_29_1;
wire		lead0_36_29_0;
wire		din_28_21_eq_0;
wire		lead0_28_21_1;
wire		lead0_28_21_0;
wire		din_20_13_eq_0;
wire		lead0_20_13_1;
wire		lead0_20_13_0;
wire		din_12_5_eq_0;
wire		lead0_12_5_1;
wire		lead0_12_5_0;
wire		lead0_4_0_1;
wire		lead0_4_0_0;
wire		din_52_37_eq_0;
wire		lead0_52_37_2;
wire		lead0_52_37_1;
wire		lead0_52_37_0;
wire		din_36_21_eq_0;
wire		lead0_36_21_2;
wire		lead0_36_21_1;
wire		lead0_36_21_0;
wire		din_20_5_eq_0;
wire		lead0_20_5_2;
wire		lead0_20_5_1;
wire		lead0_20_5_0;
wire		lead0_4_0_2;
wire		din_52_21_eq_0;
wire		lead0_52_21_3;
wire		lead0_52_21_2;
wire		lead0_52_21_1;
wire		lead0_52_21_0;
wire		lead0_20_0_3;
wire		lead0_20_0_2;
wire		lead0_20_0_1;
wire		lead0_20_0_0;
wire		lead0_5;
wire		lead0_4;
wire		lead0_3;
wire		lead0_2;
wire		lead0_1;
wire		lead0_0;
wire [5:0]	lead0;


///////////////////////////////////////////////////////////////////////////////
//
//	Instantiations of lead 0 building blocks.
//
///////////////////////////////////////////////////////////////////////////////

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_52_49 (
	.din			(din[52:49]),

	.din_3_0_eq_0		(din_52_49_eq_0),
	.din_3_2_eq_0		(din_52_51_eq_0),
	.lead0_4b_0		(lead0_52_49_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_48_45 (
        .din                    (din[48:45]),

        .din_3_0_eq_0           (din_48_45_eq_0),
        .din_3_2_eq_0           (din_48_47_eq_0),
        .lead0_4b_0             (lead0_48_45_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_44_41 (
        .din                    (din[44:41]),

        .din_3_0_eq_0           (din_44_41_eq_0),
        .din_3_2_eq_0           (din_44_43_eq_0),
        .lead0_4b_0             (lead0_44_41_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_40_37 (
        .din                    (din[40:37]),

        .din_3_0_eq_0           (din_40_37_eq_0),
        .din_3_2_eq_0           (din_40_39_eq_0),
        .lead0_4b_0             (lead0_40_37_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_36_33 (
        .din                    (din[36:33]),

        .din_3_0_eq_0           (din_36_33_eq_0),
        .din_3_2_eq_0           (din_36_35_eq_0),
        .lead0_4b_0             (lead0_36_33_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_32_29 (
        .din                    (din[32:29]),

        .din_3_0_eq_0           (din_32_29_eq_0),
        .din_3_2_eq_0           (din_32_31_eq_0),
        .lead0_4b_0             (lead0_32_29_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_28_25 (
        .din                    (din[28:25]),

        .din_3_0_eq_0           (din_28_25_eq_0),
        .din_3_2_eq_0           (din_28_27_eq_0),
        .lead0_4b_0             (lead0_28_25_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_24_21 (
        .din                    (din[24:21]),

        .din_3_0_eq_0           (din_24_21_eq_0),
        .din_3_2_eq_0           (din_24_23_eq_0),
        .lead0_4b_0             (lead0_24_21_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_20_17 (
        .din                    (din[20:17]),

        .din_3_0_eq_0           (din_20_17_eq_0),
        .din_3_2_eq_0           (din_20_19_eq_0),
        .lead0_4b_0             (lead0_20_17_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_16_13 (
        .din                    (din[16:13]),

        .din_3_0_eq_0           (din_16_13_eq_0),
        .din_3_2_eq_0           (din_16_15_eq_0),
        .lead0_4b_0             (lead0_16_13_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_12_9 (
        .din                    (din[12:9]),

        .din_3_0_eq_0           (din_12_9_eq_0),
        .din_3_2_eq_0           (din_12_11_eq_0),
        .lead0_4b_0             (lead0_12_9_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_8_5 (
        .din                    (din[8:5]),

        .din_3_0_eq_0           (din_8_5_eq_0),
        .din_3_2_eq_0           (din_8_7_eq_0),
        .lead0_4b_0             (lead0_8_5_0)
);

fpu_cnt_lead0_lvl1 i_fpu_cnt_lead0_lvl1_4_1 (
        .din                    (din[4:1]),

        .din_3_0_eq_0           (din_4_1_eq_0),
        .din_3_2_eq_0           (din_4_3_eq_0),
        .lead0_4b_0             (lead0_4_1_0)
);

assign lead0_0_0= (!din[0]);


fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_52_45 (
	.din_7_4_eq_0		(din_52_49_eq_0),
	.din_7_6_eq_0		(din_52_51_eq_0),
	.lead0_4b_0_hi		(lead0_52_49_0),
	.din_3_0_eq_0		(din_48_45_eq_0),
	.din_3_2_eq_0		(din_48_47_eq_0),
	.lead0_4b_0_lo		(lead0_48_45_0),

	.din_7_0_eq_0		(din_52_45_eq_0),
	.lead0_8b_1		(lead0_52_45_1),
	.lead0_8b_0		(lead0_52_45_0)
);

fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_44_37 (
        .din_7_4_eq_0           (din_44_41_eq_0),
        .din_7_6_eq_0           (din_44_43_eq_0),
        .lead0_4b_0_hi          (lead0_44_41_0),
        .din_3_0_eq_0           (din_40_37_eq_0),
        .din_3_2_eq_0           (din_40_39_eq_0),
        .lead0_4b_0_lo          (lead0_40_37_0),

        .din_7_0_eq_0           (din_44_37_eq_0),
        .lead0_8b_1             (lead0_44_37_1),
        .lead0_8b_0             (lead0_44_37_0)
);

fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_36_29 (
        .din_7_4_eq_0           (din_36_33_eq_0),
        .din_7_6_eq_0           (din_36_35_eq_0),
        .lead0_4b_0_hi          (lead0_36_33_0),
        .din_3_0_eq_0           (din_32_29_eq_0),
        .din_3_2_eq_0           (din_32_31_eq_0),
        .lead0_4b_0_lo          (lead0_32_29_0),

        .din_7_0_eq_0           (din_36_29_eq_0),
        .lead0_8b_1             (lead0_36_29_1),
        .lead0_8b_0             (lead0_36_29_0)
);

fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_28_21 (
        .din_7_4_eq_0           (din_28_25_eq_0),
        .din_7_6_eq_0           (din_28_27_eq_0),
        .lead0_4b_0_hi          (lead0_28_25_0),
        .din_3_0_eq_0           (din_24_21_eq_0),
        .din_3_2_eq_0           (din_24_23_eq_0),
        .lead0_4b_0_lo          (lead0_24_21_0),

        .din_7_0_eq_0           (din_28_21_eq_0),
        .lead0_8b_1             (lead0_28_21_1),
        .lead0_8b_0             (lead0_28_21_0)
);

fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_20_13 (
        .din_7_4_eq_0           (din_20_17_eq_0),
        .din_7_6_eq_0           (din_20_19_eq_0),
        .lead0_4b_0_hi          (lead0_20_17_0),
        .din_3_0_eq_0           (din_16_13_eq_0),
        .din_3_2_eq_0           (din_16_15_eq_0),
        .lead0_4b_0_lo          (lead0_16_13_0),

        .din_7_0_eq_0           (din_20_13_eq_0),
        .lead0_8b_1             (lead0_20_13_1),
        .lead0_8b_0             (lead0_20_13_0)
);

fpu_cnt_lead0_lvl2 i_fpu_cnt_lead0_lvl2_12_5 (
        .din_7_4_eq_0           (din_12_9_eq_0),
        .din_7_6_eq_0           (din_12_11_eq_0),
        .lead0_4b_0_hi          (lead0_12_9_0),
        .din_3_0_eq_0           (din_8_5_eq_0),
        .din_3_2_eq_0           (din_8_7_eq_0),
        .lead0_4b_0_lo          (lead0_8_5_0),

        .din_7_0_eq_0           (din_12_5_eq_0),
        .lead0_8b_1             (lead0_12_5_1),
        .lead0_8b_0             (lead0_12_5_0)
);

assign lead0_4_0_1= (!din_4_1_eq_0) && din_4_3_eq_0;

assign lead0_4_0_0= ((!din_4_1_eq_0) && lead0_4_1_0)
		|| (din_4_1_eq_0 && lead0_0_0);


fpu_cnt_lead0_lvl3 i_fpu_cnt_lead0_lvl3_52_37 (
	.din_15_8_eq_0		(din_52_45_eq_0),
	.din_15_12_eq_0		(din_52_49_eq_0),
	.lead0_8b_1_hi		(lead0_52_45_1),
	.lead0_8b_0_hi		(lead0_52_45_0),
	.din_7_0_eq_0		(din_44_37_eq_0),
	.din_7_4_eq_0		(din_44_41_eq_0),
	.lead0_8b_1_lo		(lead0_44_37_1),
	.lead0_8b_0_lo		(lead0_44_37_0),

	.din_15_0_eq_0		(din_52_37_eq_0),
	.lead0_16b_2		(lead0_52_37_2),
	.lead0_16b_1		(lead0_52_37_1),
	.lead0_16b_0		(lead0_52_37_0)
);

fpu_cnt_lead0_lvl3 i_fpu_cnt_lead0_lvl3_36_21 (
        .din_15_8_eq_0          (din_36_29_eq_0),
        .din_15_12_eq_0         (din_36_33_eq_0),           
        .lead0_8b_1_hi          (lead0_36_29_1),
        .lead0_8b_0_hi          (lead0_36_29_0),
        .din_7_0_eq_0           (din_28_21_eq_0),
        .din_7_4_eq_0           (din_28_25_eq_0),
        .lead0_8b_1_lo          (lead0_28_21_1),
        .lead0_8b_0_lo          (lead0_28_21_0),

        .din_15_0_eq_0          (din_36_21_eq_0),
        .lead0_16b_2            (lead0_36_21_2),
        .lead0_16b_1            (lead0_36_21_1),
        .lead0_16b_0            (lead0_36_21_0)
);

fpu_cnt_lead0_lvl3 i_fpu_cnt_lead0_lvl3_20_5 (
        .din_15_8_eq_0          (din_20_13_eq_0),
        .din_15_12_eq_0         (din_20_17_eq_0),           
        .lead0_8b_1_hi          (lead0_20_13_1),
        .lead0_8b_0_hi          (lead0_20_13_0),
        .din_7_0_eq_0           (din_12_5_eq_0),
        .din_7_4_eq_0           (din_12_9_eq_0),
        .lead0_8b_1_lo          (lead0_12_5_1),
        .lead0_8b_0_lo          (lead0_12_5_0),

        .din_15_0_eq_0          (din_20_5_eq_0),
        .lead0_16b_2            (lead0_20_5_2),
        .lead0_16b_1            (lead0_20_5_1),
        .lead0_16b_0            (lead0_20_5_0)
);

assign lead0_4_0_2= din_4_1_eq_0;


fpu_cnt_lead0_lvl4 i_fpu_cnt_lead0_lvl4_52_21 (
	.din_31_16_eq_0		(din_52_37_eq_0),
	.din_31_24_eq_0		(din_52_45_eq_0),
	.lead0_16b_2_hi		(lead0_52_37_2),
	.lead0_16b_1_hi		(lead0_52_37_1),
	.lead0_16b_0_hi		(lead0_52_37_0),
	.din_15_0_eq_0		(din_36_21_eq_0),
	.din_15_8_eq_0		(din_36_29_eq_0),
	.lead0_16b_2_lo		(lead0_36_21_2),
	.lead0_16b_1_lo		(lead0_36_21_1),
	.lead0_16b_0_lo		(lead0_36_21_0),

	.din_31_0_eq_0		(din_52_21_eq_0),
	.lead0_32b_3		(lead0_52_21_3),
	.lead0_32b_2		(lead0_52_21_2),
	.lead0_32b_1		(lead0_52_21_1),
	.lead0_32b_0		(lead0_52_21_0)
);

fpu_cnt_lead0_lvl4 i_fpu_cnt_lead0_lvl4_20_0 (
        .din_31_16_eq_0         (din_20_5_eq_0),
        .din_31_24_eq_0         (din_20_13_eq_0),
        .lead0_16b_2_hi         (lead0_20_5_2),
        .lead0_16b_1_hi         (lead0_20_5_1),
        .lead0_16b_0_hi         (lead0_20_5_0),
        .din_15_0_eq_0          (1'b0),     
        .din_15_8_eq_0          (1'b0),
        .lead0_16b_2_lo         (lead0_4_0_2),
        .lead0_16b_1_lo         (lead0_4_0_1),
        .lead0_16b_0_lo         (lead0_4_0_0),

        .din_31_0_eq_0          (            ),
        .lead0_32b_3            (lead0_20_0_3),
        .lead0_32b_2            (lead0_20_0_2),
        .lead0_32b_1            (lead0_20_0_1),
        .lead0_32b_0            (lead0_20_0_0)
);

assign lead0_5= din_52_21_eq_0;

assign lead0_4= ((!din_52_21_eq_0) && din_52_37_eq_0)
		|| (din_52_21_eq_0 && din_20_5_eq_0);

assign lead0_3= ((!din_52_21_eq_0) && lead0_52_21_3)
		|| (din_52_21_eq_0 && lead0_20_0_3);

assign lead0_2= ((!din_52_21_eq_0) && lead0_52_21_2)
		|| (din_52_21_eq_0 && lead0_20_0_2);

assign lead0_1= ((!din_52_21_eq_0) && lead0_52_21_1)
		|| (din_52_21_eq_0 && lead0_20_0_1);

assign lead0_0= ((!din_52_21_eq_0) && lead0_52_21_0)
		|| (din_52_21_eq_0 && lead0_20_0_0);

assign lead0[5:0]= {lead0_5, lead0_4, lead0_3, lead0_2, lead0_1, lead0_0};


endmodule


