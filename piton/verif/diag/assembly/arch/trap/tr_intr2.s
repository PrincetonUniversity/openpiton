// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tr_intr2.s
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
 * Name:   tr_intr2.s
 * Date:   02/6/02
 *
 *  Description:
 *  	
 *     Interrupts
 * 	- Due to Tick match.
 *
 **********************************************************************/
/*******************************************************
 * My handler externsions
 *******************************************************/
#define H_T0_Division_By_Zero
#define	H_T0_Tag_Overflow
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

#define My_T0_Tag_Overflow wrpr %l2, %g0, %tstate;  done;
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

#define	My_T0_Interrupt_Level_14_0x4e  \
	sub	%i1, 0x1, %i3; \
	movrnz	%i1, %i3, %i1; \
	mov	0x1, %i2;  \
	brz,a	%i1, skip_asr21; \
	wr	%g0, %i2, %asr21; \
skip_asr21: rd	%softint, %i2;\
	retry;

#define	My_T0_Interrupt_Level_15_0x4f wrpr %g0, 0xf, %pil; retry;

#define My_T0_Division_By_Zero	\
movrnz	%i1, %i1, %i0; \
done;

/*******************************************************/

#define MAIN_PAGE_HV_ALSO
#include "boot.s"

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss

.text
.global main  

main:
	mov		0, %i0			! Failure flag
	mov		4, %i1			! Need to take tick match before udiv

	mov		0x4, %l6
	mov		0x0, %l7

tick_loop:
	ta		T_CHANGE_HPRIV
	wrpr		%g0, 0x0, %pil
  	mov   		%g0, %l0
	add		%l0, 0x4, %l1
	wr		%l1, 0x0, %asr23	!tick compare
	rd		%asr23, %l2
	wrpr		%l0, 0x4, %tick		! Should cause tick match interrupt: Bug #(486)
	ta		T_CHANGE_NONHPRIV
	nop
	nop
	nop
	nop
	udivx		%l0, %g0, %g0

	add		%l7, 0x1, %l7
	subcc		%l6, %l7, %g0
	bne,a		tick_loop
	nop

	brnz		%i0, test_fail
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
