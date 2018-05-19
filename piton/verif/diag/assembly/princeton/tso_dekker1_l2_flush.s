// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_dekker1.s
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
 * Description: use exponential backoff to ensure forward progress
 **********************************************************************/

#define global_cnt_reg	  		%o0
#define data_base_reg	  		%o1
#define addrA_reg 			%o2
#define addrB_reg 			%o3
#define to_reg	  			%o4
#define my_id_reg	  		%o5
#define test_reg	  		%o6

#define backoff_cnt	  		%i4
#define backoff_hlp1  			%i5

#define TIMEOUT 	  		0x100
#define ITERATIONS 	  		0x10

#include "boot.s"

.global main
main:
        setx	active_thread, %l1, %o5 
        jmpl    %o5, %o7
        nop

!

!
!       Note that this 8KB segment should be mapped VA==PA==RA
!
SECTION .FIRST_THREAD_SEC TEXT_VA=0x0000000040008000
   attr_text {
        Name = .FIRST_THREAD_SEC,
        VA= 0x0000000040008000,
        PA= ra2pa(0x0000000040008000,0),
        RA= 0x0000000040008000,
        part_0_i_ctx_nonzero_ps0_tsb,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1,  TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
        }
   attr_text {
        Name = .FIRST_THREAD_SEC,
        hypervisor
        }

.global active_thread

active_thread:
    ta      T_CHANGE_HPRIV          ! enter Hyper mode

	setx    addrA, 	%l0, 	addrA_reg		! 
	setx    addrB, 	%l0, 	addrB_reg		! 
        set     TIMEOUT,	to_reg         		! set timeout count 
	inc 	to_reg
	mov	to_reg, backoff_hlp1
	dec 	to_reg
        set     ITERATIONS,	global_cnt_reg 		! 
        mov     %g0, 		my_id_reg


th_fork(th_main,%l0)

th_main_0:
        add     my_id_reg, 0x20, my_id_reg	! this is my ID address

getlock0:
        set     1, test_reg       		! load the swap data register
        st    	test_reg, [addrA_reg]		! try to acquire lock
	membar 0x40
        ld    	[addrB_reg], test_reg		! try to acquire lock
	tst	test_reg
	be	gotlock0
        nop

	st	%g0,  [addrA_reg]		! release
	membar 0x40

        deccc   to_reg         			! dec timeout count
        bne     getlock0               		! branch if no timeout
        nop
        ba,a    bad_end
        nop

gotlock0:						! do something
	setx    protected_area,	%l0, data_base_reg	! the data area

	set 	10, %l0
	add	my_id_reg, data_base_reg, %i1
loop01:
	st 	%i1, [data_base_reg]  			! store my ID in there
	add	data_base_reg, 4, data_base_reg 	! increment the address
	add	%i1, 1, %i1
	deccc	%l0
	bne 	loop01					! repeat
	nop

	set 	10, %l0
loop02:
	sub	data_base_reg, 4, data_base_reg 
	sub	%i1, 1, %i1
	ld 	[data_base_reg], %l1			! read the data area
	subcc 	%l1, %i1, %l1				! should be same is i1
	bne	bad_end
	nop
	deccc	%l0					! repeat
	bne 	loop02
	nop

clearlock0:
        st        %g0, [addrA_reg]            		! unlock
	membar 0x40

	mov  to_reg, backoff_cnt
backoff_loop01:
	nop;nop;nop;nop;				! backoff
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
        add     my_id_reg, 0x24, my_id_reg

getlock1:
        set     1, test_reg       	! load the swap data register
        st    	test_reg, [addrB_reg]	! try to acquire lock addr B
	membar 0x40
        ld    	[addrA_reg], test_reg	! try to acquire lock addr A
	tst	test_reg
	be	gotlock1
        nop

	st	%g0,  [addrB_reg]	! release
	membar 0x40

	sub backoff_hlp1, to_reg, backoff_cnt
backoff_loop10:
	nop;nop;nop;nop;		! wait - quasi exponential backoff
	deccc backoff_cnt		! well, actually kinda linear.
	bne backoff_loop10
	nop

        deccc   to_reg       		! dec timeout count
        bne     getlock1       		! branch if no timeout
        nop
        ba,a    bad_end
        nop

gotlock1:				! do something
	setx    protected_area,	%l0, data_base_reg	! the data area

	set 	10, %l0
	add	my_id_reg, data_base_reg, %i1
loop11:
	st 	%i1, [data_base_reg]  	! store my ID in there
	add	data_base_reg, 4, data_base_reg 	! increment the address
	add	%i1, 1, %i1
	deccc	%l0
	bne 	loop11			! repeat
	nop

	set 	10, %l0
loop12:
	sub	data_base_reg, 4, data_base_reg 
	sub	%i1, 1, %i1
	ld 	[data_base_reg], %l1	! read the data area
	subcc 	%l1, %i1, %l1		! should be same is i1
	bne	bad_end
	nop
	deccc	%l0			! repeat
	bne 	loop12
	nop


clearlock1:
        st        %g0, [addrB_reg]     	! unlock
	membar 0x40

        set     TIMEOUT, to_reg        	! set timeout count again

check_done1:
	deccc	global_cnt_reg
        be	good_end
	nop
	ba	getlock1
	nop

th_main_2:



	setx	0xa300000000, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300000400, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300000800, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300000c00, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300001000, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300001400, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300001800, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300001c00, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300002000, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300002400, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300002800, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300002c00, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300003000, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300003400, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300003800, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300003c00, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300004000, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300004400, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300004800, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300004c00, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300005000, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300005400, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300005800, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300005c00, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300006000, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300006400, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300006800, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300006c00, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300007000, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300007400, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300007800, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300007c00, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300008000, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300008400, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300008800, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300008c00, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300009000, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300009400, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300009800, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa300009c00, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa30000a000, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa30000a400, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa30000a800, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa30000ac00, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa30000b000, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa30000b400, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa30000b800, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa30000bc00, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa30000c000, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa30000c400, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa30000c800, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa30000cc00, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa30000d000, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa30000d400, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa30000d800, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa30000dc00, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa30000e000, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa30000e400, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa30000e800, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa30000ec00, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa30000f000, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa30000f400, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa30000f800, %l0, %l1
	ldx	[%l0], %l0

	setx	0xa30000fc00, %l0, %l1
	ldx	[%l0], %l0


    be	good_end
	nop

th_main_3:



	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrA, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	addrB, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5

	setx	protected_area, %l5, %l0
    sllx    %l0, 30, %l1
    srlx    %l1, 36, %l1
    sllx    %l1,  6, %l1
    srlx    %l0, 34, %l2
    mov     0x2b, %l3
    sllx    %l3, 34, %l3
    or      %l3, %l1, %l3
    or      %l3, %l2, %l0 
	ldub	[%l0], %l5


    be	good_end
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

.global addrA
.global addrB
.align 0x4
addrA:
	.word	0x0

.skip 0x1000
.align 0x4
addrB:
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
	
.end
