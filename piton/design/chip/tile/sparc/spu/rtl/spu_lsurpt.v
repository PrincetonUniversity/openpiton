// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: spu_lsurpt.v
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


module spu_lsurpt (


/*outputs*/

spu_lsurpt_ldxa_data_out,
spu_lsurpt_ldst_pckt_out,
spu_lsurpt_cpx_data_out,

/*inputs*/
spu_lsurpt_ldxa_data_in,
spu_lsurpt_ldst_pckt_in,
spu_lsurpt_cpx_data_in);

// ---------------------------------------------------------------------

input [63:0] spu_lsurpt_ldxa_data_in;
input [122:0] spu_lsurpt_ldst_pckt_in;
input [134:0] spu_lsurpt_cpx_data_in;

// ---------------------------------------------------------------------

output [63:0] spu_lsurpt_ldxa_data_out;
output [122:0] spu_lsurpt_ldst_pckt_out;
output [134:0] spu_lsurpt_cpx_data_out;

// ---------------------------------------------------------------------
// ---------------------------------------------------------------------
// ---------------------------------------------------------------------

// port postion should be: input on the TOP and output on BOTTOM.

assign spu_lsurpt_ldxa_data_out[63:0] = spu_lsurpt_ldxa_data_in[63:0];

// ---------------------------------------------------------------------

// port postion should be: input on the TOP and output on BOTTOM.

assign spu_lsurpt_ldst_pckt_out[122:0] = spu_lsurpt_ldst_pckt_in[122:0];

// ---------------------------------------------------------------------

// port postion should be: input on the BOTTOM and output on TOP.

assign spu_lsurpt_cpx_data_out[134:0] = spu_lsurpt_cpx_data_in[134:0];


endmodule
