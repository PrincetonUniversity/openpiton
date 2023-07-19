// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_denorm_frac.v
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
//      Fraction comparison of two inputs that both have leading 0's.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_denorm_frac (
	din1,
	din2,

	din2_din1_denorm,
	din2_din1_denorm_inv,
	din2_din1_denorma,
	din2_din1_denorm_inva
);


input [53:0]	din1;                   // input 1- fraction
input [53:0]    din2;                   // input 2- fraction

output		din2_din1_denorm;	// input 1 == denorm
output		din2_din1_denorm_inv;	// input 1 != denorm
output		din2_din1_denorma;	// input 1 == denorm- copy
output		din2_din1_denorm_inva;	// input 1 != denorm- copy


wire		din2_din1_nz_53_51;
wire		din2_din1_denorm_53_51;
wire		din2_din1_nz_50_48;
wire		din2_din1_denorm_50_48;
wire		din2_din1_nz_47_45;
wire		din2_din1_denorm_47_45;
wire		din2_din1_nz_44_42;
wire		din2_din1_denorm_44_42;
wire		din2_din1_nz_41_39;
wire		din2_din1_denorm_41_39;
wire		din2_din1_nz_38_36;
wire		din2_din1_denorm_38_36;
wire		din2_din1_nz_35_33;
wire		din2_din1_denorm_35_33;
wire		din2_din1_nz_32_30;
wire		din2_din1_denorm_32_30;
wire		din2_din1_nz_29_27;
wire		din2_din1_denorm_29_27;
wire		din2_din1_nz_26_24;
wire		din2_din1_denorm_26_24;
wire		din2_din1_nz_23_21;
wire		din2_din1_denorm_23_21;
wire		din2_din1_nz_20_18;
wire		din2_din1_denorm_20_18;
wire		din2_din1_nz_17_15;
wire		din2_din1_denorm_17_15;
wire		din2_din1_nz_14_12;
wire		din2_din1_denorm_14_12;
wire		din2_din1_nz_11_9;
wire		din2_din1_denorm_11_9;
wire		din2_din1_nz_8_6;
wire		din2_din1_denorm_8_6;
wire		din2_din1_nz_5_3;
wire		din2_din1_denorm_5_3;
wire		din2_din1_nz_2_0;
wire		din2_din1_denorm_2_0;
wire		din2_din1_nz_53_45;
wire		din2_din1_denorm_53_45;
wire		din2_din1_nz_44_36;
wire		din2_din1_denorm_44_36;
wire		din2_din1_nz_35_27;
wire		din2_din1_denorm_35_27;
wire		din2_din1_nz_26_18;
wire		din2_din1_denorm_26_18;
wire		din2_din1_nz_17_9;
wire		din2_din1_denorm_17_9;
wire		din2_din1_nz_8_0;
wire		din2_din1_denorm_8_0;
wire		din2_din1_nz_53_27;
wire		din2_din1_denorm_53_27;
wire		din2_din1_nz_26_0;
wire		din2_din1_denorm_26_0;
wire		din2_din1_denorm;
wire		din2_din1_denorm_inv;
wire		din2_din1_denorma;
wire		din2_din1_denorm_inva;


fpu_denorm_3b i_fpu_denorm_53_51 (
	.din1			(din1[53:51]),
	.din2			(din2[53:51]),

	.din2_din1_nz		(din2_din1_nz_53_51),
	.din2_din1_denorm	(din2_din1_denorm_53_51)
);

fpu_denorm_3b i_fpu_denorm_50_48 (
        .din1                   (din1[50:48]),
        .din2                   (din2[50:48]),

        .din2_din1_nz           (din2_din1_nz_50_48),
        .din2_din1_denorm       (din2_din1_denorm_50_48)
);

fpu_denorm_3b i_fpu_denorm_47_45 (
        .din1                   (din1[47:45]),
        .din2                   (din2[47:45]),

        .din2_din1_nz           (din2_din1_nz_47_45),
        .din2_din1_denorm       (din2_din1_denorm_47_45)
);

fpu_denorm_3b i_fpu_denorm_44_42 (
        .din1                   (din1[44:42]),
        .din2                   (din2[44:42]),

        .din2_din1_nz           (din2_din1_nz_44_42),
        .din2_din1_denorm       (din2_din1_denorm_44_42)
);

fpu_denorm_3b i_fpu_denorm_41_39 (
        .din1                   (din1[41:39]),
        .din2                   (din2[41:39]),

        .din2_din1_nz           (din2_din1_nz_41_39),
        .din2_din1_denorm       (din2_din1_denorm_41_39)
);

