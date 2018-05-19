// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: sys_paths.h
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
// -*- verilog -*-
////////////////////////////////////////////////////////////////////////
/*
//
// Description:		Global header file that contain definitions that 
//                      are common/shared at the systme level
*/
////////////////////////////////////////////////////////////////////////

// Here we add defines for all the blocks referenced in monitors.
// The absolute path would vary based on the verif model being built.

// Global CIOP defines
`define      RBC           sys_top
`define      RBC_CLK      `RBC.jbus_gclk
`define      CPU_CLK      `RBC.cmp_gclk
`define      CHIP_RST_L   `RBC.jbus_grst_l
`define      CHIP_RST     ~`RBC.jbus_grst_l

// BSC defines
`define      BSC          `RBC.iop.bsc
`define      BSC_CTL      `BSC.bsc_ctl
`define      BSC_SFS      `BSC_CTL.bsc_sfs
`define      BSC_IOP      `BSC.bsc_iop
`define      BSC_EEPU     `BSC_IOP.eepu_ioq

// Environment defines
`define     FAIL_FLAG     sys_top.fail_flag
