// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mt_Dmiss_sameset.s
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
  File:		mt_Dmiss_sameset.s

  Description:
  -----------
  4 threads issue loads/stores/atomics to 12 different tags
  belonging to the same set.

  $Change: 17073 $
 *************************************************************/
		
#define THREAD_COUNT    4
#define MAIN_PAGE_NUCLEUS_ALSO
#include "boot.s"

.text
.global main
.global run_th_0
.global run_th_1
.global run_th_2
.global run_th_3

main:

thread_jump:
	ta T_CHANGE_PRIV
        wr  %g0, 0x10, %asi
	th_fork(run_th)
        ba diag_fail
	nop

run_th_0:
		setx		page1,		%l0,		%o0
		add		%o0,		0x400,		%o1
		add		%o1,		0x400,		%o2
		add		%o2,		0x400,		%o3
		add		%o3,		0x400,		%o4
		add		%o4,		0x400,		%o5
		add		%o5,		0x400,		%o6
		add		%o6,		0x400,		%o7
		add		%o7,	 	0x400,		%i4
		add		%i4,	 	0x400,		%i5
		add		%i5,	 	0x400,		%i6
		add		%i6,	 	0x400,		%i7

		! loads to set0, with empty STB
		ldx		[%o0],			%l0
		ldx		[%o1],			%l1
		ldx		[%o2],			%l2
		ldx		[%o3],			%l3
		ldx		[%o4],			%l4
		ldx		[%o5],			%l5
		ldx		[%o6],			%l6
		ldx		[%o7],			%l7
		ldx		[%i4],			%i0
		ldx		[%i5],			%i1
		ldx		[%i6],			%i2
		ldx		[%i7],			%i3

		! casa to set0, with empty STB
		casa	[%o0] %asi,	%l0,	%i3
		casa	[%o1] %asi,	%l1,	%i2
		casa	[%o2] %asi,	%l2,	%i1
		casa	[%o3] %asi,	%l3,	%i0
		casa	[%o4] %asi,	%l4,	%l7
		casa	[%o5] %asi,	%l5,	%l6
		casa	[%o6] %asi,	%l6,	%l5
		casa	[%o7] %asi,	%l7,	%l4
		casa	[%i4] %asi,	%i0,	%l3
		casa	[%i5] %asi,	%i1,	%l2
		casa	[%i6] %asi,	%i2,	%l1
		casa	[%i7] %asi,	%i3,	%l0
		
		! swaps to set2, with empty STB
		swap		[%o0+0x20],			%l0
		swap		[%o1+0x20],			%l1
		swap		[%o2+0x20],			%l2
		swap		[%o3+0x20],			%l3
		swap		[%o4+0x20],			%l4
		swap		[%o5+0x20],			%l5
		swap		[%o6+0x20],			%l6
		swap		[%o7+0x20],			%l7
		swap		[%i4+0x20],			%i0
		swap		[%i5+0x20],			%i1
		swap		[%i6+0x20],			%i2
		swap		[%i7+0x20],			%i3

		! ldstub to set3, with empty STB
		ldstub		[%o0+0x30],			%l0
		ldstub		[%o1+0x30],			%l1
		ldstub		[%o2+0x30],			%l2
		ldstub		[%o3+0x30],			%l3
		ldstub		[%o4+0x30],			%l4
		ldstub		[%o5+0x30],			%l5
		ldstub		[%o6+0x30],			%l6
		ldstub		[%o7+0x30],			%l7
		ldstub		[%i4+0x30],			%i0
		ldstub		[%i5+0x30],			%i1
		ldstub		[%i6+0x30],			%i2
		ldstub		[%i7+0x30],			%i3
	
		! stores to set1, filling STB
		stx		%l0,	[%o0]
		stx		%l1,	[%o1]
		stx		%l2,	[%o2]
		stx		%l3,	[%o3]
		stx		%l4,	[%o4]
		stx		%l5,	[%o5]
		stx		%l6,	[%o6]
		stx		%l7,	[%o7]

		! ldx to set1, loads should hit in the STB
		ldx		[%o0+0x10],			%l0
		ldx		[%o1+0x10],			%l1
		ldx		[%o2+0x10],			%l2
		ldx		[%o3+0x10],			%l3
		ldx		[%o4+0x10],			%l4
		ldx		[%o5+0x10],			%l5
		ldx		[%o6+0x10],			%l6
		ldx		[%o7+0x10],			%l7

		ba		diag_pass
		nop