fpu_denorm_3b i_fpu_denorm_38_36 (
        .din1                   (din1[38:36]),
        .din2                   (din2[38:36]),

        .din2_din1_nz           (din2_din1_nz_38_36),
        .din2_din1_denorm       (din2_din1_denorm_38_36)
);

fpu_denorm_3b i_fpu_denorm_35_33 (
        .din1                   (din1[35:33]),
        .din2                   (din2[35:33]),

        .din2_din1_nz           (din2_din1_nz_35_33),
        .din2_din1_denorm       (din2_din1_denorm_35_33)
);

fpu_denorm_3b i_fpu_denorm_32_30 (
        .din1                   (din1[32:30]),
        .din2                   (din2[32:30]),

        .din2_din1_nz           (din2_din1_nz_32_30),
        .din2_din1_denorm       (din2_din1_denorm_32_30)
);

fpu_denorm_3b i_fpu_denorm_29_27 (
        .din1                   (din1[29:27]),
        .din2                   (din2[29:27]),

        .din2_din1_nz           (din2_din1_nz_29_27),
        .din2_din1_denorm       (din2_din1_denorm_29_27)
);

fpu_denorm_3b i_fpu_denorm_26_24 (
        .din1                   (din1[26:24]),
        .din2                   (din2[26:24]),

        .din2_din1_nz           (din2_din1_nz_26_24),
        .din2_din1_denorm       (din2_din1_denorm_26_24)
);

fpu_denorm_3b i_fpu_denorm_23_21 (
        .din1                   (din1[23:21]),
        .din2                   (din2[23:21]),

        .din2_din1_nz           (din2_din1_nz_23_21),
        .din2_din1_denorm       (din2_din1_denorm_23_21)
);

fpu_denorm_3b i_fpu_denorm_20_18 (
        .din1                   (din1[20:18]),
        .din2                   (din2[20:18]),

        .din2_din1_nz           (din2_din1_nz_20_18),
        .din2_din1_denorm       (din2_din1_denorm_20_18)
);

fpu_denorm_3b i_fpu_denorm_17_15 (
        .din1                   (din1[17:15]),
        .din2                   (din2[17:15]),

        .din2_din1_nz           (din2_din1_nz_17_15),
        .din2_din1_denorm       (din2_din1_denorm_17_15)
);

fpu_denorm_3b i_fpu_denorm_14_12 (
        .din1                   (din1[14:12]),
        .din2                   (din2[14:12]),

        .din2_din1_nz           (din2_din1_nz_14_12),
        .din2_din1_denorm       (din2_din1_denorm_14_12)
);

fpu_denorm_3b i_fpu_denorm_11_9 (
        .din1                   (din1[11:9]),
        .din2                   (din2[11:9]),

        .din2_din1_nz           (din2_din1_nz_11_9),
        .din2_din1_denorm       (din2_din1_denorm_11_9)
);

fpu_denorm_3b i_fpu_denorm_8_6 (
        .din1                   (din1[8:6]),
        .din2                   (din2[8:6]),

        .din2_din1_nz           (din2_din1_nz_8_6),
        .din2_din1_denorm       (din2_din1_denorm_8_6)
);

fpu_denorm_3b i_fpu_denorm_5_3 (
        .din1                   (din1[5:3]),
        .din2                   (din2[5:3]),

        .din2_din1_nz           (din2_din1_nz_5_3),
        .din2_din1_denorm       (din2_din1_denorm_5_3)
);

fpu_denorm_3b i_fpu_denorm_2_0 (
        .din1                   (din1[2:0]),
        .din2                   (din2[2:0]),

        .din2_din1_nz           (din2_din1_nz_2_0),
        .din2_din1_denorm       (din2_din1_denorm_2_0)
);


fpu_denorm_3to1 i_fpu_denorm_53_45 (
	.din2_din1_nz_hi	(din2_din1_nz_53_51),
	.din2_din1_denorm_hi	(din2_din1_denorm_53_51),
	.din2_din1_nz_mid	(din2_din1_nz_50_48),
	.din2_din1_denorm_mid	(din2_din1_denorm_50_48),
	.din2_din1_nz_lo	(din2_din1_nz_47_45),
	.din2_din1_denorm_lo	(din2_din1_denorm_47_45),

	.din2_din1_nz		(din2_din1_nz_53_45),
	.din2_din1_denorm	(din2_din1_denorm_53_45)
);

fpu_denorm_3to1 i_fpu_denorm_44_36 (
        .din2_din1_nz_hi        (din2_din1_nz_44_42),
        .din2_din1_denorm_hi    (din2_din1_denorm_44_42),
        .din2_din1_nz_mid       (din2_din1_nz_41_39),
        .din2_din1_denorm_mid   (din2_din1_denorm_41_39),
        .din2_din1_nz_lo        (din2_din1_nz_38_36),
        .din2_din1_denorm_lo    (din2_din1_denorm_38_36),

        .din2_din1_nz           (din2_din1_nz_44_36),
        .din2_din1_denorm       (din2_din1_denorm_44_36)
);

