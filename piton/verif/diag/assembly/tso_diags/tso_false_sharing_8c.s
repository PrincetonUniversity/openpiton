// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_false_sharing_8c.s
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
 * Description: False Sharing. Threads use different bytes inside same
 * shared cache line. 8 cores 32 threads.
 **********************************************************************/

#define data_base_reg	  		%o1
#define to_reg	  			%o2
#define my_id_reg	  		%o3
#define test_reg	  		%o4
#define global_cnt_reg	  		%o5

#define TIMEOUT 	  		0x1000
#define ITERATIONS 	  		0x2

#include "boot.s"

.global main

main:

        set     ITERATIONS,	global_cnt_reg 
	mov	%g0, my_id_reg

th_fork(th_main,%l0)

th_main_0:
        add     my_id_reg, 0x00, my_id_reg	! this is my ID address
	ba	go; nop
th_main_1:
        add     my_id_reg, 0x04, my_id_reg
	ba	go; nop
th_main_2:
        add     my_id_reg, 0x08, my_id_reg
	ba	go; nop
th_main_3:
        add     my_id_reg, 0x0c, my_id_reg
	ba	go; nop
th_main_4:
        add     my_id_reg, 0x10, my_id_reg
	ba	go; nop
th_main_5:
        add     my_id_reg, 0x14, my_id_reg
	ba	go; nop
th_main_6:
        add     my_id_reg, 0x18, my_id_reg
	ba	go; nop
th_main_7:
        add     my_id_reg, 0x1c, my_id_reg
	ba	go; nop
th_main_8:
        add     my_id_reg, 0x20, my_id_reg
	ba	go; nop
th_main_9:
        add     my_id_reg, 0x24, my_id_reg
	ba	go; nop
th_main_10:
        add     my_id_reg, 0x28, my_id_reg
	ba	go; nop
th_main_11:
        add     my_id_reg, 0x2c, my_id_reg
	ba	go; nop
th_main_12:
        add     my_id_reg, 0x30, my_id_reg
	ba	go; nop
th_main_13:
        add     my_id_reg, 0x34, my_id_reg
	ba	go; nop
th_main_14:
        add     my_id_reg, 0x38, my_id_reg
	ba	go; nop
th_main_15:
        add     my_id_reg, 0x3c, my_id_reg
	ba	go; nop
th_main_16:
        add     my_id_reg, 0x40, my_id_reg
	ba	go; nop
th_main_17:
        add     my_id_reg, 0x44, my_id_reg
	ba	go; nop
th_main_18:
        add     my_id_reg, 0x48, my_id_reg
	ba	go; nop
th_main_19:
        add     my_id_reg, 0x4c, my_id_reg
	ba	go; nop
th_main_20:
        add     my_id_reg, 0x50, my_id_reg
	ba	go; nop
th_main_21:
        add     my_id_reg, 0x54, my_id_reg
	ba	go; nop
th_main_22:
        add     my_id_reg, 0x58, my_id_reg
	ba	go; nop
th_main_23:
        add     my_id_reg, 0x5c, my_id_reg
	ba	go; nop
th_main_24:
        add     my_id_reg, 0x60, my_id_reg
	ba	go; nop
th_main_25:
        add     my_id_reg, 0x64, my_id_reg
	ba	go; nop
th_main_26:
        add     my_id_reg, 0x68, my_id_reg
	ba	go; nop
th_main_27:
        add     my_id_reg, 0x6c, my_id_reg
	ba	go; nop
th_main_28:
        add     my_id_reg, 0x70, my_id_reg
	ba	go; nop
th_main_29:
        add     my_id_reg, 0x74, my_id_reg
	ba	go; nop
th_main_30:
        add     my_id_reg, 0x78, my_id_reg
	ba	go; nop
th_main_31:
        add     my_id_reg, 0x7c, my_id_reg
	ba	go; nop

go:
	setx    protected_area,	%l0, data_base_reg

	set 	100, %l0
	add	my_id_reg, data_base_reg, data_base_reg
	add	my_id_reg, data_base_reg, %i1
loop1:
	st 	%i1, [data_base_reg]  		! store my ID in there
	add	%i1, 1, %i1
	deccc	%l0
	bne 	loop1				! repeat
	nop

	sub	%i1, 1, %i1
	ld 	[data_base_reg], %l1		! read the data area
	subcc 	%l1, %i1, %l1			! should be same as i1
    set 0xc001cafe, %r1
    add %r0, %l0, %r1
	bne	bad_end
	nop

check_done:
	deccc	global_cnt_reg
        be	good_end
	nop
	ba	go
	nop

good_end:
        ta      T_GOOD_TRAP
bad_end:
        set 0xdeadbeef, %r1
    add %r0, %l0, %r1
        ta      T_BAD_TRAP

!==========================


	.data
.global protected_area
protected_area:
	.word	0xbeef
	.skip 0x1000
	.word	0xbeef
	
.end
