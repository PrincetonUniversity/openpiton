// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hboot_init.s
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
! This file contains init that is required to
! clear out x's and valid bits in various structures
! to make silicon work.

! For portable core diags, allow all the threads to run the same
! code sequenc, otherwise only the boot-thread will do the L2$
! VUAD array initialization and other threads will skip it.

#ifndef PORTABLE_CORE
	rd		%asr26, %g7
	set     0x1f00, %g1
	and		%g7, %g1, %g7
	srlx	%g7, 8, %g7
	and		%g7, 0x3, %g6	!%g6 = Local thread id (0..3)
	!srlx	%g7, 2, %g7
	!and		%g7, 0x7, %g5	!%g5 = Core id (0..7)

    setx     0xba00000000, %g3, %g2
    ld      [%g2], %g2            ! has coreid

    srlx    %g2, 8, %g3
    mulx    %g3, PTON_X_TILES, %g3
    and     %g2, 0xff, %g2
    add     %g2, %g3, %g5    

    !srlx    %g2, 5, %g3
    !add     %g3, %g2, %g2        ! translate from x,y coordinates to coreid
    !set     0x3f, %g3           ! get the lowest 6 bits
    !and     %g2, %g3, %g5       !%g5 = Core id (0..7)



	brnz	%g6, skip_cache_tlb_init	!not(Thread0)
	setx	0x9800000830, %g1, %g2
	ldx		[%g2], %g4		!%g4 = Core AVAIL
	mov		-1, %g3			!%g3 = First avilable core
fisrt_avail_core:
	inc		%g3
	and		%g4, 1, %g1
	brz		%g1, fisrt_avail_core
	srlx	%g4, 4, %g4
	cmp		%g3, %g5
	bne		%xcc, skip_l2_init	!not(First available core)
#endif

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! Clear L2 vuad & Tags
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#if	!defined(HW_BISI) && !defined(ENABLE_BISI)
	setx    0xa600000000, %g1, %g2
	setx    0xa600400000, %g1, %g3
	mov		0xfff, %g4
	sllx	%g4, 6, %g4
	mov		0x1, %g1
	sllx	%g1, 6, %g1
clear_l2_vuad:
	stx     %g0, [%g2 + %g4]
	stx     %g0, [%g3 + %g4]
	brnz	%g4, clear_l2_vuad
	sub		%g4, %g1, %g4

!	setx    0xa400000000, %g1, %g2
!	set		0xbfff, %g4
!	sllx	%g4, 6, %g4
!	mov		0x1, %g1
!	sllx	%g1, 6, %g1
!clear_l2_tag:
!	stx     %g0, [%g2 + %g4]
!	brnz	%g4, clear_l2_tag
!	sub		%g4, %g1, %g4
#endif
skip_l2_init:
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Clear icache/dcache valid
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
clear_l1_tag:
	mov	0x3, %g1
	sllx	%g1, 16, %g1
	mov	0x1, %g3
	sllx	%g3, 16, %g3
icache_init_loop1:
	mov	0x7f, %g2
	sllx	%g2, 6, %g2
icache_init_loop2:
	stxa	%g0, [%g1+%g2] 0x67	! ASI_ICACHE_TAG
	brnz	%g2, icache_init_loop2
	sub	%g2, 0x40, %g2
	brnz	%g1, icache_init_loop1
	sub	%g1, %g3, %g1
	mov	0x1ff, %g1
	sllx	%g1, 4, %g1
dcache_init_loop:
	stxa	%g0, [%g0+%g1] 0x47	! ASI_DCACHE_TAG
	brnz	%g1, dcache_init_loop
	sub	%g1, 0x10, %g1

	!! ** Enabling the L1$ is done later ** !!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Clear itlb/dtlb valid
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	stxa	%g0, [%g0] 0x60		! ASI_ITLB_INVALIDATE_ALL
	mov	0x8, %g1
	stxa	%g0, [%g0 + %g1] 0x60	! ASI_DTLB_INVALIDATE_ALL
skip_cache_tlb_init:
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Clear all integer registers in all windows and
! GL to prevent ECC error
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	wrpr	%g0, 0, %gl
	mov	%g0, %g1
	mov	%g0, %g2
	mov	%g0, %g3
	mov	%g0, %g4
	mov	%g0, %g5
	mov	%g0, %g6
	mov	%g0, %g7

	wrpr	%g0, 1, %gl
	mov	%g0, %g1
	mov	%g0, %g2
	mov	%g0, %g3
	mov	%g0, %g4
	mov	%g0, %g5
	mov	%g0, %g6
	mov	%g0, %g7

	wrpr	%g0, 2, %gl
	mov	%g0, %g1
	mov	%g0, %g2
	mov	%g0, %g3
	mov	%g0, %g4
	mov	%g0, %g5
	mov	%g0, %g6
	mov	%g0, %g7

	wrpr	%g0, 3, %gl
	mov	%g0, %g1
	mov	%g0, %g2
	mov	%g0, %g3
	mov	%g0, %g4
	mov	%g0, %g5
	mov	%g0, %g6
	mov	%g0, %g7


	mov	%g0, %r24
	mov	%g0, %r25
	mov	%g0, %r26
	mov	%g0, %r27
	mov	%g0, %r28
	mov	%g0, %r29
	mov	%g0, %r30
	mov	%g0, %r31

	! get maxwin
!	rdhpr	%ver, %g1
	.word	0x83498000
	sllx	%g1, 59, %g1
	srlx	%g1, 59, %g1
reg_init_loop:
	wrpr	%g1, %cwp
	mov	%g0, %r8
	mov	%g0, %r9
	mov	%g0, %r10
	mov	%g0, %r11
	mov	%g0, %r12
	mov	%g0, %r13
	mov	%g0, %r14
	mov	%g0, %r15
	mov	%g0, %r16
	mov	%g0, %r17
	mov	%g0, %r18
	mov	%g0, %r19
	mov	%g0, %r20
	mov	%g0, %r21
	mov	%g0, %r22
	mov	%g0, %r23
	brnz	%g1, reg_init_loop
	sub	%g1, 1, %g1

	wrpr	%g0, %cwp
! FPU
        wr      %g0,0x04,%fprs

        setx    fpu_init_data,%g1,%g2
        ld      [%g2], %f0
        ld      [%g2], %f1
        fmovd   %f0,%f2
        fmovd   %f0,%f4
        fmovd   %f0,%f6
        fmovd   %f0,%f8
        fmovd   %f0,%f10
        fmovd   %f0,%f12
        fmovd   %f0,%f14
        fmovd   %f0,%f16
        fmovd   %f0,%f18
        fmovd   %f0,%f20
        fmovd   %f0,%f22
        fmovd   %f0,%f24
        fmovd   %f0,%f26
        fmovd   %f0,%f28
        fmovd   %f0,%f30
        fmovd   %f0,%f32
        fmovd   %f0,%f34
        fmovd   %f0,%f36
        fmovd   %f0,%f38
        fmovd   %f0,%f40
        fmovd   %f0,%f42
        fmovd   %f0,%f44
        fmovd   %f0,%f46
        fmovd   %f0,%f48
        fmovd   %f0,%f50
        fmovd   %f0,%f52
        fmovd   %f0,%f54
        fmovd   %f0,%f56
        fmovd   %f0,%f58
        fmovd   %f0,%f60
        fmovd   %f0,%f62

        wr      %g0,0x00,%fprs

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! SPU?
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
