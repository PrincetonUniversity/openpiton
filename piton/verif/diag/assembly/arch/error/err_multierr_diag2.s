// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: err_multierr_diag2.s
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
#define H_HT0_Corrected_ECC_error_0x63 My_Corrected_ECC_error_trap

#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text
.global  main
.global  My_Data_Access_Error_Trap
.global  My_Corrected_ECC_error_trap 

#include "err_defines.h"

#define  L2_ENTRY_PA        0x1350018800
#define  L2_BANK_ADDR       0xc0
#define  L2_ES_W1C_VALUE    0xc03ffff800000000
#define  SPARC_ES_W1C_VALUE 0xefffffff

main:

  clr   %g3

#ifdef  RUN_TH1
  mov   0x1, %g3
#endif
#ifdef  RUN_TH2
  mov   0x2, %g3
#endif
#ifdef  RUN_TH3
  mov   0x3, %g3
#endif

  ta    %icc, T_RD_THID
  cmp   %o1, %g3
  bne   test_pass
  nop

  ! Boot code does not provide TLB translation for IO address space
  ta    T_CHANGE_HPRIV

  setx  L2_ENTRY_PA, %l0, %g1
  add   %g1, L2_BANK_ADDR, %g1
  setx  L2ES_PA0, %l0, %g2
  add   %g2, L2_BANK_ADDR, %g2
  setx  L2_ES_W1C_VALUE, %l0, %g4
  setx  L2CS_PA1, %l0, %g7
  add   %g7, L2_BANK_ADDR, %g7

  ! Clear Sparc Error Status register
  set   SPARC_ES_W1C_VALUE, %l0
  stxa  %l0, [%g0] ASI_SES

set_L2_Directly_Mapped_Mode:
  mov   0x2, %l0
  sllx  %g3, 15, %l1
  or    %l0, %l1, %l0
  stx   %l0, [%g7]
  
store_test_data:
  ! Store test data
  setx  test_data, %l1, %l0
  ldx   [%l0], %l1
  stx   %l1, [%g1]
  ldx   [%l0+8], %l1
  stx   %l1, [%g1+8]

clear_l2_ESR:
  stx   %g4, [%g2]

  ! Read L2 Data Diag
  ! Addressing: [39:32] See PRM, [22] odd/even word, [21:18] way, [17:8] set, [7:6] bank, [5:3] D-word, [2:0] = 0
  setx  0x3ffff8, %l0, %l2      ! Mask for extracting [21:3]
  and   %g1, %l2, %g5

  mov   0xb1, %l0
  sllx  %l0, 32, %l0            ! Bits [39:32]
  or    %g5, %l0, %g5           ! %g5 has L2 Data Diag addressing

read_l2_data_diag:
  ldx   [%g5], %g6

  ! Flip two bits
  xor   %g6, 0x11, %g6          ! save on %g6 for future reference
write_back_with_error:
  stx   %g6, [%g5]

  ! Write D-cache tag without error
  mov   0, %o5
  call  sub_dcache_tag_write
  save

  ! Write D-cache data with error
  ! D-Cache keeps a parity for each byte -- pass a 8-bit mask
  mov   0x48, %o5
  call  sub_dcache_data_write
  save

error_address:
  ldx   [%g1], %l0

  ! Check if a Data Access Error Trap happened
  set   EXECUTED, %l0
  cmp   %o0, %l0
  bne   test_fail
  nop
  mov   TT_Data_Access_Error, %l0
  cmp   %o1, %l0
  bne   test_fail
  nop

  ! Compute expected value of L2 error status register
  mov   0x1, %l1
  sllx  %l1, L2ES_LDAU, %l7
  sllx  %l1, L2ES_VEU, %l3       ! VEU (any valid UE) not in PRM, but set by RTL
  or    %l7, %l3, %l7
  mov   0x11, %l1                ! 7-bit Syndrome
  sllx  %l1, 21, %l3             ! Syndrome for [127:96] at [27:21]
  or    %l7, %l3, %l7
  sllx  %g3, L2ES_TID, %l3       ! ID of thread that encountered error
  or    %l7, %l3, %l7            ! %l0 has expected value

