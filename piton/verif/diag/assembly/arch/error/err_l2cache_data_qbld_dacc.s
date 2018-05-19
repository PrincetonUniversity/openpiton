// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: err_l2cache_data_qbld_dacc.s
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

#define  L2_ENTRY_PA        0x1270018000
#define  L2_BANK_ADDR       0x80
#define  L2_UE_OFFSET       0x20
#define  L2_ES_W1C_VALUE    0xc03ffff800000000
#define  SPARC_ES_W1C_VALUE 0xefffffff
#define  TEST_DATA          0x10000000abba0000

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

  setx  L2_ENTRY_PA, %l0, %g1
  add   %g1, L2_BANK_ADDR, %g1
  setx  L2ES_PA0, %l0, %g2
  add   %g2, L2_BANK_ADDR, %g2
  setx  L2EE_PA1, %l0, %g3
  add   %g3, L2_BANK_ADDR, %g3
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
  mov   64, %l0               ! Maximum offset
  clr   %l1                   ! Offset
  setx  TEST_DATA, %l3, %l2   ! Data

store_test_data:
  stx   %l2, [%g1+%l1]
  add   %l2, 8, %l2
  add   %l1, 8, %l1
  cmp   %l1, %l0
  bne   store_test_data
  nop

load_to_FP_registers:
  ! Load to floating point registers (for block load comparison later)
  ldd   [%g1], %f16
  ldd   [%g1+0x8], %f18
  ldd   [%g1+0x10], %f20
  ldd   [%g1+0x18], %f22
  ldd   [%g1+0x20], %f24
  ldd   [%g1+0x28], %f26
  ldd   [%g1+0x30], %f28
  ldd   [%g1+0x38], %f30

disable_l2:
  mov   0x3, %l0
  stx   %l0, [%g7]

clear_l2_ESR:
  stx   %g4, [%g2]

  ! Read L2 Data Diag
  ! Addressing: [39:32] See PRM, [22] odd/even word, [21:18] way, [17:8] set, [7:6] bank, [5:3] D-word, [2:0] = 0
  setx  0x3ffff8, %l0, %l2      ! Mask for extracting [21:3]
  add   %g1, L2_UE_OFFSET, %g5
  add   %g5, 0x8, %g5           ! Effective UE offset is 0x28
  and   %g5, %l2, %g5

  mov   0xb1, %l0
  sllx  %l0, 32, %l0            ! Bits [39:32]
  or    %g5, %l0, %g5
  mov   1, %l0
  sllx  %l0, 22, %l0            ! Set Bit 22 for the odd word
  or    %g5, %l0, %g5           ! %g5 has L2 Data Diag addressing

read_l2_data_diag:
  ldx   [%g5], %g6

  ! Flip two bits
  xor   %g6, 0x11, %g6          ! save on %g6 for future reference
write_back_with_error:
  stx   %g6, [%g5]

enable_l2:
  mov   0x2, %l0
  stx   %l0, [%g7]

enable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  or    %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

  clr   %l4
  clr   %l5

  add   %g1, L2_UE_OFFSET, %l0
error_address1:
  ! First test quad-load
  ldda  [%l0] ASI_NUCLEUS_QUAD_LDD, %l4

  ! Compute expected value of L2 error status register
  mov   0x1, %l1
  sllx  %l1, L2ES_LDAU, %l7
  sllx  %l1, L2ES_VEU, %l3       ! VEC (any valid CE) not in PRM, but set by RTL
  or    %l7, %l3, %l7
  mov   0x11, %l1                ! 7-bit Syndrome for [31:0]
  or    %l7, %l1, %l7
  sllx  %o7, L2ES_TID, %l3       ! ID of thread that encountered error
  or    %l7, %l3, %l7            ! %l7 has expected value

  ! Load should not complete
  brnz  %l4, test_fail
  nop
  brnz  %l5, test_fail
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

