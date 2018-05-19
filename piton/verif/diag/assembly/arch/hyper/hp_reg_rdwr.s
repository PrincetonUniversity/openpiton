// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hp_reg_rdwr.s
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
 * Name:   hp_reg_rdwr.s
 *
 * Description:
 *	Self-checking diag to test Niagara hypervisor registers
 *      - write and read to %hpstate, %htstate for trap level 1 through 6,
 *        %hintp and %htba
 **********************************************************************/

#define MAIN_PAGE_HV_ALSO
#include "boot.s"

.text
.global	main

/***********************************************************************/
main:

	ta		T_CHANGE_HPRIV

	! save current value of %hpstate
	rdhpr		%hpstate, %g1

	! write and read from %hpstate
	set		0x825, %g2
	wrhpr		%g2, 0x0, %hpstate
	rdhpr		%hpstate, %g3
	cmp		%g3, %g2
	bne		test_fail
	nop

	set		0x4, %g2
	wrhpr		%g2, 0x0, %hpstate
	rdhpr		%hpstate, %g3
	cmp		%g3, %g2
	bne		test_fail
	nop

	! restore value of %hpstate
	wrhpr		%g1, 0x0, %hpstate

	! go to trap level 1 to 6 and
	! write and read from %htstate
	! alternate write data to different levels
	set 		0x25, %g1

	wrpr		%g0, 0x1, %tl
	wrhpr 		%g1, 0x0, %htstate

	wrpr		%g0, 0x2, %tl
	wrhpr 		%g0, 0x0, %htstate

	wrpr		%g0, 0x3, %tl
	wrhpr 		%g1, 0x0, %htstate

	wrpr		%g0, 0x4, %tl
	wrhpr 		%g0, 0x0, %htstate

	wrpr		%g0, 0x5, %tl
	wrhpr 		%g1, 0x0, %htstate

	wrpr		%g0, 0x6, %tl
	wrhpr 		%g0, 0x0, %htstate


	wrpr		%g0, 0x1, %tl
	rdhpr		%htstate, %g2
	cmp		%g1, %g2
	bne		test_fail
	nop
	wrhpr 		%g0, 0x0, %htstate

	wrpr		%g0, 0x2, %tl
	rdhpr		%htstate, %g2
	cmp		%g0, %g2
	bne		test_fail
	nop
	wrhpr 		%g1, 0x0, %htstate

	wrpr		%g0, 0x3, %tl
	rdhpr		%htstate, %g2
	cmp		%g1, %g2
	bne		test_fail
	nop
	wrhpr 		%g0, 0x0, %htstate

	wrpr		%g0, 0x4, %tl
	rdhpr		%htstate, %g2
	cmp		%g0, %g2
	bne		test_fail
	nop
	wrhpr 		%g1, 0x0, %htstate

	wrpr		%g0, 0x5, %tl
	rdhpr		%htstate, %g2
	cmp		%g1, %g2
	bne		test_fail
	nop
	wrhpr 		%g0, 0x0, %htstate

	wrpr		%g0, 0x6, %tl
	rdhpr		%htstate, %g2
	cmp		%g0, %g2
	bne		test_fail
	nop
	wrhpr 		%g1, 0x0, %htstate


	wrpr		%g0, 0x1, %tl
	rdhpr		%htstate, %g2
	cmp		%g0, %g2
	bne		test_fail
	nop

	wrpr		%g0, 0x2, %tl
	rdhpr		%htstate, %g2
	cmp		%g1, %g2
	bne		test_fail
	nop

	wrpr		%g0, 0x3, %tl
	rdhpr		%htstate, %g2
	cmp		%g0, %g2
	bne		test_fail
	nop

	wrpr		%g0, 0x4, %tl
	rdhpr		%htstate, %g2
	cmp		%g1, %g2
	bne		test_fail
	nop

	wrpr		%g0, 0x5, %tl
	rdhpr		%htstate, %g2
	cmp		%g0, %g2
	bne		test_fail
	nop

	wrpr		%g0, 0x6, %tl
	rdhpr		%htstate, %g2
	cmp		%g1, %g2
	bne		test_fail
	nop

	! go back to trap level 0
	wrpr		%g0, 0x0, %tl


	! disable interrupt PSTATE.ie=0
	rdpr		%pstate, %g1
	and		%g1, 0x0ffd, %g1
	wrpr		%g1, 0x0, %pstate

	! write and read from %hintp
        wrhpr           %g0, 0x1, %hintp
        rdhpr           %hintp, %g1
        cmp             %g1, 0x1
        bne             test_fail
        nop

        wrhpr           %g0, 0x0, %hintp
        rdhpr           %hintp, %g1
        cmp             %g1, %g0
        bne             test_fail
        nop


        ! save current value of %hpstate
        rdhpr           %htba, %g1

	! write and read from %htba
	setx		0xffffffffffff8000, %l0, %l1
        wrhpr           %l1, 0x0, %htba
        rdhpr           %htba, %l2
	wrhpr		%g1, 0x0, %htba
        cmp             %l1, %l2
        bne             test_fail
        nop

        wrhpr           %g0, 0x0, %htba
        rdhpr           %htba, %l2
	wrhpr		%g1, 0x0, %htba
        cmp             %g0, %l2
        bne             test_fail
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
