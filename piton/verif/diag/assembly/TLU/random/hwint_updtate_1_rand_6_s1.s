// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hwint_updtate_1_rand_6_s1.s
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
   random seed:	641578485
   Jal hwint_updtate_1.j:	
********************************************************************************/



#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#include "my_intr_handlers.s"
#include "my_trap_handlers.s"
#include "tlu_custom_trap_handlers.s"

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:

! Register init code

	setx 0x6a4f8c0beadf517e, %g1, %g0
	setx 0x0645e12d5d8d2ef8, %g1, %g1
	setx 0xce89b773bad7db60, %g1, %g2
	setx 0xc5abd9cac8e31b5e, %g1, %g3
	setx 0xa5c73c1283b63a09, %g1, %g4
	setx 0x9068e5f7267d414c, %g1, %g5
	setx 0x620d0249e5e4f02c, %g1, %g6
	setx 0x11521bf0347950cf, %g1, %g7
	setx 0x6491f7c335149383, %g1, %r16
	setx 0xbe50a01a9d69a231, %g1, %r17
	setx 0x1acc9b7961b83d35, %g1, %r18
	setx 0x60ae6f6d9496f28c, %g1, %r19
	setx 0xbf30598be414264e, %g1, %r20
	setx 0xa83f4a1148b1aee2, %g1, %r21
	setx 0x1ca7de358aaa90b8, %g1, %r22
	setx 0x5d903f36cb5ea12f, %g1, %r23
	setx 0xdb9b7b2506cbcf2e, %g1, %r24
	setx 0xab53974de28b17ab, %g1, %r25
	setx 0xafaba4af0a75a41f, %g1, %r26
	setx 0x010f47ad2098cf24, %g1, %r27
	setx 0xadb32a36162d4445, %g1, %r28
	setx 0x7f22a297c9407447, %g1, %r29
	setx 0xf01391aa44fa71a6, %g1, %r30
	setx 0xf6b5fb3977e65425, %g1, %r31
	save
	setx 0x7d2a05c4db830313, %g1, %r16
	setx 0x983a4ff9e67e9229, %g1, %r17
	setx 0x15343cadfe0db112, %g1, %r18
	setx 0x80b14f0ea4171380, %g1, %r19
	setx 0xe5c9d9c2afa2f793, %g1, %r20
	setx 0xca5b03fa8e6712a4, %g1, %r21
	setx 0x5691f038fd13d673, %g1, %r22
	setx 0x1499851499fa871b, %g1, %r23
	setx 0x1f4fc5294945735f, %g1, %r24
	setx 0xb1e80e14f17cd221, %g1, %r25
	setx 0x08bbd33511cb25b0, %g1, %r26
	setx 0x48ee352adf614c9f, %g1, %r27
	setx 0x7bf530b91cdc2d51, %g1, %r28
	setx 0x17d083f4077f72d8, %g1, %r29
	setx 0xbd15de97437ac70b, %g1, %r30
	setx 0xaf756ece6c50b83a, %g1, %r31
	save
	setx 0x4c63e4c2e06e8226, %g1, %r16
	setx 0xd892e11be0f02573, %g1, %r17
	setx 0xfac39b2a7f2a6aba, %g1, %r18
	setx 0x26ee9abbcceeb781, %g1, %r19
	setx 0x1839fc6bed5adae0, %g1, %r20
	setx 0x46c068f1532a8021, %g1, %r21
	setx 0x6bc6e0faaadc78d3, %g1, %r22
	setx 0x26bfc1a7cd7f4dfb, %g1, %r23
	setx 0xdb44a22579fb90a6, %g1, %r24
	setx 0x1fb2b81c3da83007, %g1, %r25
	setx 0xa7908adfb1780b76, %g1, %r26
	setx 0x36650e4e98a76dd8, %g1, %r27
	setx 0xf62d84de23dfa408, %g1, %r28
	setx 0x9ea81ed71cac87b2, %g1, %r29
	setx 0x629129e5cc8202ce, %g1, %r30
	setx 0x97e0b49203a79a93, %g1, %r31
	save
	setx 0xa3564542ce99f003, %g1, %r16
	setx 0x14c8d09d65ecd871, %g1, %r17
	setx 0x3d8aa7544b97f0be, %g1, %r18
	setx 0x3b7e0fa15d238848, %g1, %r19
	setx 0xe0bba9b7d97bc585, %g1, %r20
	setx 0x3068bb80aab5be63, %g1, %r21
	setx 0x353127122ffb1290, %g1, %r22
	setx 0x81292bb861528928, %g1, %r23
	setx 0xdd145fe3fdfa4eb8, %g1, %r24
	setx 0x96754dea15ee61c9, %g1, %r25
	setx 0x4895d19dc5ef0ebf, %g1, %r26
	setx 0xa46ab8aad8b3a3f8, %g1, %r27
	setx 0x9bcce5cb9d1560dd, %g1, %r28
	setx 0x5f73c0014550ee64, %g1, %r29
	setx 0x7d72da59382d6542, %g1, %r30
	setx 0xf526efbe7dee2b1e, %g1, %r31
	save
	setx 0xd3cd8aeb33838944, %g1, %r16
	setx 0x320e672c6cea2e4d, %g1, %r17
	setx 0xece2a021589ef4be, %g1, %r18
	setx 0xbb4edd4555842e85, %g1, %r19
	setx 0x6f572f772f17f423, %g1, %r20
	setx 0xd42d7f652feea018, %g1, %r21
	setx 0x6c442db61cf85aaa, %g1, %r22
	setx 0x2005ac77aaf4a65f, %g1, %r23
	setx 0x68c6283a2ae6ead1, %g1, %r24
	setx 0x932f34556d646932, %g1, %r25
	setx 0x656b52c88f1a24f8, %g1, %r26
	setx 0xabd9852ce159fb8f, %g1, %r27
	setx 0x78cab60263046cf6, %g1, %r28
	setx 0xa304310d584d83af, %g1, %r29
	setx 0x5301a629df71c594, %g1, %r30
	setx 0x3028c0b2d1b1a620, %g1, %r31
	save
	setx 0x064240c80de534cd, %g1, %r16
	setx 0x4a0070f1e7e4711e, %g1, %r17
	setx 0x593f19f017a063be, %g1, %r18
	setx 0x7cc4f86e989bcbbc, %g1, %r19
	setx 0x768606b17ba38be7, %g1, %r20
	setx 0xc4ad78dd09290bda, %g1, %r21
	setx 0xa7c97a4c2fa72bb8, %g1, %r22
	setx 0xff1568fc27b73be9, %g1, %r23
	setx 0x9bf902343626d79d, %g1, %r24
	setx 0xf3fb2e767027c603, %g1, %r25
	setx 0x4d24def8de5a82c9, %g1, %r26
	setx 0x09063262582941b9, %g1, %r27
	setx 0xdf2bdefd61999f2a, %g1, %r28
	setx 0x5aec50058027717a, %g1, %r29
	setx 0xea3a5e7a64a5100e, %g1, %r30
	setx 0xea0aaa97bbf315e4, %g1, %r31
	save
	setx 0xe7ca61d1f196c68a, %g1, %r16
	setx 0x4cfa52c3a79dfaee, %g1, %r17
	setx 0x04509449c2e82586, %g1, %r18
	setx 0xf564383fc7bd313a, %g1, %r19
	setx 0x51f12eb0beeab997, %g1, %r20
	setx 0xf2f4b315fa719e02, %g1, %r21
	setx 0x2810627d061b62c1, %g1, %r22
	setx 0x04a59cf3157dcfe0, %g1, %r23
	setx 0xf1b6a93f3e27fa14, %g1, %r24
	setx 0xd14f79475f819cd3, %g1, %r25
	setx 0xafba94d27f694e9b, %g1, %r26
	setx 0x5eaf5cc071555eeb, %g1, %r27
	setx 0x70df6bb0aef2efa5, %g1, %r28
	setx 0x27cc018508d49def, %g1, %r29
	setx 0x2371190930cd92d4, %g1, %r30
	setx 0xc48b5852f142deb8, %g1, %r31
	save
	setx 0x3e96bf578f91403d, %g1, %r16
	setx 0x226038de30b6a44b, %g1, %r17
	setx 0x3f2577b57bce143f, %g1, %r18
	setx 0x19ee23efd839cf8e, %g1, %r19
	setx 0x109e0c87afa76ce4, %g1, %r20
	setx 0x19b32d3bb3c47076, %g1, %r21
	setx 0xa6fad2c3d51edd6d, %g1, %r22
	setx 0xf3f26ed31e63cb99, %g1, %r23
	setx 0xd87a9fe6eb531625, %g1, %r24
	setx 0x8618233dc02de705, %g1, %r25
	setx 0x7e8eed66ab2cf169, %g1, %r26
	setx 0xc73b6d0653bd2db7, %g1, %r27
	setx 0x5b4584152fb733fe, %g1, %r28
	setx 0x8cea84d9736be2c4, %g1, %r29
	setx 0x9bf6ba1b14682227, %g1, %r30
	setx 0x7f41aa8ba12fb56a, %g1, %r31
	ta	T_CHANGE_HPRIV
	wrpr	%g0, 0, %pil
	wr	%g0, 4, %fprs
	setx	data_start_0, %r1, %g7
	ldd	[%g7+0], %f0
	ldd	[%g7+8], %f2
	ldd	[%g7+16], %f4
	ldd	[%g7+24], %f6
	ldd	[%g7+32], %f8
	ldd	[%g7+40], %f10
	ldd	[%g7+48], %f12
	ldd	[%g7+56], %f14
	ldd	[%g7+64], %f16
	ldd	[%g7+72], %f18
	ldd	[%g7+80], %f20
	ldd	[%g7+88], %f22
	ldd	[%g7+96], %f24
	ldd	[%g7+104], %f26
	ldd	[%g7+112], %f28
	ldd	[%g7+120], %f30
	ldd	[%g7+128], %f32
	ldd	[%g7+136], %f34
	ldd	[%g7+144], %f36
	ldd	[%g7+152], %f38
	ldd	[%g7+160], %f40
	ldd	[%g7+168], %f42
	ldd	[%g7+176], %f44
	ldd	[%g7+184], %f46
	ldd	[%g7+192], %f48
	ldd	[%g7+200], %f50
	ldd	[%g7+208], %f52
	ldd	[%g7+216], %f54
	ldd	[%g7+224], %f56
	ldd	[%g7+232], %f58
	ldd	[%g7+240], %f60
	ldd	[%g7+248], %f62
	setx	fsr_data, %r1, %g7
	stx	%fsr, [%g7]
	ldx	[%g7], %g4
	setx	%hi(0x0f000000), %g1, %g3
	or	%g4, %g3, %g4
	stx	%g4, [%g7]
	ldx	[%g7], %fsr
	setx	%hi(0x1ffe0000f), %g1, %g2
	stxa	%g2, [%g0] 0x45
	mov	0x38, %g3
	setx	data_start_0, %g1, %g2
	stxa	%g2, [%g3] 0x58
Init_scratchpad:
	wr	%g0, 0x4f, %asi
	stxa	%l0, [0x0] %asi
	stxa	%l1, [0x8] %asi
	stxa	%l2, [0x10] %asi
	stxa	%l3, [0x18] %asi
	stxa	%l4, [0x20] %asi
	stxa	%l5, [0x28] %asi
	stxa	%l6, [0x30] %asi
	stxa	%l7, [0x38] %asi
	ta	T_CHANGE_NONHPRIV
	ta	%icc, T_RD_THID
! fork: source strm = 0xffffffff; target strm = 0x2
	cmp	%o1, 1
	setx	fork_lbl_0_1, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x4
	cmp	%o1, 2
	setx	fork_lbl_0_2, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x8
	cmp	%o1, 3
	setx	fork_lbl_0_3, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
cpu_intr_0_0:
	setx	0x1b0331, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_1:
	setx	0x1b0113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_0), 16, 16)) -> intp(0, 0, 37)
	.word 0xbbe421a7  ! 10: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_wr_0:
	mov	0x38, %r14
	.word 0xf8f384a0  ! 11: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb1e58000  ! 14: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_rd_0:
	mov	0x24, %r14
	.word 0xf4db8e40  ! 20: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb01d6028  ! 22: XOR_I	xor 	%r21, 0x0028, %r24
iob_intr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_1), 16, 16)) -> intp(0, 0, a)
	.word 0xbe9d0000  ! 26: XORcc_R	xorcc 	%r20, %r0, %r31
	.word 0xb6a4a160  ! 28: SUBcc_I	subcc 	%r18, 0x0160, %r27
iob_intr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_2), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbbe4210c  ! 38: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_3), 16, 16)) -> intp(0, 0, 15)
iob_intr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_4), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_rd_1:
	mov	0x15, %r14
	.word 0xf8db8e60  ! 42: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb3e48000  ! 43: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_5), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_rd_2:
	mov	0x34, %r14
	.word 0xfadb8e60  ! 50: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb9e58000  ! 51: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_6), 16, 16)) -> intp(0, 0, 2)
	.word 0xb1e4c000  ! 53: SAVE_R	save	%r19, %r0, %r24
iob_intr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_7), 16, 16)) -> intp(0, 0, 34)
	.word 0xb1e5e0c6  ! 55: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5e54000  ! 60: SAVE_R	save	%r21, %r0, %r26
	.word 0xb5e4e1f3  ! 62: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_wr_1:
	mov	0x20, %r14
	.word 0xf2f389e0  ! 64: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T0_asi_reg_rd_3:
	mov	0x3c4, %r14
	.word 0xf6db8400  ! 66: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb9e44000  ! 67: SAVE_R	save	%r17, %r0, %r28
cpu_intr_0_2:
	setx	0x1d0017, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_2:
	mov	0xa, %r14
	.word 0xf0f38e80  ! 71: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T0_asi_reg_rd_4:
	mov	0x3c0, %r14
	.word 0xfadb8e60  ! 74: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbbe40000  ! 75: SAVE_R	save	%r16, %r0, %r29
	.word 0xb1e40000  ! 76: SAVE_R	save	%r16, %r0, %r24
	.word 0xbfe4c000  ! 77: SAVE_R	save	%r19, %r0, %r31
	.word 0x8595a010  ! 82: WRPR_TSTATE_I	wrpr	%r22, 0x0010, %tstate
T0_asi_reg_rd_5:
	mov	0x1d, %r14
	.word 0xf2db84a0  ! 83: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbde5c000  ! 84: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_8), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_rd_6:
	mov	0x11, %r14
	.word 0xf6db8e60  ! 87: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_0_3:
	setx	0x1c0323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_9), 16, 16)) -> intp(0, 0, 5)
	.word 0xb7e5e0cc  ! 92: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_wr_3:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 93: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_10), 16, 16)) -> intp(0, 0, 0)
	.word 0xbde56089  ! 97: SAVE_I	save	%r21, 0x0001, %r30
iob_intr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_11), 16, 16)) -> intp(0, 0, 26)
iob_intr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_12), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_rd_7:
	mov	0x2b, %r14
	.word 0xf6db89e0  ! 103: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb3e5c000  ! 105: SAVE_R	save	%r23, %r0, %r25
	.word 0xb29cc000  ! 106: XORcc_R	xorcc 	%r19, %r0, %r25
	.word 0xb7e5c000  ! 107: SAVE_R	save	%r23, %r0, %r27
	.word 0xb1e5617f  ! 108: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde5219d  ! 110: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbbe40000  ! 111: SAVE_R	save	%r16, %r0, %r29
	.word 0xbfe58000  ! 112: SAVE_R	save	%r22, %r0, %r31
	.word 0xbfe50000  ! 116: SAVE_R	save	%r20, %r0, %r31
	.word 0xb1e4e188  ! 117: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_rd_8:
	mov	0x3c0, %r14
	.word 0xf0db84a0  ! 120: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb7e48000  ! 125: SAVE_R	save	%r18, %r0, %r27
	.word 0xb1e50000  ! 126: SAVE_R	save	%r20, %r0, %r24
	.word 0xb6b5a0b4  ! 128: SUBCcc_I	orncc 	%r22, 0x00b4, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde56083  ! 131: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb134a001  ! 133: SRL_I	srl 	%r18, 0x0001, %r24
iob_intr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_13), 16, 16)) -> intp(0, 0, 3e)
iob_intr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_14), 16, 16)) -> intp(0, 0, 8)
iob_intr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_15), 16, 16)) -> intp(0, 0, 9)
iob_intr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_16), 16, 16)) -> intp(0, 0, 36)
	.word 0xb1e40000  ! 144: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_wr_4:
	mov	0x4, %r14
	.word 0xf4f38e80  ! 147: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb5e46029  ! 149: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_17), 16, 16)) -> intp(0, 0, 2b)
cpu_intr_0_4:
	setx	0x1d0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6858000  ! 152: ADDcc_R	addcc 	%r22, %r0, %r27
iob_intr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_18), 16, 16)) -> intp(0, 0, 37)
	.word 0xb9e4e171  ! 155: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_5:
	setx	0x1c0318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_19), 16, 16)) -> intp(0, 0, 23)
iob_intr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_20), 16, 16)) -> intp(0, 0, 3d)
iob_intr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_21), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_rd_9:
	mov	0x3c8, %r14
	.word 0xfcdb8e40  ! 160: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_22), 16, 16)) -> intp(0, 0, 18)
	.word 0xb9e4217b  ! 166: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbd540000  ! 170: RDPR_GL	<illegal instruction>
cpu_intr_0_6:
	setx	0x1c0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e54000  ! 178: SAVE_R	save	%r21, %r0, %r25
cpu_intr_0_7:
	setx	0x1f0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e52064  ! 181: SAVE_I	save	%r20, 0x0001, %r25
iob_intr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_23), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb9504000  ! 183: RDPR_TNPC	<illegal instruction>
	.word 0xb68d0000  ! 184: ANDcc_R	andcc 	%r20, %r0, %r27
cpu_intr_0_8:
	setx	0x1c020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_10:
	mov	0x3c3, %r14
	.word 0xfcdb89e0  ! 187: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_24), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_rd_11:
	mov	0x2d, %r14
	.word 0xf0db89e0  ! 189: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_0_9:
	setx	0x1e0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a1ef  ! 198: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1e46183  ! 199: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e48000  ! 201: SAVE_R	save	%r18, %r0, %r26
iob_intr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_25), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb7e4e143  ! 205: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb8146198  ! 206: OR_I	or 	%r17, 0x0198, %r28
cpu_intr_0_10:
	setx	0x1f033c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_12:
	mov	0x7, %r14
	.word 0xf8db84a0  ! 214: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbfe40000  ! 219: SAVE_R	save	%r16, %r0, %r31
T0_asi_reg_rd_13:
	mov	0x26, %r14
	.word 0xf8db8400  ! 220: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_26), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_rd_14:
	mov	0x3c4, %r14
	.word 0xfadb8e60  ! 224: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbbe4a018  ! 225: SAVE_I	save	%r18, 0x0001, %r29
cpu_intr_0_11:
	setx	0x1e0006, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_27), 16, 16)) -> intp(0, 0, 31)
cpu_intr_0_12:
	setx	0x1e032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5c000  ! 236: SAVE_R	save	%r23, %r0, %r30
	.word 0xbde4c000  ! 237: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_28), 16, 16)) -> intp(0, 0, 3c)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbde4e08d  ! 243: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_wr_5:
	mov	0x3c1, %r14
	.word 0xf2f38e60  ! 245: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb615c000  ! 247: OR_R	or 	%r23, %r0, %r27
cpu_intr_0_13:
	setx	0x1f0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 249: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_14:
	setx	0x1f010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_29), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_30), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_15:
	setx	0x1e0137, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_6:
	mov	0x33, %r14
	.word 0xfcf38400  ! 264: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbe946014  ! 267: ORcc_I	orcc 	%r17, 0x0014, %r31
iob_intr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_31), 16, 16)) -> intp(0, 0, b)
T0_asi_reg_wr_7:
	mov	0x23, %r14
	.word 0xf6f38e80  ! 269: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_0_16:
	setx	0x1f0006, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_32), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbd2dc000  ! 273: SLL_R	sll 	%r23, %r0, %r30
iob_intr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_33), 16, 16)) -> intp(0, 0, d)
	.word 0xb5e58000  ! 276: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_17:
	setx	0x1c032b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_18:
	setx	0x1f0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e148  ! 286: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7e58000  ! 288: SAVE_R	save	%r22, %r0, %r27
	.word 0xbde4e121  ! 289: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_34), 16, 16)) -> intp(0, 0, 37)
cpu_intr_0_19:
	setx	0x1c0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 293: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_rd_15:
	mov	0x29, %r14
	.word 0xf4db89e0  ! 295: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb5e560a1  ! 298: SAVE_I	save	%r21, 0x0001, %r26
cpu_intr_0_20:
	setx	0x1d0233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_21:
	setx	0x1d0310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 306: SAVE_R	save	%r21, %r0, %r24
iob_intr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_35), 16, 16)) -> intp(0, 0, d)
	.word 0xbde5c000  ! 310: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_rd_16:
	mov	0x3c3, %r14
	.word 0xf4db89e0  ! 311: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb1e5a190  ! 313: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e520fb  ! 315: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb5e44000  ! 316: SAVE_R	save	%r17, %r0, %r26
cpu_intr_0_22:
	setx	0x1e013e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_36), 16, 16)) -> intp(0, 0, d)
	.word 0xb7e4219f  ! 330: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb02d215a  ! 331: ANDN_I	andn 	%r20, 0x015a, %r24
	.word 0xb9e560a2  ! 332: SAVE_I	save	%r21, 0x0001, %r28
T0_asi_reg_rd_17:
	mov	0x3c1, %r14
	.word 0xf2db8e40  ! 334: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbbe44000  ! 335: SAVE_R	save	%r17, %r0, %r29
	.word 0xb694c000  ! 336: ORcc_R	orcc 	%r19, %r0, %r27
	.word 0xbde461fd  ! 340: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb1e40000  ! 344: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_37), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb5e5c000  ! 346: SAVE_R	save	%r23, %r0, %r26
T0_asi_reg_rd_18:
	mov	0x1b, %r14
	.word 0xf8db8400  ! 347: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_0_23:
	setx	0x1c0201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_38), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_rd_19:
	mov	0x3c6, %r14
	.word 0xf4db8400  ! 354: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_39), 16, 16)) -> intp(0, 0, 33)
	.word 0xb5e561f1  ! 358: SAVE_I	save	%r21, 0x0001, %r26
cpu_intr_0_24:
	setx	0x1e0028, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_8:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 363: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_25:
	setx	0x1011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_20:
	mov	0x1b, %r14
	.word 0xf0db8e40  ! 366: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_wr_9:
	mov	0x21, %r14
	.word 0xf6f38e40  ! 369: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e58000  ! 372: SAVE_R	save	%r22, %r0, %r28
T0_asi_reg_rd_21:
	mov	0x2b, %r14
	.word 0xfcdb8e40  ! 374: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbe9da1e7  ! 376: XORcc_I	xorcc 	%r22, 0x01e7, %r31
	.word 0xba2dc000  ! 377: ANDN_R	andn 	%r23, %r0, %r29
T0_asi_reg_rd_22:
	mov	0x3c1, %r14
	.word 0xf4db84a0  ! 380: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbbe48000  ! 381: SAVE_R	save	%r18, %r0, %r29
	.word 0xbfe58000  ! 383: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_40), 16, 16)) -> intp(0, 0, 9)
T0_asi_reg_wr_10:
	mov	0x31, %r14
	.word 0xfcf384a0  ! 389: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T0_asi_reg_wr_11:
	mov	0x33, %r14
	.word 0xfef38400  ! 392: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_0_26:
	setx	0x1d011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e1f9  ! 398: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_41), 16, 16)) -> intp(0, 0, e)
	.word 0xbb3c1000  ! 404: SRAX_R	srax	%r16, %r0, %r29
	.word 0xb7e5e0b4  ! 407: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb1e58000  ! 409: SAVE_R	save	%r22, %r0, %r24
	.word 0xbfe5a103  ! 410: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe44000  ! 418: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_42), 16, 16)) -> intp(0, 0, 3e)
T0_asi_reg_rd_23:
	mov	0x38, %r14
	.word 0xf6db8400  ! 424: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb7e5a1a3  ! 425: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_43), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_27:
	setx	0x1e023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e0e0  ! 428: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_44), 16, 16)) -> intp(0, 0, 32)
cpu_intr_0_28:
	setx	0x1e0310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcace153  ! 431: ANDNcc_I	andncc 	%r19, 0x0153, %r30
	.word 0xb5e46150  ! 434: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_wr_12:
	mov	0x3c7, %r14
	.word 0xf4f38e80  ! 435: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xbfe5e123  ! 436: SAVE_I	save	%r23, 0x0001, %r31
iob_intr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_45), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_46), 16, 16)) -> intp(0, 0, 19)
	.word 0xbde421a9  ! 439: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbfe5219e  ! 440: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_47), 16, 16)) -> intp(0, 0, 4)
cpu_intr_0_29:
	setx	0x1f0332, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_30:
	setx	0x1d003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40d8000  ! 449: AND_R	and 	%r22, %r0, %r26
	.word 0xb9e52137  ! 452: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e4e140  ! 454: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb5e5c000  ! 459: SAVE_R	save	%r23, %r0, %r26
	.word 0xbbe50000  ! 464: SAVE_R	save	%r20, %r0, %r29
iob_intr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_48), 16, 16)) -> intp(0, 0, 13)
	.word 0xbde5c000  ! 466: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_31:
	setx	0x22020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_49), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_50), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbfe50000  ! 477: SAVE_R	save	%r20, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_32:
	setx	0x23013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_13:
	mov	0x31, %r14
	.word 0xf4f389e0  ! 487: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_0_33:
	setx	0x23002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd2dc000  ! 490: SLL_R	sll 	%r23, %r0, %r30
cpu_intr_0_34:
	setx	0x210317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5c000  ! 496: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_51), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_wr_14:
	mov	0x3c5, %r14
	.word 0xf0f38e60  ! 498: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_0_35:
	setx	0x200016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5504000  ! 503: RDPR_TNPC	<illegal instruction>
	.word 0xb0840000  ! 507: ADDcc_R	addcc 	%r16, %r0, %r24
cpu_intr_0_36:
	setx	0x22022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 510: SAVE_R	save	%r20, %r0, %r31
	.word 0xb6a48000  ! 511: SUBcc_R	subcc 	%r18, %r0, %r27
cpu_intr_0_37:
	setx	0x22021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_52), 16, 16)) -> intp(0, 0, 15)
cpu_intr_0_38:
	setx	0x23021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e56071  ! 516: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3e5e118  ! 517: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde4a1d6  ! 518: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_53), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_rd_24:
	mov	0x3c5, %r14
	.word 0xf6db8e60  ! 524: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T0_asi_reg_wr_15:
	mov	0x3c1, %r14
	.word 0xf2f38e60  ! 525: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb5e40000  ! 526: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_rd_25:
	mov	0x1, %r14
	.word 0xfedb8e40  ! 527: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbde50000  ! 528: SAVE_R	save	%r20, %r0, %r30
	.word 0xbde420f4  ! 529: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_39:
	setx	0x23011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbbe46018  ! 536: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_54), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_55), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_56), 16, 16)) -> intp(0, 0, 38)
cpu_intr_0_40:
	setx	0x220226, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_16:
	mov	0x27, %r14
	.word 0xfcf38e40  ! 552: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_wr_17:
	mov	0x3, %r14
	.word 0xfaf38e40  ! 553: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_57), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb21ca10f  ! 557: XOR_I	xor 	%r18, 0x010f, %r25
	.word 0xbbe40000  ! 558: SAVE_R	save	%r16, %r0, %r29
cpu_intr_0_41:
	setx	0x210208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e560f3  ! 561: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_wr_18:
	mov	0x3c1, %r14
	.word 0xfcf38400  ! 562: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T0_asi_reg_rd_26:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 563: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_0_42:
	setx	0x210030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_43:
	setx	0x230136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e48000  ! 572: SAVE_R	save	%r18, %r0, %r28
	.word 0xb53db001  ! 573: SRAX_I	srax	%r22, 0x0001, %r26
	.word 0xbde5603d  ! 576: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb61ca120  ! 577: XOR_I	xor 	%r18, 0x0120, %r27
	.word 0xb5e461e2  ! 579: SAVE_I	save	%r17, 0x0001, %r26
cpu_intr_0_44:
	setx	0x21031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe54000  ! 585: SAVE_R	save	%r21, %r0, %r29
cpu_intr_0_45:
	setx	0x210332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 588: SAVE_R	save	%r22, %r0, %r25
	.word 0xb3e5a099  ! 589: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9e5c000  ! 591: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_58), 16, 16)) -> intp(0, 0, 1e)
cpu_intr_0_46:
	setx	0x22010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb29421d8  ! 599: ORcc_I	orcc 	%r16, 0x01d8, %r25
T0_asi_reg_wr_19:
	mov	0x9, %r14
	.word 0xf4f389e0  ! 602: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb0ad212f  ! 603: ANDNcc_I	andncc 	%r20, 0x012f, %r24
iob_intr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_59), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb7e5e02f  ! 607: SAVE_I	save	%r23, 0x0001, %r27
iob_intr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_60), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_wr_20:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 610: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_wr_21:
	mov	0x3c6, %r14
	.word 0xf4f38400  ! 615: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_61), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_rd_27:
	mov	0x12, %r14
	.word 0xfedb8e40  ! 620: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbfe40000  ! 621: SAVE_R	save	%r16, %r0, %r31
	.word 0xb1e4a1ac  ! 623: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb37d4400  ! 625: MOVR_R	movre	%r21, %r0, %r25
	.word 0xb9e48000  ! 626: SAVE_R	save	%r18, %r0, %r28
	.word 0xb7e50000  ! 627: SAVE_R	save	%r20, %r0, %r27
	.word 0xbd500000  ! 628: RDPR_TPC	<illegal instruction>
T0_asi_reg_rd_28:
	mov	0x10, %r14
	.word 0xfedb8e60  ! 636: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb1e48000  ! 637: SAVE_R	save	%r18, %r0, %r24
	.word 0xbc8de02a  ! 641: ANDcc_I	andcc 	%r23, 0x002a, %r30
iob_intr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_62), 16, 16)) -> intp(0, 0, 3d)
	.word 0xba1d4000  ! 643: XOR_R	xor 	%r21, %r0, %r29
	.word 0xb1e54000  ! 646: SAVE_R	save	%r21, %r0, %r24
T0_asi_reg_wr_22:
	mov	0x3c8, %r14
	.word 0xfcf38e60  ! 647: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb52d8000  ! 651: SLL_R	sll 	%r22, %r0, %r26
	.word 0xb3e4c000  ! 653: SAVE_R	save	%r19, %r0, %r25
iob_intr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_63), 16, 16)) -> intp(0, 0, 5)
	.word 0xbbe4c000  ! 656: SAVE_R	save	%r19, %r0, %r29
	.word 0xb2354000  ! 661: SUBC_R	orn 	%r21, %r0, %r25
cpu_intr_0_47:
	setx	0x220334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2154000  ! 664: OR_R	or 	%r21, %r0, %r25
iob_intr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_64), 16, 16)) -> intp(0, 0, 11)
iob_intr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_65), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_wr_23:
	mov	0x2e, %r14
	.word 0xfaf38400  ! 671: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbfe50000  ! 673: SAVE_R	save	%r20, %r0, %r31
	.word 0xbbe4605a  ! 677: SAVE_I	save	%r17, 0x0001, %r29
cpu_intr_0_48:
	setx	0x220014, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_24:
	mov	0x3c6, %r14
	.word 0xfcf38e40  ! 681: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbebd0000  ! 682: XNORcc_R	xnorcc 	%r20, %r0, %r31
cpu_intr_0_49:
	setx	0x220000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_50:
	setx	0x220131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_51:
	setx	0x23002d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_25:
	mov	0x1, %r14
	.word 0xf0f38e60  ! 696: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb1e4203c  ! 698: SAVE_I	save	%r16, 0x0001, %r24
cpu_intr_0_52:
	setx	0x230306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e460f5  ! 701: SAVE_I	save	%r17, 0x0001, %r24
iob_intr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_66), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbfe58000  ! 703: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_67), 16, 16)) -> intp(0, 0, 2a)
iob_intr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_68), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_69), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_53:
	setx	0x210227, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_70), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_rd_29:
	mov	0x37, %r14
	.word 0xf0db89e0  ! 721: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb7e5a088  ! 723: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_71), 16, 16)) -> intp(0, 0, 33)
	.word 0xb9e40000  ! 725: SAVE_R	save	%r16, %r0, %r28
	.word 0xbf3de001  ! 726: SRA_I	sra 	%r23, 0x0001, %r31
T0_asi_reg_wr_26:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 729: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7e50000  ! 730: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_54:
	setx	0x20010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_55:
	setx	0x22001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e10f  ! 733: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1341000  ! 735: SRLX_R	srlx	%r16, %r0, %r24
	.word 0xbfe54000  ! 737: SAVE_R	save	%r21, %r0, %r31
	.word 0xbde54000  ! 740: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_72), 16, 16)) -> intp(0, 0, 16)
T0_asi_reg_wr_27:
	mov	0x3c8, %r14
	.word 0xf0f38e80  ! 746: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbe3d2132  ! 747: XNOR_I	xnor 	%r20, 0x0132, %r31
T0_asi_reg_rd_30:
	mov	0x1b, %r14
	.word 0xf0db8e40  ! 749: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_rd_31:
	mov	0x3c2, %r14
	.word 0xf6db8e80  ! 750: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbbe40000  ! 752: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_73), 16, 16)) -> intp(0, 0, 32)
cpu_intr_0_56:
	setx	0x20030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_28:
	mov	0x22, %r14
	.word 0xf0f38e80  ! 764: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb835a0a9  ! 766: SUBC_I	orn 	%r22, 0x00a9, %r28
iob_intr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_74), 16, 16)) -> intp(0, 0, 31)
	.word 0xbb2ce001  ! 768: SLL_I	sll 	%r19, 0x0001, %r29
	.word 0xb73c2001  ! 769: SRA_I	sra 	%r16, 0x0001, %r27
	.word 0xbbe420a5  ! 771: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_75), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_57:
	setx	0x20001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e521ea  ! 775: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1e461db  ! 778: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbfe50000  ! 780: SAVE_R	save	%r20, %r0, %r31
	.word 0xb73d1000  ! 783: SRAX_R	srax	%r20, %r0, %r27
T0_asi_reg_wr_29:
	mov	0x26, %r14
	.word 0xfaf38e40  ! 785: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_32:
	mov	0x2e, %r14
	.word 0xf4db84a0  ! 786: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_76), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_wr_30:
	mov	0x3c4, %r14
	.word 0xf2f38e60  ! 796: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb7e46035  ! 797: SAVE_I	save	%r17, 0x0001, %r27
iob_intr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_77), 16, 16)) -> intp(0, 0, b)
	.word 0xb1e5a1c3  ! 801: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde520fc  ! 803: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbbe58000  ! 805: SAVE_R	save	%r22, %r0, %r29
iob_intr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_78), 16, 16)) -> intp(0, 0, 2d)
	.word 0xba1da110  ! 809: XOR_I	xor 	%r22, 0x0110, %r29
	.word 0xb5e4c000  ! 810: SAVE_R	save	%r19, %r0, %r26
cpu_intr_0_58:
	setx	0x210026, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_31:
	mov	0x2f, %r14
	.word 0xf6f384a0  ! 816: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbbe561af  ! 823: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_59:
	setx	0x230001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa40000  ! 826: SUBcc_R	subcc 	%r16, %r0, %r29
	.word 0xbde4c000  ! 832: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_60:
	setx	0x220007, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_61:
	setx	0x230233, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_79), 16, 16)) -> intp(0, 0, 7)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_80), 16, 16)) -> intp(0, 0, 3f)
	.word 0xbfe5a1e1  ! 844: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_81), 16, 16)) -> intp(0, 0, 31)
cpu_intr_0_62:
	setx	0x23033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5604f  ! 851: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_rd_33:
	mov	0x27, %r14
	.word 0xf6db8e40  ! 853: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_rd_34:
	mov	0x3c0, %r14
	.word 0xf6db8400  ! 854: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_0_63:
	setx	0x20022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde48000  ! 859: SAVE_R	save	%r18, %r0, %r30
	.word 0xb5e421d9  ! 860: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_82), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbde50000  ! 866: SAVE_R	save	%r20, %r0, %r30
	.word 0xb9e50000  ! 867: SAVE_R	save	%r20, %r0, %r28
	.word 0xbfe4a122  ! 870: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb08d8000  ! 874: ANDcc_R	andcc 	%r22, %r0, %r24
	.word 0xb7e4c000  ! 875: SAVE_R	save	%r19, %r0, %r27
	.word 0xb3e560cb  ! 877: SAVE_I	save	%r21, 0x0001, %r25
cpu_intr_0_64:
	setx	0x230339, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_32:
	mov	0x17, %r14
	.word 0xf6f38e60  ! 879: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb21d2020  ! 880: XOR_I	xor 	%r20, 0x0020, %r25
iob_intr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_83), 16, 16)) -> intp(0, 0, 29)
	.word 0xb2b5615a  ! 885: ORNcc_I	orncc 	%r21, 0x015a, %r25
iob_intr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_84), 16, 16)) -> intp(0, 0, 38)
cpu_intr_0_65:
	setx	0x22001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_85), 16, 16)) -> intp(0, 0, 7)
	.word 0xb7e48000  ! 895: SAVE_R	save	%r18, %r0, %r27
	.word 0xb5e5c000  ! 896: SAVE_R	save	%r23, %r0, %r26
	.word 0xb9e5e1a6  ! 897: SAVE_I	save	%r23, 0x0001, %r28
iob_intr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_86), 16, 16)) -> intp(0, 0, 16)
T0_asi_reg_wr_33:
	mov	0x3c3, %r14
	.word 0xf0f38e80  ! 899: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_87), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbbe521ac  ! 903: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_66:
	setx	0x200311, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_67:
	setx	0x210109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3643801  ! 914: MOVcc_I	<illegal instruction>
	.word 0xb1e40000  ! 918: SAVE_R	save	%r16, %r0, %r24
	.word 0xb5e58000  ! 919: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_68:
	setx	0x200023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4205a  ! 924: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_rd_35:
	mov	0x2d, %r14
	.word 0xf4db8e40  ! 926: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T0_asi_reg_wr_34:
	mov	0x3c3, %r14
	.word 0xfcf38400  ! 927: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbd2cc000  ! 928: SLL_R	sll 	%r19, %r0, %r30
cpu_intr_0_69:
	setx	0x27030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_36:
	mov	0x13, %r14
	.word 0xf8db8e40  ! 931: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb5e5e0bb  ! 934: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_rd_37:
	mov	0x2, %r14
	.word 0xf0db8e60  ! 936: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbde5c000  ! 939: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_70:
	setx	0x260131, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_88), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_wr_35:
	mov	0x15, %r14
	.word 0xf8f38e40  ! 945: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbbe40000  ! 949: SAVE_R	save	%r16, %r0, %r29
	.word 0xb7e520e2  ! 950: SAVE_I	save	%r20, 0x0001, %r27
T0_asi_reg_rd_38:
	mov	0x13, %r14
	.word 0xf4db8e40  ! 952: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbfe40000  ! 953: SAVE_R	save	%r16, %r0, %r31
	.word 0xbf340000  ! 954: SRL_R	srl 	%r16, %r0, %r31
	.word 0xb3e5e01a  ! 958: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbd540000  ! 960: RDPR_GL	<illegal instruction>
T0_asi_reg_rd_39:
	mov	0x32, %r14
	.word 0xf6db8e40  ! 961: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbfe4a049  ! 962: SAVE_I	save	%r18, 0x0001, %r31
iob_intr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_89), 16, 16)) -> intp(0, 0, 3)
	.word 0xb0b5217d  ! 965: ORNcc_I	orncc 	%r20, 0x017d, %r24
T0_asi_reg_wr_36:
	mov	0x11, %r14
	.word 0xfcf384a0  ! 968: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_90), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_rd_40:
	mov	0x3c4, %r14
	.word 0xf4db84a0  ! 974: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_91), 16, 16)) -> intp(0, 0, 8)
	.word 0xb5e521f3  ! 977: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_92), 16, 16)) -> intp(0, 0, 3d)
iob_intr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_93), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb1e50000  ! 980: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_71:
	setx	0x27013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 985: SAVE_R	save	%r20, %r0, %r31
	.word 0xb9e4a150  ! 986: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_94), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb1e58000  ! 989: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_72:
	setx	0x25031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe56029  ! 991: SAVE_I	save	%r21, 0x0001, %r29
	.word 0x8f902002  ! 994: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
T0_asi_reg_wr_37:
	mov	0x24, %r14
	.word 0xfaf389e0  ! 997: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_95), 16, 16)) -> intp(0, 0, c)
cpu_intr_0_73:
	setx	0x270201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_96), 16, 16)) -> intp(0, 0, a)
	.word 0xbbe4e199  ! 1003: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_97), 16, 16)) -> intp(0, 0, 14)
	.word 0xb3e42033  ! 1009: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_98), 16, 16)) -> intp(0, 0, 3c)
T0_asi_reg_rd_41:
	mov	0x3, %r14
	.word 0xfcdb8e40  ! 1011: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_99), 16, 16)) -> intp(0, 0, 3)
T0_asi_reg_rd_42:
	mov	0x28, %r14
	.word 0xf2db8400  ! 1016: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_0_74:
	setx	0x240322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_75:
	setx	0x26013b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_76:
	setx	0x25031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_43:
	mov	0x3c5, %r14
	.word 0xfedb8e60  ! 1024: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb12da001  ! 1027: SLL_I	sll 	%r22, 0x0001, %r24
	.word 0xb28cc000  ! 1029: ANDcc_R	andcc 	%r19, %r0, %r25
T0_asi_reg_wr_38:
	mov	0x2a, %r14
	.word 0xfcf38400  ! 1030: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_100), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb1e50000  ! 1033: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_101), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_rd_44:
	mov	0xb, %r14
	.word 0xfedb8400  ! 1044: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_102), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_rd_45:
	mov	0x16, %r14
	.word 0xf0db8e40  ! 1046: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbbe5c000  ! 1048: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_rd_46:
	mov	0x28, %r14
	.word 0xf4db8e40  ! 1049: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_103), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_wr_39:
	mov	0x3c2, %r14
	.word 0xf0f38400  ! 1053: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbfe5e194  ! 1056: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e5611d  ! 1057: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb1e5a14b  ! 1063: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_rd_47:
	mov	0x3, %r14
	.word 0xf6db8e40  ! 1064: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_wr_40:
	mov	0x2, %r14
	.word 0xf6f38400  ! 1065: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T0_asi_reg_rd_48:
	mov	0x2d, %r14
	.word 0xfadb8400  ! 1067: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb5e4e00b  ! 1068: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_104), 16, 16)) -> intp(0, 0, 21)
	.word 0xb5e5a17f  ! 1072: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_77:
	setx	0x25010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 1075: SAVE_R	save	%r22, %r0, %r26
	.word 0xbfe54000  ! 1078: SAVE_R	save	%r21, %r0, %r31
	.word 0xbbe5c000  ! 1081: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_105), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_rd_49:
	mov	0x2c, %r14
	.word 0xf8db89e0  ! 1085: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0x87956157  ! 1087: WRPR_TT_I	wrpr	%r21, 0x0157, %tt
iob_intr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_106), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_107), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_78:
	setx	0x270203, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_108), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_rd_50:
	mov	0x24, %r14
	.word 0xfadb8e40  ! 1099: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb3e42060  ! 1102: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_rd_51:
	mov	0x1f, %r14
	.word 0xf4db8e60  ! 1103: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb3e56026  ! 1105: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_rd_52:
	mov	0x22, %r14
	.word 0xfedb89e0  ! 1106: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_109), 16, 16)) -> intp(0, 0, c)
	.word 0xb3e52056  ! 1108: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_wr_41:
	mov	0x16, %r14
	.word 0xf4f38e60  ! 1109: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb73cc000  ! 1112: SRA_R	sra 	%r19, %r0, %r27
iob_intr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_110), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_111), 16, 16)) -> intp(0, 0, d)
	.word 0xb5e58000  ! 1116: SAVE_R	save	%r22, %r0, %r26
	.word 0xb9e5a1e3  ! 1117: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb08d4000  ! 1121: ANDcc_R	andcc 	%r21, %r0, %r24
T0_asi_reg_wr_42:
	mov	0x2d, %r14
	.word 0xf2f38e80  ! 1122: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_112), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbbe58000  ! 1130: SAVE_R	save	%r22, %r0, %r29
	.word 0xbde50000  ! 1131: SAVE_R	save	%r20, %r0, %r30
	.word 0xbde46099  ! 1132: SAVE_I	save	%r17, 0x0001, %r30
T0_asi_reg_wr_43:
	mov	0x31, %r14
	.word 0xf8f38400  ! 1134: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_113), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_rd_53:
	mov	0x15, %r14
	.word 0xfadb89e0  ! 1139: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_114), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_79:
	setx	0x25002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe520dc  ! 1145: SAVE_I	save	%r20, 0x0001, %r31
cpu_intr_0_80:
	setx	0x270317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a1d0  ! 1149: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbbe40000  ! 1150: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_115), 16, 16)) -> intp(0, 0, f)
cpu_intr_0_81:
	setx	0x24031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 1158: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_rd_54:
	mov	0x1d, %r14
	.word 0xf2db89e0  ! 1159: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb1e420ff  ! 1160: SAVE_I	save	%r16, 0x0001, %r24
cpu_intr_0_82:
	setx	0x260321, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_55:
	mov	0x3c0, %r14
	.word 0xf8db8400  ! 1162: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_116), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_83:
	setx	0x27033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e560d2  ! 1169: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_rd_56:
	mov	0xe, %r14
	.word 0xfcdb8e80  ! 1172: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb9508000  ! 1174: RDPR_TSTATE	<illegal instruction>
iob_intr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_117), 16, 16)) -> intp(0, 0, 30)
	.word 0xb9e5e1e9  ! 1179: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e4c000  ! 1180: SAVE_R	save	%r19, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_84:
	setx	0x250000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_85:
	setx	0x26002e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_86:
	setx	0x27002b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_44:
	mov	0x10, %r14
	.word 0xf6f38e40  ! 1187: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_rd_57:
	mov	0x38, %r14
	.word 0xf6db8e80  ! 1188: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbde44000  ! 1189: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_rd_58:
	mov	0x3c0, %r14
	.word 0xfedb8e80  ! 1190: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbbe56091  ! 1192: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_87:
	setx	0x250313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb68c4000  ! 1194: ANDcc_R	andcc 	%r17, %r0, %r27
	.word 0xbd508000  ! 1195: RDPR_TSTATE	<illegal instruction>
iob_intr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_118), 16, 16)) -> intp(0, 0, 28)
cpu_intr_0_88:
	setx	0x24022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2ad61c2  ! 1200: ANDNcc_I	andncc 	%r21, 0x01c2, %r25
cpu_intr_0_89:
	setx	0x270101, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_119), 16, 16)) -> intp(0, 0, 11)
iob_intr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_120), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_wr_45:
	mov	0x3c7, %r14
	.word 0xf8f384a0  ! 1210: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbde561ed  ! 1211: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb3e46190  ! 1212: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_wr_46:
	mov	0x3c0, %r14
	.word 0xfcf38e80  ! 1213: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T0_asi_reg_rd_59:
	mov	0xe, %r14
	.word 0xf2db84a0  ! 1217: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T0_asi_reg_wr_47:
	mov	0x3c1, %r14
	.word 0xfaf389e0  ! 1218: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb72cf001  ! 1219: SLLX_I	sllx	%r19, 0x0001, %r27
	.word 0xbbe5e1b8  ! 1220: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_90:
	setx	0x26021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_121), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_wr_48:
	mov	0x3c7, %r14
	.word 0xfcf389e0  ! 1226: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_0_91:
	setx	0x250301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba25217d  ! 1232: SUB_I	sub 	%r20, 0x017d, %r29
	.word 0xb4050000  ! 1234: ADD_R	add 	%r20, %r0, %r26
cpu_intr_0_92:
	setx	0x26020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4619b  ! 1238: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb5e40000  ! 1239: SAVE_R	save	%r16, %r0, %r26
iob_intr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_122), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_123), 16, 16)) -> intp(0, 0, 25)
	.word 0xb7e48000  ! 1246: SAVE_R	save	%r18, %r0, %r27
T0_asi_reg_rd_60:
	mov	0x1c, %r14
	.word 0xfcdb8e80  ! 1254: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T0_asi_reg_rd_61:
	mov	0x3c4, %r14
	.word 0xfadb8e80  ! 1255: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_124), 16, 16)) -> intp(0, 0, 26)
iob_intr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_125), 16, 16)) -> intp(0, 0, 21)
cpu_intr_0_93:
	setx	0x250135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_126), 16, 16)) -> intp(0, 0, 34)
	.word 0xbde40000  ! 1264: SAVE_R	save	%r16, %r0, %r30
	.word 0xbb500000  ! 1266: RDPR_TPC	<illegal instruction>
T0_asi_reg_rd_62:
	mov	0x1b, %r14
	.word 0xfedb84a0  ! 1268: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_0_94:
	setx	0x25022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6bc8000  ! 1278: XNORcc_R	xnorcc 	%r18, %r0, %r27
	.word 0xb9e4c000  ! 1279: SAVE_R	save	%r19, %r0, %r28
	.word 0xb3e5a14f  ! 1280: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_wr_49:
	mov	0x24, %r14
	.word 0xf8f384a0  ! 1281: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T0_asi_reg_wr_50:
	mov	0x3c7, %r14
	.word 0xf6f38e80  ! 1285: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_0_95:
	setx	0x260020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e091  ! 1288: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_127), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_rd_63:
	mov	0x25, %r14
	.word 0xfcdb8e40  ! 1291: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb0044000  ! 1292: ADD_R	add 	%r17, %r0, %r24
T0_asi_reg_rd_64:
	mov	0x18, %r14
	.word 0xf4db8e60  ! 1295: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T0_asi_reg_wr_51:
	mov	0x14, %r14
	.word 0xf6f38e60  ! 1296: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_128), 16, 16)) -> intp(0, 0, 39)
	.word 0xbd7c8400  ! 1304: MOVR_R	movre	%r18, %r0, %r30
T0_asi_reg_rd_65:
	mov	0x3c4, %r14
	.word 0xf6db89e0  ! 1305: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_0_96:
	setx	0x240116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e54000  ! 1307: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_97:
	setx	0x270202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5202a  ! 1316: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e46114  ! 1318: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_rd_66:
	mov	0x1, %r14
	.word 0xf0db8e60  ! 1322: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb5e44000  ! 1323: SAVE_R	save	%r17, %r0, %r26
	.word 0xb5e5e058  ! 1324: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_129), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_rd_67:
	mov	0x35, %r14
	.word 0xfedb84a0  ! 1327: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb48d0000  ! 1329: ANDcc_R	andcc 	%r20, %r0, %r26
iob_intr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_130), 16, 16)) -> intp(0, 0, 18)
iob_intr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_131), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb5e5c000  ! 1336: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_132), 16, 16)) -> intp(0, 0, c)
	.word 0xbbe4c000  ! 1341: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_rd_68:
	mov	0x32, %r14
	.word 0xf4db8e40  ! 1342: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_98:
	setx	0x270224, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_99:
	setx	0x240018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc9ce1be  ! 1346: XORcc_I	xorcc 	%r19, 0x01be, %r30
iob_intr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_133), 16, 16)) -> intp(0, 0, c)
	.word 0xb3e54000  ! 1349: SAVE_R	save	%r21, %r0, %r25
	.word 0xb72ca001  ! 1350: SLL_I	sll 	%r18, 0x0001, %r27
iob_intr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_134), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_rd_69:
	mov	0x3c4, %r14
	.word 0xf2db8e60  ! 1356: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb3e42080  ! 1363: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x8f902002  ! 1364: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xbbe4619e  ! 1365: SAVE_I	save	%r17, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb8b5e09e  ! 1371: ORNcc_I	orncc 	%r23, 0x009e, %r28
cpu_intr_0_100:
	setx	0x270214, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_101:
	setx	0x25013d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_102:
	setx	0x2a0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc45e0c0  ! 1380: ADDC_I	addc 	%r23, 0x00c0, %r30
	.word 0xbc850000  ! 1381: ADDcc_R	addcc 	%r20, %r0, %r30
	.word 0xbde5c000  ! 1382: SAVE_R	save	%r23, %r0, %r30
	.word 0xbbe50000  ! 1383: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_70:
	mov	0x3c7, %r14
	.word 0xfcdb89e0  ! 1385: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xbbe4e045  ! 1387: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbbe4e16f  ! 1388: SAVE_I	save	%r19, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e58000  ! 1390: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_135), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb9e521bb  ! 1392: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb4b52080  ! 1394: ORNcc_I	orncc 	%r20, 0x0080, %r26
T0_asi_reg_wr_52:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 1395: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_71:
	mov	0x17, %r14
	.word 0xf8db8400  ! 1396: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_0_103:
	setx	0x2b021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e54000  ! 1400: SAVE_R	save	%r21, %r0, %r28
cpu_intr_0_104:
	setx	0x2a0238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde48000  ! 1404: SAVE_R	save	%r18, %r0, %r30
	.word 0xb7e5a174  ! 1406: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe50000  ! 1410: SAVE_R	save	%r20, %r0, %r31
	.word 0xb43460ce  ! 1411: ORN_I	orn 	%r17, 0x00ce, %r26
	.word 0xb3e4a101  ! 1413: SAVE_I	save	%r18, 0x0001, %r25
cpu_intr_0_105:
	setx	0x290008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 1416: SAVE_R	save	%r21, %r0, %r24
	.word 0xbbe48000  ! 1417: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_wr_53:
	mov	0x1, %r14
	.word 0xf4f38e80  ! 1420: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T0_asi_reg_rd_72:
	mov	0x3c5, %r14
	.word 0xf6db84a0  ! 1422: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_136), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb9e5c000  ! 1425: SAVE_R	save	%r23, %r0, %r28
	.word 0xbfe46047  ! 1427: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_wr_54:
	mov	0x1c, %r14
	.word 0xf8f384a0  ! 1430: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T0_asi_reg_rd_73:
	mov	0x34, %r14
	.word 0xf6db8e80  ! 1431: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb7e4e144  ! 1432: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_106:
	setx	0x2a0018, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_137), 16, 16)) -> intp(0, 0, 22)
T0_asi_reg_wr_55:
	mov	0x21, %r14
	.word 0xf8f38e80  ! 1441: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T0_asi_reg_wr_56:
	mov	0x1c, %r14
	.word 0xf6f389e0  ! 1442: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xb7e4212b  ! 1443: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbbe48000  ! 1444: SAVE_R	save	%r18, %r0, %r29
iob_intr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_138), 16, 16)) -> intp(0, 0, 22)
	.word 0xbde5c000  ! 1450: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_139), 16, 16)) -> intp(0, 0, 10)
cpu_intr_0_107:
	setx	0x2a0316, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_108:
	setx	0x2a0332, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_109:
	setx	0x2a0324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e40000  ! 1458: SAVE_R	save	%r16, %r0, %r27
	.word 0xb3e4c000  ! 1459: SAVE_R	save	%r19, %r0, %r25
iob_intr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_140), 16, 16)) -> intp(0, 0, 36)
	.word 0xb3e4c000  ! 1462: SAVE_R	save	%r19, %r0, %r25
	.word 0xb2344000  ! 1463: SUBC_R	orn 	%r17, %r0, %r25
cpu_intr_0_110:
	setx	0x2b011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_57:
	mov	0x36, %r14
	.word 0xf0f38e80  ! 1465: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb9e5615d  ! 1466: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb424a02f  ! 1467: SUB_I	sub 	%r18, 0x002f, %r26
	.word 0xb7e5c000  ! 1468: SAVE_R	save	%r23, %r0, %r27
	.word 0xbde521e2  ! 1471: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_rd_74:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 1473: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbfe50000  ! 1476: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_wr_58:
	mov	0x3c8, %r14
	.word 0xf6f384a0  ! 1477: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_0_111:
	setx	0x29012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e42036  ! 1483: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_141), 16, 16)) -> intp(0, 0, 2c)
cpu_intr_0_112:
	setx	0x28001a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_113:
	setx	0x2b0121, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_59:
	mov	0x22, %r14
	.word 0xf0f38e80  ! 1489: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_0_114:
	setx	0x2b0116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_115:
	setx	0x280214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e52110  ! 1497: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5e54000  ! 1498: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_wr_60:
	mov	0x2e, %r14
	.word 0xfaf38e40  ! 1499: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_116:
	setx	0x280210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e52078  ! 1502: SAVE_I	save	%r20, 0x0001, %r24
T0_asi_reg_wr_61:
	mov	0x11, %r14
	.word 0xfcf38e40  ! 1506: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbfe5c000  ! 1507: SAVE_R	save	%r23, %r0, %r31
	.word 0xb5e5218b  ! 1508: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb0348000  ! 1510: ORN_R	orn 	%r18, %r0, %r24
	.word 0xbfe4a1f3  ! 1511: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_117:
	setx	0x2a002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_118:
	setx	0x2a0100, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_75:
	mov	0x10, %r14
	.word 0xf6db8e40  ! 1520: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_rd_76:
	mov	0x22, %r14
	.word 0xf4db8e40  ! 1521: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbde521ec  ! 1523: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_wr_62:
	mov	0x22, %r14
	.word 0xf6f38e60  ! 1525: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb9351000  ! 1528: SRLX_R	srlx	%r20, %r0, %r28
	.word 0xb5e52042  ! 1529: SAVE_I	save	%r20, 0x0001, %r26
T0_asi_reg_wr_63:
	mov	0x3c6, %r14
	.word 0xf6f389e0  ! 1535: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_142), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_119:
	setx	0x2a013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 1544: SAVE_R	save	%r17, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3e52153  ! 1551: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb1e52093  ! 1552: SAVE_I	save	%r20, 0x0001, %r24
T0_asi_reg_rd_77:
	mov	0x6, %r14
	.word 0xf6db84a0  ! 1555: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_143), 16, 16)) -> intp(0, 0, 35)
	.word 0xba3ce154  ! 1558: XNOR_I	xnor 	%r19, 0x0154, %r29
iob_intr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_144), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb5e4c000  ! 1562: SAVE_R	save	%r19, %r0, %r26
cpu_intr_0_120:
	setx	0x28021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb42c8000  ! 1567: ANDN_R	andn 	%r18, %r0, %r26
iob_intr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_145), 16, 16)) -> intp(0, 0, 17)
	.word 0xb9e4c000  ! 1574: SAVE_R	save	%r19, %r0, %r28
cpu_intr_0_121:
	setx	0x2a020d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_122:
	setx	0x29031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1d4000  ! 1591: XOR_R	xor 	%r21, %r0, %r31
	.word 0xbde4e02b  ! 1594: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_146), 16, 16)) -> intp(0, 0, 38)
cpu_intr_0_123:
	setx	0x28023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_124:
	setx	0x2a0300, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_64:
	mov	0x1f, %r14
	.word 0xf0f38e40  ! 1605: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_rd_78:
	mov	0x10, %r14
	.word 0xf4db8400  ! 1606: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_0_125:
	setx	0x2b013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc3561f4  ! 1613: ORN_I	orn 	%r21, 0x01f4, %r30
	.word 0xbde4202a  ! 1615: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb5e4e1e6  ! 1616: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3e4c000  ! 1617: SAVE_R	save	%r19, %r0, %r25
	.word 0xbfe5601d  ! 1618: SAVE_I	save	%r21, 0x0001, %r31
iob_intr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_147), 16, 16)) -> intp(0, 0, 2f)
iob_intr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_148), 16, 16)) -> intp(0, 0, 23)
	.word 0xb7e58000  ! 1627: SAVE_R	save	%r22, %r0, %r27
	.word 0xbfe560cd  ! 1629: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_wr_65:
	mov	0x13, %r14
	.word 0xf6f38e40  ! 1630: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_wr_66:
	mov	0x28, %r14
	.word 0xfaf384a0  ! 1631: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb7e52012  ! 1633: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbde4e1ad  ! 1635: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_wr_67:
	mov	0x6, %r14
	.word 0xf0f38e60  ! 1639: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb5e54000  ! 1640: SAVE_R	save	%r21, %r0, %r26
	.word 0xb3e46058  ! 1643: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_rd_79:
	mov	0x3c4, %r14
	.word 0xfcdb8e80  ! 1644: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb5e40000  ! 1645: SAVE_R	save	%r16, %r0, %r26
	.word 0xb72ca001  ! 1651: SLL_I	sll 	%r18, 0x0001, %r27
cpu_intr_0_126:
	setx	0x28002d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_127:
	setx	0x2a0315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4612c  ! 1658: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb0440000  ! 1662: ADDC_R	addc 	%r16, %r0, %r24
T0_asi_reg_rd_80:
	mov	0x3, %r14
	.word 0xfadb84a0  ! 1663: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_0_128:
	setx	0x29013f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_149), 16, 16)) -> intp(0, 0, 9)
	.word 0xbde4a105  ! 1668: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e56096  ! 1672: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e5e079  ! 1673: SAVE_I	save	%r23, 0x0001, %r25
cpu_intr_0_129:
	setx	0x2b022d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_150), 16, 16)) -> intp(0, 0, 15)
	.word 0xbfe4a13e  ! 1679: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_rd_81:
	mov	0x23, %r14
	.word 0xfadb8e60  ! 1685: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb32d2001  ! 1688: SLL_I	sll 	%r20, 0x0001, %r25
iob_intr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_151), 16, 16)) -> intp(0, 0, 14)
	.word 0xb7e48000  ! 1695: SAVE_R	save	%r18, %r0, %r27
cpu_intr_0_130:
	setx	0x2b002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_82:
	mov	0x1e, %r14
	.word 0xf0db8e40  ! 1699: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_wr_68:
	mov	0x13, %r14
	.word 0xf6f38e40  ! 1702: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbde58000  ! 1704: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_rd_83:
	mov	0xe, %r14
	.word 0xf0db89e0  ! 1707: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_0_131:
	setx	0x290033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_152), 16, 16)) -> intp(0, 0, 28)
	.word 0xbd345000  ! 1713: SRLX_R	srlx	%r17, %r0, %r30
T0_asi_reg_wr_69:
	mov	0x24, %r14
	.word 0xf6f38400  ! 1714: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb5e5e18b  ! 1715: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb82521ac  ! 1717: SUB_I	sub 	%r20, 0x01ac, %r28
	.word 0xb82cc000  ! 1718: ANDN_R	andn 	%r19, %r0, %r28
iob_intr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_153), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_132:
	setx	0x2a020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe42070  ! 1723: SAVE_I	save	%r16, 0x0001, %r29
iob_intr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_154), 16, 16)) -> intp(0, 0, 10)
	.word 0xbbe5a049  ! 1727: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_155), 16, 16)) -> intp(0, 0, 7)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x839520b1  ! 1735: WRPR_TNPC_I	wrpr	%r20, 0x00b1, %tnpc
T0_asi_reg_wr_70:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 1736: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_156), 16, 16)) -> intp(0, 0, 16)
iob_intr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_157), 16, 16)) -> intp(0, 0, 16)
T0_asi_reg_wr_71:
	mov	0xb, %r14
	.word 0xf2f384a0  ! 1747: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb5e5609d  ! 1750: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e461bb  ! 1751: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb29dc000  ! 1753: XORcc_R	xorcc 	%r23, %r0, %r25
cpu_intr_0_133:
	setx	0x2b0034, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_72:
	mov	0x3c3, %r14
	.word 0xfcf38e60  ! 1760: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbe9d612e  ! 1764: XORcc_I	xorcc 	%r21, 0x012e, %r31
	.word 0xbde5c000  ! 1765: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_158), 16, 16)) -> intp(0, 0, 15)
	.word 0xb5e44000  ! 1769: SAVE_R	save	%r17, %r0, %r26
	.word 0xb1e5e1b7  ! 1774: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbde54000  ! 1775: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_rd_84:
	mov	0x2d, %r14
	.word 0xf4db8400  ! 1777: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_159), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb1e56064  ! 1784: SAVE_I	save	%r21, 0x0001, %r24
cpu_intr_0_134:
	setx	0x290111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5619f  ! 1786: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_135:
	setx	0x2b033d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_136:
	setx	0x2a0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 1792: SAVE_R	save	%r21, %r0, %r27
	.word 0xbbe4a1f8  ! 1794: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb5e5e191  ! 1796: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_rd_85:
	mov	0x2d, %r14
	.word 0xf4db84a0  ! 1798: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbde42134  ! 1802: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e56160  ! 1804: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_wr_73:
	mov	0x3c5, %r14
	.word 0xfaf38e80  ! 1805: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbc0460ac  ! 1806: ADD_I	add 	%r17, 0x00ac, %r30
iob_intr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_160), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_wr_74:
	mov	0xe, %r14
	.word 0xf8f38e40  ! 1809: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_0_137:
	setx	0x280007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 1811: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_161), 16, 16)) -> intp(0, 0, 0)
	.word 0xbfe44000  ! 1813: SAVE_R	save	%r17, %r0, %r31
	.word 0xb1e50000  ! 1814: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_138:
	setx	0x29033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_162), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_wr_75:
	mov	0xb, %r14
	.word 0xf4f38400  ! 1817: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb5e50000  ! 1818: SAVE_R	save	%r20, %r0, %r26
	.word 0xb5e521e3  ! 1819: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbde5e0cf  ! 1821: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_rd_86:
	mov	0x3c5, %r14
	.word 0xf4db8e60  ! 1822: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xba35609e  ! 1823: ORN_I	orn 	%r21, 0x009e, %r29
	.word 0xb0c40000  ! 1825: ADDCcc_R	addccc 	%r16, %r0, %r24
cpu_intr_0_139:
	setx	0x2c0116, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_87:
	mov	0x3c1, %r14
	.word 0xf6db8400  ! 1829: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbfe4a12c  ! 1831: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_wr_76:
	mov	0x2e, %r14
	.word 0xf0f384a0  ! 1832: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_163), 16, 16)) -> intp(0, 0, 19)
	.word 0xbc840000  ! 1839: ADDcc_R	addcc 	%r16, %r0, %r30
T0_asi_reg_rd_88:
	mov	0x2c, %r14
	.word 0xfedb8e40  ! 1840: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_140:
	setx	0x2f0016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_164), 16, 16)) -> intp(0, 0, 26)
	.word 0xbe3de017  ! 1845: XNOR_I	xnor 	%r23, 0x0017, %r31
iob_intr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_165), 16, 16)) -> intp(0, 0, 10)
T0_asi_reg_rd_89:
	mov	0x13, %r14
	.word 0xf4db8400  ! 1848: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb7643801  ! 1850: MOVcc_I	<illegal instruction>
	.word 0xbc858000  ! 1851: ADDcc_R	addcc 	%r22, %r0, %r30
cpu_intr_0_141:
	setx	0x2d0318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_142:
	setx	0x2f0221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_166), 16, 16)) -> intp(0, 0, 7)
cpu_intr_0_143:
	setx	0x2f022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe44000  ! 1857: SAVE_R	save	%r17, %r0, %r29
iob_intr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_167), 16, 16)) -> intp(0, 0, e)
	.word 0xbbe4610f  ! 1861: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xba3da1a8  ! 1863: XNOR_I	xnor 	%r22, 0x01a8, %r29
	.word 0xb1e421a4  ! 1866: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbb351000  ! 1867: SRLX_R	srlx	%r20, %r0, %r29
cpu_intr_0_144:
	setx	0x2d0129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e48000  ! 1874: SAVE_R	save	%r18, %r0, %r27
iob_intr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_168), 16, 16)) -> intp(0, 0, 5)
	.word 0xb3e4a16e  ! 1880: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe5e1d4  ! 1881: SAVE_I	save	%r23, 0x0001, %r31
cpu_intr_0_145:
	setx	0x2c031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_169), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_wr_77:
	mov	0x3c4, %r14
	.word 0xf2f38e40  ! 1886: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb3e54000  ! 1890: SAVE_R	save	%r21, %r0, %r25
iob_intr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_170), 16, 16)) -> intp(0, 0, 15)
	.word 0xb094c000  ! 1895: ORcc_R	orcc 	%r19, %r0, %r24
	.word 0xb7e5e192  ! 1896: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbac5206c  ! 1897: ADDCcc_I	addccc 	%r20, 0x006c, %r29
T0_asi_reg_rd_90:
	mov	0x3c6, %r14
	.word 0xfedb84a0  ! 1899: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb5e4c000  ! 1900: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_rd_91:
	mov	0x24, %r14
	.word 0xfadb8e40  ! 1902: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb9e54000  ! 1903: SAVE_R	save	%r21, %r0, %r28
	.word 0xb89d0000  ! 1904: XORcc_R	xorcc 	%r20, %r0, %r28
iob_intr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_171), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_wr_78:
	mov	0x34, %r14
	.word 0xf8f38e80  ! 1909: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb9e4c000  ! 1912: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_wr_79:
	mov	0x3c2, %r14
	.word 0xf2f38e40  ! 1914: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb7e461f4  ! 1920: SAVE_I	save	%r17, 0x0001, %r27
cpu_intr_0_146:
	setx	0x2c033d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_80:
	mov	0x3c2, %r14
	.word 0xfaf38e80  ! 1923: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbde5c000  ! 1925: SAVE_R	save	%r23, %r0, %r30
	.word 0xb9e560c8  ! 1926: SAVE_I	save	%r21, 0x0001, %r28
iob_intr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_172), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_wr_81:
	mov	0x25, %r14
	.word 0xfcf38e80  ! 1928: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb7e42192  ! 1930: SAVE_I	save	%r16, 0x0001, %r27
cpu_intr_0_147:
	setx	0x2e0234, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_92:
	mov	0x31, %r14
	.word 0xfedb89e0  ! 1937: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb1e5e110  ! 1941: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_173), 16, 16)) -> intp(0, 0, 6)
	.word 0xbc9d0000  ! 1948: XORcc_R	xorcc 	%r20, %r0, %r30
	.word 0xb7e5e191  ! 1949: SAVE_I	save	%r23, 0x0001, %r27
T0_asi_reg_wr_82:
	mov	0x27, %r14
	.word 0xf0f389e0  ! 1953: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T0_asi_reg_rd_93:
	mov	0x2, %r14
	.word 0xf4db84a0  ! 1954: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb5e50000  ! 1956: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_rd_94:
	mov	0x3c6, %r14
	.word 0xf4db8e60  ! 1960: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_0_148:
	setx	0x2d0128, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_174), 16, 16)) -> intp(0, 0, 5)
	.word 0xbf2da001  ! 1965: SLL_I	sll 	%r22, 0x0001, %r31
	.word 0xb9e5c000  ! 1969: SAVE_R	save	%r23, %r0, %r28
	.word 0xb0158000  ! 1973: OR_R	or 	%r22, %r0, %r24
	.word 0xb5e4a027  ! 1974: SAVE_I	save	%r18, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e48000  ! 1981: SAVE_R	save	%r18, %r0, %r27
	.word 0xbfe44000  ! 1983: SAVE_R	save	%r17, %r0, %r31
	.word 0xb3e521b2  ! 1984: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_149:
	setx	0x2f0003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_175), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_wr_83:
	mov	0x3c4, %r14
	.word 0xf0f38e80  ! 1996: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xbfe5e0a3  ! 1997: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbfe58000  ! 1998: SAVE_R	save	%r22, %r0, %r31
	.word 0xb5e52171  ! 1999: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_176), 16, 16)) -> intp(0, 0, 22)
T0_asi_reg_rd_95:
	mov	0x2f, %r14
	.word 0xf8db89e0  ! 2004: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T0_asi_reg_rd_96:
	mov	0x27, %r14
	.word 0xf4db89e0  ! 2005: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbfe4e0bf  ! 2007: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e40000  ! 2009: SAVE_R	save	%r16, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1e4a0ae  ! 2013: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e5e132  ! 2016: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5e58000  ! 2017: SAVE_R	save	%r22, %r0, %r26
	.word 0xbfe5e0ab  ! 2019: SAVE_I	save	%r23, 0x0001, %r31
cpu_intr_0_150:
	setx	0x2c0139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_177), 16, 16)) -> intp(0, 0, 30)
	.word 0xb9e56136  ! 2022: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe4a0b9  ! 2025: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb5480000  ! 2026: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb7e40000  ! 2032: SAVE_R	save	%r16, %r0, %r27
cpu_intr_0_151:
	setx	0x2d0021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4604f  ! 2039: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e5c000  ! 2044: SAVE_R	save	%r23, %r0, %r24
	.word 0xbbe44000  ! 2045: SAVE_R	save	%r17, %r0, %r29
iob_intr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_178), 16, 16)) -> intp(0, 0, f)
T0_asi_reg_rd_97:
	mov	0x2b, %r14
	.word 0xfadb89e0  ! 2047: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xbde5a0f6  ! 2051: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_rd_98:
	mov	0x18, %r14
	.word 0xf8db8e40  ! 2054: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbde4a05a  ! 2055: SAVE_I	save	%r18, 0x0001, %r30
iob_intr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_179), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_180), 16, 16)) -> intp(0, 0, 20)
iob_intr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_181), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb5e46070  ! 2070: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb52cb001  ! 2073: SLLX_I	sllx	%r18, 0x0001, %r26
T0_asi_reg_rd_99:
	mov	0x3c2, %r14
	.word 0xf6db89e0  ! 2082: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T0_asi_reg_wr_84:
	mov	0x14, %r14
	.word 0xfef38e80  ! 2083: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T0_asi_reg_wr_85:
	mov	0x3c7, %r14
	.word 0xf6f384a0  ! 2085: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb7e5e13a  ! 2086: SAVE_I	save	%r23, 0x0001, %r27
iob_intr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_182), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb1e4c000  ! 2089: SAVE_R	save	%r19, %r0, %r24
	.word 0xb1e420b3  ! 2093: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e44000  ! 2095: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_183), 16, 16)) -> intp(0, 0, 17)
	.word 0xb7e40000  ! 2097: SAVE_R	save	%r16, %r0, %r27
	.word 0xbde40000  ! 2098: SAVE_R	save	%r16, %r0, %r30
cpu_intr_0_152:
	setx	0x2f002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_153:
	setx	0x2d0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1d219e  ! 2104: XOR_I	xor 	%r20, 0x019e, %r29
cpu_intr_0_154:
	setx	0x2d0232, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_155:
	setx	0x2d000f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_156:
	setx	0x2f012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_86:
	mov	0x3c7, %r14
	.word 0xfaf38400  ! 2110: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb5e5a0cd  ! 2112: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_wr_87:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 2114: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbfe561ae  ! 2116: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_157:
	setx	0x2d0321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e06a  ! 2119: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e52072  ! 2120: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_wr_88:
	mov	0x2a, %r14
	.word 0xf8f38e80  ! 2123: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbfe5a01a  ! 2124: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbc0de1c7  ! 2126: AND_I	and 	%r23, 0x01c7, %r30
cpu_intr_0_158:
	setx	0x2d011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e42068  ! 2129: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_rd_100:
	mov	0x2, %r14
	.word 0xf0db8e40  ! 2130: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_159:
	setx	0x2d0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5c000  ! 2133: SAVE_R	save	%r23, %r0, %r31
	.word 0xb60ca043  ! 2134: AND_I	and 	%r18, 0x0043, %r27
T0_asi_reg_wr_89:
	mov	0x3c6, %r14
	.word 0xf6f38e80  ! 2136: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb5e5a0a4  ! 2137: SAVE_I	save	%r22, 0x0001, %r26
iob_intr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_184), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_185), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_rd_101:
	mov	0x38, %r14
	.word 0xf8db8e80  ! 2143: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_0_160:
	setx	0x2e013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4c000  ! 2147: SAVE_R	save	%r19, %r0, %r29
iob_intr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_186), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_161:
	setx	0x2d0206, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_187), 16, 16)) -> intp(0, 0, 38)
cpu_intr_0_162:
	setx	0x2d0012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_188), 16, 16)) -> intp(0, 0, 6)
	.word 0xb9e44000  ! 2156: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_189), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_rd_102:
	mov	0x3c5, %r14
	.word 0xf4db8e60  ! 2160: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_190), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_163:
	setx	0x2c0100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba85e172  ! 2170: ADDcc_I	addcc 	%r23, 0x0172, %r29
	.word 0xbde46173  ! 2171: SAVE_I	save	%r17, 0x0001, %r30
T0_asi_reg_wr_90:
	mov	0x3c1, %r14
	.word 0xfaf38e80  ! 2173: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb3e50000  ! 2175: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_rd_103:
	mov	0x3c8, %r14
	.word 0xfcdb8e60  ! 2176: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb7e54000  ! 2177: SAVE_R	save	%r21, %r0, %r27
	.word 0xbfe58000  ! 2178: SAVE_R	save	%r22, %r0, %r31
	.word 0xb5e4a0cb  ! 2179: SAVE_I	save	%r18, 0x0001, %r26
cpu_intr_0_164:
	setx	0x2d0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5619c  ! 2192: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb6944000  ! 2193: ORcc_R	orcc 	%r17, %r0, %r27
iob_intr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_191), 16, 16)) -> intp(0, 0, 32)
	.word 0xa1902002  ! 2196: WRPR_GL_I	wrpr	%r0, 0x0002, %-
cpu_intr_0_165:
	setx	0x2c0023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe561ef  ! 2202: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb3e4e105  ! 2203: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e5c000  ! 2206: SAVE_R	save	%r23, %r0, %r27
	.word 0xbbe48000  ! 2207: SAVE_R	save	%r18, %r0, %r29
	.word 0xb3e5a0e2  ! 2208: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_rd_104:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 2209: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_192), 16, 16)) -> intp(0, 0, 27)
	.word 0xb5e5a01d  ! 2213: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_166:
	setx	0x2d013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde48000  ! 2216: SAVE_R	save	%r18, %r0, %r30
	.word 0xb7e421db  ! 2218: SAVE_I	save	%r16, 0x0001, %r27
T0_asi_reg_wr_91:
	mov	0x1a, %r14
	.word 0xfaf38400  ! 2219: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_0_167:
	setx	0x2e020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_193), 16, 16)) -> intp(0, 0, 28)
	.word 0xbbe54000  ! 2224: SAVE_R	save	%r21, %r0, %r29
cpu_intr_0_168:
	setx	0x2d020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9c0000  ! 2227: XORcc_R	xorcc 	%r16, %r0, %r29
	.word 0xb5e44000  ! 2228: SAVE_R	save	%r17, %r0, %r26
T0_asi_reg_wr_92:
	mov	0x2a, %r14
	.word 0xf8f38400  ! 2230: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb1508000  ! 2231: RDPR_TSTATE	<illegal instruction>
	.word 0xbbe58000  ! 2232: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_169:
	setx	0x2e010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 2235: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_170:
	setx	0x2c010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde48000  ! 2241: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_194), 16, 16)) -> intp(0, 0, 12)
iob_intr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_195), 16, 16)) -> intp(0, 0, 12)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_196), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_171:
	setx	0x2c0130, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_93:
	mov	0x31, %r14
	.word 0xfaf38400  ! 2249: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe40000  ! 2253: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_197), 16, 16)) -> intp(0, 0, 39)
	.word 0xbbe52159  ! 2256: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_198), 16, 16)) -> intp(0, 0, 30)
	.word 0xb9e40000  ! 2263: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_172:
	setx	0x2e011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e4211a  ! 2266: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbc2c20d2  ! 2269: ANDN_I	andn 	%r16, 0x00d2, %r30
T0_asi_reg_rd_105:
	mov	0x12, %r14
	.word 0xf8db8e80  ! 2270: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_199), 16, 16)) -> intp(0, 0, 7)
	.word 0xb9e50000  ! 2272: SAVE_R	save	%r20, %r0, %r28
	.word 0xbea48000  ! 2276: SUBcc_R	subcc 	%r18, %r0, %r31
	.word 0xb5e5a053  ! 2282: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7e52009  ! 2283: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5e4e0f1  ! 2284: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_rd_106:
	mov	0x14, %r14
	.word 0xfadb8e40  ! 2287: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_rd_107:
	mov	0x31, %r14
	.word 0xfedb8400  ! 2290: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T0_asi_reg_rd_108:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 2292: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_wr_94:
	mov	0x12, %r14
	.word 0xfef389e0  ! 2293: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T0_asi_reg_rd_109:
	mov	0x26, %r14
	.word 0xfedb89e0  ! 2294: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb3e5e1d1  ! 2299: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3e4a058  ! 2301: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e56085  ! 2303: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e44000  ! 2304: SAVE_R	save	%r17, %r0, %r27
	.word 0xb5e54000  ! 2305: SAVE_R	save	%r21, %r0, %r26
iob_intr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_200), 16, 16)) -> intp(0, 0, 32)
T0_asi_reg_wr_95:
	mov	0x5, %r14
	.word 0xfaf38e40  ! 2310: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e5e0c8  ! 2314: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_173:
	setx	0x31002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6c561ca  ! 2316: ADDCcc_I	addccc 	%r21, 0x01ca, %r27
T0_asi_reg_wr_96:
	mov	0x4, %r14
	.word 0xfcf38400  ! 2318: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_0_174:
	setx	0x330207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_175:
	setx	0x33023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_201), 16, 16)) -> intp(0, 0, 17)
	.word 0xb7e4e094  ! 2327: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb5e50000  ! 2328: SAVE_R	save	%r20, %r0, %r26
	.word 0xbc1dc000  ! 2329: XOR_R	xor 	%r23, %r0, %r30
	.word 0xb7e4e0bd  ! 2332: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbbe58000  ! 2334: SAVE_R	save	%r22, %r0, %r29
	.word 0xbfe4e104  ! 2337: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbfe4c000  ! 2338: SAVE_R	save	%r19, %r0, %r31
iob_intr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_202), 16, 16)) -> intp(0, 0, 18)
	.word 0xb1e520c8  ! 2342: SAVE_I	save	%r20, 0x0001, %r24
T0_asi_reg_rd_110:
	mov	0x3c4, %r14
	.word 0xfadb89e0  ! 2346: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_0_176:
	setx	0x30021b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_203), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_177:
	setx	0x310236, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_178:
	setx	0x32010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_97:
	mov	0x32, %r14
	.word 0xf6f384a0  ! 2363: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T0_asi_reg_wr_98:
	mov	0x2f, %r14
	.word 0xf4f389e0  ! 2370: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb4b4e06b  ! 2373: SUBCcc_I	orncc 	%r19, 0x006b, %r26
	.word 0xb7e56008  ! 2376: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_204), 16, 16)) -> intp(0, 0, 28)
	.word 0xb7e58000  ! 2378: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_wr_99:
	mov	0x25, %r14
	.word 0xf8f38e40  ! 2379: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb9e5a09d  ! 2380: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e420a8  ! 2381: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_205), 16, 16)) -> intp(0, 0, 22)
cpu_intr_0_179:
	setx	0x33011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_180:
	setx	0x330116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_181:
	setx	0x310215, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_206), 16, 16)) -> intp(0, 0, 24)
	.word 0xbaac8000  ! 2395: ANDNcc_R	andncc 	%r18, %r0, %r29
iob_intr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_207), 16, 16)) -> intp(0, 0, 0)
iob_intr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_208), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_182:
	setx	0x320220, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_111:
	mov	0x2d, %r14
	.word 0xf8db89e0  ! 2400: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_0_183:
	setx	0x33002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a14b  ! 2404: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5e5e175  ! 2405: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbc054000  ! 2407: ADD_R	add 	%r21, %r0, %r30
	.word 0xbbe5c000  ! 2408: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_209), 16, 16)) -> intp(0, 0, a)
	.word 0xb9e5c000  ! 2410: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_210), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_211), 16, 16)) -> intp(0, 0, 34)
cpu_intr_0_184:
	setx	0x330322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 2416: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e4e111  ! 2417: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_185:
	setx	0x320014, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_212), 16, 16)) -> intp(0, 0, 12)
	.word 0xbfe4a163  ! 2423: SAVE_I	save	%r18, 0x0001, %r31
cpu_intr_0_186:
	setx	0x33011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e521d0  ! 2428: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbfe44000  ! 2429: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_213), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_187:
	setx	0x330021, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_188:
	setx	0x32013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe95c000  ! 2437: ORcc_R	orcc 	%r23, %r0, %r31
	.word 0xb1e4612f  ! 2438: SAVE_I	save	%r17, 0x0001, %r24
iob_intr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_214), 16, 16)) -> intp(0, 0, b)
	.word 0xb41c60d8  ! 2444: XOR_I	xor 	%r17, 0x00d8, %r26
iob_intr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_215), 16, 16)) -> intp(0, 0, 29)
	.word 0xb7e5c000  ! 2448: SAVE_R	save	%r23, %r0, %r27
	.word 0xbbe58000  ! 2449: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_189:
	setx	0x320233, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e5a198  ! 2453: SAVE_I	save	%r22, 0x0001, %r28
T0_asi_reg_wr_100:
	mov	0x3c3, %r14
	.word 0xf2f38e80  ! 2455: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_216), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb1e58000  ! 2458: SAVE_R	save	%r22, %r0, %r24
	.word 0xb1e4e15a  ! 2460: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde58000  ! 2462: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_190:
	setx	0x320009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4216b  ! 2465: SAVE_I	save	%r16, 0x0001, %r28
iob_intr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_217), 16, 16)) -> intp(0, 0, 1)
T0_asi_reg_wr_101:
	mov	0x5, %r14
	.word 0xf6f38e40  ! 2468: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_rd_112:
	mov	0x24, %r14
	.word 0xf2db89e0  ! 2471: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbe44a096  ! 2474: ADDC_I	addc 	%r18, 0x0096, %r31
	.word 0xb5e5c000  ! 2476: SAVE_R	save	%r23, %r0, %r26
cpu_intr_0_191:
	setx	0x320337, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_113:
	mov	0x3c7, %r14
	.word 0xfadb8e60  ! 2479: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbbe48000  ! 2480: SAVE_R	save	%r18, %r0, %r29
	.word 0xb53db001  ! 2481: SRAX_I	srax	%r22, 0x0001, %r26
	.word 0xbfe44000  ! 2482: SAVE_R	save	%r17, %r0, %r31
	.word 0xb7e44000  ! 2483: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_218), 16, 16)) -> intp(0, 0, 3)
	.word 0xbca4a075  ! 2486: SUBcc_I	subcc 	%r18, 0x0075, %r30
	.word 0xb9e56007  ! 2487: SAVE_I	save	%r21, 0x0001, %r28
cpu_intr_0_192:
	setx	0x330217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e50000  ! 2498: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_219), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_rd_114:
	mov	0x16, %r14
	.word 0xf0db89e0  ! 2501: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T0_asi_reg_rd_115:
	mov	0x3c6, %r14
	.word 0xfadb8e60  ! 2503: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb5e48000  ! 2504: SAVE_R	save	%r18, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e48000  ! 2506: SAVE_R	save	%r18, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_193:
	setx	0x32021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_220), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb8ade089  ! 2519: ANDNcc_I	andncc 	%r23, 0x0089, %r28
cpu_intr_0_194:
	setx	0x33002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93df001  ! 2524: SRAX_I	srax	%r23, 0x0001, %r28
cpu_intr_0_195:
	setx	0x32011f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_196:
	setx	0x30010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e188  ! 2530: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e4e139  ! 2531: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_221), 16, 16)) -> intp(0, 0, 3c)
	.word 0xb7e48000  ! 2536: SAVE_R	save	%r18, %r0, %r27
	.word 0xbb7d8400  ! 2540: MOVR_R	movre	%r22, %r0, %r29
	.word 0xbbe4c000  ! 2542: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_wr_102:
	mov	0xd, %r14
	.word 0xfaf38400  ! 2543: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_222), 16, 16)) -> intp(0, 0, 28)
T0_asi_reg_rd_116:
	mov	0x6, %r14
	.word 0xf0db8400  ! 2547: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T0_asi_reg_rd_117:
	mov	0x2b, %r14
	.word 0xfedb8e40  ! 2555: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb9e44000  ! 2556: SAVE_R	save	%r17, %r0, %r28
	.word 0xb5e54000  ! 2558: SAVE_R	save	%r21, %r0, %r26
	.word 0xb3e56069  ! 2559: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_223), 16, 16)) -> intp(0, 0, 14)
	.word 0xb9e50000  ! 2564: SAVE_R	save	%r20, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e46032  ! 2573: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e4c000  ! 2574: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_rd_118:
	mov	0x15, %r14
	.word 0xf0db8e40  ! 2578: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbbe44000  ! 2579: SAVE_R	save	%r17, %r0, %r29
	.word 0xbde4a11b  ! 2581: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbbe420a6  ! 2582: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb0c42046  ! 2583: ADDCcc_I	addccc 	%r16, 0x0046, %r24
cpu_intr_0_197:
	setx	0x31013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_103:
	mov	0x9, %r14
	.word 0xfaf38e60  ! 2589: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_224), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb1e54000  ! 2595: SAVE_R	save	%r21, %r0, %r24
iob_intr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_225), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb92c3001  ! 2597: SLLX_I	sllx	%r16, 0x0001, %r28
	.word 0xb5e5e073  ! 2599: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_rd_119:
	mov	0x3c0, %r14
	.word 0xfadb8e40  ! 2605: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_rd_120:
	mov	0x24, %r14
	.word 0xf0db8e80  ! 2609: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbde5206f  ! 2610: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_rd_121:
	mov	0x3c0, %r14
	.word 0xf6db84a0  ! 2612: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_226), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_198:
	setx	0x30010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e42110  ! 2621: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbfe52153  ! 2623: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_227), 16, 16)) -> intp(0, 0, 18)
	.word 0xb9e54000  ! 2627: SAVE_R	save	%r21, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe40000  ! 2636: SAVE_R	save	%r16, %r0, %r29
cpu_intr_0_199:
	setx	0x300029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_228), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_wr_104:
	mov	0x2a, %r14
	.word 0xfcf389e0  ! 2640: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb1e40000  ! 2643: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_wr_105:
	mov	0x24, %r14
	.word 0xf8f384a0  ! 2644: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb1e4609d  ! 2647: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbfe44000  ! 2648: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_rd_122:
	mov	0x3c1, %r14
	.word 0xfedb84a0  ! 2651: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb1e48000  ! 2653: SAVE_R	save	%r18, %r0, %r24
	.word 0xb4158000  ! 2654: OR_R	or 	%r22, %r0, %r26
iob_intr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_229), 16, 16)) -> intp(0, 0, 1c)
	.word 0xba45a193  ! 2656: ADDC_I	addc 	%r22, 0x0193, %r29
	.word 0xb1e40000  ! 2657: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_wr_106:
	mov	0x6, %r14
	.word 0xf8f38e40  ! 2658: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_wr_107:
	mov	0x2c, %r14
	.word 0xfef389e0  ! 2659: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbde48000  ! 2661: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_230), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbfe40000  ! 2667: SAVE_R	save	%r16, %r0, %r31
	.word 0xbfe5e0cf  ! 2668: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb5e5e190  ! 2670: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_231), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_200:
	setx	0x30010f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_232), 16, 16)) -> intp(0, 0, 22)
T0_asi_reg_wr_108:
	mov	0x10, %r14
	.word 0xf0f384a0  ! 2674: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbd347001  ! 2676: SRLX_I	srlx	%r17, 0x0001, %r30
T0_asi_reg_wr_109:
	mov	0x2d, %r14
	.word 0xf0f38400  ! 2678: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_233), 16, 16)) -> intp(0, 0, d)
iob_intr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_234), 16, 16)) -> intp(0, 0, 25)
	.word 0xbde5e0b1  ! 2688: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbfe54000  ! 2690: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_rd_123:
	mov	0x23, %r14
	.word 0xf6db84a0  ! 2693: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T0_asi_reg_wr_110:
	mov	0x3c2, %r14
	.word 0xf8f38e80  ! 2697: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T0_asi_reg_rd_124:
	mov	0xf, %r14
	.word 0xf4db89e0  ! 2701: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T0_asi_reg_rd_125:
	mov	0x20, %r14
	.word 0xf8db8e40  ! 2702: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb9e5a079  ! 2703: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde58000  ! 2704: SAVE_R	save	%r22, %r0, %r30
	.word 0xb23460da  ! 2706: ORN_I	orn 	%r17, 0x00da, %r25
	.word 0xb5e4e018  ! 2707: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e50000  ! 2708: SAVE_R	save	%r20, %r0, %r27
iob_intr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_235), 16, 16)) -> intp(0, 0, 38)
cpu_intr_0_201:
	setx	0x300113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_236), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_237), 16, 16)) -> intp(0, 0, 37)
	.word 0xb9e52091  ! 2722: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_202:
	setx	0x320132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4b48000  ! 2726: SUBCcc_R	orncc 	%r18, %r0, %r26
	.word 0xb0344000  ! 2728: ORN_R	orn 	%r17, %r0, %r24
cpu_intr_0_203:
	setx	0x320237, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_126:
	mov	0x28, %r14
	.word 0xf0db8e60  ! 2734: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbde4e09b  ! 2735: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb80c8000  ! 2737: AND_R	and 	%r18, %r0, %r28
iob_intr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_238), 16, 16)) -> intp(0, 0, 7)
iob_intr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_239), 16, 16)) -> intp(0, 0, 4)
	.word 0xb5e4e0f7  ! 2745: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbde58000  ! 2753: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_wr_111:
	mov	0x3c3, %r14
	.word 0xfcf384a0  ! 2756: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb7e58000  ! 2757: SAVE_R	save	%r22, %r0, %r27
	.word 0xb1e5e0e4  ! 2758: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb1e48000  ! 2759: SAVE_R	save	%r18, %r0, %r24
	.word 0xbde40000  ! 2761: SAVE_R	save	%r16, %r0, %r30
cpu_intr_0_204:
	setx	0x340329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e168  ! 2765: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e42093  ! 2771: SAVE_I	save	%r16, 0x0001, %r26
iob_intr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_240), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_wr_112:
	mov	0x3c6, %r14
	.word 0xf6f38400  ! 2774: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T0_asi_reg_wr_113:
	mov	0x34, %r14
	.word 0xfaf384a0  ! 2776: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbfe44000  ! 2778: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_241), 16, 16)) -> intp(0, 0, 8)
iob_intr_0_242:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_242), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb9e58000  ! 2785: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_205:
	setx	0x34021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5c000  ! 2787: SAVE_R	save	%r23, %r0, %r25
	.word 0xb92d2001  ! 2790: SLL_I	sll 	%r20, 0x0001, %r28
T0_asi_reg_wr_114:
	mov	0x37, %r14
	.word 0xfef38e80  ! 2791: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb1e5214b  ! 2792: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3643801  ! 2793: MOVcc_I	<illegal instruction>
T0_asi_reg_wr_115:
	mov	0x1f, %r14
	.word 0xf6f38e80  ! 2794: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_0_243:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_243), 16, 16)) -> intp(0, 0, 14)
cpu_intr_0_206:
	setx	0x37023c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_244:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_244), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_rd_127:
	mov	0x20, %r14
	.word 0xfcdb89e0  ! 2801: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb7e54000  ! 2802: SAVE_R	save	%r21, %r0, %r27
	.word 0xbf518000  ! 2805: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe56092  ! 2810: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_207:
	setx	0x37010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_128:
	mov	0xa, %r14
	.word 0xf2db8e60  ! 2818: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_0_245:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_245), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbe2c206b  ! 2820: ANDN_I	andn 	%r16, 0x006b, %r31
	.word 0xb9e5e0c1  ! 2821: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xba156009  ! 2822: OR_I	or 	%r21, 0x0009, %r29
T0_asi_reg_rd_129:
	mov	0x35, %r14
	.word 0xfedb8e80  ! 2823: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe460fb  ! 2828: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_246:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_246), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_wr_116:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 2834: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb9e54000  ! 2835: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_rd_130:
	mov	0x3c0, %r14
	.word 0xf6db8400  ! 2837: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_0_247:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_247), 16, 16)) -> intp(0, 0, 25)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_0_248:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_248), 16, 16)) -> intp(0, 0, 15)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_249:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_249), 16, 16)) -> intp(0, 0, 11)
	.word 0xbe048000  ! 2853: ADD_R	add 	%r18, %r0, %r31
	.word 0xb12c6001  ! 2854: SLL_I	sll 	%r17, 0x0001, %r24
	.word 0xb3e5a176  ! 2856: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_wr_117:
	mov	0x3c0, %r14
	.word 0xf8f38400  ! 2857: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbbe40000  ! 2859: SAVE_R	save	%r16, %r0, %r29
	.word 0xbfe4a1d8  ! 2860: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_wr_118:
	mov	0x1c, %r14
	.word 0xfcf38e40  ! 2863: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb3e4e12f  ! 2867: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_250:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_250), 16, 16)) -> intp(0, 0, 27)
cpu_intr_0_208:
	setx	0x370001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_251:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_251), 16, 16)) -> intp(0, 0, 17)
T0_asi_reg_wr_119:
	mov	0x3c1, %r14
	.word 0xfcf38400  ! 2872: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_0_252:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_252), 16, 16)) -> intp(0, 0, 10)
	.word 0xb3e560e4  ! 2875: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_wr_120:
	mov	0x1c, %r14
	.word 0xf2f38e40  ! 2877: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_wr_121:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 2879: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbab42066  ! 2880: ORNcc_I	orncc 	%r16, 0x0066, %r29
cpu_intr_0_209:
	setx	0x37030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_122:
	mov	0x18, %r14
	.word 0xf0f38e40  ! 2888: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb1e46049  ! 2892: SAVE_I	save	%r17, 0x0001, %r24
cpu_intr_0_210:
	setx	0x36021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e52057  ! 2895: SAVE_I	save	%r20, 0x0001, %r24
iob_intr_0_253:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_253), 16, 16)) -> intp(0, 0, 31)
	.word 0xbbe56074  ! 2898: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5e4c000  ! 2901: SAVE_R	save	%r19, %r0, %r26
	.word 0xbf520000  ! 2903: RDPR_PIL	<illegal instruction>
T0_asi_reg_rd_131:
	mov	0x3c1, %r14
	.word 0xfedb84a0  ! 2906: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb7e5e06a  ! 2910: SAVE_I	save	%r23, 0x0001, %r27
cpu_intr_0_211:
	setx	0x340234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc0da123  ! 2914: AND_I	and 	%r22, 0x0123, %r30
	.word 0xbc244000  ! 2915: SUB_R	sub 	%r17, %r0, %r30
	.word 0xbfe560f2  ! 2918: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xba244000  ! 2920: SUB_R	sub 	%r17, %r0, %r29
	.word 0xb3e4e16f  ! 2921: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_wr_123:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 2922: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_254:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_254), 16, 16)) -> intp(0, 0, 20)
iob_intr_0_255:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_255), 16, 16)) -> intp(0, 0, b)
iob_intr_0_256:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_256), 16, 16)) -> intp(0, 0, 2d)
cpu_intr_0_212:
	setx	0x35021c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_213:
	setx	0x35010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_124:
	mov	0x1a, %r14
	.word 0xf4f38e40  ! 2936: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_125:
	mov	0x3c6, %r14
	.word 0xfcf38e40  ! 2938: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_wr_126:
	mov	0x3c0, %r14
	.word 0xfcf38e80  ! 2939: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbbe5c000  ! 2940: SAVE_R	save	%r23, %r0, %r29
cpu_intr_0_214:
	setx	0x37010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 2942: SAVE_R	save	%r17, %r0, %r30
iob_intr_0_257:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_257), 16, 16)) -> intp(0, 0, 0)
iob_intr_0_258:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_258), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_wr_127:
	mov	0x3c3, %r14
	.word 0xfef38400  ! 2950: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb9e50000  ! 2953: SAVE_R	save	%r20, %r0, %r28
	.word 0xb9e58000  ! 2955: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_215:
	setx	0x35001c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_259:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_259), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_rd_132:
	mov	0x14, %r14
	.word 0xfedb8e60  ! 2968: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb5e50000  ! 2969: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_260:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_260), 16, 16)) -> intp(0, 0, 22)
	.word 0xb9e4e02b  ! 2973: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb7e40000  ! 2980: SAVE_R	save	%r16, %r0, %r27
	.word 0xb5e46004  ! 2982: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_261:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_261), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_262:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_262), 16, 16)) -> intp(0, 0, 4)
	.word 0xb5e54000  ! 2989: SAVE_R	save	%r21, %r0, %r26
	.word 0xbde48000  ! 2990: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_263:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_263), 16, 16)) -> intp(0, 0, 35)
cpu_intr_0_216:
	setx	0x34001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_133:
	mov	0xd, %r14
	.word 0xf0db8400  ! 2997: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_0_264:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_264), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_rd_134:
	mov	0x3c6, %r14
	.word 0xf2db8400  ! 3000: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_0_265:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_265), 16, 16)) -> intp(0, 0, 3a)
	.word 0xb52d9000  ! 3005: SLLX_R	sllx	%r22, %r0, %r26
	.word 0xbfe4e163  ! 3010: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb72dd000  ! 3013: SLLX_R	sllx	%r23, %r0, %r27
	.word 0xb3e5e17f  ! 3016: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_rd_135:
	mov	0x36, %r14
	.word 0xf6db8e80  ! 3019: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_217:
	setx	0x360022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_266:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_266), 16, 16)) -> intp(0, 0, 36)
cpu_intr_0_218:
	setx	0x350330, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_128:
	mov	0xc, %r14
	.word 0xf6f38e40  ! 3025: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_219:
	setx	0x340108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 3029: SAVE_R	save	%r20, %r0, %r29
	.word 0xbbe4c000  ! 3030: SAVE_R	save	%r19, %r0, %r29
	.word 0xb1e4e195  ! 3033: SAVE_I	save	%r19, 0x0001, %r24
iob_intr_0_267:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_267), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_220:
	setx	0x37031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb77c0400  ! 3040: MOVR_R	movre	%r16, %r0, %r27
	.word 0xb3e42019  ! 3042: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe4e02c  ! 3047: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_wr_129:
	mov	0x28, %r14
	.word 0xf0f38e60  ! 3048: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_0_221:
	setx	0x34020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_268:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_268), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_269:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_269), 16, 16)) -> intp(0, 0, 1b)
cpu_intr_0_222:
	setx	0x350008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7341000  ! 3054: SRLX_R	srlx	%r16, %r0, %r27
T0_asi_reg_wr_130:
	mov	0x23, %r14
	.word 0xfef389e0  ! 3055: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_0_223:
	setx	0x340334, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_136:
	mov	0x1e, %r14
	.word 0xfcdb8400  ! 3058: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb1e48000  ! 3060: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_270:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_270), 16, 16)) -> intp(0, 0, 29)
	.word 0xbec44000  ! 3062: ADDCcc_R	addccc 	%r17, %r0, %r31
	.word 0xb2b560c5  ! 3063: SUBCcc_I	orncc 	%r21, 0x00c5, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb6b5e1b0  ! 3065: ORNcc_I	orncc 	%r23, 0x01b0, %r27
T0_asi_reg_wr_131:
	mov	0x3c0, %r14
	.word 0xf6f389e0  ! 3066: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_0_224:
	setx	0x360227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e561ae  ! 3068: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_271:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_271), 16, 16)) -> intp(0, 0, 24)
	.word 0xbde5c000  ! 3071: SAVE_R	save	%r23, %r0, %r30
	.word 0xb1e58000  ! 3073: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_225:
	setx	0x360121, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_132:
	mov	0x10, %r14
	.word 0xfef38400  ! 3075: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T0_asi_reg_wr_133:
	mov	0x16, %r14
	.word 0xf4f38e40  ! 3076: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_rd_137:
	mov	0x3c8, %r14
	.word 0xf2db84a0  ! 3077: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T0_asi_reg_rd_138:
	mov	0x3c8, %r14
	.word 0xfedb84a0  ! 3079: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb53c3001  ! 3080: SRAX_I	srax	%r16, 0x0001, %r26
	.word 0xbde5a176  ! 3083: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_272:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_272), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_226:
	setx	0x370203, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_134:
	mov	0x3c4, %r14
	.word 0xfaf384a0  ! 3092: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_135:
	mov	0x1, %r14
	.word 0xf8f38400  ! 3098: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_0_273:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_273), 16, 16)) -> intp(0, 0, 38)
	.word 0xb5e4e13d  ! 3100: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb5e54000  ! 3103: SAVE_R	save	%r21, %r0, %r26
T0_asi_reg_wr_136:
	mov	0x1b, %r14
	.word 0xf2f384a0  ! 3105: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_0_227:
	setx	0x360118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_274:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_274), 16, 16)) -> intp(0, 0, 34)
	.word 0xb4b46039  ! 3111: SUBCcc_I	orncc 	%r17, 0x0039, %r26
	.word 0xb9e5e0d5  ! 3115: SAVE_I	save	%r23, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_228:
	setx	0x350206, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_137:
	mov	0x1d, %r14
	.word 0xf8f38e80  ! 3120: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_0_229:
	setx	0x360021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_275:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_275), 16, 16)) -> intp(0, 0, 39)
	.word 0xb3e4e074  ! 3130: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_276:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_276), 16, 16)) -> intp(0, 0, 17)
cpu_intr_0_230:
	setx	0x370135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaade1ed  ! 3137: ANDNcc_I	andncc 	%r23, 0x01ed, %r29
T0_asi_reg_wr_138:
	mov	0x1f, %r14
	.word 0xfaf38400  ! 3138: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_0_231:
	setx	0x350228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb83560a3  ! 3143: SUBC_I	orn 	%r21, 0x00a3, %r28
iob_intr_0_277:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_277), 16, 16)) -> intp(0, 0, 20)
iob_intr_0_278:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_278), 16, 16)) -> intp(0, 0, 23)
cpu_intr_0_232:
	setx	0x35010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4601f  ! 3156: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_wr_139:
	mov	0x3c2, %r14
	.word 0xf0f38400  ! 3157: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_0_279:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_279), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb69c2166  ! 3161: XORcc_I	xorcc 	%r16, 0x0166, %r27
cpu_intr_0_233:
	setx	0x36013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_140:
	mov	0x3c1, %r14
	.word 0xfef38e60  ! 3165: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbfe4e014  ! 3166: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb4b4609a  ! 3168: ORNcc_I	orncc 	%r17, 0x009a, %r26
cpu_intr_0_234:
	setx	0x36013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5207c  ! 3170: SAVE_I	save	%r20, 0x0001, %r25
cpu_intr_0_235:
	setx	0x350037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5c000  ! 3175: SAVE_R	save	%r23, %r0, %r30
	.word 0xbbe58000  ! 3179: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_wr_141:
	mov	0x36, %r14
	.word 0xfcf38e40  ! 3181: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbfe54000  ! 3182: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_280:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_280), 16, 16)) -> intp(0, 0, 20)
	.word 0xb1e58000  ! 3185: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_rd_139:
	mov	0x14, %r14
	.word 0xf8db8400  ! 3186: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_0_236:
	setx	0x35002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb09c21cd  ! 3188: XORcc_I	xorcc 	%r16, 0x01cd, %r24
	.word 0xb7e52124  ! 3192: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x8f902000  ! 3194: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
T0_asi_reg_rd_140:
	mov	0x3c8, %r14
	.word 0xfadb84a0  ! 3196: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbde4c000  ! 3198: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_237:
	setx	0x38023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 3203: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_238:
	setx	0x3a003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e58000  ! 3208: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_281:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_281), 16, 16)) -> intp(0, 0, 27)
	.word 0xbf3d1000  ! 3214: SRAX_R	srax	%r20, %r0, %r31
	.word 0xb7e5a039  ! 3215: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e4c000  ! 3216: SAVE_R	save	%r19, %r0, %r26
	.word 0xb9e4e037  ! 3217: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_239:
	setx	0x390302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e0f1  ! 3223: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb1e50000  ! 3225: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_282:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_282), 16, 16)) -> intp(0, 0, 27)
	.word 0xb3e58000  ! 3230: SAVE_R	save	%r22, %r0, %r25
	.word 0xbfe460a5  ! 3231: SAVE_I	save	%r17, 0x0001, %r31
cpu_intr_0_240:
	setx	0x38000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe2c6058  ! 3234: ANDN_I	andn 	%r17, 0x0058, %r31
	.word 0xbde54000  ! 3235: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_wr_142:
	mov	0x3c1, %r14
	.word 0xf4f38400  ! 3238: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_0_241:
	setx	0x380239, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_283:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_283), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_rd_141:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 3249: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_242:
	setx	0x3a031c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_243:
	setx	0x3a0136, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_142:
	mov	0x29, %r14
	.word 0xf0db84a0  ! 3257: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb1e54000  ! 3258: SAVE_R	save	%r21, %r0, %r24
iob_intr_0_284:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_284), 16, 16)) -> intp(0, 0, 5)
	.word 0xb285c000  ! 3262: ADDcc_R	addcc 	%r23, %r0, %r25
	.word 0xbbe48000  ! 3263: SAVE_R	save	%r18, %r0, %r29
	.word 0xb7e4c000  ! 3264: SAVE_R	save	%r19, %r0, %r27
	.word 0xbfe461b0  ! 3265: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb6b58000  ! 3267: SUBCcc_R	orncc 	%r22, %r0, %r27
T0_asi_reg_rd_143:
	mov	0x3c6, %r14
	.word 0xf2db89e0  ! 3269: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_0_285:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_285), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_244:
	setx	0x3a0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde42070  ! 3272: SAVE_I	save	%r16, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e420a5  ! 3277: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e40000  ! 3283: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_286:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_286), 16, 16)) -> intp(0, 0, 28)
	.word 0xbbe5a099  ! 3286: SAVE_I	save	%r22, 0x0001, %r29
cpu_intr_0_245:
	setx	0x38001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a180  ! 3291: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xba140000  ! 3292: OR_R	or 	%r16, %r0, %r29
	.word 0xb3e420cf  ! 3294: SAVE_I	save	%r16, 0x0001, %r25
iob_intr_0_287:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_287), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_144:
	mov	0x29, %r14
	.word 0xf0db89e0  ! 3302: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb5e44000  ! 3303: SAVE_R	save	%r17, %r0, %r26
cpu_intr_0_246:
	setx	0x3a0200, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_143:
	mov	0x24, %r14
	.word 0xf8f38e80  ! 3306: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_0_288:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_288), 16, 16)) -> intp(0, 0, 1a)
iob_intr_0_289:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_289), 16, 16)) -> intp(0, 0, 13)
T0_asi_reg_rd_145:
	mov	0x3, %r14
	.word 0xf0db8e40  ! 3309: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbe2de0cf  ! 3311: ANDN_I	andn 	%r23, 0x00cf, %r31
	.word 0xb5e4a00d  ! 3313: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3e5a08e  ! 3314: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbab5204f  ! 3315: ORNcc_I	orncc 	%r20, 0x004f, %r29
	.word 0xbbe4a02b  ! 3316: SAVE_I	save	%r18, 0x0001, %r29
iob_intr_0_290:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_290), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbfe46003  ! 3318: SAVE_I	save	%r17, 0x0001, %r31
T0_asi_reg_wr_144:
	mov	0x17, %r14
	.word 0xf2f384a0  ! 3319: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T0_asi_reg_wr_145:
	mov	0x3c0, %r14
	.word 0xf8f389e0  ! 3321: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbde5a0d3  ! 3324: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb3e50000  ! 3325: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_wr_146:
	mov	0x3c2, %r14
	.word 0xf8f389e0  ! 3326: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb9518000  ! 3327: RDPR_PSTATE	<illegal instruction>
iob_intr_0_291:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_291), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_292:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_292), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_293:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_293), 16, 16)) -> intp(0, 0, 3d)
cpu_intr_0_247:
	setx	0x3b0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde42180  ! 3337: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbfe5c000  ! 3340: SAVE_R	save	%r23, %r0, %r31
	.word 0xbfe54000  ! 3341: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_wr_147:
	mov	0x1, %r14
	.word 0xfaf389e0  ! 3342: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_294:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_294), 16, 16)) -> intp(0, 0, 28)
cpu_intr_0_248:
	setx	0x380238, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_146:
	mov	0x4, %r14
	.word 0xf4db84a0  ! 3345: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbeb4e10b  ! 3346: SUBCcc_I	orncc 	%r19, 0x010b, %r31
	.word 0xbe9de02d  ! 3347: XORcc_I	xorcc 	%r23, 0x002d, %r31
cpu_intr_0_249:
	setx	0x3b0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 3349: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_295:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_295), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb3e5e0c8  ! 3351: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb9e5e0de  ! 3352: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde4c000  ! 3353: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_wr_148:
	mov	0x12, %r14
	.word 0xf0f38e60  ! 3354: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_0_296:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_296), 16, 16)) -> intp(0, 0, 3b)
	.word 0xbe140000  ! 3360: OR_R	or 	%r16, %r0, %r31
	.word 0xb1e5a189  ! 3361: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_297:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_297), 16, 16)) -> intp(0, 0, 18)
	.word 0xb7e4a134  ! 3363: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_298:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_298), 16, 16)) -> intp(0, 0, f)
T0_asi_reg_wr_149:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 3369: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_299:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_299), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_250:
	setx	0x3b0302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 3376: SAVE_R	save	%r19, %r0, %r30
iob_intr_0_300:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_300), 16, 16)) -> intp(0, 0, 2a)
cpu_intr_0_251:
	setx	0x3a0108, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_301:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_301), 16, 16)) -> intp(0, 0, d)
	.word 0xbfe5c000  ! 3388: SAVE_R	save	%r23, %r0, %r31
	.word 0xb7e44000  ! 3395: SAVE_R	save	%r17, %r0, %r27
cpu_intr_0_252:
	setx	0x38012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3c0000  ! 3398: SRA_R	sra 	%r16, %r0, %r31
iob_intr_0_302:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_302), 16, 16)) -> intp(0, 0, 3f)
iob_intr_0_303:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_303), 16, 16)) -> intp(0, 0, 1a)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_304:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_304), 16, 16)) -> intp(0, 0, 18)
iob_intr_0_305:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_305), 16, 16)) -> intp(0, 0, 4)
T0_asi_reg_wr_150:
	mov	0x38, %r14
	.word 0xf8f38e40  ! 3406: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb1e50000  ! 3407: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_306:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_306), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_rd_147:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 3409: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_rd_148:
	mov	0x23, %r14
	.word 0xfedb8e60  ! 3413: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb1e40000  ! 3415: SAVE_R	save	%r16, %r0, %r24
	.word 0xbde5a09b  ! 3417: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1e5a07f  ! 3419: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_307:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_307), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_rd_149:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 3424: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_308:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_308), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbe95c000  ! 3427: ORcc_R	orcc 	%r23, %r0, %r31
	.word 0xbfe50000  ! 3428: SAVE_R	save	%r20, %r0, %r31
iob_intr_0_309:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_309), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_310:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_310), 16, 16)) -> intp(0, 0, 1c)
iob_intr_0_311:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_311), 16, 16)) -> intp(0, 0, 15)
	.word 0xbbe4c000  ! 3436: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_wr_151:
	mov	0x1d, %r14
	.word 0xf0f38e60  ! 3437: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_0_312:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_312), 16, 16)) -> intp(0, 0, 8)
iob_intr_0_313:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_313), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_314:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_314), 16, 16)) -> intp(0, 0, 19)
	.word 0xb0a48000  ! 3445: SUBcc_R	subcc 	%r18, %r0, %r24
cpu_intr_0_253:
	setx	0x3b0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 3448: SAVE_R	save	%r18, %r0, %r26
	.word 0xb5e54000  ! 3449: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_254:
	setx	0x390320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_255:
	setx	0x3b030f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_315:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_315), 16, 16)) -> intp(0, 0, 29)
	.word 0xbfe52053  ! 3458: SAVE_I	save	%r20, 0x0001, %r31
iob_intr_0_316:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_316), 16, 16)) -> intp(0, 0, 2a)
	.word 0xb5e40000  ! 3465: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_rd_150:
	mov	0x12, %r14
	.word 0xf8db8e40  ! 3466: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb0256139  ! 3475: SUB_I	sub 	%r21, 0x0139, %r24
cpu_intr_0_256:
	setx	0x3a0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe35e046  ! 3478: ORN_I	orn 	%r23, 0x0046, %r31
T0_asi_reg_rd_151:
	mov	0xc, %r14
	.word 0xf8db8e80  ! 3484: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb48d2052  ! 3488: ANDcc_I	andcc 	%r20, 0x0052, %r26
	.word 0xb7e5a08a  ! 3489: SAVE_I	save	%r22, 0x0001, %r27
	.word 0x9194e013  ! 3490: WRPR_PIL_I	wrpr	%r19, 0x0013, %pil
	.word 0xb9e44000  ! 3491: SAVE_R	save	%r17, %r0, %r28
	.word 0xb1e5a135  ! 3493: SAVE_I	save	%r22, 0x0001, %r24
cpu_intr_0_257:
	setx	0x380307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde52026  ! 3499: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_rd_152:
	mov	0x10, %r14
	.word 0xfcdb8e40  ! 3501: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_258:
	setx	0x3b0104, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_152:
	mov	0x25, %r14
	.word 0xf4f38e40  ! 3503: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbea48000  ! 3505: SUBcc_R	subcc 	%r18, %r0, %r31
	.word 0x859460de  ! 3506: WRPR_TSTATE_I	wrpr	%r17, 0x00de, %tstate
	.word 0xbbe5c000  ! 3508: SAVE_R	save	%r23, %r0, %r29
	.word 0xb4a40000  ! 3509: SUBcc_R	subcc 	%r16, %r0, %r26
	.word 0xb23de03f  ! 3513: XNOR_I	xnor 	%r23, 0x003f, %r25
T0_asi_reg_wr_153:
	mov	0x2c, %r14
	.word 0xf2f38e40  ! 3515: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_317:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_317), 16, 16)) -> intp(0, 0, 11)
	.word 0xb3e4e0e3  ! 3519: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_wr_154:
	mov	0x2a, %r14
	.word 0xfaf38400  ! 3525: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_0_259:
	setx	0x3b0100, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_318:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_318), 16, 16)) -> intp(0, 0, b)
	.word 0xbbe4a141  ! 3531: SAVE_I	save	%r18, 0x0001, %r29
T0_asi_reg_rd_153:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 3534: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbde46183  ! 3536: SAVE_I	save	%r17, 0x0001, %r30
T0_asi_reg_wr_155:
	mov	0x14, %r14
	.word 0xf4f38e60  ! 3537: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_0_319:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_319), 16, 16)) -> intp(0, 0, 29)
	.word 0xb5e4c000  ! 3544: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_wr_156:
	mov	0x1c, %r14
	.word 0xf8f38e80  ! 3545: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbde5a09c  ! 3546: SAVE_I	save	%r22, 0x0001, %r30
iob_intr_0_320:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_320), 16, 16)) -> intp(0, 0, 21)
iob_intr_0_321:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_321), 16, 16)) -> intp(0, 0, 33)
iob_intr_0_322:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_322), 16, 16)) -> intp(0, 0, 24)
	.word 0xb1e461b8  ! 3554: SAVE_I	save	%r17, 0x0001, %r24
cpu_intr_0_260:
	setx	0x3b0102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_323:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_323), 16, 16)) -> intp(0, 0, 7)
cpu_intr_0_261:
	setx	0x39000c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_262:
	setx	0x3b013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6c4c000  ! 3563: ADDCcc_R	addccc 	%r19, %r0, %r27
cpu_intr_0_263:
	setx	0x3a0312, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_264:
	setx	0x38003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbaa4c000  ! 3572: SUBcc_R	subcc 	%r19, %r0, %r29
T0_asi_reg_rd_154:
	mov	0x19, %r14
	.word 0xf8db89e0  ! 3574: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb9e40000  ! 3577: SAVE_R	save	%r16, %r0, %r28
iob_intr_0_324:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_324), 16, 16)) -> intp(0, 0, c)
	.word 0xb3e48000  ! 3580: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_265:
	setx	0x3b000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_157:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 3587: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb89c4000  ! 3588: XORcc_R	xorcc 	%r17, %r0, %r28
	.word 0xbde4e131  ! 3591: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_rd_155:
	mov	0xc, %r14
	.word 0xfedb8e40  ! 3593: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_266:
	setx	0x390333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb03c8000  ! 3597: XNOR_R	xnor 	%r18, %r0, %r24
	.word 0xb97dc400  ! 3602: MOVR_R	movre	%r23, %r0, %r28
	.word 0xb9e5e0e1  ! 3604: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbfe4e07a  ! 3606: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb5e40000  ! 3607: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_267:
	setx	0x390009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd480000  ! 3611: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbe95e0dc  ! 3612: ORcc_I	orcc 	%r23, 0x00dc, %r31
iob_intr_0_325:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_325), 16, 16)) -> intp(0, 0, c)
	.word 0xbbe54000  ! 3614: SAVE_R	save	%r21, %r0, %r29
	.word 0xb9e44000  ! 3621: SAVE_R	save	%r17, %r0, %r28
cpu_intr_0_268:
	setx	0x39011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_156:
	mov	0x34, %r14
	.word 0xf8db89e0  ! 3623: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T0_asi_reg_wr_158:
	mov	0x3c5, %r14
	.word 0xf0f38e40  ! 3624: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_269:
	setx	0x3a012e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_270:
	setx	0x3a0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e54000  ! 3629: SAVE_R	save	%r21, %r0, %r26
	.word 0xb3e44000  ! 3630: SAVE_R	save	%r17, %r0, %r25
	.word 0xb9641800  ! 3632: MOVcc_R	<illegal instruction>
iob_intr_0_326:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_326), 16, 16)) -> intp(0, 0, e)
	.word 0xb5e50000  ! 3637: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_327:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_327), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_rd_157:
	mov	0x8, %r14
	.word 0xf6db89e0  ! 3645: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbf508000  ! 3646: RDPR_TSTATE	<illegal instruction>
cpu_intr_0_271:
	setx	0x390038, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_158:
	mov	0x3c7, %r14
	.word 0xfadb84a0  ! 3650: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_0_328:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_328), 16, 16)) -> intp(0, 0, 17)
iob_intr_0_329:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_329), 16, 16)) -> intp(0, 0, 27)
	.word 0xb4950000  ! 3653: ORcc_R	orcc 	%r20, %r0, %r26
	.word 0xb40c8000  ! 3660: AND_R	and 	%r18, %r0, %r26
	.word 0xbbe46115  ! 3663: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_330:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_330), 16, 16)) -> intp(0, 0, 22)
	.word 0xbde40000  ! 3671: SAVE_R	save	%r16, %r0, %r30
cpu_intr_0_272:
	setx	0x3e0016, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_331:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_331), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_273:
	setx	0x3f0035, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_159:
	mov	0x3c2, %r14
	.word 0xfcdb8e60  ! 3683: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_0_274:
	setx	0x3e0018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 3687: SAVE_R	save	%r17, %r0, %r25
cpu_intr_0_275:
	setx	0x3f0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_160:
	mov	0x2d, %r14
	.word 0xf4db8400  ! 3695: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbbe54000  ! 3696: SAVE_R	save	%r21, %r0, %r29
T0_asi_reg_rd_161:
	mov	0x1d, %r14
	.word 0xfedb8e80  ! 3698: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_0_332:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_332), 16, 16)) -> intp(0, 0, 12)
	.word 0xb1e5e02f  ! 3701: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbfe5e1cd  ! 3703: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7e48000  ! 3704: SAVE_R	save	%r18, %r0, %r27
cpu_intr_0_276:
	setx	0x3d0218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e44000  ! 3706: SAVE_R	save	%r17, %r0, %r27
	.word 0xb5e44000  ! 3707: SAVE_R	save	%r17, %r0, %r26
	.word 0xbde5e025  ! 3718: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_wr_159:
	mov	0x24, %r14
	.word 0xf8f38e40  ! 3721: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb7e58000  ! 3722: SAVE_R	save	%r22, %r0, %r27
cpu_intr_0_277:
	setx	0x3e0213, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_160:
	mov	0x33, %r14
	.word 0xfef38e60  ! 3725: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbbe46180  ! 3727: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_wr_161:
	mov	0x1a, %r14
	.word 0xfaf38e80  ! 3732: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb3e54000  ! 3734: SAVE_R	save	%r21, %r0, %r25
cpu_intr_0_278:
	setx	0x3d0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbf518000  ! 3738: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe44000  ! 3739: SAVE_R	save	%r17, %r0, %r31
	.word 0xb68de035  ! 3741: ANDcc_I	andcc 	%r23, 0x0035, %r27
cpu_intr_0_279:
	setx	0x3c002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb23c604f  ! 3748: XNOR_I	xnor 	%r17, 0x004f, %r25
T0_asi_reg_rd_162:
	mov	0x9, %r14
	.word 0xf4db8e80  ! 3749: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb3e5602b  ! 3753: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_333:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_333), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_280:
	setx	0x3e0208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_281:
	setx	0x3c0309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_282:
	setx	0x3f003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_163:
	mov	0x3c4, %r14
	.word 0xf0db8e40  ! 3763: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_0_283:
	setx	0x3e0305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_334:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_334), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_284:
	setx	0x3f0305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_335:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_335), 16, 16)) -> intp(0, 0, 15)
	.word 0xb1e46093  ! 3771: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_wr_162:
	mov	0x3c3, %r14
	.word 0xf8f38400  ! 3773: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_0_285:
	setx	0x3e0111, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_164:
	mov	0x35, %r14
	.word 0xfadb8e80  ! 3777: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb73dd000  ! 3781: SRAX_R	srax	%r23, %r0, %r27
cpu_intr_0_286:
	setx	0x3e0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbec4c000  ! 3786: ADDCcc_R	addccc 	%r19, %r0, %r31
	.word 0xb1e40000  ! 3788: SAVE_R	save	%r16, %r0, %r24
	.word 0xb3e40000  ! 3789: SAVE_R	save	%r16, %r0, %r25
	.word 0xbbe5a129  ! 3791: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb3e4c000  ! 3792: SAVE_R	save	%r19, %r0, %r25
iob_intr_0_336:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_336), 16, 16)) -> intp(0, 0, 24)
cpu_intr_0_287:
	setx	0x3e020e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_337:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_337), 16, 16)) -> intp(0, 0, f)
	.word 0xb204e0f5  ! 3798: ADD_I	add 	%r19, 0x00f5, %r25
	.word 0xb3e4e0cc  ! 3799: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_338:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_338), 16, 16)) -> intp(0, 0, 25)
	.word 0xbde40000  ! 3803: SAVE_R	save	%r16, %r0, %r30
T0_asi_reg_wr_163:
	mov	0x27, %r14
	.word 0xf4f38400  ! 3805: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb7e560b5  ! 3808: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_339:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_339), 16, 16)) -> intp(0, 0, 35)
iob_intr_0_340:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_340), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_341:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_341), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_342:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_342), 16, 16)) -> intp(0, 0, 14)
	.word 0xb32c9000  ! 3823: SLLX_R	sllx	%r18, %r0, %r25
T0_asi_reg_rd_165:
	mov	0x1f, %r14
	.word 0xfadb8e40  ! 3825: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb12d7001  ! 3828: SLLX_I	sllx	%r21, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e4a0f7  ! 3833: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe54000  ! 3836: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_343:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_343), 16, 16)) -> intp(0, 0, 16)
T0_asi_reg_rd_166:
	mov	0x1a, %r14
	.word 0xf6db8400  ! 3839: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb63d4000  ! 3841: XNOR_R	xnor 	%r21, %r0, %r27
T0_asi_reg_rd_167:
	mov	0x1d, %r14
	.word 0xf6db84a0  ! 3842: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_0_344:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_344), 16, 16)) -> intp(0, 0, 20)
cpu_intr_0_288:
	setx	0x3c001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 3845: SAVE_R	save	%r16, %r0, %r25
iob_intr_0_345:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_345), 16, 16)) -> intp(0, 0, 19)
	.word 0xb7e44000  ! 3852: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_wr_164:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 3855: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_289:
	setx	0x3f0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e42128  ! 3862: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe46054  ! 3863: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_rd_168:
	mov	0x1a, %r14
	.word 0xf4db89e0  ! 3865: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbbe52018  ! 3866: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_rd_169:
	mov	0x3c0, %r14
	.word 0xf4db8400  ! 3869: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_0_290:
	setx	0x3f0015, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_346:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_346), 16, 16)) -> intp(0, 0, 27)
	.word 0xbde54000  ! 3878: SAVE_R	save	%r21, %r0, %r30
	.word 0xba848000  ! 3883: ADDcc_R	addcc 	%r18, %r0, %r29
	.word 0xb5e58000  ! 3885: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_347:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_347), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_wr_165:
	mov	0x3c0, %r14
	.word 0xfcf38400  ! 3887: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb845600f  ! 3888: ADDC_I	addc 	%r21, 0x000f, %r28
	.word 0xb1e4a1fe  ! 3891: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e5c000  ! 3894: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_wr_166:
	mov	0x31, %r14
	.word 0xfaf38e40  ! 3895: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_291:
	setx	0x3e0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e19d  ! 3901: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_wr_167:
	mov	0x7, %r14
	.word 0xfaf384a0  ! 3906: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T0_asi_reg_rd_170:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 3907: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb5e4e0a6  ! 3908: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbfe50000  ! 3909: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_rd_171:
	mov	0x32, %r14
	.word 0xf8db8400  ! 3910: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb7e44000  ! 3911: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_rd_172:
	mov	0x35, %r14
	.word 0xfedb8e40  ! 3912: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb5347001  ! 3913: SRLX_I	srlx	%r17, 0x0001, %r26
cpu_intr_0_292:
	setx	0x3d0020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_293:
	setx	0x3c002c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_168:
	mov	0x0, %r14
	.word 0xf8f38e60  ! 3917: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbde4a15d  ! 3918: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb8b4a158  ! 3919: ORNcc_I	orncc 	%r18, 0x0158, %r28
T0_asi_reg_wr_169:
	mov	0x9, %r14
	.word 0xfaf38e80  ! 3920: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_rd_173:
	mov	0x11, %r14
	.word 0xf2db8e80  ! 3923: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T0_asi_reg_rd_174:
	mov	0x3c7, %r14
	.word 0xfcdb8e60  ! 3924: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_0_348:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_348), 16, 16)) -> intp(0, 0, 21)
	.word 0xbbe42075  ! 3929: SAVE_I	save	%r16, 0x0001, %r29
cpu_intr_0_294:
	setx	0x3e0034, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_349:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_349), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_rd_175:
	mov	0x28, %r14
	.word 0xf0db8e40  ! 3935: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbbe42120  ! 3937: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe50000  ! 3939: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_rd_176:
	mov	0x2c, %r14
	.word 0xfadb8e40  ! 3940: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb1e5c000  ! 3942: SAVE_R	save	%r23, %r0, %r24
	.word 0xba0c0000  ! 3943: AND_R	and 	%r16, %r0, %r29
iob_intr_0_350:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_350), 16, 16)) -> intp(0, 0, 31)
	.word 0xbfe5a048  ! 3949: SAVE_I	save	%r22, 0x0001, %r31
iob_intr_0_351:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_351), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_wr_170:
	mov	0x38, %r14
	.word 0xfcf38e40  ! 3952: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbbe50000  ! 3957: SAVE_R	save	%r20, %r0, %r29
	.word 0xbbe4205d  ! 3959: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb414c000  ! 3961: OR_R	or 	%r19, %r0, %r26
	.word 0xbfe4a0bf  ! 3963: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e5c000  ! 3968: SAVE_R	save	%r23, %r0, %r25
cpu_intr_0_295:
	setx	0x3e0120, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_352:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_352), 16, 16)) -> intp(0, 0, 28)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xba958000  ! 3973: ORcc_R	orcc 	%r22, %r0, %r29
	.word 0x8d95a109  ! 3974: WRPR_PSTATE_I	wrpr	%r22, 0x0109, %pstate
	.word 0xbbe48000  ! 3976: SAVE_R	save	%r18, %r0, %r29
iob_intr_0_353:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_353), 16, 16)) -> intp(0, 0, 25)
	.word 0xbbe4c000  ! 3978: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_296:
	setx	0x3e0113, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_297:
	setx	0x3e002e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_298:
	setx	0x3e010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde46065  ! 3985: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e461a9  ! 3987: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb6bda1cb  ! 3990: XNORcc_I	xnorcc 	%r22, 0x01cb, %r27
	.word 0xbfe54000  ! 3992: SAVE_R	save	%r21, %r0, %r31
	.word 0xbc15e093  ! 3994: OR_I	or 	%r23, 0x0093, %r30
	.word 0xbde42043  ! 3995: SAVE_I	save	%r16, 0x0001, %r30
T0_asi_reg_rd_177:
	mov	0x3c5, %r14
	.word 0xf2db89e0  ! 3999: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_0_354:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_354), 16, 16)) -> intp(0, 0, 1e)
	.word 0xbfe421f7  ! 4003: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_rd_178:
	mov	0x1, %r14
	.word 0xf2db8e40  ! 4004: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbbe5a101  ! 4006: SAVE_I	save	%r22, 0x0001, %r29
cpu_intr_0_299:
	setx	0x3c0011, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_171:
	mov	0x3c2, %r14
	.word 0xf6f38e40  ! 4008: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_300:
	setx	0x3c0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5211f  ! 4012: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_wr_172:
	mov	0x17, %r14
	.word 0xf8f384a0  ! 4014: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_0_355:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_355), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbbe4c000  ! 4018: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_301:
	setx	0x3c031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b5a157  ! 4021: ORNcc_I	orncc 	%r22, 0x0157, %r28
T0_asi_reg_wr_173:
	mov	0x4, %r14
	.word 0xf2f38e80  ! 4022: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb1e42102  ! 4024: SAVE_I	save	%r16, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_302:
	setx	0x3d0334, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_174:
	mov	0x3c0, %r14
	.word 0xfcf38e80  ! 4029: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T0_asi_reg_rd_179:
	mov	0x0, %r14
	.word 0xf2db84a0  ! 4030: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbbe4c000  ! 4031: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_wr_175:
	mov	0x8, %r14
	.word 0xfcf38e80  ! 4033: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb445c000  ! 4034: ADDC_R	addc 	%r23, %r0, %r26
	.word 0xbde40000  ! 4037: SAVE_R	save	%r16, %r0, %r30
T0_asi_reg_wr_176:
	mov	0x31, %r14
	.word 0xfaf38400  ! 4039: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_0_356:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_356), 16, 16)) -> intp(0, 0, 3)
	.word 0xbabc2061  ! 4041: XNORcc_I	xnorcc 	%r16, 0x0061, %r29
T0_asi_reg_wr_177:
	mov	0x29, %r14
	.word 0xfef38e80  ! 4042: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb9e4e08a  ! 4047: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_wr_178:
	mov	0x2a, %r14
	.word 0xf2f389e0  ! 4050: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_0_357:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_357), 16, 16)) -> intp(0, 0, f)
T0_asi_reg_rd_180:
	mov	0x3c8, %r14
	.word 0xf6db84a0  ! 4055: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_0_303:
	setx	0x3e0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e54000  ! 4057: SAVE_R	save	%r21, %r0, %r26
cpu_intr_0_304:
	setx	0x3f0005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_358:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_358), 16, 16)) -> intp(0, 0, 19)
	.word 0xb3355000  ! 4063: SRLX_R	srlx	%r21, %r0, %r25
T0_asi_reg_rd_181:
	mov	0x3c6, %r14
	.word 0xfadb89e0  ! 4065: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_rd_182:
	mov	0x12, %r14
	.word 0xf0db89e0  ! 4066: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb835e00d  ! 4067: ORN_I	orn 	%r23, 0x000d, %r28
	.word 0xbbe4c000  ! 4072: SAVE_R	save	%r19, %r0, %r29
	.word 0xb5e5e1c0  ! 4073: SAVE_I	save	%r23, 0x0001, %r26
iob_intr_0_359:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_359), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_305:
	setx	0x3e012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_360:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_360), 16, 16)) -> intp(0, 0, 29)
	.word 0xb3e5e07c  ! 4082: SAVE_I	save	%r23, 0x0001, %r25
iob_intr_0_361:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_361), 16, 16)) -> intp(0, 0, 4)
	.word 0xbb2cb001  ! 4089: SLLX_I	sllx	%r18, 0x0001, %r29
iob_intr_0_362:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_362), 16, 16)) -> intp(0, 0, 29)
iob_intr_0_363:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_363), 16, 16)) -> intp(0, 0, 3)
iob_intr_0_364:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_364), 16, 16)) -> intp(0, 0, 12)
iob_intr_0_365:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_365), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb9480000  ! 4099: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb5e5a0a5  ! 4105: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7e58000  ! 4106: SAVE_R	save	%r22, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e420a3  ! 4112: SAVE_I	save	%r16, 0x0001, %r24
cpu_intr_0_306:
	setx	0x410233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4c000  ! 4119: SAVE_R	save	%r19, %r0, %r24
	.word 0xb9e48000  ! 4121: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_rd_183:
	mov	0x21, %r14
	.word 0xfadb84a0  ! 4122: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbe2c4000  ! 4123: ANDN_R	andn 	%r17, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_184:
	mov	0x0, %r14
	.word 0xfedb8e60  ! 4127: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbfe50000  ! 4129: SAVE_R	save	%r20, %r0, %r31
	.word 0xb3e561e2  ! 4130: SAVE_I	save	%r21, 0x0001, %r25
T0_asi_reg_rd_185:
	mov	0x7, %r14
	.word 0xf0db84a0  ! 4131: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T0_asi_reg_rd_186:
	mov	0x28, %r14
	.word 0xf4db89e0  ! 4136: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb20c0000  ! 4137: AND_R	and 	%r16, %r0, %r25
	.word 0xb3e561a8  ! 4139: SAVE_I	save	%r21, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_366:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_366), 16, 16)) -> intp(0, 0, 2f)
T0_asi_reg_wr_179:
	mov	0x2b, %r14
	.word 0xfef384a0  ! 4142: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_0_307:
	setx	0x410314, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_187:
	mov	0x8, %r14
	.word 0xf6db8e40  ! 4147: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_308:
	setx	0x420203, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_180:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 4162: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_wr_181:
	mov	0x4, %r14
	.word 0xfef38e40  ! 4163: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_367:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_367), 16, 16)) -> intp(0, 0, 9)
	.word 0xbde54000  ! 4169: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_rd_188:
	mov	0x1b, %r14
	.word 0xf2db89e0  ! 4170: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T0_asi_reg_rd_189:
	mov	0x3c5, %r14
	.word 0xfcdb8e40  ! 4171: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_0_309:
	setx	0x400034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e111  ! 4173: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_310:
	setx	0x41023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x91952118  ! 4181: WRPR_PIL_I	wrpr	%r20, 0x0118, %pil
iob_intr_0_368:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_368), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb935a001  ! 4188: SRL_I	srl 	%r22, 0x0001, %r28
iob_intr_0_369:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_369), 16, 16)) -> intp(0, 0, 0)
	.word 0xbfe4e13f  ! 4193: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9641800  ! 4195: MOVcc_R	<illegal instruction>
T0_asi_reg_wr_182:
	mov	0x24, %r14
	.word 0xfcf38e40  ! 4196: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb42ca1d1  ! 4198: ANDN_I	andn 	%r18, 0x01d1, %r26
T0_asi_reg_rd_190:
	mov	0x35, %r14
	.word 0xfedb8e40  ! 4199: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_183:
	mov	0x1a, %r14
	.word 0xf8f38e60  ! 4201: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_0_311:
	setx	0x420000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e058  ! 4205: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb9e5206f  ! 4206: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbbe50000  ! 4211: SAVE_R	save	%r20, %r0, %r29
	.word 0xb5e4a01e  ! 4213: SAVE_I	save	%r18, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5350000  ! 4215: SRL_R	srl 	%r20, %r0, %r26
T0_asi_reg_wr_184:
	mov	0x34, %r14
	.word 0xf0f384a0  ! 4216: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T0_asi_reg_wr_185:
	mov	0x34, %r14
	.word 0xf6f38e80  ! 4217: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_0_370:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_370), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_wr_186:
	mov	0x3c3, %r14
	.word 0xfcf384a0  ! 4221: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T0_asi_reg_rd_191:
	mov	0x14, %r14
	.word 0xfadb8e60  ! 4222: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb5e5216c  ! 4225: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbbe5a0d9  ! 4227: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_371:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_371), 16, 16)) -> intp(0, 0, 1)
	.word 0xbfe420c7  ! 4230: SAVE_I	save	%r16, 0x0001, %r31
iob_intr_0_372:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_372), 16, 16)) -> intp(0, 0, 1b)
	.word 0xbfe40000  ! 4233: SAVE_R	save	%r16, %r0, %r31
	.word 0xb1e50000  ! 4234: SAVE_R	save	%r20, %r0, %r24
	.word 0xbfe50000  ! 4235: SAVE_R	save	%r20, %r0, %r31
	.word 0xb08d20d7  ! 4237: ANDcc_I	andcc 	%r20, 0x00d7, %r24
cpu_intr_0_312:
	setx	0x420231, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_313:
	setx	0x42021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_187:
	mov	0x27, %r14
	.word 0xf2f38400  ! 4244: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T0_asi_reg_rd_192:
	mov	0x2d, %r14
	.word 0xf0db84a0  ! 4245: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb7e4a00e  ! 4249: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_314:
	setx	0x43003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_188:
	mov	0x2d, %r14
	.word 0xfaf38400  ! 4253: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb1e40000  ! 4256: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_373:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_373), 16, 16)) -> intp(0, 0, 30)
	.word 0xb7e50000  ! 4258: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_315:
	setx	0x420327, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_193:
	mov	0x3c2, %r14
	.word 0xf4db8e40  ! 4267: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb6b4a14c  ! 4271: ORNcc_I	orncc 	%r18, 0x014c, %r27
	.word 0xb5e420dd  ! 4272: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_wr_189:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 4273: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_wr_190:
	mov	0x0, %r14
	.word 0xf2f38400  ! 4274: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T0_asi_reg_rd_194:
	mov	0x3c4, %r14
	.word 0xf6db8e80  ! 4277: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbb2d5000  ! 4278: SLLX_R	sllx	%r21, %r0, %r29
	.word 0xbf7c0400  ! 4283: MOVR_R	movre	%r16, %r0, %r31
iob_intr_0_374:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_374), 16, 16)) -> intp(0, 0, 4)
	.word 0xb2aca1b6  ! 4286: ANDNcc_I	andncc 	%r18, 0x01b6, %r25
iob_intr_0_375:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_375), 16, 16)) -> intp(0, 0, 3)
	.word 0xbde48000  ! 4291: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_376:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_376), 16, 16)) -> intp(0, 0, e)
iob_intr_0_377:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_377), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_316:
	setx	0x43000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 4300: SAVE_R	save	%r20, %r0, %r31
T0_asi_reg_wr_191:
	mov	0x2e, %r14
	.word 0xfaf38e60  ! 4301: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_0_378:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_378), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_rd_195:
	mov	0x3c6, %r14
	.word 0xfedb8e60  ! 4303: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb9e54000  ! 4308: SAVE_R	save	%r21, %r0, %r28
	.word 0xb5e58000  ! 4309: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_wr_192:
	mov	0x1e, %r14
	.word 0xfef38e40  ! 4312: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbbe58000  ! 4314: SAVE_R	save	%r22, %r0, %r29
cpu_intr_0_317:
	setx	0x410128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_318:
	setx	0x42021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe44000  ! 4319: SAVE_R	save	%r17, %r0, %r31
	.word 0xb6a54000  ! 4320: SUBcc_R	subcc 	%r21, %r0, %r27
	.word 0xb9e521ae  ! 4321: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_319:
	setx	0x42012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e40000  ! 4323: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_320:
	setx	0x43021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_379:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_379), 16, 16)) -> intp(0, 0, 2c)
cpu_intr_0_321:
	setx	0x400201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 4340: SAVE_R	save	%r17, %r0, %r30
	.word 0xbd500000  ! 4346: RDPR_TPC	<illegal instruction>
cpu_intr_0_322:
	setx	0x430304, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_323:
	setx	0x43011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_196:
	mov	0x11, %r14
	.word 0xf8db8e40  ! 4357: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_wr_193:
	mov	0x25, %r14
	.word 0xf4f38e40  ! 4358: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_194:
	mov	0x3c6, %r14
	.word 0xfcf384a0  ! 4359: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbd508000  ! 4361: RDPR_TSTATE	<illegal instruction>
cpu_intr_0_324:
	setx	0x410029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb494c000  ! 4368: ORcc_R	orcc 	%r19, %r0, %r26
	.word 0xb3e5203f  ! 4369: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbbe5a15a  ! 4370: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb284a0e7  ! 4372: ADDcc_I	addcc 	%r18, 0x00e7, %r25
	.word 0xbfe521cf  ! 4375: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbfe46050  ! 4377: SAVE_I	save	%r17, 0x0001, %r31
iob_intr_0_380:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_380), 16, 16)) -> intp(0, 0, 3e)
	.word 0xbf2d5000  ! 4379: SLLX_R	sllx	%r21, %r0, %r31
	.word 0xb3e50000  ! 4380: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_381:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_381), 16, 16)) -> intp(0, 0, 4)
cpu_intr_0_325:
	setx	0x41003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_326:
	setx	0x41030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe4a15e  ! 4385: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde58000  ! 4387: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_327:
	setx	0x43033d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_195:
	mov	0xb, %r14
	.word 0xfaf38e40  ! 4393: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T0_asi_reg_rd_197:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 4394: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_328:
	setx	0x430035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e045  ! 4400: SAVE_I	save	%r23, 0x0001, %r31
cpu_intr_0_329:
	setx	0x43002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e58000  ! 4403: SAVE_R	save	%r22, %r0, %r28
	.word 0xb22d2097  ! 4404: ANDN_I	andn 	%r20, 0x0097, %r25
	.word 0xbde42093  ! 4407: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_330:
	setx	0x430125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_382:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_382), 16, 16)) -> intp(0, 0, 8)
	.word 0xb9e48000  ! 4412: SAVE_R	save	%r18, %r0, %r28
cpu_intr_0_331:
	setx	0x410015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e0ee  ! 4422: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_383:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_383), 16, 16)) -> intp(0, 0, 11)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e50000  ! 4425: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_384:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_384), 16, 16)) -> intp(0, 0, 2c)
cpu_intr_0_332:
	setx	0x410329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_385:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_385), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_333:
	setx	0x410008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e48000  ! 4442: SAVE_R	save	%r18, %r0, %r27
T0_asi_reg_rd_198:
	mov	0x1b, %r14
	.word 0xf2db8e40  ! 4443: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb1e40000  ! 4444: SAVE_R	save	%r16, %r0, %r24
	.word 0xbbe54000  ! 4445: SAVE_R	save	%r21, %r0, %r29
	.word 0xb3e4e1f3  ! 4447: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_386:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_386), 16, 16)) -> intp(0, 0, 17)
	.word 0xbbe4a1d4  ! 4453: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1e4c000  ! 4454: SAVE_R	save	%r19, %r0, %r24
	.word 0xb9e4e0d0  ! 4455: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_387:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_387), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_334:
	setx	0x41010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 4462: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_rd_199:
	mov	0x18, %r14
	.word 0xf6db89e0  ! 4463: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T0_asi_reg_wr_196:
	mov	0x1b, %r14
	.word 0xfef38e40  ! 4469: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_335:
	setx	0x420239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_336:
	setx	0x43011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_197:
	mov	0x13, %r14
	.word 0xf2f38e40  ! 4477: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbbe4c000  ! 4479: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_wr_198:
	mov	0x22, %r14
	.word 0xf4f38e80  ! 4481: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_0_337:
	setx	0x400001, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_338:
	setx	0x420123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4c000  ! 4488: SAVE_R	save	%r19, %r0, %r28
	.word 0xb5e50000  ! 4490: SAVE_R	save	%r20, %r0, %r26
T0_asi_reg_rd_200:
	mov	0x9, %r14
	.word 0xf6db89e0  ! 4491: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0x8f902002  ! 4492: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
iob_intr_0_388:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_388), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb1e54000  ! 4497: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_339:
	setx	0x430216, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_340:
	setx	0x41023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde48000  ! 4500: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_rd_201:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 4501: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbbe44000  ! 4503: SAVE_R	save	%r17, %r0, %r29
	.word 0xb9e420bb  ! 4504: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_wr_199:
	mov	0x9, %r14
	.word 0xfef389e0  ! 4505: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_0_389:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_389), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_rd_202:
	mov	0x16, %r14
	.word 0xf8db8400  ! 4510: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T0_asi_reg_wr_200:
	mov	0x7, %r14
	.word 0xfcf384a0  ! 4512: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb7e50000  ! 4513: SAVE_R	save	%r20, %r0, %r27
	.word 0xb494a118  ! 4515: ORcc_I	orcc 	%r18, 0x0118, %r26
	.word 0xbfe5200f  ! 4518: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbfe54000  ! 4519: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_rd_203:
	mov	0x32, %r14
	.word 0xfedb8e40  ! 4521: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_wr_201:
	mov	0x32, %r14
	.word 0xf4f389e0  ! 4523: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T0_asi_reg_wr_202:
	mov	0xb, %r14
	.word 0xf6f38e40  ! 4525: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_390:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_390), 16, 16)) -> intp(0, 0, 18)
iob_intr_0_391:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_391), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_341:
	setx	0x430138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 4540: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_rd_204:
	mov	0x38, %r14
	.word 0xf0db84a0  ! 4544: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_0_392:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_392), 16, 16)) -> intp(0, 0, 22)
cpu_intr_0_342:
	setx	0x400219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5c000  ! 4554: SAVE_R	save	%r23, %r0, %r28
cpu_intr_0_343:
	setx	0x430012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 4556: SAVE_R	save	%r20, %r0, %r31
	.word 0xbbe5c000  ! 4557: SAVE_R	save	%r23, %r0, %r29
	.word 0xbfe5c000  ! 4560: SAVE_R	save	%r23, %r0, %r31
	.word 0xbbe520d9  ! 4562: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbb2d1000  ! 4570: SLLX_R	sllx	%r20, %r0, %r29
	.word 0xbe0d4000  ! 4572: AND_R	and 	%r21, %r0, %r31
	.word 0xbfe5a0e8  ! 4578: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9e5e1fd  ! 4580: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_344:
	setx	0x45020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72c8000  ! 4583: SLL_R	sll 	%r18, %r0, %r27
T0_asi_reg_wr_203:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 4585: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_rd_205:
	mov	0x3c8, %r14
	.word 0xf4db8400  ! 4586: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbde5213c  ! 4588: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb5e4c000  ! 4590: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_393:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_393), 16, 16)) -> intp(0, 0, 33)
iob_intr_0_394:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_394), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_rd_206:
	mov	0x3c7, %r14
	.word 0xfadb8400  ! 4598: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T0_asi_reg_rd_207:
	mov	0x3c0, %r14
	.word 0xfcdb8400  ! 4599: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb235a1c9  ! 4600: ORN_I	orn 	%r22, 0x01c9, %r25
iob_intr_0_395:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_395), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_208:
	mov	0x3c4, %r14
	.word 0xf8db8e80  ! 4603: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_0_345:
	setx	0x45011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a1d1  ! 4608: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbde5a0ac  ! 4611: SAVE_I	save	%r22, 0x0001, %r30
cpu_intr_0_346:
	setx	0x47010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe50000  ! 4613: SAVE_R	save	%r20, %r0, %r29
	.word 0xb8354000  ! 4617: ORN_R	orn 	%r21, %r0, %r28
cpu_intr_0_347:
	setx	0x440325, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_396:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_396), 16, 16)) -> intp(0, 0, 4)
	.word 0xbbe521fd  ! 4622: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_397:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_397), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbbe4c000  ! 4626: SAVE_R	save	%r19, %r0, %r29
	.word 0xbbe58000  ! 4630: SAVE_R	save	%r22, %r0, %r29
T0_asi_reg_rd_209:
	mov	0x3c8, %r14
	.word 0xf2db84a0  ! 4632: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T0_asi_reg_wr_204:
	mov	0xe, %r14
	.word 0xfcf38e40  ! 4633: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb3e42165  ! 4635: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_wr_205:
	mov	0xc, %r14
	.word 0xfef38e40  ! 4636: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_348:
	setx	0x470306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a1bf  ! 4639: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb885e17b  ! 4640: ADDcc_I	addcc 	%r23, 0x017b, %r28
	.word 0xbfe48000  ! 4641: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_rd_210:
	mov	0x7, %r14
	.word 0xfadb8e40  ! 4643: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T0_asi_reg_wr_206:
	mov	0x1e, %r14
	.word 0xf4f38e40  ! 4644: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbbe4c000  ! 4647: SAVE_R	save	%r19, %r0, %r29
	.word 0xbf51c000  ! 4652: RDPR_TL	<illegal instruction>
	.word 0xb1e5a068  ! 4656: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e52185  ! 4657: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_wr_207:
	mov	0x1d, %r14
	.word 0xf8f38400  ! 4660: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb9e5e0d4  ! 4661: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e50000  ! 4662: SAVE_R	save	%r20, %r0, %r28
	.word 0xbde4c000  ! 4665: SAVE_R	save	%r19, %r0, %r30
	.word 0xb9e4a144  ! 4666: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_rd_211:
	mov	0x29, %r14
	.word 0xf4db84a0  ! 4667: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb7e5a0ad  ! 4668: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe50000  ! 4669: SAVE_R	save	%r20, %r0, %r31
iob_intr_0_398:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_398), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb5e58000  ! 4671: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_wr_208:
	mov	0x1b, %r14
	.word 0xfaf384a0  ! 4672: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb1e460e0  ! 4674: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e5a139  ! 4677: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_rd_212:
	mov	0x3c7, %r14
	.word 0xf0db89e0  ! 4679: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb9e5a13a  ! 4687: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbca40000  ! 4689: SUBcc_R	subcc 	%r16, %r0, %r30
cpu_intr_0_349:
	setx	0x47031e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_350:
	setx	0x45033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe56053  ! 4696: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_351:
	setx	0x470120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_352:
	setx	0x460035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4bcc000  ! 4704: XNORcc_R	xnorcc 	%r19, %r0, %r26
T0_asi_reg_wr_209:
	mov	0x3c7, %r14
	.word 0xf2f38e60  ! 4711: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T0_asi_reg_wr_210:
	mov	0x17, %r14
	.word 0xf6f384a0  ! 4712: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T0_asi_reg_wr_211:
	mov	0x36, %r14
	.word 0xfcf38e60  ! 4713: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb9e54000  ! 4717: SAVE_R	save	%r21, %r0, %r28
	.word 0xb9e58000  ! 4718: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_399:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_399), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_400:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_400), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_401:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_401), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_402:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_402), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_wr_212:
	mov	0x28, %r14
	.word 0xf2f384a0  ! 4726: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb7e5c000  ! 4729: SAVE_R	save	%r23, %r0, %r27
iob_intr_0_403:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_403), 16, 16)) -> intp(0, 0, 2f)
iob_intr_0_404:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_404), 16, 16)) -> intp(0, 0, 32)
	.word 0xb9e40000  ! 4734: SAVE_R	save	%r16, %r0, %r28
	.word 0xbbe48000  ! 4736: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_rd_213:
	mov	0x23, %r14
	.word 0xf2db8e40  ! 4737: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb5e5e16f  ! 4738: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb9e4c000  ! 4739: SAVE_R	save	%r19, %r0, %r28
cpu_intr_0_353:
	setx	0x450118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 4744: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_rd_214:
	mov	0x3c3, %r14
	.word 0xf8db89e0  ! 4745: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbbe5c000  ! 4746: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_405:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_405), 16, 16)) -> intp(0, 0, 3)
T0_asi_reg_rd_215:
	mov	0x4, %r14
	.word 0xfadb8e60  ! 4751: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_0_354:
	setx	0x45030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe25c000  ! 4755: SUB_R	sub 	%r23, %r0, %r31
	.word 0xbbe5217d  ! 4757: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde4c000  ! 4758: SAVE_R	save	%r19, %r0, %r30
T0_asi_reg_rd_216:
	mov	0x33, %r14
	.word 0xfedb84a0  ! 4762: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_0_406:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_406), 16, 16)) -> intp(0, 0, 3)
T0_asi_reg_wr_213:
	mov	0x0, %r14
	.word 0xf8f384a0  ! 4764: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_0_407:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_407), 16, 16)) -> intp(0, 0, 16)
iob_intr_0_408:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_408), 16, 16)) -> intp(0, 0, 2)
T0_asi_reg_wr_214:
	mov	0x2d, %r14
	.word 0xfef38e40  ! 4768: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_355:
	setx	0x460039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_409:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_409), 16, 16)) -> intp(0, 0, 22)
	.word 0xb4ac4000  ! 4774: ANDNcc_R	andncc 	%r17, %r0, %r26
	.word 0xbfe420d9  ! 4775: SAVE_I	save	%r16, 0x0001, %r31
T0_asi_reg_rd_217:
	mov	0x22, %r14
	.word 0xf2db8e80  ! 4777: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_0_410:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_410), 16, 16)) -> intp(0, 0, 3d)
T0_asi_reg_rd_218:
	mov	0xe, %r14
	.word 0xf4db8e40  ! 4782: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbf510000  ! 4783: RDPR_TICK	<illegal instruction>
	.word 0xbeacc000  ! 4784: ANDNcc_R	andncc 	%r19, %r0, %r31
cpu_intr_0_356:
	setx	0x470138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a0f7  ! 4789: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe58000  ! 4790: SAVE_R	save	%r22, %r0, %r29
	.word 0xb5e4c000  ! 4791: SAVE_R	save	%r19, %r0, %r26
	.word 0xbbe461ca  ! 4793: SAVE_I	save	%r17, 0x0001, %r29
T0_asi_reg_rd_219:
	mov	0x1e, %r14
	.word 0xf0db8e60  ! 4794: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T0_asi_reg_rd_220:
	mov	0x2a, %r14
	.word 0xf0db84a0  ! 4795: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T0_asi_reg_rd_221:
	mov	0x35, %r14
	.word 0xf4db8e60  ! 4797: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_0_411:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_411), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_357:
	setx	0x45002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_412:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_412), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_413:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_413), 16, 16)) -> intp(0, 0, 8)
T0_asi_reg_rd_222:
	mov	0xe, %r14
	.word 0xf4db89e0  ! 4809: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T0_asi_reg_wr_215:
	mov	0x23, %r14
	.word 0xfef38400  ! 4821: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T0_asi_reg_wr_216:
	mov	0x15, %r14
	.word 0xf2f38e60  ! 4825: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_0_358:
	setx	0x460312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5a158  ! 4831: SAVE_I	save	%r22, 0x0001, %r30
cpu_intr_0_359:
	setx	0x460209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe40000  ! 4833: SAVE_R	save	%r16, %r0, %r31
iob_intr_0_414:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_414), 16, 16)) -> intp(0, 0, 13)
T0_asi_reg_rd_223:
	mov	0x3c7, %r14
	.word 0xfadb8400  ! 4838: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_0_415:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_415), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_416:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_416), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbfe420b1  ! 4845: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_360:
	setx	0x470136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 4849: SAVE_R	save	%r21, %r0, %r31
T0_asi_reg_wr_217:
	mov	0x21, %r14
	.word 0xfef38400  ! 4850: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_0_417:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_417), 16, 16)) -> intp(0, 0, d)
	.word 0xb9e48000  ! 4852: SAVE_R	save	%r18, %r0, %r28
	.word 0xbbe56190  ! 4853: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_361:
	setx	0x44001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe54000  ! 4858: SAVE_R	save	%r21, %r0, %r29
cpu_intr_0_362:
	setx	0x470019, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_224:
	mov	0x3c5, %r14
	.word 0xf0db89e0  ! 4866: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbde4e042  ! 4867: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb83521d2  ! 4868: SUBC_I	orn 	%r20, 0x01d2, %r28
	.word 0xb3e40000  ! 4870: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_363:
	setx	0x470339, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_225:
	mov	0x13, %r14
	.word 0xf6db8e80  ! 4873: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_0_418:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_418), 16, 16)) -> intp(0, 0, 5)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_364:
	setx	0x470329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4a44000  ! 4877: SUBcc_R	subcc 	%r17, %r0, %r26
T0_asi_reg_wr_218:
	mov	0x18, %r14
	.word 0xf6f384a0  ! 4879: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb9e4c000  ! 4880: SAVE_R	save	%r19, %r0, %r28
	.word 0xb9e54000  ! 4884: SAVE_R	save	%r21, %r0, %r28
	.word 0xbde5a1a7  ! 4889: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb9e4600f  ! 4892: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb8bd21c1  ! 4893: XNORcc_I	xnorcc 	%r20, 0x01c1, %r28
iob_intr_0_419:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_419), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_420:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_420), 16, 16)) -> intp(0, 0, 19)
	.word 0xbfe561ef  ! 4896: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_wr_219:
	mov	0x3c5, %r14
	.word 0xf8f38e80  ! 4898: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T0_asi_reg_wr_220:
	mov	0x1, %r14
	.word 0xfef38e40  ! 4900: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb1e40000  ! 4903: SAVE_R	save	%r16, %r0, %r24
	.word 0xb6b5a142  ! 4904: SUBCcc_I	orncc 	%r22, 0x0142, %r27
	.word 0xb5e44000  ! 4907: SAVE_R	save	%r17, %r0, %r26
iob_intr_0_421:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_421), 16, 16)) -> intp(0, 0, 3)
	.word 0xbfe4e097  ! 4911: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_422:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_422), 16, 16)) -> intp(0, 0, 30)
T0_asi_reg_wr_221:
	mov	0x3c3, %r14
	.word 0xfcf38e40  ! 4915: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb5e4c000  ! 4918: SAVE_R	save	%r19, %r0, %r26
	.word 0xb5e4c000  ! 4919: SAVE_R	save	%r19, %r0, %r26
T0_asi_reg_rd_226:
	mov	0x3c1, %r14
	.word 0xfedb8400  ! 4920: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_0_423:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_423), 16, 16)) -> intp(0, 0, 39)
	.word 0xb3e44000  ! 4931: SAVE_R	save	%r17, %r0, %r25
	.word 0xbcad8000  ! 4935: ANDNcc_R	andncc 	%r22, %r0, %r30
T0_asi_reg_rd_227:
	mov	0x0, %r14
	.word 0xf8db8400  ! 4937: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbde561ba  ! 4939: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbf2d6001  ! 4941: SLL_I	sll 	%r21, 0x0001, %r31
T0_asi_reg_rd_228:
	mov	0x19, %r14
	.word 0xfadb8e60  ! 4942: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_0_365:
	setx	0x45013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_229:
	mov	0x1a, %r14
	.word 0xfcdb89e0  ! 4950: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T0_asi_reg_wr_222:
	mov	0x3c8, %r14
	.word 0xf0f38e60  ! 4954: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_230:
	mov	0x23, %r14
	.word 0xf0db8400  ! 4956: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbbe54000  ! 4957: SAVE_R	save	%r21, %r0, %r29
	.word 0xb8b520c1  ! 4959: SUBCcc_I	orncc 	%r20, 0x00c1, %r28
T0_asi_reg_wr_223:
	mov	0xc, %r14
	.word 0xf2f38e40  ! 4961: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb3643801  ! 4962: MOVcc_I	<illegal instruction>
cpu_intr_0_366:
	setx	0x44003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_424:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_424), 16, 16)) -> intp(0, 0, 39)
iob_intr_0_425:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_425), 16, 16)) -> intp(0, 0, 13)
	.word 0xbd352001  ! 4970: SRL_I	srl 	%r20, 0x0001, %r30
iob_intr_0_426:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_426), 16, 16)) -> intp(0, 0, 1a)
	.word 0xb7e5a046  ! 4974: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e50000  ! 4975: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_427:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_427), 16, 16)) -> intp(0, 0, 30)
cpu_intr_0_367:
	setx	0x470139, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_231:
	mov	0x1e, %r14
	.word 0xfedb8e40  ! 4978: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbbe40000  ! 4981: SAVE_R	save	%r16, %r0, %r29
	.word 0xb1e460d7  ! 4982: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e56085  ! 4984: SAVE_I	save	%r21, 0x0001, %r27
T0_asi_reg_wr_224:
	mov	0x3c4, %r14
	.word 0xfaf384a0  ! 4989: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xba154000  ! 4991: OR_R	or 	%r21, %r0, %r29
iob_intr_0_428:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_428), 16, 16)) -> intp(0, 0, a)
	.word 0xb9e4a1e2  ! 4995: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe5e063  ! 4997: SAVE_I	save	%r23, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_429:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_429), 16, 16)) -> intp(0, 0, 3e)
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	setx	data_start_0, %g1, %r16
	setx	data_start_1, %g1, %r17
	setx	data_start_2, %g1, %r18
	setx	data_start_3, %g1, %r19
	setx	data_start_4, %g1, %r20
	setx	data_start_5, %g1, %r21
	setx	data_start_6, %g1, %r22
	setx	data_start_7, %g1, %r23
	.word 0xfef4e0ce  ! 1: STXA_I	stxa	%r31, [%r19 + 0x00ce] %asi
cpu_intr_3_0:
	setx	0x1a0007, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_1:
	setx	0x180230, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_0), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_wr_0:
	mov	0xb, %r14
	.word 0xf0f384a0  ! 11: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	ta	T_CHANGE_NONHPRIV
	.word 0xf62c4000  ! 16: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf02ca1a3  ! 17: STB_I	stb	%r24, [%r18 + 0x01a3]
T3_asi_reg_rd_0:
	mov	0x13, %r14
	.word 0xf8db8e40  ! 20: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf0b4c020  ! 21: STHA_R	stha	%r24, [%r19 + %r0] 0x01
	.word 0xb81d61c1  ! 22: XOR_I	xor 	%r21, 0x01c1, %r28
	.word 0xf225a1cd  ! 23: STW_I	stw	%r25, [%r22 + 0x01cd]
iob_intr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_1), 16, 16)) -> intp(3, 0, 36)
	.word 0xb09dc000  ! 26: XORcc_R	xorcc 	%r23, %r0, %r24
	.word 0xf8f5610b  ! 27: STXA_I	stxa	%r28, [%r21 + 0x010b] %asi
	.word 0xbea4e0d4  ! 28: SUBcc_I	subcc 	%r19, 0x00d4, %r31
iob_intr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_2), 16, 16)) -> intp(3, 0, b)
	.word 0xfa74a1f3  ! 31: STX_I	stx	%r29, [%r18 + 0x01f3]
	.word 0xf0b4600c  ! 32: STHA_I	stha	%r24, [%r17 + 0x000c] %asi
	.word 0xfc34a0e4  ! 33: STH_I	sth	%r30, [%r18 + 0x00e4]
	.word 0xf0240000  ! 39: STW_R	stw	%r24, [%r16 + %r0]
iob_intr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_3), 16, 16)) -> intp(3, 0, 14)
iob_intr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_4), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_rd_1:
	mov	0x2a, %r14
	.word 0xf4db89e0  ! 42: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xfa744000  ! 44: STX_R	stx	%r29, [%r17 + %r0]
	.word 0xfe75c000  ! 47: STX_R	stx	%r31, [%r23 + %r0]
iob_intr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_5), 16, 16)) -> intp(3, 0, 28)
T3_asi_reg_rd_2:
	mov	0xe, %r14
	.word 0xf4db8400  ! 50: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_6), 16, 16)) -> intp(3, 0, b)
iob_intr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_7), 16, 16)) -> intp(3, 0, 1)
	.word 0xfc2561ba  ! 56: STW_I	stw	%r30, [%r21 + 0x01ba]
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983e40  ! 58: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e40, %hpstate
	.word 0xf8f42195  ! 59: STXA_I	stxa	%r28, [%r16 + 0x0195] %asi
T3_asi_reg_wr_1:
	mov	0x3c6, %r14
	.word 0xf6f38e80  ! 64: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T3_asi_reg_rd_3:
	mov	0x3c1, %r14
	.word 0xf8db8400  ! 66: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_3_2:
	setx	0x1f0133, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_2:
	mov	0x12, %r14
	.word 0xf4f38400  ! 71: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T3_asi_reg_rd_4:
	mov	0x4, %r14
	.word 0xf0db8e40  ! 74: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983fda  ! 78: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fda, %hpstate
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982a08  ! 80: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a08, %hpstate
	.word 0x8595e15d  ! 82: WRPR_TSTATE_I	wrpr	%r23, 0x015d, %tstate
T3_asi_reg_rd_5:
	mov	0x1b, %r14
	.word 0xf2db89e0  ! 83: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_8), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_rd_6:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 87: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfef461f5  ! 88: STXA_I	stxa	%r31, [%r17 + 0x01f5] %asi
	.word 0xf2750000  ! 89: STX_R	stx	%r25, [%r20 + %r0]
cpu_intr_3_3:
	setx	0x1d0109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_9), 16, 16)) -> intp(3, 0, 2a)
T3_asi_reg_wr_3:
	mov	0x36, %r14
	.word 0xfcf38400  ! 93: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xf0b4c020  ! 94: STHA_R	stha	%r24, [%r19 + %r0] 0x01
iob_intr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_10), 16, 16)) -> intp(3, 0, 26)
iob_intr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_11), 16, 16)) -> intp(3, 0, 1)
iob_intr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_12), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_rd_7:
	mov	0x1b, %r14
	.word 0xf6db8e60  ! 103: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb49cc000  ! 106: XORcc_R	xorcc 	%r19, %r0, %r26
	.word 0xf2ac6082  ! 109: STBA_I	stba	%r25, [%r17 + 0x0082] %asi
	.word 0xf6254000  ! 118: STW_R	stw	%r27, [%r21 + %r0]
T3_asi_reg_rd_8:
	mov	0x3c1, %r14
	.word 0xfcdb89e0  ! 120: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfab4a0dd  ! 123: STHA_I	stha	%r29, [%r18 + 0x00dd] %asi
	.word 0xf6350000  ! 127: STH_R	sth	%r27, [%r20 + %r0]
	.word 0xbeb4e0e2  ! 128: SUBCcc_I	orncc 	%r19, 0x00e2, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc25a082  ! 132: STW_I	stw	%r30, [%r22 + 0x0082]
	.word 0xbf34e001  ! 133: SRL_I	srl 	%r19, 0x0001, %r31
	.word 0xfc752098  ! 134: STX_I	stx	%r30, [%r20 + 0x0098]
iob_intr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_13), 16, 16)) -> intp(3, 0, 11)
iob_intr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_14), 16, 16)) -> intp(3, 0, c)
iob_intr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_15), 16, 16)) -> intp(3, 0, 33)
iob_intr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_16), 16, 16)) -> intp(3, 0, 29)
	.word 0xf0b5210b  ! 143: STHA_I	stha	%r24, [%r20 + 0x010b] %asi
T3_asi_reg_wr_4:
	mov	0x19, %r14
	.word 0xf2f38e40  ! 147: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfa340000  ! 148: STH_R	sth	%r29, [%r16 + %r0]
iob_intr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_17), 16, 16)) -> intp(3, 0, 27)
cpu_intr_3_4:
	setx	0x1e031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8848000  ! 152: ADDcc_R	addcc 	%r18, %r0, %r28
iob_intr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_18), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_5:
	setx	0x1f0135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_19), 16, 16)) -> intp(3, 0, 1e)
iob_intr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_20), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_21), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_rd_9:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 160: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_22), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf6a48020  ! 164: STWA_R	stwa	%r27, [%r18 + %r0] 0x01
	.word 0xf62d0000  ! 168: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xbb540000  ! 170: RDPR_GL	rdpr	%-, %r29
	.word 0xf235a07d  ! 172: STH_I	sth	%r25, [%r22 + 0x007d]
cpu_intr_3_6:
	setx	0x1d000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa240000  ! 176: STW_R	stw	%r29, [%r16 + %r0]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_7:
	setx	0x1d0030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_23), 16, 16)) -> intp(3, 0, 12)
	.word 0xb7504000  ! 183: RDPR_TNPC	<illegal instruction>
	.word 0xb08d0000  ! 184: ANDcc_R	andcc 	%r20, %r0, %r24
cpu_intr_3_8:
	setx	0x1c011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_10:
	mov	0xd, %r14
	.word 0xf2db8400  ! 187: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_24), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_rd_11:
	mov	0x3c6, %r14
	.word 0xf6db84a0  ! 189: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xfcacc020  ! 190: STBA_R	stba	%r30, [%r19 + %r0] 0x01
	.word 0xf0b4c020  ! 191: STHA_R	stha	%r24, [%r19 + %r0] 0x01
cpu_intr_3_9:
	setx	0x1f0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0748000  ! 194: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xf8a4a18b  ! 195: STWA_I	stwa	%r28, [%r18 + 0x018b] %asi
	.word 0xf6244000  ! 196: STW_R	stw	%r27, [%r17 + %r0]
iob_intr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_25), 16, 16)) -> intp(3, 0, 4)
	.word 0xb814a153  ! 206: OR_I	or 	%r18, 0x0153, %r28
cpu_intr_3_10:
	setx	0x1f0021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a4e081  ! 211: STWA_I	stwa	%r26, [%r19 + 0x0081] %asi
T3_asi_reg_rd_12:
	mov	0x33, %r14
	.word 0xfedb8400  ! 214: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf2a420e9  ! 216: STWA_I	stwa	%r25, [%r16 + 0x00e9] %asi
T3_asi_reg_rd_13:
	mov	0xc, %r14
	.word 0xf6db84a0  ! 220: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_26), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_rd_14:
	mov	0x10, %r14
	.word 0xf8db84a0  ! 224: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xfe25212a  ! 226: STW_I	stw	%r31, [%r20 + 0x012a]
cpu_intr_3_11:
	setx	0x1d0010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_27), 16, 16)) -> intp(3, 0, 7)
cpu_intr_3_12:
	setx	0x1e023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8348000  ! 234: STH_R	sth	%r28, [%r18 + %r0]
iob_intr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_28), 16, 16)) -> intp(3, 0, 25)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_5:
	mov	0x25, %r14
	.word 0xfcf384a0  ! 245: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xba150000  ! 247: OR_R	or 	%r20, %r0, %r29
cpu_intr_3_13:
	setx	0x1f023e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_14:
	setx	0x1c0106, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_29), 16, 16)) -> intp(3, 0, 1f)
iob_intr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_30), 16, 16)) -> intp(3, 0, 2f)
	.word 0xfa748000  ! 257: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xf4358000  ! 261: STH_R	sth	%r26, [%r22 + %r0]
cpu_intr_3_15:
	setx	0x1d003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_6:
	mov	0x3c1, %r14
	.word 0xf8f38e80  ! 264: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfe2ca017  ! 266: STB_I	stb	%r31, [%r18 + 0x0017]
	.word 0xb695e0db  ! 267: ORcc_I	orcc 	%r23, 0x00db, %r27
iob_intr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_31), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_wr_7:
	mov	0x25, %r14
	.word 0xf8f389e0  ! 269: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_3_16:
	setx	0x1e001b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_32), 16, 16)) -> intp(3, 0, 4)
	.word 0xbb2d4000  ! 273: SLL_R	sll 	%r21, %r0, %r29
iob_intr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_33), 16, 16)) -> intp(3, 0, 21)
	.word 0xfc75c000  ! 275: STX_R	stx	%r30, [%r23 + %r0]
	.word 0xf2258000  ! 278: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xfaf4e176  ! 279: STXA_I	stxa	%r29, [%r19 + 0x0176] %asi
	.word 0xf674a076  ! 280: STX_I	stx	%r27, [%r18 + 0x0076]
cpu_intr_3_17:
	setx	0x1f0217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_18:
	setx	0x1d0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ad8020  ! 287: STBA_R	stba	%r27, [%r22 + %r0] 0x01
iob_intr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_34), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_19:
	setx	0x1c020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982cc0  ! 294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc0, %hpstate
T3_asi_reg_rd_15:
	mov	0xf, %r14
	.word 0xf4db8400  ! 295: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_3_20:
	setx	0x1e0330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe340000  ! 300: STH_R	sth	%r31, [%r16 + %r0]
cpu_intr_3_21:
	setx	0x1f0300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_35), 16, 16)) -> intp(3, 0, 23)
T3_asi_reg_rd_16:
	mov	0x9, %r14
	.word 0xfcdb8e80  ! 311: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfe340000  ! 318: STH_R	sth	%r31, [%r16 + %r0]
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982f4a  ! 320: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4a, %hpstate
cpu_intr_3_22:
	setx	0x1c010f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_36), 16, 16)) -> intp(3, 0, 7)
	.word 0xf02d8000  ! 324: STB_R	stb	%r24, [%r22 + %r0]
	.word 0xf6356098  ! 325: STH_I	sth	%r27, [%r21 + 0x0098]
	.word 0xf875615a  ! 328: STX_I	stx	%r28, [%r21 + 0x015a]
	.word 0xfeb40020  ! 329: STHA_R	stha	%r31, [%r16 + %r0] 0x01
	.word 0xbc2de09f  ! 331: ANDN_I	andn 	%r23, 0x009f, %r30
T3_asi_reg_rd_17:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 334: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb4940000  ! 336: ORcc_R	orcc 	%r16, %r0, %r26
	.word 0xf874a1be  ! 339: STX_I	stx	%r28, [%r18 + 0x01be]
	.word 0xf2b4e138  ! 343: STHA_I	stha	%r25, [%r19 + 0x0138] %asi
iob_intr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_37), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_rd_18:
	mov	0x20, %r14
	.word 0xf6db8e40  ! 347: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_23:
	setx	0x1e0037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_38), 16, 16)) -> intp(3, 0, 32)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_19:
	mov	0x2f, %r14
	.word 0xf6db89e0  ! 354: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_39), 16, 16)) -> intp(3, 0, 29)
	.word 0xfeac8020  ! 356: STBA_R	stba	%r31, [%r18 + %r0] 0x01
	.word 0xfcacc020  ! 357: STBA_R	stba	%r30, [%r19 + %r0] 0x01
cpu_intr_3_24:
	setx	0x1c000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_8:
	mov	0x1a, %r14
	.word 0xf6f38e60  ! 363: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_3_25:
	setx	0x1e0305, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_20:
	mov	0x3c3, %r14
	.word 0xf2db8e60  ! 366: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf62d8000  ! 367: STB_R	stb	%r27, [%r22 + %r0]
	.word 0xf034c000  ! 368: STH_R	sth	%r24, [%r19 + %r0]
T3_asi_reg_wr_9:
	mov	0x27, %r14
	.word 0xfef38e80  ! 369: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_21:
	mov	0x16, %r14
	.word 0xf4db8400  ! 374: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xfeb4e113  ! 375: STHA_I	stha	%r31, [%r19 + 0x0113] %asi
	.word 0xb69c20bc  ! 376: XORcc_I	xorcc 	%r16, 0x00bc, %r27
	.word 0xb62c4000  ! 377: ANDN_R	andn 	%r17, %r0, %r27
T3_asi_reg_rd_22:
	mov	0x32, %r14
	.word 0xf2db89e0  ! 380: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xfe354000  ! 382: STH_R	sth	%r31, [%r21 + %r0]
iob_intr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_40), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf2a4a03b  ! 387: STWA_I	stwa	%r25, [%r18 + 0x003b] %asi
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982892  ! 388: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0892, %hpstate
T3_asi_reg_wr_10:
	mov	0x2e, %r14
	.word 0xf2f38e40  ! 389: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfe75a106  ! 390: STX_I	stx	%r31, [%r22 + 0x0106]
T3_asi_reg_wr_11:
	mov	0x34, %r14
	.word 0xfef38e80  ! 392: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf675e185  ! 393: STX_I	stx	%r27, [%r23 + 0x0185]
cpu_intr_3_26:
	setx	0x1c0004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4258000  ! 396: STW_R	stw	%r26, [%r22 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xf874a07d  ! 399: STX_I	stx	%r28, [%r18 + 0x007d]
	.word 0xf0340000  ! 400: STH_R	sth	%r24, [%r16 + %r0]
iob_intr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_41), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf0b4614c  ! 403: STHA_I	stha	%r24, [%r17 + 0x014c] %asi
	.word 0xbf3c9000  ! 404: SRAX_R	srax	%r18, %r0, %r31
	.word 0xf8344000  ! 405: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xfaa5c020  ! 406: STWA_R	stwa	%r29, [%r23 + %r0] 0x01
	.word 0xfaf4a043  ! 408: STXA_I	stxa	%r29, [%r18 + 0x0043] %asi
	.word 0xf6340000  ! 412: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xf2354000  ! 413: STH_R	sth	%r25, [%r21 + %r0]
	.word 0xfcb5c020  ! 414: STHA_R	stha	%r30, [%r23 + %r0] 0x01
	.word 0xf2a4a010  ! 420: STWA_I	stwa	%r25, [%r18 + 0x0010] %asi
iob_intr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_42), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_rd_23:
	mov	0x22, %r14
	.word 0xfcdb8e60  ! 424: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_43), 16, 16)) -> intp(3, 0, b)
cpu_intr_3_27:
	setx	0x1d0109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_44), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_28:
	setx	0x1e0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6ac60f3  ! 431: ANDNcc_I	andncc 	%r17, 0x00f3, %r27
	.word 0xf875a00a  ! 432: STX_I	stx	%r28, [%r22 + 0x000a]
T3_asi_reg_wr_12:
	mov	0x20, %r14
	.word 0xf4f38400  ! 435: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_45), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_46), 16, 16)) -> intp(3, 0, 2a)
iob_intr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_47), 16, 16)) -> intp(3, 0, 12)
	.word 0xf0248000  ! 444: STW_R	stw	%r24, [%r18 + %r0]
cpu_intr_3_29:
	setx	0x1f000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa74617a  ! 446: STX_I	stx	%r29, [%r17 + 0x017a]
cpu_intr_3_30:
	setx	0x1d0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe35a189  ! 448: STH_I	sth	%r31, [%r22 + 0x0189]
	.word 0xb80dc000  ! 449: AND_R	and 	%r23, %r0, %r28
	.word 0xf6b40020  ! 451: STHA_R	stha	%r27, [%r16 + %r0] 0x01
iob_intr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_48), 16, 16)) -> intp(3, 0, 30)
	.word 0xf434203d  ! 467: STH_I	sth	%r26, [%r16 + 0x003d]
cpu_intr_3_31:
	setx	0x230312, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_49), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_50), 16, 16)) -> intp(3, 0, 22)
	.word 0xf0358000  ! 476: STH_R	sth	%r24, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfcf52160  ! 480: STXA_I	stxa	%r30, [%r20 + 0x0160] %asi
cpu_intr_3_32:
	setx	0x230120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a4e036  ! 485: STWA_I	stwa	%r27, [%r19 + 0x0036] %asi
T3_asi_reg_wr_13:
	mov	0x30, %r14
	.word 0xfef389e0  ! 487: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_3_33:
	setx	0x23010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe258000  ! 489: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xb32c4000  ! 490: SLL_R	sll 	%r17, %r0, %r25
cpu_intr_3_34:
	setx	0x230204, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_51), 16, 16)) -> intp(3, 0, 7)
T3_asi_reg_wr_14:
	mov	0x3c1, %r14
	.word 0xf8f38e60  ! 498: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_35:
	setx	0x230217, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xbd504000  ! 503: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xf6a48020  ! 504: STWA_R	stwa	%r27, [%r18 + %r0] 0x01
	.word 0xb4844000  ! 507: ADDcc_R	addcc 	%r17, %r0, %r26
cpu_intr_3_36:
	setx	0x200315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a56159  ! 509: STWA_I	stwa	%r26, [%r21 + 0x0159] %asi
	.word 0xb2a58000  ! 511: SUBcc_R	subcc 	%r22, %r0, %r25
cpu_intr_3_37:
	setx	0x210014, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_52), 16, 16)) -> intp(3, 0, 27)
cpu_intr_3_38:
	setx	0x200128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02d204c  ! 519: STB_I	stb	%r24, [%r20 + 0x004c]
	.word 0xf02c4000  ! 520: STB_R	stb	%r24, [%r17 + %r0]
iob_intr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_53), 16, 16)) -> intp(3, 0, e)
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983d82  ! 523: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d82, %hpstate
T3_asi_reg_rd_24:
	mov	0x3c7, %r14
	.word 0xf8db84a0  ! 524: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T3_asi_reg_wr_15:
	mov	0x3c7, %r14
	.word 0xf8f384a0  ! 525: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T3_asi_reg_rd_25:
	mov	0x38, %r14
	.word 0xf6db89e0  ! 527: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf2a52106  ! 530: STWA_I	stwa	%r25, [%r20 + 0x0106] %asi
cpu_intr_3_39:
	setx	0x200237, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	.word 0xf8b54020  ! 543: STHA_R	stha	%r28, [%r21 + %r0] 0x01
iob_intr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_54), 16, 16)) -> intp(3, 0, 38)
iob_intr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_55), 16, 16)) -> intp(3, 0, 26)
iob_intr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_56), 16, 16)) -> intp(3, 0, 16)
	.word 0xfeb44020  ! 548: STHA_R	stha	%r31, [%r17 + %r0] 0x01
cpu_intr_3_40:
	setx	0x220130, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_16:
	mov	0x3c3, %r14
	.word 0xfaf38e40  ! 552: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_wr_17:
	mov	0x29, %r14
	.word 0xf6f384a0  ! 553: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_57), 16, 16)) -> intp(3, 0, 16)
	.word 0xb41d61eb  ! 557: XOR_I	xor 	%r21, 0x01eb, %r26
cpu_intr_3_41:
	setx	0x23031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6258000  ! 560: STW_R	stw	%r27, [%r22 + %r0]
T3_asi_reg_wr_18:
	mov	0x3c2, %r14
	.word 0xf6f38e40  ! 562: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_rd_26:
	mov	0xa, %r14
	.word 0xfadb8e40  ! 563: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_42:
	setx	0x230221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2740000  ! 567: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xf2348000  ! 569: STH_R	sth	%r25, [%r18 + %r0]
cpu_intr_3_43:
	setx	0x200011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73db001  ! 573: SRAX_I	srax	%r22, 0x0001, %r27
	.word 0xb01ce106  ! 577: XOR_I	xor 	%r19, 0x0106, %r24
cpu_intr_3_44:
	setx	0x22031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_45:
	setx	0x20012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa258000  ! 590: STW_R	stw	%r29, [%r22 + %r0]
iob_intr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_58), 16, 16)) -> intp(3, 0, 14)
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982e92  ! 594: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e92, %hpstate
cpu_intr_3_46:
	setx	0x21031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb89521b0  ! 599: ORcc_I	orcc 	%r20, 0x01b0, %r28
T3_asi_reg_wr_19:
	mov	0x2a, %r14
	.word 0xfcf384a0  ! 602: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb0ac6078  ! 603: ANDNcc_I	andncc 	%r17, 0x0078, %r24
iob_intr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_59), 16, 16)) -> intp(3, 0, 1c)
	.word 0xf025e0f5  ! 606: STW_I	stw	%r24, [%r23 + 0x00f5]
	.word 0xf22dc000  ! 608: STB_R	stb	%r25, [%r23 + %r0]
iob_intr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_60), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_wr_20:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 610: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf234e126  ! 613: STH_I	sth	%r25, [%r19 + 0x0126]
	.word 0xfeb42166  ! 614: STHA_I	stha	%r31, [%r16 + 0x0166] %asi
T3_asi_reg_wr_21:
	mov	0x3c7, %r14
	.word 0xf0f38e80  ! 615: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_61), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_rd_27:
	mov	0x3c3, %r14
	.word 0xf4db84a0  ! 620: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf22d616a  ! 624: STB_I	stb	%r25, [%r21 + 0x016a]
	.word 0xb57d4400  ! 625: MOVR_R	movre	%r21, %r0, %r26
	.word 0xb5500000  ! 628: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xf2f4a10d  ! 630: STXA_I	stxa	%r25, [%r18 + 0x010d] %asi
	.word 0xf674207d  ! 631: STX_I	stx	%r27, [%r16 + 0x007d]
	.word 0xf2b5201e  ! 633: STHA_I	stha	%r25, [%r20 + 0x001e] %asi
T3_asi_reg_rd_28:
	mov	0x23, %r14
	.word 0xf6db8e40  ! 636: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb88d61a7  ! 641: ANDcc_I	andcc 	%r21, 0x01a7, %r28
iob_intr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_62), 16, 16)) -> intp(3, 0, 12)
	.word 0xb01cc000  ! 643: XOR_R	xor 	%r19, %r0, %r24
	.word 0xf6b5e146  ! 645: STHA_I	stha	%r27, [%r23 + 0x0146] %asi
T3_asi_reg_wr_22:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 647: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf2a4c020  ! 649: STWA_R	stwa	%r25, [%r19 + %r0] 0x01
	.word 0xb32cc000  ! 651: SLL_R	sll 	%r19, %r0, %r25
	.word 0xfa25211b  ! 654: STW_I	stw	%r29, [%r20 + 0x011b]
iob_intr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_63), 16, 16)) -> intp(3, 0, 28)
	.word 0xb034c000  ! 661: SUBC_R	orn 	%r19, %r0, %r24
cpu_intr_3_47:
	setx	0x22023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcace1c9  ! 663: STBA_I	stba	%r30, [%r19 + 0x01c9] %asi
	.word 0xb8154000  ! 664: OR_R	or 	%r21, %r0, %r28
	ta	T_CHANGE_TO_TL1
iob_intr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_64), 16, 16)) -> intp(3, 0, 39)
iob_intr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_65), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf0a5609f  ! 670: STWA_I	stwa	%r24, [%r21 + 0x009f] %asi
T3_asi_reg_wr_23:
	mov	0x35, %r14
	.word 0xfcf38e40  ! 671: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_48:
	setx	0x22021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa254000  ! 680: STW_R	stw	%r29, [%r21 + %r0]
T3_asi_reg_wr_24:
	mov	0x2e, %r14
	.word 0xfaf389e0  ! 681: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb4bc8000  ! 682: XNORcc_R	xnorcc 	%r18, %r0, %r26
	.word 0xfcb44020  ! 684: STHA_R	stha	%r30, [%r17 + %r0] 0x01
cpu_intr_3_49:
	setx	0x220224, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_50:
	setx	0x200304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6aca0c1  ! 687: STBA_I	stba	%r27, [%r18 + 0x00c1] %asi
	ta	T_CHANGE_TO_TL1
cpu_intr_3_51:
	setx	0x210007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa4a048  ! 691: STWA_I	stwa	%r29, [%r18 + 0x0048] %asi
	.word 0xfe74203d  ! 692: STX_I	stx	%r31, [%r16 + 0x003d]
	.word 0xf624c000  ! 693: STW_R	stw	%r27, [%r19 + %r0]
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_25:
	mov	0x8, %r14
	.word 0xfaf38e40  ! 696: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf4b42016  ! 697: STHA_I	stha	%r26, [%r16 + 0x0016] %asi
cpu_intr_3_52:
	setx	0x22030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_66), 16, 16)) -> intp(3, 0, 15)
	.word 0xfcf4a0dc  ! 707: STXA_I	stxa	%r30, [%r18 + 0x00dc] %asi
	.word 0xf4ac61ea  ! 708: STBA_I	stba	%r26, [%r17 + 0x01ea] %asi
iob_intr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_67), 16, 16)) -> intp(3, 0, 20)
	.word 0xfab4c020  ! 712: STHA_R	stha	%r29, [%r19 + %r0] 0x01
	.word 0xf4b54020  ! 713: STHA_R	stha	%r26, [%r21 + %r0] 0x01
iob_intr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_68), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_69), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_53:
	setx	0x200303, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_70), 16, 16)) -> intp(3, 0, 34)
	.word 0xf8b54020  ! 718: STHA_R	stha	%r28, [%r21 + %r0] 0x01
T3_asi_reg_rd_29:
	mov	0x9, %r14
	.word 0xfadb8e60  ! 721: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	ta	T_CHANGE_HPRIV
iob_intr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_71), 16, 16)) -> intp(3, 0, 1)
	.word 0xb73c6001  ! 726: SRA_I	sra 	%r17, 0x0001, %r27
	.word 0xf07521bb  ! 727: STX_I	stx	%r24, [%r20 + 0x01bb]
	.word 0xf234a0c6  ! 728: STH_I	sth	%r25, [%r18 + 0x00c6]
T3_asi_reg_wr_26:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 729: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_3_54:
	setx	0x220225, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_55:
	setx	0x21031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a40020  ! 734: STWA_R	stwa	%r25, [%r16 + %r0] 0x01
	.word 0xb5341000  ! 735: SRLX_R	srlx	%r16, %r0, %r26
	ta	T_CHANGE_HPRIV
	.word 0xf0748000  ! 742: STX_R	stx	%r24, [%r18 + %r0]
iob_intr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_72), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_wr_27:
	mov	0x10, %r14
	.word 0xf4f384a0  ! 746: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb03de0f2  ! 747: XNOR_I	xnor 	%r23, 0x00f2, %r24
T3_asi_reg_rd_30:
	mov	0x3c8, %r14
	.word 0xf0db8400  ! 749: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T3_asi_reg_rd_31:
	mov	0x2a, %r14
	.word 0xfcdb89e0  ! 750: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfea4606a  ! 751: STWA_I	stwa	%r31, [%r17 + 0x006a] %asi
	.word 0xf6746032  ! 754: STX_I	stx	%r27, [%r17 + 0x0032]
	.word 0xf6ade0c3  ! 755: STBA_I	stba	%r27, [%r23 + 0x00c3] %asi
iob_intr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_73), 16, 16)) -> intp(3, 0, 38)
	.word 0xf434619d  ! 758: STH_I	sth	%r26, [%r17 + 0x019d]
cpu_intr_3_56:
	setx	0x21033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a4c020  ! 763: STWA_R	stwa	%r26, [%r19 + %r0] 0x01
T3_asi_reg_wr_28:
	mov	0xe, %r14
	.word 0xf0f38e40  ! 764: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf8a42097  ! 765: STWA_I	stwa	%r28, [%r16 + 0x0097] %asi
	.word 0xb43521df  ! 766: SUBC_I	orn 	%r20, 0x01df, %r26
iob_intr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_74), 16, 16)) -> intp(3, 0, 13)
	.word 0xbb2da001  ! 768: SLL_I	sll 	%r22, 0x0001, %r29
	.word 0xb13da001  ! 769: SRA_I	sra 	%r22, 0x0001, %r24
	.word 0xf425a01b  ! 770: STW_I	stw	%r26, [%r22 + 0x001b]
iob_intr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_75), 16, 16)) -> intp(3, 0, b)
cpu_intr_3_57:
	setx	0x230115, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983f92  ! 777: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f92, %hpstate
	.word 0xfa750000  ! 781: STX_R	stx	%r29, [%r20 + %r0]
	.word 0xbf3cd000  ! 783: SRAX_R	srax	%r19, %r0, %r31
T3_asi_reg_wr_29:
	mov	0x3c7, %r14
	.word 0xf2f38400  ! 785: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T3_asi_reg_rd_32:
	mov	0x27, %r14
	.word 0xf6db8e60  ! 786: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xfc258000  ! 789: STW_R	stw	%r30, [%r22 + %r0]
	.word 0xfca44020  ! 790: STWA_R	stwa	%r30, [%r17 + %r0] 0x01
	.word 0xf225c000  ! 791: STW_R	stw	%r25, [%r23 + %r0]
iob_intr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_76), 16, 16)) -> intp(3, 0, 28)
	.word 0xf2356048  ! 793: STH_I	sth	%r25, [%r21 + 0x0048]
	.word 0xfeac8020  ! 794: STBA_R	stba	%r31, [%r18 + %r0] 0x01
	.word 0xfaa4a184  ! 795: STWA_I	stwa	%r29, [%r18 + 0x0184] %asi
T3_asi_reg_wr_30:
	mov	0x29, %r14
	.word 0xf4f384a0  ! 796: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_77), 16, 16)) -> intp(3, 0, 31)
	ta	T_CHANGE_NONHPRIV
	.word 0xf024a0c5  ! 804: STW_I	stw	%r24, [%r18 + 0x00c5]
iob_intr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_78), 16, 16)) -> intp(3, 0, 3b)
	ta	T_CHANGE_NONHPRIV
	.word 0xbc1de158  ! 809: XOR_I	xor 	%r23, 0x0158, %r30
	.word 0xfc342004  ! 811: STH_I	sth	%r30, [%r16 + 0x0004]
cpu_intr_3_58:
	setx	0x230117, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982cc2  ! 813: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc2, %hpstate
T3_asi_reg_wr_31:
	mov	0x3c2, %r14
	.word 0xfaf38e80  ! 816: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfab521ec  ! 817: STHA_I	stha	%r29, [%r20 + 0x01ec] %asi
	.word 0xf6354000  ! 818: STH_R	sth	%r27, [%r21 + %r0]
	.word 0xf8ade14d  ! 822: STBA_I	stba	%r28, [%r23 + 0x014d] %asi
cpu_intr_3_59:
	setx	0x23022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2c21e3  ! 825: STB_I	stb	%r31, [%r16 + 0x01e3]
	.word 0xbca5c000  ! 826: SUBcc_R	subcc 	%r23, %r0, %r30
	.word 0xfaacc020  ! 827: STBA_R	stba	%r29, [%r19 + %r0] 0x01
	.word 0xf434a196  ! 831: STH_I	sth	%r26, [%r18 + 0x0196]
cpu_intr_3_60:
	setx	0x210039, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982a02  ! 835: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a02, %hpstate
cpu_intr_3_61:
	setx	0x200323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_79), 16, 16)) -> intp(3, 0, 21)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_80), 16, 16)) -> intp(3, 0, 23)
	.word 0xfe258000  ! 845: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xf22d0000  ! 846: STB_R	stb	%r25, [%r20 + %r0]
iob_intr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_81), 16, 16)) -> intp(3, 0, 3b)
cpu_intr_3_62:
	setx	0x230307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2744000  ! 852: STX_R	stx	%r25, [%r17 + %r0]
T3_asi_reg_rd_33:
	mov	0x7, %r14
	.word 0xfcdb8e40  ! 853: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_rd_34:
	mov	0x15, %r14
	.word 0xfcdb84a0  ! 854: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_3_63:
	setx	0x210322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab4e1e9  ! 858: STHA_I	stha	%r29, [%r19 + 0x01e9] %asi
iob_intr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_82), 16, 16)) -> intp(3, 0, 21)
	.word 0xfab50020  ! 864: STHA_R	stha	%r29, [%r20 + %r0] 0x01
	.word 0xf0248000  ! 865: STW_R	stw	%r24, [%r18 + %r0]
	.word 0xf22d613b  ! 873: STB_I	stb	%r25, [%r21 + 0x013b]
	.word 0xb08cc000  ! 874: ANDcc_R	andcc 	%r19, %r0, %r24
cpu_intr_3_64:
	setx	0x230004, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_32:
	mov	0x15, %r14
	.word 0xf0f38400  ! 879: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xba1d205d  ! 880: XOR_I	xor 	%r20, 0x005d, %r29
iob_intr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_83), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf4b44020  ! 882: STHA_R	stha	%r26, [%r17 + %r0] 0x01
	.word 0xfa2d8000  ! 883: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xf4ace0e4  ! 884: STBA_I	stba	%r26, [%r19 + 0x00e4] %asi
	.word 0xbcb4a13c  ! 885: ORNcc_I	orncc 	%r18, 0x013c, %r30
	ta	T_CHANGE_HPRIV
	.word 0xfc756060  ! 888: STX_I	stx	%r30, [%r21 + 0x0060]
iob_intr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_84), 16, 16)) -> intp(3, 0, 23)
	.word 0xf8a5c020  ! 890: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
cpu_intr_3_65:
	setx	0x21022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_85), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_86), 16, 16)) -> intp(3, 0, 36)
T3_asi_reg_wr_33:
	mov	0x2, %r14
	.word 0xfaf389e0  ! 899: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_87), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf6344000  ! 901: STH_R	sth	%r27, [%r17 + %r0]
	.word 0xfa2c6034  ! 905: STB_I	stb	%r29, [%r17 + 0x0034]
	setx	data_start_7, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x8198394a  ! 907: WRHPR_HPSTATE_I	wrhpr	%r0, 0x194a, %hpstate
	.word 0xf2340000  ! 908: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xfc740000  ! 910: STX_R	stx	%r30, [%r16 + %r0]
cpu_intr_3_66:
	setx	0x23021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe348000  ! 912: STH_R	sth	%r31, [%r18 + %r0]
cpu_intr_3_67:
	setx	0x200304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1643801  ! 914: MOVcc_I	<illegal instruction>
	.word 0xf6256162  ! 917: STW_I	stw	%r27, [%r21 + 0x0162]
	.word 0xf82cc000  ! 920: STB_R	stb	%r28, [%r19 + %r0]
cpu_intr_3_68:
	setx	0x210025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf675e135  ! 925: STX_I	stx	%r27, [%r23 + 0x0135]
T3_asi_reg_rd_35:
	mov	0x3c6, %r14
	.word 0xf0db89e0  ! 926: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T3_asi_reg_wr_34:
	mov	0x23, %r14
	.word 0xf0f38e40  ! 927: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbf2dc000  ! 928: SLL_R	sll 	%r23, %r0, %r31
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_69:
	setx	0x270025, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_36:
	mov	0x27, %r14
	.word 0xfedb8e80  ! 931: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf074601d  ! 933: STX_I	stx	%r24, [%r17 + 0x001d]
T3_asi_reg_rd_37:
	mov	0x1, %r14
	.word 0xf6db8e40  ! 936: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfc34e029  ! 938: STH_I	sth	%r30, [%r19 + 0x0029]
cpu_intr_3_70:
	setx	0x27022d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_88), 16, 16)) -> intp(3, 0, 3e)
T3_asi_reg_wr_35:
	mov	0x7, %r14
	.word 0xf6f389e0  ! 945: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xfc75c000  ! 948: STX_R	stx	%r30, [%r23 + %r0]
	.word 0xfa254000  ! 951: STW_R	stw	%r29, [%r21 + %r0]
T3_asi_reg_rd_38:
	mov	0x2a, %r14
	.word 0xfadb89e0  ! 952: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb1354000  ! 954: SRL_R	srl 	%r21, %r0, %r24
	.word 0xf4252197  ! 956: STW_I	stw	%r26, [%r20 + 0x0197]
	.word 0xf6344000  ! 957: STH_R	sth	%r27, [%r17 + %r0]
	.word 0xf62c20a2  ! 959: STB_I	stb	%r27, [%r16 + 0x00a2]
	.word 0xbd540000  ! 960: RDPR_GL	rdpr	%-, %r30
T3_asi_reg_rd_39:
	mov	0x1e, %r14
	.word 0xf0db8e60  ! 961: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf4350000  ! 963: STH_R	sth	%r26, [%r20 + %r0]
iob_intr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_89), 16, 16)) -> intp(3, 0, 17)
	.word 0xb8b521e0  ! 965: ORNcc_I	orncc 	%r20, 0x01e0, %r28
T3_asi_reg_wr_36:
	mov	0xa, %r14
	.word 0xfef38e80  ! 968: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfaa561fa  ! 969: STWA_I	stwa	%r29, [%r21 + 0x01fa] %asi
iob_intr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_90), 16, 16)) -> intp(3, 0, 36)
	.word 0xfaada070  ! 971: STBA_I	stba	%r29, [%r22 + 0x0070] %asi
T3_asi_reg_rd_40:
	mov	0x2e, %r14
	.word 0xf8db89e0  ! 974: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf834a0e3  ! 975: STH_I	sth	%r28, [%r18 + 0x00e3]
iob_intr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_91), 16, 16)) -> intp(3, 0, 22)
iob_intr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_92), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_93), 16, 16)) -> intp(3, 0, 2a)
	.word 0xfa24a08f  ! 981: STW_I	stw	%r29, [%r18 + 0x008f]
cpu_intr_3_71:
	setx	0x250233, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_94), 16, 16)) -> intp(3, 0, 31)
	.word 0xf235e057  ! 988: STH_I	sth	%r25, [%r23 + 0x0057]
cpu_intr_3_72:
	setx	0x240016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8f902002  ! 994: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xf4244000  ! 996: STW_R	stw	%r26, [%r17 + %r0]
T3_asi_reg_wr_37:
	mov	0x2f, %r14
	.word 0xfaf38e40  ! 997: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_95), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_73:
	setx	0x240020, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_96), 16, 16)) -> intp(3, 0, 4)
	.word 0xf0f5e1d8  ! 1001: STXA_I	stxa	%r24, [%r23 + 0x01d8] %asi
iob_intr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_97), 16, 16)) -> intp(3, 0, 1f)
	ta	T_CHANGE_NONHPRIV
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983dc0  ! 1008: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dc0, %hpstate
iob_intr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_98), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_rd_41:
	mov	0xc, %r14
	.word 0xf6db8e40  ! 1011: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_TO_TL1
iob_intr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_99), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_rd_42:
	mov	0x2, %r14
	.word 0xfadb8e40  ! 1016: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_74:
	setx	0x240018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_75:
	setx	0x26030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b50020  ! 1021: STHA_R	stha	%r25, [%r20 + %r0] 0x01
cpu_intr_3_76:
	setx	0x24012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6244000  ! 1023: STW_R	stw	%r27, [%r17 + %r0]
T3_asi_reg_rd_43:
	mov	0x7, %r14
	.word 0xfadb8e80  ! 1024: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf234e055  ! 1025: STH_I	sth	%r25, [%r19 + 0x0055]
	.word 0xb72d6001  ! 1027: SLL_I	sll 	%r21, 0x0001, %r27
	.word 0xb28d0000  ! 1029: ANDcc_R	andcc 	%r20, %r0, %r25
T3_asi_reg_wr_38:
	mov	0x6, %r14
	.word 0xf6f38e80  ! 1030: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf2346109  ! 1031: STH_I	sth	%r25, [%r17 + 0x0109]
iob_intr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_100), 16, 16)) -> intp(3, 0, 16)
	.word 0xf224613e  ! 1034: STW_I	stw	%r25, [%r17 + 0x013e]
	.word 0xfe7560cf  ! 1035: STX_I	stx	%r31, [%r21 + 0x00cf]
iob_intr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_101), 16, 16)) -> intp(3, 0, 3a)
	ta	T_CHANGE_TO_TL0
	.word 0xfa2d4000  ! 1039: STB_R	stb	%r29, [%r21 + %r0]
T3_asi_reg_rd_44:
	mov	0x18, %r14
	.word 0xf8db8e80  ! 1044: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_102), 16, 16)) -> intp(3, 0, 33)
T3_asi_reg_rd_45:
	mov	0x3c2, %r14
	.word 0xf4db8400  ! 1046: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T3_asi_reg_rd_46:
	mov	0x9, %r14
	.word 0xf0db8400  ! 1049: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_103), 16, 16)) -> intp(3, 0, 2b)
	.word 0xfc252022  ! 1052: STW_I	stw	%r30, [%r20 + 0x0022]
T3_asi_reg_wr_39:
	mov	0x33, %r14
	.word 0xfaf389e0  ! 1053: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf0ac0020  ! 1058: STBA_R	stba	%r24, [%r16 + %r0] 0x01
	.word 0xfa2c608c  ! 1059: STB_I	stb	%r29, [%r17 + 0x008c]
	.word 0xfc25a024  ! 1061: STW_I	stw	%r30, [%r22 + 0x0024]
T3_asi_reg_rd_47:
	mov	0x38, %r14
	.word 0xf6db8400  ! 1064: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T3_asi_reg_wr_40:
	mov	0x7, %r14
	.word 0xfaf38e60  ! 1065: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_48:
	mov	0x32, %r14
	.word 0xf6db89e0  ! 1067: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_104), 16, 16)) -> intp(3, 0, 1d)
cpu_intr_3_77:
	setx	0x240028, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_105), 16, 16)) -> intp(3, 0, 19)
	.word 0xf475c000  ! 1083: STX_R	stx	%r26, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_49:
	mov	0xc, %r14
	.word 0xf4db89e0  ! 1085: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0x8794a03a  ! 1087: WRPR_TT_I	wrpr	%r18, 0x003a, %tt
	.word 0xfa250000  ! 1088: STW_R	stw	%r29, [%r20 + %r0]
iob_intr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_106), 16, 16)) -> intp(3, 0, 32)
	.word 0xf6b58020  ! 1090: STHA_R	stha	%r27, [%r22 + %r0] 0x01
iob_intr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_107), 16, 16)) -> intp(3, 0, 33)
	ta	T_CHANGE_TO_TL1
	.word 0xfa742086  ! 1093: STX_I	stx	%r29, [%r16 + 0x0086]
cpu_intr_3_78:
	setx	0x250215, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_108), 16, 16)) -> intp(3, 0, 24)
	.word 0xf22561c2  ! 1098: STW_I	stw	%r25, [%r21 + 0x01c2]
T3_asi_reg_rd_50:
	mov	0x20, %r14
	.word 0xfadb8e80  ! 1099: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T3_asi_reg_rd_51:
	mov	0x6, %r14
	.word 0xfedb8e40  ! 1103: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_rd_52:
	mov	0x15, %r14
	.word 0xf2db8400  ! 1106: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_109), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_wr_41:
	mov	0x14, %r14
	.word 0xfaf384a0  ! 1109: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb93d0000  ! 1112: SRA_R	sra 	%r20, %r0, %r28
iob_intr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_110), 16, 16)) -> intp(3, 0, 2c)
iob_intr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_111), 16, 16)) -> intp(3, 0, 10)
	ta	T_CHANGE_NONHPRIV
	.word 0xf8b58020  ! 1119: STHA_R	stha	%r28, [%r22 + %r0] 0x01
	.word 0xb48cc000  ! 1121: ANDcc_R	andcc 	%r19, %r0, %r26
T3_asi_reg_wr_42:
	mov	0x3c3, %r14
	.word 0xf8f38e60  ! 1122: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_112), 16, 16)) -> intp(3, 0, 3d)
	.word 0xfcade07b  ! 1126: STBA_I	stba	%r30, [%r23 + 0x007b] %asi
	.word 0xf8344000  ! 1128: STH_R	sth	%r28, [%r17 + %r0]
T3_asi_reg_wr_43:
	mov	0xc, %r14
	.word 0xf8f38400  ! 1134: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_113), 16, 16)) -> intp(3, 0, 2b)
T3_asi_reg_rd_53:
	mov	0x1d, %r14
	.word 0xf4db8400  ! 1139: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
iob_intr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_114), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_79:
	setx	0x270110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcf420fc  ! 1144: STXA_I	stxa	%r30, [%r16 + 0x00fc] %asi
cpu_intr_3_80:
	setx	0x27000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc756127  ! 1148: STX_I	stx	%r30, [%r21 + 0x0127]
iob_intr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_115), 16, 16)) -> intp(3, 0, 30)
cpu_intr_3_81:
	setx	0x24013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62de0b3  ! 1156: STB_I	stb	%r27, [%r23 + 0x00b3]
T3_asi_reg_rd_54:
	mov	0x7, %r14
	.word 0xf8db8e40  ! 1159: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_82:
	setx	0x25003d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_55:
	mov	0x28, %r14
	.word 0xf0db84a0  ! 1162: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_116), 16, 16)) -> intp(3, 0, 30)
cpu_intr_3_83:
	setx	0x270308, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983ec2  ! 1167: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec2, %hpstate
	.word 0xfa24a16d  ! 1168: STW_I	stw	%r29, [%r18 + 0x016d]
T3_asi_reg_rd_56:
	mov	0x3c4, %r14
	.word 0xfedb8e80  ! 1172: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb5508000  ! 1174: RDPR_TSTATE	rdpr	%tstate, %r26
iob_intr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_117), 16, 16)) -> intp(3, 0, 24)
	.word 0xf6b58020  ! 1178: STHA_R	stha	%r27, [%r22 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_84:
	setx	0x260033, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_85:
	setx	0x24010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe25a02d  ! 1185: STW_I	stw	%r31, [%r22 + 0x002d]
cpu_intr_3_86:
	setx	0x250319, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_44:
	mov	0x2e, %r14
	.word 0xf2f38400  ! 1187: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T3_asi_reg_rd_57:
	mov	0x7, %r14
	.word 0xf0db8e40  ! 1188: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_rd_58:
	mov	0x1b, %r14
	.word 0xf8db8e40  ! 1190: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_87:
	setx	0x260111, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb88dc000  ! 1194: ANDcc_R	andcc 	%r23, %r0, %r28
	.word 0xb7508000  ! 1195: RDPR_TSTATE	<illegal instruction>
iob_intr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_118), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_88:
	setx	0x24002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeace0fc  ! 1200: ANDNcc_I	andncc 	%r19, 0x00fc, %r31
cpu_intr_3_89:
	setx	0x250313, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983e98  ! 1204: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e98, %hpstate
iob_intr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_119), 16, 16)) -> intp(3, 0, 1b)
iob_intr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_120), 16, 16)) -> intp(3, 0, 14)
	.word 0xf62cc000  ! 1209: STB_R	stb	%r27, [%r19 + %r0]
T3_asi_reg_wr_45:
	mov	0x0, %r14
	.word 0xfaf384a0  ! 1210: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_wr_46:
	mov	0x35, %r14
	.word 0xf4f38400  ! 1213: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf8b520fd  ! 1215: STHA_I	stha	%r28, [%r20 + 0x00fd] %asi
	.word 0xf0a4a1a3  ! 1216: STWA_I	stwa	%r24, [%r18 + 0x01a3] %asi
T3_asi_reg_rd_59:
	mov	0x33, %r14
	.word 0xf6db8e60  ! 1217: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T3_asi_reg_wr_47:
	mov	0x3c0, %r14
	.word 0xf0f38e60  ! 1218: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb72c7001  ! 1219: SLLX_I	sllx	%r17, 0x0001, %r27
	.word 0xfc2ca079  ! 1221: STB_I	stb	%r30, [%r18 + 0x0079]
	.word 0xfa75c000  ! 1222: STX_R	stx	%r29, [%r23 + %r0]
cpu_intr_3_90:
	setx	0x27033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_121), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_wr_48:
	mov	0x2a, %r14
	.word 0xf6f38e60  ! 1226: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_3_91:
	setx	0x240331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a40020  ! 1229: STWA_R	stwa	%r26, [%r16 + %r0] 0x01
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f98  ! 1231: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f98, %hpstate
	.word 0xba24e05c  ! 1232: SUB_I	sub 	%r19, 0x005c, %r29
	.word 0xbe048000  ! 1234: ADD_R	add 	%r18, %r0, %r31
cpu_intr_3_92:
	setx	0x260110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f4a1cd  ! 1240: STXA_I	stxa	%r25, [%r18 + 0x01cd] %asi
iob_intr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_122), 16, 16)) -> intp(3, 0, 2c)
iob_intr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_123), 16, 16)) -> intp(3, 0, 13)
	ta	T_CHANGE_TO_TL0
	.word 0xf025213c  ! 1251: STW_I	stw	%r24, [%r20 + 0x013c]
	.word 0xf4f5a1ba  ! 1253: STXA_I	stxa	%r26, [%r22 + 0x01ba] %asi
T3_asi_reg_rd_60:
	mov	0x3c5, %r14
	.word 0xf0db8e80  ! 1254: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T3_asi_reg_rd_61:
	mov	0x3c8, %r14
	.word 0xf4db8400  ! 1255: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf474c000  ! 1256: STX_R	stx	%r26, [%r19 + %r0]
iob_intr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_124), 16, 16)) -> intp(3, 0, 34)
iob_intr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_125), 16, 16)) -> intp(3, 0, 17)
cpu_intr_3_93:
	setx	0x24010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_126), 16, 16)) -> intp(3, 0, 3b)
	ta	T_CHANGE_TO_TL1
	.word 0xb7500000  ! 1266: RDPR_TPC	rdpr	%tpc, %r27
T3_asi_reg_rd_62:
	mov	0xa, %r14
	.word 0xf4db8400  ! 1268: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_3_94:
	setx	0x24012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab50020  ! 1277: STHA_R	stha	%r29, [%r20 + %r0] 0x01
	.word 0xbabd8000  ! 1278: XNORcc_R	xnorcc 	%r22, %r0, %r29
T3_asi_reg_wr_49:
	mov	0x3c5, %r14
	.word 0xf4f389e0  ! 1281: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T3_asi_reg_wr_50:
	mov	0x18, %r14
	.word 0xf0f38e80  ! 1285: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_3_95:
	setx	0x270222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8354000  ! 1289: STH_R	sth	%r28, [%r21 + %r0]
iob_intr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_127), 16, 16)) -> intp(3, 0, 3a)
T3_asi_reg_rd_63:
	mov	0xf, %r14
	.word 0xfedb8e40  ! 1291: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xba044000  ! 1292: ADD_R	add 	%r17, %r0, %r29
	.word 0xf2740000  ! 1294: STX_R	stx	%r25, [%r16 + %r0]
T3_asi_reg_rd_64:
	mov	0x31, %r14
	.word 0xf4db8400  ! 1295: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T3_asi_reg_wr_51:
	mov	0xa, %r14
	.word 0xf6f38e60  ! 1296: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf6a5e105  ! 1297: STWA_I	stwa	%r27, [%r23 + 0x0105] %asi
	.word 0xf02d2126  ! 1298: STB_I	stb	%r24, [%r20 + 0x0126]
iob_intr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_128), 16, 16)) -> intp(3, 0, 1f)
	.word 0xf075e1be  ! 1301: STX_I	stx	%r24, [%r23 + 0x01be]
	.word 0xf6344000  ! 1302: STH_R	sth	%r27, [%r17 + %r0]
	.word 0xb97d0400  ! 1304: MOVR_R	movre	%r20, %r0, %r28
T3_asi_reg_rd_65:
	mov	0x3c8, %r14
	.word 0xf4db8e40  ! 1305: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_96:
	setx	0x270303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_97:
	setx	0x26010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a560c7  ! 1312: STWA_I	stwa	%r27, [%r21 + 0x00c7] %asi
	.word 0xf2a4203c  ! 1313: STWA_I	stwa	%r25, [%r16 + 0x003c] %asi
	.word 0xf0ace14f  ! 1314: STBA_I	stba	%r24, [%r19 + 0x014f] %asi
	.word 0xfea5c020  ! 1319: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
	.word 0xfc74a192  ! 1320: STX_I	stx	%r30, [%r18 + 0x0192]
T3_asi_reg_rd_66:
	mov	0x3c6, %r14
	.word 0xfadb89e0  ! 1322: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_129), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_rd_67:
	mov	0x36, %r14
	.word 0xfcdb84a0  ! 1327: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb08c8000  ! 1329: ANDcc_R	andcc 	%r18, %r0, %r24
	.word 0xf4b4c020  ! 1330: STHA_R	stha	%r26, [%r19 + %r0] 0x01
	.word 0xfc74c000  ! 1331: STX_R	stx	%r30, [%r19 + %r0]
iob_intr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_130), 16, 16)) -> intp(3, 0, 6)
iob_intr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_131), 16, 16)) -> intp(3, 0, 33)
iob_intr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_132), 16, 16)) -> intp(3, 0, 16)
	.word 0xf02c4000  ! 1338: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xf4740000  ! 1340: STX_R	stx	%r26, [%r16 + %r0]
T3_asi_reg_rd_68:
	mov	0xf, %r14
	.word 0xf8db8e40  ! 1342: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_TO_TL1
cpu_intr_3_98:
	setx	0x260330, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_99:
	setx	0x27031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe9d208f  ! 1346: XORcc_I	xorcc 	%r20, 0x008f, %r31
iob_intr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_133), 16, 16)) -> intp(3, 0, 2e)
	.word 0xbb2de001  ! 1350: SLL_I	sll 	%r23, 0x0001, %r29
	.word 0xf0a54020  ! 1352: STWA_R	stwa	%r24, [%r21 + %r0] 0x01
iob_intr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_134), 16, 16)) -> intp(3, 0, 22)
T3_asi_reg_rd_69:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 1356: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf4aca19f  ! 1357: STBA_I	stba	%r26, [%r18 + 0x019f] %asi
	.word 0x8f902000  ! 1364: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983d88  ! 1368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d88, %hpstate
	.word 0xbeb52138  ! 1371: ORNcc_I	orncc 	%r20, 0x0138, %r31
	.word 0xfead21f9  ! 1372: STBA_I	stba	%r31, [%r20 + 0x01f9] %asi
	.word 0xf0b50020  ! 1373: STHA_R	stha	%r24, [%r20 + %r0] 0x01
cpu_intr_3_100:
	setx	0x260102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_101:
	setx	0x260129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_102:
	setx	0x280219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42420ed  ! 1378: STW_I	stw	%r26, [%r16 + 0x00ed]
	.word 0xba456005  ! 1380: ADDC_I	addc 	%r21, 0x0005, %r29
	.word 0xb885c000  ! 1381: ADDcc_R	addcc 	%r23, %r0, %r28
T3_asi_reg_rd_70:
	mov	0x36, %r14
	.word 0xf0db8e80  ! 1385: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_135), 16, 16)) -> intp(3, 0, 38)
	.word 0xf075e067  ! 1393: STX_I	stx	%r24, [%r23 + 0x0067]
	.word 0xb4b42190  ! 1394: ORNcc_I	orncc 	%r16, 0x0190, %r26
T3_asi_reg_wr_52:
	mov	0x14, %r14
	.word 0xf2f389e0  ! 1395: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T3_asi_reg_rd_71:
	mov	0x12, %r14
	.word 0xfcdb8e40  ! 1396: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfaad613f  ! 1398: STBA_I	stba	%r29, [%r21 + 0x013f] %asi
cpu_intr_3_103:
	setx	0x28001e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_104:
	setx	0x2b013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x819829c0  ! 1402: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c0, %hpstate
	.word 0xf2b54020  ! 1403: STHA_R	stha	%r25, [%r21 + %r0] 0x01
	.word 0xb635e18a  ! 1411: ORN_I	orn 	%r23, 0x018a, %r27
	.word 0xf2250000  ! 1412: STW_R	stw	%r25, [%r20 + %r0]
cpu_intr_3_105:
	setx	0x2b032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f421e0  ! 1415: STXA_I	stxa	%r26, [%r16 + 0x01e0] %asi
T3_asi_reg_wr_53:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 1420: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_rd_72:
	mov	0x23, %r14
	.word 0xfedb89e0  ! 1422: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_136), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf2248000  ! 1429: STW_R	stw	%r25, [%r18 + %r0]
T3_asi_reg_wr_54:
	mov	0x12, %r14
	.word 0xfef38e40  ! 1430: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_rd_73:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 1431: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982b42  ! 1433: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b42, %hpstate
cpu_intr_3_106:
	setx	0x290337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_137), 16, 16)) -> intp(3, 0, 32)
	.word 0xf6ad614b  ! 1437: STBA_I	stba	%r27, [%r21 + 0x014b] %asi
T3_asi_reg_wr_55:
	mov	0x38, %r14
	.word 0xfcf38400  ! 1441: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T3_asi_reg_wr_56:
	mov	0x32, %r14
	.word 0xf4f38400  ! 1442: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_138), 16, 16)) -> intp(3, 0, 20)
	.word 0xf6744000  ! 1449: STX_R	stx	%r27, [%r17 + %r0]
iob_intr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_139), 16, 16)) -> intp(3, 0, e)
cpu_intr_3_107:
	setx	0x280030, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_108:
	setx	0x290136, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_109:
	setx	0x2a001b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_140), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf8250000  ! 1461: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xba348000  ! 1463: SUBC_R	orn 	%r18, %r0, %r29
cpu_intr_3_110:
	setx	0x29010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_57:
	mov	0x15, %r14
	.word 0xfef38e40  ! 1465: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb224a000  ! 1467: SUB_I	sub 	%r18, 0x0000, %r25
T3_asi_reg_rd_74:
	mov	0xe, %r14
	.word 0xf2db8400  ! 1473: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T3_asi_reg_wr_58:
	mov	0x14, %r14
	.word 0xf2f389e0  ! 1477: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_3_111:
	setx	0x2a0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x8198384a  ! 1479: WRHPR_HPSTATE_I	wrhpr	%r0, 0x184a, %hpstate
	.word 0xf6b5c020  ! 1480: STHA_R	stha	%r27, [%r23 + %r0] 0x01
iob_intr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_141), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_112:
	setx	0x2b022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcad208b  ! 1486: STBA_I	stba	%r30, [%r20 + 0x008b] %asi
cpu_intr_3_113:
	setx	0x2b020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_59:
	mov	0x22, %r14
	.word 0xf8f38e40  ! 1489: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf6258000  ! 1491: STW_R	stw	%r27, [%r22 + %r0]
cpu_intr_3_114:
	setx	0x280024, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_115:
	setx	0x290206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a5c020  ! 1496: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
T3_asi_reg_wr_60:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 1499: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_3_116:
	setx	0x28001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab4e02d  ! 1501: STHA_I	stha	%r29, [%r19 + 0x002d] %asi
	.word 0xf4250000  ! 1504: STW_R	stw	%r26, [%r20 + %r0]
T3_asi_reg_wr_61:
	mov	0x26, %r14
	.word 0xf4f389e0  ! 1506: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb635c000  ! 1510: ORN_R	orn 	%r23, %r0, %r27
	.word 0xf0750000  ! 1512: STX_R	stx	%r24, [%r20 + %r0]
cpu_intr_3_117:
	setx	0x29002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_118:
	setx	0x290313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2350000  ! 1517: STH_R	sth	%r25, [%r20 + %r0]
T3_asi_reg_rd_75:
	mov	0x29, %r14
	.word 0xf0db8e40  ! 1520: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_rd_76:
	mov	0x34, %r14
	.word 0xfedb84a0  ! 1521: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983e00  ! 1524: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e00, %hpstate
T3_asi_reg_wr_62:
	mov	0x33, %r14
	.word 0xfaf38e40  ! 1525: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfaf5e0f2  ! 1526: STXA_I	stxa	%r29, [%r23 + 0x00f2] %asi
	.word 0xb7355000  ! 1528: SRLX_R	srlx	%r21, %r0, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xfaad8020  ! 1534: STBA_R	stba	%r29, [%r22 + %r0] 0x01
T3_asi_reg_wr_63:
	mov	0x3c8, %r14
	.word 0xfef38e40  ! 1535: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_142), 16, 16)) -> intp(3, 0, a)
	.word 0xfca4a165  ! 1539: STWA_I	stwa	%r30, [%r18 + 0x0165] %asi
	.word 0xf2354000  ! 1541: STH_R	sth	%r25, [%r21 + %r0]
cpu_intr_3_119:
	setx	0x280224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0742085  ! 1543: STX_I	stx	%r24, [%r16 + 0x0085]
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983d8a  ! 1547: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d8a, %hpstate
	.word 0xf8358000  ! 1548: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xfeb40020  ! 1549: STHA_R	stha	%r31, [%r16 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_77:
	mov	0x7, %r14
	.word 0xf0db89e0  ! 1555: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xfeac209d  ! 1556: STBA_I	stba	%r31, [%r16 + 0x009d] %asi
iob_intr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_143), 16, 16)) -> intp(3, 0, 30)
	.word 0xbc3da065  ! 1558: XNOR_I	xnor 	%r22, 0x0065, %r30
iob_intr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_144), 16, 16)) -> intp(3, 0, 24)
	.word 0xf2a42190  ! 1561: STWA_I	stwa	%r25, [%r16 + 0x0190] %asi
cpu_intr_3_120:
	setx	0x28012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2d8000  ! 1566: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xbc2c8000  ! 1567: ANDN_R	andn 	%r18, %r0, %r30
	ta	T_CHANGE_TO_TL1
iob_intr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_145), 16, 16)) -> intp(3, 0, 3)
	.word 0xf0a5e0f0  ! 1576: STWA_I	stwa	%r24, [%r23 + 0x00f0] %asi
	.word 0xf6256164  ! 1580: STW_I	stw	%r27, [%r21 + 0x0164]
cpu_intr_3_121:
	setx	0x2b0015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc2ca131  ! 1584: STB_I	stb	%r30, [%r18 + 0x0131]
cpu_intr_3_122:
	setx	0x28010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf6354000  ! 1589: STH_R	sth	%r27, [%r21 + %r0]
	.word 0xbe1d4000  ! 1591: XOR_R	xor 	%r21, %r0, %r31
	.word 0xf8acc020  ! 1595: STBA_R	stba	%r28, [%r19 + %r0] 0x01
iob_intr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_146), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf824c000  ! 1599: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xf6ace1c2  ! 1600: STBA_I	stba	%r27, [%r19 + 0x01c2] %asi
	.word 0xf62da130  ! 1602: STB_I	stb	%r27, [%r22 + 0x0130]
cpu_intr_3_123:
	setx	0x280327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_124:
	setx	0x2b011f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_64:
	mov	0xe, %r14
	.word 0xfcf384a0  ! 1605: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T3_asi_reg_rd_78:
	mov	0x5, %r14
	.word 0xf6db8e40  ! 1606: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_125:
	setx	0x280005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82c2044  ! 1610: STB_I	stb	%r28, [%r16 + 0x0044]
	.word 0xf675e19f  ! 1611: STX_I	stx	%r27, [%r23 + 0x019f]
	.word 0xbe35e1e2  ! 1613: ORN_I	orn 	%r23, 0x01e2, %r31
	.word 0xf0a48020  ! 1614: STWA_R	stwa	%r24, [%r18 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
	.word 0xf0ad6050  ! 1620: STBA_I	stba	%r24, [%r21 + 0x0050] %asi
iob_intr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_147), 16, 16)) -> intp(3, 0, 2)
	.word 0xfaa5a1d3  ! 1624: STWA_I	stwa	%r29, [%r22 + 0x01d3] %asi
iob_intr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_148), 16, 16)) -> intp(3, 0, 33)
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_65:
	mov	0x3c6, %r14
	.word 0xfef38e80  ! 1630: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T3_asi_reg_wr_66:
	mov	0x2b, %r14
	.word 0xf6f38e40  ! 1631: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	setx	data_start_6, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982cc2  ! 1637: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc2, %hpstate
T3_asi_reg_wr_67:
	mov	0x3c5, %r14
	.word 0xf8f38e40  ! 1639: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf2ad8020  ! 1641: STBA_R	stba	%r25, [%r22 + %r0] 0x01
T3_asi_reg_rd_79:
	mov	0x3c8, %r14
	.word 0xf2db84a0  ! 1644: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	ta	T_CHANGE_NONHPRIV
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982d42  ! 1649: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d42, %hpstate
	.word 0xb92d2001  ! 1651: SLL_I	sll 	%r20, 0x0001, %r28
cpu_intr_3_126:
	setx	0x2b0334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_127:
	setx	0x290123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f4e0d9  ! 1657: STXA_I	stxa	%r25, [%r19 + 0x00d9] %asi
	.word 0xbc45c000  ! 1662: ADDC_R	addc 	%r23, %r0, %r30
T3_asi_reg_rd_80:
	mov	0x3c6, %r14
	.word 0xf0db89e0  ! 1663: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982e42  ! 1664: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e42, %hpstate
	.word 0xfaa560ea  ! 1665: STWA_I	stwa	%r29, [%r21 + 0x00ea] %asi
cpu_intr_3_128:
	setx	0x2a0307, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_149), 16, 16)) -> intp(3, 0, 37)
	.word 0xf2754000  ! 1670: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xf2758000  ! 1671: STX_R	stx	%r25, [%r22 + %r0]
cpu_intr_3_129:
	setx	0x2b0037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_150), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf2b58020  ! 1680: STHA_R	stha	%r25, [%r22 + %r0] 0x01
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982c88  ! 1681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c88, %hpstate
	.word 0xf22ca0b3  ! 1682: STB_I	stb	%r25, [%r18 + 0x00b3]
	.word 0xf4258000  ! 1684: STW_R	stw	%r26, [%r22 + %r0]
T3_asi_reg_rd_81:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 1685: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbf2ca001  ! 1688: SLL_I	sll 	%r18, 0x0001, %r31
	.word 0xf62c8000  ! 1689: STB_R	stb	%r27, [%r18 + %r0]
iob_intr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_151), 16, 16)) -> intp(3, 0, 4)
cpu_intr_3_130:
	setx	0x290018, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_82:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 1699: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_wr_68:
	mov	0x34, %r14
	.word 0xf0f38e40  ! 1702: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfa2460e0  ! 1705: STW_I	stw	%r29, [%r17 + 0x00e0]
T3_asi_reg_rd_83:
	mov	0x1e, %r14
	.word 0xf6db8e40  ! 1707: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_131:
	setx	0x290137, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_152), 16, 16)) -> intp(3, 0, 8)
	.word 0xbd35d000  ! 1713: SRLX_R	srlx	%r23, %r0, %r30
T3_asi_reg_wr_69:
	mov	0x28, %r14
	.word 0xfef38e60  ! 1714: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb825606f  ! 1717: SUB_I	sub 	%r21, 0x006f, %r28
	.word 0xb22d4000  ! 1718: ANDN_R	andn 	%r21, %r0, %r25
iob_intr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_153), 16, 16)) -> intp(3, 0, 2d)
cpu_intr_3_132:
	setx	0x290208, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_154), 16, 16)) -> intp(3, 0, 31)
	.word 0xf0a460c4  ! 1725: STWA_I	stwa	%r24, [%r17 + 0x00c4] %asi
	ta	T_CHANGE_HPRIV
iob_intr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_155), 16, 16)) -> intp(3, 0, 26)
	.word 0xf2250000  ! 1731: STW_R	stw	%r25, [%r20 + %r0]
	.word 0xfcade0e8  ! 1732: STBA_I	stba	%r30, [%r23 + 0x00e8] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x839460e0  ! 1735: WRPR_TNPC_I	wrpr	%r17, 0x00e0, %tnpc
T3_asi_reg_wr_70:
	mov	0x3c3, %r14
	.word 0xf2f384a0  ! 1736: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_156), 16, 16)) -> intp(3, 0, 25)
iob_intr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_157), 16, 16)) -> intp(3, 0, 26)
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_71:
	mov	0x37, %r14
	.word 0xfaf38e40  ! 1747: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfc346167  ! 1749: STH_I	sth	%r30, [%r17 + 0x0167]
	.word 0xf0b4e1c3  ! 1752: STHA_I	stha	%r24, [%r19 + 0x01c3] %asi
	.word 0xbc9c8000  ! 1753: XORcc_R	xorcc 	%r18, %r0, %r30
cpu_intr_3_133:
	setx	0x290305, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983d80  ! 1758: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d80, %hpstate
T3_asi_reg_wr_72:
	mov	0x31, %r14
	.word 0xf2f38e80  ! 1760: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xfc746012  ! 1761: STX_I	stx	%r30, [%r17 + 0x0012]
	.word 0xf074a00c  ! 1763: STX_I	stx	%r24, [%r18 + 0x000c]
	.word 0xb89d219e  ! 1764: XORcc_I	xorcc 	%r20, 0x019e, %r28
iob_intr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_158), 16, 16)) -> intp(3, 0, 24)
	.word 0xf8b4c020  ! 1776: STHA_R	stha	%r28, [%r19 + %r0] 0x01
T3_asi_reg_rd_84:
	mov	0x3c0, %r14
	.word 0xf8db8e40  ! 1777: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf4b48020  ! 1778: STHA_R	stha	%r26, [%r18 + %r0] 0x01
	.word 0xf82c6182  ! 1779: STB_I	stb	%r28, [%r17 + 0x0182]
iob_intr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_159), 16, 16)) -> intp(3, 0, 1)
	.word 0xf6aca090  ! 1783: STBA_I	stba	%r27, [%r18 + 0x0090] %asi
cpu_intr_3_134:
	setx	0x29001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_135:
	setx	0x280029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_136:
	setx	0x280125, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_85:
	mov	0x1b, %r14
	.word 0xf4db8e60  ! 1798: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf4a54020  ! 1799: STWA_R	stwa	%r26, [%r21 + %r0] 0x01
	.word 0xf2754000  ! 1800: STX_R	stx	%r25, [%r21 + %r0]
T3_asi_reg_wr_73:
	mov	0x1c, %r14
	.word 0xf8f38400  ! 1805: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbc05209e  ! 1806: ADD_I	add 	%r20, 0x009e, %r30
	.word 0xf02c601b  ! 1807: STB_I	stb	%r24, [%r17 + 0x001b]
iob_intr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_160), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_wr_74:
	mov	0x23, %r14
	.word 0xf2f38e40  ! 1809: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_137:
	setx	0x280136, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_161), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_138:
	setx	0x2b0030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_162), 16, 16)) -> intp(3, 0, 24)
T3_asi_reg_wr_75:
	mov	0x6, %r14
	.word 0xfaf384a0  ! 1817: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xfeaca10c  ! 1820: STBA_I	stba	%r31, [%r18 + 0x010c] %asi
T3_asi_reg_rd_86:
	mov	0x9, %r14
	.word 0xfadb8e40  ! 1822: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xba34e09d  ! 1823: ORN_I	orn 	%r19, 0x009d, %r29
	.word 0xf074219b  ! 1824: STX_I	stx	%r24, [%r16 + 0x019b]
	.word 0xbac50000  ! 1825: ADDCcc_R	addccc 	%r20, %r0, %r29
cpu_intr_3_139:
	setx	0x2e0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a4c020  ! 1828: STWA_R	stwa	%r26, [%r19 + %r0] 0x01
T3_asi_reg_rd_87:
	mov	0x5, %r14
	.word 0xf8db8e40  ! 1829: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf22da169  ! 1830: STB_I	stb	%r25, [%r22 + 0x0169]
T3_asi_reg_wr_76:
	mov	0x3c5, %r14
	.word 0xf8f38e40  ! 1832: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982898  ! 1835: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0898, %hpstate
iob_intr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_163), 16, 16)) -> intp(3, 0, 22)
	.word 0xf82ce004  ! 1838: STB_I	stb	%r28, [%r19 + 0x0004]
	.word 0xb285c000  ! 1839: ADDcc_R	addcc 	%r23, %r0, %r25
T3_asi_reg_rd_88:
	mov	0x20, %r14
	.word 0xf0db89e0  ! 1840: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_3_140:
	setx	0x2d0331, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_164), 16, 16)) -> intp(3, 0, 1e)
	.word 0xb23de0cd  ! 1845: XNOR_I	xnor 	%r23, 0x00cd, %r25
iob_intr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_165), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_rd_89:
	mov	0x20, %r14
	.word 0xfcdb8e40  ! 1848: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb7643801  ! 1850: MOVcc_I	<illegal instruction>
	.word 0xb4844000  ! 1851: ADDcc_R	addcc 	%r17, %r0, %r26
cpu_intr_3_141:
	setx	0x2d012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983b92  ! 1853: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b92, %hpstate
cpu_intr_3_142:
	setx	0x2f0311, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_166), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_143:
	setx	0x2e0027, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_167), 16, 16)) -> intp(3, 0, 16)
	.word 0xb23c2199  ! 1863: XNOR_I	xnor 	%r16, 0x0199, %r25
	.word 0xb9359000  ! 1867: SRLX_R	srlx	%r22, %r0, %r28
	.word 0xf0240000  ! 1869: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xf2a50020  ! 1870: STWA_R	stwa	%r25, [%r20 + %r0] 0x01
cpu_intr_3_144:
	setx	0x2c0229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc340000  ! 1872: STH_R	sth	%r30, [%r16 + %r0]
iob_intr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_168), 16, 16)) -> intp(3, 0, 0)
	.word 0xfa746025  ! 1877: STX_I	stx	%r29, [%r17 + 0x0025]
cpu_intr_3_145:
	setx	0x2e021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf874a148  ! 1883: STX_I	stx	%r28, [%r18 + 0x0148]
iob_intr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_169), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_wr_77:
	mov	0x2, %r14
	.word 0xf4f389e0  ! 1886: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf2a52080  ! 1888: STWA_I	stwa	%r25, [%r20 + 0x0080] %asi
iob_intr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_170), 16, 16)) -> intp(3, 0, 1a)
	.word 0xfea58020  ! 1892: STWA_R	stwa	%r31, [%r22 + %r0] 0x01
	.word 0xf224e0fe  ! 1894: STW_I	stw	%r25, [%r19 + 0x00fe]
	.word 0xbe944000  ! 1895: ORcc_R	orcc 	%r17, %r0, %r31
	.word 0xb2c56040  ! 1897: ADDCcc_I	addccc 	%r21, 0x0040, %r25
T3_asi_reg_rd_90:
	mov	0x2e, %r14
	.word 0xfcdb8e60  ! 1899: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T3_asi_reg_rd_91:
	mov	0x2b, %r14
	.word 0xf2db84a0  ! 1902: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbc9d0000  ! 1904: XORcc_R	xorcc 	%r20, %r0, %r30
	.word 0xfaa54020  ! 1906: STWA_R	stwa	%r29, [%r21 + %r0] 0x01
iob_intr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_171), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf8b56003  ! 1908: STHA_I	stha	%r28, [%r21 + 0x0003] %asi
T3_asi_reg_wr_78:
	mov	0x1f, %r14
	.word 0xfaf389e0  ! 1909: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xfe2d6183  ! 1910: STB_I	stb	%r31, [%r21 + 0x0183]
	.word 0xf825e003  ! 1911: STW_I	stw	%r28, [%r23 + 0x0003]
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_79:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 1914: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf475c000  ! 1915: STX_R	stx	%r26, [%r23 + %r0]
	.word 0xf8a4e056  ! 1916: STWA_I	stwa	%r28, [%r19 + 0x0056] %asi
cpu_intr_3_146:
	setx	0x2d000b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_80:
	mov	0x9, %r14
	.word 0xfaf38e60  ! 1923: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf43461a0  ! 1924: STH_I	sth	%r26, [%r17 + 0x01a0]
iob_intr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_172), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_wr_81:
	mov	0x33, %r14
	.word 0xf0f38e40  ! 1928: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf8258000  ! 1929: STW_R	stw	%r28, [%r22 + %r0]
	.word 0xf8258000  ! 1931: STW_R	stw	%r28, [%r22 + %r0]
cpu_intr_3_147:
	setx	0x2f0306, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xfc3520ba  ! 1935: STH_I	sth	%r30, [%r20 + 0x00ba]
T3_asi_reg_rd_92:
	mov	0x2, %r14
	.word 0xf4db8e60  ! 1937: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	ta	T_CHANGE_HPRIV
	.word 0xf224a0c0  ! 1942: STW_I	stw	%r25, [%r18 + 0x00c0]
	.word 0xf8258000  ! 1944: STW_R	stw	%r28, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
iob_intr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_173), 16, 16)) -> intp(3, 0, 35)
	.word 0xb69c4000  ! 1948: XORcc_R	xorcc 	%r17, %r0, %r27
	.word 0xf674e16e  ! 1950: STX_I	stx	%r27, [%r19 + 0x016e]
	ta	T_CHANGE_NONHPRIV
	.word 0xfe2c4000  ! 1952: STB_R	stb	%r31, [%r17 + %r0]
T3_asi_reg_wr_82:
	mov	0xf, %r14
	.word 0xf0f38e60  ! 1953: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T3_asi_reg_rd_93:
	mov	0x3c8, %r14
	.word 0xfadb8e60  ! 1954: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xf034e096  ! 1955: STH_I	sth	%r24, [%r19 + 0x0096]
	.word 0xfcaca13d  ! 1959: STBA_I	stba	%r30, [%r18 + 0x013d] %asi
T3_asi_reg_rd_94:
	mov	0x1a, %r14
	.word 0xfadb84a0  ! 1960: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_3_148:
	setx	0x2d0037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_174), 16, 16)) -> intp(3, 0, 3f)
	.word 0xb92c2001  ! 1965: SLL_I	sll 	%r16, 0x0001, %r28
	.word 0xf2b5611a  ! 1966: STHA_I	stha	%r25, [%r21 + 0x011a] %asi
	ta	T_CHANGE_NONHPRIV
	.word 0xfcac4020  ! 1970: STBA_R	stba	%r30, [%r17 + %r0] 0x01
	.word 0xb4154000  ! 1973: OR_R	or 	%r21, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc35a0c9  ! 1980: STH_I	sth	%r30, [%r22 + 0x00c9]
	.word 0xf0ac615e  ! 1982: STBA_I	stba	%r24, [%r17 + 0x015e] %asi
	.word 0xf2258000  ! 1986: STW_R	stw	%r25, [%r22 + %r0]
cpu_intr_3_149:
	setx	0x2c0226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_175), 16, 16)) -> intp(3, 0, 1e)
	ta	T_CHANGE_HPRIV
	.word 0xf8b4a182  ! 1991: STHA_I	stha	%r28, [%r18 + 0x0182] %asi
	.word 0xf0350000  ! 1993: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xf2f4a0b5  ! 1994: STXA_I	stxa	%r25, [%r18 + 0x00b5] %asi
T3_asi_reg_wr_83:
	mov	0x8, %r14
	.word 0xf2f38400  ! 1996: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xf02460b0  ! 2000: STW_I	stw	%r24, [%r17 + 0x00b0]
	.word 0xf025a165  ! 2001: STW_I	stw	%r24, [%r22 + 0x0165]
iob_intr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_176), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_rd_95:
	mov	0x3c1, %r14
	.word 0xf8db8e60  ! 2004: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_rd_96:
	mov	0x3, %r14
	.word 0xfcdb8e40  ! 2005: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfeac20fc  ! 2006: STBA_I	stba	%r31, [%r16 + 0x00fc] %asi
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfc740000  ! 2014: STX_R	stx	%r30, [%r16 + %r0]
cpu_intr_3_150:
	setx	0x2c0317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_177), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfeb50020  ! 2023: STHA_R	stha	%r31, [%r20 + %r0] 0x01
	.word 0xb7480000  ! 2026: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xfef42193  ! 2030: STXA_I	stxa	%r31, [%r16 + 0x0193] %asi
	.word 0xfca54020  ! 2031: STWA_R	stwa	%r30, [%r21 + %r0] 0x01
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982a48  ! 2034: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a48, %hpstate
	.word 0xfa74e1df  ! 2035: STX_I	stx	%r29, [%r19 + 0x01df]
cpu_intr_3_151:
	setx	0x2f030d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_178), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_rd_97:
	mov	0x1, %r14
	.word 0xf4db84a0  ! 2047: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf425a1ad  ! 2049: STW_I	stw	%r26, [%r22 + 0x01ad]
	.word 0xf8758000  ! 2052: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xf0ac0020  ! 2053: STBA_R	stba	%r24, [%r16 + %r0] 0x01
T3_asi_reg_rd_98:
	mov	0x1f, %r14
	.word 0xfedb84a0  ! 2054: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_179), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_180), 16, 16)) -> intp(3, 0, 6)
	.word 0xf0ad212e  ! 2065: STBA_I	stba	%r24, [%r20 + 0x012e] %asi
	.word 0xf02da03b  ! 2066: STB_I	stb	%r24, [%r22 + 0x003b]
	.word 0xf62d8000  ! 2068: STB_R	stb	%r27, [%r22 + %r0]
iob_intr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_181), 16, 16)) -> intp(3, 0, 38)
	.word 0xfeb58020  ! 2071: STHA_R	stha	%r31, [%r22 + %r0] 0x01
	.word 0xb92cb001  ! 2073: SLLX_I	sllx	%r18, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0xf8ace178  ! 2080: STBA_I	stba	%r28, [%r19 + 0x0178] %asi
T3_asi_reg_rd_99:
	mov	0x35, %r14
	.word 0xf0db8e40  ! 2082: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_wr_84:
	mov	0x3c4, %r14
	.word 0xf6f389e0  ! 2083: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xfa24e15c  ! 2084: STW_I	stw	%r29, [%r19 + 0x015c]
T3_asi_reg_wr_85:
	mov	0x29, %r14
	.word 0xf4f389e0  ! 2085: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xfc7560d1  ! 2087: STX_I	stx	%r30, [%r21 + 0x00d1]
iob_intr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_182), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_183), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf2b5e016  ! 2100: STHA_I	stha	%r25, [%r23 + 0x0016] %asi
cpu_intr_3_152:
	setx	0x2f031d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_153:
	setx	0x2d0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b4e109  ! 2103: STHA_I	stha	%r27, [%r19 + 0x0109] %asi
	.word 0xb81ce03a  ! 2104: XOR_I	xor 	%r19, 0x003a, %r28
cpu_intr_3_154:
	setx	0x2e0134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_155:
	setx	0x2d001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_156:
	setx	0x2e0021, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_86:
	mov	0xf, %r14
	.word 0xf8f38e80  ! 2110: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf6b4a15f  ! 2113: STHA_I	stha	%r27, [%r18 + 0x015f] %asi
T3_asi_reg_wr_87:
	mov	0x2d, %r14
	.word 0xfef38400  ! 2114: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf6b46195  ! 2117: STHA_I	stha	%r27, [%r17 + 0x0195] %asi
cpu_intr_3_157:
	setx	0x2e0032, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_88:
	mov	0x12, %r14
	.word 0xf8f384a0  ! 2123: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xf6358000  ! 2125: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xb60c2143  ! 2126: AND_I	and 	%r16, 0x0143, %r27
cpu_intr_3_158:
	setx	0x2f010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_100:
	mov	0x6, %r14
	.word 0xf0db8400  ! 2130: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_3_159:
	setx	0x2d0309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ac4020  ! 2132: STBA_R	stba	%r26, [%r17 + %r0] 0x01
	.word 0xb40ca046  ! 2134: AND_I	and 	%r18, 0x0046, %r26
T3_asi_reg_wr_89:
	mov	0x3c6, %r14
	.word 0xfaf38e80  ! 2136: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf8f42127  ! 2138: STXA_I	stxa	%r28, [%r16 + 0x0127] %asi
iob_intr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_184), 16, 16)) -> intp(3, 0, a)
	.word 0xf8f5e001  ! 2140: STXA_I	stxa	%r28, [%r23 + 0x0001] %asi
iob_intr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_185), 16, 16)) -> intp(3, 0, 18)
T3_asi_reg_rd_101:
	mov	0x3c3, %r14
	.word 0xf4db89e0  ! 2143: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_3_160:
	setx	0x2d0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ad8020  ! 2146: STBA_R	stba	%r27, [%r22 + %r0] 0x01
iob_intr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_186), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_161:
	setx	0x2f0308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_187), 16, 16)) -> intp(3, 0, 39)
cpu_intr_3_162:
	setx	0x2c0236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_188), 16, 16)) -> intp(3, 0, 35)
iob_intr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_189), 16, 16)) -> intp(3, 0, 39)
T3_asi_reg_rd_102:
	mov	0x12, %r14
	.word 0xf8db8e40  ! 2160: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_190), 16, 16)) -> intp(3, 0, 8)
	.word 0xf0b48020  ! 2166: STHA_R	stha	%r24, [%r18 + %r0] 0x01
	.word 0xf2f4207e  ! 2168: STXA_I	stxa	%r25, [%r16 + 0x007e] %asi
cpu_intr_3_163:
	setx	0x2e032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb084a14c  ! 2170: ADDcc_I	addcc 	%r18, 0x014c, %r24
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983f80  ! 2172: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f80, %hpstate
T3_asi_reg_wr_90:
	mov	0x3c5, %r14
	.word 0xfaf389e0  ! 2173: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T3_asi_reg_rd_103:
	mov	0x18, %r14
	.word 0xfedb89e0  ! 2176: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf22461be  ! 2181: STW_I	stw	%r25, [%r17 + 0x01be]
	ta	T_CHANGE_HPRIV
	.word 0xfc2dc000  ! 2184: STB_R	stb	%r30, [%r23 + %r0]
	.word 0xf4258000  ! 2187: STW_R	stw	%r26, [%r22 + %r0]
cpu_intr_3_164:
	setx	0x2c010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22c8000  ! 2190: STB_R	stb	%r25, [%r18 + %r0]
	.word 0xb494c000  ! 2193: ORcc_R	orcc 	%r19, %r0, %r26
iob_intr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_191), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf8b58020  ! 2195: STHA_R	stha	%r28, [%r22 + %r0] 0x01
	.word 0xa1902002  ! 2196: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	ta	T_CHANGE_TO_TL0
	.word 0xfab40020  ! 2198: STHA_R	stha	%r29, [%r16 + %r0] 0x01
cpu_intr_3_165:
	setx	0x2c0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ad61bb  ! 2204: STBA_I	stba	%r28, [%r21 + 0x01bb] %asi
T3_asi_reg_rd_104:
	mov	0x3c7, %r14
	.word 0xf8db89e0  ! 2209: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf6344000  ! 2210: STH_R	sth	%r27, [%r17 + %r0]
iob_intr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_192), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf4b5e0b4  ! 2214: STHA_I	stha	%r26, [%r23 + 0x00b4] %asi
cpu_intr_3_166:
	setx	0x2c0302, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_91:
	mov	0x32, %r14
	.word 0xf6f384a0  ! 2219: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_3_167:
	setx	0x2e001b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_193), 16, 16)) -> intp(3, 0, 22)
	.word 0xfaf4a134  ! 2225: STXA_I	stxa	%r29, [%r18 + 0x0134] %asi
cpu_intr_3_168:
	setx	0x2f033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9d0000  ! 2227: XORcc_R	xorcc 	%r20, %r0, %r29
	.word 0xf034e16a  ! 2229: STH_I	sth	%r24, [%r19 + 0x016a]
T3_asi_reg_wr_92:
	mov	0x3c8, %r14
	.word 0xf0f38e60  ! 2230: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb1508000  ! 2231: RDPR_TSTATE	rdpr	%tstate, %r24
cpu_intr_3_169:
	setx	0x2d023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_170:
	setx	0x2f0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_194), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_195), 16, 16)) -> intp(3, 0, 13)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_196), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_171:
	setx	0x2d0134, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_93:
	mov	0x10, %r14
	.word 0xfaf389e0  ! 2249: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_197), 16, 16)) -> intp(3, 0, 2c)
	.word 0xfaada0ad  ! 2257: STBA_I	stba	%r29, [%r22 + 0x00ad] %asi
iob_intr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_198), 16, 16)) -> intp(3, 0, 3f)
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983890  ! 2261: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1890, %hpstate
cpu_intr_3_172:
	setx	0x2e0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb22c61ae  ! 2269: ANDN_I	andn 	%r17, 0x01ae, %r25
T3_asi_reg_rd_105:
	mov	0x2b, %r14
	.word 0xfedb8e60  ! 2270: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_199), 16, 16)) -> intp(3, 0, 23)
	ta	T_CHANGE_HPRIV
	.word 0xf4ad0020  ! 2274: STBA_R	stba	%r26, [%r20 + %r0] 0x01
	.word 0xf0f560c4  ! 2275: STXA_I	stxa	%r24, [%r21 + 0x00c4] %asi
	.word 0xb0a4c000  ! 2276: SUBcc_R	subcc 	%r19, %r0, %r24
	.word 0xfca5213b  ! 2279: STWA_I	stwa	%r30, [%r20 + 0x013b] %asi
	.word 0xfe244000  ! 2280: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xfeb5e065  ! 2286: STHA_I	stha	%r31, [%r23 + 0x0065] %asi
T3_asi_reg_rd_106:
	mov	0x2f, %r14
	.word 0xfedb84a0  ! 2287: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf82c4000  ! 2288: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xfead8020  ! 2289: STBA_R	stba	%r31, [%r22 + %r0] 0x01
T3_asi_reg_rd_107:
	mov	0x1b, %r14
	.word 0xfadb8e80  ! 2290: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf6746037  ! 2291: STX_I	stx	%r27, [%r17 + 0x0037]
T3_asi_reg_rd_108:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 2292: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_wr_94:
	mov	0x31, %r14
	.word 0xfcf38e40  ! 2293: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_rd_109:
	mov	0x3c2, %r14
	.word 0xfcdb89e0  ! 2294: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf42560c7  ! 2296: STW_I	stw	%r26, [%r21 + 0x00c7]
	.word 0xf474e0e0  ! 2297: STX_I	stx	%r26, [%r19 + 0x00e0]
	.word 0xfcac60de  ! 2300: STBA_I	stba	%r30, [%r17 + 0x00de] %asi
	.word 0xfe240000  ! 2302: STW_R	stw	%r31, [%r16 + %r0]
iob_intr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_200), 16, 16)) -> intp(3, 0, e)
	.word 0xf8b5e002  ! 2308: STHA_I	stha	%r28, [%r23 + 0x0002] %asi
T3_asi_reg_wr_95:
	mov	0x3c4, %r14
	.word 0xf4f38e40  ! 2310: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_173:
	setx	0x31003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4c421f1  ! 2316: ADDCcc_I	addccc 	%r16, 0x01f1, %r26
T3_asi_reg_wr_96:
	mov	0x3c1, %r14
	.word 0xfef384a0  ! 2318: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_3_174:
	setx	0x33031d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_175:
	setx	0x320029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb5a15f  ! 2324: STHA_I	stha	%r31, [%r22 + 0x015f] %asi
iob_intr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_201), 16, 16)) -> intp(3, 0, 26)
	.word 0xb81dc000  ! 2329: XOR_R	xor 	%r23, %r0, %r28
	.word 0xf674a0cd  ! 2339: STX_I	stx	%r27, [%r18 + 0x00cd]
iob_intr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_202), 16, 16)) -> intp(3, 0, 3b)
	.word 0xfc354000  ! 2343: STH_R	sth	%r30, [%r21 + %r0]
T3_asi_reg_rd_110:
	mov	0x3c7, %r14
	.word 0xfadb8400  ! 2346: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf0f5a09e  ! 2348: STXA_I	stxa	%r24, [%r22 + 0x009e] %asi
cpu_intr_3_176:
	setx	0x320100, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_203), 16, 16)) -> intp(3, 0, c)
cpu_intr_3_177:
	setx	0x30003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe248000  ! 2356: STW_R	stw	%r31, [%r18 + %r0]
cpu_intr_3_178:
	setx	0x310019, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x8198298a  ! 2362: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098a, %hpstate
T3_asi_reg_wr_97:
	mov	0x3c6, %r14
	.word 0xf6f38400  ! 2363: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T3_asi_reg_wr_98:
	mov	0x22, %r14
	.word 0xf6f38e40  ! 2370: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbcb421b2  ! 2373: SUBCcc_I	orncc 	%r16, 0x01b2, %r30
iob_intr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_204), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_wr_99:
	mov	0x36, %r14
	.word 0xfaf389e0  ! 2379: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_205), 16, 16)) -> intp(3, 0, 3b)
cpu_intr_3_179:
	setx	0x330101, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf02c0000  ! 2386: STB_R	stb	%r24, [%r16 + %r0]
cpu_intr_3_180:
	setx	0x330322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8748000  ! 2389: STX_R	stx	%r28, [%r18 + %r0]
cpu_intr_3_181:
	setx	0x310221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_206), 16, 16)) -> intp(3, 0, 39)
	.word 0xb8ac8000  ! 2395: ANDNcc_R	andncc 	%r18, %r0, %r28
iob_intr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_207), 16, 16)) -> intp(3, 0, 7)
iob_intr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_208), 16, 16)) -> intp(3, 0, 3e)
cpu_intr_3_182:
	setx	0x320318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4248000  ! 2399: STW_R	stw	%r26, [%r18 + %r0]
T3_asi_reg_rd_111:
	mov	0x3c2, %r14
	.word 0xf4db8e40  ! 2400: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_183:
	setx	0x32001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ad0020  ! 2406: STBA_R	stba	%r28, [%r20 + %r0] 0x01
	.word 0xb6050000  ! 2407: ADD_R	add 	%r20, %r0, %r27
iob_intr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_209), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_210), 16, 16)) -> intp(3, 0, 14)
iob_intr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_211), 16, 16)) -> intp(3, 0, 15)
cpu_intr_3_184:
	setx	0x330214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9518000  ! 2416: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xfc242107  ! 2419: STW_I	stw	%r30, [%r16 + 0x0107]
cpu_intr_3_185:
	setx	0x33012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ad8020  ! 2421: STBA_R	stba	%r27, [%r22 + %r0] 0x01
iob_intr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_212), 16, 16)) -> intp(3, 0, 3d)
	.word 0xfa2c8000  ! 2424: STB_R	stb	%r29, [%r18 + %r0]
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982892  ! 2425: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0892, %hpstate
cpu_intr_3_186:
	setx	0x310216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6352198  ! 2427: STH_I	sth	%r27, [%r20 + 0x0198]
iob_intr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_213), 16, 16)) -> intp(3, 0, 2b)
cpu_intr_3_187:
	setx	0x30013e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_188:
	setx	0x32020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc94c000  ! 2437: ORcc_R	orcc 	%r19, %r0, %r30
iob_intr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_214), 16, 16)) -> intp(3, 0, 2c)
	.word 0xbc1ce1d0  ! 2444: XOR_I	xor 	%r19, 0x01d0, %r30
	.word 0xfaad8020  ! 2445: STBA_R	stba	%r29, [%r22 + %r0] 0x01
iob_intr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_215), 16, 16)) -> intp(3, 0, 1c)
cpu_intr_3_189:
	setx	0x320327, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_wr_100:
	mov	0x1d, %r14
	.word 0xf0f38e60  ! 2455: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_216), 16, 16)) -> intp(3, 0, 22)
	.word 0xf025a12d  ! 2459: STW_I	stw	%r24, [%r22 + 0x012d]
	.word 0xf4ad4020  ! 2461: STBA_R	stba	%r26, [%r21 + %r0] 0x01
cpu_intr_3_190:
	setx	0x31033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_217), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_wr_101:
	mov	0x3c0, %r14
	.word 0xf0f38400  ! 2468: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf4342046  ! 2469: STH_I	sth	%r26, [%r16 + 0x0046]
	.word 0xf8b5c020  ! 2470: STHA_R	stha	%r28, [%r23 + %r0] 0x01
T3_asi_reg_rd_112:
	mov	0x3c6, %r14
	.word 0xf8db8e60  ! 2471: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf2a560b7  ! 2472: STWA_I	stwa	%r25, [%r21 + 0x00b7] %asi
	.word 0xf6a4c020  ! 2473: STWA_R	stwa	%r27, [%r19 + %r0] 0x01
	.word 0xb044e11b  ! 2474: ADDC_I	addc 	%r19, 0x011b, %r24
	.word 0xf4340000  ! 2477: STH_R	sth	%r26, [%r16 + %r0]
cpu_intr_3_191:
	setx	0x300109, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_113:
	mov	0x2c, %r14
	.word 0xf6db8e80  ! 2479: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb13cf001  ! 2481: SRAX_I	srax	%r19, 0x0001, %r24
iob_intr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_218), 16, 16)) -> intp(3, 0, 2c)
	.word 0xb6a52188  ! 2486: SUBcc_I	subcc 	%r20, 0x0188, %r27
	.word 0xf6b421eb  ! 2489: STHA_I	stha	%r27, [%r16 + 0x01eb] %asi
	.word 0xfca4e198  ! 2490: STWA_I	stwa	%r30, [%r19 + 0x0198] %asi
cpu_intr_3_192:
	setx	0x300126, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_219), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_rd_114:
	mov	0x3c3, %r14
	.word 0xfadb8e80  ! 2501: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf4740000  ! 2502: STX_R	stx	%r26, [%r16 + %r0]
T3_asi_reg_rd_115:
	mov	0x3c3, %r14
	.word 0xf8db8e60  ! 2503: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_193:
	setx	0x32010b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_220), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf6a420b1  ! 2514: STWA_I	stwa	%r27, [%r16 + 0x00b1] %asi
	.word 0xf6b4a006  ! 2516: STHA_I	stha	%r27, [%r18 + 0x0006] %asi
	.word 0xb4ade17e  ! 2519: ANDNcc_I	andncc 	%r23, 0x017e, %r26
	.word 0xfcad8020  ! 2520: STBA_R	stba	%r30, [%r22 + %r0] 0x01
cpu_intr_3_194:
	setx	0x330127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf3cb001  ! 2524: SRAX_I	srax	%r18, 0x0001, %r31
cpu_intr_3_195:
	setx	0x31010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_196:
	setx	0x330215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa3461c2  ! 2529: STH_I	sth	%r29, [%r17 + 0x01c2]
	.word 0xf02dc000  ! 2532: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xf8ada1f0  ! 2533: STBA_I	stba	%r28, [%r22 + 0x01f0] %asi
iob_intr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_221), 16, 16)) -> intp(3, 0, 2d)
	.word 0xfca4c020  ! 2538: STWA_R	stwa	%r30, [%r19 + %r0] 0x01
	.word 0xfaa5a000  ! 2539: STWA_I	stwa	%r29, [%r22 + 0x0000] %asi
	.word 0xbd7cc400  ! 2540: MOVR_R	movre	%r19, %r0, %r30
	.word 0xf434e17f  ! 2541: STH_I	sth	%r26, [%r19 + 0x017f]
T3_asi_reg_wr_102:
	mov	0x30, %r14
	.word 0xf6f38e60  ! 2543: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_222), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf62d0000  ! 2545: STB_R	stb	%r27, [%r20 + %r0]
T3_asi_reg_rd_116:
	mov	0x25, %r14
	.word 0xfadb8400  ! 2547: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xf0258000  ! 2550: STW_R	stw	%r24, [%r22 + %r0]
	.word 0xf4340000  ! 2551: STH_R	sth	%r26, [%r16 + %r0]
T3_asi_reg_rd_117:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 2555: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf4740000  ! 2557: STX_R	stx	%r26, [%r16 + %r0]
iob_intr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_223), 16, 16)) -> intp(3, 0, 14)
	.word 0xfead4020  ! 2568: STBA_R	stba	%r31, [%r21 + %r0] 0x01
	.word 0xfcb420c3  ! 2569: STHA_I	stha	%r30, [%r16 + 0x00c3] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf67461dd  ! 2572: STX_I	stx	%r27, [%r17 + 0x01dd]
	.word 0xf2b50020  ! 2576: STHA_R	stha	%r25, [%r20 + %r0] 0x01
T3_asi_reg_rd_118:
	mov	0x3c6, %r14
	.word 0xf2db84a0  ! 2578: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb8c46105  ! 2583: ADDCcc_I	addccc 	%r17, 0x0105, %r28
cpu_intr_3_197:
	setx	0x310206, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982d50  ! 2587: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d50, %hpstate
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982b5a  ! 2588: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5a, %hpstate
T3_asi_reg_wr_103:
	mov	0x8, %r14
	.word 0xfef384a0  ! 2589: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_224), 16, 16)) -> intp(3, 0, 2b)
	.word 0xfc758000  ! 2592: STX_R	stx	%r30, [%r22 + %r0]
	.word 0xf4358000  ! 2593: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xf2ada130  ! 2594: STBA_I	stba	%r25, [%r22 + 0x0130] %asi
iob_intr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_225), 16, 16)) -> intp(3, 0, 39)
	.word 0xb72d3001  ! 2597: SLLX_I	sllx	%r20, 0x0001, %r27
	.word 0xf8342103  ! 2602: STH_I	sth	%r28, [%r16 + 0x0103]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_119:
	mov	0x13, %r14
	.word 0xf6db8e60  ! 2605: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xfaa4212d  ! 2606: STWA_I	stwa	%r29, [%r16 + 0x012d] %asi
T3_asi_reg_rd_120:
	mov	0xe, %r14
	.word 0xf0db89e0  ! 2609: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xfcf5603a  ! 2611: STXA_I	stxa	%r30, [%r21 + 0x003a] %asi
T3_asi_reg_rd_121:
	mov	0x21, %r14
	.word 0xf2db89e0  ! 2612: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_226), 16, 16)) -> intp(3, 0, f)
	.word 0xf6b5e0fb  ! 2616: STHA_I	stha	%r27, [%r23 + 0x00fb] %asi
cpu_intr_3_198:
	setx	0x30023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_227), 16, 16)) -> intp(3, 0, 6)
	.word 0xf6a5c020  ! 2626: STWA_R	stwa	%r27, [%r23 + %r0] 0x01
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982a0a  ! 2634: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0a, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_199:
	setx	0x310333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_228), 16, 16)) -> intp(3, 0, 18)
T3_asi_reg_wr_104:
	mov	0x3c5, %r14
	.word 0xf2f38e60  ! 2640: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf8746165  ! 2642: STX_I	stx	%r28, [%r17 + 0x0165]
T3_asi_reg_wr_105:
	mov	0x12, %r14
	.word 0xf6f38e80  ! 2644: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf4256157  ! 2645: STW_I	stw	%r26, [%r21 + 0x0157]
T3_asi_reg_rd_122:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 2651: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb415c000  ! 2654: OR_R	or 	%r23, %r0, %r26
iob_intr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_229), 16, 16)) -> intp(3, 0, 31)
	.word 0xb0442023  ! 2656: ADDC_I	addc 	%r16, 0x0023, %r24
T3_asi_reg_wr_106:
	mov	0x16, %r14
	.word 0xf2f38e60  ! 2658: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T3_asi_reg_wr_107:
	mov	0x36, %r14
	.word 0xf8f38e60  ! 2659: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf4358000  ! 2662: STH_R	sth	%r26, [%r22 + %r0]
iob_intr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_230), 16, 16)) -> intp(3, 0, 3f)
iob_intr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_231), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_200:
	setx	0x300316, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_232), 16, 16)) -> intp(3, 0, 3d)
T3_asi_reg_wr_108:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 2674: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfc2c4000  ! 2675: STB_R	stb	%r30, [%r17 + %r0]
	.word 0xbd353001  ! 2676: SRLX_I	srlx	%r20, 0x0001, %r30
T3_asi_reg_wr_109:
	mov	0x1e, %r14
	.word 0xfcf389e0  ! 2678: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_233), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfeb5c020  ! 2681: STHA_R	stha	%r31, [%r23 + %r0] 0x01
iob_intr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_234), 16, 16)) -> intp(3, 0, 28)
	.word 0xfaa58020  ! 2683: STWA_R	stwa	%r29, [%r22 + %r0] 0x01
	.word 0xfcac8020  ! 2686: STBA_R	stba	%r30, [%r18 + %r0] 0x01
	.word 0xf2b5c020  ! 2689: STHA_R	stha	%r25, [%r23 + %r0] 0x01
	.word 0xf4a461bb  ! 2691: STWA_I	stwa	%r26, [%r17 + 0x01bb] %asi
	.word 0xf8ad21b0  ! 2692: STBA_I	stba	%r28, [%r20 + 0x01b0] %asi
T3_asi_reg_rd_123:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 2693: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf6b44020  ! 2694: STHA_R	stha	%r27, [%r17 + %r0] 0x01
	.word 0xf22d0000  ! 2695: STB_R	stb	%r25, [%r20 + %r0]
	.word 0xf0740000  ! 2696: STX_R	stx	%r24, [%r16 + %r0]
T3_asi_reg_wr_110:
	mov	0x25, %r14
	.word 0xf0f389e0  ! 2697: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T3_asi_reg_rd_124:
	mov	0x19, %r14
	.word 0xf2db84a0  ! 2701: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T3_asi_reg_rd_125:
	mov	0x3c2, %r14
	.word 0xfcdb8e60  ! 2702: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb835e08f  ! 2706: ORN_I	orn 	%r23, 0x008f, %r28
iob_intr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_235), 16, 16)) -> intp(3, 0, 39)
	.word 0xf0348000  ! 2710: STH_R	sth	%r24, [%r18 + %r0]
cpu_intr_3_201:
	setx	0x30032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a42193  ! 2713: STWA_I	stwa	%r25, [%r16 + 0x0193] %asi
iob_intr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_236), 16, 16)) -> intp(3, 0, 11)
	.word 0xf4b4611f  ! 2716: STHA_I	stha	%r26, [%r17 + 0x011f] %asi
	.word 0xf42ca161  ! 2717: STB_I	stb	%r26, [%r18 + 0x0161]
	.word 0xf2a4c020  ! 2718: STWA_R	stwa	%r25, [%r19 + %r0] 0x01
iob_intr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_237), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf07561c0  ! 2724: STX_I	stx	%r24, [%r21 + 0x01c0]
cpu_intr_3_202:
	setx	0x320201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab44000  ! 2726: SUBCcc_R	orncc 	%r17, %r0, %r29
	.word 0xb6350000  ! 2728: ORN_R	orn 	%r20, %r0, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xf8ace143  ! 2731: STBA_I	stba	%r28, [%r19 + 0x0143] %asi
cpu_intr_3_203:
	setx	0x310012, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_126:
	mov	0x26, %r14
	.word 0xf0db8e40  ! 2734: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb00d0000  ! 2737: AND_R	and 	%r20, %r0, %r24
iob_intr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_238), 16, 16)) -> intp(3, 0, 9)
	.word 0xfe2d21f2  ! 2743: STB_I	stb	%r31, [%r20 + 0x01f2]
iob_intr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_239), 16, 16)) -> intp(3, 0, 38)
	ta	T_CHANGE_NONHPRIV
	.word 0xf6adc020  ! 2751: STBA_R	stba	%r27, [%r23 + %r0] 0x01
	.word 0xf62de09b  ! 2752: STB_I	stb	%r27, [%r23 + 0x009b]
	.word 0xfab4c020  ! 2755: STHA_R	stha	%r29, [%r19 + %r0] 0x01
T3_asi_reg_wr_111:
	mov	0x3c3, %r14
	.word 0xf2f38e80  ! 2756: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xfea54020  ! 2760: STWA_R	stwa	%r31, [%r21 + %r0] 0x01
cpu_intr_3_204:
	setx	0x350007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfef46001  ! 2770: STXA_I	stxa	%r31, [%r17 + 0x0001] %asi
iob_intr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_240), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_wr_112:
	mov	0x3c5, %r14
	.word 0xf4f38400  ! 2774: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T3_asi_reg_wr_113:
	mov	0x3c3, %r14
	.word 0xf6f389e0  ! 2776: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	.word 0xf62d615c  ! 2779: STB_I	stb	%r27, [%r21 + 0x015c]
iob_intr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_241), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_242), 16, 16)) -> intp(3, 0, 25)
	.word 0xf235e0a0  ! 2784: STH_I	sth	%r25, [%r23 + 0x00a0]
cpu_intr_3_205:
	setx	0x370331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f5a050  ! 2789: STXA_I	stxa	%r26, [%r22 + 0x0050] %asi
	.word 0xb32d2001  ! 2790: SLL_I	sll 	%r20, 0x0001, %r25
T3_asi_reg_wr_114:
	mov	0x3c7, %r14
	.word 0xf0f38e80  ! 2791: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb9643801  ! 2793: MOVcc_I	<illegal instruction>
T3_asi_reg_wr_115:
	mov	0x1b, %r14
	.word 0xf6f38e80  ! 2794: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_3_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_243), 16, 16)) -> intp(3, 0, 3)
cpu_intr_3_206:
	setx	0x370037, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_3_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_244), 16, 16)) -> intp(3, 0, 7)
T3_asi_reg_rd_127:
	mov	0xa, %r14
	.word 0xfadb8400  ! 2801: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb3518000  ! 2805: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0xfe2d8000  ! 2808: STB_R	stb	%r31, [%r22 + %r0]
cpu_intr_3_207:
	setx	0x34012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb4e022  ! 2813: STHA_I	stha	%r31, [%r19 + 0x0022] %asi
	.word 0xf4a5c020  ! 2817: STWA_R	stwa	%r26, [%r23 + %r0] 0x01
T3_asi_reg_rd_128:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 2818: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_245), 16, 16)) -> intp(3, 0, 38)
	.word 0xb02de06b  ! 2820: ANDN_I	andn 	%r23, 0x006b, %r24
	.word 0xb014a02b  ! 2822: OR_I	or 	%r18, 0x002b, %r24
T3_asi_reg_rd_129:
	mov	0x3c4, %r14
	.word 0xfedb8e60  ! 2823: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf22cc000  ! 2825: STB_R	stb	%r25, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_246), 16, 16)) -> intp(3, 0, c)
	.word 0xf4244000  ! 2832: STW_R	stw	%r26, [%r17 + %r0]
T3_asi_reg_wr_116:
	mov	0x19, %r14
	.word 0xf0f384a0  ! 2834: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf835e127  ! 2836: STH_I	sth	%r28, [%r23 + 0x0127]
T3_asi_reg_rd_130:
	mov	0x32, %r14
	.word 0xf4db8e60  ! 2837: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_3_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_247), 16, 16)) -> intp(3, 0, 3e)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_248), 16, 16)) -> intp(3, 0, 9)
	.word 0xfcadc020  ! 2842: STBA_R	stba	%r30, [%r23 + %r0] 0x01
	.word 0xf2752173  ! 2844: STX_I	stx	%r25, [%r20 + 0x0173]
	.word 0xf0ada1e4  ! 2845: STBA_I	stba	%r24, [%r22 + 0x01e4] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf02c0000  ! 2849: STB_R	stb	%r24, [%r16 + %r0]
iob_intr_3_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_249), 16, 16)) -> intp(3, 0, 39)
	.word 0xb0050000  ! 2853: ADD_R	add 	%r20, %r0, %r24
	.word 0xbb2c2001  ! 2854: SLL_I	sll 	%r16, 0x0001, %r29
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983cca  ! 2855: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cca, %hpstate
T3_asi_reg_wr_117:
	mov	0x27, %r14
	.word 0xfaf38e60  ! 2857: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfa740000  ! 2861: STX_R	stx	%r29, [%r16 + %r0]
T3_asi_reg_wr_118:
	mov	0x24, %r14
	.word 0xf4f384a0  ! 2863: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfe2c6014  ! 2864: STB_I	stb	%r31, [%r17 + 0x0014]
	ta	T_CHANGE_HPRIV
	.word 0xf62c4000  ! 2866: STB_R	stb	%r27, [%r17 + %r0]
iob_intr_3_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_250), 16, 16)) -> intp(3, 0, 23)
cpu_intr_3_208:
	setx	0x360005, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_251), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_wr_119:
	mov	0xb, %r14
	.word 0xfaf38e40  ! 2872: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_252), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf8258000  ! 2876: STW_R	stw	%r28, [%r22 + %r0]
T3_asi_reg_wr_120:
	mov	0x31, %r14
	.word 0xfcf384a0  ! 2877: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T3_asi_reg_wr_121:
	mov	0x3c6, %r14
	.word 0xf4f384a0  ! 2879: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb6b5201f  ! 2880: ORNcc_I	orncc 	%r20, 0x001f, %r27
	.word 0xfab4611e  ! 2881: STHA_I	stha	%r29, [%r17 + 0x011e] %asi
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819829d8  ! 2885: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d8, %hpstate
cpu_intr_3_209:
	setx	0x370005, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_122:
	mov	0x21, %r14
	.word 0xfef38400  ! 2888: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_3_210:
	setx	0x360003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_253), 16, 16)) -> intp(3, 0, 32)
	.word 0xf83460a6  ! 2899: STH_I	sth	%r28, [%r17 + 0x00a6]
	.word 0xf0344000  ! 2902: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xbf520000  ! 2903: RDPR_PIL	rdpr	%pil, %r31
T3_asi_reg_rd_131:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 2906: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_211:
	setx	0x340307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f5e0de  ! 2913: STXA_I	stxa	%r26, [%r23 + 0x00de] %asi
	.word 0xb60d605c  ! 2914: AND_I	and 	%r21, 0x005c, %r27
	.word 0xb225c000  ! 2915: SUB_R	sub 	%r23, %r0, %r25
	.word 0xf8a58020  ! 2917: STWA_R	stwa	%r28, [%r22 + %r0] 0x01
	.word 0xb4240000  ! 2920: SUB_R	sub 	%r16, %r0, %r26
T3_asi_reg_wr_123:
	mov	0xc, %r14
	.word 0xf6f38400  ! 2922: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_3_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_254), 16, 16)) -> intp(3, 0, 2e)
	.word 0xfe7460d0  ! 2924: STX_I	stx	%r31, [%r17 + 0x00d0]
iob_intr_3_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_255), 16, 16)) -> intp(3, 0, 6)
	.word 0xf6a5a148  ! 2926: STWA_I	stwa	%r27, [%r22 + 0x0148] %asi
iob_intr_3_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_256), 16, 16)) -> intp(3, 0, 14)
	.word 0xfab561fc  ! 2929: STHA_I	stha	%r29, [%r21 + 0x01fc] %asi
	.word 0xf02de16e  ! 2930: STB_I	stb	%r24, [%r23 + 0x016e]
cpu_intr_3_212:
	setx	0x37003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_213:
	setx	0x340215, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_124:
	mov	0x33, %r14
	.word 0xf4f38e40  ! 2936: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_125:
	mov	0x2e, %r14
	.word 0xf2f389e0  ! 2938: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T3_asi_reg_wr_126:
	mov	0x3c3, %r14
	.word 0xfef38e80  ! 2939: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_3_214:
	setx	0x34010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_257), 16, 16)) -> intp(3, 0, 11)
iob_intr_3_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_258), 16, 16)) -> intp(3, 0, 3)
T3_asi_reg_wr_127:
	mov	0x18, %r14
	.word 0xf2f389e0  ! 2950: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf4ac8020  ! 2951: STBA_R	stba	%r26, [%r18 + %r0] 0x01
	.word 0xf2250000  ! 2952: STW_R	stw	%r25, [%r20 + %r0]
cpu_intr_3_215:
	setx	0x350036, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983a02  ! 2962: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a02, %hpstate
	.word 0xf2b46002  ! 2964: STHA_I	stha	%r25, [%r17 + 0x0002] %asi
iob_intr_3_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_259), 16, 16)) -> intp(3, 0, 1a)
T3_asi_reg_rd_132:
	mov	0x33, %r14
	.word 0xfadb8e40  ! 2968: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_260), 16, 16)) -> intp(3, 0, 18)
	.word 0xfe254000  ! 2977: STW_R	stw	%r31, [%r21 + %r0]
iob_intr_3_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_261), 16, 16)) -> intp(3, 0, 14)
	.word 0xf624c000  ! 2987: STW_R	stw	%r27, [%r19 + %r0]
iob_intr_3_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_262), 16, 16)) -> intp(3, 0, 32)
	.word 0xf4ad2180  ! 2991: STBA_I	stba	%r26, [%r20 + 0x0180] %asi
iob_intr_3_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_263), 16, 16)) -> intp(3, 0, 11)
	.word 0xf2b4619d  ! 2994: STHA_I	stha	%r25, [%r17 + 0x019d] %asi
cpu_intr_3_216:
	setx	0x37033c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_133:
	mov	0x6, %r14
	.word 0xf0db8400  ! 2997: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_3_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_264), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_rd_134:
	mov	0x1, %r14
	.word 0xfcdb84a0  ! 3000: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_3_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_265), 16, 16)) -> intp(3, 0, 24)
	.word 0xf024c000  ! 3004: STW_R	stw	%r24, [%r19 + %r0]
	.word 0xb12d1000  ! 3005: SLLX_R	sllx	%r20, %r0, %r24
	.word 0xfab5c020  ! 3006: STHA_R	stha	%r29, [%r23 + %r0] 0x01
	.word 0xfe74e110  ! 3011: STX_I	stx	%r31, [%r19 + 0x0110]
	.word 0xfc342009  ! 3012: STH_I	sth	%r30, [%r16 + 0x0009]
	.word 0xb12c5000  ! 3013: SLLX_R	sllx	%r17, %r0, %r24
	.word 0xfc344000  ! 3014: STH_R	sth	%r30, [%r17 + %r0]
T3_asi_reg_rd_135:
	mov	0x6, %r14
	.word 0xfcdb84a0  ! 3019: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_217:
	setx	0x360010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_266), 16, 16)) -> intp(3, 0, 1c)
cpu_intr_3_218:
	setx	0x34030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_128:
	mov	0xc, %r14
	.word 0xf8f384a0  ! 3025: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_3_219:
	setx	0x37003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a44020  ! 3028: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
	.word 0xf8ac4020  ! 3031: STBA_R	stba	%r28, [%r17 + %r0] 0x01
	.word 0xfa24e03a  ! 3032: STW_I	stw	%r29, [%r19 + 0x003a]
	.word 0xf624a0cb  ! 3034: STW_I	stw	%r27, [%r18 + 0x00cb]
	.word 0xf8a4e117  ! 3036: STWA_I	stwa	%r28, [%r19 + 0x0117] %asi
iob_intr_3_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_267), 16, 16)) -> intp(3, 0, 25)
cpu_intr_3_220:
	setx	0x35011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb37c0400  ! 3040: MOVR_R	movre	%r16, %r0, %r25
	.word 0xf0b40020  ! 3041: STHA_R	stha	%r24, [%r16 + %r0] 0x01
	.word 0xfe2d60a1  ! 3043: STB_I	stb	%r31, [%r21 + 0x00a1]
T3_asi_reg_wr_129:
	mov	0x29, %r14
	.word 0xf2f38e40  ! 3048: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_221:
	setx	0x370009, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_268), 16, 16)) -> intp(3, 0, 3f)
iob_intr_3_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_269), 16, 16)) -> intp(3, 0, 1f)
cpu_intr_3_222:
	setx	0x35001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5341000  ! 3054: SRLX_R	srlx	%r16, %r0, %r26
T3_asi_reg_wr_130:
	mov	0x3c1, %r14
	.word 0xf6f38e80  ! 3055: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_3_223:
	setx	0x370321, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_136:
	mov	0x3c5, %r14
	.word 0xf2db8e40  ! 3058: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_270), 16, 16)) -> intp(3, 0, 1)
	.word 0xb8c40000  ! 3062: ADDCcc_R	addccc 	%r16, %r0, %r28
	.word 0xb4b5e01d  ! 3063: SUBCcc_I	orncc 	%r23, 0x001d, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb6b5218b  ! 3065: ORNcc_I	orncc 	%r20, 0x018b, %r27
T3_asi_reg_wr_131:
	mov	0x3c4, %r14
	.word 0xfef38e60  ! 3066: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_3_224:
	setx	0x35023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc750000  ! 3069: STX_R	stx	%r30, [%r20 + %r0]
iob_intr_3_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_271), 16, 16)) -> intp(3, 0, 31)
	.word 0xfe34e093  ! 3072: STH_I	sth	%r31, [%r19 + 0x0093]
cpu_intr_3_225:
	setx	0x350236, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_132:
	mov	0x1, %r14
	.word 0xf0f38e40  ! 3075: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T3_asi_reg_wr_133:
	mov	0x1e, %r14
	.word 0xf4f38e40  ! 3076: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T3_asi_reg_rd_137:
	mov	0x27, %r14
	.word 0xf4db89e0  ! 3077: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T3_asi_reg_rd_138:
	mov	0x1c, %r14
	.word 0xfcdb8400  ! 3079: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb53c7001  ! 3080: SRAX_I	srax	%r17, 0x0001, %r26
	.word 0xf6750000  ! 3081: STX_R	stx	%r27, [%r20 + %r0]
iob_intr_3_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_272), 16, 16)) -> intp(3, 0, 33)
cpu_intr_3_226:
	setx	0x350104, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_134:
	mov	0x0, %r14
	.word 0xf8f38e80  ! 3092: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf42c0000  ! 3097: STB_R	stb	%r26, [%r16 + %r0]
T3_asi_reg_wr_135:
	mov	0x9, %r14
	.word 0xfcf389e0  ! 3098: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_3_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_273), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf22d0000  ! 3101: STB_R	stb	%r25, [%r20 + %r0]
T3_asi_reg_wr_136:
	mov	0x2c, %r14
	.word 0xfaf38e40  ! 3105: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfca50020  ! 3106: STWA_R	stwa	%r30, [%r20 + %r0] 0x01
	.word 0xfa2da1f5  ! 3107: STB_I	stb	%r29, [%r22 + 0x01f5]
cpu_intr_3_227:
	setx	0x34022c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_274), 16, 16)) -> intp(3, 0, f)
	.word 0xb0b5a002  ! 3111: SUBCcc_I	orncc 	%r22, 0x0002, %r24
	.word 0xf67460c0  ! 3112: STX_I	stx	%r27, [%r17 + 0x00c0]
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_228:
	setx	0x340101, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_137:
	mov	0x12, %r14
	.word 0xfef38400  ! 3120: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf4ac4020  ! 3122: STBA_R	stba	%r26, [%r17 + %r0] 0x01
	.word 0xf8244000  ! 3123: STW_R	stw	%r28, [%r17 + %r0]
	.word 0xfaad21ea  ! 3125: STBA_I	stba	%r29, [%r20 + 0x01ea] %asi
cpu_intr_3_229:
	setx	0x37010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_275), 16, 16)) -> intp(3, 0, 38)
	.word 0xf825a0ca  ! 3129: STW_I	stw	%r28, [%r22 + 0x00ca]
iob_intr_3_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_276), 16, 16)) -> intp(3, 0, 19)
	.word 0xf82c2103  ! 3133: STB_I	stb	%r28, [%r16 + 0x0103]
	ta	T_CHANGE_TO_TL1
	.word 0xf6354000  ! 3135: STH_R	sth	%r27, [%r21 + %r0]
cpu_intr_3_230:
	setx	0x35022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4ade197  ! 3137: ANDNcc_I	andncc 	%r23, 0x0197, %r26
T3_asi_reg_wr_138:
	mov	0x1b, %r14
	.word 0xf8f38e40  ! 3138: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_3_231:
	setx	0x360106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab4c020  ! 3142: STHA_R	stha	%r29, [%r19 + %r0] 0x01
	.word 0xb43461e3  ! 3143: SUBC_I	orn 	%r17, 0x01e3, %r26
	.word 0xfab5c020  ! 3144: STHA_R	stha	%r29, [%r23 + %r0] 0x01
iob_intr_3_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_277), 16, 16)) -> intp(3, 0, 27)
	.word 0xf8a461cb  ! 3147: STWA_I	stwa	%r28, [%r17 + 0x01cb] %asi
iob_intr_3_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_278), 16, 16)) -> intp(3, 0, 34)
cpu_intr_3_232:
	setx	0x360217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea4a0d0  ! 3150: STWA_I	stwa	%r31, [%r18 + 0x00d0] %asi
	.word 0xf22561ed  ! 3152: STW_I	stw	%r25, [%r21 + 0x01ed]
	.word 0xf0a5e1bd  ! 3155: STWA_I	stwa	%r24, [%r23 + 0x01bd] %asi
T3_asi_reg_wr_139:
	mov	0x3c2, %r14
	.word 0xfef38400  ! 3157: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_3_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_279), 16, 16)) -> intp(3, 0, 11)
	.word 0xb09d60cb  ! 3161: XORcc_I	xorcc 	%r21, 0x00cb, %r24
	.word 0xf4ad2071  ! 3162: STBA_I	stba	%r26, [%r20 + 0x0071] %asi
cpu_intr_3_233:
	setx	0x34023d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_140:
	mov	0x19, %r14
	.word 0xf4f38e40  ! 3165: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfab44020  ! 3167: STHA_R	stha	%r29, [%r17 + %r0] 0x01
	.word 0xb4b5e156  ! 3168: ORNcc_I	orncc 	%r23, 0x0156, %r26
cpu_intr_3_234:
	setx	0x370115, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_235:
	setx	0x340302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f52128  ! 3177: STXA_I	stxa	%r28, [%r20 + 0x0128] %asi
T3_asi_reg_wr_141:
	mov	0x26, %r14
	.word 0xfcf38e60  ! 3181: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_3_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_280), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_rd_139:
	mov	0x1d, %r14
	.word 0xfadb8e40  ! 3186: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_236:
	setx	0x360217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb69de14b  ! 3188: XORcc_I	xorcc 	%r23, 0x014b, %r27
	ta	T_CHANGE_TO_TL1
	.word 0x8f902000  ! 3194: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
T3_asi_reg_rd_140:
	mov	0x33, %r14
	.word 0xf6db8400  ! 3196: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf4b48020  ! 3197: STHA_R	stha	%r26, [%r18 + %r0] 0x01
	.word 0xf0744000  ! 3200: STX_R	stx	%r24, [%r17 + %r0]
cpu_intr_3_237:
	setx	0x38021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa5a1eb  ! 3204: STWA_I	stwa	%r29, [%r22 + 0x01eb] %asi
	.word 0xfeb4c020  ! 3205: STHA_R	stha	%r31, [%r19 + %r0] 0x01
cpu_intr_3_238:
	setx	0x3a011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf624603b  ! 3209: STW_I	stw	%r27, [%r17 + 0x003b]
iob_intr_3_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_281), 16, 16)) -> intp(3, 0, 23)
	.word 0xf82c4000  ! 3213: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xbd3d9000  ! 3214: SRAX_R	srax	%r22, %r0, %r30
	.word 0xf83521e2  ! 3221: STH_I	sth	%r28, [%r20 + 0x01e2]
cpu_intr_3_239:
	setx	0x3b032d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_282), 16, 16)) -> intp(3, 0, 15)
	.word 0xf225c000  ! 3229: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xf6ac6156  ! 3232: STBA_I	stba	%r27, [%r17 + 0x0156] %asi
cpu_intr_3_240:
	setx	0x3b0114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe2ca0dc  ! 3234: ANDN_I	andn 	%r18, 0x00dc, %r31
	.word 0xf8742025  ! 3236: STX_I	stx	%r28, [%r16 + 0x0025]
	.word 0xf6a42183  ! 3237: STWA_I	stwa	%r27, [%r16 + 0x0183] %asi
T3_asi_reg_wr_142:
	mov	0x19, %r14
	.word 0xfcf38e40  ! 3238: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_241:
	setx	0x3a0314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0754000  ! 3240: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xfead2144  ! 3244: STBA_I	stba	%r31, [%r20 + 0x0144] %asi
	.word 0xf42da10c  ! 3245: STB_I	stb	%r26, [%r22 + 0x010c]
iob_intr_3_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_283), 16, 16)) -> intp(3, 0, 2e)
	.word 0xfaa420a7  ! 3247: STWA_I	stwa	%r29, [%r16 + 0x00a7] %asi
	.word 0xf0a5c020  ! 3248: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
T3_asi_reg_rd_141:
	mov	0x0, %r14
	.word 0xf6db8e40  ! 3249: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_TO_TL1
cpu_intr_3_242:
	setx	0x3a003a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_243:
	setx	0x3a0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982dc2  ! 3256: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc2, %hpstate
T3_asi_reg_rd_142:
	mov	0x7, %r14
	.word 0xf6db8400  ! 3257: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_3_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_284), 16, 16)) -> intp(3, 0, 20)
	.word 0xba854000  ! 3262: ADDcc_R	addcc 	%r21, %r0, %r29
	.word 0xf2258000  ! 3266: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xb4b40000  ! 3267: SUBCcc_R	orncc 	%r16, %r0, %r26
	.word 0xf0ade125  ! 3268: STBA_I	stba	%r24, [%r23 + 0x0125] %asi
T3_asi_reg_rd_143:
	mov	0x26, %r14
	.word 0xf4db8e40  ! 3269: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_285), 16, 16)) -> intp(3, 0, 21)
cpu_intr_3_244:
	setx	0x38022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf435e1a1  ! 3279: STH_I	sth	%r26, [%r23 + 0x01a1]
	ta	T_CHANGE_HPRIV
iob_intr_3_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_286), 16, 16)) -> intp(3, 0, 33)
	.word 0xf62d8000  ! 3288: STB_R	stb	%r27, [%r22 + %r0]
cpu_intr_3_245:
	setx	0x380002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8150000  ! 3292: OR_R	or 	%r20, %r0, %r28
iob_intr_3_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_287), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf4a5c020  ! 3296: STWA_R	stwa	%r26, [%r23 + %r0] 0x01
	.word 0xfaa50020  ! 3299: STWA_R	stwa	%r29, [%r20 + %r0] 0x01
T3_asi_reg_rd_144:
	mov	0x3c2, %r14
	.word 0xfcdb8e60  ! 3302: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_3_246:
	setx	0x380030, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_143:
	mov	0x31, %r14
	.word 0xf2f389e0  ! 3306: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_3_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_288), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_289), 16, 16)) -> intp(3, 0, 10)
T3_asi_reg_rd_145:
	mov	0x7, %r14
	.word 0xfadb8e80  ! 3309: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb02da11d  ! 3311: ANDN_I	andn 	%r22, 0x011d, %r24
	.word 0xbab4204f  ! 3315: ORNcc_I	orncc 	%r16, 0x004f, %r29
iob_intr_3_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_290), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_wr_144:
	mov	0xb, %r14
	.word 0xfcf38e60  ! 3319: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T3_asi_reg_wr_145:
	mov	0x3c5, %r14
	.word 0xfcf38400  ! 3321: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T3_asi_reg_wr_146:
	mov	0xa, %r14
	.word 0xf8f38e40  ! 3326: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbb518000  ! 3327: RDPR_PSTATE	rdpr	%pstate, %r29
iob_intr_3_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_291), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf22c2018  ! 3332: STB_I	stb	%r25, [%r16 + 0x0018]
iob_intr_3_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_292), 16, 16)) -> intp(3, 0, b)
iob_intr_3_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_293), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_247:
	setx	0x3b0220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcac0020  ! 3338: STBA_R	stba	%r30, [%r16 + %r0] 0x01
	.word 0xfab4c020  ! 3339: STHA_R	stha	%r29, [%r19 + %r0] 0x01
T3_asi_reg_wr_147:
	mov	0x28, %r14
	.word 0xfef38e80  ! 3342: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
iob_intr_3_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_294), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_248:
	setx	0x3a0207, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_146:
	mov	0x3c2, %r14
	.word 0xfedb84a0  ! 3345: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb2b4607d  ! 3346: SUBCcc_I	orncc 	%r17, 0x007d, %r25
	.word 0xb69d20e9  ! 3347: XORcc_I	xorcc 	%r20, 0x00e9, %r27
cpu_intr_3_249:
	setx	0x38000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_295), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_wr_148:
	mov	0x31, %r14
	.word 0xf0f38e80  ! 3354: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
iob_intr_3_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_296), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf625e1ad  ! 3358: STW_I	stw	%r27, [%r23 + 0x01ad]
	.word 0xb8148000  ! 3360: OR_R	or 	%r18, %r0, %r28
iob_intr_3_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_297), 16, 16)) -> intp(3, 0, 1e)
iob_intr_3_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_298), 16, 16)) -> intp(3, 0, 2)
	ta	T_CHANGE_HPRIV
	.word 0xfc750000  ! 3367: STX_R	stx	%r30, [%r20 + %r0]
	.word 0xfc24e13b  ! 3368: STW_I	stw	%r30, [%r19 + 0x013b]
T3_asi_reg_wr_149:
	mov	0x1d, %r14
	.word 0xf4f38e60  ! 3369: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xfcb5c020  ! 3370: STHA_R	stha	%r30, [%r23 + %r0] 0x01
iob_intr_3_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_299), 16, 16)) -> intp(3, 0, 6)
	.word 0xfa35c000  ! 3374: STH_R	sth	%r29, [%r23 + %r0]
cpu_intr_3_250:
	setx	0x3b020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_300), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_251:
	setx	0x3b0108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d4000  ! 3379: STB_R	stb	%r29, [%r21 + %r0]
	.word 0xf2a561c3  ! 3381: STWA_I	stwa	%r25, [%r21 + 0x01c3] %asi
	.word 0xf825a05c  ! 3383: STW_I	stw	%r28, [%r22 + 0x005c]
iob_intr_3_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_301), 16, 16)) -> intp(3, 0, f)
	.word 0xfe75214b  ! 3385: STX_I	stx	%r31, [%r20 + 0x014b]
	.word 0xf8b40020  ! 3387: STHA_R	stha	%r28, [%r16 + %r0] 0x01
	.word 0xf6ac0020  ! 3389: STBA_R	stba	%r27, [%r16 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xfe340000  ! 3394: STH_R	sth	%r31, [%r16 + %r0]
cpu_intr_3_252:
	setx	0x3b0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb33c4000  ! 3398: SRA_R	sra 	%r17, %r0, %r25
iob_intr_3_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_302), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_303), 16, 16)) -> intp(3, 0, 31)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_304), 16, 16)) -> intp(3, 0, 1b)
iob_intr_3_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_305), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_wr_150:
	mov	0x33, %r14
	.word 0xf0f389e0  ! 3406: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_3_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_306), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_rd_147:
	mov	0x34, %r14
	.word 0xfedb8400  ! 3409: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xfa35e17c  ! 3410: STH_I	sth	%r29, [%r23 + 0x017c]
	.word 0xfc758000  ! 3411: STX_R	stx	%r30, [%r22 + %r0]
T3_asi_reg_rd_148:
	mov	0x3c0, %r14
	.word 0xf4db8e40  ! 3413: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf6a44020  ! 3420: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
iob_intr_3_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_307), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_rd_149:
	mov	0x3c7, %r14
	.word 0xfedb89e0  ! 3424: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_3_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_308), 16, 16)) -> intp(3, 0, 29)
	.word 0xf22ce058  ! 3426: STB_I	stb	%r25, [%r19 + 0x0058]
	.word 0xb2954000  ! 3427: ORcc_R	orcc 	%r21, %r0, %r25
iob_intr_3_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_309), 16, 16)) -> intp(3, 0, 22)
iob_intr_3_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_310), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_311), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_wr_151:
	mov	0xb, %r14
	.word 0xf8f384a0  ! 3437: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_3_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_312), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf825e1dc  ! 3440: STW_I	stw	%r28, [%r23 + 0x01dc]
iob_intr_3_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_313), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_314), 16, 16)) -> intp(3, 0, 11)
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983852  ! 3444: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1852, %hpstate
	.word 0xbaa50000  ! 3445: SUBcc_R	subcc 	%r20, %r0, %r29
cpu_intr_3_253:
	setx	0x3a010a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_254:
	setx	0x3a030c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_255:
	setx	0x38000c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_315), 16, 16)) -> intp(3, 0, 2a)
	.word 0xf22dc000  ! 3453: STB_R	stb	%r25, [%r23 + %r0]
	.word 0xf6254000  ! 3455: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xf8a46180  ! 3459: STWA_I	stwa	%r28, [%r17 + 0x0180] %asi
	.word 0xfcad21e5  ! 3460: STBA_I	stba	%r30, [%r20 + 0x01e5] %asi
iob_intr_3_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_316), 16, 16)) -> intp(3, 0, 10)
T3_asi_reg_rd_150:
	mov	0x11, %r14
	.word 0xfcdb8e60  ! 3466: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf2346194  ! 3467: STH_I	sth	%r25, [%r17 + 0x0194]
	.word 0xb425a0bd  ! 3475: SUB_I	sub 	%r22, 0x00bd, %r26
cpu_intr_3_256:
	setx	0x3a0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba35e1e4  ! 3478: ORN_I	orn 	%r23, 0x01e4, %r29
	.word 0xf8b54020  ! 3479: STHA_R	stha	%r28, [%r21 + %r0] 0x01
	.word 0xf2f52050  ! 3482: STXA_I	stxa	%r25, [%r20 + 0x0050] %asi
T3_asi_reg_rd_151:
	mov	0x3c1, %r14
	.word 0xf2db8e40  ! 3484: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf8758000  ! 3486: STX_R	stx	%r28, [%r22 + %r0]
	.word 0xb88da017  ! 3488: ANDcc_I	andcc 	%r22, 0x0017, %r28
	.word 0x919460d8  ! 3490: WRPR_PIL_I	wrpr	%r17, 0x00d8, %pil
	.word 0xf835c000  ! 3492: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xf6a54020  ! 3494: STWA_R	stwa	%r27, [%r21 + %r0] 0x01
	.word 0xf634a1c5  ! 3496: STH_I	sth	%r27, [%r18 + 0x01c5]
cpu_intr_3_257:
	setx	0x38031c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_152:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 3501: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_258:
	setx	0x380323, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_152:
	mov	0x2f, %r14
	.word 0xf2f384a0  ! 3503: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbaa50000  ! 3505: SUBcc_R	subcc 	%r20, %r0, %r29
	.word 0x8595a0bf  ! 3506: WRPR_TSTATE_I	wrpr	%r22, 0x00bf, %tstate
	.word 0xbea5c000  ! 3509: SUBcc_R	subcc 	%r23, %r0, %r31
	.word 0xb43ce1d6  ! 3513: XNOR_I	xnor 	%r19, 0x01d6, %r26
T3_asi_reg_wr_153:
	mov	0x2e, %r14
	.word 0xf4f38e80  ! 3515: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_3_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_317), 16, 16)) -> intp(3, 0, 16)
	.word 0xfa3561dc  ! 3518: STH_I	sth	%r29, [%r21 + 0x01dc]
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_154:
	mov	0x16, %r14
	.word 0xf0f38400  ! 3525: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_3_259:
	setx	0x3b011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb56139  ! 3528: STHA_I	stha	%r30, [%r21 + 0x0139] %asi
	.word 0xfab42011  ! 3529: STHA_I	stha	%r29, [%r16 + 0x0011] %asi
iob_intr_3_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_318), 16, 16)) -> intp(3, 0, 23)
	.word 0xf4f5e01e  ! 3533: STXA_I	stxa	%r26, [%r23 + 0x001e] %asi
T3_asi_reg_rd_153:
	mov	0x15, %r14
	.word 0xfadb8e40  ! 3534: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_wr_155:
	mov	0x3c6, %r14
	.word 0xfef38400  ! 3537: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xfc24c000  ! 3538: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xf2ac6096  ! 3542: STBA_I	stba	%r25, [%r17 + 0x0096] %asi
iob_intr_3_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_319), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_wr_156:
	mov	0x2a, %r14
	.word 0xf0f38400  ! 3545: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xfa754000  ! 3547: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xfaad8020  ! 3548: STBA_R	stba	%r29, [%r22 + %r0] 0x01
iob_intr_3_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_320), 16, 16)) -> intp(3, 0, 22)
iob_intr_3_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_321), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_322), 16, 16)) -> intp(3, 0, a)
	.word 0xf02460a0  ! 3552: STW_I	stw	%r24, [%r17 + 0x00a0]
	.word 0xf0b54020  ! 3553: STHA_R	stha	%r24, [%r21 + %r0] 0x01
cpu_intr_3_260:
	setx	0x3a0007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeac2143  ! 3556: STBA_I	stba	%r31, [%r16 + 0x0143] %asi
iob_intr_3_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_323), 16, 16)) -> intp(3, 0, e)
cpu_intr_3_261:
	setx	0x380021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe750000  ! 3560: STX_R	stx	%r31, [%r20 + %r0]
cpu_intr_3_262:
	setx	0x390037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbac5c000  ! 3563: ADDCcc_R	addccc 	%r23, %r0, %r29
cpu_intr_3_263:
	setx	0x3a0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcf52183  ! 3568: STXA_I	stxa	%r30, [%r20 + 0x0183] %asi
	ta	T_CHANGE_TO_TL1
cpu_intr_3_264:
	setx	0x380005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6a54000  ! 3572: SUBcc_R	subcc 	%r21, %r0, %r27
T3_asi_reg_rd_154:
	mov	0x15, %r14
	.word 0xfadb8e80  ! 3574: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_3_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_324), 16, 16)) -> intp(3, 0, b)
	.word 0xf8ad4020  ! 3579: STBA_R	stba	%r28, [%r21 + %r0] 0x01
cpu_intr_3_265:
	setx	0x380108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2258000  ! 3582: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xf0ac4020  ! 3585: STBA_R	stba	%r24, [%r17 + %r0] 0x01
T3_asi_reg_wr_157:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 3587: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb49c4000  ! 3588: XORcc_R	xorcc 	%r17, %r0, %r26
	.word 0xfe744000  ! 3590: STX_R	stx	%r31, [%r17 + %r0]
T3_asi_reg_rd_155:
	mov	0x18, %r14
	.word 0xfadb8e80  ! 3593: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_3_266:
	setx	0x3a011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb63cc000  ! 3597: XNOR_R	xnor 	%r19, %r0, %r27
	.word 0xfaa44020  ! 3599: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
	.word 0xfeb56107  ! 3600: STHA_I	stha	%r31, [%r21 + 0x0107] %asi
	.word 0xf8ac8020  ! 3601: STBA_R	stba	%r28, [%r18 + %r0] 0x01
	.word 0xbf7cc400  ! 3602: MOVR_R	movre	%r19, %r0, %r31
	.word 0xf225c000  ! 3605: STW_R	stw	%r25, [%r23 + %r0]
cpu_intr_3_267:
	setx	0x38001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf475a1fd  ! 3609: STX_I	stx	%r26, [%r22 + 0x01fd]
	.word 0xb5480000  ! 3611: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb0942002  ! 3612: ORcc_I	orcc 	%r16, 0x0002, %r24
iob_intr_3_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_325), 16, 16)) -> intp(3, 0, 10)
	.word 0xf4ad8020  ! 3615: STBA_R	stba	%r26, [%r22 + %r0] 0x01
	.word 0xf424e005  ! 3617: STW_I	stw	%r26, [%r19 + 0x0005]
	ta	T_CHANGE_TO_TL0
	.word 0xf62ce19a  ! 3620: STB_I	stb	%r27, [%r19 + 0x019a]
cpu_intr_3_268:
	setx	0x3b0325, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_156:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 3623: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_wr_158:
	mov	0xe, %r14
	.word 0xf6f38400  ! 3624: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xfab44020  ! 3626: STHA_R	stha	%r29, [%r17 + %r0] 0x01
cpu_intr_3_269:
	setx	0x390314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_270:
	setx	0x3b0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5641800  ! 3632: MOVcc_R	<illegal instruction>
iob_intr_3_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_326), 16, 16)) -> intp(3, 0, 30)
	.word 0xf4344000  ! 3639: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xf0b48020  ! 3640: STHA_R	stha	%r24, [%r18 + %r0] 0x01
iob_intr_3_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_327), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf0ad2131  ! 3644: STBA_I	stba	%r24, [%r20 + 0x0131] %asi
T3_asi_reg_rd_157:
	mov	0x28, %r14
	.word 0xf0db8e60  ! 3645: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb3508000  ! 3646: RDPR_TSTATE	rdpr	%tstate, %r25
cpu_intr_3_271:
	setx	0x380117, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_158:
	mov	0x29, %r14
	.word 0xfcdb84a0  ! 3650: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_3_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_328), 16, 16)) -> intp(3, 0, 1d)
iob_intr_3_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_329), 16, 16)) -> intp(3, 0, 24)
	.word 0xb6940000  ! 3653: ORcc_R	orcc 	%r16, %r0, %r27
	.word 0xfc344000  ! 3657: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xf6a5e042  ! 3658: STWA_I	stwa	%r27, [%r23 + 0x0042] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xb40c0000  ! 3660: AND_R	and 	%r16, %r0, %r26
iob_intr_3_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_330), 16, 16)) -> intp(3, 0, 27)
	.word 0xfc2c0000  ! 3665: STB_R	stb	%r30, [%r16 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xfc35c000  ! 3672: STH_R	sth	%r30, [%r23 + %r0]
cpu_intr_3_272:
	setx	0x3f0033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_331), 16, 16)) -> intp(3, 0, 33)
	.word 0xfeac0020  ! 3677: STBA_R	stba	%r31, [%r16 + %r0] 0x01
cpu_intr_3_273:
	setx	0x3d033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_159:
	mov	0x23, %r14
	.word 0xf8db89e0  ! 3683: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xfcf521ec  ! 3684: STXA_I	stxa	%r30, [%r20 + 0x01ec] %asi
cpu_intr_3_274:
	setx	0x3e0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f4a0af  ! 3688: STXA_I	stxa	%r28, [%r18 + 0x00af] %asi
cpu_intr_3_275:
	setx	0x3c012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf875204f  ! 3694: STX_I	stx	%r28, [%r20 + 0x004f]
T3_asi_reg_rd_160:
	mov	0x18, %r14
	.word 0xf2db8e40  ! 3695: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_rd_161:
	mov	0x3c5, %r14
	.word 0xf6db8400  ! 3698: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_3_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_332), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_276:
	setx	0x3d0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa24e0ce  ! 3708: STW_I	stw	%r29, [%r19 + 0x00ce]
	.word 0xfc250000  ! 3710: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xf424c000  ! 3711: STW_R	stw	%r26, [%r19 + %r0]
	.word 0xf2b58020  ! 3712: STHA_R	stha	%r25, [%r22 + %r0] 0x01
T3_asi_reg_wr_159:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 3721: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_3_277:
	setx	0x3f010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_160:
	mov	0x8, %r14
	.word 0xfaf38e60  ! 3725: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfaa5600e  ! 3729: STWA_I	stwa	%r29, [%r21 + 0x000e] %asi
	.word 0xf834e066  ! 3730: STH_I	sth	%r28, [%r19 + 0x0066]
T3_asi_reg_wr_161:
	mov	0x9, %r14
	.word 0xf6f38e60  ! 3732: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf6254000  ! 3733: STW_R	stw	%r27, [%r21 + %r0]
cpu_intr_3_278:
	setx	0x3d023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfcb5e05d  ! 3737: STHA_I	stha	%r30, [%r23 + 0x005d] %asi
	.word 0xbf518000  ! 3738: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xfa2c8000  ! 3740: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xb28c616a  ! 3741: ANDcc_I	andcc 	%r17, 0x016a, %r25
cpu_intr_3_279:
	setx	0x3f033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc3521e3  ! 3745: STH_I	sth	%r30, [%r20 + 0x01e3]
	.word 0xf025a074  ! 3746: STW_I	stw	%r24, [%r22 + 0x0074]
	.word 0xfc2da03a  ! 3747: STB_I	stb	%r30, [%r22 + 0x003a]
	.word 0xba3ca173  ! 3748: XNOR_I	xnor 	%r18, 0x0173, %r29
T3_asi_reg_rd_162:
	mov	0x35, %r14
	.word 0xf8db8e40  ! 3749: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_333), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_280:
	setx	0x3f0023, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_281:
	setx	0x3c0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a52131  ! 3758: STWA_I	stwa	%r27, [%r20 + 0x0131] %asi
	.word 0xf6f4e1c6  ! 3760: STXA_I	stxa	%r27, [%r19 + 0x01c6] %asi
cpu_intr_3_282:
	setx	0x3f002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_163:
	mov	0x6, %r14
	.word 0xf8db8e40  ! 3763: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_3_283:
	setx	0x3e0330, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_334), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_284:
	setx	0x3c0220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82d0000  ! 3768: STB_R	stb	%r28, [%r20 + %r0]
iob_intr_3_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_335), 16, 16)) -> intp(3, 0, 13)
T3_asi_reg_wr_162:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 3773: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_285:
	setx	0x3e0026, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_164:
	mov	0x3c1, %r14
	.word 0xfcdb8e60  ! 3777: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf8f460c0  ! 3778: STXA_I	stxa	%r28, [%r17 + 0x00c0] %asi
	.word 0xb53d1000  ! 3781: SRAX_R	srax	%r20, %r0, %r26
	.word 0xf2f5a171  ! 3782: STXA_I	stxa	%r25, [%r22 + 0x0171] %asi
cpu_intr_3_286:
	setx	0x3d023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983a90  ! 3785: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a90, %hpstate
	.word 0xb0c5c000  ! 3786: ADDCcc_R	addccc 	%r23, %r0, %r24
	.word 0xfaa58020  ! 3787: STWA_R	stwa	%r29, [%r22 + %r0] 0x01
	.word 0xfaa4e044  ! 3793: STWA_I	stwa	%r29, [%r19 + 0x0044] %asi
iob_intr_3_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_336), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_287:
	setx	0x3d003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_337), 16, 16)) -> intp(3, 0, 4)
	.word 0xb004e0c5  ! 3798: ADD_I	add 	%r19, 0x00c5, %r24
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983a52  ! 3800: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a52, %hpstate
iob_intr_3_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_338), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_wr_163:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 3805: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf2a50020  ! 3806: STWA_R	stwa	%r25, [%r20 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
iob_intr_3_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_339), 16, 16)) -> intp(3, 0, 14)
	.word 0xf034a179  ! 3817: STH_I	sth	%r24, [%r18 + 0x0179]
	.word 0xf274a02d  ! 3818: STX_I	stx	%r25, [%r18 + 0x002d]
iob_intr_3_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_340), 16, 16)) -> intp(3, 0, 3f)
iob_intr_3_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_341), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_342), 16, 16)) -> intp(3, 0, e)
	.word 0xb92cd000  ! 3823: SLLX_R	sllx	%r19, %r0, %r28
T3_asi_reg_rd_165:
	mov	0x3c5, %r14
	.word 0xf4db84a0  ! 3825: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbf2cf001  ! 3828: SLLX_I	sllx	%r19, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf42de088  ! 3830: STB_I	stb	%r26, [%r23 + 0x0088]
	.word 0xfea58020  ! 3832: STWA_R	stwa	%r31, [%r22 + %r0] 0x01
	.word 0xf4a54020  ! 3837: STWA_R	stwa	%r26, [%r21 + %r0] 0x01
iob_intr_3_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_343), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_rd_166:
	mov	0x1e, %r14
	.word 0xfedb8e80  ! 3839: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf82560ea  ! 3840: STW_I	stw	%r28, [%r21 + 0x00ea]
	.word 0xba3c8000  ! 3841: XNOR_R	xnor 	%r18, %r0, %r29
T3_asi_reg_rd_167:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 3842: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_3_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_344), 16, 16)) -> intp(3, 0, 37)
cpu_intr_3_288:
	setx	0x3d0216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_345), 16, 16)) -> intp(3, 0, 18)
	ta	T_CHANGE_HPRIV
	.word 0xfa34e120  ! 3850: STH_I	sth	%r29, [%r19 + 0x0120]
T3_asi_reg_wr_164:
	mov	0x18, %r14
	.word 0xfaf384a0  ! 3855: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf4340000  ! 3857: STH_R	sth	%r26, [%r16 + %r0]
cpu_intr_3_289:
	setx	0x3f0129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4f5a1f7  ! 3859: STXA_I	stxa	%r26, [%r22 + 0x01f7] %asi
	.word 0xf62c0000  ! 3864: STB_R	stb	%r27, [%r16 + %r0]
T3_asi_reg_rd_168:
	mov	0x28, %r14
	.word 0xf8db8e40  ! 3865: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_rd_169:
	mov	0x2, %r14
	.word 0xfadb8400  ! 3869: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfc752084  ! 3870: STX_I	stx	%r30, [%r20 + 0x0084]
cpu_intr_3_290:
	setx	0x3f0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe75e1ac  ! 3873: STX_I	stx	%r31, [%r23 + 0x01ac]
	.word 0xfab461d6  ! 3874: STHA_I	stha	%r29, [%r17 + 0x01d6] %asi
iob_intr_3_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_346), 16, 16)) -> intp(3, 0, f)
	.word 0xb0840000  ! 3883: ADDcc_R	addcc 	%r16, %r0, %r24
iob_intr_3_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_347), 16, 16)) -> intp(3, 0, 3e)
T3_asi_reg_wr_165:
	mov	0x3c5, %r14
	.word 0xfaf38400  ! 3887: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbc44207f  ! 3888: ADDC_I	addc 	%r16, 0x007f, %r30
T3_asi_reg_wr_166:
	mov	0x0, %r14
	.word 0xf2f38e80  ! 3895: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_3_291:
	setx	0x3c0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ade022  ! 3899: STBA_I	stba	%r25, [%r23 + 0x0022] %asi
	.word 0xf0a4c020  ! 3900: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_167:
	mov	0x3c2, %r14
	.word 0xf2f38400  ! 3906: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T3_asi_reg_rd_170:
	mov	0x2a, %r14
	.word 0xf6db8e40  ! 3907: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T3_asi_reg_rd_171:
	mov	0x3c0, %r14
	.word 0xfedb8400  ! 3910: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T3_asi_reg_rd_172:
	mov	0x11, %r14
	.word 0xfadb84a0  ! 3912: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbb35b001  ! 3913: SRLX_I	srlx	%r22, 0x0001, %r29
cpu_intr_3_292:
	setx	0x3e0323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_293:
	setx	0x3c0101, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_168:
	mov	0x8, %r14
	.word 0xf4f38e60  ! 3917: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb2b461ef  ! 3919: ORNcc_I	orncc 	%r17, 0x01ef, %r25
T3_asi_reg_wr_169:
	mov	0x16, %r14
	.word 0xf8f38400  ! 3920: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T3_asi_reg_rd_173:
	mov	0x1a, %r14
	.word 0xf8db8e40  ! 3923: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_rd_174:
	mov	0x34, %r14
	.word 0xf2db8e40  ! 3924: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_348), 16, 16)) -> intp(3, 0, e)
	.word 0xf8754000  ! 3930: STX_R	stx	%r28, [%r21 + %r0]
cpu_intr_3_294:
	setx	0x3d000d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_349), 16, 16)) -> intp(3, 0, 1a)
T3_asi_reg_rd_175:
	mov	0x8, %r14
	.word 0xf0db89e0  ! 3935: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf4ace1da  ! 3936: STBA_I	stba	%r26, [%r19 + 0x01da] %asi
	.word 0xf8aca1aa  ! 3938: STBA_I	stba	%r28, [%r18 + 0x01aa] %asi
T3_asi_reg_rd_176:
	mov	0x28, %r14
	.word 0xf8db8400  ! 3940: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb80c0000  ! 3943: AND_R	and 	%r16, %r0, %r28
iob_intr_3_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_350), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_351), 16, 16)) -> intp(3, 0, 7)
T3_asi_reg_wr_170:
	mov	0x1f, %r14
	.word 0xfef38e40  ! 3952: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf0b561a5  ! 3954: STHA_I	stha	%r24, [%r21 + 0x01a5] %asi
	.word 0xfe25208e  ! 3956: STW_I	stw	%r31, [%r20 + 0x008e]
	.word 0xfa354000  ! 3958: STH_R	sth	%r29, [%r21 + %r0]
	.word 0xb2158000  ! 3961: OR_R	or 	%r22, %r0, %r25
	.word 0xf8a58020  ! 3964: STWA_R	stwa	%r28, [%r22 + %r0] 0x01
cpu_intr_3_295:
	setx	0x3d0113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_352), 16, 16)) -> intp(3, 0, 36)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb094c000  ! 3973: ORcc_R	orcc 	%r19, %r0, %r24
	.word 0x8d94601d  ! 3974: WRPR_PSTATE_I	wrpr	%r17, 0x001d, %pstate
iob_intr_3_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_353), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_296:
	setx	0x3d0301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_297:
	setx	0x3f0026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_298:
	setx	0x3e000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf27521ce  ! 3984: STX_I	stx	%r25, [%r20 + 0x01ce]
	.word 0xb2bce073  ! 3990: XNORcc_I	xnorcc 	%r19, 0x0073, %r25
	.word 0xbe1460cc  ! 3994: OR_I	or 	%r17, 0x00cc, %r31
T3_asi_reg_rd_177:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 3999: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_354), 16, 16)) -> intp(3, 0, 31)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_178:
	mov	0x3c0, %r14
	.word 0xfadb8e40  ! 4004: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_299:
	setx	0x3c031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_171:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 4008: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_3_300:
	setx	0x3d0222, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_172:
	mov	0x37, %r14
	.word 0xf8f389e0  ! 4014: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf0a54020  ! 4015: STWA_R	stwa	%r24, [%r21 + %r0] 0x01
iob_intr_3_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_355), 16, 16)) -> intp(3, 0, 29)
cpu_intr_3_301:
	setx	0x3d0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b421c6  ! 4021: ORNcc_I	orncc 	%r16, 0x01c6, %r27
T3_asi_reg_wr_173:
	mov	0xd, %r14
	.word 0xfef38e60  ! 4022: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_302:
	setx	0x3e012d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_174:
	mov	0x29, %r14
	.word 0xf0f38e60  ! 4029: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T3_asi_reg_rd_179:
	mov	0x26, %r14
	.word 0xf2db8400  ! 4030: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T3_asi_reg_wr_175:
	mov	0x21, %r14
	.word 0xfaf38e80  ! 4033: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb045c000  ! 4034: ADDC_R	addc 	%r23, %r0, %r24
	.word 0xfaad0020  ! 4038: STBA_R	stba	%r29, [%r20 + %r0] 0x01
T3_asi_reg_wr_176:
	mov	0x24, %r14
	.word 0xf4f38400  ! 4039: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_3_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_356), 16, 16)) -> intp(3, 0, 38)
	.word 0xbcbd6015  ! 4041: XNORcc_I	xnorcc 	%r21, 0x0015, %r30
T3_asi_reg_wr_177:
	mov	0x3c6, %r14
	.word 0xfaf384a0  ! 4042: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xfc2c0000  ! 4043: STB_R	stb	%r30, [%r16 + %r0]
	.word 0xfa2ca161  ! 4044: STB_I	stb	%r29, [%r18 + 0x0161]
	.word 0xf675c000  ! 4045: STX_R	stx	%r27, [%r23 + %r0]
T3_asi_reg_wr_178:
	mov	0x37, %r14
	.word 0xf8f38e80  ! 4050: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf6ade14e  ! 4052: STBA_I	stba	%r27, [%r23 + 0x014e] %asi
	.word 0xf4b46192  ! 4053: STHA_I	stha	%r26, [%r17 + 0x0192] %asi
iob_intr_3_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_357), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_rd_180:
	mov	0x3c0, %r14
	.word 0xfadb8400  ! 4055: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_3_303:
	setx	0x3d0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf875c000  ! 4059: STX_R	stx	%r28, [%r23 + %r0]
cpu_intr_3_304:
	setx	0x3e0006, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_358), 16, 16)) -> intp(3, 0, 2b)
	.word 0xbb355000  ! 4063: SRLX_R	srlx	%r21, %r0, %r29
T3_asi_reg_rd_181:
	mov	0x30, %r14
	.word 0xf2db84a0  ! 4065: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T3_asi_reg_rd_182:
	mov	0x12, %r14
	.word 0xfcdb8e40  ! 4066: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb0356012  ! 4067: ORN_I	orn 	%r21, 0x0012, %r24
	.word 0xf4ac20f6  ! 4070: STBA_I	stba	%r26, [%r16 + 0x00f6] %asi
	ta	T_CHANGE_HPRIV
	.word 0xfeadc020  ! 4074: STBA_R	stba	%r31, [%r23 + %r0] 0x01
iob_intr_3_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_359), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_305:
	setx	0x3e022d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_360), 16, 16)) -> intp(3, 0, 5)
	.word 0xfc746051  ! 4083: STX_I	stx	%r30, [%r17 + 0x0051]
	.word 0xf22d21bf  ! 4085: STB_I	stb	%r25, [%r20 + 0x01bf]
iob_intr_3_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_361), 16, 16)) -> intp(3, 0, 15)
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982852  ! 4088: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0852, %hpstate
	.word 0xb52df001  ! 4089: SLLX_I	sllx	%r23, 0x0001, %r26
iob_intr_3_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_362), 16, 16)) -> intp(3, 0, 9)
iob_intr_3_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_363), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf075e1e1  ! 4094: STX_I	stx	%r24, [%r23 + 0x01e1]
iob_intr_3_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_364), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_365), 16, 16)) -> intp(3, 0, 27)
	ta	T_CHANGE_HPRIV
	.word 0xfa2c4000  ! 4098: STB_R	stb	%r29, [%r17 + %r0]
	.word 0xb5480000  ! 4099: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf2ad8020  ! 4101: STBA_R	stba	%r25, [%r22 + %r0] 0x01
	.word 0xfc740000  ! 4102: STX_R	stx	%r30, [%r16 + %r0]
	.word 0xf4240000  ! 4107: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xfeb4c020  ! 4109: STHA_R	stha	%r31, [%r19 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe240000  ! 4113: STW_R	stw	%r31, [%r16 + %r0]
cpu_intr_3_306:
	setx	0x430201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc756057  ! 4118: STX_I	stx	%r30, [%r21 + 0x0057]
	.word 0xfeac6060  ! 4120: STBA_I	stba	%r31, [%r17 + 0x0060] %asi
T3_asi_reg_rd_183:
	mov	0x3c5, %r14
	.word 0xf6db8e80  ! 4122: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb02d0000  ! 4123: ANDN_R	andn 	%r20, %r0, %r24
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_184:
	mov	0x28, %r14
	.word 0xfcdb8400  ! 4127: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf0ac4020  ! 4128: STBA_R	stba	%r24, [%r17 + %r0] 0x01
T3_asi_reg_rd_185:
	mov	0x5, %r14
	.word 0xf4db8e40  ! 4131: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfc2da10e  ! 4132: STB_I	stb	%r30, [%r22 + 0x010e]
	.word 0xfa2c0000  ! 4135: STB_R	stb	%r29, [%r16 + %r0]
T3_asi_reg_rd_186:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 4136: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xba0d8000  ! 4137: AND_R	and 	%r22, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_366), 16, 16)) -> intp(3, 0, c)
T3_asi_reg_wr_179:
	mov	0x3c0, %r14
	.word 0xfcf38400  ! 4142: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983d8a  ! 4143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d8a, %hpstate
	.word 0xfa754000  ! 4144: STX_R	stx	%r29, [%r21 + %r0]
cpu_intr_3_307:
	setx	0x42023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_187:
	mov	0x3c5, %r14
	.word 0xfcdb8400  ! 4147: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf8a50020  ! 4150: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
cpu_intr_3_308:
	setx	0x420309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ade0aa  ! 4156: STBA_I	stba	%r26, [%r23 + 0x00aa] %asi
	.word 0xfe250000  ! 4158: STW_R	stw	%r31, [%r20 + %r0]
	ta	T_CHANGE_NONHPRIV
	.word 0xfc7420b4  ! 4160: STX_I	stx	%r30, [%r16 + 0x00b4]
	.word 0xf03421a2  ! 4161: STH_I	sth	%r24, [%r16 + 0x01a2]
T3_asi_reg_wr_180:
	mov	0x1b, %r14
	.word 0xf8f384a0  ! 4162: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T3_asi_reg_wr_181:
	mov	0x17, %r14
	.word 0xf0f38400  ! 4163: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf425e123  ! 4164: STW_I	stw	%r26, [%r23 + 0x0123]
iob_intr_3_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_367), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_rd_188:
	mov	0x9, %r14
	.word 0xf2db84a0  ! 4170: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T3_asi_reg_rd_189:
	mov	0x3c3, %r14
	.word 0xf8db84a0  ! 4171: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_3_309:
	setx	0x410328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_310:
	setx	0x410211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x919520e8  ! 4181: WRPR_PIL_I	wrpr	%r20, 0x00e8, %pil
iob_intr_3_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_368), 16, 16)) -> intp(3, 0, 3a)
	.word 0xbb352001  ! 4188: SRL_I	srl 	%r20, 0x0001, %r29
iob_intr_3_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_369), 16, 16)) -> intp(3, 0, b)
	.word 0xb3641800  ! 4195: MOVcc_R	<illegal instruction>
T3_asi_reg_wr_182:
	mov	0x38, %r14
	.word 0xfaf389e0  ! 4196: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb62de135  ! 4198: ANDN_I	andn 	%r23, 0x0135, %r27
T3_asi_reg_rd_190:
	mov	0x11, %r14
	.word 0xfadb8e40  ! 4199: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_wr_183:
	mov	0x3c7, %r14
	.word 0xf8f38e60  ! 4201: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_3_311:
	setx	0x41030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc75e128  ! 4208: STX_I	stx	%r30, [%r23 + 0x0128]
	.word 0xf0ad60ac  ! 4210: STBA_I	stba	%r24, [%r21 + 0x00ac] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5358000  ! 4215: SRL_R	srl 	%r22, %r0, %r26
T3_asi_reg_wr_184:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 4216: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_wr_185:
	mov	0x14, %r14
	.word 0xfaf38400  ! 4217: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_3_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_370), 16, 16)) -> intp(3, 0, b)
	.word 0xf0344000  ! 4220: STH_R	sth	%r24, [%r17 + %r0]
T3_asi_reg_wr_186:
	mov	0x37, %r14
	.word 0xfef38e80  ! 4221: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T3_asi_reg_rd_191:
	mov	0x32, %r14
	.word 0xf2db8e40  ! 4222: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf6344000  ! 4226: STH_R	sth	%r27, [%r17 + %r0]
iob_intr_3_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_371), 16, 16)) -> intp(3, 0, 14)
iob_intr_3_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_372), 16, 16)) -> intp(3, 0, 22)
	.word 0xba8d618b  ! 4237: ANDcc_I	andcc 	%r21, 0x018b, %r29
cpu_intr_3_312:
	setx	0x420221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf634a0d1  ! 4240: STH_I	sth	%r27, [%r18 + 0x00d1]
cpu_intr_3_313:
	setx	0x40011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_187:
	mov	0x3c1, %r14
	.word 0xfaf384a0  ! 4244: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_rd_192:
	mov	0x2f, %r14
	.word 0xf6db89e0  ! 4245: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xfa2de004  ! 4246: STB_I	stb	%r29, [%r23 + 0x0004]
cpu_intr_3_314:
	setx	0x430116, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_188:
	mov	0x3c4, %r14
	.word 0xf8f384a0  ! 4253: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_3_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_373), 16, 16)) -> intp(3, 0, 20)
	.word 0xf62ca037  ! 4260: STB_I	stb	%r27, [%r18 + 0x0037]
cpu_intr_3_315:
	setx	0x42000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0ac8020  ! 4265: STBA_R	stba	%r24, [%r18 + %r0] 0x01
	.word 0xf4b4a1e1  ! 4266: STHA_I	stha	%r26, [%r18 + 0x01e1] %asi
T3_asi_reg_rd_193:
	mov	0x2d, %r14
	.word 0xf0db8e60  ! 4267: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf8b40020  ! 4268: STHA_R	stha	%r28, [%r16 + %r0] 0x01
	.word 0xfcf4e02a  ! 4269: STXA_I	stxa	%r30, [%r19 + 0x002a] %asi
	.word 0xf6b48020  ! 4270: STHA_R	stha	%r27, [%r18 + %r0] 0x01
	.word 0xb0b4202f  ! 4271: ORNcc_I	orncc 	%r16, 0x002f, %r24
T3_asi_reg_wr_189:
	mov	0x2a, %r14
	.word 0xf8f389e0  ! 4273: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T3_asi_reg_wr_190:
	mov	0x3c2, %r14
	.word 0xfef38e40  ! 4274: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf42c20b3  ! 4275: STB_I	stb	%r26, [%r16 + 0x00b3]
T3_asi_reg_rd_194:
	mov	0x31, %r14
	.word 0xf6db8e40  ! 4277: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbd2c5000  ! 4278: SLLX_R	sllx	%r17, %r0, %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xbb7cc400  ! 4283: MOVR_R	movre	%r19, %r0, %r29
iob_intr_3_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_374), 16, 16)) -> intp(3, 0, 32)
	.word 0xbcac2198  ! 4286: ANDNcc_I	andncc 	%r16, 0x0198, %r30
	.word 0xf2f4e166  ! 4287: STXA_I	stxa	%r25, [%r19 + 0x0166] %asi
	.word 0xfaa44020  ! 4288: STWA_R	stwa	%r29, [%r17 + %r0] 0x01
iob_intr_3_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_375), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfcb40020  ! 4290: STHA_R	stha	%r30, [%r16 + %r0] 0x01
iob_intr_3_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_376), 16, 16)) -> intp(3, 0, 22)
iob_intr_3_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_377), 16, 16)) -> intp(3, 0, 39)
	.word 0xfe2d4000  ! 4294: STB_R	stb	%r31, [%r21 + %r0]
cpu_intr_3_316:
	setx	0x43013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_191:
	mov	0x33, %r14
	.word 0xfef38400  ! 4301: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_3_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_378), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_rd_195:
	mov	0x18, %r14
	.word 0xfedb8e80  ! 4303: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf6750000  ! 4304: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xf6356051  ! 4306: STH_I	sth	%r27, [%r21 + 0x0051]
	.word 0xf07460b6  ! 4307: STX_I	stx	%r24, [%r17 + 0x00b6]
T3_asi_reg_wr_192:
	mov	0xc, %r14
	.word 0xf8f38e60  ! 4312: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	setx	data_start_6, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983e8a  ! 4313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e8a, %hpstate
cpu_intr_3_317:
	setx	0x41020a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_318:
	setx	0x41023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8a54000  ! 4320: SUBcc_R	subcc 	%r21, %r0, %r28
cpu_intr_3_319:
	setx	0x410034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b54020  ! 4325: STHA_R	stha	%r25, [%r21 + %r0] 0x01
	.word 0xf8f42000  ! 4326: STXA_I	stxa	%r28, [%r16 + 0x0000] %asi
cpu_intr_3_320:
	setx	0x43033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_379), 16, 16)) -> intp(3, 0, 20)
	.word 0xf4f561dc  ! 4329: STXA_I	stxa	%r26, [%r21 + 0x01dc] %asi
	.word 0xfa248000  ! 4330: STW_R	stw	%r29, [%r18 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xfc2561db  ! 4332: STW_I	stw	%r30, [%r21 + 0x01db]
	.word 0xf635e07b  ! 4335: STH_I	sth	%r27, [%r23 + 0x007b]
	.word 0xfc246160  ! 4337: STW_I	stw	%r30, [%r17 + 0x0160]
	.word 0xf2acc020  ! 4338: STBA_R	stba	%r25, [%r19 + %r0] 0x01
cpu_intr_3_321:
	setx	0x430202, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf6752010  ! 4345: STX_I	stx	%r27, [%r20 + 0x0010]
	.word 0xbf500000  ! 4346: RDPR_TPC	rdpr	%tpc, %r31
cpu_intr_3_322:
	setx	0x410327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfab5e0ed  ! 4351: STHA_I	stha	%r29, [%r23 + 0x00ed] %asi
cpu_intr_3_323:
	setx	0x410320, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfef5215e  ! 4354: STXA_I	stxa	%r31, [%r20 + 0x015e] %asi
	.word 0xfca48020  ! 4356: STWA_R	stwa	%r30, [%r18 + %r0] 0x01
T3_asi_reg_rd_196:
	mov	0x25, %r14
	.word 0xfedb89e0  ! 4357: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T3_asi_reg_wr_193:
	mov	0x5, %r14
	.word 0xfef38e40  ! 4358: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_wr_194:
	mov	0x2, %r14
	.word 0xf4f38e40  ! 4359: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf8a5e027  ! 4360: STWA_I	stwa	%r28, [%r23 + 0x0027] %asi
	.word 0xb1508000  ! 4361: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xf4a5619c  ! 4362: STWA_I	stwa	%r26, [%r21 + 0x019c] %asi
	.word 0xfc35c000  ! 4365: STH_R	sth	%r30, [%r23 + %r0]
cpu_intr_3_324:
	setx	0x400316, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xb8944000  ! 4368: ORcc_R	orcc 	%r17, %r0, %r28
	.word 0xbe84e169  ! 4372: ADDcc_I	addcc 	%r19, 0x0169, %r31
	.word 0xf0b40020  ! 4373: STHA_R	stha	%r24, [%r16 + %r0] 0x01
	.word 0xf8ac4020  ! 4376: STBA_R	stba	%r28, [%r17 + %r0] 0x01
iob_intr_3_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_380), 16, 16)) -> intp(3, 0, 37)
	.word 0xb72d1000  ! 4379: SLLX_R	sllx	%r20, %r0, %r27
iob_intr_3_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_381), 16, 16)) -> intp(3, 0, 1b)
cpu_intr_3_325:
	setx	0x42020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_326:
	setx	0x400229, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfaa40020  ! 4390: STWA_R	stwa	%r29, [%r16 + %r0] 0x01
cpu_intr_3_327:
	setx	0x420201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ada1b3  ! 4392: STBA_I	stba	%r28, [%r22 + 0x01b3] %asi
T3_asi_reg_wr_195:
	mov	0x3c0, %r14
	.word 0xf6f389e0  ! 4393: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T3_asi_reg_rd_197:
	mov	0x18, %r14
	.word 0xfadb8e80  ! 4394: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_3_328:
	setx	0x400201, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
cpu_intr_3_329:
	setx	0x420138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb02da171  ! 4404: ANDN_I	andn 	%r22, 0x0171, %r24
	.word 0xfef460bd  ! 4405: STXA_I	stxa	%r31, [%r17 + 0x00bd] %asi
	.word 0xf6a58020  ! 4408: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
cpu_intr_3_330:
	setx	0x410304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_382), 16, 16)) -> intp(3, 0, e)
	.word 0xf2348000  ! 4414: STH_R	sth	%r25, [%r18 + %r0]
cpu_intr_3_331:
	setx	0x420236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf835a1b9  ! 4418: STH_I	sth	%r28, [%r22 + 0x01b9]
iob_intr_3_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_383), 16, 16)) -> intp(3, 0, 39)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_3_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_384), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf624e0fc  ! 4427: STW_I	stw	%r27, [%r19 + 0x00fc]
	.word 0xfa34e134  ! 4431: STH_I	sth	%r29, [%r19 + 0x0134]
cpu_intr_3_332:
	setx	0x40030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf825e1e4  ! 4434: STW_I	stw	%r28, [%r23 + 0x01e4]
iob_intr_3_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_385), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf82dc000  ! 4436: STB_R	stb	%r28, [%r23 + %r0]
	.word 0xfc34c000  ! 4437: STH_R	sth	%r30, [%r19 + %r0]
cpu_intr_3_333:
	setx	0x400019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcf421ef  ! 4440: STXA_I	stxa	%r30, [%r16 + 0x01ef] %asi
	.word 0xf8b5614a  ! 4441: STHA_I	stha	%r28, [%r21 + 0x014a] %asi
T3_asi_reg_rd_198:
	mov	0xe, %r14
	.word 0xfcdb8e60  ! 4443: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_3_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_386), 16, 16)) -> intp(3, 0, 7)
iob_intr_3_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_387), 16, 16)) -> intp(3, 0, 30)
	.word 0xfef560a5  ! 4457: STXA_I	stxa	%r31, [%r21 + 0x00a5] %asi
cpu_intr_3_334:
	setx	0x43022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_199:
	mov	0x18, %r14
	.word 0xf4db89e0  ! 4463: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf27561fc  ! 4466: STX_I	stx	%r25, [%r21 + 0x01fc]
T3_asi_reg_wr_196:
	mov	0x36, %r14
	.word 0xf2f38400  ! 4469: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_3_335:
	setx	0x400000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_336:
	setx	0x43003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0350000  ! 4475: STH_R	sth	%r24, [%r20 + %r0]
T3_asi_reg_wr_197:
	mov	0x10, %r14
	.word 0xfef38e40  ! 4477: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf27421fe  ! 4478: STX_I	stx	%r25, [%r16 + 0x01fe]
T3_asi_reg_wr_198:
	mov	0x3c0, %r14
	.word 0xf2f38400  ! 4481: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_3_337:
	setx	0x420028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf87420bb  ! 4485: STX_I	stx	%r28, [%r16 + 0x00bb]
cpu_intr_3_338:
	setx	0x410032, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_200:
	mov	0x30, %r14
	.word 0xfcdb8e40  ! 4491: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0x8f902002  ! 4492: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
iob_intr_3_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_388), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_339:
	setx	0x43031e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_340:
	setx	0x41032f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_201:
	mov	0x3c5, %r14
	.word 0xf2db8400  ! 4501: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf4a48020  ! 4502: STWA_R	stwa	%r26, [%r18 + %r0] 0x01
T3_asi_reg_wr_199:
	mov	0x38, %r14
	.word 0xfef389e0  ! 4505: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf22d600b  ! 4506: STB_I	stb	%r25, [%r21 + 0x000b]
iob_intr_3_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_389), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_rd_202:
	mov	0x10, %r14
	.word 0xfedb8400  ! 4510: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T3_asi_reg_wr_200:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 4512: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb094213c  ! 4515: ORcc_I	orcc 	%r16, 0x013c, %r24
T3_asi_reg_rd_203:
	mov	0xc, %r14
	.word 0xf2db8e60  ! 4521: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_201:
	mov	0x3c1, %r14
	.word 0xf8f38e80  ! 4523: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T3_asi_reg_wr_202:
	mov	0x16, %r14
	.word 0xf2f38400  ! 4525: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_3_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_390), 16, 16)) -> intp(3, 0, 26)
iob_intr_3_391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_391), 16, 16)) -> intp(3, 0, 32)
	ta	T_CHANGE_TO_TL0
	.word 0xf2f4e0e5  ! 4531: STXA_I	stxa	%r25, [%r19 + 0x00e5] %asi
cpu_intr_3_341:
	setx	0x42030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ac0020  ! 4539: STBA_R	stba	%r28, [%r16 + %r0] 0x01
	.word 0xf675a00c  ! 4543: STX_I	stx	%r27, [%r22 + 0x000c]
T3_asi_reg_rd_204:
	mov	0x3, %r14
	.word 0xf0db8e60  ! 4544: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xfea4c020  ! 4545: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
iob_intr_3_392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_392), 16, 16)) -> intp(3, 0, 4)
	.word 0xf4f4e0af  ! 4547: STXA_I	stxa	%r26, [%r19 + 0x00af] %asi
	.word 0xf4f461aa  ! 4548: STXA_I	stxa	%r26, [%r17 + 0x01aa] %asi
cpu_intr_3_342:
	setx	0x400012, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_343:
	setx	0x400107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8acc020  ! 4558: STBA_R	stba	%r28, [%r19 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
	.word 0xf2ade002  ! 4563: STBA_I	stba	%r25, [%r23 + 0x0002] %asi
	.word 0xbb2cd000  ! 4570: SLLX_R	sllx	%r19, %r0, %r29
	.word 0xfcb54020  ! 4571: STHA_R	stha	%r30, [%r21 + %r0] 0x01
	.word 0xb20d0000  ! 4572: AND_R	and 	%r20, %r0, %r25
	.word 0xfa356139  ! 4573: STH_I	sth	%r29, [%r21 + 0x0139]
cpu_intr_3_344:
	setx	0x470125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2dc000  ! 4583: SLL_R	sll 	%r23, %r0, %r29
	.word 0xfe2de0f4  ! 4584: STB_I	stb	%r31, [%r23 + 0x00f4]
T3_asi_reg_wr_203:
	mov	0x2d, %r14
	.word 0xfaf384a0  ! 4585: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_rd_205:
	mov	0xb, %r14
	.word 0xfcdb8400  ! 4586: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xfaac61c5  ! 4587: STBA_I	stba	%r29, [%r17 + 0x01c5] %asi
	.word 0xfc248000  ! 4589: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xf82d6164  ! 4591: STB_I	stb	%r28, [%r21 + 0x0164]
iob_intr_3_393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_393), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_394:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_394), 16, 16)) -> intp(3, 0, f)
	.word 0xf82ce0d6  ! 4595: STB_I	stb	%r28, [%r19 + 0x00d6]
	.word 0xfeb4a0de  ! 4596: STHA_I	stha	%r31, [%r18 + 0x00de] %asi
T3_asi_reg_rd_206:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 4598: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_rd_207:
	mov	0x34, %r14
	.word 0xf8db8e40  ! 4599: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb035e085  ! 4600: ORN_I	orn 	%r23, 0x0085, %r24
iob_intr_3_395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_395), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_rd_208:
	mov	0x1f, %r14
	.word 0xfedb8400  ! 4603: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf8aca0d6  ! 4604: STBA_I	stba	%r28, [%r18 + 0x00d6] %asi
cpu_intr_3_345:
	setx	0x460336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcad8020  ! 4609: STBA_R	stba	%r30, [%r22 + %r0] 0x01
	.word 0xfe254000  ! 4610: STW_R	stw	%r31, [%r21 + %r0]
cpu_intr_3_346:
	setx	0x44031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb8348000  ! 4617: ORN_R	orn 	%r18, %r0, %r28
cpu_intr_3_347:
	setx	0x440137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b5e163  ! 4620: STHA_I	stha	%r25, [%r23 + 0x0163] %asi
iob_intr_3_396:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_396), 16, 16)) -> intp(3, 0, 28)
	ta	T_CHANGE_NONHPRIV
iob_intr_3_397:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_397), 16, 16)) -> intp(3, 0, 3f)
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983f4a  ! 4629: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f4a, %hpstate
	.word 0xf02560c3  ! 4631: STW_I	stw	%r24, [%r21 + 0x00c3]
T3_asi_reg_rd_209:
	mov	0x16, %r14
	.word 0xf8db84a0  ! 4632: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T3_asi_reg_wr_204:
	mov	0xb, %r14
	.word 0xf0f38400  ! 4633: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T3_asi_reg_wr_205:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 4636: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfc746077  ! 4637: STX_I	stx	%r30, [%r17 + 0x0077]
cpu_intr_3_348:
	setx	0x46022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0852149  ! 4640: ADDcc_I	addcc 	%r20, 0x0149, %r24
	.word 0xfe748000  ! 4642: STX_R	stx	%r31, [%r18 + %r0]
T3_asi_reg_rd_210:
	mov	0x3c4, %r14
	.word 0xf2db8400  ! 4643: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T3_asi_reg_wr_206:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 4644: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf4ac4020  ! 4645: STBA_R	stba	%r26, [%r17 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	.word 0xb751c000  ! 4652: RDPR_TL	rdpr	%tl, %r27
	.word 0xf4ac203a  ! 4659: STBA_I	stba	%r26, [%r16 + 0x003a] %asi
T3_asi_reg_wr_207:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 4660: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfca48020  ! 4663: STWA_R	stwa	%r30, [%r18 + %r0] 0x01
T3_asi_reg_rd_211:
	mov	0x3c6, %r14
	.word 0xfadb84a0  ! 4667: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_3_398:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_398), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_wr_208:
	mov	0x3c7, %r14
	.word 0xf6f389e0  ! 4672: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf42c61be  ! 4675: STB_I	stb	%r26, [%r17 + 0x01be]
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983e8a  ! 4678: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e8a, %hpstate
T3_asi_reg_rd_212:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 4679: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf8a5214f  ! 4682: STWA_I	stwa	%r28, [%r20 + 0x014f] %asi
	.word 0xfa2dc000  ! 4684: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xfea44020  ! 4685: STWA_R	stwa	%r31, [%r17 + %r0] 0x01
	.word 0xb6a58000  ! 4689: SUBcc_R	subcc 	%r22, %r0, %r27
	.word 0xf8f560b2  ! 4690: STXA_I	stxa	%r28, [%r21 + 0x00b2] %asi
cpu_intr_3_349:
	setx	0x460323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4748000  ! 4692: STX_R	stx	%r26, [%r18 + %r0]
cpu_intr_3_350:
	setx	0x470112, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_351:
	setx	0x470300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b5e162  ! 4700: STHA_I	stha	%r25, [%r23 + 0x0162] %asi
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819828c0  ! 4702: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c0, %hpstate
cpu_intr_3_352:
	setx	0x470127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0bc0000  ! 4704: XNORcc_R	xnorcc 	%r16, %r0, %r24
	.word 0xf8a54020  ! 4707: STWA_R	stwa	%r28, [%r21 + %r0] 0x01
	.word 0xfeb40020  ! 4709: STHA_R	stha	%r31, [%r16 + %r0] 0x01
T3_asi_reg_wr_209:
	mov	0x1a, %r14
	.word 0xfef38e80  ! 4711: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T3_asi_reg_wr_210:
	mov	0x3c4, %r14
	.word 0xfef38e40  ! 4712: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_wr_211:
	mov	0x2e, %r14
	.word 0xf0f38e40  ! 4713: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_399:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_399), 16, 16)) -> intp(3, 0, 2a)
iob_intr_3_400:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_400), 16, 16)) -> intp(3, 0, 1e)
iob_intr_3_401:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_401), 16, 16)) -> intp(3, 0, 0)
	.word 0xfcb5606e  ! 4723: STHA_I	stha	%r30, [%r21 + 0x006e] %asi
	.word 0xf4244000  ! 4724: STW_R	stw	%r26, [%r17 + %r0]
iob_intr_3_402:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_402), 16, 16)) -> intp(3, 0, 20)
T3_asi_reg_wr_212:
	mov	0x35, %r14
	.word 0xf8f38e80  ! 4726: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xfa74e0cb  ! 4727: STX_I	stx	%r29, [%r19 + 0x00cb]
iob_intr_3_403:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_403), 16, 16)) -> intp(3, 0, 2)
	.word 0xfc744000  ! 4732: STX_R	stx	%r30, [%r17 + %r0]
iob_intr_3_404:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_404), 16, 16)) -> intp(3, 0, 0)
	.word 0xf4ad8020  ! 4735: STBA_R	stba	%r26, [%r22 + %r0] 0x01
T3_asi_reg_rd_213:
	mov	0x3c8, %r14
	.word 0xf8db8e60  ! 4737: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_3_353:
	setx	0x46022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_214:
	mov	0x37, %r14
	.word 0xf8db8e40  ! 4745: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfa74614c  ! 4749: STX_I	stx	%r29, [%r17 + 0x014c]
iob_intr_3_405:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_405), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_rd_215:
	mov	0x4, %r14
	.word 0xfcdb89e0  ! 4751: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_3_354:
	setx	0x46023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a460df  ! 4754: STWA_I	stwa	%r28, [%r17 + 0x00df] %asi
	.word 0xb024c000  ! 4755: SUB_R	sub 	%r19, %r0, %r24
	.word 0xf4f42147  ! 4759: STXA_I	stxa	%r26, [%r16 + 0x0147] %asi
T3_asi_reg_rd_216:
	mov	0x6, %r14
	.word 0xfadb8e40  ! 4762: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_406:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_406), 16, 16)) -> intp(3, 0, 3b)
T3_asi_reg_wr_213:
	mov	0x2f, %r14
	.word 0xfef38400  ! 4764: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_3_407:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_407), 16, 16)) -> intp(3, 0, 25)
iob_intr_3_408:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_408), 16, 16)) -> intp(3, 0, b)
T3_asi_reg_wr_214:
	mov	0x16, %r14
	.word 0xf4f38e80  ! 4768: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xfca5a126  ! 4769: STWA_I	stwa	%r30, [%r22 + 0x0126] %asi
cpu_intr_3_355:
	setx	0x440213, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_409:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_409), 16, 16)) -> intp(3, 0, 3d)
	.word 0xb0ac4000  ! 4774: ANDNcc_R	andncc 	%r17, %r0, %r24
T3_asi_reg_rd_217:
	mov	0x19, %r14
	.word 0xfcdb84a0  ! 4777: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_3_410:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_410), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_rd_218:
	mov	0x24, %r14
	.word 0xf6db8e80  ! 4782: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb7510000  ! 4783: RDPR_TICK	rdpr	%tick, %r27
	.word 0xb6adc000  ! 4784: ANDNcc_R	andncc 	%r23, %r0, %r27
cpu_intr_3_356:
	setx	0x440300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf275a189  ! 4787: STX_I	stx	%r25, [%r22 + 0x0189]
	.word 0xf4758000  ! 4792: STX_R	stx	%r26, [%r22 + %r0]
T3_asi_reg_rd_219:
	mov	0x30, %r14
	.word 0xf2db8e40  ! 4794: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_rd_220:
	mov	0x36, %r14
	.word 0xf2db8e80  ! 4795: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
T3_asi_reg_rd_221:
	mov	0x24, %r14
	.word 0xf8db8e60  ! 4797: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xfcf561ff  ! 4800: STXA_I	stxa	%r30, [%r21 + 0x01ff] %asi
iob_intr_3_411:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_411), 16, 16)) -> intp(3, 0, 1a)
cpu_intr_3_357:
	setx	0x460124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_412:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_412), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf2242085  ! 4807: STW_I	stw	%r25, [%r16 + 0x0085]
iob_intr_3_413:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_413), 16, 16)) -> intp(3, 0, 14)
T3_asi_reg_rd_222:
	mov	0x22, %r14
	.word 0xf8db8e80  ! 4809: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf8a42057  ! 4814: STWA_I	stwa	%r28, [%r16 + 0x0057] %asi
	.word 0xf6f520ef  ! 4815: STXA_I	stxa	%r27, [%r20 + 0x00ef] %asi
	.word 0xfa252153  ! 4818: STW_I	stw	%r29, [%r20 + 0x0153]
T3_asi_reg_wr_215:
	mov	0x3c0, %r14
	.word 0xf2f38e40  ! 4821: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_wr_216:
	mov	0x9, %r14
	.word 0xfef389e0  ! 4825: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_3_358:
	setx	0x45010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a460b2  ! 4827: STWA_I	stwa	%r25, [%r17 + 0x00b2] %asi
cpu_intr_3_359:
	setx	0x470100, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_414:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_414), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_rd_223:
	mov	0x3c0, %r14
	.word 0xf6db8400  ! 4838: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_3_415:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_415), 16, 16)) -> intp(3, 0, 33)
	.word 0xf62d0000  ! 4842: STB_R	stb	%r27, [%r20 + %r0]
iob_intr_3_416:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_416), 16, 16)) -> intp(3, 0, 14)
	.word 0xf8b5c020  ! 4844: STHA_R	stha	%r28, [%r23 + %r0] 0x01
	.word 0xf8f4e090  ! 4846: STXA_I	stxa	%r28, [%r19 + 0x0090] %asi
cpu_intr_3_360:
	setx	0x44010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_217:
	mov	0x27, %r14
	.word 0xfef38400  ! 4850: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_3_417:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_417), 16, 16)) -> intp(3, 0, 21)
	.word 0xfc24a0ef  ! 4854: STW_I	stw	%r30, [%r18 + 0x00ef]
cpu_intr_3_361:
	setx	0x46002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf225a1a5  ! 4859: STW_I	stw	%r25, [%r22 + 0x01a5]
	.word 0xfa756134  ! 4860: STX_I	stx	%r29, [%r21 + 0x0134]
	.word 0xf2a48020  ! 4861: STWA_R	stwa	%r25, [%r18 + %r0] 0x01
	.word 0xfe74e0e0  ! 4862: STX_I	stx	%r31, [%r19 + 0x00e0]
	.word 0xf22ce09f  ! 4864: STB_I	stb	%r25, [%r19 + 0x009f]
cpu_intr_3_362:
	setx	0x440125, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_224:
	mov	0x20, %r14
	.word 0xf0db8e40  ! 4866: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb634211a  ! 4868: SUBC_I	orn 	%r16, 0x011a, %r27
cpu_intr_3_363:
	setx	0x470216, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_225:
	mov	0x3c5, %r14
	.word 0xfcdb8400  ! 4873: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_3_418:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_418), 16, 16)) -> intp(3, 0, e)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_364:
	setx	0x460031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6a4c000  ! 4877: SUBcc_R	subcc 	%r19, %r0, %r27
T3_asi_reg_wr_218:
	mov	0x2e, %r14
	.word 0xfef38e80  ! 4879: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf835c000  ! 4882: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xfa74619c  ! 4885: STX_I	stx	%r29, [%r17 + 0x019c]
	.word 0xfa2de155  ! 4886: STB_I	stb	%r29, [%r23 + 0x0155]
	.word 0xb4bde0d4  ! 4893: XNORcc_I	xnorcc 	%r23, 0x00d4, %r26
iob_intr_3_419:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_419), 16, 16)) -> intp(3, 0, 3b)
iob_intr_3_420:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_420), 16, 16)) -> intp(3, 0, 19)
T3_asi_reg_wr_219:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 4898: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_wr_220:
	mov	0x10, %r14
	.word 0xf2f38e80  ! 4900: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xfea5c020  ! 4901: STWA_R	stwa	%r31, [%r23 + %r0] 0x01
	.word 0xb4b46132  ! 4904: SUBCcc_I	orncc 	%r17, 0x0132, %r26
	.word 0xf4a40020  ! 4906: STWA_R	stwa	%r26, [%r16 + %r0] 0x01
iob_intr_3_421:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_421), 16, 16)) -> intp(3, 0, 1a)
	ta	T_CHANGE_TO_TL1
iob_intr_3_422:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_422), 16, 16)) -> intp(3, 0, 3c)
	.word 0xfeb40020  ! 4913: STHA_R	stha	%r31, [%r16 + %r0] 0x01
T3_asi_reg_wr_221:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 4915: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_rd_226:
	mov	0x3c3, %r14
	.word 0xf6db84a0  ! 4920: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	ta	T_CHANGE_NONHPRIV
iob_intr_3_423:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_423), 16, 16)) -> intp(3, 0, 26)
	ta	T_CHANGE_HPRIV
	.word 0xf2ac8020  ! 4934: STBA_R	stba	%r25, [%r18 + %r0] 0x01
	.word 0xb2ac8000  ! 4935: ANDNcc_R	andncc 	%r18, %r0, %r25
	.word 0xf2a4e09f  ! 4936: STWA_I	stwa	%r25, [%r19 + 0x009f] %asi
T3_asi_reg_rd_227:
	mov	0xd, %r14
	.word 0xfedb8400  ! 4937: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb92c2001  ! 4941: SLL_I	sll 	%r16, 0x0001, %r28
T3_asi_reg_rd_228:
	mov	0x1a, %r14
	.word 0xf4db8e40  ! 4942: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_365:
	setx	0x440127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa35c000  ! 4944: STH_R	sth	%r29, [%r23 + %r0]
	.word 0xf22ca012  ! 4946: STB_I	stb	%r25, [%r18 + 0x0012]
	.word 0xf02d8000  ! 4947: STB_R	stb	%r24, [%r22 + %r0]
	.word 0xf0744000  ! 4948: STX_R	stx	%r24, [%r17 + %r0]
T3_asi_reg_rd_229:
	mov	0x3c8, %r14
	.word 0xfcdb84a0  ! 4950: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfea4a10b  ! 4951: STWA_I	stwa	%r31, [%r18 + 0x010b] %asi
T3_asi_reg_wr_222:
	mov	0x21, %r14
	.word 0xfcf38e60  ! 4954: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_230:
	mov	0x4, %r14
	.word 0xfadb8e40  ! 4956: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb4b5201d  ! 4959: SUBCcc_I	orncc 	%r20, 0x001d, %r26
T3_asi_reg_wr_223:
	mov	0x6, %r14
	.word 0xfcf384a0  ! 4961: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xbb643801  ! 4962: MOVcc_I	<illegal instruction>
cpu_intr_3_366:
	setx	0x470333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2ac4020  ! 4965: STBA_R	stba	%r25, [%r17 + %r0] 0x01
iob_intr_3_424:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_424), 16, 16)) -> intp(3, 0, 2b)
iob_intr_3_425:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_425), 16, 16)) -> intp(3, 0, 14)
	.word 0xbb35e001  ! 4970: SRL_I	srl 	%r23, 0x0001, %r29
	.word 0xfea48020  ! 4971: STWA_R	stwa	%r31, [%r18 + %r0] 0x01
iob_intr_3_426:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_426), 16, 16)) -> intp(3, 0, d)
iob_intr_3_427:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_427), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_367:
	setx	0x460236, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_231:
	mov	0x19, %r14
	.word 0xfcdb8e40  ! 4978: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfaf561f9  ! 4980: STXA_I	stxa	%r29, [%r21 + 0x01f9] %asi
	.word 0xfa2de188  ! 4987: STB_I	stb	%r29, [%r23 + 0x0188]
T3_asi_reg_wr_224:
	mov	0x3c5, %r14
	.word 0xfef38e40  ! 4989: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb814c000  ! 4991: OR_R	or 	%r19, %r0, %r28
	.word 0xfab46086  ! 4992: STHA_I	stha	%r29, [%r17 + 0x0086] %asi
	.word 0xfe2561c7  ! 4993: STW_I	stw	%r31, [%r21 + 0x01c7]
iob_intr_3_428:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_428), 16, 16)) -> intp(3, 0, b)
	.word 0xf4b50020  ! 4996: STHA_R	stha	%r26, [%r20 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_429:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_429), 16, 16)) -> intp(3, 0, 7)
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	setx	data_start_0, %g1, %r16
	setx	data_start_1, %g1, %r17
	setx	data_start_2, %g1, %r18
	setx	data_start_3, %g1, %r19
	setx	data_start_4, %g1, %r20
	setx	data_start_5, %g1, %r21
	setx	data_start_6, %g1, %r22
	setx	data_start_7, %g1, %r23
cpu_intr_2_0:
	setx	0x1b0310, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_1:
	setx	0x18021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00da0ae  ! 5: LDUB_I	ldub	[%r22 + 0x00ae], %r24
	.word 0xfed40020  ! 6: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r31
iob_intr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_0), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_wr_0:
	mov	0x2a, %r14
	.word 0xf6f38e60  ! 11: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	ta	T_CHANGE_NONHPRIV
	.word 0xf4d40020  ! 15: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r26
	.word 0xf24d21b1  ! 19: LDSB_I	ldsb	[%r20 + 0x01b1], %r25
T2_asi_reg_rd_0:
	mov	0x14, %r14
	.word 0xf6db89e0  ! 20: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbc1d201b  ! 22: XOR_I	xor 	%r20, 0x001b, %r30
iob_intr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_1), 16, 16)) -> intp(2, 0, 2d)
	.word 0xb69c8000  ! 26: XORcc_R	xorcc 	%r18, %r0, %r27
	.word 0xb0a4a1d0  ! 28: SUBcc_I	subcc 	%r18, 0x01d0, %r24
iob_intr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_2), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf28d8020  ! 30: LDUBA_R	lduba	[%r22, %r0] 0x01, %r25
	.word 0xfe4c6113  ! 34: LDSB_I	ldsb	[%r17 + 0x0113], %r31
	.word 0xf0944020  ! 35: LDUHA_R	lduha	[%r17, %r0] 0x01, %r24
	.word 0xfe858020  ! 37: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r31
iob_intr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_3), 16, 16)) -> intp(2, 0, 24)
iob_intr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_4), 16, 16)) -> intp(2, 0, 11)
T2_asi_reg_rd_1:
	mov	0x11, %r14
	.word 0xf0db89e0  ! 42: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_5), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_rd_2:
	mov	0x3c1, %r14
	.word 0xf0db8e80  ! 50: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_6), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_7), 16, 16)) -> intp(2, 0, 5)
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983902  ! 58: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1902, %hpstate
	.word 0xf6558000  ! 61: LDSH_R	ldsh	[%r22 + %r0], %r27
T2_asi_reg_wr_1:
	mov	0x31, %r14
	.word 0xf6f38e60  ! 64: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T2_asi_reg_rd_3:
	mov	0x3c3, %r14
	.word 0xf8db8e60  ! 66: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_2_2:
	setx	0x1e032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf685e07e  ! 70: LDUWA_I	lduwa	[%r23, + 0x007e] %asi, %r27
T2_asi_reg_wr_2:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 71: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf8858020  ! 72: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r28
	.word 0xfe4da18c  ! 73: LDSB_I	ldsb	[%r22 + 0x018c], %r31
T2_asi_reg_rd_4:
	mov	0x28, %r14
	.word 0xfcdb8e80  ! 74: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983e0a  ! 78: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e0a, %hpstate
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982eca  ! 80: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0eca, %hpstate
	.word 0x85952091  ! 82: WRPR_TSTATE_I	wrpr	%r20, 0x0091, %tstate
T2_asi_reg_rd_5:
	mov	0x3c3, %r14
	.word 0xfedb8e80  ! 83: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_8), 16, 16)) -> intp(2, 0, 11)
T2_asi_reg_rd_6:
	mov	0x3c4, %r14
	.word 0xf8db8e80  ! 87: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_2_3:
	setx	0x1e002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_9), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_wr_3:
	mov	0x3c5, %r14
	.word 0xf4f38e40  ! 93: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_10), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf08da108  ! 98: LDUBA_I	lduba	[%r22, + 0x0108] %asi, %r24
iob_intr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_11), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_12), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_rd_7:
	mov	0x32, %r14
	.word 0xfadb8e40  ! 103: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbc9c8000  ! 106: XORcc_R	xorcc 	%r18, %r0, %r30
	.word 0xf6944020  ! 113: LDUHA_R	lduha	[%r17, %r0] 0x01, %r27
	.word 0xf0d44020  ! 119: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r24
T2_asi_reg_rd_8:
	mov	0x32, %r14
	.word 0xfcdb84a0  ! 120: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf44520f9  ! 121: LDSW_I	ldsw	[%r20 + 0x00f9], %r26
	.word 0xbeb52195  ! 128: SUBCcc_I	orncc 	%r20, 0x0195, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb334a001  ! 133: SRL_I	srl 	%r18, 0x0001, %r25
iob_intr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_13), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_14), 16, 16)) -> intp(2, 0, 2b)
iob_intr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_15), 16, 16)) -> intp(2, 0, 1e)
iob_intr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_16), 16, 16)) -> intp(2, 0, d)
	.word 0xf645e16e  ! 142: LDSW_I	ldsw	[%r23 + 0x016e], %r27
	.word 0xfe0ce180  ! 145: LDUB_I	ldub	[%r19 + 0x0180], %r31
T2_asi_reg_wr_4:
	mov	0x31, %r14
	.word 0xfcf38e60  ! 147: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_17), 16, 16)) -> intp(2, 0, 2a)
cpu_intr_2_4:
	setx	0x1d0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb885c000  ! 152: ADDcc_R	addcc 	%r23, %r0, %r28
iob_intr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_18), 16, 16)) -> intp(2, 0, 3c)
	.word 0xfac48020  ! 154: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r29
cpu_intr_2_5:
	setx	0x1d0239, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_19), 16, 16)) -> intp(2, 0, c)
iob_intr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_20), 16, 16)) -> intp(2, 0, 2)
iob_intr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_21), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_rd_9:
	mov	0x37, %r14
	.word 0xf6db8e60  ! 160: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_22), 16, 16)) -> intp(2, 0, 2)
	.word 0xfe058000  ! 162: LDUW_R	lduw	[%r22 + %r0], %r31
	.word 0xfc44c000  ! 163: LDSW_R	ldsw	[%r19 + %r0], %r30
	.word 0xfe94a0e8  ! 165: LDUHA_I	lduha	[%r18, + 0x00e8] %asi, %r31
	.word 0xf005a098  ! 169: LDUW_I	lduw	[%r22 + 0x0098], %r24
	.word 0xbb540000  ! 170: RDPR_GL	<illegal instruction>
	.word 0xfacdc020  ! 173: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r29
cpu_intr_2_6:
	setx	0x1f0111, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf0054000  ! 179: LDUW_R	lduw	[%r21 + %r0], %r24
cpu_intr_2_7:
	setx	0x1d013e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_23), 16, 16)) -> intp(2, 0, 14)
	.word 0xb9504000  ! 183: RDPR_TNPC	<illegal instruction>
	.word 0xb08d4000  ! 184: ANDcc_R	andcc 	%r21, %r0, %r24
cpu_intr_2_8:
	setx	0x1f0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_10:
	mov	0x26, %r14
	.word 0xf4db8e40  ! 187: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_24), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_rd_11:
	mov	0x3c2, %r14
	.word 0xf6db8e60  ! 189: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_2_9:
	setx	0x1f030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf85ce1db  ! 202: LDX_I	ldx	[%r19 + 0x01db], %r28
iob_intr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_25), 16, 16)) -> intp(2, 0, 0)
	.word 0xb215e16d  ! 206: OR_I	or 	%r23, 0x016d, %r25
	.word 0xf4844020  ! 207: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r26
cpu_intr_2_10:
	setx	0x1d0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40c4000  ! 212: LDUB_R	ldub	[%r17 + %r0], %r26
T2_asi_reg_rd_12:
	mov	0x3c1, %r14
	.word 0xf0db8e40  ! 214: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf0c5603b  ! 215: LDSWA_I	ldswa	[%r21, + 0x003b] %asi, %r24
	.word 0xf2dd60c7  ! 217: LDXA_I	ldxa	[%r21, + 0x00c7] %asi, %r25
	.word 0xf414218e  ! 218: LDUH_I	lduh	[%r16 + 0x018e], %r26
T2_asi_reg_rd_13:
	mov	0x3c3, %r14
	.word 0xfadb8e80  ! 220: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_26), 16, 16)) -> intp(2, 0, 26)
	.word 0xf44c0000  ! 222: LDSB_R	ldsb	[%r16 + %r0], %r26
	.word 0xfe046147  ! 223: LDUW_I	lduw	[%r17 + 0x0147], %r31
T2_asi_reg_rd_14:
	mov	0x30, %r14
	.word 0xf4db8e60  ! 224: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xfe15c000  ! 228: LDUH_R	lduh	[%r23 + %r0], %r31
cpu_intr_2_11:
	setx	0x1d011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_27), 16, 16)) -> intp(2, 0, c)
	.word 0xfcd4c020  ! 231: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r30
	.word 0xf88ce0d3  ! 232: LDUBA_I	lduba	[%r19, + 0x00d3] %asi, %r28
cpu_intr_2_12:
	setx	0x1f011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8ca15b  ! 235: LDUBA_I	lduba	[%r18, + 0x015b] %asi, %r30
iob_intr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_28), 16, 16)) -> intp(2, 0, b)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_5:
	mov	0x2e, %r14
	.word 0xfef38e60  ! 245: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xbe150000  ! 247: OR_R	or 	%r20, %r0, %r31
cpu_intr_2_13:
	setx	0x1d0224, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_14:
	setx	0x1d0105, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_29), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfa5d614a  ! 255: LDX_I	ldx	[%r21 + 0x014a], %r29
iob_intr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_30), 16, 16)) -> intp(2, 0, 9)
	.word 0xf8cce176  ! 260: LDSBA_I	ldsba	[%r19, + 0x0176] %asi, %r28
cpu_intr_2_15:
	setx	0x1c0333, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_6:
	mov	0x25, %r14
	.word 0xf4f38e40  ! 264: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfecde10e  ! 265: LDSBA_I	ldsba	[%r23, + 0x010e] %asi, %r31
	.word 0xba9521cd  ! 267: ORcc_I	orcc 	%r20, 0x01cd, %r29
iob_intr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_31), 16, 16)) -> intp(2, 0, 5)
T2_asi_reg_wr_7:
	mov	0xc, %r14
	.word 0xf6f384a0  ! 269: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_2_16:
	setx	0x1c0108, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_32), 16, 16)) -> intp(2, 0, 3d)
	.word 0xb32c4000  ! 273: SLL_R	sll 	%r17, %r0, %r25
iob_intr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_33), 16, 16)) -> intp(2, 0, 17)
	.word 0xf4844020  ! 281: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r26
	.word 0xfccda1a5  ! 282: LDSBA_I	ldsba	[%r22, + 0x01a5] %asi, %r30
	.word 0xf40ce04d  ! 283: LDUB_I	ldub	[%r19 + 0x004d], %r26
cpu_intr_2_17:
	setx	0x1e022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_18:
	setx	0x1d002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_34), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_19:
	setx	0x1d020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982810  ! 294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0810, %hpstate
T2_asi_reg_rd_15:
	mov	0x1c, %r14
	.word 0xfcdb84a0  ! 295: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf0542163  ! 297: LDSH_I	ldsh	[%r16 + 0x0163], %r24
cpu_intr_2_20:
	setx	0x1e0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0d21d5  ! 301: LDUB_I	ldub	[%r20 + 0x01d5], %r30
	.word 0xfed48020  ! 302: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r31
	.word 0xf0552044  ! 303: LDSH_I	ldsh	[%r20 + 0x0044], %r24
cpu_intr_2_21:
	setx	0x1e0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44c4000  ! 307: LDSB_R	ldsb	[%r17 + %r0], %r26
iob_intr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_35), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_rd_16:
	mov	0x33, %r14
	.word 0xf4db84a0  ! 311: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf8856044  ! 312: LDUWA_I	lduwa	[%r21, + 0x0044] %asi, %r28
	.word 0xf0054000  ! 317: LDUW_R	lduw	[%r21 + %r0], %r24
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819838c0  ! 320: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c0, %hpstate
cpu_intr_2_22:
	setx	0x1c0308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_36), 16, 16)) -> intp(2, 0, 1b)
	.word 0xba2d60b9  ! 331: ANDN_I	andn 	%r21, 0x00b9, %r29
	.word 0xfa9460a6  ! 333: LDUHA_I	lduha	[%r17, + 0x00a6] %asi, %r29
T2_asi_reg_rd_17:
	mov	0xb, %r14
	.word 0xf2db84a0  ! 334: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb8950000  ! 336: ORcc_R	orcc 	%r20, %r0, %r28
	.word 0xf0852065  ! 337: LDUWA_I	lduwa	[%r20, + 0x0065] %asi, %r24
	.word 0xf645a1d6  ! 342: LDSW_I	ldsw	[%r22 + 0x01d6], %r27
iob_intr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_37), 16, 16)) -> intp(2, 0, 32)
T2_asi_reg_rd_18:
	mov	0x3c2, %r14
	.word 0xf0db89e0  ! 347: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_2_23:
	setx	0x1c0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0561cd  ! 349: LDUW_I	lduw	[%r21 + 0x01cd], %r30
iob_intr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_38), 16, 16)) -> intp(2, 0, 28)
	.word 0xfe8d61b4  ! 352: LDUBA_I	lduba	[%r21, + 0x01b4] %asi, %r31
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_19:
	mov	0x10, %r14
	.word 0xf0db84a0  ! 354: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_39), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf4040000  ! 359: LDUW_R	lduw	[%r16 + %r0], %r26
cpu_intr_2_24:
	setx	0x1d0218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf68c61d4  ! 361: LDUBA_I	lduba	[%r17, + 0x01d4] %asi, %r27
T2_asi_reg_wr_8:
	mov	0x19, %r14
	.word 0xfcf389e0  ! 363: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_2_25:
	setx	0x1e000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6c48020  ! 365: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r27
T2_asi_reg_rd_20:
	mov	0x21, %r14
	.word 0xfedb89e0  ! 366: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T2_asi_reg_wr_9:
	mov	0xd, %r14
	.word 0xf6f384a0  ! 369: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_21:
	mov	0x1d, %r14
	.word 0xf0db89e0  ! 374: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb29d61d1  ! 376: XORcc_I	xorcc 	%r21, 0x01d1, %r25
	.word 0xba2c0000  ! 377: ANDN_R	andn 	%r16, %r0, %r29
	.word 0xf25460dd  ! 378: LDSH_I	ldsh	[%r17 + 0x00dd], %r25
	.word 0xf0554000  ! 379: LDSH_R	ldsh	[%r21 + %r0], %r24
T2_asi_reg_rd_22:
	mov	0x2b, %r14
	.word 0xfedb8e40  ! 380: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfc0d0000  ! 384: LDUB_R	ldub	[%r20 + %r0], %r30
iob_intr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_40), 16, 16)) -> intp(2, 0, 36)
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x819839d0  ! 388: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d0, %hpstate
T2_asi_reg_wr_10:
	mov	0x37, %r14
	.word 0xfaf38e40  ! 389: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_wr_11:
	mov	0x25, %r14
	.word 0xf2f389e0  ! 392: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_2_26:
	setx	0x1f0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_41), 16, 16)) -> intp(2, 0, 14)
	.word 0xb53d1000  ! 404: SRAX_R	srax	%r20, %r0, %r26
	.word 0xf05c4000  ! 415: LDX_R	ldx	[%r17 + %r0], %r24
	.word 0xf0154000  ! 416: LDUH_R	lduh	[%r21 + %r0], %r24
	.word 0xf4cce18b  ! 417: LDSBA_I	ldsba	[%r19, + 0x018b] %asi, %r26
	.word 0xf80c217c  ! 421: LDUB_I	ldub	[%r16 + 0x017c], %r28
iob_intr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_42), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_rd_23:
	mov	0x37, %r14
	.word 0xf6db8e60  ! 424: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_43), 16, 16)) -> intp(2, 0, 1a)
cpu_intr_2_27:
	setx	0x1f0317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_44), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_28:
	setx	0x1e0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0ace08d  ! 431: ANDNcc_I	andncc 	%r19, 0x008d, %r24
T2_asi_reg_wr_12:
	mov	0x3c3, %r14
	.word 0xfcf38e80  ! 435: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_45), 16, 16)) -> intp(2, 0, 9)
iob_intr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_46), 16, 16)) -> intp(2, 0, 37)
	.word 0xf615c000  ! 442: LDUH_R	lduh	[%r23 + %r0], %r27
iob_intr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_47), 16, 16)) -> intp(2, 0, 8)
cpu_intr_2_29:
	setx	0x1e0312, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_30:
	setx	0x1010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb00c4000  ! 449: AND_R	and 	%r17, %r0, %r24
	.word 0xf61420c4  ! 450: LDUH_I	lduh	[%r16 + 0x00c4], %r27
	.word 0xfc94a11d  ! 455: LDUHA_I	lduha	[%r18, + 0x011d] %asi, %r30
	.word 0xfc0de100  ! 456: LDUB_I	ldub	[%r23 + 0x0100], %r30
	.word 0xf454e137  ! 457: LDSH_I	ldsh	[%r19 + 0x0137], %r26
	.word 0xf8858020  ! 458: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r28
	.word 0xf64d4000  ! 460: LDSB_R	ldsb	[%r21 + %r0], %r27
	.word 0xfc540000  ! 462: LDSH_R	ldsh	[%r16 + %r0], %r30
iob_intr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_48), 16, 16)) -> intp(2, 0, 4)
	.word 0xfcc44020  ! 468: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r30
cpu_intr_2_31:
	setx	0x21033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_49), 16, 16)) -> intp(2, 0, b)
iob_intr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_50), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf04c8000  ! 472: LDSB_R	ldsb	[%r18 + %r0], %r24
	.word 0xf28d0020  ! 473: LDUBA_R	lduba	[%r20, %r0] 0x01, %r25
	.word 0xf25c0000  ! 478: LDX_R	ldx	[%r16 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_32:
	setx	0x22030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2850020  ! 483: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r25
	.word 0xf6c4e1dd  ! 486: LDSWA_I	ldswa	[%r19, + 0x01dd] %asi, %r27
T2_asi_reg_wr_13:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 487: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_33:
	setx	0x21022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb2c4000  ! 490: SLL_R	sll 	%r17, %r0, %r29
	.word 0xfcdc200d  ! 492: LDXA_I	ldxa	[%r16, + 0x000d] %asi, %r30
	.word 0xfc84e1b2  ! 493: LDUWA_I	lduwa	[%r19, + 0x01b2] %asi, %r30
cpu_intr_2_34:
	setx	0x230200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65ce03b  ! 495: LDX_I	ldx	[%r19 + 0x003b], %r27
iob_intr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_51), 16, 16)) -> intp(2, 0, 1)
T2_asi_reg_wr_14:
	mov	0x3c8, %r14
	.word 0xfaf384a0  ! 498: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_35:
	setx	0x210318, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb9504000  ! 503: RDPR_TNPC	<illegal instruction>
	.word 0xf404c000  ! 506: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xb0858000  ! 507: ADDcc_R	addcc 	%r22, %r0, %r24
cpu_intr_2_36:
	setx	0x210217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca44000  ! 511: SUBcc_R	subcc 	%r17, %r0, %r30
cpu_intr_2_37:
	setx	0x220239, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_52), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_38:
	setx	0x20010b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_53), 16, 16)) -> intp(2, 0, 2b)
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983e40  ! 523: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e40, %hpstate
T2_asi_reg_rd_24:
	mov	0x3c7, %r14
	.word 0xf8db8400  ! 524: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T2_asi_reg_wr_15:
	mov	0x13, %r14
	.word 0xf0f384a0  ! 525: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T2_asi_reg_rd_25:
	mov	0xf, %r14
	.word 0xf0db8e40  ! 527: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf645c000  ! 532: LDSW_R	ldsw	[%r23 + %r0], %r27
cpu_intr_2_39:
	setx	0x210033, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	.word 0xf2c5c020  ! 539: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r25
	.word 0xfe4c8000  ! 540: LDSB_R	ldsb	[%r18 + %r0], %r31
	.word 0xf8dc21f8  ! 542: LDXA_I	ldxa	[%r16, + 0x01f8] %asi, %r28
iob_intr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_54), 16, 16)) -> intp(2, 0, 28)
	.word 0xfc0ce0d6  ! 545: LDUB_I	ldub	[%r19 + 0x00d6], %r30
iob_intr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_55), 16, 16)) -> intp(2, 0, 28)
iob_intr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_56), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_40:
	setx	0x21000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf08d60ac  ! 551: LDUBA_I	lduba	[%r21, + 0x00ac] %asi, %r24
T2_asi_reg_wr_16:
	mov	0x20, %r14
	.word 0xfef38e40  ! 552: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_wr_17:
	mov	0x3c2, %r14
	.word 0xf8f38400  ! 553: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_57), 16, 16)) -> intp(2, 0, e)
	.word 0xb21c61a8  ! 557: XOR_I	xor 	%r17, 0x01a8, %r25
cpu_intr_2_41:
	setx	0x200335, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_18:
	mov	0x1e, %r14
	.word 0xfaf38e40  ! 562: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_rd_26:
	mov	0x33, %r14
	.word 0xf8db8e60  ! 563: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xfc4d20bb  ! 564: LDSB_I	ldsb	[%r20 + 0x00bb], %r30
cpu_intr_2_42:
	setx	0x23010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa448000  ! 566: LDSW_R	ldsw	[%r18 + %r0], %r29
	.word 0xf884c020  ! 570: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r28
cpu_intr_2_43:
	setx	0x230031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13db001  ! 573: SRAX_I	srax	%r22, 0x0001, %r24
	.word 0xf4154000  ! 575: LDUH_R	lduh	[%r21 + %r0], %r26
	.word 0xbc1de09a  ! 577: XOR_I	xor 	%r23, 0x009a, %r30
	.word 0xf6444000  ! 580: LDSW_R	ldsw	[%r17 + %r0], %r27
	.word 0xfa5ca1eb  ! 581: LDX_I	ldx	[%r18 + 0x01eb], %r29
cpu_intr_2_44:
	setx	0x210237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_45:
	setx	0x20013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d521ee  ! 587: LDSHA_I	ldsha	[%r20, + 0x01ee] %asi, %r26
iob_intr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_58), 16, 16)) -> intp(2, 0, 26)
	.word 0xf80d618d  ! 593: LDUB_I	ldub	[%r21 + 0x018d], %r28
	setx	data_start_0, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983e50  ! 594: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e50, %hpstate
cpu_intr_2_46:
	setx	0x220315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc85a1ff  ! 596: LDUWA_I	lduwa	[%r22, + 0x01ff] %asi, %r30
	.word 0xf895c020  ! 598: LDUHA_R	lduha	[%r23, %r0] 0x01, %r28
	.word 0xb695605f  ! 599: ORcc_I	orcc 	%r21, 0x005f, %r27
	.word 0xf45c4000  ! 601: LDX_R	ldx	[%r17 + %r0], %r26
T2_asi_reg_wr_19:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 602: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb0ade025  ! 603: ANDNcc_I	andncc 	%r23, 0x0025, %r24
	.word 0xfa0c8000  ! 604: LDUB_R	ldub	[%r18 + %r0], %r29
iob_intr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_59), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_60), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_wr_20:
	mov	0x11, %r14
	.word 0xfef38e80  ! 610: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T2_asi_reg_wr_21:
	mov	0x15, %r14
	.word 0xfef38e40  ! 615: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_61), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_rd_27:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 620: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf894c020  ! 622: LDUHA_R	lduha	[%r19, %r0] 0x01, %r28
	.word 0xb77d0400  ! 625: MOVR_R	movre	%r20, %r0, %r27
	.word 0xb1500000  ! 628: RDPR_TPC	<illegal instruction>
	.word 0xf044a1c9  ! 632: LDSW_I	ldsw	[%r18 + 0x01c9], %r24
T2_asi_reg_rd_28:
	mov	0x1c, %r14
	.word 0xf8db84a0  ! 636: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf6558000  ! 638: LDSH_R	ldsh	[%r22 + %r0], %r27
	.word 0xf64c4000  ! 639: LDSB_R	ldsb	[%r17 + %r0], %r27
	.word 0xf04c0000  ! 640: LDSB_R	ldsb	[%r16 + %r0], %r24
	.word 0xb88ca06c  ! 641: ANDcc_I	andcc 	%r18, 0x006c, %r28
iob_intr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_62), 16, 16)) -> intp(2, 0, d)
	.word 0xbc1d0000  ! 643: XOR_R	xor 	%r20, %r0, %r30
T2_asi_reg_wr_22:
	mov	0x3c8, %r14
	.word 0xf2f38e80  ! 647: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf4c5e036  ! 648: LDSWA_I	ldswa	[%r23, + 0x0036] %asi, %r26
	.word 0xbf2d0000  ! 651: SLL_R	sll 	%r20, %r0, %r31
	.word 0xf28de1ee  ! 652: LDUBA_I	lduba	[%r23, + 0x01ee] %asi, %r25
iob_intr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_63), 16, 16)) -> intp(2, 0, a)
	.word 0xfa4c0000  ! 657: LDSB_R	ldsb	[%r16 + %r0], %r29
	.word 0xfac46143  ! 659: LDSWA_I	ldswa	[%r17, + 0x0143] %asi, %r29
	.word 0xb635c000  ! 661: SUBC_R	orn 	%r23, %r0, %r27
cpu_intr_2_47:
	setx	0x220238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2148000  ! 664: OR_R	or 	%r18, %r0, %r25
	.word 0xfcd54020  ! 665: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r30
	ta	T_CHANGE_TO_TL1
iob_intr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_64), 16, 16)) -> intp(2, 0, 14)
iob_intr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_65), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_wr_23:
	mov	0x18, %r14
	.word 0xf8f38e60  ! 671: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xfe84a197  ! 672: LDUWA_I	lduwa	[%r18, + 0x0197] %asi, %r31
	.word 0xfa45e183  ! 675: LDSW_I	ldsw	[%r23 + 0x0183], %r29
	.word 0xf6154000  ! 676: LDUH_R	lduh	[%r21 + %r0], %r27
	.word 0xf08d8020  ! 678: LDUBA_R	lduba	[%r22, %r0] 0x01, %r24
cpu_intr_2_48:
	setx	0x200313, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_24:
	mov	0x29, %r14
	.word 0xf8f38e60  ! 681: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb6bd8000  ! 682: XNORcc_R	xnorcc 	%r22, %r0, %r27
	.word 0xf20d2149  ! 683: LDUB_I	ldub	[%r20 + 0x0149], %r25
cpu_intr_2_49:
	setx	0x230120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_50:
	setx	0x23033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfa8460a6  ! 689: LDUWA_I	lduwa	[%r17, + 0x00a6] %asi, %r29
cpu_intr_2_51:
	setx	0x23023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfe844020  ! 695: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r31
T2_asi_reg_wr_25:
	mov	0x3c8, %r14
	.word 0xf2f38e60  ! 696: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_2_52:
	setx	0x230313, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_66), 16, 16)) -> intp(2, 0, 27)
	.word 0xfa5c4000  ! 704: LDX_R	ldx	[%r17 + %r0], %r29
	.word 0xf4440000  ! 705: LDSW_R	ldsw	[%r16 + %r0], %r26
	.word 0xf4d54020  ! 710: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r26
iob_intr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_67), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_68), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_69), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_53:
	setx	0x23021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_70), 16, 16)) -> intp(2, 0, 34)
	.word 0xfe4c2177  ! 720: LDSB_I	ldsb	[%r16 + 0x0177], %r31
T2_asi_reg_rd_29:
	mov	0x22, %r14
	.word 0xfadb8e60  ! 721: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	ta	T_CHANGE_HPRIV
iob_intr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_71), 16, 16)) -> intp(2, 0, 21)
	.word 0xb13ca001  ! 726: SRA_I	sra 	%r18, 0x0001, %r24
T2_asi_reg_wr_26:
	mov	0xc, %r14
	.word 0xfaf38400  ! 729: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_2_54:
	setx	0x230305, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_55:
	setx	0x21010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb341000  ! 735: SRLX_R	srlx	%r16, %r0, %r29
	ta	T_CHANGE_HPRIV
	.word 0xf6d40020  ! 738: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r27
	.word 0xfec4e1a7  ! 739: LDSWA_I	ldswa	[%r19, + 0x01a7] %asi, %r31
	.word 0xfc05c000  ! 741: LDUW_R	lduw	[%r23 + %r0], %r30
	.word 0xf2440000  ! 743: LDSW_R	ldsw	[%r16 + %r0], %r25
iob_intr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_72), 16, 16)) -> intp(2, 0, 8)
T2_asi_reg_wr_27:
	mov	0x1b, %r14
	.word 0xf2f38e80  ! 746: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbe3de10e  ! 747: XNOR_I	xnor 	%r23, 0x010e, %r31
	.word 0xf2d4c020  ! 748: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r25
T2_asi_reg_rd_30:
	mov	0x36, %r14
	.word 0xfcdb84a0  ! 749: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T2_asi_reg_rd_31:
	mov	0xa, %r14
	.word 0xf0db8e60  ! 750: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf4d44020  ! 753: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r26
iob_intr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_73), 16, 16)) -> intp(2, 0, 6)
	.word 0xf2854020  ! 757: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r25
cpu_intr_2_56:
	setx	0x20033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa540000  ! 761: LDSH_R	ldsh	[%r16 + %r0], %r29
	.word 0xf6c5e1c5  ! 762: LDSWA_I	ldswa	[%r23, + 0x01c5] %asi, %r27
T2_asi_reg_wr_28:
	mov	0x3c2, %r14
	.word 0xfcf38e40  ! 764: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb83460d1  ! 766: SUBC_I	orn 	%r17, 0x00d1, %r28
iob_intr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_74), 16, 16)) -> intp(2, 0, 12)
	.word 0xb92c6001  ! 768: SLL_I	sll 	%r17, 0x0001, %r28
	.word 0xbb3c6001  ! 769: SRA_I	sra 	%r17, 0x0001, %r29
iob_intr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_75), 16, 16)) -> intp(2, 0, 21)
	.word 0xf45c20c9  ! 773: LDX_I	ldx	[%r16 + 0x00c9], %r26
cpu_intr_2_57:
	setx	0x22003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf484c020  ! 776: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r26
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982cc0  ! 777: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc0, %hpstate
	.word 0xf6454000  ! 779: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xb73cd000  ! 783: SRAX_R	srax	%r19, %r0, %r27
T2_asi_reg_wr_29:
	mov	0x0, %r14
	.word 0xf4f389e0  ! 785: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T2_asi_reg_rd_32:
	mov	0x36, %r14
	.word 0xfcdb84a0  ! 786: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfec421fa  ! 787: LDSWA_I	ldswa	[%r16, + 0x01fa] %asi, %r31
iob_intr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_76), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_wr_30:
	mov	0x0, %r14
	.word 0xf0f38e60  ! 796: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_77), 16, 16)) -> intp(2, 0, 20)
	.word 0xf055e18a  ! 800: LDSH_I	ldsh	[%r23 + 0x018a], %r24
	ta	T_CHANGE_NONHPRIV
iob_intr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_78), 16, 16)) -> intp(2, 0, 28)
	ta	T_CHANGE_NONHPRIV
	.word 0xba1ca1af  ! 809: XOR_I	xor 	%r18, 0x01af, %r29
cpu_intr_2_58:
	setx	0x22003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983c48  ! 813: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c48, %hpstate
	.word 0xfe0de1fc  ! 814: LDUB_I	ldub	[%r23 + 0x01fc], %r31
	.word 0xf65ce094  ! 815: LDX_I	ldx	[%r19 + 0x0094], %r27
T2_asi_reg_wr_31:
	mov	0x34, %r14
	.word 0xf4f384a0  ! 816: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xfac4c020  ! 820: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r29
	.word 0xf25cc000  ! 821: LDX_R	ldx	[%r19 + %r0], %r25
cpu_intr_2_59:
	setx	0x200237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0a40000  ! 826: SUBcc_R	subcc 	%r16, %r0, %r24
cpu_intr_2_60:
	setx	0x23000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982e5a  ! 835: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5a, %hpstate
cpu_intr_2_61:
	setx	0x23012f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_79), 16, 16)) -> intp(2, 0, b)
	.word 0xf094e12f  ! 839: LDUHA_I	lduha	[%r19, + 0x012f] %asi, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_80), 16, 16)) -> intp(2, 0, 13)
iob_intr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_81), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf245e16b  ! 849: LDSW_I	ldsw	[%r23 + 0x016b], %r25
cpu_intr_2_62:
	setx	0x210211, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_33:
	mov	0x5, %r14
	.word 0xfedb89e0  ! 853: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T2_asi_reg_rd_34:
	mov	0x1a, %r14
	.word 0xf2db8e80  ! 854: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf40ca11c  ! 856: LDUB_I	ldub	[%r18 + 0x011c], %r26
cpu_intr_2_63:
	setx	0x220232, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_82), 16, 16)) -> intp(2, 0, 13)
	.word 0xf655602a  ! 868: LDSH_I	ldsh	[%r21 + 0x002a], %r27
	.word 0xf8944020  ! 869: LDUHA_R	lduha	[%r17, %r0] 0x01, %r28
	.word 0xf6d4e143  ! 871: LDSHA_I	ldsha	[%r19, + 0x0143] %asi, %r27
	.word 0xfa94e0e2  ! 872: LDUHA_I	lduha	[%r19, + 0x00e2] %asi, %r29
	.word 0xbc8d8000  ! 874: ANDcc_R	andcc 	%r22, %r0, %r30
cpu_intr_2_64:
	setx	0x210029, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_32:
	mov	0x3c4, %r14
	.word 0xf2f38e80  ! 879: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb01da0f5  ! 880: XOR_I	xor 	%r22, 0x00f5, %r24
iob_intr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_83), 16, 16)) -> intp(2, 0, 33)
	.word 0xb8b5a1dd  ! 885: ORNcc_I	orncc 	%r22, 0x01dd, %r28
	ta	T_CHANGE_HPRIV
iob_intr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_84), 16, 16)) -> intp(2, 0, 28)
	.word 0xfa4d2064  ! 891: LDSB_I	ldsb	[%r20 + 0x0064], %r29
cpu_intr_2_65:
	setx	0x200133, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_85), 16, 16)) -> intp(2, 0, 2b)
iob_intr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_86), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_wr_33:
	mov	0x14, %r14
	.word 0xfaf389e0  ! 899: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_87), 16, 16)) -> intp(2, 0, 33)
	.word 0xfe0de1e1  ! 904: LDUB_I	ldub	[%r23 + 0x01e1], %r31
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983912  ! 907: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1912, %hpstate
cpu_intr_2_66:
	setx	0x21003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_67:
	setx	0x220305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf643801  ! 914: MOVcc_I	<illegal instruction>
	.word 0xf80c61f4  ! 915: LDUB_I	ldub	[%r17 + 0x01f4], %r28
	.word 0xf4cdc020  ! 921: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r26
	.word 0xfec4c020  ! 922: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r31
cpu_intr_2_68:
	setx	0x200330, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_35:
	mov	0x20, %r14
	.word 0xf8db8e60  ! 926: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T2_asi_reg_wr_34:
	mov	0x1d, %r14
	.word 0xfef38e60  ! 927: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb12d8000  ! 928: SLL_R	sll 	%r22, %r0, %r24
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_69:
	setx	0x260336, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_36:
	mov	0x11, %r14
	.word 0xf6db8e80  ! 931: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xfe5ca16e  ! 932: LDX_I	ldx	[%r18 + 0x016e], %r31
T2_asi_reg_rd_37:
	mov	0x36, %r14
	.word 0xf0db84a0  ! 936: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xfa15201f  ! 937: LDUH_I	lduh	[%r20 + 0x001f], %r29
cpu_intr_2_70:
	setx	0x250123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc9520b7  ! 942: LDUHA_I	lduha	[%r20, + 0x00b7] %asi, %r30
	.word 0xf605612e  ! 943: LDUW_I	lduw	[%r21 + 0x012e], %r27
iob_intr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_88), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_wr_35:
	mov	0x1a, %r14
	.word 0xfef38e60  ! 945: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf0558000  ! 946: LDSH_R	ldsh	[%r22 + %r0], %r24
T2_asi_reg_rd_38:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 952: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb1358000  ! 954: SRL_R	srl 	%r22, %r0, %r24
	.word 0xb9540000  ! 960: RDPR_GL	<illegal instruction>
T2_asi_reg_rd_39:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 961: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_89), 16, 16)) -> intp(2, 0, 2a)
	.word 0xb6b52103  ! 965: ORNcc_I	orncc 	%r20, 0x0103, %r27
	.word 0xf8d5e07a  ! 967: LDSHA_I	ldsha	[%r23, + 0x007a] %asi, %r28
T2_asi_reg_wr_36:
	mov	0x2b, %r14
	.word 0xfcf38e40  ! 968: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_90), 16, 16)) -> intp(2, 0, 29)
	.word 0xfa8c8020  ! 973: LDUBA_R	lduba	[%r18, %r0] 0x01, %r29
T2_asi_reg_rd_40:
	mov	0x3c3, %r14
	.word 0xf4db8e80  ! 974: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_91), 16, 16)) -> intp(2, 0, 22)
iob_intr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_92), 16, 16)) -> intp(2, 0, 20)
iob_intr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_93), 16, 16)) -> intp(2, 0, 10)
	.word 0xf2c46011  ! 982: LDSWA_I	ldswa	[%r17, + 0x0011] %asi, %r25
cpu_intr_2_71:
	setx	0x25011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_94), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_72:
	setx	0x27030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa452163  ! 992: LDSW_I	ldsw	[%r20 + 0x0163], %r29
	.word 0x8f902002  ! 994: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
T2_asi_reg_wr_37:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 997: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_95), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_73:
	setx	0x270022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_96), 16, 16)) -> intp(2, 0, 12)
	.word 0xf2c44020  ! 1002: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r25
iob_intr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_97), 16, 16)) -> intp(2, 0, 21)
	ta	T_CHANGE_NONHPRIV
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982b50  ! 1008: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b50, %hpstate
iob_intr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_98), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_rd_41:
	mov	0x3c6, %r14
	.word 0xfcdb84a0  ! 1011: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	ta	T_CHANGE_TO_TL1
iob_intr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_99), 16, 16)) -> intp(2, 0, 32)
	.word 0xf84d0000  ! 1015: LDSB_R	ldsb	[%r20 + %r0], %r28
T2_asi_reg_rd_42:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 1016: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_74:
	setx	0x270339, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_75:
	setx	0x250236, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_76:
	setx	0x270039, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_43:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 1024: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb12d2001  ! 1027: SLL_I	sll 	%r20, 0x0001, %r24
	.word 0xba8c0000  ! 1029: ANDcc_R	andcc 	%r16, %r0, %r29
T2_asi_reg_wr_38:
	mov	0x24, %r14
	.word 0xf0f384a0  ! 1030: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_100), 16, 16)) -> intp(2, 0, 39)
iob_intr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_101), 16, 16)) -> intp(2, 0, a)
	.word 0xfac5c020  ! 1037: LDSWA_R	ldswa	[%r23, %r0] 0x01, %r29
	ta	T_CHANGE_TO_TL0
	.word 0xfc554000  ! 1040: LDSH_R	ldsh	[%r21 + %r0], %r30
	.word 0xf25c4000  ! 1041: LDX_R	ldx	[%r17 + %r0], %r25
T2_asi_reg_rd_44:
	mov	0xc, %r14
	.word 0xf2db8e40  ! 1044: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_102), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_rd_45:
	mov	0x7, %r14
	.word 0xfcdb8e80  ! 1046: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf404c000  ! 1047: LDUW_R	lduw	[%r19 + %r0], %r26
T2_asi_reg_rd_46:
	mov	0x3c1, %r14
	.word 0xfedb8400  ! 1049: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xf6cc206b  ! 1050: LDSBA_I	ldsba	[%r16, + 0x006b] %asi, %r27
iob_intr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_103), 16, 16)) -> intp(2, 0, 3a)
T2_asi_reg_wr_39:
	mov	0x2a, %r14
	.word 0xf4f38e40  ! 1053: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfa15c000  ! 1054: LDUH_R	lduh	[%r23 + %r0], %r29
	.word 0xfc840020  ! 1055: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r30
	.word 0xf2cda12d  ! 1060: LDSBA_I	ldsba	[%r22, + 0x012d] %asi, %r25
	.word 0xf0944020  ! 1062: LDUHA_R	lduha	[%r17, %r0] 0x01, %r24
T2_asi_reg_rd_47:
	mov	0x7, %r14
	.word 0xf6db8400  ! 1064: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T2_asi_reg_wr_40:
	mov	0x15, %r14
	.word 0xf6f38e40  ! 1065: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_48:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 1067: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_104), 16, 16)) -> intp(2, 0, 4)
	.word 0xf4854020  ! 1071: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r26
cpu_intr_2_77:
	setx	0x240317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44c0000  ! 1077: LDSB_R	ldsb	[%r16 + %r0], %r26
	ta	T_CHANGE_TO_TL1
iob_intr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_105), 16, 16)) -> intp(2, 0, 25)
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_49:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 1085: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0x8794a158  ! 1087: WRPR_TT_I	wrpr	%r18, 0x0158, %tt
iob_intr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_106), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_107), 16, 16)) -> intp(2, 0, 32)
	ta	T_CHANGE_TO_TL1
cpu_intr_2_78:
	setx	0x260304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa856032  ! 1095: LDUWA_I	lduwa	[%r21, + 0x0032] %asi, %r29
iob_intr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_108), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_rd_50:
	mov	0xc, %r14
	.word 0xf8db8400  ! 1099: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xfa5d4000  ! 1101: LDX_R	ldx	[%r21 + %r0], %r29
T2_asi_reg_rd_51:
	mov	0x3c7, %r14
	.word 0xf2db8e60  ! 1103: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf6444000  ! 1104: LDSW_R	ldsw	[%r17 + %r0], %r27
T2_asi_reg_rd_52:
	mov	0x1e, %r14
	.word 0xf2db8e60  ! 1106: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_109), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_wr_41:
	mov	0x3c1, %r14
	.word 0xf2f38e60  ! 1109: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf6d40020  ! 1111: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r27
	.word 0xb13d4000  ! 1112: SRA_R	sra 	%r21, %r0, %r24
iob_intr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_110), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_111), 16, 16)) -> intp(2, 0, 29)
	ta	T_CHANGE_NONHPRIV
	.word 0xfe44607b  ! 1120: LDSW_I	ldsw	[%r17 + 0x007b], %r31
	.word 0xbe8c0000  ! 1121: ANDcc_R	andcc 	%r16, %r0, %r31
T2_asi_reg_wr_42:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 1122: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf28c0020  ! 1123: LDUBA_R	lduba	[%r16, %r0] 0x01, %r25
iob_intr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_112), 16, 16)) -> intp(2, 0, 24)
	.word 0xf6c460e1  ! 1125: LDSWA_I	ldswa	[%r17, + 0x00e1] %asi, %r27
	.word 0xf08de0a9  ! 1127: LDUBA_I	lduba	[%r23, + 0x00a9] %asi, %r24
T2_asi_reg_wr_43:
	mov	0x15, %r14
	.word 0xf4f38e40  ! 1134: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf8c44020  ! 1135: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r28
	.word 0xf6546180  ! 1136: LDSH_I	ldsh	[%r17 + 0x0180], %r27
iob_intr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_113), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_rd_53:
	mov	0x17, %r14
	.word 0xf0db89e0  ! 1139: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_114), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_79:
	setx	0x240232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcd461c8  ! 1146: LDSHA_I	ldsha	[%r17, + 0x01c8] %asi, %r30
cpu_intr_2_80:
	setx	0x270031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_115), 16, 16)) -> intp(2, 0, 2d)
	.word 0xfe544000  ! 1154: LDSH_R	ldsh	[%r17 + %r0], %r31
cpu_intr_2_81:
	setx	0x260228, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_54:
	mov	0x3c8, %r14
	.word 0xf2db84a0  ! 1159: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_2_82:
	setx	0x24003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_55:
	mov	0x2, %r14
	.word 0xf0db89e0  ! 1162: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_116), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_83:
	setx	0x27030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44c4000  ! 1166: LDSB_R	ldsb	[%r17 + %r0], %r26
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983a4a  ! 1167: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a4a, %hpstate
	.word 0xf84c2191  ! 1170: LDSB_I	ldsb	[%r16 + 0x0191], %r28
	.word 0xfe558000  ! 1171: LDSH_R	ldsh	[%r22 + %r0], %r31
T2_asi_reg_rd_56:
	mov	0x1b, %r14
	.word 0xf8db84a0  ! 1172: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb7508000  ! 1174: RDPR_TSTATE	<illegal instruction>
	.word 0xf08d8020  ! 1175: LDUBA_R	lduba	[%r22, %r0] 0x01, %r24
	.word 0xf2cc603e  ! 1176: LDSBA_I	ldsba	[%r17, + 0x003e] %asi, %r25
iob_intr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_117), 16, 16)) -> intp(2, 0, 10)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_84:
	setx	0x240116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_85:
	setx	0x260106, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_86:
	setx	0x27001f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_44:
	mov	0x26, %r14
	.word 0xfcf38e40  ! 1187: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_57:
	mov	0x14, %r14
	.word 0xfadb8e40  ! 1188: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_rd_58:
	mov	0x3, %r14
	.word 0xf2db8e40  ! 1190: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xfe542155  ! 1191: LDSH_I	ldsh	[%r16 + 0x0155], %r31
cpu_intr_2_87:
	setx	0x270007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8c8000  ! 1194: ANDcc_R	andcc 	%r18, %r0, %r30
	.word 0xb5508000  ! 1195: RDPR_TSTATE	<illegal instruction>
iob_intr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_118), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf294c020  ! 1197: LDUHA_R	lduha	[%r19, %r0] 0x01, %r25
cpu_intr_2_88:
	setx	0x25033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc948020  ! 1199: LDUHA_R	lduha	[%r18, %r0] 0x01, %r30
	.word 0xbcad217a  ! 1200: ANDNcc_I	andncc 	%r20, 0x017a, %r30
	.word 0xfa84a09f  ! 1201: LDUWA_I	lduwa	[%r18, + 0x009f] %asi, %r29
cpu_intr_2_89:
	setx	0x270100, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983f80  ! 1204: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f80, %hpstate
iob_intr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_119), 16, 16)) -> intp(2, 0, f)
	.word 0xf80c8000  ! 1207: LDUB_R	ldub	[%r18 + %r0], %r28
iob_intr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_120), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_wr_45:
	mov	0x3c5, %r14
	.word 0xf8f38e80  ! 1210: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T2_asi_reg_wr_46:
	mov	0x2d, %r14
	.word 0xf6f38e60  ! 1213: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xfa04c000  ! 1214: LDUW_R	lduw	[%r19 + %r0], %r29
T2_asi_reg_rd_59:
	mov	0x11, %r14
	.word 0xf0db8e40  ! 1217: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T2_asi_reg_wr_47:
	mov	0x20, %r14
	.word 0xf6f38e80  ! 1218: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbd2c3001  ! 1219: SLLX_I	sllx	%r16, 0x0001, %r30
cpu_intr_2_90:
	setx	0x270117, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_121), 16, 16)) -> intp(2, 0, 12)
	.word 0xfe148000  ! 1225: LDUH_R	lduh	[%r18 + %r0], %r31
T2_asi_reg_wr_48:
	mov	0x20, %r14
	.word 0xf0f389e0  ! 1226: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_2_91:
	setx	0x24021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84d4000  ! 1228: LDSB_R	ldsb	[%r21 + %r0], %r28
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982a50  ! 1231: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a50, %hpstate
	.word 0xb824e170  ! 1232: SUB_I	sub 	%r19, 0x0170, %r28
	.word 0xbe048000  ! 1234: ADD_R	add 	%r18, %r0, %r31
	.word 0xfe5ce1ff  ! 1235: LDX_I	ldx	[%r19 + 0x01ff], %r31
	.word 0xf4d4e115  ! 1236: LDSHA_I	ldsha	[%r19, + 0x0115] %asi, %r26
cpu_intr_2_92:
	setx	0x260305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe442157  ! 1241: LDSW_I	ldsw	[%r16 + 0x0157], %r31
	.word 0xfccd8020  ! 1242: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r30
iob_intr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_122), 16, 16)) -> intp(2, 0, 1d)
iob_intr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_123), 16, 16)) -> intp(2, 0, 12)
	.word 0xf40c0000  ! 1245: LDUB_R	ldub	[%r16 + %r0], %r26
	.word 0xf85dc000  ! 1247: LDX_R	ldx	[%r23 + %r0], %r28
	.word 0xf8956028  ! 1248: LDUHA_I	lduha	[%r21, + 0x0028] %asi, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xf6dde168  ! 1252: LDXA_I	ldxa	[%r23, + 0x0168] %asi, %r27
T2_asi_reg_rd_60:
	mov	0x3c4, %r14
	.word 0xf4db8400  ! 1254: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T2_asi_reg_rd_61:
	mov	0x2b, %r14
	.word 0xf2db84a0  ! 1255: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_124), 16, 16)) -> intp(2, 0, c)
iob_intr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_125), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_93:
	setx	0x270306, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_126), 16, 16)) -> intp(2, 0, 31)
	ta	T_CHANGE_TO_TL1
	.word 0xfa95e01a  ! 1265: LDUHA_I	lduha	[%r23, + 0x001a] %asi, %r29
	.word 0xb5500000  ! 1266: RDPR_TPC	<illegal instruction>
	.word 0xfa152036  ! 1267: LDUH_I	lduh	[%r20 + 0x0036], %r29
T2_asi_reg_rd_62:
	mov	0x3c6, %r14
	.word 0xfadb89e0  ! 1268: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfc058000  ! 1270: LDUW_R	lduw	[%r22 + %r0], %r30
cpu_intr_2_94:
	setx	0x260119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc05e124  ! 1273: LDUW_I	lduw	[%r23 + 0x0124], %r30
	.word 0xfa048000  ! 1274: LDUW_R	lduw	[%r18 + %r0], %r29
	.word 0xf44d4000  ! 1276: LDSB_R	ldsb	[%r21 + %r0], %r26
	.word 0xb6bc8000  ! 1278: XNORcc_R	xnorcc 	%r18, %r0, %r27
T2_asi_reg_wr_49:
	mov	0x1d, %r14
	.word 0xfcf384a0  ! 1281: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf4dde135  ! 1282: LDXA_I	ldxa	[%r23, + 0x0135] %asi, %r26
	.word 0xfac58020  ! 1283: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r29
	.word 0xf8cda054  ! 1284: LDSBA_I	ldsba	[%r22, + 0x0054] %asi, %r28
T2_asi_reg_wr_50:
	mov	0x3c7, %r14
	.word 0xf0f389e0  ! 1285: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf2cca164  ! 1286: LDSBA_I	ldsba	[%r18, + 0x0164] %asi, %r25
cpu_intr_2_95:
	setx	0x270210, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_127), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_rd_63:
	mov	0x27, %r14
	.word 0xf4db8e80  ! 1291: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb2058000  ! 1292: ADD_R	add 	%r22, %r0, %r25
T2_asi_reg_rd_64:
	mov	0x3c2, %r14
	.word 0xf6db8e40  ! 1295: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_wr_51:
	mov	0xf, %r14
	.word 0xf2f38e40  ! 1296: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_128), 16, 16)) -> intp(2, 0, 1c)
	.word 0xb17cc400  ! 1304: MOVR_R	movre	%r19, %r0, %r24
T2_asi_reg_rd_65:
	mov	0x12, %r14
	.word 0xfcdb89e0  ! 1305: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_2_96:
	setx	0x27023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_97:
	setx	0x24030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf845214b  ! 1309: LDSW_I	ldsw	[%r20 + 0x014b], %r28
	.word 0xfe454000  ! 1311: LDSW_R	ldsw	[%r21 + %r0], %r31
	.word 0xfe95a167  ! 1315: LDUHA_I	lduha	[%r22, + 0x0167] %asi, %r31
	.word 0xf204616e  ! 1317: LDUW_I	lduw	[%r17 + 0x016e], %r25
T2_asi_reg_rd_66:
	mov	0xb, %r14
	.word 0xfcdb8e80  ! 1322: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_129), 16, 16)) -> intp(2, 0, 6)
	.word 0xfa4de1cd  ! 1326: LDSB_I	ldsb	[%r23 + 0x01cd], %r29
T2_asi_reg_rd_67:
	mov	0x38, %r14
	.word 0xfcdb8e80  ! 1327: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf814a030  ! 1328: LDUH_I	lduh	[%r18 + 0x0030], %r28
	.word 0xb48c8000  ! 1329: ANDcc_R	andcc 	%r18, %r0, %r26
iob_intr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_130), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_131), 16, 16)) -> intp(2, 0, 5)
iob_intr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_132), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_rd_68:
	mov	0x23, %r14
	.word 0xf8db8e40  ! 1342: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_TO_TL1
cpu_intr_2_98:
	setx	0x240028, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_99:
	setx	0x270235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe9c61bc  ! 1346: XORcc_I	xorcc 	%r17, 0x01bc, %r31
	.word 0xf2cda083  ! 1347: LDSBA_I	ldsba	[%r22, + 0x0083] %asi, %r25
iob_intr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_133), 16, 16)) -> intp(2, 0, 27)
	.word 0xb32ce001  ! 1350: SLL_I	sll 	%r19, 0x0001, %r25
	.word 0xf80c207a  ! 1353: LDUB_I	ldub	[%r16 + 0x007a], %r28
iob_intr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_134), 16, 16)) -> intp(2, 0, 36)
T2_asi_reg_rd_69:
	mov	0x3c6, %r14
	.word 0xf4db8e60  ! 1356: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0x8f902001  ! 1364: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe4c4000  ! 1367: LDSB_R	ldsb	[%r17 + %r0], %r31
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982cc0  ! 1368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc0, %hpstate
	.word 0xf6c40020  ! 1369: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r27
	.word 0xfe0c0000  ! 1370: LDUB_R	ldub	[%r16 + %r0], %r31
	.word 0xbeb56107  ! 1371: ORNcc_I	orncc 	%r21, 0x0107, %r31
cpu_intr_2_100:
	setx	0x27010e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_101:
	setx	0x240023, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_102:
	setx	0x280126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc4421ed  ! 1380: ADDC_I	addc 	%r16, 0x01ed, %r30
	.word 0xb8858000  ! 1381: ADDcc_R	addcc 	%r22, %r0, %r28
	.word 0xfccd0020  ! 1384: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r30
T2_asi_reg_rd_70:
	mov	0x3c1, %r14
	.word 0xf2db8400  ! 1385: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_135), 16, 16)) -> intp(2, 0, f)
	.word 0xb4b46171  ! 1394: ORNcc_I	orncc 	%r17, 0x0171, %r26
T2_asi_reg_wr_52:
	mov	0x3c1, %r14
	.word 0xf8f38400  ! 1395: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T2_asi_reg_rd_71:
	mov	0x3c2, %r14
	.word 0xf2db84a0  ! 1396: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf054e029  ! 1397: LDSH_I	ldsh	[%r19 + 0x0029], %r24
cpu_intr_2_103:
	setx	0x2b012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_104:
	setx	0x2b000a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983a4a  ! 1402: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a4a, %hpstate
	.word 0xfa05603d  ! 1405: LDUW_I	lduw	[%r21 + 0x003d], %r29
	.word 0xfc4d8000  ! 1409: LDSB_R	ldsb	[%r22 + %r0], %r30
	.word 0xba35e1c5  ! 1411: ORN_I	orn 	%r23, 0x01c5, %r29
cpu_intr_2_105:
	setx	0x2a000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_53:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 1420: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfc55c000  ! 1421: LDSH_R	ldsh	[%r23 + %r0], %r30
T2_asi_reg_rd_72:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 1422: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_136), 16, 16)) -> intp(2, 0, a)
	.word 0xf28d2187  ! 1428: LDUBA_I	lduba	[%r20, + 0x0187] %asi, %r25
T2_asi_reg_wr_54:
	mov	0x3c7, %r14
	.word 0xf2f38e40  ! 1430: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_rd_73:
	mov	0x2a, %r14
	.word 0xf4db89e0  ! 1431: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982b82  ! 1433: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b82, %hpstate
cpu_intr_2_106:
	setx	0x2b0003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_137), 16, 16)) -> intp(2, 0, 30)
	.word 0xf0c4a058  ! 1438: LDSWA_I	ldswa	[%r18, + 0x0058] %asi, %r24
	.word 0xf2540000  ! 1439: LDSH_R	ldsh	[%r16 + %r0], %r25
T2_asi_reg_wr_55:
	mov	0x34, %r14
	.word 0xfef389e0  ! 1441: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T2_asi_reg_wr_56:
	mov	0x8, %r14
	.word 0xf8f38e80  ! 1442: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf84cc000  ! 1445: LDSB_R	ldsb	[%r19 + %r0], %r28
	.word 0xfc54a015  ! 1446: LDSH_I	ldsh	[%r18 + 0x0015], %r30
	.word 0xf4d48020  ! 1447: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r26
iob_intr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_138), 16, 16)) -> intp(2, 0, 21)
iob_intr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_139), 16, 16)) -> intp(2, 0, 30)
	.word 0xf8444000  ! 1453: LDSW_R	ldsw	[%r17 + %r0], %r28
cpu_intr_2_107:
	setx	0x290117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_108:
	setx	0x28031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04cc000  ! 1456: LDSB_R	ldsb	[%r19 + %r0], %r24
cpu_intr_2_109:
	setx	0x2a033c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_140), 16, 16)) -> intp(2, 0, 1d)
	.word 0xbc344000  ! 1463: SUBC_R	orn 	%r17, %r0, %r30
cpu_intr_2_110:
	setx	0x290328, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_57:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 1465: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbe24a036  ! 1467: SUB_I	sub 	%r18, 0x0036, %r31
	.word 0xf6444000  ! 1470: LDSW_R	ldsw	[%r17 + %r0], %r27
T2_asi_reg_rd_74:
	mov	0x12, %r14
	.word 0xf2db8400  ! 1473: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xfa14e0a3  ! 1475: LDUH_I	lduh	[%r19 + 0x00a3], %r29
T2_asi_reg_wr_58:
	mov	0x19, %r14
	.word 0xf8f38e80  ! 1477: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_2_111:
	setx	0x290124, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982a9a  ! 1479: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9a, %hpstate
iob_intr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_141), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_112:
	setx	0x2b0125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_113:
	setx	0x280133, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_59:
	mov	0x24, %r14
	.word 0xf0f389e0  ! 1489: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf8054000  ! 1490: LDUW_R	lduw	[%r21 + %r0], %r28
cpu_intr_2_114:
	setx	0x2b000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc842066  ! 1494: LDUWA_I	lduwa	[%r16, + 0x0066] %asi, %r30
cpu_intr_2_115:
	setx	0x2a0323, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_60:
	mov	0x1f, %r14
	.word 0xfcf38e80  ! 1499: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_2_116:
	setx	0x2a0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65de161  ! 1505: LDX_I	ldx	[%r23 + 0x0161], %r27
T2_asi_reg_wr_61:
	mov	0x2f, %r14
	.word 0xf2f38e40  ! 1506: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf60d8000  ! 1509: LDUB_R	ldub	[%r22 + %r0], %r27
	.word 0xb634c000  ! 1510: ORN_R	orn 	%r19, %r0, %r27
	.word 0xf4dca07b  ! 1513: LDXA_I	ldxa	[%r18, + 0x007b] %asi, %r26
cpu_intr_2_117:
	setx	0x29031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf084e137  ! 1515: LDUWA_I	lduwa	[%r19, + 0x0137] %asi, %r24
cpu_intr_2_118:
	setx	0x2b0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0d2087  ! 1519: LDUB_I	ldub	[%r20 + 0x0087], %r31
T2_asi_reg_rd_75:
	mov	0xb, %r14
	.word 0xf0db8e80  ! 1520: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T2_asi_reg_rd_76:
	mov	0x7, %r14
	.word 0xf0db84a0  ! 1521: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xfe94e080  ! 1522: LDUHA_I	lduha	[%r19, + 0x0080] %asi, %r31
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982c80  ! 1524: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c80, %hpstate
T2_asi_reg_wr_62:
	mov	0x3c8, %r14
	.word 0xfcf389e0  ! 1525: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbd345000  ! 1528: SRLX_R	srlx	%r17, %r0, %r30
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_63:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 1535: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf0cde019  ! 1537: LDSBA_I	ldsba	[%r23, + 0x0019] %asi, %r24
iob_intr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_142), 16, 16)) -> intp(2, 0, 15)
	.word 0xfedda038  ! 1540: LDXA_I	ldxa	[%r22, + 0x0038] %asi, %r31
cpu_intr_2_119:
	setx	0x2a023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8144000  ! 1545: LDUH_R	lduh	[%r17 + %r0], %r28
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983dc8  ! 1547: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dc8, %hpstate
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe55e135  ! 1554: LDSH_I	ldsh	[%r23 + 0x0135], %r31
T2_asi_reg_rd_77:
	mov	0x21, %r14
	.word 0xf0db8e40  ! 1555: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_143), 16, 16)) -> intp(2, 0, 1)
	.word 0xbc3da148  ! 1558: XNOR_I	xnor 	%r22, 0x0148, %r30
iob_intr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_144), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_120:
	setx	0x2a0205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe94e062  ! 1565: LDUHA_I	lduha	[%r19, + 0x0062] %asi, %r31
	.word 0xb02c0000  ! 1567: ANDN_R	andn 	%r16, %r0, %r24
	ta	T_CHANGE_TO_TL1
	.word 0xfa940020  ! 1571: LDUHA_R	lduha	[%r16, %r0] 0x01, %r29
	.word 0xf6c56020  ! 1572: LDSWA_I	ldswa	[%r21, + 0x0020] %asi, %r27
iob_intr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_145), 16, 16)) -> intp(2, 0, 34)
	.word 0xfe4d6039  ! 1575: LDSB_I	ldsb	[%r21 + 0x0039], %r31
	.word 0xf2cc0020  ! 1579: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r25
cpu_intr_2_121:
	setx	0x2a0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8d5e192  ! 1583: LDSHA_I	ldsha	[%r23, + 0x0192] %asi, %r28
cpu_intr_2_122:
	setx	0x2b033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf2848020  ! 1587: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r25
	.word 0xf4840020  ! 1590: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r26
	.word 0xba1d8000  ! 1591: XOR_R	xor 	%r22, %r0, %r29
	.word 0xfe55a1ca  ! 1592: LDSH_I	ldsh	[%r22 + 0x01ca], %r31
iob_intr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_146), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf414a1cd  ! 1598: LDUH_I	lduh	[%r18 + 0x01cd], %r26
cpu_intr_2_123:
	setx	0x28020e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_124:
	setx	0x280131, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_64:
	mov	0x25, %r14
	.word 0xf2f389e0  ! 1605: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T2_asi_reg_rd_78:
	mov	0x3c6, %r14
	.word 0xf0db8e80  ! 1606: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_2_125:
	setx	0x2a0131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4c50020  ! 1612: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r26
	.word 0xba34e117  ! 1613: ORN_I	orn 	%r19, 0x0117, %r29
	ta	T_CHANGE_NONHPRIV
iob_intr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_147), 16, 16)) -> intp(2, 0, 13)
	.word 0xfccc0020  ! 1625: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r30
iob_intr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_148), 16, 16)) -> intp(2, 0, 2d)
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_65:
	mov	0x3c6, %r14
	.word 0xf8f384a0  ! 1630: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T2_asi_reg_wr_66:
	mov	0x3c2, %r14
	.word 0xfcf38e40  ! 1631: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf204e164  ! 1634: LDUW_I	lduw	[%r19 + 0x0164], %r25
	.word 0xf25c2113  ! 1636: LDX_I	ldx	[%r16 + 0x0113], %r25
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982c40  ! 1637: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c40, %hpstate
	.word 0xfc840020  ! 1638: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r30
T2_asi_reg_wr_67:
	mov	0x23, %r14
	.word 0xf4f38e40  ! 1639: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf08c4020  ! 1642: LDUBA_R	lduba	[%r17, %r0] 0x01, %r24
T2_asi_reg_rd_79:
	mov	0x31, %r14
	.word 0xf2db8e60  ! 1644: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	ta	T_CHANGE_NONHPRIV
	.word 0xfc4d6133  ! 1648: LDSB_I	ldsb	[%r21 + 0x0133], %r30
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983c90  ! 1649: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c90, %hpstate
	.word 0xb32ce001  ! 1651: SLL_I	sll 	%r19, 0x0001, %r25
cpu_intr_2_126:
	setx	0x2b0007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec5601c  ! 1654: LDSWA_I	ldswa	[%r21, + 0x001c] %asi, %r31
cpu_intr_2_127:
	setx	0x2a033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8958020  ! 1659: LDUHA_R	lduha	[%r22, %r0] 0x01, %r28
	.word 0xb245c000  ! 1662: ADDC_R	addc 	%r23, %r0, %r25
T2_asi_reg_rd_80:
	mov	0x3c8, %r14
	.word 0xfadb89e0  ! 1663: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982ad2  ! 1664: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad2, %hpstate
cpu_intr_2_128:
	setx	0x2b000e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_149), 16, 16)) -> intp(2, 0, a)
	.word 0xf25c8000  ! 1669: LDX_R	ldx	[%r18 + %r0], %r25
	.word 0xf4c54020  ! 1674: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r26
cpu_intr_2_129:
	setx	0x2a0126, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_150), 16, 16)) -> intp(2, 0, 39)
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983a8a  ! 1681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a8a, %hpstate
	.word 0xf05461ec  ! 1683: LDSH_I	ldsh	[%r17 + 0x01ec], %r24
T2_asi_reg_rd_81:
	mov	0x3c1, %r14
	.word 0xf6db84a0  ! 1685: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf40c8000  ! 1687: LDUB_R	ldub	[%r18 + %r0], %r26
	.word 0xb32ca001  ! 1688: SLL_I	sll 	%r18, 0x0001, %r25
	.word 0xfc4ca198  ! 1690: LDSB_I	ldsb	[%r18 + 0x0198], %r30
	.word 0xf0d4a0a0  ! 1691: LDSHA_I	ldsha	[%r18, + 0x00a0] %asi, %r24
iob_intr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_151), 16, 16)) -> intp(2, 0, 20)
	.word 0xf6548000  ! 1693: LDSH_R	ldsh	[%r18 + %r0], %r27
	.word 0xf85d8000  ! 1696: LDX_R	ldx	[%r22 + %r0], %r28
cpu_intr_2_130:
	setx	0x2a001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_82:
	mov	0xa, %r14
	.word 0xfedb8400  ! 1699: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T2_asi_reg_wr_68:
	mov	0x2e, %r14
	.word 0xf8f38400  ! 1702: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T2_asi_reg_rd_83:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 1707: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xfa9460b5  ! 1709: LDUHA_I	lduha	[%r17, + 0x00b5] %asi, %r29
	.word 0xf84d4000  ! 1710: LDSB_R	ldsb	[%r21 + %r0], %r28
cpu_intr_2_131:
	setx	0x2a003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_152), 16, 16)) -> intp(2, 0, 2c)
	.word 0xb7341000  ! 1713: SRLX_R	srlx	%r16, %r0, %r27
T2_asi_reg_wr_69:
	mov	0x24, %r14
	.word 0xf4f38e60  ! 1714: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf2cd0020  ! 1716: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r25
	.word 0xb2246189  ! 1717: SUB_I	sub 	%r17, 0x0189, %r25
	.word 0xb02d4000  ! 1718: ANDN_R	andn 	%r21, %r0, %r24
iob_intr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_153), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_132:
	setx	0x2b0124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_154), 16, 16)) -> intp(2, 0, 17)
	ta	T_CHANGE_HPRIV
iob_intr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_155), 16, 16)) -> intp(2, 0, 1a)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x839420ed  ! 1735: WRPR_TNPC_I	wrpr	%r16, 0x00ed, %tnpc
T2_asi_reg_wr_70:
	mov	0x28, %r14
	.word 0xfaf38e40  ! 1736: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_156), 16, 16)) -> intp(2, 0, 6)
iob_intr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_157), 16, 16)) -> intp(2, 0, 21)
	.word 0xfc4c0000  ! 1739: LDSB_R	ldsb	[%r16 + %r0], %r30
	.word 0xf0858020  ! 1741: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r24
	.word 0xfe5dc000  ! 1742: LDX_R	ldx	[%r23 + %r0], %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xf88520b8  ! 1744: LDUWA_I	lduwa	[%r20, + 0x00b8] %asi, %r28
	.word 0xf25d21e4  ! 1746: LDX_I	ldx	[%r20 + 0x01e4], %r25
T2_asi_reg_wr_71:
	mov	0x2a, %r14
	.word 0xf4f38e60  ! 1747: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb69dc000  ! 1753: XORcc_R	xorcc 	%r23, %r0, %r27
	.word 0xfa140000  ! 1755: LDUH_R	lduh	[%r16 + %r0], %r29
cpu_intr_2_133:
	setx	0x2a0308, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982850  ! 1758: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0850, %hpstate
	.word 0xf055e099  ! 1759: LDSH_I	ldsh	[%r23 + 0x0099], %r24
T2_asi_reg_wr_72:
	mov	0x3c5, %r14
	.word 0xf6f38e80  ! 1760: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf20d4000  ! 1762: LDUB_R	ldub	[%r21 + %r0], %r25
	.word 0xb89ca03c  ! 1764: XORcc_I	xorcc 	%r18, 0x003c, %r28
	.word 0xfcc56006  ! 1766: LDSWA_I	ldswa	[%r21, + 0x0006] %asi, %r30
iob_intr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_158), 16, 16)) -> intp(2, 0, c)
	.word 0xfc5d4000  ! 1773: LDX_R	ldx	[%r21 + %r0], %r30
T2_asi_reg_rd_84:
	mov	0x19, %r14
	.word 0xfcdb84a0  ! 1777: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_159), 16, 16)) -> intp(2, 0, 30)
cpu_intr_2_134:
	setx	0x2a0311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6952153  ! 1788: LDUHA_I	lduha	[%r20, + 0x0153] %asi, %r27
cpu_intr_2_135:
	setx	0x2b003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0c4000  ! 1790: LDUB_R	ldub	[%r17 + %r0], %r31
cpu_intr_2_136:
	setx	0x2a011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xfc054000  ! 1795: LDUW_R	lduw	[%r21 + %r0], %r30
T2_asi_reg_rd_85:
	mov	0x1d, %r14
	.word 0xfadb89e0  ! 1798: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfa948020  ! 1803: LDUHA_R	lduha	[%r18, %r0] 0x01, %r29
T2_asi_reg_wr_73:
	mov	0x32, %r14
	.word 0xf6f38e40  ! 1805: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbc052068  ! 1806: ADD_I	add 	%r20, 0x0068, %r30
iob_intr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_160), 16, 16)) -> intp(2, 0, 9)
T2_asi_reg_wr_74:
	mov	0x35, %r14
	.word 0xf0f38e80  ! 1809: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_2_137:
	setx	0x290015, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_161), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_138:
	setx	0x2b0203, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_162), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_wr_75:
	mov	0x8, %r14
	.word 0xf2f38400  ! 1817: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T2_asi_reg_rd_86:
	mov	0x1, %r14
	.word 0xfedb8e60  ! 1822: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xba352127  ! 1823: ORN_I	orn 	%r20, 0x0127, %r29
	.word 0xbcc4c000  ! 1825: ADDCcc_R	addccc 	%r19, %r0, %r30
	.word 0xf4944020  ! 1826: LDUHA_R	lduha	[%r17, %r0] 0x01, %r26
cpu_intr_2_139:
	setx	0x2d0315, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_87:
	mov	0x18, %r14
	.word 0xfadb8e60  ! 1829: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T2_asi_reg_wr_76:
	mov	0x30, %r14
	.word 0xfaf38e40  ! 1832: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf04ce0f4  ! 1834: LDSB_I	ldsb	[%r19 + 0x00f4], %r24
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x819829d2  ! 1835: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d2, %hpstate
iob_intr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_163), 16, 16)) -> intp(2, 0, 3a)
	.word 0xb684c000  ! 1839: ADDcc_R	addcc 	%r19, %r0, %r27
T2_asi_reg_rd_88:
	mov	0x21, %r14
	.word 0xfcdb84a0  ! 1840: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_2_140:
	setx	0xc, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc948020  ! 1843: LDUHA_R	lduha	[%r18, %r0] 0x01, %r30
iob_intr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_164), 16, 16)) -> intp(2, 0, 0)
	.word 0xbe3c60ae  ! 1845: XNOR_I	xnor 	%r17, 0x00ae, %r31
iob_intr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_165), 16, 16)) -> intp(2, 0, c)
	.word 0xf4cc4020  ! 1847: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r26
T2_asi_reg_rd_89:
	mov	0x4, %r14
	.word 0xf2db8e60  ! 1848: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf8d42195  ! 1849: LDSHA_I	ldsha	[%r16, + 0x0195] %asi, %r28
	.word 0xb1643801  ! 1850: MOVcc_I	<illegal instruction>
	.word 0xba858000  ! 1851: ADDcc_R	addcc 	%r22, %r0, %r29
cpu_intr_2_141:
	setx	0x2f0129, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982f48  ! 1853: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f48, %hpstate
cpu_intr_2_142:
	setx	0x2f033b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_166), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_143:
	setx	0x2e031c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_167), 16, 16)) -> intp(2, 0, 2)
	.word 0xf2856162  ! 1860: LDUWA_I	lduwa	[%r21, + 0x0162] %asi, %r25
	.word 0xb43c211c  ! 1863: XNOR_I	xnor 	%r16, 0x011c, %r26
	.word 0xf015605a  ! 1864: LDUH_I	lduh	[%r21 + 0x005a], %r24
	.word 0xfe848020  ! 1865: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r31
	.word 0xb935d000  ! 1867: SRLX_R	srlx	%r23, %r0, %r28
cpu_intr_2_144:
	setx	0x2c001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8c8020  ! 1873: LDUBA_R	lduba	[%r18, %r0] 0x01, %r29
	.word 0xf0540000  ! 1875: LDSH_R	ldsh	[%r16 + %r0], %r24
iob_intr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_168), 16, 16)) -> intp(2, 0, 22)
cpu_intr_2_145:
	setx	0x2d0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4c8000  ! 1884: LDSB_R	ldsb	[%r18 + %r0], %r30
iob_intr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_169), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_wr_77:
	mov	0x2c, %r14
	.word 0xf4f389e0  ! 1886: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf0dd211e  ! 1887: LDXA_I	ldxa	[%r20, + 0x011e] %asi, %r24
	.word 0xf414c000  ! 1889: LDUH_R	lduh	[%r19 + %r0], %r26
iob_intr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_170), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf4558000  ! 1893: LDSH_R	ldsh	[%r22 + %r0], %r26
	.word 0xb4950000  ! 1895: ORcc_R	orcc 	%r20, %r0, %r26
	.word 0xb0c5e03f  ! 1897: ADDCcc_I	addccc 	%r23, 0x003f, %r24
T2_asi_reg_rd_90:
	mov	0x2c, %r14
	.word 0xf8db8e80  ! 1899: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T2_asi_reg_rd_91:
	mov	0x24, %r14
	.word 0xf2db8e60  ! 1902: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbe9cc000  ! 1904: XORcc_R	xorcc 	%r19, %r0, %r31
	.word 0xfa848020  ! 1905: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r29
iob_intr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_171), 16, 16)) -> intp(2, 0, 9)
T2_asi_reg_wr_78:
	mov	0x3c0, %r14
	.word 0xfcf384a0  ! 1909: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_79:
	mov	0x7, %r14
	.word 0xf0f384a0  ! 1914: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf84c8000  ! 1917: LDSB_R	ldsb	[%r18 + %r0], %r28
	.word 0xfe4cc000  ! 1919: LDSB_R	ldsb	[%r19 + %r0], %r31
cpu_intr_2_146:
	setx	0x2c0005, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_80:
	mov	0x11, %r14
	.word 0xf8f38e40  ! 1923: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_172), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_wr_81:
	mov	0x3c5, %r14
	.word 0xfcf38e80  ! 1928: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_2_147:
	setx	0x2d0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8544000  ! 1933: LDSH_R	ldsh	[%r17 + %r0], %r28
	ta	T_CHANGE_TO_TL0
	.word 0xfc04a088  ! 1936: LDUW_I	lduw	[%r18 + 0x0088], %r30
T2_asi_reg_rd_92:
	mov	0x3c8, %r14
	.word 0xfadb8400  ! 1937: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	ta	T_CHANGE_HPRIV
	.word 0xf2958020  ! 1939: LDUHA_R	lduha	[%r22, %r0] 0x01, %r25
	.word 0xfcc4e1cf  ! 1943: LDSWA_I	ldswa	[%r19, + 0x01cf] %asi, %r30
	ta	T_CHANGE_HPRIV
iob_intr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_173), 16, 16)) -> intp(2, 0, 24)
	.word 0xfc558000  ! 1947: LDSH_R	ldsh	[%r22 + %r0], %r30
	.word 0xb49dc000  ! 1948: XORcc_R	xorcc 	%r23, %r0, %r26
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_82:
	mov	0x3c6, %r14
	.word 0xfcf389e0  ! 1953: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T2_asi_reg_rd_93:
	mov	0x3c6, %r14
	.word 0xf4db8e60  ! 1954: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xfe8cc020  ! 1958: LDUBA_R	lduba	[%r19, %r0] 0x01, %r31
T2_asi_reg_rd_94:
	mov	0x14, %r14
	.word 0xf6db84a0  ! 1960: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_2_148:
	setx	0x2e020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00ce132  ! 1963: LDUB_I	ldub	[%r19 + 0x0132], %r24
iob_intr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_174), 16, 16)) -> intp(2, 0, 3a)
	.word 0xb72d2001  ! 1965: SLL_I	sll 	%r20, 0x0001, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xb8148000  ! 1973: OR_R	or 	%r18, %r0, %r28
	.word 0xf405209e  ! 1975: LDUW_I	lduw	[%r20 + 0x009e], %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf8d48020  ! 1977: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r28
	.word 0xfe5c0000  ! 1979: LDX_R	ldx	[%r16 + %r0], %r31
cpu_intr_2_149:
	setx	0x2e0108, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_175), 16, 16)) -> intp(2, 0, 26)
	ta	T_CHANGE_HPRIV
	.word 0xf255c000  ! 1992: LDSH_R	ldsh	[%r23 + %r0], %r25
	.word 0xf45de0fd  ! 1995: LDX_I	ldx	[%r23 + 0x00fd], %r26
T2_asi_reg_wr_83:
	mov	0x2c, %r14
	.word 0xf8f38400  ! 1996: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_176), 16, 16)) -> intp(2, 0, 30)
	.word 0xf8550000  ! 2003: LDSH_R	ldsh	[%r20 + %r0], %r28
T2_asi_reg_rd_95:
	mov	0x3c1, %r14
	.word 0xfadb8e60  ! 2004: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T2_asi_reg_rd_96:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 2005: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf05c6041  ! 2015: LDX_I	ldx	[%r17 + 0x0041], %r24
	.word 0xfc8dc020  ! 2018: LDUBA_R	lduba	[%r23, %r0] 0x01, %r30
cpu_intr_2_150:
	setx	0x2e0136, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_177), 16, 16)) -> intp(2, 0, 0)
	.word 0xbf480000  ! 2026: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xfc04c000  ! 2028: LDUW_R	lduw	[%r19 + %r0], %r30
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983e08  ! 2034: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e08, %hpstate
	.word 0xfecc0020  ! 2036: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r31
cpu_intr_2_151:
	setx	0x2d0017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0458000  ! 2038: LDSW_R	ldsw	[%r22 + %r0], %r24
	.word 0xf6dd60e3  ! 2042: LDXA_I	ldxa	[%r21, + 0x00e3] %asi, %r27
iob_intr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_178), 16, 16)) -> intp(2, 0, 2f)
T2_asi_reg_rd_97:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 2047: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf2d5c020  ! 2050: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r25
T2_asi_reg_rd_98:
	mov	0x3c1, %r14
	.word 0xfcdb8e80  ! 2054: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xf045c000  ! 2057: LDSW_R	ldsw	[%r23 + %r0], %r24
	.word 0xf805a1fe  ! 2058: LDUW_I	lduw	[%r22 + 0x01fe], %r28
iob_intr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_179), 16, 16)) -> intp(2, 0, d)
	.word 0xfa04607a  ! 2062: LDUW_I	lduw	[%r17 + 0x007a], %r29
iob_intr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_180), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf6cd0020  ! 2067: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r27
iob_intr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_181), 16, 16)) -> intp(2, 0, 6)
	.word 0xb52c3001  ! 2073: SLLX_I	sllx	%r16, 0x0001, %r26
	.word 0xfe556190  ! 2075: LDSH_I	ldsh	[%r21 + 0x0190], %r31
	.word 0xf005a1ff  ! 2076: LDUW_I	lduw	[%r22 + 0x01ff], %r24
	ta	T_CHANGE_HPRIV
	.word 0xf415a039  ! 2078: LDUH_I	lduh	[%r22 + 0x0039], %r26
	.word 0xf2d4c020  ! 2081: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r25
T2_asi_reg_rd_99:
	mov	0x3c7, %r14
	.word 0xf2db8e60  ! 2082: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T2_asi_reg_wr_84:
	mov	0x3c5, %r14
	.word 0xf8f38e60  ! 2083: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T2_asi_reg_wr_85:
	mov	0x9, %r14
	.word 0xfef38e40  ! 2085: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_182), 16, 16)) -> intp(2, 0, 17)
	.word 0xf8c5a138  ! 2091: LDSWA_I	ldswa	[%r22, + 0x0138] %asi, %r28
	.word 0xfa0c0000  ! 2092: LDUB_R	ldub	[%r16 + %r0], %r29
	.word 0xf45cc000  ! 2094: LDX_R	ldx	[%r19 + %r0], %r26
iob_intr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_183), 16, 16)) -> intp(2, 0, 1)
cpu_intr_2_152:
	setx	0x2c0124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_153:
	setx	0x2e023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc1c2090  ! 2104: XOR_I	xor 	%r16, 0x0090, %r30
cpu_intr_2_154:
	setx	0x2e0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe15e010  ! 2106: LDUH_I	lduh	[%r23 + 0x0010], %r31
cpu_intr_2_155:
	setx	0x2c003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64461c1  ! 2108: LDSW_I	ldsw	[%r17 + 0x01c1], %r27
cpu_intr_2_156:
	setx	0x2d0330, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_86:
	mov	0x8, %r14
	.word 0xf8f38e40  ! 2110: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfa0dc000  ! 2111: LDUB_R	ldub	[%r23 + %r0], %r29
T2_asi_reg_wr_87:
	mov	0x22, %r14
	.word 0xf8f38400  ! 2114: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_2_157:
	setx	0x2e0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2cd2162  ! 2121: LDSBA_I	ldsba	[%r20, + 0x0162] %asi, %r25
	.word 0xf04c0000  ! 2122: LDSB_R	ldsb	[%r16 + %r0], %r24
T2_asi_reg_wr_88:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 2123: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb00ca160  ! 2126: AND_I	and 	%r18, 0x0160, %r24
cpu_intr_2_158:
	setx	0x2d033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_100:
	mov	0x2d, %r14
	.word 0xfedb8e40  ! 2130: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_159:
	setx	0x2c013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba0ca1ca  ! 2134: AND_I	and 	%r18, 0x01ca, %r29
T2_asi_reg_wr_89:
	mov	0x3c2, %r14
	.word 0xf0f384a0  ! 2136: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_184), 16, 16)) -> intp(2, 0, 5)
iob_intr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_185), 16, 16)) -> intp(2, 0, 35)
	.word 0xf4d40020  ! 2142: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r26
T2_asi_reg_rd_101:
	mov	0x3c4, %r14
	.word 0xf6db8e40  ! 2143: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_2_160:
	setx	0x2d0206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4844020  ! 2145: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r26
iob_intr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_186), 16, 16)) -> intp(2, 0, 11)
cpu_intr_2_161:
	setx	0x2e013e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_187), 16, 16)) -> intp(2, 0, 8)
	.word 0xf8dca1bf  ! 2152: LDXA_I	ldxa	[%r18, + 0x01bf] %asi, %r28
cpu_intr_2_162:
	setx	0x2f0102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_188), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf0046049  ! 2157: LDUW_I	lduw	[%r17 + 0x0049], %r24
iob_intr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_189), 16, 16)) -> intp(2, 0, 1c)
	.word 0xfec44020  ! 2159: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r31
T2_asi_reg_rd_102:
	mov	0x3c1, %r14
	.word 0xf8db8e80  ! 2160: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf885c020  ! 2161: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r28
	.word 0xfc5d8000  ! 2162: LDX_R	ldx	[%r22 + %r0], %r30
iob_intr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_190), 16, 16)) -> intp(2, 0, 1f)
cpu_intr_2_163:
	setx	0x2f0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe842048  ! 2170: ADDcc_I	addcc 	%r16, 0x0048, %r31
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982d00  ! 2172: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d00, %hpstate
T2_asi_reg_wr_90:
	mov	0x3c2, %r14
	.word 0xf6f389e0  ! 2173: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T2_asi_reg_rd_103:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 2176: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfec4c020  ! 2182: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r31
	ta	T_CHANGE_HPRIV
	.word 0xf85c4000  ! 2185: LDX_R	ldx	[%r17 + %r0], %r28
cpu_intr_2_164:
	setx	0x2e002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2454000  ! 2189: LDSW_R	ldsw	[%r21 + %r0], %r25
	.word 0xb094c000  ! 2193: ORcc_R	orcc 	%r19, %r0, %r24
iob_intr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_191), 16, 16)) -> intp(2, 0, 5)
	.word 0xa1902001  ! 2196: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	ta	T_CHANGE_TO_TL0
cpu_intr_2_165:
	setx	0x2c032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d48020  ! 2201: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r26
	.word 0xfe85204b  ! 2205: LDUWA_I	lduwa	[%r20, + 0x004b] %asi, %r31
T2_asi_reg_rd_104:
	mov	0x35, %r14
	.word 0xfcdb8400  ! 2209: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xfc044000  ! 2211: LDUW_R	lduw	[%r17 + %r0], %r30
iob_intr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_192), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_166:
	setx	0x2d0230, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_91:
	mov	0x3, %r14
	.word 0xf0f384a0  ! 2219: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xfa146186  ! 2220: LDUH_I	lduh	[%r17 + 0x0186], %r29
cpu_intr_2_167:
	setx	0x2c0132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_193), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_168:
	setx	0x2e0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9c8000  ! 2227: XORcc_R	xorcc 	%r18, %r0, %r29
T2_asi_reg_wr_92:
	mov	0x3c8, %r14
	.word 0xf6f38e60  ! 2230: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xbf508000  ! 2231: RDPR_TSTATE	<illegal instruction>
cpu_intr_2_169:
	setx	0x2f0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfacc61df  ! 2236: LDSBA_I	ldsba	[%r17, + 0x01df] %asi, %r29
cpu_intr_2_170:
	setx	0x2d0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf695a002  ! 2238: LDUHA_I	lduha	[%r22, + 0x0002] %asi, %r27
	ta	T_CHANGE_HPRIV
iob_intr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_194), 16, 16)) -> intp(2, 0, 2e)
iob_intr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_195), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf055a1eb  ! 2244: LDSH_I	ldsh	[%r22 + 0x01eb], %r24
	.word 0xf28d6076  ! 2245: LDUBA_I	lduba	[%r21, + 0x0076] %asi, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_196), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_171:
	setx	0x2f0219, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_93:
	mov	0x16, %r14
	.word 0xfaf38e60  ! 2249: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf455a000  ! 2250: LDSH_I	ldsh	[%r22 + 0x0000], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_197), 16, 16)) -> intp(2, 0, 28)
iob_intr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_198), 16, 16)) -> intp(2, 0, d)
	.word 0xfcccc020  ! 2260: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r30
	setx	data_start_2, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983c88  ! 2261: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c88, %hpstate
cpu_intr_2_172:
	setx	0x2d0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfcc58020  ! 2268: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r30
	.word 0xbc2c60fc  ! 2269: ANDN_I	andn 	%r17, 0x00fc, %r30
T2_asi_reg_rd_105:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 2270: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_199), 16, 16)) -> intp(2, 0, 2)
	ta	T_CHANGE_HPRIV
	.word 0xbaa44000  ! 2276: SUBcc_R	subcc 	%r17, %r0, %r29
	.word 0xf85d4000  ! 2277: LDX_R	ldx	[%r21 + %r0], %r28
	.word 0xf6cdc020  ! 2278: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r27
	.word 0xfc544000  ! 2281: LDSH_R	ldsh	[%r17 + %r0], %r30
T2_asi_reg_rd_106:
	mov	0x7, %r14
	.word 0xfadb8e80  ! 2287: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T2_asi_reg_rd_107:
	mov	0x9, %r14
	.word 0xfedb84a0  ! 2290: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T2_asi_reg_rd_108:
	mov	0x3c2, %r14
	.word 0xf4db8e40  ! 2292: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_wr_94:
	mov	0x19, %r14
	.word 0xf6f38400  ! 2293: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T2_asi_reg_rd_109:
	mov	0x23, %r14
	.word 0xfcdb8e40  ! 2294: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfa04e05c  ! 2295: LDUW_I	lduw	[%r19 + 0x005c], %r29
	.word 0xfc5cc000  ! 2306: LDX_R	ldx	[%r19 + %r0], %r30
iob_intr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_200), 16, 16)) -> intp(2, 0, 2b)
	.word 0xfccca0ce  ! 2309: LDSBA_I	ldsba	[%r18, + 0x00ce] %asi, %r30
T2_asi_reg_wr_95:
	mov	0x26, %r14
	.word 0xfcf38e40  ! 2310: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf6148000  ! 2311: LDUH_R	lduh	[%r18 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_173:
	setx	0x300209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcc5219c  ! 2316: ADDCcc_I	addccc 	%r20, 0x019c, %r30
T2_asi_reg_wr_96:
	mov	0x18, %r14
	.word 0xf8f38e40  ! 2318: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_2_174:
	setx	0x310102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_175:
	setx	0x33021c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_201), 16, 16)) -> intp(2, 0, 4)
	.word 0xf484a039  ! 2326: LDUWA_I	lduwa	[%r18, + 0x0039] %asi, %r26
	.word 0xb21d4000  ! 2329: XOR_R	xor 	%r21, %r0, %r25
	.word 0xf604e1e8  ! 2333: LDUW_I	lduw	[%r19 + 0x01e8], %r27
	.word 0xf0dda0af  ! 2336: LDXA_I	ldxa	[%r22, + 0x00af] %asi, %r24
iob_intr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_202), 16, 16)) -> intp(2, 0, 25)
	.word 0xfccce1a1  ! 2341: LDSBA_I	ldsba	[%r19, + 0x01a1] %asi, %r30
T2_asi_reg_rd_110:
	mov	0x35, %r14
	.word 0xfadb8e40  ! 2346: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf454c000  ! 2347: LDSH_R	ldsh	[%r19 + %r0], %r26
cpu_intr_2_176:
	setx	0x330327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc15c000  ! 2351: LDUH_R	lduh	[%r23 + %r0], %r30
iob_intr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_203), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_177:
	setx	0x320237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4421ee  ! 2357: LDSW_I	ldsw	[%r16 + 0x01ee], %r29
	.word 0xfc954020  ! 2358: LDUHA_R	lduha	[%r21, %r0] 0x01, %r30
cpu_intr_2_178:
	setx	0x320026, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe8d4020  ! 2361: LDUBA_R	lduba	[%r21, %r0] 0x01, %r31
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983f9a  ! 2362: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f9a, %hpstate
T2_asi_reg_wr_97:
	mov	0x27, %r14
	.word 0xf2f38e60  ! 2363: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf0848020  ! 2364: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r24
	.word 0xf005c000  ! 2365: LDUW_R	lduw	[%r23 + %r0], %r24
	.word 0xfad5e0b8  ! 2369: LDSHA_I	ldsha	[%r23, + 0x00b8] %asi, %r29
T2_asi_reg_wr_98:
	mov	0x16, %r14
	.word 0xf6f38e80  ! 2370: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf0d4e141  ! 2371: LDSHA_I	ldsha	[%r19, + 0x0141] %asi, %r24
	.word 0xf28cc020  ! 2372: LDUBA_R	lduba	[%r19, %r0] 0x01, %r25
	.word 0xb8b4209c  ! 2373: SUBCcc_I	orncc 	%r16, 0x009c, %r28
	.word 0xf4d48020  ! 2375: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r26
iob_intr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_204), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_wr_99:
	mov	0x3c7, %r14
	.word 0xf0f38e40  ! 2379: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_205), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_179:
	setx	0x300309, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_180:
	setx	0x310320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf055c000  ! 2390: LDSH_R	ldsh	[%r23 + %r0], %r24
cpu_intr_2_181:
	setx	0x31020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_206), 16, 16)) -> intp(2, 0, 6)
	.word 0xf00cc000  ! 2394: LDUB_R	ldub	[%r19 + %r0], %r24
	.word 0xb6ad4000  ! 2395: ANDNcc_R	andncc 	%r21, %r0, %r27
iob_intr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_207), 16, 16)) -> intp(2, 0, 4)
iob_intr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_208), 16, 16)) -> intp(2, 0, 34)
cpu_intr_2_182:
	setx	0x300231, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_111:
	mov	0x5, %r14
	.word 0xf2db8e80  ! 2400: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_2_183:
	setx	0x32012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d50020  ! 2403: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r27
	.word 0xbe05c000  ! 2407: ADD_R	add 	%r23, %r0, %r31
iob_intr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_209), 16, 16)) -> intp(2, 0, 16)
iob_intr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_210), 16, 16)) -> intp(2, 0, 39)
	.word 0xf204a071  ! 2412: LDUW_I	lduw	[%r18 + 0x0071], %r25
iob_intr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_211), 16, 16)) -> intp(2, 0, 1b)
cpu_intr_2_184:
	setx	0x320326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa448000  ! 2415: LDSW_R	ldsw	[%r18 + %r0], %r29
	.word 0xbf518000  ! 2416: RDPR_PSTATE	<illegal instruction>
	.word 0xf8cca0fc  ! 2418: LDSBA_I	ldsba	[%r18, + 0x00fc] %asi, %r28
cpu_intr_2_185:
	setx	0x320223, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_212), 16, 16)) -> intp(2, 0, 18)
	setx	data_start_0, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983fda  ! 2425: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fda, %hpstate
cpu_intr_2_186:
	setx	0x30003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_213), 16, 16)) -> intp(2, 0, 5)
	.word 0xf88c0020  ! 2431: LDUBA_R	lduba	[%r16, %r0] 0x01, %r28
cpu_intr_2_187:
	setx	0x32001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa046135  ! 2433: LDUW_I	lduw	[%r17 + 0x0135], %r29
cpu_intr_2_188:
	setx	0x31002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8948000  ! 2437: ORcc_R	orcc 	%r18, %r0, %r28
	.word 0xf2d521ae  ! 2439: LDSHA_I	ldsha	[%r20, + 0x01ae] %asi, %r25
	.word 0xfac460ae  ! 2440: LDSWA_I	ldswa	[%r17, + 0x00ae] %asi, %r29
iob_intr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_214), 16, 16)) -> intp(2, 0, 1d)
	.word 0xbc1d2134  ! 2444: XOR_I	xor 	%r20, 0x0134, %r30
iob_intr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_215), 16, 16)) -> intp(2, 0, 19)
	.word 0xf0554000  ! 2450: LDSH_R	ldsh	[%r21 + %r0], %r24
cpu_intr_2_189:
	setx	0x310128, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_wr_100:
	mov	0x24, %r14
	.word 0xf2f38e60  ! 2455: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_216), 16, 16)) -> intp(2, 0, 24)
cpu_intr_2_190:
	setx	0x320109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_217), 16, 16)) -> intp(2, 0, 28)
	.word 0xfec4e156  ! 2467: LDSWA_I	ldswa	[%r19, + 0x0156] %asi, %r31
T2_asi_reg_wr_101:
	mov	0x3c1, %r14
	.word 0xf4f389e0  ! 2468: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T2_asi_reg_rd_112:
	mov	0x38, %r14
	.word 0xf8db8e80  ! 2471: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb0442179  ! 2474: ADDC_I	addc 	%r16, 0x0179, %r24
cpu_intr_2_191:
	setx	0x320113, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_113:
	mov	0x29, %r14
	.word 0xf4db84a0  ! 2479: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbd3d7001  ! 2481: SRAX_I	srax	%r21, 0x0001, %r30
iob_intr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_218), 16, 16)) -> intp(2, 0, 7)
	.word 0xf4446101  ! 2485: LDSW_I	ldsw	[%r17 + 0x0101], %r26
	.word 0xb6a4a187  ! 2486: SUBcc_I	subcc 	%r18, 0x0187, %r27
	.word 0xf454c000  ! 2488: LDSH_R	ldsh	[%r19 + %r0], %r26
cpu_intr_2_192:
	setx	0x330130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60c4000  ! 2497: LDUB_R	ldub	[%r17 + %r0], %r27
iob_intr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_219), 16, 16)) -> intp(2, 0, 38)
	.word 0xfc840020  ! 2500: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r30
T2_asi_reg_rd_114:
	mov	0x3c3, %r14
	.word 0xf4db89e0  ! 2501: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T2_asi_reg_rd_115:
	mov	0x23, %r14
	.word 0xfedb84a0  ! 2503: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf88c6162  ! 2508: LDUBA_I	lduba	[%r17, + 0x0162] %asi, %r28
	.word 0xf00c8000  ! 2509: LDUB_R	ldub	[%r18 + %r0], %r24
cpu_intr_2_193:
	setx	0x300205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65cc000  ! 2511: LDX_R	ldx	[%r19 + %r0], %r27
iob_intr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_220), 16, 16)) -> intp(2, 0, 27)
	.word 0xf884a00a  ! 2517: LDUWA_I	lduwa	[%r18, + 0x000a] %asi, %r28
	.word 0xb0ade150  ! 2519: ANDNcc_I	andncc 	%r23, 0x0150, %r24
	.word 0xfc94e17d  ! 2521: LDUHA_I	lduha	[%r19, + 0x017d] %asi, %r30
cpu_intr_2_194:
	setx	0x30002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf445a0cf  ! 2523: LDSW_I	ldsw	[%r22 + 0x00cf], %r26
	.word 0xb93cf001  ! 2524: SRAX_I	srax	%r19, 0x0001, %r28
cpu_intr_2_195:
	setx	0x300021, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_196:
	setx	0x31000a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_221), 16, 16)) -> intp(2, 0, 39)
	.word 0xb37c8400  ! 2540: MOVR_R	movre	%r18, %r0, %r25
T2_asi_reg_wr_102:
	mov	0x28, %r14
	.word 0xf4f38e60  ! 2543: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_222), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_rd_116:
	mov	0x30, %r14
	.word 0xf6db84a0  ! 2547: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xfa8d8020  ! 2552: LDUBA_R	lduba	[%r22, %r0] 0x01, %r29
	.word 0xfc458000  ! 2554: LDSW_R	ldsw	[%r22 + %r0], %r30
T2_asi_reg_rd_117:
	mov	0x3c1, %r14
	.word 0xf8db8e80  ! 2555: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf8cce14a  ! 2561: LDSBA_I	ldsba	[%r19, + 0x014a] %asi, %r28
iob_intr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_223), 16, 16)) -> intp(2, 0, 26)
	.word 0xf4c58020  ! 2567: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf45c2108  ! 2571: LDX_I	ldx	[%r16 + 0x0108], %r26
T2_asi_reg_rd_118:
	mov	0x19, %r14
	.word 0xfcdb84a0  ! 2578: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xb6c4e10f  ! 2583: ADDCcc_I	addccc 	%r19, 0x010f, %r27
	.word 0xfa15a0ca  ! 2585: LDUH_I	lduh	[%r22 + 0x00ca], %r29
cpu_intr_2_197:
	setx	0x32031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982ac2  ! 2587: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac2, %hpstate
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81982d82  ! 2588: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d82, %hpstate
T2_asi_reg_wr_103:
	mov	0x28, %r14
	.word 0xf0f38e60  ! 2589: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xfe856074  ! 2590: LDUWA_I	lduwa	[%r21, + 0x0074] %asi, %r31
iob_intr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_224), 16, 16)) -> intp(2, 0, 18)
iob_intr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_225), 16, 16)) -> intp(2, 0, 1)
	.word 0xbd2c7001  ! 2597: SLLX_I	sllx	%r17, 0x0001, %r30
	.word 0xf2c420a8  ! 2598: LDSWA_I	ldswa	[%r16, + 0x00a8] %asi, %r25
	.word 0xf20c0000  ! 2600: LDUB_R	ldub	[%r16 + %r0], %r25
	.word 0xf48dc020  ! 2601: LDUBA_R	lduba	[%r23, %r0] 0x01, %r26
	ta	T_CHANGE_TO_TL1
	.word 0xf8842079  ! 2604: LDUWA_I	lduwa	[%r16, + 0x0079] %asi, %r28
T2_asi_reg_rd_119:
	mov	0x2e, %r14
	.word 0xfadb8400  ! 2605: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfaccc020  ! 2608: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r29
T2_asi_reg_rd_120:
	mov	0x2a, %r14
	.word 0xfedb8e40  ! 2609: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_rd_121:
	mov	0x1a, %r14
	.word 0xf4db8e40  ! 2612: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfa44e196  ! 2614: LDSW_I	ldsw	[%r19 + 0x0196], %r29
iob_intr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_226), 16, 16)) -> intp(2, 0, 7)
cpu_intr_2_198:
	setx	0x310127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe452044  ! 2619: LDSW_I	ldsw	[%r20 + 0x0044], %r31
	.word 0xfa4de1e0  ! 2620: LDSB_I	ldsb	[%r23 + 0x01e0], %r29
	.word 0xf20d0000  ! 2622: LDUB_R	ldub	[%r20 + %r0], %r25
iob_intr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_227), 16, 16)) -> intp(2, 0, 1d)
	.word 0xfe84615c  ! 2625: LDUWA_I	lduwa	[%r17, + 0x015c] %asi, %r31
	.word 0xf0dda1ba  ! 2630: LDXA_I	ldxa	[%r22, + 0x01ba] %asi, %r24
	.word 0xf495e07d  ! 2631: LDUHA_I	lduha	[%r23, + 0x007d] %asi, %r26
	.word 0xf0cd8020  ! 2632: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r24
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982ed2  ! 2634: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed2, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_199:
	setx	0x310208, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_228), 16, 16)) -> intp(2, 0, 1b)
T2_asi_reg_wr_104:
	mov	0x36, %r14
	.word 0xfef38400  ! 2640: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_wr_105:
	mov	0x2d, %r14
	.word 0xf0f38400  ! 2644: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf2444000  ! 2646: LDSW_R	ldsw	[%r17 + %r0], %r25
	.word 0xfe158000  ! 2650: LDUH_R	lduh	[%r22 + %r0], %r31
T2_asi_reg_rd_122:
	mov	0x3c2, %r14
	.word 0xfcdb8e60  ! 2651: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb4154000  ! 2654: OR_R	or 	%r21, %r0, %r26
iob_intr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_229), 16, 16)) -> intp(2, 0, 3d)
	.word 0xbc45e039  ! 2656: ADDC_I	addc 	%r23, 0x0039, %r30
T2_asi_reg_wr_106:
	mov	0x2, %r14
	.word 0xfaf38e60  ! 2658: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T2_asi_reg_wr_107:
	mov	0x15, %r14
	.word 0xf4f38400  ! 2659: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf6454000  ! 2660: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xf40d8000  ! 2663: LDUB_R	ldub	[%r22 + %r0], %r26
	.word 0xfa440000  ! 2664: LDSW_R	ldsw	[%r16 + %r0], %r29
iob_intr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_230), 16, 16)) -> intp(2, 0, 2)
	.word 0xfed4a0c7  ! 2669: LDSHA_I	ldsha	[%r18, + 0x00c7] %asi, %r31
iob_intr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_231), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_200:
	setx	0x300333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_232), 16, 16)) -> intp(2, 0, 23)
T2_asi_reg_wr_108:
	mov	0x24, %r14
	.word 0xfcf38e80  ! 2674: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbf35b001  ! 2676: SRLX_I	srlx	%r22, 0x0001, %r31
	.word 0xf4554000  ! 2677: LDSH_R	ldsh	[%r21 + %r0], %r26
T2_asi_reg_wr_109:
	mov	0x35, %r14
	.word 0xfcf38e40  ! 2678: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf4d4e19b  ! 2679: LDSHA_I	ldsha	[%r19, + 0x019b] %asi, %r26
iob_intr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_233), 16, 16)) -> intp(2, 0, 25)
iob_intr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_234), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf6d48020  ! 2685: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r27
	.word 0xf28520cd  ! 2687: LDUWA_I	lduwa	[%r20, + 0x00cd] %asi, %r25
T2_asi_reg_rd_123:
	mov	0x31, %r14
	.word 0xfadb8e80  ! 2693: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T2_asi_reg_wr_110:
	mov	0x29, %r14
	.word 0xf4f389e0  ! 2697: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T2_asi_reg_rd_124:
	mov	0x3c2, %r14
	.word 0xfadb84a0  ! 2701: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T2_asi_reg_rd_125:
	mov	0x27, %r14
	.word 0xf0db84a0  ! 2702: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xb6352103  ! 2706: ORN_I	orn 	%r20, 0x0103, %r27
iob_intr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_235), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_201:
	setx	0x300231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c44020  ! 2714: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r24
iob_intr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_236), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_237), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfe0c8000  ! 2723: LDUB_R	ldub	[%r18 + %r0], %r31
cpu_intr_2_202:
	setx	0x310213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab40000  ! 2726: SUBCcc_R	orncc 	%r16, %r0, %r29
	.word 0xb6340000  ! 2728: ORN_R	orn 	%r16, %r0, %r27
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_203:
	setx	0x300206, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_126:
	mov	0x0, %r14
	.word 0xfedb8e40  ! 2734: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfc5de01d  ! 2736: LDX_I	ldx	[%r23 + 0x001d], %r30
	.word 0xbe0cc000  ! 2737: AND_R	and 	%r19, %r0, %r31
	.word 0xf20ca1f4  ! 2738: LDUB_I	ldub	[%r18 + 0x01f4], %r25
iob_intr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_238), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf844e193  ! 2740: LDSW_I	ldsw	[%r19 + 0x0193], %r28
	.word 0xf04d6067  ! 2741: LDSB_I	ldsb	[%r21 + 0x0067], %r24
iob_intr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_239), 16, 16)) -> intp(2, 0, 25)
	.word 0xfcd4c020  ! 2746: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xf854a133  ! 2754: LDSH_I	ldsh	[%r18 + 0x0133], %r28
T2_asi_reg_wr_111:
	mov	0x13, %r14
	.word 0xf2f38e80  ! 2756: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_2_204:
	setx	0x370221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4ce028  ! 2763: LDSB_I	ldsb	[%r19 + 0x0028], %r29
	.word 0xf65c8000  ! 2766: LDX_R	ldx	[%r18 + %r0], %r27
	.word 0xf40d206e  ! 2768: LDUB_I	ldub	[%r20 + 0x006e], %r26
	.word 0xf614e13f  ! 2772: LDUH_I	lduh	[%r19 + 0x013f], %r27
iob_intr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_240), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_wr_112:
	mov	0x1e, %r14
	.word 0xfcf38e80  ! 2774: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T2_asi_reg_wr_113:
	mov	0x3c2, %r14
	.word 0xfaf38400  ! 2776: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	.word 0xfe1421ea  ! 2780: LDUH_I	lduh	[%r16 + 0x01ea], %r31
iob_intr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_241), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_242:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_242), 16, 16)) -> intp(2, 0, 1a)
cpu_intr_2_205:
	setx	0x350316, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52da001  ! 2790: SLL_I	sll 	%r22, 0x0001, %r26
T2_asi_reg_wr_114:
	mov	0x14, %r14
	.word 0xfcf38e40  ! 2791: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb5643801  ! 2793: MOVcc_I	<illegal instruction>
T2_asi_reg_wr_115:
	mov	0x3c8, %r14
	.word 0xfef38e40  ! 2794: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_2_243:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_243), 16, 16)) -> intp(2, 0, 1f)
cpu_intr_2_206:
	setx	0x360023, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_244:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_244), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_rd_127:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 2801: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf615a1fe  ! 2803: LDUH_I	lduh	[%r22 + 0x01fe], %r27
	.word 0xbb518000  ! 2805: RDPR_PSTATE	<illegal instruction>
	.word 0xfc05207e  ! 2806: LDUW_I	lduw	[%r20 + 0x007e], %r30
	.word 0xf2d4e19e  ! 2807: LDSHA_I	ldsha	[%r19, + 0x019e] %asi, %r25
	.word 0xf2558000  ! 2809: LDSH_R	ldsh	[%r22 + %r0], %r25
	.word 0xf014a12e  ! 2811: LDUH_I	lduh	[%r18 + 0x012e], %r24
cpu_intr_2_207:
	setx	0x360026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2948020  ! 2815: LDUHA_R	lduha	[%r18, %r0] 0x01, %r25
	.word 0xf4d44020  ! 2816: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r26
T2_asi_reg_rd_128:
	mov	0x3c2, %r14
	.word 0xf0db8e80  ! 2818: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_2_245:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_245), 16, 16)) -> intp(2, 0, 5)
	.word 0xbe2d61be  ! 2820: ANDN_I	andn 	%r21, 0x01be, %r31
	.word 0xb61420bd  ! 2822: OR_I	or 	%r16, 0x00bd, %r27
T2_asi_reg_rd_129:
	mov	0x16, %r14
	.word 0xf4db8e40  ! 2823: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf44d2009  ! 2824: LDSB_I	ldsb	[%r20 + 0x0009], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf44de1be  ! 2827: LDSB_I	ldsb	[%r23 + 0x01be], %r26
iob_intr_2_246:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_246), 16, 16)) -> intp(2, 0, 18)
	.word 0xf094e011  ! 2831: LDUHA_I	lduha	[%r19, + 0x0011] %asi, %r24
	.word 0xf6048000  ! 2833: LDUW_R	lduw	[%r18 + %r0], %r27
T2_asi_reg_wr_116:
	mov	0x25, %r14
	.word 0xf2f38e40  ! 2834: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_rd_130:
	mov	0x19, %r14
	.word 0xf4db8e40  ! 2837: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_247:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_247), 16, 16)) -> intp(2, 0, 33)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf6050000  ! 2840: LDUW_R	lduw	[%r20 + %r0], %r27
iob_intr_2_248:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_248), 16, 16)) -> intp(2, 0, 0)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_249:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_249), 16, 16)) -> intp(2, 0, 6)
	.word 0xb005c000  ! 2853: ADD_R	add 	%r23, %r0, %r24
	.word 0xb32c2001  ! 2854: SLL_I	sll 	%r16, 0x0001, %r25
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982d80  ! 2855: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d80, %hpstate
T2_asi_reg_wr_117:
	mov	0x32, %r14
	.word 0xf4f384a0  ! 2857: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T2_asi_reg_wr_118:
	mov	0x38, %r14
	.word 0xf4f38e40  ! 2863: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
iob_intr_2_250:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_250), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_208:
	setx	0x340031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4c4000  ! 2870: LDSB_R	ldsb	[%r17 + %r0], %r30
iob_intr_2_251:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_251), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_wr_119:
	mov	0x16, %r14
	.word 0xfcf38e40  ! 2872: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfadce09c  ! 2873: LDXA_I	ldxa	[%r19, + 0x009c] %asi, %r29
iob_intr_2_252:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_252), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_wr_120:
	mov	0x20, %r14
	.word 0xf2f38e40  ! 2877: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf094a17c  ! 2878: LDUHA_I	lduha	[%r18, + 0x017c] %asi, %r24
T2_asi_reg_wr_121:
	mov	0x29, %r14
	.word 0xf4f38400  ! 2879: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb0b4a141  ! 2880: ORNcc_I	orncc 	%r18, 0x0141, %r24
	.word 0xfe948020  ! 2882: LDUHA_R	lduha	[%r18, %r0] 0x01, %r31
	.word 0xf0c50020  ! 2883: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r24
	.word 0xf24de063  ! 2884: LDSB_I	ldsb	[%r23 + 0x0063], %r25
	setx	data_start_2, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983cc0  ! 2885: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc0, %hpstate
cpu_intr_2_209:
	setx	0x360105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4d4a16e  ! 2887: LDSHA_I	ldsha	[%r18, + 0x016e] %asi, %r26
T2_asi_reg_wr_122:
	mov	0x3c3, %r14
	.word 0xf2f38e60  ! 2888: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf45d2166  ! 2889: LDX_I	ldx	[%r20 + 0x0166], %r26
	.word 0xf0d56041  ! 2891: LDSHA_I	ldsha	[%r21, + 0x0041] %asi, %r24
	.word 0xfa0ce19d  ! 2893: LDUB_I	ldub	[%r19 + 0x019d], %r29
cpu_intr_2_210:
	setx	0x360036, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_253:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_253), 16, 16)) -> intp(2, 0, 38)
	.word 0xf045e095  ! 2900: LDSW_I	ldsw	[%r23 + 0x0095], %r24
	.word 0xb9520000  ! 2903: RDPR_PIL	rdpr	%pil, %r28
	.word 0xfc0c4000  ! 2904: LDUB_R	ldub	[%r17 + %r0], %r30
T2_asi_reg_rd_131:
	mov	0x2f, %r14
	.word 0xf2db8e80  ! 2906: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xf40d8000  ! 2908: LDUB_R	ldub	[%r22 + %r0], %r26
	.word 0xf65ce1a0  ! 2909: LDX_I	ldx	[%r19 + 0x01a0], %r27
	.word 0xfa15c000  ! 2911: LDUH_R	lduh	[%r23 + %r0], %r29
cpu_intr_2_211:
	setx	0x34022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe0d21a1  ! 2914: AND_I	and 	%r20, 0x01a1, %r31
	.word 0xb6244000  ! 2915: SUB_R	sub 	%r17, %r0, %r27
	.word 0xf20d8000  ! 2916: LDUB_R	ldub	[%r22 + %r0], %r25
	.word 0xf88de019  ! 2919: LDUBA_I	lduba	[%r23, + 0x0019] %asi, %r28
	.word 0xb424c000  ! 2920: SUB_R	sub 	%r19, %r0, %r26
T2_asi_reg_wr_123:
	mov	0x2a, %r14
	.word 0xfcf389e0  ! 2922: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_2_254:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_254), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_255:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_255), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_256:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_256), 16, 16)) -> intp(2, 0, 14)
	.word 0xfc4d4000  ! 2931: LDSB_R	ldsb	[%r21 + %r0], %r30
	.word 0xfc0d0000  ! 2932: LDUB_R	ldub	[%r20 + %r0], %r30
cpu_intr_2_212:
	setx	0x340115, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_213:
	setx	0x360231, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_124:
	mov	0x3c4, %r14
	.word 0xf6f384a0  ! 2936: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_125:
	mov	0x2d, %r14
	.word 0xfcf384a0  ! 2938: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T2_asi_reg_wr_126:
	mov	0x22, %r14
	.word 0xfcf38e40  ! 2939: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_214:
	setx	0x34001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaccc020  ! 2943: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r29
	.word 0xf4cd6191  ! 2944: LDSBA_I	ldsba	[%r21, + 0x0191] %asi, %r26
iob_intr_2_257:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_257), 16, 16)) -> intp(2, 0, 6)
iob_intr_2_258:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_258), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_wr_127:
	mov	0x12, %r14
	.word 0xf6f38e40  ! 2950: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfe85c020  ! 2954: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r31
	.word 0xfe05604a  ! 2957: LDUW_I	lduw	[%r21 + 0x004a], %r31
cpu_intr_2_215:
	setx	0x340202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecda1c7  ! 2961: LDSBA_I	ldsba	[%r22, + 0x01c7] %asi, %r31
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982888  ! 2962: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0888, %hpstate
	.word 0xfacd0020  ! 2963: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r29
iob_intr_2_259:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_259), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_rd_132:
	mov	0x12, %r14
	.word 0xfcdb84a0  ! 2968: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf0950020  ! 2970: LDUHA_R	lduha	[%r20, %r0] 0x01, %r24
	.word 0xfad50020  ! 2971: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r29
iob_intr_2_260:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_260), 16, 16)) -> intp(2, 0, 14)
	.word 0xf4140000  ! 2976: LDUH_R	lduh	[%r16 + %r0], %r26
iob_intr_2_261:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_261), 16, 16)) -> intp(2, 0, 5)
	.word 0xf2dd2157  ! 2984: LDXA_I	ldxa	[%r20, + 0x0157] %asi, %r25
	.word 0xf60c4000  ! 2985: LDUB_R	ldub	[%r17 + %r0], %r27
iob_intr_2_262:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_262), 16, 16)) -> intp(2, 0, 7)
	.word 0xf645c000  ! 2992: LDSW_R	ldsw	[%r23 + %r0], %r27
iob_intr_2_263:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_263), 16, 16)) -> intp(2, 0, b)
	.word 0xfc5d4000  ! 2995: LDX_R	ldx	[%r21 + %r0], %r30
cpu_intr_2_216:
	setx	0x360223, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_133:
	mov	0x1b, %r14
	.word 0xf2db8e60  ! 2997: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf20c4000  ! 2998: LDUB_R	ldub	[%r17 + %r0], %r25
iob_intr_2_264:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_264), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_rd_134:
	mov	0x21, %r14
	.word 0xf8db89e0  ! 3000: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_2_265:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_265), 16, 16)) -> intp(2, 0, 18)
	.word 0xfa952193  ! 3003: LDUHA_I	lduha	[%r20, + 0x0193] %asi, %r29
	.word 0xbb2d1000  ! 3005: SLLX_R	sllx	%r20, %r0, %r29
	.word 0xf004a024  ! 3007: LDUW_I	lduw	[%r18 + 0x0024], %r24
	.word 0xfe4ca095  ! 3008: LDSB_I	ldsb	[%r18 + 0x0095], %r31
	.word 0xb72c5000  ! 3013: SLLX_R	sllx	%r17, %r0, %r27
	.word 0xf0cca01c  ! 3017: LDSBA_I	ldsba	[%r18, + 0x001c] %asi, %r24
T2_asi_reg_rd_135:
	mov	0x1f, %r14
	.word 0xf2db8400  ! 3019: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_2_217:
	setx	0x340106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2050000  ! 3022: LDUW_R	lduw	[%r20 + %r0], %r25
iob_intr_2_266:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_266), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_218:
	setx	0x340331, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_128:
	mov	0x32, %r14
	.word 0xf6f38e80  ! 3025: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_2_219:
	setx	0x36000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc4ca072  ! 3027: LDSB_I	ldsb	[%r18 + 0x0072], %r30
iob_intr_2_267:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_267), 16, 16)) -> intp(2, 0, 7)
	.word 0xfec40020  ! 3038: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r31
cpu_intr_2_220:
	setx	0x37003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb17c4400  ! 3040: MOVR_R	movre	%r17, %r0, %r24
	.word 0xfe5c60d0  ! 3044: LDX_I	ldx	[%r17 + 0x00d0], %r31
	.word 0xfcd46170  ! 3045: LDSHA_I	ldsha	[%r17, + 0x0170] %asi, %r30
	.word 0xf85c8000  ! 3046: LDX_R	ldx	[%r18 + %r0], %r28
T2_asi_reg_wr_129:
	mov	0x3c0, %r14
	.word 0xf2f384a0  ! 3048: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_2_221:
	setx	0x370131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84c4000  ! 3050: LDSB_R	ldsb	[%r17 + %r0], %r28
iob_intr_2_268:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_268), 16, 16)) -> intp(2, 0, 1a)
iob_intr_2_269:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_269), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_222:
	setx	0x350325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5345000  ! 3054: SRLX_R	srlx	%r17, %r0, %r26
T2_asi_reg_wr_130:
	mov	0xd, %r14
	.word 0xfcf384a0  ! 3055: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf4856038  ! 3056: LDUWA_I	lduwa	[%r21, + 0x0038] %asi, %r26
cpu_intr_2_223:
	setx	0x350037, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_136:
	mov	0x3c0, %r14
	.word 0xfcdb8e40  ! 3058: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf014a171  ! 3059: LDUH_I	lduh	[%r18 + 0x0171], %r24
iob_intr_2_270:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_270), 16, 16)) -> intp(2, 0, 20)
	.word 0xb0c5c000  ! 3062: ADDCcc_R	addccc 	%r23, %r0, %r24
	.word 0xb4b46107  ! 3063: SUBCcc_I	orncc 	%r17, 0x0107, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb4b46102  ! 3065: ORNcc_I	orncc 	%r17, 0x0102, %r26
T2_asi_reg_wr_131:
	mov	0x7, %r14
	.word 0xfaf38e60  ! 3066: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_2_224:
	setx	0x35020e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_271:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_271), 16, 16)) -> intp(2, 0, 14)
cpu_intr_2_225:
	setx	0x370303, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_132:
	mov	0x8, %r14
	.word 0xf4f38e80  ! 3075: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T2_asi_reg_wr_133:
	mov	0x1, %r14
	.word 0xf8f38e80  ! 3076: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T2_asi_reg_rd_137:
	mov	0x33, %r14
	.word 0xf8db8400  ! 3077: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T2_asi_reg_rd_138:
	mov	0x3c0, %r14
	.word 0xfcdb8400  ! 3079: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb33cf001  ! 3080: SRAX_I	srax	%r19, 0x0001, %r25
	.word 0xfe5c612e  ! 3082: LDX_I	ldx	[%r17 + 0x012e], %r31
	.word 0xf84ce0a8  ! 3085: LDSB_I	ldsb	[%r19 + 0x00a8], %r28
	.word 0xf2040000  ! 3088: LDUW_R	lduw	[%r16 + %r0], %r25
	.word 0xf88d61bd  ! 3089: LDUBA_I	lduba	[%r21, + 0x01bd] %asi, %r28
iob_intr_2_272:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_272), 16, 16)) -> intp(2, 0, 4)
cpu_intr_2_226:
	setx	0x37002e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_134:
	mov	0x13, %r14
	.word 0xfef389e0  ! 3092: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf84c4000  ! 3095: LDSB_R	ldsb	[%r17 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_135:
	mov	0x8, %r14
	.word 0xfcf38e60  ! 3098: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_2_273:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_273), 16, 16)) -> intp(2, 0, 1e)
	.word 0xfa540000  ! 3102: LDSH_R	ldsh	[%r16 + %r0], %r29
T2_asi_reg_wr_136:
	mov	0xa, %r14
	.word 0xfaf389e0  ! 3105: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_2_227:
	setx	0x36031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_274:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_274), 16, 16)) -> intp(2, 0, 8)
	.word 0xb0b5e0c0  ! 3111: SUBCcc_I	orncc 	%r23, 0x00c0, %r24
	.word 0xf4d50020  ! 3113: LDSHA_R	ldsha	[%r20, %r0] 0x01, %r26
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe5d6172  ! 3117: LDX_I	ldx	[%r21 + 0x0172], %r31
cpu_intr_2_228:
	setx	0x350220, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_137:
	mov	0x26, %r14
	.word 0xfef38e40  ! 3120: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfc5dc000  ! 3121: LDX_R	ldx	[%r23 + %r0], %r30
cpu_intr_2_229:
	setx	0x340333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_275:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_275), 16, 16)) -> intp(2, 0, 7)
	.word 0xfecc21d4  ! 3131: LDSBA_I	ldsba	[%r16, + 0x01d4] %asi, %r31
iob_intr_2_276:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_276), 16, 16)) -> intp(2, 0, b)
	ta	T_CHANGE_TO_TL1
cpu_intr_2_230:
	setx	0x340016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0ac21ab  ! 3137: ANDNcc_I	andncc 	%r16, 0x01ab, %r24
T2_asi_reg_wr_138:
	mov	0x3c3, %r14
	.word 0xfcf38e40  ! 3138: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_231:
	setx	0x360029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfed52033  ! 3140: LDSHA_I	ldsha	[%r20, + 0x0033] %asi, %r31
	.word 0xfa4d8000  ! 3141: LDSB_R	ldsb	[%r22 + %r0], %r29
	.word 0xba352087  ! 3143: SUBC_I	orn 	%r20, 0x0087, %r29
iob_intr_2_277:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_277), 16, 16)) -> intp(2, 0, 29)
iob_intr_2_278:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_278), 16, 16)) -> intp(2, 0, 2f)
cpu_intr_2_232:
	setx	0x35022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_139:
	mov	0x3c3, %r14
	.word 0xf8f384a0  ! 3157: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_2_279:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_279), 16, 16)) -> intp(2, 0, 34)
	.word 0xf04d61a5  ! 3159: LDSB_I	ldsb	[%r21 + 0x01a5], %r24
	.word 0xf68cc020  ! 3160: LDUBA_R	lduba	[%r19, %r0] 0x01, %r27
	.word 0xb49de0fc  ! 3161: XORcc_I	xorcc 	%r23, 0x00fc, %r26
cpu_intr_2_233:
	setx	0x36001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe95a01f  ! 3164: LDUHA_I	lduha	[%r22, + 0x001f] %asi, %r31
T2_asi_reg_wr_140:
	mov	0x37, %r14
	.word 0xf4f38e40  ! 3165: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb4b5a026  ! 3168: ORNcc_I	orncc 	%r22, 0x0026, %r26
cpu_intr_2_234:
	setx	0x37012b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_235:
	setx	0x350217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8952025  ! 3174: LDUHA_I	lduha	[%r20, + 0x0025] %asi, %r28
	.word 0xf485c020  ! 3176: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r26
T2_asi_reg_wr_141:
	mov	0xb, %r14
	.word 0xf2f38400  ! 3181: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_2_280:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_280), 16, 16)) -> intp(2, 0, 30)
T2_asi_reg_rd_139:
	mov	0x0, %r14
	.word 0xf6db8400  ! 3186: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_2_236:
	setx	0x35033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc9ce08d  ! 3188: XORcc_I	xorcc 	%r19, 0x008d, %r30
	ta	T_CHANGE_TO_TL1
	.word 0x8f902000  ! 3194: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
T2_asi_reg_rd_140:
	mov	0x2c, %r14
	.word 0xf6db8e60  ! 3196: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_2_237:
	setx	0x3b011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_238:
	setx	0x3a012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_281:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_281), 16, 16)) -> intp(2, 0, 36)
	.word 0xf48c21dd  ! 3211: LDUBA_I	lduba	[%r16, + 0x01dd] %asi, %r26
	.word 0xf485a166  ! 3212: LDUWA_I	lduwa	[%r22, + 0x0166] %asi, %r26
	.word 0xbd3c9000  ! 3214: SRAX_R	srax	%r18, %r0, %r30
	.word 0xf6d54020  ! 3219: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r27
	.word 0xf40c6014  ! 3220: LDUB_I	ldub	[%r17 + 0x0014], %r26
cpu_intr_2_239:
	setx	0x3b0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6d4e04a  ! 3227: LDSHA_I	ldsha	[%r19, + 0x004a] %asi, %r27
iob_intr_2_282:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_282), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_240:
	setx	0x390303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe2ce091  ! 3234: ANDN_I	andn 	%r19, 0x0091, %r31
T2_asi_reg_wr_142:
	mov	0xb, %r14
	.word 0xf4f38e40  ! 3238: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_2_241:
	setx	0x38011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf005a151  ! 3241: LDUW_I	lduw	[%r22 + 0x0151], %r24
	.word 0xfa1561ab  ! 3243: LDUH_I	lduh	[%r21 + 0x01ab], %r29
iob_intr_2_283:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_283), 16, 16)) -> intp(2, 0, 25)
T2_asi_reg_rd_141:
	mov	0x20, %r14
	.word 0xf0db8e40  ! 3249: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf045e041  ! 3250: LDSW_I	ldsw	[%r23 + 0x0041], %r24
	ta	T_CHANGE_TO_TL1
cpu_intr_2_242:
	setx	0x380008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_243:
	setx	0x3b0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819838c2  ! 3256: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c2, %hpstate
T2_asi_reg_rd_142:
	mov	0x24, %r14
	.word 0xfcdb8400  ! 3257: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf4044000  ! 3260: LDUW_R	lduw	[%r17 + %r0], %r26
iob_intr_2_284:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_284), 16, 16)) -> intp(2, 0, a)
	.word 0xb6848000  ! 3262: ADDcc_R	addcc 	%r18, %r0, %r27
	.word 0xb4b40000  ! 3267: SUBCcc_R	orncc 	%r16, %r0, %r26
T2_asi_reg_rd_143:
	mov	0x35, %r14
	.word 0xf0db8e40  ! 3269: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_2_285:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_285), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_244:
	setx	0x38000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4548000  ! 3274: LDSH_R	ldsh	[%r18 + %r0], %r26
	.word 0xf415e0bf  ! 3275: LDUH_I	lduh	[%r23 + 0x00bf], %r26
	.word 0xf05de0a4  ! 3276: LDX_I	ldx	[%r23 + 0x00a4], %r24
	ta	T_CHANGE_HPRIV
	.word 0xfe0d8000  ! 3281: LDUB_R	ldub	[%r22 + %r0], %r31
	.word 0xf684a020  ! 3282: LDUWA_I	lduwa	[%r18, + 0x0020] %asi, %r27
iob_intr_2_286:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_286), 16, 16)) -> intp(2, 0, 1c)
	.word 0xfc0c20ec  ! 3287: LDUB_I	ldub	[%r16 + 0x00ec], %r30
	.word 0xf48d4020  ! 3289: LDUBA_R	lduba	[%r21, %r0] 0x01, %r26
cpu_intr_2_245:
	setx	0x3a023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0154000  ! 3292: OR_R	or 	%r21, %r0, %r24
iob_intr_2_287:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_287), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf255c000  ! 3297: LDSH_R	ldsh	[%r23 + %r0], %r25
	.word 0xfc0dc000  ! 3298: LDUB_R	ldub	[%r23 + %r0], %r30
T2_asi_reg_rd_144:
	mov	0x1a, %r14
	.word 0xfedb8e40  ! 3302: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_246:
	setx	0x390316, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_143:
	mov	0x32, %r14
	.word 0xf2f384a0  ! 3306: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_2_288:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_288), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_289:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_289), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_rd_145:
	mov	0x12, %r14
	.word 0xfedb8e40  ! 3309: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xfc45606a  ! 3310: LDSW_I	ldsw	[%r21 + 0x006a], %r30
	.word 0xb02c204c  ! 3311: ANDN_I	andn 	%r16, 0x004c, %r24
	.word 0xfa8c217c  ! 3312: LDUBA_I	lduba	[%r16, + 0x017c] %asi, %r29
	.word 0xb0b5e051  ! 3315: ORNcc_I	orncc 	%r23, 0x0051, %r24
iob_intr_2_290:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_290), 16, 16)) -> intp(2, 0, 1)
T2_asi_reg_wr_144:
	mov	0x25, %r14
	.word 0xf6f38e40  ! 3319: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_wr_145:
	mov	0x26, %r14
	.word 0xf8f389e0  ! 3321: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T2_asi_reg_wr_146:
	mov	0x2e, %r14
	.word 0xf2f38e40  ! 3326: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb1518000  ! 3327: RDPR_PSTATE	<illegal instruction>
iob_intr_2_291:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_291), 16, 16)) -> intp(2, 0, 7)
	.word 0xfacca1c2  ! 3329: LDSBA_I	ldsba	[%r18, + 0x01c2] %asi, %r29
	.word 0xf64d2093  ! 3330: LDSB_I	ldsb	[%r20 + 0x0093], %r27
iob_intr_2_292:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_292), 16, 16)) -> intp(2, 0, e)
	.word 0xf0544000  ! 3334: LDSH_R	ldsh	[%r17 + %r0], %r24
iob_intr_2_293:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_293), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_247:
	setx	0x390130, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_147:
	mov	0x3c2, %r14
	.word 0xf4f38e60  ! 3342: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_2_294:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_294), 16, 16)) -> intp(2, 0, 32)
cpu_intr_2_248:
	setx	0x3a0017, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_146:
	mov	0x3c3, %r14
	.word 0xf0db8e60  ! 3345: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbcb521fe  ! 3346: SUBCcc_I	orncc 	%r20, 0x01fe, %r30
	.word 0xb49d20fd  ! 3347: XORcc_I	xorcc 	%r20, 0x00fd, %r26
cpu_intr_2_249:
	setx	0x380219, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_295:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_295), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_wr_148:
	mov	0x1d, %r14
	.word 0xf8f38e40  ! 3354: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf215a041  ! 3356: LDUH_I	lduh	[%r22 + 0x0041], %r25
iob_intr_2_296:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_296), 16, 16)) -> intp(2, 0, 33)
	.word 0xb615c000  ! 3360: OR_R	or 	%r23, %r0, %r27
iob_intr_2_297:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_297), 16, 16)) -> intp(2, 0, 1f)
iob_intr_2_298:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_298), 16, 16)) -> intp(2, 0, 14)
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_149:
	mov	0x3c8, %r14
	.word 0xf2f38e60  ! 3369: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_2_299:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_299), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf24cc000  ! 3372: LDSB_R	ldsb	[%r19 + %r0], %r25
cpu_intr_2_250:
	setx	0x3b0001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_300:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_300), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_251:
	setx	0x3a0124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2c561ae  ! 3380: LDSWA_I	ldswa	[%r21, + 0x01ae] %asi, %r25
iob_intr_2_301:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_301), 16, 16)) -> intp(2, 0, a)
	ta	T_CHANGE_HPRIV
	.word 0xfa05205d  ! 3391: LDUW_I	lduw	[%r20 + 0x005d], %r29
	ta	T_CHANGE_TO_TL0
	.word 0xfc550000  ! 3396: LDSH_R	ldsh	[%r20 + %r0], %r30
cpu_intr_2_252:
	setx	0x390223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13d0000  ! 3398: SRA_R	sra 	%r20, %r0, %r24
iob_intr_2_302:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_302), 16, 16)) -> intp(2, 0, 23)
iob_intr_2_303:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_303), 16, 16)) -> intp(2, 0, 1d)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_304:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_304), 16, 16)) -> intp(2, 0, 10)
iob_intr_2_305:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_305), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_wr_150:
	mov	0x2e, %r14
	.word 0xfef384a0  ! 3406: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_2_306:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_306), 16, 16)) -> intp(2, 0, 31)
T2_asi_reg_rd_147:
	mov	0x3c7, %r14
	.word 0xf0db8400  ! 3409: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T2_asi_reg_rd_148:
	mov	0xe, %r14
	.word 0xf0db89e0  ! 3413: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf0c5a02b  ! 3414: LDSWA_I	ldswa	[%r22, + 0x002b] %asi, %r24
	.word 0xf0442030  ! 3416: LDSW_I	ldsw	[%r16 + 0x0030], %r24
	.word 0xf69421aa  ! 3422: LDUHA_I	lduha	[%r16, + 0x01aa] %asi, %r27
iob_intr_2_307:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_307), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_rd_149:
	mov	0x2f, %r14
	.word 0xf0db89e0  ! 3424: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_2_308:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_308), 16, 16)) -> intp(2, 0, 15)
	.word 0xb2958000  ! 3427: ORcc_R	orcc 	%r22, %r0, %r25
iob_intr_2_309:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_309), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_310:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_310), 16, 16)) -> intp(2, 0, 2a)
iob_intr_2_311:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_311), 16, 16)) -> intp(2, 0, 22)
T2_asi_reg_wr_151:
	mov	0x14, %r14
	.word 0xf6f38e40  ! 3437: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf8d5c020  ! 3438: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r28
iob_intr_2_312:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_312), 16, 16)) -> intp(2, 0, 1d)
iob_intr_2_313:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_313), 16, 16)) -> intp(2, 0, 29)
iob_intr_2_314:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_314), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf494c020  ! 3443: LDUHA_R	lduha	[%r19, %r0] 0x01, %r26
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982e10  ! 3444: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e10, %hpstate
	.word 0xbca4c000  ! 3445: SUBcc_R	subcc 	%r19, %r0, %r30
cpu_intr_2_253:
	setx	0x3a0125, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_254:
	setx	0x3a032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_255:
	setx	0x390002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_315:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_315), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf85c8000  ! 3461: LDX_R	ldx	[%r18 + %r0], %r28
iob_intr_2_316:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_316), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_rd_150:
	mov	0x3c4, %r14
	.word 0xf0db89e0  ! 3466: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xf85d4000  ! 3469: LDX_R	ldx	[%r21 + %r0], %r28
	.word 0xf0940020  ! 3471: LDUHA_R	lduha	[%r16, %r0] 0x01, %r24
	.word 0xb224612e  ! 3475: SUB_I	sub 	%r17, 0x012e, %r25
cpu_intr_2_256:
	setx	0x390005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb234619c  ! 3478: ORN_I	orn 	%r17, 0x019c, %r25
	.word 0xf8c52024  ! 3480: LDSWA_I	ldswa	[%r20, + 0x0024] %asi, %r28
	.word 0xfa4c0000  ! 3483: LDSB_R	ldsb	[%r16 + %r0], %r29
T2_asi_reg_rd_151:
	mov	0x6, %r14
	.word 0xfadb84a0  ! 3484: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf04ce062  ! 3485: LDSB_I	ldsb	[%r19 + 0x0062], %r24
	.word 0xb68da0a0  ! 3488: ANDcc_I	andcc 	%r22, 0x00a0, %r27
	.word 0x919421af  ! 3490: WRPR_PIL_I	wrpr	%r16, 0x01af, %pil
	.word 0xf6d5601d  ! 3495: LDSHA_I	ldsha	[%r21, + 0x001d] %asi, %r27
	.word 0xf48d208c  ! 3497: LDUBA_I	lduba	[%r20, + 0x008c] %asi, %r26
cpu_intr_2_257:
	setx	0x3a0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d5e1f8  ! 3500: LDSHA_I	ldsha	[%r23, + 0x01f8] %asi, %r24
T2_asi_reg_rd_152:
	mov	0x6, %r14
	.word 0xfcdb89e0  ! 3501: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_2_258:
	setx	0x390028, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_152:
	mov	0x14, %r14
	.word 0xf2f384a0  ! 3503: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xf655c000  ! 3504: LDSH_R	ldsh	[%r23 + %r0], %r27
	.word 0xbaa44000  ! 3505: SUBcc_R	subcc 	%r17, %r0, %r29
	.word 0x859461ea  ! 3506: WRPR_TSTATE_I	wrpr	%r17, 0x01ea, %tstate
	.word 0xf80dc000  ! 3507: LDUB_R	ldub	[%r23 + %r0], %r28
	.word 0xbca50000  ! 3509: SUBcc_R	subcc 	%r20, %r0, %r30
	.word 0xf0148000  ! 3512: LDUH_R	lduh	[%r18 + %r0], %r24
	.word 0xb03ce0df  ! 3513: XNOR_I	xnor 	%r19, 0x00df, %r24
	.word 0xfe846172  ! 3514: LDUWA_I	lduwa	[%r17, + 0x0172] %asi, %r31
T2_asi_reg_wr_153:
	mov	0x37, %r14
	.word 0xf6f38e60  ! 3515: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_2_317:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_317), 16, 16)) -> intp(2, 0, 31)
	.word 0xf20c6070  ! 3517: LDUB_I	ldub	[%r17 + 0x0070], %r25
	.word 0xf6c58020  ! 3521: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r27
	ta	T_CHANGE_TO_TL0
	.word 0xfed560a6  ! 3524: LDSHA_I	ldsha	[%r21, + 0x00a6] %asi, %r31
T2_asi_reg_wr_154:
	mov	0x16, %r14
	.word 0xfaf38e40  ! 3525: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_259:
	setx	0x3a020d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_318:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_318), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_rd_153:
	mov	0x9, %r14
	.word 0xfadb89e0  ! 3534: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T2_asi_reg_wr_155:
	mov	0x1d, %r14
	.word 0xfcf38e80  ! 3537: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xf8cce0a4  ! 3539: LDSBA_I	ldsba	[%r19, + 0x00a4] %asi, %r28
iob_intr_2_319:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_319), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_wr_156:
	mov	0x2, %r14
	.word 0xfef38400  ! 3545: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_2_320:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_320), 16, 16)) -> intp(2, 0, 3a)
iob_intr_2_321:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_321), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_322:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_322), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_260:
	setx	0x390235, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_323:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_323), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_261:
	setx	0x38032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_262:
	setx	0x3b0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcc48000  ! 3563: ADDCcc_R	addccc 	%r18, %r0, %r30
cpu_intr_2_263:
	setx	0x390221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcd4a008  ! 3567: LDSHA_I	ldsha	[%r18, + 0x0008] %asi, %r30
	ta	T_CHANGE_TO_TL1
	.word 0xf85ce188  ! 3570: LDX_I	ldx	[%r19 + 0x0188], %r28
cpu_intr_2_264:
	setx	0x3b023a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbca5c000  ! 3572: SUBcc_R	subcc 	%r23, %r0, %r30
	.word 0xf48d8020  ! 3573: LDUBA_R	lduba	[%r22, %r0] 0x01, %r26
T2_asi_reg_rd_154:
	mov	0x3c0, %r14
	.word 0xfcdb8e40  ! 3574: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf80c2129  ! 3576: LDUB_I	ldub	[%r16 + 0x0129], %r28
iob_intr_2_324:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_324), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_265:
	setx	0x3b0033, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_157:
	mov	0x2f, %r14
	.word 0xfef38e40  ! 3587: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb89d8000  ! 3588: XORcc_R	xorcc 	%r22, %r0, %r28
	.word 0xfc5ca061  ! 3592: LDX_I	ldx	[%r18 + 0x0061], %r30
T2_asi_reg_rd_155:
	mov	0xa, %r14
	.word 0xfcdb89e0  ! 3593: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf6c4e120  ! 3594: LDSWA_I	ldswa	[%r19, + 0x0120] %asi, %r27
cpu_intr_2_266:
	setx	0x3a0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45c0000  ! 3596: LDX_R	ldx	[%r16 + %r0], %r26
	.word 0xb43c8000  ! 3597: XNOR_R	xnor 	%r18, %r0, %r26
	.word 0xb97c8400  ! 3602: MOVR_R	movre	%r18, %r0, %r28
	.word 0xf0d4a12d  ! 3603: LDSHA_I	ldsha	[%r18, + 0x012d] %asi, %r24
cpu_intr_2_267:
	setx	0x3a0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa84a13a  ! 3610: LDUWA_I	lduwa	[%r18, + 0x013a] %asi, %r29
	.word 0xbb480000  ! 3611: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb294e075  ! 3612: ORcc_I	orcc 	%r19, 0x0075, %r25
iob_intr_2_325:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_325), 16, 16)) -> intp(2, 0, 2f)
	.word 0xfa95601b  ! 3616: LDUHA_I	lduha	[%r21, + 0x001b] %asi, %r29
	ta	T_CHANGE_TO_TL0
cpu_intr_2_268:
	setx	0x3b0024, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_156:
	mov	0x3c3, %r14
	.word 0xf0db84a0  ! 3623: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T2_asi_reg_wr_158:
	mov	0x11, %r14
	.word 0xf0f38e80  ! 3624: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xf4cd0020  ! 3625: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r26
cpu_intr_2_269:
	setx	0x39003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_270:
	setx	0x39030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2148000  ! 3631: LDUH_R	lduh	[%r18 + %r0], %r25
	.word 0xb7641800  ! 3632: MOVcc_R	<illegal instruction>
iob_intr_2_326:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_326), 16, 16)) -> intp(2, 0, 2b)
	.word 0xfc952187  ! 3634: LDUHA_I	lduha	[%r20, + 0x0187] %asi, %r30
	.word 0xfedce12d  ! 3636: LDXA_I	ldxa	[%r19, + 0x012d] %asi, %r31
	.word 0xf64de13f  ! 3638: LDSB_I	ldsb	[%r23 + 0x013f], %r27
	.word 0xfedce0fc  ! 3642: LDXA_I	ldxa	[%r19, + 0x00fc] %asi, %r31
iob_intr_2_327:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_327), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_rd_157:
	mov	0x34, %r14
	.word 0xf4db84a0  ! 3645: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb9508000  ! 3646: RDPR_TSTATE	<illegal instruction>
	.word 0xf25421b3  ! 3647: LDSH_I	ldsh	[%r16 + 0x01b3], %r25
cpu_intr_2_271:
	setx	0x390031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8c58020  ! 3649: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r28
T2_asi_reg_rd_158:
	mov	0x37, %r14
	.word 0xf8db8e40  ! 3650: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_328:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_328), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_329:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_329), 16, 16)) -> intp(2, 0, 17)
	.word 0xba948000  ! 3653: ORcc_R	orcc 	%r18, %r0, %r29
	.word 0xf04520d8  ! 3654: LDSW_I	ldsw	[%r20 + 0x00d8], %r24
	.word 0xfe444000  ! 3656: LDSW_R	ldsw	[%r17 + %r0], %r31
	ta	T_CHANGE_TO_TL0
	.word 0xbe0c4000  ! 3660: AND_R	and 	%r17, %r0, %r31
	.word 0xfc4de05a  ! 3662: LDSB_I	ldsb	[%r23 + 0x005a], %r30
iob_intr_2_330:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_330), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf2544000  ! 3666: LDSH_R	ldsh	[%r17 + %r0], %r25
	ta	T_CHANGE_TO_TL0
	.word 0xfe85c020  ! 3670: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r31
cpu_intr_2_272:
	setx	0x3f0015, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_331:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_331), 16, 16)) -> intp(2, 0, 13)
	.word 0xf6946120  ! 3678: LDUHA_I	lduha	[%r17, + 0x0120] %asi, %r27
cpu_intr_2_273:
	setx	0x3d0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecc0020  ! 3681: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r31
	.word 0xfe4d4000  ! 3682: LDSB_R	ldsb	[%r21 + %r0], %r31
T2_asi_reg_rd_159:
	mov	0x3c0, %r14
	.word 0xf8db89e0  ! 3683: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_2_274:
	setx	0x3d031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf255e196  ! 3686: LDSH_I	ldsh	[%r23 + 0x0196], %r25
cpu_intr_2_275:
	setx	0x3e0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf64cc000  ! 3692: LDSB_R	ldsb	[%r19 + %r0], %r27
	.word 0xf44ce097  ! 3693: LDSB_I	ldsb	[%r19 + 0x0097], %r26
T2_asi_reg_rd_160:
	mov	0x27, %r14
	.word 0xf8db89e0  ! 3695: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T2_asi_reg_rd_161:
	mov	0x33, %r14
	.word 0xf4db8e40  ! 3698: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_332:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_332), 16, 16)) -> intp(2, 0, 4)
	.word 0xf8cdc020  ! 3702: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r28
cpu_intr_2_276:
	setx	0x3e0235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcdca023  ! 3713: LDXA_I	ldxa	[%r18, + 0x0023] %asi, %r30
	.word 0xf4540000  ! 3714: LDSH_R	ldsh	[%r16 + %r0], %r26
	.word 0xf4940020  ! 3719: LDUHA_R	lduha	[%r16, %r0] 0x01, %r26
T2_asi_reg_wr_159:
	mov	0x3c6, %r14
	.word 0xfaf389e0  ! 3721: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_2_277:
	setx	0x3d003e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_160:
	mov	0xb, %r14
	.word 0xf4f38e40  ! 3725: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_wr_161:
	mov	0x32, %r14
	.word 0xfaf38e60  ! 3732: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_2_278:
	setx	0x3e0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1518000  ! 3738: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xb28da1a9  ! 3741: ANDcc_I	andcc 	%r22, 0x01a9, %r25
cpu_intr_2_279:
	setx	0x3e0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb43ca14e  ! 3748: XNOR_I	xnor 	%r18, 0x014e, %r26
T2_asi_reg_rd_162:
	mov	0x0, %r14
	.word 0xf0db8e40  ! 3749: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf8c56162  ! 3751: LDSWA_I	ldswa	[%r21, + 0x0162] %asi, %r28
	.word 0xfe0c0000  ! 3752: LDUB_R	ldub	[%r16 + %r0], %r31
iob_intr_2_333:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_333), 16, 16)) -> intp(2, 0, 3)
	.word 0xfa544000  ! 3755: LDSH_R	ldsh	[%r17 + %r0], %r29
cpu_intr_2_280:
	setx	0x3d0110, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_281:
	setx	0x3c0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0548000  ! 3761: LDSH_R	ldsh	[%r18 + %r0], %r24
cpu_intr_2_282:
	setx	0x3e0334, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_163:
	mov	0x2a, %r14
	.word 0xf2db8e60  ! 3763: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_283:
	setx	0x3f0231, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_334:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_334), 16, 16)) -> intp(2, 0, 2a)
cpu_intr_2_284:
	setx	0x20135, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_335:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_335), 16, 16)) -> intp(2, 0, a)
	.word 0xfc84e1da  ! 3770: LDUWA_I	lduwa	[%r19, + 0x01da] %asi, %r30
T2_asi_reg_wr_162:
	mov	0x9, %r14
	.word 0xfaf38e40  ! 3773: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf48d8020  ! 3775: LDUBA_R	lduba	[%r22, %r0] 0x01, %r26
cpu_intr_2_285:
	setx	0x3d0029, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_164:
	mov	0x21, %r14
	.word 0xf8db8400  ! 3777: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xfec54020  ! 3780: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r31
	.word 0xb73cd000  ! 3781: SRAX_R	srax	%r19, %r0, %r27
cpu_intr_2_286:
	setx	0x3f0331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf005c000  ! 3784: LDUW_R	lduw	[%r23 + %r0], %r24
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982a12  ! 3785: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a12, %hpstate
	.word 0xbcc54000  ! 3786: ADDCcc_R	addccc 	%r21, %r0, %r30
iob_intr_2_336:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_336), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_287:
	setx	0x3c0031, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_337:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_337), 16, 16)) -> intp(2, 0, 6)
	.word 0xb205200d  ! 3798: ADD_I	add 	%r20, 0x000d, %r25
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982840  ! 3800: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0840, %hpstate
iob_intr_2_338:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_338), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_wr_163:
	mov	0x3c6, %r14
	.word 0xf4f38e80  ! 3805: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf0dce081  ! 3809: LDXA_I	ldxa	[%r19, + 0x0081] %asi, %r24
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
iob_intr_2_339:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_339), 16, 16)) -> intp(2, 0, 3e)
	.word 0xfc0c8000  ! 3819: LDUB_R	ldub	[%r18 + %r0], %r30
iob_intr_2_340:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_340), 16, 16)) -> intp(2, 0, 18)
iob_intr_2_341:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_341), 16, 16)) -> intp(2, 0, 27)
iob_intr_2_342:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_342), 16, 16)) -> intp(2, 0, 16)
	.word 0xb92c1000  ! 3823: SLLX_R	sllx	%r16, %r0, %r28
T2_asi_reg_rd_165:
	mov	0x3, %r14
	.word 0xfcdb8400  ! 3825: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xfa8d2049  ! 3826: LDUBA_I	lduba	[%r20, + 0x0049] %asi, %r29
	.word 0xf49460d0  ! 3827: LDUHA_I	lduha	[%r17, + 0x00d0] %asi, %r26
	.word 0xbd2db001  ! 3828: SLLX_I	sllx	%r22, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_343:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_343), 16, 16)) -> intp(2, 0, 2f)
T2_asi_reg_rd_166:
	mov	0xe, %r14
	.word 0xfedb8400  ! 3839: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb63cc000  ! 3841: XNOR_R	xnor 	%r19, %r0, %r27
T2_asi_reg_rd_167:
	mov	0x5, %r14
	.word 0xfcdb8e80  ! 3842: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_2_344:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_344), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_288:
	setx	0x3f023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_345:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_345), 16, 16)) -> intp(2, 0, 28)
	ta	T_CHANGE_HPRIV
	.word 0xfec48020  ! 3851: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r31
	.word 0xf094a00f  ! 3853: LDUHA_I	lduha	[%r18, + 0x000f] %asi, %r24
	.word 0xfcccc020  ! 3854: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r30
T2_asi_reg_wr_164:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 3855: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_2_289:
	setx	0x3c0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2cca1ce  ! 3860: LDSBA_I	ldsba	[%r18, + 0x01ce] %asi, %r25
T2_asi_reg_rd_168:
	mov	0x34, %r14
	.word 0xfcdb8e40  ! 3865: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_rd_169:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 3869: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_290:
	setx	0x3d0012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6dd2121  ! 3875: LDXA_I	ldxa	[%r20, + 0x0121] %asi, %r27
iob_intr_2_346:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_346), 16, 16)) -> intp(2, 0, 14)
	.word 0xf0cd6174  ! 3879: LDSBA_I	ldsba	[%r21, + 0x0174] %asi, %r24
	.word 0xf6c44020  ! 3880: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r27
	.word 0xbe840000  ! 3883: ADDcc_R	addcc 	%r16, %r0, %r31
	.word 0xfe0da1de  ! 3884: LDUB_I	ldub	[%r22 + 0x01de], %r31
iob_intr_2_347:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_347), 16, 16)) -> intp(2, 0, 18)
T2_asi_reg_wr_165:
	mov	0x13, %r14
	.word 0xfaf38e60  ! 3887: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xb245e04f  ! 3888: ADDC_I	addc 	%r23, 0x004f, %r25
	.word 0xfe0c2005  ! 3890: LDUB_I	ldub	[%r16 + 0x0005], %r31
T2_asi_reg_wr_166:
	mov	0x26, %r14
	.word 0xf6f384a0  ! 3895: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_2_291:
	setx	0x3c0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6440000  ! 3902: LDSW_R	ldsw	[%r16 + %r0], %r27
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_167:
	mov	0x1f, %r14
	.word 0xf4f38e60  ! 3906: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T2_asi_reg_rd_170:
	mov	0x3c0, %r14
	.word 0xfadb8e60  ! 3907: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T2_asi_reg_rd_171:
	mov	0x13, %r14
	.word 0xfedb8e40  ! 3910: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_rd_172:
	mov	0x3c1, %r14
	.word 0xfcdb8e80  ! 3912: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb734f001  ! 3913: SRLX_I	srlx	%r19, 0x0001, %r27
cpu_intr_2_292:
	setx	0x3d0313, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_293:
	setx	0x3f0311, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_168:
	mov	0x33, %r14
	.word 0xfaf38400  ! 3917: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb8b4607f  ! 3919: ORNcc_I	orncc 	%r17, 0x007f, %r28
T2_asi_reg_wr_169:
	mov	0x2c, %r14
	.word 0xf2f384a0  ! 3920: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T2_asi_reg_rd_173:
	mov	0x3c0, %r14
	.word 0xf2db8400  ! 3923: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T2_asi_reg_rd_174:
	mov	0x15, %r14
	.word 0xf0db8e60  ! 3924: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_2_348:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_348), 16, 16)) -> intp(2, 0, 24)
	.word 0xfcd520b5  ! 3927: LDSHA_I	ldsha	[%r20, + 0x00b5] %asi, %r30
	.word 0xf8058000  ! 3928: LDUW_R	lduw	[%r22 + %r0], %r28
cpu_intr_2_294:
	setx	0x3e021c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_349:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_349), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_rd_175:
	mov	0x24, %r14
	.word 0xf0db8400  ! 3935: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T2_asi_reg_rd_176:
	mov	0x3c7, %r14
	.word 0xf6db89e0  ! 3940: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xf45cc000  ! 3941: LDX_R	ldx	[%r19 + %r0], %r26
	.word 0xba0d4000  ! 3943: AND_R	and 	%r21, %r0, %r29
	.word 0xf245c000  ! 3944: LDSW_R	ldsw	[%r23 + %r0], %r25
	.word 0xf284c020  ! 3947: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r25
iob_intr_2_350:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_350), 16, 16)) -> intp(2, 0, 4)
iob_intr_2_351:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_351), 16, 16)) -> intp(2, 0, 2c)
T2_asi_reg_wr_170:
	mov	0x17, %r14
	.word 0xfef384a0  ! 3952: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf695a05f  ! 3955: LDUHA_I	lduha	[%r22, + 0x005f] %asi, %r27
	.word 0xba140000  ! 3961: OR_R	or 	%r16, %r0, %r29
cpu_intr_2_295:
	setx	0x3e000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5d202a  ! 3970: LDX_I	ldx	[%r20 + 0x002a], %r29
iob_intr_2_352:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_352), 16, 16)) -> intp(2, 0, 1)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb4940000  ! 3973: ORcc_R	orcc 	%r16, %r0, %r26
	.word 0x8d94a1a4  ! 3974: WRPR_PSTATE_I	wrpr	%r18, 0x01a4, %pstate
	.word 0xf60c21f6  ! 3975: LDUB_I	ldub	[%r16 + 0x01f6], %r27
iob_intr_2_353:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_353), 16, 16)) -> intp(2, 0, 2c)
cpu_intr_2_296:
	setx	0x3d0237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_297:
	setx	0x3f0311, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_298:
	setx	0x3c0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0bda122  ! 3990: XNORcc_I	xnorcc 	%r22, 0x0122, %r24
	.word 0xb214e0b3  ! 3994: OR_I	or 	%r19, 0x00b3, %r25
	.word 0xf6848020  ! 3997: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r27
T2_asi_reg_rd_177:
	mov	0x3c6, %r14
	.word 0xf4db84a0  ! 3999: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_354:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_354), 16, 16)) -> intp(2, 0, 25)
	ta	T_CHANGE_TO_TL0
	.word 0xf2dd6067  ! 4002: LDXA_I	ldxa	[%r21, + 0x0067] %asi, %r25
T2_asi_reg_rd_178:
	mov	0x23, %r14
	.word 0xf6db84a0  ! 4004: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xf054602d  ! 4005: LDSH_I	ldsh	[%r17 + 0x002d], %r24
cpu_intr_2_299:
	setx	0x3e030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_171:
	mov	0x1a, %r14
	.word 0xfcf38e60  ! 4008: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_2_300:
	setx	0x3e0128, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_172:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 4014: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_355:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_355), 16, 16)) -> intp(2, 0, 14)
	.word 0xf4848020  ! 4019: LDUWA_R	lduwa	[%r18, %r0] 0x01, %r26
cpu_intr_2_301:
	setx	0x3c0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0b420cc  ! 4021: ORNcc_I	orncc 	%r16, 0x00cc, %r24
T2_asi_reg_wr_173:
	mov	0x1e, %r14
	.word 0xfcf38e60  ! 4022: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf05560ee  ! 4023: LDSH_I	ldsh	[%r21 + 0x00ee], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_302:
	setx	0x3d003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0c6037  ! 4027: LDUB_I	ldub	[%r17 + 0x0037], %r29
	.word 0xfa5d21cc  ! 4028: LDX_I	ldx	[%r20 + 0x01cc], %r29
T2_asi_reg_wr_174:
	mov	0x33, %r14
	.word 0xfcf384a0  ! 4029: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T2_asi_reg_rd_179:
	mov	0x30, %r14
	.word 0xfedb8e40  ! 4030: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_wr_175:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 4033: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb4448000  ! 4034: ADDC_R	addc 	%r18, %r0, %r26
T2_asi_reg_wr_176:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 4039: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_356:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_356), 16, 16)) -> intp(2, 0, 1a)
	.word 0xb2bce117  ! 4041: XNORcc_I	xnorcc 	%r19, 0x0117, %r25
T2_asi_reg_wr_177:
	mov	0x3c0, %r14
	.word 0xfcf38400  ! 4042: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xfa5dc000  ! 4048: LDX_R	ldx	[%r23 + %r0], %r29
	.word 0xf2840020  ! 4049: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r25
T2_asi_reg_wr_178:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 4050: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf845e1ce  ! 4051: LDSW_I	ldsw	[%r23 + 0x01ce], %r28
iob_intr_2_357:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_357), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_rd_180:
	mov	0x12, %r14
	.word 0xfedb8400  ! 4055: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_2_303:
	setx	0x3e0130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d561a4  ! 4058: LDSHA_I	ldsha	[%r21, + 0x01a4] %asi, %r25
cpu_intr_2_304:
	setx	0x3d0026, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_358:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_358), 16, 16)) -> intp(2, 0, 25)
	.word 0xbb345000  ! 4063: SRLX_R	srlx	%r17, %r0, %r29
T2_asi_reg_rd_181:
	mov	0x32, %r14
	.word 0xfadb84a0  ! 4065: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T2_asi_reg_rd_182:
	mov	0xc, %r14
	.word 0xf2db89e0  ! 4066: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xba35e021  ! 4067: ORN_I	orn 	%r23, 0x0021, %r29
	.word 0xf4cca076  ! 4068: LDSBA_I	ldsba	[%r18, + 0x0076] %asi, %r26
	.word 0xf24c8000  ! 4069: LDSB_R	ldsb	[%r18 + %r0], %r25
	ta	T_CHANGE_HPRIV
iob_intr_2_359:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_359), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_305:
	setx	0x3c0203, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_360:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_360), 16, 16)) -> intp(2, 0, 36)
	.word 0xf2dda17d  ! 4079: LDXA_I	ldxa	[%r22, + 0x017d] %asi, %r25
	.word 0xf05ce0bd  ! 4080: LDX_I	ldx	[%r19 + 0x00bd], %r24
	.word 0xf40d4000  ! 4081: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xf05461cf  ! 4084: LDSH_I	ldsh	[%r17 + 0x01cf], %r24
iob_intr_2_361:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_361), 16, 16)) -> intp(2, 0, 29)
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983948  ! 4088: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1948, %hpstate
	.word 0xb92c3001  ! 4089: SLLX_I	sllx	%r16, 0x0001, %r28
iob_intr_2_362:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_362), 16, 16)) -> intp(2, 0, 1f)
iob_intr_2_363:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_363), 16, 16)) -> intp(2, 0, 29)
	.word 0xf4458000  ! 4093: LDSW_R	ldsw	[%r22 + %r0], %r26
iob_intr_2_364:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_364), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_365:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_365), 16, 16)) -> intp(2, 0, 1)
	ta	T_CHANGE_HPRIV
	.word 0xbd480000  ! 4099: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xfc94203d  ! 4103: LDUHA_I	lduha	[%r16, + 0x003d] %asi, %r30
	.word 0xf4558000  ! 4104: LDSH_R	ldsh	[%r22 + %r0], %r26
	.word 0xfa4d20ce  ! 4108: LDSB_I	ldsb	[%r20 + 0x00ce], %r29
	.word 0xf0858020  ! 4110: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf08d4020  ! 4114: LDUBA_R	lduba	[%r21, %r0] 0x01, %r24
cpu_intr_2_306:
	setx	0x42023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_183:
	mov	0x1f, %r14
	.word 0xf8db89e0  ! 4122: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb42d0000  ! 4123: ANDN_R	andn 	%r20, %r0, %r26
	ta	T_CHANGE_NONHPRIV
	.word 0xf6044000  ! 4125: LDUW_R	lduw	[%r17 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_184:
	mov	0x2a, %r14
	.word 0xf0db89e0  ! 4127: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T2_asi_reg_rd_185:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 4131: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf4c48020  ! 4133: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r26
T2_asi_reg_rd_186:
	mov	0x3c3, %r14
	.word 0xfcdb8e80  ! 4136: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb60d8000  ! 4137: AND_R	and 	%r22, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_366:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_366), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_wr_179:
	mov	0x3c2, %r14
	.word 0xf4f38e40  ! 4142: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	setx	data_start_0, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983cca  ! 4143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cca, %hpstate
cpu_intr_2_307:
	setx	0x42033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_187:
	mov	0x13, %r14
	.word 0xf0db8e60  ! 4147: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf0cde156  ! 4148: LDSBA_I	ldsba	[%r23, + 0x0156] %asi, %r24
	.word 0xfe55a123  ! 4149: LDSH_I	ldsh	[%r22 + 0x0123], %r31
cpu_intr_2_308:
	setx	0x400204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc8cc020  ! 4152: LDUBA_R	lduba	[%r19, %r0] 0x01, %r30
	.word 0xf8cc4020  ! 4153: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r28
	.word 0xf6cdc020  ! 4154: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r27
	.word 0xf40ca165  ! 4155: LDUB_I	ldub	[%r18 + 0x0165], %r26
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_180:
	mov	0x21, %r14
	.word 0xf8f38400  ! 4162: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
T2_asi_reg_wr_181:
	mov	0x2c, %r14
	.word 0xf8f38400  ! 4163: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xfcc50020  ! 4165: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r30
	.word 0xfacd0020  ! 4166: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r29
iob_intr_2_367:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_367), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_rd_188:
	mov	0xc, %r14
	.word 0xfadb8400  ! 4170: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T2_asi_reg_rd_189:
	mov	0xf, %r14
	.word 0xf4db8400  ! 4171: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_2_309:
	setx	0x410130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0048000  ! 4178: LDUW_R	lduw	[%r18 + %r0], %r24
cpu_intr_2_310:
	setx	0x430315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x91946006  ! 4181: WRPR_PIL_I	wrpr	%r17, 0x0006, %pil
iob_intr_2_368:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_368), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf4448000  ! 4186: LDSW_R	ldsw	[%r18 + %r0], %r26
	.word 0xfacd0020  ! 4187: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r29
	.word 0xbd356001  ! 4188: SRL_I	srl 	%r21, 0x0001, %r30
iob_intr_2_369:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_369), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf08560d2  ! 4191: LDUWA_I	lduwa	[%r21, + 0x00d2] %asi, %r24
	.word 0xfec44020  ! 4194: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r31
	.word 0xb1641800  ! 4195: MOVcc_R	<illegal instruction>
T2_asi_reg_wr_182:
	mov	0x23, %r14
	.word 0xfef384a0  ! 4196: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf4954020  ! 4197: LDUHA_R	lduha	[%r21, %r0] 0x01, %r26
	.word 0xbc2d21b3  ! 4198: ANDN_I	andn 	%r20, 0x01b3, %r30
T2_asi_reg_rd_190:
	mov	0x1f, %r14
	.word 0xf0db8e80  ! 4199: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf4154000  ! 4200: LDUH_R	lduh	[%r21 + %r0], %r26
T2_asi_reg_wr_183:
	mov	0x24, %r14
	.word 0xf8f389e0  ! 4201: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xfe04c000  ! 4202: LDUW_R	lduw	[%r19 + %r0], %r31
cpu_intr_2_311:
	setx	0x40022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4148000  ! 4204: LDUH_R	lduh	[%r18 + %r0], %r26
	.word 0xf64cc000  ! 4207: LDSB_R	ldsb	[%r19 + %r0], %r27
	.word 0xfe558000  ! 4209: LDSH_R	ldsh	[%r22 + %r0], %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb135c000  ! 4215: SRL_R	srl 	%r23, %r0, %r24
T2_asi_reg_wr_184:
	mov	0x3c2, %r14
	.word 0xfef389e0  ! 4216: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T2_asi_reg_wr_185:
	mov	0xf, %r14
	.word 0xf6f38e40  ! 4217: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_2_370:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_370), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_wr_186:
	mov	0x9, %r14
	.word 0xf2f384a0  ! 4221: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T2_asi_reg_rd_191:
	mov	0x21, %r14
	.word 0xfadb84a0  ! 4222: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_2_371:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_371), 16, 16)) -> intp(2, 0, 32)
	.word 0xfad58020  ! 4229: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r29
iob_intr_2_372:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_372), 16, 16)) -> intp(2, 0, 7)
	.word 0xf6d5e08e  ! 4232: LDSHA_I	ldsha	[%r23, + 0x008e] %asi, %r27
	.word 0xb88da179  ! 4237: ANDcc_I	andcc 	%r22, 0x0179, %r28
cpu_intr_2_312:
	setx	0x420300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf494c020  ! 4241: LDUHA_R	lduha	[%r19, %r0] 0x01, %r26
cpu_intr_2_313:
	setx	0x420223, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_187:
	mov	0xa, %r14
	.word 0xfef389e0  ! 4244: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T2_asi_reg_rd_192:
	mov	0x3c8, %r14
	.word 0xf2db8400  ! 4245: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_2_314:
	setx	0x400220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6056038  ! 4251: LDUW_I	lduw	[%r21 + 0x0038], %r27
T2_asi_reg_wr_188:
	mov	0x30, %r14
	.word 0xf6f38e60  ! 4253: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf0cce04e  ! 4254: LDSBA_I	ldsba	[%r19, + 0x004e] %asi, %r24
iob_intr_2_373:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_373), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf684a058  ! 4259: LDUWA_I	lduwa	[%r18, + 0x0058] %asi, %r27
cpu_intr_2_315:
	setx	0x41012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe0520d3  ! 4262: LDUW_I	lduw	[%r20 + 0x00d3], %r31
	.word 0xfe4d0000  ! 4263: LDSB_R	ldsb	[%r20 + %r0], %r31
T2_asi_reg_rd_193:
	mov	0x9, %r14
	.word 0xf2db89e0  ! 4267: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb0b56057  ! 4271: ORNcc_I	orncc 	%r21, 0x0057, %r24
T2_asi_reg_wr_189:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 4273: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_wr_190:
	mov	0x23, %r14
	.word 0xf8f38e40  ! 4274: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf4950020  ! 4276: LDUHA_R	lduha	[%r20, %r0] 0x01, %r26
T2_asi_reg_rd_194:
	mov	0x2b, %r14
	.word 0xf2db8e40  ! 4277: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb72c9000  ! 4278: SLLX_R	sllx	%r18, %r0, %r27
	.word 0xfa15605b  ! 4279: LDUH_I	lduh	[%r21 + 0x005b], %r29
	ta	T_CHANGE_NONHPRIV
	.word 0xfa95618a  ! 4282: LDUHA_I	lduha	[%r21, + 0x018a] %asi, %r29
	.word 0xbf7dc400  ! 4283: MOVR_R	movre	%r23, %r0, %r31
iob_intr_2_374:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_374), 16, 16)) -> intp(2, 0, 25)
	.word 0xb4ac61fb  ! 4286: ANDNcc_I	andncc 	%r17, 0x01fb, %r26
iob_intr_2_375:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_375), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_376:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_376), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_377:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_377), 16, 16)) -> intp(2, 0, 0)
cpu_intr_2_316:
	setx	0x40003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe85c020  ! 4299: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r31
T2_asi_reg_wr_191:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 4301: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_378:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_378), 16, 16)) -> intp(2, 0, 1e)
T2_asi_reg_rd_195:
	mov	0x34, %r14
	.word 0xfcdb89e0  ! 4303: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfc4ca146  ! 4310: LDSB_I	ldsb	[%r18 + 0x0146], %r30
	.word 0xfe5dc000  ! 4311: LDX_R	ldx	[%r23 + %r0], %r31
T2_asi_reg_wr_192:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 4312: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x819828c0  ! 4313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c0, %hpstate
cpu_intr_2_317:
	setx	0x420132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0548000  ! 4317: LDSH_R	ldsh	[%r18 + %r0], %r24
cpu_intr_2_318:
	setx	0x400233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8a54000  ! 4320: SUBcc_R	subcc 	%r21, %r0, %r28
cpu_intr_2_319:
	setx	0x40023c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_320:
	setx	0x400033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_379:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_379), 16, 16)) -> intp(2, 0, 4)
	ta	T_CHANGE_TO_TL0
	.word 0xfe8d4020  ! 4333: LDUBA_R	lduba	[%r21, %r0] 0x01, %r31
cpu_intr_2_321:
	setx	0x410322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20dc000  ! 4342: LDUB_R	ldub	[%r23 + %r0], %r25
	ta	T_CHANGE_TO_TL1
	.word 0xbb500000  ! 4346: RDPR_TPC	rdpr	%tpc, %r29
cpu_intr_2_322:
	setx	0x43011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_323:
	setx	0x40000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf24d0000  ! 4355: LDSB_R	ldsb	[%r20 + %r0], %r25
T2_asi_reg_rd_196:
	mov	0xc, %r14
	.word 0xf2db84a0  ! 4357: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T2_asi_reg_wr_193:
	mov	0x2d, %r14
	.word 0xf8f38e40  ! 4358: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_wr_194:
	mov	0x22, %r14
	.word 0xf4f384a0  ! 4359: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xbd508000  ! 4361: RDPR_TSTATE	<illegal instruction>
cpu_intr_2_324:
	setx	0x40032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xb494c000  ! 4368: ORcc_R	orcc 	%r19, %r0, %r26
	.word 0xba84a151  ! 4372: ADDcc_I	addcc 	%r18, 0x0151, %r29
iob_intr_2_380:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_380), 16, 16)) -> intp(2, 0, 28)
	.word 0xb72c5000  ! 4379: SLLX_R	sllx	%r17, %r0, %r27
iob_intr_2_381:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_381), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_325:
	setx	0x430012, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_326:
	setx	0x420321, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf894e1fd  ! 4388: LDUHA_I	lduha	[%r19, + 0x01fd] %asi, %r28
	.word 0xfa058000  ! 4389: LDUW_R	lduw	[%r22 + %r0], %r29
cpu_intr_2_327:
	setx	0x420019, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_195:
	mov	0x33, %r14
	.word 0xf2f38e60  ! 4393: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T2_asi_reg_rd_197:
	mov	0x23, %r14
	.word 0xfadb8e80  ! 4394: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfe15e1bb  ! 4395: LDUH_I	lduh	[%r23 + 0x01bb], %r31
cpu_intr_2_328:
	setx	0x42032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4952080  ! 4398: LDUHA_I	lduha	[%r20, + 0x0080] %asi, %r26
	ta	T_CHANGE_HPRIV
cpu_intr_2_329:
	setx	0x410332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb62c60fe  ! 4404: ANDN_I	andn 	%r17, 0x00fe, %r27
	.word 0xfc0cc000  ! 4409: LDUB_R	ldub	[%r19 + %r0], %r30
cpu_intr_2_330:
	setx	0x430217, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_382:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_382), 16, 16)) -> intp(2, 0, 26)
	.word 0xfc450000  ! 4413: LDSW_R	ldsw	[%r20 + %r0], %r30
cpu_intr_2_331:
	setx	0x42003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c40020  ! 4416: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r24
	.word 0xfc5ca1ce  ! 4417: LDX_I	ldx	[%r18 + 0x01ce], %r30
	.word 0xfe8521f9  ! 4420: LDUWA_I	lduwa	[%r20, + 0x01f9] %asi, %r31
iob_intr_2_383:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_383), 16, 16)) -> intp(2, 0, 38)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_2_384:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_384), 16, 16)) -> intp(2, 0, 1e)
cpu_intr_2_332:
	setx	0x420010, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_385:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_385), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_333:
	setx	0x400138, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_198:
	mov	0x16, %r14
	.word 0xf2db8e40  ! 4443: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf20c0000  ! 4446: LDUB_R	ldub	[%r16 + %r0], %r25
iob_intr_2_386:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_386), 16, 16)) -> intp(2, 0, 15)
	.word 0xf28c6031  ! 4451: LDUBA_I	lduba	[%r17, + 0x0031] %asi, %r25
	.word 0xfc950020  ! 4452: LDUHA_R	lduha	[%r20, %r0] 0x01, %r30
iob_intr_2_387:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_387), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_334:
	setx	0x430231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8c54020  ! 4459: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r28
	.word 0xf0150000  ! 4460: LDUH_R	lduh	[%r20 + %r0], %r24
T2_asi_reg_rd_199:
	mov	0xd, %r14
	.word 0xfcdb8e40  ! 4463: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf68d6063  ! 4464: LDUBA_I	lduba	[%r21, + 0x0063] %asi, %r27
	.word 0xf48521d6  ! 4465: LDUWA_I	lduwa	[%r20, + 0x01d6] %asi, %r26
	.word 0xf05da16e  ! 4467: LDX_I	ldx	[%r22 + 0x016e], %r24
	.word 0xfe948020  ! 4468: LDUHA_R	lduha	[%r18, %r0] 0x01, %r31
T2_asi_reg_wr_196:
	mov	0xc, %r14
	.word 0xfcf384a0  ! 4469: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_2_335:
	setx	0x40011f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_336:
	setx	0x400237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88c8020  ! 4474: LDUBA_R	lduba	[%r18, %r0] 0x01, %r28
	.word 0xfe5dc000  ! 4476: LDX_R	ldx	[%r23 + %r0], %r31
T2_asi_reg_wr_197:
	mov	0x35, %r14
	.word 0xf4f384a0  ! 4477: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T2_asi_reg_wr_198:
	mov	0x32, %r14
	.word 0xfcf38e60  ! 4481: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_2_337:
	setx	0x410038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe05e108  ! 4484: LDUW_I	lduw	[%r23 + 0x0108], %r31
cpu_intr_2_338:
	setx	0x43012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65de139  ! 4489: LDX_I	ldx	[%r23 + 0x0139], %r27
T2_asi_reg_rd_200:
	mov	0x3c7, %r14
	.word 0xfedb8e60  ! 4491: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0x8f902000  ! 4492: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xf24c2143  ! 4493: LDSB_I	ldsb	[%r16 + 0x0143], %r25
	.word 0xf44c61ac  ! 4494: LDSB_I	ldsb	[%r17 + 0x01ac], %r26
iob_intr_2_388:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_388), 16, 16)) -> intp(2, 0, 6)
	.word 0xfc0ca084  ! 4496: LDUB_I	ldub	[%r18 + 0x0084], %r30
cpu_intr_2_339:
	setx	0x400208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_340:
	setx	0x400327, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_201:
	mov	0x3c1, %r14
	.word 0xfadb8e80  ! 4501: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T2_asi_reg_wr_199:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 4505: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf04d6015  ! 4507: LDSB_I	ldsb	[%r21 + 0x0015], %r24
	.word 0xf444a02e  ! 4508: LDSW_I	ldsw	[%r18 + 0x002e], %r26
iob_intr_2_389:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_389), 16, 16)) -> intp(2, 0, 20)
T2_asi_reg_rd_202:
	mov	0x2, %r14
	.word 0xfedb8e40  ! 4510: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf60c6161  ! 4511: LDUB_I	ldub	[%r17 + 0x0161], %r27
T2_asi_reg_wr_200:
	mov	0xf, %r14
	.word 0xf8f38e40  ! 4512: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb4952144  ! 4515: ORcc_I	orcc 	%r20, 0x0144, %r26
	.word 0xf4c40020  ! 4520: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r26
T2_asi_reg_rd_203:
	mov	0x28, %r14
	.word 0xf6db8e60  ! 4521: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_201:
	mov	0x12, %r14
	.word 0xfaf38e40  ! 4523: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_wr_202:
	mov	0x16, %r14
	.word 0xf2f38e80  ! 4525: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_2_390:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_390), 16, 16)) -> intp(2, 0, c)
iob_intr_2_391:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_391), 16, 16)) -> intp(2, 0, 21)
	.word 0xfc5c0000  ! 4529: LDX_R	ldx	[%r16 + %r0], %r30
	ta	T_CHANGE_TO_TL0
	.word 0xfe54c000  ! 4533: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0xf4c520bc  ! 4535: LDSWA_I	ldswa	[%r20, + 0x00bc] %asi, %r26
	.word 0xf2440000  ! 4536: LDSW_R	ldsw	[%r16 + %r0], %r25
cpu_intr_2_341:
	setx	0x430336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf254c000  ! 4541: LDSH_R	ldsh	[%r19 + %r0], %r25
T2_asi_reg_rd_204:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 4544: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_392:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_392), 16, 16)) -> intp(2, 0, 3d)
cpu_intr_2_342:
	setx	0x420217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8da122  ! 4553: LDUBA_I	lduba	[%r22, + 0x0122] %asi, %r31
cpu_intr_2_343:
	setx	0x43022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf8d4c020  ! 4561: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r28
	.word 0xfa958020  ! 4567: LDUHA_R	lduha	[%r22, %r0] 0x01, %r29
	.word 0xfe5c0000  ! 4569: LDX_R	ldx	[%r16 + %r0], %r31
	.word 0xb92dd000  ! 4570: SLLX_R	sllx	%r23, %r0, %r28
	.word 0xb60c8000  ! 4572: AND_R	and 	%r18, %r0, %r27
	.word 0xfadce0cf  ! 4576: LDXA_I	ldxa	[%r19, + 0x00cf] %asi, %r29
	.word 0xf6040000  ! 4577: LDUW_R	lduw	[%r16 + %r0], %r27
	.word 0xfc8ca075  ! 4579: LDUBA_I	lduba	[%r18, + 0x0075] %asi, %r30
cpu_intr_2_344:
	setx	0x47011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb32d0000  ! 4583: SLL_R	sll 	%r20, %r0, %r25
T2_asi_reg_wr_203:
	mov	0x33, %r14
	.word 0xf4f384a0  ! 4585: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T2_asi_reg_rd_205:
	mov	0x8, %r14
	.word 0xfedb89e0  ! 4586: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfa54a182  ! 4592: LDSH_I	ldsh	[%r18 + 0x0182], %r29
iob_intr_2_393:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_393), 16, 16)) -> intp(2, 0, 18)
iob_intr_2_394:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_394), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_rd_206:
	mov	0x8, %r14
	.word 0xf4db8e80  ! 4598: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T2_asi_reg_rd_207:
	mov	0x33, %r14
	.word 0xf8db84a0  ! 4599: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb035e187  ! 4600: ORN_I	orn 	%r23, 0x0187, %r24
iob_intr_2_395:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_395), 16, 16)) -> intp(2, 0, 38)
	.word 0xf60da1ca  ! 4602: LDUB_I	ldub	[%r22 + 0x01ca], %r27
T2_asi_reg_rd_208:
	mov	0x33, %r14
	.word 0xf4db84a0  ! 4603: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xf00c0000  ! 4605: LDUB_R	ldub	[%r16 + %r0], %r24
	.word 0xf6846107  ! 4606: LDUWA_I	lduwa	[%r17, + 0x0107] %asi, %r27
cpu_intr_2_345:
	setx	0x46031d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_346:
	setx	0x470201, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xba35c000  ! 4617: ORN_R	orn 	%r23, %r0, %r29
	.word 0xf6cd0020  ! 4618: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r27
cpu_intr_2_347:
	setx	0x440201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_396:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_396), 16, 16)) -> intp(2, 0, 25)
	ta	T_CHANGE_NONHPRIV
	.word 0xf24ca084  ! 4624: LDSB_I	ldsb	[%r18 + 0x0084], %r25
iob_intr_2_397:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_397), 16, 16)) -> intp(2, 0, 34)
	.word 0xf45ce0f2  ! 4628: LDX_I	ldx	[%r19 + 0x00f2], %r26
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982dd0  ! 4629: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd0, %hpstate
T2_asi_reg_rd_209:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 4632: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_wr_204:
	mov	0x4, %r14
	.word 0xf6f38e40  ! 4633: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_wr_205:
	mov	0x6, %r14
	.word 0xf2f38e40  ! 4636: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_2_348:
	setx	0x440334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb485e1b8  ! 4640: ADDcc_I	addcc 	%r23, 0x01b8, %r26
T2_asi_reg_rd_210:
	mov	0xb, %r14
	.word 0xfedb8e80  ! 4643: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T2_asi_reg_wr_206:
	mov	0x22, %r14
	.word 0xfef38400  ! 4644: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	.word 0xfa040000  ! 4648: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0xfa8da1db  ! 4649: LDUBA_I	lduba	[%r22, + 0x01db] %asi, %r29
	ta	T_CHANGE_HPRIV
	.word 0xbf51c000  ! 4652: RDPR_TL	<illegal instruction>
	.word 0xfc15c000  ! 4654: LDUH_R	lduh	[%r23 + %r0], %r30
T2_asi_reg_wr_207:
	mov	0x26, %r14
	.word 0xf2f38400  ! 4660: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T2_asi_reg_rd_211:
	mov	0x18, %r14
	.word 0xfadb8e40  ! 4667: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_2_398:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_398), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_wr_208:
	mov	0x5, %r14
	.word 0xf0f389e0  ! 4672: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xfe4461b0  ! 4676: LDSW_I	ldsw	[%r17 + 0x01b0], %r31
	setx	data_start_0, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982892  ! 4678: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0892, %hpstate
T2_asi_reg_rd_212:
	mov	0x15, %r14
	.word 0xf0db8400  ! 4679: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb4a54000  ! 4689: SUBcc_R	subcc 	%r21, %r0, %r26
cpu_intr_2_349:
	setx	0x470213, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_350:
	setx	0x440335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8dda07d  ! 4695: LDXA_I	ldxa	[%r22, + 0x007d] %asi, %r28
cpu_intr_2_351:
	setx	0x44033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6cd2039  ! 4698: LDSBA_I	ldsba	[%r20, + 0x0039] %asi, %r27
	.word 0xf2cd0020  ! 4701: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r25
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982e92  ! 4702: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e92, %hpstate
cpu_intr_2_352:
	setx	0x47002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8bc8000  ! 4704: XNORcc_R	xnorcc 	%r18, %r0, %r28
	.word 0xf0cd8020  ! 4705: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r24
	.word 0xf0940020  ! 4708: LDUHA_R	lduha	[%r16, %r0] 0x01, %r24
T2_asi_reg_wr_209:
	mov	0x19, %r14
	.word 0xf4f38e40  ! 4711: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_wr_210:
	mov	0x20, %r14
	.word 0xfcf38e40  ! 4712: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_wr_211:
	mov	0x1e, %r14
	.word 0xfaf38e60  ! 4713: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf855e089  ! 4714: LDSH_I	ldsh	[%r23 + 0x0089], %r28
	.word 0xfe854020  ! 4715: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r31
iob_intr_2_399:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_399), 16, 16)) -> intp(2, 0, 6)
iob_intr_2_400:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_400), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_401:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_401), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_402:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_402), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_wr_212:
	mov	0x30, %r14
	.word 0xf0f38400  ! 4726: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_2_403:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_403), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_404:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_404), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_rd_213:
	mov	0x15, %r14
	.word 0xf2db8400  ! 4737: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xf45d8000  ! 4742: LDX_R	ldx	[%r22 + %r0], %r26
cpu_intr_2_353:
	setx	0x470321, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_214:
	mov	0x31, %r14
	.word 0xf2db8e40  ! 4745: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf60da16e  ! 4748: LDUB_I	ldub	[%r22 + 0x016e], %r27
iob_intr_2_405:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_405), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_rd_215:
	mov	0x1b, %r14
	.word 0xf6db8e40  ! 4751: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_2_354:
	setx	0x440015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf28d612b  ! 4753: LDUBA_I	lduba	[%r21, + 0x012b] %asi, %r25
	.word 0xbc24c000  ! 4755: SUB_R	sub 	%r19, %r0, %r30
	.word 0xfe544000  ! 4756: LDSH_R	ldsh	[%r17 + %r0], %r31
	.word 0xfcc46155  ! 4760: LDSWA_I	ldswa	[%r17, + 0x0155] %asi, %r30
	.word 0xfc45a00b  ! 4761: LDSW_I	ldsw	[%r22 + 0x000b], %r30
T2_asi_reg_rd_216:
	mov	0x3, %r14
	.word 0xf8db89e0  ! 4762: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_2_406:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_406), 16, 16)) -> intp(2, 0, 16)
T2_asi_reg_wr_213:
	mov	0x3c2, %r14
	.word 0xf0f38400  ! 4764: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_2_407:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_407), 16, 16)) -> intp(2, 0, 26)
iob_intr_2_408:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_408), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_wr_214:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 4768: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_355:
	setx	0x460315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45c4000  ! 4771: LDX_R	ldx	[%r17 + %r0], %r26
iob_intr_2_409:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_409), 16, 16)) -> intp(2, 0, 4)
	.word 0xb0ac4000  ! 4774: ANDNcc_R	andncc 	%r17, %r0, %r24
T2_asi_reg_rd_217:
	mov	0x3c8, %r14
	.word 0xfadb89e0  ! 4777: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_2_410:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_410), 16, 16)) -> intp(2, 0, 19)
	.word 0xf80da0bb  ! 4781: LDUB_I	ldub	[%r22 + 0x00bb], %r28
T2_asi_reg_rd_218:
	mov	0x12, %r14
	.word 0xfcdb89e0  ! 4782: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb5510000  ! 4783: RDPR_TICK	<illegal instruction>
	.word 0xbaac4000  ! 4784: ANDNcc_R	andncc 	%r17, %r0, %r29
cpu_intr_2_356:
	setx	0x470007, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_219:
	mov	0x2d, %r14
	.word 0xf8db8e60  ! 4794: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T2_asi_reg_rd_220:
	mov	0x13, %r14
	.word 0xf6db8e60  ! 4795: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf4c50020  ! 4796: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r26
T2_asi_reg_rd_221:
	mov	0x3c6, %r14
	.word 0xf8db8e60  ! 4797: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xfa5d2026  ! 4798: LDX_I	ldx	[%r20 + 0x0026], %r29
	.word 0xf6952036  ! 4801: LDUHA_I	lduha	[%r20, + 0x0036] %asi, %r27
	.word 0xf054e1e8  ! 4802: LDSH_I	ldsh	[%r19 + 0x01e8], %r24
iob_intr_2_411:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_411), 16, 16)) -> intp(2, 0, 34)
cpu_intr_2_357:
	setx	0x44011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_412:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_412), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_413:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_413), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_rd_222:
	mov	0x32, %r14
	.word 0xfadb8400  ! 4809: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xfecc0020  ! 4812: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r31
	.word 0xfe454000  ! 4819: LDSW_R	ldsw	[%r21 + %r0], %r31
T2_asi_reg_wr_215:
	mov	0x28, %r14
	.word 0xf0f384a0  ! 4821: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xfa4c2054  ! 4822: LDSB_I	ldsb	[%r16 + 0x0054], %r29
	.word 0xf8852018  ! 4823: LDUWA_I	lduwa	[%r20, + 0x0018] %asi, %r28
	.word 0xf8044000  ! 4824: LDUW_R	lduw	[%r17 + %r0], %r28
T2_asi_reg_wr_216:
	mov	0x1f, %r14
	.word 0xf0f38e60  ! 4825: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_2_358:
	setx	0x44022a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_359:
	setx	0x470022, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf48c4020  ! 4835: LDUBA_R	lduba	[%r17, %r0] 0x01, %r26
iob_intr_2_414:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_414), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf215a0b9  ! 4837: LDUH_I	lduh	[%r22 + 0x00b9], %r25
T2_asi_reg_rd_223:
	mov	0x33, %r14
	.word 0xfcdb8e60  ! 4838: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf64d8000  ! 4839: LDSB_R	ldsb	[%r22 + %r0], %r27
	.word 0xf8450000  ! 4840: LDSW_R	ldsw	[%r20 + %r0], %r28
iob_intr_2_415:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_415), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_416:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_416), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf6840020  ! 4847: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r27
cpu_intr_2_360:
	setx	0x450318, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_217:
	mov	0x11, %r14
	.word 0xf4f38e40  ! 4850: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_417:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_417), 16, 16)) -> intp(2, 0, 5)
cpu_intr_2_361:
	setx	0x450211, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfa0ce086  ! 4857: LDUB_I	ldub	[%r19 + 0x0086], %r29
	.word 0xf80c0000  ! 4863: LDUB_R	ldub	[%r16 + %r0], %r28
cpu_intr_2_362:
	setx	0x44010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_224:
	mov	0x3c4, %r14
	.word 0xf6db8400  ! 4866: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb43460fe  ! 4868: SUBC_I	orn 	%r17, 0x00fe, %r26
cpu_intr_2_363:
	setx	0x460132, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_225:
	mov	0x30, %r14
	.word 0xf8db8e60  ! 4873: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_2_418:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_418), 16, 16)) -> intp(2, 0, 1f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_364:
	setx	0x440337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0a50000  ! 4877: SUBcc_R	subcc 	%r20, %r0, %r24
T2_asi_reg_wr_218:
	mov	0x3c0, %r14
	.word 0xf8f38e40  ! 4879: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xfa540000  ! 4883: LDSH_R	ldsh	[%r16 + %r0], %r29
	.word 0xf054a1c3  ! 4887: LDSH_I	ldsh	[%r18 + 0x01c3], %r24
	.word 0xbebda0d0  ! 4893: XNORcc_I	xnorcc 	%r22, 0x00d0, %r31
iob_intr_2_419:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_419), 16, 16)) -> intp(2, 0, 13)
iob_intr_2_420:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_420), 16, 16)) -> intp(2, 0, 24)
T2_asi_reg_wr_219:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 4898: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T2_asi_reg_wr_220:
	mov	0x22, %r14
	.word 0xfcf38e60  ! 4900: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb0b560d5  ! 4904: SUBCcc_I	orncc 	%r21, 0x00d5, %r24
	.word 0xfa8c60ef  ! 4905: LDUBA_I	lduba	[%r17, + 0x00ef] %asi, %r29
iob_intr_2_421:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_421), 16, 16)) -> intp(2, 0, 39)
	.word 0xfc050000  ! 4909: LDUW_R	lduw	[%r20 + %r0], %r30
	ta	T_CHANGE_TO_TL1
iob_intr_2_422:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_422), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_wr_221:
	mov	0x9, %r14
	.word 0xfef38e80  ! 4915: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfe84215b  ! 4917: LDUWA_I	lduwa	[%r16, + 0x015b] %asi, %r31
T2_asi_reg_rd_226:
	mov	0x3c7, %r14
	.word 0xf6db89e0  ! 4920: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xf2456111  ! 4923: LDSW_I	ldsw	[%r21 + 0x0111], %r25
iob_intr_2_423:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_423), 16, 16)) -> intp(2, 0, 38)
	ta	T_CHANGE_HPRIV
	.word 0xf455c000  ! 4927: LDSH_R	ldsh	[%r23 + %r0], %r26
	.word 0xf88ca069  ! 4928: LDUBA_I	lduba	[%r18, + 0x0069] %asi, %r28
	.word 0xf44c4000  ! 4929: LDSB_R	ldsb	[%r17 + %r0], %r26
	.word 0xf88ca0d8  ! 4932: LDUBA_I	lduba	[%r18, + 0x00d8] %asi, %r28
	.word 0xb4ac8000  ! 4935: ANDNcc_R	andncc 	%r18, %r0, %r26
T2_asi_reg_rd_227:
	mov	0x22, %r14
	.word 0xfedb8e80  ! 4937: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf8c5a1c6  ! 4940: LDSWA_I	ldswa	[%r22, + 0x01c6] %asi, %r28
	.word 0xbb2ca001  ! 4941: SLL_I	sll 	%r18, 0x0001, %r29
T2_asi_reg_rd_228:
	mov	0x1f, %r14
	.word 0xfedb8400  ! 4942: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_2_365:
	setx	0x440305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2440000  ! 4945: LDSW_R	ldsw	[%r16 + %r0], %r25
T2_asi_reg_rd_229:
	mov	0x37, %r14
	.word 0xf6db8400  ! 4950: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf015e180  ! 4953: LDUH_I	lduh	[%r23 + 0x0180], %r24
T2_asi_reg_wr_222:
	mov	0x3c6, %r14
	.word 0xf2f38e60  ! 4954: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_230:
	mov	0x3c4, %r14
	.word 0xfcdb8e80  ! 4956: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfed48020  ! 4958: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r31
	.word 0xb4b5a052  ! 4959: SUBCcc_I	orncc 	%r22, 0x0052, %r26
	.word 0xf64d4000  ! 4960: LDSB_R	ldsb	[%r21 + %r0], %r27
T2_asi_reg_wr_223:
	mov	0x30, %r14
	.word 0xf0f384a0  ! 4961: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb3643801  ! 4962: MOVcc_I	<illegal instruction>
	.word 0xf2556148  ! 4963: LDSH_I	ldsh	[%r21 + 0x0148], %r25
cpu_intr_2_366:
	setx	0x470208, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_424:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_424), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfa0da03d  ! 4967: LDUB_I	ldub	[%r22 + 0x003d], %r29
	.word 0xfa0d61fe  ! 4968: LDUB_I	ldub	[%r21 + 0x01fe], %r29
iob_intr_2_425:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_425), 16, 16)) -> intp(2, 0, 3a)
	.word 0xbb35a001  ! 4970: SRL_I	srl 	%r22, 0x0001, %r29
	.word 0xf84c0000  ! 4972: LDSB_R	ldsb	[%r16 + %r0], %r28
iob_intr_2_426:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_426), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_427:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_427), 16, 16)) -> intp(2, 0, d)
cpu_intr_2_367:
	setx	0x46011f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_231:
	mov	0x1, %r14
	.word 0xf8db8e80  ! 4978: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xfa44c000  ! 4979: LDSW_R	ldsw	[%r19 + %r0], %r29
	.word 0xf0dd608e  ! 4985: LDXA_I	ldxa	[%r21, + 0x008e] %asi, %r24
	.word 0xf2d54020  ! 4986: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r25
	.word 0xfe4ce096  ! 4988: LDSB_I	ldsb	[%r19 + 0x0096], %r31
T2_asi_reg_wr_224:
	mov	0x3c3, %r14
	.word 0xf4f38e80  ! 4989: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb614c000  ! 4991: OR_R	or 	%r19, %r0, %r27
iob_intr_2_428:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_428), 16, 16)) -> intp(2, 0, 0)
	.word 0xf45d206d  ! 4998: LDX_I	ldx	[%r20 + 0x006d], %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_429:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_429), 16, 16)) -> intp(2, 0, a)
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
cpu_intr_1_0:
	setx	0x1b011a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_1:
	setx	0x1a0002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 4: FSQRTq	fsqrt	
	.word 0xbfa81c20  ! 7: FMOVRGEZ	dis not found

	.word 0xb7a548e0  ! 8: FSUBq	dis not found

iob_intr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_0), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_wr_0:
	mov	0x37, %r14
	.word 0xf6f38400  ! 11: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbba00540  ! 13: FSQRTd	fsqrt	
	.word 0xbda80820  ! 18: FMOVN	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_0:
	mov	0x29, %r14
	.word 0xf4db89e0  ! 20: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb21ca106  ! 22: XOR_I	xor 	%r18, 0x0106, %r25
	.word 0xb9a4c9a0  ! 24: FDIVs	fdivs	%f19, %f0, %f28
iob_intr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_1), 16, 16)) -> intp(1, 0, 11)
	.word 0xb29d0000  ! 26: XORcc_R	xorcc 	%r20, %r0, %r25
	.word 0xbea5e0ca  ! 28: SUBcc_I	subcc 	%r23, 0x00ca, %r31
iob_intr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_2), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb3a54840  ! 36: FADDd	faddd	%f52, %f0, %f56
iob_intr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_3), 16, 16)) -> intp(1, 0, 2d)
iob_intr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_4), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_rd_1:
	mov	0x24, %r14
	.word 0xf2db8e60  ! 42: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xbfa90820  ! 46: FMOVLEU	fmovs	%fcc1, %f0, %f31
iob_intr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_5), 16, 16)) -> intp(1, 0, d)
	.word 0xb7a80420  ! 49: FMOVRZ	dis not found

T1_asi_reg_rd_2:
	mov	0x1a, %r14
	.word 0xfcdb8e40  ! 50: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_6), 16, 16)) -> intp(1, 0, 25)
iob_intr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_7), 16, 16)) -> intp(1, 0, 13)
	.word 0xb7a80820  ! 57: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xbfa98820  ! 63: FMOVNEG	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_1:
	mov	0x17, %r14
	.word 0xf2f38e60  ! 64: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbfa80820  ! 65: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_3:
	mov	0x7, %r14
	.word 0xfcdb8400  ! 66: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_1_2:
	setx	0x1f012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81c20  ! 69: FMOVRGEZ	dis not found

T1_asi_reg_wr_2:
	mov	0x3c3, %r14
	.word 0xf0f38e60  ! 71: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_rd_4:
	mov	0x14, %r14
	.word 0xf6db8e60  ! 74: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbda94820  ! 79: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xb9a80820  ! 81: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0x85952080  ! 82: WRPR_TSTATE_I	wrpr	%r20, 0x0080, %tstate
T1_asi_reg_rd_5:
	mov	0x8, %r14
	.word 0xfedb8400  ! 83: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_8), 16, 16)) -> intp(1, 0, 12)
	.word 0xbba54820  ! 86: FADDs	fadds	%f21, %f0, %f29
T1_asi_reg_rd_6:
	mov	0x22, %r14
	.word 0xf8db8e80  ! 87: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_1_3:
	setx	0x1f0022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_9), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_wr_3:
	mov	0x3c0, %r14
	.word 0xfef389e0  ! 93: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_10), 16, 16)) -> intp(1, 0, 34)
	.word 0xbba509c0  ! 96: FDIVd	fdivd	%f20, %f0, %f60
	.word 0xb3a88820  ! 99: FMOVLE	fmovs	%fcc1, %f0, %f25
iob_intr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_11), 16, 16)) -> intp(1, 0, 2c)
	.word 0xbba98820  ! 101: FMOVNEG	fmovs	%fcc1, %f0, %f29
iob_intr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_12), 16, 16)) -> intp(1, 0, 11)
T1_asi_reg_rd_7:
	mov	0xc, %r14
	.word 0xf2db8e60  ! 103: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb3aa0820  ! 104: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb69cc000  ! 106: XORcc_R	xorcc 	%r19, %r0, %r27
	.word 0xb5aac820  ! 114: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a80c20  ! 115: FMOVRLZ	dis not found

T1_asi_reg_rd_8:
	mov	0x8, %r14
	.word 0xfadb8e40  ! 120: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb1a5c840  ! 122: FADDd	faddd	%f54, %f0, %f24
	.word 0xbda44860  ! 124: FADDq	dis not found

	.word 0xb2b42139  ! 128: SUBCcc_I	orncc 	%r16, 0x0139, %r25
	.word 0xbda548e0  ! 129: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb935a001  ! 133: SRL_I	srl 	%r22, 0x0001, %r28
iob_intr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_13), 16, 16)) -> intp(1, 0, 1b)
	lda	[%r18 + %g0] 0xf0, %f2
iob_intr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_14), 16, 16)) -> intp(1, 0, 3)
iob_intr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_15), 16, 16)) -> intp(1, 0, e)
	.word 0xbba448c0  ! 139: FSUBd	fsubd	%f48, %f0, %f60
iob_intr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_16), 16, 16)) -> intp(1, 0, 37)
	.word 0xbba5c960  ! 141: FMULq	dis not found

	.word 0xb3aa0820  ! 146: FMOVA	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_4:
	mov	0x0, %r14
	.word 0xf2f38e40  ! 147: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_17), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_4:
	setx	0x1d031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba844000  ! 152: ADDcc_R	addcc 	%r17, %r0, %r29
iob_intr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_18), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_5:
	setx	0x1f0221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_19), 16, 16)) -> intp(1, 0, d)
iob_intr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_20), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_21), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_rd_9:
	mov	0x3c6, %r14
	.word 0xfedb89e0  ! 160: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_22), 16, 16)) -> intp(1, 0, 15)
	.word 0xbda80820  ! 167: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xb5540000  ! 170: RDPR_GL	<illegal instruction>
	.word 0xb5a548e0  ! 171: FSUBq	dis not found

	.word 0xb9a58960  ! 174: FMULq	dis not found

cpu_intr_1_6:
	setx	0x1f033f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_7:
	setx	0x1c032d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_23), 16, 16)) -> intp(1, 0, 35)
	.word 0xb3504000  ! 183: RDPR_TNPC	<illegal instruction>
	.word 0xb68dc000  ! 184: ANDcc_R	andcc 	%r23, %r0, %r27
cpu_intr_1_8:
	setx	0x1e0214, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_10:
	mov	0x23, %r14
	.word 0xf6db89e0  ! 187: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_24), 16, 16)) -> intp(1, 0, 1d)
T1_asi_reg_rd_11:
	mov	0x11, %r14
	.word 0xfcdb8e40  ! 189: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb9aa0820  ! 192: FMOVA	fmovs	%fcc1, %f0, %f28
cpu_intr_1_9:
	setx	0x1e000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xbba00560  ! 200: FSQRTq	fsqrt	
	.word 0xb7a488c0  ! 203: FSUBd	fsubd	%f18, %f0, %f58
iob_intr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_25), 16, 16)) -> intp(1, 0, 30)
	.word 0xba15a0e6  ! 206: OR_I	or 	%r22, 0x00e6, %r29
	.word 0xb5ab8820  ! 208: FMOVPOS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_10:
	setx	0x1f012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a509e0  ! 210: FDIVq	dis not found

	.word 0xbba44960  ! 213: FMULq	dis not found

T1_asi_reg_rd_12:
	mov	0x1b, %r14
	.word 0xf2db8400  ! 214: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T1_asi_reg_rd_13:
	mov	0x18, %r14
	.word 0xfedb8e80  ! 220: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_26), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_rd_14:
	mov	0x38, %r14
	.word 0xf6db8e80  ! 224: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbbaa0820  ! 227: FMOVA	fmovs	%fcc1, %f0, %f29
cpu_intr_1_11:
	setx	0x1d0025, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_27), 16, 16)) -> intp(1, 0, 1e)
cpu_intr_1_12:
	setx	0x1d003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c920  ! 238: FMULs	fmuls	%f23, %f0, %f25
iob_intr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_28), 16, 16)) -> intp(1, 0, 3f)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a94820  ! 242: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb9a98820  ! 244: FMOVNEG	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_5:
	mov	0x2e, %r14
	.word 0xf0f384a0  ! 245: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbfa5c840  ! 246: FADDd	faddd	%f54, %f0, %f62
	.word 0xbe150000  ! 247: OR_R	or 	%r20, %r0, %r31
cpu_intr_1_13:
	setx	0x1d032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_14:
	setx	0x1f032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1abc820  ! 251: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb3a5c960  ! 252: FMULq	dis not found

iob_intr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_29), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb1a00560  ! 254: FSQRTq	fsqrt	
iob_intr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_30), 16, 16)) -> intp(1, 0, e)
	.word 0xb3ab0820  ! 258: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb3a00020  ! 259: FMOVs	fmovs	%f0, %f25
cpu_intr_1_15:
	setx	0x1d0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00520  ! 263: FSQRTs	fsqrt	
T1_asi_reg_wr_6:
	mov	0x13, %r14
	.word 0xfcf38e40  ! 264: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb694210a  ! 267: ORcc_I	orcc 	%r16, 0x010a, %r27
iob_intr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_31), 16, 16)) -> intp(1, 0, 23)
T1_asi_reg_wr_7:
	mov	0x1c, %r14
	.word 0xfef389e0  ! 269: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_1_16:
	setx	0x10106, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_32), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb7a00020  ! 272: FMOVs	fmovs	%f0, %f27
	.word 0xbb2cc000  ! 273: SLL_R	sll 	%r19, %r0, %r29
iob_intr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_33), 16, 16)) -> intp(1, 0, 8)
	lda	[%r18 + %g0] 0xf0, %f2
cpu_intr_1_17:
	setx	0x1c0317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_18:
	setx	0x1c022c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_34), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_19:
	setx	0x1f031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_15:
	mov	0x2c, %r14
	.word 0xf0db8e60  ! 295: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbda44820  ! 296: FADDs	fadds	%f17, %f0, %f30
cpu_intr_1_20:
	setx	0x1e0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81420  ! 304: FMOVRNZ	dis not found

cpu_intr_1_21:
	setx	0x1f030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa8820  ! 308: FMOVG	fmovs	%fcc1, %f0, %f24
iob_intr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_35), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_rd_16:
	mov	0x37, %r14
	.word 0xf6db8e60  ! 311: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbfab4820  ! 314: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xbfa589e0  ! 319: FDIVq	dis not found

	.word 0xb1a80c20  ! 321: FMOVRLZ	dis not found

cpu_intr_1_22:
	setx	0x1d0130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_36), 16, 16)) -> intp(1, 0, 17)
	.word 0xb9a81820  ! 326: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb1a80420  ! 327: FMOVRZ	dis not found

	.word 0xb22c61d4  ! 331: ANDN_I	andn 	%r17, 0x01d4, %r25
T1_asi_reg_rd_17:
	mov	0x24, %r14
	.word 0xfcdb8e40  ! 334: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb2944000  ! 336: ORcc_R	orcc 	%r17, %r0, %r25
	.word 0xbbaac820  ! 338: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb9a81820  ! 341: FMOVRGZ	fmovs	%fcc3, %f0, %f28
iob_intr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_37), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_rd_18:
	mov	0x8, %r14
	.word 0xf8db8e60  ! 347: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
cpu_intr_1_23:
	setx	0x1f0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda589e0  ! 350: FDIVq	dis not found

iob_intr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_38), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_rd_19:
	mov	0x3c7, %r14
	.word 0xf0db8e40  ! 354: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_39), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_24:
	setx	0x1e032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa0820  ! 362: FMOVA	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_8:
	mov	0x14, %r14
	.word 0xf4f38e60  ! 363: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_1_25:
	setx	0x1c0129, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_20:
	mov	0x3c3, %r14
	.word 0xfedb89e0  ! 366: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_wr_9:
	mov	0x8, %r14
	.word 0xf0f38e60  ! 369: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb9a5c8e0  ! 370: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a81c20  ! 373: FMOVRGEZ	dis not found

T1_asi_reg_rd_21:
	mov	0x3c1, %r14
	.word 0xf6db84a0  ! 374: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb49c605f  ! 376: XORcc_I	xorcc 	%r17, 0x005f, %r26
	.word 0xbc2d4000  ! 377: ANDN_R	andn 	%r21, %r0, %r30
T1_asi_reg_rd_22:
	mov	0x3c0, %r14
	.word 0xf4db8e80  ! 380: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xbba548e0  ! 385: FSUBq	dis not found

iob_intr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_40), 16, 16)) -> intp(1, 0, 11)
T1_asi_reg_wr_10:
	mov	0x2b, %r14
	.word 0xfef384a0  ! 389: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb3a00560  ! 391: FSQRTq	fsqrt	
T1_asi_reg_wr_11:
	mov	0xb, %r14
	.word 0xf4f384a0  ! 392: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_1_26:
	setx	0x1e0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00520  ! 395: FSQRTs	fsqrt	
iob_intr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_41), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb1a80820  ! 402: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xb73c9000  ! 404: SRAX_R	srax	%r18, %r0, %r27
	.word 0xbda81420  ! 411: FMOVRNZ	dis not found

	.word 0xbba90820  ! 419: FMOVLEU	fmovs	%fcc1, %f0, %f29
iob_intr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_42), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb3a44960  ! 423: FMULq	dis not found

T1_asi_reg_rd_23:
	mov	0x1f, %r14
	.word 0xf8db89e0  ! 424: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
iob_intr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_43), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_27:
	setx	0x1e032e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_44), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_28:
	setx	0x1f0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8ad20a1  ! 431: ANDNcc_I	andncc 	%r20, 0x00a1, %r28
	.word 0xbfa80820  ! 433: FMOVN	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_12:
	mov	0x28, %r14
	.word 0xf2f38e40  ! 435: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_45), 16, 16)) -> intp(1, 0, 10)
iob_intr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_46), 16, 16)) -> intp(1, 0, 20)
	.word 0xbba00040  ! 441: FMOVd	fmovd	%f0, %f60
iob_intr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_47), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_29:
	setx	0x1c0304, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_30:
	setx	0x1d0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb20d0000  ! 449: AND_R	and 	%r20, %r0, %r25
	.word 0xbfa8c820  ! 453: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb3a50820  ! 461: FADDs	fadds	%f20, %f0, %f25
	.word 0xb9aac820  ! 463: FMOVGE	fmovs	%fcc1, %f0, %f28
iob_intr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_48), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_31:
	setx	0x200019, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_49), 16, 16)) -> intp(1, 0, 20)
iob_intr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_50), 16, 16)) -> intp(1, 0, 37)
	.word 0xb7a80820  ! 474: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb9aa4820  ! 475: FMOVNE	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba81820  ! 481: FMOVRGZ	fmovs	%fcc3, %f0, %f29
cpu_intr_1_32:
	setx	0x20032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaa4820  ! 484: FMOVNE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_13:
	mov	0x3c4, %r14
	.word 0xfaf38e80  ! 487: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_1_33:
	setx	0x230338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72c0000  ! 490: SLL_R	sll 	%r16, %r0, %r27
	.word 0xb3a54860  ! 491: FADDq	dis not found

cpu_intr_1_34:
	setx	0x23011e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_51), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_wr_14:
	mov	0x1, %r14
	.word 0xf0f389e0  ! 498: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_1_35:
	setx	0x21023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda488c0  ! 501: FSUBd	fsubd	%f18, %f0, %f30
	.word 0xb7504000  ! 503: RDPR_TNPC	<illegal instruction>
	.word 0xb5ab8820  ! 505: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb2858000  ! 507: ADDcc_R	addcc 	%r22, %r0, %r25
cpu_intr_1_36:
	setx	0x22021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbea54000  ! 511: SUBcc_R	subcc 	%r21, %r0, %r31
cpu_intr_1_37:
	setx	0x220211, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_52), 16, 16)) -> intp(1, 0, 25)
cpu_intr_1_38:
	setx	0x200310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_53), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbfab8820  ! 522: FMOVPOS	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_24:
	mov	0x1c, %r14
	.word 0xf4db8e40  ! 524: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_wr_15:
	mov	0x15, %r14
	.word 0xf4f38400  ! 525: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T1_asi_reg_rd_25:
	mov	0xf, %r14
	.word 0xf6db8400  ! 527: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb7a81420  ! 531: FMOVRNZ	dis not found

cpu_intr_1_39:
	setx	0x23011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9ab4820  ! 535: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb9a80820  ! 538: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xbfa00020  ! 541: FMOVs	fmovs	%f0, %f31
iob_intr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_54), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_55), 16, 16)) -> intp(1, 0, e)
iob_intr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_56), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_40:
	setx	0x22011a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 550: FSQRTq	fsqrt	
T1_asi_reg_wr_16:
	mov	0x12, %r14
	.word 0xf8f38e40  ! 552: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_wr_17:
	mov	0x38, %r14
	.word 0xfcf38e40  ! 553: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_57), 16, 16)) -> intp(1, 0, 28)
	.word 0xbfa80420  ! 555: FMOVRZ	dis not found

	.word 0xbba4c9e0  ! 556: FDIVq	dis not found

	.word 0xbe1ce08f  ! 557: XOR_I	xor 	%r19, 0x008f, %r31
cpu_intr_1_41:
	setx	0x200113, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_18:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 562: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_rd_26:
	mov	0x20, %r14
	.word 0xf6db8400  ! 563: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_1_42:
	setx	0x200124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa589c0  ! 568: FDIVd	fdivd	%f22, %f0, %f62
cpu_intr_1_43:
	setx	0x200114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd3df001  ! 573: SRAX_I	srax	%r23, 0x0001, %r30
	.word 0xb5aa4820  ! 574: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb21d2160  ! 577: XOR_I	xor 	%r20, 0x0160, %r25
	.word 0xb3a00040  ! 578: FMOVd	fmovd	%f0, %f56
	.word 0xbfa9c820  ! 582: FMOVVS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_44:
	setx	0x21021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00020  ! 584: FMOVs	fmovs	%f0, %f26
cpu_intr_1_45:
	setx	0x20020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_58), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_46:
	setx	0x22012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80c20  ! 597: FMOVRLZ	dis not found

	.word 0xb6946075  ! 599: ORcc_I	orcc 	%r17, 0x0075, %r27
	lda	[%r16 + %g0] 0xf0, %f2
T1_asi_reg_wr_19:
	mov	0x0, %r14
	.word 0xf0f38e40  ! 602: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb6ada12c  ! 603: ANDNcc_I	andncc 	%r22, 0x012c, %r27
iob_intr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_59), 16, 16)) -> intp(1, 0, 31)
iob_intr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_60), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_wr_20:
	mov	0x3c0, %r14
	.word 0xf6f38400  ! 610: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb1a80c20  ! 611: FMOVRLZ	dis not found

	.word 0xb9a00560  ! 612: FSQRTq	fsqrt	
T1_asi_reg_wr_21:
	mov	0x7, %r14
	.word 0xfef38e40  ! 615: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb1aa4820  ! 616: FMOVNE	fmovs	%fcc1, %f0, %f24
iob_intr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_61), 16, 16)) -> intp(1, 0, 18)
	.word 0xb1aac820  ! 618: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb3a4c8c0  ! 619: FSUBd	fsubd	%f50, %f0, %f56
T1_asi_reg_rd_27:
	mov	0x3, %r14
	.word 0xfadb8e60  ! 620: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb17c8400  ! 625: MOVR_R	movre	%r18, %r0, %r24
	.word 0xbd500000  ! 628: RDPR_TPC	<illegal instruction>
	.word 0xb9a5c840  ! 629: FADDd	faddd	%f54, %f0, %f28
	.word 0xb9a408c0  ! 634: FSUBd	fsubd	%f16, %f0, %f28
	.word 0xbfabc820  ! 635: FMOVVC	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_28:
	mov	0x16, %r14
	.word 0xf4db89e0  ! 636: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb48d200c  ! 641: ANDcc_I	andcc 	%r20, 0x000c, %r26
iob_intr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_62), 16, 16)) -> intp(1, 0, 11)
	.word 0xb01c0000  ! 643: XOR_R	xor 	%r16, %r0, %r24
	.word 0xb3a00020  ! 644: FMOVs	fmovs	%f0, %f25
T1_asi_reg_wr_22:
	mov	0x1, %r14
	.word 0xf8f38e80  ! 647: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb1a81820  ! 650: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb32dc000  ! 651: SLL_R	sll 	%r23, %r0, %r25
iob_intr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_63), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb5a4c940  ! 658: FMULd	fmuld	%f50, %f0, %f26
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xb0358000  ! 661: SUBC_R	orn 	%r22, %r0, %r24
cpu_intr_1_47:
	setx	0x220213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2140000  ! 664: OR_R	or 	%r16, %r0, %r25
	.word 0xbfa5c960  ! 666: FMULq	dis not found

iob_intr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_64), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_65), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_wr_23:
	mov	0x3c3, %r14
	.word 0xfcf38e80  ! 671: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xbdaa8820  ! 674: FMOVG	fmovs	%fcc1, %f0, %f30
cpu_intr_1_48:
	setx	0x21030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_24:
	mov	0x36, %r14
	.word 0xfcf38e60  ! 681: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb6bdc000  ! 682: XNORcc_R	xnorcc 	%r23, %r0, %r27
cpu_intr_1_49:
	setx	0x21022f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_50:
	setx	0x21001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_51:
	setx	0x23020f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_25:
	mov	0xc, %r14
	.word 0xf6f389e0  ! 696: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_1_52:
	setx	0x230102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c8a0  ! 700: FSUBs	fsubs	%f23, %f0, %f26
iob_intr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_66), 16, 16)) -> intp(1, 0, 21)
	.word 0xb7a80c20  ! 706: FMOVRLZ	dis not found

	.word 0xb1a00540  ! 709: FSQRTd	fsqrt	
iob_intr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_67), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_68), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_69), 16, 16)) -> intp(1, 0, 32)
cpu_intr_1_53:
	setx	0x210127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_70), 16, 16)) -> intp(1, 0, 3)
	.word 0xb7a50840  ! 719: FADDd	faddd	%f20, %f0, %f58
T1_asi_reg_rd_29:
	mov	0x1c, %r14
	.word 0xf0db8e80  ! 721: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_71), 16, 16)) -> intp(1, 0, 32)
	.word 0xbd3de001  ! 726: SRA_I	sra 	%r23, 0x0001, %r30
T1_asi_reg_wr_26:
	mov	0x11, %r14
	.word 0xf2f389e0  ! 729: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_54:
	setx	0x23000e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_55:
	setx	0x230118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf341000  ! 735: SRLX_R	srlx	%r16, %r0, %r31
iob_intr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_72), 16, 16)) -> intp(1, 0, 31)
	.word 0xb9aa4820  ! 745: FMOVNE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_27:
	mov	0x0, %r14
	.word 0xf4f38e40  ! 746: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb83da01d  ! 747: XNOR_I	xnor 	%r22, 0x001d, %r28
T1_asi_reg_rd_30:
	mov	0x20, %r14
	.word 0xf0db8400  ! 749: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_rd_31:
	mov	0x3c0, %r14
	.word 0xf2db8e40  ! 750: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_73), 16, 16)) -> intp(1, 0, 3f)
cpu_intr_1_56:
	setx	0x200109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda84820  ! 760: FMOVE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_28:
	mov	0x3c7, %r14
	.word 0xf6f38e80  ! 764: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xba35a119  ! 766: SUBC_I	orn 	%r22, 0x0119, %r29
iob_intr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_74), 16, 16)) -> intp(1, 0, 36)
	.word 0xb72c2001  ! 768: SLL_I	sll 	%r16, 0x0001, %r27
	.word 0xbd3d2001  ! 769: SRA_I	sra 	%r20, 0x0001, %r30
iob_intr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_75), 16, 16)) -> intp(1, 0, 36)
cpu_intr_1_57:
	setx	0x220121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa44920  ! 782: FMULs	fmuls	%f17, %f0, %f31
	.word 0xbf3c9000  ! 783: SRAX_R	srax	%r18, %r0, %r31
	.word 0xb7a4c840  ! 784: FADDd	faddd	%f50, %f0, %f58
T1_asi_reg_wr_29:
	mov	0xd, %r14
	.word 0xfef389e0  ! 785: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_rd_32:
	mov	0x6, %r14
	.word 0xf6db8e80  ! 786: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb9a40960  ! 788: FMULq	dis not found

iob_intr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_76), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_wr_30:
	mov	0x33, %r14
	.word 0xf8f384a0  ! 796: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbfa4c8c0  ! 798: FSUBd	fsubd	%f50, %f0, %f62
iob_intr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_77), 16, 16)) -> intp(1, 0, 2d)
iob_intr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_78), 16, 16)) -> intp(1, 0, 22)
	.word 0xbda00560  ! 808: FSQRTq	fsqrt	
	.word 0xbe1ce0bb  ! 809: XOR_I	xor 	%r19, 0x00bb, %r31
cpu_intr_1_58:
	setx	0x210122, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_31:
	mov	0x20, %r14
	.word 0xf8f389e0  ! 816: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbba489a0  ! 819: FDIVs	fdivs	%f18, %f0, %f29
cpu_intr_1_59:
	setx	0x200326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8a54000  ! 826: SUBcc_R	subcc 	%r21, %r0, %r28
	.word 0xb3abc820  ! 828: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb5a80820  ! 829: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb3a00040  ! 830: FMOVd	fmovd	%f0, %f56
cpu_intr_1_60:
	setx	0x220000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa0820  ! 834: FMOVA	fmovs	%fcc1, %f0, %f24
cpu_intr_1_61:
	setx	0x200003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80c20  ! 837: FMOVRLZ	dis not found

iob_intr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_79), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb1a40920  ! 840: FMULs	fmuls	%f16, %f0, %f24
	.word 0xb1a549a0  ! 841: FDIVs	fdivs	%f21, %f0, %f24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_80), 16, 16)) -> intp(1, 0, 17)
iob_intr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_81), 16, 16)) -> intp(1, 0, 23)
	.word 0xb1a549a0  ! 848: FDIVs	fdivs	%f21, %f0, %f24
cpu_intr_1_62:
	setx	0x210330, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_33:
	mov	0x26, %r14
	.word 0xfadb84a0  ! 853: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T1_asi_reg_rd_34:
	mov	0x9, %r14
	.word 0xfadb8400  ! 854: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbda00560  ! 855: FSQRTq	fsqrt	
cpu_intr_1_63:
	setx	0x23001e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a508c0  ! 861: FSUBd	fsubd	%f20, %f0, %f24
iob_intr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_82), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb5a00540  ! 863: FSQRTd	fsqrt	
	.word 0xbc8c8000  ! 874: ANDcc_R	andcc 	%r18, %r0, %r30
	.word 0xbba00520  ! 876: FSQRTs	fsqrt	
cpu_intr_1_64:
	setx	0x230126, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_32:
	mov	0x3c2, %r14
	.word 0xf8f38e80  ! 879: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xba1c202f  ! 880: XOR_I	xor 	%r16, 0x002f, %r29
iob_intr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_83), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb4b52123  ! 885: ORNcc_I	orncc 	%r20, 0x0123, %r26
	.word 0xb7aac820  ! 887: FMOVGE	fmovs	%fcc1, %f0, %f27
iob_intr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_84), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb5a589e0  ! 892: FDIVq	dis not found

cpu_intr_1_65:
	setx	0x20032c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_85), 16, 16)) -> intp(1, 0, 1e)
iob_intr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_86), 16, 16)) -> intp(1, 0, 1e)
T1_asi_reg_wr_33:
	mov	0xe, %r14
	.word 0xfaf38e40  ! 899: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_87), 16, 16)) -> intp(1, 0, 12)
	.word 0xb1a40920  ! 902: FMULs	fmuls	%f16, %f0, %f24
	.word 0xb5a5c8a0  ! 906: FSUBs	fsubs	%f23, %f0, %f26
	.word 0xb5a81420  ! 909: FMOVRNZ	dis not found

cpu_intr_1_66:
	setx	0x210117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_67:
	setx	0x20002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd643801  ! 914: MOVcc_I	<illegal instruction>
	.word 0xb3a00560  ! 916: FSQRTq	fsqrt	
cpu_intr_1_68:
	setx	0x210032, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_35:
	mov	0x3c0, %r14
	.word 0xf2db84a0  ! 926: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
T1_asi_reg_wr_34:
	mov	0x31, %r14
	.word 0xf2f38e60  ! 927: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xbf2d8000  ! 928: SLL_R	sll 	%r22, %r0, %r31
cpu_intr_1_69:
	setx	0x27020f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_36:
	mov	0x6, %r14
	.word 0xf0db8e60  ! 931: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb3a48940  ! 935: FMULd	fmuld	%f18, %f0, %f56
T1_asi_reg_rd_37:
	mov	0x1e, %r14
	.word 0xfadb8e40  ! 936: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb5a90820  ! 940: FMOVLEU	fmovs	%fcc1, %f0, %f26
cpu_intr_1_70:
	setx	0x240108, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_88), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_wr_35:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 945: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb7a448e0  ! 947: FSUBq	dis not found

T1_asi_reg_rd_38:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 952: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb7354000  ! 954: SRL_R	srl 	%r21, %r0, %r27
	.word 0xbda8c820  ! 955: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb7540000  ! 960: RDPR_GL	<illegal instruction>
T1_asi_reg_rd_39:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 961: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_89), 16, 16)) -> intp(1, 0, 11)
	.word 0xb2b5a072  ! 965: ORNcc_I	orncc 	%r22, 0x0072, %r25
	.word 0xb5a549c0  ! 966: FDIVd	fdivd	%f52, %f0, %f26
T1_asi_reg_wr_36:
	mov	0x3c3, %r14
	.word 0xf0f389e0  ! 968: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_90), 16, 16)) -> intp(1, 0, 5)
	.word 0xb9a00560  ! 972: FSQRTq	fsqrt	
T1_asi_reg_rd_40:
	mov	0x8, %r14
	.word 0xfadb84a0  ! 974: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_91), 16, 16)) -> intp(1, 0, 1a)
iob_intr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_92), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_93), 16, 16)) -> intp(1, 0, 24)
cpu_intr_1_71:
	setx	0x25010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a9c820  ! 984: FMOVVS	fmovs	%fcc1, %f0, %f24
iob_intr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_94), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_72:
	setx	0x27033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80420  ! 993: FMOVRZ	dis not found

	.word 0x8f902000  ! 994: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xb7a54820  ! 995: FADDs	fadds	%f21, %f0, %f27
T1_asi_reg_wr_37:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 997: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_95), 16, 16)) -> intp(1, 0, 33)
cpu_intr_1_73:
	setx	0x270103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_96), 16, 16)) -> intp(1, 0, 13)
	.word 0xb3a548a0  ! 1004: FSUBs	fsubs	%f21, %f0, %f25
iob_intr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_97), 16, 16)) -> intp(1, 0, 22)
	.word 0xb5a81420  ! 1007: FMOVRNZ	dis not found

iob_intr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_98), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_rd_41:
	mov	0x21, %r14
	.word 0xf2db8e40  ! 1011: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_99), 16, 16)) -> intp(1, 0, 2)
	.word 0xb3a81c20  ! 1014: FMOVRGEZ	dis not found

T1_asi_reg_rd_42:
	mov	0x3c5, %r14
	.word 0xfadb8e60  ! 1016: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_1_74:
	setx	0x27001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaac820  ! 1018: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb7aa0820  ! 1019: FMOVA	fmovs	%fcc1, %f0, %f27
cpu_intr_1_75:
	setx	0x26031f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_76:
	setx	0x24033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_43:
	mov	0x33, %r14
	.word 0xf6db8e80  ! 1024: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb1aa4820  ! 1026: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb12d2001  ! 1027: SLL_I	sll 	%r20, 0x0001, %r24
	.word 0xb9a489a0  ! 1028: FDIVs	fdivs	%f18, %f0, %f28
	.word 0xb88d0000  ! 1029: ANDcc_R	andcc 	%r20, %r0, %r28
T1_asi_reg_wr_38:
	mov	0x3c6, %r14
	.word 0xf6f384a0  ! 1030: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_100), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_101), 16, 16)) -> intp(1, 0, 2c)
	.word 0xbfa00540  ! 1042: FSQRTd	fsqrt	
	.word 0xb3a8c820  ! 1043: FMOVL	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_44:
	mov	0x2a, %r14
	.word 0xf4db8e40  ! 1044: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_102), 16, 16)) -> intp(1, 0, 3d)
T1_asi_reg_rd_45:
	mov	0xe, %r14
	.word 0xf8db8400  ! 1046: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T1_asi_reg_rd_46:
	mov	0x30, %r14
	.word 0xfedb8400  ! 1049: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_103), 16, 16)) -> intp(1, 0, 2e)
T1_asi_reg_wr_39:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 1053: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_rd_47:
	mov	0xe, %r14
	.word 0xf4db8e40  ! 1064: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_wr_40:
	mov	0x8, %r14
	.word 0xfcf38e80  ! 1065: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T1_asi_reg_rd_48:
	mov	0x15, %r14
	.word 0xfadb8e80  ! 1067: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb5a98820  ! 1069: FMOVNEG	fmovs	%fcc1, %f0, %f26
iob_intr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_104), 16, 16)) -> intp(1, 0, 10)
	.word 0xb5a80820  ! 1073: FMOVN	fmovs	%fcc1, %f0, %f26
cpu_intr_1_77:
	setx	0x240010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 1076: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xbda00020  ! 1079: FMOVs	fmovs	%f0, %f30
iob_intr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_105), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_rd_49:
	mov	0xc, %r14
	.word 0xf2db89e0  ! 1085: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb7a5c9a0  ! 1086: FDIVs	fdivs	%f23, %f0, %f27
	.word 0x8794210e  ! 1087: WRPR_TT_I	wrpr	%r16, 0x010e, %tt
iob_intr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_106), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_107), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_78:
	setx	0x27010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81420  ! 1096: FMOVRNZ	dis not found

iob_intr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_108), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_rd_50:
	mov	0x3c7, %r14
	.word 0xf0db89e0  ! 1099: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb1a00540  ! 1100: FSQRTd	fsqrt	
T1_asi_reg_rd_51:
	mov	0x21, %r14
	.word 0xf0db89e0  ! 1103: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T1_asi_reg_rd_52:
	mov	0x4, %r14
	.word 0xf8db8400  ! 1106: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_109), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_wr_41:
	mov	0x30, %r14
	.word 0xf0f38e40  ! 1109: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb1a80820  ! 1110: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbf3cc000  ! 1112: SRA_R	sra 	%r19, %r0, %r31
iob_intr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_110), 16, 16)) -> intp(1, 0, 30)
	.word 0xbbabc820  ! 1114: FMOVVC	fmovs	%fcc1, %f0, %f29
iob_intr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_111), 16, 16)) -> intp(1, 0, a)
	.word 0xb08c8000  ! 1121: ANDcc_R	andcc 	%r18, %r0, %r24
T1_asi_reg_wr_42:
	mov	0x1e, %r14
	.word 0xf8f38e60  ! 1122: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_112), 16, 16)) -> intp(1, 0, 3)
	.word 0xb1a80820  ! 1129: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbfa58940  ! 1133: FMULd	fmuld	%f22, %f0, %f62
T1_asi_reg_wr_43:
	mov	0x37, %r14
	.word 0xfcf38400  ! 1134: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_113), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbba8c820  ! 1138: FMOVL	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_53:
	mov	0x3c1, %r14
	.word 0xf0db8e80  ! 1139: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbba44940  ! 1140: FMULd	fmuld	%f48, %f0, %f60
	.word 0xb1a44960  ! 1141: FMULq	dis not found

iob_intr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_114), 16, 16)) -> intp(1, 0, 15)
cpu_intr_1_79:
	setx	0x25000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_80:
	setx	0x260213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a48860  ! 1151: FADDq	dis not found

	.word 0xb1a88820  ! 1152: FMOVLE	fmovs	%fcc1, %f0, %f24
iob_intr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_115), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_81:
	setx	0x240010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00040  ! 1157: FMOVd	fmovd	%f0, %f56
T1_asi_reg_rd_54:
	mov	0x32, %r14
	.word 0xfedb84a0  ! 1159: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_1_82:
	setx	0x240128, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_55:
	mov	0x19, %r14
	.word 0xfadb8e40  ! 1162: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_116), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb7a00520  ! 1164: FSQRTs	fsqrt	
cpu_intr_1_83:
	setx	0x26002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_56:
	mov	0x0, %r14
	.word 0xfadb8e60  ! 1172: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbfa449c0  ! 1173: FDIVd	fdivd	%f48, %f0, %f62
	.word 0xbb508000  ! 1174: RDPR_TSTATE	<illegal instruction>
iob_intr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_117), 16, 16)) -> intp(1, 0, f)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfaa4820  ! 1182: FMOVNE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_84:
	setx	0x26021c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_85:
	setx	0x270109, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_86:
	setx	0x270238, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_44:
	mov	0x8, %r14
	.word 0xfcf38e60  ! 1187: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T1_asi_reg_rd_57:
	mov	0x9, %r14
	.word 0xf6db8400  ! 1188: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T1_asi_reg_rd_58:
	mov	0x2, %r14
	.word 0xf4db8e80  ! 1190: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_1_87:
	setx	0x240229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb88c0000  ! 1194: ANDcc_R	andcc 	%r16, %r0, %r28
	.word 0xb5508000  ! 1195: RDPR_TSTATE	<illegal instruction>
iob_intr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_118), 16, 16)) -> intp(1, 0, 1f)
cpu_intr_1_88:
	setx	0x26031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2aca182  ! 1200: ANDNcc_I	andncc 	%r18, 0x0182, %r25
	.word 0xb7a80c20  ! 1202: FMOVRLZ	dis not found

cpu_intr_1_89:
	setx	0x24022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a9c820  ! 1205: FMOVVS	fmovs	%fcc1, %f0, %f24
iob_intr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_119), 16, 16)) -> intp(1, 0, b)
iob_intr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_120), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_wr_45:
	mov	0xd, %r14
	.word 0xf2f38e40  ! 1210: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T1_asi_reg_wr_46:
	mov	0x28, %r14
	.word 0xf2f38e60  ! 1213: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T1_asi_reg_rd_59:
	mov	0x3c0, %r14
	.word 0xfcdb8e40  ! 1217: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_wr_47:
	mov	0x15, %r14
	.word 0xf4f38e80  ! 1218: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb72db001  ! 1219: SLLX_I	sllx	%r22, 0x0001, %r27
cpu_intr_1_90:
	setx	0x26020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_121), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_wr_48:
	mov	0x30, %r14
	.word 0xfcf38e60  ! 1226: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_1_91:
	setx	0x270034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00020  ! 1230: FMOVs	fmovs	%f0, %f27
	.word 0xba24a016  ! 1232: SUB_I	sub 	%r18, 0x0016, %r29
	.word 0xbbabc820  ! 1233: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb4054000  ! 1234: ADD_R	add 	%r21, %r0, %r26
cpu_intr_1_92:
	setx	0x260224, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_122), 16, 16)) -> intp(1, 0, 21)
iob_intr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_123), 16, 16)) -> intp(1, 0, 26)
	.word 0xb1a40840  ! 1249: FADDd	faddd	%f16, %f0, %f24
T1_asi_reg_rd_60:
	mov	0x37, %r14
	.word 0xfcdb8400  ! 1254: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_rd_61:
	mov	0x3c1, %r14
	.word 0xfcdb84a0  ! 1255: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_124), 16, 16)) -> intp(1, 0, 1a)
iob_intr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_125), 16, 16)) -> intp(1, 0, 21)
	.word 0xbba589e0  ! 1259: FDIVq	dis not found

cpu_intr_1_93:
	setx	0x270222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda58860  ! 1261: FADDq	dis not found

iob_intr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_126), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbd500000  ! 1266: RDPR_TPC	<illegal instruction>
T1_asi_reg_rd_62:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 1268: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbda81820  ! 1269: FMOVRGZ	fmovs	%fcc3, %f0, %f30
cpu_intr_1_94:
	setx	0x24002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80820  ! 1272: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb3aac820  ! 1275: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xbebd4000  ! 1278: XNORcc_R	xnorcc 	%r21, %r0, %r31
T1_asi_reg_wr_49:
	mov	0x33, %r14
	.word 0xfaf38400  ! 1281: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_wr_50:
	mov	0xa, %r14
	.word 0xf8f384a0  ! 1285: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_95:
	setx	0x260021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_127), 16, 16)) -> intp(1, 0, 2a)
T1_asi_reg_rd_63:
	mov	0x3c2, %r14
	.word 0xfadb84a0  ! 1291: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb0058000  ! 1292: ADD_R	add 	%r22, %r0, %r24
	lda	[%r16 + %g0] 0xf0, %f2
T1_asi_reg_rd_64:
	mov	0x3c6, %r14
	.word 0xfcdb8400  ! 1295: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_wr_51:
	mov	0x1e, %r14
	.word 0xfef38e60  ! 1296: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_128), 16, 16)) -> intp(1, 0, 9)
	.word 0xbfa58840  ! 1300: FADDd	faddd	%f22, %f0, %f62
	.word 0xb9a81420  ! 1303: FMOVRNZ	dis not found

	.word 0xbb7dc400  ! 1304: MOVR_R	movre	%r23, %r0, %r29
T1_asi_reg_rd_65:
	mov	0x3c1, %r14
	.word 0xf4db8400  ! 1305: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_1_96:
	setx	0x260237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_97:
	setx	0x27021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a548e0  ! 1310: FSUBq	dis not found

	.word 0xb9a8c820  ! 1321: FMOVL	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_66:
	mov	0x5, %r14
	.word 0xfcdb84a0  ! 1322: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_129), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_rd_67:
	mov	0x2, %r14
	.word 0xfcdb8e80  ! 1327: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb48d8000  ! 1329: ANDcc_R	andcc 	%r22, %r0, %r26
	.word 0xbdab8820  ! 1332: FMOVPOS	fmovs	%fcc1, %f0, %f30
iob_intr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_130), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_131), 16, 16)) -> intp(1, 0, 39)
	.word 0xbda448c0  ! 1335: FSUBd	fsubd	%f48, %f0, %f30
iob_intr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_132), 16, 16)) -> intp(1, 0, 2)
	.word 0xbba489c0  ! 1339: FDIVd	fdivd	%f18, %f0, %f60
T1_asi_reg_rd_68:
	mov	0x3c5, %r14
	.word 0xfadb89e0  ! 1342: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_1_98:
	setx	0x24032c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_99:
	setx	0x260217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb69d610d  ! 1346: XORcc_I	xorcc 	%r21, 0x010d, %r27
iob_intr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_133), 16, 16)) -> intp(1, 0, 31)
	.word 0xb92ca001  ! 1350: SLL_I	sll 	%r18, 0x0001, %r28
	.word 0xb9a00520  ! 1351: FSQRTs	fsqrt	
	.word 0xbfa00540  ! 1354: FSQRTd	fsqrt	
iob_intr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_134), 16, 16)) -> intp(1, 0, 1c)
T1_asi_reg_rd_69:
	mov	0xa, %r14
	.word 0xf0db8e80  ! 1356: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb7a00540  ! 1358: FSQRTd	fsqrt	
	.word 0xbba54860  ! 1359: FADDq	dis not found

	.word 0xb1a00560  ! 1360: FSQRTq	fsqrt	
	.word 0xb7a00520  ! 1361: FSQRTs	fsqrt	
	.word 0xb7ab0820  ! 1362: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0x8f902001  ! 1364: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb0b520ee  ! 1371: ORNcc_I	orncc 	%r20, 0x00ee, %r24
cpu_intr_1_100:
	setx	0x24030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_101:
	setx	0x270212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c9c0  ! 1376: FDIVd	fdivd	%f54, %f0, %f56
cpu_intr_1_102:
	setx	0x280324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba84820  ! 1379: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xba4460a4  ! 1380: ADDC_I	addc 	%r17, 0x00a4, %r29
	.word 0xba850000  ! 1381: ADDcc_R	addcc 	%r20, %r0, %r29
T1_asi_reg_rd_70:
	mov	0x32, %r14
	.word 0xf6db8e60  ! 1385: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb3a44960  ! 1386: FMULq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_135), 16, 16)) -> intp(1, 0, 17)
	.word 0xb6b560d8  ! 1394: ORNcc_I	orncc 	%r21, 0x00d8, %r27
T1_asi_reg_wr_52:
	mov	0x3c7, %r14
	.word 0xf2f38e60  ! 1395: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T1_asi_reg_rd_71:
	mov	0x3c6, %r14
	.word 0xf4db8e60  ! 1396: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_1_103:
	setx	0x280110, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_104:
	setx	0x280221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a54840  ! 1407: FADDd	faddd	%f52, %f0, %f24
	.word 0xbfa409e0  ! 1408: FDIVq	dis not found

	.word 0xb635a043  ! 1411: ORN_I	orn 	%r22, 0x0043, %r27
cpu_intr_1_105:
	setx	0x28001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00540  ! 1418: FSQRTd	fsqrt	
	.word 0xbba50920  ! 1419: FMULs	fmuls	%f20, %f0, %f29
T1_asi_reg_wr_53:
	mov	0xd, %r14
	.word 0xfaf389e0  ! 1420: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T1_asi_reg_rd_72:
	mov	0x24, %r14
	.word 0xf8db84a0  ! 1422: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_136), 16, 16)) -> intp(1, 0, 39)
	.word 0xb1a8c820  ! 1424: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xbda94820  ! 1426: FMOVCS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_54:
	mov	0x3c4, %r14
	.word 0xfef38e80  ! 1430: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_rd_73:
	mov	0x26, %r14
	.word 0xfedb8e80  ! 1431: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbfaa0820  ! 1434: FMOVA	fmovs	%fcc1, %f0, %f31
cpu_intr_1_106:
	setx	0x2a0037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_137), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbba00520  ! 1440: FSQRTs	fsqrt	
T1_asi_reg_wr_55:
	mov	0x3c5, %r14
	.word 0xf0f38e80  ! 1441: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T1_asi_reg_wr_56:
	mov	0x20, %r14
	.word 0xf4f384a0  ! 1442: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_138), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_139), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb7a9c820  ! 1452: FMOVVS	fmovs	%fcc1, %f0, %f27
cpu_intr_1_107:
	setx	0x290034, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_108:
	setx	0x290222, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_109:
	setx	0x29000b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_140), 16, 16)) -> intp(1, 0, 4)
	.word 0xb4358000  ! 1463: SUBC_R	orn 	%r22, %r0, %r26
cpu_intr_1_110:
	setx	0x2b0230, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_57:
	mov	0x1b, %r14
	.word 0xfef38e80  ! 1465: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb824e08b  ! 1467: SUB_I	sub 	%r19, 0x008b, %r28
	.word 0xbba408c0  ! 1469: FSUBd	fsubd	%f16, %f0, %f60
	.word 0xb1a448e0  ! 1472: FSUBq	dis not found

T1_asi_reg_rd_74:
	mov	0x3c1, %r14
	.word 0xf2db8e60  ! 1473: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb7a00560  ! 1474: FSQRTq	fsqrt	
T1_asi_reg_wr_58:
	mov	0xe, %r14
	.word 0xf4f389e0  ! 1477: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_1_111:
	setx	0x2a0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80420  ! 1481: FMOVRZ	dis not found

	lda	[%r22 + %g0] 0xf0, %f2
iob_intr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_141), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_112:
	setx	0x2b012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_113:
	setx	0x2a000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa588e0  ! 1488: FSUBq	dis not found

T1_asi_reg_wr_59:
	mov	0x23, %r14
	.word 0xf6f389e0  ! 1489: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_1_114:
	setx	0x280034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa8820  ! 1493: FMOVG	fmovs	%fcc1, %f0, %f28
cpu_intr_1_115:
	setx	0x2b013e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_60:
	mov	0x3c3, %r14
	.word 0xf2f384a0  ! 1499: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_1_116:
	setx	0x290302, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aac820  ! 1503: FMOVGE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_61:
	mov	0x3c1, %r14
	.word 0xfcf38400  ! 1506: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xba34c000  ! 1510: ORN_R	orn 	%r19, %r0, %r29
cpu_intr_1_117:
	setx	0x20132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_118:
	setx	0x280115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a98820  ! 1518: FMOVNEG	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_75:
	mov	0x3, %r14
	.word 0xf4db8e40  ! 1520: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_rd_76:
	mov	0x1c, %r14
	.word 0xf0db8e40  ! 1521: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_wr_62:
	mov	0x36, %r14
	.word 0xf0f38e40  ! 1525: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbfabc820  ! 1527: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb935d000  ! 1528: SRLX_R	srlx	%r23, %r0, %r28
	.word 0xb9a5c8e0  ! 1531: FSUBq	dis not found

	.word 0xb7a80420  ! 1532: FMOVRZ	dis not found

	.word 0xb7ab4820  ! 1533: FMOVCC	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_63:
	mov	0x21, %r14
	.word 0xf8f38e80  ! 1535: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb9a00560  ! 1536: FSQRTq	fsqrt	
iob_intr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_142), 16, 16)) -> intp(1, 0, 32)
cpu_intr_1_119:
	setx	0x280301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00560  ! 1546: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfa409e0  ! 1553: FDIVq	dis not found

T1_asi_reg_rd_77:
	mov	0x3c0, %r14
	.word 0xf2db8e40  ! 1555: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_143), 16, 16)) -> intp(1, 0, 31)
	.word 0xb83d6123  ! 1558: XNOR_I	xnor 	%r21, 0x0123, %r28
	.word 0xb7a81420  ! 1559: FMOVRNZ	dis not found

iob_intr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_144), 16, 16)) -> intp(1, 0, 1e)
cpu_intr_1_120:
	setx	0x290319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaac820  ! 1564: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb62dc000  ! 1567: ANDN_R	andn 	%r23, %r0, %r27
	.word 0xb7a508c0  ! 1568: FSUBd	fsubd	%f20, %f0, %f58
	.word 0xbba81820  ! 1569: FMOVRGZ	fmovs	%fcc3, %f0, %f29
iob_intr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_145), 16, 16)) -> intp(1, 0, 13)
	.word 0xb3a408e0  ! 1577: FSUBq	dis not found

	.word 0xb5a409c0  ! 1578: FDIVd	fdivd	%f16, %f0, %f26
cpu_intr_1_121:
	setx	0x2a0307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 1582: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
cpu_intr_1_122:
	setx	0x280218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c9a0  ! 1588: FDIVs	fdivs	%f23, %f0, %f25
	.word 0xbc1c8000  ! 1591: XOR_R	xor 	%r18, %r0, %r30
	.word 0xb5a84820  ! 1593: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb3a9c820  ! 1596: FMOVVS	fmovs	%fcc1, %f0, %f25
iob_intr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_146), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb3a81c20  ! 1601: FMOVRGEZ	dis not found

cpu_intr_1_123:
	setx	0x280307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_124:
	setx	0x290018, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_64:
	mov	0x14, %r14
	.word 0xfaf389e0  ! 1605: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T1_asi_reg_rd_78:
	mov	0x3c0, %r14
	.word 0xf2db8e60  ! 1606: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbfa54820  ! 1607: FADDs	fadds	%f21, %f0, %f31
	.word 0xbfa81820  ! 1608: FMOVRGZ	fmovs	%fcc3, %f0, %f31
cpu_intr_1_125:
	setx	0x2b0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe3461c5  ! 1613: ORN_I	orn 	%r17, 0x01c5, %r31
iob_intr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_147), 16, 16)) -> intp(1, 0, c)
	.word 0xbbaac820  ! 1622: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb3aa0820  ! 1623: FMOVA	fmovs	%fcc1, %f0, %f25
iob_intr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_148), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_wr_65:
	mov	0x20, %r14
	.word 0xfaf38e80  ! 1630: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T1_asi_reg_wr_66:
	mov	0x14, %r14
	.word 0xfaf384a0  ! 1631: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb1a00020  ! 1632: FMOVs	fmovs	%f0, %f24
T1_asi_reg_wr_67:
	mov	0x3c2, %r14
	.word 0xfaf38e60  ! 1639: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T1_asi_reg_rd_79:
	mov	0x10, %r14
	.word 0xf2db89e0  ! 1644: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbda00040  ! 1647: FMOVd	fmovd	%f0, %f30
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xb52d2001  ! 1651: SLL_I	sll 	%r20, 0x0001, %r26
	.word 0xb7a50920  ! 1652: FMULs	fmuls	%f20, %f0, %f27
cpu_intr_1_126:
	setx	0x2a0106, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_127:
	setx	0x2b0022, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xb3a88820  ! 1660: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb7a88820  ! 1661: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb445c000  ! 1662: ADDC_R	addc 	%r23, %r0, %r26
T1_asi_reg_rd_80:
	mov	0x1e, %r14
	.word 0xf4db8e60  ! 1663: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_1_128:
	setx	0x2a032e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_149), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb7a80820  ! 1675: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
cpu_intr_1_129:
	setx	0x2b000f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_150), 16, 16)) -> intp(1, 0, 7)
	.word 0xb1aac820  ! 1678: FMOVGE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_81:
	mov	0xe, %r14
	.word 0xfedb89e0  ! 1685: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb1aac820  ! 1686: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb52d6001  ! 1688: SLL_I	sll 	%r21, 0x0001, %r26
iob_intr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_151), 16, 16)) -> intp(1, 0, 3e)
	.word 0xb3a549c0  ! 1694: FDIVd	fdivd	%f52, %f0, %f56
	.word 0xbda40820  ! 1697: FADDs	fadds	%f16, %f0, %f30
cpu_intr_1_130:
	setx	0x280108, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_82:
	mov	0x1, %r14
	.word 0xfadb89e0  ! 1699: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb9ab8820  ! 1700: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xbda80820  ! 1701: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_68:
	mov	0x1e, %r14
	.word 0xf2f384a0  ! 1702: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb9a40860  ! 1703: FADDq	dis not found

	.word 0xb9a4c840  ! 1706: FADDd	faddd	%f50, %f0, %f28
T1_asi_reg_rd_83:
	mov	0x1a, %r14
	.word 0xf0db8e40  ! 1707: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb5a94820  ! 1708: FMOVCS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_131:
	setx	0x28000b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_152), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb7359000  ! 1713: SRLX_R	srlx	%r22, %r0, %r27
T1_asi_reg_wr_69:
	mov	0x13, %r14
	.word 0xfcf38400  ! 1714: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb425210e  ! 1717: SUB_I	sub 	%r20, 0x010e, %r26
	.word 0xb82cc000  ! 1718: ANDN_R	andn 	%r19, %r0, %r28
iob_intr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_153), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_132:
	setx	0x280109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda4c9a0  ! 1721: FDIVs	fdivs	%f19, %f0, %f30
	.word 0xb3a54960  ! 1722: FMULq	dis not found

iob_intr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_154), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb3aa0820  ! 1726: FMOVA	fmovs	%fcc1, %f0, %f25
iob_intr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_155), 16, 16)) -> intp(1, 0, 31)
	.word 0xb5a409a0  ! 1730: FDIVs	fdivs	%f16, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a44840  ! 1734: FADDd	faddd	%f48, %f0, %f58
	.word 0x8394212c  ! 1735: WRPR_TNPC_I	wrpr	%r16, 0x012c, %tnpc
T1_asi_reg_wr_70:
	mov	0x13, %r14
	.word 0xf2f389e0  ! 1736: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_156), 16, 16)) -> intp(1, 0, 2c)
iob_intr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_157), 16, 16)) -> intp(1, 0, 31)
	.word 0xb5ab8820  ! 1740: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xbfa408e0  ! 1745: FSUBq	dis not found

T1_asi_reg_wr_71:
	mov	0x3c6, %r14
	.word 0xfcf38e40  ! 1747: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7a488e0  ! 1748: FSUBq	dis not found

	.word 0xb69dc000  ! 1753: XORcc_R	xorcc 	%r23, %r0, %r27
	.word 0xb7a88820  ! 1754: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xbba8c820  ! 1756: FMOVL	fmovs	%fcc1, %f0, %f29
cpu_intr_1_133:
	setx	0x280206, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_72:
	mov	0x2c, %r14
	.word 0xfcf38e40  ! 1760: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb69c2160  ! 1764: XORcc_I	xorcc 	%r16, 0x0160, %r27
iob_intr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_158), 16, 16)) -> intp(1, 0, 1)
	.word 0xbba8c820  ! 1768: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0xbfa80820  ! 1770: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xbfa4c820  ! 1771: FADDs	fadds	%f19, %f0, %f31
	.word 0xb3a00540  ! 1772: FSQRTd	fsqrt	
T1_asi_reg_rd_84:
	mov	0x27, %r14
	.word 0xf0db8400  ! 1777: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb3a448e0  ! 1780: FSUBq	dis not found

	.word 0xbba44960  ! 1781: FMULq	dis not found

iob_intr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_159), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_134:
	setx	0x280114, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80c20  ! 1787: FMOVRLZ	dis not found

cpu_intr_1_135:
	setx	0x2b011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_136:
	setx	0x2a001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a509e0  ! 1797: FDIVq	dis not found

T1_asi_reg_rd_85:
	mov	0x12, %r14
	.word 0xf8db8e80  ! 1798: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb9a488a0  ! 1801: FSUBs	fsubs	%f18, %f0, %f28
T1_asi_reg_wr_73:
	mov	0x2f, %r14
	.word 0xf2f38e80  ! 1805: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb20420e0  ! 1806: ADD_I	add 	%r16, 0x00e0, %r25
iob_intr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_160), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_wr_74:
	mov	0x32, %r14
	.word 0xfcf38e80  ! 1809: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_1_137:
	setx	0x2a001f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_161), 16, 16)) -> intp(1, 0, 32)
cpu_intr_1_138:
	setx	0x290125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_162), 16, 16)) -> intp(1, 0, 3a)
T1_asi_reg_wr_75:
	mov	0x37, %r14
	.word 0xf4f38e60  ! 1817: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T1_asi_reg_rd_86:
	mov	0x28, %r14
	.word 0xf6db8400  ! 1822: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb83421b5  ! 1823: ORN_I	orn 	%r16, 0x01b5, %r28
	.word 0xb4c5c000  ! 1825: ADDCcc_R	addccc 	%r23, %r0, %r26
cpu_intr_1_139:
	setx	0x2e0207, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_87:
	mov	0x3, %r14
	.word 0xf2db8e40  ! 1829: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_76:
	mov	0x3c8, %r14
	.word 0xf4f38e60  ! 1832: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xbba489e0  ! 1833: FDIVq	dis not found

	.word 0xb9a00540  ! 1836: FSQRTd	fsqrt	
iob_intr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_163), 16, 16)) -> intp(1, 0, 1)
	.word 0xb084c000  ! 1839: ADDcc_R	addcc 	%r19, %r0, %r24
T1_asi_reg_rd_88:
	mov	0x33, %r14
	.word 0xf6db84a0  ! 1840: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb7a81420  ! 1841: FMOVRNZ	dis not found

cpu_intr_1_140:
	setx	0x2f0329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_164), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb03ca1d3  ! 1845: XNOR_I	xnor 	%r18, 0x01d3, %r24
iob_intr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_165), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_rd_89:
	mov	0x23, %r14
	.word 0xfedb8e40  ! 1848: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb7643801  ! 1850: MOVcc_I	<illegal instruction>
	.word 0xb2854000  ! 1851: ADDcc_R	addcc 	%r21, %r0, %r25
cpu_intr_1_141:
	setx	0x2f000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_142:
	setx	0x2f002c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_166), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_143:
	setx	0x2e0221, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_167), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb3a9c820  ! 1859: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb7a448a0  ! 1862: FSUBs	fsubs	%f17, %f0, %f27
	.word 0xb83d2160  ! 1863: XNOR_I	xnor 	%r20, 0x0160, %r28
	.word 0xb1341000  ! 1867: SRLX_R	srlx	%r16, %r0, %r24
	.word 0xb5a00020  ! 1868: FMOVs	fmovs	%f0, %f26
cpu_intr_1_144:
	setx	0x2f000e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_168), 16, 16)) -> intp(1, 0, 34)
	.word 0xb3a50940  ! 1878: FMULd	fmuld	%f20, %f0, %f56
	.word 0xb3a50860  ! 1879: FADDq	dis not found

cpu_intr_1_145:
	setx	0x2f0308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_169), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_wr_77:
	mov	0x1c, %r14
	.word 0xf6f38e60  ! 1886: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_170), 16, 16)) -> intp(1, 0, a)
	.word 0xb6940000  ! 1895: ORcc_R	orcc 	%r16, %r0, %r27
	.word 0xb4c4e0c1  ! 1897: ADDCcc_I	addccc 	%r19, 0x00c1, %r26
	.word 0xb9a9c820  ! 1898: FMOVVS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_90:
	mov	0x3c8, %r14
	.word 0xfcdb89e0  ! 1899: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb3ab8820  ! 1901: FMOVPOS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_91:
	mov	0x14, %r14
	.word 0xfedb84a0  ! 1902: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbc9c0000  ! 1904: XORcc_R	xorcc 	%r16, %r0, %r30
iob_intr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_171), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_wr_78:
	mov	0x21, %r14
	.word 0xf2f389e0  ! 1909: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T1_asi_reg_wr_79:
	mov	0x0, %r14
	.word 0xf2f384a0  ! 1914: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbba80420  ! 1918: FMOVRZ	dis not found

cpu_intr_1_146:
	setx	0x2f0328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa4820  ! 1922: FMOVNE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_80:
	mov	0x3c6, %r14
	.word 0xf6f38400  ! 1923: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_172), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_wr_81:
	mov	0x1d, %r14
	.word 0xf8f38e40  ! 1928: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_147:
	setx	0x2f0105, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_92:
	mov	0x3c6, %r14
	.word 0xf6db8e40  ! 1937: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb7a00560  ! 1940: FSQRTq	fsqrt	
iob_intr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_173), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb29c4000  ! 1948: XORcc_R	xorcc 	%r17, %r0, %r25
T1_asi_reg_wr_82:
	mov	0x3c2, %r14
	.word 0xfaf384a0  ! 1953: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T1_asi_reg_rd_93:
	mov	0x6, %r14
	.word 0xf8db8e40  ! 1954: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbfabc820  ! 1957: FMOVVC	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_94:
	mov	0x3c8, %r14
	.word 0xf4db84a0  ! 1960: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_1_148:
	setx	0x2f032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00560  ! 1962: FSQRTq	fsqrt	
iob_intr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_174), 16, 16)) -> intp(1, 0, f)
	.word 0xbd2d6001  ! 1965: SLL_I	sll 	%r21, 0x0001, %r30
	.word 0xbda80420  ! 1968: FMOVRZ	dis not found

	.word 0xb5a50920  ! 1971: FMULs	fmuls	%f20, %f0, %f26
	.word 0xbda80820  ! 1972: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb2148000  ! 1973: OR_R	or 	%r18, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5aa4820  ! 1978: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xbba88820  ! 1985: FMOVLE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_149:
	setx	0x2f0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81420  ! 1988: FMOVRNZ	dis not found

iob_intr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_175), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_wr_83:
	mov	0x32, %r14
	.word 0xfcf38e40  ! 1996: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_176), 16, 16)) -> intp(1, 0, 26)
T1_asi_reg_rd_95:
	mov	0x8, %r14
	.word 0xfedb84a0  ! 2004: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T1_asi_reg_rd_96:
	mov	0x3c0, %r14
	.word 0xf6db8400  ! 2005: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb5ab4820  ! 2010: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xbba50940  ! 2011: FMULd	fmuld	%f20, %f0, %f60
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_150:
	setx	0x2f0014, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_177), 16, 16)) -> intp(1, 0, 31)
	.word 0xb5a84820  ! 2024: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xbb480000  ! 2026: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb3a508a0  ! 2027: FSUBs	fsubs	%f20, %f0, %f25
	.word 0xb9a4c8c0  ! 2029: FSUBd	fsubd	%f50, %f0, %f28
	.word 0xb3a5c8a0  ! 2033: FSUBs	fsubs	%f23, %f0, %f25
cpu_intr_1_151:
	setx	0x2e0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1ab0820  ! 2040: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xbba80c20  ! 2041: FMOVRLZ	dis not found

	.word 0xb3a94820  ! 2043: FMOVCS	fmovs	%fcc1, %f0, %f25
iob_intr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_178), 16, 16)) -> intp(1, 0, 14)
T1_asi_reg_rd_97:
	mov	0x2e, %r14
	.word 0xfadb89e0  ! 2047: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xbda48920  ! 2048: FMULs	fmuls	%f18, %f0, %f30
T1_asi_reg_rd_98:
	mov	0x3c1, %r14
	.word 0xf8db8e40  ! 2054: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbfa00520  ! 2056: FSQRTs	fsqrt	
iob_intr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_179), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb3a5c960  ! 2060: FMULq	dis not found

	.word 0xb9a5c860  ! 2061: FADDq	dis not found

	.word 0xb3a54820  ! 2063: FADDs	fadds	%f21, %f0, %f25
iob_intr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_180), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_181), 16, 16)) -> intp(1, 0, 7)
	.word 0xb7aac820  ! 2072: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xbf2c3001  ! 2073: SLLX_I	sllx	%r16, 0x0001, %r31
	.word 0xbbaa4820  ! 2074: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb9a58920  ! 2079: FMULs	fmuls	%f22, %f0, %f28
T1_asi_reg_rd_99:
	mov	0x18, %r14
	.word 0xfcdb8400  ! 2082: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_wr_84:
	mov	0x3c2, %r14
	.word 0xfaf384a0  ! 2083: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T1_asi_reg_wr_85:
	mov	0x3c3, %r14
	.word 0xf4f38e60  ! 2085: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_182), 16, 16)) -> intp(1, 0, 34)
	.word 0xb7aa0820  ! 2090: FMOVA	fmovs	%fcc1, %f0, %f27
iob_intr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_183), 16, 16)) -> intp(1, 0, 10)
	.word 0xb7a5c8e0  ! 2099: FSUBq	dis not found

cpu_intr_1_152:
	setx	0x2e003c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_153:
	setx	0x2f0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01d200b  ! 2104: XOR_I	xor 	%r20, 0x000b, %r24
cpu_intr_1_154:
	setx	0x2c0015, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_155:
	setx	0x2c0019, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_156:
	setx	0x2f0134, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_86:
	mov	0x3c0, %r14
	.word 0xf4f38e60  ! 2110: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T1_asi_reg_wr_87:
	mov	0x29, %r14
	.word 0xf8f38e40  ! 2114: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb1a50840  ! 2115: FADDd	faddd	%f20, %f0, %f24
cpu_intr_1_157:
	setx	0x2d0331, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_88:
	mov	0x14, %r14
	.word 0xf8f38e40  ! 2123: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb00ca1df  ! 2126: AND_I	and 	%r18, 0x01df, %r24
	.word 0xbfaac820  ! 2127: FMOVGE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_158:
	setx	0x2c0229, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_100:
	mov	0x23, %r14
	.word 0xfedb8e40  ! 2130: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_159:
	setx	0x2f0229, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb40de0ba  ! 2134: AND_I	and 	%r23, 0x00ba, %r26
	.word 0xb9a4c8c0  ! 2135: FSUBd	fsubd	%f50, %f0, %f28
T1_asi_reg_wr_89:
	mov	0x6, %r14
	.word 0xf0f384a0  ! 2136: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_184), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_185), 16, 16)) -> intp(1, 0, 1c)
T1_asi_reg_rd_101:
	mov	0x33, %r14
	.word 0xf6db8e40  ! 2143: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_1_160:
	setx	0x2d0205, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_186), 16, 16)) -> intp(1, 0, 39)
	.word 0xb3a94820  ! 2149: FMOVCS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_161:
	setx	0x2d0002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_187), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_162:
	setx	0x2e0115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80420  ! 2154: FMOVRZ	dis not found

iob_intr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_188), 16, 16)) -> intp(1, 0, 1e)
iob_intr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_189), 16, 16)) -> intp(1, 0, 1c)
T1_asi_reg_rd_102:
	mov	0x17, %r14
	.word 0xf8db8e40  ! 2160: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb5a448e0  ! 2163: FSUBq	dis not found

iob_intr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_190), 16, 16)) -> intp(1, 0, 39)
	.word 0xb3a5c8c0  ! 2165: FSUBd	fsubd	%f54, %f0, %f56
	.word 0xbba44820  ! 2167: FADDs	fadds	%f17, %f0, %f29
cpu_intr_1_163:
	setx	0x2e0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0842020  ! 2170: ADDcc_I	addcc 	%r16, 0x0020, %r24
T1_asi_reg_wr_90:
	mov	0x3c4, %r14
	.word 0xf6f38e80  ! 2173: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb9a54820  ! 2174: FADDs	fadds	%f21, %f0, %f28
T1_asi_reg_rd_103:
	mov	0x3c0, %r14
	.word 0xfedb84a0  ! 2176: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb5a00520  ! 2180: FSQRTs	fsqrt	
	.word 0xb9a5c8e0  ! 2186: FSUBq	dis not found

cpu_intr_1_164:
	setx	0x2f0004, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00020  ! 2191: FMOVs	fmovs	%f0, %f24
	.word 0xbc958000  ! 2193: ORcc_R	orcc 	%r22, %r0, %r30
iob_intr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_191), 16, 16)) -> intp(1, 0, 3f)
	.word 0xa1902001  ! 2196: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xb7aa4820  ! 2199: FMOVNE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_165:
	setx	0x2f0000, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_104:
	mov	0x35, %r14
	.word 0xfedb8e40  ! 2209: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_192), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_166:
	setx	0x2d012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c9c0  ! 2217: FDIVd	fdivd	%f50, %f0, %f58
T1_asi_reg_wr_91:
	mov	0x30, %r14
	.word 0xf6f38e40  ! 2219: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_167:
	setx	0x2e0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaa8820  ! 2222: FMOVG	fmovs	%fcc1, %f0, %f30
iob_intr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_193), 16, 16)) -> intp(1, 0, 2)
cpu_intr_1_168:
	setx	0x2f0125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc9dc000  ! 2227: XORcc_R	xorcc 	%r23, %r0, %r30
T1_asi_reg_wr_92:
	mov	0x17, %r14
	.word 0xfaf38e60  ! 2230: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xbd508000  ! 2231: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a80420  ! 2233: FMOVRZ	dis not found

cpu_intr_1_169:
	setx	0x2f0138, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_170:
	setx	0x2f032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a81820  ! 2240: FMOVRGZ	fmovs	%fcc3, %f0, %f26
iob_intr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_194), 16, 16)) -> intp(1, 0, 15)
iob_intr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_195), 16, 16)) -> intp(1, 0, d)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_196), 16, 16)) -> intp(1, 0, 3d)
cpu_intr_1_171:
	setx	0x2d0221, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_93:
	mov	0x3c4, %r14
	.word 0xfcf38e80  ! 2249: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a81c20  ! 2252: FMOVRGEZ	dis not found

	.word 0xb5a40840  ! 2254: FADDd	faddd	%f16, %f0, %f26
iob_intr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_197), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_198), 16, 16)) -> intp(1, 0, 11)
	.word 0xb3a81820  ! 2259: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb1a80420  ! 2262: FMOVRZ	dis not found

cpu_intr_1_172:
	setx	0x2d0119, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbda44840  ! 2267: FADDd	faddd	%f48, %f0, %f30
	.word 0xb62d201a  ! 2269: ANDN_I	andn 	%r20, 0x001a, %r27
T1_asi_reg_rd_105:
	mov	0x2c, %r14
	.word 0xfadb8e80  ! 2270: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_199), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb4a4c000  ! 2276: SUBcc_R	subcc 	%r19, %r0, %r26
	.word 0xbfab4820  ! 2285: FMOVCC	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_106:
	mov	0x2a, %r14
	.word 0xf4db8400  ! 2287: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
T1_asi_reg_rd_107:
	mov	0x12, %r14
	.word 0xfcdb89e0  ! 2290: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T1_asi_reg_rd_108:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 2292: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_wr_94:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 2293: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T1_asi_reg_rd_109:
	mov	0x25, %r14
	.word 0xf8db84a0  ! 2294: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb1a48940  ! 2298: FMULd	fmuld	%f18, %f0, %f24
iob_intr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_200), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_wr_95:
	mov	0x19, %r14
	.word 0xf0f38e40  ! 2310: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a40920  ! 2313: FMULs	fmuls	%f16, %f0, %f24
cpu_intr_1_173:
	setx	0x30002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4c5a1ed  ! 2316: ADDCcc_I	addccc 	%r22, 0x01ed, %r26
	.word 0xb9a488c0  ! 2317: FSUBd	fsubd	%f18, %f0, %f28
T1_asi_reg_wr_96:
	mov	0x1, %r14
	.word 0xf0f38e80  ! 2318: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_1_174:
	setx	0x300116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_175:
	setx	0x300330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab0820  ! 2321: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb5a5c8a0  ! 2322: FSUBs	fsubs	%f23, %f0, %f26
	.word 0xb1a00540  ! 2323: FSQRTd	fsqrt	
iob_intr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_201), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb61d8000  ! 2329: XOR_R	xor 	%r22, %r0, %r27
	.word 0xbba48860  ! 2330: FADDq	dis not found

	.word 0xb1a54840  ! 2331: FADDd	faddd	%f52, %f0, %f24
	.word 0xbba98820  ! 2335: FMOVNEG	fmovs	%fcc1, %f0, %f29
iob_intr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_202), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb3aa4820  ! 2344: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb1a58940  ! 2345: FMULd	fmuld	%f22, %f0, %f24
T1_asi_reg_rd_110:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 2346: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb1a9c820  ! 2349: FMOVVS	fmovs	%fcc1, %f0, %f24
cpu_intr_1_176:
	setx	0x33033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_203), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_177:
	setx	0x320329, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xbba81420  ! 2355: FMOVRNZ	dis not found

cpu_intr_1_178:
	setx	0x320000, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_97:
	mov	0x3c0, %r14
	.word 0xf6f38400  ! 2363: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbba00540  ! 2366: FSQRTd	fsqrt	
	.word 0xb9aa0820  ! 2367: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb3ab4820  ! 2368: FMOVCC	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_98:
	mov	0x1d, %r14
	.word 0xfaf38e80  ! 2370: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb6b4a1a2  ! 2373: SUBCcc_I	orncc 	%r18, 0x01a2, %r27
	lda	[%r22 + %g0] 0xf0, %f2
iob_intr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_204), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_wr_99:
	mov	0x3c8, %r14
	.word 0xf0f38e40  ! 2379: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbba48940  ! 2382: FMULd	fmuld	%f18, %f0, %f60
iob_intr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_205), 16, 16)) -> intp(1, 0, 3d)
cpu_intr_1_179:
	setx	0x32013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_180:
	setx	0x330120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80c20  ! 2388: FMOVRLZ	dis not found

	.word 0xbda81820  ! 2391: FMOVRGZ	fmovs	%fcc3, %f0, %f30
cpu_intr_1_181:
	setx	0x300314, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_206), 16, 16)) -> intp(1, 0, 22)
	.word 0xbeac8000  ! 2395: ANDNcc_R	andncc 	%r18, %r0, %r31
iob_intr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_207), 16, 16)) -> intp(1, 0, 2a)
iob_intr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_208), 16, 16)) -> intp(1, 0, 4)
cpu_intr_1_182:
	setx	0x31002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_111:
	mov	0x22, %r14
	.word 0xf8db8e40  ! 2400: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_183:
	setx	0x330336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c9a0  ! 2402: FDIVs	fdivs	%f23, %f0, %f28
	.word 0xb8058000  ! 2407: ADD_R	add 	%r22, %r0, %r28
iob_intr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_209), 16, 16)) -> intp(1, 0, 13)
iob_intr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_210), 16, 16)) -> intp(1, 0, 31)
iob_intr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_211), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_184:
	setx	0x30001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf518000  ! 2416: RDPR_PSTATE	<illegal instruction>
cpu_intr_1_185:
	setx	0x300029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_212), 16, 16)) -> intp(1, 0, 14)
cpu_intr_1_186:
	setx	0x32031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_213), 16, 16)) -> intp(1, 0, 4)
cpu_intr_1_187:
	setx	0x31031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81c20  ! 2434: FMOVRGEZ	dis not found

	.word 0xb7a81c20  ! 2435: FMOVRGEZ	dis not found

cpu_intr_1_188:
	setx	0x310234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb495c000  ! 2437: ORcc_R	orcc 	%r23, %r0, %r26
iob_intr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_214), 16, 16)) -> intp(1, 0, 18)
	.word 0xb9a50820  ! 2442: FADDs	fadds	%f20, %f0, %f28
	.word 0xbba80820  ! 2443: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb01c61bd  ! 2444: XOR_I	xor 	%r17, 0x01bd, %r24
	.word 0xbda80c20  ! 2446: FMOVRLZ	dis not found

iob_intr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_215), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_189:
	setx	0x32031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7a00540  ! 2454: FSQRTd	fsqrt	
T1_asi_reg_wr_100:
	mov	0x22, %r14
	.word 0xf6f38400  ! 2455: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_216), 16, 16)) -> intp(1, 0, 38)
	.word 0xbfab8820  ! 2457: FMOVPOS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_190:
	setx	0x30033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c9c0  ! 2464: FDIVd	fdivd	%f50, %f0, %f56
iob_intr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_217), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_wr_101:
	mov	0x9, %r14
	.word 0xfef38e40  ! 2468: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_rd_112:
	mov	0x7, %r14
	.word 0xf4db8400  ! 2471: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb245e13a  ! 2474: ADDC_I	addc 	%r23, 0x013a, %r25
	.word 0xb7a94820  ! 2475: FMOVCS	fmovs	%fcc1, %f0, %f27
cpu_intr_1_191:
	setx	0x320237, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_113:
	mov	0x3c0, %r14
	.word 0xfadb84a0  ! 2479: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb33df001  ! 2481: SRAX_I	srax	%r23, 0x0001, %r25
iob_intr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_218), 16, 16)) -> intp(1, 0, 29)
	.word 0xb6a520ac  ! 2486: SUBcc_I	subcc 	%r20, 0x00ac, %r27
cpu_intr_1_192:
	setx	0x320315, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a50820  ! 2492: FADDs	fadds	%f20, %f0, %f26
	.word 0xbda00020  ! 2493: FMOVs	fmovs	%f0, %f30
	.word 0xbba549a0  ! 2494: FDIVs	fdivs	%f21, %f0, %f29
	.word 0xb3a50860  ! 2495: FADDq	dis not found

	.word 0xb1a509c0  ! 2496: FDIVd	fdivd	%f20, %f0, %f24
iob_intr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_219), 16, 16)) -> intp(1, 0, 18)
T1_asi_reg_rd_114:
	mov	0x6, %r14
	.word 0xfadb8400  ! 2501: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
T1_asi_reg_rd_115:
	mov	0x3c7, %r14
	.word 0xf0db8400  ! 2503: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_193:
	setx	0x300338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_220), 16, 16)) -> intp(1, 0, 12)
	.word 0xbfa00520  ! 2513: FSQRTs	fsqrt	
	.word 0xb5a48940  ! 2515: FMULd	fmuld	%f18, %f0, %f26
	.word 0xb5a4c840  ! 2518: FADDd	faddd	%f50, %f0, %f26
	.word 0xb0ad2094  ! 2519: ANDNcc_I	andncc 	%r20, 0x0094, %r24
cpu_intr_1_194:
	setx	0x330235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73c7001  ! 2524: SRAX_I	srax	%r17, 0x0001, %r27
	.word 0xb9a4c8a0  ! 2525: FSUBs	fsubs	%f19, %f0, %f28
cpu_intr_1_195:
	setx	0x330039, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_196:
	setx	0x320030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfab0820  ! 2528: FMOVGU	fmovs	%fcc1, %f0, %f31
iob_intr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_221), 16, 16)) -> intp(1, 0, c)
	.word 0xb1a98820  ! 2535: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb7a81c20  ! 2537: FMOVRGEZ	dis not found

	.word 0xbb7c4400  ! 2540: MOVR_R	movre	%r17, %r0, %r29
T1_asi_reg_wr_102:
	mov	0x19, %r14
	.word 0xfcf38e40  ! 2543: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_222), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbda48940  ! 2546: FMULd	fmuld	%f18, %f0, %f30
T1_asi_reg_rd_116:
	mov	0x3c8, %r14
	.word 0xf4db89e0  ! 2547: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb9a81820  ! 2548: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb5a00540  ! 2549: FSQRTd	fsqrt	
	.word 0xbda98820  ! 2553: FMOVNEG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_117:
	mov	0x3c1, %r14
	.word 0xfcdb8e60  ! 2555: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xb7aa0820  ! 2560: FMOVA	fmovs	%fcc1, %f0, %f27
iob_intr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_223), 16, 16)) -> intp(1, 0, 29)
	.word 0xb5a81820  ! 2563: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xbba88820  ! 2565: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xbfa548c0  ! 2566: FSUBd	fsubd	%f52, %f0, %f62
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a58920  ! 2575: FMULs	fmuls	%f22, %f0, %f28
	.word 0xb7abc820  ! 2577: FMOVVC	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_118:
	mov	0x3c8, %r14
	.word 0xf2db89e0  ! 2578: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb7a00560  ! 2580: FSQRTq	fsqrt	
	.word 0xb4c521e2  ! 2583: ADDCcc_I	addccc 	%r20, 0x01e2, %r26
	.word 0xb5a408c0  ! 2584: FSUBd	fsubd	%f16, %f0, %f26
cpu_intr_1_197:
	setx	0x300339, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_103:
	mov	0x34, %r14
	.word 0xf2f38e40  ! 2589: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_224), 16, 16)) -> intp(1, 0, 35)
iob_intr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_225), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbb2db001  ! 2597: SLLX_I	sllx	%r22, 0x0001, %r29
T1_asi_reg_rd_119:
	mov	0x13, %r14
	.word 0xf2db84a0  ! 2605: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb7aac820  ! 2607: FMOVGE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_120:
	mov	0x1a, %r14
	.word 0xf8db8e80  ! 2609: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T1_asi_reg_rd_121:
	mov	0x12, %r14
	.word 0xf2db84a0  ! 2612: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbba50960  ! 2613: FMULq	dis not found

iob_intr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_226), 16, 16)) -> intp(1, 0, e)
	.word 0xb3a548c0  ! 2617: FSUBd	fsubd	%f52, %f0, %f56
cpu_intr_1_198:
	setx	0x30010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_227), 16, 16)) -> intp(1, 0, b)
	.word 0xb5a80420  ! 2628: FMOVRZ	dis not found

	.word 0xbfa5c8a0  ! 2629: FSUBs	fsubs	%f23, %f0, %f31
	.word 0xb3a84820  ! 2633: FMOVE	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_199:
	setx	0x300336, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_228), 16, 16)) -> intp(1, 0, 37)
	.word 0xb7a98820  ! 2639: FMOVNEG	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_104:
	mov	0x3c0, %r14
	.word 0xfaf384a0  ! 2640: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb9a9c820  ! 2641: FMOVVS	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_105:
	mov	0x17, %r14
	.word 0xfef38e80  ! 2644: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbda508e0  ! 2649: FSUBq	dis not found

T1_asi_reg_rd_122:
	mov	0x3c0, %r14
	.word 0xfcdb8e40  ! 2651: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbda81820  ! 2652: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xba14c000  ! 2654: OR_R	or 	%r19, %r0, %r29
iob_intr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_229), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbe4421ac  ! 2656: ADDC_I	addc 	%r16, 0x01ac, %r31
T1_asi_reg_wr_106:
	mov	0xd, %r14
	.word 0xf6f38e40  ! 2658: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_wr_107:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 2659: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_230), 16, 16)) -> intp(1, 0, 0)
	.word 0xbfa5c920  ! 2666: FMULs	fmuls	%f23, %f0, %f31
iob_intr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_231), 16, 16)) -> intp(1, 0, 22)
cpu_intr_1_200:
	setx	0x310236, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_232), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_wr_108:
	mov	0x3c8, %r14
	.word 0xf0f38e60  ! 2674: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbf35f001  ! 2676: SRLX_I	srlx	%r23, 0x0001, %r31
T1_asi_reg_wr_109:
	mov	0x2c, %r14
	.word 0xfef38e40  ! 2678: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_233), 16, 16)) -> intp(1, 0, 5)
iob_intr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_234), 16, 16)) -> intp(1, 0, c)
	.word 0xb9a81c20  ! 2684: FMOVRGEZ	dis not found

T1_asi_reg_rd_123:
	mov	0x3c4, %r14
	.word 0xf0db89e0  ! 2693: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T1_asi_reg_wr_110:
	mov	0x3c3, %r14
	.word 0xfaf38400  ! 2697: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xbba80820  ! 2698: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb7a509c0  ! 2699: FDIVd	fdivd	%f20, %f0, %f58
	.word 0xbda90820  ! 2700: FMOVLEU	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_124:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 2701: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_rd_125:
	mov	0x3c7, %r14
	.word 0xf4db8400  ! 2702: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbba58820  ! 2705: FADDs	fadds	%f22, %f0, %f29
	.word 0xb435a0bc  ! 2706: ORN_I	orn 	%r22, 0x00bc, %r26
iob_intr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_235), 16, 16)) -> intp(1, 0, 17)
cpu_intr_1_201:
	setx	0x320230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a94820  ! 2712: FMOVCS	fmovs	%fcc1, %f0, %f26
iob_intr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_236), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_237), 16, 16)) -> intp(1, 0, 28)
	.word 0xb9a58820  ! 2720: FADDs	fadds	%f22, %f0, %f28
	.word 0xbdabc820  ! 2721: FMOVVC	fmovs	%fcc1, %f0, %f30
cpu_intr_1_202:
	setx	0x320306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b4c000  ! 2726: SUBCcc_R	orncc 	%r19, %r0, %r28
	.word 0xb9a98820  ! 2727: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb0358000  ! 2728: ORN_R	orn 	%r22, %r0, %r24
	.word 0xb9a5c920  ! 2730: FMULs	fmuls	%f23, %f0, %f28
cpu_intr_1_203:
	setx	0x31000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa8820  ! 2733: FMOVG	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_126:
	mov	0x10, %r14
	.word 0xfedb89e0  ! 2734: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb00d4000  ! 2737: AND_R	and 	%r21, %r0, %r24
iob_intr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_238), 16, 16)) -> intp(1, 0, 37)
	.word 0xb3a40860  ! 2742: FADDq	dis not found

iob_intr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_239), 16, 16)) -> intp(1, 0, 31)
	.word 0xbda48860  ! 2747: FADDq	dis not found

	.word 0xb5ab4820  ! 2749: FMOVCC	fmovs	%fcc1, %f0, %f26
	lda	[%r16 + %g0] 0xf0, %f2
T1_asi_reg_wr_111:
	mov	0x3c8, %r14
	.word 0xf2f384a0  ! 2756: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_1_204:
	setx	0x37013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00020  ! 2764: FMOVs	fmovs	%f0, %f26
	.word 0xbda94820  ! 2767: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xbba81820  ! 2769: FMOVRGZ	fmovs	%fcc3, %f0, %f29
iob_intr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_240), 16, 16)) -> intp(1, 0, 1e)
T1_asi_reg_wr_112:
	mov	0x37, %r14
	.word 0xf2f38e40  ! 2774: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbfaac820  ! 2775: FMOVGE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_113:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 2776: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_241), 16, 16)) -> intp(1, 0, 2c)
	.word 0xbda408e0  ! 2782: FSUBq	dis not found

iob_intr_1_242:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_242), 16, 16)) -> intp(1, 0, 1a)
cpu_intr_1_205:
	setx	0x360106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a448a0  ! 2788: FSUBs	fsubs	%f17, %f0, %f25
	.word 0xb92d2001  ! 2790: SLL_I	sll 	%r20, 0x0001, %r28
T1_asi_reg_wr_114:
	mov	0x1b, %r14
	.word 0xfcf38400  ! 2791: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb9643801  ! 2793: MOVcc_I	<illegal instruction>
T1_asi_reg_wr_115:
	mov	0x4, %r14
	.word 0xf4f389e0  ! 2794: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_1_243:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_243), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_206:
	setx	0x370020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab0820  ! 2797: FMOVGU	fmovs	%fcc1, %f0, %f25
iob_intr_1_244:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_244), 16, 16)) -> intp(1, 0, 37)
	.word 0xb1a5c8e0  ! 2800: FSUBq	dis not found

T1_asi_reg_rd_127:
	mov	0x2, %r14
	.word 0xfedb8e40  ! 2801: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb9a5c8a0  ! 2804: FSUBs	fsubs	%f23, %f0, %f28
	.word 0xbf518000  ! 2805: RDPR_PSTATE	<illegal instruction>
cpu_intr_1_207:
	setx	0x35022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a588a0  ! 2814: FSUBs	fsubs	%f22, %f0, %f24
T1_asi_reg_rd_128:
	mov	0x29, %r14
	.word 0xfedb89e0  ! 2818: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_1_245:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_245), 16, 16)) -> intp(1, 0, 20)
	.word 0xb82da075  ! 2820: ANDN_I	andn 	%r22, 0x0075, %r28
	.word 0xbc15e10f  ! 2822: OR_I	or 	%r23, 0x010f, %r30
T1_asi_reg_rd_129:
	mov	0x34, %r14
	.word 0xf2db89e0  ! 2823: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_246:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_246), 16, 16)) -> intp(1, 0, 22)
	.word 0xb7a00040  ! 2830: FMOVd	fmovd	%f0, %f58
T1_asi_reg_wr_116:
	mov	0x32, %r14
	.word 0xfef38400  ! 2834: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T1_asi_reg_rd_130:
	mov	0xb, %r14
	.word 0xf0db8e60  ! 2837: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_1_247:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_247), 16, 16)) -> intp(1, 0, 1c)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_248:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_248), 16, 16)) -> intp(1, 0, 2a)
	.word 0xb3a5c940  ! 2843: FMULd	fmuld	%f54, %f0, %f56
	lda	[%r16 + %g0] 0xf0, %f2
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_249:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_249), 16, 16)) -> intp(1, 0, 1d)
	.word 0xb1a40940  ! 2851: FMULd	fmuld	%f16, %f0, %f24
	.word 0xbda5c9e0  ! 2852: FDIVq	dis not found

	.word 0xbc04c000  ! 2853: ADD_R	add 	%r19, %r0, %r30
	.word 0xbb2d2001  ! 2854: SLL_I	sll 	%r20, 0x0001, %r29
T1_asi_reg_wr_117:
	mov	0x3c4, %r14
	.word 0xf8f38e60  ! 2857: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb7a98820  ! 2858: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb1a80c20  ! 2862: FMOVRLZ	dis not found

T1_asi_reg_wr_118:
	mov	0x2e, %r14
	.word 0xf4f389e0  ! 2863: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_1_250:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_250), 16, 16)) -> intp(1, 0, 1)
cpu_intr_1_208:
	setx	0x350120, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_251:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_251), 16, 16)) -> intp(1, 0, 38)
T1_asi_reg_wr_119:
	mov	0x3c8, %r14
	.word 0xfef38e40  ! 2872: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_252:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_252), 16, 16)) -> intp(1, 0, 17)
T1_asi_reg_wr_120:
	mov	0x3c6, %r14
	.word 0xfef389e0  ! 2877: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_wr_121:
	mov	0xe, %r14
	.word 0xfef384a0  ! 2879: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbcb4e132  ! 2880: ORNcc_I	orncc 	%r19, 0x0132, %r30
cpu_intr_1_209:
	setx	0x34001a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_122:
	mov	0x18, %r14
	.word 0xfaf384a0  ! 2888: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbba88820  ! 2890: FMOVLE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_210:
	setx	0x370039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_253:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_253), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbbaa0820  ! 2897: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb9520000  ! 2903: RDPR_PIL	<illegal instruction>
	.word 0xb3a48860  ! 2905: FADDq	dis not found

T1_asi_reg_rd_131:
	mov	0x3c6, %r14
	.word 0xf6db8e80  ! 2906: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb3a449e0  ! 2907: FDIVq	dis not found

cpu_intr_1_211:
	setx	0x340231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb20ca138  ! 2914: AND_I	and 	%r18, 0x0138, %r25
	.word 0xb425c000  ! 2915: SUB_R	sub 	%r23, %r0, %r26
	.word 0xbc258000  ! 2920: SUB_R	sub 	%r22, %r0, %r30
T1_asi_reg_wr_123:
	mov	0x5, %r14
	.word 0xf0f38e40  ! 2922: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_1_254:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_254), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_255:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_255), 16, 16)) -> intp(1, 0, 1e)
iob_intr_1_256:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_256), 16, 16)) -> intp(1, 0, 19)
	.word 0xbbab8820  ! 2928: FMOVPOS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_212:
	setx	0x350233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_213:
	setx	0x340136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a488a0  ! 2935: FSUBs	fsubs	%f18, %f0, %f27
T1_asi_reg_wr_124:
	mov	0x28, %r14
	.word 0xf8f38e80  ! 2936: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T1_asi_reg_wr_125:
	mov	0x3c5, %r14
	.word 0xf2f38e60  ! 2938: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T1_asi_reg_wr_126:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 2939: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_214:
	setx	0x360329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a54820  ! 2945: FADDs	fadds	%f21, %f0, %f28
iob_intr_1_257:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_257), 16, 16)) -> intp(1, 0, 16)
iob_intr_1_258:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_258), 16, 16)) -> intp(1, 0, 25)
	.word 0xb1a4c9a0  ! 2948: FDIVs	fdivs	%f19, %f0, %f24
	.word 0xb1a94820  ! 2949: FMOVCS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_127:
	mov	0x4, %r14
	.word 0xfef389e0  ! 2950: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb9a48840  ! 2956: FADDd	faddd	%f18, %f0, %f28
cpu_intr_1_215:
	setx	0x37033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00520  ! 2959: FSQRTs	fsqrt	
	.word 0xbfa44820  ! 2960: FADDs	fadds	%f17, %f0, %f31
	.word 0xb1a81820  ! 2965: FMOVRGZ	fmovs	%fcc3, %f0, %f24
iob_intr_1_259:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_259), 16, 16)) -> intp(1, 0, 6)
	.word 0xb3a00540  ! 2967: FSQRTd	fsqrt	
T1_asi_reg_rd_132:
	mov	0x31, %r14
	.word 0xfedb8400  ! 2968: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_1_260:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_260), 16, 16)) -> intp(1, 0, 33)
	.word 0xb1a80420  ! 2974: FMOVRZ	dis not found

	.word 0xb5a58960  ! 2975: FMULq	dis not found

	.word 0xbda48840  ! 2978: FADDd	faddd	%f18, %f0, %f30
	.word 0xb9a449a0  ! 2979: FDIVs	fdivs	%f17, %f0, %f28
	.word 0xbfa409a0  ! 2981: FDIVs	fdivs	%f16, %f0, %f31
iob_intr_1_261:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_261), 16, 16)) -> intp(1, 0, 6)
	lda	[%r18 + %g0] 0xf0, %f2
iob_intr_1_262:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_262), 16, 16)) -> intp(1, 0, f)
iob_intr_1_263:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_263), 16, 16)) -> intp(1, 0, 38)
cpu_intr_1_216:
	setx	0x34021c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_133:
	mov	0x20, %r14
	.word 0xf6db8e40  ! 2997: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_264:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_264), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_rd_134:
	mov	0x31, %r14
	.word 0xf2db8e80  ! 3000: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbbabc820  ! 3001: FMOVVC	fmovs	%fcc1, %f0, %f29
iob_intr_1_265:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_265), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbd2cd000  ! 3005: SLLX_R	sllx	%r19, %r0, %r30
	.word 0xb1a00020  ! 3009: FMOVs	fmovs	%f0, %f24
	.word 0xb32d1000  ! 3013: SLLX_R	sllx	%r20, %r0, %r25
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xbba80820  ! 3018: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_135:
	mov	0x12, %r14
	.word 0xfcdb8400  ! 3019: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_217:
	setx	0x370201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_266:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_266), 16, 16)) -> intp(1, 0, 38)
cpu_intr_1_218:
	setx	0x37032b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_128:
	mov	0x2d, %r14
	.word 0xf4f389e0  ! 3025: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_1_219:
	setx	0x360231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba588a0  ! 3035: FSUBs	fsubs	%f22, %f0, %f29
iob_intr_1_267:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_267), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_220:
	setx	0x360333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb57d4400  ! 3040: MOVR_R	movre	%r21, %r0, %r26
T1_asi_reg_wr_129:
	mov	0x24, %r14
	.word 0xf0f38400  ! 3048: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_1_221:
	setx	0x34002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_268:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_268), 16, 16)) -> intp(1, 0, 2f)
iob_intr_1_269:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_269), 16, 16)) -> intp(1, 0, c)
cpu_intr_1_222:
	setx	0x34032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7351000  ! 3054: SRLX_R	srlx	%r20, %r0, %r27
T1_asi_reg_wr_130:
	mov	0x10, %r14
	.word 0xf2f38400  ! 3055: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_1_223:
	setx	0x340119, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_136:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 3058: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_270:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_270), 16, 16)) -> intp(1, 0, 9)
	.word 0xbec4c000  ! 3062: ADDCcc_R	addccc 	%r19, %r0, %r31
	.word 0xbab5e00d  ! 3063: SUBCcc_I	orncc 	%r23, 0x000d, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb8b5e057  ! 3065: ORNcc_I	orncc 	%r23, 0x0057, %r28
T1_asi_reg_wr_131:
	mov	0x1d, %r14
	.word 0xfcf384a0  ! 3066: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_1_224:
	setx	0x35023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_271:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_271), 16, 16)) -> intp(1, 0, 1)
cpu_intr_1_225:
	setx	0x350311, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_132:
	mov	0x2b, %r14
	.word 0xf0f38e40  ! 3075: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T1_asi_reg_wr_133:
	mov	0x3c2, %r14
	.word 0xfcf38400  ! 3076: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T1_asi_reg_rd_137:
	mov	0x3c1, %r14
	.word 0xf6db8e80  ! 3077: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb3a589e0  ! 3078: FDIVq	dis not found

T1_asi_reg_rd_138:
	mov	0x12, %r14
	.word 0xf2db84a0  ! 3079: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb13c7001  ! 3080: SRAX_I	srax	%r17, 0x0001, %r24
	.word 0xb7ab0820  ! 3084: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xbdab8820  ! 3086: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb1a80820  ! 3087: FMOVN	fmovs	%fcc1, %f0, %f24
iob_intr_1_272:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_272), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_226:
	setx	0x370225, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_134:
	mov	0x10, %r14
	.word 0xf6f38e60  ! 3092: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb3a5c960  ! 3093: FMULq	dis not found

	.word 0xb3a81c20  ! 3094: FMOVRGEZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_135:
	mov	0x3c6, %r14
	.word 0xf0f389e0  ! 3098: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_273:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_273), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbda8c820  ! 3104: FMOVL	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_136:
	mov	0x4, %r14
	.word 0xf8f389e0  ! 3105: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_1_227:
	setx	0x370233, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_274:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_274), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb1aa4820  ! 3110: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb0b421ef  ! 3111: SUBCcc_I	orncc 	%r16, 0x01ef, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba80c20  ! 3118: FMOVRLZ	dis not found

cpu_intr_1_228:
	setx	0x360024, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_137:
	mov	0x2d, %r14
	.word 0xf8f384a0  ! 3120: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbfa58820  ! 3124: FADDs	fadds	%f22, %f0, %f31
cpu_intr_1_229:
	setx	0x340207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a98820  ! 3127: FMOVNEG	fmovs	%fcc1, %f0, %f25
iob_intr_1_275:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_275), 16, 16)) -> intp(1, 0, a)
iob_intr_1_276:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_276), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_230:
	setx	0x340132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4ad61f0  ! 3137: ANDNcc_I	andncc 	%r21, 0x01f0, %r26
T1_asi_reg_wr_138:
	mov	0x37, %r14
	.word 0xf6f38e40  ! 3138: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_231:
	setx	0x350317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8352187  ! 3143: SUBC_I	orn 	%r20, 0x0187, %r28
iob_intr_1_277:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_277), 16, 16)) -> intp(1, 0, 14)
	.word 0xb7a9c820  ! 3146: FMOVVS	fmovs	%fcc1, %f0, %f27
iob_intr_1_278:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_278), 16, 16)) -> intp(1, 0, 2c)
cpu_intr_1_232:
	setx	0x370320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a589a0  ! 3151: FDIVs	fdivs	%f22, %f0, %f26
	.word 0xb1a00540  ! 3153: FSQRTd	fsqrt	
	.word 0xbba00040  ! 3154: FMOVd	fmovd	%f0, %f60
T1_asi_reg_wr_139:
	mov	0x3c2, %r14
	.word 0xfcf384a0  ! 3157: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_1_279:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_279), 16, 16)) -> intp(1, 0, 27)
	.word 0xbe9ce0f3  ! 3161: XORcc_I	xorcc 	%r19, 0x00f3, %r31
cpu_intr_1_233:
	setx	0x350101, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_140:
	mov	0x2b, %r14
	.word 0xf8f38400  ! 3165: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbab461b3  ! 3168: ORNcc_I	orncc 	%r17, 0x01b3, %r29
cpu_intr_1_234:
	setx	0x370217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda4c8e0  ! 3171: FSUBq	dis not found

cpu_intr_1_235:
	setx	0x34000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00540  ! 3173: FSQRTd	fsqrt	
	.word 0xb7a00040  ! 3178: FMOVd	fmovd	%f0, %f58
	.word 0xbfa54940  ! 3180: FMULd	fmuld	%f52, %f0, %f62
T1_asi_reg_wr_141:
	mov	0x3c3, %r14
	.word 0xf4f384a0  ! 3181: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
iob_intr_1_280:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_280), 16, 16)) -> intp(1, 0, e)
	.word 0xbda8c820  ! 3184: FMOVL	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_139:
	mov	0x3c5, %r14
	.word 0xfadb8e80  ! 3186: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_1_236:
	setx	0x37002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9ca0e4  ! 3188: XORcc_I	xorcc 	%r18, 0x00e4, %r29
	.word 0xb5a00520  ! 3189: FSQRTs	fsqrt	
	.word 0xb3a449c0  ! 3190: FDIVd	fdivd	%f48, %f0, %f56
	.word 0xbfa488a0  ! 3191: FSUBs	fsubs	%f18, %f0, %f31
	.word 0x8f902002  ! 3194: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xb3aa8820  ! 3195: FMOVG	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_140:
	mov	0x36, %r14
	.word 0xf4db8e40  ! 3196: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb9a00540  ! 3199: FSQRTd	fsqrt	
	.word 0xb5a81420  ! 3201: FMOVRNZ	dis not found

cpu_intr_1_237:
	setx	0x390132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a408e0  ! 3206: FSUBq	dis not found

cpu_intr_1_238:
	setx	0x3a003f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_281:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_281), 16, 16)) -> intp(1, 0, 4)
	.word 0xb93dd000  ! 3214: SRAX_R	srax	%r23, %r0, %r28
	.word 0xb5a58960  ! 3218: FMULq	dis not found

cpu_intr_1_239:
	setx	0x3a032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00040  ! 3224: FMOVd	fmovd	%f0, %f58
	.word 0xbfa88820  ! 3226: FMOVLE	fmovs	%fcc1, %f0, %f31
iob_intr_1_282:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_282), 16, 16)) -> intp(1, 0, 3d)
cpu_intr_1_240:
	setx	0x380309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb62d60ef  ! 3234: ANDN_I	andn 	%r21, 0x00ef, %r27
T1_asi_reg_wr_142:
	mov	0x3c5, %r14
	.word 0xf6f38e80  ! 3238: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_1_241:
	setx	0x3b012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda488a0  ! 3242: FSUBs	fsubs	%f18, %f0, %f30
iob_intr_1_283:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_283), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_rd_141:
	mov	0x3c5, %r14
	.word 0xfadb8e80  ! 3249: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb5a81420  ! 3251: FMOVRNZ	dis not found

	.word 0xbba5c8a0  ! 3253: FSUBs	fsubs	%f23, %f0, %f29
cpu_intr_1_242:
	setx	0x39033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_243:
	setx	0x390017, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_142:
	mov	0x27, %r14
	.word 0xf2db8e80  ! 3257: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	lda	[%r20 + %g0] 0xf0, %f2
iob_intr_1_284:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_284), 16, 16)) -> intp(1, 0, 12)
	.word 0xb4854000  ! 3262: ADDcc_R	addcc 	%r21, %r0, %r26
	.word 0xbcb54000  ! 3267: SUBCcc_R	orncc 	%r21, %r0, %r30
T1_asi_reg_rd_143:
	mov	0x3c4, %r14
	.word 0xfcdb89e0  ! 3269: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_1_285:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_285), 16, 16)) -> intp(1, 0, 1)
cpu_intr_1_244:
	setx	0x38013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7aa4820  ! 3278: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xbfa81820  ! 3284: FMOVRGZ	fmovs	%fcc3, %f0, %f31
iob_intr_1_286:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_286), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_245:
	setx	0x3b0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4150000  ! 3292: OR_R	or 	%r20, %r0, %r26
	lda	[%r20 + %g0] 0xf0, %f2
iob_intr_1_287:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_287), 16, 16)) -> intp(1, 0, 30)
	.word 0xb1a80420  ! 3300: FMOVRZ	dis not found

	.word 0xbda81820  ! 3301: FMOVRGZ	fmovs	%fcc3, %f0, %f30
T1_asi_reg_rd_144:
	mov	0x10, %r14
	.word 0xf0db84a0  ! 3302: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbda488a0  ! 3304: FSUBs	fsubs	%f18, %f0, %f30
cpu_intr_1_246:
	setx	0x3a0108, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_143:
	mov	0x37, %r14
	.word 0xfcf389e0  ! 3306: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_1_288:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_288), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_289:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_289), 16, 16)) -> intp(1, 0, 36)
T1_asi_reg_rd_145:
	mov	0xa, %r14
	.word 0xfedb84a0  ! 3309: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb22d217f  ! 3311: ANDN_I	andn 	%r20, 0x017f, %r25
	.word 0xbeb56176  ! 3315: ORNcc_I	orncc 	%r21, 0x0176, %r31
iob_intr_1_290:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_290), 16, 16)) -> intp(1, 0, 35)
T1_asi_reg_wr_144:
	mov	0x2a, %r14
	.word 0xfaf38e40  ! 3319: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb7a80820  ! 3320: FMOVN	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_145:
	mov	0x21, %r14
	.word 0xfef38e60  ! 3321: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb3a448e0  ! 3322: FSUBq	dis not found

	.word 0xb5a5c920  ! 3323: FMULs	fmuls	%f23, %f0, %f26
T1_asi_reg_wr_146:
	mov	0x14, %r14
	.word 0xfcf38e60  ! 3326: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xbd518000  ! 3327: RDPR_PSTATE	<illegal instruction>
iob_intr_1_291:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_291), 16, 16)) -> intp(1, 0, 39)
	.word 0xbda549c0  ! 3331: FDIVd	fdivd	%f52, %f0, %f30
iob_intr_1_292:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_292), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_293:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_293), 16, 16)) -> intp(1, 0, 37)
cpu_intr_1_247:
	setx	0x3a012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_147:
	mov	0x29, %r14
	.word 0xfcf38e40  ! 3342: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_294:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_294), 16, 16)) -> intp(1, 0, d)
cpu_intr_1_248:
	setx	0x3a030a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_146:
	mov	0x11, %r14
	.word 0xfedb8400  ! 3345: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb8b56049  ! 3346: SUBCcc_I	orncc 	%r21, 0x0049, %r28
	.word 0xb09da177  ! 3347: XORcc_I	xorcc 	%r22, 0x0177, %r24
cpu_intr_1_249:
	setx	0x3a0030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_295:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_295), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_wr_148:
	mov	0x2a, %r14
	.word 0xfaf38e40  ! 3354: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb5a8c820  ! 3355: FMOVL	fmovs	%fcc1, %f0, %f26
iob_intr_1_296:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_296), 16, 16)) -> intp(1, 0, a)
	.word 0xbfa00520  ! 3359: FSQRTs	fsqrt	
	.word 0xb0148000  ! 3360: OR_R	or 	%r18, %r0, %r24
iob_intr_1_297:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_297), 16, 16)) -> intp(1, 0, 3f)
iob_intr_1_298:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_298), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb7a00540  ! 3366: FSQRTd	fsqrt	
T1_asi_reg_wr_149:
	mov	0x3c0, %r14
	.word 0xfaf38e40  ! 3369: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_299:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_299), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb1ab8820  ! 3373: FMOVPOS	fmovs	%fcc1, %f0, %f24
cpu_intr_1_250:
	setx	0x39002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_300:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_300), 16, 16)) -> intp(1, 0, 7)
cpu_intr_1_251:
	setx	0x390030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda84820  ! 3382: FMOVE	fmovs	%fcc1, %f0, %f30
iob_intr_1_301:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_301), 16, 16)) -> intp(1, 0, 31)
	.word 0xb5a58840  ! 3386: FADDd	faddd	%f22, %f0, %f26
	.word 0xbdab0820  ! 3393: FMOVGU	fmovs	%fcc1, %f0, %f30
cpu_intr_1_252:
	setx	0x39012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb33d0000  ! 3398: SRA_R	sra 	%r20, %r0, %r25
	.word 0xb1a489c0  ! 3399: FDIVd	fdivd	%f18, %f0, %f24
iob_intr_1_302:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_302), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_303:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_303), 16, 16)) -> intp(1, 0, f)
	lda	[%r20 + %g0] 0xf0, %f2
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_304:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_304), 16, 16)) -> intp(1, 0, c)
iob_intr_1_305:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_305), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_wr_150:
	mov	0x22, %r14
	.word 0xfef389e0  ! 3406: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_1_306:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_306), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_rd_147:
	mov	0x28, %r14
	.word 0xf6db8e40  ! 3409: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbfa588c0  ! 3412: FSUBd	fsubd	%f22, %f0, %f62
T1_asi_reg_rd_148:
	mov	0x3c2, %r14
	.word 0xfcdb8e80  ! 3413: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbba00020  ! 3418: FMOVs	fmovs	%f0, %f29
	.word 0xb1a408e0  ! 3421: FSUBq	dis not found

iob_intr_1_307:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_307), 16, 16)) -> intp(1, 0, c)
T1_asi_reg_rd_149:
	mov	0x21, %r14
	.word 0xfadb8e40  ! 3424: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_308:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_308), 16, 16)) -> intp(1, 0, 20)
	.word 0xb2958000  ! 3427: ORcc_R	orcc 	%r22, %r0, %r25
iob_intr_1_309:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_309), 16, 16)) -> intp(1, 0, 12)
	.word 0xb1a5c9c0  ! 3430: FDIVd	fdivd	%f54, %f0, %f24
	.word 0xb5a80420  ! 3431: FMOVRZ	dis not found

iob_intr_1_310:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_310), 16, 16)) -> intp(1, 0, 14)
	.word 0xb5abc820  ! 3433: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbba80820  ! 3434: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
iob_intr_1_311:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_311), 16, 16)) -> intp(1, 0, 9)
T1_asi_reg_wr_151:
	mov	0x31, %r14
	.word 0xfcf389e0  ! 3437: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_1_312:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_312), 16, 16)) -> intp(1, 0, 1a)
iob_intr_1_313:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_313), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_314:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_314), 16, 16)) -> intp(1, 0, 39)
	.word 0xbea48000  ! 3445: SUBcc_R	subcc 	%r18, %r0, %r31
	.word 0xbba88820  ! 3446: FMOVLE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_253:
	setx	0x3a0001, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_254:
	setx	0x3b0301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_255:
	setx	0x3b023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_315:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_315), 16, 16)) -> intp(1, 0, 32)
	.word 0xbba80c20  ! 3454: FMOVRLZ	dis not found

	.word 0xbfa90820  ! 3456: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb9a58840  ! 3457: FADDd	faddd	%f22, %f0, %f28
	.word 0xb9a80820  ! 3462: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xbfa00520  ! 3463: FSQRTs	fsqrt	
iob_intr_1_316:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_316), 16, 16)) -> intp(1, 0, 1e)
T1_asi_reg_rd_150:
	mov	0x3c0, %r14
	.word 0xf6db8400  ! 3466: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb7a98820  ! 3468: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xbda549a0  ! 3470: FDIVs	fdivs	%f21, %f0, %f30
	.word 0xbba5c820  ! 3472: FADDs	fadds	%f23, %f0, %f29
	.word 0xb7ab4820  ! 3473: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb1a80420  ! 3474: FMOVRZ	dis not found

	.word 0xba24a010  ! 3475: SUB_I	sub 	%r18, 0x0010, %r29
	.word 0xbba80c20  ! 3476: FMOVRLZ	dis not found

cpu_intr_1_256:
	setx	0x390035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb635a1d8  ! 3478: ORN_I	orn 	%r22, 0x01d8, %r27
	.word 0xbfa408a0  ! 3481: FSUBs	fsubs	%f16, %f0, %f31
T1_asi_reg_rd_151:
	mov	0x2e, %r14
	.word 0xfcdb8400  ! 3484: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb7a44940  ! 3487: FMULd	fmuld	%f48, %f0, %f58
	.word 0xbe8de0a4  ! 3488: ANDcc_I	andcc 	%r23, 0x00a4, %r31
	.word 0x9194a0cf  ! 3490: WRPR_PIL_I	wrpr	%r18, 0x00cf, %pil
cpu_intr_1_257:
	setx	0x390225, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_152:
	mov	0x1f, %r14
	.word 0xf6db8e80  ! 3501: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_1_258:
	setx	0x3b013a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_152:
	mov	0x7, %r14
	.word 0xf6f38e40  ! 3503: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbaa48000  ! 3505: SUBcc_R	subcc 	%r18, %r0, %r29
	.word 0x8594202b  ! 3506: WRPR_TSTATE_I	wrpr	%r16, 0x002b, %tstate
	.word 0xb6a54000  ! 3509: SUBcc_R	subcc 	%r21, %r0, %r27
	.word 0xb7a489e0  ! 3510: FDIVq	dis not found

	.word 0xb5a88820  ! 3511: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb83d21a1  ! 3513: XNOR_I	xnor 	%r20, 0x01a1, %r28
T1_asi_reg_wr_153:
	mov	0x38, %r14
	.word 0xf0f38400  ! 3515: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_1_317:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_317), 16, 16)) -> intp(1, 0, 5)
	lda	[%r19 + %g0] 0xf0, %f2
	.word 0xb9a48920  ! 3522: FMULs	fmuls	%f18, %f0, %f28
T1_asi_reg_wr_154:
	mov	0x3c8, %r14
	.word 0xfaf389e0  ! 3525: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb9ab0820  ! 3526: FMOVGU	fmovs	%fcc1, %f0, %f28
cpu_intr_1_259:
	setx	0x390128, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_318:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_318), 16, 16)) -> intp(1, 0, 14)
	.word 0xbda84820  ! 3532: FMOVE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_153:
	mov	0x3c8, %r14
	.word 0xf2db89e0  ! 3534: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbdab8820  ! 3535: FMOVPOS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_155:
	mov	0x26, %r14
	.word 0xf0f38e40  ! 3537: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb3a90820  ! 3540: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0xbba80420  ! 3541: FMOVRZ	dis not found

iob_intr_1_319:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_319), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_wr_156:
	mov	0x3c6, %r14
	.word 0xfaf389e0  ! 3545: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_1_320:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_320), 16, 16)) -> intp(1, 0, b)
iob_intr_1_321:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_321), 16, 16)) -> intp(1, 0, 3)
iob_intr_1_322:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_322), 16, 16)) -> intp(1, 0, 13)
cpu_intr_1_260:
	setx	0x390105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a9c820  ! 3557: FMOVVS	fmovs	%fcc1, %f0, %f26
iob_intr_1_323:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_323), 16, 16)) -> intp(1, 0, 19)
cpu_intr_1_261:
	setx	0x38003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba44940  ! 3561: FMULd	fmuld	%f48, %f0, %f60
cpu_intr_1_262:
	setx	0x3a0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c58000  ! 3563: ADDCcc_R	addccc 	%r22, %r0, %r28
	.word 0xb3aa8820  ! 3564: FMOVG	fmovs	%fcc1, %f0, %f25
cpu_intr_1_263:
	setx	0x3b030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a40860  ! 3566: FADDq	dis not found

cpu_intr_1_264:
	setx	0x3b031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbea40000  ! 3572: SUBcc_R	subcc 	%r16, %r0, %r31
T1_asi_reg_rd_154:
	mov	0x11, %r14
	.word 0xf8db8400  ! 3574: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb3a54960  ! 3575: FMULq	dis not found

iob_intr_1_324:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_324), 16, 16)) -> intp(1, 0, 5)
cpu_intr_1_265:
	setx	0x3a0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80420  ! 3583: FMOVRZ	dis not found

	.word 0xbfa98820  ! 3584: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb1a80820  ! 3586: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_157:
	mov	0x3c4, %r14
	.word 0xf2f38400  ! 3587: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb29dc000  ! 3588: XORcc_R	xorcc 	%r23, %r0, %r25
	.word 0xbfab4820  ! 3589: FMOVCC	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_155:
	mov	0xc, %r14
	.word 0xf2db8e80  ! 3593: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_1_266:
	setx	0x3a0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb43d8000  ! 3597: XNOR_R	xnor 	%r22, %r0, %r26
	.word 0xb9a509c0  ! 3598: FDIVd	fdivd	%f20, %f0, %f28
	.word 0xb77c0400  ! 3602: MOVR_R	movre	%r16, %r0, %r27
cpu_intr_1_267:
	setx	0x3a021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 3611: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb695e06b  ! 3612: ORcc_I	orcc 	%r23, 0x006b, %r27
iob_intr_1_325:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_325), 16, 16)) -> intp(1, 0, 31)
	.word 0xb5a9c820  ! 3619: FMOVVS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_268:
	setx	0x39010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_156:
	mov	0x33, %r14
	.word 0xf6db8e40  ! 3623: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T1_asi_reg_wr_158:
	mov	0x3c7, %r14
	.word 0xf8f384a0  ! 3624: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_1_269:
	setx	0x3b033b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_270:
	setx	0x3b0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf641800  ! 3632: MOVcc_R	<illegal instruction>
iob_intr_1_326:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_326), 16, 16)) -> intp(1, 0, 30)
	.word 0xbda489a0  ! 3635: FDIVs	fdivs	%f18, %f0, %f30
	lda	[%r19 + %g0] 0xf0, %f2
iob_intr_1_327:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_327), 16, 16)) -> intp(1, 0, 1b)
T1_asi_reg_rd_157:
	mov	0x1b, %r14
	.word 0xf6db89e0  ! 3645: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbd508000  ! 3646: RDPR_TSTATE	<illegal instruction>
cpu_intr_1_271:
	setx	0x390214, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_158:
	mov	0x28, %r14
	.word 0xfedb89e0  ! 3650: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_1_328:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_328), 16, 16)) -> intp(1, 0, 24)
iob_intr_1_329:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_329), 16, 16)) -> intp(1, 0, 30)
	.word 0xb0948000  ! 3653: ORcc_R	orcc 	%r18, %r0, %r24
	.word 0xb7a80820  ! 3655: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb60c0000  ! 3660: AND_R	and 	%r16, %r0, %r27
	.word 0xbbaa4820  ! 3661: FMOVNE	fmovs	%fcc1, %f0, %f29
iob_intr_1_330:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_330), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb5aa4820  ! 3668: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb3a488c0  ! 3669: FSUBd	fsubd	%f18, %f0, %f56
cpu_intr_1_272:
	setx	0x3e0305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_331:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_331), 16, 16)) -> intp(1, 0, 8)
	.word 0xbda00040  ! 3675: FMOVd	fmovd	%f0, %f30
	.word 0xbda98820  ! 3676: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb5ab8820  ! 3679: FMOVPOS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_273:
	setx	0x3f0312, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_159:
	mov	0x3c8, %r14
	.word 0xf8db84a0  ! 3683: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_1_274:
	setx	0x3c0103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_275:
	setx	0x3c022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a448e0  ! 3690: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_160:
	mov	0x2d, %r14
	.word 0xfcdb8e40  ! 3695: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbda94820  ! 3697: FMOVCS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_161:
	mov	0x21, %r14
	.word 0xf4db8e40  ! 3698: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_1_332:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_332), 16, 16)) -> intp(1, 0, 23)
	.word 0xb5a81420  ! 3700: FMOVRNZ	dis not found

cpu_intr_1_276:
	setx	0x3c0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00520  ! 3709: FSQRTs	fsqrt	
	.word 0xb9a40840  ! 3715: FADDd	faddd	%f16, %f0, %f28
	.word 0xbfa98820  ! 3716: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb1a90820  ! 3717: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xb5aa4820  ! 3720: FMOVNE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_159:
	mov	0x3c8, %r14
	.word 0xfcf38400  ! 3721: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb7ab4820  ! 3723: FMOVCC	fmovs	%fcc1, %f0, %f27
cpu_intr_1_277:
	setx	0x3c0307, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_160:
	mov	0x26, %r14
	.word 0xf4f38e80  ! 3725: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb7a00040  ! 3726: FMOVd	fmovd	%f0, %f58
	.word 0xb1ab8820  ! 3728: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xbbaa0820  ! 3731: FMOVA	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_161:
	mov	0x24, %r14
	.word 0xf2f38400  ! 3732: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_1_278:
	setx	0x3d0337, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb518000  ! 3738: RDPR_PSTATE	<illegal instruction>
	.word 0xbe8c6122  ! 3741: ANDcc_I	andcc 	%r17, 0x0122, %r31
	.word 0xb1a94820  ! 3742: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xbba48840  ! 3743: FADDd	faddd	%f18, %f0, %f60
cpu_intr_1_279:
	setx	0x3d0200, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb43c603c  ! 3748: XNOR_I	xnor 	%r17, 0x003c, %r26
T1_asi_reg_rd_162:
	mov	0x22, %r14
	.word 0xf2db8e60  ! 3749: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbda88820  ! 3750: FMOVLE	fmovs	%fcc1, %f0, %f30
iob_intr_1_333:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_333), 16, 16)) -> intp(1, 0, 1a)
cpu_intr_1_280:
	setx	0x3d0220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_281:
	setx	0x3c013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80820  ! 3759: FMOVN	fmovs	%fcc1, %f0, %f28
cpu_intr_1_282:
	setx	0x3e022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_163:
	mov	0x28, %r14
	.word 0xfadb84a0  ! 3763: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_1_283:
	setx	0x3f021d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_334:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_334), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_284:
	setx	0x3d0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda489a0  ! 3767: FDIVs	fdivs	%f18, %f0, %f30
iob_intr_1_335:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_335), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb1a80c20  ! 3772: FMOVRLZ	dis not found

T1_asi_reg_wr_162:
	mov	0x28, %r14
	.word 0xf6f38e40  ! 3773: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb5ab0820  ! 3774: FMOVGU	fmovs	%fcc1, %f0, %f26
cpu_intr_1_285:
	setx	0x3e0210, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_164:
	mov	0x3c5, %r14
	.word 0xf4db84a0  ! 3777: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb3a449c0  ! 3779: FDIVd	fdivd	%f48, %f0, %f56
	.word 0xb73d1000  ! 3781: SRAX_R	srax	%r20, %r0, %r27
cpu_intr_1_286:
	setx	0x3c032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6c50000  ! 3786: ADDCcc_R	addccc 	%r20, %r0, %r27
	.word 0xb7a94820  ! 3790: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb7a5c8a0  ! 3794: FSUBs	fsubs	%f23, %f0, %f27
iob_intr_1_336:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_336), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_287:
	setx	0x3d0229, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_337:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_337), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb804609c  ! 3798: ADD_I	add 	%r17, 0x009c, %r28
iob_intr_1_338:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_338), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb9a549c0  ! 3802: FDIVd	fdivd	%f52, %f0, %f28
	.word 0xbdaa8820  ! 3804: FMOVG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_163:
	mov	0x21, %r14
	.word 0xf8f38e60  ! 3805: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbbabc820  ! 3807: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb5a98820  ! 3810: FMOVNEG	fmovs	%fcc1, %f0, %f26
	lda	[%r21 + %g0] 0xf0, %f2
iob_intr_1_339:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_339), 16, 16)) -> intp(1, 0, 3d)
	.word 0xbba548e0  ! 3815: FSUBq	dis not found

	.word 0xbba00540  ! 3816: FSQRTd	fsqrt	
iob_intr_1_340:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_340), 16, 16)) -> intp(1, 0, 5)
iob_intr_1_341:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_341), 16, 16)) -> intp(1, 0, 2c)
iob_intr_1_342:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_342), 16, 16)) -> intp(1, 0, f)
	.word 0xbb2c5000  ! 3823: SLLX_R	sllx	%r17, %r0, %r29
	.word 0xbfa58960  ! 3824: FMULq	dis not found

T1_asi_reg_rd_165:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 3825: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb12cb001  ! 3828: SLLX_I	sllx	%r18, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa80820  ! 3831: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xbba40920  ! 3834: FMULs	fmuls	%f16, %f0, %f29
	.word 0xbba81820  ! 3835: FMOVRGZ	fmovs	%fcc3, %f0, %f29
iob_intr_1_343:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_343), 16, 16)) -> intp(1, 0, 22)
T1_asi_reg_rd_166:
	mov	0x31, %r14
	.word 0xf8db8400  ! 3839: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb43c8000  ! 3841: XNOR_R	xnor 	%r18, %r0, %r26
T1_asi_reg_rd_167:
	mov	0x0, %r14
	.word 0xf2db8e40  ! 3842: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_344:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_344), 16, 16)) -> intp(1, 0, 25)
cpu_intr_1_288:
	setx	0x3c023e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_345:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_345), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb7a00520  ! 3848: FSQRTs	fsqrt	
	.word 0xb1a90820  ! 3849: FMOVLEU	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_164:
	mov	0x3c1, %r14
	.word 0xfef38400  ! 3855: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xbda48920  ! 3856: FMULs	fmuls	%f18, %f0, %f30
cpu_intr_1_289:
	setx	0x3e020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c8c0  ! 3861: FSUBd	fsubd	%f50, %f0, %f62
T1_asi_reg_rd_168:
	mov	0x1b, %r14
	.word 0xfadb84a0  ! 3865: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb7a9c820  ! 3867: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb1a84820  ! 3868: FMOVE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_169:
	mov	0x18, %r14
	.word 0xf0db8e40  ! 3869: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb7a94820  ! 3871: FMOVCS	fmovs	%fcc1, %f0, %f27
cpu_intr_1_290:
	setx	0x3c0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00520  ! 3876: FSQRTs	fsqrt	
iob_intr_1_346:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_346), 16, 16)) -> intp(1, 0, 8)
	.word 0xb1a80c20  ! 3881: FMOVRLZ	dis not found

	.word 0xbfa9c820  ! 3882: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb6840000  ! 3883: ADDcc_R	addcc 	%r16, %r0, %r27
iob_intr_1_347:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_347), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_wr_165:
	mov	0x3c4, %r14
	.word 0xfcf38e40  ! 3887: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xba45a175  ! 3888: ADDC_I	addc 	%r22, 0x0175, %r29
	.word 0xbba50960  ! 3889: FMULq	dis not found

	.word 0xb3ab8820  ! 3892: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb9ab0820  ! 3893: FMOVGU	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_166:
	mov	0x38, %r14
	.word 0xf0f38400  ! 3895: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbba5c8e0  ! 3896: FSUBq	dis not found

cpu_intr_1_291:
	setx	0x3e0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba9c820  ! 3898: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb7a5c920  ! 3903: FMULs	fmuls	%f23, %f0, %f27
	.word 0xbba88820  ! 3905: FMOVLE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_167:
	mov	0xb, %r14
	.word 0xf4f38e60  ! 3906: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T1_asi_reg_rd_170:
	mov	0x3c2, %r14
	.word 0xfcdb8400  ! 3907: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
T1_asi_reg_rd_171:
	mov	0x1c, %r14
	.word 0xfadb84a0  ! 3910: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T1_asi_reg_rd_172:
	mov	0x3c2, %r14
	.word 0xfcdb84a0  ! 3912: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbd353001  ! 3913: SRLX_I	srlx	%r20, 0x0001, %r30
cpu_intr_1_292:
	setx	0x3e012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r21 + %g0] 0xf0, %f2
cpu_intr_1_293:
	setx	0x3e0017, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_168:
	mov	0x3c3, %r14
	.word 0xfcf389e0  ! 3917: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb0b4a022  ! 3919: ORNcc_I	orncc 	%r18, 0x0022, %r24
T1_asi_reg_wr_169:
	mov	0x15, %r14
	.word 0xf6f38e80  ! 3920: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb3abc820  ! 3921: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb1a9c820  ! 3922: FMOVVS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_173:
	mov	0x13, %r14
	.word 0xf6db8400  ! 3923: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T1_asi_reg_rd_174:
	mov	0x9, %r14
	.word 0xf2db84a0  ! 3924: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb9ab4820  ! 3925: FMOVCC	fmovs	%fcc1, %f0, %f28
iob_intr_1_348:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_348), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_294:
	setx	0x3f0204, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_349:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_349), 16, 16)) -> intp(1, 0, 11)
	.word 0xb5aa8820  ! 3933: FMOVG	fmovs	%fcc1, %f0, %f26
	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_rd_175:
	mov	0x19, %r14
	.word 0xfedb8e40  ! 3935: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T1_asi_reg_rd_176:
	mov	0x3, %r14
	.word 0xf2db8e60  ! 3940: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbe0d8000  ! 3943: AND_R	and 	%r22, %r0, %r31
	.word 0xb5a40960  ! 3945: FMULq	dis not found

	.word 0xb9a00520  ! 3946: FSQRTs	fsqrt	
iob_intr_1_350:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_350), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_351:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_351), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb1a449c0  ! 3951: FDIVd	fdivd	%f48, %f0, %f24
T1_asi_reg_wr_170:
	mov	0x2c, %r14
	.word 0xfcf38400  ! 3952: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb9a5c8e0  ! 3953: FSUBq	dis not found

	.word 0xbdaac820  ! 3960: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb2158000  ! 3961: OR_R	or 	%r22, %r0, %r25
	.word 0xb1a90820  ! 3962: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xb7a548a0  ! 3965: FSUBs	fsubs	%f21, %f0, %f27
	.word 0xbba409c0  ! 3966: FDIVd	fdivd	%f16, %f0, %f60
	.word 0xb3a409a0  ! 3967: FDIVs	fdivs	%f16, %f0, %f25
cpu_intr_1_295:
	setx	0x3f0114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_352:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_352), 16, 16)) -> intp(1, 0, 6)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb8940000  ! 3973: ORcc_R	orcc 	%r16, %r0, %r28
	.word 0x8d9420ce  ! 3974: WRPR_PSTATE_I	wrpr	%r16, 0x00ce, %pstate
iob_intr_1_353:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_353), 16, 16)) -> intp(1, 0, 33)
cpu_intr_1_296:
	setx	0x3d0017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a48840  ! 3980: FADDd	faddd	%f18, %f0, %f28
cpu_intr_1_297:
	setx	0x3e0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80c20  ! 3982: FMOVRLZ	dis not found

cpu_intr_1_298:
	setx	0x3c002c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba4c820  ! 3986: FADDs	fadds	%f19, %f0, %f29
	.word 0xbba48920  ! 3988: FMULs	fmuls	%f18, %f0, %f29
	.word 0xb1a81820  ! 3989: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xbabca1d7  ! 3990: XNORcc_I	xnorcc 	%r18, 0x01d7, %r29
	lda	[%r21 + %g0] 0xf0, %f2
	.word 0xb3a00540  ! 3993: FSQRTd	fsqrt	
	.word 0xb0146027  ! 3994: OR_I	or 	%r17, 0x0027, %r24
	.word 0xb7a80820  ! 3996: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb3a449e0  ! 3998: FDIVq	dis not found

T1_asi_reg_rd_177:
	mov	0x7, %r14
	.word 0xf8db8400  ! 3999: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_1_354:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_354), 16, 16)) -> intp(1, 0, b)
T1_asi_reg_rd_178:
	mov	0x1a, %r14
	.word 0xf8db8e40  ! 4004: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_299:
	setx	0x3e020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_171:
	mov	0x21, %r14
	.word 0xf8f38e40  ! 4008: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbba98820  ! 4009: FMOVNEG	fmovs	%fcc1, %f0, %f29
cpu_intr_1_300:
	setx	0x3e0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa0820  ! 4011: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb1a00540  ! 4013: FSQRTd	fsqrt	
T1_asi_reg_wr_172:
	mov	0x1b, %r14
	.word 0xfaf38e40  ! 4014: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb7a80820  ! 4016: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
iob_intr_1_355:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_355), 16, 16)) -> intp(1, 0, 8)
cpu_intr_1_301:
	setx	0x3c002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb52063  ! 4021: ORNcc_I	orncc 	%r20, 0x0063, %r30
T1_asi_reg_wr_173:
	mov	0x10, %r14
	.word 0xfaf38e40  ! 4022: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_302:
	setx	0x3f0305, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_174:
	mov	0x27, %r14
	.word 0xfaf38400  ! 4029: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_rd_179:
	mov	0x22, %r14
	.word 0xf0db89e0  ! 4030: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb7a8c820  ! 4032: FMOVL	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_175:
	mov	0x2, %r14
	.word 0xf8f38e80  ! 4033: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xbe454000  ! 4034: ADDC_R	addc 	%r21, %r0, %r31
	lda	[%r21 + %g0] 0xf0, %f2
	.word 0xbba4c9a0  ! 4036: FDIVs	fdivs	%f19, %f0, %f29
T1_asi_reg_wr_176:
	mov	0x3c2, %r14
	.word 0xf2f38400  ! 4039: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_1_356:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_356), 16, 16)) -> intp(1, 0, 25)
	.word 0xb4bc6092  ! 4041: XNORcc_I	xnorcc 	%r17, 0x0092, %r26
T1_asi_reg_wr_177:
	mov	0x33, %r14
	.word 0xf2f38e40  ! 4042: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb1a00560  ! 4046: FSQRTq	fsqrt	
T1_asi_reg_wr_178:
	mov	0x4, %r14
	.word 0xf0f389e0  ! 4050: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_1_357:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_357), 16, 16)) -> intp(1, 0, 18)
T1_asi_reg_rd_180:
	mov	0x2, %r14
	.word 0xf6db8e60  ! 4055: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_1_303:
	setx	0x3d003a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_304:
	setx	0x3f0223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00040  ! 4061: FMOVd	fmovd	%f0, %f56
iob_intr_1_358:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_358), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb134d000  ! 4063: SRLX_R	srlx	%r19, %r0, %r24
	.word 0xbfa80420  ! 4064: FMOVRZ	dis not found

T1_asi_reg_rd_181:
	mov	0x3c5, %r14
	.word 0xfadb8e80  ! 4065: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T1_asi_reg_rd_182:
	mov	0x23, %r14
	.word 0xf6db8400  ! 4066: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb435610f  ! 4067: ORN_I	orn 	%r21, 0x010f, %r26
iob_intr_1_359:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_359), 16, 16)) -> intp(1, 0, f)
	.word 0xb7a40840  ! 4076: FADDd	faddd	%f16, %f0, %f58
cpu_intr_1_305:
	setx	0x3d0215, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_360:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_360), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_361:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_361), 16, 16)) -> intp(1, 0, 33)
	.word 0xb9a50860  ! 4087: FADDq	dis not found

	.word 0xb72c3001  ! 4089: SLLX_I	sllx	%r16, 0x0001, %r27
iob_intr_1_362:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_362), 16, 16)) -> intp(1, 0, d)
iob_intr_1_363:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_363), 16, 16)) -> intp(1, 0, 11)
	.word 0xbba5c9a0  ! 4092: FDIVs	fdivs	%f23, %f0, %f29
iob_intr_1_364:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_364), 16, 16)) -> intp(1, 0, 38)
iob_intr_1_365:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_365), 16, 16)) -> intp(1, 0, 1)
	.word 0xb7480000  ! 4099: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb5aa0820  ! 4100: FMOVA	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3aac820  ! 4115: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xb1a80820  ! 4116: FMOVN	fmovs	%fcc1, %f0, %f24
cpu_intr_1_306:
	setx	0x430028, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_183:
	mov	0x3, %r14
	.word 0xfcdb8e40  ! 4122: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb22d8000  ! 4123: ANDN_R	andn 	%r22, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_184:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 4127: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_rd_185:
	mov	0x3c0, %r14
	.word 0xf4db8e60  ! 4131: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb7a8c820  ! 4134: FMOVL	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_186:
	mov	0x3c3, %r14
	.word 0xf2db84a0  ! 4136: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbe0d8000  ! 4137: AND_R	and 	%r22, %r0, %r31
	.word 0xb5a98820  ! 4138: FMOVNEG	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_366:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_366), 16, 16)) -> intp(1, 0, 22)
T1_asi_reg_wr_179:
	mov	0x2a, %r14
	.word 0xf2f384a0  ! 4142: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_1_307:
	setx	0x400215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda8c820  ! 4146: FMOVL	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_187:
	mov	0x7, %r14
	.word 0xf8db8e40  ! 4147: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_308:
	setx	0x42012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa98820  ! 4157: FMOVNEG	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_180:
	mov	0x3c7, %r14
	.word 0xfef38e60  ! 4162: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T1_asi_reg_wr_181:
	mov	0x13, %r14
	.word 0xf4f38e80  ! 4163: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xb5a80820  ! 4167: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
iob_intr_1_367:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_367), 16, 16)) -> intp(1, 0, 12)
T1_asi_reg_rd_188:
	mov	0x3c7, %r14
	.word 0xfcdb8e80  ! 4170: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T1_asi_reg_rd_189:
	mov	0x23, %r14
	.word 0xf8db8e80  ! 4171: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_1_309:
	setx	0x42013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba50820  ! 4174: FADDs	fadds	%f20, %f0, %f29
	.word 0xb1a84820  ! 4175: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb5a9c820  ! 4176: FMOVVS	fmovs	%fcc1, %f0, %f26
	lda	[%r21 + %g0] 0xf0, %f2
cpu_intr_1_310:
	setx	0x430139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3abc820  ! 4180: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0x9195a1d8  ! 4181: WRPR_PIL_I	wrpr	%r22, 0x01d8, %pil
	.word 0xb1a84820  ! 4182: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xbfa58920  ! 4183: FMULs	fmuls	%f22, %f0, %f31
	.word 0xb3a81820  ! 4184: FMOVRGZ	fmovs	%fcc3, %f0, %f25
iob_intr_1_368:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_368), 16, 16)) -> intp(1, 0, a)
	.word 0xb534e001  ! 4188: SRL_I	srl 	%r19, 0x0001, %r26
	.word 0xb5a40840  ! 4189: FADDd	faddd	%f16, %f0, %f26
iob_intr_1_369:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_369), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb9a489a0  ! 4192: FDIVs	fdivs	%f18, %f0, %f28
	.word 0xb9641800  ! 4195: MOVcc_R	<illegal instruction>
T1_asi_reg_wr_182:
	mov	0x1b, %r14
	.word 0xf8f389e0  ! 4196: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbe2d6034  ! 4198: ANDN_I	andn 	%r21, 0x0034, %r31
T1_asi_reg_rd_190:
	mov	0x32, %r14
	.word 0xf8db8e40  ! 4199: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_wr_183:
	mov	0x16, %r14
	.word 0xfaf38e60  ! 4201: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_1_311:
	setx	0x40031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80420  ! 4212: FMOVRZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5354000  ! 4215: SRL_R	srl 	%r21, %r0, %r26
T1_asi_reg_wr_184:
	mov	0x1f, %r14
	.word 0xf2f384a0  ! 4216: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T1_asi_reg_wr_185:
	mov	0x1e, %r14
	.word 0xfef38e40  ! 4217: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb3a80420  ! 4218: FMOVRZ	dis not found

iob_intr_1_370:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_370), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_wr_186:
	mov	0x10, %r14
	.word 0xf4f38e80  ! 4221: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T1_asi_reg_rd_191:
	mov	0x8, %r14
	.word 0xf8db8400  ! 4222: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbfa81c20  ! 4223: FMOVRGEZ	dis not found

	.word 0xb5a48960  ! 4224: FMULq	dis not found

iob_intr_1_371:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_371), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_372:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_372), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb1a80c20  ! 4236: FMOVRLZ	dis not found

	.word 0xbe8d2179  ! 4237: ANDcc_I	andcc 	%r20, 0x0179, %r31
	.word 0xb7a409c0  ! 4238: FDIVd	fdivd	%f16, %f0, %f58
cpu_intr_1_312:
	setx	0x410217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a8c820  ! 4242: FMOVL	fmovs	%fcc1, %f0, %f26
cpu_intr_1_313:
	setx	0x410323, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_187:
	mov	0x3c1, %r14
	.word 0xf8f38e80  ! 4244: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T1_asi_reg_rd_192:
	mov	0x2e, %r14
	.word 0xf6db84a0  ! 4245: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb1a58920  ! 4247: FMULs	fmuls	%f22, %f0, %f24
	lda	[%r21 + %g0] 0xf0, %f2
cpu_intr_1_314:
	setx	0x41020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aa8820  ! 4252: FMOVG	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_188:
	mov	0x1f, %r14
	.word 0xf6f384a0  ! 4253: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb7a408a0  ! 4255: FSUBs	fsubs	%f16, %f0, %f27
iob_intr_1_373:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_373), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_315:
	setx	0x400100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c820  ! 4264: FADDs	fadds	%f19, %f0, %f31
T1_asi_reg_rd_193:
	mov	0x3, %r14
	.word 0xf6db8e80  ! 4267: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xb8b4e026  ! 4271: ORNcc_I	orncc 	%r19, 0x0026, %r28
T1_asi_reg_wr_189:
	mov	0x9, %r14
	.word 0xfef389e0  ! 4273: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_wr_190:
	mov	0xf, %r14
	.word 0xf2f389e0  ! 4274: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T1_asi_reg_rd_194:
	mov	0x37, %r14
	.word 0xf2db8e80  ! 4277: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbd2d9000  ! 4278: SLLX_R	sllx	%r22, %r0, %r30
	.word 0xbfa80420  ! 4280: FMOVRZ	dis not found

	.word 0xbd7c8400  ! 4283: MOVR_R	movre	%r18, %r0, %r30
iob_intr_1_374:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_374), 16, 16)) -> intp(1, 0, a)
	.word 0xbbaa8820  ! 4285: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xbeac2171  ! 4286: ANDNcc_I	andncc 	%r16, 0x0171, %r31
iob_intr_1_375:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_375), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_376:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_376), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_377:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_377), 16, 16)) -> intp(1, 0, 27)
cpu_intr_1_316:
	setx	0x400234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfaac820  ! 4296: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb1a00560  ! 4297: FSQRTq	fsqrt	
	.word 0xbda449e0  ! 4298: FDIVq	dis not found

T1_asi_reg_wr_191:
	mov	0x24, %r14
	.word 0xfcf38e40  ! 4301: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_378:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_378), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_rd_195:
	mov	0x7, %r14
	.word 0xfadb8e40  ! 4303: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb7a81420  ! 4305: FMOVRNZ	dis not found

T1_asi_reg_wr_192:
	mov	0x2a, %r14
	.word 0xf0f38400  ! 4312: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_1_317:
	setx	0x410106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81420  ! 4316: FMOVRNZ	dis not found

cpu_intr_1_318:
	setx	0x430104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6a4c000  ! 4320: SUBcc_R	subcc 	%r19, %r0, %r27
cpu_intr_1_319:
	setx	0x420223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaa8820  ! 4324: FMOVG	fmovs	%fcc1, %f0, %f29
cpu_intr_1_320:
	setx	0x41000f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_379:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_379), 16, 16)) -> intp(1, 0, f)
	.word 0xbda81c20  ! 4334: FMOVRGEZ	dis not found

	.word 0xb9a5c8e0  ! 4336: FSUBq	dis not found

cpu_intr_1_321:
	setx	0x410126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda5c8e0  ! 4341: FSUBq	dis not found

	.word 0xb3a80c20  ! 4344: FMOVRLZ	dis not found

	.word 0xbb500000  ! 4346: RDPR_TPC	<illegal instruction>
cpu_intr_1_322:
	setx	0x400330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80820  ! 4348: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xbbaac820  ! 4349: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb5a81420  ! 4350: FMOVRNZ	dis not found

cpu_intr_1_323:
	setx	0x43003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_196:
	mov	0x1f, %r14
	.word 0xfcdb84a0  ! 4357: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T1_asi_reg_wr_193:
	mov	0x2d, %r14
	.word 0xf6f38e80  ! 4358: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T1_asi_reg_wr_194:
	mov	0x28, %r14
	.word 0xf6f38e80  ! 4359: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb9508000  ! 4361: RDPR_TSTATE	<illegal instruction>
	.word 0xb5aac820  ! 4363: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xbba90820  ! 4364: FMOVLEU	fmovs	%fcc1, %f0, %f29
cpu_intr_1_324:
	setx	0x420039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba940000  ! 4368: ORcc_R	orcc 	%r16, %r0, %r29
	.word 0xb3a5c820  ! 4371: FADDs	fadds	%f23, %f0, %f25
	.word 0xba84210a  ! 4372: ADDcc_I	addcc 	%r16, 0x010a, %r29
	.word 0xbfa4c820  ! 4374: FADDs	fadds	%f19, %f0, %f31
iob_intr_1_380:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_380), 16, 16)) -> intp(1, 0, f)
	.word 0xb92dd000  ! 4379: SLLX_R	sllx	%r23, %r0, %r28
iob_intr_1_381:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_381), 16, 16)) -> intp(1, 0, a)
cpu_intr_1_325:
	setx	0x420211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_326:
	setx	0x420103, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda84820  ! 4386: FMOVE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_327:
	setx	0x400217, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_195:
	mov	0xd, %r14
	.word 0xf8f38e40  ! 4393: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_rd_197:
	mov	0x3c7, %r14
	.word 0xf2db84a0  ! 4394: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xbfa58820  ! 4396: FADDs	fadds	%f22, %f0, %f31
cpu_intr_1_328:
	setx	0x40033c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_329:
	setx	0x40003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a58840  ! 4402: FADDd	faddd	%f22, %f0, %f28
	.word 0xba2c6184  ! 4404: ANDN_I	andn 	%r17, 0x0184, %r29
	.word 0xbfa81420  ! 4406: FMOVRNZ	dis not found

cpu_intr_1_330:
	setx	0x410025, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_382:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_382), 16, 16)) -> intp(1, 0, 3f)
cpu_intr_1_331:
	setx	0x430336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa58860  ! 4419: FADDq	dis not found

	.word 0xbda88820  ! 4421: FMOVLE	fmovs	%fcc1, %f0, %f30
iob_intr_1_383:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_383), 16, 16)) -> intp(1, 0, e)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
iob_intr_1_384:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_384), 16, 16)) -> intp(1, 0, 29)
	.word 0xb1a81420  ! 4428: FMOVRNZ	dis not found

	.word 0xbba00520  ! 4429: FSQRTs	fsqrt	
	.word 0xbda90820  ! 4430: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb7aa4820  ! 4432: FMOVNE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_332:
	setx	0x430101, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_385:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_385), 16, 16)) -> intp(1, 0, c)
	.word 0xbba409a0  ! 4438: FDIVs	fdivs	%f16, %f0, %f29
cpu_intr_1_333:
	setx	0x420302, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_198:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 4443: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_1_386:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_386), 16, 16)) -> intp(1, 0, 4)
	.word 0xbdab8820  ! 4449: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbda00520  ! 4450: FSQRTs	fsqrt	
iob_intr_1_387:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_387), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_334:
	setx	0x43023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00020  ! 4461: FMOVs	fmovs	%f0, %f26
T1_asi_reg_rd_199:
	mov	0xc, %r14
	.word 0xfadb8e40  ! 4463: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_wr_196:
	mov	0x1b, %r14
	.word 0xf4f38e40  ! 4469: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbdaa8820  ! 4470: FMOVG	fmovs	%fcc1, %f0, %f30
cpu_intr_1_335:
	setx	0x410139, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_336:
	setx	0x40020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab4820  ! 4473: FMOVCC	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_197:
	mov	0x19, %r14
	.word 0xf0f38e40  ! 4477: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb3a549e0  ! 4480: FDIVq	dis not found

T1_asi_reg_wr_198:
	mov	0x33, %r14
	.word 0xfaf38e40  ! 4481: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_1_337:
	setx	0x400119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c920  ! 4483: FMULs	fmuls	%f19, %f0, %f31
	.word 0xbdab0820  ! 4486: FMOVGU	fmovs	%fcc1, %f0, %f30
cpu_intr_1_338:
	setx	0x430200, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_200:
	mov	0x29, %r14
	.word 0xf6db8e40  ! 4491: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0x8f902000  ! 4492: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
iob_intr_1_388:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_388), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_339:
	setx	0x43011f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_340:
	setx	0x41023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_201:
	mov	0x3c2, %r14
	.word 0xf4db8e80  ! 4501: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T1_asi_reg_wr_199:
	mov	0x24, %r14
	.word 0xf6f38e80  ! 4505: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_1_389:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_389), 16, 16)) -> intp(1, 0, e)
T1_asi_reg_rd_202:
	mov	0xa, %r14
	.word 0xf6db8400  ! 4510: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
T1_asi_reg_wr_200:
	mov	0x3c2, %r14
	.word 0xf6f38e40  ! 4512: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbda81420  ! 4514: FMOVRNZ	dis not found

	.word 0xbe94e0aa  ! 4515: ORcc_I	orcc 	%r19, 0x00aa, %r31
	lda	[%r18 + %g0] 0xf0, %f2
	.word 0xb9a4c940  ! 4517: FMULd	fmuld	%f50, %f0, %f28
T1_asi_reg_rd_203:
	mov	0x11, %r14
	.word 0xfadb89e0  ! 4521: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T1_asi_reg_wr_201:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 4523: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbda00520  ! 4524: FSQRTs	fsqrt	
T1_asi_reg_wr_202:
	mov	0x3c6, %r14
	.word 0xfef38e60  ! 4525: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb9a80820  ! 4526: FMOVN	fmovs	%fcc1, %f0, %f28
iob_intr_1_390:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_390), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_391:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_391), 16, 16)) -> intp(1, 0, 20)
	.word 0xbfa00540  ! 4532: FSQRTd	fsqrt	
	.word 0xb9a5c9a0  ! 4534: FDIVs	fdivs	%f23, %f0, %f28
cpu_intr_1_341:
	setx	0x420227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a88820  ! 4538: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb5aac820  ! 4542: FMOVGE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_204:
	mov	0x3c0, %r14
	.word 0xfcdb8e60  ! 4544: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_1_392:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_392), 16, 16)) -> intp(1, 0, 7)
	.word 0xb5a81820  ! 4549: FMOVRGZ	fmovs	%fcc3, %f0, %f26
cpu_intr_1_342:
	setx	0x400029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00040  ! 4551: FMOVd	fmovd	%f0, %f24
	lda	[%r18 + %g0] 0xf0, %f2
cpu_intr_1_343:
	setx	0x420239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba90820  ! 4564: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb3a81820  ! 4565: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb9a80820  ! 4566: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb1aa8820  ! 4568: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb52c1000  ! 4570: SLLX_R	sllx	%r16, %r0, %r26
	.word 0xbe0d8000  ! 4572: AND_R	and 	%r22, %r0, %r31
	.word 0xb7a81420  ! 4574: FMOVRNZ	dis not found

	.word 0xbbaa8820  ! 4575: FMOVG	fmovs	%fcc1, %f0, %f29
cpu_intr_1_344:
	setx	0x46033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a408a0  ! 4582: FSUBs	fsubs	%f16, %f0, %f25
	.word 0xb72d8000  ! 4583: SLL_R	sll 	%r22, %r0, %r27
T1_asi_reg_wr_203:
	mov	0x35, %r14
	.word 0xfef38e80  ! 4585: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_rd_205:
	mov	0xc, %r14
	.word 0xf8db8e60  ! 4586: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_1_393:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_393), 16, 16)) -> intp(1, 0, 2b)
iob_intr_1_394:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_394), 16, 16)) -> intp(1, 0, 13)
	.word 0xb3aa0820  ! 4597: FMOVA	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_206:
	mov	0xa, %r14
	.word 0xf6db8e40  ! 4598: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T1_asi_reg_rd_207:
	mov	0x32, %r14
	.word 0xf0db8e40  ! 4599: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb834a029  ! 4600: ORN_I	orn 	%r18, 0x0029, %r28
iob_intr_1_395:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_395), 16, 16)) -> intp(1, 0, 18)
T1_asi_reg_rd_208:
	mov	0x34, %r14
	.word 0xf2db8e40  ! 4603: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_345:
	setx	0x460219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_346:
	setx	0x450222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a408a0  ! 4615: FSUBs	fsubs	%f16, %f0, %f25
	.word 0xbba00520  ! 4616: FSQRTs	fsqrt	
	.word 0xb2354000  ! 4617: ORN_R	orn 	%r21, %r0, %r25
cpu_intr_1_347:
	setx	0x470324, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_396:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_396), 16, 16)) -> intp(1, 0, 1a)
iob_intr_1_397:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_397), 16, 16)) -> intp(1, 0, d)
	.word 0xb1a4c9e0  ! 4627: FDIVq	dis not found

T1_asi_reg_rd_209:
	mov	0x2d, %r14
	.word 0xf6db84a0  ! 4632: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T1_asi_reg_wr_204:
	mov	0x23, %r14
	.word 0xfef38e80  ! 4633: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb3a8c820  ! 4634: FMOVL	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_205:
	mov	0x32, %r14
	.word 0xfef389e0  ! 4636: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_1_348:
	setx	0x470126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba84a088  ! 4640: ADDcc_I	addcc 	%r18, 0x0088, %r29
T1_asi_reg_rd_210:
	mov	0x23, %r14
	.word 0xfadb84a0  ! 4643: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T1_asi_reg_wr_206:
	mov	0x3c5, %r14
	.word 0xf8f38e40  ! 4644: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb1a40820  ! 4651: FADDs	fadds	%f16, %f0, %f24
	.word 0xb551c000  ! 4652: RDPR_TL	<illegal instruction>
	.word 0xb1ab4820  ! 4653: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xbfa44920  ! 4655: FMULs	fmuls	%f17, %f0, %f31
	.word 0xb7a81c20  ! 4658: FMOVRGEZ	dis not found

T1_asi_reg_wr_207:
	mov	0x3c8, %r14
	.word 0xfaf38400  ! 4660: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb7a84820  ! 4664: FMOVE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_211:
	mov	0x3c2, %r14
	.word 0xf8db8400  ! 4667: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_1_398:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_398), 16, 16)) -> intp(1, 0, 1c)
T1_asi_reg_wr_208:
	mov	0x18, %r14
	.word 0xf8f38e40  ! 4672: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb1ab0820  ! 4673: FMOVGU	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_212:
	mov	0x16, %r14
	.word 0xf8db8400  ! 4679: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xb5a509e0  ! 4680: FDIVq	dis not found

	.word 0xbba80420  ! 4681: FMOVRZ	dis not found

	.word 0xbfa4c820  ! 4683: FADDs	fadds	%f19, %f0, %f31
	.word 0xb9a88820  ! 4686: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb5a4c9c0  ! 4688: FDIVd	fdivd	%f50, %f0, %f26
	.word 0xbaa50000  ! 4689: SUBcc_R	subcc 	%r20, %r0, %r29
cpu_intr_1_349:
	setx	0x46003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_350:
	setx	0x470235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab4820  ! 4694: FMOVCC	fmovs	%fcc1, %f0, %f27
cpu_intr_1_351:
	setx	0x460119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a94820  ! 4699: FMOVCS	fmovs	%fcc1, %f0, %f27
cpu_intr_1_352:
	setx	0x440207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbebc0000  ! 4704: XNORcc_R	xnorcc 	%r16, %r0, %r31
	.word 0xb7a80420  ! 4706: FMOVRZ	dis not found

	.word 0xb1ab8820  ! 4710: FMOVPOS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_209:
	mov	0x34, %r14
	.word 0xf8f38e80  ! 4711: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T1_asi_reg_wr_210:
	mov	0x3c1, %r14
	.word 0xf2f38e80  ! 4712: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T1_asi_reg_wr_211:
	mov	0x2d, %r14
	.word 0xf8f38e40  ! 4713: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb1a508c0  ! 4716: FSUBd	fsubd	%f20, %f0, %f24
iob_intr_1_399:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_399), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_400:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_400), 16, 16)) -> intp(1, 0, 27)
iob_intr_1_401:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_401), 16, 16)) -> intp(1, 0, 24)
	lda	[%r17 + %g0] 0xf0, %f2
iob_intr_1_402:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_402), 16, 16)) -> intp(1, 0, 20)
T1_asi_reg_wr_212:
	mov	0x17, %r14
	.word 0xfcf38400  ! 4726: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbba00520  ! 4728: FSQRTs	fsqrt	
	.word 0xb9a80820  ! 4730: FMOVN	fmovs	%fcc1, %f0, %f28
iob_intr_1_403:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_403), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_404:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_404), 16, 16)) -> intp(1, 0, 12)
T1_asi_reg_rd_213:
	mov	0x34, %r14
	.word 0xf0db8e40  ! 4737: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb7a94820  ! 4740: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb9a81820  ! 4741: FMOVRGZ	fmovs	%fcc3, %f0, %f28
cpu_intr_1_353:
	setx	0x45023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_214:
	mov	0x3c5, %r14
	.word 0xfadb84a0  ! 4745: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb5a00540  ! 4747: FSQRTd	fsqrt	
iob_intr_1_405:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_405), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_rd_215:
	mov	0x14, %r14
	.word 0xf4db8e80  ! 4751: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_1_354:
	setx	0x47032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe258000  ! 4755: SUB_R	sub 	%r22, %r0, %r31
T1_asi_reg_rd_216:
	mov	0x3c8, %r14
	.word 0xfedb84a0  ! 4762: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_1_406:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_406), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_wr_213:
	mov	0x23, %r14
	.word 0xfcf389e0  ! 4764: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb5aa0820  ! 4765: FMOVA	fmovs	%fcc1, %f0, %f26
iob_intr_1_407:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_407), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_408:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_408), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_wr_214:
	mov	0x5, %r14
	.word 0xf0f38e40  ! 4768: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_355:
	setx	0x470001, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_409:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_409), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb1a00560  ! 4773: FSQRTq	fsqrt	
	.word 0xb2acc000  ! 4774: ANDNcc_R	andncc 	%r19, %r0, %r25
	.word 0xb5ab0820  ! 4776: FMOVGU	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_217:
	mov	0x33, %r14
	.word 0xf2db8400  ! 4777: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb9a00520  ! 4778: FSQRTs	fsqrt	
iob_intr_1_410:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_410), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb1a00020  ! 4780: FMOVs	fmovs	%f0, %f24
T1_asi_reg_rd_218:
	mov	0x35, %r14
	.word 0xfadb8e60  ! 4782: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb3510000  ! 4783: RDPR_TICK	<illegal instruction>
	.word 0xb4ac4000  ! 4784: ANDNcc_R	andncc 	%r17, %r0, %r26
cpu_intr_1_356:
	setx	0x470227, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00540  ! 4786: FSQRTd	fsqrt	
	.word 0xb7a94820  ! 4788: FMOVCS	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_219:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 4794: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_rd_220:
	mov	0x24, %r14
	.word 0xf8db8e60  ! 4795: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T1_asi_reg_rd_221:
	mov	0x2a, %r14
	.word 0xf6db8400  ! 4797: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbfab0820  ! 4799: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb3a9c820  ! 4803: FMOVVS	fmovs	%fcc1, %f0, %f25
iob_intr_1_411:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_411), 16, 16)) -> intp(1, 0, 3f)
cpu_intr_1_357:
	setx	0x47022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_412:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_412), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_413:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_413), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_rd_222:
	mov	0x4, %r14
	.word 0xf6db8e40  ! 4809: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbba84820  ! 4810: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb7a00040  ! 4811: FMOVd	fmovd	%f0, %f58
	.word 0xbfa8c820  ! 4813: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xbfa00540  ! 4816: FSQRTd	fsqrt	
	.word 0xbfa448a0  ! 4817: FSUBs	fsubs	%f17, %f0, %f31
	.word 0xbfab0820  ! 4820: FMOVGU	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_215:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 4821: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_wr_216:
	mov	0x8, %r14
	.word 0xf0f38e40  ! 4825: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_358:
	setx	0x470318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a488e0  ! 4828: FSUBq	dis not found

	.word 0xb5a81c20  ! 4829: FMOVRGEZ	dis not found

	.word 0xb5a58840  ! 4830: FADDd	faddd	%f22, %f0, %f26
cpu_intr_1_359:
	setx	0x450319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba58960  ! 4834: FMULq	dis not found

iob_intr_1_414:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_414), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_rd_223:
	mov	0x3c1, %r14
	.word 0xfcdb8e40  ! 4838: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_415:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_415), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_416:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_416), 16, 16)) -> intp(1, 0, 35)
cpu_intr_1_360:
	setx	0x460300, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_217:
	mov	0x28, %r14
	.word 0xf2f38e80  ! 4850: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_1_417:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_417), 16, 16)) -> intp(1, 0, 36)
cpu_intr_1_361:
	setx	0x440012, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_362:
	setx	0x440310, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_224:
	mov	0x1c, %r14
	.word 0xf4db8e40  ! 4866: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb235607d  ! 4868: SUBC_I	orn 	%r21, 0x007d, %r25
	.word 0xb7a50840  ! 4869: FADDd	faddd	%f20, %f0, %f58
	.word 0xb9a448e0  ! 4871: FSUBq	dis not found

cpu_intr_1_363:
	setx	0x47001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_225:
	mov	0x3, %r14
	.word 0xf0db8e40  ! 4873: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_418:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_418), 16, 16)) -> intp(1, 0, 37)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_364:
	setx	0x45022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8a44000  ! 4877: SUBcc_R	subcc 	%r17, %r0, %r28
	.word 0xbba489a0  ! 4878: FDIVs	fdivs	%f18, %f0, %f29
T1_asi_reg_wr_218:
	mov	0x38, %r14
	.word 0xf0f389e0  ! 4879: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xbba588c0  ! 4888: FSUBd	fsubd	%f22, %f0, %f60
	.word 0xb3a00560  ! 4890: FSQRTq	fsqrt	
	.word 0xb7a54840  ! 4891: FADDd	faddd	%f52, %f0, %f58
	.word 0xbcbde1c2  ! 4893: XNORcc_I	xnorcc 	%r23, 0x01c2, %r30
iob_intr_1_419:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_419), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_420:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_420), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbba00020  ! 4897: FMOVs	fmovs	%f0, %f29
T1_asi_reg_wr_219:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 4898: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xbda90820  ! 4899: FMOVLEU	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_220:
	mov	0x18, %r14
	.word 0xf2f38e40  ! 4900: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb5a4c820  ! 4902: FADDs	fadds	%f19, %f0, %f26
	.word 0xb6b4a15a  ! 4904: SUBCcc_I	orncc 	%r18, 0x015a, %r27
iob_intr_1_421:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_421), 16, 16)) -> intp(1, 0, 26)
iob_intr_1_422:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_422), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb3a50960  ! 4914: FMULq	dis not found

T1_asi_reg_wr_221:
	mov	0x13, %r14
	.word 0xf0f38e40  ! 4915: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb7a88820  ! 4916: FMOVLE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_226:
	mov	0x12, %r14
	.word 0xf4db8e80  ! 4920: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb1a449e0  ! 4921: FDIVq	dis not found

iob_intr_1_423:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_423), 16, 16)) -> intp(1, 0, 27)
	.word 0xb9a80820  ! 4926: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xbfa40940  ! 4930: FMULd	fmuld	%f16, %f0, %f62
	.word 0xbfa80820  ! 4933: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb6adc000  ! 4935: ANDNcc_R	andncc 	%r23, %r0, %r27
T1_asi_reg_rd_227:
	mov	0x3c4, %r14
	.word 0xf6db8e60  ! 4937: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb1a80c20  ! 4938: FMOVRLZ	dis not found

	.word 0xbd2d6001  ! 4941: SLL_I	sll 	%r21, 0x0001, %r30
T1_asi_reg_rd_228:
	mov	0x10, %r14
	.word 0xf6db8e60  ! 4942: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_1_365:
	setx	0x46011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00540  ! 4949: FSQRTd	fsqrt	
T1_asi_reg_rd_229:
	mov	0x1e, %r14
	.word 0xf2db89e0  ! 4950: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb9aa4820  ! 4952: FMOVNE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_222:
	mov	0xa, %r14
	.word 0xf8f38e60  ! 4954: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_230:
	mov	0x14, %r14
	.word 0xf2db8e60  ! 4956: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb8b461eb  ! 4959: SUBCcc_I	orncc 	%r17, 0x01eb, %r28
T1_asi_reg_wr_223:
	mov	0x30, %r14
	.word 0xf8f384a0  ! 4961: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb9643801  ! 4962: MOVcc_I	<illegal instruction>
cpu_intr_1_366:
	setx	0x47021f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_424:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_424), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_425:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_425), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb935e001  ! 4970: SRL_I	srl 	%r23, 0x0001, %r28
iob_intr_1_426:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_426), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_427:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_427), 16, 16)) -> intp(1, 0, 2d)
cpu_intr_1_367:
	setx	0x440006, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_231:
	mov	0x18, %r14
	.word 0xfadb89e0  ! 4978: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xbba589a0  ! 4983: FDIVs	fdivs	%f22, %f0, %f29
T1_asi_reg_wr_224:
	mov	0x3c3, %r14
	.word 0xf8f38400  ! 4989: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb9a00040  ! 4990: FMOVd	fmovd	%f0, %f28
	.word 0xb6150000  ! 4991: OR_R	or 	%r20, %r0, %r27
iob_intr_1_428:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_428), 16, 16)) -> intp(1, 0, 1)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_429:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_429), 16, 16)) -> intp(1, 0, 3a)

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 4, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 12, 16, 16)) -> intp(3, 1, 1)
	.data
fsr_data:

	.xword	0x0000000000000000
	.align 0x1000
	.data
data_start_0:

	.xword	0x9a0e7d6c48697771
	.xword	0x43203acb089ca619
	.xword	0x800c79c8d3b072ff
	.xword	0x268fdafeed6f1d12
	.xword	0xa1af8d81befbc0d7
	.xword	0x6c0a0fbc24c51001
	.xword	0x1353c87f5c7990d8
	.xword	0x43571cf1131ebcbd
	.xword	0xc19a34f09ae7da15
	.xword	0x943bae2c418f2dd1
	.xword	0x722f5614c7bcb35c
	.xword	0x38af0c4cdda59da6
	.xword	0xa94cfb169522b262
	.xword	0x015f3371b4642259
	.xword	0xb446d66dbfbdfe56
	.xword	0xe5d538607dfa4f48
	.xword	0x80fc40689ec0d8fb
	.xword	0xcbfa52d6f3666a4f
	.xword	0x9d7b5607885d2765
	.xword	0x9340e778ef4586cb
	.xword	0xe47a28bfd6811ce7
	.xword	0xd584da61acace51e
	.xword	0x34bd9d91060f1511
	.xword	0x02e7425a26bd6a03
	.xword	0x36718891c637b690
	.xword	0x869f827350958747
	.xword	0x79433506c2b2d242
	.xword	0x0777c6aa37e649c8
	.xword	0x2c60f06d4896451d
	.xword	0x11f3b51ba21b2712
	.xword	0x12f9ddfe5de0a7dc
	.xword	0x1a5a15fe7ba17fd5
	.xword	0x73cc953a332fbfda
	.xword	0x863b5582ac44a22a
	.xword	0x8ad22b5c480b1fa3
	.xword	0x54e54f469d40bd98
	.xword	0xaaaf2b8ae00e69ab
	.xword	0xa2bf5a9fcf1d8418
	.xword	0x4fbf93ffde2e6683
	.xword	0x3cffdfb865943f16
	.xword	0x81970b305c657758
	.xword	0xca1a1b3f43b32c84
	.xword	0xba7e58de8be39179
	.xword	0x919178cdb2389ae2
	.xword	0x2530e72f95345299
	.xword	0x3728242db4dfc4df
	.xword	0xe174f2d5ab3048a9
	.xword	0xa3e5bf5284807a9b
	.xword	0xb93deca8ea1108de
	.xword	0xeeb926e24ddea16b
	.xword	0x665f8b04bd79d097
	.xword	0xd62509aab603f353
	.xword	0x650d551d6c9e9920
	.xword	0x9998fefd5172e9f7
	.xword	0xba2dacbcc9ddbf4b
	.xword	0x6ac163989e6e1db8
	.xword	0xda53db247a95ac53
	.xword	0xda08ccf2127c7057
	.xword	0xb7c9f28fd5e3838f
	.xword	0x93f6f2187fdb5486
	.xword	0x27da95aed47aba29
	.xword	0xabde92517d210e50
	.xword	0x0faa00f85de17884
	.xword	0xfd3cdad70b4bdba5
	.xword	0xd88dc8079e69b666
	.xword	0x8fac7e3381bd67d9
	.xword	0x25904bcbf34cbd86
	.xword	0xad30645f195da099
	.xword	0x999b806141852d43
	.xword	0x8511ecce57b2fb81
	.xword	0x540627af46d2a96c
	.xword	0x09851d0e0084eee5
	.xword	0xac7574b34df3c6d0
	.xword	0x661ad9f35cef1a7b
	.xword	0x7a2b6b5cf2ec2531
	.xword	0xff94960d80cfcd5c
	.xword	0x00e48c49696326bd
	.xword	0xee21120df47d6c80
	.xword	0xd438eb404ad2fb0b
	.xword	0xdade4c369d2d7af2
	.xword	0xfc4f19bc334674be
	.xword	0xa7d6dcd78c0d0659
	.xword	0xd896866c65cb7c8f
	.xword	0x9f026599bbe9ef95
	.xword	0x29789414e1e6cf69
	.xword	0x27059d2eeaa2eb41
	.xword	0x83270c6a185d72a2
	.xword	0x68e92b0e56864767
	.xword	0x307ee3cd8c88ac14
	.xword	0x7d4b09f4d555489e
	.xword	0x07adeb6b0e9da168
	.xword	0x1fab3c7988b68bd5
	.xword	0xb47488326dd54d2e
	.xword	0xd05f34b0fee80786
	.xword	0xc5efc813d1b40534
	.xword	0xc648cac733ec94c0
	.xword	0x7cc8f6e32405d3ff
	.xword	0xbe91238434d0056d
	.xword	0x4a5908606dbfed11
	.xword	0xd3e0c2890b4297dc
	.xword	0x9143d128b11f5430
	.xword	0xb98b896c7477dfd3
	.xword	0x57c65cdbf6fea969
	.xword	0xece68d718563c106
	.xword	0xf34de13e18a02e1f
	.xword	0x54ed60e3d28f2875
	.xword	0x09ed7cb8052ceb64
	.xword	0xe907cf981f1a5d6c
	.xword	0x5eeca9f282ce9b2e
	.xword	0x3c93735af991d0a8
	.xword	0x63e025688cbcebae
	.xword	0x47e6c6f965d6723b
	.xword	0xf66c92c4e4dcd506
	.xword	0x7e6ada25000a9f3e
	.xword	0xe9c5b1d21d74226a
	.xword	0x79a06379f1ef831c
	.xword	0xff80252edab12060
	.xword	0x91e70ac5d347e02d
	.xword	0xeb5e1c0697e81ca8
	.xword	0x1a6f08f91a37ee20
	.xword	0xfe9b5fed6933d96d
	.xword	0x3d067e8b8d0d40a9
	.xword	0xb356a71650c5242e
	.xword	0xb0f90154f0174abc
	.xword	0x0eea6043aa07d298
	.xword	0x3bac8b7684375a83
	.xword	0x9912f26a3b45b9c4
	.xword	0x4abe7cbc1feffe9e
	.xword	0xe4356c2d7720427b
	.xword	0xa52eb42263b504c0
	.xword	0x6a6c1d2b3782acb3
	.xword	0xa7c47a5a3dd76e00
	.xword	0xf2250c154fd3d145
	.xword	0x956297f5b2ed553b
	.xword	0xb3faf419a7dbee21
	.xword	0x4dec8c55acf380c8
	.xword	0x01c3137dd97c8216
	.xword	0x7efba0e5e12d4081
	.xword	0xdf161c01e4e1b06a
	.xword	0xf0e73d1887745404
	.xword	0x6e631da4a5e72dbf
	.xword	0x00c4f5d797bbdf0b
	.xword	0x997ed14364b92e66
	.xword	0x591c5aab6a21f822
	.xword	0x4c0b266b7ccb5b5c
	.xword	0x039ff88b6adc9ba7
	.xword	0xb49e664a99eeb7e5
	.xword	0x9cfc096b22f9d230
	.xword	0x4c6a79eb3a766598
	.xword	0xd0a29d27885a7672
	.xword	0x15ca6d8a9a7ccbfc
	.xword	0xd2e849a1a38b581a
	.xword	0x44d9b03e39c88ffd
	.xword	0x00f2cc028576c8b6
	.xword	0x0d5e8c9405f4ac0f
	.xword	0xe775702b4e29ca7c
	.xword	0x3b4b9f86c163a4d2
	.xword	0xcb42c842bbda9e58
	.xword	0x398ad69b8a32abc8
	.xword	0x0bab7846fe4d95d5
	.xword	0x2cbc3f5d8270703a
	.xword	0x50d78a130240ed3e
	.xword	0x71295015394fe2ad
	.xword	0x9b0bed60e7b51a3a
	.xword	0xb315421407e742d3
	.xword	0x5b52f36bfeb225b7
	.xword	0xe734e94a4f75605a
	.xword	0x6c8ddfc7e7080f88
	.xword	0xdbcbb25fd8547452
	.xword	0x189f867eec9681b2
	.xword	0x7a2ea658be261c90
	.xword	0x5328145dd13ba2c3
	.xword	0x8ab5ed7f66e55379
	.xword	0xa2bef2af8d31bf0f
	.xword	0x0ac09b2083922d0c
	.xword	0xd55d36ed3a365cbb
	.xword	0x7e97dc2d72239feb
	.xword	0xe9ea224cffb4d5ed
	.xword	0xd0e42289c53b26a1
	.xword	0xedeac28cd6e75185
	.xword	0xa7df8607fb8d6031
	.xword	0xb0c216900fa7f0a2
	.xword	0xf211f5fb5dfaa61f
	.xword	0x573f8a9887dd8949
	.xword	0x9e54f2a5b3bbae15
	.xword	0x384b3739bd907dc4
	.xword	0x87cb287e2fdae6c9
	.xword	0x6410d6aaa19a8378
	.xword	0x1857bbe54f0d7336
	.xword	0x92837535aa594caa
	.xword	0x51aa01514d344f24
	.xword	0x56197836d654e319
	.xword	0x0641300151135940
	.xword	0x055a95fc17a3fc0c
	.xword	0xded3ffb48123931a
	.xword	0x731a54ea1d9a435b
	.xword	0xb193691e12eb6ebb
	.xword	0x47e737c649614925
	.xword	0x1110d4e04bd9d7b0
	.xword	0x339a8fc5dfeaf5f4
	.xword	0xa681b00529d49764
	.xword	0xcdc93d2dbb863cd8
	.xword	0xec36c93360c044f2
	.xword	0x2c49a1502571bc5c
	.xword	0xf6f10e387a69f9ea
	.xword	0x28d66c079a0db223
	.xword	0xd0b36f6fdb16bb93
	.xword	0x03954ba44594d517
	.xword	0xe70805b7407a85ee
	.xword	0xbf82a31ccc808ba6
	.xword	0x90c13d001d69edc7
	.xword	0xfc88e870299c862d
	.xword	0x086199d5056848b3
	.xword	0xc889238f6fa5e61c
	.xword	0x052ffa65c4ec0b4e
	.xword	0x37b802dfc70622e8
	.xword	0xd507c98213194b40
	.xword	0xe7148a07133262bd
	.xword	0x597a6f72826042d2
	.xword	0x8fec82f01b7c8233
	.xword	0x5dd1bb46d301058d
	.xword	0x956822b39518f82e
	.xword	0x00aab9b88659882b
	.xword	0x1adbc141d9546376
	.xword	0x5165cf10dd4d3410
	.xword	0x92c184239e143e74
	.xword	0xc13bb42da4805ba7
	.xword	0xd3dec89d3827f413
	.xword	0xa445c15ab669ef7d
	.xword	0xe68abdfa68e2bcc9
	.xword	0xa4ddfc9d82f4e5e9
	.xword	0x951b19ceaf388fc0
	.xword	0x8ad4e74775cd1519
	.xword	0xf9ca01d9efa32bf5
	.xword	0x38dd738133f86ff9
	.xword	0x7f8ee480cb5f25c6
	.xword	0x320c157580d9bc34
	.xword	0x7a96024f0509bf83
	.xword	0xc9b3bf67a3b69efd
	.xword	0xedfdfc6c9df1eefd
	.xword	0x0b224dacef7b3be9
	.xword	0xa3558009a08c9dd6
	.xword	0x7b9ec13af9ee97e3
	.xword	0xf216b4d10e3940b4
	.xword	0x43a78be6e052df8c
	.xword	0xdb7f7acf7b52b1ec
	.xword	0xa32128216bd09d25
	.xword	0x1603645077188caf
	.xword	0xb7f6d6fa1ba44371
	.xword	0xefb34286de11ed80
	.xword	0x28f0f80e24b491f5
	.xword	0xe68da520aa7da1f5
	.xword	0x1eeb824170155ed5
	.xword	0xb0af9b2d02b588fc
	.xword	0x29d7a460df065d96
	.xword	0xa6601565ceca8aab
	.align 0x2000
	.data
data_start_1:

	.xword	0x888030f38e474984
	.xword	0x6d4c9e283a53ea8d
	.xword	0x848f1e65d3ba3749
	.xword	0x839747ffeca4c3c2
	.xword	0x2e851c06407a5e44
	.xword	0x23d73ab14b66064b
	.xword	0xc0da7e356de53cff
	.xword	0x57dd75213b8ad8c2
	.xword	0xc7a43cac497ccf2e
	.xword	0x8e5d5022e9d21b23
	.xword	0x0bbc186630e893b5
	.xword	0x7b7dfcae73543a03
	.xword	0xa2c4f91fa52f0d0b
	.xword	0xf0b9c071bde7441a
	.xword	0xc6c9eced60ca936b
	.xword	0x703bafa33030b1b7
	.xword	0xd3505bf830660133
	.xword	0x25f6be90de558a3c
	.xword	0x15774e7e7d446d07
	.xword	0x14699d90120156cd
	.xword	0x6c35d37b97d785db
	.xword	0x64833b8506968900
	.xword	0xab987e700bdbf39c
	.xword	0x15a4bb38653b58ba
	.xword	0x38b37ba0e1079835
	.xword	0xc8f725aea6030242
	.xword	0xd75a3120e69bd3da
	.xword	0x05d9de86608903c1
	.xword	0x9a5e1185e788b71c
	.xword	0xce71253016caa4f6
	.xword	0xf864dc80eddd4f82
	.xword	0xadf8a2d5a25080f3
	.xword	0x2711de9daf1f618a
	.xword	0x5f9b7c6fba62eac2
	.xword	0x6c8561ad0a80a960
	.xword	0x8c51a56a49e1a247
	.xword	0x8edc6c1c736e4e00
	.xword	0x63594d2d23c5f040
	.xword	0x1196246963715880
	.xword	0x299617fc50505df3
	.xword	0x9aa05b895d9aaa51
	.xword	0x3746fecc8d77aab9
	.xword	0xf8a8dcf237a02082
	.xword	0xe96b80fffd206536
	.xword	0x710fc411764eac3d
	.xword	0xd6839d0e13d25742
	.xword	0xcbfb96c95bd641e5
	.xword	0x3760d439ec72e0a0
	.xword	0x81548699184dc510
	.xword	0xddc3754b05e16dbe
	.xword	0xccf3366b02dd611a
	.xword	0xf9889b9c2841b8bc
	.xword	0x50a862ddb5477117
	.xword	0x277dc45914141598
	.xword	0xeac4352a4a6c93f8
	.xword	0x53aef24023857e3f
	.xword	0x529c98274014c68b
	.xword	0x767c65bc39177030
	.xword	0xf01d78ec3f15ac6f
	.xword	0xb3bcb27bf2913ba1
	.xword	0x8ce85670023d04da
	.xword	0x470e901f03ff70e7
	.xword	0xd3192cb41bf729a1
	.xword	0x9f38b69719f3793c
	.xword	0xf7f2c590ce322cbd
	.xword	0x128553d169c84afa
	.xword	0x57ffe7ffa39cd792
	.xword	0x2c512da43cd243e5
	.xword	0x4a6f45e744361bc8
	.xword	0x46f71822759a863a
	.xword	0x4343d6e40a208c4f
	.xword	0xa719043996e4c742
	.xword	0x6b609129e687f27e
	.xword	0x8be1abcf2c961f8d
	.xword	0xe1fdd4aa672dddaf
	.xword	0xe4a81e7a8bd64477
	.xword	0x41361fc2ba5f6717
	.xword	0x019a7aaa34bb1707
	.xword	0x253ed102df3e838c
	.xword	0x6e1516f5fde36d20
	.xword	0xb0c1128fe1e405ab
	.xword	0x74c87b36706791a1
	.xword	0x87a9b8b29118f8b1
	.xword	0x50bfab07db8bf2f7
	.xword	0x1eb1ca10052b7165
	.xword	0x32f071e460129311
	.xword	0x2794ee911494d24c
	.xword	0xa6619f3f6d1a54de
	.xword	0x78a7a47517ccfdad
	.xword	0x3dd4c54ec555e314
	.xword	0x85b61ad1fa31a959
	.xword	0xd485ce8fc390c561
	.xword	0xa303aebc6213a50b
	.xword	0xdd465f5e4f706270
	.xword	0xaed425f2a8602662
	.xword	0xdca009dd807c452a
	.xword	0x1e034769f2859ba7
	.xword	0x568fa2082d8516fa
	.xword	0x2154ba56f67e9453
	.xword	0xe97709c88a879159
	.xword	0x9b9da15e2919c744
	.xword	0x1e72f4b8d0f460e3
	.xword	0x946e035134058956
	.xword	0xd973fa005fb71de8
	.xword	0x21a3918203d62452
	.xword	0xc8cba4d181f3b4a7
	.xword	0xdb8db2a9875144cf
	.xword	0x47d7d1bbd181bfad
	.xword	0xe496cb3afd02b0b0
	.xword	0x02f3d4f6d11692be
	.xword	0xaea9ec8e97c71047
	.xword	0x2673df73c5a14179
	.xword	0xdc45e41c60abe804
	.xword	0xc12c7c9de3e05769
	.xword	0xe8b3e3e028e24016
	.xword	0x82541271ebe1b58c
	.xword	0xd26a031d1d045076
	.xword	0xa32ff7a448e285de
	.xword	0xc9e30d0f6a4c705f
	.xword	0x2b30d898e2ec3884
	.xword	0x9112f437b208aead
	.xword	0xa681a4a98985ff31
	.xword	0xde80c7b4633e4b8b
	.xword	0x0fe3cb8b3bd19781
	.xword	0xf79141b1659e8d3e
	.xword	0x0aa07a3e7b0d28b8
	.xword	0x25103ac110a933c3
	.xword	0x924279c2b5fae32b
	.xword	0x9d664b8d6be68eb8
	.xword	0x2f7940ed04f98d3e
	.xword	0x6ed4b86653f90e70
	.xword	0xedf5f26e382c3bcb
	.xword	0xa8bce6cfc728f822
	.xword	0xa0b56a6ced17618d
	.xword	0xe8cd21abd20b2789
	.xword	0xe45fd36d4a75ed5e
	.xword	0xa75adaff769c3b1a
	.xword	0xe7a9539fc740c0ef
	.xword	0x91bb40c4eb1caade
	.xword	0x0b1ea4f3306173a3
	.xword	0x698fc9a1d7134913
	.xword	0x4e7dfbf33744b7a4
	.xword	0x1847322159981f65
	.xword	0xedd3edd861b2afc7
	.xword	0x19f094d8599e80c9
	.xword	0xdc5d954c7d5309b7
	.xword	0x244058f5e83fb85c
	.xword	0xc404f48f214a9bc5
	.xword	0x162057545d3ac965
	.xword	0xce2a5f4e7af3d01e
	.xword	0xba20e8217a0501c5
	.xword	0xd9affdcb777e8110
	.xword	0x8add9c496fd4d85b
	.xword	0x6aab54994e305aa2
	.xword	0xcf1bd92e909e59d6
	.xword	0xd85d0ba6f3b46e58
	.xword	0xb86c112cb8fb936b
	.xword	0xd3a6b86977b8f175
	.xword	0x0337b8bf3dc4d3eb
	.xword	0x32f0b421e46ff47b
	.xword	0x460e3c311287780a
	.xword	0x32a14ef04922ef67
	.xword	0x38324e03720f90e9
	.xword	0xe710a8ce3d07b039
	.xword	0x79ba07768896da5c
	.xword	0xf97022a4f9ed351c
	.xword	0x68ec7db9c80fbf06
	.xword	0x523dd9accd300c4e
	.xword	0xd1cb8ccb9a238aea
	.xword	0xc4928c10b0b98459
	.xword	0x38e62f9697bbf2ab
	.xword	0x42490c0e728339b0
	.xword	0xb1f5d6815b19d56f
	.xword	0x1dc9c434714050c0
	.xword	0x8519bdef56959efb
	.xword	0xaeb37de374149594
	.xword	0x7654fc745c2f3796
	.xword	0x5665454b4fdadd5e
	.xword	0x5c1b8adad817fada
	.xword	0xf93c07d54bb48a1b
	.xword	0x57477f3e21defecc
	.xword	0x2395c26af6c0f0d8
	.xword	0x48c4f4d406f82e8c
	.xword	0xacb1abf283016815
	.xword	0x3e1d9207ab09c9b0
	.xword	0x4befe69a1d1e040f
	.xword	0xa711013a8e673f42
	.xword	0x65d34f84503710bf
	.xword	0xee5ce847cf13d8a6
	.xword	0x70d5364f34b8fc22
	.xword	0xa4f7f7f54374d7d3
	.xword	0x19e928abdc1b1381
	.xword	0x71ab5b4182f2ec7e
	.xword	0x3547714686773e68
	.xword	0xe869149d47f0cde4
	.xword	0x3b599db49677c2c6
	.xword	0x391dbabcd548d7da
	.xword	0xefe94d0b07d877c4
	.xword	0x39dfb2dc04ad358a
	.xword	0xc4ade46f0d43079f
	.xword	0x8e07b7549f788ef9
	.xword	0xa19352add73b1ecc
	.xword	0xd65c6b6c45f7f136
	.xword	0x2fb9b3a42cdffeb8
	.xword	0x59c8f60b227a0a55
	.xword	0x06ffceac9c290694
	.xword	0xcae3089a564552d3
	.xword	0x9de8a9b69aa74344
	.xword	0x55faf618099262df
	.xword	0x89b9cf00898a708e
	.xword	0xd2893021d13f5f19
	.xword	0x1ad2b51bdb17bec9
	.xword	0x81564c0c54844b52
	.xword	0xa071cca384afcc6c
	.xword	0xaf379a71366b4f11
	.xword	0x171f20626d353912
	.xword	0x99282486f5d58ad3
	.xword	0xf948045fda00fcc0
	.xword	0x07b57bb610b7aa86
	.xword	0x3ecff4e37fd47cc5
	.xword	0x10b0a4c05d2db642
	.xword	0xc26a1e9f94b6ffd6
	.xword	0xae4c73611d38f9bd
	.xword	0x69415ec075d89ae4
	.xword	0x6e4f56945cc563c4
	.xword	0xad4ca14d31b98ec8
	.xword	0xf051a4c684ac3dcc
	.xword	0x82909f11fe9d6215
	.xword	0xb9585225f5450228
	.xword	0x0efe467d54d0c179
	.xword	0xbf60c5578e04ca27
	.xword	0x86ac8d6617622569
	.xword	0xe4599ba3f649a8e0
	.xword	0x34240eb415a2b56b
	.xword	0x4dc5d1734e96eb18
	.xword	0xb41ba47d4f809549
	.xword	0x6a89ce4535d964bd
	.xword	0x2e537b82dbff2522
	.xword	0xcdd0b7d00983a7ea
	.xword	0xcfd3752bf4b95cb8
	.xword	0x17eaa0be7441601d
	.xword	0xfddde540a038594f
	.xword	0x3e799e7cf43f635f
	.xword	0xde1f5651ad53a94a
	.xword	0x5d24b2d70ba82a45
	.xword	0x4873aff7591907dc
	.xword	0x436b44f73d93247f
	.xword	0x09ab2e54fff4a068
	.xword	0xe4156a3e94973658
	.xword	0x8d1107be3c67f24a
	.xword	0xb26c704524ff425f
	.xword	0x68d5a35c6eae0c82
	.xword	0x4df162aeecf0bbcb
	.xword	0x839f73564107f8ed
	.xword	0xd311a56a87542100
	.xword	0x3f73714202ef34f0
	.align 0x4000
	.data
data_start_2:

	.xword	0xc332a4b96edb7558
	.xword	0x1c4f51a462a7c3f8
	.xword	0x3b2b84ca103b9a71
	.xword	0xc8c07893f4fa7ff6
	.xword	0x2c71fc99fb0b1e55
	.xword	0x57c57c7a13031f9a
	.xword	0xc0935db866900781
	.xword	0xaba12cad528f8e3b
	.xword	0x60484aeb3a352a42
	.xword	0x3e7633446dd2bf4e
	.xword	0xe09a1da38122c4c7
	.xword	0x569a5283e2bdd7a5
	.xword	0x453be7283056b800
	.xword	0x53dfb5a471433308
	.xword	0xe695af4da3afc715
	.xword	0x48213401ab4d9e28
	.xword	0xe206469dea966c71
	.xword	0x9dbfa448f8989ea0
	.xword	0x7978de0b9c81feb4
	.xword	0xe12a0e569e6e0dd9
	.xword	0xe85384cd0f3e9eb8
	.xword	0x18354f37c79f5ae7
	.xword	0x605beeda67ad211c
	.xword	0x71a883e77d65b4c4
	.xword	0x5e2e46e726cdc5da
	.xword	0x2afb6b9ff6c20f27
	.xword	0x9bbc75755dfb5ef4
	.xword	0x759d1d331e75351e
	.xword	0x7fd2a105811d7e6c
	.xword	0x7395fa627e9dfae2
	.xword	0x81d04f24eedd6cd2
	.xword	0x612172da430517f3
	.xword	0x05764d3cd00e3807
	.xword	0x13c1cff1e6a43201
	.xword	0x0de6a2f1f2d2ee3f
	.xword	0x2132b70fc8332466
	.xword	0x15127da1138b1e50
	.xword	0x92947d647166498d
	.xword	0x4777eef464585592
	.xword	0x8076768974bb7611
	.xword	0x8455ef74bd335b8f
	.xword	0x6463d152ce23fff4
	.xword	0x8ee67108b3e615fd
	.xword	0xb4cf763b5cbdd367
	.xword	0xf4e52e950dd6f2b0
	.xword	0xc01290bce9acd290
	.xword	0xdc643ac09d233ac3
	.xword	0x33ad5707e5924cb4
	.xword	0xc6449d85dad1c2e5
	.xword	0xd22300c8f0dd0c7e
	.xword	0xdebb4a60d3783036
	.xword	0x632e6ec9ffe0bea8
	.xword	0x319efd6e5ef2e65c
	.xword	0xd97c2d4525318a1f
	.xword	0x2f71aa283179215c
	.xword	0xc42c022e135883b9
	.xword	0xd78e15e2a8eb29fa
	.xword	0x20b700c071f625fc
	.xword	0xa764d08431cf0663
	.xword	0x68ff1e964714ef21
	.xword	0x9a92c6bf75c9e757
	.xword	0xd546a50a9029ee39
	.xword	0xeff5759c1aa3557b
	.xword	0x5fb4716e880db735
	.xword	0x110f0e4f4e6c03d3
	.xword	0xc56c024cc149ff63
	.xword	0xa78fbdc7d9718bab
	.xword	0x8f83e0cbb563df3b
	.xword	0x4e4115133e27bef8
	.xword	0x6f5e921134d64a38
	.xword	0x184152d99d5a05f3
	.xword	0x5cb870b3ea0a8e99
	.xword	0x6e98807af24224ff
	.xword	0x622b743c4980fc91
	.xword	0xf55be2a2fb165972
	.xword	0x5ffdec902ae748fe
	.xword	0x8983ac0d78475234
	.xword	0x0fe1821410d866bc
	.xword	0x685aaafcd4d12ede
	.xword	0x8c0bcb8772898d48
	.xword	0x4ebef09311016be6
	.xword	0xb8fe7fc7822c3f5c
	.xword	0x50ce352dca16539d
	.xword	0xb07f85950d6b4d7e
	.xword	0x0ec6de7ef1bc5068
	.xword	0xdbf1d0b0bb56d678
	.xword	0x1ef04966b115515c
	.xword	0x1c1725ca636fffef
	.xword	0x8e5a37ae9d066579
	.xword	0xcc66c897c114d373
	.xword	0xf96469c0e655813a
	.xword	0x29a5f86db888d6af
	.xword	0x42988345bd117c6f
	.xword	0x4ed2097aa074dac4
	.xword	0x8746fb7ef1476bc3
	.xword	0x7b41eb46eb91032c
	.xword	0x5853b002203f8fdb
	.xword	0x5e14807aeb714fdf
	.xword	0x66baea68abc40829
	.xword	0x35b473881b1d4104
	.xword	0x2dad1beb7175eb86
	.xword	0x0315544836d82c48
	.xword	0xdcec846bd169397f
	.xword	0x029b4ef71ad7914d
	.xword	0x2095cb43506355ca
	.xword	0xdb4404fc1c5781cd
	.xword	0x3a975a545e6985e9
	.xword	0x40602c36f9dc00c4
	.xword	0x8f631c1fe02b6c33
	.xword	0xa92d9791c5f468bb
	.xword	0x529c94ad129005ad
	.xword	0x7969cc253db0ce91
	.xword	0x4554dd881454cc1e
	.xword	0x2b0f2405c3b104b1
	.xword	0x795a4cf3e025ff0f
	.xword	0x493644359606b62d
	.xword	0x8d8019fd27245ad1
	.xword	0xed850238464462d8
	.xword	0xf8bcd172d905acaf
	.xword	0xa90eea191bdd6edf
	.xword	0xf671ab3937f15b96
	.xword	0x73d24a43691c4d94
	.xword	0x6e15873581ff2d3d
	.xword	0x60c533910c4ac3ad
	.xword	0x431e7e97d18998a6
	.xword	0xc668685b44efadc5
	.xword	0xa4941c64ec8595ba
	.xword	0x22b1795d1d1b3ef0
	.xword	0xfc81e4dde9d6a95c
	.xword	0x4cf6a2baaf34af1a
	.xword	0x9ad3da8cefdd44ec
	.xword	0x64b4bd93a9dea8b6
	.xword	0xa544d20f85d866d0
	.xword	0x1076a65501b35d4d
	.xword	0x246c3cf8ee788e53
	.xword	0xa4b0c9e822e58688
	.xword	0xb2464b6cdb841fcf
	.xword	0x2184f1eadb22ccfb
	.xword	0x8e0e04f1d474b8a6
	.xword	0xb3702d42591324ac
	.xword	0x827a63ed1f468039
	.xword	0xc5c1bcbf5dcdbd08
	.xword	0xe7bf34ed453c2f54
	.xword	0x93a2c75a146737d3
	.xword	0x8e4380d41de28962
	.xword	0x32761d649a0e45a5
	.xword	0x0097d55c058b59f6
	.xword	0x51f887932d657b12
	.xword	0xd5c40cf0e3c320af
	.xword	0x9286ab51e78040bb
	.xword	0xba80fc7b72cb9833
	.xword	0x2f0722b838f52a02
	.xword	0x856c4b168072ab5a
	.xword	0xf85fed00803cd719
	.xword	0xd5232893f1bb72d6
	.xword	0xba07845799ed760b
	.xword	0x0965dcfdf6c1da7d
	.xword	0x4f24c61eaa3acdf7
	.xword	0x068e05357bd30b42
	.xword	0x8387d2a3a8037a54
	.xword	0xfd02865020a26c3a
	.xword	0x6e512239237ab235
	.xword	0x3e9fd457bccfa65c
	.xword	0x807e67a23ed1c069
	.xword	0x3755dcf71f5e5127
	.xword	0x7ad8a1a53d1dfc4c
	.xword	0x1a2dfa3b95b79849
	.xword	0x3506470e1e10e83f
	.xword	0x342ec94cdd40d33a
	.xword	0xc61b7544bfe23eaa
	.xword	0x409a502999dbb2a0
	.xword	0x74c687e92fb72a56
	.xword	0x0049738fe465d42a
	.xword	0x85ab829994d2fb54
	.xword	0x5daa007c7f21e300
	.xword	0x0ea05daba6a6e14f
	.xword	0x27857ef17ae73f00
	.xword	0xcba12575016d757b
	.xword	0x68deb6f5308620c4
	.xword	0xf7108880c17c3459
	.xword	0xdd7d396582201781
	.xword	0x483b586e7fae48d5
	.xword	0xa0428a25b9a0cdd5
	.xword	0xf10d14c904e6b78a
	.xword	0x5b0f8a13bdd9043b
	.xword	0x6393ced53c82dd2f
	.xword	0xcbf8aae676546426
	.xword	0xe5c99bf9788d8203
	.xword	0x174718ca6cc099c9
	.xword	0xe7efe8a2add11978
	.xword	0xc482af1d956b3ddc
	.xword	0xb67af1171269520d
	.xword	0x926aa8a7da5242de
	.xword	0x2f7df7a552295e1d
	.xword	0x164dcb304fd4b905
	.xword	0xcdecec38a27f33ff
	.xword	0xddffedf266f082f2
	.xword	0x24c7c1fa3634edbb
	.xword	0xa491f6698552a447
	.xword	0xedfb4eaf3e96ed29
	.xword	0x85a8f7c4fb4fd4b5
	.xword	0xb7c7ee2884f20110
	.xword	0xdd25bd947b5201a3
	.xword	0xac928f3c274cb897
	.xword	0x063830faf3032dae
	.xword	0x00f3d6cb35c7e8ce
	.xword	0xba9213e097a88144
	.xword	0x789bcd9f6fdad0e5
	.xword	0xacfe23857a2c120c
	.xword	0x48d4a787780ab959
	.xword	0xd18b8daf42f67dc2
	.xword	0x38a13c35598d5d2d
	.xword	0xe4aa34c900bc8f3b
	.xword	0x6f30253246038ac9
	.xword	0xbe4c51d946ad2b73
	.xword	0xdbc77abea63e3978
	.xword	0xbd6ef55bf905f0fc
	.xword	0x3d1d05135c9f70b1
	.xword	0xdd55caca5b5af9c2
	.xword	0x0baf191c36851138
	.xword	0xeb1a46efdfc21b4e
	.xword	0xae6a1a69b89a9903
	.xword	0xbcd7a8cc55ed029a
	.xword	0x777093ed5bbd464a
	.xword	0xeef617e053899582
	.xword	0xbf7ff12c2e459cd7
	.xword	0x30da2890a1f3c9d6
	.xword	0x8c1054ce8d92b315
	.xword	0x7d3ecb91262ca6bd
	.xword	0x7bc937e5118ced11
	.xword	0x032eed75ca1506ee
	.xword	0xa5e0342e35d5cd32
	.xword	0xb9384458e0214ba8
	.xword	0x0605fa21c79e7893
	.xword	0x1a4cd537f508a599
	.xword	0x7a8e190026384cad
	.xword	0x460fc68905f6ba01
	.xword	0xdc27955ba22ad47a
	.xword	0x2b805f1265f729e4
	.xword	0xf0ae8d0b1bfa6e5b
	.xword	0xb9c71c3a8c0b735b
	.xword	0x5b51d267fb089ab9
	.xword	0x6c13e57f1fdbf385
	.xword	0x603b59a01d77e544
	.xword	0xe224372125244c17
	.xword	0x75ddd61df8b50371
	.xword	0x17f2799c4ca296e1
	.xword	0x6142e609e32b4dcd
	.xword	0xcfbfee935c46212c
	.xword	0x7b8fd4fab076a412
	.xword	0xbdb7e55642331686
	.xword	0x69810a84e7dbc8fa
	.xword	0x091f81c616ab0f35
	.xword	0x759c8d5f9ddddcb5
	.xword	0x844cbb0c9cc1206f
	.xword	0xa804c1c595fc2ad1
	.align 0x8000
	.data
data_start_3:

	.xword	0x7ad5b358852a3bcd
	.xword	0x9c7f3932ffad1df9
	.xword	0x6a5cbccc84649e9e
	.xword	0x4671855b9eb12eff
	.xword	0xd9b4554c643f3f73
	.xword	0x69ac7aa7efa6e410
	.xword	0x2064be8c1a59a8b2
	.xword	0xc0db4b605dca2670
	.xword	0x46925f98f6fed89f
	.xword	0x5bb9018ed511306e
	.xword	0xf2bac4faa1c48341
	.xword	0x52c224586f2b70a2
	.xword	0x58aaef648e59de30
	.xword	0x34061ae51e13cc59
	.xword	0xaca6c1216b2b804f
	.xword	0x4cf7c4ca055b4f14
	.xword	0x7010d9249e345ee7
	.xword	0x40431d59131ec2a1
	.xword	0x52471429f537e631
	.xword	0x8cf34850cdd22037
	.xword	0xf7b3ff4d76df655a
	.xword	0x515008f2e090f385
	.xword	0x5908299ec8244f11
	.xword	0x5ef55fdcb5cc42ae
	.xword	0x81b3816a416cb3ec
	.xword	0x7ae73f9610869f74
	.xword	0xa39037ecdbc41fb1
	.xword	0xde52790a99580fa7
	.xword	0xfaa7ff081ba53fb2
	.xword	0x4c9a403bc503c67b
	.xword	0x1f261f0b35f8bbb2
	.xword	0x6176ad3f26d9234c
	.xword	0xdb343678339b17e9
	.xword	0x6b13bbef6e235a7f
	.xword	0x642288d7fa8cc848
	.xword	0xf62d11d39a05e365
	.xword	0xf82fd5fbcbdd2e45
	.xword	0x6b2d9d02f96ca9bd
	.xword	0x263f67c12c54669d
	.xword	0x1cb277d70f87d3ad
	.xword	0x0a96353bbacfa774
	.xword	0x483ad85f285e3104
	.xword	0x93507b501c3e293c
	.xword	0x55e77dd6f8c3dff9
	.xword	0xae430ddaad93f76e
	.xword	0xdb8b84e330bf2934
	.xword	0xf64045c4bb02a412
	.xword	0xe95e74f4d203e4fc
	.xword	0x7454ca6b14e67ae0
	.xword	0xa0e31bbc1ab6d260
	.xword	0xf02334f33eb58bc1
	.xword	0x60cfc32d880ca54c
	.xword	0x545ad1c62549b71e
	.xword	0x76fa31df27272490
	.xword	0xac87040467165458
	.xword	0x953375ff3420603f
	.xword	0xa50365d7abc93b4d
	.xword	0xd8fc83a88c6a9ff6
	.xword	0x471e6fea61e9c08f
	.xword	0x6c0040a922eb9c4a
	.xword	0x6b9553cc96e9393a
	.xword	0x627b63e73fb931f9
	.xword	0x5c1dd06c3a0477ac
	.xword	0xc542492745338689
	.xword	0xe862fd0527d29289
	.xword	0x7fb8ed1f22f97607
	.xword	0x48192b6497669b7c
	.xword	0xfaa86086a8475019
	.xword	0x0b06a16531467d75
	.xword	0x5069d86d5fe45ecb
	.xword	0x44eadf8ff22da69a
	.xword	0xc36943ecd9aa40f2
	.xword	0x197b395f4dfeec36
	.xword	0x83f449fa51fbc3e1
	.xword	0x85c8c0f308142385
	.xword	0x0edfe4b3ea0b5cbb
	.xword	0x4d3eb77724fcd539
	.xword	0x35bd1707ad8560bd
	.xword	0x247f8aed18da73f1
	.xword	0x31aea357aa8fc1a6
	.xword	0x4f114f9c657d4905
	.xword	0x34087f4834755f6e
	.xword	0x76b55da16e6e1044
	.xword	0x17b72f2a82a483e6
	.xword	0x7a2c9b31132afd85
	.xword	0x647c27656fb4eb68
	.xword	0x57b1be6e058b18d0
	.xword	0x7067730deed31709
	.xword	0x2e6071426a1a7903
	.xword	0x8ea7e3940bf820ae
	.xword	0xc1aec57740421c24
	.xword	0x706764c049984fff
	.xword	0xf2e33ff9ce3f6245
	.xword	0x23b53a0a65d3f123
	.xword	0xf47c938ae2a7dcf4
	.xword	0x5e2b06d36071b519
	.xword	0x9915f99d7048a436
	.xword	0x2bcd5257c1357846
	.xword	0x71281adbb7cd6b1a
	.xword	0xe841da8132ee0ec4
	.xword	0x67b1342106f51e2c
	.xword	0xa1bbe04b32c385ba
	.xword	0x7ebc9ca8163e8471
	.xword	0x89fbd636a6200900
	.xword	0x8262d4b607f0ccfd
	.xword	0x814faa98fcc02587
	.xword	0x4604a8e0e20d8741
	.xword	0xc9e077441a7a7629
	.xword	0xd1a8bb015b36484c
	.xword	0x4d43aec49bf1df5a
	.xword	0x1efeec9217f5f435
	.xword	0x7eb2464feb442f52
	.xword	0xb24e7eea43fd42b5
	.xword	0x41c52a689e086654
	.xword	0x92e8f447e369be13
	.xword	0x8e83c438a826b986
	.xword	0x281d69cc633d5ffa
	.xword	0x0be9e0d6334468a7
	.xword	0x98411c0c1e8e9c74
	.xword	0x3cc7a0c95809366b
	.xword	0x3c6abaf59e4408dc
	.xword	0xbdcd56f37c082772
	.xword	0xd5cc286328042a73
	.xword	0x36fc20c7703f078c
	.xword	0x6c18cd8aa4d18d6d
	.xword	0x44dc845054504d2f
	.xword	0x7642d913f21c32e0
	.xword	0x6d706134bbfaf720
	.xword	0x52626bc31b3d9ad9
	.xword	0x412a13e18fc1d239
	.xword	0xdd55c179a3e55da1
	.xword	0xc28d915b1a1122e7
	.xword	0xaa3281296330696e
	.xword	0xb80b9e184c616b64
	.xword	0x5651c955cd1ee394
	.xword	0x1c1c206ad1234d39
	.xword	0x042106fef0c87e0a
	.xword	0x39ec119fb7bbfbbe
	.xword	0x36f35bda6667e1e8
	.xword	0xb0c95fd617e257f8
	.xword	0x1ac39492e36c2c00
	.xword	0x34389593ded204ff
	.xword	0x3838a85f6b77e789
	.xword	0x0b5ed4ff12289257
	.xword	0xe63b63d7e6b08125
	.xword	0x9aa90c7ec8178f90
	.xword	0x26ea65a90800f1ea
	.xword	0x43b4ad4968737b4e
	.xword	0x36be6daff74385d6
	.xword	0x3e68741af86735bc
	.xword	0x637378c44bd594a1
	.xword	0x9f5bd43ae59479d3
	.xword	0xeb6c805ae79f6c12
	.xword	0x30e49f5de822f80b
	.xword	0xf1a793b9cc056bf9
	.xword	0xb2a8db645d27555b
	.xword	0xd5801276a941fce2
	.xword	0x7e0119bc4898b55e
	.xword	0xce77757ec7109da7
	.xword	0x910d7508f5628206
	.xword	0x5ade0735c7a932d2
	.xword	0xc28663a2342979f5
	.xword	0xe1d982a0b108e7c7
	.xword	0x707844a204365e42
	.xword	0x8ce24f7c3486fc2a
	.xword	0x4c85383cf2101fac
	.xword	0xcdc3963dd97dadb3
	.xword	0xb81c61640e62e6ee
	.xword	0xb8deb0917c488d10
	.xword	0x703651f5c95e61cc
	.xword	0xd26e3f59aba7ac99
	.xword	0x4e446faa3af789cd
	.xword	0x45cdd509ad6f03fc
	.xword	0x1086f4b87bec3c0d
	.xword	0xdbe87ad26223bf20
	.xword	0xbcabe1be807a1c20
	.xword	0x41544b39b5128497
	.xword	0x79c0417326389d24
	.xword	0xe22af73ba0f2953e
	.xword	0xa2fb6b00ea67b6f5
	.xword	0x8cc2417a3f751039
	.xword	0x6f222cd084fb110b
	.xword	0x8582fd040c0b7e2d
	.xword	0xc90f3d01a8dbd72f
	.xword	0x10fac4c6043e318d
	.xword	0x1d13d0fd89195b88
	.xword	0x7b13868b74372d2b
	.xword	0x59e96c77c9a979b7
	.xword	0x8300c3f75b0dea00
	.xword	0xbb9de2bbbc0c0f04
	.xword	0xe017e04c5c5c8c75
	.xword	0x803fdbb967e7c9a6
	.xword	0xef33956cfad0588c
	.xword	0xdd49a7a94e5a4918
	.xword	0xa4811ddbba6dbec9
	.xword	0x1e97ff3700daca24
	.xword	0x3860b5c9ad957584
	.xword	0x3e2c3f270c6f9ff5
	.xword	0xf578c2aede45900d
	.xword	0x19cd6cfce9d59aa5
	.xword	0xabf28d3e66febf95
	.xword	0x6f16b8584bd46a33
	.xword	0x8033526660db7d90
	.xword	0x537390f25df718b8
	.xword	0x5dd9038b571c3066
	.xword	0x61f2dfd7b4bd4db5
	.xword	0xbabf9353d19a627d
	.xword	0x4d6a838b154a05c5
	.xword	0xaf7286ebc2354bfb
	.xword	0xeb47555e01ff09d9
	.xword	0xd8d7d8e7519926ed
	.xword	0x6922b4b117bf40eb
	.xword	0xee51bd63971da433
	.xword	0x6efb22c2c9a8a05b
	.xword	0x5fd6bc629b1088af
	.xword	0x1713a48f840a2bd5
	.xword	0x2088bd04d5e6570d
	.xword	0xc500a9ab6bc9bc72
	.xword	0xfecc6e14f4d2b575
	.xword	0xaefb0bbf96c43579
	.xword	0x5366040c1bf2656b
	.xword	0x9b3db999575f5c4e
	.xword	0x908b00b192e07ed1
	.xword	0x1f53ae59687fde4d
	.xword	0x9073c096324b14e9
	.xword	0x172ea31eaefdbcac
	.xword	0x60bdaa6d6e668dda
	.xword	0x8a5b8561c17c42e6
	.xword	0x0320e4f86e4ed1e0
	.xword	0x0420f2b750d9350c
	.xword	0xd52c277bd86691bf
	.xword	0x899a7e80f193c3ab
	.xword	0x959993655b7f528e
	.xword	0x52479d5c39c9ec33
	.xword	0x278642bb91cf99e4
	.xword	0xe7c6b48e272930c9
	.xword	0x98c1b957dde3a5eb
	.xword	0xc53683370da53601
	.xword	0xc20a49b104a73066
	.xword	0x984f7eed94987525
	.xword	0x18653e41f351dcb9
	.xword	0x639de6770139bd27
	.xword	0x225c24a809f09ae0
	.xword	0x97e78a09fcd414f2
	.xword	0xb6d764c1ad3cf684
	.xword	0x6cc355204ef31c3d
	.xword	0xe1aea3897e48cd28
	.xword	0x21bd669a82f47cf6
	.xword	0xf86a323e13511cc8
	.xword	0xb3bb188d0b8a4db1
	.xword	0x5aff1933f33fe84b
	.xword	0xc532d738a38cec34
	.xword	0xc257225cd4ce1e92
	.xword	0x3b53f1792d9b8855
	.xword	0xc077194f4062b953
	.xword	0x21bcbd0690042e60
	.align 0x10000
	.data
data_start_4:

	.xword	0xd414376ee15dd23b
	.xword	0x433603c190134dcb
	.xword	0x041267c2c896e3ba
	.xword	0xcd1bb6c3d3a1d6e5
	.xword	0xb29396e8a584b583
	.xword	0xa868fef1eec77bdd
	.xword	0x2013b53aa532ff8c
	.xword	0xb034d2aafc0a57b8
	.xword	0xe76587d55149ff6f
	.xword	0x223ac1056e97ec9d
	.xword	0x39d87e84f46475c2
	.xword	0x0357983faab592bc
	.xword	0xd8979d396acdad90
	.xword	0x39b76fc540a02ecb
	.xword	0x685bd41055b2d18e
	.xword	0xac58281f7efe04db
	.xword	0x3bf2dd78009e41ae
	.xword	0xc03430a9269f2f01
	.xword	0x4a76e9ad7fc7619c
	.xword	0xe9a4c331b0d4fff7
	.xword	0x2f5e09fbbd1177ab
	.xword	0x6905f4fed7ea4585
	.xword	0x04f5b5a66bfaf2ef
	.xword	0x12139bd3ddadbf0c
	.xword	0x8848b807936530e8
	.xword	0x15d2a1de16b870e0
	.xword	0xf04586a21487fd92
	.xword	0x43e7fcd527594b8d
	.xword	0x2ffe0bb732233082
	.xword	0x16a89d9d7ed0f446
	.xword	0x45b7f60b78a819e4
	.xword	0xdf163699d2db3e58
	.xword	0x079eff574f7f8368
	.xword	0x2065edadc2038f02
	.xword	0x4cb574239c368756
	.xword	0x7148f1f0fec4091f
	.xword	0x4d00882b72fd40fc
	.xword	0x3e78dc4861ce70d0
	.xword	0xebed3ec49a801f5a
	.xword	0x0ccece47cfef4b0f
	.xword	0x7362ba995a1ac779
	.xword	0x9152c4247531a6ce
	.xword	0xc0e3a30544e6eb0a
	.xword	0x3d062f5721aba574
	.xword	0x068967279d8a172d
	.xword	0xab9cf245def7717b
	.xword	0x5383070e67d6c1cf
	.xword	0x53051c165bc5367d
	.xword	0xbe28e691ab532d3b
	.xword	0xc42cc63c19473d51
	.xword	0xab672a9549d26892
	.xword	0xb754e4707fbb6170
	.xword	0x84fe7e61e74347da
	.xword	0x40cb5148f259738b
	.xword	0x58a7ff265a46849c
	.xword	0x1bf03ca42ffded07
	.xword	0xadd322f5e5818c33
	.xword	0xcaaa00c88d665bce
	.xword	0x411f6aea6523ff61
	.xword	0x66073f460b66b77b
	.xword	0x1d0e30e27ed176d8
	.xword	0x1bf38e67725aa2db
	.xword	0x57e60690412b745d
	.xword	0xba25e3a64f58fd56
	.xword	0xa8b8fa489528a054
	.xword	0x57059d83ef95c67a
	.xword	0x7184ec9e0476fe65
	.xword	0x62f4c2ede965ab68
	.xword	0xf692a1d007221ab5
	.xword	0xa3e74d10d83fedae
	.xword	0x139fcbc95edc0126
	.xword	0xb04c7068c265f4b9
	.xword	0x14302a48074d3b69
	.xword	0xc611791ad302d8cd
	.xword	0xdcc0470560c8d1f1
	.xword	0xe41fb4edace52e68
	.xword	0x423b853003576e19
	.xword	0x39044e3b1e7c1329
	.xword	0x5ae74e84c1456bfc
	.xword	0xb60592145534d79e
	.xword	0xdd0466487a2352f2
	.xword	0xf877ce9b11162430
	.xword	0xb755cf3726373039
	.xword	0x8f60aa5a8dab35e5
	.xword	0x870b471ce247acbe
	.xword	0x228092f517ae38b3
	.xword	0x5bb78085c9272d5d
	.xword	0x39d547e540abdb67
	.xword	0x5a47de10ae208098
	.xword	0x05e1885c29b92085
	.xword	0x9306684563838669
	.xword	0xf2c9efb81a60bd63
	.xword	0x9f5d463a7782ee78
	.xword	0x9d60fd80e036ad2f
	.xword	0x5e678a9db3c05aaa
	.xword	0xe2c7c7cd35abbb5a
	.xword	0x092c9b9f4bbe15b5
	.xword	0xf839c715cda39395
	.xword	0x2f95387c6ecf5357
	.xword	0x70bec972a4ceb852
	.xword	0xcdad9283c056c524
	.xword	0x2cc781d37811c2d3
	.xword	0x268c84230a56172f
	.xword	0x7493e036c06da07a
	.xword	0x39309b5431516433
	.xword	0x5500aaef32cf063a
	.xword	0x1fa23e3ab0c882eb
	.xword	0x476a1ef115b92246
	.xword	0xbf43825e10b42110
	.xword	0x40788f794bbb3acf
	.xword	0xdc664f9525847a7b
	.xword	0x8423f102a7b370bb
	.xword	0x171ca3d3ad09d173
	.xword	0x4fdca9afdc57d587
	.xword	0xa643d4e51f6df1e1
	.xword	0x88a3b8c8e3aea51c
	.xword	0xa66d90356e41f3a7
	.xword	0x7e9d132da50d6878
	.xword	0x3ffc4273196189ab
	.xword	0xb9eb8984b9e3ff36
	.xword	0xe3fa721573daf7e8
	.xword	0xb2514ace0b95fc41
	.xword	0x9a5cabf4b54bf98a
	.xword	0xfdc1c1cf690d144a
	.xword	0x648aba27c200f5dd
	.xword	0x3f8af85b17782e66
	.xword	0x6b4d63e7b7642e63
	.xword	0x34d0ea3462e84e92
	.xword	0xb97f85a1359eb9d4
	.xword	0x824701fd437381e1
	.xword	0xba2f15f76fb2c4c2
	.xword	0x516558df1c471699
	.xword	0x132fd72660a62d2c
	.xword	0xfb90335b522f2e6c
	.xword	0x868239705b93ac08
	.xword	0xcd0cdb097472fe33
	.xword	0x9a00b0bb6504e3e7
	.xword	0xa27fdb9dd999bd46
	.xword	0xdfd67c8604a4a568
	.xword	0xe4a707092ae77a90
	.xword	0x412cf2ca612e0af0
	.xword	0xfdb3ca6f545854c3
	.xword	0x769a291c48f7c2d0
	.xword	0x3a4284e9e0beb711
	.xword	0x811afa16b340419d
	.xword	0x8e05cfabc6bc92b6
	.xword	0x16132215820f77bc
	.xword	0xafb5e907e6cc2614
	.xword	0xef054bc30fbcbd33
	.xword	0x75c90cbb84b075c7
	.xword	0x2122755dabd4ed51
	.xword	0x0568e4787c0b7a50
	.xword	0x0f2055ee2b088818
	.xword	0x2a9f509a721c39da
	.xword	0x75f9ab4f61f77fbd
	.xword	0xcbff9296e7e384ef
	.xword	0x5b130f68926377a9
	.xword	0x4dd56a4e24d739d0
	.xword	0xe41e7ad31da3ce90
	.xword	0xd15990654190bd97
	.xword	0x55afb04cc391c209
	.xword	0xeafca02d27073508
	.xword	0x2d926e5f0d990116
	.xword	0xc7c193fdd5bb3a30
	.xword	0x1d3bcd134f077290
	.xword	0xdb6e54cc22165192
	.xword	0xdde91d6a58a80312
	.xword	0x8ee0f0e20048d949
	.xword	0x47efb636b7a76c9f
	.xword	0x4352ec27c9526de8
	.xword	0x1493abdef4c91098
	.xword	0x8184d7b7b4f1fd78
	.xword	0xc78eef9f923e2870
	.xword	0xa711ebecd19680a2
	.xword	0x345d1bb4d57c4591
	.xword	0xad7076d66ad85b45
	.xword	0xf1b402c0b61f1abb
	.xword	0xe582115cc75156b1
	.xword	0xbda83f571cebe93f
	.xword	0x51aeab911a796628
	.xword	0xf2da2927ff6af2c6
	.xword	0x6bc47768570a325c
	.xword	0x4acf2c71d74490bb
	.xword	0x011bb6608e9835d7
	.xword	0x54a60c08e82279ca
	.xword	0xebbfdf900a61bf82
	.xword	0x939f0294d375dead
	.xword	0xa6d51cb5fee26e54
	.xword	0xdf9ac7ab531da778
	.xword	0x220b7d4010a09868
	.xword	0x9bcfdc9e6f764795
	.xword	0xeb4c51af24b6941d
	.xword	0x52b9752f7f5eef96
	.xword	0x0f179506e0c5bea8
	.xword	0x8b3be416b7358362
	.xword	0xf49931d9af560b54
	.xword	0xaa1079ec58717447
	.xword	0xf0f35faad72f15a6
	.xword	0x9c33f2cf4d005e25
	.xword	0x84c005983fd2f854
	.xword	0xd1ed7aadc7c4e897
	.xword	0x5661354ddceeab57
	.xword	0x4f439fa9983ad9cf
	.xword	0x7d3a4018849783d4
	.xword	0xcdfc2b02197b1e73
	.xword	0x7402b1c44a1e7e60
	.xword	0x80fa988b59b2aad0
	.xword	0x96c4d57eb5f31058
	.xword	0x73be27d4d613562a
	.xword	0x7e59ba2957d7a544
	.xword	0xa382ee41491f6f78
	.xword	0x73502b8b8242bc2a
	.xword	0x296da3da14289beb
	.xword	0x27734414e11c35fc
	.xword	0x33784829bfd1d262
	.xword	0x82de83b5c0ef26eb
	.xword	0x3fd575e820db6e1a
	.xword	0xb52723115a8fd917
	.xword	0x83f867653d919b24
	.xword	0x6ef56f2010d212bf
	.xword	0x9efc4daf59abbc2d
	.xword	0xaf5aaa5fcc26017c
	.xword	0xdd75526ab9d76297
	.xword	0x2968420d3fbc1866
	.xword	0xdb150e96cf26f390
	.xword	0xf31d52eb6398cbe3
	.xword	0x79d3154f5b0d57fe
	.xword	0x9535d3c8601ac8ca
	.xword	0xc347ae44efca86b6
	.xword	0xbaca45a1670858da
	.xword	0xec8df6b8cc509b62
	.xword	0x72a9bda838877c1c
	.xword	0xf99d1d0afe446a11
	.xword	0x73a391b1ff07bea3
	.xword	0xdc90f447677464bb
	.xword	0x0b8327784abab9e0
	.xword	0xaf7487d1b18ea651
	.xword	0x62d40967aca20ec0
	.xword	0xa17d3aa4d282949a
	.xword	0x9c9fee035e7a5741
	.xword	0x83dfe61f36a6a674
	.xword	0xd51cb7b89284d67f
	.xword	0xe0d3d45e8d1c12c9
	.xword	0x1686d1d9ec8974e7
	.xword	0x020bf228c66c63fc
	.xword	0x1a2dd90817176334
	.xword	0x9460971229a0b27a
	.xword	0x7373e7f17d186a13
	.xword	0xa37c5fb2d661d3f8
	.xword	0x358cee7710a721a2
	.xword	0x1d312ec08ee7ec9b
	.xword	0x22592b7b61119b3a
	.xword	0x3fde3b30e27ca993
	.xword	0xa030bcd7e64c040f
	.xword	0x644b4f12e4196d14
	.xword	0xc483c0b3860a260c
	.align 0x20000
	.data
data_start_5:

	.xword	0x0f3f54559963b007
	.xword	0xc9994f87c4d6366b
	.xword	0x9a1869488c1c22a8
	.xword	0xa58262dd407e2e83
	.xword	0x8c633dcdb0d1547d
	.xword	0xfa322351a749f8be
	.xword	0x8b4dae314dca38b5
	.xword	0x94df9d95d3131d2b
	.xword	0x63cfb0dfcfe08ec9
	.xword	0xf31a66aa29f9af95
	.xword	0xb2d07c30b39a3f07
	.xword	0x887687d707c67585
	.xword	0xd9d3ec324768a028
	.xword	0x6c8f6f8e8fc2fd1f
	.xword	0x0b9cc8edb8ef5b62
	.xword	0x3aa687a6bf2c9a85
	.xword	0x1e28ec6874d55c6e
	.xword	0x6b4b9208acbb62c6
	.xword	0xe2b0abdd5e2393dd
	.xword	0x8a925cfe8c051424
	.xword	0x884f01bbd2d34c95
	.xword	0x0f79e4c923badd09
	.xword	0x1ab7f137cb8116c1
	.xword	0x752b2117c6323305
	.xword	0xcc72db18b1153d53
	.xword	0x3eebf5488b154179
	.xword	0x58ac74f9ce6d73db
	.xword	0x916f41d7f2ee3218
	.xword	0xab68ba840b5d085a
	.xword	0xacbccedf443a3abf
	.xword	0xc7835045bb5a2e1d
	.xword	0x3bded39c92d9de80
	.xword	0xb35dce1d58357ee3
	.xword	0x3cd6bc5f41d02f1e
	.xword	0xa00cdc8f6200e9f1
	.xword	0x5ac097e640da9aad
	.xword	0x8b62cfb56fc14615
	.xword	0x80a4389c7d6690a2
	.xword	0x3693e78dba18795b
	.xword	0x46f090108394d82b
	.xword	0x6750d7ac18d4fa43
	.xword	0x484e5b26432b0aca
	.xword	0x6888517ba548e0b9
	.xword	0x48cceb19030b51de
	.xword	0x8f689d3931ff9685
	.xword	0x97663c995df533ee
	.xword	0x2faa895d288e75e9
	.xword	0xa0d77d82cb467543
	.xword	0x545deb1796f48986
	.xword	0xd8427db032066cdf
	.xword	0x39f845b472ded268
	.xword	0x86f05e8399515676
	.xword	0xce6ff4b55a29f03b
	.xword	0x04f24f36e2d5b90e
	.xword	0x6f4c44979425c32e
	.xword	0xfde8253c00053b9a
	.xword	0x2d2f5168f0e18956
	.xword	0x6b271b81b13687d2
	.xword	0xb5d416cc74fb069e
	.xword	0x6b9ba33d1b96ec8f
	.xword	0xbafdbbab5ee61320
	.xword	0xa57dce5656fee13f
	.xword	0x77b85540925a25f0
	.xword	0xa2e61b1ea116cefc
	.xword	0xb1ce59e3e372aade
	.xword	0x7aa264005ad08a43
	.xword	0x12529ce65170cc55
	.xword	0x9eaa1a8a6689ce2f
	.xword	0x76a57b6d877b3ebf
	.xword	0x8e75533bd31d707f
	.xword	0x7add12bc9a61e9de
	.xword	0x6e3ff3b7ef8c4079
	.xword	0x5d13ddbe218dd4e4
	.xword	0xb099b936e46d63f1
	.xword	0xf039f1f6d845645b
	.xword	0x6d78188fc296d05d
	.xword	0xadfd2686d1e4bae6
	.xword	0xe490aa46f9e622dc
	.xword	0x72ff3f1d225585ce
	.xword	0x3e6488fb3a9d038c
	.xword	0x24d9c8324981fdb4
	.xword	0xd3110e1e42a35b7d
	.xword	0xb2001038c570cc14
	.xword	0x46e7bd2366d77659
	.xword	0xf8f8a9c9a8feb186
	.xword	0xfc611590c2946504
	.xword	0xff65e92241ecaf55
	.xword	0xff9cf6fa28aa2d91
	.xword	0x7abe39aabf6d4414
	.xword	0x627be930db96f6df
	.xword	0xd978b1bccd80b114
	.xword	0xd359a4126b2efe89
	.xword	0x111eabdfaf798ece
	.xword	0x384b0284cc8946c7
	.xword	0xd52e180cf90d183f
	.xword	0xd7f13b6c27b5027e
	.xword	0x8c84d2d887335bc9
	.xword	0x29da4711b2eac8a1
	.xword	0x856f3bb04d2ce41b
	.xword	0x0ac330b6ceffcc67
	.xword	0xad0aa40c538ab09d
	.xword	0x70b741a4063f27b2
	.xword	0xbc4ec77633d7f356
	.xword	0x8d687ae16c0a1c8d
	.xword	0x670b934d010ae076
	.xword	0x9e498c69822ed7be
	.xword	0xf42151fdefda854b
	.xword	0xc36ce5c5beb75697
	.xword	0x78480593f5ec06a3
	.xword	0x2ad57fdc63c3b685
	.xword	0x07ce1a7e1a97cb14
	.xword	0x0cc8727d6d223458
	.xword	0x2db7f031caaea722
	.xword	0x9b83c54d81375e04
	.xword	0xe4ce2deaee93d65c
	.xword	0x19ebf91610dd85a3
	.xword	0x6982a3c7313c77ee
	.xword	0xea1d5df16bd306cb
	.xword	0x7ce9f49ead74b127
	.xword	0xdd54e2bd08d05236
	.xword	0x4f42e03d9122e114
	.xword	0xe3adc50a5f4ed9f7
	.xword	0x2fe93b6ad1c04e59
	.xword	0x597a2ac5462fd139
	.xword	0xb71629cd936f9341
	.xword	0xf2f5789191319eb9
	.xword	0xe247262d4f5177a4
	.xword	0xb23d455497d60fa5
	.xword	0x38026919ec1db22c
	.xword	0xd905548b716820e5
	.xword	0xb2df46f6531b0f3b
	.xword	0xfbce0882ddeab7fa
	.xword	0x873cf05a2453432e
	.xword	0xa1cdb509e41f1fed
	.xword	0x6dc90fd8f47bdbc7
	.xword	0xc8d074ef7e56bf25
	.xword	0xb99a4cd03ff18a0c
	.xword	0xb4715b61c31dff9e
	.xword	0x5c6faf9b4e2c1149
	.xword	0xe6e910451819476d
	.xword	0x8af15bc200bc244b
	.xword	0x35883b229289d722
	.xword	0x4837c2928fc01662
	.xword	0xa9ba3d77cbe3d9f5
	.xword	0xefbf290d4abe1414
	.xword	0xfc917fb3e14b60c6
	.xword	0x1a3b434ce54f858d
	.xword	0x0dc92bcbbfeb8dcc
	.xword	0x66e89da53ab7c2c7
	.xword	0x678132c424e456d5
	.xword	0xe96abf168839d0d4
	.xword	0xd56da9f5b33b1427
	.xword	0x13dacfff8d532dcd
	.xword	0xe6062d17dd4fcb8c
	.xword	0x9b4e6d6ab2968d10
	.xword	0x6973967bc86d9c89
	.xword	0xc32bed1451f63e81
	.xword	0xed3aed45d60869cd
	.xword	0x9a9b61546c9248a7
	.xword	0xeb2ff898edea22b0
	.xword	0x00754c9b4867cb44
	.xword	0xc8773f6325bdcc3b
	.xword	0xdfaf0f763dfea8bd
	.xword	0xba8c927be6ff16fb
	.xword	0x2103ed73d2069f48
	.xword	0xe3c143cae0d17cfa
	.xword	0x64ef772b1f3783cb
	.xword	0x7b2013648a928eec
	.xword	0x523b975a0cc13a3b
	.xword	0x47292812e0b944b7
	.xword	0xb56cdb9e810cae86
	.xword	0x9fe4daa91e40dc7d
	.xword	0x5228ac966d587ae6
	.xword	0x5b5f08ed9f427497
	.xword	0x6b08eb361dd2d2da
	.xword	0x666b1277ffc72e03
	.xword	0x856e08e58fcd0cde
	.xword	0x7f7f93696a8ef957
	.xword	0x35d0a058ef805c62
	.xword	0x9376f4366b4fe6d5
	.xword	0x1e5d12e22e2370be
	.xword	0x5c14ee688d5f9af0
	.xword	0x699bd6a73c8c738b
	.xword	0x6f8be95e5591cde0
	.xword	0x5588182bb22c1549
	.xword	0x4630125b369a223a
	.xword	0x69cd09246114fe03
	.xword	0x08daacbf58fbb6ef
	.xword	0x0e826f7ad5ca7f0a
	.xword	0xbda98bf43b4cad51
	.xword	0x412a13b4b15b3b41
	.xword	0x5023918b9177d935
	.xword	0x28f2b3ba9e2cc485
	.xword	0x7648c36a12dc598a
	.xword	0x49e98fc60b606bd9
	.xword	0x0ae095e757453f0f
	.xword	0x1605b95f55eae32a
	.xword	0x5ba09a1e71259871
	.xword	0x2e4793d43c55ad46
	.xword	0xa25fce42205ac15e
	.xword	0x2e8c953923675aec
	.xword	0xff8ad5d39942a577
	.xword	0xea0172db7d21a253
	.xword	0x45fb5a9bcaea6f37
	.xword	0xedcf4f891bf8d764
	.xword	0xe5f4c6ea8109a77d
	.xword	0x9036cafaa392e7bf
	.xword	0x89926029804de057
	.xword	0x5a36ccc555cccd78
	.xword	0x1b5cc19784cb80cb
	.xword	0xaa55f7802546a8df
	.xword	0xe336902cbb22f893
	.xword	0x9e35433f5310c0b0
	.xword	0x5e2f827469f309ed
	.xword	0x789f80cc3a0be7a0
	.xword	0x75c0f67814328c16
	.xword	0x93cc319f13ae9fcd
	.xword	0xc768fe2eb1ba863c
	.xword	0xa6e1c3004ab2fd43
	.xword	0x2b94a56839756182
	.xword	0xe7a2d306ca20438f
	.xword	0x407b3dc1dd646ad6
	.xword	0x088ff52649312bef
	.xword	0x1e607e3f72b44cc9
	.xword	0xdf9ec69ae87754cc
	.xword	0xef7fb7347d4169e2
	.xword	0x2d04dcd847df0aae
	.xword	0x188936d1eb11ec3b
	.xword	0x8386aec394d36fd3
	.xword	0x96b2a9b9a0a13dbe
	.xword	0xf67364e8b9fa5f88
	.xword	0x58b866a363d25163
	.xword	0x40be1016aaf5ed23
	.xword	0xcb9a828067f1b45d
	.xword	0xe989f7581a219a87
	.xword	0x02c744d664b63758
	.xword	0x7c95506c90afa4bd
	.xword	0x4390b8f7458dae4a
	.xword	0x7bc6160b1347568d
	.xword	0x2c2bd55633e8b9a8
	.xword	0xfbc96e2b30c67e7f
	.xword	0xff610dc968531037
	.xword	0xd52ef63afef4743b
	.xword	0x8b33bb76c58b2d78
	.xword	0x63a059193142aa65
	.xword	0xdab2a2b11468653c
	.xword	0xe6bd9f4af759f5d2
	.xword	0xa388c898e255733b
	.xword	0x327bae04da832d5b
	.xword	0x0d775bf0c40eee3d
	.xword	0xd6c96c73fef3db3b
	.xword	0xa3ffc2094a91d373
	.xword	0xa4c8fd47edeb700d
	.xword	0xb409bd676f8a3e2f
	.xword	0xc8283b0b8f9c6df8
	.xword	0xe8e1c4f745e2439e
	.align 0x40000
	.data
data_start_6:

	.xword	0x108136dc0f061a10
	.xword	0x8e4c36e39f4d47e9
	.xword	0x946fc9fc0dc47e35
	.xword	0x58c22f532415d96f
	.xword	0xc9c8a11560e3a037
	.xword	0x6dc3205572f7e25d
	.xword	0xb97c8ca7ecfc76bb
	.xword	0x429737d524fe853b
	.xword	0xb9e3a3ec7399eb04
	.xword	0xe901236d4671da00
	.xword	0x9cbf6112a8891c83
	.xword	0xc32b3587abcbb857
	.xword	0x4f9a7f824a52f93c
	.xword	0xe0fa7f270d4b55a9
	.xword	0x78b37552f4b89525
	.xword	0xa8c31e8d408f00e2
	.xword	0xe4cd0efc2c421888
	.xword	0xd842f1a72ffb364c
	.xword	0x0e8661d54dbe31e6
	.xword	0x17f4f4eb2fa86981
	.xword	0xcbce791138ab5ba4
	.xword	0xfce1c52dec5e8e2f
	.xword	0x4f18ff8dec9fab68
	.xword	0x8d37e164e1f369d5
	.xword	0x41e0d908a6443743
	.xword	0x6016380435015085
	.xword	0xadf2cd66ffe24062
	.xword	0x05ac0ed8a6d0f22a
	.xword	0x2915f28b53d47b15
	.xword	0x85aea77ca0f05a4d
	.xword	0x632add4d587851e1
	.xword	0x8baeb75f06871dcb
	.xword	0x6b815d2d392812cb
	.xword	0xab6d2125abcdb091
	.xword	0x193ac306e23b0009
	.xword	0x80ef14f366a3d492
	.xword	0x27a68f4ce81b2077
	.xword	0xf3050bcbc8dd7be5
	.xword	0x79ddbe33ec935db6
	.xword	0x77fde915a74fb39f
	.xword	0x7e59a34a940a1e80
	.xword	0xcda2b4de81159ea1
	.xword	0x113688173b4a12d3
	.xword	0xe95e1824e58fab56
	.xword	0xa9f5fcaf6bdc2f9a
	.xword	0x13d1e2470337910f
	.xword	0x05f50e001f2814dc
	.xword	0x6a0f44adcbcd15de
	.xword	0x145e60c38425a8cd
	.xword	0xf6a27a5f6f5b9e9c
	.xword	0x73e3be8c1ab1e7a8
	.xword	0xd22691aa0f1b88f6
	.xword	0x937a7c6644f9fa56
	.xword	0xc2a59279a0e46b3a
	.xword	0x9b6a9791ef6e1867
	.xword	0xb8bce42a574a5486
	.xword	0xa746a202a641ed2a
	.xword	0x2265849be68304ff
	.xword	0xe754168765b889b6
	.xword	0x16bb529b572e02d4
	.xword	0x91933fa60664b90f
	.xword	0x4d6745bd51554e57
	.xword	0xa183d3fe08545e1c
	.xword	0x90f4cec6f2081c09
	.xword	0xc962c40ad4c9181d
	.xword	0xde06481386beb4f7
	.xword	0xaa4e6e88009ac2d4
	.xword	0x9f52120e2603d020
	.xword	0x16ae58d80d2a7953
	.xword	0xdcb2867bb4c8c29c
	.xword	0x665097e5fb67d03e
	.xword	0x35ba7d01cb95fc4d
	.xword	0x3194acb216154178
	.xword	0x11b0cea856111301
	.xword	0x710a47ed7ccb77d4
	.xword	0x7c36aa3458e34b12
	.xword	0x23f823414d671d10
	.xword	0x415b9ac2fe191664
	.xword	0x928e876598a69652
	.xword	0x81097e7cddb9df36
	.xword	0x5f9c3431deca7afb
	.xword	0x6cd08598d2602dc2
	.xword	0xc4519044e521e097
	.xword	0x60589e20e6d8ccfb
	.xword	0xc1cfd021ce16002d
	.xword	0x6019c16d6fc59314
	.xword	0x2436c407a1f1a304
	.xword	0xdbfe6194281d5874
	.xword	0x9a8f17f069c1e9b2
	.xword	0x6b6c41b9ec47d6ce
	.xword	0xf91e466d17995d58
	.xword	0x36dbf7a4213ccde2
	.xword	0xbb932f0bb4246dfc
	.xword	0xc3e618f14e65d6fc
	.xword	0x11fb3c3e75b90525
	.xword	0x04d4caef84f1a3cb
	.xword	0xea43dcb8f253dc38
	.xword	0x5045c237478a6893
	.xword	0x7a9ce1671ce737d9
	.xword	0x2bfa748c148c7e72
	.xword	0x1bace7baae1e95ee
	.xword	0x1e23f79c589b87bd
	.xword	0x2af6997880525bde
	.xword	0x024eca0998491fdb
	.xword	0x890113e41d680e5e
	.xword	0xb16b907f4f6c3167
	.xword	0x395949615ba54f75
	.xword	0xde93e04e75f360d7
	.xword	0x417c5dd8b42f19f0
	.xword	0xc68762315fdb9d34
	.xword	0x8fa369fa701e63d0
	.xword	0x0e8e6b6bf1793bb0
	.xword	0x04f928ea7217c32e
	.xword	0xacb62a7a26472ca6
	.xword	0x9aedf176b9913f01
	.xword	0x2daca357d18b59ab
	.xword	0x613e288160b0bbd1
	.xword	0x56fcd74c5fcf7364
	.xword	0x2ba74748fa9c2556
	.xword	0x6402e5706fc08e99
	.xword	0xc982f1f75bd94425
	.xword	0x19255261c139f048
	.xword	0xea8589d6a80da5c1
	.xword	0xb5b2252b908a76e2
	.xword	0xa226e271a833fbe7
	.xword	0x2b524a7da4a052ad
	.xword	0x9dde9ccc232f528a
	.xword	0xb7b029dc18d55049
	.xword	0xfa988ab90e685962
	.xword	0x76c12e4deb203391
	.xword	0xf3d40c2a2f802b7a
	.xword	0x59d83d929b6d8dd1
	.xword	0xbe5d7d0818144774
	.xword	0x46387ef30ad7eeec
	.xword	0x3023255781344dc3
	.xword	0x8572114b5a8882fd
	.xword	0x449aa7fadd399525
	.xword	0x0345adba0987fdae
	.xword	0x84041881fdb18506
	.xword	0xa211e174b2b7af6c
	.xword	0x2fa7d35047e41562
	.xword	0x7726f760da6ea363
	.xword	0x02107d914c6e377a
	.xword	0x97c215bce2f45bef
	.xword	0x8d931b7eeb86dc39
	.xword	0x5e0c9e7caa8281b8
	.xword	0x26637368693bf756
	.xword	0x659fe0a6fbcd168f
	.xword	0x37e0df5b28799540
	.xword	0x8522c542154ff340
	.xword	0xd0ac00ff9ef18b42
	.xword	0x0bb225ca446b4081
	.xword	0x393282262bf4ea2c
	.xword	0xa8a8b7bc8fe97592
	.xword	0xae4a7582233a2c89
	.xword	0x1f737bd3ab3fc660
	.xword	0xa74b59b7fa2f8fc8
	.xword	0x979a884e76186985
	.xword	0xd156e69beb77fef3
	.xword	0x4c9abe9573e1c7d2
	.xword	0x3d54356566a4b28c
	.xword	0x531eeb7dee86fabf
	.xword	0xc7ebbab87bfffbc6
	.xword	0x7a16c06437db379a
	.xword	0x7bb0a5c0b88bd757
	.xword	0x2a9e464a0ef1211e
	.xword	0x3062155f1a1b1a0d
	.xword	0xf8770666192c68a2
	.xword	0xfcfd9a86acb71e97
	.xword	0xa27ebf488c68a958
	.xword	0x3e84958898d53300
	.xword	0xd0413c3015de4474
	.xword	0x7a148ae6eb413f77
	.xword	0x1b6a72bf44110342
	.xword	0xae1015abdf6fbd40
	.xword	0x61eec52de311848e
	.xword	0x964e87c887cc90e3
	.xword	0xddd9333e3379723a
	.xword	0x43c4b170a9609035
	.xword	0x4d8c3574da0bf0ff
	.xword	0x169eced6b9b771c7
	.xword	0x0523bba62a26e495
	.xword	0x05f5bbedf6cf9534
	.xword	0x49734085eef318b9
	.xword	0x10ca74c9f5e94047
	.xword	0x3d2c10386c8e4d94
	.xword	0x44c2ba651c1ec2a0
	.xword	0x2bd6e27c867bae0c
	.xword	0x13c8df6ffa43d4e2
	.xword	0xde16d4834064ef42
	.xword	0xd9217c41d4771d64
	.xword	0x92d613f323ccef8b
	.xword	0x5d7e8c3309b532c8
	.xword	0xae1ba47ef188f428
	.xword	0x14e47458d6b444bb
	.xword	0x22bf298adb4affb0
	.xword	0xc915130b38a64f62
	.xword	0x33c03f39efccbd8a
	.xword	0x40c342b7b447f20d
	.xword	0xba8ad4352c6d4973
	.xword	0xca3afc5bf5447d31
	.xword	0xa5f782a2ae3df4ad
	.xword	0x36e29b7cbba110e6
	.xword	0xab053c82ce55c37f
	.xword	0xdb816835e9aab3d1
	.xword	0xc232cad21322f9ea
	.xword	0xcb5026d05cd96006
	.xword	0x4d885bad9697ea22
	.xword	0x4c4ee24f710549f2
	.xword	0xc6a8a6120e3b8d3e
	.xword	0x3f82f16c6166459d
	.xword	0x33269001a65b4b70
	.xword	0xeead74b0a7783ba9
	.xword	0x7ad17f9137e86c8c
	.xword	0xd959c808e4af3765
	.xword	0x0519c5fff3c7a1c6
	.xword	0x1f0dffcb64d9efbf
	.xword	0x6750969273c8b182
	.xword	0xf48bc0be1b464b78
	.xword	0xc114c470e5e2164c
	.xword	0xb99b688222181476
	.xword	0x1af1d87a979be69b
	.xword	0xd27219b4b2a30d11
	.xword	0x15dc3a736c3312bd
	.xword	0x37bedb2cf43c9b98
	.xword	0xe306c2e49799ee9a
	.xword	0x495cf1b3fae862a0
	.xword	0xdcb6b1047066775a
	.xword	0x0c926c231db506ed
	.xword	0x343e5e6fbefb0e44
	.xword	0x689de931b4d7f8c8
	.xword	0x63076d5230849038
	.xword	0x53f822e625786b4b
	.xword	0x4d7c1dbeee99faa2
	.xword	0xa3dc5384972123cf
	.xword	0xcebe2a4de87653b0
	.xword	0xad4683482681979e
	.xword	0xbd0703784713eaef
	.xword	0x3b22fd7945f9cc81
	.xword	0xe9737f5585826547
	.xword	0x760c7ca2ffb673dc
	.xword	0xd589cac0bba3218b
	.xword	0xf0aa178a73d65987
	.xword	0x1606e91030f6803a
	.xword	0x7a85947e95250326
	.xword	0x70f523ff02959fc3
	.xword	0xd937d1c62fc3823f
	.xword	0x1a5abddf07c80add
	.xword	0x2a5343f9897ebc94
	.xword	0x08326fe2d4fef86f
	.xword	0x5a5b99cf20aa898d
	.xword	0xa667b6f876065ee2
	.xword	0xcd22b5314bad740d
	.xword	0x7ab3f3b2db05a8d6
	.xword	0x73b35ce500347e51
	.xword	0x05167f5a52990365
	.align 0x80000
	.data
data_start_7:

	.xword	0x19c84a3e73a360e8
	.xword	0x5dc82f1b34604da3
	.xword	0x6df93eb21ff11a85
	.xword	0x94bd75fd85429ee9
	.xword	0x5f7c2792996754ff
	.xword	0xf435313bc2f17ca1
	.xword	0x98d3cb91e600471c
	.xword	0xe112bb34f4ea13c7
	.xword	0x65007ad86531a6e8
	.xword	0x590852ef2c6812b2
	.xword	0x4436735377ad95b2
	.xword	0xee7f5dca9e5d80bd
	.xword	0x5e37b827a07cddf7
	.xword	0x21e61193ec9e3ed2
	.xword	0xa97c5a7bf961e26a
	.xword	0x6a4a13a838d0eb6e
	.xword	0x3ac193953cb12a64
	.xword	0x1dc2165ca392b039
	.xword	0xf4d077013c49b65e
	.xword	0xe40100c9977fac6f
	.xword	0xd5bfea3a1e85f29f
	.xword	0x334e8482f67858e6
	.xword	0xfe27ffeb8d9ba6ab
	.xword	0x47de2c9b2f444987
	.xword	0x0dcaeaa1170490aa
	.xword	0x0236ac97e82c973b
	.xword	0xa7ef2464a820a7d1
	.xword	0xce48d4efa3c7026e
	.xword	0x230941799fadf9ce
	.xword	0x6b075b3c141e8f8f
	.xword	0xfcd2e65c7f8b8c5a
	.xword	0x9320bf3342ce0bf4
	.xword	0xec720d4e03368b28
	.xword	0x9effcef18fcc7b2b
	.xword	0x1489eb09e415665e
	.xword	0xf36c2400d85b77bc
	.xword	0x7f917211c3d7e632
	.xword	0xc481e12edd71956f
	.xword	0x55fc07a3efb7b509
	.xword	0xce6229b22d2b884a
	.xword	0x02b8ae1ad651c6bf
	.xword	0x6444600c7640e705
	.xword	0x09150268bfa1f0d5
	.xword	0xf7b8cbc725a1cc0c
	.xword	0x7886d6b4b81fbe3e
	.xword	0xa885b2b460edf8da
	.xword	0xb6f643840d648bdc
	.xword	0xa41a8da7e6729098
	.xword	0xcebc6b1441337a24
	.xword	0xeb3057a112ea6781
	.xword	0xc0cb7233e83fabec
	.xword	0x4feba708193f185b
	.xword	0xfc03ad37f4b4e9ce
	.xword	0x6c1b7dc4312cd020
	.xword	0x783a198bd574136f
	.xword	0x935d6fae7f1e26c3
	.xword	0xf273221786556cd7
	.xword	0x1db1778b64e6af7b
	.xword	0xe8782c152fa362c3
	.xword	0xb371d47bbc2feb54
	.xword	0x8b88f19209ae0d58
	.xword	0x5370d088373fa373
	.xword	0x7feb417523b3f305
	.xword	0x47bb3bad87569072
	.xword	0x4950be9b95af0360
	.xword	0x8bda8a1cb62b5190
	.xword	0xf98786468c10eb59
	.xword	0x1997b3f3be2deccc
	.xword	0x00ca4cea0c29b452
	.xword	0xc5c037b733105703
	.xword	0xdd66f818a874f998
	.xword	0xb31fa1413f10e791
	.xword	0xd4c51028b1265e16
	.xword	0x976ebf48fdbd355d
	.xword	0xcb18ec2ff10dd06e
	.xword	0x105df850804d37a5
	.xword	0xd3c474b1582bc5c7
	.xword	0x0aa947ac3baa7b27
	.xword	0x80621c16532b69e5
	.xword	0xb34cd2fcb6cfed1d
	.xword	0xaa82767dacfc0703
	.xword	0x2cab1bcd16b7c905
	.xword	0x06aade733acf3e76
	.xword	0x1c0c32c4f1a4aa4f
	.xword	0xc9f5364748b224a6
	.xword	0x63ce87c898e2b5c2
	.xword	0x8c9f20b723052a80
	.xword	0xba287915128dc1b3
	.xword	0x433aea7211ec7a2e
	.xword	0x1ae607042cd070f4
	.xword	0x6d3d40c6d1927b98
	.xword	0x952a22a92f06b8cb
	.xword	0xadbd695db9d1f1c9
	.xword	0x49215fc5567c1fb3
	.xword	0xc16fb0ffd12be1eb
	.xword	0xc76569cb4b20e75a
	.xword	0xddbb795eae45d5bf
	.xword	0x954ccb2b8c7451d9
	.xword	0x380191b191d83af1
	.xword	0x7b3e92c8e7221ed2
	.xword	0xc55e948bcc7d2b24
	.xword	0x5a99abcfd76f3566
	.xword	0x740b74602c662cf1
	.xword	0x5ea36e651e66b0de
	.xword	0xd4f351ad18953809
	.xword	0x22ab9c281ace09d6
	.xword	0x54965bf44d151865
	.xword	0x79422347dc6ef9e1
	.xword	0x308e914d21fcb402
	.xword	0x30985558fd6e1fa5
	.xword	0x5c7ada5b2009b4e4
	.xword	0x626d80f84bd7a278
	.xword	0x796bb38a61941378
	.xword	0xf16f3984cf089c2f
	.xword	0x6995c5d65e8bf955
	.xword	0x2c2c24cb72255c10
	.xword	0x649477ce40b654af
	.xword	0x054aa02739139040
	.xword	0x2d36d5a985cf79d6
	.xword	0x35709fa484ada7ca
	.xword	0x016b33181654e463
	.xword	0x74dc1b65a9bd5ba2
	.xword	0xcffa600136837f6e
	.xword	0xf31a8d1d741c94ef
	.xword	0xe6513590d8ff7de8
	.xword	0xc54a63b4bd7d5639
	.xword	0x3180d0874e7167a3
	.xword	0x52c6adccb83ea950
	.xword	0x7d9c7b1fd7036b1f
	.xword	0xb7b8563f6044bcbd
	.xword	0xbd025c636d9883bb
	.xword	0x73fbaa5469801b37
	.xword	0x38ad4e8d541ab593
	.xword	0x01449d28914e9f8f
	.xword	0xae72fae33cdef0a2
	.xword	0x5c603c1964bce2cf
	.xword	0x3e512a4b76b56ff8
	.xword	0x4d77675ffa117b48
	.xword	0x9f18bf7c0c34e508
	.xword	0x8fc823d4225cbfa3
	.xword	0x2c73759d07b29ca2
	.xword	0x7074514d1fa79ca2
	.xword	0xbc98cdfff4e31eb1
	.xword	0x755f36583f3f8170
	.xword	0x27a3f06e3a26a29b
	.xword	0xf8a64b62c52c4544
	.xword	0x535514b40a92d36d
	.xword	0x6c233271e9f25725
	.xword	0xf2f64927dc20cecc
	.xword	0xae047c0bfe65157d
	.xword	0xc2bd5ff9592f545c
	.xword	0x529e209976121c3e
	.xword	0x121e59a7b39be237
	.xword	0xd1f13d87f1405917
	.xword	0x63198fae3a77fddd
	.xword	0xf8befe91882dcc77
	.xword	0x52fe558b1f6d89a0
	.xword	0xd1dce72ca7fbfaad
	.xword	0xbc33c8d7565006b7
	.xword	0xc5e7f94a36f70812
	.xword	0x2cfe9e5938bae700
	.xword	0xeb875291d034a0fc
	.xword	0xb49c5fa802bac4f4
	.xword	0xab702c7b3b327754
	.xword	0x7210a6b1c1ca3a60
	.xword	0xe1c9f8201324a1a1
	.xword	0x358c17c2d9e90c29
	.xword	0xd7af944a996b4a6b
	.xword	0x24f4b7580dccf6da
	.xword	0xdb93a6c0cbb2e178
	.xword	0xec7cc539755e7d8a
	.xword	0xedf211327b0532c7
	.xword	0x3d45cfcf11575481
	.xword	0xfc0558e152807cd8
	.xword	0xe1f987b7f2f45f32
	.xword	0xc98673cdb64609d5
	.xword	0x64cd43ff15afce0c
	.xword	0x4c165b4eec96985c
	.xword	0xecf6be0e330ed55c
	.xword	0x21a85d0bba7fa2ed
	.xword	0x5aebc9e1cb80f408
	.xword	0xdf94c04e836698f3
	.xword	0x1331031a4e625f55
	.xword	0xa184069eac0fe4bc
	.xword	0x5aeaf4562ddac634
	.xword	0xcca78a01383d90d0
	.xword	0x9d7194a6467bb6a7
	.xword	0xb49cb6dd3e075d6a
	.xword	0xe80e4e52f5c7c0a8
	.xword	0xac08b4f3ecf2e07f
	.xword	0x5c428b8b95de77bd
	.xword	0xe7819a0f54bcf3d7
	.xword	0x3a36c648816479d0
	.xword	0x9ff9262417d0370d
	.xword	0x869ef692aa6278c3
	.xword	0xda2368375da17c77
	.xword	0x3c3a033f1b050906
	.xword	0x3672a7c56fdaa1db
	.xword	0x5a27c38ef1df4a94
	.xword	0x72bf4b3871d9af42
	.xword	0xc40783f86a6cef4d
	.xword	0x3f51290b6fc556c8
	.xword	0x843dda7ca2627077
	.xword	0x0a019935f627db66
	.xword	0x1ff05553bd7faa74
	.xword	0xee8cab97fc38cc0f
	.xword	0xcd7833a7de1350e8
	.xword	0x094946a37f5ef2e3
	.xword	0xa7db4996054322cd
	.xword	0xcb2fc5d8326e8004
	.xword	0x205cc2eb3cbbb8f3
	.xword	0xae8e68aff9a14f85
	.xword	0xdcd917ebc1351ff2
	.xword	0xf5e9793752b1b5fe
	.xword	0x5c8971c0cd3e6618
	.xword	0x5a511b9d4cee35a7
	.xword	0x9f7e73eff2e3534f
	.xword	0x89b92771490c9040
	.xword	0x87000e8174f62ffe
	.xword	0x6078c02929add2d5
	.xword	0x7aac593d299ee999
	.xword	0x060fbc6c076b0eff
	.xword	0xea05428192ea5bcf
	.xword	0xc15695751f48e19d
	.xword	0x91037fd9f1b3dfba
	.xword	0x9eaa41cf212a94ff
	.xword	0xa78000450a4dfa81
	.xword	0x41fee2eeb4d3c8dc
	.xword	0xea26286fbbf8e610
	.xword	0x2c05a9184a98ffad
	.xword	0xbb6d2741db702772
	.xword	0x57e379c1a1779bd9
	.xword	0xaba048d959fd1663
	.xword	0xbb1ba2da1185c825
	.xword	0x72cb6bd48a8a303c
	.xword	0xd3436cf2d9f66c87
	.xword	0x73f8dc1cada453ca
	.xword	0xf52947fad5728f19
	.xword	0x513d0eff8e664dbf
	.xword	0x3ac75a2061843196
	.xword	0x1ab658c650ac7aab
	.xword	0xcf38ef0bb3e35114
	.xword	0x197e50e07ddd2cfd
	.xword	0xd879ecddfebb03c3
	.xword	0x6fd0480423137d2e
	.xword	0xc6de6fd36eacd362
	.xword	0xe2314cfdb8f9df3e
	.xword	0xfe4ecb8d1b6fad5b
	.xword	0x50cf426d4e190b8c
	.xword	0x80a829ffaa5f5ed4
	.xword	0x205ecb3c7530812a
	.xword	0x378a62b96a905ecc
	.xword	0xcc97fcef2b87de85
	.xword	0xbecdd95682cd688e
	.xword	0x8e1c7a42fdd60fd2
	.xword	0xf96c037a6bed6022



	.text
	ta	T_GOOD_TRAP

#if 0
!!# /*
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!# 
!!#   int i, j;
!!#   int iob_intr_cnt = 0;
!!#   int cpu_intr_cnt = 0;
!!#   int asi_reg_rdcnt = 0;
!!#   int asi_reg_wrcnt = 0;
!!# 
!!# 
!!# 
!!# my_imm_asi_to_rvar (int line, int rv_ro, field_type_t fld, void *data);
!!# 
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#   IJ_bind_thread_group("diag.j", 36, th_all,  0xf);
!!#   IJ_bind_thread_group("diag.j", 37, th_wn,    0x1);
!!#   IJ_bind_thread_group("diag.j", 38, th_fp,    0x2);
!!#   IJ_bind_thread_group("diag.j", 39, th_ld,    0x4);
!!#   IJ_bind_thread_group("diag.j", 40, th_st,    0x8);
!!#   IJ_bind_thread_group("diag.j", 41, th_ldst,  0xc);
!!# 
!!#   IJ_set_default_rule_wt_rvar ( "diag.j", 43,"{16}" );
!!#   IJ_set_rvar ("diag.j", 44, Rv_low_wt, "{1}");
!!#   IJ_set_rvar ("diag.j", 45, Rv_mid_wt, "{8}");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 47, ijdefault, Ft_Rs1, "{16..23}");
!!#   IJ_set_ropr_fld ("diag.j", 48, ijdefault, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 49, ijdefault, Ft_Simm13, "13'b0 000r rrrr rrrr");
!!#   IJ_set_ropr_fld ("diag.j", 50, ijdefault, Ft_Rd, "{24..31}");
!!# 
!!#   // ASR read/write parametes
!!#   IJ_set_rvar ("diag.j", 53, Rv_asi_va, "{ 0x0..0x38, 0x3c0..0x3c8 }");
!!#   IJ_set_ropr_fld ("diag.j", 54, Rop_asi_reg, Ft_Rs1, "{14}");
!!#   IJ_set_ropr_fld ("diag.j", 55, Rop_asi_reg, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 56, Rop_asi_reg, Ft_Rd,  "{24..31}");
!!#   IJ_set_ropr_fld ("diag.j", 57, Rop_asi_reg, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld ("diag.j", 58, Rop_asi_reg, Ft_Imm_Asi, "{0x72, 0x73, 0x74, 0x25, 0x20, 0x4f}");
!!# 
!!#   // IO HW interrupt vector
!!#   IJ_set_rvar ("diag.j", 61, Rv_intr_vect, "6'brr rrrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 63, Rv_intr_disp_reg, 
!!#                "46'{0},"     // RSVD0 
!!# 	       "2'brr,"      // Type
!!#                "3'b000,"     // RSVD1 
!!#                "5'b000rr,"   // THREAD 
!!#                "2'b00,"      // RSVD2
!!#                "6'brr rrrr"  // VECTOR 
!!#               );
!!# 
!!#   IJ_set_rvar ("diag.j", 72, Rv_ma_cntl, "12'b0001 r100 0000");
!!# 
!!#   // Random data pattern
!!#   IJ_set_rvar ("diag.j", 75, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!# 
!!#   // ldst memory address
!!#   IJ_set_rvar ("diag.j", 78, Rv_data_sec, "{0..7}");
!!#   IJ_set_rvar ("diag.j", 79, Rv_ldst_var, "{16..23}");
!!# 
!!#   // HPSTATE/HTSTATE write data
!!#   //IJ_set_rvar (Rv_hpstate, "12'h1rrr rr0r r0r1");
!!#   IJ_set_ropr_fld ("diag.j", 83, Rop_hpstate, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 84, Rop_hpstate, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 85, Rop_hpstate, Ft_Simm13, "13'br 1rrr rr0r r0r0");
!!# 
!!#   // TL & GL write data
!!#   IJ_set_rvar ("diag.j", 88, Rv_tl_lvl, "{0..2}");
!!#   IJ_set_ropr_fld ("diag.j", 89, Rop_tl, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 90, Rop_tl, Ft_Rs2, "{0}");
!!#   //IJ_set_ropr_fld (Rop_tl, Ft_Simm13, "13'b0 0000 0000 00rr");
!!#   IJ_set_ropr_fld ("diag.j", 92, Rop_tl, Ft_Simm13, "{0, 1, 2}");
!!# 
!!#   IJ_set_rvar ("diag.j", 94, Rv_gl_lvl, "{0..2}");
!!#   IJ_set_ropr_fld ("diag.j", 95, Rop_gl, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 96, Rop_gl, Ft_Rs2, "{0}");
!!#   //IJ_set_ropr_fld (Rop_gl, Ft_Simm13, "13'b0 0000 0000 00rr");
!!#   IJ_set_ropr_fld ("diag.j", 98, Rop_gl, Ft_Simm13, "{0, 1, 2}");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 100, th_all, 8, 0, Rv_rand64);
!!# 
!!#   // Floating point register initializaation
!!#   IJ_printf ("diag.j", 103, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#   IJ_printf ("diag.j", 104, th_all, "\twrpr\t%%g0, 0, %%pil\n");
!!# 
!!#   IJ_printf ("diag.j", 106, th_all, "\twr\t%%g0, 4, %%fprs\n");
!!#   IJ_printf ("diag.j", 107, th_all, "\tsetx\tdata_start_0, %%r1, %%g7\n");
!!#   for (i = 0; i < 32; i++) {
!!# 	IJ_printf  ("diag.j", 109, th_all,"\tldd\t[%%g7+%d], %%f%d\n", (i*8), (i*2));
!!#   }
!!#   IJ_printf ("diag.j", 111, th_all, "\tsetx\tfsr_data, %%r1, %%g7\n");
!!#   IJ_printf ("diag.j", 112, th_all, "\tstx\t%%fsr, [%%g7]\n");
!!#   IJ_printf ("diag.j", 113, th_all, "\tldx\t[%%g7], %%g4\n");
!!#   IJ_printf ("diag.j", 114, th_all, "\tsetx\t%%hi(0x0f000000), %%g1, %%g3\n");
!!#   IJ_printf ("diag.j", 115, th_all, "\tor\t%%g4, %%g3, %%g4\n");
!!#   IJ_printf ("diag.j", 116, th_all, "\tstx\t%%g4, [%%g7]\n");
!!#   IJ_printf ("diag.j", 117, th_all, "\tldx\t[%%g7], %%fsr\n");
!!# 
!!#   // VA watchpoint enable
!!#   IJ_printf ("diag.j", 120, th_all, "\tsetx\t%%hi(0x1ffe0000f), %%g1, %%g2\n");
!!#   IJ_printf ("diag.j", 121, th_all, "\tstxa\t%%g2, [%%g0] 0x45\n");
!!#   IJ_printf ("diag.j", 122, th_all, "\tmov\t0x38, %%g3\n");
!!#   IJ_printf ("diag.j", 123, th_ldst, "\tsetx\tdata_start_0, %%g1, %%g2\n");
!!#   IJ_printf ("diag.j", 124, th_all, "\tstxa\t%%g2, [%%g3] 0x58\n");
!!# 
!!#   // Initialize the scratch pad registers
!!#   IJ_printf ("diag.j", 127, th_all, "Init_scratchpad:\n");
!!#   IJ_printf ("diag.j", 128, th_all, "\twr\t%%g0, 0x4f, %%asi\n");
!!#   for (i = 0; i < 8; i++) {
!!#     IJ_printf ("diag.j", 130, th_all, "\tstxa\t%%l%0d, [0x%0x] %%asi\n", i, (i*8));
!!#   }
!!# 
!!#   IJ_printf ("diag.j", 133, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!# 
!!#   IJ_th_fork("diag.j", 136,0x2, 0x4, 0x8, -1);;
!!# 
!!#   // Initialize Rs1 (va) for threads 2, 3
!!#   for (i = 0; i < 8; i++) {
!!#     IJ_printf ("diag.j", 140, th_ldst, "\tsetx\tdata_start_%d, %%g1, %%r%d\n", i, (16+i));
!!#   }
!!# 
!!#   return 0;
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#   IJ_th_join("diag.j", 147,0xf);
!!#   IJ_th_start ("diag.j", 148,Seq_Start, NULL, 1);
!!# 
!!#   IJ_printf ("diag.j", 150, th_all, "\t.data\nfsr_data:\n\n");
!!#   IJ_printf  ("diag.j", 151, th_all,"\t.xword\t0x0000000000000000\n");
!!#   for (i = 0; i < 8; i++) {
!!#     IJ_printf ("diag.j", 153, th_all, "\t.align 0x%x\n", (1<<(i+12)));
!!#     IJ_printf ("diag.j", 154, th_all, "\t.data\ndata_start_%d:\n\n", i);
!!#     for (j = 0; j < 256; j++) {
!!# 	IJ_printf  ("diag.j", 156, th_all,"\t.xword\t0x%016llrx\n", Rv_rand64);
!!#     }
!!#   }
!!# 
!!# }
!!# 
!!# %%
!!# %%section map
!!# 
!!# %%
!!# %%section grammar
!!# 
!!# 
!!# inst_block: inst_type
!!# 	    | inst_block inst_type
!!# ;
!!# 
!!# inst_type: 
!!# 	spec_inst
!!# 	| comm_inst
!!# 	{
!!# 	  IJ_generate ("diag.j", 196, th_all, $1);
!!# 	}
!!# 	| spill_trap 
!!# 	{
!!# 	  IJ_generate ("diag.j", 200, th_wn, $1);
!!# 	}
!!# 	| fp_all 
!!# 	{
!!# 	  IJ_generate ("diag.j", 204, th_fp, $1);
!!# 	}
!!# 	| load 
!!# 	{
!!# 	  IJ_generate ("diag.j", 208, th_ld, $1);
!!# 	}
!!# 	| store
!!# 	{
!!# 	  IJ_generate ("diag.j", 212, th_st, $1);
!!# 	}
!!# 	| set_va %rvar  Rv_low_wt
!!# 	{
!!# 	  IJ_generate ("diag.j", 216, th_ldst, $1);
!!# 	}
!!# ;
!!# 
!!# spec_inst:
!!# 	iob_intr
!!# 	| cpu_intr
!!# 	| spu_rsrv_illgl %rvar  Rv_low_wt
!!# 	| cntx_demap	 %rvar  Rv_low_wt
!!# ;
!!# 
!!# comm_inst:
!!# 	alu
!!# 	| read_priv_reg	 %rvar  Rv_low_wt
!!# 	| write_priv_reg %rvar  Rv_low_wt
!!# 	| read_asi_reg
!!# 	| write_asi_reg
!!# 	| change_priv	%rvar  Rv_mid_wt
!!# ;
!!# 
!!# change_priv:
!!# 	mHPRIV
!!# 	{
!!#           IJ_printf ("diag.j", 239, th_ldst, "\tta\tT_CHANGE_HPRIV\n");
!!# 	}
!!# 	| mNONHPRIV
!!# 	{
!!#           IJ_printf ("diag.j", 243, th_ldst, "\tta\tT_CHANGE_NONHPRIV\n");
!!# 	}
!!# 	| mTL1
!!# 	{
!!#           IJ_printf ("diag.j", 247, th_ldst, "\tta\tT_CHANGE_TO_TL1\n");
!!# 	}
!!# 	| mTL0
!!# 	{
!!#           IJ_printf ("diag.j", 251, th_ldst, "\tta\tT_CHANGE_TO_TL0\n");
!!# 	}
!!# ;
!!# 
!!# set_va: tWRHPR_HPSTATE_I %ropr  Rop_hpstate
!!# 	{
!!# 	  IJ_printf ("diag.j", 257, th_ldst, "\tsetx\tdata_start_%rd, %%g1, %%r%rd\n", Rv_data_sec, Rv_ldst_var);
!!#           IJ_printf ("diag.j", 258, th_ldst, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 259, th_ldst, "\tmov\t0x38, %%g1\n");
!!#           IJ_printf ("diag.j", 260, th_ldst, "\tstxa\t%%r%d, [%%g1] 0x58\n", IJ_get_rvar_val32 ("diag.j", 260, Rv_ldst_var));
!!#         } 
!!# ;
!!# 
!!# write_priv_reg:
!!# 	tWRPR_PSTATE_I
!!# 	| tWRPR_TPC_I 
!!# 	| tWRPR_TNPC_I 
!!# 	| tWRPR_TSTATE_I 
!!# 	| tWRPR_TT_I
!!# 	| tWRPR_TICK_I
!!# 	| tWRPR_TL_I %ropr  Rop_tl
!!# 	| tWRPR_GL_I %ropr  Rop_gl
!!# 	| tWRPR_PIL_I
!!# ;
!!# 
!!# read_priv_reg: 
!!# 	tRDPR_PSTATE
!!# 	| tRDHPR_HPSTATE
!!# 	| tRDPR_TPC 
!!# 	| tRDPR_TNPC 
!!# 	| tRDPR_TSTATE 
!!# 	| tRDPR_TT
!!# 	| tRDPR_TICK
!!# 	| tRDPR_TL
!!# 	| tRDPR_GL
!!# 	| tRDPR_PIL
!!# ;
!!# 
!!# read_asi_reg:
!!# 	tLDXA_R %ropr  Rop_asi_reg
!!# 	{
!!#           IJ_printf ("diag.j", 292, th_all, "T%y_asi_reg_rd_%d:\n", asi_reg_rdcnt);
!!#           IJ_printf ("diag.j", 293, th_all, "\tmov\t0x%rx, %%r14\n", Rv_asi_va);
!!# 	  asi_reg_rdcnt++;
!!# 	}
!!# ;
!!# 
!!# write_asi_reg:
!!# 	tSTXA_R %ropr  Rop_asi_reg
!!# 	{
!!#           IJ_printf ("diag.j", 301, th_all, "T%y_asi_reg_wr_%d:\n", asi_reg_wrcnt);
!!#           IJ_printf ("diag.j", 302, th_all, "\tmov\t0x%rx, %%r14\n", Rv_asi_va);
!!# 	  asi_reg_wrcnt++;
!!# 	}
!!# ;
!!# 
!!# load:	
!!# 	tLDSB_R | tLDSH_R | tLDSW_R | tLDUB_R | tLDUH_R | tLDUW_R | tLDX_R
!!# 	| tLDSB_I | tLDSH_I | tLDSW_I | tLDUB_I | tLDUH_I | tLDUW_I | tLDX_I
!!# 	| tLDSBA_R | tLDSHA_R | tLDSWA_R | tLDUBA_R | tLDUHA_R | tLDUWA_R
!!# 	| tLDSBA_I | tLDSHA_I | tLDSWA_I | tLDUBA_I | tLDUHA_I | tLDUWA_I | tLDXA_I
!!# 	| mBLK_LD
!!# 	{
!!#           IJ_printf ("diag.j", 314, th_fp, "\tlda\t[%%r%d + %%g0] 0xf0, %%f2\n", IJ_get_rvar_val32 ("diag.j", 314, Rv_ldst_var));
!!# 	}
!!# ;
!!# 
!!# store:
!!# 	tSTB_R | tSTH_R | tSTW_R | tSTX_R | tSTB_I | tSTH_I | tSTW_I | tSTX_I
!!# 	| tSTBA_R | tSTHA_R | tSTWA_R
!!# 	| tSTBA_I | tSTHA_I | tSTWA_I | tSTXA_I
!!# ;
!!# 
!!# fp_all:	fp_arith | fmov
!!# ;
!!# 
!!# fp_arith:
!!# 	tFADDs | tFADDd | tFADDq | tFSUBs | tFSUBd | tFSUBq | tFMULs | tFMULd | 
!!# 	tFMULq | tFDIVs | tFDIVd | tFDIVq | tFSQRTs | tFSQRTd | tFSQRTq
!!# ;
!!# 
!!# fmov:	tFMOVs | tFMOVd | tFMOVRLEZ | tFMOVRLZ | tFMOVRNZ | tFMOVRGZ | 
!!# 	tFMOVRGEZ | tFMOVA  | tFMOVN   | tFMOVNE  | tFMOVE   | tFMOVG  | 
!!# 	tFMOVLE | tFMOVGE | tFMOVL   | tFMOVGU  | tFMOVLEU | tFMOVCC | 
!!# 	tFMOVCS | tFMOVPOS | tFMOVNEG | tFMOVVC | tFMOVVS  | tFMOVRZ
!!# ;
!!# 
!!# spill_trap:
!!# 	tSAVE_I | tSAVE_R
!!# ;
!!# 
!!# cntx_demap: itlb_demap | dtlb_demap
!!# ;
!!# 
!!# itlb_demap: mIDEMAP
!!# 	{
!!#           IJ_printf ("diag.j", 348, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 349, th_all, "\tmov\t0, %%g1\n");
!!#           IJ_printf ("diag.j", 350, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 351, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 352, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!# 	};
!!# 
!!# dtlb_demap: mDDEMAP
!!# 	{
!!#           IJ_printf ("diag.j", 357, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!#           IJ_printf ("diag.j", 358, th_all, "\tmov\t8, %%g1\n");
!!#           IJ_printf ("diag.j", 359, th_all, "\tstxa\t%%g0, [%%g1] 0x60\n");
!!#           IJ_printf ("diag.j", 360, th_all, "\tflush\n");
!!#           IJ_printf ("diag.j", 361, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#           IJ_printf ("diag.j", 362, th_all, "\tflush\n");
!!# 	};
!!# 
!!# alu:	tADD_R | tADD_I | tADDcc_R | tADDcc_I | tADDC_R | tADDC_I | tADDCcc_R | tADDCcc_I 
!!# 	| tSUB_R | tSUB_I | tSUBcc_R | tSUBcc_I | tSUBC_R | tSUBC_I | tSUBCcc_R | tSUBCcc_I 
!!# 	| tAND_R | tAND_I | tANDcc_R | tANDcc_I | tANDN_R | tANDN_I | tANDNcc_R 
!!# 	| tANDNcc_I | tOR_R | tOR_I | tORcc_R | tORcc_I | tORN_R | tORN_I | tORNcc_R | tORNcc_I 
!!# 	| tXOR_R | tXOR_I | tXORcc_R | tXORcc_I | tXNOR_R | tXNOR_I | tXNORcc_R | tXNORcc_I 
!!# 	| tMOVR_R | tMOVR_I | tMOVcc_R | tMOVcc_I | tSRL_R | tSRL_I | tSRA_R | tSRA_I | tSRLX_R 
!!# 	| tSRLX_I | tSRAX_R | tSRAX_I | tSLL_R | tSLL_I | tSLLX_R | tSLLX_I
!!# ;
!!# 
!!# spu_rsrv_illgl: mSPU_ILLGL
!!# 	{
!!# 	  IJ_printf ("diag.j", 376, th_all, "\tta\tT_CHANGE_HPRIV\n");
!!# 	  IJ_printf ("diag.j", 377, th_all, "\tmov\t0x80, %%g1\n");
!!# 	  IJ_printf ("diag.j", 378, th_all, "\tmov\t0x%rx, %%g2\n", Rv_ma_cntl);
!!# 	  IJ_printf ("diag.j", 379, th_all, "\tstxa\t%%g2, [%%g1] 0x40\n");
!!# 	  IJ_printf ("diag.j", 380, th_all, "\tta\tT_CHANGE_NONHPRIV\n");
!!#         }
!!# ;
!!# 
!!# cpu_intr:
!!# 	mCPU_INTR
!!# 	{
!!#           IJ_printf ("diag.j", 387, th_all, "cpu_intr_%y_%d:\n", cpu_intr_cnt);
!!# 	  IJ_printf ("diag.j", 388, th_all, "\tsetx\t0x%llrx, %%g1, %%o0\n", Rv_intr_disp_reg);
!!#           IJ_printf ("diag.j", 389, th_all, "\tta\tT_SEND_THRD_INTR\n");
!!# 	  cpu_intr_cnt++;
!!# 	}
!!# ;
!!# 
!!# iob_intr:
!!# 	mIOB_INT
!!#         {
!!#           IJ_printf ("diag.j", 397, th_all, "iob_intr_%y_%d:\n", iob_intr_cnt);
!!#           IJ_printf ("diag.j", 398, th_all, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.iob_intr_%y_%d), 16, 16)) -> intp(%y, 0, %rx)\n", iob_intr_cnt, Rv_intr_vect);
!!#           iob_intr_cnt++;
!!#         }
!!# ;
!!# 
!!# 
!!# %%
!!# %%section cbfunc
!!# 
!!# 
!!# 
!!# 
!!# 
!!# %%
!!# %%section stat
!!# 
!!# %%
#endif
