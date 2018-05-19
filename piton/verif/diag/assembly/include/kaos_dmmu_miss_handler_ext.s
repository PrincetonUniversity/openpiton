// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: kaos_dmmu_miss_handler_ext.s
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
#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_0
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_0 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_1
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_1 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_2
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_2 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_3
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_3 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_4
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_4 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_5
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_5 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_6
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_6 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_7
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_7 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_8
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_8 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_9
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_9 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_10
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_10 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_11
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_11 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_12
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_12 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_13
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_13 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_14
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_14 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_15
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_15 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_16
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_16 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_17
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_17 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_18
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_18 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_19
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_19 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_20
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_20 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_21
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_21 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_22
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_22 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_23
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_23 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_24
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_24 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_25
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_25 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_26
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_26 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_27
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_27 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_28
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_28 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_29
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_29 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_30
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_30 0
#endif

#ifndef LOCAL_SUPERVISOR_SECTION_DATA_PA_31
#define LOCAL_SUPERVISOR_SECTION_DATA_PA_31 0
#endif

dmmu_miss_handler_ext:
dmmu_ps0:
	cmp	%g4, -1			! if all 1's, follow link
	be,a	%xcc, dmmu_ptr_chase
	mov	0, %g7			! remember ptr chase from ps0
	srlx	%g5, 63, %g3		! if not valid, check ps1
	brz	%g3, dmmu_ps1

#ifndef SUN4V
	sllx	%g5, 15, %g3		! extract size[2]
	srlx	%g3, 61, %g3
	sllx	%g5, 1, %g1		! extract size[1:0]
	srlx	%g1, 62, %g1
	or	%g3, %g1, %g1		! %g1 = size[2:0]
#else
	sllx	%g5, 61, %g1
	srlx	%g1, 61, %g1            ! %g1 = size[2:0]
#endif
	mulx	%g1, 3, %g1
	sub	%g0, 1, %g3
	sllx	%g3, 13, %g3
	sllx	%g3, %g1, %g3
        sethi   %hi(0x00001fff), %g1
        or      %g1, 0xfff, %g1
	or	%g3, %g1, %g3		! %g3 = va/ctxt mask based on size[2:0]

	and	%g2, %g3, %g3		! apply mask
	cmp	%g3, %g4		! check if va/ctxt match
	be,a	%xcc, dmmu_trap_done
	mov	0x80, %g1		! offset (VA) for patrition id
		
dmmu_ps1:
	ldxa	[%g0] 0x5a, %g1		! dmmu ps1 ptr
	ldda	[%g1] 0x24, %g4		! load tte from ps1 tsb
	cmp	%g4, -1			! if all 1's, follow link
	be,a	%xcc, dmmu_ptr_chase
	mov	1, %g7			! remember ptr chase from ps1
	srlx	%g5, 63, %g3		! if not valid, bad_trap
	!cmp	%g3, %g0
	!te	%xcc, T_BAD_TRAP
	brz	%g3, check_for_dmmu_flush_and_sigsegv

#ifndef SUN4V
	sllx	%g5, 15, %g3		! extract size[2]
	srlx	%g3, 61, %g3
	sllx	%g5, 1, %g1		! extract size[1:0]
	srlx	%g1, 62, %g1
	or	%g3, %g1, %g1		! %g1 = size[2:0]
#else
	sllx	%g5, 61, %g1
	srlx	%g1, 61, %g1            ! %g1 = size[2:0]
#endif
	mulx	%g1, 3, %g1
	sub	%g0, 1, %g3
	sllx	%g3, 13, %g3
	sllx	%g3, %g1, %g3
        sethi   %hi(0x00001fff), %g1
        or      %g1, 0xfff, %g1
	or	%g3, %g1, %g3		! %g3 = va/ctxt mask based on size[2:0]

	and	%g2, %g3, %g3		! apply mask
	cmp	%g3, %g4		! check if va/ctxt match
	be,a	%xcc, dmmu_trap_done
	mov	0x80, %g1		! offset (VA) for patrition id

 	!ta	T_BAD_TRAP
 	ba	check_for_dmmu_flush_and_sigsegv

	nop
	
dmmu_ptr_chase:
 	or 	%g5, %g0, %g6           ! %g6 is link-reg
dmmu_ptr_chase_loop:
	ldda	[%g6] 0x24, %g4		! load tte from tsb

#ifndef SUN4V
	sllx	%g5, 15, %g3		! extract size[2]
	srlx	%g3, 61, %g3
	sllx	%g5, 1, %g1		! extract size[1:0]
	srlx	%g1, 62, %g1
	or	%g3, %g1, %g1		! %g1 = size[2:0]
#else
	sllx	%g5, 61, %g1
	srlx	%g1, 61, %g1            ! %g1 = size[2:0]
#endif
	mulx	%g1, 3, %g1
	sub	%g0, 1, %g3
	sllx	%g3, 13, %g3
	sllx	%g3, %g1, %g3
        sethi   %hi(0x00001fff), %g1
        or      %g1, 0xfff, %g1
	or	%g3, %g1, %g3		! %g3 = va/ctxt mask based on size[2:0]

	and	%g2, %g3, %g3		! apply mask
	cmp	%g3, %g4		! check if va/ctxt match
	be,a	%xcc, dmmu_trap_done
	mov	0x80, %g1		! offset (VA) for patrition id
	
	ldx	[%g6+16], %g6
	cmp	%g6, -1
	bne	%xcc, dmmu_ptr_chase_loop ! keep chasing pointer
	nop
	brz	%g7, dmmu_ps1		! finished ps0 pointer chasing, go to ps1
	nop
	!ta	T_BAD_TRAP		! finished ps1 pointer chasing, go to bad_trap
	ba	check_for_dmmu_flush_and_sigsegv		! finished ps1 pointer chasing, go to bad_trap
	nop

