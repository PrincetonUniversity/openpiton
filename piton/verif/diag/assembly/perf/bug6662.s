// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug6662.s
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
#define THREAD_COUNT  32
#define THREAD_STRIDE 1
#include "boot.s"

.text
.global main
main:

th_fork(th_main)
th_main_0:

	setx th0_init_done, %o1, %o2
	mov 1, %o1
	stx  %o1, [%o2]

	
	mov 0, %l3
        setx l1_tlb_miss1, %l1, %l2
next_load0:
	stx  %o1, [%o2+0x00]
	stx  %o1, [%o2+0x40]
	stx  %o1, [%l2+%l3]
	stx  %o1, [%o2+0x80]
	stx  %o1, [%l2+%l3]
	stx  %o1, [%o2+0xc0]
        ldsw [%l2+%l3], %l1
	add %l3, 0x40, %l3
	cmp %l3, 0x400
	bne next_load0
	nop

	ta T_GOOD_TRAP
	nop

th_main_4:
th_main_8:
th_main_12:
th_main_16:
th_main_20:
th_main_24:
th_main_28:
	setx th0_init_done, %l1, %l2
core_masters_wait_for_setup:
	ldx  [%l2], %l1
	cmp  %l1, 1
	bne  core_masters_wait_for_setup
	nop

  ta      T_RD_THID
  mov     %o1, %i0
  sllx    %i0, 6, %i1

  mov   0, %i2
  setx  l1_hit_0,  %o0, %o1
  add   %o1, %i1, %o1
  add   %o1, 0x30, %o1
  setx  l1_hit_0_1,%o0, %o2
  add   %o2, 0x30, %o2
loop_core_masters:
  or          %g0, 0, %i3
  lduw  [%o2+%i0], %l0
  brz,pt   %l2, done_loop_core_master
  casx  [ %o1 ], %i2, %i3
  brnz,a,pt   %i3, loop_core_masters
  nop 
  nop

done_loop_core_master:
  ta T_BAD_TRAP
  nop

th_main_1:
  setx  slaves_1, %o1, %o0
  add   %o0, 0x4, %o0
  ba    start_slaves 
  nop
th_main_5:
  setx  slaves_5, %o1, %o0
  add   %o0, 0x4, %o0
  ba    start_slaves 
  nop
th_main_9:
  setx  slaves_9, %o1, %o0
  add   %o0, 0x4, %o0
  ba    start_slaves 
  nop
th_main_13:
  setx  slaves_13, %o1, %o0
  add   %o0, 0x4, %o0
  ba    start_slaves 
  nop
th_main_17:
  setx  slaves_17, %o1, %o0
  add   %o0, 0x4, %o0
  ba    start_slaves 
  nop
th_main_21:
  setx  slaves_21, %o1, %o0
  add   %o0, 0x4, %o0
  ba    start_slaves 
  nop
th_main_25:
  setx  slaves_25, %o1, %o0
  add   %o0, 0x4, %o0
  ba    start_slaves 
  nop
th_main_29:
  setx  slaves_29, %o1, %o0
  add   %o0, 0x4, %o0
  ba    start_slaves 
  nop


th_main_2:
  setx  slaves_2, %o1, %o0
  add   %o0, 0x8, %o0
  ba    start_slaves 
  nop
th_main_6:
  setx  slaves_6, %o1, %o0
  add   %o0, 0x8, %o0
  ba    start_slaves 
  nop
th_main_10:
  setx  slaves_10, %o1, %o0
  add   %o0, 0x8, %o0
  ba    start_slaves 
  nop
th_main_14:
  setx  slaves_14, %o1, %o0
  add   %o0, 0x8, %o0
  ba    start_slaves 
  nop
th_main_18:
  setx  slaves_18, %o1, %o0
  add   %o0, 0x8, %o0
  ba    start_slaves 
  nop
th_main_22:
  setx  slaves_22, %o1, %o0
  add   %o0, 0x8, %o0
  ba    start_slaves 
  nop
th_main_26:
  setx  slaves_26, %o1, %o0
  add   %o0, 0x8, %o0
  ba    start_slaves 
  nop
th_main_30:
  setx  slaves_30, %o1, %o0
  add   %o0, 0x8, %o0
  ba    start_slaves 
  nop


th_main_3:
  setx  slaves_3, %o1, %o0
  add   %o0, 0x8, %o0
  ba    start_slaves 
  nop
th_main_7:
  setx  slaves_7, %o1, %o0
  add   %o0, 0x8, %o0
  ba    start_slaves 
  nop
th_main_11:
  setx  slaves_11, %o1, %o0
  add   %o0, 0x8, %o0
  ba    start_slaves 
  nop
