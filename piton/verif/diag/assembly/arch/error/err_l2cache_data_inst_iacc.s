// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: err_l2cache_data_inst_iacc.s
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

#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text
.global  main
.global  My_Instruction_Access_Error_Trap

#include "err_defines.h"

#define  L2_ENTRY_PA      0x211590000
#define  L1_TAG_READ      0x500211590
! Note that L1_TAG_READ value needs to change with L2_ENTRY_PA
#define  L2_BANK_ADDR     0x80
#define  INST_NOP         0x01000000
#define  INST_RET         0x81c7e008
#define  INST_RESTORE     0x81e80000
#define  L2_ES_W1C_VALUE  0xc03ffff800000000

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

  ! Sparc Error Status Register powers up X - Write 1 on each bit to clear
  setx  0xefffffff, %l1, %l2
  stxa  %l2, [%g0] ASI_SES

  setx  L2_ENTRY_PA, %l0, %g1
  add   %g1, L2_BANK_ADDR, %g1
  setx  L2_ES_W1C_VALUE, %l0, %g4
  setx  INST_NOP, %l0, %l1
  setx  INST_RET, %l0, %l2
  setx  INST_RESTORE, %l0, %l3

  ! Store test data into memory
  st    %l1, [%g1]
  st    %l1, [%g1+0x4]
  st    %l2, [%g1+0x8]
  st    %l3, [%g1+0xc]

  ! Now access L2 control and status registers

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

clear_l2_ESR:
  stx   %g4, [%l4]
  nop

  ! Generate L2 VD Diag read address
  ! Addressing: [39:32] See PRM, [22] 1 for V/D, [17:8] set, [7:6] bank, [2:0] = 0
  setx  0x3ffc0, %l0, %l2       ! Mask for extracting [17:6]
  and   %g1, %l2, %l7

  mov   0xa7, %l0
  sllx  %l0, 32, %l0            ! Bits [39:32]
  or    %l7, %l0, %l7

  mov   0x1, %l0
  sllx  %l0, 22, %l0            ! Bit [22]
  or    %l7, %l0, %l7
 
read_l2_VD_diag:
  ldx   [%l7], %l6

  ! Now find out which way it is being stored
  setx  0xffffff, %l0, %l2      ! Mask for [23:0]
  and   %l6, %l2, %l6
  srlx  %l6, 12, %l6            ! Valid bits at [23:12]

  clr   %g2                     ! %g2 will store the "way"

  ! Direct comparison - avoid loops to save run time
  cmp   %l6, 0x1
  be    way_found
  nop

  inc   %g2
  cmp   %l6, 0x2
  be    way_found
  nop

  inc   %g2
  cmp   %l6, 0x4
  be    way_found
  nop

  inc   %g2
  cmp   %l6, 0x8
  be    way_found
  nop

  inc   %g2
  cmp   %l6, 0x10
  be    way_found
  nop

  inc   %g2
  cmp   %l6, 0x20
  be    way_found
  nop

  inc   %g2
  cmp   %l6, 0x40
  be    way_found
  nop

  inc   %g2
  cmp   %l6, 0x80
  be    way_found
  nop

  inc   %g2
  cmp   %l6, 0x100
  be    way_found
  nop

  inc   %g2
  cmp   %l6, 0x200
  be    way_found
  nop

  inc   %g2
  cmp   %l6, 0x400
  be    way_found
  nop

  inc   %g2
  cmp   %l6, 0x800
  bne   test_fail
  nop

way_found:
  ! Read L2 Data Diag - %g2 has the "way"
  ! Addressing: [39:32] See PRM, [22] odd/even word, [21:18] way, [17:8] set, [7:6] bank, [5:3] D-word, [2:0] = 0
  setx  0x3fff8, %l0, %l2       ! Mask for extracting [17:3]
  and   %g1, %l2, %g5

  sllx  %g2, 18, %l0            ! Position Way
  or    %g5, %l0, %g5

  mov   0x1, %l0
  sllx  %l0, 22, %l0            ! will be accessing the Odd word, which is the second NOP instruction
  or    %g5, %l0, %g5

  mov   0xa3, %l0
  sllx  %l0, 32, %l0            ! Bits [39:32]
  or    %g5, %l0, %g5           ! %g5 has L2 Data Diag addressing

read_l2_data_diag:
  ldx   [%g5], %g6

  ! Flip two bits
  xor   %g6, 0x180, %g6          ! save on %g6 for future reference
write_back_with_error:
  stx   %g6, [%g5]

enable_l2:
  setx  L2CS_PA0, %l1, %l0
  sllx  %g7, 15, %l1             ! set error steering thread
  stx   %l1, [%l0+L2_BANK_ADDR]

