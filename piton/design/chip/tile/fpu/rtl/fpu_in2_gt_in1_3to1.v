// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_in2_gt_in1_3to1.v
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
//	Reduce three fpu_in2_gt_in1_*b results to one set of results.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_in2_gt_in1_3to1 (
	din2_neq_din1_hi,
	din2_gt_din1_hi,
	din2_neq_din1_mid,
	din2_gt_din1_mid,
	din2_neq_din1_lo,
	din2_gt_din1_lo,

	din2_neq_din1,
	din2_gt_din1
);


input		din2_neq_din1_hi;	// input 2 != input 1- high 3 bits
input		din2_gt_din1_hi;	// input 2 > input 1- high 3 bits
input		din2_neq_din1_mid;	// input 2 != input 1- middle 3 bits
input		din2_gt_din1_mid;	// input 2 > input 1- middle 3 bits
input		din2_neq_din1_lo;	// input 2 != input 1- low 3 bits
input		din2_gt_din1_lo;	// input 2 > input 1- low 3 bits

output		din2_neq_din1;		// input 2 doesn't equal input 1
output		din2_gt_din1;		// input 2 is greater than input 1


wire		din2_neq_din1;
wire		din2_gt_din1;


assign din2_neq_din1= din2_neq_din1_hi || din2_neq_din1_mid || din2_neq_din1_lo;

assign din2_gt_din1= (din2_neq_din1_hi && din2_gt_din1_hi)
		|| ((!din2_neq_din1_hi) && din2_neq_din1_mid
			&& din2_gt_din1_mid)
		|| ((!din2_neq_din1_hi) && (!din2_neq_din1_mid)
			&& din2_gt_din1_lo);


endmodule


