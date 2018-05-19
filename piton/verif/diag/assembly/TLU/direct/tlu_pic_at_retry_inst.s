// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_pic_at_retry_inst.s
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
!! Diag: tlu_pic_at_done_inst.s
!! No. Threads: 1
!! Description: 
!! This diag tests the pic-overflow trap on a DONE instruction
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define H_T0_Interrupt_Level_15_0x4f
#define My_T0_Interrupt_Level_15_0x4f \
        rd      %softint, %g1; \
        sethi   %hi(0x8000), %g1; \
        wr      %g1, %g0, %clear_softint; \
        rd      %pcr, %g1; \
        and     %g1, 0x300, %g2; \
        wr      %g1, %g2, %pcr; \
	add	%l6, 0x4f, %l6; \
        retry

#define H_T1_Reserved_0x4f
#define My_T1_Reserved_0x4f \
        rd      %softint, %g1; \
        sethi   %hi(0x8000), %g1; \
        wr      %g1, %g0, %clear_softint; \
        rd      %pcr, %g1; \
        and     %g1, 0x300, %g2; \
        wr      %g1, %g2, %pcr; \
	add	%l6, 0x4f, %l6; \
        retry

#define H_T0_Trap_Instruction_0
#define	My_T0_Trap_Instruction_0 \
	wr	%l5, %g0, %pic; \
	rdpr	%pstate, %g1; \
	wrpr	%g1, 2, %pstate; \
	cmp	%l6, 0x7f; \
	be	dn_inst; \
	add	%l6, 0x30, %l6; \
	retry; \
dn_inst: \
	done


#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:
!========================
! Initialize trap counter
	mov	0, %l6
!==============================================
! Initialize performace instrumenattion counter
	ta	T_CHANGE_HPRIV
	wrpr	%g0, 13, %pil
	wr	%g0, 6, %pcr
	setx	%hi(0xfffffffa00000000), %g1, %l5
	wr	%l5, %g0, %pic
	ta	T_CHANGE_NONHPRIV
	ta	0x30
	nop
	rdpr	%pstate, %l6
!=======================
! Check the trap counter
	mov	0, %g1
	add	%g1, 0x30, %g1
	add	%g1, 0x4f, %g1
	add	%g1, 0x30, %g1
	add	%g1, 0x4f, %g1
	cmp	%l6, %g1
	be	diag_pass
	nop
	ta	T_BAD_TRAP
	nop
	nop
diag_pass:
	ta	T_GOOD_TRAP
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
