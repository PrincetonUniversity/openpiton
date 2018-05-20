// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: cpx_spc_rpt.v
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
`include "sys.h"
`include "iop.h"
`include "ifu.tmp.h"
`include "lsu.tmp.h"

module cpx_spc_rpt (/*AUTOARG*/
   // Outputs
   so, cpx_spc_data_cx3, cpx_spc_data_rdy_cx3, 
   cpx_spc_data_cx3_b144to140, cpx_spc_data_cx3_b120to118, 
   cpx_spc_data_cx3_b0, cpx_spc_data_cx3_b4, cpx_spc_data_cx3_b8, 
   cpx_spc_data_cx3_b12, cpx_spc_data_cx3_b16, cpx_spc_data_cx3_b20, 
   cpx_spc_data_cx3_b24, cpx_spc_data_cx3_b28, cpx_spc_data_cx3_b32, 
   cpx_spc_data_cx3_b35, cpx_spc_data_cx3_b38, cpx_spc_data_cx3_b41, 
   cpx_spc_data_cx3_b44, cpx_spc_data_cx3_b47, cpx_spc_data_cx3_b50, 
   cpx_spc_data_cx3_b53, cpx_spc_data_cx3_b56, cpx_spc_data_cx3_b60, 
   cpx_spc_data_cx3_b64, cpx_spc_data_cx3_b68, cpx_spc_data_cx3_b72, 
   cpx_spc_data_cx3_b76, cpx_spc_data_cx3_b80, cpx_spc_data_cx3_b84, 
   cpx_spc_data_cx3_b88, cpx_spc_data_cx3_b91, cpx_spc_data_cx3_b94, 
   cpx_spc_data_cx3_b97, cpx_spc_data_cx3_b100, 
   cpx_spc_data_cx3_b103, cpx_spc_data_cx3_b106, 
   cpx_spc_data_cx3_b109, 
   // Inputs
   rclk, si, se, cpx_spc_data_cx2, cpx_spc_data_rdy_cx2
   );

input rclk;
   input si;
   input se;

   
input  [`CPX_WIDTH-1:0] cpx_spc_data_cx2;      
input                   cpx_spc_data_rdy_cx2;

   output               so;
output [`CPX_WIDTH-1:0] cpx_spc_data_cx3;
output                  cpx_spc_data_rdy_cx3;    

output [`CPX_WIDTH-1:140] cpx_spc_data_cx3_b144to140 ;
output [`CPX_INV_CID_HI:`CPX_INV_CID_LO] cpx_spc_data_cx3_b120to118 ;
output        cpx_spc_data_cx3_b0 ;
output        cpx_spc_data_cx3_b4 ;
output        cpx_spc_data_cx3_b8 ;
output        cpx_spc_data_cx3_b12 ;
output        cpx_spc_data_cx3_b16 ;
output        cpx_spc_data_cx3_b20 ;
output        cpx_spc_data_cx3_b24 ;
output        cpx_spc_data_cx3_b28 ;

output        cpx_spc_data_cx3_b32 ;
output        cpx_spc_data_cx3_b35 ;
output        cpx_spc_data_cx3_b38 ;
output        cpx_spc_data_cx3_b41 ;
output        cpx_spc_data_cx3_b44 ;
output        cpx_spc_data_cx3_b47 ;
output        cpx_spc_data_cx3_b50 ;
output        cpx_spc_data_cx3_b53 ;

output        cpx_spc_data_cx3_b56 ;
output        cpx_spc_data_cx3_b60 ;
output        cpx_spc_data_cx3_b64 ;
output        cpx_spc_data_cx3_b68 ;
output        cpx_spc_data_cx3_b72 ;
output        cpx_spc_data_cx3_b76 ;
output        cpx_spc_data_cx3_b80 ;
output        cpx_spc_data_cx3_b84 ;

output        cpx_spc_data_cx3_b88 ;
output        cpx_spc_data_cx3_b91 ;
output        cpx_spc_data_cx3_b94 ;
output        cpx_spc_data_cx3_b97 ;
output        cpx_spc_data_cx3_b100 ;
output        cpx_spc_data_cx3_b103 ;
output        cpx_spc_data_cx3_b106 ;
output        cpx_spc_data_cx3_b109 ;


reg [`CPX_WIDTH-1:0] cpx_spc_data_cx3;
reg                  cpx_spc_data_rdy_cx3;
   
