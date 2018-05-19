// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic4_usr_mode_sas2_mul_core_rand_1.s
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
/*
********************************************************************************
   random seed:	744892736
   Jal pio_rnd_basic4_usr_mode_sas2_mul_core.j:	
********************************************************************************/



#define JBI_CONFIG
#define ASI_SWVR_INTR_RECEIVE		0x72
#define ASI_SWVR_UDB_INTR_W		0x73
#define ASI_SWVR_UDB_INTR_R		0x74

#define H_T0_Trap_Instruction_0	
#define My_T0_Trap_Instruction_0	\
	ta	0x90;			\
	done;

#define H_HT0_HTrap_Instruction_0 intr0x190_custom_trap
#define H_HT0_Interrupt_0x60      intr0x60_custom_trap

#define H_HT0_Data_Access_Exception_0x30 My_0x30_trap

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:

! Register init code

	setx 0x28c00cc6e3bd0182, %g1, %g0
	setx 0x7ff4a3ace39e4e1d, %g1, %g1
	setx 0x8122894ccf6d85b1, %g1, %g2
	setx 0x1ed27500ac350578, %g1, %g3
	setx 0xf9f4aa60eadb159b, %g1, %g4
	setx 0x2aadea1e8c647bf7, %g1, %g5
	setx 0x1c1f530da14871ca, %g1, %g6
	setx 0x2b7fee28ecf7d8de, %g1, %g7
	setx 0x027f5c1c388fa2ba, %g1, %r16
	setx 0x607f773057de9af9, %g1, %r17
	setx 0x6eb5abb1ffaa207c, %g1, %r18
	setx 0xf4c91d05edd52e4e, %g1, %r19
	setx 0x3f18ad547d08948e, %g1, %r20
	setx 0xc50e1613dc5db193, %g1, %r21
	setx 0xd21c67a52dc409ad, %g1, %r22
	setx 0x2178b211a1539446, %g1, %r23
	setx 0xa7e1a61172a42e5c, %g1, %r24
	setx 0xb29336782108cfef, %g1, %r25
	setx 0x7b0107676a1be248, %g1, %r26
	setx 0x1b2c883a77195cd6, %g1, %r27
	setx 0x363a22aa6e8bd03c, %g1, %r28
	setx 0x214a6e929a59bad9, %g1, %r29
	setx 0xc8d1a3081ba08560, %g1, %r30
	setx 0xf37c06b441e7f043, %g1, %r31
	save
	setx 0x9c20f9e313382408, %g1, %r16
	setx 0x50c967cae6b938a1, %g1, %r17
	setx 0x84588ac6a2039d17, %g1, %r18
	setx 0xdb25fa42317ee855, %g1, %r19
	setx 0x958cde021b68a97f, %g1, %r20
	setx 0x5165b68821b3544e, %g1, %r21
	setx 0x285fe77dbff654a0, %g1, %r22
	setx 0x3d9cc5528fb551af, %g1, %r23
	setx 0xfe128814899e8fe5, %g1, %r24
	setx 0x3ea5a8316472f2b5, %g1, %r25
	setx 0xc2026d624494b5d7, %g1, %r26
	setx 0xb3962263bb41efd9, %g1, %r27
	setx 0xb7b59122ec7c93e7, %g1, %r28
	setx 0x7162d69f75b2afec, %g1, %r29
	setx 0xbbbd20f7c17f3d19, %g1, %r30
	setx 0x66816b21c885a8ca, %g1, %r31
	save
	setx 0x974fdf3b0a1032c1, %g1, %r16
	setx 0xb9716a7932a0d5b4, %g1, %r17
	setx 0xa7f374a99b108953, %g1, %r18
	setx 0x83297d06161dadab, %g1, %r19
	setx 0x2ea0a4f56036acd7, %g1, %r20
	setx 0x09d4865e5bd3d78c, %g1, %r21
	setx 0xbeba8c902babed0e, %g1, %r22
	setx 0xa14bd8c6e1e3f996, %g1, %r23
	setx 0x379004c88ba315bd, %g1, %r24
	setx 0x5b77e01b9f9fb018, %g1, %r25
	setx 0xee76805a71305210, %g1, %r26
	setx 0x9c23197af2d3b777, %g1, %r27
	setx 0x4979efe3c9cb8271, %g1, %r28
	setx 0x702d5def4ea04f84, %g1, %r29
	setx 0xc95d349ff1d20ef2, %g1, %r30
	setx 0x0340281d928a5221, %g1, %r31
	restore
	mov	0, %r8
	ta	0x30
	mov	0,%g4 
	setx	ncdata_base0, %g1, %g2 
	setx	0x1000, %g1, %g3 
	add	%g2, %g3, %g3 
	! initalize
	setx    ncdata_base1, %l0, %l2
	setx    0x1000, %l0, %l3
	add     %l2, %l3, %g3
	setx 0x7766554433221100, %g1, %g2
	add 0x0, %g0, %g4
	!add 0x0, %g0, %g2
	add 0x020, %g0, %g5
	!setx 0x800e000000, %g1, %g3
	stloop0:
	stx %g2, [%g3 + %g4]
	inc %g2
	add 0x8, %g4, %g4
	deccc %g5
	bne stloop0
	nop
	! initalize
	setx    user_data_start, %l0, %l2
	setx    0x1000, %l0, %l3
	add     %l2, %l3, %g3
	add 0x0, %g0, %g4
	add 0x040, %g0, %g5
	dstloop6:
	stx %g2, [%g3 + %g4]
	inc %g2
	add 0x8, %g4, %g4
	deccc %g5
	bne dstloop6
	nop
	! initalize
	setx    ncdata_base0, %l0, %l2
	setx    0x1000, %l0, %l3
	add     %l2, %l3, %g3
	add 0x0, %g0, %g4
	!add 0x1, %g0, %g2
	add 0x040, %g0, %g5
	! FAKE DMA space
	!setx 0x8010000000, %g1, %g3
	stloop1:
	stx %g2, [%g3 + %g4]
	inc %g2
	add 0x8, %g4, %g4
	deccc %g5
	bne stloop1
	nop
	! initalize
	setx    ncdata_base2, %l0, %l2
	setx    0x1000, %l0, %l3
	add     %l2, %l3, %g3
	add 0x0, %g0, %g4
	!add 0x1, %g2, %g2
	add 0x040, %g0, %g5
	!setx 0x800f000000, %g1, %g3
	stloop2:
	stx %g2, [%g3 + %g4]
	inc %g2
	add 0x8, %g4, %g4
	deccc %g5
	bne stloop2
	nop
	! initalize
	setx    ncdata_base3, %l0, %l2
	setx    0x1000, %l0, %l3
	add     %l2, %l3, %g3
	add 0x0, %g0, %g4
	!add 0x1, %g2, %g2
	add 0x040, %g0, %g5
	!setx 0xc000000000, %g1, %g3
	stloop3:
	stx %g2, [%g3 + %g4]
	inc %g2
	add 0x8, %g4, %g4
	deccc %g5
	bne stloop3
	nop
	! initalize
	setx    ncdata_base4, %l0, %l2
	setx    0x1000, %l0, %l3
	add     %l2, %l3, %g3
	add 0x0, %g0, %g4
	!add 0x1, %g2, %g2
	add 0x040, %g0, %g5
	!setx 0xd000000000, %g1, %g3
	stloop4:
	stx %g2, [%g3 + %g4]
	inc %g2
	add 0x8, %g4, %g4
	deccc %g5
	bne stloop4
	nop
	! initalize
	setx    ncdata_base5, %l0, %l2
	setx    0x1000, %l0, %l3
	add     %l2, %l3, %g3
	add 0x0, %g0, %g4
	!add 0x1, %g2, %g2
	add 0x040, %g0, %g5
	!setx 0xe000000000, %g1, %g3
	stloop5:
	stx %g2, [%g3 + %g4]
	inc %g2
	add 0x8, %g4, %g4
	deccc %g5
	bne stloop5
	nop
	! initalize
	setx    ncdata_base6, %l0, %l2
	setx    0x1000, %l0, %l3
	add     %l2, %l3, %g3
	add 0x0, %g0, %g4
	!add 0x1, %g2, %g2
	add 0x040, %g0, %g5
	!setx 0xf000000000, %g1, %g3
	stloop6:
	stx %g2, [%g3 + %g4]
	inc %g2
	add 0x8, %g4, %g4
	deccc %g5
	bne stloop6
	nop
	membar 0x40
	wr    %g0, 7, %fprs
	ldda [%g3]ASI_BLK_P, %f0
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d02ef080, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d04ef140, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	ta	%icc, T_RD_THID
! fork: source strm = 0xffffffff; target strm = 0x1
	cmp	%o1, 0
	setx	fork_lbl_0_1, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x2
	cmp	%o1, 1
	setx	fork_lbl_0_2, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x4
	cmp	%o1, 2
	setx	fork_lbl_0_3, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x8
	cmp	%o1, 3
	setx	fork_lbl_0_4, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x10
	cmp	%o1, 4
	setx	fork_lbl_0_5, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x20
	cmp	%o1, 5
	setx	fork_lbl_0_6, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x40
	cmp	%o1, 6
	setx	fork_lbl_0_7, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x80
	cmp	%o1, 7
	setx	fork_lbl_0_8, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x100
	cmp	%o1, 8
	setx	fork_lbl_0_9, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x200
	cmp	%o1, 9
	setx	fork_lbl_0_10, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x400
	cmp	%o1, 10
	setx	fork_lbl_0_11, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x800
	cmp	%o1, 11
	setx	fork_lbl_0_12, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x1000
	cmp	%o1, 12
	setx	fork_lbl_0_13, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x2000
	cmp	%o1, 13
	setx	fork_lbl_0_14, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x4000
	cmp	%o1, 14
	setx	fork_lbl_0_15, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x8000
	cmp	%o1, 15
	setx	fork_lbl_0_16, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x10000
	cmp	%o1, 16
	setx	fork_lbl_0_17, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x20000
	cmp	%o1, 17
	setx	fork_lbl_0_18, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x40000
	cmp	%o1, 18
	setx	fork_lbl_0_19, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x80000
	cmp	%o1, 19
	setx	fork_lbl_0_20, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x100000
	cmp	%o1, 20
	setx	fork_lbl_0_21, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x200000
	cmp	%o1, 21
	setx	fork_lbl_0_22, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x400000
	cmp	%o1, 22
	setx	fork_lbl_0_23, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x800000
	cmp	%o1, 23
	setx	fork_lbl_0_24, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x1000000
	cmp	%o1, 24
	setx	fork_lbl_0_25, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x2000000
	cmp	%o1, 25
	setx	fork_lbl_0_26, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x4000000
	cmp	%o1, 26
	setx	fork_lbl_0_27, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x8000000
	cmp	%o1, 27
	setx	fork_lbl_0_28, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x10000000
	cmp	%o1, 28
	setx	fork_lbl_0_29, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x20000000
	cmp	%o1, 29
	setx	fork_lbl_0_30, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x40000000
	cmp	%o1, 30
	setx	fork_lbl_0_31, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x80000000
	cmp	%o1, 31
	setx	fork_lbl_0_32, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_32:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe071a020  ! 5: STX_I	stx	%r16, [%r6 + 0x0020]
	.word 0xec718008  ! 7: STX_R	stx	%r22, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec218008  ! 9: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe01b6030  ! 10: LDD_I	ldd	[%r13 + 0x0030], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe829e020  ! 12: STB_I	stb	%r20, [%r7 + 0x0020]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4036000  ! 15: LDUW_I	lduw	[%r13 + 0x0000], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe072e008  ! 17: STX_I	stx	%r16, [%r11 + 0x0008]
	.word 0xe833a018  ! 18: STH_I	sth	%r20, [%r14 + 0x0018]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe472c008  ! 20: STX_R	stx	%r18, [%r11 + %r8]
	.word 0xe819a020  ! 21: LDD_I	ldd	[%r6 + 0x0020], %r20
	.word 0xe0336008  ! 22: STH_I	sth	%r16, [%r13 + 0x0008]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe03ae000  ! 24: STD_I	std	%r16, [%r11 + 0x0000]
	.word 0xe44b6020  ! 25: LDSB_I	ldsb	[%r13 + 0x0020], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0098008  ! 27: LDUB_R	ldub	[%r6 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8730008  ! 31: STX_R	stx	%r20, [%r12 + %r8]
	.word 0xe84ac008  ! 33: LDSB_R	ldsb	[%r11 + %r8], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00ae020  ! 36: LDUB_I	ldub	[%r11 + 0x0020], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe839c008  ! 38: STD_R	std	%r20, [%r7 + %r8]
	.word 0xe071c008  ! 39: STX_R	stx	%r16, [%r7 + %r8]
	setx	0x00000000d02ef1c0, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d04ef100, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d06ef000, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec3ac008  ! 44: STD_R	std	%r22, [%r11 + %r8]
	.word 0xe0018008  ! 45: LDUW_R	lduw	[%r6 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2a8008  ! 49: STB_R	stb	%r22, [%r10 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0230008  ! 56: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xe039a030  ! 57: STD_I	std	%r16, [%r6 + 0x0030]
	.word 0xe439e030  ! 58: STD_I	std	%r18, [%r7 + 0x0030]
	.word 0xec51c008  ! 59: LDSH_R	ldsh	[%r7 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec1ae000  ! 61: LDD_I	ldd	[%r11 + 0x0000], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8536030  ! 63: LDSH_I	ldsh	[%r13 + 0x0030], %r20
	.word 0xe431c008  ! 64: STH_R	sth	%r18, [%r7 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8098008  ! 67: LDUB_R	ldub	[%r6 + %r8], %r20
	.word 0xe82ae020  ! 68: STB_I	stb	%r20, [%r11 + 0x0020]
	.word 0xec538008  ! 69: LDSH_R	ldsh	[%r14 + %r8], %r22
	.word 0xe029c008  ! 70: STB_R	stb	%r16, [%r7 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83ae008  ! 72: STD_I	std	%r20, [%r11 + 0x0008]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4036010  ! 78: LDUW_I	lduw	[%r13 + 0x0010], %r18
	.word 0xe8536028  ! 79: LDSH_I	ldsh	[%r13 + 0x0028], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe811a020  ! 81: LDUH_I	lduh	[%r6 + 0x0020], %r20
	.word 0xe421a018  ! 82: STW_I	stw	%r18, [%r6 + 0x0018]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe8736020  ! 86: STX_I	stx	%r20, [%r13 + 0x0020]
	.word 0xe851c008  ! 87: LDSH_R	ldsh	[%r7 + %r8], %r20
	.word 0xe0598008  ! 88: LDX_R	ldx	[%r6 + %r8], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8330008  ! 92: STH_R	sth	%r20, [%r12 + %r8]
	.word 0xe02ae038  ! 93: STB_I	stb	%r16, [%r11 + 0x0038]
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d08e1140, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8218008  ! 96: STW_R	stw	%r20, [%r6 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42a8008  ! 98: STB_R	stb	%r18, [%r10 + %r8]
	.word 0xa0b30008  ! 99: SUBCcc_R	orncc 	%r12, %r8, %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec734008  ! 102: STX_R	stx	%r22, [%r13 + %r8]
	.word 0xe00b4008  ! 103: LDUB_R	ldub	[%r13 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8518008  ! 108: LDSH_R	ldsh	[%r6 + %r8], %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa01b4008  ! 110: XOR_R	xor 	%r13, %r8, %r16
	.word 0xec59a038  ! 111: LDX_I	ldx	[%r6 + 0x0038], %r22
	.word 0xa0b98008  ! 112: XNORcc_R	xnorcc 	%r6, %r8, %r16
	.word 0xe049e008  ! 113: LDSB_I	ldsb	[%r7 + 0x0008], %r16
	.word 0xe039c008  ! 114: STD_R	std	%r16, [%r7 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0218008  ! 120: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe81a8008  ! 121: LDD_R	ldd	[%r10 + %r8], %r20
	.word 0xe029e000  ! 122: STB_I	stb	%r16, [%r7 + 0x0000]
	.word 0xe029c008  ! 123: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe422c008  ! 124: STW_R	stw	%r18, [%r11 + %r8]
	.word 0xe8298008  ! 125: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xe4236008  ! 126: STW_I	stw	%r18, [%r13 + 0x0008]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00aa038  ! 131: LDUB_I	ldub	[%r10 + 0x0038], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e11c0, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e1100, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01aa030  ! 137: LDD_I	ldd	[%r10 + 0x0030], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe071c008  ! 140: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xec432000  ! 141: LDSW_I	ldsw	[%r12 + 0x0000], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xac31e028  ! 147: SUBC_I	orn 	%r7, 0x0028, %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe812c008  ! 149: LDUH_R	lduh	[%r11 + %r8], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe4398008  ! 151: STD_R	std	%r18, [%r6 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec538008  ! 156: LDSH_R	ldsh	[%r14 + %r8], %r22
	.word 0xe45a8008  ! 157: LDX_R	ldx	[%r10 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe471a028  ! 159: STX_I	stx	%r18, [%r6 + 0x0028]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec718008  ! 163: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe0518008  ! 165: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe8718008  ! 166: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe801e038  ! 167: LDUW_I	lduw	[%r7 + 0x0038], %r20
	.word 0xe071a008  ! 168: STX_I	stx	%r16, [%r6 + 0x0008]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0398008  ! 171: STD_R	std	%r16, [%r6 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8132030  ! 173: LDUH_I	lduh	[%r12 + 0x0030], %r20
	.word 0xe02b2030  ! 174: STB_I	stb	%r16, [%r12 + 0x0030]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe0336020  ! 178: STH_I	sth	%r16, [%r13 + 0x0020]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe449a018  ! 181: LDSB_I	ldsb	[%r6 + 0x0018], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe453a030  ! 185: LDSH_I	ldsh	[%r14 + 0x0030], %r18
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec5b4008  ! 187: LDX_R	ldx	[%r13 + %r8], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0318008  ! 189: STH_R	sth	%r16, [%r6 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec5ae000  ! 191: LDX_I	ldx	[%r11 + 0x0000], %r22
	.word 0xe41b0008  ! 192: LDD_R	ldd	[%r12 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec236010  ! 194: STW_I	stw	%r22, [%r13 + 0x0010]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0128008  ! 198: LDUH_R	lduh	[%r10 + %r8], %r16
	.word 0xe051c008  ! 199: LDSH_R	ldsh	[%r7 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe439e000  ! 202: STD_I	std	%r18, [%r7 + 0x0000]
	.word 0xe02b0008  ! 203: STB_R	stb	%r16, [%r12 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe4236010  ! 207: STW_I	stw	%r18, [%r13 + 0x0010]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe072a000  ! 209: STX_I	stx	%r16, [%r10 + 0x0000]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05b0008  ! 211: LDX_R	ldx	[%r12 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec398008  ! 214: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe472e020  ! 215: STX_I	stx	%r18, [%r11 + 0x0020]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0098008  ! 218: LDUB_R	ldub	[%r6 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4038008  ! 220: LDUW_R	lduw	[%r14 + %r8], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0736000  ! 223: STX_I	stx	%r16, [%r13 + 0x0000]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec398008  ! 225: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe049c008  ! 226: LDSB_R	ldsb	[%r7 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe072e010  ! 228: STX_I	stx	%r16, [%r11 + 0x0010]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83a8008  ! 231: STD_R	std	%r20, [%r10 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe80b8008  ! 233: LDUB_R	ldub	[%r14 + %r8], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe85b0008  ! 235: LDX_R	ldx	[%r12 + %r8], %r20
	.word 0xe4198008  ! 236: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xe829a038  ! 237: STB_I	stb	%r20, [%r6 + 0x0038]
	.word 0xec52a028  ! 238: LDSH_I	ldsh	[%r10 + 0x0028], %r22
	.word 0xe02b4008  ! 239: STB_R	stb	%r16, [%r13 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2ae000  ! 243: STB_I	stb	%r22, [%r11 + 0x0000]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee040, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec19e008  ! 249: LDD_I	ldd	[%r7 + 0x0008], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec5b8008  ! 251: LDX_R	ldx	[%r14 + %r8], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec218008  ! 255: STW_R	stw	%r22, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec218008  ! 259: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xec71a020  ! 260: STX_I	stx	%r22, [%r6 + 0x0020]
	.word 0xe459a000  ! 261: LDX_I	ldx	[%r6 + 0x0000], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0718008  ! 264: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xa0c30008  ! 265: ADDCcc_R	addccc 	%r12, %r8, %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe83b6000  ! 268: STD_I	std	%r20, [%r13 + 0x0000]
	.word 0xe0328008  ! 269: STH_R	sth	%r16, [%r10 + %r8]
	setx	0x00000000d01ee000, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef100, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d06ef140, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8198008  ! 272: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xe80ba008  ! 273: LDUB_I	ldub	[%r14 + 0x0008], %r20
	.word 0xe0732030  ! 274: STX_I	stx	%r16, [%r12 + 0x0030]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe852a010  ! 277: LDSH_I	ldsh	[%r10 + 0x0010], %r20
	setx	0x00000000d01ee100, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8336008  ! 280: STH_I	sth	%r20, [%r13 + 0x0008]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe42ac008  ! 283: STB_R	stb	%r18, [%r11 + %r8]
	.word 0xe4598008  ! 284: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xec72c008  ! 285: STX_R	stx	%r22, [%r11 + %r8]
	.word 0xe4038008  ! 286: LDUW_R	lduw	[%r14 + %r8], %r18
	.word 0xec332020  ! 287: STH_I	sth	%r22, [%r12 + 0x0020]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0238008  ! 289: STW_R	stw	%r16, [%r14 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0336010  ! 293: SUBC_I	orn 	%r13, 0x0010, %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4498008  ! 296: LDSB_R	ldsb	[%r6 + %r8], %r18
	.word 0xe001a018  ! 297: LDUW_I	lduw	[%r6 + 0x0018], %r16
	.word 0xe85a8008  ! 298: LDX_R	ldx	[%r10 + %r8], %r20
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_31:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe022a010  ! 5: STW_I	stw	%r16, [%r10 + 0x0010]
	.word 0xe8736010  ! 7: STX_I	stx	%r20, [%r13 + 0x0010]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec298008  ! 9: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe441a010  ! 10: LDSW_I	ldsw	[%r6 + 0x0010], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec736018  ! 12: STX_I	stx	%r22, [%r13 + 0x0018]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4038008  ! 15: LDUW_R	lduw	[%r14 + %r8], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8218008  ! 17: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xe031a038  ! 18: STH_I	sth	%r16, [%r6 + 0x0038]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec2b8008  ! 20: STB_R	stb	%r22, [%r14 + %r8]
	.word 0xe042c008  ! 21: LDSW_R	ldsw	[%r11 + %r8], %r16
	.word 0xe822c008  ! 22: STW_R	stw	%r20, [%r11 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec31c008  ! 24: STH_R	sth	%r22, [%r7 + %r8]
	.word 0xe45a8008  ! 25: LDX_R	ldx	[%r10 + %r8], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4028008  ! 27: LDUW_R	lduw	[%r10 + %r8], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4734008  ! 31: STX_R	stx	%r18, [%r13 + %r8]
	.word 0xe80ae010  ! 33: LDUB_I	ldub	[%r11 + 0x0010], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec19a008  ! 36: LDD_I	ldd	[%r6 + 0x0008], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0236038  ! 38: STW_I	stw	%r16, [%r13 + 0x0038]
	.word 0xec23a020  ! 39: STW_I	stw	%r22, [%r14 + 0x0020]
	setx	0x00000000d02ef080, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d04ef180, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d06ef0c0, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021e020  ! 44: STW_I	stw	%r16, [%r7 + 0x0020]
	.word 0xe059e008  ! 45: LDX_I	ldx	[%r7 + 0x0008], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0730008  ! 49: STX_R	stx	%r16, [%r12 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe031a020  ! 56: STH_I	sth	%r16, [%r6 + 0x0020]
	.word 0xec29a000  ! 57: STB_I	stb	%r22, [%r6 + 0x0000]
	.word 0xec2b8008  ! 58: STB_R	stb	%r22, [%r14 + %r8]
	.word 0xe052a020  ! 59: LDSH_I	ldsh	[%r10 + 0x0020], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec4a8008  ! 61: LDSB_R	ldsb	[%r10 + %r8], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe44b2028  ! 63: LDSB_I	ldsb	[%r12 + 0x0028], %r18
	.word 0xe02aa030  ! 64: STB_I	stb	%r16, [%r10 + 0x0030]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe80b6038  ! 67: LDUB_I	ldub	[%r13 + 0x0038], %r20
	.word 0xe0238008  ! 68: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe85b0008  ! 69: LDX_R	ldx	[%r12 + %r8], %r20
	.word 0xe42b8008  ! 70: STB_R	stb	%r18, [%r14 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029a030  ! 72: STB_I	stb	%r16, [%r6 + 0x0030]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe451a000  ! 78: LDSH_I	ldsh	[%r6 + 0x0000], %r18
	.word 0xe801e038  ! 79: LDUW_I	lduw	[%r7 + 0x0038], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe013a000  ! 81: LDUH_I	lduh	[%r14 + 0x0000], %r16
	.word 0xe02b4008  ! 82: STB_R	stb	%r16, [%r13 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0718008  ! 86: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe00a8008  ! 87: LDUB_R	ldub	[%r10 + %r8], %r16
	.word 0xec118008  ! 88: LDUH_R	lduh	[%r6 + %r8], %r22
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029e030  ! 92: STB_I	stb	%r16, [%r7 + 0x0030]
	.word 0xe431a008  ! 93: STH_I	sth	%r18, [%r6 + 0x0008]
	setx	0x00000000d08e1140, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e1180, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021e028  ! 96: STW_I	stw	%r16, [%r7 + 0x0028]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec32e000  ! 98: STH_I	sth	%r22, [%r11 + 0x0000]
	.word 0xac8b0008  ! 99: ANDcc_R	andcc 	%r12, %r8, %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe83ac008  ! 102: STD_R	std	%r20, [%r11 + %r8]
	.word 0xec0ae018  ! 103: LDUB_I	ldub	[%r11 + 0x0018], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe009a010  ! 108: LDUB_I	ldub	[%r6 + 0x0010], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa4a9c008  ! 110: ANDNcc_R	andncc 	%r7, %r8, %r18
	.word 0xe819a030  ! 111: LDD_I	ldd	[%r6 + 0x0030], %r20
	.word 0xa012c008  ! 112: OR_R	or 	%r11, %r8, %r16
	.word 0xe042c008  ! 113: LDSW_R	ldsw	[%r11 + %r8], %r16
	.word 0xe8738008  ! 114: STX_R	stx	%r20, [%r14 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029a008  ! 120: STB_I	stb	%r16, [%r6 + 0x0008]
	.word 0xe0598008  ! 121: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe422c008  ! 122: STW_R	stw	%r18, [%r11 + %r8]
	.word 0xe4332030  ! 123: STH_I	sth	%r18, [%r12 + 0x0030]
	.word 0xe8398008  ! 124: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe0298008  ! 125: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe022c008  ! 126: STW_R	stw	%r16, [%r11 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec438008  ! 131: LDSW_R	ldsw	[%r14 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e1180, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d08e1180, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe842c008  ! 137: LDSW_R	ldsw	[%r11 + %r8], %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec234008  ! 140: STW_R	stw	%r22, [%r13 + %r8]
	.word 0xe011c008  ! 141: LDUH_R	lduh	[%r7 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa82ba010  ! 147: ANDN_I	andn 	%r14, 0x0010, %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe012e018  ! 149: LDUH_I	lduh	[%r11 + 0x0018], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec3b0008  ! 151: STD_R	std	%r22, [%r12 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe459a010  ! 156: LDX_I	ldx	[%r6 + 0x0010], %r18
	.word 0xec0ae000  ! 157: LDUB_I	ldub	[%r11 + 0x0000], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe829a030  ! 159: STB_I	stb	%r20, [%r6 + 0x0030]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe83b0008  ! 163: STD_R	std	%r20, [%r12 + %r8]
	.word 0xe0034008  ! 165: LDUW_R	lduw	[%r13 + %r8], %r16
	.word 0xe873a030  ! 166: STX_I	stx	%r20, [%r14 + 0x0030]
	.word 0xe049a018  ! 167: LDSB_I	ldsb	[%r6 + 0x0018], %r16
	.word 0xec3b4008  ! 168: STD_R	std	%r22, [%r13 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec718008  ! 171: STX_R	stx	%r22, [%r6 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe452e038  ! 173: LDSH_I	ldsh	[%r11 + 0x0038], %r18
	.word 0xec31e030  ! 174: STH_I	sth	%r22, [%r7 + 0x0030]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe02ba018  ! 178: STB_I	stb	%r16, [%r14 + 0x0018]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe009a028  ! 181: LDUB_I	ldub	[%r6 + 0x0028], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec51c008  ! 185: LDSH_R	ldsh	[%r7 + %r8], %r22
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec4ae030  ! 187: LDSB_I	ldsb	[%r11 + 0x0030], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe022a008  ! 189: STW_I	stw	%r16, [%r10 + 0x0008]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0434008  ! 191: LDSW_R	ldsw	[%r13 + %r8], %r16
	.word 0xe013a038  ! 192: LDUH_I	lduh	[%r14 + 0x0038], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8318008  ! 194: STH_R	sth	%r20, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe001a028  ! 198: LDUW_I	lduw	[%r6 + 0x0028], %r16
	.word 0xe049c008  ! 199: LDSB_R	ldsb	[%r7 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe82aa028  ! 202: STB_I	stb	%r20, [%r10 + 0x0028]
	.word 0xe83b4008  ! 203: STD_R	std	%r20, [%r13 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec218008  ! 207: STW_R	stw	%r22, [%r6 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe4718008  ! 209: STX_R	stx	%r18, [%r6 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe011a038  ! 211: LDUH_I	lduh	[%r6 + 0x0038], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0238008  ! 214: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe4718008  ! 215: STX_R	stx	%r18, [%r6 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe442a018  ! 218: LDSW_I	ldsw	[%r10 + 0x0018], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe85aa038  ! 220: LDX_I	ldx	[%r10 + 0x0038], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec29a030  ! 223: STB_I	stb	%r22, [%r6 + 0x0030]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec398008  ! 225: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe411a030  ! 226: LDUH_I	lduh	[%r6 + 0x0030], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0318008  ! 228: STH_R	sth	%r16, [%r6 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0734008  ! 231: STX_R	stx	%r16, [%r13 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec536010  ! 233: LDSH_I	ldsh	[%r13 + 0x0010], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe441e008  ! 235: LDSW_I	ldsw	[%r7 + 0x0008], %r18
	.word 0xec59a010  ! 236: LDX_I	ldx	[%r6 + 0x0010], %r22
	.word 0xe0718008  ! 237: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xec098008  ! 238: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xec718008  ! 239: STX_R	stx	%r22, [%r6 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe071c008  ! 243: STX_R	stx	%r16, [%r7 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee140, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe441a008  ! 249: LDSW_I	ldsw	[%r6 + 0x0008], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec498008  ! 251: LDSB_R	ldsb	[%r6 + %r8], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe031e038  ! 255: STH_I	sth	%r16, [%r7 + 0x0038]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec734008  ! 259: STX_R	stx	%r22, [%r13 + %r8]
	.word 0xe429c008  ! 260: STB_R	stb	%r18, [%r7 + %r8]
	.word 0xec0b2000  ! 261: LDUB_I	ldub	[%r12 + 0x0000], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0318008  ! 264: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xa419a018  ! 265: XOR_I	xor 	%r6, 0x0018, %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe8218008  ! 268: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xec398008  ! 269: STD_R	std	%r22, [%r6 + %r8]
	setx	0x00000000d01ee100, %r1, %r6
	setx	0x00000000d02ef000, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d04ef040, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d06ef180, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4130008  ! 272: LDUH_R	lduh	[%r12 + %r8], %r18
	.word 0xe04b6008  ! 273: LDSB_I	ldsb	[%r13 + 0x0008], %r16
	.word 0xe831a020  ! 274: STH_I	sth	%r20, [%r6 + 0x0020]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00ac008  ! 277: LDUB_R	ldub	[%r11 + %r8], %r16
	setx	0x00000000d01ee100, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021a038  ! 280: STW_I	stw	%r16, [%r6 + 0x0038]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8738008  ! 283: STX_R	stx	%r20, [%r14 + %r8]
	.word 0xec5a8008  ! 284: LDX_R	ldx	[%r10 + %r8], %r22
	.word 0xec29c008  ! 285: STB_R	stb	%r22, [%r7 + %r8]
	.word 0xe002e010  ! 286: LDUW_I	lduw	[%r11 + 0x0010], %r16
	.word 0xe0328008  ! 287: STH_R	sth	%r16, [%r10 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0238008  ! 289: STW_R	stw	%r16, [%r14 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa892c008  ! 293: ORcc_R	orcc 	%r11, %r8, %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05b6020  ! 296: LDX_I	ldx	[%r13 + 0x0020], %r16
	.word 0xe00ac008  ! 297: LDUB_R	ldub	[%r11 + %r8], %r16
	.word 0xec19e020  ! 298: LDD_I	ldd	[%r7 + 0x0020], %r22
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_30:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe032e038  ! 5: STH_I	sth	%r16, [%r11 + 0x0038]
	.word 0xe0298008  ! 7: STB_R	stb	%r16, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42b4008  ! 9: STB_R	stb	%r18, [%r13 + %r8]
	.word 0xe011a030  ! 10: LDUH_I	lduh	[%r6 + 0x0030], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe832c008  ! 12: STH_R	sth	%r20, [%r11 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe052e028  ! 15: LDSH_I	ldsh	[%r11 + 0x0028], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec72c008  ! 17: STX_R	stx	%r22, [%r11 + %r8]
	.word 0xe8334008  ! 18: STH_R	sth	%r20, [%r13 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe022e030  ! 20: STW_I	stw	%r16, [%r11 + 0x0030]
	.word 0xe443a038  ! 21: LDSW_I	ldsw	[%r14 + 0x0038], %r18
	.word 0xe0398008  ! 22: STD_R	std	%r16, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8298008  ! 24: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xec01e018  ! 25: LDUW_I	lduw	[%r7 + 0x0018], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe40b2020  ! 27: LDUB_I	ldub	[%r12 + 0x0020], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec228008  ! 31: STW_R	stw	%r22, [%r10 + %r8]
	.word 0xe0436000  ! 33: LDSW_I	ldsw	[%r13 + 0x0000], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe012c008  ! 36: LDUH_R	lduh	[%r11 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe472e010  ! 38: STX_I	stx	%r18, [%r11 + 0x0010]
	.word 0xe02aa038  ! 39: STB_I	stb	%r16, [%r10 + 0x0038]
	setx	0x00000000d02ef000, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d04ef140, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d06ef140, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec31a028  ! 44: STH_I	sth	%r22, [%r6 + 0x0028]
	.word 0xe049a000  ! 45: LDSB_I	ldsb	[%r6 + 0x0000], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec336000  ! 49: STH_I	sth	%r22, [%r13 + 0x0000]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe4398008  ! 56: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe473a018  ! 57: STX_I	stx	%r18, [%r14 + 0x0018]
	.word 0xe83ba020  ! 58: STD_I	std	%r20, [%r14 + 0x0020]
	.word 0xec11a038  ! 59: LDUH_I	lduh	[%r6 + 0x0038], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe819e018  ! 61: LDD_I	ldd	[%r7 + 0x0018], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0138008  ! 63: LDUH_R	lduh	[%r14 + %r8], %r16
	.word 0xe071c008  ! 64: STX_R	stx	%r16, [%r7 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec134008  ! 67: LDUH_R	lduh	[%r13 + %r8], %r22
	.word 0xe42b2030  ! 68: STB_I	stb	%r18, [%r12 + 0x0030]
	.word 0xe011a000  ! 69: LDUH_I	lduh	[%r6 + 0x0000], %r16
	.word 0xe471a038  ! 70: STX_I	stx	%r18, [%r6 + 0x0038]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe839c008  ! 72: STD_R	std	%r20, [%r7 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0432018  ! 78: LDSW_I	ldsw	[%r12 + 0x0018], %r16
	.word 0xe04b0008  ! 79: LDSB_R	ldsb	[%r12 + %r8], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe85ae018  ! 81: LDX_I	ldx	[%r11 + 0x0018], %r20
	.word 0xec23a028  ! 82: STW_I	stw	%r22, [%r14 + 0x0028]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0738008  ! 86: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xec018008  ! 87: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xe8128008  ! 88: LDUH_R	lduh	[%r10 + %r8], %r20
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82b0008  ! 92: STB_R	stb	%r20, [%r12 + %r8]
	.word 0xec3aa018  ! 93: STD_I	std	%r22, [%r10 + 0x0018]
	setx	0x00000000d08e1040, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d08e1080, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4738008  ! 96: STX_R	stx	%r18, [%r14 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021a030  ! 98: STW_I	stw	%r16, [%r6 + 0x0030]
	.word 0xa89b2000  ! 99: XORcc_I	xorcc 	%r12, 0x0000, %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe03b8008  ! 102: STD_R	std	%r16, [%r14 + %r8]
	.word 0xe04ac008  ! 103: LDSB_R	ldsb	[%r11 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05ba028  ! 108: LDX_I	ldx	[%r14 + 0x0028], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa431c008  ! 110: ORN_R	orn 	%r7, %r8, %r18
	.word 0xec59a028  ! 111: LDX_I	ldx	[%r6 + 0x0028], %r22
	.word 0xa01b4008  ! 112: XOR_R	xor 	%r13, %r8, %r16
	.word 0xec536008  ! 113: LDSH_I	ldsh	[%r13 + 0x0008], %r22
	.word 0xe8328008  ! 114: STH_R	sth	%r20, [%r10 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2b2020  ! 120: STB_I	stb	%r22, [%r12 + 0x0020]
	.word 0xe8028008  ! 121: LDUW_R	lduw	[%r10 + %r8], %r20
	.word 0xec730008  ! 122: STX_R	stx	%r22, [%r12 + %r8]
	.word 0xe822e030  ! 123: STW_I	stw	%r20, [%r11 + 0x0030]
	.word 0xe82a8008  ! 124: STB_R	stb	%r20, [%r10 + %r8]
	.word 0xe0328008  ! 125: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xe82b0008  ! 126: STB_R	stb	%r20, [%r12 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04b6028  ! 131: LDSB_I	ldsb	[%r13 + 0x0028], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e10c0, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8434008  ! 137: LDSW_R	ldsw	[%r13 + %r8], %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe423a008  ! 140: STW_I	stw	%r18, [%r14 + 0x0008]
	.word 0xec19a028  ! 141: LDD_I	ldd	[%r6 + 0x0028], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa4c2e028  ! 147: ADDCcc_I	addccc 	%r11, 0x0028, %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe81ba008  ! 149: LDD_I	ldd	[%r14 + 0x0008], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe031a008  ! 151: STH_I	sth	%r16, [%r6 + 0x0008]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec418008  ! 156: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xe04b2030  ! 157: LDSB_I	ldsb	[%r12 + 0x0030], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe821c008  ! 159: STW_R	stw	%r20, [%r7 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe022e008  ! 163: STW_I	stw	%r16, [%r11 + 0x0008]
	.word 0xe05ac008  ! 165: LDX_R	ldx	[%r11 + %r8], %r16
	.word 0xe8332010  ! 166: STH_I	sth	%r20, [%r12 + 0x0010]
	.word 0xe81b0008  ! 167: LDD_R	ldd	[%r12 + %r8], %r20
	.word 0xe422a008  ! 168: STW_I	stw	%r18, [%r10 + 0x0008]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0718008  ! 171: STX_R	stx	%r16, [%r6 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe412e030  ! 173: LDUH_I	lduh	[%r11 + 0x0030], %r18
	.word 0xe42b8008  ! 174: STB_R	stb	%r18, [%r14 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe032e020  ! 178: STH_I	sth	%r16, [%r11 + 0x0020]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec01a028  ! 181: LDUW_I	lduw	[%r6 + 0x0028], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0598008  ! 185: LDX_R	ldx	[%r6 + %r8], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe059c008  ! 187: LDX_R	ldx	[%r7 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec21a000  ! 189: STW_I	stw	%r22, [%r6 + 0x0000]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe819a020  ! 191: LDD_I	ldd	[%r6 + 0x0020], %r20
	.word 0xe0018008  ! 192: LDUW_R	lduw	[%r6 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe029a010  ! 194: STB_I	stb	%r16, [%r6 + 0x0010]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe44aa028  ! 198: LDSB_I	ldsb	[%r10 + 0x0028], %r18
	.word 0xe85ba028  ! 199: LDX_I	ldx	[%r14 + 0x0028], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe031e010  ! 202: STH_I	sth	%r16, [%r7 + 0x0010]
	.word 0xec730008  ! 203: STX_R	stx	%r22, [%r12 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe021c008  ! 207: STW_R	stw	%r16, [%r7 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe4398008  ! 209: STD_R	std	%r18, [%r6 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec41c008  ! 211: LDSW_R	ldsw	[%r7 + %r8], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe8332008  ! 214: STH_I	sth	%r20, [%r12 + 0x0008]
	.word 0xec31a028  ! 215: STH_I	sth	%r22, [%r6 + 0x0028]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec528008  ! 218: LDSH_R	ldsh	[%r10 + %r8], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0032028  ! 220: LDUW_I	lduw	[%r12 + 0x0028], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe429a020  ! 223: STB_I	stb	%r18, [%r6 + 0x0020]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0298008  ! 225: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe0418008  ! 226: LDSW_R	ldsw	[%r6 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe822c008  ! 228: STW_R	stw	%r20, [%r11 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0736020  ! 231: STX_I	stx	%r16, [%r13 + 0x0020]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4132018  ! 233: LDUH_I	lduh	[%r12 + 0x0018], %r18
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe011e000  ! 235: LDUH_I	lduh	[%r7 + 0x0000], %r16
	.word 0xe051e028  ! 236: LDSH_I	ldsh	[%r7 + 0x0028], %r16
	.word 0xe02b0008  ! 237: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xe40b0008  ! 238: LDUB_R	ldub	[%r12 + %r8], %r18
	.word 0xe03b6028  ! 239: STD_I	std	%r16, [%r13 + 0x0028]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029a018  ! 243: STB_I	stb	%r16, [%r6 + 0x0018]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee100, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe852c008  ! 249: LDSH_R	ldsh	[%r11 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe851a028  ! 251: LDSH_I	ldsh	[%r6 + 0x0028], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03ba010  ! 255: STD_I	std	%r16, [%r14 + 0x0010]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec72a030  ! 259: STX_I	stx	%r22, [%r10 + 0x0030]
	.word 0xe8398008  ! 260: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe059a000  ! 261: LDX_I	ldx	[%r6 + 0x0000], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe02a8008  ! 264: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xa032c008  ! 265: ORN_R	orn 	%r11, %r8, %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec3b6000  ! 268: STD_I	std	%r22, [%r13 + 0x0000]
	.word 0xe8298008  ! 269: STB_R	stb	%r20, [%r6 + %r8]
	setx	0x00000000d01ee000, %r1, %r6
	setx	0x00000000d02ef080, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef040, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d06ef180, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04b0008  ! 272: LDSB_R	ldsb	[%r12 + %r8], %r16
	.word 0xe409c008  ! 273: LDUB_R	ldub	[%r7 + %r8], %r18
	.word 0xec3b2008  ! 274: STD_I	std	%r22, [%r12 + 0x0008]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04a8008  ! 277: LDSB_R	ldsb	[%r10 + %r8], %r16
	setx	0x00000000d01ee140, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83b0008  ! 280: STD_R	std	%r20, [%r12 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0730008  ! 283: STX_R	stx	%r16, [%r12 + %r8]
	.word 0xe002e028  ! 284: LDUW_I	lduw	[%r11 + 0x0028], %r16
	.word 0xe0718008  ! 285: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xec1b2010  ! 286: LDD_I	ldd	[%r12 + 0x0010], %r22
	.word 0xec21a020  ! 287: STW_I	stw	%r22, [%r6 + 0x0020]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe8728008  ! 289: STX_R	stx	%r20, [%r10 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xac02a018  ! 293: ADD_I	add 	%r10, 0x0018, %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe41b6010  ! 296: LDD_I	ldd	[%r13 + 0x0010], %r18
	.word 0xe442a020  ! 297: LDSW_I	ldsw	[%r10 + 0x0020], %r18
	.word 0xe0030008  ! 298: LDUW_R	lduw	[%r12 + %r8], %r16
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_29:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2ba030  ! 5: STB_I	stb	%r22, [%r14 + 0x0030]
	.word 0xe03b2018  ! 7: STD_I	std	%r16, [%r12 + 0x0018]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe432a038  ! 9: STH_I	sth	%r18, [%r10 + 0x0038]
	.word 0xe002c008  ! 10: LDUW_R	lduw	[%r11 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec21a018  ! 12: STW_I	stw	%r22, [%r6 + 0x0018]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec4b4008  ! 15: LDSB_R	ldsb	[%r13 + %r8], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0234008  ! 17: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xe021a010  ! 18: STW_I	stw	%r16, [%r6 + 0x0010]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec3b8008  ! 20: STD_R	std	%r22, [%r14 + %r8]
	.word 0xe009c008  ! 21: LDUB_R	ldub	[%r7 + %r8], %r16
	.word 0xec71a038  ! 22: STX_I	stx	%r22, [%r6 + 0x0038]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe03b4008  ! 24: STD_R	std	%r16, [%r13 + %r8]
	.word 0xe81ba018  ! 25: LDD_I	ldd	[%r14 + 0x0018], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec1b6010  ! 27: LDD_I	ldd	[%r13 + 0x0010], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0298008  ! 31: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe4134008  ! 33: LDUH_R	lduh	[%r13 + %r8], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8018008  ! 36: LDUW_R	lduw	[%r6 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4738008  ! 38: STX_R	stx	%r18, [%r14 + %r8]
	.word 0xec2a8008  ! 39: STB_R	stb	%r22, [%r10 + %r8]
	setx	0x00000000d02ef180, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d04ef000, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d06ef000, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0398008  ! 44: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe402a030  ! 45: LDUW_I	lduw	[%r10 + 0x0030], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec738008  ! 49: STX_R	stx	%r22, [%r14 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe071a020  ! 56: STX_I	stx	%r16, [%r6 + 0x0020]
	.word 0xec2ba008  ! 57: STB_I	stb	%r22, [%r14 + 0x0008]
	.word 0xe839a008  ! 58: STD_I	std	%r20, [%r6 + 0x0008]
	.word 0xec432020  ! 59: LDSW_I	ldsw	[%r12 + 0x0020], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe441e018  ! 61: LDSW_I	ldsw	[%r7 + 0x0018], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe819e038  ! 63: LDD_I	ldd	[%r7 + 0x0038], %r20
	.word 0xe0318008  ! 64: STH_R	sth	%r16, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec434008  ! 67: LDSW_R	ldsw	[%r13 + %r8], %r22
	.word 0xe43b2028  ! 68: STD_I	std	%r18, [%r12 + 0x0028]
	.word 0xe8136008  ! 69: LDUH_I	lduh	[%r13 + 0x0008], %r20
	.word 0xe83b4008  ! 70: STD_R	std	%r20, [%r13 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec318008  ! 72: STH_R	sth	%r22, [%r6 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe009a030  ! 78: LDUB_I	ldub	[%r6 + 0x0030], %r16
	.word 0xe8118008  ! 79: LDUH_R	lduh	[%r6 + %r8], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe011a010  ! 81: LDUH_I	lduh	[%r6 + 0x0010], %r16
	.word 0xec718008  ! 82: STX_R	stx	%r22, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe029c008  ! 86: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe019e020  ! 87: LDD_I	ldd	[%r7 + 0x0020], %r16
	.word 0xe059e028  ! 88: LDX_I	ldx	[%r7 + 0x0028], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe823a038  ! 92: STW_I	stw	%r20, [%r14 + 0x0038]
	.word 0xe432a018  ! 93: STH_I	sth	%r18, [%r10 + 0x0018]
	setx	0x00000000d08e1100, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d08e11c0, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec29a018  ! 96: STB_I	stb	%r22, [%r6 + 0x0018]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe821e010  ! 98: STW_I	stw	%r20, [%r7 + 0x0010]
	.word 0xa8a1c008  ! 99: SUBcc_R	subcc 	%r7, %r8, %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe831a008  ! 102: STH_I	sth	%r20, [%r6 + 0x0008]
	.word 0xec430008  ! 103: LDSW_R	ldsw	[%r12 + %r8], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00ba030  ! 108: LDUB_I	ldub	[%r14 + 0x0030], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xac21a010  ! 110: SUB_I	sub 	%r6, 0x0010, %r22
	.word 0xe403a020  ! 111: LDUW_I	lduw	[%r14 + 0x0020], %r18
	.word 0xa83b2010  ! 112: XNOR_I	xnor 	%r12, 0x0010, %r20
	.word 0xec132010  ! 113: LDUH_I	lduh	[%r12 + 0x0010], %r22
	.word 0xec2b2018  ! 114: STB_I	stb	%r22, [%r12 + 0x0018]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe833a028  ! 120: STH_I	sth	%r20, [%r14 + 0x0028]
	.word 0xe009a010  ! 121: LDUB_I	ldub	[%r6 + 0x0010], %r16
	.word 0xe02ba008  ! 122: STB_I	stb	%r16, [%r14 + 0x0008]
	.word 0xec71a038  ! 123: STX_I	stx	%r22, [%r6 + 0x0038]
	.word 0xe82a8008  ! 124: STB_R	stb	%r20, [%r10 + %r8]
	.word 0xe03b6038  ! 125: STD_I	std	%r16, [%r13 + 0x0038]
	.word 0xe0336020  ! 126: STH_I	sth	%r16, [%r13 + 0x0020]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec036000  ! 131: LDUW_I	lduw	[%r13 + 0x0000], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e1000, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d08e1100, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e1100, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8030008  ! 137: LDUW_R	lduw	[%r12 + %r8], %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe83aa038  ! 140: STD_I	std	%r20, [%r10 + 0x0038]
	.word 0xe411c008  ! 141: LDUH_R	lduh	[%r7 + %r8], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0b1e020  ! 147: ORNcc_I	orncc 	%r7, 0x0020, %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe049a020  ! 149: LDSB_I	ldsb	[%r6 + 0x0020], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe82b0008  ! 151: STB_R	stb	%r20, [%r12 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8038008  ! 156: LDUW_R	lduw	[%r14 + %r8], %r20
	.word 0xe402a038  ! 157: LDUW_I	lduw	[%r10 + 0x0038], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec21c008  ! 159: STW_R	stw	%r22, [%r7 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe021a018  ! 163: STW_I	stw	%r16, [%r6 + 0x0018]
	.word 0xec1ba018  ! 165: LDD_I	ldd	[%r14 + 0x0018], %r22
	.word 0xe029c008  ! 166: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe441a030  ! 167: LDSW_I	ldsw	[%r6 + 0x0030], %r18
	.word 0xe839a018  ! 168: STD_I	std	%r20, [%r6 + 0x0018]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe073a018  ! 171: STX_I	stx	%r16, [%r14 + 0x0018]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec5ae018  ! 173: LDX_I	ldx	[%r11 + 0x0018], %r22
	.word 0xec230008  ! 174: STW_R	stw	%r22, [%r12 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe031a010  ! 178: STH_I	sth	%r16, [%r6 + 0x0010]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe001a038  ! 181: LDUW_I	lduw	[%r6 + 0x0038], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe012c008  ! 185: LDUH_R	lduh	[%r11 + %r8], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec132000  ! 187: LDUH_I	lduh	[%r12 + 0x0000], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe8718008  ! 189: STX_R	stx	%r20, [%r6 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec5ae020  ! 191: LDX_I	ldx	[%r11 + 0x0020], %r22
	.word 0xe84b2008  ! 192: LDSB_I	ldsb	[%r12 + 0x0008], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe022c008  ! 194: STW_R	stw	%r16, [%r11 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe041c008  ! 198: LDSW_R	ldsw	[%r7 + %r8], %r16
	.word 0xe401a028  ! 199: LDUW_I	lduw	[%r6 + 0x0028], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe83b4008  ! 202: STD_R	std	%r20, [%r13 + %r8]
	.word 0xe021a010  ! 203: STW_I	stw	%r16, [%r6 + 0x0010]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8298008  ! 207: STB_R	stb	%r20, [%r6 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe8736020  ! 209: STX_I	stx	%r20, [%r13 + 0x0020]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0138008  ! 211: LDUH_R	lduh	[%r14 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe83ba000  ! 214: STD_I	std	%r20, [%r14 + 0x0000]
	.word 0xec71a028  ! 215: STX_I	stx	%r22, [%r6 + 0x0028]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe81b6030  ! 218: LDD_I	ldd	[%r13 + 0x0030], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe051c008  ! 220: LDSH_R	ldsh	[%r7 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0318008  ! 223: STH_R	sth	%r16, [%r6 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe03ba020  ! 225: STD_I	std	%r16, [%r14 + 0x0020]
	.word 0xe4530008  ! 226: LDSH_R	ldsh	[%r12 + %r8], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4218008  ! 228: STW_R	stw	%r18, [%r6 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4230008  ! 231: STW_R	stw	%r18, [%r12 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec11c008  ! 233: LDUH_R	lduh	[%r7 + %r8], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe4134008  ! 235: LDUH_R	lduh	[%r13 + %r8], %r18
	.word 0xe01b2028  ! 236: LDD_I	ldd	[%r12 + 0x0028], %r16
	.word 0xe0218008  ! 237: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe801c008  ! 238: LDUW_R	lduw	[%r7 + %r8], %r20
	.word 0xec31e028  ! 239: STH_I	sth	%r22, [%r7 + 0x0028]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4718008  ! 243: STX_R	stx	%r18, [%r6 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee040, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4018008  ! 249: LDUW_R	lduw	[%r6 + %r8], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe44a8008  ! 251: LDSB_R	ldsb	[%r10 + %r8], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe033a038  ! 255: STH_I	sth	%r16, [%r14 + 0x0038]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0734008  ! 259: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xec298008  ! 260: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe0536000  ! 261: LDSH_I	ldsh	[%r13 + 0x0000], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8398008  ! 264: STD_R	std	%r20, [%r6 + %r8]
	.word 0xa43b8008  ! 265: XNOR_R	xnor 	%r14, %r8, %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe8218008  ! 268: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xe03b6028  ! 269: STD_I	std	%r16, [%r13 + 0x0028]
	setx	0x00000000d01ee140, %r1, %r6
	setx	0x00000000d02ef080, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d04ef100, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef080, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe009a028  ! 272: LDUB_I	ldub	[%r6 + 0x0028], %r16
	.word 0xe40ae038  ! 273: LDUB_I	ldub	[%r11 + 0x0038], %r18
	.word 0xe8298008  ! 274: STB_R	stb	%r20, [%r6 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8518008  ! 277: LDSH_R	ldsh	[%r6 + %r8], %r20
	setx	0x00000000d01ee100, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8318008  ! 280: STH_R	sth	%r20, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe439e018  ! 283: STD_I	std	%r18, [%r7 + 0x0018]
	.word 0xe4518008  ! 284: LDSH_R	ldsh	[%r6 + %r8], %r18
	.word 0xe0338008  ! 285: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe059a000  ! 286: LDX_I	ldx	[%r6 + 0x0000], %r16
	.word 0xe432a038  ! 287: STH_I	sth	%r18, [%r10 + 0x0038]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe02b0008  ! 289: STB_R	stb	%r16, [%r12 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa4030008  ! 293: ADD_R	add 	%r12, %r8, %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04b4008  ! 296: LDSB_R	ldsb	[%r13 + %r8], %r16
	.word 0xec498008  ! 297: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xe051e000  ! 298: LDSH_I	ldsh	[%r7 + 0x0000], %r16
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_28:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0234008  ! 5: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xe471c008  ! 7: STX_R	stx	%r18, [%r7 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4718008  ! 9: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xe001a010  ! 10: LDUW_I	lduw	[%r6 + 0x0010], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe03b4008  ! 12: STD_R	std	%r16, [%r13 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe40b4008  ! 15: LDUB_R	ldub	[%r13 + %r8], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8318008  ! 17: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xe83b4008  ! 18: STD_R	std	%r20, [%r13 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe42b8008  ! 20: STB_R	stb	%r18, [%r14 + %r8]
	.word 0xe849e018  ! 21: LDSB_I	ldsb	[%r7 + 0x0018], %r20
	.word 0xe839c008  ! 22: STD_R	std	%r20, [%r7 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec73a018  ! 24: STX_I	stx	%r22, [%r14 + 0x0018]
	.word 0xe0136018  ! 25: LDUH_I	lduh	[%r13 + 0x0018], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec49e030  ! 27: LDSB_I	ldsb	[%r7 + 0x0030], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe039a028  ! 31: STD_I	std	%r16, [%r6 + 0x0028]
	.word 0xe8130008  ! 33: LDUH_R	lduh	[%r12 + %r8], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe84b8008  ! 36: LDSB_R	ldsb	[%r14 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4718008  ! 38: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xec32a038  ! 39: STH_I	sth	%r22, [%r10 + 0x0038]
	setx	0x00000000d02ef000, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d04ef080, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d06ef000, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42b4008  ! 44: STB_R	stb	%r18, [%r13 + %r8]
	.word 0xe0198008  ! 45: LDD_R	ldd	[%r6 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8318008  ! 49: STH_R	sth	%r20, [%r6 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec3b0008  ! 56: STD_R	std	%r22, [%r12 + %r8]
	.word 0xe031a018  ! 57: STH_I	sth	%r16, [%r6 + 0x0018]
	.word 0xec738008  ! 58: STX_R	stx	%r22, [%r14 + %r8]
	.word 0xec51a028  ! 59: LDSH_I	ldsh	[%r6 + 0x0028], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe802a038  ! 61: LDUW_I	lduw	[%r10 + 0x0038], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec12e008  ! 63: LDUH_I	lduh	[%r11 + 0x0008], %r22
	.word 0xe82ae038  ! 64: STB_I	stb	%r20, [%r11 + 0x0038]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe009a028  ! 67: LDUB_I	ldub	[%r6 + 0x0028], %r16
	.word 0xe021a030  ! 68: STW_I	stw	%r16, [%r6 + 0x0030]
	.word 0xe041a038  ! 69: LDSW_I	ldsw	[%r6 + 0x0038], %r16
	.word 0xec328008  ! 70: STH_R	sth	%r22, [%r10 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029c008  ! 72: STB_R	stb	%r16, [%r7 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe449a028  ! 78: LDSB_I	ldsb	[%r6 + 0x0028], %r18
	.word 0xe841e020  ! 79: LDSW_I	ldsw	[%r7 + 0x0020], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe01ac008  ! 81: LDD_R	ldd	[%r11 + %r8], %r16
	.word 0xe4218008  ! 82: STW_R	stw	%r18, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0338008  ! 86: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe0098008  ! 87: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe01a8008  ! 88: LDD_R	ldd	[%r10 + %r8], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0236020  ! 92: STW_I	stw	%r16, [%r13 + 0x0020]
	.word 0xe821e038  ! 93: STW_I	stw	%r20, [%r7 + 0x0038]
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d08e1180, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e1000, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec728008  ! 96: STX_R	stx	%r22, [%r10 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0232018  ! 98: STW_I	stw	%r16, [%r12 + 0x0018]
	.word 0xa041e000  ! 99: ADDC_I	addc 	%r7, 0x0000, %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe032c008  ! 102: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe0528008  ! 103: LDSH_R	ldsh	[%r10 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0598008  ! 108: LDX_R	ldx	[%r6 + %r8], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa09a8008  ! 110: XORcc_R	xorcc 	%r10, %r8, %r16
	.word 0xe019a008  ! 111: LDD_I	ldd	[%r6 + 0x0008], %r16
	.word 0xa09b8008  ! 112: XORcc_R	xorcc 	%r14, %r8, %r16
	.word 0xe40ac008  ! 113: LDUB_R	ldub	[%r11 + %r8], %r18
	.word 0xe03ac008  ! 114: STD_R	std	%r16, [%r11 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029a018  ! 120: STB_I	stb	%r16, [%r6 + 0x0018]
	.word 0xe401e030  ! 121: LDUW_I	lduw	[%r7 + 0x0030], %r18
	.word 0xe02a8008  ! 122: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xe8336010  ! 123: STH_I	sth	%r20, [%r13 + 0x0010]
	.word 0xe472a020  ! 124: STX_I	stx	%r18, [%r10 + 0x0020]
	.word 0xe071a000  ! 125: STX_I	stx	%r16, [%r6 + 0x0000]
	.word 0xec73a028  ! 126: STX_I	stx	%r22, [%r14 + 0x0028]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4536008  ! 131: LDSH_I	ldsh	[%r13 + 0x0008], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e11c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d08e1040, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe052c008  ! 137: LDSH_R	ldsh	[%r11 + %r8], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe42aa030  ! 140: STB_I	stb	%r18, [%r10 + 0x0030]
	.word 0xe0098008  ! 141: LDUB_R	ldub	[%r6 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0438008  ! 147: ADDC_R	addc 	%r14, %r8, %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe041a038  ! 149: LDSW_I	ldsw	[%r6 + 0x0038], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe031e030  ! 151: STH_I	sth	%r16, [%r7 + 0x0030]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4432038  ! 156: LDSW_I	ldsw	[%r12 + 0x0038], %r18
	.word 0xe81b0008  ! 157: LDD_R	ldd	[%r12 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe472e020  ! 159: STX_I	stx	%r18, [%r11 + 0x0020]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe02b0008  ! 163: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xe0538008  ! 165: LDSH_R	ldsh	[%r14 + %r8], %r16
	.word 0xe83aa008  ! 166: STD_I	std	%r20, [%r10 + 0x0008]
	.word 0xec12e008  ! 167: LDUH_I	lduh	[%r11 + 0x0008], %r22
	.word 0xe42b0008  ! 168: STB_R	stb	%r18, [%r12 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe039c008  ! 171: STD_R	std	%r16, [%r7 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe011e030  ! 173: LDUH_I	lduh	[%r7 + 0x0030], %r16
	.word 0xe0328008  ! 174: STH_R	sth	%r16, [%r10 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe4228008  ! 178: STW_R	stw	%r18, [%r10 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe409a018  ! 181: LDUB_I	ldub	[%r6 + 0x0018], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe419c008  ! 185: LDD_R	ldd	[%r7 + %r8], %r18
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec528008  ! 187: LDSH_R	ldsh	[%r10 + %r8], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec728008  ! 189: STX_R	stx	%r22, [%r10 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec5aa038  ! 191: LDX_I	ldx	[%r10 + 0x0038], %r22
	.word 0xe0430008  ! 192: LDSW_R	ldsw	[%r12 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe429e030  ! 194: STB_I	stb	%r18, [%r7 + 0x0030]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8436020  ! 198: LDSW_I	ldsw	[%r13 + 0x0020], %r20
	.word 0xec0ae020  ! 199: LDUB_I	ldub	[%r11 + 0x0020], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec31a000  ! 202: STH_I	sth	%r22, [%r6 + 0x0000]
	.word 0xe8318008  ! 203: STH_R	sth	%r20, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8338008  ! 207: STH_R	sth	%r20, [%r14 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe8734008  ! 209: STX_R	stx	%r20, [%r13 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe019a038  ! 211: LDD_I	ldd	[%r6 + 0x0038], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe023a018  ! 214: STW_I	stw	%r16, [%r14 + 0x0018]
	.word 0xe03b6000  ! 215: STD_I	std	%r16, [%r13 + 0x0000]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe04ba008  ! 218: LDSB_I	ldsb	[%r14 + 0x0008], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8498008  ! 220: LDSB_R	ldsb	[%r6 + %r8], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0738008  ! 223: STX_R	stx	%r16, [%r14 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0736030  ! 225: STX_I	stx	%r16, [%r13 + 0x0030]
	.word 0xe85ae038  ! 226: LDX_I	ldx	[%r11 + 0x0038], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4298008  ! 228: STB_R	stb	%r18, [%r6 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02b8008  ! 231: STB_R	stb	%r16, [%r14 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec018008  ! 233: LDUW_R	lduw	[%r6 + %r8], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe041e030  ! 235: LDSW_I	ldsw	[%r7 + 0x0030], %r16
	.word 0xe859a030  ! 236: LDX_I	ldx	[%r6 + 0x0030], %r20
	.word 0xe0718008  ! 237: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe8136000  ! 238: LDUH_I	lduh	[%r13 + 0x0000], %r20
	.word 0xe82aa010  ! 239: STB_I	stb	%r20, [%r10 + 0x0010]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe022e018  ! 243: STW_I	stw	%r16, [%r11 + 0x0018]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee000, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec436028  ! 249: LDSW_I	ldsw	[%r13 + 0x0028], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe009c008  ! 251: LDUB_R	ldub	[%r7 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe439a038  ! 255: STD_I	std	%r18, [%r6 + 0x0038]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0228008  ! 259: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xe439c008  ! 260: STD_R	std	%r18, [%r7 + %r8]
	.word 0xe41a8008  ! 261: LDD_R	ldd	[%r10 + %r8], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec238008  ! 264: STW_R	stw	%r22, [%r14 + %r8]
	.word 0xa0238008  ! 265: SUB_R	sub 	%r14, %r8, %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec398008  ! 268: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe42b4008  ! 269: STB_R	stb	%r18, [%r13 + %r8]
	setx	0x00000000d01ee100, %r1, %r6
	setx	0x00000000d02ef1c0, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d04ef0c0, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe402c008  ! 272: LDUW_R	lduw	[%r11 + %r8], %r18
	.word 0xe819c008  ! 273: LDD_R	ldd	[%r7 + %r8], %r20
	.word 0xec22e000  ! 274: STW_I	stw	%r22, [%r11 + 0x0000]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00b4008  ! 277: LDUB_R	ldub	[%r13 + %r8], %r16
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe023a000  ! 280: STW_I	stw	%r16, [%r14 + 0x0000]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe023a010  ! 283: STW_I	stw	%r16, [%r14 + 0x0010]
	.word 0xe84aa028  ! 284: LDSB_I	ldsb	[%r10 + 0x0028], %r20
	.word 0xec2aa008  ! 285: STB_I	stb	%r22, [%r10 + 0x0008]
	.word 0xe05ac008  ! 286: LDX_R	ldx	[%r11 + %r8], %r16
	.word 0xec2aa020  ! 287: STB_I	stb	%r22, [%r10 + 0x0020]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe429e018  ! 289: STB_I	stb	%r18, [%r7 + 0x0018]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0a18008  ! 293: SUBcc_R	subcc 	%r6, %r8, %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8418008  ! 296: LDSW_R	ldsw	[%r6 + %r8], %r20
	.word 0xe80a8008  ! 297: LDUB_R	ldub	[%r10 + %r8], %r20
	.word 0xe003a018  ! 298: LDUW_I	lduw	[%r14 + 0x0018], %r16
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_27:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0318008  ! 5: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe82aa008  ! 7: STB_I	stb	%r20, [%r10 + 0x0008]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe473a030  ! 9: STX_I	stx	%r18, [%r14 + 0x0030]
	.word 0xe442a010  ! 10: LDSW_I	ldsw	[%r10 + 0x0010], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0732028  ! 12: STX_I	stx	%r16, [%r12 + 0x0028]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec4ae010  ! 15: LDSB_I	ldsb	[%r11 + 0x0010], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029c008  ! 17: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe8734008  ! 18: STX_R	stx	%r20, [%r13 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe831a028  ! 20: STH_I	sth	%r20, [%r6 + 0x0028]
	.word 0xec09e030  ! 21: LDUB_I	ldub	[%r7 + 0x0030], %r22
	.word 0xe02ac008  ! 22: STB_R	stb	%r16, [%r11 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe43b8008  ! 24: STD_R	std	%r18, [%r14 + %r8]
	.word 0xe81b8008  ! 25: LDD_R	ldd	[%r14 + %r8], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4598008  ! 27: LDX_R	ldx	[%r6 + %r8], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec318008  ! 31: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe05b0008  ! 33: LDX_R	ldx	[%r12 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe849e030  ! 36: LDSB_I	ldsb	[%r7 + 0x0030], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec3ba010  ! 38: STD_I	std	%r22, [%r14 + 0x0010]
	.word 0xec3b0008  ! 39: STD_R	std	%r22, [%r12 + %r8]
	setx	0x00000000d02ef1c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d04ef0c0, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d06ef0c0, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec72c008  ! 44: STX_R	stx	%r22, [%r11 + %r8]
	.word 0xec01a020  ! 45: LDUW_I	lduw	[%r6 + 0x0020], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03b4008  ! 49: STD_R	std	%r16, [%r13 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec39a038  ! 56: STD_I	std	%r22, [%r6 + 0x0038]
	.word 0xe071c008  ! 57: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xe073a018  ! 58: STX_I	stx	%r16, [%r14 + 0x0018]
	.word 0xe00b0008  ! 59: LDUB_R	ldub	[%r12 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec0ba038  ! 61: LDUB_I	ldub	[%r14 + 0x0038], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec0ba008  ! 63: LDUB_I	ldub	[%r14 + 0x0008], %r22
	.word 0xe0218008  ! 64: STW_R	stw	%r16, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec0a8008  ! 67: LDUB_R	ldub	[%r10 + %r8], %r22
	.word 0xe42b0008  ! 68: STB_R	stb	%r18, [%r12 + %r8]
	.word 0xec51a000  ! 69: LDSH_I	ldsh	[%r6 + 0x0000], %r22
	.word 0xe83b4008  ! 70: STD_R	std	%r20, [%r13 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43ae008  ! 72: STD_I	std	%r18, [%r11 + 0x0008]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec598008  ! 78: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xe00b2020  ! 79: LDUB_I	ldub	[%r12 + 0x0020], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe00ac008  ! 81: LDUB_R	ldub	[%r11 + %r8], %r16
	.word 0xe0318008  ! 82: STH_R	sth	%r16, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec21a038  ! 86: STW_I	stw	%r22, [%r6 + 0x0038]
	.word 0xe4038008  ! 87: LDUW_R	lduw	[%r14 + %r8], %r18
	.word 0xe0118008  ! 88: LDUH_R	lduh	[%r6 + %r8], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe032c008  ! 92: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe829e030  ! 93: STB_I	stb	%r20, [%r7 + 0x0030]
	setx	0x00000000d08e10c0, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e1140, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec230008  ! 96: STW_R	stw	%r22, [%r12 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0218008  ! 98: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xa8218008  ! 99: SUB_R	sub 	%r6, %r8, %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe4398008  ! 102: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe451a038  ! 103: LDSH_I	ldsh	[%r6 + 0x0038], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec4ac008  ! 108: LDSB_R	ldsb	[%r11 + %r8], %r22
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa4b36028  ! 110: ORNcc_I	orncc 	%r13, 0x0028, %r18
	.word 0xec532000  ! 111: LDSH_I	ldsh	[%r12 + 0x0000], %r22
	.word 0xa0b38008  ! 112: ORNcc_R	orncc 	%r14, %r8, %r16
	.word 0xe4528008  ! 113: LDSH_R	ldsh	[%r10 + %r8], %r18
	.word 0xec298008  ! 114: STB_R	stb	%r22, [%r6 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe022c008  ! 120: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xe81ae030  ! 121: LDD_I	ldd	[%r11 + 0x0030], %r20
	.word 0xe472c008  ! 122: STX_R	stx	%r18, [%r11 + %r8]
	.word 0xe4336018  ! 123: STH_I	sth	%r18, [%r13 + 0x0018]
	.word 0xe073a018  ! 124: STX_I	stx	%r16, [%r14 + 0x0018]
	.word 0xec2b6010  ! 125: STB_I	stb	%r22, [%r13 + 0x0010]
	.word 0xe0328008  ! 126: STH_R	sth	%r16, [%r10 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe852a008  ! 131: LDSH_I	ldsh	[%r10 + 0x0008], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e1100, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d08e1040, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e1100, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe809c008  ! 137: LDUB_R	ldub	[%r7 + %r8], %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec236018  ! 140: STW_I	stw	%r22, [%r13 + 0x0018]
	.word 0xe0136038  ! 141: LDUH_I	lduh	[%r13 + 0x0038], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0332038  ! 147: SUBC_I	orn 	%r12, 0x0038, %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0032038  ! 149: LDUW_I	lduw	[%r12 + 0x0038], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe42b0008  ! 151: STB_R	stb	%r18, [%r12 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe01ae010  ! 156: LDD_I	ldd	[%r11 + 0x0010], %r16
	.word 0xe0030008  ! 157: LDUW_R	lduw	[%r12 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe03a8008  ! 159: STD_R	std	%r16, [%r10 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe032a010  ! 163: STH_I	sth	%r16, [%r10 + 0x0010]
	.word 0xe0034008  ! 165: LDUW_R	lduw	[%r13 + %r8], %r16
	.word 0xe072a000  ! 166: STX_I	stx	%r16, [%r10 + 0x0000]
	.word 0xe041a028  ! 167: LDSW_I	ldsw	[%r6 + 0x0028], %r16
	.word 0xec71a000  ! 168: STX_I	stx	%r22, [%r6 + 0x0000]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0234008  ! 171: STW_R	stw	%r16, [%r13 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0118008  ! 173: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe871e000  ! 174: STX_I	stx	%r20, [%r7 + 0x0000]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe8398008  ! 178: STD_R	std	%r20, [%r6 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe051a008  ! 181: LDSH_I	ldsh	[%r6 + 0x0008], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05b8008  ! 185: LDX_R	ldx	[%r14 + %r8], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe841c008  ! 187: LDSW_R	ldsw	[%r7 + %r8], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe421e038  ! 189: STW_I	stw	%r18, [%r7 + 0x0038]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05b6020  ! 191: LDX_I	ldx	[%r13 + 0x0020], %r16
	.word 0xec5b4008  ! 192: LDX_R	ldx	[%r13 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0398008  ! 194: STD_R	std	%r16, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe042a008  ! 198: LDSW_I	ldsw	[%r10 + 0x0008], %r16
	.word 0xe8438008  ! 199: LDSW_R	ldsw	[%r14 + %r8], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec236008  ! 202: STW_I	stw	%r22, [%r13 + 0x0008]
	.word 0xe0332000  ! 203: STH_I	sth	%r16, [%r12 + 0x0000]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe072a018  ! 207: STX_I	stx	%r16, [%r10 + 0x0018]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0736008  ! 209: STX_I	stx	%r16, [%r13 + 0x0008]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec0b0008  ! 211: LDUB_R	ldub	[%r12 + %r8], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe021e018  ! 214: STW_I	stw	%r16, [%r7 + 0x0018]
	.word 0xe03b4008  ! 215: STD_R	std	%r16, [%r13 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec1b4008  ! 218: LDD_R	ldd	[%r13 + %r8], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec5ac008  ! 220: LDX_R	ldx	[%r11 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0738008  ! 223: STX_R	stx	%r16, [%r14 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe4232018  ! 225: STW_I	stw	%r18, [%r12 + 0x0018]
	.word 0xe85b2010  ! 226: LDX_I	ldx	[%r12 + 0x0010], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02ac008  ! 228: STB_R	stb	%r16, [%r11 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe831a010  ! 231: STH_I	sth	%r20, [%r6 + 0x0010]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec41e030  ! 233: LDSW_I	ldsw	[%r7 + 0x0030], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe049c008  ! 235: LDSB_R	ldsb	[%r7 + %r8], %r16
	.word 0xe0030008  ! 236: LDUW_R	lduw	[%r12 + %r8], %r16
	.word 0xec230008  ! 237: STW_R	stw	%r22, [%r12 + %r8]
	.word 0xe00b8008  ! 238: LDUB_R	ldub	[%r14 + %r8], %r16
	.word 0xe029a020  ! 239: STB_I	stb	%r16, [%r6 + 0x0020]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0736008  ! 243: STX_I	stx	%r16, [%r13 + 0x0008]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee180, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05b2010  ! 249: LDX_I	ldx	[%r12 + 0x0010], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe84b2018  ! 251: LDSB_I	ldsb	[%r12 + 0x0018], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0736020  ! 255: STX_I	stx	%r16, [%r13 + 0x0020]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0398008  ! 259: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe4328008  ! 260: STH_R	sth	%r18, [%r10 + %r8]
	.word 0xe459a010  ! 261: LDX_I	ldx	[%r6 + 0x0010], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec718008  ! 264: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xa0818008  ! 265: ADDcc_R	addcc 	%r6, %r8, %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0332008  ! 268: STH_I	sth	%r16, [%r12 + 0x0008]
	.word 0xe873a030  ! 269: STX_I	stx	%r20, [%r14 + 0x0030]
	setx	0x00000000d01ee040, %r1, %r6
	setx	0x00000000d02ef000, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d04ef080, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d06ef180, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe859a028  ! 272: LDX_I	ldx	[%r6 + 0x0028], %r20
	.word 0xe84b8008  ! 273: LDSB_R	ldsb	[%r14 + %r8], %r20
	.word 0xe039c008  ! 274: STD_R	std	%r16, [%r7 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe81a8008  ! 277: LDD_R	ldd	[%r10 + %r8], %r20
	setx	0x00000000d01ee140, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe873a028  ! 280: STX_I	stx	%r20, [%r14 + 0x0028]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe432a038  ! 283: STH_I	sth	%r18, [%r10 + 0x0038]
	.word 0xe44b2008  ! 284: LDSB_I	ldsb	[%r12 + 0x0008], %r18
	.word 0xe071e038  ! 285: STX_I	stx	%r16, [%r7 + 0x0038]
	.word 0xe411c008  ! 286: LDUH_R	lduh	[%r7 + %r8], %r18
	.word 0xe0228008  ! 287: STW_R	stw	%r16, [%r10 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe833a008  ! 289: STH_I	sth	%r20, [%r14 + 0x0008]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xac0b6018  ! 293: AND_I	and 	%r13, 0x0018, %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec4b0008  ! 296: LDSB_R	ldsb	[%r12 + %r8], %r22
	.word 0xe40b6030  ! 297: LDUB_I	ldub	[%r13 + 0x0030], %r18
	.word 0xe80a8008  ! 298: LDUB_R	ldub	[%r10 + %r8], %r20
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_26:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0718008  ! 5: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe4718008  ! 7: STX_R	stx	%r18, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03ba010  ! 9: STD_I	std	%r16, [%r14 + 0x0010]
	.word 0xe051a038  ! 10: LDSH_I	ldsh	[%r6 + 0x0038], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe02b0008  ! 12: STB_R	stb	%r16, [%r12 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe45b2008  ! 15: LDX_I	ldx	[%r12 + 0x0008], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0218008  ! 17: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe03aa030  ! 18: STD_I	std	%r16, [%r10 + 0x0030]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4718008  ! 20: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xec130008  ! 21: LDUH_R	lduh	[%r12 + %r8], %r22
	.word 0xe032e020  ! 22: STH_I	sth	%r16, [%r11 + 0x0020]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe839a010  ! 24: STD_I	std	%r20, [%r6 + 0x0010]
	.word 0xe0538008  ! 25: LDSH_R	ldsh	[%r14 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01ac008  ! 27: LDD_R	ldd	[%r11 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8718008  ! 31: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe8198008  ! 33: LDD_R	ldd	[%r6 + %r8], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8532000  ! 36: LDSH_I	ldsh	[%r12 + 0x0000], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe033a010  ! 38: STH_I	sth	%r16, [%r14 + 0x0010]
	.word 0xec71a018  ! 39: STX_I	stx	%r22, [%r6 + 0x0018]
	setx	0x00000000d02ef140, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d04ef080, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d06ef0c0, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43b4008  ! 44: STD_R	std	%r18, [%r13 + %r8]
	.word 0xe452a008  ! 45: LDSH_I	ldsh	[%r10 + 0x0008], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0298008  ! 49: STB_R	stb	%r16, [%r6 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe021a020  ! 56: STW_I	stw	%r16, [%r6 + 0x0020]
	.word 0xe0718008  ! 57: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xec738008  ! 58: STX_R	stx	%r22, [%r14 + %r8]
	.word 0xe44aa008  ! 59: LDSB_I	ldsb	[%r10 + 0x0008], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe84b4008  ! 61: LDSB_R	ldsb	[%r13 + %r8], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe409a020  ! 63: LDUB_I	ldub	[%r6 + 0x0020], %r18
	.word 0xe0330008  ! 64: STH_R	sth	%r16, [%r12 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe44b6018  ! 67: LDSB_I	ldsb	[%r13 + 0x0018], %r18
	.word 0xec39a038  ! 68: STD_I	std	%r22, [%r6 + 0x0038]
	.word 0xe05b0008  ! 69: LDX_R	ldx	[%r12 + %r8], %r16
	.word 0xe031a038  ! 70: STH_I	sth	%r16, [%r6 + 0x0038]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4336020  ! 72: STH_I	sth	%r18, [%r13 + 0x0020]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe44ac008  ! 78: LDSB_R	ldsb	[%r11 + %r8], %r18
	.word 0xec538008  ! 79: LDSH_R	ldsh	[%r14 + %r8], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe41a8008  ! 81: LDD_R	ldd	[%r10 + %r8], %r18
	.word 0xe4236010  ! 82: STW_I	stw	%r18, [%r13 + 0x0010]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec71a000  ! 86: STX_I	stx	%r22, [%r6 + 0x0000]
	.word 0xe409a038  ! 87: LDUB_I	ldub	[%r6 + 0x0038], %r18
	.word 0xe84ba020  ! 88: LDSB_I	ldsb	[%r14 + 0x0020], %r20
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82b8008  ! 92: STB_R	stb	%r20, [%r14 + %r8]
	.word 0xe4218008  ! 93: STW_R	stw	%r18, [%r6 + %r8]
	setx	0x00000000d08e11c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e1000, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec3b8008  ! 96: STD_R	std	%r22, [%r14 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec22c008  ! 98: STW_R	stw	%r22, [%r11 + %r8]
	.word 0xa4b98008  ! 99: XNORcc_R	xnorcc 	%r6, %r8, %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec298008  ! 102: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe4428008  ! 103: LDSW_R	ldsw	[%r10 + %r8], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04aa020  ! 108: LDSB_I	ldsb	[%r10 + 0x0020], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa09ae000  ! 110: XORcc_I	xorcc 	%r11, 0x0000, %r16
	.word 0xe80ba030  ! 111: LDUB_I	ldub	[%r14 + 0x0030], %r20
	.word 0xac1b0008  ! 112: XOR_R	xor 	%r12, %r8, %r22
	.word 0xe0030008  ! 113: LDUW_R	lduw	[%r12 + %r8], %r16
	.word 0xec2ae008  ! 114: STB_I	stb	%r22, [%r11 + 0x0008]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0228008  ! 120: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xe451e018  ! 121: LDSH_I	ldsh	[%r7 + 0x0018], %r18
	.word 0xe021a020  ! 122: STW_I	stw	%r16, [%r6 + 0x0020]
	.word 0xe0298008  ! 123: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe03ba030  ! 124: STD_I	std	%r16, [%r14 + 0x0030]
	.word 0xe03b0008  ! 125: STD_R	std	%r16, [%r12 + %r8]
	.word 0xe4728008  ! 126: STX_R	stx	%r18, [%r10 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4436010  ! 131: LDSW_I	ldsw	[%r13 + 0x0010], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e1000, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d08e10c0, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e1000, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe051c008  ! 137: LDSH_R	ldsh	[%r7 + %r8], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe072c008  ! 140: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe4530008  ! 141: LDSH_R	ldsh	[%r12 + %r8], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa4428008  ! 147: ADDC_R	addc 	%r10, %r8, %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec4ac008  ! 149: LDSB_R	ldsb	[%r11 + %r8], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0336018  ! 151: STH_I	sth	%r16, [%r13 + 0x0018]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe409a038  ! 156: LDUB_I	ldub	[%r6 + 0x0038], %r18
	.word 0xe8528008  ! 157: LDSH_R	ldsh	[%r10 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe42b0008  ! 159: STB_R	stb	%r18, [%r12 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe021c008  ! 163: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xe451a010  ! 165: LDSH_I	ldsh	[%r6 + 0x0010], %r18
	.word 0xe02b4008  ! 166: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xec1a8008  ! 167: LDD_R	ldd	[%r10 + %r8], %r22
	.word 0xe8318008  ! 168: STH_R	sth	%r20, [%r6 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe822e020  ! 171: STW_I	stw	%r20, [%r11 + 0x0020]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe041e030  ! 173: LDSW_I	ldsw	[%r7 + 0x0030], %r16
	.word 0xe431a020  ! 174: STH_I	sth	%r18, [%r6 + 0x0020]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe072a030  ! 178: STX_I	stx	%r16, [%r10 + 0x0030]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe041c008  ! 181: LDSW_R	ldsw	[%r7 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec1b4008  ! 185: LDD_R	ldd	[%r13 + %r8], %r22
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe812e008  ! 187: LDUH_I	lduh	[%r11 + 0x0008], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec2ac008  ! 189: STB_R	stb	%r22, [%r11 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00b4008  ! 191: LDUB_R	ldub	[%r13 + %r8], %r16
	.word 0xec1b6020  ! 192: LDD_I	ldd	[%r13 + 0x0020], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe431a030  ! 194: STH_I	sth	%r18, [%r6 + 0x0030]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe809e028  ! 198: LDUB_I	ldub	[%r7 + 0x0028], %r20
	.word 0xe40b0008  ! 199: LDUB_R	ldub	[%r12 + %r8], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0736038  ! 202: STX_I	stx	%r16, [%r13 + 0x0038]
	.word 0xe829e018  ! 203: STB_I	stb	%r20, [%r7 + 0x0018]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe03ba028  ! 207: STD_I	std	%r16, [%r14 + 0x0028]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe039c008  ! 209: STD_R	std	%r16, [%r7 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe81b6028  ! 211: LDD_I	ldd	[%r13 + 0x0028], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0398008  ! 214: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe4218008  ! 215: STW_R	stw	%r18, [%r6 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0138008  ! 218: LDUH_R	lduh	[%r14 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0030008  ! 220: LDUW_R	lduw	[%r12 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec71e000  ! 223: STX_I	stx	%r22, [%r7 + 0x0000]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0238008  ! 225: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xec09a008  ! 226: LDUB_I	ldub	[%r6 + 0x0008], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8236018  ! 228: STW_I	stw	%r20, [%r13 + 0x0018]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe872c008  ! 231: STX_R	stx	%r20, [%r11 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe44ac008  ! 233: LDSB_R	ldsb	[%r11 + %r8], %r18
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec02e038  ! 235: LDUW_I	lduw	[%r11 + 0x0038], %r22
	.word 0xec198008  ! 236: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xe073a030  ! 237: STX_I	stx	%r16, [%r14 + 0x0030]
	.word 0xe0030008  ! 238: LDUW_R	lduw	[%r12 + %r8], %r16
	.word 0xe0332028  ! 239: STH_I	sth	%r16, [%r12 + 0x0028]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43b8008  ! 243: STD_R	std	%r18, [%r14 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee0c0, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe052e020  ! 249: LDSH_I	ldsh	[%r11 + 0x0020], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe01b2030  ! 251: LDD_I	ldd	[%r12 + 0x0030], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4730008  ! 255: STX_R	stx	%r18, [%r12 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe031a018  ! 259: STH_I	sth	%r16, [%r6 + 0x0018]
	.word 0xe8232010  ! 260: STW_I	stw	%r20, [%r12 + 0x0010]
	.word 0xe05aa038  ! 261: LDX_I	ldx	[%r10 + 0x0038], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec3a8008  ! 264: STD_R	std	%r22, [%r10 + %r8]
	.word 0xa041e018  ! 265: ADDC_I	addc 	%r7, 0x0018, %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe429a010  ! 268: STB_I	stb	%r18, [%r6 + 0x0010]
	.word 0xec238008  ! 269: STW_R	stw	%r22, [%r14 + %r8]
	setx	0x00000000d01ee000, %r1, %r6
	setx	0x00000000d02ef140, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d04ef000, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d06ef140, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04b2038  ! 272: LDSB_I	ldsb	[%r12 + 0x0038], %r16
	.word 0xec4b0008  ! 273: LDSB_R	ldsb	[%r12 + %r8], %r22
	.word 0xe8230008  ! 274: STW_R	stw	%r20, [%r12 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0030008  ! 277: LDUW_R	lduw	[%r12 + %r8], %r16
	setx	0x00000000d01ee040, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec228008  ! 280: STW_R	stw	%r22, [%r10 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe82b4008  ! 283: STB_R	stb	%r20, [%r13 + %r8]
	.word 0xe04b4008  ! 284: LDSB_R	ldsb	[%r13 + %r8], %r16
	.word 0xec338008  ! 285: STH_R	sth	%r22, [%r14 + %r8]
	.word 0xe842e018  ! 286: LDSW_I	ldsw	[%r11 + 0x0018], %r20
	.word 0xe8234008  ! 287: STW_R	stw	%r20, [%r13 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe071a030  ! 289: STX_I	stx	%r16, [%r6 + 0x0030]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0818008  ! 293: ADDcc_R	addcc 	%r6, %r8, %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4598008  ! 296: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xe819c008  ! 297: LDD_R	ldd	[%r7 + %r8], %r20
	.word 0xe40b4008  ! 298: LDUB_R	ldub	[%r13 + %r8], %r18
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_25:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe471c008  ! 5: STX_R	stx	%r18, [%r7 + %r8]
	.word 0xe471a030  ! 7: STX_I	stx	%r18, [%r6 + 0x0030]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0334008  ! 9: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xe041c008  ! 10: LDSW_R	ldsw	[%r7 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec3a8008  ! 12: STD_R	std	%r22, [%r10 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe441a028  ! 15: LDSW_I	ldsw	[%r6 + 0x0028], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec728008  ! 17: STX_R	stx	%r22, [%r10 + %r8]
	.word 0xe439a010  ! 18: STD_I	std	%r18, [%r6 + 0x0010]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0228008  ! 20: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xec49a038  ! 21: LDSB_I	ldsb	[%r6 + 0x0038], %r22
	.word 0xe021c008  ! 22: STW_R	stw	%r16, [%r7 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe421a018  ! 24: STW_I	stw	%r18, [%r6 + 0x0018]
	.word 0xec518008  ! 25: LDSH_R	ldsh	[%r6 + %r8], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe059a010  ! 27: LDX_I	ldx	[%r6 + 0x0010], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02aa030  ! 31: STB_I	stb	%r16, [%r10 + 0x0030]
	.word 0xe8428008  ! 33: LDSW_R	ldsw	[%r10 + %r8], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe001e030  ! 36: LDUW_I	lduw	[%r7 + 0x0030], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe82b6038  ! 38: STB_I	stb	%r20, [%r13 + 0x0038]
	.word 0xe831c008  ! 39: STH_R	sth	%r20, [%r7 + %r8]
	setx	0x00000000d02ef0c0, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d04ef000, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d06ef100, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec29c008  ! 44: STB_R	stb	%r22, [%r7 + %r8]
	.word 0xe849a038  ! 45: LDSB_I	ldsb	[%r6 + 0x0038], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe072a018  ! 49: STX_I	stx	%r16, [%r10 + 0x0018]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe071c008  ! 56: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xe0298008  ! 57: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe0334008  ! 58: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xe80ba008  ! 59: LDUB_I	ldub	[%r14 + 0x0008], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0534008  ! 61: LDSH_R	ldsh	[%r13 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec49c008  ! 63: LDSB_R	ldsb	[%r7 + %r8], %r22
	.word 0xe421a020  ! 64: STW_I	stw	%r18, [%r6 + 0x0020]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0436018  ! 67: LDSW_I	ldsw	[%r13 + 0x0018], %r16
	.word 0xe43b6030  ! 68: STD_I	std	%r18, [%r13 + 0x0030]
	.word 0xe841a008  ! 69: LDSW_I	ldsw	[%r6 + 0x0008], %r20
	.word 0xe83aa008  ! 70: STD_I	std	%r20, [%r10 + 0x0008]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe831c008  ! 72: STH_R	sth	%r20, [%r7 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec5ba038  ! 78: LDX_I	ldx	[%r14 + 0x0038], %r22
	.word 0xe05ac008  ! 79: LDX_R	ldx	[%r11 + %r8], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe0428008  ! 81: LDSW_R	ldsw	[%r10 + %r8], %r16
	.word 0xe8738008  ! 82: STX_R	stx	%r20, [%r14 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe429e038  ! 86: STB_I	stb	%r18, [%r7 + 0x0038]
	.word 0xe003a008  ! 87: LDUW_I	lduw	[%r14 + 0x0008], %r16
	.word 0xec1b4008  ! 88: LDD_R	ldd	[%r13 + %r8], %r22
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0338008  ! 92: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe033a030  ! 93: STH_I	sth	%r16, [%r14 + 0x0030]
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e1080, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe821a020  ! 96: STW_I	stw	%r20, [%r6 + 0x0020]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2a8008  ! 98: STB_R	stb	%r22, [%r10 + %r8]
	.word 0xa4236020  ! 99: SUB_I	sub 	%r13, 0x0020, %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec2b6020  ! 102: STB_I	stb	%r22, [%r13 + 0x0020]
	.word 0xec01a020  ! 103: LDUW_I	lduw	[%r6 + 0x0020], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe012c008  ! 108: LDUH_R	lduh	[%r11 + %r8], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa8c32038  ! 110: ADDCcc_I	addccc 	%r12, 0x0038, %r20
	.word 0xe842c008  ! 111: LDSW_R	ldsw	[%r11 + %r8], %r20
	.word 0xa0c1a000  ! 112: ADDCcc_I	addccc 	%r6, 0x0000, %r16
	.word 0xe0428008  ! 113: LDSW_R	ldsw	[%r10 + %r8], %r16
	.word 0xe839e000  ! 114: STD_I	std	%r20, [%r7 + 0x0000]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec398008  ! 120: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe052e010  ! 121: LDSH_I	ldsh	[%r11 + 0x0010], %r16
	.word 0xe871a020  ! 122: STX_I	stx	%r20, [%r6 + 0x0020]
	.word 0xe8730008  ! 123: STX_R	stx	%r20, [%r12 + %r8]
	.word 0xe0734008  ! 124: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xe0718008  ! 125: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe8334008  ! 126: STH_R	sth	%r20, [%r13 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4518008  ! 131: LDSH_R	ldsh	[%r6 + %r8], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e10c0, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d08e1080, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8438008  ! 137: LDSW_R	ldsw	[%r14 + %r8], %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe839a018  ! 140: STD_I	std	%r20, [%r6 + 0x0018]
	.word 0xec028008  ! 141: LDUW_R	lduw	[%r10 + %r8], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa412a010  ! 147: OR_I	or 	%r10, 0x0010, %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe8118008  ! 149: LDUH_R	lduh	[%r6 + %r8], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe039c008  ! 151: STD_R	std	%r16, [%r7 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe44b4008  ! 156: LDSB_R	ldsb	[%r13 + %r8], %r18
	.word 0xe00b8008  ! 157: LDUB_R	ldub	[%r14 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe439e030  ! 159: STD_I	std	%r18, [%r7 + 0x0030]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe03a8008  ! 163: STD_R	std	%r16, [%r10 + %r8]
	.word 0xec49a018  ! 165: LDSB_I	ldsb	[%r6 + 0x0018], %r22
	.word 0xec32c008  ! 166: STH_R	sth	%r22, [%r11 + %r8]
	.word 0xe001a020  ! 167: LDUW_I	lduw	[%r6 + 0x0020], %r16
	.word 0xe8218008  ! 168: STW_R	stw	%r20, [%r6 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe072a028  ! 171: STX_I	stx	%r16, [%r10 + 0x0028]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00aa028  ! 173: LDUB_I	ldub	[%r10 + 0x0028], %r16
	.word 0xe0236038  ! 174: STW_I	stw	%r16, [%r13 + 0x0038]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe022c008  ! 178: STW_R	stw	%r16, [%r11 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4138008  ! 181: LDUH_R	lduh	[%r14 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04ac008  ! 185: LDSB_R	ldsb	[%r11 + %r8], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe013a030  ! 187: LDUH_I	lduh	[%r14 + 0x0030], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe832a030  ! 189: STH_I	sth	%r20, [%r10 + 0x0030]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0030008  ! 191: LDUW_R	lduw	[%r12 + %r8], %r16
	.word 0xe40ac008  ! 192: LDUB_R	ldub	[%r11 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe42b2030  ! 194: STB_I	stb	%r18, [%r12 + 0x0030]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe449a018  ! 198: LDSB_I	ldsb	[%r6 + 0x0018], %r18
	.word 0xec59e020  ! 199: LDX_I	ldx	[%r7 + 0x0020], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec71a020  ! 202: STX_I	stx	%r22, [%r6 + 0x0020]
	.word 0xe83a8008  ! 203: STD_R	std	%r20, [%r10 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec22e020  ! 207: STW_I	stw	%r22, [%r11 + 0x0020]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe422e000  ! 209: STW_I	stw	%r18, [%r11 + 0x0000]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe84b6008  ! 211: LDSB_I	ldsb	[%r13 + 0x0008], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe8728008  ! 214: STX_R	stx	%r20, [%r10 + %r8]
	.word 0xe03ac008  ! 215: STD_R	std	%r16, [%r11 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8530008  ! 218: LDSH_R	ldsh	[%r12 + %r8], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe053a018  ! 220: LDSH_I	ldsh	[%r14 + 0x0018], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec2a8008  ! 223: STB_R	stb	%r22, [%r10 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0218008  ! 225: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe0498008  ! 226: LDSB_R	ldsb	[%r6 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec3b0008  ! 228: STD_R	std	%r22, [%r12 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe072e010  ! 231: STX_I	stx	%r16, [%r11 + 0x0010]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec118008  ! 233: LDUH_R	lduh	[%r6 + %r8], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec0ba030  ! 235: LDUB_I	ldub	[%r14 + 0x0030], %r22
	.word 0xe059a000  ! 236: LDX_I	ldx	[%r6 + 0x0000], %r16
	.word 0xe0734008  ! 237: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xec01c008  ! 238: LDUW_R	lduw	[%r7 + %r8], %r22
	.word 0xec3b6008  ! 239: STD_I	std	%r22, [%r13 + 0x0008]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4738008  ! 243: STX_R	stx	%r18, [%r14 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee100, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe819e020  ! 249: LDD_I	ldd	[%r7 + 0x0020], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0498008  ! 251: LDSB_R	ldsb	[%r6 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8318008  ! 255: STH_R	sth	%r20, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0736000  ! 259: STX_I	stx	%r16, [%r13 + 0x0000]
	.word 0xe0338008  ! 260: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe049a028  ! 261: LDSB_I	ldsb	[%r6 + 0x0028], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe471c008  ! 264: STX_R	stx	%r18, [%r7 + %r8]
	.word 0xa0a3a000  ! 265: SUBcc_I	subcc 	%r14, 0x0000, %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe021e018  ! 268: STW_I	stw	%r16, [%r7 + 0x0018]
	.word 0xe022c008  ! 269: STW_R	stw	%r16, [%r11 + %r8]
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d04ef080, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d06ef0c0, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe85ac008  ! 272: LDX_R	ldx	[%r11 + %r8], %r20
	.word 0xe81b2020  ! 273: LDD_I	ldd	[%r12 + 0x0020], %r20
	.word 0xec2b8008  ! 274: STB_R	stb	%r22, [%r14 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe801c008  ! 277: LDUW_R	lduw	[%r7 + %r8], %r20
	setx	0x00000000d01ee100, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0734008  ! 280: STX_R	stx	%r16, [%r13 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe832c008  ! 283: STH_R	sth	%r20, [%r11 + %r8]
	.word 0xec0b8008  ! 284: LDUB_R	ldub	[%r14 + %r8], %r22
	.word 0xe0238008  ! 285: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe41a8008  ! 286: LDD_R	ldd	[%r10 + %r8], %r18
	.word 0xe0238008  ! 287: STW_R	stw	%r16, [%r14 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe873a008  ! 289: STX_I	stx	%r20, [%r14 + 0x0008]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa4318008  ! 293: ORN_R	orn 	%r6, %r8, %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe052c008  ! 296: LDSH_R	ldsh	[%r11 + %r8], %r16
	.word 0xec4b2018  ! 297: LDSB_I	ldsb	[%r12 + 0x0018], %r22
	.word 0xec19a018  ! 298: LDD_I	ldd	[%r6 + 0x0018], %r22
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_24:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe871a008  ! 5: STX_I	stx	%r20, [%r6 + 0x0008]
	.word 0xe839e000  ! 7: STD_I	std	%r20, [%r7 + 0x0000]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4398008  ! 9: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe00b8008  ! 10: LDUB_R	ldub	[%r14 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe82ae008  ! 12: STB_I	stb	%r20, [%r11 + 0x0008]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec4b6028  ! 15: LDSB_I	ldsb	[%r13 + 0x0028], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8236038  ! 17: STW_I	stw	%r20, [%r13 + 0x0038]
	.word 0xe839c008  ! 18: STD_R	std	%r20, [%r7 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec738008  ! 20: STX_R	stx	%r22, [%r14 + %r8]
	.word 0xe0118008  ! 21: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe82a8008  ! 22: STB_R	stb	%r20, [%r10 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe071a000  ! 24: STX_I	stx	%r16, [%r6 + 0x0000]
	.word 0xe841c008  ! 25: LDSW_R	ldsw	[%r7 + %r8], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe841a020  ! 27: LDSW_I	ldsw	[%r6 + 0x0020], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8232008  ! 31: STW_I	stw	%r20, [%r12 + 0x0008]
	.word 0xec41a028  ! 33: LDSW_I	ldsw	[%r6 + 0x0028], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0418008  ! 36: LDSW_R	ldsw	[%r6 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec3a8008  ! 38: STD_R	std	%r22, [%r10 + %r8]
	.word 0xe8732038  ! 39: STX_I	stx	%r20, [%r12 + 0x0038]
	setx	0x00000000d02ef000, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d04ef080, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d06ef140, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe022a000  ! 44: STW_I	stw	%r16, [%r10 + 0x0000]
	.word 0xec418008  ! 45: LDSW_R	ldsw	[%r6 + %r8], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029a010  ! 49: STB_I	stb	%r16, [%r6 + 0x0010]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec334008  ! 56: STH_R	sth	%r22, [%r13 + %r8]
	.word 0xe0336000  ! 57: STH_I	sth	%r16, [%r13 + 0x0000]
	.word 0xe42aa018  ! 58: STB_I	stb	%r18, [%r10 + 0x0018]
	.word 0xe8434008  ! 59: LDSW_R	ldsw	[%r13 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe451c008  ! 61: LDSH_R	ldsh	[%r7 + %r8], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04ac008  ! 63: LDSB_R	ldsb	[%r11 + %r8], %r16
	.word 0xe039a030  ! 64: STD_I	std	%r16, [%r6 + 0x0030]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe811a000  ! 67: LDUH_I	lduh	[%r6 + 0x0000], %r20
	.word 0xe4234008  ! 68: STW_R	stw	%r18, [%r13 + %r8]
	.word 0xe0518008  ! 69: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe021a008  ! 70: STW_I	stw	%r16, [%r6 + 0x0008]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029a008  ! 72: STB_I	stb	%r16, [%r6 + 0x0008]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8132028  ! 78: LDUH_I	lduh	[%r12 + 0x0028], %r20
	.word 0xe811c008  ! 79: LDUH_R	lduh	[%r7 + %r8], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec438008  ! 81: LDSW_R	ldsw	[%r14 + %r8], %r22
	.word 0xe4230008  ! 82: STW_R	stw	%r18, [%r12 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe43b0008  ! 86: STD_R	std	%r18, [%r12 + %r8]
	.word 0xe84b8008  ! 87: LDSB_R	ldsb	[%r14 + %r8], %r20
	.word 0xec518008  ! 88: LDSH_R	ldsh	[%r6 + %r8], %r22
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe821a000  ! 92: STW_I	stw	%r20, [%r6 + 0x0000]
	.word 0xec730008  ! 93: STX_R	stx	%r22, [%r12 + %r8]
	setx	0x00000000d08e11c0, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d08e1140, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e1040, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8736028  ! 96: STX_I	stx	%r20, [%r13 + 0x0028]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43b8008  ! 98: STD_R	std	%r18, [%r14 + %r8]
	.word 0xa02a8008  ! 99: ANDN_R	andn 	%r10, %r8, %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe839e010  ! 102: STD_I	std	%r20, [%r7 + 0x0010]
	.word 0xe85ae028  ! 103: LDX_I	ldx	[%r11 + 0x0028], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8128008  ! 108: LDUH_R	lduh	[%r10 + %r8], %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa0ab4008  ! 110: ANDNcc_R	andncc 	%r13, %r8, %r16
	.word 0xe042a008  ! 111: LDSW_I	ldsw	[%r10 + 0x0008], %r16
	.word 0xacbaa000  ! 112: XNORcc_I	xnorcc 	%r10, 0x0000, %r22
	.word 0xec032028  ! 113: LDUW_I	lduw	[%r12 + 0x0028], %r22
	.word 0xe021a020  ! 114: STW_I	stw	%r16, [%r6 + 0x0020]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03b0008  ! 120: STD_R	std	%r16, [%r12 + %r8]
	.word 0xe001e020  ! 121: LDUW_I	lduw	[%r7 + 0x0020], %r16
	.word 0xe0732038  ! 122: STX_I	stx	%r16, [%r12 + 0x0038]
	.word 0xe4728008  ! 123: STX_R	stx	%r18, [%r10 + %r8]
	.word 0xec33a028  ! 124: STH_I	sth	%r22, [%r14 + 0x0028]
	.word 0xec218008  ! 125: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe42b2020  ! 126: STB_I	stb	%r18, [%r12 + 0x0020]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe059e010  ! 131: LDX_I	ldx	[%r7 + 0x0010], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e1000, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d08e10c0, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe009e038  ! 137: LDUB_I	ldub	[%r7 + 0x0038], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe83b8008  ! 140: STD_R	std	%r20, [%r14 + %r8]
	.word 0xe4598008  ! 141: LDX_R	ldx	[%r6 + %r8], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xacab2030  ! 147: ANDNcc_I	andncc 	%r12, 0x0030, %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe40b2030  ! 149: LDUB_I	ldub	[%r12 + 0x0030], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe02aa008  ! 151: STB_I	stb	%r16, [%r10 + 0x0008]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe813a030  ! 156: LDUH_I	lduh	[%r14 + 0x0030], %r20
	.word 0xe0598008  ! 157: LDX_R	ldx	[%r6 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe42b8008  ! 159: STB_R	stb	%r18, [%r14 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe021e008  ! 163: STW_I	stw	%r16, [%r7 + 0x0008]
	.word 0xec036020  ! 165: LDUW_I	lduw	[%r13 + 0x0020], %r22
	.word 0xe42ae000  ! 166: STB_I	stb	%r18, [%r11 + 0x0000]
	.word 0xec1b4008  ! 167: LDD_R	ldd	[%r13 + %r8], %r22
	.word 0xe4728008  ! 168: STX_R	stx	%r18, [%r10 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe4718008  ! 171: STX_R	stx	%r18, [%r6 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec1b4008  ! 173: LDD_R	ldd	[%r13 + %r8], %r22
	.word 0xe43b2038  ! 174: STD_I	std	%r18, [%r12 + 0x0038]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec72a030  ! 178: STX_I	stx	%r22, [%r10 + 0x0030]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe40ae028  ! 181: LDUB_I	ldub	[%r11 + 0x0028], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec1b6008  ! 185: LDD_I	ldd	[%r13 + 0x0008], %r22
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe049c008  ! 187: LDSB_R	ldsb	[%r7 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe4318008  ! 189: STH_R	sth	%r18, [%r6 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe419c008  ! 191: LDD_R	ldd	[%r7 + %r8], %r18
	.word 0xec42c008  ! 192: LDSW_R	ldsw	[%r11 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0332008  ! 194: STH_I	sth	%r16, [%r12 + 0x0008]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe059e000  ! 198: LDX_I	ldx	[%r7 + 0x0000], %r16
	.word 0xe849a008  ! 199: LDSB_I	ldsb	[%r6 + 0x0008], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe43b2028  ! 202: STD_I	std	%r18, [%r12 + 0x0028]
	.word 0xe4736028  ! 203: STX_I	stx	%r18, [%r13 + 0x0028]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe4236020  ! 207: STW_I	stw	%r18, [%r13 + 0x0020]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe073a008  ! 209: STX_I	stx	%r16, [%r14 + 0x0008]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe859a020  ! 211: LDX_I	ldx	[%r6 + 0x0020], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec21e018  ! 214: STW_I	stw	%r22, [%r7 + 0x0018]
	.word 0xe0298008  ! 215: STB_R	stb	%r16, [%r6 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec11a010  ! 218: LDUH_I	lduh	[%r6 + 0x0010], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe019a008  ! 220: LDD_I	ldd	[%r6 + 0x0008], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec718008  ! 223: STX_R	stx	%r22, [%r6 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe422c008  ! 225: STW_R	stw	%r18, [%r11 + %r8]
	.word 0xe813a020  ! 226: LDUH_I	lduh	[%r14 + 0x0020], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0332010  ! 228: STH_I	sth	%r16, [%r12 + 0x0010]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03b6008  ! 231: STD_I	std	%r16, [%r13 + 0x0008]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe841a000  ! 233: LDSW_I	ldsw	[%r6 + 0x0000], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe01b2010  ! 235: LDD_I	ldd	[%r12 + 0x0010], %r16
	.word 0xe44b8008  ! 236: LDSB_R	ldsb	[%r14 + %r8], %r18
	.word 0xe0330008  ! 237: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xe85a8008  ! 238: LDX_R	ldx	[%r10 + %r8], %r20
	.word 0xe4398008  ! 239: STD_R	std	%r18, [%r6 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4228008  ! 243: STW_R	stw	%r18, [%r10 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee180, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec1ac008  ! 249: LDD_R	ldd	[%r11 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe04aa038  ! 251: LDSB_I	ldsb	[%r10 + 0x0038], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8738008  ! 255: STX_R	stx	%r20, [%r14 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe429e028  ! 259: STB_I	stb	%r18, [%r7 + 0x0028]
	.word 0xe0330008  ! 260: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xec51c008  ! 261: LDSH_R	ldsh	[%r7 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8398008  ! 264: STD_R	std	%r20, [%r6 + %r8]
	.word 0xa422a018  ! 265: SUB_I	sub 	%r10, 0x0018, %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4732030  ! 268: STX_I	stx	%r18, [%r12 + 0x0030]
	.word 0xe0728008  ! 269: STX_R	stx	%r16, [%r10 + %r8]
	setx	0x00000000d01ee180, %r1, %r6
	setx	0x00000000d02ef000, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d04ef140, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d06ef140, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe853a000  ! 272: LDSH_I	ldsh	[%r14 + 0x0000], %r20
	.word 0xe40b0008  ! 273: LDUB_R	ldub	[%r12 + %r8], %r18
	.word 0xe039a010  ! 274: STD_I	std	%r16, [%r6 + 0x0010]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe419e000  ! 277: LDD_I	ldd	[%r7 + 0x0000], %r18
	setx	0x00000000d01ee000, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0218008  ! 280: STW_R	stw	%r16, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe43ba000  ! 283: STD_I	std	%r18, [%r14 + 0x0000]
	.word 0xe01b0008  ! 284: LDD_R	ldd	[%r12 + %r8], %r16
	.word 0xe021a018  ! 285: STW_I	stw	%r16, [%r6 + 0x0018]
	.word 0xe0538008  ! 286: LDSH_R	ldsh	[%r14 + %r8], %r16
	.word 0xe8338008  ! 287: STH_R	sth	%r20, [%r14 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0238008  ! 289: STW_R	stw	%r16, [%r14 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xac31c008  ! 293: SUBC_R	orn 	%r7, %r8, %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00b8008  ! 296: LDUB_R	ldub	[%r14 + %r8], %r16
	.word 0xe409c008  ! 297: LDUB_R	ldub	[%r7 + %r8], %r18
	.word 0xe012a030  ! 298: LDUH_I	lduh	[%r10 + 0x0030], %r16
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_23:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe829a030  ! 5: STB_I	stb	%r20, [%r6 + 0x0030]
	.word 0xe421a018  ! 7: STW_I	stw	%r18, [%r6 + 0x0018]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe839a030  ! 9: STD_I	std	%r20, [%r6 + 0x0030]
	.word 0xe8118008  ! 10: LDUH_R	lduh	[%r6 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe8730008  ! 12: STX_R	stx	%r20, [%r12 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8434008  ! 15: LDSW_R	ldsw	[%r13 + %r8], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029c008  ! 17: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe871a010  ! 18: STX_I	stx	%r20, [%r6 + 0x0010]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec2aa000  ! 20: STB_I	stb	%r22, [%r10 + 0x0000]
	.word 0xe8018008  ! 21: LDUW_R	lduw	[%r6 + %r8], %r20
	.word 0xe071e030  ! 22: STX_I	stx	%r16, [%r7 + 0x0030]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0398008  ! 24: STD_R	std	%r16, [%r6 + %r8]
	.word 0xec42e018  ! 25: LDSW_I	ldsw	[%r11 + 0x0018], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe809c008  ! 27: LDUB_R	ldub	[%r7 + %r8], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4730008  ! 31: STX_R	stx	%r18, [%r12 + %r8]
	.word 0xe842e030  ! 33: LDSW_I	ldsw	[%r11 + 0x0030], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe051c008  ! 36: LDSH_R	ldsh	[%r7 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe431e038  ! 38: STH_I	sth	%r18, [%r7 + 0x0038]
	.word 0xec2b2008  ! 39: STB_I	stb	%r22, [%r12 + 0x0008]
	setx	0x00000000d02ef100, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d04ef040, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d06ef140, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe031a038  ! 44: STH_I	sth	%r16, [%r6 + 0x0038]
	.word 0xec438008  ! 45: LDSW_R	ldsw	[%r14 + %r8], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec21e018  ! 49: STW_I	stw	%r22, [%r7 + 0x0018]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0328008  ! 56: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xe83aa030  ! 57: STD_I	std	%r20, [%r10 + 0x0030]
	.word 0xe021a000  ! 58: STW_I	stw	%r16, [%r6 + 0x0000]
	.word 0xe012c008  ! 59: LDUH_R	lduh	[%r11 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe049e000  ! 61: LDSB_I	ldsb	[%r7 + 0x0000], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01a8008  ! 63: LDD_R	ldd	[%r10 + %r8], %r16
	.word 0xe023a038  ! 64: STW_I	stw	%r16, [%r14 + 0x0038]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00ba000  ! 67: LDUB_I	ldub	[%r14 + 0x0000], %r16
	.word 0xe8334008  ! 68: STH_R	sth	%r20, [%r13 + %r8]
	.word 0xec4aa038  ! 69: LDSB_I	ldsb	[%r10 + 0x0038], %r22
	.word 0xe872c008  ! 70: STX_R	stx	%r20, [%r11 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8318008  ! 72: STH_R	sth	%r20, [%r6 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec41c008  ! 78: LDSW_R	ldsw	[%r7 + %r8], %r22
	.word 0xe4530008  ! 79: LDSH_R	ldsh	[%r12 + %r8], %r18
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec19e000  ! 81: LDD_I	ldd	[%r7 + 0x0000], %r22
	.word 0xec3ac008  ! 82: STD_R	std	%r22, [%r11 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec728008  ! 86: STX_R	stx	%r22, [%r10 + %r8]
	.word 0xe00b6030  ! 87: LDUB_I	ldub	[%r13 + 0x0030], %r16
	.word 0xe84a8008  ! 88: LDSB_R	ldsb	[%r10 + %r8], %r20
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03aa018  ! 92: STD_I	std	%r16, [%r10 + 0x0018]
	.word 0xe822c008  ! 93: STW_R	stw	%r20, [%r11 + %r8]
	setx	0x00000000d08e1100, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d08e1040, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d08e1100, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe472c008  ! 96: STX_R	stx	%r18, [%r11 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2b4008  ! 98: STB_R	stb	%r22, [%r13 + %r8]
	.word 0xa431a020  ! 99: ORN_I	orn 	%r6, 0x0020, %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8718008  ! 102: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe011a038  ! 103: LDUH_I	lduh	[%r6 + 0x0038], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec4aa008  ! 108: LDSB_I	ldsb	[%r10 + 0x0008], %r22
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa8918008  ! 110: ORcc_R	orcc 	%r6, %r8, %r20
	.word 0xe8534008  ! 111: LDSH_R	ldsh	[%r13 + %r8], %r20
	.word 0xa001a038  ! 112: ADD_I	add 	%r6, 0x0038, %r16
	.word 0xec198008  ! 113: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xe43ac008  ! 114: STD_R	std	%r18, [%r11 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0398008  ! 120: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe041a000  ! 121: LDSW_I	ldsw	[%r6 + 0x0000], %r16
	.word 0xe0738008  ! 122: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe039a020  ! 123: STD_I	std	%r16, [%r6 + 0x0020]
	.word 0xe03a8008  ! 124: STD_R	std	%r16, [%r10 + %r8]
	.word 0xe839a008  ! 125: STD_I	std	%r20, [%r6 + 0x0008]
	.word 0xe4330008  ! 126: STH_R	sth	%r18, [%r12 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec1b8008  ! 131: LDD_R	ldd	[%r14 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e1040, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01ba018  ! 137: LDD_I	ldd	[%r14 + 0x0018], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe83b2028  ! 140: STD_I	std	%r20, [%r12 + 0x0028]
	.word 0xe40aa008  ! 141: LDUB_I	ldub	[%r10 + 0x0008], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0b36028  ! 147: ORNcc_I	orncc 	%r13, 0x0028, %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe051a008  ! 149: LDSH_I	ldsh	[%r6 + 0x0008], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec718008  ! 151: STX_R	stx	%r22, [%r6 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe84b0008  ! 156: LDSB_R	ldsb	[%r12 + %r8], %r20
	.word 0xec034008  ! 157: LDUW_R	lduw	[%r13 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec238008  ! 159: STW_R	stw	%r22, [%r14 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4330008  ! 163: STH_R	sth	%r18, [%r12 + %r8]
	.word 0xe059c008  ! 165: LDX_R	ldx	[%r7 + %r8], %r16
	.word 0xe0238008  ! 166: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe009e028  ! 167: LDUB_I	ldub	[%r7 + 0x0028], %r16
	.word 0xe8234008  ! 168: STW_R	stw	%r20, [%r13 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe43ae010  ! 171: STD_I	std	%r18, [%r11 + 0x0010]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4418008  ! 173: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xe072a038  ! 174: STX_I	stx	%r16, [%r10 + 0x0038]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe0218008  ! 178: STW_R	stw	%r16, [%r6 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec4b2030  ! 181: LDSB_I	ldsb	[%r12 + 0x0030], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4130008  ! 185: LDUH_R	lduh	[%r12 + %r8], %r18
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0118008  ! 187: LDUH_R	lduh	[%r6 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe82b4008  ! 189: STB_R	stb	%r20, [%r13 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00ba000  ! 191: LDUB_I	ldub	[%r14 + 0x0000], %r16
	.word 0xec1b0008  ! 192: LDD_R	ldd	[%r12 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe071a010  ! 194: STX_I	stx	%r16, [%r6 + 0x0010]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe00b8008  ! 198: LDUB_R	ldub	[%r14 + %r8], %r16
	.word 0xe411c008  ! 199: LDUH_R	lduh	[%r7 + %r8], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe831a018  ! 202: STH_I	sth	%r20, [%r6 + 0x0018]
	.word 0xe421e000  ! 203: STW_I	stw	%r18, [%r7 + 0x0000]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0318008  ! 207: STH_R	sth	%r16, [%r6 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec3ae020  ! 209: STD_I	std	%r22, [%r11 + 0x0020]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe40b2000  ! 211: LDUB_I	ldub	[%r12 + 0x0000], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe822c008  ! 214: STW_R	stw	%r20, [%r11 + %r8]
	.word 0xe4728008  ! 215: STX_R	stx	%r18, [%r10 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe41b2038  ! 218: LDD_I	ldd	[%r12 + 0x0038], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec41e018  ! 220: LDSW_I	ldsw	[%r7 + 0x0018], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe821c008  ! 223: STW_R	stw	%r20, [%r7 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe839a020  ! 225: STD_I	std	%r20, [%r6 + 0x0020]
	.word 0xe051e020  ! 226: LDSH_I	ldsh	[%r7 + 0x0020], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4334008  ! 228: STH_R	sth	%r18, [%r13 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec730008  ! 231: STX_R	stx	%r22, [%r12 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec12e028  ! 233: LDUH_I	lduh	[%r11 + 0x0028], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe0118008  ! 235: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe00b6018  ! 236: LDUB_I	ldub	[%r13 + 0x0018], %r16
	.word 0xec732000  ! 237: STX_I	stx	%r22, [%r12 + 0x0000]
	.word 0xe40ac008  ! 238: LDUB_R	ldub	[%r11 + %r8], %r18
	.word 0xe4398008  ! 239: STD_R	std	%r18, [%r6 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe031a010  ! 243: STH_I	sth	%r16, [%r6 + 0x0010]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee000, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe011a008  ! 249: LDUH_I	lduh	[%r6 + 0x0008], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe852e038  ! 251: LDSH_I	ldsh	[%r11 + 0x0038], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0328008  ! 255: STH_R	sth	%r16, [%r10 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe03aa038  ! 259: STD_I	std	%r16, [%r10 + 0x0038]
	.word 0xe0218008  ! 260: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe809e010  ! 261: LDUB_I	ldub	[%r7 + 0x0010], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8318008  ! 264: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xa099a028  ! 265: XORcc_I	xorcc 	%r6, 0x0028, %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec3aa030  ! 268: STD_I	std	%r22, [%r10 + 0x0030]
	.word 0xe43b0008  ! 269: STD_R	std	%r18, [%r12 + %r8]
	setx	0x00000000d01ee0c0, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d04ef0c0, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d06ef0c0, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe459a010  ! 272: LDX_I	ldx	[%r6 + 0x0010], %r18
	.word 0xe41b0008  ! 273: LDD_R	ldd	[%r12 + %r8], %r18
	.word 0xe032a028  ! 274: STH_I	sth	%r16, [%r10 + 0x0028]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe85a8008  ! 277: LDX_R	ldx	[%r10 + %r8], %r20
	setx	0x00000000d01ee100, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03aa008  ! 280: STD_I	std	%r16, [%r10 + 0x0008]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe429e030  ! 283: STB_I	stb	%r18, [%r7 + 0x0030]
	.word 0xe4018008  ! 284: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xe022c008  ! 285: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xe8134008  ! 286: LDUH_R	lduh	[%r13 + %r8], %r20
	.word 0xec3ac008  ! 287: STD_R	std	%r22, [%r11 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec31c008  ! 289: STH_R	sth	%r22, [%r7 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa089a000  ! 293: ANDcc_I	andcc 	%r6, 0x0000, %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec0a8008  ! 296: LDUB_R	ldub	[%r10 + %r8], %r22
	.word 0xe4532038  ! 297: LDSH_I	ldsh	[%r12 + 0x0038], %r18
	.word 0xe052c008  ! 298: LDSH_R	ldsh	[%r11 + %r8], %r16
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_22:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02ae028  ! 5: STB_I	stb	%r16, [%r11 + 0x0028]
	.word 0xe029a018  ! 7: STB_I	stb	%r16, [%r6 + 0x0018]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8334008  ! 9: STH_R	sth	%r20, [%r13 + %r8]
	.word 0xe04b8008  ! 10: LDSB_R	ldsb	[%r14 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe4718008  ! 12: STX_R	stx	%r18, [%r6 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4438008  ! 15: LDSW_R	ldsw	[%r14 + %r8], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec32e038  ! 17: STH_I	sth	%r22, [%r11 + 0x0038]
	.word 0xec3ae030  ! 18: STD_I	std	%r22, [%r11 + 0x0030]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec21a020  ! 20: STW_I	stw	%r22, [%r6 + 0x0020]
	.word 0xec49a000  ! 21: LDSB_I	ldsb	[%r6 + 0x0000], %r22
	.word 0xe0238008  ! 22: STW_R	stw	%r16, [%r14 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0232028  ! 24: STW_I	stw	%r16, [%r12 + 0x0028]
	.word 0xe8038008  ! 25: LDUW_R	lduw	[%r14 + %r8], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4598008  ! 27: LDX_R	ldx	[%r6 + %r8], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4330008  ! 31: STH_R	sth	%r18, [%r12 + %r8]
	.word 0xe4518008  ! 33: LDSH_R	ldsh	[%r6 + %r8], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0438008  ! 36: LDSW_R	ldsw	[%r14 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec332008  ! 38: STH_I	sth	%r22, [%r12 + 0x0008]
	.word 0xe022e010  ! 39: STW_I	stw	%r16, [%r11 + 0x0010]
	setx	0x00000000d02ef080, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d04ef180, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d06ef040, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82b4008  ! 44: STB_R	stb	%r20, [%r13 + %r8]
	.word 0xec11a038  ! 45: LDUH_I	lduh	[%r6 + 0x0038], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0730008  ! 49: STX_R	stx	%r16, [%r12 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe42ae010  ! 56: STB_I	stb	%r18, [%r11 + 0x0010]
	.word 0xe022c008  ! 57: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xe4734008  ! 58: STX_R	stx	%r18, [%r13 + %r8]
	.word 0xe05b6028  ! 59: LDX_I	ldx	[%r13 + 0x0028], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe041a020  ! 61: LDSW_I	ldsw	[%r6 + 0x0020], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0128008  ! 63: LDUH_R	lduh	[%r10 + %r8], %r16
	.word 0xe0730008  ! 64: STX_R	stx	%r16, [%r12 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe85ac008  ! 67: LDX_R	ldx	[%r11 + %r8], %r20
	.word 0xe03b0008  ! 68: STD_R	std	%r16, [%r12 + %r8]
	.word 0xe44ae038  ! 69: LDSB_I	ldsb	[%r11 + 0x0038], %r18
	.word 0xe032c008  ! 70: STH_R	sth	%r16, [%r11 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec736020  ! 72: STX_I	stx	%r22, [%r13 + 0x0020]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe042a000  ! 78: LDSW_I	ldsw	[%r10 + 0x0000], %r16
	.word 0xe41b0008  ! 79: LDD_R	ldd	[%r12 + %r8], %r18
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe05aa010  ! 81: LDX_I	ldx	[%r10 + 0x0010], %r16
	.word 0xec318008  ! 82: STH_R	sth	%r22, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe431e018  ! 86: STH_I	sth	%r18, [%r7 + 0x0018]
	.word 0xec032008  ! 87: LDUW_I	lduw	[%r12 + 0x0008], %r22
	.word 0xe0134008  ! 88: LDUH_R	lduh	[%r13 + %r8], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe821e018  ! 92: STW_I	stw	%r20, [%r7 + 0x0018]
	.word 0xe071e010  ! 93: STX_I	stx	%r16, [%r7 + 0x0010]
	setx	0x00000000d08e1140, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43b6000  ! 96: STD_I	std	%r18, [%r13 + 0x0000]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe421c008  ! 98: STW_R	stw	%r18, [%r7 + %r8]
	.word 0xac29a008  ! 99: ANDN_I	andn 	%r6, 0x0008, %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe02b0008  ! 102: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xe44ae030  ! 103: LDSB_I	ldsb	[%r11 + 0x0030], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec134008  ! 108: LDUH_R	lduh	[%r13 + %r8], %r22
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xac330008  ! 110: SUBC_R	orn 	%r12, %r8, %r22
	.word 0xec12c008  ! 111: LDUH_R	lduh	[%r11 + %r8], %r22
	.word 0xa041e038  ! 112: ADDC_I	addc 	%r7, 0x0038, %r16
	.word 0xe011a018  ! 113: LDUH_I	lduh	[%r6 + 0x0018], %r16
	.word 0xe8732008  ! 114: STX_I	stx	%r20, [%r12 + 0x0008]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0236030  ! 120: STW_I	stw	%r16, [%r13 + 0x0030]
	.word 0xec51a000  ! 121: LDSH_I	ldsh	[%r6 + 0x0000], %r22
	.word 0xe021a038  ! 122: STW_I	stw	%r16, [%r6 + 0x0038]
	.word 0xe8328008  ! 123: STH_R	sth	%r20, [%r10 + %r8]
	.word 0xe0330008  ! 124: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xe03b2030  ! 125: STD_I	std	%r16, [%r12 + 0x0030]
	.word 0xec732038  ! 126: STX_I	stx	%r22, [%r12 + 0x0038]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05b6020  ! 131: LDX_I	ldx	[%r13 + 0x0020], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e10c0, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e1100, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe042c008  ! 137: LDSW_R	ldsw	[%r11 + %r8], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe431a008  ! 140: STH_I	sth	%r18, [%r6 + 0x0008]
	.word 0xec0aa020  ! 141: LDUB_I	ldub	[%r10 + 0x0020], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa013a008  ! 147: OR_I	or 	%r14, 0x0008, %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe052c008  ! 149: LDSH_R	ldsh	[%r11 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe02ae018  ! 151: STB_I	stb	%r16, [%r11 + 0x0018]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe01ac008  ! 156: LDD_R	ldd	[%r11 + %r8], %r16
	.word 0xe40b0008  ! 157: LDUB_R	ldub	[%r12 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe432c008  ! 159: STH_R	sth	%r18, [%r11 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4732020  ! 163: STX_I	stx	%r18, [%r12 + 0x0020]
	.word 0xec098008  ! 165: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xe423a018  ! 166: STW_I	stw	%r18, [%r14 + 0x0018]
	.word 0xe049e028  ! 167: LDSB_I	ldsb	[%r7 + 0x0028], %r16
	.word 0xe82ae018  ! 168: STB_I	stb	%r20, [%r11 + 0x0018]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec32c008  ! 171: STH_R	sth	%r22, [%r11 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec19a000  ! 173: LDD_I	ldd	[%r6 + 0x0000], %r22
	.word 0xe03b2010  ! 174: STD_I	std	%r16, [%r12 + 0x0010]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe42ae010  ! 178: STB_I	stb	%r18, [%r11 + 0x0010]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01a8008  ! 181: LDD_R	ldd	[%r10 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec09c008  ! 185: LDUB_R	ldub	[%r7 + %r8], %r22
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec41a018  ! 187: LDSW_I	ldsw	[%r6 + 0x0018], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe4734008  ! 189: STX_R	stx	%r18, [%r13 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe803a008  ! 191: LDUW_I	lduw	[%r14 + 0x0008], %r20
	.word 0xe80b6028  ! 192: LDUB_I	ldub	[%r13 + 0x0028], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec39a038  ! 194: STD_I	std	%r22, [%r6 + 0x0038]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe451a000  ! 198: LDSH_I	ldsh	[%r6 + 0x0000], %r18
	.word 0xec4b2010  ! 199: LDSB_I	ldsb	[%r12 + 0x0010], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe073a030  ! 202: STX_I	stx	%r16, [%r14 + 0x0030]
	.word 0xe4218008  ! 203: STW_R	stw	%r18, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec218008  ! 207: STW_R	stw	%r22, [%r6 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec29a028  ! 209: STB_I	stb	%r22, [%r6 + 0x0028]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0498008  ! 211: LDSB_R	ldsb	[%r6 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe421a030  ! 214: STW_I	stw	%r18, [%r6 + 0x0030]
	.word 0xe8730008  ! 215: STX_R	stx	%r20, [%r12 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0198008  ! 218: LDD_R	ldd	[%r6 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe441c008  ! 220: LDSW_R	ldsw	[%r7 + %r8], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe02ae000  ! 223: STB_I	stb	%r16, [%r11 + 0x0000]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe8218008  ! 225: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xe049a008  ! 226: LDSB_I	ldsb	[%r6 + 0x0008], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec71a030  ! 228: STX_I	stx	%r22, [%r6 + 0x0030]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43b2018  ! 231: STD_I	std	%r18, [%r12 + 0x0018]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe05b0008  ! 233: LDX_R	ldx	[%r12 + %r8], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec43a028  ! 235: LDSW_I	ldsw	[%r14 + 0x0028], %r22
	.word 0xe01ae000  ! 236: LDD_I	ldd	[%r11 + 0x0000], %r16
	.word 0xe02b0008  ! 237: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xe8136020  ! 238: LDUH_I	lduh	[%r13 + 0x0020], %r20
	.word 0xe032e020  ! 239: STH_I	sth	%r16, [%r11 + 0x0020]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec21c008  ! 243: STW_R	stw	%r22, [%r7 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee040, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0132020  ! 249: LDUH_I	lduh	[%r12 + 0x0020], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe051a010  ! 251: LDSH_I	ldsh	[%r6 + 0x0010], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03b4008  ! 255: STD_R	std	%r16, [%r13 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0718008  ! 259: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe831a008  ! 260: STH_I	sth	%r20, [%r6 + 0x0008]
	.word 0xe8130008  ! 261: LDUH_R	lduh	[%r12 + %r8], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec3b6010  ! 264: STD_I	std	%r22, [%r13 + 0x0010]
	.word 0xac42c008  ! 265: ADDC_R	addc 	%r11, %r8, %r22
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe02ba038  ! 268: STB_I	stb	%r16, [%r14 + 0x0038]
	.word 0xe071c008  ! 269: STX_R	stx	%r16, [%r7 + %r8]
	setx	0x00000000d01ee140, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d04ef0c0, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef140, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe449a010  ! 272: LDSB_I	ldsb	[%r6 + 0x0010], %r18
	.word 0xe05b6030  ! 273: LDX_I	ldx	[%r13 + 0x0030], %r16
	.word 0xe822c008  ! 274: STW_R	stw	%r20, [%r11 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec032000  ! 277: LDUW_I	lduw	[%r12 + 0x0000], %r22
	setx	0x00000000d01ee140, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03aa038  ! 280: STD_I	std	%r16, [%r10 + 0x0038]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe831a030  ! 283: STH_I	sth	%r20, [%r6 + 0x0030]
	.word 0xe402e010  ! 284: LDUW_I	lduw	[%r11 + 0x0010], %r18
	.word 0xe4236020  ! 285: STW_I	stw	%r18, [%r13 + 0x0020]
	.word 0xe40ac008  ! 286: LDUB_R	ldub	[%r11 + %r8], %r18
	.word 0xe839a018  ! 287: STD_I	std	%r20, [%r6 + 0x0018]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe82b0008  ! 289: STB_R	stb	%r20, [%r12 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa41ba018  ! 293: XOR_I	xor 	%r14, 0x0018, %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec42e000  ! 296: LDSW_I	ldsw	[%r11 + 0x0000], %r22
	.word 0xe41b4008  ! 297: LDD_R	ldd	[%r13 + %r8], %r18
	.word 0xe0018008  ! 298: LDUW_R	lduw	[%r6 + %r8], %r16
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_21:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8334008  ! 5: STH_R	sth	%r20, [%r13 + %r8]
	.word 0xe4738008  ! 7: STX_R	stx	%r18, [%r14 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec71a000  ! 9: STX_I	stx	%r22, [%r6 + 0x0000]
	.word 0xe4118008  ! 10: LDUH_R	lduh	[%r6 + %r8], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe4230008  ! 12: STW_R	stw	%r18, [%r12 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe001a028  ! 15: LDUW_I	lduw	[%r6 + 0x0028], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8728008  ! 17: STX_R	stx	%r20, [%r10 + %r8]
	.word 0xec32e030  ! 18: STH_I	sth	%r22, [%r11 + 0x0030]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0730008  ! 20: STX_R	stx	%r16, [%r12 + %r8]
	.word 0xe843a030  ! 21: LDSW_I	ldsw	[%r14 + 0x0030], %r20
	.word 0xec31c008  ! 22: STH_R	sth	%r22, [%r7 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe029c008  ! 24: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe459a008  ! 25: LDX_I	ldx	[%r6 + 0x0008], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec036038  ! 27: LDUW_I	lduw	[%r13 + 0x0038], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe072c008  ! 31: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe41ba010  ! 33: LDD_I	ldd	[%r14 + 0x0010], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec41a000  ! 36: LDSW_I	ldsw	[%r6 + 0x0000], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe039a038  ! 38: STD_I	std	%r16, [%r6 + 0x0038]
	.word 0xe429c008  ! 39: STB_R	stb	%r18, [%r7 + %r8]
	setx	0x00000000d02ef180, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d04ef100, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d06ef1c0, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec734008  ! 44: STX_R	stx	%r22, [%r13 + %r8]
	.word 0xe001e030  ! 45: LDUW_I	lduw	[%r7 + 0x0030], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0328008  ! 49: STH_R	sth	%r16, [%r10 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe02ae000  ! 56: STB_I	stb	%r16, [%r11 + 0x0000]
	.word 0xe433a028  ! 57: STH_I	sth	%r18, [%r14 + 0x0028]
	.word 0xec2b4008  ! 58: STB_R	stb	%r22, [%r13 + %r8]
	.word 0xe8118008  ! 59: LDUH_R	lduh	[%r6 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4428008  ! 61: LDSW_R	ldsw	[%r10 + %r8], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4028008  ! 63: LDUW_R	lduw	[%r10 + %r8], %r18
	.word 0xe033a038  ! 64: STH_I	sth	%r16, [%r14 + 0x0038]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec41a000  ! 67: LDSW_I	ldsw	[%r6 + 0x0000], %r22
	.word 0xe4318008  ! 68: STH_R	sth	%r18, [%r6 + %r8]
	.word 0xe40aa008  ! 69: LDUB_I	ldub	[%r10 + 0x0008], %r18
	.word 0xe0398008  ! 70: STD_R	std	%r16, [%r6 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe472c008  ! 72: STX_R	stx	%r18, [%r11 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0536028  ! 78: LDSH_I	ldsh	[%r13 + 0x0028], %r16
	.word 0xe04ac008  ! 79: LDSB_R	ldsb	[%r11 + %r8], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec538008  ! 81: LDSH_R	ldsh	[%r14 + %r8], %r22
	.word 0xec332038  ! 82: STH_I	sth	%r22, [%r12 + 0x0038]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe83ba010  ! 86: STD_I	std	%r20, [%r14 + 0x0010]
	.word 0xe8032000  ! 87: LDUW_I	lduw	[%r12 + 0x0000], %r20
	.word 0xe443a020  ! 88: LDSW_I	ldsw	[%r14 + 0x0020], %r18
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03b6018  ! 92: STD_I	std	%r16, [%r13 + 0x0018]
	.word 0xec2ba020  ! 93: STB_I	stb	%r22, [%r14 + 0x0020]
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d08e1180, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e1140, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec228008  ! 96: STW_R	stw	%r22, [%r10 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec318008  ! 98: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xac11c008  ! 99: OR_R	or 	%r7, %r8, %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe83ae028  ! 102: STD_I	std	%r20, [%r11 + 0x0028]
	.word 0xe819e008  ! 103: LDD_I	ldd	[%r7 + 0x0008], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00b4008  ! 108: LDUB_R	ldub	[%r13 + %r8], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa0c2c008  ! 110: ADDCcc_R	addccc 	%r11, %r8, %r16
	.word 0xe442e020  ! 111: LDSW_I	ldsw	[%r11 + 0x0020], %r18
	.word 0xa882e020  ! 112: ADDcc_I	addcc 	%r11, 0x0020, %r20
	.word 0xec4a8008  ! 113: LDSB_R	ldsb	[%r10 + %r8], %r22
	.word 0xe423a030  ! 114: STW_I	stw	%r18, [%r14 + 0x0030]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4234008  ! 120: STW_R	stw	%r18, [%r13 + %r8]
	.word 0xec534008  ! 121: LDSH_R	ldsh	[%r13 + %r8], %r22
	.word 0xe839a028  ! 122: STD_I	std	%r20, [%r6 + 0x0028]
	.word 0xe071a030  ! 123: STX_I	stx	%r16, [%r6 + 0x0030]
	.word 0xe0232030  ! 124: STW_I	stw	%r16, [%r12 + 0x0030]
	.word 0xe022e018  ! 125: STW_I	stw	%r16, [%r11 + 0x0018]
	.word 0xe02b0008  ! 126: STB_R	stb	%r16, [%r12 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe002c008  ! 131: LDUW_R	lduw	[%r11 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e11c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d08e10c0, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d08e1140, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec03a030  ! 137: LDUW_I	lduw	[%r14 + 0x0030], %r22
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4318008  ! 140: STH_R	sth	%r18, [%r6 + %r8]
	.word 0xe8030008  ! 141: LDUW_R	lduw	[%r12 + %r8], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xac030008  ! 147: ADD_R	add 	%r12, %r8, %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec19a008  ! 149: LDD_I	ldd	[%r6 + 0x0008], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe872e010  ! 151: STX_I	stx	%r20, [%r11 + 0x0010]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe00b8008  ! 156: LDUB_R	ldub	[%r14 + %r8], %r16
	.word 0xe042a038  ! 157: LDSW_I	ldsw	[%r10 + 0x0038], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe429a010  ! 159: STB_I	stb	%r18, [%r6 + 0x0010]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe83ae010  ! 163: STD_I	std	%r20, [%r11 + 0x0010]
	.word 0xe859a000  ! 165: LDX_I	ldx	[%r6 + 0x0000], %r20
	.word 0xec21a020  ! 166: STW_I	stw	%r22, [%r6 + 0x0020]
	.word 0xe00b6030  ! 167: LDUB_I	ldub	[%r13 + 0x0030], %r16
	.word 0xe8234008  ! 168: STW_R	stw	%r20, [%r13 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec2ba000  ! 171: STB_I	stb	%r22, [%r14 + 0x0000]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0418008  ! 173: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe8728008  ! 174: STX_R	stx	%r20, [%r10 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe471a000  ! 178: STX_I	stx	%r18, [%r6 + 0x0000]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe40b4008  ! 181: LDUB_R	ldub	[%r13 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0018008  ! 185: LDUW_R	lduw	[%r6 + %r8], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec4a8008  ! 187: LDSB_R	ldsb	[%r10 + %r8], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe839a010  ! 189: STD_I	std	%r20, [%r6 + 0x0010]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe052a000  ! 191: LDSH_I	ldsh	[%r10 + 0x0000], %r16
	.word 0xe80ba030  ! 192: LDUB_I	ldub	[%r14 + 0x0030], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe073a008  ! 194: STX_I	stx	%r16, [%r14 + 0x0008]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec498008  ! 198: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xe042c008  ! 199: LDSW_R	ldsw	[%r11 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe42ae000  ! 202: STB_I	stb	%r18, [%r11 + 0x0000]
	.word 0xe0298008  ! 203: STB_R	stb	%r16, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe42aa008  ! 207: STB_I	stb	%r18, [%r10 + 0x0008]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec332038  ! 209: STH_I	sth	%r22, [%r12 + 0x0038]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec1ac008  ! 211: LDD_R	ldd	[%r11 + %r8], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe4230008  ! 214: STW_R	stw	%r18, [%r12 + %r8]
	.word 0xe822e030  ! 215: STW_I	stw	%r20, [%r11 + 0x0030]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe411e020  ! 218: LDUH_I	lduh	[%r7 + 0x0020], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0438008  ! 220: LDSW_R	ldsw	[%r14 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0334008  ! 223: STH_R	sth	%r16, [%r13 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0738008  ! 225: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xec138008  ! 226: LDUH_R	lduh	[%r14 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43ae008  ! 228: STD_I	std	%r18, [%r11 + 0x0008]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0730008  ! 231: STX_R	stx	%r16, [%r12 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe00ba010  ! 233: LDUB_I	ldub	[%r14 + 0x0010], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe0418008  ! 235: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe051a028  ! 236: LDSH_I	ldsh	[%r6 + 0x0028], %r16
	.word 0xe02b6038  ! 237: STB_I	stb	%r16, [%r13 + 0x0038]
	.word 0xec136000  ! 238: LDUH_I	lduh	[%r13 + 0x0000], %r22
	.word 0xe872c008  ! 239: STX_R	stx	%r20, [%r11 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe871a018  ! 243: STX_I	stx	%r20, [%r6 + 0x0018]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee000, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe441e000  ! 249: LDSW_I	ldsw	[%r7 + 0x0000], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0038008  ! 251: LDUW_R	lduw	[%r14 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4218008  ! 255: STW_R	stw	%r18, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe832a008  ! 259: STH_I	sth	%r20, [%r10 + 0x0008]
	.word 0xe029e038  ! 260: STB_I	stb	%r16, [%r7 + 0x0038]
	.word 0xe41b4008  ! 261: LDD_R	ldd	[%r13 + %r8], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe072e018  ! 264: STX_I	stx	%r16, [%r11 + 0x0018]
	.word 0xa4998008  ! 265: XORcc_R	xorcc 	%r6, %r8, %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe82aa000  ! 268: STB_I	stb	%r20, [%r10 + 0x0000]
	.word 0xe032a018  ! 269: STH_I	sth	%r16, [%r10 + 0x0018]
	setx	0x00000000d01ee140, %r1, %r6
	setx	0x00000000d02ef0c0, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d04ef040, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0028008  ! 272: LDUW_R	lduw	[%r10 + %r8], %r16
	.word 0xe0438008  ! 273: LDSW_R	ldsw	[%r14 + %r8], %r16
	.word 0xe4730008  ! 274: STX_R	stx	%r18, [%r12 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe001e010  ! 277: LDUW_I	lduw	[%r7 + 0x0010], %r16
	setx	0x00000000d01ee0c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2b6038  ! 280: STB_I	stb	%r22, [%r13 + 0x0038]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec2a8008  ! 283: STB_R	stb	%r22, [%r10 + %r8]
	.word 0xec09e038  ! 284: LDUB_I	ldub	[%r7 + 0x0038], %r22
	.word 0xe42b8008  ! 285: STB_R	stb	%r18, [%r14 + %r8]
	.word 0xe00ae028  ! 286: LDUB_I	ldub	[%r11 + 0x0028], %r16
	.word 0xec318008  ! 287: STH_R	sth	%r22, [%r6 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe839a008  ! 289: STD_I	std	%r20, [%r6 + 0x0008]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa4118008  ! 293: OR_R	or 	%r6, %r8, %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe001c008  ! 296: LDUW_R	lduw	[%r7 + %r8], %r16
	.word 0xe002e020  ! 297: LDUW_I	lduw	[%r11 + 0x0020], %r16
	.word 0xe412c008  ! 298: LDUH_R	lduh	[%r11 + %r8], %r18
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_20:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0334008  ! 5: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xe0718008  ! 7: STX_R	stx	%r16, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8298008  ! 9: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xec036018  ! 10: LDUW_I	lduw	[%r13 + 0x0018], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe8236010  ! 12: STW_I	stw	%r20, [%r13 + 0x0010]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe44a8008  ! 15: LDSB_R	ldsb	[%r10 + %r8], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0718008  ! 17: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe42a8008  ! 18: STB_R	stb	%r18, [%r10 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0228008  ! 20: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xec19a010  ! 21: LDD_I	ldd	[%r6 + 0x0010], %r22
	.word 0xe039a028  ! 22: STD_I	std	%r16, [%r6 + 0x0028]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe422a000  ! 24: STW_I	stw	%r18, [%r10 + 0x0000]
	.word 0xe852c008  ! 25: LDSH_R	ldsh	[%r11 + %r8], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0432018  ! 27: LDSW_I	ldsw	[%r12 + 0x0018], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0318008  ! 31: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe01b6038  ! 33: LDD_I	ldd	[%r13 + 0x0038], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe019c008  ! 36: LDD_R	ldd	[%r7 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4330008  ! 38: STH_R	sth	%r18, [%r12 + %r8]
	.word 0xe431a028  ! 39: STH_I	sth	%r18, [%r6 + 0x0028]
	setx	0x00000000d02ef080, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d04ef1c0, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d06ef180, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0330008  ! 44: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xec498008  ! 45: LDSB_R	ldsb	[%r6 + %r8], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0734008  ! 49: STX_R	stx	%r16, [%r13 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe072a008  ! 56: STX_I	stx	%r16, [%r10 + 0x0008]
	.word 0xe039c008  ! 57: STD_R	std	%r16, [%r7 + %r8]
	.word 0xe472e008  ! 58: STX_I	stx	%r18, [%r11 + 0x0008]
	.word 0xe05b2020  ! 59: LDX_I	ldx	[%r12 + 0x0020], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4436008  ! 61: LDSW_I	ldsw	[%r13 + 0x0008], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec19e028  ! 63: LDD_I	ldd	[%r7 + 0x0028], %r22
	.word 0xe0338008  ! 64: STH_R	sth	%r16, [%r14 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe002c008  ! 67: LDUW_R	lduw	[%r11 + %r8], %r16
	.word 0xe03ba008  ! 68: STD_I	std	%r16, [%r14 + 0x0008]
	.word 0xe45aa000  ! 69: LDX_I	ldx	[%r10 + 0x0000], %r18
	.word 0xe0336010  ! 70: STH_I	sth	%r16, [%r13 + 0x0010]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4236010  ! 72: STW_I	stw	%r18, [%r13 + 0x0010]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec02c008  ! 78: LDUW_R	lduw	[%r11 + %r8], %r22
	.word 0xe019a020  ! 79: LDD_I	ldd	[%r6 + 0x0020], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe059a028  ! 81: LDX_I	ldx	[%r6 + 0x0028], %r16
	.word 0xe0230008  ! 82: STW_R	stw	%r16, [%r12 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec3ae000  ! 86: STD_I	std	%r22, [%r11 + 0x0000]
	.word 0xe851e030  ! 87: LDSH_I	ldsh	[%r7 + 0x0030], %r20
	.word 0xe40b6030  ! 88: LDUB_I	ldub	[%r13 + 0x0030], %r18
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42b0008  ! 92: STB_R	stb	%r18, [%r12 + %r8]
	.word 0xe03b2038  ! 93: STD_I	std	%r16, [%r12 + 0x0038]
	setx	0x00000000d08e1040, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d08e1140, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e1040, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83b2028  ! 96: STD_I	std	%r20, [%r12 + 0x0028]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021c008  ! 98: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xac31a010  ! 99: SUBC_I	orn 	%r6, 0x0010, %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0336008  ! 102: STH_I	sth	%r16, [%r13 + 0x0008]
	.word 0xe0136028  ! 103: LDUH_I	lduh	[%r13 + 0x0028], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec034008  ! 108: LDUW_R	lduw	[%r13 + %r8], %r22
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xacab6028  ! 110: ANDNcc_I	andncc 	%r13, 0x0028, %r22
	.word 0xe449e008  ! 111: LDSB_I	ldsb	[%r7 + 0x0008], %r18
	.word 0xa4b9c008  ! 112: XNORcc_R	xnorcc 	%r7, %r8, %r18
	.word 0xe0498008  ! 113: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe8730008  ! 114: STX_R	stx	%r20, [%r12 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0318008  ! 120: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe81b8008  ! 121: LDD_R	ldd	[%r14 + %r8], %r20
	.word 0xec236010  ! 122: STW_I	stw	%r22, [%r13 + 0x0010]
	.word 0xec334008  ! 123: STH_R	sth	%r22, [%r13 + %r8]
	.word 0xec32a030  ! 124: STH_I	sth	%r22, [%r10 + 0x0030]
	.word 0xe021e028  ! 125: STW_I	stw	%r16, [%r7 + 0x0028]
	.word 0xe4298008  ! 126: STB_R	stb	%r18, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01a8008  ! 131: LDD_R	ldd	[%r10 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e1180, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e10c0, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d08e1180, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe45b4008  ! 137: LDX_R	ldx	[%r13 + %r8], %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe439c008  ! 140: STD_R	std	%r18, [%r7 + %r8]
	.word 0xe412e030  ! 141: LDUH_I	lduh	[%r11 + 0x0030], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa8bb2008  ! 147: XNORcc_I	xnorcc 	%r12, 0x0008, %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec19c008  ! 149: LDD_R	ldd	[%r7 + %r8], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec29e010  ! 151: STB_I	stb	%r22, [%r7 + 0x0010]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe813a030  ! 156: LDUH_I	lduh	[%r14 + 0x0030], %r20
	.word 0xe05b0008  ! 157: LDX_R	ldx	[%r12 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0738008  ! 159: STX_R	stx	%r16, [%r14 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe031c008  ! 163: STH_R	sth	%r16, [%r7 + %r8]
	.word 0xe442e008  ! 165: LDSW_I	ldsw	[%r11 + 0x0008], %r18
	.word 0xec2ba018  ! 166: STB_I	stb	%r22, [%r14 + 0x0018]
	.word 0xec536018  ! 167: LDSH_I	ldsh	[%r13 + 0x0018], %r22
	.word 0xe071a018  ! 168: STX_I	stx	%r16, [%r6 + 0x0018]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec732030  ! 171: STX_I	stx	%r22, [%r12 + 0x0030]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe059a028  ! 173: LDX_I	ldx	[%r6 + 0x0028], %r16
	.word 0xec3b0008  ! 174: STD_R	std	%r22, [%r12 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe8730008  ! 178: STX_R	stx	%r20, [%r12 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01ba020  ! 181: LDD_I	ldd	[%r14 + 0x0020], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec0ac008  ! 185: LDUB_R	ldub	[%r11 + %r8], %r22
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe049a030  ! 187: LDSB_I	ldsb	[%r6 + 0x0030], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec2ac008  ! 189: STB_R	stb	%r22, [%r11 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe009a030  ! 191: LDUB_I	ldub	[%r6 + 0x0030], %r16
	.word 0xec528008  ! 192: LDSH_R	ldsh	[%r10 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe429e030  ! 194: STB_I	stb	%r18, [%r7 + 0x0030]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec5b6018  ! 198: LDX_I	ldx	[%r13 + 0x0018], %r22
	.word 0xe842e010  ! 199: LDSW_I	ldsw	[%r11 + 0x0010], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4238008  ! 202: STW_R	stw	%r18, [%r14 + %r8]
	.word 0xec33a030  ! 203: STH_I	sth	%r22, [%r14 + 0x0030]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe021e020  ! 207: STW_I	stw	%r16, [%r7 + 0x0020]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0736028  ! 209: STX_I	stx	%r16, [%r13 + 0x0028]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4018008  ! 211: LDUW_R	lduw	[%r6 + %r8], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec3b6028  ! 214: STD_I	std	%r22, [%r13 + 0x0028]
	.word 0xe072e038  ! 215: STX_I	stx	%r16, [%r11 + 0x0038]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0018008  ! 218: LDUW_R	lduw	[%r6 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0528008  ! 220: LDSH_R	ldsh	[%r10 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0298008  ! 223: STB_R	stb	%r16, [%r6 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe429e010  ! 225: STB_I	stb	%r18, [%r7 + 0x0010]
	.word 0xe0598008  ! 226: LDX_R	ldx	[%r6 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe422e018  ! 228: STW_I	stw	%r18, [%r11 + 0x0018]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe821a010  ! 231: STW_I	stw	%r20, [%r6 + 0x0010]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe849e000  ! 233: LDSB_I	ldsb	[%r7 + 0x0000], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe002a010  ! 235: LDUW_I	lduw	[%r10 + 0x0010], %r16
	.word 0xe049a030  ! 236: LDSB_I	ldsb	[%r6 + 0x0030], %r16
	.word 0xe029e028  ! 237: STB_I	stb	%r16, [%r7 + 0x0028]
	.word 0xe852e038  ! 238: LDSH_I	ldsh	[%r11 + 0x0038], %r20
	.word 0xe43b8008  ! 239: STD_R	std	%r18, [%r14 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8298008  ! 243: STB_R	stb	%r20, [%r6 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee180, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01ae008  ! 249: LDD_I	ldd	[%r11 + 0x0008], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe051a018  ! 251: LDSH_I	ldsh	[%r6 + 0x0018], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42ae000  ! 255: STB_I	stb	%r18, [%r11 + 0x0000]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe031c008  ! 259: STH_R	sth	%r16, [%r7 + %r8]
	.word 0xe033a028  ! 260: STH_I	sth	%r16, [%r14 + 0x0028]
	.word 0xe01a8008  ! 261: LDD_R	ldd	[%r10 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe832c008  ! 264: STH_R	sth	%r20, [%r11 + %r8]
	.word 0xa0b2a030  ! 265: ORNcc_I	orncc 	%r10, 0x0030, %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe831a030  ! 268: STH_I	sth	%r20, [%r6 + 0x0030]
	.word 0xe43b8008  ! 269: STD_R	std	%r18, [%r14 + %r8]
	setx	0x00000000d01ee140, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d04ef1c0, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d06ef1c0, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe409e008  ! 272: LDUB_I	ldub	[%r7 + 0x0008], %r18
	.word 0xec51c008  ! 273: LDSH_R	ldsh	[%r7 + %r8], %r22
	.word 0xec3ac008  ! 274: STD_R	std	%r22, [%r11 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec4aa008  ! 277: LDSB_I	ldsb	[%r10 + 0x0008], %r22
	setx	0x00000000d01ee180, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0218008  ! 280: STW_R	stw	%r16, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe432e020  ! 283: STH_I	sth	%r18, [%r11 + 0x0020]
	.word 0xe80ac008  ! 284: LDUB_R	ldub	[%r11 + %r8], %r20
	.word 0xe0718008  ! 285: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe4530008  ! 286: LDSH_R	ldsh	[%r12 + %r8], %r18
	.word 0xe0230008  ! 287: STW_R	stw	%r16, [%r12 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe03b6030  ! 289: STD_I	std	%r16, [%r13 + 0x0030]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0a1a030  ! 293: SUBcc_I	subcc 	%r6, 0x0030, %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe009a020  ! 296: LDUB_I	ldub	[%r6 + 0x0020], %r16
	.word 0xec0a8008  ! 297: LDUB_R	ldub	[%r10 + %r8], %r22
	.word 0xec5b8008  ! 298: LDX_R	ldx	[%r14 + %r8], %r22
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_19:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe839e020  ! 5: STD_I	std	%r20, [%r7 + 0x0020]
	.word 0xe031a028  ! 7: STH_I	sth	%r16, [%r6 + 0x0028]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0298008  ! 9: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe45b0008  ! 10: LDX_R	ldx	[%r12 + %r8], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe031a018  ! 12: STH_I	sth	%r16, [%r6 + 0x0018]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe04b4008  ! 15: LDSB_R	ldsb	[%r13 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec336008  ! 17: STH_I	sth	%r22, [%r13 + 0x0008]
	.word 0xe839a020  ! 18: STD_I	std	%r20, [%r6 + 0x0020]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0232018  ! 20: STW_I	stw	%r16, [%r12 + 0x0018]
	.word 0xec198008  ! 21: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xe029e038  ! 22: STB_I	stb	%r16, [%r7 + 0x0038]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec332000  ! 24: STH_I	sth	%r22, [%r12 + 0x0000]
	.word 0xe8598008  ! 25: LDX_R	ldx	[%r6 + %r8], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe401e000  ! 27: LDUW_I	lduw	[%r7 + 0x0000], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe871e020  ! 31: STX_I	stx	%r20, [%r7 + 0x0020]
	.word 0xe8528008  ! 33: LDSH_R	ldsh	[%r10 + %r8], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe042e038  ! 36: LDSW_I	ldsw	[%r11 + 0x0038], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe42b2018  ! 38: STB_I	stb	%r18, [%r12 + 0x0018]
	.word 0xe42b0008  ! 39: STB_R	stb	%r18, [%r12 + %r8]
	setx	0x00000000d02ef1c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d04ef000, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d06ef140, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02ac008  ! 44: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xe051a008  ! 45: LDSH_I	ldsh	[%r6 + 0x0008], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02b4008  ! 49: STB_R	stb	%r16, [%r13 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8736010  ! 56: STX_I	stx	%r20, [%r13 + 0x0010]
	.word 0xe43ae030  ! 57: STD_I	std	%r18, [%r11 + 0x0030]
	.word 0xe4228008  ! 58: STW_R	stw	%r18, [%r10 + %r8]
	.word 0xe00aa018  ! 59: LDUB_I	ldub	[%r10 + 0x0018], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec198008  ! 61: LDD_R	ldd	[%r6 + %r8], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe409a020  ! 63: LDUB_I	ldub	[%r6 + 0x0020], %r18
	.word 0xe439e010  ! 64: STD_I	std	%r18, [%r7 + 0x0010]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05b4008  ! 67: LDX_R	ldx	[%r13 + %r8], %r16
	.word 0xe0218008  ! 68: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe44a8008  ! 69: LDSB_R	ldsb	[%r10 + %r8], %r18
	.word 0xe4732020  ! 70: STX_I	stx	%r18, [%r12 + 0x0020]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec71c008  ! 72: STX_R	stx	%r22, [%r7 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0138008  ! 78: LDUH_R	lduh	[%r14 + %r8], %r16
	.word 0xe44a8008  ! 79: LDSB_R	ldsb	[%r10 + %r8], %r18
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe011a010  ! 81: LDUH_I	lduh	[%r6 + 0x0010], %r16
	.word 0xe0718008  ! 82: STX_R	stx	%r16, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe022e028  ! 86: STW_I	stw	%r16, [%r11 + 0x0028]
	.word 0xe41ae038  ! 87: LDD_I	ldd	[%r11 + 0x0038], %r18
	.word 0xec5b8008  ! 88: LDX_R	ldx	[%r14 + %r8], %r22
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0298008  ! 92: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xec218008  ! 93: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x00000000d08e10c0, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d08e1040, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e1080, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021a018  ! 96: STW_I	stw	%r16, [%r6 + 0x0018]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43b6010  ! 98: STD_I	std	%r18, [%r13 + 0x0010]
	.word 0xa8334008  ! 99: ORN_R	orn 	%r13, %r8, %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec2a8008  ! 102: STB_R	stb	%r22, [%r10 + %r8]
	.word 0xe059e000  ! 103: LDX_I	ldx	[%r7 + 0x0000], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe041e038  ! 108: LDSW_I	ldsw	[%r7 + 0x0038], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xacb18008  ! 110: SUBCcc_R	orncc 	%r6, %r8, %r22
	.word 0xec52c008  ! 111: LDSH_R	ldsh	[%r11 + %r8], %r22
	.word 0xa402a028  ! 112: ADD_I	add 	%r10, 0x0028, %r18
	.word 0xe00b6020  ! 113: LDUB_I	ldub	[%r13 + 0x0020], %r16
	.word 0xe4298008  ! 114: STB_R	stb	%r18, [%r6 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe871a020  ! 120: STX_I	stx	%r20, [%r6 + 0x0020]
	.word 0xec03a038  ! 121: LDUW_I	lduw	[%r14 + 0x0038], %r22
	.word 0xe071c008  ! 122: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xec318008  ! 123: STH_R	sth	%r22, [%r6 + %r8]
	.word 0xe8228008  ! 124: STW_R	stw	%r20, [%r10 + %r8]
	.word 0xec2b4008  ! 125: STB_R	stb	%r22, [%r13 + %r8]
	.word 0xe03aa038  ! 126: STD_I	std	%r16, [%r10 + 0x0038]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05ac008  ! 131: LDX_R	ldx	[%r11 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e1180, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e1100, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d08e1100, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe44b6000  ! 137: LDSB_I	ldsb	[%r13 + 0x0000], %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec718008  ! 140: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe0138008  ! 141: LDUH_R	lduh	[%r14 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa03ae020  ! 147: XNOR_I	xnor 	%r11, 0x0020, %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec52e038  ! 149: LDSH_I	ldsh	[%r11 + 0x0038], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe4234008  ! 151: STW_R	stw	%r18, [%r13 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe45ac008  ! 156: LDX_R	ldx	[%r11 + %r8], %r18
	.word 0xe049a020  ! 157: LDSB_I	ldsb	[%r6 + 0x0020], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec718008  ! 159: STX_R	stx	%r22, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe03ac008  ! 163: STD_R	std	%r16, [%r11 + %r8]
	.word 0xe4532030  ! 165: LDSH_I	ldsh	[%r12 + 0x0030], %r18
	.word 0xe072e000  ! 166: STX_I	stx	%r16, [%r11 + 0x0000]
	.word 0xe00ac008  ! 167: LDUB_R	ldub	[%r11 + %r8], %r16
	.word 0xe032a030  ! 168: STH_I	sth	%r16, [%r10 + 0x0030]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe03aa018  ! 171: STD_I	std	%r16, [%r10 + 0x0018]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec02e030  ! 173: LDUW_I	lduw	[%r11 + 0x0030], %r22
	.word 0xe0218008  ! 174: STW_R	stw	%r16, [%r6 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe031a010  ! 178: STH_I	sth	%r16, [%r6 + 0x0010]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec51e018  ! 181: LDSH_I	ldsh	[%r7 + 0x0018], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe45b0008  ! 185: LDX_R	ldx	[%r12 + %r8], %r18
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec01e000  ! 187: LDUW_I	lduw	[%r7 + 0x0000], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe42ba020  ! 189: STB_I	stb	%r18, [%r14 + 0x0020]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8118008  ! 191: LDUH_R	lduh	[%r6 + %r8], %r20
	.word 0xe012c008  ! 192: LDUH_R	lduh	[%r11 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec398008  ! 194: STD_R	std	%r22, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe851e020  ! 198: LDSH_I	ldsh	[%r7 + 0x0020], %r20
	.word 0xe011a028  ! 199: LDUH_I	lduh	[%r6 + 0x0028], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe471a020  ! 202: STX_I	stx	%r18, [%r6 + 0x0020]
	.word 0xe4298008  ! 203: STB_R	stb	%r18, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec2b0008  ! 207: STB_R	stb	%r22, [%r12 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe02ba030  ! 209: STB_I	stb	%r16, [%r14 + 0x0030]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec12a038  ! 211: LDUH_I	lduh	[%r10 + 0x0038], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec3b6010  ! 214: STD_I	std	%r22, [%r13 + 0x0010]
	.word 0xe02b4008  ! 215: STB_R	stb	%r16, [%r13 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8434008  ! 218: LDSW_R	ldsw	[%r13 + %r8], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec11a018  ! 220: LDUH_I	lduh	[%r6 + 0x0018], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe42aa010  ! 223: STB_I	stb	%r18, [%r10 + 0x0010]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe8734008  ! 225: STX_R	stx	%r20, [%r13 + %r8]
	.word 0xe002a030  ! 226: LDUW_I	lduw	[%r10 + 0x0030], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029a038  ! 228: STB_I	stb	%r16, [%r6 + 0x0038]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe422a008  ! 231: STW_I	stw	%r18, [%r10 + 0x0008]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe45b6008  ! 233: LDX_I	ldx	[%r13 + 0x0008], %r18
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe80ac008  ! 235: LDUB_R	ldub	[%r11 + %r8], %r20
	.word 0xe0034008  ! 236: LDUW_R	lduw	[%r13 + %r8], %r16
	.word 0xe0732008  ! 237: STX_I	stx	%r16, [%r12 + 0x0008]
	.word 0xe01b6038  ! 238: LDD_I	ldd	[%r13 + 0x0038], %r16
	.word 0xe431c008  ! 239: STH_R	sth	%r18, [%r7 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8334008  ! 243: STH_R	sth	%r20, [%r13 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee000, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe819c008  ! 249: LDD_R	ldd	[%r7 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0018008  ! 251: LDUW_R	lduw	[%r6 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0336030  ! 255: STH_I	sth	%r16, [%r13 + 0x0030]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec3ac008  ! 259: STD_R	std	%r22, [%r11 + %r8]
	.word 0xe8236008  ! 260: STW_I	stw	%r20, [%r13 + 0x0008]
	.word 0xe0436010  ! 261: LDSW_I	ldsw	[%r13 + 0x0010], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4328008  ! 264: STH_R	sth	%r18, [%r10 + %r8]
	.word 0xa49b8008  ! 265: XORcc_R	xorcc 	%r14, %r8, %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe8736038  ! 268: STX_I	stx	%r20, [%r13 + 0x0038]
	.word 0xe0332028  ! 269: STH_I	sth	%r16, [%r12 + 0x0028]
	setx	0x00000000d01ee040, %r1, %r6
	setx	0x00000000d02ef000, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d04ef040, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d06ef040, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe802c008  ! 272: LDUW_R	lduw	[%r11 + %r8], %r20
	.word 0xe41a8008  ! 273: LDD_R	ldd	[%r10 + %r8], %r18
	.word 0xe023a030  ! 274: STW_I	stw	%r16, [%r14 + 0x0030]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4438008  ! 277: LDSW_R	ldsw	[%r14 + %r8], %r18
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0734008  ! 280: STX_R	stx	%r16, [%r13 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8238008  ! 283: STW_R	stw	%r20, [%r14 + %r8]
	.word 0xe0098008  ! 284: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe039a020  ! 285: STD_I	std	%r16, [%r6 + 0x0020]
	.word 0xe05aa028  ! 286: LDX_I	ldx	[%r10 + 0x0028], %r16
	.word 0xe42b8008  ! 287: STB_R	stb	%r18, [%r14 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe4732018  ! 289: STX_I	stx	%r18, [%r12 + 0x0018]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xac828008  ! 293: ADDcc_R	addcc 	%r10, %r8, %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe809a008  ! 296: LDUB_I	ldub	[%r6 + 0x0008], %r20
	.word 0xe00b0008  ! 297: LDUB_R	ldub	[%r12 + %r8], %r16
	.word 0xe04ba028  ! 298: LDSB_I	ldsb	[%r14 + 0x0028], %r16
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_18:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0738008  ! 5: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe0338008  ! 7: STH_R	sth	%r16, [%r14 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02b4008  ! 9: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xec49c008  ! 10: LDSB_R	ldsb	[%r7 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe839a000  ! 12: STD_I	std	%r20, [%r6 + 0x0000]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe052c008  ! 15: LDSH_R	ldsh	[%r11 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe072e010  ! 17: STX_I	stx	%r16, [%r11 + 0x0010]
	.word 0xe032e018  ! 18: STH_I	sth	%r16, [%r11 + 0x0018]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0736020  ! 20: STX_I	stx	%r16, [%r13 + 0x0020]
	.word 0xe449e008  ! 21: LDSB_I	ldsb	[%r7 + 0x0008], %r18
	.word 0xe831c008  ! 22: STH_R	sth	%r20, [%r7 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0338008  ! 24: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xec11a030  ! 25: LDUH_I	lduh	[%r6 + 0x0030], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec138008  ! 27: LDUH_R	lduh	[%r14 + %r8], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe822a008  ! 31: STW_I	stw	%r20, [%r10 + 0x0008]
	.word 0xe85b4008  ! 33: LDX_R	ldx	[%r13 + %r8], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe059a030  ! 36: LDX_I	ldx	[%r6 + 0x0030], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8218008  ! 38: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xe0232028  ! 39: STW_I	stw	%r16, [%r12 + 0x0028]
	setx	0x00000000d02ef0c0, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d04ef100, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d06ef1c0, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0730008  ! 44: STX_R	stx	%r16, [%r12 + %r8]
	.word 0xe85b2010  ! 45: LDX_I	ldx	[%r12 + 0x0010], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4328008  ! 49: STH_R	sth	%r18, [%r10 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0218008  ! 56: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe4398008  ! 57: STD_R	std	%r18, [%r6 + %r8]
	.word 0xec2ac008  ! 58: STB_R	stb	%r22, [%r11 + %r8]
	.word 0xec41e030  ! 59: LDSW_I	ldsw	[%r7 + 0x0030], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec534008  ! 61: LDSH_R	ldsh	[%r13 + %r8], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01ae030  ! 63: LDD_I	ldd	[%r11 + 0x0030], %r16
	.word 0xec2b8008  ! 64: STB_R	stb	%r22, [%r14 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec098008  ! 67: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xe0330008  ! 68: STH_R	sth	%r16, [%r12 + %r8]
	.word 0xe8032038  ! 69: LDUW_I	lduw	[%r12 + 0x0038], %r20
	.word 0xec330008  ! 70: STH_R	sth	%r22, [%r12 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4234008  ! 72: STW_R	stw	%r18, [%r13 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec01c008  ! 78: LDUW_R	lduw	[%r7 + %r8], %r22
	.word 0xe851e018  ! 79: LDSH_I	ldsh	[%r7 + 0x0018], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe05b0008  ! 81: LDX_R	ldx	[%r12 + %r8], %r16
	.word 0xe839e028  ! 82: STD_I	std	%r20, [%r7 + 0x0028]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe072e008  ! 86: STX_I	stx	%r16, [%r11 + 0x0008]
	.word 0xe841e000  ! 87: LDSW_I	ldsw	[%r7 + 0x0000], %r20
	.word 0xe8038008  ! 88: LDUW_R	lduw	[%r14 + %r8], %r20
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42ac008  ! 92: STB_R	stb	%r18, [%r11 + %r8]
	.word 0xe871e010  ! 93: STX_I	stx	%r20, [%r7 + 0x0010]
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d08e10c0, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d08e1000, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec728008  ! 96: STX_R	stx	%r22, [%r10 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0736008  ! 98: STX_I	stx	%r16, [%r13 + 0x0008]
	.word 0xa4818008  ! 99: ADDcc_R	addcc 	%r6, %r8, %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec3b8008  ! 102: STD_R	std	%r22, [%r14 + %r8]
	.word 0xe0518008  ! 103: LDSH_R	ldsh	[%r6 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe051e008  ! 108: LDSH_I	ldsh	[%r7 + 0x0008], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa48a8008  ! 110: ANDcc_R	andcc 	%r10, %r8, %r18
	.word 0xe05b0008  ! 111: LDX_R	ldx	[%r12 + %r8], %r16
	.word 0xac230008  ! 112: SUB_R	sub 	%r12, %r8, %r22
	.word 0xe803a020  ! 113: LDUW_I	lduw	[%r14 + 0x0020], %r20
	.word 0xe031c008  ! 114: STH_R	sth	%r16, [%r7 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe072c008  ! 120: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe04b0008  ! 121: LDSB_R	ldsb	[%r12 + %r8], %r16
	.word 0xe0718008  ! 122: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe03b4008  ! 123: STD_R	std	%r16, [%r13 + %r8]
	.word 0xe021c008  ! 124: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xe872a028  ! 125: STX_I	stx	%r20, [%r10 + 0x0028]
	.word 0xe03b4008  ! 126: STD_R	std	%r16, [%r13 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe809a028  ! 131: LDUB_I	ldub	[%r6 + 0x0028], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e1000, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe019a020  ! 137: LDD_I	ldd	[%r6 + 0x0020], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4398008  ! 140: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe00ac008  ! 141: LDUB_R	ldub	[%r11 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0030008  ! 147: ADD_R	add 	%r12, %r8, %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe05b6038  ! 149: LDX_I	ldx	[%r13 + 0x0038], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec730008  ! 151: STX_R	stx	%r22, [%r12 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe012a038  ! 156: LDUH_I	lduh	[%r10 + 0x0038], %r16
	.word 0xe0098008  ! 157: LDUB_R	ldub	[%r6 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe42b8008  ! 159: STB_R	stb	%r18, [%r14 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe02b0008  ! 163: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xec198008  ! 165: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xe82b0008  ! 166: STB_R	stb	%r20, [%r12 + %r8]
	.word 0xe019a020  ! 167: LDD_I	ldd	[%r6 + 0x0020], %r16
	.word 0xe82ac008  ! 168: STB_R	stb	%r20, [%r11 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec3b0008  ! 171: STD_R	std	%r22, [%r12 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe402c008  ! 173: LDUW_R	lduw	[%r11 + %r8], %r18
	.word 0xe0228008  ! 174: STW_R	stw	%r16, [%r10 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe832c008  ! 178: STH_R	sth	%r20, [%r11 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe40b6000  ! 181: LDUB_I	ldub	[%r13 + 0x0000], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec1b8008  ! 185: LDD_R	ldd	[%r14 + %r8], %r22
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01ac008  ! 187: LDD_R	ldd	[%r11 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe43aa030  ! 189: STD_I	std	%r18, [%r10 + 0x0030]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe809a030  ! 191: LDUB_I	ldub	[%r6 + 0x0030], %r20
	.word 0xec41a028  ! 192: LDSW_I	ldsw	[%r6 + 0x0028], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe42ac008  ! 194: STB_R	stb	%r18, [%r11 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe001a030  ! 198: LDUW_I	lduw	[%r6 + 0x0030], %r16
	.word 0xec4ac008  ! 199: LDSB_R	ldsb	[%r11 + %r8], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe432e038  ! 202: STH_I	sth	%r18, [%r11 + 0x0038]
	.word 0xe43b0008  ! 203: STD_R	std	%r18, [%r12 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec338008  ! 207: STH_R	sth	%r22, [%r14 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0336000  ! 209: STH_I	sth	%r16, [%r13 + 0x0000]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe442e038  ! 211: LDSW_I	ldsw	[%r11 + 0x0038], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe032c008  ! 214: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe871a030  ! 215: STX_I	stx	%r20, [%r6 + 0x0030]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8132000  ! 218: LDUH_I	lduh	[%r12 + 0x0000], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe001e008  ! 220: LDUW_I	lduw	[%r7 + 0x0008], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe071c008  ! 223: STX_R	stx	%r16, [%r7 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec328008  ! 225: STH_R	sth	%r22, [%r10 + %r8]
	.word 0xec41c008  ! 226: LDSW_R	ldsw	[%r7 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec298008  ! 228: STB_R	stb	%r22, [%r6 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0738008  ! 231: STX_R	stx	%r16, [%r14 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe85a8008  ! 233: LDX_R	ldx	[%r10 + %r8], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe049e000  ! 235: LDSB_I	ldsb	[%r7 + 0x0000], %r16
	.word 0xec0ac008  ! 236: LDUB_R	ldub	[%r11 + %r8], %r22
	.word 0xe0728008  ! 237: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe41ac008  ! 238: LDD_R	ldd	[%r11 + %r8], %r18
	.word 0xe0728008  ! 239: STX_R	stx	%r16, [%r10 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0228008  ! 243: STW_R	stw	%r16, [%r10 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee180, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe84b8008  ! 249: LDSB_R	ldsb	[%r14 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe40b6000  ! 251: LDUB_I	ldub	[%r13 + 0x0000], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82b2010  ! 255: STB_I	stb	%r20, [%r12 + 0x0010]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8236038  ! 259: STW_I	stw	%r20, [%r13 + 0x0038]
	.word 0xe0298008  ! 260: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe8430008  ! 261: LDSW_R	ldsw	[%r12 + %r8], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8718008  ! 264: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xac9b4008  ! 265: XORcc_R	xorcc 	%r13, %r8, %r22
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe03b4008  ! 268: STD_R	std	%r16, [%r13 + %r8]
	.word 0xec2b8008  ! 269: STB_R	stb	%r22, [%r14 + %r8]
	setx	0x00000000d01ee140, %r1, %r6
	setx	0x00000000d02ef140, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d04ef1c0, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d06ef140, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0518008  ! 272: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe00b0008  ! 273: LDUB_R	ldub	[%r12 + %r8], %r16
	.word 0xec23a028  ! 274: STW_I	stw	%r22, [%r14 + 0x0028]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe441c008  ! 277: LDSW_R	ldsw	[%r7 + %r8], %r18
	setx	0x00000000d01ee0c0, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0732010  ! 280: STX_I	stx	%r16, [%r12 + 0x0010]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0298008  ! 283: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe01ae000  ! 284: LDD_I	ldd	[%r11 + 0x0000], %r16
	.word 0xe022e028  ! 285: STW_I	stw	%r16, [%r11 + 0x0028]
	.word 0xe0028008  ! 286: LDUW_R	lduw	[%r10 + %r8], %r16
	.word 0xe029a018  ! 287: STB_I	stb	%r16, [%r6 + 0x0018]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe8332020  ! 289: STH_I	sth	%r20, [%r12 + 0x0020]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0bac008  ! 293: XNORcc_R	xnorcc 	%r11, %r8, %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe85b4008  ! 296: LDX_R	ldx	[%r13 + %r8], %r20
	.word 0xe44b0008  ! 297: LDSB_R	ldsb	[%r12 + %r8], %r18
	.word 0xec59e038  ! 298: LDX_I	ldx	[%r7 + 0x0038], %r22
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_17:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0234008  ! 5: STW_R	stw	%r16, [%r13 + %r8]
	.word 0xec3ac008  ! 7: STD_R	std	%r22, [%r11 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43b8008  ! 9: STD_R	std	%r18, [%r14 + %r8]
	.word 0xe0136018  ! 10: LDUH_I	lduh	[%r13 + 0x0018], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec232018  ! 12: STW_I	stw	%r22, [%r12 + 0x0018]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe84b0008  ! 15: LDSB_R	ldsb	[%r12 + %r8], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4298008  ! 17: STB_R	stb	%r18, [%r6 + %r8]
	.word 0xe0732000  ! 18: STX_I	stx	%r16, [%r12 + 0x0000]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4718008  ! 20: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xe05ae028  ! 21: LDX_I	ldx	[%r11 + 0x0028], %r16
	.word 0xe8236038  ! 22: STW_I	stw	%r20, [%r13 + 0x0038]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe02ae008  ! 24: STB_I	stb	%r16, [%r11 + 0x0008]
	.word 0xe4498008  ! 25: LDSB_R	ldsb	[%r6 + %r8], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe001c008  ! 27: LDUW_R	lduw	[%r7 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe072a010  ! 31: STX_I	stx	%r16, [%r10 + 0x0010]
	.word 0xe041a010  ! 33: LDSW_I	ldsw	[%r6 + 0x0010], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe40ae020  ! 36: LDUB_I	ldub	[%r11 + 0x0020], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe82aa018  ! 38: STB_I	stb	%r20, [%r10 + 0x0018]
	.word 0xe0734008  ! 39: STX_R	stx	%r16, [%r13 + %r8]
	setx	0x00000000d02ef1c0, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d04ef0c0, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d06ef000, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe823a010  ! 44: STW_I	stw	%r20, [%r14 + 0x0010]
	.word 0xe812c008  ! 45: LDUH_R	lduh	[%r11 + %r8], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82b0008  ! 49: STB_R	stb	%r20, [%r12 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe022e030  ! 56: STW_I	stw	%r16, [%r11 + 0x0030]
	.word 0xe071c008  ! 57: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xe0318008  ! 58: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe45b8008  ! 59: LDX_R	ldx	[%r14 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0518008  ! 61: LDSH_R	ldsh	[%r6 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe41ae000  ! 63: LDD_I	ldd	[%r11 + 0x0000], %r18
	.word 0xec22e038  ! 64: STW_I	stw	%r22, [%r11 + 0x0038]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0418008  ! 67: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe029e030  ! 68: STB_I	stb	%r16, [%r7 + 0x0030]
	.word 0xe842e020  ! 69: LDSW_I	ldsw	[%r11 + 0x0020], %r20
	.word 0xe021a018  ! 70: STW_I	stw	%r16, [%r6 + 0x0018]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0718008  ! 72: STX_R	stx	%r16, [%r6 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec032028  ! 78: LDUW_I	lduw	[%r12 + 0x0028], %r22
	.word 0xe45ac008  ! 79: LDX_R	ldx	[%r11 + %r8], %r18
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe402e038  ! 81: LDUW_I	lduw	[%r11 + 0x0038], %r18
	.word 0xe471a030  ! 82: STX_I	stx	%r18, [%r6 + 0x0030]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0328008  ! 86: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xe4136010  ! 87: LDUH_I	lduh	[%r13 + 0x0010], %r18
	.word 0xe011a018  ! 88: LDUH_I	lduh	[%r6 + 0x0018], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8328008  ! 92: STH_R	sth	%r20, [%r10 + %r8]
	.word 0xec39a030  ! 93: STD_I	std	%r22, [%r6 + 0x0030]
	setx	0x00000000d08e1180, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d08e10c0, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe839a018  ! 96: STD_I	std	%r20, [%r6 + 0x0018]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe031e010  ! 98: STH_I	sth	%r16, [%r7 + 0x0010]
	.word 0xa021e008  ! 99: SUB_I	sub 	%r7, 0x0008, %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0298008  ! 102: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe8498008  ! 103: LDSB_R	ldsb	[%r6 + %r8], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe042a008  ! 108: LDSW_I	ldsw	[%r10 + 0x0008], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa40ae028  ! 110: AND_I	and 	%r11, 0x0028, %r18
	.word 0xec032008  ! 111: LDUW_I	lduw	[%r12 + 0x0008], %r22
	.word 0xa029a018  ! 112: ANDN_I	andn 	%r6, 0x0018, %r16
	.word 0xe04b8008  ! 113: LDSB_R	ldsb	[%r14 + %r8], %r16
	.word 0xe82b6018  ! 114: STB_I	stb	%r20, [%r13 + 0x0018]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8338008  ! 120: STH_R	sth	%r20, [%r14 + %r8]
	.word 0xe012a030  ! 121: LDUH_I	lduh	[%r10 + 0x0030], %r16
	.word 0xe0238008  ! 122: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe4332028  ! 123: STH_I	sth	%r18, [%r12 + 0x0028]
	.word 0xec31e030  ! 124: STH_I	sth	%r22, [%r7 + 0x0030]
	.word 0xe839c008  ! 125: STD_R	std	%r20, [%r7 + %r8]
	.word 0xe871a028  ! 126: STX_I	stx	%r20, [%r6 + 0x0028]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8130008  ! 131: LDUH_R	lduh	[%r12 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e10c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d08e1180, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d08e1100, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe049c008  ! 137: LDSB_R	ldsb	[%r7 + %r8], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe421a028  ! 140: STW_I	stw	%r18, [%r6 + 0x0028]
	.word 0xec128008  ! 141: LDUH_R	lduh	[%r10 + %r8], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa082a028  ! 147: ADDcc_I	addcc 	%r10, 0x0028, %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe85ae010  ! 149: LDX_I	ldx	[%r11 + 0x0010], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe43ba010  ! 151: STD_I	std	%r18, [%r14 + 0x0010]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe80b2030  ! 156: LDUB_I	ldub	[%r12 + 0x0030], %r20
	.word 0xec4b2030  ! 157: LDSB_I	ldsb	[%r12 + 0x0030], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec2b2038  ! 159: STB_I	stb	%r22, [%r12 + 0x0038]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0298008  ! 163: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe019c008  ! 165: LDD_R	ldd	[%r7 + %r8], %r16
	.word 0xe0718008  ! 166: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe05ae000  ! 167: LDX_I	ldx	[%r11 + 0x0000], %r16
	.word 0xe43aa030  ! 168: STD_I	std	%r18, [%r10 + 0x0030]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec2b4008  ! 171: STB_R	stb	%r22, [%r13 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe452c008  ! 173: LDSH_R	ldsh	[%r11 + %r8], %r18
	.word 0xec3a8008  ! 174: STD_R	std	%r22, [%r10 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe471a008  ! 178: STX_I	stx	%r18, [%r6 + 0x0008]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0198008  ! 181: LDD_R	ldd	[%r6 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01aa028  ! 185: LDD_I	ldd	[%r10 + 0x0028], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0518008  ! 187: LDSH_R	ldsh	[%r6 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe021c008  ! 189: STW_R	stw	%r16, [%r7 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04b6038  ! 191: LDSB_I	ldsb	[%r13 + 0x0038], %r16
	.word 0xe013a028  ! 192: LDUH_I	lduh	[%r14 + 0x0028], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe021e008  ! 194: STW_I	stw	%r16, [%r7 + 0x0008]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0038008  ! 198: LDUW_R	lduw	[%r14 + %r8], %r16
	.word 0xec436030  ! 199: LDSW_I	ldsw	[%r13 + 0x0030], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe072c008  ! 202: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe02b6018  ! 203: STB_I	stb	%r16, [%r13 + 0x0018]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec718008  ! 207: STX_R	stx	%r22, [%r6 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe4318008  ! 209: STH_R	sth	%r18, [%r6 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe80ac008  ! 211: LDUB_R	ldub	[%r11 + %r8], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe071a000  ! 214: STX_I	stx	%r16, [%r6 + 0x0000]
	.word 0xe02b4008  ! 215: STB_R	stb	%r16, [%r13 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe00b0008  ! 218: LDUB_R	ldub	[%r12 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00b2028  ! 220: LDUB_I	ldub	[%r12 + 0x0028], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec29a000  ! 223: STB_I	stb	%r22, [%r6 + 0x0000]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe03b8008  ! 225: STD_R	std	%r16, [%r14 + %r8]
	.word 0xe019c008  ! 226: LDD_R	ldd	[%r7 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0736028  ! 228: STX_I	stx	%r16, [%r13 + 0x0028]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe472e008  ! 231: STX_I	stx	%r18, [%r11 + 0x0008]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0018008  ! 233: LDUW_R	lduw	[%r6 + %r8], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec19a030  ! 235: LDD_I	ldd	[%r6 + 0x0030], %r22
	.word 0xec128008  ! 236: LDUH_R	lduh	[%r10 + %r8], %r22
	.word 0xe8228008  ! 237: STW_R	stw	%r20, [%r10 + %r8]
	.word 0xe8198008  ! 238: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xe82b4008  ! 239: STB_R	stb	%r20, [%r13 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2aa018  ! 243: STB_I	stb	%r22, [%r10 + 0x0018]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee140, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0598008  ! 249: LDX_R	ldx	[%r6 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe80ac008  ! 251: LDUB_R	ldub	[%r11 + %r8], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029a018  ! 255: STB_I	stb	%r16, [%r6 + 0x0018]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec3ac008  ! 259: STD_R	std	%r22, [%r11 + %r8]
	.word 0xe4728008  ! 260: STX_R	stx	%r18, [%r10 + %r8]
	.word 0xe80b4008  ! 261: LDUB_R	ldub	[%r13 + %r8], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8318008  ! 264: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xa0b1a000  ! 265: SUBCcc_I	orncc 	%r6, 0x0000, %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4330008  ! 268: STH_R	sth	%r18, [%r12 + %r8]
	.word 0xec72e020  ! 269: STX_I	stx	%r22, [%r11 + 0x0020]
	setx	0x00000000d01ee000, %r1, %r6
	setx	0x00000000d02ef140, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d04ef1c0, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d06ef180, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4032020  ! 272: LDUW_I	lduw	[%r12 + 0x0020], %r18
	.word 0xe809e030  ! 273: LDUB_I	ldub	[%r7 + 0x0030], %r20
	.word 0xec718008  ! 274: STX_R	stx	%r22, [%r6 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec130008  ! 277: LDUH_R	lduh	[%r12 + %r8], %r22
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe821e028  ! 280: STW_I	stw	%r20, [%r7 + 0x0028]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe039a000  ! 283: STD_I	std	%r16, [%r6 + 0x0000]
	.word 0xec4ae030  ! 284: LDSB_I	ldsb	[%r11 + 0x0030], %r22
	.word 0xe871c008  ! 285: STX_R	stx	%r20, [%r7 + %r8]
	.word 0xe01aa018  ! 286: LDD_I	ldd	[%r10 + 0x0018], %r16
	.word 0xe029a020  ! 287: STB_I	stb	%r16, [%r6 + 0x0020]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec33a020  ! 289: STH_I	sth	%r22, [%r14 + 0x0020]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa8332000  ! 293: ORN_I	orn 	%r12, 0x0000, %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec4a8008  ! 296: LDSB_R	ldsb	[%r10 + %r8], %r22
	.word 0xe01ac008  ! 297: LDD_R	ldd	[%r11 + %r8], %r16
	.word 0xec09c008  ! 298: LDUB_R	ldub	[%r7 + %r8], %r22
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_16:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec39e008  ! 5: STD_I	std	%r22, [%r7 + 0x0008]
	.word 0xe0238008  ! 7: STW_R	stw	%r16, [%r14 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe031c008  ! 9: STH_R	sth	%r16, [%r7 + %r8]
	.word 0xe0436038  ! 10: LDSW_I	ldsw	[%r13 + 0x0038], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec234008  ! 12: STW_R	stw	%r22, [%r13 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe80aa020  ! 15: LDUB_I	ldub	[%r10 + 0x0020], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43b4008  ! 17: STD_R	std	%r18, [%r13 + %r8]
	.word 0xe0318008  ! 18: STH_R	sth	%r16, [%r6 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe839c008  ! 20: STD_R	std	%r20, [%r7 + %r8]
	.word 0xec1a8008  ! 21: LDD_R	ldd	[%r10 + %r8], %r22
	.word 0xe021e008  ! 22: STW_I	stw	%r16, [%r7 + 0x0008]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec718008  ! 24: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe84b0008  ! 25: LDSB_R	ldsb	[%r12 + %r8], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec01c008  ! 27: LDUW_R	lduw	[%r7 + %r8], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe831a000  ! 31: STH_I	sth	%r20, [%r6 + 0x0000]
	.word 0xe052e030  ! 33: LDSH_I	ldsh	[%r11 + 0x0030], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe84b4008  ! 36: LDSB_R	ldsb	[%r13 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe431a020  ! 38: STH_I	sth	%r18, [%r6 + 0x0020]
	.word 0xe02a8008  ! 39: STB_R	stb	%r16, [%r10 + %r8]
	setx	0x00000000d02ef000, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d04ef040, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d06ef080, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe839a010  ! 44: STD_I	std	%r20, [%r6 + 0x0010]
	.word 0xec1a8008  ! 45: LDD_R	ldd	[%r10 + %r8], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4736020  ! 49: STX_I	stx	%r18, [%r13 + 0x0020]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec736038  ! 56: STX_I	stx	%r22, [%r13 + 0x0038]
	.word 0xe0736030  ! 57: STX_I	stx	%r16, [%r13 + 0x0030]
	.word 0xe02ae020  ! 58: STB_I	stb	%r16, [%r11 + 0x0020]
	.word 0xe81b6028  ! 59: LDD_I	ldd	[%r13 + 0x0028], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8528008  ! 61: LDSH_R	ldsh	[%r10 + %r8], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0518008  ! 63: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe0718008  ! 64: STX_R	stx	%r16, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe819e038  ! 67: LDD_I	ldd	[%r7 + 0x0038], %r20
	.word 0xe8232028  ! 68: STW_I	stw	%r20, [%r12 + 0x0028]
	.word 0xe01b0008  ! 69: LDD_R	ldd	[%r12 + %r8], %r16
	.word 0xe4218008  ! 70: STW_R	stw	%r18, [%r6 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec298008  ! 72: STB_R	stb	%r22, [%r6 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe449c008  ! 78: LDSB_R	ldsb	[%r7 + %r8], %r18
	.word 0xe05ae010  ! 79: LDX_I	ldx	[%r11 + 0x0010], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe41b2018  ! 81: LDD_I	ldd	[%r12 + 0x0018], %r18
	.word 0xe0238008  ! 82: STW_R	stw	%r16, [%r14 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe82ac008  ! 86: STB_R	stb	%r20, [%r11 + %r8]
	.word 0xe859a030  ! 87: LDX_I	ldx	[%r6 + 0x0030], %r20
	.word 0xe409a030  ! 88: LDUB_I	ldub	[%r6 + 0x0030], %r18
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec336028  ! 92: STH_I	sth	%r22, [%r13 + 0x0028]
	.word 0xe43ba000  ! 93: STD_I	std	%r18, [%r14 + 0x0000]
	setx	0x00000000d08e1180, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d08e1080, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe071e020  ! 96: STX_I	stx	%r16, [%r7 + 0x0020]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4318008  ! 98: STH_R	sth	%r18, [%r6 + %r8]
	.word 0xa00a8008  ! 99: AND_R	and 	%r10, %r8, %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0228008  ! 102: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xe8098008  ! 103: LDUB_R	ldub	[%r6 + %r8], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe45a8008  ! 108: LDX_R	ldx	[%r10 + %r8], %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa0c2a030  ! 110: ADDCcc_I	addccc 	%r10, 0x0030, %r16
	.word 0xe8598008  ! 111: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xac33a008  ! 112: SUBC_I	orn 	%r14, 0x0008, %r22
	.word 0xe041a030  ! 113: LDSW_I	ldsw	[%r6 + 0x0030], %r16
	.word 0xe03b0008  ! 114: STD_R	std	%r16, [%r12 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8718008  ! 120: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe001a000  ! 121: LDUW_I	lduw	[%r6 + 0x0000], %r16
	.word 0xe02b6038  ! 122: STB_I	stb	%r16, [%r13 + 0x0038]
	.word 0xe4298008  ! 123: STB_R	stb	%r18, [%r6 + %r8]
	.word 0xe02b8008  ! 124: STB_R	stb	%r16, [%r14 + %r8]
	.word 0xe071e030  ! 125: STX_I	stx	%r16, [%r7 + 0x0030]
	.word 0xe4298008  ! 126: STB_R	stb	%r18, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec19a020  ! 131: LDD_I	ldd	[%r6 + 0x0020], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e10c0, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e1180, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d08e1180, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8418008  ! 137: LDSW_R	ldsw	[%r6 + %r8], %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe8318008  ! 140: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xec52c008  ! 141: LDSH_R	ldsh	[%r11 + %r8], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa421e010  ! 147: SUB_I	sub 	%r7, 0x0010, %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0198008  ! 149: LDD_R	ldd	[%r6 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec29a000  ! 151: STB_I	stb	%r22, [%r6 + 0x0000]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe44b8008  ! 156: LDSB_R	ldsb	[%r14 + %r8], %r18
	.word 0xe05b2010  ! 157: LDX_I	ldx	[%r12 + 0x0010], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8718008  ! 159: STX_R	stx	%r20, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe021e000  ! 163: STW_I	stw	%r16, [%r7 + 0x0000]
	.word 0xe052a000  ! 165: LDSH_I	ldsh	[%r10 + 0x0000], %r16
	.word 0xe431e000  ! 166: STH_I	sth	%r18, [%r7 + 0x0000]
	.word 0xec098008  ! 167: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xe0230008  ! 168: STW_R	stw	%r16, [%r12 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec734008  ! 171: STX_R	stx	%r22, [%r13 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0038008  ! 173: LDUW_R	lduw	[%r14 + %r8], %r16
	.word 0xe832e038  ! 174: STH_I	sth	%r20, [%r11 + 0x0038]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe8218008  ! 178: STW_R	stw	%r20, [%r6 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05b6030  ! 181: LDX_I	ldx	[%r13 + 0x0030], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4134008  ! 185: LDUH_R	lduh	[%r13 + %r8], %r18
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe042c008  ! 187: LDSW_R	ldsw	[%r11 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe83ac008  ! 189: STD_R	std	%r20, [%r11 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec4a8008  ! 191: LDSB_R	ldsb	[%r10 + %r8], %r22
	.word 0xe00b6038  ! 192: LDUB_I	ldub	[%r13 + 0x0038], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec298008  ! 194: STB_R	stb	%r22, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe819a030  ! 198: LDD_I	ldd	[%r6 + 0x0030], %r20
	.word 0xe8498008  ! 199: LDSB_R	ldsb	[%r6 + %r8], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe42b0008  ! 202: STB_R	stb	%r18, [%r12 + %r8]
	.word 0xe431e018  ! 203: STH_I	sth	%r18, [%r7 + 0x0018]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8398008  ! 207: STD_R	std	%r20, [%r6 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0738008  ! 209: STX_R	stx	%r16, [%r14 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe051a038  ! 211: LDSH_I	ldsh	[%r6 + 0x0038], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec3ae010  ! 214: STD_I	std	%r22, [%r11 + 0x0010]
	.word 0xe033a008  ! 215: STH_I	sth	%r16, [%r14 + 0x0008]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe05a8008  ! 218: LDX_R	ldx	[%r10 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec02e018  ! 220: LDUW_I	lduw	[%r11 + 0x0018], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe02ba008  ! 223: STB_I	stb	%r16, [%r14 + 0x0008]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec3a8008  ! 225: STD_R	std	%r22, [%r10 + %r8]
	.word 0xe042a020  ! 226: LDSW_I	ldsw	[%r10 + 0x0020], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4298008  ! 228: STB_R	stb	%r18, [%r6 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe039c008  ! 231: STD_R	std	%r16, [%r7 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe041e038  ! 233: LDSW_I	ldsw	[%r7 + 0x0038], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe8538008  ! 235: LDSH_R	ldsh	[%r14 + %r8], %r20
	.word 0xe412c008  ! 236: LDUH_R	lduh	[%r11 + %r8], %r18
	.word 0xe021c008  ! 237: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xe04b4008  ! 238: LDSB_R	ldsb	[%r13 + %r8], %r16
	.word 0xe029e000  ! 239: STB_I	stb	%r16, [%r7 + 0x0000]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec21c008  ! 243: STW_R	stw	%r22, [%r7 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee180, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec018008  ! 249: LDUW_R	lduw	[%r6 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0132000  ! 251: LDUH_I	lduh	[%r12 + 0x0000], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0736018  ! 255: STX_I	stx	%r16, [%r13 + 0x0018]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe03b8008  ! 259: STD_R	std	%r16, [%r14 + %r8]
	.word 0xe073a030  ! 260: STX_I	stx	%r16, [%r14 + 0x0030]
	.word 0xe85b8008  ! 261: LDX_R	ldx	[%r14 + %r8], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe82b6038  ! 264: STB_I	stb	%r20, [%r13 + 0x0038]
	.word 0xa002e000  ! 265: ADD_I	add 	%r11, 0x0000, %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe83b6038  ! 268: STD_I	std	%r20, [%r13 + 0x0038]
	.word 0xe039a000  ! 269: STD_I	std	%r16, [%r6 + 0x0000]
	setx	0x00000000d01ee040, %r1, %r6
	setx	0x00000000d02ef000, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d04ef180, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef100, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe411a028  ! 272: LDUH_I	lduh	[%r6 + 0x0028], %r18
	.word 0xe00b2030  ! 273: LDUB_I	ldub	[%r12 + 0x0030], %r16
	.word 0xec3b2038  ! 274: STD_I	std	%r22, [%r12 + 0x0038]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8034008  ! 277: LDUW_R	lduw	[%r13 + %r8], %r20
	setx	0x00000000d01ee100, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec3b2038  ! 280: STD_I	std	%r22, [%r12 + 0x0038]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe42a8008  ! 283: STB_R	stb	%r18, [%r10 + %r8]
	.word 0xe80a8008  ! 284: LDUB_R	ldub	[%r10 + %r8], %r20
	.word 0xe8732018  ! 285: STX_I	stx	%r20, [%r12 + 0x0018]
	.word 0xe0034008  ! 286: LDUW_R	lduw	[%r13 + %r8], %r16
	.word 0xe02b6008  ! 287: STB_I	stb	%r16, [%r13 + 0x0008]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe03b0008  ! 289: STD_R	std	%r16, [%r12 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa03a8008  ! 293: XNOR_R	xnor 	%r10, %r8, %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05ba020  ! 296: LDX_I	ldx	[%r14 + 0x0020], %r16
	.word 0xe8530008  ! 297: LDSH_R	ldsh	[%r12 + %r8], %r20
	.word 0xec4b0008  ! 298: LDSB_R	ldsb	[%r12 + %r8], %r22
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_15:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe839a018  ! 5: STD_I	std	%r20, [%r6 + 0x0018]
	.word 0xe8718008  ! 7: STX_R	stx	%r20, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0232008  ! 9: STW_I	stw	%r16, [%r12 + 0x0008]
	.word 0xe051a028  ! 10: LDSH_I	ldsh	[%r6 + 0x0028], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe43b8008  ! 12: STD_R	std	%r18, [%r14 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe051c008  ! 15: LDSH_R	ldsh	[%r7 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe839a020  ! 17: STD_I	std	%r20, [%r6 + 0x0020]
	.word 0xe071e010  ! 18: STX_I	stx	%r16, [%r7 + 0x0010]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe821a010  ! 20: STW_I	stw	%r20, [%r6 + 0x0010]
	.word 0xe811c008  ! 21: LDUH_R	lduh	[%r7 + %r8], %r20
	.word 0xe031c008  ! 22: STH_R	sth	%r16, [%r7 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec29a008  ! 24: STB_I	stb	%r22, [%r6 + 0x0008]
	.word 0xe8018008  ! 25: LDUW_R	lduw	[%r6 + %r8], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0118008  ! 27: LDUH_R	lduh	[%r6 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0338008  ! 31: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xe00a8008  ! 33: LDUB_R	ldub	[%r10 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec018008  ! 36: LDUW_R	lduw	[%r6 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8718008  ! 38: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe4336000  ! 39: STH_I	sth	%r18, [%r13 + 0x0000]
	setx	0x00000000d02ef0c0, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d04ef1c0, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d06ef080, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe831c008  ! 44: STH_R	sth	%r20, [%r7 + %r8]
	.word 0xe0418008  ! 45: LDSW_R	ldsw	[%r6 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2b6018  ! 49: STB_I	stb	%r22, [%r13 + 0x0018]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe03b4008  ! 56: STD_R	std	%r16, [%r13 + %r8]
	.word 0xe0732000  ! 57: STX_I	stx	%r16, [%r12 + 0x0000]
	.word 0xec734008  ! 58: STX_R	stx	%r22, [%r13 + %r8]
	.word 0xe411a008  ! 59: LDUH_I	lduh	[%r6 + 0x0008], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe419e018  ! 61: LDD_I	ldd	[%r7 + 0x0018], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe80b8008  ! 63: LDUB_R	ldub	[%r14 + %r8], %r20
	.word 0xe0336028  ! 64: STH_I	sth	%r16, [%r13 + 0x0028]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4534008  ! 67: LDSH_R	ldsh	[%r13 + %r8], %r18
	.word 0xe42b0008  ! 68: STB_R	stb	%r18, [%r12 + %r8]
	.word 0xec41e020  ! 69: LDSW_I	ldsw	[%r7 + 0x0020], %r22
	.word 0xe43b8008  ! 70: STD_R	std	%r18, [%r14 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec29a010  ! 72: STB_I	stb	%r22, [%r6 + 0x0010]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0536028  ! 78: LDSH_I	ldsh	[%r13 + 0x0028], %r16
	.word 0xe4130008  ! 79: LDUH_R	lduh	[%r12 + %r8], %r18
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe842a028  ! 81: LDSW_I	ldsw	[%r10 + 0x0028], %r20
	.word 0xe43a8008  ! 82: STD_R	std	%r18, [%r10 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe039a010  ! 86: STD_I	std	%r16, [%r6 + 0x0010]
	.word 0xe043a038  ! 87: LDSW_I	ldsw	[%r14 + 0x0038], %r16
	.word 0xe812e030  ! 88: LDUH_I	lduh	[%r11 + 0x0030], %r20
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec71e038  ! 92: STX_I	stx	%r22, [%r7 + 0x0038]
	.word 0xe43b6030  ! 93: STD_I	std	%r18, [%r13 + 0x0030]
	setx	0x00000000d08e1040, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d08e1080, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d08e1100, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83ba018  ! 96: STD_I	std	%r20, [%r14 + 0x0018]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec31e008  ! 98: STH_I	sth	%r22, [%r7 + 0x0008]
	.word 0xa0ba8008  ! 99: XNORcc_R	xnorcc 	%r10, %r8, %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec218008  ! 102: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe4098008  ! 103: LDUB_R	ldub	[%r6 + %r8], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0498008  ! 108: LDSB_R	ldsb	[%r6 + %r8], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xac21a028  ! 110: SUB_I	sub 	%r6, 0x0028, %r22
	.word 0xe84ba038  ! 111: LDSB_I	ldsb	[%r14 + 0x0038], %r20
	.word 0xa0c1c008  ! 112: ADDCcc_R	addccc 	%r7, %r8, %r16
	.word 0xe01b2028  ! 113: LDD_I	ldd	[%r12 + 0x0028], %r16
	.word 0xe029a000  ! 114: STB_I	stb	%r16, [%r6 + 0x0000]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec31a018  ! 120: STH_I	sth	%r22, [%r6 + 0x0018]
	.word 0xe8138008  ! 121: LDUH_R	lduh	[%r14 + %r8], %r20
	.word 0xe0318008  ! 122: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe03a8008  ! 123: STD_R	std	%r16, [%r10 + %r8]
	.word 0xe03b8008  ! 124: STD_R	std	%r16, [%r14 + %r8]
	.word 0xe029a000  ! 125: STB_I	stb	%r16, [%r6 + 0x0000]
	.word 0xe029a010  ! 126: STB_I	stb	%r16, [%r6 + 0x0010]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec598008  ! 131: LDX_R	ldx	[%r6 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e1100, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d08e1040, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d08e1040, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0118008  ! 137: LDUH_R	lduh	[%r6 + %r8], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0728008  ! 140: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe451a030  ! 141: LDSH_I	ldsh	[%r6 + 0x0030], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xac038008  ! 147: ADD_R	add 	%r14, %r8, %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe001c008  ! 149: LDUW_R	lduw	[%r7 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0230008  ! 151: STW_R	stw	%r16, [%r12 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe041c008  ! 156: LDSW_R	ldsw	[%r7 + %r8], %r16
	.word 0xec52c008  ! 157: LDSH_R	ldsh	[%r11 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe82aa030  ! 159: STB_I	stb	%r20, [%r10 + 0x0030]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe039c008  ! 163: STD_R	std	%r16, [%r7 + %r8]
	.word 0xe0198008  ! 165: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xec2b4008  ! 166: STB_R	stb	%r22, [%r13 + %r8]
	.word 0xe002c008  ! 167: LDUW_R	lduw	[%r11 + %r8], %r16
	.word 0xe8338008  ! 168: STH_R	sth	%r20, [%r14 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0718008  ! 171: STX_R	stx	%r16, [%r6 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05b6038  ! 173: LDX_I	ldx	[%r13 + 0x0038], %r16
	.word 0xe872c008  ! 174: STX_R	stx	%r20, [%r11 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe822a000  ! 178: STW_I	stw	%r20, [%r10 + 0x0000]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01ae000  ! 181: LDD_I	ldd	[%r11 + 0x0000], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe049a010  ! 185: LDSB_I	ldsb	[%r6 + 0x0010], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe45aa000  ! 187: LDX_I	ldx	[%r10 + 0x0000], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0398008  ! 189: STD_R	std	%r16, [%r6 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe852a030  ! 191: LDSH_I	ldsh	[%r10 + 0x0030], %r20
	.word 0xe05a8008  ! 192: LDX_R	ldx	[%r10 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe029c008  ! 194: STB_R	stb	%r16, [%r7 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe451a020  ! 198: LDSH_I	ldsh	[%r6 + 0x0020], %r18
	.word 0xe40b2000  ! 199: LDUB_I	ldub	[%r12 + 0x0000], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe831c008  ! 202: STH_R	sth	%r20, [%r7 + %r8]
	.word 0xe0728008  ! 203: STX_R	stx	%r16, [%r10 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe871c008  ! 207: STX_R	stx	%r20, [%r7 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe033a030  ! 209: STH_I	sth	%r16, [%r14 + 0x0030]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01b2000  ! 211: LDD_I	ldd	[%r12 + 0x0000], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec32c008  ! 214: STH_R	sth	%r22, [%r11 + %r8]
	.word 0xe839e018  ! 215: STD_I	std	%r20, [%r7 + 0x0018]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe00b8008  ! 218: LDUB_R	ldub	[%r14 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec42c008  ! 220: LDSW_R	ldsw	[%r11 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe03ac008  ! 223: STD_R	std	%r16, [%r11 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe4234008  ! 225: STW_R	stw	%r18, [%r13 + %r8]
	.word 0xec5ac008  ! 226: LDX_R	ldx	[%r11 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec232028  ! 228: STW_I	stw	%r22, [%r12 + 0x0028]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe033a008  ! 231: STH_I	sth	%r16, [%r14 + 0x0008]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4598008  ! 233: LDX_R	ldx	[%r6 + %r8], %r18
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe8032018  ! 235: LDUW_I	lduw	[%r12 + 0x0018], %r20
	.word 0xe84a8008  ! 236: LDSB_R	ldsb	[%r10 + %r8], %r20
	.word 0xe8738008  ! 237: STX_R	stx	%r20, [%r14 + %r8]
	.word 0xec01a010  ! 238: LDUW_I	lduw	[%r6 + 0x0010], %r22
	.word 0xe03b2008  ! 239: STD_I	std	%r16, [%r12 + 0x0008]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03a8008  ! 243: STD_R	std	%r16, [%r10 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee1c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe401a008  ! 249: LDUW_I	lduw	[%r6 + 0x0008], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe04ae038  ! 251: LDSB_I	ldsb	[%r11 + 0x0038], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe073a030  ! 255: STX_I	stx	%r16, [%r14 + 0x0030]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec39e010  ! 259: STD_I	std	%r22, [%r7 + 0x0010]
	.word 0xe43aa030  ! 260: STD_I	std	%r18, [%r10 + 0x0030]
	.word 0xe051a000  ! 261: LDSH_I	ldsh	[%r6 + 0x0000], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec22c008  ! 264: STW_R	stw	%r22, [%r11 + %r8]
	.word 0xac336018  ! 265: ORN_I	orn 	%r13, 0x0018, %r22
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe83ae008  ! 268: STD_I	std	%r20, [%r11 + 0x0008]
	.word 0xe03b2000  ! 269: STD_I	std	%r16, [%r12 + 0x0000]
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d02ef000, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d04ef1c0, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d06ef180, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe011e000  ! 272: LDUH_I	lduh	[%r7 + 0x0000], %r16
	.word 0xe01b4008  ! 273: LDD_R	ldd	[%r13 + %r8], %r16
	.word 0xe0728008  ! 274: STX_R	stx	%r16, [%r10 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe451a018  ! 277: LDSH_I	ldsh	[%r6 + 0x0018], %r18
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe831a000  ! 280: STH_I	sth	%r20, [%r6 + 0x0000]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe42aa030  ! 283: STB_I	stb	%r18, [%r10 + 0x0030]
	.word 0xe80b0008  ! 284: LDUB_R	ldub	[%r12 + %r8], %r20
	.word 0xe832e028  ! 285: STH_I	sth	%r20, [%r11 + 0x0028]
	.word 0xec518008  ! 286: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xec2b8008  ! 287: STB_R	stb	%r22, [%r14 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe8228008  ! 289: STW_R	stw	%r20, [%r10 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0a1e020  ! 293: SUBcc_I	subcc 	%r7, 0x0020, %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe459a010  ! 296: LDX_I	ldx	[%r6 + 0x0010], %r18
	.word 0xe041a028  ! 297: LDSW_I	ldsw	[%r6 + 0x0028], %r16
	.word 0xec01e030  ! 298: LDUW_I	lduw	[%r7 + 0x0030], %r22
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_14:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0334008  ! 5: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xec29e020  ! 7: STB_I	stb	%r22, [%r7 + 0x0020]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0736028  ! 9: STX_I	stx	%r16, [%r13 + 0x0028]
	.word 0xe0534008  ! 10: LDSH_R	ldsh	[%r13 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe02b0008  ! 12: STB_R	stb	%r16, [%r12 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0518008  ! 15: LDSH_R	ldsh	[%r6 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02ba038  ! 17: STB_I	stb	%r16, [%r14 + 0x0038]
	.word 0xe03ac008  ! 18: STD_R	std	%r16, [%r11 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec730008  ! 20: STX_R	stx	%r22, [%r12 + %r8]
	.word 0xe44b8008  ! 21: LDSB_R	ldsb	[%r14 + %r8], %r18
	.word 0xe43b8008  ! 22: STD_R	std	%r18, [%r14 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe023a028  ! 24: STW_I	stw	%r16, [%r14 + 0x0028]
	.word 0xe84ae010  ! 25: LDSB_I	ldsb	[%r11 + 0x0010], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe809e038  ! 27: LDUB_I	ldub	[%r7 + 0x0038], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0228008  ! 31: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xe411e018  ! 33: LDUH_I	lduh	[%r7 + 0x0018], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe84b6000  ! 36: LDSB_I	ldsb	[%r13 + 0x0000], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8230008  ! 38: STW_R	stw	%r20, [%r12 + %r8]
	.word 0xe039c008  ! 39: STD_R	std	%r16, [%r7 + %r8]
	setx	0x00000000d02ef040, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d04ef100, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d06ef180, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe822c008  ! 44: STW_R	stw	%r20, [%r11 + %r8]
	.word 0xe042c008  ! 45: LDSW_R	ldsw	[%r11 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0318008  ! 49: STH_R	sth	%r16, [%r6 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe071a010  ! 56: STX_I	stx	%r16, [%r6 + 0x0010]
	.word 0xe03ae038  ! 57: STD_I	std	%r16, [%r11 + 0x0038]
	.word 0xe432e010  ! 58: STH_I	sth	%r18, [%r11 + 0x0010]
	.word 0xe80ba030  ! 59: LDUB_I	ldub	[%r14 + 0x0030], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe852c008  ! 61: LDSH_R	ldsh	[%r11 + %r8], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05a8008  ! 63: LDX_R	ldx	[%r10 + %r8], %r16
	.word 0xe42b2000  ! 64: STB_I	stb	%r18, [%r12 + 0x0000]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe812a000  ! 67: LDUH_I	lduh	[%r10 + 0x0000], %r20
	.word 0xe839c008  ! 68: STD_R	std	%r20, [%r7 + %r8]
	.word 0xe81a8008  ! 69: LDD_R	ldd	[%r10 + %r8], %r20
	.word 0xe032c008  ! 70: STH_R	sth	%r16, [%r11 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe439a028  ! 72: STD_I	std	%r18, [%r6 + 0x0028]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe801e028  ! 78: LDUW_I	lduw	[%r7 + 0x0028], %r20
	.word 0xe05ac008  ! 79: LDX_R	ldx	[%r11 + %r8], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe40b2008  ! 81: LDUB_I	ldub	[%r12 + 0x0008], %r18
	.word 0xe032a008  ! 82: STH_I	sth	%r16, [%r10 + 0x0008]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0398008  ! 86: STD_R	std	%r16, [%r6 + %r8]
	.word 0xec436000  ! 87: LDSW_I	ldsw	[%r13 + 0x0000], %r22
	.word 0xe852e018  ! 88: LDSH_I	ldsh	[%r11 + 0x0018], %r20
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8218008  ! 92: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xe03a8008  ! 93: STD_R	std	%r16, [%r10 + %r8]
	setx	0x00000000d08e11c0, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e1140, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d08e1040, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0334008  ! 96: STH_R	sth	%r16, [%r13 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe821e008  ! 98: STW_I	stw	%r20, [%r7 + 0x0008]
	.word 0xa409e018  ! 99: AND_I	and 	%r7, 0x0018, %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe032c008  ! 102: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe04aa018  ! 103: LDSB_I	ldsb	[%r10 + 0x0018], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec518008  ! 108: LDSH_R	ldsh	[%r6 + %r8], %r22
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa032a020  ! 110: SUBC_I	orn 	%r10, 0x0020, %r16
	.word 0xe009a030  ! 111: LDUB_I	ldub	[%r6 + 0x0030], %r16
	.word 0xa0b32000  ! 112: SUBCcc_I	orncc 	%r12, 0x0000, %r16
	.word 0xe04aa018  ! 113: LDSB_I	ldsb	[%r10 + 0x0018], %r16
	.word 0xec21a020  ! 114: STW_I	stw	%r22, [%r6 + 0x0020]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2ae008  ! 120: STB_I	stb	%r22, [%r11 + 0x0008]
	.word 0xe049c008  ! 121: LDSB_R	ldsb	[%r7 + %r8], %r16
	.word 0xe0398008  ! 122: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe02aa008  ! 123: STB_I	stb	%r16, [%r10 + 0x0008]
	.word 0xe433a018  ! 124: STH_I	sth	%r18, [%r14 + 0x0018]
	.word 0xe0218008  ! 125: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe822c008  ! 126: STW_R	stw	%r20, [%r11 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0128008  ! 131: LDUH_R	lduh	[%r10 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e1140, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d08e10c0, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d08e1100, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec52c008  ! 137: LDSH_R	ldsh	[%r11 + %r8], %r22
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe8318008  ! 140: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xec418008  ! 141: LDSW_R	ldsw	[%r6 + %r8], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa8028008  ! 147: ADD_R	add 	%r10, %r8, %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec11a028  ! 149: LDUH_I	lduh	[%r6 + 0x0028], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe83a8008  ! 151: STD_R	std	%r20, [%r10 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe44b6028  ! 156: LDSB_I	ldsb	[%r13 + 0x0028], %r18
	.word 0xe451a018  ! 157: LDSH_I	ldsh	[%r6 + 0x0018], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec73a020  ! 159: STX_I	stx	%r22, [%r14 + 0x0020]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec2ae000  ! 163: STB_I	stb	%r22, [%r11 + 0x0000]
	.word 0xe4138008  ! 165: LDUH_R	lduh	[%r14 + %r8], %r18
	.word 0xe0738008  ! 166: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe00ba030  ! 167: LDUB_I	ldub	[%r14 + 0x0030], %r16
	.word 0xe0730008  ! 168: STX_R	stx	%r16, [%r12 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe472a018  ! 171: STX_I	stx	%r18, [%r10 + 0x0018]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00a8008  ! 173: LDUB_R	ldub	[%r10 + %r8], %r16
	.word 0xec3b6008  ! 174: STD_I	std	%r22, [%r13 + 0x0008]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe8218008  ! 178: STW_R	stw	%r20, [%r6 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe85aa000  ! 181: LDX_I	ldx	[%r10 + 0x0000], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04aa030  ! 185: LDSB_I	ldsb	[%r10 + 0x0030], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8518008  ! 187: LDSH_R	ldsh	[%r6 + %r8], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe021c008  ! 189: STW_R	stw	%r16, [%r7 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00b2028  ! 191: LDUB_I	ldub	[%r12 + 0x0028], %r16
	.word 0xe04a8008  ! 192: LDSB_R	ldsb	[%r10 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec23a028  ! 194: STW_I	stw	%r22, [%r14 + 0x0028]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe84a8008  ! 198: LDSB_R	ldsb	[%r10 + %r8], %r20
	.word 0xe8438008  ! 199: LDSW_R	ldsw	[%r14 + %r8], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe02b4008  ! 202: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xe071c008  ! 203: STX_R	stx	%r16, [%r7 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec31a010  ! 207: STH_I	sth	%r22, [%r6 + 0x0010]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe421a018  ! 209: STW_I	stw	%r18, [%r6 + 0x0018]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe44b6030  ! 211: LDSB_I	ldsb	[%r13 + 0x0030], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec72e008  ! 214: STX_I	stx	%r22, [%r11 + 0x0008]
	.word 0xe43ba020  ! 215: STD_I	std	%r18, [%r14 + 0x0020]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe45b0008  ! 218: LDX_R	ldx	[%r12 + %r8], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec498008  ! 220: LDSB_R	ldsb	[%r6 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec31e000  ! 223: STH_I	sth	%r22, [%r7 + 0x0000]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe4728008  ! 225: STX_R	stx	%r18, [%r10 + %r8]
	.word 0xe0418008  ! 226: LDSW_R	ldsw	[%r6 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0732000  ! 228: STX_I	stx	%r16, [%r12 + 0x0000]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4734008  ! 231: STX_R	stx	%r18, [%r13 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe40b4008  ! 233: LDUB_R	ldub	[%r13 + %r8], %r18
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe40b0008  ! 235: LDUB_R	ldub	[%r12 + %r8], %r18
	.word 0xe41ba000  ! 236: LDD_I	ldd	[%r14 + 0x0000], %r18
	.word 0xe8328008  ! 237: STH_R	sth	%r20, [%r10 + %r8]
	.word 0xec0a8008  ! 238: LDUB_R	ldub	[%r10 + %r8], %r22
	.word 0xe073a030  ! 239: STX_I	stx	%r16, [%r14 + 0x0030]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02ba020  ! 243: STB_I	stb	%r16, [%r14 + 0x0020]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee000, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe401c008  ! 249: LDUW_R	lduw	[%r7 + %r8], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe41b8008  ! 251: LDD_R	ldd	[%r14 + %r8], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8298008  ! 255: STB_R	stb	%r20, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe83a8008  ! 259: STD_R	std	%r20, [%r10 + %r8]
	.word 0xe0738008  ! 260: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xec038008  ! 261: LDUW_R	lduw	[%r14 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0736038  ! 264: STX_I	stx	%r16, [%r13 + 0x0038]
	.word 0xa8418008  ! 265: ADDC_R	addc 	%r6, %r8, %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe029a020  ! 268: STB_I	stb	%r16, [%r6 + 0x0020]
	.word 0xe4238008  ! 269: STW_R	stw	%r18, [%r14 + %r8]
	setx	0x00000000d01ee180, %r1, %r6
	setx	0x00000000d02ef0c0, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d04ef1c0, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef100, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec1b2010  ! 272: LDD_I	ldd	[%r12 + 0x0010], %r22
	.word 0xe8598008  ! 273: LDX_R	ldx	[%r6 + %r8], %r20
	.word 0xe03ae028  ! 274: STD_I	std	%r16, [%r11 + 0x0028]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec018008  ! 277: LDUW_R	lduw	[%r6 + %r8], %r22
	setx	0x00000000d01ee040, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02aa018  ! 280: STB_I	stb	%r16, [%r10 + 0x0018]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe4398008  ! 283: STD_R	std	%r18, [%r6 + %r8]
	.word 0xe042a038  ! 284: LDSW_I	ldsw	[%r10 + 0x0038], %r16
	.word 0xe422a010  ! 285: STW_I	stw	%r18, [%r10 + 0x0010]
	.word 0xe41a8008  ! 286: LDD_R	ldd	[%r10 + %r8], %r18
	.word 0xe8218008  ! 287: STW_R	stw	%r20, [%r6 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0234008  ! 289: STW_R	stw	%r16, [%r13 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa441a020  ! 293: ADDC_I	addc 	%r6, 0x0020, %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec4ae028  ! 296: LDSB_I	ldsb	[%r11 + 0x0028], %r22
	.word 0xe05b4008  ! 297: LDX_R	ldx	[%r13 + %r8], %r16
	.word 0xe8018008  ! 298: LDUW_R	lduw	[%r6 + %r8], %r20
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_13:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8718008  ! 5: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe0228008  ! 7: STW_R	stw	%r16, [%r10 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4230008  ! 9: STW_R	stw	%r18, [%r12 + %r8]
	.word 0xec136038  ! 10: LDUH_I	lduh	[%r13 + 0x0038], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec22e010  ! 12: STW_I	stw	%r22, [%r11 + 0x0010]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec034008  ! 15: LDUW_R	lduw	[%r13 + %r8], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe839a028  ! 17: STD_I	std	%r20, [%r6 + 0x0028]
	.word 0xec236010  ! 18: STW_I	stw	%r22, [%r13 + 0x0010]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0232008  ! 20: STW_I	stw	%r16, [%r12 + 0x0008]
	.word 0xe0036028  ! 21: LDUW_I	lduw	[%r13 + 0x0028], %r16
	.word 0xe8228008  ! 22: STW_R	stw	%r20, [%r10 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe021e008  ! 24: STW_I	stw	%r16, [%r7 + 0x0008]
	.word 0xe05b8008  ! 25: LDX_R	ldx	[%r14 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe85b8008  ! 27: LDX_R	ldx	[%r14 + %r8], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec29e018  ! 31: STB_I	stb	%r22, [%r7 + 0x0018]
	.word 0xec418008  ! 33: LDSW_R	ldsw	[%r6 + %r8], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04ba018  ! 36: LDSB_I	ldsb	[%r14 + 0x0018], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec738008  ! 38: STX_R	stx	%r22, [%r14 + %r8]
	.word 0xe03a8008  ! 39: STD_R	std	%r16, [%r10 + %r8]
	setx	0x00000000d02ef180, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d04ef040, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d06ef100, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe472e020  ! 44: STX_I	stx	%r18, [%r11 + 0x0020]
	.word 0xe811c008  ! 45: LDUH_R	lduh	[%r7 + %r8], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec71a038  ! 49: STX_I	stx	%r22, [%r6 + 0x0038]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe4238008  ! 56: STW_R	stw	%r18, [%r14 + %r8]
	.word 0xe0738008  ! 57: STX_R	stx	%r16, [%r14 + %r8]
	.word 0xe8736018  ! 58: STX_I	stx	%r20, [%r13 + 0x0018]
	.word 0xe4098008  ! 59: LDUB_R	ldub	[%r6 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec59a028  ! 61: LDX_I	ldx	[%r6 + 0x0028], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec018008  ! 63: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xe0738008  ! 64: STX_R	stx	%r16, [%r14 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8498008  ! 67: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xe871a028  ! 68: STX_I	stx	%r20, [%r6 + 0x0028]
	.word 0xe01b8008  ! 69: LDD_R	ldd	[%r14 + %r8], %r16
	.word 0xec732018  ! 70: STX_I	stx	%r22, [%r12 + 0x0018]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec318008  ! 72: STH_R	sth	%r22, [%r6 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4118008  ! 78: LDUH_R	lduh	[%r6 + %r8], %r18
	.word 0xec538008  ! 79: LDSH_R	ldsh	[%r14 + %r8], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec1ba020  ! 81: LDD_I	ldd	[%r14 + 0x0020], %r22
	.word 0xe821a000  ! 82: STW_I	stw	%r20, [%r6 + 0x0000]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe42a8008  ! 86: STB_R	stb	%r18, [%r10 + %r8]
	.word 0xe059e000  ! 87: LDX_I	ldx	[%r7 + 0x0000], %r16
	.word 0xe011a010  ! 88: LDUH_I	lduh	[%r6 + 0x0010], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe071e028  ! 92: STX_I	stx	%r16, [%r7 + 0x0028]
	.word 0xe0398008  ! 93: STD_R	std	%r16, [%r6 + %r8]
	setx	0x00000000d08e1100, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d08e1140, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4730008  ! 96: STX_R	stx	%r18, [%r12 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec21a030  ! 98: STW_I	stw	%r22, [%r6 + 0x0030]
	.word 0xa481c008  ! 99: ADDcc_R	addcc 	%r7, %r8, %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe03a8008  ! 102: STD_R	std	%r16, [%r10 + %r8]
	.word 0xe01ac008  ! 103: LDD_R	ldd	[%r11 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe841a030  ! 108: LDSW_I	ldsw	[%r6 + 0x0030], %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa8832018  ! 110: ADDcc_I	addcc 	%r12, 0x0018, %r20
	.word 0xec118008  ! 111: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xa8134008  ! 112: OR_R	or 	%r13, %r8, %r20
	.word 0xe053a038  ! 113: LDSH_I	ldsh	[%r14 + 0x0038], %r16
	.word 0xe0734008  ! 114: STX_R	stx	%r16, [%r13 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03aa038  ! 120: STD_I	std	%r16, [%r10 + 0x0038]
	.word 0xec4ac008  ! 121: LDSB_R	ldsb	[%r11 + %r8], %r22
	.word 0xe021a018  ! 122: STW_I	stw	%r16, [%r6 + 0x0018]
	.word 0xe839a008  ! 123: STD_I	std	%r20, [%r6 + 0x0008]
	.word 0xe02ae038  ! 124: STB_I	stb	%r16, [%r11 + 0x0038]
	.word 0xe02b8008  ! 125: STB_R	stb	%r16, [%r14 + %r8]
	.word 0xe03b2030  ! 126: STD_I	std	%r16, [%r12 + 0x0030]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8018008  ! 131: LDUW_R	lduw	[%r6 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e1100, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e1100, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d08e1100, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01b8008  ! 137: LDD_R	ldd	[%r14 + %r8], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe021a008  ! 140: STW_I	stw	%r16, [%r6 + 0x0008]
	.word 0xe0428008  ! 141: LDSW_R	ldsw	[%r10 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa431e008  ! 147: SUBC_I	orn 	%r7, 0x0008, %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe041e028  ! 149: LDSW_I	ldsw	[%r7 + 0x0028], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe022e000  ! 151: STW_I	stw	%r16, [%r11 + 0x0000]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe042e030  ! 156: LDSW_I	ldsw	[%r11 + 0x0030], %r16
	.word 0xec518008  ! 157: LDSH_R	ldsh	[%r6 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe071c008  ! 159: STX_R	stx	%r16, [%r7 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4234008  ! 163: STW_R	stw	%r18, [%r13 + %r8]
	.word 0xe80aa030  ! 165: LDUB_I	ldub	[%r10 + 0x0030], %r20
	.word 0xe833a010  ! 166: STH_I	sth	%r20, [%r14 + 0x0010]
	.word 0xe04aa030  ! 167: LDSB_I	ldsb	[%r10 + 0x0030], %r16
	.word 0xe4318008  ! 168: STH_R	sth	%r18, [%r6 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0228008  ! 171: STW_R	stw	%r16, [%r10 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec4b8008  ! 173: LDSB_R	ldsb	[%r14 + %r8], %r22
	.word 0xec71e038  ! 174: STX_I	stx	%r22, [%r7 + 0x0038]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe42b2018  ! 178: STB_I	stb	%r18, [%r12 + 0x0018]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec498008  ! 181: LDSB_R	ldsb	[%r6 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe401a018  ! 185: LDUW_I	lduw	[%r6 + 0x0018], %r18
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec4ac008  ! 187: LDSB_R	ldsb	[%r11 + %r8], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec71a038  ! 189: STX_I	stx	%r22, [%r6 + 0x0038]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe041a028  ! 191: LDSW_I	ldsw	[%r6 + 0x0028], %r16
	.word 0xec51a028  ! 192: LDSH_I	ldsh	[%r6 + 0x0028], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe82a8008  ! 194: STB_R	stb	%r20, [%r10 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe00a8008  ! 198: LDUB_R	ldub	[%r10 + %r8], %r16
	.word 0xe4518008  ! 199: LDSH_R	ldsh	[%r6 + %r8], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe073a038  ! 202: STX_I	stx	%r16, [%r14 + 0x0038]
	.word 0xe039e008  ! 203: STD_I	std	%r16, [%r7 + 0x0008]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec218008  ! 207: STW_R	stw	%r22, [%r6 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0298008  ! 209: STB_R	stb	%r16, [%r6 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec02e000  ! 211: LDUW_I	lduw	[%r11 + 0x0000], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec29c008  ! 214: STB_R	stb	%r22, [%r7 + %r8]
	.word 0xec2b6020  ! 215: STB_I	stb	%r22, [%r13 + 0x0020]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0034008  ! 218: LDUW_R	lduw	[%r13 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe011c008  ! 220: LDUH_R	lduh	[%r7 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe023a000  ! 223: STW_I	stw	%r16, [%r14 + 0x0000]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec328008  ! 225: STH_R	sth	%r22, [%r10 + %r8]
	.word 0xec532010  ! 226: LDSH_I	ldsh	[%r12 + 0x0010], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec39a018  ! 228: STD_I	std	%r22, [%r6 + 0x0018]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0398008  ! 231: STD_R	std	%r16, [%r6 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4034008  ! 233: LDUW_R	lduw	[%r13 + %r8], %r18
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe4032018  ! 235: LDUW_I	lduw	[%r12 + 0x0018], %r18
	.word 0xe451e028  ! 236: LDSH_I	ldsh	[%r7 + 0x0028], %r18
	.word 0xe8318008  ! 237: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xec0ae008  ! 238: LDUB_I	ldub	[%r11 + 0x0008], %r22
	.word 0xec2a8008  ! 239: STB_R	stb	%r22, [%r10 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8234008  ! 243: STW_R	stw	%r20, [%r13 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee140, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe049a010  ! 249: LDSB_I	ldsb	[%r6 + 0x0010], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe40b0008  ! 251: LDUB_R	ldub	[%r12 + %r8], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03b0008  ! 255: STD_R	std	%r16, [%r12 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0298008  ! 259: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe029a030  ! 260: STB_I	stb	%r16, [%r6 + 0x0030]
	.word 0xe01b4008  ! 261: LDD_R	ldd	[%r13 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe03ac008  ! 264: STD_R	std	%r16, [%r11 + %r8]
	.word 0xa8328008  ! 265: SUBC_R	orn 	%r10, %r8, %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0230008  ! 268: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xe83ae030  ! 269: STD_I	std	%r20, [%r11 + 0x0030]
	setx	0x00000000d01ee000, %r1, %r6
	setx	0x00000000d02ef080, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d04ef100, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe049e038  ! 272: LDSB_I	ldsb	[%r7 + 0x0038], %r16
	.word 0xec4b0008  ! 273: LDSB_R	ldsb	[%r12 + %r8], %r22
	.word 0xe4338008  ! 274: STH_R	sth	%r18, [%r14 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe41a8008  ! 277: LDD_R	ldd	[%r10 + %r8], %r18
	setx	0x00000000d01ee180, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8338008  ! 280: STH_R	sth	%r20, [%r14 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec218008  ! 283: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe0198008  ! 284: LDD_R	ldd	[%r6 + %r8], %r16
	.word 0xe832c008  ! 285: STH_R	sth	%r20, [%r11 + %r8]
	.word 0xe0130008  ! 286: LDUH_R	lduh	[%r12 + %r8], %r16
	.word 0xec328008  ! 287: STH_R	sth	%r22, [%r10 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe83aa028  ! 289: STD_I	std	%r20, [%r10 + 0x0028]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0b2a010  ! 293: ORNcc_I	orncc 	%r10, 0x0010, %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe009e030  ! 296: LDUB_I	ldub	[%r7 + 0x0030], %r16
	.word 0xec098008  ! 297: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xec0a8008  ! 298: LDUB_R	ldub	[%r10 + %r8], %r22
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_12:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43a8008  ! 5: STD_R	std	%r18, [%r10 + %r8]
	.word 0xe432e018  ! 7: STH_I	sth	%r18, [%r11 + 0x0018]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83b6000  ! 9: STD_I	std	%r20, [%r13 + 0x0000]
	.word 0xe419e010  ! 10: LDD_I	ldd	[%r7 + 0x0010], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe431c008  ! 12: STH_R	sth	%r18, [%r7 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe44b8008  ! 15: LDSB_R	ldsb	[%r14 + %r8], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec39a030  ! 17: STD_I	std	%r22, [%r6 + 0x0030]
	.word 0xe42b4008  ! 18: STB_R	stb	%r18, [%r13 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe031c008  ! 20: STH_R	sth	%r16, [%r7 + %r8]
	.word 0xe8532000  ! 21: LDSH_I	ldsh	[%r12 + 0x0000], %r20
	.word 0xe021e000  ! 22: STW_I	stw	%r16, [%r7 + 0x0000]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0228008  ! 24: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xec41c008  ! 25: LDSW_R	ldsw	[%r7 + %r8], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe001a038  ! 27: LDUW_I	lduw	[%r6 + 0x0038], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02ae030  ! 31: STB_I	stb	%r16, [%r11 + 0x0030]
	.word 0xe8434008  ! 33: LDSW_R	ldsw	[%r13 + %r8], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec5b2018  ! 36: LDX_I	ldx	[%r12 + 0x0018], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe031c008  ! 38: STH_R	sth	%r16, [%r7 + %r8]
	.word 0xe871c008  ! 39: STX_R	stx	%r20, [%r7 + %r8]
	setx	0x00000000d02ef140, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d04ef080, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d06ef140, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029c008  ! 44: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe811e020  ! 45: LDUH_I	lduh	[%r7 + 0x0020], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03b6000  ! 49: STD_I	std	%r16, [%r13 + 0x0000]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0718008  ! 56: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe4218008  ! 57: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xec218008  ! 58: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe0434008  ! 59: LDSW_R	ldsw	[%r13 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec42a008  ! 61: LDSW_I	ldsw	[%r10 + 0x0008], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe811e018  ! 63: LDUH_I	lduh	[%r7 + 0x0018], %r20
	.word 0xec398008  ! 64: STD_R	std	%r22, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00ac008  ! 67: LDUB_R	ldub	[%r11 + %r8], %r16
	.word 0xe43b8008  ! 68: STD_R	std	%r18, [%r14 + %r8]
	.word 0xec528008  ! 69: LDSH_R	ldsh	[%r10 + %r8], %r22
	.word 0xe439a008  ! 70: STD_I	std	%r18, [%r6 + 0x0008]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe472a028  ! 72: STX_I	stx	%r18, [%r10 + 0x0028]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe85b8008  ! 78: LDX_R	ldx	[%r14 + %r8], %r20
	.word 0xec59a038  ! 79: LDX_I	ldx	[%r6 + 0x0038], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe819e028  ! 81: LDD_I	ldd	[%r7 + 0x0028], %r20
	.word 0xec23a020  ! 82: STW_I	stw	%r22, [%r14 + 0x0020]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe032e028  ! 86: STH_I	sth	%r16, [%r11 + 0x0028]
	.word 0xe80b4008  ! 87: LDUB_R	ldub	[%r13 + %r8], %r20
	.word 0xe0536028  ! 88: LDSH_I	ldsh	[%r13 + 0x0028], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec234008  ! 92: STW_R	stw	%r22, [%r13 + %r8]
	.word 0xec3aa010  ! 93: STD_I	std	%r22, [%r10 + 0x0010]
	setx	0x00000000d08e1100, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e10c0, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d08e1100, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0234008  ! 96: STW_R	stw	%r16, [%r13 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2b6030  ! 98: STB_I	stb	%r22, [%r13 + 0x0030]
	.word 0xa4a9c008  ! 99: ANDNcc_R	andncc 	%r7, %r8, %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec2ae028  ! 102: STB_I	stb	%r22, [%r11 + 0x0028]
	.word 0xec5a8008  ! 103: LDX_R	ldx	[%r10 + %r8], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe451c008  ! 108: LDSH_R	ldsh	[%r7 + %r8], %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa033a008  ! 110: SUBC_I	orn 	%r14, 0x0008, %r16
	.word 0xe84b0008  ! 111: LDSB_R	ldsb	[%r12 + %r8], %r20
	.word 0xa0b38008  ! 112: ORNcc_R	orncc 	%r14, %r8, %r16
	.word 0xe0118008  ! 113: LDUH_R	lduh	[%r6 + %r8], %r16
	.word 0xe821c008  ! 114: STW_R	stw	%r20, [%r7 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02a8008  ! 120: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xe40ac008  ! 121: LDUB_R	ldub	[%r11 + %r8], %r18
	.word 0xe839a030  ! 122: STD_I	std	%r20, [%r6 + 0x0030]
	.word 0xe039a030  ! 123: STD_I	std	%r16, [%r6 + 0x0030]
	.word 0xe43b2010  ! 124: STD_I	std	%r18, [%r12 + 0x0010]
	.word 0xe432a038  ! 125: STH_I	sth	%r18, [%r10 + 0x0038]
	.word 0xe471a010  ! 126: STX_I	stx	%r18, [%r6 + 0x0010]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe84aa000  ! 131: LDSB_I	ldsb	[%r10 + 0x0000], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e1040, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d08e1140, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d08e1140, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe449c008  ! 137: LDSB_R	ldsb	[%r7 + %r8], %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe8230008  ! 140: STW_R	stw	%r20, [%r12 + %r8]
	.word 0xe0538008  ! 141: LDSH_R	ldsh	[%r14 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0430008  ! 147: ADDC_R	addc 	%r12, %r8, %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe012c008  ! 149: LDUH_R	lduh	[%r11 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe039a018  ! 151: STD_I	std	%r16, [%r6 + 0x0018]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0098008  ! 156: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe81a8008  ! 157: LDD_R	ldd	[%r10 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe871a030  ! 159: STX_I	stx	%r20, [%r6 + 0x0030]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0298008  ! 163: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xec428008  ! 165: LDSW_R	ldsw	[%r10 + %r8], %r22
	.word 0xe4236010  ! 166: STW_I	stw	%r18, [%r13 + 0x0010]
	.word 0xe819a030  ! 167: LDD_I	ldd	[%r6 + 0x0030], %r20
	.word 0xe0730008  ! 168: STX_R	stx	%r16, [%r12 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0234008  ! 171: STW_R	stw	%r16, [%r13 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04ba028  ! 173: LDSB_I	ldsb	[%r14 + 0x0028], %r16
	.word 0xe031e000  ! 174: STH_I	sth	%r16, [%r7 + 0x0000]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe0298008  ! 178: STB_R	stb	%r16, [%r6 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec0b4008  ! 181: LDUB_R	ldub	[%r13 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe40b0008  ! 185: LDUB_R	ldub	[%r12 + %r8], %r18
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4536000  ! 187: LDSH_I	ldsh	[%r13 + 0x0000], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0238008  ! 189: STW_R	stw	%r16, [%r14 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe409e018  ! 191: LDUB_I	ldub	[%r7 + 0x0018], %r18
	.word 0xe0032010  ! 192: LDUW_I	lduw	[%r12 + 0x0010], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec31a028  ! 194: STH_I	sth	%r22, [%r6 + 0x0028]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe001c008  ! 198: LDUW_R	lduw	[%r7 + %r8], %r16
	.word 0xec018008  ! 199: LDUW_R	lduw	[%r6 + %r8], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4318008  ! 202: STH_R	sth	%r18, [%r6 + %r8]
	.word 0xe02ae000  ! 203: STB_I	stb	%r16, [%r11 + 0x0000]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe031c008  ! 207: STH_R	sth	%r16, [%r7 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe8336028  ! 209: STH_I	sth	%r20, [%r13 + 0x0028]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe85ac008  ! 211: LDX_R	ldx	[%r11 + %r8], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe02b2030  ! 214: STB_I	stb	%r16, [%r12 + 0x0030]
	.word 0xe83b0008  ! 215: STD_R	std	%r20, [%r12 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec19a008  ! 218: LDD_I	ldd	[%r6 + 0x0008], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe841c008  ! 220: LDSW_R	ldsw	[%r7 + %r8], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe071a020  ! 223: STX_I	stx	%r16, [%r6 + 0x0020]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0298008  ! 225: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe05ac008  ! 226: LDX_R	ldx	[%r11 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec318008  ! 228: STH_R	sth	%r22, [%r6 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0318008  ! 231: STH_R	sth	%r16, [%r6 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe459e038  ! 233: LDX_I	ldx	[%r7 + 0x0038], %r18
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe0434008  ! 235: LDSW_R	ldsw	[%r13 + %r8], %r16
	.word 0xe0018008  ! 236: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe033a028  ! 237: STH_I	sth	%r16, [%r14 + 0x0028]
	.word 0xec19a030  ! 238: LDD_I	ldd	[%r6 + 0x0030], %r22
	.word 0xe832a020  ! 239: STH_I	sth	%r20, [%r10 + 0x0020]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe031e018  ! 243: STH_I	sth	%r16, [%r7 + 0x0018]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe85b8008  ! 249: LDX_R	ldx	[%r14 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe459c008  ! 251: LDX_R	ldx	[%r7 + %r8], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4336008  ! 255: STH_I	sth	%r18, [%r13 + 0x0008]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe039c008  ! 259: STD_R	std	%r16, [%r7 + %r8]
	.word 0xec3ae010  ! 260: STD_I	std	%r22, [%r11 + 0x0010]
	.word 0xec4ae010  ! 261: LDSB_I	ldsb	[%r11 + 0x0010], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8228008  ! 264: STW_R	stw	%r20, [%r10 + %r8]
	.word 0xa419a020  ! 265: XOR_I	xor 	%r6, 0x0020, %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec3aa008  ! 268: STD_I	std	%r22, [%r10 + 0x0008]
	.word 0xe43b6000  ! 269: STD_I	std	%r18, [%r13 + 0x0000]
	setx	0x00000000d01ee180, %r1, %r6
	setx	0x00000000d02ef180, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d04ef1c0, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe451a030  ! 272: LDSH_I	ldsh	[%r6 + 0x0030], %r18
	.word 0xe051c008  ! 273: LDSH_R	ldsh	[%r7 + %r8], %r16
	.word 0xe431c008  ! 274: STH_R	sth	%r18, [%r7 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe81b4008  ! 277: LDD_R	ldd	[%r13 + %r8], %r20
	setx	0x00000000d01ee180, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec218008  ! 280: STW_R	stw	%r22, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe831c008  ! 283: STH_R	sth	%r20, [%r7 + %r8]
	.word 0xe051e008  ! 284: LDSH_I	ldsh	[%r7 + 0x0008], %r16
	.word 0xe829e000  ! 285: STB_I	stb	%r20, [%r7 + 0x0000]
	.word 0xe4032000  ! 286: LDUW_I	lduw	[%r12 + 0x0000], %r18
	.word 0xec39e018  ! 287: STD_I	std	%r22, [%r7 + 0x0018]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec22e000  ! 289: STW_I	stw	%r22, [%r11 + 0x0000]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa4b9c008  ! 293: XNORcc_R	xnorcc 	%r7, %r8, %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec52e018  ! 296: LDSH_I	ldsh	[%r11 + 0x0018], %r22
	.word 0xe002c008  ! 297: LDUW_R	lduw	[%r11 + %r8], %r16
	.word 0xe01b0008  ! 298: LDD_R	ldd	[%r12 + %r8], %r16
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_11:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe032e028  ! 5: STH_I	sth	%r16, [%r11 + 0x0028]
	.word 0xe0398008  ! 7: STD_R	std	%r16, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec21e010  ! 9: STW_I	stw	%r22, [%r7 + 0x0010]
	.word 0xe8518008  ! 10: LDSH_R	ldsh	[%r6 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0234008  ! 12: STW_R	stw	%r16, [%r13 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8498008  ! 15: LDSB_R	ldsb	[%r6 + %r8], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8330008  ! 17: STH_R	sth	%r20, [%r12 + %r8]
	.word 0xe43b6038  ! 18: STD_I	std	%r18, [%r13 + 0x0038]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec2ae010  ! 20: STB_I	stb	%r22, [%r11 + 0x0010]
	.word 0xe0536000  ! 21: LDSH_I	ldsh	[%r13 + 0x0000], %r16
	.word 0xe021a008  ! 22: STW_I	stw	%r16, [%r6 + 0x0008]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe43b4008  ! 24: STD_R	std	%r18, [%r13 + %r8]
	.word 0xe441e008  ! 25: LDSW_I	ldsw	[%r7 + 0x0008], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe419a008  ! 27: LDD_I	ldd	[%r6 + 0x0008], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0398008  ! 31: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe819a018  ! 33: LDD_I	ldd	[%r6 + 0x0018], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0418008  ! 36: LDSW_R	ldsw	[%r6 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe021a018  ! 38: STW_I	stw	%r16, [%r6 + 0x0018]
	.word 0xe831a018  ! 39: STH_I	sth	%r20, [%r6 + 0x0018]
	setx	0x00000000d02ef0c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d04ef000, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d06ef180, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0228008  ! 44: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xe4434008  ! 45: LDSW_R	ldsw	[%r13 + %r8], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02ac008  ! 49: STB_R	stb	%r16, [%r11 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe032a020  ! 56: STH_I	sth	%r16, [%r10 + 0x0020]
	.word 0xe43aa020  ! 57: STD_I	std	%r18, [%r10 + 0x0020]
	.word 0xe039e030  ! 58: STD_I	std	%r16, [%r7 + 0x0030]
	.word 0xe04ac008  ! 59: LDSB_R	ldsb	[%r11 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe011a028  ! 61: LDUH_I	lduh	[%r6 + 0x0028], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec49a018  ! 63: LDSB_I	ldsb	[%r6 + 0x0018], %r22
	.word 0xe8338008  ! 64: STH_R	sth	%r20, [%r14 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0518008  ! 67: LDSH_R	ldsh	[%r6 + %r8], %r16
	.word 0xe823a038  ! 68: STW_I	stw	%r20, [%r14 + 0x0038]
	.word 0xe842e038  ! 69: LDSW_I	ldsw	[%r11 + 0x0038], %r20
	.word 0xec72c008  ! 70: STX_R	stx	%r22, [%r11 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec734008  ! 72: STX_R	stx	%r22, [%r13 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe803a020  ! 78: LDUW_I	lduw	[%r14 + 0x0020], %r20
	.word 0xe85a8008  ! 79: LDX_R	ldx	[%r10 + %r8], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe041c008  ! 81: LDSW_R	ldsw	[%r7 + %r8], %r16
	.word 0xe029e038  ! 82: STB_I	stb	%r16, [%r7 + 0x0038]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe822a028  ! 86: STW_I	stw	%r20, [%r10 + 0x0028]
	.word 0xec598008  ! 87: LDX_R	ldx	[%r6 + %r8], %r22
	.word 0xe04ba020  ! 88: LDSB_I	ldsb	[%r14 + 0x0020], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0328008  ! 92: STH_R	sth	%r16, [%r10 + %r8]
	.word 0xe031e028  ! 93: STH_I	sth	%r16, [%r7 + 0x0028]
	setx	0x00000000d08e1040, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e1180, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe831e028  ! 96: STH_I	sth	%r20, [%r7 + 0x0028]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8238008  ! 98: STW_R	stw	%r20, [%r14 + %r8]
	.word 0xa49ac008  ! 99: XORcc_R	xorcc 	%r11, %r8, %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe03b0008  ! 102: STD_R	std	%r16, [%r12 + %r8]
	.word 0xe04b4008  ! 103: LDSB_R	ldsb	[%r13 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0518008  ! 108: LDSH_R	ldsh	[%r6 + %r8], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xac830008  ! 110: ADDcc_R	addcc 	%r12, %r8, %r22
	.word 0xe4198008  ! 111: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xa8118008  ! 112: OR_R	or 	%r6, %r8, %r20
	.word 0xe0498008  ! 113: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe431c008  ! 114: STH_R	sth	%r18, [%r7 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec21a030  ! 120: STW_I	stw	%r22, [%r6 + 0x0030]
	.word 0xe851c008  ! 121: LDSH_R	ldsh	[%r7 + %r8], %r20
	.word 0xe83ac008  ! 122: STD_R	std	%r20, [%r11 + %r8]
	.word 0xe0298008  ! 123: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe031c008  ! 124: STH_R	sth	%r16, [%r7 + %r8]
	.word 0xe4336020  ! 125: STH_I	sth	%r18, [%r13 + 0x0020]
	.word 0xec2ac008  ! 126: STB_R	stb	%r22, [%r11 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec09e018  ! 131: LDUB_I	ldub	[%r7 + 0x0018], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e1040, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d08e1040, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e1140, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00b8008  ! 137: LDUB_R	ldub	[%r14 + %r8], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe029a020  ! 140: STB_I	stb	%r16, [%r6 + 0x0020]
	.word 0xe05b2030  ! 141: LDX_I	ldx	[%r12 + 0x0030], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0398008  ! 147: XNOR_R	xnor 	%r6, %r8, %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe85b2008  ! 149: LDX_I	ldx	[%r12 + 0x0008], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe8330008  ! 151: STH_R	sth	%r20, [%r12 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe001c008  ! 156: LDUW_R	lduw	[%r7 + %r8], %r16
	.word 0xe819a010  ! 157: LDD_I	ldd	[%r6 + 0x0010], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe872e000  ! 159: STX_I	stx	%r20, [%r11 + 0x0000]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe02ba038  ! 163: STB_I	stb	%r16, [%r14 + 0x0038]
	.word 0xe00b2010  ! 165: LDUB_I	ldub	[%r12 + 0x0010], %r16
	.word 0xe0332008  ! 166: STH_I	sth	%r16, [%r12 + 0x0008]
	.word 0xec5b8008  ! 167: LDX_R	ldx	[%r14 + %r8], %r22
	.word 0xe871a020  ! 168: STX_I	stx	%r20, [%r6 + 0x0020]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe8228008  ! 171: STW_R	stw	%r20, [%r10 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe013a008  ! 173: LDUH_I	lduh	[%r14 + 0x0008], %r16
	.word 0xe03b0008  ! 174: STD_R	std	%r16, [%r12 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec31a028  ! 178: STH_I	sth	%r22, [%r6 + 0x0028]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec418008  ! 181: LDSW_R	ldsw	[%r6 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0032030  ! 185: LDUW_I	lduw	[%r12 + 0x0030], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe413a020  ! 187: LDUH_I	lduh	[%r14 + 0x0020], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe029a030  ! 189: STB_I	stb	%r16, [%r6 + 0x0030]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe049a008  ! 191: LDSB_I	ldsb	[%r6 + 0x0008], %r16
	.word 0xe0428008  ! 192: LDSW_R	ldsw	[%r10 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe471a008  ! 194: STX_I	stx	%r18, [%r6 + 0x0008]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec5aa000  ! 198: LDX_I	ldx	[%r10 + 0x0000], %r22
	.word 0xe8436008  ! 199: LDSW_I	ldsw	[%r13 + 0x0008], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe821e030  ! 202: STW_I	stw	%r20, [%r7 + 0x0030]
	.word 0xe832a030  ! 203: STH_I	sth	%r20, [%r10 + 0x0030]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec3ba008  ! 207: STD_I	std	%r22, [%r14 + 0x0008]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe4328008  ! 209: STH_R	sth	%r18, [%r10 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04b0008  ! 211: LDSB_R	ldsb	[%r12 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0218008  ! 214: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe82b8008  ! 215: STB_R	stb	%r20, [%r14 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe412a038  ! 218: LDUH_I	lduh	[%r10 + 0x0038], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04b8008  ! 220: LDSB_R	ldsb	[%r14 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe422a018  ! 223: STW_I	stw	%r18, [%r10 + 0x0018]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0230008  ! 225: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xec098008  ! 226: LDUB_R	ldub	[%r6 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8218008  ! 228: STW_R	stw	%r20, [%r6 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0738008  ! 231: STX_R	stx	%r16, [%r14 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0536018  ! 233: LDSH_I	ldsh	[%r13 + 0x0018], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe049a008  ! 235: LDSB_I	ldsb	[%r6 + 0x0008], %r16
	.word 0xe0498008  ! 236: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe031a038  ! 237: STH_I	sth	%r16, [%r6 + 0x0038]
	.word 0xe812c008  ! 238: LDUH_R	lduh	[%r11 + %r8], %r20
	.word 0xe872a030  ! 239: STX_I	stx	%r20, [%r10 + 0x0030]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec232008  ! 243: STW_I	stw	%r22, [%r12 + 0x0008]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee1c0, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8034008  ! 249: LDUW_R	lduw	[%r13 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0530008  ! 251: LDSH_R	ldsh	[%r12 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4328008  ! 255: STH_R	sth	%r18, [%r10 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe021c008  ! 259: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xe0728008  ! 260: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe809a038  ! 261: LDUB_I	ldub	[%r6 + 0x0038], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe031e030  ! 264: STH_I	sth	%r16, [%r7 + 0x0030]
	.word 0xa442e038  ! 265: ADDC_I	addc 	%r11, 0x0038, %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec738008  ! 268: STX_R	stx	%r22, [%r14 + %r8]
	.word 0xe8218008  ! 269: STW_R	stw	%r20, [%r6 + %r8]
	setx	0x00000000d01ee000, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d04ef080, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d06ef100, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4038008  ! 272: LDUW_R	lduw	[%r14 + %r8], %r18
	.word 0xe05ac008  ! 273: LDX_R	ldx	[%r11 + %r8], %r16
	.word 0xe82ac008  ! 274: STB_R	stb	%r20, [%r11 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05b0008  ! 277: LDX_R	ldx	[%r12 + %r8], %r16
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe439a030  ! 280: STD_I	std	%r18, [%r6 + 0x0030]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8730008  ! 283: STX_R	stx	%r20, [%r12 + %r8]
	.word 0xe802c008  ! 284: LDUW_R	lduw	[%r11 + %r8], %r20
	.word 0xe4336008  ! 285: STH_I	sth	%r18, [%r13 + 0x0008]
	.word 0xe802a008  ! 286: LDUW_I	lduw	[%r10 + 0x0008], %r20
	.word 0xe829a010  ! 287: STB_I	stb	%r20, [%r6 + 0x0010]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe03b4008  ! 289: STD_R	std	%r16, [%r13 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa4b18008  ! 293: SUBCcc_R	orncc 	%r6, %r8, %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe809c008  ! 296: LDUB_R	ldub	[%r7 + %r8], %r20
	.word 0xec4b2020  ! 297: LDSB_I	ldsb	[%r12 + 0x0020], %r22
	.word 0xe00a8008  ! 298: LDUB_R	ldub	[%r10 + %r8], %r16
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_10:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe471c008  ! 5: STX_R	stx	%r18, [%r7 + %r8]
	.word 0xe02b2000  ! 7: STB_I	stb	%r16, [%r12 + 0x0000]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec218008  ! 9: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe0036028  ! 10: LDUW_I	lduw	[%r13 + 0x0028], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0330008  ! 12: STH_R	sth	%r16, [%r12 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec436020  ! 15: LDSW_I	ldsw	[%r13 + 0x0020], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8318008  ! 17: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xec39a038  ! 18: STD_I	std	%r22, [%r6 + 0x0038]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe03b6010  ! 20: STD_I	std	%r16, [%r13 + 0x0010]
	.word 0xec5b2038  ! 21: LDX_I	ldx	[%r12 + 0x0038], %r22
	.word 0xe42b4008  ! 22: STB_R	stb	%r18, [%r13 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec31e010  ! 24: STH_I	sth	%r22, [%r7 + 0x0010]
	.word 0xe019a038  ! 25: LDD_I	ldd	[%r6 + 0x0038], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe042a030  ! 27: LDSW_I	ldsw	[%r10 + 0x0030], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0332030  ! 31: STH_I	sth	%r16, [%r12 + 0x0030]
	.word 0xe4198008  ! 33: LDD_R	ldd	[%r6 + %r8], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec5b8008  ! 36: LDX_R	ldx	[%r14 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe82ae038  ! 38: STB_I	stb	%r20, [%r11 + 0x0038]
	.word 0xe83ac008  ! 39: STD_R	std	%r20, [%r11 + %r8]
	setx	0x00000000d02ef0c0, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d04ef1c0, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d06ef040, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec738008  ! 44: STX_R	stx	%r22, [%r14 + %r8]
	.word 0xec5b6010  ! 45: LDX_I	ldx	[%r13 + 0x0010], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82b2030  ! 49: STB_I	stb	%r20, [%r12 + 0x0030]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe03a8008  ! 56: STD_R	std	%r16, [%r10 + %r8]
	.word 0xe032a000  ! 57: STH_I	sth	%r16, [%r10 + 0x0000]
	.word 0xe0398008  ! 58: STD_R	std	%r16, [%r6 + %r8]
	.word 0xe0436008  ! 59: LDSW_I	ldsw	[%r13 + 0x0008], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe851a030  ! 61: LDSH_I	ldsh	[%r6 + 0x0030], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe44ba030  ! 63: LDSB_I	ldsb	[%r14 + 0x0030], %r18
	.word 0xec29e018  ! 64: STB_I	stb	%r22, [%r7 + 0x0018]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe40b2030  ! 67: LDUB_I	ldub	[%r12 + 0x0030], %r18
	.word 0xe032a010  ! 68: STH_I	sth	%r16, [%r10 + 0x0010]
	.word 0xe8534008  ! 69: LDSH_R	ldsh	[%r13 + %r8], %r20
	.word 0xe43ae020  ! 70: STD_I	std	%r18, [%r11 + 0x0020]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec734008  ! 72: STX_R	stx	%r22, [%r13 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4598008  ! 78: LDX_R	ldx	[%r6 + %r8], %r18
	.word 0xe409c008  ! 79: LDUB_R	ldub	[%r7 + %r8], %r18
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec4b8008  ! 81: LDSB_R	ldsb	[%r14 + %r8], %r22
	.word 0xe029c008  ! 82: STB_R	stb	%r16, [%r7 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe42a8008  ! 86: STB_R	stb	%r18, [%r10 + %r8]
	.word 0xec59a030  ! 87: LDX_I	ldx	[%r6 + 0x0030], %r22
	.word 0xe40a8008  ! 88: LDUB_R	ldub	[%r10 + %r8], %r18
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe839a028  ! 92: STD_I	std	%r20, [%r6 + 0x0028]
	.word 0xec728008  ! 93: STX_R	stx	%r22, [%r10 + %r8]
	setx	0x00000000d08e1100, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d08e10c0, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe429a000  ! 96: STB_I	stb	%r18, [%r6 + 0x0000]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82b4008  ! 98: STB_R	stb	%r20, [%r13 + %r8]
	.word 0xacab4008  ! 99: ANDNcc_R	andncc 	%r13, %r8, %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec336030  ! 102: STH_I	sth	%r22, [%r13 + 0x0030]
	.word 0xec030008  ! 103: LDUW_R	lduw	[%r12 + %r8], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8118008  ! 108: LDUH_R	lduh	[%r6 + %r8], %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa0a98008  ! 110: ANDNcc_R	andncc 	%r6, %r8, %r16
	.word 0xec1aa030  ! 111: LDD_I	ldd	[%r10 + 0x0030], %r22
	.word 0xa82b8008  ! 112: ANDN_R	andn 	%r14, %r8, %r20
	.word 0xe44b0008  ! 113: LDSB_R	ldsb	[%r12 + %r8], %r18
	.word 0xe429e038  ! 114: STB_I	stb	%r18, [%r7 + 0x0038]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0230008  ! 120: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xe013a030  ! 121: LDUH_I	lduh	[%r14 + 0x0030], %r16
	.word 0xe021e010  ! 122: STW_I	stw	%r16, [%r7 + 0x0010]
	.word 0xe4734008  ! 123: STX_R	stx	%r18, [%r13 + %r8]
	.word 0xe8338008  ! 124: STH_R	sth	%r20, [%r14 + %r8]
	.word 0xe431a018  ! 125: STH_I	sth	%r18, [%r6 + 0x0018]
	.word 0xec32e038  ! 126: STH_I	sth	%r22, [%r11 + 0x0038]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0018008  ! 131: LDUW_R	lduw	[%r6 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e1040, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d08e10c0, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d08e1040, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe819a018  ! 137: LDD_I	ldd	[%r6 + 0x0018], %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe02b4008  ! 140: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xe0028008  ! 141: LDUW_R	lduw	[%r10 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa031c008  ! 147: SUBC_R	orn 	%r7, %r8, %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe84b4008  ! 149: LDSB_R	ldsb	[%r13 + %r8], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec218008  ! 151: STW_R	stw	%r22, [%r6 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe05b6038  ! 156: LDX_I	ldx	[%r13 + 0x0038], %r16
	.word 0xe049c008  ! 157: LDSB_R	ldsb	[%r7 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe832a010  ! 159: STH_I	sth	%r20, [%r10 + 0x0010]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe432e008  ! 163: STH_I	sth	%r18, [%r11 + 0x0008]
	.word 0xe0018008  ! 165: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe42b8008  ! 166: STB_R	stb	%r18, [%r14 + %r8]
	.word 0xec52c008  ! 167: LDSH_R	ldsh	[%r11 + %r8], %r22
	.word 0xe071e018  ! 168: STX_I	stx	%r16, [%r7 + 0x0018]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe029a020  ! 171: STB_I	stb	%r16, [%r6 + 0x0020]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05b4008  ! 173: LDX_R	ldx	[%r13 + %r8], %r16
	.word 0xe4718008  ! 174: STX_R	stx	%r18, [%r6 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec31c008  ! 178: STH_R	sth	%r22, [%r7 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8030008  ! 181: LDUW_R	lduw	[%r12 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00ae010  ! 185: LDUB_I	ldub	[%r11 + 0x0010], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01b4008  ! 187: LDD_R	ldd	[%r13 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe02b0008  ! 189: STB_R	stb	%r16, [%r12 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe811c008  ! 191: LDUH_R	lduh	[%r7 + %r8], %r20
	.word 0xe459e018  ! 192: LDX_I	ldx	[%r7 + 0x0018], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4218008  ! 194: STW_R	stw	%r18, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0498008  ! 198: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe411c008  ! 199: LDUH_R	lduh	[%r7 + %r8], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec718008  ! 202: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xec71a010  ! 203: STX_I	stx	%r22, [%r6 + 0x0010]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe071a038  ! 207: STX_I	stx	%r16, [%r6 + 0x0038]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe4236010  ! 209: STW_I	stw	%r18, [%r13 + 0x0010]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4532038  ! 211: LDSH_I	ldsh	[%r12 + 0x0038], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe8328008  ! 214: STH_R	sth	%r20, [%r10 + %r8]
	.word 0xe822a030  ! 215: STW_I	stw	%r20, [%r10 + 0x0030]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec09a010  ! 218: LDUB_I	ldub	[%r6 + 0x0010], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe81b6008  ! 220: LDD_I	ldd	[%r13 + 0x0008], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0398008  ! 223: STD_R	std	%r16, [%r6 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe472a020  ! 225: STX_I	stx	%r18, [%r10 + 0x0020]
	.word 0xe8498008  ! 226: LDSB_R	ldsb	[%r6 + %r8], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe071e020  ! 228: STX_I	stx	%r16, [%r7 + 0x0020]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe429e018  ! 231: STB_I	stb	%r18, [%r7 + 0x0018]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe001a018  ! 233: LDUW_I	lduw	[%r6 + 0x0018], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe442c008  ! 235: LDSW_R	ldsw	[%r11 + %r8], %r18
	.word 0xe44b8008  ! 236: LDSB_R	ldsb	[%r14 + %r8], %r18
	.word 0xe821a020  ! 237: STW_I	stw	%r20, [%r6 + 0x0020]
	.word 0xe812c008  ! 238: LDUH_R	lduh	[%r11 + %r8], %r20
	.word 0xe421c008  ! 239: STW_R	stw	%r18, [%r7 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2ac008  ! 243: STB_R	stb	%r22, [%r11 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee040, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec41c008  ! 249: LDSW_R	ldsw	[%r7 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe053a020  ! 251: LDSH_I	ldsh	[%r14 + 0x0020], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe072e030  ! 255: STX_I	stx	%r16, [%r11 + 0x0030]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe03b6030  ! 259: STD_I	std	%r16, [%r13 + 0x0030]
	.word 0xe03aa020  ! 260: STD_I	std	%r16, [%r10 + 0x0020]
	.word 0xe0034008  ! 261: LDUW_R	lduw	[%r13 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec398008  ! 264: STD_R	std	%r22, [%r6 + %r8]
	.word 0xa8c18008  ! 265: ADDCcc_R	addccc 	%r6, %r8, %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe82ac008  ! 268: STB_R	stb	%r20, [%r11 + %r8]
	.word 0xe0330008  ! 269: STH_R	sth	%r16, [%r12 + %r8]
	setx	0x00000000d01ee040, %r1, %r6
	setx	0x00000000d02ef000, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d04ef040, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d06ef100, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05b2030  ! 272: LDX_I	ldx	[%r12 + 0x0030], %r16
	.word 0xe4138008  ! 273: LDUH_R	lduh	[%r14 + %r8], %r18
	.word 0xe821a010  ! 274: STW_I	stw	%r20, [%r6 + 0x0010]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00ac008  ! 277: LDUB_R	ldub	[%r11 + %r8], %r16
	setx	0x00000000d01ee040, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0718008  ! 280: STX_R	stx	%r16, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec32c008  ! 283: STH_R	sth	%r22, [%r11 + %r8]
	.word 0xe002e010  ! 284: LDUW_I	lduw	[%r11 + 0x0010], %r16
	.word 0xe839e030  ! 285: STD_I	std	%r20, [%r7 + 0x0030]
	.word 0xe811e010  ! 286: LDUH_I	lduh	[%r7 + 0x0010], %r20
	.word 0xe42b6038  ! 287: STB_I	stb	%r18, [%r13 + 0x0038]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0718008  ! 289: STX_R	stx	%r16, [%r6 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xac42c008  ! 293: ADDC_R	addc 	%r11, %r8, %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0034008  ! 296: LDUW_R	lduw	[%r13 + %r8], %r16
	.word 0xe051e028  ! 297: LDSH_I	ldsh	[%r7 + 0x0028], %r16
	.word 0xe042c008  ! 298: LDSW_R	ldsw	[%r11 + %r8], %r16
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_9:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec3ae030  ! 5: STD_I	std	%r22, [%r11 + 0x0030]
	.word 0xe432e008  ! 7: STH_I	sth	%r18, [%r11 + 0x0008]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8298008  ! 9: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xe04ac008  ! 10: LDSB_R	ldsb	[%r11 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0234008  ! 12: STW_R	stw	%r16, [%r13 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec038008  ! 15: LDUW_R	lduw	[%r14 + %r8], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02b8008  ! 17: STB_R	stb	%r16, [%r14 + %r8]
	.word 0xe4230008  ! 18: STW_R	stw	%r18, [%r12 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe833a000  ! 20: STH_I	sth	%r20, [%r14 + 0x0000]
	.word 0xe443a008  ! 21: LDSW_I	ldsw	[%r14 + 0x0008], %r18
	.word 0xe021a020  ! 22: STW_I	stw	%r16, [%r6 + 0x0020]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe072c008  ! 24: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe0038008  ! 25: LDUW_R	lduw	[%r14 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4018008  ! 27: LDUW_R	lduw	[%r6 + %r8], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0230008  ! 31: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xe4598008  ! 33: LDX_R	ldx	[%r6 + %r8], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe80b4008  ! 36: LDUB_R	ldub	[%r13 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe829a018  ! 38: STB_I	stb	%r20, [%r6 + 0x0018]
	.word 0xec32c008  ! 39: STH_R	sth	%r22, [%r11 + %r8]
	setx	0x00000000d02ef1c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d04ef040, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d06ef080, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec72c008  ! 44: STX_R	stx	%r22, [%r11 + %r8]
	.word 0xe40ba008  ! 45: LDUB_I	ldub	[%r14 + 0x0008], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe471e038  ! 49: STX_I	stx	%r18, [%r7 + 0x0038]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec728008  ! 56: STX_R	stx	%r22, [%r10 + %r8]
	.word 0xe471c008  ! 57: STX_R	stx	%r18, [%r7 + %r8]
	.word 0xec29a028  ! 58: STB_I	stb	%r22, [%r6 + 0x0028]
	.word 0xe0528008  ! 59: LDSH_R	ldsh	[%r10 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe051a018  ! 61: LDSH_I	ldsh	[%r6 + 0x0018], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4438008  ! 63: LDSW_R	ldsw	[%r14 + %r8], %r18
	.word 0xec338008  ! 64: STH_R	sth	%r22, [%r14 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe801a038  ! 67: LDUW_I	lduw	[%r6 + 0x0038], %r20
	.word 0xe8330008  ! 68: STH_R	sth	%r20, [%r12 + %r8]
	.word 0xe012a008  ! 69: LDUH_I	lduh	[%r10 + 0x0008], %r16
	.word 0xec334008  ! 70: STH_R	sth	%r22, [%r13 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2ae008  ! 72: STB_I	stb	%r22, [%r11 + 0x0008]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4030008  ! 78: LDUW_R	lduw	[%r12 + %r8], %r18
	.word 0xec11c008  ! 79: LDUH_R	lduh	[%r7 + %r8], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xec518008  ! 81: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xe8334008  ! 82: STH_R	sth	%r20, [%r13 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe8338008  ! 86: STH_R	sth	%r20, [%r14 + %r8]
	.word 0xe811e030  ! 87: LDUH_I	lduh	[%r7 + 0x0030], %r20
	.word 0xec434008  ! 88: LDSW_R	ldsw	[%r13 + %r8], %r22
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0298008  ! 92: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xec32e030  ! 93: STH_I	sth	%r22, [%r11 + 0x0030]
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e1080, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2ba008  ! 96: STB_I	stb	%r22, [%r14 + 0x0008]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4734008  ! 98: STX_R	stx	%r18, [%r13 + %r8]
	.word 0xac3aa020  ! 99: XNOR_I	xnor 	%r10, 0x0020, %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0728008  ! 102: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe0098008  ! 103: LDUB_R	ldub	[%r6 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec09e038  ! 108: LDUB_I	ldub	[%r7 + 0x0038], %r22
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa89ba028  ! 110: XORcc_I	xorcc 	%r14, 0x0028, %r20
	.word 0xe8536030  ! 111: LDSH_I	ldsh	[%r13 + 0x0030], %r20
	.word 0xa4bb0008  ! 112: XNORcc_R	xnorcc 	%r12, %r8, %r18
	.word 0xec436008  ! 113: LDSW_I	ldsw	[%r13 + 0x0008], %r22
	.word 0xe029a020  ! 114: STB_I	stb	%r16, [%r6 + 0x0020]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43ba020  ! 120: STD_I	std	%r18, [%r14 + 0x0020]
	.word 0xe01ae030  ! 121: LDD_I	ldd	[%r11 + 0x0030], %r16
	.word 0xec31e028  ! 122: STH_I	sth	%r22, [%r7 + 0x0028]
	.word 0xec718008  ! 123: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe021a030  ! 124: STW_I	stw	%r16, [%r6 + 0x0030]
	.word 0xe42a8008  ! 125: STB_R	stb	%r18, [%r10 + %r8]
	.word 0xe03b4008  ! 126: STD_R	std	%r16, [%r13 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8498008  ! 131: LDSB_R	ldsb	[%r6 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e1040, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e1140, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d08e1080, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe84b0008  ! 137: LDSB_R	ldsb	[%r12 + %r8], %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe871a018  ! 140: STX_I	stx	%r20, [%r6 + 0x0018]
	.word 0xe041e038  ! 141: LDSW_I	ldsw	[%r7 + 0x0038], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0828008  ! 147: ADDcc_R	addcc 	%r10, %r8, %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe441a028  ! 149: LDSW_I	ldsw	[%r6 + 0x0028], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe02b2018  ! 151: STB_I	stb	%r16, [%r12 + 0x0018]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec49c008  ! 156: LDSB_R	ldsb	[%r7 + %r8], %r22
	.word 0xe4518008  ! 157: LDSH_R	ldsh	[%r6 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe471e038  ! 159: STX_I	stx	%r18, [%r7 + 0x0038]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe073a030  ! 163: STX_I	stx	%r16, [%r14 + 0x0030]
	.word 0xe41ba030  ! 165: LDD_I	ldd	[%r14 + 0x0030], %r18
	.word 0xe822e028  ! 166: STW_I	stw	%r20, [%r11 + 0x0028]
	.word 0xec51e020  ! 167: LDSH_I	ldsh	[%r7 + 0x0020], %r22
	.word 0xe031a030  ! 168: STH_I	sth	%r16, [%r6 + 0x0030]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec734008  ! 171: STX_R	stx	%r22, [%r13 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe053a030  ! 173: LDSH_I	ldsh	[%r14 + 0x0030], %r16
	.word 0xe03b8008  ! 174: STD_R	std	%r16, [%r14 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe032c008  ! 178: STH_R	sth	%r16, [%r11 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe402a008  ! 181: LDUW_I	lduw	[%r10 + 0x0008], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe411e028  ! 185: LDUH_I	lduh	[%r7 + 0x0028], %r18
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe41b2020  ! 187: LDD_I	ldd	[%r12 + 0x0020], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0298008  ! 189: STB_R	stb	%r16, [%r6 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0432028  ! 191: LDSW_I	ldsw	[%r12 + 0x0028], %r16
	.word 0xe041a030  ! 192: LDSW_I	ldsw	[%r6 + 0x0030], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe431a038  ! 194: STH_I	sth	%r18, [%r6 + 0x0038]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0032018  ! 198: LDUW_I	lduw	[%r12 + 0x0018], %r16
	.word 0xe011a008  ! 199: LDUH_I	lduh	[%r6 + 0x0008], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe83ae018  ! 202: STD_I	std	%r20, [%r11 + 0x0018]
	.word 0xe071e030  ! 203: STX_I	stx	%r16, [%r7 + 0x0030]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec718008  ! 207: STX_R	stx	%r22, [%r6 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe83b8008  ! 209: STD_R	std	%r20, [%r14 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec0b6010  ! 211: LDUB_I	ldub	[%r13 + 0x0010], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec21a020  ! 214: STW_I	stw	%r22, [%r6 + 0x0020]
	.word 0xe031a000  ! 215: STH_I	sth	%r16, [%r6 + 0x0000]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe001c008  ! 218: LDUW_R	lduw	[%r7 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe413a000  ! 220: LDUH_I	lduh	[%r14 + 0x0000], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe4234008  ! 223: STW_R	stw	%r18, [%r13 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe871e010  ! 225: STX_I	stx	%r20, [%r7 + 0x0010]
	.word 0xe0518008  ! 226: LDSH_R	ldsh	[%r6 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8730008  ! 228: STX_R	stx	%r20, [%r12 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82b4008  ! 231: STB_R	stb	%r20, [%r13 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec536008  ! 233: LDSH_I	ldsh	[%r13 + 0x0008], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe05b4008  ! 235: LDX_R	ldx	[%r13 + %r8], %r16
	.word 0xe01b0008  ! 236: LDD_R	ldd	[%r12 + %r8], %r16
	.word 0xe429a000  ! 237: STB_I	stb	%r18, [%r6 + 0x0000]
	.word 0xe801a028  ! 238: LDUW_I	lduw	[%r6 + 0x0028], %r20
	.word 0xe429c008  ! 239: STB_R	stb	%r18, [%r7 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03ac008  ! 243: STD_R	std	%r16, [%r11 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee140, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0528008  ! 249: LDSH_R	ldsh	[%r10 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe44aa018  ! 251: LDSB_I	ldsb	[%r10 + 0x0018], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe873a008  ! 255: STX_I	stx	%r20, [%r14 + 0x0008]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8734008  ! 259: STX_R	stx	%r20, [%r13 + %r8]
	.word 0xe0218008  ! 260: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe012a038  ! 261: LDUH_I	lduh	[%r10 + 0x0038], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4238008  ! 264: STW_R	stw	%r18, [%r14 + %r8]
	.word 0xa4c3a030  ! 265: ADDCcc_I	addccc 	%r14, 0x0030, %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe03b0008  ! 268: STD_R	std	%r16, [%r12 + %r8]
	.word 0xe439e028  ! 269: STD_I	std	%r18, [%r7 + 0x0028]
	setx	0x00000000d01ee000, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d04ef080, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d06ef080, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec118008  ! 272: LDUH_R	lduh	[%r6 + %r8], %r22
	.word 0xe41ba018  ! 273: LDD_I	ldd	[%r14 + 0x0018], %r18
	.word 0xe029e010  ! 274: STB_I	stb	%r16, [%r7 + 0x0010]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec032000  ! 277: LDUW_I	lduw	[%r12 + 0x0000], %r22
	setx	0x00000000d01ee140, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4730008  ! 280: STX_R	stx	%r18, [%r12 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec2ba028  ! 283: STB_I	stb	%r22, [%r14 + 0x0028]
	.word 0xe041c008  ! 284: LDSW_R	ldsw	[%r7 + %r8], %r16
	.word 0xec71e000  ! 285: STX_I	stx	%r22, [%r7 + 0x0000]
	.word 0xe451c008  ! 286: LDSH_R	ldsh	[%r7 + %r8], %r18
	.word 0xe8230008  ! 287: STW_R	stw	%r20, [%r12 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe021c008  ! 289: STW_R	stw	%r16, [%r7 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xac8ac008  ! 293: ANDcc_R	andcc 	%r11, %r8, %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00b0008  ! 296: LDUB_R	ldub	[%r12 + %r8], %r16
	.word 0xe0428008  ! 297: LDSW_R	ldsw	[%r10 + %r8], %r16
	.word 0xe81aa018  ! 298: LDD_I	ldd	[%r10 + 0x0018], %r20
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_8:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2b6030  ! 5: STB_I	stb	%r22, [%r13 + 0x0030]
	.word 0xe0218008  ! 7: STW_R	stw	%r16, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec39a028  ! 9: STD_I	std	%r22, [%r6 + 0x0028]
	.word 0xe859e008  ! 10: LDX_I	ldx	[%r7 + 0x0008], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe43ba028  ! 12: STD_I	std	%r18, [%r14 + 0x0028]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec0b6000  ! 15: LDUB_I	ldub	[%r13 + 0x0000], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec31a008  ! 17: STH_I	sth	%r22, [%r6 + 0x0008]
	.word 0xec21a038  ! 18: STW_I	stw	%r22, [%r6 + 0x0038]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe872a030  ! 20: STX_I	stx	%r20, [%r10 + 0x0030]
	.word 0xec198008  ! 21: LDD_R	ldd	[%r6 + %r8], %r22
	.word 0xe8718008  ! 22: STX_R	stx	%r20, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe82a8008  ! 24: STB_R	stb	%r20, [%r10 + %r8]
	.word 0xe85a8008  ! 25: LDX_R	ldx	[%r10 + %r8], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe40b6038  ! 27: LDUB_I	ldub	[%r13 + 0x0038], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec71a028  ! 31: STX_I	stx	%r22, [%r6 + 0x0028]
	.word 0xec0a8008  ! 33: LDUB_R	ldub	[%r10 + %r8], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec0ac008  ! 36: LDUB_R	ldub	[%r11 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe472c008  ! 38: STX_R	stx	%r18, [%r11 + %r8]
	.word 0xe0730008  ! 39: STX_R	stx	%r16, [%r12 + %r8]
	setx	0x00000000d02ef000, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d04ef100, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d06ef180, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec29e008  ! 44: STB_I	stb	%r22, [%r7 + 0x0008]
	.word 0xec132020  ! 45: LDUH_I	lduh	[%r12 + 0x0020], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0730008  ! 49: STX_R	stx	%r16, [%r12 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe03aa000  ! 56: STD_I	std	%r16, [%r10 + 0x0000]
	.word 0xec2ba020  ! 57: STB_I	stb	%r22, [%r14 + 0x0020]
	.word 0xe472c008  ! 58: STX_R	stx	%r18, [%r11 + %r8]
	.word 0xe049c008  ! 59: LDSB_R	ldsb	[%r7 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4034008  ! 61: LDUW_R	lduw	[%r13 + %r8], %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe851c008  ! 63: LDSH_R	ldsh	[%r7 + %r8], %r20
	.word 0xe822c008  ! 64: STW_R	stw	%r20, [%r11 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0138008  ! 67: LDUH_R	lduh	[%r14 + %r8], %r16
	.word 0xec234008  ! 68: STW_R	stw	%r22, [%r13 + %r8]
	.word 0xec53a028  ! 69: LDSH_I	ldsh	[%r14 + 0x0028], %r22
	.word 0xe0232020  ! 70: STW_I	stw	%r16, [%r12 + 0x0020]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe071a038  ! 72: STX_I	stx	%r16, [%r6 + 0x0038]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec418008  ! 78: LDSW_R	ldsw	[%r6 + %r8], %r22
	.word 0xe049a038  ! 79: LDSB_I	ldsb	[%r6 + 0x0038], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe8032028  ! 81: LDUW_I	lduw	[%r12 + 0x0028], %r20
	.word 0xe42ac008  ! 82: STB_R	stb	%r18, [%r11 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe021a000  ! 86: STW_I	stw	%r16, [%r6 + 0x0000]
	.word 0xec036030  ! 87: LDUW_I	lduw	[%r13 + 0x0030], %r22
	.word 0xe01a8008  ! 88: LDD_R	ldd	[%r10 + %r8], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8332000  ! 92: STH_I	sth	%r20, [%r12 + 0x0000]
	.word 0xec218008  ! 93: STW_R	stw	%r22, [%r6 + %r8]
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e1080, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe421a010  ! 96: STW_I	stw	%r18, [%r6 + 0x0010]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03b4008  ! 98: STD_R	std	%r16, [%r13 + %r8]
	.word 0xa8832000  ! 99: ADDcc_I	addcc 	%r12, 0x0000, %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec3b4008  ! 102: STD_R	std	%r22, [%r13 + %r8]
	.word 0xe8032000  ! 103: LDUW_I	lduw	[%r12 + 0x0000], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0038008  ! 108: LDUW_R	lduw	[%r14 + %r8], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa0198008  ! 110: XOR_R	xor 	%r6, %r8, %r16
	.word 0xec134008  ! 111: LDUH_R	lduh	[%r13 + %r8], %r22
	.word 0xa02b8008  ! 112: ANDN_R	andn 	%r14, %r8, %r16
	.word 0xec1ae038  ! 113: LDD_I	ldd	[%r11 + 0x0038], %r22
	.word 0xec72e028  ! 114: STX_I	stx	%r22, [%r11 + 0x0028]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec23a008  ! 120: STW_I	stw	%r22, [%r14 + 0x0008]
	.word 0xe449a018  ! 121: LDSB_I	ldsb	[%r6 + 0x0018], %r18
	.word 0xe821a008  ! 122: STW_I	stw	%r20, [%r6 + 0x0008]
	.word 0xe83b6008  ! 123: STD_I	std	%r20, [%r13 + 0x0008]
	.word 0xe8218008  ! 124: STW_R	stw	%r20, [%r6 + %r8]
	.word 0xec2aa008  ! 125: STB_I	stb	%r22, [%r10 + 0x0008]
	.word 0xe4734008  ! 126: STX_R	stx	%r18, [%r13 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec01c008  ! 131: LDUW_R	lduw	[%r7 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e1000, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe041a020  ! 137: LDSW_I	ldsw	[%r6 + 0x0020], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec738008  ! 140: STX_R	stx	%r22, [%r14 + %r8]
	.word 0xe04b8008  ! 141: LDSB_R	ldsb	[%r14 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa441e008  ! 147: ADDC_I	addc 	%r7, 0x0008, %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe4498008  ! 149: LDSB_R	ldsb	[%r6 + %r8], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe031c008  ! 151: STH_R	sth	%r16, [%r7 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec0ac008  ! 156: LDUB_R	ldub	[%r11 + %r8], %r22
	.word 0xe043a008  ! 157: LDSW_I	ldsw	[%r14 + 0x0008], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe432a000  ! 159: STH_I	sth	%r18, [%r10 + 0x0000]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe872e018  ! 163: STX_I	stx	%r20, [%r11 + 0x0018]
	.word 0xe0032038  ! 165: LDUW_I	lduw	[%r12 + 0x0038], %r16
	.word 0xe8718008  ! 166: STX_R	stx	%r20, [%r6 + %r8]
	.word 0xe05ae000  ! 167: LDX_I	ldx	[%r11 + 0x0000], %r16
	.word 0xe832e028  ! 168: STH_I	sth	%r20, [%r11 + 0x0028]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec218008  ! 171: STW_R	stw	%r22, [%r6 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4036008  ! 173: LDUW_I	lduw	[%r13 + 0x0008], %r18
	.word 0xec32e038  ! 174: STH_I	sth	%r22, [%r11 + 0x0038]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe8398008  ! 178: STD_R	std	%r20, [%r6 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec018008  ! 181: LDUW_R	lduw	[%r6 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05b6000  ! 185: LDX_I	ldx	[%r13 + 0x0000], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe401a000  ! 187: LDUW_I	lduw	[%r6 + 0x0000], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe02a8008  ! 189: STB_R	stb	%r16, [%r10 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0498008  ! 191: LDSB_R	ldsb	[%r6 + %r8], %r16
	.word 0xe85b8008  ! 192: LDX_R	ldx	[%r14 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe82b6000  ! 194: STB_I	stb	%r20, [%r13 + 0x0000]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe859a038  ! 198: LDX_I	ldx	[%r6 + 0x0038], %r20
	.word 0xe05aa028  ! 199: LDX_I	ldx	[%r10 + 0x0028], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe032e038  ! 202: STH_I	sth	%r16, [%r11 + 0x0038]
	.word 0xe073a030  ! 203: STX_I	stx	%r16, [%r14 + 0x0030]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe039e038  ! 207: STD_I	std	%r16, [%r7 + 0x0038]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe472c008  ! 209: STX_R	stx	%r18, [%r11 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe411c008  ! 211: LDUH_R	lduh	[%r7 + %r8], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe4230008  ! 214: STW_R	stw	%r18, [%r12 + %r8]
	.word 0xe0334008  ! 215: STH_R	sth	%r16, [%r13 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe40b0008  ! 218: LDUB_R	ldub	[%r12 + %r8], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe44b8008  ! 220: LDSB_R	ldsb	[%r14 + %r8], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe031c008  ! 223: STH_R	sth	%r16, [%r7 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe029c008  ! 225: STB_R	stb	%r16, [%r7 + %r8]
	.word 0xe45ba038  ! 226: LDX_I	ldx	[%r14 + 0x0038], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4298008  ! 228: STB_R	stb	%r18, [%r6 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec29e010  ! 231: STB_I	stb	%r22, [%r7 + 0x0010]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe452e038  ! 233: LDSH_I	ldsh	[%r11 + 0x0038], %r18
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe4532018  ! 235: LDSH_I	ldsh	[%r12 + 0x0018], %r18
	.word 0xe4198008  ! 236: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xe82ac008  ! 237: STB_R	stb	%r20, [%r11 + %r8]
	.word 0xe051c008  ! 238: LDSH_R	ldsh	[%r7 + %r8], %r16
	.word 0xe43b8008  ! 239: STD_R	std	%r18, [%r14 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe072a030  ! 243: STX_I	stx	%r16, [%r10 + 0x0030]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee0c0, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01ba038  ! 249: LDD_I	ldd	[%r14 + 0x0038], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0128008  ! 251: LDUH_R	lduh	[%r10 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe072a010  ! 255: STX_I	stx	%r16, [%r10 + 0x0010]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec3b6010  ! 259: STD_I	std	%r22, [%r13 + 0x0010]
	.word 0xe871e000  ! 260: STX_I	stx	%r20, [%r7 + 0x0000]
	.word 0xec428008  ! 261: LDSW_R	ldsw	[%r10 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe071e030  ! 264: STX_I	stx	%r16, [%r7 + 0x0030]
	.word 0xa481e010  ! 265: ADDcc_I	addcc 	%r7, 0x0010, %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec2a8008  ! 268: STB_R	stb	%r22, [%r10 + %r8]
	.word 0xe431c008  ! 269: STH_R	sth	%r18, [%r7 + %r8]
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d02ef140, %r1, %r7
	setx	0x00000000d03ef080, %r1, %r14
	setx	0x00000000d04ef180, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d06ef080, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe859c008  ! 272: LDX_R	ldx	[%r7 + %r8], %r20
	.word 0xe8530008  ! 273: LDSH_R	ldsh	[%r12 + %r8], %r20
	.word 0xe8334008  ! 274: STH_R	sth	%r20, [%r13 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe80b0008  ! 277: LDUB_R	ldub	[%r12 + %r8], %r20
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0218008  ! 280: STW_R	stw	%r16, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe82b6020  ! 283: STB_I	stb	%r20, [%r13 + 0x0020]
	.word 0xe81b4008  ! 284: LDD_R	ldd	[%r13 + %r8], %r20
	.word 0xe8736000  ! 285: STX_I	stx	%r20, [%r13 + 0x0000]
	.word 0xe80b6018  ! 286: LDUB_I	ldub	[%r13 + 0x0018], %r20
	.word 0xe8728008  ! 287: STX_R	stx	%r20, [%r10 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec228008  ! 289: STW_R	stw	%r22, [%r10 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa8b30008  ! 293: SUBCcc_R	orncc 	%r12, %r8, %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8498008  ! 296: LDSB_R	ldsb	[%r6 + %r8], %r20
	.word 0xe0532008  ! 297: LDSH_I	ldsh	[%r12 + 0x0008], %r16
	.word 0xe0532020  ! 298: LDSH_I	ldsh	[%r12 + 0x0020], %r16
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe073a030  ! 5: STX_I	stx	%r16, [%r14 + 0x0030]
	.word 0xe4238008  ! 7: STW_R	stw	%r18, [%r14 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0338008  ! 9: STH_R	sth	%r16, [%r14 + %r8]
	.word 0xec43a000  ! 10: LDSW_I	ldsw	[%r14 + 0x0000], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe8232028  ! 12: STW_I	stw	%r20, [%r12 + 0x0028]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4030008  ! 15: LDUW_R	lduw	[%r12 + %r8], %r18
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe872e038  ! 17: STX_I	stx	%r20, [%r11 + 0x0038]
	.word 0xe0228008  ! 18: STW_R	stw	%r16, [%r10 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe03ae018  ! 20: STD_I	std	%r16, [%r11 + 0x0018]
	.word 0xe002c008  ! 21: LDUW_R	lduw	[%r11 + %r8], %r16
	.word 0xe0332018  ! 22: STH_I	sth	%r16, [%r12 + 0x0018]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec730008  ! 24: STX_R	stx	%r22, [%r12 + %r8]
	.word 0xe8538008  ! 25: LDSH_R	ldsh	[%r14 + %r8], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe80b2000  ! 27: LDUB_I	ldub	[%r12 + 0x0000], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0318008  ! 31: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe852a028  ! 33: LDSH_I	ldsh	[%r10 + 0x0028], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe40b8008  ! 36: LDUB_R	ldub	[%r14 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec2b6030  ! 38: STB_I	stb	%r22, [%r13 + 0x0030]
	.word 0xe8318008  ! 39: STH_R	sth	%r20, [%r6 + %r8]
	setx	0x00000000d02ef140, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d04ef040, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d06ef100, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8230008  ! 44: STW_R	stw	%r20, [%r12 + %r8]
	.word 0xe4430008  ! 45: LDSW_R	ldsw	[%r12 + %r8], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe421a028  ! 49: STW_I	stw	%r18, [%r6 + 0x0028]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe071e000  ! 56: STX_I	stx	%r16, [%r7 + 0x0000]
	.word 0xe42b2008  ! 57: STB_I	stb	%r18, [%r12 + 0x0008]
	.word 0xe4218008  ! 58: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe842a030  ! 59: LDSW_I	ldsw	[%r10 + 0x0030], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec1b2028  ! 61: LDD_I	ldd	[%r12 + 0x0028], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec036000  ! 63: LDUW_I	lduw	[%r13 + 0x0000], %r22
	.word 0xec71e020  ! 64: STX_I	stx	%r22, [%r7 + 0x0020]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec498008  ! 67: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xe02b8008  ! 68: STB_R	stb	%r16, [%r14 + %r8]
	.word 0xec438008  ! 69: LDSW_R	ldsw	[%r14 + %r8], %r22
	.word 0xe0232010  ! 70: STW_I	stw	%r16, [%r12 + 0x0010]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0728008  ! 72: STX_R	stx	%r16, [%r10 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8432020  ! 78: LDSW_I	ldsw	[%r12 + 0x0020], %r20
	.word 0xe452a038  ! 79: LDSH_I	ldsh	[%r10 + 0x0038], %r18
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe409c008  ! 81: LDUB_R	ldub	[%r7 + %r8], %r18
	.word 0xe83b8008  ! 82: STD_R	std	%r20, [%r14 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe82ae000  ! 86: STB_I	stb	%r20, [%r11 + 0x0000]
	.word 0xe41a8008  ! 87: LDD_R	ldd	[%r10 + %r8], %r18
	.word 0xe409c008  ! 88: LDUB_R	ldub	[%r7 + %r8], %r18
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0238008  ! 92: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xe0218008  ! 93: STW_R	stw	%r16, [%r6 + %r8]
	setx	0x00000000d08e10c0, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d08e1100, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d08e1040, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0328008  ! 96: STH_R	sth	%r16, [%r10 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021c008  ! 98: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xa019e038  ! 99: XOR_I	xor 	%r7, 0x0038, %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe83ac008  ! 102: STD_R	std	%r20, [%r11 + %r8]
	.word 0xe05ae018  ! 103: LDX_I	ldx	[%r11 + 0x0018], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe012c008  ! 108: LDUH_R	lduh	[%r11 + %r8], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa839a018  ! 110: XNOR_I	xnor 	%r6, 0x0018, %r20
	.word 0xe809a018  ! 111: LDUB_I	ldub	[%r6 + 0x0018], %r20
	.word 0xa4baa008  ! 112: XNORcc_I	xnorcc 	%r10, 0x0008, %r18
	.word 0xe80b6010  ! 113: LDUB_I	ldub	[%r13 + 0x0010], %r20
	.word 0xe073a000  ! 114: STX_I	stx	%r16, [%r14 + 0x0000]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0318008  ! 120: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe052e010  ! 121: LDSH_I	ldsh	[%r11 + 0x0010], %r16
	.word 0xe021e020  ! 122: STW_I	stw	%r16, [%r7 + 0x0020]
	.word 0xe82a8008  ! 123: STB_R	stb	%r20, [%r10 + %r8]
	.word 0xe02b4008  ! 124: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xec31a038  ! 125: STH_I	sth	%r22, [%r6 + 0x0038]
	.word 0xe8298008  ! 126: STB_R	stb	%r20, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0032028  ! 131: LDUW_I	lduw	[%r12 + 0x0028], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e10c0, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d08e1080, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec51e038  ! 137: LDSH_I	ldsh	[%r7 + 0x0038], %r22
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe839a028  ! 140: STD_I	std	%r20, [%r6 + 0x0028]
	.word 0xec530008  ! 141: LDSH_R	ldsh	[%r12 + %r8], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa02b0008  ! 147: ANDN_R	andn 	%r12, %r8, %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec018008  ! 149: LDUW_R	lduw	[%r6 + %r8], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe8398008  ! 151: STD_R	std	%r20, [%r6 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe811a038  ! 156: LDUH_I	lduh	[%r6 + 0x0038], %r20
	.word 0xe41a8008  ! 157: LDD_R	ldd	[%r10 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0718008  ! 159: STX_R	stx	%r16, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe029a028  ! 163: STB_I	stb	%r16, [%r6 + 0x0028]
	.word 0xe8132008  ! 165: LDUH_I	lduh	[%r12 + 0x0008], %r20
	.word 0xe871a000  ! 166: STX_I	stx	%r20, [%r6 + 0x0000]
	.word 0xe009a008  ! 167: LDUB_I	ldub	[%r6 + 0x0008], %r16
	.word 0xe471a018  ! 168: STX_I	stx	%r18, [%r6 + 0x0018]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe02b0008  ! 171: STB_R	stb	%r16, [%r12 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe85b0008  ! 173: LDX_R	ldx	[%r12 + %r8], %r20
	.word 0xe0398008  ! 174: STD_R	std	%r16, [%r6 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe0234008  ! 178: STW_R	stw	%r16, [%r13 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe05b8008  ! 181: LDX_R	ldx	[%r14 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe041c008  ! 185: LDSW_R	ldsw	[%r7 + %r8], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec5b2020  ! 187: LDX_I	ldx	[%r12 + 0x0020], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe8230008  ! 189: STW_R	stw	%r20, [%r12 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe802e000  ! 191: LDUW_I	lduw	[%r11 + 0x0000], %r20
	.word 0xe4430008  ! 192: LDSW_R	ldsw	[%r12 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec71a020  ! 194: STX_I	stx	%r22, [%r6 + 0x0020]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe40b0008  ! 198: LDUB_R	ldub	[%r12 + %r8], %r18
	.word 0xec01a000  ! 199: LDUW_I	lduw	[%r6 + 0x0000], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe872a038  ! 202: STX_I	stx	%r20, [%r10 + 0x0038]
	.word 0xe03ac008  ! 203: STD_R	std	%r16, [%r11 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe029c008  ! 207: STB_R	stb	%r16, [%r7 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe429c008  ! 209: STB_R	stb	%r18, [%r7 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe80b8008  ! 211: LDUB_R	ldub	[%r14 + %r8], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec72a030  ! 214: STX_I	stx	%r22, [%r10 + 0x0030]
	.word 0xe839c008  ! 215: STD_R	std	%r20, [%r7 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe00b8008  ! 218: LDUB_R	ldub	[%r14 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec42c008  ! 220: LDSW_R	ldsw	[%r11 + %r8], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec734008  ! 223: STX_R	stx	%r22, [%r13 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe473a020  ! 225: STX_I	stx	%r18, [%r14 + 0x0020]
	.word 0xe05aa000  ! 226: LDX_I	ldx	[%r10 + 0x0000], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02b0008  ! 228: STB_R	stb	%r16, [%r12 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec238008  ! 231: STW_R	stw	%r22, [%r14 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec428008  ! 233: LDSW_R	ldsw	[%r10 + %r8], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe05ba030  ! 235: LDX_I	ldx	[%r14 + 0x0030], %r16
	.word 0xe009e010  ! 236: LDUB_I	ldub	[%r7 + 0x0010], %r16
	.word 0xe02b2038  ! 237: STB_I	stb	%r16, [%r12 + 0x0038]
	.word 0xec130008  ! 238: LDUH_R	lduh	[%r12 + %r8], %r22
	.word 0xec318008  ! 239: STH_R	sth	%r22, [%r6 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8228008  ! 243: STW_R	stw	%r20, [%r10 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee040, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe812c008  ! 249: LDUH_R	lduh	[%r11 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0418008  ! 251: LDSW_R	ldsw	[%r6 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0228008  ! 255: STW_R	stw	%r16, [%r10 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe03b8008  ! 259: STD_R	std	%r16, [%r14 + %r8]
	.word 0xe0336018  ! 260: STH_I	sth	%r16, [%r13 + 0x0018]
	.word 0xe85aa038  ! 261: LDX_I	ldx	[%r10 + 0x0038], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe422a018  ! 264: STW_I	stw	%r18, [%r10 + 0x0018]
	.word 0xac22c008  ! 265: SUB_R	sub 	%r11, %r8, %r22
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe8734008  ! 268: STX_R	stx	%r20, [%r13 + %r8]
	.word 0xe8330008  ! 269: STH_R	sth	%r20, [%r12 + %r8]
	setx	0x00000000d01ee0c0, %r1, %r6
	setx	0x00000000d02ef1c0, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef100, %r1, %r10
	setx	0x00000000d05ef140, %r1, %r11
	setx	0x00000000d06ef040, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe819a000  ! 272: LDD_I	ldd	[%r6 + 0x0000], %r20
	.word 0xe852a018  ! 273: LDSH_I	ldsh	[%r10 + 0x0018], %r20
	.word 0xe4734008  ! 274: STX_R	stx	%r18, [%r13 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04a8008  ! 277: LDSB_R	ldsb	[%r10 + %r8], %r16
	setx	0x00000000d01ee100, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0230008  ! 280: STW_R	stw	%r16, [%r12 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0228008  ! 283: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xe01aa038  ! 284: LDD_I	ldd	[%r10 + 0x0038], %r16
	.word 0xe0728008  ! 285: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe0028008  ! 286: LDUW_R	lduw	[%r10 + %r8], %r16
	.word 0xe0338008  ! 287: STH_R	sth	%r16, [%r14 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe072c008  ! 289: STX_R	stx	%r16, [%r11 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0232008  ! 293: SUB_I	sub 	%r12, 0x0008, %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec4ba010  ! 296: LDSB_I	ldsb	[%r14 + 0x0010], %r22
	.word 0xe409c008  ! 297: LDUB_R	ldub	[%r7 + %r8], %r18
	.word 0xe002a008  ! 298: LDUW_I	lduw	[%r10 + 0x0008], %r16
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe471a018  ! 5: STX_I	stx	%r18, [%r6 + 0x0018]
	.word 0xec3b2030  ! 7: STD_I	std	%r22, [%r12 + 0x0030]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82b4008  ! 9: STB_R	stb	%r20, [%r13 + %r8]
	.word 0xe8138008  ! 10: LDUH_R	lduh	[%r14 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe421c008  ! 12: STW_R	stw	%r18, [%r7 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe049a008  ! 15: LDSB_I	ldsb	[%r6 + 0x0008], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe039c008  ! 17: STD_R	std	%r16, [%r7 + %r8]
	.word 0xe031a020  ! 18: STH_I	sth	%r16, [%r6 + 0x0020]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe072c008  ! 20: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe8518008  ! 21: LDSH_R	ldsh	[%r6 + %r8], %r20
	.word 0xe032a008  ! 22: STH_I	sth	%r16, [%r10 + 0x0008]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe42b0008  ! 24: STB_R	stb	%r18, [%r12 + %r8]
	.word 0xec1ae010  ! 25: LDD_I	ldd	[%r11 + 0x0010], %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04b6030  ! 27: LDSB_I	ldsb	[%r13 + 0x0030], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe071e030  ! 31: STX_I	stx	%r16, [%r7 + 0x0030]
	.word 0xe019a018  ! 33: LDD_I	ldd	[%r6 + 0x0018], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec432028  ! 36: LDSW_I	ldsw	[%r12 + 0x0028], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4318008  ! 38: STH_R	sth	%r18, [%r6 + %r8]
	.word 0xe031c008  ! 39: STH_R	sth	%r16, [%r7 + %r8]
	setx	0x00000000d02ef180, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d04ef0c0, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d06ef140, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1040, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe022a028  ! 44: STW_I	stw	%r16, [%r10 + 0x0028]
	.word 0xe00b8008  ! 45: LDUB_R	ldub	[%r14 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8718008  ! 49: STX_R	stx	%r20, [%r6 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe02aa038  ! 56: STB_I	stb	%r16, [%r10 + 0x0038]
	.word 0xec298008  ! 57: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xec338008  ! 58: STH_R	sth	%r22, [%r14 + %r8]
	.word 0xe05b2010  ! 59: LDX_I	ldx	[%r12 + 0x0010], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe059a000  ! 61: LDX_I	ldx	[%r6 + 0x0000], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe40b6010  ! 63: LDUB_I	ldub	[%r13 + 0x0010], %r18
	.word 0xe039e038  ! 64: STD_I	std	%r16, [%r7 + 0x0038]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01ba028  ! 67: LDD_I	ldd	[%r14 + 0x0028], %r16
	.word 0xe0238008  ! 68: STW_R	stw	%r16, [%r14 + %r8]
	.word 0xec02e008  ! 69: LDUW_I	lduw	[%r11 + 0x0008], %r22
	.word 0xec72c008  ! 70: STX_R	stx	%r22, [%r11 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02b6018  ! 72: STB_I	stb	%r16, [%r13 + 0x0018]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe052e038  ! 78: LDSH_I	ldsh	[%r11 + 0x0038], %r16
	.word 0xec518008  ! 79: LDSH_R	ldsh	[%r6 + %r8], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe00a8008  ! 81: LDUB_R	ldub	[%r10 + %r8], %r16
	.word 0xe032c008  ! 82: STH_R	sth	%r16, [%r11 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe029a020  ! 86: STB_I	stb	%r16, [%r6 + 0x0020]
	.word 0xe0028008  ! 87: LDUW_R	lduw	[%r10 + %r8], %r16
	.word 0xe05ac008  ! 88: LDX_R	ldx	[%r11 + %r8], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec398008  ! 92: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe072c008  ! 93: STX_R	stx	%r16, [%r11 + %r8]
	setx	0x00000000d08e11c0, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d08e1180, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d08e1040, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2b6020  ! 96: STB_I	stb	%r22, [%r13 + 0x0020]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4338008  ! 98: STH_R	sth	%r18, [%r14 + %r8]
	.word 0xac22a020  ! 99: SUB_I	sub 	%r10, 0x0020, %r22
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec228008  ! 102: STW_R	stw	%r22, [%r10 + %r8]
	.word 0xe0438008  ! 103: LDSW_R	ldsw	[%r14 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe44b8008  ! 108: LDSB_R	ldsb	[%r14 + %r8], %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xac898008  ! 110: ANDcc_R	andcc 	%r6, %r8, %r22
	.word 0xe01b0008  ! 111: LDD_R	ldd	[%r12 + %r8], %r16
	.word 0xa48b4008  ! 112: ANDcc_R	andcc 	%r13, %r8, %r18
	.word 0xec018008  ! 113: LDUW_R	lduw	[%r6 + %r8], %r22
	.word 0xe431a028  ! 114: STH_I	sth	%r18, [%r6 + 0x0028]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe039e000  ! 120: STD_I	std	%r16, [%r7 + 0x0000]
	.word 0xe012a030  ! 121: LDUH_I	lduh	[%r10 + 0x0030], %r16
	.word 0xe029a008  ! 122: STB_I	stb	%r16, [%r6 + 0x0008]
	.word 0xe4218008  ! 123: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe033a028  ! 124: STH_I	sth	%r16, [%r14 + 0x0028]
	.word 0xe473a018  ! 125: STX_I	stx	%r18, [%r14 + 0x0018]
	.word 0xe0728008  ! 126: STX_R	stx	%r16, [%r10 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec4ac008  ! 131: LDSB_R	ldsb	[%r11 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e1180, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d08e1180, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e1000, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe019e018  ! 137: LDD_I	ldd	[%r7 + 0x0018], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe031c008  ! 140: STH_R	sth	%r16, [%r7 + %r8]
	.word 0xe4430008  ! 141: LDSW_R	ldsw	[%r12 + %r8], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0398008  ! 147: XNOR_R	xnor 	%r6, %r8, %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec5aa008  ! 149: LDX_I	ldx	[%r10 + 0x0008], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe42ae000  ! 151: STB_I	stb	%r18, [%r11 + 0x0000]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe053a028  ! 156: LDSH_I	ldsh	[%r14 + 0x0028], %r16
	.word 0xec018008  ! 157: LDUW_R	lduw	[%r6 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe423a028  ! 159: STW_I	stw	%r18, [%r14 + 0x0028]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe82ae000  ! 163: STB_I	stb	%r20, [%r11 + 0x0000]
	.word 0xe052e038  ! 165: LDSH_I	ldsh	[%r11 + 0x0038], %r16
	.word 0xe4338008  ! 166: STH_R	sth	%r18, [%r14 + %r8]
	.word 0xec5aa018  ! 167: LDX_I	ldx	[%r10 + 0x0018], %r22
	.word 0xec2b0008  ! 168: STB_R	stb	%r22, [%r12 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec3a8008  ! 171: STD_R	std	%r22, [%r10 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe051a010  ! 173: LDSH_I	ldsh	[%r6 + 0x0010], %r16
	.word 0xe821e008  ! 174: STW_I	stw	%r20, [%r7 + 0x0008]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe031a000  ! 178: STH_I	sth	%r16, [%r6 + 0x0000]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe45b8008  ! 181: LDX_R	ldx	[%r14 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe402c008  ! 185: LDUW_R	lduw	[%r11 + %r8], %r18
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04aa038  ! 187: LDSB_I	ldsb	[%r10 + 0x0038], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec728008  ! 189: STX_R	stx	%r22, [%r10 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe44ba010  ! 191: LDSB_I	ldsb	[%r14 + 0x0010], %r18
	.word 0xe002a038  ! 192: LDUW_I	lduw	[%r10 + 0x0038], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4334008  ! 194: STH_R	sth	%r18, [%r13 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe459a010  ! 198: LDX_I	ldx	[%r6 + 0x0010], %r18
	.word 0xe019c008  ! 199: LDD_R	ldd	[%r7 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec218008  ! 202: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe02b6028  ! 203: STB_I	stb	%r16, [%r13 + 0x0028]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe029a008  ! 207: STB_I	stb	%r16, [%r6 + 0x0008]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe02b2038  ! 209: STB_I	stb	%r16, [%r12 + 0x0038]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe053a010  ! 211: LDSH_I	ldsh	[%r14 + 0x0010], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe073a008  ! 214: STX_I	stx	%r16, [%r14 + 0x0008]
	.word 0xe8328008  ! 215: STH_R	sth	%r20, [%r10 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8132020  ! 218: LDUH_I	lduh	[%r12 + 0x0020], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe041e038  ! 220: LDSW_I	ldsw	[%r7 + 0x0038], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe4230008  ! 223: STW_R	stw	%r18, [%r12 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe431e038  ! 225: STH_I	sth	%r18, [%r7 + 0x0038]
	.word 0xec532028  ! 226: LDSH_I	ldsh	[%r12 + 0x0028], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4232000  ! 228: STW_I	stw	%r18, [%r12 + 0x0000]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec22c008  ! 231: STW_R	stw	%r22, [%r11 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe049e030  ! 233: LDSB_I	ldsb	[%r7 + 0x0030], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe059e020  ! 235: LDX_I	ldx	[%r7 + 0x0020], %r16
	.word 0xec5ae028  ! 236: LDX_I	ldx	[%r11 + 0x0028], %r22
	.word 0xe033a010  ! 237: STH_I	sth	%r16, [%r14 + 0x0010]
	.word 0xec438008  ! 238: LDSW_R	ldsw	[%r14 + %r8], %r22
	.word 0xe82ba028  ! 239: STB_I	stb	%r20, [%r14 + 0x0028]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021e018  ! 243: STW_I	stw	%r16, [%r7 + 0x0018]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee1c0, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec5a8008  ! 249: LDX_R	ldx	[%r10 + %r8], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0418008  ! 251: LDSW_R	ldsw	[%r6 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42b8008  ! 255: STB_R	stb	%r18, [%r14 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0734008  ! 259: STX_R	stx	%r16, [%r13 + %r8]
	.word 0xe02b8008  ! 260: STB_R	stb	%r16, [%r14 + %r8]
	.word 0xec1ae008  ! 261: LDD_I	ldd	[%r11 + 0x0008], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe031a038  ! 264: STH_I	sth	%r16, [%r6 + 0x0038]
	.word 0xa02a8008  ! 265: ANDN_R	andn 	%r10, %r8, %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec718008  ! 268: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe432c008  ! 269: STH_R	sth	%r18, [%r11 + %r8]
	setx	0x00000000d01ee0c0, %r1, %r6
	setx	0x00000000d02ef140, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d04ef180, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d06ef100, %r1, %r12
	setx	0x00000000d07ef080, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec4ac008  ! 272: LDSB_R	ldsb	[%r11 + %r8], %r22
	.word 0xe051a010  ! 273: LDSH_I	ldsh	[%r6 + 0x0010], %r16
	.word 0xe82b0008  ! 274: STB_R	stb	%r20, [%r12 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec5b4008  ! 277: LDX_R	ldx	[%r13 + %r8], %r22
	setx	0x00000000d01ee1c0, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4230008  ! 280: STW_R	stw	%r18, [%r12 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe03ae000  ! 283: STD_I	std	%r16, [%r11 + 0x0000]
	.word 0xe0434008  ! 284: LDSW_R	ldsw	[%r13 + %r8], %r16
	.word 0xe8332030  ! 285: STH_I	sth	%r20, [%r12 + 0x0030]
	.word 0xe84b0008  ! 286: LDSB_R	ldsb	[%r12 + %r8], %r20
	.word 0xe0298008  ! 287: STB_R	stb	%r16, [%r6 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe4732000  ! 289: STX_I	stx	%r18, [%r12 + 0x0000]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa429a010  ! 293: ANDN_I	andn 	%r6, 0x0010, %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8430008  ! 296: LDSW_R	ldsw	[%r12 + %r8], %r20
	.word 0xe4018008  ! 297: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xec5a8008  ! 298: LDX_R	ldx	[%r10 + %r8], %r22
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe421a028  ! 5: STW_I	stw	%r18, [%r6 + 0x0028]
	.word 0xe421c008  ! 7: STW_R	stw	%r18, [%r7 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2b0008  ! 9: STB_R	stb	%r22, [%r12 + %r8]
	.word 0xec52a020  ! 10: LDSH_I	ldsh	[%r10 + 0x0020], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe871a038  ! 12: STX_I	stx	%r20, [%r6 + 0x0038]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0198008  ! 15: LDD_R	ldd	[%r6 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4230008  ! 17: STW_R	stw	%r18, [%r12 + %r8]
	.word 0xe8238008  ! 18: STW_R	stw	%r20, [%r14 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe833a008  ! 20: STH_I	sth	%r20, [%r14 + 0x0008]
	.word 0xe049a028  ! 21: LDSB_I	ldsb	[%r6 + 0x0028], %r16
	.word 0xe0238008  ! 22: STW_R	stw	%r16, [%r14 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe021e038  ! 24: STW_I	stw	%r16, [%r7 + 0x0038]
	.word 0xe002a030  ! 25: LDUW_I	lduw	[%r10 + 0x0030], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec534008  ! 27: LDSH_R	ldsh	[%r13 + %r8], %r22
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe032c008  ! 31: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xe049a010  ! 33: LDSB_I	ldsb	[%r6 + 0x0010], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8438008  ! 36: LDSW_R	ldsw	[%r14 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe472c008  ! 38: STX_R	stx	%r18, [%r11 + %r8]
	.word 0xe0232020  ! 39: STW_I	stw	%r16, [%r12 + 0x0020]
	setx	0x00000000d02ef1c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d04ef100, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d06ef140, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe022c008  ! 44: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xe81b6000  ! 45: LDD_I	ldd	[%r13 + 0x0000], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe023a010  ! 49: STW_I	stw	%r16, [%r14 + 0x0010]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe433a038  ! 56: STH_I	sth	%r18, [%r14 + 0x0038]
	.word 0xe03b6020  ! 57: STD_I	std	%r16, [%r13 + 0x0020]
	.word 0xec2b8008  ! 58: STB_R	stb	%r22, [%r14 + %r8]
	.word 0xe0538008  ! 59: LDSH_R	ldsh	[%r14 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8198008  ! 61: LDD_R	ldd	[%r6 + %r8], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec5ae028  ! 63: LDX_I	ldx	[%r11 + 0x0028], %r22
	.word 0xe03ba030  ! 64: STD_I	std	%r16, [%r14 + 0x0030]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe81ba028  ! 67: LDD_I	ldd	[%r14 + 0x0028], %r20
	.word 0xe031a008  ! 68: STH_I	sth	%r16, [%r6 + 0x0008]
	.word 0xe4418008  ! 69: LDSW_R	ldsw	[%r6 + %r8], %r18
	.word 0xe4234008  ! 70: STW_R	stw	%r18, [%r13 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe839e008  ! 72: STD_I	std	%r20, [%r7 + 0x0008]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe452e010  ! 78: LDSH_I	ldsh	[%r11 + 0x0010], %r18
	.word 0xe05b0008  ! 79: LDX_R	ldx	[%r12 + %r8], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe0134008  ! 81: LDUH_R	lduh	[%r13 + %r8], %r16
	.word 0xe03a8008  ! 82: STD_R	std	%r16, [%r10 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe4230008  ! 86: STW_R	stw	%r18, [%r12 + %r8]
	.word 0xe002c008  ! 87: LDUW_R	lduw	[%r11 + %r8], %r16
	.word 0xe0138008  ! 88: LDUH_R	lduh	[%r14 + %r8], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03b0008  ! 92: STD_R	std	%r16, [%r12 + %r8]
	.word 0xe03a8008  ! 93: STD_R	std	%r16, [%r10 + %r8]
	setx	0x00000000d08e1100, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021a018  ! 96: STW_I	stw	%r16, [%r6 + 0x0018]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2b8008  ! 98: STB_R	stb	%r22, [%r14 + %r8]
	.word 0xa4bae038  ! 99: XNORcc_I	xnorcc 	%r11, 0x0038, %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8334008  ! 102: STH_R	sth	%r20, [%r13 + %r8]
	.word 0xe4532038  ! 103: LDSH_I	ldsh	[%r12 + 0x0038], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe04b2020  ! 108: LDSB_I	ldsb	[%r12 + 0x0020], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa443a020  ! 110: ADDC_I	addc 	%r14, 0x0020, %r18
	.word 0xe0034008  ! 111: LDUW_R	lduw	[%r13 + %r8], %r16
	.word 0xa41b2008  ! 112: XOR_I	xor 	%r12, 0x0008, %r18
	.word 0xe841a008  ! 113: LDSW_I	ldsw	[%r6 + 0x0008], %r20
	.word 0xe4398008  ! 114: STD_R	std	%r18, [%r6 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe472c008  ! 120: STX_R	stx	%r18, [%r11 + %r8]
	.word 0xe019a028  ! 121: LDD_I	ldd	[%r6 + 0x0028], %r16
	.word 0xe071c008  ! 122: STX_R	stx	%r16, [%r7 + %r8]
	.word 0xe03b6030  ! 123: STD_I	std	%r16, [%r13 + 0x0030]
	.word 0xe0728008  ! 124: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xec2ae008  ! 125: STB_I	stb	%r22, [%r11 + 0x0008]
	.word 0xe829a018  ! 126: STB_I	stb	%r20, [%r6 + 0x0018]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe402e028  ! 131: LDUW_I	lduw	[%r11 + 0x0028], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e1040, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d08e1040, %r1, %r14
	setx	0x00000000d08e10c0, %r1, %r10
	setx	0x00000000d08e11c0, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec1b8008  ! 137: LDD_R	ldd	[%r14 + %r8], %r22
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec33a028  ! 140: STH_I	sth	%r22, [%r14 + 0x0028]
	.word 0xec5b2030  ! 141: LDX_I	ldx	[%r12 + 0x0030], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa83b0008  ! 147: XNOR_R	xnor 	%r12, %r8, %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe80a8008  ! 149: LDUB_R	ldub	[%r10 + %r8], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe43b6000  ! 151: STD_I	std	%r18, [%r13 + 0x0000]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe80b4008  ! 156: LDUB_R	ldub	[%r13 + %r8], %r20
	.word 0xe44b4008  ! 157: LDSB_R	ldsb	[%r13 + %r8], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe431a020  ! 159: STH_I	sth	%r18, [%r6 + 0x0020]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe023a030  ! 163: STW_I	stw	%r16, [%r14 + 0x0030]
	.word 0xe44ac008  ! 165: LDSB_R	ldsb	[%r11 + %r8], %r18
	.word 0xe033a018  ! 166: STH_I	sth	%r16, [%r14 + 0x0018]
	.word 0xe0532030  ! 167: LDSH_I	ldsh	[%r12 + 0x0030], %r16
	.word 0xe82b0008  ! 168: STB_R	stb	%r20, [%r12 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec2ac008  ! 171: STB_R	stb	%r22, [%r11 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe403a020  ! 173: LDUW_I	lduw	[%r14 + 0x0020], %r18
	.word 0xe032c008  ! 174: STH_R	sth	%r16, [%r11 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe431a038  ! 178: STH_I	sth	%r18, [%r6 + 0x0038]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8598008  ! 181: LDX_R	ldx	[%r6 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec198008  ! 185: LDD_R	ldd	[%r6 + %r8], %r22
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe841e030  ! 187: LDSW_I	ldsw	[%r7 + 0x0030], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe4218008  ! 189: STW_R	stw	%r18, [%r6 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe401a030  ! 191: LDUW_I	lduw	[%r6 + 0x0030], %r18
	.word 0xe05b6020  ! 192: LDX_I	ldx	[%r13 + 0x0020], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe031a010  ! 194: STH_I	sth	%r16, [%r6 + 0x0010]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4032018  ! 198: LDUW_I	lduw	[%r12 + 0x0018], %r18
	.word 0xe84b6030  ! 199: LDSB_I	ldsb	[%r13 + 0x0030], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec72c008  ! 202: STX_R	stx	%r22, [%r11 + %r8]
	.word 0xe432c008  ! 203: STH_R	sth	%r18, [%r11 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe421a008  ! 207: STW_I	stw	%r18, [%r6 + 0x0008]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe43ac008  ! 209: STD_R	std	%r18, [%r11 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec0b4008  ! 211: LDUB_R	ldub	[%r13 + %r8], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0228008  ! 214: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xec21a028  ! 215: STW_I	stw	%r22, [%r6 + 0x0028]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec1ae028  ! 218: LDD_I	ldd	[%r11 + 0x0028], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8598008  ! 220: LDX_R	ldx	[%r6 + %r8], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe03ae018  ! 223: STD_I	std	%r16, [%r11 + 0x0018]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0718008  ! 225: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe452a010  ! 226: LDSH_I	ldsh	[%r10 + 0x0010], %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0718008  ! 228: STX_R	stx	%r16, [%r6 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0218008  ! 231: STW_R	stw	%r16, [%r6 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4530008  ! 233: LDSH_R	ldsh	[%r12 + %r8], %r18
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe00b4008  ! 235: LDUB_R	ldub	[%r13 + %r8], %r16
	.word 0xe0028008  ! 236: LDUW_R	lduw	[%r10 + %r8], %r16
	.word 0xec298008  ! 237: STB_R	stb	%r22, [%r6 + %r8]
	.word 0xe012a010  ! 238: LDUH_I	lduh	[%r10 + 0x0010], %r16
	.word 0xec234008  ! 239: STW_R	stw	%r22, [%r13 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe829a030  ! 243: STB_I	stb	%r20, [%r6 + 0x0030]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee0c0, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef080, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe002e018  ! 249: LDUW_I	lduw	[%r11 + 0x0018], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe051e010  ! 251: LDSH_I	ldsh	[%r7 + 0x0010], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec738008  ! 255: STX_R	stx	%r22, [%r14 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0718008  ! 259: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe0218008  ! 260: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe043a000  ! 261: LDSW_I	ldsw	[%r14 + 0x0000], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0732030  ! 264: STX_I	stx	%r16, [%r12 + 0x0030]
	.word 0xa491e038  ! 265: ORcc_I	orcc 	%r7, 0x0038, %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe83b8008  ! 268: STD_R	std	%r20, [%r14 + %r8]
	.word 0xe0330008  ! 269: STH_R	sth	%r16, [%r12 + %r8]
	setx	0x00000000d01ee180, %r1, %r6
	setx	0x00000000d02ef140, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d04ef140, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d06ef100, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec1ae028  ! 272: LDD_I	ldd	[%r11 + 0x0028], %r22
	.word 0xe8530008  ! 273: LDSH_R	ldsh	[%r12 + %r8], %r20
	.word 0xe439c008  ! 274: STD_R	std	%r18, [%r7 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8036028  ! 277: LDUW_I	lduw	[%r13 + 0x0028], %r20
	setx	0x00000000d01ee1c0, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02ac008  ! 280: STB_R	stb	%r16, [%r11 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe82b8008  ! 283: STB_R	stb	%r20, [%r14 + %r8]
	.word 0xe45b6018  ! 284: LDX_I	ldx	[%r13 + 0x0018], %r18
	.word 0xe021c008  ! 285: STW_R	stw	%r16, [%r7 + %r8]
	.word 0xec4ba030  ! 286: LDSB_I	ldsb	[%r14 + 0x0030], %r22
	.word 0xe8318008  ! 287: STH_R	sth	%r20, [%r6 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe0318008  ! 289: STH_R	sth	%r16, [%r6 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xac31e030  ! 293: ORN_I	orn 	%r7, 0x0030, %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec1a8008  ! 296: LDD_R	ldd	[%r10 + %r8], %r22
	.word 0xe05a8008  ! 297: LDX_R	ldx	[%r10 + %r8], %r16
	.word 0xe049e008  ! 298: LDSB_I	ldsb	[%r7 + 0x0008], %r16
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec328008  ! 5: STH_R	sth	%r22, [%r10 + %r8]
	.word 0xe831a020  ! 7: STH_I	sth	%r20, [%r6 + 0x0020]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82b4008  ! 9: STB_R	stb	%r20, [%r13 + %r8]
	.word 0xe013a008  ! 10: LDUH_I	lduh	[%r14 + 0x0008], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe432a038  ! 12: STH_I	sth	%r18, [%r10 + 0x0038]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec1ba018  ! 15: LDD_I	ldd	[%r14 + 0x0018], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec21a008  ! 17: STW_I	stw	%r22, [%r6 + 0x0008]
	.word 0xe0238008  ! 18: STW_R	stw	%r16, [%r14 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe02ba018  ! 20: STB_I	stb	%r16, [%r14 + 0x0018]
	.word 0xe009e020  ! 21: LDUB_I	ldub	[%r7 + 0x0020], %r16
	.word 0xe4234008  ! 22: STW_R	stw	%r18, [%r13 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec234008  ! 24: STW_R	stw	%r22, [%r13 + %r8]
	.word 0xe04a8008  ! 25: LDSB_R	ldsb	[%r10 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe801a010  ! 27: LDUW_I	lduw	[%r6 + 0x0010], %r20
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43b6008  ! 31: STD_I	std	%r18, [%r13 + 0x0008]
	.word 0xe013a010  ! 33: LDUH_I	lduh	[%r14 + 0x0010], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe419e038  ! 36: LDD_I	ldd	[%r7 + 0x0038], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe821a028  ! 38: STW_I	stw	%r20, [%r6 + 0x0028]
	.word 0xe4338008  ! 39: STH_R	sth	%r18, [%r14 + %r8]
	setx	0x00000000d02ef180, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d04ef080, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d06ef0c0, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d08e1100, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029e018  ! 44: STB_I	stb	%r16, [%r7 + 0x0018]
	.word 0xe0038008  ! 45: LDUW_R	lduw	[%r14 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021c008  ! 49: STW_R	stw	%r16, [%r7 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0336030  ! 56: STH_I	sth	%r16, [%r13 + 0x0030]
	.word 0xe02b4008  ! 57: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xe839e018  ! 58: STD_I	std	%r20, [%r7 + 0x0018]
	.word 0xe049e010  ! 59: LDSB_I	ldsb	[%r7 + 0x0010], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe841c008  ! 61: LDSW_R	ldsw	[%r7 + %r8], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe009a018  ! 63: LDUB_I	ldub	[%r6 + 0x0018], %r16
	.word 0xe8338008  ! 64: STH_R	sth	%r20, [%r14 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe042c008  ! 67: LDSW_R	ldsw	[%r11 + %r8], %r16
	.word 0xe829c008  ! 68: STB_R	stb	%r20, [%r7 + %r8]
	.word 0xe80b0008  ! 69: LDUB_R	ldub	[%r12 + %r8], %r20
	.word 0xe073a020  ! 70: STX_I	stx	%r16, [%r14 + 0x0020]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8728008  ! 72: STX_R	stx	%r20, [%r10 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec19c008  ! 78: LDD_R	ldd	[%r7 + %r8], %r22
	.word 0xe0198008  ! 79: LDD_R	ldd	[%r6 + %r8], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe051e030  ! 81: LDSH_I	ldsh	[%r7 + 0x0030], %r16
	.word 0xe42a8008  ! 82: STB_R	stb	%r18, [%r10 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe022e020  ! 86: STW_I	stw	%r16, [%r11 + 0x0020]
	.word 0xe81b4008  ! 87: LDD_R	ldd	[%r13 + %r8], %r20
	.word 0xec51c008  ! 88: LDSH_R	ldsh	[%r7 + %r8], %r22
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec39e008  ! 92: STD_I	std	%r22, [%r7 + 0x0008]
	.word 0xec736000  ! 93: STX_I	stx	%r22, [%r13 + 0x0000]
	setx	0x00000000d08e1140, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4730008  ! 96: STX_R	stx	%r18, [%r12 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0230008  ! 98: STW_R	stw	%r16, [%r12 + %r8]
	.word 0xa0b3a008  ! 99: SUBCcc_I	orncc 	%r14, 0x0008, %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe02aa018  ! 102: STB_I	stb	%r16, [%r10 + 0x0018]
	.word 0xe459a020  ! 103: LDX_I	ldx	[%r6 + 0x0020], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0528008  ! 108: LDSH_R	ldsh	[%r10 + %r8], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xac91a010  ! 110: ORcc_I	orcc 	%r6, 0x0010, %r22
	.word 0xe44aa000  ! 111: LDSB_I	ldsb	[%r10 + 0x0000], %r18
	.word 0xa001c008  ! 112: ADD_R	add 	%r7, %r8, %r16
	.word 0xe41b8008  ! 113: LDD_R	ldd	[%r14 + %r8], %r18
	.word 0xe029c008  ! 114: STB_R	stb	%r16, [%r7 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42b2030  ! 120: STB_I	stb	%r18, [%r12 + 0x0030]
	.word 0xe852c008  ! 121: LDSH_R	ldsh	[%r11 + %r8], %r20
	.word 0xe03ae038  ! 122: STD_I	std	%r16, [%r11 + 0x0038]
	.word 0xe871a020  ! 123: STX_I	stx	%r20, [%r6 + 0x0020]
	.word 0xe431c008  ! 124: STH_R	sth	%r18, [%r7 + %r8]
	.word 0xe8734008  ! 125: STX_R	stx	%r20, [%r13 + %r8]
	.word 0xec298008  ! 126: STB_R	stb	%r22, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe041c008  ! 131: LDSW_R	ldsw	[%r7 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e1000, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe851c008  ! 137: LDSH_R	ldsh	[%r7 + %r8], %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0728008  ! 140: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe81b8008  ! 141: LDD_R	ldd	[%r14 + %r8], %r20
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa4b9c008  ! 147: XNORcc_R	xnorcc 	%r7, %r8, %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe80ba020  ! 149: LDUB_I	ldub	[%r14 + 0x0020], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe03ae020  ! 151: STD_I	std	%r16, [%r11 + 0x0020]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe802e030  ! 156: LDUW_I	lduw	[%r11 + 0x0030], %r20
	.word 0xe8018008  ! 157: LDUW_R	lduw	[%r6 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0318008  ! 159: STH_R	sth	%r16, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe03b4008  ! 163: STD_R	std	%r16, [%r13 + %r8]
	.word 0xe0032008  ! 165: LDUW_I	lduw	[%r12 + 0x0008], %r16
	.word 0xec31c008  ! 166: STH_R	sth	%r22, [%r7 + %r8]
	.word 0xec530008  ! 167: LDSH_R	ldsh	[%r12 + %r8], %r22
	.word 0xe0336028  ! 168: STH_I	sth	%r16, [%r13 + 0x0028]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec318008  ! 171: STH_R	sth	%r22, [%r6 + %r8]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0018008  ! 173: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe03ae020  ! 174: STD_I	std	%r16, [%r11 + 0x0020]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe83aa038  ! 178: STD_I	std	%r20, [%r10 + 0x0038]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe059c008  ! 181: LDX_R	ldx	[%r7 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe051a030  ! 185: LDSH_I	ldsh	[%r6 + 0x0030], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01ac008  ! 187: LDD_R	ldd	[%r11 + %r8], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe8318008  ! 189: STH_R	sth	%r20, [%r6 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0018008  ! 191: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe8432018  ! 192: LDSW_I	ldsw	[%r12 + 0x0018], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8398008  ! 194: STD_R	std	%r20, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4138008  ! 198: LDUH_R	lduh	[%r14 + %r8], %r18
	.word 0xec538008  ! 199: LDSH_R	ldsh	[%r14 + %r8], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0298008  ! 202: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe072a010  ! 203: STX_I	stx	%r16, [%r10 + 0x0010]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe829e038  ! 207: STB_I	stb	%r20, [%r7 + 0x0038]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe02b8008  ! 209: STB_R	stb	%r16, [%r14 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe801a018  ! 211: LDUW_I	lduw	[%r6 + 0x0018], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec398008  ! 214: STD_R	std	%r22, [%r6 + %r8]
	.word 0xe0730008  ! 215: STX_R	stx	%r16, [%r12 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0598008  ! 218: LDX_R	ldx	[%r6 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0036020  ! 220: LDUW_I	lduw	[%r13 + 0x0020], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe82ac008  ! 223: STB_R	stb	%r20, [%r11 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe02ac008  ! 225: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xe002c008  ! 226: LDUW_R	lduw	[%r11 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec2ba020  ! 228: STB_I	stb	%r22, [%r14 + 0x0020]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec736020  ! 231: STX_I	stx	%r22, [%r13 + 0x0020]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8038008  ! 233: LDUW_R	lduw	[%r14 + %r8], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe401a030  ! 235: LDUW_I	lduw	[%r6 + 0x0030], %r18
	.word 0xe4034008  ! 236: LDUW_R	lduw	[%r13 + %r8], %r18
	.word 0xe871a010  ! 237: STX_I	stx	%r20, [%r6 + 0x0010]
	.word 0xe011a008  ! 238: LDUH_I	lduh	[%r6 + 0x0008], %r16
	.word 0xe031a000  ! 239: STH_I	sth	%r16, [%r6 + 0x0000]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029e000  ! 243: STB_I	stb	%r16, [%r7 + 0x0000]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee1c0, %r1, %r6
	setx	0x00000000d08e1180, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1100, %r1, %r12
	setx	0x00000000d07ef0c0, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe84ba008  ! 249: LDSB_I	ldsb	[%r14 + 0x0008], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe85b8008  ! 251: LDX_R	ldx	[%r14 + %r8], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe072e010  ! 255: STX_I	stx	%r16, [%r11 + 0x0010]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec3b8008  ! 259: STD_R	std	%r22, [%r14 + %r8]
	.word 0xec32a020  ! 260: STH_I	sth	%r22, [%r10 + 0x0020]
	.word 0xec4ba020  ! 261: LDSB_I	ldsb	[%r14 + 0x0020], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe021e030  ! 264: STW_I	stw	%r16, [%r7 + 0x0030]
	.word 0xa081c008  ! 265: ADDcc_R	addcc 	%r7, %r8, %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe029a018  ! 268: STB_I	stb	%r16, [%r6 + 0x0018]
	.word 0xe472a008  ! 269: STX_I	stx	%r18, [%r10 + 0x0008]
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d02ef140, %r1, %r7
	setx	0x00000000d03ef0c0, %r1, %r14
	setx	0x00000000d04ef100, %r1, %r10
	setx	0x00000000d05ef100, %r1, %r11
	setx	0x00000000d06ef040, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe409c008  ! 272: LDUB_R	ldub	[%r7 + %r8], %r18
	.word 0xec4b4008  ! 273: LDSB_R	ldsb	[%r13 + %r8], %r22
	.word 0xe8334008  ! 274: STH_R	sth	%r20, [%r13 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec0b2018  ! 277: LDUB_I	ldub	[%r12 + 0x0018], %r22
	setx	0x00000000d01ee140, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e11c0, %r1, %r12
	setx	0x00000000d07ef040, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe832e028  ! 280: STH_I	sth	%r20, [%r11 + 0x0028]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0334008  ! 283: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xe402c008  ! 284: LDUW_R	lduw	[%r11 + %r8], %r18
	.word 0xe4332018  ! 285: STH_I	sth	%r18, [%r12 + 0x0018]
	.word 0xe051a018  ! 286: LDSH_I	ldsh	[%r6 + 0x0018], %r16
	.word 0xe43ae018  ! 287: STD_I	std	%r18, [%r11 + 0x0018]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe831a000  ! 289: STH_I	sth	%r20, [%r6 + 0x0000]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0338008  ! 293: SUBC_R	orn 	%r14, %r8, %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe44b2018  ! 296: LDSB_I	ldsb	[%r12 + 0x0018], %r18
	.word 0xe042c008  ! 297: LDSW_R	ldsw	[%r11 + %r8], %r16
	.word 0xe8532000  ! 298: LDSH_I	ldsh	[%r12 + 0x0000], %r20
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec3b2020  ! 5: STD_I	std	%r22, [%r12 + 0x0020]
	.word 0xe02b8008  ! 7: STB_R	stb	%r16, [%r14 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe032e020  ! 9: STH_I	sth	%r16, [%r11 + 0x0020]
	.word 0xe8030008  ! 10: LDUW_R	lduw	[%r12 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe422c008  ! 12: STW_R	stw	%r18, [%r11 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe01b8008  ! 15: LDD_R	ldd	[%r14 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe072c008  ! 17: STX_R	stx	%r16, [%r11 + %r8]
	.word 0xe0298008  ! 18: STB_R	stb	%r16, [%r6 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0736038  ! 20: STX_I	stx	%r16, [%r13 + 0x0038]
	.word 0xe40aa008  ! 21: LDUB_I	ldub	[%r10 + 0x0008], %r18
	.word 0xe433a010  ! 22: STH_I	sth	%r18, [%r14 + 0x0010]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe471c008  ! 24: STX_R	stx	%r18, [%r7 + %r8]
	.word 0xe81b4008  ! 25: LDD_R	ldd	[%r13 + %r8], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0498008  ! 27: LDSB_R	ldsb	[%r6 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8298008  ! 31: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xe052e030  ! 33: LDSH_I	ldsh	[%r11 + 0x0030], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8034008  ! 36: LDUW_R	lduw	[%r13 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe03b8008  ! 38: STD_R	std	%r16, [%r14 + %r8]
	.word 0xe03b6030  ! 39: STD_I	std	%r16, [%r13 + 0x0030]
	setx	0x00000000d02ef100, %r1, %r6
	setx	0x00000000d08e1000, %r1, %r7
	setx	0x00000000d04ef140, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d06ef1c0, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e1180, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03b8008  ! 44: STD_R	std	%r16, [%r14 + %r8]
	.word 0xe059a038  ! 45: LDX_I	ldx	[%r6 + 0x0038], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021a030  ! 49: STW_I	stw	%r16, [%r6 + 0x0030]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe422e030  ! 56: STW_I	stw	%r18, [%r11 + 0x0030]
	.word 0xe03b2038  ! 57: STD_I	std	%r16, [%r12 + 0x0038]
	.word 0xe821e000  ! 58: STW_I	stw	%r20, [%r7 + 0x0000]
	.word 0xec418008  ! 59: LDSW_R	ldsw	[%r6 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe00b4008  ! 61: LDUB_R	ldub	[%r13 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8438008  ! 63: LDSW_R	ldsw	[%r14 + %r8], %r20
	.word 0xec71a010  ! 64: STX_I	stx	%r22, [%r6 + 0x0010]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe84ae000  ! 67: LDSB_I	ldsb	[%r11 + 0x0000], %r20
	.word 0xe072a030  ! 68: STX_I	stx	%r16, [%r10 + 0x0030]
	.word 0xec098008  ! 69: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xe8318008  ! 70: STH_R	sth	%r20, [%r6 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43ba000  ! 72: STD_I	std	%r18, [%r14 + 0x0000]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe459a000  ! 78: LDX_I	ldx	[%r6 + 0x0000], %r18
	.word 0xec51c008  ! 79: LDSH_R	ldsh	[%r7 + %r8], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe0098008  ! 81: LDUB_R	ldub	[%r6 + %r8], %r16
	.word 0xe429a018  ! 82: STB_I	stb	%r18, [%r6 + 0x0018]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec718008  ! 86: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe419e020  ! 87: LDD_I	ldd	[%r7 + 0x0020], %r18
	.word 0xe45b2018  ! 88: LDX_I	ldx	[%r12 + 0x0018], %r18
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe039a008  ! 92: STD_I	std	%r16, [%r6 + 0x0008]
	.word 0xe8718008  ! 93: STX_R	stx	%r20, [%r6 + %r8]
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d08e1180, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d08e1000, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d08e10c0, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe832e028  ! 96: STH_I	sth	%r20, [%r11 + 0x0028]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0298008  ! 98: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xa031c008  ! 99: ORN_R	orn 	%r7, %r8, %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec3aa020  ! 102: STD_I	std	%r22, [%r10 + 0x0020]
	.word 0xe053a020  ! 103: LDSH_I	ldsh	[%r14 + 0x0020], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe443a008  ! 108: LDSW_I	ldsw	[%r14 + 0x0008], %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa0836000  ! 110: ADDcc_I	addcc 	%r13, 0x0000, %r16
	.word 0xe81aa020  ! 111: LDD_I	ldd	[%r10 + 0x0020], %r20
	.word 0xacb3a018  ! 112: SUBCcc_I	orncc 	%r14, 0x0018, %r22
	.word 0xe052c008  ! 113: LDSH_R	ldsh	[%r11 + %r8], %r16
	.word 0xe0718008  ! 114: STX_R	stx	%r16, [%r6 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec21a010  ! 120: STW_I	stw	%r22, [%r6 + 0x0010]
	.word 0xe453a030  ! 121: LDSH_I	ldsh	[%r14 + 0x0030], %r18
	.word 0xe4718008  ! 122: STX_R	stx	%r18, [%r6 + %r8]
	.word 0xe022a008  ! 123: STW_I	stw	%r16, [%r10 + 0x0008]
	.word 0xe0218008  ! 124: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe022a028  ! 125: STW_I	stw	%r16, [%r10 + 0x0028]
	.word 0xe83b4008  ! 126: STD_R	std	%r20, [%r13 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe051a010  ! 131: LDSH_I	ldsh	[%r6 + 0x0010], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e10c0, %r1, %r6
	setx	0x00000000d08e1040, %r1, %r7
	setx	0x00000000d08e1040, %r1, %r14
	setx	0x00000000d08e1040, %r1, %r10
	setx	0x00000000d08e10c0, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe019c008  ! 137: LDD_R	ldd	[%r7 + %r8], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe43b2020  ! 140: STD_I	std	%r18, [%r12 + 0x0020]
	.word 0xec11c008  ! 141: LDUH_R	lduh	[%r7 + %r8], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa8336008  ! 147: ORN_I	orn 	%r13, 0x0008, %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe0436000  ! 149: LDSW_I	ldsw	[%r13 + 0x0000], %r16
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe032a028  ! 151: STH_I	sth	%r16, [%r10 + 0x0028]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec534008  ! 156: LDSH_R	ldsh	[%r13 + %r8], %r22
	.word 0xe0598008  ! 157: LDX_R	ldx	[%r6 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8230008  ! 159: STW_R	stw	%r20, [%r12 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe82b6028  ! 163: STB_I	stb	%r20, [%r13 + 0x0028]
	.word 0xec52c008  ! 165: LDSH_R	ldsh	[%r11 + %r8], %r22
	.word 0xe4298008  ! 166: STB_R	stb	%r18, [%r6 + %r8]
	.word 0xe0598008  ! 167: LDX_R	ldx	[%r6 + %r8], %r16
	.word 0xe0232038  ! 168: STW_I	stw	%r16, [%r12 + 0x0038]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe82b2010  ! 171: STB_I	stb	%r20, [%r12 + 0x0010]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec432028  ! 173: LDSW_I	ldsw	[%r12 + 0x0028], %r22
	.word 0xe432c008  ! 174: STH_R	sth	%r18, [%r11 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe829a010  ! 178: STB_I	stb	%r20, [%r6 + 0x0010]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe45ba000  ! 181: LDX_I	ldx	[%r14 + 0x0000], %r18
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0528008  ! 185: LDSH_R	ldsh	[%r10 + %r8], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8198008  ! 187: LDD_R	ldd	[%r6 + %r8], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe871c008  ! 189: STX_R	stx	%r20, [%r7 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0428008  ! 191: LDSW_R	ldsw	[%r10 + %r8], %r16
	.word 0xe05b0008  ! 192: LDX_R	ldx	[%r12 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0334008  ! 194: STH_R	sth	%r16, [%r13 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4036020  ! 198: LDUW_I	lduw	[%r13 + 0x0020], %r18
	.word 0xe412e038  ! 199: LDUH_I	lduh	[%r11 + 0x0038], %r18
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe02ac008  ! 202: STB_R	stb	%r16, [%r11 + %r8]
	.word 0xe4298008  ! 203: STB_R	stb	%r18, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe02aa028  ! 207: STB_I	stb	%r16, [%r10 + 0x0028]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe82ae010  ! 209: STB_I	stb	%r20, [%r11 + 0x0010]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec52c008  ! 211: LDSH_R	ldsh	[%r11 + %r8], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe03b4008  ! 214: STD_R	std	%r16, [%r13 + %r8]
	.word 0xe8738008  ! 215: STX_R	stx	%r20, [%r14 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe00b4008  ! 218: LDUB_R	ldub	[%r13 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe011e018  ! 220: LDUH_I	lduh	[%r7 + 0x0018], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec29a030  ! 223: STB_I	stb	%r22, [%r6 + 0x0030]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe02a8008  ! 225: STB_R	stb	%r16, [%r10 + %r8]
	.word 0xe001c008  ! 226: LDUW_R	lduw	[%r7 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe831e030  ! 228: STH_I	sth	%r20, [%r7 + 0x0030]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe439a028  ! 231: STD_I	std	%r18, [%r6 + 0x0028]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe84b0008  ! 233: LDSB_R	ldsb	[%r12 + %r8], %r20
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe4434008  ! 235: LDSW_R	ldsw	[%r13 + %r8], %r18
	.word 0xec498008  ! 236: LDSB_R	ldsb	[%r6 + %r8], %r22
	.word 0xe8398008  ! 237: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe41b6028  ! 238: LDD_I	ldd	[%r13 + 0x0028], %r18
	.word 0xec718008  ! 239: STX_R	stx	%r22, [%r6 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec3b4008  ! 243: STD_R	std	%r22, [%r13 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee000, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe849a030  ! 249: LDSB_I	ldsb	[%r6 + 0x0030], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe802e028  ! 251: LDUW_I	lduw	[%r11 + 0x0028], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03b0008  ! 255: STD_R	std	%r16, [%r12 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0228008  ! 259: STW_R	stw	%r16, [%r10 + %r8]
	.word 0xe02b0008  ! 260: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xe812e008  ! 261: LDUH_I	lduh	[%r11 + 0x0008], %r20
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec71a038  ! 264: STX_I	stx	%r22, [%r6 + 0x0038]
	.word 0xa83b0008  ! 265: XNOR_R	xnor 	%r12, %r8, %r20
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe071a018  ! 268: STX_I	stx	%r16, [%r6 + 0x0018]
	.word 0xe831c008  ! 269: STH_R	sth	%r20, [%r7 + %r8]
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d02ef140, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d04ef040, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d06ef000, %r1, %r12
	setx	0x00000000d07ef000, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4534008  ! 272: LDSH_R	ldsh	[%r13 + %r8], %r18
	.word 0xe04b8008  ! 273: LDSB_R	ldsb	[%r14 + %r8], %r16
	.word 0xe031a018  ! 274: STH_I	sth	%r16, [%r6 + 0x0018]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8098008  ! 277: LDUB_R	ldub	[%r6 + %r8], %r20
	setx	0x00000000d01ee0c0, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1040, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe872e008  ! 280: STX_I	stx	%r20, [%r11 + 0x0008]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0728008  ! 283: STX_R	stx	%r16, [%r10 + %r8]
	.word 0xe851a008  ! 284: LDSH_I	ldsh	[%r6 + 0x0008], %r20
	.word 0xe029a030  ! 285: STB_I	stb	%r16, [%r6 + 0x0030]
	.word 0xe8528008  ! 286: LDSH_R	ldsh	[%r10 + %r8], %r20
	.word 0xec31a028  ! 287: STH_I	sth	%r22, [%r6 + 0x0028]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe03b2018  ! 289: STD_I	std	%r16, [%r12 + 0x0018]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa4c38008  ! 293: ADDCcc_R	addccc 	%r14, %r8, %r18
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe419a018  ! 296: LDD_I	ldd	[%r6 + 0x0018], %r18
	.word 0xe4198008  ! 297: LDD_R	ldd	[%r6 + %r8], %r18
	.word 0xe852e038  ! 298: LDSH_I	ldsh	[%r11 + 0x0038], %r20
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe023a028  ! 5: STW_I	stw	%r16, [%r14 + 0x0028]
	.word 0xe0738008  ! 7: STX_R	stx	%r16, [%r14 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe43b0008  ! 9: STD_R	std	%r18, [%r12 + %r8]
	.word 0xe01ae018  ! 10: LDD_I	ldd	[%r11 + 0x0018], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe82ac008  ! 12: STB_R	stb	%r20, [%r11 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe05b0008  ! 15: LDX_R	ldx	[%r12 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec730008  ! 17: STX_R	stx	%r22, [%r12 + %r8]
	.word 0xe472a030  ! 18: STX_I	stx	%r18, [%r10 + 0x0030]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xec29c008  ! 20: STB_R	stb	%r22, [%r7 + %r8]
	.word 0xe412c008  ! 21: LDUH_R	lduh	[%r11 + %r8], %r18
	.word 0xe0236000  ! 22: STW_I	stw	%r16, [%r13 + 0x0000]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe4318008  ! 24: STH_R	sth	%r18, [%r6 + %r8]
	.word 0xe00a8008  ! 25: LDUB_R	ldub	[%r10 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe012c008  ! 27: LDUH_R	lduh	[%r11 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec22c008  ! 31: STW_R	stw	%r22, [%r11 + %r8]
	.word 0xe0430008  ! 33: LDSW_R	ldsw	[%r12 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec128008  ! 36: LDUH_R	lduh	[%r10 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4336010  ! 38: STH_I	sth	%r18, [%r13 + 0x0010]
	.word 0xe03b0008  ! 39: STD_R	std	%r16, [%r12 + %r8]
	setx	0x00000000d02ef140, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d04ef080, %r1, %r14
	setx	0x00000000d08e1080, %r1, %r10
	setx	0x00000000d06ef100, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe039e038  ! 44: STD_I	std	%r16, [%r7 + 0x0038]
	.word 0xe049a018  ! 45: LDSB_I	ldsb	[%r6 + 0x0018], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec29a000  ! 49: STB_I	stb	%r22, [%r6 + 0x0000]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec22e000  ! 56: STW_I	stw	%r22, [%r11 + 0x0000]
	.word 0xe0318008  ! 57: STH_R	sth	%r16, [%r6 + %r8]
	.word 0xe029a018  ! 58: STB_I	stb	%r16, [%r6 + 0x0018]
	.word 0xec09c008  ! 59: LDUB_R	ldub	[%r7 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe04a8008  ! 61: LDSB_R	ldsb	[%r10 + %r8], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0036010  ! 63: LDUW_I	lduw	[%r13 + 0x0010], %r16
	.word 0xe0298008  ! 64: STB_R	stb	%r16, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe819e008  ! 67: LDD_I	ldd	[%r7 + 0x0008], %r20
	.word 0xe03a8008  ! 68: STD_R	std	%r16, [%r10 + %r8]
	.word 0xec432010  ! 69: LDSW_I	ldsw	[%r12 + 0x0010], %r22
	.word 0xe829c008  ! 70: STB_R	stb	%r20, [%r7 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4736000  ! 72: STX_I	stx	%r18, [%r13 + 0x0000]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe449e038  ! 78: LDSB_I	ldsb	[%r7 + 0x0038], %r18
	.word 0xec09a010  ! 79: LDUB_I	ldub	[%r6 + 0x0010], %r22
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe05ae038  ! 81: LDX_I	ldx	[%r11 + 0x0038], %r16
	.word 0xec298008  ! 82: STB_R	stb	%r22, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0298008  ! 86: STB_R	stb	%r16, [%r6 + %r8]
	.word 0xe01b0008  ! 87: LDD_R	ldd	[%r12 + %r8], %r16
	.word 0xe01aa010  ! 88: LDD_I	ldd	[%r10 + 0x0010], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec218008  ! 92: STW_R	stw	%r22, [%r6 + %r8]
	.word 0xe039e020  ! 93: STD_I	std	%r16, [%r7 + 0x0020]
	setx	0x00000000d08e10c0, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d08e1100, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe031a030  ! 96: STH_I	sth	%r16, [%r6 + 0x0030]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe83b6030  ! 98: STD_I	std	%r20, [%r13 + 0x0030]
	.word 0xa88b8008  ! 99: ANDcc_R	andcc 	%r14, %r8, %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8332010  ! 102: STH_I	sth	%r20, [%r12 + 0x0010]
	.word 0xe411a008  ! 103: LDUH_I	lduh	[%r6 + 0x0008], %r18
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0434008  ! 108: LDSW_R	ldsw	[%r13 + %r8], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa4328008  ! 110: SUBC_R	orn 	%r10, %r8, %r18
	.word 0xe851e008  ! 111: LDSH_I	ldsh	[%r7 + 0x0008], %r20
	.word 0xacb2a030  ! 112: ORNcc_I	orncc 	%r10, 0x0030, %r22
	.word 0xe4434008  ! 113: LDSW_R	ldsw	[%r13 + %r8], %r18
	.word 0xe022c008  ! 114: STW_R	stw	%r16, [%r11 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe429a030  ! 120: STB_I	stb	%r18, [%r6 + 0x0030]
	.word 0xec430008  ! 121: LDSW_R	ldsw	[%r12 + %r8], %r22
	.word 0xe83aa010  ! 122: STD_I	std	%r20, [%r10 + 0x0010]
	.word 0xe021a030  ! 123: STW_I	stw	%r16, [%r6 + 0x0030]
	.word 0xec71e008  ! 124: STX_I	stx	%r22, [%r7 + 0x0008]
	.word 0xe42aa018  ! 125: STB_I	stb	%r18, [%r10 + 0x0018]
	.word 0xe471e000  ! 126: STX_I	stx	%r18, [%r7 + 0x0000]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe812c008  ! 131: LDUH_R	lduh	[%r11 + %r8], %r20
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e1100, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d08e1000, %r1, %r14
	setx	0x00000000d08e11c0, %r1, %r10
	setx	0x00000000d08e1040, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d08e1140, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4530008  ! 137: LDSH_R	ldsh	[%r12 + %r8], %r18
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe832c008  ! 140: STH_R	sth	%r20, [%r11 + %r8]
	.word 0xec5b0008  ! 141: LDX_R	ldx	[%r12 + %r8], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0832030  ! 147: ADDcc_I	addcc 	%r12, 0x0030, %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec4aa020  ! 149: LDSB_I	ldsb	[%r10 + 0x0020], %r22
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe4330008  ! 151: STH_R	sth	%r18, [%r12 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4098008  ! 156: LDUB_R	ldub	[%r6 + %r8], %r18
	.word 0xe80ac008  ! 157: LDUB_R	ldub	[%r11 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0298008  ! 159: STB_R	stb	%r16, [%r6 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe83b6008  ! 163: STD_I	std	%r20, [%r13 + 0x0008]
	.word 0xe8198008  ! 165: LDD_R	ldd	[%r6 + %r8], %r20
	.word 0xec39c008  ! 166: STD_R	std	%r22, [%r7 + %r8]
	.word 0xec130008  ! 167: LDUH_R	lduh	[%r12 + %r8], %r22
	.word 0xe021a008  ! 168: STW_I	stw	%r16, [%r6 + 0x0008]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec29e028  ! 171: STB_I	stb	%r22, [%r7 + 0x0028]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0132000  ! 173: LDUH_I	lduh	[%r12 + 0x0000], %r16
	.word 0xe473a038  ! 174: STX_I	stx	%r18, [%r14 + 0x0038]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe032e030  ! 178: STH_I	sth	%r16, [%r11 + 0x0030]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec1ac008  ! 181: LDD_R	ldd	[%r11 + %r8], %r22
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe45ba030  ! 185: LDX_I	ldx	[%r14 + 0x0030], %r18
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4028008  ! 187: LDUW_R	lduw	[%r10 + %r8], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xec39e038  ! 189: STD_I	std	%r22, [%r7 + 0x0038]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe052e038  ! 191: LDSH_I	ldsh	[%r11 + 0x0038], %r16
	.word 0xe049a038  ! 192: LDSB_I	ldsb	[%r6 + 0x0038], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4228008  ! 194: STW_R	stw	%r18, [%r10 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe4018008  ! 198: LDUW_R	lduw	[%r6 + %r8], %r18
	.word 0xec1a8008  ! 199: LDD_R	ldd	[%r10 + %r8], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe431c008  ! 202: STH_R	sth	%r18, [%r7 + %r8]
	.word 0xe021a008  ! 203: STW_I	stw	%r16, [%r6 + 0x0008]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0730008  ! 207: STX_R	stx	%r16, [%r12 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe4238008  ! 209: STW_R	stw	%r18, [%r14 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe819c008  ! 211: LDD_R	ldd	[%r7 + %r8], %r20
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe4728008  ! 214: STX_R	stx	%r18, [%r10 + %r8]
	.word 0xec72a038  ! 215: STX_I	stx	%r22, [%r10 + 0x0038]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe059a020  ! 218: LDX_I	ldx	[%r6 + 0x0020], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec536038  ! 220: LDSH_I	ldsh	[%r13 + 0x0038], %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe02b6018  ! 223: STB_I	stb	%r16, [%r13 + 0x0018]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe82b0008  ! 225: STB_R	stb	%r20, [%r12 + %r8]
	.word 0xe05ac008  ! 226: LDX_R	ldx	[%r11 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec236020  ! 228: STW_I	stw	%r22, [%r13 + 0x0020]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe872c008  ! 231: STX_R	stx	%r20, [%r11 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0028008  ! 233: LDUW_R	lduw	[%r10 + %r8], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe0018008  ! 235: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe84aa008  ! 236: LDSB_I	ldsb	[%r10 + 0x0008], %r20
	.word 0xe4232020  ! 237: STW_I	stw	%r18, [%r12 + 0x0020]
	.word 0xe413a028  ! 238: LDUH_I	lduh	[%r14 + 0x0028], %r18
	.word 0xe023a018  ! 239: STW_I	stw	%r16, [%r14 + 0x0018]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42b4008  ! 243: STB_R	stb	%r18, [%r13 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef140, %r1, %r14
	setx	0x00000000d08e1140, %r1, %r10
	setx	0x00000000d05ef040, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0418008  ! 249: LDSW_R	ldsw	[%r6 + %r8], %r16
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec01e000  ! 251: LDUW_I	lduw	[%r7 + 0x0000], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03a8008  ! 255: STD_R	std	%r16, [%r10 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe82b4008  ! 259: STB_R	stb	%r20, [%r13 + %r8]
	.word 0xe022a000  ! 260: STW_I	stw	%r16, [%r10 + 0x0000]
	.word 0xe05b6038  ! 261: LDX_I	ldx	[%r13 + 0x0038], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe02b6030  ! 264: STB_I	stb	%r16, [%r13 + 0x0030]
	.word 0xa00ae028  ! 265: AND_I	and 	%r11, 0x0028, %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe823a018  ! 268: STW_I	stw	%r20, [%r14 + 0x0018]
	.word 0xe829e000  ! 269: STB_I	stb	%r20, [%r7 + 0x0000]
	setx	0x00000000d01ee140, %r1, %r6
	setx	0x00000000d02ef1c0, %r1, %r7
	setx	0x00000000d03ef1c0, %r1, %r14
	setx	0x00000000d04ef180, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d06ef140, %r1, %r12
	setx	0x00000000d07ef100, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec49e020  ! 272: LDSB_I	ldsb	[%r7 + 0x0020], %r22
	.word 0xe0418008  ! 273: LDSW_R	ldsw	[%r6 + %r8], %r16
	.word 0xe839a010  ! 274: STD_I	std	%r20, [%r6 + 0x0010]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec11e008  ! 277: LDUH_I	lduh	[%r7 + 0x0008], %r22
	setx	0x00000000d01ee080, %r1, %r6
	setx	0x00000000d08e10c0, %r1, %r7
	setx	0x00000000d03ef100, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d05ef000, %r1, %r11
	setx	0x00000000d08e1140, %r1, %r12
	setx	0x00000000d07ef1c0, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe021c008  ! 280: STW_R	stw	%r16, [%r7 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe8398008  ! 283: STD_R	std	%r20, [%r6 + %r8]
	.word 0xe049c008  ! 284: LDSB_R	ldsb	[%r7 + %r8], %r16
	.word 0xec718008  ! 285: STX_R	stx	%r22, [%r6 + %r8]
	.word 0xe802a010  ! 286: LDUW_I	lduw	[%r10 + 0x0010], %r20
	.word 0xe871a018  ! 287: STX_I	stx	%r20, [%r6 + 0x0018]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe8738008  ! 289: STX_R	stx	%r20, [%r14 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0b1e020  ! 293: ORNcc_I	orncc 	%r7, 0x0020, %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec49e018  ! 296: LDSB_I	ldsb	[%r7 + 0x0018], %r22
	.word 0xe80aa000  ! 297: LDUB_I	ldub	[%r10 + 0x0000], %r20
	.word 0xe852a000  ! 298: LDSH_I	ldsh	[%r10 + 0x0000], %r20
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec234008  ! 5: STW_R	stw	%r22, [%r13 + %r8]
	.word 0xe0218008  ! 7: STW_R	stw	%r16, [%r6 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0236018  ! 9: STW_I	stw	%r16, [%r13 + 0x0018]
	.word 0xe45b6020  ! 10: LDX_I	ldx	[%r13 + 0x0020], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe422a028  ! 12: STW_I	stw	%r18, [%r10 + 0x0028]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0134008  ! 15: LDUH_R	lduh	[%r13 + %r8], %r16
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8318008  ! 17: STH_R	sth	%r20, [%r6 + %r8]
	.word 0xec718008  ! 18: STX_R	stx	%r22, [%r6 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe022c008  ! 20: STW_R	stw	%r16, [%r11 + %r8]
	.word 0xe41b2008  ! 21: LDD_I	ldd	[%r12 + 0x0008], %r18
	.word 0xec3ac008  ! 22: STD_R	std	%r22, [%r11 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe039c008  ! 24: STD_R	std	%r16, [%r7 + %r8]
	.word 0xe001a028  ! 25: LDUW_I	lduw	[%r6 + 0x0028], %r16
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00b4008  ! 27: LDUB_R	ldub	[%r13 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec328008  ! 31: STH_R	sth	%r22, [%r10 + %r8]
	.word 0xec09c008  ! 33: LDUB_R	ldub	[%r7 + %r8], %r22
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0134008  ! 36: LDUH_R	lduh	[%r13 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0718008  ! 38: STX_R	stx	%r16, [%r6 + %r8]
	.word 0xe83b4008  ! 39: STD_R	std	%r20, [%r13 + %r8]
	setx	0x00000000d02ef000, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d04ef100, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d06ef0c0, %r1, %r11
	setx	0x00000000d08e1000, %r1, %r12
	setx	0x00000000d08e11c0, %r1, %r13
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe029a008  ! 44: STB_I	stb	%r16, [%r6 + 0x0008]
	.word 0xec4a8008  ! 45: LDSB_R	ldsb	[%r10 + %r8], %r22
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4328008  ! 49: STH_R	sth	%r18, [%r10 + %r8]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe0218008  ! 56: STW_R	stw	%r16, [%r6 + %r8]
	.word 0xe432e008  ! 57: STH_I	sth	%r18, [%r11 + 0x0008]
	.word 0xe83ac008  ! 58: STD_R	std	%r20, [%r11 + %r8]
	.word 0xe802c008  ! 59: LDUW_R	lduw	[%r11 + %r8], %r20
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8030008  ! 61: LDUW_R	lduw	[%r12 + %r8], %r20
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe852e018  ! 63: LDSH_I	ldsh	[%r11 + 0x0018], %r20
	.word 0xe032c008  ! 64: STH_R	sth	%r16, [%r11 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe01b6038  ! 67: LDD_I	ldd	[%r13 + 0x0038], %r16
	.word 0xe03b4008  ! 68: STD_R	std	%r16, [%r13 + %r8]
	.word 0xec098008  ! 69: LDUB_R	ldub	[%r6 + %r8], %r22
	.word 0xe03ba038  ! 70: STD_I	std	%r16, [%r14 + 0x0038]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec334008  ! 72: STH_R	sth	%r22, [%r13 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00b8008  ! 78: LDUB_R	ldub	[%r14 + %r8], %r16
	.word 0xe003a000  ! 79: LDUW_I	lduw	[%r14 + 0x0000], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe80ba008  ! 81: LDUB_I	ldub	[%r14 + 0x0008], %r20
	.word 0xe8338008  ! 82: STH_R	sth	%r20, [%r14 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe0334008  ! 86: STH_R	sth	%r16, [%r13 + %r8]
	.word 0xe009a008  ! 87: LDUB_I	ldub	[%r6 + 0x0008], %r16
	.word 0xe04b8008  ! 88: LDSB_R	ldsb	[%r14 + %r8], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4218008  ! 92: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe02b2028  ! 93: STB_I	stb	%r16, [%r12 + 0x0028]
	setx	0x00000000d08e1140, %r1, %r6
	setx	0x00000000d08e1100, %r1, %r7
	setx	0x00000000d08e11c0, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d08e11c0, %r1, %r11
	setx	0x00000000d08e1180, %r1, %r12
	setx	0x00000000d08e1080, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe42b6010  ! 96: STB_I	stb	%r18, [%r13 + 0x0010]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe032c008  ! 98: STH_R	sth	%r16, [%r11 + %r8]
	.word 0xa4ab2000  ! 99: ANDNcc_I	andncc 	%r12, 0x0000, %r18
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe031a030  ! 102: STH_I	sth	%r16, [%r6 + 0x0030]
	.word 0xe01ac008  ! 103: LDD_R	ldd	[%r11 + %r8], %r16
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0428008  ! 108: LDSW_R	ldsw	[%r10 + %r8], %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xa4c36020  ! 110: ADDCcc_I	addccc 	%r13, 0x0020, %r18
	.word 0xec42c008  ! 111: LDSW_R	ldsw	[%r11 + %r8], %r22
	.word 0xa8328008  ! 112: SUBC_R	orn 	%r10, %r8, %r20
	.word 0xe45b4008  ! 113: LDX_R	ldx	[%r13 + %r8], %r18
	.word 0xe031a008  ! 114: STH_I	sth	%r16, [%r6 + 0x0008]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe02b0008  ! 120: STB_R	stb	%r16, [%r12 + %r8]
	.word 0xe0028008  ! 121: LDUW_R	lduw	[%r10 + %r8], %r16
	.word 0xec332030  ! 122: STH_I	sth	%r22, [%r12 + 0x0030]
	.word 0xe0336038  ! 123: STH_I	sth	%r16, [%r13 + 0x0038]
	.word 0xec29e018  ! 124: STB_I	stb	%r22, [%r7 + 0x0018]
	.word 0xec22a000  ! 125: STW_I	stw	%r22, [%r10 + 0x0000]
	.word 0xec318008  ! 126: STH_R	sth	%r22, [%r6 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec43a000  ! 131: LDSW_I	ldsw	[%r14 + 0x0000], %r22
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d08e1080, %r1, %r6
	setx	0x00000000d08e1080, %r1, %r7
	setx	0x00000000d08e1080, %r1, %r14
	setx	0x00000000d08e1100, %r1, %r10
	setx	0x00000000d08e1000, %r1, %r11
	setx	0x00000000d08e10c0, %r1, %r12
	setx	0x00000000d08e1000, %r1, %r13
	ldda	[%r11]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec418008  ! 137: LDSW_R	ldsw	[%r6 + %r8], %r22
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe031c008  ! 140: STH_R	sth	%r16, [%r7 + %r8]
	.word 0xe0498008  ! 141: LDSB_R	ldsb	[%r6 + %r8], %r16
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xa0a36028  ! 147: SUBcc_I	subcc 	%r13, 0x0028, %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe44b2010  ! 149: LDSB_I	ldsb	[%r12 + 0x0010], %r18
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe471c008  ! 151: STX_R	stx	%r18, [%r7 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec4ac008  ! 156: LDSB_R	ldsb	[%r11 + %r8], %r22
	.word 0xe00b8008  ! 157: LDUB_R	ldub	[%r14 + %r8], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8238008  ! 159: STW_R	stw	%r20, [%r14 + %r8]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe821e028  ! 163: STW_I	stw	%r20, [%r7 + 0x0028]
	.word 0xe0134008  ! 165: LDUH_R	lduh	[%r13 + %r8], %r16
	.word 0xec3b0008  ! 166: STD_R	std	%r22, [%r12 + %r8]
	.word 0xe451a000  ! 167: LDSH_I	ldsh	[%r6 + 0x0000], %r18
	.word 0xe0718008  ! 168: STX_R	stx	%r16, [%r6 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xec29a018  ! 171: STB_I	stb	%r22, [%r6 + 0x0018]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe851c008  ! 173: LDSH_R	ldsh	[%r7 + %r8], %r20
	.word 0xe0718008  ! 174: STX_R	stx	%r16, [%r6 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe422e030  ! 178: STW_I	stw	%r18, [%r11 + 0x0030]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe001a000  ! 181: LDUW_I	lduw	[%r6 + 0x0000], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe00b8008  ! 185: LDUB_R	ldub	[%r14 + %r8], %r16
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe85b2010  ! 187: LDX_I	ldx	[%r12 + 0x0010], %r20
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	.word 0xe0230008  ! 189: STW_R	stw	%r16, [%r12 + %r8]
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec518008  ! 191: LDSH_R	ldsh	[%r6 + %r8], %r22
	.word 0xe00b6008  ! 192: LDUB_I	ldub	[%r13 + 0x0008], %r16
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xec2b0008  ! 194: STB_R	stb	%r22, [%r12 + %r8]
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0536008  ! 198: LDSH_I	ldsh	[%r13 + 0x0008], %r16
	.word 0xe0018008  ! 199: LDUW_R	lduw	[%r6 + %r8], %r16
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe8298008  ! 202: STB_R	stb	%r20, [%r6 + %r8]
	.word 0xe4338008  ! 203: STH_R	sth	%r18, [%r14 + %r8]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xec330008  ! 207: STH_R	sth	%r22, [%r12 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe82b2038  ! 209: STB_I	stb	%r20, [%r12 + 0x0038]
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xec436008  ! 211: LDSW_I	ldsw	[%r13 + 0x0008], %r22
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe021a000  ! 214: STW_I	stw	%r16, [%r6 + 0x0000]
	.word 0xe02a8008  ! 215: STB_R	stb	%r16, [%r10 + %r8]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe442e028  ! 218: LDSW_I	ldsw	[%r11 + 0x0028], %r18
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe019a000  ! 220: LDD_I	ldd	[%r6 + 0x0000], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe432c008  ! 223: STH_R	sth	%r18, [%r11 + %r8]
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	.word 0xe431e028  ! 225: STH_I	sth	%r18, [%r7 + 0x0028]
	.word 0xe0430008  ! 226: LDSW_R	ldsw	[%r12 + %r8], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe03ae028  ! 228: STD_I	std	%r16, [%r11 + 0x0028]
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4334008  ! 231: STH_R	sth	%r18, [%r13 + %r8]
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe0034008  ! 233: LDUW_R	lduw	[%r13 + %r8], %r16
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	.word 0xe4032010  ! 235: LDUW_I	lduw	[%r12 + 0x0010], %r18
	.word 0xe00b8008  ! 236: LDUB_R	ldub	[%r14 + %r8], %r16
	.word 0xe4218008  ! 237: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe0018008  ! 238: LDUW_R	lduw	[%r6 + %r8], %r16
	.word 0xe8328008  ! 239: STH_R	sth	%r20, [%r10 + %r8]
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe8232000  ! 243: STW_I	stw	%r20, [%r12 + 0x0000]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	setx	0x00000000d01ee180, %r1, %r6
	setx	0x00000000d08e1140, %r1, %r7
	setx	0x00000000d03ef180, %r1, %r14
	setx	0x00000000d08e1180, %r1, %r10
	setx	0x00000000d05ef180, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r11]ASI_BLK_P
	membar	 0x40
	ldda	[%r6]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4498008  ! 249: LDSB_R	ldsb	[%r6 + %r8], %r18
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xe81ac008  ! 251: LDD_R	ldd	[%r11 + %r8], %r20
	stda	 %f0, [%r10]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	ldda	[%r14]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe0732020  ! 255: STX_I	stx	%r16, [%r12 + 0x0020]
	stda	 %f0, [%r12]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe029a028  ! 259: STB_I	stb	%r16, [%r6 + 0x0028]
	.word 0xe82b6000  ! 260: STB_I	stb	%r20, [%r13 + 0x0000]
	.word 0xe001a008  ! 261: LDUW_I	lduw	[%r6 + 0x0008], %r16
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	stda	 %f0, [%r6]ASI_BLK_P
	membar	 0x40
	.word 0xe02b4008  ! 264: STB_R	stb	%r16, [%r13 + %r8]
	.word 0xa09ba018  ! 265: XORcc_I	xorcc 	%r14, 0x0018, %r16
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	.word 0xe021a020  ! 268: STW_I	stw	%r16, [%r6 + 0x0020]
	.word 0xe029c008  ! 269: STB_R	stb	%r16, [%r7 + %r8]
	setx	0x00000000d01ee140, %r1, %r6
	setx	0x00000000d02ef040, %r1, %r7
	setx	0x00000000d03ef040, %r1, %r14
	setx	0x00000000d04ef080, %r1, %r10
	setx	0x00000000d05ef1c0, %r1, %r11
	setx	0x00000000d06ef180, %r1, %r12
	setx	0x00000000d07ef180, %r1, %r13
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe803a028  ! 272: LDUW_I	lduw	[%r14 + 0x0028], %r20
	.word 0xec12a010  ! 273: LDUH_I	lduh	[%r10 + 0x0010], %r22
	.word 0xe03b6030  ! 274: STD_I	std	%r16, [%r13 + 0x0030]
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r7]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe413a020  ! 277: LDUH_I	lduh	[%r14 + 0x0020], %r18
	setx	0x00000000d01ee180, %r1, %r6
	setx	0x00000000d08e11c0, %r1, %r7
	setx	0x00000000d03ef000, %r1, %r14
	setx	0x00000000d08e1000, %r1, %r10
	setx	0x00000000d05ef0c0, %r1, %r11
	setx	0x00000000d08e1080, %r1, %r12
	setx	0x00000000d07ef140, %r1, %r13
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe82b2010  ! 280: STB_I	stb	%r20, [%r12 + 0x0010]
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	stda	 %f0, [%r14]ASI_BLK_P
	membar	 0x40
	.word 0xe4218008  ! 283: STW_R	stw	%r18, [%r6 + %r8]
	.word 0xe05ba000  ! 284: LDX_I	ldx	[%r14 + 0x0000], %r16
	.word 0xe439e038  ! 285: STD_I	std	%r18, [%r7 + 0x0038]
	.word 0xe0438008  ! 286: LDSW_R	ldsw	[%r14 + %r8], %r16
	.word 0xe839c008  ! 287: STD_R	std	%r20, [%r7 + %r8]
	stda	 %f0, [%r13]ASI_BLK_P
	membar	 0x40
	.word 0xec730008  ! 289: STX_R	stx	%r22, [%r12 + %r8]
	stda	 %f0, [%r7]ASI_BLK_P
	membar	 0x40
	ldda	[%r12]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r10]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xacc28008  ! 293: ADDCcc_R	addccc 	%r10, %r8, %r22
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	ldda	[%r13]ASI_BLK_P, %f0
	membar	 0x40
	.word 0xe4534008  ! 296: LDSH_R	ldsh	[%r13 + %r8], %r18
	.word 0xe819a018  ! 297: LDD_I	ldd	[%r6 + 0x0018], %r20
	.word 0xec01c008  ! 298: LDUW_R	lduw	[%r7 + %r8], %r22

join_lbl_0_0:



normal_end:
        ta      T_GOOD_TRAP

bad_end:
        ta      T_BAD_TRAP

user_text_end:

!***********************************************************************
!  Test case data start
!***********************************************************************

SECTION .UDATA1  DATA_VA=0xd08e0000

attr_data {
        Name = .UDATA1,
        VA=0xd08e0000,
        RA=0x010e000000,
        PA=0x010e000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global user_data_start
user_data_start:
        .skip 1000

SECTION .MY_HYP_SEC TEXT_VA = 0x1100000000, DATA_VA = 0x1100160000
attr_text {
        Name=.MY_HYP_SEC,
        hypervisor
	}

.global intr0x60_custom_trap
intr0x60_custom_trap:
	ldxa	[%g0] ASI_SWVR_INTR_RECEIVE, %g2;
	ldxa	[%g0] ASI_SWVR_UDB_INTR_R, %g1;	
	retry;

.global intr0x190_custom_trap
intr0x190_custom_trap:

!***********************************************************************
!IOSYNC cycles to start sjm
!***********************************************************************

setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xcf00beef00, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xef00beef00, %g1, %g3
stx %g2, [%g3]
!=====================

!#define MAIN_PAGE_HV_ALSO
!
!#include "enable_traps.h"
!#include "boot.s"
!
!.text
!.global main
!
!main:
!
!  ta    T_CHANGE_HPRIV
!  //ta    T_CHANGE_NONHPRIV

done;

h_bad_end:
        ta T_BAD_TRAP

.global  My_0x30_trap

My_0x30_trap:
  !inc %l4
  done

SECTION .NCDATA0  DATA_VA=0xd01ee000

attr_data {
        Name = .NCDATA0,
        VA=0xd01ee000,
        RA=0x8010000000,
        PA=0x8010000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base0
ncdata_base0:
        .skip 1000

SECTION .NCDATA1  DATA_VA=0xd02ee000

attr_data {
        Name = .NCDATA1,
        VA=0xd02ee000,
        RA=0x800e000000,
        PA=0x800e000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base1
ncdata_base1:
        .skip 1000

SECTION .NCDATA2  DATA_VA=0xd03ee000

attr_data {
        Name = .NCDATA2,
        VA=0xd03ee000,
        RA=0x800f000000,
        PA=0x800f000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base2
ncdata_base2:
        .skip 1000

SECTION .NCDATA3  DATA_VA=0xd04ee000

attr_data {
        Name = .NCDATA3,
        VA=0xd04ee000,
        RA=0xc000000000,
        PA=0xc000000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base3
ncdata_base3:
        .skip 1000

SECTION .NCDATA4  DATA_VA=0xd05ee000

attr_data {
        Name = .NCDATA4,
        VA=0xd05ee000,
        RA=0xd000000000,
        PA=0xd000000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base4
ncdata_base4:
        .skip 1000

SECTION .NCDATA5  DATA_VA=0xd06ee000

attr_data {
        Name = .NCDATA5,
        VA=0xd06ee000,
        RA=0xe000000000,
        PA=0xe000000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base5
ncdata_base5:
        .skip 1000

SECTION .NCDATA6  DATA_VA=0xd07ee000

attr_data {
        Name = .NCDATA6,
        VA=0xd07ee000,
        RA=0xf000000000,
        PA=0xf000000000,
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=1, TTE_P=0, TTE_W=1
        }

.data
.global ncdata_base6
ncdata_base6:
        .skip 1000

attr_data {
        Name=.MY_HYP_SEC,
        hypervisor
        }

.global my_hyp_data
.align 0x40
my_hyp_data:
        .skip 0x200

.end



SECTION .ISEG_0 DATA_VA = 0x0000000000100000
attr_data {
	Name	 = .ISEG_0,
	RA	 = 0x0000000000100000,
	PA	 = ra2pa(0x0000000000100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x476ef4234a1704e9
	.xword	0x1f459ea0ea261460
	.xword	0xddfb78f7655e9a6e
	.xword	0x54c23555009d8ac0
	.xword	0x13bd0a1ab6c3979b
	.xword	0x406e1c4efc74cacb
	.xword	0xad8f1ccd4d23a619
	.xword	0xc9487713726e06e2
	.xword	0x7dbcf264106b4444
	.xword	0x63a4fbf77a8a9caf
	.xword	0x52a5e20fe4c5061b
	.xword	0x79fd32af96b5f1af
	.xword	0x8a2e8d29800c2af0
	.xword	0xa2a85b354f9e3065
	.xword	0xa6b9208f5236ae09
	.xword	0x7853f376404d2442
	.xword	0x0efbd466cbc770b1
	.xword	0x6426acc935b6625a
	.xword	0x6fc94621daca61ef
	.xword	0xe39e19a068118189
	.xword	0xafa08d583d75fc8e
	.xword	0x0c8c63450daa3f26
	.xword	0x0dab903a9a8ed3a6
	.xword	0x4764acf7b2b9cdcd
	.xword	0x86e6fa869ffebaeb
	.xword	0x1d95fb83447dc2cb
	.xword	0xd959c1942c478a39
	.xword	0x980e2b8bc8bc56c0
	.xword	0xbe5c71f970a65484
	.xword	0xeca0d0939deda878
	.xword	0x12a880e6a31fe187
	.xword	0x9cab9930117a3f77
	.xword	0xdc9b613107412712
	.xword	0x8bd060d36ca59db7
	.xword	0x5e1bc3c540a032b5
	.xword	0xefb599a992635c6d
	.xword	0xd11fe38c8d947b1f
	.xword	0xc0ac69ab94190484
	.xword	0x03a6ff8e09148f43
	.xword	0x6d3c8e182d2b99ec
	.xword	0xfc6933b558db7e4d
	.xword	0x8dede6062fb998e7
	.xword	0xeba690392b3fa7d7
	.xword	0x0d61f2a4955002be
	.xword	0x5855215dd3e33f6c
	.xword	0xf1dee4ab5857a124
	.xword	0xd356d0d24843c0d2
	.xword	0x3ece3648c324c23e
	.xword	0x4f3696f00d29ba4d
	.xword	0x4f2cfc91f86bed8c
	.xword	0x85d9820190976803
	.xword	0x5e5ba05b333689a9
	.xword	0xd56f36ff8cb3a178
	.xword	0x5b892b04544c91bf
	.xword	0x4d5a59e959f76d38
	.xword	0x7f2866124085a4ad
	.xword	0xc05d9560f1132702
	.xword	0xda474af5c2ded135
	.xword	0x3dfe4e8f27b32741
	.xword	0x70a882531cfca5ab
	.xword	0x3f8187c000e15482
	.xword	0x0266a6bc7352dda2
	.xword	0xf607f7eea4a446f7
	.xword	0xd4e0beae0b14808a
	.xword	0x30ccc5759875af6c
	.xword	0xe1f3ed8e35f7ebb6
	.xword	0xd909cb8d6215061d
	.xword	0x47ac6185fb3f9bce
	.xword	0xf14527721f22d39e
	.xword	0xbd71a9eb3aea1e5d
	.xword	0xe349465791b78148
	.xword	0x03fbeaafd8e73e1b
	.xword	0x6437926f27ad1f66
	.xword	0x957334e41ee254b5
	.xword	0x5a608b4680e2be46
	.xword	0xcc33882603b2c18a
	.xword	0xf52f1e4931d12e0a
	.xword	0x0677d21f573cd2fd
	.xword	0xb4ba86fc3fbdc470
	.xword	0x44db0c440da85ad9
	.xword	0xb40682f373368743
	.xword	0x3de490f847c8bf2f
	.xword	0x3281da6cf3481243
	.xword	0xe0bdc15701cdecb5
	.xword	0xd6c613961701f265
	.xword	0xc55fdfaae65beb68
	.xword	0xf6451da7041b32e6
	.xword	0xc56e1dd850e27b67
	.xword	0x525e2f4d7a2b9ade
	.xword	0x1aae91cc3ca47bf7
	.xword	0xdd6042b5c4d229bb
	.xword	0xee1e76372fe8fe05
	.xword	0x6ca546c59b8c3c39
	.xword	0x7a8a031a0f3b4fe6
	.xword	0x3a56a38967f27b0f
	.xword	0xb58e4e296ce6e298
	.xword	0xd67edb903450e00e
	.xword	0x76eab556aa7dbfc1
	.xword	0x62a7ac8c2b940db2
	.xword	0x4ccbe7090a52d251
	.xword	0xf349be503af80ba5
	.xword	0x880b9820ee99d8b0
	.xword	0xd0dac499832f8633
	.xword	0xe456060ef1f85c60
	.xword	0x55376c73e93ddc12
	.xword	0xf8ef5cc6e69a4ea8
	.xword	0x31594082a6780cb0
	.xword	0x0af9a279da240fcb
	.xword	0x1aac073a091d0218
	.xword	0xc09f5d272cb854fe
	.xword	0x7d64caa1e6ef38f0
	.xword	0x0336e3a533f4cc13
	.xword	0xf1a356000fd194ac
	.xword	0x55d74c77e08903d2
	.xword	0xa62e03458316faf9
	.xword	0x8d6817a34ec49be4
	.xword	0x6c1d379e30bde49f
	.xword	0x996fd19cb99e2e3a
	.xword	0x540be9806738ef63
	.xword	0x8a6deabe427fb122
	.xword	0x4ba10d94414fa30c
	.xword	0x70d788615e2ce12f
	.xword	0x99d799d81c8b9335
	.xword	0xddcb5fec2febef49
	.xword	0x6e9c4417f0bfd837
	.xword	0x7e486f209e10c207
	.xword	0x36d2fc673ded8d80
	.xword	0xdc083741c53cd996
	.xword	0xe7a55ec1121a158b
	.xword	0x2da3d220da2f3f33
	.xword	0x4ec153859b5995ce
	.xword	0xd4729c8083a23ccf
	.xword	0x698ec3ad5f00baf9
	.xword	0x0ec86dfc74a04f0d
	.xword	0x0a3e50678f718664
	.xword	0xd11428faebd50bf8
	.xword	0x4d95db0f4de7baac
	.xword	0xa1f4c8d7899545f7
	.xword	0xbaaae6dd508b9961
	.xword	0x359ce9970c965c31
	.xword	0x6a91cbc2d79838c5
	.xword	0x399c66f0d9b4bff6
	.xword	0x787750f6c0d52787
	.xword	0xf1bb3809a802cb69
	.xword	0xfb8449db62f7dbdf
	.xword	0xdb3b54551b116c9c
	.xword	0x46b0ec77615567a3
	.xword	0x74d50a4ee664781d
	.xword	0xc1606e67c9f688bc
	.xword	0x7396e639333b8406
	.xword	0x9e815e88829bb841
	.xword	0x3a7926d40b8eb142
	.xword	0x2726bc5ca0dcad95
	.xword	0x028df59f1b37bec3
	.xword	0xe12e185982db6bfc
	.xword	0x6935fd6940f02e5e
	.xword	0x6b97f25c424f0d20
	.xword	0x120d9aff52f48724
	.xword	0xcd64deab8662cbf7
	.xword	0x07e492993a2cde8b
	.xword	0xc5e56d3fa830f4f1
	.xword	0xbb2ef779f3ac5a7c
	.xword	0x54e35a2dcf398777
	.xword	0xc935356ccce36d5f
	.xword	0xbfec93085a33f706
	.xword	0x5f4b9c0e20176f6e
	.xword	0xbef5557b82273630
	.xword	0x233d9d3c48784d1a
	.xword	0xab1fb4772567cc66
	.xword	0xa554dffd354d1985
	.xword	0xe0a509895e9eb3d7
	.xword	0xbcec91e8d7ec79bc
	.xword	0x9dee8cd6e3361fda
	.xword	0x5d42ef3a3924d344
	.xword	0x0f9785a29031e6e9
	.xword	0x8d0f7986992cd33d
	.xword	0x0c1d5b4a430b2789
	.xword	0xac9802cb3521be6c
	.xword	0x51c65d56a34a8129
	.xword	0xe2122fe42da1c65a
	.xword	0xa0459d1a7b8d9da9
	.xword	0xf63e08e5f3e2a6ca
	.xword	0xc88b756b84f8b64a
	.xword	0xca1036e6237a793a
	.xword	0x537e254ae2ac606a
	.xword	0x911a837141cbcbe2
	.xword	0x84cb7a78c367fcd7
	.xword	0xa419c7916bd9a66e
	.xword	0xdd32e37048b89a90
	.xword	0xf508706cad1b0410
	.xword	0x20bba0910900cb6c
	.xword	0x6f28692be7cc7c67
	.xword	0xc086009ff5ed70a0
	.xword	0xf4fecfc1c487ff58
	.xword	0xab26b2077ebc7630
	.xword	0x0e6252700c742e2c
	.xword	0xadab57f3df135849
	.xword	0x1f221b71935c8b14
	.xword	0x8d2972f3f5e329f9
	.xword	0x5d021a8bf9f6b7d0
	.xword	0x009724e0a2bd5ee0
	.xword	0x7c843deb9b208ab3
	.xword	0xbbcd8fea825299c4
	.xword	0x68a1602dec14e3df
	.xword	0x1c16ebd5a4f36df4
	.xword	0x8fa19c2c2ce2430f
	.xword	0xee97f118c8590d38
	.xword	0xfe7287771e539a1b
	.xword	0x95a18f84f341d4d8
	.xword	0x8e4a6e59eabe186b
	.xword	0x867da0b7a8f006df
	.xword	0x7ca43398999d5a4a
	.xword	0x81213a99ec177a73
	.xword	0x24abe8b52a6ab793
	.xword	0x772325f9bc003b22
	.xword	0xb955bc09a7161f8c
	.xword	0xbfc4088fe5d47245
	.xword	0xe16e6adb9619d684
	.xword	0x2c95509367011647
	.xword	0xc87d99ae886cfcee
	.xword	0xd51fff5181956fa1
	.xword	0x68b839927c56f921
	.xword	0x4e8613d8a6b9ae13
	.xword	0x475bb0204c75fd2e
	.xword	0x72d67a1541d4be31
	.xword	0x39f3cde0420b55fe
	.xword	0x143047de3abb9185
	.xword	0xfd9b871536072e99
	.xword	0x4cda850f9b57e378
	.xword	0x40a158a1ae3f13a4
	.xword	0x071155b60e01803f
	.xword	0x35a547366d8f35b8
	.xword	0xe551021d7e12ead9
	.xword	0xd1b7e9251cd9983b
	.xword	0x416b3a84e2bb0750
	.xword	0x99fb23b9816ed211
	.xword	0xc85e7c62f6fb1813
	.xword	0x25369757754cdf98
	.xword	0xcfc630f23f691992
	.xword	0xa35fb528bb42bdf7
	.xword	0x443a40308bda46f8
	.xword	0x1dec080ca49d728f
	.xword	0xa0edc0fb0af53170
	.xword	0x7badd2f22f0b1b9f
	.xword	0x91a24fc96c2d4d51
	.xword	0x1d4f2d1db0ed73b0
	.xword	0xea618a1e4517e28a
	.xword	0x5711ecfe1785ead3
	.xword	0x63fef7e304e3b2f5
	.xword	0x26d90d28c83b869b
	.xword	0x05c930bdd03d8b2a
	.xword	0xd82440f1bd6aa9d8
	.xword	0xc923f417b33a148f
	.xword	0xa925f596bbd4045b
	.xword	0x65a120b8a8a7b84b
	.xword	0x1c3bcbb697e3e902



SECTION .ISEG_1 DATA_VA = 0x0000000010100000
attr_data {
	Name	 = .ISEG_1,
	RA	 = 0x0000000010100000,
	PA	 = ra2pa(0x0000000010100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x4fcac6e365ac44e2
	.xword	0xd39306da7e238649
	.xword	0x46da823d5f9843e0
	.xword	0xfc81511ec0342ed7
	.xword	0x183b5c79b5e40338
	.xword	0xf8078f6719c1cac2
	.xword	0x12853aef6a7e6ade
	.xword	0xd93560d4ba32f3fd
	.xword	0x28fe5c4b34660a84
	.xword	0xe5976334e6349c91
	.xword	0xcaf22698b6310f2a
	.xword	0xdc61d69fcf02c108
	.xword	0x2ac9b54000f8fb1f
	.xword	0x13e7ace293b79d41
	.xword	0x6826641dc27bc56f
	.xword	0x9ce296fb02918b05
	.xword	0xf6dcee694e566653
	.xword	0x0550287668ab9037
	.xword	0xbaaf5e2607383333
	.xword	0xeffd2e23b375bcb4
	.xword	0xcaab4830fd7ebe69
	.xword	0x29f6d8baf55ea34d
	.xword	0xdcce681967a2320b
	.xword	0x348e90987403b8e6
	.xword	0x8dbbacec5206bcdc
	.xword	0x722c43838b9a2329
	.xword	0xd36535f8937f4744
	.xword	0x7629bab15555d8f0
	.xword	0xcea47263b36c11d2
	.xword	0x1ef6bd24ddda1eac
	.xword	0xf2b342fe2671667e
	.xword	0x715ed7520ead80f5
	.xword	0xdcfcae66538a5ffa
	.xword	0xbcbd826dc2f68711
	.xword	0xa6a800353d7cb582
	.xword	0xeaaef917400f8254
	.xword	0x9a797f31dbe5640a
	.xword	0x17139b1101551443
	.xword	0x9ad1aa651f617739
	.xword	0x9f70103993812559
	.xword	0x29dd908e2949522c
	.xword	0xaf8958a635b3865e
	.xword	0x5cc6453750b99185
	.xword	0x1f37b277f941cdfc
	.xword	0x170f4bbfedd46114
	.xword	0x3f030dbbca2cf55d
	.xword	0xaf352ba3e648e239
	.xword	0x976d54c8a0ed1074
	.xword	0xc82dc6279a121dad
	.xword	0xc642ccf0b0197c11
	.xword	0x482bc7a2f5f07194
	.xword	0xa16ee9027a2fe900
	.xword	0x8fe146e166d7d77a
	.xword	0xd92e1c44ca4e3cd7
	.xword	0x9e60df9491844e4a
	.xword	0xffead1a176c4d817
	.xword	0xb1b5042416a9c9a3
	.xword	0x905c2a854e776b6d
	.xword	0x6b2e768ca1323ee0
	.xword	0x205c01b40cb77120
	.xword	0x0598c45914b7491e
	.xword	0x166cc63cc2e0ada0
	.xword	0x4c6140fb3bfeae7e
	.xword	0x185e7e732b95b2dd
	.xword	0xde6faddb51ff105a
	.xword	0xe676deaa8943a877
	.xword	0xaa89229617d79403
	.xword	0xdc0b34655d6d50c0
	.xword	0xa2bb54669ed0614f
	.xword	0x188439cd8161b925
	.xword	0x256635370431ba97
	.xword	0x2932c7615ee58c80
	.xword	0xef94bbdb1315e371
	.xword	0x1d6735854fbdf041
	.xword	0x8d48ff6cb5891558
	.xword	0xc62ef8d324dcb11c
	.xword	0xfbf9fe68c7552db0
	.xword	0xc9599c8b84a4a00c
	.xword	0x40efee44c1b7ea99
	.xword	0x44819ba403aee383
	.xword	0xcb2aacd9f1e0db50
	.xword	0x0432f49856b5fd54
	.xword	0x9c12ffdc6f42606d
	.xword	0xebab345f00d5ef60
	.xword	0x85fc9128adc1160d
	.xword	0x786ec18905e2465f
	.xword	0x1fcd8bdb15e086e1
	.xword	0x4852aa4a81346a77
	.xword	0xc06a32f450794916
	.xword	0x3b62ef0c062cbc19
	.xword	0x47e2e78e6a6ef1d2
	.xword	0x37f37461353dacb9
	.xword	0xf6d646d938ac19d5
	.xword	0xeb460f45d716bd2c
	.xword	0x8d9bad99a942518e
	.xword	0x14745a73802bda28
	.xword	0x1ed60fdfa2b241ac
	.xword	0x5bb5ec49a7ef62a4
	.xword	0x607738afb5b26cfb
	.xword	0x2fdac07de7877bcb
	.xword	0x4881ad21c33a4b19
	.xword	0x20631f7e82945d53
	.xword	0xccdc96dd2096dc8c
	.xword	0xc5e3f5a02a3b5124
	.xword	0xb803dca893f0c5e4
	.xword	0x975dde86c6808955
	.xword	0x62f2e09dcf91dbb6
	.xword	0xa99b050bfb9988f0
	.xword	0x35c8ce45aecb6891
	.xword	0x541600d1d9ecd6e6
	.xword	0x0d0b5a888352c84f
	.xword	0x0f1f4e7bdb0f6f9d
	.xword	0x57f7b2c8eb04396b
	.xword	0x50b0b9e1087efa6b
	.xword	0x89d39157e5788e9b
	.xword	0xe7fd6ccfe1985e90
	.xword	0x349ba8d641b6a29a
	.xword	0x3e31b2b0761429fd
	.xword	0x51681017a4ee2850
	.xword	0xd2050e8a1ca13bec
	.xword	0xa471d957b268862b
	.xword	0x8da85776d3df94b9
	.xword	0xb85a16a6251fdc8d
	.xword	0x8b3883301b89150b
	.xword	0xd1806a3f3c537d38
	.xword	0x10a290db5e67cb26
	.xword	0x87e0c8ab0e741248
	.xword	0xd65ddca3782b4df7
	.xword	0xcbcb20a4cd9cf455
	.xword	0x48cd2255e06089bb
	.xword	0x3a9bb1356b53cedd
	.xword	0x15e4a560cc21a8bc
	.xword	0xb74aaae8a8e4f89a
	.xword	0xa25795d965bb8d76
	.xword	0xdcb82502d9976644
	.xword	0x19293ce6d213df14
	.xword	0x13bad6dde59beb08
	.xword	0x96498209ed99f6a5
	.xword	0x387baa0bbc4654ca
	.xword	0x583aef885960b277
	.xword	0x5731a8dbdb9afe5a
	.xword	0x2b9ae61fb1c08489
	.xword	0x1c9289cd38a049c1
	.xword	0x07ecf8f7a970c419
	.xword	0x3409b31ff33c6eba
	.xword	0xba8661c5cdf852d1
	.xword	0x9e7e9f72bffadef2
	.xword	0xbb1721d57635885c
	.xword	0xd960d0bf092d91c3
	.xword	0x9f5782e036224d11
	.xword	0x2e0ffc056d4520db
	.xword	0x088a5a310a53d46d
	.xword	0xb124ca563bc52ecc
	.xword	0xd1b2ea3c0541afe4
	.xword	0x35c26dcdc29e5515
	.xword	0xcfbe0fcf49df902a
	.xword	0xa61a29ae961d4c56
	.xword	0xf84204ba9965ba20
	.xword	0x9b137ad377b52acb
	.xword	0xa88bc9d4727dd645
	.xword	0x4c3fac4f4a02c64c
	.xword	0x549f1d1866a90836
	.xword	0x9c4d57d6066937bf
	.xword	0x8afa550416801dd0
	.xword	0x71e3db2f2eea7bf9
	.xword	0xa71fb49b165b602c
	.xword	0xe368a43fd4951b71
	.xword	0x149a3a2e4a095bc6
	.xword	0xc82199777f805a18
	.xword	0x7f77aeadc77adc80
	.xword	0xf3928c822391f3f0
	.xword	0x85c6b4f633010119
	.xword	0x95fdb7bd1c28dc8d
	.xword	0x2238d91184714cc8
	.xword	0x108edc03ed5ebdb7
	.xword	0x00d037a542a861aa
	.xword	0x2753e96ea8931bf5
	.xword	0x2be42250e56053ba
	.xword	0xc06cf7a5a952918f
	.xword	0x25e9c35602f51ff6
	.xword	0x2b47c59840726f09
	.xword	0x1bcbeb7295a6b201
	.xword	0x47741508954c380b
	.xword	0x477b9924c7bb3c6b
	.xword	0xb1438a9808267534
	.xword	0xfcadfa6e08277a6d
	.xword	0xd4aa0a7a10e53704
	.xword	0x0859b203d5effdfa
	.xword	0x27eda080d2026be0
	.xword	0x8476133ae82e754d
	.xword	0x4456a50cc23aa4c2
	.xword	0x52be0d4a76981605
	.xword	0xe81b661e74cf9d01
	.xword	0xdda3a80b55a6a5b1
	.xword	0xdaa6ba97968c5f35
	.xword	0x4ee27a5fb2e921de
	.xword	0x9bcb914c9e097c1e
	.xword	0xb24a51c840ff4002
	.xword	0xc6846f88e556d576
	.xword	0x79697700ee78ad1c
	.xword	0x26f522a95bc921c4
	.xword	0x1be56589ee1e9514
	.xword	0x5c0f129efe0903ec
	.xword	0x1a21e58d70ae84cf
	.xword	0x3ad2278fec8a6e0c
	.xword	0xc199b9557ad66818
	.xword	0x091c8000d09a09a2
	.xword	0x0f05fe6541febe62
	.xword	0x98f14b1110b067d5
	.xword	0xe365d4ab3fa8c305
	.xword	0x3a1833fa017f502a
	.xword	0x870510a151d9a950
	.xword	0x41f83b293cc7447c
	.xword	0x3fb227c3d4b68156
	.xword	0x634e8845732c2032
	.xword	0x72282dfdb7310e58
	.xword	0x7604d89026f9c555
	.xword	0xccca789fc5256f21
	.xword	0xec1ab67642dd1b96
	.xword	0xe0107fd2875ce95b
	.xword	0x2876559fd7117ed5
	.xword	0x70a139a7a0055b51
	.xword	0x61d6736dd47a0c2e
	.xword	0x27e474710738fc5f
	.xword	0x5e748902667fdbda
	.xword	0x164a9f301283c41c
	.xword	0x335e74f08fa0c94b
	.xword	0x0860702cd661e509
	.xword	0xd671daf8880822f4
	.xword	0x484bec72c4313791
	.xword	0xed8312c0a1f0a348
	.xword	0xcc1403197b665fa6
	.xword	0xec7690df371d8a21
	.xword	0xf899178c69bab476
	.xword	0xca6c4742346ea07e
	.xword	0x9b6371587a5cf2b3
	.xword	0xf6ea13e4da238236
	.xword	0x53204fa026f837e8
	.xword	0xe042758d2eed2bb6
	.xword	0x82cfa73d74a9b75e
	.xword	0xb12d657b887edda0
	.xword	0xc7b3e67b18919146
	.xword	0x91d676f21b0f1dee
	.xword	0x8706c7667fdb33a3
	.xword	0x238f491584424388
	.xword	0xaf97db3276b52a9d
	.xword	0x8526c6f126bdbda0
	.xword	0x35a8b6ca5c52ea8d
	.xword	0xfd2efdbb2aeb94bd
	.xword	0xda1be1638174079f
	.xword	0xddc1eb0be3336a4f
	.xword	0x475025952ff78685
	.xword	0xddfeeba3b8c0abcb
	.xword	0xca013a6f30635080
	.xword	0x15e56e4cd5e58968
	.xword	0xb2514684b9196d2d



SECTION .ISEG_2 DATA_VA = 0x0000000020100000
attr_data {
	Name	 = .ISEG_2,
	RA	 = 0x0000000020100000,
	PA	 = ra2pa(0x0000000020100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x74928c281be1debb
	.xword	0x3868ccf4419a1494
	.xword	0x10a71c0b639bb614
	.xword	0x659abd9d75605630
	.xword	0xce6b86f8c2519c12
	.xword	0xd89dfd311fb8aad5
	.xword	0x4a7341ceb75cdbea
	.xword	0x519de5e23841a305
	.xword	0xc7b6b48fddba64a4
	.xword	0x453767127b5231f9
	.xword	0x8b917a0d08d4f3c4
	.xword	0x4f561168d2afa086
	.xword	0x74c1bb83b549bfa8
	.xword	0x93deb88e2b6377ea
	.xword	0x0838e59f5ebf000d
	.xword	0xa997aaa35a46c4b4
	.xword	0xdd7ec0721caa7db2
	.xword	0x4f65e75a75e74877
	.xword	0x64de023d4acd52ea
	.xword	0x2227e877bce3265d
	.xword	0xc93bbf84499c1808
	.xword	0xb095c00cf0682f2f
	.xword	0x064a561272a8b637
	.xword	0x89cd379b10c2f8f0
	.xword	0x00350d8879a2ee3c
	.xword	0xfc3a6b613ff09a5b
	.xword	0x34698d71a3c878dd
	.xword	0xd5d827ba0643448d
	.xword	0x285d675db776416a
	.xword	0x973b0b757a69221b
	.xword	0xe4469e8c7697acef
	.xword	0x111f404bf2516833
	.xword	0x049987a842f020f3
	.xword	0x68478502a3dc2094
	.xword	0x38912ffcd8b69086
	.xword	0xe27accd39123758c
	.xword	0x0790d65e2e027e0a
	.xword	0x7de3232ce1eba434
	.xword	0x0b48c715add2b0f7
	.xword	0x250f55c225187e09
	.xword	0xa8b78ac14d07cd4f
	.xword	0x5d0fb88873585f0b
	.xword	0xb0ea474c911466dc
	.xword	0xc472dd5f52371a42
	.xword	0xe81ba6c4d43e1912
	.xword	0x9101ac3408f69081
	.xword	0xc8b1f2845bd79f99
	.xword	0x1f7f157f9088dcff
	.xword	0xabb19e5971932d04
	.xword	0xf18a9caf4a17e203
	.xword	0xb05a0729144a1107
	.xword	0x5b96d609e06ed84f
	.xword	0x22efaeb89bee48ef
	.xword	0x52b33a1e82585b3a
	.xword	0x573007dcb9255206
	.xword	0xf5b4ef45e71db206
	.xword	0x3c02ab2466aceb57
	.xword	0xb1cd2f2d2bd1f4ca
	.xword	0x64bd6ff25ed7a4cb
	.xword	0xcebf3fb236dbec6c
	.xword	0x353fadac516209c8
	.xword	0x2e6bcbd015a8120d
	.xword	0x3523c2a909adca67
	.xword	0xf1a90922cecef975
	.xword	0x487d38b1dbc77ed2
	.xword	0x01e235f3182bd2d0
	.xword	0x674637d2a4a19c00
	.xword	0x01296156c83469f8
	.xword	0xbe207e8d886fa1d8
	.xword	0x7ca18a709c5e9b25
	.xword	0x59abe47840bd2a43
	.xword	0x9c87032e04419cf3
	.xword	0x5e92365c67db051b
	.xword	0x3f866e339241c565
	.xword	0x516caa983095046d
	.xword	0x329ef654171f8835
	.xword	0x5b34459a668db339
	.xword	0xe100d447de68b644
	.xword	0x000a7591729a697d
	.xword	0xde8db9afdaa16a48
	.xword	0xea707ecca6784950
	.xword	0x66ff60e86d17a1cf
	.xword	0xbe71f16eae9f4716
	.xword	0xa113983d8c7fe8c4
	.xword	0xecb18c6d4a5988c4
	.xword	0x45095d663ecaa79c
	.xword	0x4adf8b8ed79d2000
	.xword	0xb36366d3325cf9ff
	.xword	0x00b64515999d4ffd
	.xword	0x596d38624faebb58
	.xword	0xdcee45d4899b7797
	.xword	0x7c0f49b1a4691b90
	.xword	0x9b221b5d28757cc3
	.xword	0x9c905502ecb0ca76
	.xword	0x6fc63cfa56d71938
	.xword	0xa3dddaa368cae8ba
	.xword	0x220b7e1a30ba5b3d
	.xword	0x457ac84dc2c77b7d
	.xword	0xe1381cf65488f698
	.xword	0x0de7911ca8610c5f
	.xword	0xbd3f076b20700b88
	.xword	0x14883a1a99a41bc6
	.xword	0x9430291b562e2dd4
	.xword	0xed6dbe987555168a
	.xword	0x3de73c4b4cfc284a
	.xword	0xef7fcdf5df6c7e3c
	.xword	0xae3fa474b656e891
	.xword	0x7f2ba66268f7f983
	.xword	0x403311259bdb36c8
	.xword	0xfae1e095e0600a48
	.xword	0x22508a71d3bc90c9
	.xword	0x40f8f2ee5a1d3ded
	.xword	0xc444fa1c6e5b38a5
	.xword	0xad290e1adf6f7640
	.xword	0xd9455715686a878f
	.xword	0x8f1aa94078fab9e5
	.xword	0x714aec3f395cda00
	.xword	0x1dea11c8bbf38567
	.xword	0xaf7e190313f84772
	.xword	0x56db384d756b9146
	.xword	0x3d31a35d10786a5f
	.xword	0x4d26d24b1f857801
	.xword	0xa3134cfd61956d3e
	.xword	0xcc3c24362b9d3351
	.xword	0xb0e6020acbea9e09
	.xword	0xd9d43d3a633eed60
	.xword	0xddde03eafcf45a69
	.xword	0xab17de3d3201c673
	.xword	0xd618b5566b0bcc53
	.xword	0x19cc5662124973fa
	.xword	0xc612756f2a43a386
	.xword	0x4cbde1947b5a55df
	.xword	0x271c3068baf09d87
	.xword	0x96c17bb56b8d91bb
	.xword	0xc5fe1e78e8b55201
	.xword	0x1ca7d4e5121b530b
	.xword	0xd71faf693a13637b
	.xword	0x8544a8e5e155060a
	.xword	0x83c67b12659dedf4
	.xword	0x8a7324a7d175fc36
	.xword	0x513f2cf2ffbfd3b0
	.xword	0x04e6fe14181f0f6c
	.xword	0x10a2804ba52715b2
	.xword	0x7a35b759f106817d
	.xword	0x3d2836bad94c95a8
	.xword	0xcf99c93cfbde2a46
	.xword	0xa446c260534ad759
	.xword	0x5d3637a0f24c4adb
	.xword	0x188105ffc2459bec
	.xword	0xe03407c3764e3d61
	.xword	0xee8ba2774bd1a7f0
	.xword	0x3e761ec8f46761c0
	.xword	0x93f9dac1a2844d3e
	.xword	0xc728625e2a8b796d
	.xword	0x1275d31d4c77491b
	.xword	0x905200f63570a223
	.xword	0xb648f19c183e0680
	.xword	0x228f6855bb1894d8
	.xword	0x7d862a4d9e2eb473
	.xword	0x0564c6995d0370c9
	.xword	0x079b7c6d17e41310
	.xword	0xce99bf7ad5799fc1
	.xword	0x6df2119f9077d4ef
	.xword	0xee8219e6acdf2385
	.xword	0x3042e59e6ef2402b
	.xword	0x7c8cf4e1a1959dd2
	.xword	0x4353abe5f3a75517
	.xword	0x41188a37b85cc076
	.xword	0x1cb57861a27f3e8f
	.xword	0xbb0d45203dc5d3c2
	.xword	0xe84ca20718298134
	.xword	0xb66505097cb85f3f
	.xword	0x0de8ccbcf533b948
	.xword	0x7c115f060e89afb5
	.xword	0x3a3a32f9c42c455a
	.xword	0x0a3fa8b01bfed36e
	.xword	0x20239ec9e0f8a39a
	.xword	0x36523e0dcba1baa1
	.xword	0x1d95dd0a683968ae
	.xword	0x92c370d0e9fdab89
	.xword	0xa3445df5b83eb292
	.xword	0x685e7215a34b0650
	.xword	0x9705bdda02828705
	.xword	0xc05c591a1d6b5ac1
	.xword	0xcc8b504c428a7589
	.xword	0x311f0dcf89aad211
	.xword	0x25638476edb9d1bb
	.xword	0x3ce8be338a6ed83f
	.xword	0xc0f112c89d0330e6
	.xword	0xc4a41f621adc6d96
	.xword	0x6f9de740c13db31f
	.xword	0x10a618638590078a
	.xword	0x4eb04f7d015e3b13
	.xword	0x3a6011f1137bdb38
	.xword	0xab7e370d24bfa974
	.xword	0x412f0f23defb0735
	.xword	0x09aaade566d23e5e
	.xword	0x7b67b1f223058970
	.xword	0xd69387d6f397128e
	.xword	0xa75a268619a5e73c
	.xword	0x8c114c6f733364a3
	.xword	0x818dfd9a304b8431
	.xword	0x1e561486e25fd24c
	.xword	0x630ef1911647db9e
	.xword	0x79f5151c56d0806d
	.xword	0x1abacbff04df7a55
	.xword	0x6fc33f141a14ac5b
	.xword	0x5b762f660a180229
	.xword	0xf3d5aaf773f57e7a
	.xword	0xc7421f14e5811dd3
	.xword	0x6e2ac421aef71905
	.xword	0xa2875e23342b8e39
	.xword	0x6360bd48b7c5174f
	.xword	0x117bf9a1457f3ddb
	.xword	0xc9d152cf0ce88f74
	.xword	0x1a4c5470e83a54c8
	.xword	0x4f0f0d870e8521b6
	.xword	0x8d1e474955b11d39
	.xword	0xfe7c0865c5974dfe
	.xword	0x009109da1a130308
	.xword	0xcc49be643315b7ba
	.xword	0x1e4b487aa07f538d
	.xword	0x42520506bbff8d69
	.xword	0x8bad3610b6f2ea13
	.xword	0x39e93390747c8ac5
	.xword	0xe15a9a294e6f541c
	.xword	0x92f7096e37279805
	.xword	0xc0d59c6aeb864fe1
	.xword	0x14aeee096b20c17d
	.xword	0x7d63cf298a6a036a
	.xword	0x7c8715bfca0c4872
	.xword	0x84a0a6a86ca7f262
	.xword	0x34db906c4514c9d5
	.xword	0x6ad144495e87cecd
	.xword	0x08625a76a688cdc2
	.xword	0x559835147a2a3982
	.xword	0xf3320f83f6840851
	.xword	0x5656357f096d7f4e
	.xword	0x36e8fc36375d72e5
	.xword	0x817bdbfbe69c7e4a
	.xword	0xdb189bd38f755b64
	.xword	0xc00763c892c5b47b
	.xword	0x78c86a1384fbb831
	.xword	0xcbf87df69b7bfe96
	.xword	0x7a4a01afce5ece39
	.xword	0x9e3ec9e84ad0a478
	.xword	0x37a39b60979b065b
	.xword	0x7d383bfbde1c00cd
	.xword	0x0e401bfb177cc9ed
	.xword	0x40249c26e16514f6
	.xword	0x1eddf76eaf9dee39
	.xword	0x2b783f6e599e3fc3
	.xword	0xd549a18f588f972b
	.xword	0x6efaf4178946691f
	.xword	0xc8165cf8f1869f01
	.xword	0x6d491764975051ed



SECTION .ISEG_3 DATA_VA = 0x0000000030100000
attr_data {
	Name	 = .ISEG_3,
	RA	 = 0x0000000030100000,
	PA	 = ra2pa(0x0000000030100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x559910a03b3b473a
	.xword	0xc565e541af9d27a8
	.xword	0x2b9622660e3b05f4
	.xword	0xfa623197c5f804a4
	.xword	0x792a9eb33d4454ca
	.xword	0x7b09b93cd4efda79
	.xword	0x8251d6a914821cea
	.xword	0x9dc9feca3df8e44a
	.xword	0xae3ae2df5674f0b3
	.xword	0xf77e4fcb1f119625
	.xword	0x7a4bc6984df27629
	.xword	0x1ba94d7c7232b7d6
	.xword	0x9643052dd6c02585
	.xword	0x7b87f30abfdd4b5d
	.xword	0x5fccc64fad1db0c0
	.xword	0xa285540c3c350c94
	.xword	0x31d0f8c4d9bbbeca
	.xword	0x30774575b37e7946
	.xword	0x5cf3494f3a8f8497
	.xword	0xc4431c69d94b1a69
	.xword	0xfee856ce19ec4b9a
	.xword	0x7f0e21dd48fc3a42
	.xword	0xaf7b3e421800ed21
	.xword	0xa312f94708ec9847
	.xword	0x82d690d18e852313
	.xword	0xf71411b0f2ddc504
	.xword	0x03f4959bbd3b91ff
	.xword	0x6515fa0963a385f8
	.xword	0xf9cdc819ed3bc3a9
	.xword	0xb282953e815356dd
	.xword	0x7ca47b0e3e17310c
	.xword	0xab7359c21d8c757e
	.xword	0x1376b4da42668dde
	.xword	0xc43d55639a456ada
	.xword	0xd717921bab10918b
	.xword	0x80e90f9d9b509e92
	.xword	0xc312c1e06359805c
	.xword	0x2d9dc36bc6cc49c6
	.xword	0x360e07423188fe66
	.xword	0xfd5be026767e4e2e
	.xword	0xae027978bf128e24
	.xword	0x9a7fd35416756740
	.xword	0x6f6c442ccb90e86a
	.xword	0xab0d6eec40aad355
	.xword	0xa357ee35a0280077
	.xword	0x1c500dbdf36638a2
	.xword	0x6e78a273d1bd166e
	.xword	0xa69d606479709b24
	.xword	0x33f628a5b1da677b
	.xword	0x0a276bbb0bc84d55
	.xword	0xdfacf2d9374a8c90
	.xword	0xb13ac183066b107c
	.xword	0xa8af97c5acb39f38
	.xword	0xbe113b2711446262
	.xword	0x8687d6c896d06a71
	.xword	0x0f7989b37aee3648
	.xword	0x5bdf3f0701662052
	.xword	0x53d0e0079bcaaafa
	.xword	0x1992c38f4dd88648
	.xword	0x455b1659496965ec
	.xword	0x175840895f07251a
	.xword	0x227473c64964a3da
	.xword	0x2c0aaded9baec805
	.xword	0xa9ae2ad64bb0ebde
	.xword	0xa4119d7b1febdd9d
	.xword	0x6559fb961faced22
	.xword	0xf8f74720e33a8f28
	.xword	0x6db53a4fd5feee65
	.xword	0x98214d4217fc8da8
	.xword	0x2f20f2f3b1732c29
	.xword	0xc7d6518636173122
	.xword	0x1406f1fa3182392f
	.xword	0x8e28e0c52e0911d0
	.xword	0x2e78a6c1477f2544
	.xword	0x9d76594688fdeb17
	.xword	0x1555c03095870c1b
	.xword	0x5e9ea6589206cd66
	.xword	0xd7bb4ca9d5b61265
	.xword	0x036f5261277293a0
	.xword	0x10760ea5b03b0582
	.xword	0x39943c235a05efde
	.xword	0x652d8eff3944843c
	.xword	0x48b6b57bc7a621af
	.xword	0x1f80296ab7b2659d
	.xword	0xbae764a1d4661527
	.xword	0xf4d023005b9a8f25
	.xword	0x85e9e5d75be2f981
	.xword	0x78f5238754bbbb9e
	.xword	0x45be514bd500355a
	.xword	0x119d799849115066
	.xword	0xd6bd2e2e15667fc3
	.xword	0x809ba0739eb3e29f
	.xword	0x3080cd2f12ccc9cf
	.xword	0x5db290a9f4da2705
	.xword	0x83b7e4729ab571eb
	.xword	0x42f694c4bb069e29
	.xword	0x4d133071c782661e
	.xword	0x68b53fbb0fdea339
	.xword	0x474b778030b643e2
	.xword	0xf686ff057ea91052
	.xword	0xa8a6809ad07b0168
	.xword	0xad3c93cbc95676b8
	.xword	0x6974cc914f2a6582
	.xword	0xff180a4a28240a30
	.xword	0x7ac9281b795f61b1
	.xword	0x19d0d7f314cd4439
	.xword	0xe0fcfdea503cb395
	.xword	0x8fd6e819474df2c0
	.xword	0x80284ea8329eab7b
	.xword	0x2956828fc84adc16
	.xword	0xb4c3c3f3cb898130
	.xword	0x8c3829e384674c07
	.xword	0x85a6b0bea9d332bd
	.xword	0xd3f12c64a50b4e95
	.xword	0xfdbaffa6ee5370ec
	.xword	0x3f37bc93ea4dc38b
	.xword	0xc3b29ef29573d53e
	.xword	0x1782c9025f9773ab
	.xword	0xb106732c69c10c80
	.xword	0x48a64dbcb4d14c2d
	.xword	0xa52c65628cd6912d
	.xword	0x91ffe5e4cebc2f4d
	.xword	0x461174ab983dd2ff
	.xword	0xb3135e31f4d064f1
	.xword	0xe3b0c8006db707cd
	.xword	0x6776fe19f1efc4fe
	.xword	0x84ae4412cfb7db0c
	.xword	0x2855e6879d5be310
	.xword	0x8208857d33bd7a63
	.xword	0x820a9afa16d1b670
	.xword	0x52d22dd3e738b85b
	.xword	0xdbf91a0506258dd7
	.xword	0x0e495c9e68e52858
	.xword	0x29c3ef836be50604
	.xword	0x7c70847a30447f65
	.xword	0x95751e20ad3cd16a
	.xword	0x75313ada7a5944e7
	.xword	0x826fc363cf56569f
	.xword	0x0ac3b9d21c4d95b9
	.xword	0xad6d7ffb9148deb6
	.xword	0xfa328ba38d04a75f
	.xword	0x6b784044c05f13f5
	.xword	0xb566ad430af660f1
	.xword	0x9128bc60be5bd57d
	.xword	0x38a4475b3c5dd5b4
	.xword	0x2dfb5d4266af549b
	.xword	0xeccc683140729bd3
	.xword	0x449e22b217491e3d
	.xword	0x4d678a2ac4b6f194
	.xword	0x149c6773aec36f45
	.xword	0x9b4fe48ee1fce814
	.xword	0xe2e3d213f6b7c094
	.xword	0x1c16d895104dc4e5
	.xword	0x15f56c2a2547c80e
	.xword	0xa8b0ed451521b524
	.xword	0xfac525cd77dc759c
	.xword	0x0f91e1e31cc46a9b
	.xword	0x4f42b00a5572148c
	.xword	0xdc780009e9584101
	.xword	0xf6877ce2e8f12392
	.xword	0xd76794f65d1bf5b2
	.xword	0xa052347d139728c8
	.xword	0x2d6e178bea7a9984
	.xword	0x792ba7e051c15775
	.xword	0xf4b223f1c42c8251
	.xword	0xb80fb2fea9136533
	.xword	0x900c7bc4ffac2667
	.xword	0x6a4bf030d51fddf8
	.xword	0xd7b0b86c48b03e5b
	.xword	0xf1ad4233cb922387
	.xword	0xcb6939e08e37f75a
	.xword	0x20b6a6a071b4d9a4
	.xword	0x09d325e29b951d07
	.xword	0xba70e86ffff8f724
	.xword	0xd26f79f240dabf65
	.xword	0xa8d5e10713127b6e
	.xword	0xb923549b4c4ef90b
	.xword	0x41e902c87c5db556
	.xword	0xd13c9e4d42fddcc7
	.xword	0xd14defdd992cc77b
	.xword	0xee1ee835329b237b
	.xword	0x6cfad14dd1332954
	.xword	0x516ca2525818f96e
	.xword	0x6b4070c157176ddd
	.xword	0x633b499f6a4fef21
	.xword	0x99bea66d29131522
	.xword	0xfa2808f1227cd1c9
	.xword	0x7065820e1e132782
	.xword	0x43f4234bac00373f
	.xword	0x830eb47f127c5328
	.xword	0x66b6372641c9ad68
	.xword	0x20928c883f282600
	.xword	0xea8da793c8e2d99a
	.xword	0xcc25ffb701b51968
	.xword	0xe0bd2db3b19c0e77
	.xword	0x89d3218062877627
	.xword	0xd4ea97360d055ae8
	.xword	0x9bb26d93cf7af8a3
	.xword	0x3a1154ae21cfd650
	.xword	0x7f38a7df9a91d3d8
	.xword	0x834c8ff64d3d3927
	.xword	0xee8502956932a475
	.xword	0x72f4615d38ce4db2
	.xword	0xdcb4457547aec803
	.xword	0xe645a31a4cd1ebba
	.xword	0x4b4495cff42910cb
	.xword	0x92ed3b80cc7a8df3
	.xword	0x1be65cf803be3811
	.xword	0xa5d952e238b1ba4b
	.xword	0x46906f1b889baed1
	.xword	0xa15a6f102f8b72e9
	.xword	0x19ee29afc38777b8
	.xword	0x03ea542bb08281b6
	.xword	0xcdc1bd63b7c7ced7
	.xword	0xf01d2785ab1e9a83
	.xword	0x386b43899409904e
	.xword	0xd415a8f01f15c667
	.xword	0x8c368f5917f6cbb4
	.xword	0xaa87185c5345a853
	.xword	0xd9ef237c84b058eb
	.xword	0xe430ed20e4a4ddec
	.xword	0x8db3aa9160224363
	.xword	0xbec337b9c7c98faa
	.xword	0xda2e56f026707267
	.xword	0x62f8dffd1af61f4a
	.xword	0x681edb0c094b1069
	.xword	0x214eaac8718cc585
	.xword	0x919aa78529543dfb
	.xword	0x1a913a0714c2ae18
	.xword	0xebf104f4736ae295
	.xword	0x8d5e0063566983bc
	.xword	0xea7a173b508421b1
	.xword	0xb661cee482cd1930
	.xword	0x599945a319f24986
	.xword	0x8c0fa66b42658420
	.xword	0xfb3869f9721a5754
	.xword	0x502197a309c50b0c
	.xword	0x8d26dc007392b7e8
	.xword	0xe7eafbf387a0a09f
	.xword	0x074de716af34dcce
	.xword	0x2ce85a422fc313d3
	.xword	0xc7f7302a6c24782f
	.xword	0x744daea56b0cd68c
	.xword	0xa79bddbdd7ce37ff
	.xword	0x0d69e16914c20bf7
	.xword	0x89fe245660c971c4
	.xword	0xd004563d6bf8a257
	.xword	0xc68b6cf83a55d8e5
	.xword	0x2818bbb10f707627
	.xword	0x763c6c7eefd466e6
	.xword	0x6ef84366bd958349
	.xword	0x44d23516a81e6654
	.xword	0x4739dca3ececad0b
	.xword	0x0761533dc28dc5cf
	.xword	0x60c7c458ac1c2583
	.xword	0x3352786e466b1466



SECTION .ISEG_4 DATA_VA = 0x0000000040100000
attr_data {
	Name	 = .ISEG_4,
	RA	 = 0x0000000040100000,
	PA	 = ra2pa(0x0000000040100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x8553e6b10f87950f
	.xword	0x98b6ed7b622deb46
	.xword	0x65f40cf4cf05ce12
	.xword	0xd6f235f14cccfdcf
	.xword	0xbbf39c06892d0eed
	.xword	0x8d10d9d05524038c
	.xword	0x1281d48545061d11
	.xword	0x96e462774542f677
	.xword	0x5370a9f3f5c8176b
	.xword	0x751f9f5de82fddd4
	.xword	0xc696d214f707a53c
	.xword	0x4766035d95e35aac
	.xword	0x0059e21cde738647
	.xword	0x5ff80848cb957dd0
	.xword	0x40579f0493d5a9c9
	.xword	0x24a59878a5157250
	.xword	0xc9696df336f422eb
	.xword	0x895936aee4226f2a
	.xword	0xd980f139f3781c07
	.xword	0x3c8236acdbf1cf2a
	.xword	0x74f76032429a90c3
	.xword	0x5b642c460113be6e
	.xword	0x57eb13903bbee8f0
	.xword	0x23cc276a3dd279ac
	.xword	0x0597510324ada50c
	.xword	0x9262c04a68b8e56a
	.xword	0x178d569770d96d0d
	.xword	0xd7c311373b8308f0
	.xword	0x693bbd2aa29f98f6
	.xword	0xc3e5a8f0fcc16396
	.xword	0x5c507923b987af90
	.xword	0x655208a0268bdb48
	.xword	0xdc1988f54c1b5928
	.xword	0x2af7417496f734e7
	.xword	0xa75faa73644cabe6
	.xword	0xf6d79623dc61754e
	.xword	0xa34f3b8c67a58761
	.xword	0x81dc4d8c0064343d
	.xword	0xd214d307c7adfec9
	.xword	0x63dc2acbc1b8386d
	.xword	0xdead578f1dfd54cd
	.xword	0x6bcd2e6a9830590e
	.xword	0x609e1ba7c8082a40
	.xword	0x32b494eb122ca9e7
	.xword	0x150fdad87f19435a
	.xword	0x9d3120a8eb556db7
	.xword	0xb89f445b0ceb0e1a
	.xword	0xad5a7b0ebf6aa220
	.xword	0xa70ff3307a43a322
	.xword	0x3913260fb62de6c2
	.xword	0x0863f2c18d46b7ff
	.xword	0xc8191cf2d13e7300
	.xword	0x7bb0da7cf4e5d7e9
	.xword	0xcb136171f5f9ac30
	.xword	0x48a4b1800223a924
	.xword	0x53cacb2be46e87d2
	.xword	0x22c4d9dc9d7a10f1
	.xword	0x92a8a845b67441ac
	.xword	0xbd2165bef542e3f2
	.xword	0x0c577aa461f5aaa9
	.xword	0xaf3c96eff455e714
	.xword	0x390b4bb578a246d2
	.xword	0x77bd269ea89731f9
	.xword	0xcd824a794bf5c796
	.xword	0x5d33c1e9a789a9ab
	.xword	0xc71c78708f62d0cf
	.xword	0x2b96154685e2969e
	.xword	0x36d9c1099088de89
	.xword	0x2651a9f1e8010e65
	.xword	0x6182be18cc64094f
	.xword	0x501adfaaef0e2c5c
	.xword	0xac89bf1aa98732f0
	.xword	0x5e7f2e919cd3ff35
	.xword	0x8cd8a73251b5ff75
	.xword	0xed93bd77f737e0ff
	.xword	0x59171b0ce89f5c27
	.xword	0xf141301ce97b7c10
	.xword	0x33e343601fe708aa
	.xword	0x76b21c87f06575c3
	.xword	0x9e9d78821396b6b5
	.xword	0x696ec55cc36dab50
	.xword	0xe74d996cfe8c5982
	.xword	0x73591d5ceedf17b0
	.xword	0xafdc1b1c76ff66a8
	.xword	0x2ee98038823d08d8
	.xword	0xed201f2330deba3a
	.xword	0x7dfc69d7b24bcec5
	.xword	0xc70a4e9223bd1b05
	.xword	0x6b754a353de1d479
	.xword	0xa4111b122729b19f
	.xword	0xc614707dedf13b15
	.xword	0x62acc9b17aeb297a
	.xword	0x0b8568a3bd772c60
	.xword	0x24410d6cd9140aab
	.xword	0x68686351e1f1911c
	.xword	0x4b6ee9c5b8a39ff4
	.xword	0x62079e15cd366a8f
	.xword	0x6514b46697a05736
	.xword	0x8d373e16a0214bb9
	.xword	0xa576e9a9ee5bf79f
	.xword	0xa9404953feb92b3a
	.xword	0x14476596a8f63852
	.xword	0x7501b60eac17129a
	.xword	0x86daaa39a10ab8d2
	.xword	0x15dbde5e810184e5
	.xword	0x4f2c6accf158a1b0
	.xword	0xdaba938340804efc
	.xword	0xb3da5c12c9597723
	.xword	0xb0490bec36bc5203
	.xword	0xb6aef9b9d75ff965
	.xword	0xef4ca11e8e7a299d
	.xword	0xc7016fbba821086f
	.xword	0x905cc354fe7af770
	.xword	0xedcd6297d1d5abe1
	.xword	0x5f05a1f171b04621
	.xword	0xe897bb3e2cbb2a27
	.xword	0x45dc5117a4c82358
	.xword	0xb70278efe3c9f4ba
	.xword	0xa082d2eb4fbb85a2
	.xword	0x489fbfe6222765bd
	.xword	0x4e2eb70d13fe514c
	.xword	0x3c6c34426c0b3a23
	.xword	0xa9def5e3a34be648
	.xword	0xe4e66c26493daf96
	.xword	0x7d3630c4d93e1eb1
	.xword	0xb7fc75ae74efece8
	.xword	0x2a23dbb50375938b
	.xword	0x9b2102edda9fa361
	.xword	0x292f4f89a95f117f
	.xword	0x0ad932a376fa7c27
	.xword	0x9a5642c9aecf3fc3
	.xword	0x751885873b9de8c7
	.xword	0xfa9109a948688848
	.xword	0xfe62ec84594bc57e
	.xword	0xf83a14f3377e43e1
	.xword	0xcba624a10d8fdfa9
	.xword	0x49574fc886f939ea
	.xword	0x4f99183692755680
	.xword	0xff86d12642034fb8
	.xword	0x4b617602dcf9135c
	.xword	0xb66692aa0d442f84
	.xword	0xe7a1829ab48baf51
	.xword	0x50927cab52f5da63
	.xword	0xc7c66a3b05f4ffb6
	.xword	0xfb0106d42a4c7c19
	.xword	0xc8147dcb0e751e56
	.xword	0xf14b9fefd7a9ce67
	.xword	0x3fa529552488c0c6
	.xword	0x858d0cd36a3f11fd
	.xword	0x446344cff3597445
	.xword	0xace56b7f1dcb8202
	.xword	0x6909d89047cd9f79
	.xword	0x2084063bd5bb853f
	.xword	0x89985e67e81c7d43
	.xword	0x8329b61c46abd8ce
	.xword	0x23ea80299bd01a19
	.xword	0xaeb8ca4cf66565ae
	.xword	0x8652e8bc90b124e7
	.xword	0x14cee26f2dc60a9a
	.xword	0x4bc7220963bda313
	.xword	0x8ffe82ae089131bb
	.xword	0x5caaa59315f2bbf0
	.xword	0x17f0ff61aa97687f
	.xword	0x19ee04f0d9ea3772
	.xword	0x674ca6a1310c79f3
	.xword	0x786871ecbe4fd40d
	.xword	0x93ec1c6d7e571433
	.xword	0x9ca511bfac03c0ef
	.xword	0xc6fba56b0fe71bed
	.xword	0x9fbc43ba470bc218
	.xword	0x23fb9c085cae01ab
	.xword	0x3abb117f88d5f41d
	.xword	0x8d11dcf6238da8c5
	.xword	0x937f27dbcb75d12f
	.xword	0x6ccc35ae9310cf90
	.xword	0xe1c4888a0f8d3ba7
	.xword	0xb2aa84d074f0ce06
	.xword	0x67e8fc4fc440b25b
	.xword	0xae2d4dc738fd11b6
	.xword	0xfa4def6d8d7c9e41
	.xword	0x9839b3fb14a60558
	.xword	0x8ce6a1da3d29b133
	.xword	0x6d0922e1c3bc66b9
	.xword	0x2ce4becf44dc3d3a
	.xword	0x01c3383b12976e67
	.xword	0x9fa6ca755bb8f59a
	.xword	0x3e8482cb17b3ac22
	.xword	0xbdab7ee912085546
	.xword	0xc23fe1ee8dc144a9
	.xword	0xd1fdfa8a56fc6a5e
	.xword	0x7abca525a1be6d76
	.xword	0x53451695ce54d4c7
	.xword	0xc927c1541d86ca33
	.xword	0x705b3e7f8a3e6e07
	.xword	0x31facf2e700e66af
	.xword	0xba868e40f0b54de1
	.xword	0xb52a6550a43d7eff
	.xword	0x1622622b492a415e
	.xword	0x4947ba8ce983de9b
	.xword	0xd70bbbf8e44bd892
	.xword	0xcf33f5fe5faf627c
	.xword	0x8ae070eade21445e
	.xword	0xe09990dba28b32f9
	.xword	0x9843a0a7f238da5d
	.xword	0x3dc2cac342800dc1
	.xword	0x2b45afcb34f9026c
	.xword	0x3dd4713aa647c3b4
	.xword	0xfb4620dab9fab685
	.xword	0x8e26727f12e2e3fb
	.xword	0x3c88b6659d373f7c
	.xword	0xbd50acad80756353
	.xword	0x8a4114311c2e0fa1
	.xword	0xf6d29fac2c0354f6
	.xword	0x226366944c42d2e0
	.xword	0x1769d657600e9fe8
	.xword	0xb8ff6c1b4e4a677b
	.xword	0x986cb79b2a38f643
	.xword	0xdbbb3c6a77d92ad1
	.xword	0x4084de180e5b7470
	.xword	0x904da4b22d915abc
	.xword	0x8a38f027378b49c7
	.xword	0x8b4c54a5b2006992
	.xword	0x02dc08c5eb0f4964
	.xword	0x47f836e0d3e02389
	.xword	0xba5de9a4d50f7b98
	.xword	0x22383cfc061d25d0
	.xword	0x0296f100440a336b
	.xword	0x2fb9b600aeae5a06
	.xword	0xe60f01d2a2002754
	.xword	0x543450f1200a5d1c
	.xword	0x38fdabb81b957975
	.xword	0xae1390b85ddf2890
	.xword	0xbf2a63e7f01e2a35
	.xword	0x57fccf96a709547c
	.xword	0xf445fc81bfe82d78
	.xword	0xa3b3a88a6c53d388
	.xword	0x96653c8f9ce04e3c
	.xword	0xea657177678ed608
	.xword	0x3394f4a52e81f300
	.xword	0x65df5e11ed0fbd52
	.xword	0xabe31f2b8a0e9570
	.xword	0xff77f9256eee2f0e
	.xword	0x8a45f3bccdd01312
	.xword	0x5c76cc5f2bdf747d
	.xword	0x33f68a3f3e80f673
	.xword	0x363a664e050e57ff
	.xword	0x48e76589d6f31145
	.xword	0xa02b160c288b4bc0
	.xword	0xf8f440faa9e7b731
	.xword	0x21a2a90f2548549a
	.xword	0x21a7317e7170a823
	.xword	0x920bbf60b3dda9e3
	.xword	0xe18e4f0ce25f55b9
	.xword	0x21d4dc13f8d555d2
	.xword	0xc5734ba2a939d0e8
	.xword	0x55b247cdac46d22e



SECTION .ISEG_5 DATA_VA = 0x0000000050100000
attr_data {
	Name	 = .ISEG_5,
	RA	 = 0x0000000050100000,
	PA	 = ra2pa(0x0000000050100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0xb3b6ae9975a6e53a
	.xword	0xfe51debd4a59ceba
	.xword	0xdb1863edbb85ae3c
	.xword	0xdeb0502da25db147
	.xword	0x0fa94579bed844c3
	.xword	0x76a68c6fbbfebf28
	.xword	0x2b78963d47e1dbf3
	.xword	0x4cded4f5e33308c6
	.xword	0xd75b63b41176e787
	.xword	0x35e5cf0a3c7fe781
	.xword	0xad212103097e1a82
	.xword	0xd3d10c3c72c1e0f2
	.xword	0x0efe2893038f4899
	.xword	0xf5f1c19788688f69
	.xword	0x51460c6c433d04f9
	.xword	0x76cb50a29dd78b10
	.xword	0xcdc34070ac919935
	.xword	0xdcd23971ca109f6a
	.xword	0x2c7a78ac6d7ee50b
	.xword	0x6cf6e01afc2ca9c1
	.xword	0x7d00eb98f742b3ff
	.xword	0x554f2decda25a1f5
	.xword	0xa74110ce924546e9
	.xword	0x5c4f2cd0272b5fcb
	.xword	0x4c02a9f43ef50a0e
	.xword	0x473043cce2656d0c
	.xword	0x6e0702201430b965
	.xword	0xac9d48fbc50c9503
	.xword	0xe689132b0faed422
	.xword	0x3a67ae65f51ff0f3
	.xword	0x2714d95f2209a6dc
	.xword	0xa73cbd7ca5a4dde9
	.xword	0xe91a3bdc0560ee42
	.xword	0x9e5b753489499a1a
	.xword	0x751f0b6ca812152d
	.xword	0x4c54b4a4a01f7c3c
	.xword	0xf0b4b51d694a3e4e
	.xword	0xff10154eb84b39e7
	.xword	0x468ce916a63aa450
	.xword	0x255797ba088d9157
	.xword	0xd6a9e6febbf7bd5a
	.xword	0x051ee6e86e7910df
	.xword	0xb832dc5cb1f7752e
	.xword	0x1b92019198f0fd1d
	.xword	0x52593eeb7deff84a
	.xword	0x6703e45b63d65e17
	.xword	0x81c9b60ca4bd6576
	.xword	0x22f6a563084dcaef
	.xword	0xe72a2eb6ff09f72e
	.xword	0xf0dde8214bb74f5e
	.xword	0x50c67fe1a0c3e305
	.xword	0x5497a790c93478aa
	.xword	0x234a8c83d4681f81
	.xword	0x76a1ad6672a07d3b
	.xword	0xff6b813d295d94e4
	.xword	0x1316b2a55e91d338
	.xword	0x380170a61140033f
	.xword	0x0c54777013d2319c
	.xword	0x3ca16a06a1c8c906
	.xword	0xc78fdbe3be5502be
	.xword	0xa6cd41b0354cbd7e
	.xword	0x4a9035a6837df1f2
	.xword	0x1f1e67027ccf1767
	.xword	0x677072cc0a38dd2a
	.xword	0x712550036b176cc8
	.xword	0x5d1ae5f76140f36e
	.xword	0xe332daa5abed0c27
	.xword	0x1f39fa2224c31547
	.xword	0xe15ce8ff4f325f9f
	.xword	0x55fc11fba5c98665
	.xword	0x6f03c71cec94a08d
	.xword	0x329287aa0ab4d3ac
	.xword	0x43666850ff50af40
	.xword	0x1300fff755daf89e
	.xword	0x33ba9e57949c4150
	.xword	0xdf697e5d82e8645f
	.xword	0x7bea7afb4d60bca5
	.xword	0x4484e6b5dd803183
	.xword	0x920a9a67c556ebd5
	.xword	0x0d7ef263d32d0163
	.xword	0x7b905217c5a63bc0
	.xword	0x797b5986380fb208
	.xword	0x4cb8ec4ed462355c
	.xword	0xc9be861e342c3255
	.xword	0x56932f29d549e459
	.xword	0x1463eef1c2ccba79
	.xword	0x77f7129917c3ee96
	.xword	0x84a452aca167d983
	.xword	0x0db92a6ef0189cfa
	.xword	0x52e98c0f40052387
	.xword	0xf1a1c1ec0841e587
	.xword	0xd2cfe41fc0580001
	.xword	0x642eb67ff33571f6
	.xword	0x947418f6e73875cb
	.xword	0xb73ca5670644e54e
	.xword	0x0597166a5b325c95
	.xword	0x7592a5ba8a2d4cf9
	.xword	0x40c8d91f4e7db265
	.xword	0x9a16d3a03712b48c
	.xword	0x3ea9ef8bd844cf37
	.xword	0xbe5fc77201bb93f0
	.xword	0xf6064fcac4863b80
	.xword	0x399b933439ee81d9
	.xword	0xcbc8310ab909dace
	.xword	0x735064e068af0110
	.xword	0xfc52f886cc7778c0
	.xword	0x5c043effcac8eac6
	.xword	0xca60deec0542031c
	.xword	0x17a654ae7e69669d
	.xword	0xa2d235b1baab0970
	.xword	0xe0594b3d83e81e45
	.xword	0xe2f9fa946883e1c5
	.xword	0xea91680c39ffa1c9
	.xword	0x2314756409b9a8cd
	.xword	0x28d1be2aa479d13a
	.xword	0x18823b6c0b2d5b6d
	.xword	0x8a4d110163c7b0c2
	.xword	0x3c90da433d2d49d0
	.xword	0xe626ab9a4d674e03
	.xword	0xa3e3038b713f8b30
	.xword	0x04a8379ea441239e
	.xword	0xbba4d4e38df20148
	.xword	0xf704042053408fa7
	.xword	0xdee3eacacb59d287
	.xword	0xa516a887ae50cdf8
	.xword	0x45a788a15259db97
	.xword	0xfc91776131b5ccb6
	.xword	0x9d3ce1535026e168
	.xword	0xd36ba1e858a2e040
	.xword	0xc2d7f3e1619e0e5f
	.xword	0xce3651433f63e6f2
	.xword	0x2fc91970ee71595c
	.xword	0x6b23712416c73e03
	.xword	0xa649edebdaf7b684
	.xword	0x9e5250a6e8cbe194
	.xword	0x3befb62e5c79f94c
	.xword	0x650a62760d6d4485
	.xword	0x2fb799e9365faff5
	.xword	0x2ac4154b0be0dd07
	.xword	0x86e56b88ec20fdb1
	.xword	0x631b4583f3f7fba3
	.xword	0xeef543ff6dbb7d3f
	.xword	0x8799e1382e6eedfd
	.xword	0x3ea2ed20659fa9a5
	.xword	0x64b0e5f3e2526ae6
	.xword	0xd527ec74b50955a5
	.xword	0x464f156911d2ea5a
	.xword	0x0d58f08c1af5c0c3
	.xword	0x2533179dfde61de9
	.xword	0xbb8c612496ac95b1
	.xword	0xc0d9a059471db4fc
	.xword	0x99541b9b7a0c7e4a
	.xword	0xba1da840cdd265d8
	.xword	0xf819c33b70caaa19
	.xword	0xc42af1ed7ee6a5fc
	.xword	0x152a401398dd26ee
	.xword	0xaf0803c3619d3f5e
	.xword	0xac1bf752def6ab03
	.xword	0x19a29b03d3040444
	.xword	0x5451084d6882fdbb
	.xword	0x554f74247f7355a4
	.xword	0x41c4d41c88dd029e
	.xword	0xcb4266763ddb87a0
	.xword	0x587ad7af0a16c6c4
	.xword	0xc4c1bdf9cbd00be9
	.xword	0x2917712f07fc9c2d
	.xword	0x2bb583be54054a57
	.xword	0x3c4f2dc4506a0183
	.xword	0x8b4bbc61df0a4119
	.xword	0xb6311a951e0e9be7
	.xword	0x0aabfd8027e67768
	.xword	0x986b8a064e188d9e
	.xword	0xc7e355917e74760d
	.xword	0xa62e47d1d51c9b44
	.xword	0xb67697cb85f6f92a
	.xword	0x5dd37618d4a342d0
	.xword	0xd0cf641d6652608a
	.xword	0xd650cc46f34b6e50
	.xword	0x1bb367bd42c418c7
	.xword	0xb66dbf058b9ea1bf
	.xword	0x3011ae95d334914c
	.xword	0x146007443a47110a
	.xword	0x1859f7b1bb0eb62a
	.xword	0xbdaed004a2deced6
	.xword	0x98e40e8c1a628803
	.xword	0x08392a791594c988
	.xword	0x32cfd33d657a1052
	.xword	0x640a2a700f934eb6
	.xword	0x8c13ac4b86807037
	.xword	0x921218b807d90bfe
	.xword	0x831c7c9da0a3c02e
	.xword	0xdd4ba373fd501724
	.xword	0x9bfd7b36fe60644b
	.xword	0xe00ffcad02e153eb
	.xword	0x4661ed94350b24e2
	.xword	0x151ec20d8f128545
	.xword	0x0d60a6e30ee9b4e8
	.xword	0x674a8cd7fdb113b6
	.xword	0xc267c50c5fb1bd06
	.xword	0xa16a38ef5f3f8cdd
	.xword	0x65bbeb08e8111fd0
	.xword	0x842139e546093ccd
	.xword	0x5b4c002cb750d730
	.xword	0xe4e534cc05fc8be0
	.xword	0x75223118c56d4979
	.xword	0x4c23ad85105584e7
	.xword	0x5fa8a87a6e894b9f
	.xword	0x02699e6366b393c1
	.xword	0x2280c87470f7543d
	.xword	0xf6427db7a9803d03
	.xword	0x80ff176166e9dec3
	.xword	0x348a8f0267cb868d
	.xword	0x754b3eae60535973
	.xword	0xde84dd995978ae98
	.xword	0x1cd32a5fad8fd9e6
	.xword	0x55b88ca1c6f7ac9b
	.xword	0xe412befa4e920f89
	.xword	0x3fcb8f894c0c7023
	.xword	0xd4f43c944e8fa3cb
	.xword	0x3075ae48766f8777
	.xword	0x1cc3e015522d7c5b
	.xword	0x3b37122698adfa26
	.xword	0x21d3b565a1996d74
	.xword	0xb828511d2b385f58
	.xword	0xfd58ac1e8cb6c1c1
	.xword	0xe455651d603e89be
	.xword	0xa6fb4750547f6e0f
	.xword	0x3703a38cabfd8701
	.xword	0x5819ca327a3855b9
	.xword	0x33d8818f47dd3c09
	.xword	0x26ed1a9fd2fa28b4
	.xword	0x713ef48e5922bbee
	.xword	0x46e694a148f1ad63
	.xword	0xd3a856dd72eb331b
	.xword	0x2018559bb6d4e800
	.xword	0x5a451130d300582b
	.xword	0x505d3123c42c33b5
	.xword	0x8353e93ffcbe2e2a
	.xword	0x0bfdaa6294ac355e
	.xword	0x586ac6fdbb0240f7
	.xword	0x03516c740c99fbbe
	.xword	0xe15fb017971932bc
	.xword	0xe1ceef96453c5e85
	.xword	0xcb5493dbfe5e6e50
	.xword	0xa3573f1460806281
	.xword	0xc44865ee9655c796
	.xword	0xd8a48d62ce2afee9
	.xword	0x1fab105fe4640100
	.xword	0x832c1b118d47799d
	.xword	0x852f52adf8297415
	.xword	0x4abcf499ab2b38b9
	.xword	0x5d305336cc9b3729
	.xword	0x1d76789db4317430
	.xword	0x56d84a231580f15b
	.xword	0x579a25f313e85338
	.xword	0x4b983c3d5df614d0



SECTION .ISEG_6 DATA_VA = 0x0000000060100000
attr_data {
	Name	 = .ISEG_6,
	RA	 = 0x0000000060100000,
	PA	 = ra2pa(0x0000000060100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x51572af4c496a8a1
	.xword	0x59852cfeabac4863
	.xword	0x22b5bc2f5350dd6f
	.xword	0x4d01ae4944ad64be
	.xword	0x3c6f193f2928f5a0
	.xword	0x51ab065eaec34851
	.xword	0xafdcdd02cce2e657
	.xword	0x52204e6e47b6d5f9
	.xword	0xbf3f1a965ad341a3
	.xword	0xbc917b171530195d
	.xword	0x5462c50438f2fe95
	.xword	0x85379e9bcfa1b7aa
	.xword	0xb37015d9cbac8b8a
	.xword	0x45aa44ffc51a8a86
	.xword	0x0a205b75633b21ff
	.xword	0x1e35ad1225c4afd4
	.xword	0x9314a9d0dcd3a639
	.xword	0x7916adb43927b2fa
	.xword	0x4b17d1c240f8652a
	.xword	0xfa71c5e4295e56a0
	.xword	0xd7e1448679c6a330
	.xword	0xe50d96afd3c07cbb
	.xword	0x726bfa2cefb4a460
	.xword	0x90daebe67c726743
	.xword	0xa932216a2869bf10
	.xword	0x00d3b16966323b79
	.xword	0x708e67f195587af3
	.xword	0x80a049fe1b270005
	.xword	0x931b4c001ed792ab
	.xword	0xc84f8e1a9244a3b8
	.xword	0x59052846423c92a6
	.xword	0x7568ca4dbd9c74be
	.xword	0x4ae074b21d566133
	.xword	0x51fdc59f2c6495e7
	.xword	0xc0a36b32addcfd0c
	.xword	0x3fc1bdb7b35a65cb
	.xword	0x8bdfca386229e376
	.xword	0x528df411633410a9
	.xword	0x581fe276b4b38c88
	.xword	0x01bc634917340228
	.xword	0xc52edbedfe7a6c5e
	.xword	0xb6e6b8a18b8c32d5
	.xword	0x95a90769cf1e6b8b
	.xword	0xc9e7afa3a5c2a661
	.xword	0x29aa928eff2c691e
	.xword	0x693453af54d751ca
	.xword	0xe445fc8137c90b33
	.xword	0x5fcf6b7e4b1e59f2
	.xword	0x7827d5d046ade640
	.xword	0x6c7de5982d2791c7
	.xword	0x9f953a97e88f6ee2
	.xword	0x03d0aea4b462a88d
	.xword	0x780bc4d1440c5063
	.xword	0x921730b1da0e704a
	.xword	0xee8e7370e6316cf8
	.xword	0xe81c55ed6a2a8df0
	.xword	0xd4aa7096e06f6fa3
	.xword	0x1aa28bc0769ca8e2
	.xword	0xe7963f613bdd7c03
	.xword	0x3a77a78e9d8044f0
	.xword	0xdca4ac8bb8ae474a
	.xword	0x8b72b16599baf942
	.xword	0x45f80b2dadda1c8d
	.xword	0xc69d54ba1413f030
	.xword	0xd11dd68af99b0a86
	.xword	0x8029d0d552b6ec99
	.xword	0x67a911dcf89ba5fe
	.xword	0xe899ed9e06926942
	.xword	0xbac4cd9a38f25d2e
	.xword	0x12438b2e00ea3b00
	.xword	0x80590285f954e559
	.xword	0x253ba09f92c1293a
	.xword	0x00ad5b3e946b6d30
	.xword	0x6bba79a858171d3c
	.xword	0x829c83c7ca795677
	.xword	0x803e509f6cd59d07
	.xword	0x02e654bf588a4a17
	.xword	0x005ec460a83eebce
	.xword	0xbde60dda92234074
	.xword	0xe19860f38e936b37
	.xword	0xb81ef8775396c0c6
	.xword	0x0e78e87f96ac9c17
	.xword	0xc3b5ee71888632d0
	.xword	0x2beb112bcc61c4e1
	.xword	0xf920c26681b9a29f
	.xword	0x12b90b49c7d5f674
	.xword	0x4a9e05efc86c8527
	.xword	0x37250a037119009d
	.xword	0x2ddd36489beb678f
	.xword	0x71a0a78eda4982be
	.xword	0x928891204b1c8d9c
	.xword	0xd790d883a25da10c
	.xword	0x13906e84109a74a8
	.xword	0x3b518b32d15f4431
	.xword	0xe0bbc04797a7778a
	.xword	0x0db1e406f331e65c
	.xword	0xaf36e8e77bf6d5b5
	.xword	0x4b380bcc25aabbdd
	.xword	0xe57f824cf49ecd1a
	.xword	0xad5333b7c339ed90
	.xword	0xcbbe3d087cc02f8f
	.xword	0x72988f65bd0764ba
	.xword	0xe5897739f8dea261
	.xword	0x4e1743468f57a0c3
	.xword	0x521b0d3e63599a52
	.xword	0xebdb64feb1b53d18
	.xword	0x66a3ef50abd9f5c1
	.xword	0x4f9bff55eaaab494
	.xword	0x36f426b0a2061019
	.xword	0x99e4f702eaaaf6cb
	.xword	0xa158870e242c3c70
	.xword	0x813908b0cfe7c22a
	.xword	0x65fe48be9c7d5557
	.xword	0xaa401eb2ebe79511
	.xword	0xab11471a1f38f7f2
	.xword	0xdc487e6f258d0dec
	.xword	0x05b3757b8d99dbce
	.xword	0x512baf79c3751b39
	.xword	0x11247721cdc7cc78
	.xword	0x48ff08c585beaa2f
	.xword	0xf2ef97975f29fb3e
	.xword	0x0a49572806f8aca8
	.xword	0xd7950387b0d8b933
	.xword	0xf240af6aaedf7593
	.xword	0x7dda59ed14cdf0b6
	.xword	0xd80442254caa8bed
	.xword	0x71084faf5473aeef
	.xword	0xfcbf1aae828ba491
	.xword	0x3e3bafa4a448937e
	.xword	0x498e2376988b7589
	.xword	0x3267f34e9dac8f4f
	.xword	0xe8cfd135ba60870d
	.xword	0x1dd440907981a207
	.xword	0xdf5dd5a8b2ad1525
	.xword	0x66b33e7fe14a1490
	.xword	0x27c1d2691d46f827
	.xword	0xbbd5e3ba33378249
	.xword	0x5c5bc496ea9331e7
	.xword	0x80f1096f7f026f6c
	.xword	0xcabad85079e7e50a
	.xword	0xff897c51c3c543f5
	.xword	0x70fbae19c5f7c9cc
	.xword	0x12503f3ba5c8c131
	.xword	0xd501952acd73b160
	.xword	0xc4ac92ff19f27f74
	.xword	0xd6662aa1c789e241
	.xword	0x61d9b875c62fad42
	.xword	0xcab59b816818b9f3
	.xword	0x84883097c68a7974
	.xword	0xc122d90ab8267aee
	.xword	0x8db8981cfa4ad71a
	.xword	0x002cfe5a7ae3e4b2
	.xword	0xd721a83cf067c442
	.xword	0x31a8bf34cec3f62d
	.xword	0xc3802782ad50818f
	.xword	0xb930ceb31b378383
	.xword	0xe4b40f4826384ddd
	.xword	0x7a482ea782579dd1
	.xword	0xdb5d5bf48c630b82
	.xword	0x487522b8c98b70f6
	.xword	0xc7d8b4c7cbe364ad
	.xword	0x0a7cc5e8ecc8bfb6
	.xword	0x3d304da43215a8bf
	.xword	0x3627f2cb028a33b8
	.xword	0x8ee1d7e413d5c29a
	.xword	0xee1361ce95d73e12
	.xword	0x8eb45fc0186d2e91
	.xword	0xe53173ab8c06cd14
	.xword	0x77fc34b46c3b4c48
	.xword	0x76c3f1cdee0e963b
	.xword	0xb13c29ecbb8b48bb
	.xword	0x16804b9bd157dc82
	.xword	0x3e682a9b17897020
	.xword	0x63b548b4ad284477
	.xword	0x5f0028a9acd4af68
	.xword	0xc62c11f430f4a5d1
	.xword	0xfca8dfc2ef7b0a80
	.xword	0x228ff41bb98e9788
	.xword	0xf5b079d99ef245d5
	.xword	0x7d07c98d137991bc
	.xword	0xe54dfb74c7e0538b
	.xword	0x08e5a4f635af708e
	.xword	0x7dbd37ec824affb0
	.xword	0xd780f2daf6e8ebe2
	.xword	0x82a9e202a7dd33da
	.xword	0xee537b5c2d303768
	.xword	0x7ad71c8f4fab731b
	.xword	0x5d9fbafe493ef293
	.xword	0x14b21bfec487ed05
	.xword	0xb5b4c472a32301ed
	.xword	0xb5a3fae3f365a423
	.xword	0xcd019de48a91c2be
	.xword	0xac579490b3c49398
	.xword	0x3b118d83ea79cfd2
	.xword	0x7ccbd0e2a544db17
	.xword	0xa3a01e26ffb76337
	.xword	0x0ff2fb700fa7f4d3
	.xword	0xb4590adbe8cf0ff7
	.xword	0xd82b63fbd38ace55
	.xword	0x5e2bdfb961c446e7
	.xword	0x007a48e1a816cfb7
	.xword	0x894c0f7e54619906
	.xword	0x6d1c9ca08186f5d8
	.xword	0x9f8a45f68b58ada4
	.xword	0x6a444fd85d507b95
	.xword	0x3b214c1d7d994470
	.xword	0x4d935bb1bfdc78a5
	.xword	0x75f99357faa695d2
	.xword	0x6c9c6a431255717e
	.xword	0x1feca8434c78cd69
	.xword	0x25017df80bd72dce
	.xword	0xad9496b2c5966b83
	.xword	0x407651e55b86ce8b
	.xword	0x76bfcb427e9345c7
	.xword	0x7aaad46fc1f1cfa9
	.xword	0x2bce898bdb507bcf
	.xword	0x136e129b38e5892c
	.xword	0xbb4488c6449695f2
	.xword	0xdd96f6b82ac40791
	.xword	0x8cb8e74399641845
	.xword	0x0aaba51aa8243605
	.xword	0xcece102ef7d3767f
	.xword	0xbbe958e65823d711
	.xword	0xc799d5616893816a
	.xword	0xa8a9f1532ab43e57
	.xword	0x76840039201f869f
	.xword	0xa76d80ef42172b21
	.xword	0x345ae7f48ce96ed1
	.xword	0xf78ad66a80d21212
	.xword	0x7e7c7a2548aedf4e
	.xword	0x3eacedb2762af110
	.xword	0x531e4254c36e914c
	.xword	0xb5af7694048a0d71
	.xword	0xe0a91b9c073a2ef0
	.xword	0x4606b3bdb02d1ca8
	.xword	0x59a5de958e19a30d
	.xword	0xcebd4444b020e469
	.xword	0x0c52d863c42ae216
	.xword	0xdfc74e7dbcd4064d
	.xword	0xf659ce58352e13dd
	.xword	0x2e3d8a5e8cd8387d
	.xword	0xe1a6dd1791bfaa46
	.xword	0x6dc869b6e43ddac5
	.xword	0xb7b57f8988d00670
	.xword	0x3835e8994f2c7501
	.xword	0x51af2d0aecb773ca
	.xword	0x7136377feaa346b6
	.xword	0xa56d8ad1ac4f2809
	.xword	0x2d12a33aec905dc8
	.xword	0x07a34b44ce4cad38
	.xword	0xa9c5a9789f46a4c1
	.xword	0x176bf3889cd6ca17
	.xword	0x46f6b174f058170c
	.xword	0x0292b3101019bdba
	.xword	0x4fe386a4f9f13d88
	.xword	0x6ff029629e587328



SECTION .ISEG_7 DATA_VA = 0x0000000070100000
attr_data {
	Name	 = .ISEG_7,
	RA	 = 0x0000000070100000,
	PA	 = ra2pa(0x0000000070100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x53898e8bee2146a0
	.xword	0x014fdbca82ded113
	.xword	0x6987453594c5912d
	.xword	0xd09d1b3bff94421c
	.xword	0xa4eb4cff50819e12
	.xword	0xf28a5b434119d3af
	.xword	0xaf2e308cb27a8605
	.xword	0x4eed6fe21f86283c
	.xword	0x805133d2bc64ab97
	.xword	0xf03097a95bd06771
	.xword	0x11b77498ee3030cf
	.xword	0xdaac48c77cc01da8
	.xword	0x549daac62077eecd
	.xword	0x22212d7a9718c670
	.xword	0x981e2005f0ed17c6
	.xword	0x33e781a9637c098d
	.xword	0xb642a3b72f6dee4a
	.xword	0x5868fd470ff8c566
	.xword	0x0931cee515f251c6
	.xword	0xf14c44a9522ff170
	.xword	0xde2a8190501952e3
	.xword	0xd2448efa29838626
	.xword	0x84ba4acc84719ea0
	.xword	0x958cf5e79d23e19f
	.xword	0xf8272254d4bcea93
	.xword	0xad77a8198f8b97f3
	.xword	0x0e7845368e439535
	.xword	0x1ec29e0ceea58c03
	.xword	0xefc63b1eda7626e5
	.xword	0xd532749ca5bf4511
	.xword	0x11cdd1ae43eb8596
	.xword	0x3d6784225b6065ef
	.xword	0xbe1674f132a0c759
	.xword	0xc83a13f65454c55a
	.xword	0xc4e88f0ab6769d01
	.xword	0xdd13e2afbf478bfe
	.xword	0xaf886fcab87a7b04
	.xword	0x70f7dc1838730ab4
	.xword	0xd6bd31f8f5e5f816
	.xword	0xc620ff4f26d28990
	.xword	0xd5cd0d4bc32c6033
	.xword	0xace28e27c1c8a549
	.xword	0x1a8429a143b2ec13
	.xword	0xf93f31d3e4ecb7fe
	.xword	0xc8241df7fe0418f1
	.xword	0x43e64ba947156705
	.xword	0xf68c0bd1f3a6c9bd
	.xword	0xbb0555a14f1aad8b
	.xword	0x4120ec8a4db18cef
	.xword	0x7b1cfdda53d17a70
	.xword	0x83d9d9988838406c
	.xword	0x22b13dc1af279aff
	.xword	0x6c0b402e52d5c1a1
	.xword	0xec3888132fa86be4
	.xword	0xfab8100a911dc345
	.xword	0xe654bd420c3139d4
	.xword	0x5662f96988d14e08
	.xword	0x8fa1ac972483c584
	.xword	0x1daa087231e0f7c4
	.xword	0xd6dd462f1be07ef8
	.xword	0xbbf754ccbc56eea7
	.xword	0xbee859ae8ee3117b
	.xword	0x07129e9307fd5ffb
	.xword	0x8db00ea632e70531
	.xword	0x1f2a738b76ab91e8
	.xword	0xb80818805effd5c0
	.xword	0x593d720802704181
	.xword	0xaee089173c50b8d2
	.xword	0xf71958af6da310ef
	.xword	0x01a670898a4d2bb9
	.xword	0x9736979405ebc516
	.xword	0x2822afc04c76c3ce
	.xword	0x9797562fc186c714
	.xword	0x0a144fe27734d932
	.xword	0xa33595e6d22c9748
	.xword	0xc87ac192cb7b5f61
	.xword	0x454f3214955b08f1
	.xword	0x04ded72a0e0e76e6
	.xword	0x78d39896603f6dd6
	.xword	0xb719b940ee6fc1f1
	.xword	0xd867bd34d8c406fd
	.xword	0xe14c7a726c2ef336
	.xword	0x771bb1cbb8b1b113
	.xword	0xbe88e2f8f95fade5
	.xword	0xaae5b476251a3c12
	.xword	0x93c581f4a9140bf8
	.xword	0x96a97ae31dce05f5
	.xword	0x862adeb63981a775
	.xword	0xe4d59ba47f017871
	.xword	0xe4a76d3a04f3e344
	.xword	0x62402411fb41276c
	.xword	0xa7579a0e4e314ba5
	.xword	0x7df4a1ec341ebe24
	.xword	0x28339702b98c8429
	.xword	0x88e5cb7f68d542c9
	.xword	0x1ad8d999c58afd92
	.xword	0x415f919dcb6e15b6
	.xword	0x43a6a539a0fc5187
	.xword	0xb4354d60b18476d5
	.xword	0xd493268721a81655
	.xword	0x0323af1bfd21d329
	.xword	0xffc79df9abdbdc60
	.xword	0xfe91b7abf0b99d09
	.xword	0xae97c13ea5e50266
	.xword	0x66c0c91cf55df45c
	.xword	0xa71c2dd062557e81
	.xword	0x09dc98f709d8fe38
	.xword	0x915246ce3ada6f7b
	.xword	0xd1b145b6bfdbde02
	.xword	0x78c467dd505e5ce2
	.xword	0xa1c3a7d343c983d4
	.xword	0xef786e5388ae1f67
	.xword	0x8e1dc8912015c0bd
	.xword	0x8b22332a05cfccd0
	.xword	0x628ed65bf3dff124
	.xword	0x8f0bc292214381c8
	.xword	0x892451b8ce270177
	.xword	0xd3ae958d5888e1bb
	.xword	0xd87b4d9a0c0bf682
	.xword	0x1be89b3f1d0dcf75
	.xword	0x5d82cc9aaae5cbeb
	.xword	0xf490cf7647e142e3
	.xword	0xcedfa1a07accda37
	.xword	0xfaa06ff791e36fae
	.xword	0xfede241ff11a53e4
	.xword	0xa94a85e2ac0d4f32
	.xword	0x51b9901bc38ee898
	.xword	0x76fc4d03d981c8d4
	.xword	0xf9997d8f0096346d
	.xword	0x78ff5b7234c46be5
	.xword	0x9e044838b07f384f
	.xword	0x01438f134bb31a7d
	.xword	0xdf1356a44d9f429c
	.xword	0x2a65b8d4d9b7c82a
	.xword	0x4625d2eaff0beda2
	.xword	0x90866e95805b9053
	.xword	0xc343f5f01ab710df
	.xword	0x7b6e35bbca387116
	.xword	0x75b4013f082a4113
	.xword	0x6273cb8f3ca65eae
	.xword	0x089dc7e3baa6e891
	.xword	0x3c1fd49ae3596084
	.xword	0x04a04f8247101fe7
	.xword	0x5c1d4f5503cef7f3
	.xword	0xceade86051cbdec0
	.xword	0xd11f5c6aa8bbd34c
	.xword	0x8d6f359cd4eb9f39
	.xword	0x26d7dab54e77e07d
	.xword	0x49ca39c04527dd8a
	.xword	0xbf7b4cb884f78f07
	.xword	0x3d135b234bcddfba
	.xword	0xebf05bf287b2f597
	.xword	0x9d4bb439c387cf12
	.xword	0x933f529a2ce09424
	.xword	0x41857e7d585538ad
	.xword	0x661f70ec43c8b45e
	.xword	0x3711c52ab970219e
	.xword	0x5b68e5f6bc13c151
	.xword	0x7dcc1b91bf116ce2
	.xword	0x8b134d3ee2207bd2
	.xword	0x8603e44c1c054a4d
	.xword	0xf395e4e2d0ad2e0f
	.xword	0xbae71df5b2aa5603
	.xword	0x1bc664f02b70e886
	.xword	0x050614003311cb18
	.xword	0x26cda3f0be5efb7c
	.xword	0xaab4d07a0b332713
	.xword	0xfac099f67bc5ac8f
	.xword	0xf1b4a058ea3dd6a4
	.xword	0x6009295f4fd55664
	.xword	0xa0393a0b3c6cdc46
	.xword	0x46c675e106bce89c
	.xword	0xeb5e04a3891de33a
	.xword	0x7e94d50c9138714b
	.xword	0x6babd9858b0e90f0
	.xword	0x57a187a940166e09
	.xword	0xa4ae4ea71b197fa8
	.xword	0x7a519ee4de8f861a
	.xword	0x1b3d2c39c476eefc
	.xword	0xf63b20d3e0452313
	.xword	0x34cf6a982758ed72
	.xword	0x0d7945fd1df4e72c
	.xword	0x0bef2a6303ea3644
	.xword	0x5876e3fc6d63e0e2
	.xword	0x4205e071565ae621
	.xword	0x9a2b0abae9aa3471
	.xword	0xebae4003629968e1
	.xword	0x5c08e3269106d1f3
	.xword	0x6004326088eb1cdf
	.xword	0xc4081c0292b8e4c2
	.xword	0x53b642c0eaf791c8
	.xword	0x50103617d0e03d57
	.xword	0x1cfce4f8a4f2e193
	.xword	0x02dd559023ff71d9
	.xword	0xe3a555df68fc9790
	.xword	0xc9f4d86a7a721d1c
	.xword	0x19a075fbad8246c1
	.xword	0x0dfd478e59b65fce
	.xword	0xec8974696e0f3176
	.xword	0xe0c499b7a37d79f5
	.xword	0xac86eed87fd4406d
	.xword	0x520163793d5d59a2
	.xword	0x19243f775b258a87
	.xword	0xfb4fd28fb8f8571c
	.xword	0xd5c03b4954bea8ef
	.xword	0x461fc0179ba580ef
	.xword	0x629ee579446f8209
	.xword	0x68eb70c30ebfc464
	.xword	0x3f05706d429e74d9
	.xword	0x535f486059ee4d75
	.xword	0xf98c21b928d53cde
	.xword	0x08a53bef4c693952
	.xword	0x312167f829d6d0bb
	.xword	0x96879cc6ba560664
	.xword	0x77528a8b9934273f
	.xword	0x578550e7427c4ef9
	.xword	0x7d305b1151706e1d
	.xword	0xfa983bd6ce5aa803
	.xword	0x64d235a9194cace0
	.xword	0x593139b21830dc0d
	.xword	0x8a2823ca4a9c4e23
	.xword	0xd4f35b8188617572
	.xword	0xf5d0ade57987c599
	.xword	0xb0f9a5342e3a84b6
	.xword	0xfaf5f483d671e263
	.xword	0xb700b3fc1ea4ba35
	.xword	0x00e733c2c71f054a
	.xword	0xeaa182de6f98456c
	.xword	0x7e5bae3bc93ff49f
	.xword	0x9f014738a03cf577
	.xword	0xfd162d2d4cb179de
	.xword	0x178cda12d1da8d47
	.xword	0x409ef755becf3503
	.xword	0xd681f4731449d109
	.xword	0xcf6a2cbdee596cdf
	.xword	0x5c2c81ca75f05668
	.xword	0x5438e9e3e4b29b0e
	.xword	0x1ad6753cc99aed2e
	.xword	0x0a8c68cbcfd33b86
	.xword	0x2f8914ffce04e6c4
	.xword	0x5e427174918a9680
	.xword	0x9970d6d63b9e2210
	.xword	0x99484ccc59c8bc70
	.xword	0x965446e7ea6063fb
	.xword	0xf6ffeace4aa67b1b
	.xword	0x9a8c5bb6db77e6fc
	.xword	0x51c39916f7c761dc
	.xword	0x6320a08512219c3f
	.xword	0xef8c0f1a7b16715a
	.xword	0xadf6915add870248
	.xword	0xa5dfaa3ce374acf6
	.xword	0xc31c1d133684b6f6
	.xword	0x8071b5b6d7e0bd81
	.xword	0x111f150d9a41d6d4
	.xword	0x1ab086585d816ae6
	.xword	0x3a666e3d330b6fd1



SECTION .ISEG_8 DATA_VA = 0x0000000080100000
attr_data {
	Name	 = .ISEG_8,
	RA	 = 0x0000000080100000,
	PA	 = ra2pa(0x0000000080100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x0b63c49e5bd45138
	.xword	0xbe59db7ad75982a8
	.xword	0x4b81a642f85b2562
	.xword	0xef0662d42d701c6b
	.xword	0x83812afa008136d8
	.xword	0x15ee5735f170cf45
	.xword	0x7e4567fb954d6919
	.xword	0x40b6dc3bbf9e404d
	.xword	0x7b44775e338f5615
	.xword	0xc44fff05cd42f023
	.xword	0x2db51b2a60b792e5
	.xword	0x80ddfefb77b99f68
	.xword	0x76073132840d83dd
	.xword	0x46e2ac84f4b57814
	.xword	0x16f8df5f168c057d
	.xword	0x312e0c670e581e2f
	.xword	0x7c0709962ba8c5ac
	.xword	0xe68f55dfd8edb015
	.xword	0xa944392b85a79e01
	.xword	0x00afded270909066
	.xword	0xae035393da59a735
	.xword	0x1fc1eaaa68268fda
	.xword	0x222315390a3dd6f6
	.xword	0x5f4f4df2ab646867
	.xword	0xd48da67d7c1f660f
	.xword	0x7239bb23c558e8f3
	.xword	0x6d7c4e53f175418d
	.xword	0x6945a1fc888f3f58
	.xword	0x8116f0cee5065a07
	.xword	0x9f52df72d31e8c62
	.xword	0x5ab5a0e7ff074ae2
	.xword	0x48b50027836dae46
	.xword	0xe06605df8a2bcc5a
	.xword	0x924b9f3a80b546c8
	.xword	0x82b1cf9d02b52a1d
	.xword	0x3b81f117fa2e8108
	.xword	0x3e4d7909e6dc71ec
	.xword	0x62d6b0629e13b3d9
	.xword	0xb864c58d1b438295
	.xword	0x67eb0af96345156d
	.xword	0x1446542ff14aec61
	.xword	0xaa4bbe284abeb647
	.xword	0xe3fdebea3cdc34bb
	.xword	0x04bdc8c39f88b137
	.xword	0x0888e5e85ae1ed8d
	.xword	0x6d3a0c014a51d0d5
	.xword	0xab36a842b7df7502
	.xword	0x43b5beabb4b13ac9
	.xword	0x9e765792159d1ba9
	.xword	0xe61d88ec73349439
	.xword	0xacb3430f5b83f64d
	.xword	0xe6565204ef8d0d47
	.xword	0xa38cae2bfdbea53e
	.xword	0x57cfbd3e030ecf8a
	.xword	0x74fa65e470d6f0d2
	.xword	0x7ed3f9e82f7b85af
	.xword	0xa7043f2b98bc6be4
	.xword	0x01c92ad170132829
	.xword	0x66703b52d2ff7317
	.xword	0x7fcd8b46f66ca755
	.xword	0x99bb8049323f1522
	.xword	0x63bb0539c2a068db
	.xword	0xb8e2fe8e81ae33c0
	.xword	0x2a2bd60e003dcc57
	.xword	0x0c6dca756d79373f
	.xword	0x254289bf7f5b80fd
	.xword	0x542f04b6ef9ad64b
	.xword	0x09f8175a3fe83bdb
	.xword	0xea4385f703b545ed
	.xword	0x95e6dba760624aef
	.xword	0x7f227e88448d0fe1
	.xword	0x98ee3bb4b1582186
	.xword	0xf172749a3f8ba8ac
	.xword	0x1e219fa0acbbfe4c
	.xword	0x550f973896ac3069
	.xword	0x4e35671222c9a3ef
	.xword	0x93f6ba62f9d8604d
	.xword	0x748932528f2fb4c1
	.xword	0xc5dba6f3da509aec
	.xword	0xed997ea710bea3f4
	.xword	0x70fd402506dbff28
	.xword	0x8134830f63b28e66
	.xword	0xb30a1d7e7c6240f1
	.xword	0x77e5019ae7692060
	.xword	0x3d56dd535b35c021
	.xword	0x022ea3a90d17b79a
	.xword	0x7e6aa547b224d140
	.xword	0x291f08e3b154e4db
	.xword	0x013b4d7501b4efba
	.xword	0x68f3eba1ec2d3e52
	.xword	0xd4c1385fac4cb138
	.xword	0x95aa1cb50f60632a
	.xword	0x0680400202e39743
	.xword	0xfed20e86ab1db8b3
	.xword	0x2d3e983baa8f4000
	.xword	0xc6eb87b8ff94eb18
	.xword	0x97ab112bd024add5
	.xword	0x0c1a638d0798edd7
	.xword	0x72fea02e17c446ba
	.xword	0x3fba2ef1852c526d
	.xword	0x3af6a7c929009576
	.xword	0xea176cddb02fa657
	.xword	0xaf9f3b6f28652b0a
	.xword	0x11f84a2ce4b66510
	.xword	0x31790d8993b8ab09
	.xword	0xecd37f618cf29fe1
	.xword	0x10f319c35ccd454e
	.xword	0x9cfcadf2c1a26c2e
	.xword	0x46b571d64c0f0089
	.xword	0xa7038bdeb332a726
	.xword	0x9b4486105b4038f1
	.xword	0xab79848ba2959cc5
	.xword	0x8eb45b31d27a953a
	.xword	0x7fcde9a3f6e3ad36
	.xword	0xa3240b5b23add8a3
	.xword	0x6efee1214897ce47
	.xword	0x2fd81d38842e175f
	.xword	0x40a97276232b4031
	.xword	0xa90db1535cc7b463
	.xword	0x68ef31baae9bb046
	.xword	0xe51fb2aaabd2bd06
	.xword	0x45b094cb54bd3b76
	.xword	0x874032e931f19305
	.xword	0x1db3b7197961cd56
	.xword	0x0f8b81ca3f775e50
	.xword	0x1dbea936c7199c2a
	.xword	0x33014f6544a7a164
	.xword	0xb87caa08d0636a27
	.xword	0x753b5f89a806ae74
	.xword	0x2a793b2da169ca61
	.xword	0x119b4791df0556de
	.xword	0x0245fb8f3edc42b4
	.xword	0x743189e716508d95
	.xword	0xcc5dc87b218de68d
	.xword	0xfc47b3152d78e9d2
	.xword	0x0a8fb941f0c41b97
	.xword	0xd6ad78e355f0f5a0
	.xword	0xf884c737a99fba4c
	.xword	0x35fdd1f1561ce4c3
	.xword	0xadb818a1b198c45f
	.xword	0x591d4896e7c997a4
	.xword	0x43c5a047eab8e0c1
	.xword	0xcd03e9eac96e0a6d
	.xword	0x0034329acda98178
	.xword	0x07edf4306f985e93
	.xword	0x47780ca9847147a2
	.xword	0x87f65bb8575f8d55
	.xword	0xaf8c9435a25957c2
	.xword	0x47ecbfd05589f120
	.xword	0x5a7028dc69506b1d
	.xword	0xb81ad329d37fdbca
	.xword	0x4da3853679077f0f
	.xword	0x7e4bfa93fa5801c4
	.xword	0xe627991e3974807a
	.xword	0xceab2624097f4eb6
	.xword	0x8b8f4e3ad476868b
	.xword	0x6836d00e183c81bb
	.xword	0xe377875b868fdfbb
	.xword	0xc5e14322b1ea7c68
	.xword	0xbcdc4facabd13b63
	.xword	0xd266216eed164ed1
	.xword	0x348d984092b703d5
	.xword	0xae0b0c94d1d8f189
	.xword	0xa11fd191ad319e4a
	.xword	0xba1a4e60bfbfdfa9
	.xword	0xc1590071ebb61a6a
	.xword	0x94ddab022bea2c9d
	.xword	0xeaae461c0f680566
	.xword	0x3a1c6ff9b968f59b
	.xword	0xe0c83de342deac78
	.xword	0x541d34a14378a714
	.xword	0x19e07290ce2cc883
	.xword	0xd490cf42e28983ed
	.xword	0x1b710b10aaec8e8b
	.xword	0x8667cdf70f3710fc
	.xword	0xe89dae36cecdd996
	.xword	0x0d9a3716dbd910c7
	.xword	0x4903a54f2c544895
	.xword	0x807c0c006c58f824
	.xword	0xdeb2f596dd4ff9d6
	.xword	0x823b43e4da8c8548
	.xword	0x0e7d66e809fa0b32
	.xword	0x50c7b2186fdd3899
	.xword	0x80698835d1f3def3
	.xword	0x677a4d2ce33d93ee
	.xword	0x179641b9c1da8795
	.xword	0x149f7d864b331950
	.xword	0x6b7f62957e312b73
	.xword	0x426ea16c922c8c5f
	.xword	0x1a6a480497ce71a8
	.xword	0x162a1a396ee8fc41
	.xword	0xa75e6ccecabae6eb
	.xword	0x7dc03788dd9d5926
	.xword	0x36d7b1b5eb818ba8
	.xword	0xae5108050dfc25ae
	.xword	0x327affcf1719391f
	.xword	0x3cc130aa30ca2de4
	.xword	0xa71fe4a397496df5
	.xword	0x6b34ae16a2e30db3
	.xword	0x9c61f8bca655e330
	.xword	0x221ac7ac0a131a30
	.xword	0xf167138acc1999c4
	.xword	0x8e75d560813d20da
	.xword	0xe9d28aabacaef394
	.xword	0xfb6984ad8616f7e1
	.xword	0xafcd63b287c1aabd
	.xword	0xa7df4d4e2b1a69d3
	.xword	0x789686beb8089e83
	.xword	0x68568e3de4011fc0
	.xword	0xa361394a910f0aed
	.xword	0x047f0063d7b481b6
	.xword	0x5521ad8343f9052c
	.xword	0x17f917d1a78b9ef8
	.xword	0x4fa1506b13411899
	.xword	0x6259bc73be8e8cae
	.xword	0xfd876f1c44d9bb2f
	.xword	0xdb431c6ea060c7e5
	.xword	0x7c5641d4cfb1af7c
	.xword	0xaf1ab8b79723c3e0
	.xword	0xa4129c75964186cf
	.xword	0x0d74dca91a4c6a45
	.xword	0xa186a2e4058bd402
	.xword	0xfa2ca4ac9f4cd9c2
	.xword	0x110ae7f8e86e7f27
	.xword	0x44ec102aed354d61
	.xword	0x7add4062b112883b
	.xword	0x1427b689e5aba353
	.xword	0xaf8465062f5ec381
	.xword	0x31eacfe8abe7b832
	.xword	0xd4fba56ad2c2f5af
	.xword	0xd72fc753666409e1
	.xword	0x8e3f61ae894bb534
	.xword	0xc8c88dc17023581b
	.xword	0x49803a40387e1787
	.xword	0x947beee89dcc4d75
	.xword	0xcb04988214757b85
	.xword	0xec7e6804f8f1728f
	.xword	0x16333a4ae3647e41
	.xword	0x2aa250e2c5498eb2
	.xword	0x076af9d2726e2d94
	.xword	0xcdcd6d135f92caa9
	.xword	0x81fdae5eb6deb54b
	.xword	0xc5bf41b3f9a12d7e
	.xword	0xfb68485a7ff0cd06
	.xword	0x92aa3bdb6f87125a
	.xword	0xdde9c735cbb43ad7
	.xword	0x9192d37a001dad52
	.xword	0x3219b82293577c1d
	.xword	0x30bea6f34957951e
	.xword	0xded77bc676dfcc85
	.xword	0xa7d21160c0bd7fb1
	.xword	0xa8cb1e8a970bcb0f
	.xword	0x958178377308c9c9
	.xword	0xa79b58fa1e35e849
	.xword	0x269d2e89d804f00a
	.xword	0x1858dd00eb7221ab



SECTION .ISEG_9 DATA_VA = 0x0000000090100000
attr_data {
	Name	 = .ISEG_9,
	RA	 = 0x0000000090100000,
	PA	 = ra2pa(0x0000000090100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0xb161cedabde4a85b
	.xword	0x87cd01fcc40938f3
	.xword	0xb92c2319e1d09654
	.xword	0x4bfb2d5e05290892
	.xword	0x67fbb9d035d15d1a
	.xword	0x84c83fbab0d7e49b
	.xword	0x1cf60eb3af0fe0b6
	.xword	0x7ab8ac40ab560d9d
	.xword	0x39c9f79c9266bf89
	.xword	0x4cf9e94d06e4165c
	.xword	0xf4d07ff4d07447fe
	.xword	0x3a02d3b439d850e9
	.xword	0xaa549e886a29ee43
	.xword	0x2d182a6cb0826bf9
	.xword	0x3ed4698f70cfa660
	.xword	0xee5840fcb56d21d9
	.xword	0xab9cc46f913d26c9
	.xword	0xaa7bd10a47fcb2e9
	.xword	0x0c04126402322600
	.xword	0xdeb03222d424a41e
	.xword	0x2707d239b9eb2dfb
	.xword	0x6390bce21789c301
	.xword	0xa59242e455dab6b9
	.xword	0x10fda7bca3efba70
	.xword	0xd489655ce8a4627c
	.xword	0x93794aedc232a1ac
	.xword	0x984c213c3406c87c
	.xword	0xd7a2de26ee6f8bc6
	.xword	0xe303898e7162f898
	.xword	0xe39a2b04def979cb
	.xword	0xdf8b191fe84e711d
	.xword	0xc66faba0131e8be0
	.xword	0x8227f6883b8a05df
	.xword	0x2107d31b739482f9
	.xword	0x7a74b024519fa8e4
	.xword	0x62eab2c6834b155d
	.xword	0x3c4f0d8a466be360
	.xword	0x96b96110b43a8e62
	.xword	0x12ad18f652e014d7
	.xword	0x183ea0d8cb83e53a
	.xword	0x984558c60ffe6424
	.xword	0x37b62f9c3bb36af5
	.xword	0x1a66d6a223a18019
	.xword	0x344d4082ac20b04d
	.xword	0x36e16927a52cb458
	.xword	0x2ed99419cf12ab4c
	.xword	0x0c7d9d4a78996758
	.xword	0xe10c499a435c8fb3
	.xword	0xb488a719ea3a97e6
	.xword	0xa5fc43af1d57b7c7
	.xword	0x7f29aadf7f97fe31
	.xword	0xc012f150506b0ee4
	.xword	0x9499917dcc99e38e
	.xword	0xcc2db052e1dc6af6
	.xword	0xeaf70dc3d365416a
	.xword	0xadaa080b7b24e852
	.xword	0x760df3c111daa859
	.xword	0x9cc5fba5f00569a4
	.xword	0x552a59751dd72af9
	.xword	0x3c82cd408ea03463
	.xword	0x9c58970b897156ac
	.xword	0x6531475fe8034f4a
	.xword	0x4222cd6a2c168e26
	.xword	0x4eb21eb82afe6103
	.xword	0x76025c9f76242df7
	.xword	0xe1b33c4303c1f42f
	.xword	0x16621e53f2ae0aac
	.xword	0x96fa6c37edf7a9b9
	.xword	0x7d0b496125e5dfa7
	.xword	0x4cd4576013529e61
	.xword	0xdedcb955b2bd9f0a
	.xword	0xc7a4f701847cb3ea
	.xword	0x0146910d552871b4
	.xword	0xb149c67cef981dbc
	.xword	0x89093f47086a27de
	.xword	0xc3bd7570f45bf3c8
	.xword	0x007a31f59c4ed30a
	.xword	0xf601ba72e6ae3a72
	.xword	0xc6c2a7cb479c912e
	.xword	0x25585f8d2682a585
	.xword	0xb4737025e1fba581
	.xword	0x64e9a615aaae55ce
	.xword	0x12f93589004858e4
	.xword	0x9b9d381495407d81
	.xword	0xba4f841c3c2e4a17
	.xword	0x50ed394918b69bd4
	.xword	0x576afe2a5ef317dc
	.xword	0x1472bf827da948ab
	.xword	0xf5c0d9fc898ccfa7
	.xword	0x915ce8aef58232ab
	.xword	0xf6d73c0c6689fbf9
	.xword	0xc9086cbefb3eda1c
	.xword	0x1381508411065bcc
	.xword	0x4e95f26377308a61
	.xword	0xdf35643d8994db9b
	.xword	0x2d4074188c14df8c
	.xword	0x904ff6823558b877
	.xword	0xc2598d86344c55df
	.xword	0x9e2a206fe6a7f1a3
	.xword	0xb3497a18fc07160c
	.xword	0xa566fc22f6777b2c
	.xword	0x0361a8f332aebe07
	.xword	0x5f6e659d1beda469
	.xword	0x84199b1f32864bb2
	.xword	0xd8c60082eebbd481
	.xword	0x11f32bfdd8961af7
	.xword	0x0a60bb0529fe89db
	.xword	0xa298223a4e010cb7
	.xword	0xafbf78a774f3af4d
	.xword	0xbd837fe5f4989f7a
	.xword	0x4106a027591f8dd7
	.xword	0xd772910ea84b77c6
	.xword	0xe37202ffa672898c
	.xword	0xed50314104a716c6
	.xword	0xe48f4d0d11d06986
	.xword	0xf7ca957ff7fc5bd3
	.xword	0x5ea67cbba3c01bf7
	.xword	0x8c381934409064a4
	.xword	0x2138848320996779
	.xword	0xa7181c267d7c39d0
	.xword	0x61d9497ac2fb00a1
	.xword	0xbd01e8b12180cf53
	.xword	0xeaa4db21ff9f1155
	.xword	0x3b75b7b8c1c94295
	.xword	0x181a8a5b522d3230
	.xword	0x8b37fbf8f597f5c6
	.xword	0x327473ecdbaa4992
	.xword	0xf5d392ec4ec92df0
	.xword	0xb44dc3069d034a48
	.xword	0x3bc9c25008cd0eed
	.xword	0x33d07913da5a9ceb
	.xword	0x0ec980d8685a4cd1
	.xword	0xda78c831a8a25eba
	.xword	0x6bef7eecf09b4f66
	.xword	0x6abf8a3435f99f99
	.xword	0xd4e5b6e861c84806
	.xword	0xe7a702b2c88d8c0c
	.xword	0xa3b968b1374192f9
	.xword	0x1f253e38a9b83a4b
	.xword	0x588ee900a576922c
	.xword	0x303b88b5b31f9491
	.xword	0x5768e596298c0ca4
	.xword	0x2809dd1ff58ab0a4
	.xword	0xf50b857f5f6b2bb4
	.xword	0xac64e4a667e4e580
	.xword	0x0cd6fbc0bb82b52b
	.xword	0x2623f7df2d1bbeb9
	.xword	0x13152717f63af481
	.xword	0x1ce0e5b1027370e9
	.xword	0xb8f9955d0c895ab7
	.xword	0x9122ec279ad0557d
	.xword	0x55b01e94783ef045
	.xword	0x9780e302c57005e8
	.xword	0x8db16ecd1aaaec79
	.xword	0x628de46f90f562b5
	.xword	0x175dfc05e2f3c7dd
	.xword	0xe08efa18a6f71056
	.xword	0x2a4ac755d2dd511d
	.xword	0x3ed88cdfcbe32eb2
	.xword	0x18501fc5df1f8441
	.xword	0xa795588b0e2aff7f
	.xword	0xcb21ad029c872bdd
	.xword	0xe58704bf2f7038dc
	.xword	0xc26fb2cc1063d224
	.xword	0xe0d4b4797a28e886
	.xword	0x61b627bfb9318c28
	.xword	0x6577380a784d81ee
	.xword	0xd06718b254c8758d
	.xword	0x12fb45c0594cdb8e
	.xword	0x3943d3c2c4cd66d5
	.xword	0xe7fc779cf2a78060
	.xword	0x09546884782bb5f8
	.xword	0xbf93308d13fbaf92
	.xword	0x6aa60498e7954940
	.xword	0xbf72220db9253150
	.xword	0x411eeadf60fccf8e
	.xword	0x09fd2fba6ffb5391
	.xword	0x00d4c4c0d591827f
	.xword	0x39be7395cf598b6d
	.xword	0xe7315050d16128e7
	.xword	0xffbc68715e444e50
	.xword	0xe303f2caee33c9c3
	.xword	0x6b546ddb2749793b
	.xword	0x572a757874e6cccd
	.xword	0x463af82799bf5873
	.xword	0x0dd45b44887a9a2a
	.xword	0x1a5de363176fd60b
	.xword	0x8f16d08f4d54bb3b
	.xword	0xbf7ed372e2896b24
	.xword	0x7d496bb924bc977c
	.xword	0x7bba0a1bd41d7e48
	.xword	0x9925e54b4938f96f
	.xword	0xe23840f9e6b25a33
	.xword	0x8874b819d54b190e
	.xword	0xaba7a505966a3653
	.xword	0x9e5664a390438080
	.xword	0xf512a75ac6c3322c
	.xword	0x1af635f5d4952368
	.xword	0xc2ca076c6d4c88b9
	.xword	0xf9b76f17e7b7ce74
	.xword	0x303c6cb25146fbab
	.xword	0x821fedce6b315ff3
	.xword	0x4a0375aec471596b
	.xword	0x72544bde89d6ed9d
	.xword	0x1870f5a203268f47
	.xword	0x6b8535c1f57c235d
	.xword	0x49a7193fd1703b48
	.xword	0x3d946b7da4790266
	.xword	0x4d7aa43941fea7c6
	.xword	0xfe753ace1c4d31ce
	.xword	0x86fcd06e46d90505
	.xword	0xd2c9efa9fbab80d1
	.xword	0x9d7f4cfea48d33ff
	.xword	0x863ded0d7c7dfa96
	.xword	0xd2334a71e7deddcf
	.xword	0xf3f50f09a5903e49
	.xword	0x12bd3e9283bab07e
	.xword	0x0eb820ac5cf20205
	.xword	0x993742673d7afce4
	.xword	0xf7d986a70486edf7
	.xword	0x6eeaba61b002c374
	.xword	0xd012844f4eb8954f
	.xword	0xe67728c9a35c56f4
	.xword	0x82f054a649806c1f
	.xword	0xf45623504c23a55f
	.xword	0x566975e69590f1f9
	.xword	0x11ade7ff0a5e507b
	.xword	0x26d616d981888604
	.xword	0xfa11b0f1be62ce17
	.xword	0xa96e912ff420a9e3
	.xword	0x3a4bbb2da1d890f3
	.xword	0x6796e3178363797b
	.xword	0x9b118ddcc7000647
	.xword	0x03107aea0e10ed2e
	.xword	0x32e9548343e82cef
	.xword	0x77f0ac109964a7d8
	.xword	0xfc04e7db29dede4b
	.xword	0xe9822463c4bbc894
	.xword	0xc15e73c9926ef502
	.xword	0x9cb12bde3f921451
	.xword	0xe6c8b93e70d45319
	.xword	0x78952a2059524262
	.xword	0xded0b577f6444426
	.xword	0x5ae007c636937411
	.xword	0xfafed80382dd482d
	.xword	0xf55dddfb875075f9
	.xword	0xdd8b4cd6f3173208
	.xword	0xece935cf27486843
	.xword	0xf40c159b77a2e0ef
	.xword	0x2045fd9bd9d4fee1
	.xword	0xe8defc8be872a23a
	.xword	0xaedec597c33132bd
	.xword	0x2e470644573d503e
	.xword	0x0ddb25242e879813
	.xword	0x5bf61f4c065e8a25
	.xword	0x9bedde24aae4f9ef



SECTION .ISEG_10 DATA_VA = 0x00000000a0100000
attr_data {
	Name	 = .ISEG_10,
	RA	 = 0x00000000a0100000,
	PA	 = ra2pa(0x00000000a0100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x57eeb2d1d3e0cff5
	.xword	0xc81e7b90cf006532
	.xword	0x86a5c71462abe753
	.xword	0xa6d81012dfec8135
	.xword	0x0cadc4cb3467495f
	.xword	0x8b373dbafcc742d4
	.xword	0x304765037148a716
	.xword	0x44f6814a57a23e80
	.xword	0x7102019c34d8dd73
	.xword	0x8cd6ab0645d3f871
	.xword	0xdde15f13b4d7eef0
	.xword	0xed40abe31249748f
	.xword	0xa212ec52642b0d2f
	.xword	0xfda566de36b15474
	.xword	0xbe7702f97634a414
	.xword	0x3d2a7b126201f100
	.xword	0x2a73594ae2efccf7
	.xword	0x14a5d5de4e3a41e5
	.xword	0x3ab06abdd8e03c75
	.xword	0x6c27fb707823950b
	.xword	0xec328fea4ea09d07
	.xword	0xb0009bb53bbc78f9
	.xword	0xe721bd06fa3da042
	.xword	0x4cf4196a255cfdb0
	.xword	0x7519545c85b81d17
	.xword	0xe50c50475503c44d
	.xword	0x583da0c53f481ef4
	.xword	0x1828c3d2057fc965
	.xword	0x73e0ea3635cde5db
	.xword	0xee8e83f5fcecdde2
	.xword	0xe457fb757fee4c3c
	.xword	0xea5ec6666b403bca
	.xword	0xb52121b71d5dbe2c
	.xword	0x8b5930464ac3dee6
	.xword	0x3c48f6c0f4552545
	.xword	0xba79a92d039b33f9
	.xword	0x2c166453ad2f64c6
	.xword	0x3e9d7c968fc76a26
	.xword	0xf0675ecef5242999
	.xword	0xba2765947997be14
	.xword	0x4ca47d2d40c014c4
	.xword	0x619679530ee57814
	.xword	0xdd1f2cf687b630d5
	.xword	0x8ac5d4c19ff0d95d
	.xword	0x45a0075e868e142f
	.xword	0x881920f4718bb1a4
	.xword	0xcec1ae819477f2ae
	.xword	0x55c06bee3174469c
	.xword	0xa704e0a283412b44
	.xword	0xc41a0e3db74f2307
	.xword	0x63e3706fa4508b9e
	.xword	0x1c191124dadf4dc1
	.xword	0x1d1cb83da8d71bdf
	.xword	0x0ed5ef4a1e9b369d
	.xword	0x28579d9a56b8088e
	.xword	0xed241d4d11a925b6
	.xword	0x8e42f1c1723f4993
	.xword	0xbe88976739203ca9
	.xword	0x3beb771bd7eb5706
	.xword	0xea2fd8b7416faca1
	.xword	0xb6835a35555c35b3
	.xword	0x03feb09f5af77040
	.xword	0x93d05ec914ff1253
	.xword	0xd99b4780b41fc610
	.xword	0xb0931ba3a784c58f
	.xword	0x6c237c07c1a82e67
	.xword	0x0e17d0b2f5457223
	.xword	0x0d52656d6083550b
	.xword	0x98750f046db6d5f2
	.xword	0x730da610862e021c
	.xword	0x4f9b6a2456cba74c
	.xword	0xc7330ec1b64a2a06
	.xword	0xe11138184a92670c
	.xword	0x005f07ed4fadb43f
	.xword	0x94a2e6b2b975fac4
	.xword	0x29f2a7880f94c3ad
	.xword	0xb341983d2f129695
	.xword	0x65bab768ea6f2ef0
	.xword	0x5f1d3b59710d0fad
	.xword	0xed8bc5195972e398
	.xword	0x890ec35a62af11f6
	.xword	0xd0a32bb05ce9b692
	.xword	0xd8adbafa62f17051
	.xword	0x7e0ed377bae658bd
	.xword	0xa8b213c60ac8ebf6
	.xword	0x129db64b7e98be27
	.xword	0x45d027de35c66236
	.xword	0x63edc7ce2c3d7d01
	.xword	0xccee9207fb4022c5
	.xword	0x1f1136a5e6d02cae
	.xword	0x7461c5b65c591084
	.xword	0x28fe60b65600e743
	.xword	0x2bbb7f8347d83987
	.xword	0xd55d799327a7bcf1
	.xword	0x1035f97e5226aa41
	.xword	0x6aea22d125ef899f
	.xword	0xbd4a64e1c4690f7b
	.xword	0x1196caf51a994f54
	.xword	0x9d6d2ad64d690941
	.xword	0x03dfcb854aaccf73
	.xword	0xf481e829d4943727
	.xword	0xc557363759f458c4
	.xword	0xb54d74cb53364393
	.xword	0x56faca3fbfc03171
	.xword	0xe769bc07c43a8061
	.xword	0x9a9417a4c1115479
	.xword	0xa7852ccff461df9e
	.xword	0xe2bc59957366d635
	.xword	0x601ff2c112825b21
	.xword	0xc4d9b25422b8a497
	.xword	0xf977f8213c82c2d9
	.xword	0xb961c475282954dc
	.xword	0x4ccf8ccb23cf5b97
	.xword	0x058d222054e8a3ac
	.xword	0xbce0f26a6a74e4e7
	.xword	0x1e8c1fce980d6844
	.xword	0xf42eb2f74012743c
	.xword	0x8ace353fcc62b40f
	.xword	0x6982acd84a746e6a
	.xword	0x4673f36a04dc3a4e
	.xword	0x97a98475c5002d22
	.xword	0xc2e3201adc1b7471
	.xword	0x33296431b4938029
	.xword	0x50cdd60dd5c2b12c
	.xword	0xe47abb928b9c4bfc
	.xword	0x2e4ac5e8af8630e8
	.xword	0xc0d1a4a1753e56c8
	.xword	0xe2b1af12d9e988f5
	.xword	0x4d2f8baf3cdf3428
	.xword	0xc282d1022a4ab636
	.xword	0xed654b01e5339e79
	.xword	0x0b9a68ce82e9589e
	.xword	0xf8070735d53875ca
	.xword	0x34d9879dfb6754c5
	.xword	0xd8a261371ab6557e
	.xword	0x32bfd6da43538df2
	.xword	0xec5fc0729a08a5a3
	.xword	0x718ea4834bf8f59c
	.xword	0xa41e8b4e1016348f
	.xword	0xc4441984a6dd432b
	.xword	0xb7aa09aeb4898657
	.xword	0x7c773422ec6491a6
	.xword	0xcf0a5dabf6e418e4
	.xword	0xf10dccb6083a2b69
	.xword	0xc9b86ee2b3e6462c
	.xword	0xcfccedd524eb002c
	.xword	0xfc1e875da160623f
	.xword	0x00c490b6e5c2f697
	.xword	0xae2d60fbbf52046d
	.xword	0x7e45b7dc8274691c
	.xword	0x8b5dce9863150991
	.xword	0x12dd02800f644c06
	.xword	0x5cfad551ba6c3922
	.xword	0xac5124236f1c9fe1
	.xword	0xe2d3ae63120eb474
	.xword	0x18b46aa628b17fa8
	.xword	0xfc31a38211e007a9
	.xword	0x0158f4de373b6de5
	.xword	0x36e6d3c72505d898
	.xword	0x6333210ade9a334e
	.xword	0xd851e321a96e5cca
	.xword	0xb8a99b847c492166
	.xword	0x5520356a6b8fa8d3
	.xword	0xcb2a3d086c8ceb36
	.xword	0x03c0bc5de44d2fc0
	.xword	0x675bf6736da4db31
	.xword	0x896929edb1a2f70a
	.xword	0xb3bc8900e299ae04
	.xword	0x92cb0ca75ca90625
	.xword	0xfec5d82685139dd9
	.xword	0x1936330c12e0e495
	.xword	0x1ba0d452bdc6b14a
	.xword	0x011dcab544495d5a
	.xword	0xc6e0b5ca1ca4903a
	.xword	0x2cfe332222c88971
	.xword	0x946c77da8f950d4f
	.xword	0xcd6267640aea596a
	.xword	0x0b70900c007a988a
	.xword	0x14c2dead6a933a3a
	.xword	0x80688eb72f454c92
	.xword	0x867616167ee32bf9
	.xword	0xfd753ad484ee4db9
	.xword	0xfd7bfca82899c88b
	.xword	0xed236911d0e8017e
	.xword	0xa500985f6e59922c
	.xword	0xf1121ad87604786d
	.xword	0xfb2fb249aed64aab
	.xword	0x80fdd3eb5c50faf7
	.xword	0xfcf6181e4a75433c
	.xword	0xc7613a516c602105
	.xword	0xc81227beea049ffb
	.xword	0xe3da07955b1c8fa8
	.xword	0x0201477bf8fa479d
	.xword	0xe7c4f5ee87e5e961
	.xword	0x8df2222f48441b7d
	.xword	0x87195301e03d7d32
	.xword	0x53ee22accd2f2ffd
	.xword	0x895fc784f46d2462
	.xword	0xb27dd6e0b2e90d4d
	.xword	0x3c767f30f98e7ae3
	.xword	0x909723e97f53f884
	.xword	0x6d4a10a67548059f
	.xword	0xb744a5f51d1aaffd
	.xword	0xc2764f20b0530eaa
	.xword	0x2347419d3b871ac8
	.xword	0x2358fe140c00d35e
	.xword	0x3df272c70882c34a
	.xword	0xa938678786bbe8b1
	.xword	0xc6b12cb16038c95f
	.xword	0x9313eedcab394410
	.xword	0x56594cf7750fcbd5
	.xword	0x20f6fecbb72fffb0
	.xword	0x8d20b5a968091e8f
	.xword	0xc0d95c0b49665312
	.xword	0xa151da9a62499e4d
	.xword	0xfc85e348ca1ea0d9
	.xword	0x575f266578ca1803
	.xword	0x0f2ec1b2b9991dd9
	.xword	0x43b620daca5d30b1
	.xword	0xbcd791159c69f7dd
	.xword	0x487254c3498ff295
	.xword	0xa44030e7df1e9f69
	.xword	0xb8c0a0fc2a1e596c
	.xword	0xe737db6b7258bcbb
	.xword	0x8dbd1ab5e60fc335
	.xword	0x2dbb60f8675d8ee8
	.xword	0x39079aa61a216a23
	.xword	0xf55c5fedb728dd80
	.xword	0x948a15700e6c10ed
	.xword	0x7ede41866a0e9311
	.xword	0x9932d19691283261
	.xword	0x218d45916105c2b4
	.xword	0x77427cece776f7cf
	.xword	0xe9e808f77c3fcc2d
	.xword	0xcc115e9101974384
	.xword	0x2b35cfdbffb21bae
	.xword	0xcf3fab34b92f5551
	.xword	0x98e1a294010de066
	.xword	0x3ecb5efb084627cd
	.xword	0x15de1326d0687c90
	.xword	0xe91480481acc99b6
	.xword	0xac889813421cb79f
	.xword	0x18789099f5b413de
	.xword	0x24d72db2c2fd07fa
	.xword	0x8b990f4362274407
	.xword	0x4c63ef5c46447d57
	.xword	0x042dcbf54808615f
	.xword	0x2844c6d573334c60
	.xword	0x3473f50c45499787
	.xword	0x3d442716f1328270
	.xword	0x8255b0ff94b9f8cf
	.xword	0xabc4994095270327
	.xword	0x3c4deb7ed84f7126
	.xword	0x506038346359e3f0
	.xword	0x6e7684fc14cc7a8e
	.xword	0x7ec7db78798c28a5



SECTION .ISEG_11 DATA_VA = 0x00000000b0100000
attr_data {
	Name	 = .ISEG_11,
	RA	 = 0x00000000b0100000,
	PA	 = ra2pa(0x00000000b0100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x2c79f3d0749b4f43
	.xword	0xe996d5520f64d0d7
	.xword	0x50e992baef2715a3
	.xword	0x9f486f277ab4d3cd
	.xword	0xa59cfa69dc2f21f7
	.xword	0x721300f8ad039cd0
	.xword	0x5f8f2ceef5f43a57
	.xword	0x186502e4338f562d
	.xword	0xa18401347b566aab
	.xword	0x3ecf4d9bf08bd8c6
	.xword	0x3c636aae9b2c5c98
	.xword	0x19503193bc302e2c
	.xword	0xd457ed22d28cc45c
	.xword	0x933668eeafa736e1
	.xword	0x9aafde5eb47592c4
	.xword	0x20c321c4f2038415
	.xword	0x1b4247e5785a5583
	.xword	0x0b2481b8379273bd
	.xword	0xd394f44fdd02ce9d
	.xword	0x5386ddcea5c9de5e
	.xword	0x2bff266bb45b8380
	.xword	0x41b6119d49ebaf60
	.xword	0xda44cd6e704d7529
	.xword	0x226a0dcea1e28fa1
	.xword	0xd8695293ec358a08
	.xword	0xfa4423d9481972fc
	.xword	0xa8db5ed02213d9a1
	.xword	0xf4ff8c63b2e3dbe5
	.xword	0x9c5f321adae80ab8
	.xword	0x71159cb99a58a6ca
	.xword	0x9f744e5aa817eb4a
	.xword	0xced388333405f4c2
	.xword	0xff96e18ce3627ee5
	.xword	0x822c15f99f7f9b2a
	.xword	0xec25130b6a10ed16
	.xword	0x7b4228b2418b2f61
	.xword	0x1400a0b378991ff9
	.xword	0xbcd53792a1751995
	.xword	0x8d47d8ffdd2576d7
	.xword	0xc1269800587a0d74
	.xword	0x25ae6d4d3155b087
	.xword	0xea41d1148d8a0194
	.xword	0x7fe72b1ba59f3b09
	.xword	0xc00ea659c40b6346
	.xword	0xe7286542ce08088b
	.xword	0xf2186acfd95c5628
	.xword	0x90d00ca393d17b42
	.xword	0xf8260a496b95ce7d
	.xword	0x13b30f56c2add088
	.xword	0xe695e767529ae865
	.xword	0x889ed5f3b6a144ab
	.xword	0x0570b476933f8d9f
	.xword	0x53369e08839f82fd
	.xword	0x117a5f48a1e7a74f
	.xword	0x04c2aed7f21e260d
	.xword	0x3e150625b8a1be49
	.xword	0xf224494b4a479127
	.xword	0x6ca6dbfb01d98f51
	.xword	0xb7f1d3e137694b0f
	.xword	0x70a06e454911e163
	.xword	0x7043c78e061dd577
	.xword	0x78475656030e594b
	.xword	0x92b6ed34bdb2f58f
	.xword	0xe1c0cc42b15af6ee
	.xword	0xa3c0e90fa85613ce
	.xword	0xbde27d7e03a0f703
	.xword	0x0a6cd0a488b3dc59
	.xword	0xfda02af0f79b0fcb
	.xword	0x5c7128b15beb101a
	.xword	0xab44e5ab7c2145e0
	.xword	0x87f8ffe731630fef
	.xword	0x97c026132d296241
	.xword	0x0c46bcd1151e5d38
	.xword	0x87cac2976cb22950
	.xword	0x1359427bd698eb5d
	.xword	0x3b0f8f95dccee1cd
	.xword	0xcaa2b5128d356edb
	.xword	0xe973528635660c2b
	.xword	0xa06bb921971a8b6a
	.xword	0x1af359213c634046
	.xword	0xceb3081cd9366e48
	.xword	0x8b71bd9ba302f5d9
	.xword	0xebfedb59f6ec05d7
	.xword	0xbde39ab62cdab7e8
	.xword	0x79350404bc6a852e
	.xword	0xe68a640efd340c8c
	.xword	0x22d922dd62709fba
	.xword	0xc8197abd3784eda7
	.xword	0x8120f9594dfdadd7
	.xword	0xd646404f169e07bc
	.xword	0x67cdc6d83021d8ab
	.xword	0x9744fce68cc080d6
	.xword	0xec936be56522b012
	.xword	0xca9d2633f87da7f8
	.xword	0x016d1353e89b67ea
	.xword	0x0a63f09c1e30d623
	.xword	0xbe8a47fb11fc0d83
	.xword	0x25ad2ce0c3764a19
	.xword	0x9c8e3ddd5b7946b1
	.xword	0xa983affcd236a9a5
	.xword	0x45b0d91d338b87cc
	.xword	0x9c776515fdb43a89
	.xword	0xa60b071f29ccfdf2
	.xword	0x640ac549767769ec
	.xword	0x1b7bb16e67923900
	.xword	0x29dd56885e724a91
	.xword	0xeae6beed2eff3c4a
	.xword	0xbc955391acfdaf01
	.xword	0x2ffb7b792194388b
	.xword	0x9f45535130f458f8
	.xword	0x668e9d742272f5fa
	.xword	0x1cc8a2eeb24db440
	.xword	0x4eea914671b190fb
	.xword	0x2cc2debee059deb0
	.xword	0x6ca97b1df52777b2
	.xword	0x579696c776d0b772
	.xword	0x7a3fb8b5c02724c1
	.xword	0xbc0e00bb48bdce0b
	.xword	0xd2dbf25f53c6d2e7
	.xword	0x379ac8d2269efdf8
	.xword	0xe5841c6b4bc41771
	.xword	0x5d4a8eb0493ecb87
	.xword	0x6bf14b86194e3032
	.xword	0xd8cccb77c20cdc8f
	.xword	0xa7c947ed61887e0b
	.xword	0xc80a616806339116
	.xword	0x46e7d74e442aa801
	.xword	0x865ab7c61fd9e017
	.xword	0xb0a80332ac33b4e6
	.xword	0xb4d3a520a377f396
	.xword	0xe6d19f99e99a85ae
	.xword	0x8939c75050f896eb
	.xword	0x714174a77458dbb1
	.xword	0x3f0729de905835f8
	.xword	0xb5e00b21de2dd840
	.xword	0xa53e580c1b0ccff9
	.xword	0xdd0860b02e7ec83a
	.xword	0x263943aed60551ea
	.xword	0x94497210d78f86d3
	.xword	0x9031d966317b7e71
	.xword	0x0a45bc1f36698891
	.xword	0x64c7efec245bb1e8
	.xword	0xa5e7a45d28886b69
	.xword	0xa8f17a4df875ac0d
	.xword	0x75c513e252d14038
	.xword	0x2af54c409c53a5bf
	.xword	0x69d6e7f7e77e4869
	.xword	0x77eaba6ccb430919
	.xword	0x0c77eab976aa53b6
	.xword	0xa50789209c56a0fb
	.xword	0x20e200e61282a083
	.xword	0x3e538452895a48b8
	.xword	0xaac4060d3c255f93
	.xword	0x74b4e406430a4348
	.xword	0x83b3c922f9a93bac
	.xword	0x08084245793f179a
	.xword	0x554305d0246a8173
	.xword	0xc3fca677a8062bbe
	.xword	0xd960b74a92bbbf1b
	.xword	0xf3aa5d24efd3b63e
	.xword	0x5e06c22b81329459
	.xword	0x6eaa6070b6c2e337
	.xword	0x1413942ec09b783c
	.xword	0x1dc302d4f837d941
	.xword	0x7d2a7ec4f648b037
	.xword	0x15bf2073d63dec32
	.xword	0x8e87a4842e9e47f3
	.xword	0x84cbd26fd78e379b
	.xword	0x135124c63b520649
	.xword	0x67031b3a9aae928a
	.xword	0x91b2cd8c4a24729b
	.xword	0x24af02b04f50ccd4
	.xword	0xf7d9df1f8cd7c782
	.xword	0xeb0adbcff7d57e2b
	.xword	0x1f6532e7d466c6fc
	.xword	0x6903c326e0de8f3a
	.xword	0xec8fa4694bc12a59
	.xword	0xd124fad10eb90e84
	.xword	0xc8a1f890ca5cdbab
	.xword	0x8730a515f526aff1
	.xword	0x48627ac3ddf0f222
	.xword	0xe552a4cdbe2f497c
	.xword	0x9179fb160cd438dc
	.xword	0xddd4b49f0a9febae
	.xword	0xd8c921837d3508f6
	.xword	0x03255ab0ef85aa60
	.xword	0xc4c9274a8d17745d
	.xword	0x125a864a2caacda1
	.xword	0x2e2a0d74e25bd61d
	.xword	0x431c873885d93b35
	.xword	0x2a05cfb709ac3c1b
	.xword	0x6d8197c14cc06f7c
	.xword	0xe012291d09254ced
	.xword	0xdd8a9ad5a13291a8
	.xword	0x3eaca7502f9d36b9
	.xword	0x0e27338443ec3646
	.xword	0xbec58cd406209074
	.xword	0x045d5ebab1c24f63
	.xword	0xdb673282cb13d5fd
	.xword	0xc2aa51e913c7f2e7
	.xword	0xc9058f09f506972f
	.xword	0xbcc8d54885c1eadd
	.xword	0x36add233920b0ec6
	.xword	0x137c29bc5baaa98d
	.xword	0x3feef6af5e76513e
	.xword	0x5dc9b23f0517b83f
	.xword	0x142d5a9c36ded769
	.xword	0x99b430e53939fdb2
	.xword	0x04f682ab48663e25
	.xword	0x8c04e3e6789a97d7
	.xword	0x8e0f17590475582f
	.xword	0x3726a0d2fa2ca6aa
	.xword	0x0689c7e488995a2a
	.xword	0x3aa272b84ef102d8
	.xword	0x3b338d6ff78ba814
	.xword	0x9142e544b96354ad
	.xword	0x5cd19d544a3ecd0f
	.xword	0x80ed48ff9928fa66
	.xword	0xa5ba6c744e261427
	.xword	0x2fd716bb52d35e8b
	.xword	0xa78dca0177ab2098
	.xword	0x1414cd565b290a12
	.xword	0xa6466995f04ed379
	.xword	0xe40fe12535dc2d78
	.xword	0x2e401aea51c3e15a
	.xword	0xa09ff5c3eb4f392c
	.xword	0x292a5287278017ee
	.xword	0xea69952dcd9a3041
	.xword	0x11a91a4a2530462b
	.xword	0x41e6444d918dae7d
	.xword	0xa53d1b38d8145f9a
	.xword	0xb7e4634fbb23eb0b
	.xword	0x745be94ebbf8b484
	.xword	0x1c2c67bcd95b1d2f
	.xword	0x7f2806ddfb4e6d21
	.xword	0x11b7942d7f3a5cdb
	.xword	0x9fa277b7d03a4ad6
	.xword	0x3bf807afa28d2379
	.xword	0x534fa79ab289b9f0
	.xword	0xfa573a2c84b71fa4
	.xword	0x587da712613d0bdc
	.xword	0x339e02da71f419f6
	.xword	0x5425144a7d175379
	.xword	0xd10a2e9311be1bc7
	.xword	0xaffc4f1661d15cbd
	.xword	0x862ff74638f34a32
	.xword	0x0bde109409b8074b
	.xword	0x875094133891ce10
	.xword	0x93539ea7ff4474b5
	.xword	0xc418d9eabc9ce755
	.xword	0x031da760da69f3ce
	.xword	0x4436778663a9669d
	.xword	0x8c112f4700a96831
	.xword	0x5ca1ee455eaf3bb9
	.xword	0xbd1d4881bc264f80
	.xword	0xc6a51827d5ad1a9a



SECTION .ISEG_12 DATA_VA = 0x00000000c0100000
attr_data {
	Name	 = .ISEG_12,
	RA	 = 0x00000000c0100000,
	PA	 = ra2pa(0x00000000c0100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x4b8df99d8e268b64
	.xword	0xff10121cb14b906b
	.xword	0x38f4ab41fd551675
	.xword	0x5530761bf395909d
	.xword	0x03538486f3cba2bd
	.xword	0xb0a8525d018d46e8
	.xword	0x28e53e9818cfb244
	.xword	0xa0f6c6d0c905b63b
	.xword	0x11864a82203486ad
	.xword	0x1ff2e4a5adb36dc5
	.xword	0x421596bb9f0111ac
	.xword	0x35675ffe4da3d7b1
	.xword	0x273f5027349b228f
	.xword	0x5570679d64679b7e
	.xword	0xc344f4d18a2c5f56
	.xword	0x026f7a50c87a59d1
	.xword	0x5235e0b55d798d04
	.xword	0x072bbd3e083a4e86
	.xword	0x6992933f23e47288
	.xword	0x9d5e7634f324d1f1
	.xword	0x7e5171df101dd731
	.xword	0xbf120cde073e2001
	.xword	0x112bc58f4419cfaa
	.xword	0x376e9ddc894e572c
	.xword	0xaca1266edf8e33d2
	.xword	0x80c84b2bcb9b9a46
	.xword	0x5c78673733cd3af9
	.xword	0xba313fd3e284c49d
	.xword	0xedfcc70ae2b1fbaa
	.xword	0xa10e486d83b2f3a4
	.xword	0x916ca603883f9e95
	.xword	0xbc9438cf2835ec83
	.xword	0xf81b555ceec8e5b5
	.xword	0xd84a182decae4cce
	.xword	0x3c60a854a11c5e99
	.xword	0x3c7a4f5d9e35818c
	.xword	0xead58d578426a83d
	.xword	0x0b6aa38f1ed48aba
	.xword	0x16a9eaf08fa93e12
	.xword	0xbf3353820bfcbb0e
	.xword	0x9a0d3f88303408f8
	.xword	0x66fc70ae8e65c987
	.xword	0x65a1d87516e54fe2
	.xword	0x5122f6b847bcfd7b
	.xword	0xb7ba15dc4368fb24
	.xword	0xe2eb7c73fe5bd4a1
	.xword	0xc3b5889b0e55fe27
	.xword	0x935f45690941cf2b
	.xword	0x1c76d233fd76f507
	.xword	0x36cb7fd489cadfe1
	.xword	0xf5bf473461cbd1fe
	.xword	0xa6ea4e4e810d5e8b
	.xword	0xd4facd47a5ac8ea1
	.xword	0x398d658b13aff413
	.xword	0x8347bf053098258f
	.xword	0xec11a642d63c70cf
	.xword	0x685fd7656b4a0ee4
	.xword	0xe959c16cf4e22cf3
	.xword	0xc48c71d3d65fe8e6
	.xword	0xd1dd1b320936db3d
	.xword	0x92eb199fc40847ad
	.xword	0x32679d1a2d33d14b
	.xword	0xfb6dfc4e21bb91e9
	.xword	0xeb7a58d4bb17d4bd
	.xword	0x4e8139623112d715
	.xword	0x0489b82a5ac693f1
	.xword	0x41851e0d509caa75
	.xword	0x15fa7dbfd33e981b
	.xword	0xcfe80be7db9db15a
	.xword	0x488206f39ab0237b
	.xword	0x7e58c16bb40fced0
	.xword	0x9376af5d1e930bca
	.xword	0xc79d09ac60d74669
	.xword	0x1ae631300baadb1d
	.xword	0xd83c8b9c6a8994ad
	.xword	0xb9d62bcd12b9a1a7
	.xword	0xd1963fa5cbd7e217
	.xword	0xa850c839e6061795
	.xword	0xa80784cb475eebeb
	.xword	0x2f28ffc566668314
	.xword	0x86a62920318fb4af
	.xword	0x63cb84d187d4d6ac
	.xword	0xd4cb2b27fcf421f9
	.xword	0x841680d05ffb7fa1
	.xword	0x934329611659d3cb
	.xword	0x34ac30d2470e461c
	.xword	0x8a566a006300e3f9
	.xword	0xacdd0459658cefd3
	.xword	0x0b093c8fd2e9e8d6
	.xword	0xc8922511db5b270d
	.xword	0x9b57e17a2b1f4c9f
	.xword	0xc9b8142f9eeb3fd3
	.xword	0x7ac2c77239819bf0
	.xword	0xaeee91345b08e0dd
	.xword	0xecb4e841cdaa0182
	.xword	0x3c3326747f4e98b7
	.xword	0xa3966bb5e9e97190
	.xword	0x0d0acb97e5095c6b
	.xword	0xfacaa2464cd89092
	.xword	0x6014662a15d91f4a
	.xword	0x14d8eb40e0cacf66
	.xword	0x854af20428276dc8
	.xword	0x7fcf08f667fa260c
	.xword	0x04197019cb59ef70
	.xword	0x7afff67904d8507f
	.xword	0x356172471665ba90
	.xword	0x9c52770e30f81363
	.xword	0x0c84e0a050b15c03
	.xword	0x8e3081218a0e67bf
	.xword	0xc9c9ab38fdf68421
	.xword	0xaaedfe2d8c1110f7
	.xword	0xbcd2c74daddda121
	.xword	0xe2000890e10cd66e
	.xword	0x5d136002024ad41d
	.xword	0x9cf2a3c5e7b00fb5
	.xword	0xf0511e93a4c70427
	.xword	0xa54ac94429c5d71a
	.xword	0x780f6bf1575bacc8
	.xword	0x1afee7a0d50bedf0
	.xword	0xedafc7a2af029ee4
	.xword	0xc2ec94e24a1d7d8d
	.xword	0x3f3d76aa59a388eb
	.xword	0x6810bfaddc750918
	.xword	0x88b1f2c952393d7f
	.xword	0x12d55f07f2040e13
	.xword	0x9ba10f7e45f27dfd
	.xword	0x2a69c2b1c8069652
	.xword	0x4245bbbefe7969b6
	.xword	0x9eb5f2793cb6189c
	.xword	0xf8d8dbf72145423f
	.xword	0x388f431823a57585
	.xword	0xebb2652b7593fd49
	.xword	0xcc17ef70fc1a7bcf
	.xword	0x7f20fa408918a936
	.xword	0xec63ee78357eba2f
	.xword	0x1c4f55306f8907c4
	.xword	0xfc88decf8a5d677f
	.xword	0xcd6b85063e1f7805
	.xword	0xedb21e6b1d4bdf4f
	.xword	0xb019333021a639ca
	.xword	0x685ae37abb7aeba8
	.xword	0xaffc69d708a542d5
	.xword	0xe145d789c20d13e8
	.xword	0xade1e2fc50df9369
	.xword	0x0d4e417497691efa
	.xword	0x9473d4731c73d434
	.xword	0x7edc9a8d29eb9018
	.xword	0x62cbd8b9dfa42415
	.xword	0xaf766ed156c6348e
	.xword	0x70003638c5b14277
	.xword	0xa7c751e12e520249
	.xword	0xa21a47a40ae13ac8
	.xword	0xa0e438383aed1364
	.xword	0xb2fe38d12701b763
	.xword	0xa168c28a39d1e168
	.xword	0x87e05524273f4730
	.xword	0xc8b2be7a5e0241bf
	.xword	0x6a8c2f2b8e809229
	.xword	0x5a4c932e6f9a2890
	.xword	0xa35b45b51cc3e415
	.xword	0x86868709dc0ef918
	.xword	0x42b2140bd4483dcc
	.xword	0x8e2e458a67321fb5
	.xword	0xd8cb57b8c5d63ec1
	.xword	0xb191025e49fbc8b7
	.xword	0x75720489e9eb480d
	.xword	0x51942cb229ead81b
	.xword	0xc4f2b204a2e29323
	.xword	0x9369b0cc00633d74
	.xword	0x06c1d90d8abbba0b
	.xword	0x012cc9457e9b678d
	.xword	0xeb78103abc18b016
	.xword	0x78320d570f4020ba
	.xword	0x16281b9fedab9138
	.xword	0x35097da85b47cc4c
	.xword	0x5b5d61d368245860
	.xword	0x09ae10f5c49608c3
	.xword	0x127a4b7f7036864b
	.xword	0x9ef08a1efe2a3f77
	.xword	0x284383f92ead58e8
	.xword	0xca661dcf1d857e67
	.xword	0xedadb6f7f2909f2b
	.xword	0x248447d8622cfdbe
	.xword	0xae7042a708861f1c
	.xword	0x49bfbc378baceb87
	.xword	0xa25e2bec64b03704
	.xword	0xf3928ad775a9f8ad
	.xword	0x75f08edc95b950b2
	.xword	0x302fea7780ca2fe6
	.xword	0xe55fd2619618389d
	.xword	0x420996dcad9aa7f7
	.xword	0x23b251968ab2e395
	.xword	0xa3e700036888804a
	.xword	0xcf6677927301f9b6
	.xword	0x588b1fdd06beafbc
	.xword	0x061c85c5c1e3c854
	.xword	0x45d7c34e7940c288
	.xword	0xc82b177731eac975
	.xword	0xc5b4fa86128a1a49
	.xword	0x662f452194693a3d
	.xword	0x1577ca3fd509aeee
	.xword	0x8e9e8b8e38b769f3
	.xword	0xa564444f08eeb2a8
	.xword	0x3d966c6f2ca350df
	.xword	0xb6cdd154dc4b3bf6
	.xword	0xd737f259e840fc05
	.xword	0x897bb3edb817c2b0
	.xword	0xfd8ca42474a3dba8
	.xword	0xfb384fafc5fdd281
	.xword	0x922cb37205bb41da
	.xword	0x86f18dfc68ec151e
	.xword	0xec950db587479e19
	.xword	0x52ed5c26f7f9c65e
	.xword	0x83ade24046bffc39
	.xword	0x81d4afef4f04e37a
	.xword	0x5e762c0dcea45e0c
	.xword	0x991c89d8536f3724
	.xword	0xb6b1aeed78961290
	.xword	0x6eb06b9f7da6eef9
	.xword	0xdff40751dca12f72
	.xword	0x4107a6fa9ef6acab
	.xword	0x20ed07a7695ad6ab
	.xword	0x435821e41caf3431
	.xword	0x42000e19a932c5da
	.xword	0x2f5a7cef5ac59de7
	.xword	0x9e2d5591acb7a993
	.xword	0xc0da4005931d685c
	.xword	0x0815fa832308641f
	.xword	0x29e749d2d0532a65
	.xword	0x9eff4e26b3e6fade
	.xword	0x6021bb9c578591d9
	.xword	0xb9d00a62d31ef5d2
	.xword	0x3c78d446dc32853e
	.xword	0x712de9675f72383f
	.xword	0x613bcecefb05759d
	.xword	0x8c9773b42f8ed5cd
	.xword	0x06df19cf9b489f2f
	.xword	0xb8a26f3f772cd4da
	.xword	0x3c4d04ef647beb94
	.xword	0xb842bd1d7545190f
	.xword	0x479bb286f5ed7e47
	.xword	0x1209722f52e4b7ec
	.xword	0xefec4571c4596717
	.xword	0xb761c9c2cc045df9
	.xword	0x51fa4ea6becb027c
	.xword	0x13a47273c46b2ebb
	.xword	0xf5c1d76b4f59eb28
	.xword	0x8d48da7d6b01fc28
	.xword	0x18727701665af1e1
	.xword	0xc2ce854ebeb9cd84
	.xword	0x04d67d8b04bf63ff
	.xword	0x07a655c8bfdb5647
	.xword	0x1439c1613778b9ae
	.xword	0x18543f160b280100
	.xword	0x9628787cc11b6679
	.xword	0xc0bb217f014ccd96



SECTION .ISEG_13 DATA_VA = 0x00000000d0100000
attr_data {
	Name	 = .ISEG_13,
	RA	 = 0x00000000d0100000,
	PA	 = ra2pa(0x00000000d0100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0xdf1f0002a727e776
	.xword	0x62081203affe116d
	.xword	0x18402b8f7f636b6b
	.xword	0xe8dd8b0a398364bd
	.xword	0xf51fa1b2453a8e4c
	.xword	0x3d728061b60fef7d
	.xword	0xab25b423ad0877f9
	.xword	0x1c59f7f37abfcc81
	.xword	0x8b9ce2fbaa76695b
	.xword	0xb630039f0d025d94
	.xword	0x48f35f34aef1cafb
	.xword	0x5be5da54161d4a2a
	.xword	0x3d1d77a706224bd0
	.xword	0x46d48c6875ff173f
	.xword	0xbeaa34cc7f5a7811
	.xword	0x32a8c6aede7bea07
	.xword	0xfff7167aa2c397d2
	.xword	0x2c2f743a3c4af4d4
	.xword	0x2d069e75f387d801
	.xword	0xf554ad0ba9da730b
	.xword	0x64b27c2f769ba590
	.xword	0x1c2c2eaa53ded8c1
	.xword	0xe5aa41fe9cd23139
	.xword	0x950f6a37026da111
	.xword	0xfa8736ffa6b0d586
	.xword	0xdfc8fd8640696bf6
	.xword	0x4af8e9bd4ba0c291
	.xword	0x99e83b4886c55dfc
	.xword	0x15abfb221e3b89db
	.xword	0xbd10a87ad8f0e282
	.xword	0xe9bb8a671c1bebdb
	.xword	0xa672dc0c21a5495d
	.xword	0x287069c7cd05f601
	.xword	0xa8e02c1c1557aaa1
	.xword	0x37f35248badfb6f9
	.xword	0x061027394ab9c61c
	.xword	0xd5191bd31d75ad90
	.xword	0xf433294836af0ad7
	.xword	0xc8972d87fd11b60d
	.xword	0xac5daa562f4754e7
	.xword	0x3bbca5bf0e9b0a03
	.xword	0x0a6975dbd5e347de
	.xword	0x0f2534ebf1380d87
	.xword	0x4d7e7b23b89e7e49
	.xword	0xe91ce6bd6882103d
	.xword	0xde6414c66d31db56
	.xword	0x247fa59c7c51f1f5
	.xword	0x354abbe244a00d70
	.xword	0xef4ecc9422c63800
	.xword	0x1e0dd60de0bd2d1e
	.xword	0xa9d62ef04b19d1d0
	.xword	0x0f39e0c3f91e8476
	.xword	0x028d1386c4fd4439
	.xword	0xb0b88fe3294a1eff
	.xword	0x7d4ec2df0dc2e078
	.xword	0x847da10dac1f5e6d
	.xword	0xb01fcfeb8971c897
	.xword	0xdf4237bb42001f27
	.xword	0xb42cbefe9c1a3c51
	.xword	0xe51a164332adb1aa
	.xword	0xbb14749a33bf58c6
	.xword	0x41c7790bb8d01554
	.xword	0xc78b88c98b0ceb6c
	.xword	0xc7ca6032d2f2512b
	.xword	0xc676f382bcc3f745
	.xword	0x3676060cac5524e6
	.xword	0x637058778b8d494a
	.xword	0x89dd718801eebb06
	.xword	0xa8caf9e615f576a3
	.xword	0x94dddb0a2fcf55ae
	.xword	0xb6905adefc6e98cd
	.xword	0x0bb1e20f3056d1d0
	.xword	0x191dea134e027bde
	.xword	0x0ae6095f3ea9bf07
	.xword	0xbd436aa2280099cc
	.xword	0x145ecf0977619558
	.xword	0x5a302a0f81e043ce
	.xword	0x995850ca2240279b
	.xword	0x2fe2020b9f85c79f
	.xword	0x97e1dd538d5a0389
	.xword	0x341992937a0afc2a
	.xword	0x5e9eb43bbb61a2f2
	.xword	0x757b3bf2bdf0f77f
	.xword	0x6393421f245a0861
	.xword	0xb983cabe59672e49
	.xword	0xc48b0019fc8e0bfd
	.xword	0x4daa9a2b6bfc27a5
	.xword	0xf4954c6479754b75
	.xword	0x2740d02487393f5d
	.xword	0x96490449ab1b4ed8
	.xword	0x67ddcd20b4343267
	.xword	0xd12eda6fbbb02dec
	.xword	0x6ceed53c949cdbe2
	.xword	0x9eada27df94abce6
	.xword	0x2d08659ceb58aab5
	.xword	0xdf6871e39dfc9d59
	.xword	0x596f3a471b6414ca
	.xword	0x8a01d8a9bb964516
	.xword	0x7ccf554872d8e221
	.xword	0x636dd1fcc94b0203
	.xword	0x2865595479e10ca2
	.xword	0x15294ae286a70b6c
	.xword	0xf4cfe13a884a6b89
	.xword	0x4cb21f72c0bcbb63
	.xword	0x5ffd14584dea7aec
	.xword	0x6e9598fe818d6ce0
	.xword	0x3be65400d3dec984
	.xword	0xcb2cca1a839f2cfe
	.xword	0x0857544b9f173830
	.xword	0x1df4a7a71e2510a2
	.xword	0xe680f788fbf014e8
	.xword	0xa042922f05fba42f
	.xword	0x38927a47e459b51c
	.xword	0xa0561a783d49d3c6
	.xword	0x069731034d565800
	.xword	0xaf643b21bc9c2bb8
	.xword	0x7dadc73d886c09d0
	.xword	0xdf0a6095db9fe07c
	.xword	0xff7c6a91387dcc84
	.xword	0x1867d6761b5103da
	.xword	0x8fb41c84e93fb229
	.xword	0xe705ca7000adb650
	.xword	0xa15aad7943446543
	.xword	0x78473998adbf8e32
	.xword	0xba5eeeef721ca86d
	.xword	0x1dca4c6f8cd48bba
	.xword	0x59a3451d843485a9
	.xword	0x683e141b9b71d9c3
	.xword	0x7a60f03d14ba4705
	.xword	0xe48b90dd6990bb7c
	.xword	0x12fdb86e172ca6aa
	.xword	0x5c028a937d79a755
	.xword	0x13d2fbaff4f589cc
	.xword	0x3cdd0ab6c0bb699f
	.xword	0x063186b8f1bc32b1
	.xword	0x725a61b556396427
	.xword	0xe13a0e3fcc3e61ba
	.xword	0x7e5c0a8054b03f62
	.xword	0x3bf4d76ec46c9f00
	.xword	0x7d7e50e5f38b7c79
	.xword	0xf1256cfb77df93c3
	.xword	0xfde8b1042f6cd86e
	.xword	0x3f260f3f7011c3e3
	.xword	0x495b8164ca90fac3
	.xword	0x1c6b3b22434a0868
	.xword	0x3b60e24a928c6573
	.xword	0x8ff7550ce597a682
	.xword	0x92575223fb15f71a
	.xword	0xef329957813d5d99
	.xword	0x75ded88ce7fe4c05
	.xword	0xab77cf778ff711e1
	.xword	0xc3eac4fe1d813661
	.xword	0x11c3cef71b2ca204
	.xword	0x49d3354b94a0b30d
	.xword	0x5bc108090ab37775
	.xword	0x5486804c5dfb72b2
	.xword	0xfedf497472c8c0e0
	.xword	0x7daf7150745cd404
	.xword	0xef75dce3cc4130d0
	.xword	0x1d802b70efa49a57
	.xword	0xdbd2317c85f9fd1a
	.xword	0xd193b2d90f8023da
	.xword	0x892716baf255fce1
	.xword	0x48b5a42c8ff2705c
	.xword	0xa56a0c0a431bd695
	.xword	0xa10f78e6e87d2dd0
	.xword	0x42c3f5ec69ebc555
	.xword	0xa8987e10beaa4eea
	.xword	0x13599bbadd1c5dfb
	.xword	0x8a63676b7f2e5cef
	.xword	0xe581374573a94bba
	.xword	0x71a83f3f68eddf66
	.xword	0x3226ca7c32c75118
	.xword	0xbee52867d9cdbe6c
	.xword	0x33887fa70169b9c2
	.xword	0x72886cc482c9c1ab
	.xword	0x912ec572b5965119
	.xword	0x8ed8330ad72c1ccf
	.xword	0x0c509a5e0699b711
	.xword	0xfda7e4546753b4c5
	.xword	0xc8e1e172f3d7416b
	.xword	0x868922da71ab7461
	.xword	0x77e846e0f611503b
	.xword	0x9919bed348bdc504
	.xword	0xce2fd65a97ab9e0f
	.xword	0x8f610bf5c7252e11
	.xword	0x08596a9726f444f7
	.xword	0xe256c06823d07a59
	.xword	0x0c34a2af62f71e97
	.xword	0xd7d68501ba0ddcad
	.xword	0x78e363360a7d89e6
	.xword	0x37937c438b5bb246
	.xword	0xf09da53603eaa1a7
	.xword	0x52851489b410d8ba
	.xword	0xafe908b06b24e143
	.xword	0xb401eafeb2d9475d
	.xword	0x86d9cd5d17209134
	.xword	0x99c97e69e8f0170a
	.xword	0x559be9e7a5f90d0d
	.xword	0xb325cac3b44cd706
	.xword	0x4d63be2c75097b46
	.xword	0x4444c29e54cf072e
	.xword	0x35379c9dc9d96084
	.xword	0xb0d3eae3471e49c8
	.xword	0xb8b72aa1b661ab36
	.xword	0x50dced12c9f4b5de
	.xword	0xf13b61f0bb5bd0d9
	.xword	0xce72a55c29d1c8e1
	.xword	0xd5e31b6adc2d83fa
	.xword	0x392293190f594801
	.xword	0xd4189723627a4ca4
	.xword	0x25953ddf7fbd5113
	.xword	0x9d3f3f5130ed5c01
	.xword	0xa2157decfc24345d
	.xword	0x47cf74e37a3da2ad
	.xword	0xdaddec5171c8ef3e
	.xword	0x832bb55bc2124792
	.xword	0x4c24e072ac2ccedf
	.xword	0x867cc33a409e32d4
	.xword	0x259578ec454ff9c0
	.xword	0xfdddc3a7193e1747
	.xword	0xa5df911d87f38ae3
	.xword	0x9311c05af12ee5f0
	.xword	0x0f229f3eec7d4cce
	.xword	0xf24a32390a20d378
	.xword	0xf7820e64684af490
	.xword	0xb0a4a1d165966f10
	.xword	0x3e2424fe6626bd0a
	.xword	0x9f59b148c2e80369
	.xword	0x1f3c394148e5996e
	.xword	0xd097a9c519ab53aa
	.xword	0xdad21dafb9cbee15
	.xword	0x48edd2d304fff117
	.xword	0x366209036ae0a7b5
	.xword	0x39822482fbb083d0
	.xword	0xa4e45330b0feb6bb
	.xword	0x5b79fed30ec913b2
	.xword	0x50e81a5a257f6014
	.xword	0x27263779bf80760a
	.xword	0x171ce12452d51058
	.xword	0x0cb2953798546fdf
	.xword	0xd6efffe003a27a95
	.xword	0x343c1c2fe7f336ac
	.xword	0x5c2ef66e0f9a7186
	.xword	0x589d7b19283429fe
	.xword	0x18965ccb44a4ade9
	.xword	0x484af4953221e27c
	.xword	0x874306191f340cc0
	.xword	0xd69473fe00ac813b
	.xword	0xe4c770e68cf7c81f
	.xword	0xa845607017482ea6
	.xword	0xa685ccba7389003b
	.xword	0xb07723b76bcbbf35
	.xword	0x4c8cfb8895e10c22
	.xword	0x4faf6586719b6f67
	.xword	0xa9b22fc464207746



SECTION .ISEG_14 DATA_VA = 0x00000000e0100000
attr_data {
	Name	 = .ISEG_14,
	RA	 = 0x00000000e0100000,
	PA	 = ra2pa(0x00000000e0100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0xab4b5f3b497654cb
	.xword	0xc5bbadefc665f005
	.xword	0x1ab35018291f5ee2
	.xword	0x1c9a2cf28c58a00c
	.xword	0x999a83132e672855
	.xword	0xedd757176862fffa
	.xword	0xca7dc076c773191d
	.xword	0x3e05c3f7f04ac230
	.xword	0x80f604e53f1e45f8
	.xword	0x5e193fc251ad4387
	.xword	0xf47e49697dad208b
	.xword	0xaf88fd7bdf87add7
	.xword	0x23630fe3e88bd6d3
	.xword	0xabd3d97ce99e832e
	.xword	0x529db362daa3cce3
	.xword	0xbd57e7b5e418a5b4
	.xword	0xf6d1d3325dd48d57
	.xword	0x9b5eb33bd4c4ea0e
	.xword	0xff60a52d08de9184
	.xword	0x448bf7b3b945c965
	.xword	0xee2b85efcfcdff80
	.xword	0xda6f4ac7f7879166
	.xword	0x0315b4c507af744e
	.xword	0x5ba35c72fff04a0c
	.xword	0xe7abd2e21fd2c5a4
	.xword	0xcc94286e565f8cd6
	.xword	0x72fe458b5af4a000
	.xword	0xf0deb3aade56dfbc
	.xword	0x149ae14fed30377d
	.xword	0xd7368ac318459a76
	.xword	0x4b6cb1117ff74811
	.xword	0xbf1c73390be9a59a
	.xword	0x24a5bb73a69b071c
	.xword	0xe073713df8c7c9ad
	.xword	0xe7d837020e738bb0
	.xword	0xd05c50f534334e03
	.xword	0xdd73b310419642ab
	.xword	0xc8807d02faa680de
	.xword	0x644a4583c22b3bab
	.xword	0x43c7fece0dd2f6c3
	.xword	0x154d2c880b9f016e
	.xword	0xc43823857f9a7c72
	.xword	0x098a67002cf53e57
	.xword	0xb7cba213e905786c
	.xword	0x8462e4dcf78fa0b5
	.xword	0xaf970f90b56832c8
	.xword	0x6d564591bb96b5ec
	.xword	0xbf321c0fc3144e07
	.xword	0xbe2d2dda8168a195
	.xword	0x0a16449569d41a85
	.xword	0xb1ea15df2c2c0c17
	.xword	0x6522316af5aaaefe
	.xword	0xf8421b273de72a5b
	.xword	0xfac7369be2e5a0c7
	.xword	0x6032b7fe6a786b70
	.xword	0x377d4b5daf0f4d55
	.xword	0xc6beecb57bec8ea7
	.xword	0x22d6d5b0a8f6a933
	.xword	0xa98b0744462e8656
	.xword	0x59fb3ee139f72854
	.xword	0x90d6ab0b4352321e
	.xword	0xe1d452ee7d776551
	.xword	0x4ddbab4b1e0a1745
	.xword	0x116a0905334833c8
	.xword	0x6d32226663006fc4
	.xword	0x3e856044e7186861
	.xword	0x879153bc99874299
	.xword	0x2d8037edf4a4b6cd
	.xword	0x9b81d31b4b07066e
	.xword	0x51e2ed3a8f00752b
	.xword	0xc78b548266520ac7
	.xword	0x6c702266c73c3e7d
	.xword	0xdefa47b263e8f227
	.xword	0x0129cab32714387d
	.xword	0x8fb78e96a7fc84f6
	.xword	0x82673d750aa008ce
	.xword	0xda9c13070d88c82b
	.xword	0x390922a9a25546fd
	.xword	0x1a76f93747dc452e
	.xword	0x69547444a1d62ddb
	.xword	0x7e69c97364943573
	.xword	0xfbad5328c25d3faa
	.xword	0xc4cdfa105d1a4167
	.xword	0x04e5402e3a74ba48
	.xword	0x795b8c8b4804a2d8
	.xword	0x3628cb9d51c00837
	.xword	0x0ba011a39bce469d
	.xword	0x67d7278dc32ae39c
	.xword	0xca886ee2e080f72b
	.xword	0xa967ab2f0c7ef740
	.xword	0x343f609461fc87a1
	.xword	0x2e70003a20f2f510
	.xword	0xdad4bf573851ca1e
	.xword	0xa6c0c0cb2cfe8b36
	.xword	0xb7281a6b70a55e6f
	.xword	0xa0c776b3da59567f
	.xword	0x7375eff1814abcd0
	.xword	0x7f6c6329881fe8cc
	.xword	0x81cb9c8ae8b7145f
	.xword	0xc7a0f59596e64a88
	.xword	0x34210ff53b5d2815
	.xword	0x91275eb36e9b49e8
	.xword	0x850e9cd207758ecd
	.xword	0x86674d1b7717e93b
	.xword	0x1ae3ea26d68a2a8e
	.xword	0xa8d5a0ebbf33c506
	.xword	0xddc240996f83ea1c
	.xword	0x8e30a771ef3ab140
	.xword	0x8d9bdfdcd9c5a645
	.xword	0x20ed19474b49e259
	.xword	0x7a1f92ff81c60e60
	.xword	0x1b1af12e1833175a
	.xword	0xb90ec33bb43c3540
	.xword	0x2591d181ae9a4ea0
	.xword	0xef8e006aeb118025
	.xword	0xb2fa54c5a93e43b8
	.xword	0xf98057fa019a0c2f
	.xword	0x3a192c185f43fcd5
	.xword	0x3013df73621d6f05
	.xword	0x71fdc74275178b68
	.xword	0xf754d0b0612d3ace
	.xword	0x46e6b58f5a4caabc
	.xword	0xdb988e292ed0c2d8
	.xword	0x1f84a30d285116f7
	.xword	0xcc50ec65612afe6d
	.xword	0xbe3a39827322736b
	.xword	0x6500b45fa1ed39b4
	.xword	0xe85e1140ad309808
	.xword	0x8182b33fda610c09
	.xword	0x80b710336bd957c6
	.xword	0xf1248a72cf491454
	.xword	0xa2b8656717ede274
	.xword	0xacc6dbcdc9ff189a
	.xword	0x8200b57d24e80a63
	.xword	0x75169dc55c5396c5
	.xword	0x1a33dae0cfac768a
	.xword	0xea4e8ee17c3c5ed1
	.xword	0xc2a7eb0063de1cfe
	.xword	0xe393ff428eb193ba
	.xword	0xaf2f3ed72aeb4064
	.xword	0x631739f2159183e4
	.xword	0x31dcbc4a89016157
	.xword	0xdbf47b8bf20c8257
	.xword	0x44fc14ede1f3c47d
	.xword	0x83a0f27d17535d35
	.xword	0x28f97684624271c9
	.xword	0x62b192ba8f434ffa
	.xword	0x72569bfa5ee50f67
	.xword	0x559d610c9df7b9aa
	.xword	0x50add0203279c2f1
	.xword	0xc68bbd34d658e4b9
	.xword	0x9e7845c7a7f739b8
	.xword	0x60dacf01a45f0293
	.xword	0xaa749bd05ff4dc18
	.xword	0x0b149bacc3b31647
	.xword	0xe8c6cf595b535249
	.xword	0x1b0b3406d6c26a69
	.xword	0xbf13f4661ee13270
	.xword	0xc404c9306da49540
	.xword	0x5916a75a1a656fa0
	.xword	0xf2e9c7e0b1ad0881
	.xword	0xefacf1861bef20d9
	.xword	0x3a94f53760e1577b
	.xword	0x1e3ab4b213a2ee80
	.xword	0x63adee222acc35a5
	.xword	0xd444af694ede1b59
	.xword	0xbc0aa2e3434f2081
	.xword	0xdb42c186abb513f1
	.xword	0x651786f7c55f6219
	.xword	0xf888772db31b0bdc
	.xword	0x3aed504560635e3c
	.xword	0x5bb15581c0774a95
	.xword	0x8be274218259146b
	.xword	0x70213790cfaf3d6a
	.xword	0x986dd388bd643bd1
	.xword	0xf83e32115a388e38
	.xword	0xbda426235a85dd6f
	.xword	0xf686c5dd0fb05679
	.xword	0x32815e3294e9c994
	.xword	0xd25ee108d325e8e3
	.xword	0xa9113211b84354a9
	.xword	0x075dc32b844a8da5
	.xword	0xa6144674a5d8f419
	.xword	0x3e85a199708c7c86
	.xword	0xd59f61c250ceef7f
	.xword	0x1df2d658c1fe136a
	.xword	0xfebc8e90b0e7a164
	.xword	0x3b1357f48ae48dd2
	.xword	0x604b36e58afaa8f0
	.xword	0xd36894e9f7541260
	.xword	0xe664c0ec2b18e6be
	.xword	0xa6da4a7483ae651b
	.xword	0xa2cec0eda55c458f
	.xword	0xa10f15877ef30f9c
	.xword	0xb8965e6b2edb1e5e
	.xword	0xb6a8a77265c4cab4
	.xword	0x74fbcc2f656e7e08
	.xword	0xa8aa6b0dbc6f6adb
	.xword	0xa9c3c6e52a3c6792
	.xword	0xfef2b8bd3e20844d
	.xword	0x0437a72049917390
	.xword	0xe47b5f5b26663de0
	.xword	0xd1a9bc5226c093f2
	.xword	0x9704c7e1a15a6276
	.xword	0xe851c96eb87b86ba
	.xword	0xf795181436a84e72
	.xword	0x65c127025714e13b
	.xword	0x9c35081d58210d35
	.xword	0x786eaf77d03377cc
	.xword	0xcfa659e8de3f03a8
	.xword	0xbd9f6447af912f5a
	.xword	0x195ae55887b793f1
	.xword	0xddd42914d6a20a7b
	.xword	0xc4f41130f9f4a395
	.xword	0xdfccd96f6c631ec5
	.xword	0x9e0a1ce1814cb301
	.xword	0x9b93608b8898a67c
	.xword	0x473455d1e2f7dfac
	.xword	0x9f07f36c95c9895f
	.xword	0x59e907af6ae9d64c
	.xword	0x58c365cd313d4c0c
	.xword	0x899835bc36d5069d
	.xword	0xdbbbab06e8d0dfe0
	.xword	0xd4f3321d1619759c
	.xword	0x4f4f437da5e936b0
	.xword	0x3f0328026e839af4
	.xword	0x55ad02a69cb8ed5a
	.xword	0x03a05ef8154391d4
	.xword	0x5a2fa91f40ec6fb4
	.xword	0x9ab218aa43ae7081
	.xword	0x651f1e63ee7f0173
	.xword	0x5077d7310ae769cc
	.xword	0xf1aac261715b5c39
	.xword	0xdc7e8cf307fdbebf
	.xword	0x30ef1b92266fa7c7
	.xword	0x727f2fbfa09ec0a2
	.xword	0xeaa01e4cb8a0f922
	.xword	0x9e14108019951647
	.xword	0x020fea1773883934
	.xword	0x72490462ebc0fae1
	.xword	0x7ffba656fb35f06f
	.xword	0xbb613d7f63b628e1
	.xword	0xbff86432dfc6001c
	.xword	0xb9972c9fe8ee7816
	.xword	0x9076111086aaba86
	.xword	0xea0e98d05bc69ffe
	.xword	0xcc60ecd700777eb6
	.xword	0xa728563f7c22424e
	.xword	0xfcf1e7f2aa54f560
	.xword	0x92ac07664fc1cf87
	.xword	0x36b896fe10fc9abb
	.xword	0xf2c561288cbc8856
	.xword	0x227dc479167851b5
	.xword	0x11c22b02a2c435a7
	.xword	0xd94996dd2e0fd93e
	.xword	0x68ef24832a4faa59



SECTION .ISEG_15 DATA_VA = 0x00000000f0100000
attr_data {
	Name	 = .ISEG_15,
	RA	 = 0x00000000f0100000,
	PA	 = ra2pa(0x00000000f0100000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
	.xword	0x07e6c68f914a9d4b
	.xword	0xcf72ff226be16495
	.xword	0x602ec61de1986a96
	.xword	0x9871424f354c8082
	.xword	0x2944ca519158c61b
	.xword	0xd20bd1298919f303
	.xword	0xe1333cf577f10b6b
	.xword	0xc400ab2e52f381fd
	.xword	0xf04044861b203c13
	.xword	0x3246f4b883d215b2
	.xword	0x0c6d1f863a351b40
	.xword	0x99c2a3fd9837144b
	.xword	0xd81d89a35234e804
	.xword	0x879c805220fa31e2
	.xword	0xec3df17e3c2d71eb
	.xword	0x4ea57c692e0d4b06
	.xword	0x404dffe7867a5f38
	.xword	0x9ea98b432cee9971
	.xword	0xbcc14b73877e09ea
	.xword	0xb6cffabb4035d963
	.xword	0x2c92cee25a7c24b3
	.xword	0x38c9619d06ce862a
	.xword	0x64acf57a9eb74ac2
	.xword	0x8519fc2e37c62731
	.xword	0x74ff1ac3703ff42a
	.xword	0x0a16303623519bfb
	.xword	0x7cc48c9982776a60
	.xword	0x0e581d50f8253914
	.xword	0xc473b18b1af9fe7e
	.xword	0xfb08a2bca35db2a0
	.xword	0xa4b550ec585b4aed
	.xword	0x48b4df41fbb9054a
	.xword	0xe6cc08baf58c4018
	.xword	0xdfbea5863ec8f6d8
	.xword	0x031a9f2fca8f022a
	.xword	0x95449d8dffa399f2
	.xword	0xf336d6ff2c9c447e
	.xword	0x844ccd0d7ee6b6ba
	.xword	0xa053eaceb1038416
	.xword	0xaca029c682f98724
	.xword	0x29820bfb5f76aa28
	.xword	0x7e07fe310d15d0c8
	.xword	0x2d0dcc8b5271ac67
	.xword	0x7d191fcf6b324674
	.xword	0xd377a18592b27700
	.xword	0x1114b6eaba86ec17
	.xword	0x721c0cc9d610d2ee
	.xword	0xf9c1364df6979aa3
	.xword	0xc78c0cb72d27cdde
	.xword	0x63649255d22cfb0b
	.xword	0x44fd578a9ccb2a69
	.xword	0xf036d854d201ffee
	.xword	0x659c3284007e760d
	.xword	0x67619911a2febb91
	.xword	0x46f4c169a8dc6575
	.xword	0x7b57a33270c1754d
	.xword	0x499d039f014ce97d
	.xword	0x1fe3d4160f3b1127
	.xword	0xb9e02ecb275bb2ae
	.xword	0x376953fcf2467b27
	.xword	0xc2cda906f9e42abc
	.xword	0x10b26a2c4c5a43c2
	.xword	0x658f55dd8a080757
	.xword	0x2fc0e7736fc0ace0
	.xword	0xbb1487e91cfa2602
	.xword	0xe720c64d6e7e0c9a
	.xword	0x1e007bd6df7f020a
	.xword	0x6a17231393d79c0a
	.xword	0x66fff6d5b94e8d22
	.xword	0x62b25649a2b28e3a
	.xword	0x8fa3aa01947104d8
	.xword	0x2dcc747765e37092
	.xword	0xd4fa6b7911f48a18
	.xword	0xa65fb3a4bc96c986
	.xword	0x55db32472e4a7ae2
	.xword	0x6aa41637d5c9e405
	.xword	0x7dae3b3e79226a5d
	.xword	0x82321dcf5af2aa6f
	.xword	0x6ec726fc6a6a422d
	.xword	0x68a976fa012829c3
	.xword	0xcdd70009bde7959d
	.xword	0x45ae4e542d5da617
	.xword	0x277078edb7cce704
	.xword	0x40b44ad8d158e4f5
	.xword	0xb9d8b09896655fc0
	.xword	0xda36f25b010fce1b
	.xword	0xfcebfb3f5c524aab
	.xword	0x71b8c05f72b078f9
	.xword	0xe78055256d2e15e0
	.xword	0xc10f832ac07e1783
	.xword	0xbfcc5e2d940d5f51
	.xword	0x56997c6de3c9c5b8
	.xword	0x9e56bcda1b3c9083
	.xword	0xee21a9fa4b26a8ac
	.xword	0x5ef54e7731ca6fff
	.xword	0x27de4491133f7bcf
	.xword	0x2186734daf75734a
	.xword	0x41e2441d41a3b2df
	.xword	0x86340d0bf25fd99e
	.xword	0x466b99e94d65b7a4
	.xword	0x6085b862fddba787
	.xword	0x49bfb38ea54936c7
	.xword	0x003306253acf920f
	.xword	0xac1c3528f571ed02
	.xword	0x1f3b631abf453adb
	.xword	0x97b4436d454b7a43
	.xword	0xe334dc3e6b64e62f
	.xword	0xfbaa60c3ae922671
	.xword	0xddad890614f8bffb
	.xword	0x7d160bf3b7aa4079
	.xword	0x82555e15fd6c1933
	.xword	0x3d14e94ba95ea30f
	.xword	0x6c60a8ac034bf6be
	.xword	0x0e9ea28d39a52c42
	.xword	0x1b75ab178d3e6426
	.xword	0x0babc51e3ac9655e
	.xword	0x31a762bc378ef6cc
	.xword	0x945c28486419d8e7
	.xword	0x6742144b49925230
	.xword	0xa45043b45d27e1b2
	.xword	0x9d08ae6eb34c4969
	.xword	0x72ff98fb0281a924
	.xword	0x338e3ca7c32bd51b
	.xword	0x7f33120fb4b732b5
	.xword	0x1e625916c180f7d6
	.xword	0xa4616d53517c992d
	.xword	0xcb7117fe9b650171
	.xword	0x5b5168d3b510ad00
	.xword	0x6193d0f0cfe5c54f
	.xword	0xef86cce8c83fd739
	.xword	0x98fbcdb9aea52b5a
	.xword	0x4bc77ed8cccac16d
	.xword	0xfa9572f740589311
	.xword	0x4fcf00924fba0c09
	.xword	0x900195e3be1d5cd5
	.xword	0x2b4c0ed7d77cc13b
	.xword	0x3a7d33578977df2d
	.xword	0xbf266d1f51034845
	.xword	0x34834d773241fc8d
	.xword	0xce7bdafc6df53698
	.xword	0x00c84628170974f1
	.xword	0xaa5cc8b14193674b
	.xword	0xadfea47e2d80b428
	.xword	0xca5c8bbc3fed83dd
	.xword	0xb7bbf7cf9dc2793a
	.xword	0x26bc766fddf27c5b
	.xword	0xc5fcb113e853549c
	.xword	0x03aba0ec6122b9ec
	.xword	0x5f65240d2ee1d754
	.xword	0x3c087cbc8b899750
	.xword	0x66d17ed633abb164
	.xword	0x3564398a83c58408
	.xword	0xdc31160b6e831cf8
	.xword	0xe56ca58c0b035598
	.xword	0x8fe37bf4605ae376
	.xword	0xb11ff093ae9741d1
	.xword	0xfbead8a5534777c1
	.xword	0x297a460f05f9d9fc
	.xword	0x3a1895da27a74299
	.xword	0xa4f2f02a73dd3d74
	.xword	0x9de2f5fcc6e1f7c1
	.xword	0x8601b43666d5c132
	.xword	0x841468a0ce2c4028
	.xword	0x67fe5d91f25bd494
	.xword	0x86c92152f7d3c8b0
	.xword	0x9b522afe6dbc977c
	.xword	0xde8c70fcebe91f3f
	.xword	0x7181594ef351b064
	.xword	0x416e9e6e355ccc32
	.xword	0x28993172be51192c
	.xword	0x2408e6a6420accfd
	.xword	0xd789c62d5c2a4d5d
	.xword	0xa2bb063f8af97893
	.xword	0xb196de31cb8b3d74
	.xword	0xaddcb7ad2242cd2c
	.xword	0xf8795a68f11270e4
	.xword	0x7be6f0f0fa98e3c5
	.xword	0x87e3c035d5bfaabd
	.xword	0x617756631fb5f8bd
	.xword	0x9d4156ce03abb8b1
	.xword	0x9e45cc447f4a8551
	.xword	0x7ef30d46049ed45b
	.xword	0x726e97a5d36a06cb
	.xword	0xdf938258fd3be971
	.xword	0x394967eb2dde461c
	.xword	0x262b58ea08425800
	.xword	0x5e2b9e03881e90b7
	.xword	0xbae7b3da48fcf60f
	.xword	0x4519e0a22a392910
	.xword	0x0f43bcbbc5d6f393
	.xword	0x2ee3fba2f0b31e5e
	.xword	0x0e17389f1bcf55b3
	.xword	0x7ea5bb5718a8d5cc
	.xword	0xb6d7c18c11878d87
	.xword	0xfed92aef1632bae2
	.xword	0x13a30050dd53182b
	.xword	0x5ba35a24c282348b
	.xword	0xc14644e4259e2eb5
	.xword	0xb0408dbed80b3ab5
	.xword	0xd5e7033c077862db
	.xword	0x1f66e3a8ee63b82e
	.xword	0xde77980d498298e9
	.xword	0xd51876231eefb417
	.xword	0xabe21bec96cd83b4
	.xword	0xffe74c2c2d3da385
	.xword	0xebcc9b5a92cee74a
	.xword	0x17e6fe05c81c3f70
	.xword	0xd973a74c543a3ffd
	.xword	0x30c700fbad8ff80e
	.xword	0xc6fc225d41c371a5
	.xword	0x74264c828f9f44fd
	.xword	0x36ba071f759e7e41
	.xword	0x345a43d4ef864a95
	.xword	0xb8dfb9b8cf334478
	.xword	0xe5b105b2532e7066
	.xword	0xd2a73db4fd38bb38
	.xword	0x6df24a2268b9343d
	.xword	0x09f6619ce9412dd1
	.xword	0x6624703ab0a993d3
	.xword	0xf4cad0bbee8c264f
	.xword	0x7ced43abd8476b30
	.xword	0x2df38b331b0a4d8d
	.xword	0x409505c95d2d3fbc
	.xword	0x8529ff873f46773a
	.xword	0x7537c5756fd235a2
	.xword	0xadf97fdac9d3e7df
	.xword	0xb1a58de2e5afee06
	.xword	0x106a8cb1e491e6b2
	.xword	0x5be437644f5a8c27
	.xword	0x28170a64c512c885
	.xword	0x343f14bcb91e208b
	.xword	0xd4571ae6585b5e86
	.xword	0xc29c62f2449ba540
	.xword	0xe2337354cf0c2a0f
	.xword	0xca8f513b75e7227f
	.xword	0xffc12d8bce497f96
	.xword	0x2effddf5044042d0
	.xword	0xff3c9e9a802167ac
	.xword	0xcaf3cac6e9993198
	.xword	0xe3a4d971104b39cb
	.xword	0xaacf055666cb99eb
	.xword	0x10cb1baf148244b5
	.xword	0x0187e9ede5889810
	.xword	0xef043c71fdaf37db
	.xword	0x518e0d1103148f2c
	.xword	0x4208c0429d364384
	.xword	0xa6c2a6ba8b1e5d78
	.xword	0x3402fe4877f987a2
	.xword	0x9d160f2516415520
	.xword	0x694b5b6665619caf
	.xword	0x2eb502e502606c97
	.xword	0xb2ff6da445166f7d
	.xword	0xa5a93fecadfca4be
	.xword	0xf2e7692c6defd1af
	.xword	0x696210f38b792906
	.xword	0xe6c33f7b022ad49a



#if 0
!!# /*
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!# 
!!#   uint64 b_DATA_ARRAY[12000], h_DATA_ARRAY[12000], w_DATA_ARRAY[12000], x_DATA_ARRAY[12000];
!!#   uint64 b_ADDR_ARRAY[12000], h_ADDR_ARRAY[12000], w_ADDR_ARRAY[12000], x_ADDR_ARRAY[12000];
!!#   uint64 data_st = 0;
!!#   uint64 addr_st = 0;
!!#   uint64 noise_data_st = 0;
!!#   uint64 data_ld = 0;
!!#   int wr_cntr = 0;
!!#   int rd_cntr = 0;
!!#   int b_wr_cntr = 0;
!!#   int b_rd_cntr = 0;
!!#   int h_wr_cntr = 0;
!!#   int h_rd_cntr = 0;
!!#   int w_wr_cntr = 0;
!!#   int w_rd_cntr = 0;
!!#   int x_wr_cntr = 0;
!!#   int x_rd_cntr = 0;
!!#   int a_addr_sel = 0;
!!#   int a_wr_cntr = 0;
!!#   int a_rd_cntr = 0;
!!#   int b_a_wr_cntr = 0;
!!#   int b_a_rd_cntr = 0;
!!#   int h_a_wr_cntr = 0;
!!#   int h_a_rd_cntr = 0;
!!#   int w_a_wr_cntr = 0;
!!#   int w_a_rd_cntr = 0;
!!#   int x_a_wr_cntr = 0;
!!#   int x_a_rd_cntr = 0;
!!#   int i =0;
!!#   int j =0;
!!#   uint64 jbi0, jbi1, jbi2, jbi3, jbi4, jbi5, jbi6, jbi_addr,jbi_config,mem_ad;
!!#   int addr_sel = 0;
!!#   int store_addr = 0;
!!#   int rnd_cnt = 0;
!!#   int invalid_config = 1;
!!# 
!!#   int sjm0_w_mask = 0, sjm1_w_mask = 0;
!!#   int m_tmp = 0;
!!#   uint64 mask = 0;
!!#   int sjm_rd0 = 0, sjm_wr0 = 0, sjm_rd1 = 0, sjm_wr1 = 0;
!!#   int sjm4_dat = 0, sjm5_dat = 0, sjm4_cnt = 0, sjm5_cnt = 0;
!!#   int sjm0_data[8][16];
!!#   int sjm1_data[8][16];
!!#   uint64 sjm0_addr[8], sj4_ad = 0;
!!#   uint64 sjm1_addr[8], sj5_ad = 0;
!!# 
!!#   int sjm_rd0_io = 0, sjm_wr0_io = 0, sjm_rd1_io = 0, sjm_wr1_io = 0;
!!#   int sjm4_cnt_io = 0, sjm5_cnt_io = 0;
!!#   int sjm0_data_io[8][16];
!!#   int sjm1_data_io[8][16];
!!#   uint64 sjm0_addr_io[8];
!!#   uint64 sjm1_addr_io[8];
!!# 
!!#   int sjm_rd0_io1 = 0, sjm_wr0_io1 = 0, sjm_rd1_io1 = 0, sjm_wr1_io1 = 0;
!!#   int sjm4_cnt_io1 = 0, sjm5_cnt_io1 = 0;
!!#   int sjm0_data_io1[8][16];
!!#   int sjm1_data_io1[8][16];
!!#   uint64 sjm0_addr_io1[8];
!!#   uint64 sjm1_addr_io1[8];
!!# 
!!#   int sjm0_w_mask_m_io = 0, sjm1_w_mask_m_io = 0;
!!#   int sjm_rd0_m_io = 0, sjm_wr0_m_io = 0, sjm_rd1_m_io = 0, sjm_wr1_m_io = 0;
!!#   int sjm4_cnt_m_io = 0, sjm5_cnt_m_io = 0;
!!#   int sjm0_data_m_io[8][16];
!!#   int sjm1_data_m_io[8][16];
!!#   uint64 sjm0_addr_m_io[8];
!!#   uint64 sjm1_addr_m_io[8];
!!#   int     rnd_n,b_sz;
!!# 
!!# #define ISEG	0
!!# #define UDATA1	1
!!# #define MY_HYP_SEC	2
!!# #define NCDATA0	3
!!# #define NCDATA1	4
!!# #define NCDATA2	5
!!# #define NCDATA3	6
!!# #define NCDATA4	7
!!# #define NCDATA5	8
!!# #define NCDATA6	9
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#   IJ_set_rvar ("diag.j", 102, rv_0, "{11}");
!!# 
!!#   IJ_set_rvar ("diag.j", 104, wt_ld, "{30}");
!!#   IJ_set_rvar ("diag.j", 105, wt_st, "{30}");
!!#   IJ_set_rvar ("diag.j", 106, wt_bl, "{30}");
!!#   IJ_set_rvar ("diag.j", 107, wt_alu, "{3}");
!!# 
!!#   IJ_set_rvar ("diag.j", 110, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 111, Rv_Simm13, "13'b0 0000 rrrr r000");
!!#   IJ_set_rvar ("diag.j", 112, Rv_addr_sel, "3'brrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 116, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 125, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 134, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 135, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 138, Rv_memaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 1000,"
!!#         "20'b 1110 0001 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#         !"20'b 0001 0000 rrrr 0000 0001,"
!!#         !"20'{0}");
!!# 
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 154, Rv_jbiaddr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0001,"
!!#         "20'b 1110 1110 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   ! Since we are doing it in the user area, and .1000 are 
!!#   ! init to zeros 
!!#   ! the address is : 0xd01ee000
!!#   IJ_set_rvar ("diag.j", 168, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0010,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 181, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0011,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 193, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0100,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 205, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0101,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 217, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0110,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 229, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 1101 0000 0111,"
!!#         "20'b 1110 1111 000r rr00 0000,");
!!#          ! init only till 7fff 
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 239, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! Other  cases ?? when LOW TH and HG TH are random, HI>LO always (TBD)
!!# 
!!#   IJ_set_rvar ("diag.j", 250, Rv_jbi_fifo_wr0_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 0000 0000 rrrr,");
!!# 
!!#   IJ_set_rvar ("diag.j", 258, Rv_jbi_fifo_wr1_config,
!!#         "24'{0},"
!!# 
!!#         "20'b 0000 0000 0rrr 0rrr 00rr,"
!!#         "20'b 00rr rrrr 1rrr 0000 rrrr,");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Rs1, "{6,7,9,10,11,12,13}");  // BASE
!!#   IJ_set_ropr_fld    ("diag.j", 267, ijdefault, Ft_Rs1, "{6,7,10,11,12,13,14}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 268, ijdefault, Ft_Rs2, "{8}");
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Rd, "{16..23}");
!!#   !IJ_set_ropr_fld    (Rv_ldstD, Ft_Rd, "{16,18,20,22}");
!!#   IJ_set_ropr_fld    ("diag.j", 271, ijdefault, Ft_Rd, "{16,18,20,22}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 274, ijdefault, Ft_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_ropr_fld    ("diag.j", 275, ijdefault, Ft_Imm_Asi, "{0}");
!!# 
!!#   IJ_bind_thread_group("diag.j", 278, th_M, 0x1);
!!#   IJ_bind_thread_group("diag.j", 279, th_all, 0xffffffff); ! 8 cores 4 threads
!!#   IJ_init_regs_by_setx ("diag.j", 280, th_M, 3, 1, Rv_rand64);
!!#   IJ_printf ("diag.j", 281, th_M, "\tmov\t0, %%r8\n");
!!# 
!!#   IJ_printf ("diag.j", 285, th_M, "\tta\t0x30\n");
!!#   IJ_printf ("diag.j", 286, th_M, "\tmov\t0,\%%g4 \n");
!!#   IJ_printf ("diag.j", 287, th_M, "\tsetx\tncdata_base0, %%g1, %%g2 \n");
!!#   IJ_printf ("diag.j", 288, th_M, "\tsetx\t0x1000, %%g1, %%g3 \n");
!!#   IJ_printf ("diag.j", 289, th_M, "\tadd\t\%%g2, \%%g3, \%%g3 \n");
!!# 
!!#   IJ_printf ("diag.j", 292, th_M, "\t! initalize\n");
!!#   IJ_printf ("diag.j", 293, th_M, "\tsetx    ncdata_base1, %%l0, %%l2\n");
!!#   IJ_printf ("diag.j", 294, th_M, "\tsetx    0x1000, %%l0, %%l3\n");
!!#   IJ_printf ("diag.j", 295, th_M, "\tadd     %%l2, %%l3, %%g3\n");
!!#   IJ_printf ("diag.j", 296, th_M, "\tsetx 0x7766554433221100, %%g1, %%g2\n");
!!#   IJ_printf ("diag.j", 297, th_M, "\tadd 0x0, %%g0, %%g4\n");
!!#   IJ_printf ("diag.j", 298, th_M, "\t!add 0x0, %%g0, %%g2\n");
!!#   IJ_printf ("diag.j", 299, th_M, "\tadd 0x020, %%g0, %%g5\n");
!!#   IJ_printf ("diag.j", 300, th_M, "\t!setx 0x800e000000, %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 301, th_M, "\tstloop0:\n");
!!#   IJ_printf ("diag.j", 302, th_M, "\tstx %%g2, [%%g3 + %%g4]\n");
!!#   IJ_printf ("diag.j", 303, th_M, "\tinc %%g2\n");
!!#   IJ_printf ("diag.j", 304, th_M, "\tadd 0x8, %%g4, %%g4\n");
!!#   IJ_printf ("diag.j", 305, th_M, "\tdeccc %%g5\n");
!!#   IJ_printf ("diag.j", 306, th_M, "\tbne stloop0\n");
!!#   IJ_printf ("diag.j", 307, th_M, "\tnop\n");
!!#   IJ_printf ("diag.j", 308, th_M, "\t! initalize\n");
!!#   IJ_printf ("diag.j", 309, th_M, "\tsetx    user_data_start, %%l0, %%l2\n");
!!#   IJ_printf ("diag.j", 310, th_M, "\tsetx    0x1000, %%l0, %%l3\n");
!!#   IJ_printf ("diag.j", 311, th_M, "\tadd     %%l2, %%l3, %%g3\n");
!!#   IJ_printf ("diag.j", 312, th_M, "\tadd 0x0, %%g0, %%g4\n");
!!#   IJ_printf ("diag.j", 313, th_M, "\tadd 0x040, %%g0, %%g5\n");
!!#   IJ_printf ("diag.j", 314, th_M, "\tdstloop6:\n");
!!#   IJ_printf ("diag.j", 315, th_M, "\tstx %%g2, [%%g3 + %%g4]\n");
!!#   IJ_printf ("diag.j", 316, th_M, "\tinc %%g2\n");
!!#   IJ_printf ("diag.j", 317, th_M, "\tadd 0x8, %%g4, %%g4\n");
!!#   IJ_printf ("diag.j", 318, th_M, "\tdeccc %%g5\n");
!!#   IJ_printf ("diag.j", 319, th_M, "\tbne dstloop6\n");
!!#   IJ_printf ("diag.j", 320, th_M, "\tnop\n");
!!#   IJ_printf ("diag.j", 321, th_M, "\t! initalize\n");
!!#   IJ_printf ("diag.j", 322, th_M, "\tsetx    ncdata_base0, %%l0, %%l2\n");
!!#   IJ_printf ("diag.j", 323, th_M, "\tsetx    0x1000, %%l0, %%l3\n");
!!#   IJ_printf ("diag.j", 324, th_M, "\tadd     %%l2, %%l3, %%g3\n");
!!#   IJ_printf ("diag.j", 325, th_M, "\tadd 0x0, %%g0, %%g4\n");
!!#   IJ_printf ("diag.j", 326, th_M, "\t!add 0x1, %%g0, %%g2\n");
!!#   IJ_printf ("diag.j", 327, th_M, "\tadd 0x040, %%g0, %%g5\n");
!!#   IJ_printf ("diag.j", 328, th_M, "\t! FAKE DMA space\n");
!!#   IJ_printf ("diag.j", 329, th_M, "\t!setx 0x8010000000, %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 330, th_M, "\tstloop1:\n");
!!#   IJ_printf ("diag.j", 331, th_M, "\tstx %%g2, [%%g3 + %%g4]\n");
!!#   IJ_printf ("diag.j", 332, th_M, "\tinc %%g2\n");
!!#   IJ_printf ("diag.j", 333, th_M, "\tadd 0x8, %%g4, %%g4\n");
!!#   IJ_printf ("diag.j", 334, th_M, "\tdeccc %%g5\n");
!!#   IJ_printf ("diag.j", 335, th_M, "\tbne stloop1\n");
!!#   IJ_printf ("diag.j", 336, th_M, "\tnop\n");
!!#   IJ_printf ("diag.j", 337, th_M, "\t! initalize\n");
!!#   IJ_printf ("diag.j", 338, th_M, "\tsetx    ncdata_base2, %%l0, %%l2\n");
!!#   IJ_printf ("diag.j", 339, th_M, "\tsetx    0x1000, %%l0, %%l3\n");
!!#   IJ_printf ("diag.j", 340, th_M, "\tadd     %%l2, %%l3, %%g3\n");
!!#   IJ_printf ("diag.j", 341, th_M, "\tadd 0x0, %%g0, %%g4\n");
!!#   IJ_printf ("diag.j", 342, th_M, "\t!add 0x1, %%g2, %%g2\n");
!!#   IJ_printf ("diag.j", 343, th_M, "\tadd 0x040, %%g0, %%g5\n");
!!#   IJ_printf ("diag.j", 344, th_M, "\t!setx 0x800f000000, %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 345, th_M, "\tstloop2:\n");
!!#   IJ_printf ("diag.j", 346, th_M, "\tstx %%g2, [%%g3 + %%g4]\n");
!!#   IJ_printf ("diag.j", 347, th_M, "\tinc %%g2\n");
!!#   IJ_printf ("diag.j", 348, th_M, "\tadd 0x8, %%g4, %%g4\n");
!!#   IJ_printf ("diag.j", 349, th_M, "\tdeccc %%g5\n");
!!#   IJ_printf ("diag.j", 350, th_M, "\tbne stloop2\n");
!!#   IJ_printf ("diag.j", 351, th_M, "\tnop\n");
!!#   IJ_printf ("diag.j", 352, th_M, "\t! initalize\n");
!!#   IJ_printf ("diag.j", 353, th_M, "\tsetx    ncdata_base3, %%l0, %%l2\n");
!!#   IJ_printf ("diag.j", 354, th_M, "\tsetx    0x1000, %%l0, %%l3\n");
!!#   IJ_printf ("diag.j", 355, th_M, "\tadd     %%l2, %%l3, %%g3\n");
!!#   IJ_printf ("diag.j", 356, th_M, "\tadd 0x0, %%g0, %%g4\n");
!!#   IJ_printf ("diag.j", 357, th_M, "\t!add 0x1, %%g2, %%g2\n");
!!#   IJ_printf ("diag.j", 358, th_M, "\tadd 0x040, %%g0, %%g5\n");
!!#   IJ_printf ("diag.j", 359, th_M, "\t!setx 0xc000000000, %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 360, th_M, "\tstloop3:\n");
!!#   IJ_printf ("diag.j", 361, th_M, "\tstx %%g2, [%%g3 + %%g4]\n");
!!#   IJ_printf ("diag.j", 362, th_M, "\tinc %%g2\n");
!!#   IJ_printf ("diag.j", 363, th_M, "\tadd 0x8, %%g4, %%g4\n");
!!#   IJ_printf ("diag.j", 364, th_M, "\tdeccc %%g5\n");
!!#   IJ_printf ("diag.j", 365, th_M, "\tbne stloop3\n");
!!#   IJ_printf ("diag.j", 366, th_M, "\tnop\n");
!!#   IJ_printf ("diag.j", 367, th_M, "\t! initalize\n");
!!#   IJ_printf ("diag.j", 368, th_M, "\tsetx    ncdata_base4, %%l0, %%l2\n");
!!#   IJ_printf ("diag.j", 369, th_M, "\tsetx    0x1000, %%l0, %%l3\n");
!!#   IJ_printf ("diag.j", 370, th_M, "\tadd     %%l2, %%l3, %%g3\n");
!!#   IJ_printf ("diag.j", 371, th_M, "\tadd 0x0, %%g0, %%g4\n");
!!#   IJ_printf ("diag.j", 372, th_M, "\t!add 0x1, %%g2, %%g2\n");
!!#   IJ_printf ("diag.j", 373, th_M, "\tadd 0x040, %%g0, %%g5\n");
!!#   IJ_printf ("diag.j", 374, th_M, "\t!setx 0xd000000000, %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 375, th_M, "\tstloop4:\n");
!!#   IJ_printf ("diag.j", 376, th_M, "\tstx %%g2, [%%g3 + %%g4]\n");
!!#   IJ_printf ("diag.j", 377, th_M, "\tinc %%g2\n");
!!#   IJ_printf ("diag.j", 378, th_M, "\tadd 0x8, %%g4, %%g4\n");
!!#   IJ_printf ("diag.j", 379, th_M, "\tdeccc %%g5\n");
!!#   IJ_printf ("diag.j", 380, th_M, "\tbne stloop4\n");
!!#   IJ_printf ("diag.j", 381, th_M, "\tnop\n");
!!#   IJ_printf ("diag.j", 382, th_M, "\t! initalize\n");
!!#   IJ_printf ("diag.j", 383, th_M, "\tsetx    ncdata_base5, %%l0, %%l2\n");
!!#   IJ_printf ("diag.j", 384, th_M, "\tsetx    0x1000, %%l0, %%l3\n");
!!#   IJ_printf ("diag.j", 385, th_M, "\tadd     %%l2, %%l3, %%g3\n");
!!#   IJ_printf ("diag.j", 386, th_M, "\tadd 0x0, %%g0, %%g4\n");
!!#   IJ_printf ("diag.j", 387, th_M, "\t!add 0x1, %%g2, %%g2\n");
!!#   IJ_printf ("diag.j", 388, th_M, "\tadd 0x040, %%g0, %%g5\n");
!!#   IJ_printf ("diag.j", 389, th_M, "\t!setx 0xe000000000, %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 390, th_M, "\tstloop5:\n");
!!#   IJ_printf ("diag.j", 391, th_M, "\tstx %%g2, [%%g3 + %%g4]\n");
!!#   IJ_printf ("diag.j", 392, th_M, "\tinc %%g2\n");
!!#   IJ_printf ("diag.j", 393, th_M, "\tadd 0x8, %%g4, %%g4\n");
!!#   IJ_printf ("diag.j", 394, th_M, "\tdeccc %%g5\n");
!!#   IJ_printf ("diag.j", 395, th_M, "\tbne stloop5\n");
!!#   IJ_printf ("diag.j", 396, th_M, "\tnop\n");
!!#   IJ_printf ("diag.j", 397, th_M, "\t! initalize\n");
!!#   IJ_printf ("diag.j", 398, th_M, "\tsetx    ncdata_base6, %%l0, %%l2\n");
!!#   IJ_printf ("diag.j", 399, th_M, "\tsetx    0x1000, %%l0, %%l3\n");
!!#   IJ_printf ("diag.j", 400, th_M, "\tadd     %%l2, %%l3, %%g3\n");
!!#   IJ_printf ("diag.j", 401, th_M, "\tadd 0x0, %%g0, %%g4\n");
!!#   IJ_printf ("diag.j", 402, th_M, "\t!add 0x1, %%g2, %%g2\n");
!!#   IJ_printf ("diag.j", 403, th_M, "\tadd 0x040, %%g0, %%g5\n");
!!#   IJ_printf ("diag.j", 404, th_M, "\t!setx 0xf000000000, %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 405, th_M, "\tstloop6:\n");
!!#   IJ_printf ("diag.j", 406, th_M, "\tstx %%g2, [%%g3 + %%g4]\n");
!!#   IJ_printf ("diag.j", 407, th_M, "\tinc %%g2\n");
!!#   IJ_printf ("diag.j", 408, th_M, "\tadd 0x8, %%g4, %%g4\n");
!!#   IJ_printf ("diag.j", 409, th_M, "\tdeccc %%g5\n");
!!#   IJ_printf ("diag.j", 410, th_M, "\tbne stloop6\n");
!!#   IJ_printf ("diag.j", 411, th_M, "\tnop\n");
!!#   IJ_printf ("diag.j", 412, th_M, "\tmembar 0x40\n");
!!#   IJ_printf ("diag.j", 413, th_M, "\twr    %%g0, 7, %%fprs\n");
!!#   IJ_printf ("diag.j", 414, th_M, "\tldda [%%g3]ASI_BLK_P, %%f0\n");
!!# 
!!#   IJ_printf ("diag.j", 418, th_all, "\tsetx\t0x%016llrx, %%r1, %%r6\n", Rv_jbiaddr_pattern0);
!!#   IJ_printf ("diag.j", 419, th_all, "\tsetx\t0x%016llrx, %%r1, %%r7\n", Rv_jbiaddr_pattern1);
!!#   IJ_printf ("diag.j", 420, th_all, "\tsetx\t0x%016llrx, %%r1, %%r14\n", Rv_jbiaddr_pattern2);
!!#   IJ_printf ("diag.j", 421, th_all, "\tsetx\t0x%016llrx, %%r1, %%r10\n", Rv_jbiaddr_pattern3);
!!#   IJ_printf ("diag.j", 422, th_all, "\tsetx\t0x%016llrx, %%r1, %%r11\n", Rv_jbiaddr_pattern4);
!!#   IJ_printf ("diag.j", 423, th_all, "\tsetx\t0x%016llrx, %%r1, %%r12\n", Rv_jbiaddr_pattern5);
!!#   IJ_printf ("diag.j", 424, th_all, "\tsetx\t0x%016llrx, %%r1, %%r13\n", Rv_jbiaddr_pattern6);
!!# 
!!#   IJ_th_fork_group("diag.j", 426, th_all);
!!# 
!!#   IJ_bind_file_group("diag.j", 429, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 430, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_printf ("diag.j", 434, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 435, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 436, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 438, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 440, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 441, sjm_4, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_printf ("diag.j", 443, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 444, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 445, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 446, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 448, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 449, sjm_5, "\n\nLABEL_0:\n");
!!# 
!!#   !IJ_printf (th_M, "\tmov\t0, %%r8\n");
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!# !  IJ_printf(th_M,"\tnop\n\tta T_GOOD_TRAP\n\tnop\n");
!!# !  IJ_printf(th_M,"\ttest_fail:\n\tta T_BAD_TRAP\n\tnop\n");
!!#   IJ_printf ("diag.j", 482, sjm_4, "\n\nBA LABEL_0\n");
!!#   IJ_printf ("diag.j", 483, sjm_5, "\n\nBA LABEL_0\n");
!!# 
!!#   int i,j;
!!#   ! Do this else midas wont put any tsbs for the above.
!!#   for (i = 0; i < 16; i++) {
!!#     IJ_iseg_printf("diag.j", 488,ISEG, i, th_M, ".data\n");
!!#     for (j = 0; j < 256; j++) {
!!#     IJ_iseg_printf("diag.j", 490,ISEG, i, th_M, "\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!#   IJ_th_start ("diag.j", 495,Seq_Start, NULL, 2);
!!#   IJ_th_join_group("diag.j", 496, th_all);
!!# 
!!# }
!!# 
!!# 
!!# 
!!# %%
!!# %%section map
!!# 
!!# 
!!#   SECTION .ISEG DATA_VA = "24'{0}, 20'b0000 0000 iiii 0000 0001, 20'{0}"
!!# 
!!#   attr_data {
!!#         Name = .ISEG,
!!#         RA = "24'{0}, 20'b0000 0000 iiii 0000 0001, 20'{0}",
!!#         part_0_d_ctx_nonzero_ps0_tsb,
!!#         TTE_G = 1, TTE_Context = PCONTEXT, TTE_V = 1, TTE_Size = 0,
!!#         TTE_NFO = 0, TTE_IE = 0, TTE_Soft2 = 0, TTE_Diag = 0, TTE_Soft = 0,
!!#         TTE_L = 0, TTE_CP = 1, TTE_CV = 1, TTE_E = 0, TTE_P = 0, TTE_W = 1
!!#   }
!!#   enumerate {
!!#         DATA_VA
!!#  }
!!# 
!!# 
!!# 
!!# 
!!# %%
!!# %%section grammar
!!# 
!!# 
!!# inst_block: inst_type
!!#             | inst_block inst_type
!!# 	{
!!# 		IJ_generate ("diag.j", 780, th_all, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type: set_addr  %rvar  wt_alu |
!!#            load      %rvar  wt_ld |
!!#            alu       %rvar  wt_alu |
!!#            block_ld  %rvar  wt_bl |
!!#            block_st  %rvar  wt_bl |
!!#            store     %rvar  wt_ld |
!!#            sjm4      |
!!#            sjm5
!!# 
!!# ;
!!# 
!!# sjm4: set_sjm4_wr_b | set_sjm4_rd_b |  set_sjm4_wr_b_io | set_sjm4_rd_b_io | set_sjm4_wr_io | set_sjm4_rd_io | set_sjm4_wr_m | set_sjm4_wr_m_io | set_sjm4_rd_m_io 
!!# ;
!!# 
!!# set_sjm4_wr_b : mSET_SJM4_WR_B
!!#                 {
!!# 
!!#                   if (sjm4_cnt < 8) { 
!!#                    IJ_printf ("diag.j", 803, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 806, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 808, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 809, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 813, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 814, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 815, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 816, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 818, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 819, sjm_4, "+\n");
!!#                           }
!!#                         }
!!#                       if (sjm_wr0 == 7) sjm_wr0 = 0; else sjm_wr0++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_rd_b : mSET_SJM4_RD_B
!!#                 {
!!# 
!!#                   if (sjm4_cnt > 0) { 
!!#                    IJ_printf ("diag.j", 832, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 837, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 841, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 842, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 844, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 845, sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd0 == 7) sjm_rd0 = 0; else sjm_rd0++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_wr_m : mSET_SJM4_WR_M
!!#                 {
!!# 
!!#                   if (sjm4_cnt > 0) { 
!!#                    IJ_printf ("diag.j", 859, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 863, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 864, Rv_rand_mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       mask  = 0;
!!#                      for (i=0;i<16;i++) {
!!#                       if (m_tmp & 0x1 ) {
!!#                         mask = mask << 4;
!!#                         mask = mask | 0xf;
!!#                         } else {
!!#                         mask = mask << 4;
!!#                        }
!!# 
!!#                       m_tmp = m_tmp >> 1;
!!#                      }
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 881, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 886, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 887, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 889, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 890, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 892, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 893, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 898, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 899, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 901, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 902, sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                         m_tmp = m_tmp >> 1;
!!#                        }
!!#                       !if (sjm_rd0 == 7) sjm_rd0 = 0; else sjm_rd0++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_wr_b_io : mSET_SJM4_WR_B_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_io < 8) { 
!!#                    IJ_printf ("diag.j", 919, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 922, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 924, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 925, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 929, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 930, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 931, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 932, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 934, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 935, sjm_4, "+\n");
!!#                           }
!!#                         }
!!#                       if (sjm_wr0_io == 7) sjm_wr0_io = 0; else sjm_wr0_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_rd_b_io : mSET_SJM4_RD_B_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_io > 0) { 
!!#                    IJ_printf ("diag.j", 948, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 953, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 957, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 958, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 960, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 961, sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd0_io == 7) sjm_rd0_io = 0; else sjm_rd0_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_wr_io : mSET_SJM4_WR_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_io1 < 8) { 
!!#                    IJ_printf ("diag.j", 976, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 979, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 981, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 982, Rv_memaddr_pattern_io);
!!# 
!!#                      rnd_n = random()%5;
!!#                      switch (rnd_n) {
!!#                        case 0 : b_sz = 4; break;
!!#                        case 1 : b_sz = 8; break;
!!#                        !case 0 : b_sz = 1; break;
!!#                        !case 1 : b_sz = 2; break;
!!#                        case 2 : b_sz = 4; break;
!!#                        case 3 : b_sz = 8; break;
!!#                        default :b_sz = 16; break;
!!#                       } 
!!# 
!!#                      sjm0_data_io1[sjm_wr0_io1][15] = b_sz; ! byte size in entry 15, for read
!!# 
!!#                       IJ_printf ("diag.j", 997, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 1000, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1001, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1002, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1007, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1009, sjm_4, "\n");
!!#                       }
!!# 
!!#                       if (sjm_wr0_io1 == 7) sjm_wr0_io1 = 0; else sjm_wr0_io1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_rd_io : mSET_SJM4_RD_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_io1 > 0) {
!!#                    IJ_printf ("diag.j", 1023, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 1029, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 1033, sjm_4, "0x%08x ",sjm4_dat);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break;
!!#                          if((i==1) && (b_sz == 8)) break;
!!#                         }
!!#                       if (sjm_rd0_io1 == 7) sjm_rd0_io1 = 0; else sjm_rd0_io1++;
!!#                     }
!!#                 }
!!# 
!!# ;
!!# 
!!# set_sjm4_wr_m_io : mSET_SJM4_WR_M_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_m_io < 8) { 
!!#                    IJ_printf ("diag.j", 1048, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 1050, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 1052, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1058, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1059, Rv_rand_mask);
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf; ! 4 bits * 4 = 16 bit mask
!!#                       mask  = 0;
!!#                      for (i=0;i<4;i++) {
!!#                       if (m_tmp & 0x1 ) {
!!#                         mask = mask << 4;
!!#                         mask = mask | 0xf;
!!#                         } else {
!!#                         mask = mask << 4;
!!#                        }
!!# 
!!#                       m_tmp = m_tmp >> 1;
!!#                      }
!!# 
!!#                      !IJ_printf (sjm_4, "# debug WRITEMSK  0x%016llx 0x%016llx +\n",mask_flip,mask);
!!#                      ! mask_flip = 0;
!!#                      ! for (i=0;i<15;i++) { 
!!#                      !  fl_tmp = mask & 0xf;
!!#                      !  mask_flip = mask_flip | fl_tmp;
!!#                      !  mask_flip = mask_flip << 4;
!!#                      !  mask      = mask      >> 4;
!!#                      ! }
!!#                      !IJ_printf (sjm_4, "# debug WRITEMSK  0x%016llx 0x%016llx +\n",mask_flip,mask);
!!#                      !mask = mask_flip | mask;
!!# 
!!#                      IJ_printf ("diag.j", 1086, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 1092, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1093, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1096, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1098, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1107, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1109, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                         m_tmp = m_tmp >> 1;
!!#                        }
!!#                       if (sjm_wr0_m_io == 7) sjm_wr0_m_io = 0; else sjm_wr0_m_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_rd_m_io : mSET_SJM4_RD_M_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_m_io > 0) { 
!!#                    IJ_printf ("diag.j", 1127, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 1133, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 1138, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1140, sjm_4, "\n");
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd0_m_io == 7) sjm_rd0_m_io = 0; else sjm_rd0_m_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# sjm5: set_sjm5_wr_b | set_sjm5_rd_b |  set_sjm5_wr_b_io | set_sjm5_rd_b_io | set_sjm5_wr_io | set_sjm5_rd_io | set_sjm5_wr_m | set_sjm5_wr_m_io | set_sjm5_rd_m_io 
!!# ;
!!# 
!!# set_sjm5_wr_b : mSET_SJM5_WR_B
!!#                 {
!!# 
!!#                   if (sjm5_cnt < 8) { 
!!#                    IJ_printf ("diag.j", 1158, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1161, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1163, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1164, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 1167, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1168, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1169, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1170, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1172, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1173, sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_wr1 == 7) sjm_wr1 = 0; else sjm_wr1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_rd_b : mSET_SJM5_RD_B
!!#                 {
!!# 
!!#                   if (sjm5_cnt > 0) { 
!!#                    IJ_printf ("diag.j", 1186, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1191, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1195, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1196, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1198, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1199, sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd1 == 7) sjm_rd1 = 0; else sjm_rd1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_wr_m : mSET_SJM5_WR_M
!!#                 {
!!# 
!!#                   if (sjm5_cnt > 0) { 
!!#                    IJ_printf ("diag.j", 1213, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 1217, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1218, Rv_rand_mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       mask  = 0;
!!#                      for (i=0;i<16;i++) {
!!#                       if (m_tmp & 0x1 ) {
!!#                         mask = mask << 4;
!!#                         mask = mask | 0xf;
!!#                         } else {
!!#                         mask = mask << 4;
!!#                        }
!!# 
!!#                       m_tmp = m_tmp >> 1;
!!#                      }
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1235, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 1240, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1241, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1243, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1244, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1246, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1247, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1252, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1253, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1255, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1256, sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                         m_tmp = m_tmp >> 1;
!!#                        }
!!#                       !if (sjm_rd1 == 7) sjm_rd1 = 0; else sjm_rd1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_wr_b_io : mSET_SJM5_WR_B_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_io < 8) { 
!!#                    IJ_printf ("diag.j", 1273, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1276, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1278, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1279, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1283, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1284, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1285, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1286, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1288, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1289, sjm_5, "+\n");
!!#                           }
!!#                         }
!!#                       if (sjm_wr1_io == 7) sjm_wr1_io = 0; else sjm_wr1_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_rd_b_io : mSET_SJM5_RD_B_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_io > 0) { 
!!#                    IJ_printf ("diag.j", 1302, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1307, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1311, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1312, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1314, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1315, sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd1_io == 7) sjm_rd1_io = 0; else sjm_rd1_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_wr_io : mSET_SJM5_WR_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_io1 < 8) { 
!!#                    IJ_printf ("diag.j", 1331, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1334, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1336, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1337, Rv_memaddr_pattern_io);
!!# 
!!#                      rnd_n = random()%5;
!!#                      switch (rnd_n) {
!!#                        case 0 : b_sz = 4; break;
!!#                        case 1 : b_sz = 8; break;
!!#                        !case 0 : b_sz = 1; break;
!!#                        !case 1 : b_sz = 2; break;
!!#                        case 2 : b_sz = 4; break;
!!#                        case 3 : b_sz = 8; break;
!!#                        default :b_sz = 16; break;
!!#                       } 
!!# 
!!#                      sjm1_data_io1[sjm_wr1_io1][15] = b_sz; ! byte size in entry 15, for read
!!# 
!!#                       IJ_printf ("diag.j", 1352, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1355, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1356, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1357, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1362, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1364, sjm_5, "\n");
!!#                       }
!!# 
!!#                       if (sjm_wr1_io1 == 7) sjm_wr1_io1 = 0; else sjm_wr1_io1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_rd_io : mSET_SJM5_RD_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_io1 > 0) {
!!#                    IJ_printf ("diag.j", 1378, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1384, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1388, sjm_5, "0x%08x ",sjm5_dat);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break;
!!#                          if((i==1) && (b_sz == 8)) break;
!!#                         }
!!#                       if (sjm_rd1_io1 == 7) sjm_rd1_io1 = 0; else sjm_rd1_io1++;
!!#                     }
!!#                 }
!!# 
!!# ;
!!# 
!!# set_sjm5_wr_m_io : mSET_SJM5_WR_M_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_m_io < 8) { 
!!#                    IJ_printf ("diag.j", 1403, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1405, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1407, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1413, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1414, Rv_rand_mask);
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf; ! 4 bits * 4 = 16 bit mask
!!#                       mask  = 0;
!!#                      for (i=0;i<4;i++) {
!!#                       if (m_tmp & 0x1 ) {
!!#                         mask = mask << 4;
!!#                         mask = mask | 0xf;
!!#                         } else {
!!#                         mask = mask << 4;
!!#                        }
!!# 
!!#                       m_tmp = m_tmp >> 1;
!!#                      }
!!# 
!!#                      !IJ_printf (sjm_5, "# debug WRITEMSK  0x%016llx 0x%016llx +\n",mask_flip,mask);
!!#                      ! mask_flip = 0;
!!#                      ! for (i=0;i<15;i++) { 
!!#                      !  fl_tmp = mask & 0xf;
!!#                      !  mask_flip = mask_flip | fl_tmp;
!!#                      !  mask_flip = mask_flip << 4;
!!#                      !  mask      = mask      >> 4;
!!#                      ! }
!!#                      !IJ_printf (sjm_5, "# debug WRITEMSK  0x%016llx 0x%016llx +\n",mask_flip,mask);
!!#                      !mask = mask_flip | mask;
!!# 
!!#                      IJ_printf ("diag.j", 1441, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1447, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1448, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1451, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1453, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1462, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1464, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                         m_tmp = m_tmp >> 1;
!!#                        }
!!#                       if (sjm_wr1_m_io == 7) sjm_wr1_m_io = 0; else sjm_wr1_m_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_rd_m_io : mSET_SJM5_RD_M_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_m_io > 0) { 
!!#                    IJ_printf ("diag.j", 1482, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1488, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1493, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1495, sjm_5, "\n");
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd1_m_io == 7) sjm_rd1_m_io = 0; else sjm_rd1_m_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# !inst_type: set_addr load atomics alu store atomics_asi barier
!!# !{
!!# 		!IJ_generate (th_all, $2);
!!# 		!IJ_generate (th_all, $3);
!!# 		!IJ_generate (th_all, $4);
!!# 
!!# 		!IJ_generate (th_all, $5);
!!# 		!IJ_generate (th_all, $6);
!!# 		!IJ_generate (th_all, $7);
!!# !}
!!# 
!!# set_addr:  set_memaddr %rvar  wt_alu
!!# ;
!!# 
!!# set_memaddr: mSET_MEMADDR %rvar  wt_alu
!!#                 {
!!# 
!!#                         ! Update the JBI-CONFIG FIFO parameters
!!#                         !invalid_config = 1;
!!#                         !while (invalid_config) {
!!#                         !if (random()%2) {
!!#                         !jbi_config = IJ_get_rvar_val64(Rv_jbi_fifo_wr0_config);
!!#                         !IJ_update_rvar(Rv_jbi_fifo_wr0_config);
!!#                         !} else {
!!#                         !jbi_config = IJ_get_rvar_val64(Rv_jbi_fifo_wr1_config);
!!#                         !IJ_update_rvar(Rv_jbi_fifo_wr1_config);
!!#                         !}
!!#                         !if (((jbi_config>>24) & 0x7) < ((jbi_config>>28) & 0x7)) {
!!#                         !invalid_config = 0;
!!#                         ! }
!!#                         !}
!!# 
!!#                         !IJ_printf (th_all, "\tsetx\t0x%016llx, %%r1, %%r6\n",
!!#                         !        jbi_config);
!!#                         !	IJ_printf (th_all, "\tsetx\t0x8000000008, %%r1, %%r10\n");
!!#                         !IJ_printf (th_all, "\tstx\t%%r6, [%%r10]\n");
!!# 
!!#                    if(random()%2 == 1) {
!!#                      if(random()%2 == 1) {
!!#                       IJ_printf ("diag.j", 1551, th_all, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern0);
!!#                       IJ_printf ("diag.j", 1553, th_all, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1555, th_all, "\tsetx\t0x%016llrx, %%r1, %%r14\n",
!!#                               Rv_jbiaddr_pattern2);
!!#                       IJ_printf ("diag.j", 1557, th_all, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1559, th_all, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_jbiaddr_pattern4);
!!#                       IJ_printf ("diag.j", 1561, th_all, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1563, th_all, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_jbiaddr_pattern6);
!!#                       } else { 
!!#                       IJ_printf ("diag.j", 1566, th_all, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern1);
!!#                       IJ_printf ("diag.j", 1568, th_all, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1570, th_all, "\tsetx\t0x%016llrx, %%r1, %%r14\n",
!!#                               Rv_jbiaddr_pattern3);
!!#                       IJ_printf ("diag.j", 1572, th_all, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1574, th_all, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_jbiaddr_pattern5);
!!#                       IJ_printf ("diag.j", 1576, th_all, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1578, th_all, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_memaddr_pattern);
!!# 
!!#                       }
!!# 
!!#                     } else { 
!!#                      if(random()%2 == 1) {
!!#                       IJ_printf ("diag.j", 1585, th_all, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_jbiaddr_pattern0);
!!#                       IJ_printf ("diag.j", 1587, th_all, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_jbiaddr_pattern1);
!!#                       IJ_printf ("diag.j", 1589, th_all, "\tsetx\t0x%016llrx, %%r1, %%r14\n",
!!#                               Rv_jbiaddr_pattern2);
!!#                       IJ_printf ("diag.j", 1591, th_all, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_jbiaddr_pattern3);
!!#                       IJ_printf ("diag.j", 1593, th_all, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_jbiaddr_pattern4);
!!#                       IJ_printf ("diag.j", 1595, th_all, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_jbiaddr_pattern5);
!!#                       IJ_printf ("diag.j", 1597, th_all, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_jbiaddr_pattern6);
!!#                       } else { 
!!#                       IJ_printf ("diag.j", 1600, th_all, "\tsetx\t0x%016llrx, %%r1, %%r6\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1602, th_all, "\tsetx\t0x%016llrx, %%r1, %%r7\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1604, th_all, "\tsetx\t0x%016llrx, %%r1, %%r14\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1606, th_all, "\tsetx\t0x%016llrx, %%r1, %%r10\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1608, th_all, "\tsetx\t0x%016llrx, %%r1, %%r11\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1610, th_all, "\tsetx\t0x%016llrx, %%r1, %%r12\n",
!!#                               Rv_memaddr_pattern);
!!#                       IJ_printf ("diag.j", 1612, th_all, "\tsetx\t0x%016llrx, %%r1, %%r13\n",
!!#                               Rv_memaddr_pattern);
!!#                       }
!!#                      }
!!#         }
!!# ;
!!# 
!!# block_ld :  set_block_ld   %rvar  wt_bl
!!# ;
!!# set_block_ld :  mSET_BLOCK_LD %rvar  wt_bl
!!#                 {
!!#                         rnd_cnt = random() %7;
!!#                         switch (rnd_cnt) {
!!#                         case 0 : IJ_printf ("diag.j", 1625, th_all, "\tldda\t[%%r6]ASI_BLK_P, %%f0\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1626, th_all, "\tldda\t[%%r7]ASI_BLK_P, %%f0\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1627, th_all, "\tldda\t[%%r14]ASI_BLK_P, %%f0\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1628, th_all, "\tldda\t[%%r10]ASI_BLK_P, %%f0\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1629, th_all, "\tldda\t[%%r11]ASI_BLK_P, %%f0\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1630, th_all, "\tldda\t[%%r12]ASI_BLK_P, %%f0\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1631, th_all, "\tldda\t[%%r13]ASI_BLK_P, %%f0\n"); break;
!!#                         default : IJ_printf ("diag.j", 1632, th_all, "\tldda\t[%%r8]ASI_BLK_P, %%f0\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1634, th_all, "\tmembar\t 0x40\n");
!!#                  }
!!# 
!!# ;
!!# 
!!# block_st :  set_block_st   %rvar  wt_bl
!!# ;
!!# set_block_st :  mSET_BLOCK_ST   %rvar  wt_bl
!!#                 {
!!#                         rnd_cnt = random() %7;
!!#                         switch (rnd_cnt) {
!!#                         case 0 : IJ_printf ("diag.j", 1645, th_all, "\tstda\t %%f0, [%%r6]ASI_BLK_P\n"); break;
!!#                         case 1 : IJ_printf ("diag.j", 1646, th_all, "\tstda\t %%f0, [%%r7]ASI_BLK_P\n"); break;
!!#                         case 2 : IJ_printf ("diag.j", 1647, th_all, "\tstda\t %%f0, [%%r14]ASI_BLK_P\n"); break;
!!#                         case 3 : IJ_printf ("diag.j", 1648, th_all, "\tstda\t %%f0, [%%r10]ASI_BLK_P\n"); break;
!!#                         case 4 : IJ_printf ("diag.j", 1649, th_all, "\tstda\t %%f0, [%%r11]ASI_BLK_P\n"); break;
!!#                         case 5 : IJ_printf ("diag.j", 1650, th_all, "\tstda\t %%f0, [%%r12]ASI_BLK_P\n"); break;
!!#                         case 6 : IJ_printf ("diag.j", 1651, th_all, "\tstda\t %%f0, [%%r13]ASI_BLK_P\n"); break;
!!#                         default  : IJ_printf ("diag.j", 1652, th_all, "\tstda\t %%f0, [%%r7]ASI_BLK_P\n"); break;
!!#                         }
!!#                         IJ_printf ("diag.j", 1654, th_all, "\tmembar\t 0x40\n");
!!#                  }
!!# 
!!# ;
!!# 
!!# load: gLOAD  %rvar  wt_ld 
!!# ;
!!# 
!!# store: gSTORE  %rvar  wt_st
!!# ;
!!# 
!!# alu: gALU  %rvar  wt_alu
!!# ; 
!!# 
!!# ! add only non-asi and then extend it ( add CASA later ) 
!!# atomics : tSWAP_R | tSWAP_I | tLDSTUB_R | tLDSTUB_I
!!# ;
!!# 
!!# atomics_asi : tSWAPA_R | tSWAPA_I | tLDSTUBA_R | tLDSTUBA_I | tCASA_I | tCASA_R | tCASXA_I | tCASXA_R
!!# ;
!!# 
!!# barier      : tMEMBAR | tSTBAR 
!!# ;
!!# 
!!# 
!!# 
!!# 
!!# %%
!!# %%section cbfunc
!!# 
!!# %%
!!# %%section stat
!!# 
!!# %%
#endif
