// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_in2_gt_in1_frac.v
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
//	Fraction comparison of two inputs that can have any value.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_in2_gt_in1_frac (
	din1,
	din2,
	sngop,
	expadd11,
	expeq,

	din2_neq_din1,
	din2_gt_din1,
	din2_gt1_din1
);


input [54:0]	din1;			// input 1- fraction
input [54:0]	din2;			// input 2- fraction
input		sngop;			// single precision inputs
input		expadd11;		// exponent sign bit
input		expeq;			// exponent are equal

output		din2_neq_din1;		// input 2 != input 1- fraction
output		din2_gt_din1;		// input 2 > input 1- fraction
output		din2_gt1_din1;		// input 2 > input 1


wire		din2_neq_din1_54_52;
wire		din2_gt_din1_54_52;
wire		din2_neq_din1_51_50;
wire		din2_gt_din1_51_50;
wire		din2_neq_din1_49_48;
wire		din2_gt_din1_49_48;
wire		din2_neq_din1_47_45;
wire		din2_gt_din1_47_45;
wire		din2_neq_din1_44_42;
wire		din2_gt_din1_44_42;
wire		din2_neq_din1_41_39;
wire		din2_gt_din1_41_39;
wire		din2_neq_din1_38_36;
wire		din2_gt_din1_38_36;
wire		din2_neq_din1_35_33;
wire		din2_gt_din1_35_33;
wire		din2_neq_din1_32_30;
wire		din2_gt_din1_32_30;
wire		din2_neq_din1_29_27;
wire		din2_gt_din1_29_27;
wire		din2_neq_din1_26_24;
wire		din2_gt_din1_26_24;
wire		din2_neq_din1_23_21;
wire		din2_gt_din1_23_21;
wire		din2_neq_din1_20_18;
wire		din2_gt_din1_20_18;
wire		din2_neq_din1_17_15;
wire		din2_gt_din1_17_15;
wire		din2_neq_din1_14_12;
wire		din2_gt_din1_14_12;
wire		din2_neq_din1_11_9;
wire		din2_gt_din1_11_9;
wire		din2_neq_din1_8_6;
wire		din2_gt_din1_8_6;
wire		din2_neq_din1_5_3;
wire		din2_gt_din1_5_3;
wire		din2_neq_din1_2_0;
wire		din2_gt_din1_2_0;
wire		din2_neq_din1_51_45;
wire		din2_gt_din1_51_45;
wire		din2_neq_din1_44_36;
wire		din2_gt_din1_44_36;
wire		din2_neq_din1_35_27;
wire		din2_gt_din1_35_27;
wire		din2_neq_din1_26_18;
wire		din2_gt_din1_26_18;
wire		din2_neq_din1_17_9;
wire		din2_gt_din1_17_9;
wire		din2_neq_din1_8_0;
wire		din2_gt_din1_8_0;
wire		din2_neq_din1_51_27;
wire		din2_gt_din1_51_27;
wire		din2_neq_din1_26_0;
wire		din2_gt_din1_26_0;
wire		din2_neq_din1;
wire		din2_gt_din1;
wire		din2_gt1_din1;


fpu_in2_gt_in1_3b fpu_in2_gt_in1_54_52 (
	.din1			(din1[54:52]),
	.din2			(din2[54:52]),

	.din2_neq_din1		(din2_neq_din1_54_52),
	.din2_gt_din1		(din2_gt_din1_54_52)
);

fpu_in2_gt_in1_2b fpu_in2_gt_in1_51_50 (
	.din1			(din1[51:50]),
	.din2			(din2[51:50]),

	.din2_neq_din1		(din2_neq_din1_51_50),
	.din2_gt_din1		(din2_gt_din1_51_50)
);

