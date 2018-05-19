// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mt_Dhit_specload.s
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
  File:		mt_Dhit_specload.s

  Description:
  -----------
  This diag makes one thread issue speculative instructions
  (each following a load) that are not killed because the loads
  hit. One thread always misses on instructions, while another
  issues load hits and speculative instructions.



  $Change: 17073 $
 *************************************************************/
		
#define THREAD_COUNT    2
#include "boot.s"

.text
.global main
.global run_th_0
.global run_th_1
.global run_th_2
.global run_th_3

main:

thread_jump:
	th_fork(run_th)

        ba diag_fail
	nop

run_th_0:
		set		data_segment,	%i0
		ldub	[%i0],			%i1
		set		0x10,			%l0
load_hit:		
		ldub	[%i0],			%i1  ! load hit
		add		%i0,	0x1,	%i0  ! speculative instruction
		subcc	%l0,	1,		%l0
		bne		load_hit
		nop
		ba		diag_pass
		nop

.align 32

run_th_1:
		ba,a	imiss1
.align 32

imiss1:	
		ba,a	imiss2
.align 32

imiss2:	
		ba,a	imiss3
.align 32

imiss3:	
		ba,a	imiss4
.align 32

imiss4:	
		ba,a	imiss5
.align 32

imiss5:	
		ba,a	imiss6
.align 32

imiss6:	
		ba,a	imiss7
.align 32

imiss7:	
		ba,a	imiss8
.align 32

imiss8:	
		ba,a	imiss9
.align 32

imiss9:	
		ba,a	imiss10
.align 32

imiss10:	
		ba,a	imiss11
.align 32

imiss11:	
		ba,a	imiss12
.align 32

imiss12:	
		ba,a	imiss13
.align 32

imiss13:	
		ba,a	imiss14
.align 32

imiss14:	
		ba,a	imiss15
.align 32

imiss15:	
		ba,a	imiss16
.align 32

imiss16:	
		ba		diag_pass
		nop

		
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

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
		.word	0x11110000
		.word	0x11111111
		.word	0x11112222
		.word	0x11113333
		.word	0x11114444
		.word	0x11115555
		.word	0x11116666
		.word	0x11117777

.end
