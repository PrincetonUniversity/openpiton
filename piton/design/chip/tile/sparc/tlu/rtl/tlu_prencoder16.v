// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: tlu_prencoder16.v
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
//      Description:    Datapath Priority Encoder 16b
//				- 15b multihot vector as input
//				- 15b 1-hit vector as output
//				- Can use some std length such as 16b
//				- msb is given highest priority
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
`include        "sys.h" // system level definition file which contains the
                        // time scale definition

////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////

module	tlu_prencoder16 (din, dout);

input	[14:0]	din  ;
output	[3:0]	dout ;

wire	[14:0]	onehot ;

assign	onehot[14] = din[14] ;
assign	onehot[13] = din[13] & ~din[14] ;
assign	onehot[12] = din[12] & ~(|din[14:13]) ;
assign	onehot[11] = din[11] & ~(|din[14:12]) ;
assign	onehot[10] = din[10] & ~(|din[14:11]) ;
assign	onehot[9]  = din[9]  & ~(|din[14:10]) ;
assign	onehot[8]  = din[8]  & ~(|din[14:9]) ;
assign	onehot[7]  = din[7]  & ~(|din[14:8]) ;
assign	onehot[6]  = din[6]  & ~(|din[14:7]) ;
assign	onehot[5]  = din[5]  & ~(|din[14:6]) ;
assign	onehot[4]  = din[4]  & ~(|din[14:5]) ;
assign	onehot[3]  = din[3]  & ~(|din[14:4]) ;
assign	onehot[2]  = din[2]  & ~(|din[14:3]) ;
assign	onehot[1]  = din[1]  & ~(|din[14:2]) ;
assign	onehot[0]  = din[0]  & ~(|din[14:1]) ;
//assign	onehot[0]  = din[0]  & ~(|din[15:1]) ;

assign	dout[3]  =  |onehot[14:7] ;
assign	dout[2]  = (|onehot[6:3]) | (|onehot[14:11]) ;
assign	dout[1]  = (|onehot[2:1]) | (|onehot[6:5]) |
		   (|onehot[10:9]) | (|onehot[14:13]) ;
assign	dout[0]  =  onehot[0] | onehot[2] | onehot[4] | onehot[6] |
		    onehot[8] | onehot[10] | onehot[12] | onehot[14] ;

endmodule
