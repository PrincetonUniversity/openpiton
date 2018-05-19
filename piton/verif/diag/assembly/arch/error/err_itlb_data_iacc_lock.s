// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: err_itlb_data_iacc_lock.s
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

#define H_HT0_Instruction_access_error_0x0a My_Instruction_Access_Error_Trap

#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text
.global  main
.global  My_Instruction_Access_Error_Trap

#include "err_defines.h"

#define ITLB_ENTRY_VA       0x20000000
#define ITLB_ERRINJ_ENTRY   3
! ITLB Entry 3 is used by Section main (see boot sequence).
! We will write exactly the same value into entry 3, so that any
! subsequent IMMU miss is the result of an inserted data parity error.

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

  ! Enable traps on un-correctable Sparc errors
  call  sub_set_see_nceen
  save

  ! Enable traps on correctable Sparc errors
  call  sub_set_see_ceen
  save

  ! Error Injection Code Below

  ! Set Single Shot
  call  sub_set_sei_sshot
  save

  ! Inject ITLB Data Parity Error
  mov   SEI_IMD, %o0
  call  sub_inject_sei_error
  save

  ! Enable Error Injection
  call  sub_set_sei_en
  save

  ! Check for intended ASI_SEI value
  setx  0xe0000000, %l1, %l2
  ldxa  [%g0] ASI_SEI, %l1
  cmp   %l1, %l2
  bne   test_fail
  nop

  ! Write to ITLB
  call sub_itlb_write
  save

  ta    T_CHANGE_NONHPRIV

error_address:
  setx  ITLB_ENTRY_VA, %l0, %l7

  ! Check if precise Instruction Access Error Trap occured
  setx  EXECUTED, %l1, %l0
  cmp   %o0, %l0
  bne   test_fail
  mov   TT_Instruction_Access_Error, %l0
  cmp   %o1, %l0
  bne   test_fail

  ta    T_CHANGE_HPRIV

  ! Check Sparc Error Status Register
  mov   0x0, %o0   ! (MEU, MEC, PRIV)
  mov   SES_IMDU, %o1
  call  sub_check_sparc_error_status
  save

  ! Check Sparc Error Address Register
  setx  error_address, %l0, %o0
  setx  0xfffffffffff0, %l0, %o1  ! Mask[47:0] (see PRM)
  and   %o0, %o1, %o0             ! Expected value needs to be masked as well
  call  sub_check_sparc_error_address
  save

  ba    test_pass
  nop

#include "err_subroutines.s"

sub_itlb_write:

  setx  itlb_entry, %l1, %l2
  ldda  [%l2] ASI_NUCLEUS_QUAD_LDD, %l4  ! Load the entry to write into itlb

  mov   VA_ASI_ITLB_TAG_ACCESS, %l6
  mov   ITLB_ERRINJ_ENTRY, %l7
  sllx  %l7, 0x3, %l7

  stxa  %l4, [%l6] ASI_IMMU      ! Tag portion
  stxa  %l5, [%l7] ASI_ITLB_DATA_ACCESS

  ret
  restore

My_Instruction_Access_Error_Trap:
  ! Signal trap taken
  setx  EXECUTED, %l0, %o0
  ! save trap type value
  rdpr  %tt, %o1
  ! Write ITLB again -- this time there should be no error (single shot error injection)
  call sub_itlb_write
  save
  nop
  done

/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta	T_GOOD_TRAP

test_fail:
ta	T_BAD_TRAP

.data

itlb_entry:
  ! Make an entry identical to the existing one at Entry 3, except for the lock bit
  ! PRIV=0, G=1
  .xword  0x0000000020000044,  0x8000001130000063


