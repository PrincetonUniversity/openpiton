// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: dram_secc_err_all.s
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
/***********************************************************************
 * Name:    dram_secc_err_all.s
 * Date:    July 24, 2003
 *
 *  Description:
 *    Dram test trying to inject SECC error and read the location back.
 *    The SECC error should be corrected and reported. 
 *
 *  This test is self checking , all possible ecc error injections
 *
 **********************************************************************/

#define H_HT0_Corrected_ECC_error_0x63 My_Corrected_ECC_error_trap
#define H_HT0_Reserved_0x78 My_Data_Access_Exception1
#define TRAP_TYPE 0x63
#define TRAP_TYPE_78 0x78


#define MAIN_PAGE_HV_ALSO

#include "boot.s"

#define  ASI_LSU_CONTROL  0x45
#define  L2CS_PA1         0xA900000000

.text
.global main
.global  My_Corrected_ECC_error_trap
.global My_Data_Access_Exception1


main:

  ! Boot code does not provide TLB translation for IO address space
  ta    T_CHANGE_HPRIV


  ! Now access L2 control and status registers

disable_l1:
 ldxa  [%g0] ASI_LSU_CONTROL, %l0
 ! Remove the lower 2 bits (I-Cache and D-Cache enables)
 andn  %l0, 0x3, %l0
 stxa  %l0, [%g0] ASI_LSU_CONTROL

disable_l2:
  setx  L2CS_PA1, %l1, %l0
  mov   0x1, %l2
  ! disable all banks
  stx   %l2, [%l0]
  stx   %l2, [%l0+0x40]
  stx   %l2, [%l0+0x80]
  stx   %l2, [%l0+0xc0]






  setx  0x9700000000, %l0, %l1  ! dram base address
  ! Clear the error registers
  setx  0xfe00000000000000, %l0, %l2
  stx   %l2, [%l1+0x280]

  ! Error location register
  setx  0x0000000000000000, %l0, %l2
  stx   %l2, [%l1+0x2a0]

  ! DRAM Err Injection Register, enable 
  ! cont. error with ecc mask , 0x000f, SECC
  setx  0x0000000080000001, %l0, %l7
  stx   %l7, [%l1+0x290]
  nop

  setx  0x1000, %l0, %l3        ! increment for checking
  setx  0x1010101010101010, %l0, %l4 ! data
  setx  0x6000000000000000, %l0, %l5 ! expected data from register
  add   %g0, 0xf, %l6            ! loop count 16 time
  add   %g0, 0x0, %g1            !  new location same channel
  add   %g0, 0x4, %g2            !  outer loop count
  add   %g0, 0x8, %g3            !  location
  add   %g0, 0x1, %g4            !  err injection register

!hack to check
!ba temp
!nop

loop_reg1 : 

  ! stores to bank0
  !mov     0, %l3
  stx     %l4, [%g1]
  ld      [%g1], %l0
  call      trap_check
  nop


  add    %l5,%l3, %l5

  !setx  0x9700000000, %l0, %l1


  ! Read the error status register
  !setx  0x2000000000001000, %l0, %l2
  ldx   [%l1+0x280], %l0
  cmp     %l0, %l5   ! Mult. SECC, SECC
  bne test_fail
  nop

  ! read error location register
  ldx   [%l1+0x2a0], %l0
  srlx    %l0, 32, %l0
  cmp     %l0, %g3   ! Error in ECC nibble 0
  bne test_fail
  nop


  !add   1, %l3, %l3        ! current count

  srlx  %l4,1,%l4          ! shift the data 

  !setx  0x0000000080000001, %l0, %l7
  add    %l7,%g4, %l7
  stx   %l7, [%l1+0x290]   ! increment err injecting nibble


  !setx  0x9700000000, %l0, %l1  ! dram base address
  ! Clear the error registers
  setx  0xfe00000000000000, %l0, %l2
  stx   %l2, [%l1+0x280]

  ! Error location register
  setx  0x0000000000000000, %l0, %l2
  stx   %l2, [%l1+0x2a0]

  ldx   [%l1+0x280], %l0  ! dummy load
  add    %g1,0x100, %g1


  deccc   %l6
  bne     loop_reg1          ! repeat till all ch done
  nop


!temp : 

  srl   %g3, 1, %g3             ! for error location
  sll   %g4, 4, %g4             ! for error injection register
  srlx  %l3, 4, %l3             ! increment for checking
  not   %l4
  setx  0x6000000000000000, %l0, %l5 ! expected data from register
  add   %g0, 0xf, %l6            ! loop count 16 time
  add   %g1, 0x100, %g1          !  new location same channel
  setx  0x0000000080000000, %l0, %l7


  !setx  0x9700000000, %l0, %l1  ! dram base address
  ! Clear the error registers
  setx  0xfe00000000000000, %l0, %l2
  stx   %l2, [%l1+0x280]

  ! Error location register
  setx  0x0000000000000000, %l0, %l2
  stx   %l2, [%l1+0x2a0]

  ! DRAM Err Injection Register, enable
  ! cont. error with ecc mask , 0x000f, SECC
  add   %l7,%g4, %l7      ! first bit in new nibble
  stx   %l7, [%l1+0x290]
  nop

  deccc   %g2
  bne     loop_reg1          ! repeat till all ch done
  nop






  ! DRAM Err Injection Register, clear
  setx  0x0000000000000000, %l0, %l2
  stx   %l2, [%l1+0x290]
  nop


! Enable the L2,L1.
! NOTE : the dram registers (error/etc) are affected
!        by this test and are not cleared

enable_l2:
  setx  L2CS_PA1, %l1, %l0
  stx   %g0, [%l0]
  stx   %g0, [%l0+0x40]
  stx   %g0, [%l0+0x80]
  stx   %g0, [%l0+0xc0]

enable_l1:
  ldxa  [%g0] ASI_LSU_CONTROL, %l0
  or    %l0, 0x3, %l0
  stxa  %l0, [%g0] ASI_LSU_CONTROL

  ba    test_pass
  nop

My_Corrected_ECC_error_trap:
  rdpr  %tt, %o0
  done

My_Data_Access_Exception1:
  ! Read trap type register, disruptive trap
  rdpr  %tt, %o0
  cmp  %o0, TRAP_TYPE_78
  bne   test_fail
  nop
  nop
  retry

trap_check : 
  nop
  nop  
  ! Expecting a trap here in the diag
  ! Check if a trap happens
  cmp  %o0, TRAP_TYPE
  bne   test_fail
  nop
  retl       ! return back
  nop  

/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP

.data 
 data_segment:

        .word   0x00112233
        .word   0x44556677
        .word   0x8899aabb
        .word   0xccddeeff
        .word   0x00112233
        .word   0x44556677
        .word   0x8899aabb
        .word   0xccddeeff

.align  128

.end


