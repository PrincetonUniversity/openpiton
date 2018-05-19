// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_prod_cons2.s
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
 *  Name:   tso_prod_cons2.s
 *
 * Description: A producer consumer diag. 1 producer, many consumers.
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

	wr      %g0, 0x4, %fprs         		! make sure fef is 1
	setx    spinlock_address, %l0, spinlock_addr_reg	
        set     ITERATIONS, global_cnt_reg 

th_fork(th_main,%l0)

th_main_0:
        add     %g0, 0x8, my_id_reg	! this is my ID address
	ba	producer
	nop


th_main_2:
        add     %g0, 0x10, my_id_reg
	ba	consumer
	nop

th_main_4:
        add     %g0, 0x18, my_id_reg
	ba	consumer
	nop

th_main_6:
        add     %g0, 0x20, my_id_reg
	ba	consumer
	nop

th_main_8:
        add     %g0, 0x28, my_id_reg
	ba	consumer
	nop

th_main_10:
        add     %g0, 0x30, my_id_reg
	ba	consumer
	nop

th_main_12:
        add     %g0, 0x38, my_id_reg
	ba	consumer
	nop

th_main_14:
        add     %g0, 0x40, my_id_reg
	ba	consumer
	nop

th_main_16:
        add     %g0, 0x48, my_id_reg
	ba	consumer
	nop

th_main_18:
        add     %g0, 0x50, my_id_reg
	ba	consumer
	nop

th_main_20:
        add     %g0, 0x58, my_id_reg
	ba	consumer
	nop

th_main_22:
        add     %g0, 0x60, my_id_reg
	ba	consumer
	nop

th_main_24:
        add     %g0, 0x68, my_id_reg
	ba	consumer
	nop

th_main_26:
        add     %g0, 0x70, my_id_reg
	ba	consumer
	nop

th_main_28:
        add     %g0, 0x78, my_id_reg
	ba	consumer
	nop

th_main_30:
        add     %g0, 0x80, my_id_reg
	ba	consumer
	nop

th_main_32:
        add     %g0, 0x88, my_id_reg
	ba	consumer
	nop

th_main_34:
        add     %g0, 0x90, my_id_reg
	ba	consumer
	nop

th_main_36:
        add     %g0, 0x98, my_id_reg
	ba	consumer
	nop

th_main_38:
        add     %g0, 0xa0, my_id_reg
	ba	consumer
	nop

th_main_40:
        add     %g0, 0xa8, my_id_reg
	ba	consumer
	nop

th_main_42:
        add     %g0, 0xb0, my_id_reg
	ba	consumer
	nop

th_main_44:
        add     %g0, 0xb8, my_id_reg
	ba	consumer
	nop

th_main_46:
        add     %g0, 0xc0, my_id_reg
	ba	consumer
	nop

th_main_48:
        add     %g0, 0xc8, my_id_reg
	ba	consumer
	nop

th_main_50:
        add     %g0, 0xd0, my_id_reg
	ba	consumer
	nop

th_main_52:
        add     %g0, 0xd8, my_id_reg
	ba	consumer
	nop

th_main_54:
        add     %g0, 0xe0, my_id_reg
	ba	consumer
	nop

th_main_56:
        add     %g0, 0xe8, my_id_reg
	ba	consumer
	nop

th_main_58:
        add     %g0, 0xf0, my_id_reg
	ba	consumer
	nop

th_main_60:
        add     %g0, 0xf8, my_id_reg
	ba	consumer
	nop

th_main_62:
        add     %g0, 0x100, my_id_reg
	ba	consumer
	nop

th_main_64:
        add     %g0, 0x108, my_id_reg
	ba	consumer
	nop

th_main_66:
        add     %g0, 0x110, my_id_reg
	ba	consumer
	nop

th_main_68:
        add     %g0, 0x118, my_id_reg
	ba	consumer
	nop

th_main_70:
        add     %g0, 0x120, my_id_reg
	ba	consumer
	nop

th_main_72:
        add     %g0, 0x128, my_id_reg
	ba	consumer
	nop

th_main_74:
        add     %g0, 0x130, my_id_reg
	ba	consumer
	nop

th_main_76:
        add     %g0, 0x138, my_id_reg
	ba	consumer
	nop

th_main_78:
        add     %g0, 0x140, my_id_reg
	ba	consumer
	nop

th_main_80:
        add     %g0, 0x148, my_id_reg
	ba	consumer
	nop

th_main_82:
        add     %g0, 0x150, my_id_reg
	ba	consumer
	nop

th_main_84:
        add     %g0, 0x158, my_id_reg
	ba	consumer
	nop

