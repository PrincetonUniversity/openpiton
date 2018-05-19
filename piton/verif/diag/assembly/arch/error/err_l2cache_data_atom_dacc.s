// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: err_l2cache_data_atom_dacc.s
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

#define  L2_ENTRY_PA      0x311774500
#define  L2_BANK_ADDR     0x80
#define  TEST_DATA        0x81c3e008
#define  L2_ES_W1C_VALUE  0xc03ffff800000000
#define  SPARC_ES_W1C_VALUE 0xefffffff

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

  ! Boot code does not provide TLB translation for IO address space
  ta    T_CHANGE_HPRIV

  setx  L2_ENTRY_PA, %l0, %g1
  add   %g1, L2_BANK_ADDR, %g1
  setx  TEST_DATA, %l0, %g3
  setx  L2_ES_W1C_VALUE, %l0, %g4
  setx  L2CS_PA1, %l0, %g7
  add   %g7, L2_BANK_ADDR, %g7

  ! Clear Sparc Error Status register
  set   SPARC_ES_W1C_VALUE, %l0
  stxa  %l0, [%g0] ASI_SES

set_L2_Directly_Mapped_Mode:
  mov   0x2, %l0
  stx   %l0, [%g7]
  
disable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the lower 2 bits (I-Cache and D-Cache enables)
  andn  %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

  ! Store test data into L2
  st    %g3, [%g1]

disable_l2:
  mov   0x3, %l0
  stx   %l0, [%g7]

  ! Write 1 to clear L2 Error status registers
  setx  L2ES_PA1, %l3, %l4
  add   %l4, L2_BANK_ADDR, %l4
clear_l2_ESR:
  stx   %g4, [%l4]
  nop

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

enable_l2:
  mov   0x2, %l0
  sllx  %o7, 15, %l1            ! set error steering thread
  or    %l0, %l1, %l0
  stx   %l0, [%g7]

enable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  or    %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

  mov   %g3, %l2
  set   0xdeadbeef, %l1
  mov   %l1, %l0                     ! Keep a copy

error_address:
  casxa [%g1] ASI_PRIMARY, %l2, %l1  ! Contents in %l1 & [%g1] would've been swapped without the error

  ! Check swap not being completed
  cmp   %l1, %l0
  bne   %xcc, test_fail
  nop

read_l2_data_diag_again:
  ldx   [%g5], %l0
  ! Contents should not change
  cmp   %l0, %g6
  bne   %xcc, test_fail
  nop

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
  sllx  %l1, L2ES_LDAU, %l0
  sllx  %l1, L2ES_VEU, %l3       ! VEC (any valid CE) not in PRM, but set by RTL
  or    %l0, %l3, %l0
  sllx  %l1, L2ES_RW, %l3        ! RW bit should be set for atomic
  or    %l0, %l3, %l0
  mov   0x11, %l1                ! 7-bit Syndrome
  sllx  %l1, 21, %l3             ! Syndrome for [127:96] at [27:21]
  or    %l0, %l3, %l0            ! OR in Syndrome for [127:96]
  sllx  %o7, L2ES_TID, %l3       ! ID of thread that encountered error
  or    %l0, %l3, %l0            ! %l0 has expected value

  setx  L2ES_PA0, %l2, %l3
  add   %l3, L2_BANK_ADDR, %l3
check_l2_ESR:
  ldx   [%l3], %l4

  cmp   %l4, %l0
  bne   %xcc, test_fail
  nop

  setx  L2EA_PA0, %l2, %l3
  add   %l3, L2_BANK_ADDR, %l3
check_l2_EAR:
  ldx   [%l3], %l4

  ! Error address is the physical address of the cache line (PA[5:0] 0)
  andn  %g1, 0x3f, %l1
  cmp   %l4, %l1
  bne   %xcc, test_fail
  nop

check_Sparc_ESR:
  ldxa  [%g0] ASI_SES, %l0
  set   SES_INIT_VALUE, %l1
  mov   0x1, %l2
  sllx  %l2, SES_LDAU, %l3
  or    %l1, %l3, %l1
  mov   0x1, %l2
  sllx  %l2, 0x1d, %l3
  or    %l1, %l3, %l1
  cmp   %l0, %l1
  bne   test_fail
  nop

check_Sparc_Error_Address:
  ldxa  [%g0] ASI_SEA, %l0
  cmp   %l0, %g1
  bne   %xcc, test_fail
  nop

  ba    test_pass
  nop

My_Data_Access_Error_Trap:
  ! Signal trap taken
  set   EXECUTED, %o0
  ! save trap type value
  rdpr  %tt, %o1
  ! precise trap
  done

/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP

