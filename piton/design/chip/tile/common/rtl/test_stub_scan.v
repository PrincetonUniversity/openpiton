// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: test_stub_scan.v
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
// ____________________________________________________________________________
//
//  test_stub_bist - Test Stub with Scan Support
// ____________________________________________________________________________
//
// Description: DBB interface for test signal generation
// ____________________________________________________________________________

module test_stub_scan (/*AUTOARG*/
// Outputs
mux_drive_disable, mem_write_disable, sehold, se, testmode_l, 
mem_bypass, so_0, so_1, so_2, 
// Inputs
ctu_tst_pre_grst_l, arst_l, global_shift_enable, 
ctu_tst_scan_disable, ctu_tst_scanmode, ctu_tst_macrotest, 
ctu_tst_short_chain, long_chain_so_0, short_chain_so_0, 
long_chain_so_1, short_chain_so_1, long_chain_so_2, short_chain_so_2
);

   input        ctu_tst_pre_grst_l;
   input        arst_l;                // no longer used
   input        global_shift_enable;
   input        ctu_tst_scan_disable;  // redefined as pin_based_scan
   input        ctu_tst_scanmode;
   input 	ctu_tst_macrotest;
   input 	ctu_tst_short_chain;
   input 	long_chain_so_0;
   input 	short_chain_so_0;
   input 	long_chain_so_1;
   input 	short_chain_so_1;
   input 	long_chain_so_2;
   input 	short_chain_so_2;
   
   output 	mux_drive_disable;
   output 	mem_write_disable;
   output 	sehold;
   output 	se;
   output 	testmode_l;
   output 	mem_bypass;
   output 	so_0;
   output 	so_1;
   output 	so_2;

   wire         pin_based_scan;
   wire         short_chain_en;
   wire         short_chain_select;

   // INTERNAL CLUSTER CONNECTIONS
   //
   // Scan Chain Hookup
   // =================
   //
   // Scan chains have two configurations: long and short.
   // The short chain is typically the first tenth of the
   // long chain. The short chain should contain memory
   // collar flops for deep arrays. The CTU determines
   // which configuration is selected. Up to three chains
   // are supported.
   //
   // The scanout connections from the long and short
   // chains connect to the following inputs:
   //
   // long_chain_so_0, short_chain_so_0 (mandatory)
   // long_chain_so_1, short_chain_so_1 (optional)
   // long_chain_so_2, short_chain_so_2 (optional)
   //
   // The test stub outputs should connect directly to the
   // scanout port(s) of the cluster:
   //
   // so_0 (mandatory), so_1 (optional), so_2 (optional)
   //
   //
   // Static Output Signals
   // =====================
   //
   // testmode_l
   //
   // Local testmode control for overriding gated
   // clocks, asynchronous resets, etc. Asserted
   // for all shift-based test modes.
   //
   // mem_bypass
   //
   // Memory bypass control for arrays without output
   // flops. Allows testing of shadow logic. Asserted
   // for scan test; de-asserted for macrotest.
   //
   //
   // Dynamic Output Signals
   // ======================
   //
   // sehold
   //
   // The sehold signal needs to be set for macrotest
   // to allow holding flops in the array collars
   // to retain their shifted data during capture.
   // Inverted version of scan enable during macrotest.
   //
   // mux_drive_disable (for mux/long chain protection)
   //
   // Activate one-hot mux protection circuitry during
   // scan shift and reset. Formerly known as rst_tri_en.
   // Also used by long chain memories with embedded
   // control.
   //
   // mem_write_disable (for short chain protection)
   //
   // Protects contents of short chain memories during
   // shift and POR.
   //
   // se

   assign  mux_drive_disable  = ~ctu_tst_pre_grst_l | short_chain_select | se;
   assign  mem_write_disable  = ~ctu_tst_pre_grst_l | se;
   assign  sehold             = ctu_tst_macrotest & ~se;
   assign  se                 = global_shift_enable;
   assign  testmode_l         = ~ctu_tst_scanmode;
   assign  mem_bypass         = ~ctu_tst_macrotest & ~testmode_l;
   assign  pin_based_scan     = ctu_tst_scan_disable;
   assign  short_chain_en     = ~(pin_based_scan & se);
   assign  short_chain_select = ctu_tst_short_chain & ~testmode_l & short_chain_en;
   assign  so_0               = short_chain_select ? short_chain_so_0 : long_chain_so_0;
   assign  so_1               = short_chain_select ? short_chain_so_1 : long_chain_so_1;
   assign  so_2               = short_chain_select ? short_chain_so_2 : long_chain_so_2;
   
endmodule // test_stub_scan