check_l2_ESR:
  ldx   [%g2], %l4

  cmp   %l4, %l7
  bne   %xcc, test_fail
  nop

  setx  L2EA_PA0, %l2, %l3
  add   %l3, L2_BANK_ADDR, %l3
check_l2_EAR:
  ldx   [%l3], %l4

  ! Error address is the physical address of the cache line (PA[5:0] 0)
  cmp   %l4, %g1
  bne   %xcc, test_fail
  nop

  set   SES_INIT_VALUE, %l1
  mov   0x1, %l2
  sllx  %l2, SES_LDAU, %l3
  or    %l1, %l3, %l1
  sllx  %l2, SES_DDC, %l3
  or    %l1, %l3, %l1
  mov   0x1, %l2
  sllx  %l2, 0x1d, %l3
  or    %l1, %l3, %l1

check_Sparc_ESR:
  ldxa  [%g0] ASI_SES, %l0
  cmp   %l0, %l1
  bne   test_fail
  nop

check_Sparc_Error_Address:
  ldxa  [%g0] ASI_SEA, %l0
  cmp   %l0, %g1
  bne   %xcc, test_fail
  nop

read_l2_data_diag_again:
  ldx   [%g5], %l0
  ! Contents should not change
  cmp   %l0, %g6
  bne   %xcc, test_fail
  nop

  ! Check if a Corrected ECC Error Trap happened
  set   EXECUTED, %l0
  cmp   %o2, %l0
  bne   test_fail
  nop
  mov   TT_Corrected_ECC, %l0
  cmp   %o3, %l0
  bne   test_fail
  nop

  ba    test_pass
  nop

sub_dcache_tag_write:

  ! PA: [38:11] Tag, [10:4] 128 sets, [3] select 2 double words, [2:0] always 0 (8-byte word addressing)
  ! PA[12:11] is D-Cache way - direct map mode

  ! Generate write data
  ! Write data: [28:1] Tag ([38:11] of PA), [0] - valid bit

  srlx  %g1, 10, %l1            ! [38:10] shifted to [28:0]
  or    %l1, 0x1, %l1           ! Set 1 to [0], which is the valid bit
                                ! %l1 has the data for the tag write

  ! Generate write address
  ! Write address: [13] Parity Error Enable, [12:11] Way, [10:4] Cache set

  set   0x1ff0, %l0             ! Mask for extracting [12:4] of PA (set)
  and   %g1, %l0, %l2

  ! %i5 has the subroutine argument to determine if parity is to be flipped
  sllx  %i5, 13, %i5            ! [13] is parity error enable
  or    %l2, %i5, %l2           ! %l2 has final address for the tag write

  ! Perform the diag write
  stxa  %l1, [%l2] ASI_DCACHE_TAG

  ret
  restore


sub_dcache_data_write:

  ! PA: [38:11] Tag, [10:4] 128 sets, [3] select 2 double words, [2:0] always 0 (8-byte word addressing)
  ! PA[12:11] is D-Cache way - direct map mode

  ! Generate write address
  ! Write address: [20:13] PERRMASK, [12:11] Way, [10:4] Cache set, [3] selects 1 of 2 D-Words

  set    0x1ff0, %l0            ! Mask for extracting [12:4]
  and    %g1, %l0, %l1

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

My_Data_Access_Error_Trap:
  ! Signal trap taken
  set   EXECUTED, %o0
  ! save trap type value
  rdpr  %tt, %o1
  ! precise trap
  done

My_Corrected_ECC_error_trap:
  ! Signal trap taken
  setx  EXECUTED, %l0, %o2
  ! save trap type value
  rdpr  %tt, %o3
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