th_main_86:
        add     %g0, 0x160, my_id_reg
	ba	consumer
	nop

th_main_88:
        add     %g0, 0x168, my_id_reg
	ba	consumer
	nop

th_main_90:
        add     %g0, 0x170, my_id_reg
	ba	consumer
	nop

th_main_92:
        add     %g0, 0x178, my_id_reg
	ba	consumer
	nop

th_main_94:
        add     %g0, 0x180, my_id_reg
	ba	consumer
	nop

th_main_96:
        add     %g0, 0x188, my_id_reg
	ba	consumer
	nop

th_main_98:
        add     %g0, 0x190, my_id_reg
	ba	consumer
	nop

th_main_100:
        add     %g0, 0x198, my_id_reg
	ba	consumer
	nop

th_main_102:
        add     %g0, 0x1a0, my_id_reg
	ba	consumer
	nop

th_main_104:
        add     %g0, 0x1a8, my_id_reg
	ba	consumer
	nop

th_main_106:
        add     %g0, 0x1b0, my_id_reg
	ba	consumer
	nop

th_main_108:
        add     %g0, 0x1b8, my_id_reg
	ba	consumer
	nop

th_main_110:
        add     %g0, 0x1c0, my_id_reg
	ba	consumer
	nop

th_main_112:
        add     %g0, 0x1c8, my_id_reg
	ba	consumer
	nop

th_main_114:
        add     %g0, 0x1d0, my_id_reg
	ba	consumer
	nop

th_main_116:
        add     %g0, 0x1d8, my_id_reg
	ba	consumer
	nop

th_main_118:
        add     %g0, 0x1e0, my_id_reg
	ba	consumer
	nop

th_main_120:
        add     %g0, 0x1e8, my_id_reg
	ba	consumer
	nop

th_main_122:
        add     %g0, 0x1f0, my_id_reg
	ba	consumer
	nop

th_main_124:
        add     %g0, 0x1f8, my_id_reg
	ba	consumer
	nop

th_main_126:
        add     %g0, 0x200, my_id_reg
	ba	consumer
	nop




!========================================================
producer:
wait1:
        ld    	[spinlock_addr_reg + 0x10], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait1
        nop
wait2:
        ld    	[spinlock_addr_reg + 0x18], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait2
        nop
wait3:
        ld    	[spinlock_addr_reg + 0x20], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait3
        nop
wait4:
        ld    	[spinlock_addr_reg + 0x28], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait4
        nop
wait5:
        ld    	[spinlock_addr_reg + 0x30], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait5
        nop
wait6:
        ld    	[spinlock_addr_reg + 0x38], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait6
        nop
wait7:
        ld    	[spinlock_addr_reg + 0x40], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait7
        nop

wait8:
        
        ld    	[spinlock_addr_reg + 0x48], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait8
        nop
wait9:
        
        ld    	[spinlock_addr_reg + 0x50], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait9
        nop
wait10:
        
        ld    	[spinlock_addr_reg + 0x58], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait10
        nop
wait11:
        
        ld    	[spinlock_addr_reg + 0x60], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait11
        nop
wait12:
        
        ld    	[spinlock_addr_reg + 0x68], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait12
        nop
wait13:
        
        ld    	[spinlock_addr_reg + 0x70], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait13
        nop
wait14:
        
        ld    	[spinlock_addr_reg + 0x78], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait14
        nop
wait15:
        
        ld    	[spinlock_addr_reg + 0x80], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait15
        nop
wait16:
        
        ld    	[spinlock_addr_reg + 0x88], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait16
        nop
wait17:
        
        ld    	[spinlock_addr_reg + 0x90], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait17
        nop
wait18:
        
        ld    	[spinlock_addr_reg + 0x98], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait18
        nop
wait19:
        
        ld    	[spinlock_addr_reg + 0xa0], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait19
        nop
wait20:
        
        ld    	[spinlock_addr_reg + 0xa8], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait20
        nop
wait21:
        
        ld    	[spinlock_addr_reg + 0xb0], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait21
        nop
wait22:
        
        ld    	[spinlock_addr_reg + 0xb8], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait22
        nop
wait23:
        
        ld    	[spinlock_addr_reg + 0xc0], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait23
        nop
wait24:
        
        ld    	[spinlock_addr_reg + 0xc8], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait24
        nop
wait25:
        
        ld    	[spinlock_addr_reg + 0xd0], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait25
        nop
wait26:
        
        ld    	[spinlock_addr_reg + 0xd8], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait26
        nop
