// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: err_multierr_diag1.s
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

#define H_HT0_Instruction_access_error_0x0a My_Instruction_Access_Error_Trap
#define H_HT0_Corrected_ECC_error_0x63 My_Corrected_ECC_error_trap

#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text
.global  main
.global  My_Instruction_Access_Error_Trap
.global  My_Corrected_ECC_error_trap 

#include "err_defines.h"

#define  ICACHE_WAY         2
#define  L2_ENTRY_PA        0x1350014520
#define  L2_BANK_ADDR       0xc0
#define  L2_ES_W1C_VALUE    0xc03ffff800000000
#define  SPARC_ES_W1C_VALUE 0xefffffff
#define  INST_NOP           0x01000000
#define  INST_RET           0x81c7e008
#define  INST_RESTORE       0x81e80000

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
  setx  L2ES_PA1, %l0, %g2
  add   %g2, L2_BANK_ADDR, %g2
  setx  L2_ES_W1C_VALUE, %l0, %g4
  setx  L2CS_PA0, %l0, %g7
  add   %g7, L2_BANK_ADDR, %g7

  ! Clear Sparc Error Status register
  set   SPARC_ES_W1C_VALUE, %l0
  stxa  %l0, [%g0] ASI_SES

set_L2_Directly_Mapped_Mode:
  mov   0x2, %l0
  sllx  %g3, 15, %l1
  or    %l0, %l1, %l0
  stx   %l0, [%g7]
  
  set   INST_NOP, %l1
  set   INST_RET, %l2
  set   INST_RESTORE, %l3
  ! Store test data into memory
  st    %l1, [%g1]
  st    %l1, [%g1+0x4]
  st    %l2, [%g1+0x8]
  st    %l3, [%g1+0xc]

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

  ! Write I-cache tag without error
  mov   0, %o5
  call  sub_icache_tag_write
  save

  ! Write I-cache Instr with error
  mov   1, %o5
  call  sub_icache_instr_write
  save

error_address:
  call  %g1
  save

  ! Check if a Instruction Access Error Trap happened
  set   EXECUTED, %l0
  cmp   %o0, %l0
  bne   test_fail
  nop
  mov   TT_Instruction_Access_Error, %l0
  cmp   %o1, %l0
  bne   test_fail
  nop

  ! Compute expected value of L2 error status register
  mov   0x1, %l1
  sllx  %l1, L2ES_LDAU, %l7
  sllx  %l1, L2ES_VEU, %l3       ! VEU (any valid UE) not in PRM, but set by RTL
  or    %l7, %l3, %l7
  sllx  %l1, L2ES_MEU, %l3       ! multiple fetches will happen
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
  sllx  %l2, SES_IDC, %l3
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

sub_icache_tag_write:

  ! PA: [39:12] Tag, [11:5] 128 sets, [4:2] 8 words, [1:0] always 0 (4-byte word addressing)

  ! Generate write data
  ! Write data: [34] valid, [32] parity, [27:0] - [39:12] of PA
  srlx  %g1, 12, %l1            ! 39:12 will go to [27:0]
  mov   0x1, %l2                ! Valid bit
  sllx  %l2, 34, %l2            ! Valid bit shifted to [34]
  or    %l1, %l2, %l1           ! This has the preliminary tag to be written

  ! Determine if parity is to be flipped
  ! %i5 has the subroutine argument to determine if parity is to be flipped
  sllx    %i5, 32, %i5          ! [32] is parity bit

  or      %l1, %i5, %l6         ! %l6 has final data for the tag write
  
  ! Generate write address
  ! Write address: [17:16] Way, [12:6] Cache set
  setx  0xfe0, %l0, %l2         ! Mask for extracting [11:5] of PA (set)
  and   %g1, %l2, %l1
  sllx  %l1, 0x1, %l1           ! Now we have [11:5] of PA at [12:6]
  mov   ICACHE_WAY, %l2
  sllx  %l2, 16, %l2            ! Position Way
  or    %l1, %l2, %l7           ! %l7 has final address for the tag write

  ! Perform the tag write
  stxa  %l6, [%l7] ASI_ICACHE_TAG

  ret
  restore


sub_icache_instr_write:

  ! PA: [39:12] Tag, [11:5] 128 sets, [4:2] 8 words, [1:0] always 0 (4-byte word addressing)

  ! Generate write data
  ! Write data: [33] switch bit (ignored on writes), [32] parity, [31:0] instruction.
  ! %i5 has the subroutine argument to determine if parity is to be flipped
  mov    0x1, %l1
  sllx   %l1, 33, %l1           ! Switch bit, although it should be ignored on writes
  mov    %i5, %l2               ! Set parity error injection bit
  sllx   %l2, 32, %l2           ! Position parity error injection bit
  or     %l1, %l2, %l6          ! Don't touch %l6 - to be filled with instruction

  ! Generate write address
  ! Write address: [17:16] Way, [12:6] Cache set, [5:3] selects 1 of 8 instructions, [2:0] 0s

  setx   0xffc, %l0, %l2        ! Mask for extracting [11:2]
  and    %g1, %l2, %l1
  sllx   %l1, 0x1, %l1          ! Now we have [11:2] of PA at [12:3]
  mov    ICACHE_WAY, %l2
  sllx   %l2, 16, %l2           ! Position Way
  or     %l1, %l2, %l7          ! Don't touch %l7 - has final base address for the icache_instr write

  ! Generate write data
  set    INST_NOP, %l0
  or     %l6, %l0, %l0    ! %l0 has the final write data

  ! This updates the data
  stxa   %l0, [%l7] ASI_ICACHE_INSTR

  ret
  restore

My_Instruction_Access_Error_Trap:
  ! Disable L2 error reporting to Sparc (so that the test can continue)
  setx  L2EE_PA0, %l0, %l1
  add   %l1, L2_BANK_ADDR, %l1
  stx   %g0, [%l1]
  ! Signal trap taken
  set   EXECUTED, %i0
  ! save trap type value
  rdpr  %tt, %i1
  done

My_Corrected_ECC_error_trap:
  ! Signal trap taken
  setx  EXECUTED, %l0, %i2
  ! save trap type value
  rdpr  %tt, %i3
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
  .word  0x01000000      ! nop
  .word  0x81c7e008      ! ret
  .word  0x81e80000      ! restore
  .word  0x01000000
  .word  0x01000000
  .word  0x01000000
  .word  0x01000000

