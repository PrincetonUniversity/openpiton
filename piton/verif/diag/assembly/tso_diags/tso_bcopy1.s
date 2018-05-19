// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_bcopy1.s
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
/***************************************************************************
***
***  Program File: tso_bcopy1.s
***
**********************************************************************/

#define		srcaddr		%l0
#define		dstaddr		%l1
#define		count		%l2

! Define number of 64 byte subblocks to copy
#define SBLKS 128

! How far ahead is the prefetch stream (in subblocks)
#define FETCH_AHEAD 8

#include "boot.s"

.global main

.text
main:
	wr      %g0, 0x4, %fprs         /* make sure fef is 1 */

setup_addresses:
	setx in_stream, %g2, srcaddr
	setx out_stream, %g2, dstaddr
	alignaddr	srcaddr, %g0, srcaddr

! COUNT bytes to copy
!--------------------
	set SBLKS, count
	mulx count, 8*8, count


! the initial part (preamble) of bcopy.
!--------------------------------------
	prefetch	[srcaddr + 0*64], 1
	prefetch	[srcaddr + 1*64], 1
	prefetch	[srcaddr + 2*64], 1
	prefetch	[srcaddr + 3*64], 1
	ldd     	[srcaddr + 0*8], %f0
	prefetch	[srcaddr + 4*64], 1
#if FETCH_AHEAD>=4
	prefetch	[srcaddr + (4+1)*64], 1
#endif
#if FETCH_AHEAD>=5
	prefetch	[srcaddr + (5+1)*64], 1
#endif
#if FETCH_AHEAD>=6
	prefetch	[srcaddr + (6+1)*64], 1
#endif
#if FETCH_AHEAD>=7
	prefetch	[srcaddr + (7+1)*64], 1
#endif
	ldd     	[srcaddr + 1*8], %f2
	ldd     	[srcaddr + 2*8], %f4
	faligndata	%f0, %f2, %f32
	ldd     	[srcaddr + 3*8], %f6
	faligndata	%f2, %f4, %f34
	ldd     	[srcaddr + 4*8], %f8
	faligndata	%f4, %f6, %f36
	ldd     	[srcaddr + 5*8], %f10
	faligndata	%f6, %f8, %f38
	ldd     	[srcaddr + 6*8], %f12
	faligndata	%f8, %f10, %f40
	ldd     	[srcaddr + 7*8], %f14
	faligndata	%f10, %f12, %f42
	ldd     	[srcaddr + 8*8], %f16
#if FETCH_AHEAD>=8
	prefetch	[srcaddr + (8+1)*64], 1
#endif
	subcc		count, 64, count
	be,pn	%xcc,tidy_up
	 add		srcaddr, 64, srcaddr

! the loop (the essence of bcopy)
!--------------------------------
timing_loop:
	fmovd		%f16, %f0
	ldd     	[srcaddr + 1*8], %f2
	faligndata	%f12, %f14, %f44
	ldd     	[srcaddr + 2*8], %f4
	faligndata	%f14, %f0, %f46
	stda		%f32, [dstaddr]ASI_BLK_P
	ldd     	[srcaddr + 3*8], %f6
	faligndata	%f0, %f2, %f32
	ldd     	[srcaddr + 4*8], %f8
	faligndata	%f2, %f4, %f34
	ldd     	[srcaddr + 5*8], %f10
	faligndata	%f4, %f6, %f36
	ldd     	[srcaddr + 6*8], %f12
	faligndata	%f6, %f8, %f38
	ldd     	[srcaddr + 7*8], %f14
	faligndata	%f8, %f10, %f40
	ldd     	[srcaddr + 8*8], %f16
	prefetch	[srcaddr + (FETCH_AHEAD+1)*64], 1
	faligndata	%f10, %f12, %f42
	subcc		count, 64, count
	add		dstaddr, 64, dstaddr
	bg,pt %xcc,timing_loop
	 add		srcaddr, 64, srcaddr

! the last part of bcopy
! should handle the remaining partial block here
!-----------------------------------------------
tidy_up:
	fmovd		%f16, %f0
	faligndata	%f12, %f14, %f44
	faligndata	%f14, %f0, %f46
	stda		%f32, [dstaddr]ASI_BLK_P
	membar #Sync
trap:
	ta GOOD_TRAP
user_text_end:

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

.global in_stream
.global out_stream

.data
.align 	0x40
user_data_start:

.skip 	0x40
in_stream:
	init_mem(0x20100000, SBLKS*16, 4, +, 0, +, 0x01010001)

! offset the out_stream block
.align 0x1000
.skip 1024	
.skip 192
out_stream:
	init_mem(0x11111111, SBLKS*16, 4, +, 0, +, 0)

user_data_end:
