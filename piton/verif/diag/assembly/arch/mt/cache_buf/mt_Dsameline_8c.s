// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mt_Dsameline.s
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
  File:		mt_Dsameline.s

  Description:
  -----------
  4 threads issue load/store/atomic to the same cache line.

  $Change: 17073 $
 *************************************************************/
		
#define THREAD_COUNT   16
#include "boot.s"

.text
.global main
.global run_th_0
.global run_th_1
.global run_th_2
.global run_th_3
.global run_th_4
.global run_th_5
.global run_th_6
.global run_th_7
.global run_th_8
.global run_th_9
.global run_th_10
.global run_th_11
.global run_th_12
.global run_th_13
.global run_th_14
.global run_th_15

main:

thread_jump:
	th_fork(run_th)

        ba diag_fail
	nop

run_th_0:
		set				data_field_0,		%i0
		set				0x0,			%o0
		set				0x1,			%o1
		set				0x2,			%o2
		set				0x3,			%o3
		cas			[%i0],	%o3,	%o1
		stx				%o1,			[%i0]
		ldx				[%i0],			%o2
		ldstub			[%i0],			%o0
		stx				%o3,			[%i0]
		ldstub			[%i0],			%o1
		ldstub			[%i0],			%o3
		ldstub			[%i0],			%o1
		swap			[%i0],			%o1
		ldx				[%i0],			%o2
		ldstub			[%i0],			%o3
		ldstub			[%i0],			%o0
		ldstub			[%i0],			%o0
		ldstub			[%i0],			%o2
		cas			[%i0],	%o3,	%o1
		stx				%o1,			[%i0]
		stx				%o1,			[%i0]
		swap			[%i0],			%o1
		cas			[%i0],	%o2,	%o2
		ldx				[%i0],			%o0
		ldstub			[%i0],			%o2
		ldstub			[%i0],			%o1
		stx				%o1,			[%i0]
		ldx				[%i0],			%o0
		ldx				[%i0],			%o3
		stx				%o3,			[%i0]
		ldx				[%i0],			%o3
		stx				%o3,			[%i0]
		ldx				[%i0],			%o2
		ldstub			[%i0],			%o2
		stx				%o0,			[%i0]
		ldstub			[%i0],			%o1
		ba		diag_pass
		nop

run_th_1:
		set				data_field_0,		%i0
		set				0x0,		%o0
		set				0x1,		%o1
		set				0x2,		%o2
		set				0x3,		%o3
		cas			[%i0],	%o2,	%o2
		stx				%o1,			[%i0]
		ldstub			[%i0],			%o1
		ldstub			[%i0],			%o1
		stx				%o1,			[%i0]
		stx				%o0,			[%i0]
		ldstub			[%i0],			%o2
		ldx				[%i0],			%o2
		stx				%o1,			[%i0]
		ldstub			[%i0],			%o0
		cas			[%i0],	%o1,	%o2
		ldstub			[%i0],			%o0
		ldstub			[%i0],			%o1
		cas			[%i0],	%o1,	%o2
		stx				%o1,			[%i0]
		stx				%o3,			[%i0]
		cas			[%i0],	%o3,	%o1
		cas			[%i0],	%o3,	%o1
		swap			[%i0],			%o0
		ldstub			[%i0],			%o2
		ldstub			[%i0],			%o0
		swap			[%i0],			%o1
		ldx				[%i0],			%o2
		cas			[%i0],	%o2,	%o3
		stx				%o0,			[%i0]
		stx				%o1,			[%i0]
		swap			[%i0],			%o0
		swap			[%i0],			%o0
		stx				%o1,			[%i0]
		ldx				[%i0],			%o2
		ldstub			[%i0],			%o3
		swap			[%i0],			%o0
		ba		diag_pass
		nop
		
run_th_2:
		set				data_field_0,		%i0
		set				0x0,			%o0
		set				0x1,			%o1
		set				0x2,			%o2
		set				0x3,			%o3
		stx				%o0,			[%i0]
		ldstub			[%i0],			%o0
		stx				%o2,			[%i0]
		stx				%o2,			[%i0]
		cas			[%i0],	%o1,	%o1
		ldstub			[%i0],			%o1
		cas			[%i0],	%o1,	%o2
		swap			[%i0],			%o2
		cas			[%i0],	%o1,	%o3
		ldstub			[%i0],			%o0
		ldstub			[%i0],			%o3
		ldstub			[%i0],			%o1
		swap			[%i0],			%o1
		stx				%o0,			[%i0]
		cas			[%i0],	%o0,	%o2
		stx				%o0,			[%i0]
		swap			[%i0],			%o0
		ldx				[%i0],			%o3
		stx				%o0,			[%i0]
		swap			[%i0],			%o0
		swap			[%i0],			%o0
		ldx				[%i0],			%o1
		ldx				[%i0],			%o3
		cas			[%i0],	%o1,	%o3
		stx				%o0,			[%i0]
		ldstub			[%i0],			%o3
		swap			[%i0],			%o3
		ldx				[%i0],			%o2
		stx				%o1,			[%i0]
		stx				%o3,			[%i0]
		ldstub			[%i0],			%o3
		cas			[%i0],	%o1,	%o1
		ba		diag_pass
		nop

run_th_3:
		set				data_field_0,		%i0
		set				0x0,			%o0
		set				0x1,			%o1
		set				0x2,			%o2
		set				0x3,			%o3
		ldx				[%i0],			%o0
		cas			[%i0],	%o1,	%o3
		cas			[%i0],	%o3,	%o3
		stx				%o2,			[%i0]
		ldx				[%i0],			%o2
		cas			[%i0],	%o3,	%o2
		swap			[%i0],			%o1
		stx				%o1,			[%i0]
		ldstub			[%i0],			%o3
		ldstub			[%i0],			%o3
		ldstub			[%i0],			%o1
		cas			[%i0],	%o1,	%o2
		swap			[%i0],			%o3
		swap			[%i0],			%o1
		swap			[%i0],			%o1
		cas			[%i0],	%o3,	%o0
		ldx				[%i0],			%o1
		ldx				[%i0],			%o2
		cas			[%i0],	%o0,	%o2
		ldstub			[%i0],			%o0
		ldstub			[%i0],			%o2
		ldx				[%i0],			%o3
		ldstub			[%i0],			%o2
		cas			[%i0],	%o2,	%o0
		swap			[%i0],			%o0
		stx				%o1,			[%i0]
		cas			[%i0],	%o1,	%o2
		ldstub			[%i0],			%o0
		stx				%o2,			[%i0]
		cas			[%i0],	%o2,	%o3
		ldx				[%i0],			%o0
		ldx				[%i0],			%o1
		ba		diag_pass
		nop
		
	


run_th_4:
		set				data_field_0,		%i0
		set				0x0,			%o0
		set				0x1,			%o1
		set				0x2,			%o2
		set				0x3,			%o3
		cas			[%i0],	%o3,	%o1
		stx				%o1,			[%i0]
		ldx				[%i0],			%o2
		ldstub			[%i0],			%o0
		stx				%o3,			[%i0]
		ldstub			[%i0],			%o1
		ldstub			[%i0],			%o3
		ldstub			[%i0],			%o1
		swap			[%i0],			%o1
		ldx				[%i0],			%o2
		ldstub			[%i0],			%o3
		ldstub			[%i0],			%o0
		ldstub			[%i0],			%o0
		ldstub			[%i0],			%o2
		cas			[%i0],	%o3,	%o1
		stx				%o1,			[%i0]
		stx				%o1,			[%i0]
		swap			[%i0],			%o1
		cas			[%i0],	%o2,	%o2
		ldx				[%i0],			%o0
		ldstub			[%i0],			%o2
		ldstub			[%i0],			%o1
		stx				%o1,			[%i0]
		ldx				[%i0],			%o0
		ldx				[%i0],			%o3
		stx				%o3,			[%i0]
		ldx				[%i0],			%o3
		stx				%o3,			[%i0]
		ldx				[%i0],			%o2
		ldstub			[%i0],			%o2
		stx				%o0,			[%i0]
		ldstub			[%i0],			%o1
		ba		diag_pass
		nop