th_main_15:
  setx  slaves_15, %o1, %o0
  add   %o0, 0x8, %o0
  ba    start_slaves 
  nop
th_main_19:
  setx  slaves_29, %o1, %o0
  add   %o0, 0x8, %o0
  ba    start_slaves 
  nop
th_main_23:
  setx  slaves_23, %o1, %o0
  add   %o0, 0x8, %o0
  ba    start_slaves 
  nop
th_main_27:
  setx  slaves_27, %o1, %o0
  add   %o0, 0x8, %o0
  ba    start_slaves 
  nop
th_main_31:
  setx  slaves_31, %o1, %o0
  add   %o0, 0xc, %o0
  ba    start_slaves 
  nop


start_slaves:
  setx th0_init_done, %l1, %l2
slaves_wait_for_setup:
  ldx  [%l2], %l1
  cmp  %l1, 1
  bne  slaves_wait_for_setup
  nop

loop_slaves1:
  or          %g0, 0, %o3
  or          %g0, 0, %o4
  casa  [ %o0 ]0x80, %o3, %o4
  brnz,a,pt  %o4, loop_slaves1
  nop 
  nop

  ta T_BAD_TRAP
  nop

.data
.align 0x100
.skip  0x80
l1_hit_0:
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678
.align 0x40
.skip  0x30
.xword 0x1234567812345678

.align 0x40
.skip 0x30
l1_hit_0_1:
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678
.xword 0x1234567812345678



.align 0x10000
.skip  0xa0
slaves_1:
.xword 0x1234567812345678
.xword 0x1234567812345678
.align 0x10000
.skip 0xa0
slaves_2:
.xword 0x1234567812345678
.xword 0x1234567812345678
.align 0x10000
.skip 0xa0
slaves_3:
.xword 0x1234567812345678
.xword 0x1234567812345678
.align 0x10000
.skip  0xa0
slaves_5:
.xword 0x1234567812345678
.xword 0x1234567812345678
.align 0x10000
.skip 0xa0
slaves_6:
.xword 0x1234567812345678
.xword 0x1234567812345678
.align 0x10000
.skip 0xa0
slaves_7:
.xword 0x1234567812345678
.xword 0x1234567812345678
.align 0x10000
.skip  0xa0
slaves_9:
.xword 0x1234567812345678
.xword 0x1234567812345678
.align 0x10000
.skip 0xa0
slaves_10:
.xword 0x1234567812345678
.xword 0x1234567812345678
.align 0x10000
.skip 0xa0
slaves_11:
.xword 0x1234567812345678
.xword 0x1234567812345678
.align 0x10000
.skip  0xa0
slaves_13:
.xword 0x1234567812345678
.xword 0x1234567812345678
.align 0x10000
.skip 0xa0
slaves_14:
.xword 0x1234567812345678
.xword 0x1234567812345678
.align 0x10000
.skip 0xa0
slaves_15:
.xword 0x1234567812345678
.xword 0x1234567812345678
.align 0x10000
.skip  0xa0
slaves_17:
.xword 0x1234567812345678
.xword 0x1234567812345678
.align 0x10000
.skip 0xa0
slaves_18:
.xword 0x1234567812345678
.xword 0x1234567812345678
.align 0x10000
.skip 0xa0
slaves_19:
.xword 0x1234567812345678
.xword 0x1234567812345678
.align 0x10000
.skip  0xa0
slaves_21:
.xword 0x1234567812345678
.xword 0x1234567812345678
.align 0x10000
.skip 0xa0
slaves_22:
.xword 0x1234567812345678
.xword 0x1234567812345678
.align 0x10000
.skip 0xa0
slaves_23:
.xword 0x1234567812345678
.xword 0x1234567812345678
.align 0x10000
.skip  0xa0
slaves_25:
.xword 0x1234567812345678
.xword 0x1234567812345678
.align 0x10000
.skip 0xa0
slaves_26:
.xword 0x1234567812345678
.xword 0x1234567812345678
.align 0x10000
.skip 0xa0
slaves_27:
.xword 0x1234567812345678
.xword 0x1234567812345678
.align 0x10000
.skip  0xa0
slaves_29:
.xword 0x1234567812345678
.xword 0x1234567812345678
.align 0x10000
.skip 0xa0
slaves_30:
.xword 0x1234567812345678
.xword 0x1234567812345678
.align 0x10000
.skip 0xa0
slaves_31:
.xword 0x1234567812345678
.xword 0x1234567812345678


.align 0x100
l1_tlb_miss1:
.xword 0x12345678


.align 0x100
th0_init_done:
.xword 0
.align 0x40
.xword 0
.align 0x40
.xword 0
.align 0x40
.xword 0
.align 0x40
.xword 0


