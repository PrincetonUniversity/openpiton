// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tr_sir0.s
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
 * Name:   tr_sir0.s
 * Date:   02/7/02
 *
 *
 *  Description:
 *  	
 *     Interrupts
 * 	Software initiated reset trap testing with other traps.
 *
 **********************************************************************/
/*******************************************************
 * My handler externsions
 *******************************************************/
#define	H_T0_Division_By_Zero
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

#define	My_T0_Division_By_Zero done;
#define	My_T0_Tag_Overflow  done;
!#define	My_Software_Initiated_Reset jmp %l2; stxa %l1, [%g0] ASI_LSU_CTL_REG;
#define	My_Software_Initiated_Reset \
wrpr %g0, 0x0, %tl; \
wrpr %g0, 0x0, %gl; \
ldxa [%g0] ASI_LSU_CTL_REG, %i0 ;  \
stxa %l1, [%g0] ASI_LSU_CTL_REG;   \
wrpr %g0, 0x16, %pstate; \
wrhpr   %g0, 0x804, %hpstate; \
jmp %l2; \
wrhpr   %g0, 0x800, %hpstate;

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

#include "enable_traps.h"
#include "boot.s"

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss

attr_text {
        Name = .MAIN,
	VA=MAIN_BASE_TEXT_VA,
	RA=MAIN_BASE_TEXT_RA,
	tsbonly,
        part_0_i_ctx_zero_ps0_tsb,
        TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }

.text
.global main  

#define	LSU_CTL_REG_DATA	0xf

main:

	mov		LSU_CTL_REG_DATA, %l1

	sir
	ta		T_CHANGE_PRIV

	setx		sir_label1, %l0, %l2
	sir					! bug #490

sir_label1:

	! Long latency instruction

	setx		sir_label2, %l0, %l2
	udivx		%l2, %g0, %l2

	sir

sir_label2:


	! Loop with %pil at 0 and asr22 changing

	! Loop starts here - intr0_loop - expect 0x4e

	setx		sir_label3, %l0, %l2

	set		0, %g1			! loop iterator
	set		0x10, %g2		! N

	set		0x1, %g3		! holds the value to write to %asr22
	set		0x0, %g4

intr0_loop:

	wrpr		%g0, 0x0, %pil		! %g0 Immediates

	sir
	wr		%g4, %g3, %asr22	
						
sir_label3:
	
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
