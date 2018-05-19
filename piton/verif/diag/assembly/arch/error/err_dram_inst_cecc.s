// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: err_dram_inst_cecc.s
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

#define  L2_ENTRY_PA        0x1170000000
#define  L2_BANK_ADDR       0x0
#define  DRAM_CHANNEL_ADDR  0x0
#define  L2_ES_W1C_VALUE    0xc03ffff800000000
#define  DRAM_ES_W1C_VALUE  0xfe00000000000000

main:

  clr   %g7

#ifdef  RUN_TH1
  mov   0x1, %g7
#endif
#ifdef  RUN_TH2
  mov   0x2, %g7
#endif
#ifdef  RUN_TH3
  mov   0x3, %g7
#endif

  ta    %icc, T_RD_THID
  cmp   %o1, %g7
  bne   test_pass
  nop

  ! Boot code does not provide TLB translation for IO address space
  ta    T_CHANGE_HPRIV

  setx  L2_ENTRY_PA, %l0, %g1
  add   %g1, L2_BANK_ADDR, %g1
  set   DRAM_CHANNEL_ADDR, %g2
  setx  DRAM_ES_W1C_VALUE, %l0, %g4
  setx  DRAM_ES_PA, %l0, %g5
  add   %g5, %g2, %g5
  setx  DRAM_EI_PA, %l0, %g6
  add   %g6, %g2, %g6

  ! Clear DRAM Error status register (Bit[63:57] write-1-clear)
  stx   %g4, [%g5]

disable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the lower 2 bits (I-Cache and D-Cache enables)
  andn  %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

disable_l2:
  setx  L2CS_PA1, %l1, %l0
  mov   0x1, %l2
  stx   %l2, [%l0+L2_BANK_ADDR]

  ! Write 1 to clear L2 Error status registers
  setx  L2ES_PA1, %l3, %l4
  add   %l4, L2_BANK_ADDR, %l4
  setx  L2_ES_W1C_VALUE, %l0, %l1

clear_l2_ESR:
  stx   %l1, [%l4]
  nop

  mov   0x20, %l1               ! ECC Mask (1-bit error)
  mov   0x1, %l2
  sllx  %l2, DRAM_EI_SSHOT, %l3
  or    %l1, %l3, %l1           ! Set single shot
  sllx  %l2, DRAM_EI_ENB, %l3
  or    %l1, %l3, %l1           ! Enable error injection for the next write
set_DRAM_error_inject:
  stx   %l1, [%g6]
  
read_DRAM_error_inject:
  ldx   [%g6], %l2
  cmp   %l1, %l2
  bne   read_DRAM_error_inject

  ldx   [%g6], %l0

store_error:
  set   0x01000000, %l0
  st    %l0, [%g1]

enable_l2:
  setx  L2CS_PA0, %l1, %l0
  sllx  %g7, 15, %l1                   ! Set error steering thread
  stx   %l1, [%l0+L2_BANK_ADDR]

enable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  or    %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

error_address:
  call  %g1
  save
  
  ! Compute expected value of DRAM error status register
  mov   0x1, %l1
  sllx  %l1, DRAM_ES_DAC, %l0
  ! Due to DDR design, a single shot for one clock cycle results in errors for two 16-Byte chunks
!note: ECO 6668 (bug 5512) fixed, SEC now, not MEC
!  sllx  %l1, DRAM_ES_MEC, %l3
!  or    %l0, %l3, %l0
  set   0x200, %l3               ! 16-bit Syndrome - for SECC, it's the mask nibble-reversed
  or    %l0, %l3, %l0            ! %l0 has expected value

check_DRAM_ESR:
  ldx   [%g5], %l1

  cmp   %l0, %l1
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

  ! Compute expected value of L2 error status register
  mov   0x1, %l1
  sllx  %l1, L2ES_DAC, %l0
  sllx  %l1, L2ES_VEC, %l3
  or    %l0, %l3, %l0
!note: ECO 6668 (bug 5512) fixed, SEC now, not MEC
!  sllx  %l1, L2ES_MEC, %l3
!  or    %l0, %l3, %l0
  sllx  %g7, L2ES_TID, %l3       ! ID of thread that encountered error
  or    %l0, %l3, %l0            ! %l0 has expected value

  setx  L2ES_PA1, %l2, %l3
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

.data

test_inst:
  .word  0x01000000      ! nop
  .word  0x81c7e008      ! ret
  .word  0x81e80000      ! restore
  .word  0x01000000      ! nop
  .word  0x01000000
  .word  0x01000000
  .word  0x01000000
  .word  0x01000000

  .word  0x01000000      ! nop
  .word  0x81c7e008      ! ret
  .word  0x81e80000      ! restore
  .word  0x01000000      ! nop
  .word  0x01000000
  .word  0x01000000
  .word  0x01000000
  .word  0x01000000

