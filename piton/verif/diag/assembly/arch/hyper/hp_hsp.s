// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hp_hsp.s
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
 * Name:   hp_hsp.s
 *
 * Description:
 *	Self-checking diag to test Hstick match interrupt. 
 **********************************************************************/

#define MAIN_PAGE_HV_ALSO
#include "boot.s"

.text
.global	main

/***********************************************************************/
.align 64
main:
	ta		T_CHANGE_HPRIV

        ! disable interrupt PSTATE.ie=0
        rdpr            %pstate, %g1
        and             %g1, 0x0ffd, %g1
        wrpr            %g1, 0x0, %pstate

	! make sure HINTP.hsp=0
	wrhpr		%g0, 0x0, %hintp

	! set STICK to zero
	wr		%g0, 0x0, %asr24

	! set HSTICK_COMPARE to 0x40
	wrhpr		%g0, 0x40, %hsys_tick_cmpr

	! spin-loop to wait for counter to match
	mov		0x40, %l0
loop1:
	brnz		%l0, loop1
	dec		%l0

	! check for HINTP.hsp=1
	rdhpr		%hintp, %g1
	cmp		%g1, 0x1
	bne		test_fail
	nop


	! clear HINTP.hsp
	wrhpr		%g0, 0x0, %hintp

        ! enable interrupt PSTATE.ie=1
        rdpr            %pstate, %g1
        or              %g1, 0x2, %g1
        wrpr            %g1, 0x0, %pstate

        ! enable HSTICK_MATCH trap 
	mov		0x5e, %o0
	ta		T_HTRAP_EN

	! set STICK to zero
	wr		%g0, 0x0, %asr24

	! set HSTICK_COMPARE to 0x40
	wrhpr		%g0, 0x40, %hsys_tick_cmpr

	! spin-loop to wait for counter to match
	mov		0x40, %l0
loop2:
	brnz		%l0, loop2
	dec		%l0

	! check to see if trap happened
	cmp		%o0, 0x0
	bne		test_fail
	nop


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
