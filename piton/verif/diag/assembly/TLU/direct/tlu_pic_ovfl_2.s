// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_pic_ovfl_2.s
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

#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define HT0_Interrupt_Level_15_0x4f
#define My_HT0_Interrupt_Level_15_0x4f \
	rd      %softint, %g2; \
	wr	%g2, %g2, %softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_15_0x4f
#define My_T0_Interrupt_Level_15_0x4f \
	rd      %softint, %g2; \
	wr	%g2, %g2, %softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:
	th_fork(main_th)
main_th_0:
main_th_1:
main_th_2:
main_th_3:
	nop
!!=========================
!! Initialize the registers
!!=========================
	mov	0, %r8
	mov	0, %r9
	mov	0, %r10
	mov	0, %r11
	mov	0, %r12
	mov	0, %r13
	mov	0, %r14
	mov	0, %r15
	mov	0, %r16
	mov	0, %r17
	mov	0, %r18
	mov	0, %r19
	mov	0, %r20
	mov	0, %r21
	mov	0, %r22
	mov	0, %r23
	mov	0, %r24
	mov	0, %r25
	mov	0, %r26
	mov	0, %r27
	mov	0, %r28
	mov	0, %r29
	mov	0, %r30
	mov	0, %r31
	nop
!!==========================
!! Program the PIB registers
!!==========================
	ta	T_CHANGE_HPRIV	! macro
	wrpr	%g0, %pil
	rd	%pic, %g2
	wr	%g0, 0x26, %pcr !SL=010, UT=1, ST=1
	setx	0xfffffffb00000000, %g1, %r16
	wr	%r16, 0, %pic
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	mov	5, %r8
	mov	10, %r9
	mov	5, %r10
	mov	10, %r11
	mov	5, %r12
	mov	10, %r13
	mov	5, %r14
	mov	10, %r15
	mov	5, %r16
	mov	10, %r17
	mov	5, %r18
	mov	10, %r19
	mov	5, %r20
	mov	10, %r21
	mov	5, %r22
	mov	10, %r23
	mov	5, %r24
	mov	10, %r25
	mov	5, %r26
	mov	10, %r27
	mov	5, %r28
	mov	10, %r29
	mov	5, %r30
	mov	10, %r31
	nop
!!==================
!! Check the Results
!!==================
	mov	5, %g1
	cmp	%r8, %g1
	bne	diag_fail
	mov	10, %g1
	cmp	%r9, %g1
	bne	diag_fail
	mov	5, %g1
	cmp	%r10, %g1
	bne	diag_fail
	mov	10, %g1
	cmp	%r11, %g1
	bne	diag_fail
	mov	5, %g1
	cmp	%r12, %g1
	bne	diag_fail
	mov	10, %g1
	cmp	%r13, %g1
	bne	diag_fail
	mov	5, %g1
	cmp	%r14, %g1
	bne	diag_fail
	mov	10, %g1
	cmp	%r15, %g1
	bne	diag_fail
	mov	5, %g1
	cmp	%r16, %g1
	bne	diag_fail
	mov	10, %g1
	cmp	%r17, %g1
	bne	diag_fail
	mov	5, %g1
	cmp	%r18, %g1
	bne	diag_fail
	mov	10, %g1
	cmp	%r19, %g1
	bne	diag_fail
	mov	5, %g1
	cmp	%r20, %g1
	bne	diag_fail
	mov	10, %g1
	cmp	%r21, %g1
	bne	diag_fail
	mov	5, %g1
	cmp	%r22, %g1
	bne	diag_fail
	mov	10, %g1
	cmp	%r23, %g1
	bne	diag_fail
	mov	5, %g1
	cmp	%r24, %g1
	bne	diag_fail
	mov	10, %g1
	cmp	%r25, %g1
	bne	diag_fail
	mov	5, %g1
	cmp	%r26, %g1
	bne	diag_fail
	mov	10, %g1
	cmp	%r27, %g1
	bne	diag_fail
	mov	5, %g1
	cmp	%r28, %g1
	bne	diag_fail
	mov	10, %g1
	cmp	%r29, %g1
	bne	diag_fail
	mov	5, %g1
	cmp	%r30, %g1
	bne	diag_fail
	mov	10, %g1
	cmp	%r31, %g1
	bne	diag_fail
	nop
	nop
 /********************************
  *      Diag PASSED !           *
  ********************************/
	ta	T_GOOD_TRAP
	nop
	nop
	nop
	nop
 /********************************
  *      Diag Failed !           *
  ********************************/
diag_fail:
	ta	T_BAD_TRAP
	nop
	nop
	nop
	nop
	.data
.global data_start
data_start:
	.xword	0x0000000000000000
	.xword	0x1111111111111111
	.xword	0x2222222222222222
	.xword	0x3333333333333333
	.xword	0x4444444444444444
	.xword	0x5555555555555555
	.xword	0x6666666666666666
	.xword	0x7777777777777777
	.xword	0x7777777777777777
	.xword	0x6666666666666666
	.xword	0x5555555555555555
	.xword	0x4444444444444444
	.xword	0x3333333333333333
	.xword	0x2222222222222222
	.xword	0x1111111111111111
	.xword	0x0000000000000000
