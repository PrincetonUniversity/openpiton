// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: dram_reg_rd_wr_warm_rst_no_SR.s
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
/***********************************************************************
 * Name:    dram_reg_rd_wr_warm_rst.s
 * Date:    July 28, 2003
 *
 *  Description: Register read write
 *               Loop to cover all 4 channels.
 *               Warm Reset and then data is read
 *
 *
 **********************************************************************/

#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text
.global main


main:

  ! Boot code does not provide TLB translation for IO address space
  ta    T_CHANGE_HPRIV

        ! Determine if we came from cold reset
        setx    0x9800000810, %g1, %g2
        ldx     [%g2], %g1
        and     %g1, 4, %g1
        brz     %g1, check


!   For warm reset this register need be set to 1 ( bit 61, CLK_CTL)
!  setx  0x9600000000, %l0, %l1
!  setx  0x2000000000000000, %l0, %l5
!  ldx   [%l1+0x08], %l4
!  or    %l5, %l4, %l4
!  stx   %l4, [%l1+0x08]
  !ta    T_CHANGE_NONHPRIV


  setx  0x9700000000, %l0, %l1
  set   0x1000, %l2           ! next channel addition
  add   %g0, 0x4, %l3         ! loop count 4, all ch

loop01:

  ! DRAM CAS Address Width
  ldx   [%l1], %l0
  cmp   %l0, 0xb
  bne   test_fail
  nop

  ! DRAM RAS Address Width
  ldx   [%l1+0x8], %l0
  cmp   %l0, 0xf
  bne   test_fail
  nop

  ! DRAM CAS Latency
  ldx   [%l1+0x10], %l0
  cmp   %l0, 0x3
  bne   test_fail
  nop

  ! DRAM Scrub Frequency 
  or    %g0,0x111, %l6
  stx   %l6,[%l1+0x18]
  ldx   [%l1+0x18], %l0
  cmp   %l0, 0x111
  bne   test_fail
  nop

  ! DRAM Refresh Frequency 
  or    %g0,0x505, %l6
  stx   %l6,[%l1+0x20]
  ldx   [%l1+0x20], %l0
  cmp   %l0, 0x505
  bne   test_fail
  nop

  ! DRAM Open Bank Max 
  or    %g0,0x505, %l6
  stx   %l6,[%l1+0x28]
  ldx   [%l1+0x28], %l0
  set   0x505, %l4
  cmp   %l0, %l4
  bne   test_fail
  nop

  ! DRAM Refresh counter, since free running no comparision
  ldx   [%l1+0x38], %l0
  nop

  ! DRAM Scrub Enable
  or    %g0,0x1, %l6
  stx   %l6, [%l1+0x40]
  ldx   [%l1+0x40], %l0
  cmp   %l0, 0x1
  bne   test_fail
  nop

  ! DRAM Programmable timer ( during which max open bank valid )
  or    %g0,0x505, %l6
  stx   %l6, [%l1+0x48]
  ldx   [%l1+0x48], %l0
  set   0x505, %l4
  cmp   %l0,  %l4
  bne   test_fail
  nop

  ! DRAM TRRD
  or    %g0,0x4, %l6
  stx   %l6, [%l1+0x80]
  ldx   [%l1+0x80], %l0
  cmp   %l0, 0x4
  bne   test_fail
  nop

  ! DRAM TRC
  or    %g0,0xe, %l6
  stx   %l6, [%l1+0x88]
  ldx   [%l1+0x88], %l0
  cmp   %l0, 0xe
  bne   test_fail
  nop

  ! DRAM TRCD
  or    %g0,0x8, %l6
  stx   %l6, [%l1+0x90]
  ldx   [%l1+0x90], %l0
  cmp   %l0, 0x8
  bne   test_fail
  nop

  ! DRAM TWTR
  or    %g0,0x2, %l6
  stx   %l6, [%l1+0x98]
  ldx   [%l1+0x98], %l0
  cmp   %l0, 0x2
  bne   test_fail
  nop

  ! DRAM TRTW
  or    %g0,0x2, %l6
  stx   %l6, [%l1+0xa0]
  ldx   [%l1+0xa0], %l0
  cmp   %l0, 0x2
  bne   test_fail
  nop

  ! DRAM TRTP
  or    %g0,0x3, %l6
  stx   %l6, [%l1+0xa8]
  ldx   [%l1+0xa8], %l0
  cmp   %l0, 0x3
  bne   test_fail
  nop

  ! DRAM TRAS
  or    %g0,0xa, %l6
  stx   %l6, [%l1+0xb0]
  ldx   [%l1+0xb0], %l0
  cmp   %l0, 0xa
  bne   test_fail
  nop

  ! DRAM TRP
  or    %g0,0x4, %l6
  stx   %l6, [%l1+0xb8]
  ldx   [%l1+0xb8], %l0
  cmp   %l0, 0x4
  bne   test_fail
  nop

  ! DRAM TWR
  or    %g0,0x4, %l6
  stx   %l6, [%l1+0xc0]
  ldx   [%l1+0xc0], %l0
  cmp   %l0, 0x4
  bne   test_fail
  nop

  ! DRAM TRFC
  or    %g0,0x42, %l6
  stx   %l6, [%l1+0xc8]
  ldx   [%l1+0xc8], %l0
  cmp   %l0, 0x42
  bne   test_fail
  nop

  ! DRAM TMRD
  or    %g0,0x3, %l6
  stx   %l6, [%l1+0xd0]
  ldx   [%l1+0xd0], %l0
  cmp   %l0, 0x3
  bne   test_fail
  nop

  ! DRAM TIWTR
  or    %g0,0x3, %l6
  stx   %l6, [%l1+0xe0]
  ldx   [%l1+0xe0], %l0
  cmp   %l0, 0x3
  bne   test_fail
  nop

  ! DRAM PRECHRG WAIT
  or    %g0,0x66, %l6
  stx   %l6,[%l1+0xe8]
  ldx   [%l1+0xe8], %l0
  cmp   %l0, 0x66
  bne   test_fail
  nop

  ! DRAM DIMM STACK
  ldx   [%l1+0x108], %l0
  cmp   %l0, 0x1
  bne   test_fail
  nop

  ! DRAM EMRS2
  or    %g0,0xf0f, %l6
  stx   %l6, [%l1+0x110]
  ldx   [%l1+0x110], %l0
  cmp   %l0, 0xf0f
  bne   test_fail
  nop

  ! DRAM EMRS1
  or    %g0,0x0f0, %l6
  stx   %l6, [%l1+0x118]
  ldx   [%l1+0x118], %l0
  cmp   %l0, 0x0f0
  bne   test_fail
  nop

  ! DRAM EMRS3
  or    %g0,0x123, %l6
  stx   %l6, [%l1+0x120]
  ldx   [%l1+0x120], %l0
  cmp   %l0, 0x123
  bne   test_fail
  nop

  ! DRAM 8 Bank Mode 
  ldx   [%l1+0x128], %l0
  cmp   %l0, 0x1
  bne   test_fail
  nop

  ! DRAM Rank1 present
  ldx   [%l1+0x130], %l0
  cmp   %l0, 0x1
  bne   test_fail
  nop

  ! DRAM Channel Disable
  or    %g0,0x0, %l6
  stx   %l6, [%l1+0x138]
  ldx   [%l1+0x138], %l0
  cmp   %l0, 0x0
  bne   test_fail
  nop

  ! DRAM Sel low order
  or    %g0,0x0, %l6
  stx   %l6, [%l1+0x140]
  ldx   [%l1+0x140], %l0
  cmp   %l0, 0x0
  bne   test_fail
  nop

  ! DRAM Dimm init
  ldx   [%l1+0x1a0], %l0
  cmp   %l0, 0x6  ! Forced by environment
  bne   test_fail
  nop

  ! DRAM SW Data ret cnt
  ldx   [%l1+0x1b0], %l0
  cmp   %l0, 0x1
  bne   test_fail
  nop

  ! DRAM HW Dmux clk inv
  ldx   [%l1+0x1b8], %l0
  cmp   %l0, 0x0
  bne   test_fail
  nop

  ! DRAM Read Enb clk inv, etc
  ldx   [%l1+0x1c0], %l0
  cmp   %l0, 0xc
  bne   test_fail
  nop

  ! DRAM Mode Reg Write Status (RO)
  ldx   [%l1+0x208], %l0
  cmp   %l0, 0x1
  bne   test_fail
  nop

  ! DRAM Init status
  ldx   [%l1+0x210], %l0
  cmp   %l0, 0x1
  bne   test_fail
  nop

  ! DRAM DIMM Present
