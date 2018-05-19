// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_mutex1.s
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
 *  Description: Mutual Exclusion (mutex, spinlock) test, using swap.
 *      	 All threads write their own ID in the protected section
 *
 **********************************************************************/

#define spinlock_addr_reg  		%o0
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

	setx spinlock_address, %l0, spinlock_addr_reg	! spinlock address
        set TIMEOUT,	to_reg         			! set timeout count 
        set ITERATIONS,	global_cnt_reg 			! 

        or  spinlock_addr_reg, %g0, my_id_reg

th_fork(th_main,%l0)

th_main_0:
        add     my_id_reg, 0x20, my_id_reg		! my ID address
	stb	%g0, [my_id_reg]			! reset the value
	ba	getlock
	nop

th_main_1:
        add     my_id_reg, 0x24, my_id_reg
	stb	%g0, [my_id_reg]
	ba	getlock
	nop


th_main_2:
        add     my_id_reg, 0x28, my_id_reg
	stb	%g0, [my_id_reg]
	ba	getlock
	nop

th_main_3:
        add     my_id_reg, 0x2c, my_id_reg
	stb	%g0, [my_id_reg]
	ba	getlock
	nop

th_main_4:
        add     my_id_reg, 0x30, my_id_reg
	stb	%g0, [my_id_reg]
	ba	getlock
	nop

th_main_5:
        add     my_id_reg, 0x34, my_id_reg
	stb	%g0, [my_id_reg]
	ba	getlock
	nop

th_main_6:
        add     my_id_reg, 0x38, my_id_reg
	stb	%g0, [my_id_reg]
	ba	getlock
	nop

th_main_7:
        add     my_id_reg, 0x3c, my_id_reg
	stb	%g0, [my_id_reg]
	ba	getlock
	nop

getlock:
        or      %g0, my_id_reg, test_reg       	! load the swap data register
        swap    [spinlock_addr_reg], test_reg	! try to acquire lock
        tst     test_reg                       	! did we get it?
        be      gotlock
        nop

dotimeout:
        deccc   to_reg          		! dec timeout count
        bne     getlock                 	! branch if no timeout
        nop
        ba,a    bad_end
        nop

gotlock:
        set     TIMEOUT, to_reg         	! set timeout count again
	setx    protected_area,	%l0, data_base_reg

	set 	100, %l0
	add	my_id_reg, data_base_reg, %i1
loop1:
	st 	%i1, [data_base_reg]  		! st my ID in the protected area
	add	data_base_reg, 4, data_base_reg	! increment the address
	add	%i1, 1, %i1
	deccc	%l0
	bne 	loop1				! repeat
	nop

	set 	100, %l0
loop2:
	sub	data_base_reg, 4, data_base_reg 
	sub	%i1, 1, %i1
	ld 	[data_base_reg], %l1		! read the data area
	subcc 	%l1, %i1, %l1			! should be same is i1
	bne	bad_end
	nop
	deccc	%l0				! repeat
	bne 	loop2
	nop

clearlock:
        st        %g0, [spinlock_addr_reg]	! unlocked

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
	.word	0x0
	.skip 0x1000
	.word	0x0

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

! now do some post-procesing	
.end

__PERL__

use strict;

system("vlog > vlog.log");
open (F, "critsec.p -startcs=20000134 -endcs=20000198 |") or die "cannot open critsec.p...\n";

while(<F>){ 
  print;
  if(/Everything OK/){
    exit 0;
  }
}

print "ERROR, something went wrong in perl postprocessing\n";
exit 1;
