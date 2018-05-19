// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: err_dtlb_data_atom_dacc.s
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

#define H_HT0_Data_access_error_0x32 My_Data_Access_Error_Trap

#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text
.global  main
.global  My_Data_Access_Error_Trap

#include "err_defines.h"

#define DTLB_ERRINJ_ENTRY   6
#define DTLB_ENTRY_VA       0x20010008
#define DTLB_ENTRY_PA       0x1130010008

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

  ! Error Injection Code Below

  ! Set Single Shot
  call  sub_set_sei_sshot
  save

  ! Inject DTLB Data Parity Error
  mov   SEI_DMD, %o0
  call  sub_inject_sei_error
  save

  ! Enable Error Injection
  call  sub_set_sei_en
  save

  ! Check for intended ASI_SEI value
  setx  0xc8000000, %l1, %l2
  ldxa  [%g0] ASI_SEI, %l1
  cmp   %l1, %l2
  bne   test_fail
  nop

  ! Write to DTLB
  call  sub_dtlb_write
  save

  ! Store my test data into memory
  setx   DTLB_ENTRY_PA, %l0, %g1 ! %g1 has the PA (in Hypervisor mode now) to store to
  setx   test_data, %l0, %l2     ! %l2 has the location of the data
  ldx    [%l2], %g3              ! %g3 has the data

store_test_data:
  stx    %g3, [%g1]

  ta    T_CHANGE_NONHPRIV

  setx  DTLB_ENTRY_VA, %l0, %l1
  clr   %l2
error_address:
  casxa [%l1] ASI_PRIMARY, %l3, %l2          ! Contents in %l2 and [%l1] would have swapped

  ! Check if a Data Access Error Trap happened
  set   EXECUTED, %l0
  cmp   %o0, %l0
  bne   test_fail
  mov   TT_Data_Access_Error, %l0
  cmp   %o1, %l0
  bne   test_fail

  ! Atomic instruction not completed
  brnz  %l2, test_fail
  nop

  ta    T_CHANGE_HPRIV

  ! Memory content should not change
  ldx   [%g1], %l0
  cmp   %l0, %g3
  bne   %xcc, test_fail
  nop

  ! Check Sparc Error Status Register
  mov   0x0, %o0   ! (MEU, MEC, PRIV)
  mov   SES_DMDU, %o1
  call  sub_check_sparc_error_status
  save

  ! Check Sparc Error Address Register
  setx  DTLB_ENTRY_VA, %l0, %o0
  ! Chop off lower 4 bits
  setx  0xfffffffffff0, %l0, %o1  ! Mask[47:0] (see PRM)
  and   %o0, %o1, %o0             ! Expected value needs to be masked as well
  call  sub_check_sparc_error_address
  save

  ba    test_pass
  nop

#include "err_subroutines.s"

sub_dtlb_write:

  setx  dtlb_entry, %l1, %l2
  ldda  [%l2] ASI_NUCLEUS_QUAD_LDD, %l4  ! Load the entry to write into dtlb

  mov    VA_ASI_DTLB_TAG_ACCESS, %l6
  mov    DTLB_ERRINJ_ENTRY, %l7
  ! Entry number in indexed into VA[8:3]
  sllx    %l7, 0x3, %l7

  stxa    %l4, [%l6] ASI_DMMU    ! Tag portion
  stxa    %l5, [%l7] ASI_DTLB_DATA_ACCESS

  ret
  restore

My_Data_Access_Error_Trap:
  ! Signal trap taken
  setx  EXECUTED, %l0, %o0
  ! save trap type value
  rdpr  %tt, %o1
  ! DMSU trap is now precise (see Bug 4383)
  done

/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta	T_GOOD_TRAP

test_fail:
ta	T_BAD_TRAP

.data

dtlb_entry:
  ! PRIV=0, Context must be 0x44
  .xword  0x0000000020010044,  0x8000001130010022

test_data:
  .xword  0x1004abba00000000