fpu_in2_gt_in1_2b fpu_in2_gt_in1_49_48 (
        .din1                   (din1[49:48]),
        .din2                   (din2[49:48]),

        .din2_neq_din1          (din2_neq_din1_49_48),
        .din2_gt_din1           (din2_gt_din1_49_48)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_47_45 (
        .din1                   (din1[47:45]),
        .din2                   (din2[47:45]),

        .din2_neq_din1          (din2_neq_din1_47_45),
        .din2_gt_din1           (din2_gt_din1_47_45)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_44_42 (
        .din1                   (din1[44:42]),
        .din2                   (din2[44:42]),

        .din2_neq_din1          (din2_neq_din1_44_42),
        .din2_gt_din1           (din2_gt_din1_44_42)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_41_39 (
        .din1                   (din1[41:39]),
        .din2                   (din2[41:39]),

        .din2_neq_din1          (din2_neq_din1_41_39),
        .din2_gt_din1           (din2_gt_din1_41_39)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_38_36 (
        .din1                   (din1[38:36]),
        .din2                   (din2[38:36]),

        .din2_neq_din1          (din2_neq_din1_38_36),
        .din2_gt_din1           (din2_gt_din1_38_36)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_35_33 (
        .din1                   (din1[35:33]),
        .din2                   (din2[35:33]),

        .din2_neq_din1          (din2_neq_din1_35_33),
        .din2_gt_din1           (din2_gt_din1_35_33)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_32_30 (
        .din1                   (din1[32:30]),
        .din2                   (din2[32:30]),

        .din2_neq_din1          (din2_neq_din1_32_30),
        .din2_gt_din1           (din2_gt_din1_32_30)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_29_27 (
        .din1                   (din1[29:27]),
        .din2                   (din2[29:27]),

        .din2_neq_din1          (din2_neq_din1_29_27),
        .din2_gt_din1           (din2_gt_din1_29_27)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_26_24 (
        .din1                   (din1[26:24]),
        .din2                   (din2[26:24]),

        .din2_neq_din1          (din2_neq_din1_26_24),
        .din2_gt_din1           (din2_gt_din1_26_24)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_23_21 (
        .din1                   (din1[23:21]),
        .din2                   (din2[23:21]),

        .din2_neq_din1          (din2_neq_din1_23_21),
        .din2_gt_din1           (din2_gt_din1_23_21)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_20_18 (
        .din1                   (din1[20:18]),
        .din2                   (din2[20:18]),

        .din2_neq_din1          (din2_neq_din1_20_18),
        .din2_gt_din1           (din2_gt_din1_20_18)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_17_15 (
        .din1                   (din1[17:15]),
        .din2                   (din2[17:15]),

        .din2_neq_din1          (din2_neq_din1_17_15),
        .din2_gt_din1           (din2_gt_din1_17_15)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_14_12 (
        .din1                   (din1[14:12]),
        .din2                   (din2[14:12]),

        .din2_neq_din1          (din2_neq_din1_14_12),
        .din2_gt_din1           (din2_gt_din1_14_12)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_11_9 (
        .din1                   (din1[11:9]),
        .din2                   (din2[11:9]),

        .din2_neq_din1          (din2_neq_din1_11_9),
        .din2_gt_din1           (din2_gt_din1_11_9)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_8_6 (
        .din1                   (din1[8:6]),
        .din2                   (din2[8:6]),

        .din2_neq_din1          (din2_neq_din1_8_6),
        .din2_gt_din1           (din2_gt_din1_8_6)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_5_3 (
        .din1                   (din1[5:3]),
        .din2                   (din2[5:3]),

        .din2_neq_din1          (din2_neq_din1_5_3),
        .din2_gt_din1           (din2_gt_din1_5_3)
);

fpu_in2_gt_in1_3b fpu_in2_gt_in1_2_0 (
        .din1                   (din1[2:0]),
        .din2                   (din2[2:0]),

        .din2_neq_din1          (din2_neq_din1_2_0),
        .din2_gt_din1           (din2_gt_din1_2_0)
);


fpu_in2_gt_in1_3to1 fpu_in2_gt_in1_51_45 (
	.din2_neq_din1_hi	(din2_neq_din1_51_50),
	.din2_gt_din1_hi	(din2_gt_din1_51_50),
	.din2_neq_din1_mid	(din2_neq_din1_49_48),
	.din2_gt_din1_mid	(din2_gt_din1_49_48),
	.din2_neq_din1_lo	(din2_neq_din1_47_45),
	.din2_gt_din1_lo	(din2_gt_din1_47_45),

	.din2_neq_din1		(din2_neq_din1_51_45),
	.din2_gt_din1		(din2_gt_din1_51_45)
);

fpu_in2_gt_in1_3to1 fpu_in2_gt_in1_44_36 (
        .din2_neq_din1_hi       (din2_neq_din1_44_42),
        .din2_gt_din1_hi        (din2_gt_din1_44_42),
        .din2_neq_din1_mid      (din2_neq_din1_41_39),
        .din2_gt_din1_mid       (din2_gt_din1_41_39),
        .din2_neq_din1_lo       (din2_neq_din1_38_36),
        .din2_gt_din1_lo        (din2_gt_din1_38_36),

        .din2_neq_din1          (din2_neq_din1_44_36),
	.din2_gt_din1           (din2_gt_din1_44_36)
);

fpu_in2_gt_in1_3to1 fpu_in2_gt_in1_35_27 (
        .din2_neq_din1_hi       (din2_neq_din1_35_33),
        .din2_gt_din1_hi        (din2_gt_din1_35_33),
        .din2_neq_din1_mid      (din2_neq_din1_32_30),
        .din2_gt_din1_mid       (din2_gt_din1_32_30),
        .din2_neq_din1_lo       (din2_neq_din1_29_27),
        .din2_gt_din1_lo        (din2_gt_din1_29_27),

        .din2_neq_din1          (din2_neq_din1_35_27),
        .din2_gt_din1           (din2_gt_din1_35_27)
);

fpu_in2_gt_in1_3to1 fpu_in2_gt_in1_26_18 (
        .din2_neq_din1_hi       (din2_neq_din1_26_24),
        .din2_gt_din1_hi        (din2_gt_din1_26_24),
        .din2_neq_din1_mid      (din2_neq_din1_23_21),
        .din2_gt_din1_mid       (din2_gt_din1_23_21),
        .din2_neq_din1_lo       (din2_neq_din1_20_18),
        .din2_gt_din1_lo        (din2_gt_din1_20_18),

        .din2_neq_din1          (din2_neq_din1_26_18),
        .din2_gt_din1           (din2_gt_din1_26_18)
);

fpu_in2_gt_in1_3to1 fpu_in2_gt_in1_17_9 (
        .din2_neq_din1_hi       (din2_neq_din1_17_15),
        .din2_gt_din1_hi        (din2_gt_din1_17_15),
        .din2_neq_din1_mid      (din2_neq_din1_14_12),
        .din2_gt_din1_mid       (din2_gt_din1_14_12),
        .din2_neq_din1_lo       (din2_neq_din1_11_9),
        .din2_gt_din1_lo        (din2_gt_din1_11_9),

        .din2_neq_din1          (din2_neq_din1_17_9),
        .din2_gt_din1           (din2_gt_din1_17_9)
);

fpu_in2_gt_in1_3to1 fpu_in2_gt_in1_8_0 (
        .din2_neq_din1_hi       (din2_neq_din1_8_6),
        .din2_gt_din1_hi        (din2_gt_din1_8_6),
        .din2_neq_din1_mid      (din2_neq_din1_5_3),
        .din2_gt_din1_mid       (din2_gt_din1_5_3),
        .din2_neq_din1_lo       (din2_neq_din1_2_0),
        .din2_gt_din1_lo        (din2_gt_din1_2_0),

        .din2_neq_din1          (din2_neq_din1_8_0),
        .din2_gt_din1           (din2_gt_din1_8_0)
);


fpu_in2_gt_in1_3to1 fpu_in2_gt_in1_51_27 (
	.din2_neq_din1_hi       (din2_neq_din1_51_45),
	.din2_gt_din1_hi	(din2_gt_din1_51_45),
	.din2_neq_din1_mid      (din2_neq_din1_44_36),
	.din2_gt_din1_mid       (din2_gt_din1_44_36),
	.din2_neq_din1_lo       (din2_neq_din1_35_27),
	.din2_gt_din1_lo        (din2_gt_din1_35_27),

	.din2_neq_din1          (din2_neq_din1_51_27),
	.din2_gt_din1           (din2_gt_din1_51_27)
);

fpu_in2_gt_in1_3to1 fpu_in2_gt_in1_26_0 (
	.din2_neq_din1_hi       (din2_neq_din1_26_18),
	.din2_gt_din1_hi        (din2_gt_din1_26_18),
	.din2_neq_din1_mid      (din2_neq_din1_17_9),
	.din2_gt_din1_mid       (din2_gt_din1_17_9),
	.din2_neq_din1_lo       (din2_neq_din1_8_0),
	.din2_gt_din1_lo        (din2_gt_din1_8_0),

	.din2_neq_din1          (din2_neq_din1_26_0),
	.din2_gt_din1           (din2_gt_din1_26_0)
);


assign din2_neq_din1= din2_neq_din1_51_27
		|| din2_neq_din1_26_0
		|| (din2_neq_din1_54_52 && sngop);

assign din2_gt_din1= (din2_neq_din1_54_52 && din2_gt_din1_54_52
			&& sngop)
		|| ((!(din2_neq_din1_54_52 && sngop))
			&& din2_neq_din1_51_27 && din2_gt_din1_51_27)
		|| ((!(din2_neq_din1_54_52 && sngop))
			&& (!din2_neq_din1_51_27)
			&& din2_gt_din1_26_0);

assign din2_gt1_din1= expadd11
		|| (din2_gt_din1 && expeq);


endmodule


