// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: err_l2cache_tag_ld_cecc.s
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

#define  L2_ENTRY_PA        0x217570000
#define  L2_BANK_ADDR       0x0
#define  DRAM_CHANNEL_ADDR  0x0
#define  TEST_DATA          0x1000abba
#define  L2_ES_W1C_VALUE    0xc03ffff800000000

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
  setx  L2ES_PA0, %l0, %g2
  add   %g2, L2_BANK_ADDR, %g2
  set   TEST_DATA, %g3
  setx  L2_ES_W1C_VALUE, %l0, %g4
  setx  L2CS_PA0, %l0, %g7
  add   %g7, L2_BANK_ADDR, %g7

set_L2_Directly_Mapped_Mode:
  mov   0x2, %l0
  stx   %l0, [%g7]
  
disable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the lower 2 bits (I-Cache and D-Cache enables)
  andn  %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

  ! Store test data into L2
  st    %g3, [%g1]              ! Way 5

  mov   6, %l0
  sllx  %l0, 18, %l0            ! L2 way on [21:18] of address (for directly mapped mode)
  add   %g1, %l0, %l0           ! Way 11 (5 + 6)
  set   0x2000abba, %l1
  st    %l1, [%l0]  

disable_l2:
  mov   0x3, %l0
  stx   %l0, [%g7]

  ! Write 1 to clear L2 Error status registers
clear_l2_ESR:
  stx   %g4, [%g2]
  nop

  ! Read L2 Tag Diag
  ! Addressing: [39:32] See PRM, [21:18] way, [17:8] set, [7:6] bank, [2:0] = 0
  set   0x3fffc0, %l2           ! Mask for extracting [21:6]
  and   %g1, %l2, %l2

  mov   0xb5, %l0
  sllx  %l0, 32, %l0            ! Bits [39:32]
  or    %l2, %l0, %l2           ! %l2 has L2 Tag Diag addressing for way 5

read_l2_data_diag_way5:
  ldx   [%l2], %g5              ! Correct data saved on %g5

  ! Flip one bit
  xor   %g5, 0x80, %l0
write_back_with_error_way5:
  stx   %l0, [%l2]

  mov   6, %l0
  sllx  %l0, 18, %l0
  add   %l2, %l0, %l2           ! %l2 has L2 Tag Diag addressing for way 11

read_l2_data_diag_way11:
  ldx   [%l2], %g6              ! Correct data saved on %g6

  ! Flip one bit
  xor   %g6, 0x1, %l0
write_back_with_error_way11:
  stx   %l0, [%l2]

enable_l2:
  mov   0x2, %l0
  sllx  %o7, 15, %l1
  or    %l0, %l1, %l0
  stx   %l0, [%g7]

enable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  or    %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

error_address:
  ld    [%g1], %l0
  
  ! load data should be correct
  cmp   %l0, %g3
  bne   test_fail
  nop

  ! Compute expected value of L2 error status register
  mov   0x1, %l1
  sllx  %l1, L2ES_LTC, %l2
  sllx  %l1, L2ES_VEC, %l3       ! VEC (any valid CE) not in PRM, but set by RTL
  or    %l2, %l3, %l2            ! %l2 has expected value

check_l2_ESR:
  ldx   [%g2], %l4

  cmp   %l4, %l2
  bne   %xcc, test_fail
  nop

  ! Read L2 Tag Diag again - both tags should be corrected
  ! Addressing: [39:32] See PRM, [21:18] way, [17:8] set, [7:6] bank, [2:0] = 0
  set   0x3fffc0, %l2           ! Mask for extracting [21:6]
  and   %g1, %l2, %l2

  mov   0xa4, %l0
  sllx  %l0, 32, %l0            ! Bits [39:32]
  or    %l2, %l0, %l2           ! %l2 has L2 Tag Diag addressing for way 5

verify_tag_way5:
  ldx   [%l2], %l5              ! Correct data saved on %g5
  cmp   %l5, %g5
  bne   %xcc, test_fail
  nop

  mov   6, %l0
  sllx  %l0, 18, %l0
  add   %l2, %l0, %l2           ! %l2 has L2 Tag Diag addressing for way 11

verify_tag_way11:
  ldx   [%l2], %l6              ! Correct data saved on %g6
  cmp   %l6, %g6
  bne   %xcc, test_fail
  nop

  ! Check if a Corrected ECC Trap happened
  setx  EXECUTED, %l1, %l0
  cmp   %o0, %l0
  bne   test_fail
  nop
  mov   TT_Corrected_ECC, %l0
  cmp   %o1, %l0
  bne   test_fail
  nop

  ! Check L2 Error Address Register
  setx  L2EA_PA1, %l2, %l3
  add   %l3, L2_BANK_ADDR, %l3
check_l2_EAR:
  ldx   [%l3], %l4

  ! Error address is the cache index (PA[21:6] for directly mapped mode)
  set   0x3fffc0, %l2           ! Mask for extracting [21:6]
  and   %g1, %l2, %l1
  and   %l4, %l2, %l4           ! Unused bits are not guranteed to be zero
  cmp   %l4, %l1
  bne   %xcc, test_fail
  nop

  ba    test_pass
  nop

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

