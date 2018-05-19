// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_prod_cons_intr3b.s
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
***  Test Description : This is a diag trying to catch an ordering bug
***  between an interrupt and a prior invalidating store
***  thread 4 issues store A; interrupt to wake up thread 0;
***  thread zero's interrupt handler should see the new A
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

#define	ITERATIONS 		4

#include "boot.s"
#define help_reg4	%l4
#define help_reg5	%l5
#define help_reg6	%l6

.text
.global main

main:

th_fork(th_main, %l0)

th_main_0:
	setx	my_hyp_data, help_reg4, %o0

	setx	user_data_start, help_reg4, help_reg5
	st	help_reg5, [help_reg5]	! tell thread4 I am ready

	mov %g0, %l0

wait_loop0:
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	subcc	%l0, 0x3, %l1	! wait for l0 to reach ITERATION count
	brnz	%l1, wait_loop0
	nop

	ba	normal_end
	nop
!-------------------------------
th_main_1:
	setx	user_data_start, help_reg4, help_reg5

loop1:
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ba	loop1
	ld	[help_reg5], help_reg6
!-------------------------------
th_main_2:
	setx	user_data_start, help_reg4, help_reg5

loop2:
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ba	loop2
	ld	[help_reg5], help_reg6
!-------------------------------
th_main_3:
	setx	user_data_start, help_reg4, help_reg5

loop3:
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ld	[help_reg5], help_reg6
	ba	loop3
	ld	[help_reg5], help_reg6
!-------------------------------

th_main_4:

	setx    user_data_start, help_reg4, help_reg5
preliminary_loop_0:			! wait for the consumer to be ready
	ld	[help_reg5], help_reg6	! to accept interrupts
	brz	help_reg6, preliminary_loop_0
	nop

	mov	%g0, %l0
	set 	ITERATIONS, %i0;			
loop0:					! cause a user trap
	inc 	%l0
	ta	0x30

	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;
	nop; nop; nop; nop; nop;

	deccc	%i0;
	bne	loop0
	nop;					

	ba	normal_end
	nop

th_main_5:
th_main_6:
th_main_7:

	ba	th_main_7
#ifdef FLUSH
	flush %g0
#endif
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

.global intr0x60_custom_trap

! the trap that will be executed
intr0x60_custom_trap:
	ld	[%o0], %l0
	ldxa	[%g0] ASI_SWVR_INTR_RECEIVE, %g2;
	ldxa	[%g0] ASI_SWVR_UDB_INTR_R, %g3;	
	retry;


.global intr0x190_custom_trap
intr0x190_custom_trap:

	setx 	my_hyp_data, %g1, %g2;	
	sta	%l0, [%g2] 0x27
	stxa	%l0, [%g0] ASI_SWVR_UDB_INTR_W;	
	done;

attr_data {
        Name=.MY_HYP_SEC,
        hypervisor
	}

.global my_hyp_data
.align 0x40
my_hyp_data:
	.skip 0x200

.end
