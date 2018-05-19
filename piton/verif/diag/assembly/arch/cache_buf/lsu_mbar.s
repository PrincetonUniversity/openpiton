// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: lsu_mbar.s
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

#include "boot.s"

!!-------------------------------------------------------------------------------
!!
!!      This file has the micro-code to test out the invalidate of L1-DCache
!!
!!-------------------------------------------------------------------------------
.global main

.text
main:
.global dtte_8kb_data
	/*
	 *****************************************	 
	 * Initialize all the registers
	 ***************************************** 
	 */
	set     0xa11eaa7b,     %l0
	set     0xd62bec34,     %l1
	set     0xc6d0664c,     %l2
	set     0x10142e8d,     %l3
	set     0x6f49ec30,     %l4
	set     0x653074c8,     %l5
	set     0x37d4057a,     %l6
	set     0x8d478278,     %l7
	set     0xc5fb29f4,     %i0
	set     0xdf32297b,     %i1
	set     0x7d2696a7,     %i2
	set     0x1131b042,     %i3
	set     0x50804d86,     %i4
	set     0xf97a52fb,     %i5
	set     0x5805e05b,     %i6
	set     0x5889e847,     %i7
	set     0x8124a666,     %o0
	set     0xebfcc675,     %o1
	set     0xe8901b88,     %o2
	set     0x6d0fd455,     %o3
	set     0xf87278f3,     %o4
	set     0x8d3dc916,     %o5
	set     0x4ebe6aba,     %o6
	set     0x333910d6,     %o7

#define MMSK_StoreStore 0x8
#define MMSK_LoadStore  0x4
#define MMSK_StoreLoad  0x2
#define MMSK_LoadLoad   0x1
#define CMSK_SYNCBAR	 0x40
#define CMSK_MEMISSU 	 0x20
#define CMSK_LOOKASIDE	 0x10

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_0_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  0
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  0
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  0
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  0
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_0_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  16
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  16
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  16
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  16
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_0_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  32
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  32
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  32
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  32
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_0_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  48
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  48
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  48
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  48
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_0_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  64
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  64
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  64
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  64
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_0_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  80
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  80
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  80
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  80
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_0_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  96
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  96
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  96
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  96
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_0_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  112
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  112
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  112
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  112
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_1_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  1
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  1
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  1
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  1
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_1_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  17
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  17
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  17
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  17
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_1_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  33
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  33
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  33
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  33
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_1_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  49
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  49
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  49
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  49
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_1_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  65
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  65
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  65
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  65
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_1_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  81
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  81
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  81
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  81
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_1_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  97
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  97
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  97
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  97
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_1_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  113
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  113
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  113
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  113
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_2_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  2
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  2
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  2
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  2
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_2_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  18
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  18
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  18
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  18
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_2_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  34
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  34
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  34
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  34
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_2_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  50
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  50
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  50
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  50
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_2_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  66
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  66
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  66
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  66
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_2_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  82
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  82
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  82
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  82
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_2_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  98
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  98
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  98
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  98
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_2_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  114
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  114
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  114
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  114
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_3_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  3
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  3
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  3
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  3
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_3_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  19
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  19
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  19
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  19
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_3_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  35
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  35
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  35
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  35
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_3_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  51
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  51
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  51
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  51
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_3_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  67
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  67
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  67
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  67
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_3_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  83
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  83
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  83
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  83
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_3_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  99
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  99
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  99
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  99
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_3_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  115
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  115
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  115
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  115
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_4_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  4
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  4
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  4
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  4
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_4_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  20
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  20
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  20
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  20
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_4_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  36
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  36
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  36
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  36
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_4_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  52
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  52
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  52
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  52
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_4_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  68
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  68
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  68
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  68
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_4_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  84
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  84
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  84
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  84
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_4_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  100
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  100
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  100
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  100
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_4_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  116
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  116
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  116
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  116
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_5_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  5
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  5
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  5
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  5
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_5_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  21
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  21
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  21
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  21
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_5_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  37
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  37
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  37
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  37
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_5_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  53
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  53
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  53
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  53
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_5_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  69
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  69
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  69
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  69
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_5_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  85
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  85
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  85
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  85
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_5_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  101
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  101
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  101
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  101
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_5_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  117
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  117
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  117
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  117
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_6_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  6
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  6
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  6
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  6
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_6_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  22
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  22
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  22
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  22
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_6_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  38
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  38
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  38
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  38
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_6_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  54
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  54
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  54
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  54
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_6_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  70
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  70
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  70
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  70
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_6_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  86
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  86
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  86
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  86
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_6_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  102
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  102
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  102
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  102
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_6_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  118
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  118
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  118
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  118
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_7_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  7
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  7
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  7
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  7
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_7_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  23
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  23
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  23
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  23
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_7_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  39
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  39
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  39
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  39
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_7_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  55
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  55
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  55
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  55
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_7_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  71
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  71
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  71
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  71
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_7_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  87
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  87
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  87
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  87
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_7_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  103
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  103
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  103
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  103
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_7_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  119
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  119
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  119
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  119
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_8_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  8
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  8
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  8
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  8
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_8_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  24
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  24
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  24
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  24
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_8_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  40
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  40
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  40
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  40
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_8_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  56
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  56
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  56
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  56
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_8_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  72
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  72
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  72
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  72
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_8_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  88
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  88
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  88
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  88
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_8_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  104
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  104
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  104
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  104
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_8_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  120
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  120
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  120
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  120
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_9_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  9
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  9
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  9
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  9
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_9_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  25
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  25
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  25
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  25
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_9_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  41
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  41
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  41
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  41
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_9_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  57
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  57
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  57
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  57
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_9_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  73
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  73
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  73
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  73
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_9_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  89
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  89
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  89
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  89
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_9_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  105
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  105
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  105
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  105
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_9_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  121
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  121
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  121
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  121
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_10_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  10
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  10
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  10
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  10
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_10_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  26
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  26
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  26
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  26
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_10_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  42
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  42
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  42
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  42
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_10_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  58
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  58
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  58
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  58
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_10_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  74
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  74
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  74
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  74
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_10_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  90
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  90
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  90
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  90
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_10_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  106
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  106
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  106
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  106
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_10_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  122
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  122
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  122
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  122
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_11_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  11
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  11
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  11
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  11
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_11_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  27
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  27
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  27
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  27
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_11_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  43
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  43
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  43
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  43
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_11_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  59
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  59
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  59
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  59
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_11_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  75
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  75
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  75
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  75
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_11_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  91
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  91
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  91
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  91
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_11_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  107
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  107
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  107
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  107
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_11_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  123
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  123
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  123
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  123
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_12_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  12
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  12
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  12
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  12
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_12_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  28
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  28
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  28
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  28
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_12_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  44
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  44
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  44
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  44
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_12_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  60
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  60
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  60
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  60
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_12_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  76
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  76
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  76
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  76
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_12_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  92
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  92
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  92
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  92
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_12_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  108
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  108
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  108
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  108
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

	mov	0x0,	%l0
	setx	dtte_8kb_data, %l0, %l1	
