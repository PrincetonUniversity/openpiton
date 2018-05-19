// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Dcache_falseraw.s
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
  File:		Dcache_falseraw.s

  Description:
  -----------
  One thread issues stores followed by loads that have false
  RAW dependencies on the stores (i.e. do not have RAW
  dependencies).

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

		!! store and load belong to the same cache set but have different tags
		set		data_segment,	%l7
		set		page2,			%l6
		set		0x11111111,		%l2
		stx		%l0,	[%l7]
		ld		[%l6],			%l1
		subcc	%l1,	%l2,	%l3 !! 1
		bne		diag_fail
		nop
		ldx		[%l7],			%l3    !! check that store succeeded

		!! store and load have different indices but same tags
		set		0x00112233,		%l2
		st		%l0,	[%l7+0x10]
		ld		[%l7],			%l1
		subcc	%l1,	%l2,	%l3 !! 2
		bne		diag_fail
		nop
		ldx		[%l7+0x10],		%l3    !! check that store succeeded  44556677bbbbbbbb

		!! stb and ldub belong to the same cache line but do not overlap
		set		0xca,			%l0
		stb		%l0,	[%l7+0x7]
		ldub	[%l7+0x8],		%l1
		subcc	%l1,	0,		%l3 !! 3
		bne		diag_fail
		nop
		ldx		[%l7],			%l3    !! check that store succeeded
		ldx		[%l7+0x8],		%l3    !! check that store succeeded		

		!! stb and lduh belong to the same cache line but do not overlap
		set		0xcb,			%l0
		stb		%l0,	[%l7+0xb]
		lduh	[%l7+0xc],		%l1
		subcc	%l1,	0,		%l3 !! 4
		bne		diag_fail
		nop
		ldx		[%l7+0x8],		%l3    !! check that store succeeded

		!! stb and lduw belong to the same cache line but do not overlap
		set		0xcc,			%l0
		set		0x00112233,		%l2
		stb		%l0,	[%l7+0x4]
		lduw	[%l7],			%l1
		subcc	%l1,	%l2,	%l3 !! 5
		bne		diag_fail
		nop
		ldx		[%l7],			%l3    !! check that store succeeded

		!! stb and ldx belong to the same cache line but do not overlap
		set		0xcd,			%l0
		setx	0x00112233cc5566ca,		%l3,	%l2
		stb		%l0,	[%l7+0xe]
		ldx		[%l7],			%l1
		subcc	%l1,	%l2,	%l3 !! 6
		bne		diag_fail
		nop
		ldx		[%l7+0x8],		%l3    !! check that store succeeded

		!! sth and ldub belong to the same cache line but do not overlap
		set		0x1357,			%l0
		sth		%l0,	[%l7+0x8]
		ldub	[%l7],			%l1
		subcc	%l1,	0,		%l3 !! 1
		bne		diag_fail
		nop
		ldx		[%l7+0x8],		%l3    !! check that store succeeded

		!! sth and lduh belong to the same cache line but do not overlap
		set		0x3571,			%l0
		set		0xcd00,			%l2
		sth		%l0,	[%l7+0xc]
		lduh	[%l7+0xe],		%l1
		subcc	%l1,	%l2,	%l3 !! 1
		bne		diag_fail
		nop
		ldx		[%l7+0x8],		%l3    !! check that store succeeded

		!! sth and lduw belong to the same cache line but do not overlap
		set		0x5713,			%l0
		set		0xcc5566ca,		%l2
		sth		%l0,	[%l7+0x2]
		lduw	[%l7+0x4],		%l1
		subcc	%l1,	%l2,	%l3 !! 1
		bne		diag_fail
		nop
		ldx		[%l7],			%l3    !! check that store succeeded

		!! sth and ldx belong to the same cache line but do not overlap
		set		0x7135,			%l0
		setx	0x00115713cc5566ca,		%l3,	%l2
		sth		%l0,	[%l7+0x8]
		ldx		[%l7],			%l1
		subcc	%l1,	%l2,	%l3 !! 1
		bne		diag_fail
		nop
		ldx		[%l7+0x8],		%l3    !! check that store succeeded

		!! stw and ldub belong to the same cache line but do not overlap
		set		0x11223344,		%l0
		set		0xcb,			%l2
		stw		%l0,	[%l7+0xc]
		ldub	[%l7+0xb],		%l1
		subcc	%l1,	%l2,	%l3 !! 1
		bne		diag_fail
		nop
		ldx		[%l7+0x8],		%l3    !! check that store succeeded

		!! stw and lduh belong to the same cache line but do not overlap
		set		0x22334455,		%l0
		set		0xcc55,			%l2
		stw		%l0,	[%l7]
		lduh	[%l7+0x4],		%l1
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
		nop
		ldx		[%l7],			%l3    !! check that store succeeded

		!! stw and lduw belong to the same cache line but do not overlap
		set		0x33445566,		%l0
		set		0x713500cb,		%l2
		stw		%l0,	[%l7+0x4]
		lduw	[%l7+0x8],		%l1
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
		nop
		ldx		[%l7],			%l3    !! check that store succeeded

		!! stw and ldx belong to the same cache line but do not overlap
		set		0x44556677,		%l0
		setx	0x713500cb11223344,		%l3,	%l2
		stw		%l0,	[%l7]
		ldx		[%l7+0x8],		%l1
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
		nop
		ldx		[%l7],			%l3    !! check that store succeeded

		!! stx and ldub belong to the same cache line but do not overlap
		setx	0x0000111122223333,		%l3,	%l0
		set		0x71,			%l2
		stx		%l0,	[%l7]
		ldub	[%l7+0x8],		%l1
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
		nop
		ldx		[%l7],			%l3    !! check that store succeeded

		!! stx and lduh belong to the same cache line but do not overlap
		setx	0x4444555566667777,		%l3,	%l0
		set		0x3333,			%l2
		stx		%l0,	[%l7+0x8]
		lduh	[%l7+0x6],		%l1
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
		nop
		ldx		[%l7+0x8],		%l3    !! check that store succeeded

		!! stx and lduw belong to the same cache line but do not overlap
		setx	0x88889999aaaabbbb,		%l3,	%l0
		set		0x44445555,		%l2
		stx		%l0,	[%l7]
		lduw	[%l7+0x8],		%l1
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
		nop
		ldx		[%l7],			%l3    !! check that store succeeded

		!! stx and ldx belong to the same cache line but do not overlap
		setx	0xccccddddeeeeffff,		%l3,	%l0
		setx	0x88889999aaaabbbb,		%l3,	%l2
		stx		%l0,	[%l7+0x8]
		ldx		[%l7],		%l1
		subcc	%l1,	%l2,	%l3
		bne		diag_fail
		nop
		ldx		[%l7+0x8],		%l3    !! check that store succeeded


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


#define PAGE2_DATA_ADDR 0x20018000
#define PAGE2_DATA_ADDR_RA 0x20018000
define(PAGE2_DATA_ADDR_PA, ra2pa(PAGE2_DATA_ADDR_RA, 0))

SECTION .PAGE2 DATA_VA=PAGE2_DATA_ADDR
attr_data {
        Name = .PAGE2,
        VA=PAGE2_DATA_ADDR, 
        RA=PAGE2_DATA_ADDR_RA,
        PA=PAGE2_DATA_ADDR_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data
.global page2

page2:
	.word	0x11111111
	.word	0x11111111
	.word	0x00000000
	.word	0x00000000
	.word	0x22222222
	.word	0x22222222
	.word	0x00000000
	.word	0x00000000
	.word	0x33333333
	.word	0x33333333
	.word	0x00000000
	.word	0x00000000
	.word	0x44444444
	.word	0x44444444
	.word	0x00000000
	.word	0x00000000
	.word	0x55555555
	.word	0x55555555
	.word	0x00000000
	.word	0x00000000
	.word	0x66666666
	.word	0x66666666
	.word	0x00000000
	.word	0x00000000

.end

