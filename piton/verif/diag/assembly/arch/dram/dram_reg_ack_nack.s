// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: dram_reg_ack_nack.s
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
 * Name:    dram_reg_ack_nack.s
 * Date:    July 26, 2003
 *
 *  Description: Access to dram registers, both existant and non
 *               existant. 
 *
 *  This is a self checking test and also has a custom trap handler.
 *  The trap generated is checked by this trap handler.
 *
 **********************************************************************/

#define H_HT0_Data_access_error_0x32 My_Data_Access_Exception
#define TRAP_TYPE 0x32

#define MAIN_PAGE_HV_ALSO

#include "boot.s"

.text
.global main
.global My_Data_Access_Exception


main:

  ! Boot code does not provide TLB translation for IO address space
  ta    T_CHANGE_HPRIV

  setx 0x9700000000, %l0, %l1
  set  0x1ffff, %l3      ! Open Bank Max
  set  0x1000, %l5       ! next channel addition

  !set  0x1ffff, %l0, %l3      ! Open Bank Max
  !set  0x1000, %l0, %l5       ! next channel addition

  !set   0x4, %l0, %l4        ! loop count 4
  add    %g0, 0x4, %l4        ! loop count 4
loop01:


  ! Valid location read
  ! DRAM CAS Address Width
  ldx   [%l1], %l0
  cmp   %l0, 0xb
  bne   test_fail
  nop

  ! Read from an invalid location
  ldx   [%l1+0x308], %l0
  nop

  ! Expecting a trap here in the diag
  ! Check if a trap happens
  cmp  %o0, TRAP_TYPE
  bne   test_fail
  nop

  ! Read from a valid location
  ! DRAM CAS Latency
  ldx   [%l1+0x10], %l0
  cmp   %l0, 0x3
  bne   test_fail
  nop

  ! Write to an invalid location
  stx   %l3, [%l1+0x380]    ! reusing data from l3, dont care since NEA

  ! Expecting a trap here in the diag
  ! Check if a trap happens
  ! NO TRAP FOR WRITE, WRITES TO INVALID LOC SHOULD BE DROPPED
  !cmp  %o0, TRAP_TYPE
  !bne   test_fail
  !nop

  ! Read back
  ldx   [%l1+0x380], %l0
  nop

  ! Expecting a trap here in the diag
  ! Check if a trap happens
  cmp  %o0, TRAP_TYPE
  bne   test_fail
  nop

  ! Read from a valid location
  ! DRAM CAS Latency
  ldx   [%l1+0x28], %l0
  cmp   %l0, %l3
  bne   test_fail
  nop


  ! Second invalid valid combo
  ! Write to an invalid location
  sllx  %l5, 2, %l6   !  0x4000/0x5000/...
  add   %l1, %l6, %l6 !  0x9700004000
  stx   %l3, [%l6]    ! reusing data from l3, dont care since NEA

  ! Expecting a trap here in the diag
  ! Check if a trap happens
  ! NO TRAP FOR WRITE, WRITES TO INVALID LOC SHOULD BE DROPPED
  !cmp  %o0, TRAP_TYPE
  !bne   test_fail
  !nop

  ! Read back
  ldx   [%l6], %l0
  nop

  ! Expecting a trap here in the diag
  ! Check if a trap happens
  cmp  %o0, TRAP_TYPE
  bne   test_fail
  nop

  ! Valid location read
  ! DRAM CAS Address Width
  ldx   [%l1], %l0
  cmp   %l0, 0xb
  bne   test_fail
  nop


  ! Third invalid valid combo
  ! Write to an invalid location
  sllx  %l5, 16, %l6  !  0x10000000/0x20000000/...
  add   %l1, %l6, %l6 !  0x9710000000/..
  stx   %l3, [%l6]    ! reusing data from l3, dont care since NEA

  ! Expecting a trap here in the diag
  ! Check if a trap happens
  ! NO TRAP FOR WRITE, WRITES TO INVALID LOC SHOULD BE DROPPED
  !cmp  %o0, TRAP_TYPE
  !bne   test_fail
  !nop

  ! Read back
  ldx   [%l6], %l0
  nop

  ! Expecting a trap here in the diag
  ! Check if a trap happens
  cmp  %o0, TRAP_TYPE
  bne   test_fail
  nop

  ! Read from a valid location
  ! DRAM CAS Address Width
  ldx   [%l1], %l0
  cmp   %l0, 0xb
  bne   test_fail
  nop


  ! Fourth invalid valid combo
  ! Write to an invalid location
  sllx  %l5, 20, %l6  !  0x0100000000/0x0200000000/..
  add   %l1, %l6, %l6 !  0x9800000000 
  stx   %l3, [%l6]    ! reusing data from l3, dont care since NEA

  ! Expecting a trap here in the diag
  ! Check if a trap happens
  ! NO TRAP FOR WRITE, WRITES TO INVALID LOC SHOULD BE DROPPED
  !cmp  %o0, TRAP_TYPE
  !bne   test_fail
  !nop

  ! Read back
  ldx   [%l6], %l0
  nop

  ! Expecting a trap here in the diag
  ! Check if a trap happens
  cmp  %o0, TRAP_TYPE
  bne   test_fail
  nop

  ! Valid location read
  ! DRAM CAS Address Width
  ldx   [%l1], %l0
  cmp   %l0, 0xb
  bne   test_fail
  nop

  add   %l1, %l5, %l1        ! next channel

  deccc   %l4
  bne     loop01                                  ! repeat
  nop

  ba  test_pass   ! test passed if u are here
  nop


My_Data_Access_Exception:
  ! Read trap type register
  rdpr  %tt, %o0
  done


/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP

