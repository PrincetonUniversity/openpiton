// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_prod_cons_intr2.s
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
***  Test Description : trying producer consumer with interrupts.
***  thread count 0 produces to 3, thr 1 to 4, thr 2 to 5
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

#define my_id_reg			%i0
#define my_id_reg_shifted		%i1
#define other_id_reg_shifted		%i2
#define intr_vec_reg			%i3

#define addr_reg			%o0

#define help_reg0			%l0
#define help_reg1			%l1
#define help_reg2			%l2
#define help_reg3			%l3

#define help_reg4			%l4
#define help_reg5			%l5
#define help_reg6			%l6

#define	ITERATIONS 10
#define	THREAD_COUNT			6

#include "boot.s"

.text
.global main

main:

	setx 	my_hyp_data, help_reg0, addr_reg;		
	th_fork(th_main, help_reg0)

!====================================================
! producer
!====================================================
th_main_0:
	set	0x0, my_id_reg
	sll	my_id_reg, 0x3, my_id_reg_shifted

	add	my_id_reg, 0x3, other_id_reg_shifted
	sll	other_id_reg_shifted, 0x3, other_id_reg_shifted

	mov	%g0,   help_reg2

	set	0xbeef, help_reg3			! prepare the data

! prepare the interrupt vector number 
	add	my_id_reg, 0x3, help_reg0		! 0 becomes 3, e.t.c.
	sll	help_reg0, 0x8, intr_vec_reg		! move to b8 and above
	add	intr_vec_reg, help_reg0, intr_vec_reg	! add my_id_reg; 

	setx	user_data_start, help_reg4, help_reg5
ploop0:						! wait for the consumer to 
	ld	[help_reg5], help_reg6		! become ready to accept
	brz	help_reg6, ploop0		! interrupts

	set 	ITERATIONS, %g1;			
loop0:
	mov 	help_reg2, help_reg1
	ta	0x30				! the trap issues an interrupt

wait_loop0:
	subcc	help_reg2, help_reg1, %g0	! wait for help_reg2 to grow
	be	wait_loop0
	nop

	deccc	%g1;				! iterate
	bne	loop0
	nop;					

	ba	normal_end
	nop

!====================================================
! producer
!====================================================
th_main_1:
	set	0x1, my_id_reg
	sll	my_id_reg, 0x3, my_id_reg_shifted

	add	my_id_reg, 0x3, other_id_reg_shifted
	sll	other_id_reg_shifted, 0x3, other_id_reg_shifted

	mov	%g0,   help_reg2

	set	0xbeef, help_reg3
	add	my_id_reg, 0x3, help_reg0		! 0 becomes 3, e.t.c.
	sll	help_reg0, 0x8, intr_vec_reg		! put it in b8 
	add	intr_vec_reg, help_reg0, intr_vec_reg	! add my_id_reg;

	setx	user_data_start, help_reg4, help_reg5
preliminary_loop_1:					! wait for consumer
	ld	[help_reg5 + 4], help_reg6		! to be ready to 
	brz	help_reg6, preliminary_loop_1		! accept intrrupts


	set 	ITERATIONS, %g1;			
loop1:
	mov 	help_reg2, help_reg1
	ta	0x30				! the trap issues an interrupt

wait_loop1:
	subcc	help_reg2, help_reg1, %g0	! wait for help_reg2 to grow
	be	wait_loop1
	nop

	deccc	%g1;				! iterate
	bne	loop1
	nop;					

	ba	normal_end
	nop

!====================================================
! producer
!====================================================
th_main_2:
	set	0x2, my_id_reg
	sll	my_id_reg, 0x3, my_id_reg_shifted

	add	my_id_reg, 0x3, other_id_reg_shifted
	sll	other_id_reg_shifted, 0x3, other_id_reg_shifted

	mov	%g0,   help_reg2

	set	0xbeef, help_reg3
	add	my_id_reg, 0x3, help_reg0		! 0 becomes 3, e.t.c.
	sll	help_reg0, 0x8, intr_vec_reg		! put it in b8 
	add	intr_vec_reg, help_reg0, intr_vec_reg	! add my_id_reg

	setx	user_data_start, help_reg4, help_reg5
preliminary_loop_2:
	ld	[help_reg5 + 8], help_reg6
	brz	help_reg6, preliminary_loop_2

	set 	ITERATIONS, %g1;			
loop2:
	mov 	help_reg2, help_reg1
	ta	0x30

wait_loop2:
	subcc	help_reg2, help_reg1, %g0
	be	wait_loop2
	nop

	deccc	%g1;				
	bne	loop2
	nop;					

	ba	normal_end
	nop

!====================================================
! consumer
!====================================================
th_main_3:
	set	0x3, my_id_reg
	sll	my_id_reg, 0x3, my_id_reg_shifted
	mov	%g0,   help_reg2

	setx	user_data_start, help_reg4, help_reg5
	st	help_reg5, [help_reg5]

wait_loop3:				! wait for help_reg2 to grow 
	subcc	help_reg2, ITERATIONS, help_reg1
	brnz	help_reg1, wait_loop3
	nop

	ba	normal_end
	nop

!====================================================
! consumer
!====================================================
th_main_4:
	set	0x4, my_id_reg
	sll	my_id_reg, 0x3, my_id_reg_shifted
	mov	%g0,   help_reg2

	setx	user_data_start, help_reg4, help_reg5
	st	help_reg5, [help_reg5 + 4]

wait_loop4:
	subcc	help_reg2, ITERATIONS, help_reg1
	brnz	help_reg1, wait_loop4
	nop

	ba	normal_end
	nop

!====================================================
! consumer
!====================================================
th_main_5:
	set	0x5, my_id_reg
	sll	my_id_reg, 0x3, my_id_reg_shifted
	mov	%g0,   help_reg2

	setx	user_data_start, help_reg4, help_reg5
	st	help_reg5, [help_reg5 + 8]

wait_loop5:
	subcc	help_reg2, ITERATIONS, help_reg1
	brnz	help_reg1, wait_loop5
	nop

	ba	normal_end
	nop

!====================================================
normal_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

user_text_end:

/***********************************************************************
   Test case data start
 ***********************************************************************/
.align 0x40
.data
user_data_start:
	.word	0x0
	.word	0x0
	.skip 1000
user_data_end:

SECTION .MY_HYP_SEC TEXT_VA = 0x1100150000, DATA_VA = 0x1100160000
attr_text {
        Name=.MY_HYP_SEC,
        hypervisor
	}

.global intr0x60_custom_trap
intr0x60_custom_trap:
	ldx	[addr_reg + my_id_reg_shifted], %g3;	! get data
	ldxa	[%g0] ASI_SWVR_INTR_RECEIVE, %g2;
	ldxa	[%g0] ASI_SWVR_UDB_INTR_R, %g1;		! get vector
	subcc	%g2, 0x1, %g0;				! figure out thread
	be	thr0
	nop;					

	subcc	%g2, 0x2, %g0;	
	be	thr1
	nop;					

	subcc	%g2, 0x4, %g0;	
	be	thr2
	nop;					

	subcc	%g2, 0x8, %g0;	
	be	thr3
	nop;					

	subcc	%g2, 0x10, %g0;	
	be	thr4
	nop;					

	subcc	%g2, 0x20, %g0;	
	be	thr5
	nop;					

	ta	T_BAD_TRAP

! producers
!----------
thr0:
thr1:
thr2:
	inc	help_reg2;					! increment reg 
	stx	help_reg2, [addr_reg + other_id_reg_shifted]	! noise
	retry;

! consumer
!---------
thr3:
	set 	0x0, %g4			! check data
	subcc	%g3, %g4, %g4
	brz	%g4, hok3
	nop
	ta	T_BAD_TRAP
hok3:
	set	0x0, %g1;			! cause intr0 to thread 0.
	stxa	%g1, [%g0] ASI_SWVR_UDB_INTR_W;	
	inc	help_reg2;			
	stx	%g1,       [addr_reg + my_id_reg_shifted]	! noise
	retry;

! consumer
!---------
thr4:
	set 	0x1, %g4			! check data
	subcc	%g3, %g4, %g4
	brz	%g4, hok4
	nop
	ta	T_BAD_TRAP
hok4:
	set	0x101, %g1;			! cause intr1 to thread 1
	stxa	%g1, [%g0] ASI_SWVR_UDB_INTR_W;	
	inc	help_reg2;			
	stx	%g1,       [addr_reg + my_id_reg_shifted]	! noise
	retry;

! consumer
!---------
thr5:
	set 	0x2, %g4			! check data
	subcc	%g3, %g4, %g4
	brz	%g4, hok5
	nop
	ta	T_BAD_TRAP
hok5:
	set	0x202, %g1;			! cause intr2 to thread 2
	stxa	%g1, [%g0] ASI_SWVR_UDB_INTR_W;	
	inc	help_reg2;			
	stx	%g1,       [addr_reg + my_id_reg_shifted]	! noise
	retry;

!============================================================================

.global intr0x190_custom_trap
intr0x190_custom_trap:

! write bad datum then good datum and then cause an interrupt.
	stx	help_reg3,	[addr_reg + other_id_reg_shifted]
	stx	my_id_reg, 	[addr_reg + other_id_reg_shifted]
	stxa	intr_vec_reg, 	[%g0] ASI_SWVR_UDB_INTR_W;	
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


