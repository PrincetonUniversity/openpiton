// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: spc_pcx_buf.v
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

module spc_pcx_buf (/*AUTOARG*/
   // Outputs
   spc_pcx_data_pa, spc_pcx_atom_pq, spc_pcx_req_pq, 
   pcx_spc_grant_px_buf, 
   // Inputs
   spc_pcx_data_pa_buf, spc_pcx_atom_pq_buf, spc_pcx_req_pq_buf, 
   pcx_spc_grant_px
   );

   
input  [`PCX_WIDTH-1:0] spc_pcx_data_pa_buf;      
input                   spc_pcx_atom_pq_buf;
input  [4:0]            spc_pcx_req_pq_buf;
input  [4:0]            pcx_spc_grant_px;

output [`PCX_WIDTH-1:0] spc_pcx_data_pa;
output                  spc_pcx_atom_pq;    
output [4:0]            spc_pcx_req_pq;    
output [4:0]            pcx_spc_grant_px_buf;


assign  spc_pcx_req_pq  =  spc_pcx_req_pq_buf ;
assign  spc_pcx_atom_pq  =  spc_pcx_atom_pq_buf ;
assign  spc_pcx_data_pa  =  spc_pcx_data_pa_buf ;

assign  pcx_spc_grant_px_buf  =  pcx_spc_grant_px ;
endmodule   
  
