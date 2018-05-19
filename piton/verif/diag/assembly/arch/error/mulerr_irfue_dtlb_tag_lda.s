// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mulerr_irfue_dtlb_tag_lda.s
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
#define H_HT0_Data_access_error_0x32 My_Data_Access_Error_Trap


#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text
.global  main
.global  My_Internal_Processor_Error_Trap 
.global  My_Data_Access_Error_Trap

#define DTLB_ERRINJ_ENTRY   6
#define DTLB_ENTRY_VA       0x20010008
#define DTLB_ENTRY_PA       0x1130010008

#include "err_defines.h"

.align 64
main:

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

  ! Enable disruting Corrected ECC Trap
  call  sub_set_see_ceen
  save

  ! Error Injection Code Below

  ! Set 2-bit XOR in Sparc Error Injection ECC Mask
  ldxa  [%g0] ASI_SEI, %l1
  mov   0x14, %l2
  or    %l1, %l2, %l1
  stxa  %l1, [%g0] ASI_SEI

  ! Set Single Shot
  call  sub_set_sei_sshot
  save

  ! Set IRF ECC error injection bit
  mov   SEI_IRF, %o0
  call  sub_inject_sei_error
  save

  ! Enable Error Injection
  call  sub_set_sei_en
  save

  ! This will update IRF with ECC Mask
  mov   %g0, %g6

  ! Make sure data will be read from the resigter file; otherwise %g6 result is by-passed.
  ! Note that %g6 is not windowed, so writing to %cwp would work.
  wrpr  %g0, %cwp

  inc   %g6

  ! An Internal Processor Error Trap should happen here
  setx  EXECUTED, %l1, %l0
  cmp   %o0, %l0
  bne   test_fail
  mov   TT_Internal_Processor_Error, %l0
  cmp   %o1, %l0
  bne   test_fail

  ! Check Sparc Error Status Register
  mov   0x1, %o0   ! (MEU, MEC, PRIV)
  mov   SES_IRU, %o1
  call  sub_check_sparc_error_status
  save

  ! Check Sparc Error Address Register
  ! Check only IRF Index for now; Syndrome later
  mov   0x6, %o0           ! %g6 at Index 6
  sllx  %o0, 4, %o0        ! IRF Index at [11:4]
  mov   0x14, %l0          ! ECC Syndrome - double error at bit 3 and 4
  sllx  %l0, 16, %l0       ! Syndrome at [23:16]
  or    %o0, %l0, %o0
  setx  0xff0ff0, %l1, %o1 ! Mask
  call  sub_check_sparc_error_address
  save


  ! Dtlb data parity error on load. Error Injection Code Below

  ! Clear the error injection register
  mov 	%g0, %l1
  stxa  %l1, [%g0] ASI_SEI

  ! Set Single Shot
  call  sub_set_sei_sshot
  save

  ! Set IRF ECC error injection bit
  mov   SEI_DMT, %o0
  call  sub_inject_sei_error
  save

  ! Enable Error Injection
  call  sub_set_sei_en
  save

 ! Write to DTLB
  call  sub_dtlb_write
  save

  ! Read back DTLB entry just written
  mov   DTLB_ERRINJ_ENTRY, %l7
  sllx  %l7, 0x3, %l7

error_address:
  ldxa  [%l7] ASI_DTLB_TAG_READ, %l6


  ! There should be trap here - check if it happened
  setx  EXECUTED, %l1, %l0
  cmp   %o0, %l0
  bne   test_fail
  ! Check Trap Type
  mov   TT_Data_Access_Error, %l0
  cmp   %o1, %l0
  bne   test_fail


  ! Check Sparc Error Status Register, The MEU bit should be set, the previous error should retained
  mov   0x5, %o0   ! (MEU, MEC, PRIV)
  mov   SES_IRU, %o1
  call  sub_check_sparc_error_status
  save

  ! Check Sparc Error Address Register, The previous error should be retained
  mov   0x6, %o0           ! %g6 at Index 6
  sllx  %o0, 4, %o0        ! IRF Index at [11:4]
  mov   0x14, %l0          ! ECC Syndrome - double error at bit 3 and 4
  sllx  %l0, 16, %l0       ! Syndrome at [23:16]
  or    %o0, %l0, %o0
  setx  0xff0ff0, %l1, %o1 ! Mask
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


My_Internal_Processor_Error_Trap:
  ! Signal trap taken
  setx  EXECUTED, %l0, %o0
  ! save trap type value
  rdpr  %tt, %o1
  done

My_Data_Access_Error_Trap:
  ! Signal trap taken
  setx  EXECUTED, %l0, %o0
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

dtlb_entry:
  .xword  0x0000000020010000,  0x8000001130010022

test_data:
  .xword  0x1004abba00000000