check_l2_ESR1:
  ldx   [%g2], %l4

  cmp   %l4, %l7
  bne   %xcc, test_fail
  nop

  setx  L2EA_PA0, %l2, %l3
  add   %l3, L2_BANK_ADDR, %l3
check_l2_EAR1:
  ldx   [%l3], %l4

  ! Error address is the physical address of the cache line (PA[5:0] 0)
  add   %g1, L2_UE_OFFSET, %l1
  cmp   %l4, %l1
  bne   %xcc, test_fail
  nop

check_Sparc_ESR1:
  ldxa  [%g0] ASI_SES, %l0
  set   SES_INIT_VALUE, %l1
  mov   0x1, %l2
  sllx  %l2, SES_LDAU, %l3
  or    %l1, %l3, %l1
  sllx  %l2, 0x1d, %l3
  or    %l1, %l3, %l1
  cmp   %l0, %l1
  bne   test_fail
  nop

check_Sparc_EAR1:
  ldxa  [%g0] ASI_SEA, %l0
  add   %g1, L2_UE_OFFSET, %l1
  cmp   %l0, %l1
  bne   %xcc, test_fail
  nop

  ! Now test block load
  clr   %o0
  clr   %o1

error_address2:
  ldda  [%g1] ASI_BLK_P, %f0

  ! The follow loads should complete
  fcmpd %fcc0, %f0, %f16
  fbne  test_fail
  nop
  fcmpd %fcc0, %f2, %f18
  fbne  test_fail
  nop
  fcmpd %fcc0, %f4, %f20
  fbne  test_fail
  nop
  fcmpd %fcc0, %f6, %f22
  fbne  test_fail
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

  ! L2 ESR should have MEU now
  mov   1, %l0
  sllx  %l0, L2ES_MEU, %l0
  or    %l7, %l0, %l0
check_l2_ESR2:
  ldx   [%g2], %l4
  cmp   %l4, %l0
  bne   %xcc, test_fail
  nop

  ! Sparc ESR should also have MEU set
check_Sparc_ESR2:
  ldxa  [%g0] ASI_SES, %l0
  set   SES_INIT_VALUE, %l1
  mov   0x1, %l2
  sllx  %l2, SES_LDAU, %l3
  or    %l1, %l3, %l1
  sllx  %l2, SES_MEU, %l3
  or    %l1, %l3, %l1
  sllx  %l2, 0x1d, %l3
  or    %l1, %l3, %l1
  cmp   %l0, %l1
  bne   test_fail
  nop

  ! Disable L2 error reporting to Sparc
  stx   %g0, [%g3]

  ! Clear Sparc ESR
  mov   1, %l1
  sllx  %l1, SES_LDAU, %l0
  sllx  %l1, SES_MEU, %l1
  or    %l0, %l1, %l0
  sllx  %l1, 0x1d, %l1
  or    %l0, %l1, %l0
  stxa  %l0, [%g0] ASI_SES

  ! Clear L2 ESR
  stx   %g4, [%g2]

  add   %g1, L2_UE_OFFSET, %l0
  add   %l0, 0x8, %l0
error_address3:
  ! Both quad-loads and block loads are non-cacheable to L1.
  ! This load should go out to L2
  ldx   [%l0], %l1
  
check_l2_ESR3:
  ldx   [%g2], %l4

  ! LDAU but no MEU
  cmp   %l4, %l7
  bne   %xcc, test_fail
  nop

  ! Sparc ESR should be clean
check_Sparc_ESR3:
  ldxa  [%g0] ASI_SES, %l0
  set   SES_INIT_VALUE, %l1
  mov   0x1, %l2
  sllx  %l2, 0x1d, %l3
  or    %l1, %l3, %l1
  cmp   %l0, %l1
  bne   test_fail
  nop

  ba    test_pass
  nop

My_Data_Access_Error_Trap:
  ! Signal trap taken
  set   EXECUTED, %o0
  ! save trap type value
  rdpr  %tt, %o1
  done

/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP

