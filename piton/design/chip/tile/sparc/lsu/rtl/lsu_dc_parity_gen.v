// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: lsu_dc_parity_gen.v
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
////////////////////////////////////////////////////////////////////////
//
//  Module Name: lsu_dc_parity_gen.v
//  Description: Parity Generator based on odd parity

module lsu_dc_parity_gen (parity_out, data_in);

// Changed the default to match that of dcache width
parameter WIDTH = 8 ;
parameter NUM = 16 ;

input	[WIDTH * NUM - 1 : 0]	data_in ; // data in

output	[NUM - 1 : 0]		parity_out ; // parity output
reg	[NUM - 1 : 0]		parity ; // parity output

integer i ;
integer j ;

always @(data_in)
    for (i = 0; i <= NUM - 1 ; i = i + 1) begin
	    parity[i] = 1'b0 ;
        for (j = WIDTH * i; j <= WIDTH * (i + 1) - 1 ; j = j + 1) begin
            parity[i] = parity[i] ^ data_in[j] ;
        end
    end

assign parity_out[NUM - 1 : 0] = parity[NUM - 1 : 0];

endmodule
