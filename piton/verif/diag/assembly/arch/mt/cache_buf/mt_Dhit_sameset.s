// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mt_Dhit_sameset.s
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
  File:		mt_Dhit_sameset.s

  Description:
  -----------
  4 threads issue loads/stores/atomics to 4 different tags
  belonging to the same set.

  $Change: 17073 $
 *************************************************************/
		
#define THREAD_COUNT    4
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

        cmp %l3, 0
        be  run_th_0
        cmp %l3, 1
        be  run_th_1
        cmp %l3, 2
        be  run_th_2
        cmp %l3, 3
        be  run_th_3
        nop

        ba diag_fail

run_th_0:
		set				data_field_0,		%i0
		set				data_field_1,		%i1
		set				data_field_2,		%i2
		set				data_field_3,		%i3
		set				0x0,			%o0
		set				0x1,			%o1
		set				0x2,			%o2
		set				0x3,			%o3
		cas			[%i1],	%o3,	%o1
		stx				%o1,			[%i1]
		ldstub			[%i2],			%o2
		swap			[%i1],			%o0
		ldx				[%i3],			%o0
		ldx				[%i0],			%o3
		stx				%o3,			[%i0]
		cas			[%i2],	%o0,	%o2
		ldx				[%i0],			%o1
		ldstub			[%i1],			%o2
		swap			[%i2],			%o1
		swap			[%i3],			%o3
		ldx				[%i1],			%o1
		ldstub			[%i2],			%o1
		ldx				[%i1],			%o2
		ldx				[%i1],			%o1
		swap			[%i0],			%o1
		ldstub			[%i1],			%o3
		ldx				[%i2],			%o1
		cas			[%i0],	%o0,	%o0
		ldx				[%i3],			%o1
		swap			[%i2],			%o0
		ldx				[%i0],			%o1
		ldx				[%i2],			%o3
		ldx				[%i0],			%o1
		swap			[%i1],			%o2
		stx				%o2,			[%i3]
		stx				%o3,			[%i2]
		ldx				[%i1],			%o3
		ldstub			[%i1],			%o3
		ba		diag_pass
		nop

run_th_1:
                set                             data_field_0,           %i0
                set                             data_field_1,           %i1
                set                             data_field_2,           %i2
                set                             data_field_3,           %i3
		set				0x0,			%o0
		set				0x1,			%o1
		set				0x2,			%o2
		set				0x3,			%o3
		ldx				[%i0],			%o2
		swap			[%i2],			%o2
		ldstub			[%i3],			%o3
		swap			[%i2],			%o3
		swap			[%i3],			%o0
		swap			[%i1],			%o0
		swap			[%i1],			%o0
		ldstub			[%i1],			%o1
		swap			[%i3],			%o1
		swap			[%i1],			%o3
		cas			[%i1],	%o0,	%o1
		swap			[%i3],			%o2
		ldx				[%i3],			%o1
		stx				%o1,			[%i1]
		swap			[%i0],			%o1
		cas			[%i2],	%o1,	%o2
		swap			[%i1],			%o3
		swap			[%i1],			%o0
		cas			[%i3],	%o0,	%o3
		cas			[%i0],	%o1,	%o1
		ldstub			[%i3],			%o0
		swap			[%i0],			%o2
		cas			[%i1],	%o1,	%o1
		cas			[%i2],	%o2,	%o3
		cas			[%i3],	%o0,	%o3
		stx				%o2,			[%i1]
		stx				%o2,			[%i3]
		swap			[%i2],			%o3
		stx				%o3,			[%i0]
		stx				%o3,			[%i2]
		ba		diag_pass
		nop

run_th_2:
                set                             data_field_0,           %i0
                set                             data_field_1,           %i1
                set                             data_field_2,           %i2
                set                             data_field_3,           %i3
		set				0x0,			%o0
		set				0x1,			%o1
		set				0x2,			%o2
		set				0x3,			%o3
		cas			[%i0],	%o3,	%o1
		cas			[%i1],	%o2,	%o3
		swap			[%i0],			%o1
		ldstub			[%i0],			%o1
		ldx				[%i0],			%o2
		ldstub			[%i1],			%o1
		ldstub			[%i3],			%o0
		ldx				[%i0],			%o3
		swap			[%i0],			%o2
		ldstub			[%i1],			%o2
		stx				%o1,			[%i1]
		ldx				[%i3],			%o1
		stx				%o0,			[%i1]
		ldstub			[%i1],			%o0
		swap			[%i3],			%o2
		stx				%o1,			[%i0]
		ldx				[%i1],			%o0
		ldstub			[%i1],			%o1
		cas			[%i3],	%o3,	%o2
		ldstub			[%i0],			%o1
		ldx				[%i1],			%o3
		ldx				[%i0],			%o0
		cas			[%i1],	%o0,	%o1
		cas			[%i0],	%o2,	%o2
		cas			[%i2],	%o1,	%o3
		ldstub			[%i0],			%o1
		cas			[%i2],	%o1,	%o2
		swap			[%i1],			%o0
		swap			[%i1],			%o1
		swap			[%i2],			%o0
		ba		diag_pass
		nop

run_th_3:
                set                             data_field_0,           %i0
                set                             data_field_1,           %i1
                set                             data_field_2,           %i2
                set                             data_field_3,           %i3
		set				0x0,			%o0
		set				0x1,			%o1
		set				0x2,			%o2
		set				0x3,			%o3
		cas			[%i1],	%o3,	%o1
		ldstub			[%i2],			%o3
		ldx				[%i0],			%o2
		stx				%o2,			[%i1]
		cas			[%i2],	%o1,	%o1
		ldstub			[%i3],			%o2
		stx				%o1,			[%i0]
		cas			[%i1],	%o2,	%o0
		swap			[%i3],			%o2
		stx				%o0,			[%i0]
		cas			[%i3],	%o0,	%o2
		cas			[%i0],	%o1,	%o2
		swap			[%i3],			%o2
		ldx				[%i0],			%o0
		stx				%o2,			[%i0]
		stx				%o2,			[%i0]
		cas			[%i2],	%o3,	%o1
		stx				%o0,			[%i3]
		cas			[%i1],	%o1,	%o3
		stx				%o1,			[%i3]
		stx				%o3,			[%i3]
		ldx				[%i0],			%o3
		ldx				[%i1],			%o2
		cas			[%i2],	%o1,	%o2
		ldx				[%i2],			%o0
		swap			[%i3],			%o0
		cas			[%i1],	%o1,	%o2
		swap			[%i1],			%o2
		ldstub			[%i0],			%o3
		swap			[%i2],			%o0
		ba		diag_pass


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

.align 0x2000

data_field_0:
        .word 0x01010101
        .word 0x02020202
        .word 0x03030303
        .word 0x04040404

.align 0x400

data_field_1:
        .word 0x05050505
        .word 0x06060606
        .word 0x07070707
        .word 0x08080808

.align 0x400

data_field_2:
        .word 0x09090909
        .word 0x0a0a0a0a
        .word 0x0b0b0b0b
        .word 0x0c0c0c0c

.align 0x400

data_field_3:
        .word 0x0d0d0d0d
        .word 0x0e0e0e0e
        .word 0x0f0f0f0f
        .word 0xf0f0f0f0

.end
