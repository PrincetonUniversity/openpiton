// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tr_intr0.s
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
/***********************************************************************
 * Name:   tr_intr0.s
 * Date:   02/5/02
 *
 *
 *  Description:
 *  	
 *     Interrupts
 * 	Softinterrupts/PIL/Pstate
 *
 **********************************************************************/
/*******************************************************
 * My handler externsions
 *******************************************************/
#define	H_T0_Interrupt_Level_1_0x41
#define	H_T0_Interrupt_Level_2_0x42
#define	H_T0_Interrupt_Level_3_0x43
#define	H_T0_Interrupt_Level_4_0x44
#define	H_T0_Interrupt_Level_5_0x45
#define	H_T0_Interrupt_Level_6_0x46
#define	H_T0_Interrupt_Level_7_0x47
#define	H_T0_Interrupt_Level_8_0x48
#define	H_T0_Interrupt_Level_9_0x49
#define	H_T0_Interrupt_Level_10_0x4a
#define	H_T0_Interrupt_Level_11_0x4b
#define	H_T0_Interrupt_Level_12_0x4c
#define	H_T0_Interrupt_Level_13_0x4d
#define	H_T0_Interrupt_Level_14_0x4e
#define	H_T0_Interrupt_Level_15_0x4f

#define	My_T0_Interrupt_Level_1_0x41 wrpr %g0, 0xf, %pil; retry;
#define	My_T0_Interrupt_Level_2_0x42 wrpr %g0, 0xf, %pil; retry;
#define	My_T0_Interrupt_Level_3_0x43 wrpr %g0, 0xf, %pil; retry;
#define	My_T0_Interrupt_Level_4_0x44 wrpr %g0, 0xf, %pil; retry;
#define	My_T0_Interrupt_Level_5_0x45 wrpr %g0, 0xf, %pil; retry;
#define	My_T0_Interrupt_Level_6_0x46 wrpr %g0, 0xf, %pil; retry;
#define	My_T0_Interrupt_Level_7_0x47 wrpr %g0, 0xf, %pil; retry;
#define	My_T0_Interrupt_Level_8_0x48 wrpr %g0, 0xf, %pil; retry;
#define	My_T0_Interrupt_Level_9_0x49 wrpr %g0, 0xf, %pil; retry;
#define	My_T0_Interrupt_Level_10_0x4a wrpr %g0, 0xf, %pil; retry;
#define	My_T0_Interrupt_Level_11_0x4b wrpr %g0, 0xf, %pil; retry;
#define	My_T0_Interrupt_Level_12_0x4c wrpr %g0, 0xf, %pil; retry;
#define	My_T0_Interrupt_Level_13_0x4d wrpr %g0, 0xf, %pil; retry;
#define	My_T0_Interrupt_Level_14_0x4e wrpr %g0, 0xf, %pil; retry;
#define	My_T0_Interrupt_Level_15_0x4f wrpr %g0, 0xf, %pil; retry;

/*******************************************************/

#include "boot.s"

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss

.text
.global main  

main:
	ta		T_CHANGE_PRIV

	set		0x14, %l0		! Pstate.ie = 0
	set		0x16, %l1		! Pstate.ie = 1
	set		0xfffe, %l2		! All interrupt bits in softint register set

	! Loop with %pil at 0 and softint changing

	! Loop starts here - intr0_loop - expect 0x4e

	set		0, %g1			! loop iterator
	set		0x10, %g2		! N

	set		0x1, %g3		! holds the value to write to softint
	set		0x0, %g4

intr0_loop:

	wrpr		%g0, 0x0, %pil		! %g0 Immediates
	wr		%g4, %g3, %softint	! Bug #478 (need to issue additional tick (si))
						! Since g4 is ORed, we always take 0x4e
	
	or		%g3, %g4, %g4
	sll		%g3, 0x1, %g3

	add		%g1, 0x1, %g1		! loop stuff
	cmp		%g1, %g2
	bne,a		intr0_loop
	nop 

	! Loop starts here - intr1_loop - expect 0x4e, 0x41-0x4f

	set		0, %g1			! loop iterator
	set		0x10, %g2		! N

	set		0x1, %g3		! holds the value to write to %softint
	set		0x0, %g4

intr1_loop:

	wrpr		%g0, 0x0, %pil		! %g0 Immediates
	wr		%g0, %g3, %softint	! 
	
	sll		%g3, 0x1, %g3

	add		%g1, 0x1, %g1		! loop stuff
	subcc		%g1, %g2, %g0
	bne,a		intr1_loop
	nop 

	! Loop starts here - intr2_loop - expect 0x41-0x4f

	set		1, %g1			! loop iterator
	set		0x10, %g2		! N

	set		0x2, %g3		! holds the value to write to %softint
	set		0x0, %g4

