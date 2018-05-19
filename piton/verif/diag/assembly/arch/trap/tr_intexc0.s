// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tr_intexc0.s
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
 * Name:   tr_intexc0.s
 * Date:   02/5/02
 *
 *
 *  Description:
 *  	
 *     Exceptions due to integer arithmetic. 
 *
 **********************************************************************/
/*******************************************************
 * My handler externsions
 *******************************************************/
#define	H_T0_Division_By_Zero
#define	H_T0_Tag_Overflow

#define My_T0_Division_By_Zero  done;
#define My_T0_Tag_Overflow done; nop;

/*******************************************************/

#include "boot.s"

.global sam_fast_immu_miss
.global sam_fast_dmmu_miss

.text
.global main  

main:

	setx		0xffffffff, %l0, %l1	
	setx		0x80000000, %l0, %l5	
	setx		0x7fffffff, %l0, %l6	
	setx		0x80000010, %l0, %l7
	set		0x0, %l2

	! Integer divide

	set		0xaa, %l3
	sdivx		%l1, %l2, %l3
	sdivx		%l1, %g0, %l3
	udivx		%l1, %l2, %l3
	udivx		%l1, %g0, %l3

	! Taddcc, TaddccTV, Tsubcc, TsubccTV
	
	wr		%g0, 0x0, %ccr
	taddcc		%g0, 0x1, %l4
	taddcctv	%g0, 0x1, %l4

	wr		%g0, 0x0, %ccr
	taddcctv	%l1, %l5, %l1
	taddcctv	%l5, %l6, %l1
	taddcctv	%l6, %l7, %l1

	tsubcctv	%l1, %l5, %l1
	tsubcctv	%l5, %l6, %l1
	tsubcctv	%l6, %l7, %l1

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