mbar_12_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  124
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  124
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  124
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  124
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_13_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  13
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  13
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  13
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  13
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_13_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  29
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  29
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  29
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  29
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_13_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  45
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  45
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  45
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  45
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_13_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  61
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  61
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  61
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  61
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_13_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  77
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  77
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  77
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  77
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_13_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  93
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  93
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  93
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  93
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_13_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  109
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  109
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  109
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  109
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_13_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  125
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  125
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  125
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  125
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_14_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  14
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  14
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  14
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  14
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_14_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  30
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  30
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  30
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  30
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_14_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  46
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  46
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  46
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  46
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_14_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  62
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  62
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  62
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  62
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_14_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  78
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  78
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  78
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  78
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_14_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  94
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  94
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  94
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  94
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_14_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  110
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  110
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  110
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  110
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_14_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  126
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  126
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  126
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  126
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_15_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  15
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  15
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  15
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  15
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_15_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  31
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  31
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  31
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  31
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_15_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  47
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  47
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  47
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  47
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_15_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  63
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  63
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  63
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  63
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_15_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  79
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  79
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  79
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  79
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_15_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  95
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  95
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  95
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  95
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_15_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  111
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  111
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  111
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  111
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

mbar_15_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        membar  127
        ldx     [%l1],  %l2
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        membar  127
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  127
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]
	 nop;nop;nop;nop;nop;nop;

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        membar  127
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
	 nop;nop;nop;nop;nop;nop;

	 add	 %l1,	 0x10,	%l1

/*
 ********************************
 *      Diag PASSED !           *
 ********************************
 */
