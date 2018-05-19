// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: tlu_addern_32.v
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
/*
//      Description:    parameterized adder macro
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
`include        "sys.h" // system level definition file which contains the
                        // time scale definition

////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////

module	tlu_addern_32 (din, incr, sum);
// synopsys template

parameter ADDER_DATA_WIDTH = 33;
parameter INCR_DATA_WIDTH  =  1;
parameter UPPER_DATA_WIDTH =  ADDER_DATA_WIDTH - INCR_DATA_WIDTH;

input	[ADDER_DATA_WIDTH-1:0]	din;
input	[INCR_DATA_WIDTH-1:0]   incr;
output	[ADDER_DATA_WIDTH-1:0]	sum;
//
////////////////////////////////////////////////////////////////////////
// local signal declaraiont
////////////////////////////////////////////////////////////////////////

assign	sum[ADDER_DATA_WIDTH-1:0] =
            din[ADDER_DATA_WIDTH-1:0] + {{UPPER_DATA_WIDTH{1'b0}},incr[INCR_DATA_WIDTH-1:0]};

endmodule // tlu_addern_32
