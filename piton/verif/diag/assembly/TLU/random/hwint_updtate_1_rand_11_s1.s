// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hwint_updtate_1_rand_11_s1.s
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
   random seed:	432092708
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

	setx 0x3a474ba8ad959b75, %g1, %g0
	setx 0xf05f62ca37addb6f, %g1, %g1
	setx 0x028ea44c1bd6f421, %g1, %g2
	setx 0xfa72cc8bfe4ea816, %g1, %g3
	setx 0xb0ecb23bfcfdf24b, %g1, %g4
	setx 0xc6319228c2679086, %g1, %g5
	setx 0x1dceb9c00661b4b1, %g1, %g6
	setx 0x4ab82f141af1a04c, %g1, %g7
	setx 0xd0c9b568c558070a, %g1, %r16
	setx 0x453d05bf41fca2f5, %g1, %r17
	setx 0xebb9506a9d35d806, %g1, %r18
	setx 0xfff72a49429be431, %g1, %r19
	setx 0xbc96bec78a5a86f7, %g1, %r20
	setx 0x40b62276d5d0c039, %g1, %r21
	setx 0x2f6d5bda0f8c7448, %g1, %r22
	setx 0x86d0e53f7472f7c5, %g1, %r23
	setx 0x88536a2159248650, %g1, %r24
	setx 0xa5a71a700207ec57, %g1, %r25
	setx 0xe27a8a2a00fb45b6, %g1, %r26
	setx 0xce280b57d8019598, %g1, %r27
	setx 0x3ff4e462e5c09b27, %g1, %r28
	setx 0xaab5887963f933fa, %g1, %r29
	setx 0x2f2c99c3df40c054, %g1, %r30
	setx 0x5d8b23e5597fab53, %g1, %r31
	save
	setx 0xd333903abaffd1d3, %g1, %r16
	setx 0xa689856d4bb70bdc, %g1, %r17
	setx 0x7b4a0c08b004eed1, %g1, %r18
	setx 0x32ab287eeb97bcac, %g1, %r19
	setx 0x5b2b4bf3efe3ea71, %g1, %r20
	setx 0xf4a1db4ce449ce3e, %g1, %r21
	setx 0xdf42bee0f7e534c3, %g1, %r22
	setx 0x63e2816ba9f2d152, %g1, %r23
	setx 0x3f4d7752e0875261, %g1, %r24
	setx 0xa0824b897af2225e, %g1, %r25
	setx 0x8441c3e714a98541, %g1, %r26
	setx 0xa814d2e55e2f7e90, %g1, %r27
	setx 0x9e58e8f7804080ac, %g1, %r28
	setx 0x141629a902923913, %g1, %r29
	setx 0x32918e085847d1d3, %g1, %r30
	setx 0xe423dbd199cffdbf, %g1, %r31
	save
	setx 0xb6ab774c8386a169, %g1, %r16
	setx 0x65cb4946718979e8, %g1, %r17
	setx 0x8f79bae287ff465c, %g1, %r18
	setx 0xc327a9df12ba709a, %g1, %r19
	setx 0x8dcaa035484e298d, %g1, %r20
	setx 0xc3090961c6726738, %g1, %r21
	setx 0x0296d6bdbe77af91, %g1, %r22
	setx 0xec1a26be8cd2d09c, %g1, %r23
	setx 0x49494799147bfb7d, %g1, %r24
	setx 0x412eda643210cc04, %g1, %r25
	setx 0x69fe79a2c6decd9c, %g1, %r26
	setx 0xabad61c3977801de, %g1, %r27
	setx 0x7c3a071691dd842c, %g1, %r28
	setx 0x9d620f320e1c9ad9, %g1, %r29
	setx 0x0bcf413fe2bed00f, %g1, %r30
	setx 0x0cd1160dd921dfa6, %g1, %r31
	save
	setx 0x87bb3533a682954f, %g1, %r16
	setx 0x722a8a35fe7dedfd, %g1, %r17
	setx 0xcdfb9ebdcb770568, %g1, %r18
	setx 0xa720a0efca6b4058, %g1, %r19
	setx 0xddfc83d9287f1833, %g1, %r20
	setx 0xeadb951c97be4e87, %g1, %r21
	setx 0x6a202013d49ab99c, %g1, %r22
	setx 0xdec5da3f1bfa756e, %g1, %r23
	setx 0xaa63072d1e7d0f50, %g1, %r24
	setx 0x73d34e02c8e07b17, %g1, %r25
	setx 0xf1f3725aa8d024e1, %g1, %r26
	setx 0xe1066b20cc8b2a08, %g1, %r27
	setx 0x927cf159b4b66055, %g1, %r28
	setx 0x85230ad6116ee7da, %g1, %r29
	setx 0xb63f053c5274dbf7, %g1, %r30
	setx 0xd2da46e5d893ec19, %g1, %r31
	save
	setx 0x9b5e92e9949892d4, %g1, %r16
	setx 0xedc59491bf9a4753, %g1, %r17
	setx 0xa0f06de607f0d72c, %g1, %r18
	setx 0x7d0abdb4ceb7fe5f, %g1, %r19
	setx 0xffa69605f0ab368b, %g1, %r20
	setx 0x014305948e82e645, %g1, %r21
	setx 0x0d7b263c4463bcf2, %g1, %r22
	setx 0x726dd348934da95c, %g1, %r23
	setx 0x3997619880731237, %g1, %r24
	setx 0x6c34ed888ce45f9a, %g1, %r25
	setx 0x999e33cc6ededf29, %g1, %r26
	setx 0x88c82e204e7946f4, %g1, %r27
	setx 0xd877caee3c3fa6c2, %g1, %r28
	setx 0x0abe48cedfadd64b, %g1, %r29
	setx 0xe5789104320e9496, %g1, %r30
	setx 0xe2a5bcab00b1cb68, %g1, %r31
	save
	setx 0x7092a7ca4246015a, %g1, %r16
	setx 0x6efad616e15bbcce, %g1, %r17
	setx 0xde5328449ea6a01a, %g1, %r18
	setx 0xd093bde6dde4c5a8, %g1, %r19
	setx 0xe4440f21a6cbc2d2, %g1, %r20
	setx 0x341e831c6e35578a, %g1, %r21
	setx 0xa92614a6515de574, %g1, %r22
	setx 0x780334d4b846cd6f, %g1, %r23
	setx 0x479fdbfb9eacffa9, %g1, %r24
	setx 0xb18e151a1adb868e, %g1, %r25
	setx 0x79a0ddea9c2bc810, %g1, %r26
	setx 0xb592169c95232a6e, %g1, %r27
	setx 0x8eb1bd1b5d07a357, %g1, %r28
	setx 0xfaa7ad6591a70c3a, %g1, %r29
	setx 0xaeabbe45f1c98c1c, %g1, %r30
	setx 0xaa8d386eac193c0d, %g1, %r31
	save
	setx 0xcc7f7fc36adbe0ec, %g1, %r16
	setx 0x30807e82dd276b9d, %g1, %r17
	setx 0x298965d664c247aa, %g1, %r18
	setx 0xdc0baf4372832ca5, %g1, %r19
	setx 0x3c69a94d5896066d, %g1, %r20
	setx 0x9a14fdbc145ebd36, %g1, %r21
	setx 0x53319cd2a072c987, %g1, %r22
	setx 0xdd44907dc02bcfed, %g1, %r23
	setx 0x4d73af725e22753a, %g1, %r24
	setx 0x4379ef13e0e754e1, %g1, %r25
	setx 0x11fe5294bb61d036, %g1, %r26
	setx 0x633ef3e3a2f313f3, %g1, %r27
	setx 0x758f3c0a3f1bddda, %g1, %r28
	setx 0xd1efd960a6d531ec, %g1, %r29
	setx 0xc05d784801819efd, %g1, %r30
	setx 0xcaa491eb020f9d0c, %g1, %r31
	save
	setx 0xd79bde1d7c8d24d9, %g1, %r16
	setx 0x1b91cff37dc65596, %g1, %r17
	setx 0xf8ea0b60a94bd322, %g1, %r18
	setx 0x53bcf7f2b478c574, %g1, %r19
	setx 0x5bf0d4dee4b5aacf, %g1, %r20
	setx 0xa688b09b24e03098, %g1, %r21
	setx 0xfc76faa61d8d3f23, %g1, %r22
	setx 0xe3b9c05fcb2c03f6, %g1, %r23
	setx 0x7a69f49b3696dbd5, %g1, %r24
	setx 0xdb8f591ea6d2eebc, %g1, %r25
	setx 0xbca4e368d82bb5ce, %g1, %r26
	setx 0xb80d89c048303060, %g1, %r27
	setx 0xffe47810a4349382, %g1, %r28
	setx 0x33a93aafb5436c60, %g1, %r29
	setx 0x5594f2d02f3e6c6d, %g1, %r30
	setx 0xda5077fa000934f7, %g1, %r31
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
	setx	0x18013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6c4e02c  ! 3: ADDCcc_I	addccc 	%r19, 0x002c, %r27
	.word 0xbbe50000  ! 4: SAVE_R	save	%r20, %r0, %r29
cpu_intr_0_1:
	setx	0x1c032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 11: SAVE_R	save	%r20, %r0, %r30
	.word 0xb5e4e154  ! 12: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb5e40000  ! 14: SAVE_R	save	%r16, %r0, %r26
	.word 0xbbe4a154  ! 18: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe44000  ! 19: SAVE_R	save	%r17, %r0, %r29
	.word 0xb1e5e12b  ! 20: SAVE_I	save	%r23, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_2:
	setx	0x1d0025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0c5c000  ! 25: ADDCcc_R	addccc 	%r23, %r0, %r24
	.word 0xbfe56164  ! 26: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1e5c000  ! 27: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_3:
	setx	0x1d0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbec4c000  ! 34: ADDCcc_R	addccc 	%r19, %r0, %r31
	.word 0xb284a0d9  ! 35: ADDcc_I	addcc 	%r18, 0x00d9, %r25
	.word 0xb1e58000  ! 37: SAVE_R	save	%r22, %r0, %r24
T0_asi_reg_wr_0:
	mov	0x2d, %r14
	.word 0xf8f38e80  ! 41: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb834a06e  ! 44: SUBC_I	orn 	%r18, 0x006e, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e50000  ! 46: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_rd_0:
	mov	0x36, %r14
	.word 0xf0db8e60  ! 49: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
iob_intr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_0), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_4:
	setx	0x1f001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_5:
	setx	0x1e011d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_6:
	setx	0x1c0239, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_1:
	mov	0xd, %r14
	.word 0xf8db8e60  ! 61: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb5e5a1f7  ! 70: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe46042  ! 72: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1e48000  ! 73: SAVE_R	save	%r18, %r0, %r24
	.word 0xb5e4e048  ! 76: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e4a034  ! 77: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_wr_1:
	mov	0x3c7, %r14
	.word 0xfcf389e0  ! 78: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbde5c000  ! 80: SAVE_R	save	%r23, %r0, %r30
	.word 0xb9e48000  ! 85: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_rd_2:
	mov	0x3c8, %r14
	.word 0xf6db8e40  ! 86: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb7e4e031  ! 87: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3e58000  ! 90: SAVE_R	save	%r22, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe4213c  ! 94: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbfe44000  ! 96: SAVE_R	save	%r17, %r0, %r31
T0_asi_reg_wr_2:
	mov	0x34, %r14
	.word 0xf6f38e80  ! 99: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_7:
	setx	0x1e032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd641800  ! 105: MOVcc_R	<illegal instruction>
T0_asi_reg_wr_3:
	mov	0x3c1, %r14
	.word 0xf0f384a0  ! 106: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_1), 16, 16)) -> intp(0, 0, 35)
	.word 0xb3e48000  ! 108: SAVE_R	save	%r18, %r0, %r25
	.word 0xb014e15e  ! 109: OR_I	or 	%r19, 0x015e, %r24
T0_asi_reg_wr_4:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 110: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_2), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbbe4a17b  ! 112: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde5213e  ! 115: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb80c0000  ! 116: AND_R	and 	%r16, %r0, %r28
cpu_intr_0_8:
	setx	0x1d030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e48000  ! 118: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_9:
	setx	0x1c0207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a1d7  ! 120: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbfe58000  ! 121: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_3), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbde420d4  ! 125: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_10:
	setx	0x1f001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_4), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_11:
	setx	0x1e0231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a0dc  ! 134: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_5), 16, 16)) -> intp(0, 0, 25)
cpu_intr_0_12:
	setx	0x1e020f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_13:
	setx	0x1f020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5e015  ! 144: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_6), 16, 16)) -> intp(0, 0, 16)
	.word 0xbbe4e012  ! 151: SAVE_I	save	%r19, 0x0001, %r29
iob_intr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_7), 16, 16)) -> intp(0, 0, 14)
	.word 0xb9e4a123  ! 157: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_8), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_wr_5:
	mov	0x20, %r14
	.word 0xf6f38400  ! 159: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb5e44000  ! 161: SAVE_R	save	%r17, %r0, %r26
iob_intr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_9), 16, 16)) -> intp(0, 0, 0)
	.word 0xbde5c000  ! 163: SAVE_R	save	%r23, %r0, %r30
iob_intr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_10), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_rd_3:
	mov	0x18, %r14
	.word 0xf0db8400  ! 167: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_0_14:
	setx	0x1d0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xa1902000  ! 169: WRPR_GL_I	wrpr	%r0, 0x0000, %-
cpu_intr_0_15:
	setx	0x1c0232, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_16:
	setx	0x1c012b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_11), 16, 16)) -> intp(0, 0, 2b)
	.word 0xbfe4e1b3  ! 178: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbfe56129  ! 179: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_17:
	setx	0x1d0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde561b2  ! 183: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbeb44000  ! 184: SUBCcc_R	orncc 	%r17, %r0, %r31
iob_intr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_12), 16, 16)) -> intp(0, 0, f)
	.word 0xb9e5e1a7  ! 186: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde4e050  ! 187: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb7e54000  ! 189: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_rd_4:
	mov	0xb, %r14
	.word 0xf8db8e80  ! 192: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbfe4c000  ! 194: SAVE_R	save	%r19, %r0, %r31
	.word 0xb1e52128  ! 195: SAVE_I	save	%r20, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e58000  ! 197: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_18:
	setx	0x1c0318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_13), 16, 16)) -> intp(0, 0, b)
iob_intr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_14), 16, 16)) -> intp(0, 0, 8)
	.word 0xb3e4207d  ! 206: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_wr_6:
	mov	0x3c5, %r14
	.word 0xf6f38e60  ! 207: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb3e4a0f7  ! 210: SAVE_I	save	%r18, 0x0001, %r25
iob_intr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_15), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_wr_7:
	mov	0x3c0, %r14
	.word 0xf8f38400  ! 220: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbde50000  ! 222: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_19:
	setx	0x1c0117, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_5:
	mov	0x1e, %r14
	.word 0xfcdb8e80  ! 224: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T0_asi_reg_wr_8:
	mov	0x15, %r14
	.word 0xf0f384a0  ! 227: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb1e460a2  ! 229: SAVE_I	save	%r17, 0x0001, %r24
cpu_intr_0_20:
	setx	0x1e031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_6:
	mov	0x30, %r14
	.word 0xfedb8400  ! 232: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbde5a0a0  ! 237: SAVE_I	save	%r22, 0x0001, %r30
T0_asi_reg_wr_9:
	mov	0x13, %r14
	.word 0xf6f38e40  ! 239: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb93d8000  ! 244: SRA_R	sra 	%r22, %r0, %r28
cpu_intr_0_21:
	setx	0x1f0102, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_16), 16, 16)) -> intp(0, 0, 29)
	.word 0xb3e460e6  ! 250: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_wr_10:
	mov	0x3c3, %r14
	.word 0xf2f389e0  ! 252: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_17), 16, 16)) -> intp(0, 0, 3f)
cpu_intr_0_22:
	setx	0x1e0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2254000  ! 259: SUB_R	sub 	%r21, %r0, %r25
	.word 0xbf480000  ! 260: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
T0_asi_reg_rd_7:
	mov	0x22, %r14
	.word 0xf2db8400  ! 261: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_0_23:
	setx	0x1e012a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_11:
	mov	0x16, %r14
	.word 0xfef38e80  ! 268: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb7e5c000  ! 271: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_24:
	setx	0x1c003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5616c  ! 277: SAVE_I	save	%r21, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb02d4000  ! 280: ANDN_R	andn 	%r21, %r0, %r24
T0_asi_reg_wr_12:
	mov	0x0, %r14
	.word 0xf2f38400  ! 281: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb29c0000  ! 283: XORcc_R	xorcc 	%r16, %r0, %r25
cpu_intr_0_25:
	setx	0x1e0333, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_26:
	setx	0x1d0339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 290: SAVE_R	save	%r16, %r0, %r28
iob_intr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_18), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_wr_13:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 293: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_14:
	mov	0x2c, %r14
	.word 0xf0f38e40  ! 295: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_19), 16, 16)) -> intp(0, 0, 2)
	.word 0xb9e520a4  ! 297: SAVE_I	save	%r20, 0x0001, %r28
iob_intr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_20), 16, 16)) -> intp(0, 0, 23)
T0_asi_reg_rd_8:
	mov	0x3c2, %r14
	.word 0xf6db8e40  ! 299: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_21), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_rd_9:
	mov	0x2f, %r14
	.word 0xf8db8400  ! 302: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_0_27:
	setx	0x1f0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1d8000  ! 304: XOR_R	xor 	%r22, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_10:
	mov	0x33, %r14
	.word 0xf6db89e0  ! 307: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e4e113  ! 312: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb3e48000  ! 314: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_28:
	setx	0x1e0011, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_11:
	mov	0x0, %r14
	.word 0xfedb89e0  ! 318: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_22), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_wr_15:
	mov	0xa, %r14
	.word 0xf6f389e0  ! 323: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbe84a18d  ! 327: ADDcc_I	addcc 	%r18, 0x018d, %r31
iob_intr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_23), 16, 16)) -> intp(0, 0, 3)
T0_asi_reg_rd_12:
	mov	0x2, %r14
	.word 0xfedb8400  ! 332: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_24), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb1e4e115  ! 336: SAVE_I	save	%r19, 0x0001, %r24
iob_intr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_25), 16, 16)) -> intp(0, 0, 3)
	.word 0xb7e5204c  ! 340: SAVE_I	save	%r20, 0x0001, %r27
T0_asi_reg_rd_13:
	mov	0x38, %r14
	.word 0xf0db8e40  ! 342: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_wr_16:
	mov	0x20, %r14
	.word 0xf6f389e0  ! 346: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T0_asi_reg_rd_14:
	mov	0x25, %r14
	.word 0xfcdb8e40  ! 347: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb9e4e023  ! 349: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_rd_15:
	mov	0x3c8, %r14
	.word 0xf8db89e0  ! 351: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb3e4a1fb  ! 354: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb2052052  ! 355: ADD_I	add 	%r20, 0x0052, %r25
	.word 0xbbe42198  ! 356: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_rd_16:
	mov	0x2f, %r14
	.word 0xf0db8e40  ! 357: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbde5e01a  ! 359: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_wr_17:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 360: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_wr_18:
	mov	0x0, %r14
	.word 0xf6f38e80  ! 362: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_19:
	mov	0x12, %r14
	.word 0xf8f384a0  ! 367: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T0_asi_reg_wr_20:
	mov	0x1, %r14
	.word 0xf0f384a0  ! 371: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbbe5a011  ! 372: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e4e154  ! 374: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_wr_21:
	mov	0x3c6, %r14
	.word 0xf0f389e0  ! 380: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_26), 16, 16)) -> intp(0, 0, 11)
	.word 0xbcb5c000  ! 382: SUBCcc_R	orncc 	%r23, %r0, %r30
iob_intr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_27), 16, 16)) -> intp(0, 0, 2c)
cpu_intr_0_29:
	setx	0x1c0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe58000  ! 393: SAVE_R	save	%r22, %r0, %r31
	.word 0xb1e50000  ! 394: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_28), 16, 16)) -> intp(0, 0, 6)
	.word 0xb5e50000  ! 398: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_29), 16, 16)) -> intp(0, 0, 19)
iob_intr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_30), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_31), 16, 16)) -> intp(0, 0, 1d)
T0_asi_reg_wr_22:
	mov	0x3c6, %r14
	.word 0xfef38e40  ! 403: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_rd_17:
	mov	0x1d, %r14
	.word 0xf8db8e40  ! 404: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_32), 16, 16)) -> intp(0, 0, 31)
	.word 0xb7e54000  ! 410: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_33), 16, 16)) -> intp(0, 0, 39)
	.word 0xbfe420b4  ! 413: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e40000  ! 416: SAVE_R	save	%r16, %r0, %r27
cpu_intr_0_30:
	setx	0x1f0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5600e  ! 419: SAVE_I	save	%r21, 0x0001, %r25
iob_intr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_34), 16, 16)) -> intp(0, 0, 26)
iob_intr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_35), 16, 16)) -> intp(0, 0, 23)
cpu_intr_0_31:
	setx	0x1c010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 428: SAVE_R	save	%r16, %r0, %r24
	.word 0xbde50000  ! 429: SAVE_R	save	%r20, %r0, %r30
	.word 0xb9e48000  ! 433: SAVE_R	save	%r18, %r0, %r28
	.word 0xb3e5e1f9  ! 435: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_rd_18:
	mov	0x1a, %r14
	.word 0xfedb8e80  ! 436: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_0_32:
	setx	0x1c0114, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_33:
	setx	0x1e033b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_36), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_37), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_38), 16, 16)) -> intp(0, 0, a)
iob_intr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_39), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_40), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_34:
	setx	0x1d022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e158  ! 457: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3e48000  ! 458: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_41), 16, 16)) -> intp(0, 0, 19)
	.word 0xbbe4c000  ! 460: SAVE_R	save	%r19, %r0, %r29
	.word 0xbb520000  ! 462: RDPR_PIL	<illegal instruction>
iob_intr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_42), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_rd_19:
	mov	0x2e, %r14
	.word 0xf6db8e40  ! 464: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb6844000  ! 465: ADDcc_R	addcc 	%r17, %r0, %r27
	.word 0xb32de001  ! 466: SLL_I	sll 	%r23, 0x0001, %r25
cpu_intr_0_35:
	setx	0x210334, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4c000  ! 469: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_36:
	setx	0x23003f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a1c4  ! 475: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_wr_23:
	mov	0x3c2, %r14
	.word 0xfcf38e40  ! 476: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbfe52155  ! 482: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1641800  ! 483: MOVcc_R	<illegal instruction>
	.word 0xb1e4c000  ! 485: SAVE_R	save	%r19, %r0, %r24
cpu_intr_0_37:
	setx	0x200124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_38:
	setx	0x200018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e40000  ! 490: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_43), 16, 16)) -> intp(0, 0, 20)
iob_intr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_44), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_45), 16, 16)) -> intp(0, 0, 21)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_39:
	setx	0x230127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba350000  ! 498: SUBC_R	orn 	%r20, %r0, %r29
	.word 0xb5e48000  ! 500: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_wr_24:
	mov	0x3c5, %r14
	.word 0xf8f38e40  ! 502: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb9e5a021  ! 504: SAVE_I	save	%r22, 0x0001, %r28
iob_intr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_46), 16, 16)) -> intp(0, 0, 8)
	.word 0xb7e5a13e  ! 507: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e4218a  ! 508: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbfe4204a  ! 511: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb49ca013  ! 513: XORcc_I	xorcc 	%r18, 0x0013, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x85942031  ! 516: WRPR_TSTATE_I	wrpr	%r16, 0x0031, %tstate
T0_asi_reg_rd_20:
	mov	0x8, %r14
	.word 0xf4db8e80  ! 520: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T0_asi_reg_wr_25:
	mov	0x2e, %r14
	.word 0xfcf384a0  ! 521: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
T0_asi_reg_wr_26:
	mov	0x2f, %r14
	.word 0xf4f38e40  ! 523: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_0_40:
	setx	0x210232, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_41:
	setx	0x220207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_42:
	setx	0x220336, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_27:
	mov	0x2c, %r14
	.word 0xf6f38e40  ! 530: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xba1d4000  ! 534: XOR_R	xor 	%r21, %r0, %r29
iob_intr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_47), 16, 16)) -> intp(0, 0, 6)
iob_intr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_48), 16, 16)) -> intp(0, 0, 5)
	.word 0xb7e48000  ! 538: SAVE_R	save	%r18, %r0, %r27
	.word 0xbfe4e07e  ! 539: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbd51c000  ! 542: RDPR_TL	<illegal instruction>
T0_asi_reg_rd_21:
	mov	0x1c, %r14
	.word 0xf6db84a0  ! 545: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_49), 16, 16)) -> intp(0, 0, 31)
	.word 0xbbe4212f  ! 547: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe520ae  ! 548: SAVE_I	save	%r20, 0x0001, %r31
cpu_intr_0_43:
	setx	0x210010, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_44:
	setx	0x22030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e54000  ! 553: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_45:
	setx	0x30103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_46:
	setx	0x23030f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_47:
	setx	0x200036, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_48:
	setx	0x230320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a143  ! 562: SAVE_I	save	%r18, 0x0001, %r29
iob_intr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_50), 16, 16)) -> intp(0, 0, 22)
iob_intr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_51), 16, 16)) -> intp(0, 0, 1c)
cpu_intr_0_49:
	setx	0x200217, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_52:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_52), 16, 16)) -> intp(0, 0, 22)
	.word 0xbfe4e0a2  ! 578: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_53:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_53), 16, 16)) -> intp(0, 0, 0)
	.word 0xb1e4c000  ! 582: SAVE_R	save	%r19, %r0, %r24
T0_asi_reg_wr_28:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 586: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb5e40000  ! 588: SAVE_R	save	%r16, %r0, %r26
	.word 0xb6050000  ! 590: ADD_R	add 	%r20, %r0, %r27
	.word 0xb3e46197  ! 597: SAVE_I	save	%r17, 0x0001, %r25
T0_asi_reg_wr_29:
	mov	0x38, %r14
	.word 0xfaf38e40  ! 598: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_54:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_54), 16, 16)) -> intp(0, 0, 1a)
cpu_intr_0_50:
	setx	0x22012a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_55:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_55), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_wr_30:
	mov	0xc, %r14
	.word 0xf2f38400  ! 605: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb7e4a072  ! 606: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_56:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_56), 16, 16)) -> intp(0, 0, 35)
	.word 0xb7e521a2  ! 609: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7e54000  ! 610: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_51:
	setx	0x230117, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_31:
	mov	0xf, %r14
	.word 0xf4f38e60  ! 612: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T0_asi_reg_wr_32:
	mov	0x28, %r14
	.word 0xfef38e60  ! 613: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb5e42067  ! 614: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_wr_33:
	mov	0xa, %r14
	.word 0xfcf38400  ! 615: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb3e54000  ! 616: SAVE_R	save	%r21, %r0, %r25
	.word 0xb1e520a3  ! 617: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe48000  ! 621: SAVE_R	save	%r18, %r0, %r29
	.word 0xb93c2001  ! 623: SRA_I	sra 	%r16, 0x0001, %r28
	.word 0xbfe42063  ! 624: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbfe48000  ! 625: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_rd_22:
	mov	0x38, %r14
	.word 0xfedb8e80  ! 626: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb7e40000  ! 627: SAVE_R	save	%r16, %r0, %r27
T0_asi_reg_wr_34:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 629: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_52:
	setx	0x22011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_23:
	mov	0x10, %r14
	.word 0xf2db8400  ! 639: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_0_53:
	setx	0x230320, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_54:
	setx	0x230303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4c000  ! 648: SAVE_R	save	%r19, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb9e56094  ! 651: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e50000  ! 653: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_57:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_57), 16, 16)) -> intp(0, 0, 38)
	.word 0xbfe5c000  ! 657: SAVE_R	save	%r23, %r0, %r31
	.word 0xb7e421aa  ! 658: SAVE_I	save	%r16, 0x0001, %r27
iob_intr_0_58:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_58), 16, 16)) -> intp(0, 0, e)
T0_asi_reg_rd_24:
	mov	0x2f, %r14
	.word 0xf2db8e40  ! 662: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb1e48000  ! 669: SAVE_R	save	%r18, %r0, %r24
cpu_intr_0_55:
	setx	0x220121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e44000  ! 676: SAVE_R	save	%r17, %r0, %r25
	.word 0xb1e5603f  ! 679: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_rd_25:
	mov	0x1e, %r14
	.word 0xfadb84a0  ! 680: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb5e52127  ! 681: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_59:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_59), 16, 16)) -> intp(0, 0, 39)
	.word 0xbde54000  ! 683: SAVE_R	save	%r21, %r0, %r30
	.word 0xb7345000  ! 685: SRLX_R	srlx	%r17, %r0, %r27
T0_asi_reg_wr_35:
	mov	0x26, %r14
	.word 0xf4f38e40  ! 689: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T0_asi_reg_wr_36:
	mov	0x29, %r14
	.word 0xf2f38400  ! 690: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbde58000  ! 693: SAVE_R	save	%r22, %r0, %r30
	.word 0xb3e421d6  ! 694: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe421bb  ! 695: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb03de1cf  ! 697: XNOR_I	xnor 	%r23, 0x01cf, %r24
	.word 0xb1e5a18d  ! 701: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_rd_26:
	mov	0x1b, %r14
	.word 0xfedb8e60  ! 703: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbbe5c000  ! 704: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_60:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_60), 16, 16)) -> intp(0, 0, 23)
	.word 0xb0bcc000  ! 706: XNORcc_R	xnorcc 	%r19, %r0, %r24
	.word 0xb3e40000  ! 708: SAVE_R	save	%r16, %r0, %r25
iob_intr_0_61:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_61), 16, 16)) -> intp(0, 0, 21)
	.word 0xb52d6001  ! 714: SLL_I	sll 	%r21, 0x0001, %r26
iob_intr_0_62:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_62), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_rd_27:
	mov	0xa, %r14
	.word 0xf6db84a0  ! 717: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T0_asi_reg_rd_28:
	mov	0x3, %r14
	.word 0xfcdb84a0  ! 718: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_0_63:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_63), 16, 16)) -> intp(0, 0, 36)
	.word 0xbbe4c000  ! 721: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_rd_29:
	mov	0x3c6, %r14
	.word 0xf2db8e60  ! 722: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_0_56:
	setx	0x21012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_57:
	setx	0x220207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb534d000  ! 728: SRLX_R	srlx	%r19, %r0, %r26
	.word 0xbfe4c000  ! 729: SAVE_R	save	%r19, %r0, %r31
	.word 0xb9e460fd  ! 733: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe421af  ! 734: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe58000  ! 735: SAVE_R	save	%r22, %r0, %r31
cpu_intr_0_58:
	setx	0x21011d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_64:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_64), 16, 16)) -> intp(0, 0, 10)
	.word 0xb7e5e1a8  ! 742: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb1e521c1  ! 743: SAVE_I	save	%r20, 0x0001, %r24
T0_asi_reg_rd_30:
	mov	0x19, %r14
	.word 0xfadb89e0  ! 745: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xba340000  ! 747: ORN_R	orn 	%r16, %r0, %r29
	.word 0xbde50000  ! 748: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_59:
	setx	0x200112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_65:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_65), 16, 16)) -> intp(0, 0, 37)
	.word 0xb5e48000  ! 753: SAVE_R	save	%r18, %r0, %r26
	.word 0xb22c8000  ! 754: ANDN_R	andn 	%r18, %r0, %r25
	.word 0xbde48000  ! 756: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_rd_31:
	mov	0x3c3, %r14
	.word 0xfedb84a0  ! 757: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T0_asi_reg_rd_32:
	mov	0x3c1, %r14
	.word 0xf6db84a0  ! 758: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_0_66:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_66), 16, 16)) -> intp(0, 0, a)
T0_asi_reg_rd_33:
	mov	0x2c, %r14
	.word 0xfedb89e0  ! 762: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_0_60:
	setx	0x210326, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_61:
	setx	0x200036, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_37:
	mov	0x29, %r14
	.word 0xf6f389e0  ! 771: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_0_67:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_67), 16, 16)) -> intp(0, 0, 0)
cpu_intr_0_62:
	setx	0x21032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe46170  ! 776: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_68:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_68), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb9e54000  ! 779: SAVE_R	save	%r21, %r0, %r28
T0_asi_reg_rd_34:
	mov	0x12, %r14
	.word 0xf6db8e40  ! 780: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_0_69:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_69), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_63:
	setx	0x210009, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_70:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_70), 16, 16)) -> intp(0, 0, 3b)
cpu_intr_0_64:
	setx	0x200034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e560e7  ! 790: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7e5a11c  ! 791: SAVE_I	save	%r22, 0x0001, %r27
cpu_intr_0_65:
	setx	0x210003, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_38:
	mov	0x21, %r14
	.word 0xf8f38e60  ! 803: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_0_71:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_71), 16, 16)) -> intp(0, 0, 2)
cpu_intr_0_66:
	setx	0x230114, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_35:
	mov	0x17, %r14
	.word 0xf6db8e60  ! 814: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T0_asi_reg_wr_39:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 815: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbbe4e1c5  ! 817: SAVE_I	save	%r19, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbbe421af  ! 820: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_rd_36:
	mov	0x32, %r14
	.word 0xfcdb84a0  ! 822: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_0_72:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_72), 16, 16)) -> intp(0, 0, a)
	.word 0xbfe50000  ! 824: SAVE_R	save	%r20, %r0, %r31
	.word 0xbab44000  ! 826: ORNcc_R	orncc 	%r17, %r0, %r29
cpu_intr_0_67:
	setx	0x20010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5208a  ! 833: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb495c000  ! 834: ORcc_R	orcc 	%r23, %r0, %r26
	.word 0xb1341000  ! 835: SRLX_R	srlx	%r16, %r0, %r24
	.word 0xb7e4e130  ! 837: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb3e48000  ! 838: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_wr_40:
	mov	0x3c7, %r14
	.word 0xf6f38e60  ! 839: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb9e44000  ! 841: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_wr_41:
	mov	0x3c3, %r14
	.word 0xf2f38400  ! 844: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_0_73:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_73), 16, 16)) -> intp(0, 0, 21)
	.word 0xbfe5200a  ! 846: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbde4e022  ! 847: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_rd_37:
	mov	0x27, %r14
	.word 0xf8db84a0  ! 850: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_0_74:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_74), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_rd_38:
	mov	0x3c5, %r14
	.word 0xf0db8e60  ! 854: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb625c000  ! 855: SUB_R	sub 	%r23, %r0, %r27
cpu_intr_0_68:
	setx	0x20012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe48000  ! 858: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_wr_42:
	mov	0x3c1, %r14
	.word 0xf2f38e80  ! 863: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb4b4c000  ! 865: SUBCcc_R	orncc 	%r19, %r0, %r26
cpu_intr_0_69:
	setx	0x138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde44000  ! 874: SAVE_R	save	%r17, %r0, %r30
	.word 0xb9e54000  ! 875: SAVE_R	save	%r21, %r0, %r28
iob_intr_0_75:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_75), 16, 16)) -> intp(0, 0, 6)
	.word 0xb9e58000  ! 879: SAVE_R	save	%r22, %r0, %r28
cpu_intr_0_70:
	setx	0x200134, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_76:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_76), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbb345000  ! 884: SRLX_R	srlx	%r17, %r0, %r29
T0_asi_reg_wr_43:
	mov	0x23, %r14
	.word 0xf2f38e80  ! 887: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T0_asi_reg_rd_39:
	mov	0x3c0, %r14
	.word 0xf2db89e0  ! 888: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbbe4c000  ! 890: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_71:
	setx	0x20013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab4e112  ! 894: ORNcc_I	orncc 	%r19, 0x0112, %r29
	.word 0xb9e5c000  ! 895: SAVE_R	save	%r23, %r0, %r28
	.word 0xb9e52097  ! 897: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_72:
	setx	0x230020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e561bc  ! 906: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe52063  ! 908: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7e4609b  ! 910: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb5e50000  ! 911: SAVE_R	save	%r20, %r0, %r26
	.word 0xbde4a082  ! 912: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_wr_44:
	mov	0x29, %r14
	.word 0xf4f38400  ! 913: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xb5e56063  ! 920: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9e4a148  ! 921: SAVE_I	save	%r18, 0x0001, %r28
cpu_intr_0_73:
	setx	0x240206, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e5c000  ! 925: SAVE_R	save	%r23, %r0, %r28
	.word 0xbfe44000  ! 927: SAVE_R	save	%r17, %r0, %r31
	.word 0xb7e4c000  ! 933: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_74:
	setx	0x24022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_77:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_77), 16, 16)) -> intp(0, 0, 3f)
	.word 0xbde50000  ! 943: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_wr_45:
	mov	0x34, %r14
	.word 0xf8f38400  ! 944: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_75:
	setx	0x270017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e52151  ! 951: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1e48000  ! 953: SAVE_R	save	%r18, %r0, %r24
	.word 0xbb343001  ! 954: SRLX_I	srlx	%r16, 0x0001, %r29
	.word 0xb1e44000  ! 955: SAVE_R	save	%r17, %r0, %r24
T0_asi_reg_rd_40:
	mov	0xd, %r14
	.word 0xfadb8e40  ! 956: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_78:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_78), 16, 16)) -> intp(0, 0, 20)
	.word 0xb9e4c000  ! 960: SAVE_R	save	%r19, %r0, %r28
cpu_intr_0_76:
	setx	0x240132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_77:
	setx	0x260233, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_46:
	mov	0x3c3, %r14
	.word 0xf6f38e80  ! 965: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbbe42046  ! 966: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e44000  ! 971: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_wr_47:
	mov	0x1f, %r14
	.word 0xf4f38e60  ! 972: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_0_78:
	setx	0x240304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_79:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_79), 16, 16)) -> intp(0, 0, 11)
	.word 0xbbe4c000  ! 977: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_rd_41:
	mov	0x32, %r14
	.word 0xf6db8e40  ! 978: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb4354000  ! 983: SUBC_R	orn 	%r21, %r0, %r26
	.word 0xbde58000  ! 985: SAVE_R	save	%r22, %r0, %r30
T0_asi_reg_wr_48:
	mov	0x3c0, %r14
	.word 0xf2f384a0  ! 986: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb5e48000  ! 987: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_79:
	setx	0x27001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5e0a3  ! 989: SAVE_I	save	%r23, 0x0001, %r28
T0_asi_reg_rd_42:
	mov	0x3c2, %r14
	.word 0xf4db8e40  ! 990: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb3e5e0a1  ! 994: SAVE_I	save	%r23, 0x0001, %r25
T0_asi_reg_wr_49:
	mov	0x9, %r14
	.word 0xfef38e40  ! 995: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb1e5e159  ! 996: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbcb4a0e5  ! 997: SUBCcc_I	orncc 	%r18, 0x00e5, %r30
	.word 0xba34e169  ! 998: ORN_I	orn 	%r19, 0x0169, %r29
	.word 0xbbe420ba  ! 1000: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbde48000  ! 1001: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_rd_43:
	mov	0x3c0, %r14
	.word 0xf4db89e0  ! 1005: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb3e58000  ! 1006: SAVE_R	save	%r22, %r0, %r25
	.word 0xbbe40000  ! 1007: SAVE_R	save	%r16, %r0, %r29
	.word 0xb9e520c6  ! 1008: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5e521fe  ! 1009: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb9e5e0dd  ! 1011: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb92d5000  ! 1012: SLLX_R	sllx	%r21, %r0, %r28
cpu_intr_0_80:
	setx	0x24003f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_80:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_80), 16, 16)) -> intp(0, 0, 35)
	.word 0xbeada017  ! 1018: ANDNcc_I	andncc 	%r22, 0x0017, %r31
	.word 0xbfe54000  ! 1023: SAVE_R	save	%r21, %r0, %r31
	.word 0xbde50000  ! 1024: SAVE_R	save	%r20, %r0, %r30
	.word 0xb5e44000  ! 1026: SAVE_R	save	%r17, %r0, %r26
	.word 0xbbe48000  ! 1027: SAVE_R	save	%r18, %r0, %r29
cpu_intr_0_81:
	setx	0x250139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf2d5000  ! 1031: SLLX_R	sllx	%r21, %r0, %r31
cpu_intr_0_82:
	setx	0x27033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_81:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_81), 16, 16)) -> intp(0, 0, 2)
iob_intr_0_82:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_82), 16, 16)) -> intp(0, 0, b)
	.word 0xbfe4e189  ! 1043: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_83:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_83), 16, 16)) -> intp(0, 0, 3f)
	.word 0xbbe421a5  ! 1046: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e40000  ! 1048: SAVE_R	save	%r16, %r0, %r27
	.word 0xb3e5a152  ! 1049: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e561e5  ! 1051: SAVE_I	save	%r21, 0x0001, %r26
T0_asi_reg_rd_44:
	mov	0x3c1, %r14
	.word 0xf8db89e0  ! 1052: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb3e5a119  ! 1054: SAVE_I	save	%r22, 0x0001, %r25
iob_intr_0_84:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_84), 16, 16)) -> intp(0, 0, 1f)
cpu_intr_0_83:
	setx	0x270215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 1058: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_84:
	setx	0x25022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 1060: SAVE_R	save	%r20, %r0, %r30
iob_intr_0_85:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_85), 16, 16)) -> intp(0, 0, 3e)
T0_asi_reg_rd_45:
	mov	0x20, %r14
	.word 0xf4db89e0  ! 1062: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_0_86:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_86), 16, 16)) -> intp(0, 0, 22)
	.word 0xb81c0000  ! 1068: XOR_R	xor 	%r16, %r0, %r28
cpu_intr_0_85:
	setx	0x26013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e1a7  ! 1074: SAVE_I	save	%r19, 0x0001, %r29
cpu_intr_0_86:
	setx	0x27031c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_87:
	setx	0x250214, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_50:
	mov	0x3c0, %r14
	.word 0xf8f38e80  ! 1079: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xb4b54000  ! 1080: ORNcc_R	orncc 	%r21, %r0, %r26
iob_intr_0_87:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_87), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_rd_46:
	mov	0x30, %r14
	.word 0xf2db89e0  ! 1082: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T0_asi_reg_wr_51:
	mov	0x14, %r14
	.word 0xf2f384a0  ! 1083: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbfe5608b  ! 1084: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_88:
	setx	0x260121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe50000  ! 1086: SAVE_R	save	%r20, %r0, %r31
cpu_intr_0_89:
	setx	0x250030, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_88:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_88), 16, 16)) -> intp(0, 0, 3b)
iob_intr_0_89:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_89), 16, 16)) -> intp(0, 0, 26)
cpu_intr_0_90:
	setx	0x26020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_90:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_90), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb9e40000  ! 1098: SAVE_R	save	%r16, %r0, %r28
	.word 0xb1e5608c  ! 1100: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb09de17d  ! 1101: XORcc_I	xorcc 	%r23, 0x017d, %r24
iob_intr_0_91:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_91), 16, 16)) -> intp(0, 0, 1b)
iob_intr_0_92:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_92), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbbe421d7  ! 1111: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe420b2  ! 1113: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb1e461e1  ! 1117: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbc25201c  ! 1118: SUB_I	sub 	%r20, 0x001c, %r30
	.word 0xb3e58000  ! 1120: SAVE_R	save	%r22, %r0, %r25
T0_asi_reg_rd_47:
	mov	0x4, %r14
	.word 0xf0db89e0  ! 1121: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T0_asi_reg_rd_48:
	mov	0x3c4, %r14
	.word 0xfadb8e40  ! 1122: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb7504000  ! 1124: RDPR_TNPC	<illegal instruction>
	.word 0xb8bc6043  ! 1131: XNORcc_I	xnorcc 	%r17, 0x0043, %r28
T0_asi_reg_rd_49:
	mov	0x3c5, %r14
	.word 0xfadb89e0  ! 1132: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_rd_50:
	mov	0x4, %r14
	.word 0xfcdb89e0  ! 1135: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T0_asi_reg_rd_51:
	mov	0x29, %r14
	.word 0xfedb84a0  ! 1136: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T0_asi_reg_wr_52:
	mov	0x13, %r14
	.word 0xf0f384a0  ! 1140: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbfe4a05b  ! 1145: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb045a180  ! 1147: ADDC_I	addc 	%r22, 0x0180, %r24
cpu_intr_0_91:
	setx	0x260010, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_92:
	setx	0x240301, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_53:
	mov	0x23, %r14
	.word 0xf2f384a0  ! 1152: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb5e4219b  ! 1158: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_rd_52:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 1160: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_0_93:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_93), 16, 16)) -> intp(0, 0, 1)
cpu_intr_0_93:
	setx	0x260005, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_54:
	mov	0x17, %r14
	.word 0xf2f38e60  ! 1167: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_0_94:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_94), 16, 16)) -> intp(0, 0, 10)
	.word 0xbeb5600d  ! 1178: SUBCcc_I	orncc 	%r21, 0x000d, %r31
T0_asi_reg_rd_53:
	mov	0x26, %r14
	.word 0xfcdb84a0  ! 1179: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T0_asi_reg_rd_54:
	mov	0x3c0, %r14
	.word 0xfedb8400  ! 1186: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb5e48000  ! 1187: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_94:
	setx	0x24031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_55:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 1190: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb5e461d8  ! 1193: SAVE_I	save	%r17, 0x0001, %r26
T0_asi_reg_wr_56:
	mov	0x14, %r14
	.word 0xf0f38e40  ! 1196: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_rd_55:
	mov	0x1e, %r14
	.word 0xf2db8e40  ! 1198: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_0_95:
	setx	0x27023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_96:
	setx	0x260015, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_95:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_95), 16, 16)) -> intp(0, 0, 1e)
T0_asi_reg_wr_57:
	mov	0x35, %r14
	.word 0xfcf38e40  ! 1205: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb9e4c000  ! 1209: SAVE_R	save	%r19, %r0, %r28
	.word 0xbfe58000  ! 1210: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_96:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_96), 16, 16)) -> intp(0, 0, 2)
	.word 0xbbe5e14f  ! 1213: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb8ac2035  ! 1214: ANDNcc_I	andncc 	%r16, 0x0035, %r28
iob_intr_0_97:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_97), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_97:
	setx	0x23, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe44000  ! 1220: SAVE_R	save	%r17, %r0, %r31
cpu_intr_0_98:
	setx	0x250101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb215c000  ! 1223: OR_R	or 	%r23, %r0, %r25
	.word 0xb2bce0b6  ! 1226: XNORcc_I	xnorcc 	%r19, 0x00b6, %r25
	.word 0xb3e58000  ! 1227: SAVE_R	save	%r22, %r0, %r25
	.word 0xb69c201d  ! 1231: XORcc_I	xorcc 	%r16, 0x001d, %r27
	.word 0xb7e520cd  ! 1233: SAVE_I	save	%r20, 0x0001, %r27
iob_intr_0_98:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_98), 16, 16)) -> intp(0, 0, 34)
T0_asi_reg_wr_58:
	mov	0x3c6, %r14
	.word 0xf2f38e80  ! 1237: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T0_asi_reg_wr_59:
	mov	0x3c4, %r14
	.word 0xf0f38e40  ! 1241: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb7e48000  ! 1243: SAVE_R	save	%r18, %r0, %r27
iob_intr_0_99:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_99), 16, 16)) -> intp(0, 0, 7)
	.word 0xb1e48000  ! 1249: SAVE_R	save	%r18, %r0, %r24
	.word 0xb5e50000  ! 1250: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_100:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_100), 16, 16)) -> intp(0, 0, 13)
cpu_intr_0_99:
	setx	0x250326, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_56:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 1255: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb9351000  ! 1256: SRLX_R	srlx	%r20, %r0, %r28
	.word 0xb5e44000  ! 1258: SAVE_R	save	%r17, %r0, %r26
iob_intr_0_101:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_101), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_wr_60:
	mov	0xd, %r14
	.word 0xf2f38e40  ! 1263: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb3e56119  ! 1265: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e58000  ! 1266: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_102:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_102), 16, 16)) -> intp(0, 0, 36)
	.word 0xba0de063  ! 1268: AND_I	and 	%r23, 0x0063, %r29
T0_asi_reg_rd_57:
	mov	0x14, %r14
	.word 0xfcdb8e40  ! 1274: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb5e42048  ! 1276: SAVE_I	save	%r16, 0x0001, %r26
T0_asi_reg_rd_58:
	mov	0x20, %r14
	.word 0xf6db8e40  ! 1277: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbbe4207b  ! 1278: SAVE_I	save	%r16, 0x0001, %r29
T0_asi_reg_wr_61:
	mov	0x28, %r14
	.word 0xf2f389e0  ! 1280: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_0_100:
	setx	0x270309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a1dc  ! 1284: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb295a17f  ! 1285: ORcc_I	orcc 	%r22, 0x017f, %r25
	.word 0xb3e50000  ! 1286: SAVE_R	save	%r20, %r0, %r25
	.word 0xbca5e10f  ! 1288: SUBcc_I	subcc 	%r23, 0x010f, %r30
	.word 0xb89d8000  ! 1290: XORcc_R	xorcc 	%r22, %r0, %r28
cpu_intr_0_101:
	setx	0x24010d, %g1, %o0
	ta	T_SEND_THRD_INTR
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
	.word 0xb43dc000  ! 1299: XNOR_R	xnor 	%r23, %r0, %r26
T0_asi_reg_wr_62:
	mov	0x3c2, %r14
	.word 0xfaf38e80  ! 1300: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_0_102:
	setx	0x240335, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_103:
	setx	0x27023a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_103:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_103), 16, 16)) -> intp(0, 0, 19)
iob_intr_0_104:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_104), 16, 16)) -> intp(0, 0, 2d)
T0_asi_reg_rd_59:
	mov	0x3c7, %r14
	.word 0xfcdb8400  ! 1306: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_0_105:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_105), 16, 16)) -> intp(0, 0, 36)
	.word 0xbc25603d  ! 1309: SUB_I	sub 	%r21, 0x003d, %r30
T0_asi_reg_rd_60:
	mov	0x3c8, %r14
	.word 0xfcdb8e80  ! 1310: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_0_106:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_106), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_61:
	mov	0x3c5, %r14
	.word 0xf4db8400  ! 1316: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_0_104:
	setx	0x270134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe48000  ! 1323: SAVE_R	save	%r18, %r0, %r29
cpu_intr_0_105:
	setx	0x26033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 1325: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_wr_63:
	mov	0x2b, %r14
	.word 0xfcf38e40  ! 1332: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbde46091  ! 1339: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e460e5  ! 1341: SAVE_I	save	%r17, 0x0001, %r27
cpu_intr_0_106:
	setx	0x26033e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_107:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_107), 16, 16)) -> intp(0, 0, 3f)
	.word 0xbfe44000  ! 1347: SAVE_R	save	%r17, %r0, %r31
	.word 0xb9e58000  ! 1348: SAVE_R	save	%r22, %r0, %r28
	.word 0xb80c0000  ! 1349: AND_R	and 	%r16, %r0, %r28
iob_intr_0_108:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_108), 16, 16)) -> intp(0, 0, 22)
cpu_intr_0_107:
	setx	0x24000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb93cf001  ! 1355: SRAX_I	srax	%r19, 0x0001, %r28
	.word 0xbbe58000  ! 1356: SAVE_R	save	%r22, %r0, %r29
iob_intr_0_109:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_109), 16, 16)) -> intp(0, 0, 9)
	.word 0xb6940000  ! 1361: ORcc_R	orcc 	%r16, %r0, %r27
iob_intr_0_110:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_110), 16, 16)) -> intp(0, 0, e)
iob_intr_0_111:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_111), 16, 16)) -> intp(0, 0, 16)
	.word 0xbbe44000  ! 1367: SAVE_R	save	%r17, %r0, %r29
cpu_intr_0_108:
	setx	0x24012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a187  ! 1372: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe58000  ! 1373: SAVE_R	save	%r22, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbea58000  ! 1376: SUBcc_R	subcc 	%r22, %r0, %r31
	.word 0xb2a40000  ! 1378: SUBcc_R	subcc 	%r16, %r0, %r25
	.word 0xb9e4e073  ! 1379: SAVE_I	save	%r19, 0x0001, %r28
T0_asi_reg_rd_62:
	mov	0x37, %r14
	.word 0xf4db8e80  ! 1382: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_0_112:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_112), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_wr_64:
	mov	0x3c5, %r14
	.word 0xf0f38e40  ! 1387: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbca4e13a  ! 1392: SUBcc_I	subcc 	%r19, 0x013a, %r30
iob_intr_0_113:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_113), 16, 16)) -> intp(0, 0, 28)
	.word 0xb5e48000  ! 1395: SAVE_R	save	%r18, %r0, %r26
cpu_intr_0_109:
	setx	0x2a022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_110:
	setx	0x2b001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e1a4  ! 1400: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_rd_63:
	mov	0x3c3, %r14
	.word 0xf4db89e0  ! 1404: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
T0_asi_reg_wr_65:
	mov	0x1b, %r14
	.word 0xf4f38e80  ! 1405: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_0_114:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_114), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb7e58000  ! 1410: SAVE_R	save	%r22, %r0, %r27
	.word 0xbbe4a120  ! 1411: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde4600b  ! 1412: SAVE_I	save	%r17, 0x0001, %r30
iob_intr_0_115:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_115), 16, 16)) -> intp(0, 0, 13)
	.word 0xb3e5c000  ! 1416: SAVE_R	save	%r23, %r0, %r25
cpu_intr_0_111:
	setx	0x2b0302, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_116:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_116), 16, 16)) -> intp(0, 0, 11)
	.word 0xb1e421e6  ! 1422: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e5e1a9  ! 1423: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7e4c000  ! 1425: SAVE_R	save	%r19, %r0, %r27
	.word 0xbfe5e185  ! 1426: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbfe5a194  ! 1427: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe50000  ! 1433: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_wr_66:
	mov	0x1e, %r14
	.word 0xf6f38e40  ! 1434: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_112:
	setx	0x2b0033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_117:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_117), 16, 16)) -> intp(0, 0, 24)
	.word 0xbc0461cc  ! 1440: ADD_I	add 	%r17, 0x01cc, %r30
cpu_intr_0_113:
	setx	0x2b022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e52022  ! 1444: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5e50000  ! 1445: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_118:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_118), 16, 16)) -> intp(0, 0, 19)
	.word 0x899521a5  ! 1450: WRPR_TICK_I	wrpr	%r20, 0x01a5, %tick
	.word 0xb1e4202e  ! 1454: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb69ce0fe  ! 1457: XORcc_I	xorcc 	%r19, 0x00fe, %r27
	.word 0xb485e157  ! 1458: ADDcc_I	addcc 	%r23, 0x0157, %r26
	.word 0xb3e42194  ! 1460: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_wr_67:
	mov	0x2d, %r14
	.word 0xfcf38e40  ! 1461: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbbe50000  ! 1463: SAVE_R	save	%r20, %r0, %r29
	.word 0xb9341000  ! 1464: SRLX_R	srlx	%r16, %r0, %r28
	.word 0xbbe5c000  ! 1466: SAVE_R	save	%r23, %r0, %r29
	.word 0xbc0d4000  ! 1468: AND_R	and 	%r21, %r0, %r30
T0_asi_reg_rd_64:
	mov	0x11, %r14
	.word 0xfcdb8400  ! 1469: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbbe4c000  ! 1472: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_rd_65:
	mov	0xa, %r14
	.word 0xf2db8e60  ! 1473: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_0_114:
	setx	0x2a013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb49c4000  ! 1476: XORcc_R	xorcc 	%r17, %r0, %r26
cpu_intr_0_115:
	setx	0x2a022c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_119:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_119), 16, 16)) -> intp(0, 0, 39)
	.word 0xb7e5e1e5  ! 1487: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbde4c000  ! 1489: SAVE_R	save	%r19, %r0, %r30
	.word 0xb0156011  ! 1490: OR_I	or 	%r21, 0x0011, %r24
	.word 0xbfe40000  ! 1492: SAVE_R	save	%r16, %r0, %r31
cpu_intr_0_116:
	setx	0x2a0236, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_68:
	mov	0x1a, %r14
	.word 0xfaf38400  ! 1498: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb1e50000  ! 1499: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_120:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_120), 16, 16)) -> intp(0, 0, 7)
	.word 0xbfe4611f  ! 1501: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1e44000  ! 1502: SAVE_R	save	%r17, %r0, %r24
	.word 0xbfe48000  ! 1503: SAVE_R	save	%r18, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbe45601c  ! 1506: ADDC_I	addc 	%r21, 0x001c, %r31
iob_intr_0_121:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_121), 16, 16)) -> intp(0, 0, 36)
T0_asi_reg_wr_69:
	mov	0xe, %r14
	.word 0xf0f389e0  ! 1509: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T0_asi_reg_wr_70:
	mov	0x3c1, %r14
	.word 0xf2f38e80  ! 1511: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T0_asi_reg_rd_66:
	mov	0x2d, %r14
	.word 0xfedb8400  ! 1514: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xbd3c7001  ! 1515: SRAX_I	srax	%r17, 0x0001, %r30
cpu_intr_0_117:
	setx	0x2a011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_71:
	mov	0x12, %r14
	.word 0xfef38e40  ! 1523: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb7e40000  ! 1524: SAVE_R	save	%r16, %r0, %r27
cpu_intr_0_118:
	setx	0x290230, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_72:
	mov	0x21, %r14
	.word 0xf8f38e80  ! 1528: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T0_asi_reg_rd_67:
	mov	0x32, %r14
	.word 0xfedb8e40  ! 1533: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_0_122:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_122), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_wr_73:
	mov	0x3c2, %r14
	.word 0xfaf38e80  ! 1537: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_wr_74:
	mov	0x3c3, %r14
	.word 0xfef384a0  ! 1540: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_0_119:
	setx	0x290334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_123:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_123), 16, 16)) -> intp(0, 0, 2b)
T0_asi_reg_rd_68:
	mov	0x13, %r14
	.word 0xfedb89e0  ! 1545: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
cpu_intr_0_120:
	setx	0x2a013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_124:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_124), 16, 16)) -> intp(0, 0, 3)
iob_intr_0_125:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_125), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_126:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_126), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb1e54000  ! 1556: SAVE_R	save	%r21, %r0, %r24
cpu_intr_0_121:
	setx	0x28010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_127:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_127), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbbe58000  ! 1560: SAVE_R	save	%r22, %r0, %r29
	.word 0xbbe40000  ! 1561: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_wr_75:
	mov	0x1d, %r14
	.word 0xfef38e40  ! 1562: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_0_128:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_128), 16, 16)) -> intp(0, 0, 36)
iob_intr_0_129:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_129), 16, 16)) -> intp(0, 0, 2d)
	.word 0xbfe48000  ! 1571: SAVE_R	save	%r18, %r0, %r31
	.word 0xb1e4e1ca  ! 1572: SAVE_I	save	%r19, 0x0001, %r24
iob_intr_0_130:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_130), 16, 16)) -> intp(0, 0, 22)
T0_asi_reg_wr_76:
	mov	0x37, %r14
	.word 0xf2f38e40  ! 1574: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb5e5a029  ! 1575: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_122:
	setx	0x280002, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_69:
	mov	0x19, %r14
	.word 0xf8db8400  ! 1579: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_0_123:
	setx	0x2b020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a07a  ! 1582: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_131:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_131), 16, 16)) -> intp(0, 0, a)
iob_intr_0_132:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_132), 16, 16)) -> intp(0, 0, 2f)
cpu_intr_0_124:
	setx	0x280315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_133:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_133), 16, 16)) -> intp(0, 0, 15)
	.word 0xb41d4000  ! 1597: XOR_R	xor 	%r21, %r0, %r26
	.word 0xbde56151  ! 1600: SAVE_I	save	%r21, 0x0001, %r30
cpu_intr_0_125:
	setx	0x2b0007, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_77:
	mov	0x14, %r14
	.word 0xfcf38e40  ! 1604: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_134:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_134), 16, 16)) -> intp(0, 0, 6)
cpu_intr_0_126:
	setx	0x280128, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_127:
	setx	0x2a022f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_78:
	mov	0x8, %r14
	.word 0xf8f384a0  ! 1611: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb9e4e14e  ! 1612: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb635c000  ! 1614: SUBC_R	orn 	%r23, %r0, %r27
cpu_intr_0_128:
	setx	0x290108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe58000  ! 1616: SAVE_R	save	%r22, %r0, %r31
	.word 0xb3e48000  ! 1617: SAVE_R	save	%r18, %r0, %r25
T0_asi_reg_rd_70:
	mov	0x28, %r14
	.word 0xf2db89e0  ! 1618: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xbc8d20fa  ! 1619: ANDcc_I	andcc 	%r20, 0x00fa, %r30
	.word 0xbde50000  ! 1625: SAVE_R	save	%r20, %r0, %r30
iob_intr_0_135:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_135), 16, 16)) -> intp(0, 0, 21)
	.word 0xb1e56066  ! 1628: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e40000  ! 1629: SAVE_R	save	%r16, %r0, %r24
cpu_intr_0_129:
	setx	0x2a0233, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e0ae  ! 1631: SAVE_I	save	%r23, 0x0001, %r26
T0_asi_reg_wr_79:
	mov	0x12, %r14
	.word 0xf4f384a0  ! 1632: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb1e561d5  ! 1633: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_rd_71:
	mov	0x2b, %r14
	.word 0xf6db8400  ! 1634: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_0_136:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_136), 16, 16)) -> intp(0, 0, 26)
	.word 0xbcb4e00d  ! 1636: SUBCcc_I	orncc 	%r19, 0x000d, %r30
	.word 0xbfe58000  ! 1641: SAVE_R	save	%r22, %r0, %r31
	.word 0xb1e40000  ! 1642: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_137:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_137), 16, 16)) -> intp(0, 0, 6)
	.word 0xbbe54000  ! 1646: SAVE_R	save	%r21, %r0, %r29
	.word 0xb7e44000  ! 1647: SAVE_R	save	%r17, %r0, %r27
iob_intr_0_138:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_138), 16, 16)) -> intp(0, 0, 30)
	.word 0xb1e4c000  ! 1651: SAVE_R	save	%r19, %r0, %r24
	.word 0xbb349000  ! 1652: SRLX_R	srlx	%r18, %r0, %r29
	.word 0xbde56181  ! 1654: SAVE_I	save	%r21, 0x0001, %r30
cpu_intr_0_130:
	setx	0x2a0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 1656: SAVE_R	save	%r19, %r0, %r25
cpu_intr_0_131:
	setx	0x2a0003, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_139:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_139), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_rd_72:
	mov	0x17, %r14
	.word 0xf0db89e0  ! 1660: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbfe40000  ! 1661: SAVE_R	save	%r16, %r0, %r31
	.word 0xb5e58000  ! 1663: SAVE_R	save	%r22, %r0, %r26
iob_intr_0_140:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_140), 16, 16)) -> intp(0, 0, 26)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbd2c8000  ! 1668: SLL_R	sll 	%r18, %r0, %r30
T0_asi_reg_rd_73:
	mov	0xc, %r14
	.word 0xf2db84a0  ! 1669: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_0_132:
	setx	0x280114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_141:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_141), 16, 16)) -> intp(0, 0, 38)
cpu_intr_0_133:
	setx	0x28021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e1dd  ! 1676: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe58000  ! 1678: SAVE_R	save	%r22, %r0, %r31
	.word 0xb4c461d0  ! 1679: ADDCcc_I	addccc 	%r17, 0x01d0, %r26
	.word 0xbde42069  ! 1680: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e4601b  ! 1682: SAVE_I	save	%r17, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_142:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_142), 16, 16)) -> intp(0, 0, 11)
iob_intr_0_143:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_143), 16, 16)) -> intp(0, 0, 3f)
T0_asi_reg_rd_74:
	mov	0x3c7, %r14
	.word 0xfedb8e60  ! 1687: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb1e40000  ! 1688: SAVE_R	save	%r16, %r0, %r24
iob_intr_0_144:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_144), 16, 16)) -> intp(0, 0, 36)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde5211d  ! 1694: SAVE_I	save	%r20, 0x0001, %r30
iob_intr_0_145:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_145), 16, 16)) -> intp(0, 0, 28)
cpu_intr_0_134:
	setx	0x2a0024, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_75:
	mov	0x3c1, %r14
	.word 0xf6db8e40  ! 1698: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbbe4e035  ! 1699: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb02d616e  ! 1700: ANDN_I	andn 	%r21, 0x016e, %r24
iob_intr_0_146:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_146), 16, 16)) -> intp(0, 0, 38)
	.word 0x83946051  ! 1706: WRPR_TNPC_I	wrpr	%r17, 0x0051, %tnpc
	.word 0xb5e40000  ! 1707: SAVE_R	save	%r16, %r0, %r26
T0_asi_reg_rd_76:
	mov	0x2e, %r14
	.word 0xf4db84a0  ! 1708: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T0_asi_reg_rd_77:
	mov	0x7, %r14
	.word 0xf2db89e0  ! 1713: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_0_147:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_147), 16, 16)) -> intp(0, 0, 25)
	.word 0xb9e461af  ! 1720: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb9e52014  ! 1722: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb42dc000  ! 1724: ANDN_R	andn 	%r23, %r0, %r26
	.word 0xb5e54000  ! 1725: SAVE_R	save	%r21, %r0, %r26
	.word 0xbfe5c000  ! 1727: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_wr_80:
	mov	0x9, %r14
	.word 0xfcf38e40  ! 1728: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_wr_81:
	mov	0x17, %r14
	.word 0xfcf38e40  ! 1731: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb6bc4000  ! 1736: XNORcc_R	xnorcc 	%r17, %r0, %r27
iob_intr_0_148:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_148), 16, 16)) -> intp(0, 0, 27)
T0_asi_reg_rd_78:
	mov	0x2b, %r14
	.word 0xfedb8400  ! 1739: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_0_149:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_149), 16, 16)) -> intp(0, 0, 20)
T0_asi_reg_wr_82:
	mov	0x22, %r14
	.word 0xfef38e80  ! 1743: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb7e4a149  ! 1744: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbf480000  ! 1747: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb7e50000  ! 1749: SAVE_R	save	%r20, %r0, %r27
	.word 0xbfe58000  ! 1750: SAVE_R	save	%r22, %r0, %r31
iob_intr_0_150:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_150), 16, 16)) -> intp(0, 0, 2c)
iob_intr_0_151:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_151), 16, 16)) -> intp(0, 0, 30)
	.word 0xb4b58000  ! 1755: ORNcc_R	orncc 	%r22, %r0, %r26
	.word 0xbde56092  ! 1756: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e5c000  ! 1758: SAVE_R	save	%r23, %r0, %r27
cpu_intr_0_135:
	setx	0x2a0321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 1760: SAVE_R	save	%r21, %r0, %r27
	.word 0xb5e48000  ! 1761: SAVE_R	save	%r18, %r0, %r26
	.word 0xbfe42099  ! 1763: SAVE_I	save	%r16, 0x0001, %r31
iob_intr_0_152:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_152), 16, 16)) -> intp(0, 0, 26)
	.word 0xb9e5e1ec  ! 1765: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_136:
	setx	0x2a0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0248000  ! 1768: SUB_R	sub 	%r18, %r0, %r24
	.word 0xb8bc8000  ! 1769: XNORcc_R	xnorcc 	%r18, %r0, %r28
T0_asi_reg_rd_79:
	mov	0x18, %r14
	.word 0xf6db84a0  ! 1771: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbde5614c  ! 1775: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbde40000  ! 1776: SAVE_R	save	%r16, %r0, %r30
cpu_intr_0_137:
	setx	0x290104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb035c000  ! 1780: SUBC_R	orn 	%r23, %r0, %r24
	.word 0xb5e50000  ! 1781: SAVE_R	save	%r20, %r0, %r26
	.word 0xbbe52110  ! 1782: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_rd_80:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 1783: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbfe420a1  ! 1784: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e4c000  ! 1785: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_wr_83:
	mov	0xe, %r14
	.word 0xf0f38e60  ! 1788: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xb5e5610d  ! 1790: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1e48000  ! 1792: SAVE_R	save	%r18, %r0, %r24
	.word 0xb3e52174  ! 1797: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_rd_81:
	mov	0x3c0, %r14
	.word 0xfedb8e80  ! 1799: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xbbe4c000  ! 1800: SAVE_R	save	%r19, %r0, %r29
	.word 0xbfe56150  ! 1801: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbbe4c000  ! 1802: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_138:
	setx	0x2b0335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4a0b5  ! 1805: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_rd_82:
	mov	0x23, %r14
	.word 0xfadb8e80  ! 1807: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb1e52137  ! 1808: SAVE_I	save	%r20, 0x0001, %r24
T0_asi_reg_rd_83:
	mov	0x1c, %r14
	.word 0xfedb8e60  ! 1809: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb5e44000  ! 1810: SAVE_R	save	%r17, %r0, %r26
cpu_intr_0_139:
	setx	0x280133, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_140:
	setx	0x2b0106, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_153:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_153), 16, 16)) -> intp(0, 0, 3)
iob_intr_0_154:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_154), 16, 16)) -> intp(0, 0, 24)
	.word 0xbfe420a8  ! 1824: SAVE_I	save	%r16, 0x0001, %r31
iob_intr_0_155:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_155), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb3e40000  ! 1827: SAVE_R	save	%r16, %r0, %r25
	.word 0xbeac8000  ! 1828: ANDNcc_R	andncc 	%r18, %r0, %r31
	.word 0xb2c40000  ! 1829: ADDCcc_R	addccc 	%r16, %r0, %r25
cpu_intr_0_141:
	setx	0x2e0208, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_84:
	mov	0x5, %r14
	.word 0xf0f38400  ! 1834: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xbde5e188  ! 1838: SAVE_I	save	%r23, 0x0001, %r30
T0_asi_reg_wr_85:
	mov	0xa, %r14
	.word 0xf4f38e40  ! 1839: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_0_156:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_156), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_rd_84:
	mov	0x3c5, %r14
	.word 0xfcdb8e80  ! 1841: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbde461dc  ! 1842: SAVE_I	save	%r17, 0x0001, %r30
T0_asi_reg_rd_85:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 1844: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T0_asi_reg_rd_86:
	mov	0x8, %r14
	.word 0xfedb8e40  ! 1848: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb9e40000  ! 1849: SAVE_R	save	%r16, %r0, %r28
	.word 0xb3e46104  ! 1851: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb48dc000  ! 1853: ANDcc_R	andcc 	%r23, %r0, %r26
cpu_intr_0_142:
	setx	0x2d0025, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_86:
	mov	0x2e, %r14
	.word 0xf4f389e0  ! 1856: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T0_asi_reg_rd_87:
	mov	0x8, %r14
	.word 0xf4db8400  ! 1860: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb1e50000  ! 1869: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_143:
	setx	0x2e000e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_144:
	setx	0x2e0204, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_145:
	setx	0x2e0305, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_146:
	setx	0x2c010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_87:
	mov	0xb, %r14
	.word 0xf8f384a0  ! 1883: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb494c000  ! 1884: ORcc_R	orcc 	%r19, %r0, %r26
	.word 0xbde4c000  ! 1886: SAVE_R	save	%r19, %r0, %r30
	.word 0xbde5e1f6  ! 1887: SAVE_I	save	%r23, 0x0001, %r30
cpu_intr_0_147:
	setx	0x2e033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe56001  ! 1893: SAVE_I	save	%r21, 0x0001, %r29
cpu_intr_0_148:
	setx	0x2d0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e40000  ! 1897: SAVE_R	save	%r16, %r0, %r26
cpu_intr_0_149:
	setx	0x2e0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4204f  ! 1903: SAVE_I	save	%r16, 0x0001, %r28
cpu_intr_0_150:
	setx	0x2c0331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4e1d8  ! 1908: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb9e461b6  ! 1909: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e420dc  ! 1912: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb2b46163  ! 1913: SUBCcc_I	orncc 	%r17, 0x0163, %r25
	.word 0xb7353001  ! 1915: SRLX_I	srlx	%r20, 0x0001, %r27
cpu_intr_0_151:
	setx	0x2f0037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe46173  ! 1917: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb7e50000  ! 1919: SAVE_R	save	%r20, %r0, %r27
	.word 0xb3e5e1c4  ! 1920: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb92cb001  ! 1923: SLLX_I	sllx	%r18, 0x0001, %r28
cpu_intr_0_152:
	setx	0x2f0022, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_153:
	setx	0x2e021b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_88:
	mov	0xd, %r14
	.word 0xf8db8e40  ! 1928: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_154:
	setx	0x2d0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe15a053  ! 1931: OR_I	or 	%r22, 0x0053, %r31
T0_asi_reg_rd_89:
	mov	0x3, %r14
	.word 0xf0db89e0  ! 1935: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb5e48000  ! 1936: SAVE_R	save	%r18, %r0, %r26
	.word 0x8f902002  ! 1937: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xb9e4a1c9  ! 1939: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe44000  ! 1943: SAVE_R	save	%r17, %r0, %r31
	.word 0xb12dc000  ! 1948: SLL_R	sll 	%r23, %r0, %r24
	.word 0xbde48000  ! 1949: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_157:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_157), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_155:
	setx	0x2e033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_90:
	mov	0x19, %r14
	.word 0xf0db8e40  ! 1960: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb3e50000  ! 1962: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_158:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_158), 16, 16)) -> intp(0, 0, 9)
	.word 0xbbe56099  ! 1965: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb77d4400  ! 1967: MOVR_R	movre	%r21, %r0, %r27
iob_intr_0_159:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_159), 16, 16)) -> intp(0, 0, 36)
	.word 0xbde4a1af  ! 1969: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e4c000  ! 1970: SAVE_R	save	%r19, %r0, %r26
iob_intr_0_160:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_160), 16, 16)) -> intp(0, 0, 39)
T0_asi_reg_wr_88:
	mov	0x3c0, %r14
	.word 0xfef38e40  ! 1974: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb5e58000  ! 1977: SAVE_R	save	%r22, %r0, %r26
T0_asi_reg_wr_89:
	mov	0x17, %r14
	.word 0xf2f38e40  ! 1979: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_161:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_161), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_rd_91:
	mov	0x3c5, %r14
	.word 0xfedb8e60  ! 1982: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb7340000  ! 1983: SRL_R	srl 	%r16, %r0, %r27
cpu_intr_0_156:
	setx	0x2f0304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e5c000  ! 1985: SAVE_R	save	%r23, %r0, %r28
iob_intr_0_162:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_162), 16, 16)) -> intp(0, 0, d)
T0_asi_reg_rd_92:
	mov	0xb, %r14
	.word 0xf6db84a0  ! 1987: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb8a5c000  ! 1988: SUBcc_R	subcc 	%r23, %r0, %r28
iob_intr_0_163:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_163), 16, 16)) -> intp(0, 0, b)
iob_intr_0_164:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_164), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_165:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_165), 16, 16)) -> intp(0, 0, b)
	.word 0xb9e40000  ! 1994: SAVE_R	save	%r16, %r0, %r28
cpu_intr_0_157:
	setx	0x2c0023, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_158:
	setx	0x2e001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb28d4000  ! 2005: ANDcc_R	andcc 	%r21, %r0, %r25
	.word 0xa1902000  ! 2006: WRPR_GL_I	wrpr	%r0, 0x0000, %-
T0_asi_reg_rd_93:
	mov	0x22, %r14
	.word 0xf2db8400  ! 2011: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
iob_intr_0_166:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_166), 16, 16)) -> intp(0, 0, 1b)
	.word 0xbfe5c000  ! 2013: SAVE_R	save	%r23, %r0, %r31
cpu_intr_0_159:
	setx	0x2c0011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_167:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_167), 16, 16)) -> intp(0, 0, 16)
T0_asi_reg_wr_90:
	mov	0x5, %r14
	.word 0xf8f38e80  ! 2019: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_0_168:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_168), 16, 16)) -> intp(0, 0, 2)
cpu_intr_0_160:
	setx	0x2d022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_169:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_169), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_161:
	setx	0x2d032a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_94:
	mov	0x14, %r14
	.word 0xf0db89e0  ! 2028: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb8048000  ! 2029: ADD_R	add 	%r18, %r0, %r28
	.word 0xb52db001  ! 2030: SLLX_I	sllx	%r22, 0x0001, %r26
iob_intr_0_170:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_170), 16, 16)) -> intp(0, 0, 25)
iob_intr_0_171:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_171), 16, 16)) -> intp(0, 0, 3e)
T0_asi_reg_rd_95:
	mov	0x3c6, %r14
	.word 0xfedb8400  ! 2037: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T0_asi_reg_rd_96:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 2038: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbd2d6001  ! 2040: SLL_I	sll 	%r21, 0x0001, %r30
	.word 0xb9e52029  ! 2041: SAVE_I	save	%r20, 0x0001, %r28
T0_asi_reg_rd_97:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 2044: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T0_asi_reg_rd_98:
	mov	0x1b, %r14
	.word 0xf6db84a0  ! 2045: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb3e52196  ! 2046: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_wr_91:
	mov	0x3c4, %r14
	.word 0xf2f389e0  ! 2049: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T0_asi_reg_rd_99:
	mov	0x3c5, %r14
	.word 0xf2db8e40  ! 2050: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb5e521cd  ! 2051: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_162:
	setx	0x2c0222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde42141  ! 2053: SAVE_I	save	%r16, 0x0001, %r30
cpu_intr_0_163:
	setx	0x2e033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_100:
	mov	0x1b, %r14
	.word 0xf8db8e40  ! 2055: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb9e44000  ! 2056: SAVE_R	save	%r17, %r0, %r28
	.word 0xbfe4e14a  ! 2057: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbde5205b  ! 2058: SAVE_I	save	%r20, 0x0001, %r30
T0_asi_reg_wr_92:
	mov	0x3c0, %r14
	.word 0xfaf38e60  ! 2061: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
cpu_intr_0_164:
	setx	0x2e0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e521f0  ! 2065: SAVE_I	save	%r20, 0x0001, %r27
cpu_intr_0_165:
	setx	0x2e031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_101:
	mov	0x35, %r14
	.word 0xfcdb8e40  ! 2067: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T0_asi_reg_rd_102:
	mov	0x12, %r14
	.word 0xfcdb8e40  ! 2068: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb7e4e132  ! 2069: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e48000  ! 2072: SAVE_R	save	%r18, %r0, %r27
	.word 0xb08ce0f4  ! 2073: ANDcc_I	andcc 	%r19, 0x00f4, %r24
	.word 0xbde5a1c2  ! 2074: SAVE_I	save	%r22, 0x0001, %r30
cpu_intr_0_166:
	setx	0x2d0226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_167:
	setx	0x2c0229, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_93:
	mov	0x8, %r14
	.word 0xf4f38400  ! 2078: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_0_168:
	setx	0x2c0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4c000  ! 2085: SAVE_R	save	%r19, %r0, %r28
	.word 0xb9e4a081  ! 2086: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_172:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_172), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_wr_94:
	mov	0x31, %r14
	.word 0xfcf384a0  ! 2091: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xba840000  ! 2092: ADDcc_R	addcc 	%r16, %r0, %r29
T0_asi_reg_rd_103:
	mov	0x1, %r14
	.word 0xf0db8400  ! 2093: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb1e421bf  ! 2094: SAVE_I	save	%r16, 0x0001, %r24
cpu_intr_0_169:
	setx	0x2d013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e40000  ! 2097: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_wr_95:
	mov	0x2f, %r14
	.word 0xfef38e60  ! 2098: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb3e4c000  ! 2100: SAVE_R	save	%r19, %r0, %r25
	.word 0xbbe5a126  ! 2102: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_rd_104:
	mov	0x19, %r14
	.word 0xfedb8e60  ! 2103: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_0_173:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_173), 16, 16)) -> intp(0, 0, f)
	.word 0xb4150000  ! 2106: OR_R	or 	%r20, %r0, %r26
	.word 0xbc8da1f2  ! 2107: ANDcc_I	andcc 	%r22, 0x01f2, %r30
T0_asi_reg_wr_96:
	mov	0x3c2, %r14
	.word 0xf4f38e80  ! 2108: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_0_170:
	setx	0x2c0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe54000  ! 2110: SAVE_R	save	%r21, %r0, %r29
	.word 0xb150c000  ! 2112: RDPR_TT	<illegal instruction>
	.word 0xb3e48000  ! 2113: SAVE_R	save	%r18, %r0, %r25
	.word 0xb3e48000  ! 2115: SAVE_R	save	%r18, %r0, %r25
	.word 0xb9e4c000  ! 2120: SAVE_R	save	%r19, %r0, %r28
	.word 0xb9e4e067  ! 2121: SAVE_I	save	%r19, 0x0001, %r28
iob_intr_0_174:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_174), 16, 16)) -> intp(0, 0, 3b)
T0_asi_reg_rd_105:
	mov	0x3c6, %r14
	.word 0xfedb8400  ! 2123: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb9e4c000  ! 2126: SAVE_R	save	%r19, %r0, %r28
T0_asi_reg_rd_106:
	mov	0x34, %r14
	.word 0xf0db89e0  ! 2128: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_97:
	mov	0x11, %r14
	.word 0xf4f38400  ! 2132: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_0_175:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_175), 16, 16)) -> intp(0, 0, 28)
	.word 0xb7e54000  ! 2135: SAVE_R	save	%r21, %r0, %r27
	.word 0xbbe5a128  ! 2136: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e5e1d5  ! 2137: SAVE_I	save	%r23, 0x0001, %r28
cpu_intr_0_171:
	setx	0x2c0001, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_172:
	setx	0x2e0237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_173:
	setx	0x2c0237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_174:
	setx	0x2e020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a086  ! 2143: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbbe5c000  ! 2144: SAVE_R	save	%r23, %r0, %r29
	.word 0xbc2ca166  ! 2146: ANDN_I	andn 	%r18, 0x0166, %r30
cpu_intr_0_175:
	setx	0x2f001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe24c000  ! 2151: SUB_R	sub 	%r19, %r0, %r31
	.word 0xbde46148  ! 2152: SAVE_I	save	%r17, 0x0001, %r30
T0_asi_reg_wr_98:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 2157: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_176:
	setx	0x2e0011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe48000  ! 2163: SAVE_R	save	%r18, %r0, %r31
T0_asi_reg_rd_107:
	mov	0x24, %r14
	.word 0xf6db84a0  ! 2164: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xbbe40000  ! 2165: SAVE_R	save	%r16, %r0, %r29
cpu_intr_0_177:
	setx	0x2e0006, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_178:
	setx	0x2d0337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e54000  ! 2178: SAVE_R	save	%r21, %r0, %r25
cpu_intr_0_179:
	setx	0x2e0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf643801  ! 2180: MOVcc_I	<illegal instruction>
	.word 0xb5e52146  ! 2181: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbbe5a0f0  ! 2182: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbfe58000  ! 2185: SAVE_R	save	%r22, %r0, %r31
T0_asi_reg_wr_99:
	mov	0x3c1, %r14
	.word 0xf4f384a0  ! 2188: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_0_180:
	setx	0x2d0203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e420f0  ! 2195: SAVE_I	save	%r16, 0x0001, %r28
T0_asi_reg_wr_100:
	mov	0x3c8, %r14
	.word 0xf2f38400  ! 2196: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T0_asi_reg_rd_108:
	mov	0x24, %r14
	.word 0xfedb84a0  ! 2198: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_0_176:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_176), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbfe5a1d8  ! 2203: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e54000  ! 2206: SAVE_R	save	%r21, %r0, %r25
T0_asi_reg_wr_101:
	mov	0x19, %r14
	.word 0xf2f38e40  ! 2207: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_rd_109:
	mov	0x32, %r14
	.word 0xf6db84a0  ! 2211: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb9e44000  ! 2218: SAVE_R	save	%r17, %r0, %r28
iob_intr_0_177:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_177), 16, 16)) -> intp(0, 0, c)
T0_asi_reg_rd_110:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 2220: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_0_178:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_178), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_179:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_179), 16, 16)) -> intp(0, 0, 14)
T0_asi_reg_rd_111:
	mov	0x3c1, %r14
	.word 0xfedb84a0  ! 2226: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T0_asi_reg_rd_112:
	mov	0x17, %r14
	.word 0xfcdb8e40  ! 2229: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb5e50000  ! 2230: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_180:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_180), 16, 16)) -> intp(0, 0, 32)
	.word 0xbd2c1000  ! 2234: SLLX_R	sllx	%r16, %r0, %r30
	.word 0xb935a001  ! 2236: SRL_I	srl 	%r22, 0x0001, %r28
	.word 0xb9e52124  ! 2237: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_181:
	setx	0x2f0101, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_181:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_181), 16, 16)) -> intp(0, 0, 20)
iob_intr_0_182:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_182), 16, 16)) -> intp(0, 0, 2c)
T0_asi_reg_rd_113:
	mov	0x3c0, %r14
	.word 0xf4db89e0  ! 2242: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_0_182:
	setx	0x2d0319, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_183:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_183), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb7e5a160  ! 2248: SAVE_I	save	%r22, 0x0001, %r27
T0_asi_reg_wr_102:
	mov	0x3c6, %r14
	.word 0xf8f38e60  ! 2249: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_0_184:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_184), 16, 16)) -> intp(0, 0, 3e)
cpu_intr_0_183:
	setx	0x2e003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 2254: SAVE_R	save	%r20, %r0, %r24
	.word 0xb205a1bb  ! 2255: ADD_I	add 	%r22, 0x01bb, %r25
iob_intr_0_185:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_185), 16, 16)) -> intp(0, 0, 38)
iob_intr_0_186:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_186), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_187:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_187), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb7359000  ! 2268: SRLX_R	srlx	%r22, %r0, %r27
	.word 0xb5e5e13c  ! 2271: SAVE_I	save	%r23, 0x0001, %r26
cpu_intr_0_184:
	setx	0x31011f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_103:
	mov	0x1f, %r14
	.word 0xfcf38e40  ! 2273: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb9e56100  ! 2275: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e520af  ! 2276: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb01561dd  ! 2277: OR_I	or 	%r21, 0x01dd, %r24
	.word 0xba352009  ! 2280: ORN_I	orn 	%r20, 0x0009, %r29
	.word 0xb9e4a187  ! 2281: SAVE_I	save	%r18, 0x0001, %r28
T0_asi_reg_wr_104:
	mov	0xb, %r14
	.word 0xf4f38e40  ! 2285: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb4c4216b  ! 2287: ADDCcc_I	addccc 	%r16, 0x016b, %r26
T0_asi_reg_rd_114:
	mov	0x24, %r14
	.word 0xf8db8e60  ! 2290: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T0_asi_reg_rd_115:
	mov	0x36, %r14
	.word 0xfadb84a0  ! 2291: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
T0_asi_reg_wr_105:
	mov	0x3c1, %r14
	.word 0xfaf389e0  ! 2295: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_0_188:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_188), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_rd_116:
	mov	0x2f, %r14
	.word 0xf2db8e60  ! 2297: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb5e5213c  ! 2304: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_185:
	setx	0x300313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e079  ! 2307: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbfe4a01c  ! 2308: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb0c44000  ! 2310: ADDCcc_R	addccc 	%r17, %r0, %r24
cpu_intr_0_186:
	setx	0x330234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde42046  ! 2313: SAVE_I	save	%r16, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbc440000  ! 2319: ADDC_R	addc 	%r16, %r0, %r30
T0_asi_reg_rd_117:
	mov	0x3c7, %r14
	.word 0xf2db8e40  ! 2321: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb3e44000  ! 2322: SAVE_R	save	%r17, %r0, %r25
	.word 0xb21ce0ca  ! 2324: XOR_I	xor 	%r19, 0x00ca, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xba84a10f  ! 2327: ADDcc_I	addcc 	%r18, 0x010f, %r29
T0_asi_reg_wr_106:
	mov	0x3c8, %r14
	.word 0xfef38e40  ! 2329: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb1e5c000  ! 2330: SAVE_R	save	%r23, %r0, %r24
	.word 0xbfe5e125  ! 2331: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e50000  ! 2338: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_189:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_189), 16, 16)) -> intp(0, 0, 32)
iob_intr_0_190:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_190), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_rd_118:
	mov	0x19, %r14
	.word 0xfadb8e40  ! 2341: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb1e4a037  ! 2343: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_187:
	setx	0x33030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_119:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 2345: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbf351000  ! 2349: SRLX_R	srlx	%r20, %r0, %r31
	.word 0xbbe40000  ! 2351: SAVE_R	save	%r16, %r0, %r29
iob_intr_0_191:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_191), 16, 16)) -> intp(0, 0, 8)
	.word 0xa1902000  ! 2354: WRPR_GL_I	wrpr	%r0, 0x0000, %-
cpu_intr_0_188:
	setx	0x33031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba24a0db  ! 2359: SUB_I	sub 	%r18, 0x00db, %r29
iob_intr_0_192:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_192), 16, 16)) -> intp(0, 0, 12)
	.word 0xbca50000  ! 2362: SUBcc_R	subcc 	%r20, %r0, %r30
iob_intr_0_193:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_193), 16, 16)) -> intp(0, 0, 32)
	.word 0xbfe4e0d4  ! 2365: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_rd_120:
	mov	0x14, %r14
	.word 0xf4db84a0  ! 2366: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_0_194:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_194), 16, 16)) -> intp(0, 0, 12)
	.word 0xb5e5c000  ! 2368: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_195:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_195), 16, 16)) -> intp(0, 0, 1e)
cpu_intr_0_189:
	setx	0x30023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_107:
	mov	0x34, %r14
	.word 0xf0f38e40  ! 2374: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbde48000  ! 2376: SAVE_R	save	%r18, %r0, %r30
	.word 0x8d95a0bf  ! 2380: WRPR_PSTATE_I	wrpr	%r22, 0x00bf, %pstate
iob_intr_0_196:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_196), 16, 16)) -> intp(0, 0, 21)
	.word 0xb9e54000  ! 2384: SAVE_R	save	%r21, %r0, %r28
	.word 0xb1e4601e  ! 2386: SAVE_I	save	%r17, 0x0001, %r24
T0_asi_reg_rd_121:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 2388: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_0_190:
	setx	0x310118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e460d7  ! 2390: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbbe48000  ! 2391: SAVE_R	save	%r18, %r0, %r29
T0_asi_reg_wr_108:
	mov	0x1b, %r14
	.word 0xf2f38e40  ! 2392: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbbe560fb  ! 2393: SAVE_I	save	%r21, 0x0001, %r29
T0_asi_reg_rd_122:
	mov	0x1e, %r14
	.word 0xf2db8e60  ! 2394: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbde4208e  ! 2395: SAVE_I	save	%r16, 0x0001, %r30
iob_intr_0_197:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_197), 16, 16)) -> intp(0, 0, 9)
	.word 0xbde54000  ! 2401: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_198:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_198), 16, 16)) -> intp(0, 0, d)
	.word 0xbfe50000  ! 2404: SAVE_R	save	%r20, %r0, %r31
	.word 0xb3e5e0b0  ! 2405: SAVE_I	save	%r23, 0x0001, %r25
iob_intr_0_199:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_199), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb9e4e1b0  ! 2408: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1e44000  ! 2410: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_191:
	setx	0x33020b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_192:
	setx	0x300312, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_109:
	mov	0x3c2, %r14
	.word 0xfcf38e40  ! 2417: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_wr_110:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 2419: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_200:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_200), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbde4e10f  ! 2424: SAVE_I	save	%r19, 0x0001, %r30
cpu_intr_0_193:
	setx	0x330332, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T0_asi_reg_rd_123:
	mov	0x4, %r14
	.word 0xf8db89e0  ! 2430: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T0_asi_reg_rd_124:
	mov	0x31, %r14
	.word 0xfedb8e80  ! 2432: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T0_asi_reg_rd_125:
	mov	0x2, %r14
	.word 0xf4db89e0  ! 2434: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
cpu_intr_0_194:
	setx	0x310324, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb97cc400  ! 2437: MOVR_R	movre	%r19, %r0, %r28
	.word 0xb1e5c000  ! 2440: SAVE_R	save	%r23, %r0, %r24
	.word 0xbbe5c000  ! 2441: SAVE_R	save	%r23, %r0, %r29
	.word 0xbfe4a0b5  ! 2442: SAVE_I	save	%r18, 0x0001, %r31
iob_intr_0_201:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_201), 16, 16)) -> intp(0, 0, 1)
iob_intr_0_202:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_202), 16, 16)) -> intp(0, 0, 1e)
	.word 0xbfe54000  ! 2450: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_203:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_203), 16, 16)) -> intp(0, 0, 29)
T0_asi_reg_wr_111:
	mov	0x2c, %r14
	.word 0xfcf38e40  ! 2453: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_204:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_204), 16, 16)) -> intp(0, 0, e)
	.word 0xbde58000  ! 2457: SAVE_R	save	%r22, %r0, %r30
	.word 0xbfe5e071  ! 2459: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_rd_126:
	mov	0x2a, %r14
	.word 0xf2db89e0  ! 2461: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_0_195:
	setx	0x320017, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_205:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_205), 16, 16)) -> intp(0, 0, 1c)
	.word 0x8795e1b8  ! 2470: WRPR_TT_I	wrpr	%r23, 0x01b8, %tt
cpu_intr_0_196:
	setx	0x31020e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 2472: SAVE_R	save	%r23, %r0, %r27
	.word 0xbde50000  ! 2475: SAVE_R	save	%r20, %r0, %r30
	.word 0xb7e58000  ! 2478: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_206:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_206), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_rd_127:
	mov	0x3c2, %r14
	.word 0xf0db84a0  ! 2483: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_0_207:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_207), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_197:
	setx	0x33011f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_198:
	setx	0x300335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4e03d  ! 2490: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_rd_128:
	mov	0x21, %r14
	.word 0xfedb8e60  ! 2491: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb1e50000  ! 2493: SAVE_R	save	%r20, %r0, %r24
	.word 0xb3e40000  ! 2495: SAVE_R	save	%r16, %r0, %r25
	.word 0xb1e4a1ca  ! 2499: SAVE_I	save	%r18, 0x0001, %r24
cpu_intr_0_199:
	setx	0x300330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e58000  ! 2506: SAVE_R	save	%r22, %r0, %r24
cpu_intr_0_200:
	setx	0x310230, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_129:
	mov	0x13, %r14
	.word 0xf0db8e40  ! 2511: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_wr_112:
	mov	0x38, %r14
	.word 0xfaf38400  ! 2516: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb1e4c000  ! 2517: SAVE_R	save	%r19, %r0, %r24
	.word 0xb7e40000  ! 2518: SAVE_R	save	%r16, %r0, %r27
	.word 0xbb342001  ! 2519: SRL_I	srl 	%r16, 0x0001, %r29
iob_intr_0_208:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_208), 16, 16)) -> intp(0, 0, 9)
	.word 0xbc242082  ! 2522: SUB_I	sub 	%r16, 0x0082, %r30
	.word 0xb9e4c000  ! 2523: SAVE_R	save	%r19, %r0, %r28
	.word 0xb9e48000  ! 2524: SAVE_R	save	%r18, %r0, %r28
cpu_intr_0_201:
	setx	0x310000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_202:
	setx	0x320232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e50000  ! 2529: SAVE_R	save	%r20, %r0, %r25
T0_asi_reg_rd_130:
	mov	0x19, %r14
	.word 0xfcdb8e80  ! 2531: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
T0_asi_reg_rd_131:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 2535: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb5e54000  ! 2536: SAVE_R	save	%r21, %r0, %r26
	.word 0xbfe4a079  ! 2537: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe54000  ! 2538: SAVE_R	save	%r21, %r0, %r31
	.word 0xb7e44000  ! 2539: SAVE_R	save	%r17, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_0_203:
	setx	0x320215, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_209:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_209), 16, 16)) -> intp(0, 0, 7)
	.word 0xb3e5a0ea  ! 2546: SAVE_I	save	%r22, 0x0001, %r25
T0_asi_reg_wr_113:
	mov	0xd, %r14
	.word 0xfef38400  ! 2547: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_0_204:
	setx	0x32013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_205:
	setx	0x300009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb34d000  ! 2555: SRLX_R	srlx	%r19, %r0, %r29
	.word 0xbbe50000  ! 2556: SAVE_R	save	%r20, %r0, %r29
T0_asi_reg_rd_132:
	mov	0x10, %r14
	.word 0xfadb8e80  ! 2560: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T0_asi_reg_wr_114:
	mov	0x3c6, %r14
	.word 0xf2f384a0  ! 2561: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_115:
	mov	0x3c8, %r14
	.word 0xf8f384a0  ! 2566: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T0_asi_reg_wr_116:
	mov	0x5, %r14
	.word 0xf0f38e60  ! 2568: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_0_210:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_210), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbfe5a05c  ! 2572: SAVE_I	save	%r22, 0x0001, %r31
T0_asi_reg_wr_117:
	mov	0x10, %r14
	.word 0xf2f38e40  ! 2573: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_rd_133:
	mov	0xe, %r14
	.word 0xfedb8e60  ! 2578: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xb9e4e0ac  ! 2580: SAVE_I	save	%r19, 0x0001, %r28
cpu_intr_0_206:
	setx	0x300009, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_134:
	mov	0x3c1, %r14
	.word 0xf6db89e0  ! 2584: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbe448000  ! 2586: ADDC_R	addc 	%r18, %r0, %r31
iob_intr_0_211:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_211), 16, 16)) -> intp(0, 0, 2d)
iob_intr_0_212:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_212), 16, 16)) -> intp(0, 0, 11)
cpu_intr_0_207:
	setx	0x320207, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_213:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_213), 16, 16)) -> intp(0, 0, d)
cpu_intr_0_208:
	setx	0x330226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4207f  ! 2597: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb33d0000  ! 2598: SRA_R	sra 	%r20, %r0, %r25
iob_intr_0_214:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_214), 16, 16)) -> intp(0, 0, 18)
	.word 0xbfe58000  ! 2604: SAVE_R	save	%r22, %r0, %r31
	.word 0xbfe4a0b4  ! 2607: SAVE_I	save	%r18, 0x0001, %r31
T0_asi_reg_wr_118:
	mov	0x3, %r14
	.word 0xfaf38e40  ! 2611: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_0_209:
	setx	0x30030a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_215:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_215), 16, 16)) -> intp(0, 0, 2b)
cpu_intr_0_210:
	setx	0x30010e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_216:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_216), 16, 16)) -> intp(0, 0, 3f)
	.word 0xbde50000  ! 2621: SAVE_R	save	%r20, %r0, %r30
	.word 0xbfe5616e  ! 2622: SAVE_I	save	%r21, 0x0001, %r31
cpu_intr_0_211:
	setx	0x30023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_119:
	mov	0xa, %r14
	.word 0xfef38e60  ! 2628: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T0_asi_reg_wr_120:
	mov	0x34, %r14
	.word 0xfcf38e60  ! 2630: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T0_asi_reg_wr_121:
	mov	0x3c4, %r14
	.word 0xf0f38e60  ! 2631: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_0_212:
	setx	0x310021, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_122:
	mov	0x2b, %r14
	.word 0xf2f38e80  ! 2635: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
cpu_intr_0_213:
	setx	0x330225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4c000  ! 2643: SAVE_R	save	%r19, %r0, %r26
	.word 0xb7e560f3  ! 2645: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbf641800  ! 2648: MOVcc_R	<illegal instruction>
T0_asi_reg_rd_135:
	mov	0x2f, %r14
	.word 0xfadb8e60  ! 2651: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_0_217:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_217), 16, 16)) -> intp(0, 0, e)
	.word 0xb52c9000  ! 2656: SLLX_R	sllx	%r18, %r0, %r26
cpu_intr_0_214:
	setx	0x30011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_136:
	mov	0x3c4, %r14
	.word 0xf4db8e60  ! 2660: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbbe5e0b0  ! 2661: SAVE_I	save	%r23, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbde54000  ! 2667: SAVE_R	save	%r21, %r0, %r30
	.word 0xb8c4c000  ! 2668: ADDCcc_R	addccc 	%r19, %r0, %r28
iob_intr_0_218:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_218), 16, 16)) -> intp(0, 0, 34)
	.word 0xbfe4c000  ! 2671: SAVE_R	save	%r19, %r0, %r31
iob_intr_0_219:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_219), 16, 16)) -> intp(0, 0, 26)
	.word 0xb0944000  ! 2678: ORcc_R	orcc 	%r17, %r0, %r24
cpu_intr_0_215:
	setx	0x300120, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_220:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_220), 16, 16)) -> intp(0, 0, 34)
iob_intr_0_221:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_221), 16, 16)) -> intp(0, 0, 1e)
cpu_intr_0_216:
	setx	0x320217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_217:
	setx	0x33031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e58000  ! 2696: SAVE_R	save	%r22, %r0, %r25
cpu_intr_0_218:
	setx	0x320226, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_137:
	mov	0x36, %r14
	.word 0xf4db8e40  ! 2702: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_222:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_222), 16, 16)) -> intp(0, 0, 35)
iob_intr_0_223:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_223), 16, 16)) -> intp(0, 0, 2b)
	.word 0xbb2ce001  ! 2715: SLL_I	sll 	%r19, 0x0001, %r29
iob_intr_0_224:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_224), 16, 16)) -> intp(0, 0, 15)
	.word 0xb7e48000  ! 2718: SAVE_R	save	%r18, %r0, %r27
	.word 0xb32d6001  ! 2719: SLL_I	sll 	%r21, 0x0001, %r25
T0_asi_reg_wr_123:
	mov	0x3c3, %r14
	.word 0xf4f389e0  ! 2720: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb7e560ac  ! 2721: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_219:
	setx	0x36022b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_138:
	mov	0x26, %r14
	.word 0xfedb8e60  ! 2725: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T0_asi_reg_rd_139:
	mov	0x3c1, %r14
	.word 0xf4db8e60  ! 2726: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb1e5c000  ! 2728: SAVE_R	save	%r23, %r0, %r24
cpu_intr_0_220:
	setx	0x35000c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_221:
	setx	0x34013f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_222:
	setx	0x360208, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_223:
	setx	0x350300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_225:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_225), 16, 16)) -> intp(0, 0, 37)
T0_asi_reg_wr_124:
	mov	0x20, %r14
	.word 0xf2f38e40  ! 2740: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T0_asi_reg_rd_140:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 2742: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_226:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_226), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_rd_141:
	mov	0x27, %r14
	.word 0xf8db8e80  ! 2748: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbbe52092  ! 2751: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_224:
	setx	0x340226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_225:
	setx	0x35033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e5a059  ! 2758: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb2a560c1  ! 2761: SUBcc_I	subcc 	%r21, 0x00c1, %r25
	.word 0xb1e48000  ! 2763: SAVE_R	save	%r18, %r0, %r24
	.word 0xbfe48000  ! 2764: SAVE_R	save	%r18, %r0, %r31
	.word 0xbde48000  ! 2766: SAVE_R	save	%r18, %r0, %r30
	.word 0xbbe521d1  ! 2767: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde50000  ! 2769: SAVE_R	save	%r20, %r0, %r30
cpu_intr_0_226:
	setx	0x340321, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_142:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 2772: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_0_227:
	setx	0x37032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb4c000  ! 2775: ORNcc_R	orncc 	%r19, %r0, %r30
	.word 0xb8a48000  ! 2777: SUBcc_R	subcc 	%r18, %r0, %r28
	.word 0xb1e58000  ! 2781: SAVE_R	save	%r22, %r0, %r24
iob_intr_0_227:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_227), 16, 16)) -> intp(0, 0, 2)
	.word 0xbbe4a00b  ! 2784: SAVE_I	save	%r18, 0x0001, %r29
iob_intr_0_228:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_228), 16, 16)) -> intp(0, 0, 13)
	.word 0xb9e5a173  ! 2787: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbde4a0a9  ! 2788: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_rd_143:
	mov	0x3c7, %r14
	.word 0xf4db84a0  ! 2790: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb9e58000  ! 2792: SAVE_R	save	%r22, %r0, %r28
iob_intr_0_229:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_229), 16, 16)) -> intp(0, 0, 18)
	.word 0xb5e4602a  ! 2795: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe5203e  ! 2796: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_228:
	setx	0x36012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a134  ! 2800: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5e50000  ! 2802: SAVE_R	save	%r20, %r0, %r26
cpu_intr_0_229:
	setx	0x34001c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb694e0b0  ! 2804: ORcc_I	orcc 	%r19, 0x00b0, %r27
iob_intr_0_230:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_230), 16, 16)) -> intp(0, 0, 1f)
T0_asi_reg_wr_125:
	mov	0x3c0, %r14
	.word 0xf2f389e0  ! 2809: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T0_asi_reg_wr_126:
	mov	0x29, %r14
	.word 0xf2f389e0  ! 2814: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T0_asi_reg_rd_144:
	mov	0xd, %r14
	.word 0xf6db89e0  ! 2817: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T0_asi_reg_wr_127:
	mov	0x28, %r14
	.word 0xf4f384a0  ! 2818: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_0_230:
	setx	0x340239, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_231:
	setx	0x34011d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e40000  ! 2824: SAVE_R	save	%r16, %r0, %r27
iob_intr_0_231:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_231), 16, 16)) -> intp(0, 0, 30)
	.word 0xb7e44000  ! 2829: SAVE_R	save	%r17, %r0, %r27
	.word 0xb7e560f3  ! 2833: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_232:
	setx	0x370102, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_145:
	mov	0x16, %r14
	.word 0xf8db8e60  ! 2836: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T0_asi_reg_wr_128:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 2837: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb4050000  ! 2838: ADD_R	add 	%r20, %r0, %r26
	.word 0xb1e56149  ! 2839: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbebde009  ! 2842: XNORcc_I	xnorcc 	%r23, 0x0009, %r31
	.word 0xb3e58000  ! 2843: SAVE_R	save	%r22, %r0, %r25
iob_intr_0_232:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_232), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbbe5c000  ! 2847: SAVE_R	save	%r23, %r0, %r29
iob_intr_0_233:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_233), 16, 16)) -> intp(0, 0, 5)
	.word 0xb7e520e5  ! 2851: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7e42110  ! 2853: SAVE_I	save	%r16, 0x0001, %r27
T0_asi_reg_wr_129:
	mov	0x38, %r14
	.word 0xf8f384a0  ! 2855: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb20c0000  ! 2860: AND_R	and 	%r16, %r0, %r25
	.word 0xbde461c4  ! 2861: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbd50c000  ! 2863: RDPR_TT	<illegal instruction>
	.word 0xb3e561e1  ! 2864: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbbe5c000  ! 2865: SAVE_R	save	%r23, %r0, %r29
	.word 0xb7e4a151  ! 2866: SAVE_I	save	%r18, 0x0001, %r27
iob_intr_0_234:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_234), 16, 16)) -> intp(0, 0, 31)
iob_intr_0_235:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_235), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbde5c000  ! 2869: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_233:
	setx	0x350211, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_234:
	setx	0x370115, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e1b1  ! 2876: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_wr_130:
	mov	0x28, %r14
	.word 0xfcf38e40  ! 2877: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T0_asi_reg_wr_131:
	mov	0x14, %r14
	.word 0xf6f38e60  ! 2883: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb6bca04b  ! 2884: XNORcc_I	xnorcc 	%r18, 0x004b, %r27
T0_asi_reg_wr_132:
	mov	0x25, %r14
	.word 0xfef384a0  ! 2885: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
cpu_intr_0_235:
	setx	0x37033a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_133:
	mov	0x16, %r14
	.word 0xfef38e40  ! 2887: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_wr_134:
	mov	0x3c1, %r14
	.word 0xfaf38e80  ! 2888: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_rd_146:
	mov	0x3c3, %r14
	.word 0xf8db8400  ! 2890: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_0_236:
	setx	0x370007, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_135:
	mov	0x26, %r14
	.word 0xf6f38e80  ! 2893: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb5e54000  ! 2896: SAVE_R	save	%r21, %r0, %r26
iob_intr_0_236:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_236), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_wr_136:
	mov	0x3c2, %r14
	.word 0xf0f38400  ! 2900: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xb9e44000  ! 2904: SAVE_R	save	%r17, %r0, %r28
cpu_intr_0_237:
	setx	0x360017, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_238:
	setx	0x35031d, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_137:
	mov	0x6, %r14
	.word 0xf6f38e40  ! 2915: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_239:
	setx	0x340207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5c000  ! 2918: SAVE_R	save	%r23, %r0, %r27
	.word 0xbfe461bc  ! 2919: SAVE_I	save	%r17, 0x0001, %r31
iob_intr_0_237:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_237), 16, 16)) -> intp(0, 0, 24)
	.word 0xbbe44000  ! 2922: SAVE_R	save	%r17, %r0, %r29
	.word 0xb7e58000  ! 2928: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_wr_138:
	mov	0x3c3, %r14
	.word 0xfcf38e40  ! 2930: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_238:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_238), 16, 16)) -> intp(0, 0, 5)
	.word 0xb1e58000  ! 2932: SAVE_R	save	%r22, %r0, %r24
	.word 0xb7e56168  ! 2933: SAVE_I	save	%r21, 0x0001, %r27
iob_intr_0_239:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_239), 16, 16)) -> intp(0, 0, 12)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e5c000  ! 2936: SAVE_R	save	%r23, %r0, %r28
cpu_intr_0_240:
	setx	0x350335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e44000  ! 2944: SAVE_R	save	%r17, %r0, %r24
	.word 0xbde4c000  ! 2945: SAVE_R	save	%r19, %r0, %r30
cpu_intr_0_241:
	setx	0x37031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_147:
	mov	0x3c3, %r14
	.word 0xf6db8e60  ! 2952: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xbfe56014  ! 2953: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xba350000  ! 2955: SUBC_R	orn 	%r20, %r0, %r29
cpu_intr_0_242:
	setx	0x350000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5217c  ! 2958: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbe1da162  ! 2959: XOR_I	xor 	%r22, 0x0162, %r31
	.word 0xb234217f  ! 2960: SUBC_I	orn 	%r16, 0x017f, %r25
T0_asi_reg_wr_139:
	mov	0x16, %r14
	.word 0xf0f389e0  ! 2961: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T0_asi_reg_wr_140:
	mov	0x19, %r14
	.word 0xf6f38e40  ! 2964: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_0_243:
	setx	0x36022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_141:
	mov	0x10, %r14
	.word 0xfcf38e40  ! 2968: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb9e4c000  ! 2969: SAVE_R	save	%r19, %r0, %r28
	.word 0xba958000  ! 2970: ORcc_R	orcc 	%r22, %r0, %r29
	.word 0xbbe4a1c5  ! 2971: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb22c0000  ! 2974: ANDN_R	andn 	%r16, %r0, %r25
	.word 0xbde5c000  ! 2979: SAVE_R	save	%r23, %r0, %r30
	.word 0xb1e5e168  ! 2981: SAVE_I	save	%r23, 0x0001, %r24
iob_intr_0_240:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_240), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb3e5600b  ! 2985: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb32c2001  ! 2987: SLL_I	sll 	%r16, 0x0001, %r25
	.word 0xbd2cf001  ! 2988: SLLX_I	sllx	%r19, 0x0001, %r30
	.word 0xb9e4219b  ! 2989: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb6bd6183  ! 2990: XNORcc_I	xnorcc 	%r21, 0x0183, %r27
	.word 0xb80cc000  ! 2991: AND_R	and 	%r19, %r0, %r28
iob_intr_0_241:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_241), 16, 16)) -> intp(0, 0, 32)
cpu_intr_0_244:
	setx	0x37031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe2c21ca  ! 2997: ANDN_I	andn 	%r16, 0x01ca, %r31
cpu_intr_0_245:
	setx	0x36001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_246:
	setx	0x36023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 3003: SAVE_R	save	%r21, %r0, %r30
	.word 0xb1e58000  ! 3004: SAVE_R	save	%r22, %r0, %r24
iob_intr_0_242:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_242), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_243:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_243), 16, 16)) -> intp(0, 0, d)
	.word 0xb80c2161  ! 3010: AND_I	and 	%r16, 0x0161, %r28
iob_intr_0_244:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_244), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb7e5c000  ! 3018: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_rd_148:
	mov	0x9, %r14
	.word 0xf0db89e0  ! 3021: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xbfe4e073  ! 3022: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_247:
	setx	0x36010a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_142:
	mov	0x1f, %r14
	.word 0xf2f38e60  ! 3033: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T0_asi_reg_wr_143:
	mov	0x3c1, %r14
	.word 0xfaf38e40  ! 3034: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb1e46075  ! 3036: SAVE_I	save	%r17, 0x0001, %r24
cpu_intr_0_248:
	setx	0x360217, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_149:
	mov	0x3c0, %r14
	.word 0xf2db8e80  ! 3039: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbbe520dd  ! 3040: SAVE_I	save	%r20, 0x0001, %r29
T0_asi_reg_rd_150:
	mov	0x36, %r14
	.word 0xfcdb8400  ! 3046: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbde4a0e3  ! 3047: SAVE_I	save	%r18, 0x0001, %r30
T0_asi_reg_wr_144:
	mov	0xe, %r14
	.word 0xfcf38e40  ! 3048: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_249:
	setx	0x35010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e460e6  ! 3051: SAVE_I	save	%r17, 0x0001, %r26
iob_intr_0_245:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_245), 16, 16)) -> intp(0, 0, 36)
	.word 0xbde4e0bc  ! 3053: SAVE_I	save	%r19, 0x0001, %r30
T0_asi_reg_wr_145:
	mov	0x3c5, %r14
	.word 0xf8f38e40  ! 3056: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbc350000  ! 3057: SUBC_R	orn 	%r20, %r0, %r30
	.word 0xbde58000  ! 3065: SAVE_R	save	%r22, %r0, %r30
iob_intr_0_246:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_246), 16, 16)) -> intp(0, 0, 31)
	.word 0xa1902001  ! 3068: WRPR_GL_I	wrpr	%r0, 0x0001, %-
iob_intr_0_247:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_247), 16, 16)) -> intp(0, 0, f)
	.word 0xbfe58000  ! 3071: SAVE_R	save	%r22, %r0, %r31
	.word 0xb0bd8000  ! 3075: XNORcc_R	xnorcc 	%r22, %r0, %r24
T0_asi_reg_wr_146:
	mov	0xd, %r14
	.word 0xf0f38400  ! 3077: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_248:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_248), 16, 16)) -> intp(0, 0, f)
	.word 0xbde58000  ! 3080: SAVE_R	save	%r22, %r0, %r30
cpu_intr_0_250:
	setx	0x37010e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_249:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_249), 16, 16)) -> intp(0, 0, 25)
	.word 0xbfe4c000  ! 3087: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_251:
	setx	0x370129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_252:
	setx	0x36002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e48000  ! 3093: SAVE_R	save	%r18, %r0, %r26
	.word 0xb3e4e184  ! 3096: SAVE_I	save	%r19, 0x0001, %r25
T0_asi_reg_rd_151:
	mov	0x0, %r14
	.word 0xfadb84a0  ! 3097: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xbde54000  ! 3101: SAVE_R	save	%r21, %r0, %r30
T0_asi_reg_wr_147:
	mov	0x1b, %r14
	.word 0xfcf38e40  ! 3102: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_253:
	setx	0x37023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4c000  ! 3106: SAVE_R	save	%r19, %r0, %r25
	.word 0xb9e40000  ! 3109: SAVE_R	save	%r16, %r0, %r28
T0_asi_reg_rd_152:
	mov	0x16, %r14
	.word 0xf6db8e60  ! 3110: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_0_254:
	setx	0x35032a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_153:
	mov	0x3c8, %r14
	.word 0xfcdb8400  ! 3116: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_0_255:
	setx	0x350318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe54000  ! 3119: SAVE_R	save	%r21, %r0, %r31
iob_intr_0_250:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_250), 16, 16)) -> intp(0, 0, 23)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_251:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_251), 16, 16)) -> intp(0, 0, 3c)
iob_intr_0_252:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_252), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_256:
	setx	0x340039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_253:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_253), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb5e5a073  ! 3144: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3e58000  ! 3145: SAVE_R	save	%r22, %r0, %r25
cpu_intr_0_257:
	setx	0x350228, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_148:
	mov	0x3c8, %r14
	.word 0xf8f38e80  ! 3147: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
T0_asi_reg_wr_149:
	mov	0x7, %r14
	.word 0xf0f38e40  ! 3148: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T0_asi_reg_wr_150:
	mov	0x3c8, %r14
	.word 0xfef389e0  ! 3149: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T0_asi_reg_rd_154:
	mov	0x2a, %r14
	.word 0xfcdb89e0  ! 3151: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_0_254:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_254), 16, 16)) -> intp(0, 0, 39)
	.word 0xb7e4e076  ! 3153: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_rd_155:
	mov	0x3c7, %r14
	.word 0xfadb8e60  ! 3154: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbbe5217f  ! 3157: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xa1902001  ! 3158: WRPR_GL_I	wrpr	%r0, 0x0001, %-
iob_intr_0_255:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_255), 16, 16)) -> intp(0, 0, 39)
	.word 0xb1e42161  ! 3160: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbbe40000  ! 3161: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_wr_151:
	mov	0x1a, %r14
	.word 0xf0f38e40  ! 3164: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_0_258:
	setx	0x340124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e520a6  ! 3167: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1e5c000  ! 3168: SAVE_R	save	%r23, %r0, %r24
	.word 0xb1e4c000  ! 3169: SAVE_R	save	%r19, %r0, %r24
iob_intr_0_256:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_256), 16, 16)) -> intp(0, 0, 2)
	.word 0xbde44000  ! 3171: SAVE_R	save	%r17, %r0, %r30
T0_asi_reg_wr_152:
	mov	0x32, %r14
	.word 0xf0f38e40  ! 3174: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_0_257:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_257), 16, 16)) -> intp(0, 0, d)
	.word 0xbde40000  ! 3179: SAVE_R	save	%r16, %r0, %r30
cpu_intr_0_259:
	setx	0x3b012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe44000  ! 3182: SAVE_R	save	%r17, %r0, %r31
iob_intr_0_258:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_258), 16, 16)) -> intp(0, 0, d)
	.word 0xb9e4a1c3  ! 3184: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7e58000  ! 3188: SAVE_R	save	%r22, %r0, %r27
	.word 0xb7e54000  ! 3189: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_rd_156:
	mov	0x25, %r14
	.word 0xf4db8e80  ! 3191: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb3e520e5  ! 3193: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb1e50000  ! 3194: SAVE_R	save	%r20, %r0, %r24
iob_intr_0_259:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_259), 16, 16)) -> intp(0, 0, 9)
cpu_intr_0_260:
	setx	0x3a020e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_260:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_260), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbfe460c2  ! 3199: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde48000  ! 3201: SAVE_R	save	%r18, %r0, %r30
	.word 0xb3e50000  ! 3203: SAVE_R	save	%r20, %r0, %r25
	.word 0xb9e40000  ! 3208: SAVE_R	save	%r16, %r0, %r28
iob_intr_0_261:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_261), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb3e5e1cc  ! 3211: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbb3dd000  ! 3213: SRAX_R	srax	%r23, %r0, %r29
	.word 0xb1350000  ! 3215: SRL_R	srl 	%r20, %r0, %r24
	.word 0xb5e42168  ! 3216: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbfe521cf  ! 3218: SAVE_I	save	%r20, 0x0001, %r31
cpu_intr_0_261:
	setx	0x3b0209, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb214a0b7  ! 3222: OR_I	or 	%r18, 0x00b7, %r25
	.word 0xb7e420d1  ! 3225: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e44000  ! 3226: SAVE_R	save	%r17, %r0, %r27
T0_asi_reg_wr_153:
	mov	0x3c8, %r14
	.word 0xf4f389e0  ! 3228: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_0_262:
	setx	0x380136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e1d2  ! 3230: SAVE_I	save	%r23, 0x0001, %r29
cpu_intr_0_263:
	setx	0x380217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_264:
	setx	0x3b012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_265:
	setx	0x3b0230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e0da  ! 3239: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1e56002  ! 3240: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb4054000  ! 3243: ADD_R	add 	%r21, %r0, %r26
	.word 0xb3e50000  ! 3244: SAVE_R	save	%r20, %r0, %r25
	.word 0xb9e5e062  ! 3247: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbf3c6001  ! 3248: SRA_I	sra 	%r17, 0x0001, %r31
iob_intr_0_262:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_262), 16, 16)) -> intp(0, 0, 30)
iob_intr_0_263:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_263), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_rd_157:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 3255: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb7e58000  ! 3257: SAVE_R	save	%r22, %r0, %r27
T0_asi_reg_wr_154:
	mov	0x2a, %r14
	.word 0xf8f389e0  ! 3260: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_0_266:
	setx	0x390133, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_264:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_264), 16, 16)) -> intp(0, 0, 1d)
cpu_intr_0_267:
	setx	0x10030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 3265: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_rd_158:
	mov	0x3c4, %r14
	.word 0xf4db8400  ! 3266: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_0_268:
	setx	0x39010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e58000  ! 3272: SAVE_R	save	%r22, %r0, %r28
	.word 0xb7e4a0b1  ! 3275: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_rd_159:
	mov	0x2d, %r14
	.word 0xf8db8e40  ! 3280: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbfe48000  ! 3281: SAVE_R	save	%r18, %r0, %r31
	.word 0xbe0c6014  ! 3282: AND_I	and 	%r17, 0x0014, %r31
	.word 0xb72c8000  ! 3283: SLL_R	sll 	%r18, %r0, %r27
	.word 0xbde5e05b  ! 3285: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb1e52078  ! 3288: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbc2dc000  ! 3290: ANDN_R	andn 	%r23, %r0, %r30
	.word 0xbfe48000  ! 3292: SAVE_R	save	%r18, %r0, %r31
	.word 0xbb2d3001  ! 3295: SLLX_I	sllx	%r20, 0x0001, %r29
	.word 0xbfe40000  ! 3297: SAVE_R	save	%r16, %r0, %r31
	.word 0xbb35a001  ! 3300: SRL_I	srl 	%r22, 0x0001, %r29
	.word 0xb0252062  ! 3306: SUB_I	sub 	%r20, 0x0062, %r24
cpu_intr_0_269:
	setx	0x3b011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_155:
	mov	0x38, %r14
	.word 0xfcf384a0  ! 3308: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xb60ca07f  ! 3316: AND_I	and 	%r18, 0x007f, %r27
cpu_intr_0_270:
	setx	0x390321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde48000  ! 3322: SAVE_R	save	%r18, %r0, %r30
T0_asi_reg_wr_156:
	mov	0x3c5, %r14
	.word 0xf6f384a0  ! 3323: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbfe48000  ! 3324: SAVE_R	save	%r18, %r0, %r31
iob_intr_0_265:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_265), 16, 16)) -> intp(0, 0, 36)
	.word 0xb3e421b9  ! 3329: SAVE_I	save	%r16, 0x0001, %r25
T0_asi_reg_rd_160:
	mov	0x22, %r14
	.word 0xfcdb8e40  ! 3335: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbabda18f  ! 3337: XNORcc_I	xnorcc 	%r22, 0x018f, %r29
	.word 0xb1e5a0f4  ! 3338: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e5e179  ! 3340: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e48000  ! 3343: SAVE_R	save	%r18, %r0, %r26
T0_asi_reg_wr_157:
	mov	0x22, %r14
	.word 0xf8f38e40  ! 3345: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb1e48000  ! 3346: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_266:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_266), 16, 16)) -> intp(0, 0, 20)
	.word 0xb7e5a122  ! 3348: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe5e153  ! 3350: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_wr_158:
	mov	0x3c6, %r14
	.word 0xfef38400  ! 3351: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_0_271:
	setx	0x3a0110, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e58000  ! 3356: SAVE_R	save	%r22, %r0, %r27
	.word 0xbde5e1c0  ! 3360: SAVE_I	save	%r23, 0x0001, %r30
iob_intr_0_267:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_267), 16, 16)) -> intp(0, 0, 3e)
	.word 0x9195e128  ! 3367: WRPR_PIL_I	wrpr	%r23, 0x0128, %pil
T0_asi_reg_rd_161:
	mov	0x1c, %r14
	.word 0xf8db8400  ! 3368: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbb7da401  ! 3372: MOVR_I	movre	%r22, 0x1, %r29
	.word 0xb9e460e9  ! 3373: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1e4e15f  ! 3374: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_wr_159:
	mov	0x24, %r14
	.word 0xfef38e40  ! 3380: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T0_asi_reg_wr_160:
	mov	0x21, %r14
	.word 0xfef384a0  ! 3382: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbab560fd  ! 3385: ORNcc_I	orncc 	%r21, 0x00fd, %r29
	.word 0xbfe56039  ! 3387: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe5c000  ! 3389: SAVE_R	save	%r23, %r0, %r31
	.word 0xb9e54000  ! 3393: SAVE_R	save	%r21, %r0, %r28
iob_intr_0_268:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_268), 16, 16)) -> intp(0, 0, 21)
T0_asi_reg_rd_162:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 3395: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_0_269:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_269), 16, 16)) -> intp(0, 0, 24)
cpu_intr_0_272:
	setx	0x3a0224, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_161:
	mov	0x18, %r14
	.word 0xf8f38e60  ! 3402: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb1e58000  ! 3403: SAVE_R	save	%r22, %r0, %r24
iob_intr_0_270:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_270), 16, 16)) -> intp(0, 0, 1b)
T0_asi_reg_wr_162:
	mov	0x3c1, %r14
	.word 0xf4f38400  ! 3406: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
cpu_intr_0_273:
	setx	0x380217, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_274:
	setx	0x3b0207, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_271:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_271), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb5e5a1bb  ! 3414: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_rd_163:
	mov	0x1c, %r14
	.word 0xfedb8400  ! 3416: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T0_asi_reg_wr_163:
	mov	0x9, %r14
	.word 0xf8f389e0  ! 3417: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb53d5000  ! 3418: SRAX_R	srax	%r21, %r0, %r26
cpu_intr_0_275:
	setx	0x3a021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe52170  ! 3425: SAVE_I	save	%r20, 0x0001, %r29
cpu_intr_0_276:
	setx	0x390324, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_164:
	mov	0x2f, %r14
	.word 0xfedb89e0  ! 3428: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T0_asi_reg_wr_164:
	mov	0x12, %r14
	.word 0xf6f38e80  ! 3431: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_0_272:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_272), 16, 16)) -> intp(0, 0, 32)
	.word 0xbde54000  ! 3435: SAVE_R	save	%r21, %r0, %r30
	.word 0xb7e4c000  ! 3440: SAVE_R	save	%r19, %r0, %r27
	.word 0xbfe5c000  ! 3441: SAVE_R	save	%r23, %r0, %r31
	.word 0xb7504000  ! 3445: RDPR_TNPC	<illegal instruction>
iob_intr_0_273:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_273), 16, 16)) -> intp(0, 0, 26)
iob_intr_0_274:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_274), 16, 16)) -> intp(0, 0, 32)
cpu_intr_0_277:
	setx	0x3a0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a09f  ! 3454: SAVE_I	save	%r22, 0x0001, %r26
T0_asi_reg_rd_165:
	mov	0x21, %r14
	.word 0xf6db8e40  ! 3457: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb9e4c000  ! 3458: SAVE_R	save	%r19, %r0, %r28
	.word 0xb7e56062  ! 3460: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_278:
	setx	0x3b0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e13e  ! 3466: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb61c8000  ! 3468: XOR_R	xor 	%r18, %r0, %r27
cpu_intr_0_279:
	setx	0x3b021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4603e  ! 3470: SAVE_I	save	%r17, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e40000  ! 3479: SAVE_R	save	%r16, %r0, %r25
T0_asi_reg_rd_166:
	mov	0x1b, %r14
	.word 0xf0db8e80  ! 3481: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbde5a09b  ! 3482: SAVE_I	save	%r22, 0x0001, %r30
cpu_intr_0_280:
	setx	0x3a0232, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_281:
	setx	0x3b003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb7dc400  ! 3490: MOVR_R	movre	%r23, %r0, %r29
	.word 0xb17c6401  ! 3492: MOVR_I	movre	%r17, 0x1, %r24
	.word 0xbbe54000  ! 3494: SAVE_R	save	%r21, %r0, %r29
	.word 0xb414e075  ! 3496: OR_I	or 	%r19, 0x0075, %r26
	.word 0xbbe4a165  ! 3498: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb8b4a0e7  ! 3499: SUBCcc_I	orncc 	%r18, 0x00e7, %r28
T0_asi_reg_wr_165:
	mov	0x30, %r14
	.word 0xfcf38e40  ! 3504: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_282:
	setx	0x3a0023, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_283:
	setx	0x3b022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde48000  ! 3508: SAVE_R	save	%r18, %r0, %r30
	.word 0xb1e5a1bf  ! 3510: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_275:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_275), 16, 16)) -> intp(0, 0, f)
	.word 0xb7e56194  ! 3516: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe56184  ! 3517: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7e520f0  ! 3520: SAVE_I	save	%r20, 0x0001, %r27
cpu_intr_0_284:
	setx	0x38030e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_285:
	setx	0x390214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe461df  ! 3524: SAVE_I	save	%r17, 0x0001, %r29
iob_intr_0_276:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_276), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_rd_167:
	mov	0x3c6, %r14
	.word 0xfedb8400  ! 3526: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb3e40000  ! 3529: SAVE_R	save	%r16, %r0, %r25
	.word 0xb77d6401  ! 3530: MOVR_I	movre	%r21, 0x1, %r27
	.word 0xb7e4e01c  ! 3533: SAVE_I	save	%r19, 0x0001, %r27
T0_asi_reg_rd_168:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 3534: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_0_277:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_277), 16, 16)) -> intp(0, 0, 21)
T0_asi_reg_rd_169:
	mov	0x2f, %r14
	.word 0xf0db8400  ! 3538: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xbe2ce1bd  ! 3542: ANDN_I	andn 	%r19, 0x01bd, %r31
	.word 0xb7e44000  ! 3543: SAVE_R	save	%r17, %r0, %r27
	.word 0xb7e4a1b9  ! 3545: SAVE_I	save	%r18, 0x0001, %r27
T0_asi_reg_rd_170:
	mov	0x3c7, %r14
	.word 0xf6db8e60  ! 3546: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_0_286:
	setx	0x380000, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_171:
	mov	0x32, %r14
	.word 0xfcdb8e60  ! 3550: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_0_287:
	setx	0x390220, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe56160  ! 3554: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_wr_166:
	mov	0x32, %r14
	.word 0xf8f38e40  ! 3556: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_0_278:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_278), 16, 16)) -> intp(0, 0, 26)
T0_asi_reg_wr_167:
	mov	0x8, %r14
	.word 0xfef38e40  ! 3559: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_288:
	setx	0x3b0210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_289:
	setx	0x3b0036, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_290:
	setx	0x3b0023, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde50000  ! 3570: SAVE_R	save	%r20, %r0, %r30
T0_asi_reg_wr_168:
	mov	0x37, %r14
	.word 0xf6f384a0  ! 3573: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T0_asi_reg_wr_169:
	mov	0x10, %r14
	.word 0xf6f38e40  ! 3574: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xbfe54000  ! 3575: SAVE_R	save	%r21, %r0, %r31
cpu_intr_0_291:
	setx	0x380222, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_279:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_279), 16, 16)) -> intp(0, 0, 34)
	.word 0xb1e4c000  ! 3581: SAVE_R	save	%r19, %r0, %r24
	.word 0xb9342001  ! 3582: SRL_I	srl 	%r16, 0x0001, %r28
cpu_intr_0_292:
	setx	0x3b0118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_280:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_280), 16, 16)) -> intp(0, 0, e)
cpu_intr_0_293:
	setx	0x3a0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb151c000  ! 3586: RDPR_TL	<illegal instruction>
cpu_intr_0_294:
	setx	0x39012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4c000  ! 3595: SAVE_R	save	%r19, %r0, %r29
	.word 0xb1e5a1dc  ! 3596: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_wr_170:
	mov	0x8, %r14
	.word 0xfaf389e0  ! 3602: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
cpu_intr_0_295:
	setx	0x3a032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb17da401  ! 3605: MOVR_I	movre	%r22, 0x1, %r24
	.word 0xbbe54000  ! 3608: SAVE_R	save	%r21, %r0, %r29
	.word 0xb3e5c000  ! 3611: SAVE_R	save	%r23, %r0, %r25
	.word 0xba44e0ce  ! 3613: ADDC_I	addc 	%r19, 0x00ce, %r29
iob_intr_0_281:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_281), 16, 16)) -> intp(0, 0, 28)
	.word 0xbfe4e1f3  ! 3619: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e4e079  ! 3622: SAVE_I	save	%r19, 0x0001, %r25
iob_intr_0_282:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_282), 16, 16)) -> intp(0, 0, 10)
	.word 0xb3e520f9  ! 3625: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb1e560c9  ! 3626: SAVE_I	save	%r21, 0x0001, %r24
T0_asi_reg_rd_172:
	mov	0x3c4, %r14
	.word 0xfedb8e60  ! 3627: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T0_asi_reg_wr_171:
	mov	0x3c3, %r14
	.word 0xf8f38e40  ! 3630: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T0_asi_reg_wr_172:
	mov	0x3c6, %r14
	.word 0xfaf389e0  ! 3631: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbfe5c000  ! 3632: SAVE_R	save	%r23, %r0, %r31
iob_intr_0_283:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_283), 16, 16)) -> intp(0, 0, 12)
T0_asi_reg_wr_173:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 3634: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb3e5c000  ! 3636: SAVE_R	save	%r23, %r0, %r25
	.word 0x8395a06e  ! 3640: WRPR_TNPC_I	wrpr	%r22, 0x006e, %tnpc
	.word 0xb5e50000  ! 3641: SAVE_R	save	%r20, %r0, %r26
iob_intr_0_284:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_284), 16, 16)) -> intp(0, 0, 6)
T0_asi_reg_wr_174:
	mov	0x23, %r14
	.word 0xf6f384a0  ! 3644: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb5e420de  ! 3646: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbd3d7001  ! 3649: SRAX_I	srax	%r21, 0x0001, %r30
	.word 0xb1e4e0fb  ! 3652: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde4a01e  ! 3653: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde5c000  ! 3655: SAVE_R	save	%r23, %r0, %r30
T0_asi_reg_rd_173:
	mov	0x26, %r14
	.word 0xfadb8400  ! 3657: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_0_285:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_285), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbc35c000  ! 3660: SUBC_R	orn 	%r23, %r0, %r30
iob_intr_0_286:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_286), 16, 16)) -> intp(0, 0, 4)
cpu_intr_0_296:
	setx	0x3c0333, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_175:
	mov	0x5, %r14
	.word 0xf8f38e60  ! 3665: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T0_asi_reg_wr_176:
	mov	0x30, %r14
	.word 0xfaf38e80  ! 3667: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T0_asi_reg_rd_174:
	mov	0x3c6, %r14
	.word 0xf4db8400  ! 3668: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xbde48000  ! 3670: SAVE_R	save	%r18, %r0, %r30
iob_intr_0_287:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_287), 16, 16)) -> intp(0, 0, 22)
T0_asi_reg_wr_177:
	mov	0x13, %r14
	.word 0xf0f38e60  ! 3673: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_0_288:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_288), 16, 16)) -> intp(0, 0, 33)
	.word 0xbd643801  ! 3676: MOVcc_I	<illegal instruction>
	.word 0x8d952001  ! 3677: WRPR_PSTATE_I	wrpr	%r20, 0x0001, %pstate
iob_intr_0_289:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_289), 16, 16)) -> intp(0, 0, 14)
	.word 0xb1e40000  ! 3683: SAVE_R	save	%r16, %r0, %r24
T0_asi_reg_wr_178:
	mov	0x36, %r14
	.word 0xf6f38e40  ! 3684: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_0_290:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_290), 16, 16)) -> intp(0, 0, 17)
	.word 0xbbe50000  ! 3686: SAVE_R	save	%r20, %r0, %r29
	.word 0xba85619d  ! 3690: ADDcc_I	addcc 	%r21, 0x019d, %r29
T0_asi_reg_wr_179:
	mov	0x6, %r14
	.word 0xfcf389e0  ! 3698: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_0_291:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_291), 16, 16)) -> intp(0, 0, 8)
	.word 0xb13c6001  ! 3702: SRA_I	sra 	%r17, 0x0001, %r24
	.word 0xbfe4a13c  ! 3711: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb9e4c000  ! 3714: SAVE_R	save	%r19, %r0, %r28
iob_intr_0_292:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_292), 16, 16)) -> intp(0, 0, 34)
	.word 0xb435609f  ! 3725: SUBC_I	orn 	%r21, 0x009f, %r26
cpu_intr_0_297:
	setx	0x3f0210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe52169  ! 3729: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_rd_175:
	mov	0x21, %r14
	.word 0xf0db8e60  ! 3730: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_0_298:
	setx	0x3c0124, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_299:
	setx	0x3d0301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe44000  ! 3740: SAVE_R	save	%r17, %r0, %r31
cpu_intr_0_300:
	setx	0x3f012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 3743: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_rd_176:
	mov	0x2b, %r14
	.word 0xf0db8e60  ! 3744: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T0_asi_reg_rd_177:
	mov	0x27, %r14
	.word 0xfadb8e60  ! 3746: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb5e52007  ! 3749: SAVE_I	save	%r20, 0x0001, %r26
cpu_intr_0_301:
	setx	0x3e0109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4c000  ! 3768: SAVE_R	save	%r19, %r0, %r29
T0_asi_reg_wr_180:
	mov	0xa, %r14
	.word 0xf4f389e0  ! 3769: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_0_293:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_293), 16, 16)) -> intp(0, 0, 5)
T0_asi_reg_rd_178:
	mov	0x25, %r14
	.word 0xf4db8e40  ! 3775: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xba1c0000  ! 3777: XOR_R	xor 	%r16, %r0, %r29
cpu_intr_0_302:
	setx	0x3f010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_179:
	mov	0x3c7, %r14
	.word 0xfcdb8e40  ! 3783: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb9e54000  ! 3784: SAVE_R	save	%r21, %r0, %r28
iob_intr_0_294:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_294), 16, 16)) -> intp(0, 0, e)
	.word 0xb1e52138  ! 3789: SAVE_I	save	%r20, 0x0001, %r24
cpu_intr_0_303:
	setx	0x3c013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcc44000  ! 3793: ADDCcc_R	addccc 	%r17, %r0, %r30
	.word 0xb9e50000  ! 3795: SAVE_R	save	%r20, %r0, %r28
T0_asi_reg_wr_181:
	mov	0x1c, %r14
	.word 0xfaf38e80  ! 3797: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_0_295:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_295), 16, 16)) -> intp(0, 0, 34)
	.word 0xbbe5e1ff  ! 3800: SAVE_I	save	%r23, 0x0001, %r29
T0_asi_reg_rd_180:
	mov	0x1c, %r14
	.word 0xf2db8e80  ! 3801: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb7e4c000  ! 3802: SAVE_R	save	%r19, %r0, %r27
cpu_intr_0_304:
	setx	0x3d0228, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_181:
	mov	0x7, %r14
	.word 0xfedb8e80  ! 3806: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
iob_intr_0_296:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_296), 16, 16)) -> intp(0, 0, 1e)
iob_intr_0_297:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_297), 16, 16)) -> intp(0, 0, 2d)
	.word 0xa1902002  ! 3810: WRPR_GL_I	wrpr	%r0, 0x0002, %-
T0_asi_reg_rd_182:
	mov	0x23, %r14
	.word 0xf2db89e0  ! 3812: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb4b4a118  ! 3817: SUBCcc_I	orncc 	%r18, 0x0118, %r26
	.word 0xb5e5c000  ! 3818: SAVE_R	save	%r23, %r0, %r26
iob_intr_0_298:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_298), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_305:
	setx	0x3e013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_299:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_299), 16, 16)) -> intp(0, 0, 32)
	.word 0xb9e560f5  ! 3825: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb9e58000  ! 3827: SAVE_R	save	%r22, %r0, %r28
	.word 0xb9e460c3  ! 3828: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb9e46114  ! 3829: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_300:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_300), 16, 16)) -> intp(0, 0, a)
cpu_intr_0_306:
	setx	0x3d0120, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_301:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_301), 16, 16)) -> intp(0, 0, 1b)
	.word 0xbde44000  ! 3836: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_307:
	setx	0x3f0219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde48000  ! 3841: SAVE_R	save	%r18, %r0, %r30
	.word 0xb52db001  ! 3843: SLLX_I	sllx	%r22, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e40000  ! 3848: SAVE_R	save	%r16, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_rd_183:
	mov	0x3c3, %r14
	.word 0xf4db8e40  ! 3851: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_302:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_302), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_308:
	setx	0x3e003e, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_182:
	mov	0x3c2, %r14
	.word 0xf2f38400  ! 3856: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T0_asi_reg_wr_183:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 3857: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T0_asi_reg_wr_184:
	mov	0x3c0, %r14
	.word 0xf2f38e40  ! 3859: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_0_309:
	setx	0x3f0327, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xba0cc000  ! 3868: AND_R	and 	%r19, %r0, %r29
	.word 0xb9e44000  ! 3869: SAVE_R	save	%r17, %r0, %r28
	.word 0xb9e50000  ! 3875: SAVE_R	save	%r20, %r0, %r28
	.word 0xb1e4a043  ! 3876: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e5a0a4  ! 3877: SAVE_I	save	%r22, 0x0001, %r24
T0_asi_reg_rd_184:
	mov	0x3c2, %r14
	.word 0xf8db8e40  ! 3878: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb77de401  ! 3879: MOVR_I	movre	%r23, 0x1, %r27
	.word 0xbfe5c000  ! 3880: SAVE_R	save	%r23, %r0, %r31
T0_asi_reg_rd_185:
	mov	0x18, %r14
	.word 0xfcdb84a0  ! 3881: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbd3d4000  ! 3882: SRA_R	sra 	%r21, %r0, %r30
cpu_intr_0_310:
	setx	0x3f0314, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_303:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_303), 16, 16)) -> intp(0, 0, 35)
	.word 0xb6044000  ! 3885: ADD_R	add 	%r17, %r0, %r27
	.word 0xbfe42118  ! 3886: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb2b4614c  ! 3892: ORNcc_I	orncc 	%r17, 0x014c, %r25
	.word 0xbfe4e0c8  ! 3894: SAVE_I	save	%r19, 0x0001, %r31
T0_asi_reg_wr_185:
	mov	0x13, %r14
	.word 0xf2f38e60  ! 3899: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T0_asi_reg_wr_186:
	mov	0xf, %r14
	.word 0xf2f38e60  ! 3903: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb3e48000  ! 3905: SAVE_R	save	%r18, %r0, %r25
iob_intr_0_304:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_304), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_wr_187:
	mov	0x10, %r14
	.word 0xf8f38e60  ! 3907: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xbaa40000  ! 3908: SUBcc_R	subcc 	%r16, %r0, %r29
	.word 0xb7e4c000  ! 3909: SAVE_R	save	%r19, %r0, %r27
T0_asi_reg_rd_186:
	mov	0xa, %r14
	.word 0xfadb8e60  ! 3913: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_0_305:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_305), 16, 16)) -> intp(0, 0, 23)
	.word 0xb7347001  ! 3917: SRLX_I	srlx	%r17, 0x0001, %r27
T0_asi_reg_wr_188:
	mov	0x4, %r14
	.word 0xfef384a0  ! 3918: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
T0_asi_reg_rd_187:
	mov	0x38, %r14
	.word 0xf4db8e80  ! 3923: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T0_asi_reg_wr_189:
	mov	0x18, %r14
	.word 0xfcf38e60  ! 3924: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_0_306:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_306), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbde54000  ! 3927: SAVE_R	save	%r21, %r0, %r30
cpu_intr_0_311:
	setx	0x3c0222, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_312:
	setx	0x3d0321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcbc4000  ! 3931: XNORcc_R	xnorcc 	%r17, %r0, %r30
T0_asi_reg_rd_188:
	mov	0x3c3, %r14
	.word 0xfadb8400  ! 3936: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_0_313:
	setx	0x3f0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 3939: SAVE_R	save	%r17, %r0, %r28
T0_asi_reg_rd_189:
	mov	0x26, %r14
	.word 0xf2db8e60  ! 3946: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb9e5e0ac  ! 3947: SAVE_I	save	%r23, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb6a44000  ! 3949: SUBcc_R	subcc 	%r17, %r0, %r27
cpu_intr_0_314:
	setx	0x3d0125, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_190:
	mov	0x3c5, %r14
	.word 0xf0f38e80  ! 3953: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T0_asi_reg_rd_190:
	mov	0x3c4, %r14
	.word 0xfadb84a0  ! 3959: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_0_315:
	setx	0x3c0126, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_307:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_307), 16, 16)) -> intp(0, 0, 10)
iob_intr_0_308:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_308), 16, 16)) -> intp(0, 0, 31)
T0_asi_reg_rd_191:
	mov	0x3c6, %r14
	.word 0xfadb8400  ! 3968: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_0_309:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_309), 16, 16)) -> intp(0, 0, 11)
iob_intr_0_310:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_310), 16, 16)) -> intp(0, 0, c)
	.word 0xbbe5e1c4  ! 3973: SAVE_I	save	%r23, 0x0001, %r29
iob_intr_0_311:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_311), 16, 16)) -> intp(0, 0, 21)
	.word 0xb5e5603a  ! 3978: SAVE_I	save	%r21, 0x0001, %r26
cpu_intr_0_316:
	setx	0x3d023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4952106  ! 3982: ORcc_I	orcc 	%r20, 0x0106, %r26
	.word 0xb5e42065  ! 3985: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e56099  ! 3986: SAVE_I	save	%r21, 0x0001, %r27
cpu_intr_0_317:
	setx	0x3f033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_192:
	mov	0xf, %r14
	.word 0xf8db8e40  ! 3992: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_0_318:
	setx	0x3d003a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1641800  ! 3995: MOVcc_R	<illegal instruction>
	.word 0xb41d2140  ! 4001: XOR_I	xor 	%r20, 0x0140, %r26
iob_intr_0_312:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_312), 16, 16)) -> intp(0, 0, 33)
iob_intr_0_313:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_313), 16, 16)) -> intp(0, 0, 38)
	.word 0xb9e48000  ! 4006: SAVE_R	save	%r18, %r0, %r28
	.word 0xba15c000  ! 4007: OR_R	or 	%r23, %r0, %r29
cpu_intr_0_319:
	setx	0x3f030f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_193:
	mov	0x1a, %r14
	.word 0xf8db89e0  ! 4011: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e4e131  ! 4013: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e5c000  ! 4014: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_rd_194:
	mov	0x8, %r14
	.word 0xf0db8e40  ! 4018: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T0_asi_reg_rd_195:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 4023: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T0_asi_reg_rd_196:
	mov	0x3c8, %r14
	.word 0xfadb8e60  ! 4025: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T0_asi_reg_rd_197:
	mov	0x19, %r14
	.word 0xfcdb8e80  ! 4029: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbfe54000  ! 4031: SAVE_R	save	%r21, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_0_320:
	setx	0x3e002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_314:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_314), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_315:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_315), 16, 16)) -> intp(0, 0, 1a)
T0_asi_reg_wr_191:
	mov	0x27, %r14
	.word 0xf6f389e0  ! 4041: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbbe4a1fd  ! 4042: SAVE_I	save	%r18, 0x0001, %r29
cpu_intr_0_321:
	setx	0x3f0138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde421df  ! 4051: SAVE_I	save	%r16, 0x0001, %r30
iob_intr_0_316:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_316), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbbe4a009  ! 4061: SAVE_I	save	%r18, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e52078  ! 4065: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_wr_192:
	mov	0x3c8, %r14
	.word 0xf8f38400  ! 4069: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_0_317:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_317), 16, 16)) -> intp(0, 0, 10)
	.word 0xbd358000  ! 4071: SRL_R	srl 	%r22, %r0, %r30
T0_asi_reg_wr_193:
	mov	0x3c7, %r14
	.word 0xf2f38e40  ! 4074: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_318:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_318), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_319:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_319), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbfe58000  ! 4079: SAVE_R	save	%r22, %r0, %r31
	.word 0x8d94e03b  ! 4080: WRPR_PSTATE_I	wrpr	%r19, 0x003b, %pstate
cpu_intr_0_322:
	setx	0x430032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8f902002  ! 4082: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xb9e5a11d  ! 4084: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e5a0f0  ! 4085: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_320:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_320), 16, 16)) -> intp(0, 0, 0)
T0_asi_reg_rd_198:
	mov	0x7, %r14
	.word 0xfedb8e80  ! 4089: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_0_323:
	setx	0x410113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_321:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_321), 16, 16)) -> intp(0, 0, 16)
iob_intr_0_322:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_322), 16, 16)) -> intp(0, 0, 18)
T0_asi_reg_rd_199:
	mov	0x3c0, %r14
	.word 0xf4db8e40  ! 4093: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbe940000  ! 4096: ORcc_R	orcc 	%r16, %r0, %r31
	.word 0xb7e5a173  ! 4097: SAVE_I	save	%r22, 0x0001, %r27
iob_intr_0_323:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_323), 16, 16)) -> intp(0, 0, 39)
cpu_intr_0_324:
	setx	0x400230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_325:
	setx	0x420236, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_200:
	mov	0x13, %r14
	.word 0xf2db84a0  ! 4109: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xb3e40000  ! 4110: SAVE_R	save	%r16, %r0, %r25
T0_asi_reg_wr_194:
	mov	0x10, %r14
	.word 0xf8f38e60  ! 4113: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_0_326:
	setx	0x420028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_324:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_324), 16, 16)) -> intp(0, 0, 3a)
T0_asi_reg_wr_195:
	mov	0x26, %r14
	.word 0xfcf38e40  ! 4117: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_0_325:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_325), 16, 16)) -> intp(0, 0, 10)
	.word 0xbfe5c000  ! 4120: SAVE_R	save	%r23, %r0, %r31
cpu_intr_0_327:
	setx	0x410038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8d0000  ! 4122: ANDcc_R	andcc 	%r20, %r0, %r30
	.word 0xb3e52120  ! 4126: SAVE_I	save	%r20, 0x0001, %r25
T0_asi_reg_rd_201:
	mov	0x3c2, %r14
	.word 0xf6db89e0  ! 4129: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb3643801  ! 4130: MOVcc_I	<illegal instruction>
	.word 0xbfe50000  ! 4131: SAVE_R	save	%r20, %r0, %r31
	.word 0xb9e52132  ! 4132: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_328:
	setx	0x41023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_329:
	setx	0x400136, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_202:
	mov	0x24, %r14
	.word 0xf2db84a0  ! 4140: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_0_330:
	setx	0x420226, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_331:
	setx	0x400330, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_196:
	mov	0x2e, %r14
	.word 0xf8f384a0  ! 4148: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
cpu_intr_0_332:
	setx	0x40011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_203:
	mov	0x14, %r14
	.word 0xfedb8e60  ! 4152: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_0_333:
	setx	0x40032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4c000  ! 4156: SAVE_R	save	%r19, %r0, %r29
cpu_intr_0_334:
	setx	0x400216, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_204:
	mov	0x1b, %r14
	.word 0xf4db8e40  ! 4158: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb7e54000  ! 4160: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_335:
	setx	0x420134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a1ef  ! 4166: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde4a12b  ! 4171: SAVE_I	save	%r18, 0x0001, %r30
cpu_intr_0_336:
	setx	0x43010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_337:
	setx	0x420222, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_205:
	mov	0x3c6, %r14
	.word 0xf2db8e60  ! 4178: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_0_338:
	setx	0x42031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_326:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_326), 16, 16)) -> intp(0, 0, 16)
	.word 0xb5e54000  ! 4183: SAVE_R	save	%r21, %r0, %r26
	.word 0xb1e4a1c9  ! 4184: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7e4c000  ! 4185: SAVE_R	save	%r19, %r0, %r27
	.word 0xb08d21e4  ! 4187: ANDcc_I	andcc 	%r20, 0x01e4, %r24
iob_intr_0_327:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_327), 16, 16)) -> intp(0, 0, 0)
iob_intr_0_328:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_328), 16, 16)) -> intp(0, 0, 33)
cpu_intr_0_339:
	setx	0x420224, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_340:
	setx	0x420024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb500000  ! 4193: RDPR_TPC	<illegal instruction>
	.word 0xb605213a  ! 4196: ADD_I	add 	%r20, 0x013a, %r27
	.word 0xb1e5e1b0  ! 4199: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_wr_197:
	mov	0x33, %r14
	.word 0xfcf38400  ! 4202: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T0_asi_reg_wr_198:
	mov	0x36, %r14
	.word 0xfcf38e40  ! 4209: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_0_341:
	setx	0x40013a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_329:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_329), 16, 16)) -> intp(0, 0, 16)
	.word 0xb3e48000  ! 4217: SAVE_R	save	%r18, %r0, %r25
cpu_intr_0_342:
	setx	0x410020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e58000  ! 4224: SAVE_R	save	%r22, %r0, %r26
cpu_intr_0_343:
	setx	0x410313, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_344:
	setx	0x42022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e09b  ! 4233: SAVE_I	save	%r19, 0x0001, %r31
cpu_intr_0_345:
	setx	0x40021b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0c48000  ! 4235: ADDCcc_R	addccc 	%r18, %r0, %r24
iob_intr_0_330:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_330), 16, 16)) -> intp(0, 0, 1e)
cpu_intr_0_346:
	setx	0x42012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde58000  ! 4250: SAVE_R	save	%r22, %r0, %r30
iob_intr_0_331:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_331), 16, 16)) -> intp(0, 0, 3)
cpu_intr_0_347:
	setx	0x41010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_199:
	mov	0x3c3, %r14
	.word 0xfef38e60  ! 4259: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_0_348:
	setx	0x43031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb68c8000  ! 4262: ANDcc_R	andcc 	%r18, %r0, %r27
iob_intr_0_332:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_332), 16, 16)) -> intp(0, 0, 9)
T0_asi_reg_wr_200:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 4271: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_0_349:
	setx	0x400230, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe52040  ! 4278: SAVE_I	save	%r20, 0x0001, %r31
T0_asi_reg_rd_206:
	mov	0x29, %r14
	.word 0xfcdb8e40  ! 4286: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb5e4608c  ! 4287: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5e40000  ! 4292: SAVE_R	save	%r16, %r0, %r26
	.word 0xb4b4e040  ! 4295: SUBCcc_I	orncc 	%r19, 0x0040, %r26
iob_intr_0_333:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_333), 16, 16)) -> intp(0, 0, 22)
iob_intr_0_334:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_334), 16, 16)) -> intp(0, 0, 11)
T0_asi_reg_wr_201:
	mov	0x3c6, %r14
	.word 0xfaf38400  ! 4301: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_0_350:
	setx	0x400312, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_335:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_335), 16, 16)) -> intp(0, 0, 23)
	.word 0xbfe5a1df  ! 4306: SAVE_I	save	%r22, 0x0001, %r31
cpu_intr_0_351:
	setx	0x43002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e46047  ! 4309: SAVE_I	save	%r17, 0x0001, %r28
cpu_intr_0_352:
	setx	0x400221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb73dd000  ! 4314: SRAX_R	srax	%r23, %r0, %r27
	.word 0xb1e4e11f  ! 4315: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb3e54000  ! 4320: SAVE_R	save	%r21, %r0, %r25
cpu_intr_0_353:
	setx	0x410112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde54000  ! 4322: SAVE_R	save	%r21, %r0, %r30
iob_intr_0_336:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_336), 16, 16)) -> intp(0, 0, 3a)
cpu_intr_0_354:
	setx	0x41032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e48000  ! 4328: SAVE_R	save	%r18, %r0, %r24
iob_intr_0_337:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_337), 16, 16)) -> intp(0, 0, 1c)
cpu_intr_0_355:
	setx	0x420102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b5c000  ! 4334: ORNcc_R	orncc 	%r23, %r0, %r25
cpu_intr_0_356:
	setx	0x410029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_357:
	setx	0x410034, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_358:
	setx	0x410224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb134b001  ! 4340: SRLX_I	srlx	%r18, 0x0001, %r24
	.word 0xb7e5c000  ! 4342: SAVE_R	save	%r23, %r0, %r27
iob_intr_0_338:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_338), 16, 16)) -> intp(0, 0, d)
	.word 0xbfe5c000  ! 4345: SAVE_R	save	%r23, %r0, %r31
cpu_intr_0_359:
	setx	0x43022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe521db  ! 4348: SAVE_I	save	%r20, 0x0001, %r29
iob_intr_0_339:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_339), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_wr_202:
	mov	0x3c1, %r14
	.word 0xf0f38e80  ! 4350: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb6848000  ! 4352: ADDcc_R	addcc 	%r18, %r0, %r27
	.word 0xb8b5e1a8  ! 4354: ORNcc_I	orncc 	%r23, 0x01a8, %r28
iob_intr_0_340:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_340), 16, 16)) -> intp(0, 0, 35)
T0_asi_reg_rd_207:
	mov	0x3c7, %r14
	.word 0xf6db8e80  ! 4357: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_0_341:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_341), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_342:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_342), 16, 16)) -> intp(0, 0, 1b)
iob_intr_0_343:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_343), 16, 16)) -> intp(0, 0, 2b)
cpu_intr_0_360:
	setx	0x43003d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_344:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_344), 16, 16)) -> intp(0, 0, 3a)
iob_intr_0_345:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_345), 16, 16)) -> intp(0, 0, 1c)
T0_asi_reg_wr_203:
	mov	0x38, %r14
	.word 0xf8f38e40  ! 4377: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbbe54000  ! 4382: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_346:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_346), 16, 16)) -> intp(0, 0, 35)
	.word 0xb1e50000  ! 4389: SAVE_R	save	%r20, %r0, %r24
T0_asi_reg_wr_204:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 4390: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_0_347:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_347), 16, 16)) -> intp(0, 0, 4)
cpu_intr_0_361:
	setx	0x410122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc354000  ! 4393: SUBC_R	orn 	%r21, %r0, %r30
	.word 0xb9e4610d  ! 4396: SAVE_I	save	%r17, 0x0001, %r28
iob_intr_0_348:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_348), 16, 16)) -> intp(0, 0, 24)
	.word 0xbd50c000  ! 4405: RDPR_TT	<illegal instruction>
T0_asi_reg_rd_208:
	mov	0x18, %r14
	.word 0xfcdb84a0  ! 4406: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_0_362:
	setx	0x41011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_209:
	mov	0x1c, %r14
	.word 0xf4db8e40  ! 4411: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_0_363:
	setx	0x42032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e50000  ! 4414: SAVE_R	save	%r20, %r0, %r24
cpu_intr_0_364:
	setx	0x420239, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_rd_210:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 4420: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_0_349:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_349), 16, 16)) -> intp(0, 0, 4)
	.word 0xb1e5e09e  ! 4428: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbfe560e7  ! 4432: SAVE_I	save	%r21, 0x0001, %r31
T0_asi_reg_rd_211:
	mov	0x25, %r14
	.word 0xf8db84a0  ! 4433: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T0_asi_reg_rd_212:
	mov	0x3c7, %r14
	.word 0xf4db8e60  ! 4434: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_0_365:
	setx	0x410028, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_366:
	setx	0x430101, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_367:
	setx	0x430138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb535c000  ! 4441: SRL_R	srl 	%r23, %r0, %r26
	.word 0xb5e4c000  ! 4443: SAVE_R	save	%r19, %r0, %r26
	.word 0xb9e52027  ! 4444: SAVE_I	save	%r20, 0x0001, %r28
cpu_intr_0_368:
	setx	0x2031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a073  ! 4447: SAVE_I	save	%r22, 0x0001, %r29
T0_asi_reg_rd_213:
	mov	0x1b, %r14
	.word 0xfedb8e40  ! 4448: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbfe4c000  ! 4449: SAVE_R	save	%r19, %r0, %r31
cpu_intr_0_369:
	setx	0x420000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde52028  ! 4452: SAVE_I	save	%r20, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e5c000  ! 4454: SAVE_R	save	%r23, %r0, %r24
T0_asi_reg_wr_205:
	mov	0x3c4, %r14
	.word 0xf2f384a0  ! 4455: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T0_asi_reg_rd_214:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 4456: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb3e56139  ! 4461: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb4a58000  ! 4464: SUBcc_R	subcc 	%r22, %r0, %r26
	.word 0xbde44000  ! 4465: SAVE_R	save	%r17, %r0, %r30
	.word 0xbde46128  ! 4467: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb535d000  ! 4469: SRLX_R	srlx	%r23, %r0, %r26
cpu_intr_0_370:
	setx	0x410308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a02c  ! 4472: SAVE_I	save	%r18, 0x0001, %r24
iob_intr_0_350:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_350), 16, 16)) -> intp(0, 0, 1f)
	.word 0xbbe5c000  ! 4477: SAVE_R	save	%r23, %r0, %r29
T0_asi_reg_wr_206:
	mov	0x6, %r14
	.word 0xfef38400  ! 4479: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_0_351:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_351), 16, 16)) -> intp(0, 0, 5)
cpu_intr_0_371:
	setx	0x42013c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_352:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_352), 16, 16)) -> intp(0, 0, 10)
	.word 0xb9e4e0ec  ! 4488: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1e50000  ! 4489: SAVE_R	save	%r20, %r0, %r24
	.word 0xb7e420f9  ! 4490: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e4e15f  ! 4492: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_372:
	setx	0x43003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a1b7  ! 4494: SAVE_I	save	%r22, 0x0001, %r24
iob_intr_0_353:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_353), 16, 16)) -> intp(0, 0, 29)
cpu_intr_0_373:
	setx	0x40011f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_374:
	setx	0x420233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_375:
	setx	0x420305, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a17d  ! 4505: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb0344000  ! 4506: ORN_R	orn 	%r17, %r0, %r24
	.word 0xb3e50000  ! 4510: SAVE_R	save	%r20, %r0, %r25
iob_intr_0_354:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_354), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_wr_207:
	mov	0x3c7, %r14
	.word 0xf6f38e80  ! 4516: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_0_376:
	setx	0x410312, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_355:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_355), 16, 16)) -> intp(0, 0, a)
iob_intr_0_356:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_356), 16, 16)) -> intp(0, 0, 12)
	.word 0xb69c4000  ! 4524: XORcc_R	xorcc 	%r17, %r0, %r27
iob_intr_0_357:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_357), 16, 16)) -> intp(0, 0, c)
	.word 0xbde5a08a  ! 4529: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb4b50000  ! 4533: SUBCcc_R	orncc 	%r20, %r0, %r26
	.word 0xb5e460c8  ! 4534: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbfe520c8  ! 4537: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5e4e176  ! 4540: SAVE_I	save	%r19, 0x0001, %r26
iob_intr_0_358:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_358), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb1e5e1b3  ! 4542: SAVE_I	save	%r23, 0x0001, %r24
T0_asi_reg_rd_215:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 4543: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe5a130  ! 4545: SAVE_I	save	%r22, 0x0001, %r29
iob_intr_0_359:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_359), 16, 16)) -> intp(0, 0, 5)
iob_intr_0_360:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_360), 16, 16)) -> intp(0, 0, 1d)
T0_asi_reg_rd_216:
	mov	0x16, %r14
	.word 0xf8db84a0  ! 4550: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
T0_asi_reg_wr_208:
	mov	0x3c3, %r14
	.word 0xfcf389e0  ! 4553: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb4a54000  ! 4554: SUBcc_R	subcc 	%r21, %r0, %r26
iob_intr_0_361:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_361), 16, 16)) -> intp(0, 0, b)
	.word 0xb7e4a024  ! 4560: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbfe4e08b  ! 4562: SAVE_I	save	%r19, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e58000  ! 4569: SAVE_R	save	%r22, %r0, %r25
iob_intr_0_362:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_362), 16, 16)) -> intp(0, 0, 2e)
iob_intr_0_363:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_363), 16, 16)) -> intp(0, 0, 8)
iob_intr_0_364:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_364), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb7e4a06a  ! 4579: SAVE_I	save	%r18, 0x0001, %r27
cpu_intr_0_377:
	setx	0x45022c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_365:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_365), 16, 16)) -> intp(0, 0, 26)
	.word 0xb5e421cc  ! 4588: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbfe5e1fb  ! 4589: SAVE_I	save	%r23, 0x0001, %r31
T0_asi_reg_wr_209:
	mov	0x3, %r14
	.word 0xf0f384a0  ! 4590: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_0_378:
	setx	0x470107, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_210:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 4595: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_0_366:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_366), 16, 16)) -> intp(0, 0, 29)
	.word 0xb4a4e044  ! 4599: SUBcc_I	subcc 	%r19, 0x0044, %r26
cpu_intr_0_379:
	setx	0x44012e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_380:
	setx	0x470310, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb814a0a7  ! 4603: OR_I	or 	%r18, 0x00a7, %r28
	.word 0xbbe4e1f9  ! 4606: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_rd_217:
	mov	0x21, %r14
	.word 0xfadb8e40  ! 4607: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb235e127  ! 4609: ORN_I	orn 	%r23, 0x0127, %r25
	.word 0xb7e4e110  ! 4610: SAVE_I	save	%r19, 0x0001, %r27
cpu_intr_0_381:
	setx	0x46021a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_367:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_367), 16, 16)) -> intp(0, 0, 1c)
	.word 0xbfe421f0  ! 4618: SAVE_I	save	%r16, 0x0001, %r31
cpu_intr_0_382:
	setx	0x470116, %g1, %o0
	ta	T_SEND_THRD_INTR
T0_asi_reg_wr_211:
	mov	0x3c7, %r14
	.word 0xfaf384a0  ! 4621: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb1e54000  ! 4622: SAVE_R	save	%r21, %r0, %r24
	.word 0xb7e5c000  ! 4624: SAVE_R	save	%r23, %r0, %r27
T0_asi_reg_wr_212:
	mov	0x3c1, %r14
	.word 0xfcf389e0  ! 4626: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_0_368:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_368), 16, 16)) -> intp(0, 0, 2a)
T0_asi_reg_rd_218:
	mov	0x17, %r14
	.word 0xf0db8e60  ! 4631: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xbde460ab  ! 4633: SAVE_I	save	%r17, 0x0001, %r30
iob_intr_0_369:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_369), 16, 16)) -> intp(0, 0, b)
	.word 0xb3e40000  ! 4637: SAVE_R	save	%r16, %r0, %r25
	.word 0xbfe521bc  ! 4638: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbabd4000  ! 4639: XNORcc_R	xnorcc 	%r21, %r0, %r29
T0_asi_reg_wr_213:
	mov	0x2f, %r14
	.word 0xfaf38400  ! 4643: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_0_370:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_370), 16, 16)) -> intp(0, 0, 28)
iob_intr_0_371:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_371), 16, 16)) -> intp(0, 0, 1d)
T0_asi_reg_rd_219:
	mov	0x27, %r14
	.word 0xfadb89e0  ! 4655: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T0_asi_reg_rd_220:
	mov	0x15, %r14
	.word 0xf8db8400  ! 4657: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_0_372:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_372), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb1e4e1d9  ! 4660: SAVE_I	save	%r19, 0x0001, %r24
T0_asi_reg_rd_221:
	mov	0x3c7, %r14
	.word 0xf0db8e60  ! 4661: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_0_383:
	setx	0x460333, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_384:
	setx	0x470332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e44000  ! 4669: SAVE_R	save	%r17, %r0, %r28
	.word 0xbfe4213b  ! 4670: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbbe48000  ! 4672: SAVE_R	save	%r18, %r0, %r29
iob_intr_0_373:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_373), 16, 16)) -> intp(0, 0, 3)
iob_intr_0_374:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_374), 16, 16)) -> intp(0, 0, 24)
T0_asi_reg_wr_214:
	mov	0x3c8, %r14
	.word 0xfcf38400  ! 4681: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb9e48000  ! 4684: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_wr_215:
	mov	0x30, %r14
	.word 0xf2f38400  ! 4687: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T0_asi_reg_wr_216:
	mov	0x13, %r14
	.word 0xfaf384a0  ! 4689: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb1e52167  ! 4690: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe4e123  ! 4692: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3e40000  ! 4694: SAVE_R	save	%r16, %r0, %r25
cpu_intr_0_385:
	setx	0x460334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_375:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_375), 16, 16)) -> intp(0, 0, 11)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_0_376:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_376), 16, 16)) -> intp(0, 0, 26)
iob_intr_0_377:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_377), 16, 16)) -> intp(0, 0, 12)
	.word 0xbbe40000  ! 4707: SAVE_R	save	%r16, %r0, %r29
	.word 0xb3e5a0e6  ! 4708: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb0ad0000  ! 4709: ANDNcc_R	andncc 	%r20, %r0, %r24
	.word 0xb1e44000  ! 4713: SAVE_R	save	%r17, %r0, %r24
cpu_intr_0_386:
	setx	0x45021d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_387:
	setx	0x440117, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_388:
	setx	0x460314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_389:
	setx	0x47011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5351000  ! 4720: SRLX_R	srlx	%r20, %r0, %r26
T0_asi_reg_rd_222:
	mov	0x7, %r14
	.word 0xfcdb8e60  ! 4721: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbfe4c000  ! 4722: SAVE_R	save	%r19, %r0, %r31
T0_asi_reg_wr_217:
	mov	0x16, %r14
	.word 0xf6f38400  ! 4723: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xbbe4e1fc  ! 4724: SAVE_I	save	%r19, 0x0001, %r29
T0_asi_reg_wr_218:
	mov	0x27, %r14
	.word 0xfef384a0  ! 4729: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xbde52037  ! 4733: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbea42125  ! 4738: SUBcc_I	subcc 	%r16, 0x0125, %r31
	.word 0xbbe5c000  ! 4741: SAVE_R	save	%r23, %r0, %r29
	.word 0xbbe54000  ! 4742: SAVE_R	save	%r21, %r0, %r29
iob_intr_0_378:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_378), 16, 16)) -> intp(0, 0, 18)
cpu_intr_0_390:
	setx	0x45013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e4e1c8  ! 4746: SAVE_I	save	%r19, 0x0001, %r26
cpu_intr_0_391:
	setx	0x470212, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_392:
	setx	0x440333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a0f5  ! 4750: SAVE_I	save	%r22, 0x0001, %r29
cpu_intr_0_393:
	setx	0x440337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_379:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_379), 16, 16)) -> intp(0, 0, 18)
	.word 0xb5e4c000  ! 4758: SAVE_R	save	%r19, %r0, %r26
	.word 0xb3e58000  ! 4759: SAVE_R	save	%r22, %r0, %r25
	.word 0xb9e4c000  ! 4760: SAVE_R	save	%r19, %r0, %r28
cpu_intr_0_394:
	setx	0x460314, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe40000  ! 4763: SAVE_R	save	%r16, %r0, %r29
T0_asi_reg_wr_219:
	mov	0x3c3, %r14
	.word 0xfcf389e0  ! 4764: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb9e4a1d5  ! 4765: SAVE_I	save	%r18, 0x0001, %r28
iob_intr_0_380:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_380), 16, 16)) -> intp(0, 0, 30)
	.word 0xbbe4a123  ! 4772: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb09de118  ! 4773: XORcc_I	xorcc 	%r23, 0x0118, %r24
	.word 0xb5e5a1a1  ! 4775: SAVE_I	save	%r22, 0x0001, %r26
cpu_intr_0_395:
	setx	0x450108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb01c8000  ! 4781: XOR_R	xor 	%r18, %r0, %r24
cpu_intr_0_396:
	setx	0x47032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd7d8400  ! 4784: MOVR_R	movre	%r22, %r0, %r30
	.word 0xb5e520af  ! 4790: SAVE_I	save	%r20, 0x0001, %r26
iob_intr_0_381:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_381), 16, 16)) -> intp(0, 0, 2)
	.word 0xb1e4e064  ! 4795: SAVE_I	save	%r19, 0x0001, %r24
cpu_intr_0_397:
	setx	0x44001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5e54000  ! 4799: SAVE_R	save	%r21, %r0, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T0_asi_reg_wr_220:
	mov	0x17, %r14
	.word 0xfaf38400  ! 4806: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
iob_intr_0_382:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_382), 16, 16)) -> intp(0, 0, 14)
iob_intr_0_383:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_383), 16, 16)) -> intp(0, 0, 2d)
T0_asi_reg_rd_223:
	mov	0x2b, %r14
	.word 0xf4db8e60  ! 4812: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xbbe56054  ! 4813: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb3e4e016  ! 4814: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbeb50000  ! 4817: SUBCcc_R	orncc 	%r20, %r0, %r31
iob_intr_0_384:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_384), 16, 16)) -> intp(0, 0, 4)
iob_intr_0_385:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_385), 16, 16)) -> intp(0, 0, 19)
cpu_intr_0_398:
	setx	0x470028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4211a  ! 4828: SAVE_I	save	%r16, 0x0001, %r24
iob_intr_0_386:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_386), 16, 16)) -> intp(0, 0, 37)
	.word 0xb1e5c000  ! 4831: SAVE_R	save	%r23, %r0, %r24
	.word 0xbf2da001  ! 4832: SLL_I	sll 	%r22, 0x0001, %r31
T0_asi_reg_wr_221:
	mov	0x3c5, %r14
	.word 0xf0f38e80  ! 4834: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xa1902001  ! 4835: WRPR_GL_I	wrpr	%r0, 0x0001, %-
iob_intr_0_387:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_387), 16, 16)) -> intp(0, 0, 7)
T0_asi_reg_wr_222:
	mov	0x3c0, %r14
	.word 0xfaf38e80  ! 4841: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xb9e48000  ! 4842: SAVE_R	save	%r18, %r0, %r28
cpu_intr_0_399:
	setx	0x460138, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_388:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_388), 16, 16)) -> intp(0, 0, 15)
T0_asi_reg_rd_224:
	mov	0x3c6, %r14
	.word 0xf6db8400  ! 4845: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xbbe4a0b3  ! 4846: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb5e4a11d  ! 4850: SAVE_I	save	%r18, 0x0001, %r26
cpu_intr_0_400:
	setx	0x45021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e101  ! 4853: SAVE_I	save	%r19, 0x0001, %r31
iob_intr_0_389:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_389), 16, 16)) -> intp(0, 0, 34)
cpu_intr_0_401:
	setx	0x440105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_0_402:
	setx	0x45022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b5a055  ! 4865: SUBCcc_I	orncc 	%r22, 0x0055, %r28
T0_asi_reg_wr_223:
	mov	0x2e, %r14
	.word 0xfef38e80  ! 4867: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb1e58000  ! 4869: SAVE_R	save	%r22, %r0, %r24
	.word 0xbde58000  ! 4871: SAVE_R	save	%r22, %r0, %r30
	.word 0xbfe58000  ! 4872: SAVE_R	save	%r22, %r0, %r31
	.word 0xbde5c000  ! 4875: SAVE_R	save	%r23, %r0, %r30
cpu_intr_0_403:
	setx	0x460030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 4879: SAVE_R	save	%r21, %r0, %r27
iob_intr_0_390:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_390), 16, 16)) -> intp(0, 0, 8)
	.word 0xb7e58000  ! 4884: SAVE_R	save	%r22, %r0, %r27
iob_intr_0_391:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_391), 16, 16)) -> intp(0, 0, 21)
	.word 0xbde4e194  ! 4886: SAVE_I	save	%r19, 0x0001, %r30
iob_intr_0_392:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_392), 16, 16)) -> intp(0, 0, 16)
cpu_intr_0_404:
	setx	0x470036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9643801  ! 4891: MOVcc_I	<illegal instruction>
	.word 0xbc0561bf  ! 4893: ADD_I	add 	%r21, 0x01bf, %r30
cpu_intr_0_405:
	setx	0x470210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde46182  ! 4895: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe5a1dc  ! 4897: SAVE_I	save	%r22, 0x0001, %r29
cpu_intr_0_406:
	setx	0x46032e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 4899: SAVE_R	save	%r21, %r0, %r27
T0_asi_reg_rd_225:
	mov	0x28, %r14
	.word 0xfedb84a0  ! 4900: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_0_407:
	setx	0x440214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_393:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_393), 16, 16)) -> intp(0, 0, 27)
iob_intr_0_394:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_394), 16, 16)) -> intp(0, 0, 36)
	.word 0xb9e5e016  ! 4907: SAVE_I	save	%r23, 0x0001, %r28
iob_intr_0_395:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_395), 16, 16)) -> intp(0, 0, a)
	.word 0xb9e48000  ! 4912: SAVE_R	save	%r18, %r0, %r28
T0_asi_reg_rd_226:
	mov	0x7, %r14
	.word 0xf2db89e0  ! 4913: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb9e44000  ! 4914: SAVE_R	save	%r17, %r0, %r28
	.word 0xbde44000  ! 4916: SAVE_R	save	%r17, %r0, %r30
cpu_intr_0_408:
	setx	0x440001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe42148  ! 4920: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbabca088  ! 4921: XNORcc_I	xnorcc 	%r18, 0x0088, %r29
	.word 0xb1e460c0  ! 4922: SAVE_I	save	%r17, 0x0001, %r24
cpu_intr_0_409:
	setx	0x450033, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe48000  ! 4928: SAVE_R	save	%r18, %r0, %r31
	.word 0xb7e461fc  ! 4929: SAVE_I	save	%r17, 0x0001, %r27
T0_asi_reg_rd_227:
	mov	0x3c8, %r14
	.word 0xfcdb8e80  ! 4931: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb5e4e02b  ! 4933: SAVE_I	save	%r19, 0x0001, %r26
T0_asi_reg_rd_228:
	mov	0x1b, %r14
	.word 0xf6db8e40  ! 4939: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_410:
	setx	0x470124, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_396:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_396), 16, 16)) -> intp(0, 0, 19)
	.word 0xbfe521f1  ! 4943: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb9e5e083  ! 4945: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe4c000  ! 4947: SAVE_R	save	%r19, %r0, %r29
	.word 0xbfe521c3  ! 4950: SAVE_I	save	%r20, 0x0001, %r31
cpu_intr_0_411:
	setx	0x450118, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e54000  ! 4954: SAVE_R	save	%r21, %r0, %r27
cpu_intr_0_412:
	setx	0x45031a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_397:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_397), 16, 16)) -> intp(0, 0, c)
iob_intr_0_398:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_398), 16, 16)) -> intp(0, 0, 18)
iob_intr_0_399:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_399), 16, 16)) -> intp(0, 0, 3c)
cpu_intr_0_413:
	setx	0x450218, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_0_400:
!$EV trig_pc_d(0,expr(@VA(.MAIN.iob_intr_0_400), 16, 16)) -> intp(0, 0, 9)
	.word 0xb7e50000  ! 4975: SAVE_R	save	%r20, %r0, %r27
cpu_intr_0_414:
	setx	0x46021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0240000  ! 4980: SUB_R	sub 	%r16, %r0, %r24
	.word 0xb5e50000  ! 4982: SAVE_R	save	%r20, %r0, %r26
	.word 0xb3e4e0c2  ! 4983: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbab40000  ! 4985: ORNcc_R	orncc 	%r16, %r0, %r29
T0_asi_reg_rd_229:
	mov	0x3c5, %r14
	.word 0xf6db8e40  ! 4987: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_0_415:
	setx	0x46021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e54000  ! 4991: SAVE_R	save	%r21, %r0, %r28
	.word 0xb5e4e070  ! 4992: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbe0d0000  ! 4996: AND_R	and 	%r20, %r0, %r31
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
cpu_intr_3_0:
	setx	0x180309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2c4204b  ! 3: ADDCcc_I	addccc 	%r16, 0x004b, %r25
cpu_intr_3_1:
	setx	0x1d0206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea50020  ! 10: STWA_R	stwa	%r31, [%r20 + %r0] 0x01
	.word 0xf225a073  ! 16: STW_I	stw	%r25, [%r22 + 0x0073]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2a5c020  ! 22: STWA_R	stwa	%r25, [%r23 + %r0] 0x01
	.word 0xf62d2112  ! 23: STB_I	stb	%r27, [%r20 + 0x0112]
cpu_intr_3_2:
	setx	0x1e0016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0c48000  ! 25: ADDCcc_R	addccc 	%r18, %r0, %r24
cpu_intr_3_3:
	setx	0x1e030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbec5c000  ! 34: ADDCcc_R	addccc 	%r23, %r0, %r31
	.word 0xb684213d  ! 35: ADDcc_I	addcc 	%r16, 0x013d, %r27
	.word 0xfe74e19a  ! 36: STX_I	stx	%r31, [%r19 + 0x019a]
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_0:
	mov	0x3c5, %r14
	.word 0xfaf38e40  ! 41: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb235a092  ! 44: SUBC_I	orn 	%r22, 0x0092, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf82de1e7  ! 47: STB_I	stb	%r28, [%r23 + 0x01e7]
T3_asi_reg_rd_0:
	mov	0xe, %r14
	.word 0xf6db89e0  ! 49: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xfe248000  ! 51: STW_R	stw	%r31, [%r18 + %r0]
iob_intr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_0), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_4:
	setx	0x1e0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe75c000  ! 55: STX_R	stx	%r31, [%r23 + %r0]
cpu_intr_3_5:
	setx	0x1e0306, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_6:
	setx	0x1e0324, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_1:
	mov	0x18, %r14
	.word 0xf8db8e40  ! 61: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xfaac8020  ! 69: STBA_R	stba	%r29, [%r18 + %r0] 0x01
	.word 0xfef5a15e  ! 74: STXA_I	stxa	%r31, [%r22 + 0x015e] %asi
T3_asi_reg_wr_1:
	mov	0x6, %r14
	.word 0xf4f389e0  ! 78: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xfa250000  ! 79: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xf2348000  ! 84: STH_R	sth	%r25, [%r18 + %r0]
T3_asi_reg_rd_2:
	mov	0x3c3, %r14
	.word 0xfcdb89e0  ! 86: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf02c20ba  ! 93: STB_I	stb	%r24, [%r16 + 0x00ba]
	.word 0xfcf4e190  ! 97: STXA_I	stxa	%r30, [%r19 + 0x0190] %asi
T3_asi_reg_wr_2:
	mov	0x3c1, %r14
	.word 0xf0f389e0  ! 99: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa2ca134  ! 102: STB_I	stb	%r29, [%r18 + 0x0134]
cpu_intr_3_7:
	setx	0x1c031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5641800  ! 105: MOVcc_R	<illegal instruction>
T3_asi_reg_wr_3:
	mov	0x19, %r14
	.word 0xfcf384a0  ! 106: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_1), 16, 16)) -> intp(3, 0, 1b)
	.word 0xb81460d7  ! 109: OR_I	or 	%r17, 0x00d7, %r28
T3_asi_reg_wr_4:
	mov	0x3c3, %r14
	.word 0xf4f38e60  ! 110: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_2), 16, 16)) -> intp(3, 0, 36)
	.word 0xb60c8000  ! 116: AND_R	and 	%r18, %r0, %r27
cpu_intr_3_8:
	setx	0x1c0126, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_9:
	setx	0x1e010f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_3), 16, 16)) -> intp(3, 0, 1)
	.word 0xf8a52076  ! 127: STWA_I	stwa	%r28, [%r20 + 0x0076] %asi
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x819828d0  ! 128: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d0, %hpstate
cpu_intr_3_10:
	setx	0x1c0314, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_4), 16, 16)) -> intp(3, 0, 36)
cpu_intr_3_11:
	setx	0x1f0024, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_5), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_12:
	setx	0x1e0218, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_13:
	setx	0x1f0015, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0752021  ! 140: STX_I	stx	%r24, [%r20 + 0x0021]
	.word 0xfa2d0000  ! 141: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xfa35a1f1  ! 142: STH_I	sth	%r29, [%r22 + 0x01f1]
iob_intr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_6), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf4348000  ! 147: STH_R	sth	%r26, [%r18 + %r0]
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
iob_intr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_7), 16, 16)) -> intp(3, 0, 1)
	.word 0xfe75c000  ! 156: STX_R	stx	%r31, [%r23 + %r0]
iob_intr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_8), 16, 16)) -> intp(3, 0, 6)
T3_asi_reg_wr_5:
	mov	0x3c2, %r14
	.word 0xfef389e0  ! 159: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_9), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_10), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf22d8000  ! 166: STB_R	stb	%r25, [%r22 + %r0]
T3_asi_reg_rd_3:
	mov	0x26, %r14
	.word 0xf2db8e40  ! 167: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_3_14:
	setx	0x1e003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xa1902002  ! 169: WRPR_GL_I	wrpr	%r0, 0x0002, %-
cpu_intr_3_15:
	setx	0x1c0031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_16:
	setx	0x1f0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ac4020  ! 172: STBA_R	stba	%r26, [%r17 + %r0] 0x01
	.word 0xfc7520e7  ! 173: STX_I	stx	%r30, [%r20 + 0x00e7]
	.word 0xfab46152  ! 174: STHA_I	stha	%r29, [%r17 + 0x0152] %asi
iob_intr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_11), 16, 16)) -> intp(3, 0, 35)
cpu_intr_3_17:
	setx	0x1d0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982e02  ! 182: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e02, %hpstate
	.word 0xbeb40000  ! 184: SUBCcc_R	orncc 	%r16, %r0, %r31
iob_intr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_12), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf4a48020  ! 188: STWA_R	stwa	%r26, [%r18 + %r0] 0x01
	.word 0xf624e037  ! 191: STW_I	stw	%r27, [%r19 + 0x0037]
T3_asi_reg_rd_4:
	mov	0x18, %r14
	.word 0xf4db8e40  ! 192: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf0744000  ! 193: STX_R	stx	%r24, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfaa48020  ! 198: STWA_R	stwa	%r29, [%r18 + %r0] 0x01
cpu_intr_3_18:
	setx	0x1d031b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_13), 16, 16)) -> intp(3, 0, 7)
iob_intr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_14), 16, 16)) -> intp(3, 0, 30)
T3_asi_reg_wr_6:
	mov	0x3c4, %r14
	.word 0xf8f389e0  ! 207: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf8b54020  ! 208: STHA_R	stha	%r28, [%r21 + %r0] 0x01
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xfaa5e134  ! 216: STWA_I	stwa	%r29, [%r23 + 0x0134] %asi
iob_intr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_15), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_wr_7:
	mov	0x11, %r14
	.word 0xf2f384a0  ! 220: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_3_19:
	setx	0x1c0036, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_5:
	mov	0x17, %r14
	.word 0xfadb84a0  ! 224: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xfcb50020  ! 225: STHA_R	stha	%r30, [%r20 + %r0] 0x01
T3_asi_reg_wr_8:
	mov	0x15, %r14
	.word 0xf0f38e60  ! 227: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_3_20:
	setx	0x1e031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_6:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 232: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf474a128  ! 236: STX_I	stx	%r26, [%r18 + 0x0128]
T3_asi_reg_wr_9:
	mov	0x3c2, %r14
	.word 0xf8f38400  ! 239: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819829d2  ! 243: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d2, %hpstate
	.word 0xb33d4000  ! 244: SRA_R	sra 	%r21, %r0, %r25
cpu_intr_3_21:
	setx	0x1d0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b46066  ! 247: STHA_I	stha	%r25, [%r17 + 0x0066] %asi
iob_intr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_16), 16, 16)) -> intp(3, 0, 11)
T3_asi_reg_wr_10:
	mov	0x3c7, %r14
	.word 0xf8f38e40  ! 252: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_17), 16, 16)) -> intp(3, 0, 3b)
cpu_intr_3_22:
	setx	0x1e0028, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe254000  ! 259: SUB_R	sub 	%r21, %r0, %r31
	.word 0xbd480000  ! 260: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
T3_asi_reg_rd_7:
	mov	0x3c6, %r14
	.word 0xf2db8e80  ! 261: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xfe346160  ! 263: STH_I	sth	%r31, [%r17 + 0x0160]
	.word 0xf8b4c020  ! 264: STHA_R	stha	%r28, [%r19 + %r0] 0x01
cpu_intr_3_23:
	setx	0x1f0208, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_11:
	mov	0x2, %r14
	.word 0xf4f384a0  ! 268: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf8ac4020  ! 269: STBA_R	stba	%r28, [%r17 + %r0] 0x01
	.word 0xf2352178  ! 273: STH_I	sth	%r25, [%r20 + 0x0178]
cpu_intr_3_24:
	setx	0x1f0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982d52  ! 276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d52, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf4f420f0  ! 279: STXA_I	stxa	%r26, [%r16 + 0x00f0] %asi
	.word 0xb62dc000  ! 280: ANDN_R	andn 	%r23, %r0, %r27
T3_asi_reg_wr_12:
	mov	0x9, %r14
	.word 0xfef38e60  ! 281: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xf6758000  ! 282: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xbe9d4000  ! 283: XORcc_R	xorcc 	%r21, %r0, %r31
	.word 0xf4b52021  ! 284: STHA_I	stha	%r26, [%r20 + 0x0021] %asi
cpu_intr_3_25:
	setx	0x1c003b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_26:
	setx	0x1e0035, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_18), 16, 16)) -> intp(3, 0, 3f)
T3_asi_reg_wr_13:
	mov	0x1a, %r14
	.word 0xf0f389e0  ! 293: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T3_asi_reg_wr_14:
	mov	0x3c0, %r14
	.word 0xfcf38e80  ! 295: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_19), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_20), 16, 16)) -> intp(3, 0, 2d)
T3_asi_reg_rd_8:
	mov	0x1b, %r14
	.word 0xf2db8e40  ! 299: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_21), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_rd_9:
	mov	0x3, %r14
	.word 0xf2db8e40  ! 302: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_3_27:
	setx	0x1f0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1c4000  ! 304: XOR_R	xor 	%r17, %r0, %r31
	.word 0xf4a46059  ! 305: STWA_I	stwa	%r26, [%r17 + 0x0059] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_10:
	mov	0x3c7, %r14
	.word 0xf0db8e80  ! 307: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf8358000  ! 310: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xfc25a050  ! 311: STW_I	stw	%r30, [%r22 + 0x0050]
cpu_intr_3_28:
	setx	0x1d023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_11:
	mov	0x2f, %r14
	.word 0xf8db8400  ! 318: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_22), 16, 16)) -> intp(3, 0, 10)
	.word 0xf225a049  ! 321: STW_I	stw	%r25, [%r22 + 0x0049]
	.word 0xf22dc000  ! 322: STB_R	stb	%r25, [%r23 + %r0]
T3_asi_reg_wr_15:
	mov	0x1c, %r14
	.word 0xfcf384a0  ! 323: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xfe348000  ! 326: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xb484e09b  ! 327: ADDcc_I	addcc 	%r19, 0x009b, %r26
iob_intr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_23), 16, 16)) -> intp(3, 0, 2a)
	.word 0xfeb52051  ! 329: STHA_I	stha	%r31, [%r20 + 0x0051] %asi
T3_asi_reg_rd_12:
	mov	0x3c0, %r14
	.word 0xfcdb84a0  ! 332: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfaada09a  ! 333: STBA_I	stba	%r29, [%r22 + 0x009a] %asi
iob_intr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_24), 16, 16)) -> intp(3, 0, c)
iob_intr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_25), 16, 16)) -> intp(3, 0, 9)
	.word 0xf4b44020  ! 341: STHA_R	stha	%r26, [%r17 + %r0] 0x01
T3_asi_reg_rd_13:
	mov	0x29, %r14
	.word 0xfadb89e0  ! 342: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T3_asi_reg_wr_16:
	mov	0xc, %r14
	.word 0xf4f384a0  ! 346: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T3_asi_reg_rd_14:
	mov	0x4, %r14
	.word 0xf0db8e40  ! 347: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_rd_15:
	mov	0x35, %r14
	.word 0xf6db8400  ! 351: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb20420d8  ! 355: ADD_I	add 	%r16, 0x00d8, %r25
T3_asi_reg_rd_16:
	mov	0x3c1, %r14
	.word 0xf2db8400  ! 357: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982d48  ! 358: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d48, %hpstate
T3_asi_reg_wr_17:
	mov	0x3c1, %r14
	.word 0xfcf38400  ! 360: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T3_asi_reg_wr_18:
	mov	0x3c1, %r14
	.word 0xf0f38e40  ! 362: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfa740000  ! 364: STX_R	stx	%r29, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2f42194  ! 366: STXA_I	stxa	%r25, [%r16 + 0x0194] %asi
T3_asi_reg_wr_19:
	mov	0x7, %r14
	.word 0xf2f38e80  ! 367: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf6b48020  ! 368: STHA_R	stha	%r27, [%r18 + %r0] 0x01
T3_asi_reg_wr_20:
	mov	0x2a, %r14
	.word 0xf2f384a0  ! 371: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T3_asi_reg_wr_21:
	mov	0x2c, %r14
	.word 0xf8f384a0  ! 380: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_26), 16, 16)) -> intp(3, 0, 1a)
	.word 0xbcb54000  ! 382: SUBCcc_R	orncc 	%r21, %r0, %r30
iob_intr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_27), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfe74c000  ! 388: STX_R	stx	%r31, [%r19 + %r0]
cpu_intr_3_29:
	setx	0x1d0232, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2c8000  ! 390: STB_R	stb	%r29, [%r18 + %r0]
iob_intr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_28), 16, 16)) -> intp(3, 0, 31)
	.word 0xfc2c0000  ! 396: STB_R	stb	%r30, [%r16 + %r0]
	.word 0xf0f5e166  ! 397: STXA_I	stxa	%r24, [%r23 + 0x0166] %asi
iob_intr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_29), 16, 16)) -> intp(3, 0, 29)
iob_intr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_30), 16, 16)) -> intp(3, 0, 8)
iob_intr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_31), 16, 16)) -> intp(3, 0, 33)
T3_asi_reg_wr_22:
	mov	0x2a, %r14
	.word 0xf6f389e0  ! 403: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
T3_asi_reg_rd_17:
	mov	0x11, %r14
	.word 0xfadb8e40  ! 404: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_32), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfa75c000  ! 411: STX_R	stx	%r29, [%r23 + %r0]
iob_intr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_33), 16, 16)) -> intp(3, 0, 31)
	.word 0xf0a5a115  ! 417: STWA_I	stwa	%r24, [%r22 + 0x0115] %asi
cpu_intr_3_30:
	setx	0x1f0333, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_34), 16, 16)) -> intp(3, 0, 24)
iob_intr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_35), 16, 16)) -> intp(3, 0, 20)
cpu_intr_3_31:
	setx	0x1d0013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb5c020  ! 430: STHA_R	stha	%r30, [%r23 + %r0] 0x01
	.word 0xfc75a142  ! 431: STX_I	stx	%r30, [%r22 + 0x0142]
T3_asi_reg_rd_18:
	mov	0x3c3, %r14
	.word 0xf8db8400  ! 436: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_3_32:
	setx	0x1e0203, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_33:
	setx	0x1e031b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_36), 16, 16)) -> intp(3, 0, 18)
iob_intr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_37), 16, 16)) -> intp(3, 0, 19)
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983b40  ! 443: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b40, %hpstate
iob_intr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_38), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_39), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_40), 16, 16)) -> intp(3, 0, 2d)
cpu_intr_3_34:
	setx	0x1e0323, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ad8020  ! 455: STBA_R	stba	%r26, [%r22 + %r0] 0x01
	.word 0xf62520f0  ! 456: STW_I	stw	%r27, [%r20 + 0x00f0]
iob_intr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_41), 16, 16)) -> intp(3, 0, 30)
	.word 0xb5520000  ! 462: RDPR_PIL	rdpr	%pil, %r26
iob_intr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_42), 16, 16)) -> intp(3, 0, 23)
T3_asi_reg_rd_19:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 464: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb485c000  ! 465: ADDcc_R	addcc 	%r23, %r0, %r26
	.word 0xbb2c6001  ! 466: SLL_I	sll 	%r17, 0x0001, %r29
cpu_intr_3_35:
	setx	0x210127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe74c000  ! 468: STX_R	stx	%r31, [%r19 + %r0]
cpu_intr_3_36:
	setx	0x220206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82d0000  ! 471: STB_R	stb	%r28, [%r20 + %r0]
	.word 0xf82c0000  ! 473: STB_R	stb	%r28, [%r16 + %r0]
T3_asi_reg_wr_23:
	mov	0x16, %r14
	.word 0xf0f38e40  ! 476: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xbb641800  ! 483: MOVcc_R	<illegal instruction>
cpu_intr_3_37:
	setx	0x22001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_38:
	setx	0x220331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4ada0e7  ! 492: STBA_I	stba	%r26, [%r22 + 0x00e7] %asi
iob_intr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_43), 16, 16)) -> intp(3, 0, 3a)
iob_intr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_44), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_45), 16, 16)) -> intp(3, 0, 11)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_39:
	setx	0x210105, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb235c000  ! 498: SUBC_R	orn 	%r23, %r0, %r25
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982f48  ! 501: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f48, %hpstate
T3_asi_reg_wr_24:
	mov	0x1d, %r14
	.word 0xf2f38e40  ! 502: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfe340000  ! 503: STH_R	sth	%r31, [%r16 + %r0]
iob_intr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_46), 16, 16)) -> intp(3, 0, 32)
	.word 0xf6b50020  ! 506: STHA_R	stha	%r27, [%r20 + %r0] 0x01
	.word 0xfc2d4000  ! 510: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xbc9ce087  ! 513: XORcc_I	xorcc 	%r19, 0x0087, %r30
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x85942043  ! 516: WRPR_TSTATE_I	wrpr	%r16, 0x0043, %tstate
	.word 0xf6244000  ! 517: STW_R	stw	%r27, [%r17 + %r0]
	.word 0xf8a5619d  ! 518: STWA_I	stwa	%r28, [%r21 + 0x019d] %asi
T3_asi_reg_rd_20:
	mov	0xa, %r14
	.word 0xfadb8e40  ! 520: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T3_asi_reg_wr_25:
	mov	0x17, %r14
	.word 0xf8f384a0  ! 521: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T3_asi_reg_wr_26:
	mov	0xc, %r14
	.word 0xfef389e0  ! 523: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
cpu_intr_3_40:
	setx	0x21032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983840  ! 525: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1840, %hpstate
cpu_intr_3_41:
	setx	0x20001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
cpu_intr_3_42:
	setx	0x210007, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_27:
	mov	0x8, %r14
	.word 0xf8f38e40  ! 530: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982c0a  ! 532: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0a, %hpstate
	.word 0xb61c8000  ! 534: XOR_R	xor 	%r18, %r0, %r27
iob_intr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_47), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_48), 16, 16)) -> intp(3, 0, a)
	.word 0xfcad8020  ! 541: STBA_R	stba	%r30, [%r22 + %r0] 0x01
	.word 0xb351c000  ! 542: RDPR_TL	rdpr	%tl, %r25
T3_asi_reg_rd_21:
	mov	0x28, %r14
	.word 0xf8db8e80  ! 545: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_49), 16, 16)) -> intp(3, 0, 23)
	ta	T_CHANGE_TO_TL1
cpu_intr_3_43:
	setx	0x230318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_44:
	setx	0x20023d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_45:
	setx	0x200323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_46:
	setx	0x23020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a4e150  ! 559: STWA_I	stwa	%r24, [%r19 + 0x0150] %asi
cpu_intr_3_47:
	setx	0x230131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_48:
	setx	0x22033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62dc000  ! 563: STB_R	stb	%r27, [%r23 + %r0]
iob_intr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_50), 16, 16)) -> intp(3, 0, 22)
	setx	data_start_1, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x819828c8  ! 565: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c8, %hpstate
iob_intr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_51), 16, 16)) -> intp(3, 0, 5)
	.word 0xf675e12c  ! 569: STX_I	stx	%r27, [%r23 + 0x012c]
cpu_intr_3_49:
	setx	0x220204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaad8020  ! 571: STBA_R	stba	%r29, [%r22 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
iob_intr_3_52:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_52), 16, 16)) -> intp(3, 0, 23)
	.word 0xf2a4a132  ! 575: STWA_I	stwa	%r25, [%r18 + 0x0132] %asi
	.word 0xfc34e08a  ! 577: STH_I	sth	%r30, [%r19 + 0x008a]
iob_intr_3_53:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_53), 16, 16)) -> intp(3, 0, 2)
	.word 0xf4ad0020  ! 580: STBA_R	stba	%r26, [%r20 + %r0] 0x01
	.word 0xfa35214b  ! 583: STH_I	sth	%r29, [%r20 + 0x014b]
T3_asi_reg_wr_28:
	mov	0x3c0, %r14
	.word 0xfaf38400  ! 586: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xfe35e190  ! 589: STH_I	sth	%r31, [%r23 + 0x0190]
	.word 0xbc04c000  ! 590: ADD_R	add 	%r19, %r0, %r30
	.word 0xf4a5e19d  ! 591: STWA_I	stwa	%r26, [%r23 + 0x019d] %asi
	.word 0xf6b58020  ! 593: STHA_R	stha	%r27, [%r22 + %r0] 0x01
	.word 0xfaa54020  ! 596: STWA_R	stwa	%r29, [%r21 + %r0] 0x01
T3_asi_reg_wr_29:
	mov	0x20, %r14
	.word 0xf8f38e80  ! 598: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_3_54:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_54), 16, 16)) -> intp(3, 0, a)
cpu_intr_3_50:
	setx	0x20010d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_55:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_55), 16, 16)) -> intp(3, 0, b)
	.word 0xfc2d2032  ! 603: STB_I	stb	%r30, [%r20 + 0x0032]
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982910  ! 604: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0910, %hpstate
T3_asi_reg_wr_30:
	mov	0x0, %r14
	.word 0xfcf38e40  ! 605: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_56:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_56), 16, 16)) -> intp(3, 0, 8)
cpu_intr_3_51:
	setx	0x22001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_31:
	mov	0x32, %r14
	.word 0xf2f38e40  ! 612: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_wr_32:
	mov	0xf, %r14
	.word 0xf4f38e60  ! 613: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T3_asi_reg_wr_33:
	mov	0x10, %r14
	.word 0xf6f38400  ! 615: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb93de001  ! 623: SRA_I	sra 	%r23, 0x0001, %r28
T3_asi_reg_rd_22:
	mov	0x3c3, %r14
	.word 0xfadb8e60  ! 626: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T3_asi_reg_wr_34:
	mov	0x3c0, %r14
	.word 0xfef384a0  ! 629: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xfc24c000  ! 632: STW_R	stw	%r30, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_52:
	setx	0x22031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f5e18c  ! 635: STXA_I	stxa	%r25, [%r23 + 0x018c] %asi
	.word 0xf0340000  ! 636: STH_R	sth	%r24, [%r16 + %r0]
	.word 0xfe2d4000  ! 637: STB_R	stb	%r31, [%r21 + %r0]
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_23:
	mov	0x6, %r14
	.word 0xf8db8e40  ! 639: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf035e1da  ! 640: STH_I	sth	%r24, [%r23 + 0x01da]
cpu_intr_3_53:
	setx	0x22020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea52157  ! 643: STWA_I	stwa	%r31, [%r20 + 0x0157] %asi
	.word 0xf4ad0020  ! 644: STBA_R	stba	%r26, [%r20 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_54:
	setx	0x220005, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf42ce050  ! 654: STB_I	stb	%r26, [%r19 + 0x0050]
iob_intr_3_57:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_57), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf4ad2159  ! 659: STBA_I	stba	%r26, [%r20 + 0x0159] %asi
iob_intr_3_58:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_58), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_rd_24:
	mov	0x30, %r14
	.word 0xf4db8e40  ! 662: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfc34e137  ! 663: STH_I	sth	%r30, [%r19 + 0x0137]
	.word 0xf075a0fe  ! 666: STX_I	stx	%r24, [%r22 + 0x00fe]
cpu_intr_3_55:
	setx	0x200230, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_25:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 680: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_59:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_59), 16, 16)) -> intp(3, 0, 3a)
	.word 0xbd35d000  ! 685: SRLX_R	srlx	%r23, %r0, %r30
	.word 0xfcf5e031  ! 686: STXA_I	stxa	%r30, [%r23 + 0x0031] %asi
	.word 0xfc3460f6  ! 687: STH_I	sth	%r30, [%r17 + 0x00f6]
T3_asi_reg_wr_35:
	mov	0x1b, %r14
	.word 0xf8f38e60  ! 689: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T3_asi_reg_wr_36:
	mov	0x12, %r14
	.word 0xf8f38e60  ! 690: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf4b4e088  ! 696: STHA_I	stha	%r26, [%r19 + 0x0088] %asi
	.word 0xbe3ca083  ! 697: XNOR_I	xnor 	%r18, 0x0083, %r31
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983e8a  ! 698: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e8a, %hpstate
	.word 0xf4242016  ! 700: STW_I	stw	%r26, [%r16 + 0x0016]
T3_asi_reg_rd_26:
	mov	0x3, %r14
	.word 0xf0db84a0  ! 703: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_3_60:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_60), 16, 16)) -> intp(3, 0, 16)
	.word 0xbabd8000  ! 706: XNORcc_R	xnorcc 	%r22, %r0, %r29
	ta	T_CHANGE_NONHPRIV
iob_intr_3_61:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_61), 16, 16)) -> intp(3, 0, 1a)
	.word 0xb12da001  ! 714: SLL_I	sll 	%r22, 0x0001, %r24
	.word 0xf2f4212a  ! 715: STXA_I	stxa	%r25, [%r16 + 0x012a] %asi
iob_intr_3_62:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_62), 16, 16)) -> intp(3, 0, 38)
T3_asi_reg_rd_27:
	mov	0x37, %r14
	.word 0xf8db8e60  ! 717: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_rd_28:
	mov	0x27, %r14
	.word 0xfadb8e60  ! 718: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_3_63:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_63), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf8acc020  ! 720: STBA_R	stba	%r28, [%r19 + %r0] 0x01
T3_asi_reg_rd_29:
	mov	0x0, %r14
	.word 0xf4db8e40  ! 722: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_56:
	setx	0x23030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2aca1b7  ! 725: STBA_I	stba	%r25, [%r18 + 0x01b7] %asi
cpu_intr_3_57:
	setx	0x23022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a561f2  ! 727: STWA_I	stwa	%r24, [%r21 + 0x01f2] %asi
	.word 0xbb349000  ! 728: SRLX_R	srlx	%r18, %r0, %r29
	.word 0xfaa5c020  ! 730: STWA_R	stwa	%r29, [%r23 + %r0] 0x01
cpu_intr_3_58:
	setx	0x210206, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_64:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_64), 16, 16)) -> intp(3, 0, 39)
T3_asi_reg_rd_30:
	mov	0x3c3, %r14
	.word 0xfcdb89e0  ! 745: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x819829c8  ! 746: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c8, %hpstate
	.word 0xb6358000  ! 747: ORN_R	orn 	%r22, %r0, %r27
	.word 0xfa2d6023  ! 749: STB_I	stb	%r29, [%r21 + 0x0023]
cpu_intr_3_59:
	setx	0x20022e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_65:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_65), 16, 16)) -> intp(3, 0, 32)
	.word 0xb22dc000  ! 754: ANDN_R	andn 	%r23, %r0, %r25
	.word 0xf0a48020  ! 755: STWA_R	stwa	%r24, [%r18 + %r0] 0x01
T3_asi_reg_rd_31:
	mov	0xf, %r14
	.word 0xf4db8e40  ! 757: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_rd_32:
	mov	0x3c7, %r14
	.word 0xfcdb8400  ! 758: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_3_66:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_66), 16, 16)) -> intp(3, 0, 13)
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_33:
	mov	0x34, %r14
	.word 0xf0db8e80  ! 762: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_3_60:
	setx	0x220018, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_61:
	setx	0x21011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa75a1b2  ! 768: STX_I	stx	%r29, [%r22 + 0x01b2]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_37:
	mov	0x7, %r14
	.word 0xf0f38e40  ! 771: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_67:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_67), 16, 16)) -> intp(3, 0, 13)
cpu_intr_3_62:
	setx	0x210215, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_68:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_68), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_rd_34:
	mov	0x26, %r14
	.word 0xf8db84a0  ! 780: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_3_69:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_69), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf0b58020  ! 785: STHA_R	stha	%r24, [%r22 + %r0] 0x01
	.word 0xfc246115  ! 786: STW_I	stw	%r30, [%r17 + 0x0115]
cpu_intr_3_63:
	setx	0x230206, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_70:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_70), 16, 16)) -> intp(3, 0, 1a)
cpu_intr_3_64:
	setx	0x200320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a5c020  ! 796: STWA_R	stwa	%r28, [%r23 + %r0] 0x01
	.word 0xfc25e0d7  ! 798: STW_I	stw	%r30, [%r23 + 0x00d7]
cpu_intr_3_65:
	setx	0x20030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_38:
	mov	0x3c5, %r14
	.word 0xf8f384a0  ! 803: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_3_71:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_71), 16, 16)) -> intp(3, 0, 20)
cpu_intr_3_66:
	setx	0x22000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf435c000  ! 807: STH_R	sth	%r26, [%r23 + %r0]
	.word 0xfeb44020  ! 808: STHA_R	stha	%r31, [%r17 + %r0] 0x01
T3_asi_reg_rd_35:
	mov	0x3c5, %r14
	.word 0xfcdb84a0  ! 814: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T3_asi_reg_wr_39:
	mov	0x2f, %r14
	.word 0xfef384a0  ! 815: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T3_asi_reg_rd_36:
	mov	0x3c8, %r14
	.word 0xfcdb84a0  ! 822: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_3_72:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_72), 16, 16)) -> intp(3, 0, 3f)
	.word 0xb4b4c000  ! 826: ORNcc_R	orncc 	%r19, %r0, %r26
cpu_intr_3_67:
	setx	0x230332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc948000  ! 834: ORcc_R	orcc 	%r18, %r0, %r30
	.word 0xbd349000  ! 835: SRLX_R	srlx	%r18, %r0, %r30
T3_asi_reg_wr_40:
	mov	0x1f, %r14
	.word 0xf8f384a0  ! 839: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T3_asi_reg_wr_41:
	mov	0x3c2, %r14
	.word 0xf6f38e80  ! 844: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_3_73:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_73), 16, 16)) -> intp(3, 0, 8)
	.word 0xf02dc000  ! 848: STB_R	stb	%r24, [%r23 + %r0]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_37:
	mov	0x2c, %r14
	.word 0xfadb8e40  ! 850: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_74:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_74), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf634e1d1  ! 853: STH_I	sth	%r27, [%r19 + 0x01d1]
T3_asi_reg_rd_38:
	mov	0x3c3, %r14
	.word 0xfedb84a0  ! 854: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb8240000  ! 855: SUB_R	sub 	%r16, %r0, %r28
cpu_intr_3_68:
	setx	0x230005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb4c020  ! 861: STHA_R	stha	%r30, [%r19 + %r0] 0x01
	.word 0xf4aca10f  ! 862: STBA_I	stba	%r26, [%r18 + 0x010f] %asi
T3_asi_reg_wr_42:
	mov	0x3c7, %r14
	.word 0xf4f389e0  ! 863: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb6b54000  ! 865: SUBCcc_R	orncc 	%r21, %r0, %r27
	.word 0xfc3420a3  ! 867: STH_I	sth	%r30, [%r16 + 0x00a3]
cpu_intr_3_69:
	setx	0x220014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4344000  ! 869: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xf834a0f6  ! 876: STH_I	sth	%r28, [%r18 + 0x00f6]
iob_intr_3_75:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_75), 16, 16)) -> intp(3, 0, 2a)
cpu_intr_3_70:
	setx	0x210037, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_76:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_76), 16, 16)) -> intp(3, 0, 8)
	ta	T_CHANGE_HPRIV
	.word 0xf424e180  ! 883: STW_I	stw	%r26, [%r19 + 0x0180]
	.word 0xb7345000  ! 884: SRLX_R	srlx	%r17, %r0, %r27
T3_asi_reg_wr_43:
	mov	0x30, %r14
	.word 0xf2f389e0  ! 887: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T3_asi_reg_rd_39:
	mov	0x2a, %r14
	.word 0xfedb8e60  ! 888: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_3_71:
	setx	0x21033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a56064  ! 893: STWA_I	stwa	%r26, [%r21 + 0x0064] %asi
	.word 0xb2b520c8  ! 894: ORNcc_I	orncc 	%r20, 0x00c8, %r25
cpu_intr_3_72:
	setx	0x230102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b5e137  ! 899: STHA_I	stha	%r24, [%r23 + 0x0137] %asi
	.word 0xfc248000  ! 901: STW_R	stw	%r30, [%r18 + %r0]
T3_asi_reg_wr_44:
	mov	0x3c2, %r14
	.word 0xf0f384a0  ! 913: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf8244000  ! 915: STW_R	stw	%r28, [%r17 + %r0]
	.word 0xf22c60e1  ! 918: STB_I	stb	%r25, [%r17 + 0x00e1]
cpu_intr_3_73:
	setx	0x240023, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf625211a  ! 926: STW_I	stw	%r27, [%r20 + 0x011a]
	.word 0xf6758000  ! 930: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xf8b4e157  ! 931: STHA_I	stha	%r28, [%r19 + 0x0157] %asi
cpu_intr_3_74:
	setx	0x260001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f421e4  ! 936: STXA_I	stxa	%r28, [%r16 + 0x01e4] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_77:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_77), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_wr_45:
	mov	0x22, %r14
	.word 0xf4f38e40  ! 944: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_75:
	setx	0x250224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7357001  ! 954: SRLX_I	srlx	%r21, 0x0001, %r27
T3_asi_reg_rd_40:
	mov	0x3c2, %r14
	.word 0xf0db89e0  ! 956: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
iob_intr_3_78:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_78), 16, 16)) -> intp(3, 0, 39)
	.word 0xfeacc020  ! 962: STBA_R	stba	%r31, [%r19 + %r0] 0x01
cpu_intr_3_76:
	setx	0x24031a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_77:
	setx	0x27031f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_46:
	mov	0x2a, %r14
	.word 0xf4f384a0  ! 965: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf8ac8020  ! 970: STBA_R	stba	%r28, [%r18 + %r0] 0x01
T3_asi_reg_wr_47:
	mov	0x3c7, %r14
	.word 0xf8f389e0  ! 972: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xfaace020  ! 973: STBA_I	stba	%r29, [%r19 + 0x0020] %asi
cpu_intr_3_78:
	setx	0x27003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_79:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_79), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_rd_41:
	mov	0x3c8, %r14
	.word 0xfadb8e80  ! 978: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xf4a42189  ! 979: STWA_I	stwa	%r26, [%r16 + 0x0189] %asi
	.word 0xf475e010  ! 981: STX_I	stx	%r26, [%r23 + 0x0010]
	.word 0xf8adc020  ! 982: STBA_R	stba	%r28, [%r23 + %r0] 0x01
	.word 0xbe344000  ! 983: SUBC_R	orn 	%r17, %r0, %r31
	.word 0xfc74a15a  ! 984: STX_I	stx	%r30, [%r18 + 0x015a]
T3_asi_reg_wr_48:
	mov	0xc, %r14
	.word 0xf8f389e0  ! 986: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_3_79:
	setx	0x270028, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_42:
	mov	0x17, %r14
	.word 0xf8db89e0  ! 990: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982d82  ! 991: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d82, %hpstate
	.word 0xf074c000  ! 993: STX_R	stx	%r24, [%r19 + %r0]
T3_asi_reg_wr_49:
	mov	0x4, %r14
	.word 0xf2f38e80  ! 995: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb0b4e0d9  ! 997: SUBCcc_I	orncc 	%r19, 0x00d9, %r24
	.word 0xb834e036  ! 998: ORN_I	orn 	%r19, 0x0036, %r28
	.word 0xf22da173  ! 1002: STB_I	stb	%r25, [%r22 + 0x0173]
T3_asi_reg_rd_43:
	mov	0xa, %r14
	.word 0xfcdb8e60  ! 1005: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbf2d9000  ! 1012: SLLX_R	sllx	%r22, %r0, %r31
cpu_intr_3_80:
	setx	0x250125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_80:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_80), 16, 16)) -> intp(3, 0, 19)
	.word 0xf8f4e1b5  ! 1017: STXA_I	stxa	%r28, [%r19 + 0x01b5] %asi
	.word 0xb0aca038  ! 1018: ANDNcc_I	andncc 	%r18, 0x0038, %r24
	.word 0xf2344000  ! 1022: STH_R	sth	%r25, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
cpu_intr_3_81:
	setx	0x270031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb12c9000  ! 1031: SLLX_R	sllx	%r18, %r0, %r24
cpu_intr_3_82:
	setx	0x260018, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2354000  ! 1034: STH_R	sth	%r25, [%r21 + %r0]
	.word 0xf8ace1c5  ! 1035: STBA_I	stba	%r28, [%r19 + 0x01c5] %asi
iob_intr_3_81:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_81), 16, 16)) -> intp(3, 0, 4)
	.word 0xf8adc020  ! 1037: STBA_R	stba	%r28, [%r23 + %r0] 0x01
	.word 0xf2b4e147  ! 1040: STHA_I	stha	%r25, [%r19 + 0x0147] %asi
iob_intr_3_82:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_82), 16, 16)) -> intp(3, 0, 8)
iob_intr_3_83:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_83), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_rd_44:
	mov	0xc, %r14
	.word 0xf6db8e60  ! 1052: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_3_84:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_84), 16, 16)) -> intp(3, 0, 1)
cpu_intr_3_83:
	setx	0x240115, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_84:
	setx	0x260329, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_85:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_85), 16, 16)) -> intp(3, 0, 18)
T3_asi_reg_rd_45:
	mov	0x3c1, %r14
	.word 0xfadb8e80  ! 1062: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xfc756145  ! 1063: STX_I	stx	%r30, [%r21 + 0x0145]
	.word 0xfeb52045  ! 1064: STHA_I	stha	%r31, [%r20 + 0x0045] %asi
iob_intr_3_86:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_86), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf2258000  ! 1066: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xf4ac0020  ! 1067: STBA_R	stba	%r26, [%r16 + %r0] 0x01
	.word 0xbc1d0000  ! 1068: XOR_R	xor 	%r20, %r0, %r30
cpu_intr_3_85:
	setx	0x24030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b4a09d  ! 1072: STHA_I	stha	%r28, [%r18 + 0x009d] %asi
cpu_intr_3_86:
	setx	0x27021c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_87:
	setx	0x270220, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_50:
	mov	0x2a, %r14
	.word 0xfaf389e0  ! 1079: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb0b5c000  ! 1080: ORNcc_R	orncc 	%r23, %r0, %r24
iob_intr_3_87:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_87), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_rd_46:
	mov	0x3c7, %r14
	.word 0xfedb8400  ! 1082: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T3_asi_reg_wr_51:
	mov	0x15, %r14
	.word 0xfcf38e40  ! 1083: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_88:
	setx	0x24020c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_89:
	setx	0x250225, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_88:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_88), 16, 16)) -> intp(3, 0, 3a)
	.word 0xf8242195  ! 1090: STW_I	stw	%r28, [%r16 + 0x0195]
iob_intr_3_89:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_89), 16, 16)) -> intp(3, 0, 1c)
cpu_intr_3_90:
	setx	0x25023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_90:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_90), 16, 16)) -> intp(3, 0, 18)
	.word 0xf6b5c020  ! 1099: STHA_R	stha	%r27, [%r23 + %r0] 0x01
	.word 0xb49c6069  ! 1101: XORcc_I	xorcc 	%r17, 0x0069, %r26
	.word 0xfab56000  ! 1102: STHA_I	stha	%r29, [%r21 + 0x0000] %asi
iob_intr_3_91:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_91), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfeace05f  ! 1106: STBA_I	stba	%r31, [%r19 + 0x005f] %asi
	ta	T_CHANGE_TO_TL0
iob_intr_3_92:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_92), 16, 16)) -> intp(3, 0, 6)
	.word 0xf0348000  ! 1110: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xf6ad8020  ! 1112: STBA_R	stba	%r27, [%r22 + %r0] 0x01
	.word 0xfcf5e026  ! 1116: STXA_I	stxa	%r30, [%r23 + 0x0026] %asi
	.word 0xb2256167  ! 1118: SUB_I	sub 	%r21, 0x0167, %r25
T3_asi_reg_rd_47:
	mov	0x25, %r14
	.word 0xfadb8e60  ! 1121: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T3_asi_reg_rd_48:
	mov	0x1d, %r14
	.word 0xfcdb8e40  ! 1122: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbd504000  ! 1124: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xf0ade134  ! 1128: STBA_I	stba	%r24, [%r23 + 0x0134] %asi
	.word 0xbcbda059  ! 1131: XNORcc_I	xnorcc 	%r22, 0x0059, %r30
T3_asi_reg_rd_49:
	mov	0x25, %r14
	.word 0xf8db89e0  ! 1132: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xfaad8020  ! 1134: STBA_R	stba	%r29, [%r22 + %r0] 0x01
T3_asi_reg_rd_50:
	mov	0x35, %r14
	.word 0xf0db8e40  ! 1135: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T3_asi_reg_rd_51:
	mov	0x24, %r14
	.word 0xfcdb8e40  ! 1136: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T3_asi_reg_wr_52:
	mov	0x2e, %r14
	.word 0xf8f389e0  ! 1140: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xf0ad2024  ! 1141: STBA_I	stba	%r24, [%r20 + 0x0024] %asi
	.word 0xf425e05d  ! 1142: STW_I	stw	%r26, [%r23 + 0x005d]
	.word 0xfcad4020  ! 1146: STBA_R	stba	%r30, [%r21 + %r0] 0x01
	.word 0xb64560fc  ! 1147: ADDC_I	addc 	%r21, 0x00fc, %r27
cpu_intr_3_91:
	setx	0x270310, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_92:
	setx	0x250107, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_53:
	mov	0x3c4, %r14
	.word 0xf0f38e60  ! 1152: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xfa2dc000  ! 1157: STB_R	stb	%r29, [%r23 + %r0]
T3_asi_reg_rd_52:
	mov	0x24, %r14
	.word 0xfcdb8e40  ! 1160: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfc7520d3  ! 1163: STX_I	stx	%r30, [%r20 + 0x00d3]
iob_intr_3_93:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_93), 16, 16)) -> intp(3, 0, 37)
cpu_intr_3_93:
	setx	0x26002b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_54:
	mov	0x33, %r14
	.word 0xf6f384a0  ! 1167: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf22ce15b  ! 1168: STB_I	stb	%r25, [%r19 + 0x015b]
	.word 0xf434a006  ! 1171: STH_I	sth	%r26, [%r18 + 0x0006]
	.word 0xf8ad4020  ! 1173: STBA_R	stba	%r28, [%r21 + %r0] 0x01
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982c1a  ! 1175: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1a, %hpstate
iob_intr_3_94:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_94), 16, 16)) -> intp(3, 0, 12)
	.word 0xb0b5a1a9  ! 1178: SUBCcc_I	orncc 	%r22, 0x01a9, %r24
T3_asi_reg_rd_53:
	mov	0x3c5, %r14
	.word 0xf4db89e0  ! 1179: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	ta	T_CHANGE_TO_TL0
	.word 0xfc24e19c  ! 1181: STW_I	stw	%r30, [%r19 + 0x019c]
	ta	T_CHANGE_TO_TL0
	.word 0xf025e1c6  ! 1184: STW_I	stw	%r24, [%r23 + 0x01c6]
T3_asi_reg_rd_54:
	mov	0x3c0, %r14
	.word 0xfcdb8400  ! 1186: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
cpu_intr_3_94:
	setx	0x27003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_55:
	mov	0x3c0, %r14
	.word 0xfef389e0  ! 1190: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_56:
	mov	0x8, %r14
	.word 0xf4f384a0  ! 1196: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf6a44020  ! 1197: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
T3_asi_reg_rd_55:
	mov	0x2, %r14
	.word 0xfedb8e40  ! 1198: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_95:
	setx	0x270229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_96:
	setx	0x250317, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_95:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_95), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_wr_57:
	mov	0x37, %r14
	.word 0xfaf38400  ! 1205: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf62d0000  ! 1206: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xf2f42134  ! 1208: STXA_I	stxa	%r25, [%r16 + 0x0134] %asi
iob_intr_3_96:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_96), 16, 16)) -> intp(3, 0, 3c)
	.word 0xb2ace128  ! 1214: ANDNcc_I	andncc 	%r19, 0x0128, %r25
iob_intr_3_97:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_97), 16, 16)) -> intp(3, 0, 1c)
cpu_intr_3_97:
	setx	0x250128, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983b1a  ! 1217: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b1a, %hpstate
	.word 0xf0750000  ! 1218: STX_R	stx	%r24, [%r20 + %r0]
cpu_intr_3_98:
	setx	0x270201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0148000  ! 1223: OR_R	or 	%r18, %r0, %r24
	.word 0xf235a02b  ! 1224: STH_I	sth	%r25, [%r22 + 0x002b]
	.word 0xb2bd2059  ! 1226: XNORcc_I	xnorcc 	%r20, 0x0059, %r25
	.word 0xf82c2065  ! 1228: STB_I	stb	%r28, [%r16 + 0x0065]
	ta	T_CHANGE_TO_TL0
	.word 0xb89ca09b  ! 1231: XORcc_I	xorcc 	%r18, 0x009b, %r28
iob_intr_3_98:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_98), 16, 16)) -> intp(3, 0, 10)
	.word 0xfe75c000  ! 1236: STX_R	stx	%r31, [%r23 + %r0]
T3_asi_reg_wr_58:
	mov	0x28, %r14
	.word 0xfef38e80  ! 1237: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfc748000  ! 1240: STX_R	stx	%r30, [%r18 + %r0]
T3_asi_reg_wr_59:
	mov	0x3c4, %r14
	.word 0xf2f384a0  ! 1241: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfa34e1ac  ! 1244: STH_I	sth	%r29, [%r19 + 0x01ac]
iob_intr_3_99:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_99), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_100:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_100), 16, 16)) -> intp(3, 0, 21)
	.word 0xf6354000  ! 1253: STH_R	sth	%r27, [%r21 + %r0]
cpu_intr_3_99:
	setx	0x24011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_56:
	mov	0x19, %r14
	.word 0xf6db8e40  ! 1255: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb1341000  ! 1256: SRLX_R	srlx	%r16, %r0, %r24
iob_intr_3_101:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_101), 16, 16)) -> intp(3, 0, 22)
	.word 0xf47461db  ! 1262: STX_I	stx	%r26, [%r17 + 0x01db]
T3_asi_reg_wr_60:
	mov	0x3c8, %r14
	.word 0xfcf38e80  ! 1263: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_3_102:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_102), 16, 16)) -> intp(3, 0, 2d)
	.word 0xb60ca002  ! 1268: AND_I	and 	%r18, 0x0002, %r27
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_57:
	mov	0x3c5, %r14
	.word 0xf8db8e60  ! 1274: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_rd_58:
	mov	0x3c3, %r14
	.word 0xfedb84a0  ! 1277: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T3_asi_reg_wr_61:
	mov	0x1e, %r14
	.word 0xf8f38400  ! 1280: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_3_100:
	setx	0x25020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf23560fb  ! 1283: STH_I	sth	%r25, [%r21 + 0x00fb]
	.word 0xb495e0c6  ! 1285: ORcc_I	orcc 	%r23, 0x00c6, %r26
	.word 0xb4a56075  ! 1288: SUBcc_I	subcc 	%r21, 0x0075, %r26
	.word 0xf8a48020  ! 1289: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
	.word 0xb49d8000  ! 1290: XORcc_R	xorcc 	%r22, %r0, %r26
	.word 0xfead4020  ! 1291: STBA_R	stba	%r31, [%r21 + %r0] 0x01
	.word 0xfe2da1c3  ! 1293: STB_I	stb	%r31, [%r22 + 0x01c3]
cpu_intr_3_101:
	setx	0x240001, %g1, %o0
	ta	T_SEND_THRD_INTR
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
	.word 0xb83d0000  ! 1299: XNOR_R	xnor 	%r20, %r0, %r28
T3_asi_reg_wr_62:
	mov	0x1, %r14
	.word 0xf8f38e40  ! 1300: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_3_102:
	setx	0x24033d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_103:
	setx	0x240128, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_103:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_103), 16, 16)) -> intp(3, 0, 16)
iob_intr_3_104:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_104), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_rd_59:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 1306: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_105:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_105), 16, 16)) -> intp(3, 0, 2)
	.word 0xb024e049  ! 1309: SUB_I	sub 	%r19, 0x0049, %r24
T3_asi_reg_rd_60:
	mov	0x21, %r14
	.word 0xf4db8400  ! 1310: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982ed2  ! 1311: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed2, %hpstate
	setx	data_start_5, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x819829d2  ! 1313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d2, %hpstate
iob_intr_3_106:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_106), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_rd_61:
	mov	0x2d, %r14
	.word 0xf0db8e40  ! 1316: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_104:
	setx	0x260232, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_105:
	setx	0x27030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa358000  ! 1326: STH_R	sth	%r29, [%r22 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xf22c8000  ! 1328: STB_R	stb	%r25, [%r18 + %r0]
T3_asi_reg_wr_63:
	mov	0x3c3, %r14
	.word 0xf2f389e0  ! 1332: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf035604e  ! 1334: STH_I	sth	%r24, [%r21 + 0x004e]
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983a52  ! 1335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a52, %hpstate
cpu_intr_3_106:
	setx	0x250322, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_107:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_107), 16, 16)) -> intp(3, 0, 28)
	.word 0xb20c4000  ! 1349: AND_R	and 	%r17, %r0, %r25
iob_intr_3_108:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_108), 16, 16)) -> intp(3, 0, c)
	.word 0xf625a0fc  ! 1353: STW_I	stw	%r27, [%r22 + 0x00fc]
cpu_intr_3_107:
	setx	0x270330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb13df001  ! 1355: SRAX_I	srax	%r23, 0x0001, %r24
	.word 0xfa258000  ! 1357: STW_R	stw	%r29, [%r22 + %r0]
iob_intr_3_109:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_109), 16, 16)) -> intp(3, 0, 39)
	.word 0xb495c000  ! 1361: ORcc_R	orcc 	%r23, %r0, %r26
	.word 0xf0f5601f  ! 1362: STXA_I	stxa	%r24, [%r21 + 0x001f] %asi
iob_intr_3_110:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_110), 16, 16)) -> intp(3, 0, 32)
iob_intr_3_111:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_111), 16, 16)) -> intp(3, 0, 4)
	.word 0xf4252040  ! 1366: STW_I	stw	%r26, [%r20 + 0x0040]
cpu_intr_3_108:
	setx	0x26010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe258000  ! 1370: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xf2ac0020  ! 1371: STBA_R	stba	%r25, [%r16 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb2a50000  ! 1376: SUBcc_R	subcc 	%r20, %r0, %r25
	.word 0xb0a58000  ! 1378: SUBcc_R	subcc 	%r22, %r0, %r24
	.word 0xfaf5e098  ! 1380: STXA_I	stxa	%r29, [%r23 + 0x0098] %asi
	.word 0xf0ad0020  ! 1381: STBA_R	stba	%r24, [%r20 + %r0] 0x01
T3_asi_reg_rd_62:
	mov	0x0, %r14
	.word 0xf4db8e80  ! 1382: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x819828da  ! 1383: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08da, %hpstate
	.word 0xf2354000  ! 1384: STH_R	sth	%r25, [%r21 + %r0]
iob_intr_3_112:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_112), 16, 16)) -> intp(3, 0, 8)
T3_asi_reg_wr_64:
	mov	0x3c0, %r14
	.word 0xfaf38e60  ! 1387: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xfc2c4000  ! 1390: STB_R	stb	%r30, [%r17 + %r0]
	.word 0xbca5a0c6  ! 1392: SUBcc_I	subcc 	%r22, 0x00c6, %r30
	.word 0xf8ad21ea  ! 1393: STBA_I	stba	%r28, [%r20 + 0x01ea] %asi
iob_intr_3_113:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_113), 16, 16)) -> intp(3, 0, 17)
	.word 0xf43560cb  ! 1397: STH_I	sth	%r26, [%r21 + 0x00cb]
cpu_intr_3_109:
	setx	0x290129, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_110:
	setx	0x2b0307, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x8198384a  ! 1402: WRHPR_HPSTATE_I	wrhpr	%r0, 0x184a, %hpstate
	.word 0xf47560e5  ! 1403: STX_I	stx	%r26, [%r21 + 0x00e5]
T3_asi_reg_rd_63:
	mov	0x23, %r14
	.word 0xf4db8e80  ! 1404: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T3_asi_reg_wr_65:
	mov	0x27, %r14
	.word 0xfaf38e40  ! 1405: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_3_114:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_114), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf4ace130  ! 1409: STBA_I	stba	%r26, [%r19 + 0x0130] %asi
iob_intr_3_115:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_115), 16, 16)) -> intp(3, 0, 1)
cpu_intr_3_111:
	setx	0x2b022e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_116:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_116), 16, 16)) -> intp(3, 0, 38)
	.word 0xf634a043  ! 1428: STH_I	sth	%r27, [%r18 + 0x0043]
	.word 0xf825c000  ! 1429: STW_R	stw	%r28, [%r23 + %r0]
	.word 0xf8748000  ! 1430: STX_R	stx	%r28, [%r18 + %r0]
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_66:
	mov	0x3c2, %r14
	.word 0xf6f384a0  ! 1434: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_3_112:
	setx	0x280111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_117:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_117), 16, 16)) -> intp(3, 0, 24)
	.word 0xfc2d0000  ! 1439: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xb005a1fc  ! 1440: ADD_I	add 	%r22, 0x01fc, %r24
cpu_intr_3_113:
	setx	0x2a032a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_118:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_118), 16, 16)) -> intp(3, 0, 31)
	.word 0x8995a1a0  ! 1450: WRPR_TICK_I	wrpr	%r22, 0x01a0, %tick
	.word 0xf6f4a13d  ! 1455: STXA_I	stxa	%r27, [%r18 + 0x013d] %asi
	.word 0xfc25e175  ! 1456: STW_I	stw	%r30, [%r23 + 0x0175]
	.word 0xb89d2019  ! 1457: XORcc_I	xorcc 	%r20, 0x0019, %r28
	.word 0xb684201e  ! 1458: ADDcc_I	addcc 	%r16, 0x001e, %r27
T3_asi_reg_wr_67:
	mov	0x10, %r14
	.word 0xf8f38e80  ! 1461: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf2f46176  ! 1462: STXA_I	stxa	%r25, [%r17 + 0x0176] %asi
	.word 0xb5351000  ! 1464: SRLX_R	srlx	%r20, %r0, %r26
	.word 0xbc0dc000  ! 1468: AND_R	and 	%r23, %r0, %r30
T3_asi_reg_rd_64:
	mov	0x3c0, %r14
	.word 0xf4db89e0  ! 1469: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf034a0d0  ! 1471: STH_I	sth	%r24, [%r18 + 0x00d0]
T3_asi_reg_rd_65:
	mov	0x3c8, %r14
	.word 0xfadb8e60  ! 1473: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_3_114:
	setx	0x2b0127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2ce080  ! 1475: STB_I	stb	%r31, [%r19 + 0x0080]
	.word 0xbe9c0000  ! 1476: XORcc_R	xorcc 	%r16, %r0, %r31
cpu_intr_3_115:
	setx	0x29013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe340000  ! 1479: STH_R	sth	%r31, [%r16 + %r0]
	.word 0xf8354000  ! 1480: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xf2756112  ! 1484: STX_I	stx	%r25, [%r21 + 0x0112]
iob_intr_3_119:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_119), 16, 16)) -> intp(3, 0, 2c)
	ta	T_CHANGE_TO_TL1
	.word 0xba15e0ba  ! 1490: OR_I	or 	%r23, 0x00ba, %r29
cpu_intr_3_116:
	setx	0x290212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6ada100  ! 1496: STBA_I	stba	%r27, [%r22 + 0x0100] %asi
	.word 0xf8a54020  ! 1497: STWA_R	stwa	%r28, [%r21 + %r0] 0x01
T3_asi_reg_wr_68:
	mov	0x2a, %r14
	.word 0xf2f38e60  ! 1498: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_3_120:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_120), 16, 16)) -> intp(3, 0, 2d)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xba44a0df  ! 1506: ADDC_I	addc 	%r18, 0x00df, %r29
iob_intr_3_121:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_121), 16, 16)) -> intp(3, 0, 1f)
T3_asi_reg_wr_69:
	mov	0xb, %r14
	.word 0xfef38e40  ! 1509: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_wr_70:
	mov	0x13, %r14
	.word 0xfaf38e40  ! 1511: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_rd_66:
	mov	0x1b, %r14
	.word 0xfadb8e40  ! 1514: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb53db001  ! 1515: SRAX_I	srax	%r22, 0x0001, %r26
	.word 0xf2354000  ! 1516: STH_R	sth	%r25, [%r21 + %r0]
cpu_intr_3_117:
	setx	0x2a0002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf624c000  ! 1521: STW_R	stw	%r27, [%r19 + %r0]
T3_asi_reg_wr_71:
	mov	0x1c, %r14
	.word 0xfcf38400  ! 1523: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_3_118:
	setx	0x2b0136, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_72:
	mov	0x5, %r14
	.word 0xfcf384a0  ! 1528: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	.word 0xf8a50020  ! 1530: STWA_R	stwa	%r28, [%r20 + %r0] 0x01
T3_asi_reg_rd_67:
	mov	0x3c1, %r14
	.word 0xfcdb84a0  ! 1533: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	ta	T_CHANGE_TO_TL1
iob_intr_3_122:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_122), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_wr_73:
	mov	0x12, %r14
	.word 0xf6f384a0  ! 1537: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf2b520f1  ! 1539: STHA_I	stha	%r25, [%r20 + 0x00f1] %asi
T3_asi_reg_wr_74:
	mov	0x35, %r14
	.word 0xf4f384a0  ! 1540: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_3_119:
	setx	0x290305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_123:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_123), 16, 16)) -> intp(3, 0, 5)
T3_asi_reg_rd_68:
	mov	0x9, %r14
	.word 0xf6db8e80  ! 1545: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_3_120:
	setx	0x2a0328, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_124:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_124), 16, 16)) -> intp(3, 0, 39)
iob_intr_3_125:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_125), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_126:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_126), 16, 16)) -> intp(3, 0, 2d)
	.word 0xfa250000  ! 1550: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xfe34215f  ! 1553: STH_I	sth	%r31, [%r16 + 0x015f]
	.word 0xf02d4000  ! 1554: STB_R	stb	%r24, [%r21 + %r0]
cpu_intr_3_121:
	setx	0x2a0006, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_127:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_127), 16, 16)) -> intp(3, 0, 29)
T3_asi_reg_wr_75:
	mov	0x27, %r14
	.word 0xfcf38400  ! 1562: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_3_128:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_128), 16, 16)) -> intp(3, 0, 2)
iob_intr_3_129:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_129), 16, 16)) -> intp(3, 0, 27)
iob_intr_3_130:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_130), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_wr_76:
	mov	0x1a, %r14
	.word 0xfef38e80  ! 1574: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_3_122:
	setx	0x2a023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa74c000  ! 1577: STX_R	stx	%r29, [%r19 + %r0]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_69:
	mov	0x2f, %r14
	.word 0xfedb84a0  ! 1579: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_3_123:
	setx	0x2a0228, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_3_131:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_131), 16, 16)) -> intp(3, 0, 20)
iob_intr_3_132:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_132), 16, 16)) -> intp(3, 0, 7)
cpu_intr_3_124:
	setx	0x290230, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_NONHPRIV
iob_intr_3_133:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_133), 16, 16)) -> intp(3, 0, 1e)
	.word 0xfaad20e2  ! 1595: STBA_I	stba	%r29, [%r20 + 0x00e2] %asi
	.word 0xbe1c0000  ! 1597: XOR_R	xor 	%r16, %r0, %r31
	.word 0xf22c8000  ! 1598: STB_R	stb	%r25, [%r18 + %r0]
	.word 0xfab58020  ! 1599: STHA_R	stha	%r29, [%r22 + %r0] 0x01
cpu_intr_3_125:
	setx	0x2a030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_77:
	mov	0x8, %r14
	.word 0xf4f38400  ! 1604: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_3_134:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_134), 16, 16)) -> intp(3, 0, 4)
	.word 0xfaac0020  ! 1608: STBA_R	stba	%r29, [%r16 + %r0] 0x01
cpu_intr_3_126:
	setx	0x2a0319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_127:
	setx	0x2b011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_78:
	mov	0x14, %r14
	.word 0xfef38e40  ! 1611: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	ta	T_CHANGE_TO_TL1
	.word 0xb034c000  ! 1614: SUBC_R	orn 	%r19, %r0, %r24
cpu_intr_3_128:
	setx	0x28011c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_70:
	mov	0x38, %r14
	.word 0xfadb89e0  ! 1618: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xbe8ce129  ! 1619: ANDcc_I	andcc 	%r19, 0x0129, %r31
	ta	T_CHANGE_TO_TL0
	.word 0xf2a44020  ! 1622: STWA_R	stwa	%r25, [%r17 + %r0] 0x01
	setx	data_start_3, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983d88  ! 1624: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d88, %hpstate
iob_intr_3_135:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_135), 16, 16)) -> intp(3, 0, 1f)
cpu_intr_3_129:
	setx	0x2b0111, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_79:
	mov	0x33, %r14
	.word 0xfaf389e0  ! 1632: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
T3_asi_reg_rd_71:
	mov	0x1e, %r14
	.word 0xf8db8e60  ! 1634: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_3_136:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_136), 16, 16)) -> intp(3, 0, 3a)
	.word 0xb6b460fb  ! 1636: SUBCcc_I	orncc 	%r17, 0x00fb, %r27
	.word 0xf4b4c020  ! 1637: STHA_R	stha	%r26, [%r19 + %r0] 0x01
iob_intr_3_137:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_137), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_138:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_138), 16, 16)) -> intp(3, 0, d)
	.word 0xbd341000  ! 1652: SRLX_R	srlx	%r16, %r0, %r30
cpu_intr_3_130:
	setx	0x29030c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_131:
	setx	0x290236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcada062  ! 1658: STBA_I	stba	%r30, [%r22 + 0x0062] %asi
iob_intr_3_139:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_139), 16, 16)) -> intp(3, 0, 24)
T3_asi_reg_rd_72:
	mov	0xc, %r14
	.word 0xf6db8e60  ! 1660: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf0ac61e1  ! 1662: STBA_I	stba	%r24, [%r17 + 0x01e1] %asi
	.word 0xf4a4c020  ! 1664: STWA_R	stwa	%r26, [%r19 + %r0] 0x01
iob_intr_3_140:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_140), 16, 16)) -> intp(3, 0, 18)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb52d4000  ! 1668: SLL_R	sll 	%r21, %r0, %r26
T3_asi_reg_rd_73:
	mov	0x3c1, %r14
	.word 0xf8db84a0  ! 1669: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_3_132:
	setx	0x290012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_141:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_141), 16, 16)) -> intp(3, 0, e)
	.word 0xfea521b2  ! 1672: STWA_I	stwa	%r31, [%r20 + 0x01b2] %asi
cpu_intr_3_133:
	setx	0x2b0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbec5e18d  ! 1679: ADDCcc_I	addccc 	%r23, 0x018d, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_142:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_142), 16, 16)) -> intp(3, 0, 1f)
iob_intr_3_143:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_143), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_rd_74:
	mov	0xe, %r14
	.word 0xf8db8e40  ! 1687: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_TO_TL1
iob_intr_3_144:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_144), 16, 16)) -> intp(3, 0, 5)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_145:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_145), 16, 16)) -> intp(3, 0, 9)
cpu_intr_3_134:
	setx	0x280016, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_75:
	mov	0x2e, %r14
	.word 0xf6db8400  ! 1698: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb82d601c  ! 1700: ANDN_I	andn 	%r21, 0x001c, %r28
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983f08  ! 1701: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f08, %hpstate
iob_intr_3_146:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_146), 16, 16)) -> intp(3, 0, 36)
	.word 0xf62d21cc  ! 1703: STB_I	stb	%r27, [%r20 + 0x01cc]
	.word 0x839460b6  ! 1706: WRPR_TNPC_I	wrpr	%r17, 0x00b6, %tnpc
T3_asi_reg_rd_76:
	mov	0x2d, %r14
	.word 0xf8db89e0  ! 1708: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf824c000  ! 1711: STW_R	stw	%r28, [%r19 + %r0]
T3_asi_reg_rd_77:
	mov	0x38, %r14
	.word 0xf0db84a0  ! 1713: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_3_147:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_147), 16, 16)) -> intp(3, 0, 30)
	.word 0xf824a071  ! 1717: STW_I	stw	%r28, [%r18 + 0x0071]
	.word 0xf8748000  ! 1719: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xf2a420d7  ! 1721: STWA_I	stwa	%r25, [%r16 + 0x00d7] %asi
	.word 0xb62d4000  ! 1724: ANDN_R	andn 	%r21, %r0, %r27
T3_asi_reg_wr_80:
	mov	0x9, %r14
	.word 0xfef384a0  ! 1728: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf0b54020  ! 1730: STHA_R	stha	%r24, [%r21 + %r0] 0x01
T3_asi_reg_wr_81:
	mov	0x3c6, %r14
	.word 0xf8f38e60  ! 1731: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf4ad20af  ! 1733: STBA_I	stba	%r26, [%r20 + 0x00af] %asi
	ta	T_CHANGE_HPRIV
	.word 0xb2bc8000  ! 1736: XNORcc_R	xnorcc 	%r18, %r0, %r25
iob_intr_3_148:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_148), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_rd_78:
	mov	0x3c5, %r14
	.word 0xfadb8e40  ! 1739: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_149:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_149), 16, 16)) -> intp(3, 0, 4)
T3_asi_reg_wr_82:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 1743: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfe2d8000  ! 1746: STB_R	stb	%r31, [%r22 + %r0]
	.word 0xbb480000  ! 1747: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf22461de  ! 1752: STW_I	stw	%r25, [%r17 + 0x01de]
iob_intr_3_150:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_150), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_151:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_151), 16, 16)) -> intp(3, 0, 39)
	.word 0xb8b50000  ! 1755: ORNcc_R	orncc 	%r20, %r0, %r28
cpu_intr_3_135:
	setx	0x2a001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983bc2  ! 1762: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc2, %hpstate
iob_intr_3_152:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_152), 16, 16)) -> intp(3, 0, e)
cpu_intr_3_136:
	setx	0x2b0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf475c000  ! 1767: STX_R	stx	%r26, [%r23 + %r0]
	.word 0xb0250000  ! 1768: SUB_R	sub 	%r20, %r0, %r24
	.word 0xb4bc4000  ! 1769: XNORcc_R	xnorcc 	%r17, %r0, %r26
T3_asi_reg_rd_79:
	mov	0x3c6, %r14
	.word 0xf8db8e80  ! 1771: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf2b5e0cc  ! 1772: STHA_I	stha	%r25, [%r23 + 0x00cc] %asi
	.word 0xfead616c  ! 1773: STBA_I	stba	%r31, [%r21 + 0x016c] %asi
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_137:
	setx	0x3032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4244000  ! 1779: STW_R	stw	%r26, [%r17 + %r0]
	.word 0xb8358000  ! 1780: SUBC_R	orn 	%r22, %r0, %r28
T3_asi_reg_rd_80:
	mov	0x3c7, %r14
	.word 0xf8db8e40  ! 1783: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T3_asi_reg_wr_83:
	mov	0x3c2, %r14
	.word 0xf6f38400  ! 1788: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf4b44020  ! 1793: STHA_R	stha	%r26, [%r17 + %r0] 0x01
	.word 0xf0b48020  ! 1795: STHA_R	stha	%r24, [%r18 + %r0] 0x01
T3_asi_reg_rd_81:
	mov	0x5, %r14
	.word 0xfadb8e40  ! 1799: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_138:
	setx	0x2a031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_82:
	mov	0x2a, %r14
	.word 0xf4db8e40  ! 1807: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T3_asi_reg_rd_83:
	mov	0x5, %r14
	.word 0xf0db8e80  ! 1809: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfc75c000  ! 1811: STX_R	stx	%r30, [%r23 + %r0]
cpu_intr_3_139:
	setx	0x2b031f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_140:
	setx	0x2a0335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0b40020  ! 1816: STHA_R	stha	%r24, [%r16 + %r0] 0x01
iob_intr_3_153:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_153), 16, 16)) -> intp(3, 0, 10)
	ta	T_CHANGE_TO_TL1
	.word 0xf4f560a2  ! 1820: STXA_I	stxa	%r26, [%r21 + 0x00a2] %asi
iob_intr_3_154:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_154), 16, 16)) -> intp(3, 0, 34)
	.word 0xfaf46123  ! 1825: STXA_I	stxa	%r29, [%r17 + 0x0123] %asi
iob_intr_3_155:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_155), 16, 16)) -> intp(3, 0, 39)
	.word 0xb6ac4000  ! 1828: ANDNcc_R	andncc 	%r17, %r0, %r27
	.word 0xb4c44000  ! 1829: ADDCcc_R	addccc 	%r17, %r0, %r26
cpu_intr_3_141:
	setx	0x2d0204, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_84:
	mov	0x23, %r14
	.word 0xf8f38e40  ! 1834: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_wr_85:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 1839: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_3_156:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_156), 16, 16)) -> intp(3, 0, c)
T3_asi_reg_rd_84:
	mov	0x1f, %r14
	.word 0xf2db8e40  ! 1841: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_rd_85:
	mov	0x1d, %r14
	.word 0xfadb89e0  ! 1844: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf8a5e131  ! 1845: STWA_I	stwa	%r28, [%r23 + 0x0131] %asi
	.word 0xf8748000  ! 1846: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xf02c20a4  ! 1847: STB_I	stb	%r24, [%r16 + 0x00a4]
T3_asi_reg_rd_86:
	mov	0x3c6, %r14
	.word 0xf4db8400  ! 1848: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf6b50020  ! 1852: STHA_R	stha	%r27, [%r20 + %r0] 0x01
	.word 0xb68c4000  ! 1853: ANDcc_R	andcc 	%r17, %r0, %r27
cpu_intr_3_142:
	setx	0x2d0326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaf5e002  ! 1855: STXA_I	stxa	%r29, [%r23 + 0x0002] %asi
T3_asi_reg_wr_86:
	mov	0x3c4, %r14
	.word 0xfaf38400  ! 1856: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xfa354000  ! 1858: STH_R	sth	%r29, [%r21 + %r0]
T3_asi_reg_rd_87:
	mov	0x19, %r14
	.word 0xf2db84a0  ! 1860: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf22c212c  ! 1863: STB_I	stb	%r25, [%r16 + 0x012c]
	.word 0xfe354000  ! 1865: STH_R	sth	%r31, [%r21 + %r0]
	.word 0xfe34c000  ! 1866: STH_R	sth	%r31, [%r19 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xf4f521c9  ! 1872: STXA_I	stxa	%r26, [%r20 + 0x01c9] %asi
cpu_intr_3_143:
	setx	0x2e022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcb460f0  ! 1874: STHA_I	stha	%r30, [%r17 + 0x00f0] %asi
cpu_intr_3_144:
	setx	0x2f0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf624a137  ! 1877: STW_I	stw	%r27, [%r18 + 0x0137]
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_145:
	setx	0x2c0220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_146:
	setx	0x2c011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_87:
	mov	0x3c5, %r14
	.word 0xf8f38e40  ! 1883: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xba954000  ! 1884: ORcc_R	orcc 	%r21, %r0, %r29
	.word 0xf0a5a188  ! 1888: STWA_I	stwa	%r24, [%r22 + 0x0188] %asi
cpu_intr_3_147:
	setx	0x2d012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf835a1cc  ! 1890: STH_I	sth	%r28, [%r22 + 0x01cc]
	.word 0xfeb48020  ! 1895: STHA_R	stha	%r31, [%r18 + %r0] 0x01
cpu_intr_3_148:
	setx	0x2f0026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_149:
	setx	0x2f0317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_150:
	setx	0x2e0017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb5c020  ! 1905: STHA_R	stha	%r31, [%r23 + %r0] 0x01
	.word 0xf82c0000  ! 1911: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xbab521f7  ! 1913: SUBCcc_I	orncc 	%r20, 0x01f7, %r29
	.word 0xf6ad610d  ! 1914: STBA_I	stba	%r27, [%r21 + 0x010d] %asi
	.word 0xbd353001  ! 1915: SRLX_I	srlx	%r20, 0x0001, %r30
cpu_intr_3_151:
	setx	0x2d0116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb52cf001  ! 1923: SLLX_I	sllx	%r19, 0x0001, %r26
cpu_intr_3_152:
	setx	0x2d0107, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_153:
	setx	0x2e0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a48020  ! 1927: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
T3_asi_reg_rd_88:
	mov	0x35, %r14
	.word 0xfedb84a0  ! 1928: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
cpu_intr_3_154:
	setx	0x2f0024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0156043  ! 1931: OR_I	or 	%r21, 0x0043, %r24
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_89:
	mov	0x3c2, %r14
	.word 0xf0db8e40  ! 1935: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0x8f902001  ! 1937: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xf8340000  ! 1940: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xf8248000  ! 1947: STW_R	stw	%r28, [%r18 + %r0]
	.word 0xb72cc000  ! 1948: SLL_R	sll 	%r19, %r0, %r27
	.word 0xfca5e1f8  ! 1952: STWA_I	stwa	%r30, [%r23 + 0x01f8] %asi
	.word 0xfe2ca000  ! 1954: STB_I	stb	%r31, [%r18 + 0x0000]
iob_intr_3_157:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_157), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_155:
	setx	0x2e0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe754000  ! 1959: STX_R	stx	%r31, [%r21 + %r0]
T3_asi_reg_rd_90:
	mov	0x30, %r14
	.word 0xf0db8e80  ! 1960: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_3_158:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_158), 16, 16)) -> intp(3, 0, 25)
	.word 0xb17d0400  ! 1967: MOVR_R	movre	%r20, %r0, %r24
iob_intr_3_159:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_159), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_160:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_160), 16, 16)) -> intp(3, 0, 1b)
T3_asi_reg_wr_88:
	mov	0x4, %r14
	.word 0xf4f384a0  ! 1974: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
T3_asi_reg_wr_89:
	mov	0x36, %r14
	.word 0xf2f389e0  ! 1979: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_3_161:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_161), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_rd_91:
	mov	0x2d, %r14
	.word 0xf8db8e80  ! 1982: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb7358000  ! 1983: SRL_R	srl 	%r22, %r0, %r27
cpu_intr_3_156:
	setx	0x2f023a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_162:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_162), 16, 16)) -> intp(3, 0, 1a)
T3_asi_reg_rd_92:
	mov	0x1c, %r14
	.word 0xf0db89e0  ! 1987: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb2a44000  ! 1988: SUBcc_R	subcc 	%r17, %r0, %r25
iob_intr_3_163:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_163), 16, 16)) -> intp(3, 0, 31)
	.word 0xf4adc020  ! 1990: STBA_R	stba	%r26, [%r23 + %r0] 0x01
iob_intr_3_164:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_164), 16, 16)) -> intp(3, 0, 27)
iob_intr_3_165:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_165), 16, 16)) -> intp(3, 0, 15)
	ta	T_CHANGE_TO_TL0
cpu_intr_3_157:
	setx	0x2e0120, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_158:
	setx	0x2e001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf22d2170  ! 2002: STB_I	stb	%r25, [%r20 + 0x0170]
	.word 0xf0ade120  ! 2003: STBA_I	stba	%r24, [%r23 + 0x0120] %asi
	.word 0xb88d4000  ! 2005: ANDcc_R	andcc 	%r21, %r0, %r28
	.word 0xa1902000  ! 2006: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xf2ad0020  ! 2008: STBA_R	stba	%r25, [%r20 + %r0] 0x01
T3_asi_reg_rd_93:
	mov	0x3c8, %r14
	.word 0xfedb8400  ! 2011: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_3_166:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_166), 16, 16)) -> intp(3, 0, 26)
cpu_intr_3_159:
	setx	0x2d0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa750000  ! 2017: STX_R	stx	%r29, [%r20 + %r0]
iob_intr_3_167:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_167), 16, 16)) -> intp(3, 0, 3e)
T3_asi_reg_wr_90:
	mov	0xb, %r14
	.word 0xf0f38400  ! 2019: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_3_168:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_168), 16, 16)) -> intp(3, 0, 19)
cpu_intr_3_160:
	setx	0x2c0127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_169:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_169), 16, 16)) -> intp(3, 0, 7)
cpu_intr_3_161:
	setx	0x2e0105, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_94:
	mov	0x2f, %r14
	.word 0xf4db8400  ! 2028: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb2044000  ! 2029: ADD_R	add 	%r17, %r0, %r25
	.word 0xbf2c3001  ! 2030: SLLX_I	sllx	%r16, 0x0001, %r31
iob_intr_3_170:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_170), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_171:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_171), 16, 16)) -> intp(3, 0, 12)
	.word 0xfca4c020  ! 2036: STWA_R	stwa	%r30, [%r19 + %r0] 0x01
T3_asi_reg_rd_95:
	mov	0x3c3, %r14
	.word 0xf2db8400  ! 2037: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T3_asi_reg_rd_96:
	mov	0x1d, %r14
	.word 0xfadb8e80  ! 2038: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xbd2de001  ! 2040: SLL_I	sll 	%r23, 0x0001, %r30
T3_asi_reg_rd_97:
	mov	0x3c6, %r14
	.word 0xf8db8e60  ! 2044: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_rd_98:
	mov	0x20, %r14
	.word 0xf8db8e60  ! 2045: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
T3_asi_reg_wr_91:
	mov	0x3c6, %r14
	.word 0xf2f38e60  ! 2049: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
T3_asi_reg_rd_99:
	mov	0x3c7, %r14
	.word 0xfadb8400  ! 2050: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_3_162:
	setx	0x2d022e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_163:
	setx	0x2c022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_100:
	mov	0x2d, %r14
	.word 0xfcdb84a0  ! 2055: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T3_asi_reg_wr_92:
	mov	0x35, %r14
	.word 0xf4f38e40  ! 2061: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xfab44020  ! 2062: STHA_R	stha	%r29, [%r17 + %r0] 0x01
cpu_intr_3_164:
	setx	0x2e0314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_165:
	setx	0x2c0005, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_101:
	mov	0x3c8, %r14
	.word 0xfadb8e80  ! 2067: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
T3_asi_reg_rd_102:
	mov	0x14, %r14
	.word 0xfedb8e40  ! 2068: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf62c21d3  ! 2070: STB_I	stb	%r27, [%r16 + 0x01d3]
	.word 0xb88ce1ab  ! 2073: ANDcc_I	andcc 	%r19, 0x01ab, %r28
	.word 0xf6744000  ! 2075: STX_R	stx	%r27, [%r17 + %r0]
cpu_intr_3_166:
	setx	0x2d0330, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_167:
	setx	0x2c0020, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_93:
	mov	0x31, %r14
	.word 0xfef389e0  ! 2078: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf824e059  ! 2079: STW_I	stw	%r28, [%r19 + 0x0059]
	.word 0xf074e0ea  ! 2081: STX_I	stx	%r24, [%r19 + 0x00ea]
cpu_intr_3_168:
	setx	0x2d0236, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xf0adc020  ! 2088: STBA_R	stba	%r24, [%r23 + %r0] 0x01
iob_intr_3_172:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_172), 16, 16)) -> intp(3, 0, 5)
	.word 0xfe25c000  ! 2090: STW_R	stw	%r31, [%r23 + %r0]
T3_asi_reg_wr_94:
	mov	0x3c6, %r14
	.word 0xf2f38e80  ! 2091: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb4844000  ! 2092: ADDcc_R	addcc 	%r17, %r0, %r26
T3_asi_reg_rd_103:
	mov	0x20, %r14
	.word 0xf8db8e40  ! 2093: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf8248000  ! 2095: STW_R	stw	%r28, [%r18 + %r0]
cpu_intr_3_169:
	setx	0x2e0138, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_95:
	mov	0x20, %r14
	.word 0xf2f38e40  ! 2098: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_rd_104:
	mov	0x4, %r14
	.word 0xf6db8400  ! 2103: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_3_173:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_173), 16, 16)) -> intp(3, 0, 7)
	.word 0xb015c000  ! 2106: OR_R	or 	%r23, %r0, %r24
	.word 0xb48ca079  ! 2107: ANDcc_I	andcc 	%r18, 0x0079, %r26
T3_asi_reg_wr_96:
	mov	0x37, %r14
	.word 0xf8f38e60  ! 2108: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_3_170:
	setx	0x2f0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd50c000  ! 2112: RDPR_TT	rdpr	%tt, %r30
	.word 0xf435208b  ! 2116: STH_I	sth	%r26, [%r20 + 0x008b]
	.word 0xf2a54020  ! 2118: STWA_R	stwa	%r25, [%r21 + %r0] 0x01
	.word 0xfe25a09b  ! 2119: STW_I	stw	%r31, [%r22 + 0x009b]
iob_intr_3_174:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_174), 16, 16)) -> intp(3, 0, 24)
T3_asi_reg_rd_105:
	mov	0x3c5, %r14
	.word 0xf0db8e40  ! 2123: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf6ace01d  ! 2127: STBA_I	stba	%r27, [%r19 + 0x001d] %asi
T3_asi_reg_rd_106:
	mov	0x7, %r14
	.word 0xf8db8e60  ! 2128: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_97:
	mov	0x3c0, %r14
	.word 0xf4f38e60  ! 2132: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf4750000  ! 2133: STX_R	stx	%r26, [%r20 + %r0]
iob_intr_3_175:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_175), 16, 16)) -> intp(3, 0, 22)
cpu_intr_3_171:
	setx	0x2c013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_172:
	setx	0x2c0207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_173:
	setx	0x2f0315, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_174:
	setx	0x2c011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb82de186  ! 2146: ANDN_I	andn 	%r23, 0x0186, %r28
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983950  ! 2149: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1950, %hpstate
cpu_intr_3_175:
	setx	0x2c0318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8250000  ! 2151: SUB_R	sub 	%r20, %r0, %r28
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983e4a  ! 2153: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e4a, %hpstate
T3_asi_reg_wr_98:
	mov	0xa, %r14
	.word 0xf4f38e40  ! 2157: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_3_176:
	setx	0x2c023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8754000  ! 2161: STX_R	stx	%r28, [%r21 + %r0]
T3_asi_reg_rd_107:
	mov	0x3c7, %r14
	.word 0xfadb89e0  ! 2164: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xf6a44020  ! 2171: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
cpu_intr_3_177:
	setx	0x2e030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa358000  ! 2175: STH_R	sth	%r29, [%r22 + %r0]
cpu_intr_3_178:
	setx	0x2c0229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_179:
	setx	0x2d031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd643801  ! 2180: MOVcc_I	<illegal instruction>
	.word 0xf62c4000  ! 2183: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf6a4a1ed  ! 2184: STWA_I	stwa	%r27, [%r18 + 0x01ed] %asi
T3_asi_reg_wr_99:
	mov	0x3c8, %r14
	.word 0xfef38400  ! 2188: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf4b4c020  ! 2189: STHA_R	stha	%r26, [%r19 + %r0] 0x01
cpu_intr_3_180:
	setx	0x2d0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe34212e  ! 2194: STH_I	sth	%r31, [%r16 + 0x012e]
T3_asi_reg_wr_100:
	mov	0x16, %r14
	.word 0xf6f38e40  ! 2196: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T3_asi_reg_rd_108:
	mov	0x27, %r14
	.word 0xfedb8e40  ! 2198: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf074a165  ! 2199: STX_I	stx	%r24, [%r18 + 0x0165]
	.word 0xf6ad0020  ! 2200: STBA_R	stba	%r27, [%r20 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
iob_intr_3_176:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_176), 16, 16)) -> intp(3, 0, 19)
	.word 0xf2a5c020  ! 2205: STWA_R	stwa	%r25, [%r23 + %r0] 0x01
T3_asi_reg_wr_101:
	mov	0x15, %r14
	.word 0xf0f38e60  ! 2207: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983b40  ! 2210: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b40, %hpstate
T3_asi_reg_rd_109:
	mov	0x14, %r14
	.word 0xf0db8e80  ! 2211: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xfa25c000  ! 2212: STW_R	stw	%r29, [%r23 + %r0]
iob_intr_3_177:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_177), 16, 16)) -> intp(3, 0, 33)
T3_asi_reg_rd_110:
	mov	0x13, %r14
	.word 0xf6db8e40  ! 2220: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfa2c0000  ! 2222: STB_R	stb	%r29, [%r16 + %r0]
iob_intr_3_178:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_178), 16, 16)) -> intp(3, 0, 2f)
iob_intr_3_179:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_179), 16, 16)) -> intp(3, 0, 24)
T3_asi_reg_rd_111:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 2226: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf435a0f5  ! 2228: STH_I	sth	%r26, [%r22 + 0x00f5]
T3_asi_reg_rd_112:
	mov	0x34, %r14
	.word 0xf4db8e80  ! 2229: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_3_180:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_180), 16, 16)) -> intp(3, 0, 25)
	.word 0xbb2d9000  ! 2234: SLLX_R	sllx	%r22, %r0, %r29
	.word 0xfa34a082  ! 2235: STH_I	sth	%r29, [%r18 + 0x0082]
	.word 0xbb346001  ! 2236: SRL_I	srl 	%r17, 0x0001, %r29
cpu_intr_3_181:
	setx	0x2c0139, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_181:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_181), 16, 16)) -> intp(3, 0, 7)
iob_intr_3_182:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_182), 16, 16)) -> intp(3, 0, 1c)
T3_asi_reg_rd_113:
	mov	0x12, %r14
	.word 0xfadb8e40  ! 2242: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_182:
	setx	0x2f020f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_183:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_183), 16, 16)) -> intp(3, 0, 24)
	.word 0xf674604e  ! 2247: STX_I	stx	%r27, [%r17 + 0x004e]
T3_asi_reg_wr_102:
	mov	0xe, %r14
	.word 0xfef38e60  ! 2249: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
iob_intr_3_184:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_184), 16, 16)) -> intp(3, 0, 36)
cpu_intr_3_183:
	setx	0x3010a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba042141  ! 2255: ADD_I	add 	%r16, 0x0141, %r29
	.word 0xf4752163  ! 2257: STX_I	stx	%r26, [%r20 + 0x0163]
iob_intr_3_185:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_185), 16, 16)) -> intp(3, 0, e)
iob_intr_3_186:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_186), 16, 16)) -> intp(3, 0, 17)
iob_intr_3_187:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_187), 16, 16)) -> intp(3, 0, 27)
	.word 0xf62d8000  ! 2266: STB_R	stb	%r27, [%r22 + %r0]
	.word 0xfaa54020  ! 2267: STWA_R	stwa	%r29, [%r21 + %r0] 0x01
	.word 0xb5351000  ! 2268: SRLX_R	srlx	%r20, %r0, %r26
	.word 0xf62461c6  ! 2269: STW_I	stw	%r27, [%r17 + 0x01c6]
cpu_intr_3_184:
	setx	0x33013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_103:
	mov	0x23, %r14
	.word 0xf2f389e0  ! 2273: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xb41520c4  ! 2277: OR_I	or 	%r20, 0x00c4, %r26
	.word 0xbe34a0cf  ! 2280: ORN_I	orn 	%r18, 0x00cf, %r31
	.word 0xfcad6093  ! 2282: STBA_I	stba	%r30, [%r21 + 0x0093] %asi
T3_asi_reg_wr_104:
	mov	0x34, %r14
	.word 0xf4f38400  ! 2285: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbec5a1e4  ! 2287: ADDCcc_I	addccc 	%r22, 0x01e4, %r31
	.word 0xf075e1a2  ! 2288: STX_I	stx	%r24, [%r23 + 0x01a2]
T3_asi_reg_rd_114:
	mov	0x2, %r14
	.word 0xf2db8e60  ! 2290: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T3_asi_reg_rd_115:
	mov	0x2, %r14
	.word 0xfcdb8e80  ! 2291: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_105:
	mov	0x2b, %r14
	.word 0xf8f38400  ! 2295: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_3_188:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_188), 16, 16)) -> intp(3, 0, 11)
T3_asi_reg_rd_116:
	mov	0x28, %r14
	.word 0xfadb84a0  ! 2297: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf6ad4020  ! 2298: STBA_R	stba	%r27, [%r21 + %r0] 0x01
cpu_intr_3_185:
	setx	0x31011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf634a058  ! 2309: STH_I	sth	%r27, [%r18 + 0x0058]
	.word 0xb6c40000  ! 2310: ADDCcc_R	addccc 	%r16, %r0, %r27
cpu_intr_3_186:
	setx	0x330322, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb4444000  ! 2319: ADDC_R	addc 	%r17, %r0, %r26
T3_asi_reg_rd_117:
	mov	0x3c2, %r14
	.word 0xf2db8400  ! 2321: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb41c607c  ! 2324: XOR_I	xor 	%r17, 0x007c, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfa2d2081  ! 2326: STB_I	stb	%r29, [%r20 + 0x0081]
	.word 0xbc85e0e4  ! 2327: ADDcc_I	addcc 	%r23, 0x00e4, %r30
	ta	T_CHANGE_TO_TL1
T3_asi_reg_wr_106:
	mov	0x29, %r14
	.word 0xf8f38e40  ! 2329: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf4756073  ! 2332: STX_I	stx	%r26, [%r21 + 0x0073]
	.word 0xf2350000  ! 2334: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xfaacc020  ! 2336: STBA_R	stba	%r29, [%r19 + %r0] 0x01
	.word 0xfea5e0ec  ! 2337: STWA_I	stwa	%r31, [%r23 + 0x00ec] %asi
iob_intr_3_189:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_189), 16, 16)) -> intp(3, 0, 36)
iob_intr_3_190:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_190), 16, 16)) -> intp(3, 0, 21)
T3_asi_reg_rd_118:
	mov	0x3c1, %r14
	.word 0xf6db8e60  ! 2341: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xf2b44020  ! 2342: STHA_R	stha	%r25, [%r17 + %r0] 0x01
cpu_intr_3_187:
	setx	0x32022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_119:
	mov	0x1, %r14
	.word 0xf8db89e0  ! 2345: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xf025e1d8  ! 2348: STW_I	stw	%r24, [%r23 + 0x01d8]
	.word 0xb5349000  ! 2349: SRLX_R	srlx	%r18, %r0, %r26
	ta	T_CHANGE_HPRIV
iob_intr_3_191:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_191), 16, 16)) -> intp(3, 0, 39)
	.word 0xa1902001  ! 2354: WRPR_GL_I	wrpr	%r0, 0x0001, %-
cpu_intr_3_188:
	setx	0x330035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d21fe  ! 2356: STB_I	stb	%r29, [%r20 + 0x01fe]
	.word 0xbc256078  ! 2359: SUB_I	sub 	%r21, 0x0078, %r30
iob_intr_3_192:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_192), 16, 16)) -> intp(3, 0, 14)
	.word 0xb6a5c000  ! 2362: SUBcc_R	subcc 	%r23, %r0, %r27
iob_intr_3_193:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_193), 16, 16)) -> intp(3, 0, 10)
	.word 0xfea4e157  ! 2364: STWA_I	stwa	%r31, [%r19 + 0x0157] %asi
T3_asi_reg_rd_120:
	mov	0x14, %r14
	.word 0xf2db84a0  ! 2366: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
iob_intr_3_194:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_194), 16, 16)) -> intp(3, 0, 3)
	.word 0xfef5204b  ! 2369: STXA_I	stxa	%r31, [%r20 + 0x004b] %asi
iob_intr_3_195:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_195), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_189:
	setx	0x30013c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_107:
	mov	0x3, %r14
	.word 0xfcf38e60  ! 2374: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf0254000  ! 2378: STW_R	stw	%r24, [%r21 + %r0]
	setx	data_start_6, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982eca  ! 2379: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0eca, %hpstate
	.word 0x8d95a0f6  ! 2380: WRPR_PSTATE_I	wrpr	%r22, 0x00f6, %pstate
iob_intr_3_196:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_196), 16, 16)) -> intp(3, 0, 2d)
	.word 0xf62c21aa  ! 2385: STB_I	stb	%r27, [%r16 + 0x01aa]
	.word 0xfc742180  ! 2387: STX_I	stx	%r30, [%r16 + 0x0180]
T3_asi_reg_rd_121:
	mov	0x3c7, %r14
	.word 0xf6db8e40  ! 2388: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
cpu_intr_3_190:
	setx	0x310234, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_108:
	mov	0x38, %r14
	.word 0xfcf389e0  ! 2392: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T3_asi_reg_rd_122:
	mov	0x2, %r14
	.word 0xf2db8e40  ! 2394: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_3_197:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_197), 16, 16)) -> intp(3, 0, 1a)
	.word 0xf62c8000  ! 2398: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xfcb5c020  ! 2399: STHA_R	stha	%r30, [%r23 + %r0] 0x01
	ta	T_CHANGE_TO_TL0
iob_intr_3_198:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_198), 16, 16)) -> intp(3, 0, 37)
iob_intr_3_199:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_199), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf8250000  ! 2409: STW_R	stw	%r28, [%r20 + %r0]
cpu_intr_3_191:
	setx	0x30020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf635c000  ! 2415: STH_R	sth	%r27, [%r23 + %r0]
cpu_intr_3_192:
	setx	0x330321, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_109:
	mov	0x22, %r14
	.word 0xf2f38400  ! 2417: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T3_asi_reg_wr_110:
	mov	0x3c0, %r14
	.word 0xf0f38e40  ! 2419: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	ta	T_CHANGE_NONHPRIV
	.word 0xf6f46131  ! 2421: STXA_I	stxa	%r27, [%r17 + 0x0131] %asi
iob_intr_3_200:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_200), 16, 16)) -> intp(3, 0, 2b)
cpu_intr_3_193:
	setx	0x32002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf0ac0020  ! 2429: STBA_R	stba	%r24, [%r16 + %r0] 0x01
T3_asi_reg_rd_123:
	mov	0x9, %r14
	.word 0xfcdb8e40  ! 2430: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_124:
	mov	0x23, %r14
	.word 0xf6db84a0  ! 2432: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T3_asi_reg_rd_125:
	mov	0x31, %r14
	.word 0xf4db8e40  ! 2434: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
cpu_intr_3_194:
	setx	0x31010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb37c0400  ! 2437: MOVR_R	movre	%r16, %r0, %r25
	.word 0xf6b4c020  ! 2438: STHA_R	stha	%r27, [%r19 + %r0] 0x01
	.word 0xf2b5a1d5  ! 2439: STHA_I	stha	%r25, [%r22 + 0x01d5] %asi
	.word 0xf824c000  ! 2443: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xf825c000  ! 2444: STW_R	stw	%r28, [%r23 + %r0]
iob_intr_3_201:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_201), 16, 16)) -> intp(3, 0, 3f)
	ta	T_CHANGE_TO_TL0
iob_intr_3_202:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_202), 16, 16)) -> intp(3, 0, 1d)
	.word 0xf8248000  ! 2449: STW_R	stw	%r28, [%r18 + %r0]
iob_intr_3_203:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_203), 16, 16)) -> intp(3, 0, 1a)
T3_asi_reg_wr_111:
	mov	0x1f, %r14
	.word 0xf8f384a0  ! 2453: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_3_204:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_204), 16, 16)) -> intp(3, 0, 38)
	.word 0xfeada0a9  ! 2455: STBA_I	stba	%r31, [%r22 + 0x00a9] %asi
	.word 0xf0354000  ! 2456: STH_R	sth	%r24, [%r21 + %r0]
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_126:
	mov	0x9, %r14
	.word 0xfcdb84a0  ! 2461: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_3_195:
	setx	0x32033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983f12  ! 2465: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f12, %hpstate
iob_intr_3_205:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_205), 16, 16)) -> intp(3, 0, 3b)
	.word 0x8794e06f  ! 2470: WRPR_TT_I	wrpr	%r19, 0x006f, %tt
cpu_intr_3_196:
	setx	0x31031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6754000  ! 2473: STX_R	stx	%r27, [%r21 + %r0]
	ta	T_CHANGE_TO_TL1
	.word 0xf0a5c020  ! 2476: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
	.word 0xfcb58020  ! 2477: STHA_R	stha	%r30, [%r22 + %r0] 0x01
iob_intr_3_206:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_206), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf82de147  ! 2480: STB_I	stb	%r28, [%r23 + 0x0147]
	.word 0xf2ad206b  ! 2481: STBA_I	stba	%r25, [%r20 + 0x006b] %asi
T3_asi_reg_rd_127:
	mov	0x9, %r14
	.word 0xfcdb84a0  ! 2483: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xfe74201e  ! 2484: STX_I	stx	%r31, [%r16 + 0x001e]
iob_intr_3_207:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_207), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf4340000  ! 2487: STH_R	sth	%r26, [%r16 + %r0]
cpu_intr_3_197:
	setx	0x320026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_198:
	setx	0x31001d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_128:
	mov	0x3c5, %r14
	.word 0xf4db84a0  ! 2491: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xfead4020  ! 2492: STBA_R	stba	%r31, [%r21 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
	.word 0xfa74a0e4  ! 2502: STX_I	stx	%r29, [%r18 + 0x00e4]
	.word 0xf2a4c020  ! 2503: STWA_R	stwa	%r25, [%r19 + %r0] 0x01
cpu_intr_3_199:
	setx	0x330109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf224c000  ! 2505: STW_R	stw	%r25, [%r19 + %r0]
cpu_intr_3_200:
	setx	0x330300, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_129:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 2511: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xf8a48020  ! 2515: STWA_R	stwa	%r28, [%r18 + %r0] 0x01
T3_asi_reg_wr_112:
	mov	0x6, %r14
	.word 0xf2f38400  ! 2516: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb7356001  ! 2519: SRL_I	srl 	%r21, 0x0001, %r27
iob_intr_3_208:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_208), 16, 16)) -> intp(3, 0, 2a)
	.word 0xb42560b0  ! 2522: SUB_I	sub 	%r21, 0x00b0, %r26
	ta	T_CHANGE_TO_TL0
cpu_intr_3_201:
	setx	0x300127, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_202:
	setx	0x320332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4acc020  ! 2528: STBA_R	stba	%r26, [%r19 + %r0] 0x01
T3_asi_reg_rd_130:
	mov	0x36, %r14
	.word 0xf6db84a0  ! 2531: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983a80  ! 2532: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a80, %hpstate
	.word 0xf834c000  ! 2533: STH_R	sth	%r28, [%r19 + %r0]
T3_asi_reg_rd_131:
	mov	0x2c, %r14
	.word 0xf8db8e40  ! 2535: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_203:
	setx	0x330137, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeb44020  ! 2544: STHA_R	stha	%r31, [%r17 + %r0] 0x01
iob_intr_3_209:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_209), 16, 16)) -> intp(3, 0, 31)
T3_asi_reg_wr_113:
	mov	0x3c1, %r14
	.word 0xf2f38e40  ! 2547: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
cpu_intr_3_204:
	setx	0x300215, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	data_start_0, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982992  ! 2552: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0992, %hpstate
cpu_intr_3_205:
	setx	0x300217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe348000  ! 2554: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xb5341000  ! 2555: SRLX_R	srlx	%r16, %r0, %r26
	.word 0xf8ac0020  ! 2558: STBA_R	stba	%r28, [%r16 + %r0] 0x01
T3_asi_reg_rd_132:
	mov	0x33, %r14
	.word 0xf2db8e40  ! 2560: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T3_asi_reg_wr_114:
	mov	0x3c4, %r14
	.word 0xfcf38e80  ! 2561: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_115:
	mov	0x2d, %r14
	.word 0xfef38e40  ! 2566: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_wr_116:
	mov	0x3c6, %r14
	.word 0xfcf38400  ! 2568: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_3_210:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_210), 16, 16)) -> intp(3, 0, 37)
T3_asi_reg_wr_117:
	mov	0x2b, %r14
	.word 0xfaf38e80  ! 2573: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xfaa5e172  ! 2577: STWA_I	stwa	%r29, [%r23 + 0x0172] %asi
T3_asi_reg_rd_133:
	mov	0xe, %r14
	.word 0xf6db8e40  ! 2578: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xf0ac0020  ! 2582: STBA_R	stba	%r24, [%r16 + %r0] 0x01
cpu_intr_3_206:
	setx	0x33013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_134:
	mov	0x1e, %r14
	.word 0xfedb8e80  ! 2584: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xb2440000  ! 2586: ADDC_R	addc 	%r16, %r0, %r25
iob_intr_3_211:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_211), 16, 16)) -> intp(3, 0, c)
iob_intr_3_212:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_212), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_207:
	setx	0x33022e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_213:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_213), 16, 16)) -> intp(3, 0, 18)
cpu_intr_3_208:
	setx	0x310203, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xb33c0000  ! 2598: SRA_R	sra 	%r16, %r0, %r25
	.word 0xfe24e142  ! 2602: STW_I	stw	%r31, [%r19 + 0x0142]
iob_intr_3_214:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_214), 16, 16)) -> intp(3, 0, 26)
	.word 0xf2f56099  ! 2605: STXA_I	stxa	%r25, [%r21 + 0x0099] %asi
	.word 0xf2b5e18a  ! 2606: STHA_I	stha	%r25, [%r23 + 0x018a] %asi
	.word 0xf4b58020  ! 2609: STHA_R	stha	%r26, [%r22 + %r0] 0x01
	.word 0xf6344000  ! 2610: STH_R	sth	%r27, [%r17 + %r0]
T3_asi_reg_wr_118:
	mov	0x32, %r14
	.word 0xf6f38e60  ! 2611: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
cpu_intr_3_209:
	setx	0x330221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe344000  ! 2613: STH_R	sth	%r31, [%r17 + %r0]
	.word 0xfaa5c020  ! 2615: STWA_R	stwa	%r29, [%r23 + %r0] 0x01
iob_intr_3_215:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_215), 16, 16)) -> intp(3, 0, 0)
cpu_intr_3_210:
	setx	0x300333, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_216:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_216), 16, 16)) -> intp(3, 0, 13)
	.word 0xf474e00e  ! 2624: STX_I	stx	%r26, [%r19 + 0x000e]
cpu_intr_3_211:
	setx	0x330223, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_119:
	mov	0x15, %r14
	.word 0xf4f38e80  ! 2628: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf0ac0020  ! 2629: STBA_R	stba	%r24, [%r16 + %r0] 0x01
T3_asi_reg_wr_120:
	mov	0x24, %r14
	.word 0xf8f38e40  ! 2630: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_wr_121:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 2631: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_3_212:
	setx	0x320235, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_122:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 2635: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf434c000  ! 2636: STH_R	sth	%r26, [%r19 + %r0]
cpu_intr_3_213:
	setx	0x30031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb9641800  ! 2648: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_135:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 2651: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_3_217:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_217), 16, 16)) -> intp(3, 0, 1f)
	.word 0xb52c5000  ! 2656: SLLX_R	sllx	%r17, %r0, %r26
	.word 0xfaa4c020  ! 2658: STWA_R	stwa	%r29, [%r19 + %r0] 0x01
cpu_intr_3_214:
	setx	0x32012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_136:
	mov	0x3c5, %r14
	.word 0xfcdb89e0  ! 2660: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf62de05b  ! 2663: STB_I	stb	%r27, [%r23 + 0x005b]
	.word 0xfca48020  ! 2665: STWA_R	stwa	%r30, [%r18 + %r0] 0x01
	.word 0xb6c5c000  ! 2668: ADDCcc_R	addccc 	%r23, %r0, %r27
iob_intr_3_218:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_218), 16, 16)) -> intp(3, 0, 12)
	.word 0xf4a56133  ! 2673: STWA_I	stwa	%r26, [%r21 + 0x0133] %asi
iob_intr_3_219:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_219), 16, 16)) -> intp(3, 0, 6)
	.word 0xf0346094  ! 2676: STH_I	sth	%r24, [%r17 + 0x0094]
	.word 0xb6950000  ! 2678: ORcc_R	orcc 	%r20, %r0, %r27
cpu_intr_3_215:
	setx	0x32011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe25c000  ! 2684: STW_R	stw	%r31, [%r23 + %r0]
iob_intr_3_220:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_220), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_221:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_221), 16, 16)) -> intp(3, 0, 2b)
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983fda  ! 2689: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fda, %hpstate
cpu_intr_3_216:
	setx	0x31032e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_217:
	setx	0x310235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf674c000  ! 2692: STX_R	stx	%r27, [%r19 + %r0]
	.word 0xf434a1f9  ! 2693: STH_I	sth	%r26, [%r18 + 0x01f9]
	.word 0xf434610e  ! 2695: STH_I	sth	%r26, [%r17 + 0x010e]
	.word 0xf075c000  ! 2697: STX_R	stx	%r24, [%r23 + %r0]
cpu_intr_3_218:
	setx	0x300034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02c8000  ! 2699: STB_R	stb	%r24, [%r18 + %r0]
T3_asi_reg_rd_137:
	mov	0x3c8, %r14
	.word 0xfcdb8e60  ! 2702: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xfca40020  ! 2706: STWA_R	stwa	%r30, [%r16 + %r0] 0x01
	.word 0xf0f5a18c  ! 2709: STXA_I	stxa	%r24, [%r22 + 0x018c] %asi
	.word 0xfe2ca17c  ! 2710: STB_I	stb	%r31, [%r18 + 0x017c]
iob_intr_3_222:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_222), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf8ac0020  ! 2712: STBA_R	stba	%r28, [%r16 + %r0] 0x01
iob_intr_3_223:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_223), 16, 16)) -> intp(3, 0, e)
	.word 0xb92de001  ! 2715: SLL_I	sll 	%r23, 0x0001, %r28
iob_intr_3_224:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_224), 16, 16)) -> intp(3, 0, 6)
	.word 0xbb2d6001  ! 2719: SLL_I	sll 	%r21, 0x0001, %r29
T3_asi_reg_wr_123:
	mov	0x3c0, %r14
	.word 0xfef38400  ! 2720: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	.word 0xf03421e5  ! 2723: STH_I	sth	%r24, [%r16 + 0x01e5]
cpu_intr_3_219:
	setx	0x350220, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_138:
	mov	0x1d, %r14
	.word 0xf0db84a0  ! 2725: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T3_asi_reg_rd_139:
	mov	0x2d, %r14
	.word 0xfadb8e40  ! 2726: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_3_220:
	setx	0x370104, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_221:
	setx	0x37003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02d61ee  ! 2731: STB_I	stb	%r24, [%r21 + 0x01ee]
cpu_intr_3_222:
	setx	0x340323, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_223:
	setx	0x340227, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_225:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_225), 16, 16)) -> intp(3, 0, 1)
T3_asi_reg_wr_124:
	mov	0x15, %r14
	.word 0xfaf38e80  ! 2740: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T3_asi_reg_rd_140:
	mov	0x1b, %r14
	.word 0xf8db84a0  ! 2742: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xf6258000  ! 2745: STW_R	stw	%r27, [%r22 + %r0]
iob_intr_3_226:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_226), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_rd_141:
	mov	0x2b, %r14
	.word 0xf6db89e0  ! 2748: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_3_224:
	setx	0x36023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_225:
	setx	0x350235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa35e0f2  ! 2755: STH_I	sth	%r29, [%r23 + 0x00f2]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbaa52150  ! 2761: SUBcc_I	subcc 	%r20, 0x0150, %r29
cpu_intr_3_226:
	setx	0x36021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_142:
	mov	0x6, %r14
	.word 0xf2db8e40  ! 2772: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_3_227:
	setx	0x36022d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b48000  ! 2775: ORNcc_R	orncc 	%r18, %r0, %r27
	ta	T_CHANGE_TO_TL1
	.word 0xb6a5c000  ! 2777: SUBcc_R	subcc 	%r23, %r0, %r27
	.word 0xf42d4000  ! 2778: STB_R	stb	%r26, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0xfc25602a  ! 2780: STW_I	stw	%r30, [%r21 + 0x002a]
	ta	T_CHANGE_TO_TL1
iob_intr_3_227:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_227), 16, 16)) -> intp(3, 0, 28)
iob_intr_3_228:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_228), 16, 16)) -> intp(3, 0, 26)
	.word 0xfc2c0000  ! 2789: STB_R	stb	%r30, [%r16 + %r0]
T3_asi_reg_rd_143:
	mov	0x32, %r14
	.word 0xfcdb84a0  ! 2790: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_3_229:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_229), 16, 16)) -> intp(3, 0, 3b)
	.word 0xf074a035  ! 2797: STX_I	stx	%r24, [%r18 + 0x0035]
	.word 0xfc248000  ! 2798: STW_R	stw	%r30, [%r18 + %r0]
cpu_intr_3_228:
	setx	0x350016, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4744000  ! 2801: STX_R	stx	%r26, [%r17 + %r0]
cpu_intr_3_229:
	setx	0x370102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb294a19e  ! 2804: ORcc_I	orcc 	%r18, 0x019e, %r25
	.word 0xf024a168  ! 2806: STW_I	stw	%r24, [%r18 + 0x0168]
iob_intr_3_230:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_230), 16, 16)) -> intp(3, 0, 26)
T3_asi_reg_wr_125:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 2809: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf8a58020  ! 2810: STWA_R	stwa	%r28, [%r22 + %r0] 0x01
T3_asi_reg_wr_126:
	mov	0xf, %r14
	.word 0xf0f38400  ! 2814: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf6756070  ! 2815: STX_I	stx	%r27, [%r21 + 0x0070]
T3_asi_reg_rd_144:
	mov	0x3c4, %r14
	.word 0xfadb89e0  ! 2817: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T3_asi_reg_wr_127:
	mov	0x3c8, %r14
	.word 0xf6f38e60  ! 2818: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf6ad61c6  ! 2819: STBA_I	stba	%r27, [%r21 + 0x01c6] %asi
cpu_intr_3_230:
	setx	0x37032f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_231:
	setx	0x370313, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_3_231:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_231), 16, 16)) -> intp(3, 0, 28)
cpu_intr_3_232:
	setx	0x36031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaa50020  ! 2835: STWA_R	stwa	%r29, [%r20 + %r0] 0x01
T3_asi_reg_rd_145:
	mov	0x2, %r14
	.word 0xfcdb8e60  ! 2836: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
T3_asi_reg_wr_128:
	mov	0x27, %r14
	.word 0xfef38e60  ! 2837: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xb8054000  ! 2838: ADD_R	add 	%r21, %r0, %r28
	.word 0xf6b44020  ! 2840: STHA_R	stha	%r27, [%r17 + %r0] 0x01
	.word 0xb2bc2156  ! 2842: XNORcc_I	xnorcc 	%r16, 0x0156, %r25
iob_intr_3_232:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_232), 16, 16)) -> intp(3, 0, 22)
	ta	T_CHANGE_HPRIV
iob_intr_3_233:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_233), 16, 16)) -> intp(3, 0, 18)
	.word 0xf6a521d2  ! 2852: STWA_I	stwa	%r27, [%r20 + 0x01d2] %asi
T3_asi_reg_wr_129:
	mov	0x5, %r14
	.word 0xf8f38e60  ! 2855: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xf0f4e046  ! 2857: STXA_I	stxa	%r24, [%r19 + 0x0046] %asi
	.word 0xbe0c4000  ! 2860: AND_R	and 	%r17, %r0, %r31
	.word 0xb350c000  ! 2863: RDPR_TT	rdpr	%tt, %r25
iob_intr_3_234:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_234), 16, 16)) -> intp(3, 0, 23)
iob_intr_3_235:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_235), 16, 16)) -> intp(3, 0, 36)
	.word 0xfcb48020  ! 2870: STHA_R	stha	%r30, [%r18 + %r0] 0x01
cpu_intr_3_233:
	setx	0x34003d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf42d6176  ! 2872: STB_I	stb	%r26, [%r21 + 0x0176]
cpu_intr_3_234:
	setx	0x360207, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_130:
	mov	0x1e, %r14
	.word 0xfaf38e60  ! 2877: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
	.word 0xf22c20b2  ! 2879: STB_I	stb	%r25, [%r16 + 0x00b2]
	.word 0xfaad4020  ! 2882: STBA_R	stba	%r29, [%r21 + %r0] 0x01
T3_asi_reg_wr_131:
	mov	0x2e, %r14
	.word 0xf0f384a0  ! 2883: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb6bce088  ! 2884: XNORcc_I	xnorcc 	%r19, 0x0088, %r27
T3_asi_reg_wr_132:
	mov	0x3c7, %r14
	.word 0xfef38400  ! 2885: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_3_235:
	setx	0x370311, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_133:
	mov	0x5, %r14
	.word 0xf8f38e40  ! 2887: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T3_asi_reg_wr_134:
	mov	0x37, %r14
	.word 0xfcf38e60  ! 2888: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T3_asi_reg_rd_146:
	mov	0x33, %r14
	.word 0xf4db8e60  ! 2890: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
cpu_intr_3_236:
	setx	0x350321, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_135:
	mov	0x1b, %r14
	.word 0xfef38e40  ! 2893: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf8740000  ! 2894: STX_R	stx	%r28, [%r16 + %r0]
	.word 0xfe348000  ! 2895: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xf8b48020  ! 2898: STHA_R	stha	%r28, [%r18 + %r0] 0x01
iob_intr_3_236:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_236), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_wr_136:
	mov	0x2a, %r14
	.word 0xf0f38400  ! 2900: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf2ad60a5  ! 2905: STBA_I	stba	%r25, [%r21 + 0x00a5] %asi
cpu_intr_3_237:
	setx	0x37031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8b50020  ! 2911: STHA_R	stha	%r28, [%r20 + %r0] 0x01
cpu_intr_3_238:
	setx	0x370335, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_137:
	mov	0x2c, %r14
	.word 0xfcf384a0  ! 2915: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
cpu_intr_3_239:
	setx	0x360329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf624e162  ! 2917: STW_I	stw	%r27, [%r19 + 0x0162]
iob_intr_3_237:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_237), 16, 16)) -> intp(3, 0, 7)
	.word 0xfe2d8000  ! 2925: STB_R	stb	%r31, [%r22 + %r0]
T3_asi_reg_wr_138:
	mov	0x1f, %r14
	.word 0xf0f38e40  ! 2930: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_3_238:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_238), 16, 16)) -> intp(3, 0, a)
iob_intr_3_239:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_239), 16, 16)) -> intp(3, 0, 1e)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_3_240:
	setx	0x36031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc358000  ! 2939: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xfc34e08a  ! 2942: STH_I	sth	%r30, [%r19 + 0x008a]
cpu_intr_3_241:
	setx	0x350332, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_147:
	mov	0x3c7, %r14
	.word 0xf2db8400  ! 2952: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	.word 0xb035c000  ! 2955: SUBC_R	orn 	%r23, %r0, %r24
cpu_intr_3_242:
	setx	0x350030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb21c6034  ! 2959: XOR_I	xor 	%r17, 0x0034, %r25
	.word 0xb034a00e  ! 2960: SUBC_I	orn 	%r18, 0x000e, %r24
T3_asi_reg_wr_139:
	mov	0x17, %r14
	.word 0xf8f389e0  ! 2961: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xfe258000  ! 2962: STW_R	stw	%r31, [%r22 + %r0]
T3_asi_reg_wr_140:
	mov	0x2, %r14
	.word 0xf6f38400  ! 2964: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_3_243:
	setx	0x370214, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_141:
	mov	0x3c7, %r14
	.word 0xfef38e80  ! 2968: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb8948000  ! 2970: ORcc_R	orcc 	%r18, %r0, %r28
	.word 0xbe2d4000  ! 2974: ANDN_R	andn 	%r21, %r0, %r31
	.word 0xf8b44020  ! 2980: STHA_R	stha	%r28, [%r17 + %r0] 0x01
	.word 0xf0ade13f  ! 2982: STBA_I	stba	%r24, [%r23 + 0x013f] %asi
iob_intr_3_240:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_240), 16, 16)) -> intp(3, 0, 15)
	.word 0xfc24c000  ! 2986: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xb52d2001  ! 2987: SLL_I	sll 	%r20, 0x0001, %r26
	.word 0xb32c3001  ! 2988: SLLX_I	sllx	%r16, 0x0001, %r25
	.word 0xbebc61ba  ! 2990: XNORcc_I	xnorcc 	%r17, 0x01ba, %r31
	.word 0xb00d8000  ! 2991: AND_R	and 	%r22, %r0, %r24
iob_intr_3_241:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_241), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_244:
	setx	0x360208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb82c2009  ! 2997: ANDN_I	andn 	%r16, 0x0009, %r28
cpu_intr_3_245:
	setx	0x370317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_246:
	setx	0x340237, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_242:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_242), 16, 16)) -> intp(3, 0, 3d)
iob_intr_3_243:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_243), 16, 16)) -> intp(3, 0, 38)
	.word 0xfe7461db  ! 3008: STX_I	stx	%r31, [%r17 + 0x01db]
	.word 0xbe0de1b5  ! 3010: AND_I	and 	%r23, 0x01b5, %r31
	.word 0xfe2d4000  ! 3012: STB_R	stb	%r31, [%r21 + %r0]
iob_intr_3_244:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_244), 16, 16)) -> intp(3, 0, 3)
	.word 0xfe25c000  ! 3014: STW_R	stw	%r31, [%r23 + %r0]
	.word 0xfa242179  ! 3016: STW_I	stw	%r29, [%r16 + 0x0179]
	.word 0xf075c000  ! 3019: STX_R	stx	%r24, [%r23 + %r0]
T3_asi_reg_rd_148:
	mov	0x3c1, %r14
	.word 0xfedb84a0  ! 3021: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf875209d  ! 3023: STX_I	stx	%r28, [%r20 + 0x009d]
	.word 0xf2aca147  ! 3029: STBA_I	stba	%r25, [%r18 + 0x0147] %asi
cpu_intr_3_247:
	setx	0x350123, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_142:
	mov	0x2b, %r14
	.word 0xfef389e0  ! 3033: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T3_asi_reg_wr_143:
	mov	0x2c, %r14
	.word 0xfaf38e40  ! 3034: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_3_248:
	setx	0x35030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_149:
	mov	0x1c, %r14
	.word 0xf0db8e40  ! 3039: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xf2f460c5  ! 3041: STXA_I	stxa	%r25, [%r17 + 0x00c5] %asi
	ta	T_CHANGE_NONHPRIV
	.word 0xf834a052  ! 3044: STH_I	sth	%r28, [%r18 + 0x0052]
T3_asi_reg_rd_150:
	mov	0x3c4, %r14
	.word 0xf2db8400  ! 3046: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T3_asi_reg_wr_144:
	mov	0x14, %r14
	.word 0xfef38e40  ! 3048: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xfca5e179  ! 3049: STWA_I	stwa	%r30, [%r23 + 0x0179] %asi
cpu_intr_3_249:
	setx	0x370002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_245:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_245), 16, 16)) -> intp(3, 0, 8)
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_145:
	mov	0x3c4, %r14
	.word 0xf4f38400  ! 3056: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xba354000  ! 3057: SUBC_R	orn 	%r21, %r0, %r29
	ta	T_CHANGE_NONHPRIV
	.word 0xfc344000  ! 3061: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xfea4c020  ! 3064: STWA_R	stwa	%r31, [%r19 + %r0] 0x01
	.word 0xf8a44020  ! 3066: STWA_R	stwa	%r28, [%r17 + %r0] 0x01
iob_intr_3_246:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_246), 16, 16)) -> intp(3, 0, 29)
	.word 0xa1902000  ! 3068: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xfa7560a0  ! 3069: STX_I	stx	%r29, [%r21 + 0x00a0]
iob_intr_3_247:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_247), 16, 16)) -> intp(3, 0, 37)
	ta	T_CHANGE_HPRIV
	.word 0xb0bc4000  ! 3075: XNORcc_R	xnorcc 	%r17, %r0, %r24
T3_asi_reg_wr_146:
	mov	0x3c3, %r14
	.word 0xfef38e80  ! 3077: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_248:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_248), 16, 16)) -> intp(3, 0, 19)
cpu_intr_3_250:
	setx	0x37011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfab44020  ! 3084: STHA_R	stha	%r29, [%r17 + %r0] 0x01
iob_intr_3_249:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_249), 16, 16)) -> intp(3, 0, 2f)
	ta	T_CHANGE_TO_TL0
cpu_intr_3_251:
	setx	0x35010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_252:
	setx	0x360012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaf5610c  ! 3094: STXA_I	stxa	%r29, [%r21 + 0x010c] %asi
T3_asi_reg_rd_151:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 3097: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xfe3561ba  ! 3099: STH_I	sth	%r31, [%r21 + 0x01ba]
T3_asi_reg_wr_147:
	mov	0x16, %r14
	.word 0xf0f38e60  ! 3102: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_3_253:
	setx	0x360217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6250000  ! 3105: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xf6b560a3  ! 3107: STHA_I	stha	%r27, [%r21 + 0x00a3] %asi
T3_asi_reg_rd_152:
	mov	0x3c8, %r14
	.word 0xf0db84a0  ! 3110: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_3_254:
	setx	0x350011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcac8020  ! 3112: STBA_R	stba	%r30, [%r18 + %r0] 0x01
	.word 0xfeacc020  ! 3113: STBA_R	stba	%r31, [%r19 + %r0] 0x01
	.word 0xf62ce046  ! 3114: STB_I	stb	%r27, [%r19 + 0x0046]
T3_asi_reg_rd_153:
	mov	0x32, %r14
	.word 0xf8db84a0  ! 3116: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_3_255:
	setx	0x36011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_250:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_250), 16, 16)) -> intp(3, 0, 1)
	.word 0xf8a5a0cf  ! 3123: STWA_I	stwa	%r28, [%r22 + 0x00cf] %asi
	.word 0xf8a5e007  ! 3125: STWA_I	stwa	%r28, [%r23 + 0x0007] %asi
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfab46195  ! 3130: STHA_I	stha	%r29, [%r17 + 0x0195] %asi
iob_intr_3_251:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_251), 16, 16)) -> intp(3, 0, 2f)
	.word 0xf2f561c2  ! 3132: STXA_I	stxa	%r25, [%r21 + 0x01c2] %asi
iob_intr_3_252:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_252), 16, 16)) -> intp(3, 0, a)
	.word 0xf4b4c020  ! 3134: STHA_R	stha	%r26, [%r19 + %r0] 0x01
	.word 0xf225c000  ! 3135: STW_R	stw	%r25, [%r23 + %r0]
cpu_intr_3_256:
	setx	0x350215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfea58020  ! 3139: STWA_R	stwa	%r31, [%r22 + %r0] 0x01
	.word 0xf6a44020  ! 3140: STWA_R	stwa	%r27, [%r17 + %r0] 0x01
	.word 0xf2350000  ! 3141: STH_R	sth	%r25, [%r20 + %r0]
iob_intr_3_253:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_253), 16, 16)) -> intp(3, 0, 3c)
cpu_intr_3_257:
	setx	0x340222, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_148:
	mov	0x5, %r14
	.word 0xf4f38400  ! 3147: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T3_asi_reg_wr_149:
	mov	0x32, %r14
	.word 0xfcf38e40  ! 3148: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T3_asi_reg_wr_150:
	mov	0x27, %r14
	.word 0xf2f389e0  ! 3149: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T3_asi_reg_rd_154:
	mov	0x3c0, %r14
	.word 0xf4db84a0  ! 3151: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_3_254:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_254), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_rd_155:
	mov	0x25, %r14
	.word 0xf8db8e40  ! 3154: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xa1902001  ! 3158: WRPR_GL_I	wrpr	%r0, 0x0001, %-
iob_intr_3_255:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_255), 16, 16)) -> intp(3, 0, 5)
	.word 0xf025e1ea  ! 3162: STW_I	stw	%r24, [%r23 + 0x01ea]
T3_asi_reg_wr_151:
	mov	0x3c3, %r14
	.word 0xf0f38e60  ! 3164: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_3_258:
	setx	0x360004, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_256:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_256), 16, 16)) -> intp(3, 0, 36)
	.word 0xf6a5216c  ! 3172: STWA_I	stwa	%r27, [%r20 + 0x016c] %asi
	.word 0xfe74c000  ! 3173: STX_R	stx	%r31, [%r19 + %r0]
T3_asi_reg_wr_152:
	mov	0x35, %r14
	.word 0xfcf384a0  ! 3174: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982f12  ! 3177: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f12, %hpstate
iob_intr_3_257:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_257), 16, 16)) -> intp(3, 0, 14)
cpu_intr_3_259:
	setx	0x38001f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_258:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_258), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_rd_156:
	mov	0x11, %r14
	.word 0xfcdb8e80  ! 3191: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_3_259:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_259), 16, 16)) -> intp(3, 0, 38)
cpu_intr_3_260:
	setx	0x3b0220, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_260:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_260), 16, 16)) -> intp(3, 0, 19)
	.word 0xfc24a1a4  ! 3200: STW_I	stw	%r30, [%r18 + 0x01a4]
	.word 0xf0758000  ! 3202: STX_R	stx	%r24, [%r22 + %r0]
	ta	T_CHANGE_TO_TL0
	.word 0xf024c000  ! 3206: STW_R	stw	%r24, [%r19 + %r0]
iob_intr_3_261:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_261), 16, 16)) -> intp(3, 0, 14)
	.word 0xb93cd000  ! 3213: SRAX_R	srax	%r19, %r0, %r28
	.word 0xb7344000  ! 3215: SRL_R	srl 	%r17, %r0, %r27
cpu_intr_3_261:
	setx	0x3b0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba14a144  ! 3222: OR_I	or 	%r18, 0x0144, %r29
	.word 0xf2acc020  ! 3223: STBA_R	stba	%r25, [%r19 + %r0] 0x01
T3_asi_reg_wr_153:
	mov	0x3c8, %r14
	.word 0xfcf38e80  ! 3228: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_3_262:
	setx	0x390205, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_263:
	setx	0x39031b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_264:
	setx	0x3a0132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_265:
	setx	0x3a0309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2242114  ! 3242: STW_I	stw	%r25, [%r16 + 0x0114]
	.word 0xba040000  ! 3243: ADD_R	add 	%r16, %r0, %r29
	setx	data_start_6, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983fca  ! 3245: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fca, %hpstate
	.word 0xfe244000  ! 3246: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xb73ce001  ! 3248: SRA_I	sra 	%r19, 0x0001, %r27
iob_intr_3_262:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_262), 16, 16)) -> intp(3, 0, 1a)
iob_intr_3_263:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_263), 16, 16)) -> intp(3, 0, 12)
T3_asi_reg_rd_157:
	mov	0x12, %r14
	.word 0xf0db8e80  ! 3255: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T3_asi_reg_wr_154:
	mov	0x36, %r14
	.word 0xfef38e80  ! 3260: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_3_266:
	setx	0x38012d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_264:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_264), 16, 16)) -> intp(3, 0, 17)
cpu_intr_3_267:
	setx	0x380231, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_158:
	mov	0x30, %r14
	.word 0xfadb89e0  ! 3266: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	ta	T_CHANGE_TO_TL1
cpu_intr_3_268:
	setx	0x390001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a48020  ! 3269: STWA_R	stwa	%r24, [%r18 + %r0] 0x01
	.word 0xfc2c4000  ! 3273: STB_R	stb	%r30, [%r17 + %r0]
	.word 0xfe250000  ! 3279: STW_R	stw	%r31, [%r20 + %r0]
T3_asi_reg_rd_159:
	mov	0x3c3, %r14
	.word 0xf8db8e80  ! 3280: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xbe0c606d  ! 3282: AND_I	and 	%r17, 0x006d, %r31
	.word 0xb92c4000  ! 3283: SLL_R	sll 	%r17, %r0, %r28
	.word 0xfcac6048  ! 3289: STBA_I	stba	%r30, [%r17 + 0x0048] %asi
	.word 0xba2c4000  ! 3290: ANDN_R	andn 	%r17, %r0, %r29
	.word 0xf874c000  ! 3291: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xb92cb001  ! 3295: SLLX_I	sllx	%r18, 0x0001, %r28
	.word 0xb735a001  ! 3300: SRL_I	srl 	%r22, 0x0001, %r27
	.word 0xbe24a008  ! 3306: SUB_I	sub 	%r18, 0x0008, %r31
cpu_intr_3_269:
	setx	0x3b022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_155:
	mov	0x9, %r14
	.word 0xf0f38e60  ! 3308: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf4ad4020  ! 3309: STBA_R	stba	%r26, [%r21 + %r0] 0x01
	.word 0xfc74c000  ! 3311: STX_R	stx	%r30, [%r19 + %r0]
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983b58  ! 3313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b58, %hpstate
	.word 0xf4b40020  ! 3314: STHA_R	stha	%r26, [%r16 + %r0] 0x01
	.word 0xb60d2054  ! 3316: AND_I	and 	%r20, 0x0054, %r27
	.word 0xf02d21fc  ! 3317: STB_I	stb	%r24, [%r20 + 0x01fc]
cpu_intr_3_270:
	setx	0x380109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4758000  ! 3321: STX_R	stx	%r26, [%r22 + %r0]
T3_asi_reg_wr_156:
	mov	0x24, %r14
	.word 0xfcf38e40  ! 3323: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_265:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_265), 16, 16)) -> intp(3, 0, 17)
	.word 0xfaf460e5  ! 3333: STXA_I	stxa	%r29, [%r17 + 0x00e5] %asi
	.word 0xfcac217a  ! 3334: STBA_I	stba	%r30, [%r16 + 0x017a] %asi
T3_asi_reg_rd_160:
	mov	0x3c6, %r14
	.word 0xf8db8e40  ! 3335: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb0bda0b0  ! 3337: XNORcc_I	xnorcc 	%r22, 0x00b0, %r24
	.word 0xf6350000  ! 3342: STH_R	sth	%r27, [%r20 + %r0]
T3_asi_reg_wr_157:
	mov	0x17, %r14
	.word 0xf4f38e80  ! 3345: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_3_266:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_266), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_wr_158:
	mov	0x26, %r14
	.word 0xfaf38400  ! 3351: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_3_271:
	setx	0x390117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a5a137  ! 3353: STWA_I	stwa	%r24, [%r22 + 0x0137] %asi
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_TO_TL1
	.word 0xf0f520e9  ! 3362: STXA_I	stxa	%r24, [%r20 + 0x00e9] %asi
iob_intr_3_267:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_267), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf0ac0020  ! 3366: STBA_R	stba	%r24, [%r16 + %r0] 0x01
	.word 0x9194e08a  ! 3367: WRPR_PIL_I	wrpr	%r19, 0x008a, %pil
T3_asi_reg_rd_161:
	mov	0x1b, %r14
	.word 0xf2db8e40  ! 3368: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf0348000  ! 3369: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xf0ad4020  ! 3370: STBA_R	stba	%r24, [%r21 + %r0] 0x01
	.word 0xb57c2401  ! 3372: MOVR_I	movre	%r16, 0x1, %r26
	.word 0xf234a159  ! 3377: STH_I	sth	%r25, [%r18 + 0x0159]
T3_asi_reg_wr_159:
	mov	0xe, %r14
	.word 0xfaf38e40  ! 3380: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
T3_asi_reg_wr_160:
	mov	0x2, %r14
	.word 0xf2f38e80  ! 3382: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xfcf52049  ! 3383: STXA_I	stxa	%r30, [%r20 + 0x0049] %asi
	.word 0xb4b4212b  ! 3385: ORNcc_I	orncc 	%r16, 0x012b, %r26
	.word 0xf025e0bb  ! 3388: STW_I	stw	%r24, [%r23 + 0x00bb]
	ta	T_CHANGE_NONHPRIV
	.word 0xfe248000  ! 3391: STW_R	stw	%r31, [%r18 + %r0]
iob_intr_3_268:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_268), 16, 16)) -> intp(3, 0, 36)
T3_asi_reg_rd_162:
	mov	0x17, %r14
	.word 0xf6db8e40  ! 3395: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
iob_intr_3_269:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_269), 16, 16)) -> intp(3, 0, 6)
	.word 0xfe750000  ! 3397: STX_R	stx	%r31, [%r20 + %r0]
	ta	T_CHANGE_TO_TL0
cpu_intr_3_272:
	setx	0x38012b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc25a165  ! 3400: STW_I	stw	%r30, [%r22 + 0x0165]
T3_asi_reg_wr_161:
	mov	0xd, %r14
	.word 0xfcf389e0  ! 3402: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_3_270:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_270), 16, 16)) -> intp(3, 0, 39)
T3_asi_reg_wr_162:
	mov	0x2f, %r14
	.word 0xf4f384a0  ! 3406: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_3_273:
	setx	0x380328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_274:
	setx	0x3a013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_3_271:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_271), 16, 16)) -> intp(3, 0, 1f)
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_163:
	mov	0x1e, %r14
	.word 0xf2db8400  ! 3416: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
T3_asi_reg_wr_163:
	mov	0x9, %r14
	.word 0xf4f38e60  ! 3417: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xb33c1000  ! 3418: SRAX_R	srax	%r16, %r0, %r25
	.word 0xfeb50020  ! 3421: STHA_R	stha	%r31, [%r20 + %r0] 0x01
cpu_intr_3_275:
	setx	0x380035, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_276:
	setx	0x3a003b, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_164:
	mov	0x3c7, %r14
	.word 0xf8db89e0  ! 3428: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T3_asi_reg_wr_164:
	mov	0x3c6, %r14
	.word 0xf6f38e80  ! 3431: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xfa2cc000  ! 3432: STB_R	stb	%r29, [%r19 + %r0]
iob_intr_3_272:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_272), 16, 16)) -> intp(3, 0, 3)
	.word 0xfa3461d3  ! 3438: STH_I	sth	%r29, [%r17 + 0x01d3]
	ta	T_CHANGE_HPRIV
	.word 0xb1504000  ! 3445: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xf8256076  ! 3446: STW_I	stw	%r28, [%r21 + 0x0076]
	.word 0xfe2dc000  ! 3447: STB_R	stb	%r31, [%r23 + %r0]
iob_intr_3_273:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_273), 16, 16)) -> intp(3, 0, d)
iob_intr_3_274:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_274), 16, 16)) -> intp(3, 0, 1)
cpu_intr_3_277:
	setx	0x390205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcace043  ! 3456: STBA_I	stba	%r30, [%r19 + 0x0043] %asi
T3_asi_reg_rd_165:
	mov	0x3c4, %r14
	.word 0xf6db8e80  ! 3457: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xf8a52138  ! 3459: STWA_I	stwa	%r28, [%r20 + 0x0138] %asi
cpu_intr_3_278:
	setx	0x380306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe2c2139  ! 3467: STB_I	stb	%r31, [%r16 + 0x0139]
	.word 0xbc1d8000  ! 3468: XOR_R	xor 	%r22, %r0, %r30
cpu_intr_3_279:
	setx	0x3a0002, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe2d4000  ! 3474: STB_R	stb	%r31, [%r21 + %r0]
	.word 0xf8a56076  ! 3475: STWA_I	stwa	%r28, [%r21 + 0x0076] %asi
	.word 0xfcb44020  ! 3480: STHA_R	stha	%r30, [%r17 + %r0] 0x01
T3_asi_reg_rd_166:
	mov	0x12, %r14
	.word 0xfedb8e40  ! 3481: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_280:
	setx	0x3a0309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_281:
	setx	0x3a003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe25a152  ! 3485: STW_I	stw	%r31, [%r22 + 0x0152]
	.word 0xf8adc020  ! 3486: STBA_R	stba	%r28, [%r23 + %r0] 0x01
	.word 0xf4a40020  ! 3487: STWA_R	stwa	%r26, [%r16 + %r0] 0x01
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982880  ! 3489: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0880, %hpstate
	.word 0xb57c4400  ! 3490: MOVR_R	movre	%r17, %r0, %r26
	.word 0xb77de401  ! 3492: MOVR_I	movre	%r23, 0x1, %r27
	.word 0xb61521d8  ! 3496: OR_I	or 	%r20, 0x01d8, %r27
	.word 0xbcb560e8  ! 3499: SUBCcc_I	orncc 	%r21, 0x00e8, %r30
	.word 0xf87461cd  ! 3500: STX_I	stx	%r28, [%r17 + 0x01cd]
	.word 0xf4f5a16b  ! 3501: STXA_I	stxa	%r26, [%r22 + 0x016b] %asi
	.word 0xfc3461fd  ! 3503: STH_I	sth	%r30, [%r17 + 0x01fd]
T3_asi_reg_wr_165:
	mov	0x32, %r14
	.word 0xfef38400  ! 3504: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf6aca0b5  ! 3505: STBA_I	stba	%r27, [%r18 + 0x00b5] %asi
cpu_intr_3_282:
	setx	0x3a0227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_283:
	setx	0x390223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf87421f0  ! 3509: STX_I	stx	%r28, [%r16 + 0x01f0]
iob_intr_3_275:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_275), 16, 16)) -> intp(3, 0, 7)
	.word 0xfe2cc000  ! 3512: STB_R	stb	%r31, [%r19 + %r0]
	.word 0xf674a01d  ! 3514: STX_I	stx	%r27, [%r18 + 0x001d]
	.word 0xf6b44020  ! 3518: STHA_R	stha	%r27, [%r17 + %r0] 0x01
cpu_intr_3_284:
	setx	0x3b0106, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_285:
	setx	0x39021e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_276:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_276), 16, 16)) -> intp(3, 0, 9)
T3_asi_reg_rd_167:
	mov	0x2c, %r14
	.word 0xfcdb84a0  ! 3526: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	ta	T_CHANGE_HPRIV
	.word 0xb97de401  ! 3530: MOVR_I	movre	%r23, 0x1, %r28
	.word 0xf2a5a155  ! 3531: STWA_I	stwa	%r25, [%r22 + 0x0155] %asi
T3_asi_reg_rd_168:
	mov	0x25, %r14
	.word 0xf2db8e40  ! 3534: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_TO_TL0
	.word 0xf07561b1  ! 3536: STX_I	stx	%r24, [%r21 + 0x01b1]
iob_intr_3_277:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_277), 16, 16)) -> intp(3, 0, 35)
T3_asi_reg_rd_169:
	mov	0x24, %r14
	.word 0xfcdb8e40  ! 3538: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbc2de1ba  ! 3542: ANDN_I	andn 	%r23, 0x01ba, %r30
T3_asi_reg_rd_170:
	mov	0x11, %r14
	.word 0xfedb8e60  ! 3546: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xfe34e094  ! 3548: STH_I	sth	%r31, [%r19 + 0x0094]
cpu_intr_3_286:
	setx	0x390315, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_171:
	mov	0x3c5, %r14
	.word 0xf8db8e80  ! 3550: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf02560a3  ! 3551: STW_I	stw	%r24, [%r21 + 0x00a3]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_287:
	setx	0x3a0104, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_166:
	mov	0xa, %r14
	.word 0xfaf384a0  ! 3556: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_3_278:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_278), 16, 16)) -> intp(3, 0, d)
T3_asi_reg_wr_167:
	mov	0x24, %r14
	.word 0xf6f38e80  ! 3559: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf035a198  ! 3562: STH_I	sth	%r24, [%r22 + 0x0198]
cpu_intr_3_288:
	setx	0x3a0000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_289:
	setx	0x3b030a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_290:
	setx	0x3a0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62ca0ea  ! 3568: STB_I	stb	%r27, [%r18 + 0x00ea]
	.word 0xf8354000  ! 3572: STH_R	sth	%r28, [%r21 + %r0]
T3_asi_reg_wr_168:
	mov	0x37, %r14
	.word 0xf0f38e80  ! 3573: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T3_asi_reg_wr_169:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 3574: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xfca5a0c2  ! 3576: STWA_I	stwa	%r30, [%r22 + 0x00c2] %asi
cpu_intr_3_291:
	setx	0x3a0130, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_279:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_279), 16, 16)) -> intp(3, 0, 26)
	.word 0xfe34c000  ! 3580: STH_R	sth	%r31, [%r19 + %r0]
	.word 0xbd352001  ! 3582: SRL_I	srl 	%r20, 0x0001, %r30
cpu_intr_3_292:
	setx	0x3b0334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_280:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_280), 16, 16)) -> intp(3, 0, 16)
cpu_intr_3_293:
	setx	0x39023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd51c000  ! 3586: RDPR_TL	rdpr	%tl, %r30
	.word 0xf22dc000  ! 3588: STB_R	stb	%r25, [%r23 + %r0]
cpu_intr_3_294:
	setx	0x3b003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4758000  ! 3590: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xf0744000  ! 3598: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xfc2c8000  ! 3601: STB_R	stb	%r30, [%r18 + %r0]
T3_asi_reg_wr_170:
	mov	0x21, %r14
	.word 0xf4f38e40  ! 3602: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_3_295:
	setx	0x380318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf7ca401  ! 3605: MOVR_I	movre	%r18, 0x1, %r31
	.word 0xb4446030  ! 3613: ADDC_I	addc 	%r17, 0x0030, %r26
iob_intr_3_281:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_281), 16, 16)) -> intp(3, 0, 2)
	.word 0xf0b420e8  ! 3618: STHA_I	stha	%r24, [%r16 + 0x00e8] %asi
	.word 0xfcb40020  ! 3623: STHA_R	stha	%r30, [%r16 + %r0] 0x01
iob_intr_3_282:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_282), 16, 16)) -> intp(3, 0, 2c)
T3_asi_reg_rd_172:
	mov	0x13, %r14
	.word 0xf0db8400  ! 3627: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf634c000  ! 3628: STH_R	sth	%r27, [%r19 + %r0]
T3_asi_reg_wr_171:
	mov	0x22, %r14
	.word 0xf4f389e0  ! 3630: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T3_asi_reg_wr_172:
	mov	0x3c5, %r14
	.word 0xf6f384a0  ! 3631: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_3_283:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_283), 16, 16)) -> intp(3, 0, 1d)
T3_asi_reg_wr_173:
	mov	0x3c3, %r14
	.word 0xf0f38400  ! 3634: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xf4aca07f  ! 3635: STBA_I	stba	%r26, [%r18 + 0x007f] %asi
	.word 0x8394a177  ! 3640: WRPR_TNPC_I	wrpr	%r18, 0x0177, %tnpc
iob_intr_3_284:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_284), 16, 16)) -> intp(3, 0, 2e)
T3_asi_reg_wr_174:
	mov	0x32, %r14
	.word 0xf4f389e0  ! 3644: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf2a54020  ! 3645: STWA_R	stwa	%r25, [%r21 + %r0] 0x01
	.word 0xf02560d4  ! 3648: STW_I	stw	%r24, [%r21 + 0x00d4]
	.word 0xb53d3001  ! 3649: SRAX_I	srax	%r20, 0x0001, %r26
	.word 0xf43460c3  ! 3650: STH_I	sth	%r26, [%r17 + 0x00c3]
	.word 0xfc258000  ! 3651: STW_R	stw	%r30, [%r22 + %r0]
	.word 0xf8350000  ! 3656: STH_R	sth	%r28, [%r20 + %r0]
T3_asi_reg_rd_173:
	mov	0x1, %r14
	.word 0xfadb8e60  ! 3657: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_3_285:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_285), 16, 16)) -> intp(3, 0, 1b)
	.word 0xbc350000  ! 3660: SUBC_R	orn 	%r20, %r0, %r30
iob_intr_3_286:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_286), 16, 16)) -> intp(3, 0, 21)
cpu_intr_3_296:
	setx	0x3c0132, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_175:
	mov	0x22, %r14
	.word 0xf8f384a0  ! 3665: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T3_asi_reg_wr_176:
	mov	0x24, %r14
	.word 0xfaf384a0  ! 3667: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T3_asi_reg_rd_174:
	mov	0x3c6, %r14
	.word 0xfadb8e40  ! 3668: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_3_287:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_287), 16, 16)) -> intp(3, 0, 0)
T3_asi_reg_wr_177:
	mov	0x14, %r14
	.word 0xfef384a0  ! 3673: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_3_288:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_288), 16, 16)) -> intp(3, 0, 8)
	.word 0xb5643801  ! 3676: MOVcc_I	<illegal instruction>
	.word 0x8d94609a  ! 3677: WRPR_PSTATE_I	wrpr	%r17, 0x009a, %pstate
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1
iob_intr_3_289:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_289), 16, 16)) -> intp(3, 0, d)
T3_asi_reg_wr_178:
	mov	0x3c4, %r14
	.word 0xf6f38400  ! 3684: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_3_290:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_290), 16, 16)) -> intp(3, 0, 14)
	ta	T_CHANGE_TO_TL1
	.word 0xba856070  ! 3690: ADDcc_I	addcc 	%r21, 0x0070, %r29
	.word 0xfaac6030  ! 3691: STBA_I	stba	%r29, [%r17 + 0x0030] %asi
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_179:
	mov	0x2f, %r14
	.word 0xfcf38e40  ! 3698: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_3_291:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_291), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf4b5208e  ! 3700: STHA_I	stha	%r26, [%r20 + 0x008e] %asi
	ta	T_CHANGE_TO_TL0
	.word 0xb93da001  ! 3702: SRA_I	sra 	%r22, 0x0001, %r28
	.word 0xf674a06c  ! 3704: STX_I	stx	%r27, [%r18 + 0x006c]
	.word 0xfa2c0000  ! 3705: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xfcad4020  ! 3706: STBA_R	stba	%r30, [%r21 + %r0] 0x01
	ta	T_CHANGE_TO_TL1
	.word 0xf8a4a0d3  ! 3709: STWA_I	stwa	%r28, [%r18 + 0x00d3] %asi
	.word 0xfe35614b  ! 3713: STH_I	sth	%r31, [%r21 + 0x014b]
iob_intr_3_292:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_292), 16, 16)) -> intp(3, 0, b)
	.word 0xfe74a19d  ! 3724: STX_I	stx	%r31, [%r18 + 0x019d]
	.word 0xb63460ed  ! 3725: SUBC_I	orn 	%r17, 0x00ed, %r27
cpu_intr_3_297:
	setx	0x3e0217, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b5613d  ! 3728: STHA_I	stha	%r27, [%r21 + 0x013d] %asi
T3_asi_reg_rd_175:
	mov	0x3c4, %r14
	.word 0xf4db8e40  ! 3730: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_HPRIV
cpu_intr_3_298:
	setx	0x3e0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4a4219c  ! 3735: STWA_I	stwa	%r26, [%r16 + 0x019c] %asi
	.word 0xf8a4c020  ! 3737: STWA_R	stwa	%r28, [%r19 + %r0] 0x01
cpu_intr_3_299:
	setx	0x3c0210, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_300:
	setx	0x3f031a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_176:
	mov	0x14, %r14
	.word 0xfedb8e40  ! 3744: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_rd_177:
	mov	0x1c, %r14
	.word 0xf4db8e60  ! 3746: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf4a48020  ! 3751: STWA_R	stwa	%r26, [%r18 + %r0] 0x01
cpu_intr_3_301:
	setx	0x3c0013, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe74615c  ! 3757: STX_I	stx	%r31, [%r17 + 0x015c]
	.word 0xfa2de11e  ! 3759: STB_I	stb	%r29, [%r23 + 0x011e]
	.word 0xf6750000  ! 3760: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xf2b5e0bf  ! 3761: STHA_I	stha	%r25, [%r23 + 0x00bf] %asi
	ta	T_CHANGE_HPRIV
	.word 0xf0b561c1  ! 3763: STHA_I	stha	%r24, [%r21 + 0x01c1] %asi
	.word 0xfc3460d3  ! 3764: STH_I	sth	%r30, [%r17 + 0x00d3]
	ta	T_CHANGE_TO_TL0
T3_asi_reg_wr_180:
	mov	0x24, %r14
	.word 0xf6f38e40  ! 3769: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfe742191  ! 3770: STX_I	stx	%r31, [%r16 + 0x0191]
iob_intr_3_293:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_293), 16, 16)) -> intp(3, 0, 10)
	.word 0xfca54020  ! 3774: STWA_R	stwa	%r30, [%r21 + %r0] 0x01
T3_asi_reg_rd_178:
	mov	0x1, %r14
	.word 0xf8db8e80  ! 3775: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xf2a54020  ! 3776: STWA_R	stwa	%r25, [%r21 + %r0] 0x01
	.word 0xba1d4000  ! 3777: XOR_R	xor 	%r21, %r0, %r29
cpu_intr_3_302:
	setx	0x3d0221, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe75c000  ! 3780: STX_R	stx	%r31, [%r23 + %r0]
	.word 0xfcb50020  ! 3781: STHA_R	stha	%r30, [%r20 + %r0] 0x01
	.word 0xf4b4c020  ! 3782: STHA_R	stha	%r26, [%r19 + %r0] 0x01
T3_asi_reg_rd_179:
	mov	0x3c4, %r14
	.word 0xfedb8e40  ! 3783: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_3_294:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_294), 16, 16)) -> intp(3, 0, 9)
	setx	data_start_3, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982c5a  ! 3787: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5a, %hpstate
	.word 0xfc358000  ! 3790: STH_R	sth	%r30, [%r22 + %r0]
cpu_intr_3_303:
	setx	0x3f0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2c5c000  ! 3793: ADDCcc_R	addccc 	%r23, %r0, %r25
T3_asi_reg_wr_181:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 3797: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	setx	data_start_1, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983c5a  ! 3798: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c5a, %hpstate
iob_intr_3_295:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_295), 16, 16)) -> intp(3, 0, 29)
T3_asi_reg_rd_180:
	mov	0x28, %r14
	.word 0xfedb8e40  ! 3801: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_3_304:
	setx	0x3d011e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_181:
	mov	0x1, %r14
	.word 0xf8db8400  ! 3806: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_3_296:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_296), 16, 16)) -> intp(3, 0, 5)
	.word 0xf82c8000  ! 3808: STB_R	stb	%r28, [%r18 + %r0]
iob_intr_3_297:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_297), 16, 16)) -> intp(3, 0, 25)
	.word 0xa1902002  ! 3810: WRPR_GL_I	wrpr	%r0, 0x0002, %-
T3_asi_reg_rd_182:
	mov	0xa, %r14
	.word 0xf8db8e80  ! 3812: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	ta	T_CHANGE_HPRIV
	.word 0xfe754000  ! 3816: STX_R	stx	%r31, [%r21 + %r0]
	.word 0xb4b56037  ! 3817: SUBCcc_I	orncc 	%r21, 0x0037, %r26
iob_intr_3_298:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_298), 16, 16)) -> intp(3, 0, 2c)
cpu_intr_3_305:
	setx	0x3c0120, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_3_299:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_299), 16, 16)) -> intp(3, 0, 38)
iob_intr_3_300:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_300), 16, 16)) -> intp(3, 0, 5)
cpu_intr_3_306:
	setx	0x3f0123, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_301:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_301), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf2ad614d  ! 3837: STBA_I	stba	%r25, [%r21 + 0x014d] %asi
	.word 0xf8ac0020  ! 3838: STBA_R	stba	%r28, [%r16 + %r0] 0x01
	.word 0xf0758000  ! 3839: STX_R	stx	%r24, [%r22 + %r0]
cpu_intr_3_307:
	setx	0x3c0339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72d3001  ! 3843: SLLX_I	sllx	%r20, 0x0001, %r27
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0a4c020  ! 3849: STWA_R	stwa	%r24, [%r19 + %r0] 0x01
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_rd_183:
	mov	0x3c4, %r14
	.word 0xf0db84a0  ! 3851: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
iob_intr_3_302:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_302), 16, 16)) -> intp(3, 0, 25)
	.word 0xf6340000  ! 3853: STH_R	sth	%r27, [%r16 + %r0]
	.word 0xf8a460d5  ! 3854: STWA_I	stwa	%r28, [%r17 + 0x00d5] %asi
cpu_intr_3_308:
	setx	0x3e0334, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_182:
	mov	0x34, %r14
	.word 0xfaf38400  ! 3856: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T3_asi_reg_wr_183:
	mov	0x1d, %r14
	.word 0xfef38e40  ! 3857: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T3_asi_reg_wr_184:
	mov	0x8, %r14
	.word 0xfef38e60  ! 3859: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	ta	T_CHANGE_HPRIV
	.word 0xf4b50020  ! 3865: STHA_R	stha	%r26, [%r20 + %r0] 0x01
cpu_intr_3_309:
	setx	0x3c0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb80d0000  ! 3868: AND_R	and 	%r20, %r0, %r28
	.word 0xf2b42090  ! 3870: STHA_I	stha	%r25, [%r16 + 0x0090] %asi
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_184:
	mov	0x24, %r14
	.word 0xfedb8e40  ! 3878: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb17de401  ! 3879: MOVR_I	movre	%r23, 0x1, %r24
T3_asi_reg_rd_185:
	mov	0x1c, %r14
	.word 0xf6db8e40  ! 3881: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb93c4000  ! 3882: SRA_R	sra 	%r17, %r0, %r28
cpu_intr_3_310:
	setx	0x3e0220, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_303:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_303), 16, 16)) -> intp(3, 0, 5)
	.word 0xbc048000  ! 3885: ADD_R	add 	%r18, %r0, %r30
	.word 0xf02421fa  ! 3888: STW_I	stw	%r24, [%r16 + 0x01fa]
	.word 0xf0a4e1c6  ! 3890: STWA_I	stwa	%r24, [%r19 + 0x01c6] %asi
	.word 0xb8b420fe  ! 3892: ORNcc_I	orncc 	%r16, 0x00fe, %r28
	.word 0xf4a4c020  ! 3898: STWA_R	stwa	%r26, [%r19 + %r0] 0x01
T3_asi_reg_wr_185:
	mov	0x3c1, %r14
	.word 0xf4f389e0  ! 3899: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xf6340000  ! 3902: STH_R	sth	%r27, [%r16 + %r0]
T3_asi_reg_wr_186:
	mov	0x16, %r14
	.word 0xf6f38400  ! 3903: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_3_304:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_304), 16, 16)) -> intp(3, 0, 32)
T3_asi_reg_wr_187:
	mov	0x3, %r14
	.word 0xf6f384a0  ! 3907: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb2a54000  ! 3908: SUBcc_R	subcc 	%r21, %r0, %r25
	.word 0xf634619e  ! 3910: STH_I	sth	%r27, [%r17 + 0x019e]
	.word 0xf0248000  ! 3911: STW_R	stw	%r24, [%r18 + %r0]
T3_asi_reg_rd_186:
	mov	0x3c8, %r14
	.word 0xfadb84a0  ! 3913: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf0740000  ! 3914: STX_R	stx	%r24, [%r16 + %r0]
iob_intr_3_305:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_305), 16, 16)) -> intp(3, 0, 25)
	.word 0xbd35b001  ! 3917: SRLX_I	srlx	%r22, 0x0001, %r30
T3_asi_reg_wr_188:
	mov	0x21, %r14
	.word 0xfaf38400  ! 3918: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xf22ce0aa  ! 3920: STB_I	stb	%r25, [%r19 + 0x00aa]
T3_asi_reg_rd_187:
	mov	0x2d, %r14
	.word 0xf4db8e80  ! 3923: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
T3_asi_reg_wr_189:
	mov	0x6, %r14
	.word 0xf2f389e0  ! 3924: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_3_306:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_306), 16, 16)) -> intp(3, 0, 11)
cpu_intr_3_311:
	setx	0x3d010e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_312:
	setx	0x3e031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbebc0000  ! 3931: XNORcc_R	xnorcc 	%r16, %r0, %r31
T3_asi_reg_rd_188:
	mov	0x21, %r14
	.word 0xf0db89e0  ! 3936: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_3_313:
	setx	0x3f032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8f4a006  ! 3945: STXA_I	stxa	%r28, [%r18 + 0x0006] %asi
T3_asi_reg_rd_189:
	mov	0x3c6, %r14
	.word 0xf6db84a0  ! 3946: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb4a48000  ! 3949: SUBcc_R	subcc 	%r18, %r0, %r26
cpu_intr_3_314:
	setx	0x3f0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf875c000  ! 3952: STX_R	stx	%r28, [%r23 + %r0]
T3_asi_reg_wr_190:
	mov	0x1d, %r14
	.word 0xfaf384a0  ! 3953: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf074e1e9  ! 3954: STX_I	stx	%r24, [%r19 + 0x01e9]
	.word 0xf6f4612f  ! 3957: STXA_I	stxa	%r27, [%r17 + 0x012f] %asi
T3_asi_reg_rd_190:
	mov	0x1d, %r14
	.word 0xf8db8400  ! 3959: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_3_315:
	setx	0x3c001e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_307:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_307), 16, 16)) -> intp(3, 0, 35)
iob_intr_3_308:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_308), 16, 16)) -> intp(3, 0, 39)
	.word 0xfcb4c020  ! 3967: STHA_R	stha	%r30, [%r19 + %r0] 0x01
T3_asi_reg_rd_191:
	mov	0x32, %r14
	.word 0xfcdb89e0  ! 3968: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf2f5602a  ! 3969: STXA_I	stxa	%r25, [%r21 + 0x002a] %asi
iob_intr_3_309:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_309), 16, 16)) -> intp(3, 0, 11)
iob_intr_3_310:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_310), 16, 16)) -> intp(3, 0, 3f)
iob_intr_3_311:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_311), 16, 16)) -> intp(3, 0, 3d)
	.word 0xf675a1ba  ! 3975: STX_I	stx	%r27, [%r22 + 0x01ba]
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982c00  ! 3976: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c00, %hpstate
	ta	T_CHANGE_NONHPRIV
	.word 0xf224612b  ! 3980: STW_I	stw	%r25, [%r17 + 0x012b]
cpu_intr_3_316:
	setx	0x3c0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb894e0d3  ! 3982: ORcc_I	orcc 	%r19, 0x00d3, %r28
	.word 0xf82ce1b2  ! 3983: STB_I	stb	%r28, [%r19 + 0x01b2]
	.word 0xf0a5c020  ! 3989: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
cpu_intr_3_317:
	setx	0x3e0106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4aca0cc  ! 3991: STBA_I	stba	%r26, [%r18 + 0x00cc] %asi
T3_asi_reg_rd_192:
	mov	0x1c, %r14
	.word 0xf4db8e60  ! 3992: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf6344000  ! 3993: STH_R	sth	%r27, [%r17 + %r0]
cpu_intr_3_318:
	setx	0x3f0325, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf641800  ! 3995: MOVcc_R	<illegal instruction>
	.word 0xf8b4a131  ! 3997: STHA_I	stha	%r28, [%r18 + 0x0131] %asi
	.word 0xf634c000  ! 3999: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xf435a033  ! 4000: STH_I	sth	%r26, [%r22 + 0x0033]
	.word 0xba1da006  ! 4001: XOR_I	xor 	%r22, 0x0006, %r29
iob_intr_3_312:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_312), 16, 16)) -> intp(3, 0, 10)
iob_intr_3_313:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_313), 16, 16)) -> intp(3, 0, 2c)
	.word 0xb8150000  ! 4007: OR_R	or 	%r20, %r0, %r28
	.word 0xfa3521ea  ! 4009: STH_I	sth	%r29, [%r20 + 0x01ea]
cpu_intr_3_319:
	setx	0x3e011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_193:
	mov	0x14, %r14
	.word 0xf2db8400  ! 4011: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf4340000  ! 4017: STH_R	sth	%r26, [%r16 + %r0]
T3_asi_reg_rd_194:
	mov	0x1c, %r14
	.word 0xf4db8e60  ! 4018: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL0
T3_asi_reg_rd_195:
	mov	0x3c6, %r14
	.word 0xfadb89e0  ! 4023: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T3_asi_reg_rd_196:
	mov	0x13, %r14
	.word 0xf0db8e60  ! 4025: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_197:
	mov	0xb, %r14
	.word 0xf0db84a0  ! 4029: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_3_320:
	setx	0x3f033c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_314:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_314), 16, 16)) -> intp(3, 0, 12)
iob_intr_3_315:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_315), 16, 16)) -> intp(3, 0, 12)
	.word 0xf2358000  ! 4039: STH_R	sth	%r25, [%r22 + %r0]
T3_asi_reg_wr_191:
	mov	0x3c6, %r14
	.word 0xf2f38400  ! 4041: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xf834c000  ! 4043: STH_R	sth	%r28, [%r19 + %r0]
cpu_intr_3_321:
	setx	0x3f0321, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf4ad8020  ! 4049: STBA_R	stba	%r26, [%r22 + %r0] 0x01
	.word 0xf8ac6143  ! 4050: STBA_I	stba	%r28, [%r17 + 0x0143] %asi
	.word 0xfc752133  ! 4053: STX_I	stx	%r30, [%r20 + 0x0133]
	.word 0xf624a142  ! 4057: STW_I	stw	%r27, [%r18 + 0x0142]
	.word 0xfeb461fa  ! 4058: STHA_I	stha	%r31, [%r17 + 0x01fa] %asi
iob_intr_3_316:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_316), 16, 16)) -> intp(3, 0, 28)
	setx	data_start_0, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982f18  ! 4062: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f18, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf8344000  ! 4066: STH_R	sth	%r28, [%r17 + %r0]
T3_asi_reg_wr_192:
	mov	0x16, %r14
	.word 0xf4f38400  ! 4069: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_3_317:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_317), 16, 16)) -> intp(3, 0, 29)
	.word 0xbf348000  ! 4071: SRL_R	srl 	%r18, %r0, %r31
	ta	T_CHANGE_HPRIV
T3_asi_reg_wr_193:
	mov	0x1b, %r14
	.word 0xf8f384a0  ! 4074: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_3_318:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_318), 16, 16)) -> intp(3, 0, 3a)
	.word 0xfa34c000  ! 4077: STH_R	sth	%r29, [%r19 + %r0]
iob_intr_3_319:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_319), 16, 16)) -> intp(3, 0, 3d)
	.word 0x8d94a125  ! 4080: WRPR_PSTATE_I	wrpr	%r18, 0x0125, %pstate
cpu_intr_3_322:
	setx	0x400138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8f902002  ! 4082: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
iob_intr_3_320:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_320), 16, 16)) -> intp(3, 0, 7)
	.word 0xfc25c000  ! 4088: STW_R	stw	%r30, [%r23 + %r0]
T3_asi_reg_rd_198:
	mov	0x37, %r14
	.word 0xfedb8400  ! 4089: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_3_323:
	setx	0x420022, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_321:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_321), 16, 16)) -> intp(3, 0, 1b)
iob_intr_3_322:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_322), 16, 16)) -> intp(3, 0, 17)
T3_asi_reg_rd_199:
	mov	0x24, %r14
	.word 0xfedb8400  ! 4093: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb8948000  ! 4096: ORcc_R	orcc 	%r18, %r0, %r28
iob_intr_3_323:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_323), 16, 16)) -> intp(3, 0, e)
cpu_intr_3_324:
	setx	0x420102, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_325:
	setx	0x430008, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2d0000  ! 4104: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xfaac2110  ! 4107: STBA_I	stba	%r29, [%r16 + 0x0110] %asi
T3_asi_reg_rd_200:
	mov	0x6, %r14
	.word 0xfedb89e0  ! 4109: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_194:
	mov	0x37, %r14
	.word 0xf8f38e40  ! 4113: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf2252051  ! 4114: STW_I	stw	%r25, [%r20 + 0x0051]
cpu_intr_3_326:
	setx	0x41002f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_324:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_324), 16, 16)) -> intp(3, 0, 24)
T3_asi_reg_wr_195:
	mov	0x8, %r14
	.word 0xf8f38e60  ! 4117: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
iob_intr_3_325:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_325), 16, 16)) -> intp(3, 0, 24)
cpu_intr_3_327:
	setx	0x41021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb08dc000  ! 4122: ANDcc_R	andcc 	%r23, %r0, %r24
	.word 0xf6a58020  ! 4127: STWA_R	stwa	%r27, [%r22 + %r0] 0x01
T3_asi_reg_rd_201:
	mov	0x2d, %r14
	.word 0xfedb8400  ! 4129: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb3643801  ! 4130: MOVcc_I	<illegal instruction>
cpu_intr_3_328:
	setx	0x420131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_329:
	setx	0x430012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6346149  ! 4138: STH_I	sth	%r27, [%r17 + 0x0149]
T3_asi_reg_rd_202:
	mov	0x3c2, %r14
	.word 0xf2db8e80  ! 4140: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	ta	T_CHANGE_TO_TL0
cpu_intr_3_330:
	setx	0x410132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_331:
	setx	0x420104, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_196:
	mov	0x11, %r14
	.word 0xf8f38e60  ! 4148: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_3_332:
	setx	0x410334, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_203:
	mov	0xc, %r14
	.word 0xf0db8e40  ! 4152: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
cpu_intr_3_333:
	setx	0x43030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf62dc000  ! 4155: STB_R	stb	%r27, [%r23 + %r0]
cpu_intr_3_334:
	setx	0x410018, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_204:
	mov	0x5, %r14
	.word 0xfadb84a0  ! 4158: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf2748000  ! 4162: STX_R	stx	%r25, [%r18 + %r0]
cpu_intr_3_335:
	setx	0x410307, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xfc3521b2  ! 4167: STH_I	sth	%r30, [%r20 + 0x01b2]
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982958  ! 4170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0958, %hpstate
cpu_intr_3_336:
	setx	0x420131, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_337:
	setx	0x430238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2b50020  ! 4175: STHA_R	stha	%r25, [%r20 + %r0] 0x01
	.word 0xf8ace0cf  ! 4177: STBA_I	stba	%r28, [%r19 + 0x00cf] %asi
T3_asi_reg_rd_205:
	mov	0x3c2, %r14
	.word 0xf8db8e80  ! 4178: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_3_338:
	setx	0x400029, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_326:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_326), 16, 16)) -> intp(3, 0, 5)
	.word 0xfe3460ec  ! 4186: STH_I	sth	%r31, [%r17 + 0x00ec]
	.word 0xbc8de09e  ! 4187: ANDcc_I	andcc 	%r23, 0x009e, %r30
iob_intr_3_327:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_327), 16, 16)) -> intp(3, 0, 24)
iob_intr_3_328:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_328), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_339:
	setx	0x420007, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_340:
	setx	0x420101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 4193: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xf6240000  ! 4194: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xb60561b1  ! 4196: ADD_I	add 	%r21, 0x01b1, %r27
	.word 0xf2ac0020  ! 4198: STBA_R	stba	%r25, [%r16 + %r0] 0x01
T3_asi_reg_wr_197:
	mov	0x6, %r14
	.word 0xf4f38e60  ! 4202: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
	.word 0xf2f4218e  ! 4204: STXA_I	stxa	%r25, [%r16 + 0x018e] %asi
	.word 0xfe750000  ! 4205: STX_R	stx	%r31, [%r20 + %r0]
T3_asi_reg_wr_198:
	mov	0x30, %r14
	.word 0xfaf38e40  ! 4209: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xfe25607e  ! 4210: STW_I	stw	%r31, [%r21 + 0x007e]
cpu_intr_3_341:
	setx	0x41011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22d4000  ! 4213: STB_R	stb	%r25, [%r21 + %r0]
iob_intr_3_329:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_329), 16, 16)) -> intp(3, 0, 21)
	.word 0xf4b4604b  ! 4218: STHA_I	stha	%r26, [%r17 + 0x004b] %asi
cpu_intr_3_342:
	setx	0x400116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa750000  ! 4222: STX_R	stx	%r29, [%r20 + %r0]
cpu_intr_3_343:
	setx	0x400003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2f5a1ba  ! 4229: STXA_I	stxa	%r25, [%r22 + 0x01ba] %asi
cpu_intr_3_344:
	setx	0x41013a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_345:
	setx	0x430138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbec48000  ! 4235: ADDCcc_R	addccc 	%r18, %r0, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xf0ad4020  ! 4238: STBA_R	stba	%r24, [%r21 + %r0] 0x01
iob_intr_3_330:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_330), 16, 16)) -> intp(3, 0, 1e)
cpu_intr_3_346:
	setx	0x410025, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8358000  ! 4244: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xfc74e187  ! 4251: STX_I	stx	%r30, [%r19 + 0x0187]
iob_intr_3_331:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_331), 16, 16)) -> intp(3, 0, f)
cpu_intr_3_347:
	setx	0x400007, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_199:
	mov	0xe, %r14
	.word 0xf6f384a0  ! 4259: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xfcad0020  ! 4260: STBA_R	stba	%r30, [%r20 + %r0] 0x01
cpu_intr_3_348:
	setx	0x42033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb48d0000  ! 4262: ANDcc_R	andcc 	%r20, %r0, %r26
iob_intr_3_332:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_332), 16, 16)) -> intp(3, 0, c)
	.word 0xf2740000  ! 4264: STX_R	stx	%r25, [%r16 + %r0]
	.word 0xf6ade112  ! 4268: STBA_I	stba	%r27, [%r23 + 0x0112] %asi
T3_asi_reg_wr_200:
	mov	0x34, %r14
	.word 0xf8f384a0  ! 4271: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983e8a  ! 4272: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e8a, %hpstate
	.word 0xf6b5a108  ! 4274: STHA_I	stha	%r27, [%r22 + 0x0108] %asi
	.word 0xf2b58020  ! 4275: STHA_R	stha	%r25, [%r22 + %r0] 0x01
cpu_intr_3_349:
	setx	0x40010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6a46033  ! 4279: STWA_I	stwa	%r27, [%r17 + 0x0033] %asi
	.word 0xf475e181  ! 4285: STX_I	stx	%r26, [%r23 + 0x0181]
T3_asi_reg_rd_206:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 4286: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xf835c000  ! 4290: STH_R	sth	%r28, [%r23 + %r0]
	.word 0xb2b520e7  ! 4295: SUBCcc_I	orncc 	%r20, 0x00e7, %r25
iob_intr_3_333:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_333), 16, 16)) -> intp(3, 0, 2a)
	.word 0xfe750000  ! 4298: STX_R	stx	%r31, [%r20 + %r0]
iob_intr_3_334:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_334), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_wr_201:
	mov	0x37, %r14
	.word 0xfcf38e40  ! 4301: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_3_350:
	setx	0x410323, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_335:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_335), 16, 16)) -> intp(3, 0, a)
	.word 0xf62ca0f2  ! 4305: STB_I	stb	%r27, [%r18 + 0x00f2]
cpu_intr_3_351:
	setx	0x410214, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_352:
	setx	0x430017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb33c5000  ! 4314: SRAX_R	srax	%r17, %r0, %r25
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982d98  ! 4317: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d98, %hpstate
	.word 0xf4f4619e  ! 4319: STXA_I	stxa	%r26, [%r17 + 0x019e] %asi
cpu_intr_3_353:
	setx	0x410312, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_336:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_336), 16, 16)) -> intp(3, 0, 13)
	.word 0xf6a50020  ! 4325: STWA_R	stwa	%r27, [%r20 + %r0] 0x01
cpu_intr_3_354:
	setx	0x400034, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_337:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_337), 16, 16)) -> intp(3, 0, 24)
	.word 0xf0a5c020  ! 4330: STWA_R	stwa	%r24, [%r23 + %r0] 0x01
cpu_intr_3_355:
	setx	0x42030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaace050  ! 4333: STBA_I	stba	%r29, [%r19 + 0x0050] %asi
	.word 0xbab54000  ! 4334: ORNcc_R	orncc 	%r21, %r0, %r29
	.word 0xf22ca1c0  ! 4335: STB_I	stb	%r25, [%r18 + 0x01c0]
cpu_intr_3_356:
	setx	0x400039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6f520da  ! 4337: STXA_I	stxa	%r27, [%r20 + 0x00da] %asi
cpu_intr_3_357:
	setx	0x400318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_358:
	setx	0x41022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5343001  ! 4340: SRLX_I	srlx	%r16, 0x0001, %r26
	.word 0xfa3460c6  ! 4341: STH_I	sth	%r29, [%r17 + 0x00c6]
iob_intr_3_338:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_338), 16, 16)) -> intp(3, 0, 3f)
cpu_intr_3_359:
	setx	0x410014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6b5a002  ! 4347: STHA_I	stha	%r27, [%r22 + 0x0002] %asi
iob_intr_3_339:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_339), 16, 16)) -> intp(3, 0, 3d)
T3_asi_reg_wr_202:
	mov	0xa, %r14
	.word 0xfcf38e40  ! 4350: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf6ada059  ! 4351: STBA_I	stba	%r27, [%r22 + 0x0059] %asi
	.word 0xb084c000  ! 4352: ADDcc_R	addcc 	%r19, %r0, %r24
	.word 0xb4b4e04b  ! 4354: ORNcc_I	orncc 	%r19, 0x004b, %r26
iob_intr_3_340:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_340), 16, 16)) -> intp(3, 0, d)
T3_asi_reg_rd_207:
	mov	0x3c3, %r14
	.word 0xf8db8e40  ! 4357: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf22ce052  ! 4360: STB_I	stb	%r25, [%r19 + 0x0052]
	ta	T_CHANGE_HPRIV
iob_intr_3_341:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_341), 16, 16)) -> intp(3, 0, 31)
iob_intr_3_342:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_342), 16, 16)) -> intp(3, 0, 2a)
iob_intr_3_343:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_343), 16, 16)) -> intp(3, 0, a)
cpu_intr_3_360:
	setx	0x40000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa25208d  ! 4371: STW_I	stw	%r29, [%r20 + 0x008d]
iob_intr_3_344:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_344), 16, 16)) -> intp(3, 0, 20)
	.word 0xfeb54020  ! 4374: STHA_R	stha	%r31, [%r21 + %r0] 0x01
	.word 0xfeb50020  ! 4375: STHA_R	stha	%r31, [%r20 + %r0] 0x01
iob_intr_3_345:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_345), 16, 16)) -> intp(3, 0, e)
T3_asi_reg_wr_203:
	mov	0x3c8, %r14
	.word 0xfef384a0  ! 4377: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
iob_intr_3_346:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_346), 16, 16)) -> intp(3, 0, 0)
	.word 0xfe34e097  ! 4385: STH_I	sth	%r31, [%r19 + 0x0097]
	.word 0xf0b58020  ! 4388: STHA_R	stha	%r24, [%r22 + %r0] 0x01
T3_asi_reg_wr_204:
	mov	0x2a, %r14
	.word 0xf0f38e60  ! 4390: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_3_347:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_347), 16, 16)) -> intp(3, 0, 1d)
cpu_intr_3_361:
	setx	0x400121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb634c000  ! 4393: SUBC_R	orn 	%r19, %r0, %r27
	.word 0xf0a4e164  ! 4395: STWA_I	stwa	%r24, [%r19 + 0x0164] %asi
	.word 0xfe35c000  ! 4400: STH_R	sth	%r31, [%r23 + %r0]
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983c90  ! 4401: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c90, %hpstate
iob_intr_3_348:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_348), 16, 16)) -> intp(3, 0, 16)
	.word 0xb550c000  ! 4405: RDPR_TT	rdpr	%tt, %r26
T3_asi_reg_rd_208:
	mov	0x5, %r14
	.word 0xfcdb8e60  ! 4406: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_3_362:
	setx	0x43030a, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983d50  ! 4410: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d50, %hpstate
T3_asi_reg_rd_209:
	mov	0x35, %r14
	.word 0xf0db8400  ! 4411: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
cpu_intr_3_363:
	setx	0x40000f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_364:
	setx	0x43012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0xf82c0000  ! 4417: STB_R	stb	%r28, [%r16 + %r0]
	.word 0xfab40020  ! 4419: STHA_R	stha	%r29, [%r16 + %r0] 0x01
T3_asi_reg_rd_210:
	mov	0x3c8, %r14
	.word 0xf4db84a0  ! 4420: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_3_349:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_349), 16, 16)) -> intp(3, 0, d)
	.word 0xf22ce068  ! 4427: STB_I	stb	%r25, [%r19 + 0x0068]
T3_asi_reg_rd_211:
	mov	0x3c5, %r14
	.word 0xf2db89e0  ! 4433: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T3_asi_reg_rd_212:
	mov	0x25, %r14
	.word 0xfadb8e80  ! 4434: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_3_365:
	setx	0x41022b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_366:
	setx	0x41013d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfaacc020  ! 4439: STBA_R	stba	%r29, [%r19 + %r0] 0x01
cpu_intr_3_367:
	setx	0x400126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb35c000  ! 4441: SRL_R	srl 	%r23, %r0, %r29
	ta	T_CHANGE_HPRIV
cpu_intr_3_368:
	setx	0x410302, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_213:
	mov	0x12, %r14
	.word 0xfcdb84a0  ! 4448: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_3_369:
	setx	0x430133, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_205:
	mov	0x38, %r14
	.word 0xf2f38e80  ! 4455: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T3_asi_reg_rd_214:
	mov	0x3c1, %r14
	.word 0xfedb8e60  ! 4456: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xfa350000  ! 4457: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xf235c000  ! 4459: STH_R	sth	%r25, [%r23 + %r0]
	.word 0xf42dc000  ! 4462: STB_R	stb	%r26, [%r23 + %r0]
	.word 0xbca54000  ! 4464: SUBcc_R	subcc 	%r21, %r0, %r30
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982f00  ! 4468: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f00, %hpstate
	.word 0xb5355000  ! 4469: SRLX_R	srlx	%r21, %r0, %r26
cpu_intr_3_370:
	setx	0x40012a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_350:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_350), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf22c0000  ! 4476: STB_R	stb	%r25, [%r16 + %r0]
T3_asi_reg_wr_206:
	mov	0x3c1, %r14
	.word 0xf0f38400  ! 4479: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
iob_intr_3_351:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_351), 16, 16)) -> intp(3, 0, 24)
cpu_intr_3_371:
	setx	0x400223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a4a04d  ! 4484: STWA_I	stwa	%r28, [%r18 + 0x004d] %asi
iob_intr_3_352:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_352), 16, 16)) -> intp(3, 0, 19)
cpu_intr_3_372:
	setx	0x420027, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_353:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_353), 16, 16)) -> intp(3, 0, 2f)
cpu_intr_3_373:
	setx	0x430019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc350000  ! 4500: STH_R	sth	%r30, [%r20 + %r0]
cpu_intr_3_374:
	setx	0x430317, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_375:
	setx	0x410207, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba350000  ! 4506: ORN_R	orn 	%r20, %r0, %r29
	ta	T_CHANGE_HPRIV
iob_intr_3_354:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_354), 16, 16)) -> intp(3, 0, 9)
	ta	T_CHANGE_NONHPRIV
T3_asi_reg_wr_207:
	mov	0x36, %r14
	.word 0xf0f389e0  ! 4516: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_3_376:
	setx	0x43020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_3_355:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_355), 16, 16)) -> intp(3, 0, 10)
	.word 0xf62c8000  ! 4522: STB_R	stb	%r27, [%r18 + %r0]
iob_intr_3_356:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_356), 16, 16)) -> intp(3, 0, 1f)
	.word 0xb69c8000  ! 4524: XORcc_R	xorcc 	%r18, %r0, %r27
iob_intr_3_357:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_357), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf42d61fa  ! 4526: STB_I	stb	%r26, [%r21 + 0x01fa]
	.word 0xfc750000  ! 4527: STX_R	stx	%r30, [%r20 + %r0]
	.word 0xb0b58000  ! 4533: SUBCcc_R	orncc 	%r22, %r0, %r24
	.word 0xf8b52025  ! 4535: STHA_I	stha	%r28, [%r20 + 0x0025] %asi
	.word 0xf624c000  ! 4538: STW_R	stw	%r27, [%r19 + %r0]
iob_intr_3_358:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_358), 16, 16)) -> intp(3, 0, 1e)
T3_asi_reg_rd_215:
	mov	0x22, %r14
	.word 0xfedb84a0  ! 4543: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_3_359:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_359), 16, 16)) -> intp(3, 0, 29)
	.word 0xf6740000  ! 4547: STX_R	stx	%r27, [%r16 + %r0]
iob_intr_3_360:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_360), 16, 16)) -> intp(3, 0, 2f)
T3_asi_reg_rd_216:
	mov	0x3c2, %r14
	.word 0xf6db8e80  ! 4550: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
T3_asi_reg_wr_208:
	mov	0x36, %r14
	.word 0xf8f38e40  ! 4553: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xb2a4c000  ! 4554: SUBcc_R	subcc 	%r19, %r0, %r25
	.word 0xf4344000  ! 4556: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xf4b40020  ! 4557: STHA_R	stha	%r26, [%r16 + %r0] 0x01
iob_intr_3_361:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_361), 16, 16)) -> intp(3, 0, 3b)
	.word 0xfcf5a188  ! 4559: STXA_I	stxa	%r30, [%r22 + 0x0188] %asi
	.word 0xf224c000  ! 4561: STW_R	stw	%r25, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe2521e5  ! 4570: STW_I	stw	%r31, [%r20 + 0x01e5]
iob_intr_3_362:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_362), 16, 16)) -> intp(3, 0, 21)
iob_intr_3_363:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_363), 16, 16)) -> intp(3, 0, 4)
iob_intr_3_364:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_364), 16, 16)) -> intp(3, 0, 2e)
	setx	data_start_5, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x819829d2  ! 4577: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d2, %hpstate
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982d9a  ! 4580: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9a, %hpstate
cpu_intr_3_377:
	setx	0x460113, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_365:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_365), 16, 16)) -> intp(3, 0, 1d)
	.word 0xfcb4210c  ! 4584: STHA_I	stha	%r30, [%r16 + 0x010c] %asi
	.word 0xf2a460bb  ! 4585: STWA_I	stwa	%r25, [%r17 + 0x00bb] %asi
	.word 0xf835a1fb  ! 4587: STH_I	sth	%r28, [%r22 + 0x01fb]
T3_asi_reg_wr_209:
	mov	0x1d, %r14
	.word 0xf8f38e40  ! 4590: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983b9a  ! 4591: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b9a, %hpstate
	.word 0xf42c0000  ! 4592: STB_R	stb	%r26, [%r16 + %r0]
cpu_intr_3_378:
	setx	0x450009, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_210:
	mov	0x13, %r14
	.word 0xf6f38400  ! 4595: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_3_366:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_366), 16, 16)) -> intp(3, 0, d)
	.word 0xbca5e1a6  ! 4599: SUBcc_I	subcc 	%r23, 0x01a6, %r30
cpu_intr_3_379:
	setx	0x450229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_380:
	setx	0x440336, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe156096  ! 4603: OR_I	or 	%r21, 0x0096, %r31
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982958  ! 4604: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0958, %hpstate
T3_asi_reg_rd_217:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 4607: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb034611a  ! 4609: ORN_I	orn 	%r17, 0x011a, %r24
	.word 0xfc35a069  ! 4611: STH_I	sth	%r30, [%r22 + 0x0069]
	.word 0xf8adc020  ! 4612: STBA_R	stba	%r28, [%r23 + %r0] 0x01
cpu_intr_3_381:
	setx	0x470310, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_367:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_367), 16, 16)) -> intp(3, 0, 26)
cpu_intr_3_382:
	setx	0x450131, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_211:
	mov	0x3c5, %r14
	.word 0xf8f38e60  ! 4621: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T3_asi_reg_wr_212:
	mov	0x2a, %r14
	.word 0xf6f38e60  ! 4626: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xfe2560ef  ! 4627: STW_I	stw	%r31, [%r21 + 0x00ef]
	.word 0xf2348000  ! 4628: STH_R	sth	%r25, [%r18 + %r0]
iob_intr_3_368:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_368), 16, 16)) -> intp(3, 0, 27)
T3_asi_reg_rd_218:
	mov	0x2d, %r14
	.word 0xf6db8400  ! 4631: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_3_369:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_369), 16, 16)) -> intp(3, 0, 31)
	.word 0xbebc8000  ! 4639: XNORcc_R	xnorcc 	%r18, %r0, %r31
T3_asi_reg_wr_213:
	mov	0x27, %r14
	.word 0xf0f38e60  ! 4643: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_3_370:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_370), 16, 16)) -> intp(3, 0, 24)
iob_intr_3_371:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_371), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf2744000  ! 4649: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xf0a5e109  ! 4652: STWA_I	stwa	%r24, [%r23 + 0x0109] %asi
	.word 0xf0f56048  ! 4653: STXA_I	stxa	%r24, [%r21 + 0x0048] %asi
	.word 0xf83521ba  ! 4654: STH_I	sth	%r28, [%r20 + 0x01ba]
T3_asi_reg_rd_219:
	mov	0x30, %r14
	.word 0xfedb8e40  ! 4655: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T3_asi_reg_rd_220:
	mov	0x15, %r14
	.word 0xfadb8e80  ! 4657: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_3_372:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_372), 16, 16)) -> intp(3, 0, 3c)
T3_asi_reg_rd_221:
	mov	0x35, %r14
	.word 0xf8db89e0  ! 4661: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xfaa5e002  ! 4662: STWA_I	stwa	%r29, [%r23 + 0x0002] %asi
cpu_intr_3_383:
	setx	0x440114, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_384:
	setx	0x460205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0750000  ! 4668: STX_R	stx	%r24, [%r20 + %r0]
iob_intr_3_373:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_373), 16, 16)) -> intp(3, 0, 3b)
	.word 0xfeb5e0de  ! 4676: STHA_I	stha	%r31, [%r23 + 0x00de] %asi
iob_intr_3_374:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_374), 16, 16)) -> intp(3, 0, 3e)
	.word 0xf625a1cb  ! 4678: STW_I	stw	%r27, [%r22 + 0x01cb]
	.word 0xfeb52151  ! 4679: STHA_I	stha	%r31, [%r20 + 0x0151] %asi
	.word 0xf8ad2047  ! 4680: STBA_I	stba	%r28, [%r20 + 0x0047] %asi
T3_asi_reg_wr_214:
	mov	0x28, %r14
	.word 0xfcf38e40  ! 4681: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf435c000  ! 4685: STH_R	sth	%r26, [%r23 + %r0]
T3_asi_reg_wr_215:
	mov	0x3c1, %r14
	.word 0xf0f38e40  ! 4687: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf42d6146  ! 4688: STB_I	stb	%r26, [%r21 + 0x0146]
T3_asi_reg_wr_216:
	mov	0x0, %r14
	.word 0xf8f38e80  ! 4689: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_3_385:
	setx	0x46001b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_375:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_375), 16, 16)) -> intp(3, 0, 1f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
iob_intr_3_376:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_376), 16, 16)) -> intp(3, 0, 3d)
iob_intr_3_377:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_377), 16, 16)) -> intp(3, 0, 37)
	.word 0xf2a4a119  ! 4705: STWA_I	stwa	%r25, [%r18 + 0x0119] %asi
	.word 0xbcacc000  ! 4709: ANDNcc_R	andncc 	%r19, %r0, %r30
	.word 0xf2250000  ! 4710: STW_R	stw	%r25, [%r20 + %r0]
	ta	T_CHANGE_TO_TL1
cpu_intr_3_386:
	setx	0x44033a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_387:
	setx	0x450000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfeade0e5  ! 4717: STBA_I	stba	%r31, [%r23 + 0x00e5] %asi
cpu_intr_3_388:
	setx	0x45003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_389:
	setx	0x47010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7359000  ! 4720: SRLX_R	srlx	%r22, %r0, %r27
T3_asi_reg_rd_222:
	mov	0x10, %r14
	.word 0xf6db84a0  ! 4721: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T3_asi_reg_wr_217:
	mov	0x12, %r14
	.word 0xf2f38e40  ! 4723: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T3_asi_reg_wr_218:
	mov	0x15, %r14
	.word 0xfcf389e0  ! 4729: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xfe342151  ! 4730: STH_I	sth	%r31, [%r16 + 0x0151]
	.word 0xb0a4e06e  ! 4738: SUBcc_I	subcc 	%r19, 0x006e, %r24
iob_intr_3_378:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_378), 16, 16)) -> intp(3, 0, 3d)
cpu_intr_3_390:
	setx	0x44022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982898  ! 4745: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0898, %hpstate
	ta	T_CHANGE_TO_TL0
cpu_intr_3_391:
	setx	0x470322, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_392:
	setx	0x470227, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_393:
	setx	0x46012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_3_379:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_379), 16, 16)) -> intp(3, 0, 3a)
	.word 0xfa352048  ! 4761: STH_I	sth	%r29, [%r20 + 0x0048]
cpu_intr_3_394:
	setx	0x47010e, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_wr_219:
	mov	0xf, %r14
	.word 0xf0f38e40  ! 4764: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfeb58020  ! 4767: STHA_R	stha	%r31, [%r22 + %r0] 0x01
	.word 0xfeac0020  ! 4770: STBA_R	stba	%r31, [%r16 + %r0] 0x01
iob_intr_3_380:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_380), 16, 16)) -> intp(3, 0, 3a)
	.word 0xb89da18c  ! 4773: XORcc_I	xorcc 	%r22, 0x018c, %r28
	.word 0xfcb58020  ! 4774: STHA_R	stha	%r30, [%r22 + %r0] 0x01
	.word 0xf8b4c020  ! 4776: STHA_R	stha	%r28, [%r19 + %r0] 0x01
	.word 0xf8ad61cf  ! 4778: STBA_I	stba	%r28, [%r21 + 0x01cf] %asi
cpu_intr_3_395:
	setx	0x470126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba1dc000  ! 4781: XOR_R	xor 	%r23, %r0, %r29
cpu_intr_3_396:
	setx	0x47022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb57dc400  ! 4784: MOVR_R	movre	%r23, %r0, %r26
	.word 0xf6b40020  ! 4786: STHA_R	stha	%r27, [%r16 + %r0] 0x01
	.word 0xfc35c000  ! 4791: STH_R	sth	%r30, [%r23 + %r0]
iob_intr_3_381:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_381), 16, 16)) -> intp(3, 0, 2e)
	.word 0xfcb5a1bd  ! 4797: STHA_I	stha	%r30, [%r22 + 0x01bd] %asi
cpu_intr_3_397:
	setx	0x450009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc34c000  ! 4802: STH_R	sth	%r30, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_6, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983e12  ! 4805: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e12, %hpstate
T3_asi_reg_wr_220:
	mov	0x9, %r14
	.word 0xf8f384a0  ! 4806: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_3_382:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_382), 16, 16)) -> intp(3, 0, 39)
iob_intr_3_383:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_383), 16, 16)) -> intp(3, 0, 13)
	ta	T_CHANGE_HPRIV
T3_asi_reg_rd_223:
	mov	0x1f, %r14
	.word 0xfedb89e0  ! 4812: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	ta	T_CHANGE_TO_TL1
	.word 0xb8b4c000  ! 4817: SUBCcc_R	orncc 	%r19, %r0, %r28
iob_intr_3_384:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_384), 16, 16)) -> intp(3, 0, 5)
iob_intr_3_385:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_385), 16, 16)) -> intp(3, 0, 1f)
cpu_intr_3_398:
	setx	0x450222, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc258000  ! 4826: STW_R	stw	%r30, [%r22 + %r0]
	.word 0xf624c000  ! 4827: STW_R	stw	%r27, [%r19 + %r0]
iob_intr_3_386:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_386), 16, 16)) -> intp(3, 0, 30)
	.word 0xb12ca001  ! 4832: SLL_I	sll 	%r18, 0x0001, %r24
	.word 0xf0ac8020  ! 4833: STBA_R	stba	%r24, [%r18 + %r0] 0x01
T3_asi_reg_wr_221:
	mov	0x2e, %r14
	.word 0xf2f38e80  ! 4834: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xa1902001  ! 4835: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xfead8020  ! 4836: STBA_R	stba	%r31, [%r22 + %r0] 0x01
iob_intr_3_387:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_387), 16, 16)) -> intp(3, 0, 3d)
	setx	data_start_3, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982fda  ! 4839: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fda, %hpstate
T3_asi_reg_wr_222:
	mov	0x1, %r14
	.word 0xf0f38e60  ! 4841: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_3_399:
	setx	0x47023b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_388:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_388), 16, 16)) -> intp(3, 0, a)
T3_asi_reg_rd_224:
	mov	0x28, %r14
	.word 0xf6db8e60  ! 4845: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xfea4e0a9  ! 4851: STWA_I	stwa	%r31, [%r19 + 0x00a9] %asi
cpu_intr_3_400:
	setx	0x440108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe248000  ! 4855: STW_R	stw	%r31, [%r18 + %r0]
iob_intr_3_389:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_389), 16, 16)) -> intp(3, 0, 28)
	.word 0xfaf560ff  ! 4857: STXA_I	stxa	%r29, [%r21 + 0x00ff] %asi
cpu_intr_3_401:
	setx	0x450238, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8a5a17b  ! 4860: STWA_I	stwa	%r28, [%r22 + 0x017b] %asi
	.word 0xfc2d20f2  ! 4861: STB_I	stb	%r30, [%r20 + 0x00f2]
cpu_intr_3_402:
	setx	0x460009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2a4c020  ! 4864: STWA_R	stwa	%r25, [%r19 + %r0] 0x01
	.word 0xbcb4609f  ! 4865: SUBCcc_I	orncc 	%r17, 0x009f, %r30
T3_asi_reg_wr_223:
	mov	0x3c6, %r14
	.word 0xf6f38e60  ! 4867: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf0f52177  ! 4870: STXA_I	stxa	%r24, [%r20 + 0x0177] %asi
	.word 0xf0ad21db  ! 4873: STBA_I	stba	%r24, [%r20 + 0x01db] %asi
	.word 0xf0b5c020  ! 4874: STHA_R	stha	%r24, [%r23 + %r0] 0x01
cpu_intr_3_403:
	setx	0x440034, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_390:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_390), 16, 16)) -> intp(3, 0, 39)
iob_intr_3_391:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_391), 16, 16)) -> intp(3, 0, 32)
	.word 0xf034617e  ! 4887: STH_I	sth	%r24, [%r17 + 0x017e]
iob_intr_3_392:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_392), 16, 16)) -> intp(3, 0, 2e)
cpu_intr_3_404:
	setx	0x46011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1643801  ! 4891: MOVcc_I	<illegal instruction>
	.word 0xf0a5613a  ! 4892: STWA_I	stwa	%r24, [%r21 + 0x013a] %asi
	.word 0xbc0521b9  ! 4893: ADD_I	add 	%r20, 0x01b9, %r30
cpu_intr_3_405:
	setx	0x47001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_406:
	setx	0x44010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T3_asi_reg_rd_225:
	mov	0x8, %r14
	.word 0xfadb89e0  ! 4900: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
cpu_intr_3_407:
	setx	0x440109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_393:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_393), 16, 16)) -> intp(3, 0, 35)
	.word 0xfcac0020  ! 4903: STBA_R	stba	%r30, [%r16 + %r0] 0x01
	.word 0xfea4e142  ! 4904: STWA_I	stwa	%r31, [%r19 + 0x0142] %asi
iob_intr_3_394:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_394), 16, 16)) -> intp(3, 0, 22)
	.word 0xf2b46175  ! 4908: STHA_I	stha	%r25, [%r17 + 0x0175] %asi
iob_intr_3_395:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_395), 16, 16)) -> intp(3, 0, 2d)
	.word 0xfa758000  ! 4910: STX_R	stx	%r29, [%r22 + %r0]
T3_asi_reg_rd_226:
	mov	0x11, %r14
	.word 0xfedb8e80  ! 4913: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xfa746090  ! 4915: STX_I	stx	%r29, [%r17 + 0x0090]
	.word 0xfca521f1  ! 4917: STWA_I	stwa	%r30, [%r20 + 0x01f1] %asi
	.word 0xf634c000  ! 4918: STH_R	sth	%r27, [%r19 + %r0]
cpu_intr_3_408:
	setx	0x47022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbebca1c3  ! 4921: XNORcc_I	xnorcc 	%r18, 0x01c3, %r31
cpu_intr_3_409:
	setx	0x460338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa2cc000  ! 4924: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xfeb5a1f1  ! 4925: STHA_I	stha	%r31, [%r22 + 0x01f1] %asi
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf2354000  ! 4930: STH_R	sth	%r25, [%r21 + %r0]
T3_asi_reg_rd_227:
	mov	0x5, %r14
	.word 0xfedb8e80  ! 4931: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	ta	T_CHANGE_TO_TL1
T3_asi_reg_rd_228:
	mov	0x15, %r14
	.word 0xf4db8400  ! 4939: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
cpu_intr_3_410:
	setx	0x460209, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_396:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_396), 16, 16)) -> intp(3, 0, d)
	.word 0xf87520ad  ! 4946: STX_I	stx	%r28, [%r20 + 0x00ad]
cpu_intr_3_411:
	setx	0x44001c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_3_412:
	setx	0x47000c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_3_397:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_397), 16, 16)) -> intp(3, 0, 13)
iob_intr_3_398:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_398), 16, 16)) -> intp(3, 0, 7)
	.word 0xf4ac4020  ! 4963: STBA_R	stba	%r26, [%r17 + %r0] 0x01
	.word 0xf2ac8020  ! 4964: STBA_R	stba	%r25, [%r18 + %r0] 0x01
iob_intr_3_399:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_399), 16, 16)) -> intp(3, 0, 1e)
	setx	data_start_0, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983cd2  ! 4966: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd2, %hpstate
cpu_intr_3_413:
	setx	0x460337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf224c000  ! 4973: STW_R	stw	%r25, [%r19 + %r0]
iob_intr_3_400:
!$EV trig_pc_d(3,expr(@VA(.MAIN.iob_intr_3_400), 16, 16)) -> intp(3, 0, a)
	.word 0xfeada1d6  ! 4976: STBA_I	stba	%r31, [%r22 + 0x01d6] %asi
cpu_intr_3_414:
	setx	0x440312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0a4a07f  ! 4978: STWA_I	stwa	%r24, [%r18 + 0x007f] %asi
	.word 0xbe258000  ! 4980: SUB_R	sub 	%r22, %r0, %r31
	.word 0xbcb50000  ! 4985: ORNcc_R	orncc 	%r20, %r0, %r30
T3_asi_reg_rd_229:
	mov	0x31, %r14
	.word 0xfcdb89e0  ! 4987: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfc354000  ! 4988: STH_R	sth	%r30, [%r21 + %r0]
cpu_intr_3_415:
	setx	0x46022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb20d4000  ! 4996: AND_R	and 	%r21, %r0, %r25
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
	setx	0x1b032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2c5a02c  ! 3: ADDCcc_I	addccc 	%r22, 0x002c, %r25
	.word 0xfecd2018  ! 5: LDSBA_I	ldsba	[%r20, + 0x0018] %asi, %r31
	.word 0xf25c8000  ! 6: LDX_R	ldx	[%r18 + %r0], %r25
	.word 0xf2cc0020  ! 8: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r25
cpu_intr_2_1:
	setx	0x1c0317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8c4020  ! 13: LDUBA_R	lduba	[%r17, %r0] 0x01, %r31
	.word 0xfadca1b6  ! 15: LDXA_I	ldxa	[%r18, + 0x01b6] %asi, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_2:
	setx	0x1d0204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4c44000  ! 25: ADDCcc_R	addccc 	%r17, %r0, %r26
cpu_intr_2_3:
	setx	0x10101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80421e3  ! 29: LDUW_I	lduw	[%r16 + 0x01e3], %r28
	.word 0xf6cd8020  ! 32: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r27
	.word 0xb4c5c000  ! 34: ADDCcc_R	addccc 	%r23, %r0, %r26
	.word 0xbc84e17f  ! 35: ADDcc_I	addcc 	%r19, 0x017f, %r30
	ta	T_CHANGE_HPRIV
T2_asi_reg_wr_0:
	mov	0x3c4, %r14
	.word 0xf2f389e0  ! 41: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xfccc2084  ! 42: LDSBA_I	ldsba	[%r16, + 0x0084] %asi, %r30
	.word 0xf4546196  ! 43: LDSH_I	ldsh	[%r17 + 0x0196], %r26
	.word 0xba34a0c0  ! 44: SUBC_I	orn 	%r18, 0x00c0, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfc5de001  ! 48: LDX_I	ldx	[%r23 + 0x0001], %r30
T2_asi_reg_rd_0:
	mov	0x3c7, %r14
	.word 0xf6db8400  ! 49: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xf0554000  ! 50: LDSH_R	ldsh	[%r21 + %r0], %r24
	.word 0xf64dc000  ! 52: LDSB_R	ldsb	[%r23 + %r0], %r27
iob_intr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_0), 16, 16)) -> intp(2, 0, 6)
cpu_intr_2_4:
	setx	0x1d003b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4540000  ! 56: LDSH_R	ldsh	[%r16 + %r0], %r26
cpu_intr_2_5:
	setx	0x1d0304, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_6:
	setx	0x1e0003, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_1:
	mov	0x3, %r14
	.word 0xfcdb8e40  ! 61: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf6dce0e7  ! 62: LDXA_I	ldxa	[%r19, + 0x00e7] %asi, %r27
	.word 0xf6048000  ! 63: LDUW_R	lduw	[%r18 + %r0], %r27
	.word 0xf6d58020  ! 64: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r27
	.word 0xf44420f6  ! 65: LDSW_I	ldsw	[%r16 + 0x00f6], %r26
	.word 0xf68cc020  ! 66: LDUBA_R	lduba	[%r19, %r0] 0x01, %r27
	.word 0xfc5d6132  ! 67: LDX_I	ldx	[%r21 + 0x0132], %r30
	.word 0xf4140000  ! 71: LDUH_R	lduh	[%r16 + %r0], %r26
	.word 0xfedd21d3  ! 75: LDXA_I	ldxa	[%r20, + 0x01d3] %asi, %r31
T2_asi_reg_wr_1:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 78: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf615a11f  ! 81: LDUH_I	lduh	[%r22 + 0x011f], %r27
	.word 0xfa8c21d2  ! 82: LDUBA_I	lduba	[%r16, + 0x01d2] %asi, %r29
T2_asi_reg_rd_2:
	mov	0x23, %r14
	.word 0xfedb8e60  ! 86: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xf284e020  ! 88: LDUWA_I	lduwa	[%r19, + 0x0020] %asi, %r25
	.word 0xf0cd4020  ! 89: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf005e198  ! 92: LDUW_I	lduw	[%r23 + 0x0198], %r24
	.word 0xf0d48020  ! 95: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r24
T2_asi_reg_wr_2:
	mov	0x2f, %r14
	.word 0xfcf389e0  ! 99: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_7:
	setx	0x1c0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3641800  ! 105: MOVcc_R	<illegal instruction>
T2_asi_reg_wr_3:
	mov	0x0, %r14
	.word 0xfcf38400  ! 106: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
iob_intr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_1), 16, 16)) -> intp(2, 0, 0)
	.word 0xbe142012  ! 109: OR_I	or 	%r16, 0x0012, %r31
T2_asi_reg_wr_4:
	mov	0x17, %r14
	.word 0xf8f38400  ! 110: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
iob_intr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_2), 16, 16)) -> intp(2, 0, d)
	.word 0xf415c000  ! 114: LDUH_R	lduh	[%r23 + %r0], %r26
	.word 0xba0c0000  ! 116: AND_R	and 	%r16, %r0, %r29
cpu_intr_2_8:
	setx	0x1e0003, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_9:
	setx	0x1f033c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_3), 16, 16)) -> intp(2, 0, 34)
	.word 0xf8d48020  ! 123: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r28
	.word 0xfa440000  ! 124: LDSW_R	ldsw	[%r16 + %r0], %r29
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983dd8  ! 128: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd8, %hpstate
cpu_intr_2_10:
	setx	0x1e0114, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_4), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_11:
	setx	0x1f0131, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_5), 16, 16)) -> intp(2, 0, 25)
	.word 0xf08c8020  ! 137: LDUBA_R	lduba	[%r18, %r0] 0x01, %r24
cpu_intr_2_12:
	setx	0x1d002c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_13:
	setx	0x1e0201, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_6), 16, 16)) -> intp(2, 0, c)
	ta	T_CHANGE_TO_TL1
	ta	T_CHANGE_HPRIV
	.word 0xfacd2181  ! 152: LDSBA_I	ldsba	[%r20, + 0x0181] %asi, %r29
	ta	T_CHANGE_HPRIV
iob_intr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_7), 16, 16)) -> intp(2, 0, 30)
	.word 0xfecd6077  ! 155: LDSBA_I	ldsba	[%r21, + 0x0077] %asi, %r31
iob_intr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_8), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_wr_5:
	mov	0x34, %r14
	.word 0xf0f38e40  ! 159: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf2540000  ! 160: LDSH_R	ldsh	[%r16 + %r0], %r25
iob_intr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_9), 16, 16)) -> intp(2, 0, 9)
iob_intr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_10), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_rd_3:
	mov	0x3c2, %r14
	.word 0xf6db8400  ! 167: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_2_14:
	setx	0x1f0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xa1902002  ! 169: WRPR_GL_I	wrpr	%r0, 0x0002, %-
cpu_intr_2_15:
	setx	0x1e0328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_16:
	setx	0x1d0039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_11), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_17:
	setx	0x1d0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81982c08  ! 182: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c08, %hpstate
	.word 0xb4b50000  ! 184: SUBCcc_R	orncc 	%r20, %r0, %r26
iob_intr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_12), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_rd_4:
	mov	0x1f, %r14
	.word 0xf2db8400  ! 192: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2d40020  ! 199: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r25
cpu_intr_2_18:
	setx	0x1f002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_13), 16, 16)) -> intp(2, 0, 9)
iob_intr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_14), 16, 16)) -> intp(2, 0, 6)
T2_asi_reg_wr_6:
	mov	0x2b, %r14
	.word 0xf6f389e0  ! 207: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf0058000  ! 209: LDUW_R	lduw	[%r22 + %r0], %r24
	.word 0xfec40020  ! 211: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r31
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xfec40020  ! 215: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r31
iob_intr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_15), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_wr_7:
	mov	0x36, %r14
	.word 0xfaf384a0  ! 220: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_2_19:
	setx	0x1e030c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_5:
	mov	0xb, %r14
	.word 0xfadb8e40  ! 224: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_wr_8:
	mov	0x3c5, %r14
	.word 0xf4f38e80  ! 227: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xfed521a5  ! 228: LDSHA_I	ldsha	[%r20, + 0x01a5] %asi, %r31
cpu_intr_2_20:
	setx	0x1d0014, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_6:
	mov	0x3c3, %r14
	.word 0xfcdb89e0  ! 232: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xfa4d6021  ! 233: LDSB_I	ldsb	[%r21 + 0x0021], %r29
	.word 0xf84c8000  ! 238: LDSB_R	ldsb	[%r18 + %r0], %r28
T2_asi_reg_wr_9:
	mov	0x1b, %r14
	.word 0xfaf38e40  ! 239: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf6444000  ! 240: LDSW_R	ldsw	[%r17 + %r0], %r27
	setx	data_start_5, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81982bda  ! 243: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bda, %hpstate
	.word 0xb73d4000  ! 244: SRA_R	sra 	%r21, %r0, %r27
cpu_intr_2_21:
	setx	0x1d0315, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_16), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_wr_10:
	mov	0x3c8, %r14
	.word 0xfaf38e40  ! 252: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_17), 16, 16)) -> intp(2, 0, 2e)
cpu_intr_2_22:
	setx	0x1c0121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40d4000  ! 257: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xbc25c000  ! 259: SUB_R	sub 	%r23, %r0, %r30
	.word 0xb7480000  ! 260: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
T2_asi_reg_rd_7:
	mov	0x3c0, %r14
	.word 0xf6db8e60  ! 261: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xfc946150  ! 265: LDUHA_I	lduha	[%r17, + 0x0150] %asi, %r30
	.word 0xf6dca065  ! 266: LDXA_I	ldxa	[%r18, + 0x0065] %asi, %r27
cpu_intr_2_23:
	setx	0x1f0039, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_11:
	mov	0x3c3, %r14
	.word 0xf0f38400  ! 268: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xfa4c0000  ! 270: LDSB_R	ldsb	[%r16 + %r0], %r29
	.word 0xf4d56094  ! 272: LDSHA_I	ldsha	[%r21, + 0x0094] %asi, %r26
cpu_intr_2_24:
	setx	0x1e030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982c10  ! 276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c10, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb22c8000  ! 280: ANDN_R	andn 	%r18, %r0, %r25
T2_asi_reg_wr_12:
	mov	0x30, %r14
	.word 0xf2f38400  ! 281: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xb29c4000  ! 283: XORcc_R	xorcc 	%r17, %r0, %r25
cpu_intr_2_25:
	setx	0x1c0117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0456043  ! 287: LDSW_I	ldsw	[%r21 + 0x0043], %r24
cpu_intr_2_26:
	setx	0x1c0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0950020  ! 289: LDUHA_R	lduha	[%r20, %r0] 0x01, %r24
iob_intr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_18), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_wr_13:
	mov	0x24, %r14
	.word 0xf8f38e80  ! 293: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf2c561a6  ! 294: LDSWA_I	ldswa	[%r21, + 0x01a6] %asi, %r25
T2_asi_reg_wr_14:
	mov	0x27, %r14
	.word 0xf6f389e0  ! 295: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
iob_intr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_19), 16, 16)) -> intp(2, 0, 21)
iob_intr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_20), 16, 16)) -> intp(2, 0, 3d)
T2_asi_reg_rd_8:
	mov	0x3c6, %r14
	.word 0xfedb8e60  ! 299: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_21), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_rd_9:
	mov	0x36, %r14
	.word 0xf2db8e40  ! 302: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_27:
	setx	0x1e0218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1dc000  ! 304: XOR_R	xor 	%r23, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_10:
	mov	0x3c8, %r14
	.word 0xf2db89e0  ! 307: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe052140  ! 309: LDUW_I	lduw	[%r20 + 0x0140], %r31
	.word 0xf814e187  ! 315: LDUH_I	lduh	[%r19 + 0x0187], %r28
cpu_intr_2_28:
	setx	0x1f0139, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_11:
	mov	0x17, %r14
	.word 0xf2db8e60  ! 318: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_22), 16, 16)) -> intp(2, 0, 3b)
	.word 0xfcc40020  ! 320: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r30
T2_asi_reg_wr_15:
	mov	0x3c4, %r14
	.word 0xf6f384a0  ! 323: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf44d60b5  ! 325: LDSB_I	ldsb	[%r21 + 0x00b5], %r26
	.word 0xb28520dd  ! 327: ADDcc_I	addcc 	%r20, 0x00dd, %r25
iob_intr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_23), 16, 16)) -> intp(2, 0, 1d)
	.word 0xfcc58020  ! 331: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r30
T2_asi_reg_rd_12:
	mov	0x3c0, %r14
	.word 0xf6db8e60  ! 332: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_24), 16, 16)) -> intp(2, 0, 35)
	.word 0xfa55e1ca  ! 337: LDSH_I	ldsh	[%r23 + 0x01ca], %r29
iob_intr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_25), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_rd_13:
	mov	0x1, %r14
	.word 0xf0db84a0  ! 342: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T2_asi_reg_wr_16:
	mov	0x3c8, %r14
	.word 0xf2f389e0  ! 346: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
T2_asi_reg_rd_14:
	mov	0x1, %r14
	.word 0xf4db8400  ! 347: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xf085e139  ! 348: LDUWA_I	lduwa	[%r23, + 0x0139] %asi, %r24
T2_asi_reg_rd_15:
	mov	0x3c1, %r14
	.word 0xfadb89e0  ! 351: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xfec44020  ! 352: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r31
	.word 0xf80c4000  ! 353: LDUB_R	ldub	[%r17 + %r0], %r28
	.word 0xba05604c  ! 355: ADD_I	add 	%r21, 0x004c, %r29
T2_asi_reg_rd_16:
	mov	0x2e, %r14
	.word 0xfcdb8e40  ! 357: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983bd0  ! 358: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd0, %hpstate
T2_asi_reg_wr_17:
	mov	0x3c2, %r14
	.word 0xf6f384a0  ! 360: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T2_asi_reg_wr_18:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 362: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf60521cc  ! 363: LDUW_I	lduw	[%r20 + 0x01cc], %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_19:
	mov	0x24, %r14
	.word 0xf8f38e60  ! 367: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xfc0d2186  ! 370: LDUB_I	ldub	[%r20 + 0x0186], %r30
T2_asi_reg_wr_20:
	mov	0x3c0, %r14
	.word 0xf4f38400  ! 371: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf2448000  ! 377: LDSW_R	ldsw	[%r18 + %r0], %r25
	.word 0xfadd21da  ! 379: LDXA_I	ldxa	[%r20, + 0x01da] %asi, %r29
T2_asi_reg_wr_21:
	mov	0x7, %r14
	.word 0xf2f38e80  ! 380: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_26), 16, 16)) -> intp(2, 0, 21)
	.word 0xbeb54000  ! 382: SUBCcc_R	orncc 	%r21, %r0, %r31
	.word 0xf2d44020  ! 383: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r25
iob_intr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_27), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf44c0000  ! 387: LDSB_R	ldsb	[%r16 + %r0], %r26
cpu_intr_2_29:
	setx	0x1d0217, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_28), 16, 16)) -> intp(2, 0, b)
iob_intr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_29), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_30), 16, 16)) -> intp(2, 0, 13)
iob_intr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_31), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf2c56192  ! 402: LDSWA_I	ldswa	[%r21, + 0x0192] %asi, %r25
T2_asi_reg_wr_22:
	mov	0x3c7, %r14
	.word 0xf6f38e40  ! 403: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_rd_17:
	mov	0x12, %r14
	.word 0xf4db8e40  ! 404: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
iob_intr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_32), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf295a140  ! 406: LDUHA_I	lduha	[%r22, + 0x0140] %asi, %r25
	.word 0xf6056029  ! 408: LDUW_I	lduw	[%r21 + 0x0029], %r27
	.word 0xfa054000  ! 409: LDUW_R	lduw	[%r21 + %r0], %r29
iob_intr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_33), 16, 16)) -> intp(2, 0, 1f)
	.word 0xf25cc000  ! 415: LDX_R	ldx	[%r19 + %r0], %r25
cpu_intr_2_30:
	setx	0x1e0216, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfc8dc020  ! 421: LDUBA_R	lduba	[%r23, %r0] 0x01, %r30
iob_intr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_34), 16, 16)) -> intp(2, 0, 12)
iob_intr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_35), 16, 16)) -> intp(2, 0, 4)
cpu_intr_2_31:
	setx	0x1c003e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_18:
	mov	0x7, %r14
	.word 0xfcdb8e40  ! 436: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_32:
	setx	0x1c0127, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_33:
	setx	0x1f000c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_36), 16, 16)) -> intp(2, 0, 25)
iob_intr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_37), 16, 16)) -> intp(2, 0, 2)
	.word 0xf404a107  ! 442: LDUW_I	lduw	[%r18 + 0x0107], %r26
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x8198380a  ! 443: WRHPR_HPSTATE_I	wrhpr	%r0, 0x180a, %hpstate
iob_intr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_38), 16, 16)) -> intp(2, 0, 27)
iob_intr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_39), 16, 16)) -> intp(2, 0, 6)
iob_intr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_40), 16, 16)) -> intp(2, 0, 16)
	.word 0xf0844020  ! 453: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r24
cpu_intr_2_34:
	setx	0x1f023b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_41), 16, 16)) -> intp(2, 0, 37)
	.word 0xf284616e  ! 461: LDUWA_I	lduwa	[%r17, + 0x016e] %asi, %r25
	.word 0xb5520000  ! 462: RDPR_PIL	<illegal instruction>
iob_intr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_42), 16, 16)) -> intp(2, 0, 9)
T2_asi_reg_rd_19:
	mov	0x33, %r14
	.word 0xfedb8e40  ! 464: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb885c000  ! 465: ADDcc_R	addcc 	%r23, %r0, %r28
	.word 0xb52ca001  ! 466: SLL_I	sll 	%r18, 0x0001, %r26
cpu_intr_2_35:
	setx	0x21023b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_36:
	setx	0x230131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf215218d  ! 472: LDUH_I	lduh	[%r20 + 0x018d], %r25
	.word 0xf2d5e1af  ! 474: LDSHA_I	ldsha	[%r23, + 0x01af] %asi, %r25
T2_asi_reg_wr_23:
	mov	0x1b, %r14
	.word 0xfef38400  ! 476: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xf85c213d  ! 481: LDX_I	ldx	[%r16 + 0x013d], %r28
	.word 0xb5641800  ! 483: MOVcc_R	<illegal instruction>
	.word 0xfec58020  ! 484: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r31
cpu_intr_2_37:
	setx	0x200121, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa14205b  ! 488: LDUH_I	lduh	[%r16 + 0x005b], %r29
cpu_intr_2_38:
	setx	0x230106, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_43), 16, 16)) -> intp(2, 0, 38)
iob_intr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_44), 16, 16)) -> intp(2, 0, 37)
iob_intr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_45), 16, 16)) -> intp(2, 0, 11)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_39:
	setx	0x230333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2344000  ! 498: SUBC_R	orn 	%r17, %r0, %r25
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982ed2  ! 501: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed2, %hpstate
T2_asi_reg_wr_24:
	mov	0x2b, %r14
	.word 0xfcf38e40  ! 502: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_46), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf2148000  ! 512: LDUH_R	lduh	[%r18 + %r0], %r25
	.word 0xb89c20e3  ! 513: XORcc_I	xorcc 	%r16, 0x00e3, %r28
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x859521f6  ! 516: WRPR_TSTATE_I	wrpr	%r20, 0x01f6, %tstate
T2_asi_reg_rd_20:
	mov	0x1f, %r14
	.word 0xf2db89e0  ! 520: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T2_asi_reg_wr_25:
	mov	0x1e, %r14
	.word 0xf8f38e40  ! 521: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_wr_26:
	mov	0x3c3, %r14
	.word 0xf8f38e80  ! 523: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
cpu_intr_2_40:
	setx	0x200030, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x8198295a  ! 525: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095a, %hpstate
cpu_intr_2_41:
	setx	0x210225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf045c000  ! 527: LDSW_R	ldsw	[%r23 + %r0], %r24
	ta	T_CHANGE_TO_TL1
cpu_intr_2_42:
	setx	0x22012f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_27:
	mov	0x1e, %r14
	.word 0xf6f38e40  ! 530: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	setx	data_start_5, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982bc8  ! 532: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc8, %hpstate
	.word 0xb61d8000  ! 534: XOR_R	xor 	%r22, %r0, %r27
iob_intr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_47), 16, 16)) -> intp(2, 0, 35)
iob_intr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_48), 16, 16)) -> intp(2, 0, 28)
	.word 0xb551c000  ! 542: RDPR_TL	<illegal instruction>
T2_asi_reg_rd_21:
	mov	0x38, %r14
	.word 0xf8db8e40  ! 545: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_49), 16, 16)) -> intp(2, 0, 1a)
	ta	T_CHANGE_TO_TL1
cpu_intr_2_43:
	setx	0x220328, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_44:
	setx	0x23011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0940020  ! 552: LDUHA_R	lduha	[%r16, %r0] 0x01, %r24
cpu_intr_2_45:
	setx	0x220001, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_46:
	setx	0x230315, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_47:
	setx	0x200319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_48:
	setx	0x23001b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_50), 16, 16)) -> intp(2, 0, 25)
	setx	data_start_1, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982b1a  ! 565: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1a, %hpstate
iob_intr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_51), 16, 16)) -> intp(2, 0, 3c)
cpu_intr_2_49:
	setx	0x21020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf095c020  ! 572: LDUHA_R	lduha	[%r23, %r0] 0x01, %r24
	ta	T_CHANGE_TO_TL1
iob_intr_2_52:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_52), 16, 16)) -> intp(2, 0, a)
iob_intr_2_53:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_53), 16, 16)) -> intp(2, 0, 31)
	.word 0xfc054000  ! 584: LDUW_R	lduw	[%r21 + %r0], %r30
T2_asi_reg_wr_28:
	mov	0x23, %r14
	.word 0xfcf38400  ! 586: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xbe048000  ! 590: ADD_R	add 	%r18, %r0, %r31
	.word 0xf28d6065  ! 592: LDUBA_I	lduba	[%r21, + 0x0065] %asi, %r25
	.word 0xf8440000  ! 594: LDSW_R	ldsw	[%r16 + %r0], %r28
	.word 0xfccca1b0  ! 595: LDSBA_I	ldsba	[%r18, + 0x01b0] %asi, %r30
T2_asi_reg_wr_29:
	mov	0x3c8, %r14
	.word 0xf0f389e0  ! 598: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_2_54:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_54), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_50:
	setx	0x200033, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_55:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_55), 16, 16)) -> intp(2, 0, 0)
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982bc0  ! 604: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc0, %hpstate
T2_asi_reg_wr_30:
	mov	0x27, %r14
	.word 0xfcf38e40  ! 605: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfe0d0000  ! 607: LDUB_R	ldub	[%r20 + %r0], %r31
iob_intr_2_56:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_56), 16, 16)) -> intp(2, 0, 2)
cpu_intr_2_51:
	setx	0x23012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_31:
	mov	0x3c2, %r14
	.word 0xf6f38e60  ! 612: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
T2_asi_reg_wr_32:
	mov	0x6, %r14
	.word 0xf4f38e40  ! 613: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
T2_asi_reg_wr_33:
	mov	0x2a, %r14
	.word 0xfaf38e80  ! 615: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xf4854020  ! 622: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r26
	.word 0xb73d2001  ! 623: SRA_I	sra 	%r20, 0x0001, %r27
T2_asi_reg_rd_22:
	mov	0x17, %r14
	.word 0xfadb8e60  ! 626: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T2_asi_reg_wr_34:
	mov	0x2d, %r14
	.word 0xfcf38e40  ! 629: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf2dde037  ! 630: LDXA_I	ldxa	[%r23, + 0x0037] %asi, %r25
	.word 0xfa8d4020  ! 631: LDUBA_R	lduba	[%r21, %r0] 0x01, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_52:
	setx	0x220208, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_23:
	mov	0x3c4, %r14
	.word 0xf6db89e0  ! 639: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_2_53:
	setx	0x220124, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_54:
	setx	0x22003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfecd613b  ! 650: LDSBA_I	ldsba	[%r21, + 0x013b] %asi, %r31
iob_intr_2_57:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_57), 16, 16)) -> intp(2, 0, 1f)
iob_intr_2_58:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_58), 16, 16)) -> intp(2, 0, 3f)
T2_asi_reg_rd_24:
	mov	0x29, %r14
	.word 0xf0db8400  ! 662: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf28d204f  ! 665: LDUBA_I	lduba	[%r20, + 0x004f] %asi, %r25
	.word 0xfccd605a  ! 668: LDSBA_I	ldsba	[%r21, + 0x005a] %asi, %r30
	.word 0xfc0cc000  ! 670: LDUB_R	ldub	[%r19 + %r0], %r30
	.word 0xfe14c000  ! 671: LDUH_R	lduh	[%r19 + %r0], %r31
cpu_intr_2_55:
	setx	0x230117, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xfc542021  ! 675: LDSH_I	ldsh	[%r16 + 0x0021], %r30
T2_asi_reg_rd_25:
	mov	0x3, %r14
	.word 0xfedb8400  ! 680: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_2_59:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_59), 16, 16)) -> intp(2, 0, 21)
	.word 0xbb355000  ! 685: SRLX_R	srlx	%r21, %r0, %r29
T2_asi_reg_wr_35:
	mov	0x3c4, %r14
	.word 0xf8f38e40  ! 689: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T2_asi_reg_wr_36:
	mov	0x2e, %r14
	.word 0xf6f38400  ! 690: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf4144000  ! 691: LDUH_R	lduh	[%r17 + %r0], %r26
	.word 0xf2d4e1e9  ! 692: LDSHA_I	ldsha	[%r19, + 0x01e9] %asi, %r25
	.word 0xba3d2120  ! 697: XNOR_I	xnor 	%r20, 0x0120, %r29
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982cc2  ! 698: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc2, %hpstate
T2_asi_reg_rd_26:
	mov	0x19, %r14
	.word 0xf6db8e60  ! 703: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
iob_intr_2_60:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_60), 16, 16)) -> intp(2, 0, 35)
	.word 0xbabc0000  ! 706: XNORcc_R	xnorcc 	%r16, %r0, %r29
	ta	T_CHANGE_NONHPRIV
	.word 0xfc5cc000  ! 709: LDX_R	ldx	[%r19 + %r0], %r30
iob_intr_2_61:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_61), 16, 16)) -> intp(2, 0, 12)
	.word 0xf094a1d0  ! 712: LDUHA_I	lduha	[%r18, + 0x01d0] %asi, %r24
	.word 0xf04ce128  ! 713: LDSB_I	ldsb	[%r19 + 0x0128], %r24
	.word 0xb12c2001  ! 714: SLL_I	sll 	%r16, 0x0001, %r24
iob_intr_2_62:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_62), 16, 16)) -> intp(2, 0, 1b)
T2_asi_reg_rd_27:
	mov	0x9, %r14
	.word 0xfadb89e0  ! 717: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T2_asi_reg_rd_28:
	mov	0xd, %r14
	.word 0xf6db8e80  ! 718: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
iob_intr_2_63:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_63), 16, 16)) -> intp(2, 0, f)
T2_asi_reg_rd_29:
	mov	0x3c0, %r14
	.word 0xfadb84a0  ! 722: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_2_56:
	setx	0x200133, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_57:
	setx	0x220101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb734d000  ! 728: SRLX_R	srlx	%r19, %r0, %r27
	.word 0xf215c000  ! 732: LDUH_R	lduh	[%r23 + %r0], %r25
cpu_intr_2_58:
	setx	0x22012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfac54020  ! 738: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r29
	.word 0xf88dc020  ! 740: LDUBA_R	lduba	[%r23, %r0] 0x01, %r28
iob_intr_2_64:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_64), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_rd_30:
	mov	0x23, %r14
	.word 0xf8db8e80  ! 745: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983848  ! 746: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1848, %hpstate
	.word 0xbe34c000  ! 747: ORN_R	orn 	%r19, %r0, %r31
cpu_intr_2_59:
	setx	0x230021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_65:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_65), 16, 16)) -> intp(2, 0, 0)
	.word 0xbc2d0000  ! 754: ANDN_R	andn 	%r20, %r0, %r30
T2_asi_reg_rd_31:
	mov	0x11, %r14
	.word 0xf6db84a0  ! 757: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T2_asi_reg_rd_32:
	mov	0x34, %r14
	.word 0xf2db8e80  ! 758: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_2_66:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_66), 16, 16)) -> intp(2, 0, 36)
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_33:
	mov	0x31, %r14
	.word 0xf8db8e60  ! 762: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf084c020  ! 763: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r24
cpu_intr_2_60:
	setx	0x200326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2844020  ! 765: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r25
cpu_intr_2_61:
	setx	0x220005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ccc020  ! 767: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r28
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_37:
	mov	0xf, %r14
	.word 0xf8f38e40  ! 771: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_67:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_67), 16, 16)) -> intp(2, 0, 34)
cpu_intr_2_62:
	setx	0x230336, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_68:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_68), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_rd_34:
	mov	0x13, %r14
	.word 0xfcdb89e0  ! 780: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf4cd0020  ! 781: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r26
	.word 0xf20d213a  ! 782: LDUB_I	ldub	[%r20 + 0x013a], %r25
iob_intr_2_69:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_69), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_63:
	setx	0x210226, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_70:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_70), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_64:
	setx	0x220030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6c58020  ! 792: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r27
	.word 0xfcd40020  ! 793: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r30
	.word 0xf48da0cd  ! 797: LDUBA_I	lduba	[%r22, + 0x00cd] %asi, %r26
	.word 0xf445c000  ! 799: LDSW_R	ldsw	[%r23 + %r0], %r26
	.word 0xfed58020  ! 800: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r31
cpu_intr_2_65:
	setx	0x230037, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_38:
	mov	0x18, %r14
	.word 0xf0f38e40  ! 803: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_71:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_71), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_66:
	setx	0x220127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8d54020  ! 809: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r28
	.word 0xf2d48020  ! 810: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r25
	.word 0xfcdce0ea  ! 813: LDXA_I	ldxa	[%r19, + 0x00ea] %asi, %r30
T2_asi_reg_rd_35:
	mov	0x3c7, %r14
	.word 0xfedb8e80  ! 814: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
T2_asi_reg_wr_39:
	mov	0x3c5, %r14
	.word 0xf8f38e80  ! 815: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	.word 0xf88c8020  ! 816: LDUBA_R	lduba	[%r18, %r0] 0x01, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf88d4020  ! 819: LDUBA_R	lduba	[%r21, %r0] 0x01, %r28
	.word 0xfc856037  ! 821: LDUWA_I	lduwa	[%r21, + 0x0037] %asi, %r30
T2_asi_reg_rd_36:
	mov	0x3c6, %r14
	.word 0xfedb84a0  ! 822: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_2_72:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_72), 16, 16)) -> intp(2, 0, a)
	.word 0xb8b40000  ! 826: ORNcc_R	orncc 	%r16, %r0, %r28
	.word 0xf2144000  ! 828: LDUH_R	lduh	[%r17 + %r0], %r25
cpu_intr_2_67:
	setx	0x23022c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0dc615e  ! 832: LDXA_I	ldxa	[%r17, + 0x015e] %asi, %r24
	.word 0xb8950000  ! 834: ORcc_R	orcc 	%r20, %r0, %r28
	.word 0xbd359000  ! 835: SRLX_R	srlx	%r22, %r0, %r30
T2_asi_reg_wr_40:
	mov	0x1a, %r14
	.word 0xf2f38e60  ! 839: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xf085c020  ! 842: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r24
	.word 0xfc4d0000  ! 843: LDSB_R	ldsb	[%r20 + %r0], %r30
T2_asi_reg_wr_41:
	mov	0x9, %r14
	.word 0xfaf38e40  ! 844: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_73:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_73), 16, 16)) -> intp(2, 0, 32)
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_37:
	mov	0x29, %r14
	.word 0xfedb89e0  ! 850: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
iob_intr_2_74:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_74), 16, 16)) -> intp(2, 0, 34)
	.word 0xfe458000  ! 852: LDSW_R	ldsw	[%r22 + %r0], %r31
T2_asi_reg_rd_38:
	mov	0x28, %r14
	.word 0xfadb84a0  ! 854: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xb6248000  ! 855: SUB_R	sub 	%r18, %r0, %r27
cpu_intr_2_68:
	setx	0x23011d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_42:
	mov	0x3c7, %r14
	.word 0xfef38e40  ! 863: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf04ce13b  ! 864: LDSB_I	ldsb	[%r19 + 0x013b], %r24
	.word 0xb2b54000  ! 865: SUBCcc_R	orncc 	%r21, %r0, %r25
cpu_intr_2_69:
	setx	0x23030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cd0020  ! 870: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r28
	.word 0xf8854020  ! 873: LDUWA_R	lduwa	[%r21, %r0] 0x01, %r28
iob_intr_2_75:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_75), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_70:
	setx	0x200021, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_76:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_76), 16, 16)) -> intp(2, 0, 37)
	ta	T_CHANGE_HPRIV
	.word 0xb135d000  ! 884: SRLX_R	srlx	%r23, %r0, %r24
	.word 0xfcdda021  ! 885: LDXA_I	ldxa	[%r22, + 0x0021] %asi, %r30
	.word 0xf2148000  ! 886: LDUH_R	lduh	[%r18 + %r0], %r25
T2_asi_reg_wr_43:
	mov	0x20, %r14
	.word 0xfaf384a0  ! 887: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T2_asi_reg_rd_39:
	mov	0xb, %r14
	.word 0xfcdb89e0  ! 888: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_2_71:
	setx	0x210104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbeb4209f  ! 894: ORNcc_I	orncc 	%r16, 0x009f, %r31
cpu_intr_2_72:
	setx	0x210205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84c607a  ! 900: LDSB_I	ldsb	[%r17 + 0x007a], %r28
	.word 0xf445e1ce  ! 909: LDSW_I	ldsw	[%r23 + 0x01ce], %r26
T2_asi_reg_wr_44:
	mov	0x1f, %r14
	.word 0xfcf38e40  ! 913: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfa956099  ! 922: LDUHA_I	lduha	[%r21, + 0x0099] %asi, %r29
cpu_intr_2_73:
	setx	0x250037, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf20d21f6  ! 928: LDUB_I	ldub	[%r20 + 0x01f6], %r25
	.word 0xf04d0000  ! 929: LDSB_R	ldsb	[%r20 + %r0], %r24
	.word 0xfad4a085  ! 932: LDSHA_I	ldsha	[%r18, + 0x0085] %asi, %r29
cpu_intr_2_74:
	setx	0x26020b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc0c8000  ! 935: LDUB_R	ldub	[%r18 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe4c2090  ! 938: LDSB_I	ldsb	[%r16 + 0x0090], %r31
iob_intr_2_77:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_77), 16, 16)) -> intp(2, 0, 2d)
	.word 0xf09520ae  ! 941: LDUHA_I	lduha	[%r20, + 0x00ae] %asi, %r24
T2_asi_reg_wr_45:
	mov	0x38, %r14
	.word 0xf2f38e40  ! 944: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xf2cc20af  ! 946: LDSBA_I	ldsba	[%r16, + 0x00af] %asi, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_75:
	setx	0x24031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecde0b1  ! 950: LDSBA_I	ldsba	[%r23, + 0x00b1] %asi, %r31
	.word 0xb1357001  ! 954: SRLX_I	srlx	%r21, 0x0001, %r24
T2_asi_reg_rd_40:
	mov	0x24, %r14
	.word 0xf4db8e80  ! 956: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_2_78:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_78), 16, 16)) -> intp(2, 0, 38)
	.word 0xf6944020  ! 958: LDUHA_R	lduha	[%r17, %r0] 0x01, %r27
	.word 0xf40d0000  ! 959: LDUB_R	ldub	[%r20 + %r0], %r26
cpu_intr_2_76:
	setx	0x25003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_77:
	setx	0x27020d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_46:
	mov	0x12, %r14
	.word 0xf6f384a0  ! 965: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xfad44020  ! 969: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r29
T2_asi_reg_wr_47:
	mov	0x15, %r14
	.word 0xf2f389e0  ! 972: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_2_78:
	setx	0x240212, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_79:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_79), 16, 16)) -> intp(2, 0, 2f)
T2_asi_reg_rd_41:
	mov	0x3c7, %r14
	.word 0xf0db8e60  ! 978: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf25c8000  ! 980: LDX_R	ldx	[%r18 + %r0], %r25
	.word 0xbc340000  ! 983: SUBC_R	orn 	%r16, %r0, %r30
T2_asi_reg_wr_48:
	mov	0x20, %r14
	.word 0xf0f38e40  ! 986: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_79:
	setx	0x240213, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_42:
	mov	0x28, %r14
	.word 0xfcdb8e80  ! 990: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982b12  ! 991: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b12, %hpstate
T2_asi_reg_wr_49:
	mov	0xe, %r14
	.word 0xf0f389e0  ! 995: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb0b4a1bf  ! 997: SUBCcc_I	orncc 	%r18, 0x01bf, %r24
	.word 0xb034e1c8  ! 998: ORN_I	orn 	%r19, 0x01c8, %r24
	.word 0xfe8ca090  ! 999: LDUBA_I	lduba	[%r18, + 0x0090] %asi, %r31
	.word 0xf6cc8020  ! 1003: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r27
T2_asi_reg_rd_43:
	mov	0x3c3, %r14
	.word 0xf4db8e60  ! 1005: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf20da14c  ! 1010: LDUB_I	ldub	[%r22 + 0x014c], %r25
	.word 0xbf2cd000  ! 1012: SLLX_R	sllx	%r19, %r0, %r31
	.word 0xfec4a0b9  ! 1013: LDSWA_I	ldswa	[%r18, + 0x00b9] %asi, %r31
cpu_intr_2_80:
	setx	0x25033d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_80:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_80), 16, 16)) -> intp(2, 0, f)
	.word 0xbaaca0f1  ! 1018: ANDNcc_I	andncc 	%r18, 0x00f1, %r29
	.word 0xf4dc21d9  ! 1021: LDXA_I	ldxa	[%r16, + 0x01d9] %asi, %r26
	ta	T_CHANGE_HPRIV
cpu_intr_2_81:
	setx	0x240317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72d5000  ! 1031: SLLX_R	sllx	%r21, %r0, %r27
cpu_intr_2_82:
	setx	0x26031e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_81:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_81), 16, 16)) -> intp(2, 0, 2e)
	.word 0xfc152067  ! 1039: LDUH_I	lduh	[%r20 + 0x0067], %r30
iob_intr_2_82:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_82), 16, 16)) -> intp(2, 0, 14)
	.word 0xf644c000  ! 1044: LDSW_R	ldsw	[%r19 + %r0], %r27
iob_intr_2_83:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_83), 16, 16)) -> intp(2, 0, 21)
	.word 0xfc8c0020  ! 1050: LDUBA_R	lduba	[%r16, %r0] 0x01, %r30
T2_asi_reg_rd_44:
	mov	0x20, %r14
	.word 0xf4db8e60  ! 1052: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf80d0000  ! 1053: LDUB_R	ldub	[%r20 + %r0], %r28
iob_intr_2_84:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_84), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_83:
	setx	0x270323, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_84:
	setx	0x25011d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_85:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_85), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_rd_45:
	mov	0x3c3, %r14
	.word 0xf8db8400  ! 1062: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
iob_intr_2_86:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_86), 16, 16)) -> intp(2, 0, 1a)
	.word 0xb41c4000  ! 1068: XOR_R	xor 	%r17, %r0, %r26
cpu_intr_2_85:
	setx	0x26002a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4156125  ! 1073: LDUH_I	lduh	[%r21 + 0x0125], %r26
	.word 0xf05c0000  ! 1075: LDX_R	ldx	[%r16 + %r0], %r24
cpu_intr_2_86:
	setx	0x240008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_87:
	setx	0x240016, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_50:
	mov	0x3c7, %r14
	.word 0xf2f38e60  ! 1079: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
	.word 0xb0b5c000  ! 1080: ORNcc_R	orncc 	%r23, %r0, %r24
iob_intr_2_87:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_87), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_rd_46:
	mov	0x8, %r14
	.word 0xfadb8e60  ! 1082: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T2_asi_reg_wr_51:
	mov	0x2c, %r14
	.word 0xfcf38e80  ! 1083: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_2_88:
	setx	0x26010f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_89:
	setx	0x260132, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_88:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_88), 16, 16)) -> intp(2, 0, 34)
	.word 0xf24d203f  ! 1092: LDSB_I	ldsb	[%r20 + 0x003f], %r25
iob_intr_2_89:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_89), 16, 16)) -> intp(2, 0, 1f)
cpu_intr_2_90:
	setx	0x240014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8ccc020  ! 1095: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r28
iob_intr_2_90:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_90), 16, 16)) -> intp(2, 0, e)
	.word 0xb09d60e5  ! 1101: XORcc_I	xorcc 	%r21, 0x00e5, %r24
	.word 0xf0548000  ! 1103: LDSH_R	ldsh	[%r18 + %r0], %r24
iob_intr_2_91:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_91), 16, 16)) -> intp(2, 0, 24)
	.word 0xf20c0000  ! 1107: LDUB_R	ldub	[%r16 + %r0], %r25
	ta	T_CHANGE_TO_TL0
iob_intr_2_92:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_92), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf0850020  ! 1114: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r24
	.word 0xbe25e12e  ! 1118: SUB_I	sub 	%r23, 0x012e, %r31
T2_asi_reg_rd_47:
	mov	0x11, %r14
	.word 0xfedb8400  ! 1121: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T2_asi_reg_rd_48:
	mov	0x24, %r14
	.word 0xfcdb8e40  ! 1122: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb9504000  ! 1124: RDPR_TNPC	<illegal instruction>
	.word 0xfa95c020  ! 1125: LDUHA_R	lduha	[%r23, %r0] 0x01, %r29
	.word 0xf494a14e  ! 1126: LDUHA_I	lduha	[%r18, + 0x014e] %asi, %r26
	.word 0xf0cd4020  ! 1127: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r24
	.word 0xfc84e0fa  ! 1130: LDUWA_I	lduwa	[%r19, + 0x00fa] %asi, %r30
	.word 0xb8bd2132  ! 1131: XNORcc_I	xnorcc 	%r20, 0x0132, %r28
T2_asi_reg_rd_49:
	mov	0x30, %r14
	.word 0xf0db8e60  ! 1132: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf6446002  ! 1133: LDSW_I	ldsw	[%r17 + 0x0002], %r27
T2_asi_reg_rd_50:
	mov	0x14, %r14
	.word 0xf4db8e60  ! 1135: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T2_asi_reg_rd_51:
	mov	0x3c6, %r14
	.word 0xfcdb8e40  ! 1136: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xfa044000  ! 1139: LDUW_R	lduw	[%r17 + %r0], %r29
T2_asi_reg_wr_52:
	mov	0x2d, %r14
	.word 0xfcf38e40  ! 1140: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf04de014  ! 1143: LDSB_I	ldsb	[%r23 + 0x0014], %r24
	.word 0xf2040000  ! 1144: LDUW_R	lduw	[%r16 + %r0], %r25
	.word 0xb4446113  ! 1147: ADDC_I	addc 	%r17, 0x0113, %r26
cpu_intr_2_91:
	setx	0x260329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0c58020  ! 1149: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r24
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_92:
	setx	0x260100, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_53:
	mov	0x5, %r14
	.word 0xf0f38e40  ! 1152: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xfa148000  ! 1153: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0xf48c4020  ! 1155: LDUBA_R	lduba	[%r17, %r0] 0x01, %r26
	.word 0xf615a092  ! 1159: LDUH_I	lduh	[%r22 + 0x0092], %r27
T2_asi_reg_rd_52:
	mov	0x12, %r14
	.word 0xfadb8e40  ! 1160: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf6144000  ! 1162: LDUH_R	lduh	[%r17 + %r0], %r27
iob_intr_2_93:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_93), 16, 16)) -> intp(2, 0, 3)
cpu_intr_2_93:
	setx	0x250204, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_54:
	mov	0x3c4, %r14
	.word 0xf4f38400  ! 1167: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xf0140000  ! 1169: LDUH_R	lduh	[%r16 + %r0], %r24
	.word 0xf25c4000  ! 1172: LDX_R	ldx	[%r17 + %r0], %r25
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982e5a  ! 1175: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5a, %hpstate
iob_intr_2_94:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_94), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfa54a181  ! 1177: LDSH_I	ldsh	[%r18 + 0x0181], %r29
	.word 0xbab4e128  ! 1178: SUBCcc_I	orncc 	%r19, 0x0128, %r29
T2_asi_reg_rd_53:
	mov	0x3c6, %r14
	.word 0xf4db8e40  ! 1179: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_54:
	mov	0x18, %r14
	.word 0xf0db84a0  ! 1186: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_2_94:
	setx	0x270226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf615a111  ! 1189: LDUH_I	lduh	[%r22 + 0x0111], %r27
T2_asi_reg_wr_55:
	mov	0x23, %r14
	.word 0xf4f38e80  ! 1190: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	.word 0xfecce192  ! 1195: LDSBA_I	ldsba	[%r19, + 0x0192] %asi, %r31
T2_asi_reg_wr_56:
	mov	0x3c3, %r14
	.word 0xfef38e80  ! 1196: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T2_asi_reg_rd_55:
	mov	0x1f, %r14
	.word 0xfedb8e80  ! 1198: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_2_95:
	setx	0x270319, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_96:
	setx	0x24011c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5d0000  ! 1201: LDX_R	ldx	[%r20 + %r0], %r31
	.word 0xfa14c000  ! 1202: LDUH_R	lduh	[%r19 + %r0], %r29
iob_intr_2_95:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_95), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_wr_57:
	mov	0x3c4, %r14
	.word 0xf6f38400  ! 1205: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_2_96:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_96), 16, 16)) -> intp(2, 0, 1b)
	.word 0xbeaca04f  ! 1214: ANDNcc_I	andncc 	%r18, 0x004f, %r31
iob_intr_2_97:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_97), 16, 16)) -> intp(2, 0, 1d)
cpu_intr_2_97:
	setx	0x240008, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982f8a  ! 1217: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8a, %hpstate
	.word 0xf0dc20bb  ! 1219: LDXA_I	ldxa	[%r16, + 0x00bb] %asi, %r24
	.word 0xf6c50020  ! 1221: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r27
cpu_intr_2_98:
	setx	0x24001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb414c000  ! 1223: OR_R	or 	%r19, %r0, %r26
	.word 0xbabde1cd  ! 1226: XNORcc_I	xnorcc 	%r23, 0x01cd, %r29
	ta	T_CHANGE_TO_TL0
	.word 0xfa152068  ! 1230: LDUH_I	lduh	[%r20 + 0x0068], %r29
	.word 0xb09de0f7  ! 1231: XORcc_I	xorcc 	%r23, 0x00f7, %r24
	.word 0xf415e1f9  ! 1232: LDUH_I	lduh	[%r23 + 0x01f9], %r26
iob_intr_2_98:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_98), 16, 16)) -> intp(2, 0, c)
T2_asi_reg_wr_58:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 1237: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf8d4c020  ! 1239: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r28
T2_asi_reg_wr_59:
	mov	0x31, %r14
	.word 0xf0f389e0  ! 1241: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_2_99:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_99), 16, 16)) -> intp(2, 0, 3)
	.word 0xf8958020  ! 1248: LDUHA_R	lduha	[%r22, %r0] 0x01, %r28
	.word 0xf2156102  ! 1251: LDUH_I	lduh	[%r21 + 0x0102], %r25
iob_intr_2_100:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_100), 16, 16)) -> intp(2, 0, 18)
cpu_intr_2_99:
	setx	0x240135, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_56:
	mov	0xd, %r14
	.word 0xf8db8e80  ! 1255: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb1355000  ! 1256: SRLX_R	srlx	%r21, %r0, %r24
	.word 0xfc948020  ! 1259: LDUHA_R	lduha	[%r18, %r0] 0x01, %r30
iob_intr_2_101:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_101), 16, 16)) -> intp(2, 0, 2d)
T2_asi_reg_wr_60:
	mov	0x1f, %r14
	.word 0xf6f389e0  ! 1263: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xfc0da0b5  ! 1264: LDUB_I	ldub	[%r22 + 0x00b5], %r30
iob_intr_2_102:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_102), 16, 16)) -> intp(2, 0, 11)
	.word 0xb40ca0db  ! 1268: AND_I	and 	%r18, 0x00db, %r26
	.word 0xfad48020  ! 1269: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r29
	ta	T_CHANGE_HPRIV
	.word 0xf4544000  ! 1272: LDSH_R	ldsh	[%r17 + %r0], %r26
	.word 0xf04c0000  ! 1273: LDSB_R	ldsb	[%r16 + %r0], %r24
T2_asi_reg_rd_57:
	mov	0x3c5, %r14
	.word 0xf4db8e60  ! 1274: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf685600e  ! 1275: LDUWA_I	lduwa	[%r21, + 0x000e] %asi, %r27
T2_asi_reg_rd_58:
	mov	0x23, %r14
	.word 0xf4db8e40  ! 1277: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf0cca030  ! 1279: LDSBA_I	ldsba	[%r18, + 0x0030] %asi, %r24
T2_asi_reg_wr_61:
	mov	0x28, %r14
	.word 0xfcf38e40  ! 1280: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_100:
	setx	0x25020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc95a1c9  ! 1285: ORcc_I	orcc 	%r22, 0x01c9, %r30
	.word 0xb2a4e0b2  ! 1288: SUBcc_I	subcc 	%r19, 0x00b2, %r25
	.word 0xbe9d0000  ! 1290: XORcc_R	xorcc 	%r20, %r0, %r31
cpu_intr_2_101:
	setx	0x27033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbc3c0000  ! 1299: XNOR_R	xnor 	%r16, %r0, %r30
T2_asi_reg_wr_62:
	mov	0x7, %r14
	.word 0xfaf38e40  ! 1300: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xf2154000  ! 1301: LDUH_R	lduh	[%r21 + %r0], %r25
cpu_intr_2_102:
	setx	0x260209, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_103:
	setx	0x25022b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_103:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_103), 16, 16)) -> intp(2, 0, 37)
iob_intr_2_104:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_104), 16, 16)) -> intp(2, 0, 2a)
T2_asi_reg_rd_59:
	mov	0xc, %r14
	.word 0xfcdb84a0  ! 1306: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
iob_intr_2_105:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_105), 16, 16)) -> intp(2, 0, 19)
	.word 0xb22421a5  ! 1309: SUB_I	sub 	%r16, 0x01a5, %r25
T2_asi_reg_rd_60:
	mov	0xa, %r14
	.word 0xfcdb8e80  ! 1310: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983c52  ! 1311: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c52, %hpstate
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982990  ! 1313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0990, %hpstate
	.word 0xf25cc000  ! 1314: LDX_R	ldx	[%r19 + %r0], %r25
iob_intr_2_106:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_106), 16, 16)) -> intp(2, 0, 10)
T2_asi_reg_rd_61:
	mov	0x30, %r14
	.word 0xfadb8e80  ! 1316: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_2_104:
	setx	0x26013c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_105:
	setx	0x250136, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
	.word 0xf2542035  ! 1329: LDSH_I	ldsh	[%r16 + 0x0035], %r25
	.word 0xfe0c2181  ! 1331: LDUB_I	ldub	[%r16 + 0x0181], %r31
T2_asi_reg_wr_63:
	mov	0x25, %r14
	.word 0xfcf38e60  ! 1332: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xf0550000  ! 1333: LDSH_R	ldsh	[%r20 + %r0], %r24
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983b08  ! 1335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b08, %hpstate
	.word 0xf6cd216c  ! 1338: LDSBA_I	ldsba	[%r20, + 0x016c] %asi, %r27
	.word 0xfa5ce017  ! 1342: LDX_I	ldx	[%r19 + 0x0017], %r29
cpu_intr_2_106:
	setx	0x270337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf40c4000  ! 1344: LDUB_R	ldub	[%r17 + %r0], %r26
iob_intr_2_107:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_107), 16, 16)) -> intp(2, 0, 2e)
	.word 0xb00d4000  ! 1349: AND_R	and 	%r21, %r0, %r24
iob_intr_2_108:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_108), 16, 16)) -> intp(2, 0, e)
	.word 0xfa958020  ! 1351: LDUHA_R	lduha	[%r22, %r0] 0x01, %r29
	.word 0xf2d4c020  ! 1352: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r25
cpu_intr_2_107:
	setx	0x260326, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb3cf001  ! 1355: SRAX_I	srax	%r19, 0x0001, %r29
iob_intr_2_109:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_109), 16, 16)) -> intp(2, 0, 1d)
	.word 0xb4948000  ! 1361: ORcc_R	orcc 	%r18, %r0, %r26
iob_intr_2_110:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_110), 16, 16)) -> intp(2, 0, 1d)
	.word 0xfa85a09b  ! 1364: LDUWA_I	lduwa	[%r22, + 0x009b] %asi, %r29
iob_intr_2_111:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_111), 16, 16)) -> intp(2, 0, 1)
cpu_intr_2_108:
	setx	0x27032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbca54000  ! 1376: SUBcc_R	subcc 	%r21, %r0, %r30
	.word 0xb0a5c000  ! 1378: SUBcc_R	subcc 	%r23, %r0, %r24
T2_asi_reg_rd_62:
	mov	0x18, %r14
	.word 0xf2db8e60  ! 1382: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x819829d2  ! 1383: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d2, %hpstate
iob_intr_2_112:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_112), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_wr_64:
	mov	0x1c, %r14
	.word 0xfaf384a0  ! 1387: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xfe5d4000  ! 1388: LDX_R	ldx	[%r21 + %r0], %r31
	.word 0xf0454000  ! 1391: LDSW_R	ldsw	[%r21 + %r0], %r24
	.word 0xb4a461ad  ! 1392: SUBcc_I	subcc 	%r17, 0x01ad, %r26
iob_intr_2_113:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_113), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_109:
	setx	0x28023a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_110:
	setx	0x280035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65da0cc  ! 1401: LDX_I	ldx	[%r22 + 0x00cc], %r27
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983a90  ! 1402: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a90, %hpstate
T2_asi_reg_rd_63:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 1404: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_wr_65:
	mov	0x20, %r14
	.word 0xfcf38e40  ! 1405: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf05ce0ad  ! 1406: LDX_I	ldx	[%r19 + 0x00ad], %r24
	.word 0xfa450000  ! 1407: LDSW_R	ldsw	[%r20 + %r0], %r29
iob_intr_2_114:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_114), 16, 16)) -> intp(2, 0, 1d)
iob_intr_2_115:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_115), 16, 16)) -> intp(2, 0, 2c)
cpu_intr_2_111:
	setx	0x290214, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_116:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_116), 16, 16)) -> intp(2, 0, 2e)
	.word 0xfecca1f5  ! 1421: LDSBA_I	ldsba	[%r18, + 0x01f5] %asi, %r31
	.word 0xfad42087  ! 1424: LDSHA_I	ldsha	[%r16, + 0x0087] %asi, %r29
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_66:
	mov	0x2c, %r14
	.word 0xfef38400  ! 1434: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xf60c4000  ! 1435: LDUB_R	ldub	[%r17 + %r0], %r27
	.word 0xfa04a163  ! 1436: LDUW_I	lduw	[%r18 + 0x0163], %r29
cpu_intr_2_112:
	setx	0x29010c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_117:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_117), 16, 16)) -> intp(2, 0, 3c)
	.word 0xb8056175  ! 1440: ADD_I	add 	%r21, 0x0175, %r28
cpu_intr_2_113:
	setx	0x280019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45ca1cd  ! 1443: LDX_I	ldx	[%r18 + 0x01cd], %r26
	.word 0xf25521dc  ! 1447: LDSH_I	ldsh	[%r20 + 0x01dc], %r25
iob_intr_2_118:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_118), 16, 16)) -> intp(2, 0, 3c)
	.word 0x8994e1f0  ! 1450: WRPR_TICK_I	wrpr	%r19, 0x01f0, %tick
	.word 0xf245e01a  ! 1453: LDSW_I	ldsw	[%r23 + 0x001a], %r25
	.word 0xb09ce0b1  ! 1457: XORcc_I	xorcc 	%r19, 0x00b1, %r24
	.word 0xb4846025  ! 1458: ADDcc_I	addcc 	%r17, 0x0025, %r26
	.word 0xf4d5a02d  ! 1459: LDSHA_I	ldsha	[%r22, + 0x002d] %asi, %r26
T2_asi_reg_wr_67:
	mov	0x9, %r14
	.word 0xfaf38e40  ! 1461: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbf35d000  ! 1464: SRLX_R	srlx	%r23, %r0, %r31
	.word 0xbe0c0000  ! 1468: AND_R	and 	%r16, %r0, %r31
T2_asi_reg_rd_64:
	mov	0x30, %r14
	.word 0xf4db84a0  ! 1469: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
T2_asi_reg_rd_65:
	mov	0x10, %r14
	.word 0xf8db89e0  ! 1473: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
cpu_intr_2_114:
	setx	0x280124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba9dc000  ! 1476: XORcc_R	xorcc 	%r23, %r0, %r29
	.word 0xf28c4020  ! 1477: LDUBA_R	lduba	[%r17, %r0] 0x01, %r25
cpu_intr_2_115:
	setx	0x29011c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_119:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_119), 16, 16)) -> intp(2, 0, 39)
	ta	T_CHANGE_TO_TL1
	.word 0xb614612e  ! 1490: OR_I	or 	%r17, 0x012e, %r27
	.word 0xf40dc000  ! 1493: LDUB_R	ldub	[%r23 + %r0], %r26
cpu_intr_2_116:
	setx	0x29023e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_68:
	mov	0x7, %r14
	.word 0xf2f38400  ! 1498: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_2_120:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_120), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf6458000  ! 1504: LDSW_R	ldsw	[%r22 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb84520a4  ! 1506: ADDC_I	addc 	%r20, 0x00a4, %r28
iob_intr_2_121:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_121), 16, 16)) -> intp(2, 0, 30)
T2_asi_reg_wr_69:
	mov	0x32, %r14
	.word 0xf4f38e80  ! 1509: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xf8054000  ! 1510: LDUW_R	lduw	[%r21 + %r0], %r28
T2_asi_reg_wr_70:
	mov	0x3c7, %r14
	.word 0xfef38e80  ! 1511: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf2d5e177  ! 1512: LDSHA_I	ldsha	[%r23, + 0x0177] %asi, %r25
T2_asi_reg_rd_66:
	mov	0x28, %r14
	.word 0xf2db8e40  ! 1514: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xb13db001  ! 1515: SRAX_I	srax	%r22, 0x0001, %r24
	.word 0xfa550000  ! 1517: LDSH_R	ldsh	[%r20 + %r0], %r29
cpu_intr_2_117:
	setx	0x280132, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf655c000  ! 1520: LDSH_R	ldsh	[%r23 + %r0], %r27
T2_asi_reg_wr_71:
	mov	0x3c7, %r14
	.word 0xf0f389e0  ! 1523: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf8c48020  ! 1525: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r28
cpu_intr_2_118:
	setx	0x2a033d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa04c000  ! 1527: LDUW_R	lduw	[%r19 + %r0], %r29
T2_asi_reg_wr_72:
	mov	0x2b, %r14
	.word 0xfcf38e40  ! 1528: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf08c6151  ! 1529: LDUBA_I	lduba	[%r17, + 0x0151] %asi, %r24
T2_asi_reg_rd_67:
	mov	0x32, %r14
	.word 0xfedb8e40  ! 1533: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	ta	T_CHANGE_TO_TL1
iob_intr_2_122:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_122), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_wr_73:
	mov	0x8, %r14
	.word 0xf6f38e60  ! 1537: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf0cc2086  ! 1538: LDSBA_I	ldsba	[%r16, + 0x0086] %asi, %r24
T2_asi_reg_wr_74:
	mov	0x2b, %r14
	.word 0xf4f38e80  ! 1540: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_2_119:
	setx	0x2a0133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe4d21a9  ! 1542: LDSB_I	ldsb	[%r20 + 0x01a9], %r31
iob_intr_2_123:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_123), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_rd_68:
	mov	0x2d, %r14
	.word 0xf8db8400  ! 1545: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_2_120:
	setx	0x30131, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_124:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_124), 16, 16)) -> intp(2, 0, a)
iob_intr_2_125:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_125), 16, 16)) -> intp(2, 0, 20)
iob_intr_2_126:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_126), 16, 16)) -> intp(2, 0, 30)
	.word 0xf2d56181  ! 1555: LDSHA_I	ldsha	[%r21, + 0x0181] %asi, %r25
cpu_intr_2_121:
	setx	0x2a023d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_127:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_127), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_wr_75:
	mov	0x3c1, %r14
	.word 0xf6f38e80  ! 1562: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf80c2058  ! 1563: LDUB_I	ldub	[%r16 + 0x0058], %r28
	.word 0xf84d0000  ! 1564: LDSB_R	ldsb	[%r20 + %r0], %r28
	.word 0xfa040000  ! 1566: LDUW_R	lduw	[%r16 + %r0], %r29
iob_intr_2_128:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_128), 16, 16)) -> intp(2, 0, 11)
	.word 0xf0cc0020  ! 1569: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r24
iob_intr_2_129:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_129), 16, 16)) -> intp(2, 0, 2d)
iob_intr_2_130:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_130), 16, 16)) -> intp(2, 0, 3a)
T2_asi_reg_wr_76:
	mov	0x0, %r14
	.word 0xfaf38e40  ! 1574: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_122:
	setx	0x2a0006, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_69:
	mov	0x3c7, %r14
	.word 0xfedb8e40  ! 1579: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_123:
	setx	0x2a0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_131:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_131), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_132:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_132), 16, 16)) -> intp(2, 0, 22)
	.word 0xf20d8000  ! 1586: LDUB_R	ldub	[%r22 + %r0], %r25
cpu_intr_2_124:
	setx	0x290129, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_NONHPRIV
	.word 0xfcc421ee  ! 1591: LDSWA_I	ldswa	[%r16, + 0x01ee] %asi, %r30
	.word 0xfc4d60f4  ! 1592: LDSB_I	ldsb	[%r21 + 0x00f4], %r30
iob_intr_2_133:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_133), 16, 16)) -> intp(2, 0, 2)
	.word 0xf295e055  ! 1594: LDUHA_I	lduha	[%r23, + 0x0055] %asi, %r25
	.word 0xbe1c0000  ! 1597: XOR_R	xor 	%r16, %r0, %r31
cpu_intr_2_125:
	setx	0x29000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_77:
	mov	0x1d, %r14
	.word 0xf6f38e40  ! 1604: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf014a061  ! 1606: LDUH_I	lduh	[%r18 + 0x0061], %r24
iob_intr_2_134:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_134), 16, 16)) -> intp(2, 0, 3a)
cpu_intr_2_126:
	setx	0x2a0320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_127:
	setx	0x28020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_78:
	mov	0x9, %r14
	.word 0xf8f38e80  ! 1611: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
	ta	T_CHANGE_TO_TL1
	.word 0xbe350000  ! 1614: SUBC_R	orn 	%r20, %r0, %r31
cpu_intr_2_128:
	setx	0x280200, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_70:
	mov	0x3c0, %r14
	.word 0xfedb8e60  ! 1618: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbe8d60b0  ! 1619: ANDcc_I	andcc 	%r21, 0x00b0, %r31
	ta	T_CHANGE_TO_TL0
	.word 0xf48d0020  ! 1623: LDUBA_R	lduba	[%r20, %r0] 0x01, %r26
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81982d82  ! 1624: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d82, %hpstate
iob_intr_2_135:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_135), 16, 16)) -> intp(2, 0, 25)
cpu_intr_2_129:
	setx	0x280127, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_79:
	mov	0xe, %r14
	.word 0xfaf38e60  ! 1632: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T2_asi_reg_rd_71:
	mov	0x31, %r14
	.word 0xfadb8e80  ! 1634: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_2_136:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_136), 16, 16)) -> intp(2, 0, 19)
	.word 0xb4b561f1  ! 1636: SUBCcc_I	orncc 	%r21, 0x01f1, %r26
	.word 0xf88d8020  ! 1639: LDUBA_R	lduba	[%r22, %r0] 0x01, %r28
iob_intr_2_137:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_137), 16, 16)) -> intp(2, 0, 24)
	.word 0xfc940020  ! 1644: LDUHA_R	lduha	[%r16, %r0] 0x01, %r30
	.word 0xf05de0ba  ! 1645: LDX_I	ldx	[%r23 + 0x00ba], %r24
iob_intr_2_138:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_138), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf655e19c  ! 1650: LDSH_I	ldsh	[%r23 + 0x019c], %r27
	.word 0xbd349000  ! 1652: SRLX_R	srlx	%r18, %r0, %r30
cpu_intr_2_130:
	setx	0x2a0305, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_131:
	setx	0x2b033a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_139:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_139), 16, 16)) -> intp(2, 0, 3c)
T2_asi_reg_rd_72:
	mov	0x3c4, %r14
	.word 0xf4db84a0  ! 1660: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
iob_intr_2_140:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_140), 16, 16)) -> intp(2, 0, 26)
	.word 0xf8d48020  ! 1666: LDSHA_R	ldsha	[%r18, %r0] 0x01, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb72cc000  ! 1668: SLL_R	sll 	%r19, %r0, %r27
T2_asi_reg_rd_73:
	mov	0x20, %r14
	.word 0xfedb8e40  ! 1669: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_132:
	setx	0x2a0234, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_141:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_141), 16, 16)) -> intp(2, 0, 37)
	.word 0xf4c4c020  ! 1673: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r26
cpu_intr_2_133:
	setx	0x280203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6554000  ! 1675: LDSH_R	ldsh	[%r21 + %r0], %r27
	.word 0xfe5d4000  ! 1677: LDX_R	ldx	[%r21 + %r0], %r31
	.word 0xb2c4a106  ! 1679: ADDCcc_I	addccc 	%r18, 0x0106, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_142:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_142), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_143:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_143), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_rd_74:
	mov	0x27, %r14
	.word 0xf4db8e60  ! 1687: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	ta	T_CHANGE_TO_TL1
iob_intr_2_144:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_144), 16, 16)) -> intp(2, 0, 0)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_145:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_145), 16, 16)) -> intp(2, 0, 2d)
cpu_intr_2_134:
	setx	0x28032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf094a017  ! 1697: LDUHA_I	lduha	[%r18, + 0x0017] %asi, %r24
T2_asi_reg_rd_75:
	mov	0x2b, %r14
	.word 0xf6db89e0  ! 1698: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xb62ce0cf  ! 1700: ANDN_I	andn 	%r19, 0x00cf, %r27
	setx	data_start_7, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983a00  ! 1701: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a00, %hpstate
iob_intr_2_146:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_146), 16, 16)) -> intp(2, 0, 2c)
	.word 0x8395607c  ! 1706: WRPR_TNPC_I	wrpr	%r21, 0x007c, %tnpc
T2_asi_reg_rd_76:
	mov	0x24, %r14
	.word 0xfcdb89e0  ! 1708: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xf2dc2104  ! 1709: LDXA_I	ldxa	[%r16, + 0x0104] %asi, %r25
	.word 0xf0c54020  ! 1712: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r24
T2_asi_reg_rd_77:
	mov	0x25, %r14
	.word 0xf8db8e60  ! 1713: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_2_147:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_147), 16, 16)) -> intp(2, 0, 2e)
	.word 0xf284e05d  ! 1715: LDUWA_I	lduwa	[%r19, + 0x005d] %asi, %r25
	.word 0xfcc561b5  ! 1723: LDSWA_I	ldswa	[%r21, + 0x01b5] %asi, %r30
	.word 0xbe2c8000  ! 1724: ANDN_R	andn 	%r18, %r0, %r31
	.word 0xf4d40020  ! 1726: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r26
T2_asi_reg_wr_80:
	mov	0x3c1, %r14
	.word 0xf6f384a0  ! 1728: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T2_asi_reg_wr_81:
	mov	0x3c6, %r14
	.word 0xfaf389e0  ! 1731: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xf80de1a9  ! 1732: LDUB_I	ldub	[%r23 + 0x01a9], %r28
	ta	T_CHANGE_HPRIV
	.word 0xb4bc8000  ! 1736: XNORcc_R	xnorcc 	%r18, %r0, %r26
iob_intr_2_148:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_148), 16, 16)) -> intp(2, 0, 4)
T2_asi_reg_rd_78:
	mov	0xf, %r14
	.word 0xfcdb8e40  ! 1739: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf40d8000  ! 1740: LDUB_R	ldub	[%r22 + %r0], %r26
iob_intr_2_149:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_149), 16, 16)) -> intp(2, 0, 27)
T2_asi_reg_wr_82:
	mov	0x2e, %r14
	.word 0xf6f38e40  ! 1743: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf44d0000  ! 1745: LDSB_R	ldsb	[%r20 + %r0], %r26
	.word 0xb3480000  ! 1747: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf2c420a7  ! 1748: LDSWA_I	ldswa	[%r16, + 0x00a7] %asi, %r25
iob_intr_2_150:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_150), 16, 16)) -> intp(2, 0, 2b)
iob_intr_2_151:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_151), 16, 16)) -> intp(2, 0, 39)
	.word 0xbeb5c000  ! 1755: ORNcc_R	orncc 	%r23, %r0, %r31
cpu_intr_2_135:
	setx	0x2a0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983ec2  ! 1762: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec2, %hpstate
iob_intr_2_152:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_152), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_136:
	setx	0x2a0237, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe240000  ! 1768: SUB_R	sub 	%r16, %r0, %r31
	.word 0xb6bc8000  ! 1769: XNORcc_R	xnorcc 	%r18, %r0, %r27
	.word 0xf85c4000  ! 1770: LDX_R	ldx	[%r17 + %r0], %r28
T2_asi_reg_rd_79:
	mov	0x38, %r14
	.word 0xfadb89e0  ! 1771: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	ta	T_CHANGE_NONHPRIV
	.word 0xf0cc20c2  ! 1777: LDSBA_I	ldsba	[%r16, + 0x00c2] %asi, %r24
cpu_intr_2_137:
	setx	0x28020d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6358000  ! 1780: SUBC_R	orn 	%r22, %r0, %r27
T2_asi_reg_rd_80:
	mov	0x25, %r14
	.word 0xfedb8400  ! 1783: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
T2_asi_reg_wr_83:
	mov	0x33, %r14
	.word 0xfaf384a0  ! 1788: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xf8dd61bb  ! 1791: LDXA_I	ldxa	[%r21, + 0x01bb] %asi, %r28
	.word 0xf4946017  ! 1798: LDUHA_I	lduha	[%r17, + 0x0017] %asi, %r26
T2_asi_reg_rd_81:
	mov	0x17, %r14
	.word 0xf6db8400  ! 1799: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
cpu_intr_2_138:
	setx	0x2a0020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa15a029  ! 1806: LDUH_I	lduh	[%r22 + 0x0029], %r29
T2_asi_reg_rd_82:
	mov	0x36, %r14
	.word 0xf8db8400  ! 1807: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T2_asi_reg_rd_83:
	mov	0x24, %r14
	.word 0xf4db8e40  ! 1809: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf294e0c5  ! 1812: LDUHA_I	lduha	[%r19, + 0x00c5] %asi, %r25
	.word 0xfe5d204c  ! 1813: LDX_I	ldx	[%r20 + 0x004c], %r31
cpu_intr_2_139:
	setx	0x2b0220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_140:
	setx	0x290109, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_153:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_153), 16, 16)) -> intp(2, 0, d)
	ta	T_CHANGE_TO_TL1
iob_intr_2_154:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_154), 16, 16)) -> intp(2, 0, 9)
	.word 0xf4cd60f3  ! 1823: LDSBA_I	ldsba	[%r21, + 0x00f3] %asi, %r26
iob_intr_2_155:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_155), 16, 16)) -> intp(2, 0, 3d)
	.word 0xbcac4000  ! 1828: ANDNcc_R	andncc 	%r17, %r0, %r30
	.word 0xbec5c000  ! 1829: ADDCcc_R	addccc 	%r23, %r0, %r31
cpu_intr_2_141:
	setx	0x2d010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d4c020  ! 1831: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r25
	.word 0xf6cde04b  ! 1832: LDSBA_I	ldsba	[%r23, + 0x004b] %asi, %r27
	.word 0xf00d6140  ! 1833: LDUB_I	ldub	[%r21 + 0x0140], %r24
T2_asi_reg_wr_84:
	mov	0x3c3, %r14
	.word 0xfef38e40  ! 1834: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf48d0020  ! 1836: LDUBA_R	lduba	[%r20, %r0] 0x01, %r26
T2_asi_reg_wr_85:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 1839: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_2_156:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_156), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_rd_84:
	mov	0x17, %r14
	.word 0xfcdb8e40  ! 1841: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T2_asi_reg_rd_85:
	mov	0x3c8, %r14
	.word 0xfadb8e40  ! 1844: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T2_asi_reg_rd_86:
	mov	0x1, %r14
	.word 0xfedb89e0  ! 1848: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfe0de1f6  ! 1850: LDUB_I	ldub	[%r23 + 0x01f6], %r31
	.word 0xbc8c4000  ! 1853: ANDcc_R	andcc 	%r17, %r0, %r30
cpu_intr_2_142:
	setx	0x2f031e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_86:
	mov	0x25, %r14
	.word 0xf6f384a0  ! 1856: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf60c60b3  ! 1857: LDUB_I	ldub	[%r17 + 0x00b3], %r27
T2_asi_reg_rd_87:
	mov	0x34, %r14
	.word 0xfcdb84a0  ! 1860: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf68d20e2  ! 1861: LDUBA_I	lduba	[%r20, + 0x00e2] %asi, %r27
	.word 0xf6cd209a  ! 1868: LDSBA_I	ldsba	[%r20, + 0x009a] %asi, %r27
	ta	T_CHANGE_TO_TL1
	.word 0xfad460ba  ! 1871: LDSHA_I	ldsha	[%r17, + 0x00ba] %asi, %r29
cpu_intr_2_143:
	setx	0x2c0307, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_144:
	setx	0x2e0113, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_145:
	setx	0x2d021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_146:
	setx	0x2c0031, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_87:
	mov	0x16, %r14
	.word 0xf2f38e40  ! 1883: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb8948000  ! 1884: ORcc_R	orcc 	%r18, %r0, %r28
	.word 0xf0d44020  ! 1885: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r24
cpu_intr_2_147:
	setx	0x2f0021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45c61f2  ! 1894: LDX_I	ldx	[%r17 + 0x01f2], %r26
cpu_intr_2_148:
	setx	0x2c032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0dce110  ! 1898: LDXA_I	ldxa	[%r19, + 0x0110] %asi, %r24
	.word 0xf44c4000  ! 1899: LDSB_R	ldsb	[%r17 + %r0], %r26
	.word 0xf6c5e1d5  ! 1901: LDSWA_I	ldswa	[%r23, + 0x01d5] %asi, %r27
cpu_intr_2_149:
	setx	0x2d020c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_150:
	setx	0x2d002b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbab521ee  ! 1913: SUBCcc_I	orncc 	%r20, 0x01ee, %r29
	.word 0xb1347001  ! 1915: SRLX_I	srlx	%r17, 0x0001, %r24
cpu_intr_2_151:
	setx	0x2d0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88c8020  ! 1921: LDUBA_R	lduba	[%r18, %r0] 0x01, %r28
	.word 0xfc144000  ! 1922: LDUH_R	lduh	[%r17 + %r0], %r30
	.word 0xb52c7001  ! 1923: SLLX_I	sllx	%r17, 0x0001, %r26
cpu_intr_2_152:
	setx	0x2f001b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_153:
	setx	0x2c002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_88:
	mov	0x3c7, %r14
	.word 0xf8db84a0  ! 1928: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
cpu_intr_2_154:
	setx	0x2e0303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe14a08d  ! 1931: OR_I	or 	%r18, 0x008d, %r31
	ta	T_CHANGE_TO_TL0
	.word 0xf44ce146  ! 1933: LDSB_I	ldsb	[%r19 + 0x0146], %r26
T2_asi_reg_rd_89:
	mov	0x10, %r14
	.word 0xf4db8e60  ! 1935: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0x8f902001  ! 1937: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xfa8c60dc  ! 1942: LDUBA_I	lduba	[%r17, + 0x00dc] %asi, %r29
	.word 0xf0058000  ! 1945: LDUW_R	lduw	[%r22 + %r0], %r24
	.word 0xb72c8000  ! 1948: SLL_R	sll 	%r18, %r0, %r27
	.word 0xfa5c2020  ! 1951: LDX_I	ldx	[%r16 + 0x0020], %r29
	.word 0xf0dda197  ! 1953: LDXA_I	ldxa	[%r22, + 0x0197] %asi, %r24
iob_intr_2_157:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_157), 16, 16)) -> intp(2, 0, 14)
cpu_intr_2_155:
	setx	0x2f0226, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_90:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 1960: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_158:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_158), 16, 16)) -> intp(2, 0, 1e)
	.word 0xfacd4020  ! 1964: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r29
	.word 0xf2c4c020  ! 1966: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r25
	.word 0xbd7c0400  ! 1967: MOVR_R	movre	%r16, %r0, %r30
iob_intr_2_159:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_159), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_160:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_160), 16, 16)) -> intp(2, 0, 27)
	.word 0xf404c000  ! 1972: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xf815e06c  ! 1973: LDUH_I	lduh	[%r23 + 0x006c], %r28
T2_asi_reg_wr_88:
	mov	0x35, %r14
	.word 0xf0f38e40  ! 1974: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
T2_asi_reg_wr_89:
	mov	0x35, %r14
	.word 0xf6f38400  ! 1979: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_2_161:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_161), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_rd_91:
	mov	0x30, %r14
	.word 0xfedb84a0  ! 1982: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xbd344000  ! 1983: SRL_R	srl 	%r17, %r0, %r30
cpu_intr_2_156:
	setx	0x2f0332, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_162:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_162), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_rd_92:
	mov	0x3c3, %r14
	.word 0xf4db84a0  ! 1987: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb0a44000  ! 1988: SUBcc_R	subcc 	%r17, %r0, %r24
iob_intr_2_163:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_163), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_164:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_164), 16, 16)) -> intp(2, 0, 7)
iob_intr_2_165:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_165), 16, 16)) -> intp(2, 0, 6)
	ta	T_CHANGE_TO_TL0
cpu_intr_2_157:
	setx	0x2c011b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_158:
	setx	0x2d0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24da1b1  ! 1997: LDSB_I	ldsb	[%r22 + 0x01b1], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfed4c020  ! 2001: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r31
	.word 0xb88c0000  ! 2005: ANDcc_R	andcc 	%r16, %r0, %r28
	.word 0xa1902000  ! 2006: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xf0c48020  ! 2009: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r24
T2_asi_reg_rd_93:
	mov	0x3c7, %r14
	.word 0xfadb89e0  ! 2011: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
iob_intr_2_166:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_166), 16, 16)) -> intp(2, 0, 9)
cpu_intr_2_159:
	setx	0x2d0120, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_167:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_167), 16, 16)) -> intp(2, 0, 0)
T2_asi_reg_wr_90:
	mov	0x28, %r14
	.word 0xf4f384a0  ! 2019: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_2_168:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_168), 16, 16)) -> intp(2, 0, 2e)
cpu_intr_2_160:
	setx	0x2c0020, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_169:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_169), 16, 16)) -> intp(2, 0, 1f)
cpu_intr_2_161:
	setx	0x2f021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_94:
	mov	0x3c1, %r14
	.word 0xf0db8e60  ! 2028: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb2048000  ! 2029: ADD_R	add 	%r18, %r0, %r25
	.word 0xbf2cb001  ! 2030: SLLX_I	sllx	%r18, 0x0001, %r31
iob_intr_2_170:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_170), 16, 16)) -> intp(2, 0, 2a)
	.word 0xfa15a1f6  ! 2032: LDUH_I	lduh	[%r22 + 0x01f6], %r29
iob_intr_2_171:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_171), 16, 16)) -> intp(2, 0, 2a)
T2_asi_reg_rd_95:
	mov	0x2d, %r14
	.word 0xf6db89e0  ! 2037: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
T2_asi_reg_rd_96:
	mov	0xb, %r14
	.word 0xfadb8e60  ! 2038: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb32de001  ! 2040: SLL_I	sll 	%r23, 0x0001, %r25
	.word 0xf69521e0  ! 2042: LDUHA_I	lduha	[%r20, + 0x01e0] %asi, %r27
T2_asi_reg_rd_97:
	mov	0x31, %r14
	.word 0xf8db8e40  ! 2044: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T2_asi_reg_rd_98:
	mov	0x3c5, %r14
	.word 0xfedb84a0  ! 2045: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T2_asi_reg_wr_91:
	mov	0x14, %r14
	.word 0xf0f384a0  ! 2049: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
T2_asi_reg_rd_99:
	mov	0x3c4, %r14
	.word 0xfadb8400  ! 2050: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_2_162:
	setx	0x2c012f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_163:
	setx	0x2c0311, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_100:
	mov	0x3c5, %r14
	.word 0xf2db8e60  ! 2055: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xf0c561c3  ! 2059: LDSWA_I	ldswa	[%r21, + 0x01c3] %asi, %r24
	.word 0xfc5460f5  ! 2060: LDSH_I	ldsh	[%r17 + 0x00f5], %r30
T2_asi_reg_wr_92:
	mov	0x3c3, %r14
	.word 0xf0f389e0  ! 2061: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
cpu_intr_2_164:
	setx	0x2d0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfccdc020  ! 2064: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r30
cpu_intr_2_165:
	setx	0x2d0219, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_101:
	mov	0x0, %r14
	.word 0xf6db84a0  ! 2067: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T2_asi_reg_rd_102:
	mov	0x3c5, %r14
	.word 0xf0db84a0  ! 2068: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xfc8c8020  ! 2071: LDUBA_R	lduba	[%r18, %r0] 0x01, %r30
	.word 0xbc8ce1ff  ! 2073: ANDcc_I	andcc 	%r19, 0x01ff, %r30
cpu_intr_2_166:
	setx	0x2d0236, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_167:
	setx	0x2c0128, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_93:
	mov	0x33, %r14
	.word 0xf2f389e0  ! 2078: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_2_168:
	setx	0x2e0333, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_2_172:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_172), 16, 16)) -> intp(2, 0, 37)
T2_asi_reg_wr_94:
	mov	0x32, %r14
	.word 0xf2f384a0  ! 2091: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb285c000  ! 2092: ADDcc_R	addcc 	%r23, %r0, %r25
T2_asi_reg_rd_103:
	mov	0x1f, %r14
	.word 0xf6db8e60  ! 2093: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
cpu_intr_2_169:
	setx	0x2d0114, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_95:
	mov	0x3c1, %r14
	.word 0xfcf38e40  ! 2098: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf25dc000  ! 2099: LDX_R	ldx	[%r23 + %r0], %r25
T2_asi_reg_rd_104:
	mov	0x29, %r14
	.word 0xfcdb8e60  ! 2103: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_2_173:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_173), 16, 16)) -> intp(2, 0, 2d)
	.word 0xb414c000  ! 2106: OR_R	or 	%r19, %r0, %r26
	.word 0xb88ce026  ! 2107: ANDcc_I	andcc 	%r19, 0x0026, %r28
T2_asi_reg_wr_96:
	mov	0x2c, %r14
	.word 0xf0f38e40  ! 2108: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_2_170:
	setx	0x2e002f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb150c000  ! 2112: RDPR_TT	<illegal instruction>
iob_intr_2_174:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_174), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_rd_105:
	mov	0x0, %r14
	.word 0xfcdb8400  ! 2123: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf615605e  ! 2125: LDUH_I	lduh	[%r21 + 0x005e], %r27
T2_asi_reg_rd_106:
	mov	0x7, %r14
	.word 0xfedb89e0  ! 2128: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfcdde0c9  ! 2129: LDXA_I	ldxa	[%r23, + 0x00c9] %asi, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf64420b7  ! 2131: LDSW_I	ldsw	[%r16 + 0x00b7], %r27
T2_asi_reg_wr_97:
	mov	0x24, %r14
	.word 0xfaf38e40  ! 2132: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_175:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_175), 16, 16)) -> intp(2, 0, 12)
cpu_intr_2_171:
	setx	0x2c000f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_172:
	setx	0x2e002e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_173:
	setx	0x2c031c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_174:
	setx	0x2f021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba2de0a1  ! 2146: ANDN_I	andn 	%r23, 0x00a1, %r29
	.word 0xf4c50020  ! 2147: LDSWA_R	ldswa	[%r20, %r0] 0x01, %r26
	setx	data_start_6, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983e5a  ! 2149: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e5a, %hpstate
cpu_intr_2_175:
	setx	0x2c013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb425c000  ! 2151: SUB_R	sub 	%r23, %r0, %r26
	setx	data_start_6, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983b4a  ! 2153: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b4a, %hpstate
	.word 0xf885a10e  ! 2154: LDUWA_I	lduwa	[%r22, + 0x010e] %asi, %r28
	.word 0xfe8c6142  ! 2155: LDUBA_I	lduba	[%r17, + 0x0142] %asi, %r31
	.word 0xf4846144  ! 2156: LDUWA_I	lduwa	[%r17, + 0x0144] %asi, %r26
T2_asi_reg_wr_98:
	mov	0x34, %r14
	.word 0xf6f38e40  ! 2157: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_2_176:
	setx	0x2c033f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_107:
	mov	0x26, %r14
	.word 0xfcdb8400  ! 2164: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xf2dca061  ! 2167: LDXA_I	ldxa	[%r18, + 0x0061] %asi, %r25
	.word 0xfa550000  ! 2169: LDSH_R	ldsh	[%r20 + %r0], %r29
cpu_intr_2_177:
	setx	0x20205, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_178:
	setx	0x2c0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0444000  ! 2177: LDSW_R	ldsw	[%r17 + %r0], %r24
cpu_intr_2_179:
	setx	0x2d0235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb643801  ! 2180: MOVcc_I	<illegal instruction>
	.word 0xf80d4000  ! 2186: LDUB_R	ldub	[%r21 + %r0], %r28
	.word 0xf4dce15f  ! 2187: LDXA_I	ldxa	[%r19, + 0x015f] %asi, %r26
T2_asi_reg_wr_99:
	mov	0x8, %r14
	.word 0xfcf38e40  ! 2188: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf08da13c  ! 2190: LDUBA_I	lduba	[%r22, + 0x013c] %asi, %r24
cpu_intr_2_180:
	setx	0x2f0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa448000  ! 2192: LDSW_R	ldsw	[%r18 + %r0], %r29
	.word 0xfe85a0ca  ! 2193: LDUWA_I	lduwa	[%r22, + 0x00ca] %asi, %r31
T2_asi_reg_wr_100:
	mov	0x36, %r14
	.word 0xfef384a0  ! 2196: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xf8d4c020  ! 2197: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r28
T2_asi_reg_rd_108:
	mov	0x35, %r14
	.word 0xfadb8e40  ! 2198: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_TO_TL0
iob_intr_2_176:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_176), 16, 16)) -> intp(2, 0, 12)
T2_asi_reg_wr_101:
	mov	0x1b, %r14
	.word 0xf6f38e40  ! 2207: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfc558000  ! 2209: LDSH_R	ldsh	[%r22 + %r0], %r30
	setx	data_start_7, %g1, %r19
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r19, [%g1] 0x58
	.word 0x81983cc0  ! 2210: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc0, %hpstate
T2_asi_reg_rd_109:
	mov	0x9, %r14
	.word 0xfedb8e40  ! 2211: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf6dc609f  ! 2216: LDXA_I	ldxa	[%r17, + 0x009f] %asi, %r27
	.word 0xfa85a03b  ! 2217: LDUWA_I	lduwa	[%r22, + 0x003b] %asi, %r29
iob_intr_2_177:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_177), 16, 16)) -> intp(2, 0, 3)
T2_asi_reg_rd_110:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 2220: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_2_178:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_178), 16, 16)) -> intp(2, 0, 22)
iob_intr_2_179:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_179), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_rd_111:
	mov	0x3c7, %r14
	.word 0xfadb8e40  ! 2226: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf6d54020  ! 2227: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r27
T2_asi_reg_rd_112:
	mov	0x14, %r14
	.word 0xf6db8400  ! 2229: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
iob_intr_2_180:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_180), 16, 16)) -> intp(2, 0, 25)
	.word 0xb12c9000  ! 2234: SLLX_R	sllx	%r18, %r0, %r24
	.word 0xb1352001  ! 2236: SRL_I	srl 	%r20, 0x0001, %r24
cpu_intr_2_181:
	setx	0x2d0334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_181:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_181), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_182:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_182), 16, 16)) -> intp(2, 0, 2a)
T2_asi_reg_rd_113:
	mov	0x3c0, %r14
	.word 0xf0db8e80  ! 2242: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_2_182:
	setx	0x2c0126, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_183:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_183), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_wr_102:
	mov	0x3c2, %r14
	.word 0xf8f38e40  ! 2249: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_184:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_184), 16, 16)) -> intp(2, 0, 2)
	.word 0xf64ce182  ! 2251: LDSB_I	ldsb	[%r19 + 0x0182], %r27
cpu_intr_2_183:
	setx	0x2c0107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe05e1e2  ! 2255: ADD_I	add 	%r23, 0x01e2, %r31
	.word 0xfc55e1f8  ! 2256: LDSH_I	ldsh	[%r23 + 0x01f8], %r30
iob_intr_2_185:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_185), 16, 16)) -> intp(2, 0, 1d)
iob_intr_2_186:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_186), 16, 16)) -> intp(2, 0, 21)
	.word 0xf655a0a3  ! 2260: LDSH_I	ldsh	[%r22 + 0x00a3], %r27
	.word 0xf84c0000  ! 2261: LDSB_R	ldsb	[%r16 + %r0], %r28
iob_intr_2_187:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_187), 16, 16)) -> intp(2, 0, 27)
	.word 0xf8c421b8  ! 2263: LDSWA_I	ldswa	[%r16, + 0x01b8] %asi, %r28
	.word 0xfc44c000  ! 2264: LDSW_R	ldsw	[%r19 + %r0], %r30
	.word 0xb1359000  ! 2268: SRLX_R	srlx	%r22, %r0, %r24
	.word 0xfe058000  ! 2270: LDUW_R	lduw	[%r22 + %r0], %r31
cpu_intr_2_184:
	setx	0x30000c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_103:
	mov	0x2d, %r14
	.word 0xf4f38400  ! 2273: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
	.word 0xbc15e138  ! 2277: OR_I	or 	%r23, 0x0138, %r30
	.word 0xba34e06c  ! 2280: ORN_I	orn 	%r19, 0x006c, %r29
	.word 0xf405c000  ! 2283: LDUW_R	lduw	[%r23 + %r0], %r26
T2_asi_reg_wr_104:
	mov	0x35, %r14
	.word 0xf6f38400  ! 2285: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xf6542162  ! 2286: LDSH_I	ldsh	[%r16 + 0x0162], %r27
	.word 0xb4c461a4  ! 2287: ADDCcc_I	addccc 	%r17, 0x01a4, %r26
	.word 0xfcd5e0a1  ! 2289: LDSHA_I	ldsha	[%r23, + 0x00a1] %asi, %r30
T2_asi_reg_rd_114:
	mov	0x1, %r14
	.word 0xf6db8e40  ! 2290: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_rd_115:
	mov	0x36, %r14
	.word 0xf4db84a0  ! 2291: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	ta	T_CHANGE_TO_TL0
T2_asi_reg_wr_105:
	mov	0x2b, %r14
	.word 0xf8f38e40  ! 2295: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_2_188:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_188), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_rd_116:
	mov	0x2, %r14
	.word 0xf2db8e60  ! 2297: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xfa548000  ! 2299: LDSH_R	ldsh	[%r18 + %r0], %r29
	.word 0xf454a118  ! 2301: LDSH_I	ldsh	[%r18 + 0x0118], %r26
	.word 0xfc544000  ! 2302: LDSH_R	ldsh	[%r17 + %r0], %r30
cpu_intr_2_185:
	setx	0x330335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbec58000  ! 2310: ADDCcc_R	addccc 	%r22, %r0, %r31
cpu_intr_2_186:
	setx	0x33021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cc4020  ! 2312: LDSBA_R	ldsba	[%r17, %r0] 0x01, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb8458000  ! 2319: ADDC_R	addc 	%r22, %r0, %r28
T2_asi_reg_rd_117:
	mov	0x7, %r14
	.word 0xf2db84a0  ! 2321: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf48ce0ac  ! 2323: LDUBA_I	lduba	[%r19, + 0x00ac] %asi, %r26
	.word 0xb41da0b0  ! 2324: XOR_I	xor 	%r22, 0x00b0, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb2852137  ! 2327: ADDcc_I	addcc 	%r20, 0x0137, %r25
	ta	T_CHANGE_TO_TL1
T2_asi_reg_wr_106:
	mov	0x30, %r14
	.word 0xf8f384a0  ! 2329: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xfc94e08e  ! 2335: LDUHA_I	lduha	[%r19, + 0x008e] %asi, %r30
iob_intr_2_189:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_189), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_190:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_190), 16, 16)) -> intp(2, 0, 7)
T2_asi_reg_rd_118:
	mov	0x38, %r14
	.word 0xf0db84a0  ! 2341: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_2_187:
	setx	0x320309, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_119:
	mov	0x3c0, %r14
	.word 0xfcdb8e60  ! 2345: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xf4452158  ! 2346: LDSW_I	ldsw	[%r20 + 0x0158], %r26
	.word 0xb7359000  ! 2349: SRLX_R	srlx	%r22, %r0, %r27
	ta	T_CHANGE_HPRIV
iob_intr_2_191:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_191), 16, 16)) -> intp(2, 0, 2e)
	.word 0xa1902000  ! 2354: WRPR_GL_I	wrpr	%r0, 0x0000, %-
cpu_intr_2_188:
	setx	0x32031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa4d61ca  ! 2357: LDSB_I	ldsb	[%r21 + 0x01ca], %r29
	.word 0xfe55c000  ! 2358: LDSH_R	ldsh	[%r23 + %r0], %r31
	.word 0xb824a005  ! 2359: SUB_I	sub 	%r18, 0x0005, %r28
iob_intr_2_192:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_192), 16, 16)) -> intp(2, 0, 3d)
	.word 0xb8a48000  ! 2362: SUBcc_R	subcc 	%r18, %r0, %r28
iob_intr_2_193:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_193), 16, 16)) -> intp(2, 0, 2b)
T2_asi_reg_rd_120:
	mov	0x29, %r14
	.word 0xf8db84a0  ! 2366: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_2_194:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_194), 16, 16)) -> intp(2, 0, 36)
iob_intr_2_195:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_195), 16, 16)) -> intp(2, 0, 13)
	.word 0xf0146077  ! 2372: LDUH_I	lduh	[%r17 + 0x0077], %r24
cpu_intr_2_189:
	setx	0x30010b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_107:
	mov	0x2f, %r14
	.word 0xfcf38e60  ! 2374: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xfe548000  ! 2377: LDSH_R	ldsh	[%r18 + %r0], %r31
	setx	data_start_1, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81982998  ! 2379: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0998, %hpstate
	.word 0x8d9460c0  ! 2380: WRPR_PSTATE_I	wrpr	%r17, 0x00c0, %pstate
iob_intr_2_196:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_196), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_rd_121:
	mov	0x3c2, %r14
	.word 0xfadb8e40  ! 2388: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_2_190:
	setx	0x32002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_108:
	mov	0x2e, %r14
	.word 0xfcf38e40  ! 2392: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T2_asi_reg_rd_122:
	mov	0x14, %r14
	.word 0xfcdb8400  ! 2394: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
iob_intr_2_197:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_197), 16, 16)) -> intp(2, 0, 2d)
	ta	T_CHANGE_TO_TL0
iob_intr_2_198:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_198), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_199:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_199), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_191:
	setx	0x32032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc5c6158  ! 2412: LDX_I	ldx	[%r17 + 0x0158], %r30
	.word 0xf60c0000  ! 2414: LDUB_R	ldub	[%r16 + %r0], %r27
cpu_intr_2_192:
	setx	0x300116, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_109:
	mov	0x1a, %r14
	.word 0xf2f38e40  ! 2417: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
T2_asi_reg_wr_110:
	mov	0x1c, %r14
	.word 0xf6f38400  ! 2419: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	ta	T_CHANGE_NONHPRIV
iob_intr_2_200:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_200), 16, 16)) -> intp(2, 0, 23)
	.word 0xf8146114  ! 2423: LDUH_I	lduh	[%r17 + 0x0114], %r28
	.word 0xf40d4000  ! 2425: LDUB_R	ldub	[%r21 + %r0], %r26
cpu_intr_2_193:
	setx	0x320139, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T2_asi_reg_rd_123:
	mov	0x20, %r14
	.word 0xfcdb8e40  ! 2430: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_124:
	mov	0x3c4, %r14
	.word 0xf0db8e60  ! 2432: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_rd_125:
	mov	0x3c6, %r14
	.word 0xfedb8e40  ! 2434: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_194:
	setx	0x30001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb77cc400  ! 2437: MOVR_R	movre	%r19, %r0, %r27
iob_intr_2_201:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_201), 16, 16)) -> intp(2, 0, 22)
	ta	T_CHANGE_TO_TL0
iob_intr_2_202:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_202), 16, 16)) -> intp(2, 0, 13)
iob_intr_2_203:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_203), 16, 16)) -> intp(2, 0, 1d)
	.word 0xf6058000  ! 2452: LDUW_R	lduw	[%r22 + %r0], %r27
T2_asi_reg_wr_111:
	mov	0x3c6, %r14
	.word 0xf0f389e0  ! 2453: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_2_204:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_204), 16, 16)) -> intp(2, 0, 1f)
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_126:
	mov	0xd, %r14
	.word 0xf2db8e60  ! 2461: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_2_195:
	setx	0x300119, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf244a041  ! 2464: LDSW_I	ldsw	[%r18 + 0x0041], %r25
	setx	data_start_4, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x8198291a  ! 2465: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091a, %hpstate
iob_intr_2_205:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_205), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf08d4020  ! 2467: LDUBA_R	lduba	[%r21, %r0] 0x01, %r24
	.word 0xf40421f4  ! 2468: LDUW_I	lduw	[%r16 + 0x01f4], %r26
	.word 0xf8144000  ! 2469: LDUH_R	lduh	[%r17 + %r0], %r28
	.word 0x879460a2  ! 2470: WRPR_TT_I	wrpr	%r17, 0x00a2, %tt
cpu_intr_2_196:
	setx	0x320313, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_2_206:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_206), 16, 16)) -> intp(2, 0, 28)
	.word 0xfccdc020  ! 2482: LDSBA_R	ldsba	[%r23, %r0] 0x01, %r30
T2_asi_reg_rd_127:
	mov	0x3c8, %r14
	.word 0xf6db89e0  ! 2483: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_2_207:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_207), 16, 16)) -> intp(2, 0, 2c)
cpu_intr_2_197:
	setx	0x310219, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_198:
	setx	0x33001b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_128:
	mov	0x3c1, %r14
	.word 0xf0db8e80  ! 2491: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xf2cc8020  ! 2494: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r25
	.word 0xfc858020  ! 2496: LDUWA_R	lduwa	[%r22, %r0] 0x01, %r30
	.word 0xf8d5e0fa  ! 2498: LDSHA_I	ldsha	[%r23, + 0x00fa] %asi, %r28
	ta	T_CHANGE_TO_TL1
cpu_intr_2_199:
	setx	0x310328, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf604e167  ! 2508: LDUW_I	lduw	[%r19 + 0x0167], %r27
cpu_intr_2_200:
	setx	0x300318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfacd60a1  ! 2510: LDSBA_I	ldsba	[%r21, + 0x00a1] %asi, %r29
T2_asi_reg_rd_129:
	mov	0x30, %r14
	.word 0xfadb8e60  ! 2511: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	ta	T_CHANGE_NONHPRIV
	.word 0xf0844020  ! 2513: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r24
T2_asi_reg_wr_112:
	mov	0x11, %r14
	.word 0xf4f389e0  ! 2516: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb335a001  ! 2519: SRL_I	srl 	%r22, 0x0001, %r25
	.word 0xfa4ce16f  ! 2520: LDSB_I	ldsb	[%r19 + 0x016f], %r29
iob_intr_2_208:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_208), 16, 16)) -> intp(2, 0, 11)
	.word 0xba24a1fd  ! 2522: SUB_I	sub 	%r18, 0x01fd, %r29
	ta	T_CHANGE_TO_TL0
cpu_intr_2_201:
	setx	0x32000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_202:
	setx	0x310218, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_130:
	mov	0x3, %r14
	.word 0xf6db8400  ! 2531: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983dd0  ! 2532: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd0, %hpstate
T2_asi_reg_rd_131:
	mov	0x1d, %r14
	.word 0xf8db8e60  ! 2535: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xf0c40020  ! 2541: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_203:
	setx	0x310103, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_209:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_209), 16, 16)) -> intp(2, 0, 39)
T2_asi_reg_wr_113:
	mov	0x3c8, %r14
	.word 0xf8f38e60  ! 2547: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_2_204:
	setx	0x310212, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	data_start_3, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982d08  ! 2552: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d08, %hpstate
cpu_intr_2_205:
	setx	0x31012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9341000  ! 2555: SRLX_R	srlx	%r16, %r0, %r28
	.word 0xfc15c000  ! 2557: LDUH_R	lduh	[%r23 + %r0], %r30
	.word 0xf6d5c020  ! 2559: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r27
T2_asi_reg_rd_132:
	mov	0x27, %r14
	.word 0xfedb8e60  ! 2560: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T2_asi_reg_wr_114:
	mov	0x3c2, %r14
	.word 0xfaf38e40  ! 2561: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe44a0a7  ! 2563: LDSW_I	ldsw	[%r18 + 0x00a7], %r31
	.word 0xf80c4000  ! 2565: LDUB_R	ldub	[%r17 + %r0], %r28
T2_asi_reg_wr_115:
	mov	0x3c8, %r14
	.word 0xf0f38400  ! 2566: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xfa5d0000  ! 2567: LDX_R	ldx	[%r20 + %r0], %r29
T2_asi_reg_wr_116:
	mov	0x3c4, %r14
	.word 0xf8f38e80  ! 2568: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_2_210:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_210), 16, 16)) -> intp(2, 0, 19)
	.word 0xfc054000  ! 2570: LDUW_R	lduw	[%r21 + %r0], %r30
	.word 0xf0454000  ! 2571: LDSW_R	ldsw	[%r21 + %r0], %r24
T2_asi_reg_wr_117:
	mov	0x2c, %r14
	.word 0xfcf38e40  ! 2573: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf0948020  ! 2574: LDUHA_R	lduha	[%r18, %r0] 0x01, %r24
	.word 0xf8440000  ! 2575: LDSW_R	ldsw	[%r16 + %r0], %r28
T2_asi_reg_rd_133:
	mov	0x3c1, %r14
	.word 0xfadb8e40  ! 2578: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf215c000  ! 2581: LDUH_R	lduh	[%r23 + %r0], %r25
cpu_intr_2_206:
	setx	0x30022d, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_134:
	mov	0x1a, %r14
	.word 0xf4db89e0  ! 2584: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xfe5d6049  ! 2585: LDX_I	ldx	[%r21 + 0x0049], %r31
	.word 0xb6448000  ! 2586: ADDC_R	addc 	%r18, %r0, %r27
iob_intr_2_211:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_211), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_212:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_212), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_207:
	setx	0x300112, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_213:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_213), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_208:
	setx	0x320326, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xb13d8000  ! 2598: SRA_R	sra 	%r22, %r0, %r24
	.word 0xfe15e0c0  ! 2601: LDUH_I	lduh	[%r23 + 0x00c0], %r31
iob_intr_2_214:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_214), 16, 16)) -> intp(2, 0, 36)
	.word 0xf4cd2085  ! 2608: LDSBA_I	ldsba	[%r20, + 0x0085] %asi, %r26
T2_asi_reg_wr_118:
	mov	0x3c3, %r14
	.word 0xf8f38400  ! 2611: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_2_209:
	setx	0x30002d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45cc000  ! 2616: LDX_R	ldx	[%r19 + %r0], %r26
iob_intr_2_215:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_215), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf48561ef  ! 2618: LDUWA_I	lduwa	[%r21, + 0x01ef] %asi, %r26
cpu_intr_2_210:
	setx	0x31010b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_216:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_216), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_211:
	setx	0x31030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8ce15b  ! 2627: LDUBA_I	lduba	[%r19, + 0x015b] %asi, %r31
T2_asi_reg_wr_119:
	mov	0x3c2, %r14
	.word 0xf4f38e80  ! 2628: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
T2_asi_reg_wr_120:
	mov	0x3c0, %r14
	.word 0xfef38e60  ! 2630: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
T2_asi_reg_wr_121:
	mov	0x18, %r14
	.word 0xf8f38400  ! 2631: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
cpu_intr_2_212:
	setx	0x33033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfac5a152  ! 2633: LDSWA_I	ldswa	[%r22, + 0x0152] %asi, %r29
T2_asi_reg_wr_122:
	mov	0x3c6, %r14
	.word 0xf0f384a0  ! 2635: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xf8054000  ! 2637: LDUW_R	lduw	[%r21 + %r0], %r28
	.word 0xf4146073  ! 2638: LDUH_I	lduh	[%r17 + 0x0073], %r26
cpu_intr_2_213:
	setx	0x320207, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfec48020  ! 2642: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r31
	.word 0xf0dc2053  ! 2644: LDXA_I	ldxa	[%r16, + 0x0053] %asi, %r24
	.word 0xfe85616a  ! 2646: LDUWA_I	lduwa	[%r21, + 0x016a] %asi, %r31
	.word 0xb9641800  ! 2648: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_135:
	mov	0x0, %r14
	.word 0xfedb8400  ! 2651: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
iob_intr_2_217:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_217), 16, 16)) -> intp(2, 0, 34)
	.word 0xf0146100  ! 2653: LDUH_I	lduh	[%r17 + 0x0100], %r24
	.word 0xf245e155  ! 2654: LDSW_I	ldsw	[%r23 + 0x0155], %r25
	.word 0xbb2d5000  ! 2656: SLLX_R	sllx	%r21, %r0, %r29
cpu_intr_2_214:
	setx	0x330220, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_136:
	mov	0x1b, %r14
	.word 0xfedb84a0  ! 2660: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf014c000  ! 2664: LDUH_R	lduh	[%r19 + %r0], %r24
	.word 0xf2cc0020  ! 2666: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r25
	.word 0xb4c50000  ! 2668: ADDCcc_R	addccc 	%r20, %r0, %r26
iob_intr_2_218:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_218), 16, 16)) -> intp(2, 0, 3b)
	.word 0xfc45c000  ! 2670: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0xfa940020  ! 2672: LDUHA_R	lduha	[%r16, %r0] 0x01, %r29
	.word 0xf2d54020  ! 2674: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r25
iob_intr_2_219:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_219), 16, 16)) -> intp(2, 0, 13)
	.word 0xf04c8000  ! 2677: LDSB_R	ldsb	[%r18 + %r0], %r24
	.word 0xba940000  ! 2678: ORcc_R	orcc 	%r16, %r0, %r29
cpu_intr_2_215:
	setx	0x31010c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf644a155  ! 2683: LDSW_I	ldsw	[%r18 + 0x0155], %r27
iob_intr_2_220:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_220), 16, 16)) -> intp(2, 0, 30)
iob_intr_2_221:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_221), 16, 16)) -> intp(2, 0, 3a)
	.word 0xfe5dc000  ! 2687: LDX_R	ldx	[%r23 + %r0], %r31
	setx	data_start_7, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982d9a  ! 2689: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9a, %hpstate
cpu_intr_2_216:
	setx	0x300237, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_217:
	setx	0x310216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0048000  ! 2694: LDUW_R	lduw	[%r18 + %r0], %r24
cpu_intr_2_218:
	setx	0x30012e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec54020  ! 2701: LDSWA_R	ldswa	[%r21, %r0] 0x01, %r31
T2_asi_reg_rd_137:
	mov	0x21, %r14
	.word 0xfedb8e80  ! 2702: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xf8058000  ! 2704: LDUW_R	lduw	[%r22 + %r0], %r28
	.word 0xfa8d6133  ! 2705: LDUBA_I	lduba	[%r21, + 0x0133] %asi, %r29
	.word 0xfed461d6  ! 2708: LDSHA_I	ldsha	[%r17, + 0x01d6] %asi, %r31
iob_intr_2_222:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_222), 16, 16)) -> intp(2, 0, 28)
	.word 0xf854c000  ! 2713: LDSH_R	ldsh	[%r19 + %r0], %r28
iob_intr_2_223:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_223), 16, 16)) -> intp(2, 0, 22)
	.word 0xbd2de001  ! 2715: SLL_I	sll 	%r23, 0x0001, %r30
iob_intr_2_224:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_224), 16, 16)) -> intp(2, 0, 21)
	.word 0xfe4c617f  ! 2717: LDSB_I	ldsb	[%r17 + 0x017f], %r31
	.word 0xbb2d6001  ! 2719: SLL_I	sll 	%r21, 0x0001, %r29
T2_asi_reg_wr_123:
	mov	0x13, %r14
	.word 0xfaf389e0  ! 2720: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
cpu_intr_2_219:
	setx	0x350214, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_138:
	mov	0x1d, %r14
	.word 0xf8db8e80  ! 2725: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
T2_asi_reg_rd_139:
	mov	0x3c2, %r14
	.word 0xfedb84a0  ! 2726: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xf2548000  ! 2727: LDSH_R	ldsh	[%r18 + %r0], %r25
cpu_intr_2_220:
	setx	0x340123, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_221:
	setx	0x34033d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_222:
	setx	0x370128, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_223:
	setx	0x360105, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_225:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_225), 16, 16)) -> intp(2, 0, 29)
T2_asi_reg_wr_124:
	mov	0x1b, %r14
	.word 0xfaf38e60  ! 2740: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
T2_asi_reg_rd_140:
	mov	0x14, %r14
	.word 0xf8db84a0  ! 2742: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_2_226:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_226), 16, 16)) -> intp(2, 0, 15)
T2_asi_reg_rd_141:
	mov	0x0, %r14
	.word 0xfedb8e80  ! 2748: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
	.word 0xfcc5e0af  ! 2752: LDSWA_I	ldswa	[%r23, + 0x00af] %asi, %r30
cpu_intr_2_224:
	setx	0x350103, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_225:
	setx	0x340017, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6c4c020  ! 2760: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r27
	.word 0xbea5e11f  ! 2761: SUBcc_I	subcc 	%r23, 0x011f, %r31
	.word 0xf4cc60e2  ! 2765: LDSBA_I	ldsba	[%r17, + 0x00e2] %asi, %r26
cpu_intr_2_226:
	setx	0x370333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6140000  ! 2771: LDUH_R	lduh	[%r16 + %r0], %r27
T2_asi_reg_rd_142:
	mov	0x2d, %r14
	.word 0xf4db8e40  ! 2772: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfc95e021  ! 2773: LDUHA_I	lduha	[%r23, + 0x0021] %asi, %r30
cpu_intr_2_227:
	setx	0x370010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcb5c000  ! 2775: ORNcc_R	orncc 	%r23, %r0, %r30
	ta	T_CHANGE_TO_TL1
	.word 0xbea50000  ! 2777: SUBcc_R	subcc 	%r20, %r0, %r31
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1
iob_intr_2_227:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_227), 16, 16)) -> intp(2, 0, 25)
	.word 0xfeccc020  ! 2785: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r31
iob_intr_2_228:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_228), 16, 16)) -> intp(2, 0, e)
T2_asi_reg_rd_143:
	mov	0x3c0, %r14
	.word 0xf8db84a0  ! 2790: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_2_229:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_229), 16, 16)) -> intp(2, 0, 27)
cpu_intr_2_228:
	setx	0x350026, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_229:
	setx	0x350303, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb49560ee  ! 2804: ORcc_I	orcc 	%r21, 0x00ee, %r26
	.word 0xf0950020  ! 2805: LDUHA_R	lduha	[%r20, %r0] 0x01, %r24
iob_intr_2_230:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_230), 16, 16)) -> intp(2, 0, 4)
	.word 0xfc5ce01b  ! 2808: LDX_I	ldx	[%r19 + 0x001b], %r30
T2_asi_reg_wr_125:
	mov	0x3c6, %r14
	.word 0xf0f38e40  ! 2809: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf88d2033  ! 2811: LDUBA_I	lduba	[%r20, + 0x0033] %asi, %r28
	.word 0xf6d40020  ! 2812: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r27
	.word 0xfe5d8000  ! 2813: LDX_R	ldx	[%r22 + %r0], %r31
T2_asi_reg_wr_126:
	mov	0x3c3, %r14
	.word 0xf0f389e0  ! 2814: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
T2_asi_reg_rd_144:
	mov	0x15, %r14
	.word 0xf0db8e60  ! 2817: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T2_asi_reg_wr_127:
	mov	0x12, %r14
	.word 0xf4f38e60  ! 2818: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_2_230:
	setx	0x370201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44d21a4  ! 2821: LDSB_I	ldsb	[%r20 + 0x01a4], %r26
cpu_intr_2_231:
	setx	0x35001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL0
iob_intr_2_231:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_231), 16, 16)) -> intp(2, 0, 21)
cpu_intr_2_232:
	setx	0x35000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_145:
	mov	0x13, %r14
	.word 0xf2db89e0  ! 2836: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
T2_asi_reg_wr_128:
	mov	0x3c0, %r14
	.word 0xf2f38e80  ! 2837: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb605c000  ! 2838: ADD_R	add 	%r23, %r0, %r27
	.word 0xfad40020  ! 2841: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r29
	.word 0xb4bd61c0  ! 2842: XNORcc_I	xnorcc 	%r21, 0x01c0, %r26
iob_intr_2_232:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_232), 16, 16)) -> intp(2, 0, 1)
	ta	T_CHANGE_HPRIV
iob_intr_2_233:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_233), 16, 16)) -> intp(2, 0, 35)
	.word 0xfa44c000  ! 2854: LDSW_R	ldsw	[%r19 + %r0], %r29
T2_asi_reg_wr_129:
	mov	0x3c5, %r14
	.word 0xf0f38e60  ! 2855: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xf484e0d9  ! 2858: LDUWA_I	lduwa	[%r19, + 0x00d9] %asi, %r26
	.word 0xb40cc000  ! 2860: AND_R	and 	%r19, %r0, %r26
	.word 0xb550c000  ! 2863: RDPR_TT	<illegal instruction>
iob_intr_2_234:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_234), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_235:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_235), 16, 16)) -> intp(2, 0, 36)
cpu_intr_2_233:
	setx	0x37013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5d0000  ! 2873: LDX_R	ldx	[%r20 + %r0], %r31
cpu_intr_2_234:
	setx	0x35022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_130:
	mov	0x3c6, %r14
	.word 0xf6f38e40  ! 2877: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xf45c605d  ! 2878: LDX_I	ldx	[%r17 + 0x005d], %r26
	.word 0xf015c000  ! 2880: LDUH_R	lduh	[%r23 + %r0], %r24
T2_asi_reg_wr_131:
	mov	0x3c6, %r14
	.word 0xfef384a0  ! 2883: STXA_R	stxa	%r31, [%r14 + %r0] 0x25
	.word 0xb2bce10b  ! 2884: XNORcc_I	xnorcc 	%r19, 0x010b, %r25
T2_asi_reg_wr_132:
	mov	0x2f, %r14
	.word 0xfcf38e40  ! 2885: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_235:
	setx	0x340116, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_133:
	mov	0x34, %r14
	.word 0xf6f38e80  ! 2887: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
T2_asi_reg_wr_134:
	mov	0x13, %r14
	.word 0xfcf38e40  ! 2888: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xf014a01a  ! 2889: LDUH_I	lduh	[%r18 + 0x001a], %r24
T2_asi_reg_rd_146:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 2890: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_2_236:
	setx	0x370316, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_135:
	mov	0x3c5, %r14
	.word 0xfcf38400  ! 2893: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xfe958020  ! 2897: LDUHA_R	lduha	[%r22, %r0] 0x01, %r31
iob_intr_2_236:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_236), 16, 16)) -> intp(2, 0, 12)
T2_asi_reg_wr_136:
	mov	0x1, %r14
	.word 0xf4f389e0  ! 2900: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xfe0dc000  ! 2908: LDUB_R	ldub	[%r23 + %r0], %r31
cpu_intr_2_237:
	setx	0x360008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_238:
	setx	0x36022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8cce1b5  ! 2913: LDSBA_I	ldsba	[%r19, + 0x01b5] %asi, %r28
	.word 0xf0144000  ! 2914: LDUH_R	lduh	[%r17 + %r0], %r24
T2_asi_reg_wr_137:
	mov	0x19, %r14
	.word 0xf0f384a0  ! 2915: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_2_239:
	setx	0x35020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_237:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_237), 16, 16)) -> intp(2, 0, 1b)
	.word 0xf0dde040  ! 2923: LDXA_I	ldxa	[%r23, + 0x0040] %asi, %r24
	.word 0xf015a1c4  ! 2927: LDUH_I	lduh	[%r22 + 0x01c4], %r24
	.word 0xf8cd0020  ! 2929: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r28
T2_asi_reg_wr_138:
	mov	0x3c6, %r14
	.word 0xfcf384a0  ! 2930: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_2_238:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_238), 16, 16)) -> intp(2, 0, 36)
iob_intr_2_239:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_239), 16, 16)) -> intp(2, 0, 3b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_240:
	setx	0x340309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe8c4020  ! 2947: LDUBA_R	lduba	[%r17, %r0] 0x01, %r31
	.word 0xf844e0d3  ! 2949: LDSW_I	ldsw	[%r19 + 0x00d3], %r28
cpu_intr_2_241:
	setx	0x370133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf845c000  ! 2951: LDSW_R	ldsw	[%r23 + %r0], %r28
T2_asi_reg_rd_147:
	mov	0x3c7, %r14
	.word 0xf8db8e80  ! 2952: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb8358000  ! 2955: SUBC_R	orn 	%r22, %r0, %r28
cpu_intr_2_242:
	setx	0x34003c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb21de06f  ! 2959: XOR_I	xor 	%r23, 0x006f, %r25
	.word 0xb23560b3  ! 2960: SUBC_I	orn 	%r21, 0x00b3, %r25
T2_asi_reg_wr_139:
	mov	0x3c8, %r14
	.word 0xf2f38e80  ! 2961: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xf0cde182  ! 2963: LDSBA_I	ldsba	[%r23, + 0x0182] %asi, %r24
T2_asi_reg_wr_140:
	mov	0x3c2, %r14
	.word 0xfef38e60  ! 2964: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_2_243:
	setx	0x35023f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_141:
	mov	0xb, %r14
	.word 0xf8f38400  ! 2968: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xba954000  ! 2970: ORcc_R	orcc 	%r21, %r0, %r29
	.word 0xb62d8000  ! 2974: ANDN_R	andn 	%r22, %r0, %r27
	.word 0xf2dce134  ! 2978: LDXA_I	ldxa	[%r19, + 0x0134] %asi, %r25
iob_intr_2_240:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_240), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfa5d0000  ! 2984: LDX_R	ldx	[%r20 + %r0], %r29
	.word 0xb72c6001  ! 2987: SLL_I	sll 	%r17, 0x0001, %r27
	.word 0xb72c7001  ! 2988: SLLX_I	sllx	%r17, 0x0001, %r27
	.word 0xb4bca05b  ! 2990: XNORcc_I	xnorcc 	%r18, 0x005b, %r26
	.word 0xb60d8000  ! 2991: AND_R	and 	%r22, %r0, %r27
	.word 0xf405c000  ! 2992: LDUW_R	lduw	[%r23 + %r0], %r26
iob_intr_2_241:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_241), 16, 16)) -> intp(2, 0, 35)
cpu_intr_2_244:
	setx	0x340130, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8561f4  ! 2996: LDUWA_I	lduwa	[%r21, + 0x01f4] %asi, %r29
	.word 0xbc2ca0f9  ! 2997: ANDN_I	andn 	%r18, 0x00f9, %r30
cpu_intr_2_245:
	setx	0x370303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_246:
	setx	0x350317, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe44e018  ! 3001: LDSW_I	ldsw	[%r19 + 0x0018], %r31
	.word 0xfa15e132  ! 3002: LDUH_I	lduh	[%r23 + 0x0132], %r29
iob_intr_2_242:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_242), 16, 16)) -> intp(2, 0, 3f)
iob_intr_2_243:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_243), 16, 16)) -> intp(2, 0, 2d)
	.word 0xb60da0ad  ! 3010: AND_I	and 	%r22, 0x00ad, %r27
	.word 0xf68c2102  ! 3011: LDUBA_I	lduba	[%r16, + 0x0102] %asi, %r27
iob_intr_2_244:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_244), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_rd_148:
	mov	0x3c4, %r14
	.word 0xf0db84a0  ! 3021: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xf85c8000  ! 3025: LDX_R	ldx	[%r18 + %r0], %r28
	.word 0xf49420ef  ! 3026: LDUHA_I	lduha	[%r16, + 0x00ef] %asi, %r26
	.word 0xf80d61a4  ! 3027: LDUB_I	ldub	[%r21 + 0x01a4], %r28
	.word 0xf8d460cc  ! 3028: LDSHA_I	ldsha	[%r17, + 0x00cc] %asi, %r28
	.word 0xf45d0000  ! 3031: LDX_R	ldx	[%r20 + %r0], %r26
cpu_intr_2_247:
	setx	0x350208, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_142:
	mov	0x3c2, %r14
	.word 0xfef38400  ! 3033: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
T2_asi_reg_wr_143:
	mov	0x36, %r14
	.word 0xf2f38400  ! 3034: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_2_248:
	setx	0x340235, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_149:
	mov	0x2e, %r14
	.word 0xf6db8e60  ! 3039: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	ta	T_CHANGE_NONHPRIV
	.word 0xf855204b  ! 3043: LDSH_I	ldsh	[%r20 + 0x004b], %r28
	.word 0xf08d0020  ! 3045: LDUBA_R	lduba	[%r20, %r0] 0x01, %r24
T2_asi_reg_rd_150:
	mov	0x3, %r14
	.word 0xf6db8e40  ! 3046: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
T2_asi_reg_wr_144:
	mov	0x3c3, %r14
	.word 0xf2f38e60  ! 3048: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_2_249:
	setx	0x360304, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_245:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_245), 16, 16)) -> intp(2, 0, 15)
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_145:
	mov	0x22, %r14
	.word 0xfef38400  ! 3056: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb0348000  ! 3057: SUBC_R	orn 	%r18, %r0, %r24
	ta	T_CHANGE_NONHPRIV
	.word 0xf68dc020  ! 3060: LDUBA_R	lduba	[%r23, %r0] 0x01, %r27
	.word 0xf2856104  ! 3063: LDUWA_I	lduwa	[%r21, + 0x0104] %asi, %r25
iob_intr_2_246:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_246), 16, 16)) -> intp(2, 0, 12)
	.word 0xa1902000  ! 3068: WRPR_GL_I	wrpr	%r0, 0x0000, %-
iob_intr_2_247:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_247), 16, 16)) -> intp(2, 0, 2)
	.word 0xfadca185  ! 3072: LDXA_I	ldxa	[%r18, + 0x0185] %asi, %r29
	.word 0xf655e1a0  ! 3073: LDSH_I	ldsh	[%r23 + 0x01a0], %r27
	ta	T_CHANGE_HPRIV
	.word 0xb4bd4000  ! 3075: XNORcc_R	xnorcc 	%r21, %r0, %r26
T2_asi_reg_wr_146:
	mov	0x25, %r14
	.word 0xf6f38400  ! 3077: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_248:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_248), 16, 16)) -> intp(2, 0, 25)
cpu_intr_2_250:
	setx	0x34032d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_2_249:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_249), 16, 16)) -> intp(2, 0, 22)
	.word 0xf8c44020  ! 3086: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r28
	ta	T_CHANGE_TO_TL0
	.word 0xf2844020  ! 3089: LDUWA_R	lduwa	[%r17, %r0] 0x01, %r25
cpu_intr_2_251:
	setx	0x350335, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_252:
	setx	0x34001c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_151:
	mov	0x3c4, %r14
	.word 0xfcdb8e80  ! 3097: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xfcc48020  ! 3098: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r30
T2_asi_reg_wr_147:
	mov	0x3c7, %r14
	.word 0xf2f38e60  ! 3102: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_2_253:
	setx	0x35031b, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_152:
	mov	0xe, %r14
	.word 0xf8db8400  ! 3110: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_2_254:
	setx	0x36023f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf045c000  ! 3115: LDSW_R	ldsw	[%r23 + %r0], %r24
T2_asi_reg_rd_153:
	mov	0x23, %r14
	.word 0xfadb8e40  ! 3116: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
cpu_intr_2_255:
	setx	0x340330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0ce1df  ! 3118: LDUB_I	ldub	[%r19 + 0x01df], %r29
	.word 0xfc0c8000  ! 3121: LDUB_R	ldub	[%r18 + %r0], %r30
iob_intr_2_250:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_250), 16, 16)) -> intp(2, 0, c)
	.word 0xfcdc6169  ! 3124: LDXA_I	ldxa	[%r17, + 0x0169] %asi, %r30
	.word 0xf0dce02d  ! 3127: LDXA_I	ldxa	[%r19, + 0x002d] %asi, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf0048000  ! 3129: LDUW_R	lduw	[%r18 + %r0], %r24
iob_intr_2_251:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_251), 16, 16)) -> intp(2, 0, 3e)
iob_intr_2_252:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_252), 16, 16)) -> intp(2, 0, 33)
	.word 0xfc4d6173  ! 3136: LDSB_I	ldsb	[%r21 + 0x0173], %r30
cpu_intr_2_256:
	setx	0x360039, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_253:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_253), 16, 16)) -> intp(2, 0, 1f)
	.word 0xfa44a0fa  ! 3143: LDSW_I	ldsw	[%r18 + 0x00fa], %r29
cpu_intr_2_257:
	setx	0x37023c, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_148:
	mov	0x7, %r14
	.word 0xf0f38e80  ! 3147: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T2_asi_reg_wr_149:
	mov	0x2f, %r14
	.word 0xf6f38400  ! 3148: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
T2_asi_reg_wr_150:
	mov	0x25, %r14
	.word 0xfef38e40  ! 3149: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_rd_154:
	mov	0x3c6, %r14
	.word 0xfcdb8e80  ! 3151: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_2_254:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_254), 16, 16)) -> intp(2, 0, 38)
T2_asi_reg_rd_155:
	mov	0x28, %r14
	.word 0xfcdb8e40  ! 3154: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xa1902000  ! 3158: WRPR_GL_I	wrpr	%r0, 0x0000, %-
iob_intr_2_255:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_255), 16, 16)) -> intp(2, 0, 34)
T2_asi_reg_wr_151:
	mov	0x2c, %r14
	.word 0xfef38e80  ! 3164: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
cpu_intr_2_258:
	setx	0x37003c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_256:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_256), 16, 16)) -> intp(2, 0, 1d)
T2_asi_reg_wr_152:
	mov	0x25, %r14
	.word 0xf6f389e0  ! 3174: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xf6c58020  ! 3175: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r27
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982940  ! 3177: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0940, %hpstate
iob_intr_2_257:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_257), 16, 16)) -> intp(2, 0, 21)
cpu_intr_2_259:
	setx	0x390011, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_258:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_258), 16, 16)) -> intp(2, 0, 38)
	.word 0xf6556039  ! 3186: LDSH_I	ldsh	[%r21 + 0x0039], %r27
	.word 0xf0cd0020  ! 3187: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r24
	.word 0xf45dc000  ! 3190: LDX_R	ldx	[%r23 + %r0], %r26
T2_asi_reg_rd_156:
	mov	0xc, %r14
	.word 0xfedb8e60  ! 3191: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_2_259:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_259), 16, 16)) -> intp(2, 0, 1c)
cpu_intr_2_260:
	setx	0x3b010a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_260:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_260), 16, 16)) -> intp(2, 0, 33)
	ta	T_CHANGE_TO_TL0
	.word 0xf6958020  ! 3205: LDUHA_R	lduha	[%r22, %r0] 0x01, %r27
	.word 0xf2444000  ! 3207: LDSW_R	ldsw	[%r17 + %r0], %r25
iob_intr_2_261:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_261), 16, 16)) -> intp(2, 0, 34)
	.word 0xb13c5000  ! 3213: SRAX_R	srax	%r17, %r0, %r24
	.word 0xb5350000  ! 3215: SRL_R	srl 	%r20, %r0, %r26
cpu_intr_2_261:
	setx	0x39011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0d4000  ! 3221: LDUB_R	ldub	[%r21 + %r0], %r29
	.word 0xb615a0ea  ! 3222: OR_I	or 	%r22, 0x00ea, %r27
	.word 0xfec58020  ! 3224: LDSWA_R	ldswa	[%r22, %r0] 0x01, %r31
	.word 0xfe45a12c  ! 3227: LDSW_I	ldsw	[%r22 + 0x012c], %r31
T2_asi_reg_wr_153:
	mov	0x22, %r14
	.word 0xf2f389e0  ! 3228: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_2_262:
	setx	0x380116, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_263:
	setx	0x38012d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_264:
	setx	0x380115, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_265:
	setx	0x38021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfccd0020  ! 3238: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r30
	.word 0xb0040000  ! 3243: ADD_R	add 	%r16, %r0, %r24
	setx	data_start_1, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81982c80  ! 3245: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c80, %hpstate
	.word 0xb73d6001  ! 3248: SRA_I	sra 	%r21, 0x0001, %r27
	.word 0xf695e13f  ! 3251: LDUHA_I	lduha	[%r23, + 0x013f] %asi, %r27
iob_intr_2_262:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_262), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_263:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_263), 16, 16)) -> intp(2, 0, 13)
T2_asi_reg_rd_157:
	mov	0x18, %r14
	.word 0xf0db89e0  ! 3255: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xfe0cc000  ! 3256: LDUB_R	ldub	[%r19 + %r0], %r31
T2_asi_reg_wr_154:
	mov	0x21, %r14
	.word 0xf0f38e60  ! 3260: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_2_266:
	setx	0x39013b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_264:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_264), 16, 16)) -> intp(2, 0, 2d)
cpu_intr_2_267:
	setx	0x3b0232, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_158:
	mov	0x18, %r14
	.word 0xf8db8400  ! 3266: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	ta	T_CHANGE_TO_TL1
cpu_intr_2_268:
	setx	0x3b001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa540000  ! 3270: LDSH_R	ldsh	[%r16 + %r0], %r29
	.word 0xf654e051  ! 3276: LDSH_I	ldsh	[%r19 + 0x0051], %r27
	.word 0xfe048000  ! 3278: LDUW_R	lduw	[%r18 + %r0], %r31
T2_asi_reg_rd_159:
	mov	0x2d, %r14
	.word 0xf2db8e80  ! 3280: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xb60c2090  ! 3282: AND_I	and 	%r16, 0x0090, %r27
	.word 0xb12c8000  ! 3283: SLL_R	sll 	%r18, %r0, %r24
	.word 0xfe45604a  ! 3284: LDSW_I	ldsw	[%r21 + 0x004a], %r31
	.word 0xfe958020  ! 3287: LDUHA_R	lduha	[%r22, %r0] 0x01, %r31
	.word 0xbe2c8000  ! 3290: ANDN_R	andn 	%r18, %r0, %r31
	.word 0xf64561f9  ! 3294: LDSW_I	ldsw	[%r21 + 0x01f9], %r27
	.word 0xb52db001  ! 3295: SLLX_I	sllx	%r22, 0x0001, %r26
	.word 0xfe5ca0ca  ! 3296: LDX_I	ldx	[%r18 + 0x00ca], %r31
	.word 0xf495e0ed  ! 3299: LDUHA_I	lduha	[%r23, + 0x00ed] %asi, %r26
	.word 0xbb34e001  ! 3300: SRL_I	srl 	%r19, 0x0001, %r29
	.word 0xf44de19f  ! 3302: LDSB_I	ldsb	[%r23 + 0x019f], %r26
	.word 0xf25c6155  ! 3303: LDX_I	ldx	[%r17 + 0x0155], %r25
	.word 0xb425e128  ! 3306: SUB_I	sub 	%r23, 0x0128, %r26
cpu_intr_2_269:
	setx	0x3a021a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_155:
	mov	0x2a, %r14
	.word 0xf6f38e80  ! 3308: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xf68da084  ! 3310: LDUBA_I	lduba	[%r22, + 0x0084] %asi, %r27
	.word 0xfc44a1d3  ! 3312: LDSW_I	ldsw	[%r18 + 0x01d3], %r30
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x81983f40  ! 3313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f40, %hpstate
	.word 0xfa0dc000  ! 3315: LDUB_R	ldub	[%r23 + %r0], %r29
	.word 0xb60da1a5  ! 3316: AND_I	and 	%r22, 0x01a5, %r27
	.word 0xfcc5a0e5  ! 3318: LDSWA_I	ldswa	[%r22, + 0x00e5] %asi, %r30
cpu_intr_2_270:
	setx	0x390204, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4950020  ! 3320: LDUHA_R	lduha	[%r20, %r0] 0x01, %r26
T2_asi_reg_wr_156:
	mov	0x25, %r14
	.word 0xf4f384a0  ! 3323: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xf05de04c  ! 3326: LDX_I	ldx	[%r23 + 0x004c], %r24
iob_intr_2_265:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_265), 16, 16)) -> intp(2, 0, 1e)
	.word 0xf05d4000  ! 3328: LDX_R	ldx	[%r21 + %r0], %r24
	.word 0xf68ce08c  ! 3330: LDUBA_I	lduba	[%r19, + 0x008c] %asi, %r27
T2_asi_reg_rd_160:
	mov	0x3c7, %r14
	.word 0xf2db84a0  ! 3335: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf4940020  ! 3336: LDUHA_R	lduha	[%r16, %r0] 0x01, %r26
	.word 0xb0bda109  ! 3337: XNORcc_I	xnorcc 	%r22, 0x0109, %r24
	.word 0xf2d58020  ! 3339: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r25
	.word 0xfc54a1d5  ! 3341: LDSH_I	ldsh	[%r18 + 0x01d5], %r30
	.word 0xf455c000  ! 3344: LDSH_R	ldsh	[%r23 + %r0], %r26
T2_asi_reg_wr_157:
	mov	0x3c6, %r14
	.word 0xf2f38e60  ! 3345: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
iob_intr_2_266:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_266), 16, 16)) -> intp(2, 0, 2e)
T2_asi_reg_wr_158:
	mov	0x3c0, %r14
	.word 0xf0f38400  ! 3351: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
cpu_intr_2_271:
	setx	0x390126, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfcc48020  ! 3357: LDSWA_R	ldswa	[%r18, %r0] 0x01, %r30
	ta	T_CHANGE_TO_TL1
	.word 0xf4452054  ! 3361: LDSW_I	ldsw	[%r20 + 0x0054], %r26
iob_intr_2_267:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_267), 16, 16)) -> intp(2, 0, 37)
	.word 0xf85c2057  ! 3364: LDX_I	ldx	[%r16 + 0x0057], %r28
	.word 0x919520b9  ! 3367: WRPR_PIL_I	wrpr	%r20, 0x00b9, %pil
T2_asi_reg_rd_161:
	mov	0x3c5, %r14
	.word 0xf4db8e40  ! 3368: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xfa1460ea  ! 3371: LDUH_I	lduh	[%r17 + 0x00ea], %r29
	.word 0xb37c6401  ! 3372: MOVR_I	movre	%r17, 0x1, %r25
	.word 0xf204207a  ! 3375: LDUW_I	lduw	[%r16 + 0x007a], %r25
	.word 0xfe8c6100  ! 3376: LDUBA_I	lduba	[%r17, + 0x0100] %asi, %r31
	.word 0xf6044000  ! 3379: LDUW_R	lduw	[%r17 + %r0], %r27
T2_asi_reg_wr_159:
	mov	0x3c5, %r14
	.word 0xfcf38e80  ! 3380: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T2_asi_reg_wr_160:
	mov	0x37, %r14
	.word 0xf2f384a0  ! 3382: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xfc0d8000  ! 3384: LDUB_R	ldub	[%r22 + %r0], %r30
	.word 0xbeb420c4  ! 3385: ORNcc_I	orncc 	%r16, 0x00c4, %r31
	ta	T_CHANGE_NONHPRIV
	.word 0xf48c8020  ! 3392: LDUBA_R	lduba	[%r18, %r0] 0x01, %r26
iob_intr_2_268:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_268), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_rd_162:
	mov	0x2, %r14
	.word 0xfadb8400  ! 3395: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_2_269:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_269), 16, 16)) -> intp(2, 0, 3b)
	ta	T_CHANGE_TO_TL0
cpu_intr_2_272:
	setx	0x3b0016, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_161:
	mov	0x27, %r14
	.word 0xf6f384a0  ! 3402: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf0ccc020  ! 3404: LDSBA_R	ldsba	[%r19, %r0] 0x01, %r24
iob_intr_2_270:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_270), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_wr_162:
	mov	0x3c1, %r14
	.word 0xf4f389e0  ! 3406: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_2_273:
	setx	0x3a0213, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_274:
	setx	0x380332, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
iob_intr_2_271:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_271), 16, 16)) -> intp(2, 0, 24)
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_163:
	mov	0x1, %r14
	.word 0xfadb8e60  ! 3416: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T2_asi_reg_wr_163:
	mov	0x0, %r14
	.word 0xf8f38e40  ! 3417: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbf3c1000  ! 3418: SRAX_R	srax	%r16, %r0, %r31
	.word 0xf854c000  ! 3420: LDSH_R	ldsh	[%r19 + %r0], %r28
	.word 0xf2cd0020  ! 3422: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r25
cpu_intr_2_275:
	setx	0x380123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc850020  ! 3426: LDUWA_R	lduwa	[%r20, %r0] 0x01, %r30
cpu_intr_2_276:
	setx	0x390029, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_164:
	mov	0x0, %r14
	.word 0xf4db8e40  ! 3428: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T2_asi_reg_wr_164:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 3431: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_272:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_272), 16, 16)) -> intp(2, 0, 23)
	.word 0xf285e0ac  ! 3436: LDUWA_I	lduwa	[%r23, + 0x00ac] %asi, %r25
	ta	T_CHANGE_HPRIV
	.word 0xb5504000  ! 3445: RDPR_TNPC	<illegal instruction>
	.word 0xfa950020  ! 3448: LDUHA_R	lduha	[%r20, %r0] 0x01, %r29
	.word 0xf004e110  ! 3449: LDUW_I	lduw	[%r19 + 0x0110], %r24
iob_intr_2_273:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_273), 16, 16)) -> intp(2, 0, 3)
iob_intr_2_274:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_274), 16, 16)) -> intp(2, 0, 2f)
	.word 0xfc14c000  ! 3452: LDUH_R	lduh	[%r19 + %r0], %r30
cpu_intr_2_277:
	setx	0x3a0215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf005c000  ! 3455: LDUW_R	lduw	[%r23 + %r0], %r24
T2_asi_reg_rd_165:
	mov	0x3c1, %r14
	.word 0xf8db8e80  ! 3457: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xfc050000  ! 3461: LDUW_R	lduw	[%r20 + %r0], %r30
cpu_intr_2_278:
	setx	0x3a021f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64cc000  ! 3464: LDSB_R	ldsb	[%r19 + %r0], %r27
	.word 0xf45c0000  ! 3465: LDX_R	ldx	[%r16 + %r0], %r26
	.word 0xb81d8000  ! 3468: XOR_R	xor 	%r22, %r0, %r28
cpu_intr_2_279:
	setx	0x3a0305, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2cc21e9  ! 3476: LDSBA_I	ldsba	[%r16, + 0x01e9] %asi, %r25
	.word 0xf00c0000  ! 3478: LDUB_R	ldub	[%r16 + %r0], %r24
T2_asi_reg_rd_166:
	mov	0x3c8, %r14
	.word 0xf4db84a0  ! 3481: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_2_280:
	setx	0x3b0309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_281:
	setx	0x390318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfcc4a17f  ! 3488: LDSWA_I	ldswa	[%r18, + 0x017f] %asi, %r30
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983f0a  ! 3489: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f0a, %hpstate
	.word 0xbd7dc400  ! 3490: MOVR_R	movre	%r23, %r0, %r30
	.word 0xb17d2401  ! 3492: MOVR_I	movre	%r20, 0x1, %r24
	.word 0xf855c000  ! 3493: LDSH_R	ldsh	[%r23 + %r0], %r28
	.word 0xb814a03c  ! 3496: OR_I	or 	%r18, 0x003c, %r28
	.word 0xb4b4210a  ! 3499: SUBCcc_I	orncc 	%r16, 0x010a, %r26
T2_asi_reg_wr_165:
	mov	0x16, %r14
	.word 0xfaf38e40  ! 3504: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_282:
	setx	0x3b0202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_283:
	setx	0x3a0334, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_275:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_275), 16, 16)) -> intp(2, 0, 29)
	.word 0xfa046125  ! 3513: LDUW_I	lduw	[%r17 + 0x0125], %r29
	.word 0xfa0c60f8  ! 3519: LDUB_I	ldub	[%r17 + 0x00f8], %r29
cpu_intr_2_284:
	setx	0x3a020f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_285:
	setx	0x380014, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_276:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_276), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_rd_167:
	mov	0x1f, %r14
	.word 0xfedb89e0  ! 3526: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	ta	T_CHANGE_HPRIV
	.word 0xfac5e0f0  ! 3528: LDSWA_I	ldswa	[%r23, + 0x00f0] %asi, %r29
	.word 0xbf7ce401  ! 3530: MOVR_I	movre	%r19, 0x1, %r31
T2_asi_reg_rd_168:
	mov	0x35, %r14
	.word 0xf0db89e0  ! 3534: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	ta	T_CHANGE_TO_TL0
iob_intr_2_277:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_277), 16, 16)) -> intp(2, 0, 3c)
T2_asi_reg_rd_169:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 3538: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xfe54e01e  ! 3539: LDSH_I	ldsh	[%r19 + 0x001e], %r31
	.word 0xf08ca008  ! 3540: LDUBA_I	lduba	[%r18, + 0x0008] %asi, %r24
	.word 0xf21561c2  ! 3541: LDUH_I	lduh	[%r21 + 0x01c2], %r25
	.word 0xbe2de141  ! 3542: ANDN_I	andn 	%r23, 0x0141, %r31
	.word 0xf61461b2  ! 3544: LDUH_I	lduh	[%r17 + 0x01b2], %r27
T2_asi_reg_rd_170:
	mov	0xc, %r14
	.word 0xfedb8e40  ! 3546: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xf80c0000  ! 3547: LDUB_R	ldub	[%r16 + %r0], %r28
cpu_intr_2_286:
	setx	0x390302, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_171:
	mov	0xb, %r14
	.word 0xf0db89e0  ! 3550: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	ta	T_CHANGE_TO_TL1
cpu_intr_2_287:
	setx	0x39033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2c420ad  ! 3555: LDSWA_I	ldswa	[%r16, + 0x00ad] %asi, %r25
T2_asi_reg_wr_166:
	mov	0x10, %r14
	.word 0xf4f38e40  ! 3556: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_278:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_278), 16, 16)) -> intp(2, 0, 14)
T2_asi_reg_wr_167:
	mov	0x3c2, %r14
	.word 0xf4f38e40  ! 3559: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xf2cd8020  ! 3560: LDSBA_R	ldsba	[%r22, %r0] 0x01, %r25
cpu_intr_2_288:
	setx	0x3b0135, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_289:
	setx	0x390300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfecd0020  ! 3565: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r31
	.word 0xf2148000  ! 3566: LDUH_R	lduh	[%r18 + %r0], %r25
cpu_intr_2_290:
	setx	0x3b0224, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_168:
	mov	0x3c0, %r14
	.word 0xf6f384a0  ! 3573: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T2_asi_reg_wr_169:
	mov	0x17, %r14
	.word 0xf4f384a0  ! 3574: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_2_291:
	setx	0x3a0010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88dc020  ! 3578: LDUBA_R	lduba	[%r23, %r0] 0x01, %r28
iob_intr_2_279:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_279), 16, 16)) -> intp(2, 0, 3)
	.word 0xb7356001  ! 3582: SRL_I	srl 	%r21, 0x0001, %r27
cpu_intr_2_292:
	setx	0x3b0338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_280:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_280), 16, 16)) -> intp(2, 0, 1c)
cpu_intr_2_293:
	setx	0x3a030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb751c000  ! 3586: RDPR_TL	<illegal instruction>
cpu_intr_2_294:
	setx	0x3b0322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa146130  ! 3594: LDUH_I	lduh	[%r17 + 0x0130], %r29
	.word 0xfa058000  ! 3599: LDUW_R	lduw	[%r22 + %r0], %r29
T2_asi_reg_wr_170:
	mov	0x3c4, %r14
	.word 0xfaf38e40  ! 3602: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
cpu_intr_2_295:
	setx	0x380215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb7d2401  ! 3605: MOVR_I	movre	%r20, 0x1, %r29
	.word 0xfc5cc000  ! 3607: LDX_R	ldx	[%r19 + %r0], %r30
	.word 0xfe0c8000  ! 3610: LDUB_R	ldub	[%r18 + %r0], %r31
	.word 0xf45d4000  ! 3612: LDX_R	ldx	[%r21 + %r0], %r26
	.word 0xba4521b8  ! 3613: ADDC_I	addc 	%r20, 0x01b8, %r29
iob_intr_2_281:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_281), 16, 16)) -> intp(2, 0, 29)
	.word 0xf205610a  ! 3620: LDUW_I	lduw	[%r21 + 0x010a], %r25
iob_intr_2_282:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_282), 16, 16)) -> intp(2, 0, 1)
T2_asi_reg_rd_172:
	mov	0x36, %r14
	.word 0xf8db8e80  ! 3627: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xfe0c8000  ! 3629: LDUB_R	ldub	[%r18 + %r0], %r31
T2_asi_reg_wr_171:
	mov	0xe, %r14
	.word 0xfcf389e0  ! 3630: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
T2_asi_reg_wr_172:
	mov	0x26, %r14
	.word 0xfaf38e60  ! 3631: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_2_283:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_283), 16, 16)) -> intp(2, 0, a)
T2_asi_reg_wr_173:
	mov	0x1a, %r14
	.word 0xf6f384a0  ! 3634: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xf48c20b3  ! 3637: LDUBA_I	lduba	[%r16, + 0x00b3] %asi, %r26
	.word 0x8395a15c  ! 3640: WRPR_TNPC_I	wrpr	%r22, 0x015c, %tnpc
iob_intr_2_284:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_284), 16, 16)) -> intp(2, 0, c)
	.word 0xf8cd4020  ! 3643: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r28
T2_asi_reg_wr_174:
	mov	0x3c3, %r14
	.word 0xfef389e0  ! 3644: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xf6056051  ! 3647: LDUW_I	lduw	[%r21 + 0x0051], %r27
	.word 0xbd3c7001  ! 3649: SRAX_I	srax	%r17, 0x0001, %r30
T2_asi_reg_rd_173:
	mov	0x3c0, %r14
	.word 0xfcdb8e80  ! 3657: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_2_285:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_285), 16, 16)) -> intp(2, 0, 1f)
	.word 0xfa05e049  ! 3659: LDUW_I	lduw	[%r23 + 0x0049], %r29
	.word 0xb0340000  ! 3660: SUBC_R	orn 	%r16, %r0, %r24
iob_intr_2_286:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_286), 16, 16)) -> intp(2, 0, 12)
	.word 0xfc940020  ! 3662: LDUHA_R	lduha	[%r16, %r0] 0x01, %r30
	.word 0xfc8421ab  ! 3663: LDUWA_I	lduwa	[%r16, + 0x01ab] %asi, %r30
cpu_intr_2_296:
	setx	0x3f002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_175:
	mov	0x23, %r14
	.word 0xf2f38400  ! 3665: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T2_asi_reg_wr_176:
	mov	0x12, %r14
	.word 0xf6f38e40  ! 3667: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T2_asi_reg_rd_174:
	mov	0x36, %r14
	.word 0xf0db8e60  ! 3668: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xf6840020  ! 3671: LDUWA_R	lduwa	[%r16, %r0] 0x01, %r27
iob_intr_2_287:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_287), 16, 16)) -> intp(2, 0, 2b)
T2_asi_reg_wr_177:
	mov	0x3, %r14
	.word 0xf4f38e40  ! 3673: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_2_288:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_288), 16, 16)) -> intp(2, 0, 16)
	.word 0xb7643801  ! 3676: MOVcc_I	<illegal instruction>
	.word 0x8d946023  ! 3677: WRPR_PSTATE_I	wrpr	%r17, 0x0023, %pstate
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1
	.word 0xf29460c0  ! 3680: LDUHA_I	lduha	[%r17, + 0x00c0] %asi, %r25
iob_intr_2_289:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_289), 16, 16)) -> intp(2, 0, 24)
T2_asi_reg_wr_178:
	mov	0x0, %r14
	.word 0xfaf38e40  ! 3684: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_2_290:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_290), 16, 16)) -> intp(2, 0, c)
	.word 0xfa4d0000  ! 3687: LDSB_R	ldsb	[%r20 + %r0], %r29
	ta	T_CHANGE_TO_TL1
	.word 0xf44cc000  ! 3689: LDSB_R	ldsb	[%r19 + %r0], %r26
	.word 0xb484e00e  ! 3690: ADDcc_I	addcc 	%r19, 0x000e, %r26
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_NONHPRIV
	.word 0xfa95e0ab  ! 3697: LDUHA_I	lduha	[%r23, + 0x00ab] %asi, %r29
T2_asi_reg_wr_179:
	mov	0x3c4, %r14
	.word 0xfaf38e60  ! 3698: STXA_R	stxa	%r29, [%r14 + %r0] 0x73
iob_intr_2_291:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_291), 16, 16)) -> intp(2, 0, 18)
	ta	T_CHANGE_TO_TL0
	.word 0xb93d6001  ! 3702: SRA_I	sra 	%r21, 0x0001, %r28
	.word 0xfa054000  ! 3703: LDUW_R	lduw	[%r21 + %r0], %r29
	ta	T_CHANGE_TO_TL1
	.word 0xfe442134  ! 3715: LDSW_I	ldsw	[%r16 + 0x0134], %r31
	.word 0xf2950020  ! 3716: LDUHA_R	lduha	[%r20, %r0] 0x01, %r25
	.word 0xfe8d4020  ! 3719: LDUBA_R	lduba	[%r21, %r0] 0x01, %r31
	.word 0xfe440000  ! 3720: LDSW_R	ldsw	[%r16 + %r0], %r31
iob_intr_2_292:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_292), 16, 16)) -> intp(2, 0, 34)
	.word 0xfa55c000  ! 3723: LDSH_R	ldsh	[%r23 + %r0], %r29
	.word 0xb435610b  ! 3725: SUBC_I	orn 	%r21, 0x010b, %r26
cpu_intr_2_297:
	setx	0x3d0115, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_175:
	mov	0x24, %r14
	.word 0xf2db8e60  ! 3730: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xfe14a075  ! 3731: LDUH_I	lduh	[%r18 + 0x0075], %r31
	ta	T_CHANGE_HPRIV
cpu_intr_2_298:
	setx	0x3d0010, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_299:
	setx	0x3d0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8148000  ! 3739: LDUH_R	lduh	[%r18 + %r0], %r28
cpu_intr_2_300:
	setx	0x3c022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_176:
	mov	0x3c4, %r14
	.word 0xf0db89e0  ! 3744: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xfedce13a  ! 3745: LDXA_I	ldxa	[%r19, + 0x013a] %asi, %r31
T2_asi_reg_rd_177:
	mov	0x3c3, %r14
	.word 0xfadb8e40  ! 3746: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xf244c000  ! 3750: LDSW_R	ldsw	[%r19 + %r0], %r25
cpu_intr_2_301:
	setx	0x3e0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80d61ad  ! 3758: LDUB_I	ldub	[%r21 + 0x01ad], %r28
	ta	T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL0
	.word 0xf49460f7  ! 3767: LDUHA_I	lduha	[%r17, + 0x00f7] %asi, %r26
T2_asi_reg_wr_180:
	mov	0x1a, %r14
	.word 0xf2f384a0  ! 3769: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_2_293:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_293), 16, 16)) -> intp(2, 0, 22)
	.word 0xf0558000  ! 3773: LDSH_R	ldsh	[%r22 + %r0], %r24
T2_asi_reg_rd_178:
	mov	0x14, %r14
	.word 0xf6db8400  ! 3775: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xba1c4000  ! 3777: XOR_R	xor 	%r17, %r0, %r29
cpu_intr_2_302:
	setx	0x3d0312, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6156178  ! 3779: LDUH_I	lduh	[%r21 + 0x0178], %r27
T2_asi_reg_rd_179:
	mov	0x3c8, %r14
	.word 0xfcdb84a0  ! 3783: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xf85c0000  ! 3785: LDX_R	ldx	[%r16 + %r0], %r28
iob_intr_2_294:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_294), 16, 16)) -> intp(2, 0, 7)
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983ad8  ! 3787: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad8, %hpstate
	.word 0xf8450000  ! 3788: LDSW_R	ldsw	[%r20 + %r0], %r28
cpu_intr_2_303:
	setx	0x3f000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfe5de1a2  ! 3792: LDX_I	ldx	[%r23 + 0x01a2], %r31
	.word 0xb6c54000  ! 3793: ADDCcc_R	addccc 	%r21, %r0, %r27
	.word 0xf65c0000  ! 3796: LDX_R	ldx	[%r16 + %r0], %r27
T2_asi_reg_wr_181:
	mov	0x21, %r14
	.word 0xfef38400  ! 3797: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	setx	data_start_2, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81982e18  ! 3798: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e18, %hpstate
iob_intr_2_295:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_295), 16, 16)) -> intp(2, 0, 2f)
T2_asi_reg_rd_180:
	mov	0x3c8, %r14
	.word 0xf8db8e40  ! 3801: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf84ca0f4  ! 3803: LDSB_I	ldsb	[%r18 + 0x00f4], %r28
cpu_intr_2_304:
	setx	0x3e0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8dce062  ! 3805: LDXA_I	ldxa	[%r19, + 0x0062] %asi, %r28
T2_asi_reg_rd_181:
	mov	0x3c0, %r14
	.word 0xf6db89e0  ! 3806: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_2_296:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_296), 16, 16)) -> intp(2, 0, 5)
iob_intr_2_297:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_297), 16, 16)) -> intp(2, 0, 1e)
	.word 0xa1902000  ! 3810: WRPR_GL_I	wrpr	%r0, 0x0000, %-
T2_asi_reg_rd_182:
	mov	0x3c4, %r14
	.word 0xf2db8e40  ! 3812: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_HPRIV
	.word 0xfa85e088  ! 3814: LDUWA_I	lduwa	[%r23, + 0x0088] %asi, %r29
	.word 0xb0b42196  ! 3817: SUBCcc_I	orncc 	%r16, 0x0196, %r24
iob_intr_2_298:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_298), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_305:
	setx	0x3f0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
iob_intr_2_299:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_299), 16, 16)) -> intp(2, 0, 28)
	.word 0xfc548000  ! 3823: LDSH_R	ldsh	[%r18 + %r0], %r30
	.word 0xf6058000  ! 3826: LDUW_R	lduw	[%r22 + %r0], %r27
	.word 0xf65d21bc  ! 3830: LDX_I	ldx	[%r20 + 0x01bc], %r27
	.word 0xf85d606f  ! 3831: LDX_I	ldx	[%r21 + 0x006f], %r28
iob_intr_2_300:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_300), 16, 16)) -> intp(2, 0, 16)
cpu_intr_2_306:
	setx	0x3f0316, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_301:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_301), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_307:
	setx	0x3e013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb72db001  ! 3843: SLLX_I	sllx	%r22, 0x0001, %r27
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_rd_183:
	mov	0x3c2, %r14
	.word 0xf0db8400  ! 3851: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
iob_intr_2_302:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_302), 16, 16)) -> intp(2, 0, 23)
cpu_intr_2_308:
	setx	0x3e0137, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_182:
	mov	0x3c1, %r14
	.word 0xfef38e40  ! 3856: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T2_asi_reg_wr_183:
	mov	0x3c1, %r14
	.word 0xfcf38e60  ! 3857: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xfe45e1e6  ! 3858: LDSW_I	ldsw	[%r23 + 0x01e6], %r31
T2_asi_reg_wr_184:
	mov	0x3c0, %r14
	.word 0xf2f389e0  ! 3859: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xf8c460b0  ! 3860: LDSWA_I	ldswa	[%r17, + 0x00b0] %asi, %r28
	ta	T_CHANGE_HPRIV
	.word 0xf604e18d  ! 3862: LDUW_I	lduw	[%r19 + 0x018d], %r27
	.word 0xf2dd60cb  ! 3863: LDXA_I	ldxa	[%r21, + 0x00cb] %asi, %r25
cpu_intr_2_309:
	setx	0x3f033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb00c8000  ! 3868: AND_R	and 	%r18, %r0, %r24
	ta	T_CHANGE_TO_TL1
	.word 0xf085a1c2  ! 3873: LDUWA_I	lduwa	[%r22, + 0x01c2] %asi, %r24
T2_asi_reg_rd_184:
	mov	0x2a, %r14
	.word 0xfedb89e0  ! 3878: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xb17c2401  ! 3879: MOVR_I	movre	%r16, 0x1, %r24
T2_asi_reg_rd_185:
	mov	0x2c, %r14
	.word 0xf0db8e40  ! 3881: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb93d0000  ! 3882: SRA_R	sra 	%r20, %r0, %r28
cpu_intr_2_310:
	setx	0x3e033b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_303:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_303), 16, 16)) -> intp(2, 0, e)
	.word 0xb4044000  ! 3885: ADD_R	add 	%r17, %r0, %r26
	.word 0xbeb520b3  ! 3892: ORNcc_I	orncc 	%r20, 0x00b3, %r31
	.word 0xfe148000  ! 3896: LDUH_R	lduh	[%r18 + %r0], %r31
	.word 0xf28c8020  ! 3897: LDUBA_R	lduba	[%r18, %r0] 0x01, %r25
T2_asi_reg_wr_185:
	mov	0x3, %r14
	.word 0xfef38e40  ! 3899: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xf4158000  ! 3901: LDUH_R	lduh	[%r22 + %r0], %r26
T2_asi_reg_wr_186:
	mov	0x2, %r14
	.word 0xfcf389e0  ! 3903: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xf0558000  ! 3904: LDSH_R	ldsh	[%r22 + %r0], %r24
iob_intr_2_304:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_304), 16, 16)) -> intp(2, 0, 16)
T2_asi_reg_wr_187:
	mov	0x22, %r14
	.word 0xf0f389e0  ! 3907: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb8a50000  ! 3908: SUBcc_R	subcc 	%r20, %r0, %r28
T2_asi_reg_rd_186:
	mov	0x3c3, %r14
	.word 0xf2db8e40  ! 3913: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xf884e19c  ! 3915: LDUWA_I	lduwa	[%r19, + 0x019c] %asi, %r28
iob_intr_2_305:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_305), 16, 16)) -> intp(2, 0, 1f)
	.word 0xbd35b001  ! 3917: SRLX_I	srlx	%r22, 0x0001, %r30
T2_asi_reg_wr_188:
	mov	0x3c4, %r14
	.word 0xf4f38e80  ! 3918: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
	.word 0xfc146008  ! 3919: LDUH_I	lduh	[%r17 + 0x0008], %r30
	.word 0xfc4cc000  ! 3921: LDSB_R	ldsb	[%r19 + %r0], %r30
	.word 0xfc146086  ! 3922: LDUH_I	lduh	[%r17 + 0x0086], %r30
T2_asi_reg_rd_187:
	mov	0x25, %r14
	.word 0xf4db8e60  ! 3923: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
T2_asi_reg_wr_189:
	mov	0x22, %r14
	.word 0xf4f38e60  ! 3924: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
iob_intr_2_306:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_306), 16, 16)) -> intp(2, 0, 2c)
cpu_intr_2_311:
	setx	0x3c011c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_312:
	setx	0x3c023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0bc4000  ! 3931: XNORcc_R	xnorcc 	%r17, %r0, %r24
	.word 0xf2550000  ! 3932: LDSH_R	ldsh	[%r20 + %r0], %r25
	.word 0xf84521c0  ! 3933: LDSW_I	ldsw	[%r20 + 0x01c0], %r28
	.word 0xfedd2030  ! 3934: LDXA_I	ldxa	[%r20, + 0x0030] %asi, %r31
	.word 0xf6056125  ! 3935: LDUW_I	lduw	[%r21 + 0x0125], %r27
T2_asi_reg_rd_188:
	mov	0x16, %r14
	.word 0xfadb84a0  ! 3936: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
	.word 0xf04d0000  ! 3937: LDSB_R	ldsb	[%r20 + %r0], %r24
cpu_intr_2_313:
	setx	0x3e0112, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf88de18d  ! 3941: LDUBA_I	lduba	[%r23, + 0x018d] %asi, %r28
	.word 0xf69421a7  ! 3943: LDUHA_I	lduha	[%r16, + 0x01a7] %asi, %r27
T2_asi_reg_rd_189:
	mov	0x21, %r14
	.word 0xf0db8e40  ! 3946: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb8a5c000  ! 3949: SUBcc_R	subcc 	%r23, %r0, %r28
cpu_intr_2_314:
	setx	0x3f0208, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0054000  ! 3951: LDUW_R	lduw	[%r21 + %r0], %r24
T2_asi_reg_wr_190:
	mov	0x2b, %r14
	.word 0xf0f38e40  ! 3953: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf645605a  ! 3955: LDSW_I	ldsw	[%r21 + 0x005a], %r27
	.word 0xfc8c4020  ! 3956: LDUBA_R	lduba	[%r17, %r0] 0x01, %r30
T2_asi_reg_rd_190:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 3959: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xf60460f0  ! 3960: LDUW_I	lduw	[%r17 + 0x00f0], %r27
cpu_intr_2_315:
	setx	0x10007, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa45a17f  ! 3962: LDSW_I	ldsw	[%r22 + 0x017f], %r29
iob_intr_2_307:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_307), 16, 16)) -> intp(2, 0, 15)
	.word 0xfe548000  ! 3964: LDSH_R	ldsh	[%r18 + %r0], %r31
iob_intr_2_308:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_308), 16, 16)) -> intp(2, 0, 30)
	.word 0xfad4e060  ! 3966: LDSHA_I	ldsha	[%r19, + 0x0060] %asi, %r29
T2_asi_reg_rd_191:
	mov	0x7, %r14
	.word 0xf0db8e80  ! 3968: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
iob_intr_2_309:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_309), 16, 16)) -> intp(2, 0, 3b)
iob_intr_2_310:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_310), 16, 16)) -> intp(2, 0, 32)
iob_intr_2_311:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_311), 16, 16)) -> intp(2, 0, 27)
	setx	data_start_7, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81982992  ! 3976: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0992, %hpstate
	ta	T_CHANGE_NONHPRIV
cpu_intr_2_316:
	setx	0x3d0014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb094e1fe  ! 3982: ORcc_I	orcc 	%r19, 0x01fe, %r24
	.word 0xf88ce088  ! 3988: LDUBA_I	lduba	[%r19, + 0x0088] %asi, %r28
cpu_intr_2_317:
	setx	0x3f0009, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_192:
	mov	0x10, %r14
	.word 0xf2db84a0  ! 3992: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
cpu_intr_2_318:
	setx	0x3c0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1641800  ! 3995: MOVcc_R	<illegal instruction>
	.word 0xfe5c213c  ! 3996: LDX_I	ldx	[%r16 + 0x013c], %r31
	.word 0xbc1ce19d  ! 4001: XOR_I	xor 	%r19, 0x019d, %r30
iob_intr_2_312:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_312), 16, 16)) -> intp(2, 0, 11)
iob_intr_2_313:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_313), 16, 16)) -> intp(2, 0, 2)
	.word 0xf6cce0a8  ! 4004: LDSBA_I	ldsba	[%r19, + 0x00a8] %asi, %r27
	.word 0xfe0d8000  ! 4005: LDUB_R	ldub	[%r22 + %r0], %r31
	.word 0xbe150000  ! 4007: OR_R	or 	%r20, %r0, %r31
	.word 0xf0952088  ! 4008: LDUHA_I	lduha	[%r20, + 0x0088] %asi, %r24
cpu_intr_2_319:
	setx	0x3d0318, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_193:
	mov	0xd, %r14
	.word 0xf4db8400  ! 4011: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfad40020  ! 4015: LDSHA_R	ldsha	[%r16, %r0] 0x01, %r29
T2_asi_reg_rd_194:
	mov	0x2, %r14
	.word 0xf4db8e40  ! 4018: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf494213b  ! 4020: LDUHA_I	lduha	[%r16, + 0x013b] %asi, %r26
	ta	T_CHANGE_TO_TL0
	ta	T_CHANGE_TO_TL0
T2_asi_reg_rd_195:
	mov	0x3c2, %r14
	.word 0xf4db89e0  ! 4023: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xf84d8000  ! 4024: LDSB_R	ldsb	[%r22 + %r0], %r28
T2_asi_reg_rd_196:
	mov	0xf, %r14
	.word 0xf8db8e60  ! 4025: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_197:
	mov	0x11, %r14
	.word 0xf8db8e40  ! 4029: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf204e143  ! 4033: LDUW_I	lduw	[%r19 + 0x0143], %r25
cpu_intr_2_320:
	setx	0x3f0204, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_314:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_314), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_315:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_315), 16, 16)) -> intp(2, 0, 3a)
	.word 0xfc952041  ! 4038: LDUHA_I	lduha	[%r20, + 0x0041] %asi, %r30
T2_asi_reg_wr_191:
	mov	0x3c2, %r14
	.word 0xfaf384a0  ! 4041: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
cpu_intr_2_321:
	setx	0x3e023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
	.word 0xf814a1a3  ! 4048: LDUH_I	lduh	[%r18 + 0x01a3], %r28
	.word 0xf4044000  ! 4052: LDUW_R	lduw	[%r17 + %r0], %r26
iob_intr_2_316:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_316), 16, 16)) -> intp(2, 0, 13)
	setx	data_start_4, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983bd8  ! 4062: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd8, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf00cc000  ! 4064: LDUB_R	ldub	[%r19 + %r0], %r24
	.word 0xfc4c2151  ! 4067: LDSB_I	ldsb	[%r16 + 0x0151], %r30
T2_asi_reg_wr_192:
	mov	0xd, %r14
	.word 0xf2f38400  ! 4069: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
iob_intr_2_317:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_317), 16, 16)) -> intp(2, 0, 27)
	.word 0xbb340000  ! 4071: SRL_R	srl 	%r16, %r0, %r29
	ta	T_CHANGE_HPRIV
	.word 0xf45da1d6  ! 4073: LDX_I	ldx	[%r22 + 0x01d6], %r26
T2_asi_reg_wr_193:
	mov	0x18, %r14
	.word 0xf6f38400  ! 4074: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_2_318:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_318), 16, 16)) -> intp(2, 0, 17)
iob_intr_2_319:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_319), 16, 16)) -> intp(2, 0, 29)
	.word 0x8d95e04b  ! 4080: WRPR_PSTATE_I	wrpr	%r23, 0x004b, %pstate
cpu_intr_2_322:
	setx	0x41032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8f902000  ! 4082: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
iob_intr_2_320:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_320), 16, 16)) -> intp(2, 0, 39)
	.word 0xf0d561b1  ! 4087: LDSHA_I	ldsha	[%r21, + 0x01b1] %asi, %r24
T2_asi_reg_rd_198:
	mov	0x4, %r14
	.word 0xfcdb8e60  ! 4089: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
cpu_intr_2_323:
	setx	0x420002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_321:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_321), 16, 16)) -> intp(2, 0, 25)
iob_intr_2_322:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_322), 16, 16)) -> intp(2, 0, 19)
T2_asi_reg_rd_199:
	mov	0x22, %r14
	.word 0xfedb8e40  ! 4093: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb2940000  ! 4096: ORcc_R	orcc 	%r16, %r0, %r25
iob_intr_2_323:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_323), 16, 16)) -> intp(2, 0, 3f)
cpu_intr_2_324:
	setx	0x42023e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_325:
	setx	0x430011, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf8554000  ! 4102: LDSH_R	ldsh	[%r21 + %r0], %r28
	.word 0xfcdca1b0  ! 4103: LDXA_I	ldxa	[%r18, + 0x01b0] %asi, %r30
	.word 0xfa0c60de  ! 4108: LDUB_I	ldub	[%r17 + 0x00de], %r29
T2_asi_reg_rd_200:
	mov	0x13, %r14
	.word 0xfadb8e40  ! 4109: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_194:
	mov	0x37, %r14
	.word 0xf6f38400  ! 4113: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_2_326:
	setx	0x410017, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_324:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_324), 16, 16)) -> intp(2, 0, 3e)
T2_asi_reg_wr_195:
	mov	0x3c6, %r14
	.word 0xfcf38e40  ! 4117: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xfc45a020  ! 4118: LDSW_I	ldsw	[%r22 + 0x0020], %r30
iob_intr_2_325:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_325), 16, 16)) -> intp(2, 0, 34)
cpu_intr_2_327:
	setx	0x42031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc8d0000  ! 4122: ANDcc_R	andcc 	%r20, %r0, %r30
	.word 0xf6d4e012  ! 4124: LDSHA_I	ldsha	[%r19, + 0x0012] %asi, %r27
T2_asi_reg_rd_201:
	mov	0x15, %r14
	.word 0xfcdb8e40  ! 4129: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbd643801  ! 4130: MOVcc_I	<illegal instruction>
cpu_intr_2_328:
	setx	0x400231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0d460dc  ! 4134: LDSHA_I	ldsha	[%r17, + 0x00dc] %asi, %r24
cpu_intr_2_329:
	setx	0x40010f, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_202:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 4140: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xf2450000  ! 4142: LDSW_R	ldsw	[%r20 + %r0], %r25
	ta	T_CHANGE_TO_TL0
cpu_intr_2_330:
	setx	0x410105, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_331:
	setx	0x430117, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa8ca039  ! 4147: LDUBA_I	lduba	[%r18, + 0x0039] %asi, %r29
T2_asi_reg_wr_196:
	mov	0x3c6, %r14
	.word 0xfcf38e40  ! 4148: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_2_332:
	setx	0x430113, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_203:
	mov	0xf, %r14
	.word 0xf2db8400  ! 4152: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_2_333:
	setx	0x43003e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_334:
	setx	0x420039, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_204:
	mov	0x3c4, %r14
	.word 0xfedb8400  ! 4158: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_2_335:
	setx	0x400239, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r17, [%g1] 0x58
	.word 0x81983908  ! 4170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1908, %hpstate
cpu_intr_2_336:
	setx	0x42002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_337:
	setx	0x420014, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_205:
	mov	0x3c8, %r14
	.word 0xf4db84a0  ! 4178: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_2_338:
	setx	0x400324, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_326:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_326), 16, 16)) -> intp(2, 0, 11)
	.word 0xfe8c21ec  ! 4182: LDUBA_I	lduba	[%r16, + 0x01ec] %asi, %r31
	.word 0xb48c2124  ! 4187: ANDcc_I	andcc 	%r16, 0x0124, %r26
iob_intr_2_327:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_327), 16, 16)) -> intp(2, 0, 4)
iob_intr_2_328:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_328), 16, 16)) -> intp(2, 0, 1c)
	.word 0xf6954020  ! 4190: LDUHA_R	lduha	[%r21, %r0] 0x01, %r27
cpu_intr_2_339:
	setx	0x420112, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_340:
	setx	0x41032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 4193: RDPR_TPC	<illegal instruction>
	.word 0xb004e027  ! 4196: ADD_I	add 	%r19, 0x0027, %r24
	.word 0xf85d4000  ! 4197: LDX_R	ldx	[%r21 + %r0], %r28
	.word 0xf0dde028  ! 4200: LDXA_I	ldxa	[%r23, + 0x0028] %asi, %r24
T2_asi_reg_wr_197:
	mov	0x3c8, %r14
	.word 0xf8f38e40  ! 4202: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xf0158000  ! 4207: LDUH_R	lduh	[%r22 + %r0], %r24
	.word 0xf0dc21c1  ! 4208: LDXA_I	ldxa	[%r16, + 0x01c1] %asi, %r24
T2_asi_reg_wr_198:
	mov	0x3c4, %r14
	.word 0xf2f38e60  ! 4209: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_2_341:
	setx	0x430110, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_329:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_329), 16, 16)) -> intp(2, 0, 17)
cpu_intr_2_342:
	setx	0x430034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf484a002  ! 4223: LDUWA_I	lduwa	[%r18, + 0x0002] %asi, %r26
	.word 0xf88d615d  ! 4227: LDUBA_I	lduba	[%r21, + 0x015d] %asi, %r28
cpu_intr_2_343:
	setx	0x430203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa1461cb  ! 4230: LDUH_I	lduh	[%r17 + 0x01cb], %r29
cpu_intr_2_344:
	setx	0x430132, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_345:
	setx	0x40013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbac58000  ! 4235: ADDCcc_R	addccc 	%r22, %r0, %r29
	ta	T_CHANGE_NONHPRIV
	.word 0xf64c202a  ! 4237: LDSB_I	ldsb	[%r16 + 0x002a], %r27
iob_intr_2_330:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_330), 16, 16)) -> intp(2, 0, 10)
cpu_intr_2_346:
	setx	0x410339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfedd20fd  ! 4245: LDXA_I	ldxa	[%r20, + 0x00fd] %asi, %r31
	.word 0xf0144000  ! 4246: LDUH_R	lduh	[%r17 + %r0], %r24
	.word 0xf40d8000  ! 4247: LDUB_R	ldub	[%r22 + %r0], %r26
	.word 0xf60d2051  ! 4248: LDUB_I	ldub	[%r20 + 0x0051], %r27
	.word 0xf88c0020  ! 4249: LDUBA_R	lduba	[%r16, %r0] 0x01, %r28
	.word 0xfccc8020  ! 4252: LDSBA_R	ldsba	[%r18, %r0] 0x01, %r30
iob_intr_2_331:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_331), 16, 16)) -> intp(2, 0, 19)
cpu_intr_2_347:
	setx	0x430120, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_199:
	mov	0x3c7, %r14
	.word 0xf2f389e0  ! 4259: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_2_348:
	setx	0x430330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe8cc000  ! 4262: ANDcc_R	andcc 	%r19, %r0, %r31
iob_intr_2_332:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_332), 16, 16)) -> intp(2, 0, 26)
	.word 0xf40c20e2  ! 4265: LDUB_I	ldub	[%r16 + 0x00e2], %r26
	.word 0xf4c52164  ! 4267: LDSWA_I	ldswa	[%r20, + 0x0164] %asi, %r26
	.word 0xfe5461d8  ! 4269: LDSH_I	ldsh	[%r17 + 0x01d8], %r31
T2_asi_reg_wr_200:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 4271: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	setx	data_start_2, %g1, %r21
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r21, [%g1] 0x58
	.word 0x81983f02  ! 4272: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f02, %hpstate
	.word 0xf8cc0020  ! 4273: LDSBA_R	ldsba	[%r16, %r0] 0x01, %r28
	.word 0xf65c60b9  ! 4276: LDX_I	ldx	[%r17 + 0x00b9], %r27
cpu_intr_2_349:
	setx	0x40013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2c40020  ! 4283: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r25
	.word 0xf8c44020  ! 4284: LDSWA_R	ldswa	[%r17, %r0] 0x01, %r28
T2_asi_reg_rd_206:
	mov	0x37, %r14
	.word 0xfcdb8e60  ! 4286: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	ta	T_CHANGE_NONHPRIV
	.word 0xfe5c61f3  ! 4289: LDX_I	ldx	[%r17 + 0x01f3], %r31
	.word 0xfac4c020  ! 4291: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r29
	.word 0xf00d0000  ! 4293: LDUB_R	ldub	[%r20 + %r0], %r24
	.word 0xfa150000  ! 4294: LDUH_R	lduh	[%r20 + %r0], %r29
	.word 0xb4b5a0a8  ! 4295: SUBCcc_I	orncc 	%r22, 0x00a8, %r26
	.word 0xf45d21d1  ! 4296: LDX_I	ldx	[%r20 + 0x01d1], %r26
iob_intr_2_333:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_333), 16, 16)) -> intp(2, 0, 31)
	.word 0xf28560bf  ! 4299: LDUWA_I	lduwa	[%r21, + 0x00bf] %asi, %r25
iob_intr_2_334:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_334), 16, 16)) -> intp(2, 0, 3b)
T2_asi_reg_wr_201:
	mov	0xe, %r14
	.word 0xfcf38400  ! 4301: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_2_350:
	setx	0x400133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa056172  ! 4303: LDUW_I	lduw	[%r21 + 0x0172], %r29
iob_intr_2_335:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_335), 16, 16)) -> intp(2, 0, 33)
cpu_intr_2_351:
	setx	0x42012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf04d2055  ! 4308: LDSB_I	ldsb	[%r20 + 0x0055], %r24
cpu_intr_2_352:
	setx	0x400101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf054602b  ! 4311: LDSH_I	ldsh	[%r17 + 0x002b], %r24
	.word 0xbb3c5000  ! 4314: SRAX_R	srax	%r17, %r0, %r29
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x81983cda  ! 4317: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cda, %hpstate
	.word 0xf40c8000  ! 4318: LDUB_R	ldub	[%r18 + %r0], %r26
cpu_intr_2_353:
	setx	0x42013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf00c611a  ! 4323: LDUB_I	ldub	[%r17 + 0x011a], %r24
iob_intr_2_336:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_336), 16, 16)) -> intp(2, 0, 1)
	.word 0xfcd54020  ! 4326: LDSHA_R	ldsha	[%r21, %r0] 0x01, %r30
cpu_intr_2_354:
	setx	0x410327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_337:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_337), 16, 16)) -> intp(2, 0, 39)
cpu_intr_2_355:
	setx	0x420000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf644a0fb  ! 4332: LDSW_I	ldsw	[%r18 + 0x00fb], %r27
	.word 0xb2b40000  ! 4334: ORNcc_R	orncc 	%r16, %r0, %r25
cpu_intr_2_356:
	setx	0x42032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_357:
	setx	0x400233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_358:
	setx	0x420127, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb334b001  ! 4340: SRLX_I	srlx	%r18, 0x0001, %r25
iob_intr_2_338:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_338), 16, 16)) -> intp(2, 0, 31)
cpu_intr_2_359:
	setx	0x430118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_339:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_339), 16, 16)) -> intp(2, 0, 35)
T2_asi_reg_wr_202:
	mov	0x18, %r14
	.word 0xfef38e80  ! 4350: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xb6858000  ! 4352: ADDcc_R	addcc 	%r22, %r0, %r27
	.word 0xfc04a064  ! 4353: LDUW_I	lduw	[%r18 + 0x0064], %r30
	.word 0xb0b52125  ! 4354: ORNcc_I	orncc 	%r20, 0x0125, %r24
iob_intr_2_340:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_340), 16, 16)) -> intp(2, 0, 33)
T2_asi_reg_rd_207:
	mov	0x3c5, %r14
	.word 0xfedb89e0  ! 4357: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf84c2163  ! 4358: LDSB_I	ldsb	[%r16 + 0x0163], %r28
	.word 0xfedd60b6  ! 4359: LDXA_I	ldxa	[%r21, + 0x00b6] %asi, %r31
	.word 0xf04cc000  ! 4362: LDSB_R	ldsb	[%r19 + %r0], %r24
	ta	T_CHANGE_HPRIV
iob_intr_2_341:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_341), 16, 16)) -> intp(2, 0, 25)
	.word 0xf0048000  ! 4365: LDUW_R	lduw	[%r18 + %r0], %r24
iob_intr_2_342:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_342), 16, 16)) -> intp(2, 0, 1c)
iob_intr_2_343:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_343), 16, 16)) -> intp(2, 0, 20)
cpu_intr_2_360:
	setx	0x410228, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf24ca103  ! 4370: LDSB_I	ldsb	[%r18 + 0x0103], %r25
iob_intr_2_344:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_344), 16, 16)) -> intp(2, 0, 23)
	.word 0xf8c561ec  ! 4373: LDSWA_I	ldswa	[%r21, + 0x01ec] %asi, %r28
iob_intr_2_345:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_345), 16, 16)) -> intp(2, 0, 1b)
T2_asi_reg_wr_203:
	mov	0x29, %r14
	.word 0xf2f389e0  ! 4377: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xfe940020  ! 4379: LDUHA_R	lduha	[%r16, %r0] 0x01, %r31
	.word 0xf8452184  ! 4380: LDSW_I	ldsw	[%r20 + 0x0184], %r28
	.word 0xfed4c020  ! 4381: LDSHA_R	ldsha	[%r19, %r0] 0x01, %r31
iob_intr_2_346:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_346), 16, 16)) -> intp(2, 0, 9)
	.word 0xf49420c4  ! 4386: LDUHA_I	lduha	[%r16, + 0x00c4] %asi, %r26
T2_asi_reg_wr_204:
	mov	0x2c, %r14
	.word 0xf0f38e40  ! 4390: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
iob_intr_2_347:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_347), 16, 16)) -> intp(2, 0, c)
cpu_intr_2_361:
	setx	0x41013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb834c000  ! 4393: SUBC_R	orn 	%r19, %r0, %r28
	.word 0xf6158000  ! 4398: LDUH_R	lduh	[%r22 + %r0], %r27
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x819839c2  ! 4401: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19c2, %hpstate
iob_intr_2_348:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_348), 16, 16)) -> intp(2, 0, 2b)
	.word 0xfc558000  ! 4403: LDSH_R	ldsh	[%r22 + %r0], %r30
	.word 0xb950c000  ! 4405: RDPR_TT	<illegal instruction>
T2_asi_reg_rd_208:
	mov	0x3c0, %r14
	.word 0xf0db8400  ! 4406: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xf48d8020  ! 4407: LDUBA_R	lduba	[%r22, %r0] 0x01, %r26
	.word 0xf85de174  ! 4408: LDX_I	ldx	[%r23 + 0x0174], %r28
cpu_intr_2_362:
	setx	0x430302, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983ac2  ! 4410: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac2, %hpstate
T2_asi_reg_rd_209:
	mov	0x2a, %r14
	.word 0xfcdb8e40  ! 4411: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_363:
	setx	0x420318, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_364:
	setx	0x42032f, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_210:
	mov	0x24, %r14
	.word 0xf2db84a0  ! 4420: LDXA_R	ldxa	[%r14, %r0] 0x25, %r25
	.word 0xf6058000  ! 4423: LDUW_R	lduw	[%r22 + %r0], %r27
	.word 0xf85d0000  ! 4424: LDX_R	ldx	[%r20 + %r0], %r28
iob_intr_2_349:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_349), 16, 16)) -> intp(2, 0, b)
	.word 0xfc84c020  ! 4426: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r30
	.word 0xf45c0000  ! 4431: LDX_R	ldx	[%r16 + %r0], %r26
T2_asi_reg_rd_211:
	mov	0x1b, %r14
	.word 0xfedb8e40  ! 4433: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_rd_212:
	mov	0x3c7, %r14
	.word 0xf4db8e60  ! 4434: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xf08ce1f9  ! 4435: LDUBA_I	lduba	[%r19, + 0x01f9] %asi, %r24
cpu_intr_2_365:
	setx	0x40003f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_366:
	setx	0x420321, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_367:
	setx	0x41013b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb354000  ! 4441: SRL_R	srl 	%r21, %r0, %r29
	ta	T_CHANGE_HPRIV
cpu_intr_2_368:
	setx	0x400015, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_213:
	mov	0x35, %r14
	.word 0xf0db8e80  ! 4448: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_2_369:
	setx	0x430127, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T2_asi_reg_wr_205:
	mov	0xf, %r14
	.word 0xfef38e80  ! 4455: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T2_asi_reg_rd_214:
	mov	0x1e, %r14
	.word 0xf8db8e60  ! 4456: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xfa85c020  ! 4460: LDUWA_R	lduwa	[%r23, %r0] 0x01, %r29
	.word 0xfa55a040  ! 4463: LDSH_I	ldsh	[%r22 + 0x0040], %r29
	.word 0xb6a58000  ! 4464: SUBcc_R	subcc 	%r22, %r0, %r27
	.word 0xf8950020  ! 4466: LDUHA_R	lduha	[%r20, %r0] 0x01, %r28
	setx	data_start_1, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983f42  ! 4468: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f42, %hpstate
	.word 0xbf349000  ! 4469: SRLX_R	srlx	%r18, %r0, %r31
cpu_intr_2_370:
	setx	0x40030d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf25ce1ef  ! 4471: LDX_I	ldx	[%r19 + 0x01ef], %r25
iob_intr_2_350:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_350), 16, 16)) -> intp(2, 0, 2)
	.word 0xf88dc020  ! 4474: LDUBA_R	lduba	[%r23, %r0] 0x01, %r28
	.word 0xf0cc609e  ! 4475: LDSBA_I	ldsba	[%r17, + 0x009e] %asi, %r24
	.word 0xf6d5e1a7  ! 4478: LDSHA_I	ldsha	[%r23, + 0x01a7] %asi, %r27
T2_asi_reg_wr_206:
	mov	0x10, %r14
	.word 0xf6f38e80  ! 4479: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
iob_intr_2_351:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_351), 16, 16)) -> intp(2, 0, 21)
cpu_intr_2_371:
	setx	0x410138, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf2d44020  ! 4486: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r25
iob_intr_2_352:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_352), 16, 16)) -> intp(2, 0, 33)
	.word 0xf0d46081  ! 4491: LDSHA_I	ldsha	[%r17, + 0x0081] %asi, %r24
cpu_intr_2_372:
	setx	0x400231, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc95e16f  ! 4495: LDUHA_I	lduha	[%r23, + 0x016f] %asi, %r30
iob_intr_2_353:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_353), 16, 16)) -> intp(2, 0, 38)
cpu_intr_2_373:
	setx	0x430230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_374:
	setx	0x400202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfec40020  ! 4503: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r31
cpu_intr_2_375:
	setx	0x430032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba34c000  ! 4506: ORN_R	orn 	%r19, %r0, %r29
	ta	T_CHANGE_HPRIV
	.word 0xf8d44020  ! 4508: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r28
	.word 0xfadc61e4  ! 4509: LDXA_I	ldxa	[%r17, + 0x01e4] %asi, %r29
	.word 0xf44560b0  ! 4511: LDSW_I	ldsw	[%r21 + 0x00b0], %r26
iob_intr_2_354:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_354), 16, 16)) -> intp(2, 0, 1c)
	ta	T_CHANGE_NONHPRIV
	.word 0xf4d58020  ! 4515: LDSHA_R	ldsha	[%r22, %r0] 0x01, %r26
T2_asi_reg_wr_207:
	mov	0x3c3, %r14
	.word 0xf6f38e60  ! 4516: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xf28d61c5  ! 4517: LDUBA_I	lduba	[%r21, + 0x01c5] %asi, %r25
cpu_intr_2_376:
	setx	0x400218, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_NONHPRIV
iob_intr_2_355:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_355), 16, 16)) -> intp(2, 0, 31)
iob_intr_2_356:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_356), 16, 16)) -> intp(2, 0, 2)
	.word 0xbc9d8000  ! 4524: XORcc_R	xorcc 	%r22, %r0, %r30
iob_intr_2_357:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_357), 16, 16)) -> intp(2, 0, 15)
	.word 0xf65cc000  ! 4531: LDX_R	ldx	[%r19 + %r0], %r27
	.word 0xf4c4e019  ! 4532: LDSWA_I	ldswa	[%r19, + 0x0019] %asi, %r26
	.word 0xb8b44000  ! 4533: SUBCcc_R	orncc 	%r17, %r0, %r28
	.word 0xfcd44020  ! 4536: LDSHA_R	ldsha	[%r17, %r0] 0x01, %r30
iob_intr_2_358:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_358), 16, 16)) -> intp(2, 0, 1)
T2_asi_reg_rd_215:
	mov	0x2d, %r14
	.word 0xfadb8e60  ! 4543: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_359:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_359), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_360:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_360), 16, 16)) -> intp(2, 0, 21)
T2_asi_reg_rd_216:
	mov	0xb, %r14
	.word 0xfedb89e0  ! 4550: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xfcd5a1a2  ! 4552: LDSHA_I	ldsha	[%r22, + 0x01a2] %asi, %r30
T2_asi_reg_wr_208:
	mov	0x33, %r14
	.word 0xfaf38e40  ! 4553: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbea5c000  ! 4554: SUBcc_R	subcc 	%r23, %r0, %r31
	.word 0xfe8461d8  ! 4555: LDUWA_I	lduwa	[%r17, + 0x01d8] %asi, %r31
iob_intr_2_361:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_361), 16, 16)) -> intp(2, 0, 23)
	.word 0xf6546012  ! 4563: LDSH_I	ldsh	[%r17 + 0x0012], %r27
	.word 0xf084618e  ! 4564: LDUWA_I	lduwa	[%r17, + 0x018e] %asi, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_2_362:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_362), 16, 16)) -> intp(2, 0, d)
iob_intr_2_363:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_363), 16, 16)) -> intp(2, 0, 1a)
	.word 0xf85c2109  ! 4573: LDX_I	ldx	[%r16 + 0x0109], %r28
iob_intr_2_364:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_364), 16, 16)) -> intp(2, 0, 33)
	.word 0xf6054000  ! 4576: LDUW_R	lduw	[%r21 + %r0], %r27
	setx	data_start_4, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983a08  ! 4577: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a08, %hpstate
	.word 0xfc148000  ! 4578: LDUH_R	lduh	[%r18 + %r0], %r30
	setx	data_start_7, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r20, [%g1] 0x58
	.word 0x819838d2  ! 4580: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18d2, %hpstate
cpu_intr_2_377:
	setx	0x450118, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_365:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_365), 16, 16)) -> intp(2, 0, 5)
	.word 0xfedd603f  ! 4583: LDXA_I	ldxa	[%r21, + 0x003f] %asi, %r31
T2_asi_reg_wr_209:
	mov	0x1d, %r14
	.word 0xf2f389e0  ! 4590: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	setx	data_start_2, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r23, [%g1] 0x58
	.word 0x81983bd0  ! 4591: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd0, %hpstate
cpu_intr_2_378:
	setx	0x460335, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_210:
	mov	0x0, %r14
	.word 0xfef38e60  ! 4595: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
	.word 0xfac4c020  ! 4596: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r29
iob_intr_2_366:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_366), 16, 16)) -> intp(2, 0, 1a)
	.word 0xbaa5a12b  ! 4599: SUBcc_I	subcc 	%r22, 0x012b, %r29
cpu_intr_2_379:
	setx	0x460013, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_380:
	setx	0x46012c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5560eb  ! 4602: LDSH_I	ldsh	[%r21 + 0x00eb], %r29
	.word 0xb615e0cf  ! 4603: OR_I	or 	%r23, 0x00cf, %r27
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x819829c2  ! 4604: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c2, %hpstate
	.word 0xf2cd21f1  ! 4605: LDSBA_I	ldsba	[%r20, + 0x01f1] %asi, %r25
T2_asi_reg_rd_217:
	mov	0x3c3, %r14
	.word 0xfedb89e0  ! 4607: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xf6040000  ! 4608: LDUW_R	lduw	[%r16 + %r0], %r27
	.word 0xb034a078  ! 4609: ORN_I	orn 	%r18, 0x0078, %r24
cpu_intr_2_381:
	setx	0x47022d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_367:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_367), 16, 16)) -> intp(2, 0, 3)
	.word 0xf4dda122  ! 4615: LDXA_I	ldxa	[%r22, + 0x0122] %asi, %r26
	.word 0xf44c2076  ! 4616: LDSB_I	ldsb	[%r16 + 0x0076], %r26
	.word 0xf0cde0d7  ! 4617: LDSBA_I	ldsba	[%r23, + 0x00d7] %asi, %r24
cpu_intr_2_382:
	setx	0x470212, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_211:
	mov	0x18, %r14
	.word 0xf0f389e0  ! 4621: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xf08c8020  ! 4623: LDUBA_R	lduba	[%r18, %r0] 0x01, %r24
	.word 0xfccd0020  ! 4625: LDSBA_R	ldsba	[%r20, %r0] 0x01, %r30
T2_asi_reg_wr_212:
	mov	0x7, %r14
	.word 0xf8f38e80  ! 4626: STXA_R	stxa	%r28, [%r14 + %r0] 0x74
iob_intr_2_368:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_368), 16, 16)) -> intp(2, 0, 1c)
T2_asi_reg_rd_218:
	mov	0x30, %r14
	.word 0xf8db8e80  ! 4631: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
iob_intr_2_369:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_369), 16, 16)) -> intp(2, 0, 7)
	.word 0xb8bd4000  ! 4639: XNORcc_R	xnorcc 	%r21, %r0, %r28
T2_asi_reg_wr_213:
	mov	0x3c1, %r14
	.word 0xf0f389e0  ! 4643: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
iob_intr_2_370:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_370), 16, 16)) -> intp(2, 0, 23)
iob_intr_2_371:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_371), 16, 16)) -> intp(2, 0, 3a)
	.word 0xf044c000  ! 4647: LDSW_R	ldsw	[%r19 + %r0], %r24
	.word 0xf8c5e094  ! 4648: LDSWA_I	ldswa	[%r23, + 0x0094] %asi, %r28
	.word 0xfe054000  ! 4650: LDUW_R	lduw	[%r21 + %r0], %r31
T2_asi_reg_rd_219:
	mov	0x3c5, %r14
	.word 0xf0db8e80  ! 4655: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T2_asi_reg_rd_220:
	mov	0x29, %r14
	.word 0xfcdb8e40  ! 4657: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_2_372:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_372), 16, 16)) -> intp(2, 0, 21)
	.word 0xfa15e1ca  ! 4659: LDUH_I	lduh	[%r23 + 0x01ca], %r29
T2_asi_reg_rd_221:
	mov	0x26, %r14
	.word 0xf8db8400  ! 4661: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xf60521c0  ! 4663: LDUW_I	lduw	[%r20 + 0x01c0], %r27
cpu_intr_2_383:
	setx	0x47033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa94e1d8  ! 4665: LDUHA_I	lduha	[%r19, + 0x01d8] %asi, %r29
cpu_intr_2_384:
	setx	0x470214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4940020  ! 4673: LDUHA_R	lduha	[%r16, %r0] 0x01, %r26
	.word 0xf8842014  ! 4674: LDUWA_I	lduwa	[%r16, + 0x0014] %asi, %r28
iob_intr_2_373:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_373), 16, 16)) -> intp(2, 0, 3c)
iob_intr_2_374:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_374), 16, 16)) -> intp(2, 0, 1a)
T2_asi_reg_wr_214:
	mov	0x3c5, %r14
	.word 0xfef38e80  ! 4681: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xf4940020  ! 4683: LDUHA_R	lduha	[%r16, %r0] 0x01, %r26
	.word 0xfe05213e  ! 4686: LDUW_I	lduw	[%r20 + 0x013e], %r31
T2_asi_reg_wr_215:
	mov	0x3c5, %r14
	.word 0xf8f384a0  ! 4687: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
T2_asi_reg_wr_216:
	mov	0x3c7, %r14
	.word 0xf0f38e40  ! 4689: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xf614e0b8  ! 4691: LDUH_I	lduh	[%r19 + 0x00b8], %r27
	.word 0xfec40020  ! 4695: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r31
cpu_intr_2_385:
	setx	0x440107, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_375:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_375), 16, 16)) -> intp(2, 0, 1f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf68cc020  ! 4699: LDUBA_R	lduba	[%r19, %r0] 0x01, %r27
	ta	T_CHANGE_TO_TL0
	.word 0xf88de0e5  ! 4702: LDUBA_I	lduba	[%r23, + 0x00e5] %asi, %r28
iob_intr_2_376:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_376), 16, 16)) -> intp(2, 0, 4)
iob_intr_2_377:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_377), 16, 16)) -> intp(2, 0, 2b)
	.word 0xb4ad8000  ! 4709: ANDNcc_R	andncc 	%r22, %r0, %r26
	ta	T_CHANGE_TO_TL1
	.word 0xf00cc000  ! 4714: LDUB_R	ldub	[%r19 + %r0], %r24
cpu_intr_2_386:
	setx	0x20233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_387:
	setx	0x45030c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_388:
	setx	0x47012e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_389:
	setx	0x440010, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf34d000  ! 4720: SRLX_R	srlx	%r19, %r0, %r31
T2_asi_reg_rd_222:
	mov	0x36, %r14
	.word 0xfedb8e40  ! 4721: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
T2_asi_reg_wr_217:
	mov	0x1b, %r14
	.word 0xf8f38400  ! 4723: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xf8c4c020  ! 4726: LDSWA_R	ldswa	[%r19, %r0] 0x01, %r28
	.word 0xf0952096  ! 4727: LDUHA_I	lduha	[%r20, + 0x0096] %asi, %r24
T2_asi_reg_wr_218:
	mov	0x3c5, %r14
	.word 0xf6f38e40  ! 4729: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xfc8d6198  ! 4731: LDUBA_I	lduba	[%r21, + 0x0198] %asi, %r30
	.word 0xf85d4000  ! 4734: LDX_R	ldx	[%r21 + %r0], %r28
	.word 0xbca521c5  ! 4738: SUBcc_I	subcc 	%r20, 0x01c5, %r30
iob_intr_2_378:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_378), 16, 16)) -> intp(2, 0, e)
cpu_intr_2_390:
	setx	0x460134, %g1, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x81983d82  ! 4745: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d82, %hpstate
	ta	T_CHANGE_TO_TL0
cpu_intr_2_391:
	setx	0x460134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_392:
	setx	0x44011b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_393:
	setx	0x450133, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xfc8da03d  ! 4753: LDUBA_I	lduba	[%r22, + 0x003d] %asi, %r30
	.word 0xfecda1e4  ! 4754: LDSBA_I	ldsba	[%r22, + 0x01e4] %asi, %r31
	.word 0xf2c40020  ! 4755: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r25
	.word 0xf814605c  ! 4756: LDUH_I	lduh	[%r17 + 0x005c], %r28
iob_intr_2_379:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_379), 16, 16)) -> intp(2, 0, 30)
cpu_intr_2_394:
	setx	0x440306, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_wr_219:
	mov	0x3, %r14
	.word 0xf8f38e60  ! 4764: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xfe444000  ! 4766: LDSW_R	ldsw	[%r17 + %r0], %r31
	.word 0xfacd20ce  ! 4768: LDSBA_I	ldsba	[%r20, + 0x00ce] %asi, %r29
	.word 0xf085e1ac  ! 4769: LDUWA_I	lduwa	[%r23, + 0x01ac] %asi, %r24
iob_intr_2_380:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_380), 16, 16)) -> intp(2, 0, 24)
	.word 0xb49ca121  ! 4773: XORcc_I	xorcc 	%r18, 0x0121, %r26
	.word 0xf2842045  ! 4777: LDUWA_I	lduwa	[%r16, + 0x0045] %asi, %r25
cpu_intr_2_395:
	setx	0x470034, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf80de1df  ! 4780: LDUB_I	ldub	[%r23 + 0x01df], %r28
	.word 0xb61dc000  ! 4781: XOR_R	xor 	%r23, %r0, %r27
cpu_intr_2_396:
	setx	0x470107, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf484c020  ! 4783: LDUWA_R	lduwa	[%r19, %r0] 0x01, %r26
	.word 0xbb7d8400  ! 4784: MOVR_R	movre	%r22, %r0, %r29
	.word 0xf45da135  ! 4787: LDX_I	ldx	[%r22 + 0x0135], %r26
	.word 0xf08c21d0  ! 4788: LDUBA_I	lduba	[%r16, + 0x01d0] %asi, %r24
	.word 0xf815e01a  ! 4789: LDUH_I	lduh	[%r23 + 0x001a], %r28
	.word 0xf6154000  ! 4793: LDUH_R	lduh	[%r21 + %r0], %r27
iob_intr_2_381:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_381), 16, 16)) -> intp(2, 0, 22)
cpu_intr_2_397:
	setx	0x450307, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0c4e116  ! 4804: LDSWA_I	ldswa	[%r19, + 0x0116] %asi, %r24
	setx	data_start_3, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r22, [%g1] 0x58
	.word 0x81983fca  ! 4805: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fca, %hpstate
T2_asi_reg_wr_220:
	mov	0x3c5, %r14
	.word 0xfaf38e80  ! 4806: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_2_382:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_382), 16, 16)) -> intp(2, 0, 21)
iob_intr_2_383:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_383), 16, 16)) -> intp(2, 0, 38)
	.word 0xf00d200b  ! 4810: LDUB_I	ldub	[%r20 + 0x000b], %r24
	ta	T_CHANGE_HPRIV
T2_asi_reg_rd_223:
	mov	0x30, %r14
	.word 0xf6db8e40  ! 4812: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	ta	T_CHANGE_TO_TL1
	.word 0xb0b48000  ! 4817: SUBCcc_R	orncc 	%r18, %r0, %r24
	.word 0xf0d460fd  ! 4818: LDSHA_I	ldsha	[%r17, + 0x00fd] %asi, %r24
	.word 0xfecca0f2  ! 4819: LDSBA_I	ldsba	[%r18, + 0x00f2] %asi, %r31
iob_intr_2_384:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_384), 16, 16)) -> intp(2, 0, 8)
iob_intr_2_385:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_385), 16, 16)) -> intp(2, 0, 3)
	.word 0xf20de1a5  ! 4823: LDUB_I	ldub	[%r23 + 0x01a5], %r25
	.word 0xf815c000  ! 4824: LDUH_R	lduh	[%r23 + %r0], %r28
cpu_intr_2_398:
	setx	0x470327, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_386:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_386), 16, 16)) -> intp(2, 0, b)
	.word 0xb92ce001  ! 4832: SLL_I	sll 	%r19, 0x0001, %r28
T2_asi_reg_wr_221:
	mov	0x3c5, %r14
	.word 0xfcf38e40  ! 4834: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xa1902001  ! 4835: WRPR_GL_I	wrpr	%r0, 0x0001, %-
iob_intr_2_387:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_387), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfe0c8000  ! 4838: LDUB_R	ldub	[%r18 + %r0], %r31
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r16, [%g1] 0x58
	.word 0x819839ca  ! 4839: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19ca, %hpstate
	.word 0xf45c8000  ! 4840: LDX_R	ldx	[%r18 + %r0], %r26
T2_asi_reg_wr_222:
	mov	0x1f, %r14
	.word 0xfaf38e80  ! 4841: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
cpu_intr_2_399:
	setx	0x46012e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_388:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_388), 16, 16)) -> intp(2, 0, 17)
T2_asi_reg_rd_224:
	mov	0x8, %r14
	.word 0xfedb8400  ! 4845: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xfa5ca1a7  ! 4847: LDX_I	ldx	[%r18 + 0x01a7], %r29
	.word 0xf8c40020  ! 4849: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r28
cpu_intr_2_400:
	setx	0x46030c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa158000  ! 4854: LDUH_R	lduh	[%r22 + %r0], %r29
iob_intr_2_389:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_389), 16, 16)) -> intp(2, 0, b)
cpu_intr_2_401:
	setx	0x44010f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_402:
	setx	0x47021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b560b7  ! 4865: SUBCcc_I	orncc 	%r21, 0x00b7, %r28
	.word 0xfa042036  ! 4866: LDUW_I	lduw	[%r16 + 0x0036], %r29
T2_asi_reg_wr_223:
	mov	0x3c2, %r14
	.word 0xfef38e80  ! 4867: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xfc5dc000  ! 4868: LDX_R	ldx	[%r23 + %r0], %r30
cpu_intr_2_403:
	setx	0x470320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6154000  ! 4880: LDUH_R	lduh	[%r21 + %r0], %r27
	.word 0xf6c40020  ! 4881: LDSWA_R	ldswa	[%r16, %r0] 0x01, %r27
iob_intr_2_390:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_390), 16, 16)) -> intp(2, 0, 2c)
iob_intr_2_391:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_391), 16, 16)) -> intp(2, 0, 2f)
iob_intr_2_392:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_392), 16, 16)) -> intp(2, 0, 34)
cpu_intr_2_404:
	setx	0x440218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf64461b1  ! 4890: LDSW_I	ldsw	[%r17 + 0x01b1], %r27
	.word 0xb5643801  ! 4891: MOVcc_I	<illegal instruction>
	.word 0xb805e081  ! 4893: ADD_I	add 	%r23, 0x0081, %r28
cpu_intr_2_405:
	setx	0x460334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_406:
	setx	0x450034, %g1, %o0
	ta	T_SEND_THRD_INTR
T2_asi_reg_rd_225:
	mov	0x9, %r14
	.word 0xfcdb8e40  ! 4900: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
cpu_intr_2_407:
	setx	0x46002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_393:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_393), 16, 16)) -> intp(2, 0, 19)
iob_intr_2_394:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_394), 16, 16)) -> intp(2, 0, 29)
iob_intr_2_395:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_395), 16, 16)) -> intp(2, 0, 2)
T2_asi_reg_rd_226:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 4913: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_2_408:
	setx	0x47010f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbabca188  ! 4921: XNORcc_I	xnorcc 	%r18, 0x0188, %r29
cpu_intr_2_409:
	setx	0x450039, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf2c4a173  ! 4927: LDSWA_I	ldswa	[%r18, + 0x0173] %asi, %r25
T2_asi_reg_rd_227:
	mov	0x3c7, %r14
	.word 0xf4db8e40  ! 4931: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xf84c204b  ! 4932: LDSB_I	ldsb	[%r16 + 0x004b], %r28
	.word 0xfad5c020  ! 4935: LDSHA_R	ldsha	[%r23, %r0] 0x01, %r29
	.word 0xfe8d0020  ! 4936: LDUBA_R	lduba	[%r20, %r0] 0x01, %r31
	ta	T_CHANGE_TO_TL1
T2_asi_reg_rd_228:
	mov	0x6, %r14
	.word 0xfcdb84a0  ! 4939: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_2_410:
	setx	0x450131, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_396:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_396), 16, 16)) -> intp(2, 0, 1)
	.word 0xfedde16c  ! 4949: LDXA_I	ldxa	[%r23, + 0x016c] %asi, %r31
cpu_intr_2_411:
	setx	0x440335, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_2_412:
	setx	0x450325, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_2_397:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_397), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf25d4000  ! 4958: LDX_R	ldx	[%r21 + %r0], %r25
	.word 0xf8cd4020  ! 4961: LDSBA_R	ldsba	[%r21, %r0] 0x01, %r28
iob_intr_2_398:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_398), 16, 16)) -> intp(2, 0, 1b)
iob_intr_2_399:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_399), 16, 16)) -> intp(2, 0, 1)
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x38, %g1
	stxa	%r18, [%g1] 0x58
	.word 0x819838c8  ! 4966: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c8, %hpstate
	.word 0xf0dde183  ! 4968: LDXA_I	ldxa	[%r23, + 0x0183] %asi, %r24
cpu_intr_2_413:
	setx	0x44001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf4cd60b3  ! 4972: LDSBA_I	ldsba	[%r21, + 0x00b3] %asi, %r26
iob_intr_2_400:
!$EV trig_pc_d(2,expr(@VA(.MAIN.iob_intr_2_400), 16, 16)) -> intp(2, 0, 15)
cpu_intr_2_414:
	setx	0x44031f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0254000  ! 4980: SUB_R	sub 	%r21, %r0, %r24
	.word 0xfc04c000  ! 4981: LDUW_R	lduw	[%r19 + %r0], %r30
	.word 0xb0b4c000  ! 4985: ORNcc_R	orncc 	%r19, %r0, %r24
T2_asi_reg_rd_229:
	mov	0x29, %r14
	.word 0xf2db89e0  ! 4987: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
cpu_intr_2_415:
	setx	0x450034, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_TO_TL1
	.word 0xb80c0000  ! 4996: AND_R	and 	%r16, %r0, %r28
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xbda40840  ! 1: FADDd	faddd	%f16, %f0, %f30
cpu_intr_1_0:
	setx	0x1a001b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbac460ea  ! 3: ADDCcc_I	addccc 	%r17, 0x00ea, %r29
	.word 0xb1a00520  ! 7: FSQRTs	fsqrt	
cpu_intr_1_1:
	setx	0x1f020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a548e0  ! 17: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_2:
	setx	0x1d0122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb0c58000  ! 25: ADDCcc_R	addccc 	%r22, %r0, %r24
cpu_intr_1_3:
	setx	0x1f0135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a94820  ! 30: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xbba4c960  ! 31: FMULq	dis not found

	.word 0xbfa00520  ! 33: FSQRTs	fsqrt	
	.word 0xb4c4c000  ! 34: ADDCcc_R	addccc 	%r19, %r0, %r26
	.word 0xb685a009  ! 35: ADDcc_I	addcc 	%r22, 0x0009, %r27
	.word 0xb7aac820  ! 38: FMOVGE	fmovs	%fcc1, %f0, %f27
	lda	[%r16 + %g0] 0xf0, %f2
T1_asi_reg_wr_0:
	mov	0x3c8, %r14
	.word 0xf2f38e40  ! 41: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbe34201d  ! 44: SUBC_I	orn 	%r16, 0x001d, %r31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_0:
	mov	0x30, %r14
	.word 0xf0db8e40  ! 49: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_0), 16, 16)) -> intp(1, 0, 15)
cpu_intr_1_4:
	setx	0x1c001d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 57: FMOVN	fmovs	%fcc1, %f0, %f24
cpu_intr_1_5:
	setx	0x1f0308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a50960  ! 59: FMULq	dis not found

cpu_intr_1_6:
	setx	0x1c022c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_1:
	mov	0x3c2, %r14
	.word 0xfedb84a0  ! 61: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb3a00560  ! 68: FSQRTq	fsqrt	
T1_asi_reg_wr_1:
	mov	0x3c0, %r14
	.word 0xf2f38400  ! 78: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
	.word 0xbfaac820  ! 83: FMOVGE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_2:
	mov	0x3c1, %r14
	.word 0xf4db8e80  ! 86: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb5a589a0  ! 98: FDIVs	fdivs	%f22, %f0, %f26
T1_asi_reg_wr_2:
	mov	0x3c3, %r14
	.word 0xf8f384a0  ! 99: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda00540  ! 101: FSQRTd	fsqrt	
cpu_intr_1_7:
	setx	0x1f0212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a40920  ! 104: FMULs	fmuls	%f16, %f0, %f26
	.word 0xb7641800  ! 105: MOVcc_R	<illegal instruction>
T1_asi_reg_wr_3:
	mov	0x3c5, %r14
	.word 0xf0f38e60  ! 106: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
iob_intr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_1), 16, 16)) -> intp(1, 0, 26)
	.word 0xb015610a  ! 109: OR_I	or 	%r21, 0x010a, %r24
T1_asi_reg_wr_4:
	mov	0xf, %r14
	.word 0xf2f384a0  ! 110: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
iob_intr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_2), 16, 16)) -> intp(1, 0, 33)
	.word 0xbfa48940  ! 113: FMULd	fmuld	%f18, %f0, %f62
	.word 0xb20d0000  ! 116: AND_R	and 	%r20, %r0, %r25
cpu_intr_1_8:
	setx	0x1e0033, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_9:
	setx	0x1e012e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_3), 16, 16)) -> intp(1, 0, 27)
	.word 0xb1a80820  ! 126: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
cpu_intr_1_10:
	setx	0x1c0025, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_4), 16, 16)) -> intp(1, 0, 1e)
	.word 0xbba00540  ! 131: FSQRTd	fsqrt	
	.word 0xb9aa0820  ! 132: FMOVA	fmovs	%fcc1, %f0, %f28
cpu_intr_1_11:
	setx	0x1f0307, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c920  ! 135: FMULs	fmuls	%f23, %f0, %f27
iob_intr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_5), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_12:
	setx	0x1c0311, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_13:
	setx	0x1d0126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a50860  ! 143: FADDq	dis not found

iob_intr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_6), 16, 16)) -> intp(1, 0, 38)
	.word 0xb1a80820  ! 146: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb5a94820  ! 150: FMOVCS	fmovs	%fcc1, %f0, %f26
iob_intr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_7), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_8), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_wr_5:
	mov	0x17, %r14
	.word 0xf6f38400  ! 159: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_9), 16, 16)) -> intp(1, 0, 34)
	.word 0xb1a5c960  ! 164: FMULq	dis not found

iob_intr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_10), 16, 16)) -> intp(1, 0, 25)
T1_asi_reg_rd_3:
	mov	0x33, %r14
	.word 0xfadb8e80  ! 167: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_1_14:
	setx	0x1c0321, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xa1902002  ! 169: WRPR_GL_I	wrpr	%r0, 0x0002, %-
cpu_intr_1_15:
	setx	0x1e0202, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_16:
	setx	0x1c0009, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00540  ! 175: FSQRTd	fsqrt	
iob_intr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_11), 16, 16)) -> intp(1, 0, c)
	.word 0xb9aa0820  ! 177: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xbfa84820  ! 180: FMOVE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_17:
	setx	0x1f030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8b40000  ! 184: SUBCcc_R	orncc 	%r16, %r0, %r28
iob_intr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_12), 16, 16)) -> intp(1, 0, 29)
	.word 0xbfa00540  ! 190: FSQRTd	fsqrt	
T1_asi_reg_rd_4:
	mov	0x7, %r14
	.word 0xfadb89e0  ! 192: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda00020  ! 200: FMOVs	fmovs	%f0, %f30
	.word 0xb1aa4820  ! 201: FMOVNE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_18:
	setx	0x1d0138, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_13), 16, 16)) -> intp(1, 0, 7)
	.word 0xb1aa0820  ! 204: FMOVA	fmovs	%fcc1, %f0, %f24
iob_intr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_14), 16, 16)) -> intp(1, 0, 1d)
T1_asi_reg_wr_6:
	mov	0x31, %r14
	.word 0xf6f384a0  ! 207: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbda488e0  ! 212: FSUBq	dis not found

	.word 0xb9a4c8a0  ! 217: FSUBs	fsubs	%f19, %f0, %f28
iob_intr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_15), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb5a80820  ! 219: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_7:
	mov	0x9, %r14
	.word 0xfef38e80  ! 220: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbbaac820  ! 221: FMOVGE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_19:
	setx	0x1c0307, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_5:
	mov	0x3c4, %r14
	.word 0xf8db84a0  ! 224: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xbba5c960  ! 226: FMULq	dis not found

T1_asi_reg_wr_8:
	mov	0x21, %r14
	.word 0xf8f38e40  ! 227: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_20:
	setx	0x1d0129, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aa0820  ! 231: FMOVA	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_6:
	mov	0x29, %r14
	.word 0xf6db8e40  ! 232: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb7aa0820  ! 234: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb1abc820  ! 235: FMOVVC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_9:
	mov	0x3c6, %r14
	.word 0xf2f38e40  ! 239: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb9a40940  ! 241: FMULd	fmuld	%f16, %f0, %f28
	.word 0xb1a409c0  ! 242: FDIVd	fdivd	%f16, %f0, %f24
	.word 0xbb3c0000  ! 244: SRA_R	sra 	%r16, %r0, %r29
cpu_intr_1_21:
	setx	0x1e0128, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00520  ! 246: FSQRTs	fsqrt	
	.word 0xbda00040  ! 248: FMOVd	fmovd	%f0, %f30
iob_intr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_16), 16, 16)) -> intp(1, 0, 18)
	.word 0xb5a81420  ! 251: FMOVRNZ	dis not found

T1_asi_reg_wr_10:
	mov	0x1f, %r14
	.word 0xf8f384a0  ! 252: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfa00520  ! 254: FSQRTs	fsqrt	
iob_intr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_17), 16, 16)) -> intp(1, 0, 36)
cpu_intr_1_22:
	setx	0x1d0019, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a58860  ! 258: FADDq	dis not found

	.word 0xb0254000  ! 259: SUB_R	sub 	%r21, %r0, %r24
	.word 0xb7480000  ! 260: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
T1_asi_reg_rd_7:
	mov	0x34, %r14
	.word 0xfadb8e60  ! 261: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb3a00560  ! 262: FSQRTq	fsqrt	
cpu_intr_1_23:
	setx	0x1c030b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_11:
	mov	0x3c0, %r14
	.word 0xfaf38400  ! 268: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
cpu_intr_1_24:
	setx	0x1d0319, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 275: FMOVN	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb42dc000  ! 280: ANDN_R	andn 	%r23, %r0, %r26
T1_asi_reg_wr_12:
	mov	0x3c1, %r14
	.word 0xf6f38e60  ! 281: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb89c4000  ! 283: XORcc_R	xorcc 	%r17, %r0, %r28
cpu_intr_1_25:
	setx	0x1f012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa48860  ! 286: FADDq	dis not found

cpu_intr_1_26:
	setx	0x1c022a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_18), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb7a489c0  ! 292: FDIVd	fdivd	%f18, %f0, %f58
T1_asi_reg_wr_13:
	mov	0x3c6, %r14
	.word 0xf8f38e60  ! 293: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
T1_asi_reg_wr_14:
	mov	0x3c8, %r14
	.word 0xf4f38400  ! 295: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
iob_intr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_19), 16, 16)) -> intp(1, 0, 5)
iob_intr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_20), 16, 16)) -> intp(1, 0, 33)
T1_asi_reg_rd_8:
	mov	0x3c1, %r14
	.word 0xf6db89e0  ! 299: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
iob_intr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_21), 16, 16)) -> intp(1, 0, 12)
	.word 0xb5ab4820  ! 301: FMOVCC	fmovs	%fcc1, %f0, %f26
T1_asi_reg_rd_9:
	mov	0x3c0, %r14
	.word 0xf6db8e80  ! 302: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
cpu_intr_1_27:
	setx	0x1d0224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb61d0000  ! 304: XOR_R	xor 	%r20, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_10:
	mov	0x1b, %r14
	.word 0xfadb89e0  ! 307: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a8c820  ! 313: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xbda4c960  ! 316: FMULq	dis not found

cpu_intr_1_28:
	setx	0x1e0324, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_11:
	mov	0x3c6, %r14
	.word 0xf0db8e40  ! 318: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_22), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_wr_15:
	mov	0x19, %r14
	.word 0xf8f38400  ! 323: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb1aa8820  ! 324: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb284a049  ! 327: ADDcc_I	addcc 	%r18, 0x0049, %r25
iob_intr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_23), 16, 16)) -> intp(1, 0, 13)
	.word 0xb1a90820  ! 330: FMOVLEU	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_12:
	mov	0x3, %r14
	.word 0xfcdb8e80  ! 332: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
iob_intr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_24), 16, 16)) -> intp(1, 0, 5)
	.word 0xb3a81820  ! 335: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb9aa4820  ! 338: FMOVNE	fmovs	%fcc1, %f0, %f28
iob_intr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_25), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_rd_13:
	mov	0xf, %r14
	.word 0xf2db8e80  ! 342: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
	.word 0xbfa00520  ! 343: FSQRTs	fsqrt	
	.word 0xb5a90820  ! 344: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb1a00040  ! 345: FMOVd	fmovd	%f0, %f24
T1_asi_reg_wr_16:
	mov	0x16, %r14
	.word 0xfaf38e80  ! 346: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
T1_asi_reg_rd_14:
	mov	0x3c8, %r14
	.word 0xfcdb8400  ! 347: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbba509a0  ! 350: FDIVs	fdivs	%f20, %f0, %f29
T1_asi_reg_rd_15:
	mov	0xd, %r14
	.word 0xf4db84a0  ! 351: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb405607e  ! 355: ADD_I	add 	%r21, 0x007e, %r26
T1_asi_reg_rd_16:
	mov	0x25, %r14
	.word 0xf2db8e60  ! 357: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
T1_asi_reg_wr_17:
	mov	0x18, %r14
	.word 0xf0f389e0  ! 360: STXA_R	stxa	%r24, [%r14 + %r0] 0x4f
	.word 0xb9a549a0  ! 361: FDIVs	fdivs	%f21, %f0, %f28
T1_asi_reg_wr_18:
	mov	0x34, %r14
	.word 0xf2f38e80  ! 362: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_19:
	mov	0x33, %r14
	.word 0xfef38e40  ! 367: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_wr_20:
	mov	0x3c8, %r14
	.word 0xfaf384a0  ! 371: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xbfa5c940  ! 373: FMULd	fmuld	%f54, %f0, %f62
	.word 0xb1a94820  ! 375: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb5a98820  ! 376: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xbda58820  ! 378: FADDs	fadds	%f22, %f0, %f30
T1_asi_reg_wr_21:
	mov	0x2b, %r14
	.word 0xf4f38e40  ! 380: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_26), 16, 16)) -> intp(1, 0, 24)
	.word 0xb2b40000  ! 382: SUBCcc_R	orncc 	%r16, %r0, %r25
iob_intr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_27), 16, 16)) -> intp(1, 0, 28)
	.word 0xb1a88820  ! 385: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xbba40920  ! 386: FMULs	fmuls	%f16, %f0, %f29
cpu_intr_1_29:
	setx	0x1c0032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a48940  ! 391: FMULd	fmuld	%f18, %f0, %f24
	.word 0xbba5c960  ! 392: FMULq	dis not found

iob_intr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_28), 16, 16)) -> intp(1, 0, 13)
iob_intr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_29), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_30), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_31), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_wr_22:
	mov	0x14, %r14
	.word 0xf4f38e60  ! 403: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
T1_asi_reg_rd_17:
	mov	0x1b, %r14
	.word 0xf4db8e60  ! 404: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
iob_intr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_32), 16, 16)) -> intp(1, 0, 14)
	.word 0xb1a00520  ! 407: FSQRTs	fsqrt	
iob_intr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_33), 16, 16)) -> intp(1, 0, 36)
	.word 0xbba4c9a0  ! 414: FDIVs	fdivs	%f19, %f0, %f29
cpu_intr_1_30:
	setx	0x1d0025, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_34), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_35), 16, 16)) -> intp(1, 0, 36)
cpu_intr_1_31:
	setx	0x1f0335, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba90820  ! 425: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xbbaa4820  ! 426: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb1a58840  ! 427: FADDd	faddd	%f22, %f0, %f24
	.word 0xbba48860  ! 432: FADDq	dis not found

	.word 0xb9a80820  ! 434: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_18:
	mov	0xc, %r14
	.word 0xfcdb84a0  ! 436: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
cpu_intr_1_32:
	setx	0x1c003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_33:
	setx	0x1d001a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda94820  ! 439: FMOVCS	fmovs	%fcc1, %f0, %f30
iob_intr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_36), 16, 16)) -> intp(1, 0, 34)
iob_intr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_37), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_38), 16, 16)) -> intp(1, 0, 20)
	.word 0xb1ab8820  ! 445: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xbda81820  ! 446: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb5aac820  ! 447: FMOVGE	fmovs	%fcc1, %f0, %f26
iob_intr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_39), 16, 16)) -> intp(1, 0, 22)
	.word 0xb3a50960  ! 449: FMULq	dis not found

	.word 0xb1a00520  ! 450: FSQRTs	fsqrt	
iob_intr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_40), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb9a00520  ! 452: FSQRTs	fsqrt	
cpu_intr_1_34:
	setx	0x1e0229, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_41), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb7520000  ! 462: RDPR_PIL	<illegal instruction>
iob_intr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_42), 16, 16)) -> intp(1, 0, 3d)
T1_asi_reg_rd_19:
	mov	0x16, %r14
	.word 0xfadb8e40  ! 464: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xbe840000  ! 465: ADDcc_R	addcc 	%r16, %r0, %r31
	.word 0xbd2c2001  ! 466: SLL_I	sll 	%r16, 0x0001, %r30
cpu_intr_1_35:
	setx	0x21022d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_36:
	setx	0x230322, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_23:
	mov	0x14, %r14
	.word 0xf0f38e60  ! 476: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbba00560  ! 479: FSQRTq	fsqrt	
	.word 0xb7a549c0  ! 480: FDIVd	fdivd	%f52, %f0, %f58
	.word 0xb1641800  ! 483: MOVcc_R	<illegal instruction>
cpu_intr_1_37:
	setx	0x20023e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba449e0  ! 487: FDIVq	dis not found

cpu_intr_1_38:
	setx	0x200124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a4c840  ! 491: FADDd	faddd	%f50, %f0, %f58
iob_intr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_43), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_44), 16, 16)) -> intp(1, 0, 22)
iob_intr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_45), 16, 16)) -> intp(1, 0, 1d)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_39:
	setx	0x220026, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe348000  ! 498: SUBC_R	orn 	%r18, %r0, %r31
	.word 0xbda409c0  ! 499: FDIVd	fdivd	%f16, %f0, %f30
T1_asi_reg_wr_24:
	mov	0xe, %r14
	.word 0xf8f384a0  ! 502: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_46), 16, 16)) -> intp(1, 0, 18)
	.word 0xb3a80420  ! 509: FMOVRZ	dis not found

	.word 0xba9ce077  ! 513: XORcc_I	xorcc 	%r19, 0x0077, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x859520f2  ! 516: WRPR_TSTATE_I	wrpr	%r20, 0x00f2, %tstate
	.word 0xb7a88820  ! 519: FMOVLE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_20:
	mov	0x37, %r14
	.word 0xf2db8e40  ! 520: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_wr_25:
	mov	0x3c1, %r14
	.word 0xfcf389e0  ! 521: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xb1a00520  ! 522: FSQRTs	fsqrt	
T1_asi_reg_wr_26:
	mov	0x2, %r14
	.word 0xf2f384a0  ! 523: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_1_40:
	setx	0x200233, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_41:
	setx	0x200339, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_42:
	setx	0x22020c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_27:
	mov	0x3c1, %r14
	.word 0xf6f38e40  ! 530: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb1a90820  ! 531: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xb7a58860  ! 533: FADDq	dis not found

	.word 0xb01c8000  ! 534: XOR_R	xor 	%r18, %r0, %r24
iob_intr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_47), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_48), 16, 16)) -> intp(1, 0, 3c)
	.word 0xbba589a0  ! 537: FDIVs	fdivs	%f22, %f0, %f29
	.word 0xbba508c0  ! 540: FSUBd	fsubd	%f20, %f0, %f60
	.word 0xb751c000  ! 542: RDPR_TL	<illegal instruction>
	.word 0xbba4c8a0  ! 543: FSUBs	fsubs	%f19, %f0, %f29
	.word 0xb5a81c20  ! 544: FMOVRGEZ	dis not found

T1_asi_reg_rd_21:
	mov	0x2b, %r14
	.word 0xf4db8e80  ! 545: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_49), 16, 16)) -> intp(1, 0, 16)
cpu_intr_1_43:
	setx	0x230106, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_44:
	setx	0x220006, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_45:
	setx	0x230126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba8c820  ! 555: FMOVL	fmovs	%fcc1, %f0, %f29
cpu_intr_1_46:
	setx	0x210215, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a50960  ! 557: FMULq	dis not found

	.word 0xb1a409c0  ! 558: FDIVd	fdivd	%f16, %f0, %f24
cpu_intr_1_47:
	setx	0x21010c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_48:
	setx	0x230202, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_50), 16, 16)) -> intp(1, 0, 36)
	.word 0xbba50960  ! 566: FMULq	dis not found

	.word 0xb3a5c8c0  ! 567: FSUBd	fsubd	%f54, %f0, %f56
iob_intr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_51), 16, 16)) -> intp(1, 0, 21)
cpu_intr_1_49:
	setx	0x220013, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_52:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_52), 16, 16)) -> intp(1, 0, a)
	.word 0xbfa00560  ! 576: FSQRTq	fsqrt	
iob_intr_1_53:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_53), 16, 16)) -> intp(1, 0, 30)
	.word 0xbda00540  ! 581: FSQRTd	fsqrt	
	.word 0xbda80820  ! 585: FMOVN	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_28:
	mov	0x18, %r14
	.word 0xf6f38e40  ! 586: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb3abc820  ! 587: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb2050000  ! 590: ADD_R	add 	%r20, %r0, %r25
T1_asi_reg_wr_29:
	mov	0x29, %r14
	.word 0xf8f38400  ! 598: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbda44860  ! 599: FADDq	dis not found

iob_intr_1_54:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_54), 16, 16)) -> intp(1, 0, 20)
cpu_intr_1_50:
	setx	0x23032c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_55:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_55), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_wr_30:
	mov	0x18, %r14
	.word 0xfcf38e40  ! 605: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
iob_intr_1_56:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_56), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_51:
	setx	0x21000e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_31:
	mov	0x3c8, %r14
	.word 0xfaf38400  ! 612: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
T1_asi_reg_wr_32:
	mov	0x2, %r14
	.word 0xf0f38e60  ! 613: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
T1_asi_reg_wr_33:
	mov	0x34, %r14
	.word 0xf4f38e40  ! 615: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb7a5c9a0  ! 618: FDIVs	fdivs	%f23, %f0, %f27
	.word 0xb9a90820  ! 619: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xb7a489c0  ! 620: FDIVd	fdivd	%f18, %f0, %f58
	.word 0xbf3d2001  ! 623: SRA_I	sra 	%r20, 0x0001, %r31
T1_asi_reg_rd_22:
	mov	0x38, %r14
	.word 0xfcdb8400  ! 626: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xb7aa4820  ! 628: FMOVNE	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_34:
	mov	0x12, %r14
	.word 0xf4f38e40  ! 629: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_52:
	setx	0x210006, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_23:
	mov	0xe, %r14
	.word 0xf8db8e80  ! 639: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	lda	[%r18 + %g0] 0xf0, %f2
cpu_intr_1_53:
	setx	0x230339, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_54:
	setx	0x200222, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3a448c0  ! 652: FSUBd	fsubd	%f48, %f0, %f56
iob_intr_1_57:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_57), 16, 16)) -> intp(1, 0, 3)
	.word 0xbfa5c940  ! 656: FMULd	fmuld	%f54, %f0, %f62
	.word 0xbba00520  ! 660: FSQRTs	fsqrt	
iob_intr_1_58:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_58), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_rd_24:
	mov	0x1b, %r14
	.word 0xf4db8e60  ! 662: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb3ab0820  ! 664: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb7aac820  ! 667: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xbbab0820  ! 672: FMOVGU	fmovs	%fcc1, %f0, %f29
cpu_intr_1_55:
	setx	0x220338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a80820  ! 677: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xbda508c0  ! 678: FSUBd	fsubd	%f20, %f0, %f30
T1_asi_reg_rd_25:
	mov	0x13, %r14
	.word 0xf0db8e40  ! 680: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_59:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_59), 16, 16)) -> intp(1, 0, 2b)
	.word 0xbba00540  ! 684: FSQRTd	fsqrt	
	.word 0xb3351000  ! 685: SRLX_R	srlx	%r20, %r0, %r25
	.word 0xbba548a0  ! 688: FSUBs	fsubs	%f21, %f0, %f29
T1_asi_reg_wr_35:
	mov	0x2a, %r14
	.word 0xf6f384a0  ! 689: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T1_asi_reg_wr_36:
	mov	0x10, %r14
	.word 0xf2f389e0  ! 690: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xba3c215e  ! 697: XNOR_I	xnor 	%r16, 0x015e, %r29
	.word 0xb5a81c20  ! 699: FMOVRGEZ	dis not found

	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_rd_26:
	mov	0x29, %r14
	.word 0xfadb8e40  ! 703: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_60:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_60), 16, 16)) -> intp(1, 0, 22)
	.word 0xbcbd4000  ! 706: XNORcc_R	xnorcc 	%r21, %r0, %r30
iob_intr_1_61:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_61), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb5a84820  ! 711: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb92c6001  ! 714: SLL_I	sll 	%r17, 0x0001, %r28
iob_intr_1_62:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_62), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_rd_27:
	mov	0x3c0, %r14
	.word 0xf0db8400  ! 717: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_rd_28:
	mov	0x35, %r14
	.word 0xf2db8e80  ! 718: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_1_63:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_63), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_rd_29:
	mov	0x3c3, %r14
	.word 0xf6db8e40  ! 722: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xbba589a0  ! 723: FDIVs	fdivs	%f22, %f0, %f29
cpu_intr_1_56:
	setx	0x200336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_57:
	setx	0x230021, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb734d000  ! 728: SRLX_R	srlx	%r19, %r0, %r27
	.word 0xbba509a0  ! 731: FDIVs	fdivs	%f20, %f0, %f29
	.word 0xb1a58860  ! 736: FADDq	dis not found

cpu_intr_1_58:
	setx	0x210216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a81c20  ! 739: FMOVRGEZ	dis not found

iob_intr_1_64:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_64), 16, 16)) -> intp(1, 0, 31)
	.word 0xbba5c8c0  ! 744: FSUBd	fsubd	%f54, %f0, %f60
T1_asi_reg_rd_30:
	mov	0x8, %r14
	.word 0xf0db8400  ! 745: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb8344000  ! 747: ORN_R	orn 	%r17, %r0, %r28
	.word 0xb7a48940  ! 750: FMULd	fmuld	%f18, %f0, %f58
cpu_intr_1_59:
	setx	0x210216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_65:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_65), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb62cc000  ! 754: ANDN_R	andn 	%r19, %r0, %r27
T1_asi_reg_rd_31:
	mov	0x3c8, %r14
	.word 0xf0db8e40  ! 757: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_rd_32:
	mov	0xa, %r14
	.word 0xf8db8e60  ! 758: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb3a88820  ! 759: FMOVLE	fmovs	%fcc1, %f0, %f25
iob_intr_1_66:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_66), 16, 16)) -> intp(1, 0, 0)
T1_asi_reg_rd_33:
	mov	0x3c8, %r14
	.word 0xf8db8400  ! 762: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_1_60:
	setx	0x230002, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_61:
	setx	0x200003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 769: FSQRTq	fsqrt	
T1_asi_reg_wr_37:
	mov	0x9, %r14
	.word 0xf8f38e40  ! 771: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_67:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_67), 16, 16)) -> intp(1, 0, 36)
cpu_intr_1_62:
	setx	0x20013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 774: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbfa589a0  ! 775: FDIVs	fdivs	%f22, %f0, %f31
	.word 0xbda81c20  ! 777: FMOVRGEZ	dis not found

iob_intr_1_68:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_68), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_rd_34:
	mov	0x3c8, %r14
	.word 0xfedb8e40  ! 780: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb3a509c0  ! 783: FDIVd	fdivd	%f20, %f0, %f56
iob_intr_1_69:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_69), 16, 16)) -> intp(1, 0, 36)
cpu_intr_1_63:
	setx	0x200002, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_70:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_70), 16, 16)) -> intp(1, 0, a)
cpu_intr_1_64:
	setx	0x230012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 794: FMOVN	fmovs	%fcc1, %f0, %f24
	.word 0xbfa00520  ! 795: FSQRTs	fsqrt	
	.word 0xb5a80820  ! 801: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
cpu_intr_1_65:
	setx	0x21030e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_38:
	mov	0x3c0, %r14
	.word 0xf0f384a0  ! 803: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
iob_intr_1_71:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_71), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_66:
	setx	0x22012a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda90820  ! 806: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb9aac820  ! 811: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb3a508e0  ! 812: FSUBq	dis not found

T1_asi_reg_rd_35:
	mov	0x37, %r14
	.word 0xf0db8e60  ! 814: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
T1_asi_reg_wr_39:
	mov	0x1c, %r14
	.word 0xf4f389e0  ! 815: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_36:
	mov	0x37, %r14
	.word 0xfadb8e80  ! 822: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
iob_intr_1_72:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_72), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb1a5c9e0  ! 825: FDIVq	dis not found

	.word 0xb8b54000  ! 826: ORNcc_R	orncc 	%r21, %r0, %r28
	.word 0xbba409c0  ! 827: FDIVd	fdivd	%f16, %f0, %f60
cpu_intr_1_67:
	setx	0x230101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81c20  ! 830: FMOVRGEZ	dis not found

	.word 0xb7a4c8c0  ! 831: FSUBd	fsubd	%f50, %f0, %f58
	.word 0xb2950000  ! 834: ORcc_R	orcc 	%r20, %r0, %r25
	.word 0xb735d000  ! 835: SRLX_R	srlx	%r23, %r0, %r27
	.word 0xbba80820  ! 836: FMOVN	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_40:
	mov	0x3c2, %r14
	.word 0xf0f38e40  ! 839: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb9a88820  ! 840: FMOVLE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_41:
	mov	0x3c3, %r14
	.word 0xf6f38400  ! 844: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
iob_intr_1_73:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_73), 16, 16)) -> intp(1, 0, 3f)
T1_asi_reg_rd_37:
	mov	0x3c0, %r14
	.word 0xf8db8e60  ! 850: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_1_74:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_74), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_rd_38:
	mov	0x5, %r14
	.word 0xf0db8e40  ! 854: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbe258000  ! 855: SUB_R	sub 	%r22, %r0, %r31
cpu_intr_1_68:
	setx	0x210333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c940  ! 857: FMULd	fmuld	%f50, %f0, %f26
	.word 0xb1a00540  ! 859: FSQRTd	fsqrt	
	.word 0xb9a00040  ! 860: FMOVd	fmovd	%f0, %f28
T1_asi_reg_wr_42:
	mov	0x26, %r14
	.word 0xf2f38e40  ! 863: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb8b5c000  ! 865: SUBCcc_R	orncc 	%r23, %r0, %r28
	.word 0xb3a90820  ! 866: FMOVLEU	fmovs	%fcc1, %f0, %f25
cpu_intr_1_69:
	setx	0x22011b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a589c0  ! 871: FDIVd	fdivd	%f22, %f0, %f26
	.word 0xbdab0820  ! 872: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb5a94820  ! 877: FMOVCS	fmovs	%fcc1, %f0, %f26
iob_intr_1_75:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_75), 16, 16)) -> intp(1, 0, 1a)
cpu_intr_1_70:
	setx	0x21013d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_76:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_76), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb935d000  ! 884: SRLX_R	srlx	%r23, %r0, %r28
T1_asi_reg_wr_43:
	mov	0x3c3, %r14
	.word 0xfef38e80  ! 887: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
T1_asi_reg_rd_39:
	mov	0x3c0, %r14
	.word 0xfadb8e80  ! 888: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb3a488e0  ! 889: FSUBq	dis not found

	.word 0xb1a00560  ! 891: FSQRTq	fsqrt	
cpu_intr_1_71:
	setx	0x210331, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b4a15b  ! 894: ORNcc_I	orncc 	%r18, 0x015b, %r27
	.word 0xbba5c840  ! 896: FADDd	faddd	%f54, %f0, %f60
cpu_intr_1_72:
	setx	0x200124, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c9c0  ! 902: FDIVd	fdivd	%f50, %f0, %f26
	.word 0xb5a8c820  ! 903: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb3a448c0  ! 904: FSUBd	fsubd	%f48, %f0, %f56
	.word 0xb7a8c820  ! 905: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb9a80420  ! 907: FMOVRZ	dis not found

T1_asi_reg_wr_44:
	mov	0x23, %r14
	.word 0xf6f38e60  ! 913: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb9a508e0  ! 914: FSUBq	dis not found

	.word 0xbfa80820  ! 916: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb3a00040  ! 917: FMOVd	fmovd	%f0, %f56
	.word 0xbbaa0820  ! 919: FMOVA	fmovs	%fcc1, %f0, %f29
cpu_intr_1_73:
	setx	0x250134, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_74:
	setx	0x27021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	lda	[%r22 + %g0] 0xf0, %f2
iob_intr_1_77:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_77), 16, 16)) -> intp(1, 0, f)
	.word 0xb9a449a0  ! 942: FDIVs	fdivs	%f17, %f0, %f28
T1_asi_reg_wr_45:
	mov	0x3c0, %r14
	.word 0xf8f389e0  ! 944: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb7a9c820  ! 945: FMOVVS	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_75:
	setx	0x27013c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a588e0  ! 949: FSUBq	dis not found

	.word 0xbba4c840  ! 952: FADDd	faddd	%f50, %f0, %f60
	.word 0xbb35f001  ! 954: SRLX_I	srlx	%r23, 0x0001, %r29
T1_asi_reg_rd_40:
	mov	0x3c8, %r14
	.word 0xfcdb8e60  ! 956: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_1_78:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_78), 16, 16)) -> intp(1, 0, 24)
	.word 0xbda44960  ! 961: FMULq	dis not found

cpu_intr_1_76:
	setx	0x270230, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_77:
	setx	0x260315, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_46:
	mov	0x3c7, %r14
	.word 0xf2f384a0  ! 965: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbfab8820  ! 967: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb5a81820  ! 968: FMOVRGZ	fmovs	%fcc3, %f0, %f26
T1_asi_reg_wr_47:
	mov	0x21, %r14
	.word 0xf4f38e40  ! 972: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_78:
	setx	0x25002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_79:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_79), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb3a00020  ! 976: FMOVs	fmovs	%f0, %f25
T1_asi_reg_rd_41:
	mov	0x36, %r14
	.word 0xfadb89e0  ! 978: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb234c000  ! 983: SUBC_R	orn 	%r19, %r0, %r25
T1_asi_reg_wr_48:
	mov	0x2f, %r14
	.word 0xf4f384a0  ! 986: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
cpu_intr_1_79:
	setx	0x24020b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_42:
	mov	0x1a, %r14
	.word 0xf4db8e60  ! 990: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb9a5c960  ! 992: FMULq	dis not found

T1_asi_reg_wr_49:
	mov	0x1e, %r14
	.word 0xf4f384a0  ! 995: STXA_R	stxa	%r26, [%r14 + %r0] 0x25
	.word 0xb6b5a0f9  ! 997: SUBCcc_I	orncc 	%r22, 0x00f9, %r27
	.word 0xbc3561f0  ! 998: ORN_I	orn 	%r21, 0x01f0, %r30
	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_rd_43:
	mov	0x3c3, %r14
	.word 0xfedb8e40  ! 1005: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb52d1000  ! 1012: SLLX_R	sllx	%r20, %r0, %r26
	.word 0xbda588a0  ! 1014: FSUBs	fsubs	%f22, %f0, %f30
cpu_intr_1_80:
	setx	0x27011a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_80:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_80), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbaada1c9  ! 1018: ANDNcc_I	andncc 	%r22, 0x01c9, %r29
	.word 0xb7a44940  ! 1019: FMULd	fmuld	%f48, %f0, %f58
	.word 0xb5a40820  ! 1020: FADDs	fadds	%f16, %f0, %f26
cpu_intr_1_81:
	setx	0x25021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a98820  ! 1029: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb3a589a0  ! 1030: FDIVs	fdivs	%f22, %f0, %f25
	.word 0xbb2c5000  ! 1031: SLLX_R	sllx	%r17, %r0, %r29
	.word 0xb7a50920  ! 1032: FMULs	fmuls	%f20, %f0, %f27
cpu_intr_1_82:
	setx	0x24002e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_81:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_81), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb5a508c0  ! 1038: FSUBd	fsubd	%f20, %f0, %f26
iob_intr_1_82:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_82), 16, 16)) -> intp(1, 0, 0)
	.word 0xbba80420  ! 1042: FMOVRZ	dis not found

iob_intr_1_83:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_83), 16, 16)) -> intp(1, 0, 33)
	.word 0xbfa81420  ! 1047: FMOVRNZ	dis not found

T1_asi_reg_rd_44:
	mov	0x12, %r14
	.word 0xfcdb89e0  ! 1052: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
iob_intr_1_84:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_84), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_83:
	setx	0x270036, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r21 + %g0] 0xf0, %f2
cpu_intr_1_84:
	setx	0x270308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_85:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_85), 16, 16)) -> intp(1, 0, 22)
T1_asi_reg_rd_45:
	mov	0xd, %r14
	.word 0xfcdb8e40  ! 1062: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
iob_intr_1_86:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_86), 16, 16)) -> intp(1, 0, 2)
	.word 0xb01c0000  ! 1068: XOR_R	xor 	%r16, %r0, %r24
	.word 0xbda80420  ! 1069: FMOVRZ	dis not found

cpu_intr_1_85:
	setx	0x260213, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00560  ! 1071: FSQRTq	fsqrt	
cpu_intr_1_86:
	setx	0x270308, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_87:
	setx	0x270037, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba00520  ! 1078: FSQRTs	fsqrt	
T1_asi_reg_wr_50:
	mov	0x7, %r14
	.word 0xfcf389e0  ! 1079: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
	.word 0xbeb44000  ! 1080: ORNcc_R	orncc 	%r17, %r0, %r31
iob_intr_1_87:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_87), 16, 16)) -> intp(1, 0, 39)
T1_asi_reg_rd_46:
	mov	0x3c1, %r14
	.word 0xf4db8e40  ! 1082: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_wr_51:
	mov	0x2a, %r14
	.word 0xf4f38e40  ! 1083: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_88:
	setx	0x24002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9abc820  ! 1087: FMOVVC	fmovs	%fcc1, %f0, %f28
cpu_intr_1_89:
	setx	0x260125, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_88:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_88), 16, 16)) -> intp(1, 0, 20)
	.word 0xbda50860  ! 1091: FADDq	dis not found

iob_intr_1_89:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_89), 16, 16)) -> intp(1, 0, 2e)
cpu_intr_1_90:
	setx	0x270338, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_90:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_90), 16, 16)) -> intp(1, 0, 20)
	.word 0xb7a449c0  ! 1097: FDIVd	fdivd	%f48, %f0, %f58
	.word 0xbe9ca024  ! 1101: XORcc_I	xorcc 	%r18, 0x0024, %r31
	.word 0xb1a81c20  ! 1104: FMOVRGEZ	dis not found

iob_intr_1_91:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_91), 16, 16)) -> intp(1, 0, 13)
iob_intr_1_92:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_92), 16, 16)) -> intp(1, 0, 7)
	.word 0xb7a50820  ! 1115: FADDs	fadds	%f20, %f0, %f27
	.word 0xb82460db  ! 1118: SUB_I	sub 	%r17, 0x00db, %r28
	.word 0xb3a00540  ! 1119: FSQRTd	fsqrt	
T1_asi_reg_rd_47:
	mov	0x9, %r14
	.word 0xf8db8e40  ! 1121: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_rd_48:
	mov	0x17, %r14
	.word 0xf6db8e80  ! 1122: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbda489c0  ! 1123: FDIVd	fdivd	%f18, %f0, %f30
	.word 0xbb504000  ! 1124: RDPR_TNPC	<illegal instruction>
	.word 0xbda54840  ! 1129: FADDd	faddd	%f52, %f0, %f30
	.word 0xb0bd614b  ! 1131: XNORcc_I	xnorcc 	%r21, 0x014b, %r24
T1_asi_reg_rd_49:
	mov	0x2d, %r14
	.word 0xfcdb8e40  ! 1132: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
T1_asi_reg_rd_50:
	mov	0x38, %r14
	.word 0xfedb84a0  ! 1135: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
T1_asi_reg_rd_51:
	mov	0x4, %r14
	.word 0xf6db8400  ! 1136: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb5a5c940  ! 1137: FMULd	fmuld	%f54, %f0, %f26
	.word 0xb1a84820  ! 1138: FMOVE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_52:
	mov	0x3c5, %r14
	.word 0xf0f38400  ! 1140: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	.word 0xba44205b  ! 1147: ADDC_I	addc 	%r16, 0x005b, %r29
cpu_intr_1_91:
	setx	0x25000b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_92:
	setx	0x250029, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_53:
	mov	0x3c5, %r14
	.word 0xf0f38400  ! 1152: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
	lda	[%r21 + %g0] 0xf0, %f2
	lda	[%r21 + %g0] 0xf0, %f2
T1_asi_reg_rd_52:
	mov	0x23, %r14
	.word 0xfedb8e40  ! 1160: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbfab0820  ! 1161: FMOVGU	fmovs	%fcc1, %f0, %f31
iob_intr_1_93:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_93), 16, 16)) -> intp(1, 0, 35)
	.word 0xb7ab4820  ! 1165: FMOVCC	fmovs	%fcc1, %f0, %f27
cpu_intr_1_93:
	setx	0x24022a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_54:
	mov	0x29, %r14
	.word 0xfef389e0  ! 1167: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb7a48820  ! 1170: FADDs	fadds	%f18, %f0, %f27
	.word 0xbda00520  ! 1174: FSQRTs	fsqrt	
iob_intr_1_94:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_94), 16, 16)) -> intp(1, 0, 4)
	.word 0xbeb4203f  ! 1178: SUBCcc_I	orncc 	%r16, 0x003f, %r31
T1_asi_reg_rd_53:
	mov	0x3c6, %r14
	.word 0xf6db8e80  ! 1179: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbba44820  ! 1182: FADDs	fadds	%f17, %f0, %f29
	.word 0xbfa489e0  ! 1185: FDIVq	dis not found

T1_asi_reg_rd_54:
	mov	0x5, %r14
	.word 0xf2db8e80  ! 1186: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_1_94:
	setx	0x27002a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_55:
	mov	0x24, %r14
	.word 0xfaf389e0  ! 1190: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xbfaa4820  ! 1191: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbba4c8c0  ! 1192: FSUBd	fsubd	%f50, %f0, %f60
T1_asi_reg_wr_56:
	mov	0x2c, %r14
	.word 0xf4f38400  ! 1196: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T1_asi_reg_rd_55:
	mov	0x10, %r14
	.word 0xfedb8e40  ! 1198: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
cpu_intr_1_95:
	setx	0x270309, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_96:
	setx	0x260122, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_95:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_95), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb9a8c820  ! 1204: FMOVL	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_57:
	mov	0x10, %r14
	.word 0xf6f38e40  ! 1205: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb1a489e0  ! 1207: FDIVq	dis not found

iob_intr_1_96:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_96), 16, 16)) -> intp(1, 0, 1)
	.word 0xb3a00540  ! 1212: FSQRTd	fsqrt	
	.word 0xb8ade1c9  ! 1214: ANDNcc_I	andncc 	%r23, 0x01c9, %r28
iob_intr_1_97:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_97), 16, 16)) -> intp(1, 0, 30)
cpu_intr_1_97:
	setx	0x26031d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_98:
	setx	0x270101, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba14c000  ! 1223: OR_R	or 	%r19, %r0, %r29
	.word 0xb3a588a0  ! 1225: FSUBs	fsubs	%f22, %f0, %f25
	.word 0xb8bd20ff  ! 1226: XNORcc_I	xnorcc 	%r20, 0x00ff, %r28
	.word 0xb29ce0b1  ! 1231: XORcc_I	xorcc 	%r19, 0x00b1, %r25
	.word 0xbba58820  ! 1234: FADDs	fadds	%f22, %f0, %f29
iob_intr_1_98:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_98), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_wr_58:
	mov	0x24, %r14
	.word 0xf8f38400  ! 1237: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb7abc820  ! 1238: FMOVVC	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_59:
	mov	0x3c3, %r14
	.word 0xf4f38e40  ! 1241: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbba589e0  ! 1242: FDIVq	dis not found

	.word 0xbba00520  ! 1245: FSQRTs	fsqrt	
	.word 0xb9a8c820  ! 1246: FMOVL	fmovs	%fcc1, %f0, %f28
iob_intr_1_99:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_99), 16, 16)) -> intp(1, 0, a)
iob_intr_1_100:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_100), 16, 16)) -> intp(1, 0, 18)
cpu_intr_1_99:
	setx	0x26013b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_56:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 1255: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbb359000  ! 1256: SRLX_R	srlx	%r22, %r0, %r29
	.word 0xb9a48840  ! 1257: FADDd	faddd	%f18, %f0, %f28
iob_intr_1_101:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_101), 16, 16)) -> intp(1, 0, e)
	.word 0xb1a00560  ! 1261: FSQRTq	fsqrt	
T1_asi_reg_wr_60:
	mov	0xd, %r14
	.word 0xfef389e0  ! 1263: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
iob_intr_1_102:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_102), 16, 16)) -> intp(1, 0, c)
	.word 0xb80ca032  ! 1268: AND_I	and 	%r18, 0x0032, %r28
	.word 0xb7a81820  ! 1271: FMOVRGZ	fmovs	%fcc3, %f0, %f27
T1_asi_reg_rd_57:
	mov	0xc, %r14
	.word 0xfadb8e40  ! 1274: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_rd_58:
	mov	0x10, %r14
	.word 0xf0db84a0  ! 1277: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T1_asi_reg_wr_61:
	mov	0x35, %r14
	.word 0xf2f38e80  ! 1280: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbba58940  ! 1281: FMULd	fmuld	%f22, %f0, %f60
cpu_intr_1_100:
	setx	0x260002, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe94e107  ! 1285: ORcc_I	orcc 	%r19, 0x0107, %r31
	.word 0xb7a00040  ! 1287: FMOVd	fmovd	%f0, %f58
	.word 0xb6a4a089  ! 1288: SUBcc_I	subcc 	%r18, 0x0089, %r27
	.word 0xb69dc000  ! 1290: XORcc_R	xorcc 	%r23, %r0, %r27
	.word 0xbfa40960  ! 1292: FMULq	dis not found

cpu_intr_1_101:
	setx	0x27033b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80c20  ! 1295: FMOVRLZ	dis not found

	.word 0xbfa81820  ! 1296: FMOVRGZ	fmovs	%fcc3, %f0, %f31
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
	.word 0xb03c8000  ! 1299: XNOR_R	xnor 	%r18, %r0, %r24
T1_asi_reg_wr_62:
	mov	0xf, %r14
	.word 0xf2f389e0  ! 1300: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
cpu_intr_1_102:
	setx	0x250220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_103:
	setx	0x26022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_103:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_103), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_104:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_104), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_rd_59:
	mov	0x24, %r14
	.word 0xfedb84a0  ! 1306: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
iob_intr_1_105:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_105), 16, 16)) -> intp(1, 0, 17)
	.word 0xb3a48960  ! 1308: FMULq	dis not found

	.word 0xb625e058  ! 1309: SUB_I	sub 	%r23, 0x0058, %r27
T1_asi_reg_rd_60:
	mov	0x23, %r14
	.word 0xf6db8e60  ! 1310: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb5a489a0  ! 1312: FDIVs	fdivs	%f18, %f0, %f26
iob_intr_1_106:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_106), 16, 16)) -> intp(1, 0, 23)
T1_asi_reg_rd_61:
	mov	0xc, %r14
	.word 0xf8db89e0  ! 1316: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb7a548a0  ! 1317: FSUBs	fsubs	%f21, %f0, %f27
	.word 0xb7a00540  ! 1318: FSQRTd	fsqrt	
	.word 0xb1ab0820  ! 1319: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xbfa90820  ! 1320: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xbda00540  ! 1321: FSQRTd	fsqrt	
cpu_intr_1_104:
	setx	0x240336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_105:
	setx	0x250120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aa0820  ! 1330: FMOVA	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_63:
	mov	0x3c8, %r14
	.word 0xfcf38400  ! 1332: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
	.word 0xb1abc820  ! 1336: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xb3a54860  ! 1337: FADDq	dis not found

	.word 0xb7a4c960  ! 1340: FMULq	dis not found

cpu_intr_1_106:
	setx	0x27020c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda88820  ! 1345: FMOVLE	fmovs	%fcc1, %f0, %f30
iob_intr_1_107:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_107), 16, 16)) -> intp(1, 0, 30)
	.word 0xbe0c4000  ! 1349: AND_R	and 	%r17, %r0, %r31
iob_intr_1_108:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_108), 16, 16)) -> intp(1, 0, 24)
cpu_intr_1_107:
	setx	0x27013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb53cf001  ! 1355: SRAX_I	srax	%r19, 0x0001, %r26
	.word 0xbda44960  ! 1358: FMULq	dis not found

	.word 0xb1a50940  ! 1359: FMULd	fmuld	%f20, %f0, %f24
iob_intr_1_109:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_109), 16, 16)) -> intp(1, 0, 19)
	.word 0xb2950000  ! 1361: ORcc_R	orcc 	%r20, %r0, %r25
iob_intr_1_110:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_110), 16, 16)) -> intp(1, 0, 2a)
iob_intr_1_111:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_111), 16, 16)) -> intp(1, 0, 30)
	.word 0xb5a00520  ! 1368: FSQRTs	fsqrt	
cpu_intr_1_108:
	setx	0x25000f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aa8820  ! 1374: FMOVG	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb2a4c000  ! 1376: SUBcc_R	subcc 	%r19, %r0, %r25
	.word 0xbfa81820  ! 1377: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb4a50000  ! 1378: SUBcc_R	subcc 	%r20, %r0, %r26
T1_asi_reg_rd_62:
	mov	0x3c2, %r14
	.word 0xfedb8e40  ! 1382: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xb9a81c20  ! 1385: FMOVRGEZ	dis not found

iob_intr_1_112:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_112), 16, 16)) -> intp(1, 0, 20)
T1_asi_reg_wr_64:
	mov	0x22, %r14
	.word 0xf6f384a0  ! 1387: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xbda8c820  ! 1389: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xbca460df  ! 1392: SUBcc_I	subcc 	%r17, 0x00df, %r30
iob_intr_1_113:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_113), 16, 16)) -> intp(1, 0, 28)
	.word 0xbda4c9e0  ! 1396: FDIVq	dis not found

cpu_intr_1_109:
	setx	0x2b002a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_110:
	setx	0x28013d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_63:
	mov	0x1c, %r14
	.word 0xf8db8400  ! 1404: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
T1_asi_reg_wr_65:
	mov	0x32, %r14
	.word 0xfcf384a0  ! 1405: STXA_R	stxa	%r30, [%r14 + %r0] 0x25
iob_intr_1_114:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_114), 16, 16)) -> intp(1, 0, 34)
	.word 0xb1a88820  ! 1413: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xbdabc820  ! 1414: FMOVVC	fmovs	%fcc1, %f0, %f30
iob_intr_1_115:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_115), 16, 16)) -> intp(1, 0, 30)
	.word 0xb5a50960  ! 1417: FMULq	dis not found

cpu_intr_1_111:
	setx	0x2b0300, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_116:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_116), 16, 16)) -> intp(1, 0, 23)
	.word 0xb9a4c960  ! 1420: FMULq	dis not found

	.word 0xbfaa0820  ! 1431: FMOVA	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_66:
	mov	0x3c3, %r14
	.word 0xfef38400  ! 1434: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
cpu_intr_1_112:
	setx	0x28002b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_117:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_117), 16, 16)) -> intp(1, 0, 11)
	.word 0xb605e158  ! 1440: ADD_I	add 	%r23, 0x0158, %r27
	.word 0xbfa48840  ! 1441: FADDd	faddd	%f18, %f0, %f62
cpu_intr_1_113:
	setx	0x2a031c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa588e0  ! 1446: FSUBq	dis not found

	.word 0xb5a50840  ! 1448: FADDd	faddd	%f20, %f0, %f26
iob_intr_1_118:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_118), 16, 16)) -> intp(1, 0, 3c)
	.word 0x899561a1  ! 1450: WRPR_TICK_I	wrpr	%r21, 0x01a1, %tick
	.word 0xbda00540  ! 1451: FSQRTd	fsqrt	
	.word 0xbda00520  ! 1452: FSQRTs	fsqrt	
	.word 0xb49de19d  ! 1457: XORcc_I	xorcc 	%r23, 0x019d, %r26
	.word 0xb8856181  ! 1458: ADDcc_I	addcc 	%r21, 0x0181, %r28
T1_asi_reg_wr_67:
	mov	0x2, %r14
	.word 0xf8f384a0  ! 1461: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xbd34d000  ! 1464: SRLX_R	srlx	%r19, %r0, %r30
	.word 0xbba88820  ! 1465: FMOVLE	fmovs	%fcc1, %f0, %f29
	.word 0xb3a48840  ! 1467: FADDd	faddd	%f18, %f0, %f56
	.word 0xb00d4000  ! 1468: AND_R	and 	%r21, %r0, %r24
T1_asi_reg_rd_64:
	mov	0xe, %r14
	.word 0xfadb89e0  ! 1469: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb1a88820  ! 1470: FMOVLE	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_65:
	mov	0x1b, %r14
	.word 0xf6db84a0  ! 1473: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
cpu_intr_1_114:
	setx	0x28011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb49c4000  ! 1476: XORcc_R	xorcc 	%r17, %r0, %r26
cpu_intr_1_115:
	setx	0x29030b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00520  ! 1481: FSQRTs	fsqrt	
	.word 0xbda98820  ! 1482: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb3a4c860  ! 1483: FADDq	dis not found

iob_intr_1_119:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_119), 16, 16)) -> intp(1, 0, 14)
	.word 0xb1a4c9c0  ! 1486: FDIVd	fdivd	%f50, %f0, %f24
	.word 0xba1560bd  ! 1490: OR_I	or 	%r21, 0x00bd, %r29
	.word 0xbba589e0  ! 1491: FDIVq	dis not found

cpu_intr_1_116:
	setx	0x2a033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c960  ! 1495: FMULq	dis not found

T1_asi_reg_wr_68:
	mov	0x14, %r14
	.word 0xf6f384a0  ! 1498: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
iob_intr_1_120:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_120), 16, 16)) -> intp(1, 0, 2d)
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbe44214c  ! 1506: ADDC_I	addc 	%r16, 0x014c, %r31
iob_intr_1_121:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_121), 16, 16)) -> intp(1, 0, 36)
	.word 0xb3a98820  ! 1508: FMOVNEG	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_69:
	mov	0x1d, %r14
	.word 0xf4f38400  ! 1509: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T1_asi_reg_wr_70:
	mov	0x3c2, %r14
	.word 0xfcf38e60  ! 1511: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	.word 0xb1a94820  ! 1513: FMOVCS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_66:
	mov	0x1b, %r14
	.word 0xfadb8400  ! 1514: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xb73db001  ! 1515: SRAX_I	srax	%r22, 0x0001, %r27
cpu_intr_1_117:
	setx	0x2a0030, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda58960  ! 1519: FMULq	dis not found

	.word 0xbfa90820  ! 1522: FMOVLEU	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_71:
	mov	0x3c8, %r14
	.word 0xf6f38e40  ! 1523: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
cpu_intr_1_118:
	setx	0x2b0033, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_72:
	mov	0x3c2, %r14
	.word 0xf0f38e80  ! 1528: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
	.word 0xb1a00540  ! 1531: FSQRTd	fsqrt	
	.word 0xb7a90820  ! 1532: FMOVLEU	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_67:
	mov	0x3c3, %r14
	.word 0xf0db8e40  ! 1533: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
iob_intr_1_122:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_122), 16, 16)) -> intp(1, 0, 26)
	.word 0xbba449a0  ! 1536: FDIVs	fdivs	%f17, %f0, %f29
T1_asi_reg_wr_73:
	mov	0x3c6, %r14
	.word 0xf2f38400  ! 1537: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
T1_asi_reg_wr_74:
	mov	0x3, %r14
	.word 0xf0f38e80  ! 1540: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
cpu_intr_1_119:
	setx	0x2a0218, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_123:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_123), 16, 16)) -> intp(1, 0, 31)
	.word 0xb1a00540  ! 1544: FSQRTd	fsqrt	
T1_asi_reg_rd_68:
	mov	0x3c8, %r14
	.word 0xf2db8e40  ! 1545: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_120:
	setx	0x2b003c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_124:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_124), 16, 16)) -> intp(1, 0, 2a)
iob_intr_1_125:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_125), 16, 16)) -> intp(1, 0, 28)
iob_intr_1_126:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_126), 16, 16)) -> intp(1, 0, 1f)
	.word 0xbda00040  ! 1551: FMOVd	fmovd	%f0, %f30
	.word 0xbba58820  ! 1552: FADDs	fadds	%f22, %f0, %f29
cpu_intr_1_121:
	setx	0x29032c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa54960  ! 1558: FMULq	dis not found

iob_intr_1_127:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_127), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_wr_75:
	mov	0x2, %r14
	.word 0xf6f38e60  ! 1562: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
	.word 0xb1aa4820  ! 1565: FMOVNE	fmovs	%fcc1, %f0, %f24
iob_intr_1_128:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_128), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb9a8c820  ! 1568: FMOVL	fmovs	%fcc1, %f0, %f28
iob_intr_1_129:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_129), 16, 16)) -> intp(1, 0, 16)
iob_intr_1_130:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_130), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_wr_76:
	mov	0x16, %r14
	.word 0xf2f384a0  ! 1574: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
cpu_intr_1_122:
	setx	0x2a011a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_69:
	mov	0x1b, %r14
	.word 0xf2db8400  ! 1579: LDXA_R	ldxa	[%r14, %r0] 0x20, %r25
cpu_intr_1_123:
	setx	0x290126, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_131:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_131), 16, 16)) -> intp(1, 0, 2c)
	.word 0xbfa00020  ! 1584: FMOVs	fmovs	%f0, %f31
iob_intr_1_132:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_132), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_124:
	setx	0x290031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a588a0  ! 1588: FSUBs	fsubs	%f22, %f0, %f27
iob_intr_1_133:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_133), 16, 16)) -> intp(1, 0, 32)
	.word 0xbfa4c820  ! 1596: FADDs	fadds	%f19, %f0, %f31
	.word 0xbc1d0000  ! 1597: XOR_R	xor 	%r20, %r0, %r30
	.word 0xb1a00540  ! 1601: FSQRTd	fsqrt	
cpu_intr_1_125:
	setx	0x280029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a489c0  ! 1603: FDIVd	fdivd	%f18, %f0, %f24
T1_asi_reg_wr_77:
	mov	0x3c3, %r14
	.word 0xfef389e0  ! 1604: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbba94820  ! 1605: FMOVCS	fmovs	%fcc1, %f0, %f29
iob_intr_1_134:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_134), 16, 16)) -> intp(1, 0, 29)
cpu_intr_1_126:
	setx	0x2b0025, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_127:
	setx	0x2a012c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_78:
	mov	0x37, %r14
	.word 0xf8f384a0  ! 1611: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
	.word 0xb0354000  ! 1614: SUBC_R	orn 	%r21, %r0, %r24
cpu_intr_1_128:
	setx	0x2a0332, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_70:
	mov	0x3c4, %r14
	.word 0xfcdb8e40  ! 1618: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb68ca10a  ! 1619: ANDcc_I	andcc 	%r18, 0x010a, %r27
	.word 0xb1a00520  ! 1621: FSQRTs	fsqrt	
iob_intr_1_135:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_135), 16, 16)) -> intp(1, 0, 6)
	.word 0xbda80820  ! 1627: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
cpu_intr_1_129:
	setx	0x2b0027, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_79:
	mov	0x1d, %r14
	.word 0xfaf384a0  ! 1632: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T1_asi_reg_rd_71:
	mov	0xb, %r14
	.word 0xf4db8e80  ! 1634: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
iob_intr_1_136:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_136), 16, 16)) -> intp(1, 0, 4)
	.word 0xbeb5e1ca  ! 1636: SUBCcc_I	orncc 	%r23, 0x01ca, %r31
	.word 0xb9a50820  ! 1638: FADDs	fadds	%f20, %f0, %f28
	.word 0xb1a00540  ! 1640: FSQRTd	fsqrt	
iob_intr_1_137:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_137), 16, 16)) -> intp(1, 0, 23)
	.word 0xb5a00520  ! 1648: FSQRTs	fsqrt	
iob_intr_1_138:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_138), 16, 16)) -> intp(1, 0, 1)
	.word 0xb5355000  ! 1652: SRLX_R	srlx	%r21, %r0, %r26
	.word 0xb3a00560  ! 1653: FSQRTq	fsqrt	
cpu_intr_1_130:
	setx	0x28002b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_131:
	setx	0x2a023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_139:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_139), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_rd_72:
	mov	0x27, %r14
	.word 0xf2db8e60  ! 1660: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
iob_intr_1_140:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_140), 16, 16)) -> intp(1, 0, 15)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb32c4000  ! 1668: SLL_R	sll 	%r17, %r0, %r25
T1_asi_reg_rd_73:
	mov	0x7, %r14
	.word 0xfadb8e60  ! 1669: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_1_132:
	setx	0x28031f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_141:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_141), 16, 16)) -> intp(1, 0, 2f)
cpu_intr_1_133:
	setx	0x2b0333, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbcc52026  ! 1679: ADDCcc_I	addccc 	%r20, 0x0026, %r30
	.word 0xb3a90820  ! 1681: FMOVLEU	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_142:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_142), 16, 16)) -> intp(1, 0, 21)
iob_intr_1_143:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_143), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbfab0820  ! 1686: FMOVGU	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_74:
	mov	0xf, %r14
	.word 0xf6db89e0  ! 1687: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
	.word 0xbba81c20  ! 1689: FMOVRGEZ	dis not found

	lda	[%r22 + %g0] 0xf0, %f2
iob_intr_1_144:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_144), 16, 16)) -> intp(1, 0, 1b)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_145:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_145), 16, 16)) -> intp(1, 0, 36)
cpu_intr_1_134:
	setx	0x280228, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_75:
	mov	0x2b, %r14
	.word 0xfadb89e0  ! 1698: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb02ca188  ! 1700: ANDN_I	andn 	%r18, 0x0188, %r24
iob_intr_1_146:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_146), 16, 16)) -> intp(1, 0, 29)
	.word 0xb1a408a0  ! 1704: FSUBs	fsubs	%f16, %f0, %f24
	.word 0xbda00520  ! 1705: FSQRTs	fsqrt	
	.word 0x83956094  ! 1706: WRPR_TNPC_I	wrpr	%r21, 0x0094, %tnpc
T1_asi_reg_rd_76:
	mov	0x2f, %r14
	.word 0xf4db89e0  ! 1708: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xbbab8820  ! 1710: FMOVPOS	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_77:
	mov	0x2, %r14
	.word 0xfcdb8e60  ! 1713: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
iob_intr_1_147:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_147), 16, 16)) -> intp(1, 0, 22)
	.word 0xb9a88820  ! 1716: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xbda488c0  ! 1718: FSUBd	fsubd	%f18, %f0, %f30
	.word 0xb02dc000  ! 1724: ANDN_R	andn 	%r23, %r0, %r24
T1_asi_reg_wr_80:
	mov	0x0, %r14
	.word 0xf2f38e80  ! 1728: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xb3a588e0  ! 1729: FSUBq	dis not found

T1_asi_reg_wr_81:
	mov	0x3c3, %r14
	.word 0xf0f38e40  ! 1731: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb9a00040  ! 1734: FMOVd	fmovd	%f0, %f28
	.word 0xb0bc0000  ! 1736: XNORcc_R	xnorcc 	%r16, %r0, %r24
iob_intr_1_148:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_148), 16, 16)) -> intp(1, 0, 14)
	.word 0xb3a80c20  ! 1738: FMOVRLZ	dis not found

T1_asi_reg_rd_78:
	mov	0x31, %r14
	.word 0xfcdb8e40  ! 1739: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb3a40920  ! 1741: FMULs	fmuls	%f16, %f0, %f25
iob_intr_1_149:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_149), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_wr_82:
	mov	0x28, %r14
	.word 0xf2f38e80  ! 1743: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
	.word 0xbb480000  ! 1747: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb3a40960  ! 1751: FMULq	dis not found

iob_intr_1_150:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_150), 16, 16)) -> intp(1, 0, 4)
iob_intr_1_151:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_151), 16, 16)) -> intp(1, 0, 32)
	.word 0xb0b54000  ! 1755: ORNcc_R	orncc 	%r21, %r0, %r24
	lda	[%r18 + %g0] 0xf0, %f2
cpu_intr_1_135:
	setx	0x2b0028, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_152:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_152), 16, 16)) -> intp(1, 0, 1)
cpu_intr_1_136:
	setx	0x280301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba258000  ! 1768: SUB_R	sub 	%r22, %r0, %r29
	.word 0xbebd0000  ! 1769: XNORcc_R	xnorcc 	%r20, %r0, %r31
T1_asi_reg_rd_79:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 1771: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
cpu_intr_1_137:
	setx	0x2a012f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbc35c000  ! 1780: SUBC_R	orn 	%r23, %r0, %r30
T1_asi_reg_rd_80:
	mov	0x15, %r14
	.word 0xf4db8e60  ! 1783: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb9aa8820  ! 1786: FMOVG	fmovs	%fcc1, %f0, %f28
	.word 0xb7a9c820  ! 1787: FMOVVS	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_83:
	mov	0x19, %r14
	.word 0xf6f38e80  ! 1788: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb1a5c820  ! 1789: FADDs	fadds	%f23, %f0, %f24
	.word 0xbda8c820  ! 1794: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb1a58860  ! 1796: FADDq	dis not found

T1_asi_reg_rd_81:
	mov	0x34, %r14
	.word 0xf0db84a0  ! 1799: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_1_138:
	setx	0x2a0320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 1804: FSQRTq	fsqrt	
T1_asi_reg_rd_82:
	mov	0x34, %r14
	.word 0xf0db8e40  ! 1807: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_rd_83:
	mov	0x1d, %r14
	.word 0xfedb8e60  ! 1809: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
cpu_intr_1_139:
	setx	0x2b0008, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_140:
	setx	0x2b0313, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_153:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_153), 16, 16)) -> intp(1, 0, 17)
	.word 0xbfa90820  ! 1819: FMOVLEU	fmovs	%fcc1, %f0, %f31
iob_intr_1_154:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_154), 16, 16)) -> intp(1, 0, 33)
	.word 0xb1a88820  ! 1822: FMOVLE	fmovs	%fcc1, %f0, %f24
iob_intr_1_155:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_155), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb4adc000  ! 1828: ANDNcc_R	andncc 	%r23, %r0, %r26
	.word 0xb4c58000  ! 1829: ADDCcc_R	addccc 	%r22, %r0, %r26
cpu_intr_1_141:
	setx	0x2c0001, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_84:
	mov	0x23, %r14
	.word 0xfaf38e40  ! 1834: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbda84820  ! 1835: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb9a00560  ! 1837: FSQRTq	fsqrt	
T1_asi_reg_wr_85:
	mov	0x8, %r14
	.word 0xfaf38e80  ! 1839: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
iob_intr_1_156:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_156), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_rd_84:
	mov	0x3c0, %r14
	.word 0xf8db8400  ! 1841: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	.word 0xbba90820  ! 1843: FMOVLEU	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_85:
	mov	0x26, %r14
	.word 0xfcdb84a0  ! 1844: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
T1_asi_reg_rd_86:
	mov	0x11, %r14
	.word 0xf4db89e0  ! 1848: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb68c0000  ! 1853: ANDcc_R	andcc 	%r16, %r0, %r27
cpu_intr_1_142:
	setx	0x2f0314, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_86:
	mov	0x3c7, %r14
	.word 0xfef389e0  ! 1856: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xb7a4c960  ! 1859: FMULq	dis not found

T1_asi_reg_rd_87:
	mov	0x3c0, %r14
	.word 0xfadb8e80  ! 1860: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
	.word 0xb9a5c820  ! 1862: FADDs	fadds	%f23, %f0, %f28
	.word 0xbba4c860  ! 1864: FADDq	dis not found

	lda	[%r16 + %g0] 0xf0, %f2
cpu_intr_1_143:
	setx	0x2e0017, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aa0820  ! 1875: FMOVA	fmovs	%fcc1, %f0, %f28
cpu_intr_1_144:
	setx	0x2e021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1ab0820  ! 1878: FMOVGU	fmovs	%fcc1, %f0, %f24
cpu_intr_1_145:
	setx	0x2c0239, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab0820  ! 1881: FMOVGU	fmovs	%fcc1, %f0, %f25
cpu_intr_1_146:
	setx	0x2f0229, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_87:
	mov	0x28, %r14
	.word 0xf0f38e40  ! 1883: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xb094c000  ! 1884: ORcc_R	orcc 	%r19, %r0, %r24
cpu_intr_1_147:
	setx	0x2e0235, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00540  ! 1891: FSQRTd	fsqrt	
	.word 0xb7a549e0  ! 1892: FDIVq	dis not found

cpu_intr_1_148:
	setx	0x2c0202, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a589e0  ! 1900: FDIVq	dis not found

cpu_intr_1_149:
	setx	0x2f0031, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_150:
	setx	0x2f0003, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a44860  ! 1906: FADDq	dis not found

	.word 0xb5a5c840  ! 1907: FADDd	faddd	%f54, %f0, %f26
	.word 0xbfa5c960  ! 1910: FMULq	dis not found

	.word 0xbab4e16d  ! 1913: SUBCcc_I	orncc 	%r19, 0x016d, %r29
	.word 0xbd35f001  ! 1915: SRLX_I	srlx	%r23, 0x0001, %r30
cpu_intr_1_151:
	setx	0x2e0309, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa408a0  ! 1918: FSUBs	fsubs	%f16, %f0, %f31
	.word 0xbd2df001  ! 1923: SLLX_I	sllx	%r23, 0x0001, %r30
	.word 0xb7a448e0  ! 1924: FSUBq	dis not found

cpu_intr_1_152:
	setx	0x2e0334, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_153:
	setx	0x2d0200, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_88:
	mov	0x1f, %r14
	.word 0xfcdb8e80  ! 1928: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xb3a81820  ! 1929: FMOVRGZ	fmovs	%fcc3, %f0, %f25
cpu_intr_1_154:
	setx	0x2f013e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb614a03f  ! 1931: OR_I	or 	%r18, 0x003f, %r27
	.word 0xb1a00560  ! 1934: FSQRTq	fsqrt	
T1_asi_reg_rd_89:
	mov	0xc, %r14
	.word 0xf0db8e60  ! 1935: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0x8f902001  ! 1937: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xb7a80820  ! 1938: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xbba90820  ! 1941: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xbfa80820  ! 1944: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xbda81820  ! 1946: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xbb2c4000  ! 1948: SLL_R	sll 	%r17, %r0, %r29
	.word 0xb9a44960  ! 1950: FMULq	dis not found

	.word 0xb5a80820  ! 1955: FMOVN	fmovs	%fcc1, %f0, %f26
iob_intr_1_157:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_157), 16, 16)) -> intp(1, 0, a)
cpu_intr_1_155:
	setx	0x2c0226, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba40860  ! 1958: FADDq	dis not found

T1_asi_reg_rd_90:
	mov	0x33, %r14
	.word 0xf0db8e40  ! 1960: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbba80420  ! 1961: FMOVRZ	dis not found

iob_intr_1_158:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_158), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb37c8400  ! 1967: MOVR_R	movre	%r18, %r0, %r25
iob_intr_1_159:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_159), 16, 16)) -> intp(1, 0, 2)
iob_intr_1_160:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_160), 16, 16)) -> intp(1, 0, 2b)
T1_asi_reg_wr_88:
	mov	0x3, %r14
	.word 0xf0f38e60  ! 1974: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
	.word 0xbba00520  ! 1975: FSQRTs	fsqrt	
	.word 0xbdab8820  ! 1976: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbda549e0  ! 1978: FDIVq	dis not found

T1_asi_reg_wr_89:
	mov	0x38, %r14
	.word 0xf2f384a0  ! 1979: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb3a588e0  ! 1980: FSUBq	dis not found

iob_intr_1_161:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_161), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_rd_91:
	mov	0x3c1, %r14
	.word 0xfedb89e0  ! 1982: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
	.word 0xbd358000  ! 1983: SRL_R	srl 	%r22, %r0, %r30
cpu_intr_1_156:
	setx	0x2c012c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_162:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_162), 16, 16)) -> intp(1, 0, 3d)
T1_asi_reg_rd_92:
	mov	0x3c2, %r14
	.word 0xf4db89e0  ! 1987: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xb6a54000  ! 1988: SUBcc_R	subcc 	%r21, %r0, %r27
iob_intr_1_163:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_163), 16, 16)) -> intp(1, 0, 1e)
iob_intr_1_164:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_164), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_165:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_165), 16, 16)) -> intp(1, 0, 24)
cpu_intr_1_157:
	setx	0x2e010d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_158:
	setx	0x2f0332, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba81820  ! 1998: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a54860  ! 2000: FADDq	dis not found

	.word 0xb3a00020  ! 2004: FMOVs	fmovs	%f0, %f25
	.word 0xb48c0000  ! 2005: ANDcc_R	andcc 	%r16, %r0, %r26
	.word 0xa1902000  ! 2006: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xb3a548a0  ! 2007: FSUBs	fsubs	%f21, %f0, %f25
	.word 0xbda00560  ! 2010: FSQRTq	fsqrt	
T1_asi_reg_rd_93:
	mov	0x3c8, %r14
	.word 0xfedb8e60  ! 2011: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
iob_intr_1_166:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_166), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_159:
	setx	0x2f0005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a90820  ! 2015: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xbba94820  ! 2016: FMOVCS	fmovs	%fcc1, %f0, %f29
iob_intr_1_167:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_167), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_wr_90:
	mov	0x3c6, %r14
	.word 0xf4f389e0  ! 2019: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
iob_intr_1_168:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_168), 16, 16)) -> intp(1, 0, 34)
cpu_intr_1_160:
	setx	0x2d031d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_169:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_169), 16, 16)) -> intp(1, 0, 26)
	.word 0xb3a00520  ! 2025: FSQRTs	fsqrt	
cpu_intr_1_161:
	setx	0x2e0313, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a509c0  ! 2027: FDIVd	fdivd	%f20, %f0, %f28
T1_asi_reg_rd_94:
	mov	0x3c4, %r14
	.word 0xfadb8e60  ! 2028: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbc054000  ! 2029: ADD_R	add 	%r21, %r0, %r30
	.word 0xb72c7001  ! 2030: SLLX_I	sllx	%r17, 0x0001, %r27
iob_intr_1_170:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_170), 16, 16)) -> intp(1, 0, 2a)
iob_intr_1_171:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_171), 16, 16)) -> intp(1, 0, 4)
	.word 0xb3a81c20  ! 2034: FMOVRGEZ	dis not found

	.word 0xbba88820  ! 2035: FMOVLE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_95:
	mov	0x3c2, %r14
	.word 0xf6db8e60  ! 2037: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T1_asi_reg_rd_96:
	mov	0xc, %r14
	.word 0xfcdb8400  ! 2038: LDXA_R	ldxa	[%r14, %r0] 0x20, %r30
	.word 0xbba84820  ! 2039: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb32c2001  ! 2040: SLL_I	sll 	%r16, 0x0001, %r25
	.word 0xbda80c20  ! 2043: FMOVRLZ	dis not found

T1_asi_reg_rd_97:
	mov	0x5, %r14
	.word 0xfedb89e0  ! 2044: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_rd_98:
	mov	0x6, %r14
	.word 0xf2db89e0  ! 2045: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb7aa8820  ! 2047: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb1ab4820  ! 2048: FMOVCC	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_91:
	mov	0x11, %r14
	.word 0xf8f389e0  ! 2049: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
T1_asi_reg_rd_99:
	mov	0x2f, %r14
	.word 0xf2db8e80  ! 2050: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
cpu_intr_1_162:
	setx	0x2f023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_163:
	setx	0x2d0002, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_100:
	mov	0x3c6, %r14
	.word 0xfadb89e0  ! 2055: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
T1_asi_reg_wr_92:
	mov	0x3, %r14
	.word 0xf0f38e60  ! 2061: STXA_R	stxa	%r24, [%r14 + %r0] 0x73
cpu_intr_1_164:
	setx	0x2c0311, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_165:
	setx	0x2d023b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_101:
	mov	0x3c7, %r14
	.word 0xf0db84a0  ! 2067: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
T1_asi_reg_rd_102:
	mov	0x2a, %r14
	.word 0xf6db8e80  ! 2068: LDXA_R	ldxa	[%r14, %r0] 0x74, %r27
	.word 0xbc8ca183  ! 2073: ANDcc_I	andcc 	%r18, 0x0183, %r30
cpu_intr_1_166:
	setx	0x2d0000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_167:
	setx	0x2f000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_93:
	mov	0x5, %r14
	.word 0xf4f38e40  ! 2078: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xbda589c0  ! 2080: FDIVd	fdivd	%f22, %f0, %f30
	.word 0xbba4c8e0  ! 2082: FSUBq	dis not found

cpu_intr_1_168:
	setx	0x2d0125, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80820  ! 2087: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
iob_intr_1_172:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_172), 16, 16)) -> intp(1, 0, 12)
T1_asi_reg_wr_94:
	mov	0x29, %r14
	.word 0xfcf38e80  ! 2091: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xb6850000  ! 2092: ADDcc_R	addcc 	%r20, %r0, %r27
T1_asi_reg_rd_103:
	mov	0x3c3, %r14
	.word 0xf0db84a0  ! 2093: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_1_169:
	setx	0x2e010c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_95:
	mov	0x36, %r14
	.word 0xf0f38e40  ! 2098: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
	.word 0xbba5c8c0  ! 2101: FSUBd	fsubd	%f54, %f0, %f60
T1_asi_reg_rd_104:
	mov	0x2, %r14
	.word 0xf8db84a0  ! 2103: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_1_173:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_173), 16, 16)) -> intp(1, 0, 9)
	.word 0xbfaa0820  ! 2105: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb4148000  ! 2106: OR_R	or 	%r18, %r0, %r26
	.word 0xba8da111  ! 2107: ANDcc_I	andcc 	%r22, 0x0111, %r29
T1_asi_reg_wr_96:
	mov	0xb, %r14
	.word 0xf4f389e0  ! 2108: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_1_170:
	setx	0x2e023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba40940  ! 2111: FMULd	fmuld	%f16, %f0, %f60
	.word 0xbf50c000  ! 2112: RDPR_TT	<illegal instruction>
	.word 0xb3a44840  ! 2114: FADDd	faddd	%f48, %f0, %f56
	.word 0xb7aa0820  ! 2117: FMOVA	fmovs	%fcc1, %f0, %f27
iob_intr_1_174:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_174), 16, 16)) -> intp(1, 0, 34)
T1_asi_reg_rd_105:
	mov	0x37, %r14
	.word 0xf4db8400  ! 2123: LDXA_R	ldxa	[%r14, %r0] 0x20, %r26
	.word 0xb7ab8820  ! 2124: FMOVPOS	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_106:
	mov	0x8, %r14
	.word 0xf0db89e0  ! 2128: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_97:
	mov	0x1c, %r14
	.word 0xf2f38e40  ! 2132: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_175:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_175), 16, 16)) -> intp(1, 0, 39)
cpu_intr_1_171:
	setx	0x2c0039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda94820  ! 2139: FMOVCS	fmovs	%fcc1, %f0, %f30
cpu_intr_1_172:
	setx	0x2d0108, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_173:
	setx	0x2c0021, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_174:
	setx	0x20020, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab0820  ! 2145: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb62de03e  ! 2146: ANDN_I	andn 	%r23, 0x003e, %r27
	.word 0xb9a81420  ! 2148: FMOVRNZ	dis not found

cpu_intr_1_175:
	setx	0x2f0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb624c000  ! 2151: SUB_R	sub 	%r19, %r0, %r27
T1_asi_reg_wr_98:
	mov	0x29, %r14
	.word 0xfcf38e40  ! 2157: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_176:
	setx	0x2e0134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80420  ! 2159: FMOVRZ	dis not found

	.word 0xb7a5c960  ! 2160: FMULq	dis not found

	.word 0xb9a58960  ! 2162: FMULq	dis not found

T1_asi_reg_rd_107:
	mov	0x3c3, %r14
	.word 0xfcdb8e40  ! 2164: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xbda8c820  ! 2166: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb9a50840  ! 2168: FADDd	faddd	%f20, %f0, %f28
	.word 0xb3a00040  ! 2170: FMOVd	fmovd	%f0, %f56
	.word 0xb1a80820  ! 2172: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb5a9c820  ! 2173: FMOVVS	fmovs	%fcc1, %f0, %f26
cpu_intr_1_177:
	setx	0x2c000c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_178:
	setx	0x2d0224, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_179:
	setx	0x2c033c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb643801  ! 2180: MOVcc_I	<illegal instruction>
T1_asi_reg_wr_99:
	mov	0x3c6, %r14
	.word 0xf8f38e60  ! 2188: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
cpu_intr_1_180:
	setx	0x2f022e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_100:
	mov	0x3c4, %r14
	.word 0xfcf38e60  ! 2196: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
T1_asi_reg_rd_108:
	mov	0x3c2, %r14
	.word 0xfadb84a0  ! 2198: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
iob_intr_1_176:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_176), 16, 16)) -> intp(1, 0, 17)
	.word 0xb9a548a0  ! 2204: FSUBs	fsubs	%f21, %f0, %f28
T1_asi_reg_wr_101:
	mov	0x35, %r14
	.word 0xfaf389e0  ! 2207: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	lda	[%r18 + %g0] 0xf0, %f2
T1_asi_reg_rd_109:
	mov	0x1e, %r14
	.word 0xfedb8e40  ! 2211: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbdab4820  ! 2213: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb7a81c20  ! 2214: FMOVRGEZ	dis not found

	.word 0xb7a00540  ! 2215: FSQRTd	fsqrt	
iob_intr_1_177:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_177), 16, 16)) -> intp(1, 0, 22)
T1_asi_reg_rd_110:
	mov	0x2e, %r14
	.word 0xfedb84a0  ! 2220: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb9a58920  ! 2221: FMULs	fmuls	%f22, %f0, %f28
iob_intr_1_178:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_178), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_179:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_179), 16, 16)) -> intp(1, 0, 28)
	.word 0xbba4c920  ! 2225: FMULs	fmuls	%f19, %f0, %f29
T1_asi_reg_rd_111:
	mov	0x3c6, %r14
	.word 0xf2db8e40  ! 2226: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
T1_asi_reg_rd_112:
	mov	0x18, %r14
	.word 0xf2db89e0  ! 2229: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
iob_intr_1_180:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_180), 16, 16)) -> intp(1, 0, 38)
	.word 0xb5a4c860  ! 2232: FADDq	dis not found

	.word 0xb5a48960  ! 2233: FMULq	dis not found

	.word 0xb72d9000  ! 2234: SLLX_R	sllx	%r22, %r0, %r27
	.word 0xb1342001  ! 2236: SRL_I	srl 	%r16, 0x0001, %r24
cpu_intr_1_181:
	setx	0x2f031d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa4c8a0  ! 2239: FSUBs	fsubs	%f19, %f0, %f31
iob_intr_1_181:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_181), 16, 16)) -> intp(1, 0, 1e)
iob_intr_1_182:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_182), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_rd_113:
	mov	0x18, %r14
	.word 0xf8db8e80  ! 2242: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
cpu_intr_1_182:
	setx	0x2e0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a98820  ! 2244: FMOVNEG	fmovs	%fcc1, %f0, %f25
iob_intr_1_183:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_183), 16, 16)) -> intp(1, 0, 16)
	.word 0xb3a489a0  ! 2246: FDIVs	fdivs	%f18, %f0, %f25
T1_asi_reg_wr_102:
	mov	0x3c6, %r14
	.word 0xf8f38e40  ! 2249: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
iob_intr_1_184:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_184), 16, 16)) -> intp(1, 0, 3)
cpu_intr_1_183:
	setx	0x2d021e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a58940  ! 2253: FMULd	fmuld	%f22, %f0, %f56
	.word 0xbe05e15a  ! 2255: ADD_I	add 	%r23, 0x015a, %r31
iob_intr_1_185:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_185), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_186:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_186), 16, 16)) -> intp(1, 0, 32)
iob_intr_1_187:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_187), 16, 16)) -> intp(1, 0, 30)
	.word 0xb9a8c820  ! 2265: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb9359000  ! 2268: SRLX_R	srlx	%r22, %r0, %r28
cpu_intr_1_184:
	setx	0x30015, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_103:
	mov	0x1, %r14
	.word 0xf8f389e0  ! 2273: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xbfa00560  ! 2274: FSQRTq	fsqrt	
	.word 0xb2142036  ! 2277: OR_I	or 	%r16, 0x0036, %r25
	.word 0xbfa84820  ! 2278: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xb5a00520  ! 2279: FSQRTs	fsqrt	
	.word 0xb434211f  ! 2280: ORN_I	orn 	%r16, 0x011f, %r26
	.word 0xb3a84820  ! 2284: FMOVE	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_104:
	mov	0x3c4, %r14
	.word 0xf2f389e0  ! 2285: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
	.word 0xbcc5e161  ! 2287: ADDCcc_I	addccc 	%r23, 0x0161, %r30
T1_asi_reg_rd_114:
	mov	0x3c2, %r14
	.word 0xfadb8e60  ! 2290: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
T1_asi_reg_rd_115:
	mov	0x3c0, %r14
	.word 0xf6db8e40  ! 2291: LDXA_R	ldxa	[%r14, %r0] 0x72, %r27
	.word 0xb9a58940  ! 2293: FMULd	fmuld	%f22, %f0, %f28
	.word 0xbba88820  ! 2294: FMOVLE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_105:
	mov	0x20, %r14
	.word 0xf6f38e60  ! 2295: STXA_R	stxa	%r27, [%r14 + %r0] 0x73
iob_intr_1_188:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_188), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_rd_116:
	mov	0xe, %r14
	.word 0xf0db89e0  ! 2297: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
	.word 0xb9a548a0  ! 2300: FSUBs	fsubs	%f21, %f0, %f28
	.word 0xbfab4820  ! 2303: FMOVCC	fmovs	%fcc1, %f0, %f31
	lda	[%r19 + %g0] 0xf0, %f2
cpu_intr_1_185:
	setx	0x300201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6c40000  ! 2310: ADDCcc_R	addccc 	%r16, %r0, %r27
cpu_intr_1_186:
	setx	0x310318, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab4820  ! 2314: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb5a80820  ! 2315: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xbfa90820  ! 2316: FMOVLEU	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3a80c20  ! 2318: FMOVRLZ	dis not found

	.word 0xba448000  ! 2319: ADDC_R	addc 	%r18, %r0, %r29
	.word 0xb5a509a0  ! 2320: FDIVs	fdivs	%f20, %f0, %f26
T1_asi_reg_rd_117:
	mov	0x3c7, %r14
	.word 0xf2db8e60  ! 2321: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xba1ce034  ! 2324: XOR_I	xor 	%r19, 0x0034, %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb885215f  ! 2327: ADDcc_I	addcc 	%r20, 0x015f, %r28
T1_asi_reg_wr_106:
	mov	0x30, %r14
	.word 0xf8f38e60  ! 2329: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb7a00540  ! 2333: FSQRTd	fsqrt	
iob_intr_1_189:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_189), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_190:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_190), 16, 16)) -> intp(1, 0, 29)
T1_asi_reg_rd_118:
	mov	0x14, %r14
	.word 0xfedb8400  ! 2341: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
cpu_intr_1_187:
	setx	0x300136, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_119:
	mov	0x36, %r14
	.word 0xf4db84a0  ! 2345: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb1abc820  ! 2347: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0xbd349000  ! 2349: SRLX_R	srlx	%r18, %r0, %r30
iob_intr_1_191:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_191), 16, 16)) -> intp(1, 0, 31)
	.word 0xb9a00560  ! 2353: FSQRTq	fsqrt	
	.word 0xa1902000  ! 2354: WRPR_GL_I	wrpr	%r0, 0x0000, %-
cpu_intr_1_188:
	setx	0x330212, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb62521ed  ! 2359: SUB_I	sub 	%r20, 0x01ed, %r27
	.word 0xb1a81c20  ! 2360: FMOVRGEZ	dis not found

iob_intr_1_192:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_192), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb6a44000  ! 2362: SUBcc_R	subcc 	%r17, %r0, %r27
iob_intr_1_193:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_193), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_rd_120:
	mov	0x3c3, %r14
	.word 0xf6db84a0  ! 2366: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
iob_intr_1_194:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_194), 16, 16)) -> intp(1, 0, 3d)
iob_intr_1_195:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_195), 16, 16)) -> intp(1, 0, 15)
	.word 0xb9a00040  ! 2371: FMOVd	fmovd	%f0, %f28
cpu_intr_1_189:
	setx	0x31001f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_107:
	mov	0xc, %r14
	.word 0xfaf38e40  ! 2374: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb3a58860  ! 2375: FADDq	dis not found

	.word 0x8d95e0e4  ! 2380: WRPR_PSTATE_I	wrpr	%r23, 0x00e4, %pstate
	.word 0xb5a88820  ! 2381: FMOVLE	fmovs	%fcc1, %f0, %f26
iob_intr_1_196:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_196), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb3a80820  ! 2383: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_121:
	mov	0x20, %r14
	.word 0xf6db89e0  ! 2388: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r27
cpu_intr_1_190:
	setx	0x30013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_108:
	mov	0x6, %r14
	.word 0xfcf38e40  ! 2392: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_rd_122:
	mov	0x3c5, %r14
	.word 0xfedb8e40  ! 2394: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
iob_intr_1_197:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_197), 16, 16)) -> intp(1, 0, 1)
	.word 0xb7abc820  ! 2397: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbfa449e0  ! 2402: FDIVq	dis not found

iob_intr_1_198:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_198), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_199:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_199), 16, 16)) -> intp(1, 0, 26)
	.word 0xbba00560  ! 2407: FSQRTq	fsqrt	
cpu_intr_1_191:
	setx	0x300139, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a84820  ! 2413: FMOVE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_192:
	setx	0x30021b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_109:
	mov	0x2c, %r14
	.word 0xfcf38e40  ! 2417: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xbba448c0  ! 2418: FSUBd	fsubd	%f48, %f0, %f60
T1_asi_reg_wr_110:
	mov	0x8, %r14
	.word 0xfcf389e0  ! 2419: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
iob_intr_1_200:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_200), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_193:
	setx	0x310018, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbda00560  ! 2428: FSQRTq	fsqrt	
T1_asi_reg_rd_123:
	mov	0x3c8, %r14
	.word 0xf6db8e60  ! 2430: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
T1_asi_reg_rd_124:
	mov	0x13, %r14
	.word 0xf4db8e80  ! 2432: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb7a00020  ! 2433: FMOVs	fmovs	%f0, %f27
T1_asi_reg_rd_125:
	mov	0xb, %r14
	.word 0xf4db84a0  ! 2434: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xb7a80420  ! 2435: FMOVRZ	dis not found

cpu_intr_1_194:
	setx	0x30020a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb7c0400  ! 2437: MOVR_R	movre	%r16, %r0, %r29
	.word 0xb9aa0820  ! 2445: FMOVA	fmovs	%fcc1, %f0, %f28
iob_intr_1_201:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_201), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_202:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_202), 16, 16)) -> intp(1, 0, 24)
iob_intr_1_203:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_203), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_wr_111:
	mov	0x35, %r14
	.word 0xfef38e40  ! 2453: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_204:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_204), 16, 16)) -> intp(1, 0, 8)
	.word 0xb7a00520  ! 2460: FSQRTs	fsqrt	
T1_asi_reg_rd_126:
	mov	0x3c6, %r14
	.word 0xf6db84a0  ! 2461: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
	.word 0xb3a9c820  ! 2462: FMOVVS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_195:
	setx	0x330301, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_205:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_205), 16, 16)) -> intp(1, 0, 34)
	.word 0x87942029  ! 2470: WRPR_TT_I	wrpr	%r16, 0x0029, %tt
cpu_intr_1_196:
	setx	0x330004, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_206:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_206), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_rd_127:
	mov	0x6, %r14
	.word 0xf8db84a0  ! 2483: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb5a5c820  ! 2485: FADDs	fadds	%f23, %f0, %f26
iob_intr_1_207:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_207), 16, 16)) -> intp(1, 0, 1c)
cpu_intr_1_197:
	setx	0x300025, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_198:
	setx	0x310010, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_128:
	mov	0x1b, %r14
	.word 0xfcdb84a0  ! 2491: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbda80420  ! 2497: FMOVRZ	dis not found

	.word 0xbba88820  ! 2501: FMOVLE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_199:
	setx	0x33032b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab0820  ! 2507: FMOVGU	fmovs	%fcc1, %f0, %f30
cpu_intr_1_200:
	setx	0x300007, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_129:
	mov	0x3c1, %r14
	.word 0xfedb8e40  ! 2511: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbbaa8820  ! 2514: FMOVG	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_112:
	mov	0x3c7, %r14
	.word 0xf8f38e60  ! 2516: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb534e001  ! 2519: SRL_I	srl 	%r19, 0x0001, %r26
iob_intr_1_208:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_208), 16, 16)) -> intp(1, 0, 1b)
	.word 0xbc2420e9  ! 2522: SUB_I	sub 	%r16, 0x00e9, %r30
cpu_intr_1_201:
	setx	0x310015, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_202:
	setx	0x330322, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a4c9c0  ! 2530: FDIVd	fdivd	%f50, %f0, %f28
T1_asi_reg_rd_130:
	mov	0x6, %r14
	.word 0xf6db8400  ! 2531: LDXA_R	ldxa	[%r14, %r0] 0x20, %r27
	.word 0xb9a00560  ! 2534: FSQRTq	fsqrt	
T1_asi_reg_rd_131:
	mov	0x2c, %r14
	.word 0xfadb89e0  ! 2535: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb1a4c9e0  ! 2540: FDIVq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
cpu_intr_1_203:
	setx	0x330308, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_209:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_209), 16, 16)) -> intp(1, 0, 36)
T1_asi_reg_wr_113:
	mov	0x6, %r14
	.word 0xf6f384a0  ! 2547: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
cpu_intr_1_204:
	setx	0x330126, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a98820  ! 2549: FMOVNEG	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7a00020  ! 2551: FMOVs	fmovs	%f0, %f27
cpu_intr_1_205:
	setx	0x310206, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5349000  ! 2555: SRLX_R	srlx	%r18, %r0, %r26
T1_asi_reg_rd_132:
	mov	0x3c1, %r14
	.word 0xf8db89e0  ! 2560: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T1_asi_reg_wr_114:
	mov	0x11, %r14
	.word 0xf2f38e40  ! 2561: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9aa8820  ! 2564: FMOVG	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_115:
	mov	0x38, %r14
	.word 0xf2f38e80  ! 2566: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
T1_asi_reg_wr_116:
	mov	0x3c8, %r14
	.word 0xfcf38e80  ! 2568: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
iob_intr_1_210:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_210), 16, 16)) -> intp(1, 0, 3c)
T1_asi_reg_wr_117:
	mov	0x3c1, %r14
	.word 0xf4f38e40  ! 2573: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	.word 0xb3a58820  ! 2576: FADDs	fadds	%f22, %f0, %f25
T1_asi_reg_rd_133:
	mov	0x5, %r14
	.word 0xfcdb8e40  ! 2578: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb3a408c0  ! 2579: FSUBd	fsubd	%f16, %f0, %f56
cpu_intr_1_206:
	setx	0x310212, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_134:
	mov	0x22, %r14
	.word 0xf4db8e80  ! 2584: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb0448000  ! 2586: ADDC_R	addc 	%r18, %r0, %r24
iob_intr_1_211:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_211), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_212:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_212), 16, 16)) -> intp(1, 0, 35)
	.word 0xb7a00520  ! 2589: FSQRTs	fsqrt	
cpu_intr_1_207:
	setx	0x30021a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba409a0  ! 2591: FDIVs	fdivs	%f16, %f0, %f29
iob_intr_1_213:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_213), 16, 16)) -> intp(1, 0, 37)
	.word 0xbda81820  ! 2593: FMOVRGZ	fmovs	%fcc3, %f0, %f30
cpu_intr_1_208:
	setx	0x32013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda54820  ! 2595: FADDs	fadds	%f21, %f0, %f30
	.word 0xbd3d8000  ! 2598: SRA_R	sra 	%r22, %r0, %r30
	.word 0xbfaa0820  ! 2599: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb5aa8820  ! 2600: FMOVG	fmovs	%fcc1, %f0, %f26
iob_intr_1_214:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_214), 16, 16)) -> intp(1, 0, 1d)
T1_asi_reg_wr_118:
	mov	0x3c7, %r14
	.word 0xf4f38e40  ! 2611: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
cpu_intr_1_209:
	setx	0x320218, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c9a0  ! 2614: FDIVs	fdivs	%f19, %f0, %f25
iob_intr_1_215:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_215), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_210:
	setx	0x30011b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_216:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_216), 16, 16)) -> intp(1, 0, f)
	.word 0xb5a80c20  ! 2623: FMOVRLZ	dis not found

cpu_intr_1_211:
	setx	0x300219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5aac820  ! 2626: FMOVGE	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_119:
	mov	0x29, %r14
	.word 0xf8f38e40  ! 2628: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_wr_120:
	mov	0x3c4, %r14
	.word 0xf6f38e40  ! 2630: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_wr_121:
	mov	0x20, %r14
	.word 0xf0f38e40  ! 2631: STXA_R	stxa	%r24, [%r14 + %r0] 0x72
cpu_intr_1_212:
	setx	0x330032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3aa0820  ! 2634: FMOVA	fmovs	%fcc1, %f0, %f25
T1_asi_reg_wr_122:
	mov	0x3c1, %r14
	.word 0xf8f38e40  ! 2635: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_213:
	setx	0x30032a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa84820  ! 2641: FMOVE	fmovs	%fcc1, %f0, %f31
	.word 0xbba00540  ! 2647: FSQRTd	fsqrt	
	.word 0xb9641800  ! 2648: MOVcc_R	<illegal instruction>
	.word 0xb7a5c920  ! 2649: FMULs	fmuls	%f23, %f0, %f27
T1_asi_reg_rd_135:
	mov	0x3c3, %r14
	.word 0xf4db89e0  ! 2651: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
iob_intr_1_217:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_217), 16, 16)) -> intp(1, 0, 22)
	.word 0xbfa48920  ! 2655: FMULs	fmuls	%f18, %f0, %f31
	.word 0xbb2dd000  ! 2656: SLLX_R	sllx	%r23, %r0, %r29
	.word 0xb1a48840  ! 2657: FADDd	faddd	%f18, %f0, %f24
cpu_intr_1_214:
	setx	0x330321, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_136:
	mov	0x23, %r14
	.word 0xf2db8e40  ! 2660: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbcc54000  ! 2668: ADDCcc_R	addccc 	%r21, %r0, %r30
iob_intr_1_218:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_218), 16, 16)) -> intp(1, 0, 1e)
iob_intr_1_219:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_219), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbe944000  ! 2678: ORcc_R	orcc 	%r17, %r0, %r31
cpu_intr_1_215:
	setx	0x320120, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a00520  ! 2680: FSQRTs	fsqrt	
	.word 0xbbaac820  ! 2681: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xbda50840  ! 2682: FADDd	faddd	%f20, %f0, %f30
iob_intr_1_220:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_220), 16, 16)) -> intp(1, 0, 23)
iob_intr_1_221:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_221), 16, 16)) -> intp(1, 0, 8)
	.word 0xb7a81c20  ! 2688: FMOVRGEZ	dis not found

cpu_intr_1_216:
	setx	0x320314, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_217:
	setx	0x300327, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_218:
	setx	0x300104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9ab4820  ! 2700: FMOVCC	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_137:
	mov	0x2f, %r14
	.word 0xfcdb84a0  ! 2702: LDXA_R	ldxa	[%r14, %r0] 0x25, %r30
	.word 0xbba00560  ! 2703: FSQRTq	fsqrt	
	.word 0xb3a00520  ! 2707: FSQRTs	fsqrt	
iob_intr_1_222:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_222), 16, 16)) -> intp(1, 0, 24)
iob_intr_1_223:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_223), 16, 16)) -> intp(1, 0, e)
	.word 0xbd2d6001  ! 2715: SLL_I	sll 	%r21, 0x0001, %r30
iob_intr_1_224:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_224), 16, 16)) -> intp(1, 0, 9)
	.word 0xb72d2001  ! 2719: SLL_I	sll 	%r20, 0x0001, %r27
T1_asi_reg_wr_123:
	mov	0x3c5, %r14
	.word 0xf4f389e0  ! 2720: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
cpu_intr_1_219:
	setx	0x36003e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_138:
	mov	0x31, %r14
	.word 0xf0db89e0  ! 2725: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
T1_asi_reg_rd_139:
	mov	0xa, %r14
	.word 0xf0db89e0  ! 2726: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_1_220:
	setx	0x20229, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_221:
	setx	0x340116, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a84820  ! 2732: FMOVE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_222:
	setx	0x340203, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5ab0820  ! 2734: FMOVGU	fmovs	%fcc1, %f0, %f26
cpu_intr_1_223:
	setx	0x34031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a489e0  ! 2737: FDIVq	dis not found

	.word 0xb5a4c8a0  ! 2738: FSUBs	fsubs	%f19, %f0, %f26
iob_intr_1_225:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_225), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_wr_124:
	mov	0x1c, %r14
	.word 0xfaf38e40  ! 2740: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb5a5c8a0  ! 2741: FSUBs	fsubs	%f23, %f0, %f26
T1_asi_reg_rd_140:
	mov	0x3c7, %r14
	.word 0xf2db8e60  ! 2742: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xbda508a0  ! 2743: FSUBs	fsubs	%f20, %f0, %f30
	.word 0xb5aa8820  ! 2744: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xbda80c20  ! 2746: FMOVRLZ	dis not found

iob_intr_1_226:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_226), 16, 16)) -> intp(1, 0, 2f)
T1_asi_reg_rd_141:
	mov	0x3c3, %r14
	.word 0xf0db84a0  ! 2748: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
	.word 0xbbaa8820  ! 2749: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb5aa4820  ! 2750: FMOVNE	fmovs	%fcc1, %f0, %f26
cpu_intr_1_224:
	setx	0x360315, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_225:
	setx	0x370108, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a98820  ! 2756: FMOVNEG	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a4c8c0  ! 2759: FSUBd	fsubd	%f50, %f0, %f56
	.word 0xb6a5a1e2  ! 2761: SUBcc_I	subcc 	%r22, 0x01e2, %r27
	.word 0xbfa50920  ! 2762: FMULs	fmuls	%f20, %f0, %f31
	.word 0xb7abc820  ! 2768: FMOVVC	fmovs	%fcc1, %f0, %f27
cpu_intr_1_226:
	setx	0x350314, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_142:
	mov	0x27, %r14
	.word 0xfcdb89e0  ! 2772: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
cpu_intr_1_227:
	setx	0x350032, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb2b58000  ! 2775: ORNcc_R	orncc 	%r22, %r0, %r25
	.word 0xbca4c000  ! 2777: SUBcc_R	subcc 	%r19, %r0, %r30
iob_intr_1_227:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_227), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_228:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_228), 16, 16)) -> intp(1, 0, 3e)
T1_asi_reg_rd_143:
	mov	0x3c4, %r14
	.word 0xf6db8e60  ! 2790: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb1a81420  ! 2791: FMOVRNZ	dis not found

	.word 0xb5a00520  ! 2793: FSQRTs	fsqrt	
iob_intr_1_229:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_229), 16, 16)) -> intp(1, 0, 3e)
cpu_intr_1_228:
	setx	0x34010b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_229:
	setx	0x35022a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb695a0af  ! 2804: ORcc_I	orcc 	%r22, 0x00af, %r27
iob_intr_1_230:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_230), 16, 16)) -> intp(1, 0, 1b)
T1_asi_reg_wr_125:
	mov	0x32, %r14
	.word 0xfcf38400  ! 2809: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
T1_asi_reg_wr_126:
	mov	0x8, %r14
	.word 0xf8f38e60  ! 2814: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb5a44960  ! 2816: FMULq	dis not found

T1_asi_reg_rd_144:
	mov	0x36, %r14
	.word 0xfedb89e0  ! 2817: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r31
T1_asi_reg_wr_127:
	mov	0x2f, %r14
	.word 0xf2f38400  ! 2818: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_1_230:
	setx	0x370324, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_231:
	setx	0x370005, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda4c960  ! 2823: FMULq	dis not found

	.word 0xbdaa0820  ! 2825: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xbfa00540  ! 2826: FSQRTd	fsqrt	
iob_intr_1_231:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_231), 16, 16)) -> intp(1, 0, b)
	.word 0xbdaa8820  ! 2830: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xb5a509a0  ! 2831: FDIVs	fdivs	%f20, %f0, %f26
	.word 0xb3a50860  ! 2832: FADDq	dis not found

cpu_intr_1_232:
	setx	0x34000b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_145:
	mov	0x2a, %r14
	.word 0xfedb8e60  ! 2836: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
T1_asi_reg_wr_128:
	mov	0x26, %r14
	.word 0xf8f38e40  ! 2837: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbc048000  ! 2838: ADD_R	add 	%r18, %r0, %r30
	.word 0xb4bce126  ! 2842: XNORcc_I	xnorcc 	%r19, 0x0126, %r26
	.word 0xb3a80820  ! 2844: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
iob_intr_1_232:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_232), 16, 16)) -> intp(1, 0, 1c)
	.word 0xbfa408c0  ! 2848: FSUBd	fsubd	%f16, %f0, %f62
	.word 0xbba81820  ! 2849: FMOVRGZ	fmovs	%fcc3, %f0, %f29
iob_intr_1_233:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_233), 16, 16)) -> intp(1, 0, 3b)
T1_asi_reg_wr_129:
	mov	0x1e, %r14
	.word 0xf6f38e80  ! 2855: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb7a48960  ! 2856: FMULq	dis not found

	.word 0xbbaac820  ! 2859: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xb20d4000  ! 2860: AND_R	and 	%r21, %r0, %r25
	.word 0xb5a40860  ! 2862: FADDq	dis not found

	.word 0xbb50c000  ! 2863: RDPR_TT	<illegal instruction>
iob_intr_1_234:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_234), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_235:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_235), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_233:
	setx	0x37031e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba84820  ! 2874: FMOVE	fmovs	%fcc1, %f0, %f29
cpu_intr_1_234:
	setx	0x370213, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_130:
	mov	0x3c5, %r14
	.word 0xf0f384a0  ! 2877: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xbba00560  ! 2881: FSQRTq	fsqrt	
T1_asi_reg_wr_131:
	mov	0x32, %r14
	.word 0xf4f389e0  ! 2883: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb8bd614e  ! 2884: XNORcc_I	xnorcc 	%r21, 0x014e, %r28
T1_asi_reg_wr_132:
	mov	0xb, %r14
	.word 0xfef38e60  ! 2885: STXA_R	stxa	%r31, [%r14 + %r0] 0x73
cpu_intr_1_235:
	setx	0x37011b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_133:
	mov	0x17, %r14
	.word 0xfef389e0  ! 2887: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
T1_asi_reg_wr_134:
	mov	0x3c0, %r14
	.word 0xf0f38400  ! 2888: STXA_R	stxa	%r24, [%r14 + %r0] 0x20
T1_asi_reg_rd_146:
	mov	0xd, %r14
	.word 0xf0db8e40  ! 2890: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xb5a488c0  ! 2891: FSUBd	fsubd	%f18, %f0, %f26
cpu_intr_1_236:
	setx	0x350324, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_135:
	mov	0x3c7, %r14
	.word 0xfaf38e40  ! 2893: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_236:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_236), 16, 16)) -> intp(1, 0, 10)
T1_asi_reg_wr_136:
	mov	0x20, %r14
	.word 0xf8f38e40  ! 2900: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
	.word 0xbda448e0  ! 2901: FSUBq	dis not found

	.word 0xbda80820  ! 2902: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xbfa94820  ! 2903: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb9a5c9c0  ! 2906: FDIVd	fdivd	%f54, %f0, %f28
	.word 0xbda80c20  ! 2907: FMOVRLZ	dis not found

	.word 0xbda448e0  ! 2909: FSUBq	dis not found

cpu_intr_1_237:
	setx	0x340220, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_238:
	setx	0x37030d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_137:
	mov	0x3, %r14
	.word 0xf4f38e80  ! 2915: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_1_239:
	setx	0x34000c, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda4c860  ! 2920: FADDq	dis not found

iob_intr_1_237:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_237), 16, 16)) -> intp(1, 0, a)
	.word 0xb1ab4820  ! 2924: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb5a5c9a0  ! 2926: FDIVs	fdivs	%f23, %f0, %f26
T1_asi_reg_wr_138:
	mov	0x5, %r14
	.word 0xf4f38e40  ! 2930: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_238:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_238), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_239:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_239), 16, 16)) -> intp(1, 0, 1f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda54820  ! 2937: FADDs	fadds	%f21, %f0, %f30
cpu_intr_1_240:
	setx	0x370311, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7aa4820  ! 2940: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xbfa40820  ! 2941: FADDs	fadds	%f16, %f0, %f31
	.word 0xbba9c820  ! 2943: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xbfa5c920  ! 2946: FMULs	fmuls	%f23, %f0, %f31
	.word 0xb5a00540  ! 2948: FSQRTd	fsqrt	
cpu_intr_1_241:
	setx	0x370019, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_147:
	mov	0x3c1, %r14
	.word 0xfedb8e60  ! 2952: LDXA_R	ldxa	[%r14, %r0] 0x73, %r31
	.word 0xbba81820  ! 2954: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb0358000  ! 2955: SUBC_R	orn 	%r22, %r0, %r24
	.word 0xbfa4c8c0  ! 2956: FSUBd	fsubd	%f50, %f0, %f62
cpu_intr_1_242:
	setx	0x340001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb81d606c  ! 2959: XOR_I	xor 	%r21, 0x006c, %r28
	.word 0xb0356005  ! 2960: SUBC_I	orn 	%r21, 0x0005, %r24
T1_asi_reg_wr_139:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 2961: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_wr_140:
	mov	0x8, %r14
	.word 0xfcf38400  ! 2964: STXA_R	stxa	%r30, [%r14 + %r0] 0x20
cpu_intr_1_243:
	setx	0x350338, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00540  ! 2966: FSQRTd	fsqrt	
	.word 0xbba80820  ! 2967: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_141:
	mov	0x19, %r14
	.word 0xf6f38e40  ! 2968: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
	.word 0xb0950000  ! 2970: ORcc_R	orcc 	%r20, %r0, %r24
	.word 0xbfaa0820  ! 2972: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb9aa0820  ! 2973: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb42cc000  ! 2974: ANDN_R	andn 	%r19, %r0, %r26
	.word 0xb3a548c0  ! 2975: FSUBd	fsubd	%f52, %f0, %f56
	.word 0xbdabc820  ! 2976: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xb7a589a0  ! 2977: FDIVs	fdivs	%f22, %f0, %f27
iob_intr_1_240:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_240), 16, 16)) -> intp(1, 0, 21)
	.word 0xb92c6001  ! 2987: SLL_I	sll 	%r17, 0x0001, %r28
	.word 0xb32cf001  ! 2988: SLLX_I	sllx	%r19, 0x0001, %r25
	.word 0xb2bc2031  ! 2990: XNORcc_I	xnorcc 	%r16, 0x0031, %r25
	.word 0xbe0d0000  ! 2991: AND_R	and 	%r20, %r0, %r31
iob_intr_1_241:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_241), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_244:
	setx	0x34002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00540  ! 2995: FSQRTd	fsqrt	
	.word 0xb62c209f  ! 2997: ANDN_I	andn 	%r16, 0x009f, %r27
cpu_intr_1_245:
	setx	0x35031c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_246:
	setx	0x350134, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a80420  ! 3000: FMOVRZ	dis not found

	.word 0xb5a00520  ! 3005: FSQRTs	fsqrt	
iob_intr_1_242:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_242), 16, 16)) -> intp(1, 0, 29)
iob_intr_1_243:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_243), 16, 16)) -> intp(1, 0, 2c)
	lda	[%r17 + %g0] 0xf0, %f2
	.word 0xbc0c6066  ! 3010: AND_I	and 	%r17, 0x0066, %r30
iob_intr_1_244:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_244), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb7a48960  ! 3015: FMULq	dis not found

	.word 0xbfa00020  ! 3017: FMOVs	fmovs	%f0, %f31
	.word 0xb9a80820  ! 3020: FMOVN	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_148:
	mov	0x1b, %r14
	.word 0xf4db8e40  ! 3021: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xbba81c20  ! 3024: FMOVRGEZ	dis not found

	.word 0xb7a81c20  ! 3030: FMOVRGEZ	dis not found

cpu_intr_1_247:
	setx	0x350238, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_142:
	mov	0x3c0, %r14
	.word 0xf6f38e40  ! 3033: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_wr_143:
	mov	0x7, %r14
	.word 0xf6f38e80  ! 3034: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xbbabc820  ! 3035: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb1aa4820  ! 3037: FMOVNE	fmovs	%fcc1, %f0, %f24
cpu_intr_1_248:
	setx	0x34000a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_149:
	mov	0x21, %r14
	.word 0xf4db8e40  ! 3039: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
T1_asi_reg_rd_150:
	mov	0x1f, %r14
	.word 0xf8db89e0  ! 3046: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
T1_asi_reg_wr_144:
	mov	0x1, %r14
	.word 0xf6f389e0  ! 3048: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
cpu_intr_1_249:
	setx	0x370216, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_245:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_245), 16, 16)) -> intp(1, 0, 8)
	.word 0xb3a50820  ! 3055: FADDs	fadds	%f20, %f0, %f25
T1_asi_reg_wr_145:
	mov	0xa, %r14
	.word 0xfef389e0  ! 3056: STXA_R	stxa	%r31, [%r14 + %r0] 0x4f
	.word 0xbe354000  ! 3057: SUBC_R	orn 	%r21, %r0, %r31
	.word 0xb3a00560  ! 3058: FSQRTq	fsqrt	
	.word 0xbfa488a0  ! 3062: FSUBs	fsubs	%f18, %f0, %f31
iob_intr_1_246:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_246), 16, 16)) -> intp(1, 0, 11)
	.word 0xa1902001  ! 3068: WRPR_GL_I	wrpr	%r0, 0x0001, %-
iob_intr_1_247:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_247), 16, 16)) -> intp(1, 0, 28)
	.word 0xbcbd8000  ! 3075: XNORcc_R	xnorcc 	%r22, %r0, %r30
	.word 0xb3a81820  ! 3076: FMOVRGZ	fmovs	%fcc3, %f0, %f25
T1_asi_reg_wr_146:
	mov	0x15, %r14
	.word 0xf4f38e40  ! 3077: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_248:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_248), 16, 16)) -> intp(1, 0, 0)
	.word 0xbfa80820  ! 3081: FMOVN	fmovs	%fcc1, %f0, %f31
cpu_intr_1_250:
	setx	0x36020a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_249:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_249), 16, 16)) -> intp(1, 0, 4)
	.word 0xb5a81420  ! 3090: FMOVRNZ	dis not found

cpu_intr_1_251:
	setx	0x34032e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_252:
	setx	0x36022b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a94820  ! 3095: FMOVCS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_151:
	mov	0x29, %r14
	.word 0xf4db8e80  ! 3097: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
	.word 0xb9a40940  ! 3100: FMULd	fmuld	%f16, %f0, %f28
T1_asi_reg_wr_147:
	mov	0x29, %r14
	.word 0xf4f38e80  ! 3102: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
cpu_intr_1_253:
	setx	0x370109, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a4c940  ! 3104: FMULd	fmuld	%f50, %f0, %f56
	.word 0xb7a80820  ! 3108: FMOVN	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_152:
	mov	0x5, %r14
	.word 0xf0db8e60  ! 3110: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
cpu_intr_1_254:
	setx	0x34013f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_153:
	mov	0x3c0, %r14
	.word 0xf8db8400  ! 3116: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
cpu_intr_1_255:
	setx	0x350012, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda48840  ! 3120: FADDd	faddd	%f18, %f0, %f30
iob_intr_1_250:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_250), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb3aa8820  ! 3126: FMOVG	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_251:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_251), 16, 16)) -> intp(1, 0, 11)
iob_intr_1_252:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_252), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_256:
	setx	0x37011e, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r17 + %g0] 0xf0, %f2
iob_intr_1_253:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_253), 16, 16)) -> intp(1, 0, 2f)
cpu_intr_1_257:
	setx	0x360023, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_148:
	mov	0xb, %r14
	.word 0xf4f38400  ! 3147: STXA_R	stxa	%r26, [%r14 + %r0] 0x20
T1_asi_reg_wr_149:
	mov	0x3c2, %r14
	.word 0xf2f384a0  ! 3148: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
T1_asi_reg_wr_150:
	mov	0xa, %r14
	.word 0xf6f384a0  ! 3149: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
	.word 0xb9a5c960  ! 3150: FMULq	dis not found

T1_asi_reg_rd_154:
	mov	0x8, %r14
	.word 0xf8db8e40  ! 3151: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
iob_intr_1_254:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_254), 16, 16)) -> intp(1, 0, 37)
T1_asi_reg_rd_155:
	mov	0x1e, %r14
	.word 0xf4db84a0  ! 3154: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
	.word 0xbfa44840  ! 3155: FADDd	faddd	%f48, %f0, %f62
	.word 0xbdaa4820  ! 3156: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xa1902002  ! 3158: WRPR_GL_I	wrpr	%r0, 0x0002, %-
iob_intr_1_255:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_255), 16, 16)) -> intp(1, 0, 33)
	.word 0xb7a00560  ! 3163: FSQRTq	fsqrt	
T1_asi_reg_wr_151:
	mov	0x3c4, %r14
	.word 0xf2f384a0  ! 3164: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xbda4c820  ! 3165: FADDs	fadds	%f19, %f0, %f30
cpu_intr_1_258:
	setx	0x34022f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_256:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_256), 16, 16)) -> intp(1, 0, f)
T1_asi_reg_wr_152:
	mov	0x28, %r14
	.word 0xf6f389e0  ! 3174: STXA_R	stxa	%r27, [%r14 + %r0] 0x4f
	.word 0xbda80420  ! 3176: FMOVRZ	dis not found

iob_intr_1_257:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_257), 16, 16)) -> intp(1, 0, 3e)
	lda	[%r17 + %g0] 0xf0, %f2
cpu_intr_1_259:
	setx	0x3b003e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_258:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_258), 16, 16)) -> intp(1, 0, 27)
	.word 0xb3a449c0  ! 3185: FDIVd	fdivd	%f48, %f0, %f56
T1_asi_reg_rd_156:
	mov	0x3c0, %r14
	.word 0xf4db8e40  ! 3191: LDXA_R	ldxa	[%r14, %r0] 0x72, %r26
	.word 0xb9a88820  ! 3192: FMOVLE	fmovs	%fcc1, %f0, %f28
iob_intr_1_259:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_259), 16, 16)) -> intp(1, 0, 3d)
cpu_intr_1_260:
	setx	0x38033a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda508e0  ! 3197: FSUBq	dis not found

iob_intr_1_260:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_260), 16, 16)) -> intp(1, 0, 34)
	.word 0xbba408e0  ! 3209: FSUBq	dis not found

iob_intr_1_261:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_261), 16, 16)) -> intp(1, 0, 1a)
	.word 0xbba5c8a0  ! 3212: FSUBs	fsubs	%f23, %f0, %f29
	.word 0xbd3c9000  ! 3213: SRAX_R	srax	%r18, %r0, %r30
	.word 0xbba5c8e0  ! 3214: FSUBq	dis not found

	.word 0xb3348000  ! 3215: SRL_R	srl 	%r18, %r0, %r25
	.word 0xb3a489a0  ! 3217: FDIVs	fdivs	%f18, %f0, %f25
cpu_intr_1_261:
	setx	0x3b0136, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a81c20  ! 3220: FMOVRGEZ	dis not found

	.word 0xb614a0ec  ! 3222: OR_I	or 	%r18, 0x00ec, %r27
T1_asi_reg_wr_153:
	mov	0x35, %r14
	.word 0xf8f38e40  ! 3228: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
cpu_intr_1_262:
	setx	0x3a0201, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba408e0  ! 3231: FSUBq	dis not found

	.word 0xb9a81c20  ! 3232: FMOVRGEZ	dis not found

	.word 0xb9a00520  ! 3233: FSQRTs	fsqrt	
cpu_intr_1_263:
	setx	0x3b013f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a81420  ! 3235: FMOVRNZ	dis not found

cpu_intr_1_264:
	setx	0x3b0303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_265:
	setx	0x3b010b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3abc820  ! 3241: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb0044000  ! 3243: ADD_R	add 	%r17, %r0, %r24
	.word 0xbf3d6001  ! 3248: SRA_I	sra 	%r21, 0x0001, %r31
	.word 0xbba80c20  ! 3249: FMOVRLZ	dis not found

	.word 0xb3a94820  ! 3250: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xb5a5c8e0  ! 3252: FSUBq	dis not found

iob_intr_1_262:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_262), 16, 16)) -> intp(1, 0, 14)
iob_intr_1_263:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_263), 16, 16)) -> intp(1, 0, c)
T1_asi_reg_rd_157:
	mov	0x18, %r14
	.word 0xf2db8e40  ! 3255: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
	.word 0xbfa50920  ! 3258: FMULs	fmuls	%f20, %f0, %f31
	.word 0xb1a409a0  ! 3259: FDIVs	fdivs	%f16, %f0, %f24
T1_asi_reg_wr_154:
	mov	0x4, %r14
	.word 0xfef38e40  ! 3260: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_266:
	setx	0x3a0012, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_264:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_264), 16, 16)) -> intp(1, 0, 28)
	.word 0xb3a9c820  ! 3263: FMOVVS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_267:
	setx	0x3a021c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_158:
	mov	0x3c3, %r14
	.word 0xfcdb8e80  ! 3266: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_1_268:
	setx	0x380320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba489e0  ! 3271: FDIVq	dis not found

	lda	[%r16 + %g0] 0xf0, %f2
	.word 0xbba8c820  ! 3277: FMOVL	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_159:
	mov	0x16, %r14
	.word 0xf4db89e0  ! 3280: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r26
	.word 0xba0d6124  ! 3282: AND_I	and 	%r21, 0x0124, %r29
	.word 0xbf2cc000  ! 3283: SLL_R	sll 	%r19, %r0, %r31
	.word 0xbda408a0  ! 3286: FSUBs	fsubs	%f16, %f0, %f30
	.word 0xb62d8000  ! 3290: ANDN_R	andn 	%r22, %r0, %r27
	.word 0xb5a00020  ! 3293: FMOVs	fmovs	%f0, %f26
	.word 0xb12db001  ! 3295: SLLX_I	sllx	%r22, 0x0001, %r24
	.word 0xb9a8c820  ! 3298: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xbd346001  ! 3300: SRL_I	srl 	%r17, 0x0001, %r30
	.word 0xb1a00560  ! 3301: FSQRTq	fsqrt	
	.word 0xbfaac820  ! 3304: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb9a9c820  ! 3305: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb024a10c  ! 3306: SUB_I	sub 	%r18, 0x010c, %r24
cpu_intr_1_269:
	setx	0x39012b, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_155:
	mov	0x3c5, %r14
	.word 0xf2f38e40  ! 3308: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xbc0da1cc  ! 3316: AND_I	and 	%r22, 0x01cc, %r30
cpu_intr_1_270:
	setx	0x38003a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_156:
	mov	0x21, %r14
	.word 0xfef38e40  ! 3323: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
	.word 0xb3a4c9e0  ! 3325: FDIVq	dis not found

iob_intr_1_265:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_265), 16, 16)) -> intp(1, 0, 6)
	.word 0xb1a5c9c0  ! 3331: FDIVd	fdivd	%f54, %f0, %f24
	.word 0xb1aa8820  ! 3332: FMOVG	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_160:
	mov	0x1d, %r14
	.word 0xf0db8e80  ! 3335: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbcbca117  ! 3337: XNORcc_I	xnorcc 	%r18, 0x0117, %r30
T1_asi_reg_wr_157:
	mov	0x10, %r14
	.word 0xfaf389e0  ! 3345: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
iob_intr_1_266:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_266), 16, 16)) -> intp(1, 0, 25)
	.word 0xb7a48920  ! 3349: FMULs	fmuls	%f18, %f0, %f27
T1_asi_reg_wr_158:
	mov	0x14, %r14
	.word 0xfcf38e60  ! 3351: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
cpu_intr_1_271:
	setx	0x3a023d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7ab0820  ! 3355: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb5a98820  ! 3358: FMOVNEG	fmovs	%fcc1, %f0, %f26
iob_intr_1_267:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_267), 16, 16)) -> intp(1, 0, 2e)
	.word 0xb3a449a0  ! 3365: FDIVs	fdivs	%f17, %f0, %f25
	.word 0x9195617f  ! 3367: WRPR_PIL_I	wrpr	%r21, 0x017f, %pil
T1_asi_reg_rd_161:
	mov	0x3c0, %r14
	.word 0xfadb8400  ! 3368: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
	.word 0xbb7ce401  ! 3372: MOVR_I	movre	%r19, 0x1, %r29
	.word 0xb9aa4820  ! 3378: FMOVNE	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_159:
	mov	0x3c0, %r14
	.word 0xfcf38e40  ! 3380: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7a00560  ! 3381: FSQRTq	fsqrt	
T1_asi_reg_wr_160:
	mov	0x3c5, %r14
	.word 0xf8f389e0  ! 3382: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
	.word 0xb8b5e09a  ! 3385: ORNcc_I	orncc 	%r23, 0x009a, %r28
	.word 0xb7a00560  ! 3386: FSQRTq	fsqrt	
iob_intr_1_268:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_268), 16, 16)) -> intp(1, 0, 11)
T1_asi_reg_rd_162:
	mov	0x22, %r14
	.word 0xf2db8e80  ! 3395: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_1_269:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_269), 16, 16)) -> intp(1, 0, 1b)
cpu_intr_1_272:
	setx	0x390014, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a449c0  ! 3401: FDIVd	fdivd	%f48, %f0, %f24
T1_asi_reg_wr_161:
	mov	0x3c8, %r14
	.word 0xf4f38e40  ! 3402: STXA_R	stxa	%r26, [%r14 + %r0] 0x72
iob_intr_1_270:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_270), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_wr_162:
	mov	0x2e, %r14
	.word 0xfef38e40  ! 3406: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
cpu_intr_1_273:
	setx	0x3a030c, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_274:
	setx	0x3b0029, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a88820  ! 3410: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xbfa448c0  ! 3411: FSUBd	fsubd	%f48, %f0, %f62
	.word 0xbdab8820  ! 3412: FMOVPOS	fmovs	%fcc1, %f0, %f30
iob_intr_1_271:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_271), 16, 16)) -> intp(1, 0, 1b)
T1_asi_reg_rd_163:
	mov	0x16, %r14
	.word 0xf8db8e40  ! 3416: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
T1_asi_reg_wr_163:
	mov	0x3, %r14
	.word 0xf8f38400  ! 3417: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xb93d1000  ! 3418: SRAX_R	srax	%r20, %r0, %r28
	.word 0xbfa98820  ! 3419: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbfab8820  ! 3423: FMOVPOS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_275:
	setx	0x390303, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_276:
	setx	0x3b0231, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_164:
	mov	0xf, %r14
	.word 0xf8db89e0  ! 3428: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xbfa588e0  ! 3429: FSUBq	dis not found

	.word 0xbfaac820  ! 3430: FMOVGE	fmovs	%fcc1, %f0, %f31
T1_asi_reg_wr_164:
	mov	0x6, %r14
	.word 0xfef38e40  ! 3431: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
iob_intr_1_272:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_272), 16, 16)) -> intp(1, 0, 18)
	.word 0xb9a50920  ! 3434: FMULs	fmuls	%f20, %f0, %f28
	.word 0xb9a00560  ! 3437: FSQRTq	fsqrt	
	.word 0xbfa5c8a0  ! 3439: FSUBs	fsubs	%f23, %f0, %f31
	.word 0xbba00520  ! 3443: FSQRTs	fsqrt	
	.word 0xb9a8c820  ! 3444: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xbb504000  ! 3445: RDPR_TNPC	<illegal instruction>
iob_intr_1_273:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_273), 16, 16)) -> intp(1, 0, 0)
iob_intr_1_274:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_274), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_277:
	setx	0x38000d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_165:
	mov	0x3c1, %r14
	.word 0xf2db89e0  ! 3457: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r25
	.word 0xb3a5c940  ! 3462: FMULd	fmuld	%f54, %f0, %f56
cpu_intr_1_278:
	setx	0x39000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbe1c4000  ! 3468: XOR_R	xor 	%r17, %r0, %r31
cpu_intr_1_279:
	setx	0x390316, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5abc820  ! 3472: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbda00040  ! 3473: FMOVd	fmovd	%f0, %f30
	.word 0xbbab4820  ! 3477: FMOVCC	fmovs	%fcc1, %f0, %f29
T1_asi_reg_rd_166:
	mov	0x2e, %r14
	.word 0xf0db84a0  ! 3481: LDXA_R	ldxa	[%r14, %r0] 0x25, %r24
cpu_intr_1_280:
	setx	0x3b0000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_281:
	setx	0x3b0135, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb77c4400  ! 3490: MOVR_R	movre	%r17, %r0, %r27
	.word 0xbbab4820  ! 3491: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xbb7ca401  ! 3492: MOVR_I	movre	%r18, 0x1, %r29
	.word 0xbba80c20  ! 3495: FMOVRLZ	dis not found

	.word 0xb2152044  ! 3496: OR_I	or 	%r20, 0x0044, %r25
	.word 0xb3a508a0  ! 3497: FSUBs	fsubs	%f20, %f0, %f25
	.word 0xb6b56140  ! 3499: SUBCcc_I	orncc 	%r21, 0x0140, %r27
	.word 0xb9ab0820  ! 3502: FMOVGU	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_165:
	mov	0x3c6, %r14
	.word 0xf2f38e60  ! 3504: STXA_R	stxa	%r25, [%r14 + %r0] 0x73
cpu_intr_1_282:
	setx	0x3b001f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_283:
	setx	0x39001a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_275:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_275), 16, 16)) -> intp(1, 0, 6)
	.word 0xb5a8c820  ! 3515: FMOVL	fmovs	%fcc1, %f0, %f26
cpu_intr_1_284:
	setx	0x390029, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_285:
	setx	0x3a0000, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda88820  ! 3523: FMOVLE	fmovs	%fcc1, %f0, %f30
iob_intr_1_276:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_276), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_rd_167:
	mov	0x1b, %r14
	.word 0xf6db8e60  ! 3526: LDXA_R	ldxa	[%r14, %r0] 0x73, %r27
	.word 0xb37da401  ! 3530: MOVR_I	movre	%r22, 0x1, %r25
	.word 0xb9a488a0  ! 3532: FSUBs	fsubs	%f18, %f0, %f28
T1_asi_reg_rd_168:
	mov	0x27, %r14
	.word 0xfadb8e40  ! 3534: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
iob_intr_1_277:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_277), 16, 16)) -> intp(1, 0, 18)
T1_asi_reg_rd_169:
	mov	0x1a, %r14
	.word 0xf0db8e60  ! 3538: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb22de08c  ! 3542: ANDN_I	andn 	%r23, 0x008c, %r25
T1_asi_reg_rd_170:
	mov	0x36, %r14
	.word 0xfedb8e80  ! 3546: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_1_286:
	setx	0x3a0211, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_171:
	mov	0x3c4, %r14
	.word 0xfcdb8e80  ! 3550: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
cpu_intr_1_287:
	setx	0x38021d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_166:
	mov	0x27, %r14
	.word 0xfcf38e60  ! 3556: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
iob_intr_1_278:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_278), 16, 16)) -> intp(1, 0, 18)
	.word 0xb7ab0820  ! 3558: FMOVGU	fmovs	%fcc1, %f0, %f27
T1_asi_reg_wr_167:
	mov	0x9, %r14
	.word 0xfcf38e40  ! 3559: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	lda	[%r22 + %g0] 0xf0, %f2
cpu_intr_1_288:
	setx	0x39032d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_289:
	setx	0x38010e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_290:
	setx	0x3b0329, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3ab0820  ! 3569: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb3a00040  ! 3571: FMOVd	fmovd	%f0, %f56
T1_asi_reg_wr_168:
	mov	0x2, %r14
	.word 0xf6f384a0  ! 3573: STXA_R	stxa	%r27, [%r14 + %r0] 0x25
T1_asi_reg_wr_169:
	mov	0x0, %r14
	.word 0xf4f38e60  ! 3574: STXA_R	stxa	%r26, [%r14 + %r0] 0x73
cpu_intr_1_291:
	setx	0x3b0032, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_279:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_279), 16, 16)) -> intp(1, 0, 23)
	.word 0xbd35a001  ! 3582: SRL_I	srl 	%r22, 0x0001, %r30
cpu_intr_1_292:
	setx	0x38031e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_280:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_280), 16, 16)) -> intp(1, 0, 12)
cpu_intr_1_293:
	setx	0x3a0234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf51c000  ! 3586: RDPR_TL	<illegal instruction>
	.word 0xbba58960  ! 3587: FMULq	dis not found

cpu_intr_1_294:
	setx	0x3b003e, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xbfa80420  ! 3592: FMOVRZ	dis not found

	.word 0xbda90820  ! 3593: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb1a50940  ! 3597: FMULd	fmuld	%f20, %f0, %f24
	.word 0xbda4c860  ! 3600: FADDq	dis not found

T1_asi_reg_wr_170:
	mov	0x1b, %r14
	.word 0xfcf38e80  ! 3602: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
cpu_intr_1_295:
	setx	0x3b0001, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa548c0  ! 3604: FSUBd	fsubd	%f52, %f0, %f62
	.word 0xb17de401  ! 3605: MOVR_I	movre	%r23, 0x1, %r24
	.word 0xbba81420  ! 3606: FMOVRNZ	dis not found

	.word 0xbda44820  ! 3609: FADDs	fadds	%f17, %f0, %f30
	.word 0xbe45a16c  ! 3613: ADDC_I	addc 	%r22, 0x016c, %r31
iob_intr_1_281:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_281), 16, 16)) -> intp(1, 0, 5)
	.word 0xbfaa8820  ! 3615: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xb5ab0820  ! 3616: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb5a408e0  ! 3617: FSUBq	dis not found

	.word 0xbfab8820  ! 3621: FMOVPOS	fmovs	%fcc1, %f0, %f31
iob_intr_1_282:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_282), 16, 16)) -> intp(1, 0, 13)
T1_asi_reg_rd_172:
	mov	0x1, %r14
	.word 0xfcdb89e0  ! 3627: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
T1_asi_reg_wr_171:
	mov	0x3c7, %r14
	.word 0xfaf384a0  ! 3630: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
T1_asi_reg_wr_172:
	mov	0x1c, %r14
	.word 0xf6f38e40  ! 3631: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_283:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_283), 16, 16)) -> intp(1, 0, 28)
T1_asi_reg_wr_173:
	mov	0x3c5, %r14
	.word 0xf6f38400  ! 3634: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
	.word 0xb7a5c960  ! 3638: FMULq	dis not found

	.word 0xb3a80c20  ! 3639: FMOVRLZ	dis not found

	.word 0x8395e042  ! 3640: WRPR_TNPC_I	wrpr	%r23, 0x0042, %tnpc
iob_intr_1_284:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_284), 16, 16)) -> intp(1, 0, 30)
T1_asi_reg_wr_174:
	mov	0x3c5, %r14
	.word 0xfaf389e0  ! 3644: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb93c3001  ! 3649: SRAX_I	srax	%r16, 0x0001, %r28
	.word 0xb7a5c8c0  ! 3654: FSUBd	fsubd	%f54, %f0, %f58
T1_asi_reg_rd_173:
	mov	0x20, %r14
	.word 0xf8db84a0  ! 3657: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
iob_intr_1_285:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_285), 16, 16)) -> intp(1, 0, 2c)
	.word 0xbe35c000  ! 3660: SUBC_R	orn 	%r23, %r0, %r31
iob_intr_1_286:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_286), 16, 16)) -> intp(1, 0, 1a)
cpu_intr_1_296:
	setx	0x3f0004, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_175:
	mov	0x3c7, %r14
	.word 0xf8f38400  ! 3665: STXA_R	stxa	%r28, [%r14 + %r0] 0x20
	.word 0xbdaa4820  ! 3666: FMOVNE	fmovs	%fcc1, %f0, %f30
T1_asi_reg_wr_176:
	mov	0x0, %r14
	.word 0xfcf38e80  ! 3667: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
T1_asi_reg_rd_174:
	mov	0x1c, %r14
	.word 0xfcdb8e60  ! 3668: LDXA_R	ldxa	[%r14, %r0] 0x73, %r30
	.word 0xbba549e0  ! 3669: FDIVq	dis not found

iob_intr_1_287:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_287), 16, 16)) -> intp(1, 0, 7)
T1_asi_reg_wr_177:
	mov	0x3c0, %r14
	.word 0xfaf38400  ! 3673: STXA_R	stxa	%r29, [%r14 + %r0] 0x20
	.word 0xb5a84820  ! 3674: FMOVE	fmovs	%fcc1, %f0, %f26
iob_intr_1_288:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_288), 16, 16)) -> intp(1, 0, 2)
	.word 0xb7643801  ! 3676: MOVcc_I	<illegal instruction>
	.word 0x8d94e0c0  ! 3677: WRPR_PSTATE_I	wrpr	%r19, 0x00c0, %pstate
	.word 0xb7a94820  ! 3681: FMOVCS	fmovs	%fcc1, %f0, %f27
iob_intr_1_289:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_289), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_wr_178:
	mov	0xa, %r14
	.word 0xf8f384a0  ! 3684: STXA_R	stxa	%r28, [%r14 + %r0] 0x25
iob_intr_1_290:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_290), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb284a1c6  ! 3690: ADDcc_I	addcc 	%r18, 0x01c6, %r25
	.word 0xb1ab0820  ! 3692: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xbba40920  ! 3695: FMULs	fmuls	%f16, %f0, %f29
	.word 0xb9a58920  ! 3696: FMULs	fmuls	%f22, %f0, %f28
T1_asi_reg_wr_179:
	mov	0x1, %r14
	.word 0xf2f38e40  ! 3698: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_291:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_291), 16, 16)) -> intp(1, 0, 10)
	.word 0xb33d2001  ! 3702: SRA_I	sra 	%r20, 0x0001, %r25
	.word 0xb1a81420  ! 3707: FMOVRNZ	dis not found

	.word 0xb7a90820  ! 3710: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb7a5c8c0  ! 3712: FSUBd	fsubd	%f54, %f0, %f58
	.word 0xbda00020  ! 3717: FMOVs	fmovs	%f0, %f30
	.word 0xb9a548a0  ! 3718: FSUBs	fsubs	%f21, %f0, %f28
	.word 0xb9aa0820  ! 3721: FMOVA	fmovs	%fcc1, %f0, %f28
iob_intr_1_292:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_292), 16, 16)) -> intp(1, 0, 27)
	.word 0xb234a152  ! 3725: SUBC_I	orn 	%r18, 0x0152, %r25
cpu_intr_1_297:
	setx	0x3c033f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a44920  ! 3727: FMULs	fmuls	%f17, %f0, %f25
T1_asi_reg_rd_175:
	mov	0xb, %r14
	.word 0xf0db8e40  ! 3730: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbfa00520  ! 3733: FSQRTs	fsqrt	
cpu_intr_1_298:
	setx	0x3f0035, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa44940  ! 3736: FMULd	fmuld	%f48, %f0, %f62
cpu_intr_1_299:
	setx	0x3e023c, %g1, %o0
	ta	T_SEND_THRD_INTR
	lda	[%r22 + %g0] 0xf0, %f2
cpu_intr_1_300:
	setx	0x3d002f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_176:
	mov	0x2d, %r14
	.word 0xf0db8e40  ! 3744: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
T1_asi_reg_rd_177:
	mov	0x3c1, %r14
	.word 0xf0db8400  ! 3746: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb7a58920  ! 3747: FMULs	fmuls	%f22, %f0, %f27
	.word 0xb3a548c0  ! 3748: FSUBd	fsubd	%f52, %f0, %f56
	.word 0xbda00540  ! 3752: FSQRTd	fsqrt	
	.word 0xbba448e0  ! 3753: FSUBq	dis not found

	.word 0xb7a00520  ! 3754: FSQRTs	fsqrt	
cpu_intr_1_301:
	setx	0x3f022e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbab0820  ! 3756: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb9aa0820  ! 3766: FMOVA	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_180:
	mov	0x28, %r14
	.word 0xfaf38e40  ! 3769: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
iob_intr_1_293:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_293), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb7ab0820  ! 3772: FMOVGU	fmovs	%fcc1, %f0, %f27
T1_asi_reg_rd_178:
	mov	0x29, %r14
	.word 0xf0db8400  ! 3775: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
	.word 0xb61c8000  ! 3777: XOR_R	xor 	%r18, %r0, %r27
cpu_intr_1_302:
	setx	0x3f010d, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_179:
	mov	0x3c6, %r14
	.word 0xfadb8400  ! 3783: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
iob_intr_1_294:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_294), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_303:
	setx	0x3f0031, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb8c40000  ! 3793: ADDCcc_R	addccc 	%r16, %r0, %r28
	.word 0xb9a449e0  ! 3794: FDIVq	dis not found

T1_asi_reg_wr_181:
	mov	0x1, %r14
	.word 0xfaf384a0  ! 3797: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
iob_intr_1_295:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_295), 16, 16)) -> intp(1, 0, 19)
T1_asi_reg_rd_180:
	mov	0x2a, %r14
	.word 0xfedb8e80  ! 3801: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_1_304:
	setx	0x3e001c, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_181:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 3806: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
iob_intr_1_296:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_296), 16, 16)) -> intp(1, 0, 3e)
iob_intr_1_297:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_297), 16, 16)) -> intp(1, 0, 5)
	.word 0xa1902000  ! 3810: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xb7a00020  ! 3811: FMOVs	fmovs	%f0, %f27
T1_asi_reg_rd_182:
	mov	0x1e, %r14
	.word 0xf0db8e60  ! 3812: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb9a50820  ! 3815: FADDs	fadds	%f20, %f0, %f28
	.word 0xbcb4a127  ! 3817: SUBCcc_I	orncc 	%r18, 0x0127, %r30
iob_intr_1_298:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_298), 16, 16)) -> intp(1, 0, 5)
cpu_intr_1_305:
	setx	0x3d0119, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_299:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_299), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb5a81820  ! 3824: FMOVRGZ	fmovs	%fcc3, %f0, %f26
iob_intr_1_300:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_300), 16, 16)) -> intp(1, 0, 23)
	.word 0xb9abc820  ! 3833: FMOVVC	fmovs	%fcc1, %f0, %f28
cpu_intr_1_306:
	setx	0x6, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_301:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_301), 16, 16)) -> intp(1, 0, 1d)
cpu_intr_1_307:
	setx	0x3d0102, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00560  ! 3842: FSQRTq	fsqrt	
	.word 0xb52df001  ! 3843: SLLX_I	sllx	%r23, 0x0001, %r26
	.word 0xb5a9c820  ! 3845: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbda90820  ! 3846: FMOVLEU	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_rd_183:
	mov	0x14, %r14
	.word 0xf8db8e60  ! 3851: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
iob_intr_1_302:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_302), 16, 16)) -> intp(1, 0, 3c)
cpu_intr_1_308:
	setx	0x3e033e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_182:
	mov	0x13, %r14
	.word 0xf8f38e40  ! 3856: STXA_R	stxa	%r28, [%r14 + %r0] 0x72
T1_asi_reg_wr_183:
	mov	0x0, %r14
	.word 0xf6f38e40  ! 3857: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
T1_asi_reg_wr_184:
	mov	0xd, %r14
	.word 0xfaf38e40  ! 3859: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xbba9c820  ! 3864: FMOVVS	fmovs	%fcc1, %f0, %f29
cpu_intr_1_309:
	setx	0x3c021c, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb00cc000  ! 3868: AND_R	and 	%r19, %r0, %r24
	.word 0xb5a50940  ! 3871: FMULd	fmuld	%f20, %f0, %f26
	.word 0xb3a81420  ! 3874: FMOVRNZ	dis not found

T1_asi_reg_rd_184:
	mov	0x25, %r14
	.word 0xfadb8e60  ! 3878: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xb57ca401  ! 3879: MOVR_I	movre	%r18, 0x1, %r26
T1_asi_reg_rd_185:
	mov	0x19, %r14
	.word 0xf8db84a0  ! 3881: LDXA_R	ldxa	[%r14, %r0] 0x25, %r28
	.word 0xb53c4000  ! 3882: SRA_R	sra 	%r17, %r0, %r26
cpu_intr_1_310:
	setx	0x3e0318, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_303:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_303), 16, 16)) -> intp(1, 0, c)
	.word 0xbc050000  ! 3885: ADD_R	add 	%r20, %r0, %r30
	.word 0xb7a9c820  ! 3887: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xbba4c940  ! 3889: FMULd	fmuld	%f50, %f0, %f60
	.word 0xb7a81420  ! 3891: FMOVRNZ	dis not found

	.word 0xbcb5a1dd  ! 3892: ORNcc_I	orncc 	%r22, 0x01dd, %r30
	.word 0xbda8c820  ! 3893: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb9a80420  ! 3895: FMOVRZ	dis not found

T1_asi_reg_wr_185:
	mov	0x0, %r14
	.word 0xfaf38e80  ! 3899: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbba84820  ! 3900: FMOVE	fmovs	%fcc1, %f0, %f29
T1_asi_reg_wr_186:
	mov	0x3c8, %r14
	.word 0xf2f389e0  ! 3903: STXA_R	stxa	%r25, [%r14 + %r0] 0x4f
iob_intr_1_304:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_304), 16, 16)) -> intp(1, 0, a)
T1_asi_reg_wr_187:
	mov	0x1c, %r14
	.word 0xf0f384a0  ! 3907: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
	.word 0xb2a4c000  ! 3908: SUBcc_R	subcc 	%r19, %r0, %r25
	.word 0xb9a5c9e0  ! 3912: FDIVq	dis not found

T1_asi_reg_rd_186:
	mov	0x0, %r14
	.word 0xfadb8e60  ! 3913: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
iob_intr_1_305:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_305), 16, 16)) -> intp(1, 0, 22)
	.word 0xb934b001  ! 3917: SRLX_I	srlx	%r18, 0x0001, %r28
T1_asi_reg_wr_188:
	mov	0x5, %r14
	.word 0xfcf38e40  ! 3918: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
T1_asi_reg_rd_187:
	mov	0x28, %r14
	.word 0xfadb8e40  ! 3923: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
T1_asi_reg_wr_189:
	mov	0x29, %r14
	.word 0xf6f38e40  ! 3924: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_306:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_306), 16, 16)) -> intp(1, 0, 24)
	.word 0xbda98820  ! 3926: FMOVNEG	fmovs	%fcc1, %f0, %f30
cpu_intr_1_311:
	setx	0x3e0036, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80820  ! 3929: FMOVN	fmovs	%fcc1, %f0, %f27
cpu_intr_1_312:
	setx	0x3f0104, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6bcc000  ! 3931: XNORcc_R	xnorcc 	%r19, %r0, %r27
T1_asi_reg_rd_188:
	mov	0x3c8, %r14
	.word 0xfadb8400  ! 3936: LDXA_R	ldxa	[%r14, %r0] 0x20, %r29
cpu_intr_1_313:
	setx	0x3c0339, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda94820  ! 3940: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xbda81820  ! 3942: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb5a00040  ! 3944: FMOVd	fmovd	%f0, %f26
T1_asi_reg_rd_189:
	mov	0x2d, %r14
	.word 0xfcdb8e40  ! 3946: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbaa4c000  ! 3949: SUBcc_R	subcc 	%r19, %r0, %r29
cpu_intr_1_314:
	setx	0x3d020f, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_190:
	mov	0x20, %r14
	.word 0xfef38e80  ! 3953: STXA_R	stxa	%r31, [%r14 + %r0] 0x74
	.word 0xbda588c0  ! 3958: FSUBd	fsubd	%f22, %f0, %f30
T1_asi_reg_rd_190:
	mov	0x3c6, %r14
	.word 0xf4db84a0  ! 3959: LDXA_R	ldxa	[%r14, %r0] 0x25, %r26
cpu_intr_1_315:
	setx	0x3f000b, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_307:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_307), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_308:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_308), 16, 16)) -> intp(1, 0, 1)
T1_asi_reg_rd_191:
	mov	0x35, %r14
	.word 0xf0db8e60  ! 3968: LDXA_R	ldxa	[%r14, %r0] 0x73, %r24
	.word 0xb1a508c0  ! 3970: FSUBd	fsubd	%f20, %f0, %f24
iob_intr_1_309:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_309), 16, 16)) -> intp(1, 0, c)
iob_intr_1_310:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_310), 16, 16)) -> intp(1, 0, 2b)
iob_intr_1_311:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_311), 16, 16)) -> intp(1, 0, 19)
	.word 0xb1a00520  ! 3977: FSQRTs	fsqrt	
cpu_intr_1_316:
	setx	0x3f0300, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb494e039  ! 3982: ORcc_I	orcc 	%r19, 0x0039, %r26
	.word 0xbdab8820  ! 3984: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xbda81820  ! 3987: FMOVRGZ	fmovs	%fcc3, %f0, %f30
cpu_intr_1_317:
	setx	0x3f0319, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_192:
	mov	0x3c5, %r14
	.word 0xfadb84a0  ! 3992: LDXA_R	ldxa	[%r14, %r0] 0x25, %r29
cpu_intr_1_318:
	setx	0x3e0337, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7641800  ! 3995: MOVcc_R	<illegal instruction>
	.word 0xb5a00560  ! 3998: FSQRTq	fsqrt	
	.word 0xb41c61cd  ! 4001: XOR_I	xor 	%r17, 0x01cd, %r26
iob_intr_1_312:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_312), 16, 16)) -> intp(1, 0, 3a)
iob_intr_1_313:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_313), 16, 16)) -> intp(1, 0, 19)
	.word 0xb0150000  ! 4007: OR_R	or 	%r20, %r0, %r24
cpu_intr_1_319:
	setx	0x3e023a, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_193:
	mov	0x3c6, %r14
	.word 0xf8db8400  ! 4011: LDXA_R	ldxa	[%r14, %r0] 0x20, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa508e0  ! 4016: FSUBq	dis not found

T1_asi_reg_rd_194:
	mov	0x26, %r14
	.word 0xf0db8e80  ! 4018: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xb3a98820  ! 4019: FMOVNEG	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_195:
	mov	0xc, %r14
	.word 0xf0db8e80  ! 4023: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
T1_asi_reg_rd_196:
	mov	0x26, %r14
	.word 0xf8db89e0  ! 4025: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r28
	.word 0xb1a488e0  ! 4027: FSUBq	dis not found

	.word 0xbfab0820  ! 4028: FMOVGU	fmovs	%fcc1, %f0, %f31
T1_asi_reg_rd_197:
	mov	0x23, %r14
	.word 0xf4db8e60  ! 4029: LDXA_R	ldxa	[%r14, %r0] 0x73, %r26
	.word 0xb7a80420  ! 4030: FMOVRZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
cpu_intr_1_320:
	setx	0x3d023b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c940  ! 4035: FMULd	fmuld	%f54, %f0, %f62
iob_intr_1_314:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_314), 16, 16)) -> intp(1, 0, 20)
iob_intr_1_315:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_315), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb5a98820  ! 4040: FMOVNEG	fmovs	%fcc1, %f0, %f26
T1_asi_reg_wr_191:
	mov	0x1b, %r14
	.word 0xf6f38e80  ! 4041: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
cpu_intr_1_321:
	setx	0x3c0038, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a00560  ! 4046: FSQRTq	fsqrt	
	.word 0xb3a408c0  ! 4047: FSUBd	fsubd	%f16, %f0, %f56
	.word 0xbfa5c920  ! 4054: FMULs	fmuls	%f23, %f0, %f31
	.word 0xbda98820  ! 4055: FMOVNEG	fmovs	%fcc1, %f0, %f30
	.word 0xb3a80820  ! 4056: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
iob_intr_1_316:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_316), 16, 16)) -> intp(1, 0, 13)
	.word 0xbfa58920  ! 4060: FMULs	fmuls	%f22, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa408a0  ! 4068: FSUBs	fsubs	%f16, %f0, %f31
T1_asi_reg_wr_192:
	mov	0x22, %r14
	.word 0xfef38400  ! 4069: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
iob_intr_1_317:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_317), 16, 16)) -> intp(1, 0, b)
	.word 0xb9358000  ! 4071: SRL_R	srl 	%r22, %r0, %r28
T1_asi_reg_wr_193:
	mov	0x3c1, %r14
	.word 0xf4f389e0  ! 4074: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb5a48840  ! 4075: FADDd	faddd	%f18, %f0, %f26
iob_intr_1_318:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_318), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_319:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_319), 16, 16)) -> intp(1, 0, 3f)
	.word 0x8d9420b2  ! 4080: WRPR_PSTATE_I	wrpr	%r16, 0x00b2, %pstate
cpu_intr_1_322:
	setx	0x40000e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8f902002  ! 4082: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xb7a80820  ! 4083: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
iob_intr_1_320:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_320), 16, 16)) -> intp(1, 0, 6)
T1_asi_reg_rd_198:
	mov	0xa, %r14
	.word 0xf0db89e0  ! 4089: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r24
cpu_intr_1_323:
	setx	0x410305, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_321:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_321), 16, 16)) -> intp(1, 0, 1f)
iob_intr_1_322:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_322), 16, 16)) -> intp(1, 0, 3)
T1_asi_reg_rd_199:
	mov	0x3c5, %r14
	.word 0xf8db8e40  ! 4093: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb9ab4820  ! 4094: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb3a5c940  ! 4095: FMULd	fmuld	%f54, %f0, %f56
	.word 0xb2948000  ! 4096: ORcc_R	orcc 	%r18, %r0, %r25
	.word 0xbba00020  ! 4098: FMOVs	fmovs	%f0, %f29
iob_intr_1_323:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_323), 16, 16)) -> intp(1, 0, 10)
cpu_intr_1_324:
	setx	0x42003a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_325:
	setx	0x430211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80c20  ! 4105: FMOVRLZ	dis not found

	.word 0xb1ab0820  ! 4106: FMOVGU	fmovs	%fcc1, %f0, %f24
T1_asi_reg_rd_200:
	mov	0x27, %r14
	.word 0xf0db8e40  ! 4109: LDXA_R	ldxa	[%r14, %r0] 0x72, %r24
	.word 0xbda00560  ! 4111: FSQRTq	fsqrt	
T1_asi_reg_wr_194:
	mov	0x7, %r14
	.word 0xf0f384a0  ! 4113: STXA_R	stxa	%r24, [%r14 + %r0] 0x25
cpu_intr_1_326:
	setx	0x42022a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_324:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_324), 16, 16)) -> intp(1, 0, 16)
T1_asi_reg_wr_195:
	mov	0x24, %r14
	.word 0xf2f38e40  ! 4117: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_325:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_325), 16, 16)) -> intp(1, 0, 3a)
cpu_intr_1_327:
	setx	0x42002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb08d0000  ! 4122: ANDcc_R	andcc 	%r20, %r0, %r24
	.word 0xb7a00540  ! 4123: FSQRTd	fsqrt	
	lda	[%r21 + %g0] 0xf0, %f2
	.word 0xb1a58860  ! 4128: FADDq	dis not found

T1_asi_reg_rd_201:
	mov	0x3c1, %r14
	.word 0xfcdb89e0  ! 4129: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r30
	.word 0xb7643801  ! 4130: MOVcc_I	<illegal instruction>
cpu_intr_1_328:
	setx	0x42020f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a548a0  ! 4135: FSUBs	fsubs	%f21, %f0, %f28
	.word 0xb3aa8820  ! 4136: FMOVG	fmovs	%fcc1, %f0, %f25
cpu_intr_1_329:
	setx	0x420219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00560  ! 4139: FSQRTq	fsqrt	
T1_asi_reg_rd_202:
	mov	0x21, %r14
	.word 0xf2db8e60  ! 4140: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
	.word 0xb7a509e0  ! 4141: FDIVq	dis not found

	.word 0xb7a80820  ! 4143: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
cpu_intr_1_330:
	setx	0x43003d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_331:
	setx	0x43021e, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_196:
	mov	0x3c8, %r14
	.word 0xf6f38e80  ! 4148: STXA_R	stxa	%r27, [%r14 + %r0] 0x74
	.word 0xb7a50860  ! 4149: FADDq	dis not found

cpu_intr_1_332:
	setx	0x420210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda98820  ! 4151: FMOVNEG	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_203:
	mov	0x3c2, %r14
	.word 0xf2db8e40  ! 4152: LDXA_R	ldxa	[%r14, %r0] 0x72, %r25
cpu_intr_1_333:
	setx	0x40012d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a40940  ! 4154: FMULd	fmuld	%f16, %f0, %f24
cpu_intr_1_334:
	setx	0x400225, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_204:
	mov	0x1f, %r14
	.word 0xfedb84a0  ! 4158: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb9a80c20  ! 4159: FMOVRLZ	dis not found

	.word 0xbba44940  ! 4161: FMULd	fmuld	%f48, %f0, %f60
	.word 0xbfa88820  ! 4163: FMOVLE	fmovs	%fcc1, %f0, %f31
cpu_intr_1_335:
	setx	0x400216, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa90820  ! 4168: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb5a81820  ! 4169: FMOVRGZ	fmovs	%fcc3, %f0, %f26
cpu_intr_1_336:
	setx	0x420223, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00520  ! 4173: FSQRTs	fsqrt	
cpu_intr_1_337:
	setx	0x420210, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdab8820  ! 4176: FMOVPOS	fmovs	%fcc1, %f0, %f30
T1_asi_reg_rd_205:
	mov	0x3c2, %r14
	.word 0xfcdb8e40  ! 4178: LDXA_R	ldxa	[%r14, %r0] 0x72, %r30
	.word 0xb7a449e0  ! 4179: FDIVq	dis not found

cpu_intr_1_338:
	setx	0x40003c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_326:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_326), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbc8c60f3  ! 4187: ANDcc_I	andcc 	%r17, 0x00f3, %r30
iob_intr_1_327:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_327), 16, 16)) -> intp(1, 0, 31)
iob_intr_1_328:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_328), 16, 16)) -> intp(1, 0, 3b)
cpu_intr_1_339:
	setx	0x400032, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_340:
	setx	0x410306, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 4193: RDPR_TPC	<illegal instruction>
	.word 0xbdabc820  ! 4195: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbc05216e  ! 4196: ADD_I	add 	%r20, 0x016e, %r30
	.word 0xbba80420  ! 4201: FMOVRZ	dis not found

T1_asi_reg_wr_197:
	mov	0x3c3, %r14
	.word 0xf2f38e40  ! 4202: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
	.word 0xb3aa4820  ! 4203: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb1a9c820  ! 4206: FMOVVS	fmovs	%fcc1, %f0, %f24
T1_asi_reg_wr_198:
	mov	0x3c3, %r14
	.word 0xf6f38400  ! 4209: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_1_341:
	setx	0x41000d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaac820  ! 4212: FMOVGE	fmovs	%fcc1, %f0, %f29
iob_intr_1_329:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_329), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb1a4c8e0  ! 4215: FSUBq	dis not found

	.word 0xbfa00520  ! 4216: FSQRTs	fsqrt	
cpu_intr_1_342:
	setx	0x400224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda54860  ! 4220: FADDq	dis not found

	.word 0xbfa00540  ! 4221: FSQRTd	fsqrt	
	.word 0xbfa54820  ! 4225: FADDs	fadds	%f21, %f0, %f31
	.word 0xb9a588c0  ! 4226: FSUBd	fsubd	%f22, %f0, %f28
cpu_intr_1_343:
	setx	0x420327, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a84820  ! 4231: FMOVE	fmovs	%fcc1, %f0, %f27
cpu_intr_1_344:
	setx	0x43001a, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_345:
	setx	0x430106, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6c40000  ! 4235: ADDCcc_R	addccc 	%r16, %r0, %r27
	.word 0xb5a00540  ! 4239: FSQRTd	fsqrt	
	.word 0xbda44820  ! 4240: FADDs	fadds	%f17, %f0, %f30
iob_intr_1_330:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_330), 16, 16)) -> intp(1, 0, 15)
	.word 0xbda00540  ! 4242: FSQRTd	fsqrt	
cpu_intr_1_346:
	setx	0x410330, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a509e0  ! 4253: FDIVq	dis not found

	.word 0xbba84820  ! 4254: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb7a81820  ! 4255: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xbba508c0  ! 4256: FSUBd	fsubd	%f20, %f0, %f60
iob_intr_1_331:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_331), 16, 16)) -> intp(1, 0, 2a)
cpu_intr_1_347:
	setx	0x430236, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_199:
	mov	0x3c5, %r14
	.word 0xf2f38400  ! 4259: STXA_R	stxa	%r25, [%r14 + %r0] 0x20
cpu_intr_1_348:
	setx	0x430224, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb68cc000  ! 4262: ANDcc_R	andcc 	%r19, %r0, %r27
iob_intr_1_332:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_332), 16, 16)) -> intp(1, 0, 15)
	.word 0xb5a549a0  ! 4266: FDIVs	fdivs	%f21, %f0, %f26
	.word 0xb9ab4820  ! 4270: FMOVCC	fmovs	%fcc1, %f0, %f28
T1_asi_reg_wr_200:
	mov	0x3c8, %r14
	.word 0xfcf38e40  ! 4271: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
cpu_intr_1_349:
	setx	0x400039, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa0820  ! 4280: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb5a488a0  ! 4281: FSUBs	fsubs	%f18, %f0, %f26
	.word 0xbba5c8a0  ! 4282: FSUBs	fsubs	%f23, %f0, %f29
T1_asi_reg_rd_206:
	mov	0x27, %r14
	.word 0xfedb8e40  ! 4286: LDXA_R	ldxa	[%r14, %r0] 0x72, %r31
	.word 0xbcb42079  ! 4295: SUBCcc_I	orncc 	%r16, 0x0079, %r30
iob_intr_1_333:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_333), 16, 16)) -> intp(1, 0, 2d)
iob_intr_1_334:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_334), 16, 16)) -> intp(1, 0, 32)
T1_asi_reg_wr_201:
	mov	0x3c2, %r14
	.word 0xf8f389e0  ! 4301: STXA_R	stxa	%r28, [%r14 + %r0] 0x4f
cpu_intr_1_350:
	setx	0x43023f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_335:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_335), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_351:
	setx	0x400301, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_352:
	setx	0x430205, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a00020  ! 4312: FMOVs	fmovs	%f0, %f27
	.word 0xbfa80820  ! 4313: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb53dd000  ! 4314: SRAX_R	srax	%r23, %r0, %r26
	.word 0xbdaa4820  ! 4316: FMOVNE	fmovs	%fcc1, %f0, %f30
cpu_intr_1_353:
	setx	0x42022a, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_336:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_336), 16, 16)) -> intp(1, 0, 1b)
cpu_intr_1_354:
	setx	0x42013e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_337:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_337), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_355:
	setx	0x410133, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6b54000  ! 4334: ORNcc_R	orncc 	%r21, %r0, %r27
cpu_intr_1_356:
	setx	0x400020, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_357:
	setx	0x430207, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_358:
	setx	0x42000b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb353001  ! 4340: SRLX_I	srlx	%r20, 0x0001, %r29
iob_intr_1_338:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_338), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb3ab8820  ! 4344: FMOVPOS	fmovs	%fcc1, %f0, %f25
cpu_intr_1_359:
	setx	0x41031d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_339:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_339), 16, 16)) -> intp(1, 0, 1a)
T1_asi_reg_wr_202:
	mov	0x38, %r14
	.word 0xf2f384a0  ! 4350: STXA_R	stxa	%r25, [%r14 + %r0] 0x25
	.word 0xb6858000  ! 4352: ADDcc_R	addcc 	%r22, %r0, %r27
	.word 0xb0b5618a  ! 4354: ORNcc_I	orncc 	%r21, 0x018a, %r24
	.word 0xb9aa4820  ! 4355: FMOVNE	fmovs	%fcc1, %f0, %f28
iob_intr_1_340:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_340), 16, 16)) -> intp(1, 0, 2d)
T1_asi_reg_rd_207:
	mov	0x2f, %r14
	.word 0xfadb8e40  ! 4357: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	.word 0xb9a44860  ! 4361: FADDq	dis not found

iob_intr_1_341:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_341), 16, 16)) -> intp(1, 0, 1d)
iob_intr_1_342:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_342), 16, 16)) -> intp(1, 0, 3f)
	.word 0xb5a00540  ! 4367: FSQRTd	fsqrt	
iob_intr_1_343:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_343), 16, 16)) -> intp(1, 0, 23)
cpu_intr_1_360:
	setx	0x40032f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_344:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_344), 16, 16)) -> intp(1, 0, 19)
iob_intr_1_345:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_345), 16, 16)) -> intp(1, 0, 22)
T1_asi_reg_wr_203:
	mov	0x36, %r14
	.word 0xfaf384a0  ! 4377: STXA_R	stxa	%r29, [%r14 + %r0] 0x25
	.word 0xb7a80820  ! 4378: FMOVN	fmovs	%fcc1, %f0, %f27
iob_intr_1_346:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_346), 16, 16)) -> intp(1, 0, 37)
	.word 0xb3a58840  ! 4384: FADDd	faddd	%f22, %f0, %f56
	.word 0xb5a54860  ! 4387: FADDq	dis not found

T1_asi_reg_wr_204:
	mov	0x3c6, %r14
	.word 0xf4f38e80  ! 4390: STXA_R	stxa	%r26, [%r14 + %r0] 0x74
iob_intr_1_347:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_347), 16, 16)) -> intp(1, 0, 15)
cpu_intr_1_361:
	setx	0x40010e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xba34c000  ! 4393: SUBC_R	orn 	%r19, %r0, %r29
	.word 0xb7a9c820  ! 4394: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xbba81420  ! 4397: FMOVRNZ	dis not found

	.word 0xbfa00040  ! 4399: FMOVd	fmovd	%f0, %f62
iob_intr_1_348:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_348), 16, 16)) -> intp(1, 0, 17)
	.word 0xb5a00560  ! 4404: FSQRTq	fsqrt	
	.word 0xb950c000  ! 4405: RDPR_TT	<illegal instruction>
T1_asi_reg_rd_208:
	mov	0xf, %r14
	.word 0xf2db8e60  ! 4406: LDXA_R	ldxa	[%r14, %r0] 0x73, %r25
cpu_intr_1_362:
	setx	0x400014, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_209:
	mov	0x30, %r14
	.word 0xfadb89e0  ! 4411: LDXA_R	ldxa	[%r14, %r0] 0x4f, %r29
	.word 0xb9abc820  ! 4412: FMOVVC	fmovs	%fcc1, %f0, %f28
cpu_intr_1_363:
	setx	0x40022e, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_364:
	setx	0x42030f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c840  ! 4418: FADDd	faddd	%f54, %f0, %f24
T1_asi_reg_rd_210:
	mov	0x18, %r14
	.word 0xf8db8e60  ! 4420: LDXA_R	ldxa	[%r14, %r0] 0x73, %r28
	.word 0xb1a4c8a0  ! 4421: FSUBs	fsubs	%f19, %f0, %f24
	.word 0xb9a409c0  ! 4422: FDIVd	fdivd	%f16, %f0, %f28
iob_intr_1_349:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_349), 16, 16)) -> intp(1, 0, 2e)
	.word 0xbba00520  ! 4429: FSQRTs	fsqrt	
	lda	[%r22 + %g0] 0xf0, %f2
T1_asi_reg_rd_211:
	mov	0x14, %r14
	.word 0xf0db8400  ! 4433: LDXA_R	ldxa	[%r14, %r0] 0x20, %r24
T1_asi_reg_rd_212:
	mov	0x35, %r14
	.word 0xf4db8e80  ! 4434: LDXA_R	ldxa	[%r14, %r0] 0x74, %r26
cpu_intr_1_365:
	setx	0x400311, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_366:
	setx	0x410214, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1aa8820  ! 4438: FMOVG	fmovs	%fcc1, %f0, %f24
cpu_intr_1_367:
	setx	0x400304, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3358000  ! 4441: SRL_R	srl 	%r22, %r0, %r25
	.word 0xbba00560  ! 4442: FSQRTq	fsqrt	
cpu_intr_1_368:
	setx	0x430226, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_213:
	mov	0x1d, %r14
	.word 0xfedb8e80  ! 4448: LDXA_R	ldxa	[%r14, %r0] 0x74, %r31
cpu_intr_1_369:
	setx	0x43031b, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a5c9a0  ! 4451: FDIVs	fdivs	%f23, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_205:
	mov	0x19, %r14
	.word 0xf4f389e0  ! 4455: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
T1_asi_reg_rd_214:
	mov	0x34, %r14
	.word 0xf8db8e40  ! 4456: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xbbaa0820  ! 4458: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbaa48000  ! 4464: SUBcc_R	subcc 	%r18, %r0, %r29
	.word 0xbf349000  ! 4469: SRLX_R	srlx	%r18, %r0, %r31
cpu_intr_1_370:
	setx	0x42030c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_350:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_350), 16, 16)) -> intp(1, 0, 2c)
T1_asi_reg_wr_206:
	mov	0x17, %r14
	.word 0xfaf389e0  ! 4479: STXA_R	stxa	%r29, [%r14 + %r0] 0x4f
	.word 0xb7a9c820  ! 4480: FMOVVS	fmovs	%fcc1, %f0, %f27
iob_intr_1_351:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_351), 16, 16)) -> intp(1, 0, 17)
	.word 0xbda588c0  ! 4482: FSUBd	fsubd	%f22, %f0, %f30
cpu_intr_1_371:
	setx	0x43021d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbdaac820  ! 4485: FMOVGE	fmovs	%fcc1, %f0, %f30
iob_intr_1_352:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_352), 16, 16)) -> intp(1, 0, 3d)
cpu_intr_1_372:
	setx	0x43000f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_353:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_353), 16, 16)) -> intp(1, 0, 1e)
	.word 0xb9a00540  ! 4497: FSQRTd	fsqrt	
	.word 0xbfa9c820  ! 4498: FMOVVS	fmovs	%fcc1, %f0, %f31
cpu_intr_1_373:
	setx	0x1001f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a40940  ! 4501: FMULd	fmuld	%f16, %f0, %f58
cpu_intr_1_374:
	setx	0x42001d, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_375:
	setx	0x40002e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6344000  ! 4506: ORN_R	orn 	%r17, %r0, %r27
iob_intr_1_354:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_354), 16, 16)) -> intp(1, 0, 2d)
	.word 0xbda00560  ! 4513: FSQRTq	fsqrt	
T1_asi_reg_wr_207:
	mov	0x21, %r14
	.word 0xfef38400  ! 4516: STXA_R	stxa	%r31, [%r14 + %r0] 0x20
	.word 0xb9a81c20  ! 4518: FMOVRGEZ	dis not found

cpu_intr_1_376:
	setx	0x400115, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_355:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_355), 16, 16)) -> intp(1, 0, 1)
iob_intr_1_356:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_356), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb69d4000  ! 4524: XORcc_R	xorcc 	%r21, %r0, %r27
iob_intr_1_357:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_357), 16, 16)) -> intp(1, 0, e)
	.word 0xbda48820  ! 4528: FADDs	fadds	%f18, %f0, %f30
	.word 0xbba58920  ! 4530: FMULs	fmuls	%f22, %f0, %f29
	.word 0xb0b44000  ! 4533: SUBCcc_R	orncc 	%r17, %r0, %r24
	.word 0xb1a80420  ! 4539: FMOVRZ	dis not found

iob_intr_1_358:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_358), 16, 16)) -> intp(1, 0, 2)
T1_asi_reg_rd_215:
	mov	0x12, %r14
	.word 0xfadb8e40  ! 4543: LDXA_R	ldxa	[%r14, %r0] 0x72, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
iob_intr_1_359:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_359), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb9a40920  ! 4548: FMULs	fmuls	%f16, %f0, %f28
iob_intr_1_360:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_360), 16, 16)) -> intp(1, 0, 15)
T1_asi_reg_rd_216:
	mov	0x3c8, %r14
	.word 0xf0db8e80  ! 4550: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
	.word 0xbfa54940  ! 4551: FMULd	fmuld	%f52, %f0, %f62
T1_asi_reg_wr_208:
	mov	0x3c6, %r14
	.word 0xfaf38e40  ! 4553: STXA_R	stxa	%r29, [%r14 + %r0] 0x72
	.word 0xb2a50000  ! 4554: SUBcc_R	subcc 	%r20, %r0, %r25
iob_intr_1_361:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_361), 16, 16)) -> intp(1, 0, 36)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbda00560  ! 4566: FSQRTq	fsqrt	
	.word 0xb5a8c820  ! 4567: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xbda58940  ! 4568: FMULd	fmuld	%f22, %f0, %f30
iob_intr_1_362:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_362), 16, 16)) -> intp(1, 0, 30)
iob_intr_1_363:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_363), 16, 16)) -> intp(1, 0, 9)
iob_intr_1_364:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_364), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbfa90820  ! 4575: FMOVLEU	fmovs	%fcc1, %f0, %f31
cpu_intr_1_377:
	setx	0x47033f, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_365:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_365), 16, 16)) -> intp(1, 0, d)
	.word 0xbba4c9c0  ! 4586: FDIVd	fdivd	%f50, %f0, %f60
T1_asi_reg_wr_209:
	mov	0x3c5, %r14
	.word 0xfcf389e0  ! 4590: STXA_R	stxa	%r30, [%r14 + %r0] 0x4f
cpu_intr_1_378:
	setx	0x46022f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda408a0  ! 4594: FSUBs	fsubs	%f16, %f0, %f30
T1_asi_reg_wr_210:
	mov	0x3c1, %r14
	.word 0xf8f38e60  ! 4595: STXA_R	stxa	%r28, [%r14 + %r0] 0x73
	.word 0xb7a80420  ! 4597: FMOVRZ	dis not found

iob_intr_1_366:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_366), 16, 16)) -> intp(1, 0, 37)
	.word 0xb8a4e12c  ! 4599: SUBcc_I	subcc 	%r19, 0x012c, %r28
cpu_intr_1_379:
	setx	0x440000, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_380:
	setx	0x47030e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb615a163  ! 4603: OR_I	or 	%r22, 0x0163, %r27
T1_asi_reg_rd_217:
	mov	0x5, %r14
	.word 0xfadb8e60  ! 4607: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbe35205a  ! 4609: ORN_I	orn 	%r20, 0x005a, %r31
cpu_intr_1_381:
	setx	0x470233, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_367:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_367), 16, 16)) -> intp(1, 0, 28)
cpu_intr_1_382:
	setx	0x470320, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba508e0  ! 4620: FSUBq	dis not found

T1_asi_reg_wr_211:
	mov	0x3c3, %r14
	.word 0xf0f38e80  ! 4621: STXA_R	stxa	%r24, [%r14 + %r0] 0x74
T1_asi_reg_wr_212:
	mov	0x1b, %r14
	.word 0xf6f38e40  ! 4626: STXA_R	stxa	%r27, [%r14 + %r0] 0x72
iob_intr_1_368:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_368), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb9abc820  ! 4630: FMOVVC	fmovs	%fcc1, %f0, %f28
T1_asi_reg_rd_218:
	mov	0x3c5, %r14
	.word 0xf8db8e80  ! 4631: LDXA_R	ldxa	[%r14, %r0] 0x74, %r28
	.word 0xb7a80c20  ! 4632: FMOVRLZ	dis not found

	.word 0xb7a81c20  ! 4634: FMOVRGEZ	dis not found

	.word 0xbba548c0  ! 4635: FSUBd	fsubd	%f52, %f0, %f60
iob_intr_1_369:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_369), 16, 16)) -> intp(1, 0, 26)
	.word 0xb2bd8000  ! 4639: XNORcc_R	xnorcc 	%r22, %r0, %r25
	.word 0xb9aa4820  ! 4640: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb1a00560  ! 4641: FSQRTq	fsqrt	
	.word 0xb1a48940  ! 4642: FMULd	fmuld	%f18, %f0, %f24
T1_asi_reg_wr_213:
	mov	0x3c8, %r14
	.word 0xf2f38e80  ! 4643: STXA_R	stxa	%r25, [%r14 + %r0] 0x74
iob_intr_1_370:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_370), 16, 16)) -> intp(1, 0, 39)
iob_intr_1_371:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_371), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbda58860  ! 4646: FADDq	dis not found

	.word 0xb1a5c9e0  ! 4651: FDIVq	dis not found

T1_asi_reg_rd_219:
	mov	0x1c, %r14
	.word 0xf8db8e40  ! 4655: LDXA_R	ldxa	[%r14, %r0] 0x72, %r28
	.word 0xb9a80c20  ! 4656: FMOVRLZ	dis not found

T1_asi_reg_rd_220:
	mov	0x3c7, %r14
	.word 0xf2db8e80  ! 4657: LDXA_R	ldxa	[%r14, %r0] 0x74, %r25
iob_intr_1_372:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_372), 16, 16)) -> intp(1, 0, d)
T1_asi_reg_rd_221:
	mov	0x3c3, %r14
	.word 0xfadb8e60  ! 4661: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
cpu_intr_1_383:
	setx	0x460234, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00520  ! 4666: FSQRTs	fsqrt	
cpu_intr_1_384:
	setx	0x470100, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c820  ! 4671: FADDs	fadds	%f19, %f0, %f26
iob_intr_1_373:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_373), 16, 16)) -> intp(1, 0, 12)
iob_intr_1_374:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_374), 16, 16)) -> intp(1, 0, 24)
T1_asi_reg_wr_214:
	mov	0x29, %r14
	.word 0xfcf38e40  ! 4681: STXA_R	stxa	%r30, [%r14 + %r0] 0x72
	.word 0xb7a5c9e0  ! 4682: FDIVq	dis not found

T1_asi_reg_wr_215:
	mov	0x2f, %r14
	.word 0xfef38e40  ! 4687: STXA_R	stxa	%r31, [%r14 + %r0] 0x72
T1_asi_reg_wr_216:
	mov	0x36, %r14
	.word 0xfcf38e60  ! 4689: STXA_R	stxa	%r30, [%r14 + %r0] 0x73
	lda	[%r22 + %g0] 0xf0, %f2
cpu_intr_1_385:
	setx	0x44032c, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_375:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_375), 16, 16)) -> intp(1, 0, 1f)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a81c20  ! 4701: FMOVRGEZ	dis not found

iob_intr_1_376:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_376), 16, 16)) -> intp(1, 0, 2e)
iob_intr_1_377:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_377), 16, 16)) -> intp(1, 0, 11)
	.word 0xb9aa4820  ! 4706: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb6adc000  ! 4709: ANDNcc_R	andncc 	%r23, %r0, %r27
	.word 0xb1a00520  ! 4711: FSQRTs	fsqrt	
cpu_intr_1_386:
	setx	0x470134, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_387:
	setx	0x440336, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_388:
	setx	0x46023f, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_389:
	setx	0x470301, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5345000  ! 4720: SRLX_R	srlx	%r17, %r0, %r26
T1_asi_reg_rd_222:
	mov	0x3, %r14
	.word 0xf6db84a0  ! 4721: LDXA_R	ldxa	[%r14, %r0] 0x25, %r27
T1_asi_reg_wr_217:
	mov	0x23, %r14
	.word 0xfaf38e80  ! 4723: STXA_R	stxa	%r29, [%r14 + %r0] 0x74
	.word 0xbba80820  ! 4725: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xbda48940  ! 4728: FMULd	fmuld	%f18, %f0, %f30
T1_asi_reg_wr_218:
	mov	0x5, %r14
	.word 0xf4f389e0  ! 4729: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
	.word 0xb5aa0820  ! 4732: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb3a81420  ! 4735: FMOVRNZ	dis not found

	.word 0xb3a8c820  ! 4736: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xb7a00540  ! 4737: FSQRTd	fsqrt	
	.word 0xbaa5215b  ! 4738: SUBcc_I	subcc 	%r20, 0x015b, %r29
	lda	[%r22 + %g0] 0xf0, %f2
	.word 0xb5ab0820  ! 4740: FMOVGU	fmovs	%fcc1, %f0, %f26
iob_intr_1_378:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_378), 16, 16)) -> intp(1, 0, 2b)
cpu_intr_1_390:
	setx	0x450320, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_391:
	setx	0x460025, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_392:
	setx	0x44021b, %g1, %o0
	ta	T_SEND_THRD_INTR
cpu_intr_1_393:
	setx	0x44031e, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_379:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_379), 16, 16)) -> intp(1, 0, f)
cpu_intr_1_394:
	setx	0x440333, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_wr_219:
	mov	0x36, %r14
	.word 0xf2f38e40  ! 4764: STXA_R	stxa	%r25, [%r14 + %r0] 0x72
iob_intr_1_380:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_380), 16, 16)) -> intp(1, 0, 20)
	.word 0xb89da0a5  ! 4773: XORcc_I	xorcc 	%r22, 0x00a5, %r28
cpu_intr_1_395:
	setx	0x46011f, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb21d8000  ! 4781: XOR_R	xor 	%r22, %r0, %r25
cpu_intr_1_396:
	setx	0x440211, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb97d8400  ! 4784: MOVR_R	movre	%r22, %r0, %r28
	.word 0xbba448e0  ! 4785: FSUBq	dis not found

	.word 0xbda44840  ! 4792: FADDd	faddd	%f48, %f0, %f30
iob_intr_1_381:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_381), 16, 16)) -> intp(1, 0, 3)
	.word 0xbfa5c8a0  ! 4796: FSUBs	fsubs	%f23, %f0, %f31
cpu_intr_1_397:
	setx	0x47013a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba588a0  ! 4800: FSUBs	fsubs	%f22, %f0, %f29
	.word 0xb7a00520  ! 4801: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
T1_asi_reg_wr_220:
	mov	0x2c, %r14
	.word 0xf4f389e0  ! 4806: STXA_R	stxa	%r26, [%r14 + %r0] 0x4f
iob_intr_1_382:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_382), 16, 16)) -> intp(1, 0, d)
iob_intr_1_383:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_383), 16, 16)) -> intp(1, 0, 9)
	.word 0xb3a94820  ! 4809: FMOVCS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_223:
	mov	0x2a, %r14
	.word 0xfedb84a0  ! 4812: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb9a88820  ! 4816: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xbab5c000  ! 4817: SUBCcc_R	orncc 	%r23, %r0, %r29
iob_intr_1_384:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_384), 16, 16)) -> intp(1, 0, 3)
iob_intr_1_385:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_385), 16, 16)) -> intp(1, 0, 30)
	.word 0xbba408e0  ! 4822: FSUBq	dis not found

cpu_intr_1_398:
	setx	0x470111, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_386:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_386), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb3a84820  ! 4830: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xbf2d6001  ! 4832: SLL_I	sll 	%r21, 0x0001, %r31
T1_asi_reg_wr_221:
	mov	0x17, %r14
	.word 0xfcf38e80  ! 4834: STXA_R	stxa	%r30, [%r14 + %r0] 0x74
	.word 0xa1902000  ! 4835: WRPR_GL_I	wrpr	%r0, 0x0000, %-
iob_intr_1_387:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_387), 16, 16)) -> intp(1, 0, 4)
T1_asi_reg_wr_222:
	mov	0xb, %r14
	.word 0xf6f38400  ! 4841: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_1_399:
	setx	0x440205, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_388:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_388), 16, 16)) -> intp(1, 0, 5)
T1_asi_reg_rd_224:
	mov	0x1, %r14
	.word 0xfedb84a0  ! 4845: LDXA_R	ldxa	[%r14, %r0] 0x25, %r31
	.word 0xb1abc820  ! 4848: FMOVVC	fmovs	%fcc1, %f0, %f24
cpu_intr_1_400:
	setx	0x460122, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_389:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_389), 16, 16)) -> intp(1, 0, 9)
cpu_intr_1_401:
	setx	0x450225, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbba5c920  ! 4859: FMULs	fmuls	%f23, %f0, %f29
cpu_intr_1_402:
	setx	0x460131, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9aac820  ! 4863: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xbeb56099  ! 4865: SUBCcc_I	orncc 	%r21, 0x0099, %r31
T1_asi_reg_wr_223:
	mov	0x3c1, %r14
	.word 0xf6f38400  ! 4867: STXA_R	stxa	%r27, [%r14 + %r0] 0x20
cpu_intr_1_403:
	setx	0x460024, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a548e0  ! 4877: FSUBq	dis not found

	.word 0xb7ab4820  ! 4878: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb9a409c0  ! 4882: FDIVd	fdivd	%f16, %f0, %f28
iob_intr_1_390:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_390), 16, 16)) -> intp(1, 0, 3b)
iob_intr_1_391:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_391), 16, 16)) -> intp(1, 0, 1b)
iob_intr_1_392:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_392), 16, 16)) -> intp(1, 0, 8)
cpu_intr_1_404:
	setx	0x46010d, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf643801  ! 4891: MOVcc_I	<illegal instruction>
	.word 0xb005a0a6  ! 4893: ADD_I	add 	%r22, 0x00a6, %r24
cpu_intr_1_405:
	setx	0x45033e, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda48940  ! 4896: FMULd	fmuld	%f18, %f0, %f30
cpu_intr_1_406:
	setx	0x470218, %g1, %o0
	ta	T_SEND_THRD_INTR
T1_asi_reg_rd_225:
	mov	0x3c6, %r14
	.word 0xfadb8e80  ! 4900: LDXA_R	ldxa	[%r14, %r0] 0x74, %r29
cpu_intr_1_407:
	setx	0x46002d, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_393:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_393), 16, 16)) -> intp(1, 0, 1c)
iob_intr_1_394:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_394), 16, 16)) -> intp(1, 0, 27)
	.word 0xb7a44860  ! 4906: FADDq	dis not found

iob_intr_1_395:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_395), 16, 16)) -> intp(1, 0, 13)
	.word 0xb3ab8820  ! 4911: FMOVPOS	fmovs	%fcc1, %f0, %f25
T1_asi_reg_rd_226:
	mov	0x1c, %r14
	.word 0xf0db8e80  ! 4913: LDXA_R	ldxa	[%r14, %r0] 0x74, %r24
cpu_intr_1_408:
	setx	0x450122, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb6bca1af  ! 4921: XNORcc_I	xnorcc 	%r18, 0x01af, %r27
cpu_intr_1_409:
	setx	0x460319, %g1, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
T1_asi_reg_rd_227:
	mov	0x26, %r14
	.word 0xfedb8400  ! 4931: LDXA_R	ldxa	[%r14, %r0] 0x20, %r31
	.word 0xb5abc820  ! 4934: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb7a509c0  ! 4938: FDIVd	fdivd	%f20, %f0, %f58
T1_asi_reg_rd_228:
	mov	0x1a, %r14
	.word 0xfadb8e60  ! 4939: LDXA_R	ldxa	[%r14, %r0] 0x73, %r29
	.word 0xbda40920  ! 4940: FMULs	fmuls	%f16, %f0, %f30
cpu_intr_1_410:
	setx	0x440337, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_396:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_396), 16, 16)) -> intp(1, 0, 25)
	.word 0xbdaa0820  ! 4944: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xb9a80820  ! 4948: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
cpu_intr_1_411:
	setx	0x460219, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa80820  ! 4952: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	lda	[%r16 + %g0] 0xf0, %f2
cpu_intr_1_412:
	setx	0x460127, %g1, %o0
	ta	T_SEND_THRD_INTR
iob_intr_1_397:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_397), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb3a00540  ! 4957: FSQRTd	fsqrt	
	.word 0xb7ab8820  ! 4959: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbda88820  ! 4960: FMOVLE	fmovs	%fcc1, %f0, %f30
iob_intr_1_398:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_398), 16, 16)) -> intp(1, 0, 38)
iob_intr_1_399:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_399), 16, 16)) -> intp(1, 0, e)
	.word 0xbba58940  ! 4967: FMULd	fmuld	%f22, %f0, %f60
	.word 0xb5a4c9e0  ! 4969: FDIVq	dis not found

cpu_intr_1_413:
	setx	0x460308, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a48840  ! 4971: FADDd	faddd	%f18, %f0, %f24
iob_intr_1_400:
!$EV trig_pc_d(1,expr(@VA(.MAIN.iob_intr_1_400), 16, 16)) -> intp(1, 0, 31)
cpu_intr_1_414:
	setx	0x460123, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a488e0  ! 4979: FSUBq	dis not found

	.word 0xbc258000  ! 4980: SUB_R	sub 	%r22, %r0, %r30
	.word 0xbfa4c9a0  ! 4984: FDIVs	fdivs	%f19, %f0, %f31
	.word 0xb8b48000  ! 4985: ORNcc_R	orncc 	%r18, %r0, %r28
	.word 0xbba00560  ! 4986: FSQRTq	fsqrt	
T1_asi_reg_rd_229:
	mov	0x1e, %r14
	.word 0xfcdb8e80  ! 4987: LDXA_R	ldxa	[%r14, %r0] 0x74, %r30
	.word 0xbda588c0  ! 4989: FSUBd	fsubd	%f22, %f0, %f30
cpu_intr_1_415:
	setx	0x46031a, %g1, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa00040  ! 4994: FMOVd	fmovd	%f0, %f62
	.word 0xbda00020  ! 4995: FMOVs	fmovs	%f0, %f30
	.word 0xbc0cc000  ! 4996: AND_R	and 	%r19, %r0, %r30
	.word 0xbda00520  ! 4997: FSQRTs	fsqrt	
	.word 0xbba90820  ! 4998: FMOVLEU	fmovs	%fcc1, %f0, %f29

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

	.xword	0xf1f1d5d8fb47d9c0
	.xword	0x7f6acae41a6f31b3
	.xword	0xe811e83b15743c2a
	.xword	0xcdf27140b0739cf5
	.xword	0xeeb6be7a84522161
	.xword	0x1a9efcb92381a43b
	.xword	0xe24d6a7e5429ea63
	.xword	0xc74efd41bcdb97f9
	.xword	0x9a6c315d1fa13ff0
	.xword	0xe9bc47f399c19431
	.xword	0x795c9a39b49d4af3
	.xword	0xd28bb541f0ec2894
	.xword	0x7de23844691c8759
	.xword	0x61690f7b4b5ebe71
	.xword	0x7bfe1fbf032a7266
	.xword	0xe30b8061bb671687
	.xword	0xe55e02c6d8a37a3f
	.xword	0xad59dc4bb52749b9
	.xword	0xac815fd94b0ed0fb
	.xword	0x73b15b419bec7482
	.xword	0x5ec5139933beb8b1
	.xword	0xa5779c7c898a1a83
	.xword	0x19b97a8f59a9f683
	.xword	0xc4f93654f484300e
	.xword	0x611d903c90d2c98b
	.xword	0x3d07299bd7dc1e2a
	.xword	0x5d0676461642497a
	.xword	0xffd8c2ea7d68ac7f
	.xword	0xa65f2801530c69e2
	.xword	0xbe6f396494621de4
	.xword	0x3936cbc106371b7f
	.xword	0x52814cc3c23bdae2
	.xword	0x267b3ab5f530f2e7
	.xword	0x3f07a551fbdc9e90
	.xword	0x8ba623e558c471c7
	.xword	0x13bd2096e8df8912
	.xword	0x802b7a88b607f038
	.xword	0x5af646a7647e9e30
	.xword	0xa5436ab8a080d14e
	.xword	0x9aa1c1cd5af39b01
	.xword	0x582fb09baab7e258
	.xword	0x11e7ec6888154a7d
	.xword	0x234bf37055afa106
	.xword	0x640a73e0287fe590
	.xword	0xccfee0dc9bf8dd37
	.xword	0x636df01189b06dfc
	.xword	0xeec41f7242f4468d
	.xword	0xa374af0e56da8292
	.xword	0x10e190d8b45b6934
	.xword	0x249ea6a95d943dec
	.xword	0xb06d98e782c6e0f5
	.xword	0x446919fc5e99400f
	.xword	0xa1fcfea5509f9e23
	.xword	0x9a5e046f810159fa
	.xword	0xf7afb4ddd0b51d9a
	.xword	0x7ead640cedde5ea1
	.xword	0xe47f1b870ae61a6f
	.xword	0x09debecf33a334bc
	.xword	0xde233762f373b06a
	.xword	0xba6e02a110ac177b
	.xword	0x42e714693d7a5a7d
	.xword	0xebf77389a1e16d59
	.xword	0x638df6e793b5f428
	.xword	0x296fc903c82f7b4a
	.xword	0xb98b5cab693958af
	.xword	0x200f341fd600715f
	.xword	0x6283f0a1ca2b9ad5
	.xword	0x48dd98d0073a6c30
	.xword	0x0e5b79b983102832
	.xword	0x9dafcd39f5c0fa80
	.xword	0x971eafd994a6058f
	.xword	0x36cc7c578960af95
	.xword	0xd6efcc6fde2a171d
	.xword	0x35f0c00f7f6d9466
	.xword	0x9655d08202c21339
	.xword	0x6d1347dde92a5a03
	.xword	0x17f576f9ad366825
	.xword	0xa5f7dda578dea62c
	.xword	0x6cb1e98b2958280c
	.xword	0xda7a7aa3da6b9717
	.xword	0x595e3a233ab38945
	.xword	0xea8a6da1e23fc915
	.xword	0x3211a24fe9972b45
	.xword	0x90022842fbabd412
	.xword	0x7a35bac4360124e4
	.xword	0xc9920aacbaa3e599
	.xword	0x1dd7e1c4910466dd
	.xword	0x6b1bd39ff341c27d
	.xword	0x7f9b60b87dee7472
	.xword	0x6ed3990d0e86e0c8
	.xword	0x5e3288fa4998801e
	.xword	0xc10e8a1afe087025
	.xword	0x3eba29a917cc2b69
	.xword	0xff759f10cf1b6054
	.xword	0x84096ddeb78434b4
	.xword	0xf43e6e9824ad674b
	.xword	0x8dae6368f74d5406
	.xword	0xb9d0d6dc3cd5d3b7
	.xword	0xa8eef1a3bc5f3867
	.xword	0xc7c719128103ad51
	.xword	0x80fd4330685bd645
	.xword	0x1d95568989a86f04
	.xword	0x4093a6069d751d44
	.xword	0xb12aa318071397cc
	.xword	0x7f3b83dde8b951b7
	.xword	0xcf8e5bc4bdfbcf35
	.xword	0x284996a020f445c2
	.xword	0x74cc494ce51ee7ee
	.xword	0xdd42fb687d0b7d84
	.xword	0x7a70b657d0362cbe
	.xword	0xbdc06630be46b417
	.xword	0xfc06d245691f822f
	.xword	0x02074ada3dc7aa17
	.xword	0x3844a2d7390b9c38
	.xword	0x2e4a6f4bcbdd44de
	.xword	0xc15d20ec9750f0a1
	.xword	0xc8845f29264b55cb
	.xword	0x2c2580312fb1c83a
	.xword	0x86758b7bfe5deefe
	.xword	0x48244b1156520bfb
	.xword	0xb71911ed4eeab08b
	.xword	0x263b7fad387c7ffc
	.xword	0x7b9e12c4bb7d285c
	.xword	0x542cf4f60b5016ed
	.xword	0xbb7c73ae90c97889
	.xword	0xfd0aac55ff880f3f
	.xword	0x98874912aea73300
	.xword	0x367c563dcd307c2e
	.xword	0x382621aafd738f69
	.xword	0xf9f183cd0faf4dd8
	.xword	0x5253affc9fa81154
	.xword	0xe68b5ed669a7bfe9
	.xword	0x2d8acf55829bd300
	.xword	0xb13faada8061ae2e
	.xword	0x649226c39a61482c
	.xword	0xe81187ca03454861
	.xword	0x83ddffe72c3d62a0
	.xword	0x940fc2f31c8d387a
	.xword	0xd3c3740fde53a17d
	.xword	0x4f4d5d74ca1179e6
	.xword	0xa501cd1c4f25bda4
	.xword	0xdb6d6e05b6b2f5da
	.xword	0xd22dbedd2fb9b519
	.xword	0x4255527e31bc1aff
	.xword	0xb8856207fee86f58
	.xword	0x07cd02e56f99c8b4
	.xword	0x0ee2d396b48e3291
	.xword	0xeab48ca04a6cd2fa
	.xword	0x6c8569007d3c39be
	.xword	0xf5120c5979d5aea1
	.xword	0xf45e6502663772a4
	.xword	0x88acc1dd38b00013
	.xword	0xb7ea76aaab6bc381
	.xword	0x9e64c5d1da3d2b7a
	.xword	0x252c8b1d5ca64430
	.xword	0xa9348e42df39b990
	.xword	0x07c95fc7d71cc86f
	.xword	0x64a8edb79ae23707
	.xword	0x853cba3728154e61
	.xword	0x59a753829426ed72
	.xword	0xa6b4337090769d40
	.xword	0xea2fb59d73f402cb
	.xword	0xc28cbe20bfe3534a
	.xword	0x3d71683cd3647630
	.xword	0xa36a5b5b09d2eae3
	.xword	0xf7b2e486885e31a1
	.xword	0x0795d6a5ca9414d7
	.xword	0x219646d6d56ec051
	.xword	0x96bee0e53b5c2c3a
	.xword	0x9e0368407942f56e
	.xword	0x73b33e1ca6e8efac
	.xword	0xc2a2517e77c0e238
	.xword	0x7ee2c29d3e11dd6a
	.xword	0x160562d0bf3e1cb7
	.xword	0x8a29b64d1ebfa0c6
	.xword	0x47a7a35999e6de71
	.xword	0xbac88f20d957f334
	.xword	0xa0e6f31964447af4
	.xword	0x8fc7b5ee977ddec0
	.xword	0xdf5fd8b662a31b7b
	.xword	0x380996049961a228
	.xword	0x2fb6b575eebb5c3a
	.xword	0x3f3abd9343dcd332
	.xword	0x5d81879878d803b4
	.xword	0x72fc881e827fc9fa
	.xword	0x896e360e5013fe6e
	.xword	0xa77373911a622d05
	.xword	0xaaf0f93bddc1f7f8
	.xword	0xfa612f50754eaf59
	.xword	0xed74147538d381b8
	.xword	0x97ffeb4e0ee3c899
	.xword	0xe51d263ed7c1b6c0
	.xword	0x16fab7555966b853
	.xword	0x42f5bf4f971b6012
	.xword	0xca3dac1db6694699
	.xword	0x4b6f770c85d71000
	.xword	0x35f89c2768fc8a53
	.xword	0x80d1653f72d4e119
	.xword	0xd51dc12abb5b7f84
	.xword	0x738c74b3f3423bfd
	.xword	0xded489e18fcfe2f7
	.xword	0x015878c20b317217
	.xword	0x5f94d75655c95112
	.xword	0xee7a406d8cd537bc
	.xword	0x336eb25f088387e2
	.xword	0x045d2dd7cb7d7d5d
	.xword	0x26dfa17fb3739de7
	.xword	0x792bbd792ec724d6
	.xword	0xaed41b6a9f4a80d5
	.xword	0x18f36d6723a4d89a
	.xword	0xa572ddd350925c2c
	.xword	0x964fddd775fbecc4
	.xword	0xde552b0da7c138b0
	.xword	0x37870545839f4afe
	.xword	0xfcc33831f000321b
	.xword	0x9b78be1619c44979
	.xword	0x9855fe31e48f4d1b
	.xword	0x98337ed57f590194
	.xword	0x6bd614d64d99df37
	.xword	0x4754ac01f66163f8
	.xword	0x6429519348446816
	.xword	0xae611296f154c5f2
	.xword	0xe3b163a5541221cf
	.xword	0x53e58e4a7366cf37
	.xword	0x60936fc57b13aeda
	.xword	0x7aea596380e4d6bb
	.xword	0x45df5842498ef2a7
	.xword	0x08bebeae1b909f74
	.xword	0x304e5ef67cd35747
	.xword	0xbe7bee2e2e65b6c9
	.xword	0x822ddd8939f8faa8
	.xword	0x221649adc1861a19
	.xword	0xd4d86530286c1ab9
	.xword	0xbbc0688893638bae
	.xword	0x717049dfe6f29035
	.xword	0xcd787928c4e7c770
	.xword	0x5a911e9ed4500573
	.xword	0x38a2977ebf1c789e
	.xword	0x9f26a27e4631a049
	.xword	0x1473dfe387e1b044
	.xword	0xf5ec45daddcba8a9
	.xword	0xb62791d39ba4529e
	.xword	0x5e7ef0499236f2fa
	.xword	0x98bfc9806b1e5f69
	.xword	0x8282b7707fb3d4af
	.xword	0x5c60ea5f5fb6c20e
	.xword	0x4c033946e1163de7
	.xword	0x18423aa8cb246a1b
	.xword	0xa6c96548fa1ae7aa
	.xword	0xec9269ee65064112
	.xword	0x28fc0b5895252af8
	.xword	0x1e332bca41d58400
	.xword	0xb8a1c593ffeb2db3
	.xword	0x299713299a2861ee
	.xword	0xd235b188f4b6314c
	.xword	0xe9e70cd2c3f22cc3
	.align 0x2000
	.data
data_start_1:

	.xword	0xbee7588cdfede6c2
	.xword	0xb4ed6df26a9557d7
	.xword	0x7562ae2f720d5662
	.xword	0xa2e0885a984c05c7
	.xword	0x28faa1f62afbcd4e
	.xword	0x4baa27bac5f92d44
	.xword	0xa188cbf593136229
	.xword	0x1700bdc50297ad77
	.xword	0x7e1bbd5575d1c88d
	.xword	0xa481ce7b0177c8d1
	.xword	0x744a16ae2e1a0d17
	.xword	0x0426c368d213c8a7
	.xword	0x7c73ff6daf1f4434
	.xword	0xb360804ad8b36ce5
	.xword	0xaf7d8a856b7715c5
	.xword	0x1d52fbc4dd4a9019
	.xword	0x448e31aa91617cc5
	.xword	0x29cfc3171a1ce237
	.xword	0x608ad3fa16261ce2
	.xword	0x0e0357b241bee5d6
	.xword	0x71ea8b49fb145f09
	.xword	0x6792a25e343de748
	.xword	0xc90fe74f8521f982
	.xword	0x33d327a0c40af32c
	.xword	0xeb006a896d1d8e46
	.xword	0x63a3819049762a56
	.xword	0xe0431bfd27a5b84d
	.xword	0x5af279e4f6aa18d7
	.xword	0xb0b2c190e42f9489
	.xword	0xd6944453ae3ae6e7
	.xword	0x54115ea577935a7e
	.xword	0xe64229b9bab55120
	.xword	0x93889175b40c91c9
	.xword	0x6ee199c8ae38e24e
	.xword	0x28ba51e8436a50f2
	.xword	0x4ed153dd59fbbf1e
	.xword	0xc68c6b3bd3c72cda
	.xword	0x35952a00096821b3
	.xword	0xf1a8dcbd18737e3f
	.xword	0x5cc3e2e731f4f428
	.xword	0x6c3f02a25a80d77e
	.xword	0xcc5cd5ce5c8bbcaa
	.xword	0x11c9b7e59ad80221
	.xword	0xd9d1a819b3734d40
	.xword	0xec7d33122429abe1
	.xword	0xc8b6402b8f1479d5
	.xword	0x2374a351ca277147
	.xword	0xa1d041cec31e662c
	.xword	0xa647934c0834c3e1
	.xword	0xa7af03527642f971
	.xword	0xbd0338c0ff90d220
	.xword	0x1ba9780f75e7d261
	.xword	0xbdd1dd08d1af1f37
	.xword	0x15143904e224960d
	.xword	0x50f622620d924aaf
	.xword	0x3cd747e3b1325e76
	.xword	0xc7420505085c455c
	.xword	0x3c6ac03099591957
	.xword	0x4eafe9d5bcc01fab
	.xword	0xd36f97174fa7dbf8
	.xword	0x1831d40ce1d3bc2f
	.xword	0x52bb4832a7923401
	.xword	0x1f18bca1cb578257
	.xword	0xaa29df43b5256cc1
	.xword	0x5869cb27ff53657b
	.xword	0x2ebc43cb9c882b54
	.xword	0xb98b23d31683373c
	.xword	0x5e475394906b6426
	.xword	0x8d1256ddb81b3827
	.xword	0x4b459c83103d2d49
	.xword	0x99772344bcff2b6d
	.xword	0x988f993ef3116ad4
	.xword	0x8018d143eb4a8d0b
	.xword	0xb3b83a756383d4d6
	.xword	0x6725c8a1ebe119a8
	.xword	0xfe8f5ec00e89e89e
	.xword	0x96f0946519d31ec7
	.xword	0x32d13838cf23524f
	.xword	0x7afb0d324e135f6e
	.xword	0x4f8dd5d393292019
	.xword	0xddb567e1ac313d38
	.xword	0xd1b048b088c94c1b
	.xword	0x52eec31833156873
	.xword	0x82f9048f0ffac737
	.xword	0x66cc8aaf5c8de2aa
	.xword	0xa1810a1744d45203
	.xword	0x0a44fcea0e544cfc
	.xword	0x3410b13cc882b8a4
	.xword	0x29c8d36abb9f8a3c
	.xword	0x172e0a91e8e88e29
	.xword	0x4fbb8b497d2ade24
	.xword	0x7d4f68c134e96d6f
	.xword	0x1a24b1d93bfd4f43
	.xword	0xdf0a724c0248836d
	.xword	0x06d4dc799abccfd2
	.xword	0x0b0f29e192bc730e
	.xword	0x9a0236aef0e251ba
	.xword	0x38f7c97b1e789e19
	.xword	0x3852a56ef39ad81d
	.xword	0x87a85bd47560e37e
	.xword	0x234c517aa1bfbbc0
	.xword	0x9e17be6f587c6355
	.xword	0x78e00c9e5cfc3b31
	.xword	0xfa7db566233c448d
	.xword	0x9c4695f18a7d5fc1
	.xword	0x215412fa5c59e185
	.xword	0x8579ccdca7213602
	.xword	0x4c9753286e720115
	.xword	0x76d62e4232cf835e
	.xword	0xa02c28aa036ff551
	.xword	0x45e68a556301908e
	.xword	0xaf202ebf88f04e37
	.xword	0x1b60f290855821a1
	.xword	0xc100e1e08bb5e03e
	.xword	0x4be5739b41704ee9
	.xword	0xfe905427894530de
	.xword	0x198217e055d7851d
	.xword	0x3052ab148461b4f3
	.xword	0x8bc373126df327b5
	.xword	0x73e333332fadac62
	.xword	0xa2e7663a187f1244
	.xword	0xc47fbd70eb5b88d0
	.xword	0xf7329f61e185b1ee
	.xword	0x84bdd92f33435817
	.xword	0x4bf648b229267cf8
	.xword	0x62e03d25d4c670f4
	.xword	0x7fdf34fc39b9cce2
	.xword	0xd18ff11c7f4cef35
	.xword	0x889944feb2efecf9
	.xword	0x32bb6c0f4f2705e2
	.xword	0x61e6bd2a9f3aea70
	.xword	0xfc1e6c19462678ea
	.xword	0xbf4d9f6d0514f57f
	.xword	0xc9b80ed0759c70ec
	.xword	0x77a139dd48ee2b73
	.xword	0xbc12141b7ea85dea
	.xword	0x37d299790d4b9ef5
	.xword	0x5601f3185a62d5a4
	.xword	0x5a400076a99225f3
	.xword	0x8d36e111868e17fa
	.xword	0xa4ee95f0f78c1d8a
	.xword	0xad28d4fbac9b1c39
	.xword	0x25a386f7ce666575
	.xword	0x3557453855825b22
	.xword	0x4902fa6a58606fde
	.xword	0x159aaf0297d85d60
	.xword	0x068157c211937d1d
	.xword	0xa8478ee411743ac2
	.xword	0xc340d65ef43df1c4
	.xword	0x3de33f1a33ff07d2
	.xword	0xd6e6c44b87f6c999
	.xword	0xb1abbac6557eb7b0
	.xword	0x47b4e0973d545d4b
	.xword	0xae5f67623904bddd
	.xword	0xbaa60dda0f3bd9d7
	.xword	0x2f2be112fdecc756
	.xword	0xfd04d893ecbd1362
	.xword	0x06b7fffd5ec478ec
	.xword	0x053ce1b199fca68c
	.xword	0x5eb3804c974d5cb5
	.xword	0x722621f96291f906
	.xword	0x70a296235f51eeef
	.xword	0x466e3573f560fc7d
	.xword	0x992e18c4a49da428
	.xword	0x3a2bb833875f72ce
	.xword	0x6edd3bf980315b0a
	.xword	0xd2170ab83625e213
	.xword	0xa44c06f2ff444eb2
	.xword	0xcae04558864ce750
	.xword	0x701d06af1a283ff8
	.xword	0x7a65afa9706b7f1c
	.xword	0xa01c31084dc6e21e
	.xword	0xd88c948ffc90fc22
	.xword	0x080b3c19ec7f63db
	.xword	0xb340d71f6cce517b
	.xword	0xf3a990e5eb51690b
	.xword	0xe479275dfd2d0dcc
	.xword	0xd009b6318c291366
	.xword	0x5c267640affcaca8
	.xword	0x4d41c814414d65c5
	.xword	0x6d33314652ba3ea6
	.xword	0xdc2198b1b082ea8e
	.xword	0x90c8ec9d4631e3c3
	.xword	0x7307215e79f48b42
	.xword	0x778b11bdf9e13eee
	.xword	0x32689593383a371d
	.xword	0xe2bad4d7674a1591
	.xword	0xe4a958fe36494049
	.xword	0x8acd4b2fd112caba
	.xword	0x40ecc5c2a9bf7a46
	.xword	0x0f1d916381f333ac
	.xword	0x551fefa9ff64802d
	.xword	0x554c633e1e8f5636
	.xword	0xd930b30ac84bd8e0
	.xword	0xea618ac2f06b6283
	.xword	0xa25a78c6a81f8cab
	.xword	0x943792ff903ca042
	.xword	0x7bd829785727be59
	.xword	0x259ac873d6caebc2
	.xword	0x3a632c27859f1cd0
	.xword	0xc221189f79bc8326
	.xword	0x6e8be6a66c892749
	.xword	0xe38149d62fb199d7
	.xword	0x8e49ccd6fab45b6e
	.xword	0xa1cf0c282718c54b
	.xword	0x3a2aa2da2a7042c1
	.xword	0x4de071bb9c8d2b24
	.xword	0x36dfa785564a6e68
	.xword	0x2fabe47237a6a8a7
	.xword	0x3e440e5cd6987d28
	.xword	0x6a7f9a8a59bd23f3
	.xword	0x7eba007f078371ca
	.xword	0x5c1cebe5b9e0b2ae
	.xword	0xb57fa77b9640d1ae
	.xword	0xf3bb6236c9b3ae3c
	.xword	0xe83f5d2479585efd
	.xword	0xf180d604e02e2743
	.xword	0x0e3d1b7fff2d3dd1
	.xword	0xe487d4d8d0b17f7f
	.xword	0xbc6a5d5f72e1253f
	.xword	0x79749863830d20f4
	.xword	0xd24d57d2b770a15b
	.xword	0x407b6e4d1a92fe5c
	.xword	0xf8132f154b634679
	.xword	0xe15aa2fd9428134c
	.xword	0x58c3b0f9098bf218
	.xword	0x6086d0d612d6689c
	.xword	0xe23d4aa3dbbbc300
	.xword	0x5e056f942facf548
	.xword	0x49b2b26d6e1f4444
	.xword	0xde7fe0b10ab5d0ca
	.xword	0xb373ab49abf0cfd6
	.xword	0x14ed53fccd51d13c
	.xword	0xe4cdcc94d598b470
	.xword	0x376a7dcb304c049f
	.xword	0x8890bee5e9de1cde
	.xword	0x1b16363f1b9f9087
	.xword	0xb8712b87fac4275c
	.xword	0xe2c72617a8ab24f8
	.xword	0x696bb408bb82ca70
	.xword	0xd75f118224036c59
	.xword	0x1b334d30e75f1981
	.xword	0xc9c7062887652c49
	.xword	0xb038de9d4724cdba
	.xword	0x267c651a5da60cf4
	.xword	0x6dee123ed8bfab7e
	.xword	0x619ced60397f765c
	.xword	0xc3108fa0fee8c7ba
	.xword	0xfc1987f9e1a1e41e
	.xword	0xd8c18285e70382df
	.xword	0xdbba364077478a79
	.xword	0x43671c14e53eebd7
	.xword	0xacd945972a26544d
	.xword	0x06a20b83173b1d63
	.xword	0x9f88235493a5b22b
	.xword	0xd4edfed7bd603f50
	.align 0x4000
	.data
data_start_2:

	.xword	0x084014814c813685
	.xword	0xf372ecbefaf9939d
	.xword	0xa6ed6725fa0b7722
	.xword	0x956c41fb75d5dd3d
	.xword	0xe1b432c4e3eebf51
	.xword	0x306ff50f1490c247
	.xword	0x9a5cc1f550d1f4e9
	.xword	0x63766b16953f64f9
	.xword	0xac5a85befe513813
	.xword	0x78949f9a1d6ce082
	.xword	0xb808141e3381e15b
	.xword	0x4f2429d23d0645a3
	.xword	0xd0ba06f2e4b460d5
	.xword	0x92f66aa72e7e7c5a
	.xword	0x5a15569afc4bfacb
	.xword	0xac54f0b2177b0cb9
	.xword	0x11f0bf8517a21b46
	.xword	0x1330c2b1edb52d24
	.xword	0x197d51110fac3549
	.xword	0x4030c4dcfe11b84c
	.xword	0xb23a5a62d36ffe5e
	.xword	0x8c4242d855e2b5eb
	.xword	0xcf958c906a10dff3
	.xword	0x53dd8ef5f943837b
	.xword	0x645b89ecbe14022b
	.xword	0xf971be6f998c575f
	.xword	0x27790a7a5a71cf74
	.xword	0x4ce8b8eb6c2d54b0
	.xword	0x589bad4a8cf1788c
	.xword	0x056acdbc165f9c7f
	.xword	0x9f8dd114b22a426f
	.xword	0xe1a72a6374ced630
	.xword	0x6885e479282f13c8
	.xword	0xb817495e9d87371f
	.xword	0x7f4f36fa7d8545a4
	.xword	0x1dcafc8fe48ce128
	.xword	0x2614a4824ec4ac81
	.xword	0x10c7181ef5ec5fda
	.xword	0xc2ebc79f4130bb46
	.xword	0xfc4dc052b250bf13
	.xword	0xb0fdc4c5fa7dd9df
	.xword	0xdfbe642ca6466fc9
	.xword	0xa9826d359fc28bfe
	.xword	0x64643beb8d8584bd
	.xword	0x9aa2396951a52aba
	.xword	0xdff8dd54fa717885
	.xword	0xc482b8cee9a5e87e
	.xword	0x3bc159c7f71117bc
	.xword	0x432e167cf8985356
	.xword	0x7c38d5680dd51e7e
	.xword	0x45f469f2186e86ea
	.xword	0x074f5090a16fe071
	.xword	0xad99b1847d4adc86
	.xword	0xeb73bfba7458cb4b
	.xword	0x2ca31b816868aaa9
	.xword	0xa82bc240e828c7dd
	.xword	0x76d13fda958817cb
	.xword	0xccd9163c93592e5e
	.xword	0x8ba691ade8055512
	.xword	0x78d9f4a727c5788d
	.xword	0x0ae5c47231a0a357
	.xword	0x26bcb2bc4631b753
	.xword	0xa65b9e78c3a7bcbf
	.xword	0xd023407957f7e2ea
	.xword	0x67a495365412eae0
	.xword	0x0bf03f74bde33236
	.xword	0x70ae34f1bb9cdb8b
	.xword	0xa1500634bd911bcd
	.xword	0xc45e06a4b29f464f
	.xword	0x64d1ffa3fdbd3b77
	.xword	0x099c46bfd478fb09
	.xword	0x70f862009e50b2a8
	.xword	0xd790a221f44a12fc
	.xword	0x915fe3061e3eb56f
	.xword	0x55403955d192b1b7
	.xword	0xb3fbf08bff658462
	.xword	0x9127bfb63495acda
	.xword	0x796deee5b4624fc3
	.xword	0x2b33794aab2208dc
	.xword	0xf4464f09164b2c59
	.xword	0x63cb6b1326beeba1
	.xword	0x599fb35288658393
	.xword	0xefe60b79d9f59d7d
	.xword	0xe4bdfd6a1180c00e
	.xword	0xfaddf6af88c3c905
	.xword	0x537b0536b8e40294
	.xword	0x05e7568265d9b44c
	.xword	0xc386895ca46ff74e
	.xword	0xc2976fbca1ff65a1
	.xword	0x1f3acf59e1f2a089
	.xword	0x30ec9f4576df857e
	.xword	0x946daf9e34b9d7f3
	.xword	0x1db64c3e345cfd5d
	.xword	0x3cfcb837a367b234
	.xword	0x531dd4ba87cf9dc0
	.xword	0x39f38e1665f105a3
	.xword	0x05dc3014e1dbe4ce
	.xword	0x3b538eba7ae03631
	.xword	0x1eb5ea0c588d0ff2
	.xword	0x3e1edc8b039f786d
	.xword	0x462a23aa26e7a4a5
	.xword	0xabe8a04de3a4c303
	.xword	0x02171c9c47478514
	.xword	0x7eb21dc995faae84
	.xword	0x2fd08d4ec5f3bf67
	.xword	0x9cb0ae92b4e301f1
	.xword	0x82dddc547e636fee
	.xword	0x3197454db399fa67
	.xword	0x78f40332ee617607
	.xword	0x5a3786f642d27ce0
	.xword	0xb22df25e10852376
	.xword	0xf6d50a25e59c5f6f
	.xword	0x00aaf010b4da1cf8
	.xword	0x31dfb521a8ce8fc2
	.xword	0x6b9fbc0fa6bbd9fc
	.xword	0x4ab768855962ce9e
	.xword	0x1d1bfac0d8f313a7
	.xword	0x73ca8b45f1aaf261
	.xword	0x488fd6d50817d90d
	.xword	0xd271c3a00aa45dfd
	.xword	0xd5a502c8a579ca9e
	.xword	0xb3f974ef0a4eaab1
	.xword	0x754a8453aa891aef
	.xword	0x2b2bdc5a4f0025b0
	.xword	0x09574ee14cf8db73
	.xword	0x1860efdd03ae9948
	.xword	0xcfecb6c88393f8b9
	.xword	0xfe39a801a59e736e
	.xword	0x074c5fc054452567
	.xword	0x21eeb0aaa15b5d86
	.xword	0x6cefd518be958ce5
	.xword	0xe14d04903d31a328
	.xword	0x29d1118ab981979a
	.xword	0x04cbfcc059c61dd2
	.xword	0x92b685a798acbbd6
	.xword	0x18ed8077765ab396
	.xword	0x7f974304fd8917b4
	.xword	0x3007488c25ff21de
	.xword	0xfeb96cafed87ef2c
	.xword	0x2e5a0d852e435e74
	.xword	0x55cfed83d6764628
	.xword	0x7f666bfa543dfbc5
	.xword	0x639b0b5f64c2c59f
	.xword	0x4e7c4d9be8293306
	.xword	0x4c47a27303c82bc4
	.xword	0x83023072859c7dfb
	.xword	0x74f7b071f465dae9
	.xword	0x15e536e3a9b7eb71
	.xword	0x6a4e71ed67e16db3
	.xword	0xdda8897c64aeccdd
	.xword	0xba1bc7cc5e570f37
	.xword	0x24aae0108ce5b272
	.xword	0xc61a183048f9f9e3
	.xword	0xf5e9510489508ad9
	.xword	0xa274ee3c8e545f8c
	.xword	0xf529cf1bcf1b1693
	.xword	0xaf6608bae9de27e2
	.xword	0xce088537c9554fd1
	.xword	0xc3ed8c329aac6c85
	.xword	0x1da8270cd6d7faa8
	.xword	0x946b3a3799741926
	.xword	0xfcb8d4dc1517dea0
	.xword	0x1e499426460e493c
	.xword	0x310ea033fc0d9a5f
	.xword	0x1b4b7e79cf7e9250
	.xword	0x88969d2209c547ed
	.xword	0x59d4962b06b47034
	.xword	0xa878cdb15f0be084
	.xword	0x2861ec81022f6182
	.xword	0x94b31bd11343b255
	.xword	0x65bd3c6b4b685d3d
	.xword	0x0ef32fed83286cec
	.xword	0xb59a36e22e7afc99
	.xword	0x596df1c96ee65efe
	.xword	0x7e8d8c2897d2fa20
	.xword	0x16577d24af407bb0
	.xword	0x5f3d4ca03a0165d0
	.xword	0x47a9124599a50a73
	.xword	0x6ddffed0001b0434
	.xword	0xf5c02f419212d428
	.xword	0xbba0095087fa62fc
	.xword	0x02ae466bde1bd18b
	.xword	0x07a6a16c93c6489d
	.xword	0x09f50bf36cd6b5d8
	.xword	0x38ca903da1a2b1aa
	.xword	0xebc31b0184651b25
	.xword	0xef8e62d3880edd98
	.xword	0x4e443f22a25d9bfa
	.xword	0xe1693e8d4129bbae
	.xword	0x474d4af25e9cf981
	.xword	0xf66e5d32ca329527
	.xword	0xdf51917eee719579
	.xword	0x05ff619dbe544298
	.xword	0x74863183a6b22435
	.xword	0x518130e1e83cae51
	.xword	0xc06b0b672a3008e6
	.xword	0x7b827209628dccab
	.xword	0x9c51b1f61aced984
	.xword	0xd55662ac9b3cd1fa
	.xword	0xfd872af6ff2eeb39
	.xword	0x6866855bc1a42686
	.xword	0xe9e375b8fb526b93
	.xword	0x873bf10266c30a59
	.xword	0xf99d9ac0ddfd9dcd
	.xword	0x776dee9b76741d98
	.xword	0xb9b243d35b5ea3a0
	.xword	0x6d43be1fa34fa676
	.xword	0x7e76142a64416761
	.xword	0x577bd646668d277b
	.xword	0x7015130e4783c30a
	.xword	0x161453ff6e28c90b
	.xword	0x7a59abf6fd61e141
	.xword	0x25fb4ff5a389a609
	.xword	0xc45d12eefd69fb91
	.xword	0x086df208916e4479
	.xword	0xc9c4d3b07a27541b
	.xword	0x4226290668064502
	.xword	0xb921ed94883b2577
	.xword	0xa81c2d2aec77e315
	.xword	0x1530e19a51693c1e
	.xword	0x53a1793cbc5d4cb2
	.xword	0x1ab234fe9c63bccb
	.xword	0x95c0f9b0b4c251f9
	.xword	0x9ace3f1b672ebaf6
	.xword	0xefdd997b830015fc
	.xword	0x502141a29b5b8ab0
	.xword	0x975f1030e45f3394
	.xword	0x3d494313b8945b42
	.xword	0x009893fe7177cef8
	.xword	0xbfb4f779442b46d8
	.xword	0x6bbaa13b76f6f7e8
	.xword	0xd0d29193f2cb7ca1
	.xword	0x8d68f8b0d7c0defa
	.xword	0xdeaea76ac3d079fd
	.xword	0x34e49a659e851c88
	.xword	0x93f2ccef12ac4244
	.xword	0x35291a2dcca0f64c
	.xword	0x7647640c2879c9cf
	.xword	0x4e6985750bb25dbd
	.xword	0x91834db0740f1e2b
	.xword	0x9fee8ac5814fd4aa
	.xword	0x9661302af2423def
	.xword	0x98bf778a2a6ed8c5
	.xword	0x171002306cf7e259
	.xword	0x9774d5a550fbc8f0
	.xword	0x5577fe85211a2ad6
	.xword	0xc85bc91a5b1204b8
	.xword	0x383a21a3df419591
	.xword	0x01277a8a1519dff9
	.xword	0x0e6ac005c45dfabd
	.xword	0x87f94711b97a2ad6
	.xword	0xb63129202e6a1d31
	.xword	0x4d3b317fe771c96e
	.xword	0x4c2051537ad680d8
	.xword	0x6525ca90e7ec24d3
	.xword	0x0a7dda8d3588dbfa
	.align 0x8000
	.data
data_start_3:

	.xword	0x593c8dda1ddb225f
	.xword	0xd1e9662edcb74ff6
	.xword	0x5d60128ff6ce884b
	.xword	0xa498c6133ff26388
	.xword	0x3560dc53cc734716
	.xword	0xb14721442cde89a4
	.xword	0x129409253bc5db25
	.xword	0xb1403d9e2039a039
	.xword	0xd8807d21bf3b70b9
	.xword	0x4a388007f96cd5d1
	.xword	0x8787881272637f67
	.xword	0x8c2782346b48d5ef
	.xword	0xcb71c026437052ad
	.xword	0x2915b730860c22bf
	.xword	0xd780f0387b5add15
	.xword	0xc3df7aa09b18151c
	.xword	0xacb5855b2d4e3a05
	.xword	0xce59df513e91d548
	.xword	0xadd9785b90c4ac8e
	.xword	0x9480440283c215be
	.xword	0x426252c69a970504
	.xword	0x1d654d21a59c1a8e
	.xword	0x9e353f0ebc52b7a4
	.xword	0xdb8ae628b3445fa1
	.xword	0x146fe3093acc0999
	.xword	0x4042fcef2eaba0db
	.xword	0x9162b4aa3936bef7
	.xword	0xd1c16bb61d3b0f65
	.xword	0xeeefdbc5ad936adc
	.xword	0xd9e9e0b718c124e5
	.xword	0x7a366b6aa0a0a1f5
	.xword	0xcc2c7d39039fc5b1
	.xword	0x032f03b66a58fda9
	.xword	0x2ced74df5fcdac93
	.xword	0x6df7ccab2de7422c
	.xword	0x498aa5f25402336d
	.xword	0x25a5b1124f28f77e
	.xword	0xe275d6812aa10352
	.xword	0x559beb440bbc8a67
	.xword	0xd2e0163ba09641d7
	.xword	0x85134e64dd0b30c9
	.xword	0xefcf02e23dbe014a
	.xword	0xe2006e55af7d9aac
	.xword	0x0e121b81892d7b3b
	.xword	0x2f8dd9a4e10fac2e
	.xword	0xfabc5f8ea225358f
	.xword	0xbab463fdb9a80124
	.xword	0xaa0dd858e1810452
	.xword	0xacc1626885507d99
	.xword	0x183e55b2d86a3e6e
	.xword	0xa3e9e24e77336572
	.xword	0xc88bdf76e263de8f
	.xword	0x6c29f5ae65a51c84
	.xword	0xcbf36fbc6c2f0660
	.xword	0x7b825e8460d70863
	.xword	0x25e7dee9432293c1
	.xword	0x0ad4a2ca892924aa
	.xword	0x60594be814e53c69
	.xword	0xe7dfa86eb1829180
	.xword	0x50dd4af610172ee9
	.xword	0xe0de74d42f2438b3
	.xword	0x8778ba843be5358c
	.xword	0x99e5c37de4f205c0
	.xword	0x8024d73f1a5f4ad0
	.xword	0xda26c9fb3eddc1ec
	.xword	0xc5f041bb341832ec
	.xword	0xf42472bbf3344696
	.xword	0x9b07599fe5b91895
	.xword	0xe0cf8ce94c3dbeb6
	.xword	0x3cf44cd50ba15768
	.xword	0x541fe0025bbfb6e7
	.xword	0xe37139e2d562051b
	.xword	0x57f9befa796d2f9e
	.xword	0x1bfdd42637ea3f8a
	.xword	0x52727c407cb99332
	.xword	0x8c61fb1de5239789
	.xword	0x1fe1ebd4a5c601c4
	.xword	0x46656bf5843a6ad8
	.xword	0xa9ccd70f50c10ac4
	.xword	0x31e99992f20180d1
	.xword	0x57ecd904e0be2e2a
	.xword	0x4f275d8fd9a0ae15
	.xword	0xd98c4e833f913c8d
	.xword	0x8dcd39ad15e4d4e4
	.xword	0x6fc392c1e124c229
	.xword	0x3b01920720fb685b
	.xword	0x989c52308b0f3a19
	.xword	0x0e5a13c9a100189e
	.xword	0xd30b559c505b5d0e
	.xword	0x8a264edeb2de5ad3
	.xword	0x3bd06c433255e8a9
	.xword	0x5ef0338f8378c71e
	.xword	0x18e59efa7b0ddabe
	.xword	0x025115f7dd685475
	.xword	0xf671788cccb7b7bc
	.xword	0x926b8e5477a6a391
	.xword	0x422978b9156276b1
	.xword	0x3b05336c5dd7d907
	.xword	0xcdeddc6e3a5a5f5f
	.xword	0xde8e819cdb12f851
	.xword	0x6f4a1c4c26a49d04
	.xword	0x5b68516e739b7586
	.xword	0x7947b637023fd072
	.xword	0xbde8df7bab18a890
	.xword	0x5535b48b3a5e4f6c
	.xword	0x5c7150e6b96825f8
	.xword	0x19203968e195134b
	.xword	0xf7cdea261862aea2
	.xword	0x2ae9733fb7339a9b
	.xword	0x0e1ab86fb3ba1b46
	.xword	0x9a477a23db9ada6c
	.xword	0x32717d403504a0b6
	.xword	0x441467c4682fa814
	.xword	0x3406ea0e68f777e0
	.xword	0xb1edfe9b6d1575f6
	.xword	0xa575469555000216
	.xword	0xd9a57814505bd07a
	.xword	0x7add50b578c707ba
	.xword	0x0515bee611b9d502
	.xword	0xbeca4225352a5c58
	.xword	0x67e14ce7e8936d67
	.xword	0xf3dc168983cba7e2
	.xword	0xac25951a48e42868
	.xword	0x6d0e9c9c4d007bfd
	.xword	0x6350454cbea6a2bd
	.xword	0xa68e8032f0f02ec3
	.xword	0x14613e3635f66696
	.xword	0x710ddc3b1ca1ff69
	.xword	0x8922f1e6d645f3db
	.xword	0x4059a4335cc307c6
	.xword	0x0464e5de58c752b4
	.xword	0x93ec3bfbd9cd2f3d
	.xword	0x45a9394f61d83502
	.xword	0x8bc61b18d26c3af7
	.xword	0x9a2304e10ff9f631
	.xword	0xc38c9800922a1e41
	.xword	0xd09dd4c09ecb3f8c
	.xword	0x902261905a54a968
	.xword	0xbf19dbb99ef0e89b
	.xword	0xe5d34a76ba7b1b6f
	.xword	0x0ac381c7c91e1ef5
	.xword	0x3ad15f7337295a07
	.xword	0xdd146424a813ec27
	.xword	0xfd0bb22a70fa5b81
	.xword	0x93ebede20cd761ca
	.xword	0xc1fabbe540858703
	.xword	0x8d40590367e91775
	.xword	0x34eafd911c56f1d5
	.xword	0xfea9b5a9f1832c83
	.xword	0xc2938030fd718b50
	.xword	0x58947e1199e04a78
	.xword	0x7d81c2d83d6ad8ba
	.xword	0x798257d3360f25d3
	.xword	0xe00c5a6f2e019f83
	.xword	0x6c5295517cc930bb
	.xword	0x871a96096c8eb9ad
	.xword	0x9dfa20d1175fd89c
	.xword	0xed51e030b8b62cc3
	.xword	0xc2442b9253d55a78
	.xword	0xc2070a43bd4cda9c
	.xword	0xb0599197f3c1e399
	.xword	0x855e9c8f5f637448
	.xword	0xb67ce222233e7aef
	.xword	0x80fd968f8d9a3219
	.xword	0xa8fe60c9da88df28
	.xword	0x84688117385fd2b3
	.xword	0x48d8cce5d402d84c
	.xword	0x7ce5552852a5f13e
	.xword	0xe721a054aef0f66a
	.xword	0xf64da6f5abcc0615
	.xword	0x6596cfa6bae9dd06
	.xword	0xb26993d9b19194f8
	.xword	0x2546f52adb33a462
	.xword	0x73c51e93bc617c7a
	.xword	0x9c95eb9b1da4b578
	.xword	0x0be6903a25a89ba2
	.xword	0x5e8e83a8ceab0319
	.xword	0xb96bb164f1a67498
	.xword	0x481d220ec6c2d2e2
	.xword	0xd197fdfda97811af
	.xword	0x51c8ae37ebda4d11
	.xword	0x349c3c0cb9bc6065
	.xword	0x8af935f2699b2907
	.xword	0x61f8fb251a7ecd89
	.xword	0xa6a10b7dea69ef24
	.xword	0x23bc8dd1ca2c8b27
	.xword	0xf91aa0381053c1de
	.xword	0xf337e29604addc34
	.xword	0x1087f08c2521bbca
	.xword	0x97d0b4b65e7606dc
	.xword	0x5ed4a2332addf790
	.xword	0x0e05f1c1416c443a
	.xword	0x0870bd36793aa3de
	.xword	0x8d776692c454804d
	.xword	0x4064f6715aea650c
	.xword	0x76e049289682de01
	.xword	0x9c8563177d7c3b44
	.xword	0x66d48a7d64d468a0
	.xword	0x0ebc12a754de831c
	.xword	0x85fd88db0a1ea8c5
	.xword	0xac174266096ac3bf
	.xword	0xc2e067fe70d5bb02
	.xword	0x7b593c81226ba0cb
	.xword	0xd1fb4e6175703303
	.xword	0x6498d82b22cd63c7
	.xword	0xf9b2ad695cd3fa0f
	.xword	0x4dbd03e87f8fd4b6
	.xword	0x0868e4ad9bd04644
	.xword	0xe44242b7e8cc8afd
	.xword	0x1e85faee5b9e9f11
	.xword	0xb9ec775c8fc97305
	.xword	0x799cbbaad83ba21c
	.xword	0x33ce91df363e0266
	.xword	0x1a561bb89e743185
	.xword	0x0de1a62edba4922c
	.xword	0x5953c19fedb20e58
	.xword	0x8245dc66019d3ea5
	.xword	0xa8a5de1ac4d98bcc
	.xword	0xe22f714549d4e189
	.xword	0x4c2e6beea1a070ff
	.xword	0x3bc4d821d04f121c
	.xword	0x2f8f172cc84cc7c6
	.xword	0x8383f1145c14e7fb
	.xword	0x8edd739fcaaa503d
	.xword	0x56d2b015a046cd50
	.xword	0xdc57452cc1d3859f
	.xword	0xdd97af543df2ef6d
	.xword	0x1fb01d8c485dcf30
	.xword	0xf6fcbfe055dcc873
	.xword	0xd0caa9250e86f681
	.xword	0xe515c29d9c5ae464
	.xword	0x2e88b2d8b7a38017
	.xword	0xfc401dc7a1346f2f
	.xword	0xffc1df5601b9f6ca
	.xword	0x6774da9c27bd3df9
	.xword	0x6d8d40577e6f7bf2
	.xword	0x62bec513529e582b
	.xword	0xba609934fda2bd09
	.xword	0xb705fec938666302
	.xword	0x79db8fcb004b52ab
	.xword	0x303e1444a7f2b440
	.xword	0xa823c934078d9623
	.xword	0x5a51493469c1c8e0
	.xword	0xef623c13f908db18
	.xword	0x98f0b7720a56ba26
	.xword	0x82d941ad85f154f2
	.xword	0x4a68c7fc071685b0
	.xword	0x2f65cb3e865b629a
	.xword	0x062821284801c6e8
	.xword	0xd04015b18e050991
	.xword	0x03ffffc0402ee803
	.xword	0xab79cffa57fc6a5b
	.xword	0xedb61bae2598c97a
	.xword	0xff9ddb9e59ede46b
	.xword	0x20a77486e98827ef
	.xword	0x85a689cf0eb96ede
	.align 0x10000
	.data
data_start_4:

	.xword	0x0d12ed974051d803
	.xword	0x98c51c23e24f78b1
	.xword	0x503ce72e66480d42
	.xword	0x4a3eb0d552411a6e
	.xword	0x2e06cdc460f6dd0a
	.xword	0xf015dd5eab1bc065
	.xword	0xcf314acdc8afbea0
	.xword	0xdef097f48477c3a9
	.xword	0x5e631e5668d4b233
	.xword	0x3812fc080d711601
	.xword	0x6d37247597b700ec
	.xword	0xb952910e17baf156
	.xword	0xb4716da3bd4013bb
	.xword	0x2e1ccbdfab8f8a06
	.xword	0x822892dd2be2d4a5
	.xword	0x14de25493427bd9c
	.xword	0x86bbdb650ef30471
	.xword	0x1b359524f30a4aa4
	.xword	0x46bf846590a46c31
	.xword	0x175570e7c558ea45
	.xword	0xc958e1de34a9279c
	.xword	0xd898f15286fbd57b
	.xword	0xa354005b09b3d7e8
	.xword	0xee216c573137b380
	.xword	0x02403bd73269787a
	.xword	0x36889a4be9056758
	.xword	0x9e7c6d4d7d58a3df
	.xword	0xa981e5c8ed28a775
	.xword	0xbbb571adad798b45
	.xword	0xdf90b26461f962a9
	.xword	0xd3d043bb985fa40c
	.xword	0xf6198b6c19830ea3
	.xword	0x8f520eeb7bac111e
	.xword	0xc2479d3bd5a2988b
	.xword	0x288f4e1c54b59519
	.xword	0xdf01f4098272e983
	.xword	0x100be195976e3196
	.xword	0xc60e59b344f0d190
	.xword	0x158b9b52f4f306f0
	.xword	0xa088c45c337f041c
	.xword	0x2d6548d64ba8ad57
	.xword	0x0c251c584ae818d0
	.xword	0xca0e81c560e23f69
	.xword	0x55fa167fee4ada6a
	.xword	0x0665c0532f7816b4
	.xword	0xa019aa13ff336def
	.xword	0x173fedd8ac276c44
	.xword	0x12c7a3e78ece9c12
	.xword	0x381d2ae43b57449a
	.xword	0x5a4a74e0a637e4cc
	.xword	0xca14bed29c8dab6c
	.xword	0x6d5b02c86141894d
	.xword	0x82e0e8c5271f6ea9
	.xword	0xdafe88159334d194
	.xword	0xfef2f0e47d2f2faf
	.xword	0x7836adcad1816b5f
	.xword	0xc40d968f3f981ef0
	.xword	0x7667b36d1e334d72
	.xword	0x3406ab0d1eb32da0
	.xword	0x00aab911213a7a32
	.xword	0xeccbd1aef84aba60
	.xword	0x55534d09ccb32c1a
	.xword	0x5fb1f327fd643ba9
	.xword	0x1d1b9ba0ed8d96b3
	.xword	0x6ebfacaae3479334
	.xword	0xa12a0bace2f001b4
	.xword	0x29f3384d71f18a6b
	.xword	0xd803dbd6e5cd3368
	.xword	0xdf20b87b148e0f3e
	.xword	0x6715a7699dd52805
	.xword	0x8abac57d7cb85acd
	.xword	0xa6cdc301ac153a68
	.xword	0x0d0cf8df84a56067
	.xword	0x3c07261c5477b4b2
	.xword	0xe2dd0443dfbf8a99
	.xword	0x4ab5154b50e2ef4e
	.xword	0x9243c09fdf5887a4
	.xword	0x987e898bdb6b468b
	.xword	0xb19a24e7475d02f2
	.xword	0x9a0efed90200ee6c
	.xword	0xf26dbb606c350887
	.xword	0x95362d787cb9d0b4
	.xword	0xc4ff94a11caa711a
	.xword	0x497a4dddd1c758dd
	.xword	0x742c358231ce4ff4
	.xword	0xd428ef8283d61c6d
	.xword	0x1f3e68873649a4c2
	.xword	0xc769eaf29c01f6af
	.xword	0x0119c272aa990443
	.xword	0x4d25e09e45bcefb9
	.xword	0xd72603165285f98e
	.xword	0x5c1488a3cc7567c8
	.xword	0xe9795b80ddabc6d4
	.xword	0xb30d6f8413a22166
	.xword	0x9b1a0381b5a5ddb6
	.xword	0x796cf8f6a04fa41a
	.xword	0x3cf0f26472b5763b
	.xword	0xbddcd4f95ac9d82b
	.xword	0x266ca4d4519fde9b
	.xword	0x4d07723f4ee1d99a
	.xword	0x3f4135ac81df59c4
	.xword	0x92da8e8d8af3501d
	.xword	0xecf893b2ed67cda3
	.xword	0x9a370a18cee28c6c
	.xword	0xee89704ee911bee9
	.xword	0x2f7a73a556c2e562
	.xword	0x8c4c0fb9e7d06ea0
	.xword	0xadced6c7c2fec3d4
	.xword	0xaf22db40214c40a0
	.xword	0x810f7d1682c8bcb3
	.xword	0x3806aa82dd682b4c
	.xword	0xbcc11a0c230eebdd
	.xword	0x2c8e10b20b40044e
	.xword	0x23d8bcd64f2af056
	.xword	0xfc699fa09e64425b
	.xword	0x3e1abd44c9a0c675
	.xword	0xabe8e04f4afd2913
	.xword	0x6646b5501848680f
	.xword	0xc2d82e05f33dbe4a
	.xword	0x602c9e859e9e3f54
	.xword	0x19b4ebf6c1278876
	.xword	0x13ea19bb95b3f92f
	.xword	0xc93be41b29b66def
	.xword	0x6cb772b7e478e693
	.xword	0x013ce5f5225189e9
	.xword	0x3f7ebf3e6853130a
	.xword	0xbb865ab22ba29670
	.xword	0xd39445f0ac4064cd
	.xword	0x170a1a8663134e2f
	.xword	0x3b470d907c4c1913
	.xword	0x1f0ee849551bd9a4
	.xword	0xd3466f08cc0e049d
	.xword	0x8c49f5ff0a992c89
	.xword	0x852db08009173e4d
	.xword	0x4ee6b1b5b9275932
	.xword	0xd325cc3a2950116e
	.xword	0x85fc1502135e26e5
	.xword	0x11a9ae654d671741
	.xword	0xe8c248b560cd82e2
	.xword	0x5dfbe35822b9032c
	.xword	0x09640d53dd7232a2
	.xword	0x718c095a40624e50
	.xword	0x8725f44308de7ec6
	.xword	0xa01c86e4882ba834
	.xword	0xedd45ac6b32377c5
	.xword	0xdad9906551d6d098
	.xword	0xd12a160db500c4d4
	.xword	0xaa2811c05fa4d5c6
	.xword	0xeae2290be4f42f8f
	.xword	0x2dc91e61c761650b
	.xword	0x83f3425902d98d76
	.xword	0xa0dd61cfd5f2d781
	.xword	0x03c8596e7ad93c4b
	.xword	0x724fcca5cf6ecb96
	.xword	0xc870acd54b59eab8
	.xword	0x7271744f2325e3fa
	.xword	0xa86c5fe3ede0177f
	.xword	0x72d644a9555d885c
	.xword	0xb81a827bcc2a0bc1
	.xword	0x558a1cbdefde8633
	.xword	0x5e537f4ba197534d
	.xword	0x40a3d81caa3aa8f2
	.xword	0x2d2c287108035aab
	.xword	0xbe6014f68862b942
	.xword	0xe07e5411a09c784b
	.xword	0x51b9cf58dabb4fe8
	.xword	0x24eee19ddd1da392
	.xword	0x410926bee9ff3262
	.xword	0x3201114689bd7f60
	.xword	0xfa26c3d5a80e42e8
	.xword	0xec850cab8b60d7c3
	.xword	0x908872cf46bd02d1
	.xword	0x0b81a66fcb79f786
	.xword	0xe9392f8d75a23e8d
	.xword	0x2fe57b24836c7c9d
	.xword	0x45570a2c9c2c906f
	.xword	0xcbf5eafb4a07b690
	.xword	0x1d671ee0b38a0aaa
	.xword	0x0dab38ecc1f081ce
	.xword	0x82f96f7637cbff0f
	.xword	0xfd6337b5333d1284
	.xword	0x67d8b3d599e80abb
	.xword	0x1792d4032185f864
	.xword	0x3f758abfc06d130d
	.xword	0x75eb9f913964cd73
	.xword	0xd856881c04f8dbe2
	.xword	0xe7bec580844e8f19
	.xword	0x3e74e9e497df46a5
	.xword	0x4858287b560b14b9
	.xword	0x2b89687ed0683825
	.xword	0x1e084d7d029ed7f3
	.xword	0xf3ccb1a84df82dd6
	.xword	0x35c472b8e763306c
	.xword	0x00d429f67d5e92c1
	.xword	0x522f24e306f71080
	.xword	0xe52797627da543fe
	.xword	0x7cfb3f67f75d5989
	.xword	0x3b58061dc14f60d2
	.xword	0x18ac3b316f34bd6c
	.xword	0xbdba581b52000c9f
	.xword	0x437acad4d821d40f
	.xword	0x15edb4861ec2a625
	.xword	0xb570e3abf498a0ed
	.xword	0x7c6b3e4ec5bdae0d
	.xword	0x5b8ebc5985546616
	.xword	0xc5ad06a8fa20d565
	.xword	0x7a00d906869271a8
	.xword	0x74873f89f1a6cc3b
	.xword	0xc142b8610d0602cf
	.xword	0x1382ea0fc4738154
	.xword	0x3612ac299ff8c7a0
	.xword	0x32b4e709027f039b
	.xword	0xef402a256a7a0a56
	.xword	0xefdd474ef9be2c14
	.xword	0xfe3555e2107168bf
	.xword	0x0d5893a647f2085c
	.xword	0x035fe7696b19b5c7
	.xword	0xa75437f7a58d287b
	.xword	0xfbd24b032235abf7
	.xword	0xb10ac0b54d918d32
	.xword	0x09711b4e40b85e50
	.xword	0x369de4b031bf774d
	.xword	0x5588fbbc35bec21e
	.xword	0xb006cb30304caf64
	.xword	0xaa43148df1409425
	.xword	0x0252c964ead2e92b
	.xword	0x612b3d7e37aaacae
	.xword	0x0ba5b9be9c0cfe29
	.xword	0xa978dc06c99b13d8
	.xword	0xb06c451678d9947e
	.xword	0xd1ae6770a2fdc560
	.xword	0x4f4a4394f6d90f45
	.xword	0xfc3afd2b118c8b16
	.xword	0xe5d9bb6ce029c623
	.xword	0x0135abd526cd9d2c
	.xword	0x361da144c7000b45
	.xword	0x41846b8ff55f1158
	.xword	0xe30f66ccaf4a920f
	.xword	0x0c3cf2af08f8e133
	.xword	0xeeceaab4a8e7c589
	.xword	0x2ba998280bb56bbb
	.xword	0x28d7a2b5d84e8578
	.xword	0xb8850da223d4d7d9
	.xword	0x2f8ddd67a7291b4a
	.xword	0x062cbfb6f88f2fb6
	.xword	0x9bed12b2ce934963
	.xword	0xf464f19e3ff8bb9f
	.xword	0x87f03a6a2f04287f
	.xword	0xe0c207e7ec8c167f
	.xword	0xd6d5cf27e1b4779a
	.xword	0xf1ccc968281728e3
	.xword	0x7a0e6fbd0c656a34
	.xword	0x2ffaed6d588918ea
	.xword	0x99100dab3cacdecc
	.xword	0xda2ab35da13ca043
	.xword	0xfe1e245ae143be22
	.align 0x20000
	.data
data_start_5:

	.xword	0xdc14b75e1236b65e
	.xword	0x495a8d584749034f
	.xword	0xcc29a8e222b69e59
	.xword	0xd34594236035e125
	.xword	0x917f109781eea85c
	.xword	0x5fef165b132eafdf
	.xword	0xdb3924dc1616ca94
	.xword	0x675f2fccdbd7e0ca
	.xword	0x49bbbde89ba75a4e
	.xword	0x21a5ad537372dd19
	.xword	0x64ff841f50a2a406
	.xword	0xb07bb04ad9ffa40f
	.xword	0x475b2788b18cfc57
	.xword	0xb9b19ab7a3a947e1
	.xword	0xa1022bb54142efb1
	.xword	0xfc91807fe3121089
	.xword	0xa5401b7484dccd1c
	.xword	0xb96d7ca58994da7e
	.xword	0x17325bf7e11162fe
	.xword	0x158d24450da6f416
	.xword	0x85ebdd0666ab452f
	.xword	0xae0bbbbc0e39748e
	.xword	0x7ddf8acff6391afc
	.xword	0x54d13c07a25d5c4e
	.xword	0x567fdad647d2fa18
	.xword	0xd5a053c874b94423
	.xword	0x4a8990aaab90fd4f
	.xword	0x6bbecfb261a6d23b
	.xword	0xf152c360c9f0be3d
	.xword	0xf72d23ce7018391c
	.xword	0xb2a9a9348785e2e4
	.xword	0x3f94237712d776ae
	.xword	0x174b62f85ce9d993
	.xword	0x359bffb51bb7ac18
	.xword	0x27d38254d373f5c6
	.xword	0x5c45c68d5936c90c
	.xword	0xbb30c44d47637565
	.xword	0x912ca4d587e08d8b
	.xword	0xefad7413c8982f00
	.xword	0xe75a9b68076bd510
	.xword	0xaec79f5bc3de968f
	.xword	0xcd26774be1fb3c2a
	.xword	0xa8f4681039fac9b1
	.xword	0x08b83d8298d9b39d
	.xword	0x29fe827b28435a67
	.xword	0xd9e57bf97daa3215
	.xword	0x6ea791723c7f7b51
	.xword	0x526ed4be3f72a839
	.xword	0xdac7be236a0b723b
	.xword	0x14cd4dc8e9144681
	.xword	0x652e17873ee6d396
	.xword	0xa0c81ed16a022511
	.xword	0x54fccdbd21db29d9
	.xword	0x7644cbd62beb6f0c
	.xword	0x359255f455332f32
	.xword	0xad500124f22763e3
	.xword	0xbfcca571d5b23730
	.xword	0x9d2ff8bfe9b22136
	.xword	0x25fafccaad50b3db
	.xword	0x27bc9220abbac95e
	.xword	0x40a49c384c4bcfc0
	.xword	0xebbefa243ec770d4
	.xword	0x81b81508c6447d1b
	.xword	0x7925f3f5c163c972
	.xword	0x1832ef912fd7d0d7
	.xword	0x529fed8ae9590c62
	.xword	0x8eb7828d7d812d38
	.xword	0xc2b8c4cbb5caf972
	.xword	0xe2463ddaf94992c6
	.xword	0x8a0ed15e96d50bf4
	.xword	0x7fadc5580c9a133f
	.xword	0xace54f5746347c7e
	.xword	0x35b672d46d2a19d1
	.xword	0xcacd035d0299820d
	.xword	0x98b65b7169bdcd70
	.xword	0x56690fc2ae9b7cdd
	.xword	0xf25bba7f9e227137
	.xword	0x63bdeaa19dc4e9ec
	.xword	0xacb243e07f777be3
	.xword	0xcb6748ac29c7f77a
	.xword	0x6d574f7e22f78525
	.xword	0x5b9fbd4e80498444
	.xword	0x79f571810c779bdc
	.xword	0x0c29e210586de384
	.xword	0x55b19b425f3ead52
	.xword	0xfc0719f820aef42d
	.xword	0x28edc2d6ca7e646e
	.xword	0xfdba28a824b7d9bb
	.xword	0x6d8178e6018fa5df
	.xword	0x96f6963538f6dc8a
	.xword	0x844d5ec5041e0d08
	.xword	0x88456a913f034488
	.xword	0x2d86187c43a77ee4
	.xword	0x2c0bf5e4d757f39c
	.xword	0x02bb810120a996ec
	.xword	0x45cb2b5ddf56f092
	.xword	0xe5e20bae8a1c9b91
	.xword	0xba32d004e31df455
	.xword	0x1f64ca00556f1111
	.xword	0x100af60f3d360ede
	.xword	0xa305da0f84fb12a4
	.xword	0xc1edfacfe0052b66
	.xword	0xa4730ac025e25dd6
	.xword	0x84328b45df3aa934
	.xword	0x2502695465cc29de
	.xword	0xe5669529bed9f22d
	.xword	0x9e436471927c0bd4
	.xword	0xc4e9a040807e8f1b
	.xword	0xd22eb1f2a9abb719
	.xword	0x35d8e857a2d3625f
	.xword	0x04d24acc13cd474c
	.xword	0x48aea6e3bf66415a
	.xword	0xe57a570df1c7a969
	.xword	0x22d12d12a423d677
	.xword	0xe02c39c09ffb13fb
	.xword	0x3e551f96a361fb31
	.xword	0xb187cc668e347f5b
	.xword	0x3b6ed4a1f5eaa2a8
	.xword	0xd339d9d09886e295
	.xword	0xaf37465601ae510b
	.xword	0x5e5a115a7fb1015f
	.xword	0xd3a653c1adb34228
	.xword	0x39ca06668e2ef270
	.xword	0x8e3031cb786d7fc8
	.xword	0x2eb566351781420a
	.xword	0xe7ef50275ce09c41
	.xword	0x112960d90a4b7b19
	.xword	0x5414d266a4dc1329
	.xword	0xa6fd056934d39d5f
	.xword	0xbd92b71bb39b3419
	.xword	0xb4dfe43191965cd5
	.xword	0x89c7836da7f636d4
	.xword	0xf14e322f89eacee3
	.xword	0x3929e55c63320be0
	.xword	0xed99f5cca7831b2f
	.xword	0x2b964b37116472dd
	.xword	0x3b3c8071dff4cb39
	.xword	0xc708e746b159f546
	.xword	0x188e317e47965fa1
	.xword	0x1c19389b403d1144
	.xword	0xace63c0d2a1d6860
	.xword	0x557e1f28b1b6ee9f
	.xword	0x6169ed06c739ca37
	.xword	0x6dad99fb2252217a
	.xword	0x8d717f0147658bfb
	.xword	0xafecd2d0d24f4bb9
	.xword	0x9129943a80b06df8
	.xword	0xceda51e5abda565a
	.xword	0xf68982889228f374
	.xword	0xd760ef07a3e50323
	.xword	0x458b853a3b40cbdf
	.xword	0x5a0c56dc4ae6da84
	.xword	0xda84e8e2c309608b
	.xword	0x47dd37ecb64731dd
	.xword	0x5f6fe776ab798a94
	.xword	0x6b9ea584597aa8d9
	.xword	0x6ac51180a7cb95d9
	.xword	0x2268d30299e06f8c
	.xword	0xa56e186490b7fdc6
	.xword	0xbad438c1027f4994
	.xword	0x081644c404337b9a
	.xword	0x9a0f4802e58d9bfd
	.xword	0xd83296041b90f848
	.xword	0xae93f37d6d8ce95a
	.xword	0x6fefcec4d4e20771
	.xword	0x04e0d5634eac6a25
	.xword	0xf4dd7dbc0de32e53
	.xword	0x96b84e8bd595d66e
	.xword	0x6c6c3c4ec764580a
	.xword	0x8f6bc65310ec501d
	.xword	0x1f8a6445b70bad71
	.xword	0xf1874d6613823a87
	.xword	0x5ce0e349947fff9c
	.xword	0x9faeaa521056db72
	.xword	0x43ec8638162c4ba0
	.xword	0x3adc3d5bf0145237
	.xword	0x9f9562c7581e37aa
	.xword	0xda76823e0f5a2a27
	.xword	0x3490676404182003
	.xword	0x9a6f9c45821df1a1
	.xword	0xfdb8a1bff8d1687f
	.xword	0x5f79560a33fa85dc
	.xword	0xcea2bbb0ec16be2c
	.xword	0x2e97b65eee77cdd7
	.xword	0x6b59e57ad3fe58f8
	.xword	0x8506628a36b9c998
	.xword	0x33be6624639d76a2
	.xword	0x29f9c8c8ab61f1ae
	.xword	0x365baf8d5ccc9be3
	.xword	0x37e54418db7e1b0f
	.xword	0xebca268262b4c8fa
	.xword	0x34e58d9407f6ac0d
	.xword	0x12d6ae4f1d8a0403
	.xword	0x294d5b8c1eb08596
	.xword	0x29e3aebe77ae17f5
	.xword	0x0c3d38e21789adb0
	.xword	0x41732ce4a274eb2c
	.xword	0x6db4364a09997878
	.xword	0xf048152302430672
	.xword	0xf53a5bb2f0ef4f8a
	.xword	0xa4b1d8d5e07ee7ec
	.xword	0x5d1d5c01b20f1f6a
	.xword	0xb2a324db39343997
	.xword	0x4a894a5a343a2f8b
	.xword	0x18807cfe3bb791b9
	.xword	0x7f23e1da176199e4
	.xword	0xf2befd88a454342f
	.xword	0xbcb7070ccc63e4fb
	.xword	0x1abe69462e10754f
	.xword	0xa436a9b40fc7641e
	.xword	0x3688e29bd0e9ee43
	.xword	0x3cacbf9707902748
	.xword	0x7d125a3e30eed1d4
	.xword	0xf18415a4fa81da9d
	.xword	0xb6fa6b312b3cc396
	.xword	0xd09ae375da82e597
	.xword	0xc5fcc75d6aafa807
	.xword	0xcb78c5ae135630c0
	.xword	0xd09b4d568f9cb443
	.xword	0x27db6ba79ece3dd3
	.xword	0xba32e92ffd2ea0c0
	.xword	0x170e3fba02023e5e
	.xword	0x7e205a30a9fa15ed
	.xword	0x1236e887b37a2540
	.xword	0xcd9f4c3b8fe2f262
	.xword	0x580a1082c5093a39
	.xword	0xb990fd8ee81371e5
	.xword	0xaeccec62efc4d347
	.xword	0xbedb89fc5cc11892
	.xword	0x493749c5589382a3
	.xword	0x39871a82dceb4236
	.xword	0x3ade7edccd7766a0
	.xword	0xd51e4e90dd9c94b9
	.xword	0xa84e61b8abe32d8a
	.xword	0x9822d05217145261
	.xword	0x52e67823d3ea9ed3
	.xword	0xf5b0ac7f5f496fca
	.xword	0x490e2a7c0adfc1d9
	.xword	0x03a757dcc3738856
	.xword	0xa4baf83fb871c9fd
	.xword	0xdfc9916af45d03d9
	.xword	0xe0d55c4c4a04960a
	.xword	0x3aed4db73454a5b9
	.xword	0xcdc121329d4192df
	.xword	0xaba8f6e0c9590935
	.xword	0xfcd18e68bdd03c4d
	.xword	0xb8e57886d0bf4189
	.xword	0x87c48e62e19c22c0
	.xword	0x738dc194649747bb
	.xword	0xf23dced4394448e1
	.xword	0x68322d89e835e4a2
	.xword	0x06ba72abba7e2e93
	.xword	0xdc0bd9f35df2a925
	.xword	0xe024692a3cc94b52
	.xword	0x6190cdac8ef51ba3
	.xword	0x67456c5a6c16f46a
	.align 0x40000
	.data
data_start_6:

	.xword	0x0c7281d09b785ed3
	.xword	0x0628f61d9e401025
	.xword	0x9c8143d5d8090326
	.xword	0x53a0fba1e0275ae5
	.xword	0xf75e02cf08f5b355
	.xword	0x504bab854cb74227
	.xword	0x25907413d7bcef10
	.xword	0x1912f2a4cb7b42cc
	.xword	0x022b79df20305a4c
	.xword	0x1ed30ed5369c8efd
	.xword	0x9c7c905a4efe1af0
	.xword	0xc7af2e439f212739
	.xword	0x1cb847746e4df409
	.xword	0xc62af36f912f422e
	.xword	0xeeb56182ddae7b5d
	.xword	0x77ceeeae8c4f0654
	.xword	0x2a560b45ffd856f3
	.xword	0xdc6cdc5d1098801b
	.xword	0xbfaf6c12dc2028ac
	.xword	0xa5e92a9638bb867a
	.xword	0xf8e936b2b4d25feb
	.xword	0x24c71e097e3f0aee
	.xword	0xe348f919bb5d66cf
	.xword	0x0c7039784d7322e6
	.xword	0x0c44345d4e063da5
	.xword	0x7b4de7acc2946b73
	.xword	0xfe38f18b0b07ada1
	.xword	0x69ccff55bd59c06e
	.xword	0xbcdc5bf864322519
	.xword	0x741f7a539e9bec9c
	.xword	0x04ece32d31e768ce
	.xword	0xfa6706e0889059c8
	.xword	0xcd032782a9a3bf0e
	.xword	0x32f839b39954721e
	.xword	0x2d8ceb7d40bf471d
	.xword	0x145c1266fd549e14
	.xword	0x5edcef6bc0ddf0f2
	.xword	0xe7927aca94e23a32
	.xword	0x7cbdf3a22e43115b
	.xword	0xb198bd18ce1773dd
	.xword	0xfa48aad0ed1de5f2
	.xword	0xa519f7ca1ca2c585
	.xword	0xa99d029338c2966c
	.xword	0x0eb665881bd4fe99
	.xword	0x831723c6bf7d64b1
	.xword	0x654578f4c5aab1cf
	.xword	0xadfb158a73735cc8
	.xword	0xc12740c686ea9c5e
	.xword	0x7252d5a3f243f3e3
	.xword	0x46d53a8c14b2c0e4
	.xword	0x99ea745bbd37c3db
	.xword	0xc3b545b01a5fba45
	.xword	0x06655116ca092ae4
	.xword	0x1549d80cc9e2df3c
	.xword	0x72b4ebcfbbe24199
	.xword	0xccb0b693ca65d437
	.xword	0xc96eaf2909a53031
	.xword	0x38abace9215fc31a
	.xword	0x024c0f115661e001
	.xword	0x2a6031558366e992
	.xword	0x813c5a3ca8db4cb5
	.xword	0x3bdf722b6c1b01e9
	.xword	0xebc364d7c9dad394
	.xword	0xd597d7bdbf797c1d
	.xword	0xf37565a2814ef410
	.xword	0x77dff363ac5dceec
	.xword	0x1bbd654063027510
	.xword	0x04656eac2bb9e5d2
	.xword	0xb6f98b4bdb6a92a9
	.xword	0x3c389a47088c71d2
	.xword	0xfbf1513c898e4398
	.xword	0x6b0ebad9e6575ecc
	.xword	0x9eaa2ea691ca794b
	.xword	0x8fc1d01dcfdb2ef0
	.xword	0x5b9b7972b403e102
	.xword	0xa011849c5efae9b3
	.xword	0x15d405415ea27f9a
	.xword	0xe02bd6d6b293bc60
	.xword	0x41a80b11368321df
	.xword	0xc7b50f7262279bd3
	.xword	0x91a8b21d92fa1289
	.xword	0x281aa3e73db35ab4
	.xword	0x69cab0c9d8748882
	.xword	0xab1beab3d2e88c73
	.xword	0x4e64d880dfb36490
	.xword	0x1db269a3a6458f24
	.xword	0x8bdf7d06ee5d1e8f
	.xword	0x175c61e38484e7fd
	.xword	0xa9e7697a49b74678
	.xword	0x5ac718d67fd6cd4a
	.xword	0x696359e3eef45dc3
	.xword	0x127788e96c8c6d61
	.xword	0xad434d0367f2d2d4
	.xword	0x2cb89612d9c34105
	.xword	0xf68f0b7ae6f1bf2e
	.xword	0x6c5993ecc83048c0
	.xword	0xc318aa3ed7eca043
	.xword	0xa139a5f6c28c85e4
	.xword	0x20995d167f48a57d
	.xword	0x6e32c3edccac5142
	.xword	0xc3a627fa53cfcdee
	.xword	0x0c395a39174ac3f7
	.xword	0x6e8c1c3fab75896c
	.xword	0xfe03f98060284d88
	.xword	0xf4a3bf6a2ad4e905
	.xword	0x89401c4aabdc6723
	.xword	0x0dbef4dfa5313ffa
	.xword	0x1549167741e96144
	.xword	0x2ba3a5ad6fd81cbf
	.xword	0x1623bf0643202024
	.xword	0x491108da8400a2e9
	.xword	0x583da584adc57f87
	.xword	0x2fade7ea335179e7
	.xword	0x80f2dfa534af1c7f
	.xword	0xaa8debd7d322d35c
	.xword	0x318af23d451634e6
	.xword	0xc35f8f82dea8c31b
	.xword	0xa00e9eb9077298d6
	.xword	0x991d2db4ada5e5fd
	.xword	0xee338adc5773bf91
	.xword	0xdc045735c152132e
	.xword	0xdcb1efe454bbc384
	.xword	0xa5feceb42e03d4a5
	.xword	0xf3931a858ab04103
	.xword	0xde8f2106843f0075
	.xword	0xf3f8fc03e1bc0083
	.xword	0x42d081405d3bb43e
	.xword	0x7f384e5c579f12b8
	.xword	0x9bb52983a8d5f740
	.xword	0xbe8c9380d2af4300
	.xword	0x342b3ad396c8aff3
	.xword	0x5404e3e568601405
	.xword	0xc98753bbf5754c2e
	.xword	0xdf63cb0ed57c50a7
	.xword	0x7a957088f67109e0
	.xword	0xac27b0e7744b61b3
	.xword	0xd869dcac2a25cb0d
	.xword	0x8eb66669f77d968c
	.xword	0x5eee2dc7cda20d2d
	.xword	0x8b7f63dfc62f04f0
	.xword	0x9770c8c81ae97271
	.xword	0x47ec2abbba8bc897
	.xword	0x8b3cb707471269a5
	.xword	0xc065639e54647d63
	.xword	0xed0b63320fff0784
	.xword	0xb94f2f92129c2c97
	.xword	0x6f717ecd6989df32
	.xword	0x8298e5ad88012a56
	.xword	0x4d8055a7d6d3cf5a
	.xword	0x9fed2ea9c1c990d1
	.xword	0xa6c56ef07ca7cb1e
	.xword	0x4fb2880d86dcf9b5
	.xword	0x0dce2610f5cad480
	.xword	0xfd26038b501b8126
	.xword	0xb56667d3c533e464
	.xword	0xa01b7ba7ec5d775c
	.xword	0x0df804796e10efdd
	.xword	0x0410c3fe72454721
	.xword	0x7ffc9203d2cecafd
	.xword	0x1f3abe3e327536fd
	.xword	0x9bdecfe9f70ceeb3
	.xword	0xb8715adb02a21d45
	.xword	0xebba51a16cbccf14
	.xword	0x66cbee3d3ba723bb
	.xword	0xec8e5483562bb44a
	.xword	0x96b24aa1b4fd06fb
	.xword	0x66d5da824c4afc09
	.xword	0x7efe9a230bc3ccbc
	.xword	0xf97643b95b0b1f10
	.xword	0x581002ad1da2d759
	.xword	0x44b5733672afed1d
	.xword	0x9b5e70ff29358da0
	.xword	0x690c053cccc23671
	.xword	0x8a194e2def4ed815
	.xword	0x6a72ab023afcfbee
	.xword	0xc83bec5a64e2890c
	.xword	0xc25be8d8c72d17b6
	.xword	0x74394db1fdb23d93
	.xword	0xee67e52fc3dd09ad
	.xword	0x5d06f7bc9389f9d6
	.xword	0x88dc372e2c3c6853
	.xword	0x80b83ee2e7d38b69
	.xword	0x13e5ce63d4ec965c
	.xword	0x8f62d78a73ac2639
	.xword	0x8f03b2a291f87da0
	.xword	0x7b7fac02d35e489a
	.xword	0xe65194c4d8626fc4
	.xword	0x40e9619aa9e0c688
	.xword	0xf2bdef1b29fe5f11
	.xword	0xbe4fe8a038547e4d
	.xword	0x0be3ce104d36b337
	.xword	0xffbb4b456dcee968
	.xword	0x15adb42f1042083f
	.xword	0x7e0292b4ebcf0b63
	.xword	0x5e1b663e27b07a32
	.xword	0xd030d396d4162fd9
	.xword	0x7f7cb67cbccdad11
	.xword	0x2cbfd92ecf6865c2
	.xword	0xf072f5f995be4688
	.xword	0x3b874feefb9ea873
	.xword	0x4f59272d774a5ff1
	.xword	0xf494f2a1b4038239
	.xword	0x3c69c866c0441229
	.xword	0xb00e09c03942983a
	.xword	0x21078a16e01c44a7
	.xword	0x5edf6de30b0ace0e
	.xword	0xb7a38e27ce0b6ee2
	.xword	0x3450affabf9c6d88
	.xword	0x1758b044228746e1
	.xword	0xa5fc7b186d48351a
	.xword	0x034529205a89428f
	.xword	0xfd32b7d9d63c5c8e
	.xword	0xab97425a177232a8
	.xword	0x24e2c6226e8d17ec
	.xword	0x0a17edf287b8ec87
	.xword	0xe292f8326816b6be
	.xword	0xf200b6ff83232219
	.xword	0x5ca3ad8d55121407
	.xword	0x740ce93fe68bfeab
	.xword	0x1e266f424123aea8
	.xword	0x7e2d95ca5f898fee
	.xword	0xda92a469736a368a
	.xword	0x7f514575eeba0550
	.xword	0x371200eb3418f908
	.xword	0x1b198bdca3b2974b
	.xword	0x59f2fa10e5296a4a
	.xword	0xd11a8d3e4e8b140c
	.xword	0x793ea8b9206afb74
	.xword	0x6f12870d0d7cea93
	.xword	0x0bd4e5a59711bebb
	.xword	0x426283d2cd766e11
	.xword	0x0dba3e9f7000384b
	.xword	0xecab218deb73e649
	.xword	0x704aaf5d51094830
	.xword	0xed26c46711d82c8c
	.xword	0x3809e1bc99d4bfdd
	.xword	0x6aaa1edf44f3737a
	.xword	0xd6af8a72462188e0
	.xword	0x215b00b2f7cc8281
	.xword	0xc4ea7c83b5585caf
	.xword	0x2d23661da0f70325
	.xword	0xf7649967ac46eaf4
	.xword	0x07ce229103c66c37
	.xword	0x4c022afcfa558476
	.xword	0xb9d58b7b5d030eba
	.xword	0x98577f9b94794af6
	.xword	0xa57d54e5fe3208f9
	.xword	0xf74e16798fcbf8a3
	.xword	0x56928de1fcb77bfa
	.xword	0x940065c50329891c
	.xword	0x8570bb9ac16a033f
	.xword	0x077145e0dd48507b
	.xword	0xd868683695116742
	.xword	0xfd32630feb46752a
	.xword	0x60878d2b31bdf5b7
	.xword	0x336a4f3f77ee403f
	.align 0x80000
	.data
data_start_7:

	.xword	0x1be1efa0e7a22e0a
	.xword	0x4d07a70280354007
	.xword	0x6451865407c9a942
	.xword	0x6915dc7166e92d53
	.xword	0xa12091ce70c2df32
	.xword	0x9b3a77e79740a6bc
	.xword	0xf992d6451d1a1d41
	.xword	0x540640f94e7fbbff
	.xword	0x6b289fcb16b7131b
	.xword	0xb984e6d3d86fd510
	.xword	0xc2c2ff54ac8d7682
	.xword	0x2a0bf484fcb3152e
	.xword	0x7fdc99ae3b3296e8
	.xword	0x42a3eaedf0c32564
	.xword	0xe7e6b64700b69621
	.xword	0x91d9bd395802a54f
	.xword	0x4830291abaa277bc
	.xword	0x894591b95254d442
	.xword	0x602907de859170d2
	.xword	0xc9d06d576f956d2d
	.xword	0xa1ac1c45e357c11a
	.xword	0xb56aed57ba631ea3
	.xword	0x964169e6b8dbb0e9
	.xword	0x8cc7f3c6ff63f215
	.xword	0x70ead81ebbaf4d79
	.xword	0xa45f78657c3fa3dd
	.xword	0x56ffb5ec5a1de1fa
	.xword	0xde45450e35788d4a
	.xword	0xa6eb9297d4cfdd23
	.xword	0x078e3f1007b33848
	.xword	0x4467e9a09bd23cea
	.xword	0x02efce8bced37fc0
	.xword	0x6bf91bd3d433d24b
	.xword	0x60d27304c1295d84
	.xword	0x385e80bad514a122
	.xword	0xf7a3545a0c7d981b
	.xword	0xcb8c8c860f7b1cc4
	.xword	0x92f6aca9d8cbc365
	.xword	0xe9cc36719cdb4aba
	.xword	0x7d65cca97ae43c80
	.xword	0x0d8de5285d07867a
	.xword	0x15ecd52df6b2abca
	.xword	0xafc1d1f01ea26cd3
	.xword	0x0437f479c0db4fad
	.xword	0x82cfa090fcd7b537
	.xword	0xb27097ce4a3499cb
	.xword	0xa0a5875d403f0a28
	.xword	0x86bd3d0c6de787f4
	.xword	0x09a5d20d35f144d3
	.xword	0x7d106ab049665496
	.xword	0x5abdbee353826201
	.xword	0x621dab2c2ddda438
	.xword	0x527d8d5e5d104161
	.xword	0x5c898445b9ba5a9f
	.xword	0xc67eac60f76f983d
	.xword	0xc9a20b7608dbc75d
	.xword	0x2dc1232d190c76ca
	.xword	0x25a8ffb2b551ae81
	.xword	0x7fc3377ffeeb1a60
	.xword	0xcfcdfab45264c3b3
	.xword	0x5253c208a619a177
	.xword	0xa84769326c744987
	.xword	0xf3f9f1fcaaa834db
	.xword	0x1a853f7f0394a8c9
	.xword	0x7775e219c3c01c9d
	.xword	0x226c76213e2b3865
	.xword	0xa4771471c4169f1e
	.xword	0xfd4cfc3263387602
	.xword	0x1247deed1fc8f25f
	.xword	0xb3fad9c1a04175de
	.xword	0x4f0303a50d050d8d
	.xword	0x56f1dc46425733d0
	.xword	0xd184efdc591cf7fa
	.xword	0xfaf240bfa5f5d7e9
	.xword	0xfeeb0dbb2d231d1f
	.xword	0xb3e218ea7855edea
	.xword	0x95dbd9353cf3d709
	.xword	0x3ee141c4476639fc
	.xword	0x1a9e1c10b043948c
	.xword	0x46e30fa82639d837
	.xword	0x65f35f547f7f54e8
	.xword	0x672e04f0ce5ae95a
	.xword	0xeb0620728f1b98d9
	.xword	0xc7425d5c48710bcf
	.xword	0xf0edd3098a1764bc
	.xword	0x08b4cabef628ddd1
	.xword	0x26caab5420399004
	.xword	0x65758d3a7c595d1a
	.xword	0x53ba4c39799466d0
	.xword	0x3167b501b769f130
	.xword	0xeea1e8d77ade12ce
	.xword	0x1cdc6578a9ed996e
	.xword	0xcd2a1f392adfa772
	.xword	0x23eb0e6837a99034
	.xword	0x4139baacfeae1abc
	.xword	0xca56e9115046c83e
	.xword	0xac55c2c5d967b97e
	.xword	0xbe465e722327b04a
	.xword	0x39280ceaf5889271
	.xword	0xe9780089b9334e03
	.xword	0x5685e714438b20f8
	.xword	0x4d95af47894cbeac
	.xword	0xfcf281bd064506a9
	.xword	0xb0c14f580b079fbd
	.xword	0xff9225c2a32ba135
	.xword	0x5ee9fb6f2eecb373
	.xword	0x2ab659f59c971c58
	.xword	0xdd63bee72d26f37b
	.xword	0x8cfc044fc79065a5
	.xword	0xff54dd7f89a8ea8f
	.xword	0x95ab16a85d7c4d42
	.xword	0x20e2d0beea083038
	.xword	0xcc5e0e375f6f781e
	.xword	0xbd60230e50c9f647
	.xword	0x3ea805819f7aa53c
	.xword	0x1f3188a6b26210af
	.xword	0x9c51fc2add537315
	.xword	0x2cae8937b1a1edac
	.xword	0xf0c00ae31573a86a
	.xword	0x8bc08d5335b4e381
	.xword	0x6b8d63c583d0efa8
	.xword	0x2e39770467a46f5c
	.xword	0x4db53336d3468913
	.xword	0x3b7d8f9ecfaaa334
	.xword	0x7550e5cede5befcb
	.xword	0xa0c7c470f731804a
	.xword	0x9fee0ac361d5443b
	.xword	0xa77faf6406ca6263
	.xword	0xabe15e5c648074b0
	.xword	0x302ac918902a9de8
	.xword	0x473d55e3f87f1a27
	.xword	0xb7f67a4b6b4a5cd9
	.xword	0xfaecb712fbef64a9
	.xword	0xe65367e6d63b9872
	.xword	0x202144b0f080f9f8
	.xword	0x35f94d3d6146f16c
	.xword	0x81aa3233664e11e3
	.xword	0x3702847b9ae39450
	.xword	0x48d229aa8276c87d
	.xword	0x580df202e0fae320
	.xword	0xe0f7dc055e6b98d8
	.xword	0xd354d7c824329eb9
	.xword	0xad7a90ec29489654
	.xword	0x0ad795f570c6e694
	.xword	0xec99ad0486042727
	.xword	0xd1800b87994295f8
	.xword	0xfafcb0cac80ce0f5
	.xword	0xf7d7f3816914f25a
	.xword	0xb0a994f7db32440c
	.xword	0x5e004829e03bc685
	.xword	0x01b32fd9840c1fcb
	.xword	0x9887d18ee66d5864
	.xword	0xc7e50f5d23062c09
	.xword	0xdefa52857232cdb8
	.xword	0x828a25d933e7e214
	.xword	0xe3fb637cc258f637
	.xword	0x6eee31e3179236fa
	.xword	0x9ddc19ff07eb5bb0
	.xword	0xc6a1657e9b832929
	.xword	0x1a477f92dee85e19
	.xword	0x64855cc95164e32b
	.xword	0x2b70a2abcad31058
	.xword	0x46fb3a735798b357
	.xword	0xbe6e594d8ccbc419
	.xword	0x570974eb16ad8e9d
	.xword	0xcd7c2ef32cc5ac84
	.xword	0x9abc5219db1a70c9
	.xword	0x9509a4ba1de25b8f
	.xword	0x5d1e155f2bffbab3
	.xword	0xf5dd39aef4f25c16
	.xword	0x39f2e32f8e00e572
	.xword	0xbd03040150e3ee02
	.xword	0xef60d187ce8e605d
	.xword	0x8fbd0050d91ce2cf
	.xword	0x3d7c87074fd2b727
	.xword	0x8162266c5d0812b7
	.xword	0x332830e3f9d8f400
	.xword	0x156cec2c93fadfae
	.xword	0x8d31b881d7dbf0b8
	.xword	0x89d94ece99ecdcaf
	.xword	0xe37d5b9b79e1c11c
	.xword	0xa11bccc9cb9ee2c0
	.xword	0xf6f68c43eb626371
	.xword	0xc8092db4a2eda0d5
	.xword	0x3d48556167ff8e27
	.xword	0x2c1fead7a2e9d227
	.xword	0x0aed3a89145ea733
	.xword	0xc04dc5bf2a656839
	.xword	0xaba727c41847b8df
	.xword	0xe1d888b563eaa618
	.xword	0x79032fbd42f8efb5
	.xword	0xe8a6bc505db6413a
	.xword	0xf25feea370e65f5d
	.xword	0x597c5e772af930a9
	.xword	0xdb7c278b3bc94664
	.xword	0xc9ab84e40d12f688
	.xword	0x455aaa743d78bd84
	.xword	0xa8f8a350a66ea6dc
	.xword	0xe7a6e2462a505d9b
	.xword	0xc4ee3856f0287597
	.xword	0xb48552beb99be9de
	.xword	0xe2495d88e602c27c
	.xword	0xdfbd128c6675ad93
	.xword	0x2cd0d152bc35527d
	.xword	0xaaf6af948a5c5fe7
	.xword	0x5ab911cfd35b72e9
	.xword	0x3a5f480b1c2d3e36
	.xword	0xef6bdbe6910bb2a6
	.xword	0xa75033be35d65a97
	.xword	0x3ca4b6272ccd9866
	.xword	0x8f590f350560498f
	.xword	0x953001b36fb9e16b
	.xword	0x5d7353b0521e2f23
	.xword	0xe3801149a77097bd
	.xword	0xfe78409cb4e68418
	.xword	0x7eb501ae94a185ec
	.xword	0x656daf06c22bcec5
	.xword	0xb4f9b6bacc2cfb0e
	.xword	0x993ed384120725ce
	.xword	0xdc45f4c2d71717d9
	.xword	0x47f8f0f4ee864b9f
	.xword	0xe702a92ba19b093a
	.xword	0x3668064795059a4c
	.xword	0x83c7bf74db765273
	.xword	0xdd60161a112de7f3
	.xword	0xf453c6adb3794d22
	.xword	0x16b420b05ec0d04f
	.xword	0x7c193cc58ad25ace
	.xword	0xc7c31ad4941bcbe6
	.xword	0x4b15332c58fe6588
	.xword	0xd0bfcf53f586dc85
	.xword	0x583b3e522b05e1b2
	.xword	0x460c049336502b73
	.xword	0x55790859bb296479
	.xword	0xab7e42d6b1addfc1
	.xword	0x7c08b4830526e798
	.xword	0xe7c2941e3e7a2986
	.xword	0xe39570d0c29cf33d
	.xword	0x8eb85b405385ebdf
	.xword	0x99e8dc3237cc3130
	.xword	0xede87811de443450
	.xword	0x2347727837e94f70
	.xword	0x453ef4958fab1e98
	.xword	0x6b63562680523dbe
	.xword	0xbd1f7247782e2102
	.xword	0x193fbb66b231ef4c
	.xword	0xcbfe6e1e4fd3af67
	.xword	0xe32cc7781495b431
	.xword	0x3000082703fde132
	.xword	0x71037c4a3ee7a118
	.xword	0xe6181bd94d7fb988
	.xword	0xc97994d86f2a90c6
	.xword	0x9f8c6bcb40f40dde
	.xword	0xdedbf73549f627d8
	.xword	0x6fb0428b06a6185a
	.xword	0xd856ae23f06bf7c8



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