wait27:
        
        ld    	[spinlock_addr_reg + 0xe0], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait27
        nop
wait28:
        
        ld    	[spinlock_addr_reg + 0xe8], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait28
        nop
wait29:
        
        ld    	[spinlock_addr_reg + 0xf0], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait29
        nop
wait30:
        
        ld    	[spinlock_addr_reg + 0xf8], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait30
        nop
wait31:
        
        ld    	[spinlock_addr_reg + 0x100], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait31
        nop
wait32:
        
        ld    	[spinlock_addr_reg + 0x108], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait32
        nop
wait33:
        
        ld    	[spinlock_addr_reg + 0x110], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait33
        nop
wait34:
        
        ld    	[spinlock_addr_reg + 0x118], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait34
        nop
wait35:
        
        ld    	[spinlock_addr_reg + 0x120], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait35
        nop
wait36:
        
        ld    	[spinlock_addr_reg + 0x128], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait36
        nop
wait37:
        
        ld    	[spinlock_addr_reg + 0x130], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait37
        nop
wait38:
        
        ld    	[spinlock_addr_reg + 0x138], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait38
        nop
wait39:
        
        ld    	[spinlock_addr_reg + 0x140], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait39
        nop
wait40:
        
        ld    	[spinlock_addr_reg + 0x148], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait40
        nop
wait41:
        
        ld    	[spinlock_addr_reg + 0x150], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait41
        nop
wait42:
        
        ld    	[spinlock_addr_reg + 0x158], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait42
        nop
wait43:
        
        ld    	[spinlock_addr_reg + 0x160], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait43
        nop
wait44:
        
        ld    	[spinlock_addr_reg + 0x168], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait44
        nop
wait45:
        
        ld    	[spinlock_addr_reg + 0x170], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait45
        nop
wait46:
        
        ld    	[spinlock_addr_reg + 0x178], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait46
        nop
wait47:
        
        ld    	[spinlock_addr_reg + 0x180], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait47
        nop
wait48:
        
        ld    	[spinlock_addr_reg + 0x188], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait48
        nop
wait49:
        
        ld    	[spinlock_addr_reg + 0x190], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait49
        nop
wait50:
        
        ld    	[spinlock_addr_reg + 0x198], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait50
        nop
wait51:
        
        ld    	[spinlock_addr_reg + 0x1a0], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait51
        nop
wait52:
        
        ld    	[spinlock_addr_reg + 0x1a8], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait52
        nop
wait53:
        
        ld    	[spinlock_addr_reg + 0x1b0], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait53
        nop
wait54:
        
        ld    	[spinlock_addr_reg + 0x1b8], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait54
        nop
wait55:
        
        ld    	[spinlock_addr_reg + 0x1c0], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait55
        nop
wait56:
        
        ld    	[spinlock_addr_reg + 0x1c8], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait56
        nop
wait57:
        
        ld    	[spinlock_addr_reg + 0x1d0], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait57
        nop
wait58:
        
        ld    	[spinlock_addr_reg + 0x1d8], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait58
        nop
wait59:
        
        ld    	[spinlock_addr_reg + 0x1e0], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait59
        nop
wait60:
        
        ld    	[spinlock_addr_reg + 0x1e8], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait60
        nop
wait61:
        
        ld    	[spinlock_addr_reg + 0x1f0], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait61
        nop
wait62:
        
        ld    	[spinlock_addr_reg + 0x1f8], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait62
        nop
wait63:
        
        ld    	[spinlock_addr_reg + 0x200], test_reg	! try to acquire lock
        tst     test_reg                    		! did we get it?
        bne     wait63
        nop



	ba	producer_gotlock
	nop

!========================================================
consumer:
        ld [spinlock_addr_reg + my_id_reg], test_reg 	! try to acquire lock
	sub test_reg, 0x55, %i1			  	! check for end of test
	tst %i1	
	be good_end
	nop
	sub test_reg, 0x1, %i1		! check for  available data
	tst %i1	
	be check_consumer_type
	nop
	ba consumer
	nop

check_consumer_type:
	andcc	my_id_reg, 0x8, %i1
	bne	consumer_gotlock2
	nop
	ba	consumer_gotlock
	nop


!=========================================================
producer_gotlock:

	set 	0x80, %l0
	setx 	protected_area, tmp1, data_base_reg
producer_loop0:
	st 	%g0, [data_base_reg + my_id_reg] 	! cleanup
	add	data_base_reg, 0x40, data_base_reg 	! increment the address
	deccc	%l0
	bne 	producer_loop0				! repeat
	nop

	set 	0x80, %l0
	setx 	protected_area, tmp1, data_base_reg