fpu_denorm_3to1 i_fpu_denorm_35_27 (
        .din2_din1_nz_hi        (din2_din1_nz_35_33),
        .din2_din1_denorm_hi    (din2_din1_denorm_35_33),
        .din2_din1_nz_mid       (din2_din1_nz_32_30),
        .din2_din1_denorm_mid   (din2_din1_denorm_32_30),
        .din2_din1_nz_lo        (din2_din1_nz_29_27),
        .din2_din1_denorm_lo    (din2_din1_denorm_29_27),

        .din2_din1_nz           (din2_din1_nz_35_27),
        .din2_din1_denorm       (din2_din1_denorm_35_27)
);

fpu_denorm_3to1 i_fpu_denorm_26_18 (
        .din2_din1_nz_hi        (din2_din1_nz_26_24),
        .din2_din1_denorm_hi    (din2_din1_denorm_26_24),
        .din2_din1_nz_mid       (din2_din1_nz_23_21),
        .din2_din1_denorm_mid   (din2_din1_denorm_23_21),
        .din2_din1_nz_lo        (din2_din1_nz_20_18),
        .din2_din1_denorm_lo    (din2_din1_denorm_20_18),

        .din2_din1_nz           (din2_din1_nz_26_18),
        .din2_din1_denorm       (din2_din1_denorm_26_18)
);

fpu_denorm_3to1 i_fpu_denorm_17_9 (
        .din2_din1_nz_hi        (din2_din1_nz_17_15),
        .din2_din1_denorm_hi    (din2_din1_denorm_17_15),
        .din2_din1_nz_mid       (din2_din1_nz_14_12),
        .din2_din1_denorm_mid   (din2_din1_denorm_14_12),
        .din2_din1_nz_lo        (din2_din1_nz_11_9),
        .din2_din1_denorm_lo    (din2_din1_denorm_11_9),

        .din2_din1_nz           (din2_din1_nz_17_9),
        .din2_din1_denorm       (din2_din1_denorm_17_9)
);

fpu_denorm_3to1 i_fpu_denorm_8_0 (
        .din2_din1_nz_hi        (din2_din1_nz_8_6),
        .din2_din1_denorm_hi    (din2_din1_denorm_8_6),
        .din2_din1_nz_mid       (din2_din1_nz_5_3),
        .din2_din1_denorm_mid   (din2_din1_denorm_5_3),
        .din2_din1_nz_lo        (din2_din1_nz_2_0),
        .din2_din1_denorm_lo    (din2_din1_denorm_2_0),

        .din2_din1_nz           (din2_din1_nz_8_0),
        .din2_din1_denorm       (din2_din1_denorm_8_0)
);


fpu_denorm_3to1 i_fpu_denorm_53_27 (
	.din2_din1_nz_hi	(din2_din1_nz_53_45),
	.din2_din1_denorm_hi	(din2_din1_denorm_53_45),
	.din2_din1_nz_mid	(din2_din1_nz_44_36),
	.din2_din1_denorm_mid	(din2_din1_denorm_44_36),
	.din2_din1_nz_lo	(din2_din1_nz_35_27),
	.din2_din1_denorm_lo	(din2_din1_denorm_35_27),

	.din2_din1_nz		(din2_din1_nz_53_27),
	.din2_din1_denorm	(din2_din1_denorm_53_27)
);

fpu_denorm_3to1 i_fpu_denorm_26_0 (
        .din2_din1_nz_hi        (din2_din1_nz_26_18),
        .din2_din1_denorm_hi    (din2_din1_denorm_26_18),
        .din2_din1_nz_mid       (din2_din1_nz_17_9),
        .din2_din1_denorm_mid   (din2_din1_denorm_17_9),
        .din2_din1_nz_lo        (din2_din1_nz_8_0),
        .din2_din1_denorm_lo    (din2_din1_denorm_8_0),

        .din2_din1_nz           (din2_din1_nz_26_0),
        .din2_din1_denorm       (din2_din1_denorm_26_0)
);


assign din2_din1_denorm= (din2_din1_nz_53_27 && din2_din1_denorm_53_27)
		|| ((!din2_din1_nz_53_27) && (!din2_din1_nz_26_0))
		|| ((!din2_din1_nz_53_27) && din2_din1_denorm_26_0);

assign din2_din1_denorm_inv= (!din2_din1_denorm);

assign din2_din1_denorma= din2_din1_denorm;

assign din2_din1_denorm_inva= din2_din1_denorm_inv;


endmodule