run_th_5:
		set				data_field_0,		%i0
		set				0x0,		%o0
		set				0x1,		%o1
		set				0x2,		%o2
		set				0x3,		%o3
		cas			[%i0],	%o2,	%o2
		stx				%o1,			[%i0]
		ldstub			[%i0],			%o1
		ldstub			[%i0],			%o1
		stx				%o1,			[%i0]
		stx				%o0,			[%i0]
		ldstub			[%i0],			%o2
		ldx				[%i0],			%o2
		stx				%o1,			[%i0]
		ldstub			[%i0],			%o0
		cas			[%i0],	%o1,	%o2
		ldstub			[%i0],			%o0
		ldstub			[%i0],			%o1
		cas			[%i0],	%o1,	%o2
		stx				%o1,			[%i0]
		stx				%o3,			[%i0]
		cas			[%i0],	%o3,	%o1
		cas			[%i0],	%o3,	%o1
		swap			[%i0],			%o0
		ldstub			[%i0],			%o2
		ldstub			[%i0],			%o0
		swap			[%i0],			%o1
		ldx				[%i0],			%o2
		cas			[%i0],	%o2,	%o3
		stx				%o0,			[%i0]
		stx				%o1,			[%i0]
		swap			[%i0],			%o0
		swap			[%i0],			%o0
		stx				%o1,			[%i0]
		ldx				[%i0],			%o2
		ldstub			[%i0],			%o3
		swap			[%i0],			%o0
		ba		diag_pass
		nop
		
run_th_6:
		set				data_field_0,		%i0
		set				0x0,			%o0
		set				0x1,			%o1
		set				0x2,			%o2
		set				0x3,			%o3
		stx				%o0,			[%i0]
		ldstub			[%i0],			%o0
		stx				%o2,			[%i0]
		stx				%o2,			[%i0]
		cas			[%i0],	%o1,	%o1
		ldstub			[%i0],			%o1
		cas			[%i0],	%o1,	%o2
		swap			[%i0],			%o2
		cas			[%i0],	%o1,	%o3
		ldstub			[%i0],			%o0
		ldstub			[%i0],			%o3
		ldstub			[%i0],			%o1
		swap			[%i0],			%o1
		stx				%o0,			[%i0]
		cas			[%i0],	%o0,	%o2
		stx				%o0,			[%i0]
		swap			[%i0],			%o0
		ldx				[%i0],			%o3
		stx				%o0,			[%i0]
		swap			[%i0],			%o0
		swap			[%i0],			%o0
		ldx				[%i0],			%o1
		ldx				[%i0],			%o3
		cas			[%i0],	%o1,	%o3
		stx				%o0,			[%i0]
		ldstub			[%i0],			%o3
		swap			[%i0],			%o3
		ldx				[%i0],			%o2
		stx				%o1,			[%i0]
		stx				%o3,			[%i0]
		ldstub			[%i0],			%o3
		cas			[%i0],	%o1,	%o1
		ba		diag_pass
		nop

run_th_7:
		set				data_field_0,		%i0
		set				0x0,			%o0
		set				0x1,			%o1
		set				0x2,			%o2
		set				0x3,			%o3
		ldx				[%i0],			%o0
		cas			[%i0],	%o1,	%o3
		cas			[%i0],	%o3,	%o3
		stx				%o2,			[%i0]
		ldx				[%i0],			%o2
		cas			[%i0],	%o3,	%o2
		swap			[%i0],			%o1
		stx				%o1,			[%i0]
		ldstub			[%i0],			%o3
		ldstub			[%i0],			%o3
		ldstub			[%i0],			%o1
		cas			[%i0],	%o1,	%o2
		swap			[%i0],			%o3
		swap			[%i0],			%o1
		swap			[%i0],			%o1
		cas			[%i0],	%o3,	%o0
		ldx				[%i0],			%o1
		ldx				[%i0],			%o2
		cas			[%i0],	%o0,	%o2
		ldstub			[%i0],			%o0
		ldstub			[%i0],			%o2
		ldx				[%i0],			%o3
		ldstub			[%i0],			%o2
		cas			[%i0],	%o2,	%o0
		swap			[%i0],			%o0
		stx				%o1,			[%i0]
		cas			[%i0],	%o1,	%o2
		ldstub			[%i0],			%o0
		stx				%o2,			[%i0]
		cas			[%i0],	%o2,	%o3
		ldx				[%i0],			%o0
		ldx				[%i0],			%o1
		ba		diag_pass
		nop
		


