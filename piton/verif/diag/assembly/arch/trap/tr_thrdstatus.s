// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tr_thrdstatus.s
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
 * Name:   tr_thrdstatus.s
 * Date:   06/07/02
 *
 *
 *  Description:
 *  	
 *     - Do a tick interrupt when thread is active
 *     - Do a tick interrupt after thread is idle.
 *
 **********************************************************************/

/*******************************************************
 * My handler externsions
 *******************************************************/
#define H_T0_Tag_Overflow
#define My_T0_Tag_Overflow  done;

#define H_T0_Division_By_Zero
#define My_T0_Division_By_Zero  done;

#define	H_T0_Interrupt_0x60

#define H_T0_Trap_Instruction_0

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

#define My_T0_Trap_Instruction_0	done;

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
#define	My_T0_Interrupt_Level_14_0x4e	\
				rd	%softint, %g1; \
				wr	%g0, 0, %softint; \
				wrpr	%l0, %tnpc;\
				done;
#define	My_T0_Interrupt_Level_15_0x4f wrpr %g0, 0xf, %pil; retry;

#define	My_T0_Interrupt_0x60	\
	ldxa	[%g0] 0x72, %l7; \
	ldxa	[%l0] 0x74, %l4; \
	ldxa	[%l1] 0x74, %l5; \
	ldxa	[%l2] 0x74, %l6; \
	stxa	%g0, [%g0] 0x72; \
	retry;

/*******************************************************/

#define MAIN_PAGE_HV_ALSO
#include "boot.s"

.text
.global main  
main:

	ta		T_CHANGE_HPRIV

	rdpr		%pil, %l0
	wrpr		%g0, %pil

test_tick:
	setx		resume_from_tick_intr, %g1, %l0
	wr		%g0, 100, %asr23	!tick compare to happen
	wrpr		%g0, %tick		!100 * 4 cycles from here
	ta		T_CHANGE_NONHPRIV

	set		200, %g2
loop0:						!loop to wait for tick intr to happen
	rd		%tick, %g3
	rd		%softint, %g4
	dec		%g2
	brgz		%g2, loop0
	 nop

	ta		T_BAD_TRAP		!come here only if tick intr not generated
resume_from_tick_intr:


test_thrd_idle:
	setx		resume_from_idle, %g1, %l0
	b		iline_aligned
	 nop

	.align		32
iline_aligned:
	ta		T_CHANGE_HPRIV
	wr		%g0, 600, %asr23	!tick compare to happen
	wrpr		%g0, %tick		! 600 cycles from here
	ta		T_CHANGE_NONHPRIV

	ta		T_CHANGE_PRIV
	rd              %asr26, %g1             !rd thrd_status
	and             %g1, 6, %g1             !keep bit[2:1]
	wr              %g1, %asr26             !set thrd to idle

	rd		%tick, %g3		!should never come here
	rd		%softint, %g4
	ta		T_BAD_TRAP

resume_from_idle:
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

