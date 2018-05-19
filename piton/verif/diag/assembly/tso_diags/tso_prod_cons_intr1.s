// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_prod_cons_intr1.s
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
/***************************************************************************
***
***  Program File: tso_prod_cons_intr1.s
***
***  Test Description : trying producer consumer with interrupts.
***
**********************************************************************/
#define ASI_SWVR_INTR_RECEIVE		0x72
#define ASI_SWVR_UDB_INTR_W		0x73
#define ASI_SWVR_UDB_INTR_R		0x74

#define H_T0_Trap_Instruction_0	
#define My_T0_Trap_Instruction_0	\
	ta	0x90;			\
	done;

#define H_HT0_HTrap_Instruction_0 intr0x190_custom_trap
#define H_HT0_Interrupt_0x60 intr0x60_custom_trap

#define	ITERATIONS 10
#define	THREAD_COUNT			2

#include "boot.s"

#define help_reg4			%l4
#define help_reg5			%l5
#define help_reg6			%l6

.text
.global main

main:

th_fork(th_main, %l0)

!----------------------
! producer
!----------------------
th_main_0:
	setx 	my_hyp_data, %l0, %o0;		
	mov	%g0,   %l0			! reset l0

	setx	user_data_start, help_reg4, help_reg5
ploop0:						! wait for the other
	ld	[help_reg5], help_reg6		! process to be ready to accept
	brz	help_reg6, ploop0		! interrupts

	set 	ITERATIONS, %g1;			
loop0:
	mov 	%l0, %l1			! l1 is old value
	ta	0x30				! start a user trap

wait_loop0:
	subcc	%l0, %l1, %g0			! wait for l0 to grow
	be	wait_loop0
	nop

	deccc	%g1;				! iterate
	bne	loop0
	nop;					

	ba	normal_end
	nop

!----------------------
! consumer
!----------------------
th_main_1:
th_main_2:
th_main_4:
	setx 	my_hyp_data, %l0, %o0;		
	mov	%g0,   %l0

	setx	user_data_start, help_reg4, help_reg5
	st	help_reg5, [help_reg5]		! wake up the producer
	set 	0xbeef, %l7;			

wait_loop1:
	subcc	%l0, ITERATIONS, %l1		! wait for l0 to grow
	brnz	%l1, wait_loop1			! to iteration count
	nop

	ba	normal_end
	nop

normal_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

user_text_end:

/***********************************************************************
   Test case data start
 ***********************************************************************/
.data
user_data_start:
	.skip 1000
user_data_end:

SECTION .MY_HYP_SEC TEXT_VA = 0x1100150000, DATA_VA = 0x1100160000
attr_text {
        Name=.MY_HYP_SEC,
        hypervisor
	}

! this is the interrupt trap. Both producer and consumer get it.
! consumer checks data and tells the producer to proceed.
! producer proceeds when it got this trap.
.global intr0x60_custom_trap
intr0x60_custom_trap:
	ldx	[%o0], %g3;			! get the data
	ldxa	[%g0] ASI_SWVR_INTR_RECEIVE, %g2;
	ldxa	[%g0] ASI_SWVR_UDB_INTR_R, %g1;	
	subcc	%g2, 0x1, %g0;			! if not 1 -> I am thread 0,
	bne	hlast				! the producer ->go to hlast
	nop;					
	set 	0x190, %g4			! I am consumer; check data
	subcc	%g3, %g4, %g4
	brz	%g4, hok
	nop
	ta	T_BAD_TRAP
hok:
	set	0x1, %g1;			! cause intr1 to thread 0.
	stxa	%g1, [%g0] ASI_SWVR_UDB_INTR_W;	

! noise - take it out
!	set	0x401, %g2;			! cause intr1 to thread 4.
!	stxa	%g2, [%g0] ASI_SWVR_UDB_INTR_W;	

hlast:
	inc	%l0;				! both prod and cons
	retry					! inc l0 and retry

!-----------------------------------------------------------------------

! this is the user defined producer trap.
.global intr0x190_custom_trap
intr0x190_custom_trap:
	setx 	my_hyp_data, %g1, %g2;		
	set 	0x190, %g1;			
	set 	0xbeef, %g3;			
#if THREAD_STRIDE == 1
	set 	0x100, %g4;			
#elif THREAD_STRIDE == 2
	set	    0x200, %g4;			! send intr 0 to thread 1
#elif THREAD_STRIDE == 4
	set	    0x400, %g5;			! send intr 0 to thread 4
#endif
	stx	%g3, [%g2]			! write bad data
	stx	%g1, [%g2]			! write good data
	stxa	%g4, [%g0] ASI_SWVR_UDB_INTR_W;	! send an interrupt
	!stxa	%g5, [%g0] ASI_SWVR_UDB_INTR_W;	! send an interrupt
	done;

!-----------------------------------------------------------------------

attr_data {
        Name=.MY_HYP_SEC,
        hypervisor
	}

.global my_hyp_data
.align 0x40
my_hyp_data:
	.skip 0x200

.end


