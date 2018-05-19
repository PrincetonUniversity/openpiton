// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tr_wdrred12.s
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
 * Name:   tr_wdrred12.s
 * Date:   05/08/02
 *
 *
 *  Description:
 *      sir with other traps in red mode.
 *	--> Variation of tr_wdrred1.s, set pstate.red in the delay slot of
 *	    jmp, which goes to RED_Mode_Other_Reset.
 *
 **********************************************************************/

#define	FAIL()			ta T_BAD_TRAP
#define	FAIL1()			wrpr %g0, %tl; ta T_BAD_TRAP
/********************************************************************
 * Redefine Main addresses so that address translation is not needed
 *********************************************************************/
#define MAIN_PAGE_HV_ALSO

/*
#define MAIN_BASE_TEXT_ADDR_PA   0x100150000
#define MAIN_BASE_TEXT_ADDR MAIN_BASE_TEXT_ADDR_PA
 */

        
/*******************************************************
 * My handler externsions
 *******************************************************/
#define H_T0_Tag_Overflow
#define My_T0_Tag_Overflow  done;

#define H_T0_Division_By_Zero
#define My_T0_Division_By_Zero  done;


#define TRAP_NUM			0x20
#define H_HT0_Trap_Instruction_0
#define My_HT0_Trap_Instruction_0	FAIL1()

#define	H_HT0_Interrupt_Level_14_0x4e
#define	My_HT0_Interrupt_Level_14_0x4e wrpr %g0, 0xf, %pil; retry;

#define H_T1_Window_Fill_7_Normal_Trap
#define My_T1_Window_Fill_7_Normal_Trap		restore; retry;

#define H_T0_Window_Fill_7_Normal_Trap
#define My_T0_Window_Fill_7_Normal_Trap		\
		restored; /*wrpr %g0, 1, %canrestore;*/	\
		retry;				\
		nop;
		/* why this fail? restored; retry; nop; */

#define H_HT0_Window_Fill_7_Normal_Trap
#define My_HT0_Window_Fill_7_Normal_Trap		\
		restored; \
		retry; \
		nop;

#define	MAX_TL	0x6

! Turn of priv so, it's all
#define	My_Watchdog_Reset \
	sub	%o0, 0x1, %o0; \
	brnz,a	%o0, red_tgt1; \
	retry; \
	red_tgt1: wrpr	%g0, 0x1, %tl; \
	rdpr	%tnpc, %l6; \
	mov	0xf, %l7; \
	jmp 	%l6; \
	stxa 	%l7, [%g0] ASI_LSU_CTL_REG;

#define	My_Software_Initiated_Reset	\
		sir	1;		\
    red_tgt3:	setx	tgt2, %g1, %g2; \
		jmp	%g2;


#define My_RED_Mode_Other_Reset \
		nop; /*delay slot of the jmp in My_Software_Initiated_Reset*/	\
		sir	0;		\
    diag_cont_1:ba	red_tgt2;	\
	 	ta	%icc, TRAP_NUM;	\
    		FAIL1();		\
    red_tgt2:				\
		b	red_tgt3;	\
		 nop;


/*******************************************************/

#include "boot.s"

.global tgt2

.text
.global main  

	RED_Mode_Other_Reset = 0x000000fff00000a0
main:

	ta		T_CHANGE_HPRIV	/* red-mode is only setable thru hpstate */

#if INIT_WIN_REG
	call		init_reg		!only to show where the staled data coming from
	 nop
#endif

	mov	MAX_TL, %o0		! just a flag
	set	0x824,	%l1
	setx	RED_Mode_Other_Reset+8, %g1, %g2		!right after 'sir 0'
	jmpl	%g2, %o6		!return to tgt2
	wrhpr	%l1, 0x0, %hpstate	! RED=1
	nop

	FAIL1()

/* come here after recover from nested error-state, cwp=0 */
tgt2:
	wrpr		%g0, 0x0, %tl		! no more red mode traps
	set	0x804,	%l1
	wrhpr		%l1, 0x0, %hpstate
	set		0x123400, %i2		!w0%i2 -> w7%o2

	set		7, %l2
	wrpr		%l2, %cwp		!move to w7
	setx		test_fail, %l0, %l3	!w7%l3 <- test_fail

	wrpr		%g0, %cwp		!move back to w0
	setx		tgt3, %l0, %l3
/* #define TEST_RESTORE */
#if defined(TEST_RESTORE)
	return		%l3			!trapped and retry
#else
	mov		%l3, %g3
	return		%g3			!trapped and retry
#endif
	 nop

	FAIL()
tgt3:
	rdpr	%cwp, %g2			!cwp=7
	cmp	%g2, 7
	tne	T_BAD_TRAP

	set	0x123400, %g2
	cmp	%o2, %g2			!w7%o2
	tne	T_BAD_TRAP

	setx	test_fail, %l0, %l2
	cmp	%l3, %l2			!w7%l3
	tne	T_BAD_TRAP
	
	

/*******************************************************
 * Exit code
 *******************************************************/

test_pass:
	ta		T_GOOD_TRAP

test_fail:
	ta		T_BAD_TRAP

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
 * My handler externsions
 *******************************************************/



/*******************************************************
 * Data section 
 *******************************************************/
.data

