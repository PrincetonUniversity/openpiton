// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tick_access.s
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
 * Name:   tick_access
 * Date:   05/23/02-11:30
 *
 * Description:
 *	Self-Checking;
 *	* priv=1: wrpr/rdpr/rd %tick, check r/w bits and read-only bits
 * 	* priv=0: rd tick OK if tick[63]=0, priv_action trap if tick[63]=1
 *
 **********************************************************************/

#define H_HT0_Privileged_Action_0x37
#define My_HT0_Privileged_Action_0x37	\
			wrpr	%l6, 0, %tnpc;	\
			done;

#define MAIN_PAGE_HV_ALSO
#include "boot.s"


#define check_tick(curr, prev, diff) \
	and	curr, 3, %g6;		/*lower 2 bits are 0s*/ \
	cmp	%g6, 0;				\
	tne	T_BAD_TRAP;			\
	sub	curr, prev, %g6;		\
	cmp	%g6, diff;		/*difference < diff*/\
	tge	T_BAD_TRAP;			\
	cmp	%g6, 0;			/*0<= difference*/\
	tl	T_BAD_TRAP;			\
		

.text
	.global	main

/****************************************************** Code ***********/
main:
	set	1, %g7
	setx	0xf123456789abcdef, %l0, %l7    ! tick.npt=0
	setx	no_check, %l0, %l6
	b	loop
	 nop

	.align 32
loop:
	ta	T_CHANGE_HPRIV		!same iline
	wrpr	%l7,0,%tick		!same iline
	rdpr	%tick, %g1		!same iline
	rd	%tick, %g2		!same iline
	! rdpr	%tick, %g1		!same iline

#define SELF_CHECK
#ifdef SELF_CHECK
	check_tick(%g1, %l7, 10)	!check rdpr %g1
	check_tick(%g2, %g1, 10)	!check rd   %g2
#endif

	ta	T_CHANGE_NONHPRIV
	rd	%tick, %g2		!trap when %g7==1
	cmp	%g7, 1			!to be done over when %g7=1
	te	T_BAD_TRAP		!to to done over when %g7=1

	check_tick(%g2, %l7, 130)	!check rd   %g2
	
 no_check:
	setx	0x789abcde1234567f, %l0, %l7    ! tick.npt=0
	brnz	%g7, loop
	 dec	%g7
	
	! ta	T_CHANGE_PRIV

/*******************************************************
 * Exit code
 *******************************************************/
test_pass:
PASS:						/*jump here if PASS*/
	ta	T_GOOD_TRAP

test_fail:
FAIL:						/*jump here if FAIL*/
	ta	T_BAD_TRAP
	

/*******************************************************
 * Data section
 *******************************************************/
.data
	! put your data here
	.word	0xdeadbeef
