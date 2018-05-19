// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: lsu_stbar.s
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
main:
.global dtte_8kb_data
	/*
	 *****************************************	 
	 * Initialize all the registers
	 ***************************************** 
	 */
	set     0x69694cc1,     %l0
	set     0x7845e802,     %l1
	set     0xea03b102,     %l2
	set     0xd5d2820b,     %l3
	set     0xdc7eacd6,     %l4
	set     0xd6c39f76,     %l5
	set     0x83d8590,     %l6
	set     0x3b8ecfd6,     %l7
	set     0xe0818efa,     %i0
	set     0x3eb69109,     %i1
	set     0xb878421d,     %i2
	set     0x17cbb580,     %i3
	set     0x19f23cec,     %i4
	set     0x421ae569,     %i5
	set     0xe95b0d31,     %i6
	set     0xa95e4365,     %i7
	set     0xb914662c,     %o0
	set     0xa1e551c3,     %o1
	set     0x59a37fbe,     %o2
	set     0x34220353,     %o3
	set     0xa790af19,     %o4
	set     0x20c8fb44,     %o5
	set     0x56801c50,     %o6
	set     0x508671b4,     %o7

#define MMSK_StoreStore 0x8
#define MMSK_LoadStore  0x4
#define MMSK_StoreLoad  0x2
#define MMSK_LoadLoad   0x1
#define CMSK_SYNCBAR	 0x40
#define CMSK_MEMISSU 	 0x20
#define CMSK_LOOKASIDE	 0x10

       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
mbar_0_0:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_0_1:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_0_2:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_0_3:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_0_4:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_0_5:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_0_6:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_0_7:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_1_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_1_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_1_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_1_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_1_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_1_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_1_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_1_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_2_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_2_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_2_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_2_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_2_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_2_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_2_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_2_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_3_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_3_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_3_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_3_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_3_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_3_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_3_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_3_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_4_0:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_4_1:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_4_2:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_4_3:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_4_4:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_4_5:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_4_6:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_4_7:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_5_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_5_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_5_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_5_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_5_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_5_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_5_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_5_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_6_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_6_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_6_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_6_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_6_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_6_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_6_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_6_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_7_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_7_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_7_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_7_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_7_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_7_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_7_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_7_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_8_0:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_8_1:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_8_2:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_8_3:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_8_4:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_8_5:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_8_6:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_8_7:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_9_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_9_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_9_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_9_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_9_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_9_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_9_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_9_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_10_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_10_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_10_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_10_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_10_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_10_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_10_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_10_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_11_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_11_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_11_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_11_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_11_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_11_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_11_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_11_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_12_0:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_12_1:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_12_2:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_12_3:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_12_4:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_12_5:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_12_6:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_12_7:
       mov     0x0,    %l0
       setx    dtte_8kb_data, %l0, %l1
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_13_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_13_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_13_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_13_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_13_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_13_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_13_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_13_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_14_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_14_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_14_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_14_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_14_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_14_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_14_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_14_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_15_0:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_15_1:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_15_2:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_15_3:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_15_4:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_15_5:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_15_6:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	 %l1,	 0x10,	%l1