#ifdef SLAM_INIT_CMP
  ldx   [%l1+0x218], %l0
  cmp   %l0, 0x3
  bne   test_fail
  nop
#endif

  ! DRAM Fail Over
  or    %g0,0x0, %l6
  stx   %l6, [%l1+0x220]
  ldx   [%l1+0x220], %l0
  cmp   %l0, 0x0
  bne   test_fail
  nop

  ! DRAM Fail Over Mask
  or    %g0,0x0, %l6
  stx   %l6, [%l1+0x228]
  ldx   [%l1+0x228], %l0
  cmp   %l0, 0x0
  bne   test_fail
  nop

  ! DRAM Debug Trigger
  ldx   [%l1+0x230], %l0
  cmp   %l0, 0xa8
  bne   test_fail
  nop

  ! DRAM Error Status ( Uninitalized ) 
  setx  0xfe00000000000000,%l0,%l4
  stx   %l4, [%l1+0x280]
  ldx   [%l1+0x280], %l0
  cmp   %l0, 0x0
  bne   test_fail
  nop

  ! DRAM Error Address ( Uninitalized ) 
  setx  0x000000fffffffff0,%l0,%l4
  stx   %l4, [%l1+0x288]
  ! UNCOMMENT THIS AFTER A SMALL BUG FIX
  ! ldx   [%l1+0x288], %l0
  ! cmp   %l0, %l4
  ! bne   test_fail
  nop

  ! DRAM Error Injection register
  or    %g0,0x123, %l6
  stx   %l6, [%l1+0x290]
  ldx   [%l1+0x290], %l0
  cmp   %l0, 0x123
  bne   test_fail
  nop

  ! DRAM Error Counter [Uninit]
  or    %g0,0x123, %l6
  stx   %l6, [%l1+0x298]
  ldx   [%l1+0x298], %l0
  cmp   %l0, 0x123
  bne   test_fail
  nop

  ! DRAM Error Location [uninit] No comparision, read only
  setx  0x0000000ffffffff0,%l0,%l4
  stx   %l4, [%l1+0x2a0]
  ldx   [%l1+0x2a0], %l0
  !cmp   %l0, %l4
  !bne   test_fail
  !nop

  ! DRAM Perf Control
  or    %g0,0x78, %l6
  stx   %l6, [%l1+0x400]
  ldx   [%l1+0x400], %l0
  cmp   %l0, 0x78
  bne   test_fail
  nop

  ! DRAM Perf count
  setx  0x0505050505050505,%l0,%l4
  stx   %l4, [%l1+0x408]
  ldx   [%l1+0x408], %l0
  cmp   %l0, %l4
  bne   test_fail
  nop

  add   %l1, %l2, %l1        ! next channel

  deccc   %l3
  bne     loop01                                  ! repeat
  nop


