// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_membar0.s
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
***  Test Description: stressing the membar instruction
***
**********************************************************************/

#define		srcaddr		%l0
#define		dstaddr		%l1
#define		count		%l2

! Define number of 64 byte subblocks to copy
#define SBLKS 128

#include "boot.s"

.global main
.text
main:

setup_addresses:
	setx out_stream, %g2, dstaddr
	add %g0, 0x10, %i0
	add %i0, 1, %i1
	add %i0, 1, %i2
	add %i0, 1, %i3
	add %i0, 1, %i4
	add %i0, 1, %i5
	add %i0, 1, %i6
	add %i0, 1, %i7

	set	0x10, %l3
loop:
	st		%i0, [dstaddr + 0x0]
	st		%i1, [dstaddr + 0x4]
	st		%i2, [dstaddr + 0x8]
	st		%i3, [dstaddr + 0xc]
	st		%i4, [dstaddr + 0x10]
	st		%i5, [dstaddr + 0x14]
	st		%i6, [dstaddr + 0x18]
	st		%i7, [dstaddr + 0x1c]
	st		%i0, [dstaddr + 0x20]
	st		%i1, [dstaddr + 0x24]
	st		%i2, [dstaddr + 0x28]
	st		%i3, [dstaddr + 0x2c]
	membar #Sync
	dec %l3
	brnz	%l3, loop
	nop

	ld		[dstaddr + 0x0], %i0
	ld		[dstaddr + 0x4], %i0
	ld		[dstaddr + 0x8], %i0
	ld		[dstaddr + 0xc], %i0
	ld		[dstaddr + 0x10], %i0
	ld		[dstaddr + 0x14], %i0
	ld		[dstaddr + 0x18], %i0
	ld		[dstaddr + 0x1c], %i0
	ld		[dstaddr + 0x20], %i0
	ld		[dstaddr + 0x24], %i0
	ld		[dstaddr + 0x28], %i0
	ld		[dstaddr + 0x2c], %i0

	ta GOOD_TRAP
user_text_end:

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

.global out_stream
.data
.align 	0x40
user_data_start:
out_stream:
	init_mem(0x11111111, SBLKS*16, 4, +, 0, +, 0)

user_data_end:
