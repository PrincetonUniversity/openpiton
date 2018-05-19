// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_int_stress1a.s
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
***  Test Description : interrupts
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
#define My_HT0_HTrap_Instruction_0	\
	stxa	%o0, [%g0] ASI_SWVR_UDB_INTR_W; \
	done;

#define H_HT0_Interrupt_0x60 intr0x60_custom_trap

#define MAIN_TEXT_DATA_ALSO

#include "boot.s"

.text
.global main

main:
ta      T_CHANGE_PRIV
setx	0x80, %l1, %l7
th_fork(th_main, %l0)

!----------------------
th_main_0:
	add	%g0, 0, %i0
	setx	user_data_start, %l1, %o1
ploop0:						! wait for the other
	brnz	%l7, ploop0
	st	%l7, [%o1]

	ba 	normal_end
	nop
!----------------------
th_main_1:
	add	%g0, 1, %i0
loop1:
	ba	loop1
	nop

!----------------------------
th_main_2:
th_main_3:
	add	%g0, 2, %i0
	setx	ploop0, %l1, %o1

loop2:
	ld	[%o1], %o2
	ba	loop2
	st	%o2, [%o1]
!----------------------------
th_main_4:

	add	%g0, 0x0, %o0

	add	%g0, 0x80, %l0

	setx	user_data_start, %l1, %o1

loop4:
	ld	[%o1], %i1
	ta	0x90	
loop4i:
	ld	[%o1], %i2
	sub	%i1, %i2, %i2
	brz	%i2, loop4i
	nop

	dec	%l0
	brnz	%l0, loop4
	nop

	ba 	normal_end
	nop

!----------------------------

th_main_5:
th_main_6:
th_main_7:
th_main_8:
th_main_9:
th_main_10:
th_main_11:
th_main_12:
th_main_13:
th_main_14:
th_main_15:
th_main_16:
th_main_17:
th_main_18:
th_main_19:
th_main_20:
th_main_21:
th_main_22:
th_main_23:
th_main_24:
th_main_25:
th_main_26:
th_main_27:
th_main_28:
th_main_29:
th_main_30:
th_main_31:
th_main_32:

	add	%g0, 0x100, %o0

inf_loop:
	ba	inf_loop
	ta	0x90

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
	.word	0x80
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
	ldxa	[%g0] ASI_SWVR_INTR_RECEIVE, %g2;
	ldxa	[%g0] ASI_SWVR_UDB_INTR_R, %g1;	
	brnz	%i0, bypass_dec
	nop
	dec %l7
bypass_dec:
	retry

!-----------------------------------------------------------------------

! this is the user defined producer trap.
.global intr0x190_custom_trap
intr0x190_custom_trap:
	stxa	%o0, [%g0] ASI_SWVR_UDB_INTR_W;	! send an interrupt
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


