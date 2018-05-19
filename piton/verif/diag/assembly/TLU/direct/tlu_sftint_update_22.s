// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_sftint_update_22.s
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
!/******************************************************************************
This diag creats the condition of HW setting the SOFTINT[16] on an stick-match
event and SW setting bits 15-0 at the same time by writing to SET_SOFTINT 
*******************************************************************************/

#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#include "my_intr_handlers.s"

#define H_T0_Interrupt_Level_14_0x4e
#define My_T0_Interrupt_Level_14_0x4e \
	rd      %softint, %g1; \
	sethi   %hi(0x10000), %g2; \
	and	%g1, %g2, %g3; \
	sethi   %hi(0x14000), %g2; \
	or	%g2, 1, %g2; \
	wr      %g2, 0, %clear_softint; \
	add     %g3, 0, %l0; \
	retry

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
	mov	0, %l0
	ta	T_CHANGE_HPRIV	! macro
	setx	0x4000000000000000, %g1, %g1
	wrpr	%g0, %pil
	wrpr	%g1, %tick
	wr	%g1, 0x82c, %sys_tick_cmpr
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	nop
	mov 4, %g1
wait_loop_1:
	cmp	%g1, %g0
	bne	wait_loop_1
	dec	%g1
	nop
	sethi	%hi(0x0f000), %g1
	or	%g1, 0xfff, %g1
	wr	%g1, 0, %set_softint
	nop
	nop
	nop
	nop
	mov 128, %g1
wait_loop_2:
	cmp	%g1, %g0
	bne	wait_loop_2
	dec	%g1
	nop
	sethi   %hi(0x10000), %g4
	cmp	%g4, %l0
	be	diag_pass
	nop
	nop
	ta	T_BAD_TRAP
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
 /********************************
  *      Diag PASSED !           *
  ********************************/
diag_pass:
	ta	T_GOOD_TRAP

.data
	.xword 0x1234567887654321

