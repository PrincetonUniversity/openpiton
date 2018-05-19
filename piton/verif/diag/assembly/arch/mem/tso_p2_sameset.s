// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_p2_sameset.s
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

/*************************************************************
  File:         tso_p2_sameset.s

  Description:
  -----------
  Random TSO testing with automatic memory conststency self checking.

  This daig has two TSO store producer (core0:th0 and core0:th1)

  Stride of TSO store addresses: 4 (word) << 14 = 64K byte
  (Mapped to same the L2 set)

 *************************************************************/

#define ITER 20
#define PING 1
#define PONG 3
#define STRIDE 15
#define RANDOM 0x80000

#define THREAD_COUNT 32
#define THREAD_STRIDE 1
 
#include "boot.s"

.text
.global main

main:

thread_jump:
/*
 ***************************************************************
 *  Check the thread status register and jump to different sections
 *  of the code for diff threads
 ***************************************************************
*/
th_fork(th_main,%l0)
th_main_0:
writer0:
/*
 ***************************************************************
 * core0:th0:
 * Issues a sequence of stores to a group of addresses (tso[0:(PING-1)])
 * repeatedly with the store values increasing between sequences.
 ***************************************************************
*/

	mov 0,%o1
.LL3:
	cmp %o1,7
	ble .LL6
	nop
	b .LL4
	nop
.LL6:
	sethi %hi(tso),%g3
	sll %o1,STRIDE,%o7
	mov %o7,%l0
	sll %l0,2,%o7
	or %g3,%lo(tso),%g3
	st %g0,[%g3+%o7]
.LL5:
	add %o1,1,%o1
	b .LL3
	nop
.LL4:
	nop
	mov 1,%o0
.LL7:
	sethi %hi(ITER*4),%o7
	or %o7,%lo(ITER*4),%g3
	cmp %o0,%g3
	ble .LL10
	nop
	b .LL8
	nop
.LL10:
.LL11:
	sethi %hi(tso),%g3
	or %g3,%lo(tso),%l0
	setx (PONG<<(STRIDE+2)),%l1,%o7
	add %o7,%l0,%g3
	add %o0,-1,%o7
	ld [%g3],%g3
	cmp %g3,%o7
	bne .LL13
	nop
	b .LL12
	nop
.LL13:
	b .LL11
	nop
.LL12:
	nop
	mov 0,%o1
.LL14:
	cmp %o1,PING
	ble .LL17
	nop
	b .LL9
	nop
.LL17:
	sethi %hi(tso),%g3
	sll %o1,STRIDE,%o7
	mov %o7,%l0
	sll %l0,2,%o7
	or %g3,%lo(tso),%g3
	st %o0,[%g3+%o7]
.LL16:
	add %o1,1,%o1
	b .LL14
	nop
.LL9:
	add %o0,1,%o0
	b .LL7
	nop
.LL8:
	b diag_pass
	nop

th_main_1:
writer1:
/*
 ***************************************************************
 * core0:th1:
 * Issues a sequence of stores to a group of addresses (tso[0:(PING-1)])
 * repeatedly with the store values increasing between sequences.
 ***************************************************************
*/
	mov 1,%o0
.LL20:
	sethi %hi(ITER*4),%o7
	or %o7,%lo(ITER*4),%g3
	cmp %o0,%g3
	ble .LL23
	nop
	b .LL21
	nop
.LL23:
.LL24:
	sethi %hi(tso),%g3
	or %g3,%lo(tso),%l0
	setx (PING<<(STRIDE+2)),%l1,%o7
	add %o7,%l0,%g3
	ld [%g3],%o7
	cmp %o7,%o0
	bne .LL26
	nop
	b .LL25
	nop
.LL26:
	b .LL24
	nop
.LL25:
	nop
	mov (PING+1),%o1
.LL27:
	cmp %o1,PONG
	ble .LL30
	nop
	b .LL22
	nop
.LL30:
	sethi %hi(tso),%g3
	sll %o1,STRIDE,%o7
	mov %o7,%l0
	sll %l0,2,%o7
	or %g3,%lo(tso),%g3
	st %o0,[%g3+%o7]
.LL29:
	add %o1,1,%o1
	b .LL27
	nop
.LL22:
	add %o0,1,%o0
	b .LL20
	nop
.LL21:
	b diag_pass
	nop


th_main_2:
	set 	2, %o3
	ba	reader; nop
th_main_3:
	set 	3, %o3
	ba	reader; nop
th_main_4:
	set 	4, %o3
	ba	reader; nop
th_main_5:
	set 	5, %o3
	ba	reader; nop
th_main_6:
	set 	6, %o3
	ba	reader; nop
th_main_7:
	set 	7, %o3
	ba	reader; nop
th_main_8:
	set 	8, %o3
	ba	reader; nop
th_main_9:
	set 	9, %o3
	ba	reader; nop
th_main_10:
	set 	10, %o3
	ba	reader; nop
th_main_11:
	set 	11, %o3
	ba	reader; nop
