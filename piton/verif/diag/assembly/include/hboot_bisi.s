// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hboot_bisi.s
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
.global hboot_bisi
hboot_bisi:
	rd		%asr26, %g7
	set     0x1f00, %g1
	and		%g7, %g1, %g7
	srlx	%g7, 8, %g7

    setx     0xba00000000, %g3, %g2
    ld     [%g2], %g2            ! has coreid

    srlx    %g2, 8, %g3
    mulx    %g3, PTON_X_TILES, %g3
    and     %g2, 0xff, %g2
    add     %g2, %g3, %g2    

    !srlx    %g2, 5, %g3
    !add     %g3, %g2, %g2        ! translate from x,y coordinates to coreid
    !set     0x3f, %g3           ! get the lowest 6 bits
    !and     %g2, %g3, %g2

    sllx    %g2, 1, %g2
    add     %g7, %g2, %g7


	and		%g7, 0x1f, %g7	!%g7 = Global thread id (0..31)
	and		%g7, 0x1, %g6	!%g6 = Local thread id (0..1)
	srlx	%g7, 1, %g7
	and		%g7, 0xf, %g5	!%g5 = Core id (0..15)
	mov		%g5, %g7		!Save own core id in %g7
	brnz	%g6, skip_bisi	!not(Thread0)
	setx	0x9800000830, %g1, %g2
	ldx		[%g2], %g4		!%g4 = Core AVAIL
	mov		-1, %g3			!%g3 = First avilable core
find_fisrt_avail_core:
	inc		%g3
	and		%g4, 1, %g1
	brz		%g1, find_fisrt_avail_core
	srlx	%g4, 4, %g4
	cmp		%g3, %g5
#ifdef DO_L1_BISI
	bne		%xcc, start_l1_bisi	!not(First available core)
#else
	bne		%xcc, skip_bisi	!NOT (First available core)
#endif
	mov		%g3, %g6		!Save first available core in %g6
start_l2_bisi:
	setx	0xa800000000, %g1, %g3 !L2_TAG_BIST_REG
	mov		0x41, %g2 ! BISI_MODE = BIS(1), BISI_START = TRUE
	! L2 bank0
	stx		%g2, [%g3]
	! L2 bank1
	add		%g3, 64, %g3
	stx		%g2, [%g3]
	! L2 bank2
	add		%g3, 64, %g3
	stx		%g2, [%g3]
	! L2 bank3
	add		%g3, 64, %g3
	stx		%g2, [%g3]
#ifdef DO_L1_BISI
	!Start Thread0 of all available cores
	setx	0x9800000800, %g1, %g3	!INT_VEC_DIS
	setx	0x10001, %g1, %g2		!TYPE= 01, Core|Thread = 0, VEC = 1
form_bisi_mask:
	mov		0, %l0			!Formulate bisi_done mask in %l0
	mov		0x11, %l1
	sllx	%l1, %g5, %l2
	or		%l0, %l2, %l0	!bisi_done	mask for boot core/thread
avail_cores:
	cmp		%g5, 7
	bge		%xcc, start_l1_bisi
	inc		%g5
	and		%g4, 1, %g1
	brz		%g1, avail_cores
	srlx	%g4, 4, %g4
	sllx	%g5, 10, %g1
	or		%g2, %g1, %g1
	stx		%g1, [%g3]
	sllx	%l1, %g5, %l2
	or		%l0, %l2, %l0	!bisi_done mask for other cores/threads
	ba		avail_cores
	nop
start_l1_bisi:
	! Read from ASI_SPARC_BIST_CONTROL_REG
	ldxa	[%g0] 0x42, %g1
	mov		1, %g3
	sllx	%g3, 10, %g3
	and		%g1, %g3, %g1	!MBIST_DONE
	brnz	%g1, skip_bisi
	! Write to ASI_SPARC_BIST_CONTROL_REG
	mov		0x41, %g2 ! BISI_MODE = BIS(1), BISI_START = TRUE
	stxa	%g2, [%g0] 0x42
	cmp		%g6, %g7
	be		%xcc, check_bisi_done	!First available core
	!Halt if you are not the boot-thread
	mov		0x11, %g4
	setx	done_bisi_flag, %g1, %g3
	stb		%g4, [%g3 + %g7]
	rd		%asr26, %g1
	and		%g1, 1, %g1
	wr		%g1, 1, %asr26
check_bisi_done:
	setx	check_bisi_flag, %g1, %g3
	ldx		[%g3], %g2
	setx	done_bisi_flag, %g1, %g3
	mov		0x11, %g4
	stb		%g4, [%g3 + %g7]
wait_on_l1_bisi:
	cmp		%g2, %g4
	bne		%xcc, wait_on_l1_bisi
	ldx		[%g3], %g4
#endif
check_l2_bisi:
	cmp		%g6, %g7
	bne		%xcc, skip_bisi	!NOT (First available core)
	!Check L2 BISI completion
	setx	0xa800000000, %g1, %g3
#if !defined(DO_L2DATA_BISI) && !defined (DO_L1_BISI)
	mov		0, %g1
l2_bisi_dly:
	brnz	%g1, l2_bisi_dly
	dec		%g1
#endif
	mov		4, %g2
wait_on_l2_bisi:
#ifdef DO_L2DATA_BISI
	ldx		[%g3], %g1
	srlx	%g1, 10, %g1
	and		%g1, 1, %g1
	brz	 	%g1, wait_on_l2_bisi
	mov		0, %g1
#else
	stx		%g0, [%g3]
#endif
	dec		%g2
	brnz	%g2, wait_on_l2_bisi
	add		%g3, 64, %g3

skip_bisi:
#ifdef NO_SLAM_INIT_DRAMCTL
	setx dramctl_init, %g1, %g2
	jmp %g2
	nop
#else
	setx hboot_pton_init, %g1, %g2
	jmp %g2
	nop
#endif
