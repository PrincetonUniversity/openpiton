// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: kaos_immu_miss_handler_ext.s
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
immu_miss_handler_ext:
immu_ps0:
	cmp	%g4, -1			! if all 1's, follow link
	be,a	%xcc, immu_ptr_chase
	mov	0, %g7			! remember ptr chase from ps0
	srlx	%g5, 63, %g3		! if not valid, check ps1
	brz	%g3, immu_ps1

#ifndef SUN4V
	sllx	%g5, 15, %g3		! extract size[2]
	srlx	%g3, 61, %g3
	sllx	%g5, 1, %g1		! extract size[1:0]
	srlx	%g1, 62, %g1
	or	%g3, %g1, %g1		! %g1 = size[2:0]
#else
	sllx	%g5, 61, %g1
	srlx	%g1, 61, %g1		! %g1 = size[2:0]
#endif
	mulx	%g1, 3, %g1
	sub	%g0, 1, %g3
	sllx	%g3, 13, %g3
	sllx	%g3, %g1, %g3
	sethi	%hi(0x00001fff), %g1
	or	%g1, 0xfff, %g1
	or	%g3, %g1, %g3		! %g3 = va/ctxt mask based on size[2:0]

	and	%g2, %g3, %g3		! apply mask
	cmp	%g3, %g4		! check if va/ctxt match
	be,a	%xcc, immu_trap_done
	mov	0x80, %g1		! offset (VA) for patrition id

immu_ps1:
	ldxa	[%g0] 0x52, %g1		! immu ps1 ptr
	ldda	[%g1] 0x24, %g4		! load tte from ps1 tsb
	cmp	%g4, -1			! if all 1's, follow link
	be,a	%xcc, immu_ptr_chase
	mov	1, %g7			! remember ptr chase from ps1
	srlx	%g5, 63, %g3		! if not valid, bad_trap
	!cmp	%g3, %g0
	!te	%xcc, T_BAD_TRAP
	brz	%g3, check_for_immu_sigsegv

#ifndef SUN4V
	sllx	%g5, 15, %g3		! extract size[2]
	srlx	%g3, 61, %g3
	sllx	%g5, 1, %g1		! extract size[1:0]
	srlx	%g1, 62, %g1
	or	%g3, %g1, %g1		! %g1 = size[2:0]
#else
	sllx	%g5, 61, %g1
	srlx	%g1, 61, %g1		! %g1 = size[2:0]
#endif
	mulx	%g1, 3, %g1
	sub	%g0, 1, %g3
	sllx	%g3, 13, %g3
	sllx	%g3, %g1, %g3
	sethi	%hi(0x00001fff), %g1
	or	%g1, 0xfff, %g1
	or	%g3, %g1, %g3		! %g3 = va/ctxt mask based on size[2:0]

	and	%g2, %g3, %g3		! apply mask
	cmp	%g3, %g4		! check if va/ctxt match
	be,a	%xcc, immu_trap_done
	mov	0x80, %g1		! offset (VA) for patrition id
	
 	!ta	T_BAD_TRAP
 	ba	check_for_immu_sigsegv
	nop
	
immu_ptr_chase:
 	or 	%g5, %g0, %g6           ! %g6 is link-reg
immu_ptr_chase_loop:
	ldda	[%g6] 0x24, %g4		! load tte from tsb

#ifndef SUN4V
	sllx	%g5, 15, %g3		! extract size[2]
	srlx	%g3, 61, %g3
	sllx	%g5, 1, %g1		! extract size[1:0]
	srlx	%g1, 62, %g1
	or	%g3, %g1, %g1		! %g1 = size[2:0]
#else
	sllx	%g5, 61, %g1
	srlx	%g1, 61, %g1		! %g1 = size[2:0]
#endif
	mulx	%g1, 3, %g1
	sub	%g0, 1, %g3
	sllx	%g3, 13, %g3
	sllx	%g3, %g1, %g3
	sethi	%hi(0x00001fff), %g1
	or	%g1, 0xfff, %g1
	or	%g3, %g1, %g3		! %g3 = va/ctxt mask based on size[2:0]

	and	%g2, %g3, %g3		! apply mask
	cmp	%g3, %g4		! check if va/ctxt match
	be,a	%xcc, immu_trap_done
	mov	0x80, %g1		! offset (VA) for patrition id
	
	ldx	[%g6+16], %g6
	cmp	%g6, -1
	bne	%xcc, immu_ptr_chase_loop ! keep chasing pointer
	nop
	brz	%g7, immu_ps1		! finished ps0 pointer chasing, go to ps1
	nop
	!ta	T_BAD_TRAP		! finished ps1 pointer chasing, go to bad_trap
	ba	check_for_immu_sigsegv		! finished ps1 pointer chasing, go to bad_trap
	nop

immu_trap_done:
	! add partition base to data-in
	setx	partition_base_list, %g3, %g2	! for partition base
	ldxa	[%g1] 0x58, %g3		! partition id
	sllx	%g3, 3, %g3		! offset - partition list
	ldx	[%g2 + %g3], %g1
	add	%g5, %g1, %g5
#ifndef SUN4V
	stxa	%g5, [ %g0 ] 0x54	! data-in
#else
	mov	0x400, %g6
	stxa	%g5, [ %g6 ] 0x54	! data-in
#endif
#ifdef H_T0_fast_instr_access_MMU_miss_Ext
	setx	H_T0_fast_instr_access_MMU_miss_Ext, %g4, %g5
	jmp	%g5
	nop
#else
	retry 
#endif

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!	
immu_real_miss_handler_ext:
	mov	%g2, %g4
	srlx	%g2, 33, %g2		! check to see if ra exceeds 8GB limit
	cmp	%g2, %g0
	tne	%xcc, T_BAD_TRAP
#ifndef SUN4V
	setx	0x8000000000000020, %g2, %g5 ! CP
#else
	setx	0x8000000000000400, %g2, %g5 ! CP
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
	stxa	%g4, [ %g7 ] 0x50	! {tag-access, data-in}
	stxa	%g5, [ %g6 ] 0x54
	retry 

	nop
check_for_immu_sigsegv: 

        /* invalid TTE, check for sigsegv */

        rdpr    %tpc, %g1            !get va
        set     0xffffe000, %g2
        andcc   %g1, %g2, %g3        ! check first page 
        be      1f
        nop
        cmp     %g2, %g3             ! check last page
        bne     bad_trap
        nop
1:      
        add     %o7, 8, %g1
        wrpr    %g1, %tnpc 
        done
        nop




