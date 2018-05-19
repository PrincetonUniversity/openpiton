// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: immu_miss_handler_ext.s
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
#ifdef CSM_ENABLE
    srlx      %g7, 1, %g7
    sllx      %g7, 1, %g7
#else
	mov	0, %g7			! remember ptr chase from ps0
#endif
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
#ifdef CSM_ENABLE
    or      %g7, 1, %g7
#else
	mov	1, %g7			! remember ptr chase from ps0
#endif
	srlx	%g5, 63, %g3		! if not valid, bad_trap
	cmp	%g3, %g0
	te	%xcc, T_BAD_TRAP

#ifdef CSM_ENABLE
    sllx    %g1, 1, %g1
    and     %g7, 1, %g7
    or      %g1, %g7, %g7
#endif
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
	
 	ta	T_BAD_TRAP
	nop
	
immu_ptr_chase:
 	or 	%g5, %g0, %g6           ! %g6 is link-reg
immu_ptr_chase_loop:
	ldda	[%g6] 0x24, %g4		! load tte from tsb

#ifdef CSM_ENABLE
    sllx    %g6, 1, %g1
    and     %g7, 1, %g7
    or      %g1, %g7, %g7
#endif
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
#ifdef CSM_ENABLE
    and  %g7, 1, %g3
	brz	%g3, immu_ps1		! finished ps0 pointer chasing, go to ps1
#else
	brz	%g7, immu_ps1		! finished ps0 pointer chasing, go to ps1
#endif
	nop
	ta	T_BAD_TRAP		! finished ps1 pointer chasing, go to bad_trap
	nop

immu_trap_done:
	! check to see if RA[39] is set.
	! RA[39] = 0 means accessing memory space
	! RA[39] = 1 means accessing I/O space
	mov	%g5, %g2
	sllx	%g2, 24, %g2
	srlx	%g2, 63, %g2
	brnz	%g2, immu_skip_part_base
	nop

	! add partition base to data-in
	setx	partition_base_list, %g3, %g2	! for partition base
	ldxa	[%g1] 0x58, %g3		! partition id
	sllx	%g3, 3, %g3		! offset - partition list
	ldx	[%g2 + %g3], %g1
	add	%g5, %g1, %g5

immu_skip_part_base:
    ! store csm info must be earlier than data to avoid overwrite
#ifdef CSM_ENABLE

!!immu_getlock:
!!    or      %g0, 1, %g2
!!    setx    mmu_spinlock_addr, %g3, %g4
!!    swap    [%g4], %g2
!!    tst     %g2
!!    bne     immu_getlock
!!    nop

    setx 0x50000000, %g3, %g2
    srlx    %g7, 1, %g7
    add %g2, %g7, %g7
	ldda	[%g7] 0x24, %g2		! load csm tte from ps0 tsb
    brnz    %g3, immu_skip_create_new_domain
    nop

immu_create_new_domain:
    mov    %g0, %g1
immu_new_domain_loop:
    setx   0x8150040004, %g2, %g4
    add    %g4, %g1, %g4
    ld     [%g4], %g6
    brnz,a %g6, immu_new_domain_loop
    add    %g1, 256, %g1    
  
    setx   0xba00000000, %g6, %g2
    ldx    [%g2], %g2            ! has coreid
    setx   0x3fffffff, %g6, %g3
    and    %g2, %g3, %g2
 
    rd      %asr26, %g3
    set     0x0100, %g6
    and     %g3, %g6, %g3
    sllx    %g3,  23, %g3		! %l1 has thread ID
    setx   0x80000000, %g3, %g6
    or     %g2, %g6, %g6
    or     %g6, %g3, %g6 
    st     %g6,  [%g4]

    srlx   %g1, 8, %g1 
    mov    0x3ff, %g6
    and    %g1, %g6, %g1
    setx   0x8000000000010000, %g6, %g3
    sllx   %g1, 6, %g1
    or     %g3, %g1, %g3
    sllx   %g1, 16, %g1
    or     %g3, %g1, %g3
    stx    %g3, [%g7+8] 
    ba     immu_st_csm
    nop 

immu_skip_create_new_domain:
    
immu_get_lsid:
    setx     0xba00000000, %g1, %g2
    ldx    [%g2], %g2            ! has coreid
    sllx   %g3, 2, %g1
    setx   0x3ffff, %g4, %g3
    and    %g1, %g3, %g1
    setx   0x8150040000, %g3, %g4
    add    %g4, %g1, %g4  ! base address of the clump
    setx   0x3fffffff, %g1, %g3
    and    %g2, %g3, %g2
    mov    %g0, %g1
immu_lsid_loop:
    ldx    [%g7+8], %g3
    srlx   %g1, 8, %g6    
	brnz,a %g6, immu_st_csm ! domain is in broadcast mode
    or     %g3, 0x3f, %g3

    and    %g1, 0x04, %g6
    cmp    %g6, %g0
    bne    %xcc, immu_lsid_odd
    nop
immu_lsid_even:
    add    %g1, 0x04, %g6
    ba     immu_cond_done
    nop
immu_lsid_odd:
    sub    %g1, 0x04, %g6
immu_cond_done:

    add    %g6, %g4, %g6 
    ld     [%g6], %g6   
    srlx   %g6, 31, %g3
    brz    %g3, immu_domain_expand
    nop

    set   0x3fffffff, %g3 
    and    %g6, %g3, %g6
    cmp    %g6, %g2
	bne,a  %xcc, immu_lsid_loop
    add    %g1, 0x04, %g1    

    srlx   %g1, 2, %g1
    ldx    [%g7+8], %g3
    or     %g3, %g1, %g3
    ba     immu_st_csm
    nop

immu_domain_expand:
    mov    %g0, %g1
immu_lsid_loop2:
    and    %g1, 0x04, %g6
    cmp    %g6, %g0
    bne    %xcc, immu_lsid_odd2
    nop
immu_lsid_even2:
    add    %g1, 0x04, %g6
    ba     immu_cond_done2
    nop
immu_lsid_odd2:
    sub    %g1, 0x04, %g6
immu_cond_done2:

    add    %g6, %g4, %g6 
    ld     [%g6], %g3   
    srlx   %g3, 31, %g3
    brz    %g3, immu_send_intr_done
    nop

    setx   0x800000000000003f, %g6, %g2
    srlx   %g3, 31, %g6
    and    %g6, 0x1, %g6
    sllx   %g6, 8, %g6
    or     %g2, %g6, %g2

    set   0x3fffffff, %g6 
    and    %g6, %g3, %g3
    sllx   %g3, 18, %g3
    or     %g2, %g3, %g2 
    ldx    [%g7+8], %g3
    sllx   %g3, 32, %g3
    srlx   %g3, 54, %g6
    sllx   %g6, 48, %g6      !embed hdid into 48:57 bits of the interrupt data
    or     %g2, %g6, %g2
    stxa	%g2, [%g0] 0x73  !send interrupt

	ba     immu_lsid_loop2
    add    %g1, 0x04, %g1    

immu_send_intr_done:
    srlx   %g1, 2, %g1 
    sub    %g1, 1, %g1
    setx   mmu_barrier_addr, %g2, %g3
immu_wait_for_barrier:
    ld     [%g3], %g2
    cmp    %g2, %g1
    bne    %xcc, immu_wait_for_barrier
    nop
 
    setx   mmu_barrier_addr, %g2, %g3
    st     %g0, [%g3]  
 
    mov    %g0, %g2
immu_get_rehome_id:
    srlx   %g1, %g2, %g3
    cmp    %g3, 1
    bne,a  %xcc, immu_get_rehome_id
    add    %g2, 1, %g2
        
    mov    1, %g3
    sllx   %g3, %g2, %g3
    sub    %g1, %g3, %g1 !rehome logical id 
    sllx   %g1, 2, %g1   
    add    %g1, %g4, %g1
    ld     [%g1], %g1   !rehome physical id
    setx   0xffffffe000, %g2, %g3
    and    %g5, %g3, %g3     !physical page address
    srlx   %g3,  34, %g2
    sllx   %g3, 30, %g3 
    srlx   %g3, 30, %g3 
    or     %g2, %g3, %g3
    mov    0x2b, %g4
    sllx   %g4, 34, %g4
    or     %g4, %g3, %g3 
    
    !mov     0x18, %g2
    !ldxa    [%g2] 0x1a, %g4 ! load from dtlb config reg
    !mov     1, %g2
    !sllx    %g2, 63, %g2
    !sllx    %g1, 32, %g2
    !or      %g1, %g2, %g1
    !or      %g1, %g4, %g4
    !mov     0x18, %g2
    !stxa    %g4, [%g2] 0x1a
    
    mov     %g0, %g1
