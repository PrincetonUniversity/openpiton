// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tr_privact0.s
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
 * Name:   tr_privact0.s
 * Date:   02/7/02
 *
 *
 *  Description:
 *	- Check all priv action traps.
 *	- Really testing inst. decode, asi and tick
 *
 **********************************************************************/
/*******************************************************
 * My handler externsions
 *******************************************************/
#define	H_T0_Fp_disabled_0x20
#define	H_HT0_Privileged_Action_0x37
#define	H_HT0_Mem_Address_Not_Aligned_0x34

#define My_T0_Fp_disabled_0x20 wr %g0, 0x4, %fprs; retry;
#define My_HT0_Privileged_Action_0x37 add %l3, 0x1, %l3; done;
#define My_HT0_Mem_Address_Not_Aligned_0x34 done;

/*******************************************************/

#include "boot.s"

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss

.text
.global main  

main:

	! ta		T_CHANGE_PRIV		! set priv bit

	setx		0x800000000012345f, %l0, %l6	! tick.npt
	setx		data0, %l0, %l1
	setx		ddata0, %l0, %l2

	set		0x1, %g1
	set		0x0, %l7

	set		0x0, %l3		! To count number of traps.
	set		0x0, %l4		! To keep track of inst. that dont cause traps
	rd		%pc, %l5

	! casa, casax

	casa		[%l7]%asi, %g0, %g1	! 
	casa		[%l1]%asi, %g0, %g1
	casxa		[%l7]%asi, %g0, %g1
	casxa		[%l1]%asi, %g0, %g1

	add		%l4, 0x3, %l4 		! Following 2 shouldnt cause any trap
	casa		[%l1](0x80), %g0, %g1
	casxa		[%l1](0x80), %g0, %g1

	casa		[%l1](0x4f), %g0, %g1
	casxa		[%l1](0x4f), %g0, %g1

	! ld fp

	lda		[%l7]%asi, %f0		! 
	lda		[%l1]%asi, %f0
	ldda		[%l7]%asi, %f0
	ldda		[%l1]%asi, %f0

	add		%l4, 0x4, %l4 		! Following 3 shouldnt cause any trap
	lda		[%l1](0x80), %f0
	ldda		[%l1](0x80), %f0
	lda		[%g1](0x41), %f0

	lda		[%l1](0x7f), %f0
	ldda		[%l1](0x7f), %f0
	
	! ld int

	ldswa		[%l7]%asi, %g1		! 
	ldxa		[%l1]%asi, %g1
	ldda		[%l1]%asi, %g2

	add		%l4, 0x4, %l4 		! Following 3 shouldnt cause any trap
	lduba		[%l1](0x80), %g4
	ldda		[%l1](0x80), %g2
	ldswa		[%g1](0x41), %g1

	ldxa		[%l1](0x7f), %g1
	ldda		[%l1](0x7f), %g2

	! ldstub

	ldstuba		[%l7]%asi, %g1		! 

	add		%l4, 0x2, %l4 		! Following 1 should not cause any trap
	ldstuba		[%l1](0x80), %g4

	ldstuba		[%l1](0x7f), %g1

	! prefetch

	add		%l4, 0x4, %l4 		! Following 3 shouldnt cause any trap
	prefetcha	[%l1](0x80), 2
	prefetcha	[%l7]%asi, 0
	prefetcha	[%l1](0x7f), 2

	! rd %tick

#if 0	/*covered in tick_access.s*/
	add		%l4, 0x4, %l4 		! Following 3 shouldnt cause any trap
!	rd		%tick, %g1		! tick.npt = 0;
	ta		T_CHANGE_PRIV
!	rd		%tick, %g1		! tick.npt = 0;
!	rdpr		%tick, %g1		! tick.npt = 0;
	wrpr		%l6, 0x0, %tick
!	rd		%tick, %g1		! tick.npt = 1;
	ta		T_CHANGE_NONPRIV

	rd		%tick, %g1		! tick.npt = 1;
#endif
	
	! st fp

	sta		%f0, [%l7]%asi
	sta		%f0, [%l1]%asi
	stda		%f0, [%l7]%asi
	stda		%f0, [%l1]%asi

	add		%l4, 0x4, %l4 		! Following 3 shouldnt cause any trap
	sta		%f0, [%l1](0x80)
	stda		%f0, [%l1](0x80)
	sta		%f0, [%g1](0x41)

	sta		%f0, [%l1](0x7f)
	stda		%f0, [%l1](0x7f)
	
	! st int

	stswa		%g1, [%l7]%asi		! 
	stxa		%g1, [%l1]%asi
	stda		%g0, [%l1]%asi

	add		%l4, 0x4, %l4 		! Following 3 shouldnt cause any trap
	stuba		%g1, [%l1](0x80)
	stda		%g0, [%l1](0x80)
	stswa		%g1, [%g1](0x41)

	stxa		%g1, [%l1](0x7f)
	stda		%g0, [%l1](0x7f)

	! ldstub

	swapa		[%l7]%asi, %g1		! 

	add		%l4, 0x2, %l4 		! Following 1 shouldnt cause any trap
	swapa		[%l1](0x80), %g4

	swapa		[%l1](0x7f), %g1

	! Self checking code

	rd		%pc, %l7
	sub		%l7, %l5, %l7
	srl		%l7, 0x2, %l7
	sub		%l7, 0x1, %l7
	add		%l3, %l4, %l6
	subcc		%l7, %l6, %g0
	bne		test_fail
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

data0:
	.word		0x00000000
	.word		0x00000001

ddata0:
	.xword		0x0000000000000000
	.xword		0x0000000000000001