th_main_12:
	set 	12, %o3
	ba	reader; nop
th_main_13:
	set 	13, %o3
	ba	reader; nop
th_main_14:
	set 	14, %o3
	ba	reader; nop
th_main_15:
	set 	15, %o3
	ba	reader; nop
th_main_16:
	set 	16, %o3
	ba	reader; nop
th_main_17:
	set 	17, %o3
	ba	reader; nop
th_main_18:
	set 	18, %o3
	ba	reader; nop
th_main_19:
	set 	19, %o3
	ba	reader; nop
th_main_20:
	set 	20, %o3
	ba	reader; nop
th_main_21:
	set 	21, %o3
	ba	reader; nop
th_main_22:
	set 	22, %o3
	ba	reader; nop
th_main_23:
	set 	23, %o3
	ba	reader; nop
th_main_24:
	set 	24, %o3
	ba	reader; nop
th_main_25:
	set 	25, %o3
	ba	reader; nop
th_main_26:
	set 	26, %o3
	ba	reader; nop
th_main_27:
	set 	27, %o3
	ba	reader; nop
th_main_28:
	set 	28, %o3
	ba	reader; nop
th_main_29:
	set 	29, %o3
	ba	reader; nop
th_main_30:
	set 	30, %o3
	ba	reader; nop
th_main_31:
	set 	31, %o3
	ba	reader; nop

	ta 	T_BAD_TRAP

reader:
/*
 ***************************************************************
 * reader:
 * Issue loads from the same group of addresses repeatedly in a reserved
 * order and check if the load value increased monotonously.
 * Also issue random stores and loads to random addresses random[0:0xfffff]
 * to stress the memory system.
 ***************************************************************
*/

	mov %o3,%o7
	sll %o7,3,%g3
	add %g3,%o3,%g3
	sll %g3,2,%o7
	add %o7,%o3,%o7
	sll %o7,2,%g3
	sub %g3,%o3,%g3
	sll %g3,3,%o7
	add %o7,%o3,%o5
	mov 1,%o0
.LL32:
	sethi %hi(ITER),%o7
	or %o7,%lo(ITER),%g3
	cmp %o0,%g3
	ble .LL35
	nop
	b diag_pass
	nop
.LL35:
	sethi %hi(tso),%g3
	or %g3,%lo(tso),%l0
	setx (PONG<<(STRIDE+2)),%l1,%o7
	add %o7,%l0,%g3
	ld [%g3],%o2
	mov (PONG-1),%o1
.LL36:
	cmp %o1,0
	bge .LL39
	nop
	b .LL34
	nop
.LL39:
	sethi %hi(tso),%g3
	sll %o1,STRIDE,%o7
	mov %o7,%l0
	sll %l0,2,%o7
	or %g3,%lo(tso),%g3
	ld [%g3+%o7],%o4
	cmp %o4,%o2
	bgeu .LL40
	nop
	b diag_fail
	nop
.LL40:
	mov %o4,%o2
	mov %o5,%o7
	sll %o7,5,%g3
	add %g3,%o5,%g3
	sll %g3,2,%o7
	sub %o7,%o5,%o7
	sll %o7,2,%g3
	sub %g3,%o5,%g3
	sll %g3,2,%o7
	add %o7,%o5,%o7
	sll %o7,5,%g3
	add %o7,%g3,%o5
	add %o5,1,%o5
	srl %o5,4,%g2
	sethi %hi(RANDOM-1),%o7
	or %o7,%lo(RANDOM-1),%g3
	and %g2,%g3,%g2
	and %o5,1,%g3
	cmp %g3,0
	be .LL42
	nop
	sethi %hi(random),%g3
	mov %g2,%o7
	sll %o7,2,%l0
	or %g3,%lo(random),%g3
	ld [%g3+%l0],%g2
	b .LL38
	nop
.LL42:
	and %o5,2,%g3
	cmp %g3,0
	be .LL44
	nop
	sethi %hi(random),%g3
	mov %g2,%l0
	sll %l0,2,%o7
	or %g3,%lo(random),%g3
	mov 1,%l0
	st %l0,[%g3+%o7]
	b .LL38
	nop
.LL44:
	and %o5,15,%g3
	cmp %g3,0
	bne .LL38
	nop
	mov %g2,%o7
	sll %o7,2,%g3
	sethi %hi(random),%l0
	or %l0,%lo(random),%o7
	mov 1,%l0
	stb %l0,[%g3+%o7]
.LL38:
	add %o1,-1,%o1
	b .LL36
	nop
.LL34:
	add %o0,1,%o0
	b .LL32
	nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */
diag_fail:
        set     0xdeadcafe,     %l0
        ta T_BAD_TRAP
        nop
        nop

/*
 ********************************
 *      Diag PASSED !           *
 ********************************
 */
diag_pass:
        set     0xaaddcafe,     %l0
        ta T_GOOD_TRAP
        nop

.data
tso:
        .skip   262144
random:
        .skip   RANDOM*4

.end
