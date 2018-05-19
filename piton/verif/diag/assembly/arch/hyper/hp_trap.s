// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hp_trap.s
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
 * Name:   hp_trap.s
 *
 * Description:
 *	Self-checking diag to test traps going
 *	from user mode -> supervisor mode
 *	from supervisor mode -> hypervisor mode
 *
 * 	This diag uses the following traps:
 *	illegal instruction
 *	divide by zero
 **********************************************************************/

#define MAIN_PAGE_HV_ALSO
#include "boot.s"

.text
.global	main


/***********************************************************************/
main:
	! enable illegal instruction trap
	set		0x10, %o0
	ta		T_HTRAP_EN
	nop
  
	! reading %asr1 should cause an illegal
	! instruction trap from user to hypervisor
	rd		%asr1, %g1

        cmp		%o0, 0
        bne		diag_fail
        nop

	ta		T_CHANGE_PRIV
        mov		0x1, %o0

	! reading %asr1 should cause an illegal
	! instruction trap from supervisor to hypervisor
	rd		%asr1, %g1

        cmp		%o0, 0
        bne		diag_fail
        nop

	ta		T_CHANGE_NONPRIV
        mov		0x1, %o0

	set		0x0, %l0
	set		0x20, %l1

	! enable divide by zero trap
	set		0x28, %o0
	ta		T_TRAP_EN
	nop

	! this should cause divide by zero trap
	! from user to supervisor
	udiv		%l1, %l0, %l2
        nop

	cmp		%o0, 0
        bne		diag_fail
	nop

	ta		T_CHANGE_PRIV
        mov		0x1, %o0

	! this should cause divide by zero trap
	! from supervisor to supervisor
	udiv		%l1, %l0, %l2
        nop

	cmp		%o0, 0
        bne		diag_fail
	nop

/*******************************************************
 * Exit code
 *******************************************************/
diag_pass:
PASS:						/*jump here if PASS*/
	ta	T_GOOD_TRAP

diag_fail:
FAIL:						/*jump here if FAIL*/
	ta	T_BAD_TRAP
	

/*******************************************************
 * Data section
 *******************************************************/
.data
.global mydata
mydata:
	! put your data here
	.word	0xdeadbeef
.end