enable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  or    %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

error_address:
  ! This should cause L2 LDAU
  call  %g1
  save
  
  ! Check if precise Instruction Access Error Trap occured
  wrpr  1, %tl
  mov   TT_Instruction_Access_Error, %l0
  rdpr  %tt, %l1
  cmp   %l0, %l1
  bne   test_fail
  nop
  wrpr  0, %tl

  ! Read L1 I-Cache -- each instruction in the cache line should have a bad parity
  and   %g1, 0xfe0, %l0           ! Get set (PA[11:5])
  sllx  %l0, 1, %l0               ! %l0 has ASI_ICACHE_TAG/INSTR address for Way 0
  setx  L1_TAG_READ, %l2, %l1     ! %l1 has expected valid tag read value

read_Way0_ICache_tag:
  mov   %l0, %l2
  ldxa  [%l2] ASI_ICACHE_TAG, %l3
  cmp   %l3, %l1
  be    %xcc, read_ICache_instr
  nop

read_Way1_ICache_tag:
  mov   1, %l2
  sllx  %l2, 16, %l2
  or    %l0, %l2, %l2
  ldxa  [%l2] ASI_ICACHE_TAG, %l3
  cmp   %l3, %l1
  be    %xcc, read_ICache_instr
  nop

read_Way2_ICache_tag:
  mov   2, %l2
  sllx  %l2, 16, %l2
  or    %l0, %l2, %l2
  ldxa  [%l2] ASI_ICACHE_TAG, %l3
  cmp   %l3, %l1
  be    %xcc, read_ICache_instr
  nop

read_Way3_ICache_tag:
  mov   3, %l2
  sllx  %l2, 16, %l2
  or    %l0, %l2, %l2
  ldxa  [%l2] ASI_ICACHE_TAG, %l3
  cmp   %l3, %l1
  bne   %xcc, test_fail
  nop

read_ICache_instr:

  ! First NOP instruction with bad parity
  setx  0x001000000, %l1, %l0
  ldxa  [%l2] ASI_ICACHE_INSTR, %l1
  cmp   %l0, %l1
  bne   %xcc, test_fail
  nop

  ! Second NOP -- bits flipped, with bad parity
  setx  0x101000007, %l1, %l0
  add   %l2, 0x8, %l2
  ldxa  [%l2] ASI_ICACHE_INSTR, %l1
  cmp   %l0, %l1
  bne   %xcc, test_fail
  nop

  ! RET instruction, with switch bit and bad parity (parity includes switch bit)
  setx  0x381c7e008, %l1, %l0
  add   %l2, 0x8, %l2
  ldxa  [%l2] ASI_ICACHE_INSTR, %l1
  cmp   %l0, %l1
  bne   %xcc, test_fail
  nop

  ! RESTORE instruction, with switch bit and bad parity (parity includes switch bit)
  setx  0x281e80000, %l1, %l0
  add   %l2, 0x8, %l2
  ldxa  [%l2] ASI_ICACHE_INSTR, %l1
  cmp   %l0, %l1
  bne   %xcc, test_fail
  nop

  ! Compute expected value of L2 error status register
  mov   0x1, %l1
  sllx  %l1, L2ES_LDAU, %l0
  sllx  %l1, L2ES_VEU, %l3       ! VEC (any valid CE) not in PRM, but set by RTL
  or    %l0, %l3, %l0
  sllx  %l1, L2ES_MEU, %l3       ! Due to current IFU design, MEU will be set for sure
  or    %l0, %l3, %l0
  mov   0x6, %l1                 ! 7-bit Syndrome (for the error injected)
  sllx  %l1, 14, %l3             ! Syndrome for [95:64] at [20:14]
  or    %l0, %l3, %l0
  sllx  %g7, L2ES_TID, %l3       ! ID of thread that encountered error
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

  ! Check Sparc Error Status Register
  mov   0x7, %o0   ! (MEU, MEC, PRIV)
  mov   SES_LDAU, %o1
  call  sub_check_sparc_error_status
  save

  ! Check Sparc Error Address Register
  mov   %g1, %o0
  setx  0xfffffffff0, %l0, %o1  ! Mask (see PRM)
  and   %o0, %o1, %o0
  call  sub_check_sparc_error_address
  save

  ba    test_pass
  nop

#include "err_subroutines.s"

My_Instruction_Access_Error_Trap:
  ! Disable Sparc NCEEN
  ! Important note: need to disable Sparc NCEEN so that the ret/restore instructions can executed
  ! (even with bad parity set). When Sparc NCEEN is on, instructions are trashed.
  stxa  %g0, [%g0] ASI_SEE

  done

/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP

