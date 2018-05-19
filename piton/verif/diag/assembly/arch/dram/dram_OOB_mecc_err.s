// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: dram_OOB_mecc_err.s
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
 * Name:    dram_OOB_mecc_err.s
 * Date:    July 24, 2003
 *
 *  Description: Out of bound access, which would cause the MECC error
 *               and generate a trap.
 *
 *
 *  
 *
 **********************************************************************/
#define H_HT0_Data_access_error_0x32 My_Data_Access_Exception
#define H_HT0_Reserved_0x78 My_Data_Access_Exception1
#define TRAP_TYPE_32 0x32
#define TRAP_TYPE_78 0x78

#define MAIN_PAGE_HV_ALSO

#include "boot.s"
#include "my_intr_handlers.s"

.text
.global main
.global My_Data_Access_Exception
.global My_Data_Access_Exception1

#include "err_defines.h"

main:

  ! Boot code does not provide TLB translation for IO address space
  ta    T_CHANGE_HPRIV


  setx  0x9700000280, %l0, %l1
  setx  0xfe00000000000000, %l0, %l2
  setx  0x1000, %l0, %l6
  setx  0x72faf00000, %l0, %l3
  setx  0x0200000000000000, %l0, %l7   ! MECC error indication 0x280 dram reg

  ! wr 1 to clear the error status registers

  stx   %l2, [%l1]           ! channel 0
  add   %l1, %l6, %l0
  stx   %l2, [%l0]           ! channel 1
  add   %l0, %l6, %l0
  stx   %l2, [%l0]           ! channel 2
  add   %l0, %l6, %l0
  stx   %l2, [%l0]           ! channel 3


  add    %g0, 0x4, %l4        ! loop count 4

  ! read back the last written register
  ldx   [%l1], %l0
  ! wait
  nop; nop; nop; nop; nop; nop; nop;
  nop; nop; nop; nop; nop; nop; nop;
  nop; nop; nop; nop; nop; nop; nop;
  nop; nop; nop; nop; nop; nop; nop;

  mov    1, %l5
  sllx   %l5, 39, %l5        ! to mask bit 39 for 
  not    %l5

loop01:


  ldx   [%l3], %l0

  nop
  nop
  nop

  ! Expecting a trap here in the diag
  ! Check if a trap happens
  !cmp  %o0, TRAP_TYPE_32
  !bne   test_fail
  !nop

  ldx  [%l1], %l0
  ! UPDATE THIS
  cmp %l0, %l7
  bne test_fail

  sllx  %l3, 1, %l3           ! different OOB address
  add   %l3, 0x40, %l3        ! next channel for data access
  and   %l3, %l5, %l3         ! mask bit 39, to make sure its mem
  add   %l1, %l6, %l1         ! next channel, for register read

  deccc   %l4
  bne     loop01                                  ! repeat
  nop

  nop
  nop

  ba  test_pass   ! test passed if u are here
  nop

My_Data_Access_Exception:
  ! Read trap type register
  rdpr  %tt, %o0
  cmp  %o0, TRAP_TYPE_32
  bne   test_fail
  nop
  done

My_Data_Access_Exception1:
  ! Read trap type register, disruptive trap
  rdpr  %tt, %o0
  cmp  %o0, TRAP_TYPE_78
  bne   test_fail
  nop
  nop
  retry


/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
ta  T_GOOD_TRAP

test_fail:
ta  T_BAD_TRAP