run_th_1:
		set		0x162c00,			%o0
		set		0x162800,			%o1
		set		0x162400,			%o2
		set		0x162000,			%o3
		set		0x161c00,			%o4
		set		0x161800,			%o5
		set		0x161400,			%o6
		set		0x161000,			%o7
		set		0x160c00,			%i4
		set		0x160800,			%i5
		set		0x160400,			%i6
		set		0x160000,			%i7
		
		! loads to set0, with empty STB
		ldx		[%o0],			%l0
		ldx		[%o1],			%l1
		ldx		[%o2],			%l2
		ldx		[%o3],			%l3
		ldx		[%o4],			%l4
		ldx		[%o5],			%l5
		ldx		[%o6],			%l6
		ldx		[%o7],			%l7
		ldx		[%i4],			%i0
		ldx		[%i5],			%i1
		ldx		[%i6],			%i2
		ldx		[%i7],			%i3

		! casa to set0, with empty STB
		casa	[%o0] %asi,	%l0,	%i3
		casa	[%o1] %asi,	%l1,	%i2
		casa	[%o2] %asi,	%l2,	%i1
		casa	[%o3] %asi,	%l3,	%i0
		casa	[%o4] %asi,	%l4,	%l7
		casa	[%o5] %asi,	%l5,	%l6
		casa	[%o6] %asi,	%l6,	%l5
		casa	[%o7] %asi,	%l7,	%l4
		casa	[%i4] %asi,	%i0,	%l3
		casa	[%i5] %asi,	%i1,	%l2
		casa	[%i6] %asi,	%i2,	%l1
		casa	[%i7] %asi,	%i3,	%l0
		
		! swaps to set2, with empty STB
		swap		[%o0+0x20],			%l0
		swap		[%o1+0x20],			%l1
		swap		[%o2+0x20],			%l2
		swap		[%o3+0x20],			%l3
		swap		[%o4+0x20],			%l4
		swap		[%o5+0x20],			%l5
		swap		[%o6+0x20],			%l6
		swap		[%o7+0x20],			%l7
		swap		[%i4+0x20],			%i0
		swap		[%i5+0x20],			%i1
		swap		[%i6+0x20],			%i2
		swap		[%i7+0x20],			%i3

		! ldstub to set3, with empty STB
		ldstub		[%o0+0x30],			%l0
		ldstub		[%o1+0x30],			%l1
		ldstub		[%o2+0x30],			%l2
		ldstub		[%o3+0x30],			%l3
		ldstub		[%o4+0x30],			%l4
		ldstub		[%o5+0x30],			%l5
		ldstub		[%o6+0x30],			%l6
		ldstub		[%o7+0x30],			%l7
		ldstub		[%i4+0x30],			%i0
		ldstub		[%i5+0x30],			%i1
		ldstub		[%i6+0x30],			%i2
		ldstub		[%i7+0x30],			%i3
	
		! stores to set1, filling STB
		stx		%l0,	[%o0]
		add		%o0,    0x10,  %o0
		stx		%l1,	[%o1]
		add		%o1,    0x10,  %o1
		stx		%l2,	[%o2]
		add		%o2,    0x10,  %o2
		stx		%l3,	[%o3]
		add		%o3,    0x10,  %o3
		stx		%l4,	[%o4]
		add		%o4,    0x10,  %o4
		stx		%l5,	[%o5]
		add		%o5,    0x10,  %o5
		stx		%l6,	[%o6]
		add		%o6,    0x10,  %o6
		stx		%l7,	[%o7]
		add		%o7,    0x10,  %o7

		ba		diag_pass
		nop
		
