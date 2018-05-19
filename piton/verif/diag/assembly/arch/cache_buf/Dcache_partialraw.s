// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Dcache_partialraw.s
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
  File:		Dcache_partialraw.s

  Description:
  -----------
  First, one thread issues stores (hit and miss) of various
  sizes followed by loads of sizes larger than the store size.
  Second, 2 stores are issued, followed by a load which is
  has full RAW dependency on the first store and partial RAW
  dependency on the second.

  $Change$
 *************************************************************/

#ifdef MT_TEMPLATE
#include "mt_body.h"
#else
#include "boot.s"
.global main
#endif

.text


main:
		setx	0x0011223344556677,		%l1,	%l0

store_miss_then_load:	

		!! stb miss, followed by lduh to same halfword
		set		data_segment,	%l7
		set		0x77aa,			%l3
		stb		%l0,	[%l7]
		lduh	[%l7],			%l1
		subcc	%l1,	%l3,	%l4
		bne		diag_fail
		nop
		
		!! stb miss, followed by lduw to same word
		add		%l7,	0x10,	%l7
		set		0xbb77bbbb,		%l3
		stb		%l0,	[%l7+0x1]
		lduw	[%l7],			%l1
		subcc	%l1,	%l3,	%l4
		bne		diag_fail
		nop
		
		!! stb miss, followed by ldx to same doubleword
		add		%l7,	0x10,	%l7
		setx	0xcccccc77cccccccc,		%l4,	%l3
		stb		%l0,	[%l7+0x3]
		ldx		[%l7],			%l1
		subcc	%l1,	%l3,	%l4
		bne		diag_fail
		nop
		
		!! sth miss, followed by lduw to same word
		add		%l7,	0x10,	%l7
		set		0xdddd6677,		%l3
		sth		%l0,	[%l7+0x2]
		lduw	[%l7],			%l1
		subcc	%l1,	%l3,	%l4
		bne		diag_fail
		nop
		
		!! sth miss, followed by ldx to same doubleword
		add		%l7,	0x10,	%l7
		setx	0xeeeeeeeeeeee6677,		%l4,	%l3
		sth		%l0,	[%l7+0x6]
		ldx		[%l7],			%l1
		subcc	%l1,	%l3,	%l4
		bne		diag_fail
		nop
		
		!! stw miss, followed by ldx to same doubleword
		add		%l7,	0x10,	%l7
		setx	0xffffffff44556677,		%l4,	%l3
		stw		%l0,	[%l7+0x4]
		ldx		[%l7],			%l1
		subcc	%l1,	%l3,	%l4
		bne		diag_fail
		nop

		!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

store_hit_then_load:	

		!! stb hit, followed by lduh to same halfword
		set		data_segment,	%l7
		set		0x77aa,			%l3
		stb		%l0,	[%l7+0x6]
		lduh	[%l7+0x6],			%l1
		subcc	%l1,	%l3,	%l4
		bne		diag_fail
		nop
		
		!! stb hit, followed by lduw to same word
		add		%l7,	0x10,	%l7
		set		0x77bbbbbb,		%l3
		stb		%l0,	[%l7+0x4]
		lduw	[%l7+0x4],			%l1
		subcc	%l1,	%l3,	%l4
		bne		diag_fail
		nop
		
		!! stb hit, followed by ldx to same doubleword
		add		%l7,	0x10,	%l7
		setx	0xcccccc77cc77cccc,		%l4,	%l3
		stb		%l0,	[%l7+0x5]
		ldx		[%l7],			%l1
		subcc	%l1,	%l3,	%l4
		bne		diag_fail
		nop
		
		!! sth hit, followed by lduw to same word
		add		%l7,	0x10,	%l7
		set		0x66776677,		%l3
		sth		%l0,	[%l7]
		lduw	[%l7],			%l1
		subcc	%l1,	%l3,	%l4
		bne		diag_fail
		nop
		
		!! sth hit, followed by ldx to same doubleword
		add		%l7,	0x10,	%l7
		setx	0xeeeeeeee66776677,		%l4,	%l3
		sth		%l0,	[%l7+0x4]
		ldx		[%l7],			%l1
		subcc	%l1,	%l3,	%l4
		bne		diag_fail
		nop
		
		!! stw hit, followed by ldx to same doubleword
		add		%l7,	0x10,	%l7
		setx	0x4455667744556677,		%l4,	%l3
		stw		%l0,	[%l7]
		ldx		[%l7],			%l1
		subcc	%l1,	%l3,	%l4
		bne		diag_fail
		nop
		
		!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

full_and_partial_raw:
		set		data_segment,	%l7
		set		0xff,			%l6
		set		0x0011ff33,		%l3
		stx		%l0,	[%l7]
		stb		%l6,	[%l7+0x2]
		lduw	[%l7],			%l1
		subcc	%l1,	%l3,	%l4
		bne		diag_fail
		nop


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
		
	.word	0xaaaaaaaa
	.word	0xaaaaaaaa
	.word	0x00000000
	.word	0x00000000
	.word	0xbbbbbbbb
	.word	0xbbbbbbbb
	.word	0x00000000
	.word	0x00000000
	.word	0xcccccccc
	.word	0xcccccccc
	.word	0x00000000
	.word	0x00000000
	.word	0xdddddddd
	.word	0xdddddddd
	.word	0x00000000
	.word	0x00000000
	.word	0xeeeeeeee
	.word	0xeeeeeeee
	.word	0x00000000
	.word	0x00000000
	.word	0xffffffff
	.word	0xffffffff
	.word	0x00000000
	.word	0x00000000

.end
