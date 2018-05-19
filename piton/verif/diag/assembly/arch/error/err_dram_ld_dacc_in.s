// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: err_dram_ld_dacc_in.s
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
#define H_HT0_Reserved_0x78 My_Data_Error_Trap

#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text
.global  main
.global  My_Data_Access_Error_Trap
.global  My_Data_Error_Trap

#include "err_defines.h"

#define  L2_ENTRY_PA        0x300770030
#define  L2_BANK_ADDR       0xc0
#define  DRAM_CHANNEL_ADDR  0x3000
#define  TEST_DATA0         0x1000100081c3e008
#define  TEST_DATA1         0x2000200081c3e008
#define  L2_ES_W1C_VALUE    0xc03ffff800000000
#define  DRAM_ES_W1C_VALUE  0xfe00000000000000
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
  add   %g1, L2_BANK_ADDR, %g1                  ! %g1 --- 0x300700f0 error address
  set   DRAM_CHANNEL_ADDR, %g2
  setx  TEST_DATA0, %l0, %g3
  setx  DRAM_ES_W1C_VALUE, %l0, %g4
  setx  DRAM_ES_PA, %l0, %g5
  add   %g5, %g2, %g5
  setx  L2ES_PA0, %l0, %g6
  add   %g6, L2_BANK_ADDR, %g6
  clr   %g7                     ! use %g7 as a loop counter

disable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the lower 2 bits (I-Cache and D-Cache enables)
  andn  %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

disable_l2:
  setx  L2CS_PA1, %l1, %l0
  mov   0x1, %l2
  stx   %l2, [%l0+L2_BANK_ADDR]

store_first_8_bytes:
  stx   %g3, [%g1]              ! 0x300700f0

  mov   0x22, %l1               ! ECC Mask (2-bit error)
  mov   0x1, %l2
  sllx  %l2, DRAM_EI_SSHOT, %l3
  or    %l1, %l3, %l1           ! Set single shot
  sllx  %l2, DRAM_EI_ENB, %l3
  or    %l1, %l3, %l1           ! Enable error injection for the next write
set_DRAM_error_inject:
  setx  DRAM_EI_PA, %l0, %l2
  add   %l2, %g2, %l2
  stx   %l1, [%l2]

read_DRAM_error_inject:
  ldx   [%l2], %l3
  cmp   %l1, %l3
  bne   read_DRAM_error_inject
  
store_second_8_bytes:
  setx  TEST_DATA1, %l2, %l1
  stx   %l1, [%g1+8]            ! 0x300700f8 <--- error injected from dram
                                ! MECC on 0x300700c0

clear_all_status_registers:
  ! Clear DRAM Error status register
  stx   %g4, [%g5]

  ! Clear L2 Error Status register
  setx  L2_ES_W1C_VALUE, %l0, %l1
  stx   %l1, [%g6]

  ! Clear Sparc Error Status register
  set   SPARC_ES_W1C_VALUE, %l0
  stxa  %l0, [%g0] ASI_SES

  ! Wait for IOB latency (this is necessary in ciop environment)
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop

  ! For the second time, skip to error_address
  brnz  %g7, error_address
  nop

enable_l2:
  setx  L2CS_PA0, %l1, %l0
  sllx  %o7, 15, %l1              ! Set error steering thread
  stx   %l1, [%l0+L2_BANK_ADDR]

enable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  or    %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

error_address:
  ldx   [%g1], %l1              ! 0x300700f0 
  sub   %g1, 0x10, %l0            
!  ldx   [%l0], %l1              ! 0x300700e0 
  sub   %l0, 0x10, %l0            
!  ldx   [%l0], %l1              ! 0x300700d0   
  sub   %l0, 0x10, %l0
  ldx   [%l0], %l1              ! 0x300700c0  (real error addr)

  ! For the second time, skip to second_round
  brnz  %g7, check_DRAM_ESR_again
  nop

  ! Compute expected value of DRAM error status register
  mov   0x1, %l6
  sllx  %l6, DRAM_ES_DAU, %l7
  ! Due to DDR design, a single shot for one clock cycle results in errors for two 16-Byte chunks
  ! This also implies that a disrupting 0x78 trap will follow a 0x32 precise trap
  ! with ECO 6668 (bug 5512) single shot bug fixed, MEU bit shoult not be asserted
  !sllx  %l6, DRAM_ES_MEU, %l5
  !or    %l7, %l5, %l7

  sllx  %l6, DRAM_ES_MEU, %l6
  or    %l6, %l5, %l6

  nop; nop; nop; nop;
  nop; nop; nop; nop;
  nop; nop; nop; nop;
  nop; nop; nop; nop;
  nop; nop; nop; nop;
  nop; nop; nop; nop;

