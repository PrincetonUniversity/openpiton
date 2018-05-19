// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_prod_cons_intr3.s
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
***  Test Description : modify the trap handler and then cause the trap
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

#define	ITERATIONS 4
#define	THREAD_COUNT			2

#include "boot.s"
#define help_reg4	%l4
#define help_reg5	%l5
#define help_reg6	%l6

.text
.global main

main:

th_fork(th_main, %l0)

th_main_0:
	setx 	my_hyp_data, %l0, %o0;		
	mov	%g0, %l0
	set	0xc00,   %l2		! to wake up dummy threads
	set	0xd00,   %l3		! to wake up dummy threads

	setx    user_data_start, help_reg4, help_reg5
preliminary_loop_0:			! wait for the consumer to be ready
	ld	[help_reg5], help_reg6	! to accept interrupts
	brz	help_reg6, preliminary_loop_0
	nop

	set 	ITERATIONS, %g1;			
loop0:					! cause a user trap
	mov 	%l0, %l1
	ta	0x30

loop01:
	subcc	%l0, %l1, %g0		! wait for l0 to grow
	be	loop01
	nop

	deccc	%g1;			! iterate
	bne	loop0
	nop;					

	ba	normal_end
	nop

th_main_1:
th_main_2:
th_main_4:
	setx 	my_hyp_data, %l0, %o0;		
	mov	%g0,   %l0
	set	0x000,   %l2		! to wake up thread 0
	set	0xd00,   %l3		! a dummy thread

	setx	user_data_start, help_reg4, help_reg5
	st	help_reg5, [help_reg5]	! tell thread0 I am ready

wait_loop1:
	subcc	%l0, ITERATIONS, %l1	! wait for l0 to reach ITERATION count
	brnz	%l1, wait_loop1
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

.global intr0x60_custom_trap

! the trap that will be executed
intr0x60_custom_trap:
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP
	retry;

! the good trap
.global intr0x60_custom_trap_real
intr0x60_custom_trap_real:
	ldxa	[%g0] ASI_SWVR_INTR_RECEIVE, %g2;
	ldxa	[%g0] ASI_SWVR_UDB_INTR_R, %g1;	
	inc	%l0;			
	stxa	%l2, [%g0] ASI_SWVR_UDB_INTR_W;	
	stxa	%l3, [%g0] ASI_SWVR_UDB_INTR_W;	
	retry;

! the bad trap
.global intr0x60_custom_trap_bad
intr0x60_custom_trap_bad:
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP
	ta	T_BAD_TRAP

.global intr0x190_custom_trap
intr0x190_custom_trap:
	setx 	intr0x60_custom_trap_bad, %g1, %g2;	! write bad instructions
	setx 	intr0x60_custom_trap,     %g1, %g3;	! to the trap handler
	ld	[%g2], %g1
	st	%g1, [%g3]

	add	%g2, 0x4, %g2				! 2
	add	%g3, 0x4, %g3
	ld	[%g2], %g1
	st	%g1, [%g3]

	add	%g2, 0x4, %g2				! 3
	add	%g3, 0x4, %g3
	ld	[%g2], %g1
	st	%g1, [%g3]

	add	%g2, 0x4, %g2				! 4
	add	%g3, 0x4, %g3
	ld	[%g2], %g1
	st	%g1, [%g3]

	add	%g2, 0x4, %g2				! 5
	add	%g3, 0x4, %g3
	ld	[%g2], %g1
	st	%g1, [%g3]

	add	%g2, 0x4, %g2				! 6
	add	%g3, 0x4, %g3
	ld	[%g2], %g1
	st	%g1, [%g3]

! now overwrite the bad ones with good ones.
	setx 	intr0x60_custom_trap_real, %g1, %g2;	
	setx 	intr0x60_custom_trap,      %g1, %g3;
	ld	[%g2], %g1
	st	%g1, [%g3]

	add	%g2, 0x4, %g2				! 2
	add	%g3, 0x4, %g3
	ld	[%g2], %g1
	st	%g1, [%g3]

	add	%g2, 0x4, %g2				! 3
	add	%g3, 0x4, %g3
	ld	[%g2], %g1
	st	%g1, [%g3]

	add	%g2, 0x4, %g2				! 4
	add	%g3, 0x4, %g3
	ld	[%g2], %g1
	st	%g1, [%g3]

	add	%g2, 0x4, %g2				! 5
	add	%g3, 0x4, %g3
	ld	[%g2], %g1
	st	%g1, [%g3]

	add	%g2, 0x4, %g2				! 6
	add	%g3, 0x4, %g3
	ld	[%g2], %g1
	st	%g1, [%g3]

! now wake up threads 1 and/or tile 2 thread 0. they will execute the handler.
#if THREAD_STRIDE == 1
	set     0x101, %g4;
#elif THREAD_STRIDE == 2
	set     0x201, %g5;
#elif THREAD_STRIDE == 4
    set     0x401, %g5;
#endif
#if THREAD_STRIDE == 1
	stxa	%g4, [%g0] ASI_SWVR_UDB_INTR_W;	
#else
	stxa	%g5, [%g0] ASI_SWVR_UDB_INTR_W;	
#endif
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