run_th_8:
		set				data_field_0,		%i0
		set				0x0,			%o0
		set				0x1,			%o1
		set				0x2,			%o2
		set				0x3,			%o3
		cas			[%i0],	%o3,	%o1
		stx				%o1,			[%i0]
		ldx				[%i0],			%o2
		ldstub			[%i0],			%o0
		stx				%o3,			[%i0]
		ldstub			[%i0],			%o1
		ldstub			[%i0],			%o3
		ldstub			[%i0],			%o1
		swap			[%i0],			%o1
		ldx				[%i0],			%o2
		ldstub			[%i0],			%o3
		ldstub			[%i0],			%o0
		ldstub			[%i0],			%o0
		ldstub			[%i0],			%o2
		cas			[%i0],	%o3,	%o1
		stx				%o1,			[%i0]
		stx				%o1,			[%i0]
		swap			[%i0],			%o1
		cas			[%i0],	%o2,	%o2
		ldx				[%i0],			%o0
		ldstub			[%i0],			%o2
		ldstub			[%i0],			%o1
		stx				%o1,			[%i0]
		ldx				[%i0],			%o0
		ldx				[%i0],			%o3
		stx				%o3,			[%i0]
		ldx				[%i0],			%o3
		stx				%o3,			[%i0]
		ldx				[%i0],			%o2
		ldstub			[%i0],			%o2
		stx				%o0,			[%i0]
		ldstub			[%i0],			%o1
		ba		diag_pass
		nop

run_th_9:
		set				data_field_0,		%i0
		set				0x0,		%o0
		set				0x1,		%o1
		set				0x2,		%o2
		set				0x3,		%o3
		cas			[%i0],	%o2,	%o2
		stx				%o1,			[%i0]
		ldstub			[%i0],			%o1
		ldstub			[%i0],			%o1
		stx				%o1,			[%i0]
		stx				%o0,			[%i0]
		ldstub			[%i0],			%o2
		ldx				[%i0],			%o2
		stx				%o1,			[%i0]
		ldstub			[%i0],			%o0
		cas			[%i0],	%o1,	%o2
		ldstub			[%i0],			%o0
		ldstub			[%i0],			%o1
		cas			[%i0],	%o1,	%o2
		stx				%o1,			[%i0]
		stx				%o3,			[%i0]
		cas			[%i0],	%o3,	%o1
		cas			[%i0],	%o3,	%o1
		swap			[%i0],			%o0
		ldstub			[%i0],			%o2
		ldstub			[%i0],			%o0
		swap			[%i0],			%o1
		ldx				[%i0],			%o2
		cas			[%i0],	%o2,	%o3
		stx				%o0,			[%i0]
		stx				%o1,			[%i0]
		swap			[%i0],			%o0
		swap			[%i0],			%o0
		stx				%o1,			[%i0]
		ldx				[%i0],			%o2
		ldstub			[%i0],			%o3
		swap			[%i0],			%o0
		ba		diag_pass
		nop
		
run_th_10:
		set				data_field_0,		%i0
		set				0x0,			%o0
		set				0x1,			%o1
		set				0x2,			%o2
		set				0x3,			%o3
		stx				%o0,			[%i0]
		ldstub			[%i0],			%o0
		stx				%o2,			[%i0]
		stx				%o2,			[%i0]
		cas			[%i0],	%o1,	%o1
		ldstub			[%i0],			%o1
		cas			[%i0],	%o1,	%o2
		swap			[%i0],			%o2
		cas			[%i0],	%o1,	%o3
		ldstub			[%i0],			%o0
		ldstub			[%i0],			%o3
		ldstub			[%i0],			%o1
		swap			[%i0],			%o1
		stx				%o0,			[%i0]
		cas			[%i0],	%o0,	%o2
		stx				%o0,			[%i0]
		swap			[%i0],			%o0
		ldx				[%i0],			%o3
		stx				%o0,			[%i0]
		swap			[%i0],			%o0
		swap			[%i0],			%o0
		ldx				[%i0],			%o1
		ldx				[%i0],			%o3
		cas			[%i0],	%o1,	%o3
		stx				%o0,			[%i0]
		ldstub			[%i0],			%o3
		swap			[%i0],			%o3
		ldx				[%i0],			%o2
		stx				%o1,			[%i0]
		stx				%o3,			[%i0]
		ldstub			[%i0],			%o3
		cas			[%i0],	%o1,	%o1
		ba		diag_pass
		nop