diag_pass:
        set     0xaaddcafe,     %l0
        ta T_GOOD_TRAP
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */
diag_fail:
        set     0xdeadcafe,     %l0
        ta T_BAD_TRAP
        nop
        nop

!!-----------------------------------------------------
!!      8kb page size for I/D TTE
!!-----------------------------------------------------
#define RDM_8KB_PG_BASE_DATA_ADDR     0x20018000
#define RDM_8KB_PG_BASE_DATA_ADDR_RA  0x20018000

SECTION .RDM_8KB_PAGE	DATA_VA=RDM_8KB_PG_BASE_DATA_ADDR
attr_data {
        Name = .RDM_8KB_PAGE
        VA=RDM_8KB_PG_BASE_DATA_ADDR, 
	PA=ra2pa(RDM_8KB_PG_BASE_DATA_ADDR_RA,0),
	RA=RDM_8KB_PG_BASE_DATA_ADDR_RA,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }


.data

.global  dtte_8kb_data
dtte_8kb_data:
		.word 0x9815eab4
		.word 0xf2b427ce
		.word 0xf633108c
		.word 0xc0da9434
		.word 0xa411dff5
		.word 0xafce8756
		.word 0x6d10195d
		.word 0x3cf6a878
		.word 0x76ec9e96
		.word 0x9aaf3074
		.word 0x28226c44
		.word 0x503e5b34
		.word 0x91834a1e
		.word 0x4521dc7d
		.word 0xdaf87740
		.word 0xdd5f87a3
		.word 0xc2908d16
		.word 0xbe83461b
		.word 0x803aeab3
		.word 0xae26df0e
		.word 0xe5e40394
		.word 0x608a8250
		.word 0xf9113811
		.word 0x810f9370
		.word 0x450d3b15
		.word 0x496065ba
		.word 0x60c2c7d4
		.word 0xd050885d
		.word 0xfc165b90
		.word 0x29717a18
		.word 0x1f611ab3
		.word 0x52112e1f
		.word 0x4a17cdc7
		.word 0x672b480c
		.word 0x2a564a12
		.word 0x7f6e6b21
		.word 0x582f72df
		.word 0x869df922
		.word 0x2f769bbb
		.word 0xf79a3790
		.word 0x86fb4133
		.word 0xbb079610
		.word 0x5eb1cce
		.word 0xcbe6cf3e
		.word 0x94605a64
		.word 0x8cde653f
		.word 0x4b3677f6
		.word 0x43389dca
		.word 0x1664eeb4
		.word 0x54442d8a
		.word 0x98f47add
		.word 0x6d6848fe
		.word 0x9d748194
		.word 0xb6246145
		.word 0x507fee1
		.word 0x93d07d77
		.word 0xe5cb637a
		.word 0x65db7580
		.word 0x58f22907
		.word 0xb9d9618b
		.word 0x7e3f74f8
		.word 0xb665e98b
		.word 0x8949352f
		.word 0xa10dd266
		.word 0x2f69870a
		.word 0x58f9c2bd
		.word 0xd2f44089
		.word 0x2e64cf76
		.word 0xca93ecaf
		.word 0x5bd58071
		.word 0x9434c747
		.word 0x542bb809
		.word 0x410811ba
		.word 0xaf3bcc51
		.word 0x82ddc994
		.word 0x5ba43f33
		.word 0x739e2ae9
		.word 0x48436ad6
		.word 0x82a3cbc4
		.word 0x4d3339f5
		.word 0xdd0f5336
		.word 0x4d97300e
		.word 0xc57025cc
		.word 0x642bab9a
		.word 0x70bbaa6d
		.word 0x79b9fca0
		.word 0x6f5555f3
		.word 0xb613b464
		.word 0xf89b48fe
		.word 0x351f070d
		.word 0x7694ac9
		.word 0x22f74668
		.word 0x312a1d14
		.word 0x88a6f538
		.word 0x19a5d858
		.word 0xf36c4b6
		.word 0x768c04e5
		.word 0x63168a28
		.word 0x933ecc99
		.word 0x7d7df0bc
		.word 0x3c27ba4b
		.word 0x3a23ec0b
		.word 0x45e05729
		.word 0xb371c9eb
		.word 0xc4cc6393
		.word 0x8e03c67d
		.word 0x463fb83c
		.word 0x5b6a439a
		.word 0xbe5edd95
		.word 0x852fcd0a
		.word 0x62936ad1
		.word 0xeb76f52b
		.word 0xee491304
		.word 0xb9b461f1
		.word 0x5273e27
		.word 0x3c3c286b
		.word 0x4b6f507
		.word 0x71eb652a
		.word 0x8194126f
		.word 0x8b27ea3e
		.word 0xc951e908
		.word 0x28666faa
		.word 0xff6a2cc2
		.word 0x6955017b
		.word 0xde4bfcb
		.word 0x4a2afee5
		.word 0x1e985655
		.word 0x3d6bf014
		.word 0x675f89c1
		.word 0x3875494
		.word 0xafc93aea
		.word 0x5130627a
		.word 0x6d53dc9d
		.word 0x6aef0eb8
		.word 0xc093ba89
		.word 0xd56bb13f
		.word 0xd0775e27
		.word 0x32babbde
		.word 0xff2226f
		.word 0xaecb58fc
		.word 0xb343a851
		.word 0xa695efa3
		.word 0x3e3f8147
		.word 0x36548c74
		.word 0x61a7da87
		.word 0x3c1b9b7a
		.word 0xa4398a97
		.word 0xbe7c44f9
		.word 0x6f316c4b
		.word 0x8fd8afac
		.word 0x5178bd7c
		.word 0xa505750e
		.word 0xdb571500
		.word 0xb4e948a0
		.word 0xdbb7c29a
		.word 0xe7bd414d
		.word 0xaae9dd05
		.word 0x35e4ec5c
		.word 0x305e354d
		.word 0xa147638b
		.word 0x495dac05
		.word 0xbe129c4b
		.word 0xc0524c23
		.word 0xf1ab1c39
		.word 0x6ddbe88c
		.word 0xd225bf40
		.word 0x1658148e
		.word 0xb673560d
		.word 0x7427fcde
		.word 0x445127ba
		.word 0x197c35d5
		.word 0xe3adfe0
		.word 0x7186d504
		.word 0xa88dba69
		.word 0x2736f4c
		.word 0xda7e0d9
		.word 0x7757aa26
		.word 0x3fc678f1
		.word 0xf3b745c4
		.word 0xc667eacb
		.word 0xb11daf20
		.word 0xe373f4ed
		.word 0x73bb9444
		.word 0xedf04edb
		.word 0x6f9f724e
		.word 0xfb4d6f36
		.word 0xf61ff3f8
		.word 0x17dc9866
		.word 0xe7ba08aa
		.word 0x84562764
		.word 0x977b2f69
		.word 0xc0ff5221
		.word 0xeed35619
		.word 0x7ff19f94
		.word 0xe8e34ee
		.word 0xe2d77981
		.word 0x61b80701
		.word 0x9b11d86b
		.word 0x308f3c62
		.word 0xa55f445c
		.word 0xa670f1e
		.word 0x9d3ec95b
		.word 0xc4151416
		.word 0x1d4f1ccf
		.word 0xbf15c196
		.word 0xd5669924
		.word 0x7a35c909
		.word 0x1139f762
		.word 0x65d4d64a
		.word 0xab5a5a9e
		.word 0xeeeb1e56
		.word 0x1e96676a
		.word 0x65eff06e
		.word 0x20d351b4
		.word 0x6c0287ed
		.word 0x8b1a15ae
		.word 0x8fa67a5b
		.word 0x101904b3
		.word 0xac059c85
		.word 0xbd037d4d
		.word 0x6d75eaa3
		.word 0x89209dc4
		.word 0xfe332d1
		.word 0x84812de
		.word 0x651ac666
		.word 0xc48260b7
		.word 0x21f09df1
		.word 0xe55b39d9
		.word 0xbaeef4e3
		.word 0xb62a3901
		.word 0xe5dbd2b
		.word 0x12a4ac34
		.word 0xf5a13851
		.word 0x9474a407
		.word 0x13add2da
		.word 0xca033851
		.word 0xe3aadfef
		.word 0x6bb97b9d
		.word 0x307256a6
		.word 0x7222f916
		.word 0x8ca60759
		.word 0x965a64c8
		.word 0x4da436f4
		.word 0xc63c6c5d
		.word 0x27f7f71d
		.word 0x3682e6cb
		.word 0x59cb3da0
		.word 0xb8440b8f
		.word 0x1d687a8e
		.word 0x65246e61
		.word 0xafea8be9
		.word 0x97e84a8b
		.word 0x84783ed7
		.word 0x198c146
		.word 0x692461ac
		.word 0xb63620cb
.end
