// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: err_dram_rdd_dacc.s
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

#define H_HT0_Reserved_0x78 My_Data_Error_Trap

#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text
.global  main
.global  My_Data_Error_Trap

#include "err_defines.h"

! Use the starting PA of the data section
#define  L2_ENTRY_PA        0x1170000000
#define  L2_BANK_ADDR       0x40
#define  DRAM_CHANNEL_ADDR  0x1000
#define  L2_ES_W1C_VALUE    0xc03ffff800000000
#define  DRAM_ES_W1C_VALUE  0xfe00000000000000

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
  set   DRAM_CHANNEL_ADDR, %g2
  setx  DRAM_ES_W1C_VALUE, %l0, %g3
  setx  L2ES_PA0, %l0, %g4
  add   %g4, L2_BANK_ADDR, %g4
  setx  DRAM_ES_PA, %l0, %g5
  add   %g5, %g2, %g5
  setx  DRAM_EI_PA, %l0, %g6
  add   %g6, %g2, %g6
  setx  L2CS_PA0, %l0, %g7
  add   %g7, L2_BANK_ADDR, %g7

clear_DRAM_ESR:
  stx   %g3, [%g5]

disable_l1_dcache:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  ! Remove the Bit 2
  andn  %l0, 0x2, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

disable_l2:
  ldx   [%g7], %l0
  or    %l0, 0x1, %l0
  stx   %l0, [%g7]

  ! Write 1 to clear L2 Error status registers
  setx  L2_ES_W1C_VALUE, %l0, %l1
clear_l2_ESR:
  stx   %l1, [%g4]
  nop

  mov   0x22, %l1               ! ECC Mask (must be at different nibbles)
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

store_with_error:
  set   0x38, %l7
  stx   %l7, [%g1+%l7]

enable_l2:
  ldx   [%g7], %l0
  andn  %l0, 0x1, %l0
  sllx  %o7, 15, %l1              ! Set error steering thread
  or    %l0, %l1, %l0
  stx   %l0, [%g7]

enable_l1_dcache:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  or    %l0, 0x2, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

start_DMA_read:
  set   1, %l0
  setx  0xcf00beef00, %l1, %l2  ! Address to start sjm_4 (see sjm_4.cmd)
  stx   %l0, [%l2]

  ! Compute expected value of DRAM error status register
  mov   0x1, %l1
  sllx  %l1, DRAM_ES_DAU, %l0
  ! Due to DDR design, a single shot for one clock cycle results in errors for two 16-Byte chunks
//note: EUO 6668 (bug 5512) is fixed, SEU now instead of MEU
//  sllx  %l1, DRAM_ES_MEU, %l3
//  or    %l0, %l3, %l0            ! %l0 has expected value (not checking syndrome)

  set   11, %l6
  clr   %l7
check_DRAM_ESR_loop:
  inc   %l7
  cmp   %l7, %l6
  be    test_fail
  nop
  ldx   [%g5], %l1
  brz   %l1, check_DRAM_ESR_loop
  nop

  ! Read again - MEU bit might come out later
  ldx   [%g5], %l1
  set   0xffff, %l2
  andn  %l1, %l2, %l1 
  cmp   %l0, %l1
  bne   %xcc, test_fail
  nop

  ! Compute expected value of L2 error status register
  mov   0x1, %l1
  sllx  %l1, L2ES_DRU, %l0
  sllx  %l1, L2ES_VEU, %l3
  or    %l0, %l3, %l0
//note: EUO 6668 (bug 5512) is fixed, SEU now instead of MEU
//further note, for DMA access, it read 4Bytes a time, thus
//              it is a SEU for DRAM, but, still MEU for L2
//              since DRAM has injected error to 16B chunk.
  sllx  %l1, L2ES_MEU, %l3
  or    %l0, %l3, %l0            ! %l0 has expected value
  ! Syndrome field not set for DRU

  clr   %l7
check_l2_ESR_loop:
  inc   %l7
  cmp   %l7, %l6
  be    test_fail
  nop
  ldx   [%g4], %l4
  brz   %l4, check_l2_ESR_loop
  nop

  cmp   %l4, %l0
  bne   %xcc, test_fail
  nop

  /* The following load is just to "force out" the CPX ERR packet.
     It must miss the same bank that's to report the ERR packer.   */

  add   %g1, 0x100, %l2
  ldx   [%l2], %l3
 
  setx  L2EA_PA0, %l2, %l3
  add   %l3, L2_BANK_ADDR, %l3
check_l2_EAR:
  ldx   [%l3], %l4

  ! Error address is the physical address of the cache line (PA[5:0] 0)
  andn  %g1, 0x3f, %l1
  cmp   %l4, %l1
  bne   %xcc, test_fail
  nop

  ! Check if a Data_Error_Trap happened
  setx  EXECUTED, %l1, %l0
  cmp   %o2, %l0
  bne   test_fail
  nop
  mov   TT_Data_Error, %l0
  cmp   %o3, %l0
  bne   test_fail
  nop

  ba    test_pass
  nop

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

.data

! Bank 0
  .xword  0x0000000000000000
  .xword  0x0000000000000008
  .xword  0x0000000000000010
  .xword  0x0000000000000018
  .xword  0x0000000000000020
  .xword  0x0000000000000028
  .xword  0x0000000000000030
  .xword  0x0000000000000038

! Bank 1
  .xword  0x0000000000000000
  .xword  0x0000000000000008
  .xword  0x0000000000000010
  .xword  0x0000000000000018
  .xword  0x0000000000000020
  .xword  0x0000000000000028
  .xword  0x0000000000000030
  .xword  0x0000000000000038

! Bank 2
  .xword  0x0000000000000000
  .xword  0x0000000000000008
  .xword  0x0000000000000010
  .xword  0x0000000000000018
  .xword  0x0000000000000020
  .xword  0x0000000000000028
  .xword  0x0000000000000030
  .xword  0x0000000000000038

! Bank 3
  .xword  0x0000000000000000
  .xword  0x0000000000000008
  .xword  0x0000000000000010
  .xword  0x0000000000000018
  .xword  0x0000000000000020
  .xword  0x0000000000000028
  .xword  0x0000000000000030
  .xword  0x0000000000000038

! Bank 0
  .xword  0x0000000000000000
  .xword  0x0000000000000008
  .xword  0x0000000000000010
  .xword  0x0000000000000018
  .xword  0x0000000000000020
  .xword  0x0000000000000028
  .xword  0x0000000000000030
  .xword  0x0000000000000038

! Bank 1
  .xword  0x0000000000000000
  .xword  0x0000000000000008
  .xword  0x0000000000000010
  .xword  0x0000000000000018
  .xword  0x0000000000000020
  .xword  0x0000000000000028
  .xword  0x0000000000000030
  .xword  0x0000000000000038