run_th_11:
		set				data_field_0,		%i0
		set				0x0,			%o0
		set				0x1,			%o1
		set				0x2,			%o2
		set				0x3,			%o3
		ldx				[%i0],			%o0
		cas			[%i0],	%o1,	%o3
		cas			[%i0],	%o3,	%o3
		stx				%o2,			[%i0]
		ldx				[%i0],			%o2
		cas			[%i0],	%o3,	%o2
		swap			[%i0],			%o1
		stx				%o1,			[%i0]
		ldstub			[%i0],			%o3
		ldstub			[%i0],			%o3
		ldstub			[%i0],			%o1
		cas			[%i0],	%o1,	%o2
		swap			[%i0],			%o3
		swap			[%i0],			%o1
		swap			[%i0],			%o1
		cas			[%i0],	%o3,	%o0
		ldx				[%i0],			%o1
		ldx				[%i0],			%o2
		cas			[%i0],	%o0,	%o2
		ldstub			[%i0],			%o0
		ldstub			[%i0],			%o2
		ldx				[%i0],			%o3
		ldstub			[%i0],			%o2
		cas			[%i0],	%o2,	%o0
		swap			[%i0],			%o0
		stx				%o1,			[%i0]
		cas			[%i0],	%o1,	%o2
		ldstub			[%i0],			%o0
		stx				%o2,			[%i0]
		cas			[%i0],	%o2,	%o3
		ldx				[%i0],			%o0
		ldx				[%i0],			%o1
		ba		diag_pass
		nop
		
	

run_th_12:
		set				data_field_0,		%i0
		set				0x0,			%o0
		set				0x1,			%o1
		set				0x2,			%o2
		set				0x3,			%o3
		cas			[%i0],	%o3,	%o1
		stx				%o1,			[%i0]
		ldx				[%i0],			%o2
		ldstub			[%i0],			%o0
		stx				%o3,			[%i0]
		ldstub			[%i0],			%o1
		ldstub			[%i0],			%o3
		ldstub			[%i0],			%o1
		swap			[%i0],			%o1
		ldx				[%i0],			%o2
		ldstub			[%i0],			%o3
		ldstub			[%i0],			%o0
		ldstub			[%i0],			%o0
		ldstub			[%i0],			%o2
		cas			[%i0],	%o3,	%o1
		stx				%o1,			[%i0]
		stx				%o1,			[%i0]
		swap			[%i0],			%o1
		cas			[%i0],	%o2,	%o2
		ldx				[%i0],			%o0
		ldstub			[%i0],			%o2
		ldstub			[%i0],			%o1
		stx				%o1,			[%i0]
		ldx				[%i0],			%o0
		ldx				[%i0],			%o3
		stx				%o3,			[%i0]
		ldx				[%i0],			%o3
		stx				%o3,			[%i0]
		ldx				[%i0],			%o2
		ldstub			[%i0],			%o2
		stx				%o0,			[%i0]
		ldstub			[%i0],			%o1
		ba		diag_pass
		nop