warm_rst:
        nop  !$EV  trig_pc_d(1, @VA(.MAIN.warm_rst)) -> warmrst()
        nop 

check :

  setx  0x9700000000, %l0, %l1
  set   0x1000, %l2           ! next channel addition
  add   %g0, 0x4, %l3         ! loop count 4, all ch

loop_new:

  ! DRAM CAS Address Width
  ldx   [%l1], %l0
  cmp   %l0, 0xb
  bne   test_fail
  nop

  ! DRAM RAS Address Width
  ldx   [%l1+0x8], %l0
  cmp   %l0, 0xf
  bne   test_fail
  nop

  ! DRAM CAS Latency
  ldx   [%l1+0x10], %l0
  cmp   %l0, 0x3
  bne   test_fail
  nop

  ! DRAM Scrub Frequency 
  or    %g0,0x111, %l6
  ldx   [%l1+0x18], %l0
  cmp   %l0, 0x111
  bne   test_fail
  nop

  ! DRAM Refresh Frequency 
  or    %g0,0x505, %l6
  ldx   [%l1+0x20], %l0
  cmp   %l0, 0x505
  bne   test_fail
  nop

  ! DRAM Open Bank Max 
  or    %g0,0x505, %l6
  ldx   [%l1+0x28], %l0
  set   0x505, %l4
  cmp   %l0, %l4
  bne   test_fail
  nop

  ! DRAM Refresh counter, since free running no comparision
  ldx   [%l1+0x38], %l0
  nop

  ! DRAM Scrub Enable
  or    %g0,0x1, %l6
  ldx   [%l1+0x40], %l0
  cmp   %l0, 0x1
  bne   test_fail
  nop

  ! DRAM Programmable timer ( during which max open bank valid )
  or    %g0,0x505, %l6
  ldx   [%l1+0x48], %l0
  set   0x505, %l4
  cmp   %l0,  %l4
  bne   test_fail
  nop

  ! DRAM TRRD
  or    %g0,0x4, %l6
  ldx   [%l1+0x80], %l0
  cmp   %l0, 0x4
  bne   test_fail
  nop

  ! DRAM TRC
  or    %g0,0xe, %l6
  ldx   [%l1+0x88], %l0
  cmp   %l0, 0xe
  bne   test_fail
  nop

  ! DRAM TRCD
  or    %g0,0x8, %l6
  ldx   [%l1+0x90], %l0
  cmp   %l0, 0x8
  bne   test_fail
  nop

  ! DRAM TWTR
  or    %g0,0x2, %l6
  ldx   [%l1+0x98], %l0
  cmp   %l0, 0x2
  bne   test_fail
  nop

  ! DRAM TRTW
  or    %g0,0x2, %l6
  ldx   [%l1+0xa0], %l0
  cmp   %l0, 0x2
  bne   test_fail
  nop

  ! DRAM TRTP
  or    %g0,0x3, %l6
  ldx   [%l1+0xa8], %l0
  cmp   %l0, 0x3
  bne   test_fail
  nop

  ! DRAM TRAS
  or    %g0,0xa, %l6
  ldx   [%l1+0xb0], %l0
  cmp   %l0, 0xa
  bne   test_fail
  nop

  ! DRAM TRP
  or    %g0,0x4, %l6
  ldx   [%l1+0xb8], %l0
  cmp   %l0, 0x4
  bne   test_fail
  nop

  ! DRAM TWR
  or    %g0,0x4, %l6
  ldx   [%l1+0xc0], %l0
  cmp   %l0, 0x4
  bne   test_fail
  nop

  ! DRAM TRFC
  or    %g0,0x42, %l6
  ldx   [%l1+0xc8], %l0
  cmp   %l0, 0x42
  bne   test_fail
  nop

  ! DRAM TMRD
  or    %g0,0x3, %l6
  ldx   [%l1+0xd0], %l0
  cmp   %l0, 0x3
  bne   test_fail
  nop

  ! DRAM TIWTR
  or    %g0,0x3, %l6
  ldx   [%l1+0xe0], %l0
  cmp   %l0, 0x3
  bne   test_fail
  nop

  ! DRAM PRECHRG WAIT
  or    %g0,0x66, %l6
  ldx   [%l1+0xe8], %l0
  cmp   %l0, 0x66
  bne   test_fail
  nop

  ! DRAM DIMM STACK
  ldx   [%l1+0x108], %l0
  cmp   %l0, 0x1
  bne   test_fail
  nop

  ! DRAM EMRS2
  or    %g0,0xf0f, %l6
  ldx   [%l1+0x110], %l0
  cmp   %l0, 0xf0f
  bne   test_fail
  nop

  ! DRAM EMRS1
  or    %g0,0x0f0, %l6
  ldx   [%l1+0x118], %l0
  cmp   %l0, 0x0f0
  bne   test_fail
  nop

  ! DRAM EMRS3
  or    %g0,0x123, %l6
  ldx   [%l1+0x120], %l0
  cmp   %l0, 0x123
  bne   test_fail
  nop

  ! DRAM 8 Bank Mode 
  ldx   [%l1+0x128], %l0
  cmp   %l0, 0x1
  bne   test_fail
  nop

  ! DRAM Rank1 present
  ldx   [%l1+0x130], %l0
  cmp   %l0, 0x1
  bne   test_fail
  nop

  ! DRAM Channel Disable
  or    %g0,0x0, %l6
  ldx   [%l1+0x138], %l0
  cmp   %l0, 0x0
  bne   test_fail
  nop

  ! DRAM Sel low order
  or    %g0,0x0, %l6
  ldx   [%l1+0x140], %l0
  cmp   %l0, 0x0
  bne   test_fail
  nop

  ! DRAM Dimm init
  ldx   [%l1+0x1a0], %l0
  cmp   %l0, 0x6  ! Forced by environment
  bne   test_fail
  nop

  ! DRAM SW Data ret cnt
  ldx   [%l1+0x1b0], %l0
  cmp   %l0, 0x1
  bne   test_fail
  nop

  ! DRAM HW Dmux clk inv
  ldx   [%l1+0x1b8], %l0
  cmp   %l0, 0x0
  bne   test_fail
  nop

  ! DRAM Read Enb clk inv, etc
  ldx   [%l1+0x1c0], %l0
  cmp   %l0, 0xc
  bne   test_fail
  nop

  ! DRAM Mode Reg Write Status (RO)
  ldx   [%l1+0x208], %l0
  cmp   %l0, 0x1
  bne   test_fail
  nop

  ! DRAM Init status
  ldx   [%l1+0x210], %l0
  cmp   %l0, 0x1
  bne   test_fail
  nop

  ! DRAM DIMM Present