producer_loop1:
	st 	my_id_reg, [data_base_reg + my_id_reg] 	! store my ID in there
	add	data_base_reg, 0x40, data_base_reg 	! increment the address
	deccc	%l0
	bne 	producer_loop1				! repeat
	nop

	deccc	global_cnt_reg
        be	cleanup_and_finish
	nop
	add	%g0, 1 , tmp1
        st      tmp1, [spinlock_addr_reg + 0x10]    ! data ready
        st      tmp1, [spinlock_addr_reg + 0x18]    ! data ready
        st      tmp1, [spinlock_addr_reg + 0x20]    ! data ready
        st      tmp1, [spinlock_addr_reg + 0x28]    ! data ready
        st      tmp1, [spinlock_addr_reg + 0x30]    ! data ready
        st      tmp1, [spinlock_addr_reg + 0x38]    ! data ready
        st      tmp1, [spinlock_addr_reg + 0x40]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x48]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x50]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x58]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x60]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x68]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x70]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x78]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x80]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x88]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x90]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x98]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0xa0]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0xa8]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0xb0]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0xb8]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0xc0]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0xc8]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0xd0]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0xd8]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0xe0]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0xe8]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0xf0]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0xf8]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x100]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x108]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x110]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x118]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x120]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x128]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x130]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x138]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x140]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x148]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x150]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x158]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x160]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x168]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x170]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x178]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x180]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x188]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x190]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x198]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x1a0]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x1a8]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x1b0]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x1b8]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x1c0]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x1c8]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x1d0]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x1d8]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x1e0]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x1e8]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x1f0]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x1f8]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x200]    ! data ready

	ba	producer
	nop

cleanup_and_finish:
	add	%g0, 0x55 , tmp1
        st      tmp1, [spinlock_addr_reg + 0x10]    ! data ready
        st      tmp1, [spinlock_addr_reg + 0x18]    ! data ready
        st      tmp1, [spinlock_addr_reg + 0x20]    ! data ready
        st      tmp1, [spinlock_addr_reg + 0x28]    ! data ready
        st      tmp1, [spinlock_addr_reg + 0x30]    ! data ready
        st      tmp1, [spinlock_addr_reg + 0x38]    ! data ready
        st      tmp1, [spinlock_addr_reg + 0x40]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x48]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x50]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x58]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x60]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x68]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x70]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x78]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x80]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x88]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x90]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x98]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0xa0]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0xa8]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0xb0]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0xb8]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0xc0]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0xc8]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0xd0]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0xd8]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0xe0]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0xe8]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0xf0]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0xf8]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x100]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x108]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x110]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x118]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x120]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x128]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x130]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x138]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x140]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x148]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x150]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x158]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x160]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x168]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x170]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x178]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x180]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x188]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x190]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x198]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x1a0]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x1a8]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x1b0]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x1b8]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x1c0]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x1c8]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x1d0]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x1d8]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x1e0]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x1e8]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x1f0]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x1f8]    ! data ready

        st      tmp1, [spinlock_addr_reg + 0x200]    ! data ready



	ba good_end
	nop

!====================================================================
consumer_gotlock:
	set 	0x80, %l0
	setx 	protected_area, tmp1, data_base_reg
	mov 	0x8, %i1 
consumer_loop1:
	ld 	[data_base_reg + 0x8], %i2 		! load
	subcc 	%i2, %i1, %g0				! should be producer's
	bne	bad_end					! ID there
	nop
	add	data_base_reg, 0x40, data_base_reg 	! increment the address
	deccc	%l0
	bne 	consumer_loop1				! repeat
	nop

        st      %g0, [spinlock_addr_reg+ my_id_reg] 	! consumer ready

	ba	consumer
	nop

consumer_gotlock2:					! uses FP compares
        set     0x80, %l0
        setx    protected_area, tmp1, data_base_reg
        mov     0x8, %i1
	st 	%i1, [data_base_reg + my_id_reg] 	! store producer's ID 
        ld      [data_base_reg + my_id_reg], %f2 	! get it in %f2 
consumer_loop2:
        ld      [data_base_reg + 0x8], %f14     	! load data
	fcmps 	%fcc0, %f2, %f14 			! is it  producer's  ID
	fbne	%fcc0, bad_end
	nop
        add     data_base_reg, 0x40, data_base_reg      ! increment the address
        deccc   %l0
        bne     consumer_loop2                          ! repeat
        nop

        st      %g0, [spinlock_addr_reg+ my_id_reg]     ! consumer ready

        ba      consumer
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
