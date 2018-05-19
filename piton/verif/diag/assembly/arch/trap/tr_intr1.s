// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tr_intr1.s
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
 * Name:   tr_intr1.s
 * Date:   02/6/02
 *
 *
 *  Description:
 *  	
 *     Interrupts
 * 	- Due to TSTATE.
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

#define My_T0_Division_By_Zero  done;
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
#define	My_T0_Interrupt_Level_14_0x4e wrpr %g0, 0xf, %pil; retry;
#define	My_T0_Interrupt_Level_15_0x4f wrpr %g0, 0xf, %pil; retry;

/*******************************************************/

#include "boot.s"

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss

.text
.global main  

attr_text {
        Name = .MAIN,
	VA=MAIN_BASE_TEXT_VA,
	RA=MAIN_BASE_TEXT_RA,
	tsbonly,
        part_0_i_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }
main:
	ta		T_CHANGE_PRIV

	set		0x14, %l6
	set		0x16, %l7
	set		0x1400, %l1		! Tstate.Pstate.ie = 0
	set		0x1600, %l2		! Tstate.Pstate.ie = 1
	

	setx		intr0_tpc, %l0, %l3	! to write to tpc

	add		%l3, 0x4, %l4


	! Loop starts here - intr0_loop - emphasis on pstate.ie = 1 thru retry

	set		0, %g1			! loop iterator
	set		0x10, %g2		! N

	set		0x1, %g3

intr0_loop:

	wrpr		%l6, 0x0, %pstate	! pstate.ie = 0
	wrpr		%g0, 0x0, %pil
	wr		%g0, %g3, %asr22	! This should cause interrupt but pstate.ie = 0
	wrpr		%g0, 0x1, %tl
	wrpr		%l3, 0x0, %tpc
	wrpr		%l4, 0x4, %tnpc		! udivx will be executed twice
	wrpr		%l2, 0x0, %tstate	
	retry					! This should cause interrupt - pstate.ie will be become 1

intr0_tpc:
	udivx		%l1, %g0, %g0
	nop

	sll		%g3, 0x1, %g3

	add		%g1, 0x1, %g1		! loop stuff
	subcc		%g1, %g2, %g0
	bne,a		intr0_loop
	nop 

	! This time thru real trap
	! Loop starts here - intr1_loop - emphasis on pstate.ie = 1 thru retry

	set		0, %g1			! loop iterator
	set		0x10, %g2		! N

	set		0x1, %g3

intr1_loop:

	wrpr		%l6, 0x0, %pstate	! pstate.ie = 0
	wrpr		%g0, 0x0, %pil
	wr		%g0, %g3, %asr22	! This should cause interrupt but pstate.ie = 0

	taddcctv	%g0, 0x1, %g0		! When coming out of this trap handler, interrupt is signalled
	udivx		%l1, %g0, %g0		! Interrupt needs to be handled before this trap

	sll		%g3, 0x1, %g3

	add		%g1, 0x1, %g1		! loop stuff
	subcc		%g1, %g2, %g0
	bne,a		intr1_loop
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