intr2_loop:

	wrpr		%g0, 0x0, %pil		! %g0 Immediates
	wr		%g4, %g3, %softint	! 
	
	or		%g3, %g4, %g4
	sll		%g3, 0x1, %g3

	add		%g1, 0x1, %g1		! loop stuff
	subcc		%g1, %g2, %g0
	bne,a		intr2_loop
	nop 

	! Loop starts here - intr3_loop - expect no interrupts

	set		1, %g1			! loop iterator
	set		0x10, %g2		! N

	set		0x2, %g3		! holds the value to write to %softint
	set		0x0, %g4

intr3_loop:

	wrpr		%g0, %g1, %pil		! %g0 Immediates
	wr		%g4, %g3, %softint	! 
	
	or		%g3, %g4, %g4
	sll		%g3, 0x1, %g3

	add		%g1, 0x1, %g1		! loop stuff
	subcc		%g1, %g2, %g0
	bne,a		intr3_loop
	nop 

	! Loop starts here - intr4_loop - Expect interrupts due to change in pil

	set		1, %g1			! loop iterator
	set		0x10, %g2		! N

	set		0x2, %g3		! holds the value to write to %softint
	set		0x0, %g4

	set		0xfffe, %g5
	wrpr		%g0, 0xf, %pil		! %g0 Immediates
	set		0xf, %g6		! What to write into pil

intr4_loop:

	srl		%g5, %g1, %g7
	sll		%g7, 0x1, %g7		! Lower the interrupt

	wr		%g0, %g7, %softint	! 
	sub		%g6, 0x1, %g6
	wrpr		%g0, %g6, %pil		! Lower interrupt level

	add		%g1, 0x1, %g1		! loop stuff
	subcc		%g1, %g2, %g0
	bne,a		intr4_loop
	nop 

	! Focus on pstate.ie

	! Loop starts here - intr5_loop - Repeat above loop - Emphasis on pstate.ie

	set		1, %g1			! loop iterator
	set		0x10, %g2		! N

	set		0x2, %g3		! holds the value to write to %softint
	set		0x0, %g4

	set		0xfffe, %g5
	wrpr		%g0, 0xf, %pil		! %g0 Immediates
	set		0xf, %g6		! What to write into pil

intr5_loop:

	srl		%g5, %g1, %g7
	sll		%g7, 0x1, %g7		! Lower the interrupt

	wr		%g0, %g7, %softint	! 
	sub		%g6, 0x1, %g6
	wrpr		%g0, %l0, %pstate	! Disable
	wrpr		%g0, %g6, %pil		! Lower interrupt level
	wrpr		%g0, %l1, %pstate	! Enable

	add		%g1, 0x1, %g1		! loop stuff
	subcc		%g1, %g2, %g0
	bne,a		intr5_loop
	nop 

	! Focus on asr20
	! Loop starts here - intr6_loop - Repeat above loop - Emphasis on asr20

	set		0, %g1			! loop iterator
	set		0x10, %g2		! N

	wr		%g0, 0x0, %softint
	set		0x1, %g5

intr6_loop:

	wrpr		%g0, %g0, %pil		! Lower interrupt level
	wr		%g0, %g5, %asr20	! 
	wr		%g0, %g5, %asr21	! Clear softint
	sll		%g5, 0x1, %g5

	add		%g1, 0x1, %g1		! loop stuff
	subcc		%g1, %g2, %g0
	bne,a		intr6_loop
	nop 

	! Focus on asr21
	! Loop starts here - intr7_loop - Repeat above loop - Emphasis on asr21

	set		0, %g1			! loop iterator
	set		0x10, %g2		! N

	wr		%g0, %l2, %softint	! Set to 0xfffe
	set		0x8000, %g5

	set		0xe, %g3

intr7_loop:

	wr		%g0, %g5, %asr21	! Clear softint - cant set interrupt directly as a result clearing
	wrpr		%g0, %g3, %pil		! This wont cause interrupt
	sub		%g3, 0x1, %g3		! Decrement pil
	wrpr		%g0, %g3, %pil		! This causes interrupt
	srl		%g5, 0x1, %g5

	add		%g1, 0x1, %g1		! loop stuff
	subcc		%g1, %g2, %g0
	bne,a		intr7_loop
	nop 



/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
	ta		T_GOOD_TRAP

test_fail:
	ta		T_BAD_TRAP

/*******************************************************
 * My handler externsions
 *******************************************************/


/*******************************************************
 * Data section 
 *******************************************************/
.data
