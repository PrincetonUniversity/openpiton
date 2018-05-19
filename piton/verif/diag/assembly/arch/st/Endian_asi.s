// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Endian_asi.s
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
/*************************************************************
  File:		Endian_asi.s

  Description:
  -----------
  Test little endian support for signed and unsigned loads,
  stores, and cas from alternate space.

  $Change: 49556 $
 *************************************************************/
		
#ifdef MT_TEMPLATE
#include "mt_body.h"
#else
#include "boot.s"
.global main
#endif
		
.text

main:
		set		data_segment,	%l7

		!! little endian unsigned loads
		
		lduha	[%l7]	0x88,	%l1
		set		0x1100,			%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		lduwa	[%l7]	0x88,	%l1
		set		0x33221100,		%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		ldxa	[%l7]	0x88,	%l1
		setx	0x7766554433221100,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		!! little endian stores
		
		set		0x8899,			%l1
		stha	%l1,	[%l7]	0x88
		ldx		[%l7],			%l1
		setx	0x9988223344556677,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		set		0x8899aabb,		%l1
		stwa	%l1,	[%l7]	0x88
		ldx		[%l7],			%l1
		setx	0xbbaa998844556677,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		setx	0x8899aabbccddeeff,		%l3,	%l1
		stxa	%l1,	[%l7]	0x88
		ldx		[%l7],			%l1
		setx	0xffeeddccbbaa9988,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		!! little endian signed loads

		add		%l7,	8,		%l7
		ldsha	[%l7]	0x88,	%l1
		setx	0xffffffffffff9988,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		ldswa	[%l7]	0x88,	%l1
		setx	0xffffffffbbaa9988,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		!! little endian cas
		
		set		0x00112233,		%l1
		set		0xbbaa9988,		%l2
		casa	[%l7]	0x88,	%l2,	%l1
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop
		ldx		[%l7],			%l1
		setx	0x33221100ccddeeff,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop
/*
		setx	0x0011223344556677,		%l3,	%l1
		setx	0xffeeddccbbaa9988,		%l3,	%l2
		casxa	[%l7]	0x88,	%l2,	%l1
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop
		ldx		[%l7],			%l1
		setx	0x7766554433221100,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop
*/			
		!! change ASI to ASI_PRIMARY_LITTLE

		!! little endian unsigned loads
		wr		%g0,	0x88,	%asi
		add		%l7,	8,		%l7
		
		!! little endian unsigned loads
		
		lduha	[%l7]	%asi,	%l1
		set		0x1100,			%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		lduwa	[%l7]	%asi,	%l1
		set		0x33221100,		%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		ldxa	[%l7]	%asi,	%l1
		setx	0x7766554433221100,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		!! little endian stores
		
		set		0x8899,			%l1
		stha	%l1,	[%l7]	%asi
		ldx		[%l7],			%l1
		setx	0x9988223344556677,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		set		0x8899aabb,		%l1
		stwa	%l1,	[%l7]	%asi
		ldx		[%l7],			%l1
		setx	0xbbaa998844556677,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		setx	0x8899aabbccddeeff,		%l3,	%l1
		stxa	%l1,	[%l7]	%asi
		ldx		[%l7],			%l1
		setx	0xffeeddccbbaa9988,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		!! little endian signed loads

		add		%l7,	8,		%l7
		ldsha	[%l7]	%asi,	%l1
		setx	0xffffffffffff9988,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		ldswa	[%l7]	%asi,	%l1
		setx	0xffffffffbbaa9988,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop

		!! little endian cas
		
		set		0x00112233,		%l1
		set		0xbbaa9988,		%l2
		casa	[%l7]	%asi,	%l2,	%l1
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop
		ldx		[%l7],			%l1
		setx	0x33221100ccddeeff,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop
/*
		setx	0x0011223344556677,		%l3,	%l1
		setx	0xffeeddccbbaa9988,		%l3,	%l2
		casxa	[%l7]	%asi,	%l2,	%l1
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop
		ldx		[%l7],			%l1
		setx	0x7766554433221100,		%l3,	%l2
		subcc	%l1,	%l2,	%l3
		brnz	%l3,	diag_fail
		nop
*/
	
!! Diag PASSED
diag_pass:
        set     0xaaddcafe,     %l0
        ta T_GOOD_TRAP
        nop

!! Diag FAILED
diag_fail:		
        set     0xdeadcafe,     %l0
        ta T_BAD_TRAP
        nop
        nop

.data

data_segment:
		
	.word	0x00112233
	.word	0x44556677
	.word	0x8899aabb
	.word	0xccddeeff
	.word	0x00112233
	.word	0x44556677
	.word	0x8899aabb
	.word	0xccddeeff

.end
