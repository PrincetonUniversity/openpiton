// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_indirection2.s
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
 * Description: processor indirection
 * proc0 does st A; proc 1 waits for A and does store C
 * proc2 waits for C and reads A. Should be new value of A.
 *
 **********************************************************************/

#define tmp0			%i0
#define tmp1			%i1
#define tmp2			%i2
#define tmp3			%i3

#define global_cnt_reg	  	%i4

#define addrA_reg  		%l0
#define addrC_reg		%l2

#define test_reg		%o4
#define test2_reg		%o5

#define ITERATIONS 	  	0x4

#include "boot.s"

.global main

main:

	setx    addrA,		tmp1, addrA_reg
	setx    addrC, 		tmp1, addrC_reg

        set     ITERATIONS,	global_cnt_reg 

th_fork(th_main,tmp1)

!=====================================================
th_main_0:
	mov	0x20,	test2_reg
loop00:
	inc 	test2_reg
	st	test2_reg, [addrA_reg]

! BARRIER here
!=============
        set     barrier_code, tmp0
        jmpl    tmp0,%o7
        nop 

	dec     global_cnt_reg
        brz     global_cnt_reg, good_end
        nop

	ba	loop00	
	nop

!=========================================================
#ifdef ZERO_THREE_SIX
th_main_3:
#else
th_main_1:
#endif
th_main_4:

	mov	0x21, test2_reg
loop10:						! wait  
        ld    	[addrA_reg], test_reg
	sub	test_reg, test2_reg, tmp1
	brnz	tmp1, loop10
	nop

	st	test_reg, [addrC_reg]		! store non-zero to C
	inc 	test2_reg

! BARRIER here
!=============
        set     barrier_code, tmp0
        jmpl    tmp0,%o7
        nop 

	dec     global_cnt_reg
        brz     global_cnt_reg, good_end
        nop

	ba	loop10				! loop
	nop

!=========================================================
#ifdef ZERO_THREE_SIX
th_main_6:
#else
th_main_2:
#endif
th_main_8:

	mov 	0x21, test2_reg
loop30:
        ld    	[addrC_reg], test_reg		! load C until set
	brz	test_reg, loop30
	nop

        ld    	[addrA_reg], test_reg
	subcc	test_reg, test2_reg, %g0
	bne	bad_end
	nop

	inc	test2_reg

	st	%g0,    [addrC_reg]		! clear
	st	%g0,    [addrA_reg]		! clear

! BARRIER here
!=============
        set     barrier_code, tmp0
        jmpl    tmp0,%o7
        nop 

	dec     global_cnt_reg
        brz     global_cnt_reg, good_end
        nop

	ba	loop30				! loop
	nop

!============================================================

barrier_code:
        setx    barrier_data, tmp1, tmp2
        sll     global_cnt_reg, 0x3, tmp1
        add     tmp1, tmp2, tmp2

bloop1:
        mov     0xff, tmp1
        cas     [tmp2], %g0, tmp1
        brnz    tmp1, bloop1
#ifdef PREFETCH					! lock the barrier counter
        prefetch [tmp2], #n_reads
#else
        nop
#endif

        ld      [tmp2 + 4], tmp3		! increment
        inc     tmp3
        st      tmp3, [tmp2 + 4]

        st      %g0, [tmp2]                     ! unlock
bloop2: 
        ld      [tmp2 + 4], tmp3		! if 0
        brz     tmp3, bout2                     ! somebody already reset it
        sub     tmp3, THREAD_COUNT, tmp3        ! subtract THREAD_COUNT
        brnz    tmp3, bloop2                    ! if 0 we are out.
#ifdef PREFETCH
        prefetch [tmp2], #n_reads
#else
        nop
#endif
        
        st      %g0, [tmp2 + 4]                 ! clear the barrier counter
bout2:
        jmpl    %o7+8, %g0                      ! return
        nop

good_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

!==========================

	.data

.global addrA
.align 0x40
addrA:
	.word 0x0
	.skip 0x100

.align 0x40
.global addrC
addrC:
	.word	0x0
	.skip 0x100
.global barrier_data
barrier_data:
        .skip   0x100

.end
