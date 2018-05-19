// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: dram_reg_rd_default.s
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
 * Name:    dram_reg_rd_default.s
 * Date:    July 24, 2003
 *
 *  Description: Test the default ( Reset ) value of all dram registers
 *               Loop to cover all 4 channels.
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
  ldx   [%l1+0x18], %l0
  cmp   %l0, 0xfff
  bne   test_fail
  nop

  ! DRAM Refresh Frequency 
  ldx   [%l1+0x20], %l0
  cmp   %l0, 0x514
  bne   test_fail
  nop

  ! DRAM Open Bank Max 
  ldx   [%l1+0x28], %l0
  set   0x1ffff, %l4
  cmp   %l0, %l4
  bne   test_fail
  nop

  ! DRAM Refresh counter, since free running no comparision
  ldx   [%l1+0x38], %l0
  nop

  ! DRAM Scrub Enable
  ldx   [%l1+0x40], %l0
  cmp   %l0, 0x0
  bne   test_fail
  nop

  ! DRAM Programmable timer ( during which max open bank valid )
  ldx   [%l1+0x48], %l0
  set   0xffff, %l4
  cmp   %l0,  %l4
  bne   test_fail
  nop

  ! DRAM TRRD
  ldx   [%l1+0x80], %l0
  cmp   %l0, 0x2
  bne   test_fail
  nop

  ! DRAM TRC
  ldx   [%l1+0x88], %l0
  cmp   %l0, 0xc
  bne   test_fail
  nop

  ! DRAM TRCD
  ldx   [%l1+0x90], %l0
  cmp   %l0, 0x3
  bne   test_fail
  nop

  ! DRAM TWTR
  ldx   [%l1+0x98], %l0
  cmp   %l0, 0x0
  bne   test_fail
  nop

  ! DRAM TRTW
  ldx   [%l1+0xa0], %l0
  cmp   %l0, 0x0
  bne   test_fail
  nop

  ! DRAM TRTP
  ldx   [%l1+0xa8], %l0
  cmp   %l0, 0x2
  bne   test_fail
  nop

  ! DRAM TRAS
  ldx   [%l1+0xb0], %l0
  cmp   %l0, 0x9
  bne   test_fail
  nop

  ! DRAM TRP
  ldx   [%l1+0xb8], %l0
  cmp   %l0, 0x3
  bne   test_fail
  nop

  ! DRAM TWR
  ldx   [%l1+0xc0], %l0
  cmp   %l0, 0x3
  bne   test_fail
  nop

  ! DRAM TRFC
  ldx   [%l1+0xc8], %l0
  cmp   %l0, 0x27
  bne   test_fail
  nop

  ! DRAM TMRD
  ldx   [%l1+0xd0], %l0
  cmp   %l0, 0x2
  bne   test_fail
  nop

  ! DRAM TIWTR
  ldx   [%l1+0xe0], %l0
  cmp   %l0, 0x2
  bne   test_fail
  nop

  ! DRAM PRECHRG WAIT
  ldx   [%l1+0xe8], %l0
  cmp   %l0, 0x55
  bne   test_fail
  nop

  ! DRAM DIMM STACK
  ldx   [%l1+0x108], %l0
  cmp   %l0, 0x1   ! Forced by environment
  bne   test_fail
  nop

  ! DRAM EMRS2
  ldx   [%l1+0x110], %l0
  cmp   %l0, 0x0
  bne   test_fail
  nop

  ! DRAM EMRS1
  ldx   [%l1+0x118], %l0
  cmp   %l0, 0x400
  bne   test_fail
  nop

  ! DRAM EMRS3
  ldx   [%l1+0x120], %l0
  cmp   %l0, 0x0
  bne   test_fail
  nop

  ! DRAM 8 Bank Mode 
  ldx   [%l1+0x128], %l0
  cmp   %l0, 0x1
  bne   test_fail
  nop

  ! DRAM Rank1 present
  ldx   [%l1+0x130], %l0
  cmp   %l0, 0x1   ! Forced by environment
  bne   test_fail
  nop

  ! DRAM Channel Disable
  ldx   [%l1+0x138], %l0
  cmp   %l0, 0x0
  bne   test_fail
  nop

  ! DRAM Sel low order
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
  cmp   %l0, 0x1    ! since by this time the init is done
  bne   test_fail
  nop

  ! DRAM Init status
  ldx   [%l1+0x210], %l0
  cmp   %l0, 0x1    ! since by this time the init is done
  bne   test_fail
  nop

#ifdef SLAM_INIT_CMP
  ! DRAM DIMM Present
  ldx   [%l1+0x218], %l0
  cmp   %l0, 0x3  
  bne   test_fail
  nop
#endif

  ! DRAM Fail Over
  ldx   [%l1+0x220], %l0
  cmp   %l0, 0x0
  bne   test_fail
  nop

  ! DRAM Fail Over Mask
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
  !ldx   [%l1+0x280], %l0
  !cmp   %l0, 0x3
  !bne   test_fail
  !nop

  ! DRAM Error Address ( Uninitalized ) 
  !ldx   [%l1+0x288], %l0
  !cmp   %l0, 0x3
  !bne   test_fail
  !nop

  ! DRAM Error Injection register
  ldx   [%l1+0x290], %l0
  cmp   %l0, 0x0
  bne   test_fail
  nop

  ! DRAM Error Counter [Uninit]
  !ldx   [%l1+0x298], %l0
  !cmp   %l0, 0xfff
  !bne   test_fail
  !nop

  ! DRAM Error Location [uninit]
  !ldx   [%l1+0x2a0], %l0
  !cmp   %l0, 0xfff
  !bne   test_fail
  !nop

  ! DRAM Perf Control
  ldx   [%l1+0x400], %l0
  cmp   %l0, 0x0
  bne   test_fail
  nop

  ! DRAM Perf count / no checking, count may increase by this time
  ! due to dram x-actions
  ldx   [%l1+0x408], %l0
  !cmp   %l0, 0x0
  !bne   test_fail
  !nop

  add   %l1, %l2, %l1        ! next channel

  deccc   %l3
  bne     loop01                                  ! repeat
  nop



/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP

