// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_denorm_3b.v
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
//      Three bit comparison of two inputs when both will always have
//		leading 0s.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_denorm_3b (
	din1,
	din2,

	din2_din1_nz,
	din2_din1_denorm
);


input [2:0]     din1;                   // input 1- 3 bits
input [2:0]     din2;                   // input 2- 3 bits

output		din2_din1_nz;		// input 1 and input 2 are not 0
output		din2_din1_denorm;	// input 1 is a denorm


wire [2:0]	din2_din1_zero;
wire		din2_din1_nz;
wire		din2_din1_denorm;


assign din2_din1_zero[2:0]= (~(din1 | din2));

assign din2_din1_nz= (!(&din2_din1_zero[2:0]));

assign din2_din1_denorm= din2[2]
		|| (din2_din1_zero[2] && din2[1])
		|| ((&din2_din1_zero[2:1]) && din2[0]);


endmodule


