// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: cluster_header_sync.v
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
// The sync pulse cluster header is instatiated as a hard macro.
// This model is for simulation only.

module cluster_header_sync (/*AUTOARG*/
   // Outputs
   dram_rx_sync_local, dram_tx_sync_local, jbus_rx_sync_local, 
   jbus_tx_sync_local, so, 
   // Inputs
   dram_rx_sync_global, dram_tx_sync_global, jbus_rx_sync_global, 
   jbus_tx_sync_global, cmp_gclk, cmp_rclk, si, se
   );

   output dram_rx_sync_local;
   output dram_tx_sync_local;
   output jbus_rx_sync_local;
   output jbus_tx_sync_local;
   output so;

   input  dram_rx_sync_global;
   input  dram_tx_sync_global;
   input  jbus_rx_sync_global;
   input  jbus_tx_sync_global;
   input  cmp_gclk;
   input  cmp_rclk;
   input  si;
   input  se;

   wire   dram_rx_so;
   wire   dram_tx_so;
   wire   jbus_rx_so;

   bw_clk_cclk_sync sync_wrapper (
				  .dram_rx_sync_local(dram_rx_sync_local),
				  .dram_tx_sync_local(dram_tx_sync_local),
				  .jbus_rx_sync_local(jbus_rx_sync_local),
				  .jbus_tx_sync_local(jbus_tx_sync_local),
				  .so(so),
				  .dram_rx_sync_global(dram_rx_sync_global),
				  .dram_tx_sync_global(dram_tx_sync_global),
				  .jbus_rx_sync_global(jbus_rx_sync_global),
				  .jbus_tx_sync_global(jbus_tx_sync_global),
				  .cmp_gclk(cmp_gclk),
				  .cmp_rclk(cmp_rclk),
				  .si(si),
				  .se(se)
				  );			       

endmodule // cluster_header_sync
