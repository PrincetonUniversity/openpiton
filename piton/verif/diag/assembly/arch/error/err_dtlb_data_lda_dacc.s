// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: err_dtlb_data_lda_dacc.s
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

#define DTLB_ERRINJ_ENTRY   8
#define DTLB_ENTRY_VA       0x168000

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

  ! Read back DTLB entry just written
  mov   DTLB_ERRINJ_ENTRY, %l7
  sllx  %l7, 0x3, %l7
  ldxa  [%l7] ASI_DTLB_TAG_READ, %l6
  setx  DTLB_ENTRY_VA, %l0, %l1
  cmp   %l1, %l6
  bne   test_fail
  nop

error_address:
  ldxa  [%l7] ASI_DTLB_DATA_ACCESS, %l7

  ! Check if Data Access Error Trap happened
  setx  EXECUTED, %l1, %l0
  cmp   %o0, %l0
  bne   test_fail
  nop
  mov   TT_Data_Access_Error, %l0
  cmp   %o1, %l0
  bne   test_fail
  nop

  ! Check if ldxa completed after retry
  ! Bit 0 always read 0 (No Global bit), and bit 47 reads 1 (CAM size?) 
  setx  0x8000800100168000, %l0, %l1
  cmp   %l1, %l7
  bne   %xcc, test_fail   ! all 64 bits should be compared
  nop

  ! Check Sparc Error Status Register
  mov   0x1, %o0   ! (MEU, MEC, PRIV)
  mov   SES_DMDU, %o1
  call  sub_check_sparc_error_status
  save

  ! Check Sparc Error Address Register
  mov   DTLB_ERRINJ_ENTRY, %o0
  sllx  %o0, 4, %o0
  mov   0xff0, %o1  ! Mask
  call  sub_check_sparc_error_address
  save

  nop

  ba    test_pass
  nop

#include "err_subroutines.s"

sub_dtlb_write:

  setx  dtlb_entry, %l1, %l2
  ldda  [%l2] ASI_NUCLEUS_QUAD_LDD, %l4  ! Load the entry to write into dtlb

  mov    VA_ASI_DTLB_TAG_ACCESS, %l6
  mov    DTLB_ERRINJ_ENTRY, %l7
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
  ! Write DTLB again -- this time there should be no error (single shot error injection)
  call sub_dtlb_write
  save
  nop
  retry

/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta	T_GOOD_TRAP

test_fail:
ta	T_BAD_TRAP

.data

dtlb_entry:
  .xword  0x0000000000168000,  0x8000000100168001


