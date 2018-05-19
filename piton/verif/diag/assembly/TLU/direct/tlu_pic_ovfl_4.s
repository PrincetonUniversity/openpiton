// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_pic_ovfl_4.s
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
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! Diag: tlu_pic_ovfl_4.s
!! No. Threads: 1
!! Description: 
!!	This tests the pic-oveflow trap being masked by PIL
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#include "my_intr_handlers.s"
#include "my_trap_handlers.s"

!!!!! PIC-Overflow trap handler
#define H_T0_Interrupt_Level_15_0x4f
#define My_T0_Interrupt_Level_15_0x4f \
	sethi	%hi(0x8000), %g1; \
	wr	%g1, %g0, %clear_softint; \
	rd	%pcr, %g1; \
	and	%g1, 0x300, %g2; \
	wr	%g1, %g2, %pcr; \
	add	%l6, 0x4f, %l6; \
	nop; \
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
	sethi	%hi(0x4000), %l4
	mov	0, %l6
!==========================================
! Enable the PIC to count Supervisor events
	ta	T_CHANGE_HPRIV
	rdhpr	%hpstate, %l0
	rdpr	%pstate, %l2
        wr      %g0, 2, %pcr
        setx    %hi(0xfffffffe00000000), %g1, %g2
        wr      %g2, %g0, %pic
	wrpr	%l2, 4, %pstate	 !Set Supervisor priv bit
	wrhpr	%l0, 4, %hpstate !Clear Hypervisor priv bit and Set TLZ bit
	nop
check_1:
	wr	%l4, %g0, %set_softint	!Set SOFTINT
	nop
	nop
	cmp	%l6, %g0
	bne	diag_fail
	nop
	nop
	wrpr	%l2, %pstate !Clear Supervisor priv bit
!====================================
! Enable the PIC to count User events
	ta	T_CHANGE_HPRIV
	rdhpr	%hpstate, %l0
	rdpr	%pstate, %l2
        wr      %g0, 4, %pcr
        setx    %hi(0xfffffffe00000000), %g1, %g2
        wr      %g2, %g0, %pic
	wrpr	%g0, 0, %pil
	wrpr	%l2, 2, %pstate	 !Clear pstate.IE bit
	wrhpr	%l0, 4, %hpstate !Clear Hypervisor priv bit and Set TLZ bit
	nop
	nop
	nop
	nop
	cmp	%l6, %g0
	bne	diag_fail
	nop
	nop
!====================================
! Enable the PIC to count User events
	ta	T_CHANGE_HPRIV
	rdhpr	%hpstate, %l0
	rdpr	%pstate, %l2
        wr      %g0, 4, %pcr
        setx    %hi(0xfffffffe00000000), %g1, %g2
        wr      %g2, %g0, %pic
	wrpr	%g0, 14, %pil
	wrpr	%l2, 2, %pstate	 !Set pstate.IE bit
	wrhpr	%l0, 4, %hpstate !Clear Hypervisor priv bit and Set TLZ bit
	nop
	nop
	nop
	nop
	cmp	%l6, %g0
	bne	diag_pass
	nop
	nop
diag_fail:
	ta	T_BAD_TRAP
	nop
diag_pass:
	ta	T_GOOD_TRAP
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