immu_flush_l2:
    sllx    %g1, 6, %g2
    or      %g3, %g2, %g2
    ldub    [%g2], %g0
    cmp     %g1, 128
    bne,a   %xcc, immu_flush_l2
    add     %g1, 1, %g1

    
    mov     0x18, %g2
    ldxa    [%g2] 0x1a, %g3 ! load from dtlb config reg
    sllx    %g3, 2, %g3
    srlx    %g3, 2, %g3 !switch to local mode
    stxa    %g3, [%g2] 0x1a
    
    setx   0xba00000000, %g1, %g2
    ldx    [%g2], %g2            ! has coreid
    setx   0x3fffffff, %g1, %g3
    and    %g2, %g3, %g2
 
    rd      %asr26, %g3
    set     0x0100, %g1
    and     %g3, %g1, %g3
    sllx    %g3,  23, %g3		! %l1 has thread ID
    setx   0x80000000, %g3, %g1
    or     %g2, %g1, %g1
    or     %g1, %g3, %g1 
    st     %g1,  [%g6]

    !flush the HMC because it might have been used during the flush process
    ldx    [%g7+8], %g3
    srlx   %g3, 22, %g2
    mov    0x3ff, %g1
    and    %g1, %g2, %g1
    sllx    %g1, 10, %g1
    setx    0xb580000000, %g2, %g3
    or      %g1, %g3, %g1 
    stx     %g1, [%g1]  !flush the domain in HMC
    membar  #Sync


    ldx    [%g7+8], %g3
    srlx   %g3, 16, %g2
    mov    1,  %g1
    sllx   %g1, 16, %g1
    add    %g3, %g1, %g3
    stx    %g3, [%g7+8]
    mov    0x3f, %g1
    and    %g1, %g2, %g2
    or     %g2, %g3, %g3 
    

immu_st_csm:
	stxa	%g3, [ %g0 ] 0x0e	! csm data-in

!!immu_clear_lock:
!!    setx    mmu_spinlock_addr, %g3, %g4
!!    st      %g0, [%g4]

#endif

#ifndef SUN4V    mov     0x18, %g2
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
	! check to see if RA[39] is set.
	! RA[39] = 0 means accessing memory space
	! RA[39] = 1 means accessing I/O space
	mov	%g2, %g4
	sllx	%g2, 24, %g2
	srlx	%g2, 63, %g2
	brnz	%g2, immu_real_skip_part_base
	mov	%g0, %g1                ! %g1 will contain partition base

#ifndef DISABLE_PART_LIMIT_CHECK
	! if we get here, access is to memory space
	mov	%g4, %g2
	srlx	%g2, 33, %g2		! check to see if ra exceeds 8GB limit
	cmp	%g2, %g0
	tne	%xcc, T_BAD_TRAP
#endif

	! add partition base to data-in
	setx	partition_base_list, %g1, %g2	! for partition base
	mov	0x80, %g1		! offset (VA) for patrition id
	ldxa	[%g1] 0x58, %g3		! partition id
	sllx	%g3, 3, %g3		! offset - partition list
	ldx	[%g2 + %g3], %g1

immu_real_skip_part_base:
#ifdef REAL_TEXT_ATTR
	setx	REAL_TEXT_ATTR, %g2, %g5 ! user defined attributes
#else
#ifndef SUN4V
	setx	0x8000000000000020, %g2, %g5 ! CP
#else
	setx	0x8000000000000400, %g2, %g5 ! CP
#endif
#endif
	srlx	%g4, 13, %g4		! get rid of garbage in context field
	sllx	%g4, 13, %g4
	or	%g4, %g5, %g5
	add	%g5, %g1, %g5		! add partition base %g1 is zero
					! if we choose to skip the add
	mov	0x30, %g7
	stxa	%g4, [ %g7 ] 0x50	! {tag-access, data-in}

#ifdef CSM_ENABLE
immu_real_get_lsid:
    setx     0xba00000000, %g1, %g2
    ldx    [%g2], %g2            ! has coreid
    setx   0x8150040000, %g7, %g4
    setx   0x3fffffff, %g1, %g7
    and    %g2, %g7, %g2
    mov    %g0, %g1
immu_real_lsid_loop:
    srlx   %g1, 8, %g6    
    cmp    %g6, %g0
	tne	   %xcc, T_BAD_TRAP
    nop 

    and    %g1, 0x04, %g6
    cmp    %g6, %g0
    bne    %xcc, immu_real_lsid_odd
    nop
immu_real_lsid_even:
    add    %g1, 0x04, %g6
    ba     immu_real_cond_done
    nop
immu_real_lsid_odd:
    sub    %g1, 0x04, %g6
immu_real_cond_done:

    add    %g6, %g4, %g6 
    ld     [%g6], %g6
    and    %g6, %g7, %g6
    cmp    %g6, %g2
	bne	   %xcc, immu_real_lsid_loop
    add    %g1, 0x04, %g1    

    sub    %g1, 0x04, %g1    
    srlx   %g1, 2, %g1

    setx    CSM_CONFIG_REG, %g1, %g2
    or     %g2, %g1, %g2
    stxa    %g2, [ %g0 ] 0x0e   ! csm in
#endif

#ifndef SUN4V
	mov	0x200, %g6
#else
	mov	0x600, %g6
#endif

	stxa	%g5, [ %g6 ] 0x54
	retry 
