// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tr_asiintr0.s
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
 * Name:   tr_asiintr0.s
 * Date:   02/8/02
 *
 *
 *  Description:
 *  	
 *     Interrupts
 * 	Interrupt thru ASI.
 *	Also tests prioritization among various exceptions.
 *
 **********************************************************************/

/*******************************************************
 * My handler externsions
 *******************************************************/
#define H_T0_Tag_Overflow
#define My_T0_Tag_Overflow  done;

#define H_T0_Division_By_Zero
#define My_T0_Division_By_Zero  done;

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

#define	H_HT0_Interrupt_0x60
#define	My_HT0_Interrupt_0x60	\
ldxa	[%g0] 0x72, %l7; \
ldxa	[%l0] 0x74, %l4; \
ldxa	[%l1] 0x74, %l5; \
ldxa	[%l2] 0x74, %l6; \
stxa	%g0, [%g0] 0x72; \
retry;

/*******************************************************/
! some defines here

#ifndef	ASI_SWVR_UDB_INTR_R
#define ASI_SWVR_UDB_INTR_R 0x74
#endif

#ifndef	ASI_SWVR_INTR_RECEIVE
#define ASI_SWVR_INTR_RECEIVE 0x72
#endif

#ifndef	ASI_SWVR_UDB_INTR_W
#define ASI_SWVR_UDB_INTR_W 0x73
#endif

#ifndef	ASI_BASE_LIMIT_REG
#define ASI_BASE_LIMIT_REG 0x4F
#endif

! This is not supported
#ifndef	ASI_INTR_DISPATCH_STATUS				
#define ASI_INTR_DISPATCH_STATUS 0x48
#endif

#define H_HT0_HTrap_Instruction_1
#define My_HT0_HTrap_Instruction_1 done; 

#define H_HT0_HTrap_Instruction_0
#define My_HT0_HTrap_Instruction_0 stxa %o0, [%g0] ASI_SWVR_UDB_INTR_W;  done;

#include "boot.s"

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss

.text
.global main  


main:

	ta		T_CHANGE_PRIV

	setx		0xabcdefabcdefabcd, %i0, %i1

	set		0x40, %l0
	set		0x50, %l1
	set		0x60, %l2
	set		0x70, %l3

	! Loop with %pil at 0 and asr22 changing
	! Loop starts here - intr0_loop - expect 0x4e

	set		0, %g1			! loop iterator
	set		0x10, %g2		! N
	set		0x0, %o0		! Interrupt type - to self

	set		0x1, %g3		! holds the value to write to %asr22
	set		0x0, %g4

intr0_loop:

	wrpr		%g0, 0x14, %pstate			! disable interrupts

	ta  		T_HTRAP_INST0

	wrpr		%g0, 0x0, %pil		! %g0 Immediates
	wr		%g4, %g3, %asr22	! Bug #478 (need to issue additional tick (si))
						! Since g4 is ored, we always take 0x4e
	wrpr		%g0, 0x16, %pstate	! enable interrupts
	ta		T_HTRAP_INST1		! Three traps waiting here (0x60, 0x4x, ta)
	udivx		%g0, %g0, %g0
	taddcctv	%g0, 0x1, %g0
	
	or		%g3, %g4, %g4
	sll		%g3, 0x1, %g3

	add		%g1, 0x1, %g1		! loop stuff
	subcc		%g1, %g2, %g0
	bne,a		intr0_loop
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


