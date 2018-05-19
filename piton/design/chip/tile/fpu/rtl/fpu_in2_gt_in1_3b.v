// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_in2_gt_in1_3b.v
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
//	Three bit comparison of two inputs that can have any value.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_in2_gt_in1_3b (
	din1,
	din2,

	din2_neq_din1,
	din2_gt_din1
);


input [2:0]	din1;			// input 1- 3 bits
input [2:0]	din2;			// input 2- 3 bits

output		din2_neq_din1;		// input 2 doesn't equal input 1
output		din2_gt_din1;		// input 2 is greater than input 1


wire [2:0]	din2_eq_din1;
wire		din2_neq_din1;
wire		din2_gt_din1;


assign din2_eq_din1[2:0]= (~(din1 ^ din2));

assign din2_neq_din1= (!(&din2_eq_din1));

assign din2_gt_din1= ((!din1[2]) && din2[2])
		|| (din2_eq_din1[2] && (!din1[1]) && din2[1])
		|| ((&din2_eq_din1[2:1]) && (!din1[0]) && din2[0]);


endmodule


