// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: dtlb_err_on_sir.s
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
!! Diag: dtlb_err_on_sir.s
!! No. Threads: 1
!! Description: 
!! This diag tests the stb2b lsu-asynchronous on an sir inst
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define ALL_MY_INTR_HANDLERS
#include "my_intr_handlers.s"
#include "my_trap_handlers.s"

#define H_HT0_Data_access_error_0x32
#define SUN_H_HT0_Data_access_error_0x32 \
	mov	8, %g1; \
	stxa	%g0, [%g1] 0x60; \
	add	%l6, 0x32, %l6; \
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
	mov	0, %l6
	ta	T_CHANGE_HPRIV
	rdhpr	%hpstate, %l0
	rdpr	%pstate, %l1
	setx	0xc8000000, %g1, %g2
	stxa	%g2, [%g0] 0x43
        mov     2, %g2
        stxa    %g2, [%g0] 0x4b
	wrpr	%l1, 4, %pstate		!ta	T_CHANGE_PRIV
	wrhpr	%l0, 4, %hpstate	!ta	T_CHANGE_NONHPRIV
	setx	%hi(data_start), %g1, %l0
	sth	%l6, [%l0]
	sir
	nop
	mov	0x32, %g1
	cmp	%l6, %g1
	bne	diag_fail
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
