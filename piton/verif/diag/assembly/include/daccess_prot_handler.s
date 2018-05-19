// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: daccess_prot_handler.s
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
daccess_prot_handler:
#ifdef CHECK_SFSR_SFAR
        mov     0x18, %g7
        ldxa    [%g7] 0x58, %g2         ! get sfsr
        mov     0x20, %g7
        ldxa    [%g7] 0x58, %g3         ! get sfar
#endif
 
dacc_pro_ps0:
	ldxa	[%g0] 0x59, %g1		! dmmu ps0 ptr
	ldda	[%g1] 0x24, %g4		! load tte from ps0 tsb
	cmp	%g4, -1			! if all 1's, follow link
	be,a	%xcc, dacc_pro_ptr_chase
	mov	0, %g7			! remember ptr chase from ps0
	srlx	%g5, 63, %g3		! if not valid, check ps1
	brz	%g3, dacc_pro_ps1

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
	be	%xcc, dacc_pro_trap_done
	nop
	
dacc_pro_ps1:
	ldxa	[%g0] 0x5a, %g1		! dmmu ps1 ptr
	ldda	[%g1] 0x24, %g4		! load tte from ps1 tsb
	cmp	%g4, -1			! if all 1's, follow link
	be,a	%xcc, dacc_pro_ptr_chase
	mov	1, %g7			! remember ptr chase from ps1
	srlx	%g5, 63, %g3		! if not valid, bad_trap
	brz	%g3, bad_trap

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
	be	%xcc, dacc_pro_trap_done
	nop

 	ba	bad_trap
	nop
	
dacc_pro_ptr_chase:
 	or 	%g5, %g0, %g6           ! %g6 is link-reg
dacc_pro_ptr_chase_loop:
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
	be	%xcc, dacc_pro_trap_done
	
	ldx	[%g6+16], %g6
	cmp	%g6, -1
	bne	%xcc, dacc_pro_ptr_chase_loop ! keep chasing pointer
	nop
	brz	%g7, dacc_pro_ps1	! finished ps0 pointer chasing, go to ps1
	nop
	ba	bad_trap		! finished ps1 pointer chasing, go to bad_trap
	nop

dacc_pro_trap_done:
	! add partition base to data-in
	setx	partition_base_list, %g1, %g2	! for partition base
	mov	0x80, %g1		! offset (VA) for patrition id
	ldxa	[%g1] 0x58, %g3		! partition id
	sllx	%g3, 3, %g3		! offset - partition list
	ldx	[%g2 + %g3], %g1
	or	%g5, %g1, %g5
	mov	0x2, %g1		! set W-bit
	add	%g1, %g5, %g5
	mov	0x30, %g7
#ifndef SUN4V
	mov	%g0, %g6
#else
	mov	0x400, %g6
#endif
	stxa	%g4, [ %g7 ] 0x58	! {tag-access, data-in}
	stxa	%g5, [ %g6 ] 0x5c
	retry 

