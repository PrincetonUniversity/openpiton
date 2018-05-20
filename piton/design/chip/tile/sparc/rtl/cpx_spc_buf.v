// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: cpx_spc_buf.v
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

module cpx_spc_buf (/*AUTOARG*/
   // Outputs
   cpx_spc_data_cx2_buf, cpx_spc_data_rdy_cx2_buf, 
   // Inputs
   cpx_spc_data_cx2, cpx_spc_data_rdy_cx2
   );

   
input  [`CPX_WIDTH-1:0] cpx_spc_data_cx2;      
input                   cpx_spc_data_rdy_cx2;

output [`CPX_WIDTH-1:0] cpx_spc_data_cx2_buf;
output                  cpx_spc_data_rdy_cx2_buf;    

assign  cpx_spc_data_rdy_cx2_buf  =  cpx_spc_data_rdy_cx2 ;
assign  cpx_spc_data_cx2_buf  =  cpx_spc_data_cx2 ;

endmodule   
  
