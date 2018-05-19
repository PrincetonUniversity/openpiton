// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mulerr_irfue_icache_tag_ce.s
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

#define H_HT0_Internal_Processor_Error_0x29 My_Internal_Processor_Error_Trap
#define H_HT0_Corrected_ECC_error_0x63 My_Corrected_ECC_error_trap

#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text
.global  main
.global  My_Internal_Processor_Error_Trap 
.global  My_Corrected_ECC_error_trap

! This address [11:5] will create a cache set of 0x2e (46).
! This is chosen emperically to make it remain in the cache until the end of the diag.
! When the diag code changes, this might fail the test...
#define  ITLB_ENTRY_VA    0x200065c0
#define  ITLB_ENTRY_PA    0x11300065c0

#define  ICACHE_WAY  1
#define  ITLB_ERRINJ_ENTRY  4

#include "err_defines.h"

main:

  ta    T_CHANGE_HPRIV

  ! Sparc Error Injection Register should power up 0
  ldxa  [%g0] ASI_SEI, %l1
  cmp   %l1, 0
  bne   test_fail
  nop

  ! Sparc Error Status Register powers up X - Write 1 on each bit to clear
  setx  0xefffffff, %l1, %l2
  stxa  %l2, [%g0] ASI_SES
  ldxa  [%g0] ASI_SES, %l1
  setx  SES_INIT_VALUE, %l3, %l2
  cmp   %l1, %l2
  bne   test_fail
  nop

  ! Enable traps on un-correctable Sparc errors
  call  sub_set_see_nceen
  save

  ! Enable disruting Corrected ECC Trap
  call  sub_set_see_ceen
  save

  ! Error Injection Code Below

  ! Set 2-bit XOR in Sparc Error Injection ECC Mask
  ldxa  [%g0] ASI_SEI, %l1
  mov   0x14, %l2
  or    %l1, %l2, %l1
  stxa  %l1, [%g0] ASI_SEI

  ! Set Single Shot
  call  sub_set_sei_sshot
  save

  ! Set IRF ECC error injection bit
  mov   SEI_IRF, %o0
  call  sub_inject_sei_error
  save

  ! Enable Error Injection
  call  sub_set_sei_en
  save

  ! This will update IRF with ECC Mask
  mov   %g0, %g6

  ! Make sure data will be read from the resigter file; otherwise %g6 result is by-passed.
  ! Note that %g6 is not windowed, so writing to %cwp would work.
  wrpr  %g0, %cwp

  inc   %g6

  ! An Internal Processor Error Trap should happen here
  setx  EXECUTED, %l1, %l0
  cmp   %o0, %l0
  bne   test_fail
  mov   TT_Internal_Processor_Error, %l0
  cmp   %o1, %l0
  bne   test_fail

  ! Check Sparc Error Status Register
  mov   0x1, %o0   ! (MEU, MEC, PRIV)
  mov   SES_IRU, %o1
  call  sub_check_sparc_error_status
  save

  ! Check Sparc Error Address Register
  ! Check only IRF Index for now; Syndrome later
  mov   0x6, %o0           ! %g6 at Index 6
  sllx  %o0, 4, %o0        ! IRF Index at [11:4]
  mov   0x14, %l0          ! ECC Syndrome - double error at bit 3 and 4
  sllx  %l0, 16, %l0       ! Syndrome at [23:16]
  or    %o0, %l0, %o0
  setx  0xff0ff0, %l1, %o1 ! Mask
  call  sub_check_sparc_error_address
  save


  ! I$ Tag parity Error Injection Code Below

  call  sub_itlb_write
  save

  ! Store my test instructions into memory (to test forced I-Cache fill on parity error)

  setx   ITLB_ENTRY_PA, %l0, %g1 ! Store to PA (in Hypervisor mode now)
  setx   test_inst, %l0, %g2     ! Location where test instructions reside

  ! Perform the store - in a loop for 8 instructions
  mov    8, %l0           ! Loop count
  mov    0, %l1           ! Loop iterator

store_loop:
  sllx   %l1, 2, %l2      ! Advance addresses by 4

  add    %g1, %l2, %l3    ! %l3 now has the current address
  add    %g2, %l2, %l4    ! %l4 now has the location for current instruction
  ld     [%l4], %l5       ! %l5 now has the instruction

  ! store
  stw    %l5, [%l3]
 inc    %l1
  cmp    %l0, %l1
  bne    store_loop
  nop


 ! Write I-cache tag with error
  mov   1, %o5
  call  sub_icache_tag_write
  save

  ! Write I-cache Instr without error
  mov   0, %o5
  call  sub_icache_instr_write
  save

  ta    T_CHANGE_NONHPRIV

 setx  ITLB_ENTRY_VA, %l0, %l1
error_address:
  call  %l1
  save

  ! The call should cause an I-Cache tag parity errir being detected.
  ! A cache fill will allow the call to complete and return.
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

  ta    T_CHANGE_HPRIV

  ! Check Sparc Error Status Register, The MEC bit should be set, the previous error should retained
  mov   0x3, %o0   ! (MEU, MEC, PRIV)
  mov   SES_IRU, %o1
  call  sub_check_sparc_error_status
  save

  ! Check Sparc Error Address Register, The previous error should be retained
  mov   0x6, %o0           ! %g6 at Index 6
  sllx  %o0, 4, %o0        ! IRF Index at [11:4]
  mov   0x14, %l0          ! ECC Syndrome - double error at bit 3 and 4
  sllx  %l0, 16, %l0       ! Syndrome at [23:16]
  or    %o0, %l0, %o0
  setx  0xff0ff0, %l1, %o1 ! Mask
  call  sub_check_sparc_error_address
  save

  ba    test_pass
  nop

#include "err_subroutines.s"

My_Internal_Processor_Error_Trap:
  ! Signal trap taken
  setx  EXECUTED, %l0, %o0
  ! save trap type value
  rdpr  %tt, %o1
  done

My_Corrected_ECC_error_trap:
  ! Signal trap taken
  setx  EXECUTED, %l0, %o0
  ! save trap type value
  rdpr  %tt, %o1
  done

sub_itlb_write:

  setx  itlb_entry, %l1, %l2
  ldda  [%l2] ASI_NUCLEUS_QUAD_LDD, %l4  ! Load the entry to write into itlb

  mov   VA_ASI_ITLB_TAG_ACCESS, %l6
  mov   ITLB_ERRINJ_ENTRY, %l7
  sllx  %l7, 0x3, %l7

  stxa  %l4, [%l6] ASI_IMMU      ! Tag portion
  stxa  %l5, [%l7] ASI_ITLB_DATA_ACCESS

  ret
  restore


sub_icache_tag_write:

  ! PA: [39:12] Tag, [11:5] 128 sets, [4:2] 8 words, [1:0] always 0 (4-byte word addressing)

  ! Generate write data
  ! Write data: [34] valid, [32] parity, [27:0] - [39:12] of PA
  setx  ITLB_ENTRY_PA, %l0, %l1
  srlx  %l1, 12, %l1            ! 39:12 will go to [27:0]
  mov   0x1, %l2                ! Valid bit
  sllx  %l2, 34, %l2            ! Valid bit shifted to [34]
  or    %l1, %l2, %l1           ! This has the preliminary tag to be written

  ! Determine if parity is to be flipped
  ! %i5 has the subroutine argument to determine if parity is to be flipped
  sllx    %i5, 32, %i5          ! [32] is parity bit

  or      %l1, %i5, %l6         ! %l6 has final data for the tag write
 
  ! Generate write address
  ! Write address: [17:16] Way, [12:6] Cache set
  setx  ITLB_ENTRY_PA, %l0, %l1
  setx  0xfe0, %l0, %l2         ! Mask for extracting [11:5] of PA (set)
  and   %l1, %l2, %l1
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
  or     %l1, %l2, %g6          ! Don't touch %g6 - to be filled with instruction

  ! Generate write address
  ! Write address: [17:16] Way, [12:6] Cache set, [5:3] selects 1 of 8 instructions, [2:0] 0s

  setx   ITLB_ENTRY_PA, %l0, %l1
  setx   0xffc, %l0, %l2        ! Mask for extracting [11:2]
  and    %l1, %l2, %l1
  sllx   %l1, 0x1, %l1          ! Now we have [11:2] of PA at [12:3]
  mov    ICACHE_WAY, %l2
  sllx   %l2, 16, %l2           ! Position Way
  or     %l1, %l2, %g7          ! Don't touch %g7 - has final base address for the icache_instr write

  ! Read from test inst
  setx   test_inst, %l0, %g1    ! Don't touch %g1 - has base address to load instructions from

  ! Perform the diag write - in a loop for 8 instructions
  mov    8, %l2           ! Loop count
  mov    0, %l3           ! Loop iterator

icache_data_write_loop:
  sllx   %l3, 3, %l4      ! Set [5:3] of the address
  sllx   %l3, 2, %l5      ! For loading instruction

  add    %g1, %l5, %l0
  ld     [%l0], %l0       ! %l0 has the instruction
  or     %g6, %l0, %l0    ! %l0 has the final write data

  or     %g7, %l4, %l1    ! %l1 has final write address

  ! This updates the data
  stxa   %l0, [%l1] ASI_ICACHE_INSTR
  inc    %l3
  cmp    %l3, %l2
  bne    icache_data_write_loop
  nop

  ret
  restore


/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta	T_GOOD_TRAP

test_fail:
ta	T_BAD_TRAP

.data

itlb_entry:
  ! First word: Tag Access (Note: [12:0] context)
  ! Second word: Data Access TTE
  .xword  0x0000000020006044,  0x8000001130006023


.align 8192

test_inst:
  .word  0x01000000      ! nop
  .word  0x81c7e008      ! ret
  .word  0x81e80000      ! restore
  .word  0x01000000
  .word  0xdeadbeef      ! junk - should not reach this
  .word  0x81e80000      ! restore
  .word  0x01000000
  .word  0x01000000

