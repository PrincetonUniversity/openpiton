// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: err_multierr_diag6.s
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
#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text
.global  main
.global  My_Internal_Processor_Error_Trap 

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

  ! Clear Sparc Error Status Register
  setx  0xefffffff, %l1, %l2
  stxa  %l2, [%g0] ASI_SES

  ! Disable correctable error traps -- otherwise will trap forever
  mov   0x2, %l0
  stxa  %l0, [%g0] ASI_SEE

  ! Error Injection Code Below
  ! Default is continuous mode

  ! Set 1-bit XOR in Sparc Error Injection ECC Mask
  ldxa  [%g0] ASI_SEI, %l1
  mov   0x4, %l2
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

  wrpr  %g0, %cwp

error_address:
  dec   %g7

  ! Disable Error Injection
  stxa  %g0, [%g0] ASI_SEI

  ! An Internal Processor Error Trap should happen
  mov   TT_Internal_Processor_Error, %l0
  cmp   %o1, %l0
  bne   test_fail
  nop

  ! Check Sparc Error Status Register
  setx  SES_INIT_VALUE, %l2, %l1
  mov   0x1, %l2
  sllx  %l2, SES_IRC, %l3     ! IRC is set on first try
  or    %l1, %l3, %l1
  sllx  %l2, SES_MEC, %l3     ! MEC is set on the second try
  or    %l1, %l3, %l1
  sllx  %l2, SES_IRU, %l3     ! IRU is set on the third try
  or    %l1, %l3, %l1
  mov   0x1, %l2
  sllx  %l2, 0x1d, %l3
  or    %l1, %l3, %l1

check_Sparc_ESR:
  ldxa  [%g0] ASI_SES, %l0
  cmp   %l0, %l1
  bne   test_fail
  nop

  ! Check Sparc Error Address Register
  mov   0x7, %o0             ! %g7 at IRF Index 7
  sllx  %o0, 4, %o0          ! IRF Index at [11:4]
  mov   0x84, %l0            ! ECC Syndrome - single bit error at bit 1
  sllx  %l0, 16, %l0         ! Syndrome at [23:16]
  or    %o0, %l0, %o0
  setx  0xff0ff0, %l1, %o1   ! Mask
  call  sub_check_sparc_error_address
  save

  ba    test_pass
  nop

#include "err_subroutines.s"

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

