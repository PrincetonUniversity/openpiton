// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: err_irf_cecc_cecc.s
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

.align 64
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

  ta    T_CHANGE_HPRIV

  ! Sparc Error Injection Register should power up 0
  ldxa  [%g0] ASI_SEI, %l1
  cmp   %l1, 0
  bne   test_fail
  nop

  ! Sparc Error Status Register powers up X - Write 1 on each bit to clear
  setx  0xefffffff, %l1, %l2
  stxa  %l2, [%g0] ASI_SES
  ldxa  [%g0] ASI_SES, %l1
  setx  SES_INIT_VALUE, %l3, %l2
  cmp   %l1, %l2
  bne   test_fail
  nop

  ! Enable disruting Corrected ECC Trap
  call  sub_set_see_ceen
  save

  ! Error Injection Code Below

  ! Set Single Shot
  call  sub_set_sei_sshot
  save

  ! Set 1-bit XOR in Sparc Error Injection ECC Mask
  ldxa  [%g0] ASI_SEI, %l1
  mov   0x2, %l2
  or    %l1, %l2, %l1
  stxa  %l1, [%g0] ASI_SEI

  ! Set IRF ECC error injection bit
  mov   SEI_IRF, %o0
  call  sub_inject_sei_error
  save

  ! Enable Error Injection
  call  sub_set_sei_en
  save

  ! This will update IRF with ECC Mask
  or    %g0, 0x1, %g7

  ! Make sure data will be read from the resigter file; otherwise %g7 result is by-passed.
  ! Note that %g7 is not windowed, so writing to %cwp would work.
  wrpr  %g0, %cwp

  dec   %g7

  ! There should be trap here - check if it happened
  setx  EXECUTED, %l1, %l0
  cmp   %o0, %l0
  bne   test_fail
  ! Check Trap Type
  mov   TT_Corrected_ECC, %l0
  cmp   %o1, %l0
  bne   test_fail

  ! The instruction that caused the trap should still complete
  brnz  %g7, test_fail

  ! Check Sparc Error Status Register
  mov   0x1, %o0   ! (MEU, MEC, PRIV)
  mov   SES_IRC, %o1
  call  sub_check_sparc_error_status
  save

  ! Check Sparc Error Address Register
  mov   0x7, %o0           ! %g7 at IRF Index 7
  sllx  %o0, 4, %o0        ! IRF Index at [11:4]
  mov   0x82, %l0           ! ECC Syndrome - single bit error at bit 1
  sllx  %l0, 16, %l0       ! Syndrome at [23:16]
  or    %o0, %l0, %o0
  setx  0xff0ff0, %l1, %o1 ! Mask
  call  sub_check_sparc_error_address
  save

  ba    test_pass
  nop

#include "err_subroutines.s"

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
ta	T_GOOD_TRAP

test_fail:
ta	T_BAD_TRAP