mbar_15_7:
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]
        sth     %o6,    [%l1+0x6]
        stbar
        ldx     [%l1],  %l2

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

	 add	%l1,	0x10,	%l1

        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        stx     %o3,    [%l1]
        stb     %o5,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        ldx     [%l1+0x8],  %l2
        sth     %o2,    [%l1+0x4]

        stx     %o3,    [%l1]
        st      %o0,    [%l1]
        stb     %o1,    [%l1+7]
        sth     %o2,    [%l1+0x4]
        sth     %o6,    [%l1+0x6]
        ld      [%l1],  %l2
        stbar
        st      %o4,    [%l1+0x4]
        stb     %o5,    [%l1+0x6]

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
		.word 0x67b79d3a
		.word 0x68798edc
		.word 0x9abe8582
		.word 0x421864f2
		.word 0x681674db
		.word 0xfb909144
		.word 0x8f0227b3
		.word 0xf5300716
		.word 0xb003dbdc
		.word 0xfb292b42
		.word 0xad4f49fa
		.word 0x8b5245b2
		.word 0xdd355c4
		.word 0xceb5f62b
		.word 0xe81ba56
		.word 0xd5edc01
		.word 0xe2bbed1c
		.word 0x22c88ca9
		.word 0x9e058929
		.word 0xd0925b4c
		.word 0x6c6f9dfa
		.word 0xe0bae3be
		.word 0x3a9b87e7
		.word 0xd9f5d58e
		.word 0xf62655db
		.word 0xa1a6b008
		.word 0x415a7f0a
		.word 0x794c0e5b
		.word 0xb3b89cb6
		.word 0x23175b46
		.word 0xedb94f49
		.word 0xfb2655fd
		.word 0x8e933b4d
		.word 0x9fa74e1a
		.word 0x5d7d7208
		.word 0x9fc972df
		.word 0xcf0e72c5
		.word 0xd9819210
		.word 0x552c8d11
		.word 0x8c2d3d2e
		.word 0x12489979
		.word 0x9ccd0fde
		.word 0x80570d84
		.word 0xa1e7d0bc
		.word 0x3e4d310a
		.word 0x8496eded
		.word 0x73fcfe0c
		.word 0xac7f7928
		.word 0x514ec9ba
		.word 0xa225d318
		.word 0x3fad8c53
		.word 0x1cacbc3c
		.word 0xbe4b46fa
		.word 0x14f811b3
		.word 0x9f14f1b7
		.word 0x3ec82695
		.word 0x1ed75940
		.word 0xb54afece
		.word 0x98b3b33d
		.word 0xff35be89
		.word 0x47411e
		.word 0x3c29f9b9
		.word 0x72b56cc5
		.word 0x905a4144
		.word 0x77382f90
		.word 0x26e7e7cb
		.word 0xc38c9b7f
		.word 0xafc48e34
		.word 0x80ded795
		.word 0x48ce285f
		.word 0x145c1b9d
		.word 0x8df7e4a7
		.word 0x72b50500
		.word 0x30f8451f
		.word 0x168e4d4a
		.word 0x13e9d7b1
		.word 0x48694c8f
		.word 0x5c03e284
		.word 0xf8514da
		.word 0x25111c53
		.word 0x5291293c
		.word 0x7db0b49c
		.word 0x844d2a42
		.word 0xab1095d8
		.word 0xffcf1ad3
		.word 0xee047c0e
		.word 0xbef26bc9
		.word 0x72dc4482
		.word 0x6b2399c4
		.word 0x9c434f5b
		.word 0xd6ba27ff
		.word 0xd0ebfa66
		.word 0x4e38f43a
		.word 0x884cb466
		.word 0xff6392ee
		.word 0x6ce9fa94
		.word 0x8ae7686b
		.word 0x1cf24e36
		.word 0x8ddda8f
		.word 0xab89e67a
		.word 0xe5301031
		.word 0x53e522f9
		.word 0xdbe68e7f
		.word 0xc1169d89
		.word 0xc3c271d9
		.word 0xa22be4b
		.word 0x7fa4ef2
		.word 0x3f0bf318
		.word 0xfa09ca3b
		.word 0x9a9bb3b8
		.word 0xff2cf6e7
		.word 0xc4fb5e89
		.word 0x28fc640a
		.word 0xb861457f
		.word 0xb41db59d
		.word 0x9f4909a9
		.word 0x2cb8906d
		.word 0xa2403398
		.word 0xf88ecb45
		.word 0x6f40e15c
		.word 0x29a014ce
		.word 0x738af6f8
		.word 0x2f6fdcf8
		.word 0x3dd98c79
		.word 0x55c21f1
		.word 0x5935ed13
		.word 0xcea513eb
		.word 0x7f756cf2
		.word 0xac412847
		.word 0x638c37a2
		.word 0x6ac47be0
		.word 0xe1500f38
		.word 0x432b1d83
		.word 0x23ec54a6
		.word 0xeca654df
		.word 0x2b48abdd
		.word 0xf660076d
		.word 0x1f67b2ac
		.word 0x653c4c25
		.word 0xe8a09f7a
		.word 0x308fdff7
		.word 0xbb10c551
		.word 0x32eed05d
		.word 0xe24efcd2
		.word 0xb6e6268d
		.word 0xc9775e08
		.word 0xc3fef50d
		.word 0x1bf89d37
		.word 0x1192b2b1
		.word 0x728b4d1a
		.word 0xd65e9952
		.word 0xfbae532c
		.word 0x40749bc6
		.word 0x3c198eee
		.word 0x3e57c5d0
		.word 0x7289234b
		.word 0x8aeb4a2b
		.word 0x7198898a
		.word 0xc57775e3
		.word 0x6b56a769
		.word 0x1d7f058b
		.word 0xc23c1e59
		.word 0xd9bf4019
		.word 0xe305fff7
		.word 0x91539472
		.word 0x5c92942e
		.word 0x7d6491e4
		.word 0xeea7f7ab
		.word 0xad6cc124
		.word 0x13779d88
		.word 0x189b728b
		.word 0x8adb3d5e
		.word 0x9f5d7aa
		.word 0xb13aff17
		.word 0x94560162
		.word 0x7aa7d837
		.word 0x673a712c
		.word 0xcfac9a7f
		.word 0xdc1233a
		.word 0x365b3a09
		.word 0xc6102086
		.word 0x9e97e15b
		.word 0xc1da131a
		.word 0x182893f9
		.word 0xb355d414
		.word 0x8254f484
		.word 0xbdffca2e
		.word 0x9a675164
		.word 0xed2700d0
		.word 0x71b5f392
		.word 0xd91e72ff
		.word 0xc483dcff
		.word 0xbadea9f
		.word 0x49fb40a2
		.word 0x58425be4
		.word 0x5e55143f
		.word 0x3a619de7
		.word 0xc8e1bc59
		.word 0xfc431cb8
		.word 0x5fcb0cfa
		.word 0x36316e64
		.word 0x9c8a3e29
		.word 0x940ee3cc
		.word 0x6b12114d
		.word 0xaae90f3c
		.word 0x9f29ccd2
		.word 0x4b291e1f
		.word 0x2b8ef5c0
		.word 0xfb359850
		.word 0x45665b2c
		.word 0xf56eeecc
		.word 0xd2c82da8
		.word 0x5c650cd4
		.word 0xea3c0d22
		.word 0x736729c3
		.word 0xdfa141cc
		.word 0xae7f3721
		.word 0xa6834901
		.word 0xcc8ac5bb
		.word 0xa848d4b
		.word 0x63efedc9
		.word 0xf4f018f2
		.word 0xd24df967
		.word 0xe47164bc
		.word 0x3ee815ec
		.word 0x79e7a0c5
		.word 0x868177e7
		.word 0x1da30b97
		.word 0x571bf6c9
		.word 0xd910abef
		.word 0x4d268081
		.word 0xd4e71bd2
		.word 0x45dab297
		.word 0xcd5097d5
		.word 0x4c47b590
		.word 0xf90043cf
		.word 0x19e3f895
		.word 0x7b361e4b
		.word 0x9f13eebc
		.word 0x3dc7e74
		.word 0xbd1e445f
		.word 0xb5e7c456
		.word 0xfb977a6a
		.word 0xea34299b
		.word 0x45a13e83
		.word 0x33c3f139
		.word 0x9f438276
		.word 0x63999ead
		.word 0x96ad1254
		.word 0x463cf1af
		.word 0x3d3a881f
		.word 0xf5573189
		.word 0x2660ccfd
		.word 0xe05b6b74
		.word 0xed542b42
		.word 0xd7f3b9a9
		.word 0x6f8f19d8
		.word 0xa4f6050a
		.word 0xdb39b0cb
		.word 0xb2140987
		.word 0xdd31f000
		.word 0x715545b9
		.word 0x851ffc68
		.word 0xadf1f83d
		.word 0xfbf30524
		.word 0xbee6f1d6
		.word 0x80baf17e
		.word 0xf707e16b
		.word 0xaf48199e
		.word 0x27146748
		.word 0xf6516f60
		.word 0xae19bf5c
		.word 0x97ff71c3
		.word 0xf383be47
		.word 0xbc985cbe
		.word 0xb8b3436b
		.word 0xeb0a107c
		.word 0x9b43b267
		.word 0x5f6e765b
		.word 0xc490a3
		.word 0x9e168715
		.word 0x46de97d5
		.word 0x76f9d502
		.word 0x277d7ca5
		.word 0x15686e55
		.word 0x6250e0df
		.word 0xd7435eba
		.word 0xe6217ace
		.word 0xc085dcce
		.word 0x18a3f7b9
		.word 0x97b9738
		.word 0x468c9598
		.word 0x43156e75
		.word 0x89b6707d
		.word 0xa2d78394
		.word 0x15c41a40
		.word 0xa9dcb174
		.word 0x1bc6d773
		.word 0xd0ab953f
		.word 0xeb73daa9
		.word 0x9a780c3e
		.word 0x77e69f92
		.word 0x7155d035
		.word 0x73e32980
		.word 0x946270e4
		.word 0x4ecef547
		.word 0x5ce7a06e
		.word 0x54faf4a0
		.word 0xfc7471a7
		.word 0xbae97974
		.word 0xda931299
		.word 0xaca8a1b6
		.word 0x5e678acd
		.word 0xfb28ba
		.word 0x5fe6640c
		.word 0x4d7f9128
		.word 0xbb63b5b7
		.word 0x22fff2fb
		.word 0x881c1df5
		.word 0x30356b32
		.word 0xde6a9933
		.word 0x84a9c71a
		.word 0x13752fd5
		.word 0x1bb39b52
		.word 0x18d4eb0f
		.word 0x1ede1704
		.word 0xc3f5bd2f
		.word 0xfc3a9de6
		.word 0xdf4bd6ee
		.word 0xbb917f4
		.word 0x1d34927c
		.word 0x5aba0412
		.word 0xfbf17e5e
		.word 0xaf4e42f2
		.word 0xa3787561
		.word 0x9a4a51e7
		.word 0x3a08e628
		.word 0x4ed1d99c
		.word 0xe25dc423
		.word 0x30e41ac1
		.word 0xf39ee4ea
		.word 0x704f7328
		.word 0xa7f2185a
		.word 0xbc41fff0
		.word 0xf7bae6e3
		.word 0xccdd5a8
		.word 0xd5dae0e4
		.word 0x42917599
		.word 0x20b79b0e
		.word 0x26009f90
		.word 0x79f7271c
		.word 0xea7071de
		.word 0x43d0dd71
		.word 0x23ac8575
		.word 0x8a3bf34c
		.word 0x2cf46a3c
		.word 0x15f572b6
		.word 0xf3eb2817
		.word 0x578e045f
		.word 0xc9594335
		.word 0x3bc068fa
		.word 0xc7c6a1
		.word 0x3852ceda
		.word 0x4abd162e
		.word 0x146731e4
		.word 0xe57e512e
		.word 0xe89df70d
		.word 0x9737f199
		.word 0x56a6c9f9
		.word 0x6a3a9f8f
		.word 0xfa7fba85
		.word 0x2ecf756
		.word 0x4c8b812f
		.word 0xb6cdd04b
		.word 0x704bfcc4
		.word 0xa3a47d56
		.word 0x349438bf
		.word 0x2fac13e6
		.word 0x33f8eb33
		.word 0xe8551481
		.word 0xf56b2a3f
		.word 0xdce56866
		.word 0xbd2f6c57
		.word 0xadfb99da
		.word 0x227b8bef
		.word 0x24f00912
		.word 0x7a96ce43
		.word 0x7e80b5df
		.word 0x1c4ca652
		.word 0xa543967c
		.word 0xcd88684d
		.word 0x496c6e35
		.word 0x85002f00
		.word 0xe5303ac2
		.word 0xe0ef2404
		.word 0x8f0ead84
		.word 0x8dafcba
		.word 0xe44d4e10
		.word 0xd7e22161
		.word 0x9fcde5a0
		.word 0xa99c68bf
		.word 0x418f3f68
		.word 0xadc8ea3b
		.word 0x98bb2fe8
		.word 0xf2d9f15d
		.word 0x12ccc5a5
		.word 0x4bcae900
		.word 0x2e9d8ff3
		.word 0x32d9f1ca
		.word 0xea779cbc
		.word 0x653316a1
		.word 0x79c3c68
		.word 0x8fc18334
		.word 0xeacd5345
		.word 0x698c13ce
		.word 0x63ca122c
		.word 0x7196db15
		.word 0xd708ec39
		.word 0x86c82163
		.word 0x945295c3
		.word 0xafdabacc
		.word 0x8c6658fd
		.word 0x430bac21
		.word 0x522b26ef
		.word 0x8290c469
		.word 0x2a550f9f
		.word 0x8be85fa1
		.word 0x5e314a9d
		.word 0xbbb7c8c8
		.word 0xf347415e
		.word 0x5341f484
		.word 0xfc92f01
		.word 0xf4b062e0
		.word 0xda5f756f
		.word 0x7ff52def
		.word 0x129dcdff
		.word 0x6421745c
		.word 0xe168bfe
		.word 0x5cecba36
		.word 0xb25651cc
		.word 0x11cf576b
		.word 0x29106d72
		.word 0x3d6ead6
		.word 0xba2a9fd5
		.word 0x3fd3d9d4
		.word 0x18f5e9f5
		.word 0xec6a77a9
		.word 0x487b2ddf
		.word 0xa0f2554c
		.word 0x138e8d33
		.word 0xad57c154
		.word 0x922e856f
		.word 0x63a4790b
		.word 0xf4bd6a61
		.word 0xabe74703
		.word 0xa0d9196b
		.word 0x1e31989c
		.word 0x38b02480
		.word 0x7a1d4358
		.word 0xafda5200
		.word 0x3aeb93f4
		.word 0x14bfb6e2
		.word 0xb445a4a0
		.word 0x29e3f2c6
		.word 0xf1c9acc6
		.word 0x5b76c1ed
		.word 0x7d4ad447
		.word 0x80f3f22
		.word 0x74add15
		.word 0x4529601e
		.word 0x286d018d
		.word 0xb7f580ec
		.word 0x250e830a
		.word 0x92c6c750
		.word 0x616e37a
		.word 0xdd77d551
		.word 0x782b7607
		.word 0xfc4d3a3e
		.word 0xb3e8260f
		.word 0x893c63f9
		.word 0x713ad8fb
		.word 0x6bcd0e46
		.word 0x3cdcf6bd
		.word 0x84a5646b
		.word 0xbb8d3df8
		.word 0x216fc96f
		.word 0xf8fd641b
		.word 0x716895b0
		.word 0x4955ef02
		.word 0xc0c49cad
		.word 0x9b7684d2
		.word 0xe4340c36
		.word 0x43017028
		.word 0x33e3be63
		.word 0x95aa99db
		.word 0xb13779f7
		.word 0xada98ed8
		.word 0xca0e6928
		.word 0xb4e49fec
		.word 0x153754da
		.word 0x38ea926f
		.word 0x858982cd
		.word 0x2a2f042f
		.word 0xa0417f59
		.word 0x2c826210
		.word 0xfbcd2f9f
		.word 0x77947035
		.word 0xe715763
		.word 0x4b5bb3b6
		.word 0xcc03d5e9
		.word 0xb70ce129
		.word 0xf9ab4f83
.end
