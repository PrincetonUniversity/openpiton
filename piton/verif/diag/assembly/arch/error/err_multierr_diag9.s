// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: err_multierr_diag9.s
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
/******************************************************
This test creats a situation where a 64-byte block load
(which is split into 4 CPX load returns) encounters an
L2 CE on the second packet, and an L2 UE on the third.

******************************************************/

#define H_HT0_Data_access_error_0x32 My_Data_Access_Error_Trap

#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text
.global  main
.global  My_Data_Access_Error_Trap

#include "err_defines.h"

#define  L2_ENTRY_PA        0x1170000000
#define  L2_ENTRY_VA        0x60000000
#define  L2_BANK_ADDR       0x0
#define  L2_CE_OFFSET       0x10
#define  L2_UE_OFFSET       0x20
#define  L2_ES_W1C_VALUE    0xc03ffff800000000
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

  ta    T_CHANGE_HPRIV

  ! Enable FPU
  wr    %g0, 0x4, %fprs

  setx  L2_ENTRY_PA, %l0, %g1
  add   %g1, L2_BANK_ADDR, %g1
  setx  L2ES_PA0, %l0, %g2
  add   %g2, L2_BANK_ADDR, %g2
  setx  L2_ENTRY_VA, %l0, %g3
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

create_l2_CE:
  ! Read L2 Data Diag
  ! Addressing: [39:32] See PRM, [22] odd/even word, [21:18] way, [17:8] set, [7:6] bank, [5:3] D-word, [2:0] = 0
  setx  0x3ffff8, %l0, %l2      ! Mask for extracting [21:3]
  add   %g1, L2_CE_OFFSET, %g5
  and   %g5, %l2, %g5

  mov   0xa1, %l0
  sllx  %l0, 32, %l0            ! Bits [39:32]
  or    %g5, %l0, %g5           ! %g5 has L2 Data Diag addressing

  ldx   [%g5], %g6

  ! Flip one bits
  xor   %g6, 0x80, %g6
  ! Write back with error
  stx   %g6, [%g5]

create_l2_UE:
  ! Read L2 Data Diag
  ! Addressing: [39:32] See PRM, [22] odd/even word, [21:18] way, [17:8] set, [7:6] bank, [5:3] D-word, [2:0] = 0
  setx  0x3ffff8, %l0, %l2      ! Mask for extracting [21:3]
  add   %g1, L2_UE_OFFSET, %g5
  and   %g5, %l2, %g5

  mov   0xb1, %l0
  sllx  %l0, 32, %l0            ! Bits [39:32]
  or    %g5, %l0, %g5           ! %g5 has L2 Data Diag addressing

  ldx   [%g5], %g6

  ! Flip two bits
  xor   %g6, 0x11, %g6          ! save on %g6 for future reference
  ! Write back with error
  stx   %g6, [%g5]

enable_l2:
  mov   0x2, %l0
  stx   %l0, [%g7]

enable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  or    %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

error_address:
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
  
  ! Compute expected value of L2 error status register
  mov   0x1, %l1
  sllx  %l1, L2ES_LDAU, %l7
  sllx  %l1, L2ES_LDAC, %l3
  or    %l7, %l3, %l7
  sllx  %l1, L2ES_MEC, %l3       ! MEC bit should be set
  or    %l7, %l3, %l7
  sllx  %l1, L2ES_VEU, %l3       ! VEU (any valid UE) not in PRM, but set by RTL
  or    %l7, %l3, %l7
  sllx  %l1, L2ES_VEC, %l3       ! VEC (any valid CE) not in PRM, but set by RTL
  or    %l7, %l3, %l7
  mov   0x11, %l1                ! 7-bit UE Syndrome
  sllx  %l1, 21, %l3             ! Syndrome for [127:96] at [27:21]
  or    %l7, %l3, %l7
  sllx  %o7, L2ES_TID, %l3       ! ID of thread that encountered error
  or    %l7, %l3, %l7            ! %l7 has expected value

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
  add   %g1, L2_UE_OFFSET, %l7
  cmp   %l4, %l7
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
  andn  %l7, 0x3f, %l7
  cmp   %l0, %l7
  bne   %xcc, test_fail
  nop

read_l2_data_diag_again:
  ldx   [%g5], %l0
  ! Contents should not change
  cmp   %l0, %g6
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

.data

  .xword  0x0000abba00000000,  0x1000abba00001111
  .xword  0x2000abba00002222,  0x3000abba00003333
  .xword  0x4000abba00004444,  0x5000abba00005555
  .xword  0x6000abba00006666,  0x7000abba00007777
