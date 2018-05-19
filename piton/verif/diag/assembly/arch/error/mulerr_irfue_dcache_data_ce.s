// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mulerr_irfue_dcache_data_ce.s
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

#define  DTLB_ERRINJ_ENTRY  6
#define  DTLB_ENTRY_VA    0x20012000
#define  DTLB_ENTRY_PA    0x1130012000
#define  DCACHE_WAY  0

#include "err_defines.h"

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


  ! D$ Tag parity Error Injection Code Below

  call  sub_dtlb_write
  save

  ! Write D-cache data without error
  ! D-Cache keeps a parity for each byte -- pass a 8-bit mask
  mov   48, %o5
  call  sub_dcache_data_write
  save

  ! Write D-cache tag with error
  mov   0, %o5
  call  sub_dcache_tag_write
  save

  ta    T_CHANGE_NONHPRIV

  setx  DTLB_ENTRY_VA, %l0, %l1
error_address:
  ldx      [%l1], %l7
  nop


  ! There should be trap here - check if it happened
  setx  EXECUTED, %l1, %l0
  cmp   %o0, %l0
  bne   test_fail
  ! Check Trap Type
  mov   TT_Corrected_ECC, %l0
  cmp   %o1, %l0
  bne   test_fail

  ta    T_CHANGE_HPRIV

  ! Check Sparc Error Status Register, The MEC bit should be set, the previous error should retained
  mov   0x3, %o0   ! (MEU, MEC, PRIV)
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

My_Internal_Processor_Error_Trap:
  ! Signal trap taken
  setx  EXECUTED, %l0, %o0
  ! save trap type value
  rdpr  %tt, %o1
  done

My_Corrected_ECC_error_trap:
  ! Signal trap taken
  setx  EXECUTED, %l0, %o0
  ! save trap type value
  rdpr  %tt, %o1
  done

sub_dtlb_write:

  setx  dtlb_entry, %l1, %l2
  ldda  [%l2] ASI_NUCLEUS_QUAD_LDD, %l4  ! Load the entry to write into dtlb

  mov   VA_ASI_DTLB_TAG_ACCESS, %l6
  mov   DTLB_ERRINJ_ENTRY, %l7
  sllx  %l7, 0x3, %l7

  stxa  %l4, [%l6] ASI_DMMU      ! Tag portion
  stxa  %l5, [%l7] ASI_DTLB_DATA_ACCESS

  ret
  restore

sub_dcache_tag_write:

  ! PA: [38:11] Tag, [10:4] 128 sets, [3] select 2 double words, [2:0] always 0 (8-byte word addressing)

  ! Generate write data
  ! Write data: [28:1] Tag ([38:11] of PA), [0] - valid bit

  setx  DTLB_ENTRY_PA, %l0, %l1
  srlx  %l1, 10, %l1            ! [38:10] shifted to [28:0]
  or    %l1, 0x1, %l1           ! Set 1 to [0], which is the valid bit
                                ! %l1 has the data for the tag write

  ! Generate write address
  ! Write address: [13] Parity Error Enable, [12:11] Way, [10:4] Cache set

  setx  DTLB_ENTRY_PA, %l0, %l2
  mov   0x7f0, %l0              ! Mask for extracting [10:4] of PA (set)
  and   %l2, %l0, %l2

  ! %i5 has the subroutine argument to determine if parity is to be flipped
  sllx  %i5, 13, %i5            ! [13] is parity error enable
  or    %l2, %i5, %l2

  mov   DCACHE_WAY, %l0
  sllx  %l0, 11, %l0            ! Position Way
  or    %l2, %l0, %l2           ! %l2 has final address for the tag write

  ! Perform the diag write
  stxa  %l1, [%l2] ASI_DCACHE_TAG

  ret
  restore

sub_dcache_data_write:

  ! PA: [38:11] Tag, [10:4] 128 sets, [3] select 2 double words, [2:0] always 0 (8-byte word addressing)

  ! Generate write address
  ! Write address: [20:13] PERRMASK, [12:11] Way, [10:4] Cache set, [3] selects 1 of 2 D-Words

  setx   DTLB_ENTRY_PA, %l0, %l1
  setx   0x7f0, %l0, %l2        ! Mask for extracting [10:4]
  and    %l1, %l2, %l1

  mov    DCACHE_WAY, %l2
  sllx   %l2, 11, %l2           ! Position Way
  or     %l1, %l2, %l1

  ! %i5 has PERRMASK
  sllx   %i5, 13, %i5
  or     %l1, %i5, %l1          ! %l1 has the address for the write, except for bit 3

  ! Generate write data
  ! Write data is the 64-bit double word - Read from test_data
  setx   test_data, %l0, %l2    ! %l2 has the base address where the test data reside

  ! Perform the write - in a loop for 2 double words
  mov    2, %l3           ! Loop count
  mov    0, %l4           ! Loop iterator

dcache_data_write_loop:
  sllx   %l4, 3, %l5      ! Advance address by 8

  add    %l2, %l5, %l6
  ldx    [%l6], %l6       ! %l6 has the double word

  or     %l1, %l5, %l7    ! %l7 has final write address

  ! Do the ASI write, finally
  stxa   %l6, [%l7] ASI_DCACHE_DATA

  inc    %l4
  cmp    %l3, %l4
  bne    dcache_data_write_loop
  nop

  ret
  restore


/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta	T_GOOD_TRAP

test_fail:
ta	T_BAD_TRAP

.data

dtlb_entry:
  ! First word: Tag Access (Note: [12:0] context)
  ! Second word: Data Access TTE
  .xword  0x0000000020012044,  0x8000001130012023

.align 8192

test_data:
  .xword  0x1004abba00000000
  .xword  0x2004abba00000000

