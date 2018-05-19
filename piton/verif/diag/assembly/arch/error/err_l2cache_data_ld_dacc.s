// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: err_l2cache_data_ld_dacc.s
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
#define H_HT0_Data_access_error_0x32 My_Data_Access_Error_Trap

#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text
.global  main
.global  My_Corrected_ECC_error_trap 
.global  My_Data_Access_Error_Trap

#include "err_defines.h"

#define  DTLB_POSITION      10
#define  L2_ENTRY_PA        0x1130018800
#define  L2_ENTRY_VA        0x20018800
#define  L2_BANK_ADDR       0xc0
#define  TEST_DATA          0x81c3e00800000000
#define  L2_ES_W1C_VALUE    0xc03ffff800000000
#define  SPARC_ES_W1C_VALUE 0xefffffff

main:

  clr   %g4

#ifdef  RUN_TH1
  mov   0x1, %g4
#endif
#ifdef  RUN_TH2
  mov   0x2, %g4
#endif
#ifdef  RUN_TH3
  mov   0x3, %g4
#endif

  ta    %icc, T_RD_THID
  cmp   %o1, %g4
  bne   test_pass
  nop

  ! Boot code does not provide TLB translation for IO address space
  ta    T_CHANGE_HPRIV

  setx  L2_ENTRY_PA, %l0, %g1
  add   %g1, L2_BANK_ADDR, %g1
  setx  L2ES_PA0, %l0, %g2
  add   %g2, L2_BANK_ADDR, %g2
  setx  L2_ENTRY_VA, %l0, %g3
  add   %g3, L2_BANK_ADDR, %g3
  setx  L2CS_PA1, %l0, %g7
  add   %g7, L2_BANK_ADDR, %g7

  ! Write DTLB - prefetch won't fetch if it misses DTLB
  call  sub_dtlb_write
  save

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
  setx  TEST_DATA, %l1, %l0
  stx   %l0, [%g1]
  stx   %l0, [%g1+8]

disable_l2:
  mov   0x3, %l0
  stx   %l0, [%g7]

clear_l2_ESR:
  setx  L2_ES_W1C_VALUE, %l0, %l1
  stx   %l1, [%g2]

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
  sllx  %g4, 15, %l1
  or    %l0, %l1, %l0
  stx   %l0, [%g7]

enable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  or    %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

  ta    T_CHANGE_NONHPRIV

  clr   %o0
  clr   %o1

error_address1:
  ! First test prefetch for one read -- can not be in Hypervisor mode
  prefetch [%g3], 1

  ! Compute expected value of L2 error status register
  mov   0x1, %l1
  sllx  %l1, L2ES_LDAU, %l7
  sllx  %l1, L2ES_VEU, %l3       ! VEU (any valid UE) not in PRM, but set by RTL
  or    %l7, %l3, %l7
  mov   0x11, %l1                ! 7-bit Syndrome
  sllx  %l1, 21, %l3             ! Syndrome for [127:96] at [27:21]
  or    %l7, %l3, %l7
  sllx  %g4, L2ES_TID, %l3       ! ID of thread that encountered error
  or    %l7, %l3, %l7            ! %l0 has expected value

  ! No processor trap should happen for prefetch
  brnz  %o0, test_fail
  nop
  brnz  %o1, test_fail
  nop

  ta    T_CHANGE_HPRIV

check_l2_ESR1:
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

check_Sparc_ESR1:
  ldxa  [%g0] ASI_SES, %l0
  set   SES_INIT_VALUE, %l1
  ! No error logged in Sparc ESR for prefetch
  cmp   %l0, %l1
  bne   test_fail
  nop

error_address2:
  ! Now load
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

  ! Check L2 ESR again - should have MEU set
  mov   1, %l0
  sllx  %l0, L2ES_MEU, %l0
  or    %l7, %l0, %l7 

check_l2_ESR2:
  ldx   [%g2], %l0
  cmp   %l0, %l7
  bne   %xcc, test_fail
  nop

check_Sparc_ESR2:
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

  ! Clear Sparc ESR
  set   SPARC_ES_W1C_VALUE, %l0
  stxa  %l0, [%g0] ASI_SES

  ! Disable L2 error reporting to Sparc
  setx  L2EE_PA0, %l0, %l1
  add   %l1, L2_BANK_ADDR, %l1
  stx   %g0, [%l1]

error_address3:
  ! This is to test that L1 D-Cache be loaded with bad parity
  ldx   [%g1], %l0

check_Sparc_ESR3:
  ldxa  [%g0] ASI_SES, %l0
  set   SES_INIT_VALUE, %l1
  mov   0x1, %l2
  sllx  %l2, SES_DDC, %l3
  or    %l1, %l3, %l1
  mov   0x1, %l2
  sllx  %l2, 0x1d, %l3
  or    %l1, %l3, %l1
  cmp   %l0, %l1
  bne   test_fail
  nop

read_l2_data_diag_again:
  ldx   [%g5], %l0
  ! Contents should not change
  cmp   %l0, %g6
  bne   %xcc, test_fail
  nop

  ! Check if a Corrected ECC Trap happened
  setx  EXECUTED, %l1, %l0
  cmp   %o2, %l0
  bne   test_fail
  nop
  mov   TT_Corrected_ECC, %l0
  cmp   %o3, %l0
  bne   test_fail
  nop

  ba    test_pass
  nop

sub_dtlb_write:

  setx  dtlb_entry, %l1, %l2
  ldda  [%l2] ASI_NUCLEUS_QUAD_LDD, %l4  ! Load the entry to write into dtlb

  mov   VA_ASI_DTLB_TAG_ACCESS, %l6
  mov   DTLB_POSITION, %l7
  sllx  %l7, 0x3, %l7

  stxa  %l4, [%l6] ASI_DMMU      ! Tag portion
  stxa  %l5, [%l7] ASI_DTLB_DATA_ACCESS

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

dtlb_entry:
  ! First word: Tag Access (Note: [12:0] context)
  ! Second word: Data Access TTE
  .xword  0x0000000020018044,  0x8000001130018023

