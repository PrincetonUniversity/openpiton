// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_thrd_fsm_xir_1.s
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
/********************************************************************************
This diag covers the following cases:
s_XIR_RST_AT_SUP_ST
********************************************************************************/


#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define My_External_Reset \
	sethi  %hi(0), %g1; \
	sethi  %hi(0x40000), %g2; \
	mov  %g1, %g1; \
	mov  %g2, %g2; \
	sllx  %g1, 0x20, %g1; \
	or  %g2, %g1, %g2; \
	jmp  %g2; \
	wr  %g0, 5, %asr26


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
	setx	data_start, %r18, %r20
	ldub	[%r20], %r22
	mov	0x55, %g4
	cmp	%g4, %r22
	be	%xcc, diag_pass
	mov	0x55, %r22
	mov	0x55, %r22
	stb	%r22, [%r20]
	ta	T_CHANGE_PRIV  ! macro
	nop
	mov	128, %r16
sync_loop_1:
	sub	%r16, 1, %r16
	cmp	%r16, %g0
	bg	%xcc, sync_loop_1
	nop
XIR_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.XIR_1), 16, 16)) -> intp(0, 1, 3)
	nop
	mov	128, %r16
wait_loop_1:
	sub	%r16, 1, %r16
	cmp	%r16, %g0
	bg	%xcc, wait_loop_1
	nop
	ta	T_BAD_TRAP
	nop
.data
/****************
 * Data section *
 ****************/
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
.text
 /*****************
  * Diag PASSED ! *
  *****************/
diag_pass:
	ta	T_GOOD_TRAP
	nop
