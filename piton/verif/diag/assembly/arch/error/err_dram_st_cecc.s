// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: err_dram_st_cecc.s
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

#define H_HT0_Corrected_ECC_error_0x63 My_Corrected_ECC_error_trap

#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text
.global  main
.global  My_Corrected_ECC_error_trap 

#include "err_defines.h"
! Use the starting PA of the data section
#define  L2_ENTRY_PA        0x1170000000
#define  L2_BANK_ADDR       0x0
#define  DRAM_CHANNEL_ADDR  0x0
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

  setx  L2_ENTRY_PA, %l0, %g1
  add   %g1, L2_BANK_ADDR, %g1
  clr   %g2                      ! %g2 is an iteration counter
  setx  DRAM_ES_W1C_VALUE, %l0, %g3
  setx  L2ES_PA0, %l0, %g4
  add   %g4, L2_BANK_ADDR, %g4
  setx  DRAM_ES_PA, %l0, %g5
  set   DRAM_CHANNEL_ADDR, %l7
  add   %g5, %l7, %g5
  setx  L2_ES_W1C_VALUE, %l0, %g6
  setx  L2CS_PA0, %l0, %g7
  add   %g7, L2_BANK_ADDR, %g7

disable_l1_dcache:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove Bit 2
  andn  %l0, 0x2, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

clear_DRAM_ESR:
  stx   %g3, [%g5]

disable_l2:
  ldx   [%g7], %l0
  or    %l0, 0x1, %l0
  stx   %l0, [%g7]

clear_l2_ESR:
  stx   %g6, [%g4]
  nop

  ! For the second time, jump
  brnz  %g2, wait_for_DRAM_ESR_to_clear
  nop

  mov   0x2, %l1                ! ECC Mask (1-bit error)
  mov   0x1, %l2
  sllx  %l2, DRAM_EI_SSHOT, %l3
  or    %l1, %l3, %l1           ! Set single shot
  sllx  %l2, DRAM_EI_ENB, %l3
  or    %l1, %l3, %l1           ! Enable error injection for the next write
  setx  DRAM_EI_PA, %l0, %l6
  add   %l6, %l7, %l6
set_DRAM_error_inject:
  stx   %l1, [%l6]

read_DRAM_error_inject:
  ldx   [%l6], %l2
  cmp   %l1, %l2
  bne   read_DRAM_error_inject
  
store_with_error:
  set   0x28, %l7
  stx   %l7, [%g1+%l7]

enable_l2:
  ldx   [%g7], %l0
  andn  %l0, 0x1, %l0
  sllx  %o7, 15, %l1              ! Set error steering thread
  or    %l0, %l1, %l0
  stx   %l0, [%g7]

wait_for_DRAM_ESR_to_clear:
  ldx   [%g5], %l0
  brnz  %l0, wait_for_DRAM_ESR_to_clear
  nop

error_address:
  ! The DRAM error is outside of the requested block (at 0x28)
  stx   %g0, [%g1]

  ! Compute expected value of DRAM error status register
  mov   0x1, %l1
  sllx  %l1, DRAM_ES_DAC, %l0
  ! Due to DDR design, a single shot for one clock cycle results in errors for two 16-Byte chunks
!note: ECO 6668 (bug 5512) fixed, now SEC, instead of MEC
!  sllx  %l1, DRAM_ES_MEC, %l3
!  or    %l0, %l3, %l0            ! %l0 has expected value (not checking syndrome)
  nop
  nop
  nop
  nop

check_DRAM_ESR:
  ldx   [%g5], %l1
  ldx   [%g5], %l1
  ldx   [%g5], %l1
  ldx   [%g5], %l1
  ldx   [%g5], %l1
  ldx   [%g5], %l1
  ldx   [%g5], %l1

  set   0xffff, %l2
  andn  %l1, %l2, %l1 
  cmp   %l0, %l1
  bne   %xcc, test_fail
  nop

  clr   %l0
  ! For the second round, the DRAM error is ignored - L2_ESR is 0
  brnz  %g2, check_l2_ESR
  nop

  ! Compute expected value of L2 error status register
  mov   0x1, %l2
  sllx  %l2, L2ES_DAC, %l0
  sllx  %l2, L2ES_VEC, %l3       ! VEC (any valid CE) not in PRM, but set by RTL
  or    %l0, %l3, %l0
  sllx  %o7, L2ES_TID, %l3       ! ID of thread that encountered error
  or    %l0, %l3, %l0            ! %l0 has expected value
  ! RW bit is NOT set for non-partial stores
  ! Syndrome field not set for DRC

check_l2_ESR:
  ldx   [%g4], %l4
  cmp   %l0, %l4
  bne   %xcc, test_fail
  nop

  ! Diag passes if it reaches here for the second time. 
  brnz  %g2, test_pass
  nop

  ! Corrected data should be in L2 (but not in DRAM yet - not until write-back)
  ldx   [%g1+%l7], %l0
  cmp   %l0, %l7
  bne   %xcc, test_fail
  nop

  setx  L2EA_PA1, %l2, %l3
  add   %l3, L2_BANK_ADDR, %l3
check_l2_EAR:
  ldx   [%l3], %l4

  ! Error address is the physical address of the cache line (PA[5:0] 0)
  andn  %g1, 0x3f, %l1
  cmp   %l4, %l1
  bne   %xcc, test_fail
  nop

  ! Check if a Corrected ECC Trap happened
  setx  EXECUTED, %l1, %l0
  cmp   %o0, %l0
  bne   test_fail
  nop
  mov   TT_Corrected_ECC, %l0
  cmp   %o1, %l0
  bne   test_fail
  nop

  /* The second half of this diag is to test Bug 4559.
     Basically the diag repeats but with L2 in bypass mode. */

second_round:
  inc   %g2
  ! Turn off L2 CE reporting
  setx  L2EE_PA1, %l0, %l1
  add   %l1, L2_BANK_ADDR, %l1
  ldx   [%l1], %l0
  xor   %l0, 1, %l0
  stx   %l0, [%l1]
  ba    clear_DRAM_ESR
  nop

My_Corrected_ECC_error_trap:
  ! Signal trap taken
  setx  EXECUTED, %l0, %o0
  ! save trap type value
  rdpr  %tt, %o1
  retry

/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP

.data

  .xword  0x0000000000000000
  .xword  0x0000000000000008
  .xword  0x0000000000000010
  .xword  0x0000000000000018
  .xword  0x0000000000000020
  .xword  0x0000000000000028
  .xword  0x0000000000000030
  .xword  0x0000000000000038
