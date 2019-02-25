// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: cmp_pcxandcpx.v
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
////////////////////////////////////////////////////////

`include "sys.h"
`include "iop.h"
`include "cross_module.tmp.h"

module cmp_pcxandcpx (/*AUTOARG*/
   // Inputs
   clk, rst_l, spc_pcx_req_pq, spc_pcx_data_pa, cpx_spc_data_cx, cpu
   );

   input clk;
   input rst_l;
   //siganls
   input [4:0] 		  spc_pcx_req_pq;
   input [`PCX_WIDTH-1:0] spc_pcx_data_pa;
   input [`CPX_WIDTH-1:0] cpx_spc_data_cx;
   input [31:0] 	  cpu;

   reg [127:0] 		  pcx;

   reg spc_pcx_req_pq_vld;

   always @(posedge clk)begin

// victorm 08/11/03
      spc_pcx_req_pq_vld <= #1 |spc_pcx_req_pq[4:0];

      if(spc_pcx_data_pa[`PCX_VLD] &&
	 (`PC_CMP.finish_mask != `PC_CMP.good) &&
	 (`MONITOR.bad == 0)) begin
	case(spc_pcx_data_pa[`PCX_RQ_HI:`PCX_RQ_LO])
	  `LOAD_RQ   : pcx = "LOAD_RQ";
	  `IMISS_RQ  : pcx = "IMISS_RQ";
	  `STORE_RQ  : pcx = "STORE_RQ";
	  `CAS1_RQ   : pcx = "CAS1_RQ";
	  `CAS2_RQ   : pcx = "CAS2_RQ";
	  `SWAP_RQ   : pcx = "SWAP_RQ";
	  `STRLOAD_RQ: pcx = "STRLOAD_RQ";
	  `STRST_RQ  : pcx = "STRST_RQ";
	  `STQ_RQ    : pcx = "STQ_RQ";
	  `INT_RQ    : pcx = "INT_RQ";
	  `FWD_RQ    : pcx = "FWD_RQ";
	  `FWD_RPY   : pcx = "FWD_RPY";
	  `RSVD_RQ   : pcx = "RSVD_RQ";
	  5'b01010   : pcx = "FPOP1";
	  5'b01011   : pcx = "FPOP2";
	endcase
        if(spc_pcx_req_pq_vld)
	  $display("%0d:Info cpu(%1d) pcx %0s packet received -> %b", $time, cpu, pcx, spc_pcx_data_pa);
      end

      if(cpx_spc_data_cx[`CPX_VLD] &&
	//(`PC_CMP.finish_mask != `PC_CMP.good) &&
	 (`MONITOR.bad == 0))begin
	 case(cpx_spc_data_cx[`CPX_RQ_HI:`CPX_RQ_LO])
	   `LOAD_RET : pcx = "LOAD_RET";
	   `IFILL_RET: pcx = "IFILL_RET";
	   `INV_RET  : pcx = "INV_RET";
	   `ST_ACK   : pcx = "ST_ACK";
	   `AT_ACK   : pcx = "AT_ACK";
	   `INT_RET  : begin
	      pcx = "INT_RET";
	      if(cpx_spc_data_cx[17:16] == 3)begin
      		 if(`PC_CMP.active_thread[{cpu,cpx_spc_data_cx[9:8]}])begin
      		    `PC_CMP.back_thread[{cpu,cpx_spc_data_cx[9:8]}]=1;
		       end
	      end
	      if(cpx_spc_data_cx[17:16] != 1)begin
		 $display("%0d:Info cpu(%1d) thread(%x) received interrupt vector -> %x Also, active_thread->%x", $time,
			  cpu, cpx_spc_data_cx[9:8], cpx_spc_data_cx[5:0], `PC_CMP.active_thread);
	      end
	      else if(cpx_spc_data_cx[17:16] == 1)begin
		 if(`PC_CMP.active_thread[{cpu,cpx_spc_data_cx[9:8]}])`PC_CMP.back_thread[{cpu,cpx_spc_data_cx[9:8]}]=1;
		 `PC_CMP.active_thread[{cpu,cpx_spc_data_cx[9:8]}] = 1'b1;
		 $display("%0d:Info cpu(%1d) thread(%x) received interrupt vector -> %x Also, active_thread->%x", $time,
			  cpu, cpx_spc_data_cx[9:8], cpx_spc_data_cx[5:0], `PC_CMP.active_thread);
	      end
	   end
	   `TEST_RET : pcx = "TEST_RET";
	   `FP_RET   : pcx = "FP_RET";
	   `EVICT_REQ: pcx = "EVICT_REQ";
	   `ERR_RET  : pcx = "ERR_RET";
	   `STRLOAD_RET : pcx = "STRLOAD_RET";
	   `STRST_ACK: pcx = "STRST_ACK";
	   `FWD_RQ_RET:pcx = "FWD_RQ_RET";
	   `FWD_RPY_RET:pcx= "FWD_RPY_RET";
	   `RSVD_RET : pcx = "RSVD_RET";
	 endcase
	 $display("%0d:Info cpu(%1d) cpx %0s packet received -> %b", $time, cpu, pcx, cpx_spc_data_cx);
      end
   end
endmodule
