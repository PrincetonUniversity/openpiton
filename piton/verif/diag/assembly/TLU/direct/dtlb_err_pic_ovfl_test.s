// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: dtlb_err_pic_ovfl_test.s
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
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! Diag: tlu_stb2b_trap_40.s
!! No. Threads: 1
!! Description: 
!! This diag tests the stb2b lsu-asynchronous and pic-overflow 
!! traps
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define ALL_MY_INTR_HANDLERS
#include "my_intr_handlers.s"
#include "my_trap_handlers.s"
#include "tlu_custom_trap_handlers.s"

#define H_T0_Interrupt_Level_15_0x4f
#define My_T0_Interrupt_Level_15_0x4f \
	rd	%softint, %g1; \
	sethi	%hi(0x8000), %g1; \
	wr	%g1, %g0, %clear_softint; \
	rd	%pcr, %g1; \
	and	%g1, 0x300, %g2; \
	wr	%g1, %g2, %pcr; \
	add	%l6, 0x4f, %l6; \
	retry

#define H_HT0_Data_access_error_0x32
#define SUN_H_HT0_Data_access_error_0x32 \
	mov	8, %g1; \
	stxa	%g0, [%g1] 0x60; \
	add	%l6, 0x32, %l6; \
	done; \
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
	mov	0, %l6
	ta	T_CHANGE_HPRIV
	wrpr	%g0, 0, %pil
	setx	0xc8000000, %g1, %g2
	stxa	%g2, [%g0] 0x43
	mov	2, %g2
	stxa	%g2, [%g0] 0x4b
	setx	%hi(data_start), %g1, %l0
	ta	T_CHANGE_NONHPRIV
	nop
	nop
	mov	0x7f, %l2
	add	%l2, %l2, %l2
	sth	%l2, [%l0]
pic_ovfl:
	nop
	sth	%l2, [%l0]
	nop
	nop
	nop
diag_pass:
	ta	T_GOOD_TRAP
	nop
diag_fail:
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
