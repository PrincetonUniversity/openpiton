// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_mutex5_swap_casx.s
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
 * Description: Mutual Exclusion (mutex, spinlock) test, using cas and swap
 * All threads write their own ID in the protected section
 *
 **********************************************************************/

#define spinlock_addr_reg  		%o0
#define data_base_reg	  		%o1
#define to_reg	  			%o2
#define my_id_reg	  		%o3
#define test_reg	  		%o4
#define global_cnt_reg	  		%o5
#define tmp1	  			%i1
#define tmp2	  			%i2

#define TIMEOUT 	  		0x1000
#define ITERATIONS 	  		0x2

#include "boot.s"

.global main

main:

	wr %g0, 0x4, %fprs         			! make sure fef is 1
	setx spinlock_address, tmp1, spinlock_addr_reg	! spinlock address
        set     TIMEOUT,	to_reg         		! set timeout count 
        set     ITERATIONS,	global_cnt_reg		! set iterations

        or      spinlock_addr_reg, %g0, my_id_reg

th_fork(th_main,tmp1)

th_main_0:
        add     my_id_reg, 0x10, my_id_reg		! this is my ID address
	stb	my_id_reg, [my_id_reg]			! write my ID there
	ba	getlock
	nop

th_main_1:
        add     my_id_reg, 0x18, my_id_reg
	stb	my_id_reg, [my_id_reg]
	ba	getlock
	nop


th_main_2:
        add     my_id_reg, 0x20, my_id_reg
	stb	my_id_reg, [my_id_reg]
	ba	getlock
	nop

th_main_3:
        add     my_id_reg, 0x28, my_id_reg
	stb	my_id_reg, [my_id_reg]
	ba	getlock
	nop

th_main_4:
        add     my_id_reg, 0x30, my_id_reg
	stb	my_id_reg, [my_id_reg]
	ba	getlock
	nop

th_main_5:
        add     my_id_reg, 0x38, my_id_reg
	stb	my_id_reg, [my_id_reg]
	ba	getlock
	nop

th_main_6:
        add     my_id_reg, 0x40, my_id_reg
	stb	my_id_reg, [my_id_reg]
	ba	getlock
	nop

th_main_7:
        add     my_id_reg, 0x48, my_id_reg
	stb	my_id_reg, [my_id_reg]
	ba	getlock
	nop
	
	ba bad_end
	nop


getlock:
        deccc   to_reg          			! dec timeout count
        be      bad_end                 		! branch if no timeout
        nop
	set 	1, tmp1					! some threads do
	andcc	tmp1, my_id_reg, tmp2			! swap_lock
	be	swap_lock				! some do cas_lock
	nop
cas_lock:	
        or      %g0, my_id_reg, test_reg       		! use cas
        cas     [spinlock_addr_reg], %g0, test_reg	! try to acquire lock
        tst     test_reg                       		! did we get it?
        bne     getlock
        nop
swap_lock:
        or      %g0, my_id_reg, test_reg                ! use swap
        swap    [spinlock_addr_reg], test_reg      	! try to acquire lock
        tst     test_reg                                ! did we get it?
        bne     getlock
        nop


gotlock:						! do soemthing
        set     TIMEOUT, to_reg         		! set to count again
	setx    protected_area,	tmp1, data_base_reg

	set 	20, %l0
loop1:
	ldd 	[my_id_reg], %d16			! read the ID
	std 	%d16, [data_base_reg]  			! store my ID in there
	add	data_base_reg, 8, data_base_reg 	! increment the address
	deccc	%l0
	bne 	loop1					! repeat
	nop

	set 	20, %l0
loop2:
	sub	data_base_reg, 8, data_base_reg 
	ldd 	[my_id_reg], %f16			! read the ID
	ldd 	[data_base_reg], %f0			! read the data area
	fcmps 	%fcc0, %f0, %f16 			! should be my ID
	fbne	%fcc0, bad_end
	nop
	deccc	%l0					! repeat
	bne 	loop2
	nop

clearlock:
        st        %g0, [spinlock_addr_reg]            ! unlock

check_done:
	deccc	global_cnt_reg
        be	good_end
	nop
	ba	getlock
	nop

good_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

!==========================
	.data

user_data_start:

spinlock_address:
	.word	0x0
	.skip 0x1000
.align  0x100
protected_area:
	.word	0xbeef
	.skip 0x1000
	.word	0xbeef
	

! some post-processing
__PERL__

use strict;

system("vlog > vlog.log");

open (F, "critsec.p -startcs=2000015c -endcs=200001bc |") or die "cannot open critsec.p...\n";

while(<F>){
  print;
  if(/Everything OK/){
    exit 0;
  }
}

print "ERROR, something went wrong in perl postprocessing\n";
exit 1;

