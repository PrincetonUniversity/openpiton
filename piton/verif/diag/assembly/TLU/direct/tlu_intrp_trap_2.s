// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_intrp_trap_2.s
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
********************************************************************************/


#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define H_T0_Interrupt_Level_14_0x4e
#define My_T0_Interrupt_Level_14_0x4e \
	add	%r20, 1, %r20; \
	rd	%softint, %g1; \
	wr	%g1, %g1, %softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
	add	%r20, 1, %r20; \
	ldxa	[%g0] 0x72, %g2; \
	ldxa	[%g0] 0x74, %g2; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_0x60
#define My_T0_Interrupt_0x60 \
	add	%r20, 1, %r20; \
	ldxa	[%g0] 0x72, %g2; \
	ldxa	[%g0] 0x74, %g2; \
	retry; \
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
	ta	T_CHANGE_PRIV	! macro
	wrpr	%g0, 0, %pil
	mov	0, %r20
XINTR_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.XINTR_1), 16, 16)) -> intp(0, 0, 0)
	nop
	nop
	nop
	nop
	wr	%g0, 1, %softint
	nop
	mov	256, %r16
wait_loop:
	sub	%r16, 1, %r16
	cmp	%r16, %g0
	bg	%xcc, wait_loop
	nop
	nop
	mov	2, %g2
	cmp	%g2, %r20
	be	%xcc, diag_pass
	nop
	ta	T_BAD_TRAP
	nop
	nop
	.data
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
diag_pass:
	ta	T_GOOD_TRAP

.data
	.xword 0x1234567887654321

