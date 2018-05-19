// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tr_dctired0.s
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
 * Name:   tr_dctired0.s
 * Date:   02/8/02
 *	* fix undefined sequnce 'return; done' in My_T0_Trap_Instruction_0
 *
 *  Description:
 *  	
 * 	Emphasis on exceptions in the delay slot of dcti instructions.
 *	Also takes machine into red mode brings it back.
 *
 **********************************************************************/

#define	ASI_PHYS_USE_EC		0x14
#define	FAIL()		ta T_BAD_TRAP

/*******************************************************
 * My handler externsions
 *******************************************************/
#define H_T0_Tag_Overflow
#define My_T0_Tag_Overflow  done;

#define H_T0_Division_By_Zero
#define My_T0_Division_By_Zero  done;

#define TRAP_NUM		T_TRAP_INST0
#define H_T0_Trap_Instruction_0
#ifdef ORIGINAL_CODE
#define My_T0_Trap_Instruction_0 return %.1; done;
#else
#define My_T0_Trap_Instruction_0			\
			brz,a	%o3, ta_tgt;	\
			 restore; 			\
		ta_tgt:				\
			rdpr %cwp, %o2;			\
			add  %o1, 4, %o1; 		\
			wrpr %o1, %tnpc;		\
			done;
#endif

#define	H_T0_Interrupt_Level_14_0x4e
#define	My_T0_Interrupt_Level_14_0x4e wrpr %g0, 0xf, %pil; retry;

#define H_T1_Window_Fill_7_Normal_Trap
#define My_T1_Window_Fill_7_Normal_Trap restore %g1, %g1, %g0; retry;

#define H_T0_Window_Fill_7_Normal_Trap
#define My_T0_Window_Fill_7_Normal_Trap restored; retry;

#define	MAX_TL	0x6

#define H_HT0_Reserved_0x02 my_watchdog_reset

/*******************************************************/

#include "boot.s"

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss

.text
.global main  

main:
	ta		T_CHANGE_PRIV

	call		init_reg
	 nop

	mov		%i1, %g1		!expose old value of %i1
	setx		tgt1, %l0, %i1		!to be "done'd over"
	wrpr		%g0, 0, %cwp		!to make %i1 permanent

	mov		%g0, %o3		!%o3 as a flag of return

	ba		tgt1
	 ta		%icc, TRAP_NUM		!done over %i1 (i.e. %o1 after restore or return)

tgt1:
	FAIL()					!skipped over

	setx		tgt4, %l0, %i1		!to be "done'd over"
	setx		tgt3, %l0, %i3
	return		%i3
	 ta		%icc, TRAP_NUM		!done over %i1

tgt3:
	FAIL()
	
tgt4:
	FAIL()
	rdpr	%cwp, %l0

	b	test_pass
	 nop

init_reg:
	mov	%g0, %g1
	mov	%g0, %g2
	mov	%g0, %g3
	mov	%g0, %g4
	mov	%g0, %g5
	mov	%g0, %g6
	mov	%o7, %g7		!return addr

	setx	0xdeadbabe00000000, %g2, %g1
	set	7, %g2
init_reg_loop:
	wrpr	%g2, %cwp		!change cwp from 7 to 1
	sll	%g2, 16, %g3
	add	%g3, %g1, %g3

	mov	%g3, %o0; inc %g3
	mov	%g3, %o1; inc %g3
	mov	%g3, %o2; inc %g3
	mov	%g3, %o3; inc %g3
	mov	%g3, %o4; inc %g3
	mov	%g3, %o5; inc %g3
	mov	%g3, %o6; inc %g3
	mov	%g3, %o7; inc %g3
	mov	%g3, %l0; inc %g3
	mov	%g3, %l1; inc %g3
	mov	%g3, %l2; inc %g3
	mov	%g3, %l3; inc %g3
	mov	%g3, %l4; inc %g3
	mov	%g3, %l5; inc %g3
	mov	%g3, %l6; inc %g3
	mov	%g3, %l7

	brz	%g2, init_reg_done
	 sub	%g2, 1, %g2
	b	init_reg_loop
	 nop

init_reg_done:
	jmp	%g7+8
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


SECTION .USER_TRAP_FOR_HYP TEXT_VA=0x13002000
attr_text {
        Name = .USER_TRAP_FOR_HYP,
        hypervisor
        }
.global my_watchdog_reset
my_watchdog_reset:
rdpr	%cleanwin, %g1;	
rdpr	%otherwin, %g1;	
rdpr	%cansave, %g1;
wrpr	%g0, MAX_TL, %canrestore;
wrpr	%g0, %cansave;
rdpr	%tpc, %l6;
wrpr 	%g0, 0x14, %pstate;
mov	0xf, %l7;
stxa 	%l7, [%g0] ASI_LSU_CTL_REG;
jmp 	%l6;
wrhpr   %g0, 0x800, %hpstate
