// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_pib_picl_fp_1.s
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

#define H_T0_Interrupt_Level_14_0x4e
#define My_T0_Interrupt_Level_14_0x4e \
	rd	%softint, %g1; \
	wr	%g1, %g1, %softint; \
	done; \
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
	nop
	wr	%g0, 4, %fprs
	setx	data_start, %g1, %l0
	ldd	[%l0+0], %f0
	ldd	[%l0+8], %f2
	mov	0x1, %r22
	th_fork(main_th)
	nop
main_th_0:
main_th_1:
main_th_2:
main_th_3:
	ta	T_CHANGE_HPRIV	! macro
	rd	%pic, %l0
	wr	%g0, 0x14, %pcr !SL=001, UT=1, ST=0
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	fmovs	%f0, %f1
	fadds	%f0, %f1, %f2
	nop
	mov	32, %l7
loop_1:
	cmp	%l7, %g0
	bne	loop_1
	dec	%l7
	nop
	rd	%pic, %l0
	and	%l0, 0xff, %l0
	mov	1, %l1
	cmp	%l0, %l1
	be	%xcc, diag_pass
	nop
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
 /********************************
  *      Diag PASSED !           *
  ********************************/
diag_pass:
	ta	T_GOOD_TRAP

.data
	.xword 0x1234567887654321


