// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: err_dcache_data_asi_cecc.s
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

#define  DCACHE_ENTRY_PA    0x20
! D-Cache Tag parity computed by hand (if PA[39:11] changes, this need be re-computed)
#define  DCACHE_TAG_PARITY 0
! This test uses directly-mapped mode for D-Cache -- PA[12:11] is D-Cache way
#define  DCACHE_WAY  0

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

  ! Sparc Error Status Register powers up X - Write 1 on each bit to clear
  setx  0xefffffff, %l1, %l2
  stxa  %l2, [%g0] ASI_SES

disable_L1_D_Cache:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the bit 1 (D-Cache enables)
  andn  %l0, 0x2, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

  ! Store my test data into memory

  setx   DCACHE_ENTRY_PA, %l0, %g1 ! Store to PA (in Hypervisor mode now)
  setx   test_data, %l0, %g2       ! Location where test data reside

  ! Perform the store - in a loop for 2 D-Words (16-byte cache line)
  mov    2, %l0                    ! Loop count
  mov    0, %l1                    ! Loop iterator

store_loop:
  sllx   %l1, 3, %l2               ! Advance addresses by 8

  add    %g1, %l2, %l3             ! %l3 now has the current address
  add    %g2, %l2, %l4             ! %l4 now has the location for current word
  ldx    [%l4], %l5                ! %l5 now has the data word

  ! store
  stx    %l5, [%l3]

  inc    %l1
  cmp    %l0, %l1
  bne    store_loop
  nop

initialize_ASI_SCRATCHPAD:
  stxa  %g0, [%g1] ASI_SCRATCHPAD

set_DCache_Direct_Map_mode:
  mov   0x10, %l1         ! VA for ASI 0x42
  ldxa  [%l1] ASI_LSU_DIAG, %l0
  or    %l0, 0x2, %l0
  stxa  %l0, [%l1] ASI_LSU_DIAG

  ! Write D-cache tag without error
  mov   0, %o5
  call  sub_dcache_tag_write
  save

  ! Write D-cache data with error
  ! D-Cache keeps a parity for each byte -- pass a 8-bit mask
  mov   0x48, %o5
  call  sub_dcache_data_write
  save

! A load hitting DCache error with DCache disabled should not trigger error logging or trapping
error_address1:
  ldx   [%g1], %l1

  ! Check result
  ldx   [%g2], %l2
  cmp   %l2, %l1
  bne   %xcc, test_fail
  nop

enable_L1_D_Cache:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  or    %l0, 0x2, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

  ! Sparc Error Status should be clean
  ldxa  [%g0] ASI_SES, %l1
  set   SES_INIT_VALUE, %l2
  cmp   %l1, %l2
  bne   test_fail
  nop

! Internal ASI load hitting DCache error should not trigger error logging or trapping
error_address2:
  ldxa  [%g1] ASI_SCRATCHPAD, %l0

  brnz  %l0, test_fail
  nop

  ! Sparc Error Status should be clean
  ldxa  [%g0] ASI_SES, %l1
  set   SES_INIT_VALUE, %l2
  cmp   %l1, %l2
  bne   test_fail
  nop

  ba    test_pass
  nop

#include "err_subroutines.s"

sub_dcache_tag_write:

  ! PA: [38:11] Tag, [10:4] 128 sets, [3] select 2 double words, [2:0] always 0 (8-byte word addressing)

  ! Generate write data
  ! Write data: [28:1] Tag ([38:11] of PA), [0] - valid bit

  setx  DCACHE_ENTRY_PA, %l0, %l1
  srlx  %l1, 10, %l1            ! [38:10] shifted to [28:0]
  or    %l1, 0x1, %l1           ! Set 1 to [0], which is the valid bit
                                ! %l1 has the data for the tag write

  ! Generate write address
  ! Write address: [13] Parity Error Enable, [12:11] Way, [10:4] Cache set

  setx  DCACHE_ENTRY_PA, %l0, %l2
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

  setx   DCACHE_ENTRY_PA, %l0, %l1
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

test_data:
  .xword  0x1004abba00000000
  .xword  0x2004abba00000000