check_DRAM_ESR:
  ldx   [%g5], %l6

  ! Not checking syndrome because it varies with environment timing (e.g. different in cmp and ciop)
  set   0xffff, %l0
  andn  %l6, %l0, %l6
  cmp   %l6, %l7
  bne   %xcc, test_fail
  nop

  ! Check if a precise Data Access Error Trap happened
  set   EXECUTED, %l0
  cmp   %o0, %l0
  bne   test_fail
  nop
  mov   TT_Data_Access_Error, %l0
  cmp   %o1, %l0
  bne   test_fail
  nop

  ! Check if a disrupting Data Error Trap happened
  set   EXECUTED, %l0
  cmp   %o2, %l0
  bne   test_fail
  nop
  mov   TT_Data_Error, %l0
  cmp   %o3, %l0
  bne   test_fail
  nop

check_l2_ESR:
  ldx   [%g6], %l4

  ! Compute expected value of L2 error status register
  mov   0x1, %l1
  sllx  %l1, L2ES_DAU, %l0
  sllx  %l1, L2ES_VEU, %l3       ! VEC (any valid CE) not in PRM, but set by RTL
  or    %l0, %l3, %l0
!note: Even with ECO 6668 (bug 5512) fixes, still MEU
!      this is due to bug 5513 which is "wont fix"
  sllx  %l1, L2ES_MEU, %l3
  or    %l0, %l3, %l0
  sllx  %o7, L2ES_TID, %l3       ! ID of thread that encountered error
  or    %l0, %l3, %l0            ! %l0 has expected value

  cmp   %l4, %l0
  bne   %xcc, test_fail
  nop

  setx  L2EA_PA0, %l2, %l3
  add   %l3, L2_BANK_ADDR, %l3
check_l2_EAR:
  ldx   [%l3], %l4

  ! Error address is the physical address of the cache line
! 39:6 for DAU and LDAU
  setx  0xffffffffffffffc0, %l1,%l0
  and   %l0, %g1, %l1 
  and   %l0, %l4, %l3
!  cmp   %l4, %g1
  cmp   %l1, %l3
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
  cmp   %l0, %g1                        ! 0x300700f0
  be    %xcc, done_check_sparc_err_addr
  nop

  sub   %g1, 0x10, %l1                  ! 0x300700e0
  cmp   %l0, %l1
  be    %xcc, done_check_sparc_err_addr
  nop

  sub   %l1, 0x10, %l1                  ! 0x300700d0
  cmp   %l0, %l1
  be    %xcc, done_check_sparc_err_addr
  nop

  sub   %l1, 0x10, %l1                  ! 0x300700c0
  cmp   %l0, %l1
  bne   %xcc, test_fail
  nop

done_check_sparc_err_addr:

  ! Disable L2 error reporting to Sparc
  setx  L2EE_PA0, %l0, %l1
  add   %l1, L2_BANK_ADDR, %l1
  stx   %g0, [%l1]
  ! Disable traps on errors
  stxa  %g0, [%g0] ASI_SEE

  ! Clear all ESR's and load the same address again
  inc   %g7
  ba    clear_all_status_registers
  nop

check_DRAM_ESR_again:
  ! DRAM ESR should be zero
  ldx   [%g5], %l6
  brnz  %l6, test_fail
  nop

  ! L2 ESR should have LDAU set (not DAU any more)
  mov   0x1, %l1
  sllx  %l1, L2ES_LDAU, %l0
  sllx  %l1, L2ES_VEU, %l3       ! VEC (any valid CE) not in PRM, but set by RTL
  or    %l0, %l3, %l0
  sllx  %o7, L2ES_TID, %l3       ! ID of thread that encountered error
  or    %l0, %l3, %l0

check_L2_ESR_again:
  ldx   [%g6], %l4
  ! Not checking SYND field in this test
  set   0xffffffff, %l1
  andn  %l4, %l1, %l4
  cmp   %l4, %l0
  bne   %xcc, test_fail
  nop

  ! Sparc ESR should have DDC set
  set   SES_INIT_VALUE, %l1
  mov   0x1, %l2
  sllx  %l2, SES_DDC, %l3
  or    %l1, %l3, %l1
  mov   0x1, %l2
  sllx  %l2, 0x1d, %l3
  or    %l1, %l3, %l1
check_Sparc_ESR_again:
  ldxa  [%g0] ASI_SES, %l0
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
  ! precise trap
  done

My_Data_Error_Trap:
  ! Signal trap taken
  set   EXECUTED, %o2
  ! save trap type value
  rdpr  %tt, %o3
  ! disrupting trap
  retry

/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP

