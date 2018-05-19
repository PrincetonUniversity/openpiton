// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: err_dram_scrub_uecc.s
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

#define H_HT0_Reserved_0x78 My_Data_Error_Trap

#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text
.global  main
.global  My_Data_Error_Trap

#include "err_defines.h"

#define  L2_BANK_ADDR       0x40
#define  DRAM_CHANNEL_ADDR  0x1000
#define  TEST_DATA          0x1000100081c3e008
#define  L2_ES_W1C_VALUE    0xc03ffff800000000
#define  DRAM_ES_W1C_VALUE  0xfe00000000000000

main:

  clr   %o7

#ifdef  RUN_TH1
  mov   0x1, %o7
#endif
#ifdef  RUN_TH2
  mov   0x2, %o7
#endif
#ifdef  RUN_TH3
  mov   0x3, %o7
#endif

  ta    %icc, T_RD_THID
  cmp   %o1, %o7
  bne   test_pass
  nop

  ! Boot code does not provide TLB translation for IO address space
  ta    T_CHANGE_HPRIV

  set   DRAM_CHANNEL_ADDR, %g2
  setx  TEST_DATA, %l0, %g3
  setx  DRAM_ES_W1C_VALUE, %l0, %g4
  setx  DRAM_ES_PA, %l0, %g5
  add   %g5, %g2, %g5
  setx  L2ES_PA1, %l0, %g6
  add   %g6, L2_BANK_ADDR, %g6

start_here:

  ! Clear DRAM Error status register (Bit[63:57] write-1-clear)
  stx   %g4, [%g5]

disable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the lower 2 bits (I-Cache and D-Cache enables)
  andn  %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

disable_l2:
  setx  L2CS_PA1, %l1, %l0
  mov   0x1, %l2
  stx   %l2, [%l0+L2_BANK_ADDR]

clear_l2_ESR:
  ! Write 1 to clear L2 Error status registers
  setx  L2_ES_W1C_VALUE, %l0, %l1
  stx   %l1, [%g6]
  nop

  ! Set up DRAM error injection
  mov   0x22, %l1               ! ECC Mask (2-bit error)
  mov   0x1, %l2
  sllx  %l2, DRAM_EI_SSHOT, %l3
  or    %l1, %l3, %l1           ! Set single shot
  sllx  %l2, DRAM_EI_ENB, %l3
  or    %l1, %l3, %l1           ! Enable error injection for the next write
set_DRAM_error_inject:
  setx  DRAM_EI_PA, %l0, %l2
  add   %l2, %g2, %l2
  stx   %l1, [%l2]

read_DRAM_error_inject:
  ldx   [%l2], %l3
  cmp   %l1, %l3
  bne   read_DRAM_error_inject
  
store_to_DRAM:
  setx  TEST_DATA, %l2, %l1
  stx   %l1, [%g0+L2_BANK_ADDR]

enable_l2:
  setx  L2CS_PA0, %l1, %l0
  sllx  %o7, 15, %l1            ! Set error steering thread
  stx   %l1, [%l0+L2_BANK_ADDR]

enable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  or    %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

set_DRAM_scrub_frequency:
  setx  0x9700000018, %l0, %l1
  add   %l1, %g2, %l1
  mov   0x5, %l0
  stx   %l0, [%l1]

enable_DRAM_scrub:
  setx  0x9700000040, %l0, %l1
  add   %l1, %g2, %l1
  mov   0x1, %l0
  stx   %l0, [%l1]

read_DRAM_scrub_en:
  ldx   [%l1], %l2
  cmp   %l0, %l2
  bne   read_DRAM_scrub_en
  
  clr   %g1

check_DRAM_ESR:
  ldx   [%g5], %l0

  inc   %g1
  cmp   %g1, 5
  be    test_fail
  nop

  brz   %l0, check_DRAM_ESR
  nop

  ! Compute expected value of DRAM error status register
  mov   0x1, %l6
  sllx  %l6, DRAM_ES_DSU, %l7
  ! Due to DDR design, a single shot for one clock cycle results in errors for two 16-Byte chunks
  ! This also implies that a disrupting 0x78 trap will follow a 0x32 precise trap
!note: ECO 6668 (bug 5512) is fixed, SEU now instead of MEU
!  sllx  %l6, DRAM_ES_MEU, %l5
!  or    %l7, %l5, %l7

  ! Not checking syndrome because it varies with environment timing (e.g. different in cmp and ciop)
  set   0xffff, %l1
  andn  %l0, %l1, %l0
  cmp   %l0, %l7
  bne   %xcc, test_fail
  nop

  ! Compute expected value of L2 error status register
  mov   0x1, %l1
  sllx  %l1, L2ES_DSU, %l0

check_l2_ESR:
  ldx   [%g6], %l4

  cmp   %l4, %l0
  bne   %xcc, test_fail
  nop

  ! Check if a disrupting Data Error Trap happened
  set   EXECUTED, %l0
  cmp   %o2, %l0
  bne   test_fail
  nop
  mov   TT_Data_Error, %l0
  cmp   %o3, %l0
  bne   test_fail
  nop

  ba    test_pass
  nop

My_Data_Error_Trap:
  ! Signal trap taken
  set   EXECUTED, %o2
  ! save trap type value
  rdpr  %tt, %o3
  ! disrupting trap
  retry

/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP

