// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_binit1.s
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
***  Program File: tso_binit1.s
***
***  Test Description: optimal bcopy as per architecture
***  just a small chunk here with no loop.
***
**********************************************************************/

#define		srcaddr		%i0
#define		dstaddr		%i1
#define		count		%i2

#include "boot.s"

.global main
.text
main:
	wr      %g0, 0x4, %fprs         /* make sure fef is 1 */
	ta      T_CHANGE_PRIV

setup_addresses:
	setx in_stream, %g2, srcaddr
	setx out_stream, %g2, dstaddr

	ldda    [srcaddr] 0x22,  %l0
	add	srcaddr, 0x10, srcaddr
	ldda    [srcaddr] 0x22,  %l2
	add	srcaddr, 0x10, srcaddr
	ldda    [srcaddr] 0x22,  %l4
	add	srcaddr, 0x10, srcaddr
	ldda    [srcaddr] 0x22,  %l6
	stxa    %l0,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l1,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l2,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l3,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l4,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l5,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l6,    [dstaddr] 0x22
	add	dstaddr, 0x8, dstaddr
	stxa    %l7,    [dstaddr] 0x22

trap:
	ta GOOD_TRAP
user_text_end:

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

.global in_stream
.global out_stream
.data
.align 0x1000
user_data_start:
in_stream:
	.word 0xb1bababa
	.word 0xb2bababa
	.word 0xb3bababa
	.word 0xb4bababa
	.word 0xb5bababa
	.word 0xb6bababa
	.word 0xb7bababa
	.word 0xb8bababa
	.word 0xb9bababa
	.word 0xbabababa
	.word 0xbbbababa
	.word 0xbcbababa
	.word 0xbdbababa
	.word 0xbebababa
	.word 0xbfbababa
	.skip 512	

! offset the out_stream block
.align 0x1000
out_stream:
	.skip 1024	

user_data_end:
