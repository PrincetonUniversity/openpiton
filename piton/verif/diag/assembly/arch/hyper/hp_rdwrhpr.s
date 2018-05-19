// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hp_rdwrhpr.s
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
 * Name:   hp_rdwrhpr.s
 *
 * Description:
 *	Self-checking diag to make sure executing rdhpr and wrhpr
 *      in user or supervisor mode results in illegal instruction
 *      trap. 
 **********************************************************************/

#define MAIN_PAGE_HV_ALSO
#include "boot.s"

.text
.global	main

/***********************************************************************/
main:
	! enable illegal instruction trap 
	mov		0x10, %o0
	ta 		T_HTRAP_EN

	! this should cause illegal instruction trap
	rdhpr		%hpstate, %g1
	cmp		%o0, 0x0
	bne		test_fail
	nop

	mov		0x10, %o0
	! this should cause illegal instruction trap
	wrhpr		%g0, 0x4, %hpstate
	cmp		%o0, 0x0
	bne		test_fail
	nop

	! change to supervisor
	ta		T_CHANGE_PRIV

	mov		0x10, %o0
	! this should cause illegal instruction trap
	rdhpr		%hpstate, %g1
	cmp		%o0, 0x0
	bne		test_fail
	nop

	mov		0x10, %o0
	! this should cause illegal instruction trap
	wrhpr		%g0, 0x4, %hpstate
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
