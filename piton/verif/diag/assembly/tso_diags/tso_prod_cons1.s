// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_prod_cons1.s
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
 * Name:   tso_prod_cons1.s
 *
 * Description: A producer consumer diag. the processes do stuff in pairs.
 *
 **********************************************************************/

#define spinlock_addr_reg  		%o0
#define data_base_reg	  		%o1
#define my_id_reg	  		%o3
#define test_reg	  		%o4
#define global_cnt_reg	  		%o5
#define tmp1	  			%l1

#define ITERATIONS 	  		0x4

#include "boot.s"

.global main

main:

	setx    spinlock_address, %l0, spinlock_addr_reg
        set     ITERATIONS,	global_cnt_reg 	 

th_fork(th_main,%l0)

! Some of the threads are producers, some are consumers
! A pair of producer and consumer has the same ID.
!=====================================================
th_main_0:
        add     %g0, 0x8, my_id_reg			! this is my ID address
	ba	producer
	nop

th_main_1:
        add     %g0, 0x24, my_id_reg
	ba	consumer
	nop

th_main_2:
        add     %g0, 0x38, my_id_reg
	ba	producer
	nop

th_main_3:
        add     %g0, 0x3c, my_id_reg
	ba	producer
	nop

th_main_4:
        add     %g0, 0x8, my_id_reg
	ba	consumer
	nop

th_main_5:
        add     %g0, 0x24, my_id_reg
	ba	producer
	nop

th_main_6:
        add     %g0, 0x38, my_id_reg
	ba	consumer
	nop

th_main_7:
        add     %g0, 0x3c, my_id_reg
	ba	consumer
	nop

!===============================================================
producer:
        ld    	[spinlock_addr_reg + my_id_reg], test_reg	! try to
        tst     test_reg                       			! acquire lock
        be      producer_gotlock
        nop
	ba	producer
	nop

!===============================================================
consumer:
        ld    	[spinlock_addr_reg + my_id_reg], test_reg	! try to lock
	sub	test_reg, 0x55, %i1				! acquire lock
	tst	%i1						! check for
	be	good_end					! end the test
	nop
	sub	test_reg, 0x1, %i1				! check for data
	tst	%i1	
	be	consumer_gotlock
	nop
	ba	consumer
	nop


!===============================================================
producer_gotlock:
	set 	0x80, %l0
	setx 	protected_area, tmp1, data_base_reg
producer_loop0:
	st 	%g0, [data_base_reg + my_id_reg] 	! clean up
	add	data_base_reg, 0x40, data_base_reg 	! increment the address
	deccc	%l0
	bne 	producer_loop0				! repeat
	nop

	set 	0x80, %l0
	setx 	protected_area, tmp1, data_base_reg
	mov 	my_id_reg, %i1 
producer_loop1:
	st 	%i1, [data_base_reg + my_id_reg] 	! store my ID in there
	add	data_base_reg, 0x40, data_base_reg 	! increment the address
	add	%i1, 1, %i1
	deccc	%l0
	bne 	producer_loop1				! repeat
	nop

	deccc	global_cnt_reg
        be	cleanup_and_finish
	nop
	add	%g0, 1 , tmp1
        st      tmp1, [spinlock_addr_reg + my_id_reg]	! data ready
	ba	producer
	nop

cleanup_and_finish:
	add	%g0, 0x55 , tmp1
        st      tmp1, [spinlock_addr_reg + my_id_reg]	! finish the test
	ba good_end
	nop

!===============================================================
consumer_gotlock:
	set 	0x80, %l0
	setx 	protected_area, tmp1, data_base_reg
	mov 	my_id_reg, %i1 
consumer_loop1:
	ld 	[data_base_reg + my_id_reg], %i2 	! load my ID in there
	subcc 	%i2, %i1, %i2
	bne	bad_end
	nop
	st 	%g0, [data_base_reg + my_id_reg] 	! clean
	add	data_base_reg, 0x40, data_base_reg 	! increment the address
	inc	%i1
	deccc	%l0
	bne 	consumer_loop1				! repeat
	nop

        st      %g0, [spinlock_addr_reg+ my_id_reg]	! consumer ready

	ba	consumer
	nop

good_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

!==========================

SECTION .MY_DATA0  TEXT_VA=0xf0100000, DATA_VA=0xd0100000
attr_data {
        Name = .MY_DATA0,
        VA= 0x0d0100000
        RA= 0x1d0100000
        PA= ra2pa(0x1d0100000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }

attr_text {
        Name = .MY_DATA0,
        VA= 0x0f0100000
        RA= 0x1f0100000
        PA= ra2pa(0x1f0100000,0),
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }


	.data

.global spinlock_address
spinlock_address:
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0


SECTION .MY_DATA1  TEXT_VA=0xf1110000, DATA_VA=0xd1110000
attr_data {
        Name = .MY_DATA1,
        VA= 0x0d1110000,
        RA= 0x1d1110000,
        PA= ra2pa(0x1d1110000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }

attr_text {
        Name = .MY_DATA1,
        VA= 0x0f1110000,
        RA= 0x1f1110000,
        PA= ra2pa(0x1f1110000,0),
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }


	.data
.global protected_area
protected_area:
	.word	0xbeef
	.skip 0x1000
	.word	0xbeef
	
.end