always @(posedge rclk) begin
   cpx_spc_data_cx3     <= cpx_spc_data_cx2;
   cpx_spc_data_rdy_cx3 <= cpx_spc_data_rdy_cx2;
end

//timing fix: 9/5/03 - add separate buffer to lsu for signal that are used in bypass i.e. isolate from spu/ffu loading
assign  cpx_spc_data_cx3_b144to140[`CPX_WIDTH-1:140]  =  cpx_spc_data_cx3[`CPX_WIDTH-1:140] ;
assign  cpx_spc_data_cx3_b120to118[`CPX_INV_CID_HI:`CPX_INV_CID_LO]  =  cpx_spc_data_cx3[`CPX_INV_CID_HI:`CPX_INV_CID_LO] ;

assign  cpx_spc_data_cx3_b0  =  cpx_spc_data_cx3[0] ;
assign  cpx_spc_data_cx3_b4  =  cpx_spc_data_cx3[4] ;
assign  cpx_spc_data_cx3_b8  =  cpx_spc_data_cx3[8] ;
assign  cpx_spc_data_cx3_b12  =  cpx_spc_data_cx3[12] ;
assign  cpx_spc_data_cx3_b16  =  cpx_spc_data_cx3[16] ;
assign  cpx_spc_data_cx3_b20  =  cpx_spc_data_cx3[20] ;
assign  cpx_spc_data_cx3_b24  =  cpx_spc_data_cx3[24] ;
assign  cpx_spc_data_cx3_b28  =  cpx_spc_data_cx3[28] ;

assign  cpx_spc_data_cx3_b32  =  cpx_spc_data_cx3[32] ;
assign  cpx_spc_data_cx3_b35  =  cpx_spc_data_cx3[35] ;
assign  cpx_spc_data_cx3_b38  =  cpx_spc_data_cx3[38] ;
assign  cpx_spc_data_cx3_b41  =  cpx_spc_data_cx3[41] ;
assign  cpx_spc_data_cx3_b44  =  cpx_spc_data_cx3[44] ;
assign  cpx_spc_data_cx3_b47  =  cpx_spc_data_cx3[47] ;
assign  cpx_spc_data_cx3_b50  =  cpx_spc_data_cx3[50] ;
assign  cpx_spc_data_cx3_b53  =  cpx_spc_data_cx3[53] ;

assign  cpx_spc_data_cx3_b56  =  cpx_spc_data_cx3[56] ;
assign  cpx_spc_data_cx3_b60  =  cpx_spc_data_cx3[60] ;
assign  cpx_spc_data_cx3_b64  =  cpx_spc_data_cx3[64] ;
assign  cpx_spc_data_cx3_b68  =  cpx_spc_data_cx3[68] ;
assign  cpx_spc_data_cx3_b72  =  cpx_spc_data_cx3[72] ;
assign  cpx_spc_data_cx3_b76  =  cpx_spc_data_cx3[76] ;
assign  cpx_spc_data_cx3_b80  =  cpx_spc_data_cx3[80] ;
assign  cpx_spc_data_cx3_b84  =  cpx_spc_data_cx3[84] ;

assign  cpx_spc_data_cx3_b88  =  cpx_spc_data_cx3[88] ;
assign  cpx_spc_data_cx3_b91  =  cpx_spc_data_cx3[91] ;
assign  cpx_spc_data_cx3_b94  =  cpx_spc_data_cx3[94] ;
assign  cpx_spc_data_cx3_b97  =  cpx_spc_data_cx3[97] ;
assign  cpx_spc_data_cx3_b100  =  cpx_spc_data_cx3[100] ;
assign  cpx_spc_data_cx3_b103  =  cpx_spc_data_cx3[103] ;
assign  cpx_spc_data_cx3_b106  =  cpx_spc_data_cx3[106] ;
assign  cpx_spc_data_cx3_b109  =  cpx_spc_data_cx3[109] ;

endmodule   
