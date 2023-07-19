// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_denorm_3to1.v
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
//      Reduce three fpu_denorm_3b results to one set of results.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_denorm_3to1 (
	din2_din1_nz_hi,
	din2_din1_denorm_hi,
	din2_din1_nz_mid,
	din2_din1_denorm_mid,
	din2_din1_nz_lo,
	din2_din1_denorm_lo,

	din2_din1_nz,
	din2_din1_denorm
);


input		din2_din1_nz_hi;	// input 1 and input 2 != 0- high 3 bits
input		din2_din1_denorm_hi;	// input 1 == denorm- high 3 bits
input		din2_din1_nz_mid;	// input 1 and input 2 != 0- mid 3 bits
input		din2_din1_denorm_mid;	// input 1 == denorm- mid 3 bits
input		din2_din1_nz_lo;	// input 1 and input 2 != 0- low 3 bits
input		din2_din1_denorm_lo;	// input 1 == denorm- low 3 bits

output		din2_din1_nz;		// input 1 and input 2 != 0
output		din2_din1_denorm;	// input 1 == denorm


wire		din2_din1_nz;
wire		din2_din1_denorm;


assign din2_din1_nz= din2_din1_nz_hi || din2_din1_nz_mid
		|| din2_din1_nz_lo;

assign din2_din1_denorm= (din2_din1_nz_hi && din2_din1_denorm_hi)
		|| ((!din2_din1_nz_hi) && din2_din1_nz_mid
			&& din2_din1_denorm_mid)
		|| ((!din2_din1_nz_hi) && (!din2_din1_nz_mid)
			&& din2_din1_denorm_lo);


endmodule