run_th_2:
		set		0x161400,			%o0
		set		0x161800,			%o1
		set		0x161000,			%o2
		set		0x161c00,			%o3
		set		0x160c00,			%o4
		set		0x162000,			%o5
		set		0x160800,			%o6
		set		0x162400,			%o7
		set		0x160400,			%i4
		set		0x162800,			%i5
		set		0x160000,			%i6
		set		0x162c00,			%i7
		
		! loads to set0, with empty STB
		ldx		[%o0],			%l0
		ldx		[%o1],			%l1
		ldx		[%o2],			%l2
		ldx		[%o3],			%l3
		ldx		[%o4],			%l4
		ldx		[%o5],			%l5
		ldx		[%o6],			%l6
		ldx		[%o7],			%l7
		ldx		[%i4],			%i0
		ldx		[%i5],			%i1
		ldx		[%i6],			%i2
		ldx		[%i7],			%i3

		! casa to set0, with empty STB
		casa	[%o0] %asi,	%l0,	%i3
		casa	[%o1] %asi,	%l1,	%i2
		casa	[%o2] %asi,	%l2,	%i1
		casa	[%o3] %asi,	%l3,	%i0
		casa	[%o4] %asi,	%l4,	%l7
		casa	[%o5] %asi,	%l5,	%l6
		casa	[%o6] %asi,	%l6,	%l5
		casa	[%o7] %asi,	%l7,	%l4
		casa	[%i4] %asi,	%i0,	%l3
		casa	[%i5] %asi,	%i1,	%l2
		casa	[%i6] %asi,	%i2,	%l1
		casa	[%i7] %asi,	%i3,	%l0
		
		! swaps to set2, with empty STB
		swap		[%o0+0x20],			%l0
		swap		[%o1+0x20],			%l1
		swap		[%o2+0x20],			%l2
		swap		[%o3+0x20],			%l3
		swap		[%o4+0x20],			%l4
		swap		[%o5+0x20],			%l5
		swap		[%o6+0x20],			%l6
		swap		[%o7+0x20],			%l7
		swap		[%i4+0x20],			%i0
		swap		[%i5+0x20],			%i1
		swap		[%i6+0x20],			%i2
		swap		[%i7+0x20],			%i3

		! ldstub to set3, with empty STB
		ldstub		[%o0+0x30],			%l0
		ldstub		[%o1+0x30],			%l1
		ldstub		[%o2+0x30],			%l2
		ldstub		[%o3+0x30],			%l3
		ldstub		[%o4+0x30],			%l4
		ldstub		[%o5+0x30],			%l5
		ldstub		[%o6+0x30],			%l6
		ldstub		[%o7+0x30],			%l7
		ldstub		[%i4+0x30],			%i0
		ldstub		[%i5+0x30],			%i1
		ldstub		[%i6+0x30],			%i2
		ldstub		[%i7+0x30],			%i3
	
		! stores to set1, filling STB
		stx		%l0,	[%o0]
		stx		%l1,	[%o1]
		stx		%l2,	[%o2]
		stx		%l3,	[%o3]
		stx		%l4,	[%o4]
		stx		%l5,	[%o5]
		stx		%l6,	[%o6]
		stx		%l7,	[%o7]

		! swap to set1, should hit in the STB
		swap		[%o0+0x10],			%l0
		swap		[%o1+0x10],			%l1
		swap		[%o2+0x10],			%l2
		swap		[%o3+0x10],			%l3
		swap		[%o4+0x10],			%l4
		swap		[%o5+0x10],			%l5
		swap		[%o6+0x10],			%l6
		swap		[%o7+0x10],			%l7

		ba		diag_pass
		nop
		
