// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: exu_irf_local.s
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
 * Name:    exu_irf_local.s
 * Date:    June 24, 2003
 *
 *  Description: Data integrity check all local registers.
 *	    Hard coded for 8 register windows
 *
 *  This test depends on SAS.
 *
 **********************************************************************/

#define NUM_WINDOWS	8
#define NUM_PATTERNS	35
    
#define  MAIN_PAGE_HV_ALSO     
#include "boot.s"

.global main
main:
th_fork(th_main,%l0)		! start up to four threads.
	! No need to run more than one core.
	! All threads do the same thing, except for this one bit of setup... 
th_main_0:
th_main_1:
th_main_2:
th_main_3:

	! the code has already been through the boot code, so we know the registers 
	! are not too badly broken


	ta	T_CHANGE_PRIV 
	wrpr	%g0,0,%gl	    ! GL=0, just to be sure
	wrpr	%g0,0,%cwp	    ! CWP = 0  for register window test next..
	wrpr	%g0,0,%wstate
	ta	T_CHANGE_NONPRIV

	!************************************
	! Locals (%i,%l,%o), trap level 0
	!************************************
        setx	lz,%l0,%g1
	add	%g0,0,%g4
locals_wins_loop:     
	! for %cwp=0 to 7, check %r8-%r31. For %i and %o, check them with half
	! the data, but do use both names so that  problems in the ACTIVE
	! buffer would be seen.
	setx	pattern_start,%l0,%g2
	add	%g0,NUM_PATTERNS,%g3
loop_locals:
	ldx	[%g2],%i0
	mova	%icc,%i0,%i1
	mova	%icc,%i1,%i2
	mova	%icc,%i2,%i3
	mova	%icc,%i3,%i4
	mova	%icc,%i4,%i5
	mova	%icc,%i5,%i6
	mova	%icc,%i6,%i7
    
	mova	%icc,%i0,%l0
	mova	%icc,%l0,%l1
	mova	%icc,%l1,%l2
	mova	%icc,%l2,%l3
	mova	%icc,%l3,%l4
	mova	%icc,%l4,%l5
	mova	%icc,%l5,%l6
	mova	%icc,%l6,%l7
    
	xor	%i0,0x1fff,%o0    
	xor	%i1,0x1fff,%o1    
	xor	%i2,0x1fff,%o2    
	xor	%i3,0x1fff,%o3    
	xor	%i4,0x1fff,%o4    
	xor	%i5,0x1fff,%o5    
	xor	%i6,0x1fff,%o6    
	xor	%i7,0x1fff,%o7   
    
    	xor	%l0,0x1fff,%l0    
    	xor	%l1,0x1fff,%l1    
    	xor	%l2,0x1fff,%l2    
    	xor	%l3,0x1fff,%l3    
    	xor	%l4,0x1fff,%l4    
    	xor	%l5,0x1fff,%l5    
    	xor	%l6,0x1fff,%l6    
    	xor	%l7,0x1fff,%l7 

	sub	%g3,1,%g3
	brgz	%g3,loop_locals	    ! next data pattern
	add	%g2,8,%g2

	! next register window
	add	%g4,1,%g4
	ta	T_CHANGE_PRIV
	wrpr	%g4,0,%cwp
	ta	T_CHANGE_NONPRIV
	subcc	%g4,NUM_WINDOWS,%g0
	bneg	locals_wins_loop
	nop
    
good_end:   
	ta	T_GOOD_TRAP
	nop
	nop

bad_end:
	ta	T_BAD_TRAP
	nop
	nop
    
!==========================    
.data
.align 0x1fff+1

pattern_start:
	.word	0xaaaaaaaa, 0xaaaaaaaa
	.word	0x00000000, 0x00000000
	.word	0xffffffff, 0x00000001
	.word	0x7fffffff, 0x00000002
	.word	0xfffffffe, 0x00000004
	.word	0xbfffffff, 0x00000008
	.word	0xfffffffd, 0x00000010
	.word	0xdfffffff, 0x00000020
	.word	0xfffffffb, 0x00000040
	.word	0xefffffff, 0x00000080
	.word	0xfffffff7, 0x00000100
	.word	0xf7ffffff, 0x00000200
	.word	0xffffffef, 0x00000400
	.word	0xfbffffff, 0x00000800
	.word	0xffffffdf, 0x00001000
	.word	0xfdffffff, 0x00002000
	.word	0xffffffbf, 0x00004000
	.word	0xfeffffff, 0x00008000
	.word	0xffffff7f, 0x00010000
	.word	0xff7fffff, 0x00020000
	.word	0xfffffeff, 0x00040000
	.word	0xffbfffff, 0x00080000
	.word	0xfffffdff, 0x00100000
	.word	0xffdfffff, 0x00200000
	.word	0xfffffbff, 0x00400000
	.word	0xffefffff, 0x00800000
	.word	0xfffff7ff, 0x01000000
	.word	0xfff7ffff, 0x02000000
	.word	0xffffefff, 0x04000000
	.word	0xfffbffff, 0x08000000
	.word	0xffffdfff, 0x10000000
	.word	0xfffdffff, 0x20000000
	.word	0xffffbfff, 0x40000000
	.word	0xfffeffff, 0x80000000
    	.word	0xffff7fff, 0x00000000
    	
lz:	.space 256,0		! storage area


    
.end        