#ifdef SLAM_INIT_CMP
  ldx   [%l1+0x218], %l0
  cmp   %l0, 0x3
  bne   test_fail
  nop
#endif

  ! DRAM Fail Over
  or    %g0,0x0, %l6
  ldx   [%l1+0x220], %l0
  cmp   %l0, 0x0
  bne   test_fail
  nop

  ! DRAM Fail Over Mask
  or    %g0,0x0, %l6
  ldx   [%l1+0x228], %l0
  cmp   %l0, 0x0
  bne   test_fail
  nop

  ! DRAM Debug Trigger
  ldx   [%l1+0x230], %l0
  cmp   %l0, 0xa8
  bne   test_fail
  nop

  ! DRAM Error Status ( Uninitalized ) 
  setx  0xfe00000000000000,%l0,%l4
  ldx   [%l1+0x280], %l0
  cmp   %l0, 0x0
  bne   test_fail
  nop

  ! DRAM Error Address ( Uninitalized ) 
  setx  0x000000fffffffff0,%l0,%l4
  ! UNCOMMENT THIS AFTER A SMALL BUG FIX
  ldx   [%l1+0x288], %l0
  cmp   %l0, %l4
  bne   test_fail
  nop

  ! DRAM Error Injection register
  or    %g0,0x123, %l6
  ldx   [%l1+0x290], %l0
  cmp   %l0, 0
  bne   test_fail
  nop

  ! DRAM Error Counter [Uninit]
  or    %g0,0x123, %l6
  ldx   [%l1+0x298], %l0
  cmp   %l0, 0x123
  bne   test_fail
  nop

  ! DRAM Error Location [uninit] No comparision, read only
  setx  0x0000000ffffffff0,%l0,%l4
  ldx   [%l1+0x2a0], %l0
  !cmp   %l0, %l4
  !bne   test_fail
  !nop

  ! DRAM Perf Control
  or    %g0,0x78, %l6
  ldx   [%l1+0x400], %l0
  cmp   %l0, 0
  bne   test_fail
  nop

  ! DRAM Perf count
  setx  0x0505050505050505,%l0,%l4
  ldx   [%l1+0x408], %l0
  !cmp   %l0, %l4
  bne   test_fail
  nop

  add   %l1, %l2, %l1        ! next channel

  deccc   %l3
  bne     loop_new                                  ! repeat
  nop



/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP

