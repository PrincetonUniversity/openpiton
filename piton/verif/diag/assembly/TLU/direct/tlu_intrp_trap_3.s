// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_intrp_trap_3.s
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
this diag creats (B2B_HW_INTR_SYNC_TRAP) back-to-back occurence of hw intrrupt
and synchronous trap
********************************************************************************/


#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

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
	nop
	mov	0, %r20
	mov	128, %r16
sync_loop_0:
	sub	%r16, 1, %r16
	cmp	%r16, %g0
	bg	%xcc, sync_loop_0
	nop
XINTR_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.XINTR_0), 16, 16)) -> intp(0, 0, 0)
	nop
	nop
	nop
	nop
	mov	128, %r16
wait_loop_0:
	sub	%r16, 1, %r16
	cmp	%r16, %g0
	bg	%xcc, wait_loop_0
	nop
	nop
	mov	1, %g2
	cmp	%g2, %r20
	be	%xcc, diag_pass_0
	nop
	ta	T_BAD_TRAP
	nop
	nop
diag_pass_0:
	ta	T_GOOD_TRAP
	nop

main_th_1:
	nop
	mov	0, %r20
	mov	128, %r16
sync_loop_1:
	sub	%r16, 1, %r16
	cmp	%r16, %g0
	bg	%xcc, sync_loop_1
	nop
XINTR_1:
	rd	%softint, %g2
	nop
	nop
	nop
	nop
	mov	128, %r16
wait_loop_1:
	sub	%r16, 1, %r16
	cmp	%r16, %g0
	bg	%xcc, wait_loop_1
	nop
	nop
	mov	0, %g2
	cmp	%g2, %r20
	be	%xcc, diag_pass_1
	nop
	ta	T_BAD_TRAP
	nop
	nop
diag_pass_1:
	ta	T_GOOD_TRAP
	nop

main_th_2:
main_th_3:
	nop
	ta	T_GOOD_TRAP
	nop
.data
	.xword 0x1234567887654321