run_th_3:
		set		0x160000,			%o0
		set		0x162c00,			%o1
		set		0x160400,			%o2
		set		0x162800,			%o3
		set		0x160800,			%o4
		set		0x162400,			%o5
		set		0x160c00,			%o6
		set		0x162000,			%o7
		set		0x161000,			%i4
		set		0x161c00,			%i5
		set		0x161400,			%i6
		set		0x161800,			%i7

		! loads to set0, with empty STB
		ldx		[%o0],			%l0
		ldx		[%o1],			%l1
		ldx		[%o2],			%l2
		ldx		[%o3],			%l3
		ldx		[%o4],			%l4
		ldx		[%o5],			%l5
		ldx		[%o6],			%l6
		ldx		[%o7],			%l7
		ldx		[%i4],			%i0
		ldx		[%i5],			%i1
		ldx		[%i6],			%i2
		ldx		[%i7],			%i3

		! casa to set0, with empty STB
		casa	[%o0] %asi,	%l0,	%i3
		casa	[%o1] %asi,	%l1,	%i2
		casa	[%o2] %asi,	%l2,	%i1
		casa	[%o3] %asi,	%l3,	%i0
		casa	[%o4] %asi,	%l4,	%l7
		casa	[%o5] %asi,	%l5,	%l6
		casa	[%o6] %asi,	%l6,	%l5
		casa	[%o7] %asi,	%l7,	%l4
		casa	[%i4] %asi,	%i0,	%l3
		casa	[%i5] %asi,	%i1,	%l2
		casa	[%i6] %asi,	%i2,	%l1
		casa	[%i7] %asi,	%i3,	%l0
		
		! swaps to set2, with empty STB
		swap		[%o0+0x20],			%l0
		swap		[%o1+0x20],			%l1
		swap		[%o2+0x20],			%l2
		swap		[%o3+0x20],			%l3
		swap		[%o4+0x20],			%l4
		swap		[%o5+0x20],			%l5
		swap		[%o6+0x20],			%l6
		swap		[%o7+0x20],			%l7
		swap		[%i4+0x20],			%i0
		swap		[%i5+0x20],			%i1
		swap		[%i6+0x20],			%i2
		swap		[%i7+0x20],			%i3

		! ldstub to set3, with empty STB
		ldstub		[%o0+0x30],			%l0
		ldstub		[%o1+0x30],			%l1
		ldstub		[%o2+0x30],			%l2
		ldstub		[%o3+0x30],			%l3
		ldstub		[%o4+0x30],			%l4
		ldstub		[%o5+0x30],			%l5
		ldstub		[%o6+0x30],			%l6
		ldstub		[%o7+0x30],			%l7
		ldstub		[%i4+0x30],			%i0
		ldstub		[%i5+0x30],			%i1
		ldstub		[%i6+0x30],			%i2
		ldstub		[%i7+0x30],			%i3
	
		! stores to set1, filling STB
		stx		%l0,	[%o0]
		stx		%l1,	[%o1]
		stx		%l2,	[%o2]
		stx		%l3,	[%o3]
		stx		%l4,	[%o4]
		stx		%l5,	[%o5]
		stx		%l6,	[%o6]
		stx		%l7,	[%o7]

		! ldstubs to set1, should hit in the STB
		ldstub		[%o0+0x10],			%l0
		ldstub		[%o1+0x10],			%l1
		ldstub		[%o2+0x10],			%l2
		ldstub		[%o3+0x10],			%l3
		ldstub		[%o4+0x10],			%l4
		ldstub		[%o5+0x10],			%l5
		ldstub		[%o6+0x10],			%l6
		ldstub		[%o7+0x10],			%l7

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

.end

SECTION .PAGE1 DATA_VA=0x160000
attr_data {
        Name = .PAGE1,
        VA=0x160000, PA=0x1100160000, RA=0x100160000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

.data
.global page1

page1:	
		.xword 0x0000000000000000 
		.xword 0x1111111111111111 
		.xword 0x2222222222222222 
		.xword 0x3333333333333333 
		.xword 0x4444444444444444 
		.xword 0x5555555555555555 
		.xword 0x6666666666666666 
		.xword 0x7777777777777777 
		.xword 0x8888888888888888 
		.xword 0x9999999999999999 
		.xword 0xaaaaaaaaaaaaaaaa 
		.xword 0xbbbbbbbbbbbbbbbb 
		.xword 0xcccccccccccccccc 
		.xword 0xdddddddddddddddd 
		.xword 0xeeeeeeeeeeeeeeee 
		.xword 0xffffffffffffffff 
.skip 8196
.skip 8196
.end