run_th_13:
		set				data_field_0,		%i0
		set				0x0,		%o0
		set				0x1,		%o1
		set				0x2,		%o2
		set				0x3,		%o3
		cas			[%i0],	%o2,	%o2
		stx				%o1,			[%i0]
		ldstub			[%i0],			%o1
		ldstub			[%i0],			%o1
		stx				%o1,			[%i0]
		stx				%o0,			[%i0]
		ldstub			[%i0],			%o2
		ldx				[%i0],			%o2
		stx				%o1,			[%i0]
		ldstub			[%i0],			%o0
		cas			[%i0],	%o1,	%o2
		ldstub			[%i0],			%o0
		ldstub			[%i0],			%o1
		cas			[%i0],	%o1,	%o2
		stx				%o1,			[%i0]
		stx				%o3,			[%i0]
		cas			[%i0],	%o3,	%o1
		cas			[%i0],	%o3,	%o1
		swap			[%i0],			%o0
		ldstub			[%i0],			%o2
		ldstub			[%i0],			%o0
		swap			[%i0],			%o1
		ldx				[%i0],			%o2
		cas			[%i0],	%o2,	%o3
		stx				%o0,			[%i0]
		stx				%o1,			[%i0]
		swap			[%i0],			%o0
		swap			[%i0],			%o0
		stx				%o1,			[%i0]
		ldx				[%i0],			%o2
		ldstub			[%i0],			%o3
		swap			[%i0],			%o0
		ba		diag_pass
		nop
		
run_th_14:
		set				data_field_0,		%i0
		set				0x0,			%o0
		set				0x1,			%o1
		set				0x2,			%o2
		set				0x3,			%o3
		stx				%o0,			[%i0]
		ldstub			[%i0],			%o0
		stx				%o2,			[%i0]
		stx				%o2,			[%i0]
		cas			[%i0],	%o1,	%o1
		ldstub			[%i0],			%o1
		cas			[%i0],	%o1,	%o2
		swap			[%i0],			%o2
		cas			[%i0],	%o1,	%o3
		ldstub			[%i0],			%o0
		ldstub			[%i0],			%o3
		ldstub			[%i0],			%o1
		swap			[%i0],			%o1
		stx				%o0,			[%i0]
		cas			[%i0],	%o0,	%o2
		stx				%o0,			[%i0]
		swap			[%i0],			%o0
		ldx				[%i0],			%o3
		stx				%o0,			[%i0]
		swap			[%i0],			%o0
		swap			[%i0],			%o0
		ldx				[%i0],			%o1
		ldx				[%i0],			%o3
		cas			[%i0],	%o1,	%o3
		stx				%o0,			[%i0]
		ldstub			[%i0],			%o3
		swap			[%i0],			%o3
		ldx				[%i0],			%o2
		stx				%o1,			[%i0]
		stx				%o3,			[%i0]
		ldstub			[%i0],			%o3
		cas			[%i0],	%o1,	%o1
		ba		diag_pass
		nop

run_th_15:
		set				data_field_0,		%i0
		set				0x0,			%o0
		set				0x1,			%o1
		set				0x2,			%o2
		set				0x3,			%o3
		ldx				[%i0],			%o0
		cas			[%i0],	%o1,	%o3
		cas			[%i0],	%o3,	%o3
		stx				%o2,			[%i0]
		ldx				[%i0],			%o2
		cas			[%i0],	%o3,	%o2
		swap			[%i0],			%o1
		stx				%o1,			[%i0]
		ldstub			[%i0],			%o3
		ldstub			[%i0],			%o3
		ldstub			[%i0],			%o1
		cas			[%i0],	%o1,	%o2
		swap			[%i0],			%o3
		swap			[%i0],			%o1
		swap			[%i0],			%o1
		cas			[%i0],	%o3,	%o0
		ldx				[%i0],			%o1
		ldx				[%i0],			%o2
		cas			[%i0],	%o0,	%o2
		ldstub			[%i0],			%o0
		ldstub			[%i0],			%o2
		ldx				[%i0],			%o3
		ldstub			[%i0],			%o2
		cas			[%i0],	%o2,	%o0
		swap			[%i0],			%o0
		stx				%o1,			[%i0]
		cas			[%i0],	%o1,	%o2
		ldstub			[%i0],			%o0
		stx				%o2,			[%i0]
		cas			[%i0],	%o2,	%o3
		ldx				[%i0],			%o0
		ldx				[%i0],			%o1
		ba		diag_pass
		nop
	

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
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
        .word  0x01234567
        .word  0x89abcdef
        .word  0xfedcba98
        .word  0x76543210

.end