dmmu_trap_done:
	! add partition base to data-in
	setx	partition_base_list, %g3, %g2	! for partition base
	ldxa	[%g1] 0x58, %g3		! partition id
	sllx	%g3, 3, %g3		! offset - partition list
	ldx	[%g2 + %g3], %g1
	add	%g5, %g1, %g5
#ifndef SUN4V
	stxa	%g5, [ %g0 ] 0x5c	! data-in
#else
	mov	0x400, %g6
	stxa	%g5, [ %g6 ] 0x5c	! data-in
#endif
	retry 

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!	
dmmu_real_miss_handler_ext:
	mov	%g2, %g4
	srlx	%g2, 33, %g2		! check to see if ra exceeds 8GB limit
	cmp	%g2, %g0
	tne	%xcc, T_BAD_TRAP
#ifndef SUN4V
	setx	0x8000000000000022, %g2, %g5 ! CP W
#else
	setx	0x8000000000000440, %g2, %g5 ! CP W
#endif
	srlx	%g4, 13, %g4		! get rid of garbage in context field
	sllx	%g4, 13, %g4
	or	%g4, %g5, %g5
	! add partition base to data-in
	setx	partition_base_list, %g1, %g2	! for partition base
	mov	0x80, %g1		! offset (VA) for patrition id
	ldxa	[%g1] 0x58, %g3		! partition id
	sllx	%g3, 3, %g3		! offset - partition list
	ldx	[%g2 + %g3], %g1
	add	%g5, %g1, %g5
	mov	0x30, %g7
#ifndef SUN4V
	mov	0x200, %g6
#else
	mov	0x600, %g6
#endif
	stxa	%g4, [ %g7 ] 0x58	! {tag-access, data-in}
	stxa	%g5, [ %g6 ] 0x5c
	retry 


	nop
check_for_dmmu_flush_and_sigsegv: 

        /* check for flush */

        ldxa   [%g0]0x58, %g5
        ldxa   [%g0]0x59, %g1 

        and     %g5, 0x3ff, %g5 
        sll     %g5, 9, %g5 
        srl     %g1, 4, %g1 
        and     %g1, 0x1ff, %g1 
        or      %g1, %g5, %g4 

        !ta       0x2
        rdpr     %tpc, %g2

	ta       0x2e
        cmp      %o1, 0
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_0,0), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 1
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_1,0), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 2
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_2,0), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 3
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_3,0), %g3, %g1
	be,a     1f
	nop 

        cmp      %o1, 4
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_4,0), %g3, %g1
	be,a     1f
	nop 

        cmp      %o1, 5
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_5,0), %g3, %g1
	be,a     1f
	nop 

        cmp      %o1, 6
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_6,0), %g3, %g1
	be,a     1f
	nop 

        cmp      %o1, 7
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_7,0), %g3, %g1
	be,a     1f
	nop 

        cmp      %o1, 8
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_8,0), %g3, %g1
	be,a     1f
	nop 

        cmp      %o1, 9
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_9,0), %g3, %g1
	be,a     1f
	nop 

        cmp      %o1, 10
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_10,0), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 11
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_11,0), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 12
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_12,0), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 13
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_13,0), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 14
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_14,0), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 15
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_15,0), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 16
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_16,0), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 17
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_17,0), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 18
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_18,0), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 19
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_19,0), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 20
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_20,0), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 21
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_21,0), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 22
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_22,0), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 23
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_23,0), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 24
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_24,0), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 25
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_25,0), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 26
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_26,0), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 27
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_27,0), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 28
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_28,0), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 29
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_29,0), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 30
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_30,0), %g3, %g1
	be,a     1f
	nop 
        cmp      %o1, 31
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_31,0), %g3, %g1
	be,a     1f
	nop 

	ta       0x1
	nop

1:      stx      %g2, [%g1]

        !! Kin Kee's code - start

        mov     0x08, %g1
        ldxa    [%g1] 0x21, %o1
        mov     0x10, %g1
        ldxa    [%g1] 0x21, %o2 
        set     0x1, %o3
        set     0x0, %o4
        setx    data_segv_check, %g1, %o5

        ta 0x2a

        nop

        !! Kin Kee's code - end


/*
 * The following section is for illegal trap handling.
 * It does not belong in this file. It should be 
 * in the boot code just before the code in main.
 *
 */

.global illegal_trap_handler
illegal_trap_handler:

        rdpr     %tpc, %g2

	ta       0x2e
        cmp      %o1, 0
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_0,0), %g3, %g1
	be,a     1f
	nop 

        cmp      %o1, 1
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_1,0), %g3, %g1
	be,a     1f
	nop 

        cmp      %o1, 2
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_2,0), %g3, %g1
	be,a     1f
	nop 

        cmp      %o1, 3
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_3,0), %g3, %g1
	be,a     1f
	nop 

        cmp      %o1, 4
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_4,0), %g3, %g1
	be,a     1f
	nop 

        cmp      %o1, 5
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_5,0), %g3, %g1
	be,a     1f
	nop 

        cmp      %o1, 6
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_6,0), %g3, %g1
	be,a     1f
	nop 

        cmp      %o1, 7
        setx     ra2pa(LOCAL_SUPERVISOR_SECTION_DATA_PA_7,0), %g3, %g1
	be,a     1f
	nop 

	ta       0x1
	nop

1:      stx      %g2, [%g1]

        !! Kin Kee's code - start

        mov     0x08, %g1
        ldxa    [%g1] 0x21, %o1
        mov     0x10, %g1
        ldxa    [%g1] 0x21, %o2 
        set     0x1, %o3
        set     0x0, %o4
        setx    handle_ill_trap, %g1, %o5

        ta 0x2a

        nop

