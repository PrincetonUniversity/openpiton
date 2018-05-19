// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: err_multierr_diag7.s
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

#define H_HT0_Internal_Processor_Error_0x29 My_Internal_Processor_Error_Trap
#define H_HT0_Corrected_ECC_error_0x63 My_Corrected_ECC_error_trap

#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text
.global  main
.global  My_Internal_Processor_Error_Trap
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

  ! Enable FPU
  wr    %g0, 0x4, %fprs

  ! Sparc Error Status Register powers up X - Write 1 on each bit to clear
  setx  0xefffffff, %l1, %l2
  stxa  %l2, [%g0] ASI_SES

  setx  fpd_data, %l0, %g1

  ! Error Injection Code Below

set_Sparc_Error_Injection:
  ! Set 1-bit XOR in Sparc Error Injection ECC Mask
  mov   0x40, %l1
  stxa  %l1, [%g0] ASI_SEI

  mov   1, %l0
  sllx  %l0, SEI_FRF, %l2
  or    %l1, %l2, %l1
  sllx  %l0, SEI_SSHOT, %l2
  or    %l1, %l2, %l1
  sllx  %l0, SEI_EN, %l2
  or    %l1, %l2, %l1
  stxa  %l1, [%g0] ASI_SEI

  ! This will inject CE on %f6
  ld    [%g1], %f6

  ! Set 2-bit XOR in Sparc Error Injection ECC Mask
  mov   0x42, %l1
  stxa  %l1, [%g0] ASI_SEI

  sllx  %l0, SEI_FRF, %l2
  or    %l1, %l2, %l1
  sllx  %l0, SEI_SSHOT, %l2
  or    %l1, %l2, %l1
  sllx  %l0, SEI_EN, %l2
  or    %l1, %l2, %l1
  stxa  %l1, [%g0] ASI_SEI

  ! This will inject UE on %f4
  ld    [%g1], %f4

  ! Make sure data will be read from the resigter file
  wrpr  %g0, %cwp

error_address:
  fadds %f6, %f4, %f8

  ! Check Internal Processor Trap
  mov   TT_Internal_Processor_Error, %l1
  cmp   %l1, %o1
  bne   test_fail
  nop

  ! Check Sparc Error Address Register
  mov   0x4, %o0              ! %f4 at Index 4
  sllx  %o0, 4, %o0           ! FRF Index at [9:4]
  mov   0x2, %l0              ! Syndrome
  sllx  %l0, 24, %l1          ! single precision - even half only
  or    %o0, %l1, %o0
  setx  0x7f0003f0, %l0, %o1    ! Mask
  call  sub_check_sparc_error_address
  save

  ! Check Sparc Error Status Register
  setx  SES_INIT_VALUE, %l2, %l1
  mov   0x1, %l2
  sllx  %l2, SES_FRU, %l3
  or    %l1, %l3, %l1
! ******* Temporarily disable the following check due to Bug 6420 (to be fixed in TO1.1)
  sllx  %l2, SES_FRC, %l3
  or    %l1, %l3, %l1
  mov   0x1, %l2
  sllx  %l2, 0x1d, %l3
  or    %l1, %l3, %l1

check_Sparc_ESR:
  ldxa  [%g0] ASI_SES, %l0
  cmp   %l0, %l1
  bne   test_fail
  nop

! ******* Temporarily disable the following check due to Bug 6420 (to be fixed in TO1.1)
  ! Check Corrected ECC Trap
  mov   TT_Corrected_ECC, %l0
  cmp   %l0, %o2
  bne   test_fail
  nop

  ba    test_pass
  nop

#include "err_subroutines.s"

My_Corrected_ECC_error_trap:
  ! save trap type value
  rdpr  %tt, %o2
  retry

My_Internal_Processor_Error_Trap:
  ! save trap type value
  rdpr  %tt, %o1
  done

/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta	T_GOOD_TRAP

test_fail:
ta	T_BAD_TRAP

.data

fpd_data:
  ! Floating Point Double data (1.25 * [2 to the 20])
  .xword  0x4130000000000019
fpd_result:
  ! Floating Point Double result (1.25 * [2 to the 21])
  .xword  0x4140000000000019
	
