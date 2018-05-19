// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_starve0.s
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
 *
 *  Description: False Sharing
 *
 **********************************************************************/

#define data0_addr	  		%o0
#define data1_addr	  		%o1
#define my_id_reg	  		%o3

#define ITERATIONS			4

#include "boot.s"

.global main

main:


	add	%g0, ITERATIONS, %i0

th_fork(th_main,%l0)

th_main_0:
	setx 	data1, %l0, data1_addr
	add	data1_addr, 0x50, data1_addr
	ld	[data1_addr], %l0

loop0:
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]
	st	%l0, [data1_addr]

	dec	%i0
	brnz	%i0, loop0
	nop

good_end:
        ta      T_GOOD_TRAP


th_main_1:
th_main_2:
th_main_3:

	setx 	data0, %l0, data0_addr

loop123:
	ld	[data0_addr], %l0
	ld	[data0_addr], %l1
	ld	[data0_addr], %l2
	ld	[data0_addr], %l3
	ld	[data0_addr], %l4
	ld	[data0_addr], %l5
	ld	[data0_addr], %l6
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l0
	ld	[data0_addr], %l0
	ld	[data0_addr], %l1
	ld	[data0_addr], %l2
	ld	[data0_addr], %l3
	ld	[data0_addr], %l4
	ld	[data0_addr], %l5
	ld	[data0_addr], %l6
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l0
	ld	[data0_addr], %l1
	ld	[data0_addr], %l2
	ld	[data0_addr], %l3
	ld	[data0_addr], %l4
	ld	[data0_addr], %l5
	ld	[data0_addr], %l6
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l0
	ld	[data0_addr], %l1
	ld	[data0_addr], %l2
	ld	[data0_addr], %l3
	ld	[data0_addr], %l4
	ld	[data0_addr], %l5
	ld	[data0_addr], %l6
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l1
	ld	[data0_addr], %l2
	ld	[data0_addr], %l3
	ld	[data0_addr], %l4
	ld	[data0_addr], %l5
	ld	[data0_addr], %l6
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l0
	ld	[data0_addr], %l1
	ld	[data0_addr], %l2
	ld	[data0_addr], %l3
	ld	[data0_addr], %l4
	ld	[data0_addr], %l5
	ld	[data0_addr], %l6
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l0
	ld	[data0_addr], %l1
	ld	[data0_addr], %l2
	ld	[data0_addr], %l3
	ld	[data0_addr], %l4
	ld	[data0_addr], %l5
	ld	[data0_addr], %l6
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l0
	ld	[data0_addr], %l1
	ld	[data0_addr], %l2
	ld	[data0_addr], %l3
	ld	[data0_addr], %l4
	ld	[data0_addr], %l5
	ld	[data0_addr], %l6
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l0
	ld	[data0_addr], %l1
	ld	[data0_addr], %l2
	ld	[data0_addr], %l3
	ld	[data0_addr], %l4
	ld	[data0_addr], %l5
	ld	[data0_addr], %l6
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l0
	ld	[data0_addr], %l1
	ld	[data0_addr], %l2
	ld	[data0_addr], %l3
	ld	[data0_addr], %l4
	ld	[data0_addr], %l5
	ld	[data0_addr], %l6
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l0
	ld	[data0_addr], %l1
	ld	[data0_addr], %l2
	ld	[data0_addr], %l3
	ld	[data0_addr], %l4
	ld	[data0_addr], %l5
	ld	[data0_addr], %l6
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l0
	ld	[data0_addr], %l1
	ld	[data0_addr], %l2
	ld	[data0_addr], %l3
	ld	[data0_addr], %l4
	ld	[data0_addr], %l5
	ld	[data0_addr], %l6
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l0
	ld	[data0_addr], %l1
	ld	[data0_addr], %l2
	ld	[data0_addr], %l3
	ld	[data0_addr], %l4
	ld	[data0_addr], %l5
	ld	[data0_addr], %l6
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l0
	ld	[data0_addr], %l1
	ld	[data0_addr], %l2
	ld	[data0_addr], %l3
	ld	[data0_addr], %l4
	ld	[data0_addr], %l5
	ld	[data0_addr], %l6
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l0
	ld	[data0_addr], %l1
	ld	[data0_addr], %l2
	ld	[data0_addr], %l3
	ld	[data0_addr], %l4
	ld	[data0_addr], %l5
	ld	[data0_addr], %l6
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l0
	ld	[data0_addr], %l1
	ld	[data0_addr], %l2
	ld	[data0_addr], %l3
	ld	[data0_addr], %l4
	ld	[data0_addr], %l5
	ld	[data0_addr], %l6
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l0
	ld	[data0_addr], %l1
	ld	[data0_addr], %l2
	ld	[data0_addr], %l3
	ld	[data0_addr], %l4
	ld	[data0_addr], %l5
	ld	[data0_addr], %l6
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l0
	ld	[data0_addr], %l1
	ld	[data0_addr], %l2
	ld	[data0_addr], %l3
	ld	[data0_addr], %l4
	ld	[data0_addr], %l5
	ld	[data0_addr], %l6
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l0
	ld	[data0_addr], %l1
	ld	[data0_addr], %l2
	ld	[data0_addr], %l3
	ld	[data0_addr], %l4
	ld	[data0_addr], %l5
	ld	[data0_addr], %l6
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l0
	ld	[data0_addr], %l1
	ld	[data0_addr], %l2
	ld	[data0_addr], %l3
	ld	[data0_addr], %l4
	ld	[data0_addr], %l5
	ld	[data0_addr], %l6
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l0
	ld	[data0_addr], %l1
	ld	[data0_addr], %l2
	ld	[data0_addr], %l3
	ld	[data0_addr], %l4
	ld	[data0_addr], %l5
	ld	[data0_addr], %l6
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l0
	ld	[data0_addr], %l1
	ld	[data0_addr], %l2
	ld	[data0_addr], %l3
	ld	[data0_addr], %l4
	ld	[data0_addr], %l5
	ld	[data0_addr], %l6
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l0
	ld	[data0_addr], %l1
	ld	[data0_addr], %l2
	ld	[data0_addr], %l3
	ld	[data0_addr], %l4
	ld	[data0_addr], %l5
	ld	[data0_addr], %l6
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l0
	ld	[data0_addr], %l1
	ld	[data0_addr], %l2
	ld	[data0_addr], %l3
	ld	[data0_addr], %l4
	ld	[data0_addr], %l5
	ld	[data0_addr], %l6
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ld	[data0_addr], %l7
	ba	loop123
	ld	[data0_addr], %l7


bad_end:
        ta      T_BAD_TRAP

!==========================

	.data
.global data0
.global data1
data0:
	.skip 0x1000
data1:
	.skip 0x1000
	
.end
