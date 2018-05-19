// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_dekker2_pio.s
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
 * Name:   
 * Date:   
 *
 *
 * Description: Dekker variation - there is an ID field which
 * all processors use. Once a processor got the lock the ID field should be
 * his.
 *
 **********************************************************************/

#define addrA_reg 			%o0
#define addrB_reg 			%o1
#define addrC_reg 			%o2
#define data_base_reg	  		%o3
#define to_reg	  			%o4
#define my_id_reg	  		%o5
#define global_cnt_reg	  		%o6

#define test_reg1	  		%i0
#define test_reg2	  		%i1

#define backoff_cnt	  		%i4
#define backoff_hlp1  			%i5


#define TIMEOUT 	  		0x100
#define ITERATIONS 	  		0x2

#include "boot.s"

.global main
main:

th_fork(th_main,%l0)

th_main_0:
	setx    addrA, 	%l0, addrA_reg			! 
	setx    addrB, 	%l0, addrB_reg			! 
	setx    addrC, 	%l0, addrC_reg			! 
        set     TIMEOUT,	to_reg         		! set timeout count 
	inc 	to_reg
	mov	to_reg, backoff_hlp1
	dec 	to_reg
        set     ITERATIONS,	global_cnt_reg 		! 
        mov     %g0, my_id_reg

        add     my_id_reg, 0x20, my_id_reg			! this is my ID address

getlock0:
        set     1, test_reg1       		! load the swap data register
        set     0x20, test_reg2       		! load the swap data register
        st    	test_reg1, [addrA_reg]		! try to acquire lock
        st    	test_reg2, [addrC_reg]		! try to acquire lock
	membar 0x40
        ld    	[addrC_reg], test_reg2
        ld    	[addrB_reg], test_reg1		! try to acquire lock
	tst	test_reg1
	be	gotlock0
        nop

	st	%g0,  [addrA_reg]		! release

        deccc   to_reg         			! dec timeout count
        bne     getlock0               		! branch if no timeout
        nop
        ba,a    bad_end
        nop

gotlock0:

	subcc	test_reg2, 0x20, %g0
	bne	bad_end
	nop

clearlock0:
        st        %g0, [addrA_reg]            	! lock value (0=unlocked)
	nop;nop;nop;nop;			! wait


	mov to_reg, backoff_cnt
backoff_loop01:
	nop;nop;nop;nop;			! backoff
	deccc backoff_cnt			
	bne backoff_loop01
	nop

        set     TIMEOUT, to_reg         		! set timeout count again

check_done0:
	deccc	global_cnt_reg
        be	good_end
	nop
	ba	getlock0
	nop

th_main_1:
th_main_2:
th_main_4:
	setx    addrA, 	%l0, addrA_reg			! 
	setx    addrB, 	%l0, addrB_reg			! 
	setx    addrC, 	%l0, addrC_reg			! 
        set     TIMEOUT,	to_reg         		! set timeout count 
	inc 	to_reg
	mov	to_reg, backoff_hlp1
	dec 	to_reg
        set     ITERATIONS,	global_cnt_reg 		! 
        mov     %g0, my_id_reg

        add     my_id_reg, 0x24, my_id_reg

getlock1:
        set     1, test_reg1       		! load the swap data register
        set     0x21, test_reg2       		! load the swap data register
        st    	test_reg1, [addrB_reg]		! try to acquire lock
        st    	test_reg2, [addrC_reg]		! try to acquire lock
	membar 0x40
        ld    	[addrC_reg], test_reg2
        ld    	[addrA_reg], test_reg1		! try to acquire lock
	tst	test_reg1
	be	gotlock1
        nop

	st	%g0,  [addrB_reg]			! release

	sub backoff_hlp1, to_reg, backoff_cnt
backoff_loop10:
	nop;nop;nop;nop;			! wait - quasi exponential backoff
	deccc backoff_cnt			! well, kinda linear.
	bne backoff_loop10
	nop

        deccc   to_reg          			! dec timeout count
        bne     getlock1                 		! branch if no timeout
        nop
        ba,a    bad_end
        nop

gotlock1:
	subcc	test_reg2, 0x21, %g0
	bne	bad_end
	nop

clearlock1:
        st        %g0, [addrB_reg]            		! lock value (0=unlocked)

        set     TIMEOUT, to_reg         		! set timeout count again

check_done1:
	deccc	global_cnt_reg
        be	good_end
	nop
	ba	getlock1
	nop

good_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

!==========================


SECTION .MY_DATA0  DATA_VA=0xd0100000
attr_data {
        Name = .MY_DATA0,
        VA= 0x0d0100000
#ifdef PIO1
        RA=0xcf00bee000,
        PA=0xcf00bee000,
#else
        RA= 0x1d0100000
        PA= ra2pa(0x1d0100000,0),
#endif
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }

	.data

.global addrA
.align 0x4
addrA:
	.word	0x0

SECTION .MY_DATA1  DATA_VA=0xd1110000
attr_data {
        Name = .MY_DATA1,
        VA= 0x0d1110000,
#ifdef PIO2
        RA=0xef00bee000,
        PA=0xef00bee000,
#else
        RA= 0x1d1110000,
        PA= ra2pa(0x1d1110000,0),
#endif
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }

	.data

.global addrB
.global addrC
.align 0x4
addrB:
	.word	0x0

.skip 0x1000
.align 0x4
addrC:
	.word	0x0

.global protected_area
protected_area:
	.word	0xbeef
	.skip 0x1000
	.word	0xbeef
	
.end
