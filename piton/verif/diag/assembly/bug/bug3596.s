// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3596.s
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
   random seed:	540802001
   Jal stb8.j:	
********************************************************************************/


#define MAIN_PAGE_HV_ALSO
#define NO_TRAPCHECK
#include "enable_traps.h"
#include "boot.s"

!SIMS: -non_shared
!SIMS: +spis

.text
.global main

main:

! Thread forked (0x2 0x4 0x8 )
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
	setx  0x5cfc87306734f32b, %r1, %r17
	setx  0x0ad983b0e4c5641a, %r1, %r18
	setx  0xa441c0cb61bad8ae, %r1, %r19
	setx  0xae4ad384f074b8ee, %r1, %r20
	setx  0x5e8541a171bf9110, %r1, %r21
	setx  0xbc18af0b25dfaead, %r1, %r22
	setx  0x96ca5b67b3b01e0e, %r1, %r23
	setx  0x328d5df955835203, %r1, %r24
	setx  0x64db28ae74b04d01, %r1, %r25
	setx  0x0098ce00d43a7f63, %r1, %r26
	setx  0x4f039e0105113c92, %r1, %r27
	setx  0x52e4b196c37c6f81, %r1, %r28
	setx  0xa718edb37f4def65, %r1, %r29
	setx  0x75668fbc64caf12a, %r1, %r30
	setx  0xb312cdd677f90585, %r1, %r31
	setx  0x0000000000000840, %r1, %r9
	setx  0x0000000000000fb0, %r1, %r10
	setx  0x0000000000000960, %r1, %r11
	setx  0x00000000000008c0, %r1, %r12
	setx  0x0000000000000160, %r1, %r13
	setx  0x0000000000000d30, %r1, %r14
	setx  0x0000000000000cd0, %r1, %r15
	setx MAIN_BASE_DATA_VA, %r1, %r3
	setx MAIN_BASE_DATA_VA, %r1, %r4
	setx MAIN_BASE_DATA_VA, %r1, %r5
	setx MAIN_BASE_DATA_VA, %r1, %r6
	setx MAIN_BASE_DATA_VA, %r1, %r7
	setx MAIN_BASE_DATA_VA, %r1, %r8
	setx  0x00000000000013ca, %r1, %r2
	wr %r0, 0x4, %fprs
	ldd	[%r4 + 0], %f0
	ldd	[%r4 + 8], %f2
	ldd	[%r4 + 16], %f4
	ldd	[%r4 + 24], %f6
	ldd	[%r4 + 32], %f8
	ldd	[%r4 + 40], %f10
	ldd	[%r4 + 48], %f12
	ldd	[%r4 + 56], %f14
	ldd	[%r4 + 64], %f16
	ldd	[%r4 + 72], %f18
	ldd	[%r4 + 80], %f20
	ldd	[%r4 + 88], %f22
	ldd	[%r4 + 96], %f24
	ldd	[%r4 + 104], %f26
	ldd	[%r4 + 112], %f28
	ldd	[%r4 + 120], %f30
	ldd	[%r4 + 128], %f32
	ldd	[%r4 + 136], %f34
	ldd	[%r4 + 144], %f36
	ldd	[%r4 + 152], %f38
	ldd	[%r4 + 160], %f40
	ldd	[%r4 + 168], %f42
	ldd	[%r4 + 176], %f44
	ldd	[%r4 + 184], %f46
	ldd	[%r4 + 192], %f48
	ldd	[%r4 + 200], %f50
	ldd	[%r4 + 208], %f52
	ldd	[%r4 + 216], %f54
	ldd	[%r4 + 224], %f56
	ldd	[%r4 + 232], %f58
	ldd	[%r4 + 240], %f60
	ldd	[%r4 + 248], %f62
	wr  %r0, 0x80, %asi
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_0:
	.word 0xb601c00c  ! 6: ADD_R	add 	%r7, %r12, %r27
	.word 0xa401000f  ! 6: ADD_R	add 	%r4, %r15, %r18
	.word 0xb809e8bb  ! 6: AND_I	and 	%r7, 0x08bb, %r28
	.word 0xbc00c00e  ! 6: ADD_R	add 	%r3, %r14, %r30
	.word 0xbe12222d  ! 6: OR_I	or 	%r8, 0x022d, %r31
	.word 0xa401ec50  ! 6: ADD_I	add 	%r7, 0x0c50, %r18
	.word 0xb611aad0  ! 6: OR_I	or 	%r6, 0x0ad0, %r27
	.word 0xba01e761  ! 6: ADD_I	add 	%r7, 0x0761, %r29
	.word 0xbe01000b  ! 6: ADD_R	add 	%r4, %r11, %r31
	.word 0xaa0966a7  ! 6: AND_I	and 	%r5, 0x06a7, %r21
	.word 0xb208c00f  ! 6: AND_R	and 	%r3, %r15, %r25
	.word 0xae01a70b  ! 6: ADD_I	add 	%r6, 0x070b, %r23
	.word 0xb600e47c  ! 6: ADD_I	add 	%r3, 0x047c, %r27
	.word 0xac0120e6  ! 6: ADD_I	add 	%r4, 0x00e6, %r22
	.word 0xa4022e3a  ! 6: ADD_I	add 	%r8, 0x0e3a, %r18
	.word 0xae01eb9f  ! 6: ADD_I	add 	%r7, 0x0b9f, %r23
	.word 0xb2012c93  ! 6: ADD_I	add 	%r4, 0x0c93, %r25
	.word 0xbc00e6cc  ! 6: ADD_I	add 	%r3, 0x06cc, %r30
	.word 0xb810c00f  ! 6: OR_R	or 	%r3, %r15, %r28
	.word 0xba01800c  ! 6: ADD_R	add 	%r6, %r12, %r29
	.word 0xa211000e  ! 6: OR_R	or 	%r4, %r14, %r17
	.word 0xbc02000b  ! 6: ADD_R	add 	%r8, %r11, %r30
	.word 0xb600c00c  ! 6: ADD_R	add 	%r3, %r12, %r27
	.word 0xb009a627  ! 6: AND_I	and 	%r6, 0x0627, %r24
	.word 0xb401400f  ! 6: ADD_R	add 	%r5, %r15, %r26
	.word 0xa412000d  ! 6: OR_R	or 	%r8, %r13, %r18
	.word 0xba09000f  ! 6: AND_R	and 	%r4, %r15, %r29
	.word 0xa8122300  ! 6: OR_I	or 	%r8, 0x0300, %r20
	.word 0xb6014009  ! 6: ADD_R	add 	%r5, %r9, %r27
	.word 0xa4016da2  ! 6: ADD_I	add 	%r5, 0x0da2, %r18
	.word 0xa808e431  ! 6: AND_I	and 	%r3, 0x0431, %r20
	.word 0xb400ef25  ! 6: ADD_I	add 	%r3, 0x0f25, %r26
	.word 0xba01800e  ! 6: ADD_R	add 	%r6, %r14, %r29
	.word 0xb601abc5  ! 6: ADD_I	add 	%r6, 0x0bc5, %r27
	.word 0xb6098009  ! 6: AND_R	and 	%r6, %r9, %r27
	.word 0xa201400f  ! 6: ADD_R	add 	%r5, %r15, %r17
	.word 0xa401aa1f  ! 6: ADD_I	add 	%r6, 0x0a1f, %r18
	.word 0xa611000d  ! 6: OR_R	or 	%r4, %r13, %r19
	.word 0xa411000e  ! 6: OR_R	or 	%r4, %r14, %r18
	.word 0xb6116ac3  ! 6: OR_I	or 	%r5, 0x0ac3, %r27
	.word 0xb601c00c  ! 6: ADD_R	add 	%r7, %r12, %r27
	.word 0xbe02000a  ! 6: ADD_R	add 	%r8, %r10, %r31
	.word 0xb810e60d  ! 6: OR_I	or 	%r3, 0x060d, %r28
	.word 0xa601c00b  ! 6: ADD_R	add 	%r7, %r11, %r19
	.word 0xa209c00a  ! 6: AND_R	and 	%r7, %r10, %r17
	.word 0xaa11a668  ! 6: OR_I	or 	%r6, 0x0668, %r21
	.word 0xa209aa57  ! 6: AND_I	and 	%r6, 0x0a57, %r17
	.word 0xa81164dc  ! 6: OR_I	or 	%r5, 0x04dc, %r20
	.word 0xbc01c00d  ! 6: ADD_R	add 	%r7, %r13, %r30
	.word 0xb4112b6e  ! 6: OR_I	or 	%r4, 0x0b6e, %r26
	.word 0xb409c00b  ! 6: AND_R	and 	%r7, %r11, %r26
	.word 0xbc01a41f  ! 6: ADD_I	add 	%r6, 0x041f, %r30
	.word 0xb001800c  ! 6: ADD_R	add 	%r6, %r12, %r24
	.word 0xb2096686  ! 6: AND_I	and 	%r5, 0x0686, %r25
	.word 0xac01a76f  ! 6: ADD_I	add 	%r6, 0x076f, %r22
	.word 0xa611000d  ! 6: OR_R	or 	%r4, %r13, %r19
	.word 0xa209ee71  ! 6: AND_I	and 	%r7, 0x0e71, %r17
	.word 0xaa0a000a  ! 6: AND_R	and 	%r8, %r10, %r21
	.word 0xb211800e  ! 6: OR_R	or 	%r6, %r14, %r25
	.word 0xa801400e  ! 6: ADD_R	add 	%r5, %r14, %r20
	.word 0xa2118009  ! 6: OR_R	or 	%r6, %r9, %r17
	.word 0xb21121b9  ! 6: OR_I	or 	%r4, 0x01b9, %r25
	.word 0xb400c00e  ! 6: ADD_R	add 	%r3, %r14, %r26
	.word 0xb41122b5  ! 6: OR_I	or 	%r4, 0x02b5, %r26
	.word 0xb001e649  ! 6: ADD_I	add 	%r7, 0x0649, %r24
	.word 0xba11400b  ! 6: OR_R	or 	%r5, %r11, %r29
	.word 0xb011e8e7  ! 6: OR_I	or 	%r7, 0x08e7, %r24
	.word 0xba09e1a3  ! 6: AND_I	and 	%r7, 0x01a3, %r29
	.word 0xb80223cc  ! 6: ADD_I	add 	%r8, 0x03cc, %r28
	.word 0xa611a129  ! 6: OR_I	or 	%r6, 0x0129, %r19
	.word 0xba01000a  ! 6: ADD_R	add 	%r4, %r10, %r29
	.word 0xb611800b  ! 6: OR_R	or 	%r6, %r11, %r27
	.word 0xac01800f  ! 6: ADD_R	add 	%r6, %r15, %r22
	.word 0xba09400b  ! 6: AND_R	and 	%r5, %r11, %r29
	.word 0xb612000a  ! 6: OR_R	or 	%r8, %r10, %r27
	.word 0xb6094009  ! 6: AND_R	and 	%r5, %r9, %r27
	.word 0xb401000d  ! 6: ADD_R	add 	%r4, %r13, %r26
	.word 0xa8118009  ! 6: OR_R	or 	%r6, %r9, %r20
	.word 0xb6018009  ! 6: ADD_R	add 	%r6, %r9, %r27
	.word 0xa8022f2f  ! 6: ADD_I	add 	%r8, 0x0f2f, %r20
	.word 0xac01800b  ! 6: ADD_R	add 	%r6, %r11, %r22
	.word 0xaa10c00d  ! 6: OR_R	or 	%r3, %r13, %r21
	.word 0xa60a0009  ! 6: AND_R	and 	%r8, %r9, %r19
	.word 0xb611800e  ! 6: OR_R	or 	%r6, %r14, %r27
	.word 0xbc09a081  ! 6: AND_I	and 	%r6, 0x0081, %r30
	.word 0xac09400e  ! 6: AND_R	and 	%r5, %r14, %r22
	.word 0xae01ef1a  ! 6: ADD_I	add 	%r7, 0x0f1a, %r23
	.word 0xa80a2f71  ! 6: AND_I	and 	%r8, 0x0f71, %r20
	.word 0xae09c00d  ! 6: AND_R	and 	%r7, %r13, %r23
	.word 0xb812000c  ! 6: OR_R	or 	%r8, %r12, %r28
	.word 0xa409c00a  ! 6: AND_R	and 	%r7, %r10, %r18
	.word 0xbe08c00a  ! 6: AND_R	and 	%r3, %r10, %r31
	.word 0xbe09a36e  ! 6: AND_I	and 	%r6, 0x036e, %r31
	.word 0xba022348  ! 6: ADD_I	add 	%r8, 0x0348, %r29
	.word 0xae12000f  ! 6: OR_R	or 	%r8, %r15, %r23
	.word 0xbc092e8a  ! 6: AND_I	and 	%r4, 0x0e8a, %r30
	.word 0xba01e138  ! 6: ADD_I	add 	%r7, 0x0138, %r29
	.word 0xaa1122cd  ! 6: OR_I	or 	%r4, 0x02cd, %r21
	.word 0xb811000e  ! 6: OR_R	or 	%r4, %r14, %r28
	.word 0xa201e08e  ! 6: ADD_I	add 	%r7, 0x008e, %r17
	.word 0xbe00e88a  ! 6: ADD_I	add 	%r3, 0x088a, %r31
	.word 0xbe01c00b  ! 6: ADD_R	add 	%r7, %r11, %r31
	.word 0xaa11a6b2  ! 6: OR_I	or 	%r6, 0x06b2, %r21
	.word 0xb608c00e  ! 6: AND_R	and 	%r3, %r14, %r27
	.word 0xa60a000a  ! 6: AND_R	and 	%r8, %r10, %r19
	.word 0xaa016067  ! 6: ADD_I	add 	%r5, 0x0067, %r21
	.word 0xa600e63a  ! 6: ADD_I	add 	%r3, 0x063a, %r19
	.word 0xaa01800b  ! 6: ADD_R	add 	%r6, %r11, %r21
	.word 0xa200e940  ! 6: ADD_I	add 	%r3, 0x0940, %r17
	.word 0xa201400a  ! 6: ADD_R	add 	%r5, %r10, %r17
	.word 0xa6090009  ! 6: AND_R	and 	%r4, %r9, %r19
	.word 0xa400e282  ! 6: ADD_I	add 	%r3, 0x0282, %r18
	.word 0xbc01400b  ! 6: ADD_R	add 	%r5, %r11, %r30
	.word 0xb611c00a  ! 6: OR_R	or 	%r7, %r10, %r27
	.word 0xb201a3df  ! 6: ADD_I	add 	%r6, 0x03df, %r25
	.word 0xa6090009  ! 6: AND_R	and 	%r4, %r9, %r19
	.word 0xb208ecc3  ! 6: AND_I	and 	%r3, 0x0cc3, %r25
	.word 0xaa092acc  ! 6: AND_I	and 	%r4, 0x0acc, %r21
	.word 0xb001000a  ! 6: ADD_R	add 	%r4, %r10, %r24
	.word 0xb611400c  ! 6: OR_R	or 	%r5, %r12, %r27
	.word 0xb611800b  ! 6: OR_R	or 	%r6, %r11, %r27
	.word 0xbe08c00d  ! 6: AND_R	and 	%r3, %r13, %r31
	.word 0xa2116764  ! 6: OR_I	or 	%r5, 0x0764, %r17
	.word 0xbc01800c  ! 6: ADD_R	add 	%r6, %r12, %r30
	.word 0xb6092b5d  ! 6: AND_I	and 	%r4, 0x0b5d, %r27
	.word 0xac096095  ! 6: AND_I	and 	%r5, 0x0095, %r22
	.word 0xac00c00d  ! 6: ADD_R	add 	%r3, %r13, %r22
	.word 0xb80161e4  ! 6: ADD_I	add 	%r5, 0x01e4, %r28
	.word 0xb608c00c  ! 6: AND_R	and 	%r3, %r12, %r27
	.word 0xb001c009  ! 6: ADD_R	add 	%r7, %r9, %r24
	.word 0xaa0a000a  ! 6: AND_R	and 	%r8, %r10, %r21
	.word 0xb012280a  ! 6: OR_I	or 	%r8, 0x080a, %r24
	.word 0xb001e5dc  ! 6: ADD_I	add 	%r7, 0x05dc, %r24
	.word 0xbc01a7ba  ! 6: ADD_I	add 	%r6, 0x07ba, %r30
	.word 0xbc11000f  ! 6: OR_R	or 	%r4, %r15, %r30
	.word 0xa811400f  ! 6: OR_R	or 	%r5, %r15, %r20
	.word 0xb609ef66  ! 6: AND_I	and 	%r7, 0x0f66, %r27
	.word 0xb210ec49  ! 6: OR_I	or 	%r3, 0x0c49, %r25
	.word 0xb811286f  ! 6: OR_I	or 	%r4, 0x086f, %r28
	.word 0xa209c00a  ! 6: AND_R	and 	%r7, %r10, %r17
	.word 0xbc00e146  ! 6: ADD_I	add 	%r3, 0x0146, %r30
	.word 0xb811e4d5  ! 6: OR_I	or 	%r7, 0x04d5, %r28
	.word 0xac0a000e  ! 6: AND_R	and 	%r8, %r14, %r22
	.word 0xb0012342  ! 6: ADD_I	add 	%r4, 0x0342, %r24
	.word 0xae0a000d  ! 6: AND_R	and 	%r8, %r13, %r23
	.word 0xaa11298b  ! 6: OR_I	or 	%r4, 0x098b, %r21
	.word 0xa210c00b  ! 6: OR_R	or 	%r3, %r11, %r17
	.word 0xb611c00b  ! 6: OR_R	or 	%r7, %r11, %r27
	.word 0xb6012df6  ! 6: ADD_I	add 	%r4, 0x0df6, %r27
	.word 0xbe10c00d  ! 6: OR_R	or 	%r3, %r13, %r31
	.word 0xa8016f8b  ! 6: ADD_I	add 	%r5, 0x0f8b, %r20
	.word 0xb001400f  ! 6: ADD_R	add 	%r5, %r15, %r24
	.word 0xb21120be  ! 6: OR_I	or 	%r4, 0x00be, %r25
	.word 0xb2116a4d  ! 6: OR_I	or 	%r5, 0x0a4d, %r25
	.word 0xbc12000b  ! 6: OR_R	or 	%r8, %r11, %r30
	.word 0xac11400a  ! 6: OR_R	or 	%r5, %r10, %r22
	.word 0xa409800b  ! 6: AND_R	and 	%r6, %r11, %r18
	.word 0xba092c4f  ! 6: AND_I	and 	%r4, 0x0c4f, %r29
	.word 0xbc122bef  ! 6: OR_I	or 	%r8, 0x0bef, %r30
	.word 0xa809400d  ! 6: AND_R	and 	%r5, %r13, %r20
	.word 0xbc1160de  ! 6: OR_I	or 	%r5, 0x00de, %r30
	.word 0xa609e46d  ! 6: AND_I	and 	%r7, 0x046d, %r19
	.word 0xb811c00c  ! 6: OR_R	or 	%r7, %r12, %r28
	.word 0xbc11ae1c  ! 6: OR_I	or 	%r6, 0x0e1c, %r30
	.word 0xa209000b  ! 6: AND_R	and 	%r4, %r11, %r17
	.word 0xa80a000d  ! 6: AND_R	and 	%r8, %r13, %r20
	.word 0xae116ad4  ! 6: OR_I	or 	%r5, 0x0ad4, %r23
	.word 0xaa11000d  ! 6: OR_R	or 	%r4, %r13, %r21
	.word 0xa412000f  ! 6: OR_R	or 	%r8, %r15, %r18
	.word 0xbc08c00a  ! 6: AND_R	and 	%r3, %r10, %r30
	.word 0xac11000c  ! 6: OR_R	or 	%r4, %r12, %r22
	.word 0xaa09400d  ! 6: AND_R	and 	%r5, %r13, %r21
	.word 0xb212000e  ! 6: OR_R	or 	%r8, %r14, %r25
	.word 0xb8016629  ! 6: ADD_I	add 	%r5, 0x0629, %r28
	.word 0xba116669  ! 6: OR_I	or 	%r5, 0x0669, %r29
	.word 0xa211a3ec  ! 6: OR_I	or 	%r6, 0x03ec, %r17
	.word 0xb211a853  ! 6: OR_I	or 	%r6, 0x0853, %r25
	.word 0xbc11c009  ! 6: OR_R	or 	%r7, %r9, %r30
	.word 0xb4122fea  ! 6: OR_I	or 	%r8, 0x0fea, %r26
	.word 0xb809000a  ! 6: AND_R	and 	%r4, %r10, %r28
	.word 0xaa08c00d  ! 6: AND_R	and 	%r3, %r13, %r21
	.word 0xa601400c  ! 6: ADD_R	add 	%r5, %r12, %r19
	.word 0xa211800b  ! 6: OR_R	or 	%r6, %r11, %r17
	.word 0xb409af98  ! 6: AND_I	and 	%r6, 0x0f98, %r26
	.word 0xa211000b  ! 6: OR_R	or 	%r4, %r11, %r17
	.word 0xb211800d  ! 6: OR_R	or 	%r6, %r13, %r25
	.word 0xa81129c5  ! 6: OR_I	or 	%r4, 0x09c5, %r20
	.word 0xaa08c00f  ! 6: AND_R	and 	%r3, %r15, %r21
	.word 0xb009c00b  ! 6: AND_R	and 	%r7, %r11, %r24
	.word 0xa801e23e  ! 6: ADD_I	add 	%r7, 0x023e, %r20
	.word 0xa609800b  ! 6: AND_R	and 	%r6, %r11, %r19
	.word 0xb001c00d  ! 6: ADD_R	add 	%r7, %r13, %r24
	.word 0xa811c00d  ! 6: OR_R	or 	%r7, %r13, %r20
	.word 0xae01ee3d  ! 6: ADD_I	add 	%r7, 0x0e3d, %r23
	.word 0xb409c00a  ! 6: AND_R	and 	%r7, %r10, %r26
	.word 0xae09000d  ! 6: AND_R	and 	%r4, %r13, %r23
	.word 0xba01c00c  ! 6: ADD_R	add 	%r7, %r12, %r29
	.word 0xaa00c00c  ! 6: ADD_R	add 	%r3, %r12, %r21
	.word 0xb20160ec  ! 6: ADD_I	add 	%r5, 0x00ec, %r25
	.word 0xac11a0d1  ! 6: OR_I	or 	%r6, 0x00d1, %r22
	.word 0xa609c00b  ! 6: AND_R	and 	%r7, %r11, %r19
	.word 0xba01400d  ! 6: ADD_R	add 	%r5, %r13, %r29
	.word 0xb208c00e  ! 6: AND_R	and 	%r3, %r14, %r25
	.word 0xaa09000c  ! 6: AND_R	and 	%r4, %r12, %r21
	.word 0xb011c00f  ! 6: OR_R	or 	%r7, %r15, %r24
	.word 0xa409a3a5  ! 6: AND_I	and 	%r6, 0x03a5, %r18
	.word 0xb411800f  ! 6: OR_R	or 	%r6, %r15, %r26
	.word 0xe8212fc8  ! 6: STW_I	stw	%r20, [%r4 + 0x0fc8]
	.word 0xf831a9ac  ! 6: STH_I	sth	%r28, [%r6 + 0x09ac]
	.word 0xe870e598  ! 6: STX_I	stx	%r20, [%r3 + 0x0598]
	.word 0xfa71e640  ! 6: STX_I	stx	%r29, [%r7 + 0x0640]
	.word 0xf6296e91  ! 6: STB_I	stb	%r27, [%r5 + 0x0e91]
	.word 0xfe21e8b0  ! 7: STW_I	stw	%r31, [%r7 + 0x08b0]
	.word 0xae010045
	.word 0xea29e272  ! 9: STB_I	stb	%r21, [%r7 + 0x0272]
	.word 0xf228e3b0  ! 10: STB_I	stb	%r25, [%r3 + 0x03b0]
IC_ERR_0:
!$EV error(0,expr(@VA(.MAIN.IC_ERR_0), 16, 16),1,IC_DATA,IR,1,x)
	setx  0x0000000000000500, %r16, %r14
	setx  0x0000000000003727, %r16, %r2
	.word 0xac01400f  ! 12: ADD_R	add 	%r5, %r15, %r22
	.word 0xae096ef4  ! 12: AND_I	and 	%r5, 0x0ef4, %r23
	.word 0xb601800b  ! 12: ADD_R	add 	%r6, %r11, %r27
	bne thr0_loop_0
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_1:
	.word 0xa41168b2  ! 20: OR_I	or 	%r5, 0x08b2, %r18
	.word 0xa401e8c1  ! 20: ADD_I	add 	%r7, 0x08c1, %r18
	.word 0xae0a000c  ! 20: AND_R	and 	%r8, %r12, %r23
	.word 0xae01ec01  ! 20: ADD_I	add 	%r7, 0x0c01, %r23
	.word 0xac01000e  ! 20: ADD_R	add 	%r4, %r14, %r22
	.word 0xa40223fc  ! 20: ADD_I	add 	%r8, 0x03fc, %r18
	.word 0xae11a566  ! 20: OR_I	or 	%r6, 0x0566, %r23
	.word 0xb001c00b  ! 20: ADD_R	add 	%r7, %r11, %r24
	.word 0xa601afcb  ! 20: ADD_I	add 	%r6, 0x0fcb, %r19
	.word 0xac09000f  ! 20: AND_R	and 	%r4, %r15, %r22
	.word 0xa602000e  ! 20: ADD_R	add 	%r8, %r14, %r19
	.word 0xb811c00b  ! 20: OR_R	or 	%r7, %r11, %r28
	.word 0xb4122ef2  ! 20: OR_I	or 	%r8, 0x0ef2, %r26
	.word 0xb811c00a  ! 20: OR_R	or 	%r7, %r10, %r28
	.word 0xac122a5c  ! 20: OR_I	or 	%r8, 0x0a5c, %r22
	.word 0xb210e8e9  ! 20: OR_I	or 	%r3, 0x08e9, %r25
	.word 0xae096ab4  ! 20: AND_I	and 	%r5, 0x0ab4, %r23
	.word 0xa808e2f7  ! 20: AND_I	and 	%r3, 0x02f7, %r20
	.word 0xb800ea8d  ! 20: ADD_I	add 	%r3, 0x0a8d, %r28
	.word 0xa611a2bb  ! 20: OR_I	or 	%r6, 0x02bb, %r19
	.word 0xba0920ec  ! 20: AND_I	and 	%r4, 0x00ec, %r29
	.word 0xba0a000f  ! 20: AND_R	and 	%r8, %r15, %r29
	.word 0xaa11aa0e  ! 20: OR_I	or 	%r6, 0x0a0e, %r21
	.word 0xb211c00c  ! 20: OR_R	or 	%r7, %r12, %r25
	.word 0xaa012e34  ! 20: ADD_I	add 	%r4, 0x0e34, %r21
	.word 0xb801800d  ! 20: ADD_R	add 	%r6, %r13, %r28
	.word 0xb001400f  ! 20: ADD_R	add 	%r5, %r15, %r24
	.word 0xba092b35  ! 20: AND_I	and 	%r4, 0x0b35, %r29
	.word 0xb801228f  ! 20: ADD_I	add 	%r4, 0x028f, %r28
	.word 0xb8022a33  ! 20: ADD_I	add 	%r8, 0x0a33, %r28
	.word 0xb401800c  ! 20: ADD_R	add 	%r6, %r12, %r26
	.word 0xbc11a9b8  ! 20: OR_I	or 	%r6, 0x09b8, %r30
	.word 0xb801c00c  ! 20: ADD_R	add 	%r7, %r12, %r28
	.word 0xa601a792  ! 20: ADD_I	add 	%r6, 0x0792, %r19
	.word 0xae01c00d  ! 20: ADD_R	add 	%r7, %r13, %r23
	.word 0xae09a101  ! 20: AND_I	and 	%r6, 0x0101, %r23
	.word 0xb801ebf1  ! 20: ADD_I	add 	%r7, 0x0bf1, %r28
	.word 0xb40a000d  ! 20: AND_R	and 	%r8, %r13, %r26
	.word 0xac09c009  ! 20: AND_R	and 	%r7, %r9, %r22
	.word 0xb611a39f  ! 20: OR_I	or 	%r6, 0x039f, %r27
	.word 0xb8112c2a  ! 20: OR_I	or 	%r4, 0x0c2a, %r28
	.word 0xba00e77c  ! 20: ADD_I	add 	%r3, 0x077c, %r29
	.word 0xb011800f  ! 20: OR_R	or 	%r6, %r15, %r24
	.word 0xa801400b  ! 20: ADD_R	add 	%r5, %r11, %r20
	.word 0xb009400f  ! 20: AND_R	and 	%r5, %r15, %r24
	.word 0xae12000e  ! 20: OR_R	or 	%r8, %r14, %r23
	.word 0xa802242a  ! 20: ADD_I	add 	%r8, 0x042a, %r20
	.word 0xb001400e  ! 20: ADD_R	add 	%r5, %r14, %r24
	.word 0xa211800e  ! 20: OR_R	or 	%r6, %r14, %r17
	.word 0xa201c00b  ! 20: ADD_R	add 	%r7, %r11, %r17
	.word 0xa811c00f  ! 20: OR_R	or 	%r7, %r15, %r20
	.word 0xbc01e0d9  ! 20: ADD_I	add 	%r7, 0x00d9, %r30
	.word 0xa611a5d3  ! 20: OR_I	or 	%r6, 0x05d3, %r19
	.word 0xac09000b  ! 20: AND_R	and 	%r4, %r11, %r22
	.word 0xbc0a2821  ! 20: AND_I	and 	%r8, 0x0821, %r30
	.word 0xae09e8e9  ! 20: AND_I	and 	%r7, 0x08e9, %r23
	.word 0xbe01ee79  ! 20: ADD_I	add 	%r7, 0x0e79, %r31
	.word 0xaa01c00f  ! 20: ADD_R	add 	%r7, %r15, %r21
	.word 0xb209000d  ! 20: AND_R	and 	%r4, %r13, %r25
	.word 0xac09a25a  ! 20: AND_I	and 	%r6, 0x025a, %r22
	.word 0xae08c00b  ! 20: AND_R	and 	%r3, %r11, %r23
	.word 0xb6122005  ! 20: OR_I	or 	%r8, 0x0005, %r27
	.word 0xb408e9c4  ! 20: AND_I	and 	%r3, 0x09c4, %r26
	.word 0xbc01400e  ! 20: ADD_R	add 	%r5, %r14, %r30
	.word 0xb611800a  ! 20: OR_R	or 	%r6, %r10, %r27
	.word 0xa600e7a0  ! 20: ADD_I	add 	%r3, 0x07a0, %r19
	.word 0xb401e34c  ! 20: ADD_I	add 	%r7, 0x034c, %r26
	.word 0xb209e358  ! 20: AND_I	and 	%r7, 0x0358, %r25
	.word 0xb408e633  ! 20: AND_I	and 	%r3, 0x0633, %r26
	.word 0xbc09800d  ! 20: AND_R	and 	%r6, %r13, %r30
	.word 0xb200c00c  ! 20: ADD_R	add 	%r3, %r12, %r25
	.word 0xae09000f  ! 20: AND_R	and 	%r4, %r15, %r23
	.word 0xaa09e901  ! 20: AND_I	and 	%r7, 0x0901, %r21
	.word 0xa81166d3  ! 20: OR_I	or 	%r5, 0x06d3, %r20
	.word 0xa401a0ca  ! 20: ADD_I	add 	%r6, 0x00ca, %r18
	.word 0xb809c00c  ! 20: AND_R	and 	%r7, %r12, %r28
	.word 0xb810e7d1  ! 20: OR_I	or 	%r3, 0x07d1, %r28
	.word 0xa611eef9  ! 20: OR_I	or 	%r7, 0x0ef9, %r19
	.word 0xb611c00f  ! 20: OR_R	or 	%r7, %r15, %r27
	.word 0xac08e6df  ! 20: AND_I	and 	%r3, 0x06df, %r22
	.word 0xb811800d  ! 20: OR_R	or 	%r6, %r13, %r28
	.word 0xac11645f  ! 20: OR_I	or 	%r5, 0x045f, %r22
	.word 0xb6022073  ! 20: ADD_I	add 	%r8, 0x0073, %r27
	.word 0xb601c00b  ! 20: ADD_R	add 	%r7, %r11, %r27
	.word 0xa2116dee  ! 20: OR_I	or 	%r5, 0x0dee, %r17
	.word 0xba0a2a71  ! 20: AND_I	and 	%r8, 0x0a71, %r29
	.word 0xb40a000d  ! 20: AND_R	and 	%r8, %r13, %r26
	.word 0xe82a21c2  ! 20: STB_I	stb	%r20, [%r8 + 0x01c2]
	.word 0xfc70ed38  ! 20: STX_I	stx	%r30, [%r3 + 0x0d38]
	.word 0xe231252e  ! 20: STH_I	sth	%r17, [%r4 + 0x052e]
	.word 0xec71a270  ! 20: STX_I	stx	%r22, [%r6 + 0x0270]
	.word 0xe271ea90  ! 20: STX_I	stx	%r17, [%r7 + 0x0a90]
	.word 0xe6722910  ! 20: STX_I	stx	%r19, [%r8 + 0x0910]
	.word 0xe2222838  ! 20: STW_I	stw	%r17, [%r8 + 0x0838]
DC_ERR_0:
!$EV error(0,expr(@VA(.MAIN.DC_ERR_0), 16, 16),1,DC_DATA,59)
	.word 0xf01961f0  ! 23: LDD_I	ldd	[%r5 + 0x01f0], %r24
	.word 0xa401400f  ! 23: ADD_R	add 	%r5, %r15, %r18
	.word 0xc0f00962  ! 25: STXA_R	stxa	%r0, [%r0 + %r2] 0x4b
IC_ERR_4:
!$EV error(0,expr(@VA(.MAIN.IC_ERR_4), 16, 16),1,IC_DATA,IR,4,x)
	.word 0xea41800b  ! 27: LDSW_R	ldsw	[%r6 + %r11], %r21
	.word 0xa601af75  ! 27: ADD_I	add 	%r6, 0x0f75, %r19
	.word 0xaa08efa8  ! 27: AND_I	and 	%r3, 0x0fa8, %r21
	.word 0xbc02000c  ! 27: ADD_R	add 	%r8, %r12, %r30
	bne thr0_loop_1
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_2:
	.word 0xb411a85d  ! 33: OR_I	or 	%r6, 0x085d, %r26
	.word 0xb010e6d3  ! 33: OR_I	or 	%r3, 0x06d3, %r24
	.word 0xb609000e  ! 33: AND_R	and 	%r4, %r14, %r27
	.word 0xbe11e153  ! 33: OR_I	or 	%r7, 0x0153, %r31
	.word 0xaa08c00e  ! 33: AND_R	and 	%r3, %r14, %r21
	.word 0xb401000e  ! 33: ADD_R	add 	%r4, %r14, %r26
	.word 0xae122e7b  ! 33: OR_I	or 	%r8, 0x0e7b, %r23
	.word 0xb009e283  ! 33: AND_I	and 	%r7, 0x0283, %r24
	.word 0xb210c00d  ! 33: OR_R	or 	%r3, %r13, %r25
	.word 0xb009000f  ! 33: AND_R	and 	%r4, %r15, %r24
	.word 0xac09e277  ! 33: AND_I	and 	%r7, 0x0277, %r22
	.word 0xa211800a  ! 33: OR_R	or 	%r6, %r10, %r17
	.word 0xb010e0c0  ! 33: OR_I	or 	%r3, 0x00c0, %r24
	.word 0xbe01400f  ! 33: ADD_R	add 	%r5, %r15, %r31
	.word 0xb002000c  ! 33: ADD_R	add 	%r8, %r12, %r24
	.word 0xa811a60f  ! 33: OR_I	or 	%r6, 0x060f, %r20
	.word 0xb20a2dd7  ! 33: AND_I	and 	%r8, 0x0dd7, %r25
	.word 0xb210c00a  ! 33: OR_R	or 	%r3, %r10, %r25
	.word 0xbc0120a3  ! 33: ADD_I	add 	%r4, 0x00a3, %r30
	.word 0xb609400d  ! 33: AND_R	and 	%r5, %r13, %r27
	.word 0xbc08c009  ! 33: AND_R	and 	%r3, %r9, %r30
	.word 0xb811a0b2  ! 33: OR_I	or 	%r6, 0x00b2, %r28
	.word 0xaa092fd2  ! 33: AND_I	and 	%r4, 0x0fd2, %r21
	.word 0xbc01c00c  ! 33: ADD_R	add 	%r7, %r12, %r30
	.word 0xa2110009  ! 33: OR_R	or 	%r4, %r9, %r17
	.word 0xa612205a  ! 33: OR_I	or 	%r8, 0x005a, %r19
	.word 0xae09400e  ! 33: AND_R	and 	%r5, %r14, %r23
	.word 0xbe09400e  ! 33: AND_R	and 	%r5, %r14, %r31
	.word 0xba00eba1  ! 33: ADD_I	add 	%r3, 0x0ba1, %r29
	.word 0xb011800a  ! 33: OR_R	or 	%r6, %r10, %r24
	.word 0xa609e874  ! 33: AND_I	and 	%r7, 0x0874, %r19
	.word 0xb208c00e  ! 33: AND_R	and 	%r3, %r14, %r25
	.word 0xbe01e306  ! 33: ADD_I	add 	%r7, 0x0306, %r31
	.word 0xa60a2765  ! 33: AND_I	and 	%r8, 0x0765, %r19
	.word 0xa6116dd9  ! 33: OR_I	or 	%r5, 0x0dd9, %r19
	.word 0xa808c009  ! 33: AND_R	and 	%r3, %r9, %r20
	.word 0xa211ed30  ! 33: OR_I	or 	%r7, 0x0d30, %r17
	.word 0xbe09800d  ! 33: AND_R	and 	%r6, %r13, %r31
	.word 0xba016023  ! 33: ADD_I	add 	%r5, 0x0023, %r29
	.word 0xb010c00b  ! 33: OR_R	or 	%r3, %r11, %r24
	.word 0xb011e6e1  ! 33: OR_I	or 	%r7, 0x06e1, %r24
	.word 0xa209e0b3  ! 33: AND_I	and 	%r7, 0x00b3, %r17
	.word 0xaa11800a  ! 33: OR_R	or 	%r6, %r10, %r21
	.word 0xae11af7a  ! 33: OR_I	or 	%r6, 0x0f7a, %r23
	.word 0xb4096e99  ! 33: AND_I	and 	%r5, 0x0e99, %r26
	.word 0xbe09a33a  ! 33: AND_I	and 	%r6, 0x033a, %r31
	.word 0xaa00e11f  ! 33: ADD_I	add 	%r3, 0x011f, %r21
	.word 0xa808e360  ! 33: AND_I	and 	%r3, 0x0360, %r20
	.word 0xbc094009  ! 33: AND_R	and 	%r5, %r9, %r30
	.word 0xae08eb77  ! 33: AND_I	and 	%r3, 0x0b77, %r23
	.word 0xa21223db  ! 33: OR_I	or 	%r8, 0x03db, %r17
	.word 0xb2112671  ! 33: OR_I	or 	%r4, 0x0671, %r25
	.word 0xa60a2cfa  ! 33: AND_I	and 	%r8, 0x0cfa, %r19
	.word 0xa809c00d  ! 33: AND_R	and 	%r7, %r13, %r20
	.word 0xaa09e9de  ! 33: AND_I	and 	%r7, 0x09de, %r21
	.word 0xb010c00d  ! 33: OR_R	or 	%r3, %r13, %r24
	.word 0xba096cb6  ! 33: AND_I	and 	%r5, 0x0cb6, %r29
	.word 0xb608c00b  ! 33: AND_R	and 	%r3, %r11, %r27
	.word 0xa600c00f  ! 33: ADD_R	add 	%r3, %r15, %r19
	.word 0xb209000b  ! 33: AND_R	and 	%r4, %r11, %r25
	.word 0xa2010009  ! 33: ADD_R	add 	%r4, %r9, %r17
	.word 0xbc01a6f5  ! 33: ADD_I	add 	%r6, 0x06f5, %r30
	.word 0xaa0a265a  ! 33: AND_I	and 	%r8, 0x065a, %r21
	.word 0xb001000f  ! 33: ADD_R	add 	%r4, %r15, %r24
	.word 0xb601af8a  ! 33: ADD_I	add 	%r6, 0x0f8a, %r27
	.word 0xa809a04d  ! 33: AND_I	and 	%r6, 0x004d, %r20
	.word 0xa209c00b  ! 33: AND_R	and 	%r7, %r11, %r17
	.word 0xa801000b  ! 33: ADD_R	add 	%r4, %r11, %r20
	.word 0xa2116919  ! 33: OR_I	or 	%r5, 0x0919, %r17
	.word 0xa400e44a  ! 33: ADD_I	add 	%r3, 0x044a, %r18
	.word 0xbe0a000f  ! 33: AND_R	and 	%r8, %r15, %r31
	.word 0xa6116862  ! 33: OR_I	or 	%r5, 0x0862, %r19
	.word 0xb201400d  ! 33: ADD_R	add 	%r5, %r13, %r25
	.word 0xa600ec58  ! 33: ADD_I	add 	%r3, 0x0c58, %r19
	.word 0xa611c00c  ! 33: OR_R	or 	%r7, %r12, %r19
	.word 0xae01647f  ! 33: ADD_I	add 	%r5, 0x047f, %r23
	.word 0xae09800c  ! 33: AND_R	and 	%r6, %r12, %r23
	.word 0xa609c00a  ! 33: AND_R	and 	%r7, %r10, %r19
	.word 0xba09e5be  ! 33: AND_I	and 	%r7, 0x05be, %r29
	.word 0xb809400c  ! 33: AND_R	and 	%r5, %r12, %r28
	.word 0xb411c00d  ! 33: OR_R	or 	%r7, %r13, %r26
	.word 0xa20928c9  ! 33: AND_I	and 	%r4, 0x08c9, %r17
	.word 0xbe09a670  ! 33: AND_I	and 	%r6, 0x0670, %r31
	.word 0xa611682b  ! 33: OR_I	or 	%r5, 0x082b, %r19
	.word 0xac122dbc  ! 33: OR_I	or 	%r8, 0x0dbc, %r22
	.word 0xae09c009  ! 33: AND_R	and 	%r7, %r9, %r23
	.word 0xbe02000d  ! 33: ADD_R	add 	%r8, %r13, %r31
	.word 0xae09ae75  ! 33: AND_I	and 	%r6, 0x0e75, %r23
	.word 0xac11a6fe  ! 33: OR_I	or 	%r6, 0x06fe, %r22
	.word 0xa6116dca  ! 33: OR_I	or 	%r5, 0x0dca, %r19
	.word 0xb8122d30  ! 33: OR_I	or 	%r8, 0x0d30, %r28
	.word 0xa608e75f  ! 33: AND_I	and 	%r3, 0x075f, %r19
	.word 0xac01c00a  ! 33: ADD_R	add 	%r7, %r10, %r22
	.word 0xa80a29fe  ! 33: AND_I	and 	%r8, 0x09fe, %r20
	.word 0xae09400a  ! 33: AND_R	and 	%r5, %r10, %r23
	.word 0xbe09aa7a  ! 33: AND_I	and 	%r6, 0x0a7a, %r31
	.word 0xb0092094  ! 33: AND_I	and 	%r4, 0x0094, %r24
	.word 0xa8092658  ! 33: AND_I	and 	%r4, 0x0658, %r20
	.word 0xa808e92b  ! 33: AND_I	and 	%r3, 0x092b, %r20
	.word 0xae01400a  ! 33: ADD_R	add 	%r5, %r10, %r23
	.word 0xb801000c  ! 33: ADD_R	add 	%r4, %r12, %r28
	.word 0xb80a2cf2  ! 33: AND_I	and 	%r8, 0x0cf2, %r28
	.word 0xb201800d  ! 33: ADD_R	add 	%r6, %r13, %r25
	.word 0xaa01c00a  ! 33: ADD_R	add 	%r7, %r10, %r21
	.word 0xbe01ae06  ! 33: ADD_I	add 	%r6, 0x0e06, %r31
	.word 0xba0a000d  ! 33: AND_R	and 	%r8, %r13, %r29
	.word 0xa8094009  ! 33: AND_R	and 	%r5, %r9, %r20
	.word 0xaa090009  ! 33: AND_R	and 	%r4, %r9, %r21
	.word 0xaa01aa09  ! 33: ADD_I	add 	%r6, 0x0a09, %r21
	.word 0xb0118009  ! 33: OR_R	or 	%r6, %r9, %r24
	.word 0xac00c00f  ! 33: ADD_R	add 	%r3, %r15, %r22
	.word 0xb8016940  ! 33: ADD_I	add 	%r5, 0x0940, %r28
	.word 0xae12000f  ! 33: OR_R	or 	%r8, %r15, %r23
	.word 0xbc12000c  ! 33: OR_R	or 	%r8, %r12, %r30
	.word 0xa401800b  ! 33: ADD_R	add 	%r6, %r11, %r18
	.word 0xb6112b0b  ! 33: OR_I	or 	%r4, 0x0b0b, %r27
	.word 0xba11000b  ! 33: OR_R	or 	%r4, %r11, %r29
	.word 0xae11a46e  ! 33: OR_I	or 	%r6, 0x046e, %r23
	.word 0xaa11400f  ! 33: OR_R	or 	%r5, %r15, %r21
	.word 0xb810e6cf  ! 33: OR_I	or 	%r3, 0x06cf, %r28
	.word 0xbc12000a  ! 33: OR_R	or 	%r8, %r10, %r30
	.word 0xbe11a21a  ! 33: OR_I	or 	%r6, 0x021a, %r31
	.word 0xbe012367  ! 33: ADD_I	add 	%r4, 0x0367, %r31
	.word 0xb002000d  ! 33: ADD_R	add 	%r8, %r13, %r24
	.word 0xbc01c00f  ! 33: ADD_R	add 	%r7, %r15, %r30
	.word 0xb209afd3  ! 33: AND_I	and 	%r6, 0x0fd3, %r25
	.word 0xb411a1a4  ! 33: OR_I	or 	%r6, 0x01a4, %r26
	.word 0xa809e97c  ! 33: AND_I	and 	%r7, 0x097c, %r20
	.word 0xae09400d  ! 33: AND_R	and 	%r5, %r13, %r23
	.word 0xae09800c  ! 33: AND_R	and 	%r6, %r12, %r23
	.word 0xac11ea8c  ! 33: OR_I	or 	%r7, 0x0a8c, %r22
	.word 0xb211a5e0  ! 33: OR_I	or 	%r6, 0x05e0, %r25
	.word 0xb801c00d  ! 33: ADD_R	add 	%r7, %r13, %r28
	.word 0xaa098009  ! 33: AND_R	and 	%r6, %r9, %r21
	.word 0xb6116ae5  ! 33: OR_I	or 	%r5, 0x0ae5, %r27
	.word 0xbe01c00f  ! 33: ADD_R	add 	%r7, %r15, %r31
	.word 0xbe092995  ! 33: AND_I	and 	%r4, 0x0995, %r31
	.word 0xb210c00e  ! 33: OR_R	or 	%r3, %r14, %r25
	.word 0xaa10e590  ! 33: OR_I	or 	%r3, 0x0590, %r21
	.word 0xa601abe7  ! 33: ADD_I	add 	%r6, 0x0be7, %r19
	.word 0xbc092a4b  ! 33: AND_I	and 	%r4, 0x0a4b, %r30
	.word 0xbe016220  ! 33: ADD_I	add 	%r5, 0x0220, %r31
	.word 0xb401c00d  ! 33: ADD_R	add 	%r7, %r13, %r26
	.word 0xb009800a  ! 33: AND_R	and 	%r6, %r10, %r24
	.word 0xbe09e45e  ! 33: AND_I	and 	%r7, 0x045e, %r31
	.word 0xaa11400f  ! 33: OR_R	or 	%r5, %r15, %r21
	.word 0xb609800c  ! 33: AND_R	and 	%r6, %r12, %r27
	.word 0xb601a3e9  ! 33: ADD_I	add 	%r6, 0x03e9, %r27
	.word 0xba01800b  ! 33: ADD_R	add 	%r6, %r11, %r29
	.word 0xb009800a  ! 33: AND_R	and 	%r6, %r10, %r24
	.word 0xa611800e  ! 33: OR_R	or 	%r6, %r14, %r19
	.word 0xb009800f  ! 33: AND_R	and 	%r6, %r15, %r24
	.word 0xb0022d93  ! 33: ADD_I	add 	%r8, 0x0d93, %r24
	.word 0xac00c009  ! 33: ADD_R	add 	%r3, %r9, %r22
	.word 0xb809400c  ! 33: AND_R	and 	%r5, %r12, %r28
	.word 0xa201e64c  ! 33: ADD_I	add 	%r7, 0x064c, %r17
	.word 0xa411000d  ! 33: OR_R	or 	%r4, %r13, %r18
	.word 0xa201c00f  ! 33: ADD_R	add 	%r7, %r15, %r17
	.word 0xa412263a  ! 33: OR_I	or 	%r8, 0x063a, %r18
	.word 0xa409400a  ! 33: AND_R	and 	%r5, %r10, %r18
	.word 0xb601000e  ! 33: ADD_R	add 	%r4, %r14, %r27
	.word 0xa80a000e  ! 33: AND_R	and 	%r8, %r14, %r20
	.word 0xa2012be0  ! 33: ADD_I	add 	%r4, 0x0be0, %r17
	.word 0xb809c00e  ! 33: AND_R	and 	%r7, %r14, %r28
	.word 0xa809400f  ! 33: AND_R	and 	%r5, %r15, %r20
	.word 0xa609add2  ! 33: AND_I	and 	%r6, 0x0dd2, %r19
	.word 0xb411400f  ! 33: OR_R	or 	%r5, %r15, %r26
	.word 0xa4012886  ! 33: ADD_I	add 	%r4, 0x0886, %r18
	.word 0xa812000b  ! 33: OR_R	or 	%r8, %r11, %r20
	.word 0xa809400a  ! 33: AND_R	and 	%r5, %r10, %r20
	.word 0xba01000d  ! 33: ADD_R	add 	%r4, %r13, %r29
	.word 0xa809eaf6  ! 33: AND_I	and 	%r7, 0x0af6, %r20
	.word 0xb001c00e  ! 33: ADD_R	add 	%r7, %r14, %r24
	.word 0xbc00eb9d  ! 33: ADD_I	add 	%r3, 0x0b9d, %r30
	.word 0xb2110009  ! 33: OR_R	or 	%r4, %r9, %r25
	.word 0xb40929f3  ! 33: AND_I	and 	%r4, 0x09f3, %r26
	.word 0xba016712  ! 33: ADD_I	add 	%r5, 0x0712, %r29
	.word 0xa80a22dc  ! 33: AND_I	and 	%r8, 0x02dc, %r20
	.word 0xbe01400d  ! 33: ADD_R	add 	%r5, %r13, %r31
	.word 0xaa00c00e  ! 33: ADD_R	add 	%r3, %r14, %r21
	.word 0xb000c00e  ! 33: ADD_R	add 	%r3, %r14, %r24
	.word 0xa211ec90  ! 33: OR_I	or 	%r7, 0x0c90, %r17
	.word 0xbe0226a7  ! 33: ADD_I	add 	%r8, 0x06a7, %r31
	.word 0xa2118009  ! 33: OR_R	or 	%r6, %r9, %r17
	.word 0xb00a2719  ! 33: AND_I	and 	%r8, 0x0719, %r24
	.word 0xa811acb7  ! 33: OR_I	or 	%r6, 0x0cb7, %r20
	.word 0xb210eb38  ! 33: OR_I	or 	%r3, 0x0b38, %r25
	.word 0xa412000f  ! 33: OR_R	or 	%r8, %r15, %r18
	.word 0xb808ed23  ! 33: AND_I	and 	%r3, 0x0d23, %r28
	.word 0xba09000d  ! 33: AND_R	and 	%r4, %r13, %r29
	.word 0xb201800f  ! 33: ADD_R	add 	%r6, %r15, %r25
	.word 0xb8092acc  ! 33: AND_I	and 	%r4, 0x0acc, %r28
	.word 0xac016568  ! 33: ADD_I	add 	%r5, 0x0568, %r22
	.word 0xb408e854  ! 33: AND_I	and 	%r3, 0x0854, %r26
	.word 0xb601e1a6  ! 33: ADD_I	add 	%r7, 0x01a6, %r27
	.word 0xb610c00b  ! 33: OR_R	or 	%r3, %r11, %r27
	.word 0xa4022a97  ! 33: ADD_I	add 	%r8, 0x0a97, %r18
	.word 0xb4096c2e  ! 33: AND_I	and 	%r5, 0x0c2e, %r26
	.word 0xa609000a  ! 33: AND_R	and 	%r4, %r10, %r19
	.word 0xa210c00f  ! 33: OR_R	or 	%r3, %r15, %r17
	.word 0xb6016b05  ! 33: ADD_I	add 	%r5, 0x0b05, %r27
	.word 0xa610c00f  ! 33: OR_R	or 	%r3, %r15, %r19
	.word 0xaa11e6aa  ! 33: OR_I	or 	%r7, 0x06aa, %r21
	.word 0xbe11c00d  ! 33: OR_R	or 	%r7, %r13, %r31
	.word 0xbe11400e  ! 33: OR_R	or 	%r5, %r14, %r31
	.word 0xbc01663d  ! 33: ADD_I	add 	%r5, 0x063d, %r30
	.word 0xa609e064  ! 33: AND_I	and 	%r7, 0x0064, %r19
	.word 0xb201400c  ! 33: ADD_R	add 	%r5, %r12, %r25
	.word 0xb609e5e8  ! 33: AND_I	and 	%r7, 0x05e8, %r27
	.word 0xbc11e5e3  ! 33: OR_I	or 	%r7, 0x05e3, %r30
	.word 0xae01a506  ! 33: ADD_I	add 	%r6, 0x0506, %r23
	.word 0xb40229ec  ! 33: ADD_I	add 	%r8, 0x09ec, %r26
	.word 0xb800c00e  ! 33: ADD_R	add 	%r3, %r14, %r28
	.word 0xba12000e  ! 33: OR_R	or 	%r8, %r14, %r29
	.word 0xae11c00d  ! 33: OR_R	or 	%r7, %r13, %r23
	.word 0xe621e12c  ! 33: STW_I	stw	%r19, [%r7 + 0x012c]
	.word 0xe671a018  ! 33: STX_I	stx	%r19, [%r6 + 0x0018]
	.word 0xec722488  ! 33: STX_I	stx	%r22, [%r8 + 0x0488]
	.word 0xe2292040  ! 33: STB_I	stb	%r17, [%r4 + 0x0040]
	.word 0xfa2966d2  ! 33: STB_I	stb	%r29, [%r5 + 0x06d2]
	.word 0xe428e4db  ! 35: STB_I	stb	%r18, [%r3 + 0x04db]
	.word 0xb730e001  ! 36: SRL_I	srl 	%r3, 0x0001, %r27
	.word 0xf8722830  ! 37: STX_I	stx	%r28, [%r8 + 0x0830]
IC_ERR_8:
!$EV error(0,expr(@VA(.MAIN.IC_ERR_8), 16, 16),1,IC_DATA,IR,1,x)
	.word 0xf431ec30  ! 39: STH_I	sth	%r26, [%r7 + 0x0c30]
	.word 0xe251e222  ! 40: LDSH_I	ldsh	[%r7 + 0x0222], %r17
	.word 0xb40a000c  ! 40: AND_R	and 	%r8, %r12, %r26
	.word 0xba01400f  ! 40: ADD_R	add 	%r5, %r15, %r29
	.word 0xac00e614  ! 40: ADD_I	add 	%r3, 0x0614, %r22
	bne thr0_loop_2
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_3:
	.word 0xae09800f  ! 46: AND_R	and 	%r6, %r15, %r23
	.word 0xaa01000d  ! 46: ADD_R	add 	%r4, %r13, %r21
	.word 0xb60a21b8  ! 46: AND_I	and 	%r8, 0x01b8, %r27
	.word 0xb60221a7  ! 46: ADD_I	add 	%r8, 0x01a7, %r27
	.word 0xb210e59f  ! 46: OR_I	or 	%r3, 0x059f, %r25
	.word 0xa609ebf4  ! 46: AND_I	and 	%r7, 0x0bf4, %r19
	.word 0xb011000b  ! 46: OR_R	or 	%r4, %r11, %r24
	.word 0xb8092cd0  ! 46: AND_I	and 	%r4, 0x0cd0, %r28
	.word 0xbe01292d  ! 46: ADD_I	add 	%r4, 0x092d, %r31
	.word 0xa6016673  ! 46: ADD_I	add 	%r5, 0x0673, %r19
	.word 0xa6110009  ! 46: OR_R	or 	%r4, %r9, %r19
	.word 0xa208e054  ! 46: AND_I	and 	%r3, 0x0054, %r17
	.word 0xae09400b  ! 46: AND_R	and 	%r5, %r11, %r23
	.word 0xba118009  ! 46: OR_R	or 	%r6, %r9, %r29
	.word 0xb402000c  ! 46: ADD_R	add 	%r8, %r12, %r26
	.word 0xbc016691  ! 46: ADD_I	add 	%r5, 0x0691, %r30
	.word 0xa809a1c1  ! 46: AND_I	and 	%r6, 0x01c1, %r20
	.word 0xac09000d  ! 46: AND_R	and 	%r4, %r13, %r22
	.word 0xbe08e69d  ! 46: AND_I	and 	%r3, 0x069d, %r31
	.word 0xac09000c  ! 46: AND_R	and 	%r4, %r12, %r22
	.word 0xa211a6a2  ! 46: OR_I	or 	%r6, 0x06a2, %r17
	.word 0xbc00c00b  ! 46: ADD_R	add 	%r3, %r11, %r30
	.word 0xb601ae72  ! 46: ADD_I	add 	%r6, 0x0e72, %r27
	.word 0xb8022d27  ! 46: ADD_I	add 	%r8, 0x0d27, %r28
	.word 0xa211800f  ! 46: OR_R	or 	%r6, %r15, %r17
	.word 0xae11000b  ! 46: OR_R	or 	%r4, %r11, %r23
	.word 0xa411c00b  ! 46: OR_R	or 	%r7, %r11, %r18
	.word 0xa402000e  ! 46: ADD_R	add 	%r8, %r14, %r18
	.word 0xb8092a86  ! 46: AND_I	and 	%r4, 0x0a86, %r28
	.word 0xbe01c00b  ! 46: ADD_R	add 	%r7, %r11, %r31
	.word 0xba01e578  ! 46: ADD_I	add 	%r7, 0x0578, %r29
	.word 0xac1121b3  ! 46: OR_I	or 	%r4, 0x01b3, %r22
	.word 0xbc10c00e  ! 46: OR_R	or 	%r3, %r14, %r30
	.word 0xba010009  ! 46: ADD_R	add 	%r4, %r9, %r29
	.word 0xb411a388  ! 46: OR_I	or 	%r6, 0x0388, %r26
	.word 0xba11c009  ! 46: OR_R	or 	%r7, %r9, %r29
	.word 0xb009000d  ! 46: AND_R	and 	%r4, %r13, %r24
	.word 0xba02000f  ! 46: ADD_R	add 	%r8, %r15, %r29
	.word 0xba11a44a  ! 46: OR_I	or 	%r6, 0x044a, %r29
	.word 0xa61163d1  ! 46: OR_I	or 	%r5, 0x03d1, %r19
	.word 0xb001af06  ! 46: ADD_I	add 	%r6, 0x0f06, %r24
	.word 0xa2012dbf  ! 46: ADD_I	add 	%r4, 0x0dbf, %r17
	.word 0xbe09800d  ! 46: AND_R	and 	%r6, %r13, %r31
	.word 0xb411400d  ! 46: OR_R	or 	%r5, %r13, %r26
	.word 0xb2092040  ! 46: AND_I	and 	%r4, 0x0040, %r25
	.word 0xb008e1ed  ! 46: AND_I	and 	%r3, 0x01ed, %r24
	.word 0xba0a000e  ! 46: AND_R	and 	%r8, %r14, %r29
	.word 0xb211c00c  ! 46: OR_R	or 	%r7, %r12, %r25
	.word 0xba0a000a  ! 46: AND_R	and 	%r8, %r10, %r29
	.word 0xb611800e  ! 46: OR_R	or 	%r6, %r14, %r27
	.word 0xb601ef01  ! 46: ADD_I	add 	%r7, 0x0f01, %r27
	.word 0xa201aa5c  ! 46: ADD_I	add 	%r6, 0x0a5c, %r17
	.word 0xbc11ee3b  ! 46: OR_I	or 	%r7, 0x0e3b, %r30
	.word 0xb8012b32  ! 46: ADD_I	add 	%r4, 0x0b32, %r28
	.word 0xa80a204b  ! 46: AND_I	and 	%r8, 0x004b, %r20
	.word 0xba01e6db  ! 46: ADD_I	add 	%r7, 0x06db, %r29
	.word 0xb0120009  ! 46: OR_R	or 	%r8, %r9, %r24
	.word 0xbc09a86a  ! 46: AND_I	and 	%r6, 0x086a, %r30
	.word 0xbe11800f  ! 46: OR_R	or 	%r6, %r15, %r31
	.word 0xbc01400d  ! 46: ADD_R	add 	%r5, %r13, %r30
	.word 0xb411c00e  ! 46: OR_R	or 	%r7, %r14, %r26
	.word 0xbc12000f  ! 46: OR_R	or 	%r8, %r15, %r30
	.word 0xb200e215  ! 46: ADD_I	add 	%r3, 0x0215, %r25
	.word 0xbc10ed08  ! 46: OR_I	or 	%r3, 0x0d08, %r30
	.word 0xa201a47c  ! 46: ADD_I	add 	%r6, 0x047c, %r17
	.word 0xa201e8ec  ! 46: ADD_I	add 	%r7, 0x08ec, %r17
	.word 0xb8122ced  ! 46: OR_I	or 	%r8, 0x0ced, %r28
	.word 0xb800c00f  ! 46: ADD_R	add 	%r3, %r15, %r28
	.word 0xa411c00b  ! 46: OR_R	or 	%r7, %r11, %r18
	.word 0xa811c00b  ! 46: OR_R	or 	%r7, %r11, %r20
	.word 0xaa012c99  ! 46: ADD_I	add 	%r4, 0x0c99, %r21
	.word 0xba08c00d  ! 46: AND_R	and 	%r3, %r13, %r29
	.word 0xba122ad1  ! 46: OR_I	or 	%r8, 0x0ad1, %r29
	.word 0xb001217e  ! 46: ADD_I	add 	%r4, 0x017e, %r24
	.word 0xa401c00b  ! 46: ADD_R	add 	%r7, %r11, %r18
	.word 0xb609400e  ! 46: AND_R	and 	%r5, %r14, %r27
	.word 0xa211a2b1  ! 46: OR_I	or 	%r6, 0x02b1, %r17
	.word 0xa411000c  ! 46: OR_R	or 	%r4, %r12, %r18
	.word 0xb211287a  ! 46: OR_I	or 	%r4, 0x087a, %r25
	.word 0xb40963cc  ! 46: AND_I	and 	%r5, 0x03cc, %r26
	.word 0xa811800d  ! 46: OR_R	or 	%r6, %r13, %r20
	.word 0xaa01ab84  ! 46: ADD_I	add 	%r6, 0x0b84, %r21
	.word 0xac11e1d2  ! 46: OR_I	or 	%r7, 0x01d2, %r22
	.word 0xbc09800a  ! 46: AND_R	and 	%r6, %r10, %r30
	.word 0xa809400c  ! 46: AND_R	and 	%r5, %r12, %r20
	.word 0xbe092393  ! 46: AND_I	and 	%r4, 0x0393, %r31
	.word 0xaa0a000d  ! 46: AND_R	and 	%r8, %r13, %r21
	.word 0xa411ed69  ! 46: OR_I	or 	%r7, 0x0d69, %r18
	.word 0xaa0960d0  ! 46: AND_I	and 	%r5, 0x00d0, %r21
	.word 0xb80121a3  ! 46: ADD_I	add 	%r4, 0x01a3, %r28
	.word 0xbc01a807  ! 46: ADD_I	add 	%r6, 0x0807, %r30
	.word 0xac11c00b  ! 46: OR_R	or 	%r7, %r11, %r22
	.word 0xb001c00a  ! 46: ADD_R	add 	%r7, %r10, %r24
	.word 0xb20122a3  ! 46: ADD_I	add 	%r4, 0x02a3, %r25
	.word 0xb201a44b  ! 46: ADD_I	add 	%r6, 0x044b, %r25
	.word 0xae01c00d  ! 46: ADD_R	add 	%r7, %r13, %r23
	.word 0xb201273b  ! 46: ADD_I	add 	%r4, 0x073b, %r25
	.word 0xaa020009  ! 46: ADD_R	add 	%r8, %r9, %r21
	.word 0xb201e4c2  ! 46: ADD_I	add 	%r7, 0x04c2, %r25
	.word 0xb611400d  ! 46: OR_R	or 	%r5, %r13, %r27
	.word 0xb401800a  ! 46: ADD_R	add 	%r6, %r10, %r26
	.word 0xb809800d  ! 46: AND_R	and 	%r6, %r13, %r28
	.word 0xb2114009  ! 46: OR_R	or 	%r5, %r9, %r25
	.word 0xb209800d  ! 46: AND_R	and 	%r6, %r13, %r25
	.word 0xbc09c00a  ! 46: AND_R	and 	%r7, %r10, %r30
	.word 0xaa01000d  ! 46: ADD_R	add 	%r4, %r13, %r21
	.word 0xba11000c  ! 46: OR_R	or 	%r4, %r12, %r29
	.word 0xbe11e9b5  ! 46: OR_I	or 	%r7, 0x09b5, %r31
	.word 0xa2018009  ! 46: ADD_R	add 	%r6, %r9, %r17
	.word 0xa40122f4  ! 46: ADD_I	add 	%r4, 0x02f4, %r18
	.word 0xbc01800b  ! 46: ADD_R	add 	%r6, %r11, %r30
	.word 0xae00c00d  ! 46: ADD_R	add 	%r3, %r13, %r23
	.word 0xa411249f  ! 46: OR_I	or 	%r4, 0x049f, %r18
	.word 0xbc10ecbf  ! 46: OR_I	or 	%r3, 0x0cbf, %r30
	.word 0xa411c00d  ! 46: OR_R	or 	%r7, %r13, %r18
	.word 0xa201a810  ! 46: ADD_I	add 	%r6, 0x0810, %r17
	.word 0xb412000f  ! 46: OR_R	or 	%r8, %r15, %r26
	.word 0xb411000a  ! 46: OR_R	or 	%r4, %r10, %r26
	.word 0xac09800b  ! 46: AND_R	and 	%r6, %r11, %r22
	.word 0xa6120009  ! 46: OR_R	or 	%r8, %r9, %r19
	.word 0xbc11e7fc  ! 46: OR_I	or 	%r7, 0x07fc, %r30
	.word 0xa209400a  ! 46: AND_R	and 	%r5, %r10, %r17
	.word 0xb6096ea8  ! 46: AND_I	and 	%r5, 0x0ea8, %r27
	.word 0xac09e3a4  ! 46: AND_I	and 	%r7, 0x03a4, %r22
	.word 0xa601c00e  ! 46: ADD_R	add 	%r7, %r14, %r19
	.word 0xa601a875  ! 46: ADD_I	add 	%r6, 0x0875, %r19
	.word 0xa610e540  ! 46: OR_I	or 	%r3, 0x0540, %r19
	.word 0xb201c00d  ! 46: ADD_R	add 	%r7, %r13, %r25
	.word 0xb201000a  ! 46: ADD_R	add 	%r4, %r10, %r25
	.word 0xa209c00a  ! 46: AND_R	and 	%r7, %r10, %r17
	.word 0xb411400e  ! 46: OR_R	or 	%r5, %r14, %r26
	.word 0xa400c00f  ! 46: ADD_R	add 	%r3, %r15, %r18
	.word 0xbc09a595  ! 46: AND_I	and 	%r6, 0x0595, %r30
	.word 0xa801800a  ! 46: ADD_R	add 	%r6, %r10, %r20
	.word 0xa411000b  ! 46: OR_R	or 	%r4, %r11, %r18
	.word 0xb801a117  ! 46: ADD_I	add 	%r6, 0x0117, %r28
	.word 0xbc01c00c  ! 46: ADD_R	add 	%r7, %r12, %r30
	.word 0xb00160d6  ! 46: ADD_I	add 	%r5, 0x00d6, %r24
	.word 0xbc01edfb  ! 46: ADD_I	add 	%r7, 0x0dfb, %r30
	.word 0xb001400d  ! 46: ADD_R	add 	%r5, %r13, %r24
	.word 0xb400ee5a  ! 46: ADD_I	add 	%r3, 0x0e5a, %r26
	.word 0xb2092e19  ! 46: AND_I	and 	%r4, 0x0e19, %r25
	.word 0xa401800f  ! 46: ADD_R	add 	%r6, %r15, %r18
	.word 0xb0112f73  ! 46: OR_I	or 	%r4, 0x0f73, %r24
	.word 0xa4020009  ! 46: ADD_R	add 	%r8, %r9, %r18
	.word 0xbc09ed48  ! 46: AND_I	and 	%r7, 0x0d48, %r30
	.word 0xbc01000c  ! 46: ADD_R	add 	%r4, %r12, %r30
	.word 0xa211e78d  ! 46: OR_I	or 	%r7, 0x078d, %r17
	.word 0xb60164da  ! 46: ADD_I	add 	%r5, 0x04da, %r27
	.word 0xb01129ea  ! 46: OR_I	or 	%r4, 0x09ea, %r24
	.word 0xa2016a34  ! 46: ADD_I	add 	%r5, 0x0a34, %r17
	.word 0xac01c00f  ! 46: ADD_R	add 	%r7, %r15, %r22
	.word 0xbc09400f  ! 46: AND_R	and 	%r5, %r15, %r30
	.word 0xb8016148  ! 46: ADD_I	add 	%r5, 0x0148, %r28
	.word 0xb40925e5  ! 46: AND_I	and 	%r4, 0x05e5, %r26
	.word 0xb010e969  ! 46: OR_I	or 	%r3, 0x0969, %r24
	.word 0xac11ad38  ! 46: OR_I	or 	%r6, 0x0d38, %r22
	.word 0xa41221a0  ! 46: OR_I	or 	%r8, 0x01a0, %r18
	.word 0xa208c00a  ! 46: AND_R	and 	%r3, %r10, %r17
	.word 0xac094009  ! 46: AND_R	and 	%r5, %r9, %r22
	.word 0xa40a2bbf  ! 46: AND_I	and 	%r8, 0x0bbf, %r18
	.word 0xb801000e  ! 46: ADD_R	add 	%r4, %r14, %r28
	.word 0xb611000f  ! 46: OR_R	or 	%r4, %r15, %r27
	.word 0xb8096fd6  ! 46: AND_I	and 	%r5, 0x0fd6, %r28
	.word 0xae1225df  ! 46: OR_I	or 	%r8, 0x05df, %r23
	.word 0xb601400c  ! 46: ADD_R	add 	%r5, %r12, %r27
	.word 0xa801258e  ! 46: ADD_I	add 	%r4, 0x058e, %r20
	.word 0xaa1224b9  ! 46: OR_I	or 	%r8, 0x04b9, %r21
	.word 0xae09000e  ! 46: AND_R	and 	%r4, %r14, %r23
	.word 0xac01000a  ! 46: ADD_R	add 	%r4, %r10, %r22
	.word 0xb208c00c  ! 46: AND_R	and 	%r3, %r12, %r25
	.word 0xb812000b  ! 46: OR_R	or 	%r8, %r11, %r28
	.word 0xae09000f  ! 46: AND_R	and 	%r4, %r15, %r23
	.word 0xbe0a0009  ! 46: AND_R	and 	%r8, %r9, %r31
	.word 0xaa10e757  ! 46: OR_I	or 	%r3, 0x0757, %r21
	.word 0xa801c00d  ! 46: ADD_R	add 	%r7, %r13, %r20
	.word 0xb400c00b  ! 46: ADD_R	add 	%r3, %r11, %r26
	.word 0xa6122ee5  ! 46: OR_I	or 	%r8, 0x0ee5, %r19
	.word 0xb609abf2  ! 46: AND_I	and 	%r6, 0x0bf2, %r27
	.word 0xb209400b  ! 46: AND_R	and 	%r5, %r11, %r25
	.word 0xaa01c00f  ! 46: ADD_R	add 	%r7, %r15, %r21
	.word 0xa608ec8d  ! 46: AND_I	and 	%r3, 0x0c8d, %r19
	.word 0xb409c00c  ! 46: AND_R	and 	%r7, %r12, %r26
	.word 0xa8016c9f  ! 46: ADD_I	add 	%r5, 0x0c9f, %r20
	.word 0xb0096a5e  ! 46: AND_I	and 	%r5, 0x0a5e, %r24
	.word 0xb4092448  ! 46: AND_I	and 	%r4, 0x0448, %r26
	.word 0xae1124d3  ! 46: OR_I	or 	%r4, 0x04d3, %r23
	.word 0xb800c00c  ! 46: ADD_R	add 	%r3, %r12, %r28
	.word 0xbe10c00b  ! 46: OR_R	or 	%r3, %r11, %r31
	.word 0xa4012ec7  ! 46: ADD_I	add 	%r4, 0x0ec7, %r18
	.word 0xa400c00a  ! 46: ADD_R	add 	%r3, %r10, %r18
	.word 0xbe09a52f  ! 46: AND_I	and 	%r6, 0x052f, %r31
	.word 0xbe11400b  ! 46: OR_R	or 	%r5, %r11, %r31
	.word 0xa210c00f  ! 46: OR_R	or 	%r3, %r15, %r17
	.word 0xaa10e6f1  ! 46: OR_I	or 	%r3, 0x06f1, %r21
	.word 0xae09a67a  ! 46: AND_I	and 	%r6, 0x067a, %r23
	.word 0xaa11a5b8  ! 46: OR_I	or 	%r6, 0x05b8, %r21
	.word 0xb410e00f  ! 46: OR_I	or 	%r3, 0x000f, %r26
	.word 0xb60a000b  ! 46: AND_R	and 	%r8, %r11, %r27
	.word 0xf0292e24  ! 46: STB_I	stb	%r24, [%r4 + 0x0e24]
	.word 0xe2312d98  ! 46: STH_I	sth	%r17, [%r4 + 0x0d98]
	.word 0xec712dc8  ! 46: STX_I	stx	%r22, [%r4 + 0x0dc8]
	.word 0xf431edca  ! 46: STH_I	sth	%r26, [%r7 + 0x0dca]
	.word 0xe8716858  ! 46: STX_I	stx	%r20, [%r5 + 0x0858]
	.word 0xfc2a21e0  ! 47: STB_I	stb	%r30, [%r8 + 0x01e0]
	.word 0xae010045
	.word 0xf620eab4  ! 49: STW_I	stw	%r27, [%r3 + 0x0ab4]
	.word 0xf231e3c8  ! 50: STH_I	sth	%r25, [%r7 + 0x03c8]
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xb409ab88  ! 51: AND_I	and 	%r6, 0x0b88, %r26
	.word 0xbe09ae0d  ! 51: AND_I	and 	%r6, 0x0e0d, %r31
	.word 0xbc096af5  ! 51: AND_I	and 	%r5, 0x0af5, %r30
	bne thr0_loop_3
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_4:
	.word 0xae09604a  ! 57: AND_I	and 	%r5, 0x004a, %r23
	.word 0xb811e22f  ! 57: OR_I	or 	%r7, 0x022f, %r28
	.word 0xbe096d13  ! 57: AND_I	and 	%r5, 0x0d13, %r31
	.word 0xb00a2b77  ! 57: AND_I	and 	%r8, 0x0b77, %r24
	.word 0xb80a2959  ! 57: AND_I	and 	%r8, 0x0959, %r28
	.word 0xb0022687  ! 57: ADD_I	add 	%r8, 0x0687, %r24
	.word 0xa201c00c  ! 57: ADD_R	add 	%r7, %r12, %r17
	.word 0xba01800e  ! 57: ADD_R	add 	%r6, %r14, %r29
	.word 0xa611000e  ! 57: OR_R	or 	%r4, %r14, %r19
	.word 0xa801000d  ! 57: ADD_R	add 	%r4, %r13, %r20
	.word 0xac11e210  ! 57: OR_I	or 	%r7, 0x0210, %r22
	.word 0xaa10e4bc  ! 57: OR_I	or 	%r3, 0x04bc, %r21
	.word 0xb001800c  ! 57: ADD_R	add 	%r6, %r12, %r24
	.word 0xbc08c00d  ! 57: AND_R	and 	%r3, %r13, %r30
	.word 0xaa10e1ed  ! 57: OR_I	or 	%r3, 0x01ed, %r21
	.word 0xb409800e  ! 57: AND_R	and 	%r6, %r14, %r26
	.word 0xbc092f0e  ! 57: AND_I	and 	%r4, 0x0f0e, %r30
	.word 0xbe01ad08  ! 57: ADD_I	add 	%r6, 0x0d08, %r31
	.word 0xae10c00a  ! 57: OR_R	or 	%r3, %r10, %r23
	.word 0xb201c009  ! 57: ADD_R	add 	%r7, %r9, %r25
	.word 0xb8114009  ! 57: OR_R	or 	%r5, %r9, %r28
	.word 0xba016081  ! 57: ADD_I	add 	%r5, 0x0081, %r29
	.word 0xbc01ed6f  ! 57: ADD_I	add 	%r7, 0x0d6f, %r30
	.word 0xa4012da5  ! 57: ADD_I	add 	%r4, 0x0da5, %r18
	.word 0xb208c00d  ! 57: AND_R	and 	%r3, %r13, %r25
	.word 0xbe11a6d8  ! 57: OR_I	or 	%r6, 0x06d8, %r31
	.word 0xb011800a  ! 57: OR_R	or 	%r6, %r10, %r24
	.word 0xb2092dcd  ! 57: AND_I	and 	%r4, 0x0dcd, %r25
	.word 0xba090009  ! 57: AND_R	and 	%r4, %r9, %r29
	.word 0xac012bb5  ! 57: ADD_I	add 	%r4, 0x0bb5, %r22
	.word 0xac11000a  ! 57: OR_R	or 	%r4, %r10, %r22
	.word 0xac11a1ef  ! 57: OR_I	or 	%r6, 0x01ef, %r22
	.word 0xa411a2bf  ! 57: OR_I	or 	%r6, 0x02bf, %r18
	.word 0xa208c00b  ! 57: AND_R	and 	%r3, %r11, %r17
	.word 0xba10c009  ! 57: OR_R	or 	%r3, %r9, %r29
	.word 0xa2094009  ! 57: AND_R	and 	%r5, %r9, %r17
	.word 0xb612000b  ! 57: OR_R	or 	%r8, %r11, %r27
	.word 0xb2096b62  ! 57: AND_I	and 	%r5, 0x0b62, %r25
	.word 0xa209a426  ! 57: AND_I	and 	%r6, 0x0426, %r17
	.word 0xb611400d  ! 57: OR_R	or 	%r5, %r13, %r27
	.word 0xa201e789  ! 57: ADD_I	add 	%r7, 0x0789, %r17
	.word 0xa610ebc7  ! 57: OR_I	or 	%r3, 0x0bc7, %r19
	.word 0xaa01800f  ! 57: ADD_R	add 	%r6, %r15, %r21
	.word 0xa801000a  ! 57: ADD_R	add 	%r4, %r10, %r20
	.word 0xb009000c  ! 57: AND_R	and 	%r4, %r12, %r24
	.word 0xa402000e  ! 57: ADD_R	add 	%r8, %r14, %r18
	.word 0xbe0a000b  ! 57: AND_R	and 	%r8, %r11, %r31
	.word 0xb011400a  ! 57: OR_R	or 	%r5, %r10, %r24
	.word 0xb8122738  ! 57: OR_I	or 	%r8, 0x0738, %r28
	.word 0xac01e79c  ! 57: ADD_I	add 	%r7, 0x079c, %r22
	.word 0xb20a21c5  ! 57: AND_I	and 	%r8, 0x01c5, %r25
	.word 0xa209e4ee  ! 57: AND_I	and 	%r7, 0x04ee, %r17
	.word 0xb208ef8d  ! 57: AND_I	and 	%r3, 0x0f8d, %r25
	.word 0xb001ac3c  ! 57: ADD_I	add 	%r6, 0x0c3c, %r24
	.word 0xbe01aafc  ! 57: ADD_I	add 	%r6, 0x0afc, %r31
	.word 0xac120009  ! 57: OR_R	or 	%r8, %r9, %r22
	.word 0xb40a000b  ! 57: AND_R	and 	%r8, %r11, %r26
	.word 0xb8022fa0  ! 57: ADD_I	add 	%r8, 0x0fa0, %r28
	.word 0xbc01699a  ! 57: ADD_I	add 	%r5, 0x099a, %r30
	.word 0xba010009  ! 57: ADD_R	add 	%r4, %r9, %r29
	.word 0xb4020009  ! 57: ADD_R	add 	%r8, %r9, %r26
	.word 0xa409000f  ! 57: AND_R	and 	%r4, %r15, %r18
	.word 0xb40a0009  ! 57: AND_R	and 	%r8, %r9, %r26
	.word 0xb009000e  ! 57: AND_R	and 	%r4, %r14, %r24
	.word 0xa409c00a  ! 57: AND_R	and 	%r7, %r10, %r18
	.word 0xb008e6cb  ! 57: AND_I	and 	%r3, 0x06cb, %r24
	.word 0xbc11696c  ! 57: OR_I	or 	%r5, 0x096c, %r30
	.word 0xbc116d1c  ! 57: OR_I	or 	%r5, 0x0d1c, %r30
	.word 0xb8094009  ! 57: AND_R	and 	%r5, %r9, %r28
	.word 0xb401a96f  ! 57: ADD_I	add 	%r6, 0x096f, %r26
	.word 0xa401c009  ! 57: ADD_R	add 	%r7, %r9, %r18
	.word 0xae0126f2  ! 57: ADD_I	add 	%r4, 0x06f2, %r23
	.word 0xb4116b8b  ! 57: OR_I	or 	%r5, 0x0b8b, %r26
	.word 0xbe1229f5  ! 57: OR_I	or 	%r8, 0x09f5, %r31
	.word 0xac01eb12  ! 57: ADD_I	add 	%r7, 0x0b12, %r22
	.word 0xba0a0009  ! 57: AND_R	and 	%r8, %r9, %r29
	.word 0xa210e64d  ! 57: OR_I	or 	%r3, 0x064d, %r17
	.word 0xba012859  ! 57: ADD_I	add 	%r4, 0x0859, %r29
	.word 0xaa02000a  ! 57: ADD_R	add 	%r8, %r10, %r21
	.word 0xb009400d  ! 57: AND_R	and 	%r5, %r13, %r24
	.word 0xb810c00a  ! 57: OR_R	or 	%r3, %r10, %r28
	.word 0xa4096427  ! 57: AND_I	and 	%r5, 0x0427, %r18
	.word 0xb402000c  ! 57: ADD_R	add 	%r8, %r12, %r26
	.word 0xb401400a  ! 57: ADD_R	add 	%r5, %r10, %r26
	.word 0xa411400f  ! 57: OR_R	or 	%r5, %r15, %r18
	.word 0xba08c00d  ! 57: AND_R	and 	%r3, %r13, %r29
	.word 0xa201a039  ! 57: ADD_I	add 	%r6, 0x0039, %r17
	.word 0xaa00e4a0  ! 57: ADD_I	add 	%r3, 0x04a0, %r21
	.word 0xa800c00e  ! 57: ADD_R	add 	%r3, %r14, %r20
	.word 0xba10c00b  ! 57: OR_R	or 	%r3, %r11, %r29
	.word 0xbe11e8a0  ! 57: OR_I	or 	%r7, 0x08a0, %r31
	.word 0xb011c009  ! 57: OR_R	or 	%r7, %r9, %r24
	.word 0xaa1167a6  ! 57: OR_I	or 	%r5, 0x07a6, %r21
	.word 0xb2090009  ! 57: AND_R	and 	%r4, %r9, %r25
	.word 0xa612000d  ! 57: OR_R	or 	%r8, %r13, %r19
	.word 0xae01000b  ! 57: ADD_R	add 	%r4, %r11, %r23
	.word 0xa800ecfd  ! 57: ADD_I	add 	%r3, 0x0cfd, %r20
	.word 0xae09800c  ! 57: AND_R	and 	%r6, %r12, %r23
	.word 0xac11a106  ! 57: OR_I	or 	%r6, 0x0106, %r22
	.word 0xb4098009  ! 57: AND_R	and 	%r6, %r9, %r26
	.word 0xa211000f  ! 57: OR_R	or 	%r4, %r15, %r17
	.word 0xb809c00b  ! 57: AND_R	and 	%r7, %r11, %r28
	.word 0xb6022de0  ! 57: ADD_I	add 	%r8, 0x0de0, %r27
	.word 0xa2012611  ! 57: ADD_I	add 	%r4, 0x0611, %r17
	.word 0xb8096a54  ! 57: AND_I	and 	%r5, 0x0a54, %r28
	.word 0xba00c00c  ! 57: ADD_R	add 	%r3, %r12, %r29
	.word 0xb009400d  ! 57: AND_R	and 	%r5, %r13, %r24
	.word 0xa609800f  ! 57: AND_R	and 	%r6, %r15, %r19
	.word 0xb010e86b  ! 57: OR_I	or 	%r3, 0x086b, %r24
	.word 0xba0a2f76  ! 57: AND_I	and 	%r8, 0x0f76, %r29
	.word 0xb211c00c  ! 57: OR_R	or 	%r7, %r12, %r25
	.word 0xa611000b  ! 57: OR_R	or 	%r4, %r11, %r19
	.word 0xb60a2b25  ! 57: AND_I	and 	%r8, 0x0b25, %r27
	.word 0xb609c00e  ! 57: AND_R	and 	%r7, %r14, %r27
	.word 0xb6022b2d  ! 57: ADD_I	add 	%r8, 0x0b2d, %r27
	.word 0xac09800f  ! 57: AND_R	and 	%r6, %r15, %r22
	.word 0xbe092a30  ! 57: AND_I	and 	%r4, 0x0a30, %r31
	.word 0xae1225a8  ! 57: OR_I	or 	%r8, 0x05a8, %r23
	.word 0xb811c00d  ! 57: OR_R	or 	%r7, %r13, %r28
	.word 0xa801c00e  ! 57: ADD_R	add 	%r7, %r14, %r20
	.word 0xbe01000b  ! 57: ADD_R	add 	%r4, %r11, %r31
	.word 0xb001ef21  ! 57: ADD_I	add 	%r7, 0x0f21, %r24
	.word 0xb0096e85  ! 57: AND_I	and 	%r5, 0x0e85, %r24
	.word 0xaa01eb24  ! 57: ADD_I	add 	%r7, 0x0b24, %r21
	.word 0xac09225d  ! 57: AND_I	and 	%r4, 0x025d, %r22
	.word 0xb011800b  ! 57: OR_R	or 	%r6, %r11, %r24
	.word 0xae10c00c  ! 57: OR_R	or 	%r3, %r12, %r23
	.word 0xaa092513  ! 57: AND_I	and 	%r4, 0x0513, %r21
	.word 0xbe090009  ! 57: AND_R	and 	%r4, %r9, %r31
	.word 0xac00c00d  ! 57: ADD_R	add 	%r3, %r13, %r22
	.word 0xae01a4c7  ! 57: ADD_I	add 	%r6, 0x04c7, %r23
	.word 0xa601000e  ! 57: ADD_R	add 	%r4, %r14, %r19
	.word 0xac116274  ! 57: OR_I	or 	%r5, 0x0274, %r22
	.word 0xa412000f  ! 57: OR_R	or 	%r8, %r15, %r18
	.word 0xb612000d  ! 57: OR_R	or 	%r8, %r13, %r27
	.word 0xb4122398  ! 57: OR_I	or 	%r8, 0x0398, %r26
	.word 0xa610e717  ! 57: OR_I	or 	%r3, 0x0717, %r19
	.word 0xb6116a47  ! 57: OR_I	or 	%r5, 0x0a47, %r27
	.word 0xbe0a2df8  ! 57: AND_I	and 	%r8, 0x0df8, %r31
	.word 0xba01c00d  ! 57: ADD_R	add 	%r7, %r13, %r29
	.word 0xa609ea22  ! 57: AND_I	and 	%r7, 0x0a22, %r19
	.word 0xa209aa5d  ! 57: AND_I	and 	%r6, 0x0a5d, %r17
	.word 0xb60a0009  ! 57: AND_R	and 	%r8, %r9, %r27
	.word 0xf829e5ad  ! 57: STB_I	stb	%r28, [%r7 + 0x05ad]
	.word 0xe231a3a2  ! 57: STH_I	sth	%r17, [%r6 + 0x03a2]
	.word 0xe830ef94  ! 57: STH_I	sth	%r20, [%r3 + 0x0f94]
	.word 0xf229e72c  ! 57: STB_I	stb	%r25, [%r7 + 0x072c]
	.word 0xf8222ff8  ! 57: STW_I	stw	%r28, [%r8 + 0x0ff8]
	.word 0xf8716400  ! 59: STX_I	stx	%r28, [%r5 + 0x0400]
	.word 0xae010045
	.word 0xf0222e0c  ! 61: STW_I	stw	%r24, [%r8 + 0x0e0c]
IC_ERR_12:
!$EV error(0,expr(@VA(.MAIN.IC_ERR_12), 16, 16),1,IC_DATA,IR,25,x)
	.word 0xc0f008e2  ! 64: STXA_R	stxa	%r0, [%r0 + %r2] 0x47
	.word 0xf0010009  ! 65: LDUW_R	lduw	[%r4 + %r9], %r24
	.word 0xbe08e2a3  ! 65: AND_I	and 	%r3, 0x02a3, %r31
	.word 0xb411c00a  ! 65: OR_R	or 	%r7, %r10, %r26
	.word 0xa809400f  ! 65: AND_R	and 	%r5, %r15, %r20
	bne thr0_loop_4
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_5:
	.word 0xaa02000a  ! 73: ADD_R	add 	%r8, %r10, %r21
	.word 0xb201800c  ! 73: ADD_R	add 	%r6, %r12, %r25
	.word 0xb40a000f  ! 73: AND_R	and 	%r8, %r15, %r26
	.word 0xba00c00a  ! 73: ADD_R	add 	%r3, %r10, %r29
	.word 0xb008e793  ! 73: AND_I	and 	%r3, 0x0793, %r24
	.word 0xbc08ee7c  ! 73: AND_I	and 	%r3, 0x0e7c, %r30
	.word 0xb601edf7  ! 73: ADD_I	add 	%r7, 0x0df7, %r27
	.word 0xa600ecdd  ! 73: ADD_I	add 	%r3, 0x0cdd, %r19
	.word 0xb8116efd  ! 73: OR_I	or 	%r5, 0x0efd, %r28
	.word 0xa811c00e  ! 73: OR_R	or 	%r7, %r14, %r20
	.word 0xa410c00b  ! 73: OR_R	or 	%r3, %r11, %r18
	.word 0xb811ad60  ! 73: OR_I	or 	%r6, 0x0d60, %r28
	.word 0xb000c00d  ! 73: ADD_R	add 	%r3, %r13, %r24
	.word 0xb611c00f  ! 73: OR_R	or 	%r7, %r15, %r27
	.word 0xb211000a  ! 73: OR_R	or 	%r4, %r10, %r25
	.word 0xa609a58d  ! 73: AND_I	and 	%r6, 0x058d, %r19
	.word 0xb001400e  ! 73: ADD_R	add 	%r5, %r14, %r24
	.word 0xa209400b  ! 73: AND_R	and 	%r5, %r11, %r17
	.word 0xa6094009  ! 73: AND_R	and 	%r5, %r9, %r19
	.word 0xbc118009  ! 73: OR_R	or 	%r6, %r9, %r30
	.word 0xbc09000f  ! 73: AND_R	and 	%r4, %r15, %r30
	.word 0xa80a2416  ! 73: AND_I	and 	%r8, 0x0416, %r20
	.word 0xba12000a  ! 73: OR_R	or 	%r8, %r10, %r29
	.word 0xac0165a3  ! 73: ADD_I	add 	%r5, 0x05a3, %r22
	.word 0xb811e5a8  ! 73: OR_I	or 	%r7, 0x05a8, %r28
	.word 0xac08ecd6  ! 73: AND_I	and 	%r3, 0x0cd6, %r22
	.word 0xa601c00d  ! 73: ADD_R	add 	%r7, %r13, %r19
	.word 0xa808e5b4  ! 73: AND_I	and 	%r3, 0x05b4, %r20
	.word 0xa609400a  ! 73: AND_R	and 	%r5, %r10, %r19
	.word 0xb6092000  ! 73: AND_I	and 	%r4, 0x0000, %r27
	.word 0xb611000c  ! 73: OR_R	or 	%r4, %r12, %r27
	.word 0xaa11e32f  ! 73: OR_I	or 	%r7, 0x032f, %r21
	.word 0xac01ec62  ! 73: ADD_I	add 	%r7, 0x0c62, %r22
	.word 0xb609400a  ! 73: AND_R	and 	%r5, %r10, %r27
	.word 0xa201a858  ! 73: ADD_I	add 	%r6, 0x0858, %r17
	.word 0xb2020009  ! 73: ADD_R	add 	%r8, %r9, %r25
	.word 0xbe08e563  ! 73: AND_I	and 	%r3, 0x0563, %r31
	.word 0xb011a969  ! 73: OR_I	or 	%r6, 0x0969, %r24
	.word 0xa60965c3  ! 73: AND_I	and 	%r5, 0x05c3, %r19
	.word 0xa402000f  ! 73: ADD_R	add 	%r8, %r15, %r18
	.word 0xaa01c00f  ! 73: ADD_R	add 	%r7, %r15, %r21
	.word 0xbc116b78  ! 73: OR_I	or 	%r5, 0x0b78, %r30
	.word 0xb011e093  ! 73: OR_I	or 	%r7, 0x0093, %r24
	.word 0xa811400f  ! 73: OR_R	or 	%r5, %r15, %r20
	.word 0xac02228b  ! 73: ADD_I	add 	%r8, 0x028b, %r22
	.word 0xb011a017  ! 73: OR_I	or 	%r6, 0x0017, %r24
	.word 0xb611ad02  ! 73: OR_I	or 	%r6, 0x0d02, %r27
	.word 0xa611000c  ! 73: OR_R	or 	%r4, %r12, %r19
	.word 0xa808eb50  ! 73: AND_I	and 	%r3, 0x0b50, %r20
	.word 0xb201800e  ! 73: ADD_R	add 	%r6, %r14, %r25
	.word 0xb810c00a  ! 73: OR_R	or 	%r3, %r10, %r28
	.word 0xa609000a  ! 73: AND_R	and 	%r4, %r10, %r19
	.word 0xb009800e  ! 73: AND_R	and 	%r6, %r14, %r24
	.word 0xb011800b  ! 73: OR_R	or 	%r6, %r11, %r24
	.word 0xb80228e2  ! 73: ADD_I	add 	%r8, 0x08e2, %r28
	.word 0xb601ea08  ! 73: ADD_I	add 	%r7, 0x0a08, %r27
	.word 0xba02000a  ! 73: ADD_R	add 	%r8, %r10, %r29
	.word 0xb40a000e  ! 73: AND_R	and 	%r8, %r14, %r26
	.word 0xac094009  ! 73: AND_R	and 	%r5, %r9, %r22
	.word 0xb410c00b  ! 73: OR_R	or 	%r3, %r11, %r26
	.word 0xba11000a  ! 73: OR_R	or 	%r4, %r10, %r29
	.word 0xb6012e3a  ! 73: ADD_I	add 	%r4, 0x0e3a, %r27
	.word 0xaa016a18  ! 73: ADD_I	add 	%r5, 0x0a18, %r21
	.word 0xa412000d  ! 73: OR_R	or 	%r8, %r13, %r18
	.word 0xb60225ea  ! 73: ADD_I	add 	%r8, 0x05ea, %r27
	.word 0xa609400f  ! 73: AND_R	and 	%r5, %r15, %r19
	.word 0xba022898  ! 73: ADD_I	add 	%r8, 0x0898, %r29
	.word 0xa601e53d  ! 73: ADD_I	add 	%r7, 0x053d, %r19
	.word 0xb81160c1  ! 73: OR_I	or 	%r5, 0x00c1, %r28
	.word 0xa609000c  ! 73: AND_R	and 	%r4, %r12, %r19
	.word 0xa4022ded  ! 73: ADD_I	add 	%r8, 0x0ded, %r18
	.word 0xbc09800b  ! 73: AND_R	and 	%r6, %r11, %r30
	.word 0xb411e746  ! 73: OR_I	or 	%r7, 0x0746, %r26
	.word 0xbc00e827  ! 73: ADD_I	add 	%r3, 0x0827, %r30
	.word 0xae11400b  ! 73: OR_R	or 	%r5, %r11, %r23
	.word 0xa611eade  ! 73: OR_I	or 	%r7, 0x0ade, %r19
	.word 0xb010c00e  ! 73: OR_R	or 	%r3, %r14, %r24
	.word 0xac08c00f  ! 73: AND_R	and 	%r3, %r15, %r22
	.word 0xa609eaeb  ! 73: AND_I	and 	%r7, 0x0aeb, %r19
	.word 0xbe01efeb  ! 73: ADD_I	add 	%r7, 0x0feb, %r31
	.word 0xb80961ab  ! 73: AND_I	and 	%r5, 0x01ab, %r28
	.word 0xa8096c9b  ! 73: AND_I	and 	%r5, 0x0c9b, %r20
	.word 0xa210ea15  ! 73: OR_I	or 	%r3, 0x0a15, %r17
	.word 0xa401ea3f  ! 73: ADD_I	add 	%r7, 0x0a3f, %r18
	.word 0xb608c009  ! 73: AND_R	and 	%r3, %r9, %r27
	.word 0xa810c00f  ! 73: OR_R	or 	%r3, %r15, %r20
	.word 0xbe08c00c  ! 73: AND_R	and 	%r3, %r12, %r31
	.word 0xa408c00b  ! 73: AND_R	and 	%r3, %r11, %r18
	.word 0xaa01e660  ! 73: ADD_I	add 	%r7, 0x0660, %r21
	.word 0xaa11800f  ! 73: OR_R	or 	%r6, %r15, %r21
	.word 0xac01400e  ! 73: ADD_R	add 	%r5, %r14, %r22
	.word 0xac096675  ! 73: AND_I	and 	%r5, 0x0675, %r22
	.word 0xac00c00f  ! 73: ADD_R	add 	%r3, %r15, %r22
	.word 0xba09800a  ! 73: AND_R	and 	%r6, %r10, %r29
	.word 0xa8022a3f  ! 73: ADD_I	add 	%r8, 0x0a3f, %r20
	.word 0xbe018009  ! 73: ADD_R	add 	%r6, %r9, %r31
	.word 0xac01a036  ! 73: ADD_I	add 	%r6, 0x0036, %r22
	.word 0xbe0a2366  ! 73: AND_I	and 	%r8, 0x0366, %r31
	.word 0xae094009  ! 73: AND_R	and 	%r5, %r9, %r23
	.word 0xb2122451  ! 73: OR_I	or 	%r8, 0x0451, %r25
	.word 0xba00c00f  ! 73: ADD_R	add 	%r3, %r15, %r29
	.word 0xa409e995  ! 73: AND_I	and 	%r7, 0x0995, %r18
	.word 0xbc01800e  ! 73: ADD_R	add 	%r6, %r14, %r30
	.word 0xb209000e  ! 73: AND_R	and 	%r4, %r14, %r25
	.word 0xa211800c  ! 73: OR_R	or 	%r6, %r12, %r17
	.word 0xb011a883  ! 73: OR_I	or 	%r6, 0x0883, %r24
	.word 0xb800c009  ! 73: ADD_R	add 	%r3, %r9, %r28
	.word 0xb200c00e  ! 73: ADD_R	add 	%r3, %r14, %r25
	.word 0xbe098009  ! 73: AND_R	and 	%r6, %r9, %r31
	.word 0xa609400c  ! 73: AND_R	and 	%r5, %r12, %r19
	.word 0xa2094009  ! 73: AND_R	and 	%r5, %r9, %r17
	.word 0xbc00c00f  ! 73: ADD_R	add 	%r3, %r15, %r30
	.word 0xae10e89a  ! 73: OR_I	or 	%r3, 0x089a, %r23
	.word 0xa602000d  ! 73: ADD_R	add 	%r8, %r13, %r19
	.word 0xbc116ec7  ! 73: OR_I	or 	%r5, 0x0ec7, %r30
	.word 0xbe11c00d  ! 73: OR_R	or 	%r7, %r13, %r31
	.word 0xba012dec  ! 73: ADD_I	add 	%r4, 0x0dec, %r29
	.word 0xa402000d  ! 73: ADD_R	add 	%r8, %r13, %r18
	.word 0xb409400d  ! 73: AND_R	and 	%r5, %r13, %r26
	.word 0xf4322cb2  ! 73: STH_I	sth	%r26, [%r8 + 0x0cb2]
	.word 0xf270ea58  ! 73: STX_I	stx	%r25, [%r3 + 0x0a58]
	.word 0xfe71aa98  ! 73: STX_I	stx	%r31, [%r6 + 0x0a98]
	.word 0xf22a2e25  ! 73: STB_I	stb	%r25, [%r8 + 0x0e25]
	.word 0xf6716668  ! 73: STX_I	stx	%r27, [%r5 + 0x0668]
	.word 0xee292e41  ! 73: STB_I	stb	%r23, [%r4 + 0x0e41]
	.word 0xec2a29ce  ! 73: STB_I	stb	%r22, [%r8 + 0x09ce]
	.word 0xf049c00e  ! 74: LDSB_R	ldsb	[%r7 + %r14], %r24
	.word 0xf4212330  ! 75: STW_I	stw	%r26, [%r4 + 0x0330]
	.word 0xfa48c00d  ! 76: LDSB_R	ldsb	[%r3 + %r13], %r29
	.word 0xac016dc2  ! 76: ADD_I	add 	%r5, 0x0dc2, %r22
	.word 0xbc01000a  ! 76: ADD_R	add 	%r4, %r10, %r30
	.word 0xa409800b  ! 76: AND_R	and 	%r6, %r11, %r18
	bne thr0_loop_5
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_6:
	.word 0xba022b32  ! 82: ADD_I	add 	%r8, 0x0b32, %r29
	.word 0xa6022385  ! 82: ADD_I	add 	%r8, 0x0385, %r19
	.word 0xac096845  ! 82: AND_I	and 	%r5, 0x0845, %r22
	.word 0xac08c00d  ! 82: AND_R	and 	%r3, %r13, %r22
	.word 0xa210e8af  ! 82: OR_I	or 	%r3, 0x08af, %r17
	.word 0xa4094009  ! 82: AND_R	and 	%r5, %r9, %r18
	.word 0xa401800b  ! 82: ADD_R	add 	%r6, %r11, %r18
	.word 0xa601800d  ! 82: ADD_R	add 	%r6, %r13, %r19
	.word 0xb4094009  ! 82: AND_R	and 	%r5, %r9, %r26
	.word 0xac00c00d  ! 82: ADD_R	add 	%r3, %r13, %r22
	.word 0xb209400a  ! 82: AND_R	and 	%r5, %r10, %r25
	.word 0xb0098009  ! 82: AND_R	and 	%r6, %r9, %r24
	.word 0xbe012ef7  ! 82: ADD_I	add 	%r4, 0x0ef7, %r31
	.word 0xb210eea1  ! 82: OR_I	or 	%r3, 0x0ea1, %r25
	.word 0xbc116434  ! 82: OR_I	or 	%r5, 0x0434, %r30
	.word 0xaa01249f  ! 82: ADD_I	add 	%r4, 0x049f, %r21
	.word 0xb201000b  ! 82: ADD_R	add 	%r4, %r11, %r25
	.word 0xa811000a  ! 82: OR_R	or 	%r4, %r10, %r20
	.word 0xb200c00b  ! 82: ADD_R	add 	%r3, %r11, %r25
	.word 0xb801800a  ! 82: ADD_R	add 	%r6, %r10, %r28
	.word 0xa20a2205  ! 82: AND_I	and 	%r8, 0x0205, %r17
	.word 0xb61165aa  ! 82: OR_I	or 	%r5, 0x05aa, %r27
	.word 0xa4112c2e  ! 82: OR_I	or 	%r4, 0x0c2e, %r18
	.word 0xa800ec44  ! 82: ADD_I	add 	%r3, 0x0c44, %r20
	.word 0xb202000a  ! 82: ADD_R	add 	%r8, %r10, %r25
	.word 0xa201400e  ! 82: ADD_R	add 	%r5, %r14, %r17
	.word 0xbc09800b  ! 82: AND_R	and 	%r6, %r11, %r30
	.word 0xbe01e4bb  ! 82: ADD_I	add 	%r7, 0x04bb, %r31
	.word 0xb800c00e  ! 82: ADD_R	add 	%r3, %r14, %r28
	.word 0xb611ada0  ! 82: OR_I	or 	%r6, 0x0da0, %r27
	.word 0xb611a0dc  ! 82: OR_I	or 	%r6, 0x00dc, %r27
	.word 0xaa10c009  ! 82: OR_R	or 	%r3, %r9, %r21
	.word 0xb209e12f  ! 82: AND_I	and 	%r7, 0x012f, %r25
	.word 0xb209e4e7  ! 82: AND_I	and 	%r7, 0x04e7, %r25
	.word 0xba11e897  ! 82: OR_I	or 	%r7, 0x0897, %r29
	.word 0xaa096e26  ! 82: AND_I	and 	%r5, 0x0e26, %r21
	.word 0xb408ef5a  ! 82: AND_I	and 	%r3, 0x0f5a, %r26
	.word 0xa609800f  ! 82: AND_R	and 	%r6, %r15, %r19
	.word 0xbe0a23cd  ! 82: AND_I	and 	%r8, 0x03cd, %r31
	.word 0xb0112a4f  ! 82: OR_I	or 	%r4, 0x0a4f, %r24
	.word 0xa812286c  ! 82: OR_I	or 	%r8, 0x086c, %r20
	.word 0xb601000b  ! 82: ADD_R	add 	%r4, %r11, %r27
	.word 0xa209800f  ! 82: AND_R	and 	%r6, %r15, %r17
	.word 0xaa118009  ! 82: OR_R	or 	%r6, %r9, %r21
	.word 0xa811267d  ! 82: OR_I	or 	%r4, 0x067d, %r20
	.word 0xae09c00f  ! 82: AND_R	and 	%r7, %r15, %r23
	.word 0xac01c009  ! 82: ADD_R	add 	%r7, %r9, %r22
	.word 0xbe11000b  ! 82: OR_R	or 	%r4, %r11, %r31
	.word 0xa811400f  ! 82: OR_R	or 	%r5, %r15, %r20
	.word 0xaa09800b  ! 82: AND_R	and 	%r6, %r11, %r21
	.word 0xae09000e  ! 82: AND_R	and 	%r4, %r14, %r23
	.word 0xb809400f  ! 82: AND_R	and 	%r5, %r15, %r28
	.word 0xbe0160ce  ! 82: ADD_I	add 	%r5, 0x00ce, %r31
	.word 0xaa00e5ed  ! 82: ADD_I	add 	%r3, 0x05ed, %r21
	.word 0xb201c00b  ! 82: ADD_R	add 	%r7, %r11, %r25
	.word 0xa6112db7  ! 82: OR_I	or 	%r4, 0x0db7, %r19
	.word 0xac096c30  ! 82: AND_I	and 	%r5, 0x0c30, %r22
	.word 0xbe0a000e  ! 82: AND_R	and 	%r8, %r14, %r31
	.word 0xa401000f  ! 82: ADD_R	add 	%r4, %r15, %r18
	.word 0xb208e932  ! 82: AND_I	and 	%r3, 0x0932, %r25
	.word 0xa801400b  ! 82: ADD_R	add 	%r5, %r11, %r20
	.word 0xb01168fd  ! 82: OR_I	or 	%r5, 0x08fd, %r24
	.word 0xb210e5f9  ! 82: OR_I	or 	%r3, 0x05f9, %r25
	.word 0xb811000e  ! 82: OR_R	or 	%r4, %r14, %r28
	.word 0xac116c94  ! 82: OR_I	or 	%r5, 0x0c94, %r22
	.word 0xb601800f  ! 82: ADD_R	add 	%r6, %r15, %r27
	.word 0xbc096f1f  ! 82: AND_I	and 	%r5, 0x0f1f, %r30
	.word 0xbc01e8ac  ! 82: ADD_I	add 	%r7, 0x08ac, %r30
	.word 0xb211000c  ! 82: OR_R	or 	%r4, %r12, %r25
	.word 0xae014009  ! 82: ADD_R	add 	%r5, %r9, %r23
	.word 0xa401c00a  ! 82: ADD_R	add 	%r7, %r10, %r18
	.word 0xa209000a  ! 82: AND_R	and 	%r4, %r10, %r17
	.word 0xa201612a  ! 82: ADD_I	add 	%r5, 0x012a, %r17
	.word 0xa611400d  ! 82: OR_R	or 	%r5, %r13, %r19
	.word 0xae012785  ! 82: ADD_I	add 	%r4, 0x0785, %r23
	.word 0xba10e5c2  ! 82: OR_I	or 	%r3, 0x05c2, %r29
	.word 0xae08c00a  ! 82: AND_R	and 	%r3, %r10, %r23
	.word 0xac09000c  ! 82: AND_R	and 	%r4, %r12, %r22
	.word 0xb811eaf0  ! 82: OR_I	or 	%r7, 0x0af0, %r28
	.word 0xb412000c  ! 82: OR_R	or 	%r8, %r12, %r26
	.word 0xac09ec33  ! 82: AND_I	and 	%r7, 0x0c33, %r22
	.word 0xba01c009  ! 82: ADD_R	add 	%r7, %r9, %r29
	.word 0xb00223aa  ! 82: ADD_I	add 	%r8, 0x03aa, %r24
	.word 0xaa122aaa  ! 82: OR_I	or 	%r8, 0x0aaa, %r21
	.word 0xb409c00b  ! 82: AND_R	and 	%r7, %r11, %r26
	.word 0xb401c00e  ! 82: ADD_R	add 	%r7, %r14, %r26
	.word 0xac11a9df  ! 82: OR_I	or 	%r6, 0x09df, %r22
	.word 0xa4018009  ! 82: ADD_R	add 	%r6, %r9, %r18
	.word 0xb4120009  ! 82: OR_R	or 	%r8, %r9, %r26
	.word 0xaa08e608  ! 82: AND_I	and 	%r3, 0x0608, %r21
	.word 0xb011a7ff  ! 82: OR_I	or 	%r6, 0x07ff, %r24
	.word 0xa800e142  ! 82: ADD_I	add 	%r3, 0x0142, %r20
	.word 0xaa122e46  ! 82: OR_I	or 	%r8, 0x0e46, %r21
	.word 0xb001800c  ! 82: ADD_R	add 	%r6, %r12, %r24
	.word 0xae11800a  ! 82: OR_R	or 	%r6, %r10, %r23
	.word 0xba0a000c  ! 82: AND_R	and 	%r8, %r12, %r29
	.word 0xa411800c  ! 82: OR_R	or 	%r6, %r12, %r18
	.word 0xa810eaea  ! 82: OR_I	or 	%r3, 0x0aea, %r20
	.word 0xba10c00f  ! 82: OR_R	or 	%r3, %r15, %r29
	.word 0xa6022262  ! 82: ADD_I	add 	%r8, 0x0262, %r19
	.word 0xac0a000d  ! 82: AND_R	and 	%r8, %r13, %r22
	.word 0xaa08c00c  ! 82: AND_R	and 	%r3, %r12, %r21
	.word 0xb001800c  ! 82: ADD_R	add 	%r6, %r12, %r24
	.word 0xb411000b  ! 82: OR_R	or 	%r4, %r11, %r26
	.word 0xa2016af6  ! 82: ADD_I	add 	%r5, 0x0af6, %r17
	.word 0xb801000f  ! 82: ADD_R	add 	%r4, %r15, %r28
	.word 0xa801400e  ! 82: ADD_R	add 	%r5, %r14, %r20
	.word 0xb611000b  ! 82: OR_R	or 	%r4, %r11, %r27
	.word 0xaa00e8c0  ! 82: ADD_I	add 	%r3, 0x08c0, %r21
	.word 0xb809400a  ! 82: AND_R	and 	%r5, %r10, %r28
	.word 0xba11800b  ! 82: OR_R	or 	%r6, %r11, %r29
	.word 0xa80227f8  ! 82: ADD_I	add 	%r8, 0x07f8, %r20
	.word 0xb20a2e35  ! 82: AND_I	and 	%r8, 0x0e35, %r25
	.word 0xaa112161  ! 82: OR_I	or 	%r4, 0x0161, %r21
	.word 0xa6022f8a  ! 82: ADD_I	add 	%r8, 0x0f8a, %r19
	.word 0xb009289d  ! 82: AND_I	and 	%r4, 0x089d, %r24
	.word 0xac09400f  ! 82: AND_R	and 	%r5, %r15, %r22
	.word 0xac08c00b  ! 82: AND_R	and 	%r3, %r11, %r22
	.word 0xb611800b  ! 82: OR_R	or 	%r6, %r11, %r27
	.word 0xb401000e  ! 82: ADD_R	add 	%r4, %r14, %r26
	.word 0xbc00c00e  ! 82: ADD_R	add 	%r3, %r14, %r30
	.word 0xa209a1d8  ! 82: AND_I	and 	%r6, 0x01d8, %r17
	.word 0xa20161c8  ! 82: ADD_I	add 	%r5, 0x01c8, %r17
	.word 0xa802000a  ! 82: ADD_R	add 	%r8, %r10, %r20
	.word 0xbc10e13d  ! 82: OR_I	or 	%r3, 0x013d, %r30
	.word 0xb0092a45  ! 82: AND_I	and 	%r4, 0x0a45, %r24
	.word 0xbc11800c  ! 82: OR_R	or 	%r6, %r12, %r30
	.word 0xb609666d  ! 82: AND_I	and 	%r5, 0x066d, %r27
	.word 0xa801000d  ! 82: ADD_R	add 	%r4, %r13, %r20
	.word 0xa209400b  ! 82: AND_R	and 	%r5, %r11, %r17
	.word 0xb61223e9  ! 82: OR_I	or 	%r8, 0x03e9, %r27
	.word 0xb4012fb3  ! 82: ADD_I	add 	%r4, 0x0fb3, %r26
	.word 0xbc10c00d  ! 82: OR_R	or 	%r3, %r13, %r30
	.word 0xb6092002  ! 82: AND_I	and 	%r4, 0x0002, %r27
	.word 0xb208c00d  ! 82: AND_R	and 	%r3, %r13, %r25
	.word 0xb008ed27  ! 82: AND_I	and 	%r3, 0x0d27, %r24
	.word 0xbc10e28a  ! 82: OR_I	or 	%r3, 0x028a, %r30
	.word 0xa210ea3f  ! 82: OR_I	or 	%r3, 0x0a3f, %r17
	.word 0xb601800a  ! 82: ADD_R	add 	%r6, %r10, %r27
	.word 0xb00921d3  ! 82: AND_I	and 	%r4, 0x01d3, %r24
	.word 0xa201000b  ! 82: ADD_R	add 	%r4, %r11, %r17
	.word 0xb4016e14  ! 82: ADD_I	add 	%r5, 0x0e14, %r26
	.word 0xaa11e3ca  ! 82: OR_I	or 	%r7, 0x03ca, %r21
	.word 0xac02000e  ! 82: ADD_R	add 	%r8, %r14, %r22
	.word 0xb601800d  ! 82: ADD_R	add 	%r6, %r13, %r27
	.word 0xb601e2ff  ! 82: ADD_I	add 	%r7, 0x02ff, %r27
	.word 0xb208e458  ! 82: AND_I	and 	%r3, 0x0458, %r25
	.word 0xb6018009  ! 82: ADD_R	add 	%r6, %r9, %r27
	.word 0xaa02000f  ! 82: ADD_R	add 	%r8, %r15, %r21
	.word 0xa800e4c1  ! 82: ADD_I	add 	%r3, 0x04c1, %r20
	.word 0xac09000d  ! 82: AND_R	and 	%r4, %r13, %r22
	.word 0xb409c00d  ! 82: AND_R	and 	%r7, %r13, %r26
	.word 0xa209000a  ! 82: AND_R	and 	%r4, %r10, %r17
	.word 0xaa09a9f3  ! 82: AND_I	and 	%r6, 0x09f3, %r21
	.word 0xae01400a  ! 82: ADD_R	add 	%r5, %r10, %r23
	.word 0xae01e538  ! 82: ADD_I	add 	%r7, 0x0538, %r23
	.word 0xae0220fd  ! 82: ADD_I	add 	%r8, 0x00fd, %r23
	.word 0xa210c00e  ! 82: OR_R	or 	%r3, %r14, %r17
	.word 0xba11400a  ! 82: OR_R	or 	%r5, %r10, %r29
	.word 0xae0a2dba  ! 82: AND_I	and 	%r8, 0x0dba, %r23
	.word 0xbe11e1c3  ! 82: OR_I	or 	%r7, 0x01c3, %r31
	.word 0xb201000f  ! 82: ADD_R	add 	%r4, %r15, %r25
	.word 0xac09800d  ! 82: AND_R	and 	%r6, %r13, %r22
	.word 0xa609000b  ! 82: AND_R	and 	%r4, %r11, %r19
	.word 0xb610e472  ! 82: OR_I	or 	%r3, 0x0472, %r27
	.word 0xb611a57a  ! 82: OR_I	or 	%r6, 0x057a, %r27
	.word 0xb401c009  ! 82: ADD_R	add 	%r7, %r9, %r26
	.word 0xb602243b  ! 82: ADD_I	add 	%r8, 0x043b, %r27
	.word 0xa602000d  ! 82: ADD_R	add 	%r8, %r13, %r19
	.word 0xb201a60c  ! 82: ADD_I	add 	%r6, 0x060c, %r25
	.word 0xb801a57a  ! 82: ADD_I	add 	%r6, 0x057a, %r28
	.word 0xae01ef0b  ! 82: ADD_I	add 	%r7, 0x0f0b, %r23
	.word 0xb402000b  ! 82: ADD_R	add 	%r8, %r11, %r26
	.word 0xb409c00d  ! 82: AND_R	and 	%r7, %r13, %r26
	.word 0xb808eff4  ! 82: AND_I	and 	%r3, 0x0ff4, %r28
	.word 0xb001000f  ! 82: ADD_R	add 	%r4, %r15, %r24
	.word 0xa611000f  ! 82: OR_R	or 	%r4, %r15, %r19
	.word 0xb811800e  ! 82: OR_R	or 	%r6, %r14, %r28
	.word 0xb402000a  ! 82: ADD_R	add 	%r8, %r10, %r26
	.word 0xac08e605  ! 82: AND_I	and 	%r3, 0x0605, %r22
	.word 0xa801299d  ! 82: ADD_I	add 	%r4, 0x099d, %r20
	.word 0xb8122179  ! 82: OR_I	or 	%r8, 0x0179, %r28
	.word 0xb212000b  ! 82: OR_R	or 	%r8, %r11, %r25
	.word 0xa611000d  ! 82: OR_R	or 	%r4, %r13, %r19
	.word 0xb411642c  ! 82: OR_I	or 	%r5, 0x042c, %r26
	.word 0xa611000d  ! 82: OR_R	or 	%r4, %r13, %r19
	.word 0xae0a000b  ! 82: AND_R	and 	%r8, %r11, %r23
	.word 0xac016f5c  ! 82: ADD_I	add 	%r5, 0x0f5c, %r22
	.word 0xae098009  ! 82: AND_R	and 	%r6, %r9, %r23
	.word 0xb002000e  ! 82: ADD_R	add 	%r8, %r14, %r24
	.word 0xaa0124fb  ! 82: ADD_I	add 	%r4, 0x04fb, %r21
	.word 0xbc12000d  ! 82: OR_R	or 	%r8, %r13, %r30
	.word 0xbe09400b  ! 82: AND_R	and 	%r5, %r11, %r31
	.word 0xa809800e  ! 82: AND_R	and 	%r6, %r14, %r20
	.word 0xb2116682  ! 82: OR_I	or 	%r5, 0x0682, %r25
	.word 0xa211a22b  ! 82: OR_I	or 	%r6, 0x022b, %r17
	.word 0xb001000f  ! 82: ADD_R	add 	%r4, %r15, %r24
	.word 0xb601a727  ! 82: ADD_I	add 	%r6, 0x0727, %r27
	.word 0xa8114009  ! 82: OR_R	or 	%r5, %r9, %r20
	.word 0xa810c00e  ! 82: OR_R	or 	%r3, %r14, %r20
	.word 0xac01c00e  ! 82: ADD_R	add 	%r7, %r14, %r22
	.word 0xac1165f5  ! 82: OR_I	or 	%r5, 0x05f5, %r22
	.word 0xaa12000e  ! 82: OR_R	or 	%r8, %r14, %r21
	.word 0xbe09800e  ! 82: AND_R	and 	%r6, %r14, %r31
	.word 0xb0092d53  ! 82: AND_I	and 	%r4, 0x0d53, %r24
	.word 0xbc11aadf  ! 82: OR_I	or 	%r6, 0x0adf, %r30
	.word 0xae08c00b  ! 82: AND_R	and 	%r3, %r11, %r23
	.word 0xb802202d  ! 82: ADD_I	add 	%r8, 0x002d, %r28
	.word 0xa401c00c  ! 82: ADD_R	add 	%r7, %r12, %r18
	.word 0xb210c00d  ! 82: OR_R	or 	%r3, %r13, %r25
	.word 0xaa098009  ! 82: AND_R	and 	%r6, %r9, %r21
	.word 0xa2096582  ! 82: AND_I	and 	%r5, 0x0582, %r17
	.word 0xa212000d  ! 82: OR_R	or 	%r8, %r13, %r17
	.word 0xaa0a000a  ! 82: AND_R	and 	%r8, %r10, %r21
	.word 0xa60122d9  ! 82: ADD_I	add 	%r4, 0x02d9, %r19
	.word 0xbc09c00e  ! 82: AND_R	and 	%r7, %r14, %r30
	.word 0xaa11664b  ! 82: OR_I	or 	%r5, 0x064b, %r21
	.word 0xba11800f  ! 82: OR_R	or 	%r6, %r15, %r29
	.word 0xb801a665  ! 82: ADD_I	add 	%r6, 0x0665, %r28
	.word 0xa801a0d5  ! 82: ADD_I	add 	%r6, 0x00d5, %r20
	.word 0xaa0a000f  ! 82: AND_R	and 	%r8, %r15, %r21
	.word 0xa611e35d  ! 82: OR_I	or 	%r7, 0x035d, %r19
	.word 0xa211400e  ! 82: OR_R	or 	%r5, %r14, %r17
	.word 0xf4212528  ! 82: STW_I	stw	%r26, [%r4 + 0x0528]
	.word 0xfc29a647  ! 82: STB_I	stb	%r30, [%r6 + 0x0647]
	.word 0xea28e21e  ! 82: STB_I	stb	%r21, [%r3 + 0x021e]
	.word 0xf4716f90  ! 82: STX_I	stx	%r26, [%r5 + 0x0f90]
	.word 0xf2712100  ! 82: STX_I	stx	%r25, [%r4 + 0x0100]
	.word 0xf6316d5a  ! 83: STH_I	sth	%r27, [%r5 + 0x0d5a]
	.word 0xa618eb12  ! 84: XOR_I	xor 	%r3, 0x0b12, %r19
	.word 0xe8216d2c  ! 85: STW_I	stw	%r20, [%r5 + 0x0d2c]
	.word 0xe6312996  ! 86: STH_I	sth	%r19, [%r4 + 0x0996]
	.word 0xa271c00f  ! 87: UDIV_R	udiv 	%r7, %r15, %r17
	.word 0xb411e997  ! 87: OR_I	or 	%r7, 0x0997, %r26
	.word 0xa609c00f  ! 87: AND_R	and 	%r7, %r15, %r19
	.word 0xb0094009  ! 87: AND_R	and 	%r5, %r9, %r24
	bne thr0_loop_6
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_7:
	.word 0xa60a0009  ! 93: AND_R	and 	%r8, %r9, %r19
	.word 0xb4120009  ! 93: OR_R	or 	%r8, %r9, %r26
	.word 0xbc08c00e  ! 93: AND_R	and 	%r3, %r14, %r30
	.word 0xbe01e544  ! 93: ADD_I	add 	%r7, 0x0544, %r31
	.word 0xae0a0009  ! 93: AND_R	and 	%r8, %r9, %r23
	.word 0xaa11a4fb  ! 93: OR_I	or 	%r6, 0x04fb, %r21
	.word 0xa411a63b  ! 93: OR_I	or 	%r6, 0x063b, %r18
	.word 0xa201c00a  ! 93: ADD_R	add 	%r7, %r10, %r17
	.word 0xaa09a5f7  ! 93: AND_I	and 	%r6, 0x05f7, %r21
	.word 0xa6122d8d  ! 93: OR_I	or 	%r8, 0x0d8d, %r19
	.word 0xa4122d0b  ! 93: OR_I	or 	%r8, 0x0d0b, %r18
	.word 0xa40167d2  ! 93: ADD_I	add 	%r5, 0x07d2, %r18
	.word 0xb609000e  ! 93: AND_R	and 	%r4, %r14, %r27
	.word 0xaa11800b  ! 93: OR_R	or 	%r6, %r11, %r21
	.word 0xa40a2108  ! 93: AND_I	and 	%r8, 0x0108, %r18
	.word 0xb810e394  ! 93: OR_I	or 	%r3, 0x0394, %r28
	.word 0xb409800c  ! 93: AND_R	and 	%r6, %r12, %r26
	.word 0xae01000b  ! 93: ADD_R	add 	%r4, %r11, %r23
	.word 0xb00226f2  ! 93: ADD_I	add 	%r8, 0x06f2, %r24
	.word 0xaa012782  ! 93: ADD_I	add 	%r4, 0x0782, %r21
	.word 0xa2016de0  ! 93: ADD_I	add 	%r5, 0x0de0, %r17
	.word 0xba02000a  ! 93: ADD_R	add 	%r8, %r10, %r29
	.word 0xaa08c00a  ! 93: AND_R	and 	%r3, %r10, %r21
	.word 0xa2022806  ! 93: ADD_I	add 	%r8, 0x0806, %r17
	.word 0xb80a23fa  ! 93: AND_I	and 	%r8, 0x03fa, %r28
	.word 0xae09ab5b  ! 93: AND_I	and 	%r6, 0x0b5b, %r23
	.word 0xb612000a  ! 93: OR_R	or 	%r8, %r10, %r27
	.word 0xa80227fa  ! 93: ADD_I	add 	%r8, 0x07fa, %r20
	.word 0xa8096be1  ! 93: AND_I	and 	%r5, 0x0be1, %r20
	.word 0xba01400f  ! 93: ADD_R	add 	%r5, %r15, %r29
	.word 0xb001c00a  ! 93: ADD_R	add 	%r7, %r10, %r24
	.word 0xa809800c  ! 93: AND_R	and 	%r6, %r12, %r20
	.word 0xb409c00f  ! 93: AND_R	and 	%r7, %r15, %r26
	.word 0xb400ece5  ! 93: ADD_I	add 	%r3, 0x0ce5, %r26
	.word 0xba0921a5  ! 93: AND_I	and 	%r4, 0x01a5, %r29
	.word 0xb601400c  ! 93: ADD_R	add 	%r5, %r12, %r27
	.word 0xa801800d  ! 93: ADD_R	add 	%r6, %r13, %r20
	.word 0xbc08ec0d  ! 93: AND_I	and 	%r3, 0x0c0d, %r30
	.word 0xbe0121cc  ! 93: ADD_I	add 	%r4, 0x01cc, %r31
	.word 0xb411c00c  ! 93: OR_R	or 	%r7, %r12, %r26
	.word 0xb611400a  ! 93: OR_R	or 	%r5, %r10, %r27
	.word 0xb409c00e  ! 93: AND_R	and 	%r7, %r14, %r26
	.word 0xbc096c20  ! 93: AND_I	and 	%r5, 0x0c20, %r30
	.word 0xac10e669  ! 93: OR_I	or 	%r3, 0x0669, %r22
	.word 0xa809800f  ! 93: AND_R	and 	%r6, %r15, %r20
	.word 0xae09eb4e  ! 93: AND_I	and 	%r7, 0x0b4e, %r23
	.word 0xa409286a  ! 93: AND_I	and 	%r4, 0x086a, %r18
	.word 0xbe01000e  ! 93: ADD_R	add 	%r4, %r14, %r31
	.word 0xac0227f4  ! 93: ADD_I	add 	%r8, 0x07f4, %r22
	.word 0xb60a2fc6  ! 93: AND_I	and 	%r8, 0x0fc6, %r27
	.word 0xa40928db  ! 93: AND_I	and 	%r4, 0x08db, %r18
	.word 0xac08c00c  ! 93: AND_R	and 	%r3, %r12, %r22
	.word 0xac11a12f  ! 93: OR_I	or 	%r6, 0x012f, %r22
	.word 0xa61160e2  ! 93: OR_I	or 	%r5, 0x00e2, %r19
	.word 0xac0960d5  ! 93: AND_I	and 	%r5, 0x00d5, %r22
	.word 0xb009000e  ! 93: AND_R	and 	%r4, %r14, %r24
	.word 0xbc00c00d  ! 93: ADD_R	add 	%r3, %r13, %r30
	.word 0xba098009  ! 93: AND_R	and 	%r6, %r9, %r29
	.word 0xba09a0d7  ! 93: AND_I	and 	%r6, 0x00d7, %r29
	.word 0xb609694f  ! 93: AND_I	and 	%r5, 0x094f, %r27
	.word 0xbc01800c  ! 93: ADD_R	add 	%r6, %r12, %r30
	.word 0xba01400d  ! 93: ADD_R	add 	%r5, %r13, %r29
	.word 0xa80a23bb  ! 93: AND_I	and 	%r8, 0x03bb, %r20
	.word 0xa411a616  ! 93: OR_I	or 	%r6, 0x0616, %r18
	.word 0xa611c00a  ! 93: OR_R	or 	%r7, %r10, %r19
	.word 0xba09a74a  ! 93: AND_I	and 	%r6, 0x074a, %r29
	.word 0xa609000b  ! 93: AND_R	and 	%r4, %r11, %r19
	.word 0xb610c00f  ! 93: OR_R	or 	%r3, %r15, %r27
	.word 0xba0a000e  ! 93: AND_R	and 	%r8, %r14, %r29
	.word 0xaa09400c  ! 93: AND_R	and 	%r5, %r12, %r21
	.word 0xa412253c  ! 93: OR_I	or 	%r8, 0x053c, %r18
	.word 0xba122756  ! 93: OR_I	or 	%r8, 0x0756, %r29
	.word 0xb401000e  ! 93: ADD_R	add 	%r4, %r14, %r26
	.word 0xae116df7  ! 93: OR_I	or 	%r5, 0x0df7, %r23
	.word 0xa201c00d  ! 93: ADD_R	add 	%r7, %r13, %r17
	.word 0xb60a2bdc  ! 93: AND_I	and 	%r8, 0x0bdc, %r27
	.word 0xb202000a  ! 93: ADD_R	add 	%r8, %r10, %r25
	.word 0xbe022862  ! 93: ADD_I	add 	%r8, 0x0862, %r31
	.word 0xaa01c00a  ! 93: ADD_R	add 	%r7, %r10, %r21
	.word 0xb809e396  ! 93: AND_I	and 	%r7, 0x0396, %r28
	.word 0xa409ac36  ! 93: AND_I	and 	%r6, 0x0c36, %r18
	.word 0xa210e0c2  ! 93: OR_I	or 	%r3, 0x00c2, %r17
	.word 0xbe11ace7  ! 93: OR_I	or 	%r6, 0x0ce7, %r31
	.word 0xb411000c  ! 93: OR_R	or 	%r4, %r12, %r26
	.word 0xb0012de9  ! 93: ADD_I	add 	%r4, 0x0de9, %r24
	.word 0xbe00c00b  ! 93: ADD_R	add 	%r3, %r11, %r31
	.word 0xb000e1cb  ! 93: ADD_I	add 	%r3, 0x01cb, %r24
	.word 0xb00129fd  ! 93: ADD_I	add 	%r4, 0x09fd, %r24
	.word 0xac12000e  ! 93: OR_R	or 	%r8, %r14, %r22
	.word 0xbc112cab  ! 93: OR_I	or 	%r4, 0x0cab, %r30
	.word 0xb811c00f  ! 93: OR_R	or 	%r7, %r15, %r28
	.word 0xb001400c  ! 93: ADD_R	add 	%r5, %r12, %r24
	.word 0xba11aff3  ! 93: OR_I	or 	%r6, 0x0ff3, %r29
	.word 0xbe0a2c18  ! 93: AND_I	and 	%r8, 0x0c18, %r31
	.word 0xb209000d  ! 93: AND_R	and 	%r4, %r13, %r25
	.word 0xb409e4cf  ! 93: AND_I	and 	%r7, 0x04cf, %r26
	.word 0xa6094009  ! 93: AND_R	and 	%r5, %r9, %r19
	.word 0xba09a41a  ! 93: AND_I	and 	%r6, 0x041a, %r29
	.word 0xa401c00f  ! 93: ADD_R	add 	%r7, %r15, %r18
	.word 0xba01ea17  ! 93: ADD_I	add 	%r7, 0x0a17, %r29
	.word 0xb600c00a  ! 93: ADD_R	add 	%r3, %r10, %r27
	.word 0xa6016a74  ! 93: ADD_I	add 	%r5, 0x0a74, %r19
	.word 0xa200e95d  ! 93: ADD_I	add 	%r3, 0x095d, %r17
	.word 0xa610c00e  ! 93: OR_R	or 	%r3, %r14, %r19
	.word 0xa40a2e07  ! 93: AND_I	and 	%r8, 0x0e07, %r18
	.word 0xb8016e10  ! 93: ADD_I	add 	%r5, 0x0e10, %r28
	.word 0xa800e211  ! 93: ADD_I	add 	%r3, 0x0211, %r20
	.word 0xaa01a4b1  ! 93: ADD_I	add 	%r6, 0x04b1, %r21
	.word 0xb411e417  ! 93: OR_I	or 	%r7, 0x0417, %r26
	.word 0xb209000a  ! 93: AND_R	and 	%r4, %r10, %r25
	.word 0xb611400e  ! 93: OR_R	or 	%r5, %r14, %r27
	.word 0xfe296911  ! 93: STB_I	stb	%r31, [%r5 + 0x0911]
	.word 0xec21eacc  ! 93: STW_I	stw	%r22, [%r7 + 0x0acc]
	.word 0xea312fc0  ! 93: STH_I	sth	%r21, [%r4 + 0x0fc0]
	.word 0xfe31e3f6  ! 93: STH_I	sth	%r31, [%r7 + 0x03f6]
	.word 0xea2220a4  ! 93: STW_I	stw	%r21, [%r8 + 0x00a4]
	.word 0xf6296c85  ! 95: STB_I	stb	%r27, [%r5 + 0x0c85]
	.word 0xae010045
	.word 0xf429206c  ! 97: STB_I	stb	%r26, [%r4 + 0x006c]
	.word 0xea71ad50  ! 98: STX_I	stx	%r21, [%r6 + 0x0d50]
	.word 0xec49afc4  ! 99: LDSB_I	ldsb	[%r6 + 0x0fc4], %r22
	.word 0xb80a000c  ! 99: AND_R	and 	%r8, %r12, %r28
	.word 0xbe01a8c6  ! 99: ADD_I	add 	%r6, 0x08c6, %r31
	.word 0xa801000e  ! 99: ADD_R	add 	%r4, %r14, %r20
	bne thr0_loop_7
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_8:
	.word 0xaa12000f  ! 105: OR_R	or 	%r8, %r15, %r21
	.word 0xba09400b  ! 105: AND_R	and 	%r5, %r11, %r29
	.word 0xa811800e  ! 105: OR_R	or 	%r6, %r14, %r20
	.word 0xb802000a  ! 105: ADD_R	add 	%r8, %r10, %r28
	.word 0xb611800e  ! 105: OR_R	or 	%r6, %r14, %r27
	.word 0xbc096340  ! 105: AND_I	and 	%r5, 0x0340, %r30
	.word 0xa801af87  ! 105: ADD_I	add 	%r6, 0x0f87, %r20
	.word 0xae01c00f  ! 105: ADD_R	add 	%r7, %r15, %r23
	.word 0xb211c00c  ! 105: OR_R	or 	%r7, %r12, %r25
	.word 0xae122852  ! 105: OR_I	or 	%r8, 0x0852, %r23
	.word 0xb801e287  ! 105: ADD_I	add 	%r7, 0x0287, %r28
	.word 0xac01663e  ! 105: ADD_I	add 	%r5, 0x063e, %r22
	.word 0xa209400c  ! 105: AND_R	and 	%r5, %r12, %r17
	.word 0xb012000e  ! 105: OR_R	or 	%r8, %r14, %r24
	.word 0xb811299e  ! 105: OR_I	or 	%r4, 0x099e, %r28
	.word 0xb601abb1  ! 105: ADD_I	add 	%r6, 0x0bb1, %r27
	.word 0xa8116d34  ! 105: OR_I	or 	%r5, 0x0d34, %r20
	.word 0xb210c00e  ! 105: OR_R	or 	%r3, %r14, %r25
	.word 0xb801400a  ! 105: ADD_R	add 	%r5, %r10, %r28
	.word 0xb809400f  ! 105: AND_R	and 	%r5, %r15, %r28
	.word 0xb611a855  ! 105: OR_I	or 	%r6, 0x0855, %r27
	.word 0xaa09a242  ! 105: AND_I	and 	%r6, 0x0242, %r21
	.word 0xbe08ed7e  ! 105: AND_I	and 	%r3, 0x0d7e, %r31
	.word 0xae00ee01  ! 105: ADD_I	add 	%r3, 0x0e01, %r23
	.word 0xb0092209  ! 105: AND_I	and 	%r4, 0x0209, %r24
	.word 0xa8112c55  ! 105: OR_I	or 	%r4, 0x0c55, %r20
	.word 0xa809800e  ! 105: AND_R	and 	%r6, %r14, %r20
	.word 0xb411800d  ! 105: OR_R	or 	%r6, %r13, %r26
	.word 0xb8116ffa  ! 105: OR_I	or 	%r5, 0x0ffa, %r28
	.word 0xa801000a  ! 105: ADD_R	add 	%r4, %r10, %r20
	.word 0xaa09afd3  ! 105: AND_I	and 	%r6, 0x0fd3, %r21
	.word 0xba09000c  ! 105: AND_R	and 	%r4, %r12, %r29
	.word 0xa610c00a  ! 105: OR_R	or 	%r3, %r10, %r19
	.word 0xa810c00a  ! 105: OR_R	or 	%r3, %r10, %r20
	.word 0xa80a000d  ! 105: AND_R	and 	%r8, %r13, %r20
	.word 0xac112b80  ! 105: OR_I	or 	%r4, 0x0b80, %r22
	.word 0xa409400b  ! 105: AND_R	and 	%r5, %r11, %r18
	.word 0xa211400a  ! 105: OR_R	or 	%r5, %r10, %r17
	.word 0xba09c00a  ! 105: AND_R	and 	%r7, %r10, %r29
	.word 0xa201400e  ! 105: ADD_R	add 	%r5, %r14, %r17
	.word 0xb80929c4  ! 105: AND_I	and 	%r4, 0x09c4, %r28
	.word 0xa601ef5b  ! 105: ADD_I	add 	%r7, 0x0f5b, %r19
	.word 0xac012cef  ! 105: ADD_I	add 	%r4, 0x0cef, %r22
	.word 0xa800c009  ! 105: ADD_R	add 	%r3, %r9, %r20
	.word 0xb211000e  ! 105: OR_R	or 	%r4, %r14, %r25
	.word 0xb009800c  ! 105: AND_R	and 	%r6, %r12, %r24
	.word 0xbe09efd9  ! 105: AND_I	and 	%r7, 0x0fd9, %r31
	.word 0xbc11ab7d  ! 105: OR_I	or 	%r6, 0x0b7d, %r30
	.word 0xac08c00e  ! 105: AND_R	and 	%r3, %r14, %r22
	.word 0xb608c00f  ! 105: AND_R	and 	%r3, %r15, %r27
	.word 0xbc10c00a  ! 105: OR_R	or 	%r3, %r10, %r30
	.word 0xa4112ae6  ! 105: OR_I	or 	%r4, 0x0ae6, %r18
	.word 0xaa12000b  ! 105: OR_R	or 	%r8, %r11, %r21
	.word 0xae10c00c  ! 105: OR_R	or 	%r3, %r12, %r23
	.word 0xa201c00b  ! 105: ADD_R	add 	%r7, %r11, %r17
	.word 0xa401c00a  ! 105: ADD_R	add 	%r7, %r10, %r18
	.word 0xaa11a3fd  ! 105: OR_I	or 	%r6, 0x03fd, %r21
	.word 0xb211e191  ! 105: OR_I	or 	%r7, 0x0191, %r25
	.word 0xa810e21f  ! 105: OR_I	or 	%r3, 0x021f, %r20
	.word 0xac02000e  ! 105: ADD_R	add 	%r8, %r14, %r22
	.word 0xaa11a4ee  ! 105: OR_I	or 	%r6, 0x04ee, %r21
	.word 0xbc11a25d  ! 105: OR_I	or 	%r6, 0x025d, %r30
	.word 0xb0110009  ! 105: OR_R	or 	%r4, %r9, %r24
	.word 0xb20a23f1  ! 105: AND_I	and 	%r8, 0x03f1, %r25
	.word 0xa80921be  ! 105: AND_I	and 	%r4, 0x01be, %r20
	.word 0xa408c00a  ! 105: AND_R	and 	%r3, %r10, %r18
	.word 0xba02000b  ! 105: ADD_R	add 	%r8, %r11, %r29
	.word 0xa608c00e  ! 105: AND_R	and 	%r3, %r14, %r19
	.word 0xae0a291e  ! 105: AND_I	and 	%r8, 0x091e, %r23
	.word 0xa2010009  ! 105: ADD_R	add 	%r4, %r9, %r17
	.word 0xa4112eb8  ! 105: OR_I	or 	%r4, 0x0eb8, %r18
	.word 0xbe09800c  ! 105: AND_R	and 	%r6, %r12, %r31
	.word 0xac09000a  ! 105: AND_R	and 	%r4, %r10, %r22
	.word 0xa200e3da  ! 105: ADD_I	add 	%r3, 0x03da, %r17
	.word 0xbe01400e  ! 105: ADD_R	add 	%r5, %r14, %r31
	.word 0xb0118009  ! 105: OR_R	or 	%r6, %r9, %r24
	.word 0xaa0927cb  ! 105: AND_I	and 	%r4, 0x07cb, %r21
	.word 0xbc12000f  ! 105: OR_R	or 	%r8, %r15, %r30
	.word 0xa20169b5  ! 105: ADD_I	add 	%r5, 0x09b5, %r17
	.word 0xb011400b  ! 105: OR_R	or 	%r5, %r11, %r24
	.word 0xb009000a  ! 105: AND_R	and 	%r4, %r10, %r24
	.word 0xba08c00d  ! 105: AND_R	and 	%r3, %r13, %r29
	.word 0xae09000d  ! 105: AND_R	and 	%r4, %r13, %r23
	.word 0xb009000d  ! 105: AND_R	and 	%r4, %r13, %r24
	.word 0xb8012878  ! 105: ADD_I	add 	%r4, 0x0878, %r28
	.word 0xa809e5b4  ! 105: AND_I	and 	%r7, 0x05b4, %r20
	.word 0xaa1165dc  ! 105: OR_I	or 	%r5, 0x05dc, %r21
	.word 0xbe00e7c0  ! 105: ADD_I	add 	%r3, 0x07c0, %r31
	.word 0xb001000e  ! 105: ADD_R	add 	%r4, %r14, %r24
	.word 0xb408e4d7  ! 105: AND_I	and 	%r3, 0x04d7, %r26
	.word 0xa411400a  ! 105: OR_R	or 	%r5, %r10, %r18
	.word 0xb801c00f  ! 105: ADD_R	add 	%r7, %r15, %r28
	.word 0xb611e0e9  ! 105: OR_I	or 	%r7, 0x00e9, %r27
	.word 0xb2018009  ! 105: ADD_R	add 	%r6, %r9, %r25
	.word 0xa8012c97  ! 105: ADD_I	add 	%r4, 0x0c97, %r20
	.word 0xb21121d1  ! 105: OR_I	or 	%r4, 0x01d1, %r25
	.word 0xa2016e78  ! 105: ADD_I	add 	%r5, 0x0e78, %r17
	.word 0xb401000d  ! 105: ADD_R	add 	%r4, %r13, %r26
	.word 0xa201a93c  ! 105: ADD_I	add 	%r6, 0x093c, %r17
	.word 0xb601800d  ! 105: ADD_R	add 	%r6, %r13, %r27
	.word 0xb401e96d  ! 105: ADD_I	add 	%r7, 0x096d, %r26
	.word 0xae01c009  ! 105: ADD_R	add 	%r7, %r9, %r23
	.word 0xbc11400d  ! 105: OR_R	or 	%r5, %r13, %r30
	.word 0xa601400b  ! 105: ADD_R	add 	%r5, %r11, %r19
	.word 0xba09800d  ! 105: AND_R	and 	%r6, %r13, %r29
	.word 0xbe0a000f  ! 105: AND_R	and 	%r8, %r15, %r31
	.word 0xb0096882  ! 105: AND_I	and 	%r5, 0x0882, %r24
	.word 0xb011e9f7  ! 105: OR_I	or 	%r7, 0x09f7, %r24
	.word 0xaa09000a  ! 105: AND_R	and 	%r4, %r10, %r21
	.word 0xb61120fb  ! 105: OR_I	or 	%r4, 0x00fb, %r27
	.word 0xbe08e774  ! 105: AND_I	and 	%r3, 0x0774, %r31
	.word 0xa211c00a  ! 105: OR_R	or 	%r7, %r10, %r17
	.word 0xac022741  ! 105: ADD_I	add 	%r8, 0x0741, %r22
	.word 0xaa090009  ! 105: AND_R	and 	%r4, %r9, %r21
	.word 0xbc11a422  ! 105: OR_I	or 	%r6, 0x0422, %r30
	.word 0xae11659a  ! 105: OR_I	or 	%r5, 0x059a, %r23
	.word 0xac112d06  ! 105: OR_I	or 	%r4, 0x0d06, %r22
	.word 0xba08ea37  ! 105: AND_I	and 	%r3, 0x0a37, %r29
	.word 0xbe11000c  ! 105: OR_R	or 	%r4, %r12, %r31
	.word 0xa4098009  ! 105: AND_R	and 	%r6, %r9, %r18
	.word 0xa6120009  ! 105: OR_R	or 	%r8, %r9, %r19
	.word 0xa801e473  ! 105: ADD_I	add 	%r7, 0x0473, %r20
	.word 0xae11ae69  ! 105: OR_I	or 	%r6, 0x0e69, %r23
	.word 0xbc08eef2  ! 105: AND_I	and 	%r3, 0x0ef2, %r30
	.word 0xa601a1fc  ! 105: ADD_I	add 	%r6, 0x01fc, %r19
	.word 0xb411800e  ! 105: OR_R	or 	%r6, %r14, %r26
	.word 0xac01000b  ! 105: ADD_R	add 	%r4, %r11, %r22
	.word 0xb601efa5  ! 105: ADD_I	add 	%r7, 0x0fa5, %r27
	.word 0xba016bd5  ! 105: ADD_I	add 	%r5, 0x0bd5, %r29
	.word 0xb8092a9f  ! 105: AND_I	and 	%r4, 0x0a9f, %r28
	.word 0xb000c00f  ! 105: ADD_R	add 	%r3, %r15, %r24
	.word 0xbc08ed50  ! 105: AND_I	and 	%r3, 0x0d50, %r30
	.word 0xb401eea0  ! 105: ADD_I	add 	%r7, 0x0ea0, %r26
	.word 0xbe010009  ! 105: ADD_R	add 	%r4, %r9, %r31
	.word 0xaa08e546  ! 105: AND_I	and 	%r3, 0x0546, %r21
	.word 0xaa01000b  ! 105: ADD_R	add 	%r4, %r11, %r21
	.word 0xb010c00c  ! 105: OR_R	or 	%r3, %r12, %r24
	.word 0xb201a6df  ! 105: ADD_I	add 	%r6, 0x06df, %r25
	.word 0xae01abfe  ! 105: ADD_I	add 	%r6, 0x0bfe, %r23
	.word 0xaa092f71  ! 105: AND_I	and 	%r4, 0x0f71, %r21
	.word 0xac02236e  ! 105: ADD_I	add 	%r8, 0x036e, %r22
	.word 0xbc1129ef  ! 105: OR_I	or 	%r4, 0x09ef, %r30
	.word 0xac09000f  ! 105: AND_R	and 	%r4, %r15, %r22
	.word 0xba11c00e  ! 105: OR_R	or 	%r7, %r14, %r29
	.word 0xbe08e810  ! 105: AND_I	and 	%r3, 0x0810, %r31
	.word 0xaa09a57e  ! 105: AND_I	and 	%r6, 0x057e, %r21
	.word 0xa811000d  ! 105: OR_R	or 	%r4, %r13, %r20
	.word 0xbe09677d  ! 105: AND_I	and 	%r5, 0x077d, %r31
	.word 0xa609000f  ! 105: AND_R	and 	%r4, %r15, %r19
	.word 0xae12000f  ! 105: OR_R	or 	%r8, %r15, %r23
	.word 0xa811691e  ! 105: OR_I	or 	%r5, 0x091e, %r20
	.word 0xb612000a  ! 105: OR_R	or 	%r8, %r10, %r27
	.word 0xb8092676  ! 105: AND_I	and 	%r4, 0x0676, %r28
	.word 0xae092a45  ! 105: AND_I	and 	%r4, 0x0a45, %r23
	.word 0xb809800b  ! 105: AND_R	and 	%r6, %r11, %r28
	.word 0xb001c00d  ! 105: ADD_R	add 	%r7, %r13, %r24
	.word 0xa201edcd  ! 105: ADD_I	add 	%r7, 0x0dcd, %r17
	.word 0xb201ed14  ! 105: ADD_I	add 	%r7, 0x0d14, %r25
	.word 0xb201e3e0  ! 105: ADD_I	add 	%r7, 0x03e0, %r25
	.word 0xb0096d2d  ! 105: AND_I	and 	%r5, 0x0d2d, %r24
	.word 0xa2120009  ! 105: OR_R	or 	%r8, %r9, %r17
	.word 0xa409e932  ! 105: AND_I	and 	%r7, 0x0932, %r18
	.word 0xb40a2138  ! 105: AND_I	and 	%r8, 0x0138, %r26
	.word 0xb411e371  ! 105: OR_I	or 	%r7, 0x0371, %r26
	.word 0xa8012c2c  ! 105: ADD_I	add 	%r4, 0x0c2c, %r20
	.word 0xa8092dda  ! 105: AND_I	and 	%r4, 0x0dda, %r20
	.word 0xb2116f34  ! 105: OR_I	or 	%r5, 0x0f34, %r25
	.word 0xec212014  ! 105: STW_I	stw	%r22, [%r4 + 0x0014]
	.word 0xf030e55e  ! 105: STH_I	sth	%r24, [%r3 + 0x055e]
	.word 0xfe2a2018  ! 105: STB_I	stb	%r31, [%r8 + 0x0018]
	.word 0xea2123c0  ! 105: STW_I	stw	%r21, [%r4 + 0x03c0]
	.word 0xfa312e3e  ! 105: STH_I	sth	%r29, [%r4 + 0x0e3e]
	.word 0xea71e598  ! 107: STX_I	stx	%r21, [%r7 + 0x0598]
	.word 0xbc19000e  ! 108: XOR_R	xor 	%r4, %r14, %r30
	.word 0xea316c44  ! 109: STH_I	sth	%r21, [%r5 + 0x0c44]
	.word 0xfea96819  ! 110: STBA_I	stba	%r31, [%r5 + 0x0819] %asi
	.word 0xfe41000d  ! 111: LDSW_R	ldsw	[%r4 + %r13], %r31
	.word 0xa201000b  ! 111: ADD_R	add 	%r4, %r11, %r17
	.word 0xb201800a  ! 111: ADD_R	add 	%r6, %r10, %r25
	.word 0xa81220e4  ! 111: OR_I	or 	%r8, 0x00e4, %r20
	bne thr0_loop_8
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_9:
	.word 0xb801400b  ! 119: ADD_R	add 	%r5, %r11, %r28
	.word 0xa809e232  ! 119: AND_I	and 	%r7, 0x0232, %r20
	.word 0xac11400a  ! 119: OR_R	or 	%r5, %r10, %r22
	.word 0xa402000f  ! 119: ADD_R	add 	%r8, %r15, %r18
	.word 0xb8092112  ! 119: AND_I	and 	%r4, 0x0112, %r28
	.word 0xa212298f  ! 119: OR_I	or 	%r8, 0x098f, %r17
	.word 0xb20a29d5  ! 119: AND_I	and 	%r8, 0x09d5, %r25
	.word 0xbc11e96d  ! 119: OR_I	or 	%r7, 0x096d, %r30
	.word 0xaa01000e  ! 119: ADD_R	add 	%r4, %r14, %r21
	.word 0xbe116f31  ! 119: OR_I	or 	%r5, 0x0f31, %r31
	.word 0xa808e51e  ! 119: AND_I	and 	%r3, 0x051e, %r20
	.word 0xbe08c00f  ! 119: AND_R	and 	%r3, %r15, %r31
	.word 0xbc11000b  ! 119: OR_R	or 	%r4, %r11, %r30
	.word 0xb212000f  ! 119: OR_R	or 	%r8, %r15, %r25
	.word 0xa6122890  ! 119: OR_I	or 	%r8, 0x0890, %r19
	.word 0xa802000d  ! 119: ADD_R	add 	%r8, %r13, %r20
	.word 0xa4016f0a  ! 119: ADD_I	add 	%r5, 0x0f0a, %r18
	.word 0xa6112343  ! 119: OR_I	or 	%r4, 0x0343, %r19
	.word 0xa809eacc  ! 119: AND_I	and 	%r7, 0x0acc, %r20
	.word 0xa609000a  ! 119: AND_R	and 	%r4, %r10, %r19
	.word 0xa800e557  ! 119: ADD_I	add 	%r3, 0x0557, %r20
	.word 0xa208c00f  ! 119: AND_R	and 	%r3, %r15, %r17
	.word 0xa809c00a  ! 119: AND_R	and 	%r7, %r10, %r20
	.word 0xa2112c80  ! 119: OR_I	or 	%r4, 0x0c80, %r17
	.word 0xbc022150  ! 119: ADD_I	add 	%r8, 0x0150, %r30
	.word 0xb611000a  ! 119: OR_R	or 	%r4, %r10, %r27
	.word 0xa40167f5  ! 119: ADD_I	add 	%r5, 0x07f5, %r18
	.word 0xa409400f  ! 119: AND_R	and 	%r5, %r15, %r18
	.word 0xb400efb5  ! 119: ADD_I	add 	%r3, 0x0fb5, %r26
	.word 0xac11280e  ! 119: OR_I	or 	%r4, 0x080e, %r22
	.word 0xa212000b  ! 119: OR_R	or 	%r8, %r11, %r17
	.word 0xb8120009  ! 119: OR_R	or 	%r8, %r9, %r28
	.word 0xae01abca  ! 119: ADD_I	add 	%r6, 0x0bca, %r23
	.word 0xbe02000f  ! 119: ADD_R	add 	%r8, %r15, %r31
	.word 0xa80162b4  ! 119: ADD_I	add 	%r5, 0x02b4, %r20
	.word 0xaa01800a  ! 119: ADD_R	add 	%r6, %r10, %r21
	.word 0xa211a8f4  ! 119: OR_I	or 	%r6, 0x08f4, %r17
	.word 0xbc0121e4  ! 119: ADD_I	add 	%r4, 0x01e4, %r30
	.word 0xac01400b  ! 119: ADD_R	add 	%r5, %r11, %r22
	.word 0xbe10ed4d  ! 119: OR_I	or 	%r3, 0x0d4d, %r31
	.word 0xae12000a  ! 119: OR_R	or 	%r8, %r10, %r23
	.word 0xbe08c00a  ! 119: AND_R	and 	%r3, %r10, %r31
	.word 0xb401e1e2  ! 119: ADD_I	add 	%r7, 0x01e2, %r26
	.word 0xb201800e  ! 119: ADD_R	add 	%r6, %r14, %r25
	.word 0xa608e78f  ! 119: AND_I	and 	%r3, 0x078f, %r19
	.word 0xb0116c32  ! 119: OR_I	or 	%r5, 0x0c32, %r24
	.word 0xa801e4d5  ! 119: ADD_I	add 	%r7, 0x04d5, %r20
	.word 0xa2090009  ! 119: AND_R	and 	%r4, %r9, %r17
	.word 0xa40a000e  ! 119: AND_R	and 	%r8, %r14, %r18
	.word 0xb2112fe0  ! 119: OR_I	or 	%r4, 0x0fe0, %r25
	.word 0xac10c00a  ! 119: OR_R	or 	%r3, %r10, %r22
	.word 0xb009a4c0  ! 119: AND_I	and 	%r6, 0x04c0, %r24
	.word 0xa811c00a  ! 119: OR_R	or 	%r7, %r10, %r20
	.word 0xb201201c  ! 119: ADD_I	add 	%r4, 0x001c, %r25
	.word 0xb800edb8  ! 119: ADD_I	add 	%r3, 0x0db8, %r28
	.word 0xa2022ea4  ! 119: ADD_I	add 	%r8, 0x0ea4, %r17
	.word 0xa6022a04  ! 119: ADD_I	add 	%r8, 0x0a04, %r19
	.word 0xae0a000a  ! 119: AND_R	and 	%r8, %r10, %r23
	.word 0xbc09af59  ! 119: AND_I	and 	%r6, 0x0f59, %r30
	.word 0xa801e6c8  ! 119: ADD_I	add 	%r7, 0x06c8, %r20
	.word 0xb6016fb4  ! 119: ADD_I	add 	%r5, 0x0fb4, %r27
	.word 0xba10c00b  ! 119: OR_R	or 	%r3, %r11, %r29
	.word 0xb411c00a  ! 119: OR_R	or 	%r7, %r10, %r26
	.word 0xac11efc1  ! 119: OR_I	or 	%r7, 0x0fc1, %r22
	.word 0xb209e668  ! 119: AND_I	and 	%r7, 0x0668, %r25
	.word 0xbe09275d  ! 119: AND_I	and 	%r4, 0x075d, %r31
	.word 0xa201c00c  ! 119: ADD_R	add 	%r7, %r12, %r17
	.word 0xb209e490  ! 119: AND_I	and 	%r7, 0x0490, %r25
	.word 0xbc122676  ! 119: OR_I	or 	%r8, 0x0676, %r30
	.word 0xbc09400a  ! 119: AND_R	and 	%r5, %r10, %r30
	.word 0xba01800f  ! 119: ADD_R	add 	%r6, %r15, %r29
	.word 0xae09c00b  ! 119: AND_R	and 	%r7, %r11, %r23
	.word 0xba09400a  ! 119: AND_R	and 	%r5, %r10, %r29
	.word 0xae09800b  ! 119: AND_R	and 	%r6, %r11, %r23
	.word 0xa4116a2f  ! 119: OR_I	or 	%r5, 0x0a2f, %r18
	.word 0xae01a1de  ! 119: ADD_I	add 	%r6, 0x01de, %r23
	.word 0xb808e233  ! 119: AND_I	and 	%r3, 0x0233, %r28
	.word 0xb808c009  ! 119: AND_R	and 	%r3, %r9, %r28
	.word 0xbe01a6c8  ! 119: ADD_I	add 	%r6, 0x06c8, %r31
	.word 0xfe3225e2  ! 119: STH_I	sth	%r31, [%r8 + 0x05e2]
	.word 0xfa31a2a4  ! 119: STH_I	sth	%r29, [%r6 + 0x02a4]
	.word 0xf829ef3d  ! 119: STB_I	stb	%r28, [%r7 + 0x0f3d]
	.word 0xf23163ce  ! 119: STH_I	sth	%r25, [%r5 + 0x03ce]
	.word 0xf43162f0  ! 119: STH_I	sth	%r26, [%r5 + 0x02f0]
	.word 0xea216d84  ! 119: STW_I	stw	%r21, [%r5 + 0x0d84]
	.word 0xfe21ebf0  ! 119: STW_I	stw	%r31, [%r7 + 0x0bf0]
DC_ERR_4:
!$EV error(0,expr(@VA(.MAIN.DC_ERR_4), 16, 16),2,DC_DATA,6)
	.word 0xea49ee1e  ! 122: LDSB_I	ldsb	[%r7 + 0x0e1e], %r21
	.word 0xbf78040c  ! 122: MOVR_R	move	%r0, %r12, %r31
	.word 0xea316d0e  ! 123: STH_I	sth	%r21, [%r5 + 0x0d0e]
	.word 0xe64a2ea3  ! 124: LDSB_I	ldsb	[%r8 + 0x0ea3], %r19
	.word 0xa600e177  ! 124: ADD_I	add 	%r3, 0x0177, %r19
	.word 0xb811400f  ! 124: OR_R	or 	%r5, %r15, %r28
	.word 0xb4112d03  ! 124: OR_I	or 	%r4, 0x0d03, %r26
	bne thr0_loop_9
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_10:
	.word 0xae10c00a  ! 130: OR_R	or 	%r3, %r10, %r23
	.word 0xaa11400c  ! 130: OR_R	or 	%r5, %r12, %r21
	.word 0xb8094009  ! 130: AND_R	and 	%r5, %r9, %r28
	.word 0xbc09a3d4  ! 130: AND_I	and 	%r6, 0x03d4, %r30
	.word 0xbe01000d  ! 130: ADD_R	add 	%r4, %r13, %r31
	.word 0xb6012ce9  ! 130: ADD_I	add 	%r4, 0x0ce9, %r27
	.word 0xae01ed0e  ! 130: ADD_I	add 	%r7, 0x0d0e, %r23
	.word 0xb401ae72  ! 130: ADD_I	add 	%r6, 0x0e72, %r26
	.word 0xba1165ad  ! 130: OR_I	or 	%r5, 0x05ad, %r29
	.word 0xac022a6c  ! 130: ADD_I	add 	%r8, 0x0a6c, %r22
	.word 0xbe11272b  ! 130: OR_I	or 	%r4, 0x072b, %r31
	.word 0xb400c00b  ! 130: ADD_R	add 	%r3, %r11, %r26
	.word 0xae11400f  ! 130: OR_R	or 	%r5, %r15, %r23
	.word 0xae11c00c  ! 130: OR_R	or 	%r7, %r12, %r23
	.word 0xa2090009  ! 130: AND_R	and 	%r4, %r9, %r17
	.word 0xb809e93a  ! 130: AND_I	and 	%r7, 0x093a, %r28
	.word 0xae08e23e  ! 130: AND_I	and 	%r3, 0x023e, %r23
	.word 0xb801adb1  ! 130: ADD_I	add 	%r6, 0x0db1, %r28
	.word 0xbe00c00d  ! 130: ADD_R	add 	%r3, %r13, %r31
	.word 0xa612000d  ! 130: OR_R	or 	%r8, %r13, %r19
	.word 0xbc11c00b  ! 130: OR_R	or 	%r7, %r11, %r30
	.word 0xa40a000a  ! 130: AND_R	and 	%r8, %r10, %r18
	.word 0xa611800d  ! 130: OR_R	or 	%r6, %r13, %r19
	.word 0xba012feb  ! 130: ADD_I	add 	%r4, 0x0feb, %r29
	.word 0xb4016372  ! 130: ADD_I	add 	%r5, 0x0372, %r26
	.word 0xb0022f78  ! 130: ADD_I	add 	%r8, 0x0f78, %r24
	.word 0xa40227bd  ! 130: ADD_I	add 	%r8, 0x07bd, %r18
	.word 0xb200c00e  ! 130: ADD_R	add 	%r3, %r14, %r25
	.word 0xb0016efe  ! 130: ADD_I	add 	%r5, 0x0efe, %r24
	.word 0xba08e359  ! 130: AND_I	and 	%r3, 0x0359, %r29
	.word 0xb409a9dc  ! 130: AND_I	and 	%r6, 0x09dc, %r26
	.word 0xa601e1fd  ! 130: ADD_I	add 	%r7, 0x01fd, %r19
	.word 0xa809000a  ! 130: AND_R	and 	%r4, %r10, %r20
	.word 0xb6096005  ! 130: AND_I	and 	%r5, 0x0005, %r27
	.word 0xaa01a298  ! 130: ADD_I	add 	%r6, 0x0298, %r21
	.word 0xac0a0009  ! 130: AND_R	and 	%r8, %r9, %r22
	.word 0xb611e590  ! 130: OR_I	or 	%r7, 0x0590, %r27
	.word 0xaa08c00a  ! 130: AND_R	and 	%r3, %r10, %r21
	.word 0xb609e0cc  ! 130: AND_I	and 	%r7, 0x00cc, %r27
	.word 0xb210c00e  ! 130: OR_R	or 	%r3, %r14, %r25
	.word 0xa800e92f  ! 130: ADD_I	add 	%r3, 0x092f, %r20
	.word 0xb410c00a  ! 130: OR_R	or 	%r3, %r10, %r26
	.word 0xb60160a3  ! 130: ADD_I	add 	%r5, 0x00a3, %r27
	.word 0xba022f59  ! 130: ADD_I	add 	%r8, 0x0f59, %r29
	.word 0xa801000a  ! 130: ADD_R	add 	%r4, %r10, %r20
	.word 0xba00c00e  ! 130: ADD_R	add 	%r3, %r14, %r29
	.word 0xac092fee  ! 130: AND_I	and 	%r4, 0x0fee, %r22
	.word 0xb00a000f  ! 130: AND_R	and 	%r8, %r15, %r24
	.word 0xb811400b  ! 130: OR_R	or 	%r5, %r11, %r28
	.word 0xbc10efcc  ! 130: OR_I	or 	%r3, 0x0fcc, %r30
	.word 0xbc01649f  ! 130: ADD_I	add 	%r5, 0x049f, %r30
	.word 0xaa092e7b  ! 130: AND_I	and 	%r4, 0x0e7b, %r21
	.word 0xa411a5e6  ! 130: OR_I	or 	%r6, 0x05e6, %r18
	.word 0xb609c00e  ! 130: AND_R	and 	%r7, %r14, %r27
	.word 0xa209e02d  ! 130: AND_I	and 	%r7, 0x002d, %r17
	.word 0xb60924bd  ! 130: AND_I	and 	%r4, 0x04bd, %r27
	.word 0xae012a23  ! 130: ADD_I	add 	%r4, 0x0a23, %r23
	.word 0xa411e951  ! 130: OR_I	or 	%r7, 0x0951, %r18
	.word 0xa21162b1  ! 130: OR_I	or 	%r5, 0x02b1, %r17
	.word 0xa411e2c8  ! 130: OR_I	or 	%r7, 0x02c8, %r18
	.word 0xbc120009  ! 130: OR_R	or 	%r8, %r9, %r30
	.word 0xb0018009  ! 130: ADD_R	add 	%r6, %r9, %r24
	.word 0xa209a02b  ! 130: AND_I	and 	%r6, 0x002b, %r17
	.word 0xa611aedf  ! 130: OR_I	or 	%r6, 0x0edf, %r19
	.word 0xaa01a596  ! 130: ADD_I	add 	%r6, 0x0596, %r21
	.word 0xbc120009  ! 130: OR_R	or 	%r8, %r9, %r30
	.word 0xa4096b05  ! 130: AND_I	and 	%r5, 0x0b05, %r18
	.word 0xbc01ee84  ! 130: ADD_I	add 	%r7, 0x0e84, %r30
	.word 0xae01ee80  ! 130: ADD_I	add 	%r7, 0x0e80, %r23
	.word 0xb809ebf0  ! 130: AND_I	and 	%r7, 0x0bf0, %r28
	.word 0xaa09ec0e  ! 130: AND_I	and 	%r7, 0x0c0e, %r21
	.word 0xbe11e8a9  ! 130: OR_I	or 	%r7, 0x08a9, %r31
	.word 0xb812000d  ! 130: OR_R	or 	%r8, %r13, %r28
	.word 0xa2118009  ! 130: OR_R	or 	%r6, %r9, %r17
	.word 0xb810c00a  ! 130: OR_R	or 	%r3, %r10, %r28
	.word 0xbe0129e5  ! 130: ADD_I	add 	%r4, 0x09e5, %r31
	.word 0xa8022db7  ! 130: ADD_I	add 	%r8, 0x0db7, %r20
	.word 0xaa114009  ! 130: OR_R	or 	%r5, %r9, %r21
	.word 0xb811800f  ! 130: OR_R	or 	%r6, %r15, %r28
	.word 0xaa018009  ! 130: ADD_R	add 	%r6, %r9, %r21
	.word 0xbe0921a5  ! 130: AND_I	and 	%r4, 0x01a5, %r31
	.word 0xb000ebdd  ! 130: ADD_I	add 	%r3, 0x0bdd, %r24
	.word 0xa802246f  ! 130: ADD_I	add 	%r8, 0x046f, %r20
	.word 0xac12000d  ! 130: OR_R	or 	%r8, %r13, %r22
	.word 0xb609a85a  ! 130: AND_I	and 	%r6, 0x085a, %r27
	.word 0xba00c00f  ! 130: ADD_R	add 	%r3, %r15, %r29
	.word 0xa609c00d  ! 130: AND_R	and 	%r7, %r13, %r19
	.word 0xa601000c  ! 130: ADD_R	add 	%r4, %r12, %r19
	.word 0xae01c00e  ! 130: ADD_R	add 	%r7, %r14, %r23
	.word 0xba09e030  ! 130: AND_I	and 	%r7, 0x0030, %r29
	.word 0xb611000a  ! 130: OR_R	or 	%r4, %r10, %r27
	.word 0xb001248e  ! 130: ADD_I	add 	%r4, 0x048e, %r24
	.word 0xb2092e9b  ! 130: AND_I	and 	%r4, 0x0e9b, %r25
	.word 0xae00e8ed  ! 130: ADD_I	add 	%r3, 0x08ed, %r23
	.word 0xa609800a  ! 130: AND_R	and 	%r6, %r10, %r19
	.word 0xb809ae87  ! 130: AND_I	and 	%r6, 0x0e87, %r28
	.word 0xb2122ef1  ! 130: OR_I	or 	%r8, 0x0ef1, %r25
	.word 0xb21123ef  ! 130: OR_I	or 	%r4, 0x03ef, %r25
	.word 0xbc00ee17  ! 130: ADD_I	add 	%r3, 0x0e17, %r30
	.word 0xae12000f  ! 130: OR_R	or 	%r8, %r15, %r23
	.word 0xb8116da7  ! 130: OR_I	or 	%r5, 0x0da7, %r28
	.word 0xa211eae0  ! 130: OR_I	or 	%r7, 0x0ae0, %r17
	.word 0xba11000e  ! 130: OR_R	or 	%r4, %r14, %r29
	.word 0xba11218c  ! 130: OR_I	or 	%r4, 0x018c, %r29
	.word 0xb6112eb7  ! 130: OR_I	or 	%r4, 0x0eb7, %r27
	.word 0xb60121d1  ! 130: ADD_I	add 	%r4, 0x01d1, %r27
	.word 0xa201e13a  ! 130: ADD_I	add 	%r7, 0x013a, %r17
	.word 0xb602000b  ! 130: ADD_R	add 	%r8, %r11, %r27
	.word 0xb0016e05  ! 130: ADD_I	add 	%r5, 0x0e05, %r24
	.word 0xa400c009  ! 130: ADD_R	add 	%r3, %r9, %r18
	.word 0xac09220c  ! 130: AND_I	and 	%r4, 0x020c, %r22
	.word 0xa610c009  ! 130: OR_R	or 	%r3, %r9, %r19
	.word 0xbc11259b  ! 130: OR_I	or 	%r4, 0x059b, %r30
	.word 0xac01a25c  ! 130: ADD_I	add 	%r6, 0x025c, %r22
	.word 0xa212000d  ! 130: OR_R	or 	%r8, %r13, %r17
	.word 0xaa01800a  ! 130: ADD_R	add 	%r6, %r10, %r21
	.word 0xac122e0d  ! 130: OR_I	or 	%r8, 0x0e0d, %r22
	.word 0xb201400e  ! 130: ADD_R	add 	%r5, %r14, %r25
	.word 0xac10c00a  ! 130: OR_R	or 	%r3, %r10, %r22
	.word 0xae10ead8  ! 130: OR_I	or 	%r3, 0x0ad8, %r23
	.word 0xa811c00a  ! 130: OR_R	or 	%r7, %r10, %r20
	.word 0xbc09000f  ! 130: AND_R	and 	%r4, %r15, %r30
	.word 0xbc12000c  ! 130: OR_R	or 	%r8, %r12, %r30
	.word 0xbc00e14d  ! 130: ADD_I	add 	%r3, 0x014d, %r30
	.word 0xa6094009  ! 130: AND_R	and 	%r5, %r9, %r19
	.word 0xae122c73  ! 130: OR_I	or 	%r8, 0x0c73, %r23
	.word 0xb4022f57  ! 130: ADD_I	add 	%r8, 0x0f57, %r26
	.word 0xf02929db  ! 130: STB_I	stb	%r24, [%r4 + 0x09db]
	.word 0xe231200e  ! 130: STH_I	sth	%r17, [%r4 + 0x000e]
	.word 0xe42220b0  ! 130: STW_I	stw	%r18, [%r8 + 0x00b0]
	.word 0xfc29ecc5  ! 130: STB_I	stb	%r30, [%r7 + 0x0cc5]
	.word 0xfa7229b8  ! 130: STX_I	stx	%r29, [%r8 + 0x09b8]
	.word 0xe8322b48  ! 131: STH_I	sth	%r20, [%r8 + 0x0b48]
	.word 0xae010045
	.word 0xec29240b  ! 133: STB_I	stb	%r22, [%r4 + 0x040b]
	.word 0xf070e498  ! 134: STX_I	stx	%r24, [%r3 + 0x0498]
	.word 0xac50e22b  ! 135: UMUL_I	umul 	%r3, 0x022b, %r22
	.word 0xb401400c  ! 135: ADD_R	add 	%r5, %r12, %r26
	.word 0xac122e6e  ! 135: OR_I	or 	%r8, 0x0e6e, %r22
	.word 0xb20a273f  ! 135: AND_I	and 	%r8, 0x073f, %r25
	bne thr0_loop_10
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_11:
	.word 0xae0a206c  ! 143: AND_I	and 	%r8, 0x006c, %r23
	.word 0xae0a2a07  ! 143: AND_I	and 	%r8, 0x0a07, %r23
	.word 0xae016c6a  ! 143: ADD_I	add 	%r5, 0x0c6a, %r23
	.word 0xb20229b5  ! 143: ADD_I	add 	%r8, 0x09b5, %r25
	.word 0xa601400b  ! 143: ADD_R	add 	%r5, %r11, %r19
	.word 0xa401c00c  ! 143: ADD_R	add 	%r7, %r12, %r18
	.word 0xac10e69d  ! 143: OR_I	or 	%r3, 0x069d, %r22
	.word 0xb6022862  ! 143: ADD_I	add 	%r8, 0x0862, %r27
	.word 0xb601400c  ! 143: ADD_R	add 	%r5, %r12, %r27
	.word 0xaa01a40b  ! 143: ADD_I	add 	%r6, 0x040b, %r21
	.word 0xa61221b5  ! 143: OR_I	or 	%r8, 0x01b5, %r19
	.word 0xbe01e9ef  ! 143: ADD_I	add 	%r7, 0x09ef, %r31
	.word 0xbc096e1b  ! 143: AND_I	and 	%r5, 0x0e1b, %r30
	.word 0xa409400e  ! 143: AND_R	and 	%r5, %r14, %r18
	.word 0xae01c00a  ! 143: ADD_R	add 	%r7, %r10, %r23
	.word 0xa800c00a  ! 143: ADD_R	add 	%r3, %r10, %r20
	.word 0xb201ed8b  ! 143: ADD_I	add 	%r7, 0x0d8b, %r25
	.word 0xba01a518  ! 143: ADD_I	add 	%r6, 0x0518, %r29
	.word 0xb401acaa  ! 143: ADD_I	add 	%r6, 0x0caa, %r26
	.word 0xae10eb5f  ! 143: OR_I	or 	%r3, 0x0b5f, %r23
	.word 0xb211ad57  ! 143: OR_I	or 	%r6, 0x0d57, %r25
	.word 0xa402284b  ! 143: ADD_I	add 	%r8, 0x084b, %r18
	.word 0xb8112bfb  ! 143: OR_I	or 	%r4, 0x0bfb, %r28
	.word 0xb802000b  ! 143: ADD_R	add 	%r8, %r11, %r28
	.word 0xbe09e396  ! 143: AND_I	and 	%r7, 0x0396, %r31
	.word 0xbe11a408  ! 143: OR_I	or 	%r6, 0x0408, %r31
	.word 0xb601a27a  ! 143: ADD_I	add 	%r6, 0x027a, %r27
	.word 0xb40123f4  ! 143: ADD_I	add 	%r4, 0x03f4, %r26
	.word 0xa601e6b4  ! 143: ADD_I	add 	%r7, 0x06b4, %r19
	.word 0xb409ada6  ! 143: AND_I	and 	%r6, 0x0da6, %r26
	.word 0xb40920d5  ! 143: AND_I	and 	%r4, 0x00d5, %r26
	.word 0xac112510  ! 143: OR_I	or 	%r4, 0x0510, %r22
	.word 0xa40126c1  ! 143: ADD_I	add 	%r4, 0x06c1, %r18
	.word 0xb610c00f  ! 143: OR_R	or 	%r3, %r15, %r27
	.word 0xa400c00f  ! 143: ADD_R	add 	%r3, %r15, %r18
	.word 0xb2022d14  ! 143: ADD_I	add 	%r8, 0x0d14, %r25
	.word 0xbe09000d  ! 143: AND_R	and 	%r4, %r13, %r31
	.word 0xac01ec47  ! 143: ADD_I	add 	%r7, 0x0c47, %r22
	.word 0xb801400a  ! 143: ADD_R	add 	%r5, %r10, %r28
	.word 0xbc01000a  ! 143: ADD_R	add 	%r4, %r10, %r30
	.word 0xb808e675  ! 143: AND_I	and 	%r3, 0x0675, %r28
	.word 0xa409800f  ! 143: AND_R	and 	%r6, %r15, %r18
	.word 0xa801800e  ! 143: ADD_R	add 	%r6, %r14, %r20
	.word 0xae092a4a  ! 143: AND_I	and 	%r4, 0x0a4a, %r23
	.word 0xae09c00c  ! 143: AND_R	and 	%r7, %r12, %r23
	.word 0xa809400d  ! 143: AND_R	and 	%r5, %r13, %r20
	.word 0xac09212f  ! 143: AND_I	and 	%r4, 0x012f, %r22
	.word 0xa401c009  ! 143: ADD_R	add 	%r7, %r9, %r18
	.word 0xa209678a  ! 143: AND_I	and 	%r5, 0x078a, %r17
	.word 0xa809400b  ! 143: AND_R	and 	%r5, %r11, %r20
	.word 0xae122746  ! 143: OR_I	or 	%r8, 0x0746, %r23
	.word 0xa401800b  ! 143: ADD_R	add 	%r6, %r11, %r18
	.word 0xae012976  ! 143: ADD_I	add 	%r4, 0x0976, %r23
	.word 0xac08c00d  ! 143: AND_R	and 	%r3, %r13, %r22
	.word 0xb600c00a  ! 143: ADD_R	add 	%r3, %r10, %r27
	.word 0xb609000c  ! 143: AND_R	and 	%r4, %r12, %r27
	.word 0xae0a2edc  ! 143: AND_I	and 	%r8, 0x0edc, %r23
	.word 0xbe11400f  ! 143: OR_R	or 	%r5, %r15, %r31
	.word 0xbe11a61d  ! 143: OR_I	or 	%r6, 0x061d, %r31
	.word 0xa4022f4b  ! 143: ADD_I	add 	%r8, 0x0f4b, %r18
	.word 0xbe11000c  ! 143: OR_R	or 	%r4, %r12, %r31
	.word 0xa411e19e  ! 143: OR_I	or 	%r7, 0x019e, %r18
	.word 0xbe09e824  ! 143: AND_I	and 	%r7, 0x0824, %r31
	.word 0xba016a16  ! 143: ADD_I	add 	%r5, 0x0a16, %r29
	.word 0xbe01aa62  ! 143: ADD_I	add 	%r6, 0x0a62, %r31
	.word 0xac0a0009  ! 143: AND_R	and 	%r8, %r9, %r22
	.word 0xbc012c2a  ! 143: ADD_I	add 	%r4, 0x0c2a, %r30
	.word 0xb4012222  ! 143: ADD_I	add 	%r4, 0x0222, %r26
	.word 0xa610c009  ! 143: OR_R	or 	%r3, %r9, %r19
	.word 0xac01800d  ! 143: ADD_R	add 	%r6, %r13, %r22
	.word 0xbc11c00b  ! 143: OR_R	or 	%r7, %r11, %r30
	.word 0xb411800e  ! 143: OR_R	or 	%r6, %r14, %r26
	.word 0xb6090009  ! 143: AND_R	and 	%r4, %r9, %r27
	.word 0xb20a251f  ! 143: AND_I	and 	%r8, 0x051f, %r25
	.word 0xb0092750  ! 143: AND_I	and 	%r4, 0x0750, %r24
	.word 0xb8016f38  ! 143: ADD_I	add 	%r5, 0x0f38, %r28
	.word 0xbe012ef8  ! 143: ADD_I	add 	%r4, 0x0ef8, %r31
	.word 0xae022f6b  ! 143: ADD_I	add 	%r8, 0x0f6b, %r23
	.word 0xba112d1e  ! 143: OR_I	or 	%r4, 0x0d1e, %r29
	.word 0xb411000b  ! 143: OR_R	or 	%r4, %r11, %r26
	.word 0xbe08c00e  ! 143: AND_R	and 	%r3, %r14, %r31
	.word 0xa201800a  ! 143: ADD_R	add 	%r6, %r10, %r17
	.word 0xb600c00c  ! 143: ADD_R	add 	%r3, %r12, %r27
	.word 0xa801a060  ! 143: ADD_I	add 	%r6, 0x0060, %r20
	.word 0xa801a784  ! 143: ADD_I	add 	%r6, 0x0784, %r20
	.word 0xaa0967f2  ! 143: AND_I	and 	%r5, 0x07f2, %r21
	.word 0xa201692b  ! 143: ADD_I	add 	%r5, 0x092b, %r17
	.word 0xe22a2c10  ! 143: STB_I	stb	%r17, [%r8 + 0x0c10]
	.word 0xf8222a78  ! 143: STW_I	stw	%r28, [%r8 + 0x0a78]
	.word 0xf020e364  ! 143: STW_I	stw	%r24, [%r3 + 0x0364]
	.word 0xf631aa84  ! 143: STH_I	sth	%r27, [%r6 + 0x0a84]
	.word 0xfc70ec70  ! 143: STX_I	stx	%r30, [%r3 + 0x0c70]
	.word 0xf43120e8  ! 143: STH_I	sth	%r26, [%r4 + 0x00e8]
	.word 0xf2222e7c  ! 143: STW_I	stw	%r25, [%r8 + 0x0e7c]
DC_ERR_8:
!$EV error(0,expr(@VA(.MAIN.DC_ERR_8), 16, 16),1,DC_DATA,42)
	.word 0xe201acbc  ! 146: LDUW_I	lduw	[%r6 + 0x0cbc], %r17
	.word 0xa23224e2  ! 146: ORN_I	orn 	%r8, 0x04e2, %r17
	.word 0xf670e470  ! 147: STX_I	stx	%r27, [%r3 + 0x0470]
	.word 0xe2422c80  ! 148: LDSW_I	ldsw	[%r8 + 0x0c80], %r17
	.word 0xa201000d  ! 148: ADD_R	add 	%r4, %r13, %r17
	.word 0xaa00edfa  ! 148: ADD_I	add 	%r3, 0x0dfa, %r21
	.word 0xa402000a  ! 148: ADD_R	add 	%r8, %r10, %r18
	bne thr0_loop_11
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_12:
	.word 0xa210c00a  ! 156: OR_R	or 	%r3, %r10, %r17
	.word 0xa611e5b5  ! 156: OR_I	or 	%r7, 0x05b5, %r19
	.word 0xbc10ef99  ! 156: OR_I	or 	%r3, 0x0f99, %r30
	.word 0xb2016809  ! 156: ADD_I	add 	%r5, 0x0809, %r25
	.word 0xae10c00d  ! 156: OR_R	or 	%r3, %r13, %r23
	.word 0xa800e48e  ! 156: ADD_I	add 	%r3, 0x048e, %r20
	.word 0xa409000e  ! 156: AND_R	and 	%r4, %r14, %r18
	.word 0xba11e234  ! 156: OR_I	or 	%r7, 0x0234, %r29
	.word 0xbe09400b  ! 156: AND_R	and 	%r5, %r11, %r31
	.word 0xac08e8eb  ! 156: AND_I	and 	%r3, 0x08eb, %r22
	.word 0xba02000b  ! 156: ADD_R	add 	%r8, %r11, %r29
	.word 0xae09400f  ! 156: AND_R	and 	%r5, %r15, %r23
	.word 0xb011effb  ! 156: OR_I	or 	%r7, 0x0ffb, %r24
	.word 0xae00e543  ! 156: ADD_I	add 	%r3, 0x0543, %r23
	.word 0xbe10e55e  ! 156: OR_I	or 	%r3, 0x055e, %r31
	.word 0xae11c00e  ! 156: OR_R	or 	%r7, %r14, %r23
	.word 0xbc0128a6  ! 156: ADD_I	add 	%r4, 0x08a6, %r30
	.word 0xb409800b  ! 156: AND_R	and 	%r6, %r11, %r26
	.word 0xa4012cbc  ! 156: ADD_I	add 	%r4, 0x0cbc, %r18
	.word 0xac10e158  ! 156: OR_I	or 	%r3, 0x0158, %r22
	.word 0xa808c00e  ! 156: AND_R	and 	%r3, %r14, %r20
	.word 0xa601800b  ! 156: ADD_R	add 	%r6, %r11, %r19
	.word 0xba08c00c  ! 156: AND_R	and 	%r3, %r12, %r29
	.word 0xbe022e6b  ! 156: ADD_I	add 	%r8, 0x0e6b, %r31
	.word 0xbe092a86  ! 156: AND_I	and 	%r4, 0x0a86, %r31
	.word 0xbe01400f  ! 156: ADD_R	add 	%r5, %r15, %r31
	.word 0xaa096a2d  ! 156: AND_I	and 	%r5, 0x0a2d, %r21
	.word 0xa800e07f  ! 156: ADD_I	add 	%r3, 0x007f, %r20
	.word 0xa6096135  ! 156: AND_I	and 	%r5, 0x0135, %r19
	.word 0xb802000f  ! 156: ADD_R	add 	%r8, %r15, %r28
	.word 0xb608e609  ! 156: AND_I	and 	%r3, 0x0609, %r27
	.word 0xa401ed5a  ! 156: ADD_I	add 	%r7, 0x0d5a, %r18
	.word 0xbe09400e  ! 156: AND_R	and 	%r5, %r14, %r31
	.word 0xa20a25ce  ! 156: AND_I	and 	%r8, 0x05ce, %r17
	.word 0xaa01800d  ! 156: ADD_R	add 	%r6, %r13, %r21
	.word 0xbe0a278c  ! 156: AND_I	and 	%r8, 0x078c, %r31
	.word 0xac11400a  ! 156: OR_R	or 	%r5, %r10, %r22
	.word 0xb810c00c  ! 156: OR_R	or 	%r3, %r12, %r28
	.word 0xa408c00d  ! 156: AND_R	and 	%r3, %r13, %r18
	.word 0xa80a000c  ! 156: AND_R	and 	%r8, %r12, %r20
	.word 0xa6120009  ! 156: OR_R	or 	%r8, %r9, %r19
	.word 0xb001400f  ! 156: ADD_R	add 	%r5, %r15, %r24
	.word 0xac02255f  ! 156: ADD_I	add 	%r8, 0x055f, %r22
	.word 0xa60a000e  ! 156: AND_R	and 	%r8, %r14, %r19
	.word 0xb20a0009  ! 156: AND_R	and 	%r8, %r9, %r25
	.word 0xaa092566  ! 156: AND_I	and 	%r4, 0x0566, %r21
	.word 0xa61120df  ! 156: OR_I	or 	%r4, 0x00df, %r19
	.word 0xa609400e  ! 156: AND_R	and 	%r5, %r14, %r19
	.word 0xb409c00b  ! 156: AND_R	and 	%r7, %r11, %r26
	.word 0xb211800c  ! 156: OR_R	or 	%r6, %r12, %r25
	.word 0xb408e3f4  ! 156: AND_I	and 	%r3, 0x03f4, %r26
	.word 0xbe01a18d  ! 156: ADD_I	add 	%r6, 0x018d, %r31
	.word 0xb0118009  ! 156: OR_R	or 	%r6, %r9, %r24
	.word 0xa80a2966  ! 156: AND_I	and 	%r8, 0x0966, %r20
	.word 0xb600c00c  ! 156: ADD_R	add 	%r3, %r12, %r27
	.word 0xbc096668  ! 156: AND_I	and 	%r5, 0x0668, %r30
	.word 0xba11400c  ! 156: OR_R	or 	%r5, %r12, %r29
	.word 0xa411c009  ! 156: OR_R	or 	%r7, %r9, %r18
	.word 0xac0129fa  ! 156: ADD_I	add 	%r4, 0x09fa, %r22
	.word 0xac00c00d  ! 156: ADD_R	add 	%r3, %r13, %r22
	.word 0xb0116d43  ! 156: OR_I	or 	%r5, 0x0d43, %r24
	.word 0xac0963de  ! 156: AND_I	and 	%r5, 0x03de, %r22
	.word 0xbe01afb6  ! 156: ADD_I	add 	%r6, 0x0fb6, %r31
	.word 0xae10ea72  ! 156: OR_I	or 	%r3, 0x0a72, %r23
	.word 0xb812257f  ! 156: OR_I	or 	%r8, 0x057f, %r28
	.word 0xa610e660  ! 156: OR_I	or 	%r3, 0x0660, %r19
	.word 0xbc11a36e  ! 156: OR_I	or 	%r6, 0x036e, %r30
	.word 0xac10eb5f  ! 156: OR_I	or 	%r3, 0x0b5f, %r22
	.word 0xae12000f  ! 156: OR_R	or 	%r8, %r15, %r23
	.word 0xbe10c00a  ! 156: OR_R	or 	%r3, %r10, %r31
	.word 0xa409c00b  ! 156: AND_R	and 	%r7, %r11, %r18
	.word 0xa200ef4a  ! 156: ADD_I	add 	%r3, 0x0f4a, %r17
	.word 0xb009800f  ! 156: AND_R	and 	%r6, %r15, %r24
	.word 0xac0220de  ! 156: ADD_I	add 	%r8, 0x00de, %r22
	.word 0xb200e834  ! 156: ADD_I	add 	%r3, 0x0834, %r25
	.word 0xbc09000d  ! 156: AND_R	and 	%r4, %r13, %r30
	.word 0xbe01c009  ! 156: ADD_R	add 	%r7, %r9, %r31
	.word 0xae08e3df  ! 156: AND_I	and 	%r3, 0x03df, %r23
	.word 0xac11ee85  ! 156: OR_I	or 	%r7, 0x0e85, %r22
	.word 0xaa08c00f  ! 156: AND_R	and 	%r3, %r15, %r21
	.word 0xa8016fe3  ! 156: ADD_I	add 	%r5, 0x0fe3, %r20
	.word 0xb609a516  ! 156: AND_I	and 	%r6, 0x0516, %r27
	.word 0xa210c00f  ! 156: OR_R	or 	%r3, %r15, %r17
	.word 0xa4092d12  ! 156: AND_I	and 	%r4, 0x0d12, %r18
	.word 0xbc08c00b  ! 156: AND_R	and 	%r3, %r11, %r30
	.word 0xbc11800e  ! 156: OR_R	or 	%r6, %r14, %r30
	.word 0xae11800c  ! 156: OR_R	or 	%r6, %r12, %r23
	.word 0xb009000d  ! 156: AND_R	and 	%r4, %r13, %r24
	.word 0xa401a9e3  ! 156: ADD_I	add 	%r6, 0x09e3, %r18
	.word 0xb2098009  ! 156: AND_R	and 	%r6, %r9, %r25
	.word 0xaa0166b8  ! 156: ADD_I	add 	%r5, 0x06b8, %r21
	.word 0xa600c00f  ! 156: ADD_R	add 	%r3, %r15, %r19
	.word 0xb211000e  ! 156: OR_R	or 	%r4, %r14, %r25
	.word 0xa801636a  ! 156: ADD_I	add 	%r5, 0x036a, %r20
	.word 0xb609a884  ! 156: AND_I	and 	%r6, 0x0884, %r27
	.word 0xa801c00e  ! 156: ADD_R	add 	%r7, %r14, %r20
	.word 0xa800e081  ! 156: ADD_I	add 	%r3, 0x0081, %r20
	.word 0xaa11e763  ! 156: OR_I	or 	%r7, 0x0763, %r21
	.word 0xa409655c  ! 156: AND_I	and 	%r5, 0x055c, %r18
	.word 0xa8096a9b  ! 156: AND_I	and 	%r5, 0x0a9b, %r20
	.word 0xbc11400f  ! 156: OR_R	or 	%r5, %r15, %r30
	.word 0xbc01c009  ! 156: ADD_R	add 	%r7, %r9, %r30
	.word 0xb808e698  ! 156: AND_I	and 	%r3, 0x0698, %r28
	.word 0xa811a5f6  ! 156: OR_I	or 	%r6, 0x05f6, %r20
	.word 0xb809800e  ! 156: AND_R	and 	%r6, %r14, %r28
	.word 0xbc0a2005  ! 156: AND_I	and 	%r8, 0x0005, %r30
	.word 0xac11ac00  ! 156: OR_I	or 	%r6, 0x0c00, %r22
	.word 0xae00c00f  ! 156: ADD_R	add 	%r3, %r15, %r23
	.word 0xb60a289f  ! 156: AND_I	and 	%r8, 0x089f, %r27
	.word 0xb00a267d  ! 156: AND_I	and 	%r8, 0x067d, %r24
	.word 0xaa01400c  ! 156: ADD_R	add 	%r5, %r12, %r21
	.word 0xac01af2e  ! 156: ADD_I	add 	%r6, 0x0f2e, %r22
	.word 0xb809800f  ! 156: AND_R	and 	%r6, %r15, %r28
	.word 0xb209c00c  ! 156: AND_R	and 	%r7, %r12, %r25
	.word 0xb211000f  ! 156: OR_R	or 	%r4, %r15, %r25
	.word 0xb60121a3  ! 156: ADD_I	add 	%r4, 0x01a3, %r27
	.word 0xbc09c009  ! 156: AND_R	and 	%r7, %r9, %r30
	.word 0xa4116c41  ! 156: OR_I	or 	%r5, 0x0c41, %r18
	.word 0xb0098009  ! 156: AND_R	and 	%r6, %r9, %r24
	.word 0xb2016264  ! 156: ADD_I	add 	%r5, 0x0264, %r25
	.word 0xaa11e719  ! 156: OR_I	or 	%r7, 0x0719, %r21
	.word 0xa201000a  ! 156: ADD_R	add 	%r4, %r10, %r17
	.word 0xb009000d  ! 156: AND_R	and 	%r4, %r13, %r24
	.word 0xb4116b74  ! 156: OR_I	or 	%r5, 0x0b74, %r26
	.word 0xa811c00e  ! 156: OR_R	or 	%r7, %r14, %r20
	.word 0xbc11e549  ! 156: OR_I	or 	%r7, 0x0549, %r30
	.word 0xa201ecac  ! 156: ADD_I	add 	%r7, 0x0cac, %r17
	.word 0xb401c00f  ! 156: ADD_R	add 	%r7, %r15, %r26
	.word 0xba09800f  ! 156: AND_R	and 	%r6, %r15, %r29
	.word 0xb2020009  ! 156: ADD_R	add 	%r8, %r9, %r25
	.word 0xb011ac6d  ! 156: OR_I	or 	%r6, 0x0c6d, %r24
	.word 0xb6020009  ! 156: ADD_R	add 	%r8, %r9, %r27
	.word 0xaa10ed09  ! 156: OR_I	or 	%r3, 0x0d09, %r21
	.word 0xa201800b  ! 156: ADD_R	add 	%r6, %r11, %r17
	.word 0xa201c00d  ! 156: ADD_R	add 	%r7, %r13, %r17
	.word 0xa811400c  ! 156: OR_R	or 	%r5, %r12, %r20
	.word 0xa608c00b  ! 156: AND_R	and 	%r3, %r11, %r19
	.word 0xa609aba0  ! 156: AND_I	and 	%r6, 0x0ba0, %r19
	.word 0xac01400e  ! 156: ADD_R	add 	%r5, %r14, %r22
	.word 0xa6116f16  ! 156: OR_I	or 	%r5, 0x0f16, %r19
	.word 0xaa11c00d  ! 156: OR_R	or 	%r7, %r13, %r21
	.word 0xaa10c00e  ! 156: OR_R	or 	%r3, %r14, %r21
	.word 0xbc122e2b  ! 156: OR_I	or 	%r8, 0x0e2b, %r30
	.word 0xb201400c  ! 156: ADD_R	add 	%r5, %r12, %r25
	.word 0xb012262b  ! 156: OR_I	or 	%r8, 0x062b, %r24
	.word 0xa811400f  ! 156: OR_R	or 	%r5, %r15, %r20
	.word 0xa4112e62  ! 156: OR_I	or 	%r4, 0x0e62, %r18
	.word 0xba122818  ! 156: OR_I	or 	%r8, 0x0818, %r29
	.word 0xa608c00f  ! 156: AND_R	and 	%r3, %r15, %r19
	.word 0xae12000c  ! 156: OR_R	or 	%r8, %r12, %r23
	.word 0xbc016c31  ! 156: ADD_I	add 	%r5, 0x0c31, %r30
	.word 0xbe10c00e  ! 156: OR_R	or 	%r3, %r14, %r31
	.word 0xa201000b  ! 156: ADD_R	add 	%r4, %r11, %r17
	.word 0xb209000b  ! 156: AND_R	and 	%r4, %r11, %r25
	.word 0xb600c00a  ! 156: ADD_R	add 	%r3, %r10, %r27
	.word 0xa401c00c  ! 156: ADD_R	add 	%r7, %r12, %r18
	.word 0xb609a65c  ! 156: AND_I	and 	%r6, 0x065c, %r27
	.word 0xa811ab07  ! 156: OR_I	or 	%r6, 0x0b07, %r20
	.word 0xbe110009  ! 156: OR_R	or 	%r4, %r9, %r31
	.word 0xb011eabb  ! 156: OR_I	or 	%r7, 0x0abb, %r24
	.word 0xb408e3e0  ! 156: AND_I	and 	%r3, 0x03e0, %r26
	.word 0xae0a2420  ! 156: AND_I	and 	%r8, 0x0420, %r23
	.word 0xac020009  ! 156: ADD_R	add 	%r8, %r9, %r22
	.word 0xb20a000b  ! 156: AND_R	and 	%r8, %r11, %r25
	.word 0xb600ee67  ! 156: ADD_I	add 	%r3, 0x0e67, %r27
	.word 0xa609000e  ! 156: AND_R	and 	%r4, %r14, %r19
	.word 0xb4016e2a  ! 156: ADD_I	add 	%r5, 0x0e2a, %r26
	.word 0xaa09e666  ! 156: AND_I	and 	%r7, 0x0666, %r21
	.word 0xb808c00c  ! 156: AND_R	and 	%r3, %r12, %r28
	.word 0xaa00c00b  ! 156: ADD_R	add 	%r3, %r11, %r21
	.word 0xac11a3b2  ! 156: OR_I	or 	%r6, 0x03b2, %r22
	.word 0xac09c00e  ! 156: AND_R	and 	%r7, %r14, %r22
	.word 0xb411000f  ! 156: OR_R	or 	%r4, %r15, %r26
	.word 0xbc11c009  ! 156: OR_R	or 	%r7, %r9, %r30
	.word 0xbc0a000f  ! 156: AND_R	and 	%r8, %r15, %r30
	.word 0xa401800f  ! 156: ADD_R	add 	%r6, %r15, %r18
	.word 0xbe09e6de  ! 156: AND_I	and 	%r7, 0x06de, %r31
	.word 0xa801400d  ! 156: ADD_R	add 	%r5, %r13, %r20
	.word 0xae09e9d0  ! 156: AND_I	and 	%r7, 0x09d0, %r23
	.word 0xa409000d  ! 156: AND_R	and 	%r4, %r13, %r18
	.word 0xbe00e2a9  ! 156: ADD_I	add 	%r3, 0x02a9, %r31
	.word 0xb211000c  ! 156: OR_R	or 	%r4, %r12, %r25
	.word 0xb001e8a8  ! 156: ADD_I	add 	%r7, 0x08a8, %r24
	.word 0xbc010009  ! 156: ADD_R	add 	%r4, %r9, %r30
	.word 0xb201a79f  ! 156: ADD_I	add 	%r6, 0x079f, %r25
	.word 0xa209000d  ! 156: AND_R	and 	%r4, %r13, %r17
	.word 0xae10c00b  ! 156: OR_R	or 	%r3, %r11, %r23
	.word 0xa401000c  ! 156: ADD_R	add 	%r4, %r12, %r18
	.word 0xac08e8a5  ! 156: AND_I	and 	%r3, 0x08a5, %r22
	.word 0xa401000e  ! 156: ADD_R	add 	%r4, %r14, %r18
	.word 0xac00e973  ! 156: ADD_I	add 	%r3, 0x0973, %r22
	.word 0xa201a72d  ! 156: ADD_I	add 	%r6, 0x072d, %r17
	.word 0xb012221f  ! 156: OR_I	or 	%r8, 0x021f, %r24
	.word 0xb0016efd  ! 156: ADD_I	add 	%r5, 0x0efd, %r24
	.word 0xac09c00d  ! 156: AND_R	and 	%r7, %r13, %r22
	.word 0xb000c00f  ! 156: ADD_R	add 	%r3, %r15, %r24
	.word 0xba0168b9  ! 156: ADD_I	add 	%r5, 0x08b9, %r29
	.word 0xb208efc5  ! 156: AND_I	and 	%r3, 0x0fc5, %r25
	.word 0xb808e195  ! 156: AND_I	and 	%r3, 0x0195, %r28
	.word 0xa611400f  ! 156: OR_R	or 	%r5, %r15, %r19
	.word 0xa401a371  ! 156: ADD_I	add 	%r6, 0x0371, %r18
	.word 0xba10ea1a  ! 156: OR_I	or 	%r3, 0x0a1a, %r29
	.word 0xa401ad8b  ! 156: ADD_I	add 	%r6, 0x0d8b, %r18
	.word 0xa411e991  ! 156: OR_I	or 	%r7, 0x0991, %r18
	.word 0xb0014009  ! 156: ADD_R	add 	%r5, %r9, %r24
	.word 0xa811000b  ! 156: OR_R	or 	%r4, %r11, %r20
	.word 0xb001634a  ! 156: ADD_I	add 	%r5, 0x034a, %r24
	.word 0xa61126dc  ! 156: OR_I	or 	%r4, 0x06dc, %r19
	.word 0xaa00c00c  ! 156: ADD_R	add 	%r3, %r12, %r21
	.word 0xbe09400f  ! 156: AND_R	and 	%r5, %r15, %r31
	.word 0xa808c009  ! 156: AND_R	and 	%r3, %r9, %r20
	.word 0xa401ec64  ! 156: ADD_I	add 	%r7, 0x0c64, %r18
	.word 0xb410e259  ! 156: OR_I	or 	%r3, 0x0259, %r26
	.word 0xa811edc4  ! 156: OR_I	or 	%r7, 0x0dc4, %r20
	.word 0xb00a000e  ! 156: AND_R	and 	%r8, %r14, %r24
	.word 0xb009e7c3  ! 156: AND_I	and 	%r7, 0x07c3, %r24
	.word 0xa801e595  ! 156: ADD_I	add 	%r7, 0x0595, %r20
	.word 0xbc014009  ! 156: ADD_R	add 	%r5, %r9, %r30
	.word 0xb601647a  ! 156: ADD_I	add 	%r5, 0x047a, %r27
	.word 0xbe0a2b67  ! 156: AND_I	and 	%r8, 0x0b67, %r31
	.word 0xb611a9f5  ! 156: OR_I	or 	%r6, 0x09f5, %r27
	.word 0xa211e686  ! 156: OR_I	or 	%r7, 0x0686, %r17
	.word 0xb00a2fb3  ! 156: AND_I	and 	%r8, 0x0fb3, %r24
	.word 0xe621abc4  ! 156: STW_I	stw	%r19, [%r6 + 0x0bc4]
	.word 0xf421a09c  ! 156: STW_I	stw	%r26, [%r6 + 0x009c]
	.word 0xe6216ecc  ! 156: STW_I	stw	%r19, [%r5 + 0x0ecc]
	.word 0xf2712998  ! 156: STX_I	stx	%r25, [%r4 + 0x0998]
	.word 0xf071e100  ! 156: STX_I	stx	%r24, [%r7 + 0x0100]
	.word 0xf8216578  ! 156: STW_I	stw	%r28, [%r5 + 0x0578]
	.word 0xe271e490  ! 156: STX_I	stx	%r17, [%r7 + 0x0490]
	.word 0xe8014009  ! 157: LDUW_R	lduw	[%r5 + %r9], %r20
	.word 0xf0292aa1  ! 158: STB_I	stb	%r24, [%r4 + 0x0aa1]
	.word 0xea11a8e0  ! 159: LDUH_I	lduh	[%r6 + 0x08e0], %r21
	.word 0xb601000b  ! 159: ADD_R	add 	%r4, %r11, %r27
	.word 0xa211ea48  ! 159: OR_I	or 	%r7, 0x0a48, %r17
	.word 0xb81220b6  ! 159: OR_I	or 	%r8, 0x00b6, %r28
	bne thr0_loop_12
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_13:
	.word 0xb801400f  ! 165: ADD_R	add 	%r5, %r15, %r28
	.word 0xb008c00f  ! 165: AND_R	and 	%r3, %r15, %r24
	.word 0xa201e81a  ! 165: ADD_I	add 	%r7, 0x081a, %r17
	.word 0xb00a000f  ! 165: AND_R	and 	%r8, %r15, %r24
	.word 0xb201acb8  ! 165: ADD_I	add 	%r6, 0x0cb8, %r25
	.word 0xa6092dbe  ! 165: AND_I	and 	%r4, 0x0dbe, %r19
	.word 0xbe09c00a  ! 165: AND_R	and 	%r7, %r10, %r31
	.word 0xa6090009  ! 165: AND_R	and 	%r4, %r9, %r19
	.word 0xaa116601  ! 165: OR_I	or 	%r5, 0x0601, %r21
	.word 0xb209800a  ! 165: AND_R	and 	%r6, %r10, %r25
	.word 0xb801000e  ! 165: ADD_R	add 	%r4, %r14, %r28
	.word 0xb8092b83  ! 165: AND_I	and 	%r4, 0x0b83, %r28
	.word 0xb008c009  ! 165: AND_R	and 	%r3, %r9, %r24
	.word 0xbe08c00c  ! 165: AND_R	and 	%r3, %r12, %r31
	.word 0xbc09000d  ! 165: AND_R	and 	%r4, %r13, %r30
	.word 0xa208e1ed  ! 165: AND_I	and 	%r3, 0x01ed, %r17
	.word 0xae0a2649  ! 165: AND_I	and 	%r8, 0x0649, %r23
	.word 0xb8012306  ! 165: ADD_I	add 	%r4, 0x0306, %r28
	.word 0xa810e56d  ! 165: OR_I	or 	%r3, 0x056d, %r20
	.word 0xb6122bee  ! 165: OR_I	or 	%r8, 0x0bee, %r27
	.word 0xa811eef7  ! 165: OR_I	or 	%r7, 0x0ef7, %r20
	.word 0xbc02000e  ! 165: ADD_R	add 	%r8, %r14, %r30
	.word 0xba00c00a  ! 165: ADD_R	add 	%r3, %r10, %r29
	.word 0xae122dcc  ! 165: OR_I	or 	%r8, 0x0dcc, %r23
	.word 0xa401264d  ! 165: ADD_I	add 	%r4, 0x064d, %r18
	.word 0xbe096406  ! 165: AND_I	and 	%r5, 0x0406, %r31
	.word 0xa809000c  ! 165: AND_R	and 	%r4, %r12, %r20
	.word 0xa811800c  ! 165: OR_R	or 	%r6, %r12, %r20
	.word 0xaa10c009  ! 165: OR_R	or 	%r3, %r9, %r21
	.word 0xb4116511  ! 165: OR_I	or 	%r5, 0x0511, %r26
	.word 0xb2116f11  ! 165: OR_I	or 	%r5, 0x0f11, %r25
	.word 0xaa11000b  ! 165: OR_R	or 	%r4, %r11, %r21
	.word 0xb808c00e  ! 165: AND_R	and 	%r3, %r14, %r28
	.word 0xae01400a  ! 165: ADD_R	add 	%r5, %r10, %r23
	.word 0xb011ec94  ! 165: OR_I	or 	%r7, 0x0c94, %r24
	.word 0xb209400b  ! 165: AND_R	and 	%r5, %r11, %r25
	.word 0xb0098009  ! 165: AND_R	and 	%r6, %r9, %r24
	.word 0xbe11c00f  ! 165: OR_R	or 	%r7, %r15, %r31
	.word 0xae08e359  ! 165: AND_I	and 	%r3, 0x0359, %r23
	.word 0xa60169c4  ! 165: ADD_I	add 	%r5, 0x09c4, %r19
	.word 0xa608e9f6  ! 165: AND_I	and 	%r3, 0x09f6, %r19
	.word 0xbc0924b9  ! 165: AND_I	and 	%r4, 0x04b9, %r30
	.word 0xbc00ea5f  ! 165: ADD_I	add 	%r3, 0x0a5f, %r30
	.word 0xa8012a29  ! 165: ADD_I	add 	%r4, 0x0a29, %r20
	.word 0xae10c00f  ! 165: OR_R	or 	%r3, %r15, %r23
	.word 0xb411000d  ! 165: OR_R	or 	%r4, %r13, %r26
	.word 0xbc11000c  ! 165: OR_R	or 	%r4, %r12, %r30
	.word 0xa809605d  ! 165: AND_I	and 	%r5, 0x005d, %r20
	.word 0xb80a000b  ! 165: AND_R	and 	%r8, %r11, %r28
	.word 0xba112ad7  ! 165: OR_I	or 	%r4, 0x0ad7, %r29
	.word 0xb409400a  ! 165: AND_R	and 	%r5, %r10, %r26
	.word 0xa60160db  ! 165: ADD_I	add 	%r5, 0x00db, %r19
	.word 0xb201400a  ! 165: ADD_R	add 	%r5, %r10, %r25
	.word 0xbc01206f  ! 165: ADD_I	add 	%r4, 0x006f, %r30
	.word 0xba09800f  ! 165: AND_R	and 	%r6, %r15, %r29
	.word 0xbe08e58b  ! 165: AND_I	and 	%r3, 0x058b, %r31
	.word 0xa60a000f  ! 165: AND_R	and 	%r8, %r15, %r19
	.word 0xbc11000c  ! 165: OR_R	or 	%r4, %r12, %r30
	.word 0xac12000e  ! 165: OR_R	or 	%r8, %r14, %r22
	.word 0xaa09000e  ! 165: AND_R	and 	%r4, %r14, %r21
	.word 0xa612271c  ! 165: OR_I	or 	%r8, 0x071c, %r19
	.word 0xa201000c  ! 165: ADD_R	add 	%r4, %r12, %r17
	.word 0xba0a000b  ! 165: AND_R	and 	%r8, %r11, %r29
	.word 0xbe11800e  ! 165: OR_R	or 	%r6, %r14, %r31
	.word 0xa601c00c  ! 165: ADD_R	add 	%r7, %r12, %r19
	.word 0xb6022c1f  ! 165: ADD_I	add 	%r8, 0x0c1f, %r27
	.word 0xb20965d0  ! 165: AND_I	and 	%r5, 0x05d0, %r25
	.word 0xa20169e8  ! 165: ADD_I	add 	%r5, 0x09e8, %r17
	.word 0xbc0a000b  ! 165: AND_R	and 	%r8, %r11, %r30
	.word 0xae110009  ! 165: OR_R	or 	%r4, %r9, %r23
	.word 0xba122bb3  ! 165: OR_I	or 	%r8, 0x0bb3, %r29
	.word 0xb209a83d  ! 165: AND_I	and 	%r6, 0x083d, %r25
	.word 0xb80a22fe  ! 165: AND_I	and 	%r8, 0x02fe, %r28
	.word 0xb001400d  ! 165: ADD_R	add 	%r5, %r13, %r24
	.word 0xba0161bc  ! 165: ADD_I	add 	%r5, 0x01bc, %r29
	.word 0xb602000c  ! 165: ADD_R	add 	%r8, %r12, %r27
	.word 0xb009ec6f  ! 165: AND_I	and 	%r7, 0x0c6f, %r24
	.word 0xbe0227f0  ! 165: ADD_I	add 	%r8, 0x07f0, %r31
	.word 0xbc08e055  ! 165: AND_I	and 	%r3, 0x0055, %r30
	.word 0xa811c00d  ! 165: OR_R	or 	%r7, %r13, %r20
	.word 0xaa10e371  ! 165: OR_I	or 	%r3, 0x0371, %r21
	.word 0xbc01e0e5  ! 165: ADD_I	add 	%r7, 0x00e5, %r30
	.word 0xb209a9b4  ! 165: AND_I	and 	%r6, 0x09b4, %r25
	.word 0xbc01ea63  ! 165: ADD_I	add 	%r7, 0x0a63, %r30
	.word 0xb60a28c7  ! 165: AND_I	and 	%r8, 0x08c7, %r27
	.word 0xb400eb49  ! 165: ADD_I	add 	%r3, 0x0b49, %r26
	.word 0xac01000f  ! 165: ADD_R	add 	%r4, %r15, %r22
	.word 0xba00e086  ! 165: ADD_I	add 	%r3, 0x0086, %r29
	.word 0xb601c009  ! 165: ADD_R	add 	%r7, %r9, %r27
	.word 0xbe08efba  ! 165: AND_I	and 	%r3, 0x0fba, %r31
	.word 0xaa0a22ff  ! 165: AND_I	and 	%r8, 0x02ff, %r21
	.word 0xa811eb06  ! 165: OR_I	or 	%r7, 0x0b06, %r20
	.word 0xba09000f  ! 165: AND_R	and 	%r4, %r15, %r29
	.word 0xa40a000a  ! 165: AND_R	and 	%r8, %r10, %r18
	.word 0xbe11000d  ! 165: OR_R	or 	%r4, %r13, %r31
	.word 0xba11c00d  ! 165: OR_R	or 	%r7, %r13, %r29
	.word 0xb601400a  ! 165: ADD_R	add 	%r5, %r10, %r27
	.word 0xa612000e  ! 165: OR_R	or 	%r8, %r14, %r19
	.word 0xae10ed7f  ! 165: OR_I	or 	%r3, 0x0d7f, %r23
	.word 0xbc10e65f  ! 165: OR_I	or 	%r3, 0x065f, %r30
	.word 0xb609000e  ! 165: AND_R	and 	%r4, %r14, %r27
	.word 0xb009c00c  ! 165: AND_R	and 	%r7, %r12, %r24
	.word 0xb6092311  ! 165: AND_I	and 	%r4, 0x0311, %r27
	.word 0xb011000e  ! 165: OR_R	or 	%r4, %r14, %r24
	.word 0xb0122c10  ! 165: OR_I	or 	%r8, 0x0c10, %r24
	.word 0xb6016d3d  ! 165: ADD_I	add 	%r5, 0x0d3d, %r27
	.word 0xaa09c00f  ! 165: AND_R	and 	%r7, %r15, %r21
	.word 0xbc01400a  ! 165: ADD_R	add 	%r5, %r10, %r30
	.word 0xbe02000d  ! 165: ADD_R	add 	%r8, %r13, %r31
	.word 0xbe00e020  ! 165: ADD_I	add 	%r3, 0x0020, %r31
	.word 0xaa11000f  ! 165: OR_R	or 	%r4, %r15, %r21
	.word 0xbe11a9cc  ! 165: OR_I	or 	%r6, 0x09cc, %r31
	.word 0xb811400d  ! 165: OR_R	or 	%r5, %r13, %r28
	.word 0xa408c00b  ! 165: AND_R	and 	%r3, %r11, %r18
	.word 0xb401a5d5  ! 165: ADD_I	add 	%r6, 0x05d5, %r26
	.word 0xa211000d  ! 165: OR_R	or 	%r4, %r13, %r17
	.word 0xb80a0009  ! 165: AND_R	and 	%r8, %r9, %r28
	.word 0xa412000b  ! 165: OR_R	or 	%r8, %r11, %r18
	.word 0xb4096b59  ! 165: AND_I	and 	%r5, 0x0b59, %r26
	.word 0xac00c00e  ! 165: ADD_R	add 	%r3, %r14, %r22
	.word 0xaa09633b  ! 165: AND_I	and 	%r5, 0x033b, %r21
	.word 0xbc08c00f  ! 165: AND_R	and 	%r3, %r15, %r30
	.word 0xbc016aa6  ! 165: ADD_I	add 	%r5, 0x0aa6, %r30
	.word 0xb410eaac  ! 165: OR_I	or 	%r3, 0x0aac, %r26
	.word 0xb401800a  ! 165: ADD_R	add 	%r6, %r10, %r26
	.word 0xb211400f  ! 165: OR_R	or 	%r5, %r15, %r25
	.word 0xa811400c  ! 165: OR_R	or 	%r5, %r12, %r20
	.word 0xb000e744  ! 165: ADD_I	add 	%r3, 0x0744, %r24
	.word 0xaa01e3b7  ! 165: ADD_I	add 	%r7, 0x03b7, %r21
	.word 0xba00c00d  ! 165: ADD_R	add 	%r3, %r13, %r29
	.word 0xb4092323  ! 165: AND_I	and 	%r4, 0x0323, %r26
	.word 0xac090009  ! 165: AND_R	and 	%r4, %r9, %r22
	.word 0xba0a2817  ! 165: AND_I	and 	%r8, 0x0817, %r29
	.word 0xae09800a  ! 165: AND_R	and 	%r6, %r10, %r23
	.word 0xa211a98d  ! 165: OR_I	or 	%r6, 0x098d, %r17
	.word 0xb609a6e7  ! 165: AND_I	and 	%r6, 0x06e7, %r27
	.word 0xbc09000c  ! 165: AND_R	and 	%r4, %r12, %r30
	.word 0xba09000f  ! 165: AND_R	and 	%r4, %r15, %r29
	.word 0xa208e17c  ! 165: AND_I	and 	%r3, 0x017c, %r17
	.word 0xbe0a2a90  ! 165: AND_I	and 	%r8, 0x0a90, %r31
	.word 0xba08c00a  ! 165: AND_R	and 	%r3, %r10, %r29
	.word 0xb009000a  ! 165: AND_R	and 	%r4, %r10, %r24
	.word 0xbc09800a  ! 165: AND_R	and 	%r6, %r10, %r30
	.word 0xb810c00a  ! 165: OR_R	or 	%r3, %r10, %r28
	.word 0xa411c00b  ! 165: OR_R	or 	%r7, %r11, %r18
	.word 0xbe11400c  ! 165: OR_R	or 	%r5, %r12, %r31
	.word 0xb200eda6  ! 165: ADD_I	add 	%r3, 0x0da6, %r25
	.word 0xb601c00d  ! 165: ADD_R	add 	%r7, %r13, %r27
	.word 0xba11ae4c  ! 165: OR_I	or 	%r6, 0x0e4c, %r29
	.word 0xa200e191  ! 165: ADD_I	add 	%r3, 0x0191, %r17
	.word 0xa402000b  ! 165: ADD_R	add 	%r8, %r11, %r18
	.word 0xa212000c  ! 165: OR_R	or 	%r8, %r12, %r17
	.word 0xa40a24ae  ! 165: AND_I	and 	%r8, 0x04ae, %r18
	.word 0xa2116e6d  ! 165: OR_I	or 	%r5, 0x0e6d, %r17
	.word 0xbc00ec68  ! 165: ADD_I	add 	%r3, 0x0c68, %r30
	.word 0xb011e390  ! 165: OR_I	or 	%r7, 0x0390, %r24
	.word 0xa8096e9c  ! 165: AND_I	and 	%r5, 0x0e9c, %r20
	.word 0xb809800c  ! 165: AND_R	and 	%r6, %r12, %r28
	.word 0xb001a982  ! 165: ADD_I	add 	%r6, 0x0982, %r24
	.word 0xa401c00d  ! 165: ADD_R	add 	%r7, %r13, %r18
	.word 0xb2092f2b  ! 165: AND_I	and 	%r4, 0x0f2b, %r25
	.word 0xb809c00d  ! 165: AND_R	and 	%r7, %r13, %r28
	.word 0xa409800b  ! 165: AND_R	and 	%r6, %r11, %r18
	.word 0xa601697e  ! 165: ADD_I	add 	%r5, 0x097e, %r19
	.word 0xae08ef57  ! 165: AND_I	and 	%r3, 0x0f57, %r23
	.word 0xb009a3ff  ! 165: AND_I	and 	%r6, 0x03ff, %r24
	.word 0xbc022284  ! 165: ADD_I	add 	%r8, 0x0284, %r30
	.word 0xa810c00d  ! 165: OR_R	or 	%r3, %r13, %r20
	.word 0xbc01a370  ! 165: ADD_I	add 	%r6, 0x0370, %r30
	.word 0xbe120009  ! 165: OR_R	or 	%r8, %r9, %r31
	.word 0xa401af50  ! 165: ADD_I	add 	%r6, 0x0f50, %r18
	.word 0xa411e379  ! 165: OR_I	or 	%r7, 0x0379, %r18
	.word 0xb401e531  ! 165: ADD_I	add 	%r7, 0x0531, %r26
	.word 0xb808c00f  ! 165: AND_R	and 	%r3, %r15, %r28
	.word 0xaa00e112  ! 165: ADD_I	add 	%r3, 0x0112, %r21
	.word 0xaa11c00a  ! 165: OR_R	or 	%r7, %r10, %r21
	.word 0xaa01e804  ! 165: ADD_I	add 	%r7, 0x0804, %r21
	.word 0xa4122bf7  ! 165: OR_I	or 	%r8, 0x0bf7, %r18
	.word 0xba096aba  ! 165: AND_I	and 	%r5, 0x0aba, %r29
	.word 0xa601800c  ! 165: ADD_R	add 	%r6, %r12, %r19
	.word 0xb20a21d5  ! 165: AND_I	and 	%r8, 0x01d5, %r25
	.word 0xb0110009  ! 165: OR_R	or 	%r4, %r9, %r24
	.word 0xa401a8f9  ! 165: ADD_I	add 	%r6, 0x08f9, %r18
	.word 0xaa016bb9  ! 165: ADD_I	add 	%r5, 0x0bb9, %r21
	.word 0xaa0925b5  ! 165: AND_I	and 	%r4, 0x05b5, %r21
	.word 0xa611665a  ! 165: OR_I	or 	%r5, 0x065a, %r19
	.word 0xbe11400d  ! 165: OR_R	or 	%r5, %r13, %r31
	.word 0xb001ef18  ! 165: ADD_I	add 	%r7, 0x0f18, %r24
	.word 0xbc112e11  ! 165: OR_I	or 	%r4, 0x0e11, %r30
	.word 0xb010e0c3  ! 165: OR_I	or 	%r3, 0x00c3, %r24
	.word 0xa8090009  ! 165: AND_R	and 	%r4, %r9, %r20
	.word 0xfe71a910  ! 165: STX_I	stx	%r31, [%r6 + 0x0910]
	.word 0xfe21edac  ! 165: STW_I	stw	%r31, [%r7 + 0x0dac]
	.word 0xe421225c  ! 165: STW_I	stw	%r18, [%r4 + 0x025c]
	.word 0xf629a3fd  ! 165: STB_I	stb	%r27, [%r6 + 0x03fd]
	.word 0xf8212378  ! 165: STW_I	stw	%r28, [%r4 + 0x0378]
IRF_CE_0:
!$EV error(0,expr(@VA(.MAIN.IRF_CE_0), 16, 16), 1,IRF,ce,70,x, x,x,x, x,x,x)
!$EV error(0,expr(@VA(.MAIN.IRF_CE_0), 16, 16), 3,IRF,ce,15,x, x,x,x, x,x,x)
	.word 0xf220e5d8  ! 167: STW_I	stw	%r25, [%r3 + 0x05d8]
	.word 0xae010045
	.word 0xf470eee0  ! 169: STX_I	stx	%r26, [%r3 + 0x0ee0]
	.word 0xf0222244  ! 170: STW_I	stw	%r24, [%r8 + 0x0244]
	.word 0x32800001  ! 171: BNE	bne,a	<label_0x1>
	.word 0xb811c00a  ! 171: OR_R	or 	%r7, %r10, %r28
	.word 0xb201262e  ! 171: ADD_I	add 	%r4, 0x062e, %r25
	.word 0xb409a5b6  ! 171: AND_I	and 	%r6, 0x05b6, %r26
	bne thr0_loop_13
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_14:
	.word 0xa80a000e  ! 177: AND_R	and 	%r8, %r14, %r20
	.word 0xa611400a  ! 177: OR_R	or 	%r5, %r10, %r19
	.word 0xa411c00c  ! 177: OR_R	or 	%r7, %r12, %r18
	.word 0xaa11000f  ! 177: OR_R	or 	%r4, %r15, %r21
	.word 0xa4022fe9  ! 177: ADD_I	add 	%r8, 0x0fe9, %r18
	.word 0xac09a354  ! 177: AND_I	and 	%r6, 0x0354, %r22
	.word 0xb009400d  ! 177: AND_R	and 	%r5, %r13, %r24
	.word 0xba01634d  ! 177: ADD_I	add 	%r5, 0x034d, %r29
	.word 0xac09800c  ! 177: AND_R	and 	%r6, %r12, %r22
	.word 0xa6096c27  ! 177: AND_I	and 	%r5, 0x0c27, %r19
	.word 0xac0a2710  ! 177: AND_I	and 	%r8, 0x0710, %r22
	.word 0xb401ef15  ! 177: ADD_I	add 	%r7, 0x0f15, %r26
	.word 0xb400c00f  ! 177: ADD_R	add 	%r3, %r15, %r26
	.word 0xbc098009  ! 177: AND_R	and 	%r6, %r9, %r30
	.word 0xb411400c  ! 177: OR_R	or 	%r5, %r12, %r26
	.word 0xa401a040  ! 177: ADD_I	add 	%r6, 0x0040, %r18
	.word 0xa4022afd  ! 177: ADD_I	add 	%r8, 0x0afd, %r18
	.word 0xa801c00b  ! 177: ADD_R	add 	%r7, %r11, %r20
	.word 0xb2020009  ! 177: ADD_R	add 	%r8, %r9, %r25
	.word 0xb801800d  ! 177: ADD_R	add 	%r6, %r13, %r28
	.word 0xa609c00f  ! 177: AND_R	and 	%r7, %r15, %r19
	.word 0xa609a6c2  ! 177: AND_I	and 	%r6, 0x06c2, %r19
	.word 0xb011000e  ! 177: OR_R	or 	%r4, %r14, %r24
	.word 0xa802000e  ! 177: ADD_R	add 	%r8, %r14, %r20
	.word 0xbe11800b  ! 177: OR_R	or 	%r6, %r11, %r31
	.word 0xa8096638  ! 177: AND_I	and 	%r5, 0x0638, %r20
	.word 0xae09c00b  ! 177: AND_R	and 	%r7, %r11, %r23
	.word 0xba00e462  ! 177: ADD_I	add 	%r3, 0x0462, %r29
	.word 0xb608e8b3  ! 177: AND_I	and 	%r3, 0x08b3, %r27
	.word 0xb008c00d  ! 177: AND_R	and 	%r3, %r13, %r24
	.word 0xb411000d  ! 177: OR_R	or 	%r4, %r13, %r26
	.word 0xb609400d  ! 177: AND_R	and 	%r5, %r13, %r27
	.word 0xbc09c00f  ! 177: AND_R	and 	%r7, %r15, %r30
	.word 0xa612000c  ! 177: OR_R	or 	%r8, %r12, %r19
	.word 0xb011000b  ! 177: OR_R	or 	%r4, %r11, %r24
	.word 0xa600c00c  ! 177: ADD_R	add 	%r3, %r12, %r19
	.word 0xa40168c5  ! 177: ADD_I	add 	%r5, 0x08c5, %r18
	.word 0xb21220c4  ! 177: OR_I	or 	%r8, 0x00c4, %r25
	.word 0xa209e6c2  ! 177: AND_I	and 	%r7, 0x06c2, %r17
	.word 0xb0092b98  ! 177: AND_I	and 	%r4, 0x0b98, %r24
	.word 0xaa022c21  ! 177: ADD_I	add 	%r8, 0x0c21, %r21
	.word 0xb009c009  ! 177: AND_R	and 	%r7, %r9, %r24
	.word 0xb401e722  ! 177: ADD_I	add 	%r7, 0x0722, %r26
	.word 0xb211a075  ! 177: OR_I	or 	%r6, 0x0075, %r25
	.word 0xb608e70d  ! 177: AND_I	and 	%r3, 0x070d, %r27
	.word 0xa60229a6  ! 177: ADD_I	add 	%r8, 0x09a6, %r19
	.word 0xae096729  ! 177: AND_I	and 	%r5, 0x0729, %r23
	.word 0xac09000d  ! 177: AND_R	and 	%r4, %r13, %r22
	.word 0xac09800b  ! 177: AND_R	and 	%r6, %r11, %r22
	.word 0xbe092680  ! 177: AND_I	and 	%r4, 0x0680, %r31
	.word 0xb200ea79  ! 177: ADD_I	add 	%r3, 0x0a79, %r25
	.word 0xaa114009  ! 177: OR_R	or 	%r5, %r9, %r21
	.word 0xba0a0009  ! 177: AND_R	and 	%r8, %r9, %r29
	.word 0xbc11000b  ! 177: OR_R	or 	%r4, %r11, %r30
	.word 0xa21225ef  ! 177: OR_I	or 	%r8, 0x05ef, %r17
	.word 0xa601400c  ! 177: ADD_R	add 	%r5, %r12, %r19
	.word 0xb6122a43  ! 177: OR_I	or 	%r8, 0x0a43, %r27
	.word 0xb801e9d6  ! 177: ADD_I	add 	%r7, 0x09d6, %r28
	.word 0xb409a91b  ! 177: AND_I	and 	%r6, 0x091b, %r26
	.word 0xae00e0a8  ! 177: ADD_I	add 	%r3, 0x00a8, %r23
	.word 0xbe1120fc  ! 177: OR_I	or 	%r4, 0x00fc, %r31
	.word 0xbc0a271c  ! 177: AND_I	and 	%r8, 0x071c, %r30
	.word 0xba11c00a  ! 177: OR_R	or 	%r7, %r10, %r29
	.word 0xb40a2b73  ! 177: AND_I	and 	%r8, 0x0b73, %r26
	.word 0xb000c00b  ! 177: ADD_R	add 	%r3, %r11, %r24
	.word 0xb41167c6  ! 177: OR_I	or 	%r5, 0x07c6, %r26
	.word 0xb409eb70  ! 177: AND_I	and 	%r7, 0x0b70, %r26
	.word 0xb410c00c  ! 177: OR_R	or 	%r3, %r12, %r26
	.word 0xa611000d  ! 177: OR_R	or 	%r4, %r13, %r19
	.word 0xba11c00d  ! 177: OR_R	or 	%r7, %r13, %r29
	.word 0xbe11c00b  ! 177: OR_R	or 	%r7, %r11, %r31
	.word 0xb601ebb1  ! 177: ADD_I	add 	%r7, 0x0bb1, %r27
	.word 0xb601c00d  ! 177: ADD_R	add 	%r7, %r13, %r27
	.word 0xa201a9eb  ! 177: ADD_I	add 	%r6, 0x09eb, %r17
	.word 0xaa09000d  ! 177: AND_R	and 	%r4, %r13, %r21
	.word 0xb2016dcf  ! 177: ADD_I	add 	%r5, 0x0dcf, %r25
	.word 0xa409800a  ! 177: AND_R	and 	%r6, %r10, %r18
	.word 0xac12281a  ! 177: OR_I	or 	%r8, 0x081a, %r22
	.word 0xb000e625  ! 177: ADD_I	add 	%r3, 0x0625, %r24
	.word 0xa40a2796  ! 177: AND_I	and 	%r8, 0x0796, %r18
	.word 0xb610c00d  ! 177: OR_R	or 	%r3, %r13, %r27
	.word 0xa80a000d  ! 177: AND_R	and 	%r8, %r13, %r20
	.word 0xb40a2c18  ! 177: AND_I	and 	%r8, 0x0c18, %r26
	.word 0xb8020009  ! 177: ADD_R	add 	%r8, %r9, %r28
	.word 0xbe09000f  ! 177: AND_R	and 	%r4, %r15, %r31
	.word 0xb6020009  ! 177: ADD_R	add 	%r8, %r9, %r27
	.word 0xac08e1b4  ! 177: AND_I	and 	%r3, 0x01b4, %r22
	.word 0xa611ec73  ! 177: OR_I	or 	%r7, 0x0c73, %r19
	.word 0xb61120d9  ! 177: OR_I	or 	%r4, 0x00d9, %r27
	.word 0xb210c009  ! 177: OR_R	or 	%r3, %r9, %r25
	.word 0xb808ea2e  ! 177: AND_I	and 	%r3, 0x0a2e, %r28
	.word 0xb001613c  ! 177: ADD_I	add 	%r5, 0x013c, %r24
	.word 0xa209a141  ! 177: AND_I	and 	%r6, 0x0141, %r17
	.word 0xb811c00f  ! 177: OR_R	or 	%r7, %r15, %r28
	.word 0xa409a0e3  ! 177: AND_I	and 	%r6, 0x00e3, %r18
	.word 0xac08c009  ! 177: AND_R	and 	%r3, %r9, %r22
	.word 0xa2116321  ! 177: OR_I	or 	%r5, 0x0321, %r17
	.word 0xa611c00e  ! 177: OR_R	or 	%r7, %r14, %r19
	.word 0xa801c00a  ! 177: ADD_R	add 	%r7, %r10, %r20
	.word 0xb611800b  ! 177: OR_R	or 	%r6, %r11, %r27
	.word 0xba11c00c  ! 177: OR_R	or 	%r7, %r12, %r29
	.word 0xb009400a  ! 177: AND_R	and 	%r5, %r10, %r24
	.word 0xbc02297f  ! 177: ADD_I	add 	%r8, 0x097f, %r30
	.word 0xa209800b  ! 177: AND_R	and 	%r6, %r11, %r17
	.word 0xba01000b  ! 177: ADD_R	add 	%r4, %r11, %r29
	.word 0xb609c00d  ! 177: AND_R	and 	%r7, %r13, %r27
	.word 0xb40a22ef  ! 177: AND_I	and 	%r8, 0x02ef, %r26
	.word 0xb401400a  ! 177: ADD_R	add 	%r5, %r10, %r26
	.word 0xaa11a0b8  ! 177: OR_I	or 	%r6, 0x00b8, %r21
	.word 0xbe122d33  ! 177: OR_I	or 	%r8, 0x0d33, %r31
	.word 0xb211c00b  ! 177: OR_R	or 	%r7, %r11, %r25
	.word 0xb8120009  ! 177: OR_R	or 	%r8, %r9, %r28
	.word 0xba01c00a  ! 177: ADD_R	add 	%r7, %r10, %r29
	.word 0xb809c00d  ! 177: AND_R	and 	%r7, %r13, %r28
	.word 0xa8120009  ! 177: OR_R	or 	%r8, %r9, %r20
	.word 0xa40a000a  ! 177: AND_R	and 	%r8, %r10, %r18
	.word 0xae11e4a8  ! 177: OR_I	or 	%r7, 0x04a8, %r23
	.word 0xbc11e583  ! 177: OR_I	or 	%r7, 0x0583, %r30
	.word 0xb211e9dd  ! 177: OR_I	or 	%r7, 0x09dd, %r25
	.word 0xa4012266  ! 177: ADD_I	add 	%r4, 0x0266, %r18
	.word 0xac0a0009  ! 177: AND_R	and 	%r8, %r9, %r22
	.word 0xb211e9c8  ! 177: OR_I	or 	%r7, 0x09c8, %r25
	.word 0xb001e4d5  ! 177: ADD_I	add 	%r7, 0x04d5, %r24
	.word 0xb0092e13  ! 177: AND_I	and 	%r4, 0x0e13, %r24
	.word 0xb802000b  ! 177: ADD_R	add 	%r8, %r11, %r28
	.word 0xae11000f  ! 177: OR_R	or 	%r4, %r15, %r23
	.word 0xac09c00e  ! 177: AND_R	and 	%r7, %r14, %r22
	.word 0xb01220dc  ! 177: OR_I	or 	%r8, 0x00dc, %r24
	.word 0xbc01a2cb  ! 177: ADD_I	add 	%r6, 0x02cb, %r30
	.word 0xbe11a5ac  ! 177: OR_I	or 	%r6, 0x05ac, %r31
	.word 0xbe1163c9  ! 177: OR_I	or 	%r5, 0x03c9, %r31
	.word 0xa209c00b  ! 177: AND_R	and 	%r7, %r11, %r17
	.word 0xac10c00c  ! 177: OR_R	or 	%r3, %r12, %r22
	.word 0xac0226e9  ! 177: ADD_I	add 	%r8, 0x06e9, %r22
	.word 0xa4116694  ! 177: OR_I	or 	%r5, 0x0694, %r18
	.word 0xa608e8db  ! 177: AND_I	and 	%r3, 0x08db, %r19
	.word 0xa409a953  ! 177: AND_I	and 	%r6, 0x0953, %r18
	.word 0xa812000b  ! 177: OR_R	or 	%r8, %r11, %r20
	.word 0xaa0a2219  ! 177: AND_I	and 	%r8, 0x0219, %r21
	.word 0xa411a324  ! 177: OR_I	or 	%r6, 0x0324, %r18
	.word 0xae122a44  ! 177: OR_I	or 	%r8, 0x0a44, %r23
	.word 0xae11e91e  ! 177: OR_I	or 	%r7, 0x091e, %r23
	.word 0xa411e11f  ! 177: OR_I	or 	%r7, 0x011f, %r18
	.word 0xac09af58  ! 177: AND_I	and 	%r6, 0x0f58, %r22
	.word 0xb6016cea  ! 177: ADD_I	add 	%r5, 0x0cea, %r27
	.word 0xb802000d  ! 177: ADD_R	add 	%r8, %r13, %r28
	.word 0xaa11000f  ! 177: OR_R	or 	%r4, %r15, %r21
	.word 0xaa022825  ! 177: ADD_I	add 	%r8, 0x0825, %r21
	.word 0xac01800f  ! 177: ADD_R	add 	%r6, %r15, %r22
	.word 0xb810ec49  ! 177: OR_I	or 	%r3, 0x0c49, %r28
	.word 0xa809290b  ! 177: AND_I	and 	%r4, 0x090b, %r20
	.word 0xa810c00f  ! 177: OR_R	or 	%r3, %r15, %r20
	.word 0xa200e685  ! 177: ADD_I	add 	%r3, 0x0685, %r17
	.word 0xae11ec69  ! 177: OR_I	or 	%r7, 0x0c69, %r23
	.word 0xae11400f  ! 177: OR_R	or 	%r5, %r15, %r23
	.word 0xac12232e  ! 177: OR_I	or 	%r8, 0x032e, %r22
	.word 0xa609e056  ! 177: AND_I	and 	%r7, 0x0056, %r19
	.word 0xb40226de  ! 177: ADD_I	add 	%r8, 0x06de, %r26
	.word 0xae11a665  ! 177: OR_I	or 	%r6, 0x0665, %r23
	.word 0xac11e4cb  ! 177: OR_I	or 	%r7, 0x04cb, %r22
	.word 0xb00a2997  ! 177: AND_I	and 	%r8, 0x0997, %r24
	.word 0xa401800f  ! 177: ADD_R	add 	%r6, %r15, %r18
	.word 0xaa09a57b  ! 177: AND_I	and 	%r6, 0x057b, %r21
	.word 0xb609400f  ! 177: AND_R	and 	%r5, %r15, %r27
	.word 0xb009800a  ! 177: AND_R	and 	%r6, %r10, %r24
	.word 0xbe00c00c  ! 177: ADD_R	add 	%r3, %r12, %r31
	.word 0xba08c009  ! 177: AND_R	and 	%r3, %r9, %r29
	.word 0xbc09000f  ! 177: AND_R	and 	%r4, %r15, %r30
	.word 0xbc09000a  ! 177: AND_R	and 	%r4, %r10, %r30
	.word 0xac022dd2  ! 177: ADD_I	add 	%r8, 0x0dd2, %r22
	.word 0xa811eafc  ! 177: OR_I	or 	%r7, 0x0afc, %r20
	.word 0xa209eac2  ! 177: AND_I	and 	%r7, 0x0ac2, %r17
	.word 0xb811a3bf  ! 177: OR_I	or 	%r6, 0x03bf, %r28
	.word 0xa412000d  ! 177: OR_R	or 	%r8, %r13, %r18
	.word 0xaa116612  ! 177: OR_I	or 	%r5, 0x0612, %r21
	.word 0xb401c00f  ! 177: ADD_R	add 	%r7, %r15, %r26
	.word 0xb2116f65  ! 177: OR_I	or 	%r5, 0x0f65, %r25
	.word 0xb600c00c  ! 177: ADD_R	add 	%r3, %r12, %r27
	.word 0xa8022f45  ! 177: ADD_I	add 	%r8, 0x0f45, %r20
	.word 0xa6022ddb  ! 177: ADD_I	add 	%r8, 0x0ddb, %r19
	.word 0xbc012cd2  ! 177: ADD_I	add 	%r4, 0x0cd2, %r30
	.word 0xb8110009  ! 177: OR_R	or 	%r4, %r9, %r28
	.word 0xac11400b  ! 177: OR_R	or 	%r5, %r11, %r22
	.word 0xac11c00b  ! 177: OR_R	or 	%r7, %r11, %r22
	.word 0xb0012da5  ! 177: ADD_I	add 	%r4, 0x0da5, %r24
	.word 0xb6112d22  ! 177: OR_I	or 	%r4, 0x0d22, %r27
	.word 0xa611c00b  ! 177: OR_R	or 	%r7, %r11, %r19
	.word 0xb010ed7d  ! 177: OR_I	or 	%r3, 0x0d7d, %r24
	.word 0xac11800a  ! 177: OR_R	or 	%r6, %r10, %r22
	.word 0xa809400c  ! 177: AND_R	and 	%r5, %r12, %r20
	.word 0xa401400e  ! 177: ADD_R	add 	%r5, %r14, %r18
	.word 0xe4312d4a  ! 177: STH_I	sth	%r18, [%r4 + 0x0d4a]
	.word 0xfc2124a0  ! 177: STW_I	stw	%r30, [%r4 + 0x04a0]
	.word 0xe429a3ab  ! 177: STB_I	stb	%r18, [%r6 + 0x03ab]
	.word 0xf2296e62  ! 177: STB_I	stb	%r25, [%r5 + 0x0e62]
	.word 0xf831e61a  ! 177: STH_I	sth	%r28, [%r7 + 0x061a]
	.word 0xfa31a246  ! 178: STH_I	sth	%r29, [%r6 + 0x0246]
	.word 0xa331900b  ! 179: SRLX_R	srlx	%r6, %r11, %r17
	.word 0xf620ea14  ! 180: STW_I	stw	%r27, [%r3 + 0x0a14]
	.word 0xe72123d4  ! 181: STF_I	st	%f19, [0x03d4, %r4]
	setx  0x0000000000000a70, %r16, %r11
	.word 0xb001000b  ! 182: ADD_R	add 	%r4, %r11, %r24
	.word 0xb4012c06  ! 182: ADD_I	add 	%r4, 0x0c06, %r26
	.word 0xae110009  ! 182: OR_R	or 	%r4, %r9, %r23
	bne thr0_loop_14
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_15:
	.word 0xae10c00c  ! 188: OR_R	or 	%r3, %r12, %r23
	.word 0xa411c00c  ! 188: OR_R	or 	%r7, %r12, %r18
	.word 0xac01227d  ! 188: ADD_I	add 	%r4, 0x027d, %r22
	.word 0xb40164c7  ! 188: ADD_I	add 	%r5, 0x04c7, %r26
	.word 0xba01c00c  ! 188: ADD_R	add 	%r7, %r12, %r29
	.word 0xb011800c  ! 188: OR_R	or 	%r6, %r12, %r24
	.word 0xa609c00f  ! 188: AND_R	and 	%r7, %r15, %r19
	.word 0xb001400a  ! 188: ADD_R	add 	%r5, %r10, %r24
	.word 0xa21223cc  ! 188: OR_I	or 	%r8, 0x03cc, %r17
	.word 0xa612000a  ! 188: OR_R	or 	%r8, %r10, %r19
	.word 0xbc09000c  ! 188: AND_R	and 	%r4, %r12, %r30
	.word 0xae00e5e0  ! 188: ADD_I	add 	%r3, 0x05e0, %r23
	.word 0xa410e8f5  ! 188: OR_I	or 	%r3, 0x08f5, %r18
	.word 0xac09c00e  ! 188: AND_R	and 	%r7, %r14, %r22
	.word 0xa611400f  ! 188: OR_R	or 	%r5, %r15, %r19
	.word 0xaa096bdc  ! 188: AND_I	and 	%r5, 0x0bdc, %r21
	.word 0xa4110009  ! 188: OR_R	or 	%r4, %r9, %r18
	.word 0xb8112e1c  ! 188: OR_I	or 	%r4, 0x0e1c, %r28
	.word 0xa409a9b2  ! 188: AND_I	and 	%r6, 0x09b2, %r18
	.word 0xa801e2f5  ! 188: ADD_I	add 	%r7, 0x02f5, %r20
	.word 0xba092460  ! 188: AND_I	and 	%r4, 0x0460, %r29
	.word 0xa811ac0c  ! 188: OR_I	or 	%r6, 0x0c0c, %r20
	.word 0xa4022c60  ! 188: ADD_I	add 	%r8, 0x0c60, %r18
	.word 0xaa00c00c  ! 188: ADD_R	add 	%r3, %r12, %r21
	.word 0xba0a23c2  ! 188: AND_I	and 	%r8, 0x03c2, %r29
	.word 0xaa092291  ! 188: AND_I	and 	%r4, 0x0291, %r21
	.word 0xae09626b  ! 188: AND_I	and 	%r5, 0x026b, %r23
	.word 0xba012ece  ! 188: ADD_I	add 	%r4, 0x0ece, %r29
	.word 0xb209c00d  ! 188: AND_R	and 	%r7, %r13, %r25
	.word 0xa201400d  ! 188: ADD_R	add 	%r5, %r13, %r17
	.word 0xac09c00a  ! 188: AND_R	and 	%r7, %r10, %r22
	.word 0xa402000f  ! 188: ADD_R	add 	%r8, %r15, %r18
	.word 0xae0a29ba  ! 188: AND_I	and 	%r8, 0x09ba, %r23
	.word 0xb6092424  ! 188: AND_I	and 	%r4, 0x0424, %r27
	.word 0xac01400d  ! 188: ADD_R	add 	%r5, %r13, %r22
	.word 0xa409e721  ! 188: AND_I	and 	%r7, 0x0721, %r18
	.word 0xb210c00a  ! 188: OR_R	or 	%r3, %r10, %r25
	.word 0xb000c00b  ! 188: ADD_R	add 	%r3, %r11, %r24
	.word 0xaa11ef24  ! 188: OR_I	or 	%r7, 0x0f24, %r21
	.word 0xac090009  ! 188: AND_R	and 	%r4, %r9, %r22
	.word 0xb80a249f  ! 188: AND_I	and 	%r8, 0x049f, %r28
	.word 0xbe022772  ! 188: ADD_I	add 	%r8, 0x0772, %r31
	.word 0xa210c00b  ! 188: OR_R	or 	%r3, %r11, %r17
	.word 0xa611c00f  ! 188: OR_R	or 	%r7, %r15, %r19
	.word 0xb809000b  ! 188: AND_R	and 	%r4, %r11, %r28
	.word 0xb8096173  ! 188: AND_I	and 	%r5, 0x0173, %r28
	.word 0xb611400b  ! 188: OR_R	or 	%r5, %r11, %r27
	.word 0xbe08c00a  ! 188: AND_R	and 	%r3, %r10, %r31
	.word 0xb611c00d  ! 188: OR_R	or 	%r7, %r13, %r27
	.word 0xa801a731  ! 188: ADD_I	add 	%r6, 0x0731, %r20
	.word 0xac10c00b  ! 188: OR_R	or 	%r3, %r11, %r22
	.word 0xac00c00c  ! 188: ADD_R	add 	%r3, %r12, %r22
	.word 0xae116e69  ! 188: OR_I	or 	%r5, 0x0e69, %r23
	.word 0xa612000b  ! 188: OR_R	or 	%r8, %r11, %r19
	.word 0xae09a802  ! 188: AND_I	and 	%r6, 0x0802, %r23
	.word 0xba09669e  ! 188: AND_I	and 	%r5, 0x069e, %r29
	.word 0xbc092968  ! 188: AND_I	and 	%r4, 0x0968, %r30
	.word 0xb60960f9  ! 188: AND_I	and 	%r5, 0x00f9, %r27
	.word 0xbc11c00a  ! 188: OR_R	or 	%r7, %r10, %r30
	.word 0xae0a0009  ! 188: AND_R	and 	%r8, %r9, %r23
	.word 0xa611a957  ! 188: OR_I	or 	%r6, 0x0957, %r19
	.word 0xb200ec00  ! 188: ADD_I	add 	%r3, 0x0c00, %r25
	.word 0xbe0963d8  ! 188: AND_I	and 	%r5, 0x03d8, %r31
	.word 0xa209a1a1  ! 188: AND_I	and 	%r6, 0x01a1, %r17
	.word 0xa2114009  ! 188: OR_R	or 	%r5, %r9, %r17
	.word 0xb610c00b  ! 188: OR_R	or 	%r3, %r11, %r27
	.word 0xb809000c  ! 188: AND_R	and 	%r4, %r12, %r28
	.word 0xb611000c  ! 188: OR_R	or 	%r4, %r12, %r27
	.word 0xbe0a000e  ! 188: AND_R	and 	%r8, %r14, %r31
	.word 0xb200c00b  ! 188: ADD_R	add 	%r3, %r11, %r25
	.word 0xb808c00e  ! 188: AND_R	and 	%r3, %r14, %r28
	.word 0xaa11400a  ! 188: OR_R	or 	%r5, %r10, %r21
	.word 0xb4016f3d  ! 188: ADD_I	add 	%r5, 0x0f3d, %r26
	.word 0xb409400d  ! 188: AND_R	and 	%r5, %r13, %r26
	.word 0xb801400e  ! 188: ADD_R	add 	%r5, %r14, %r28
	.word 0xaa11c00a  ! 188: OR_R	or 	%r7, %r10, %r21
	.word 0xa411000d  ! 188: OR_R	or 	%r4, %r13, %r18
	.word 0xbc01800b  ! 188: ADD_R	add 	%r6, %r11, %r30
	.word 0xa609800a  ! 188: AND_R	and 	%r6, %r10, %r19
	.word 0xa2116c46  ! 188: OR_I	or 	%r5, 0x0c46, %r17
	.word 0xa210e730  ! 188: OR_I	or 	%r3, 0x0730, %r17
	.word 0xb409800c  ! 188: AND_R	and 	%r6, %r12, %r26
	.word 0xac112db7  ! 188: OR_I	or 	%r4, 0x0db7, %r22
	.word 0xb8092044  ! 188: AND_I	and 	%r4, 0x0044, %r28
	.word 0xa401c009  ! 188: ADD_R	add 	%r7, %r9, %r18
	.word 0xb011a222  ! 188: OR_I	or 	%r6, 0x0222, %r24
	.word 0xb811c009  ! 188: OR_R	or 	%r7, %r9, %r28
	.word 0xa610ee49  ! 188: OR_I	or 	%r3, 0x0e49, %r19
	.word 0xa6022c2c  ! 188: ADD_I	add 	%r8, 0x0c2c, %r19
	.word 0xa610e650  ! 188: OR_I	or 	%r3, 0x0650, %r19
	.word 0xbe09000e  ! 188: AND_R	and 	%r4, %r14, %r31
	.word 0xa201c00e  ! 188: ADD_R	add 	%r7, %r14, %r17
	.word 0xaa01e2a0  ! 188: ADD_I	add 	%r7, 0x02a0, %r21
	.word 0xba096be1  ! 188: AND_I	and 	%r5, 0x0be1, %r29
	.word 0xbe09800d  ! 188: AND_R	and 	%r6, %r13, %r31
	.word 0xac01a1fa  ! 188: ADD_I	add 	%r6, 0x01fa, %r22
	.word 0xaa0a26e4  ! 188: AND_I	and 	%r8, 0x06e4, %r21
	.word 0xa811800a  ! 188: OR_R	or 	%r6, %r10, %r20
	.word 0xa208efd4  ! 188: AND_I	and 	%r3, 0x0fd4, %r17
	.word 0xaa09400a  ! 188: AND_R	and 	%r5, %r10, %r21
	.word 0xb609e62a  ! 188: AND_I	and 	%r7, 0x062a, %r27
	.word 0xa61160a5  ! 188: OR_I	or 	%r5, 0x00a5, %r19
	.word 0xa612000f  ! 188: OR_R	or 	%r8, %r15, %r19
	.word 0xa609000a  ! 188: AND_R	and 	%r4, %r10, %r19
	.word 0xb4014009  ! 188: ADD_R	add 	%r5, %r9, %r26
	.word 0xac11400a  ! 188: OR_R	or 	%r5, %r10, %r22
	.word 0xbc016c30  ! 188: ADD_I	add 	%r5, 0x0c30, %r30
	.word 0xa801400a  ! 188: ADD_R	add 	%r5, %r10, %r20
	.word 0xa400eda6  ! 188: ADD_I	add 	%r3, 0x0da6, %r18
	.word 0xbc01a6ed  ! 188: ADD_I	add 	%r6, 0x06ed, %r30
	.word 0xa409400d  ! 188: AND_R	and 	%r5, %r13, %r18
	.word 0xa408c00b  ! 188: AND_R	and 	%r3, %r11, %r18
	.word 0xac1127f2  ! 188: OR_I	or 	%r4, 0x07f2, %r22
	.word 0xac010009  ! 188: ADD_R	add 	%r4, %r9, %r22
	.word 0xa211800a  ! 188: OR_R	or 	%r6, %r10, %r17
	.word 0xba0226a6  ! 188: ADD_I	add 	%r8, 0x06a6, %r29
	.word 0xb4016059  ! 188: ADD_I	add 	%r5, 0x0059, %r26
	.word 0xae01a413  ! 188: ADD_I	add 	%r6, 0x0413, %r23
	.word 0xa810e382  ! 188: OR_I	or 	%r3, 0x0382, %r20
	.word 0xb201a763  ! 188: ADD_I	add 	%r6, 0x0763, %r25
	.word 0xa8122534  ! 188: OR_I	or 	%r8, 0x0534, %r20
	.word 0xaa09800a  ! 188: AND_R	and 	%r6, %r10, %r21
	.word 0xba11400e  ! 188: OR_R	or 	%r5, %r14, %r29
	.word 0xa409000e  ! 188: AND_R	and 	%r4, %r14, %r18
	.word 0xae116fd4  ! 188: OR_I	or 	%r5, 0x0fd4, %r23
	.word 0xba0921f9  ! 188: AND_I	and 	%r4, 0x01f9, %r29
	.word 0xa810e8d8  ! 188: OR_I	or 	%r3, 0x08d8, %r20
	.word 0xa810c00a  ! 188: OR_R	or 	%r3, %r10, %r20
	.word 0xbc09ee6e  ! 188: AND_I	and 	%r7, 0x0e6e, %r30
	.word 0xa801800c  ! 188: ADD_R	add 	%r6, %r12, %r20
	.word 0xb4116966  ! 188: OR_I	or 	%r5, 0x0966, %r26
	.word 0xae01aa47  ! 188: ADD_I	add 	%r6, 0x0a47, %r23
	.word 0xbc10eb72  ! 188: OR_I	or 	%r3, 0x0b72, %r30
	.word 0xb211800c  ! 188: OR_R	or 	%r6, %r12, %r25
	.word 0xb801c009  ! 188: ADD_R	add 	%r7, %r9, %r28
	.word 0xae0a22f7  ! 188: AND_I	and 	%r8, 0x02f7, %r23
	.word 0xa408e584  ! 188: AND_I	and 	%r3, 0x0584, %r18
	.word 0xbe01000d  ! 188: ADD_R	add 	%r4, %r13, %r31
	.word 0xba11e72f  ! 188: OR_I	or 	%r7, 0x072f, %r29
	.word 0xa609800e  ! 188: AND_R	and 	%r6, %r14, %r19
	.word 0xa609c00b  ! 188: AND_R	and 	%r7, %r11, %r19
	.word 0xb212000a  ! 188: OR_R	or 	%r8, %r10, %r25
	.word 0xb800c00d  ! 188: ADD_R	add 	%r3, %r13, %r28
	.word 0xb601a837  ! 188: ADD_I	add 	%r6, 0x0837, %r27
	.word 0xb0122d37  ! 188: OR_I	or 	%r8, 0x0d37, %r24
	.word 0xbc09000c  ! 188: AND_R	and 	%r4, %r12, %r30
	.word 0xb009400c  ! 188: AND_R	and 	%r5, %r12, %r24
	.word 0xa4020009  ! 188: ADD_R	add 	%r8, %r9, %r18
	.word 0xaa00c00d  ! 188: ADD_R	add 	%r3, %r13, %r21
	.word 0xba08c00a  ! 188: AND_R	and 	%r3, %r10, %r29
	.word 0xb211aa90  ! 188: OR_I	or 	%r6, 0x0a90, %r25
	.word 0xb211c00a  ! 188: OR_R	or 	%r7, %r10, %r25
	.word 0xb211000a  ! 188: OR_R	or 	%r4, %r10, %r25
	.word 0xb611a7ae  ! 188: OR_I	or 	%r6, 0x07ae, %r27
	.word 0xa6114009  ! 188: OR_R	or 	%r5, %r9, %r19
	.word 0xba01c00b  ! 188: ADD_R	add 	%r7, %r11, %r29
	.word 0xa601000d  ! 188: ADD_R	add 	%r4, %r13, %r19
	.word 0xa202000d  ! 188: ADD_R	add 	%r8, %r13, %r17
	.word 0xb011ac2c  ! 188: OR_I	or 	%r6, 0x0c2c, %r24
	.word 0xa609a91b  ! 188: AND_I	and 	%r6, 0x091b, %r19
	.word 0xba08e556  ! 188: AND_I	and 	%r3, 0x0556, %r29
	.word 0xbe09aebe  ! 188: AND_I	and 	%r6, 0x0ebe, %r31
	.word 0xa202000a  ! 188: ADD_R	add 	%r8, %r10, %r17
	.word 0xba022779  ! 188: ADD_I	add 	%r8, 0x0779, %r29
	.word 0xb402000c  ! 188: ADD_R	add 	%r8, %r12, %r26
	.word 0xb0112e63  ! 188: OR_I	or 	%r4, 0x0e63, %r24
	.word 0xae11400b  ! 188: OR_R	or 	%r5, %r11, %r23
	.word 0xb809eb39  ! 188: AND_I	and 	%r7, 0x0b39, %r28
	.word 0xa20164f1  ! 188: ADD_I	add 	%r5, 0x04f1, %r17
	.word 0xb809800b  ! 188: AND_R	and 	%r6, %r11, %r28
	.word 0xb208c00d  ! 188: AND_R	and 	%r3, %r13, %r25
	.word 0xb609c00b  ! 188: AND_R	and 	%r7, %r11, %r27
	.word 0xb810e67b  ! 188: OR_I	or 	%r3, 0x067b, %r28
	.word 0xbc0960c8  ! 188: AND_I	and 	%r5, 0x00c8, %r30
	.word 0xa4090009  ! 188: AND_R	and 	%r4, %r9, %r18
	.word 0xbc020009  ! 188: ADD_R	add 	%r8, %r9, %r30
	.word 0xac08e6f5  ! 188: AND_I	and 	%r3, 0x06f5, %r22
	.word 0xb609653d  ! 188: AND_I	and 	%r5, 0x053d, %r27
	.word 0xa60927ff  ! 188: AND_I	and 	%r4, 0x07ff, %r19
	.word 0xbc00e494  ! 188: ADD_I	add 	%r3, 0x0494, %r30
	.word 0xa211400a  ! 188: OR_R	or 	%r5, %r10, %r17
	.word 0xa801a675  ! 188: ADD_I	add 	%r6, 0x0675, %r20
	.word 0xa600e500  ! 188: ADD_I	add 	%r3, 0x0500, %r19
	.word 0xa202000a  ! 188: ADD_R	add 	%r8, %r10, %r17
	.word 0xa811c00d  ! 188: OR_R	or 	%r7, %r13, %r20
	.word 0xa209400b  ! 188: AND_R	and 	%r5, %r11, %r17
	.word 0xa609c00a  ! 188: AND_R	and 	%r7, %r10, %r19
	.word 0xb801a58c  ! 188: ADD_I	add 	%r6, 0x058c, %r28
	.word 0xae11000a  ! 188: OR_R	or 	%r4, %r10, %r23
	.word 0xb809400a  ! 188: AND_R	and 	%r5, %r10, %r28
	.word 0xb202000c  ! 188: ADD_R	add 	%r8, %r12, %r25
	.word 0xb612000a  ! 188: OR_R	or 	%r8, %r10, %r27
	.word 0xba01e89f  ! 188: ADD_I	add 	%r7, 0x089f, %r29
	.word 0xac12000f  ! 188: OR_R	or 	%r8, %r15, %r22
	.word 0xa608eb1c  ! 188: AND_I	and 	%r3, 0x0b1c, %r19
	.word 0xa608e8bf  ! 188: AND_I	and 	%r3, 0x08bf, %r19
	.word 0xb6112882  ! 188: OR_I	or 	%r4, 0x0882, %r27
	.word 0xa809e845  ! 188: AND_I	and 	%r7, 0x0845, %r20
	.word 0xbc11400d  ! 188: OR_R	or 	%r5, %r13, %r30
	.word 0xaa00c009  ! 188: ADD_R	add 	%r3, %r9, %r21
	.word 0xbc112555  ! 188: OR_I	or 	%r4, 0x0555, %r30
	.word 0xae10ef2a  ! 188: OR_I	or 	%r3, 0x0f2a, %r23
	.word 0xb408e78a  ! 188: AND_I	and 	%r3, 0x078a, %r26
	.word 0xb201e31c  ! 188: ADD_I	add 	%r7, 0x031c, %r25
	.word 0xb2116bba  ! 188: OR_I	or 	%r5, 0x0bba, %r25
	.word 0xb200eb59  ! 188: ADD_I	add 	%r3, 0x0b59, %r25
	.word 0xa200c00f  ! 188: ADD_R	add 	%r3, %r15, %r17
	.word 0xba0223bc  ! 188: ADD_I	add 	%r8, 0x03bc, %r29
	.word 0xb811ed26  ! 188: OR_I	or 	%r7, 0x0d26, %r28
	.word 0xac118009  ! 188: OR_R	or 	%r6, %r9, %r22
	.word 0xb4014009  ! 188: ADD_R	add 	%r5, %r9, %r26
	.word 0xa209800f  ! 188: AND_R	and 	%r6, %r15, %r17
	.word 0xae01000e  ! 188: ADD_R	add 	%r4, %r14, %r23
	.word 0xb00a000f  ! 188: AND_R	and 	%r8, %r15, %r24
	.word 0xa610c00c  ! 188: OR_R	or 	%r3, %r12, %r19
	.word 0xb6092326  ! 188: AND_I	and 	%r4, 0x0326, %r27
	.word 0xb61225d7  ! 188: OR_I	or 	%r8, 0x05d7, %r27
	.word 0xbe092632  ! 188: AND_I	and 	%r4, 0x0632, %r31
	.word 0xbc020009  ! 188: ADD_R	add 	%r8, %r9, %r30
	.word 0xaa08e5e8  ! 188: AND_I	and 	%r3, 0x05e8, %r21
	.word 0xb8020009  ! 188: ADD_R	add 	%r8, %r9, %r28
	.word 0xa801ea80  ! 188: ADD_I	add 	%r7, 0x0a80, %r20
	.word 0xa2118009  ! 188: OR_R	or 	%r6, %r9, %r17
	.word 0xfe29aef7  ! 188: STB_I	stb	%r31, [%r6 + 0x0ef7]
	.word 0xfe21ef30  ! 188: STW_I	stw	%r31, [%r7 + 0x0f30]
	.word 0xee28efaa  ! 188: STB_I	stb	%r23, [%r3 + 0x0faa]
	.word 0xe871a668  ! 188: STX_I	stx	%r20, [%r6 + 0x0668]
	.word 0xe231e6a6  ! 188: STH_I	sth	%r17, [%r7 + 0x06a6]
	.word 0xf628e0dc  ! 190: STB_I	stb	%r27, [%r3 + 0x00dc]
	.word 0xae010045
	.word 0xf2312912  ! 192: STH_I	sth	%r25, [%r4 + 0x0912]
	.word 0xe6a0e61c  ! 193: STWA_I	stwa	%r19, [%r3 + 0x061c] %asi
	.word 0xb26a221c  ! 194: UDIVX_I	udivx 	%r8, 0x021c, %r25
	.word 0xa611c00a  ! 194: OR_R	or 	%r7, %r10, %r19
	.word 0xb210ea6f  ! 194: OR_I	or 	%r3, 0x0a6f, %r25
	.word 0xa809c009  ! 194: AND_R	and 	%r7, %r9, %r20
	bne thr0_loop_15
	subcc %g1, 0x1, %g1
	ba	join_lbl_0_0
	nop
fork_lbl_0_3:
	setx  0x354abaf8df651648, %r1, %r17
	setx  0x6cbc6e18268bb916, %r1, %r18
	setx  0x196e2f18af45adb8, %r1, %r19
	setx  0xf9a67c1b1dbb9fc3, %r1, %r20
	setx  0x9d1b00f3ba370efb, %r1, %r21
	setx  0xb7b66a617c0b1ae7, %r1, %r22
	setx  0xb06171f2e92d8d23, %r1, %r23
	setx  0x0638554a5234bb66, %r1, %r24
	setx  0x2ad8e2d0b7dc6e61, %r1, %r25
	setx  0xeaeaa89e9964a0ae, %r1, %r26
	setx  0x593ebe66d91209f1, %r1, %r27
	setx  0x755f603e8f40fd9d, %r1, %r28
	setx  0xf64192265ce9910c, %r1, %r29
	setx  0x33c9ddb02c96de22, %r1, %r30
	setx  0x0c7674c2469acfe3, %r1, %r31
	setx  0x0000000000000060, %r1, %r9
	setx  0x0000000000000dc0, %r1, %r10
	setx  0x0000000000000e80, %r1, %r11
	setx  0x0000000000000c10, %r1, %r12
	setx  0x00000000000007a0, %r1, %r13
	setx  0x0000000000000d90, %r1, %r14
	setx  0x0000000000000ed0, %r1, %r15
	setx MAIN_BASE_DATA_VA, %r1, %r3
	setx MAIN_BASE_DATA_VA, %r1, %r4
	setx MAIN_BASE_DATA_VA, %r1, %r5
	setx MAIN_BASE_DATA_VA, %r1, %r6
	setx MAIN_BASE_DATA_VA, %r1, %r7
	setx MAIN_BASE_DATA_VA, %r1, %r8
	setx  0x000000000000078a, %r1, %r2
	wr %r0, 0x4, %fprs
	ldd	[%r4 + 0], %f0
	ldd	[%r4 + 8], %f2
	ldd	[%r4 + 16], %f4
	ldd	[%r4 + 24], %f6
	ldd	[%r4 + 32], %f8
	ldd	[%r4 + 40], %f10
	ldd	[%r4 + 48], %f12
	ldd	[%r4 + 56], %f14
	ldd	[%r4 + 64], %f16
	ldd	[%r4 + 72], %f18
	ldd	[%r4 + 80], %f20
	ldd	[%r4 + 88], %f22
	ldd	[%r4 + 96], %f24
	ldd	[%r4 + 104], %f26
	ldd	[%r4 + 112], %f28
	ldd	[%r4 + 120], %f30
	ldd	[%r4 + 128], %f32
	ldd	[%r4 + 136], %f34
	ldd	[%r4 + 144], %f36
	ldd	[%r4 + 152], %f38
	ldd	[%r4 + 160], %f40
	ldd	[%r4 + 168], %f42
	ldd	[%r4 + 176], %f44
	ldd	[%r4 + 184], %f46
	ldd	[%r4 + 192], %f48
	ldd	[%r4 + 200], %f50
	ldd	[%r4 + 208], %f52
	ldd	[%r4 + 216], %f54
	ldd	[%r4 + 224], %f56
	ldd	[%r4 + 232], %f58
	ldd	[%r4 + 240], %f60
	ldd	[%r4 + 248], %f62
	wr  %r0, 0x80, %asi
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_0:
	.word 0xbc02000e  ! 6: ADD_R	add 	%r8, %r14, %r30
	.word 0xb600c00f  ! 6: ADD_R	add 	%r3, %r15, %r27
	.word 0xbc09a002  ! 6: AND_I	and 	%r6, 0x0002, %r30
	.word 0xb001c00f  ! 6: ADD_R	add 	%r7, %r15, %r24
	.word 0xb011e6fc  ! 6: OR_I	or 	%r7, 0x06fc, %r24
	.word 0xbe00e224  ! 6: ADD_I	add 	%r3, 0x0224, %r31
	.word 0xa6116c2f  ! 6: OR_I	or 	%r5, 0x0c2f, %r19
	.word 0xb201a553  ! 6: ADD_I	add 	%r6, 0x0553, %r25
	.word 0xa6018009  ! 6: ADD_R	add 	%r6, %r9, %r19
	.word 0xb809ef98  ! 6: AND_I	and 	%r7, 0x0f98, %r28
	.word 0xbe09400b  ! 6: AND_R	and 	%r5, %r11, %r31
	.word 0xa401ecce  ! 6: ADD_I	add 	%r7, 0x0cce, %r18
	.word 0xae0162c1  ! 6: ADD_I	add 	%r5, 0x02c1, %r23
	.word 0xa601a5a3  ! 6: ADD_I	add 	%r6, 0x05a3, %r19
	.word 0xb201a237  ! 6: ADD_I	add 	%r6, 0x0237, %r25
	.word 0xb600edf0  ! 6: ADD_I	add 	%r3, 0x0df0, %r27
	.word 0xaa012a8a  ! 6: ADD_I	add 	%r4, 0x0a8a, %r21
	.word 0xae00ec1b  ! 6: ADD_I	add 	%r3, 0x0c1b, %r23
	.word 0xb811000f  ! 6: OR_R	or 	%r4, %r15, %r28
	.word 0xa8018009  ! 6: ADD_R	add 	%r6, %r9, %r20
	.word 0xa810c009  ! 6: OR_R	or 	%r3, %r9, %r20
	.word 0xae01800e  ! 6: ADD_R	add 	%r6, %r14, %r23
	.word 0xbe01c009  ! 6: ADD_R	add 	%r7, %r9, %r31
	.word 0xaa09a797  ! 6: AND_I	and 	%r6, 0x0797, %r21
	.word 0xb001c00a  ! 6: ADD_R	add 	%r7, %r10, %r24
	.word 0xa411000c  ! 6: OR_R	or 	%r4, %r12, %r18
	.word 0xa408c00f  ! 6: AND_R	and 	%r3, %r15, %r18
	.word 0xbe12226e  ! 6: OR_I	or 	%r8, 0x026e, %r31
	.word 0xb801800b  ! 6: ADD_R	add 	%r6, %r11, %r28
	.word 0xa20165a4  ! 6: ADD_I	add 	%r5, 0x05a4, %r17
	.word 0xaa08eec0  ! 6: AND_I	and 	%r3, 0x0ec0, %r21
	.word 0xb601adaa  ! 6: ADD_I	add 	%r6, 0x0daa, %r27
	.word 0xaa010009  ! 6: ADD_R	add 	%r4, %r9, %r21
	.word 0xba0167c3  ! 6: ADD_I	add 	%r5, 0x07c3, %r29
	.word 0xbc09400e  ! 6: AND_R	and 	%r5, %r14, %r30
	.word 0xba01800d  ! 6: ADD_R	add 	%r6, %r13, %r29
	.word 0xbe00e526  ! 6: ADD_I	add 	%r3, 0x0526, %r31
	.word 0xaa10c00b  ! 6: OR_R	or 	%r3, %r11, %r21
	.word 0xba12000b  ! 6: OR_R	or 	%r8, %r11, %r29
	.word 0xb811664e  ! 6: OR_I	or 	%r5, 0x064e, %r28
	.word 0xbc01800d  ! 6: ADD_R	add 	%r6, %r13, %r30
	.word 0xb601800a  ! 6: ADD_R	add 	%r6, %r10, %r27
	.word 0xb6122f29  ! 6: OR_I	or 	%r8, 0x0f29, %r27
	.word 0xae01c00a  ! 6: ADD_R	add 	%r7, %r10, %r23
	.word 0xb20a000b  ! 6: AND_R	and 	%r8, %r11, %r25
	.word 0xa4112568  ! 6: OR_I	or 	%r4, 0x0568, %r18
	.word 0xa4092e73  ! 6: AND_I	and 	%r4, 0x0e73, %r18
	.word 0xa610ec8d  ! 6: OR_I	or 	%r3, 0x0c8d, %r19
	.word 0xb601400e  ! 6: ADD_R	add 	%r5, %r14, %r27
	.word 0xb411a8a0  ! 6: OR_I	or 	%r6, 0x08a0, %r26
	.word 0xbc09800f  ! 6: AND_R	and 	%r6, %r15, %r30
	.word 0xae016279  ! 6: ADD_I	add 	%r5, 0x0279, %r23
	.word 0xba01400d  ! 6: ADD_R	add 	%r5, %r13, %r29
	.word 0xb00a2e7f  ! 6: AND_I	and 	%r8, 0x0e7f, %r24
	.word 0xa601e462  ! 6: ADD_I	add 	%r7, 0x0462, %r19
	.word 0xa611400d  ! 6: OR_R	or 	%r5, %r13, %r19
	.word 0xba09a338  ! 6: AND_I	and 	%r6, 0x0338, %r29
	.word 0xac08c00f  ! 6: AND_R	and 	%r3, %r15, %r22
	.word 0xb011800c  ! 6: OR_R	or 	%r6, %r12, %r24
	.word 0xac020009  ! 6: ADD_R	add 	%r8, %r9, %r22
	.word 0xa611000d  ! 6: OR_R	or 	%r4, %r13, %r19
	.word 0xae10ec6c  ! 6: OR_I	or 	%r3, 0x0c6c, %r23
	.word 0xa2014009  ! 6: ADD_R	add 	%r5, %r9, %r17
	.word 0xba112139  ! 6: OR_I	or 	%r4, 0x0139, %r29
	.word 0xaa012d8d  ! 6: ADD_I	add 	%r4, 0x0d8d, %r21
	.word 0xb410c00a  ! 6: OR_R	or 	%r3, %r10, %r26
	.word 0xaa10e54c  ! 6: OR_I	or 	%r3, 0x054c, %r21
	.word 0xb2092ed5  ! 6: AND_I	and 	%r4, 0x0ed5, %r25
	.word 0xae016771  ! 6: ADD_I	add 	%r5, 0x0771, %r23
	.word 0xb811e7a3  ! 6: OR_I	or 	%r7, 0x07a3, %r28
	.word 0xbe010009  ! 6: ADD_R	add 	%r4, %r9, %r31
	.word 0xa412000d  ! 6: OR_R	or 	%r8, %r13, %r18
	.word 0xb001000f  ! 6: ADD_R	add 	%r4, %r15, %r24
	.word 0xa209c00f  ! 6: AND_R	and 	%r7, %r15, %r17
	.word 0xb411400e  ! 6: OR_R	or 	%r5, %r14, %r26
	.word 0xaa09c00f  ! 6: AND_R	and 	%r7, %r15, %r21
	.word 0xb201000c  ! 6: ADD_R	add 	%r4, %r12, %r25
	.word 0xa811800c  ! 6: OR_R	or 	%r6, %r12, %r20
	.word 0xa401000a  ! 6: ADD_R	add 	%r4, %r10, %r18
	.word 0xa60122da  ! 6: ADD_I	add 	%r4, 0x02da, %r19
	.word 0xbe01400d  ! 6: ADD_R	add 	%r5, %r13, %r31
	.word 0xae12000e  ! 6: OR_R	or 	%r8, %r14, %r23
	.word 0xac09c00d  ! 6: AND_R	and 	%r7, %r13, %r22
	.word 0xb011400a  ! 6: OR_R	or 	%r5, %r10, %r24
	.word 0xb2096519  ! 6: AND_I	and 	%r5, 0x0519, %r25
	.word 0xb409400e  ! 6: AND_R	and 	%r5, %r14, %r26
	.word 0xae00e636  ! 6: ADD_I	add 	%r3, 0x0636, %r23
	.word 0xbc08ee9f  ! 6: AND_I	and 	%r3, 0x0e9f, %r30
	.word 0xa409c00e  ! 6: AND_R	and 	%r7, %r14, %r18
	.word 0xa211400d  ! 6: OR_R	or 	%r5, %r13, %r17
	.word 0xa609c009  ! 6: AND_R	and 	%r7, %r9, %r19
	.word 0xbe090009  ! 6: AND_R	and 	%r4, %r9, %r31
	.word 0xae09e28f  ! 6: AND_I	and 	%r7, 0x028f, %r23
	.word 0xb801afda  ! 6: ADD_I	add 	%r6, 0x0fda, %r28
	.word 0xb811400e  ! 6: OR_R	or 	%r5, %r14, %r28
	.word 0xb8096dc7  ! 6: AND_I	and 	%r5, 0x0dc7, %r28
	.word 0xaa016379  ! 6: ADD_I	add 	%r5, 0x0379, %r21
	.word 0xbe11a18b  ! 6: OR_I	or 	%r6, 0x018b, %r31
	.word 0xbe11400e  ! 6: OR_R	or 	%r5, %r14, %r31
	.word 0xa6022a98  ! 6: ADD_I	add 	%r8, 0x0a98, %r19
	.word 0xb201ebda  ! 6: ADD_I	add 	%r7, 0x0bda, %r25
	.word 0xa600c00f  ! 6: ADD_R	add 	%r3, %r15, %r19
	.word 0xa411aea6  ! 6: OR_I	or 	%r6, 0x0ea6, %r18
	.word 0xa409000a  ! 6: AND_R	and 	%r4, %r10, %r18
	.word 0xba09800c  ! 6: AND_R	and 	%r6, %r12, %r29
	.word 0xbc01e0f7  ! 6: ADD_I	add 	%r7, 0x00f7, %r30
	.word 0xa601eb29  ! 6: ADD_I	add 	%r7, 0x0b29, %r19
	.word 0xb201800f  ! 6: ADD_R	add 	%r6, %r15, %r25
	.word 0xa401ac9e  ! 6: ADD_I	add 	%r6, 0x0c9e, %r18
	.word 0xbc02000b  ! 6: ADD_R	add 	%r8, %r11, %r30
	.word 0xa409400b  ! 6: AND_R	and 	%r5, %r11, %r18
	.word 0xac0169b0  ! 6: ADD_I	add 	%r5, 0x09b0, %r22
	.word 0xbe02000a  ! 6: ADD_R	add 	%r8, %r10, %r31
	.word 0xa211400a  ! 6: OR_R	or 	%r5, %r10, %r17
	.word 0xaa01285b  ! 6: ADD_I	add 	%r4, 0x085b, %r21
	.word 0xb40a000e  ! 6: AND_R	and 	%r8, %r14, %r26
	.word 0xa209ab96  ! 6: AND_I	and 	%r6, 0x0b96, %r17
	.word 0xb009699e  ! 6: AND_I	and 	%r5, 0x099e, %r24
	.word 0xa800c00f  ! 6: ADD_R	add 	%r3, %r15, %r20
	.word 0xa611000f  ! 6: OR_R	or 	%r4, %r15, %r19
	.word 0xb411800b  ! 6: OR_R	or 	%r6, %r11, %r26
	.word 0xba08c009  ! 6: AND_R	and 	%r3, %r9, %r29
	.word 0xb0122212  ! 6: OR_I	or 	%r8, 0x0212, %r24
	.word 0xb001800b  ! 6: ADD_R	add 	%r6, %r11, %r24
	.word 0xa40964fd  ! 6: AND_I	and 	%r5, 0x04fd, %r18
	.word 0xa2092009  ! 6: AND_I	and 	%r4, 0x0009, %r17
	.word 0xb601800c  ! 6: ADD_R	add 	%r6, %r12, %r27
	.word 0xa80123e6  ! 6: ADD_I	add 	%r4, 0x03e6, %r20
	.word 0xb009000e  ! 6: AND_R	and 	%r4, %r14, %r24
	.word 0xb602000a  ! 6: ADD_R	add 	%r8, %r10, %r27
	.word 0xac09c00e  ! 6: AND_R	and 	%r7, %r14, %r22
	.word 0xb2122657  ! 6: OR_I	or 	%r8, 0x0657, %r25
	.word 0xb0012a1b  ! 6: ADD_I	add 	%r4, 0x0a1b, %r24
	.word 0xa6012b35  ! 6: ADD_I	add 	%r4, 0x0b35, %r19
	.word 0xa4114009  ! 6: OR_R	or 	%r5, %r9, %r18
	.word 0xa411c009  ! 6: OR_R	or 	%r7, %r9, %r18
	.word 0xbc09e61a  ! 6: AND_I	and 	%r7, 0x061a, %r30
	.word 0xb010e2e1  ! 6: OR_I	or 	%r3, 0x02e1, %r24
	.word 0xb612274d  ! 6: OR_I	or 	%r8, 0x074d, %r27
	.word 0xaa09400c  ! 6: AND_R	and 	%r5, %r12, %r21
	.word 0xb6022971  ! 6: ADD_I	add 	%r8, 0x0971, %r27
	.word 0xa411e876  ! 6: OR_I	or 	%r7, 0x0876, %r18
	.word 0xb209800f  ! 6: AND_R	and 	%r6, %r15, %r25
	.word 0xb6016ba6  ! 6: ADD_I	add 	%r5, 0x0ba6, %r27
	.word 0xa809800e  ! 6: AND_R	and 	%r6, %r14, %r20
	.word 0xbe122612  ! 6: OR_I	or 	%r8, 0x0612, %r31
	.word 0xa212000e  ! 6: OR_R	or 	%r8, %r14, %r17
	.word 0xaa10c00b  ! 6: OR_R	or 	%r3, %r11, %r21
	.word 0xb601a52f  ! 6: ADD_I	add 	%r6, 0x052f, %r27
	.word 0xa410c00d  ! 6: OR_R	or 	%r3, %r13, %r18
	.word 0xac016375  ! 6: ADD_I	add 	%r5, 0x0375, %r22
	.word 0xae00c009  ! 6: ADD_R	add 	%r3, %r9, %r23
	.word 0xbe122c22  ! 6: OR_I	or 	%r8, 0x0c22, %r31
	.word 0xac11ae84  ! 6: OR_I	or 	%r6, 0x0e84, %r22
	.word 0xae11800f  ! 6: OR_R	or 	%r6, %r15, %r23
	.word 0xa212000f  ! 6: OR_R	or 	%r8, %r15, %r17
	.word 0xb40a000f  ! 6: AND_R	and 	%r8, %r15, %r26
	.word 0xb808e81b  ! 6: AND_I	and 	%r3, 0x081b, %r28
	.word 0xbc11ee78  ! 6: OR_I	or 	%r7, 0x0e78, %r30
	.word 0xba09400d  ! 6: AND_R	and 	%r5, %r13, %r29
	.word 0xa211e716  ! 6: OR_I	or 	%r7, 0x0716, %r17
	.word 0xb6096999  ! 6: AND_I	and 	%r5, 0x0999, %r27
	.word 0xa611800d  ! 6: OR_R	or 	%r6, %r13, %r19
	.word 0xb811ac01  ! 6: OR_I	or 	%r6, 0x0c01, %r28
	.word 0xb409000d  ! 6: AND_R	and 	%r4, %r13, %r26
	.word 0xba09000d  ! 6: AND_R	and 	%r4, %r13, %r29
	.word 0xb4112485  ! 6: OR_I	or 	%r4, 0x0485, %r26
	.word 0xb011c00e  ! 6: OR_R	or 	%r7, %r14, %r24
	.word 0xac114009  ! 6: OR_R	or 	%r5, %r9, %r22
	.word 0xa809800a  ! 6: AND_R	and 	%r6, %r10, %r20
	.word 0xbc11000c  ! 6: OR_R	or 	%r4, %r12, %r30
	.word 0xb008c00a  ! 6: AND_R	and 	%r3, %r10, %r24
	.word 0xae11800a  ! 6: OR_R	or 	%r6, %r10, %r23
	.word 0xb402245e  ! 6: ADD_I	add 	%r8, 0x045e, %r26
	.word 0xb6122027  ! 6: OR_I	or 	%r8, 0x0027, %r27
	.word 0xbe112fc9  ! 6: OR_I	or 	%r4, 0x0fc9, %r31
	.word 0xb011a294  ! 6: OR_I	or 	%r6, 0x0294, %r24
	.word 0xa611800c  ! 6: OR_R	or 	%r6, %r12, %r19
	.word 0xba11edbe  ! 6: OR_I	or 	%r7, 0x0dbe, %r29
	.word 0xa409800e  ! 6: AND_R	and 	%r6, %r14, %r18
	.word 0xa60a000e  ! 6: AND_R	and 	%r8, %r14, %r19
	.word 0xb001c00f  ! 6: ADD_R	add 	%r7, %r15, %r24
	.word 0xa211400e  ! 6: OR_R	or 	%r5, %r14, %r17
	.word 0xae08ebad  ! 6: AND_I	and 	%r3, 0x0bad, %r23
	.word 0xae10c00c  ! 6: OR_R	or 	%r3, %r12, %r23
	.word 0xba11400f  ! 6: OR_R	or 	%r5, %r15, %r29
	.word 0xb610e83b  ! 6: OR_I	or 	%r3, 0x083b, %r27
	.word 0xba09c00d  ! 6: AND_R	and 	%r7, %r13, %r29
	.word 0xa2098009  ! 6: AND_R	and 	%r6, %r9, %r17
	.word 0xb8022ada  ! 6: ADD_I	add 	%r8, 0x0ada, %r28
	.word 0xa4098009  ! 6: AND_R	and 	%r6, %r9, %r18
	.word 0xb8020009  ! 6: ADD_R	add 	%r8, %r9, %r28
	.word 0xba11400a  ! 6: OR_R	or 	%r5, %r10, %r29
	.word 0xbc01611d  ! 6: ADD_I	add 	%r5, 0x011d, %r30
	.word 0xb809000c  ! 6: AND_R	and 	%r4, %r12, %r28
	.word 0xb609c00a  ! 6: AND_R	and 	%r7, %r10, %r27
	.word 0xae01c00b  ! 6: ADD_R	add 	%r7, %r11, %r23
	.word 0xa201400b  ! 6: ADD_R	add 	%r5, %r11, %r17
	.word 0xb60169b1  ! 6: ADD_I	add 	%r5, 0x09b1, %r27
	.word 0xb011a794  ! 6: OR_I	or 	%r6, 0x0794, %r24
	.word 0xbe09400f  ! 6: AND_R	and 	%r5, %r15, %r31
	.word 0xb601c00b  ! 6: ADD_R	add 	%r7, %r11, %r27
	.word 0xbe09800a  ! 6: AND_R	and 	%r6, %r10, %r31
	.word 0xb20a0009  ! 6: AND_R	and 	%r8, %r9, %r25
	.word 0xb811000e  ! 6: OR_R	or 	%r4, %r14, %r28
	.word 0xb209654a  ! 6: AND_I	and 	%r5, 0x054a, %r25
	.word 0xbe10c00e  ! 6: OR_R	or 	%r3, %r14, %r31
	.word 0xe2222080  ! 6: STW_I	stw	%r17, [%r8 + 0x0080]
	.word 0xec30e566  ! 6: STH_I	sth	%r22, [%r3 + 0x0566]
	.word 0xfa7169f0  ! 6: STX_I	stx	%r29, [%r5 + 0x09f0]
	.word 0xec712930  ! 6: STX_I	stx	%r22, [%r4 + 0x0930]
	.word 0xe62929a2  ! 6: STB_I	stb	%r19, [%r4 + 0x09a2]
	.word 0xfc20e660  ! 7: STW_I	stw	%r30, [%r3 + 0x0660]
	.word 0xae010045
	.word 0xf229ace2  ! 9: STB_I	stb	%r25, [%r6 + 0x0ce2]
	.word 0xf4292e9d  ! 10: STB_I	stb	%r26, [%r4 + 0x0e9d]
IC_ERR_3:
!$EV error(3,expr(@VA(.MAIN.IC_ERR_3), 16, 16),1,IC_DATA,IR,14,x)
	setx  0x00000000000004a0, %r16, %r14
	setx  0x00000000000024b8, %r16, %r2
	.word 0xaa01000e  ! 12: ADD_R	add 	%r4, %r14, %r21
	.word 0xba0a2111  ! 12: AND_I	and 	%r8, 0x0111, %r29
	.word 0xa401400f  ! 12: ADD_R	add 	%r5, %r15, %r18
	bne thr3_loop_0
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_1:
	.word 0xba11abd1  ! 20: OR_I	or 	%r6, 0x0bd1, %r29
	.word 0xb800ed9f  ! 20: ADD_I	add 	%r3, 0x0d9f, %r28
	.word 0xb409000a  ! 20: AND_R	and 	%r4, %r10, %r26
	.word 0xaa012405  ! 20: ADD_I	add 	%r4, 0x0405, %r21
	.word 0xac020009  ! 20: ADD_R	add 	%r8, %r9, %r22
	.word 0xb0022b43  ! 20: ADD_I	add 	%r8, 0x0b43, %r24
	.word 0xa411a135  ! 20: OR_I	or 	%r6, 0x0135, %r18
	.word 0xb000c00a  ! 20: ADD_R	add 	%r3, %r10, %r24
	.word 0xae016841  ! 20: ADD_I	add 	%r5, 0x0841, %r23
	.word 0xaa09000c  ! 20: AND_R	and 	%r4, %r12, %r21
	.word 0xbe01400b  ! 20: ADD_R	add 	%r5, %r11, %r31
	.word 0xaa12000c  ! 20: OR_R	or 	%r8, %r12, %r21
	.word 0xa4116064  ! 20: OR_I	or 	%r5, 0x0064, %r18
	.word 0xa8120009  ! 20: OR_R	or 	%r8, %r9, %r20
	.word 0xb411aef1  ! 20: OR_I	or 	%r6, 0x0ef1, %r26
	.word 0xb811ef0c  ! 20: OR_I	or 	%r7, 0x0f0c, %r28
	.word 0xb00a27dd  ! 20: AND_I	and 	%r8, 0x07dd, %r24
	.word 0xa80965c6  ! 20: AND_I	and 	%r5, 0x05c6, %r20
	.word 0xba01670a  ! 20: ADD_I	add 	%r5, 0x070a, %r29
	.word 0xa81121f4  ! 20: OR_I	or 	%r4, 0x01f4, %r20
	.word 0xbc096a7d  ! 20: AND_I	and 	%r5, 0x0a7d, %r30
	.word 0xac08c00f  ! 20: AND_R	and 	%r3, %r15, %r22
	.word 0xa61169bb  ! 20: OR_I	or 	%r5, 0x09bb, %r19
	.word 0xba11400b  ! 20: OR_R	or 	%r5, %r11, %r29
	.word 0xa801e809  ! 20: ADD_I	add 	%r7, 0x0809, %r20
	.word 0xb6020009  ! 20: ADD_R	add 	%r8, %r9, %r27
	.word 0xa401c009  ! 20: ADD_R	add 	%r7, %r9, %r18
	.word 0xb0096693  ! 20: AND_I	and 	%r5, 0x0693, %r24
	.word 0xb801642e  ! 20: ADD_I	add 	%r5, 0x042e, %r28
	.word 0xbc0126bc  ! 20: ADD_I	add 	%r4, 0x06bc, %r30
	.word 0xaa00c009  ! 20: ADD_R	add 	%r3, %r9, %r21
	.word 0xa411e704  ! 20: OR_I	or 	%r7, 0x0704, %r18
	.word 0xb601c00a  ! 20: ADD_R	add 	%r7, %r10, %r27
	.word 0xb2016d54  ! 20: ADD_I	add 	%r5, 0x0d54, %r25
	.word 0xac01400f  ! 20: ADD_R	add 	%r5, %r15, %r22
	.word 0xaa096938  ! 20: AND_I	and 	%r5, 0x0938, %r21
	.word 0xba022655  ! 20: ADD_I	add 	%r8, 0x0655, %r29
	.word 0xa809000e  ! 20: AND_R	and 	%r4, %r14, %r20
	.word 0xba08c00d  ! 20: AND_R	and 	%r3, %r13, %r29
	.word 0xb210ebdd  ! 20: OR_I	or 	%r3, 0x0bdd, %r25
	.word 0xb611ea5a  ! 20: OR_I	or 	%r7, 0x0a5a, %r27
	.word 0xb601a505  ! 20: ADD_I	add 	%r6, 0x0505, %r27
	.word 0xac12000f  ! 20: OR_R	or 	%r8, %r15, %r22
	.word 0xba01c00f  ! 20: ADD_R	add 	%r7, %r15, %r29
	.word 0xbe09c00f  ! 20: AND_R	and 	%r7, %r15, %r31
	.word 0xba11000c  ! 20: OR_R	or 	%r4, %r12, %r29
	.word 0xa2016199  ! 20: ADD_I	add 	%r5, 0x0199, %r17
	.word 0xa801400d  ! 20: ADD_R	add 	%r5, %r13, %r20
	.word 0xaa118009  ! 20: OR_R	or 	%r6, %r9, %r21
	.word 0xbc01800b  ! 20: ADD_R	add 	%r6, %r11, %r30
	.word 0xa612000f  ! 20: OR_R	or 	%r8, %r15, %r19
	.word 0xac0123b0  ! 20: ADD_I	add 	%r4, 0x03b0, %r22
	.word 0xa6116e47  ! 20: OR_I	or 	%r5, 0x0e47, %r19
	.word 0xa409c00d  ! 20: AND_R	and 	%r7, %r13, %r18
	.word 0xba096ecd  ! 20: AND_I	and 	%r5, 0x0ecd, %r29
	.word 0xac09ab0b  ! 20: AND_I	and 	%r6, 0x0b0b, %r22
	.word 0xb201a0b6  ! 20: ADD_I	add 	%r6, 0x00b6, %r25
	.word 0xaa014009  ! 20: ADD_R	add 	%r5, %r9, %r21
	.word 0xb409c00b  ! 20: AND_R	and 	%r7, %r11, %r26
	.word 0xb6092198  ! 20: AND_I	and 	%r4, 0x0198, %r27
	.word 0xbc09000e  ! 20: AND_R	and 	%r4, %r14, %r30
	.word 0xba11ebff  ! 20: OR_I	or 	%r7, 0x0bff, %r29
	.word 0xbe0a28df  ! 20: AND_I	and 	%r8, 0x08df, %r31
	.word 0xaa01800e  ! 20: ADD_R	add 	%r6, %r14, %r21
	.word 0xb011c00a  ! 20: OR_R	or 	%r7, %r10, %r24
	.word 0xa2012269  ! 20: ADD_I	add 	%r4, 0x0269, %r17
	.word 0xb401a38f  ! 20: ADD_I	add 	%r6, 0x038f, %r26
	.word 0xae0a2d61  ! 20: AND_I	and 	%r8, 0x0d61, %r23
	.word 0xa6092c44  ! 20: AND_I	and 	%r4, 0x0c44, %r19
	.word 0xb609400b  ! 20: AND_R	and 	%r5, %r11, %r27
	.word 0xa801800b  ! 20: ADD_R	add 	%r6, %r11, %r20
	.word 0xbc09800d  ! 20: AND_R	and 	%r6, %r13, %r30
	.word 0xb2092c68  ! 20: AND_I	and 	%r4, 0x0c68, %r25
	.word 0xb4116aca  ! 20: OR_I	or 	%r5, 0x0aca, %r26
	.word 0xb401209a  ! 20: ADD_I	add 	%r4, 0x009a, %r26
	.word 0xbe09c00b  ! 20: AND_R	and 	%r7, %r11, %r31
	.word 0xb2122914  ! 20: OR_I	or 	%r8, 0x0914, %r25
	.word 0xa2122ad4  ! 20: OR_I	or 	%r8, 0x0ad4, %r17
	.word 0xa611400a  ! 20: OR_R	or 	%r5, %r10, %r19
	.word 0xa2092d23  ! 20: AND_I	and 	%r4, 0x0d23, %r17
	.word 0xa211400b  ! 20: OR_R	or 	%r5, %r11, %r17
	.word 0xa411e249  ! 20: OR_I	or 	%r7, 0x0249, %r18
	.word 0xa201a44a  ! 20: ADD_I	add 	%r6, 0x044a, %r17
	.word 0xbc01800d  ! 20: ADD_R	add 	%r6, %r13, %r30
	.word 0xb211ab82  ! 20: OR_I	or 	%r6, 0x0b82, %r25
	.word 0xb20a2167  ! 20: AND_I	and 	%r8, 0x0167, %r25
	.word 0xa409000d  ! 20: AND_R	and 	%r4, %r13, %r18
	.word 0xf429e3fc  ! 20: STB_I	stb	%r26, [%r7 + 0x03fc]
	.word 0xfa722b70  ! 20: STX_I	stx	%r29, [%r8 + 0x0b70]
	.word 0xf831adda  ! 20: STH_I	sth	%r28, [%r6 + 0x0dda]
	.word 0xec71abb8  ! 20: STX_I	stx	%r22, [%r6 + 0x0bb8]
	.word 0xec71a9d8  ! 20: STX_I	stx	%r22, [%r6 + 0x09d8]
	.word 0xfc71ec18  ! 20: STX_I	stx	%r30, [%r7 + 0x0c18]
	.word 0xe220e114  ! 20: STW_I	stw	%r17, [%r3 + 0x0114]
DC_ERR_3:
!$EV error(3,expr(@VA(.MAIN.DC_ERR_3), 16, 16),1,DC_DATA,20)
	.word 0xf419e7d8  ! 23: LDD_I	ldd	[%r7 + 0x07d8], %r26
	.word 0xbc01c00d  ! 23: ADD_R	add 	%r7, %r13, %r30
	.word 0xc0f00982  ! 25: STXA_R	stxa	%r0, [%r0 + %r2] 0x4c
IC_ERR_7:
!$EV error(3,expr(@VA(.MAIN.IC_ERR_7), 16, 16),1,IC_DATA,IR,1,x)
	.word 0xec41400a  ! 27: LDSW_R	ldsw	[%r5 + %r10], %r22
	.word 0xbe01ee0d  ! 27: ADD_I	add 	%r7, 0x0e0d, %r31
	.word 0xae09e9cb  ! 27: AND_I	and 	%r7, 0x09cb, %r23
	.word 0xac01c00f  ! 27: ADD_R	add 	%r7, %r15, %r22
	bne thr3_loop_1
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_2:
	.word 0xa211efa2  ! 33: OR_I	or 	%r7, 0x0fa2, %r17
	.word 0xba11e417  ! 33: OR_I	or 	%r7, 0x0417, %r29
	.word 0xa609800f  ! 33: AND_R	and 	%r6, %r15, %r19
	.word 0xae11a228  ! 33: OR_I	or 	%r6, 0x0228, %r23
	.word 0xaa09000f  ! 33: AND_R	and 	%r4, %r15, %r21
	.word 0xa801000e  ! 33: ADD_R	add 	%r4, %r14, %r20
	.word 0xae11e082  ! 33: OR_I	or 	%r7, 0x0082, %r23
	.word 0xae096048  ! 33: AND_I	and 	%r5, 0x0048, %r23
	.word 0xb8118009  ! 33: OR_R	or 	%r6, %r9, %r28
	.word 0xa808c00d  ! 33: AND_R	and 	%r3, %r13, %r20
	.word 0xaa09ac23  ! 33: AND_I	and 	%r6, 0x0c23, %r21
	.word 0xb4118009  ! 33: OR_R	or 	%r6, %r9, %r26
	.word 0xb610e763  ! 33: OR_I	or 	%r3, 0x0763, %r27
	.word 0xa201000d  ! 33: ADD_R	add 	%r4, %r13, %r17
	.word 0xb401c00a  ! 33: ADD_R	add 	%r7, %r10, %r26
	.word 0xb0116e25  ! 33: OR_I	or 	%r5, 0x0e25, %r24
	.word 0xb408e5be  ! 33: AND_I	and 	%r3, 0x05be, %r26
	.word 0xae11c009  ! 33: OR_R	or 	%r7, %r9, %r23
	.word 0xa202254f  ! 33: ADD_I	add 	%r8, 0x054f, %r17
	.word 0xb009c00c  ! 33: AND_R	and 	%r7, %r12, %r24
	.word 0xa209400e  ! 33: AND_R	and 	%r5, %r14, %r17
	.word 0xb211a922  ! 33: OR_I	or 	%r6, 0x0922, %r25
	.word 0xa609a87f  ! 33: AND_I	and 	%r6, 0x087f, %r19
	.word 0xa201400e  ! 33: ADD_R	add 	%r5, %r14, %r17
	.word 0xaa11400b  ! 33: OR_R	or 	%r5, %r11, %r21
	.word 0xba122023  ! 33: OR_I	or 	%r8, 0x0023, %r29
	.word 0xbe09c009  ! 33: AND_R	and 	%r7, %r9, %r31
	.word 0xac08c00f  ! 33: AND_R	and 	%r3, %r15, %r22
	.word 0xb801216d  ! 33: ADD_I	add 	%r4, 0x016d, %r28
	.word 0xa412000e  ! 33: OR_R	or 	%r8, %r14, %r18
	.word 0xae0a27e2  ! 33: AND_I	and 	%r8, 0x07e2, %r23
	.word 0xb809c00b  ! 33: AND_R	and 	%r7, %r11, %r28
	.word 0xb201e3f0  ! 33: ADD_I	add 	%r7, 0x03f0, %r25
	.word 0xa209eb39  ! 33: AND_I	and 	%r7, 0x0b39, %r17
	.word 0xbc112c29  ! 33: OR_I	or 	%r4, 0x0c29, %r30
	.word 0xae09400f  ! 33: AND_R	and 	%r5, %r15, %r23
	.word 0xa211622c  ! 33: OR_I	or 	%r5, 0x022c, %r17
	.word 0xba09c00d  ! 33: AND_R	and 	%r7, %r13, %r29
	.word 0xba01a5e4  ! 33: ADD_I	add 	%r6, 0x05e4, %r29
	.word 0xae10c00d  ! 33: OR_R	or 	%r3, %r13, %r23
	.word 0xbc10e196  ! 33: OR_I	or 	%r3, 0x0196, %r30
	.word 0xb609e89d  ! 33: AND_I	and 	%r7, 0x089d, %r27
	.word 0xb010c009  ! 33: OR_R	or 	%r3, %r9, %r24
	.word 0xb211eb04  ! 33: OR_I	or 	%r7, 0x0b04, %r25
	.word 0xae09e35e  ! 33: AND_I	and 	%r7, 0x035e, %r23
	.word 0xa609aff3  ! 33: AND_I	and 	%r6, 0x0ff3, %r19
	.word 0xb001a078  ! 33: ADD_I	add 	%r6, 0x0078, %r24
	.word 0xa408eb28  ! 33: AND_I	and 	%r3, 0x0b28, %r18
	.word 0xb009000c  ! 33: AND_R	and 	%r4, %r12, %r24
	.word 0xaa092b84  ! 33: AND_I	and 	%r4, 0x0b84, %r21
	.word 0xb2116108  ! 33: OR_I	or 	%r5, 0x0108, %r25
	.word 0xb81223cc  ! 33: OR_I	or 	%r8, 0x03cc, %r28
	.word 0xa209ecd0  ! 33: AND_I	and 	%r7, 0x0cd0, %r17
	.word 0xb409c00b  ! 33: AND_R	and 	%r7, %r11, %r26
	.word 0xb408ea80  ! 33: AND_I	and 	%r3, 0x0a80, %r26
	.word 0xae11000d  ! 33: OR_R	or 	%r4, %r13, %r23
	.word 0xb40a25c4  ! 33: AND_I	and 	%r8, 0x05c4, %r26
	.word 0xa209000a  ! 33: AND_R	and 	%r4, %r10, %r17
	.word 0xaa01400d  ! 33: ADD_R	add 	%r5, %r13, %r21
	.word 0xba09c00d  ! 33: AND_R	and 	%r7, %r13, %r29
	.word 0xba020009  ! 33: ADD_R	add 	%r8, %r9, %r29
	.word 0xae00e11e  ! 33: ADD_I	add 	%r3, 0x011e, %r23
	.word 0xbc09a7de  ! 33: AND_I	and 	%r6, 0x07de, %r30
	.word 0xb402000f  ! 33: ADD_R	add 	%r8, %r15, %r26
	.word 0xb601699a  ! 33: ADD_I	add 	%r5, 0x099a, %r27
	.word 0xb40a2155  ! 33: AND_I	and 	%r8, 0x0155, %r26
	.word 0xaa09800f  ! 33: AND_R	and 	%r6, %r15, %r21
	.word 0xb000c009  ! 33: ADD_R	add 	%r3, %r9, %r24
	.word 0xa211e9d4  ! 33: OR_I	or 	%r7, 0x09d4, %r17
	.word 0xb801e627  ! 33: ADD_I	add 	%r7, 0x0627, %r28
	.word 0xba09400f  ! 33: AND_R	and 	%r5, %r15, %r29
	.word 0xbc11e366  ! 33: OR_I	or 	%r7, 0x0366, %r30
	.word 0xac01800c  ! 33: ADD_R	add 	%r6, %r12, %r22
	.word 0xa4022d81  ! 33: ADD_I	add 	%r8, 0x0d81, %r18
	.word 0xae12000b  ! 33: OR_R	or 	%r8, %r11, %r23
	.word 0xb201a159  ! 33: ADD_I	add 	%r6, 0x0159, %r25
	.word 0xa609c00f  ! 33: AND_R	and 	%r7, %r15, %r19
	.word 0xaa0a000f  ! 33: AND_R	and 	%r8, %r15, %r21
	.word 0xae096836  ! 33: AND_I	and 	%r5, 0x0836, %r23
	.word 0xac09c00b  ! 33: AND_R	and 	%r7, %r11, %r22
	.word 0xb011c00e  ! 33: OR_R	or 	%r7, %r14, %r24
	.word 0xbc0a2765  ! 33: AND_I	and 	%r8, 0x0765, %r30
	.word 0xa6096dc0  ! 33: AND_I	and 	%r5, 0x0dc0, %r19
	.word 0xbc122a6f  ! 33: OR_I	or 	%r8, 0x0a6f, %r30
	.word 0xaa11e2de  ! 33: OR_I	or 	%r7, 0x02de, %r21
	.word 0xbc09800f  ! 33: AND_R	and 	%r6, %r15, %r30
	.word 0xa600c00d  ! 33: ADD_R	add 	%r3, %r13, %r19
	.word 0xb809e3e2  ! 33: AND_I	and 	%r7, 0x03e2, %r28
	.word 0xbc11a818  ! 33: OR_I	or 	%r6, 0x0818, %r30
	.word 0xba11a71d  ! 33: OR_I	or 	%r6, 0x071d, %r29
	.word 0xba11a944  ! 33: OR_I	or 	%r6, 0x0944, %r29
	.word 0xa40a2cda  ! 33: AND_I	and 	%r8, 0x0cda, %r18
	.word 0xa201000d  ! 33: ADD_R	add 	%r4, %r13, %r17
	.word 0xb40a2903  ! 33: AND_I	and 	%r8, 0x0903, %r26
	.word 0xac09800a  ! 33: AND_R	and 	%r6, %r10, %r22
	.word 0xa20968be  ! 33: AND_I	and 	%r5, 0x08be, %r17
	.word 0xa6092b1d  ! 33: AND_I	and 	%r4, 0x0b1d, %r19
	.word 0xbe096bdd  ! 33: AND_I	and 	%r5, 0x0bdd, %r31
	.word 0xb80929e8  ! 33: AND_I	and 	%r4, 0x09e8, %r28
	.word 0xaa01c00f  ! 33: ADD_R	add 	%r7, %r15, %r21
	.word 0xaa02000a  ! 33: ADD_R	add 	%r8, %r10, %r21
	.word 0xac09e1e6  ! 33: AND_I	and 	%r7, 0x01e6, %r22
	.word 0xb000c00a  ! 33: ADD_R	add 	%r3, %r10, %r24
	.word 0xaa02000d  ! 33: ADD_R	add 	%r8, %r13, %r21
	.word 0xb80225bc  ! 33: ADD_I	add 	%r8, 0x05bc, %r28
	.word 0xae090009  ! 33: AND_R	and 	%r4, %r9, %r23
	.word 0xa808c00d  ! 33: AND_R	and 	%r3, %r13, %r20
	.word 0xa408c00b  ! 33: AND_R	and 	%r3, %r11, %r18
	.word 0xac00e431  ! 33: ADD_I	add 	%r3, 0x0431, %r22
	.word 0xb212000e  ! 33: OR_R	or 	%r8, %r14, %r25
	.word 0xa400c00c  ! 33: ADD_R	add 	%r3, %r12, %r18
	.word 0xbc01e7df  ! 33: ADD_I	add 	%r7, 0x07df, %r30
	.word 0xbc10c00e  ! 33: OR_R	or 	%r3, %r14, %r30
	.word 0xb8118009  ! 33: OR_R	or 	%r6, %r9, %r28
	.word 0xa401000c  ! 33: ADD_R	add 	%r4, %r12, %r18
	.word 0xa611ae73  ! 33: OR_I	or 	%r6, 0x0e73, %r19
	.word 0xa811c00a  ! 33: OR_R	or 	%r7, %r10, %r20
	.word 0xac122ef9  ! 33: OR_I	or 	%r8, 0x0ef9, %r22
	.word 0xae11000d  ! 33: OR_R	or 	%r4, %r13, %r23
	.word 0xa8116d80  ! 33: OR_I	or 	%r5, 0x0d80, %r20
	.word 0xb410c00c  ! 33: OR_R	or 	%r3, %r12, %r26
	.word 0xbc11efe6  ! 33: OR_I	or 	%r7, 0x0fe6, %r30
	.word 0xbc01a7b7  ! 33: ADD_I	add 	%r6, 0x07b7, %r30
	.word 0xa202000b  ! 33: ADD_R	add 	%r8, %r11, %r17
	.word 0xac01000b  ! 33: ADD_R	add 	%r4, %r11, %r22
	.word 0xbe09692d  ! 33: AND_I	and 	%r5, 0x092d, %r31
	.word 0xb61220e6  ! 33: OR_I	or 	%r8, 0x00e6, %r27
	.word 0xa208e804  ! 33: AND_I	and 	%r3, 0x0804, %r17
	.word 0xac09400c  ! 33: AND_R	and 	%r5, %r12, %r22
	.word 0xba09800f  ! 33: AND_R	and 	%r6, %r15, %r29
	.word 0xbe11ab3a  ! 33: OR_I	or 	%r6, 0x0b3a, %r31
	.word 0xa410ee62  ! 33: OR_I	or 	%r3, 0x0e62, %r18
	.word 0xbe01c009  ! 33: ADD_R	add 	%r7, %r9, %r31
	.word 0xb80a000a  ! 33: AND_R	and 	%r8, %r10, %r28
	.word 0xae11e2bf  ! 33: OR_I	or 	%r7, 0x02bf, %r23
	.word 0xa800c009  ! 33: ADD_R	add 	%r3, %r9, %r20
	.word 0xb809e540  ! 33: AND_I	and 	%r7, 0x0540, %r28
	.word 0xb411800c  ! 33: OR_R	or 	%r6, %r12, %r26
	.word 0xa81126e3  ! 33: OR_I	or 	%r4, 0x06e3, %r20
	.word 0xa201a219  ! 33: ADD_I	add 	%r6, 0x0219, %r17
	.word 0xb808e01b  ! 33: AND_I	and 	%r3, 0x001b, %r28
	.word 0xb40124ef  ! 33: ADD_I	add 	%r4, 0x04ef, %r26
	.word 0xb800c00f  ! 33: ADD_R	add 	%r3, %r15, %r28
	.word 0xa409c00a  ! 33: AND_R	and 	%r7, %r10, %r18
	.word 0xaa08e587  ! 33: AND_I	and 	%r3, 0x0587, %r21
	.word 0xbc11400a  ! 33: OR_R	or 	%r5, %r10, %r30
	.word 0xb8094009  ! 33: AND_R	and 	%r5, %r9, %r28
	.word 0xa4016a9e  ! 33: ADD_I	add 	%r5, 0x0a9e, %r18
	.word 0xbc01000f  ! 33: ADD_R	add 	%r4, %r15, %r30
	.word 0xa8094009  ! 33: AND_R	and 	%r5, %r9, %r20
	.word 0xa211400c  ! 33: OR_R	or 	%r5, %r12, %r17
	.word 0xb209800c  ! 33: AND_R	and 	%r6, %r12, %r25
	.word 0xb201e596  ! 33: ADD_I	add 	%r7, 0x0596, %r25
	.word 0xb801000f  ! 33: ADD_R	add 	%r4, %r15, %r28
	.word 0xb00a000b  ! 33: AND_R	and 	%r8, %r11, %r24
	.word 0xb8016d1d  ! 33: ADD_I	add 	%r5, 0x0d1d, %r28
	.word 0xb211400a  ! 33: OR_R	or 	%r5, %r10, %r25
	.word 0xb201c00c  ! 33: ADD_R	add 	%r7, %r12, %r25
	.word 0xaa11e397  ! 33: OR_I	or 	%r7, 0x0397, %r21
	.word 0xa208c009  ! 33: AND_R	and 	%r3, %r9, %r17
	.word 0xa800c00f  ! 33: ADD_R	add 	%r3, %r15, %r20
	.word 0xbe090009  ! 33: AND_R	and 	%r4, %r9, %r31
	.word 0xa601a9a3  ! 33: ADD_I	add 	%r6, 0x09a3, %r19
	.word 0xb00a000a  ! 33: AND_R	and 	%r8, %r10, %r24
	.word 0xb80a000a  ! 33: AND_R	and 	%r8, %r10, %r28
	.word 0xbc0a27e8  ! 33: AND_I	and 	%r8, 0x07e8, %r30
	.word 0xb011800e  ! 33: OR_R	or 	%r6, %r14, %r24
	.word 0xb60225e2  ! 33: ADD_I	add 	%r8, 0x05e2, %r27
	.word 0xa811c00c  ! 33: OR_R	or 	%r7, %r12, %r20
	.word 0xac08c00e  ! 33: AND_R	and 	%r3, %r14, %r22
	.word 0xbc01c00d  ! 33: ADD_R	add 	%r7, %r13, %r30
	.word 0xbc0966c2  ! 33: AND_I	and 	%r5, 0x06c2, %r30
	.word 0xa802000e  ! 33: ADD_R	add 	%r8, %r14, %r20
	.word 0xbc022a13  ! 33: ADD_I	add 	%r8, 0x0a13, %r30
	.word 0xb811000b  ! 33: OR_R	or 	%r4, %r11, %r28
	.word 0xa609265e  ! 33: AND_I	and 	%r4, 0x065e, %r19
	.word 0xac016d0b  ! 33: ADD_I	add 	%r5, 0x0d0b, %r22
	.word 0xb209e876  ! 33: AND_I	and 	%r7, 0x0876, %r25
	.word 0xb4014009  ! 33: ADD_R	add 	%r5, %r9, %r26
	.word 0xa401c00d  ! 33: ADD_R	add 	%r7, %r13, %r18
	.word 0xb802000f  ! 33: ADD_R	add 	%r8, %r15, %r28
	.word 0xa211a1d0  ! 33: OR_I	or 	%r6, 0x01d0, %r17
	.word 0xa6012d7e  ! 33: ADD_I	add 	%r4, 0x0d7e, %r19
	.word 0xa610c00e  ! 33: OR_R	or 	%r3, %r14, %r19
	.word 0xb609e702  ! 33: AND_I	and 	%r7, 0x0702, %r27
	.word 0xb011ea76  ! 33: OR_I	or 	%r7, 0x0a76, %r24
	.word 0xb212220b  ! 33: OR_I	or 	%r8, 0x020b, %r25
	.word 0xb611c00c  ! 33: OR_R	or 	%r7, %r12, %r27
	.word 0xb809ef53  ! 33: AND_I	and 	%r7, 0x0f53, %r28
	.word 0xa809400d  ! 33: AND_R	and 	%r5, %r13, %r20
	.word 0xa600c00a  ! 33: ADD_R	add 	%r3, %r10, %r19
	.word 0xba09acc6  ! 33: AND_I	and 	%r6, 0x0cc6, %r29
	.word 0xb6016dec  ! 33: ADD_I	add 	%r5, 0x0dec, %r27
	.word 0xba09e462  ! 33: AND_I	and 	%r7, 0x0462, %r29
	.word 0xb200ec60  ! 33: ADD_I	add 	%r3, 0x0c60, %r25
	.word 0xb812000f  ! 33: OR_R	or 	%r8, %r15, %r28
	.word 0xae0225d7  ! 33: ADD_I	add 	%r8, 0x05d7, %r23
	.word 0xbc08ed38  ! 33: AND_I	and 	%r3, 0x0d38, %r30
	.word 0xa6098009  ! 33: AND_R	and 	%r6, %r9, %r19
	.word 0xae11800f  ! 33: OR_R	or 	%r6, %r15, %r23
	.word 0xba01e4ae  ! 33: ADD_I	add 	%r7, 0x04ae, %r29
	.word 0xaa11800f  ! 33: OR_R	or 	%r6, %r15, %r21
	.word 0xaa1163c7  ! 33: OR_I	or 	%r5, 0x03c7, %r21
	.word 0xaa11000c  ! 33: OR_R	or 	%r4, %r12, %r21
	.word 0xba11c00c  ! 33: OR_R	or 	%r7, %r12, %r29
	.word 0xaa00e827  ! 33: ADD_I	add 	%r3, 0x0827, %r21
	.word 0xbe09e47b  ! 33: AND_I	and 	%r7, 0x047b, %r31
	.word 0xa802000d  ! 33: ADD_R	add 	%r8, %r13, %r20
	.word 0xac08e24c  ! 33: AND_I	and 	%r3, 0x024c, %r22
	.word 0xbe1169f7  ! 33: OR_I	or 	%r5, 0x09f7, %r31
	.word 0xbe00e647  ! 33: ADD_I	add 	%r3, 0x0647, %r31
	.word 0xa200e86f  ! 33: ADD_I	add 	%r3, 0x086f, %r17
	.word 0xb402000a  ! 33: ADD_R	add 	%r8, %r10, %r26
	.word 0xb411800d  ! 33: OR_R	or 	%r6, %r13, %r26
	.word 0xb8118009  ! 33: OR_R	or 	%r6, %r9, %r28
	.word 0xfc222c10  ! 33: STW_I	stw	%r30, [%r8 + 0x0c10]
	.word 0xe271a8f0  ! 33: STX_I	stx	%r17, [%r6 + 0x08f0]
	.word 0xe870e5a0  ! 33: STX_I	stx	%r20, [%r3 + 0x05a0]
	.word 0xf628e7c9  ! 33: STB_I	stb	%r27, [%r3 + 0x07c9]
	.word 0xea29ac84  ! 33: STB_I	stb	%r21, [%r6 + 0x0c84]
	.word 0xf629e166  ! 35: STB_I	stb	%r27, [%r7 + 0x0166]
	.word 0xb131a001  ! 36: SRL_I	srl 	%r6, 0x0001, %r24
	.word 0xfa71ab48  ! 37: STX_I	stx	%r29, [%r6 + 0x0b48]
IC_ERR_11:
!$EV error(3,expr(@VA(.MAIN.IC_ERR_11), 16, 16),1,IC_DATA,IR,1,x)
	.word 0xf430e8fc  ! 39: STH_I	sth	%r26, [%r3 + 0x08fc]
	.word 0xf6522708  ! 40: LDSH_I	ldsh	[%r8 + 0x0708], %r27
	.word 0xb809000d  ! 40: AND_R	and 	%r4, %r13, %r28
	.word 0xa601000d  ! 40: ADD_R	add 	%r4, %r13, %r19
	.word 0xa601ed53  ! 40: ADD_I	add 	%r7, 0x0d53, %r19
	bne thr3_loop_2
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_3:
	.word 0xbe09800f  ! 46: AND_R	and 	%r6, %r15, %r31
	.word 0xb800c00d  ! 46: ADD_R	add 	%r3, %r13, %r28
	.word 0xbe092ef6  ! 46: AND_I	and 	%r4, 0x0ef6, %r31
	.word 0xb001a0ad  ! 46: ADD_I	add 	%r6, 0x00ad, %r24
	.word 0xa611e76e  ! 46: OR_I	or 	%r7, 0x076e, %r19
	.word 0xbc09e54a  ! 46: AND_I	and 	%r7, 0x054a, %r30
	.word 0xba11400b  ! 46: OR_R	or 	%r5, %r11, %r29
	.word 0xa20a233b  ! 46: AND_I	and 	%r8, 0x033b, %r17
	.word 0xb001e315  ! 46: ADD_I	add 	%r7, 0x0315, %r24
	.word 0xa201e6b5  ! 46: ADD_I	add 	%r7, 0x06b5, %r17
	.word 0xac11400a  ! 46: OR_R	or 	%r5, %r10, %r22
	.word 0xa608e2c0  ! 46: AND_I	and 	%r3, 0x02c0, %r19
	.word 0xb009000f  ! 46: AND_R	and 	%r4, %r15, %r24
	.word 0xae11000f  ! 46: OR_R	or 	%r4, %r15, %r23
	.word 0xa801800e  ! 46: ADD_R	add 	%r6, %r14, %r20
	.word 0xb400e0c0  ! 46: ADD_I	add 	%r3, 0x00c0, %r26
	.word 0xba0a2498  ! 46: AND_I	and 	%r8, 0x0498, %r29
	.word 0xb6094009  ! 46: AND_R	and 	%r5, %r9, %r27
	.word 0xa609a373  ! 46: AND_I	and 	%r6, 0x0373, %r19
	.word 0xb80a000d  ! 46: AND_R	and 	%r8, %r13, %r28
	.word 0xa212270f  ! 46: OR_I	or 	%r8, 0x070f, %r17
	.word 0xa200c00e  ! 46: ADD_R	add 	%r3, %r14, %r17
	.word 0xb001a74a  ! 46: ADD_I	add 	%r6, 0x074a, %r24
	.word 0xac012c10  ! 46: ADD_I	add 	%r4, 0x0c10, %r22
	.word 0xb011000a  ! 46: OR_R	or 	%r4, %r10, %r24
	.word 0xa610c00c  ! 46: OR_R	or 	%r3, %r12, %r19
	.word 0xb811800d  ! 46: OR_R	or 	%r6, %r13, %r28
	.word 0xb801000e  ! 46: ADD_R	add 	%r4, %r14, %r28
	.word 0xbc08e04f  ! 46: AND_I	and 	%r3, 0x004f, %r30
	.word 0xb402000f  ! 46: ADD_R	add 	%r8, %r15, %r26
	.word 0xa801237b  ! 46: ADD_I	add 	%r4, 0x037b, %r20
	.word 0xbe11ecc7  ! 46: OR_I	or 	%r7, 0x0cc7, %r31
	.word 0xa211800c  ! 46: OR_R	or 	%r6, %r12, %r17
	.word 0xbc01400b  ! 46: ADD_R	add 	%r5, %r11, %r30
	.word 0xb212267a  ! 46: OR_I	or 	%r8, 0x067a, %r25
	.word 0xb012000e  ! 46: OR_R	or 	%r8, %r14, %r24
	.word 0xb20a000b  ! 46: AND_R	and 	%r8, %r11, %r25
	.word 0xaa02000a  ! 46: ADD_R	add 	%r8, %r10, %r21
	.word 0xb8112f86  ! 46: OR_I	or 	%r4, 0x0f86, %r28
	.word 0xb4122b3e  ! 46: OR_I	or 	%r8, 0x0b3e, %r26
	.word 0xa4022e6d  ! 46: ADD_I	add 	%r8, 0x0e6d, %r18
	.word 0xb2012f52  ! 46: ADD_I	add 	%r4, 0x0f52, %r25
	.word 0xa609000b  ! 46: AND_R	and 	%r4, %r11, %r19
	.word 0xaa12000b  ! 46: OR_R	or 	%r8, %r11, %r21
	.word 0xb60a268c  ! 46: AND_I	and 	%r8, 0x068c, %r27
	.word 0xba092afc  ! 46: AND_I	and 	%r4, 0x0afc, %r29
	.word 0xb208c00d  ! 46: AND_R	and 	%r3, %r13, %r25
	.word 0xb211c009  ! 46: OR_R	or 	%r7, %r9, %r25
	.word 0xb809400c  ! 46: AND_R	and 	%r5, %r12, %r28
	.word 0xa211c00c  ! 46: OR_R	or 	%r7, %r12, %r17
	.word 0xb6016d96  ! 46: ADD_I	add 	%r5, 0x0d96, %r27
	.word 0xb801a3be  ! 46: ADD_I	add 	%r6, 0x03be, %r28
	.word 0xb611e425  ! 46: OR_I	or 	%r7, 0x0425, %r27
	.word 0xba00e338  ! 46: ADD_I	add 	%r3, 0x0338, %r29
	.word 0xb80a2ca8  ! 46: AND_I	and 	%r8, 0x0ca8, %r28
	.word 0xa2012291  ! 46: ADD_I	add 	%r4, 0x0291, %r17
	.word 0xaa11400b  ! 46: OR_R	or 	%r5, %r11, %r21
	.word 0xa408e967  ! 46: AND_I	and 	%r3, 0x0967, %r18
	.word 0xa212000c  ! 46: OR_R	or 	%r8, %r12, %r17
	.word 0xa6014009  ! 46: ADD_R	add 	%r5, %r9, %r19
	.word 0xbc12000f  ! 46: OR_R	or 	%r8, %r15, %r30
	.word 0xb811000c  ! 46: OR_R	or 	%r4, %r12, %r28
	.word 0xb800e9a3  ! 46: ADD_I	add 	%r3, 0x09a3, %r28
	.word 0xb012291d  ! 46: OR_I	or 	%r8, 0x091d, %r24
	.word 0xa800ecea  ! 46: ADD_I	add 	%r3, 0x0cea, %r20
	.word 0xb601e50d  ! 46: ADD_I	add 	%r7, 0x050d, %r27
	.word 0xa2112931  ! 46: OR_I	or 	%r4, 0x0931, %r17
	.word 0xb601c00f  ! 46: ADD_R	add 	%r7, %r15, %r27
	.word 0xbc10c00d  ! 46: OR_R	or 	%r3, %r13, %r30
	.word 0xa4114009  ! 46: OR_R	or 	%r5, %r9, %r18
	.word 0xba016607  ! 46: ADD_I	add 	%r5, 0x0607, %r29
	.word 0xb808c009  ! 46: AND_R	and 	%r3, %r9, %r28
	.word 0xa411213e  ! 46: OR_I	or 	%r4, 0x013e, %r18
	.word 0xae02215f  ! 46: ADD_I	add 	%r8, 0x015f, %r23
	.word 0xb6014009  ! 46: ADD_R	add 	%r5, %r9, %r27
	.word 0xba08c00c  ! 46: AND_R	and 	%r3, %r12, %r29
	.word 0xaa11274e  ! 46: OR_I	or 	%r4, 0x074e, %r21
	.word 0xb011800c  ! 46: OR_R	or 	%r6, %r12, %r24
	.word 0xba10e5d3  ! 46: OR_I	or 	%r3, 0x05d3, %r29
	.word 0xa809aced  ! 46: AND_I	and 	%r6, 0x0ced, %r20
	.word 0xaa12000c  ! 46: OR_R	or 	%r8, %r12, %r21
	.word 0xa2022020  ! 46: ADD_I	add 	%r8, 0x0020, %r17
	.word 0xaa112deb  ! 46: OR_I	or 	%r4, 0x0deb, %r21
	.word 0xb00a000d  ! 46: AND_R	and 	%r8, %r13, %r24
	.word 0xa408c00a  ! 46: AND_R	and 	%r3, %r10, %r18
	.word 0xa60a2a5f  ! 46: AND_I	and 	%r8, 0x0a5f, %r19
	.word 0xa809800b  ! 46: AND_R	and 	%r6, %r11, %r20
	.word 0xac11e271  ! 46: OR_I	or 	%r7, 0x0271, %r22
	.word 0xac096ad3  ! 46: AND_I	and 	%r5, 0x0ad3, %r22
	.word 0xa20160d7  ! 46: ADD_I	add 	%r5, 0x00d7, %r17
	.word 0xa20123e8  ! 46: ADD_I	add 	%r4, 0x03e8, %r17
	.word 0xa411800e  ! 46: OR_R	or 	%r6, %r14, %r18
	.word 0xac02000d  ! 46: ADD_R	add 	%r8, %r13, %r22
	.word 0xb40167ce  ! 46: ADD_I	add 	%r5, 0x07ce, %r26
	.word 0xa8022866  ! 46: ADD_I	add 	%r8, 0x0866, %r20
	.word 0xac01c00f  ! 46: ADD_R	add 	%r7, %r15, %r22
	.word 0xba016f81  ! 46: ADD_I	add 	%r5, 0x0f81, %r29
	.word 0xa201800f  ! 46: ADD_R	add 	%r6, %r15, %r17
	.word 0xac0122cb  ! 46: ADD_I	add 	%r4, 0x02cb, %r22
	.word 0xa611000c  ! 46: OR_R	or 	%r4, %r12, %r19
	.word 0xba01c00a  ! 46: ADD_R	add 	%r7, %r10, %r29
	.word 0xb60a000e  ! 46: AND_R	and 	%r8, %r14, %r27
	.word 0xae10c00e  ! 46: OR_R	or 	%r3, %r14, %r23
	.word 0xaa08c00d  ! 46: AND_R	and 	%r3, %r13, %r21
	.word 0xb0094009  ! 46: AND_R	and 	%r5, %r9, %r24
	.word 0xbe01000e  ! 46: ADD_R	add 	%r4, %r14, %r31
	.word 0xae11c00a  ! 46: OR_R	or 	%r7, %r10, %r23
	.word 0xb0112d88  ! 46: OR_I	or 	%r4, 0x0d88, %r24
	.word 0xb801000f  ! 46: ADD_R	add 	%r4, %r15, %r28
	.word 0xb20126a9  ! 46: ADD_I	add 	%r4, 0x06a9, %r25
	.word 0xa601c00e  ! 46: ADD_R	add 	%r7, %r14, %r19
	.word 0xa401800a  ! 46: ADD_R	add 	%r6, %r10, %r18
	.word 0xbe10e599  ! 46: OR_I	or 	%r3, 0x0599, %r31
	.word 0xbe11eecf  ! 46: OR_I	or 	%r7, 0x0ecf, %r31
	.word 0xae114009  ! 46: OR_R	or 	%r5, %r9, %r23
	.word 0xb402279e  ! 46: ADD_I	add 	%r8, 0x079e, %r26
	.word 0xb210c00b  ! 46: OR_R	or 	%r3, %r11, %r25
	.word 0xac11400a  ! 46: OR_R	or 	%r5, %r10, %r22
	.word 0xa209400d  ! 46: AND_R	and 	%r5, %r13, %r17
	.word 0xa610c00d  ! 46: OR_R	or 	%r3, %r13, %r19
	.word 0xb610e283  ! 46: OR_I	or 	%r3, 0x0283, %r27
	.word 0xae09000c  ! 46: AND_R	and 	%r4, %r12, %r23
	.word 0xa60a2b8f  ! 46: AND_I	and 	%r8, 0x0b8f, %r19
	.word 0xb8096359  ! 46: AND_I	and 	%r5, 0x0359, %r28
	.word 0xa601c00e  ! 46: ADD_R	add 	%r7, %r14, %r19
	.word 0xaa00ea70  ! 46: ADD_I	add 	%r3, 0x0a70, %r21
	.word 0xbc112941  ! 46: OR_I	or 	%r4, 0x0941, %r30
	.word 0xb401000a  ! 46: ADD_R	add 	%r4, %r10, %r26
	.word 0xb200c00c  ! 46: ADD_R	add 	%r3, %r12, %r25
	.word 0xac098009  ! 46: AND_R	and 	%r6, %r9, %r22
	.word 0xa412000c  ! 46: OR_R	or 	%r8, %r12, %r18
	.word 0xa601800f  ! 46: ADD_R	add 	%r6, %r15, %r19
	.word 0xb20a2204  ! 46: AND_I	and 	%r8, 0x0204, %r25
	.word 0xa402000b  ! 46: ADD_R	add 	%r8, %r11, %r18
	.word 0xbe10c00f  ! 46: OR_R	or 	%r3, %r15, %r31
	.word 0xb8012355  ! 46: ADD_I	add 	%r4, 0x0355, %r28
	.word 0xac01c00e  ! 46: ADD_R	add 	%r7, %r14, %r22
	.word 0xa4012453  ! 46: ADD_I	add 	%r4, 0x0453, %r18
	.word 0xae01af08  ! 46: ADD_I	add 	%r6, 0x0f08, %r23
	.word 0xa2018009  ! 46: ADD_R	add 	%r6, %r9, %r17
	.word 0xa6022b59  ! 46: ADD_I	add 	%r8, 0x0b59, %r19
	.word 0xbe0a2594  ! 46: AND_I	and 	%r8, 0x0594, %r31
	.word 0xbe01800c  ! 46: ADD_R	add 	%r6, %r12, %r31
	.word 0xa41124dc  ! 46: OR_I	or 	%r4, 0x04dc, %r18
	.word 0xb602000e  ! 46: ADD_R	add 	%r8, %r14, %r27
	.word 0xae09acbc  ! 46: AND_I	and 	%r6, 0x0cbc, %r23
	.word 0xb800c009  ! 46: ADD_R	add 	%r3, %r9, %r28
	.word 0xa8122c81  ! 46: OR_I	or 	%r8, 0x0c81, %r20
	.word 0xb601623e  ! 46: ADD_I	add 	%r5, 0x023e, %r27
	.word 0xb211eba7  ! 46: OR_I	or 	%r7, 0x0ba7, %r25
	.word 0xb801684c  ! 46: ADD_I	add 	%r5, 0x084c, %r28
	.word 0xb202000d  ! 46: ADD_R	add 	%r8, %r13, %r25
	.word 0xba09800e  ! 46: AND_R	and 	%r6, %r14, %r29
	.word 0xb6016213  ! 46: ADD_I	add 	%r5, 0x0213, %r27
	.word 0xaa09e651  ! 46: AND_I	and 	%r7, 0x0651, %r21
	.word 0xbe116ba8  ! 46: OR_I	or 	%r5, 0x0ba8, %r31
	.word 0xae122117  ! 46: OR_I	or 	%r8, 0x0117, %r23
	.word 0xb411279b  ! 46: OR_I	or 	%r4, 0x079b, %r26
	.word 0xbc09800d  ! 46: AND_R	and 	%r6, %r13, %r30
	.word 0xb209400d  ! 46: AND_R	and 	%r5, %r13, %r25
	.word 0xa208e29f  ! 46: AND_I	and 	%r3, 0x029f, %r17
	.word 0xb201000d  ! 46: ADD_R	add 	%r4, %r13, %r25
	.word 0xa812000c  ! 46: OR_R	or 	%r8, %r12, %r20
	.word 0xae09a163  ! 46: AND_I	and 	%r6, 0x0163, %r23
	.word 0xba11e454  ! 46: OR_I	or 	%r7, 0x0454, %r29
	.word 0xa4018009  ! 46: ADD_R	add 	%r6, %r9, %r18
	.word 0xba01a0e2  ! 46: ADD_I	add 	%r6, 0x00e2, %r29
	.word 0xaa1164e8  ! 46: OR_I	or 	%r5, 0x04e8, %r21
	.word 0xbe08c00c  ! 46: AND_R	and 	%r3, %r12, %r31
	.word 0xb401400c  ! 46: ADD_R	add 	%r5, %r12, %r26
	.word 0xb409c00d  ! 46: AND_R	and 	%r7, %r13, %r26
	.word 0xb2118009  ! 46: OR_R	or 	%r6, %r9, %r25
	.word 0xa609400d  ! 46: AND_R	and 	%r5, %r13, %r19
	.word 0xb60a000b  ! 46: AND_R	and 	%r8, %r11, %r27
	.word 0xa2122091  ! 46: OR_I	or 	%r8, 0x0091, %r17
	.word 0xb001400e  ! 46: ADD_R	add 	%r5, %r14, %r24
	.word 0xae01400d  ! 46: ADD_R	add 	%r5, %r13, %r23
	.word 0xa812277c  ! 46: OR_I	or 	%r8, 0x077c, %r20
	.word 0xac092d15  ! 46: AND_I	and 	%r4, 0x0d15, %r22
	.word 0xbe09800c  ! 46: AND_R	and 	%r6, %r12, %r31
	.word 0xa401400b  ! 46: ADD_R	add 	%r5, %r11, %r18
	.word 0xbc09280b  ! 46: AND_I	and 	%r4, 0x080b, %r30
	.word 0xb409400a  ! 46: AND_R	and 	%r5, %r10, %r26
	.word 0xb600e1d0  ! 46: ADD_I	add 	%r3, 0x01d0, %r27
	.word 0xb209a5d9  ! 46: AND_I	and 	%r6, 0x05d9, %r25
	.word 0xa409aa07  ! 46: AND_I	and 	%r6, 0x0a07, %r18
	.word 0xb61123c4  ! 46: OR_I	or 	%r4, 0x03c4, %r27
	.word 0xaa02000b  ! 46: ADD_R	add 	%r8, %r11, %r21
	.word 0xa211000e  ! 46: OR_R	or 	%r4, %r14, %r17
	.word 0xbe00e772  ! 46: ADD_I	add 	%r3, 0x0772, %r31
	.word 0xa6010009  ! 46: ADD_R	add 	%r4, %r9, %r19
	.word 0xb009af6a  ! 46: AND_I	and 	%r6, 0x0f6a, %r24
	.word 0xbe10c009  ! 46: OR_R	or 	%r3, %r9, %r31
	.word 0xb811c00f  ! 46: OR_R	or 	%r7, %r15, %r28
	.word 0xb010eb7a  ! 46: OR_I	or 	%r3, 0x0b7a, %r24
	.word 0xba09a1a0  ! 46: AND_I	and 	%r6, 0x01a0, %r29
	.word 0xa211abfd  ! 46: OR_I	or 	%r6, 0x0bfd, %r17
	.word 0xaa122078  ! 46: OR_I	or 	%r8, 0x0078, %r21
	.word 0xb40a000d  ! 46: AND_R	and 	%r8, %r13, %r26
	.word 0xf22a2d14  ! 46: STB_I	stb	%r25, [%r8 + 0x0d14]
	.word 0xea3122f6  ! 46: STH_I	sth	%r21, [%r4 + 0x02f6]
	.word 0xfa70ea60  ! 46: STX_I	stx	%r29, [%r3 + 0x0a60]
	.word 0xfe31686a  ! 46: STH_I	sth	%r31, [%r5 + 0x086a]
	.word 0xf470edf8  ! 46: STX_I	stx	%r26, [%r3 + 0x0df8]
	.word 0xf42963fe  ! 47: STB_I	stb	%r26, [%r5 + 0x03fe]
	.word 0xae010045
	.word 0xfa21a274  ! 49: STW_I	stw	%r29, [%r6 + 0x0274]
	.word 0xe6322d2a  ! 50: STH_I	sth	%r19, [%r8 + 0x0d2a]
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xbe08ed68  ! 51: AND_I	and 	%r3, 0x0d68, %r31
	.word 0xb8092c34  ! 51: AND_I	and 	%r4, 0x0c34, %r28
	.word 0xa4092ed4  ! 51: AND_I	and 	%r4, 0x0ed4, %r18
	bne thr3_loop_3
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_4:
	.word 0xb408eb10  ! 57: AND_I	and 	%r3, 0x0b10, %r26
	.word 0xac122b8f  ! 57: OR_I	or 	%r8, 0x0b8f, %r22
	.word 0xae0a27d1  ! 57: AND_I	and 	%r8, 0x07d1, %r23
	.word 0xbc09a2ae  ! 57: AND_I	and 	%r6, 0x02ae, %r30
	.word 0xa40a2a1a  ! 57: AND_I	and 	%r8, 0x0a1a, %r18
	.word 0xb001af65  ! 57: ADD_I	add 	%r6, 0x0f65, %r24
	.word 0xb801c00f  ! 57: ADD_R	add 	%r7, %r15, %r28
	.word 0xa402000f  ! 57: ADD_R	add 	%r8, %r15, %r18
	.word 0xbc11000c  ! 57: OR_R	or 	%r4, %r12, %r30
	.word 0xa801400a  ! 57: ADD_R	add 	%r5, %r10, %r20
	.word 0xa81122ce  ! 57: OR_I	or 	%r4, 0x02ce, %r20
	.word 0xb2112b15  ! 57: OR_I	or 	%r4, 0x0b15, %r25
	.word 0xb201000e  ! 57: ADD_R	add 	%r4, %r14, %r25
	.word 0xbe094009  ! 57: AND_R	and 	%r5, %r9, %r31
	.word 0xb0116bb8  ! 57: OR_I	or 	%r5, 0x0bb8, %r24
	.word 0xa809400f  ! 57: AND_R	and 	%r5, %r15, %r20
	.word 0xa208e8d1  ! 57: AND_I	and 	%r3, 0x08d1, %r17
	.word 0xba01e269  ! 57: ADD_I	add 	%r7, 0x0269, %r29
	.word 0xbc10c00d  ! 57: OR_R	or 	%r3, %r13, %r30
	.word 0xa201000e  ! 57: ADD_R	add 	%r4, %r14, %r17
	.word 0xa410c00b  ! 57: OR_R	or 	%r3, %r11, %r18
	.word 0xbc0224a1  ! 57: ADD_I	add 	%r8, 0x04a1, %r30
	.word 0xaa01a200  ! 57: ADD_I	add 	%r6, 0x0200, %r21
	.word 0xa8012d5d  ! 57: ADD_I	add 	%r4, 0x0d5d, %r20
	.word 0xba09c00e  ! 57: AND_R	and 	%r7, %r14, %r29
	.word 0xa211ec9b  ! 57: OR_I	or 	%r7, 0x0c9b, %r17
	.word 0xa210c00f  ! 57: OR_R	or 	%r3, %r15, %r17
	.word 0xa809a019  ! 57: AND_I	and 	%r6, 0x0019, %r20
	.word 0xa209c009  ! 57: AND_R	and 	%r7, %r9, %r17
	.word 0xba00eacb  ! 57: ADD_I	add 	%r3, 0x0acb, %r29
	.word 0xba12000a  ! 57: OR_R	or 	%r8, %r10, %r29
	.word 0xae10e9a6  ! 57: OR_I	or 	%r3, 0x09a6, %r23
	.word 0xac11ef76  ! 57: OR_I	or 	%r7, 0x0f76, %r22
	.word 0xa4090009  ! 57: AND_R	and 	%r4, %r9, %r18
	.word 0xbe12000c  ! 57: OR_R	or 	%r8, %r12, %r31
	.word 0xb409000c  ! 57: AND_R	and 	%r4, %r12, %r26
	.word 0xbc10c00e  ! 57: OR_R	or 	%r3, %r14, %r30
	.word 0xa2092a18  ! 57: AND_I	and 	%r4, 0x0a18, %r17
	.word 0xa60969bd  ! 57: AND_I	and 	%r5, 0x09bd, %r19
	.word 0xb610c00c  ! 57: OR_R	or 	%r3, %r12, %r27
	.word 0xb0022151  ! 57: ADD_I	add 	%r8, 0x0151, %r24
	.word 0xa6122c8e  ! 57: OR_I	or 	%r8, 0x0c8e, %r19
	.word 0xa402000e  ! 57: ADD_R	add 	%r8, %r14, %r18
	.word 0xa802000e  ! 57: ADD_R	add 	%r8, %r14, %r20
	.word 0xbe09400a  ! 57: AND_R	and 	%r5, %r10, %r31
	.word 0xb001c00a  ! 57: ADD_R	add 	%r7, %r10, %r24
	.word 0xb00a000f  ! 57: AND_R	and 	%r8, %r15, %r24
	.word 0xaa11800a  ! 57: OR_R	or 	%r6, %r10, %r21
	.word 0xb2116252  ! 57: OR_I	or 	%r5, 0x0252, %r25
	.word 0xa801a257  ! 57: ADD_I	add 	%r6, 0x0257, %r20
	.word 0xac09695a  ! 57: AND_I	and 	%r5, 0x095a, %r22
	.word 0xbe0a264d  ! 57: AND_I	and 	%r8, 0x064d, %r31
	.word 0xbc0a2ae1  ! 57: AND_I	and 	%r8, 0x0ae1, %r30
	.word 0xa2012a2f  ! 57: ADD_I	add 	%r4, 0x0a2f, %r17
	.word 0xb801aa73  ! 57: ADD_I	add 	%r6, 0x0a73, %r28
	.word 0xb812000e  ! 57: OR_R	or 	%r8, %r14, %r28
	.word 0xaa08c00e  ! 57: AND_R	and 	%r3, %r14, %r21
	.word 0xa20165f2  ! 57: ADD_I	add 	%r5, 0x05f2, %r17
	.word 0xbe01293f  ! 57: ADD_I	add 	%r4, 0x093f, %r31
	.word 0xa201400f  ! 57: ADD_R	add 	%r5, %r15, %r17
	.word 0xbc01400a  ! 57: ADD_R	add 	%r5, %r10, %r30
	.word 0xa809800a  ! 57: AND_R	and 	%r6, %r10, %r20
	.word 0xa209c00f  ! 57: AND_R	and 	%r7, %r15, %r17
	.word 0xa609400a  ! 57: AND_R	and 	%r5, %r10, %r19
	.word 0xa4098009  ! 57: AND_R	and 	%r6, %r9, %r18
	.word 0xb608e9e2  ! 57: AND_I	and 	%r3, 0x09e2, %r27
	.word 0xb4112c13  ! 57: OR_I	or 	%r4, 0x0c13, %r26
	.word 0xae1228c2  ! 57: OR_I	or 	%r8, 0x08c2, %r23
	.word 0xa209000a  ! 57: AND_R	and 	%r4, %r10, %r17
	.word 0xa4012703  ! 57: ADD_I	add 	%r4, 0x0703, %r18
	.word 0xac00c009  ! 57: ADD_R	add 	%r3, %r9, %r22
	.word 0xa802297a  ! 57: ADD_I	add 	%r8, 0x097a, %r20
	.word 0xba11219c  ! 57: OR_I	or 	%r4, 0x019c, %r29
	.word 0xbc11e1f1  ! 57: OR_I	or 	%r7, 0x01f1, %r30
	.word 0xa600e495  ! 57: ADD_I	add 	%r3, 0x0495, %r19
	.word 0xba0a000b  ! 57: AND_R	and 	%r8, %r11, %r29
	.word 0xbe1223d8  ! 57: OR_I	or 	%r8, 0x03d8, %r31
	.word 0xae01225f  ! 57: ADD_I	add 	%r4, 0x025f, %r23
	.word 0xbc01000d  ! 57: ADD_R	add 	%r4, %r13, %r30
	.word 0xa809400d  ! 57: AND_R	and 	%r5, %r13, %r20
	.word 0xbc11000f  ! 57: OR_R	or 	%r4, %r15, %r30
	.word 0xba09a576  ! 57: AND_I	and 	%r6, 0x0576, %r29
	.word 0xb402000f  ! 57: ADD_R	add 	%r8, %r15, %r26
	.word 0xae01c00f  ! 57: ADD_R	add 	%r7, %r15, %r23
	.word 0xa611c00c  ! 57: OR_R	or 	%r7, %r12, %r19
	.word 0xb60a000e  ! 57: AND_R	and 	%r8, %r14, %r27
	.word 0xa400e4c1  ! 57: ADD_I	add 	%r3, 0x04c1, %r18
	.word 0xbe022203  ! 57: ADD_I	add 	%r8, 0x0203, %r31
	.word 0xa801400a  ! 57: ADD_R	add 	%r5, %r10, %r20
	.word 0xa211000d  ! 57: OR_R	or 	%r4, %r13, %r17
	.word 0xac10ec2e  ! 57: OR_I	or 	%r3, 0x0c2e, %r22
	.word 0xaa110009  ! 57: OR_R	or 	%r4, %r9, %r21
	.word 0xbc1168e2  ! 57: OR_I	or 	%r5, 0x08e2, %r30
	.word 0xac090009  ! 57: AND_R	and 	%r4, %r9, %r22
	.word 0xb411800a  ! 57: OR_R	or 	%r6, %r10, %r26
	.word 0xb601000c  ! 57: ADD_R	add 	%r4, %r12, %r27
	.word 0xa601e322  ! 57: ADD_I	add 	%r7, 0x0322, %r19
	.word 0xae08c00f  ! 57: AND_R	and 	%r3, %r15, %r23
	.word 0xb2122bb2  ! 57: OR_I	or 	%r8, 0x0bb2, %r25
	.word 0xb209400b  ! 57: AND_R	and 	%r5, %r11, %r25
	.word 0xb212000c  ! 57: OR_R	or 	%r8, %r12, %r25
	.word 0xac09800c  ! 57: AND_R	and 	%r6, %r12, %r22
	.word 0xbe0127bf  ! 57: ADD_I	add 	%r4, 0x07bf, %r31
	.word 0xa6016352  ! 57: ADD_I	add 	%r5, 0x0352, %r19
	.word 0xb8096993  ! 57: AND_I	and 	%r5, 0x0993, %r28
	.word 0xb802000d  ! 57: ADD_R	add 	%r8, %r13, %r28
	.word 0xb209c00d  ! 57: AND_R	and 	%r7, %r13, %r25
	.word 0xa409000b  ! 57: AND_R	and 	%r4, %r11, %r18
	.word 0xba11a745  ! 57: OR_I	or 	%r6, 0x0745, %r29
	.word 0xb40a263e  ! 57: AND_I	and 	%r8, 0x063e, %r26
	.word 0xbc11000f  ! 57: OR_R	or 	%r4, %r15, %r30
	.word 0xac11400f  ! 57: OR_R	or 	%r5, %r15, %r22
	.word 0xa409e102  ! 57: AND_I	and 	%r7, 0x0102, %r18
	.word 0xa609c00c  ! 57: AND_R	and 	%r7, %r12, %r19
	.word 0xac00ebbb  ! 57: ADD_I	add 	%r3, 0x0bbb, %r22
	.word 0xbc09400a  ! 57: AND_R	and 	%r5, %r10, %r30
	.word 0xbc08e219  ! 57: AND_I	and 	%r3, 0x0219, %r30
	.word 0xa610e459  ! 57: OR_I	or 	%r3, 0x0459, %r19
	.word 0xb611400f  ! 57: OR_R	or 	%r5, %r15, %r27
	.word 0xb801c00f  ! 57: ADD_R	add 	%r7, %r15, %r28
	.word 0xba01800d  ! 57: ADD_R	add 	%r6, %r13, %r29
	.word 0xb600ef13  ! 57: ADD_I	add 	%r3, 0x0f13, %r27
	.word 0xbc09a6f0  ! 57: AND_I	and 	%r6, 0x06f0, %r30
	.word 0xa201a95b  ! 57: ADD_I	add 	%r6, 0x095b, %r17
	.word 0xa20a2e79  ! 57: AND_I	and 	%r8, 0x0e79, %r17
	.word 0xbc11400e  ! 57: OR_R	or 	%r5, %r14, %r30
	.word 0xb011c00d  ! 57: OR_R	or 	%r7, %r13, %r24
	.word 0xba09e52d  ! 57: AND_I	and 	%r7, 0x052d, %r29
	.word 0xb8098009  ! 57: AND_R	and 	%r6, %r9, %r28
	.word 0xbc00c00b  ! 57: ADD_R	add 	%r3, %r11, %r30
	.word 0xb801ad4f  ! 57: ADD_I	add 	%r6, 0x0d4f, %r28
	.word 0xb802000b  ! 57: ADD_R	add 	%r8, %r11, %r28
	.word 0xb810eda6  ! 57: OR_I	or 	%r3, 0x0da6, %r28
	.word 0xb811800e  ! 57: OR_R	or 	%r6, %r14, %r28
	.word 0xb812000a  ! 57: OR_R	or 	%r8, %r10, %r28
	.word 0xbe112e83  ! 57: OR_I	or 	%r4, 0x0e83, %r31
	.word 0xaa122d6e  ! 57: OR_I	or 	%r8, 0x0d6e, %r21
	.word 0xae11ed13  ! 57: OR_I	or 	%r7, 0x0d13, %r23
	.word 0xba08e0d7  ! 57: AND_I	and 	%r3, 0x00d7, %r29
	.word 0xa201800f  ! 57: ADD_R	add 	%r6, %r15, %r17
	.word 0xac096f5b  ! 57: AND_I	and 	%r5, 0x0f5b, %r22
	.word 0xae092916  ! 57: AND_I	and 	%r4, 0x0916, %r23
	.word 0xb808c00e  ! 57: AND_R	and 	%r3, %r14, %r28
	.word 0xf02960d0  ! 57: STB_I	stb	%r24, [%r5 + 0x00d0]
	.word 0xfe316d78  ! 57: STH_I	sth	%r31, [%r5 + 0x0d78]
	.word 0xe230ef2e  ! 57: STH_I	sth	%r17, [%r3 + 0x0f2e]
	.word 0xf229a9cf  ! 57: STB_I	stb	%r25, [%r6 + 0x09cf]
	.word 0xe421ad4c  ! 57: STW_I	stw	%r18, [%r6 + 0x0d4c]
	.word 0xf87228c0  ! 59: STX_I	stx	%r28, [%r8 + 0x08c0]
	.word 0xae010045
	.word 0xfa222fd0  ! 61: STW_I	stw	%r29, [%r8 + 0x0fd0]
IC_ERR_15:
!$EV error(3,expr(@VA(.MAIN.IC_ERR_15), 16, 16),2,IC_DATA,IR,8,x)
	.word 0xc0f008e2  ! 64: STXA_R	stxa	%r0, [%r0 + %r2] 0x47
	.word 0xe201400c  ! 65: LDUW_R	lduw	[%r5 + %r12], %r17
	.word 0xa409af8b  ! 65: AND_I	and 	%r6, 0x0f8b, %r18
	.word 0xb0120009  ! 65: OR_R	or 	%r8, %r9, %r24
	.word 0xa809c00a  ! 65: AND_R	and 	%r7, %r10, %r20
	bne thr3_loop_4
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_5:
	.word 0xb6014009  ! 73: ADD_R	add 	%r5, %r9, %r27
	.word 0xac01000d  ! 73: ADD_R	add 	%r4, %r13, %r22
	.word 0xb2090009  ! 73: AND_R	and 	%r4, %r9, %r25
	.word 0xac02000a  ! 73: ADD_R	add 	%r8, %r10, %r22
	.word 0xb009ee15  ! 73: AND_I	and 	%r7, 0x0e15, %r24
	.word 0xb8096e50  ! 73: AND_I	and 	%r5, 0x0e50, %r28
	.word 0xa401ee91  ! 73: ADD_I	add 	%r7, 0x0e91, %r18
	.word 0xb201a62d  ! 73: ADD_I	add 	%r6, 0x062d, %r25
	.word 0xac12264d  ! 73: OR_I	or 	%r8, 0x064d, %r22
	.word 0xac11c009  ! 73: OR_R	or 	%r7, %r9, %r22
	.word 0xae10c00d  ! 73: OR_R	or 	%r3, %r13, %r23
	.word 0xbc12206a  ! 73: OR_I	or 	%r8, 0x006a, %r30
	.word 0xba00c00d  ! 73: ADD_R	add 	%r3, %r13, %r29
	.word 0xac12000e  ! 73: OR_R	or 	%r8, %r14, %r22
	.word 0xbc114009  ! 73: OR_R	or 	%r5, %r9, %r30
	.word 0xb209ecab  ! 73: AND_I	and 	%r7, 0x0cab, %r25
	.word 0xbe01c00d  ! 73: ADD_R	add 	%r7, %r13, %r31
	.word 0xa209000b  ! 73: AND_R	and 	%r4, %r11, %r17
	.word 0xa409000f  ! 73: AND_R	and 	%r4, %r15, %r18
	.word 0xa611000c  ! 73: OR_R	or 	%r4, %r12, %r19
	.word 0xba09000a  ! 73: AND_R	and 	%r4, %r10, %r29
	.word 0xaa092a51  ! 73: AND_I	and 	%r4, 0x0a51, %r21
	.word 0xaa11800f  ! 73: OR_R	or 	%r6, %r15, %r21
	.word 0xb000e3db  ! 73: ADD_I	add 	%r3, 0x03db, %r24
	.word 0xba1160de  ! 73: OR_I	or 	%r5, 0x00de, %r29
	.word 0xb60a2d40  ! 73: AND_I	and 	%r8, 0x0d40, %r27
	.word 0xa401800b  ! 73: ADD_R	add 	%r6, %r11, %r18
	.word 0xac0a2381  ! 73: AND_I	and 	%r8, 0x0381, %r22
	.word 0xa409c00e  ! 73: AND_R	and 	%r7, %r14, %r18
	.word 0xa809ac96  ! 73: AND_I	and 	%r6, 0x0c96, %r20
	.word 0xa4120009  ! 73: OR_R	or 	%r8, %r9, %r18
	.word 0xbe11ed57  ! 73: OR_I	or 	%r7, 0x0d57, %r31
	.word 0xa201acc8  ! 73: ADD_I	add 	%r6, 0x0cc8, %r17
	.word 0xbc08c00b  ! 73: AND_R	and 	%r3, %r11, %r30
	.word 0xb0012548  ! 73: ADD_I	add 	%r4, 0x0548, %r24
	.word 0xbc01800c  ! 73: ADD_R	add 	%r6, %r12, %r30
	.word 0xb209a5a7  ! 73: AND_I	and 	%r6, 0x05a7, %r25
	.word 0xa810e28d  ! 73: OR_I	or 	%r3, 0x028d, %r20
	.word 0xa408eddd  ! 73: AND_I	and 	%r3, 0x0ddd, %r18
	.word 0xb201000e  ! 73: ADD_R	add 	%r4, %r14, %r25
	.word 0xb202000c  ! 73: ADD_R	add 	%r8, %r12, %r25
	.word 0xa21129ff  ! 73: OR_I	or 	%r4, 0x09ff, %r17
	.word 0xa8122bb1  ! 73: OR_I	or 	%r8, 0x0bb1, %r20
	.word 0xae10c00f  ! 73: OR_R	or 	%r3, %r15, %r23
	.word 0xba00e32d  ! 73: ADD_I	add 	%r3, 0x032d, %r29
	.word 0xa610e05c  ! 73: OR_I	or 	%r3, 0x005c, %r19
	.word 0xa210e2ba  ! 73: OR_I	or 	%r3, 0x02ba, %r17
	.word 0xa611800a  ! 73: OR_R	or 	%r6, %r10, %r19
	.word 0xb80962dc  ! 73: AND_I	and 	%r5, 0x02dc, %r28
	.word 0xbc01800b  ! 73: ADD_R	add 	%r6, %r11, %r30
	.word 0xa6110009  ! 73: OR_R	or 	%r4, %r9, %r19
	.word 0xbe098009  ! 73: AND_R	and 	%r6, %r9, %r31
	.word 0xb008c009  ! 73: AND_R	and 	%r3, %r9, %r24
	.word 0xae12000a  ! 73: OR_R	or 	%r8, %r10, %r23
	.word 0xa4022332  ! 73: ADD_I	add 	%r8, 0x0332, %r18
	.word 0xb6012136  ! 73: ADD_I	add 	%r4, 0x0136, %r27
	.word 0xba01400d  ! 73: ADD_R	add 	%r5, %r13, %r29
	.word 0xaa09c00c  ! 73: AND_R	and 	%r7, %r12, %r21
	.word 0xb209400b  ! 73: AND_R	and 	%r5, %r11, %r25
	.word 0xa411800e  ! 73: OR_R	or 	%r6, %r14, %r18
	.word 0xbe10c00d  ! 73: OR_R	or 	%r3, %r13, %r31
	.word 0xae01256a  ! 73: ADD_I	add 	%r4, 0x056a, %r23
	.word 0xa20226a6  ! 73: ADD_I	add 	%r8, 0x06a6, %r17
	.word 0xb410c00c  ! 73: OR_R	or 	%r3, %r12, %r26
	.word 0xb8016f82  ! 73: ADD_I	add 	%r5, 0x0f82, %r28
	.word 0xb60a000d  ! 73: AND_R	and 	%r8, %r13, %r27
	.word 0xa401a3e0  ! 73: ADD_I	add 	%r6, 0x03e0, %r18
	.word 0xbe016fb8  ! 73: ADD_I	add 	%r5, 0x0fb8, %r31
	.word 0xac11a415  ! 73: OR_I	or 	%r6, 0x0415, %r22
	.word 0xa609c00e  ! 73: AND_R	and 	%r7, %r14, %r19
	.word 0xa4016058  ! 73: ADD_I	add 	%r5, 0x0058, %r18
	.word 0xb00a000c  ! 73: AND_R	and 	%r8, %r12, %r24
	.word 0xb8112e23  ! 73: OR_I	or 	%r4, 0x0e23, %r28
	.word 0xbc016a48  ! 73: ADD_I	add 	%r5, 0x0a48, %r30
	.word 0xb411400b  ! 73: OR_R	or 	%r5, %r11, %r26
	.word 0xb0112a9e  ! 73: OR_I	or 	%r4, 0x0a9e, %r24
	.word 0xa811800f  ! 73: OR_R	or 	%r6, %r15, %r20
	.word 0xbe09000c  ! 73: AND_R	and 	%r4, %r12, %r31
	.word 0xa2096c74  ! 73: AND_I	and 	%r5, 0x0c74, %r17
	.word 0xba00e041  ! 73: ADD_I	add 	%r3, 0x0041, %r29
	.word 0xa808ec32  ! 73: AND_I	and 	%r3, 0x0c32, %r20
	.word 0xb209a957  ! 73: AND_I	and 	%r6, 0x0957, %r25
	.word 0xb611efa7  ! 73: OR_I	or 	%r7, 0x0fa7, %r27
	.word 0xbc00ef93  ! 73: ADD_I	add 	%r3, 0x0f93, %r30
	.word 0xb408c00d  ! 73: AND_R	and 	%r3, %r13, %r26
	.word 0xba10c00e  ! 73: OR_R	or 	%r3, %r14, %r29
	.word 0xb408c00d  ! 73: AND_R	and 	%r3, %r13, %r26
	.word 0xbe09400f  ! 73: AND_R	and 	%r5, %r15, %r31
	.word 0xb201255a  ! 73: ADD_I	add 	%r4, 0x055a, %r25
	.word 0xb411000f  ! 73: OR_R	or 	%r4, %r15, %r26
	.word 0xb201000c  ! 73: ADD_R	add 	%r4, %r12, %r25
	.word 0xa2096173  ! 73: AND_I	and 	%r5, 0x0173, %r17
	.word 0xb601c00a  ! 73: ADD_R	add 	%r7, %r10, %r27
	.word 0xa208c00a  ! 73: AND_R	and 	%r3, %r10, %r17
	.word 0xa400ef11  ! 73: ADD_I	add 	%r3, 0x0f11, %r18
	.word 0xa802000d  ! 73: ADD_R	add 	%r8, %r13, %r20
	.word 0xb0016d20  ! 73: ADD_I	add 	%r5, 0x0d20, %r24
	.word 0xb40963ad  ! 73: AND_I	and 	%r5, 0x03ad, %r26
	.word 0xbe08c00a  ! 73: AND_R	and 	%r3, %r10, %r31
	.word 0xa410e6ad  ! 73: OR_I	or 	%r3, 0x06ad, %r18
	.word 0xa202000e  ! 73: ADD_R	add 	%r8, %r14, %r17
	.word 0xbe09eb30  ! 73: AND_I	and 	%r7, 0x0b30, %r31
	.word 0xa401000d  ! 73: ADD_R	add 	%r4, %r13, %r18
	.word 0xba09800d  ! 73: AND_R	and 	%r6, %r13, %r29
	.word 0xb212000a  ! 73: OR_R	or 	%r8, %r10, %r25
	.word 0xb2112588  ! 73: OR_I	or 	%r4, 0x0588, %r25
	.word 0xbc014009  ! 73: ADD_R	add 	%r5, %r9, %r30
	.word 0xac00c00e  ! 73: ADD_R	add 	%r3, %r14, %r22
	.word 0xb209c00f  ! 73: AND_R	and 	%r7, %r15, %r25
	.word 0xb409c009  ! 73: AND_R	and 	%r7, %r9, %r26
	.word 0xb808c009  ! 73: AND_R	and 	%r3, %r9, %r28
	.word 0xa601c00e  ! 73: ADD_R	add 	%r7, %r14, %r19
	.word 0xaa11a4a6  ! 73: OR_I	or 	%r6, 0x04a6, %r21
	.word 0xb401400d  ! 73: ADD_R	add 	%r5, %r13, %r26
	.word 0xb6122cb8  ! 73: OR_I	or 	%r8, 0x0cb8, %r27
	.word 0xb411c00f  ! 73: OR_R	or 	%r7, %r15, %r26
	.word 0xa600e7d3  ! 73: ADD_I	add 	%r3, 0x07d3, %r19
	.word 0xb002000f  ! 73: ADD_R	add 	%r8, %r15, %r24
	.word 0xb209400f  ! 73: AND_R	and 	%r5, %r15, %r25
	.word 0xec30e632  ! 73: STH_I	sth	%r22, [%r3 + 0x0632]
	.word 0xe271a968  ! 73: STX_I	stx	%r17, [%r6 + 0x0968]
	.word 0xf4712028  ! 73: STX_I	stx	%r26, [%r4 + 0x0028]
	.word 0xf829ad36  ! 73: STB_I	stb	%r28, [%r6 + 0x0d36]
	.word 0xf07168c0  ! 73: STX_I	stx	%r24, [%r5 + 0x08c0]
	.word 0xea2a2e35  ! 73: STB_I	stb	%r21, [%r8 + 0x0e35]
	.word 0xec29261d  ! 73: STB_I	stb	%r22, [%r4 + 0x061d]
	.word 0xf44a000b  ! 74: LDSB_R	ldsb	[%r8 + %r11], %r26
	.word 0xf221a608  ! 75: STW_I	stw	%r25, [%r6 + 0x0608]
	.word 0xe649800b  ! 76: LDSB_R	ldsb	[%r6 + %r11], %r19
	.word 0xac01a7ba  ! 76: ADD_I	add 	%r6, 0x07ba, %r22
	.word 0xb401000f  ! 76: ADD_R	add 	%r4, %r15, %r26
	.word 0xbc08c00d  ! 76: AND_R	and 	%r3, %r13, %r30
	bne thr3_loop_5
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_6:
	.word 0xb201224d  ! 82: ADD_I	add 	%r4, 0x024d, %r25
	.word 0xb400e50d  ! 82: ADD_I	add 	%r3, 0x050d, %r26
	.word 0xb608eba7  ! 82: AND_I	and 	%r3, 0x0ba7, %r27
	.word 0xba09000c  ! 82: AND_R	and 	%r4, %r12, %r29
	.word 0xac116571  ! 82: OR_I	or 	%r5, 0x0571, %r22
	.word 0xb609400b  ! 82: AND_R	and 	%r5, %r11, %r27
	.word 0xa601800c  ! 82: ADD_R	add 	%r6, %r12, %r19
	.word 0xa600c00e  ! 82: ADD_R	add 	%r3, %r14, %r19
	.word 0xb60a000e  ! 82: AND_R	and 	%r8, %r14, %r27
	.word 0xb601000d  ! 82: ADD_R	add 	%r4, %r13, %r27
	.word 0xa209c00c  ! 82: AND_R	and 	%r7, %r12, %r17
	.word 0xac08c00c  ! 82: AND_R	and 	%r3, %r12, %r22
	.word 0xb400e2f3  ! 82: ADD_I	add 	%r3, 0x02f3, %r26
	.word 0xaa11ed13  ! 82: OR_I	or 	%r7, 0x0d13, %r21
	.word 0xa411ad75  ! 82: OR_I	or 	%r6, 0x0d75, %r18
	.word 0xbe0120fc  ! 82: ADD_I	add 	%r4, 0x00fc, %r31
	.word 0xb801400e  ! 82: ADD_R	add 	%r5, %r14, %r28
	.word 0xaa11000b  ! 82: OR_R	or 	%r4, %r11, %r21
	.word 0xae014009  ! 82: ADD_R	add 	%r5, %r9, %r23
	.word 0xb001000f  ! 82: ADD_R	add 	%r4, %r15, %r24
	.word 0xbc0a2f78  ! 82: AND_I	and 	%r8, 0x0f78, %r30
	.word 0xb8116feb  ! 82: OR_I	or 	%r5, 0x0feb, %r28
	.word 0xb21228a9  ! 82: OR_I	or 	%r8, 0x08a9, %r25
	.word 0xb000ed33  ! 82: ADD_I	add 	%r3, 0x0d33, %r24
	.word 0xa201800c  ! 82: ADD_R	add 	%r6, %r12, %r17
	.word 0xba02000a  ! 82: ADD_R	add 	%r8, %r10, %r29
	.word 0xb2090009  ! 82: AND_R	and 	%r4, %r9, %r25
	.word 0xba016812  ! 82: ADD_I	add 	%r5, 0x0812, %r29
	.word 0xb401000d  ! 82: ADD_R	add 	%r4, %r13, %r26
	.word 0xb6122694  ! 82: OR_I	or 	%r8, 0x0694, %r27
	.word 0xb811ac4d  ! 82: OR_I	or 	%r6, 0x0c4d, %r28
	.word 0xa610c00c  ! 82: OR_R	or 	%r3, %r12, %r19
	.word 0xa409a9c3  ! 82: AND_I	and 	%r6, 0x09c3, %r18
	.word 0xac08ed38  ! 82: AND_I	and 	%r3, 0x0d38, %r22
	.word 0xa4112aeb  ! 82: OR_I	or 	%r4, 0x0aeb, %r18
	.word 0xa809effa  ! 82: AND_I	and 	%r7, 0x0ffa, %r20
	.word 0xbe09685e  ! 82: AND_I	and 	%r5, 0x085e, %r31
	.word 0xba09400e  ! 82: AND_R	and 	%r5, %r14, %r29
	.word 0xb609ac65  ! 82: AND_I	and 	%r6, 0x0c65, %r27
	.word 0xac11a2a9  ! 82: OR_I	or 	%r6, 0x02a9, %r22
	.word 0xa4122bf0  ! 82: OR_I	or 	%r8, 0x0bf0, %r18
	.word 0xb201c00a  ! 82: ADD_R	add 	%r7, %r10, %r25
	.word 0xb609400e  ! 82: AND_R	and 	%r5, %r14, %r27
	.word 0xa611800a  ! 82: OR_R	or 	%r6, %r10, %r19
	.word 0xa6112bb9  ! 82: OR_I	or 	%r4, 0x0bb9, %r19
	.word 0xae098009  ! 82: AND_R	and 	%r6, %r9, %r23
	.word 0xb201000d  ! 82: ADD_R	add 	%r4, %r13, %r25
	.word 0xaa11800d  ! 82: OR_R	or 	%r6, %r13, %r21
	.word 0xae11000d  ! 82: OR_R	or 	%r4, %r13, %r23
	.word 0xa409800d  ! 82: AND_R	and 	%r6, %r13, %r18
	.word 0xbc09000d  ! 82: AND_R	and 	%r4, %r13, %r30
	.word 0xaa0a000b  ! 82: AND_R	and 	%r8, %r11, %r21
	.word 0xba022dc3  ! 82: ADD_I	add 	%r8, 0x0dc3, %r29
	.word 0xa201265b  ! 82: ADD_I	add 	%r4, 0x065b, %r17
	.word 0xa801400c  ! 82: ADD_R	add 	%r5, %r12, %r20
	.word 0xba1120e3  ! 82: OR_I	or 	%r4, 0x00e3, %r29
	.word 0xa208e5be  ! 82: AND_I	and 	%r3, 0x05be, %r17
	.word 0xb609000a  ! 82: AND_R	and 	%r4, %r10, %r27
	.word 0xb601800e  ! 82: ADD_R	add 	%r6, %r14, %r27
	.word 0xac09e20d  ! 82: AND_I	and 	%r7, 0x020d, %r22
	.word 0xa400c00f  ! 82: ADD_R	add 	%r3, %r15, %r18
	.word 0xa6122b1c  ! 82: OR_I	or 	%r8, 0x0b1c, %r19
	.word 0xa210edd0  ! 82: OR_I	or 	%r3, 0x0dd0, %r17
	.word 0xb011c00c  ! 82: OR_R	or 	%r7, %r12, %r24
	.word 0xb81162c2  ! 82: OR_I	or 	%r5, 0x02c2, %r28
	.word 0xbc00c00b  ! 82: ADD_R	add 	%r3, %r11, %r30
	.word 0xa6092f42  ! 82: AND_I	and 	%r4, 0x0f42, %r19
	.word 0xba016db0  ! 82: ADD_I	add 	%r5, 0x0db0, %r29
	.word 0xae10c00d  ! 82: OR_R	or 	%r3, %r13, %r23
	.word 0xb800c00f  ! 82: ADD_R	add 	%r3, %r15, %r28
	.word 0xa601400e  ! 82: ADD_R	add 	%r5, %r14, %r19
	.word 0xac09000f  ! 82: AND_R	and 	%r4, %r15, %r22
	.word 0xbe022dcb  ! 82: ADD_I	add 	%r8, 0x0dcb, %r31
	.word 0xbc12000b  ! 82: OR_R	or 	%r8, %r11, %r30
	.word 0xae0124a0  ! 82: ADD_I	add 	%r4, 0x04a0, %r23
	.word 0xb8112955  ! 82: OR_I	or 	%r4, 0x0955, %r28
	.word 0xb609c00e  ! 82: AND_R	and 	%r7, %r14, %r27
	.word 0xaa09800a  ! 82: AND_R	and 	%r6, %r10, %r21
	.word 0xb011222f  ! 82: OR_I	or 	%r4, 0x022f, %r24
	.word 0xb611000a  ! 82: OR_R	or 	%r4, %r10, %r27
	.word 0xa608e6b3  ! 82: AND_I	and 	%r3, 0x06b3, %r19
	.word 0xb200c00f  ! 82: ADD_R	add 	%r3, %r15, %r25
	.word 0xb8016aa0  ! 82: ADD_I	add 	%r5, 0x0aa0, %r28
	.word 0xb811e4db  ! 82: OR_I	or 	%r7, 0x04db, %r28
	.word 0xbc09800c  ! 82: AND_R	and 	%r6, %r12, %r30
	.word 0xae00c00c  ! 82: ADD_R	add 	%r3, %r12, %r23
	.word 0xb411a235  ! 82: OR_I	or 	%r6, 0x0235, %r26
	.word 0xb401000d  ! 82: ADD_R	add 	%r4, %r13, %r26
	.word 0xa211c00e  ! 82: OR_R	or 	%r7, %r14, %r17
	.word 0xbe092b3b  ! 82: AND_I	and 	%r4, 0x0b3b, %r31
	.word 0xb010e988  ! 82: OR_I	or 	%r3, 0x0988, %r24
	.word 0xbe01a5d3  ! 82: ADD_I	add 	%r6, 0x05d3, %r31
	.word 0xa410e2a0  ! 82: OR_I	or 	%r3, 0x02a0, %r18
	.word 0xa801000d  ! 82: ADD_R	add 	%r4, %r13, %r20
	.word 0xac12000a  ! 82: OR_R	or 	%r8, %r10, %r22
	.word 0xb409000a  ! 82: AND_R	and 	%r4, %r10, %r26
	.word 0xbe11400f  ! 82: OR_R	or 	%r5, %r15, %r31
	.word 0xb210ed8a  ! 82: OR_I	or 	%r3, 0x0d8a, %r25
	.word 0xac10c00a  ! 82: OR_R	or 	%r3, %r10, %r22
	.word 0xb400e43f  ! 82: ADD_I	add 	%r3, 0x043f, %r26
	.word 0xa409c00f  ! 82: AND_R	and 	%r7, %r15, %r18
	.word 0xb209800c  ! 82: AND_R	and 	%r6, %r12, %r25
	.word 0xba02000f  ! 82: ADD_R	add 	%r8, %r15, %r29
	.word 0xbe11400e  ! 82: OR_R	or 	%r5, %r14, %r31
	.word 0xa600ecf9  ! 82: ADD_I	add 	%r3, 0x0cf9, %r19
	.word 0xbe010009  ! 82: ADD_R	add 	%r4, %r9, %r31
	.word 0xb001c009  ! 82: ADD_R	add 	%r7, %r9, %r24
	.word 0xac12000f  ! 82: OR_R	or 	%r8, %r15, %r22
	.word 0xa2012102  ! 82: ADD_I	add 	%r4, 0x0102, %r17
	.word 0xaa09c00e  ! 82: AND_R	and 	%r7, %r14, %r21
	.word 0xa211800e  ! 82: OR_R	or 	%r6, %r14, %r17
	.word 0xb0012654  ! 82: ADD_I	add 	%r4, 0x0654, %r24
	.word 0xba092d8a  ! 82: AND_I	and 	%r4, 0x0d8a, %r29
	.word 0xb8116522  ! 82: OR_I	or 	%r5, 0x0522, %r28
	.word 0xae01eb77  ! 82: ADD_I	add 	%r7, 0x0b77, %r23
	.word 0xa409a0b9  ! 82: AND_I	and 	%r6, 0x00b9, %r18
	.word 0xb80a000d  ! 82: AND_R	and 	%r8, %r13, %r28
	.word 0xa208c00f  ! 82: AND_R	and 	%r3, %r15, %r17
	.word 0xae11000b  ! 82: OR_R	or 	%r4, %r11, %r23
	.word 0xae020009  ! 82: ADD_R	add 	%r8, %r9, %r23
	.word 0xac01800e  ! 82: ADD_R	add 	%r6, %r14, %r22
	.word 0xb209a505  ! 82: AND_I	and 	%r6, 0x0505, %r25
	.word 0xaa01aa97  ! 82: ADD_I	add 	%r6, 0x0a97, %r21
	.word 0xa201800c  ! 82: ADD_R	add 	%r6, %r12, %r17
	.word 0xb011675c  ! 82: OR_I	or 	%r5, 0x075c, %r24
	.word 0xaa09e355  ! 82: AND_I	and 	%r7, 0x0355, %r21
	.word 0xa811c00f  ! 82: OR_R	or 	%r7, %r15, %r20
	.word 0xa6092ca3  ! 82: AND_I	and 	%r4, 0x0ca3, %r19
	.word 0xb402000a  ! 82: ADD_R	add 	%r8, %r10, %r26
	.word 0xb8090009  ! 82: AND_R	and 	%r4, %r9, %r28
	.word 0xae11abca  ! 82: OR_I	or 	%r6, 0x0bca, %r23
	.word 0xbe00e1c3  ! 82: ADD_I	add 	%r3, 0x01c3, %r31
	.word 0xba11800e  ! 82: OR_R	or 	%r6, %r14, %r29
	.word 0xb60a2bb2  ! 82: AND_I	and 	%r8, 0x0bb2, %r27
	.word 0xa809c00b  ! 82: AND_R	and 	%r7, %r11, %r20
	.word 0xa609a125  ! 82: AND_I	and 	%r6, 0x0125, %r19
	.word 0xbe116288  ! 82: OR_I	or 	%r5, 0x0288, %r31
	.word 0xb6112e3f  ! 82: OR_I	or 	%r4, 0x0e3f, %r27
	.word 0xa402000c  ! 82: ADD_R	add 	%r8, %r12, %r18
	.word 0xba092155  ! 82: AND_I	and 	%r4, 0x0155, %r29
	.word 0xa601c00d  ! 82: ADD_R	add 	%r7, %r13, %r19
	.word 0xb202203a  ! 82: ADD_I	add 	%r8, 0x003a, %r25
	.word 0xac122eb8  ! 82: OR_I	or 	%r8, 0x0eb8, %r22
	.word 0xaa02000d  ! 82: ADD_R	add 	%r8, %r13, %r21
	.word 0xb401800c  ! 82: ADD_R	add 	%r6, %r12, %r26
	.word 0xba01a445  ! 82: ADD_I	add 	%r6, 0x0445, %r29
	.word 0xaa09ae4c  ! 82: AND_I	and 	%r6, 0x0e4c, %r21
	.word 0xa402000d  ! 82: ADD_R	add 	%r8, %r13, %r18
	.word 0xbc02000f  ! 82: ADD_R	add 	%r8, %r15, %r30
	.word 0xa80166cc  ! 82: ADD_I	add 	%r5, 0x06cc, %r20
	.word 0xba08c00d  ! 82: AND_R	and 	%r3, %r13, %r29
	.word 0xb809000e  ! 82: AND_R	and 	%r4, %r14, %r28
	.word 0xac0a000f  ! 82: AND_R	and 	%r8, %r15, %r22
	.word 0xa408e8db  ! 82: AND_I	and 	%r3, 0x08db, %r18
	.word 0xb200c009  ! 82: ADD_R	add 	%r3, %r9, %r25
	.word 0xa801a1cb  ! 82: ADD_I	add 	%r6, 0x01cb, %r20
	.word 0xb40222ac  ! 82: ADD_I	add 	%r8, 0x02ac, %r26
	.word 0xa412000e  ! 82: OR_R	or 	%r8, %r14, %r18
	.word 0xb811400c  ! 82: OR_R	or 	%r5, %r12, %r28
	.word 0xaa096dcf  ! 82: AND_I	and 	%r5, 0x0dcf, %r21
	.word 0xb410e2d0  ! 82: OR_I	or 	%r3, 0x02d0, %r26
	.word 0xa401c00f  ! 82: ADD_R	add 	%r7, %r15, %r18
	.word 0xa608c00b  ! 82: AND_R	and 	%r3, %r11, %r19
	.word 0xa409c00b  ! 82: AND_R	and 	%r7, %r11, %r18
	.word 0xac1229ac  ! 82: OR_I	or 	%r8, 0x09ac, %r22
	.word 0xb810ebee  ! 82: OR_I	or 	%r3, 0x0bee, %r28
	.word 0xa201400f  ! 82: ADD_R	add 	%r5, %r15, %r17
	.word 0xb200e2ea  ! 82: ADD_I	add 	%r3, 0x02ea, %r25
	.word 0xa200c00c  ! 82: ADD_R	add 	%r3, %r12, %r17
	.word 0xa801ebc9  ! 82: ADD_I	add 	%r7, 0x0bc9, %r20
	.word 0xb400e20b  ! 82: ADD_I	add 	%r3, 0x020b, %r26
	.word 0xae00e7d7  ! 82: ADD_I	add 	%r3, 0x07d7, %r23
	.word 0xa601400a  ! 82: ADD_R	add 	%r5, %r10, %r19
	.word 0xb209c00d  ! 82: AND_R	and 	%r7, %r13, %r25
	.word 0xa609e428  ! 82: AND_I	and 	%r7, 0x0428, %r19
	.word 0xa201800a  ! 82: ADD_R	add 	%r6, %r10, %r17
	.word 0xaa11800c  ! 82: OR_R	or 	%r6, %r12, %r21
	.word 0xb211800d  ! 82: OR_R	or 	%r6, %r13, %r25
	.word 0xa601000c  ! 82: ADD_R	add 	%r4, %r12, %r19
	.word 0xac0a2579  ! 82: AND_I	and 	%r8, 0x0579, %r22
	.word 0xbe01e14a  ! 82: ADD_I	add 	%r7, 0x014a, %r31
	.word 0xaa116ed1  ! 82: OR_I	or 	%r5, 0x0ed1, %r21
	.word 0xac11000e  ! 82: OR_R	or 	%r4, %r14, %r22
	.word 0xb011c00a  ! 82: OR_R	or 	%r7, %r10, %r24
	.word 0xb61124c9  ! 82: OR_I	or 	%r4, 0x04c9, %r27
	.word 0xb811800a  ! 82: OR_R	or 	%r6, %r10, %r28
	.word 0xb209400c  ! 82: AND_R	and 	%r5, %r12, %r25
	.word 0xa800e909  ! 82: ADD_I	add 	%r3, 0x0909, %r20
	.word 0xa40a000a  ! 82: AND_R	and 	%r8, %r10, %r18
	.word 0xa400c00a  ! 82: ADD_R	add 	%r3, %r10, %r18
	.word 0xbe01e42c  ! 82: ADD_I	add 	%r7, 0x042c, %r31
	.word 0xb211c00f  ! 82: OR_R	or 	%r7, %r15, %r25
	.word 0xb009400b  ! 82: AND_R	and 	%r5, %r11, %r24
	.word 0xae09400d  ! 82: AND_R	and 	%r5, %r13, %r23
	.word 0xaa122483  ! 82: OR_I	or 	%r8, 0x0483, %r21
	.word 0xb811678f  ! 82: OR_I	or 	%r5, 0x078f, %r28
	.word 0xb202000b  ! 82: ADD_R	add 	%r8, %r11, %r25
	.word 0xb6022f76  ! 82: ADD_I	add 	%r8, 0x0f76, %r27
	.word 0xa411c00b  ! 82: OR_R	or 	%r7, %r11, %r18
	.word 0xa6118009  ! 82: OR_R	or 	%r6, %r9, %r19
	.word 0xb801c009  ! 82: ADD_R	add 	%r7, %r9, %r28
	.word 0xb611e8ea  ! 82: OR_I	or 	%r7, 0x08ea, %r27
	.word 0xbe11800c  ! 82: OR_R	or 	%r6, %r12, %r31
	.word 0xb2098009  ! 82: AND_R	and 	%r6, %r9, %r25
	.word 0xac092ff0  ! 82: AND_I	and 	%r4, 0x0ff0, %r22
	.word 0xb6122db8  ! 82: OR_I	or 	%r8, 0x0db8, %r27
	.word 0xb009400c  ! 82: AND_R	and 	%r5, %r12, %r24
	.word 0xae012160  ! 82: ADD_I	add 	%r4, 0x0160, %r23
	.word 0xba00c00f  ! 82: ADD_R	add 	%r3, %r15, %r29
	.word 0xbc10c00b  ! 82: OR_R	or 	%r3, %r11, %r30
	.word 0xb209400b  ! 82: AND_R	and 	%r5, %r11, %r25
	.word 0xa609e022  ! 82: AND_I	and 	%r7, 0x0022, %r19
	.word 0xbc11800d  ! 82: OR_R	or 	%r6, %r13, %r30
	.word 0xa609400e  ! 82: AND_R	and 	%r5, %r14, %r19
	.word 0xb401aa70  ! 82: ADD_I	add 	%r6, 0x0a70, %r26
	.word 0xac08c00d  ! 82: AND_R	and 	%r3, %r13, %r22
	.word 0xb2122d05  ! 82: OR_I	or 	%r8, 0x0d05, %r25
	.word 0xa612000e  ! 82: OR_R	or 	%r8, %r14, %r19
	.word 0xb8022fbe  ! 82: ADD_I	add 	%r8, 0x0fbe, %r28
	.word 0xb801a959  ! 82: ADD_I	add 	%r6, 0x0959, %r28
	.word 0xb009c009  ! 82: AND_R	and 	%r7, %r9, %r24
	.word 0xbc112f21  ! 82: OR_I	or 	%r4, 0x0f21, %r30
	.word 0xbe11000b  ! 82: OR_R	or 	%r4, %r11, %r31
	.word 0xe8216dfc  ! 82: STW_I	stw	%r20, [%r5 + 0x0dfc]
	.word 0xfa29e91f  ! 82: STB_I	stb	%r29, [%r7 + 0x091f]
	.word 0xe228e20e  ! 82: STB_I	stb	%r17, [%r3 + 0x020e]
	.word 0xfa71a2b8  ! 82: STX_I	stx	%r29, [%r6 + 0x02b8]
	.word 0xe671a848  ! 82: STX_I	stx	%r19, [%r6 + 0x0848]
	.word 0xe4322d8e  ! 83: STH_I	sth	%r18, [%r8 + 0x0d8e]
	.word 0xa419a69c  ! 84: XOR_I	xor 	%r6, 0x069c, %r18
	.word 0xf621e130  ! 85: STW_I	stw	%r27, [%r7 + 0x0130]
	.word 0xfe30e2f0  ! 86: STH_I	sth	%r31, [%r3 + 0x02f0]
	.word 0xa671000e  ! 87: UDIV_R	udiv 	%r4, %r14, %r19
	.word 0xaa11a93c  ! 87: OR_I	or 	%r6, 0x093c, %r21
	.word 0xae08c00d  ! 87: AND_R	and 	%r3, %r13, %r23
	.word 0xb809000e  ! 87: AND_R	and 	%r4, %r14, %r28
	bne thr3_loop_6
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_7:
	.word 0xb20a000b  ! 93: AND_R	and 	%r8, %r11, %r25
	.word 0xac11400a  ! 93: OR_R	or 	%r5, %r10, %r22
	.word 0xae09400d  ! 93: AND_R	and 	%r5, %r13, %r23
	.word 0xb00169c3  ! 93: ADD_I	add 	%r5, 0x09c3, %r24
	.word 0xb609400e  ! 93: AND_R	and 	%r5, %r14, %r27
	.word 0xb011e206  ! 93: OR_I	or 	%r7, 0x0206, %r24
	.word 0xa211e494  ! 93: OR_I	or 	%r7, 0x0494, %r17
	.word 0xbc02000e  ! 93: ADD_R	add 	%r8, %r14, %r30
	.word 0xa2096209  ! 93: AND_I	and 	%r5, 0x0209, %r17
	.word 0xb011239b  ! 93: OR_I	or 	%r4, 0x039b, %r24
	.word 0xae1221b6  ! 93: OR_I	or 	%r8, 0x01b6, %r23
	.word 0xba01658b  ! 93: ADD_I	add 	%r5, 0x058b, %r29
	.word 0xba098009  ! 93: AND_R	and 	%r6, %r9, %r29
	.word 0xbc11400c  ! 93: OR_R	or 	%r5, %r12, %r30
	.word 0xba09e38e  ! 93: AND_I	and 	%r7, 0x038e, %r29
	.word 0xbc116de8  ! 93: OR_I	or 	%r5, 0x0de8, %r30
	.word 0xbc090009  ! 93: AND_R	and 	%r4, %r9, %r30
	.word 0xac01000c  ! 93: ADD_R	add 	%r4, %r12, %r22
	.word 0xa800eda3  ! 93: ADD_I	add 	%r3, 0x0da3, %r20
	.word 0xbe0126b3  ! 93: ADD_I	add 	%r4, 0x06b3, %r31
	.word 0xb8016d91  ! 93: ADD_I	add 	%r5, 0x0d91, %r28
	.word 0xb001c009  ! 93: ADD_R	add 	%r7, %r9, %r24
	.word 0xae08c009  ! 93: AND_R	and 	%r3, %r9, %r23
	.word 0xb6022661  ! 93: ADD_I	add 	%r8, 0x0661, %r27
	.word 0xa2096940  ! 93: AND_I	and 	%r5, 0x0940, %r17
	.word 0xb80a2588  ! 93: AND_I	and 	%r8, 0x0588, %r28
	.word 0xa411000d  ! 93: OR_R	or 	%r4, %r13, %r18
	.word 0xa6012997  ! 93: ADD_I	add 	%r4, 0x0997, %r19
	.word 0xaa08efbb  ! 93: AND_I	and 	%r3, 0x0fbb, %r21
	.word 0xb801c00b  ! 93: ADD_R	add 	%r7, %r11, %r28
	.word 0xb602000f  ! 93: ADD_R	add 	%r8, %r15, %r27
	.word 0xa409c00c  ! 93: AND_R	and 	%r7, %r12, %r18
	.word 0xa809c00f  ! 93: AND_R	and 	%r7, %r15, %r20
	.word 0xb001e703  ! 93: ADD_I	add 	%r7, 0x0703, %r24
	.word 0xba08e9f4  ! 93: AND_I	and 	%r3, 0x09f4, %r29
	.word 0xa801800a  ! 93: ADD_R	add 	%r6, %r10, %r20
	.word 0xb401800e  ! 93: ADD_R	add 	%r6, %r14, %r26
	.word 0xa4092da0  ! 93: AND_I	and 	%r4, 0x0da0, %r18
	.word 0xb600e860  ! 93: ADD_I	add 	%r3, 0x0860, %r27
	.word 0xb0110009  ! 93: OR_R	or 	%r4, %r9, %r24
	.word 0xb610c00a  ! 93: OR_R	or 	%r3, %r10, %r27
	.word 0xba08c00a  ! 93: AND_R	and 	%r3, %r10, %r29
	.word 0xb609eddd  ! 93: AND_I	and 	%r7, 0x0ddd, %r27
	.word 0xac11eaed  ! 93: OR_I	or 	%r7, 0x0aed, %r22
	.word 0xaa09c00c  ! 93: AND_R	and 	%r7, %r12, %r21
	.word 0xa409a1cf  ! 93: AND_I	and 	%r6, 0x01cf, %r18
	.word 0xae09acb6  ! 93: AND_I	and 	%r6, 0x0cb6, %r23
	.word 0xbe02000b  ! 93: ADD_R	add 	%r8, %r11, %r31
	.word 0xae01e25b  ! 93: ADD_I	add 	%r7, 0x025b, %r23
	.word 0xbc0928f2  ! 93: AND_I	and 	%r4, 0x08f2, %r30
	.word 0xaa092984  ! 93: AND_I	and 	%r4, 0x0984, %r21
	.word 0xae09000a  ! 93: AND_R	and 	%r4, %r10, %r23
	.word 0xb010e068  ! 93: OR_I	or 	%r3, 0x0068, %r24
	.word 0xb411a655  ! 93: OR_I	or 	%r6, 0x0655, %r26
	.word 0xa20a202f  ! 93: AND_I	and 	%r8, 0x002f, %r17
	.word 0xa609400d  ! 93: AND_R	and 	%r5, %r13, %r19
	.word 0xb401800e  ! 93: ADD_R	add 	%r6, %r14, %r26
	.word 0xbc09000f  ! 93: AND_R	and 	%r4, %r15, %r30
	.word 0xaa09a271  ! 93: AND_I	and 	%r6, 0x0271, %r21
	.word 0xae09641b  ! 93: AND_I	and 	%r5, 0x041b, %r23
	.word 0xa401400f  ! 93: ADD_R	add 	%r5, %r15, %r18
	.word 0xae02000b  ! 93: ADD_R	add 	%r8, %r11, %r23
	.word 0xba09aaf0  ! 93: AND_I	and 	%r6, 0x0af0, %r29
	.word 0xb6112183  ! 93: OR_I	or 	%r4, 0x0183, %r27
	.word 0xb212000b  ! 93: OR_R	or 	%r8, %r11, %r25
	.word 0xb809e796  ! 93: AND_I	and 	%r7, 0x0796, %r28
	.word 0xb809800e  ! 93: AND_R	and 	%r6, %r14, %r28
	.word 0xa811c00c  ! 93: OR_R	or 	%r7, %r12, %r20
	.word 0xae09000a  ! 93: AND_R	and 	%r4, %r10, %r23
	.word 0xa608c00d  ! 93: AND_R	and 	%r3, %r13, %r19
	.word 0xba112a2d  ! 93: OR_I	or 	%r4, 0x0a2d, %r29
	.word 0xa8122001  ! 93: OR_I	or 	%r8, 0x0001, %r20
	.word 0xaa02000f  ! 93: ADD_R	add 	%r8, %r15, %r21
	.word 0xbe1229aa  ! 93: OR_I	or 	%r8, 0x09aa, %r31
	.word 0xa202000c  ! 93: ADD_R	add 	%r8, %r12, %r17
	.word 0xb009ef88  ! 93: AND_I	and 	%r7, 0x0f88, %r24
	.word 0xae01800a  ! 93: ADD_R	add 	%r6, %r10, %r23
	.word 0xba016b8f  ! 93: ADD_I	add 	%r5, 0x0b8f, %r29
	.word 0xba01400e  ! 93: ADD_R	add 	%r5, %r14, %r29
	.word 0xac096b7e  ! 93: AND_I	and 	%r5, 0x0b7e, %r22
	.word 0xa2096ed1  ! 93: AND_I	and 	%r5, 0x0ed1, %r17
	.word 0xb411e2a5  ! 93: OR_I	or 	%r7, 0x02a5, %r26
	.word 0xaa11a688  ! 93: OR_I	or 	%r6, 0x0688, %r21
	.word 0xac12000a  ! 93: OR_R	or 	%r8, %r10, %r22
	.word 0xa600eb38  ! 93: ADD_I	add 	%r3, 0x0b38, %r19
	.word 0xb2010009  ! 93: ADD_R	add 	%r4, %r9, %r25
	.word 0xb4012c60  ! 93: ADD_I	add 	%r4, 0x0c60, %r26
	.word 0xa800e3c0  ! 93: ADD_I	add 	%r3, 0x03c0, %r20
	.word 0xba11c00d  ! 93: OR_R	or 	%r7, %r13, %r29
	.word 0xa610e1d2  ! 93: OR_I	or 	%r3, 0x01d2, %r19
	.word 0xb212000f  ! 93: OR_R	or 	%r8, %r15, %r25
	.word 0xb802000e  ! 93: ADD_R	add 	%r8, %r14, %r28
	.word 0xb811eeb3  ! 93: OR_I	or 	%r7, 0x0eb3, %r28
	.word 0xb408e22a  ! 93: AND_I	and 	%r3, 0x022a, %r26
	.word 0xb60a0009  ! 93: AND_R	and 	%r8, %r9, %r27
	.word 0xaa096d4d  ! 93: AND_I	and 	%r5, 0x0d4d, %r21
	.word 0xba08c00a  ! 93: AND_R	and 	%r3, %r10, %r29
	.word 0xb208ea07  ! 93: AND_I	and 	%r3, 0x0a07, %r25
	.word 0xa401400d  ! 93: ADD_R	add 	%r5, %r13, %r18
	.word 0xb001e905  ! 93: ADD_I	add 	%r7, 0x0905, %r24
	.word 0xb001800c  ! 93: ADD_R	add 	%r6, %r12, %r24
	.word 0xaa022adf  ! 93: ADD_I	add 	%r8, 0x0adf, %r21
	.word 0xb8016467  ! 93: ADD_I	add 	%r5, 0x0467, %r28
	.word 0xae114009  ! 93: OR_R	or 	%r5, %r9, %r23
	.word 0xac096ebf  ! 93: AND_I	and 	%r5, 0x0ebf, %r22
	.word 0xa40122df  ! 93: ADD_I	add 	%r4, 0x02df, %r18
	.word 0xae01e92e  ! 93: ADD_I	add 	%r7, 0x092e, %r23
	.word 0xba00e94c  ! 93: ADD_I	add 	%r3, 0x094c, %r29
	.word 0xb411208a  ! 93: OR_I	or 	%r4, 0x008a, %r26
	.word 0xac09c00b  ! 93: AND_R	and 	%r7, %r11, %r22
	.word 0xa2118009  ! 93: OR_R	or 	%r6, %r9, %r17
	.word 0xea292f4b  ! 93: STB_I	stb	%r21, [%r4 + 0x0f4b]
	.word 0xe621e918  ! 93: STW_I	stw	%r19, [%r7 + 0x0918]
	.word 0xfe31262c  ! 93: STH_I	sth	%r31, [%r4 + 0x062c]
	.word 0xf030e80a  ! 93: STH_I	sth	%r24, [%r3 + 0x080a]
	.word 0xe821a7a0  ! 93: STW_I	stw	%r20, [%r6 + 0x07a0]
	.word 0xf228e55b  ! 95: STB_I	stb	%r25, [%r3 + 0x055b]
	.word 0xae010045
	.word 0xec28e908  ! 97: STB_I	stb	%r22, [%r3 + 0x0908]
	.word 0xf67229b0  ! 98: STX_I	stx	%r27, [%r8 + 0x09b0]
	.word 0xe449affb  ! 99: LDSB_I	ldsb	[%r6 + 0x0ffb], %r18
	.word 0xaa08c00e  ! 99: AND_R	and 	%r3, %r14, %r21
	.word 0xa6012e4c  ! 99: ADD_I	add 	%r4, 0x0e4c, %r19
	.word 0xaa01c00b  ! 99: ADD_R	add 	%r7, %r11, %r21
	bne thr3_loop_7
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_8:
	.word 0xb011800c  ! 105: OR_R	or 	%r6, %r12, %r24
	.word 0xb80a000b  ! 105: AND_R	and 	%r8, %r11, %r28
	.word 0xbc12000f  ! 105: OR_R	or 	%r8, %r15, %r30
	.word 0xb4018009  ! 105: ADD_R	add 	%r6, %r9, %r26
	.word 0xa810c00f  ! 105: OR_R	or 	%r3, %r15, %r20
	.word 0xaa092c8e  ! 105: AND_I	and 	%r4, 0x0c8e, %r21
	.word 0xa201a8e2  ! 105: ADD_I	add 	%r6, 0x08e2, %r17
	.word 0xb401c00c  ! 105: ADD_R	add 	%r7, %r12, %r26
	.word 0xba11c009  ! 105: OR_R	or 	%r7, %r9, %r29
	.word 0xa2116c89  ! 105: OR_I	or 	%r5, 0x0c89, %r17
	.word 0xbe0127a6  ! 105: ADD_I	add 	%r4, 0x07a6, %r31
	.word 0xbc01275c  ! 105: ADD_I	add 	%r4, 0x075c, %r30
	.word 0xbc09c009  ! 105: AND_R	and 	%r7, %r9, %r30
	.word 0xac10c00b  ! 105: OR_R	or 	%r3, %r11, %r22
	.word 0xb611efb4  ! 105: OR_I	or 	%r7, 0x0fb4, %r27
	.word 0xac01ae46  ! 105: ADD_I	add 	%r6, 0x0e46, %r22
	.word 0xbe122b6e  ! 105: OR_I	or 	%r8, 0x0b6e, %r31
	.word 0xb412000d  ! 105: OR_R	or 	%r8, %r13, %r26
	.word 0xaa020009  ! 105: ADD_R	add 	%r8, %r9, %r21
	.word 0xb009000e  ! 105: AND_R	and 	%r4, %r14, %r24
	.word 0xac12213e  ! 105: OR_I	or 	%r8, 0x013e, %r22
	.word 0xae08e7d5  ! 105: AND_I	and 	%r3, 0x07d5, %r23
	.word 0xbe09ee52  ! 105: AND_I	and 	%r7, 0x0e52, %r31
	.word 0xba01680a  ! 105: ADD_I	add 	%r5, 0x080a, %r29
	.word 0xb009ece1  ! 105: AND_I	and 	%r7, 0x0ce1, %r24
	.word 0xb61168ed  ! 105: OR_I	or 	%r5, 0x08ed, %r27
	.word 0xa609400d  ! 105: AND_R	and 	%r5, %r13, %r19
	.word 0xbe114009  ! 105: OR_R	or 	%r5, %r9, %r31
	.word 0xa81220af  ! 105: OR_I	or 	%r8, 0x00af, %r20
	.word 0xbe02000a  ! 105: ADD_R	add 	%r8, %r10, %r31
	.word 0xa809eac8  ! 105: AND_I	and 	%r7, 0x0ac8, %r20
	.word 0xba09800b  ! 105: AND_R	and 	%r6, %r11, %r29
	.word 0xac11800f  ! 105: OR_R	or 	%r6, %r15, %r22
	.word 0xb411c009  ! 105: OR_R	or 	%r7, %r9, %r26
	.word 0xba09000e  ! 105: AND_R	and 	%r4, %r14, %r29
	.word 0xb811e74b  ! 105: OR_I	or 	%r7, 0x074b, %r28
	.word 0xa809000b  ! 105: AND_R	and 	%r4, %r11, %r20
	.word 0xb211000b  ! 105: OR_R	or 	%r4, %r11, %r25
	.word 0xa409000f  ! 105: AND_R	and 	%r4, %r15, %r18
	.word 0xb001800d  ! 105: ADD_R	add 	%r6, %r13, %r24
	.word 0xb6092758  ! 105: AND_I	and 	%r4, 0x0758, %r27
	.word 0xb8016fa4  ! 105: ADD_I	add 	%r5, 0x0fa4, %r28
	.word 0xae01e789  ! 105: ADD_I	add 	%r7, 0x0789, %r23
	.word 0xae01400e  ! 105: ADD_R	add 	%r5, %r14, %r23
	.word 0xa612000a  ! 105: OR_R	or 	%r8, %r10, %r19
	.word 0xb409000b  ! 105: AND_R	and 	%r4, %r11, %r26
	.word 0xa8096342  ! 105: AND_I	and 	%r5, 0x0342, %r20
	.word 0xb611691a  ! 105: OR_I	or 	%r5, 0x091a, %r27
	.word 0xa608c00c  ! 105: AND_R	and 	%r3, %r12, %r19
	.word 0xb408c00c  ! 105: AND_R	and 	%r3, %r12, %r26
	.word 0xba12000e  ! 105: OR_R	or 	%r8, %r14, %r29
	.word 0xa611e7c8  ! 105: OR_I	or 	%r7, 0x07c8, %r19
	.word 0xa411c00b  ! 105: OR_R	or 	%r7, %r11, %r18
	.word 0xba12000a  ! 105: OR_R	or 	%r8, %r10, %r29
	.word 0xa601c00a  ! 105: ADD_R	add 	%r7, %r10, %r19
	.word 0xb602000c  ! 105: ADD_R	add 	%r8, %r12, %r27
	.word 0xae11ea32  ! 105: OR_I	or 	%r7, 0x0a32, %r23
	.word 0xa211269c  ! 105: OR_I	or 	%r4, 0x069c, %r17
	.word 0xb811ac1d  ! 105: OR_I	or 	%r6, 0x0c1d, %r28
	.word 0xba01000f  ! 105: ADD_R	add 	%r4, %r15, %r29
	.word 0xb411eee6  ! 105: OR_I	or 	%r7, 0x0ee6, %r26
	.word 0xbc11aca1  ! 105: OR_I	or 	%r6, 0x0ca1, %r30
	.word 0xb811000e  ! 105: OR_R	or 	%r4, %r14, %r28
	.word 0xa609a1a2  ! 105: AND_I	and 	%r6, 0x01a2, %r19
	.word 0xae09e39b  ! 105: AND_I	and 	%r7, 0x039b, %r23
	.word 0xaa0a000b  ! 105: AND_R	and 	%r8, %r11, %r21
	.word 0xa600c00f  ! 105: ADD_R	add 	%r3, %r15, %r19
	.word 0xa209c00f  ! 105: AND_R	and 	%r7, %r15, %r17
	.word 0xa409e2ad  ! 105: AND_I	and 	%r7, 0x02ad, %r18
	.word 0xa401c00d  ! 105: ADD_R	add 	%r7, %r13, %r18
	.word 0xa211e6b3  ! 105: OR_I	or 	%r7, 0x06b3, %r17
	.word 0xa608c00d  ! 105: AND_R	and 	%r3, %r13, %r19
	.word 0xa809c00b  ! 105: AND_R	and 	%r7, %r11, %r20
	.word 0xb001a2cd  ! 105: ADD_I	add 	%r6, 0x02cd, %r24
	.word 0xa400c009  ! 105: ADD_R	add 	%r3, %r9, %r18
	.word 0xbe118009  ! 105: OR_R	or 	%r6, %r9, %r31
	.word 0xb2092c5f  ! 105: AND_I	and 	%r4, 0x0c5f, %r25
	.word 0xaa11c00a  ! 105: OR_R	or 	%r7, %r10, %r21
	.word 0xb400e3ef  ! 105: ADD_I	add 	%r3, 0x03ef, %r26
	.word 0xb411c00a  ! 105: OR_R	or 	%r7, %r10, %r26
	.word 0xac09400f  ! 105: AND_R	and 	%r5, %r15, %r22
	.word 0xa609400b  ! 105: AND_R	and 	%r5, %r11, %r19
	.word 0xb6098009  ! 105: AND_R	and 	%r6, %r9, %r27
	.word 0xb008c00c  ! 105: AND_R	and 	%r3, %r12, %r24
	.word 0xa801a690  ! 105: ADD_I	add 	%r6, 0x0690, %r20
	.word 0xb408eae7  ! 105: AND_I	and 	%r3, 0x0ae7, %r26
	.word 0xb210efa6  ! 105: OR_I	or 	%r3, 0x0fa6, %r25
	.word 0xb601ea58  ! 105: ADD_I	add 	%r7, 0x0a58, %r27
	.word 0xbc00c00c  ! 105: ADD_R	add 	%r3, %r12, %r30
	.word 0xb209a509  ! 105: AND_I	and 	%r6, 0x0509, %r25
	.word 0xac11000d  ! 105: OR_R	or 	%r4, %r13, %r22
	.word 0xb402000a  ! 105: ADD_R	add 	%r8, %r10, %r26
	.word 0xa811e0b4  ! 105: OR_I	or 	%r7, 0x00b4, %r20
	.word 0xa8020009  ! 105: ADD_R	add 	%r8, %r9, %r20
	.word 0xb6016947  ! 105: ADD_I	add 	%r5, 0x0947, %r27
	.word 0xb61161e8  ! 105: OR_I	or 	%r5, 0x01e8, %r27
	.word 0xa2012c3d  ! 105: ADD_I	add 	%r4, 0x0c3d, %r17
	.word 0xa602000d  ! 105: ADD_R	add 	%r8, %r13, %r19
	.word 0xbe016a17  ! 105: ADD_I	add 	%r5, 0x0a17, %r31
	.word 0xac014009  ! 105: ADD_R	add 	%r5, %r9, %r22
	.word 0xa201648e  ! 105: ADD_I	add 	%r5, 0x048e, %r17
	.word 0xac010009  ! 105: ADD_R	add 	%r4, %r9, %r22
	.word 0xaa118009  ! 105: OR_R	or 	%r6, %r9, %r21
	.word 0xa401c00e  ! 105: ADD_R	add 	%r7, %r14, %r18
	.word 0xb809800f  ! 105: AND_R	and 	%r6, %r15, %r28
	.word 0xac08c00c  ! 105: AND_R	and 	%r3, %r12, %r22
	.word 0xa609e322  ! 105: AND_I	and 	%r7, 0x0322, %r19
	.word 0xb81125f2  ! 105: OR_I	or 	%r4, 0x05f2, %r28
	.word 0xac094009  ! 105: AND_R	and 	%r5, %r9, %r22
	.word 0xac11e7c2  ! 105: OR_I	or 	%r7, 0x07c2, %r22
	.word 0xac08e2c9  ! 105: AND_I	and 	%r3, 0x02c9, %r22
	.word 0xb411400a  ! 105: OR_R	or 	%r5, %r10, %r26
	.word 0xb0016aca  ! 105: ADD_I	add 	%r5, 0x0aca, %r24
	.word 0xae090009  ! 105: AND_R	and 	%r4, %r9, %r23
	.word 0xa2112461  ! 105: OR_I	or 	%r4, 0x0461, %r17
	.word 0xb21224b2  ! 105: OR_I	or 	%r8, 0x04b2, %r25
	.word 0xbe11e0ac  ! 105: OR_I	or 	%r7, 0x00ac, %r31
	.word 0xb408ea49  ! 105: AND_I	and 	%r3, 0x0a49, %r26
	.word 0xb611400e  ! 105: OR_R	or 	%r5, %r14, %r27
	.word 0xbe08c00d  ! 105: AND_R	and 	%r3, %r13, %r31
	.word 0xa211c00c  ! 105: OR_R	or 	%r7, %r12, %r17
	.word 0xb2016131  ! 105: ADD_I	add 	%r5, 0x0131, %r25
	.word 0xba1228a8  ! 105: OR_I	or 	%r8, 0x08a8, %r29
	.word 0xa80a2944  ! 105: AND_I	and 	%r8, 0x0944, %r20
	.word 0xa2016c61  ! 105: ADD_I	add 	%r5, 0x0c61, %r17
	.word 0xb610c00e  ! 105: OR_R	or 	%r3, %r14, %r27
	.word 0xa601400b  ! 105: ADD_R	add 	%r5, %r11, %r19
	.word 0xa201e814  ! 105: ADD_I	add 	%r7, 0x0814, %r17
	.word 0xb0022ea4  ! 105: ADD_I	add 	%r8, 0x0ea4, %r24
	.word 0xaa092fc5  ! 105: AND_I	and 	%r4, 0x0fc5, %r21
	.word 0xa402000c  ! 105: ADD_R	add 	%r8, %r12, %r18
	.word 0xae0923ad  ! 105: AND_I	and 	%r4, 0x03ad, %r23
	.word 0xb2022909  ! 105: ADD_I	add 	%r8, 0x0909, %r25
	.word 0xa8014009  ! 105: ADD_R	add 	%r5, %r9, %r20
	.word 0xac0922c9  ! 105: AND_I	and 	%r4, 0x02c9, %r22
	.word 0xa201800d  ! 105: ADD_R	add 	%r6, %r13, %r17
	.word 0xbe11000e  ! 105: OR_R	or 	%r4, %r14, %r31
	.word 0xb4012b87  ! 105: ADD_I	add 	%r4, 0x0b87, %r26
	.word 0xbe016cb3  ! 105: ADD_I	add 	%r5, 0x0cb3, %r31
	.word 0xba0a2b2d  ! 105: AND_I	and 	%r8, 0x0b2d, %r29
	.word 0xb601e0f9  ! 105: ADD_I	add 	%r7, 0x00f9, %r27
	.word 0xaa122457  ! 105: OR_I	or 	%r8, 0x0457, %r21
	.word 0xa409c009  ! 105: AND_R	and 	%r7, %r9, %r18
	.word 0xba11800d  ! 105: OR_R	or 	%r6, %r13, %r29
	.word 0xb6092d57  ! 105: AND_I	and 	%r4, 0x0d57, %r27
	.word 0xae0a290d  ! 105: AND_I	and 	%r8, 0x090d, %r23
	.word 0xb211400f  ! 105: OR_R	or 	%r5, %r15, %r25
	.word 0xb608e76b  ! 105: AND_I	and 	%r3, 0x076b, %r27
	.word 0xa609000b  ! 105: AND_R	and 	%r4, %r11, %r19
	.word 0xae110009  ! 105: OR_R	or 	%r4, %r9, %r23
	.word 0xb6116526  ! 105: OR_I	or 	%r5, 0x0526, %r27
	.word 0xae120009  ! 105: OR_R	or 	%r8, %r9, %r23
	.word 0xa60a2c9c  ! 105: AND_I	and 	%r8, 0x0c9c, %r19
	.word 0xbc0a245b  ! 105: AND_I	and 	%r8, 0x045b, %r30
	.word 0xa60a000a  ! 105: AND_R	and 	%r8, %r10, %r19
	.word 0xa202000e  ! 105: ADD_R	add 	%r8, %r14, %r17
	.word 0xb401688c  ! 105: ADD_I	add 	%r5, 0x088c, %r26
	.word 0xaa01284e  ! 105: ADD_I	add 	%r4, 0x084e, %r21
	.word 0xa2016fe8  ! 105: ADD_I	add 	%r5, 0x0fe8, %r17
	.word 0xb80923e4  ! 105: AND_I	and 	%r4, 0x03e4, %r28
	.word 0xa812000d  ! 105: OR_R	or 	%r8, %r13, %r20
	.word 0xa208e3b2  ! 105: AND_I	and 	%r3, 0x03b2, %r17
	.word 0xbc09e532  ! 105: AND_I	and 	%r7, 0x0532, %r30
	.word 0xbe11e3bd  ! 105: OR_I	or 	%r7, 0x03bd, %r31
	.word 0xbc01a6d6  ! 105: ADD_I	add 	%r6, 0x06d6, %r30
	.word 0xbe09a948  ! 105: AND_I	and 	%r6, 0x0948, %r31
	.word 0xba1161b3  ! 105: OR_I	or 	%r5, 0x01b3, %r29
	.word 0xe821e3f4  ! 105: STW_I	stw	%r20, [%r7 + 0x03f4]
	.word 0xe432283e  ! 105: STH_I	sth	%r18, [%r8 + 0x083e]
	.word 0xec28e495  ! 105: STB_I	stb	%r22, [%r3 + 0x0495]
	.word 0xfc21a428  ! 105: STW_I	stw	%r30, [%r6 + 0x0428]
	.word 0xe631a608  ! 105: STH_I	sth	%r19, [%r6 + 0x0608]
	.word 0xfe70e7c8  ! 107: STX_I	stx	%r31, [%r3 + 0x07c8]
	.word 0xac19800d  ! 108: XOR_R	xor 	%r6, %r13, %r22
	.word 0xf23221a8  ! 109: STH_I	sth	%r25, [%r8 + 0x01a8]
	.word 0xe8a8eac4  ! 110: STBA_I	stba	%r20, [%r3 + 0x0ac4] %asi
	.word 0xf042000e  ! 111: LDSW_R	ldsw	[%r8 + %r14], %r24
	.word 0xb201800d  ! 111: ADD_R	add 	%r6, %r13, %r25
	.word 0xae00c00a  ! 111: ADD_R	add 	%r3, %r10, %r23
	.word 0xbc11eb3f  ! 111: OR_I	or 	%r7, 0x0b3f, %r30
	bne thr3_loop_8
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_9:
	.word 0xae00c00b  ! 119: ADD_R	add 	%r3, %r11, %r23
	.word 0xa20a2df5  ! 119: AND_I	and 	%r8, 0x0df5, %r17
	.word 0xb012000e  ! 119: OR_R	or 	%r8, %r14, %r24
	.word 0xbc01000f  ! 119: ADD_R	add 	%r4, %r15, %r30
	.word 0xb609ea2f  ! 119: AND_I	and 	%r7, 0x0a2f, %r27
	.word 0xaa11eb8a  ! 119: OR_I	or 	%r7, 0x0b8a, %r21
	.word 0xaa09a09f  ! 119: AND_I	and 	%r6, 0x009f, %r21
	.word 0xa611e1a5  ! 119: OR_I	or 	%r7, 0x01a5, %r19
	.word 0xb800c00e  ! 119: ADD_R	add 	%r3, %r14, %r28
	.word 0xaa1227b3  ! 119: OR_I	or 	%r8, 0x07b3, %r21
	.word 0xa409a7f6  ! 119: AND_I	and 	%r6, 0x07f6, %r18
	.word 0xaa09400f  ! 119: AND_R	and 	%r5, %r15, %r21
	.word 0xa411800c  ! 119: OR_R	or 	%r6, %r12, %r18
	.word 0xae11800e  ! 119: OR_R	or 	%r6, %r14, %r23
	.word 0xb6122118  ! 119: OR_I	or 	%r8, 0x0118, %r27
	.word 0xa601c00f  ! 119: ADD_R	add 	%r7, %r15, %r19
	.word 0xae012f83  ! 119: ADD_I	add 	%r4, 0x0f83, %r23
	.word 0xb811a70a  ! 119: OR_I	or 	%r6, 0x070a, %r28
	.word 0xac09e00a  ! 119: AND_I	and 	%r7, 0x000a, %r22
	.word 0xb209c009  ! 119: AND_R	and 	%r7, %r9, %r25
	.word 0xb0016d34  ! 119: ADD_I	add 	%r5, 0x0d34, %r24
	.word 0xbc09800a  ! 119: AND_R	and 	%r6, %r10, %r30
	.word 0xb209400f  ! 119: AND_R	and 	%r5, %r15, %r25
	.word 0xb2116f65  ! 119: OR_I	or 	%r5, 0x0f65, %r25
	.word 0xae01a05b  ! 119: ADD_I	add 	%r6, 0x005b, %r23
	.word 0xbc10c009  ! 119: OR_R	or 	%r3, %r9, %r30
	.word 0xb00120f2  ! 119: ADD_I	add 	%r4, 0x00f2, %r24
	.word 0xa208c009  ! 119: AND_R	and 	%r3, %r9, %r17
	.word 0xba022f50  ! 119: ADD_I	add 	%r8, 0x0f50, %r29
	.word 0xa611e3c6  ! 119: OR_I	or 	%r7, 0x03c6, %r19
	.word 0xb611800f  ! 119: OR_R	or 	%r6, %r15, %r27
	.word 0xa811000a  ! 119: OR_R	or 	%r4, %r10, %r20
	.word 0xba01e3c8  ! 119: ADD_I	add 	%r7, 0x03c8, %r29
	.word 0xb402000f  ! 119: ADD_R	add 	%r8, %r15, %r26
	.word 0xaa01a55e  ! 119: ADD_I	add 	%r6, 0x055e, %r21
	.word 0xa201000e  ! 119: ADD_R	add 	%r4, %r14, %r17
	.word 0xb411eee9  ! 119: OR_I	or 	%r7, 0x0ee9, %r26
	.word 0xa4012820  ! 119: ADD_I	add 	%r4, 0x0820, %r18
	.word 0xb801000e  ! 119: ADD_R	add 	%r4, %r14, %r28
	.word 0xaa116e79  ! 119: OR_I	or 	%r5, 0x0e79, %r21
	.word 0xb0114009  ! 119: OR_R	or 	%r5, %r9, %r24
	.word 0xaa09c00d  ! 119: AND_R	and 	%r7, %r13, %r21
	.word 0xa801eeb5  ! 119: ADD_I	add 	%r7, 0x0eb5, %r20
	.word 0xa602000a  ! 119: ADD_R	add 	%r8, %r10, %r19
	.word 0xbc09298a  ! 119: AND_I	and 	%r4, 0x098a, %r30
	.word 0xbe10ef24  ! 119: OR_I	or 	%r3, 0x0f24, %r31
	.word 0xa60129c2  ! 119: ADD_I	add 	%r4, 0x09c2, %r19
	.word 0xa409000a  ! 119: AND_R	and 	%r4, %r10, %r18
	.word 0xa809400b  ! 119: AND_R	and 	%r5, %r11, %r20
	.word 0xb210e4c3  ! 119: OR_I	or 	%r3, 0x04c3, %r25
	.word 0xa612000e  ! 119: OR_R	or 	%r8, %r14, %r19
	.word 0xb20a234c  ! 119: AND_I	and 	%r8, 0x034c, %r25
	.word 0xaa11400d  ! 119: OR_R	or 	%r5, %r13, %r21
	.word 0xbc01630e  ! 119: ADD_I	add 	%r5, 0x030e, %r30
	.word 0xa201eb78  ! 119: ADD_I	add 	%r7, 0x0b78, %r17
	.word 0xbc01ac0b  ! 119: ADD_I	add 	%r6, 0x0c0b, %r30
	.word 0xb2012bda  ! 119: ADD_I	add 	%r4, 0x0bda, %r25
	.word 0xb609800e  ! 119: AND_R	and 	%r6, %r14, %r27
	.word 0xa8096b8b  ! 119: AND_I	and 	%r5, 0x0b8b, %r20
	.word 0xaa00e625  ! 119: ADD_I	add 	%r3, 0x0625, %r21
	.word 0xbc00e0c1  ! 119: ADD_I	add 	%r3, 0x00c1, %r30
	.word 0xbc11800b  ! 119: OR_R	or 	%r6, %r11, %r30
	.word 0xbe11800f  ! 119: OR_R	or 	%r6, %r15, %r31
	.word 0xac1121c8  ! 119: OR_I	or 	%r4, 0x01c8, %r22
	.word 0xae09aa4d  ! 119: AND_I	and 	%r6, 0x0a4d, %r23
	.word 0xb8092d5e  ! 119: AND_I	and 	%r4, 0x0d5e, %r28
	.word 0xbc01000d  ! 119: ADD_R	add 	%r4, %r13, %r30
	.word 0xb809609a  ! 119: AND_I	and 	%r5, 0x009a, %r28
	.word 0xa4116d3c  ! 119: OR_I	or 	%r5, 0x0d3c, %r18
	.word 0xaa09c00a  ! 119: AND_R	and 	%r7, %r10, %r21
	.word 0xa601800e  ! 119: ADD_R	add 	%r6, %r14, %r19
	.word 0xa20a000c  ! 119: AND_R	and 	%r8, %r12, %r17
	.word 0xb008c00b  ! 119: AND_R	and 	%r3, %r11, %r24
	.word 0xb60a000e  ! 119: AND_R	and 	%r8, %r14, %r27
	.word 0xb4116b8c  ! 119: OR_I	or 	%r5, 0x0b8c, %r26
	.word 0xb00164e2  ! 119: ADD_I	add 	%r5, 0x04e2, %r24
	.word 0xaa0a27d3  ! 119: AND_I	and 	%r8, 0x07d3, %r21
	.word 0xac09000b  ! 119: AND_R	and 	%r4, %r11, %r22
	.word 0xb801e966  ! 119: ADD_I	add 	%r7, 0x0966, %r28
	.word 0xfe30e7fe  ! 119: STH_I	sth	%r31, [%r3 + 0x07fe]
	.word 0xf031659a  ! 119: STH_I	sth	%r24, [%r5 + 0x059a]
	.word 0xf22a2025  ! 119: STB_I	stb	%r25, [%r8 + 0x0025]
	.word 0xe830e74e  ! 119: STH_I	sth	%r20, [%r3 + 0x074e]
	.word 0xee30e038  ! 119: STH_I	sth	%r23, [%r3 + 0x0038]
	.word 0xe6216660  ! 119: STW_I	stw	%r19, [%r5 + 0x0660]
	.word 0xf821ecac  ! 119: STW_I	stw	%r28, [%r7 + 0x0cac]
DC_ERR_7:
!$EV error(3,expr(@VA(.MAIN.DC_ERR_7), 16, 16),1,DC_DATA,18)
	.word 0xe4492e76  ! 122: LDSB_I	ldsb	[%r4 + 0x0e76], %r18
	.word 0xbb78040c  ! 122: MOVR_R	move	%r0, %r12, %r29
	.word 0xea31ec00  ! 123: STH_I	sth	%r21, [%r7 + 0x0c00]
	.word 0xfc49e7e3  ! 124: LDSB_I	ldsb	[%r7 + 0x07e3], %r30
	.word 0xa202244e  ! 124: ADD_I	add 	%r8, 0x044e, %r17
	.word 0xb612000b  ! 124: OR_R	or 	%r8, %r11, %r27
	.word 0xb811298e  ! 124: OR_I	or 	%r4, 0x098e, %r28
	bne thr3_loop_9
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_10:
	.word 0xb611c00c  ! 130: OR_R	or 	%r7, %r12, %r27
	.word 0xb611400e  ! 130: OR_R	or 	%r5, %r14, %r27
	.word 0xbc09800a  ! 130: AND_R	and 	%r6, %r10, %r30
	.word 0xae092ba9  ! 130: AND_I	and 	%r4, 0x0ba9, %r23
	.word 0xa802000b  ! 130: ADD_R	add 	%r8, %r11, %r20
	.word 0xb00128c1  ! 130: ADD_I	add 	%r4, 0x08c1, %r24
	.word 0xb6012421  ! 130: ADD_I	add 	%r4, 0x0421, %r27
	.word 0xbe00e467  ! 130: ADD_I	add 	%r3, 0x0467, %r31
	.word 0xb6112852  ! 130: OR_I	or 	%r4, 0x0852, %r27
	.word 0xa401e06c  ! 130: ADD_I	add 	%r7, 0x006c, %r18
	.word 0xb0122f39  ! 130: OR_I	or 	%r8, 0x0f39, %r24
	.word 0xaa018009  ! 130: ADD_R	add 	%r6, %r9, %r21
	.word 0xb011400d  ! 130: OR_R	or 	%r5, %r13, %r24
	.word 0xaa11000f  ! 130: OR_R	or 	%r4, %r15, %r21
	.word 0xb00a000c  ! 130: AND_R	and 	%r8, %r12, %r24
	.word 0xb6096929  ! 130: AND_I	and 	%r5, 0x0929, %r27
	.word 0xae08e5e4  ! 130: AND_I	and 	%r3, 0x05e4, %r23
	.word 0xa400e01b  ! 130: ADD_I	add 	%r3, 0x001b, %r18
	.word 0xb400c00a  ! 130: ADD_R	add 	%r3, %r10, %r26
	.word 0xaa11000e  ! 130: OR_R	or 	%r4, %r14, %r21
	.word 0xb812000f  ! 130: OR_R	or 	%r8, %r15, %r28
	.word 0xaa09400f  ! 130: AND_R	and 	%r5, %r15, %r21
	.word 0xa211400a  ! 130: OR_R	or 	%r5, %r10, %r17
	.word 0xa401631a  ! 130: ADD_I	add 	%r5, 0x031a, %r18
	.word 0xb200e736  ! 130: ADD_I	add 	%r3, 0x0736, %r25
	.word 0xb801a3a5  ! 130: ADD_I	add 	%r6, 0x03a5, %r28
	.word 0xba012546  ! 130: ADD_I	add 	%r4, 0x0546, %r29
	.word 0xa201400d  ! 130: ADD_R	add 	%r5, %r13, %r17
	.word 0xb601a568  ! 130: ADD_I	add 	%r6, 0x0568, %r27
	.word 0xa60a2ab1  ! 130: AND_I	and 	%r8, 0x0ab1, %r19
	.word 0xbc0a2410  ! 130: AND_I	and 	%r8, 0x0410, %r30
	.word 0xa201af18  ! 130: ADD_I	add 	%r6, 0x0f18, %r17
	.word 0xa209800c  ! 130: AND_R	and 	%r6, %r12, %r17
	.word 0xbc09a29b  ! 130: AND_I	and 	%r6, 0x029b, %r30
	.word 0xae022ad1  ! 130: ADD_I	add 	%r8, 0x0ad1, %r23
	.word 0xac09800a  ! 130: AND_R	and 	%r6, %r10, %r22
	.word 0xa611e771  ! 130: OR_I	or 	%r7, 0x0771, %r19
	.word 0xa409800a  ! 130: AND_R	and 	%r6, %r10, %r18
	.word 0xae09ea1e  ! 130: AND_I	and 	%r7, 0x0a1e, %r23
	.word 0xa812000f  ! 130: OR_R	or 	%r8, %r15, %r20
	.word 0xbc02268f  ! 130: ADD_I	add 	%r8, 0x068f, %r30
	.word 0xb411400b  ! 130: OR_R	or 	%r5, %r11, %r26
	.word 0xac01664b  ! 130: ADD_I	add 	%r5, 0x064b, %r22
	.word 0xb001aa89  ! 130: ADD_I	add 	%r6, 0x0a89, %r24
	.word 0xa402000c  ! 130: ADD_R	add 	%r8, %r12, %r18
	.word 0xbc01000b  ! 130: ADD_R	add 	%r4, %r11, %r30
	.word 0xbe09e01a  ! 130: AND_I	and 	%r7, 0x001a, %r31
	.word 0xa409000c  ! 130: AND_R	and 	%r4, %r12, %r18
	.word 0xaa11800d  ! 130: OR_R	or 	%r6, %r13, %r21
	.word 0xba11e6c6  ! 130: OR_I	or 	%r7, 0x06c6, %r29
	.word 0xb80227b5  ! 130: ADD_I	add 	%r8, 0x07b5, %r28
	.word 0xa2096f65  ! 130: AND_I	and 	%r5, 0x0f65, %r17
	.word 0xae11a644  ! 130: OR_I	or 	%r6, 0x0644, %r23
	.word 0xac09c009  ! 130: AND_R	and 	%r7, %r9, %r22
	.word 0xa40a2923  ! 130: AND_I	and 	%r8, 0x0923, %r18
	.word 0xb609a69a  ! 130: AND_I	and 	%r6, 0x069a, %r27
	.word 0xa200e838  ! 130: ADD_I	add 	%r3, 0x0838, %r17
	.word 0xb81166df  ! 130: OR_I	or 	%r5, 0x06df, %r28
	.word 0xaa10eba0  ! 130: OR_I	or 	%r3, 0x0ba0, %r21
	.word 0xb4116b01  ! 130: OR_I	or 	%r5, 0x0b01, %r26
	.word 0xb011400d  ! 130: OR_R	or 	%r5, %r13, %r24
	.word 0xbc01800c  ! 130: ADD_R	add 	%r6, %r12, %r30
	.word 0xae0929f9  ! 130: AND_I	and 	%r4, 0x09f9, %r23
	.word 0xb811e13a  ! 130: OR_I	or 	%r7, 0x013a, %r28
	.word 0xb6016fb7  ! 130: ADD_I	add 	%r5, 0x0fb7, %r27
	.word 0xb011000b  ! 130: OR_R	or 	%r4, %r11, %r24
	.word 0xb00a2722  ! 130: AND_I	and 	%r8, 0x0722, %r24
	.word 0xbe022509  ! 130: ADD_I	add 	%r8, 0x0509, %r31
	.word 0xaa01255f  ! 130: ADD_I	add 	%r4, 0x055f, %r21
	.word 0xaa09a706  ! 130: AND_I	and 	%r6, 0x0706, %r21
	.word 0xbc092d2b  ! 130: AND_I	and 	%r4, 0x0d2b, %r30
	.word 0xba112928  ! 130: OR_I	or 	%r4, 0x0928, %r29
	.word 0xa611000e  ! 130: OR_R	or 	%r4, %r14, %r19
	.word 0xa812000f  ! 130: OR_R	or 	%r8, %r15, %r20
	.word 0xb412000e  ! 130: OR_R	or 	%r8, %r14, %r26
	.word 0xbe01ee68  ! 130: ADD_I	add 	%r7, 0x0e68, %r31
	.word 0xaa01a868  ! 130: ADD_I	add 	%r6, 0x0868, %r21
	.word 0xa810c009  ! 130: OR_R	or 	%r3, %r9, %r20
	.word 0xac12000d  ! 130: OR_R	or 	%r8, %r13, %r22
	.word 0xb802000e  ! 130: ADD_R	add 	%r8, %r14, %r28
	.word 0xa408ec2a  ! 130: AND_I	and 	%r3, 0x0c2a, %r18
	.word 0xb2022bcb  ! 130: ADD_I	add 	%r8, 0x0bcb, %r25
	.word 0xbe01af48  ! 130: ADD_I	add 	%r6, 0x0f48, %r31
	.word 0xa811000e  ! 130: OR_R	or 	%r4, %r14, %r20
	.word 0xa2096fff  ! 130: AND_I	and 	%r5, 0x0fff, %r17
	.word 0xa600c00b  ! 130: ADD_R	add 	%r3, %r11, %r19
	.word 0xb208c00a  ! 130: AND_R	and 	%r3, %r10, %r25
	.word 0xa601c00c  ! 130: ADD_R	add 	%r7, %r12, %r19
	.word 0xa402000b  ! 130: ADD_R	add 	%r8, %r11, %r18
	.word 0xaa092d4a  ! 130: AND_I	and 	%r4, 0x0d4a, %r21
	.word 0xb611c00d  ! 130: OR_R	or 	%r7, %r13, %r27
	.word 0xac01af6c  ! 130: ADD_I	add 	%r6, 0x0f6c, %r22
	.word 0xa2096e59  ! 130: AND_I	and 	%r5, 0x0e59, %r17
	.word 0xb2022b43  ! 130: ADD_I	add 	%r8, 0x0b43, %r25
	.word 0xb809000a  ! 130: AND_R	and 	%r4, %r10, %r28
	.word 0xba09e43d  ! 130: AND_I	and 	%r7, 0x043d, %r29
	.word 0xac11af94  ! 130: OR_I	or 	%r6, 0x0f94, %r22
	.word 0xb012226a  ! 130: OR_I	or 	%r8, 0x026a, %r24
	.word 0xb0016770  ! 130: ADD_I	add 	%r5, 0x0770, %r24
	.word 0xba11000f  ! 130: OR_R	or 	%r4, %r15, %r29
	.word 0xbc10e748  ! 130: OR_I	or 	%r3, 0x0748, %r30
	.word 0xb011641c  ! 130: OR_I	or 	%r5, 0x041c, %r24
	.word 0xaa11000b  ! 130: OR_R	or 	%r4, %r11, %r21
	.word 0xbc112e12  ! 130: OR_I	or 	%r4, 0x0e12, %r30
	.word 0xb411ef06  ! 130: OR_I	or 	%r7, 0x0f06, %r26
	.word 0xbc0222ec  ! 130: ADD_I	add 	%r8, 0x02ec, %r30
	.word 0xa60165ae  ! 130: ADD_I	add 	%r5, 0x05ae, %r19
	.word 0xa601c00b  ! 130: ADD_R	add 	%r7, %r11, %r19
	.word 0xbc01e0c6  ! 130: ADD_I	add 	%r7, 0x00c6, %r30
	.word 0xa401800f  ! 130: ADD_R	add 	%r6, %r15, %r18
	.word 0xac092444  ! 130: AND_I	and 	%r4, 0x0444, %r22
	.word 0xa811000f  ! 130: OR_R	or 	%r4, %r15, %r20
	.word 0xbc122936  ! 130: OR_I	or 	%r8, 0x0936, %r30
	.word 0xa401a9a2  ! 130: ADD_I	add 	%r6, 0x09a2, %r18
	.word 0xbc12000c  ! 130: OR_R	or 	%r8, %r12, %r30
	.word 0xb200c00c  ! 130: ADD_R	add 	%r3, %r12, %r25
	.word 0xa410e069  ! 130: OR_I	or 	%r3, 0x0069, %r18
	.word 0xa201400f  ! 130: ADD_R	add 	%r5, %r15, %r17
	.word 0xbe11400a  ! 130: OR_R	or 	%r5, %r10, %r31
	.word 0xa810ec79  ! 130: OR_I	or 	%r3, 0x0c79, %r20
	.word 0xba114009  ! 130: OR_R	or 	%r5, %r9, %r29
	.word 0xa609800d  ! 130: AND_R	and 	%r6, %r13, %r19
	.word 0xae10c00a  ! 130: OR_R	or 	%r3, %r10, %r23
	.word 0xb20221ef  ! 130: ADD_I	add 	%r8, 0x01ef, %r25
	.word 0xae09400a  ! 130: AND_R	and 	%r5, %r10, %r23
	.word 0xb410eca9  ! 130: OR_I	or 	%r3, 0x0ca9, %r26
	.word 0xba0125d5  ! 130: ADD_I	add 	%r4, 0x05d5, %r29
	.word 0xf029a15e  ! 130: STB_I	stb	%r24, [%r6 + 0x015e]
	.word 0xea30ef9c  ! 130: STH_I	sth	%r21, [%r3 + 0x0f9c]
	.word 0xf62221d4  ! 130: STW_I	stw	%r27, [%r8 + 0x01d4]
	.word 0xfa29e085  ! 130: STB_I	stb	%r29, [%r7 + 0x0085]
	.word 0xfe70eba8  ! 130: STX_I	stx	%r31, [%r3 + 0x0ba8]
	.word 0xfe31e530  ! 131: STH_I	sth	%r31, [%r7 + 0x0530]
	.word 0xae010045
	.word 0xf429e608  ! 133: STB_I	stb	%r26, [%r7 + 0x0608]
	.word 0xea71ead0  ! 134: STX_I	stx	%r21, [%r7 + 0x0ad0]
	.word 0xa651ecbf  ! 135: UMUL_I	umul 	%r7, 0x0cbf, %r19
	.word 0xb201400e  ! 135: ADD_R	add 	%r5, %r14, %r25
	.word 0xa6116701  ! 135: OR_I	or 	%r5, 0x0701, %r19
	.word 0xa20a25e8  ! 135: AND_I	and 	%r8, 0x05e8, %r17
	bne thr3_loop_10
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_11:
	.word 0xbe08ebce  ! 143: AND_I	and 	%r3, 0x0bce, %r31
	.word 0xa80a29b2  ! 143: AND_I	and 	%r8, 0x09b2, %r20
	.word 0xa200e873  ! 143: ADD_I	add 	%r3, 0x0873, %r17
	.word 0xba012704  ! 143: ADD_I	add 	%r4, 0x0704, %r29
	.word 0xa801400f  ! 143: ADD_R	add 	%r5, %r15, %r20
	.word 0xb401c00b  ! 143: ADD_R	add 	%r7, %r11, %r26
	.word 0xb01122a1  ! 143: OR_I	or 	%r4, 0x02a1, %r24
	.word 0xb801a674  ! 143: ADD_I	add 	%r6, 0x0674, %r28
	.word 0xa601800a  ! 143: ADD_R	add 	%r6, %r10, %r19
	.word 0xba01ac80  ! 143: ADD_I	add 	%r6, 0x0c80, %r29
	.word 0xb210e2cf  ! 143: OR_I	or 	%r3, 0x02cf, %r25
	.word 0xa201678b  ! 143: ADD_I	add 	%r5, 0x078b, %r17
	.word 0xba09228e  ! 143: AND_I	and 	%r4, 0x028e, %r29
	.word 0xaa08c009  ! 143: AND_R	and 	%r3, %r9, %r21
	.word 0xac02000e  ! 143: ADD_R	add 	%r8, %r14, %r22
	.word 0xac00c00c  ! 143: ADD_R	add 	%r3, %r12, %r22
	.word 0xa6016161  ! 143: ADD_I	add 	%r5, 0x0161, %r19
	.word 0xb80129f3  ! 143: ADD_I	add 	%r4, 0x09f3, %r28
	.word 0xa801a566  ! 143: ADD_I	add 	%r6, 0x0566, %r20
	.word 0xb411e509  ! 143: OR_I	or 	%r7, 0x0509, %r26
	.word 0xbe11ab70  ! 143: OR_I	or 	%r6, 0x0b70, %r31
	.word 0xac016065  ! 143: ADD_I	add 	%r5, 0x0065, %r22
	.word 0xa211aa77  ! 143: OR_I	or 	%r6, 0x0a77, %r17
	.word 0xaa01000d  ! 143: ADD_R	add 	%r4, %r13, %r21
	.word 0xba092908  ! 143: AND_I	and 	%r4, 0x0908, %r29
	.word 0xb011a7fd  ! 143: OR_I	or 	%r6, 0x07fd, %r24
	.word 0xb001e060  ! 143: ADD_I	add 	%r7, 0x0060, %r24
	.word 0xba00e376  ! 143: ADD_I	add 	%r3, 0x0376, %r29
	.word 0xbc01248a  ! 143: ADD_I	add 	%r4, 0x048a, %r30
	.word 0xae092925  ! 143: AND_I	and 	%r4, 0x0925, %r23
	.word 0xb608e9bd  ! 143: AND_I	and 	%r3, 0x09bd, %r27
	.word 0xa411a08e  ! 143: OR_I	or 	%r6, 0x008e, %r18
	.word 0xbc01619a  ! 143: ADD_I	add 	%r5, 0x019a, %r30
	.word 0xb611000a  ! 143: OR_R	or 	%r4, %r10, %r27
	.word 0xa801400c  ! 143: ADD_R	add 	%r5, %r12, %r20
	.word 0xb2022fd3  ! 143: ADD_I	add 	%r8, 0x0fd3, %r25
	.word 0xae08c00b  ! 143: AND_R	and 	%r3, %r11, %r23
	.word 0xba00ed75  ! 143: ADD_I	add 	%r3, 0x0d75, %r29
	.word 0xb401800c  ! 143: ADD_R	add 	%r6, %r12, %r26
	.word 0xbe01000b  ! 143: ADD_R	add 	%r4, %r11, %r31
	.word 0xaa096c6e  ! 143: AND_I	and 	%r5, 0x0c6e, %r21
	.word 0xa609400d  ! 143: AND_R	and 	%r5, %r13, %r19
	.word 0xa202000a  ! 143: ADD_R	add 	%r8, %r10, %r17
	.word 0xae09eb28  ! 143: AND_I	and 	%r7, 0x0b28, %r23
	.word 0xa2094009  ! 143: AND_R	and 	%r5, %r9, %r17
	.word 0xbe09800a  ! 143: AND_R	and 	%r6, %r10, %r31
	.word 0xae0963ff  ! 143: AND_I	and 	%r5, 0x03ff, %r23
	.word 0xac01400a  ! 143: ADD_R	add 	%r5, %r10, %r22
	.word 0xbe09e607  ! 143: AND_I	and 	%r7, 0x0607, %r31
	.word 0xac0a000e  ! 143: AND_R	and 	%r8, %r14, %r22
	.word 0xb011a8c0  ! 143: OR_I	or 	%r6, 0x08c0, %r24
	.word 0xaa018009  ! 143: ADD_R	add 	%r6, %r9, %r21
	.word 0xa4012bbb  ! 143: ADD_I	add 	%r4, 0x0bbb, %r18
	.word 0xa809c00d  ! 143: AND_R	and 	%r7, %r13, %r20
	.word 0xb201800c  ! 143: ADD_R	add 	%r6, %r12, %r25
	.word 0xa809400c  ! 143: AND_R	and 	%r5, %r12, %r20
	.word 0xac0a2f18  ! 143: AND_I	and 	%r8, 0x0f18, %r22
	.word 0xb611000f  ! 143: OR_R	or 	%r4, %r15, %r27
	.word 0xb211e952  ! 143: OR_I	or 	%r7, 0x0952, %r25
	.word 0xba01eb93  ! 143: ADD_I	add 	%r7, 0x0b93, %r29
	.word 0xa811800f  ! 143: OR_R	or 	%r6, %r15, %r20
	.word 0xb61160a9  ! 143: OR_I	or 	%r5, 0x00a9, %r27
	.word 0xbc09ec7a  ! 143: AND_I	and 	%r7, 0x0c7a, %r30
	.word 0xaa00ef14  ! 143: ADD_I	add 	%r3, 0x0f14, %r21
	.word 0xb001eedc  ! 143: ADD_I	add 	%r7, 0x0edc, %r24
	.word 0xb008c00d  ! 143: AND_R	and 	%r3, %r13, %r24
	.word 0xbe00effd  ! 143: ADD_I	add 	%r3, 0x0ffd, %r31
	.word 0xb2012f35  ! 143: ADD_I	add 	%r4, 0x0f35, %r25
	.word 0xb212000a  ! 143: OR_R	or 	%r8, %r10, %r25
	.word 0xa602000b  ! 143: ADD_R	add 	%r8, %r11, %r19
	.word 0xae11400d  ! 143: OR_R	or 	%r5, %r13, %r23
	.word 0xbc10c00e  ! 143: OR_R	or 	%r3, %r14, %r30
	.word 0xb408c00b  ! 143: AND_R	and 	%r3, %r11, %r26
	.word 0xa4096cc3  ! 143: AND_I	and 	%r5, 0x0cc3, %r18
	.word 0xa408ee49  ! 143: AND_I	and 	%r3, 0x0e49, %r18
	.word 0xbe022593  ! 143: ADD_I	add 	%r8, 0x0593, %r31
	.word 0xa601a741  ! 143: ADD_I	add 	%r6, 0x0741, %r19
	.word 0xb800e331  ! 143: ADD_I	add 	%r3, 0x0331, %r28
	.word 0xb411a0fa  ! 143: OR_I	or 	%r6, 0x00fa, %r26
	.word 0xae11c00d  ! 143: OR_R	or 	%r7, %r13, %r23
	.word 0xaa0a000e  ! 143: AND_R	and 	%r8, %r14, %r21
	.word 0xa202000c  ! 143: ADD_R	add 	%r8, %r12, %r17
	.word 0xbc01000b  ! 143: ADD_R	add 	%r4, %r11, %r30
	.word 0xaa02283a  ! 143: ADD_I	add 	%r8, 0x083a, %r21
	.word 0xaa01a8cf  ! 143: ADD_I	add 	%r6, 0x08cf, %r21
	.word 0xb408e9fb  ! 143: AND_I	and 	%r3, 0x09fb, %r26
	.word 0xa400edcd  ! 143: ADD_I	add 	%r3, 0x0dcd, %r18
	.word 0xe2296b1d  ! 143: STB_I	stb	%r17, [%r5 + 0x0b1d]
	.word 0xfc212d24  ! 143: STW_I	stw	%r30, [%r4 + 0x0d24]
	.word 0xf021a368  ! 143: STW_I	stw	%r24, [%r6 + 0x0368]
	.word 0xf030e656  ! 143: STH_I	sth	%r24, [%r3 + 0x0656]
	.word 0xf670e8a0  ! 143: STX_I	stx	%r27, [%r3 + 0x08a0]
	.word 0xe2322420  ! 143: STH_I	sth	%r17, [%r8 + 0x0420]
	.word 0xe220e4fc  ! 143: STW_I	stw	%r17, [%r3 + 0x04fc]
DC_ERR_11:
!$EV error(3,expr(@VA(.MAIN.DC_ERR_11), 16, 16),2,DC_DATA,5)
	.word 0xea01e16c  ! 146: LDUW_I	lduw	[%r7 + 0x016c], %r21
	.word 0xb831e942  ! 146: ORN_I	orn 	%r7, 0x0942, %r28
	.word 0xec71e050  ! 147: STX_I	stx	%r22, [%r7 + 0x0050]
	.word 0xea41671c  ! 148: LDSW_I	ldsw	[%r5 + 0x071c], %r21
	.word 0xaa01800f  ! 148: ADD_R	add 	%r6, %r15, %r21
	.word 0xb201af2f  ! 148: ADD_I	add 	%r6, 0x0f2f, %r25
	.word 0xa201c00d  ! 148: ADD_R	add 	%r7, %r13, %r17
	bne thr3_loop_11
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_12:
	.word 0xb611000f  ! 156: OR_R	or 	%r4, %r15, %r27
	.word 0xaa10e455  ! 156: OR_I	or 	%r3, 0x0455, %r21
	.word 0xbe116535  ! 156: OR_I	or 	%r5, 0x0535, %r31
	.word 0xb4016dd7  ! 156: ADD_I	add 	%r5, 0x0dd7, %r26
	.word 0xa211c00d  ! 156: OR_R	or 	%r7, %r13, %r17
	.word 0xbe01a56d  ! 156: ADD_I	add 	%r6, 0x056d, %r31
	.word 0xb00a000a  ! 156: AND_R	and 	%r8, %r10, %r24
	.word 0xbe11a3f6  ! 156: OR_I	or 	%r6, 0x03f6, %r31
	.word 0xb208c00d  ! 156: AND_R	and 	%r3, %r13, %r25
	.word 0xa609e839  ! 156: AND_I	and 	%r7, 0x0839, %r19
	.word 0xbc01400a  ! 156: ADD_R	add 	%r5, %r10, %r30
	.word 0xaa09c00f  ! 156: AND_R	and 	%r7, %r15, %r21
	.word 0xb811e460  ! 156: OR_I	or 	%r7, 0x0460, %r28
	.word 0xb001a4a7  ! 156: ADD_I	add 	%r6, 0x04a7, %r24
	.word 0xb61227c2  ! 156: OR_I	or 	%r8, 0x07c2, %r27
	.word 0xa811c00d  ! 156: OR_R	or 	%r7, %r13, %r20
	.word 0xb20126a5  ! 156: ADD_I	add 	%r4, 0x06a5, %r25
	.word 0xb209800f  ! 156: AND_R	and 	%r6, %r15, %r25
	.word 0xb800ebd5  ! 156: ADD_I	add 	%r3, 0x0bd5, %r28
	.word 0xb41122c3  ! 156: OR_I	or 	%r4, 0x02c3, %r26
	.word 0xba09400b  ! 156: AND_R	and 	%r5, %r11, %r29
	.word 0xb201800d  ! 156: ADD_R	add 	%r6, %r13, %r25
	.word 0xb60a000d  ! 156: AND_R	and 	%r8, %r13, %r27
	.word 0xae00e3a5  ! 156: ADD_I	add 	%r3, 0x03a5, %r23
	.word 0xba09aec5  ! 156: AND_I	and 	%r6, 0x0ec5, %r29
	.word 0xa201400d  ! 156: ADD_R	add 	%r5, %r13, %r17
	.word 0xba0a2b59  ! 156: AND_I	and 	%r8, 0x0b59, %r29
	.word 0xae0223a2  ! 156: ADD_I	add 	%r8, 0x03a2, %r23
	.word 0xb20924a7  ! 156: AND_I	and 	%r4, 0x04a7, %r25
	.word 0xa600c00c  ! 156: ADD_R	add 	%r3, %r12, %r19
	.word 0xac09af64  ! 156: AND_I	and 	%r6, 0x0f64, %r22
	.word 0xa8022556  ! 156: ADD_I	add 	%r8, 0x0556, %r20
	.word 0xbc08c009  ! 156: AND_R	and 	%r3, %r9, %r30
	.word 0xbe092ac2  ! 156: AND_I	and 	%r4, 0x0ac2, %r31
	.word 0xb001000d  ! 156: ADD_R	add 	%r4, %r13, %r24
	.word 0xa40a2564  ! 156: AND_I	and 	%r8, 0x0564, %r18
	.word 0xbc11400e  ! 156: OR_R	or 	%r5, %r14, %r30
	.word 0xbc12000b  ! 156: OR_R	or 	%r8, %r11, %r30
	.word 0xb808c00e  ! 156: AND_R	and 	%r3, %r14, %r28
	.word 0xae09000b  ! 156: AND_R	and 	%r4, %r11, %r23
	.word 0xb8110009  ! 156: OR_R	or 	%r4, %r9, %r28
	.word 0xa600c00e  ! 156: ADD_R	add 	%r3, %r14, %r19
	.word 0xac01a93f  ! 156: ADD_I	add 	%r6, 0x093f, %r22
	.word 0xb209800c  ! 156: AND_R	and 	%r6, %r12, %r25
	.word 0xa809000f  ! 156: AND_R	and 	%r4, %r15, %r20
	.word 0xb208e9e3  ! 156: AND_I	and 	%r3, 0x09e3, %r25
	.word 0xba10e7ff  ! 156: OR_I	or 	%r3, 0x07ff, %r29
	.word 0xa409800a  ! 156: AND_R	and 	%r6, %r10, %r18
	.word 0xa609000c  ! 156: AND_R	and 	%r4, %r12, %r19
	.word 0xa411c00f  ! 156: OR_R	or 	%r7, %r15, %r18
	.word 0xb6096c1c  ! 156: AND_I	and 	%r5, 0x0c1c, %r27
	.word 0xa601e18a  ! 156: ADD_I	add 	%r7, 0x018a, %r19
	.word 0xbc120009  ! 156: OR_R	or 	%r8, %r9, %r30
	.word 0xb609e26a  ! 156: AND_I	and 	%r7, 0x026a, %r27
	.word 0xb001800a  ! 156: ADD_R	add 	%r6, %r10, %r24
	.word 0xa60a208b  ! 156: AND_I	and 	%r8, 0x008b, %r19
	.word 0xaa11c00c  ! 156: OR_R	or 	%r7, %r12, %r21
	.word 0xa811800a  ! 156: OR_R	or 	%r6, %r10, %r20
	.word 0xb801ef40  ! 156: ADD_I	add 	%r7, 0x0f40, %r28
	.word 0xa2014009  ! 156: ADD_R	add 	%r5, %r9, %r17
	.word 0xa411acda  ! 156: OR_I	or 	%r6, 0x0cda, %r18
	.word 0xae0a23a2  ! 156: AND_I	and 	%r8, 0x03a2, %r23
	.word 0xa401a71a  ! 156: ADD_I	add 	%r6, 0x071a, %r18
	.word 0xb011219d  ! 156: OR_I	or 	%r4, 0x019d, %r24
	.word 0xae11a1a2  ! 156: OR_I	or 	%r6, 0x01a2, %r23
	.word 0xb011e148  ! 156: OR_I	or 	%r7, 0x0148, %r24
	.word 0xba1120ce  ! 156: OR_I	or 	%r4, 0x00ce, %r29
	.word 0xb210eed2  ! 156: OR_I	or 	%r3, 0x0ed2, %r25
	.word 0xae12000c  ! 156: OR_R	or 	%r8, %r12, %r23
	.word 0xa211000d  ! 156: OR_R	or 	%r4, %r13, %r17
	.word 0xa20a000a  ! 156: AND_R	and 	%r8, %r10, %r17
	.word 0xac012fbe  ! 156: ADD_I	add 	%r4, 0x0fbe, %r22
	.word 0xb809800d  ! 156: AND_R	and 	%r6, %r13, %r28
	.word 0xa6016586  ! 156: ADD_I	add 	%r5, 0x0586, %r19
	.word 0xb000e2e6  ! 156: ADD_I	add 	%r3, 0x02e6, %r24
	.word 0xa608c009  ! 156: AND_R	and 	%r3, %r9, %r19
	.word 0xac01000a  ! 156: ADD_R	add 	%r4, %r10, %r22
	.word 0xa80922ff  ! 156: AND_I	and 	%r4, 0x02ff, %r20
	.word 0xa8122af5  ! 156: OR_I	or 	%r8, 0x0af5, %r20
	.word 0xbc08c00d  ! 156: AND_R	and 	%r3, %r13, %r30
	.word 0xa2016273  ! 156: ADD_I	add 	%r5, 0x0273, %r17
	.word 0xb00964be  ! 156: AND_I	and 	%r5, 0x04be, %r24
	.word 0xa811c009  ! 156: OR_R	or 	%r7, %r9, %r20
	.word 0xb808e610  ! 156: AND_I	and 	%r3, 0x0610, %r28
	.word 0xb409400d  ! 156: AND_R	and 	%r5, %r13, %r26
	.word 0xb811c00d  ! 156: OR_R	or 	%r7, %r13, %r28
	.word 0xa611400d  ! 156: OR_R	or 	%r5, %r13, %r19
	.word 0xac09800e  ! 156: AND_R	and 	%r6, %r14, %r22
	.word 0xb001261e  ! 156: ADD_I	add 	%r4, 0x061e, %r24
	.word 0xb60a000f  ! 156: AND_R	and 	%r8, %r15, %r27
	.word 0xb001a1ce  ! 156: ADD_I	add 	%r6, 0x01ce, %r24
	.word 0xaa01400b  ! 156: ADD_R	add 	%r5, %r11, %r21
	.word 0xb211c00e  ! 156: OR_R	or 	%r7, %r14, %r25
	.word 0xb4012a64  ! 156: ADD_I	add 	%r4, 0x0a64, %r26
	.word 0xb209e081  ! 156: AND_I	and 	%r7, 0x0081, %r25
	.word 0xb601000b  ! 156: ADD_R	add 	%r4, %r11, %r27
	.word 0xac022208  ! 156: ADD_I	add 	%r8, 0x0208, %r22
	.word 0xb211e9f3  ! 156: OR_I	or 	%r7, 0x09f3, %r25
	.word 0xb809af04  ! 156: AND_I	and 	%r6, 0x0f04, %r28
	.word 0xac0968b4  ! 156: AND_I	and 	%r5, 0x08b4, %r22
	.word 0xbc12000e  ! 156: OR_R	or 	%r8, %r14, %r30
	.word 0xa600c00c  ! 156: ADD_R	add 	%r3, %r12, %r19
	.word 0xb208e95a  ! 156: AND_I	and 	%r3, 0x095a, %r25
	.word 0xae112ece  ! 156: OR_I	or 	%r4, 0x0ece, %r23
	.word 0xb208c00a  ! 156: AND_R	and 	%r3, %r10, %r25
	.word 0xae096930  ! 156: AND_I	and 	%r5, 0x0930, %r23
	.word 0xb6116b55  ! 156: OR_I	or 	%r5, 0x0b55, %r27
	.word 0xb2020009  ! 156: ADD_R	add 	%r8, %r9, %r25
	.word 0xbc09e9e6  ! 156: AND_I	and 	%r7, 0x09e6, %r30
	.word 0xaa09a80c  ! 156: AND_I	and 	%r6, 0x080c, %r21
	.word 0xa801c009  ! 156: ADD_R	add 	%r7, %r9, %r20
	.word 0xba01af11  ! 156: ADD_I	add 	%r6, 0x0f11, %r29
	.word 0xbc09000f  ! 156: AND_R	and 	%r4, %r15, %r30
	.word 0xb409000a  ! 156: AND_R	and 	%r4, %r10, %r26
	.word 0xbe11400f  ! 156: OR_R	or 	%r5, %r15, %r31
	.word 0xb001ed0d  ! 156: ADD_I	add 	%r7, 0x0d0d, %r24
	.word 0xa40a000d  ! 156: AND_R	and 	%r8, %r13, %r18
	.word 0xac122d94  ! 156: OR_I	or 	%r8, 0x0d94, %r22
	.word 0xba08c00c  ! 156: AND_R	and 	%r3, %r12, %r29
	.word 0xb4016cbc  ! 156: ADD_I	add 	%r5, 0x0cbc, %r26
	.word 0xae11a5a5  ! 156: OR_I	or 	%r6, 0x05a5, %r23
	.word 0xbe01c00e  ! 156: ADD_R	add 	%r7, %r14, %r31
	.word 0xb2098009  ! 156: AND_R	and 	%r6, %r9, %r25
	.word 0xb010e878  ! 156: OR_I	or 	%r3, 0x0878, %r24
	.word 0xb410c00e  ! 156: OR_R	or 	%r3, %r14, %r26
	.word 0xbc11a380  ! 156: OR_I	or 	%r6, 0x0380, %r30
	.word 0xb601a0be  ! 156: ADD_I	add 	%r6, 0x00be, %r27
	.word 0xa401000b  ! 156: ADD_R	add 	%r4, %r11, %r18
	.word 0xa609c00f  ! 156: AND_R	and 	%r7, %r15, %r19
	.word 0xa201400d  ! 156: ADD_R	add 	%r5, %r13, %r17
	.word 0xb01162e8  ! 156: OR_I	or 	%r5, 0x02e8, %r24
	.word 0xba01c00f  ! 156: ADD_R	add 	%r7, %r15, %r29
	.word 0xb211a93f  ! 156: OR_I	or 	%r6, 0x093f, %r25
	.word 0xa400c009  ! 156: ADD_R	add 	%r3, %r9, %r18
	.word 0xa200c00a  ! 156: ADD_R	add 	%r3, %r10, %r17
	.word 0xaa12000d  ! 156: OR_R	or 	%r8, %r13, %r21
	.word 0xb0098009  ! 156: AND_R	and 	%r6, %r9, %r24
	.word 0xb009a5cc  ! 156: AND_I	and 	%r6, 0x05cc, %r24
	.word 0xba01000c  ! 156: ADD_R	add 	%r4, %r12, %r29
	.word 0xa410e85e  ! 156: OR_I	or 	%r3, 0x085e, %r18
	.word 0xae11000f  ! 156: OR_R	or 	%r4, %r15, %r23
	.word 0xa812000b  ! 156: OR_R	or 	%r8, %r11, %r20
	.word 0xb610e662  ! 156: OR_I	or 	%r3, 0x0662, %r27
	.word 0xa201c00b  ! 156: ADD_R	add 	%r7, %r11, %r17
	.word 0xbc11e286  ! 156: OR_I	or 	%r7, 0x0286, %r30
	.word 0xb612000c  ! 156: OR_R	or 	%r8, %r12, %r27
	.word 0xbe12259c  ! 156: OR_I	or 	%r8, 0x059c, %r31
	.word 0xae1225e6  ! 156: OR_I	or 	%r8, 0x05e6, %r23
	.word 0xb80a000b  ! 156: AND_R	and 	%r8, %r11, %r28
	.word 0xb012000e  ! 156: OR_R	or 	%r8, %r14, %r24
	.word 0xae01ed62  ! 156: ADD_I	add 	%r7, 0x0d62, %r23
	.word 0xaa11800a  ! 156: OR_R	or 	%r6, %r10, %r21
	.word 0xac02000b  ! 156: ADD_R	add 	%r8, %r11, %r22
	.word 0xb409c009  ! 156: AND_R	and 	%r7, %r9, %r26
	.word 0xa601400d  ! 156: ADD_R	add 	%r5, %r13, %r19
	.word 0xa801800e  ! 156: ADD_R	add 	%r6, %r14, %r20
	.word 0xbc0a2e3e  ! 156: AND_I	and 	%r8, 0x0e3e, %r30
	.word 0xb0112cb0  ! 156: OR_I	or 	%r4, 0x0cb0, %r24
	.word 0xa611400a  ! 156: OR_R	or 	%r5, %r10, %r19
	.word 0xa410e19f  ! 156: OR_I	or 	%r3, 0x019f, %r18
	.word 0xbe09a301  ! 156: AND_I	and 	%r6, 0x0301, %r31
	.word 0xac08e36a  ! 156: AND_I	and 	%r3, 0x036a, %r22
	.word 0xb601400f  ! 156: ADD_R	add 	%r5, %r15, %r27
	.word 0xb809c00b  ! 156: AND_R	and 	%r7, %r11, %r28
	.word 0xa40227c9  ! 156: ADD_I	add 	%r8, 0x07c9, %r18
	.word 0xa409c00c  ! 156: AND_R	and 	%r7, %r12, %r18
	.word 0xb60163fe  ! 156: ADD_I	add 	%r5, 0x03fe, %r27
	.word 0xbc096f2f  ! 156: AND_I	and 	%r5, 0x0f2f, %r30
	.word 0xba09800f  ! 156: AND_R	and 	%r6, %r15, %r29
	.word 0xaa018009  ! 156: ADD_R	add 	%r6, %r9, %r21
	.word 0xa6112028  ! 156: OR_I	or 	%r4, 0x0028, %r19
	.word 0xb209800c  ! 156: AND_R	and 	%r6, %r12, %r25
	.word 0xb411000e  ! 156: OR_R	or 	%r4, %r14, %r26
	.word 0xba11800b  ! 156: OR_R	or 	%r6, %r11, %r29
	.word 0xbc0a000e  ! 156: AND_R	and 	%r8, %r14, %r30
	.word 0xaa01c00b  ! 156: ADD_R	add 	%r7, %r11, %r21
	.word 0xa209e1d0  ! 156: AND_I	and 	%r7, 0x01d0, %r17
	.word 0xb601400e  ! 156: ADD_R	add 	%r5, %r14, %r27
	.word 0xb408e760  ! 156: AND_I	and 	%r3, 0x0760, %r26
	.word 0xa808c009  ! 156: AND_R	and 	%r3, %r9, %r20
	.word 0xbc01e4dd  ! 156: ADD_I	add 	%r7, 0x04dd, %r30
	.word 0xa610c00e  ! 156: OR_R	or 	%r3, %r14, %r19
	.word 0xb801286a  ! 156: ADD_I	add 	%r4, 0x086a, %r28
	.word 0xb401c00d  ! 156: ADD_R	add 	%r7, %r13, %r26
	.word 0xac01273b  ! 156: ADD_I	add 	%r4, 0x073b, %r22
	.word 0xb808c00f  ! 156: AND_R	and 	%r3, %r15, %r28
	.word 0xa411000b  ! 156: OR_R	or 	%r4, %r11, %r18
	.word 0xa401000f  ! 156: ADD_R	add 	%r4, %r15, %r18
	.word 0xb809efcb  ! 156: AND_I	and 	%r7, 0x0fcb, %r28
	.word 0xb801000c  ! 156: ADD_R	add 	%r4, %r12, %r28
	.word 0xb000e834  ! 156: ADD_I	add 	%r3, 0x0834, %r24
	.word 0xa40121b3  ! 156: ADD_I	add 	%r4, 0x01b3, %r18
	.word 0xac122da2  ! 156: OR_I	or 	%r8, 0x0da2, %r22
	.word 0xb0012281  ! 156: ADD_I	add 	%r4, 0x0281, %r24
	.word 0xae08c00e  ! 156: AND_R	and 	%r3, %r14, %r23
	.word 0xac01400b  ! 156: ADD_R	add 	%r5, %r11, %r22
	.word 0xb4012bb0  ! 156: ADD_I	add 	%r4, 0x0bb0, %r26
	.word 0xac0a277c  ! 156: AND_I	and 	%r8, 0x077c, %r22
	.word 0xb8096334  ! 156: AND_I	and 	%r5, 0x0334, %r28
	.word 0xa4110009  ! 156: OR_R	or 	%r4, %r9, %r18
	.word 0xb601a49e  ! 156: ADD_I	add 	%r6, 0x049e, %r27
	.word 0xae10e583  ! 156: OR_I	or 	%r3, 0x0583, %r23
	.word 0xb200e712  ! 156: ADD_I	add 	%r3, 0x0712, %r25
	.word 0xae122068  ! 156: OR_I	or 	%r8, 0x0068, %r23
	.word 0xb400c00a  ! 156: ADD_R	add 	%r3, %r10, %r26
	.word 0xba11400b  ! 156: OR_R	or 	%r5, %r11, %r29
	.word 0xb001a49f  ! 156: ADD_I	add 	%r6, 0x049f, %r24
	.word 0xb212272a  ! 156: OR_I	or 	%r8, 0x072a, %r25
	.word 0xbe01000d  ! 156: ADD_R	add 	%r4, %r13, %r31
	.word 0xb008c00e  ! 156: AND_R	and 	%r3, %r14, %r24
	.word 0xb609000c  ! 156: AND_R	and 	%r4, %r12, %r27
	.word 0xbc00e38c  ! 156: ADD_I	add 	%r3, 0x038c, %r30
	.word 0xac112307  ! 156: OR_I	or 	%r4, 0x0307, %r22
	.word 0xb2116bf5  ! 156: OR_I	or 	%r5, 0x0bf5, %r25
	.word 0xb809c00f  ! 156: AND_R	and 	%r7, %r15, %r28
	.word 0xb008eec5  ! 156: AND_I	and 	%r3, 0x0ec5, %r24
	.word 0xa800e990  ! 156: ADD_I	add 	%r3, 0x0990, %r20
	.word 0xae01800d  ! 156: ADD_R	add 	%r6, %r13, %r23
	.word 0xb001a47c  ! 156: ADD_I	add 	%r6, 0x047c, %r24
	.word 0xb409223e  ! 156: AND_I	and 	%r4, 0x023e, %r26
	.word 0xae10e62e  ! 156: OR_I	or 	%r3, 0x062e, %r23
	.word 0xa211e417  ! 156: OR_I	or 	%r7, 0x0417, %r17
	.word 0xb00a2512  ! 156: AND_I	and 	%r8, 0x0512, %r24
	.word 0xf820ea20  ! 156: STW_I	stw	%r28, [%r3 + 0x0a20]
	.word 0xfe216674  ! 156: STW_I	stw	%r31, [%r5 + 0x0674]
	.word 0xee216ea8  ! 156: STW_I	stw	%r23, [%r5 + 0x0ea8]
	.word 0xf071e470  ! 156: STX_I	stx	%r24, [%r7 + 0x0470]
	.word 0xfc716270  ! 156: STX_I	stx	%r30, [%r5 + 0x0270]
	.word 0xe4222c90  ! 156: STW_I	stw	%r18, [%r8 + 0x0c90]
	.word 0xe27228f0  ! 156: STX_I	stx	%r17, [%r8 + 0x08f0]
	.word 0xf401800c  ! 157: LDUW_R	lduw	[%r6 + %r12], %r26
	.word 0xe828e127  ! 158: STB_I	stb	%r20, [%r3 + 0x0127]
	.word 0xec11a72e  ! 159: LDUH_I	lduh	[%r6 + 0x072e], %r22
	.word 0xba01c00d  ! 159: ADD_R	add 	%r7, %r13, %r29
	.word 0xba112efc  ! 159: OR_I	or 	%r4, 0x0efc, %r29
	.word 0xac11a472  ! 159: OR_I	or 	%r6, 0x0472, %r22
	bne thr3_loop_12
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_13:
	.word 0xa601c00d  ! 165: ADD_R	add 	%r7, %r13, %r19
	.word 0xa608c009  ! 165: AND_R	and 	%r3, %r9, %r19
	.word 0xb601a3d5  ! 165: ADD_I	add 	%r6, 0x03d5, %r27
	.word 0xbe09800d  ! 165: AND_R	and 	%r6, %r13, %r31
	.word 0xba0165db  ! 165: ADD_I	add 	%r5, 0x05db, %r29
	.word 0xa208e593  ! 165: AND_I	and 	%r3, 0x0593, %r17
	.word 0xa2094009  ! 165: AND_R	and 	%r5, %r9, %r17
	.word 0xb208c00f  ! 165: AND_R	and 	%r3, %r15, %r25
	.word 0xba112ca4  ! 165: OR_I	or 	%r4, 0x0ca4, %r29
	.word 0xaa09800f  ! 165: AND_R	and 	%r6, %r15, %r21
	.word 0xb000c00f  ! 165: ADD_R	add 	%r3, %r15, %r24
	.word 0xb609edbe  ! 165: AND_I	and 	%r7, 0x0dbe, %r27
	.word 0xaa09400a  ! 165: AND_R	and 	%r5, %r10, %r21
	.word 0xbe08c00c  ! 165: AND_R	and 	%r3, %r12, %r31
	.word 0xa209800d  ! 165: AND_R	and 	%r6, %r13, %r17
	.word 0xbc08edd5  ! 165: AND_I	and 	%r3, 0x0dd5, %r30
	.word 0xb4092b5e  ! 165: AND_I	and 	%r4, 0x0b5e, %r26
	.word 0xb801e5b1  ! 165: ADD_I	add 	%r7, 0x05b1, %r28
	.word 0xbc122fa4  ! 165: OR_I	or 	%r8, 0x0fa4, %r30
	.word 0xb011efc4  ! 165: OR_I	or 	%r7, 0x0fc4, %r24
	.word 0xa81160dc  ! 165: OR_I	or 	%r5, 0x00dc, %r20
	.word 0xa601400e  ! 165: ADD_R	add 	%r5, %r14, %r19
	.word 0xb400c00e  ! 165: ADD_R	add 	%r3, %r14, %r26
	.word 0xac10e5b6  ! 165: OR_I	or 	%r3, 0x05b6, %r22
	.word 0xac016e9e  ! 165: ADD_I	add 	%r5, 0x0e9e, %r22
	.word 0xbc096ace  ! 165: AND_I	and 	%r5, 0x0ace, %r30
	.word 0xbe0a000e  ! 165: AND_R	and 	%r8, %r14, %r31
	.word 0xa611c00d  ! 165: OR_R	or 	%r7, %r13, %r19
	.word 0xbe11400e  ! 165: OR_R	or 	%r5, %r14, %r31
	.word 0xba10e3ed  ! 165: OR_I	or 	%r3, 0x03ed, %r29
	.word 0xb210eb91  ! 165: OR_I	or 	%r3, 0x0b91, %r25
	.word 0xba11800f  ! 165: OR_R	or 	%r6, %r15, %r29
	.word 0xb2090009  ! 165: AND_R	and 	%r4, %r9, %r25
	.word 0xa201400e  ! 165: ADD_R	add 	%r5, %r14, %r17
	.word 0xa210e2b2  ! 165: OR_I	or 	%r3, 0x02b2, %r17
	.word 0xbe09c00b  ! 165: AND_R	and 	%r7, %r11, %r31
	.word 0xa808c009  ! 165: AND_R	and 	%r3, %r9, %r20
	.word 0xb812000d  ! 165: OR_R	or 	%r8, %r13, %r28
	.word 0xbc09a4c1  ! 165: AND_I	and 	%r6, 0x04c1, %r30
	.word 0xae0123ab  ! 165: ADD_I	add 	%r4, 0x03ab, %r23
	.word 0xbe09a1d0  ! 165: AND_I	and 	%r6, 0x01d0, %r31
	.word 0xa20a25d3  ! 165: AND_I	and 	%r8, 0x05d3, %r17
	.word 0xa8012d0b  ! 165: ADD_I	add 	%r4, 0x0d0b, %r20
	.word 0xb200e83d  ! 165: ADD_I	add 	%r3, 0x083d, %r25
	.word 0xb210c00d  ! 165: OR_R	or 	%r3, %r13, %r25
	.word 0xbe12000a  ! 165: OR_R	or 	%r8, %r10, %r31
	.word 0xac11c00e  ! 165: OR_R	or 	%r7, %r14, %r22
	.word 0xa8092c8c  ! 165: AND_I	and 	%r4, 0x0c8c, %r20
	.word 0xaa0a000d  ! 165: AND_R	and 	%r8, %r13, %r21
	.word 0xa411e104  ! 165: OR_I	or 	%r7, 0x0104, %r18
	.word 0xbc09400e  ! 165: AND_R	and 	%r5, %r14, %r30
	.word 0xae00e273  ! 165: ADD_I	add 	%r3, 0x0273, %r23
	.word 0xae02000c  ! 165: ADD_R	add 	%r8, %r12, %r23
	.word 0xa401ef03  ! 165: ADD_I	add 	%r7, 0x0f03, %r18
	.word 0xba0a000e  ! 165: AND_R	and 	%r8, %r14, %r29
	.word 0xb009e47f  ! 165: AND_I	and 	%r7, 0x047f, %r24
	.word 0xba09000d  ! 165: AND_R	and 	%r4, %r13, %r29
	.word 0xb211400f  ! 165: OR_R	or 	%r5, %r15, %r25
	.word 0xba11400c  ! 165: OR_R	or 	%r5, %r12, %r29
	.word 0xaa094009  ! 165: AND_R	and 	%r5, %r9, %r21
	.word 0xae11a061  ! 165: OR_I	or 	%r6, 0x0061, %r23
	.word 0xbe00c00f  ! 165: ADD_R	add 	%r3, %r15, %r31
	.word 0xb4098009  ! 165: AND_R	and 	%r6, %r9, %r26
	.word 0xbe11400c  ! 165: OR_R	or 	%r5, %r12, %r31
	.word 0xbe01000a  ! 165: ADD_R	add 	%r4, %r10, %r31
	.word 0xa2022672  ! 165: ADD_I	add 	%r8, 0x0672, %r17
	.word 0xb409a7c0  ! 165: AND_I	and 	%r6, 0x07c0, %r26
	.word 0xa600e74e  ! 165: ADD_I	add 	%r3, 0x074e, %r19
	.word 0xb809400f  ! 165: AND_R	and 	%r5, %r15, %r28
	.word 0xb411800c  ! 165: OR_R	or 	%r6, %r12, %r26
	.word 0xbc11a478  ! 165: OR_I	or 	%r6, 0x0478, %r30
	.word 0xb209ee8e  ! 165: AND_I	and 	%r7, 0x0e8e, %r25
	.word 0xb00a2ffd  ! 165: AND_I	and 	%r8, 0x0ffd, %r24
	.word 0xb201000d  ! 165: ADD_R	add 	%r4, %r13, %r25
	.word 0xaa016473  ! 165: ADD_I	add 	%r5, 0x0473, %r21
	.word 0xa402000e  ! 165: ADD_R	add 	%r8, %r14, %r18
	.word 0xac092095  ! 165: AND_I	and 	%r4, 0x0095, %r22
	.word 0xbc022d62  ! 165: ADD_I	add 	%r8, 0x0d62, %r30
	.word 0xbe0a2fb9  ! 165: AND_I	and 	%r8, 0x0fb9, %r31
	.word 0xa211000e  ! 165: OR_R	or 	%r4, %r14, %r17
	.word 0xb6112fee  ! 165: OR_I	or 	%r4, 0x0fee, %r27
	.word 0xae01e731  ! 165: ADD_I	add 	%r7, 0x0731, %r23
	.word 0xa609a9de  ! 165: AND_I	and 	%r6, 0x09de, %r19
	.word 0xa6012fa8  ! 165: ADD_I	add 	%r4, 0x0fa8, %r19
	.word 0xaa09a84d  ! 165: AND_I	and 	%r6, 0x084d, %r21
	.word 0xb401e1e8  ! 165: ADD_I	add 	%r7, 0x01e8, %r26
	.word 0xbc01800d  ! 165: ADD_R	add 	%r6, %r13, %r30
	.word 0xbc01e193  ! 165: ADD_I	add 	%r7, 0x0193, %r30
	.word 0xba01000b  ! 165: ADD_R	add 	%r4, %r11, %r29
	.word 0xbc0a269c  ! 165: AND_I	and 	%r8, 0x069c, %r30
	.word 0xaa09efb5  ! 165: AND_I	and 	%r7, 0x0fb5, %r21
	.word 0xa411620d  ! 165: OR_I	or 	%r5, 0x020d, %r18
	.word 0xa409c009  ! 165: AND_R	and 	%r7, %r9, %r18
	.word 0xbe0a000f  ! 165: AND_R	and 	%r8, %r15, %r31
	.word 0xb410c00b  ! 165: OR_R	or 	%r3, %r11, %r26
	.word 0xae11c00d  ! 165: OR_R	or 	%r7, %r13, %r23
	.word 0xb600c00d  ! 165: ADD_R	add 	%r3, %r13, %r27
	.word 0xae11800b  ! 165: OR_R	or 	%r6, %r11, %r23
	.word 0xa8112a24  ! 165: OR_I	or 	%r4, 0x0a24, %r20
	.word 0xba116b65  ! 165: OR_I	or 	%r5, 0x0b65, %r29
	.word 0xb208c00d  ! 165: AND_R	and 	%r3, %r13, %r25
	.word 0xaa09800e  ! 165: AND_R	and 	%r6, %r14, %r21
	.word 0xa408e850  ! 165: AND_I	and 	%r3, 0x0850, %r18
	.word 0xb812000f  ! 165: OR_R	or 	%r8, %r15, %r28
	.word 0xaa112749  ! 165: OR_I	or 	%r4, 0x0749, %r21
	.word 0xa600e532  ! 165: ADD_I	add 	%r3, 0x0532, %r19
	.word 0xa4094009  ! 165: AND_R	and 	%r5, %r9, %r18
	.word 0xbc01400d  ! 165: ADD_R	add 	%r5, %r13, %r30
	.word 0xac00c009  ! 165: ADD_R	add 	%r3, %r9, %r22
	.word 0xae01e8b6  ! 165: ADD_I	add 	%r7, 0x08b6, %r23
	.word 0xb010c009  ! 165: OR_R	or 	%r3, %r9, %r24
	.word 0xa810edf5  ! 165: OR_I	or 	%r3, 0x0df5, %r20
	.word 0xba11800e  ! 165: OR_R	or 	%r6, %r14, %r29
	.word 0xb409400d  ! 165: AND_R	and 	%r5, %r13, %r26
	.word 0xa2022fc1  ! 165: ADD_I	add 	%r8, 0x0fc1, %r17
	.word 0xae12000c  ! 165: OR_R	or 	%r8, %r12, %r23
	.word 0xba0a000f  ! 165: AND_R	and 	%r8, %r15, %r29
	.word 0xb811400d  ! 165: OR_R	or 	%r5, %r13, %r28
	.word 0xae09e31e  ! 165: AND_I	and 	%r7, 0x031e, %r23
	.word 0xae01c009  ! 165: ADD_R	add 	%r7, %r9, %r23
	.word 0xb60a2b81  ! 165: AND_I	and 	%r8, 0x0b81, %r27
	.word 0xae09800d  ! 165: AND_R	and 	%r6, %r13, %r23
	.word 0xaa0228d3  ! 165: ADD_I	add 	%r8, 0x08d3, %r21
	.word 0xb610efa1  ! 165: OR_I	or 	%r3, 0x0fa1, %r27
	.word 0xbc01800e  ! 165: ADD_R	add 	%r6, %r14, %r30
	.word 0xaa11c00f  ! 165: OR_R	or 	%r7, %r15, %r21
	.word 0xbe11800d  ! 165: OR_R	or 	%r6, %r13, %r31
	.word 0xac01a752  ! 165: ADD_I	add 	%r6, 0x0752, %r22
	.word 0xa401aeed  ! 165: ADD_I	add 	%r6, 0x0eed, %r18
	.word 0xa602000f  ! 165: ADD_R	add 	%r8, %r15, %r19
	.word 0xba092d59  ! 165: AND_I	and 	%r4, 0x0d59, %r29
	.word 0xa808c00b  ! 165: AND_R	and 	%r3, %r11, %r20
	.word 0xbc0a2e61  ! 165: AND_I	and 	%r8, 0x0e61, %r30
	.word 0xb809800f  ! 165: AND_R	and 	%r6, %r15, %r28
	.word 0xa6116e84  ! 165: OR_I	or 	%r5, 0x0e84, %r19
	.word 0xba09eb78  ! 165: AND_I	and 	%r7, 0x0b78, %r29
	.word 0xae0a0009  ! 165: AND_R	and 	%r8, %r9, %r23
	.word 0xb208c009  ! 165: AND_R	and 	%r3, %r9, %r25
	.word 0xa209645d  ! 165: AND_I	and 	%r5, 0x045d, %r17
	.word 0xa209ac3b  ! 165: AND_I	and 	%r6, 0x0c3b, %r17
	.word 0xaa09400d  ! 165: AND_R	and 	%r5, %r13, %r21
	.word 0xa209c009  ! 165: AND_R	and 	%r7, %r9, %r17
	.word 0xb609c00e  ! 165: AND_R	and 	%r7, %r14, %r27
	.word 0xac11400f  ! 165: OR_R	or 	%r5, %r15, %r22
	.word 0xa412000a  ! 165: OR_R	or 	%r8, %r10, %r18
	.word 0xbe12000a  ! 165: OR_R	or 	%r8, %r10, %r31
	.word 0xba00ea4e  ! 165: ADD_I	add 	%r3, 0x0a4e, %r29
	.word 0xbe00c00d  ! 165: ADD_R	add 	%r3, %r13, %r31
	.word 0xae112561  ! 165: OR_I	or 	%r4, 0x0561, %r23
	.word 0xba0164b4  ! 165: ADD_I	add 	%r5, 0x04b4, %r29
	.word 0xb401400d  ! 165: ADD_R	add 	%r5, %r13, %r26
	.word 0xb611c009  ! 165: OR_R	or 	%r7, %r9, %r27
	.word 0xb209eb89  ! 165: AND_I	and 	%r7, 0x0b89, %r25
	.word 0xb0116295  ! 165: OR_I	or 	%r5, 0x0295, %r24
	.word 0xb401266f  ! 165: ADD_I	add 	%r4, 0x066f, %r26
	.word 0xba10eb96  ! 165: OR_I	or 	%r3, 0x0b96, %r29
	.word 0xaa09a87e  ! 165: AND_I	and 	%r6, 0x087e, %r21
	.word 0xaa098009  ! 165: AND_R	and 	%r6, %r9, %r21
	.word 0xbe01617c  ! 165: ADD_I	add 	%r5, 0x017c, %r31
	.word 0xac01c009  ! 165: ADD_R	add 	%r7, %r9, %r22
	.word 0xb609a2bb  ! 165: AND_I	and 	%r6, 0x02bb, %r27
	.word 0xba08c00f  ! 165: AND_R	and 	%r3, %r15, %r29
	.word 0xa208c00a  ! 165: AND_R	and 	%r3, %r10, %r17
	.word 0xb201afbe  ! 165: ADD_I	add 	%r6, 0x0fbe, %r25
	.word 0xac0a24c1  ! 165: AND_I	and 	%r8, 0x04c1, %r22
	.word 0xb80a29ba  ! 165: AND_I	and 	%r8, 0x09ba, %r28
	.word 0xb801e89a  ! 165: ADD_I	add 	%r7, 0x089a, %r28
	.word 0xae11000a  ! 165: OR_R	or 	%r4, %r10, %r23
	.word 0xbe0161c9  ! 165: ADD_I	add 	%r5, 0x01c9, %r31
	.word 0xac11800e  ! 165: OR_R	or 	%r6, %r14, %r22
	.word 0xae00ee6b  ! 165: ADD_I	add 	%r3, 0x0e6b, %r23
	.word 0xac11e356  ! 165: OR_I	or 	%r7, 0x0356, %r22
	.word 0xb201e498  ! 165: ADD_I	add 	%r7, 0x0498, %r25
	.word 0xbe09c00e  ! 165: AND_R	and 	%r7, %r14, %r31
	.word 0xa8016fdb  ! 165: ADD_I	add 	%r5, 0x0fdb, %r20
	.word 0xb411400d  ! 165: OR_R	or 	%r5, %r13, %r26
	.word 0xb601a8af  ! 165: ADD_I	add 	%r6, 0x08af, %r27
	.word 0xb012212b  ! 165: OR_I	or 	%r8, 0x012b, %r24
	.word 0xac08ea4f  ! 165: AND_I	and 	%r3, 0x0a4f, %r22
	.word 0xb001800c  ! 165: ADD_R	add 	%r6, %r12, %r24
	.word 0xba09e406  ! 165: AND_I	and 	%r7, 0x0406, %r29
	.word 0xae10c00d  ! 165: OR_R	or 	%r3, %r13, %r23
	.word 0xae00ebc2  ! 165: ADD_I	add 	%r3, 0x0bc2, %r23
	.word 0xaa0122c5  ! 165: ADD_I	add 	%r4, 0x02c5, %r21
	.word 0xac092e65  ! 165: AND_I	and 	%r4, 0x0e65, %r22
	.word 0xac11a476  ! 165: OR_I	or 	%r6, 0x0476, %r22
	.word 0xbc11000d  ! 165: OR_R	or 	%r4, %r13, %r30
	.word 0xb801e02d  ! 165: ADD_I	add 	%r7, 0x002d, %r28
	.word 0xa81161bf  ! 165: OR_I	or 	%r5, 0x01bf, %r20
	.word 0xb410e5db  ! 165: OR_I	or 	%r3, 0x05db, %r26
	.word 0xac09400e  ! 165: AND_R	and 	%r5, %r14, %r22
	.word 0xf0716688  ! 165: STX_I	stx	%r24, [%r5 + 0x0688]
	.word 0xe420e0a4  ! 165: STW_I	stw	%r18, [%r3 + 0x00a4]
	.word 0xe4212e58  ! 165: STW_I	stw	%r18, [%r4 + 0x0e58]
	.word 0xea2a2a6a  ! 165: STB_I	stb	%r21, [%r8 + 0x0a6a]
	.word 0xe221e478  ! 165: STW_I	stw	%r17, [%r7 + 0x0478]
IRF_CE_3:
!$EV error(3,expr(@VA(.MAIN.IRF_CE_3), 16, 16), 1,IRF,ce,32,x, x,x,x, x,x,x)
!$EV error(3,expr(@VA(.MAIN.IRF_CE_3), 16, 16), 3,IRF,ce,18,x, x,x,x, x,x,x)
	.word 0xfe20e770  ! 167: STW_I	stw	%r31, [%r3 + 0x0770]
	.word 0xae010045
	.word 0xec70e568  ! 169: STX_I	stx	%r22, [%r3 + 0x0568]
	.word 0xee21e4cc  ! 170: STW_I	stw	%r23, [%r7 + 0x04cc]
	.word 0x32800003  ! 171: BNE	bne,a	<label_0x3>
	.word 0xba11400c  ! 171: OR_R	or 	%r5, %r12, %r29
	.word 0xb801a58c  ! 171: ADD_I	add 	%r6, 0x058c, %r28
	.word 0xa209ed33  ! 171: AND_I	and 	%r7, 0x0d33, %r17
	bne thr3_loop_13
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_14:
	.word 0xae0a000d  ! 177: AND_R	and 	%r8, %r13, %r23
	.word 0xb210c00f  ! 177: OR_R	or 	%r3, %r15, %r25
	.word 0xa811c009  ! 177: OR_R	or 	%r7, %r9, %r20
	.word 0xaa110009  ! 177: OR_R	or 	%r4, %r9, %r21
	.word 0xa8012da3  ! 177: ADD_I	add 	%r4, 0x0da3, %r20
	.word 0xae09eee8  ! 177: AND_I	and 	%r7, 0x0ee8, %r23
	.word 0xac090009  ! 177: AND_R	and 	%r4, %r9, %r22
	.word 0xaa01afcc  ! 177: ADD_I	add 	%r6, 0x0fcc, %r21
	.word 0xa409000e  ! 177: AND_R	and 	%r4, %r14, %r18
	.word 0xae08eab6  ! 177: AND_I	and 	%r3, 0x0ab6, %r23
	.word 0xaa096dde  ! 177: AND_I	and 	%r5, 0x0dde, %r21
	.word 0xaa00ef8a  ! 177: ADD_I	add 	%r3, 0x0f8a, %r21
	.word 0xb800c00d  ! 177: ADD_R	add 	%r3, %r13, %r28
	.word 0xb809000a  ! 177: AND_R	and 	%r4, %r10, %r28
	.word 0xae11000e  ! 177: OR_R	or 	%r4, %r14, %r23
	.word 0xb400e984  ! 177: ADD_I	add 	%r3, 0x0984, %r26
	.word 0xba012542  ! 177: ADD_I	add 	%r4, 0x0542, %r29
	.word 0xa400c00e  ! 177: ADD_R	add 	%r3, %r14, %r18
	.word 0xa201800e  ! 177: ADD_R	add 	%r6, %r14, %r17
	.word 0xb002000d  ! 177: ADD_R	add 	%r8, %r13, %r24
	.word 0xa209c00e  ! 177: AND_R	and 	%r7, %r14, %r17
	.word 0xba0a2c19  ! 177: AND_I	and 	%r8, 0x0c19, %r29
	.word 0xb611400c  ! 177: OR_R	or 	%r5, %r12, %r27
	.word 0xbe01400c  ! 177: ADD_R	add 	%r5, %r12, %r31
	.word 0xba10c00c  ! 177: OR_R	or 	%r3, %r12, %r29
	.word 0xba09a56b  ! 177: AND_I	and 	%r6, 0x056b, %r29
	.word 0xb608c00e  ! 177: AND_R	and 	%r3, %r14, %r27
	.word 0xb20121de  ! 177: ADD_I	add 	%r4, 0x01de, %r25
	.word 0xb808efc1  ! 177: AND_I	and 	%r3, 0x0fc1, %r28
	.word 0xbe0a0009  ! 177: AND_R	and 	%r8, %r9, %r31
	.word 0xbc11c00e  ! 177: OR_R	or 	%r7, %r14, %r30
	.word 0xae08c00e  ! 177: AND_R	and 	%r3, %r14, %r23
	.word 0xa8094009  ! 177: AND_R	and 	%r5, %r9, %r20
	.word 0xb411c00d  ! 177: OR_R	or 	%r7, %r13, %r26
	.word 0xa410c00d  ! 177: OR_R	or 	%r3, %r13, %r18
	.word 0xb202000f  ! 177: ADD_R	add 	%r8, %r15, %r25
	.word 0xa600e82d  ! 177: ADD_I	add 	%r3, 0x082d, %r19
	.word 0xb811289d  ! 177: OR_I	or 	%r4, 0x089d, %r28
	.word 0xbc09e386  ! 177: AND_I	and 	%r7, 0x0386, %r30
	.word 0xae08ebf7  ! 177: AND_I	and 	%r3, 0x0bf7, %r23
	.word 0xa200eb37  ! 177: ADD_I	add 	%r3, 0x0b37, %r17
	.word 0xa208c00b  ! 177: AND_R	and 	%r3, %r11, %r17
	.word 0xb2022b1c  ! 177: ADD_I	add 	%r8, 0x0b1c, %r25
	.word 0xa2116407  ! 177: OR_I	or 	%r5, 0x0407, %r17
	.word 0xb409eb31  ! 177: AND_I	and 	%r7, 0x0b31, %r26
	.word 0xb800e43a  ! 177: ADD_I	add 	%r3, 0x043a, %r28
	.word 0xb809e54d  ! 177: AND_I	and 	%r7, 0x054d, %r28
	.word 0xa409800b  ! 177: AND_R	and 	%r6, %r11, %r18
	.word 0xa209400f  ! 177: AND_R	and 	%r5, %r15, %r17
	.word 0xb409eeb8  ! 177: AND_I	and 	%r7, 0x0eb8, %r26
	.word 0xa2022d1d  ! 177: ADD_I	add 	%r8, 0x0d1d, %r17
	.word 0xa411c00c  ! 177: OR_R	or 	%r7, %r12, %r18
	.word 0xb00a000d  ! 177: AND_R	and 	%r8, %r13, %r24
	.word 0xa810c00f  ! 177: OR_R	or 	%r3, %r15, %r20
	.word 0xba116e52  ! 177: OR_I	or 	%r5, 0x0e52, %r29
	.word 0xbe01c00e  ! 177: ADD_R	add 	%r7, %r14, %r31
	.word 0xb8116382  ! 177: OR_I	or 	%r5, 0x0382, %r28
	.word 0xbe012e21  ! 177: ADD_I	add 	%r4, 0x0e21, %r31
	.word 0xb609a5a0  ! 177: AND_I	and 	%r6, 0x05a0, %r27
	.word 0xac00e3e3  ! 177: ADD_I	add 	%r3, 0x03e3, %r22
	.word 0xb01161a4  ! 177: OR_I	or 	%r5, 0x01a4, %r24
	.word 0xa4092e58  ! 177: AND_I	and 	%r4, 0x0e58, %r18
	.word 0xa6118009  ! 177: OR_R	or 	%r6, %r9, %r19
	.word 0xac0929bb  ! 177: AND_I	and 	%r4, 0x09bb, %r22
	.word 0xb201c00e  ! 177: ADD_R	add 	%r7, %r14, %r25
	.word 0xaa11e5f2  ! 177: OR_I	or 	%r7, 0x05f2, %r21
	.word 0xac0a29d6  ! 177: AND_I	and 	%r8, 0x09d6, %r22
	.word 0xbe11c00f  ! 177: OR_R	or 	%r7, %r15, %r31
	.word 0xae11000f  ! 177: OR_R	or 	%r4, %r15, %r23
	.word 0xb011000d  ! 177: OR_R	or 	%r4, %r13, %r24
	.word 0xb611c00c  ! 177: OR_R	or 	%r7, %r12, %r27
	.word 0xba012ac5  ! 177: ADD_I	add 	%r4, 0x0ac5, %r29
	.word 0xa201400e  ! 177: ADD_R	add 	%r5, %r14, %r17
	.word 0xae01638e  ! 177: ADD_I	add 	%r5, 0x038e, %r23
	.word 0xbe08c00a  ! 177: AND_R	and 	%r3, %r10, %r31
	.word 0xb6012761  ! 177: ADD_I	add 	%r4, 0x0761, %r27
	.word 0xb809800a  ! 177: AND_R	and 	%r6, %r10, %r28
	.word 0xac116b83  ! 177: OR_I	or 	%r5, 0x0b83, %r22
	.word 0xa601e8ab  ! 177: ADD_I	add 	%r7, 0x08ab, %r19
	.word 0xa80a22cf  ! 177: AND_I	and 	%r8, 0x02cf, %r20
	.word 0xa611c00e  ! 177: OR_R	or 	%r7, %r14, %r19
	.word 0xb609000d  ! 177: AND_R	and 	%r4, %r13, %r27
	.word 0xba096e40  ! 177: AND_I	and 	%r5, 0x0e40, %r29
	.word 0xb400c00a  ! 177: ADD_R	add 	%r3, %r10, %r26
	.word 0xb809c00d  ! 177: AND_R	and 	%r7, %r13, %r28
	.word 0xbc01000d  ! 177: ADD_R	add 	%r4, %r13, %r30
	.word 0xa20a2961  ! 177: AND_I	and 	%r8, 0x0961, %r17
	.word 0xa410e283  ! 177: OR_I	or 	%r3, 0x0283, %r18
	.word 0xb2112a36  ! 177: OR_I	or 	%r4, 0x0a36, %r25
	.word 0xae11c00a  ! 177: OR_R	or 	%r7, %r10, %r23
	.word 0xae09e725  ! 177: AND_I	and 	%r7, 0x0725, %r23
	.word 0xb001263e  ! 177: ADD_I	add 	%r4, 0x063e, %r24
	.word 0xa809ee44  ! 177: AND_I	and 	%r7, 0x0e44, %r20
	.word 0xb211c00a  ! 177: OR_R	or 	%r7, %r10, %r25
	.word 0xb608e096  ! 177: AND_I	and 	%r3, 0x0096, %r27
	.word 0xae08c00b  ! 177: AND_R	and 	%r3, %r11, %r23
	.word 0xa810ebe6  ! 177: OR_I	or 	%r3, 0x0be6, %r20
	.word 0xb410c00b  ! 177: OR_R	or 	%r3, %r11, %r26
	.word 0xa800c00c  ! 177: ADD_R	add 	%r3, %r12, %r20
	.word 0xbc10c00c  ! 177: OR_R	or 	%r3, %r12, %r30
	.word 0xa410c00f  ! 177: OR_R	or 	%r3, %r15, %r18
	.word 0xba09c00c  ! 177: AND_R	and 	%r7, %r12, %r29
	.word 0xae0160fa  ! 177: ADD_I	add 	%r5, 0x00fa, %r23
	.word 0xb409800d  ! 177: AND_R	and 	%r6, %r13, %r26
	.word 0xaa010009  ! 177: ADD_R	add 	%r4, %r9, %r21
	.word 0xb409400e  ! 177: AND_R	and 	%r5, %r14, %r26
	.word 0xba092b03  ! 177: AND_I	and 	%r4, 0x0b03, %r29
	.word 0xb601800c  ! 177: ADD_R	add 	%r6, %r12, %r27
	.word 0xae11e4a5  ! 177: OR_I	or 	%r7, 0x04a5, %r23
	.word 0xba10e2ae  ! 177: OR_I	or 	%r3, 0x02ae, %r29
	.word 0xb612000e  ! 177: OR_R	or 	%r8, %r14, %r27
	.word 0xa6114009  ! 177: OR_R	or 	%r5, %r9, %r19
	.word 0xb600c00e  ! 177: ADD_R	add 	%r3, %r14, %r27
	.word 0xbc09800b  ! 177: AND_R	and 	%r6, %r11, %r30
	.word 0xbc12000f  ! 177: OR_R	or 	%r8, %r15, %r30
	.word 0xae09c00b  ! 177: AND_R	and 	%r7, %r11, %r23
	.word 0xa81126d5  ! 177: OR_I	or 	%r4, 0x06d5, %r20
	.word 0xa810e8c7  ! 177: OR_I	or 	%r3, 0x08c7, %r20
	.word 0xac11671b  ! 177: OR_I	or 	%r5, 0x071b, %r22
	.word 0xae00e8a8  ! 177: ADD_I	add 	%r3, 0x08a8, %r23
	.word 0xba08c00d  ! 177: AND_R	and 	%r3, %r13, %r29
	.word 0xb4122f91  ! 177: OR_I	or 	%r8, 0x0f91, %r26
	.word 0xac0162c2  ! 177: ADD_I	add 	%r5, 0x02c2, %r22
	.word 0xac0a2d77  ! 177: AND_I	and 	%r8, 0x0d77, %r22
	.word 0xb801000e  ! 177: ADD_R	add 	%r4, %r14, %r28
	.word 0xae10c00d  ! 177: OR_R	or 	%r3, %r13, %r23
	.word 0xb609400d  ! 177: AND_R	and 	%r5, %r13, %r27
	.word 0xa811609b  ! 177: OR_I	or 	%r5, 0x009b, %r20
	.word 0xb20227b2  ! 177: ADD_I	add 	%r8, 0x07b2, %r25
	.word 0xba122ad8  ! 177: OR_I	or 	%r8, 0x0ad8, %r29
	.word 0xbc10ea2b  ! 177: OR_I	or 	%r3, 0x0a2b, %r30
	.word 0xa808c00c  ! 177: AND_R	and 	%r3, %r12, %r20
	.word 0xa211800c  ! 177: OR_R	or 	%r6, %r12, %r17
	.word 0xb400e55e  ! 177: ADD_I	add 	%r3, 0x055e, %r26
	.word 0xae11a560  ! 177: OR_I	or 	%r6, 0x0560, %r23
	.word 0xbe09676e  ! 177: AND_I	and 	%r5, 0x076e, %r31
	.word 0xac0968db  ! 177: AND_I	and 	%r5, 0x08db, %r22
	.word 0xbc11800e  ! 177: OR_R	or 	%r6, %r14, %r30
	.word 0xa608e4b0  ! 177: AND_I	and 	%r3, 0x04b0, %r19
	.word 0xbc11ed82  ! 177: OR_I	or 	%r7, 0x0d82, %r30
	.word 0xac10eb8a  ! 177: OR_I	or 	%r3, 0x0b8a, %r22
	.word 0xbe1221ff  ! 177: OR_I	or 	%r8, 0x01ff, %r31
	.word 0xa8112319  ! 177: OR_I	or 	%r4, 0x0319, %r20
	.word 0xba0a24f5  ! 177: AND_I	and 	%r8, 0x04f5, %r29
	.word 0xb201eccd  ! 177: ADD_I	add 	%r7, 0x0ccd, %r25
	.word 0xb201400e  ! 177: ADD_R	add 	%r5, %r14, %r25
	.word 0xa2110009  ! 177: OR_R	or 	%r4, %r9, %r17
	.word 0xa4012ac0  ! 177: ADD_I	add 	%r4, 0x0ac0, %r18
	.word 0xba01c00d  ! 177: ADD_R	add 	%r7, %r13, %r29
	.word 0xa4112aa2  ! 177: OR_I	or 	%r4, 0x0aa2, %r18
	.word 0xae08e313  ! 177: AND_I	and 	%r3, 0x0313, %r23
	.word 0xaa11000e  ! 177: OR_R	or 	%r4, %r14, %r21
	.word 0xb200e147  ! 177: ADD_I	add 	%r3, 0x0147, %r25
	.word 0xbe116af8  ! 177: OR_I	or 	%r5, 0x0af8, %r31
	.word 0xa4118009  ! 177: OR_R	or 	%r6, %r9, %r18
	.word 0xaa116c38  ! 177: OR_I	or 	%r5, 0x0c38, %r21
	.word 0xb808ebd0  ! 177: AND_I	and 	%r3, 0x0bd0, %r28
	.word 0xba012d10  ! 177: ADD_I	add 	%r4, 0x0d10, %r29
	.word 0xb010ec43  ! 177: OR_I	or 	%r3, 0x0c43, %r24
	.word 0xa810ebf0  ! 177: OR_I	or 	%r3, 0x0bf0, %r20
	.word 0xa2096371  ! 177: AND_I	and 	%r5, 0x0371, %r17
	.word 0xb801800a  ! 177: ADD_R	add 	%r6, %r10, %r28
	.word 0xaa0a265c  ! 177: AND_I	and 	%r8, 0x065c, %r21
	.word 0xba08c00a  ! 177: AND_R	and 	%r3, %r10, %r29
	.word 0xa20a000f  ! 177: AND_R	and 	%r8, %r15, %r17
	.word 0xbe01000e  ! 177: ADD_R	add 	%r4, %r14, %r31
	.word 0xbe09000b  ! 177: AND_R	and 	%r4, %r11, %r31
	.word 0xa208c00d  ! 177: AND_R	and 	%r3, %r13, %r17
	.word 0xbe090009  ! 177: AND_R	and 	%r4, %r9, %r31
	.word 0xb8012dcd  ! 177: ADD_I	add 	%r4, 0x0dcd, %r28
	.word 0xb211e138  ! 177: OR_I	or 	%r7, 0x0138, %r25
	.word 0xa6096e00  ! 177: AND_I	and 	%r5, 0x0e00, %r19
	.word 0xae116e85  ! 177: OR_I	or 	%r5, 0x0e85, %r23
	.word 0xb611400f  ! 177: OR_R	or 	%r5, %r15, %r27
	.word 0xa61225d1  ! 177: OR_I	or 	%r8, 0x05d1, %r19
	.word 0xbc00c00a  ! 177: ADD_R	add 	%r3, %r10, %r30
	.word 0xa611e506  ! 177: OR_I	or 	%r7, 0x0506, %r19
	.word 0xa2018009  ! 177: ADD_R	add 	%r6, %r9, %r17
	.word 0xb802268e  ! 177: ADD_I	add 	%r8, 0x068e, %r28
	.word 0xa601ae46  ! 177: ADD_I	add 	%r6, 0x0e46, %r19
	.word 0xbc01a94e  ! 177: ADD_I	add 	%r6, 0x094e, %r30
	.word 0xb011c00b  ! 177: OR_R	or 	%r7, %r11, %r24
	.word 0xb211800a  ! 177: OR_R	or 	%r6, %r10, %r25
	.word 0xa411400b  ! 177: OR_R	or 	%r5, %r11, %r18
	.word 0xb601e346  ! 177: ADD_I	add 	%r7, 0x0346, %r27
	.word 0xa211a9e3  ! 177: OR_I	or 	%r6, 0x09e3, %r17
	.word 0xb010c00a  ! 177: OR_R	or 	%r3, %r10, %r24
	.word 0xaa112ff0  ! 177: OR_I	or 	%r4, 0x0ff0, %r21
	.word 0xb811c00e  ! 177: OR_R	or 	%r7, %r14, %r28
	.word 0xb009000c  ! 177: AND_R	and 	%r4, %r12, %r24
	.word 0xbe01c00a  ! 177: ADD_R	add 	%r7, %r10, %r31
	.word 0xee322210  ! 177: STH_I	sth	%r23, [%r8 + 0x0210]
	.word 0xf4216a04  ! 177: STW_I	stw	%r26, [%r5 + 0x0a04]
	.word 0xf42968aa  ! 177: STB_I	stb	%r26, [%r5 + 0x08aa]
	.word 0xf229617c  ! 177: STB_I	stb	%r25, [%r5 + 0x017c]
	.word 0xf431a3d2  ! 177: STH_I	sth	%r26, [%r6 + 0x03d2]
	.word 0xea322580  ! 178: STH_I	sth	%r21, [%r8 + 0x0580]
	.word 0xb731100c  ! 179: SRLX_R	srlx	%r4, %r12, %r27
	.word 0xfc21a4dc  ! 180: STW_I	stw	%r30, [%r6 + 0x04dc]
	.word 0xf1212054  ! 181: STF_I	st	%f24, [0x0054, %r4]
	setx  0x0000000000000f10, %r16, %r11
	.word 0xb002000d  ! 182: ADD_R	add 	%r8, %r13, %r24
	.word 0xaa0227bc  ! 182: ADD_I	add 	%r8, 0x07bc, %r21
	.word 0xa211400c  ! 182: OR_R	or 	%r5, %r12, %r17
	bne thr3_loop_14
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr3_loop_15:
	.word 0xa411400a  ! 188: OR_R	or 	%r5, %r10, %r18
	.word 0xb210c00e  ! 188: OR_R	or 	%r3, %r14, %r25
	.word 0xbc016602  ! 188: ADD_I	add 	%r5, 0x0602, %r30
	.word 0xb400eae4  ! 188: ADD_I	add 	%r3, 0x0ae4, %r26
	.word 0xa201800b  ! 188: ADD_R	add 	%r6, %r11, %r17
	.word 0xb211c00a  ! 188: OR_R	or 	%r7, %r10, %r25
	.word 0xbc09c00f  ! 188: AND_R	and 	%r7, %r15, %r30
	.word 0xa400c00a  ! 188: ADD_R	add 	%r3, %r10, %r18
	.word 0xaa11e4b6  ! 188: OR_I	or 	%r7, 0x04b6, %r21
	.word 0xb611800f  ! 188: OR_R	or 	%r6, %r15, %r27
	.word 0xb809400b  ! 188: AND_R	and 	%r5, %r11, %r28
	.word 0xa2022840  ! 188: ADD_I	add 	%r8, 0x0840, %r17
	.word 0xba12216f  ! 188: OR_I	or 	%r8, 0x016f, %r29
	.word 0xa6090009  ! 188: AND_R	and 	%r4, %r9, %r19
	.word 0xb811400b  ! 188: OR_R	or 	%r5, %r11, %r28
	.word 0xa4092230  ! 188: AND_I	and 	%r4, 0x0230, %r18
	.word 0xb010c00a  ! 188: OR_R	or 	%r3, %r10, %r24
	.word 0xba112cba  ! 188: OR_I	or 	%r4, 0x0cba, %r29
	.word 0xb808ee1b  ! 188: AND_I	and 	%r3, 0x0e1b, %r28
	.word 0xb2012c55  ! 188: ADD_I	add 	%r4, 0x0c55, %r25
	.word 0xae0960c0  ! 188: AND_I	and 	%r5, 0x00c0, %r23
	.word 0xba11afbe  ! 188: OR_I	or 	%r6, 0x0fbe, %r29
	.word 0xb001a86c  ! 188: ADD_I	add 	%r6, 0x086c, %r24
	.word 0xba01800b  ! 188: ADD_R	add 	%r6, %r11, %r29
	.word 0xaa09eef4  ! 188: AND_I	and 	%r7, 0x0ef4, %r21
	.word 0xb409e971  ! 188: AND_I	and 	%r7, 0x0971, %r26
	.word 0xa609a1fb  ! 188: AND_I	and 	%r6, 0x01fb, %r19
	.word 0xb20128a0  ! 188: ADD_I	add 	%r4, 0x08a0, %r25
	.word 0xb80a000c  ! 188: AND_R	and 	%r8, %r12, %r28
	.word 0xa801800f  ! 188: ADD_R	add 	%r6, %r15, %r20
	.word 0xa80a000f  ! 188: AND_R	and 	%r8, %r15, %r20
	.word 0xbc010009  ! 188: ADD_R	add 	%r4, %r9, %r30
	.word 0xb809a76a  ! 188: AND_I	and 	%r6, 0x076a, %r28
	.word 0xac092a46  ! 188: AND_I	and 	%r4, 0x0a46, %r22
	.word 0xb201000a  ! 188: ADD_R	add 	%r4, %r10, %r25
	.word 0xba0a20ec  ! 188: AND_I	and 	%r8, 0x00ec, %r29
	.word 0xb011400a  ! 188: OR_R	or 	%r5, %r10, %r24
	.word 0xaa00c00b  ! 188: ADD_R	add 	%r3, %r11, %r21
	.word 0xb011ad25  ! 188: OR_I	or 	%r6, 0x0d25, %r24
	.word 0xb609c00a  ! 188: AND_R	and 	%r7, %r10, %r27
	.word 0xbe096137  ! 188: AND_I	and 	%r5, 0x0137, %r31
	.word 0xa8022d75  ! 188: ADD_I	add 	%r8, 0x0d75, %r20
	.word 0xae11c00a  ! 188: OR_R	or 	%r7, %r10, %r23
	.word 0xbe10c00c  ! 188: OR_R	or 	%r3, %r12, %r31
	.word 0xa409800f  ! 188: AND_R	and 	%r6, %r15, %r18
	.word 0xb208e67e  ! 188: AND_I	and 	%r3, 0x067e, %r25
	.word 0xb411000e  ! 188: OR_R	or 	%r4, %r14, %r26
	.word 0xbe09400d  ! 188: AND_R	and 	%r5, %r13, %r31
	.word 0xae11400e  ! 188: OR_R	or 	%r5, %r14, %r23
	.word 0xa602272b  ! 188: ADD_I	add 	%r8, 0x072b, %r19
	.word 0xa411800f  ! 188: OR_R	or 	%r6, %r15, %r18
	.word 0xa801c00c  ! 188: ADD_R	add 	%r7, %r12, %r20
	.word 0xa6116523  ! 188: OR_I	or 	%r5, 0x0523, %r19
	.word 0xbe11400d  ! 188: OR_R	or 	%r5, %r13, %r31
	.word 0xbe08e966  ! 188: AND_I	and 	%r3, 0x0966, %r31
	.word 0xae0a2e93  ! 188: AND_I	and 	%r8, 0x0e93, %r23
	.word 0xb009e6af  ! 188: AND_I	and 	%r7, 0x06af, %r24
	.word 0xbc09eee8  ! 188: AND_I	and 	%r7, 0x0ee8, %r30
	.word 0xac11800a  ! 188: OR_R	or 	%r6, %r10, %r22
	.word 0xa409400d  ! 188: AND_R	and 	%r5, %r13, %r18
	.word 0xa21126a6  ! 188: OR_I	or 	%r4, 0x06a6, %r17
	.word 0xa6016821  ! 188: ADD_I	add 	%r5, 0x0821, %r19
	.word 0xb8092312  ! 188: AND_I	and 	%r4, 0x0312, %r28
	.word 0xbc09eb94  ! 188: AND_I	and 	%r7, 0x0b94, %r30
	.word 0xaa10c00c  ! 188: OR_R	or 	%r3, %r12, %r21
	.word 0xa211400e  ! 188: OR_R	or 	%r5, %r14, %r17
	.word 0xb009c00a  ! 188: AND_R	and 	%r7, %r10, %r24
	.word 0xbc11800a  ! 188: OR_R	or 	%r6, %r10, %r30
	.word 0xbc09c00b  ! 188: AND_R	and 	%r7, %r11, %r30
	.word 0xb200c00b  ! 188: ADD_R	add 	%r3, %r11, %r25
	.word 0xa2094009  ! 188: AND_R	and 	%r5, %r9, %r17
	.word 0xa210c00c  ! 188: OR_R	or 	%r3, %r12, %r17
	.word 0xb6016da4  ! 188: ADD_I	add 	%r5, 0x0da4, %r27
	.word 0xa209c00c  ! 188: AND_R	and 	%r7, %r12, %r17
	.word 0xaa01c00b  ! 188: ADD_R	add 	%r7, %r11, %r21
	.word 0xb411800b  ! 188: OR_R	or 	%r6, %r11, %r26
	.word 0xb212000f  ! 188: OR_R	or 	%r8, %r15, %r25
	.word 0xa401400e  ! 188: ADD_R	add 	%r5, %r14, %r18
	.word 0xb609c009  ! 188: AND_R	and 	%r7, %r9, %r27
	.word 0xb411287a  ! 188: OR_I	or 	%r4, 0x087a, %r26
	.word 0xb0116b6d  ! 188: OR_I	or 	%r5, 0x0b6d, %r24
	.word 0xb808c00f  ! 188: AND_R	and 	%r3, %r15, %r28
	.word 0xbc11e6ce  ! 188: OR_I	or 	%r7, 0x06ce, %r30
	.word 0xa6092918  ! 188: AND_I	and 	%r4, 0x0918, %r19
	.word 0xbe02000d  ! 188: ADD_R	add 	%r8, %r13, %r31
	.word 0xb0122772  ! 188: OR_I	or 	%r8, 0x0772, %r24
	.word 0xa811400e  ! 188: OR_R	or 	%r5, %r14, %r20
	.word 0xa8116213  ! 188: OR_I	or 	%r5, 0x0213, %r20
	.word 0xa200e054  ! 188: ADD_I	add 	%r3, 0x0054, %r17
	.word 0xa41126fe  ! 188: OR_I	or 	%r4, 0x06fe, %r18
	.word 0xb20a0009  ! 188: AND_R	and 	%r8, %r9, %r25
	.word 0xb401400d  ! 188: ADD_R	add 	%r5, %r13, %r26
	.word 0xba00e02a  ! 188: ADD_I	add 	%r3, 0x002a, %r29
	.word 0xb40a24bc  ! 188: AND_I	and 	%r8, 0x04bc, %r26
	.word 0xa209000f  ! 188: AND_R	and 	%r4, %r15, %r17
	.word 0xb00229c6  ! 188: ADD_I	add 	%r8, 0x09c6, %r24
	.word 0xb209ad27  ! 188: AND_I	and 	%r6, 0x0d27, %r25
	.word 0xaa10c009  ! 188: OR_R	or 	%r3, %r9, %r21
	.word 0xa208e8fb  ! 188: AND_I	and 	%r3, 0x08fb, %r17
	.word 0xa209000d  ! 188: AND_R	and 	%r4, %r13, %r17
	.word 0xac092889  ! 188: AND_I	and 	%r4, 0x0889, %r22
	.word 0xbc112565  ! 188: OR_I	or 	%r4, 0x0565, %r30
	.word 0xa410c00d  ! 188: OR_R	or 	%r3, %r13, %r18
	.word 0xa209c00f  ! 188: AND_R	and 	%r7, %r15, %r17
	.word 0xa801000c  ! 188: ADD_R	add 	%r4, %r12, %r20
	.word 0xb011400b  ! 188: OR_R	or 	%r5, %r11, %r24
	.word 0xbe016335  ! 188: ADD_I	add 	%r5, 0x0335, %r31
	.word 0xa401400d  ! 188: ADD_R	add 	%r5, %r13, %r18
	.word 0xae00e7ba  ! 188: ADD_I	add 	%r3, 0x07ba, %r23
	.word 0xa201e418  ! 188: ADD_I	add 	%r7, 0x0418, %r17
	.word 0xac08c009  ! 188: AND_R	and 	%r3, %r9, %r22
	.word 0xb208c00a  ! 188: AND_R	and 	%r3, %r10, %r25
	.word 0xb6122ac2  ! 188: OR_I	or 	%r8, 0x0ac2, %r27
	.word 0xb8010009  ! 188: ADD_R	add 	%r4, %r9, %r28
	.word 0xbc11800f  ! 188: OR_R	or 	%r6, %r15, %r30
	.word 0xb0022ff1  ! 188: ADD_I	add 	%r8, 0x0ff1, %r24
	.word 0xa401a9ae  ! 188: ADD_I	add 	%r6, 0x09ae, %r18
	.word 0xb200e0c5  ! 188: ADD_I	add 	%r3, 0x00c5, %r25
	.word 0xa21229b3  ! 188: OR_I	or 	%r8, 0x09b3, %r17
	.word 0xb401af93  ! 188: ADD_I	add 	%r6, 0x0f93, %r26
	.word 0xa611222c  ! 188: OR_I	or 	%r4, 0x022c, %r19
	.word 0xb60a000c  ! 188: AND_R	and 	%r8, %r12, %r27
	.word 0xb211000e  ! 188: OR_R	or 	%r4, %r14, %r25
	.word 0xb208c00f  ! 188: AND_R	and 	%r3, %r15, %r25
	.word 0xb411efca  ! 188: OR_I	or 	%r7, 0x0fca, %r26
	.word 0xb80a2711  ! 188: AND_I	and 	%r8, 0x0711, %r28
	.word 0xa411edf0  ! 188: OR_I	or 	%r7, 0x0df0, %r18
	.word 0xaa11c009  ! 188: OR_R	or 	%r7, %r9, %r21
	.word 0xac09e050  ! 188: AND_I	and 	%r7, 0x0050, %r22
	.word 0xaa00c00a  ! 188: ADD_R	add 	%r3, %r10, %r21
	.word 0xb011a40d  ! 188: OR_I	or 	%r6, 0x040d, %r24
	.word 0xa600e403  ! 188: ADD_I	add 	%r3, 0x0403, %r19
	.word 0xaa11aeef  ! 188: OR_I	or 	%r6, 0x0eef, %r21
	.word 0xa412000c  ! 188: OR_R	or 	%r8, %r12, %r18
	.word 0xb601800d  ! 188: ADD_R	add 	%r6, %r13, %r27
	.word 0xb60a2531  ! 188: AND_I	and 	%r8, 0x0531, %r27
	.word 0xb009a5bb  ! 188: AND_I	and 	%r6, 0x05bb, %r24
	.word 0xb600c00a  ! 188: ADD_R	add 	%r3, %r10, %r27
	.word 0xac116bc9  ! 188: OR_I	or 	%r5, 0x0bc9, %r22
	.word 0xa209800f  ! 188: AND_R	and 	%r6, %r15, %r17
	.word 0xaa09000d  ! 188: AND_R	and 	%r4, %r13, %r21
	.word 0xa811c00e  ! 188: OR_R	or 	%r7, %r14, %r20
	.word 0xb201c009  ! 188: ADD_R	add 	%r7, %r9, %r25
	.word 0xac012478  ! 188: ADD_I	add 	%r4, 0x0478, %r22
	.word 0xa211ee60  ! 188: OR_I	or 	%r7, 0x0e60, %r17
	.word 0xb009000f  ! 188: AND_R	and 	%r4, %r15, %r24
	.word 0xb40a000a  ! 188: AND_R	and 	%r8, %r10, %r26
	.word 0xa202000a  ! 188: ADD_R	add 	%r8, %r10, %r17
	.word 0xbc01400f  ! 188: ADD_R	add 	%r5, %r15, %r30
	.word 0xba09c00e  ! 188: AND_R	and 	%r7, %r14, %r29
	.word 0xb611a64d  ! 188: OR_I	or 	%r6, 0x064d, %r27
	.word 0xa611400a  ! 188: OR_R	or 	%r5, %r10, %r19
	.word 0xaa10c00b  ! 188: OR_R	or 	%r3, %r11, %r21
	.word 0xa410ee8c  ! 188: OR_I	or 	%r3, 0x0e8c, %r18
	.word 0xae11800f  ! 188: OR_R	or 	%r6, %r15, %r23
	.word 0xb001c00d  ! 188: ADD_R	add 	%r7, %r13, %r24
	.word 0xaa01000e  ! 188: ADD_R	add 	%r4, %r14, %r21
	.word 0xb401c00f  ! 188: ADD_R	add 	%r7, %r15, %r26
	.word 0xaa10e655  ! 188: OR_I	or 	%r3, 0x0655, %r21
	.word 0xac0962f1  ! 188: AND_I	and 	%r5, 0x02f1, %r22
	.word 0xa809205a  ! 188: AND_I	and 	%r4, 0x005a, %r20
	.word 0xb809698c  ! 188: AND_I	and 	%r5, 0x098c, %r28
	.word 0xa402000b  ! 188: ADD_R	add 	%r8, %r11, %r18
	.word 0xa400e8df  ! 188: ADD_I	add 	%r3, 0x08df, %r18
	.word 0xb802000a  ! 188: ADD_R	add 	%r8, %r10, %r28
	.word 0xb211a09a  ! 188: OR_I	or 	%r6, 0x009a, %r25
	.word 0xae11000b  ! 188: OR_R	or 	%r4, %r11, %r23
	.word 0xac092603  ! 188: AND_I	and 	%r4, 0x0603, %r22
	.word 0xa4016789  ! 188: ADD_I	add 	%r5, 0x0789, %r18
	.word 0xa809c00b  ! 188: AND_R	and 	%r7, %r11, %r20
	.word 0xae094009  ! 188: AND_R	and 	%r5, %r9, %r23
	.word 0xa809c00c  ! 188: AND_R	and 	%r7, %r12, %r20
	.word 0xb0112aa8  ! 188: OR_I	or 	%r4, 0x0aa8, %r24
	.word 0xae092881  ! 188: AND_I	and 	%r4, 0x0881, %r23
	.word 0xac094009  ! 188: AND_R	and 	%r5, %r9, %r22
	.word 0xb001400e  ! 188: ADD_R	add 	%r5, %r14, %r24
	.word 0xbc0a26e8  ! 188: AND_I	and 	%r8, 0x06e8, %r30
	.word 0xac09a655  ! 188: AND_I	and 	%r6, 0x0655, %r22
	.word 0xa408e67d  ! 188: AND_I	and 	%r3, 0x067d, %r18
	.word 0xa801a68d  ! 188: ADD_I	add 	%r6, 0x068d, %r20
	.word 0xb011000b  ! 188: OR_R	or 	%r4, %r11, %r24
	.word 0xb0012839  ! 188: ADD_I	add 	%r4, 0x0839, %r24
	.word 0xae01693c  ! 188: ADD_I	add 	%r5, 0x093c, %r23
	.word 0xac01400d  ! 188: ADD_R	add 	%r5, %r13, %r22
	.word 0xba10c009  ! 188: OR_R	or 	%r3, %r9, %r29
	.word 0xb809800d  ! 188: AND_R	and 	%r6, %r13, %r28
	.word 0xb0094009  ! 188: AND_R	and 	%r5, %r9, %r24
	.word 0xa2016093  ! 188: ADD_I	add 	%r5, 0x0093, %r17
	.word 0xaa11c00a  ! 188: OR_R	or 	%r7, %r10, %r21
	.word 0xa409800b  ! 188: AND_R	and 	%r6, %r11, %r18
	.word 0xbc01000a  ! 188: ADD_R	add 	%r4, %r10, %r30
	.word 0xa210c00b  ! 188: OR_R	or 	%r3, %r11, %r17
	.word 0xb2016c4b  ! 188: ADD_I	add 	%r5, 0x0c4b, %r25
	.word 0xb411000a  ! 188: OR_R	or 	%r4, %r10, %r26
	.word 0xa609efda  ! 188: AND_I	and 	%r7, 0x0fda, %r19
	.word 0xaa0a2c28  ! 188: AND_I	and 	%r8, 0x0c28, %r21
	.word 0xa811eea6  ! 188: OR_I	or 	%r7, 0x0ea6, %r20
	.word 0xb809e232  ! 188: AND_I	and 	%r7, 0x0232, %r28
	.word 0xa212000c  ! 188: OR_R	or 	%r8, %r12, %r17
	.word 0xbc01800d  ! 188: ADD_R	add 	%r6, %r13, %r30
	.word 0xb011aa00  ! 188: OR_I	or 	%r6, 0x0a00, %r24
	.word 0xa4112aed  ! 188: OR_I	or 	%r4, 0x0aed, %r18
	.word 0xac092c03  ! 188: AND_I	and 	%r4, 0x0c03, %r22
	.word 0xb001a51e  ! 188: ADD_I	add 	%r6, 0x051e, %r24
	.word 0xbe1226ba  ! 188: OR_I	or 	%r8, 0x06ba, %r31
	.word 0xbc01e451  ! 188: ADD_I	add 	%r7, 0x0451, %r30
	.word 0xbc01400f  ! 188: ADD_R	add 	%r5, %r15, %r30
	.word 0xbc012073  ! 188: ADD_I	add 	%r4, 0x0073, %r30
	.word 0xb4116b6b  ! 188: OR_I	or 	%r5, 0x0b6b, %r26
	.word 0xb812000c  ! 188: OR_R	or 	%r8, %r12, %r28
	.word 0xac01c00c  ! 188: ADD_R	add 	%r7, %r12, %r22
	.word 0xb009400d  ! 188: AND_R	and 	%r5, %r13, %r24
	.word 0xac01000e  ! 188: ADD_R	add 	%r4, %r14, %r22
	.word 0xa208c009  ! 188: AND_R	and 	%r3, %r9, %r17
	.word 0xae11400a  ! 188: OR_R	or 	%r5, %r10, %r23
	.word 0xa808e862  ! 188: AND_I	and 	%r3, 0x0862, %r20
	.word 0xbc11ab04  ! 188: OR_I	or 	%r6, 0x0b04, %r30
	.word 0xaa096025  ! 188: AND_I	and 	%r5, 0x0025, %r21
	.word 0xbe01c009  ! 188: ADD_R	add 	%r7, %r9, %r31
	.word 0xa20a2dd8  ! 188: AND_I	and 	%r8, 0x0dd8, %r17
	.word 0xa601400f  ! 188: ADD_R	add 	%r5, %r15, %r19
	.word 0xbe01a041  ! 188: ADD_I	add 	%r6, 0x0041, %r31
	.word 0xb411800a  ! 188: OR_R	or 	%r6, %r10, %r26
	.word 0xe82929df  ! 188: STB_I	stb	%r20, [%r4 + 0x09df]
	.word 0xf8212060  ! 188: STW_I	stw	%r28, [%r4 + 0x0060]
	.word 0xf6296142  ! 188: STB_I	stb	%r27, [%r5 + 0x0142]
	.word 0xe871ac48  ! 188: STX_I	stx	%r20, [%r6 + 0x0c48]
	.word 0xf631288e  ! 188: STH_I	sth	%r27, [%r4 + 0x088e]
	.word 0xf429a919  ! 190: STB_I	stb	%r26, [%r6 + 0x0919]
	.word 0xae010045
	.word 0xfc316028  ! 192: STH_I	sth	%r30, [%r5 + 0x0028]
	.word 0xe4a163dc  ! 193: STWA_I	stwa	%r18, [%r5 + 0x03dc] %asi
	.word 0xa4696bb3  ! 194: UDIVX_I	udivx 	%r5, 0x0bb3, %r18
	.word 0xac10c00a  ! 194: OR_R	or 	%r3, %r10, %r22
	.word 0xaa1228f9  ! 194: OR_I	or 	%r8, 0x08f9, %r21
	.word 0xa209400d  ! 194: AND_R	and 	%r5, %r13, %r17
	bne thr3_loop_15
	subcc %g1, 0x1, %g1
	ba	join_lbl_0_0
	nop
fork_lbl_0_2:
	setx  0xc5548461fb49ace5, %r1, %r17
	setx  0x757cd119d68103d1, %r1, %r18
	setx  0x9bfdf384c41ad785, %r1, %r19
	setx  0xedda96b3769c5584, %r1, %r20
	setx  0x236351c352290738, %r1, %r21
	setx  0x5c2c02ff2948c866, %r1, %r22
	setx  0xf8ce3302b904feab, %r1, %r23
	setx  0xd4a3766c25b08b42, %r1, %r24
	setx  0xf7b764b89990f4c6, %r1, %r25
	setx  0x33fbe7f6f3ef8b2e, %r1, %r26
	setx  0x3d4169389246a1e1, %r1, %r27
	setx  0x44a5fbecaeaf7d66, %r1, %r28
	setx  0x8996b2f2d1ebeb86, %r1, %r29
	setx  0xeb652e155221f084, %r1, %r30
	setx  0xea5379ca82b30181, %r1, %r31
	setx  0x0000000000000940, %r1, %r9
	setx  0x00000000000005d0, %r1, %r10
	setx  0x0000000000000550, %r1, %r11
	setx  0x0000000000000020, %r1, %r12
	setx  0x0000000000000510, %r1, %r13
	setx  0x0000000000000830, %r1, %r14
	setx  0x00000000000003e0, %r1, %r15
	setx MAIN_BASE_DATA_VA, %r1, %r3
	setx MAIN_BASE_DATA_VA, %r1, %r4
	setx MAIN_BASE_DATA_VA, %r1, %r5
	setx MAIN_BASE_DATA_VA, %r1, %r6
	setx MAIN_BASE_DATA_VA, %r1, %r7
	setx MAIN_BASE_DATA_VA, %r1, %r8
	setx  0x0000000000000612, %r1, %r2
	wr %r0, 0x4, %fprs
	ldd	[%r4 + 0], %f0
	ldd	[%r4 + 8], %f2
	ldd	[%r4 + 16], %f4
	ldd	[%r4 + 24], %f6
	ldd	[%r4 + 32], %f8
	ldd	[%r4 + 40], %f10
	ldd	[%r4 + 48], %f12
	ldd	[%r4 + 56], %f14
	ldd	[%r4 + 64], %f16
	ldd	[%r4 + 72], %f18
	ldd	[%r4 + 80], %f20
	ldd	[%r4 + 88], %f22
	ldd	[%r4 + 96], %f24
	ldd	[%r4 + 104], %f26
	ldd	[%r4 + 112], %f28
	ldd	[%r4 + 120], %f30
	ldd	[%r4 + 128], %f32
	ldd	[%r4 + 136], %f34
	ldd	[%r4 + 144], %f36
	ldd	[%r4 + 152], %f38
	ldd	[%r4 + 160], %f40
	ldd	[%r4 + 168], %f42
	ldd	[%r4 + 176], %f44
	ldd	[%r4 + 184], %f46
	ldd	[%r4 + 192], %f48
	ldd	[%r4 + 200], %f50
	ldd	[%r4 + 208], %f52
	ldd	[%r4 + 216], %f54
	ldd	[%r4 + 224], %f56
	ldd	[%r4 + 232], %f58
	ldd	[%r4 + 240], %f60
	ldd	[%r4 + 248], %f62
	wr  %r0, 0x80, %asi
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_0:
	.word 0xba01800a  ! 6: ADD_R	add 	%r6, %r10, %r29
	.word 0xa4010009  ! 6: ADD_R	add 	%r4, %r9, %r18
	.word 0xae09af42  ! 6: AND_I	and 	%r6, 0x0f42, %r23
	.word 0xb401800e  ! 6: ADD_R	add 	%r6, %r14, %r26
	.word 0xbc10e706  ! 6: OR_I	or 	%r3, 0x0706, %r30
	.word 0xb801e823  ! 6: ADD_I	add 	%r7, 0x0823, %r28
	.word 0xac112d96  ! 6: OR_I	or 	%r4, 0x0d96, %r22
	.word 0xb4016e60  ! 6: ADD_I	add 	%r5, 0x0e60, %r26
	.word 0xac00c00c  ! 6: ADD_R	add 	%r3, %r12, %r22
	.word 0xa60a20a9  ! 6: AND_I	and 	%r8, 0x00a9, %r19
	.word 0xa808c00f  ! 6: AND_R	and 	%r3, %r15, %r20
	.word 0xac0229e1  ! 6: ADD_I	add 	%r8, 0x09e1, %r22
	.word 0xac00efc2  ! 6: ADD_I	add 	%r3, 0x0fc2, %r22
	.word 0xaa01a687  ! 6: ADD_I	add 	%r6, 0x0687, %r21
	.word 0xb800e45a  ! 6: ADD_I	add 	%r3, 0x045a, %r28
	.word 0xa20127ac  ! 6: ADD_I	add 	%r4, 0x07ac, %r17
	.word 0xb4022b42  ! 6: ADD_I	add 	%r8, 0x0b42, %r26
	.word 0xa601e03c  ! 6: ADD_I	add 	%r7, 0x003c, %r19
	.word 0xb611000c  ! 6: OR_R	or 	%r4, %r12, %r27
	.word 0xb2020009  ! 6: ADD_R	add 	%r8, %r9, %r25
	.word 0xb210c00a  ! 6: OR_R	or 	%r3, %r10, %r25
	.word 0xa201800c  ! 6: ADD_R	add 	%r6, %r12, %r17
	.word 0xba01000f  ! 6: ADD_R	add 	%r4, %r15, %r29
	.word 0xbc0a2cb7  ! 6: AND_I	and 	%r8, 0x0cb7, %r30
	.word 0xbe02000b  ! 6: ADD_R	add 	%r8, %r11, %r31
	.word 0xb211c00c  ! 6: OR_R	or 	%r7, %r12, %r25
	.word 0xa609800f  ! 6: AND_R	and 	%r6, %r15, %r19
	.word 0xac122cfb  ! 6: OR_I	or 	%r8, 0x0cfb, %r22
	.word 0xa601800d  ! 6: ADD_R	add 	%r6, %r13, %r19
	.word 0xaa02296a  ! 6: ADD_I	add 	%r8, 0x096a, %r21
	.word 0xb60923e5  ! 6: AND_I	and 	%r4, 0x03e5, %r27
	.word 0xac012502  ! 6: ADD_I	add 	%r4, 0x0502, %r22
	.word 0xaa018009  ! 6: ADD_R	add 	%r6, %r9, %r21
	.word 0xb2016010  ! 6: ADD_I	add 	%r5, 0x0010, %r25
	.word 0xa609000e  ! 6: AND_R	and 	%r4, %r14, %r19
	.word 0xb001c00b  ! 6: ADD_R	add 	%r7, %r11, %r24
	.word 0xbe022c81  ! 6: ADD_I	add 	%r8, 0x0c81, %r31
	.word 0xb6110009  ! 6: OR_R	or 	%r4, %r9, %r27
	.word 0xb011000d  ! 6: OR_R	or 	%r4, %r13, %r24
	.word 0xbe112a0f  ! 6: OR_I	or 	%r4, 0x0a0f, %r31
	.word 0xa202000f  ! 6: ADD_R	add 	%r8, %r15, %r17
	.word 0xb400c009  ! 6: ADD_R	add 	%r3, %r9, %r26
	.word 0xa61123a9  ! 6: OR_I	or 	%r4, 0x03a9, %r19
	.word 0xb6018009  ! 6: ADD_R	add 	%r6, %r9, %r27
	.word 0xa808c00c  ! 6: AND_R	and 	%r3, %r12, %r20
	.word 0xa410e4ed  ! 6: OR_I	or 	%r3, 0x04ed, %r18
	.word 0xa208eaa7  ! 6: AND_I	and 	%r3, 0x0aa7, %r17
	.word 0xaa11ee15  ! 6: OR_I	or 	%r7, 0x0e15, %r21
	.word 0xb601c00a  ! 6: ADD_R	add 	%r7, %r10, %r27
	.word 0xa611690f  ! 6: OR_I	or 	%r5, 0x090f, %r19
	.word 0xbc08c00b  ! 6: AND_R	and 	%r3, %r11, %r30
	.word 0xbe0225e4  ! 6: ADD_I	add 	%r8, 0x05e4, %r31
	.word 0xb2014009  ! 6: ADD_R	add 	%r5, %r9, %r25
	.word 0xb808e5eb  ! 6: AND_I	and 	%r3, 0x05eb, %r28
	.word 0xba01610d  ! 6: ADD_I	add 	%r5, 0x010d, %r29
	.word 0xbe10c00c  ! 6: OR_R	or 	%r3, %r12, %r31
	.word 0xa2096a2b  ! 6: AND_I	and 	%r5, 0x0a2b, %r17
	.word 0xb209800c  ! 6: AND_R	and 	%r6, %r12, %r25
	.word 0xa211800d  ! 6: OR_R	or 	%r6, %r13, %r17
	.word 0xa201400f  ! 6: ADD_R	add 	%r5, %r15, %r17
	.word 0xa612000e  ! 6: OR_R	or 	%r8, %r14, %r19
	.word 0xbc11ae58  ! 6: OR_I	or 	%r6, 0x0e58, %r30
	.word 0xb0018009  ! 6: ADD_R	add 	%r6, %r9, %r24
	.word 0xba10ea8d  ! 6: OR_I	or 	%r3, 0x0a8d, %r29
	.word 0xa601af47  ! 6: ADD_I	add 	%r6, 0x0f47, %r19
	.word 0xa411400d  ! 6: OR_R	or 	%r5, %r13, %r18
	.word 0xa2116746  ! 6: OR_I	or 	%r5, 0x0746, %r17
	.word 0xbc096591  ! 6: AND_I	and 	%r5, 0x0591, %r30
	.word 0xb401aea9  ! 6: ADD_I	add 	%r6, 0x0ea9, %r26
	.word 0xb210e5de  ! 6: OR_I	or 	%r3, 0x05de, %r25
	.word 0xbc014009  ! 6: ADD_R	add 	%r5, %r9, %r30
	.word 0xa811c009  ! 6: OR_R	or 	%r7, %r9, %r20
	.word 0xb0014009  ! 6: ADD_R	add 	%r5, %r9, %r24
	.word 0xbe09800a  ! 6: AND_R	and 	%r6, %r10, %r31
	.word 0xb210c00c  ! 6: OR_R	or 	%r3, %r12, %r25
	.word 0xaa094009  ! 6: AND_R	and 	%r5, %r9, %r21
	.word 0xbe01c00d  ! 6: ADD_R	add 	%r7, %r13, %r31
	.word 0xb412000e  ! 6: OR_R	or 	%r8, %r14, %r26
	.word 0xa6018009  ! 6: ADD_R	add 	%r6, %r9, %r19
	.word 0xbc0227de  ! 6: ADD_I	add 	%r8, 0x07de, %r30
	.word 0xb401400c  ! 6: ADD_R	add 	%r5, %r12, %r26
	.word 0xb411000b  ! 6: OR_R	or 	%r4, %r11, %r26
	.word 0xbc09400c  ! 6: AND_R	and 	%r5, %r12, %r30
	.word 0xb811000e  ! 6: OR_R	or 	%r4, %r14, %r28
	.word 0xb0096bbe  ! 6: AND_I	and 	%r5, 0x0bbe, %r24
	.word 0xbe08c00c  ! 6: AND_R	and 	%r3, %r12, %r31
	.word 0xb6016c6b  ! 6: ADD_I	add 	%r5, 0x0c6b, %r27
	.word 0xaa096f0d  ! 6: AND_I	and 	%r5, 0x0f0d, %r21
	.word 0xbe08c00d  ! 6: AND_R	and 	%r3, %r13, %r31
	.word 0xa211400c  ! 6: OR_R	or 	%r5, %r12, %r17
	.word 0xba09400e  ! 6: AND_R	and 	%r5, %r14, %r29
	.word 0xa609800a  ! 6: AND_R	and 	%r6, %r10, %r19
	.word 0xa60a2f60  ! 6: AND_I	and 	%r8, 0x0f60, %r19
	.word 0xa801a60b  ! 6: ADD_I	add 	%r6, 0x060b, %r20
	.word 0xb211800b  ! 6: OR_R	or 	%r6, %r11, %r25
	.word 0xa20a2465  ! 6: AND_I	and 	%r8, 0x0465, %r17
	.word 0xa201af0b  ! 6: ADD_I	add 	%r6, 0x0f0b, %r17
	.word 0xac10e7c6  ! 6: OR_I	or 	%r3, 0x07c6, %r22
	.word 0xa412000f  ! 6: OR_R	or 	%r8, %r15, %r18
	.word 0xa4016b3e  ! 6: ADD_I	add 	%r5, 0x0b3e, %r18
	.word 0xba00e7a8  ! 6: ADD_I	add 	%r3, 0x07a8, %r29
	.word 0xac01800e  ! 6: ADD_R	add 	%r6, %r14, %r22
	.word 0xac11602f  ! 6: OR_I	or 	%r5, 0x002f, %r22
	.word 0xb209800a  ! 6: AND_R	and 	%r6, %r10, %r25
	.word 0xb409400f  ! 6: AND_R	and 	%r5, %r15, %r26
	.word 0xb001a08a  ! 6: ADD_I	add 	%r6, 0x008a, %r24
	.word 0xac016954  ! 6: ADD_I	add 	%r5, 0x0954, %r22
	.word 0xb001000a  ! 6: ADD_R	add 	%r4, %r10, %r24
	.word 0xb001e0e2  ! 6: ADD_I	add 	%r7, 0x00e2, %r24
	.word 0xb000c00d  ! 6: ADD_R	add 	%r3, %r13, %r24
	.word 0xb609800f  ! 6: AND_R	and 	%r6, %r15, %r27
	.word 0xb401ea93  ! 6: ADD_I	add 	%r7, 0x0a93, %r26
	.word 0xb602000d  ! 6: ADD_R	add 	%r8, %r13, %r27
	.word 0xb012000d  ! 6: OR_R	or 	%r8, %r13, %r24
	.word 0xae012bf1  ! 6: ADD_I	add 	%r4, 0x0bf1, %r23
	.word 0xb009800b  ! 6: AND_R	and 	%r6, %r11, %r24
	.word 0xb4092fd9  ! 6: AND_I	and 	%r4, 0x0fd9, %r26
	.word 0xb408e06d  ! 6: AND_I	and 	%r3, 0x006d, %r26
	.word 0xbc01800a  ! 6: ADD_R	add 	%r6, %r10, %r30
	.word 0xae10c009  ! 6: OR_R	or 	%r3, %r9, %r23
	.word 0xbc11000d  ! 6: OR_R	or 	%r4, %r13, %r30
	.word 0xa609000d  ! 6: AND_R	and 	%r4, %r13, %r19
	.word 0xa6122f90  ! 6: OR_I	or 	%r8, 0x0f90, %r19
	.word 0xba01800d  ! 6: ADD_R	add 	%r6, %r13, %r29
	.word 0xa408e139  ! 6: AND_I	and 	%r3, 0x0139, %r18
	.word 0xbe09a1a3  ! 6: AND_I	and 	%r6, 0x01a3, %r31
	.word 0xa401800d  ! 6: ADD_R	add 	%r6, %r13, %r18
	.word 0xb801a30d  ! 6: ADD_I	add 	%r6, 0x030d, %r28
	.word 0xa609800c  ! 6: AND_R	and 	%r6, %r12, %r19
	.word 0xa201000a  ! 6: ADD_R	add 	%r4, %r10, %r17
	.word 0xb60a000c  ! 6: AND_R	and 	%r8, %r12, %r27
	.word 0xb011631f  ! 6: OR_I	or 	%r5, 0x031f, %r24
	.word 0xa4012ac6  ! 6: ADD_I	add 	%r4, 0x0ac6, %r18
	.word 0xb401e758  ! 6: ADD_I	add 	%r7, 0x0758, %r26
	.word 0xb410c00d  ! 6: OR_R	or 	%r3, %r13, %r26
	.word 0xaa11400d  ! 6: OR_R	or 	%r5, %r13, %r21
	.word 0xa408edc0  ! 6: AND_I	and 	%r3, 0x0dc0, %r18
	.word 0xaa11ede8  ! 6: OR_I	or 	%r7, 0x0de8, %r21
	.word 0xae11ee20  ! 6: OR_I	or 	%r7, 0x0e20, %r23
	.word 0xaa08c00f  ! 6: AND_R	and 	%r3, %r15, %r21
	.word 0xa800e93b  ! 6: ADD_I	add 	%r3, 0x093b, %r20
	.word 0xac112c06  ! 6: OR_I	or 	%r4, 0x0c06, %r22
	.word 0xbe09800b  ! 6: AND_R	and 	%r6, %r11, %r31
	.word 0xa800e185  ! 6: ADD_I	add 	%r3, 0x0185, %r20
	.word 0xba09000e  ! 6: AND_R	and 	%r4, %r14, %r29
	.word 0xb210e528  ! 6: OR_I	or 	%r3, 0x0528, %r25
	.word 0xbe114009  ! 6: OR_R	or 	%r5, %r9, %r31
	.word 0xb811000c  ! 6: OR_R	or 	%r4, %r12, %r28
	.word 0xa401efc8  ! 6: ADD_I	add 	%r7, 0x0fc8, %r18
	.word 0xb211400b  ! 6: OR_R	or 	%r5, %r11, %r25
	.word 0xb8022992  ! 6: ADD_I	add 	%r8, 0x0992, %r28
	.word 0xa801c00d  ! 6: ADD_R	add 	%r7, %r13, %r20
	.word 0xac11e8f7  ! 6: OR_I	or 	%r7, 0x08f7, %r22
	.word 0xb012250c  ! 6: OR_I	or 	%r8, 0x050c, %r24
	.word 0xbc11400c  ! 6: OR_R	or 	%r5, %r12, %r30
	.word 0xbc11c00b  ! 6: OR_R	or 	%r7, %r11, %r30
	.word 0xba09800b  ! 6: AND_R	and 	%r6, %r11, %r29
	.word 0xb608eb09  ! 6: AND_I	and 	%r3, 0x0b09, %r27
	.word 0xae11e5dc  ! 6: OR_I	or 	%r7, 0x05dc, %r23
	.word 0xa409800a  ! 6: AND_R	and 	%r6, %r10, %r18
	.word 0xae112d43  ! 6: OR_I	or 	%r4, 0x0d43, %r23
	.word 0xba09e8a4  ! 6: AND_I	and 	%r7, 0x08a4, %r29
	.word 0xbe11c00a  ! 6: OR_R	or 	%r7, %r10, %r31
	.word 0xb2112cd2  ! 6: OR_I	or 	%r4, 0x0cd2, %r25
	.word 0xb408c00e  ! 6: AND_R	and 	%r3, %r14, %r26
	.word 0xa209c00b  ! 6: AND_R	and 	%r7, %r11, %r17
	.word 0xa611a70d  ! 6: OR_I	or 	%r6, 0x070d, %r19
	.word 0xb412000a  ! 6: OR_R	or 	%r8, %r10, %r26
	.word 0xb811800a  ! 6: OR_R	or 	%r6, %r10, %r28
	.word 0xba09000d  ! 6: AND_R	and 	%r4, %r13, %r29
	.word 0xb010c00c  ! 6: OR_R	or 	%r3, %r12, %r24
	.word 0xb00a000b  ! 6: AND_R	and 	%r8, %r11, %r24
	.word 0xb611c00a  ! 6: OR_R	or 	%r7, %r10, %r27
	.word 0xba022016  ! 6: ADD_I	add 	%r8, 0x0016, %r29
	.word 0xaa11656b  ! 6: OR_I	or 	%r5, 0x056b, %r21
	.word 0xae10ea28  ! 6: OR_I	or 	%r3, 0x0a28, %r23
	.word 0xaa11e168  ! 6: OR_I	or 	%r7, 0x0168, %r21
	.word 0xac10c00b  ! 6: OR_R	or 	%r3, %r11, %r22
	.word 0xb610e0b5  ! 6: OR_I	or 	%r3, 0x00b5, %r27
	.word 0xa808c009  ! 6: AND_R	and 	%r3, %r9, %r20
	.word 0xb409c00f  ! 6: AND_R	and 	%r7, %r15, %r26
	.word 0xa801c00a  ! 6: ADD_R	add 	%r7, %r10, %r20
	.word 0xb811000f  ! 6: OR_R	or 	%r4, %r15, %r28
	.word 0xa40a2ecf  ! 6: AND_I	and 	%r8, 0x0ecf, %r18
	.word 0xb412000a  ! 6: OR_R	or 	%r8, %r10, %r26
	.word 0xae11800c  ! 6: OR_R	or 	%r6, %r12, %r23
	.word 0xac11a520  ! 6: OR_I	or 	%r6, 0x0520, %r22
	.word 0xba09000a  ! 6: AND_R	and 	%r4, %r10, %r29
	.word 0xa409c009  ! 6: AND_R	and 	%r7, %r9, %r18
	.word 0xa4012e0a  ! 6: ADD_I	add 	%r4, 0x0e0a, %r18
	.word 0xb609400e  ! 6: AND_R	and 	%r5, %r14, %r27
	.word 0xb801800e  ! 6: ADD_R	add 	%r6, %r14, %r28
	.word 0xb412000b  ! 6: OR_R	or 	%r8, %r11, %r26
	.word 0xa20227bd  ! 6: ADD_I	add 	%r8, 0x07bd, %r17
	.word 0xb80a000f  ! 6: AND_R	and 	%r8, %r15, %r28
	.word 0xb609000c  ! 6: AND_R	and 	%r4, %r12, %r27
	.word 0xbc01400c  ! 6: ADD_R	add 	%r5, %r12, %r30
	.word 0xaa01c00f  ! 6: ADD_R	add 	%r7, %r15, %r21
	.word 0xae0128c8  ! 6: ADD_I	add 	%r4, 0x08c8, %r23
	.word 0xba11ea71  ! 6: OR_I	or 	%r7, 0x0a71, %r29
	.word 0xbc08c00e  ! 6: AND_R	and 	%r3, %r14, %r30
	.word 0xbc02000e  ! 6: ADD_R	add 	%r8, %r14, %r30
	.word 0xb409c00a  ! 6: AND_R	and 	%r7, %r10, %r26
	.word 0xa209c00f  ! 6: AND_R	and 	%r7, %r15, %r17
	.word 0xb611400b  ! 6: OR_R	or 	%r5, %r11, %r27
	.word 0xac092a4d  ! 6: AND_I	and 	%r4, 0x0a4d, %r22
	.word 0xb010c00e  ! 6: OR_R	or 	%r3, %r14, %r24
	.word 0xe22223d4  ! 6: STW_I	stw	%r17, [%r8 + 0x03d4]
	.word 0xe631a866  ! 6: STH_I	sth	%r19, [%r6 + 0x0866]
	.word 0xf4722138  ! 6: STX_I	stx	%r26, [%r8 + 0x0138]
	.word 0xf071a178  ! 6: STX_I	stx	%r24, [%r6 + 0x0178]
	.word 0xf02a290a  ! 6: STB_I	stb	%r24, [%r8 + 0x090a]
	.word 0xf621298c  ! 7: STW_I	stw	%r27, [%r4 + 0x098c]
	.word 0xae010045
	.word 0xfc2a2a41  ! 9: STB_I	stb	%r30, [%r8 + 0x0a41]
	.word 0xf829edc1  ! 10: STB_I	stb	%r28, [%r7 + 0x0dc1]
IC_ERR_2:
!$EV error(2,expr(@VA(.MAIN.IC_ERR_2), 16, 16),2,IC_DATA,IR,22,x)
	setx  0x0000000000000250, %r16, %r14
	setx  0x0000000000002fbd, %r16, %r2
	.word 0xaa01000c  ! 12: ADD_R	add 	%r4, %r12, %r21
	.word 0xa4092d2e  ! 12: AND_I	and 	%r4, 0x0d2e, %r18
	.word 0xb201c00c  ! 12: ADD_R	add 	%r7, %r12, %r25
	bne thr2_loop_0
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_1:
	.word 0xb211201f  ! 20: OR_I	or 	%r4, 0x001f, %r25
	.word 0xb602201f  ! 20: ADD_I	add 	%r8, 0x001f, %r27
	.word 0xb809800c  ! 20: AND_R	and 	%r6, %r12, %r28
	.word 0xb8012ec9  ! 20: ADD_I	add 	%r4, 0x0ec9, %r28
	.word 0xb801000f  ! 20: ADD_R	add 	%r4, %r15, %r28
	.word 0xbc00e2a1  ! 20: ADD_I	add 	%r3, 0x02a1, %r30
	.word 0xac11eea1  ! 20: OR_I	or 	%r7, 0x0ea1, %r22
	.word 0xa601000c  ! 20: ADD_R	add 	%r4, %r12, %r19
	.word 0xb001a145  ! 20: ADD_I	add 	%r6, 0x0145, %r24
	.word 0xb809000d  ! 20: AND_R	and 	%r4, %r13, %r28
	.word 0xb201000a  ! 20: ADD_R	add 	%r4, %r10, %r25
	.word 0xba11400a  ! 20: OR_R	or 	%r5, %r10, %r29
	.word 0xb01228c0  ! 20: OR_I	or 	%r8, 0x08c0, %r24
	.word 0xb212000b  ! 20: OR_R	or 	%r8, %r11, %r25
	.word 0xb8122f08  ! 20: OR_I	or 	%r8, 0x0f08, %r28
	.word 0xac112115  ! 20: OR_I	or 	%r4, 0x0115, %r22
	.word 0xa208e28b  ! 20: AND_I	and 	%r3, 0x028b, %r17
	.word 0xb409ae5e  ! 20: AND_I	and 	%r6, 0x0e5e, %r26
	.word 0xbe022eff  ! 20: ADD_I	add 	%r8, 0x0eff, %r31
	.word 0xb611e05d  ! 20: OR_I	or 	%r7, 0x005d, %r27
	.word 0xa4092055  ! 20: AND_I	and 	%r4, 0x0055, %r18
	.word 0xaa09800b  ! 20: AND_R	and 	%r6, %r11, %r21
	.word 0xaa11abd1  ! 20: OR_I	or 	%r6, 0x0bd1, %r21
	.word 0xb412000e  ! 20: OR_R	or 	%r8, %r14, %r26
	.word 0xae01608f  ! 20: ADD_I	add 	%r5, 0x008f, %r23
	.word 0xa8018009  ! 20: ADD_R	add 	%r6, %r9, %r20
	.word 0xb401c00d  ! 20: ADD_R	add 	%r7, %r13, %r26
	.word 0xb2096e11  ! 20: AND_I	and 	%r5, 0x0e11, %r25
	.word 0xb40221cb  ! 20: ADD_I	add 	%r8, 0x01cb, %r26
	.word 0xae01ac77  ! 20: ADD_I	add 	%r6, 0x0c77, %r23
	.word 0xa602000c  ! 20: ADD_R	add 	%r8, %r12, %r19
	.word 0xac11254f  ! 20: OR_I	or 	%r4, 0x054f, %r22
	.word 0xaa01400a  ! 20: ADD_R	add 	%r5, %r10, %r21
	.word 0xac01eabb  ! 20: ADD_I	add 	%r7, 0x0abb, %r22
	.word 0xac00c00b  ! 20: ADD_R	add 	%r3, %r11, %r22
	.word 0xa20a28bb  ! 20: AND_I	and 	%r8, 0x08bb, %r17
	.word 0xb401ecdb  ! 20: ADD_I	add 	%r7, 0x0cdb, %r26
	.word 0xba098009  ! 20: AND_R	and 	%r6, %r9, %r29
	.word 0xa409000a  ! 20: AND_R	and 	%r4, %r10, %r18
	.word 0xbe112ac4  ! 20: OR_I	or 	%r4, 0x0ac4, %r31
	.word 0xa411e046  ! 20: OR_I	or 	%r7, 0x0046, %r18
	.word 0xb00125c1  ! 20: ADD_I	add 	%r4, 0x05c1, %r24
	.word 0xb8120009  ! 20: OR_R	or 	%r8, %r9, %r28
	.word 0xba01c00c  ! 20: ADD_R	add 	%r7, %r12, %r29
	.word 0xaa0a000e  ! 20: AND_R	and 	%r8, %r14, %r21
	.word 0xa611000a  ! 20: OR_R	or 	%r4, %r10, %r19
	.word 0xb201a83e  ! 20: ADD_I	add 	%r6, 0x083e, %r25
	.word 0xa801c00b  ! 20: ADD_R	add 	%r7, %r11, %r20
	.word 0xb011000c  ! 20: OR_R	or 	%r4, %r12, %r24
	.word 0xac01c00f  ! 20: ADD_R	add 	%r7, %r15, %r22
	.word 0xb211800c  ! 20: OR_R	or 	%r6, %r12, %r25
	.word 0xa801a4fc  ! 20: ADD_I	add 	%r6, 0x04fc, %r20
	.word 0xb811e130  ! 20: OR_I	or 	%r7, 0x0130, %r28
	.word 0xb20a000f  ! 20: AND_R	and 	%r8, %r15, %r25
	.word 0xb409ef6e  ! 20: AND_I	and 	%r7, 0x0f6e, %r26
	.word 0xb009a4fe  ! 20: AND_I	and 	%r6, 0x04fe, %r24
	.word 0xb201e473  ! 20: ADD_I	add 	%r7, 0x0473, %r25
	.word 0xb201400c  ! 20: ADD_R	add 	%r5, %r12, %r25
	.word 0xba0a000e  ! 20: AND_R	and 	%r8, %r14, %r29
	.word 0xb80a2380  ! 20: AND_I	and 	%r8, 0x0380, %r28
	.word 0xb4098009  ! 20: AND_R	and 	%r6, %r9, %r26
	.word 0xa2122fa4  ! 20: OR_I	or 	%r8, 0x0fa4, %r17
	.word 0xb4096cc0  ! 20: AND_I	and 	%r5, 0x0cc0, %r26
	.word 0xb600c00d  ! 20: ADD_R	add 	%r3, %r13, %r27
	.word 0xb611c00e  ! 20: OR_R	or 	%r7, %r14, %r27
	.word 0xac022e40  ! 20: ADD_I	add 	%r8, 0x0e40, %r22
	.word 0xb201ef5d  ! 20: ADD_I	add 	%r7, 0x0f5d, %r25
	.word 0xa2092fc0  ! 20: AND_I	and 	%r4, 0x0fc0, %r17
	.word 0xb208ec81  ! 20: AND_I	and 	%r3, 0x0c81, %r25
	.word 0xbe09800b  ! 20: AND_R	and 	%r6, %r11, %r31
	.word 0xb201c00a  ! 20: ADD_R	add 	%r7, %r10, %r25
	.word 0xbc08c00e  ! 20: AND_R	and 	%r3, %r14, %r30
	.word 0xaa09e11c  ! 20: AND_I	and 	%r7, 0x011c, %r21
	.word 0xae11a556  ! 20: OR_I	or 	%r6, 0x0556, %r23
	.word 0xa40220ee  ! 20: ADD_I	add 	%r8, 0x00ee, %r18
	.word 0xae09000b  ! 20: AND_R	and 	%r4, %r11, %r23
	.word 0xb2112f23  ! 20: OR_I	or 	%r4, 0x0f23, %r25
	.word 0xaa10ef8f  ! 20: OR_I	or 	%r3, 0x0f8f, %r21
	.word 0xae11800b  ! 20: OR_R	or 	%r6, %r11, %r23
	.word 0xac096126  ! 20: AND_I	and 	%r5, 0x0126, %r22
	.word 0xa612000b  ! 20: OR_R	or 	%r8, %r11, %r19
	.word 0xa810e1ef  ! 20: OR_I	or 	%r3, 0x01ef, %r20
	.word 0xa401aa88  ! 20: ADD_I	add 	%r6, 0x0a88, %r18
	.word 0xba01000c  ! 20: ADD_R	add 	%r4, %r12, %r29
	.word 0xb211a542  ! 20: OR_I	or 	%r6, 0x0542, %r25
	.word 0xa20967e9  ! 20: AND_I	and 	%r5, 0x07e9, %r17
	.word 0xa6094009  ! 20: AND_R	and 	%r5, %r9, %r19
	.word 0xe629233e  ! 20: STB_I	stb	%r19, [%r4 + 0x033e]
	.word 0xfc722d18  ! 20: STX_I	stx	%r30, [%r8 + 0x0d18]
	.word 0xfa31a52c  ! 20: STH_I	sth	%r29, [%r6 + 0x052c]
	.word 0xf2722958  ! 20: STX_I	stx	%r25, [%r8 + 0x0958]
	.word 0xe2722400  ! 20: STX_I	stx	%r17, [%r8 + 0x0400]
	.word 0xec7121c8  ! 20: STX_I	stx	%r22, [%r4 + 0x01c8]
	.word 0xe2222a94  ! 20: STW_I	stw	%r17, [%r8 + 0x0a94]
DC_ERR_2:
!$EV error(2,expr(@VA(.MAIN.DC_ERR_2), 16, 16),2,DC_DATA,27)
	.word 0xe8196de0  ! 23: LDD_I	ldd	[%r5 + 0x0de0], %r20
	.word 0xba01400f  ! 23: ADD_R	add 	%r5, %r15, %r29
	.word 0xc0f008e2  ! 25: STXA_R	stxa	%r0, [%r0 + %r2] 0x47
IC_ERR_6:
!$EV error(2,expr(@VA(.MAIN.IC_ERR_6), 16, 16),2,IC_DATA,IR,6,x)
	.word 0xe440c00e  ! 27: LDSW_R	ldsw	[%r3 + %r14], %r18
	.word 0xac01acd1  ! 27: ADD_I	add 	%r6, 0x0cd1, %r22
	.word 0xb8092fb7  ! 27: AND_I	and 	%r4, 0x0fb7, %r28
	.word 0xbc01400e  ! 27: ADD_R	add 	%r5, %r14, %r30
	bne thr2_loop_1
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_2:
	.word 0xa6112ae3  ! 33: OR_I	or 	%r4, 0x0ae3, %r19
	.word 0xb2122f50  ! 33: OR_I	or 	%r8, 0x0f50, %r25
	.word 0xaa09400f  ! 33: AND_R	and 	%r5, %r15, %r21
	.word 0xa6116cab  ! 33: OR_I	or 	%r5, 0x0cab, %r19
	.word 0xb209800c  ! 33: AND_R	and 	%r6, %r12, %r25
	.word 0xba00c00c  ! 33: ADD_R	add 	%r3, %r12, %r29
	.word 0xac10e1cf  ! 33: OR_I	or 	%r3, 0x01cf, %r22
	.word 0xb4092ca6  ! 33: AND_I	and 	%r4, 0x0ca6, %r26
	.word 0xae11800e  ! 33: OR_R	or 	%r6, %r14, %r23
	.word 0xb2098009  ! 33: AND_R	and 	%r6, %r9, %r25
	.word 0xbc09a696  ! 33: AND_I	and 	%r6, 0x0696, %r30
	.word 0xb410c00d  ! 33: OR_R	or 	%r3, %r13, %r26
	.word 0xb610e893  ! 33: OR_I	or 	%r3, 0x0893, %r27
	.word 0xac01400c  ! 33: ADD_R	add 	%r5, %r12, %r22
	.word 0xbc01c00d  ! 33: ADD_R	add 	%r7, %r13, %r30
	.word 0xa411a464  ! 33: OR_I	or 	%r6, 0x0464, %r18
	.word 0xaa0969d8  ! 33: AND_I	and 	%r5, 0x09d8, %r21
	.word 0xa611000d  ! 33: OR_R	or 	%r4, %r13, %r19
	.word 0xa201635e  ! 33: ADD_I	add 	%r5, 0x035e, %r17
	.word 0xb009c00b  ! 33: AND_R	and 	%r7, %r11, %r24
	.word 0xb0090009  ! 33: AND_R	and 	%r4, %r9, %r24
	.word 0xaa11a06c  ! 33: OR_I	or 	%r6, 0x006c, %r21
	.word 0xba0a2cc0  ! 33: AND_I	and 	%r8, 0x0cc0, %r29
	.word 0xb202000c  ! 33: ADD_R	add 	%r8, %r12, %r25
	.word 0xae11400f  ! 33: OR_R	or 	%r5, %r15, %r23
	.word 0xb21120b6  ! 33: OR_I	or 	%r4, 0x00b6, %r25
	.word 0xba08c009  ! 33: AND_R	and 	%r3, %r9, %r29
	.word 0xae09400c  ! 33: AND_R	and 	%r5, %r12, %r23
	.word 0xa6012c7c  ! 33: ADD_I	add 	%r4, 0x0c7c, %r19
	.word 0xa211400c  ! 33: OR_R	or 	%r5, %r12, %r17
	.word 0xb008e6ff  ! 33: AND_I	and 	%r3, 0x06ff, %r24
	.word 0xb00a000e  ! 33: AND_R	and 	%r8, %r14, %r24
	.word 0xb600eeb5  ! 33: ADD_I	add 	%r3, 0x0eb5, %r27
	.word 0xac08e38d  ! 33: AND_I	and 	%r3, 0x038d, %r22
	.word 0xac116613  ! 33: OR_I	or 	%r5, 0x0613, %r22
	.word 0xb809400f  ! 33: AND_R	and 	%r5, %r15, %r28
	.word 0xbe11ad59  ! 33: OR_I	or 	%r6, 0x0d59, %r31
	.word 0xb00a0009  ! 33: AND_R	and 	%r8, %r9, %r24
	.word 0xa2022f15  ! 33: ADD_I	add 	%r8, 0x0f15, %r17
	.word 0xaa12000b  ! 33: OR_R	or 	%r8, %r11, %r21
	.word 0xba1167a1  ! 33: OR_I	or 	%r5, 0x07a1, %r29
	.word 0xb2092a11  ! 33: AND_I	and 	%r4, 0x0a11, %r25
	.word 0xb011c00a  ! 33: OR_R	or 	%r7, %r10, %r24
	.word 0xb611e5e9  ! 33: OR_I	or 	%r7, 0x05e9, %r27
	.word 0xb60a211e  ! 33: AND_I	and 	%r8, 0x011e, %r27
	.word 0xba092a5b  ! 33: AND_I	and 	%r4, 0x0a5b, %r29
	.word 0xae01a146  ! 33: ADD_I	add 	%r6, 0x0146, %r23
	.word 0xac0a2175  ! 33: AND_I	and 	%r8, 0x0175, %r22
	.word 0xb209c00b  ! 33: AND_R	and 	%r7, %r11, %r25
	.word 0xb809e79b  ! 33: AND_I	and 	%r7, 0x079b, %r28
	.word 0xb41160b9  ! 33: OR_I	or 	%r5, 0x00b9, %r26
	.word 0xbe10e478  ! 33: OR_I	or 	%r3, 0x0478, %r31
	.word 0xa608e371  ! 33: AND_I	and 	%r3, 0x0371, %r19
	.word 0xb8098009  ! 33: AND_R	and 	%r6, %r9, %r28
	.word 0xaa09e8ca  ! 33: AND_I	and 	%r7, 0x08ca, %r21
	.word 0xaa11400d  ! 33: OR_R	or 	%r5, %r13, %r21
	.word 0xae09af20  ! 33: AND_I	and 	%r6, 0x0f20, %r23
	.word 0xbe09c00c  ! 33: AND_R	and 	%r7, %r12, %r31
	.word 0xba010009  ! 33: ADD_R	add 	%r4, %r9, %r29
	.word 0xba09c009  ! 33: AND_R	and 	%r7, %r9, %r29
	.word 0xbc01800c  ! 33: ADD_R	add 	%r6, %r12, %r30
	.word 0xb601eb3d  ! 33: ADD_I	add 	%r7, 0x0b3d, %r27
	.word 0xb609294c  ! 33: AND_I	and 	%r4, 0x094c, %r27
	.word 0xbe00c00a  ! 33: ADD_R	add 	%r3, %r10, %r31
	.word 0xaa01a3e4  ! 33: ADD_I	add 	%r6, 0x03e4, %r21
	.word 0xb40a2f1f  ! 33: AND_I	and 	%r8, 0x0f1f, %r26
	.word 0xa409800e  ! 33: AND_R	and 	%r6, %r14, %r18
	.word 0xb601c00b  ! 33: ADD_R	add 	%r7, %r11, %r27
	.word 0xa411e4bf  ! 33: OR_I	or 	%r7, 0x04bf, %r18
	.word 0xbe0226ea  ! 33: ADD_I	add 	%r8, 0x06ea, %r31
	.word 0xae0a0009  ! 33: AND_R	and 	%r8, %r9, %r23
	.word 0xa211a41b  ! 33: OR_I	or 	%r6, 0x041b, %r17
	.word 0xb401c00b  ! 33: ADD_R	add 	%r7, %r11, %r26
	.word 0xae016892  ! 33: ADD_I	add 	%r5, 0x0892, %r23
	.word 0xbc12000f  ! 33: OR_R	or 	%r8, %r15, %r30
	.word 0xac012e02  ! 33: ADD_I	add 	%r4, 0x0e02, %r22
	.word 0xaa09400c  ! 33: AND_R	and 	%r5, %r12, %r21
	.word 0xac09000b  ! 33: AND_R	and 	%r4, %r11, %r22
	.word 0xb409ac82  ! 33: AND_I	and 	%r6, 0x0c82, %r26
	.word 0xb608c00e  ! 33: AND_R	and 	%r3, %r14, %r27
	.word 0xb011800f  ! 33: OR_R	or 	%r6, %r15, %r24
	.word 0xaa0a2824  ! 33: AND_I	and 	%r8, 0x0824, %r21
	.word 0xbc09efb9  ! 33: AND_I	and 	%r7, 0x0fb9, %r30
	.word 0xb811ad13  ! 33: OR_I	or 	%r6, 0x0d13, %r28
	.word 0xbc10e461  ! 33: OR_I	or 	%r3, 0x0461, %r30
	.word 0xaa09000f  ! 33: AND_R	and 	%r4, %r15, %r21
	.word 0xa602000a  ! 33: ADD_R	add 	%r8, %r10, %r19
	.word 0xa20a2784  ! 33: AND_I	and 	%r8, 0x0784, %r17
	.word 0xb81163f8  ! 33: OR_I	or 	%r5, 0x03f8, %r28
	.word 0xa8122463  ! 33: OR_I	or 	%r8, 0x0463, %r20
	.word 0xaa11e607  ! 33: OR_I	or 	%r7, 0x0607, %r21
	.word 0xa20a26f5  ! 33: AND_I	and 	%r8, 0x06f5, %r17
	.word 0xbc02000a  ! 33: ADD_R	add 	%r8, %r10, %r30
	.word 0xac0a21e5  ! 33: AND_I	and 	%r8, 0x01e5, %r22
	.word 0xbc09c009  ! 33: AND_R	and 	%r7, %r9, %r30
	.word 0xb808e57f  ! 33: AND_I	and 	%r3, 0x057f, %r28
	.word 0xa809ae08  ! 33: AND_I	and 	%r6, 0x0e08, %r20
	.word 0xae08ec19  ! 33: AND_I	and 	%r3, 0x0c19, %r23
	.word 0xa2096e27  ! 33: AND_I	and 	%r5, 0x0e27, %r17
	.word 0xaa02000f  ! 33: ADD_R	add 	%r8, %r15, %r21
	.word 0xa601000c  ! 33: ADD_R	add 	%r4, %r12, %r19
	.word 0xb00a2827  ! 33: AND_I	and 	%r8, 0x0827, %r24
	.word 0xb4018009  ! 33: ADD_R	add 	%r6, %r9, %r26
	.word 0xaa02000c  ! 33: ADD_R	add 	%r8, %r12, %r21
	.word 0xac01a76b  ! 33: ADD_I	add 	%r6, 0x076b, %r22
	.word 0xa80a0009  ! 33: AND_R	and 	%r8, %r9, %r20
	.word 0xbe0a000e  ! 33: AND_R	and 	%r8, %r14, %r31
	.word 0xaa0a000d  ! 33: AND_R	and 	%r8, %r13, %r21
	.word 0xa601a408  ! 33: ADD_I	add 	%r6, 0x0408, %r19
	.word 0xb411800c  ! 33: OR_R	or 	%r6, %r12, %r26
	.word 0xa401000b  ! 33: ADD_R	add 	%r4, %r11, %r18
	.word 0xaa01a157  ! 33: ADD_I	add 	%r6, 0x0157, %r21
	.word 0xa211000c  ! 33: OR_R	or 	%r4, %r12, %r17
	.word 0xaa110009  ! 33: OR_R	or 	%r4, %r9, %r21
	.word 0xb0020009  ! 33: ADD_R	add 	%r8, %r9, %r24
	.word 0xbe122da8  ! 33: OR_I	or 	%r8, 0x0da8, %r31
	.word 0xb611000b  ! 33: OR_R	or 	%r4, %r11, %r27
	.word 0xba10ed09  ! 33: OR_I	or 	%r3, 0x0d09, %r29
	.word 0xb411000c  ! 33: OR_R	or 	%r4, %r12, %r26
	.word 0xa411eccb  ! 33: OR_I	or 	%r7, 0x0ccb, %r18
	.word 0xaa12000a  ! 33: OR_R	or 	%r8, %r10, %r21
	.word 0xba122691  ! 33: OR_I	or 	%r8, 0x0691, %r29
	.word 0xa4022233  ! 33: ADD_I	add 	%r8, 0x0233, %r18
	.word 0xac010009  ! 33: ADD_R	add 	%r4, %r9, %r22
	.word 0xb001800c  ! 33: ADD_R	add 	%r6, %r12, %r24
	.word 0xa80a2129  ! 33: AND_I	and 	%r8, 0x0129, %r20
	.word 0xbe10ef93  ! 33: OR_I	or 	%r3, 0x0f93, %r31
	.word 0xb6096470  ! 33: AND_I	and 	%r5, 0x0470, %r27
	.word 0xb209400f  ! 33: AND_R	and 	%r5, %r15, %r25
	.word 0xa608c00f  ! 33: AND_R	and 	%r3, %r15, %r19
	.word 0xac11af35  ! 33: OR_I	or 	%r6, 0x0f35, %r22
	.word 0xb01166c1  ! 33: OR_I	or 	%r5, 0x06c1, %r24
	.word 0xbc018009  ! 33: ADD_R	add 	%r6, %r9, %r30
	.word 0xa809c00b  ! 33: AND_R	and 	%r7, %r11, %r20
	.word 0xba1124b6  ! 33: OR_I	or 	%r4, 0x04b6, %r29
	.word 0xac00c00d  ! 33: ADD_R	add 	%r3, %r13, %r22
	.word 0xa208e898  ! 33: AND_I	and 	%r3, 0x0898, %r17
	.word 0xaa10c00e  ! 33: OR_R	or 	%r3, %r14, %r21
	.word 0xa8112c0d  ! 33: OR_I	or 	%r4, 0x0c0d, %r20
	.word 0xb2022ea4  ! 33: ADD_I	add 	%r8, 0x0ea4, %r25
	.word 0xb009a1dc  ! 33: AND_I	and 	%r6, 0x01dc, %r24
	.word 0xba01a1ab  ! 33: ADD_I	add 	%r6, 0x01ab, %r29
	.word 0xa201800a  ! 33: ADD_R	add 	%r6, %r10, %r17
	.word 0xbe08c00a  ! 33: AND_R	and 	%r3, %r10, %r31
	.word 0xbe08eb92  ! 33: AND_I	and 	%r3, 0x0b92, %r31
	.word 0xae12000e  ! 33: OR_R	or 	%r8, %r14, %r23
	.word 0xa209800e  ! 33: AND_R	and 	%r6, %r14, %r17
	.word 0xa801628a  ! 33: ADD_I	add 	%r5, 0x028a, %r20
	.word 0xac020009  ! 33: ADD_R	add 	%r8, %r9, %r22
	.word 0xb609400d  ! 33: AND_R	and 	%r5, %r13, %r27
	.word 0xa611c00f  ! 33: OR_R	or 	%r7, %r15, %r19
	.word 0xb209800e  ! 33: AND_R	and 	%r6, %r14, %r25
	.word 0xb2016297  ! 33: ADD_I	add 	%r5, 0x0297, %r25
	.word 0xbc02000d  ! 33: ADD_R	add 	%r8, %r13, %r30
	.word 0xae08c00d  ! 33: AND_R	and 	%r3, %r13, %r23
	.word 0xb2016b7a  ! 33: ADD_I	add 	%r5, 0x0b7a, %r25
	.word 0xa611000c  ! 33: OR_R	or 	%r4, %r12, %r19
	.word 0xba01800b  ! 33: ADD_R	add 	%r6, %r11, %r29
	.word 0xaa11a0ad  ! 33: OR_I	or 	%r6, 0x00ad, %r21
	.word 0xb409c00d  ! 33: AND_R	and 	%r7, %r13, %r26
	.word 0xb402000e  ! 33: ADD_R	add 	%r8, %r14, %r26
	.word 0xb609c00e  ! 33: AND_R	and 	%r7, %r14, %r27
	.word 0xba012ed7  ! 33: ADD_I	add 	%r4, 0x0ed7, %r29
	.word 0xa609800d  ! 33: AND_R	and 	%r6, %r13, %r19
	.word 0xae0a000f  ! 33: AND_R	and 	%r8, %r15, %r23
	.word 0xae092650  ! 33: AND_I	and 	%r4, 0x0650, %r23
	.word 0xaa11400e  ! 33: OR_R	or 	%r5, %r14, %r21
	.word 0xa2016bf9  ! 33: ADD_I	add 	%r5, 0x0bf9, %r17
	.word 0xa211000f  ! 33: OR_R	or 	%r4, %r15, %r17
	.word 0xa809800f  ! 33: AND_R	and 	%r6, %r15, %r20
	.word 0xa801400f  ! 33: ADD_R	add 	%r5, %r15, %r20
	.word 0xa80a232b  ! 33: AND_I	and 	%r8, 0x032b, %r20
	.word 0xba018009  ! 33: ADD_R	add 	%r6, %r9, %r29
	.word 0xbc0128f4  ! 33: ADD_I	add 	%r4, 0x08f4, %r30
	.word 0xae11800c  ! 33: OR_R	or 	%r6, %r12, %r23
	.word 0xaa092c17  ! 33: AND_I	and 	%r4, 0x0c17, %r21
	.word 0xae00e242  ! 33: ADD_I	add 	%r3, 0x0242, %r23
	.word 0xac0a2c71  ! 33: AND_I	and 	%r8, 0x0c71, %r22
	.word 0xb400c00d  ! 33: ADD_R	add 	%r3, %r13, %r26
	.word 0xb401400a  ! 33: ADD_R	add 	%r5, %r10, %r26
	.word 0xa202000c  ! 33: ADD_R	add 	%r8, %r12, %r17
	.word 0xba11a6b0  ! 33: OR_I	or 	%r6, 0x06b0, %r29
	.word 0xb2022ad5  ! 33: ADD_I	add 	%r8, 0x0ad5, %r25
	.word 0xa412000d  ! 33: OR_R	or 	%r8, %r13, %r18
	.word 0xbc0966ff  ! 33: AND_I	and 	%r5, 0x06ff, %r30
	.word 0xb411ae06  ! 33: OR_I	or 	%r6, 0x0e06, %r26
	.word 0xb610e853  ! 33: OR_I	or 	%r3, 0x0853, %r27
	.word 0xb411400b  ! 33: OR_R	or 	%r5, %r11, %r26
	.word 0xbe08e2d0  ! 33: AND_I	and 	%r3, 0x02d0, %r31
	.word 0xaa0a000e  ! 33: AND_R	and 	%r8, %r14, %r21
	.word 0xa8010009  ! 33: ADD_R	add 	%r4, %r9, %r20
	.word 0xa408e27a  ! 33: AND_I	and 	%r3, 0x027a, %r18
	.word 0xbc00e215  ! 33: ADD_I	add 	%r3, 0x0215, %r30
	.word 0xbc09ee99  ! 33: AND_I	and 	%r7, 0x0e99, %r30
	.word 0xac01a454  ! 33: ADD_I	add 	%r6, 0x0454, %r22
	.word 0xa811c00e  ! 33: OR_R	or 	%r7, %r14, %r20
	.word 0xa400eeb4  ! 33: ADD_I	add 	%r3, 0x0eb4, %r18
	.word 0xae092ba7  ! 33: AND_I	and 	%r4, 0x0ba7, %r23
	.word 0xac09400b  ! 33: AND_R	and 	%r5, %r11, %r22
	.word 0xa410c00a  ! 33: OR_R	or 	%r3, %r10, %r18
	.word 0xb401619d  ! 33: ADD_I	add 	%r5, 0x019d, %r26
	.word 0xac11000c  ! 33: OR_R	or 	%r4, %r12, %r22
	.word 0xb611a4f2  ! 33: OR_I	or 	%r6, 0x04f2, %r27
	.word 0xa811c00d  ! 33: OR_R	or 	%r7, %r13, %r20
	.word 0xb811400f  ! 33: OR_R	or 	%r5, %r15, %r28
	.word 0xbc00e11e  ! 33: ADD_I	add 	%r3, 0x011e, %r30
	.word 0xb409a128  ! 33: AND_I	and 	%r6, 0x0128, %r26
	.word 0xa402000a  ! 33: ADD_R	add 	%r8, %r10, %r18
	.word 0xa8096fce  ! 33: AND_I	and 	%r5, 0x0fce, %r20
	.word 0xac122318  ! 33: OR_I	or 	%r8, 0x0318, %r22
	.word 0xb001a65a  ! 33: ADD_I	add 	%r6, 0x065a, %r24
	.word 0xa601e6a7  ! 33: ADD_I	add 	%r7, 0x06a7, %r19
	.word 0xae01400e  ! 33: ADD_R	add 	%r5, %r14, %r23
	.word 0xa212000f  ! 33: OR_R	or 	%r8, %r15, %r17
	.word 0xba11000c  ! 33: OR_R	or 	%r4, %r12, %r29
	.word 0xec216c10  ! 33: STW_I	stw	%r22, [%r5 + 0x0c10]
	.word 0xe871a738  ! 33: STX_I	stx	%r20, [%r6 + 0x0738]
	.word 0xf6712b40  ! 33: STX_I	stx	%r27, [%r4 + 0x0b40]
	.word 0xf2292734  ! 33: STB_I	stb	%r25, [%r4 + 0x0734]
	.word 0xfe29e029  ! 33: STB_I	stb	%r31, [%r7 + 0x0029]
	.word 0xee29ac76  ! 35: STB_I	stb	%r23, [%r6 + 0x0c76]
	.word 0xad31e001  ! 36: SRL_I	srl 	%r7, 0x0001, %r22
	.word 0xf271ac18  ! 37: STX_I	stx	%r25, [%r6 + 0x0c18]
IC_ERR_10:
!$EV error(2,expr(@VA(.MAIN.IC_ERR_10), 16, 16),1,IC_DATA,IR,9,x)
	.word 0xe431a7f6  ! 39: STH_I	sth	%r18, [%r6 + 0x07f6]
	.word 0xec51680c  ! 40: LDSH_I	ldsh	[%r5 + 0x080c], %r22
	.word 0xb40a0009  ! 40: AND_R	and 	%r8, %r9, %r26
	.word 0xac01000c  ! 40: ADD_R	add 	%r4, %r12, %r22
	.word 0xaa01249b  ! 40: ADD_I	add 	%r4, 0x049b, %r21
	bne thr2_loop_2
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_3:
	.word 0xa809800a  ! 46: AND_R	and 	%r6, %r10, %r20
	.word 0xa801400a  ! 46: ADD_R	add 	%r5, %r10, %r20
	.word 0xaa09a56c  ! 46: AND_I	and 	%r6, 0x056c, %r21
	.word 0xb800e938  ! 46: ADD_I	add 	%r3, 0x0938, %r28
	.word 0xbe11a8f0  ! 46: OR_I	or 	%r6, 0x08f0, %r31
	.word 0xbc09ed81  ! 46: AND_I	and 	%r7, 0x0d81, %r30
	.word 0xb211400b  ! 46: OR_R	or 	%r5, %r11, %r25
	.word 0xa80a2f0b  ! 46: AND_I	and 	%r8, 0x0f0b, %r20
	.word 0xba01e64f  ! 46: ADD_I	add 	%r7, 0x064f, %r29
	.word 0xbc0125c8  ! 46: ADD_I	add 	%r4, 0x05c8, %r30
	.word 0xae11400b  ! 46: OR_R	or 	%r5, %r11, %r23
	.word 0xbc0a28eb  ! 46: AND_I	and 	%r8, 0x08eb, %r30
	.word 0xae08c00f  ! 46: AND_R	and 	%r3, %r15, %r23
	.word 0xac11800b  ! 46: OR_R	or 	%r6, %r11, %r22
	.word 0xb600c00a  ! 46: ADD_R	add 	%r3, %r10, %r27
	.word 0xaa0128a9  ! 46: ADD_I	add 	%r4, 0x08a9, %r21
	.word 0xac0a21c1  ! 46: AND_I	and 	%r8, 0x01c1, %r22
	.word 0xb609400c  ! 46: AND_R	and 	%r5, %r12, %r27
	.word 0xb608e3d1  ! 46: AND_I	and 	%r3, 0x03d1, %r27
	.word 0xb00a000d  ! 46: AND_R	and 	%r8, %r13, %r24
	.word 0xac11e09b  ! 46: OR_I	or 	%r7, 0x009b, %r22
	.word 0xa802000d  ! 46: ADD_R	add 	%r8, %r13, %r20
	.word 0xb801eb5c  ! 46: ADD_I	add 	%r7, 0x0b5c, %r28
	.word 0xba01608b  ! 46: ADD_I	add 	%r5, 0x008b, %r29
	.word 0xb210c00d  ! 46: OR_R	or 	%r3, %r13, %r25
	.word 0xac12000d  ! 46: OR_R	or 	%r8, %r13, %r22
	.word 0xb8114009  ! 46: OR_R	or 	%r5, %r9, %r28
	.word 0xb401800d  ! 46: ADD_R	add 	%r6, %r13, %r26
	.word 0xa209a41e  ! 46: AND_I	and 	%r6, 0x041e, %r17
	.word 0xaa00c00e  ! 46: ADD_R	add 	%r3, %r14, %r21
	.word 0xb800ebc9  ! 46: ADD_I	add 	%r3, 0x0bc9, %r28
	.word 0xaa11a41f  ! 46: OR_I	or 	%r6, 0x041f, %r21
	.word 0xb011400e  ! 46: OR_R	or 	%r5, %r14, %r24
	.word 0xa4010009  ! 46: ADD_R	add 	%r4, %r9, %r18
	.word 0xb81123a7  ! 46: OR_I	or 	%r4, 0x03a7, %r28
	.word 0xba11c00d  ! 46: OR_R	or 	%r7, %r13, %r29
	.word 0xa609c00f  ! 46: AND_R	and 	%r7, %r15, %r19
	.word 0xb800c00f  ! 46: ADD_R	add 	%r3, %r15, %r28
	.word 0xaa112f9a  ! 46: OR_I	or 	%r4, 0x0f9a, %r21
	.word 0xba116c7c  ! 46: OR_I	or 	%r5, 0x0c7c, %r29
	.word 0xa60227a9  ! 46: ADD_I	add 	%r8, 0x07a9, %r19
	.word 0xa8016a24  ! 46: ADD_I	add 	%r5, 0x0a24, %r20
	.word 0xb409000e  ! 46: AND_R	and 	%r4, %r14, %r26
	.word 0xbc12000f  ! 46: OR_R	or 	%r8, %r15, %r30
	.word 0xba0960dd  ! 46: AND_I	and 	%r5, 0x00dd, %r29
	.word 0xa409a80e  ! 46: AND_I	and 	%r6, 0x080e, %r18
	.word 0xb209400d  ! 46: AND_R	and 	%r5, %r13, %r25
	.word 0xbc10c00a  ! 46: OR_R	or 	%r3, %r10, %r30
	.word 0xba09c00d  ! 46: AND_R	and 	%r7, %r13, %r29
	.word 0xbc12000e  ! 46: OR_R	or 	%r8, %r14, %r30
	.word 0xba01e23b  ! 46: ADD_I	add 	%r7, 0x023b, %r29
	.word 0xb2022933  ! 46: ADD_I	add 	%r8, 0x0933, %r25
	.word 0xa610ecf9  ! 46: OR_I	or 	%r3, 0x0cf9, %r19
	.word 0xba016cdf  ! 46: ADD_I	add 	%r5, 0x0cdf, %r29
	.word 0xba096062  ! 46: AND_I	and 	%r5, 0x0062, %r29
	.word 0xa2012664  ! 46: ADD_I	add 	%r4, 0x0664, %r17
	.word 0xbe11400c  ! 46: OR_R	or 	%r5, %r12, %r31
	.word 0xbc09adf8  ! 46: AND_I	and 	%r6, 0x0df8, %r30
	.word 0xb611000c  ! 46: OR_R	or 	%r4, %r12, %r27
	.word 0xac02000a  ! 46: ADD_R	add 	%r8, %r10, %r22
	.word 0xb811000c  ! 46: OR_R	or 	%r4, %r12, %r28
	.word 0xb611000b  ! 46: OR_R	or 	%r4, %r11, %r27
	.word 0xb201e4da  ! 46: ADD_I	add 	%r7, 0x04da, %r25
	.word 0xa61123fa  ! 46: OR_I	or 	%r4, 0x03fa, %r19
	.word 0xb601e233  ! 46: ADD_I	add 	%r7, 0x0233, %r27
	.word 0xba0221ed  ! 46: ADD_I	add 	%r8, 0x01ed, %r29
	.word 0xb811a950  ! 46: OR_I	or 	%r6, 0x0950, %r28
	.word 0xb6010009  ! 46: ADD_R	add 	%r4, %r9, %r27
	.word 0xa811c00c  ! 46: OR_R	or 	%r7, %r12, %r20
	.word 0xb212000b  ! 46: OR_R	or 	%r8, %r11, %r25
	.word 0xb2016fd7  ! 46: ADD_I	add 	%r5, 0x0fd7, %r25
	.word 0xbe09800d  ! 46: AND_R	and 	%r6, %r13, %r31
	.word 0xa211a708  ! 46: OR_I	or 	%r6, 0x0708, %r17
	.word 0xac01ea56  ! 46: ADD_I	add 	%r7, 0x0a56, %r22
	.word 0xa801800a  ! 46: ADD_R	add 	%r6, %r10, %r20
	.word 0xa609c00a  ! 46: AND_R	and 	%r7, %r10, %r19
	.word 0xa4122969  ! 46: OR_I	or 	%r8, 0x0969, %r18
	.word 0xba11400e  ! 46: OR_R	or 	%r5, %r14, %r29
	.word 0xae1220b2  ! 46: OR_I	or 	%r8, 0x00b2, %r23
	.word 0xb209e849  ! 46: AND_I	and 	%r7, 0x0849, %r25
	.word 0xb011800c  ! 46: OR_R	or 	%r6, %r12, %r24
	.word 0xa201a97d  ! 46: ADD_I	add 	%r6, 0x097d, %r17
	.word 0xa411e5a7  ! 46: OR_I	or 	%r7, 0x05a7, %r18
	.word 0xbc08c00a  ! 46: AND_R	and 	%r3, %r10, %r30
	.word 0xaa09400e  ! 46: AND_R	and 	%r5, %r14, %r21
	.word 0xa4096396  ! 46: AND_I	and 	%r5, 0x0396, %r18
	.word 0xb009000c  ! 46: AND_R	and 	%r4, %r12, %r24
	.word 0xae11ed52  ! 46: OR_I	or 	%r7, 0x0d52, %r23
	.word 0xa408e923  ! 46: AND_I	and 	%r3, 0x0923, %r18
	.word 0xa201ee5c  ! 46: ADD_I	add 	%r7, 0x0e5c, %r17
	.word 0xba02277c  ! 46: ADD_I	add 	%r8, 0x077c, %r29
	.word 0xa611c00a  ! 46: OR_R	or 	%r7, %r10, %r19
	.word 0xba01c00f  ! 46: ADD_R	add 	%r7, %r15, %r29
	.word 0xa4016df4  ! 46: ADD_I	add 	%r5, 0x0df4, %r18
	.word 0xa4016b88  ! 46: ADD_I	add 	%r5, 0x0b88, %r18
	.word 0xa401c009  ! 46: ADD_R	add 	%r7, %r9, %r18
	.word 0xb4012461  ! 46: ADD_I	add 	%r4, 0x0461, %r26
	.word 0xac01000e  ! 46: ADD_R	add 	%r4, %r14, %r22
	.word 0xba01624b  ! 46: ADD_I	add 	%r5, 0x024b, %r29
	.word 0xaa10c00d  ! 46: OR_R	or 	%r3, %r13, %r21
	.word 0xba01400a  ! 46: ADD_R	add 	%r5, %r10, %r29
	.word 0xa2098009  ! 46: AND_R	and 	%r6, %r9, %r17
	.word 0xa611c00a  ! 46: OR_R	or 	%r7, %r10, %r19
	.word 0xb008c00c  ! 46: AND_R	and 	%r3, %r12, %r24
	.word 0xb20a000c  ! 46: AND_R	and 	%r8, %r12, %r25
	.word 0xa2010009  ! 46: ADD_R	add 	%r4, %r9, %r17
	.word 0xbc11800b  ! 46: OR_R	or 	%r6, %r11, %r30
	.word 0xbc112845  ! 46: OR_I	or 	%r4, 0x0845, %r30
	.word 0xb402000d  ! 46: ADD_R	add 	%r8, %r13, %r26
	.word 0xb601e992  ! 46: ADD_I	add 	%r7, 0x0992, %r27
	.word 0xa202000c  ! 46: ADD_R	add 	%r8, %r12, %r17
	.word 0xa802000b  ! 46: ADD_R	add 	%r8, %r11, %r20
	.word 0xa8112cbe  ! 46: OR_I	or 	%r4, 0x0cbe, %r20
	.word 0xb8122709  ! 46: OR_I	or 	%r8, 0x0709, %r28
	.word 0xa411c00d  ! 46: OR_R	or 	%r7, %r13, %r18
	.word 0xb201228d  ! 46: ADD_I	add 	%r4, 0x028d, %r25
	.word 0xb611c00f  ! 46: OR_R	or 	%r7, %r15, %r27
	.word 0xaa10c00c  ! 46: OR_R	or 	%r3, %r12, %r21
	.word 0xb409800d  ! 46: AND_R	and 	%r6, %r13, %r26
	.word 0xb010c00e  ! 46: OR_R	or 	%r3, %r14, %r24
	.word 0xae11e6b2  ! 46: OR_I	or 	%r7, 0x06b2, %r23
	.word 0xb009c00b  ! 46: AND_R	and 	%r7, %r11, %r24
	.word 0xb40923e2  ! 46: AND_I	and 	%r4, 0x03e2, %r26
	.word 0xb80968cb  ! 46: AND_I	and 	%r5, 0x08cb, %r28
	.word 0xaa01000b  ! 46: ADD_R	add 	%r4, %r11, %r21
	.word 0xb601a27f  ! 46: ADD_I	add 	%r6, 0x027f, %r27
	.word 0xb410e39f  ! 46: OR_I	or 	%r3, 0x039f, %r26
	.word 0xbc01400c  ! 46: ADD_R	add 	%r5, %r12, %r30
	.word 0xac00c00d  ! 46: ADD_R	add 	%r3, %r13, %r22
	.word 0xa6094009  ! 46: AND_R	and 	%r5, %r9, %r19
	.word 0xaa11000f  ! 46: OR_R	or 	%r4, %r15, %r21
	.word 0xba00c009  ! 46: ADD_R	add 	%r3, %r9, %r29
	.word 0xae0a2687  ! 46: AND_I	and 	%r8, 0x0687, %r23
	.word 0xb601c00d  ! 46: ADD_R	add 	%r7, %r13, %r27
	.word 0xa211c009  ! 46: OR_R	or 	%r7, %r9, %r17
	.word 0xa801e706  ! 46: ADD_I	add 	%r7, 0x0706, %r20
	.word 0xb600c009  ! 46: ADD_R	add 	%r3, %r9, %r27
	.word 0xa401658b  ! 46: ADD_I	add 	%r5, 0x058b, %r18
	.word 0xbc01acf9  ! 46: ADD_I	add 	%r6, 0x0cf9, %r30
	.word 0xb001800a  ! 46: ADD_R	add 	%r6, %r10, %r24
	.word 0xb601a051  ! 46: ADD_I	add 	%r6, 0x0051, %r27
	.word 0xb60a2b88  ! 46: AND_I	and 	%r8, 0x0b88, %r27
	.word 0xac020009  ! 46: ADD_R	add 	%r8, %r9, %r22
	.word 0xbc11e5bd  ! 46: OR_I	or 	%r7, 0x05bd, %r30
	.word 0xae01c00b  ! 46: ADD_R	add 	%r7, %r11, %r23
	.word 0xb808ebe6  ! 46: AND_I	and 	%r3, 0x0be6, %r28
	.word 0xb202000e  ! 46: ADD_R	add 	%r8, %r14, %r25
	.word 0xb411e1f5  ! 46: OR_I	or 	%r7, 0x01f5, %r26
	.word 0xb601e247  ! 46: ADD_I	add 	%r7, 0x0247, %r27
	.word 0xb610e17a  ! 46: OR_I	or 	%r3, 0x017a, %r27
	.word 0xb801ec8e  ! 46: ADD_I	add 	%r7, 0x0c8e, %r28
	.word 0xbe01c00f  ! 46: ADD_R	add 	%r7, %r15, %r31
	.word 0xb809c00c  ! 46: AND_R	and 	%r7, %r12, %r28
	.word 0xb001661a  ! 46: ADD_I	add 	%r5, 0x061a, %r24
	.word 0xb20a2dd5  ! 46: AND_I	and 	%r8, 0x0dd5, %r25
	.word 0xb2122d44  ! 46: OR_I	or 	%r8, 0x0d44, %r25
	.word 0xac11a215  ! 46: OR_I	or 	%r6, 0x0215, %r22
	.word 0xb6122a5b  ! 46: OR_I	or 	%r8, 0x0a5b, %r27
	.word 0xba09400d  ! 46: AND_R	and 	%r5, %r13, %r29
	.word 0xbc08c00f  ! 46: AND_R	and 	%r3, %r15, %r30
	.word 0xbc0a212c  ! 46: AND_I	and 	%r8, 0x012c, %r30
	.word 0xba01800e  ! 46: ADD_R	add 	%r6, %r14, %r29
	.word 0xb611000b  ! 46: OR_R	or 	%r4, %r11, %r27
	.word 0xb2092fcc  ! 46: AND_I	and 	%r4, 0x0fcc, %r25
	.word 0xa211250a  ! 46: OR_I	or 	%r4, 0x050a, %r17
	.word 0xaa00c00e  ! 46: ADD_R	add 	%r3, %r14, %r21
	.word 0xa401200f  ! 46: ADD_I	add 	%r4, 0x000f, %r18
	.word 0xaa11647c  ! 46: OR_I	or 	%r5, 0x047c, %r21
	.word 0xa809000b  ! 46: AND_R	and 	%r4, %r11, %r20
	.word 0xae01800b  ! 46: ADD_R	add 	%r6, %r11, %r23
	.word 0xaa09800e  ! 46: AND_R	and 	%r6, %r14, %r21
	.word 0xaa10c00a  ! 46: OR_R	or 	%r3, %r10, %r21
	.word 0xb809c00b  ! 46: AND_R	and 	%r7, %r11, %r28
	.word 0xb608c00d  ! 46: AND_R	and 	%r3, %r13, %r27
	.word 0xbc112871  ! 46: OR_I	or 	%r4, 0x0871, %r30
	.word 0xb600c00e  ! 46: ADD_R	add 	%r3, %r14, %r27
	.word 0xa400c00f  ! 46: ADD_R	add 	%r3, %r15, %r18
	.word 0xa410ec63  ! 46: OR_I	or 	%r3, 0x0c63, %r18
	.word 0xa6096a1e  ! 46: AND_I	and 	%r5, 0x0a1e, %r19
	.word 0xb209000e  ! 46: AND_R	and 	%r4, %r14, %r25
	.word 0xae01c00d  ! 46: ADD_R	add 	%r7, %r13, %r23
	.word 0xb8096b1d  ! 46: AND_I	and 	%r5, 0x0b1d, %r28
	.word 0xbc09400e  ! 46: AND_R	and 	%r5, %r14, %r30
	.word 0xb200e520  ! 46: ADD_I	add 	%r3, 0x0520, %r25
	.word 0xa4092fea  ! 46: AND_I	and 	%r4, 0x0fea, %r18
	.word 0xa80a219e  ! 46: AND_I	and 	%r8, 0x019e, %r20
	.word 0xbe12200d  ! 46: OR_I	or 	%r8, 0x000d, %r31
	.word 0xac02000a  ! 46: ADD_R	add 	%r8, %r10, %r22
	.word 0xb211800e  ! 46: OR_R	or 	%r6, %r14, %r25
	.word 0xa400e6c6  ! 46: ADD_I	add 	%r3, 0x06c6, %r18
	.word 0xac02000a  ! 46: ADD_R	add 	%r8, %r10, %r22
	.word 0xa8092d34  ! 46: AND_I	and 	%r4, 0x0d34, %r20
	.word 0xa811800e  ! 46: OR_R	or 	%r6, %r14, %r20
	.word 0xa411800b  ! 46: OR_R	or 	%r6, %r11, %r18
	.word 0xb21128ca  ! 46: OR_I	or 	%r4, 0x08ca, %r25
	.word 0xbc09af9b  ! 46: AND_I	and 	%r6, 0x0f9b, %r30
	.word 0xb210e01e  ! 46: OR_I	or 	%r3, 0x001e, %r25
	.word 0xbe10e784  ! 46: OR_I	or 	%r3, 0x0784, %r31
	.word 0xb809800e  ! 46: AND_R	and 	%r6, %r14, %r28
	.word 0xf6292933  ! 46: STB_I	stb	%r27, [%r4 + 0x0933]
	.word 0xf030e0de  ! 46: STH_I	sth	%r24, [%r3 + 0x00de]
	.word 0xec70ee08  ! 46: STX_I	stx	%r22, [%r3 + 0x0e08]
	.word 0xec32222c  ! 46: STH_I	sth	%r22, [%r8 + 0x022c]
	.word 0xe87123b0  ! 46: STX_I	stx	%r20, [%r4 + 0x03b0]
	.word 0xe22a2dca  ! 47: STB_I	stb	%r17, [%r8 + 0x0dca]
	.word 0xae010045
	.word 0xfc216990  ! 49: STW_I	stw	%r30, [%r5 + 0x0990]
	.word 0xee31a79e  ! 50: STH_I	sth	%r23, [%r6 + 0x079e]
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xb40a2291  ! 51: AND_I	and 	%r8, 0x0291, %r26
	.word 0xb0096325  ! 51: AND_I	and 	%r5, 0x0325, %r24
	.word 0xa809a73b  ! 51: AND_I	and 	%r6, 0x073b, %r20
	bne thr2_loop_3
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_4:
	.word 0xa209a508  ! 57: AND_I	and 	%r6, 0x0508, %r17
	.word 0xb011ecfc  ! 57: OR_I	or 	%r7, 0x0cfc, %r24
	.word 0xa60a2143  ! 57: AND_I	and 	%r8, 0x0143, %r19
	.word 0xb8096d2d  ! 57: AND_I	and 	%r5, 0x0d2d, %r28
	.word 0xa20963af  ! 57: AND_I	and 	%r5, 0x03af, %r17
	.word 0xaa012cf9  ! 57: ADD_I	add 	%r4, 0x0cf9, %r21
	.word 0xa8010009  ! 57: ADD_R	add 	%r4, %r9, %r20
	.word 0xbe01000a  ! 57: ADD_R	add 	%r4, %r10, %r31
	.word 0xba11800f  ! 57: OR_R	or 	%r6, %r15, %r29
	.word 0xa602000d  ! 57: ADD_R	add 	%r8, %r13, %r19
	.word 0xac11a155  ! 57: OR_I	or 	%r6, 0x0155, %r22
	.word 0xac122c78  ! 57: OR_I	or 	%r8, 0x0c78, %r22
	.word 0xb800c00c  ! 57: ADD_R	add 	%r3, %r12, %r28
	.word 0xae08c009  ! 57: AND_R	and 	%r3, %r9, %r23
	.word 0xa4112607  ! 57: OR_I	or 	%r4, 0x0607, %r18
	.word 0xb209c00b  ! 57: AND_R	and 	%r7, %r11, %r25
	.word 0xa609207e  ! 57: AND_I	and 	%r4, 0x007e, %r19
	.word 0xaa00e8fc  ! 57: ADD_I	add 	%r3, 0x08fc, %r21
	.word 0xaa10c00e  ! 57: OR_R	or 	%r3, %r14, %r21
	.word 0xa201000c  ! 57: ADD_R	add 	%r4, %r12, %r17
	.word 0xac12000a  ! 57: OR_R	or 	%r8, %r10, %r22
	.word 0xa2016499  ! 57: ADD_I	add 	%r5, 0x0499, %r17
	.word 0xb800e99e  ! 57: ADD_I	add 	%r3, 0x099e, %r28
	.word 0xb8012e3e  ! 57: ADD_I	add 	%r4, 0x0e3e, %r28
	.word 0xb20a000d  ! 57: AND_R	and 	%r8, %r13, %r25
	.word 0xba11e464  ! 57: OR_I	or 	%r7, 0x0464, %r29
	.word 0xa210c00e  ! 57: OR_R	or 	%r3, %r14, %r17
	.word 0xb00a241a  ! 57: AND_I	and 	%r8, 0x041a, %r24
	.word 0xb809000d  ! 57: AND_R	and 	%r4, %r13, %r28
	.word 0xb0012d7c  ! 57: ADD_I	add 	%r4, 0x0d7c, %r24
	.word 0xb410c00e  ! 57: OR_R	or 	%r3, %r14, %r26
	.word 0xae11603f  ! 57: OR_I	or 	%r5, 0x003f, %r23
	.word 0xba10e270  ! 57: OR_I	or 	%r3, 0x0270, %r29
	.word 0xa808c00d  ! 57: AND_R	and 	%r3, %r13, %r20
	.word 0xa611000a  ! 57: OR_R	or 	%r4, %r10, %r19
	.word 0xb409000a  ! 57: AND_R	and 	%r4, %r10, %r26
	.word 0xaa118009  ! 57: OR_R	or 	%r6, %r9, %r21
	.word 0xb80a2971  ! 57: AND_I	and 	%r8, 0x0971, %r28
	.word 0xb208ec43  ! 57: AND_I	and 	%r3, 0x0c43, %r25
	.word 0xa211400c  ! 57: OR_R	or 	%r5, %r12, %r17
	.word 0xbc00ec77  ! 57: ADD_I	add 	%r3, 0x0c77, %r30
	.word 0xae11e306  ! 57: OR_I	or 	%r7, 0x0306, %r23
	.word 0xa801c00c  ! 57: ADD_R	add 	%r7, %r12, %r20
	.word 0xac01000b  ! 57: ADD_R	add 	%r4, %r11, %r22
	.word 0xae09000e  ! 57: AND_R	and 	%r4, %r14, %r23
	.word 0xa201800d  ! 57: ADD_R	add 	%r6, %r13, %r17
	.word 0xaa09c00b  ! 57: AND_R	and 	%r7, %r11, %r21
	.word 0xae11000b  ! 57: OR_R	or 	%r4, %r11, %r23
	.word 0xa211e886  ! 57: OR_I	or 	%r7, 0x0886, %r17
	.word 0xa801a5d9  ! 57: ADD_I	add 	%r6, 0x05d9, %r20
	.word 0xb6096a13  ! 57: AND_I	and 	%r5, 0x0a13, %r27
	.word 0xa80966da  ! 57: AND_I	and 	%r5, 0x06da, %r20
	.word 0xb609e25a  ! 57: AND_I	and 	%r7, 0x025a, %r27
	.word 0xb201e2aa  ! 57: ADD_I	add 	%r7, 0x02aa, %r25
	.word 0xb0016ee9  ! 57: ADD_I	add 	%r5, 0x0ee9, %r24
	.word 0xbe120009  ! 57: OR_R	or 	%r8, %r9, %r31
	.word 0xbc08c00a  ! 57: AND_R	and 	%r3, %r10, %r30
	.word 0xa401edfb  ! 57: ADD_I	add 	%r7, 0x0dfb, %r18
	.word 0xaa00e7bc  ! 57: ADD_I	add 	%r3, 0x07bc, %r21
	.word 0xb201800b  ! 57: ADD_R	add 	%r6, %r11, %r25
	.word 0xa201800e  ! 57: ADD_R	add 	%r6, %r14, %r17
	.word 0xb409c00c  ! 57: AND_R	and 	%r7, %r12, %r26
	.word 0xb809800d  ! 57: AND_R	and 	%r6, %r13, %r28
	.word 0xbc08c00d  ! 57: AND_R	and 	%r3, %r13, %r30
	.word 0xa209000b  ! 57: AND_R	and 	%r4, %r11, %r17
	.word 0xbc09aaab  ! 57: AND_I	and 	%r6, 0x0aab, %r30
	.word 0xb610e763  ! 57: OR_I	or 	%r3, 0x0763, %r27
	.word 0xb61169db  ! 57: OR_I	or 	%r5, 0x09db, %r27
	.word 0xac09000e  ! 57: AND_R	and 	%r4, %r14, %r22
	.word 0xa80122a8  ! 57: ADD_I	add 	%r4, 0x02a8, %r20
	.word 0xa201000b  ! 57: ADD_R	add 	%r4, %r11, %r17
	.word 0xbc022500  ! 57: ADD_I	add 	%r8, 0x0500, %r30
	.word 0xb210ef11  ! 57: OR_I	or 	%r3, 0x0f11, %r25
	.word 0xbe1125cf  ! 57: OR_I	or 	%r4, 0x05cf, %r31
	.word 0xb001ac79  ! 57: ADD_I	add 	%r6, 0x0c79, %r24
	.word 0xb00a000a  ! 57: AND_R	and 	%r8, %r10, %r24
	.word 0xb4122c11  ! 57: OR_I	or 	%r8, 0x0c11, %r26
	.word 0xa401e9f7  ! 57: ADD_I	add 	%r7, 0x09f7, %r18
	.word 0xa400c00b  ! 57: ADD_R	add 	%r3, %r11, %r18
	.word 0xb609400b  ! 57: AND_R	and 	%r5, %r11, %r27
	.word 0xa811800f  ! 57: OR_R	or 	%r6, %r15, %r20
	.word 0xa80a2b17  ! 57: AND_I	and 	%r8, 0x0b17, %r20
	.word 0xb001800c  ! 57: ADD_R	add 	%r6, %r12, %r24
	.word 0xa2020009  ! 57: ADD_R	add 	%r8, %r9, %r17
	.word 0xa411000d  ! 57: OR_R	or 	%r4, %r13, %r18
	.word 0xa8094009  ! 57: AND_R	and 	%r5, %r9, %r20
	.word 0xb2016d64  ! 57: ADD_I	add 	%r5, 0x0d64, %r25
	.word 0xb6022fc4  ! 57: ADD_I	add 	%r8, 0x0fc4, %r27
	.word 0xb6010009  ! 57: ADD_R	add 	%r4, %r9, %r27
	.word 0xb410c00e  ! 57: OR_R	or 	%r3, %r14, %r26
	.word 0xba11e703  ! 57: OR_I	or 	%r7, 0x0703, %r29
	.word 0xb211400f  ! 57: OR_R	or 	%r5, %r15, %r25
	.word 0xa211ef5b  ! 57: OR_I	or 	%r7, 0x0f5b, %r17
	.word 0xac0a000d  ! 57: AND_R	and 	%r8, %r13, %r22
	.word 0xa611800c  ! 57: OR_R	or 	%r6, %r12, %r19
	.word 0xb601400a  ! 57: ADD_R	add 	%r5, %r10, %r27
	.word 0xb600ebec  ! 57: ADD_I	add 	%r3, 0x0bec, %r27
	.word 0xbc09000b  ! 57: AND_R	and 	%r4, %r11, %r30
	.word 0xa412286f  ! 57: OR_I	or 	%r8, 0x086f, %r18
	.word 0xb809000b  ! 57: AND_R	and 	%r4, %r11, %r28
	.word 0xae10c009  ! 57: OR_R	or 	%r3, %r9, %r23
	.word 0xa409000c  ! 57: AND_R	and 	%r4, %r12, %r18
	.word 0xb601e758  ! 57: ADD_I	add 	%r7, 0x0758, %r27
	.word 0xa2022f9e  ! 57: ADD_I	add 	%r8, 0x0f9e, %r17
	.word 0xbe09a486  ! 57: AND_I	and 	%r6, 0x0486, %r31
	.word 0xb601800e  ! 57: ADD_R	add 	%r6, %r14, %r27
	.word 0xaa09c009  ! 57: AND_R	and 	%r7, %r9, %r21
	.word 0xb609800b  ! 57: AND_R	and 	%r6, %r11, %r27
	.word 0xa4112dff  ! 57: OR_I	or 	%r4, 0x0dff, %r18
	.word 0xba0a22dd  ! 57: AND_I	and 	%r8, 0x02dd, %r29
	.word 0xbc10c00b  ! 57: OR_R	or 	%r3, %r11, %r30
	.word 0xae11800c  ! 57: OR_R	or 	%r6, %r12, %r23
	.word 0xaa09e316  ! 57: AND_I	and 	%r7, 0x0316, %r21
	.word 0xa209000b  ! 57: AND_R	and 	%r4, %r11, %r17
	.word 0xb601a6f1  ! 57: ADD_I	add 	%r6, 0x06f1, %r27
	.word 0xa608c00e  ! 57: AND_R	and 	%r3, %r14, %r19
	.word 0xa409e7eb  ! 57: AND_I	and 	%r7, 0x07eb, %r18
	.word 0xb4122135  ! 57: OR_I	or 	%r8, 0x0135, %r26
	.word 0xbc11000f  ! 57: OR_R	or 	%r4, %r15, %r30
	.word 0xbe02000e  ! 57: ADD_R	add 	%r8, %r14, %r31
	.word 0xaa01c009  ! 57: ADD_R	add 	%r7, %r9, %r21
	.word 0xaa01e237  ! 57: ADD_I	add 	%r7, 0x0237, %r21
	.word 0xb20a2390  ! 57: AND_I	and 	%r8, 0x0390, %r25
	.word 0xae0225e2  ! 57: ADD_I	add 	%r8, 0x05e2, %r23
	.word 0xa808eb5f  ! 57: AND_I	and 	%r3, 0x0b5f, %r20
	.word 0xb411c00e  ! 57: OR_R	or 	%r7, %r14, %r26
	.word 0xaa11400e  ! 57: OR_R	or 	%r5, %r14, %r21
	.word 0xbe09a27e  ! 57: AND_I	and 	%r6, 0x027e, %r31
	.word 0xb6094009  ! 57: AND_R	and 	%r5, %r9, %r27
	.word 0xa601000e  ! 57: ADD_R	add 	%r4, %r14, %r19
	.word 0xb401eb0e  ! 57: ADD_I	add 	%r7, 0x0b0e, %r26
	.word 0xac00c00b  ! 57: ADD_R	add 	%r3, %r11, %r22
	.word 0xbe11649c  ! 57: OR_I	or 	%r5, 0x049c, %r31
	.word 0xb611400e  ! 57: OR_R	or 	%r5, %r14, %r27
	.word 0xaa11c00f  ! 57: OR_R	or 	%r7, %r15, %r21
	.word 0xb411a5bd  ! 57: OR_I	or 	%r6, 0x05bd, %r26
	.word 0xbe11ac96  ! 57: OR_I	or 	%r6, 0x0c96, %r31
	.word 0xac11e67a  ! 57: OR_I	or 	%r7, 0x067a, %r22
	.word 0xb8096bc5  ! 57: AND_I	and 	%r5, 0x0bc5, %r28
	.word 0xa200c00e  ! 57: ADD_R	add 	%r3, %r14, %r17
	.word 0xb809ad32  ! 57: AND_I	and 	%r6, 0x0d32, %r28
	.word 0xb40967d1  ! 57: AND_I	and 	%r5, 0x07d1, %r26
	.word 0xba09c00e  ! 57: AND_R	and 	%r7, %r14, %r29
	.word 0xe229e004  ! 57: STB_I	stb	%r17, [%r7 + 0x0004]
	.word 0xee31ec60  ! 57: STH_I	sth	%r23, [%r7 + 0x0c60]
	.word 0xee31e1b0  ! 57: STH_I	sth	%r23, [%r7 + 0x01b0]
	.word 0xe228e9d7  ! 57: STB_I	stb	%r17, [%r3 + 0x09d7]
	.word 0xfe21a5d0  ! 57: STW_I	stw	%r31, [%r6 + 0x05d0]
	.word 0xea7169e8  ! 59: STX_I	stx	%r21, [%r5 + 0x09e8]
	.word 0xae010045
	.word 0xf421acb0  ! 61: STW_I	stw	%r26, [%r6 + 0x0cb0]
IC_ERR_14:
!$EV error(2,expr(@VA(.MAIN.IC_ERR_14), 16, 16),1,IC_DATA,IR,17,x)
	.word 0xc0f00962  ! 64: STXA_R	stxa	%r0, [%r0 + %r2] 0x4b
	.word 0xe4014009  ! 65: LDUW_R	lduw	[%r5 + %r9], %r18
	.word 0xaa09a7ad  ! 65: AND_I	and 	%r6, 0x07ad, %r21
	.word 0xbc11400f  ! 65: OR_R	or 	%r5, %r15, %r30
	.word 0xb009000e  ! 65: AND_R	and 	%r4, %r14, %r24
	bne thr2_loop_4
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_5:
	.word 0xb001c00b  ! 73: ADD_R	add 	%r7, %r11, %r24
	.word 0xa400c00b  ! 73: ADD_R	add 	%r3, %r11, %r18
	.word 0xb809000b  ! 73: AND_R	and 	%r4, %r11, %r28
	.word 0xbe02000f  ! 73: ADD_R	add 	%r8, %r15, %r31
	.word 0xb609e6ee  ! 73: AND_I	and 	%r7, 0x06ee, %r27
	.word 0xae09a6c8  ! 73: AND_I	and 	%r6, 0x06c8, %r23
	.word 0xba022065  ! 73: ADD_I	add 	%r8, 0x0065, %r29
	.word 0xa601a19a  ! 73: ADD_I	add 	%r6, 0x019a, %r19
	.word 0xac11a479  ! 73: OR_I	or 	%r6, 0x0479, %r22
	.word 0xb010c009  ! 73: OR_R	or 	%r3, %r9, %r24
	.word 0xac11000c  ! 73: OR_R	or 	%r4, %r12, %r22
	.word 0xaa11a95f  ! 73: OR_I	or 	%r6, 0x095f, %r21
	.word 0xb402000f  ! 73: ADD_R	add 	%r8, %r15, %r26
	.word 0xb0118009  ! 73: OR_R	or 	%r6, %r9, %r24
	.word 0xa411c00e  ! 73: OR_R	or 	%r7, %r14, %r18
	.word 0xb4092fa2  ! 73: AND_I	and 	%r4, 0x0fa2, %r26
	.word 0xbc02000f  ! 73: ADD_R	add 	%r8, %r15, %r30
	.word 0xb608c00b  ! 73: AND_R	and 	%r3, %r11, %r27
	.word 0xa40a000d  ! 73: AND_R	and 	%r8, %r13, %r18
	.word 0xb611c00f  ! 73: OR_R	or 	%r7, %r15, %r27
	.word 0xbc08c00c  ! 73: AND_R	and 	%r3, %r12, %r30
	.word 0xae08e374  ! 73: AND_I	and 	%r3, 0x0374, %r23
	.word 0xbc11c009  ! 73: OR_R	or 	%r7, %r9, %r30
	.word 0xb4012b8c  ! 73: ADD_I	add 	%r4, 0x0b8c, %r26
	.word 0xb811e820  ! 73: OR_I	or 	%r7, 0x0820, %r28
	.word 0xa20a2330  ! 73: AND_I	and 	%r8, 0x0330, %r17
	.word 0xbe01800a  ! 73: ADD_R	add 	%r6, %r10, %r31
	.word 0xac09a793  ! 73: AND_I	and 	%r6, 0x0793, %r22
	.word 0xa209c00e  ! 73: AND_R	and 	%r7, %r14, %r17
	.word 0xae09a655  ! 73: AND_I	and 	%r6, 0x0655, %r23
	.word 0xb611000f  ! 73: OR_R	or 	%r4, %r15, %r27
	.word 0xbe116063  ! 73: OR_I	or 	%r5, 0x0063, %r31
	.word 0xae022145  ! 73: ADD_I	add 	%r8, 0x0145, %r23
	.word 0xac094009  ! 73: AND_R	and 	%r5, %r9, %r22
	.word 0xb8016d29  ! 73: ADD_I	add 	%r5, 0x0d29, %r28
	.word 0xa401400e  ! 73: ADD_R	add 	%r5, %r14, %r18
	.word 0xb0092229  ! 73: AND_I	and 	%r4, 0x0229, %r24
	.word 0xba11a281  ! 73: OR_I	or 	%r6, 0x0281, %r29
	.word 0xb609eb0b  ! 73: AND_I	and 	%r7, 0x0b0b, %r27
	.word 0xa202000b  ! 73: ADD_R	add 	%r8, %r11, %r17
	.word 0xbe01800d  ! 73: ADD_R	add 	%r6, %r13, %r31
	.word 0xb611a566  ! 73: OR_I	or 	%r6, 0x0566, %r27
	.word 0xbe122f77  ! 73: OR_I	or 	%r8, 0x0f77, %r31
	.word 0xb611000b  ! 73: OR_R	or 	%r4, %r11, %r27
	.word 0xb601a6aa  ! 73: ADD_I	add 	%r6, 0x06aa, %r27
	.word 0xb611ab2a  ! 73: OR_I	or 	%r6, 0x0b2a, %r27
	.word 0xaa11afc4  ! 73: OR_I	or 	%r6, 0x0fc4, %r21
	.word 0xb011400d  ! 73: OR_R	or 	%r5, %r13, %r24
	.word 0xb4096cf5  ! 73: AND_I	and 	%r5, 0x0cf5, %r26
	.word 0xbe01800e  ! 73: ADD_R	add 	%r6, %r14, %r31
	.word 0xa811c00b  ! 73: OR_R	or 	%r7, %r11, %r20
	.word 0xa208c009  ! 73: AND_R	and 	%r3, %r9, %r17
	.word 0xb609400f  ! 73: AND_R	and 	%r5, %r15, %r27
	.word 0xac11000b  ! 73: OR_R	or 	%r4, %r11, %r22
	.word 0xaa01ec3c  ! 73: ADD_I	add 	%r7, 0x0c3c, %r21
	.word 0xa600ed29  ! 73: ADD_I	add 	%r3, 0x0d29, %r19
	.word 0xb400c009  ! 73: ADD_R	add 	%r3, %r9, %r26
	.word 0xa609800c  ! 73: AND_R	and 	%r6, %r12, %r19
	.word 0xa208c00b  ! 73: AND_R	and 	%r3, %r11, %r17
	.word 0xb011800d  ! 73: OR_R	or 	%r6, %r13, %r24
	.word 0xb411000f  ! 73: OR_R	or 	%r4, %r15, %r26
	.word 0xa201acd6  ! 73: ADD_I	add 	%r6, 0x0cd6, %r17
	.word 0xbc022035  ! 73: ADD_I	add 	%r8, 0x0035, %r30
	.word 0xb211c00f  ! 73: OR_R	or 	%r7, %r15, %r25
	.word 0xac022138  ! 73: ADD_I	add 	%r8, 0x0138, %r22
	.word 0xb209400f  ! 73: AND_R	and 	%r5, %r15, %r25
	.word 0xb6012753  ! 73: ADD_I	add 	%r4, 0x0753, %r27
	.word 0xa801289f  ! 73: ADD_I	add 	%r4, 0x089f, %r20
	.word 0xbe10e65a  ! 73: OR_I	or 	%r3, 0x065a, %r31
	.word 0xac08c00e  ! 73: AND_R	and 	%r3, %r14, %r22
	.word 0xb4022dce  ! 73: ADD_I	add 	%r8, 0x0dce, %r26
	.word 0xb209400f  ! 73: AND_R	and 	%r5, %r15, %r25
	.word 0xb41168c7  ! 73: OR_I	or 	%r5, 0x08c7, %r26
	.word 0xae016050  ! 73: ADD_I	add 	%r5, 0x0050, %r23
	.word 0xb210c00e  ! 73: OR_R	or 	%r3, %r14, %r25
	.word 0xbe112db7  ! 73: OR_I	or 	%r4, 0x0db7, %r31
	.word 0xa611400a  ! 73: OR_R	or 	%r5, %r10, %r19
	.word 0xae09400b  ! 73: AND_R	and 	%r5, %r11, %r23
	.word 0xa608e97e  ! 73: AND_I	and 	%r3, 0x097e, %r19
	.word 0xba0121e3  ! 73: ADD_I	add 	%r4, 0x01e3, %r29
	.word 0xb20a2b15  ! 73: AND_I	and 	%r8, 0x0b15, %r25
	.word 0xaa096571  ! 73: AND_I	and 	%r5, 0x0571, %r21
	.word 0xba11ee5f  ! 73: OR_I	or 	%r7, 0x0e5f, %r29
	.word 0xa401ee08  ! 73: ADD_I	add 	%r7, 0x0e08, %r18
	.word 0xbc09800a  ! 73: AND_R	and 	%r6, %r10, %r30
	.word 0xa211400b  ! 73: OR_R	or 	%r5, %r11, %r17
	.word 0xa409800e  ! 73: AND_R	and 	%r6, %r14, %r18
	.word 0xa609000e  ! 73: AND_R	and 	%r4, %r14, %r19
	.word 0xb001ec9c  ! 73: ADD_I	add 	%r7, 0x0c9c, %r24
	.word 0xb412000f  ! 73: OR_R	or 	%r8, %r15, %r26
	.word 0xac01c009  ! 73: ADD_R	add 	%r7, %r9, %r22
	.word 0xaa096ca3  ! 73: AND_I	and 	%r5, 0x0ca3, %r21
	.word 0xbe02000a  ! 73: ADD_R	add 	%r8, %r10, %r31
	.word 0xa809c009  ! 73: AND_R	and 	%r7, %r9, %r20
	.word 0xb800e6bb  ! 73: ADD_I	add 	%r3, 0x06bb, %r28
	.word 0xa402000b  ! 73: ADD_R	add 	%r8, %r11, %r18
	.word 0xa601efcf  ! 73: ADD_I	add 	%r7, 0x0fcf, %r19
	.word 0xae09afa0  ! 73: AND_I	and 	%r6, 0x0fa0, %r23
	.word 0xb4090009  ! 73: AND_R	and 	%r4, %r9, %r26
	.word 0xa210e755  ! 73: OR_I	or 	%r3, 0x0755, %r17
	.word 0xbe00c009  ! 73: ADD_R	add 	%r3, %r9, %r31
	.word 0xa408edd7  ! 73: AND_I	and 	%r3, 0x0dd7, %r18
	.word 0xa201c00d  ! 73: ADD_R	add 	%r7, %r13, %r17
	.word 0xac09400f  ! 73: AND_R	and 	%r5, %r15, %r22
	.word 0xa411000b  ! 73: OR_R	or 	%r4, %r11, %r18
	.word 0xb0116def  ! 73: OR_I	or 	%r5, 0x0def, %r24
	.word 0xa801000f  ! 73: ADD_R	add 	%r4, %r15, %r20
	.word 0xbc01c00a  ! 73: ADD_R	add 	%r7, %r10, %r30
	.word 0xb809000d  ! 73: AND_R	and 	%r4, %r13, %r28
	.word 0xaa09c00a  ! 73: AND_R	and 	%r7, %r10, %r21
	.word 0xa408c009  ! 73: AND_R	and 	%r3, %r9, %r18
	.word 0xa6018009  ! 73: ADD_R	add 	%r6, %r9, %r19
	.word 0xa2122c3d  ! 73: OR_I	or 	%r8, 0x0c3d, %r17
	.word 0xba00c00e  ! 73: ADD_R	add 	%r3, %r14, %r29
	.word 0xbe112173  ! 73: OR_I	or 	%r4, 0x0173, %r31
	.word 0xaa10c009  ! 73: OR_R	or 	%r3, %r9, %r21
	.word 0xbc00e7dd  ! 73: ADD_I	add 	%r3, 0x07dd, %r30
	.word 0xa200c00d  ! 73: ADD_R	add 	%r3, %r13, %r17
	.word 0xae09800b  ! 73: AND_R	and 	%r6, %r11, %r23
	.word 0xe231a644  ! 73: STH_I	sth	%r17, [%r6 + 0x0644]
	.word 0xe871a580  ! 73: STX_I	stx	%r20, [%r6 + 0x0580]
	.word 0xe6716458  ! 73: STX_I	stx	%r19, [%r5 + 0x0458]
	.word 0xf229277c  ! 73: STB_I	stb	%r25, [%r4 + 0x077c]
	.word 0xec70e300  ! 73: STX_I	stx	%r22, [%r3 + 0x0300]
	.word 0xe229e4dd  ! 73: STB_I	stb	%r17, [%r7 + 0x04dd]
	.word 0xea29ea04  ! 73: STB_I	stb	%r21, [%r7 + 0x0a04]
	.word 0xe849c00c  ! 74: LDSB_R	ldsb	[%r7 + %r12], %r20
	.word 0xe6216a64  ! 75: STW_I	stw	%r19, [%r5 + 0x0a64]
	.word 0xf848c00d  ! 76: LDSB_R	ldsb	[%r3 + %r13], %r28
	.word 0xa4012bf2  ! 76: ADD_I	add 	%r4, 0x0bf2, %r18
	.word 0xb001400d  ! 76: ADD_R	add 	%r5, %r13, %r24
	.word 0xb009c00c  ! 76: AND_R	and 	%r7, %r12, %r24
	bne thr2_loop_5
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_6:
	.word 0xb801657f  ! 82: ADD_I	add 	%r5, 0x057f, %r28
	.word 0xb201ef80  ! 82: ADD_I	add 	%r7, 0x0f80, %r25
	.word 0xa20a24f2  ! 82: AND_I	and 	%r8, 0x04f2, %r17
	.word 0xba08c00a  ! 82: AND_R	and 	%r3, %r10, %r29
	.word 0xb611ea22  ! 82: OR_I	or 	%r7, 0x0a22, %r27
	.word 0xac09000e  ! 82: AND_R	and 	%r4, %r14, %r22
	.word 0xb201c00f  ! 82: ADD_R	add 	%r7, %r15, %r25
	.word 0xb602000b  ! 82: ADD_R	add 	%r8, %r11, %r27
	.word 0xb809400e  ! 82: AND_R	and 	%r5, %r14, %r28
	.word 0xac00c009  ! 82: ADD_R	add 	%r3, %r9, %r22
	.word 0xa809400a  ! 82: AND_R	and 	%r5, %r10, %r20
	.word 0xb209400d  ! 82: AND_R	and 	%r5, %r13, %r25
	.word 0xbe0126bd  ! 82: ADD_I	add 	%r4, 0x06bd, %r31
	.word 0xb01220d4  ! 82: OR_I	or 	%r8, 0x00d4, %r24
	.word 0xbc10efd8  ! 82: OR_I	or 	%r3, 0x0fd8, %r30
	.word 0xbe016383  ! 82: ADD_I	add 	%r5, 0x0383, %r31
	.word 0xaa01400c  ! 82: ADD_R	add 	%r5, %r12, %r21
	.word 0xb4114009  ! 82: OR_R	or 	%r5, %r9, %r26
	.word 0xa202000e  ! 82: ADD_R	add 	%r8, %r14, %r17
	.word 0xb601c00c  ! 82: ADD_R	add 	%r7, %r12, %r27
	.word 0xaa0962d9  ! 82: AND_I	and 	%r5, 0x02d9, %r21
	.word 0xa610e94e  ! 82: OR_I	or 	%r3, 0x094e, %r19
	.word 0xa211ac5c  ! 82: OR_I	or 	%r6, 0x0c5c, %r17
	.word 0xb401e849  ! 82: ADD_I	add 	%r7, 0x0849, %r26
	.word 0xa202000b  ! 82: ADD_R	add 	%r8, %r11, %r17
	.word 0xb801000f  ! 82: ADD_R	add 	%r4, %r15, %r28
	.word 0xb40a000c  ! 82: AND_R	and 	%r8, %r12, %r26
	.word 0xb001655f  ! 82: ADD_I	add 	%r5, 0x055f, %r24
	.word 0xaa010009  ! 82: ADD_R	add 	%r4, %r9, %r21
	.word 0xb011a070  ! 82: OR_I	or 	%r6, 0x0070, %r24
	.word 0xae122066  ! 82: OR_I	or 	%r8, 0x0066, %r23
	.word 0xaa11000c  ! 82: OR_R	or 	%r4, %r12, %r21
	.word 0xbc09a380  ! 82: AND_I	and 	%r6, 0x0380, %r30
	.word 0xa809e300  ! 82: AND_I	and 	%r7, 0x0300, %r20
	.word 0xb010e86f  ! 82: OR_I	or 	%r3, 0x086f, %r24
	.word 0xb209ecb1  ! 82: AND_I	and 	%r7, 0x0cb1, %r25
	.word 0xb608e326  ! 82: AND_I	and 	%r3, 0x0326, %r27
	.word 0xae094009  ! 82: AND_R	and 	%r5, %r9, %r23
	.word 0xa409a897  ! 82: AND_I	and 	%r6, 0x0897, %r18
	.word 0xaa10e45e  ! 82: OR_I	or 	%r3, 0x045e, %r21
	.word 0xaa116f18  ! 82: OR_I	or 	%r5, 0x0f18, %r21
	.word 0xb401c00c  ! 82: ADD_R	add 	%r7, %r12, %r26
	.word 0xb009400d  ! 82: AND_R	and 	%r5, %r13, %r24
	.word 0xbe11000e  ! 82: OR_R	or 	%r4, %r14, %r31
	.word 0xbe116aac  ! 82: OR_I	or 	%r5, 0x0aac, %r31
	.word 0xae09c00c  ! 82: AND_R	and 	%r7, %r12, %r23
	.word 0xb201400e  ! 82: ADD_R	add 	%r5, %r14, %r25
	.word 0xbc110009  ! 82: OR_R	or 	%r4, %r9, %r30
	.word 0xa411c009  ! 82: OR_R	or 	%r7, %r9, %r18
	.word 0xa20a000b  ! 82: AND_R	and 	%r8, %r11, %r17
	.word 0xae09400c  ! 82: AND_R	and 	%r5, %r12, %r23
	.word 0xb2090009  ! 82: AND_R	and 	%r4, %r9, %r25
	.word 0xb602215f  ! 82: ADD_I	add 	%r8, 0x015f, %r27
	.word 0xa20223d1  ! 82: ADD_I	add 	%r8, 0x03d1, %r17
	.word 0xbe01800a  ! 82: ADD_R	add 	%r6, %r10, %r31
	.word 0xbc11e90b  ! 82: OR_I	or 	%r7, 0x090b, %r30
	.word 0xa609a1eb  ! 82: AND_I	and 	%r6, 0x01eb, %r19
	.word 0xac09c00a  ! 82: AND_R	and 	%r7, %r10, %r22
	.word 0xa400c00e  ! 82: ADD_R	add 	%r3, %r14, %r18
	.word 0xb609e934  ! 82: AND_I	and 	%r7, 0x0934, %r27
	.word 0xb001c00f  ! 82: ADD_R	add 	%r7, %r15, %r24
	.word 0xb211abe1  ! 82: OR_I	or 	%r6, 0x0be1, %r25
	.word 0xa4122e6f  ! 82: OR_I	or 	%r8, 0x0e6f, %r18
	.word 0xb611c00e  ! 82: OR_R	or 	%r7, %r14, %r27
	.word 0xa4116b47  ! 82: OR_I	or 	%r5, 0x0b47, %r18
	.word 0xaa01000a  ! 82: ADD_R	add 	%r4, %r10, %r21
	.word 0xb209ebed  ! 82: AND_I	and 	%r7, 0x0bed, %r25
	.word 0xae012574  ! 82: ADD_I	add 	%r4, 0x0574, %r23
	.word 0xbe11800e  ! 82: OR_R	or 	%r6, %r14, %r31
	.word 0xa601000b  ! 82: ADD_R	add 	%r4, %r11, %r19
	.word 0xb200c00f  ! 82: ADD_R	add 	%r3, %r15, %r25
	.word 0xba09800f  ! 82: AND_R	and 	%r6, %r15, %r29
	.word 0xa801eae8  ! 82: ADD_I	add 	%r7, 0x0ae8, %r20
	.word 0xaa11000e  ! 82: OR_R	or 	%r4, %r14, %r21
	.word 0xb80227d4  ! 82: ADD_I	add 	%r8, 0x07d4, %r28
	.word 0xb6116ad3  ! 82: OR_I	or 	%r5, 0x0ad3, %r27
	.word 0xa609400e  ! 82: AND_R	and 	%r5, %r14, %r19
	.word 0xa609c00e  ! 82: AND_R	and 	%r7, %r14, %r19
	.word 0xb011ae5e  ! 82: OR_I	or 	%r6, 0x0e5e, %r24
	.word 0xa411400a  ! 82: OR_R	or 	%r5, %r10, %r18
	.word 0xba09aaa6  ! 82: AND_I	and 	%r6, 0x0aa6, %r29
	.word 0xa401400e  ! 82: ADD_R	add 	%r5, %r14, %r18
	.word 0xb401ec36  ! 82: ADD_I	add 	%r7, 0x0c36, %r26
	.word 0xa21122eb  ! 82: OR_I	or 	%r4, 0x02eb, %r17
	.word 0xbe09000c  ! 82: AND_R	and 	%r4, %r12, %r31
	.word 0xb402000f  ! 82: ADD_R	add 	%r8, %r15, %r26
	.word 0xa61126d5  ! 82: OR_I	or 	%r4, 0x06d5, %r19
	.word 0xa200c00f  ! 82: ADD_R	add 	%r3, %r15, %r17
	.word 0xb812000d  ! 82: OR_R	or 	%r8, %r13, %r28
	.word 0xbe09a64c  ! 82: AND_I	and 	%r6, 0x064c, %r31
	.word 0xa4112aea  ! 82: OR_I	or 	%r4, 0x0aea, %r18
	.word 0xba012815  ! 82: ADD_I	add 	%r4, 0x0815, %r29
	.word 0xbc10e8c7  ! 82: OR_I	or 	%r3, 0x08c7, %r30
	.word 0xa601c00b  ! 82: ADD_R	add 	%r7, %r11, %r19
	.word 0xa611800f  ! 82: OR_R	or 	%r6, %r15, %r19
	.word 0xb609400b  ! 82: AND_R	and 	%r5, %r11, %r27
	.word 0xa211800f  ! 82: OR_R	or 	%r6, %r15, %r17
	.word 0xb2122558  ! 82: OR_I	or 	%r8, 0x0558, %r25
	.word 0xb612000d  ! 82: OR_R	or 	%r8, %r13, %r27
	.word 0xbc00eaa8  ! 82: ADD_I	add 	%r3, 0x0aa8, %r30
	.word 0xb409400f  ! 82: AND_R	and 	%r5, %r15, %r26
	.word 0xb009800c  ! 82: AND_R	and 	%r6, %r12, %r24
	.word 0xbe00c00f  ! 82: ADD_R	add 	%r3, %r15, %r31
	.word 0xb211c00a  ! 82: OR_R	or 	%r7, %r10, %r25
	.word 0xb001aef5  ! 82: ADD_I	add 	%r6, 0x0ef5, %r24
	.word 0xac01800d  ! 82: ADD_R	add 	%r6, %r13, %r22
	.word 0xba01000f  ! 82: ADD_R	add 	%r4, %r15, %r29
	.word 0xb811c009  ! 82: OR_R	or 	%r7, %r9, %r28
	.word 0xbe022ce6  ! 82: ADD_I	add 	%r8, 0x0ce6, %r31
	.word 0xb609400d  ! 82: AND_R	and 	%r5, %r13, %r27
	.word 0xbe10c00d  ! 82: OR_R	or 	%r3, %r13, %r31
	.word 0xb201670b  ! 82: ADD_I	add 	%r5, 0x070b, %r25
	.word 0xa40a22d8  ! 82: AND_I	and 	%r8, 0x02d8, %r18
	.word 0xa2112d39  ! 82: OR_I	or 	%r4, 0x0d39, %r17
	.word 0xba00e806  ! 82: ADD_I	add 	%r3, 0x0806, %r29
	.word 0xb60a277d  ! 82: AND_I	and 	%r8, 0x077d, %r27
	.word 0xb409000a  ! 82: AND_R	and 	%r4, %r10, %r26
	.word 0xbe09000d  ! 82: AND_R	and 	%r4, %r13, %r31
	.word 0xa212000d  ! 82: OR_R	or 	%r8, %r13, %r17
	.word 0xbe00c00b  ! 82: ADD_R	add 	%r3, %r11, %r31
	.word 0xb201c00f  ! 82: ADD_R	add 	%r7, %r15, %r25
	.word 0xbc08e64e  ! 82: AND_I	and 	%r3, 0x064e, %r30
	.word 0xba00ed71  ! 82: ADD_I	add 	%r3, 0x0d71, %r29
	.word 0xb001800b  ! 82: ADD_R	add 	%r6, %r11, %r24
	.word 0xa4112b57  ! 82: OR_I	or 	%r4, 0x0b57, %r18
	.word 0xb209eed8  ! 82: AND_I	and 	%r7, 0x0ed8, %r25
	.word 0xac11800e  ! 82: OR_R	or 	%r6, %r14, %r22
	.word 0xb809afa1  ! 82: AND_I	and 	%r6, 0x0fa1, %r28
	.word 0xb201800b  ! 82: ADD_R	add 	%r6, %r11, %r25
	.word 0xbc09c00e  ! 82: AND_R	and 	%r7, %r14, %r30
	.word 0xa811ea0b  ! 82: OR_I	or 	%r7, 0x0a0b, %r20
	.word 0xb600e683  ! 82: ADD_I	add 	%r3, 0x0683, %r27
	.word 0xa611000d  ! 82: OR_R	or 	%r4, %r13, %r19
	.word 0xb009afb6  ! 82: AND_I	and 	%r6, 0x0fb6, %r24
	.word 0xba08c00a  ! 82: AND_R	and 	%r3, %r10, %r29
	.word 0xb009e240  ! 82: AND_I	and 	%r7, 0x0240, %r24
	.word 0xbc116072  ! 82: OR_I	or 	%r5, 0x0072, %r30
	.word 0xa411603f  ! 82: OR_I	or 	%r5, 0x003f, %r18
	.word 0xae00c00e  ! 82: ADD_R	add 	%r3, %r14, %r23
	.word 0xa609ae91  ! 82: AND_I	and 	%r6, 0x0e91, %r19
	.word 0xaa01000d  ! 82: ADD_R	add 	%r4, %r13, %r21
	.word 0xa601e65c  ! 82: ADD_I	add 	%r7, 0x065c, %r19
	.word 0xb01160b0  ! 82: OR_I	or 	%r5, 0x00b0, %r24
	.word 0xac01400b  ! 82: ADD_R	add 	%r5, %r11, %r22
	.word 0xb001c00b  ! 82: ADD_R	add 	%r7, %r11, %r24
	.word 0xa201af4d  ! 82: ADD_I	add 	%r6, 0x0f4d, %r17
	.word 0xa60969d0  ! 82: AND_I	and 	%r5, 0x09d0, %r19
	.word 0xae01800c  ! 82: ADD_R	add 	%r6, %r12, %r23
	.word 0xa602000a  ! 82: ADD_R	add 	%r8, %r10, %r19
	.word 0xb001a078  ! 82: ADD_I	add 	%r6, 0x0078, %r24
	.word 0xa209400d  ! 82: AND_R	and 	%r5, %r13, %r17
	.word 0xb208c00c  ! 82: AND_R	and 	%r3, %r12, %r25
	.word 0xa40a000c  ! 82: AND_R	and 	%r8, %r12, %r18
	.word 0xae08ea08  ! 82: AND_I	and 	%r3, 0x0a08, %r23
	.word 0xac01c00a  ! 82: ADD_R	add 	%r7, %r10, %r22
	.word 0xae0220e1  ! 82: ADD_I	add 	%r8, 0x00e1, %r23
	.word 0xb40227d6  ! 82: ADD_I	add 	%r8, 0x07d6, %r26
	.word 0xa411c009  ! 82: OR_R	or 	%r7, %r9, %r18
	.word 0xb812000e  ! 82: OR_R	or 	%r8, %r14, %r28
	.word 0xb4092646  ! 82: AND_I	and 	%r4, 0x0646, %r26
	.word 0xbe1123ed  ! 82: OR_I	or 	%r4, 0x03ed, %r31
	.word 0xae01400f  ! 82: ADD_R	add 	%r5, %r15, %r23
	.word 0xba09400e  ! 82: AND_R	and 	%r5, %r14, %r29
	.word 0xa809400f  ! 82: AND_R	and 	%r5, %r15, %r20
	.word 0xba10e4bf  ! 82: OR_I	or 	%r3, 0x04bf, %r29
	.word 0xa811ed7a  ! 82: OR_I	or 	%r7, 0x0d7a, %r20
	.word 0xac02000b  ! 82: ADD_R	add 	%r8, %r11, %r22
	.word 0xba01a29f  ! 82: ADD_I	add 	%r6, 0x029f, %r29
	.word 0xb401000e  ! 82: ADD_R	add 	%r4, %r14, %r26
	.word 0xb801620d  ! 82: ADD_I	add 	%r5, 0x020d, %r28
	.word 0xa201253e  ! 82: ADD_I	add 	%r4, 0x053e, %r17
	.word 0xbe01aa58  ! 82: ADD_I	add 	%r6, 0x0a58, %r31
	.word 0xb801400d  ! 82: ADD_R	add 	%r5, %r13, %r28
	.word 0xbc09000f  ! 82: AND_R	and 	%r4, %r15, %r30
	.word 0xbe0a21a3  ! 82: AND_I	and 	%r8, 0x01a3, %r31
	.word 0xb400c00a  ! 82: ADD_R	add 	%r3, %r10, %r26
	.word 0xb411c00a  ! 82: OR_R	or 	%r7, %r10, %r26
	.word 0xac12000c  ! 82: OR_R	or 	%r8, %r12, %r22
	.word 0xaa01000c  ! 82: ADD_R	add 	%r4, %r12, %r21
	.word 0xb609eca1  ! 82: AND_I	and 	%r7, 0x0ca1, %r27
	.word 0xa200e4b8  ! 82: ADD_I	add 	%r3, 0x04b8, %r17
	.word 0xbe11a9d2  ! 82: OR_I	or 	%r6, 0x09d2, %r31
	.word 0xae12000f  ! 82: OR_R	or 	%r8, %r15, %r23
	.word 0xae11000e  ! 82: OR_R	or 	%r4, %r14, %r23
	.word 0xbe112b13  ! 82: OR_I	or 	%r4, 0x0b13, %r31
	.word 0xb410c00f  ! 82: OR_R	or 	%r3, %r15, %r26
	.word 0xb808c009  ! 82: AND_R	and 	%r3, %r9, %r28
	.word 0xb800eea7  ! 82: ADD_I	add 	%r3, 0x0ea7, %r28
	.word 0xa209400d  ! 82: AND_R	and 	%r5, %r13, %r17
	.word 0xae01000b  ! 82: ADD_R	add 	%r4, %r11, %r23
	.word 0xb6012dc5  ! 82: ADD_I	add 	%r4, 0x0dc5, %r27
	.word 0xbe11800f  ! 82: OR_R	or 	%r6, %r15, %r31
	.word 0xba094009  ! 82: AND_R	and 	%r5, %r9, %r29
	.word 0xb209c00c  ! 82: AND_R	and 	%r7, %r12, %r25
	.word 0xa611a077  ! 82: OR_I	or 	%r6, 0x0077, %r19
	.word 0xb4112251  ! 82: OR_I	or 	%r4, 0x0251, %r26
	.word 0xa601c00f  ! 82: ADD_R	add 	%r7, %r15, %r19
	.word 0xb80224ad  ! 82: ADD_I	add 	%r8, 0x04ad, %r28
	.word 0xb411000d  ! 82: OR_R	or 	%r4, %r13, %r26
	.word 0xac11800e  ! 82: OR_R	or 	%r6, %r14, %r22
	.word 0xb600c00f  ! 82: ADD_R	add 	%r3, %r15, %r27
	.word 0xb411e7b6  ! 82: OR_I	or 	%r7, 0x07b6, %r26
	.word 0xa812000c  ! 82: OR_R	or 	%r8, %r12, %r20
	.word 0xb4090009  ! 82: AND_R	and 	%r4, %r9, %r26
	.word 0xbe08ed27  ! 82: AND_I	and 	%r3, 0x0d27, %r31
	.word 0xb810e661  ! 82: OR_I	or 	%r3, 0x0661, %r28
	.word 0xb208c00e  ! 82: AND_R	and 	%r3, %r14, %r25
	.word 0xa6022c14  ! 82: ADD_I	add 	%r8, 0x0c14, %r19
	.word 0xb201c00e  ! 82: ADD_R	add 	%r7, %r14, %r25
	.word 0xaa11000d  ! 82: OR_R	or 	%r4, %r13, %r21
	.word 0xae090009  ! 82: AND_R	and 	%r4, %r9, %r23
	.word 0xb809aea5  ! 82: AND_I	and 	%r6, 0x0ea5, %r28
	.word 0xb012000d  ! 82: OR_R	or 	%r8, %r13, %r24
	.word 0xb009c00b  ! 82: AND_R	and 	%r7, %r11, %r24
	.word 0xb2022d3b  ! 82: ADD_I	add 	%r8, 0x0d3b, %r25
	.word 0xaa09c00b  ! 82: AND_R	and 	%r7, %r11, %r21
	.word 0xae11a363  ! 82: OR_I	or 	%r6, 0x0363, %r23
	.word 0xaa11000d  ! 82: OR_R	or 	%r4, %r13, %r21
	.word 0xac02229b  ! 82: ADD_I	add 	%r8, 0x029b, %r22
	.word 0xb2016cbf  ! 82: ADD_I	add 	%r5, 0x0cbf, %r25
	.word 0xb209000d  ! 82: AND_R	and 	%r4, %r13, %r25
	.word 0xac11e5b2  ! 82: OR_I	or 	%r7, 0x05b2, %r22
	.word 0xa411c00e  ! 82: OR_R	or 	%r7, %r14, %r18
	.word 0xf821620c  ! 82: STW_I	stw	%r28, [%r5 + 0x020c]
	.word 0xe2296cac  ! 82: STB_I	stb	%r17, [%r5 + 0x0cac]
	.word 0xfc2a2630  ! 82: STB_I	stb	%r30, [%r8 + 0x0630]
	.word 0xf8716568  ! 82: STX_I	stx	%r28, [%r5 + 0x0568]
	.word 0xf470e930  ! 82: STX_I	stx	%r26, [%r3 + 0x0930]
	.word 0xf231e54e  ! 83: STH_I	sth	%r25, [%r7 + 0x054e]
	.word 0xae18eeda  ! 84: XOR_I	xor 	%r3, 0x0eda, %r23
	.word 0xf4216bf0  ! 85: STW_I	stw	%r26, [%r5 + 0x0bf0]
	.word 0xee312c84  ! 86: STH_I	sth	%r23, [%r4 + 0x0c84]
	.word 0xb871000a  ! 87: UDIV_R	udiv 	%r4, %r10, %r28
	.word 0xbc11a234  ! 87: OR_I	or 	%r6, 0x0234, %r30
	.word 0xac09800d  ! 87: AND_R	and 	%r6, %r13, %r22
	.word 0xac098009  ! 87: AND_R	and 	%r6, %r9, %r22
	bne thr2_loop_6
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_7:
	.word 0xb60a000f  ! 93: AND_R	and 	%r8, %r15, %r27
	.word 0xae11400f  ! 93: OR_R	or 	%r5, %r15, %r23
	.word 0xbe09c00b  ! 93: AND_R	and 	%r7, %r11, %r31
	.word 0xa601aaa1  ! 93: ADD_I	add 	%r6, 0x0aa1, %r19
	.word 0xae090009  ! 93: AND_R	and 	%r4, %r9, %r23
	.word 0xa210e596  ! 93: OR_I	or 	%r3, 0x0596, %r17
	.word 0xae10e53a  ! 93: OR_I	or 	%r3, 0x053a, %r23
	.word 0xb602000c  ! 93: ADD_R	add 	%r8, %r12, %r27
	.word 0xa609eb30  ! 93: AND_I	and 	%r7, 0x0b30, %r19
	.word 0xb2122963  ! 93: OR_I	or 	%r8, 0x0963, %r25
	.word 0xb6122806  ! 93: OR_I	or 	%r8, 0x0806, %r27
	.word 0xaa00e95b  ! 93: ADD_I	add 	%r3, 0x095b, %r21
	.word 0xba09c00a  ! 93: AND_R	and 	%r7, %r10, %r29
	.word 0xa412000d  ! 93: OR_R	or 	%r8, %r13, %r18
	.word 0xbe08e6f4  ! 93: AND_I	and 	%r3, 0x06f4, %r31
	.word 0xae116a9c  ! 93: OR_I	or 	%r5, 0x0a9c, %r23
	.word 0xb60a000c  ! 93: AND_R	and 	%r8, %r12, %r27
	.word 0xa600c00b  ! 93: ADD_R	add 	%r3, %r11, %r19
	.word 0xae0128dd  ! 93: ADD_I	add 	%r4, 0x08dd, %r23
	.word 0xa600ec32  ! 93: ADD_I	add 	%r3, 0x0c32, %r19
	.word 0xa8016981  ! 93: ADD_I	add 	%r5, 0x0981, %r20
	.word 0xa200c00a  ! 93: ADD_R	add 	%r3, %r10, %r17
	.word 0xb009400a  ! 93: AND_R	and 	%r5, %r10, %r24
	.word 0xb801eade  ! 93: ADD_I	add 	%r7, 0x0ade, %r28
	.word 0xba08e1db  ! 93: AND_I	and 	%r3, 0x01db, %r29
	.word 0xba09e945  ! 93: AND_I	and 	%r7, 0x0945, %r29
	.word 0xa411400e  ! 93: OR_R	or 	%r5, %r14, %r18
	.word 0xa801a73a  ! 93: ADD_I	add 	%r6, 0x073a, %r20
	.word 0xb60a2bd1  ! 93: AND_I	and 	%r8, 0x0bd1, %r27
	.word 0xa602000c  ! 93: ADD_R	add 	%r8, %r12, %r19
	.word 0xb801400d  ! 93: ADD_R	add 	%r5, %r13, %r28
	.word 0xb608c00b  ! 93: AND_R	and 	%r3, %r11, %r27
	.word 0xac09400e  ! 93: AND_R	and 	%r5, %r14, %r22
	.word 0xb401ed28  ! 93: ADD_I	add 	%r7, 0x0d28, %r26
	.word 0xb809ef18  ! 93: AND_I	and 	%r7, 0x0f18, %r28
	.word 0xa601800c  ! 93: ADD_R	add 	%r6, %r12, %r19
	.word 0xae014009  ! 93: ADD_R	add 	%r5, %r9, %r23
	.word 0xb409687c  ! 93: AND_I	and 	%r5, 0x087c, %r26
	.word 0xb6012f56  ! 93: ADD_I	add 	%r4, 0x0f56, %r27
	.word 0xae11800a  ! 93: OR_R	or 	%r6, %r10, %r23
	.word 0xbc12000e  ! 93: OR_R	or 	%r8, %r14, %r30
	.word 0xa60a000a  ! 93: AND_R	and 	%r8, %r10, %r19
	.word 0xb60a2e21  ! 93: AND_I	and 	%r8, 0x0e21, %r27
	.word 0xb012247f  ! 93: OR_I	or 	%r8, 0x047f, %r24
	.word 0xa608c00a  ! 93: AND_R	and 	%r3, %r10, %r19
	.word 0xaa092443  ! 93: AND_I	and 	%r4, 0x0443, %r21
	.word 0xa6096f84  ! 93: AND_I	and 	%r5, 0x0f84, %r19
	.word 0xb001c00e  ! 93: ADD_R	add 	%r7, %r14, %r24
	.word 0xae01a6b7  ! 93: ADD_I	add 	%r6, 0x06b7, %r23
	.word 0xbe09248e  ! 93: AND_I	and 	%r4, 0x048e, %r31
	.word 0xb40a24f2  ! 93: AND_I	and 	%r8, 0x04f2, %r26
	.word 0xbc0a000c  ! 93: AND_R	and 	%r8, %r12, %r30
	.word 0xa2122cc1  ! 93: OR_I	or 	%r8, 0x0cc1, %r17
	.word 0xb8122823  ! 93: OR_I	or 	%r8, 0x0823, %r28
	.word 0xa609e931  ! 93: AND_I	and 	%r7, 0x0931, %r19
	.word 0xbc09400f  ! 93: AND_R	and 	%r5, %r15, %r30
	.word 0xa801400d  ! 93: ADD_R	add 	%r5, %r13, %r20
	.word 0xb4098009  ! 93: AND_R	and 	%r6, %r9, %r26
	.word 0xa8096dd4  ! 93: AND_I	and 	%r5, 0x0dd4, %r20
	.word 0xbe08e6fb  ! 93: AND_I	and 	%r3, 0x06fb, %r31
	.word 0xbc01000f  ! 93: ADD_R	add 	%r4, %r15, %r30
	.word 0xae00c00d  ! 93: ADD_R	add 	%r3, %r13, %r23
	.word 0xba08e9c3  ! 93: AND_I	and 	%r3, 0x09c3, %r29
	.word 0xba11e4e6  ! 93: OR_I	or 	%r7, 0x04e6, %r29
	.word 0xbc10c00a  ! 93: OR_R	or 	%r3, %r10, %r30
	.word 0xb2096447  ! 93: AND_I	and 	%r5, 0x0447, %r25
	.word 0xaa09800d  ! 93: AND_R	and 	%r6, %r13, %r21
	.word 0xbe10c00f  ! 93: OR_R	or 	%r3, %r15, %r31
	.word 0xb609c00d  ! 93: AND_R	and 	%r7, %r13, %r27
	.word 0xa609c00d  ! 93: AND_R	and 	%r7, %r13, %r19
	.word 0xac1160c8  ! 93: OR_I	or 	%r5, 0x00c8, %r22
	.word 0xaa122a13  ! 93: OR_I	or 	%r8, 0x0a13, %r21
	.word 0xaa02000b  ! 93: ADD_R	add 	%r8, %r11, %r21
	.word 0xbc10ef3f  ! 93: OR_I	or 	%r3, 0x0f3f, %r30
	.word 0xbc02000a  ! 93: ADD_R	add 	%r8, %r10, %r30
	.word 0xae09a449  ! 93: AND_I	and 	%r6, 0x0449, %r23
	.word 0xa801c00f  ! 93: ADD_R	add 	%r7, %r15, %r20
	.word 0xaa01a696  ! 93: ADD_I	add 	%r6, 0x0696, %r21
	.word 0xb401400a  ! 93: ADD_R	add 	%r5, %r10, %r26
	.word 0xb609e31e  ! 93: AND_I	and 	%r7, 0x031e, %r27
	.word 0xbc09e018  ! 93: AND_I	and 	%r7, 0x0018, %r30
	.word 0xae122dbb  ! 93: OR_I	or 	%r8, 0x0dbb, %r23
	.word 0xa411e799  ! 93: OR_I	or 	%r7, 0x0799, %r18
	.word 0xaa11400d  ! 93: OR_R	or 	%r5, %r13, %r21
	.word 0xb801ae9a  ! 93: ADD_I	add 	%r6, 0x0e9a, %r28
	.word 0xba02000a  ! 93: ADD_R	add 	%r8, %r10, %r29
	.word 0xaa012cdc  ! 93: ADD_I	add 	%r4, 0x0cdc, %r21
	.word 0xa8022deb  ! 93: ADD_I	add 	%r8, 0x0deb, %r20
	.word 0xae11000e  ! 93: OR_R	or 	%r4, %r14, %r23
	.word 0xaa1165f4  ! 93: OR_I	or 	%r5, 0x05f4, %r21
	.word 0xbe10c00e  ! 93: OR_R	or 	%r3, %r14, %r31
	.word 0xbc01400c  ! 93: ADD_R	add 	%r5, %r12, %r30
	.word 0xac11e028  ! 93: OR_I	or 	%r7, 0x0028, %r22
	.word 0xaa08e88c  ! 93: AND_I	and 	%r3, 0x088c, %r21
	.word 0xbc0a000e  ! 93: AND_R	and 	%r8, %r14, %r30
	.word 0xba08ef79  ! 93: AND_I	and 	%r3, 0x0f79, %r29
	.word 0xa4090009  ! 93: AND_R	and 	%r4, %r9, %r18
	.word 0xbc09e987  ! 93: AND_I	and 	%r7, 0x0987, %r30
	.word 0xba01c00a  ! 93: ADD_R	add 	%r7, %r10, %r29
	.word 0xba022995  ! 93: ADD_I	add 	%r8, 0x0995, %r29
	.word 0xa201c00e  ! 93: ADD_R	add 	%r7, %r14, %r17
	.word 0xb2012c0f  ! 93: ADD_I	add 	%r4, 0x0c0f, %r25
	.word 0xb002223d  ! 93: ADD_I	add 	%r8, 0x023d, %r24
	.word 0xb410c00c  ! 93: OR_R	or 	%r3, %r12, %r26
	.word 0xbc09281c  ! 93: AND_I	and 	%r4, 0x081c, %r30
	.word 0xa201eade  ! 93: ADD_I	add 	%r7, 0x0ade, %r17
	.word 0xae0220ff  ! 93: ADD_I	add 	%r8, 0x00ff, %r23
	.word 0xb401e31c  ! 93: ADD_I	add 	%r7, 0x031c, %r26
	.word 0xb811a78c  ! 93: OR_I	or 	%r6, 0x078c, %r28
	.word 0xb009400b  ! 93: AND_R	and 	%r5, %r11, %r24
	.word 0xbe12000b  ! 93: OR_R	or 	%r8, %r11, %r31
	.word 0xec28e703  ! 93: STB_I	stb	%r22, [%r3 + 0x0703]
	.word 0xf0212760  ! 93: STW_I	stw	%r24, [%r4 + 0x0760]
	.word 0xfa3223fa  ! 93: STH_I	sth	%r29, [%r8 + 0x03fa]
	.word 0xf431ec88  ! 93: STH_I	sth	%r26, [%r7 + 0x0c88]
	.word 0xf8212c58  ! 93: STW_I	stw	%r28, [%r4 + 0x0c58]
	.word 0xfc29a244  ! 95: STB_I	stb	%r30, [%r6 + 0x0244]
	.word 0xae010045
	.word 0xfc29a6e1  ! 97: STB_I	stb	%r30, [%r6 + 0x06e1]
	.word 0xfe716d38  ! 98: STX_I	stx	%r31, [%r5 + 0x0d38]
	.word 0xf6492de5  ! 99: LDSB_I	ldsb	[%r4 + 0x0de5], %r27
	.word 0xae0a0009  ! 99: AND_R	and 	%r8, %r9, %r23
	.word 0xaa01aeb4  ! 99: ADD_I	add 	%r6, 0x0eb4, %r21
	.word 0xaa01c00f  ! 99: ADD_R	add 	%r7, %r15, %r21
	bne thr2_loop_7
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_8:
	.word 0xb010c00a  ! 105: OR_R	or 	%r3, %r10, %r24
	.word 0xac09400b  ! 105: AND_R	and 	%r5, %r11, %r22
	.word 0xb810c00a  ! 105: OR_R	or 	%r3, %r10, %r28
	.word 0xac00c00e  ! 105: ADD_R	add 	%r3, %r14, %r22
	.word 0xb011800b  ! 105: OR_R	or 	%r6, %r11, %r24
	.word 0xa60a29e9  ! 105: AND_I	and 	%r8, 0x09e9, %r19
	.word 0xba012bcb  ! 105: ADD_I	add 	%r4, 0x0bcb, %r29
	.word 0xb401400f  ! 105: ADD_R	add 	%r5, %r15, %r26
	.word 0xb210c00f  ! 105: OR_R	or 	%r3, %r15, %r25
	.word 0xa810e6b1  ! 105: OR_I	or 	%r3, 0x06b1, %r20
	.word 0xbe01ef98  ! 105: ADD_I	add 	%r7, 0x0f98, %r31
	.word 0xa401a35d  ! 105: ADD_I	add 	%r6, 0x035d, %r18
	.word 0xa409c009  ! 105: AND_R	and 	%r7, %r9, %r18
	.word 0xb612000f  ! 105: OR_R	or 	%r8, %r15, %r27
	.word 0xaa11a85c  ! 105: OR_I	or 	%r6, 0x085c, %r21
	.word 0xa801a820  ! 105: ADD_I	add 	%r6, 0x0820, %r20
	.word 0xb810e19b  ! 105: OR_I	or 	%r3, 0x019b, %r28
	.word 0xa211c00e  ! 105: OR_R	or 	%r7, %r14, %r17
	.word 0xa401400d  ! 105: ADD_R	add 	%r5, %r13, %r18
	.word 0xa409000e  ! 105: AND_R	and 	%r4, %r14, %r18
	.word 0xbe122ed2  ! 105: OR_I	or 	%r8, 0x0ed2, %r31
	.word 0xb4096dc5  ! 105: AND_I	and 	%r5, 0x0dc5, %r26
	.word 0xb0096567  ! 105: AND_I	and 	%r5, 0x0567, %r24
	.word 0xb800e737  ! 105: ADD_I	add 	%r3, 0x0737, %r28
	.word 0xa209e621  ! 105: AND_I	and 	%r7, 0x0621, %r17
	.word 0xb611a7ef  ! 105: OR_I	or 	%r6, 0x07ef, %r27
	.word 0xa209000f  ! 105: AND_R	and 	%r4, %r15, %r17
	.word 0xa811000d  ! 105: OR_R	or 	%r4, %r13, %r20
	.word 0xb810eaaa  ! 105: OR_I	or 	%r3, 0x0aaa, %r28
	.word 0xa202000c  ! 105: ADD_R	add 	%r8, %r12, %r17
	.word 0xbc0927b0  ! 105: AND_I	and 	%r4, 0x07b0, %r30
	.word 0xbe094009  ! 105: AND_R	and 	%r5, %r9, %r31
	.word 0xba10c00d  ! 105: OR_R	or 	%r3, %r13, %r29
	.word 0xb211800a  ! 105: OR_R	or 	%r6, %r10, %r25
	.word 0xae09400a  ! 105: AND_R	and 	%r5, %r10, %r23
	.word 0xa2112f2c  ! 105: OR_I	or 	%r4, 0x0f2c, %r17
	.word 0xbe09c00a  ! 105: AND_R	and 	%r7, %r10, %r31
	.word 0xa6110009  ! 105: OR_R	or 	%r4, %r9, %r19
	.word 0xbe09c009  ! 105: AND_R	and 	%r7, %r9, %r31
	.word 0xb800c00d  ! 105: ADD_R	add 	%r3, %r13, %r28
	.word 0xb2092990  ! 105: AND_I	and 	%r4, 0x0990, %r25
	.word 0xaa01e2e6  ! 105: ADD_I	add 	%r7, 0x02e6, %r21
	.word 0xb201254f  ! 105: ADD_I	add 	%r4, 0x054f, %r25
	.word 0xba02000d  ! 105: ADD_R	add 	%r8, %r13, %r29
	.word 0xa6118009  ! 105: OR_R	or 	%r6, %r9, %r19
	.word 0xbc09000e  ! 105: AND_R	and 	%r4, %r14, %r30
	.word 0xae09203a  ! 105: AND_I	and 	%r4, 0x003a, %r23
	.word 0xae10e72e  ! 105: OR_I	or 	%r3, 0x072e, %r23
	.word 0xa809000d  ! 105: AND_R	and 	%r4, %r13, %r20
	.word 0xba08c00d  ! 105: AND_R	and 	%r3, %r13, %r29
	.word 0xba11c00b  ! 105: OR_R	or 	%r7, %r11, %r29
	.word 0xac11e84d  ! 105: OR_I	or 	%r7, 0x084d, %r22
	.word 0xae11000d  ! 105: OR_R	or 	%r4, %r13, %r23
	.word 0xb2110009  ! 105: OR_R	or 	%r4, %r9, %r25
	.word 0xba01c00c  ! 105: ADD_R	add 	%r7, %r12, %r29
	.word 0xa600c00e  ! 105: ADD_R	add 	%r3, %r14, %r19
	.word 0xa2116b90  ! 105: OR_I	or 	%r5, 0x0b90, %r17
	.word 0xb211e756  ! 105: OR_I	or 	%r7, 0x0756, %r25
	.word 0xbc116f01  ! 105: OR_I	or 	%r5, 0x0f01, %r30
	.word 0xa601000a  ! 105: ADD_R	add 	%r4, %r10, %r19
	.word 0xa411e075  ! 105: OR_I	or 	%r7, 0x0075, %r18
	.word 0xac11eda0  ! 105: OR_I	or 	%r7, 0x0da0, %r22
	.word 0xb610c00c  ! 105: OR_R	or 	%r3, %r12, %r27
	.word 0xba09af49  ! 105: AND_I	and 	%r6, 0x0f49, %r29
	.word 0xae08ec99  ! 105: AND_I	and 	%r3, 0x0c99, %r23
	.word 0xa808c00d  ! 105: AND_R	and 	%r3, %r13, %r20
	.word 0xa801400a  ! 105: ADD_R	add 	%r5, %r10, %r20
	.word 0xb809400a  ! 105: AND_R	and 	%r5, %r10, %r28
	.word 0xbe09a8c0  ! 105: AND_I	and 	%r6, 0x08c0, %r31
	.word 0xba01000b  ! 105: ADD_R	add 	%r4, %r11, %r29
	.word 0xa211e12b  ! 105: OR_I	or 	%r7, 0x012b, %r17
	.word 0xbc09c00d  ! 105: AND_R	and 	%r7, %r13, %r30
	.word 0xa409c00f  ! 105: AND_R	and 	%r7, %r15, %r18
	.word 0xaa00e984  ! 105: ADD_I	add 	%r3, 0x0984, %r21
	.word 0xa2020009  ! 105: ADD_R	add 	%r8, %r9, %r17
	.word 0xb211c009  ! 105: OR_R	or 	%r7, %r9, %r25
	.word 0xba08e1f4  ! 105: AND_I	and 	%r3, 0x01f4, %r29
	.word 0xb411400e  ! 105: OR_R	or 	%r5, %r14, %r26
	.word 0xbc01e91a  ! 105: ADD_I	add 	%r7, 0x091a, %r30
	.word 0xb011400c  ! 105: OR_R	or 	%r5, %r12, %r24
	.word 0xac09000b  ! 105: AND_R	and 	%r4, %r11, %r22
	.word 0xa60a000b  ! 105: AND_R	and 	%r8, %r11, %r19
	.word 0xb209400e  ! 105: AND_R	and 	%r5, %r14, %r25
	.word 0xb609400e  ! 105: AND_R	and 	%r5, %r14, %r27
	.word 0xb800e35f  ! 105: ADD_I	add 	%r3, 0x035f, %r28
	.word 0xae08e44f  ! 105: AND_I	and 	%r3, 0x044f, %r23
	.word 0xa61123d0  ! 105: OR_I	or 	%r4, 0x03d0, %r19
	.word 0xa40164d1  ! 105: ADD_I	add 	%r5, 0x04d1, %r18
	.word 0xb0018009  ! 105: ADD_R	add 	%r6, %r9, %r24
	.word 0xaa092a47  ! 105: AND_I	and 	%r4, 0x0a47, %r21
	.word 0xb610c009  ! 105: OR_R	or 	%r3, %r9, %r27
	.word 0xa8018009  ! 105: ADD_R	add 	%r6, %r9, %r20
	.word 0xac116457  ! 105: OR_I	or 	%r5, 0x0457, %r22
	.word 0xaa01000f  ! 105: ADD_R	add 	%r4, %r15, %r21
	.word 0xb0012781  ! 105: ADD_I	add 	%r4, 0x0781, %r24
	.word 0xa811a013  ! 105: OR_I	or 	%r6, 0x0013, %r20
	.word 0xa201eaaa  ! 105: ADD_I	add 	%r7, 0x0aaa, %r17
	.word 0xba02000e  ! 105: ADD_R	add 	%r8, %r14, %r29
	.word 0xaa016f00  ! 105: ADD_I	add 	%r5, 0x0f00, %r21
	.word 0xba02000f  ! 105: ADD_R	add 	%r8, %r15, %r29
	.word 0xaa012592  ! 105: ADD_I	add 	%r4, 0x0592, %r21
	.word 0xa201c00b  ! 105: ADD_R	add 	%r7, %r11, %r17
	.word 0xb010c00c  ! 105: OR_R	or 	%r3, %r12, %r24
	.word 0xa202000c  ! 105: ADD_R	add 	%r8, %r12, %r17
	.word 0xbe0a000d  ! 105: AND_R	and 	%r8, %r13, %r31
	.word 0xb408c009  ! 105: AND_R	and 	%r3, %r9, %r26
	.word 0xb009aafc  ! 105: AND_I	and 	%r6, 0x0afc, %r24
	.word 0xba11226c  ! 105: OR_I	or 	%r4, 0x026c, %r29
	.word 0xb409c00e  ! 105: AND_R	and 	%r7, %r14, %r26
	.word 0xae11a5db  ! 105: OR_I	or 	%r6, 0x05db, %r23
	.word 0xb409a3b4  ! 105: AND_I	and 	%r6, 0x03b4, %r26
	.word 0xac10c00a  ! 105: OR_R	or 	%r3, %r10, %r22
	.word 0xbc012ff5  ! 105: ADD_I	add 	%r4, 0x0ff5, %r30
	.word 0xb60a000e  ! 105: AND_R	and 	%r8, %r14, %r27
	.word 0xb2112d83  ! 105: OR_I	or 	%r4, 0x0d83, %r25
	.word 0xa610e3a0  ! 105: OR_I	or 	%r3, 0x03a0, %r19
	.word 0xae122ca8  ! 105: OR_I	or 	%r8, 0x0ca8, %r23
	.word 0xb809ebb0  ! 105: AND_I	and 	%r7, 0x0bb0, %r28
	.word 0xb811c00b  ! 105: OR_R	or 	%r7, %r11, %r28
	.word 0xb408c00a  ! 105: AND_R	and 	%r3, %r10, %r26
	.word 0xac11000d  ! 105: OR_R	or 	%r4, %r13, %r22
	.word 0xa40164dd  ! 105: ADD_I	add 	%r5, 0x04dd, %r18
	.word 0xba11a8b0  ! 105: OR_I	or 	%r6, 0x08b0, %r29
	.word 0xb6092b87  ! 105: AND_I	and 	%r4, 0x0b87, %r27
	.word 0xa801ec3f  ! 105: ADD_I	add 	%r7, 0x0c3f, %r20
	.word 0xb212000d  ! 105: OR_R	or 	%r8, %r13, %r25
	.word 0xbc00c00b  ! 105: ADD_R	add 	%r3, %r11, %r30
	.word 0xba00e9ec  ! 105: ADD_I	add 	%r3, 0x09ec, %r29
	.word 0xb800ea2e  ! 105: ADD_I	add 	%r3, 0x0a2e, %r28
	.word 0xac09a3fc  ! 105: AND_I	and 	%r6, 0x03fc, %r22
	.word 0xac00c00f  ! 105: ADD_R	add 	%r3, %r15, %r22
	.word 0xaa09eb1b  ! 105: AND_I	and 	%r7, 0x0b1b, %r21
	.word 0xac01e669  ! 105: ADD_I	add 	%r7, 0x0669, %r22
	.word 0xac00c00e  ! 105: ADD_R	add 	%r3, %r14, %r22
	.word 0xb20966d9  ! 105: AND_I	and 	%r5, 0x06d9, %r25
	.word 0xaa00c009  ! 105: ADD_R	add 	%r3, %r9, %r21
	.word 0xa4110009  ! 105: OR_R	or 	%r4, %r9, %r18
	.word 0xa80123b9  ! 105: ADD_I	add 	%r4, 0x03b9, %r20
	.word 0xa6012829  ! 105: ADD_I	add 	%r4, 0x0829, %r19
	.word 0xae0a2b6a  ! 105: AND_I	and 	%r8, 0x0b6a, %r23
	.word 0xba01ae7c  ! 105: ADD_I	add 	%r6, 0x0e7c, %r29
	.word 0xb010e1fc  ! 105: OR_I	or 	%r3, 0x01fc, %r24
	.word 0xb409800c  ! 105: AND_R	and 	%r6, %r12, %r26
	.word 0xb611400c  ! 105: OR_R	or 	%r5, %r12, %r27
	.word 0xbe096809  ! 105: AND_I	and 	%r5, 0x0809, %r31
	.word 0xaa09208e  ! 105: AND_I	and 	%r4, 0x008e, %r21
	.word 0xbc10c009  ! 105: OR_R	or 	%r3, %r9, %r30
	.word 0xa4096076  ! 105: AND_I	and 	%r5, 0x0076, %r18
	.word 0xa809400d  ! 105: AND_R	and 	%r5, %r13, %r20
	.word 0xa211c00d  ! 105: OR_R	or 	%r7, %r13, %r17
	.word 0xb411e311  ! 105: OR_I	or 	%r7, 0x0311, %r26
	.word 0xbe10c009  ! 105: OR_R	or 	%r3, %r9, %r31
	.word 0xa4092968  ! 105: AND_I	and 	%r4, 0x0968, %r18
	.word 0xb808ea84  ! 105: AND_I	and 	%r3, 0x0a84, %r28
	.word 0xbc09000e  ! 105: AND_R	and 	%r4, %r14, %r30
	.word 0xa402000f  ! 105: ADD_R	add 	%r8, %r15, %r18
	.word 0xa600e524  ! 105: ADD_I	add 	%r3, 0x0524, %r19
	.word 0xb6012cda  ! 105: ADD_I	add 	%r4, 0x0cda, %r27
	.word 0xa201aee2  ! 105: ADD_I	add 	%r6, 0x0ee2, %r17
	.word 0xbc09ed9c  ! 105: AND_I	and 	%r7, 0x0d9c, %r30
	.word 0xb811800b  ! 105: OR_R	or 	%r6, %r11, %r28
	.word 0xb80a2f75  ! 105: AND_I	and 	%r8, 0x0f75, %r28
	.word 0xb408eb35  ! 105: AND_I	and 	%r3, 0x0b35, %r26
	.word 0xa410e5c8  ! 105: OR_I	or 	%r3, 0x05c8, %r18
	.word 0xb201a8e8  ! 105: ADD_I	add 	%r6, 0x08e8, %r25
	.word 0xb00a22d9  ! 105: AND_I	and 	%r8, 0x02d9, %r24
	.word 0xa4116040  ! 105: OR_I	or 	%r5, 0x0040, %r18
	.word 0xe620ed78  ! 105: STW_I	stw	%r19, [%r3 + 0x0d78]
	.word 0xfa30e478  ! 105: STH_I	sth	%r29, [%r3 + 0x0478]
	.word 0xe829a47d  ! 105: STB_I	stb	%r20, [%r6 + 0x047d]
	.word 0xec21a410  ! 105: STW_I	stw	%r22, [%r6 + 0x0410]
	.word 0xf830eeb6  ! 105: STH_I	sth	%r28, [%r3 + 0x0eb6]
	.word 0xf6722568  ! 107: STX_I	stx	%r27, [%r8 + 0x0568]
	.word 0xba19c00d  ! 108: XOR_R	xor 	%r7, %r13, %r29
	.word 0xf230e374  ! 109: STH_I	sth	%r25, [%r3 + 0x0374]
	.word 0xeaa9a45a  ! 110: STBA_I	stba	%r21, [%r6 + 0x045a] %asi
	.word 0xee42000a  ! 111: LDSW_R	ldsw	[%r8 + %r10], %r23
	.word 0xaa01400c  ! 111: ADD_R	add 	%r5, %r12, %r21
	.word 0xae01000a  ! 111: ADD_R	add 	%r4, %r10, %r23
	.word 0xbe11a6d4  ! 111: OR_I	or 	%r6, 0x06d4, %r31
	bne thr2_loop_8
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_9:
	.word 0xac01c00a  ! 119: ADD_R	add 	%r7, %r10, %r22
	.word 0xa4096e94  ! 119: AND_I	and 	%r5, 0x0e94, %r18
	.word 0xa810c00a  ! 119: OR_R	or 	%r3, %r10, %r20
	.word 0xaa014009  ! 119: ADD_R	add 	%r5, %r9, %r21
	.word 0xac096666  ! 119: AND_I	and 	%r5, 0x0666, %r22
	.word 0xb210e3a9  ! 119: OR_I	or 	%r3, 0x03a9, %r25
	.word 0xb409686c  ! 119: AND_I	and 	%r5, 0x086c, %r26
	.word 0xba10e737  ! 119: OR_I	or 	%r3, 0x0737, %r29
	.word 0xa800c00e  ! 119: ADD_R	add 	%r3, %r14, %r20
	.word 0xa811a369  ! 119: OR_I	or 	%r6, 0x0369, %r20
	.word 0xb608ea57  ! 119: AND_I	and 	%r3, 0x0a57, %r27
	.word 0xbe09c00d  ! 119: AND_R	and 	%r7, %r13, %r31
	.word 0xac11400a  ! 119: OR_R	or 	%r5, %r10, %r22
	.word 0xb212000b  ! 119: OR_R	or 	%r8, %r11, %r25
	.word 0xb611a96e  ! 119: OR_I	or 	%r6, 0x096e, %r27
	.word 0xae01000c  ! 119: ADD_R	add 	%r4, %r12, %r23
	.word 0xa800ead2  ! 119: ADD_I	add 	%r3, 0x0ad2, %r20
	.word 0xa610ecb1  ! 119: OR_I	or 	%r3, 0x0cb1, %r19
	.word 0xb60a2154  ! 119: AND_I	and 	%r8, 0x0154, %r27
	.word 0xa809400b  ! 119: AND_R	and 	%r5, %r11, %r20
	.word 0xbe01eeba  ! 119: ADD_I	add 	%r7, 0x0eba, %r31
	.word 0xa809800f  ! 119: AND_R	and 	%r6, %r15, %r20
	.word 0xb408c00e  ! 119: AND_R	and 	%r3, %r14, %r26
	.word 0xa6122fdb  ! 119: OR_I	or 	%r8, 0x0fdb, %r19
	.word 0xbc01a9f2  ! 119: ADD_I	add 	%r6, 0x09f2, %r30
	.word 0xb412000b  ! 119: OR_R	or 	%r8, %r11, %r26
	.word 0xae00ee9b  ! 119: ADD_I	add 	%r3, 0x0e9b, %r23
	.word 0xb409c00e  ! 119: AND_R	and 	%r7, %r14, %r26
	.word 0xb601ef57  ! 119: ADD_I	add 	%r7, 0x0f57, %r27
	.word 0xb610ec00  ! 119: OR_I	or 	%r3, 0x0c00, %r27
	.word 0xb810c00b  ! 119: OR_R	or 	%r3, %r11, %r28
	.word 0xba120009  ! 119: OR_R	or 	%r8, %r9, %r29
	.word 0xba016acc  ! 119: ADD_I	add 	%r5, 0x0acc, %r29
	.word 0xae01800f  ! 119: ADD_R	add 	%r6, %r15, %r23
	.word 0xba00ea9c  ! 119: ADD_I	add 	%r3, 0x0a9c, %r29
	.word 0xbe01c00b  ! 119: ADD_R	add 	%r7, %r11, %r31
	.word 0xb2116e9b  ! 119: OR_I	or 	%r5, 0x0e9b, %r25
	.word 0xbe016f47  ! 119: ADD_I	add 	%r5, 0x0f47, %r31
	.word 0xaa01800d  ! 119: ADD_R	add 	%r6, %r13, %r21
	.word 0xa611e614  ! 119: OR_I	or 	%r7, 0x0614, %r19
	.word 0xb211400b  ! 119: OR_R	or 	%r5, %r11, %r25
	.word 0xaa08c00d  ! 119: AND_R	and 	%r3, %r13, %r21
	.word 0xa401a74d  ! 119: ADD_I	add 	%r6, 0x074d, %r18
	.word 0xbe01800d  ! 119: ADD_R	add 	%r6, %r13, %r31
	.word 0xb6096f3b  ! 119: AND_I	and 	%r5, 0x0f3b, %r27
	.word 0xac11a3b8  ! 119: OR_I	or 	%r6, 0x03b8, %r22
	.word 0xaa00e042  ! 119: ADD_I	add 	%r3, 0x0042, %r21
	.word 0xb609800e  ! 119: AND_R	and 	%r6, %r14, %r27
	.word 0xb409c00e  ! 119: AND_R	and 	%r7, %r14, %r26
	.word 0xaa10ed65  ! 119: OR_I	or 	%r3, 0x0d65, %r21
	.word 0xb411800a  ! 119: OR_R	or 	%r6, %r10, %r26
	.word 0xb408e3bc  ! 119: AND_I	and 	%r3, 0x03bc, %r26
	.word 0xb611400f  ! 119: OR_R	or 	%r5, %r15, %r27
	.word 0xa801e7eb  ! 119: ADD_I	add 	%r7, 0x07eb, %r20
	.word 0xa401ef3d  ! 119: ADD_I	add 	%r7, 0x0f3d, %r18
	.word 0xac016c17  ! 119: ADD_I	add 	%r5, 0x0c17, %r22
	.word 0xaa01201d  ! 119: ADD_I	add 	%r4, 0x001d, %r21
	.word 0xaa09000c  ! 119: AND_R	and 	%r4, %r12, %r21
	.word 0xba096a90  ! 119: AND_I	and 	%r5, 0x0a90, %r29
	.word 0xb6016d7e  ! 119: ADD_I	add 	%r5, 0x0d7e, %r27
	.word 0xa401a386  ! 119: ADD_I	add 	%r6, 0x0386, %r18
	.word 0xaa11c00f  ! 119: OR_R	or 	%r7, %r15, %r21
	.word 0xa610c00e  ! 119: OR_R	or 	%r3, %r14, %r19
	.word 0xa4116ea5  ! 119: OR_I	or 	%r5, 0x0ea5, %r18
	.word 0xb8092171  ! 119: AND_I	and 	%r4, 0x0171, %r28
	.word 0xac09a8bc  ! 119: AND_I	and 	%r6, 0x08bc, %r22
	.word 0xb801400b  ! 119: ADD_R	add 	%r5, %r11, %r28
	.word 0xb80925ef  ! 119: AND_I	and 	%r4, 0x05ef, %r28
	.word 0xaa11e05e  ! 119: OR_I	or 	%r7, 0x005e, %r21
	.word 0xbe09400e  ! 119: AND_R	and 	%r5, %r14, %r31
	.word 0xae01400a  ! 119: ADD_R	add 	%r5, %r10, %r23
	.word 0xb209800c  ! 119: AND_R	and 	%r6, %r12, %r25
	.word 0xa809800d  ! 119: AND_R	and 	%r6, %r13, %r20
	.word 0xb809c009  ! 119: AND_R	and 	%r7, %r9, %r28
	.word 0xb210ecc6  ! 119: OR_I	or 	%r3, 0x0cc6, %r25
	.word 0xb6012e7c  ! 119: ADD_I	add 	%r4, 0x0e7c, %r27
	.word 0xa60968a8  ! 119: AND_I	and 	%r5, 0x08a8, %r19
	.word 0xbe09c009  ! 119: AND_R	and 	%r7, %r9, %r31
	.word 0xaa012a49  ! 119: ADD_I	add 	%r4, 0x0a49, %r21
	.word 0xee31e07e  ! 119: STH_I	sth	%r23, [%r7 + 0x007e]
	.word 0xe63226d2  ! 119: STH_I	sth	%r19, [%r8 + 0x06d2]
	.word 0xe2292abc  ! 119: STB_I	stb	%r17, [%r4 + 0x0abc]
	.word 0xea312456  ! 119: STH_I	sth	%r21, [%r4 + 0x0456]
	.word 0xec30eae6  ! 119: STH_I	sth	%r22, [%r3 + 0x0ae6]
	.word 0xe621ea78  ! 119: STW_I	stw	%r19, [%r7 + 0x0a78]
	.word 0xfc21a5a0  ! 119: STW_I	stw	%r30, [%r6 + 0x05a0]
DC_ERR_6:
!$EV error(2,expr(@VA(.MAIN.DC_ERR_6), 16, 16),1,DC_DATA,13)
	.word 0xf0496eb9  ! 122: LDSB_I	ldsb	[%r5 + 0x0eb9], %r24
	.word 0xbf78040b  ! 122: MOVR_R	move	%r0, %r11, %r31
	.word 0xe8312562  ! 123: STH_I	sth	%r20, [%r4 + 0x0562]
	.word 0xfc49e178  ! 124: LDSB_I	ldsb	[%r7 + 0x0178], %r30
	.word 0xa801ecb7  ! 124: ADD_I	add 	%r7, 0x0cb7, %r20
	.word 0xb812000a  ! 124: OR_R	or 	%r8, %r10, %r28
	.word 0xb61166a9  ! 124: OR_I	or 	%r5, 0x06a9, %r27
	bne thr2_loop_9
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_10:
	.word 0xb212000f  ! 130: OR_R	or 	%r8, %r15, %r25
	.word 0xa611c009  ! 130: OR_R	or 	%r7, %r9, %r19
	.word 0xaa0a0009  ! 130: AND_R	and 	%r8, %r9, %r21
	.word 0xaa092b58  ! 130: AND_I	and 	%r4, 0x0b58, %r21
	.word 0xb201400f  ! 130: ADD_R	add 	%r5, %r15, %r25
	.word 0xa401a7f5  ! 130: ADD_I	add 	%r6, 0x07f5, %r18
	.word 0xa80125f1  ! 130: ADD_I	add 	%r4, 0x05f1, %r20
	.word 0xaa0163a9  ! 130: ADD_I	add 	%r5, 0x03a9, %r21
	.word 0xbe116658  ! 130: OR_I	or 	%r5, 0x0658, %r31
	.word 0xb800e549  ! 130: ADD_I	add 	%r3, 0x0549, %r28
	.word 0xac11e109  ! 130: OR_I	or 	%r7, 0x0109, %r22
	.word 0xb801800e  ! 130: ADD_R	add 	%r6, %r14, %r28
	.word 0xae11800b  ! 130: OR_R	or 	%r6, %r11, %r23
	.word 0xae12000c  ! 130: OR_R	or 	%r8, %r12, %r23
	.word 0xa208c00f  ! 130: AND_R	and 	%r3, %r15, %r17
	.word 0xa6092c11  ! 130: AND_I	and 	%r4, 0x0c11, %r19
	.word 0xa8096e56  ! 130: AND_I	and 	%r5, 0x0e56, %r20
	.word 0xb60127fe  ! 130: ADD_I	add 	%r4, 0x07fe, %r27
	.word 0xb801c009  ! 130: ADD_R	add 	%r7, %r9, %r28
	.word 0xa210c00c  ! 130: OR_R	or 	%r3, %r12, %r17
	.word 0xaa11c00d  ! 130: OR_R	or 	%r7, %r13, %r21
	.word 0xb409400c  ! 130: AND_R	and 	%r5, %r12, %r26
	.word 0xa212000b  ! 130: OR_R	or 	%r8, %r11, %r17
	.word 0xac01acee  ! 130: ADD_I	add 	%r6, 0x0cee, %r22
	.word 0xb401a04d  ! 130: ADD_I	add 	%r6, 0x004d, %r26
	.word 0xb200e739  ! 130: ADD_I	add 	%r3, 0x0739, %r25
	.word 0xb401e0c7  ! 130: ADD_I	add 	%r7, 0x00c7, %r26
	.word 0xb800c00b  ! 130: ADD_R	add 	%r3, %r11, %r28
	.word 0xb801e3e6  ! 130: ADD_I	add 	%r7, 0x03e6, %r28
	.word 0xba09efc8  ! 130: AND_I	and 	%r7, 0x0fc8, %r29
	.word 0xac0a2a67  ! 130: AND_I	and 	%r8, 0x0a67, %r22
	.word 0xbe01e241  ! 130: ADD_I	add 	%r7, 0x0241, %r31
	.word 0xae09000c  ! 130: AND_R	and 	%r4, %r12, %r23
	.word 0xbc09ece4  ! 130: AND_I	and 	%r7, 0x0ce4, %r30
	.word 0xae012e62  ! 130: ADD_I	add 	%r4, 0x0e62, %r23
	.word 0xae09000f  ! 130: AND_R	and 	%r4, %r15, %r23
	.word 0xac1126a9  ! 130: OR_I	or 	%r4, 0x06a9, %r22
	.word 0xba090009  ! 130: AND_R	and 	%r4, %r9, %r29
	.word 0xbe0a2ded  ! 130: AND_I	and 	%r8, 0x0ded, %r31
	.word 0xb411000d  ! 130: OR_R	or 	%r4, %r13, %r26
	.word 0xbc01eced  ! 130: ADD_I	add 	%r7, 0x0ced, %r30
	.word 0xbc12000a  ! 130: OR_R	or 	%r8, %r10, %r30
	.word 0xa201a96a  ! 130: ADD_I	add 	%r6, 0x096a, %r17
	.word 0xb601a796  ! 130: ADD_I	add 	%r6, 0x0796, %r27
	.word 0xac01800e  ! 130: ADD_R	add 	%r6, %r14, %r22
	.word 0xb001800c  ! 130: ADD_R	add 	%r6, %r12, %r24
	.word 0xa40a24a1  ! 130: AND_I	and 	%r8, 0x04a1, %r18
	.word 0xb0094009  ! 130: AND_R	and 	%r5, %r9, %r24
	.word 0xb010c009  ! 130: OR_R	or 	%r3, %r9, %r24
	.word 0xb211603a  ! 130: OR_I	or 	%r5, 0x003a, %r25
	.word 0xb801e9e4  ! 130: ADD_I	add 	%r7, 0x09e4, %r28
	.word 0xa4092116  ! 130: AND_I	and 	%r4, 0x0116, %r18
	.word 0xb411a696  ! 130: OR_I	or 	%r6, 0x0696, %r26
	.word 0xb80a000a  ! 130: AND_R	and 	%r8, %r10, %r28
	.word 0xb00a216f  ! 130: AND_I	and 	%r8, 0x016f, %r24
	.word 0xaa09a9a9  ! 130: AND_I	and 	%r6, 0x09a9, %r21
	.word 0xbc01a5bb  ! 130: ADD_I	add 	%r6, 0x05bb, %r30
	.word 0xba11edd5  ! 130: OR_I	or 	%r7, 0x0dd5, %r29
	.word 0xae116d62  ! 130: OR_I	or 	%r5, 0x0d62, %r23
	.word 0xb811e53a  ! 130: OR_I	or 	%r7, 0x053a, %r28
	.word 0xaa10c00a  ! 130: OR_R	or 	%r3, %r10, %r21
	.word 0xa601000a  ! 130: ADD_R	add 	%r4, %r10, %r19
	.word 0xbe0960d1  ! 130: AND_I	and 	%r5, 0x00d1, %r31
	.word 0xb4116ef5  ! 130: OR_I	or 	%r5, 0x0ef5, %r26
	.word 0xbe01ebea  ! 130: ADD_I	add 	%r7, 0x0bea, %r31
	.word 0xbe11c00b  ! 130: OR_R	or 	%r7, %r11, %r31
	.word 0xa409e978  ! 130: AND_I	and 	%r7, 0x0978, %r18
	.word 0xb802252c  ! 130: ADD_I	add 	%r8, 0x052c, %r28
	.word 0xb801e83d  ! 130: ADD_I	add 	%r7, 0x083d, %r28
	.word 0xb009274c  ! 130: AND_I	and 	%r4, 0x074c, %r24
	.word 0xa40a2787  ! 130: AND_I	and 	%r8, 0x0787, %r18
	.word 0xb011e2ca  ! 130: OR_I	or 	%r7, 0x02ca, %r24
	.word 0xae11400c  ! 130: OR_R	or 	%r5, %r12, %r23
	.word 0xac11400c  ! 130: OR_R	or 	%r5, %r12, %r22
	.word 0xaa11000c  ! 130: OR_R	or 	%r4, %r12, %r21
	.word 0xbe01e00b  ! 130: ADD_I	add 	%r7, 0x000b, %r31
	.word 0xbe01e602  ! 130: ADD_I	add 	%r7, 0x0602, %r31
	.word 0xa410c00d  ! 130: OR_R	or 	%r3, %r13, %r18
	.word 0xac120009  ! 130: OR_R	or 	%r8, %r9, %r22
	.word 0xbc01000d  ! 130: ADD_R	add 	%r4, %r13, %r30
	.word 0xa2096e39  ! 130: AND_I	and 	%r5, 0x0e39, %r17
	.word 0xb80225f4  ! 130: ADD_I	add 	%r8, 0x05f4, %r28
	.word 0xb201a899  ! 130: ADD_I	add 	%r6, 0x0899, %r25
	.word 0xb811400f  ! 130: OR_R	or 	%r5, %r15, %r28
	.word 0xb8092a58  ! 130: AND_I	and 	%r4, 0x0a58, %r28
	.word 0xba01800d  ! 130: ADD_R	add 	%r6, %r13, %r29
	.word 0xac09400b  ! 130: AND_R	and 	%r5, %r11, %r22
	.word 0xa600c009  ! 130: ADD_R	add 	%r3, %r9, %r19
	.word 0xba014009  ! 130: ADD_R	add 	%r5, %r9, %r29
	.word 0xa208e5d4  ! 130: AND_I	and 	%r3, 0x05d4, %r17
	.word 0xa811c00f  ! 130: OR_R	or 	%r7, %r15, %r20
	.word 0xac01e121  ! 130: ADD_I	add 	%r7, 0x0121, %r22
	.word 0xac096e54  ! 130: AND_I	and 	%r5, 0x0e54, %r22
	.word 0xba022404  ! 130: ADD_I	add 	%r8, 0x0404, %r29
	.word 0xbc0a000d  ! 130: AND_R	and 	%r8, %r13, %r30
	.word 0xbe092569  ! 130: AND_I	and 	%r4, 0x0569, %r31
	.word 0xae11a9d2  ! 130: OR_I	or 	%r6, 0x09d2, %r23
	.word 0xb6122671  ! 130: OR_I	or 	%r8, 0x0671, %r27
	.word 0xbe01aa97  ! 130: ADD_I	add 	%r6, 0x0a97, %r31
	.word 0xa611000d  ! 130: OR_R	or 	%r4, %r13, %r19
	.word 0xbc11249e  ! 130: OR_I	or 	%r4, 0x049e, %r30
	.word 0xb6112b15  ! 130: OR_I	or 	%r4, 0x0b15, %r27
	.word 0xb810c00c  ! 130: OR_R	or 	%r3, %r12, %r28
	.word 0xbe10ed68  ! 130: OR_I	or 	%r3, 0x0d68, %r31
	.word 0xae122997  ! 130: OR_I	or 	%r8, 0x0997, %r23
	.word 0xba01a855  ! 130: ADD_I	add 	%r6, 0x0855, %r29
	.word 0xb400e640  ! 130: ADD_I	add 	%r3, 0x0640, %r26
	.word 0xbe00c009  ! 130: ADD_R	add 	%r3, %r9, %r31
	.word 0xbc012e31  ! 130: ADD_I	add 	%r4, 0x0e31, %r30
	.word 0xb801000f  ! 130: ADD_R	add 	%r4, %r15, %r28
	.word 0xb009e87c  ! 130: AND_I	and 	%r7, 0x087c, %r24
	.word 0xbe12000d  ! 130: OR_R	or 	%r8, %r13, %r31
	.word 0xb611a7a1  ! 130: OR_I	or 	%r6, 0x07a1, %r27
	.word 0xbc00ec47  ! 130: ADD_I	add 	%r3, 0x0c47, %r30
	.word 0xa811000e  ! 130: OR_R	or 	%r4, %r14, %r20
	.word 0xb601400d  ! 130: ADD_R	add 	%r5, %r13, %r27
	.word 0xa211a437  ! 130: OR_I	or 	%r6, 0x0437, %r17
	.word 0xb001c00f  ! 130: ADD_R	add 	%r7, %r15, %r24
	.word 0xb4114009  ! 130: OR_R	or 	%r5, %r9, %r26
	.word 0xbe11af93  ! 130: OR_I	or 	%r6, 0x0f93, %r31
	.word 0xbe11800b  ! 130: OR_R	or 	%r6, %r11, %r31
	.word 0xa209000f  ! 130: AND_R	and 	%r4, %r15, %r17
	.word 0xa812000d  ! 130: OR_R	or 	%r8, %r13, %r20
	.word 0xbe00e4b9  ! 130: ADD_I	add 	%r3, 0x04b9, %r31
	.word 0xbe08c00b  ! 130: AND_R	and 	%r3, %r11, %r31
	.word 0xb2122f5d  ! 130: OR_I	or 	%r8, 0x0f5d, %r25
	.word 0xa40168c7  ! 130: ADD_I	add 	%r5, 0x08c7, %r18
	.word 0xf82921d7  ! 130: STB_I	stb	%r28, [%r4 + 0x01d7]
	.word 0xf23126a2  ! 130: STH_I	sth	%r25, [%r4 + 0x06a2]
	.word 0xfe21e55c  ! 130: STW_I	stw	%r31, [%r7 + 0x055c]
	.word 0xe628e6af  ! 130: STB_I	stb	%r19, [%r3 + 0x06af]
	.word 0xe470e478  ! 130: STX_I	stx	%r18, [%r3 + 0x0478]
	.word 0xea322426  ! 131: STH_I	sth	%r21, [%r8 + 0x0426]
	.word 0xae010045
	.word 0xf629a461  ! 133: STB_I	stb	%r27, [%r6 + 0x0461]
	.word 0xfe71a8e8  ! 134: STX_I	stx	%r31, [%r6 + 0x08e8]
	.word 0xb651e626  ! 135: UMUL_I	umul 	%r7, 0x0626, %r27
	.word 0xac01000e  ! 135: ADD_R	add 	%r4, %r14, %r22
	.word 0xba10ed3b  ! 135: OR_I	or 	%r3, 0x0d3b, %r29
	.word 0xb609e065  ! 135: AND_I	and 	%r7, 0x0065, %r27
	bne thr2_loop_10
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_11:
	.word 0xaa0a2d8b  ! 143: AND_I	and 	%r8, 0x0d8b, %r21
	.word 0xac096d38  ! 143: AND_I	and 	%r5, 0x0d38, %r22
	.word 0xb201a5ef  ! 143: ADD_I	add 	%r6, 0x05ef, %r25
	.word 0xb001ef30  ! 143: ADD_I	add 	%r7, 0x0f30, %r24
	.word 0xaa01000d  ! 143: ADD_R	add 	%r4, %r13, %r21
	.word 0xac01400a  ! 143: ADD_R	add 	%r5, %r10, %r22
	.word 0xae1122e6  ! 143: OR_I	or 	%r4, 0x02e6, %r23
	.word 0xbc0160b3  ! 143: ADD_I	add 	%r5, 0x00b3, %r30
	.word 0xac01400d  ! 143: ADD_R	add 	%r5, %r13, %r22
	.word 0xba01ad19  ! 143: ADD_I	add 	%r6, 0x0d19, %r29
	.word 0xb0116733  ! 143: OR_I	or 	%r5, 0x0733, %r24
	.word 0xb801235e  ! 143: ADD_I	add 	%r4, 0x035e, %r28
	.word 0xb6096c6b  ! 143: AND_I	and 	%r5, 0x0c6b, %r27
	.word 0xb009800b  ! 143: AND_R	and 	%r6, %r11, %r24
	.word 0xbe01800f  ! 143: ADD_R	add 	%r6, %r15, %r31
	.word 0xb601800b  ! 143: ADD_R	add 	%r6, %r11, %r27
	.word 0xae01aac6  ! 143: ADD_I	add 	%r6, 0x0ac6, %r23
	.word 0xb601653d  ! 143: ADD_I	add 	%r5, 0x053d, %r27
	.word 0xaa01a1a6  ! 143: ADD_I	add 	%r6, 0x01a6, %r21
	.word 0xa211afc1  ! 143: OR_I	or 	%r6, 0x0fc1, %r17
	.word 0xa8112c59  ! 143: OR_I	or 	%r4, 0x0c59, %r20
	.word 0xb401a518  ! 143: ADD_I	add 	%r6, 0x0518, %r26
	.word 0xb2122181  ! 143: OR_I	or 	%r8, 0x0181, %r25
	.word 0xb401400a  ! 143: ADD_R	add 	%r5, %r10, %r26
	.word 0xbc0963d1  ! 143: AND_I	and 	%r5, 0x03d1, %r30
	.word 0xba10e163  ! 143: OR_I	or 	%r3, 0x0163, %r29
	.word 0xb801e1b3  ! 143: ADD_I	add 	%r7, 0x01b3, %r28
	.word 0xbc012cce  ! 143: ADD_I	add 	%r4, 0x0cce, %r30
	.word 0xb001ea09  ! 143: ADD_I	add 	%r7, 0x0a09, %r24
	.word 0xae096225  ! 143: AND_I	and 	%r5, 0x0225, %r23
	.word 0xaa09ea56  ! 143: AND_I	and 	%r7, 0x0a56, %r21
	.word 0xb411a333  ! 143: OR_I	or 	%r6, 0x0333, %r26
	.word 0xa201aa67  ! 143: ADD_I	add 	%r6, 0x0a67, %r17
	.word 0xa211000d  ! 143: OR_R	or 	%r4, %r13, %r17
	.word 0xb801c009  ! 143: ADD_R	add 	%r7, %r9, %r28
	.word 0xa801a42a  ! 143: ADD_I	add 	%r6, 0x042a, %r20
	.word 0xbc09000d  ! 143: AND_R	and 	%r4, %r13, %r30
	.word 0xa60160ef  ! 143: ADD_I	add 	%r5, 0x00ef, %r19
	.word 0xbe00c00f  ! 143: ADD_R	add 	%r3, %r15, %r31
	.word 0xba00c00a  ! 143: ADD_R	add 	%r3, %r10, %r29
	.word 0xb40a22bb  ! 143: AND_I	and 	%r8, 0x02bb, %r26
	.word 0xb809400a  ! 143: AND_R	and 	%r5, %r10, %r28
	.word 0xb601000f  ! 143: ADD_R	add 	%r4, %r15, %r27
	.word 0xbe0a2acd  ! 143: AND_I	and 	%r8, 0x0acd, %r31
	.word 0xac09400b  ! 143: AND_R	and 	%r5, %r11, %r22
	.word 0xb809c00f  ! 143: AND_R	and 	%r7, %r15, %r28
	.word 0xa20a221f  ! 143: AND_I	and 	%r8, 0x021f, %r17
	.word 0xb001400d  ! 143: ADD_R	add 	%r5, %r13, %r24
	.word 0xa209e98b  ! 143: AND_I	and 	%r7, 0x098b, %r17
	.word 0xb409800a  ! 143: AND_R	and 	%r6, %r10, %r26
	.word 0xb011e76e  ! 143: OR_I	or 	%r7, 0x076e, %r24
	.word 0xac01800a  ! 143: ADD_R	add 	%r6, %r10, %r22
	.word 0xbc00e766  ! 143: ADD_I	add 	%r3, 0x0766, %r30
	.word 0xac08c009  ! 143: AND_R	and 	%r3, %r9, %r22
	.word 0xaa01000f  ! 143: ADD_R	add 	%r4, %r15, %r21
	.word 0xbe09000d  ! 143: AND_R	and 	%r4, %r13, %r31
	.word 0xac09e96a  ! 143: AND_I	and 	%r7, 0x096a, %r22
	.word 0xb011800b  ! 143: OR_R	or 	%r6, %r11, %r24
	.word 0xb2112457  ! 143: OR_I	or 	%r4, 0x0457, %r25
	.word 0xb2012e31  ! 143: ADD_I	add 	%r4, 0x0e31, %r25
	.word 0xbe11000e  ! 143: OR_R	or 	%r4, %r14, %r31
	.word 0xb611a265  ! 143: OR_I	or 	%r6, 0x0265, %r27
	.word 0xb6096337  ! 143: AND_I	and 	%r5, 0x0337, %r27
	.word 0xb2022582  ! 143: ADD_I	add 	%r8, 0x0582, %r25
	.word 0xac0126d1  ! 143: ADD_I	add 	%r4, 0x06d1, %r22
	.word 0xbe09c00b  ! 143: AND_R	and 	%r7, %r11, %r31
	.word 0xb001a43a  ! 143: ADD_I	add 	%r6, 0x043a, %r24
	.word 0xb001ecbf  ! 143: ADD_I	add 	%r7, 0x0cbf, %r24
	.word 0xb412000d  ! 143: OR_R	or 	%r8, %r13, %r26
	.word 0xa201400e  ! 143: ADD_R	add 	%r5, %r14, %r17
	.word 0xb011800d  ! 143: OR_R	or 	%r6, %r13, %r24
	.word 0xb610c00d  ! 143: OR_R	or 	%r3, %r13, %r27
	.word 0xa609c00d  ! 143: AND_R	and 	%r7, %r13, %r19
	.word 0xb809a080  ! 143: AND_I	and 	%r6, 0x0080, %r28
	.word 0xb408ec4b  ! 143: AND_I	and 	%r3, 0x0c4b, %r26
	.word 0xaa01a4b6  ! 143: ADD_I	add 	%r6, 0x04b6, %r21
	.word 0xaa016748  ! 143: ADD_I	add 	%r5, 0x0748, %r21
	.word 0xa201e8cd  ! 143: ADD_I	add 	%r7, 0x08cd, %r17
	.word 0xa211e6ef  ! 143: OR_I	or 	%r7, 0x06ef, %r17
	.word 0xb611000e  ! 143: OR_R	or 	%r4, %r14, %r27
	.word 0xa609c00a  ! 143: AND_R	and 	%r7, %r10, %r19
	.word 0xaa01400a  ! 143: ADD_R	add 	%r5, %r10, %r21
	.word 0xba014009  ! 143: ADD_R	add 	%r5, %r9, %r29
	.word 0xb6022325  ! 143: ADD_I	add 	%r8, 0x0325, %r27
	.word 0xac01a78e  ! 143: ADD_I	add 	%r6, 0x078e, %r22
	.word 0xb208e8d5  ! 143: AND_I	and 	%r3, 0x08d5, %r25
	.word 0xa20226d2  ! 143: ADD_I	add 	%r8, 0x06d2, %r17
	.word 0xee29affa  ! 143: STB_I	stb	%r23, [%r6 + 0x0ffa]
	.word 0xf221a2ec  ! 143: STW_I	stw	%r25, [%r6 + 0x02ec]
	.word 0xec21a808  ! 143: STW_I	stw	%r22, [%r6 + 0x0808]
	.word 0xf231212a  ! 143: STH_I	sth	%r25, [%r4 + 0x012a]
	.word 0xe471eaf8  ! 143: STX_I	stx	%r18, [%r7 + 0x0af8]
	.word 0xfa31e0c6  ! 143: STH_I	sth	%r29, [%r7 + 0x00c6]
	.word 0xfe21a634  ! 143: STW_I	stw	%r31, [%r6 + 0x0634]
DC_ERR_10:
!$EV error(2,expr(@VA(.MAIN.DC_ERR_10), 16, 16),1,DC_DATA,12)
	.word 0xe201a494  ! 146: LDUW_I	lduw	[%r6 + 0x0494], %r17
	.word 0xaa322b24  ! 146: ORN_I	orn 	%r8, 0x0b24, %r21
	.word 0xec7160f0  ! 147: STX_I	stx	%r22, [%r5 + 0x00f0]
	.word 0xe641274c  ! 148: LDSW_I	ldsw	[%r4 + 0x074c], %r19
	.word 0xb001000c  ! 148: ADD_R	add 	%r4, %r12, %r24
	.word 0xbe01abfe  ! 148: ADD_I	add 	%r6, 0x0bfe, %r31
	.word 0xaa00c00f  ! 148: ADD_R	add 	%r3, %r15, %r21
	bne thr2_loop_11
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_12:
	.word 0xb012000a  ! 156: OR_R	or 	%r8, %r10, %r24
	.word 0xba112362  ! 156: OR_I	or 	%r4, 0x0362, %r29
	.word 0xbe11a4f3  ! 156: OR_I	or 	%r6, 0x04f3, %r31
	.word 0xa601254b  ! 156: ADD_I	add 	%r4, 0x054b, %r19
	.word 0xae10c009  ! 156: OR_R	or 	%r3, %r9, %r23
	.word 0xae00ea51  ! 156: ADD_I	add 	%r3, 0x0a51, %r23
	.word 0xb80a000c  ! 156: AND_R	and 	%r8, %r12, %r28
	.word 0xb211282d  ! 156: OR_I	or 	%r4, 0x082d, %r25
	.word 0xb80a000a  ! 156: AND_R	and 	%r8, %r10, %r28
	.word 0xb0096781  ! 156: AND_I	and 	%r5, 0x0781, %r24
	.word 0xbe02000d  ! 156: ADD_R	add 	%r8, %r13, %r31
	.word 0xa209000c  ! 156: AND_R	and 	%r4, %r12, %r17
	.word 0xb0116ff2  ! 156: OR_I	or 	%r5, 0x0ff2, %r24
	.word 0xb2016440  ! 156: ADD_I	add 	%r5, 0x0440, %r25
	.word 0xa611a676  ! 156: OR_I	or 	%r6, 0x0676, %r19
	.word 0xbc10c00d  ! 156: OR_R	or 	%r3, %r13, %r30
	.word 0xb40222c1  ! 156: ADD_I	add 	%r8, 0x02c1, %r26
	.word 0xae08c00f  ! 156: AND_R	and 	%r3, %r15, %r23
	.word 0xac00ee0e  ! 156: ADD_I	add 	%r3, 0x0e0e, %r22
	.word 0xbc11629d  ! 156: OR_I	or 	%r5, 0x029d, %r30
	.word 0xa80a000d  ! 156: AND_R	and 	%r8, %r13, %r20
	.word 0xba02000b  ! 156: ADD_R	add 	%r8, %r11, %r29
	.word 0xbc09400a  ! 156: AND_R	and 	%r5, %r10, %r30
	.word 0xb201a5b2  ! 156: ADD_I	add 	%r6, 0x05b2, %r25
	.word 0xa6096cc0  ! 156: AND_I	and 	%r5, 0x0cc0, %r19
	.word 0xae02000a  ! 156: ADD_R	add 	%r8, %r10, %r23
	.word 0xb2092ca8  ! 156: AND_I	and 	%r4, 0x0ca8, %r25
	.word 0xa201a70a  ! 156: ADD_I	add 	%r6, 0x070a, %r17
	.word 0xa40929bd  ! 156: AND_I	and 	%r4, 0x09bd, %r18
	.word 0xae01c00f  ! 156: ADD_R	add 	%r7, %r15, %r23
	.word 0xb208ec92  ! 156: AND_I	and 	%r3, 0x0c92, %r25
	.word 0xbe022454  ! 156: ADD_I	add 	%r8, 0x0454, %r31
	.word 0xb608c00c  ! 156: AND_R	and 	%r3, %r12, %r27
	.word 0xae09a0a1  ! 156: AND_I	and 	%r6, 0x00a1, %r23
	.word 0xa4020009  ! 156: ADD_R	add 	%r8, %r9, %r18
	.word 0xa6096dc4  ! 156: AND_I	and 	%r5, 0x0dc4, %r19
	.word 0xa211400c  ! 156: OR_R	or 	%r5, %r12, %r17
	.word 0xae11800c  ! 156: OR_R	or 	%r6, %r12, %r23
	.word 0xa409000c  ! 156: AND_R	and 	%r4, %r12, %r18
	.word 0xaa09800e  ! 156: AND_R	and 	%r6, %r14, %r21
	.word 0xb212000c  ! 156: OR_R	or 	%r8, %r12, %r25
	.word 0xae020009  ! 156: ADD_R	add 	%r8, %r9, %r23
	.word 0xbc0220b0  ! 156: ADD_I	add 	%r8, 0x00b0, %r30
	.word 0xb809800c  ! 156: AND_R	and 	%r6, %r12, %r28
	.word 0xb408c00f  ! 156: AND_R	and 	%r3, %r15, %r26
	.word 0xb609a021  ! 156: AND_I	and 	%r6, 0x0021, %r27
	.word 0xa411e6f0  ! 156: OR_I	or 	%r7, 0x06f0, %r18
	.word 0xb409000d  ! 156: AND_R	and 	%r4, %r13, %r26
	.word 0xb009000f  ! 156: AND_R	and 	%r4, %r15, %r24
	.word 0xb611800d  ! 156: OR_R	or 	%r6, %r13, %r27
	.word 0xa80a2df8  ! 156: AND_I	and 	%r8, 0x0df8, %r20
	.word 0xba01684f  ! 156: ADD_I	add 	%r5, 0x084f, %r29
	.word 0xa210c00b  ! 156: OR_R	or 	%r3, %r11, %r17
	.word 0xa2092480  ! 156: AND_I	and 	%r4, 0x0480, %r17
	.word 0xb600c00d  ! 156: ADD_R	add 	%r3, %r13, %r27
	.word 0xac09229a  ! 156: AND_I	and 	%r4, 0x029a, %r22
	.word 0xb0114009  ! 156: OR_R	or 	%r5, %r9, %r24
	.word 0xa611c00c  ! 156: OR_R	or 	%r7, %r12, %r19
	.word 0xb0022df9  ! 156: ADD_I	add 	%r8, 0x0df9, %r24
	.word 0xa802000a  ! 156: ADD_R	add 	%r8, %r10, %r20
	.word 0xa811615f  ! 156: OR_I	or 	%r5, 0x015f, %r20
	.word 0xaa09ee63  ! 156: AND_I	and 	%r7, 0x0e63, %r21
	.word 0xa6012519  ! 156: ADD_I	add 	%r4, 0x0519, %r19
	.word 0xbe11a03b  ! 156: OR_I	or 	%r6, 0x003b, %r31
	.word 0xa210e47d  ! 156: OR_I	or 	%r3, 0x047d, %r17
	.word 0xae116a9e  ! 156: OR_I	or 	%r5, 0x0a9e, %r23
	.word 0xae1165e6  ! 156: OR_I	or 	%r5, 0x05e6, %r23
	.word 0xac11ef4f  ! 156: OR_I	or 	%r7, 0x0f4f, %r22
	.word 0xa810c00a  ! 156: OR_R	or 	%r3, %r10, %r20
	.word 0xbe11800d  ! 156: OR_R	or 	%r6, %r13, %r31
	.word 0xaa09000e  ! 156: AND_R	and 	%r4, %r14, %r21
	.word 0xa600ec2b  ! 156: ADD_I	add 	%r3, 0x0c2b, %r19
	.word 0xa808c00b  ! 156: AND_R	and 	%r3, %r11, %r20
	.word 0xba016826  ! 156: ADD_I	add 	%r5, 0x0826, %r29
	.word 0xb201a823  ! 156: ADD_I	add 	%r6, 0x0823, %r25
	.word 0xaa09c009  ! 156: AND_R	and 	%r7, %r9, %r21
	.word 0xac01000c  ! 156: ADD_R	add 	%r4, %r12, %r22
	.word 0xb00962d4  ! 156: AND_I	and 	%r5, 0x02d4, %r24
	.word 0xa211a3f5  ! 156: OR_I	or 	%r6, 0x03f5, %r17
	.word 0xb209800c  ! 156: AND_R	and 	%r6, %r12, %r25
	.word 0xbe00e077  ! 156: ADD_I	add 	%r3, 0x0077, %r31
	.word 0xb408e330  ! 156: AND_I	and 	%r3, 0x0330, %r26
	.word 0xa811800f  ! 156: OR_R	or 	%r6, %r15, %r20
	.word 0xb008e397  ! 156: AND_I	and 	%r3, 0x0397, %r24
	.word 0xbe09800f  ! 156: AND_R	and 	%r6, %r15, %r31
	.word 0xb611800e  ! 156: OR_R	or 	%r6, %r14, %r27
	.word 0xbc12000b  ! 156: OR_R	or 	%r8, %r11, %r30
	.word 0xac09000b  ! 156: AND_R	and 	%r4, %r11, %r22
	.word 0xac022271  ! 156: ADD_I	add 	%r8, 0x0271, %r22
	.word 0xae09000d  ! 156: AND_R	and 	%r4, %r13, %r23
	.word 0xb4012f8f  ! 156: ADD_I	add 	%r4, 0x0f8f, %r26
	.word 0xb200c00c  ! 156: ADD_R	add 	%r3, %r12, %r25
	.word 0xbe11c00d  ! 156: OR_R	or 	%r7, %r13, %r31
	.word 0xb8012f47  ! 156: ADD_I	add 	%r4, 0x0f47, %r28
	.word 0xbc092f40  ! 156: AND_I	and 	%r4, 0x0f40, %r30
	.word 0xbe00c00a  ! 156: ADD_R	add 	%r3, %r10, %r31
	.word 0xa801a14d  ! 156: ADD_I	add 	%r6, 0x014d, %r20
	.word 0xa211ef13  ! 156: OR_I	or 	%r7, 0x0f13, %r17
	.word 0xaa09e329  ! 156: AND_I	and 	%r7, 0x0329, %r21
	.word 0xb20967db  ! 156: AND_I	and 	%r5, 0x07db, %r25
	.word 0xbc11c00c  ! 156: OR_R	or 	%r7, %r12, %r30
	.word 0xb401c00d  ! 156: ADD_R	add 	%r7, %r13, %r26
	.word 0xaa09a490  ! 156: AND_I	and 	%r6, 0x0490, %r21
	.word 0xba11a10b  ! 156: OR_I	or 	%r6, 0x010b, %r29
	.word 0xac09000e  ! 156: AND_R	and 	%r4, %r14, %r22
	.word 0xb20a2e46  ! 156: AND_I	and 	%r8, 0x0e46, %r25
	.word 0xb612253f  ! 156: OR_I	or 	%r8, 0x053f, %r27
	.word 0xb801800a  ! 156: ADD_R	add 	%r6, %r10, %r28
	.word 0xaa0924af  ! 156: AND_I	and 	%r4, 0x04af, %r21
	.word 0xa808e8ea  ! 156: AND_I	and 	%r3, 0x08ea, %r20
	.word 0xb001400f  ! 156: ADD_R	add 	%r5, %r15, %r24
	.word 0xaa012aa2  ! 156: ADD_I	add 	%r4, 0x0aa2, %r21
	.word 0xa809000c  ! 156: AND_R	and 	%r4, %r12, %r20
	.word 0xaa09800a  ! 156: AND_R	and 	%r6, %r10, %r21
	.word 0xaa11000e  ! 156: OR_R	or 	%r4, %r14, %r21
	.word 0xae01e54f  ! 156: ADD_I	add 	%r7, 0x054f, %r23
	.word 0xb209000b  ! 156: AND_R	and 	%r4, %r11, %r25
	.word 0xbe11ae24  ! 156: OR_I	or 	%r6, 0x0e24, %r31
	.word 0xac08c00e  ! 156: AND_R	and 	%r3, %r14, %r22
	.word 0xac01a8ec  ! 156: ADD_I	add 	%r6, 0x08ec, %r22
	.word 0xae11a788  ! 156: OR_I	or 	%r6, 0x0788, %r23
	.word 0xb600c00a  ! 156: ADD_R	add 	%r3, %r10, %r27
	.word 0xb009400b  ! 156: AND_R	and 	%r5, %r11, %r24
	.word 0xbc11a7f1  ! 156: OR_I	or 	%r6, 0x07f1, %r30
	.word 0xb611c00c  ! 156: OR_R	or 	%r7, %r12, %r27
	.word 0xb810ebbd  ! 156: OR_I	or 	%r3, 0x0bbd, %r28
	.word 0xa2022ee1  ! 156: ADD_I	add 	%r8, 0x0ee1, %r17
	.word 0xbc02000a  ! 156: ADD_R	add 	%r8, %r10, %r30
	.word 0xa609400d  ! 156: AND_R	and 	%r5, %r13, %r19
	.word 0xa802000b  ! 156: ADD_R	add 	%r8, %r11, %r20
	.word 0xbc112864  ! 156: OR_I	or 	%r4, 0x0864, %r30
	.word 0xb801800a  ! 156: ADD_R	add 	%r6, %r10, %r28
	.word 0xb612230f  ! 156: OR_I	or 	%r8, 0x030f, %r27
	.word 0xa400c00e  ! 156: ADD_R	add 	%r3, %r14, %r18
	.word 0xb601c00c  ! 156: ADD_R	add 	%r7, %r12, %r27
	.word 0xae11400f  ! 156: OR_R	or 	%r5, %r15, %r23
	.word 0xbc09000b  ! 156: AND_R	and 	%r4, %r11, %r30
	.word 0xa409aa4f  ! 156: AND_I	and 	%r6, 0x0a4f, %r18
	.word 0xac01400b  ! 156: ADD_R	add 	%r5, %r11, %r22
	.word 0xbc1126d3  ! 156: OR_I	or 	%r4, 0x06d3, %r30
	.word 0xbe11800d  ! 156: OR_R	or 	%r6, %r13, %r31
	.word 0xa612000b  ! 156: OR_R	or 	%r8, %r11, %r19
	.word 0xba10e699  ! 156: OR_I	or 	%r3, 0x0699, %r29
	.word 0xba01400f  ! 156: ADD_R	add 	%r5, %r15, %r29
	.word 0xba112ac6  ! 156: OR_I	or 	%r4, 0x0ac6, %r29
	.word 0xa811400c  ! 156: OR_R	or 	%r5, %r12, %r20
	.word 0xbe10e9ce  ! 156: OR_I	or 	%r3, 0x09ce, %r31
	.word 0xbc112ac0  ! 156: OR_I	or 	%r4, 0x0ac0, %r30
	.word 0xbe09400f  ! 156: AND_R	and 	%r5, %r15, %r31
	.word 0xac11c00f  ! 156: OR_R	or 	%r7, %r15, %r22
	.word 0xb401606c  ! 156: ADD_I	add 	%r5, 0x006c, %r26
	.word 0xa210c00c  ! 156: OR_R	or 	%r3, %r12, %r17
	.word 0xb001c00c  ! 156: ADD_R	add 	%r7, %r12, %r24
	.word 0xb809c00b  ! 156: AND_R	and 	%r7, %r11, %r28
	.word 0xb201800b  ! 156: ADD_R	add 	%r6, %r11, %r25
	.word 0xa201400c  ! 156: ADD_R	add 	%r5, %r12, %r17
	.word 0xb009e184  ! 156: AND_I	and 	%r7, 0x0184, %r24
	.word 0xa8112f6e  ! 156: OR_I	or 	%r4, 0x0f6e, %r20
	.word 0xa611000d  ! 156: OR_R	or 	%r4, %r13, %r19
	.word 0xbe116240  ! 156: OR_I	or 	%r5, 0x0240, %r31
	.word 0xa608ef9d  ! 156: AND_I	and 	%r3, 0x0f9d, %r19
	.word 0xac096e8a  ! 156: AND_I	and 	%r5, 0x0e8a, %r22
	.word 0xb401000d  ! 156: ADD_R	add 	%r4, %r13, %r26
	.word 0xa608c00a  ! 156: AND_R	and 	%r3, %r10, %r19
	.word 0xa20227b1  ! 156: ADD_I	add 	%r8, 0x07b1, %r17
	.word 0xbc09400f  ! 156: AND_R	and 	%r5, %r15, %r30
	.word 0xbe01e82f  ! 156: ADD_I	add 	%r7, 0x082f, %r31
	.word 0xa408eb3f  ! 156: AND_I	and 	%r3, 0x0b3f, %r18
	.word 0xb609400b  ! 156: AND_R	and 	%r5, %r11, %r27
	.word 0xae01c00c  ! 156: ADD_R	add 	%r7, %r12, %r23
	.word 0xb211a089  ! 156: OR_I	or 	%r6, 0x0089, %r25
	.word 0xb409c00b  ! 156: AND_R	and 	%r7, %r11, %r26
	.word 0xae11400e  ! 156: OR_R	or 	%r5, %r14, %r23
	.word 0xbc12000b  ! 156: OR_R	or 	%r8, %r11, %r30
	.word 0xba08c00d  ! 156: AND_R	and 	%r3, %r13, %r29
	.word 0xbe01800a  ! 156: ADD_R	add 	%r6, %r10, %r31
	.word 0xaa096414  ! 156: AND_I	and 	%r5, 0x0414, %r21
	.word 0xac01800f  ! 156: ADD_R	add 	%r6, %r15, %r22
	.word 0xbe092d07  ! 156: AND_I	and 	%r4, 0x0d07, %r31
	.word 0xa80a000c  ! 156: AND_R	and 	%r8, %r12, %r20
	.word 0xb400ed5f  ! 156: ADD_I	add 	%r3, 0x0d5f, %r26
	.word 0xb6114009  ! 156: OR_R	or 	%r5, %r9, %r27
	.word 0xac00eafa  ! 156: ADD_I	add 	%r3, 0x0afa, %r22
	.word 0xba02000f  ! 156: ADD_R	add 	%r8, %r15, %r29
	.word 0xa400eaf5  ! 156: ADD_I	add 	%r3, 0x0af5, %r18
	.word 0xa809400c  ! 156: AND_R	and 	%r5, %r12, %r20
	.word 0xb212000a  ! 156: OR_R	or 	%r8, %r10, %r25
	.word 0xbe01000b  ! 156: ADD_R	add 	%r4, %r11, %r31
	.word 0xba0a2689  ! 156: AND_I	and 	%r8, 0x0689, %r29
	.word 0xbc00c00b  ! 156: ADD_R	add 	%r3, %r11, %r30
	.word 0xa201a767  ! 156: ADD_I	add 	%r6, 0x0767, %r17
	.word 0xbe00e675  ! 156: ADD_I	add 	%r3, 0x0675, %r31
	.word 0xa811af5a  ! 156: OR_I	or 	%r6, 0x0f5a, %r20
	.word 0xbe0223ea  ! 156: ADD_I	add 	%r8, 0x03ea, %r31
	.word 0xb209c00a  ! 156: AND_R	and 	%r7, %r10, %r25
	.word 0xa201800e  ! 156: ADD_R	add 	%r6, %r14, %r17
	.word 0xae0168b4  ! 156: ADD_I	add 	%r5, 0x08b4, %r23
	.word 0xaa09af6d  ! 156: AND_I	and 	%r6, 0x0f6d, %r21
	.word 0xb20961d0  ! 156: AND_I	and 	%r5, 0x01d0, %r25
	.word 0xa811c00d  ! 156: OR_R	or 	%r7, %r13, %r20
	.word 0xa601a3e2  ! 156: ADD_I	add 	%r6, 0x03e2, %r19
	.word 0xa21128c6  ! 156: OR_I	or 	%r4, 0x08c6, %r17
	.word 0xac012560  ! 156: ADD_I	add 	%r4, 0x0560, %r22
	.word 0xb811606d  ! 156: OR_I	or 	%r5, 0x006d, %r28
	.word 0xae01c00a  ! 156: ADD_R	add 	%r7, %r10, %r23
	.word 0xbc11c00f  ! 156: OR_R	or 	%r7, %r15, %r30
	.word 0xba01a177  ! 156: ADD_I	add 	%r6, 0x0177, %r29
	.word 0xbe116994  ! 156: OR_I	or 	%r5, 0x0994, %r31
	.word 0xbc00c009  ! 156: ADD_R	add 	%r3, %r9, %r30
	.word 0xb009000d  ! 156: AND_R	and 	%r4, %r13, %r24
	.word 0xb409000d  ! 156: AND_R	and 	%r4, %r13, %r26
	.word 0xa801ab08  ! 156: ADD_I	add 	%r6, 0x0b08, %r20
	.word 0xa211283d  ! 156: OR_I	or 	%r4, 0x083d, %r17
	.word 0xb61225fb  ! 156: OR_I	or 	%r8, 0x05fb, %r27
	.word 0xaa08c009  ! 156: AND_R	and 	%r3, %r9, %r21
	.word 0xae08e6bb  ! 156: AND_I	and 	%r3, 0x06bb, %r23
	.word 0xa200e49a  ! 156: ADD_I	add 	%r3, 0x049a, %r17
	.word 0xae01800c  ! 156: ADD_R	add 	%r6, %r12, %r23
	.word 0xae016a0f  ! 156: ADD_I	add 	%r5, 0x0a0f, %r23
	.word 0xb609a997  ! 156: AND_I	and 	%r6, 0x0997, %r27
	.word 0xaa11ee6b  ! 156: OR_I	or 	%r7, 0x0e6b, %r21
	.word 0xb81168d7  ! 156: OR_I	or 	%r5, 0x08d7, %r28
	.word 0xb0092f5e  ! 156: AND_I	and 	%r4, 0x0f5e, %r24
	.word 0xfe21ef10  ! 156: STW_I	stw	%r31, [%r7 + 0x0f10]
	.word 0xf620eef8  ! 156: STW_I	stw	%r27, [%r3 + 0x0ef8]
	.word 0xf8222a38  ! 156: STW_I	stw	%r28, [%r8 + 0x0a38]
	.word 0xf6716e70  ! 156: STX_I	stx	%r27, [%r5 + 0x0e70]
	.word 0xe270e588  ! 156: STX_I	stx	%r17, [%r3 + 0x0588]
	.word 0xf220e1f4  ! 156: STW_I	stw	%r25, [%r3 + 0x01f4]
	.word 0xf27124e8  ! 156: STX_I	stx	%r25, [%r4 + 0x04e8]
	.word 0xf001800c  ! 157: LDUW_R	lduw	[%r6 + %r12], %r24
	.word 0xf4292d53  ! 158: STB_I	stb	%r26, [%r4 + 0x0d53]
	.word 0xf411ab22  ! 159: LDUH_I	lduh	[%r6 + 0x0b22], %r26
	.word 0xa401c00c  ! 159: ADD_R	add 	%r7, %r12, %r18
	.word 0xaa11eb3a  ! 159: OR_I	or 	%r7, 0x0b3a, %r21
	.word 0xae10ec1f  ! 159: OR_I	or 	%r3, 0x0c1f, %r23
	bne thr2_loop_12
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_13:
	.word 0xae00c00d  ! 165: ADD_R	add 	%r3, %r13, %r23
	.word 0xa8098009  ! 165: AND_R	and 	%r6, %r9, %r20
	.word 0xaa00eeaa  ! 165: ADD_I	add 	%r3, 0x0eaa, %r21
	.word 0xa6098009  ! 165: AND_R	and 	%r6, %r9, %r19
	.word 0xae01a466  ! 165: ADD_I	add 	%r6, 0x0466, %r23
	.word 0xb60965c6  ! 165: AND_I	and 	%r5, 0x05c6, %r27
	.word 0xb009000f  ! 165: AND_R	and 	%r4, %r15, %r24
	.word 0xaa09c00c  ! 165: AND_R	and 	%r7, %r12, %r21
	.word 0xa211a0f3  ! 165: OR_I	or 	%r6, 0x00f3, %r17
	.word 0xbe08c00c  ! 165: AND_R	and 	%r3, %r12, %r31
	.word 0xa601000d  ! 165: ADD_R	add 	%r4, %r13, %r19
	.word 0xb609634f  ! 165: AND_I	and 	%r5, 0x034f, %r27
	.word 0xbe08c00c  ! 165: AND_R	and 	%r3, %r12, %r31
	.word 0xa209c00a  ! 165: AND_R	and 	%r7, %r10, %r17
	.word 0xae0a000c  ! 165: AND_R	and 	%r8, %r12, %r23
	.word 0xba0a21cc  ! 165: AND_I	and 	%r8, 0x01cc, %r29
	.word 0xbe09e06a  ! 165: AND_I	and 	%r7, 0x006a, %r31
	.word 0xbc01699d  ! 165: ADD_I	add 	%r5, 0x099d, %r30
	.word 0xb2122228  ! 165: OR_I	or 	%r8, 0x0228, %r25
	.word 0xb010e5b9  ! 165: OR_I	or 	%r3, 0x05b9, %r24
	.word 0xac11e73a  ! 165: OR_I	or 	%r7, 0x073a, %r22
	.word 0xba02000f  ! 165: ADD_R	add 	%r8, %r15, %r29
	.word 0xbc01c00c  ! 165: ADD_R	add 	%r7, %r12, %r30
	.word 0xac112f6d  ! 165: OR_I	or 	%r4, 0x0f6d, %r22
	.word 0xa600e803  ! 165: ADD_I	add 	%r3, 0x0803, %r19
	.word 0xb408ecc4  ! 165: AND_I	and 	%r3, 0x0cc4, %r26
	.word 0xac09000f  ! 165: AND_R	and 	%r4, %r15, %r22
	.word 0xa411000b  ! 165: OR_R	or 	%r4, %r11, %r18
	.word 0xae11c00a  ! 165: OR_R	or 	%r7, %r10, %r23
	.word 0xa810ed55  ! 165: OR_I	or 	%r3, 0x0d55, %r20
	.word 0xa211e3bd  ! 165: OR_I	or 	%r7, 0x03bd, %r17
	.word 0xba12000f  ! 165: OR_R	or 	%r8, %r15, %r29
	.word 0xa609800e  ! 165: AND_R	and 	%r6, %r14, %r19
	.word 0xbe01000e  ! 165: ADD_R	add 	%r4, %r14, %r31
	.word 0xb4116b76  ! 165: OR_I	or 	%r5, 0x0b76, %r26
	.word 0xb209000c  ! 165: AND_R	and 	%r4, %r12, %r25
	.word 0xb208c00a  ! 165: AND_R	and 	%r3, %r10, %r25
	.word 0xbc114009  ! 165: OR_R	or 	%r5, %r9, %r30
	.word 0xb2096727  ! 165: AND_I	and 	%r5, 0x0727, %r25
	.word 0xbe012f9f  ! 165: ADD_I	add 	%r4, 0x0f9f, %r31
	.word 0xaa0a2c06  ! 165: AND_I	and 	%r8, 0x0c06, %r21
	.word 0xa408ee05  ! 165: AND_I	and 	%r3, 0x0e05, %r18
	.word 0xb40225a0  ! 165: ADD_I	add 	%r8, 0x05a0, %r26
	.word 0xb401ec12  ! 165: ADD_I	add 	%r7, 0x0c12, %r26
	.word 0xb410c00f  ! 165: OR_R	or 	%r3, %r15, %r26
	.word 0xa811c00d  ! 165: OR_R	or 	%r7, %r13, %r20
	.word 0xa410c00f  ! 165: OR_R	or 	%r3, %r15, %r18
	.word 0xb00a2fd2  ! 165: AND_I	and 	%r8, 0x0fd2, %r24
	.word 0xac0a000a  ! 165: AND_R	and 	%r8, %r10, %r22
	.word 0xa411e114  ! 165: OR_I	or 	%r7, 0x0114, %r18
	.word 0xa209000c  ! 165: AND_R	and 	%r4, %r12, %r17
	.word 0xb4012411  ! 165: ADD_I	add 	%r4, 0x0411, %r26
	.word 0xa202000a  ! 165: ADD_R	add 	%r8, %r10, %r17
	.word 0xa4016d9c  ! 165: ADD_I	add 	%r5, 0x0d9c, %r18
	.word 0xb609000c  ! 165: AND_R	and 	%r4, %r12, %r27
	.word 0xba09efe9  ! 165: AND_I	and 	%r7, 0x0fe9, %r29
	.word 0xa80a0009  ! 165: AND_R	and 	%r8, %r9, %r20
	.word 0xa611000c  ! 165: OR_R	or 	%r4, %r12, %r19
	.word 0xb8120009  ! 165: OR_R	or 	%r8, %r9, %r28
	.word 0xa8094009  ! 165: AND_R	and 	%r5, %r9, %r20
	.word 0xa81126fc  ! 165: OR_I	or 	%r4, 0x06fc, %r20
	.word 0xb601800c  ! 165: ADD_R	add 	%r6, %r12, %r27
	.word 0xb209000a  ! 165: AND_R	and 	%r4, %r10, %r25
	.word 0xa6114009  ! 165: OR_R	or 	%r5, %r9, %r19
	.word 0xaa00c00a  ! 165: ADD_R	add 	%r3, %r10, %r21
	.word 0xb801e575  ! 165: ADD_I	add 	%r7, 0x0575, %r28
	.word 0xaa0968ad  ! 165: AND_I	and 	%r5, 0x08ad, %r21
	.word 0xa601e60c  ! 165: ADD_I	add 	%r7, 0x060c, %r19
	.word 0xbe094009  ! 165: AND_R	and 	%r5, %r9, %r31
	.word 0xa8118009  ! 165: OR_R	or 	%r6, %r9, %r20
	.word 0xb8122542  ! 165: OR_I	or 	%r8, 0x0542, %r28
	.word 0xbe096650  ! 165: AND_I	and 	%r5, 0x0650, %r31
	.word 0xb209ec32  ! 165: AND_I	and 	%r7, 0x0c32, %r25
	.word 0xba01c00f  ! 165: ADD_R	add 	%r7, %r15, %r29
	.word 0xbe012777  ! 165: ADD_I	add 	%r4, 0x0777, %r31
	.word 0xae01000f  ! 165: ADD_R	add 	%r4, %r15, %r23
	.word 0xa2092bb7  ! 165: AND_I	and 	%r4, 0x0bb7, %r17
	.word 0xbe0128cc  ! 165: ADD_I	add 	%r4, 0x08cc, %r31
	.word 0xb809e972  ! 165: AND_I	and 	%r7, 0x0972, %r28
	.word 0xb210c00a  ! 165: OR_R	or 	%r3, %r10, %r25
	.word 0xb8122d88  ! 165: OR_I	or 	%r8, 0x0d88, %r28
	.word 0xb40126ff  ! 165: ADD_I	add 	%r4, 0x06ff, %r26
	.word 0xb0096924  ! 165: AND_I	and 	%r5, 0x0924, %r24
	.word 0xb801e300  ! 165: ADD_I	add 	%r7, 0x0300, %r28
	.word 0xa4092b01  ! 165: AND_I	and 	%r4, 0x0b01, %r18
	.word 0xb000ee6c  ! 165: ADD_I	add 	%r3, 0x0e6c, %r24
	.word 0xae01c00e  ! 165: ADD_R	add 	%r7, %r14, %r23
	.word 0xae00ec83  ! 165: ADD_I	add 	%r3, 0x0c83, %r23
	.word 0xb401400e  ! 165: ADD_R	add 	%r5, %r14, %r26
	.word 0xac08e0c4  ! 165: AND_I	and 	%r3, 0x00c4, %r22
	.word 0xb0092495  ! 165: AND_I	and 	%r4, 0x0495, %r24
	.word 0xac116537  ! 165: OR_I	or 	%r5, 0x0537, %r22
	.word 0xb409000d  ! 165: AND_R	and 	%r4, %r13, %r26
	.word 0xa209c00c  ! 165: AND_R	and 	%r7, %r12, %r17
	.word 0xb811c00e  ! 165: OR_R	or 	%r7, %r14, %r28
	.word 0xba10c009  ! 165: OR_R	or 	%r3, %r9, %r29
	.word 0xb802000d  ! 165: ADD_R	add 	%r8, %r13, %r28
	.word 0xb411c00d  ! 165: OR_R	or 	%r7, %r13, %r26
	.word 0xb211ebde  ! 165: OR_I	or 	%r7, 0x0bde, %r25
	.word 0xac11ac77  ! 165: OR_I	or 	%r6, 0x0c77, %r22
	.word 0xa209800c  ! 165: AND_R	and 	%r6, %r12, %r17
	.word 0xbc0a000c  ! 165: AND_R	and 	%r8, %r12, %r30
	.word 0xa409e7ab  ! 165: AND_I	and 	%r7, 0x07ab, %r18
	.word 0xb211400f  ! 165: OR_R	or 	%r5, %r15, %r25
	.word 0xaa11adeb  ! 165: OR_I	or 	%r6, 0x0deb, %r21
	.word 0xa400e009  ! 165: ADD_I	add 	%r3, 0x0009, %r18
	.word 0xb809400a  ! 165: AND_R	and 	%r5, %r10, %r28
	.word 0xb801800c  ! 165: ADD_R	add 	%r6, %r12, %r28
	.word 0xa6018009  ! 165: ADD_R	add 	%r6, %r9, %r19
	.word 0xb2012788  ! 165: ADD_I	add 	%r4, 0x0788, %r25
	.word 0xbe11400a  ! 165: OR_R	or 	%r5, %r10, %r31
	.word 0xb2116a90  ! 165: OR_I	or 	%r5, 0x0a90, %r25
	.word 0xae11000f  ! 165: OR_R	or 	%r4, %r15, %r23
	.word 0xba08c00b  ! 165: AND_R	and 	%r3, %r11, %r29
	.word 0xb40127e0  ! 165: ADD_I	add 	%r4, 0x07e0, %r26
	.word 0xbe11400c  ! 165: OR_R	or 	%r5, %r12, %r31
	.word 0xa209800c  ! 165: AND_R	and 	%r6, %r12, %r17
	.word 0xba10c00f  ! 165: OR_R	or 	%r3, %r15, %r29
	.word 0xbc08e33e  ! 165: AND_I	and 	%r3, 0x033e, %r30
	.word 0xb801000d  ! 165: ADD_R	add 	%r4, %r13, %r28
	.word 0xb608e43f  ! 165: AND_I	and 	%r3, 0x043f, %r27
	.word 0xbc08c00e  ! 165: AND_R	and 	%r3, %r14, %r30
	.word 0xa200e434  ! 165: ADD_I	add 	%r3, 0x0434, %r17
	.word 0xba11ae53  ! 165: OR_I	or 	%r6, 0x0e53, %r29
	.word 0xa401c00c  ! 165: ADD_R	add 	%r7, %r12, %r18
	.word 0xae10c00a  ! 165: OR_R	or 	%r3, %r10, %r23
	.word 0xbc11000f  ! 165: OR_R	or 	%r4, %r15, %r30
	.word 0xb601ecc8  ! 165: ADD_I	add 	%r7, 0x0cc8, %r27
	.word 0xb6012b3a  ! 165: ADD_I	add 	%r4, 0x0b3a, %r27
	.word 0xbc00c00d  ! 165: ADD_R	add 	%r3, %r13, %r30
	.word 0xba0a2d87  ! 165: AND_I	and 	%r8, 0x0d87, %r29
	.word 0xbe09c00a  ! 165: AND_R	and 	%r7, %r10, %r31
	.word 0xac09a6af  ! 165: AND_I	and 	%r6, 0x06af, %r22
	.word 0xbe09c009  ! 165: AND_R	and 	%r7, %r9, %r31
	.word 0xbe10e12f  ! 165: OR_I	or 	%r3, 0x012f, %r31
	.word 0xa809e11e  ! 165: AND_I	and 	%r7, 0x011e, %r20
	.word 0xa209400a  ! 165: AND_R	and 	%r5, %r10, %r17
	.word 0xa40a0009  ! 165: AND_R	and 	%r8, %r9, %r18
	.word 0xae09a29f  ! 165: AND_I	and 	%r6, 0x029f, %r23
	.word 0xb808e533  ! 165: AND_I	and 	%r3, 0x0533, %r28
	.word 0xb609400c  ! 165: AND_R	and 	%r5, %r12, %r27
	.word 0xaa09400b  ! 165: AND_R	and 	%r5, %r11, %r21
	.word 0xbe09c00a  ! 165: AND_R	and 	%r7, %r10, %r31
	.word 0xac11400f  ! 165: OR_R	or 	%r5, %r15, %r22
	.word 0xa610c009  ! 165: OR_R	or 	%r3, %r9, %r19
	.word 0xb811c00d  ! 165: OR_R	or 	%r7, %r13, %r28
	.word 0xbc016272  ! 165: ADD_I	add 	%r5, 0x0272, %r30
	.word 0xaa01000a  ! 165: ADD_R	add 	%r4, %r10, %r21
	.word 0xae112458  ! 165: OR_I	or 	%r4, 0x0458, %r23
	.word 0xb801e0f7  ! 165: ADD_I	add 	%r7, 0x00f7, %r28
	.word 0xa801000a  ! 165: ADD_R	add 	%r4, %r10, %r20
	.word 0xa210c00a  ! 165: OR_R	or 	%r3, %r10, %r17
	.word 0xb408ec24  ! 165: AND_I	and 	%r3, 0x0c24, %r26
	.word 0xb010e770  ! 165: OR_I	or 	%r3, 0x0770, %r24
	.word 0xac00e014  ! 165: ADD_I	add 	%r3, 0x0014, %r22
	.word 0xbc112d3a  ! 165: OR_I	or 	%r4, 0x0d3a, %r30
	.word 0xb009e256  ! 165: AND_I	and 	%r7, 0x0256, %r24
	.word 0xb608c00a  ! 165: AND_R	and 	%r3, %r10, %r27
	.word 0xb601ad0a  ! 165: ADD_I	add 	%r6, 0x0d0a, %r27
	.word 0xaa01400b  ! 165: ADD_R	add 	%r5, %r11, %r21
	.word 0xa809eaca  ! 165: AND_I	and 	%r7, 0x0aca, %r20
	.word 0xa609800c  ! 165: AND_R	and 	%r6, %r12, %r19
	.word 0xa408c00a  ! 165: AND_R	and 	%r3, %r10, %r18
	.word 0xb600ef95  ! 165: ADD_I	add 	%r3, 0x0f95, %r27
	.word 0xb409207e  ! 165: AND_I	and 	%r4, 0x007e, %r26
	.word 0xbe0a2684  ! 165: AND_I	and 	%r8, 0x0684, %r31
	.word 0xa6012e51  ! 165: ADD_I	add 	%r4, 0x0e51, %r19
	.word 0xaa11c00a  ! 165: OR_R	or 	%r7, %r10, %r21
	.word 0xb800e39a  ! 165: ADD_I	add 	%r3, 0x039a, %r28
	.word 0xbc110009  ! 165: OR_R	or 	%r4, %r9, %r30
	.word 0xae022406  ! 165: ADD_I	add 	%r8, 0x0406, %r23
	.word 0xa61128ea  ! 165: OR_I	or 	%r4, 0x08ea, %r19
	.word 0xa60122da  ! 165: ADD_I	add 	%r4, 0x02da, %r19
	.word 0xa809000c  ! 165: AND_R	and 	%r4, %r12, %r20
	.word 0xb20162ce  ! 165: ADD_I	add 	%r5, 0x02ce, %r25
	.word 0xb611800e  ! 165: OR_R	or 	%r6, %r14, %r27
	.word 0xb80126ae  ! 165: ADD_I	add 	%r4, 0x06ae, %r28
	.word 0xb611abff  ! 165: OR_I	or 	%r6, 0x0bff, %r27
	.word 0xba08e804  ! 165: AND_I	and 	%r3, 0x0804, %r29
	.word 0xac01400e  ! 165: ADD_R	add 	%r5, %r14, %r22
	.word 0xb209e166  ! 165: AND_I	and 	%r7, 0x0166, %r25
	.word 0xac11000a  ! 165: OR_R	or 	%r4, %r10, %r22
	.word 0xa8022fb8  ! 165: ADD_I	add 	%r8, 0x0fb8, %r20
	.word 0xaa022686  ! 165: ADD_I	add 	%r8, 0x0686, %r21
	.word 0xbe096430  ! 165: AND_I	and 	%r5, 0x0430, %r31
	.word 0xac10e4c3  ! 165: OR_I	or 	%r3, 0x04c3, %r22
	.word 0xb810c00d  ! 165: OR_R	or 	%r3, %r13, %r28
	.word 0xb8012a60  ! 165: ADD_I	add 	%r4, 0x0a60, %r28
	.word 0xaa11a0c4  ! 165: OR_I	or 	%r6, 0x00c4, %r21
	.word 0xae122da4  ! 165: OR_I	or 	%r8, 0x0da4, %r23
	.word 0xb40a000e  ! 165: AND_R	and 	%r8, %r14, %r26
	.word 0xe471e5d8  ! 165: STX_I	stx	%r18, [%r7 + 0x05d8]
	.word 0xe221e0b0  ! 165: STW_I	stw	%r17, [%r7 + 0x00b0]
	.word 0xf621a7c0  ! 165: STW_I	stw	%r27, [%r6 + 0x07c0]
	.word 0xee29a5b7  ! 165: STB_I	stb	%r23, [%r6 + 0x05b7]
	.word 0xf02223f0  ! 165: STW_I	stw	%r24, [%r8 + 0x03f0]
IRF_CE_2:
!$EV error(2,expr(@VA(.MAIN.IRF_CE_2), 16, 16), 1,IRF,ce,29,x, x,x,x, x,x,x)
!$EV error(2,expr(@VA(.MAIN.IRF_CE_2), 16, 16), 3,IRF,ce,47,x, x,x,x, x,x,x)
	.word 0xea20e250  ! 167: STW_I	stw	%r21, [%r3 + 0x0250]
	.word 0xae010045
	.word 0xec712ea0  ! 169: STX_I	stx	%r22, [%r4 + 0x0ea0]
	.word 0xe820e360  ! 170: STW_I	stw	%r20, [%r3 + 0x0360]
	.word 0x12800001  ! 171: BNE	bne  	<label_0x1>
	.word 0xa610c00b  ! 171: OR_R	or 	%r3, %r11, %r19
	.word 0xa601a633  ! 171: ADD_I	add 	%r6, 0x0633, %r19
	.word 0xb409e879  ! 171: AND_I	and 	%r7, 0x0879, %r26
	bne thr2_loop_13
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_14:
	.word 0xae09800f  ! 177: AND_R	and 	%r6, %r15, %r23
	.word 0xb211000d  ! 177: OR_R	or 	%r4, %r13, %r25
	.word 0xa411000e  ! 177: OR_R	or 	%r4, %r14, %r18
	.word 0xb210c00b  ! 177: OR_R	or 	%r3, %r11, %r25
	.word 0xaa00e983  ! 177: ADD_I	add 	%r3, 0x0983, %r21
	.word 0xb809aee8  ! 177: AND_I	and 	%r6, 0x0ee8, %r28
	.word 0xa409400d  ! 177: AND_R	and 	%r5, %r13, %r18
	.word 0xb401e31e  ! 177: ADD_I	add 	%r7, 0x031e, %r26
	.word 0xb609c00a  ! 177: AND_R	and 	%r7, %r10, %r27
	.word 0xb6096caf  ! 177: AND_I	and 	%r5, 0x0caf, %r27
	.word 0xac09e5b4  ! 177: AND_I	and 	%r7, 0x05b4, %r22
	.word 0xb6012f98  ! 177: ADD_I	add 	%r4, 0x0f98, %r27
	.word 0xa202000a  ! 177: ADD_R	add 	%r8, %r10, %r17
	.word 0xa809c00d  ! 177: AND_R	and 	%r7, %r13, %r20
	.word 0xa210c009  ! 177: OR_R	or 	%r3, %r9, %r17
	.word 0xb2022eb1  ! 177: ADD_I	add 	%r8, 0x0eb1, %r25
	.word 0xa201ef4c  ! 177: ADD_I	add 	%r7, 0x0f4c, %r17
	.word 0xa601800c  ! 177: ADD_R	add 	%r6, %r12, %r19
	.word 0xa600c00c  ! 177: ADD_R	add 	%r3, %r12, %r19
	.word 0xbe01000e  ! 177: ADD_R	add 	%r4, %r14, %r31
	.word 0xbc09000e  ! 177: AND_R	and 	%r4, %r14, %r30
	.word 0xb809a9ee  ! 177: AND_I	and 	%r6, 0x09ee, %r28
	.word 0xb211400b  ! 177: OR_R	or 	%r5, %r11, %r25
	.word 0xb002000c  ! 177: ADD_R	add 	%r8, %r12, %r24
	.word 0xbe12000c  ! 177: OR_R	or 	%r8, %r12, %r31
	.word 0xa809a3cb  ! 177: AND_I	and 	%r6, 0x03cb, %r20
	.word 0xa209800c  ! 177: AND_R	and 	%r6, %r12, %r17
	.word 0xb00121d0  ! 177: ADD_I	add 	%r4, 0x01d0, %r24
	.word 0xb009e3c4  ! 177: AND_I	and 	%r7, 0x03c4, %r24
	.word 0xa60a000a  ! 177: AND_R	and 	%r8, %r10, %r19
	.word 0xa411c009  ! 177: OR_R	or 	%r7, %r9, %r18
	.word 0xbe09c009  ! 177: AND_R	and 	%r7, %r9, %r31
	.word 0xb809c00e  ! 177: AND_R	and 	%r7, %r14, %r28
	.word 0xa410c00f  ! 177: OR_R	or 	%r3, %r15, %r18
	.word 0xae12000b  ! 177: OR_R	or 	%r8, %r11, %r23
	.word 0xb000c00d  ! 177: ADD_R	add 	%r3, %r13, %r24
	.word 0xb8012e9a  ! 177: ADD_I	add 	%r4, 0x0e9a, %r28
	.word 0xbc11244d  ! 177: OR_I	or 	%r4, 0x044d, %r30
	.word 0xb00962b7  ! 177: AND_I	and 	%r5, 0x02b7, %r24
	.word 0xb209aee2  ! 177: AND_I	and 	%r6, 0x0ee2, %r25
	.word 0xae00ec3f  ! 177: ADD_I	add 	%r3, 0x0c3f, %r23
	.word 0xbc08c00e  ! 177: AND_R	and 	%r3, %r14, %r30
	.word 0xa601eddb  ! 177: ADD_I	add 	%r7, 0x0ddb, %r19
	.word 0xb21221d5  ! 177: OR_I	or 	%r8, 0x01d5, %r25
	.word 0xa808e0cb  ! 177: AND_I	and 	%r3, 0x00cb, %r20
	.word 0xa20129b4  ! 177: ADD_I	add 	%r4, 0x09b4, %r17
	.word 0xa4092481  ! 177: AND_I	and 	%r4, 0x0481, %r18
	.word 0xaa098009  ! 177: AND_R	and 	%r6, %r9, %r21
	.word 0xb609000b  ! 177: AND_R	and 	%r4, %r11, %r27
	.word 0xb6096bfb  ! 177: AND_I	and 	%r5, 0x0bfb, %r27
	.word 0xae01a332  ! 177: ADD_I	add 	%r6, 0x0332, %r23
	.word 0xaa11c00c  ! 177: OR_R	or 	%r7, %r12, %r21
	.word 0xa209800b  ! 177: AND_R	and 	%r6, %r11, %r17
	.word 0xbc11000d  ! 177: OR_R	or 	%r4, %r13, %r30
	.word 0xb412286d  ! 177: OR_I	or 	%r8, 0x086d, %r26
	.word 0xa601800a  ! 177: ADD_R	add 	%r6, %r10, %r19
	.word 0xb810ed9e  ! 177: OR_I	or 	%r3, 0x0d9e, %r28
	.word 0xa801a828  ! 177: ADD_I	add 	%r6, 0x0828, %r20
	.word 0xb60969f0  ! 177: AND_I	and 	%r5, 0x09f0, %r27
	.word 0xa601e765  ! 177: ADD_I	add 	%r7, 0x0765, %r19
	.word 0xbc11eb2d  ! 177: OR_I	or 	%r7, 0x0b2d, %r30
	.word 0xae0a2ab6  ! 177: AND_I	and 	%r8, 0x0ab6, %r23
	.word 0xa411800c  ! 177: OR_R	or 	%r6, %r12, %r18
	.word 0xba09a65a  ! 177: AND_I	and 	%r6, 0x065a, %r29
	.word 0xa602000a  ! 177: ADD_R	add 	%r8, %r10, %r19
	.word 0xa411ea79  ! 177: OR_I	or 	%r7, 0x0a79, %r18
	.word 0xa209232e  ! 177: AND_I	and 	%r4, 0x032e, %r17
	.word 0xb811c00c  ! 177: OR_R	or 	%r7, %r12, %r28
	.word 0xb810c00b  ! 177: OR_R	or 	%r3, %r11, %r28
	.word 0xb610c00d  ! 177: OR_R	or 	%r3, %r13, %r27
	.word 0xb411400c  ! 177: OR_R	or 	%r5, %r12, %r26
	.word 0xb201eaaa  ! 177: ADD_I	add 	%r7, 0x0aaa, %r25
	.word 0xb601c009  ! 177: ADD_R	add 	%r7, %r9, %r27
	.word 0xae016cbf  ! 177: ADD_I	add 	%r5, 0x0cbf, %r23
	.word 0xbe09000f  ! 177: AND_R	and 	%r4, %r15, %r31
	.word 0xb001e603  ! 177: ADD_I	add 	%r7, 0x0603, %r24
	.word 0xa808c00c  ! 177: AND_R	and 	%r3, %r12, %r20
	.word 0xaa112859  ! 177: OR_I	or 	%r4, 0x0859, %r21
	.word 0xac01ade3  ! 177: ADD_I	add 	%r6, 0x0de3, %r22
	.word 0xac08edeb  ! 177: AND_I	and 	%r3, 0x0deb, %r22
	.word 0xaa11400f  ! 177: OR_R	or 	%r5, %r15, %r21
	.word 0xb409800a  ! 177: AND_R	and 	%r6, %r10, %r26
	.word 0xa80a2009  ! 177: AND_I	and 	%r8, 0x0009, %r20
	.word 0xb801c009  ! 177: ADD_R	add 	%r7, %r9, %r28
	.word 0xbe08c00d  ! 177: AND_R	and 	%r3, %r13, %r31
	.word 0xa801c00a  ! 177: ADD_R	add 	%r7, %r10, %r20
	.word 0xb209ab63  ! 177: AND_I	and 	%r6, 0x0b63, %r25
	.word 0xb6112b74  ! 177: OR_I	or 	%r4, 0x0b74, %r27
	.word 0xb811aa68  ! 177: OR_I	or 	%r6, 0x0a68, %r28
	.word 0xb011800a  ! 177: OR_R	or 	%r6, %r10, %r24
	.word 0xb20a2b56  ! 177: AND_I	and 	%r8, 0x0b56, %r25
	.word 0xba0162d4  ! 177: ADD_I	add 	%r5, 0x02d4, %r29
	.word 0xa408e857  ! 177: AND_I	and 	%r3, 0x0857, %r18
	.word 0xba11800f  ! 177: OR_R	or 	%r6, %r15, %r29
	.word 0xa209e1cb  ! 177: AND_I	and 	%r7, 0x01cb, %r17
	.word 0xb208c009  ! 177: AND_R	and 	%r3, %r9, %r25
	.word 0xb61122cd  ! 177: OR_I	or 	%r4, 0x02cd, %r27
	.word 0xb811800d  ! 177: OR_R	or 	%r6, %r13, %r28
	.word 0xba01c00e  ! 177: ADD_R	add 	%r7, %r14, %r29
	.word 0xac12000b  ! 177: OR_R	or 	%r8, %r11, %r22
	.word 0xbe12000d  ! 177: OR_R	or 	%r8, %r13, %r31
	.word 0xa808c00e  ! 177: AND_R	and 	%r3, %r14, %r20
	.word 0xbe022c91  ! 177: ADD_I	add 	%r8, 0x0c91, %r31
	.word 0xb009000f  ! 177: AND_R	and 	%r4, %r15, %r24
	.word 0xb401000c  ! 177: ADD_R	add 	%r4, %r12, %r26
	.word 0xb009000f  ! 177: AND_R	and 	%r4, %r15, %r24
	.word 0xb609a199  ! 177: AND_I	and 	%r6, 0x0199, %r27
	.word 0xb601c00d  ! 177: ADD_R	add 	%r7, %r13, %r27
	.word 0xb210e6c4  ! 177: OR_I	or 	%r3, 0x06c4, %r25
	.word 0xb610e130  ! 177: OR_I	or 	%r3, 0x0130, %r27
	.word 0xb210c00d  ! 177: OR_R	or 	%r3, %r13, %r25
	.word 0xb811400d  ! 177: OR_R	or 	%r5, %r13, %r28
	.word 0xac01800b  ! 177: ADD_R	add 	%r6, %r11, %r22
	.word 0xb20a000d  ! 177: AND_R	and 	%r8, %r13, %r25
	.word 0xae11400f  ! 177: OR_R	or 	%r5, %r15, %r23
	.word 0xb209400d  ! 177: AND_R	and 	%r5, %r13, %r25
	.word 0xb011a6d2  ! 177: OR_I	or 	%r6, 0x06d2, %r24
	.word 0xbe112f24  ! 177: OR_I	or 	%r4, 0x0f24, %r31
	.word 0xa411278d  ! 177: OR_I	or 	%r4, 0x078d, %r18
	.word 0xa4022bed  ! 177: ADD_I	add 	%r8, 0x0bed, %r18
	.word 0xbc09800a  ! 177: AND_R	and 	%r6, %r10, %r30
	.word 0xb41228a1  ! 177: OR_I	or 	%r8, 0x08a1, %r26
	.word 0xa601e9e1  ! 177: ADD_I	add 	%r7, 0x09e1, %r19
	.word 0xa409e070  ! 177: AND_I	and 	%r7, 0x0070, %r18
	.word 0xb001000f  ! 177: ADD_R	add 	%r4, %r15, %r24
	.word 0xb012000c  ! 177: OR_R	or 	%r8, %r12, %r24
	.word 0xae09800c  ! 177: AND_R	and 	%r6, %r12, %r23
	.word 0xa2116106  ! 177: OR_I	or 	%r5, 0x0106, %r17
	.word 0xa601eafc  ! 177: ADD_I	add 	%r7, 0x0afc, %r19
	.word 0xbc11e517  ! 177: OR_I	or 	%r7, 0x0517, %r30
	.word 0xa611abb3  ! 177: OR_I	or 	%r6, 0x0bb3, %r19
	.word 0xba08c00d  ! 177: AND_R	and 	%r3, %r13, %r29
	.word 0xb210c00a  ! 177: OR_R	or 	%r3, %r10, %r25
	.word 0xb6012664  ! 177: ADD_I	add 	%r4, 0x0664, %r27
	.word 0xb010ec93  ! 177: OR_I	or 	%r3, 0x0c93, %r24
	.word 0xa40965bc  ! 177: AND_I	and 	%r5, 0x05bc, %r18
	.word 0xa2096a24  ! 177: AND_I	and 	%r5, 0x0a24, %r17
	.word 0xae11000c  ! 177: OR_R	or 	%r4, %r12, %r23
	.word 0xa409aaa1  ! 177: AND_I	and 	%r6, 0x0aa1, %r18
	.word 0xb61226ac  ! 177: OR_I	or 	%r8, 0x06ac, %r27
	.word 0xb81129cd  ! 177: OR_I	or 	%r4, 0x09cd, %r28
	.word 0xac116b02  ! 177: OR_I	or 	%r5, 0x0b02, %r22
	.word 0xaa11af93  ! 177: OR_I	or 	%r6, 0x0f93, %r21
	.word 0xae09aa6c  ! 177: AND_I	and 	%r6, 0x0a6c, %r23
	.word 0xa600efd3  ! 177: ADD_I	add 	%r3, 0x0fd3, %r19
	.word 0xa200c009  ! 177: ADD_R	add 	%r3, %r9, %r17
	.word 0xb411c00a  ! 177: OR_R	or 	%r7, %r10, %r26
	.word 0xaa01a66b  ! 177: ADD_I	add 	%r6, 0x066b, %r21
	.word 0xb801800a  ! 177: ADD_R	add 	%r6, %r10, %r28
	.word 0xa811ae0d  ! 177: OR_I	or 	%r6, 0x0e0d, %r20
	.word 0xba08e050  ! 177: AND_I	and 	%r3, 0x0050, %r29
	.word 0xbe11000b  ! 177: OR_R	or 	%r4, %r11, %r31
	.word 0xaa01e0b5  ! 177: ADD_I	add 	%r7, 0x00b5, %r21
	.word 0xb810ebbf  ! 177: OR_I	or 	%r3, 0x0bbf, %r28
	.word 0xaa10c00b  ! 177: OR_R	or 	%r3, %r11, %r21
	.word 0xa61224ef  ! 177: OR_I	or 	%r8, 0x04ef, %r19
	.word 0xa80a2a11  ! 177: AND_I	and 	%r8, 0x0a11, %r20
	.word 0xae012ac7  ! 177: ADD_I	add 	%r4, 0x0ac7, %r23
	.word 0xb412217a  ! 177: OR_I	or 	%r8, 0x017a, %r26
	.word 0xa41228e9  ! 177: OR_I	or 	%r8, 0x08e9, %r18
	.word 0xaa08ee4b  ! 177: AND_I	and 	%r3, 0x0e4b, %r21
	.word 0xb0010009  ! 177: ADD_R	add 	%r4, %r9, %r24
	.word 0xbc09ac60  ! 177: AND_I	and 	%r6, 0x0c60, %r30
	.word 0xa209000a  ! 177: AND_R	and 	%r4, %r10, %r17
	.word 0xb408c00f  ! 177: AND_R	and 	%r3, %r15, %r26
	.word 0xba02000a  ! 177: ADD_R	add 	%r8, %r10, %r29
	.word 0xa409000f  ! 177: AND_R	and 	%r4, %r15, %r18
	.word 0xba09000c  ! 177: AND_R	and 	%r4, %r12, %r29
	.word 0xb008c00c  ! 177: AND_R	and 	%r3, %r12, %r24
	.word 0xa4016cde  ! 177: ADD_I	add 	%r5, 0x0cde, %r18
	.word 0xa41224bc  ! 177: OR_I	or 	%r8, 0x04bc, %r18
	.word 0xa609ed9c  ! 177: AND_I	and 	%r7, 0x0d9c, %r19
	.word 0xbc11aab6  ! 177: OR_I	or 	%r6, 0x0ab6, %r30
	.word 0xba11000c  ! 177: OR_R	or 	%r4, %r12, %r29
	.word 0xaa11ec92  ! 177: OR_I	or 	%r7, 0x0c92, %r21
	.word 0xa801800f  ! 177: ADD_R	add 	%r6, %r15, %r20
	.word 0xa81126e3  ! 177: OR_I	or 	%r4, 0x06e3, %r20
	.word 0xa2018009  ! 177: ADD_R	add 	%r6, %r9, %r17
	.word 0xb2016bdb  ! 177: ADD_I	add 	%r5, 0x0bdb, %r25
	.word 0xb60126c2  ! 177: ADD_I	add 	%r4, 0x06c2, %r27
	.word 0xb4016e4f  ! 177: ADD_I	add 	%r5, 0x0e4f, %r26
	.word 0xb212000a  ! 177: OR_R	or 	%r8, %r10, %r25
	.word 0xac110009  ! 177: OR_R	or 	%r4, %r9, %r22
	.word 0xac11c009  ! 177: OR_R	or 	%r7, %r9, %r22
	.word 0xa8012a6f  ! 177: ADD_I	add 	%r4, 0x0a6f, %r20
	.word 0xba1220ca  ! 177: OR_I	or 	%r8, 0x00ca, %r29
	.word 0xb2114009  ! 177: OR_R	or 	%r5, %r9, %r25
	.word 0xa211e340  ! 177: OR_I	or 	%r7, 0x0340, %r17
	.word 0xa211800e  ! 177: OR_R	or 	%r6, %r14, %r17
	.word 0xb209800e  ! 177: AND_R	and 	%r6, %r14, %r25
	.word 0xb801400f  ! 177: ADD_R	add 	%r5, %r15, %r28
	.word 0xe431ac92  ! 177: STH_I	sth	%r18, [%r6 + 0x0c92]
	.word 0xf6216c18  ! 177: STW_I	stw	%r27, [%r5 + 0x0c18]
	.word 0xee28ef29  ! 177: STB_I	stb	%r23, [%r3 + 0x0f29]
	.word 0xee296d9b  ! 177: STB_I	stb	%r23, [%r5 + 0x0d9b]
	.word 0xe630e48c  ! 177: STH_I	sth	%r19, [%r3 + 0x048c]
	.word 0xe431a740  ! 178: STH_I	sth	%r18, [%r6 + 0x0740]
	.word 0xb531d00b  ! 179: SRLX_R	srlx	%r7, %r11, %r26
	.word 0xf021aa10  ! 180: STW_I	stw	%r24, [%r6 + 0x0a10]
	.word 0xe321a7f8  ! 181: STF_I	st	%f17, [0x07f8, %r6]
	setx  0x0000000000000470, %r16, %r11
	.word 0xb801c00b  ! 182: ADD_R	add 	%r7, %r11, %r28
	.word 0xba02299a  ! 182: ADD_I	add 	%r8, 0x099a, %r29
	.word 0xb411400a  ! 182: OR_R	or 	%r5, %r10, %r26
	bne thr2_loop_14
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr2_loop_15:
	.word 0xb011800f  ! 188: OR_R	or 	%r6, %r15, %r24
	.word 0xa810c00b  ! 188: OR_R	or 	%r3, %r11, %r20
	.word 0xbe0222a3  ! 188: ADD_I	add 	%r8, 0x02a3, %r31
	.word 0xac01e1e5  ! 188: ADD_I	add 	%r7, 0x01e5, %r22
	.word 0xbc02000d  ! 188: ADD_R	add 	%r8, %r13, %r30
	.word 0xa810c00a  ! 188: OR_R	or 	%r3, %r10, %r20
	.word 0xac09000a  ! 188: AND_R	and 	%r4, %r10, %r22
	.word 0xa601800c  ! 188: ADD_R	add 	%r6, %r12, %r19
	.word 0xbe11e13e  ! 188: OR_I	or 	%r7, 0x013e, %r31
	.word 0xb011c00a  ! 188: OR_R	or 	%r7, %r10, %r24
	.word 0xba09c00d  ! 188: AND_R	and 	%r7, %r13, %r29
	.word 0xb4022f66  ! 188: ADD_I	add 	%r8, 0x0f66, %r26
	.word 0xbe10e0a7  ! 188: OR_I	or 	%r3, 0x00a7, %r31
	.word 0xbc09400d  ! 188: AND_R	and 	%r5, %r13, %r30
	.word 0xa611800f  ! 188: OR_R	or 	%r6, %r15, %r19
	.word 0xbe0a290a  ! 188: AND_I	and 	%r8, 0x090a, %r31
	.word 0xb411400e  ! 188: OR_R	or 	%r5, %r14, %r26
	.word 0xaa116f11  ! 188: OR_I	or 	%r5, 0x0f11, %r21
	.word 0xa4092afe  ! 188: AND_I	and 	%r4, 0x0afe, %r18
	.word 0xa600e098  ! 188: ADD_I	add 	%r3, 0x0098, %r19
	.word 0xa6092429  ! 188: AND_I	and 	%r4, 0x0429, %r19
	.word 0xac1165bd  ! 188: OR_I	or 	%r5, 0x05bd, %r22
	.word 0xac02244b  ! 188: ADD_I	add 	%r8, 0x044b, %r22
	.word 0xba010009  ! 188: ADD_R	add 	%r4, %r9, %r29
	.word 0xb008e944  ! 188: AND_I	and 	%r3, 0x0944, %r24
	.word 0xba09240f  ! 188: AND_I	and 	%r4, 0x040f, %r29
	.word 0xae09214c  ! 188: AND_I	and 	%r4, 0x014c, %r23
	.word 0xae01665f  ! 188: ADD_I	add 	%r5, 0x065f, %r23
	.word 0xac09c00b  ! 188: AND_R	and 	%r7, %r11, %r22
	.word 0xb601000b  ! 188: ADD_R	add 	%r4, %r11, %r27
	.word 0xa609400a  ! 188: AND_R	and 	%r5, %r10, %r19
	.word 0xb001400d  ! 188: ADD_R	add 	%r5, %r13, %r24
	.word 0xba09efcd  ! 188: AND_I	and 	%r7, 0x0fcd, %r29
	.word 0xaa09e53b  ! 188: AND_I	and 	%r7, 0x053b, %r21
	.word 0xba01000d  ! 188: ADD_R	add 	%r4, %r13, %r29
	.word 0xae0a2fc4  ! 188: AND_I	and 	%r8, 0x0fc4, %r23
	.word 0xbe10c00a  ! 188: OR_R	or 	%r3, %r10, %r31
	.word 0xae01800e  ! 188: ADD_R	add 	%r6, %r14, %r23
	.word 0xa811ee37  ! 188: OR_I	or 	%r7, 0x0e37, %r20
	.word 0xb208c00c  ! 188: AND_R	and 	%r3, %r12, %r25
	.word 0xa6092e0f  ! 188: AND_I	and 	%r4, 0x0e0f, %r19
	.word 0xa6022928  ! 188: ADD_I	add 	%r8, 0x0928, %r19
	.word 0xba12000d  ! 188: OR_R	or 	%r8, %r13, %r29
	.word 0xba11c00a  ! 188: OR_R	or 	%r7, %r10, %r29
	.word 0xa60a000a  ! 188: AND_R	and 	%r8, %r10, %r19
	.word 0xb80920b1  ! 188: AND_I	and 	%r4, 0x00b1, %r28
	.word 0xa611800d  ! 188: OR_R	or 	%r6, %r13, %r19
	.word 0xb209000b  ! 188: AND_R	and 	%r4, %r11, %r25
	.word 0xae11400b  ! 188: OR_R	or 	%r5, %r11, %r23
	.word 0xaa01e4fc  ! 188: ADD_I	add 	%r7, 0x04fc, %r21
	.word 0xae12000f  ! 188: OR_R	or 	%r8, %r15, %r23
	.word 0xbe01000f  ! 188: ADD_R	add 	%r4, %r15, %r31
	.word 0xac10e044  ! 188: OR_I	or 	%r3, 0x0044, %r22
	.word 0xae11400e  ! 188: OR_R	or 	%r5, %r14, %r23
	.word 0xa409ad73  ! 188: AND_I	and 	%r6, 0x0d73, %r18
	.word 0xb009a2fa  ! 188: AND_I	and 	%r6, 0x02fa, %r24
	.word 0xb40923f5  ! 188: AND_I	and 	%r4, 0x03f5, %r26
	.word 0xae09acde  ! 188: AND_I	and 	%r6, 0x0cde, %r23
	.word 0xba11800e  ! 188: OR_R	or 	%r6, %r14, %r29
	.word 0xb609800e  ! 188: AND_R	and 	%r6, %r14, %r27
	.word 0xa210e02d  ! 188: OR_I	or 	%r3, 0x002d, %r17
	.word 0xa600e57e  ! 188: ADD_I	add 	%r3, 0x057e, %r19
	.word 0xb0092d15  ! 188: AND_I	and 	%r4, 0x0d15, %r24
	.word 0xaa09653a  ! 188: AND_I	and 	%r5, 0x053a, %r21
	.word 0xa811c00c  ! 188: OR_R	or 	%r7, %r12, %r20
	.word 0xbc11c00f  ! 188: OR_R	or 	%r7, %r15, %r30
	.word 0xbe09400a  ! 188: AND_R	and 	%r5, %r10, %r31
	.word 0xac11400f  ! 188: OR_R	or 	%r5, %r15, %r22
	.word 0xbc098009  ! 188: AND_R	and 	%r6, %r9, %r30
	.word 0xae01800d  ! 188: ADD_R	add 	%r6, %r13, %r23
	.word 0xb20a000a  ! 188: AND_R	and 	%r8, %r10, %r25
	.word 0xac10c00e  ! 188: OR_R	or 	%r3, %r14, %r22
	.word 0xae012a66  ! 188: ADD_I	add 	%r4, 0x0a66, %r23
	.word 0xa40a0009  ! 188: AND_R	and 	%r8, %r9, %r18
	.word 0xa4010009  ! 188: ADD_R	add 	%r4, %r9, %r18
	.word 0xbe11000f  ! 188: OR_R	or 	%r4, %r15, %r31
	.word 0xba12000d  ! 188: OR_R	or 	%r8, %r13, %r29
	.word 0xb801c00c  ! 188: ADD_R	add 	%r7, %r12, %r28
	.word 0xb208c00a  ! 188: AND_R	and 	%r3, %r10, %r25
	.word 0xb8112bc6  ! 188: OR_I	or 	%r4, 0x0bc6, %r28
	.word 0xa211221d  ! 188: OR_I	or 	%r4, 0x021d, %r17
	.word 0xb809400c  ! 188: AND_R	and 	%r5, %r12, %r28
	.word 0xa211a17f  ! 188: OR_I	or 	%r6, 0x017f, %r17
	.word 0xa2092fcd  ! 188: AND_I	and 	%r4, 0x0fcd, %r17
	.word 0xae01800d  ! 188: ADD_R	add 	%r6, %r13, %r23
	.word 0xa811293a  ! 188: OR_I	or 	%r4, 0x093a, %r20
	.word 0xb612000e  ! 188: OR_R	or 	%r8, %r14, %r27
	.word 0xae11608d  ! 188: OR_I	or 	%r5, 0x008d, %r23
	.word 0xa800e28b  ! 188: ADD_I	add 	%r3, 0x028b, %r20
	.word 0xb411adf8  ! 188: OR_I	or 	%r6, 0x0df8, %r26
	.word 0xaa090009  ! 188: AND_R	and 	%r4, %r9, %r21
	.word 0xa600c00d  ! 188: ADD_R	add 	%r3, %r13, %r19
	.word 0xa201eeec  ! 188: ADD_I	add 	%r7, 0x0eec, %r17
	.word 0xa409a939  ! 188: AND_I	and 	%r6, 0x0939, %r18
	.word 0xbc09400a  ! 188: AND_R	and 	%r5, %r10, %r30
	.word 0xb601e5af  ! 188: ADD_I	add 	%r7, 0x05af, %r27
	.word 0xb00923c3  ! 188: AND_I	and 	%r4, 0x03c3, %r24
	.word 0xbc11800b  ! 188: OR_R	or 	%r6, %r11, %r30
	.word 0xa609ae0b  ! 188: AND_I	and 	%r6, 0x0e0b, %r19
	.word 0xac0a000a  ! 188: AND_R	and 	%r8, %r10, %r22
	.word 0xa80963c1  ! 188: AND_I	and 	%r5, 0x03c1, %r20
	.word 0xb010e3a4  ! 188: OR_I	or 	%r3, 0x03a4, %r24
	.word 0xa212000e  ! 188: OR_R	or 	%r8, %r14, %r17
	.word 0xaa09400e  ! 188: AND_R	and 	%r5, %r14, %r21
	.word 0xba00c00f  ! 188: ADD_R	add 	%r3, %r15, %r29
	.word 0xa411c00d  ! 188: OR_R	or 	%r7, %r13, %r18
	.word 0xb201ea5a  ! 188: ADD_I	add 	%r7, 0x0a5a, %r25
	.word 0xb401c00f  ! 188: ADD_R	add 	%r7, %r15, %r26
	.word 0xba01ae36  ! 188: ADD_I	add 	%r6, 0x0e36, %r29
	.word 0xb601e87f  ! 188: ADD_I	add 	%r7, 0x087f, %r27
	.word 0xb8098009  ! 188: AND_R	and 	%r6, %r9, %r28
	.word 0xa809400e  ! 188: AND_R	and 	%r5, %r14, %r20
	.word 0xa611ed6e  ! 188: OR_I	or 	%r7, 0x0d6e, %r19
	.word 0xb201000d  ! 188: ADD_R	add 	%r4, %r13, %r25
	.word 0xac12000c  ! 188: OR_R	or 	%r8, %r12, %r22
	.word 0xba01a21c  ! 188: ADD_I	add 	%r6, 0x021c, %r29
	.word 0xba0124ac  ! 188: ADD_I	add 	%r4, 0x04ac, %r29
	.word 0xb002270a  ! 188: ADD_I	add 	%r8, 0x070a, %r24
	.word 0xa41224f3  ! 188: OR_I	or 	%r8, 0x04f3, %r18
	.word 0xb001a4de  ! 188: ADD_I	add 	%r6, 0x04de, %r24
	.word 0xb610e0d4  ! 188: OR_I	or 	%r3, 0x00d4, %r27
	.word 0xb408c00c  ! 188: AND_R	and 	%r3, %r12, %r26
	.word 0xa811c00e  ! 188: OR_R	or 	%r7, %r14, %r20
	.word 0xa80a000b  ! 188: AND_R	and 	%r8, %r11, %r20
	.word 0xb011afd8  ! 188: OR_I	or 	%r6, 0x0fd8, %r24
	.word 0xa609e4e0  ! 188: AND_I	and 	%r7, 0x04e0, %r19
	.word 0xa810ee48  ! 188: OR_I	or 	%r3, 0x0e48, %r20
	.word 0xaa11800a  ! 188: OR_R	or 	%r6, %r10, %r21
	.word 0xa40a24e4  ! 188: AND_I	and 	%r8, 0x04e4, %r18
	.word 0xbe01c00d  ! 188: ADD_R	add 	%r7, %r13, %r31
	.word 0xa210e83d  ! 188: OR_I	or 	%r3, 0x083d, %r17
	.word 0xa2012c2d  ! 188: ADD_I	add 	%r4, 0x0c2d, %r17
	.word 0xb4116d08  ! 188: OR_I	or 	%r5, 0x0d08, %r26
	.word 0xa411400c  ! 188: OR_R	or 	%r5, %r12, %r18
	.word 0xbc01400b  ! 188: ADD_R	add 	%r5, %r11, %r30
	.word 0xba08e4db  ! 188: AND_I	and 	%r3, 0x04db, %r29
	.word 0xb0092ba7  ! 188: AND_I	and 	%r4, 0x0ba7, %r24
	.word 0xb402000c  ! 188: ADD_R	add 	%r8, %r12, %r26
	.word 0xa2122b5f  ! 188: OR_I	or 	%r8, 0x0b5f, %r17
	.word 0xa8094009  ! 188: AND_R	and 	%r5, %r9, %r20
	.word 0xbc09000c  ! 188: AND_R	and 	%r4, %r12, %r30
	.word 0xbe11000b  ! 188: OR_R	or 	%r4, %r11, %r31
	.word 0xb601c00c  ! 188: ADD_R	add 	%r7, %r12, %r27
	.word 0xac016cde  ! 188: ADD_I	add 	%r5, 0x0cde, %r22
	.word 0xaa11637b  ! 188: OR_I	or 	%r5, 0x037b, %r21
	.word 0xa20a0009  ! 188: AND_R	and 	%r8, %r9, %r17
	.word 0xac09c009  ! 188: AND_R	and 	%r7, %r9, %r22
	.word 0xbc00c00a  ! 188: ADD_R	add 	%r3, %r10, %r30
	.word 0xac02000e  ! 188: ADD_R	add 	%r8, %r14, %r22
	.word 0xa409800e  ! 188: AND_R	and 	%r6, %r14, %r18
	.word 0xb211699a  ! 188: OR_I	or 	%r5, 0x099a, %r25
	.word 0xba11000d  ! 188: OR_R	or 	%r4, %r13, %r29
	.word 0xae11800b  ! 188: OR_R	or 	%r6, %r11, %r23
	.word 0xa6112e3d  ! 188: OR_I	or 	%r4, 0x0e3d, %r19
	.word 0xac11c009  ! 188: OR_R	or 	%r7, %r9, %r22
	.word 0xba00c00b  ! 188: ADD_R	add 	%r3, %r11, %r29
	.word 0xa201000a  ! 188: ADD_R	add 	%r4, %r10, %r17
	.word 0xb802000e  ! 188: ADD_R	add 	%r8, %r14, %r28
	.word 0xb01167c7  ! 188: OR_I	or 	%r5, 0x07c7, %r24
	.word 0xa2092129  ! 188: AND_I	and 	%r4, 0x0129, %r17
	.word 0xb00a2062  ! 188: AND_I	and 	%r8, 0x0062, %r24
	.word 0xbe09ee49  ! 188: AND_I	and 	%r7, 0x0e49, %r31
	.word 0xa601000c  ! 188: ADD_R	add 	%r4, %r12, %r19
	.word 0xa601a59e  ! 188: ADD_I	add 	%r6, 0x059e, %r19
	.word 0xac01400b  ! 188: ADD_R	add 	%r5, %r11, %r22
	.word 0xa811eb93  ! 188: OR_I	or 	%r7, 0x0b93, %r20
	.word 0xb011800d  ! 188: OR_R	or 	%r6, %r13, %r24
	.word 0xa808e858  ! 188: AND_I	and 	%r3, 0x0858, %r20
	.word 0xbe016745  ! 188: ADD_I	add 	%r5, 0x0745, %r31
	.word 0xb60a000f  ! 188: AND_R	and 	%r8, %r15, %r27
	.word 0xb209800d  ! 188: AND_R	and 	%r6, %r13, %r25
	.word 0xa209800b  ! 188: AND_R	and 	%r6, %r11, %r17
	.word 0xb411afb8  ! 188: OR_I	or 	%r6, 0x0fb8, %r26
	.word 0xb6096e18  ! 188: AND_I	and 	%r5, 0x0e18, %r27
	.word 0xb809000f  ! 188: AND_R	and 	%r4, %r15, %r28
	.word 0xac02000f  ! 188: ADD_R	add 	%r8, %r15, %r22
	.word 0xae08e127  ! 188: AND_I	and 	%r3, 0x0127, %r23
	.word 0xbc092b99  ! 188: AND_I	and 	%r4, 0x0b99, %r30
	.word 0xbe08e8c7  ! 188: AND_I	and 	%r3, 0x08c7, %r31
	.word 0xb202273c  ! 188: ADD_I	add 	%r8, 0x073c, %r25
	.word 0xba11000c  ! 188: OR_R	or 	%r4, %r12, %r29
	.word 0xb002203e  ! 188: ADD_I	add 	%r8, 0x003e, %r24
	.word 0xb001e193  ! 188: ADD_I	add 	%r7, 0x0193, %r24
	.word 0xaa010009  ! 188: ADD_R	add 	%r4, %r9, %r21
	.word 0xb8110009  ! 188: OR_R	or 	%r4, %r9, %r28
	.word 0xba09c00f  ! 188: AND_R	and 	%r7, %r15, %r29
	.word 0xae0a000a  ! 188: AND_R	and 	%r8, %r10, %r23
	.word 0xa201adfd  ! 188: ADD_I	add 	%r6, 0x0dfd, %r17
	.word 0xb211800c  ! 188: OR_R	or 	%r6, %r12, %r25
	.word 0xa209800e  ! 188: AND_R	and 	%r6, %r14, %r17
	.word 0xa800c00f  ! 188: ADD_R	add 	%r3, %r15, %r20
	.word 0xb011000a  ! 188: OR_R	or 	%r4, %r10, %r24
	.word 0xba01ac6a  ! 188: ADD_I	add 	%r6, 0x0c6a, %r29
	.word 0xae11800b  ! 188: OR_R	or 	%r6, %r11, %r23
	.word 0xa808e22b  ! 188: AND_I	and 	%r3, 0x022b, %r20
	.word 0xa809e558  ! 188: AND_I	and 	%r7, 0x0558, %r20
	.word 0xbe10e33f  ! 188: OR_I	or 	%r3, 0x033f, %r31
	.word 0xac08ed48  ! 188: AND_I	and 	%r3, 0x0d48, %r22
	.word 0xbe11000d  ! 188: OR_R	or 	%r4, %r13, %r31
	.word 0xae014009  ! 188: ADD_R	add 	%r5, %r9, %r23
	.word 0xb011e68a  ! 188: OR_I	or 	%r7, 0x068a, %r24
	.word 0xbc11272f  ! 188: OR_I	or 	%r4, 0x072f, %r30
	.word 0xb0096dfb  ! 188: AND_I	and 	%r5, 0x0dfb, %r24
	.word 0xba016c44  ! 188: ADD_I	add 	%r5, 0x0c44, %r29
	.word 0xba11a16a  ! 188: OR_I	or 	%r6, 0x016a, %r29
	.word 0xbc02283e  ! 188: ADD_I	add 	%r8, 0x083e, %r30
	.word 0xb601800a  ! 188: ADD_R	add 	%r6, %r10, %r27
	.word 0xa201ea67  ! 188: ADD_I	add 	%r7, 0x0a67, %r17
	.word 0xb0122777  ! 188: OR_I	or 	%r8, 0x0777, %r24
	.word 0xb211000a  ! 188: OR_R	or 	%r4, %r10, %r25
	.word 0xb001c009  ! 188: ADD_R	add 	%r7, %r9, %r24
	.word 0xaa090009  ! 188: AND_R	and 	%r4, %r9, %r21
	.word 0xac01800d  ! 188: ADD_R	add 	%r6, %r13, %r22
	.word 0xa60a000d  ! 188: AND_R	and 	%r8, %r13, %r19
	.word 0xb612000e  ! 188: OR_R	or 	%r8, %r14, %r27
	.word 0xba092e8d  ! 188: AND_I	and 	%r4, 0x0e8d, %r29
	.word 0xb41228a5  ! 188: OR_I	or 	%r8, 0x08a5, %r26
	.word 0xbe08e869  ! 188: AND_I	and 	%r3, 0x0869, %r31
	.word 0xa801000b  ! 188: ADD_R	add 	%r4, %r11, %r20
	.word 0xa408e90d  ! 188: AND_I	and 	%r3, 0x090d, %r18
	.word 0xb401c00f  ! 188: ADD_R	add 	%r7, %r15, %r26
	.word 0xbc02241d  ! 188: ADD_I	add 	%r8, 0x041d, %r30
	.word 0xa812000a  ! 188: OR_R	or 	%r8, %r10, %r20
	.word 0xfe292306  ! 188: STB_I	stb	%r31, [%r4 + 0x0306]
	.word 0xea21a358  ! 188: STW_I	stw	%r21, [%r6 + 0x0358]
	.word 0xe229e555  ! 188: STB_I	stb	%r17, [%r7 + 0x0555]
	.word 0xee716c60  ! 188: STX_I	stx	%r23, [%r5 + 0x0c60]
	.word 0xec31e72c  ! 188: STH_I	sth	%r22, [%r7 + 0x072c]
	.word 0xf8296e9b  ! 190: STB_I	stb	%r28, [%r5 + 0x0e9b]
	.word 0xae010045
	.word 0xee31a794  ! 192: STH_I	sth	%r23, [%r6 + 0x0794]
	.word 0xeca165b4  ! 193: STWA_I	stwa	%r22, [%r5 + 0x05b4] %asi
	.word 0xb269e732  ! 194: UDIVX_I	udivx 	%r7, 0x0732, %r25
	.word 0xb211c009  ! 194: OR_R	or 	%r7, %r9, %r25
	.word 0xbe1224b9  ! 194: OR_I	or 	%r8, 0x04b9, %r31
	.word 0xb609c00c  ! 194: AND_R	and 	%r7, %r12, %r27
	bne thr2_loop_15
	subcc %g1, 0x1, %g1
	ba	join_lbl_0_0
	nop
fork_lbl_0_1:
	setx  0xbaff3c5c5deb2696, %r1, %r17
	setx  0x3b5b4b9f460bcd53, %r1, %r18
	setx  0xca2429c7e57fb9ae, %r1, %r19
	setx  0xef05023c2d478cb9, %r1, %r20
	setx  0x7b0f524dddda880d, %r1, %r21
	setx  0x93dc185cadf35d0a, %r1, %r22
	setx  0x174c310dfc0a1b66, %r1, %r23
	setx  0x8dcb1c99ed67e293, %r1, %r24
	setx  0xcf9517cbe1a85815, %r1, %r25
	setx  0x08d71823781f5942, %r1, %r26
	setx  0x33b3da83c12ab730, %r1, %r27
	setx  0x7bc7ced6094b0070, %r1, %r28
	setx  0xad44c0819e1101ca, %r1, %r29
	setx  0x158db0b7877b04ab, %r1, %r30
	setx  0x228e72a1c9fd380b, %r1, %r31
	setx  0x00000000000002f0, %r1, %r9
	setx  0x00000000000008c0, %r1, %r10
	setx  0x00000000000008a0, %r1, %r11
	setx  0x0000000000000140, %r1, %r12
	setx  0x00000000000008e0, %r1, %r13
	setx  0x0000000000000620, %r1, %r14
	setx  0x0000000000000b30, %r1, %r15
	setx MAIN_BASE_DATA_VA, %r1, %r3
	setx MAIN_BASE_DATA_VA, %r1, %r4
	setx MAIN_BASE_DATA_VA, %r1, %r5
	setx MAIN_BASE_DATA_VA, %r1, %r6
	setx MAIN_BASE_DATA_VA, %r1, %r7
	setx MAIN_BASE_DATA_VA, %r1, %r8
	setx  0x0000000000003487, %r1, %r2
	wr %r0, 0x4, %fprs
	ldd	[%r4 + 0], %f0
	ldd	[%r4 + 8], %f2
	ldd	[%r4 + 16], %f4
	ldd	[%r4 + 24], %f6
	ldd	[%r4 + 32], %f8
	ldd	[%r4 + 40], %f10
	ldd	[%r4 + 48], %f12
	ldd	[%r4 + 56], %f14
	ldd	[%r4 + 64], %f16
	ldd	[%r4 + 72], %f18
	ldd	[%r4 + 80], %f20
	ldd	[%r4 + 88], %f22
	ldd	[%r4 + 96], %f24
	ldd	[%r4 + 104], %f26
	ldd	[%r4 + 112], %f28
	ldd	[%r4 + 120], %f30
	ldd	[%r4 + 128], %f32
	ldd	[%r4 + 136], %f34
	ldd	[%r4 + 144], %f36
	ldd	[%r4 + 152], %f38
	ldd	[%r4 + 160], %f40
	ldd	[%r4 + 168], %f42
	ldd	[%r4 + 176], %f44
	ldd	[%r4 + 184], %f46
	ldd	[%r4 + 192], %f48
	ldd	[%r4 + 200], %f50
	ldd	[%r4 + 208], %f52
	ldd	[%r4 + 216], %f54
	ldd	[%r4 + 224], %f56
	ldd	[%r4 + 232], %f58
	ldd	[%r4 + 240], %f60
	ldd	[%r4 + 248], %f62
	wr  %r0, 0x80, %asi
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_0:
	.word 0xa6018009  ! 6: ADD_R	add 	%r6, %r9, %r19
	.word 0xae01400d  ! 6: ADD_R	add 	%r5, %r13, %r23
	.word 0xb809e880  ! 6: AND_I	and 	%r7, 0x0880, %r28
	.word 0xb4018009  ! 6: ADD_R	add 	%r6, %r9, %r26
	.word 0xb410e4ab  ! 6: OR_I	or 	%r3, 0x04ab, %r26
	.word 0xa4012c2b  ! 6: ADD_I	add 	%r4, 0x0c2b, %r18
	.word 0xb211ec4e  ! 6: OR_I	or 	%r7, 0x0c4e, %r25
	.word 0xa2016069  ! 6: ADD_I	add 	%r5, 0x0069, %r17
	.word 0xb000c00c  ! 6: ADD_R	add 	%r3, %r12, %r24
	.word 0xb80a213d  ! 6: AND_I	and 	%r8, 0x013d, %r28
	.word 0xa60a000e  ! 6: AND_R	and 	%r8, %r14, %r19
	.word 0xa4016d98  ! 6: ADD_I	add 	%r5, 0x0d98, %r18
	.word 0xb2022573  ! 6: ADD_I	add 	%r8, 0x0573, %r25
	.word 0xa8012c0c  ! 6: ADD_I	add 	%r4, 0x0c0c, %r20
	.word 0xaa012818  ! 6: ADD_I	add 	%r4, 0x0818, %r21
	.word 0xa60121f3  ! 6: ADD_I	add 	%r4, 0x01f3, %r19
	.word 0xaa01ec8e  ! 6: ADD_I	add 	%r7, 0x0c8e, %r21
	.word 0xac01aebd  ! 6: ADD_I	add 	%r6, 0x0ebd, %r22
	.word 0xa211000e  ! 6: OR_R	or 	%r4, %r14, %r17
	.word 0xb601400a  ! 6: ADD_R	add 	%r5, %r10, %r27
	.word 0xa812000a  ! 6: OR_R	or 	%r8, %r10, %r20
	.word 0xb001800a  ! 6: ADD_R	add 	%r6, %r10, %r24
	.word 0xac02000a  ! 6: ADD_R	add 	%r8, %r10, %r22
	.word 0xba09e7c1  ! 6: AND_I	and 	%r7, 0x07c1, %r29
	.word 0xaa00c009  ! 6: ADD_R	add 	%r3, %r9, %r21
	.word 0xa612000a  ! 6: OR_R	or 	%r8, %r10, %r19
	.word 0xb609000b  ! 6: AND_R	and 	%r4, %r11, %r27
	.word 0xaa11eef1  ! 6: OR_I	or 	%r7, 0x0ef1, %r21
	.word 0xb201400d  ! 6: ADD_R	add 	%r5, %r13, %r25
	.word 0xb601a6e6  ! 6: ADD_I	add 	%r6, 0x06e6, %r27
	.word 0xa609a382  ! 6: AND_I	and 	%r6, 0x0382, %r19
	.word 0xb8012372  ! 6: ADD_I	add 	%r4, 0x0372, %r28
	.word 0xa601000e  ! 6: ADD_R	add 	%r4, %r14, %r19
	.word 0xa401e7f8  ! 6: ADD_I	add 	%r7, 0x07f8, %r18
	.word 0xb80a000e  ! 6: AND_R	and 	%r8, %r14, %r28
	.word 0xa4020009  ! 6: ADD_R	add 	%r8, %r9, %r18
	.word 0xa200e71e  ! 6: ADD_I	add 	%r3, 0x071e, %r17
	.word 0xa411800b  ! 6: OR_R	or 	%r6, %r11, %r18
	.word 0xa212000d  ! 6: OR_R	or 	%r8, %r13, %r17
	.word 0xa411e4f3  ! 6: OR_I	or 	%r7, 0x04f3, %r18
	.word 0xac00c00e  ! 6: ADD_R	add 	%r3, %r14, %r22
	.word 0xa201000d  ! 6: ADD_R	add 	%r4, %r13, %r17
	.word 0xae11e641  ! 6: OR_I	or 	%r7, 0x0641, %r23
	.word 0xba01c00e  ! 6: ADD_R	add 	%r7, %r14, %r29
	.word 0xb408c00c  ! 6: AND_R	and 	%r3, %r12, %r26
	.word 0xa8112d44  ! 6: OR_I	or 	%r4, 0x0d44, %r20
	.word 0xb2092748  ! 6: AND_I	and 	%r4, 0x0748, %r25
	.word 0xb410e9a4  ! 6: OR_I	or 	%r3, 0x09a4, %r26
	.word 0xbe01400b  ! 6: ADD_R	add 	%r5, %r11, %r31
	.word 0xb6122677  ! 6: OR_I	or 	%r8, 0x0677, %r27
	.word 0xa60a000a  ! 6: AND_R	and 	%r8, %r10, %r19
	.word 0xaa01ee4d  ! 6: ADD_I	add 	%r7, 0x0e4d, %r21
	.word 0xb400c00a  ! 6: ADD_R	add 	%r3, %r10, %r26
	.word 0xb208eb16  ! 6: AND_I	and 	%r3, 0x0b16, %r25
	.word 0xa800e247  ! 6: ADD_I	add 	%r3, 0x0247, %r20
	.word 0xba12000d  ! 6: OR_R	or 	%r8, %r13, %r29
	.word 0xa80a2d8d  ! 6: AND_I	and 	%r8, 0x0d8d, %r20
	.word 0xba09800b  ! 6: AND_R	and 	%r6, %r11, %r29
	.word 0xaa10c00e  ! 6: OR_R	or 	%r3, %r14, %r21
	.word 0xb401400c  ! 6: ADD_R	add 	%r5, %r12, %r26
	.word 0xa811400d  ! 6: OR_R	or 	%r5, %r13, %r20
	.word 0xb0122e34  ! 6: OR_I	or 	%r8, 0x0e34, %r24
	.word 0xaa01c00c  ! 6: ADD_R	add 	%r7, %r12, %r21
	.word 0xa810ea24  ! 6: OR_I	or 	%r3, 0x0a24, %r20
	.word 0xb401eb66  ! 6: ADD_I	add 	%r7, 0x0b66, %r26
	.word 0xb411c00d  ! 6: OR_R	or 	%r7, %r13, %r26
	.word 0xb2122636  ! 6: OR_I	or 	%r8, 0x0636, %r25
	.word 0xa4092444  ! 6: AND_I	and 	%r4, 0x0444, %r18
	.word 0xb600e038  ! 6: ADD_I	add 	%r3, 0x0038, %r27
	.word 0xae11600b  ! 6: OR_I	or 	%r5, 0x000b, %r23
	.word 0xbe02000b  ! 6: ADD_R	add 	%r8, %r11, %r31
	.word 0xbe11000b  ! 6: OR_R	or 	%r4, %r11, %r31
	.word 0xb201c009  ! 6: ADD_R	add 	%r7, %r9, %r25
	.word 0xa809400a  ! 6: AND_R	and 	%r5, %r10, %r20
	.word 0xb811000b  ! 6: OR_R	or 	%r4, %r11, %r28
	.word 0xa409400e  ! 6: AND_R	and 	%r5, %r14, %r18
	.word 0xb802000e  ! 6: ADD_R	add 	%r8, %r14, %r28
	.word 0xb6120009  ! 6: OR_R	or 	%r8, %r9, %r27
	.word 0xae00c00d  ! 6: ADD_R	add 	%r3, %r13, %r23
	.word 0xa401ac2f  ! 6: ADD_I	add 	%r6, 0x0c2f, %r18
	.word 0xa401000e  ! 6: ADD_R	add 	%r4, %r14, %r18
	.word 0xb811400c  ! 6: OR_R	or 	%r5, %r12, %r28
	.word 0xb009c00f  ! 6: AND_R	and 	%r7, %r15, %r24
	.word 0xb810c00a  ! 6: OR_R	or 	%r3, %r10, %r28
	.word 0xba096db0  ! 6: AND_I	and 	%r5, 0x0db0, %r29
	.word 0xba0a000e  ! 6: AND_R	and 	%r8, %r14, %r29
	.word 0xb401eb41  ! 6: ADD_I	add 	%r7, 0x0b41, %r26
	.word 0xba09684d  ! 6: AND_I	and 	%r5, 0x084d, %r29
	.word 0xb209c00c  ! 6: AND_R	and 	%r7, %r12, %r25
	.word 0xa211000c  ! 6: OR_R	or 	%r4, %r12, %r17
	.word 0xb409800a  ! 6: AND_R	and 	%r6, %r10, %r26
	.word 0xac090009  ! 6: AND_R	and 	%r4, %r9, %r22
	.word 0xb809aff7  ! 6: AND_I	and 	%r6, 0x0ff7, %r28
	.word 0xa4022321  ! 6: ADD_I	add 	%r8, 0x0321, %r18
	.word 0xac10c009  ! 6: OR_R	or 	%r3, %r9, %r22
	.word 0xa20a2a2f  ! 6: AND_I	and 	%r8, 0x0a2f, %r17
	.word 0xa801681d  ! 6: ADD_I	add 	%r5, 0x081d, %r20
	.word 0xac10e39e  ! 6: OR_I	or 	%r3, 0x039e, %r22
	.word 0xa412000f  ! 6: OR_R	or 	%r8, %r15, %r18
	.word 0xb80220f3  ! 6: ADD_I	add 	%r8, 0x00f3, %r28
	.word 0xb20161a5  ! 6: ADD_I	add 	%r5, 0x01a5, %r25
	.word 0xaa01c00f  ! 6: ADD_R	add 	%r7, %r15, %r21
	.word 0xac112c76  ! 6: OR_I	or 	%r4, 0x0c76, %r22
	.word 0xa209400f  ! 6: AND_R	and 	%r5, %r15, %r17
	.word 0xba09400b  ! 6: AND_R	and 	%r5, %r11, %r29
	.word 0xbc012798  ! 6: ADD_I	add 	%r4, 0x0798, %r30
	.word 0xa801a54e  ! 6: ADD_I	add 	%r6, 0x054e, %r20
	.word 0xbe014009  ! 6: ADD_R	add 	%r5, %r9, %r31
	.word 0xac01acea  ! 6: ADD_I	add 	%r6, 0x0cea, %r22
	.word 0xb401400b  ! 6: ADD_R	add 	%r5, %r11, %r26
	.word 0xb4090009  ! 6: AND_R	and 	%r4, %r9, %r26
	.word 0xb201e216  ! 6: ADD_I	add 	%r7, 0x0216, %r25
	.word 0xa200c00a  ! 6: ADD_R	add 	%r3, %r10, %r17
	.word 0xaa11000a  ! 6: OR_R	or 	%r4, %r10, %r21
	.word 0xa2012410  ! 6: ADD_I	add 	%r4, 0x0410, %r17
	.word 0xb009400b  ! 6: AND_R	and 	%r5, %r11, %r24
	.word 0xba0a2b5e  ! 6: AND_I	and 	%r8, 0x0b5e, %r29
	.word 0xac092f50  ! 6: AND_I	and 	%r4, 0x0f50, %r22
	.word 0xac02000b  ! 6: ADD_R	add 	%r8, %r11, %r22
	.word 0xba11000c  ! 6: OR_R	or 	%r4, %r12, %r29
	.word 0xba110009  ! 6: OR_R	or 	%r4, %r9, %r29
	.word 0xa808c00b  ! 6: AND_R	and 	%r3, %r11, %r20
	.word 0xbe11a7e5  ! 6: OR_I	or 	%r6, 0x07e5, %r31
	.word 0xbc00c00f  ! 6: ADD_R	add 	%r3, %r15, %r30
	.word 0xb408e3f2  ! 6: AND_I	and 	%r3, 0x03f2, %r26
	.word 0xa609ea05  ! 6: AND_I	and 	%r7, 0x0a05, %r19
	.word 0xaa01000e  ! 6: ADD_R	add 	%r4, %r14, %r21
	.word 0xa802275c  ! 6: ADD_I	add 	%r8, 0x075c, %r20
	.word 0xa409000d  ! 6: AND_R	and 	%r4, %r13, %r18
	.word 0xaa01400d  ! 6: ADD_R	add 	%r5, %r13, %r21
	.word 0xa8090009  ! 6: AND_R	and 	%r4, %r9, %r20
	.word 0xbe11a51d  ! 6: OR_I	or 	%r6, 0x051d, %r31
	.word 0xa8022bf5  ! 6: ADD_I	add 	%r8, 0x0bf5, %r20
	.word 0xaa01a329  ! 6: ADD_I	add 	%r6, 0x0329, %r21
	.word 0xa610c00d  ! 6: OR_R	or 	%r3, %r13, %r19
	.word 0xb211000e  ! 6: OR_R	or 	%r4, %r14, %r25
	.word 0xb2096077  ! 6: AND_I	and 	%r5, 0x0077, %r25
	.word 0xa411e962  ! 6: OR_I	or 	%r7, 0x0962, %r18
	.word 0xa211eafd  ! 6: OR_I	or 	%r7, 0x0afd, %r17
	.word 0xbc098009  ! 6: AND_R	and 	%r6, %r9, %r30
	.word 0xa4012230  ! 6: ADD_I	add 	%r4, 0x0230, %r18
	.word 0xa6116966  ! 6: OR_I	or 	%r5, 0x0966, %r19
	.word 0xae08c00f  ! 6: AND_R	and 	%r3, %r15, %r23
	.word 0xa60226d9  ! 6: ADD_I	add 	%r8, 0x06d9, %r19
	.word 0xb4098009  ! 6: AND_R	and 	%r6, %r9, %r26
	.word 0xa2122c0a  ! 6: OR_I	or 	%r8, 0x0c0a, %r17
	.word 0xac11800c  ! 6: OR_R	or 	%r6, %r12, %r22
	.word 0xaa11c00e  ! 6: OR_R	or 	%r7, %r14, %r21
	.word 0xbe02249d  ! 6: ADD_I	add 	%r8, 0x049d, %r31
	.word 0xb411400a  ! 6: OR_R	or 	%r5, %r10, %r26
	.word 0xa4022aa6  ! 6: ADD_I	add 	%r8, 0x0aa6, %r18
	.word 0xbc00c009  ! 6: ADD_R	add 	%r3, %r9, %r30
	.word 0xb01222d2  ! 6: OR_I	or 	%r8, 0x02d2, %r24
	.word 0xa811a992  ! 6: OR_I	or 	%r6, 0x0992, %r20
	.word 0xb211000c  ! 6: OR_R	or 	%r4, %r12, %r25
	.word 0xa810c00e  ! 6: OR_R	or 	%r3, %r14, %r20
	.word 0xb009000a  ! 6: AND_R	and 	%r4, %r10, %r24
	.word 0xb608ed5d  ! 6: AND_I	and 	%r3, 0x0d5d, %r27
	.word 0xa81221d4  ! 6: OR_I	or 	%r8, 0x01d4, %r20
	.word 0xba09400d  ! 6: AND_R	and 	%r5, %r13, %r29
	.word 0xa2116287  ! 6: OR_I	or 	%r5, 0x0287, %r17
	.word 0xa409aa0d  ! 6: AND_I	and 	%r6, 0x0a0d, %r18
	.word 0xbe10c00f  ! 6: OR_R	or 	%r3, %r15, %r31
	.word 0xb4116e0f  ! 6: OR_I	or 	%r5, 0x0e0f, %r26
	.word 0xa208c00d  ! 6: AND_R	and 	%r3, %r13, %r17
	.word 0xac09c00e  ! 6: AND_R	and 	%r7, %r14, %r22
	.word 0xae12226c  ! 6: OR_I	or 	%r8, 0x026c, %r23
	.word 0xba12000f  ! 6: OR_R	or 	%r8, %r15, %r29
	.word 0xb811800f  ! 6: OR_R	or 	%r6, %r15, %r28
	.word 0xae0a0009  ! 6: AND_R	and 	%r8, %r9, %r23
	.word 0xba114009  ! 6: OR_R	or 	%r5, %r9, %r29
	.word 0xaa09400f  ! 6: AND_R	and 	%r5, %r15, %r21
	.word 0xb412000a  ! 6: OR_R	or 	%r8, %r10, %r26
	.word 0xb802266d  ! 6: ADD_I	add 	%r8, 0x066d, %r28
	.word 0xa411e90f  ! 6: OR_I	or 	%r7, 0x090f, %r18
	.word 0xa6122d5c  ! 6: OR_I	or 	%r8, 0x0d5c, %r19
	.word 0xaa10e6fd  ! 6: OR_I	or 	%r3, 0x06fd, %r21
	.word 0xa211400a  ! 6: OR_R	or 	%r5, %r10, %r17
	.word 0xba11a487  ! 6: OR_I	or 	%r6, 0x0487, %r29
	.word 0xb00a000d  ! 6: AND_R	and 	%r8, %r13, %r24
	.word 0xb809800a  ! 6: AND_R	and 	%r6, %r10, %r28
	.word 0xa401000e  ! 6: ADD_R	add 	%r4, %r14, %r18
	.word 0xa612000d  ! 6: OR_R	or 	%r8, %r13, %r19
	.word 0xb009a331  ! 6: AND_I	and 	%r6, 0x0331, %r24
	.word 0xb4118009  ! 6: OR_R	or 	%r6, %r9, %r26
	.word 0xb6114009  ! 6: OR_R	or 	%r5, %r9, %r27
	.word 0xb6116b67  ! 6: OR_I	or 	%r5, 0x0b67, %r27
	.word 0xac098009  ! 6: AND_R	and 	%r6, %r9, %r22
	.word 0xb409800e  ! 6: AND_R	and 	%r6, %r14, %r26
	.word 0xb001e6b1  ! 6: ADD_I	add 	%r7, 0x06b1, %r24
	.word 0xbc09c00e  ! 6: AND_R	and 	%r7, %r14, %r30
	.word 0xaa01800a  ! 6: ADD_R	add 	%r6, %r10, %r21
	.word 0xa612000c  ! 6: OR_R	or 	%r8, %r12, %r19
	.word 0xa201aaa5  ! 6: ADD_I	add 	%r6, 0x0aa5, %r17
	.word 0xb209800d  ! 6: AND_R	and 	%r6, %r13, %r25
	.word 0xa209400b  ! 6: AND_R	and 	%r5, %r11, %r17
	.word 0xa2020009  ! 6: ADD_R	add 	%r8, %r9, %r17
	.word 0xb801c009  ! 6: ADD_R	add 	%r7, %r9, %r28
	.word 0xae00e175  ! 6: ADD_I	add 	%r3, 0x0175, %r23
	.word 0xbc116893  ! 6: OR_I	or 	%r5, 0x0893, %r30
	.word 0xbe09400e  ! 6: AND_R	and 	%r5, %r14, %r31
	.word 0xb201000e  ! 6: ADD_R	add 	%r4, %r14, %r25
	.word 0xa809800d  ! 6: AND_R	and 	%r6, %r13, %r20
	.word 0xb209400b  ! 6: AND_R	and 	%r5, %r11, %r25
	.word 0xb411c00c  ! 6: OR_R	or 	%r7, %r12, %r26
	.word 0xb209a657  ! 6: AND_I	and 	%r6, 0x0657, %r25
	.word 0xbc11800e  ! 6: OR_R	or 	%r6, %r14, %r30
	.word 0xe4212d30  ! 6: STW_I	stw	%r18, [%r4 + 0x0d30]
	.word 0xe8312012  ! 6: STH_I	sth	%r20, [%r4 + 0x0012]
	.word 0xfe712038  ! 6: STX_I	stx	%r31, [%r4 + 0x0038]
	.word 0xe471e838  ! 6: STX_I	stx	%r18, [%r7 + 0x0838]
	.word 0xea2924e5  ! 6: STB_I	stb	%r21, [%r4 + 0x04e5]
	.word 0xe82120a0  ! 7: STW_I	stw	%r20, [%r4 + 0x00a0]
	.word 0xae010045
	.word 0xe82966a2  ! 9: STB_I	stb	%r20, [%r5 + 0x06a2]
	.word 0xe62a2043  ! 10: STB_I	stb	%r19, [%r8 + 0x0043]
IC_ERR_1:
!$EV error(1,expr(@VA(.MAIN.IC_ERR_1), 16, 16),1,IC_DATA,IR,14,x)
	setx  0x0000000000000a80, %r16, %r14
	setx  0x00000000000020bc, %r16, %r2
	.word 0xb601800a  ! 12: ADD_R	add 	%r6, %r10, %r27
	.word 0xac08e2da  ! 12: AND_I	and 	%r3, 0x02da, %r22
	.word 0xb602000d  ! 12: ADD_R	add 	%r8, %r13, %r27
	bne thr1_loop_0
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_1:
	.word 0xb411e705  ! 20: OR_I	or 	%r7, 0x0705, %r26
	.word 0xa402208d  ! 20: ADD_I	add 	%r8, 0x008d, %r18
	.word 0xb609800b  ! 20: AND_R	and 	%r6, %r11, %r27
	.word 0xbe016b4c  ! 20: ADD_I	add 	%r5, 0x0b4c, %r31
	.word 0xb601c00a  ! 20: ADD_R	add 	%r7, %r10, %r27
	.word 0xb4016108  ! 20: ADD_I	add 	%r5, 0x0108, %r26
	.word 0xba11e2f7  ! 20: OR_I	or 	%r7, 0x02f7, %r29
	.word 0xb601000b  ! 20: ADD_R	add 	%r4, %r11, %r27
	.word 0xb20228fe  ! 20: ADD_I	add 	%r8, 0x08fe, %r25
	.word 0xb80a000e  ! 20: AND_R	and 	%r8, %r14, %r28
	.word 0xaa020009  ! 20: ADD_R	add 	%r8, %r9, %r21
	.word 0xa811000d  ! 20: OR_R	or 	%r4, %r13, %r20
	.word 0xac1122e6  ! 20: OR_I	or 	%r4, 0x02e6, %r22
	.word 0xbc11800d  ! 20: OR_R	or 	%r6, %r13, %r30
	.word 0xaa112ddf  ! 20: OR_I	or 	%r4, 0x0ddf, %r21
	.word 0xac10ef83  ! 20: OR_I	or 	%r3, 0x0f83, %r22
	.word 0xa20a29a9  ! 20: AND_I	and 	%r8, 0x09a9, %r17
	.word 0xae08e9a5  ! 20: AND_I	and 	%r3, 0x09a5, %r23
	.word 0xba0224c0  ! 20: ADD_I	add 	%r8, 0x04c0, %r29
	.word 0xac122f16  ! 20: OR_I	or 	%r8, 0x0f16, %r22
	.word 0xa809e14a  ! 20: AND_I	and 	%r7, 0x014a, %r20
	.word 0xbe0a000e  ! 20: AND_R	and 	%r8, %r14, %r31
	.word 0xba11e654  ! 20: OR_I	or 	%r7, 0x0654, %r29
	.word 0xb410c00e  ! 20: OR_R	or 	%r3, %r14, %r26
	.word 0xa2022b73  ! 20: ADD_I	add 	%r8, 0x0b73, %r17
	.word 0xa601800e  ! 20: ADD_R	add 	%r6, %r14, %r19
	.word 0xa601800e  ! 20: ADD_R	add 	%r6, %r14, %r19
	.word 0xbe096251  ! 20: AND_I	and 	%r5, 0x0251, %r31
	.word 0xa801edbb  ! 20: ADD_I	add 	%r7, 0x0dbb, %r20
	.word 0xb000e042  ! 20: ADD_I	add 	%r3, 0x0042, %r24
	.word 0xac01400a  ! 20: ADD_R	add 	%r5, %r10, %r22
	.word 0xb411ee40  ! 20: OR_I	or 	%r7, 0x0e40, %r26
	.word 0xaa01000f  ! 20: ADD_R	add 	%r4, %r15, %r21
	.word 0xa200e077  ! 20: ADD_I	add 	%r3, 0x0077, %r17
	.word 0xa201000c  ! 20: ADD_R	add 	%r4, %r12, %r17
	.word 0xac0a27cf  ! 20: AND_I	and 	%r8, 0x07cf, %r22
	.word 0xaa01e934  ! 20: ADD_I	add 	%r7, 0x0934, %r21
	.word 0xba0a000e  ! 20: AND_R	and 	%r8, %r14, %r29
	.word 0xb009800a  ! 20: AND_R	and 	%r6, %r10, %r24
	.word 0xbc112f13  ! 20: OR_I	or 	%r4, 0x0f13, %r30
	.word 0xac12294c  ! 20: OR_I	or 	%r8, 0x094c, %r22
	.word 0xbc022efd  ! 20: ADD_I	add 	%r8, 0x0efd, %r30
	.word 0xbe11c00f  ! 20: OR_R	or 	%r7, %r15, %r31
	.word 0xbe01800a  ! 20: ADD_R	add 	%r6, %r10, %r31
	.word 0xae09c00f  ! 20: AND_R	and 	%r7, %r15, %r23
	.word 0xaa11000d  ! 20: OR_R	or 	%r4, %r13, %r21
	.word 0xb800e9a4  ! 20: ADD_I	add 	%r3, 0x09a4, %r28
	.word 0xae01800a  ! 20: ADD_R	add 	%r6, %r10, %r23
	.word 0xb2120009  ! 20: OR_R	or 	%r8, %r9, %r25
	.word 0xb000c00e  ! 20: ADD_R	add 	%r3, %r14, %r24
	.word 0xbe12000c  ! 20: OR_R	or 	%r8, %r12, %r31
	.word 0xa20165b9  ! 20: ADD_I	add 	%r5, 0x05b9, %r17
	.word 0xba11261e  ! 20: OR_I	or 	%r4, 0x061e, %r29
	.word 0xae08c00e  ! 20: AND_R	and 	%r3, %r14, %r23
	.word 0xaa09edb5  ! 20: AND_I	and 	%r7, 0x0db5, %r21
	.word 0xb809e280  ! 20: AND_I	and 	%r7, 0x0280, %r28
	.word 0xb200ee65  ! 20: ADD_I	add 	%r3, 0x0e65, %r25
	.word 0xbc01c00a  ! 20: ADD_R	add 	%r7, %r10, %r30
	.word 0xae08c00b  ! 20: AND_R	and 	%r3, %r11, %r23
	.word 0xac09296e  ! 20: AND_I	and 	%r4, 0x096e, %r22
	.word 0xbc08c00c  ! 20: AND_R	and 	%r3, %r12, %r30
	.word 0xba1126ae  ! 20: OR_I	or 	%r4, 0x06ae, %r29
	.word 0xaa08e40b  ! 20: AND_I	and 	%r3, 0x040b, %r21
	.word 0xb601800d  ! 20: ADD_R	add 	%r6, %r13, %r27
	.word 0xb610c009  ! 20: OR_R	or 	%r3, %r9, %r27
	.word 0xa40169a4  ! 20: ADD_I	add 	%r5, 0x09a4, %r18
	.word 0xae00ea9a  ! 20: ADD_I	add 	%r3, 0x0a9a, %r23
	.word 0xa2096d22  ! 20: AND_I	and 	%r5, 0x0d22, %r17
	.word 0xb6096ff5  ! 20: AND_I	and 	%r5, 0x0ff5, %r27
	.word 0xa609400b  ! 20: AND_R	and 	%r5, %r11, %r19
	.word 0xb801c009  ! 20: ADD_R	add 	%r7, %r9, %r28
	.word 0xb6098009  ! 20: AND_R	and 	%r6, %r9, %r27
	.word 0xba09e036  ! 20: AND_I	and 	%r7, 0x0036, %r29
	.word 0xba11e75f  ! 20: OR_I	or 	%r7, 0x075f, %r29
	.word 0xac016265  ! 20: ADD_I	add 	%r5, 0x0265, %r22
	.word 0xa80a000a  ! 20: AND_R	and 	%r8, %r10, %r20
	.word 0xb41163c8  ! 20: OR_I	or 	%r5, 0x03c8, %r26
	.word 0xae116a00  ! 20: OR_I	or 	%r5, 0x0a00, %r23
	.word 0xae11c00b  ! 20: OR_R	or 	%r7, %r11, %r23
	.word 0xa809e6e7  ! 20: AND_I	and 	%r7, 0x06e7, %r20
	.word 0xa411000b  ! 20: OR_R	or 	%r4, %r11, %r18
	.word 0xb0122bf7  ! 20: OR_I	or 	%r8, 0x0bf7, %r24
	.word 0xb8022259  ! 20: ADD_I	add 	%r8, 0x0259, %r28
	.word 0xbc01800f  ! 20: ADD_R	add 	%r6, %r15, %r30
	.word 0xae122d47  ! 20: OR_I	or 	%r8, 0x0d47, %r23
	.word 0xb208e1eb  ! 20: AND_I	and 	%r3, 0x01eb, %r25
	.word 0xa209000b  ! 20: AND_R	and 	%r4, %r11, %r17
	.word 0xf829611f  ! 20: STB_I	stb	%r28, [%r5 + 0x011f]
	.word 0xec71ede8  ! 20: STX_I	stx	%r22, [%r7 + 0x0de8]
	.word 0xfa31a164  ! 20: STH_I	sth	%r29, [%r6 + 0x0164]
	.word 0xe471e6f0  ! 20: STX_I	stx	%r18, [%r7 + 0x06f0]
	.word 0xee716400  ! 20: STX_I	stx	%r23, [%r5 + 0x0400]
	.word 0xf6716fc8  ! 20: STX_I	stx	%r27, [%r5 + 0x0fc8]
	.word 0xe820e0c8  ! 20: STW_I	stw	%r20, [%r3 + 0x00c8]
DC_ERR_1:
!$EV error(1,expr(@VA(.MAIN.DC_ERR_1), 16, 16),2,DC_DATA,33)
	.word 0xf819a800  ! 23: LDD_I	ldd	[%r6 + 0x0800], %r28
	.word 0xb602000b  ! 23: ADD_R	add 	%r8, %r11, %r27
	.word 0xc0f00982  ! 25: STXA_R	stxa	%r0, [%r0 + %r2] 0x4c
IC_ERR_5:
!$EV error(1,expr(@VA(.MAIN.IC_ERR_5), 16, 16),1,IC_DATA,IR,12,x)
	.word 0xfa41000f  ! 27: LDSW_R	ldsw	[%r4 + %r15], %r29
	.word 0xa2016820  ! 27: ADD_I	add 	%r5, 0x0820, %r17
	.word 0xa4092bd8  ! 27: AND_I	and 	%r4, 0x0bd8, %r18
	.word 0xb8014009  ! 27: ADD_R	add 	%r5, %r9, %r28
	bne thr1_loop_1
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_2:
	.word 0xac112069  ! 33: OR_I	or 	%r4, 0x0069, %r22
	.word 0xb611e216  ! 33: OR_I	or 	%r7, 0x0216, %r27
	.word 0xb609c009  ! 33: AND_R	and 	%r7, %r9, %r27
	.word 0xb611af1a  ! 33: OR_I	or 	%r6, 0x0f1a, %r27
	.word 0xba09800d  ! 33: AND_R	and 	%r6, %r13, %r29
	.word 0xb601800e  ! 33: ADD_R	add 	%r6, %r14, %r27
	.word 0xa410e1b7  ! 33: OR_I	or 	%r3, 0x01b7, %r18
	.word 0xaa09a301  ! 33: AND_I	and 	%r6, 0x0301, %r21
	.word 0xac11c00b  ! 33: OR_R	or 	%r7, %r11, %r22
	.word 0xbe0a000b  ! 33: AND_R	and 	%r8, %r11, %r31
	.word 0xbe08e1f3  ! 33: AND_I	and 	%r3, 0x01f3, %r31
	.word 0xbc11000d  ! 33: OR_R	or 	%r4, %r13, %r30
	.word 0xb611e4a7  ! 33: OR_I	or 	%r7, 0x04a7, %r27
	.word 0xb401800e  ! 33: ADD_R	add 	%r6, %r14, %r26
	.word 0xb401800c  ! 33: ADD_R	add 	%r6, %r12, %r26
	.word 0xbe12209c  ! 33: OR_I	or 	%r8, 0x009c, %r31
	.word 0xb008ec6d  ! 33: AND_I	and 	%r3, 0x0c6d, %r24
	.word 0xa212000e  ! 33: OR_R	or 	%r8, %r14, %r17
	.word 0xa2016b50  ! 33: ADD_I	add 	%r5, 0x0b50, %r17
	.word 0xb009000d  ! 33: AND_R	and 	%r4, %r13, %r24
	.word 0xba08c00d  ! 33: AND_R	and 	%r3, %r13, %r29
	.word 0xae10e960  ! 33: OR_I	or 	%r3, 0x0960, %r23
	.word 0xaa09ad1d  ! 33: AND_I	and 	%r6, 0x0d1d, %r21
	.word 0xb202000f  ! 33: ADD_R	add 	%r8, %r15, %r25
	.word 0xa210c00e  ! 33: OR_R	or 	%r3, %r14, %r17
	.word 0xb2116fdb  ! 33: OR_I	or 	%r5, 0x0fdb, %r25
	.word 0xb009000a  ! 33: AND_R	and 	%r4, %r10, %r24
	.word 0xba09000d  ! 33: AND_R	and 	%r4, %r13, %r29
	.word 0xa401aacd  ! 33: ADD_I	add 	%r6, 0x0acd, %r18
	.word 0xbe11000e  ! 33: OR_R	or 	%r4, %r14, %r31
	.word 0xac09689a  ! 33: AND_I	and 	%r5, 0x089a, %r22
	.word 0xae09800b  ! 33: AND_R	and 	%r6, %r11, %r23
	.word 0xaa0223d8  ! 33: ADD_I	add 	%r8, 0x03d8, %r21
	.word 0xaa09ef35  ! 33: AND_I	and 	%r7, 0x0f35, %r21
	.word 0xb411e291  ! 33: OR_I	or 	%r7, 0x0291, %r26
	.word 0xbe09400d  ! 33: AND_R	and 	%r5, %r13, %r31
	.word 0xb410ed78  ! 33: OR_I	or 	%r3, 0x0d78, %r26
	.word 0xb209000a  ! 33: AND_R	and 	%r4, %r10, %r25
	.word 0xa6012275  ! 33: ADD_I	add 	%r4, 0x0275, %r19
	.word 0xb210c009  ! 33: OR_R	or 	%r3, %r9, %r25
	.word 0xbe10e6cb  ! 33: OR_I	or 	%r3, 0x06cb, %r31
	.word 0xb809e038  ! 33: AND_I	and 	%r7, 0x0038, %r28
	.word 0xbe12000f  ! 33: OR_R	or 	%r8, %r15, %r31
	.word 0xa611a687  ! 33: OR_I	or 	%r6, 0x0687, %r19
	.word 0xba09aa6f  ! 33: AND_I	and 	%r6, 0x0a6f, %r29
	.word 0xb009ad77  ! 33: AND_I	and 	%r6, 0x0d77, %r24
	.word 0xb40129f9  ! 33: ADD_I	add 	%r4, 0x09f9, %r26
	.word 0xbe08e650  ! 33: AND_I	and 	%r3, 0x0650, %r31
	.word 0xaa0a000b  ! 33: AND_R	and 	%r8, %r11, %r21
	.word 0xaa09623f  ! 33: AND_I	and 	%r5, 0x023f, %r21
	.word 0xae11247c  ! 33: OR_I	or 	%r4, 0x047c, %r23
	.word 0xb6116d44  ! 33: OR_I	or 	%r5, 0x0d44, %r27
	.word 0xb609e246  ! 33: AND_I	and 	%r7, 0x0246, %r27
	.word 0xae09800d  ! 33: AND_R	and 	%r6, %r13, %r23
	.word 0xbc09a38a  ! 33: AND_I	and 	%r6, 0x038a, %r30
	.word 0xac11800c  ! 33: OR_R	or 	%r6, %r12, %r22
	.word 0xbe0967af  ! 33: AND_I	and 	%r5, 0x07af, %r31
	.word 0xbc09000f  ! 33: AND_R	and 	%r4, %r15, %r30
	.word 0xbc01c00c  ! 33: ADD_R	add 	%r7, %r12, %r30
	.word 0xb009c00b  ! 33: AND_R	and 	%r7, %r11, %r24
	.word 0xaa00c00c  ! 33: ADD_R	add 	%r3, %r12, %r21
	.word 0xbc0122a3  ! 33: ADD_I	add 	%r4, 0x02a3, %r30
	.word 0xb80a2896  ! 33: AND_I	and 	%r8, 0x0896, %r28
	.word 0xae01800b  ! 33: ADD_R	add 	%r6, %r11, %r23
	.word 0xa801298b  ! 33: ADD_I	add 	%r4, 0x098b, %r20
	.word 0xba09ecc1  ! 33: AND_I	and 	%r7, 0x0cc1, %r29
	.word 0xa60a000a  ! 33: AND_R	and 	%r8, %r10, %r19
	.word 0xa601000e  ! 33: ADD_R	add 	%r4, %r14, %r19
	.word 0xb0116a5f  ! 33: OR_I	or 	%r5, 0x0a5f, %r24
	.word 0xac00eda0  ! 33: ADD_I	add 	%r3, 0x0da0, %r22
	.word 0xb408c00e  ! 33: AND_R	and 	%r3, %r14, %r26
	.word 0xbe1128e3  ! 33: OR_I	or 	%r4, 0x08e3, %r31
	.word 0xbe00c00b  ! 33: ADD_R	add 	%r3, %r11, %r31
	.word 0xbe016e06  ! 33: ADD_I	add 	%r5, 0x0e06, %r31
	.word 0xa411400c  ! 33: OR_R	or 	%r5, %r12, %r18
	.word 0xae016aa2  ! 33: ADD_I	add 	%r5, 0x0aa2, %r23
	.word 0xb409400b  ! 33: AND_R	and 	%r5, %r11, %r26
	.word 0xa809800f  ! 33: AND_R	and 	%r6, %r15, %r20
	.word 0xaa0a2eba  ! 33: AND_I	and 	%r8, 0x0eba, %r21
	.word 0xac08c00e  ! 33: AND_R	and 	%r3, %r14, %r22
	.word 0xac11c00a  ! 33: OR_R	or 	%r7, %r10, %r22
	.word 0xa4096652  ! 33: AND_I	and 	%r5, 0x0652, %r18
	.word 0xa208e61d  ! 33: AND_I	and 	%r3, 0x061d, %r17
	.word 0xba122dac  ! 33: OR_I	or 	%r8, 0x0dac, %r29
	.word 0xbe10e53c  ! 33: OR_I	or 	%r3, 0x053c, %r31
	.word 0xba09800b  ! 33: AND_R	and 	%r6, %r11, %r29
	.word 0xb802000d  ! 33: ADD_R	add 	%r8, %r13, %r28
	.word 0xb609a863  ! 33: AND_I	and 	%r6, 0x0863, %r27
	.word 0xa210e59f  ! 33: OR_I	or 	%r3, 0x059f, %r17
	.word 0xbe112e97  ! 33: OR_I	or 	%r4, 0x0e97, %r31
	.word 0xbc11a361  ! 33: OR_I	or 	%r6, 0x0361, %r30
	.word 0xb409a69a  ! 33: AND_I	and 	%r6, 0x069a, %r26
	.word 0xa202000c  ! 33: ADD_R	add 	%r8, %r12, %r17
	.word 0xa2092d33  ! 33: AND_I	and 	%r4, 0x0d33, %r17
	.word 0xb009800b  ! 33: AND_R	and 	%r6, %r11, %r24
	.word 0xa80a2d44  ! 33: AND_I	and 	%r8, 0x0d44, %r20
	.word 0xbc08e161  ! 33: AND_I	and 	%r3, 0x0161, %r30
	.word 0xa609e5da  ! 33: AND_I	and 	%r7, 0x05da, %r19
	.word 0xa608e814  ! 33: AND_I	and 	%r3, 0x0814, %r19
	.word 0xb201400a  ! 33: ADD_R	add 	%r5, %r10, %r25
	.word 0xa801800d  ! 33: ADD_R	add 	%r6, %r13, %r20
	.word 0xae096a41  ! 33: AND_I	and 	%r5, 0x0a41, %r23
	.word 0xb201000d  ! 33: ADD_R	add 	%r4, %r13, %r25
	.word 0xaa01400a  ! 33: ADD_R	add 	%r5, %r10, %r21
	.word 0xb601ee08  ! 33: ADD_I	add 	%r7, 0x0e08, %r27
	.word 0xb208c00f  ! 33: AND_R	and 	%r3, %r15, %r25
	.word 0xa809000f  ! 33: AND_R	and 	%r4, %r15, %r20
	.word 0xa40a0009  ! 33: AND_R	and 	%r8, %r9, %r18
	.word 0xa40129cd  ! 33: ADD_I	add 	%r4, 0x09cd, %r18
	.word 0xac118009  ! 33: OR_R	or 	%r6, %r9, %r22
	.word 0xb802000b  ! 33: ADD_R	add 	%r8, %r11, %r28
	.word 0xb401e194  ! 33: ADD_I	add 	%r7, 0x0194, %r26
	.word 0xa411400a  ! 33: OR_R	or 	%r5, %r10, %r18
	.word 0xb410c00f  ! 33: OR_R	or 	%r3, %r15, %r26
	.word 0xa602000c  ! 33: ADD_R	add 	%r8, %r12, %r19
	.word 0xa61227ea  ! 33: OR_I	or 	%r8, 0x07ea, %r19
	.word 0xac10c00d  ! 33: OR_R	or 	%r3, %r13, %r22
	.word 0xa612273d  ! 33: OR_I	or 	%r8, 0x073d, %r19
	.word 0xbe118009  ! 33: OR_R	or 	%r6, %r9, %r31
	.word 0xb2112803  ! 33: OR_I	or 	%r4, 0x0803, %r25
	.word 0xa610c00b  ! 33: OR_R	or 	%r3, %r11, %r19
	.word 0xbc10e30a  ! 33: OR_I	or 	%r3, 0x030a, %r30
	.word 0xb800ee45  ! 33: ADD_I	add 	%r3, 0x0e45, %r28
	.word 0xae00c00f  ! 33: ADD_R	add 	%r3, %r15, %r23
	.word 0xb601800c  ! 33: ADD_R	add 	%r6, %r12, %r27
	.word 0xa8092d95  ! 33: AND_I	and 	%r4, 0x0d95, %r20
	.word 0xb4112bc1  ! 33: OR_I	or 	%r4, 0x0bc1, %r26
	.word 0xa808e67d  ! 33: AND_I	and 	%r3, 0x067d, %r20
	.word 0xb009800f  ! 33: AND_R	and 	%r6, %r15, %r24
	.word 0xb209400c  ! 33: AND_R	and 	%r5, %r12, %r25
	.word 0xb01223ea  ! 33: OR_I	or 	%r8, 0x03ea, %r24
	.word 0xa410ea6d  ! 33: OR_I	or 	%r3, 0x0a6d, %r18
	.word 0xb200c00e  ! 33: ADD_R	add 	%r3, %r14, %r25
	.word 0xa20a000f  ! 33: AND_R	and 	%r8, %r15, %r17
	.word 0xba11a54a  ! 33: OR_I	or 	%r6, 0x054a, %r29
	.word 0xa600c00e  ! 33: ADD_R	add 	%r3, %r14, %r19
	.word 0xba09e369  ! 33: AND_I	and 	%r7, 0x0369, %r29
	.word 0xae11c00a  ! 33: OR_R	or 	%r7, %r10, %r23
	.word 0xa612291c  ! 33: OR_I	or 	%r8, 0x091c, %r19
	.word 0xaa01275a  ! 33: ADD_I	add 	%r4, 0x075a, %r21
	.word 0xb408ea22  ! 33: AND_I	and 	%r3, 0x0a22, %r26
	.word 0xba01ab2d  ! 33: ADD_I	add 	%r6, 0x0b2d, %r29
	.word 0xb801c009  ! 33: ADD_R	add 	%r7, %r9, %r28
	.word 0xa20a000f  ! 33: AND_R	and 	%r8, %r15, %r17
	.word 0xaa0a2fc8  ! 33: AND_I	and 	%r8, 0x0fc8, %r21
	.word 0xac11400f  ! 33: OR_R	or 	%r5, %r15, %r22
	.word 0xae09c00a  ! 33: AND_R	and 	%r7, %r10, %r23
	.word 0xbe016d02  ! 33: ADD_I	add 	%r5, 0x0d02, %r31
	.word 0xbe01000b  ! 33: ADD_R	add 	%r4, %r11, %r31
	.word 0xbc09c00f  ! 33: AND_R	and 	%r7, %r15, %r30
	.word 0xb211c00a  ! 33: OR_R	or 	%r7, %r10, %r25
	.word 0xb008c009  ! 33: AND_R	and 	%r3, %r9, %r24
	.word 0xb601a167  ! 33: ADD_I	add 	%r6, 0x0167, %r27
	.word 0xb001c00f  ! 33: ADD_R	add 	%r7, %r15, %r24
	.word 0xa609c00c  ! 33: AND_R	and 	%r7, %r12, %r19
	.word 0xb2012fec  ! 33: ADD_I	add 	%r4, 0x0fec, %r25
	.word 0xac12000c  ! 33: OR_R	or 	%r8, %r12, %r22
	.word 0xba014009  ! 33: ADD_R	add 	%r5, %r9, %r29
	.word 0xb6116cb3  ! 33: OR_I	or 	%r5, 0x0cb3, %r27
	.word 0xac0a000b  ! 33: AND_R	and 	%r8, %r11, %r22
	.word 0xba01000d  ! 33: ADD_R	add 	%r4, %r13, %r29
	.word 0xbc08c00a  ! 33: AND_R	and 	%r3, %r10, %r30
	.word 0xb4012eb2  ! 33: ADD_I	add 	%r4, 0x0eb2, %r26
	.word 0xa20a000c  ! 33: AND_R	and 	%r8, %r12, %r17
	.word 0xb60a000d  ! 33: AND_R	and 	%r8, %r13, %r27
	.word 0xb208e842  ! 33: AND_I	and 	%r3, 0x0842, %r25
	.word 0xa211c00f  ! 33: OR_R	or 	%r7, %r15, %r17
	.word 0xa2016e09  ! 33: ADD_I	add 	%r5, 0x0e09, %r17
	.word 0xb211800c  ! 33: OR_R	or 	%r6, %r12, %r25
	.word 0xaa0a000f  ! 33: AND_R	and 	%r8, %r15, %r21
	.word 0xa801c00e  ! 33: ADD_R	add 	%r7, %r14, %r20
	.word 0xa209aab2  ! 33: AND_I	and 	%r6, 0x0ab2, %r17
	.word 0xb0018009  ! 33: ADD_R	add 	%r6, %r9, %r24
	.word 0xa600e902  ! 33: ADD_I	add 	%r3, 0x0902, %r19
	.word 0xac11800f  ! 33: OR_R	or 	%r6, %r15, %r22
	.word 0xa809ad55  ! 33: AND_I	and 	%r6, 0x0d55, %r20
	.word 0xae022fc0  ! 33: ADD_I	add 	%r8, 0x0fc0, %r23
	.word 0xb809ed9d  ! 33: AND_I	and 	%r7, 0x0d9d, %r28
	.word 0xb001400e  ! 33: ADD_R	add 	%r5, %r14, %r24
	.word 0xa401c00c  ! 33: ADD_R	add 	%r7, %r12, %r18
	.word 0xb801c009  ! 33: ADD_R	add 	%r7, %r9, %r28
	.word 0xa211256a  ! 33: OR_I	or 	%r4, 0x056a, %r17
	.word 0xb801a5e5  ! 33: ADD_I	add 	%r6, 0x05e5, %r28
	.word 0xb811c00a  ! 33: OR_R	or 	%r7, %r10, %r28
	.word 0xa809eb12  ! 33: AND_I	and 	%r7, 0x0b12, %r20
	.word 0xaa11ad7b  ! 33: OR_I	or 	%r6, 0x0d7b, %r21
	.word 0xb810e72e  ! 33: OR_I	or 	%r3, 0x072e, %r28
	.word 0xae12000a  ! 33: OR_R	or 	%r8, %r10, %r23
	.word 0xa209e0d2  ! 33: AND_I	and 	%r7, 0x00d2, %r17
	.word 0xb209400c  ! 33: AND_R	and 	%r5, %r12, %r25
	.word 0xaa01000d  ! 33: ADD_R	add 	%r4, %r13, %r21
	.word 0xaa09a13e  ! 33: AND_I	and 	%r6, 0x013e, %r21
	.word 0xbc00e563  ! 33: ADD_I	add 	%r3, 0x0563, %r30
	.word 0xb409e78d  ! 33: AND_I	and 	%r7, 0x078d, %r26
	.word 0xb001218f  ! 33: ADD_I	add 	%r4, 0x018f, %r24
	.word 0xac11400a  ! 33: OR_R	or 	%r5, %r10, %r22
	.word 0xaa012eb0  ! 33: ADD_I	add 	%r4, 0x0eb0, %r21
	.word 0xa209e7cf  ! 33: AND_I	and 	%r7, 0x07cf, %r17
	.word 0xac09c009  ! 33: AND_R	and 	%r7, %r9, %r22
	.word 0xa811000b  ! 33: OR_R	or 	%r4, %r11, %r20
	.word 0xa200ee0b  ! 33: ADD_I	add 	%r3, 0x0e0b, %r17
	.word 0xb811c009  ! 33: OR_R	or 	%r7, %r9, %r28
	.word 0xbc1168db  ! 33: OR_I	or 	%r5, 0x08db, %r30
	.word 0xa412000b  ! 33: OR_R	or 	%r8, %r11, %r18
	.word 0xaa11c00f  ! 33: OR_R	or 	%r7, %r15, %r21
	.word 0xa4012725  ! 33: ADD_I	add 	%r4, 0x0725, %r18
	.word 0xa209a924  ! 33: AND_I	and 	%r6, 0x0924, %r17
	.word 0xb202000d  ! 33: ADD_R	add 	%r8, %r13, %r25
	.word 0xaa09e0fe  ! 33: AND_I	and 	%r7, 0x00fe, %r21
	.word 0xa210e483  ! 33: OR_I	or 	%r3, 0x0483, %r17
	.word 0xbe00e443  ! 33: ADD_I	add 	%r3, 0x0443, %r31
	.word 0xbe01e477  ! 33: ADD_I	add 	%r7, 0x0477, %r31
	.word 0xa601c00f  ! 33: ADD_R	add 	%r7, %r15, %r19
	.word 0xbe11000f  ! 33: OR_R	or 	%r4, %r15, %r31
	.word 0xa211800e  ! 33: OR_R	or 	%r6, %r14, %r17
	.word 0xea216db4  ! 33: STW_I	stw	%r21, [%r5 + 0x0db4]
	.word 0xf4716bf8  ! 33: STX_I	stx	%r26, [%r5 + 0x0bf8]
	.word 0xe471aa68  ! 33: STX_I	stx	%r18, [%r6 + 0x0a68]
	.word 0xea296476  ! 33: STB_I	stb	%r21, [%r5 + 0x0476]
	.word 0xe229a56b  ! 33: STB_I	stb	%r17, [%r6 + 0x056b]
	.word 0xe429aed6  ! 35: STB_I	stb	%r18, [%r6 + 0x0ed6]
	.word 0xa531a001  ! 36: SRL_I	srl 	%r6, 0x0001, %r18
	.word 0xe47161b8  ! 37: STX_I	stx	%r18, [%r5 + 0x01b8]
IC_ERR_9:
!$EV error(1,expr(@VA(.MAIN.IC_ERR_9), 16, 16),2,IC_DATA,IR,22,x)
	.word 0xe631a7a8  ! 39: STH_I	sth	%r19, [%r6 + 0x07a8]
	.word 0xfa5125f0  ! 40: LDSH_I	ldsh	[%r4 + 0x05f0], %r29
	.word 0xb00a0009  ! 40: AND_R	and 	%r8, %r9, %r24
	.word 0xa201000e  ! 40: ADD_R	add 	%r4, %r14, %r17
	.word 0xa40228f5  ! 40: ADD_I	add 	%r8, 0x08f5, %r18
	bne thr1_loop_2
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_3:
	.word 0xbc09000b  ! 46: AND_R	and 	%r4, %r11, %r30
	.word 0xbe02000f  ! 46: ADD_R	add 	%r8, %r15, %r31
	.word 0xaa096e8c  ! 46: AND_I	and 	%r5, 0x0e8c, %r21
	.word 0xba00ee09  ! 46: ADD_I	add 	%r3, 0x0e09, %r29
	.word 0xae11a194  ! 46: OR_I	or 	%r6, 0x0194, %r23
	.word 0xa608e397  ! 46: AND_I	and 	%r3, 0x0397, %r19
	.word 0xb612000e  ! 46: OR_R	or 	%r8, %r14, %r27
	.word 0xae09e02d  ! 46: AND_I	and 	%r7, 0x002d, %r23
	.word 0xba016439  ! 46: ADD_I	add 	%r5, 0x0439, %r29
	.word 0xa401ed29  ! 46: ADD_I	add 	%r7, 0x0d29, %r18
	.word 0xae114009  ! 46: OR_R	or 	%r5, %r9, %r23
	.word 0xa609e43d  ! 46: AND_I	and 	%r7, 0x043d, %r19
	.word 0xba0a000c  ! 46: AND_R	and 	%r8, %r12, %r29
	.word 0xa612000a  ! 46: OR_R	or 	%r8, %r10, %r19
	.word 0xae01800d  ! 46: ADD_R	add 	%r6, %r13, %r23
	.word 0xb601ea42  ! 46: ADD_I	add 	%r7, 0x0a42, %r27
	.word 0xa208ebfb  ! 46: AND_I	and 	%r3, 0x0bfb, %r17
	.word 0xb209c00f  ! 46: AND_R	and 	%r7, %r15, %r25
	.word 0xb0096839  ! 46: AND_I	and 	%r5, 0x0839, %r24
	.word 0xae09800b  ! 46: AND_R	and 	%r6, %r11, %r23
	.word 0xb2112cd4  ! 46: OR_I	or 	%r4, 0x0cd4, %r25
	.word 0xb001400e  ! 46: ADD_R	add 	%r5, %r14, %r24
	.word 0xb201226e  ! 46: ADD_I	add 	%r4, 0x026e, %r25
	.word 0xbe012e74  ! 46: ADD_I	add 	%r4, 0x0e74, %r31
	.word 0xac10c00d  ! 46: OR_R	or 	%r3, %r13, %r22
	.word 0xae11800d  ! 46: OR_R	or 	%r6, %r13, %r23
	.word 0xa8120009  ! 46: OR_R	or 	%r8, %r9, %r20
	.word 0xa401c00f  ! 46: ADD_R	add 	%r7, %r15, %r18
	.word 0xa409e366  ! 46: AND_I	and 	%r7, 0x0366, %r18
	.word 0xa202000d  ! 46: ADD_R	add 	%r8, %r13, %r17
	.word 0xa200e6fa  ! 46: ADD_I	add 	%r3, 0x06fa, %r17
	.word 0xae122a95  ! 46: OR_I	or 	%r8, 0x0a95, %r23
	.word 0xb011400f  ! 46: OR_R	or 	%r5, %r15, %r24
	.word 0xac01000e  ! 46: ADD_R	add 	%r4, %r14, %r22
	.word 0xb410e941  ! 46: OR_I	or 	%r3, 0x0941, %r26
	.word 0xb410c00c  ! 46: OR_R	or 	%r3, %r12, %r26
	.word 0xb009800a  ! 46: AND_R	and 	%r6, %r10, %r24
	.word 0xb201000b  ! 46: ADD_R	add 	%r4, %r11, %r25
	.word 0xa6112da2  ! 46: OR_I	or 	%r4, 0x0da2, %r19
	.word 0xb611638b  ! 46: OR_I	or 	%r5, 0x038b, %r27
	.word 0xa402217a  ! 46: ADD_I	add 	%r8, 0x017a, %r18
	.word 0xae00e0c3  ! 46: ADD_I	add 	%r3, 0x00c3, %r23
	.word 0xaa0a000d  ! 46: AND_R	and 	%r8, %r13, %r21
	.word 0xbe11000e  ! 46: OR_R	or 	%r4, %r14, %r31
	.word 0xb8096421  ! 46: AND_I	and 	%r5, 0x0421, %r28
	.word 0xb80a2549  ! 46: AND_I	and 	%r8, 0x0549, %r28
	.word 0xa809000e  ! 46: AND_R	and 	%r4, %r14, %r20
	.word 0xa412000b  ! 46: OR_R	or 	%r8, %r11, %r18
	.word 0xb209c00b  ! 46: AND_R	and 	%r7, %r11, %r25
	.word 0xa411c00e  ! 46: OR_R	or 	%r7, %r14, %r18
	.word 0xa401aa38  ! 46: ADD_I	add 	%r6, 0x0a38, %r18
	.word 0xb401eb66  ! 46: ADD_I	add 	%r7, 0x0b66, %r26
	.word 0xbc112c00  ! 46: OR_I	or 	%r4, 0x0c00, %r30
	.word 0xb4012466  ! 46: ADD_I	add 	%r4, 0x0466, %r26
	.word 0xa20a2081  ! 46: AND_I	and 	%r8, 0x0081, %r17
	.word 0xb400e8fc  ! 46: ADD_I	add 	%r3, 0x08fc, %r26
	.word 0xb411400a  ! 46: OR_R	or 	%r5, %r10, %r26
	.word 0xa408e493  ! 46: AND_I	and 	%r3, 0x0493, %r18
	.word 0xb611000c  ! 46: OR_R	or 	%r4, %r12, %r27
	.word 0xa200c00a  ! 46: ADD_R	add 	%r3, %r10, %r17
	.word 0xa411c00f  ! 46: OR_R	or 	%r7, %r15, %r18
	.word 0xae11000d  ! 46: OR_R	or 	%r4, %r13, %r23
	.word 0xa801a3ef  ! 46: ADD_I	add 	%r6, 0x03ef, %r20
	.word 0xa411adad  ! 46: OR_I	or 	%r6, 0x0dad, %r18
	.word 0xa2016be1  ! 46: ADD_I	add 	%r5, 0x0be1, %r17
	.word 0xb800e6b8  ! 46: ADD_I	add 	%r3, 0x06b8, %r28
	.word 0xa811e287  ! 46: OR_I	or 	%r7, 0x0287, %r20
	.word 0xb400c00d  ! 46: ADD_R	add 	%r3, %r13, %r26
	.word 0xa6120009  ! 46: OR_R	or 	%r8, %r9, %r19
	.word 0xa4110009  ! 46: OR_R	or 	%r4, %r9, %r18
	.word 0xae01a5b1  ! 46: ADD_I	add 	%r6, 0x05b1, %r23
	.word 0xb209800a  ! 46: AND_R	and 	%r6, %r10, %r25
	.word 0xba116f92  ! 46: OR_I	or 	%r5, 0x0f92, %r29
	.word 0xb000eb66  ! 46: ADD_I	add 	%r3, 0x0b66, %r24
	.word 0xb4014009  ! 46: ADD_R	add 	%r5, %r9, %r26
	.word 0xae09400d  ! 46: AND_R	and 	%r5, %r13, %r23
	.word 0xa2116dbd  ! 46: OR_I	or 	%r5, 0x0dbd, %r17
	.word 0xa211400c  ! 46: OR_R	or 	%r5, %r12, %r17
	.word 0xa8116092  ! 46: OR_I	or 	%r5, 0x0092, %r20
	.word 0xa409aa5a  ! 46: AND_I	and 	%r6, 0x0a5a, %r18
	.word 0xb011400e  ! 46: OR_R	or 	%r5, %r14, %r24
	.word 0xb200ece6  ! 46: ADD_I	add 	%r3, 0x0ce6, %r25
	.word 0xac122b20  ! 46: OR_I	or 	%r8, 0x0b20, %r22
	.word 0xa209400d  ! 46: AND_R	and 	%r5, %r13, %r17
	.word 0xa20a000e  ! 46: AND_R	and 	%r8, %r14, %r17
	.word 0xb6096bb3  ! 46: AND_I	and 	%r5, 0x0bb3, %r27
	.word 0xaa09000a  ! 46: AND_R	and 	%r4, %r10, %r21
	.word 0xb211275a  ! 46: OR_I	or 	%r4, 0x075a, %r25
	.word 0xa408eac8  ! 46: AND_I	and 	%r3, 0x0ac8, %r18
	.word 0xa200eed8  ! 46: ADD_I	add 	%r3, 0x0ed8, %r17
	.word 0xae012a94  ! 46: ADD_I	add 	%r4, 0x0a94, %r23
	.word 0xbe11400e  ! 46: OR_R	or 	%r5, %r14, %r31
	.word 0xa402000d  ! 46: ADD_R	add 	%r8, %r13, %r18
	.word 0xb001e891  ! 46: ADD_I	add 	%r7, 0x0891, %r24
	.word 0xb601ad69  ! 46: ADD_I	add 	%r6, 0x0d69, %r27
	.word 0xb600c00e  ! 46: ADD_R	add 	%r3, %r14, %r27
	.word 0xb4016c3b  ! 46: ADD_I	add 	%r5, 0x0c3b, %r26
	.word 0xae01000b  ! 46: ADD_R	add 	%r4, %r11, %r23
	.word 0xb600ee76  ! 46: ADD_I	add 	%r3, 0x0e76, %r27
	.word 0xbc114009  ! 46: OR_R	or 	%r5, %r9, %r30
	.word 0xa202000e  ! 46: ADD_R	add 	%r8, %r14, %r17
	.word 0xb609000f  ! 46: AND_R	and 	%r4, %r15, %r27
	.word 0xa612000a  ! 46: OR_R	or 	%r8, %r10, %r19
	.word 0xb809800c  ! 46: AND_R	and 	%r6, %r12, %r28
	.word 0xb609800a  ! 46: AND_R	and 	%r6, %r10, %r27
	.word 0xb4018009  ! 46: ADD_R	add 	%r6, %r9, %r26
	.word 0xae11400a  ! 46: OR_R	or 	%r5, %r10, %r23
	.word 0xbc122409  ! 46: OR_I	or 	%r8, 0x0409, %r30
	.word 0xa801c00d  ! 46: ADD_R	add 	%r7, %r13, %r20
	.word 0xbe016926  ! 46: ADD_I	add 	%r5, 0x0926, %r31
	.word 0xbc02000a  ! 46: ADD_R	add 	%r8, %r10, %r30
	.word 0xb201800f  ! 46: ADD_R	add 	%r6, %r15, %r25
	.word 0xa411a6d7  ! 46: OR_I	or 	%r6, 0x06d7, %r18
	.word 0xb6112f6f  ! 46: OR_I	or 	%r4, 0x0f6f, %r27
	.word 0xb410c00c  ! 46: OR_R	or 	%r3, %r12, %r26
	.word 0xae00e46b  ! 46: ADD_I	add 	%r3, 0x046b, %r23
	.word 0xb612000d  ! 46: OR_R	or 	%r8, %r13, %r27
	.word 0xa610c00b  ! 46: OR_R	or 	%r3, %r11, %r19
	.word 0xb409c00c  ! 46: AND_R	and 	%r7, %r12, %r26
	.word 0xaa11400e  ! 46: OR_R	or 	%r5, %r14, %r21
	.word 0xb011ae9d  ! 46: OR_I	or 	%r6, 0x0e9d, %r24
	.word 0xb808c00a  ! 46: AND_R	and 	%r3, %r10, %r28
	.word 0xa6096446  ! 46: AND_I	and 	%r5, 0x0446, %r19
	.word 0xb408e370  ! 46: AND_I	and 	%r3, 0x0370, %r26
	.word 0xb000c00a  ! 46: ADD_R	add 	%r3, %r10, %r24
	.word 0xae016d5d  ! 46: ADD_I	add 	%r5, 0x0d5d, %r23
	.word 0xb610eab3  ! 46: OR_I	or 	%r3, 0x0ab3, %r27
	.word 0xb201000a  ! 46: ADD_R	add 	%r4, %r10, %r25
	.word 0xbc00c00b  ! 46: ADD_R	add 	%r3, %r11, %r30
	.word 0xb009c00a  ! 46: AND_R	and 	%r7, %r10, %r24
	.word 0xb0114009  ! 46: OR_R	or 	%r5, %r9, %r24
	.word 0xb001400c  ! 46: ADD_R	add 	%r5, %r12, %r24
	.word 0xa809af7a  ! 46: AND_I	and 	%r6, 0x0f7a, %r20
	.word 0xba02000a  ! 46: ADD_R	add 	%r8, %r10, %r29
	.word 0xb410c00f  ! 46: OR_R	or 	%r3, %r15, %r26
	.word 0xa20123f4  ! 46: ADD_I	add 	%r4, 0x03f4, %r17
	.word 0xaa01c00f  ! 46: ADD_R	add 	%r7, %r15, %r21
	.word 0xa800e528  ! 46: ADD_I	add 	%r3, 0x0528, %r20
	.word 0xa400eac9  ! 46: ADD_I	add 	%r3, 0x0ac9, %r18
	.word 0xb401800e  ! 46: ADD_R	add 	%r6, %r14, %r26
	.word 0xae01afd0  ! 46: ADD_I	add 	%r6, 0x0fd0, %r23
	.word 0xaa09a841  ! 46: AND_I	and 	%r6, 0x0841, %r21
	.word 0xa201000f  ! 46: ADD_R	add 	%r4, %r15, %r17
	.word 0xb410eb88  ! 46: OR_I	or 	%r3, 0x0b88, %r26
	.word 0xba014009  ! 46: ADD_R	add 	%r5, %r9, %r29
	.word 0xb008ecff  ! 46: AND_I	and 	%r3, 0x0cff, %r24
	.word 0xb401400f  ! 46: ADD_R	add 	%r5, %r15, %r26
	.word 0xaa10ef4f  ! 46: OR_I	or 	%r3, 0x0f4f, %r21
	.word 0xa6016a64  ! 46: ADD_I	add 	%r5, 0x0a64, %r19
	.word 0xbe10efd8  ! 46: OR_I	or 	%r3, 0x0fd8, %r31
	.word 0xaa022bc7  ! 46: ADD_I	add 	%r8, 0x0bc7, %r21
	.word 0xae01000c  ! 46: ADD_R	add 	%r4, %r12, %r23
	.word 0xb0090009  ! 46: AND_R	and 	%r4, %r9, %r24
	.word 0xaa00ee4a  ! 46: ADD_I	add 	%r3, 0x0e4a, %r21
	.word 0xa6092b49  ! 46: AND_I	and 	%r4, 0x0b49, %r19
	.word 0xbe10eb6c  ! 46: OR_I	or 	%r3, 0x0b6c, %r31
	.word 0xa411ea62  ! 46: OR_I	or 	%r7, 0x0a62, %r18
	.word 0xa211e289  ! 46: OR_I	or 	%r7, 0x0289, %r17
	.word 0xba09c00e  ! 46: AND_R	and 	%r7, %r14, %r29
	.word 0xb609800f  ! 46: AND_R	and 	%r6, %r15, %r27
	.word 0xb60a2cd2  ! 46: AND_I	and 	%r8, 0x0cd2, %r27
	.word 0xb6020009  ! 46: ADD_R	add 	%r8, %r9, %r27
	.word 0xbc11400e  ! 46: OR_R	or 	%r5, %r14, %r30
	.word 0xb408e514  ! 46: AND_I	and 	%r3, 0x0514, %r26
	.word 0xbc122289  ! 46: OR_I	or 	%r8, 0x0289, %r30
	.word 0xb802000f  ! 46: ADD_R	add 	%r8, %r15, %r28
	.word 0xa6022f3c  ! 46: ADD_I	add 	%r8, 0x0f3c, %r19
	.word 0xbc122556  ! 46: OR_I	or 	%r8, 0x0556, %r30
	.word 0xa80a000b  ! 46: AND_R	and 	%r8, %r11, %r20
	.word 0xb201c00c  ! 46: ADD_R	add 	%r7, %r12, %r25
	.word 0xa409800a  ! 46: AND_R	and 	%r6, %r10, %r18
	.word 0xa211800b  ! 46: OR_R	or 	%r6, %r11, %r17
	.word 0xb608c00f  ! 46: AND_R	and 	%r3, %r15, %r27
	.word 0xbe09c00a  ! 46: AND_R	and 	%r7, %r10, %r31
	.word 0xbc11ea38  ! 46: OR_I	or 	%r7, 0x0a38, %r30
	.word 0xa401000f  ! 46: ADD_R	add 	%r4, %r15, %r18
	.word 0xac01c00d  ! 46: ADD_R	add 	%r7, %r13, %r22
	.word 0xbe11a52c  ! 46: OR_I	or 	%r6, 0x052c, %r31
	.word 0xa40a227c  ! 46: AND_I	and 	%r8, 0x027c, %r18
	.word 0xa609400c  ! 46: AND_R	and 	%r5, %r12, %r19
	.word 0xba010009  ! 46: ADD_R	add 	%r4, %r9, %r29
	.word 0xb608e7b8  ! 46: AND_I	and 	%r3, 0x07b8, %r27
	.word 0xa408c00f  ! 46: AND_R	and 	%r3, %r15, %r18
	.word 0xb2022690  ! 46: ADD_I	add 	%r8, 0x0690, %r25
	.word 0xa4092e64  ! 46: AND_I	and 	%r4, 0x0e64, %r18
	.word 0xa209630b  ! 46: AND_I	and 	%r5, 0x030b, %r17
	.word 0xba116008  ! 46: OR_I	or 	%r5, 0x0008, %r29
	.word 0xba01400d  ! 46: ADD_R	add 	%r5, %r13, %r29
	.word 0xbe11400a  ! 46: OR_R	or 	%r5, %r10, %r31
	.word 0xb0022bd2  ! 46: ADD_I	add 	%r8, 0x0bd2, %r24
	.word 0xae01c00d  ! 46: ADD_R	add 	%r7, %r13, %r23
	.word 0xa2092f02  ! 46: AND_I	and 	%r4, 0x0f02, %r17
	.word 0xb810c00b  ! 46: OR_R	or 	%r3, %r11, %r28
	.word 0xb210c00d  ! 46: OR_R	or 	%r3, %r13, %r25
	.word 0xaa122d76  ! 46: OR_I	or 	%r8, 0x0d76, %r21
	.word 0xb809e51c  ! 46: AND_I	and 	%r7, 0x051c, %r28
	.word 0xb61124d3  ! 46: OR_I	or 	%r4, 0x04d3, %r27
	.word 0xb4116d81  ! 46: OR_I	or 	%r5, 0x0d81, %r26
	.word 0xa409000e  ! 46: AND_R	and 	%r4, %r14, %r18
	.word 0xee29a11d  ! 46: STB_I	stb	%r23, [%r6 + 0x011d]
	.word 0xf031e8f0  ! 46: STH_I	sth	%r24, [%r7 + 0x08f0]
	.word 0xf2712bd0  ! 46: STX_I	stx	%r25, [%r4 + 0x0bd0]
	.word 0xe831a222  ! 46: STH_I	sth	%r20, [%r6 + 0x0222]
	.word 0xf2712168  ! 46: STX_I	stx	%r25, [%r4 + 0x0168]
	.word 0xfe2a2b60  ! 47: STB_I	stb	%r31, [%r8 + 0x0b60]
	.word 0xae010045
	.word 0xe621a150  ! 49: STW_I	stw	%r19, [%r6 + 0x0150]
	.word 0xee31e5ac  ! 50: STH_I	sth	%r23, [%r7 + 0x05ac]
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	.word 0xb209a381  ! 51: AND_I	and 	%r6, 0x0381, %r25
	.word 0xaa096cb8  ! 51: AND_I	and 	%r5, 0x0cb8, %r21
	.word 0xae0a20b3  ! 51: AND_I	and 	%r8, 0x00b3, %r23
	bne thr1_loop_3
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_4:
	.word 0xa608eca1  ! 57: AND_I	and 	%r3, 0x0ca1, %r19
	.word 0xaa11eef1  ! 57: OR_I	or 	%r7, 0x0ef1, %r21
	.word 0xaa0965da  ! 57: AND_I	and 	%r5, 0x05da, %r21
	.word 0xbe096010  ! 57: AND_I	and 	%r5, 0x0010, %r31
	.word 0xb209e668  ! 57: AND_I	and 	%r7, 0x0668, %r25
	.word 0xb2016e5b  ! 57: ADD_I	add 	%r5, 0x0e5b, %r25
	.word 0xbe01c00f  ! 57: ADD_R	add 	%r7, %r15, %r31
	.word 0xaa010009  ! 57: ADD_R	add 	%r4, %r9, %r21
	.word 0xb210c00a  ! 57: OR_R	or 	%r3, %r10, %r25
	.word 0xbe014009  ! 57: ADD_R	add 	%r5, %r9, %r31
	.word 0xba11695e  ! 57: OR_I	or 	%r5, 0x095e, %r29
	.word 0xae116c12  ! 57: OR_I	or 	%r5, 0x0c12, %r23
	.word 0xa202000e  ! 57: ADD_R	add 	%r8, %r14, %r17
	.word 0xba094009  ! 57: AND_R	and 	%r5, %r9, %r29
	.word 0xb41160ef  ! 57: OR_I	or 	%r5, 0x00ef, %r26
	.word 0xac098009  ! 57: AND_R	and 	%r6, %r9, %r22
	.word 0xb00921c8  ! 57: AND_I	and 	%r4, 0x01c8, %r24
	.word 0xb800e4df  ! 57: ADD_I	add 	%r3, 0x04df, %r28
	.word 0xbc10c00b  ! 57: OR_R	or 	%r3, %r11, %r30
	.word 0xb602000f  ! 57: ADD_R	add 	%r8, %r15, %r27
	.word 0xac11c009  ! 57: OR_R	or 	%r7, %r9, %r22
	.word 0xb80126df  ! 57: ADD_I	add 	%r4, 0x06df, %r28
	.word 0xbe01a536  ! 57: ADD_I	add 	%r6, 0x0536, %r31
	.word 0xb401ecc0  ! 57: ADD_I	add 	%r7, 0x0cc0, %r26
	.word 0xb40a000c  ! 57: AND_R	and 	%r8, %r12, %r26
	.word 0xb6122335  ! 57: OR_I	or 	%r8, 0x0335, %r27
	.word 0xb611000a  ! 57: OR_R	or 	%r4, %r10, %r27
	.word 0xae092f78  ! 57: AND_I	and 	%r4, 0x0f78, %r23
	.word 0xa608c00c  ! 57: AND_R	and 	%r3, %r12, %r19
	.word 0xaa01e8a9  ! 57: ADD_I	add 	%r7, 0x08a9, %r21
	.word 0xb812000b  ! 57: OR_R	or 	%r8, %r11, %r28
	.word 0xa412219f  ! 57: OR_I	or 	%r8, 0x019f, %r18
	.word 0xbc122fa0  ! 57: OR_I	or 	%r8, 0x0fa0, %r30
	.word 0xb409c00a  ! 57: AND_R	and 	%r7, %r10, %r26
	.word 0xbc11c00b  ! 57: OR_R	or 	%r7, %r11, %r30
	.word 0xb80a000d  ! 57: AND_R	and 	%r8, %r13, %r28
	.word 0xb611000b  ! 57: OR_R	or 	%r4, %r11, %r27
	.word 0xb0096a7a  ! 57: AND_I	and 	%r5, 0x0a7a, %r24
	.word 0xbc09e10b  ! 57: AND_I	and 	%r7, 0x010b, %r30
	.word 0xbc11800c  ! 57: OR_R	or 	%r6, %r12, %r30
	.word 0xbe01a15a  ! 57: ADD_I	add 	%r6, 0x015a, %r31
	.word 0xa810ec06  ! 57: OR_I	or 	%r3, 0x0c06, %r20
	.word 0xba01c00c  ! 57: ADD_R	add 	%r7, %r12, %r29
	.word 0xbc02000d  ! 57: ADD_R	add 	%r8, %r13, %r30
	.word 0xaa09000b  ! 57: AND_R	and 	%r4, %r11, %r21
	.word 0xb802000f  ! 57: ADD_R	add 	%r8, %r15, %r28
	.word 0xbc09000f  ! 57: AND_R	and 	%r4, %r15, %r30
	.word 0xa812000c  ! 57: OR_R	or 	%r8, %r12, %r20
	.word 0xba122a9e  ! 57: OR_I	or 	%r8, 0x0a9e, %r29
	.word 0xb00125a6  ! 57: ADD_I	add 	%r4, 0x05a6, %r24
	.word 0xb00a2b52  ! 57: AND_I	and 	%r8, 0x0b52, %r24
	.word 0xac08e6a4  ! 57: AND_I	and 	%r3, 0x06a4, %r22
	.word 0xaa09e43a  ! 57: AND_I	and 	%r7, 0x043a, %r21
	.word 0xac0227ad  ! 57: ADD_I	add 	%r8, 0x07ad, %r22
	.word 0xb201ac8e  ! 57: ADD_I	add 	%r6, 0x0c8e, %r25
	.word 0xb2114009  ! 57: OR_R	or 	%r5, %r9, %r25
	.word 0xa209800a  ! 57: AND_R	and 	%r6, %r10, %r17
	.word 0xac01aa8c  ! 57: ADD_I	add 	%r6, 0x0a8c, %r22
	.word 0xac016b7b  ! 57: ADD_I	add 	%r5, 0x0b7b, %r22
	.word 0xb801800b  ! 57: ADD_R	add 	%r6, %r11, %r28
	.word 0xba014009  ! 57: ADD_R	add 	%r5, %r9, %r29
	.word 0xba098009  ! 57: AND_R	and 	%r6, %r9, %r29
	.word 0xac08c00d  ! 57: AND_R	and 	%r3, %r13, %r22
	.word 0xb209800a  ! 57: AND_R	and 	%r6, %r10, %r25
	.word 0xaa09000e  ! 57: AND_R	and 	%r4, %r14, %r21
	.word 0xbe0962ba  ! 57: AND_I	and 	%r5, 0x02ba, %r31
	.word 0xaa122d80  ! 57: OR_I	or 	%r8, 0x0d80, %r21
	.word 0xa411a3c9  ! 57: OR_I	or 	%r6, 0x03c9, %r18
	.word 0xb809c00e  ! 57: AND_R	and 	%r7, %r14, %r28
	.word 0xa602224c  ! 57: ADD_I	add 	%r8, 0x024c, %r19
	.word 0xb401800b  ! 57: ADD_R	add 	%r6, %r11, %r26
	.word 0xaa016e28  ! 57: ADD_I	add 	%r5, 0x0e28, %r21
	.word 0xb2112fbc  ! 57: OR_I	or 	%r4, 0x0fbc, %r25
	.word 0xb0116377  ! 57: OR_I	or 	%r5, 0x0377, %r24
	.word 0xa40122f5  ! 57: ADD_I	add 	%r4, 0x02f5, %r18
	.word 0xbe09800c  ! 57: AND_R	and 	%r6, %r12, %r31
	.word 0xa61222cb  ! 57: OR_I	or 	%r8, 0x02cb, %r19
	.word 0xb2022f0a  ! 57: ADD_I	add 	%r8, 0x0f0a, %r25
	.word 0xa601400d  ! 57: ADD_R	add 	%r5, %r13, %r19
	.word 0xba09c00e  ! 57: AND_R	and 	%r7, %r14, %r29
	.word 0xb811c00f  ! 57: OR_R	or 	%r7, %r15, %r28
	.word 0xaa0a2acd  ! 57: AND_I	and 	%r8, 0x0acd, %r21
	.word 0xb801800b  ! 57: ADD_R	add 	%r6, %r11, %r28
	.word 0xb200c00d  ! 57: ADD_R	add 	%r3, %r13, %r25
	.word 0xbc11400d  ! 57: OR_R	or 	%r5, %r13, %r30
	.word 0xb409400d  ! 57: AND_R	and 	%r5, %r13, %r26
	.word 0xa801eec3  ! 57: ADD_I	add 	%r7, 0x0ec3, %r20
	.word 0xb8012b4b  ! 57: ADD_I	add 	%r4, 0x0b4b, %r28
	.word 0xbe02000c  ! 57: ADD_R	add 	%r8, %r12, %r31
	.word 0xa411c009  ! 57: OR_R	or 	%r7, %r9, %r18
	.word 0xba12295c  ! 57: OR_I	or 	%r8, 0x095c, %r29
	.word 0xae11800f  ! 57: OR_R	or 	%r6, %r15, %r23
	.word 0xbc11a49a  ! 57: OR_I	or 	%r6, 0x049a, %r30
	.word 0xae09c00d  ! 57: AND_R	and 	%r7, %r13, %r23
	.word 0xb411000f  ! 57: OR_R	or 	%r4, %r15, %r26
	.word 0xbe01000f  ! 57: ADD_R	add 	%r4, %r15, %r31
	.word 0xa600e512  ! 57: ADD_I	add 	%r3, 0x0512, %r19
	.word 0xae09400d  ! 57: AND_R	and 	%r5, %r13, %r23
	.word 0xb011a2f6  ! 57: OR_I	or 	%r6, 0x02f6, %r24
	.word 0xa6090009  ! 57: AND_R	and 	%r4, %r9, %r19
	.word 0xa211c009  ! 57: OR_R	or 	%r7, %r9, %r17
	.word 0xb408c00b  ! 57: AND_R	and 	%r3, %r11, %r26
	.word 0xa4022876  ! 57: ADD_I	add 	%r8, 0x0876, %r18
	.word 0xa4012b37  ! 57: ADD_I	add 	%r4, 0x0b37, %r18
	.word 0xba0a2ece  ! 57: AND_I	and 	%r8, 0x0ece, %r29
	.word 0xa802000d  ! 57: ADD_R	add 	%r8, %r13, %r20
	.word 0xb40a000d  ! 57: AND_R	and 	%r8, %r13, %r26
	.word 0xae09800d  ! 57: AND_R	and 	%r6, %r13, %r23
	.word 0xbc112c1e  ! 57: OR_I	or 	%r4, 0x0c1e, %r30
	.word 0xb0092a28  ! 57: AND_I	and 	%r4, 0x0a28, %r24
	.word 0xb811400c  ! 57: OR_R	or 	%r5, %r12, %r28
	.word 0xb611c00d  ! 57: OR_R	or 	%r7, %r13, %r27
	.word 0xa80a29c9  ! 57: AND_I	and 	%r8, 0x09c9, %r20
	.word 0xba094009  ! 57: AND_R	and 	%r5, %r9, %r29
	.word 0xb800e796  ! 57: ADD_I	add 	%r3, 0x0796, %r28
	.word 0xbe0a000f  ! 57: AND_R	and 	%r8, %r15, %r31
	.word 0xbc0929a3  ! 57: AND_I	and 	%r4, 0x09a3, %r30
	.word 0xbc112e67  ! 57: OR_I	or 	%r4, 0x0e67, %r30
	.word 0xba11800a  ! 57: OR_R	or 	%r6, %r10, %r29
	.word 0xb801800b  ! 57: ADD_R	add 	%r6, %r11, %r28
	.word 0xb601c00f  ! 57: ADD_R	add 	%r7, %r15, %r27
	.word 0xae00e8bb  ! 57: ADD_I	add 	%r3, 0x08bb, %r23
	.word 0xbe096546  ! 57: AND_I	and 	%r5, 0x0546, %r31
	.word 0xac01e9d4  ! 57: ADD_I	add 	%r7, 0x09d4, %r22
	.word 0xbe096d0e  ! 57: AND_I	and 	%r5, 0x0d0e, %r31
	.word 0xb811c00f  ! 57: OR_R	or 	%r7, %r15, %r28
	.word 0xaa11800b  ! 57: OR_R	or 	%r6, %r11, %r21
	.word 0xbe09a847  ! 57: AND_I	and 	%r6, 0x0847, %r31
	.word 0xa409400b  ! 57: AND_R	and 	%r5, %r11, %r18
	.word 0xac01800c  ! 57: ADD_R	add 	%r6, %r12, %r22
	.word 0xb001adea  ! 57: ADD_I	add 	%r6, 0x0dea, %r24
	.word 0xb000c00b  ! 57: ADD_R	add 	%r3, %r11, %r24
	.word 0xac122d5e  ! 57: OR_I	or 	%r8, 0x0d5e, %r22
	.word 0xb011c00e  ! 57: OR_R	or 	%r7, %r14, %r24
	.word 0xb810c00e  ! 57: OR_R	or 	%r3, %r14, %r28
	.word 0xaa122361  ! 57: OR_I	or 	%r8, 0x0361, %r21
	.word 0xbe1226c0  ! 57: OR_I	or 	%r8, 0x06c0, %r31
	.word 0xb011aee9  ! 57: OR_I	or 	%r6, 0x0ee9, %r24
	.word 0xb209ea71  ! 57: AND_I	and 	%r7, 0x0a71, %r25
	.word 0xa801400c  ! 57: ADD_R	add 	%r5, %r12, %r20
	.word 0xa20a281f  ! 57: AND_I	and 	%r8, 0x081f, %r17
	.word 0xac09edd4  ! 57: AND_I	and 	%r7, 0x0dd4, %r22
	.word 0xb60a000d  ! 57: AND_R	and 	%r8, %r13, %r27
	.word 0xee2a28ad  ! 57: STB_I	stb	%r23, [%r8 + 0x08ad]
	.word 0xe6312324  ! 57: STH_I	sth	%r19, [%r4 + 0x0324]
	.word 0xe63226de  ! 57: STH_I	sth	%r19, [%r8 + 0x06de]
	.word 0xec29aa6c  ! 57: STB_I	stb	%r22, [%r6 + 0x0a6c]
	.word 0xf2222b1c  ! 57: STW_I	stw	%r25, [%r8 + 0x0b1c]
	.word 0xec712148  ! 59: STX_I	stx	%r22, [%r4 + 0x0148]
	.word 0xae010045
	.word 0xfa222888  ! 61: STW_I	stw	%r29, [%r8 + 0x0888]
IC_ERR_13:
!$EV error(1,expr(@VA(.MAIN.IC_ERR_13), 16, 16),2,IC_DATA,IR,4,x)
	.word 0xc0f008e2  ! 64: STXA_R	stxa	%r0, [%r0 + %r2] 0x47
	.word 0xfa01c009  ! 65: LDUW_R	lduw	[%r7 + %r9], %r29
	.word 0xb609a371  ! 65: AND_I	and 	%r6, 0x0371, %r27
	.word 0xa412000d  ! 65: OR_R	or 	%r8, %r13, %r18
	.word 0xaa09800e  ! 65: AND_R	and 	%r6, %r14, %r21
	bne thr1_loop_4
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_5:
	.word 0xac01800b  ! 73: ADD_R	add 	%r6, %r11, %r22
	.word 0xa201000c  ! 73: ADD_R	add 	%r4, %r12, %r17
	.word 0xb009000b  ! 73: AND_R	and 	%r4, %r11, %r24
	.word 0xa6018009  ! 73: ADD_R	add 	%r6, %r9, %r19
	.word 0xaa09edc4  ! 73: AND_I	and 	%r7, 0x0dc4, %r21
	.word 0xac09e7da  ! 73: AND_I	and 	%r7, 0x07da, %r22
	.word 0xbe022d58  ! 73: ADD_I	add 	%r8, 0x0d58, %r31
	.word 0xac00eebf  ! 73: ADD_I	add 	%r3, 0x0ebf, %r22
	.word 0xb611284b  ! 73: OR_I	or 	%r4, 0x084b, %r27
	.word 0xac11800b  ! 73: OR_R	or 	%r6, %r11, %r22
	.word 0xa211c00f  ! 73: OR_R	or 	%r7, %r15, %r17
	.word 0xbc112713  ! 73: OR_I	or 	%r4, 0x0713, %r30
	.word 0xba00c00a  ! 73: ADD_R	add 	%r3, %r10, %r29
	.word 0xb211800e  ! 73: OR_R	or 	%r6, %r14, %r25
	.word 0xae110009  ! 73: OR_R	or 	%r4, %r9, %r23
	.word 0xbe08eacc  ! 73: AND_I	and 	%r3, 0x0acc, %r31
	.word 0xa201400e  ! 73: ADD_R	add 	%r5, %r14, %r17
	.word 0xa408c00e  ! 73: AND_R	and 	%r3, %r14, %r18
	.word 0xbc0a0009  ! 73: AND_R	and 	%r8, %r9, %r30
	.word 0xa811400b  ! 73: OR_R	or 	%r5, %r11, %r20
	.word 0xb0094009  ! 73: AND_R	and 	%r5, %r9, %r24
	.word 0xb409222e  ! 73: AND_I	and 	%r4, 0x022e, %r26
	.word 0xa6118009  ! 73: OR_R	or 	%r6, %r9, %r19
	.word 0xb000e8c7  ! 73: ADD_I	add 	%r3, 0x08c7, %r24
	.word 0xa41128ed  ! 73: OR_I	or 	%r4, 0x08ed, %r18
	.word 0xae0920ca  ! 73: AND_I	and 	%r4, 0x00ca, %r23
	.word 0xae01400d  ! 73: ADD_R	add 	%r5, %r13, %r23
	.word 0xa80a2beb  ! 73: AND_I	and 	%r8, 0x0beb, %r20
	.word 0xa80a000f  ! 73: AND_R	and 	%r8, %r15, %r20
	.word 0xae08e817  ! 73: AND_I	and 	%r3, 0x0817, %r23
	.word 0xb012000b  ! 73: OR_R	or 	%r8, %r11, %r24
	.word 0xb810ea1d  ! 73: OR_I	or 	%r3, 0x0a1d, %r28
	.word 0xb400ef27  ! 73: ADD_I	add 	%r3, 0x0f27, %r26
	.word 0xaa0a000f  ! 73: AND_R	and 	%r8, %r15, %r21
	.word 0xa4016b2b  ! 73: ADD_I	add 	%r5, 0x0b2b, %r18
	.word 0xbc00c00d  ! 73: ADD_R	add 	%r3, %r13, %r30
	.word 0xae0921c2  ! 73: AND_I	and 	%r4, 0x01c2, %r23
	.word 0xb41167b4  ! 73: OR_I	or 	%r5, 0x07b4, %r26
	.word 0xb409a6a7  ! 73: AND_I	and 	%r6, 0x06a7, %r26
	.word 0xb202000f  ! 73: ADD_R	add 	%r8, %r15, %r25
	.word 0xac02000c  ! 73: ADD_R	add 	%r8, %r12, %r22
	.word 0xb4112dce  ! 73: OR_I	or 	%r4, 0x0dce, %r26
	.word 0xb2122041  ! 73: OR_I	or 	%r8, 0x0041, %r25
	.word 0xb6120009  ! 73: OR_R	or 	%r8, %r9, %r27
	.word 0xb001e243  ! 73: ADD_I	add 	%r7, 0x0243, %r24
	.word 0xb21123b6  ! 73: OR_I	or 	%r4, 0x03b6, %r25
	.word 0xb211ef01  ! 73: OR_I	or 	%r7, 0x0f01, %r25
	.word 0xb611800d  ! 73: OR_R	or 	%r6, %r13, %r27
	.word 0xa209696e  ! 73: AND_I	and 	%r5, 0x096e, %r17
	.word 0xb800c00d  ! 73: ADD_R	add 	%r3, %r13, %r28
	.word 0xb210c009  ! 73: OR_R	or 	%r3, %r9, %r25
	.word 0xac09c009  ! 73: AND_R	and 	%r7, %r9, %r22
	.word 0xac09000b  ! 73: AND_R	and 	%r4, %r11, %r22
	.word 0xa212000c  ! 73: OR_R	or 	%r8, %r12, %r17
	.word 0xa601e222  ! 73: ADD_I	add 	%r7, 0x0222, %r19
	.word 0xa801227b  ! 73: ADD_I	add 	%r4, 0x027b, %r20
	.word 0xa601400d  ! 73: ADD_R	add 	%r5, %r13, %r19
	.word 0xba09800f  ! 73: AND_R	and 	%r6, %r15, %r29
	.word 0xbc09c009  ! 73: AND_R	and 	%r7, %r9, %r30
	.word 0xba114009  ! 73: OR_R	or 	%r5, %r9, %r29
	.word 0xb211800f  ! 73: OR_R	or 	%r6, %r15, %r25
	.word 0xa8016861  ! 73: ADD_I	add 	%r5, 0x0861, %r20
	.word 0xbe01282e  ! 73: ADD_I	add 	%r4, 0x082e, %r31
	.word 0xa4118009  ! 73: OR_R	or 	%r6, %r9, %r18
	.word 0xb4016dcf  ! 73: ADD_I	add 	%r5, 0x0dcf, %r26
	.word 0xa609800d  ! 73: AND_R	and 	%r6, %r13, %r19
	.word 0xa201a32f  ! 73: ADD_I	add 	%r6, 0x032f, %r17
	.word 0xac01e1ef  ! 73: ADD_I	add 	%r7, 0x01ef, %r22
	.word 0xa211261f  ! 73: OR_I	or 	%r4, 0x061f, %r17
	.word 0xa80a000c  ! 73: AND_R	and 	%r8, %r12, %r20
	.word 0xa4022bde  ! 73: ADD_I	add 	%r8, 0x0bde, %r18
	.word 0xbe09000f  ! 73: AND_R	and 	%r4, %r15, %r31
	.word 0xba11a817  ! 73: OR_I	or 	%r6, 0x0817, %r29
	.word 0xbe022ec4  ! 73: ADD_I	add 	%r8, 0x0ec4, %r31
	.word 0xb211c00d  ! 73: OR_R	or 	%r7, %r13, %r25
	.word 0xa411a2b3  ! 73: OR_I	or 	%r6, 0x02b3, %r18
	.word 0xa611800a  ! 73: OR_R	or 	%r6, %r10, %r19
	.word 0xbe09800b  ! 73: AND_R	and 	%r6, %r11, %r31
	.word 0xa4092a6e  ! 73: AND_I	and 	%r4, 0x0a6e, %r18
	.word 0xa200eb49  ! 73: ADD_I	add 	%r3, 0x0b49, %r17
	.word 0xa609ace9  ! 73: AND_I	and 	%r6, 0x0ce9, %r19
	.word 0xae08eefc  ! 73: AND_I	and 	%r3, 0x0efc, %r23
	.word 0xbc11acb9  ! 73: OR_I	or 	%r6, 0x0cb9, %r30
	.word 0xaa0127c4  ! 73: ADD_I	add 	%r4, 0x07c4, %r21
	.word 0xbe09000e  ! 73: AND_R	and 	%r4, %r14, %r31
	.word 0xa211000b  ! 73: OR_R	or 	%r4, %r11, %r17
	.word 0xae09c009  ! 73: AND_R	and 	%r7, %r9, %r23
	.word 0xb209c00d  ! 73: AND_R	and 	%r7, %r13, %r25
	.word 0xb801a7fa  ! 73: ADD_I	add 	%r6, 0x07fa, %r28
	.word 0xb410c00f  ! 73: OR_R	or 	%r3, %r15, %r26
	.word 0xa401400e  ! 73: ADD_R	add 	%r5, %r14, %r18
	.word 0xb4092bfc  ! 73: AND_I	and 	%r4, 0x0bfc, %r26
	.word 0xb801800a  ! 73: ADD_R	add 	%r6, %r10, %r28
	.word 0xb20a000c  ! 73: AND_R	and 	%r8, %r12, %r25
	.word 0xb4012dfc  ! 73: ADD_I	add 	%r4, 0x0dfc, %r26
	.word 0xa801800b  ! 73: ADD_R	add 	%r6, %r11, %r20
	.word 0xb001252c  ! 73: ADD_I	add 	%r4, 0x052c, %r24
	.word 0xb409e397  ! 73: AND_I	and 	%r7, 0x0397, %r26
	.word 0xb60a000b  ! 73: AND_R	and 	%r8, %r11, %r27
	.word 0xbc11aeba  ! 73: OR_I	or 	%r6, 0x0eba, %r30
	.word 0xae01c00f  ! 73: ADD_R	add 	%r7, %r15, %r23
	.word 0xb609a4b4  ! 73: AND_I	and 	%r6, 0x04b4, %r27
	.word 0xb601c009  ! 73: ADD_R	add 	%r7, %r9, %r27
	.word 0xbe09800a  ! 73: AND_R	and 	%r6, %r10, %r31
	.word 0xa411c00f  ! 73: OR_R	or 	%r7, %r15, %r18
	.word 0xa61160f1  ! 73: OR_I	or 	%r5, 0x00f1, %r19
	.word 0xb801c00b  ! 73: ADD_R	add 	%r7, %r11, %r28
	.word 0xa600c00a  ! 73: ADD_R	add 	%r3, %r10, %r19
	.word 0xbc09400b  ! 73: AND_R	and 	%r5, %r11, %r30
	.word 0xaa08c00d  ! 73: AND_R	and 	%r3, %r13, %r21
	.word 0xa809c00a  ! 73: AND_R	and 	%r7, %r10, %r20
	.word 0xbe01800c  ! 73: ADD_R	add 	%r6, %r12, %r31
	.word 0xb611af13  ! 73: OR_I	or 	%r6, 0x0f13, %r27
	.word 0xb002000f  ! 73: ADD_R	add 	%r8, %r15, %r24
	.word 0xa611e1a8  ! 73: OR_I	or 	%r7, 0x01a8, %r19
	.word 0xb611800a  ! 73: OR_R	or 	%r6, %r10, %r27
	.word 0xa401e2b8  ! 73: ADD_I	add 	%r7, 0x02b8, %r18
	.word 0xa200c00a  ! 73: ADD_R	add 	%r3, %r10, %r17
	.word 0xae09000d  ! 73: AND_R	and 	%r4, %r13, %r23
	.word 0xf631ec54  ! 73: STH_I	sth	%r27, [%r7 + 0x0c54]
	.word 0xfa71e840  ! 73: STX_I	stx	%r29, [%r7 + 0x0840]
	.word 0xf471e568  ! 73: STX_I	stx	%r26, [%r7 + 0x0568]
	.word 0xf629acb1  ! 73: STB_I	stb	%r27, [%r6 + 0x0cb1]
	.word 0xe870e090  ! 73: STX_I	stx	%r20, [%r3 + 0x0090]
	.word 0xf82a27b0  ! 73: STB_I	stb	%r28, [%r8 + 0x07b0]
	.word 0xe629e106  ! 73: STB_I	stb	%r19, [%r7 + 0x0106]
	.word 0xe249400e  ! 74: LDSB_R	ldsb	[%r5 + %r14], %r17
	.word 0xe22122d4  ! 75: STW_I	stw	%r17, [%r4 + 0x02d4]
	.word 0xf649400e  ! 76: LDSB_R	ldsb	[%r5 + %r14], %r27
	.word 0xac016f9a  ! 76: ADD_I	add 	%r5, 0x0f9a, %r22
	.word 0xa6014009  ! 76: ADD_R	add 	%r5, %r9, %r19
	.word 0xa20a000b  ! 76: AND_R	and 	%r8, %r11, %r17
	bne thr1_loop_5
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_6:
	.word 0xb201e278  ! 82: ADD_I	add 	%r7, 0x0278, %r25
	.word 0xba012596  ! 82: ADD_I	add 	%r4, 0x0596, %r29
	.word 0xa6092657  ! 82: AND_I	and 	%r4, 0x0657, %r19
	.word 0xa609800c  ! 82: AND_R	and 	%r6, %r12, %r19
	.word 0xac11ef3e  ! 82: OR_I	or 	%r7, 0x0f3e, %r22
	.word 0xb80a0009  ! 82: AND_R	and 	%r8, %r9, %r28
	.word 0xb001400c  ! 82: ADD_R	add 	%r5, %r12, %r24
	.word 0xac020009  ! 82: ADD_R	add 	%r8, %r9, %r22
	.word 0xa609400d  ! 82: AND_R	and 	%r5, %r13, %r19
	.word 0xae01400d  ! 82: ADD_R	add 	%r5, %r13, %r23
	.word 0xac09c00c  ! 82: AND_R	and 	%r7, %r12, %r22
	.word 0xb408c00d  ! 82: AND_R	and 	%r3, %r13, %r26
	.word 0xa201e90f  ! 82: ADD_I	add 	%r7, 0x090f, %r17
	.word 0xb611a1e9  ! 82: OR_I	or 	%r6, 0x01e9, %r27
	.word 0xb2112881  ! 82: OR_I	or 	%r4, 0x0881, %r25
	.word 0xa8022156  ! 82: ADD_I	add 	%r8, 0x0156, %r20
	.word 0xb600c00d  ! 82: ADD_R	add 	%r3, %r13, %r27
	.word 0xb411000c  ! 82: OR_R	or 	%r4, %r12, %r26
	.word 0xa402000e  ! 82: ADD_R	add 	%r8, %r14, %r18
	.word 0xa200c009  ! 82: ADD_R	add 	%r3, %r9, %r17
	.word 0xa209627d  ! 82: AND_I	and 	%r5, 0x027d, %r17
	.word 0xa4116de7  ! 82: OR_I	or 	%r5, 0x0de7, %r18
	.word 0xa41129b8  ! 82: OR_I	or 	%r4, 0x09b8, %r18
	.word 0xa6022839  ! 82: ADD_I	add 	%r8, 0x0839, %r19
	.word 0xb401400f  ! 82: ADD_R	add 	%r5, %r15, %r26
	.word 0xbe01000a  ! 82: ADD_R	add 	%r4, %r10, %r31
	.word 0xb809000d  ! 82: AND_R	and 	%r4, %r13, %r28
	.word 0xa201ee76  ! 82: ADD_I	add 	%r7, 0x0e76, %r17
	.word 0xba014009  ! 82: ADD_R	add 	%r5, %r9, %r29
	.word 0xa410e85d  ! 82: OR_I	or 	%r3, 0x085d, %r18
	.word 0xbc12230c  ! 82: OR_I	or 	%r8, 0x030c, %r30
	.word 0xaa10c00f  ! 82: OR_R	or 	%r3, %r15, %r21
	.word 0xb4096bbb  ! 82: AND_I	and 	%r5, 0x0bbb, %r26
	.word 0xaa09af13  ! 82: AND_I	and 	%r6, 0x0f13, %r21
	.word 0xa411e4d1  ! 82: OR_I	or 	%r7, 0x04d1, %r18
	.word 0xb409eb45  ! 82: AND_I	and 	%r7, 0x0b45, %r26
	.word 0xb40964cb  ! 82: AND_I	and 	%r5, 0x04cb, %r26
	.word 0xba09c00a  ! 82: AND_R	and 	%r7, %r10, %r29
	.word 0xaa09628a  ! 82: AND_I	and 	%r5, 0x028a, %r21
	.word 0xac122a1f  ! 82: OR_I	or 	%r8, 0x0a1f, %r22
	.word 0xb6116669  ! 82: OR_I	or 	%r5, 0x0669, %r27
	.word 0xbe02000c  ! 82: ADD_R	add 	%r8, %r12, %r31
	.word 0xae0a000c  ! 82: AND_R	and 	%r8, %r12, %r23
	.word 0xaa11c00f  ! 82: OR_R	or 	%r7, %r15, %r21
	.word 0xb410e1d6  ! 82: OR_I	or 	%r3, 0x01d6, %r26
	.word 0xb80a000c  ! 82: AND_R	and 	%r8, %r12, %r28
	.word 0xae01400b  ! 82: ADD_R	add 	%r5, %r11, %r23
	.word 0xaa11c00c  ! 82: OR_R	or 	%r7, %r12, %r21
	.word 0xbc10c00b  ! 82: OR_R	or 	%r3, %r11, %r30
	.word 0xac08c00e  ! 82: AND_R	and 	%r3, %r14, %r22
	.word 0xba08c00e  ! 82: AND_R	and 	%r3, %r14, %r29
	.word 0xb809800b  ! 82: AND_R	and 	%r6, %r11, %r28
	.word 0xb801e0a7  ! 82: ADD_I	add 	%r7, 0x00a7, %r28
	.word 0xba01a6a0  ! 82: ADD_I	add 	%r6, 0x06a0, %r29
	.word 0xb801c00f  ! 82: ADD_R	add 	%r7, %r15, %r28
	.word 0xb8112e67  ! 82: OR_I	or 	%r4, 0x0e67, %r28
	.word 0xbc09ad47  ! 82: AND_I	and 	%r6, 0x0d47, %r30
	.word 0xa408c00c  ! 82: AND_R	and 	%r3, %r12, %r18
	.word 0xb8018009  ! 82: ADD_R	add 	%r6, %r9, %r28
	.word 0xae0929fd  ! 82: AND_I	and 	%r4, 0x09fd, %r23
	.word 0xb802000b  ! 82: ADD_R	add 	%r8, %r11, %r28
	.word 0xb810effb  ! 82: OR_I	or 	%r3, 0x0ffb, %r28
	.word 0xb410ec9b  ! 82: OR_I	or 	%r3, 0x0c9b, %r26
	.word 0xb211800c  ! 82: OR_R	or 	%r6, %r12, %r25
	.word 0xaa10e661  ! 82: OR_I	or 	%r3, 0x0661, %r21
	.word 0xbc02000a  ! 82: ADD_R	add 	%r8, %r10, %r30
	.word 0xb809a7fb  ! 82: AND_I	and 	%r6, 0x07fb, %r28
	.word 0xb0012794  ! 82: ADD_I	add 	%r4, 0x0794, %r24
	.word 0xaa12000e  ! 82: OR_R	or 	%r8, %r14, %r21
	.word 0xb200c00c  ! 82: ADD_R	add 	%r3, %r12, %r25
	.word 0xaa01400c  ! 82: ADD_R	add 	%r5, %r12, %r21
	.word 0xb209000b  ! 82: AND_R	and 	%r4, %r11, %r25
	.word 0xbe01a7f4  ! 82: ADD_I	add 	%r6, 0x07f4, %r31
	.word 0xa411400d  ! 82: OR_R	or 	%r5, %r13, %r18
	.word 0xb40222a7  ! 82: ADD_I	add 	%r8, 0x02a7, %r26
	.word 0xb41226f6  ! 82: OR_I	or 	%r8, 0x06f6, %r26
	.word 0xba09000e  ! 82: AND_R	and 	%r4, %r14, %r29
	.word 0xac09000b  ! 82: AND_R	and 	%r4, %r11, %r22
	.word 0xb4112599  ! 82: OR_I	or 	%r4, 0x0599, %r26
	.word 0xbc11800f  ! 82: OR_R	or 	%r6, %r15, %r30
	.word 0xa209a926  ! 82: AND_I	and 	%r6, 0x0926, %r17
	.word 0xbc01000d  ! 82: ADD_R	add 	%r4, %r13, %r30
	.word 0xae022d63  ! 82: ADD_I	add 	%r8, 0x0d63, %r23
	.word 0xba10e534  ! 82: OR_I	or 	%r3, 0x0534, %r29
	.word 0xb209000f  ! 82: AND_R	and 	%r4, %r15, %r25
	.word 0xaa02000e  ! 82: ADD_R	add 	%r8, %r14, %r21
	.word 0xa412273c  ! 82: OR_I	or 	%r8, 0x073c, %r18
	.word 0xaa01000a  ! 82: ADD_R	add 	%r4, %r10, %r21
	.word 0xb811000f  ! 82: OR_R	or 	%r4, %r15, %r28
	.word 0xa609ecec  ! 82: AND_I	and 	%r7, 0x0cec, %r19
	.word 0xb011ac51  ! 82: OR_I	or 	%r6, 0x0c51, %r24
	.word 0xa2022998  ! 82: ADD_I	add 	%r8, 0x0998, %r17
	.word 0xb6116fb7  ! 82: OR_I	or 	%r5, 0x0fb7, %r27
	.word 0xac00c00e  ! 82: ADD_R	add 	%r3, %r14, %r22
	.word 0xa211000b  ! 82: OR_R	or 	%r4, %r11, %r17
	.word 0xa609400f  ! 82: AND_R	and 	%r5, %r15, %r19
	.word 0xac11400b  ! 82: OR_R	or 	%r5, %r11, %r22
	.word 0xa610e3dc  ! 82: OR_I	or 	%r3, 0x03dc, %r19
	.word 0xac12000c  ! 82: OR_R	or 	%r8, %r12, %r22
	.word 0xa8016652  ! 82: ADD_I	add 	%r5, 0x0652, %r20
	.word 0xb808c00c  ! 82: AND_R	and 	%r3, %r12, %r28
	.word 0xb609c00e  ! 82: AND_R	and 	%r7, %r14, %r27
	.word 0xaa01400c  ! 82: ADD_R	add 	%r5, %r12, %r21
	.word 0xbe120009  ! 82: OR_R	or 	%r8, %r9, %r31
	.word 0xa8016685  ! 82: ADD_I	add 	%r5, 0x0685, %r20
	.word 0xb001000e  ! 82: ADD_R	add 	%r4, %r14, %r24
	.word 0xbc01c00a  ! 82: ADD_R	add 	%r7, %r10, %r30
	.word 0xb611000a  ! 82: OR_R	or 	%r4, %r10, %r27
	.word 0xa400eba5  ! 82: ADD_I	add 	%r3, 0x0ba5, %r18
	.word 0xba09800a  ! 82: AND_R	and 	%r6, %r10, %r29
	.word 0xb011000f  ! 82: OR_R	or 	%r4, %r15, %r24
	.word 0xa6022be1  ! 82: ADD_I	add 	%r8, 0x0be1, %r19
	.word 0xa2096069  ! 82: AND_I	and 	%r5, 0x0069, %r17
	.word 0xb0116c15  ! 82: OR_I	or 	%r5, 0x0c15, %r24
	.word 0xa60224c6  ! 82: ADD_I	add 	%r8, 0x04c6, %r19
	.word 0xa8096d8b  ! 82: AND_I	and 	%r5, 0x0d8b, %r20
	.word 0xb609000a  ! 82: AND_R	and 	%r4, %r10, %r27
	.word 0xb809c00d  ! 82: AND_R	and 	%r7, %r13, %r28
	.word 0xa411c00c  ! 82: OR_R	or 	%r7, %r12, %r18
	.word 0xbc01800a  ! 82: ADD_R	add 	%r6, %r10, %r30
	.word 0xb601400a  ! 82: ADD_R	add 	%r5, %r10, %r27
	.word 0xa60929d6  ! 82: AND_I	and 	%r4, 0x09d6, %r19
	.word 0xb80161ab  ! 82: ADD_I	add 	%r5, 0x01ab, %r28
	.word 0xaa00c00b  ! 82: ADD_R	add 	%r3, %r11, %r21
	.word 0xb411a881  ! 82: OR_I	or 	%r6, 0x0881, %r26
	.word 0xa409e4c1  ! 82: AND_I	and 	%r7, 0x04c1, %r18
	.word 0xb411000a  ! 82: OR_R	or 	%r4, %r10, %r26
	.word 0xb009a6d6  ! 82: AND_I	and 	%r6, 0x06d6, %r24
	.word 0xb001800c  ! 82: ADD_R	add 	%r6, %r12, %r24
	.word 0xb809800e  ! 82: AND_R	and 	%r6, %r14, %r28
	.word 0xba11264e  ! 82: OR_I	or 	%r4, 0x064e, %r29
	.word 0xb6012c23  ! 82: ADD_I	add 	%r4, 0x0c23, %r27
	.word 0xaa118009  ! 82: OR_R	or 	%r6, %r9, %r21
	.word 0xb40a21fd  ! 82: AND_I	and 	%r8, 0x01fd, %r26
	.word 0xb608c00a  ! 82: AND_R	and 	%r3, %r10, %r27
	.word 0xae08e109  ! 82: AND_I	and 	%r3, 0x0109, %r23
	.word 0xb610ec54  ! 82: OR_I	or 	%r3, 0x0c54, %r27
	.word 0xae11e8d1  ! 82: OR_I	or 	%r7, 0x08d1, %r23
	.word 0xa201000b  ! 82: ADD_R	add 	%r4, %r11, %r17
	.word 0xac08ec7e  ! 82: AND_I	and 	%r3, 0x0c7e, %r22
	.word 0xb001400b  ! 82: ADD_R	add 	%r5, %r11, %r24
	.word 0xbc00e1ae  ! 82: ADD_I	add 	%r3, 0x01ae, %r30
	.word 0xb6122e4b  ! 82: OR_I	or 	%r8, 0x0e4b, %r27
	.word 0xae02000a  ! 82: ADD_R	add 	%r8, %r10, %r23
	.word 0xac00c00d  ! 82: ADD_R	add 	%r3, %r13, %r22
	.word 0xb401ef3c  ! 82: ADD_I	add 	%r7, 0x0f3c, %r26
	.word 0xb408e29a  ! 82: AND_I	and 	%r3, 0x029a, %r26
	.word 0xb000c00f  ! 82: ADD_R	add 	%r3, %r15, %r24
	.word 0xaa01800c  ! 82: ADD_R	add 	%r6, %r12, %r21
	.word 0xb601a069  ! 82: ADD_I	add 	%r6, 0x0069, %r27
	.word 0xaa09c00b  ! 82: AND_R	and 	%r7, %r11, %r21
	.word 0xaa0a000a  ! 82: AND_R	and 	%r8, %r10, %r21
	.word 0xa209000a  ! 82: AND_R	and 	%r4, %r10, %r17
	.word 0xb40a2294  ! 82: AND_I	and 	%r8, 0x0294, %r26
	.word 0xb002000a  ! 82: ADD_R	add 	%r8, %r10, %r24
	.word 0xba00eef0  ! 82: ADD_I	add 	%r3, 0x0ef0, %r29
	.word 0xa6022645  ! 82: ADD_I	add 	%r8, 0x0645, %r19
	.word 0xb611000b  ! 82: OR_R	or 	%r4, %r11, %r27
	.word 0xb212000a  ! 82: OR_R	or 	%r8, %r10, %r25
	.word 0xae09a1d6  ! 82: AND_I	and 	%r6, 0x01d6, %r23
	.word 0xb611ad8d  ! 82: OR_I	or 	%r6, 0x0d8d, %r27
	.word 0xb601c00a  ! 82: ADD_R	add 	%r7, %r10, %r27
	.word 0xa20a000b  ! 82: AND_R	and 	%r8, %r11, %r17
	.word 0xaa0a000c  ! 82: AND_R	and 	%r8, %r12, %r21
	.word 0xa411a23e  ! 82: OR_I	or 	%r6, 0x023e, %r18
	.word 0xbc1168cf  ! 82: OR_I	or 	%r5, 0x08cf, %r30
	.word 0xa801400d  ! 82: ADD_R	add 	%r5, %r13, %r20
	.word 0xb0016aa6  ! 82: ADD_I	add 	%r5, 0x0aa6, %r24
	.word 0xaa01c009  ! 82: ADD_R	add 	%r7, %r9, %r21
	.word 0xb200eb21  ! 82: ADD_I	add 	%r3, 0x0b21, %r25
	.word 0xbe00eecc  ! 82: ADD_I	add 	%r3, 0x0ecc, %r31
	.word 0xaa00e052  ! 82: ADD_I	add 	%r3, 0x0052, %r21
	.word 0xbc01400c  ! 82: ADD_R	add 	%r5, %r12, %r30
	.word 0xbe0a0009  ! 82: AND_R	and 	%r8, %r9, %r31
	.word 0xb4092083  ! 82: AND_I	and 	%r4, 0x0083, %r26
	.word 0xb4020009  ! 82: ADD_R	add 	%r8, %r9, %r26
	.word 0xae12000b  ! 82: OR_R	or 	%r8, %r11, %r23
	.word 0xaa11c00e  ! 82: OR_R	or 	%r7, %r14, %r21
	.word 0xbc01c00b  ! 82: ADD_R	add 	%r7, %r11, %r30
	.word 0xb008e0bd  ! 82: AND_I	and 	%r3, 0x00bd, %r24
	.word 0xb001625b  ! 82: ADD_I	add 	%r5, 0x025b, %r24
	.word 0xba12234b  ! 82: OR_I	or 	%r8, 0x034b, %r29
	.word 0xb411000f  ! 82: OR_R	or 	%r4, %r15, %r26
	.word 0xa411400c  ! 82: OR_R	or 	%r5, %r12, %r18
	.word 0xb61162d9  ! 82: OR_I	or 	%r5, 0x02d9, %r27
	.word 0xa411800c  ! 82: OR_R	or 	%r6, %r12, %r18
	.word 0xb0094009  ! 82: AND_R	and 	%r5, %r9, %r24
	.word 0xaa016d2b  ! 82: ADD_I	add 	%r5, 0x0d2b, %r21
	.word 0xaa08c00e  ! 82: AND_R	and 	%r3, %r14, %r21
	.word 0xae01400c  ! 82: ADD_R	add 	%r5, %r12, %r23
	.word 0xae01a817  ! 82: ADD_I	add 	%r6, 0x0817, %r23
	.word 0xa811800b  ! 82: OR_R	or 	%r6, %r11, %r20
	.word 0xba09800e  ! 82: AND_R	and 	%r6, %r14, %r29
	.word 0xbe09000f  ! 82: AND_R	and 	%r4, %r15, %r31
	.word 0xa810e0f4  ! 82: OR_I	or 	%r3, 0x00f4, %r20
	.word 0xbc11602d  ! 82: OR_I	or 	%r5, 0x002d, %r30
	.word 0xa8014009  ! 82: ADD_R	add 	%r5, %r9, %r20
	.word 0xac016f79  ! 82: ADD_I	add 	%r5, 0x0f79, %r22
	.word 0xba11c00d  ! 82: OR_R	or 	%r7, %r13, %r29
	.word 0xbe11c00e  ! 82: OR_R	or 	%r7, %r14, %r31
	.word 0xaa01400f  ! 82: ADD_R	add 	%r5, %r15, %r21
	.word 0xbc11acd2  ! 82: OR_I	or 	%r6, 0x0cd2, %r30
	.word 0xa810c00d  ! 82: OR_R	or 	%r3, %r13, %r20
	.word 0xa209c00d  ! 82: AND_R	and 	%r7, %r13, %r17
	.word 0xb209a3e6  ! 82: AND_I	and 	%r6, 0x03e6, %r25
	.word 0xb6122cfe  ! 82: OR_I	or 	%r8, 0x0cfe, %r27
	.word 0xae09800e  ! 82: AND_R	and 	%r6, %r14, %r23
	.word 0xa4016cf9  ! 82: ADD_I	add 	%r5, 0x0cf9, %r18
	.word 0xa2010009  ! 82: ADD_R	add 	%r4, %r9, %r17
	.word 0xb211c00e  ! 82: OR_R	or 	%r7, %r14, %r25
	.word 0xa609c00e  ! 82: AND_R	and 	%r7, %r14, %r19
	.word 0xb609e3d7  ! 82: AND_I	and 	%r7, 0x03d7, %r27
	.word 0xb011400b  ! 82: OR_R	or 	%r5, %r11, %r24
	.word 0xb009800e  ! 82: AND_R	and 	%r6, %r14, %r24
	.word 0xa80164f1  ! 82: ADD_I	add 	%r5, 0x04f1, %r20
	.word 0xa80a000e  ! 82: AND_R	and 	%r8, %r14, %r20
	.word 0xa211e04a  ! 82: OR_I	or 	%r7, 0x004a, %r17
	.word 0xa611000f  ! 82: OR_R	or 	%r4, %r15, %r19
	.word 0xa20168b1  ! 82: ADD_I	add 	%r5, 0x08b1, %r17
	.word 0xa601ac2b  ! 82: ADD_I	add 	%r6, 0x0c2b, %r19
	.word 0xa609400a  ! 82: AND_R	and 	%r5, %r10, %r19
	.word 0xb210ec47  ! 82: OR_I	or 	%r3, 0x0c47, %r25
	.word 0xa411c009  ! 82: OR_R	or 	%r7, %r9, %r18
	.word 0xf621e130  ! 82: STW_I	stw	%r27, [%r7 + 0x0130]
	.word 0xf629a3c2  ! 82: STB_I	stb	%r27, [%r6 + 0x03c2]
	.word 0xf028e8ef  ! 82: STB_I	stb	%r24, [%r3 + 0x08ef]
	.word 0xfa7122c0  ! 82: STX_I	stx	%r29, [%r4 + 0x02c0]
	.word 0xfa722c78  ! 82: STX_I	stx	%r29, [%r8 + 0x0c78]
	.word 0xee31ecc8  ! 83: STH_I	sth	%r23, [%r7 + 0x0cc8]
	.word 0xb219ad3b  ! 84: XOR_I	xor 	%r6, 0x0d3b, %r25
	.word 0xfc20e74c  ! 85: STW_I	stw	%r30, [%r3 + 0x074c]
	.word 0xfc31e84c  ! 86: STH_I	sth	%r30, [%r7 + 0x084c]
	.word 0xa471000a  ! 87: UDIV_R	udiv 	%r4, %r10, %r18
	.word 0xb611a14c  ! 87: OR_I	or 	%r6, 0x014c, %r27
	.word 0xa20a000d  ! 87: AND_R	and 	%r8, %r13, %r17
	.word 0xb809c00f  ! 87: AND_R	and 	%r7, %r15, %r28
	bne thr1_loop_6
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_7:
	.word 0xbc09400f  ! 93: AND_R	and 	%r5, %r15, %r30
	.word 0xb4118009  ! 93: OR_R	or 	%r6, %r9, %r26
	.word 0xa4090009  ! 93: AND_R	and 	%r4, %r9, %r18
	.word 0xac012203  ! 93: ADD_I	add 	%r4, 0x0203, %r22
	.word 0xb409000b  ! 93: AND_R	and 	%r4, %r11, %r26
	.word 0xbe11e646  ! 93: OR_I	or 	%r7, 0x0646, %r31
	.word 0xae112a95  ! 93: OR_I	or 	%r4, 0x0a95, %r23
	.word 0xa401c00c  ! 93: ADD_R	add 	%r7, %r12, %r18
	.word 0xa40a270a  ! 93: AND_I	and 	%r8, 0x070a, %r18
	.word 0xba116c37  ! 93: OR_I	or 	%r5, 0x0c37, %r29
	.word 0xa4116dd9  ! 93: OR_I	or 	%r5, 0x0dd9, %r18
	.word 0xa6022037  ! 93: ADD_I	add 	%r8, 0x0037, %r19
	.word 0xb209c00c  ! 93: AND_R	and 	%r7, %r12, %r25
	.word 0xb211400d  ! 93: OR_R	or 	%r5, %r13, %r25
	.word 0xb60a2682  ! 93: AND_I	and 	%r8, 0x0682, %r27
	.word 0xaa1227f2  ! 93: OR_I	or 	%r8, 0x07f2, %r21
	.word 0xb809800b  ! 93: AND_R	and 	%r6, %r11, %r28
	.word 0xbe02000c  ! 93: ADD_R	add 	%r8, %r12, %r31
	.word 0xb001ebe0  ! 93: ADD_I	add 	%r7, 0x0be0, %r24
	.word 0xa80166a0  ! 93: ADD_I	add 	%r5, 0x06a0, %r20
	.word 0xbe01a68c  ! 93: ADD_I	add 	%r6, 0x068c, %r31
	.word 0xb600c00f  ! 93: ADD_R	add 	%r3, %r15, %r27
	.word 0xb609c00b  ! 93: AND_R	and 	%r7, %r11, %r27
	.word 0xbe01ea29  ! 93: ADD_I	add 	%r7, 0x0a29, %r31
	.word 0xbe08e234  ! 93: AND_I	and 	%r3, 0x0234, %r31
	.word 0xb809e836  ! 93: AND_I	and 	%r7, 0x0836, %r28
	.word 0xa4110009  ! 93: OR_R	or 	%r4, %r9, %r18
	.word 0xba0120bc  ! 93: ADD_I	add 	%r4, 0x00bc, %r29
	.word 0xb409ad2a  ! 93: AND_I	and 	%r6, 0x0d2a, %r26
	.word 0xa801800b  ! 93: ADD_R	add 	%r6, %r11, %r20
	.word 0xa4018009  ! 93: ADD_R	add 	%r6, %r9, %r18
	.word 0xa609c00d  ! 93: AND_R	and 	%r7, %r13, %r19
	.word 0xb20a0009  ! 93: AND_R	and 	%r8, %r9, %r25
	.word 0xa201e294  ! 93: ADD_I	add 	%r7, 0x0294, %r17
	.word 0xb809ac52  ! 93: AND_I	and 	%r6, 0x0c52, %r28
	.word 0xba00c00e  ! 93: ADD_R	add 	%r3, %r14, %r29
	.word 0xba00c00a  ! 93: ADD_R	add 	%r3, %r10, %r29
	.word 0xb40a28f0  ! 93: AND_I	and 	%r8, 0x08f0, %r26
	.word 0xa40226d2  ! 93: ADD_I	add 	%r8, 0x06d2, %r18
	.word 0xba11400f  ! 93: OR_R	or 	%r5, %r15, %r29
	.word 0xbe11400b  ! 93: OR_R	or 	%r5, %r11, %r31
	.word 0xb609800b  ! 93: AND_R	and 	%r6, %r11, %r27
	.word 0xa408eb2d  ! 93: AND_I	and 	%r3, 0x0b2d, %r18
	.word 0xa610ee44  ! 93: OR_I	or 	%r3, 0x0e44, %r19
	.word 0xb009000e  ! 93: AND_R	and 	%r4, %r14, %r24
	.word 0xbc0a2ad1  ! 93: AND_I	and 	%r8, 0x0ad1, %r30
	.word 0xa208e46c  ! 93: AND_I	and 	%r3, 0x046c, %r17
	.word 0xa200c00a  ! 93: ADD_R	add 	%r3, %r10, %r17
	.word 0xba00ebd7  ! 93: ADD_I	add 	%r3, 0x0bd7, %r29
	.word 0xa609642b  ! 93: AND_I	and 	%r5, 0x042b, %r19
	.word 0xb609e688  ! 93: AND_I	and 	%r7, 0x0688, %r27
	.word 0xac09000d  ! 93: AND_R	and 	%r4, %r13, %r22
	.word 0xb0116da2  ! 93: OR_I	or 	%r5, 0x0da2, %r24
	.word 0xa810ee24  ! 93: OR_I	or 	%r3, 0x0e24, %r20
	.word 0xb4096202  ! 93: AND_I	and 	%r5, 0x0202, %r26
	.word 0xae09c00f  ! 93: AND_R	and 	%r7, %r15, %r23
	.word 0xb801400b  ! 93: ADD_R	add 	%r5, %r11, %r28
	.word 0xb609800d  ! 93: AND_R	and 	%r6, %r13, %r27
	.word 0xb809efd4  ! 93: AND_I	and 	%r7, 0x0fd4, %r28
	.word 0xa609aa97  ! 93: AND_I	and 	%r6, 0x0a97, %r19
	.word 0xbe01000b  ! 93: ADD_R	add 	%r4, %r11, %r31
	.word 0xbc02000a  ! 93: ADD_R	add 	%r8, %r10, %r30
	.word 0xae09e13b  ! 93: AND_I	and 	%r7, 0x013b, %r23
	.word 0xb011eba2  ! 93: OR_I	or 	%r7, 0x0ba2, %r24
	.word 0xbe11800e  ! 93: OR_R	or 	%r6, %r14, %r31
	.word 0xa40a2d56  ! 93: AND_I	and 	%r8, 0x0d56, %r18
	.word 0xa80a000c  ! 93: AND_R	and 	%r8, %r12, %r20
	.word 0xa411c00b  ! 93: OR_R	or 	%r7, %r11, %r18
	.word 0xbc0a000d  ! 93: AND_R	and 	%r8, %r13, %r30
	.word 0xa408c00f  ! 93: AND_R	and 	%r3, %r15, %r18
	.word 0xb811af89  ! 93: OR_I	or 	%r6, 0x0f89, %r28
	.word 0xbe112dd8  ! 93: OR_I	or 	%r4, 0x0dd8, %r31
	.word 0xae01400a  ! 93: ADD_R	add 	%r5, %r10, %r23
	.word 0xb81226fc  ! 93: OR_I	or 	%r8, 0x06fc, %r28
	.word 0xac00c00d  ! 93: ADD_R	add 	%r3, %r13, %r22
	.word 0xbc092d99  ! 93: AND_I	and 	%r4, 0x0d99, %r30
	.word 0xaa00c00a  ! 93: ADD_R	add 	%r3, %r10, %r21
	.word 0xa200e4da  ! 93: ADD_I	add 	%r3, 0x04da, %r17
	.word 0xa801400f  ! 93: ADD_R	add 	%r5, %r15, %r20
	.word 0xac09e0c1  ! 93: AND_I	and 	%r7, 0x00c1, %r22
	.word 0xac09ab31  ! 93: AND_I	and 	%r6, 0x0b31, %r22
	.word 0xba122f1f  ! 93: OR_I	or 	%r8, 0x0f1f, %r29
	.word 0xae112431  ! 93: OR_I	or 	%r4, 0x0431, %r23
	.word 0xba11000e  ! 93: OR_R	or 	%r4, %r14, %r29
	.word 0xa401aad9  ! 93: ADD_I	add 	%r6, 0x0ad9, %r18
	.word 0xbe01400d  ! 93: ADD_R	add 	%r5, %r13, %r31
	.word 0xbc01a34b  ! 93: ADD_I	add 	%r6, 0x034b, %r30
	.word 0xa40163e1  ! 93: ADD_I	add 	%r5, 0x03e1, %r18
	.word 0xa411800b  ! 93: OR_R	or 	%r6, %r11, %r18
	.word 0xa61220be  ! 93: OR_I	or 	%r8, 0x00be, %r19
	.word 0xac11000e  ! 93: OR_R	or 	%r4, %r14, %r22
	.word 0xbe01800f  ! 93: ADD_R	add 	%r6, %r15, %r31
	.word 0xae122209  ! 93: OR_I	or 	%r8, 0x0209, %r23
	.word 0xba08ee56  ! 93: AND_I	and 	%r3, 0x0e56, %r29
	.word 0xbc09400f  ! 93: AND_R	and 	%r5, %r15, %r30
	.word 0xa808ebda  ! 93: AND_I	and 	%r3, 0x0bda, %r20
	.word 0xb60a000f  ! 93: AND_R	and 	%r8, %r15, %r27
	.word 0xa409ead0  ! 93: AND_I	and 	%r7, 0x0ad0, %r18
	.word 0xa801800a  ! 93: ADD_R	add 	%r6, %r10, %r20
	.word 0xac00e0f7  ! 93: ADD_I	add 	%r3, 0x00f7, %r22
	.word 0xae01c00b  ! 93: ADD_R	add 	%r7, %r11, %r23
	.word 0xbe01a8c5  ! 93: ADD_I	add 	%r6, 0x08c5, %r31
	.word 0xa801216f  ! 93: ADD_I	add 	%r4, 0x016f, %r20
	.word 0xa611800a  ! 93: OR_R	or 	%r6, %r10, %r19
	.word 0xa408e7db  ! 93: AND_I	and 	%r3, 0x07db, %r18
	.word 0xa800e453  ! 93: ADD_I	add 	%r3, 0x0453, %r20
	.word 0xb60122b7  ! 93: ADD_I	add 	%r4, 0x02b7, %r27
	.word 0xa201274c  ! 93: ADD_I	add 	%r4, 0x074c, %r17
	.word 0xa812245a  ! 93: OR_I	or 	%r8, 0x045a, %r20
	.word 0xbe09c00e  ! 93: AND_R	and 	%r7, %r14, %r31
	.word 0xa411800e  ! 93: OR_R	or 	%r6, %r14, %r18
	.word 0xfa29a236  ! 93: STB_I	stb	%r29, [%r6 + 0x0236]
	.word 0xe821a1e4  ! 93: STW_I	stw	%r20, [%r6 + 0x01e4]
	.word 0xe43220e6  ! 93: STH_I	sth	%r18, [%r8 + 0x00e6]
	.word 0xec30e4f0  ! 93: STH_I	sth	%r22, [%r3 + 0x04f0]
	.word 0xea21ee48  ! 93: STW_I	stw	%r21, [%r7 + 0x0e48]
	.word 0xe629ef60  ! 95: STB_I	stb	%r19, [%r7 + 0x0f60]
	.word 0xae010045
	.word 0xf22a2147  ! 97: STB_I	stb	%r25, [%r8 + 0x0147]
	.word 0xe2712350  ! 98: STX_I	stx	%r17, [%r4 + 0x0350]
	.word 0xfa496687  ! 99: LDSB_I	ldsb	[%r5 + 0x0687], %r29
	.word 0xb808c00a  ! 99: AND_R	and 	%r3, %r10, %r28
	.word 0xaa0127f8  ! 99: ADD_I	add 	%r4, 0x07f8, %r21
	.word 0xb801800d  ! 99: ADD_R	add 	%r6, %r13, %r28
	bne thr1_loop_7
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_8:
	.word 0xb010c00a  ! 105: OR_R	or 	%r3, %r10, %r24
	.word 0xb2098009  ! 105: AND_R	and 	%r6, %r9, %r25
	.word 0xba12000a  ! 105: OR_R	or 	%r8, %r10, %r29
	.word 0xb801400a  ! 105: ADD_R	add 	%r5, %r10, %r28
	.word 0xaa12000d  ! 105: OR_R	or 	%r8, %r13, %r21
	.word 0xa20964f5  ! 105: AND_I	and 	%r5, 0x04f5, %r17
	.word 0xb601eda1  ! 105: ADD_I	add 	%r7, 0x0da1, %r27
	.word 0xb001c00f  ! 105: ADD_R	add 	%r7, %r15, %r24
	.word 0xae11800b  ! 105: OR_R	or 	%r6, %r11, %r23
	.word 0xbe116694  ! 105: OR_I	or 	%r5, 0x0694, %r31
	.word 0xaa01afa9  ! 105: ADD_I	add 	%r6, 0x0fa9, %r21
	.word 0xa80163ed  ! 105: ADD_I	add 	%r5, 0x03ed, %r20
	.word 0xa80a000b  ! 105: AND_R	and 	%r8, %r11, %r20
	.word 0xa611000c  ! 105: OR_R	or 	%r4, %r12, %r19
	.word 0xaa10e987  ! 105: OR_I	or 	%r3, 0x0987, %r21
	.word 0xb401ab4f  ! 105: ADD_I	add 	%r6, 0x0b4f, %r26
	.word 0xa6116c53  ! 105: OR_I	or 	%r5, 0x0c53, %r19
	.word 0xba118009  ! 105: OR_R	or 	%r6, %r9, %r29
	.word 0xbe00c00c  ! 105: ADD_R	add 	%r3, %r12, %r31
	.word 0xae09400f  ! 105: AND_R	and 	%r5, %r15, %r23
	.word 0xa6112796  ! 105: OR_I	or 	%r4, 0x0796, %r19
	.word 0xa6092dff  ! 105: AND_I	and 	%r4, 0x0dff, %r19
	.word 0xb6096b89  ! 105: AND_I	and 	%r5, 0x0b89, %r27
	.word 0xaa01e406  ! 105: ADD_I	add 	%r7, 0x0406, %r21
	.word 0xac0a2b95  ! 105: AND_I	and 	%r8, 0x0b95, %r22
	.word 0xb811281c  ! 105: OR_I	or 	%r4, 0x081c, %r28
	.word 0xa809c00e  ! 105: AND_R	and 	%r7, %r14, %r20
	.word 0xb011000e  ! 105: OR_R	or 	%r4, %r14, %r24
	.word 0xb410eef1  ! 105: OR_I	or 	%r3, 0x0ef1, %r26
	.word 0xb401c00a  ! 105: ADD_R	add 	%r7, %r10, %r26
	.word 0xb8096f89  ! 105: AND_I	and 	%r5, 0x0f89, %r28
	.word 0xb80a000c  ! 105: AND_R	and 	%r8, %r12, %r28
	.word 0xb011400b  ! 105: OR_R	or 	%r5, %r11, %r24
	.word 0xac10c00d  ! 105: OR_R	or 	%r3, %r13, %r22
	.word 0xb2094009  ! 105: AND_R	and 	%r5, %r9, %r25
	.word 0xa6116363  ! 105: OR_I	or 	%r5, 0x0363, %r19
	.word 0xac0a000a  ! 105: AND_R	and 	%r8, %r10, %r22
	.word 0xaa11400e  ! 105: OR_R	or 	%r5, %r14, %r21
	.word 0xb409400a  ! 105: AND_R	and 	%r5, %r10, %r26
	.word 0xa400c009  ! 105: ADD_R	add 	%r3, %r9, %r18
	.word 0xb00a2d9d  ! 105: AND_I	and 	%r8, 0x0d9d, %r24
	.word 0xa401aa67  ! 105: ADD_I	add 	%r6, 0x0a67, %r18
	.word 0xa401a4c7  ! 105: ADD_I	add 	%r6, 0x04c7, %r18
	.word 0xb402000c  ! 105: ADD_R	add 	%r8, %r12, %r26
	.word 0xa812000e  ! 105: OR_R	or 	%r8, %r14, %r20
	.word 0xb409400f  ! 105: AND_R	and 	%r5, %r15, %r26
	.word 0xac0a2af2  ! 105: AND_I	and 	%r8, 0x0af2, %r22
	.word 0xbc10e017  ! 105: OR_I	or 	%r3, 0x0017, %r30
	.word 0xb609c00e  ! 105: AND_R	and 	%r7, %r14, %r27
	.word 0xb809000d  ! 105: AND_R	and 	%r4, %r13, %r28
	.word 0xb211000a  ! 105: OR_R	or 	%r4, %r10, %r25
	.word 0xa810e8b8  ! 105: OR_I	or 	%r3, 0x08b8, %r20
	.word 0xbe10c009  ! 105: OR_R	or 	%r3, %r9, %r31
	.word 0xb210c00b  ! 105: OR_R	or 	%r3, %r11, %r25
	.word 0xb800c00f  ! 105: ADD_R	add 	%r3, %r15, %r28
	.word 0xa202000c  ! 105: ADD_R	add 	%r8, %r12, %r17
	.word 0xae11e5a5  ! 105: OR_I	or 	%r7, 0x05a5, %r23
	.word 0xb811e632  ! 105: OR_I	or 	%r7, 0x0632, %r28
	.word 0xa611edd7  ! 105: OR_I	or 	%r7, 0x0dd7, %r19
	.word 0xa201000f  ! 105: ADD_R	add 	%r4, %r15, %r17
	.word 0xa8116433  ! 105: OR_I	or 	%r5, 0x0433, %r20
	.word 0xa61167bd  ! 105: OR_I	or 	%r5, 0x07bd, %r19
	.word 0xa411400c  ! 105: OR_R	or 	%r5, %r12, %r18
	.word 0xb809612f  ! 105: AND_I	and 	%r5, 0x012f, %r28
	.word 0xb8092b6f  ! 105: AND_I	and 	%r4, 0x0b6f, %r28
	.word 0xa409000f  ! 105: AND_R	and 	%r4, %r15, %r18
	.word 0xbe014009  ! 105: ADD_R	add 	%r5, %r9, %r31
	.word 0xa209c00f  ! 105: AND_R	and 	%r7, %r15, %r17
	.word 0xa4096792  ! 105: AND_I	and 	%r5, 0x0792, %r18
	.word 0xb801c009  ! 105: ADD_R	add 	%r7, %r9, %r28
	.word 0xba10eeb6  ! 105: OR_I	or 	%r3, 0x0eb6, %r29
	.word 0xbc09800d  ! 105: AND_R	and 	%r6, %r13, %r30
	.word 0xbe08c00a  ! 105: AND_R	and 	%r3, %r10, %r31
	.word 0xb401a485  ! 105: ADD_I	add 	%r6, 0x0485, %r26
	.word 0xb400c00c  ! 105: ADD_R	add 	%r3, %r12, %r26
	.word 0xac11000d  ! 105: OR_R	or 	%r4, %r13, %r22
	.word 0xa809e743  ! 105: AND_I	and 	%r7, 0x0743, %r20
	.word 0xa810c00d  ! 105: OR_R	or 	%r3, %r13, %r20
	.word 0xb2012ea1  ! 105: ADD_I	add 	%r4, 0x0ea1, %r25
	.word 0xbc11400d  ! 105: OR_R	or 	%r5, %r13, %r30
	.word 0xae08c00c  ! 105: AND_R	and 	%r3, %r12, %r23
	.word 0xa609800e  ! 105: AND_R	and 	%r6, %r14, %r19
	.word 0xa608c00b  ! 105: AND_R	and 	%r3, %r11, %r19
	.word 0xac09800e  ! 105: AND_R	and 	%r6, %r14, %r22
	.word 0xa600e65c  ! 105: ADD_I	add 	%r3, 0x065c, %r19
	.word 0xa609ec39  ! 105: AND_I	and 	%r7, 0x0c39, %r19
	.word 0xbc122933  ! 105: OR_I	or 	%r8, 0x0933, %r30
	.word 0xac01e0c3  ! 105: ADD_I	add 	%r7, 0x00c3, %r22
	.word 0xa201800c  ! 105: ADD_R	add 	%r6, %r12, %r17
	.word 0xa40a266b  ! 105: AND_I	and 	%r8, 0x066b, %r18
	.word 0xa812000a  ! 105: OR_R	or 	%r8, %r10, %r20
	.word 0xb801000d  ! 105: ADD_R	add 	%r4, %r13, %r28
	.word 0xb011e671  ! 105: OR_I	or 	%r7, 0x0671, %r24
	.word 0xbc01400a  ! 105: ADD_R	add 	%r5, %r10, %r30
	.word 0xa801e7f3  ! 105: ADD_I	add 	%r7, 0x07f3, %r20
	.word 0xa2116c5e  ! 105: OR_I	or 	%r5, 0x0c5e, %r17
	.word 0xb60222aa  ! 105: ADD_I	add 	%r8, 0x02aa, %r27
	.word 0xb600c00a  ! 105: ADD_R	add 	%r3, %r10, %r27
	.word 0xae01a7dd  ! 105: ADD_I	add 	%r6, 0x07dd, %r23
	.word 0xb201c00b  ! 105: ADD_R	add 	%r7, %r11, %r25
	.word 0xb8022c67  ! 105: ADD_I	add 	%r8, 0x0c67, %r28
	.word 0xa202000c  ! 105: ADD_R	add 	%r8, %r12, %r17
	.word 0xac12000d  ! 105: OR_R	or 	%r8, %r13, %r22
	.word 0xb400c00f  ! 105: ADD_R	add 	%r3, %r15, %r26
	.word 0xbc090009  ! 105: AND_R	and 	%r4, %r9, %r30
	.word 0xb209c00b  ! 105: AND_R	and 	%r7, %r11, %r25
	.word 0xbc08e347  ! 105: AND_I	and 	%r3, 0x0347, %r30
	.word 0xae11e321  ! 105: OR_I	or 	%r7, 0x0321, %r23
	.word 0xa409c00c  ! 105: AND_R	and 	%r7, %r12, %r18
	.word 0xa411a339  ! 105: OR_I	or 	%r6, 0x0339, %r18
	.word 0xb40a29bb  ! 105: AND_I	and 	%r8, 0x09bb, %r26
	.word 0xa810c00c  ! 105: OR_R	or 	%r3, %r12, %r20
	.word 0xb401a97d  ! 105: ADD_I	add 	%r6, 0x097d, %r26
	.word 0xa209000e  ! 105: AND_R	and 	%r4, %r14, %r17
	.word 0xb411a2ce  ! 105: OR_I	or 	%r6, 0x02ce, %r26
	.word 0xa411e28f  ! 105: OR_I	or 	%r7, 0x028f, %r18
	.word 0xa4112e8c  ! 105: OR_I	or 	%r4, 0x0e8c, %r18
	.word 0xbe096476  ! 105: AND_I	and 	%r5, 0x0476, %r31
	.word 0xa411400a  ! 105: OR_R	or 	%r5, %r10, %r18
	.word 0xb4098009  ! 105: AND_R	and 	%r6, %r9, %r26
	.word 0xac12000c  ! 105: OR_R	or 	%r8, %r12, %r22
	.word 0xaa01acb5  ! 105: ADD_I	add 	%r6, 0x0cb5, %r21
	.word 0xae112458  ! 105: OR_I	or 	%r4, 0x0458, %r23
	.word 0xac09ace3  ! 105: AND_I	and 	%r6, 0x0ce3, %r22
	.word 0xba016395  ! 105: ADD_I	add 	%r5, 0x0395, %r29
	.word 0xaa11c00d  ! 105: OR_R	or 	%r7, %r13, %r21
	.word 0xb0010009  ! 105: ADD_R	add 	%r4, %r9, %r24
	.word 0xa402267a  ! 105: ADD_I	add 	%r8, 0x067a, %r18
	.word 0xb4022135  ! 105: ADD_I	add 	%r8, 0x0135, %r26
	.word 0xb00a28b0  ! 105: AND_I	and 	%r8, 0x08b0, %r24
	.word 0xb4010009  ! 105: ADD_R	add 	%r4, %r9, %r26
	.word 0xa6092c02  ! 105: AND_I	and 	%r4, 0x0c02, %r19
	.word 0xa8022b6b  ! 105: ADD_I	add 	%r8, 0x0b6b, %r20
	.word 0xbc01000b  ! 105: ADD_R	add 	%r4, %r11, %r30
	.word 0xb209601f  ! 105: AND_I	and 	%r5, 0x001f, %r25
	.word 0xb001000a  ! 105: ADD_R	add 	%r4, %r10, %r24
	.word 0xa2118009  ! 105: OR_R	or 	%r6, %r9, %r17
	.word 0xba022fce  ! 105: ADD_I	add 	%r8, 0x0fce, %r29
	.word 0xa80129b2  ! 105: ADD_I	add 	%r4, 0x09b2, %r20
	.word 0xbe09a38d  ! 105: AND_I	and 	%r6, 0x038d, %r31
	.word 0xb4022779  ! 105: ADD_I	add 	%r8, 0x0779, %r26
	.word 0xae1225c0  ! 105: OR_I	or 	%r8, 0x05c0, %r23
	.word 0xb808c00c  ! 105: AND_R	and 	%r3, %r12, %r28
	.word 0xba11800a  ! 105: OR_R	or 	%r6, %r10, %r29
	.word 0xb809a492  ! 105: AND_I	and 	%r6, 0x0492, %r28
	.word 0xb608e260  ! 105: AND_I	and 	%r3, 0x0260, %r27
	.word 0xb211c00a  ! 105: OR_R	or 	%r7, %r10, %r25
	.word 0xb409e30d  ! 105: AND_I	and 	%r7, 0x030d, %r26
	.word 0xae09c00b  ! 105: AND_R	and 	%r7, %r11, %r23
	.word 0xa811c00d  ! 105: OR_R	or 	%r7, %r13, %r20
	.word 0xba11a622  ! 105: OR_I	or 	%r6, 0x0622, %r29
	.word 0xac11c00a  ! 105: OR_R	or 	%r7, %r10, %r22
	.word 0xac09a70d  ! 105: AND_I	and 	%r6, 0x070d, %r22
	.word 0xa609643b  ! 105: AND_I	and 	%r5, 0x043b, %r19
	.word 0xb009800e  ! 105: AND_R	and 	%r6, %r14, %r24
	.word 0xa800c00d  ! 105: ADD_R	add 	%r3, %r13, %r20
	.word 0xa400eb36  ! 105: ADD_I	add 	%r3, 0x0b36, %r18
	.word 0xa8016f0f  ! 105: ADD_I	add 	%r5, 0x0f0f, %r20
	.word 0xb601a325  ! 105: ADD_I	add 	%r6, 0x0325, %r27
	.word 0xbe09281f  ! 105: AND_I	and 	%r4, 0x081f, %r31
	.word 0xa811000d  ! 105: OR_R	or 	%r4, %r13, %r20
	.word 0xa808e270  ! 105: AND_I	and 	%r3, 0x0270, %r20
	.word 0xac0a2773  ! 105: AND_I	and 	%r8, 0x0773, %r22
	.word 0xb811e51c  ! 105: OR_I	or 	%r7, 0x051c, %r28
	.word 0xa6016c6c  ! 105: ADD_I	add 	%r5, 0x0c6c, %r19
	.word 0xb00a2af4  ! 105: AND_I	and 	%r8, 0x0af4, %r24
	.word 0xb2112b94  ! 105: OR_I	or 	%r4, 0x0b94, %r25
	.word 0xea21aaf4  ! 105: STW_I	stw	%r21, [%r6 + 0x0af4]
	.word 0xfe30e846  ! 105: STH_I	sth	%r31, [%r3 + 0x0846]
	.word 0xe229ee7a  ! 105: STB_I	stb	%r17, [%r7 + 0x0e7a]
	.word 0xe820ef74  ! 105: STW_I	stw	%r20, [%r3 + 0x0f74]
	.word 0xfe31aa5a  ! 105: STH_I	sth	%r31, [%r6 + 0x0a5a]
	.word 0xf47126c0  ! 107: STX_I	stx	%r26, [%r4 + 0x06c0]
	.word 0xa219c00a  ! 108: XOR_R	xor 	%r7, %r10, %r17
	.word 0xec312308  ! 109: STH_I	sth	%r22, [%r4 + 0x0308]
	.word 0xe4a921f1  ! 110: STBA_I	stba	%r18, [%r4 + 0x01f1] %asi
	.word 0xf8410009  ! 111: LDSW_R	ldsw	[%r4 + %r9], %r28
	.word 0xb201400f  ! 111: ADD_R	add 	%r5, %r15, %r25
	.word 0xb4020009  ! 111: ADD_R	add 	%r8, %r9, %r26
	.word 0xb211e610  ! 111: OR_I	or 	%r7, 0x0610, %r25
	bne thr1_loop_8
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_9:
	.word 0xb201400d  ! 119: ADD_R	add 	%r5, %r13, %r25
	.word 0xa8092bf6  ! 119: AND_I	and 	%r4, 0x0bf6, %r20
	.word 0xae11400c  ! 119: OR_R	or 	%r5, %r12, %r23
	.word 0xbc01c00b  ! 119: ADD_R	add 	%r7, %r11, %r30
	.word 0xb008e8cb  ! 119: AND_I	and 	%r3, 0x08cb, %r24
	.word 0xba122b3f  ! 119: OR_I	or 	%r8, 0x0b3f, %r29
	.word 0xa20961a4  ! 119: AND_I	and 	%r5, 0x01a4, %r17
	.word 0xaa112c6f  ! 119: OR_I	or 	%r4, 0x0c6f, %r21
	.word 0xb400c00f  ! 119: ADD_R	add 	%r3, %r15, %r26
	.word 0xaa122199  ! 119: OR_I	or 	%r8, 0x0199, %r21
	.word 0xa409a485  ! 119: AND_I	and 	%r6, 0x0485, %r18
	.word 0xa608c00c  ! 119: AND_R	and 	%r3, %r12, %r19
	.word 0xb612000d  ! 119: OR_R	or 	%r8, %r13, %r27
	.word 0xb0120009  ! 119: OR_R	or 	%r8, %r9, %r24
	.word 0xb011a6bf  ! 119: OR_I	or 	%r6, 0x06bf, %r24
	.word 0xb601800b  ! 119: ADD_R	add 	%r6, %r11, %r27
	.word 0xaa0127ab  ! 119: ADD_I	add 	%r4, 0x07ab, %r21
	.word 0xb2122fcd  ! 119: OR_I	or 	%r8, 0x0fcd, %r25
	.word 0xb209e1a8  ! 119: AND_I	and 	%r7, 0x01a8, %r25
	.word 0xba09000a  ! 119: AND_R	and 	%r4, %r10, %r29
	.word 0xbe016441  ! 119: ADD_I	add 	%r5, 0x0441, %r31
	.word 0xbc09800f  ! 119: AND_R	and 	%r6, %r15, %r30
	.word 0xa8098009  ! 119: AND_R	and 	%r6, %r9, %r20
	.word 0xbe11a870  ! 119: OR_I	or 	%r6, 0x0870, %r31
	.word 0xb600ea96  ! 119: ADD_I	add 	%r3, 0x0a96, %r27
	.word 0xb812000d  ! 119: OR_R	or 	%r8, %r13, %r28
	.word 0xb800e774  ! 119: ADD_I	add 	%r3, 0x0774, %r28
	.word 0xb2098009  ! 119: AND_R	and 	%r6, %r9, %r25
	.word 0xa2012220  ! 119: ADD_I	add 	%r4, 0x0220, %r17
	.word 0xa210e753  ! 119: OR_I	or 	%r3, 0x0753, %r17
	.word 0xbe11800a  ! 119: OR_R	or 	%r6, %r10, %r31
	.word 0xa611400f  ! 119: OR_R	or 	%r5, %r15, %r19
	.word 0xaa0126c3  ! 119: ADD_I	add 	%r4, 0x06c3, %r21
	.word 0xb401c009  ! 119: ADD_R	add 	%r7, %r9, %r26
	.word 0xae012f6c  ! 119: ADD_I	add 	%r4, 0x0f6c, %r23
	.word 0xb801400d  ! 119: ADD_R	add 	%r5, %r13, %r28
	.word 0xb011e9b9  ! 119: OR_I	or 	%r7, 0x09b9, %r24
	.word 0xbe012ec4  ! 119: ADD_I	add 	%r4, 0x0ec4, %r31
	.word 0xae01c00f  ! 119: ADD_R	add 	%r7, %r15, %r23
	.word 0xaa11618f  ! 119: OR_I	or 	%r5, 0x018f, %r21
	.word 0xba10c009  ! 119: OR_R	or 	%r3, %r9, %r29
	.word 0xa809800d  ! 119: AND_R	and 	%r6, %r13, %r20
	.word 0xb801e815  ! 119: ADD_I	add 	%r7, 0x0815, %r28
	.word 0xa601800b  ! 119: ADD_R	add 	%r6, %r11, %r19
	.word 0xb408ed81  ! 119: AND_I	and 	%r3, 0x0d81, %r26
	.word 0xbe11efa9  ! 119: OR_I	or 	%r7, 0x0fa9, %r31
	.word 0xb801a112  ! 119: ADD_I	add 	%r6, 0x0112, %r28
	.word 0xac09c00e  ! 119: AND_R	and 	%r7, %r14, %r22
	.word 0xb208c009  ! 119: AND_R	and 	%r3, %r9, %r25
	.word 0xb8112a94  ! 119: OR_I	or 	%r4, 0x0a94, %r28
	.word 0xb610c00f  ! 119: OR_R	or 	%r3, %r15, %r27
	.word 0xb40966fe  ! 119: AND_I	and 	%r5, 0x06fe, %r26
	.word 0xb012000d  ! 119: OR_R	or 	%r8, %r13, %r24
	.word 0xb80228de  ! 119: ADD_I	add 	%r8, 0x08de, %r28
	.word 0xb80164d2  ! 119: ADD_I	add 	%r5, 0x04d2, %r28
	.word 0xa401e500  ! 119: ADD_I	add 	%r7, 0x0500, %r18
	.word 0xb401218d  ! 119: ADD_I	add 	%r4, 0x018d, %r26
	.word 0xbe09400e  ! 119: AND_R	and 	%r5, %r14, %r31
	.word 0xa609af16  ! 119: AND_I	and 	%r6, 0x0f16, %r19
	.word 0xbc0221e8  ! 119: ADD_I	add 	%r8, 0x01e8, %r30
	.word 0xb201a33f  ! 119: ADD_I	add 	%r6, 0x033f, %r25
	.word 0xb211000c  ! 119: OR_R	or 	%r4, %r12, %r25
	.word 0xa411c00c  ! 119: OR_R	or 	%r7, %r12, %r18
	.word 0xaa122601  ! 119: OR_I	or 	%r8, 0x0601, %r21
	.word 0xac0962cd  ! 119: AND_I	and 	%r5, 0x02cd, %r22
	.word 0xa6096b13  ! 119: AND_I	and 	%r5, 0x0b13, %r19
	.word 0xa401800e  ! 119: ADD_R	add 	%r6, %r14, %r18
	.word 0xa6092b93  ! 119: AND_I	and 	%r4, 0x0b93, %r19
	.word 0xb2122dd7  ! 119: OR_I	or 	%r8, 0x0dd7, %r25
	.word 0xba08c00c  ! 119: AND_R	and 	%r3, %r12, %r29
	.word 0xb801400b  ! 119: ADD_R	add 	%r5, %r11, %r28
	.word 0xa20a000e  ! 119: AND_R	and 	%r8, %r14, %r17
	.word 0xb609000c  ! 119: AND_R	and 	%r4, %r12, %r27
	.word 0xb20a000e  ! 119: AND_R	and 	%r8, %r14, %r25
	.word 0xae112983  ! 119: OR_I	or 	%r4, 0x0983, %r23
	.word 0xa600e66f  ! 119: ADD_I	add 	%r3, 0x066f, %r19
	.word 0xb009a09b  ! 119: AND_I	and 	%r6, 0x009b, %r24
	.word 0xb809800e  ! 119: AND_R	and 	%r6, %r14, %r28
	.word 0xb001e409  ! 119: ADD_I	add 	%r7, 0x0409, %r24
	.word 0xf232220a  ! 119: STH_I	sth	%r25, [%r8 + 0x020a]
	.word 0xf0316560  ! 119: STH_I	sth	%r24, [%r5 + 0x0560]
	.word 0xf82a2572  ! 119: STB_I	stb	%r28, [%r8 + 0x0572]
	.word 0xec322000  ! 119: STH_I	sth	%r22, [%r8 + 0x0000]
	.word 0xf631653e  ! 119: STH_I	sth	%r27, [%r5 + 0x053e]
	.word 0xf821e594  ! 119: STW_I	stw	%r28, [%r7 + 0x0594]
	.word 0xe8216acc  ! 119: STW_I	stw	%r20, [%r5 + 0x0acc]
DC_ERR_5:
!$EV error(1,expr(@VA(.MAIN.DC_ERR_5), 16, 16),2,DC_DATA,28)
	.word 0xfe48e34e  ! 122: LDSB_I	ldsb	[%r3 + 0x034e], %r31
	.word 0xb778040c  ! 122: MOVR_R	move	%r0, %r12, %r27
	.word 0xfa316044  ! 123: STH_I	sth	%r29, [%r5 + 0x0044]
	.word 0xf649e1aa  ! 124: LDSB_I	ldsb	[%r7 + 0x01aa], %r27
	.word 0xa6012c58  ! 124: ADD_I	add 	%r4, 0x0c58, %r19
	.word 0xb011800b  ! 124: OR_R	or 	%r6, %r11, %r24
	.word 0xb011e22a  ! 124: OR_I	or 	%r7, 0x022a, %r24
	bne thr1_loop_9
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_10:
	.word 0xac11c00d  ! 130: OR_R	or 	%r7, %r13, %r22
	.word 0xa8118009  ! 130: OR_R	or 	%r6, %r9, %r20
	.word 0xa409800d  ! 130: AND_R	and 	%r6, %r13, %r18
	.word 0xa409a640  ! 130: AND_I	and 	%r6, 0x0640, %r18
	.word 0xbc01800f  ! 130: ADD_R	add 	%r6, %r15, %r30
	.word 0xb400ef75  ! 130: ADD_I	add 	%r3, 0x0f75, %r26
	.word 0xb201e3de  ! 130: ADD_I	add 	%r7, 0x03de, %r25
	.word 0xb200ecde  ! 130: ADD_I	add 	%r3, 0x0cde, %r25
	.word 0xb810e7c3  ! 130: OR_I	or 	%r3, 0x07c3, %r28
	.word 0xb001edf0  ! 130: ADD_I	add 	%r7, 0x0df0, %r24
	.word 0xa6116665  ! 130: OR_I	or 	%r5, 0x0665, %r19
	.word 0xbc01c00b  ! 130: ADD_R	add 	%r7, %r11, %r30
	.word 0xa612000e  ! 130: OR_R	or 	%r8, %r14, %r19
	.word 0xa211c00a  ! 130: OR_R	or 	%r7, %r10, %r17
	.word 0xa809c00e  ! 130: AND_R	and 	%r7, %r14, %r20
	.word 0xac09af76  ! 130: AND_I	and 	%r6, 0x0f76, %r22
	.word 0xbc09aee7  ! 130: AND_I	and 	%r6, 0x0ee7, %r30
	.word 0xbe01a43a  ! 130: ADD_I	add 	%r6, 0x043a, %r31
	.word 0xac00c00c  ! 130: ADD_R	add 	%r3, %r12, %r22
	.word 0xa611c00c  ! 130: OR_R	or 	%r7, %r12, %r19
	.word 0xa212000c  ! 130: OR_R	or 	%r8, %r12, %r17
	.word 0xa40a0009  ! 130: AND_R	and 	%r8, %r9, %r18
	.word 0xb212000d  ! 130: OR_R	or 	%r8, %r13, %r25
	.word 0xa6012ddf  ! 130: ADD_I	add 	%r4, 0x0ddf, %r19
	.word 0xa200e8c7  ! 130: ADD_I	add 	%r3, 0x08c7, %r17
	.word 0xae01ab76  ! 130: ADD_I	add 	%r6, 0x0b76, %r23
	.word 0xba00e655  ! 130: ADD_I	add 	%r3, 0x0655, %r29
	.word 0xbc01400c  ! 130: ADD_R	add 	%r5, %r12, %r30
	.word 0xb80227ae  ! 130: ADD_I	add 	%r8, 0x07ae, %r28
	.word 0xa809e56e  ! 130: AND_I	and 	%r7, 0x056e, %r20
	.word 0xb00a21be  ! 130: AND_I	and 	%r8, 0x01be, %r24
	.word 0xb4022adf  ! 130: ADD_I	add 	%r8, 0x0adf, %r26
	.word 0xae090009  ! 130: AND_R	and 	%r4, %r9, %r23
	.word 0xb608e440  ! 130: AND_I	and 	%r3, 0x0440, %r27
	.word 0xa4016fc7  ! 130: ADD_I	add 	%r5, 0x0fc7, %r18
	.word 0xa208c00f  ! 130: AND_R	and 	%r3, %r15, %r17
	.word 0xa611a0ae  ! 130: OR_I	or 	%r6, 0x00ae, %r19
	.word 0xba08c00a  ! 130: AND_R	and 	%r3, %r10, %r29
	.word 0xb0092b80  ! 130: AND_I	and 	%r4, 0x0b80, %r24
	.word 0xae11000e  ! 130: OR_R	or 	%r4, %r14, %r23
	.word 0xac01e88d  ! 130: ADD_I	add 	%r7, 0x088d, %r22
	.word 0xa6114009  ! 130: OR_R	or 	%r5, %r9, %r19
	.word 0xb001e424  ! 130: ADD_I	add 	%r7, 0x0424, %r24
	.word 0xb801efa8  ! 130: ADD_I	add 	%r7, 0x0fa8, %r28
	.word 0xac018009  ! 130: ADD_R	add 	%r6, %r9, %r22
	.word 0xb201800b  ! 130: ADD_R	add 	%r6, %r11, %r25
	.word 0xbc0a211f  ! 130: AND_I	and 	%r8, 0x011f, %r30
	.word 0xb408c009  ! 130: AND_R	and 	%r3, %r9, %r26
	.word 0xa211400c  ! 130: OR_R	or 	%r5, %r12, %r17
	.word 0xbc1128ea  ! 130: OR_I	or 	%r4, 0x08ea, %r30
	.word 0xac01243e  ! 130: ADD_I	add 	%r4, 0x043e, %r22
	.word 0xb609aac0  ! 130: AND_I	and 	%r6, 0x0ac0, %r27
	.word 0xbc10e630  ! 130: OR_I	or 	%r3, 0x0630, %r30
	.word 0xac09400c  ! 130: AND_R	and 	%r5, %r12, %r22
	.word 0xbe09adad  ! 130: AND_I	and 	%r6, 0x0dad, %r31
	.word 0xac092ef8  ! 130: AND_I	and 	%r4, 0x0ef8, %r22
	.word 0xa4016d7a  ! 130: ADD_I	add 	%r5, 0x0d7a, %r18
	.word 0xbe10e0c9  ! 130: OR_I	or 	%r3, 0x00c9, %r31
	.word 0xbe122ddf  ! 130: OR_I	or 	%r8, 0x0ddf, %r31
	.word 0xa2122afe  ! 130: OR_I	or 	%r8, 0x0afe, %r17
	.word 0xb210c00b  ! 130: OR_R	or 	%r3, %r11, %r25
	.word 0xac01c00a  ! 130: ADD_R	add 	%r7, %r10, %r22
	.word 0xa20966f7  ! 130: AND_I	and 	%r5, 0x06f7, %r17
	.word 0xa8112504  ! 130: OR_I	or 	%r4, 0x0504, %r20
	.word 0xae00ef0e  ! 130: ADD_I	add 	%r3, 0x0f0e, %r23
	.word 0xba11000b  ! 130: OR_R	or 	%r4, %r11, %r29
	.word 0xb409e74e  ! 130: AND_I	and 	%r7, 0x074e, %r26
	.word 0xbe016edb  ! 130: ADD_I	add 	%r5, 0x0edb, %r31
	.word 0xaa0163fe  ! 130: ADD_I	add 	%r5, 0x03fe, %r21
	.word 0xa409e9ed  ! 130: AND_I	and 	%r7, 0x09ed, %r18
	.word 0xaa08ed8b  ! 130: AND_I	and 	%r3, 0x0d8b, %r21
	.word 0xb8122f57  ! 130: OR_I	or 	%r8, 0x0f57, %r28
	.word 0xb411000c  ! 130: OR_R	or 	%r4, %r12, %r26
	.word 0xa610c00a  ! 130: OR_R	or 	%r3, %r10, %r19
	.word 0xa4118009  ! 130: OR_R	or 	%r6, %r9, %r18
	.word 0xb800e3a8  ! 130: ADD_I	add 	%r3, 0x03a8, %r28
	.word 0xbe0121d6  ! 130: ADD_I	add 	%r4, 0x01d6, %r31
	.word 0xb2114009  ! 130: OR_R	or 	%r5, %r9, %r25
	.word 0xaa11800c  ! 130: OR_R	or 	%r6, %r12, %r21
	.word 0xa201c00c  ! 130: ADD_R	add 	%r7, %r12, %r17
	.word 0xb00a2844  ! 130: AND_I	and 	%r8, 0x0844, %r24
	.word 0xb001af07  ! 130: ADD_I	add 	%r6, 0x0f07, %r24
	.word 0xbe016bdc  ! 130: ADD_I	add 	%r5, 0x0bdc, %r31
	.word 0xb611c00b  ! 130: OR_R	or 	%r7, %r11, %r27
	.word 0xbe09eec6  ! 130: AND_I	and 	%r7, 0x0ec6, %r31
	.word 0xbe01000c  ! 130: ADD_R	add 	%r4, %r12, %r31
	.word 0xac098009  ! 130: AND_R	and 	%r6, %r9, %r22
	.word 0xaa02000d  ! 130: ADD_R	add 	%r8, %r13, %r21
	.word 0xb6020009  ! 130: ADD_R	add 	%r8, %r9, %r27
	.word 0xb20a27c8  ! 130: AND_I	and 	%r8, 0x07c8, %r25
	.word 0xa611000b  ! 130: OR_R	or 	%r4, %r11, %r19
	.word 0xb601e7fa  ! 130: ADD_I	add 	%r7, 0x07fa, %r27
	.word 0xac096b62  ! 130: AND_I	and 	%r5, 0x0b62, %r22
	.word 0xb201282a  ! 130: ADD_I	add 	%r4, 0x082a, %r25
	.word 0xa40a000a  ! 130: AND_R	and 	%r8, %r10, %r18
	.word 0xb6096e3b  ! 130: AND_I	and 	%r5, 0x0e3b, %r27
	.word 0xa210e874  ! 130: OR_I	or 	%r3, 0x0874, %r17
	.word 0xae1121a3  ! 130: OR_I	or 	%r4, 0x01a3, %r23
	.word 0xac01e3fd  ! 130: ADD_I	add 	%r7, 0x03fd, %r22
	.word 0xb212000a  ! 130: OR_R	or 	%r8, %r10, %r25
	.word 0xaa116fd5  ! 130: OR_I	or 	%r5, 0x0fd5, %r21
	.word 0xb2116ac6  ! 130: OR_I	or 	%r5, 0x0ac6, %r25
	.word 0xb812000d  ! 130: OR_R	or 	%r8, %r13, %r28
	.word 0xaa122a58  ! 130: OR_I	or 	%r8, 0x0a58, %r21
	.word 0xa211608f  ! 130: OR_I	or 	%r5, 0x008f, %r17
	.word 0xbc016835  ! 130: ADD_I	add 	%r5, 0x0835, %r30
	.word 0xae012ecd  ! 130: ADD_I	add 	%r4, 0x0ecd, %r23
	.word 0xa802000a  ! 130: ADD_R	add 	%r8, %r10, %r20
	.word 0xb6022d3a  ! 130: ADD_I	add 	%r8, 0x0d3a, %r27
	.word 0xb801c00a  ! 130: ADD_R	add 	%r7, %r10, %r28
	.word 0xb6092ab2  ! 130: AND_I	and 	%r4, 0x0ab2, %r27
	.word 0xb610c00f  ! 130: OR_R	or 	%r3, %r15, %r27
	.word 0xb8112776  ! 130: OR_I	or 	%r4, 0x0776, %r28
	.word 0xa201e9e8  ! 130: ADD_I	add 	%r7, 0x09e8, %r17
	.word 0xa2114009  ! 130: OR_R	or 	%r5, %r9, %r17
	.word 0xae01400b  ! 130: ADD_R	add 	%r5, %r11, %r23
	.word 0xaa11ef90  ! 130: OR_I	or 	%r7, 0x0f90, %r21
	.word 0xb201800f  ! 130: ADD_R	add 	%r6, %r15, %r25
	.word 0xb811c00f  ! 130: OR_R	or 	%r7, %r15, %r28
	.word 0xa411232b  ! 130: OR_I	or 	%r4, 0x032b, %r18
	.word 0xa412000b  ! 130: OR_R	or 	%r8, %r11, %r18
	.word 0xb408c00c  ! 130: AND_R	and 	%r3, %r12, %r26
	.word 0xa411c00e  ! 130: OR_R	or 	%r7, %r14, %r18
	.word 0xae0228b2  ! 130: ADD_I	add 	%r8, 0x08b2, %r23
	.word 0xaa09400e  ! 130: AND_R	and 	%r5, %r14, %r21
	.word 0xa410eabd  ! 130: OR_I	or 	%r3, 0x0abd, %r18
	.word 0xa6012cf9  ! 130: ADD_I	add 	%r4, 0x0cf9, %r19
	.word 0xe228ee84  ! 130: STB_I	stb	%r17, [%r3 + 0x0e84]
	.word 0xfe31e2c0  ! 130: STH_I	sth	%r31, [%r7 + 0x02c0]
	.word 0xec216828  ! 130: STW_I	stw	%r22, [%r5 + 0x0828]
	.word 0xe428ed21  ! 130: STB_I	stb	%r18, [%r3 + 0x0d21]
	.word 0xf4722ac8  ! 130: STX_I	stx	%r26, [%r8 + 0x0ac8]
	.word 0xf231a1f4  ! 131: STH_I	sth	%r25, [%r6 + 0x01f4]
	.word 0xae010045
	.word 0xfc296a8a  ! 133: STB_I	stb	%r30, [%r5 + 0x0a8a]
	.word 0xe470ee10  ! 134: STX_I	stx	%r18, [%r3 + 0x0e10]
	.word 0xaa51ed10  ! 135: UMUL_I	umul 	%r7, 0x0d10, %r21
	.word 0xb201000d  ! 135: ADD_R	add 	%r4, %r13, %r25
	.word 0xb01166f0  ! 135: OR_I	or 	%r5, 0x06f0, %r24
	.word 0xaa092abd  ! 135: AND_I	and 	%r4, 0x0abd, %r21
	bne thr1_loop_10
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_11:
	.word 0xa40a25bd  ! 143: AND_I	and 	%r8, 0x05bd, %r18
	.word 0xb6096c28  ! 143: AND_I	and 	%r5, 0x0c28, %r27
	.word 0xac022c48  ! 143: ADD_I	add 	%r8, 0x0c48, %r22
	.word 0xb000eb58  ! 143: ADD_I	add 	%r3, 0x0b58, %r24
	.word 0xbc00c00a  ! 143: ADD_R	add 	%r3, %r10, %r30
	.word 0xa601c00f  ! 143: ADD_R	add 	%r7, %r15, %r19
	.word 0xbc1121d1  ! 143: OR_I	or 	%r4, 0x01d1, %r30
	.word 0xa400ee3c  ! 143: ADD_I	add 	%r3, 0x0e3c, %r18
	.word 0xb601000e  ! 143: ADD_R	add 	%r4, %r14, %r27
	.word 0xb000e749  ! 143: ADD_I	add 	%r3, 0x0749, %r24
	.word 0xbe122e9d  ! 143: OR_I	or 	%r8, 0x0e9d, %r31
	.word 0xa40162ee  ! 143: ADD_I	add 	%r5, 0x02ee, %r18
	.word 0xa609600d  ! 143: AND_I	and 	%r5, 0x000d, %r19
	.word 0xa809400b  ! 143: AND_R	and 	%r5, %r11, %r20
	.word 0xb001400b  ! 143: ADD_R	add 	%r5, %r11, %r24
	.word 0xa6020009  ! 143: ADD_R	add 	%r8, %r9, %r19
	.word 0xb20165a9  ! 143: ADD_I	add 	%r5, 0x05a9, %r25
	.word 0xaa00e5c9  ! 143: ADD_I	add 	%r3, 0x05c9, %r21
	.word 0xb6012b26  ! 143: ADD_I	add 	%r4, 0x0b26, %r27
	.word 0xaa1165e8  ! 143: OR_I	or 	%r5, 0x05e8, %r21
	.word 0xbc11eb7b  ! 143: OR_I	or 	%r7, 0x0b7b, %r30
	.word 0xae01e163  ! 143: ADD_I	add 	%r7, 0x0163, %r23
	.word 0xaa10ea6c  ! 143: OR_I	or 	%r3, 0x0a6c, %r21
	.word 0xb600c009  ! 143: ADD_R	add 	%r3, %r9, %r27
	.word 0xae09e305  ! 143: AND_I	and 	%r7, 0x0305, %r23
	.word 0xb210efbe  ! 143: OR_I	or 	%r3, 0x0fbe, %r25
	.word 0xb2016ce6  ! 143: ADD_I	add 	%r5, 0x0ce6, %r25
	.word 0xb601acf7  ! 143: ADD_I	add 	%r6, 0x0cf7, %r27
	.word 0xa401aeb0  ! 143: ADD_I	add 	%r6, 0x0eb0, %r18
	.word 0xba09e1b2  ! 143: AND_I	and 	%r7, 0x01b2, %r29
	.word 0xb209ec84  ! 143: AND_I	and 	%r7, 0x0c84, %r25
	.word 0xb811ad88  ! 143: OR_I	or 	%r6, 0x0d88, %r28
	.word 0xbc02269a  ! 143: ADD_I	add 	%r8, 0x069a, %r30
	.word 0xba12000f  ! 143: OR_R	or 	%r8, %r15, %r29
	.word 0xb201800a  ! 143: ADD_R	add 	%r6, %r10, %r25
	.word 0xb400e487  ! 143: ADD_I	add 	%r3, 0x0487, %r26
	.word 0xac09000a  ! 143: AND_R	and 	%r4, %r10, %r22
	.word 0xb000efd0  ! 143: ADD_I	add 	%r3, 0x0fd0, %r24
	.word 0xba01800b  ! 143: ADD_R	add 	%r6, %r11, %r29
	.word 0xb6020009  ! 143: ADD_R	add 	%r8, %r9, %r27
	.word 0xb009ab7f  ! 143: AND_I	and 	%r6, 0x0b7f, %r24
	.word 0xba09400e  ! 143: AND_R	and 	%r5, %r14, %r29
	.word 0xb601800b  ! 143: ADD_R	add 	%r6, %r11, %r27
	.word 0xb008ed5a  ! 143: AND_I	and 	%r3, 0x0d5a, %r24
	.word 0xba09800c  ! 143: AND_R	and 	%r6, %r12, %r29
	.word 0xba09400c  ! 143: AND_R	and 	%r5, %r12, %r29
	.word 0xb408e0a2  ! 143: AND_I	and 	%r3, 0x00a2, %r26
	.word 0xb602000a  ! 143: ADD_R	add 	%r8, %r10, %r27
	.word 0xb009eb43  ! 143: AND_I	and 	%r7, 0x0b43, %r24
	.word 0xb009000d  ! 143: AND_R	and 	%r4, %r13, %r24
	.word 0xa410e8d0  ! 143: OR_I	or 	%r3, 0x08d0, %r18
	.word 0xbc01000a  ! 143: ADD_R	add 	%r4, %r10, %r30
	.word 0xba00e8be  ! 143: ADD_I	add 	%r3, 0x08be, %r29
	.word 0xbe0a000b  ! 143: AND_R	and 	%r8, %r11, %r31
	.word 0xa801000b  ! 143: ADD_R	add 	%r4, %r11, %r20
	.word 0xba09c00b  ! 143: AND_R	and 	%r7, %r11, %r29
	.word 0xa60925fa  ! 143: AND_I	and 	%r4, 0x05fa, %r19
	.word 0xb612000b  ! 143: OR_R	or 	%r8, %r11, %r27
	.word 0xb41167f3  ! 143: OR_I	or 	%r5, 0x07f3, %r26
	.word 0xa8016841  ! 143: ADD_I	add 	%r5, 0x0841, %r20
	.word 0xbe10c00f  ! 143: OR_R	or 	%r3, %r15, %r31
	.word 0xba1161c1  ! 143: OR_I	or 	%r5, 0x01c1, %r29
	.word 0xb009e690  ! 143: AND_I	and 	%r7, 0x0690, %r24
	.word 0xbe00e7fa  ! 143: ADD_I	add 	%r3, 0x07fa, %r31
	.word 0xb600efea  ! 143: ADD_I	add 	%r3, 0x0fea, %r27
	.word 0xb209800b  ! 143: AND_R	and 	%r6, %r11, %r25
	.word 0xbc01eea8  ! 143: ADD_I	add 	%r7, 0x0ea8, %r30
	.word 0xb601e852  ! 143: ADD_I	add 	%r7, 0x0852, %r27
	.word 0xaa120009  ! 143: OR_R	or 	%r8, %r9, %r21
	.word 0xa2020009  ! 143: ADD_R	add 	%r8, %r9, %r17
	.word 0xa811c00d  ! 143: OR_R	or 	%r7, %r13, %r20
	.word 0xb611400c  ! 143: OR_R	or 	%r5, %r12, %r27
	.word 0xb809c00a  ! 143: AND_R	and 	%r7, %r10, %r28
	.word 0xa409228f  ! 143: AND_I	and 	%r4, 0x028f, %r18
	.word 0xa8096d19  ! 143: AND_I	and 	%r5, 0x0d19, %r20
	.word 0xba01244f  ! 143: ADD_I	add 	%r4, 0x044f, %r29
	.word 0xa600e4af  ! 143: ADD_I	add 	%r3, 0x04af, %r19
	.word 0xa6012bf0  ! 143: ADD_I	add 	%r4, 0x0bf0, %r19
	.word 0xbe116a16  ! 143: OR_I	or 	%r5, 0x0a16, %r31
	.word 0xa210c00a  ! 143: OR_R	or 	%r3, %r10, %r17
	.word 0xac098009  ! 143: AND_R	and 	%r6, %r9, %r22
	.word 0xb2020009  ! 143: ADD_R	add 	%r8, %r9, %r25
	.word 0xb2014009  ! 143: ADD_R	add 	%r5, %r9, %r25
	.word 0xb400e1ea  ! 143: ADD_I	add 	%r3, 0x01ea, %r26
	.word 0xa801ec4e  ! 143: ADD_I	add 	%r7, 0x0c4e, %r20
	.word 0xb2096779  ! 143: AND_I	and 	%r5, 0x0779, %r25
	.word 0xb400e926  ! 143: ADD_I	add 	%r3, 0x0926, %r26
	.word 0xfe28e17a  ! 143: STB_I	stb	%r31, [%r3 + 0x017a]
	.word 0xfc20ee24  ! 143: STW_I	stw	%r30, [%r3 + 0x0e24]
	.word 0xe421e0dc  ! 143: STW_I	stw	%r18, [%r7 + 0x00dc]
	.word 0xfe32224c  ! 143: STH_I	sth	%r31, [%r8 + 0x024c]
	.word 0xfe7122b0  ! 143: STX_I	stx	%r31, [%r4 + 0x02b0]
	.word 0xe631231e  ! 143: STH_I	sth	%r19, [%r4 + 0x031e]
	.word 0xf421e500  ! 143: STW_I	stw	%r26, [%r7 + 0x0500]
DC_ERR_9:
!$EV error(1,expr(@VA(.MAIN.DC_ERR_9), 16, 16),2,DC_DATA,19)
	.word 0xee01af70  ! 146: LDUW_I	lduw	[%r6 + 0x0f70], %r23
	.word 0xa830e1a0  ! 146: ORN_I	orn 	%r3, 0x01a0, %r20
	.word 0xf471aa10  ! 147: STX_I	stx	%r26, [%r6 + 0x0a10]
	.word 0xe440e77c  ! 148: LDSW_I	ldsw	[%r3 + 0x077c], %r18
	.word 0xbc00c00c  ! 148: ADD_R	add 	%r3, %r12, %r30
	.word 0xa80161c6  ! 148: ADD_I	add 	%r5, 0x01c6, %r20
	.word 0xb000c00a  ! 148: ADD_R	add 	%r3, %r10, %r24
	bne thr1_loop_11
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_12:
	.word 0xac11800c  ! 156: OR_R	or 	%r6, %r12, %r22
	.word 0xb0112a62  ! 156: OR_I	or 	%r4, 0x0a62, %r24
	.word 0xb6122365  ! 156: OR_I	or 	%r8, 0x0365, %r27
	.word 0xa400e4ae  ! 156: ADD_I	add 	%r3, 0x04ae, %r18
	.word 0xb011800b  ! 156: OR_R	or 	%r6, %r11, %r24
	.word 0xb601a573  ! 156: ADD_I	add 	%r6, 0x0573, %r27
	.word 0xb0098009  ! 156: AND_R	and 	%r6, %r9, %r24
	.word 0xb611a54e  ! 156: OR_I	or 	%r6, 0x054e, %r27
	.word 0xbe0a000f  ! 156: AND_R	and 	%r8, %r15, %r31
	.word 0xb80962b3  ! 156: AND_I	and 	%r5, 0x02b3, %r28
	.word 0xae01400a  ! 156: ADD_R	add 	%r5, %r10, %r23
	.word 0xb80a000f  ! 156: AND_R	and 	%r8, %r15, %r28
	.word 0xaa10eeb2  ! 156: OR_I	or 	%r3, 0x0eb2, %r21
	.word 0xaa016a3c  ! 156: ADD_I	add 	%r5, 0x0a3c, %r21
	.word 0xb610e5c7  ! 156: OR_I	or 	%r3, 0x05c7, %r27
	.word 0xba12000c  ! 156: OR_R	or 	%r8, %r12, %r29
	.word 0xa801688c  ! 156: ADD_I	add 	%r5, 0x088c, %r20
	.word 0xa2094009  ! 156: AND_R	and 	%r5, %r9, %r17
	.word 0xbe01ee3b  ! 156: ADD_I	add 	%r7, 0x0e3b, %r31
	.word 0xaa116349  ! 156: OR_I	or 	%r5, 0x0349, %r21
	.word 0xa20a0009  ! 156: AND_R	and 	%r8, %r9, %r17
	.word 0xae01800c  ! 156: ADD_R	add 	%r6, %r12, %r23
	.word 0xba0a000d  ! 156: AND_R	and 	%r8, %r13, %r29
	.word 0xb400e39e  ! 156: ADD_I	add 	%r3, 0x039e, %r26
	.word 0xaa09a936  ! 156: AND_I	and 	%r6, 0x0936, %r21
	.word 0xb801000c  ! 156: ADD_R	add 	%r4, %r12, %r28
	.word 0xa609654c  ! 156: AND_I	and 	%r5, 0x054c, %r19
	.word 0xb601a488  ! 156: ADD_I	add 	%r6, 0x0488, %r27
	.word 0xb008ea6a  ! 156: AND_I	and 	%r3, 0x0a6a, %r24
	.word 0xbc01c00e  ! 156: ADD_R	add 	%r7, %r14, %r30
	.word 0xb60929f2  ! 156: AND_I	and 	%r4, 0x09f2, %r27
	.word 0xac0164e1  ! 156: ADD_I	add 	%r5, 0x04e1, %r22
	.word 0xbe09400e  ! 156: AND_R	and 	%r5, %r14, %r31
	.word 0xba092272  ! 156: AND_I	and 	%r4, 0x0272, %r29
	.word 0xa601c009  ! 156: ADD_R	add 	%r7, %r9, %r19
	.word 0xb0096942  ! 156: AND_I	and 	%r5, 0x0942, %r24
	.word 0xac11800a  ! 156: OR_R	or 	%r6, %r10, %r22
	.word 0xa211400a  ! 156: OR_R	or 	%r5, %r10, %r17
	.word 0xac09800e  ! 156: AND_R	and 	%r6, %r14, %r22
	.word 0xb808c009  ! 156: AND_R	and 	%r3, %r9, %r28
	.word 0xa810c00c  ! 156: OR_R	or 	%r3, %r12, %r20
	.word 0xae01000f  ! 156: ADD_R	add 	%r4, %r15, %r23
	.word 0xac0127de  ! 156: ADD_I	add 	%r4, 0x07de, %r22
	.word 0xb408c00c  ! 156: AND_R	and 	%r3, %r12, %r26
	.word 0xaa09400d  ! 156: AND_R	and 	%r5, %r13, %r21
	.word 0xb009ee62  ! 156: AND_I	and 	%r7, 0x0e62, %r24
	.word 0xac10e4c7  ! 156: OR_I	or 	%r3, 0x04c7, %r22
	.word 0xba08c00a  ! 156: AND_R	and 	%r3, %r10, %r29
	.word 0xba090009  ! 156: AND_R	and 	%r4, %r9, %r29
	.word 0xae12000b  ! 156: OR_R	or 	%r8, %r11, %r23
	.word 0xbc09efd1  ! 156: AND_I	and 	%r7, 0x0fd1, %r30
	.word 0xae0169ae  ! 156: ADD_I	add 	%r5, 0x09ae, %r23
	.word 0xaa10c00d  ! 156: OR_R	or 	%r3, %r13, %r21
	.word 0xb809217b  ! 156: AND_I	and 	%r4, 0x017b, %r28
	.word 0xae00c00b  ! 156: ADD_R	add 	%r3, %r11, %r23
	.word 0xac09ef8d  ! 156: AND_I	and 	%r7, 0x0f8d, %r22
	.word 0xbe10c00a  ! 156: OR_R	or 	%r3, %r10, %r31
	.word 0xbc11c00b  ! 156: OR_R	or 	%r7, %r11, %r30
	.word 0xa801af59  ! 156: ADD_I	add 	%r6, 0x0f59, %r20
	.word 0xa801000b  ! 156: ADD_R	add 	%r4, %r11, %r20
	.word 0xbc11ee42  ! 156: OR_I	or 	%r7, 0x0e42, %r30
	.word 0xae09631e  ! 156: AND_I	and 	%r5, 0x031e, %r23
	.word 0xbc0124f7  ! 156: ADD_I	add 	%r4, 0x04f7, %r30
	.word 0xbe11af50  ! 156: OR_I	or 	%r6, 0x0f50, %r31
	.word 0xa21164aa  ! 156: OR_I	or 	%r5, 0x04aa, %r17
	.word 0xb211adc4  ! 156: OR_I	or 	%r6, 0x0dc4, %r25
	.word 0xaa1166bd  ! 156: OR_I	or 	%r5, 0x06bd, %r21
	.word 0xa211a5a4  ! 156: OR_I	or 	%r6, 0x05a4, %r17
	.word 0xb410c00f  ! 156: OR_R	or 	%r3, %r15, %r26
	.word 0xac11c00e  ! 156: OR_R	or 	%r7, %r14, %r22
	.word 0xa6094009  ! 156: AND_R	and 	%r5, %r9, %r19
	.word 0xa6016c3a  ! 156: ADD_I	add 	%r5, 0x0c3a, %r19
	.word 0xaa09800c  ! 156: AND_R	and 	%r6, %r12, %r21
	.word 0xa401abe8  ! 156: ADD_I	add 	%r6, 0x0be8, %r18
	.word 0xbc01a2c7  ! 156: ADD_I	add 	%r6, 0x02c7, %r30
	.word 0xaa09c00b  ! 156: AND_R	and 	%r7, %r11, %r21
	.word 0xbe01000a  ! 156: ADD_R	add 	%r4, %r10, %r31
	.word 0xac096016  ! 156: AND_I	and 	%r5, 0x0016, %r22
	.word 0xb611ecfb  ! 156: OR_I	or 	%r7, 0x0cfb, %r27
	.word 0xb60a000c  ! 156: AND_R	and 	%r8, %r12, %r27
	.word 0xa40169ce  ! 156: ADD_I	add 	%r5, 0x09ce, %r18
	.word 0xac096099  ! 156: AND_I	and 	%r5, 0x0099, %r22
	.word 0xb210c00f  ! 156: OR_R	or 	%r3, %r15, %r25
	.word 0xa20a240d  ! 156: AND_I	and 	%r8, 0x040d, %r17
	.word 0xbc0a0009  ! 156: AND_R	and 	%r8, %r9, %r30
	.word 0xb812000d  ! 156: OR_R	or 	%r8, %r13, %r28
	.word 0xa612000a  ! 156: OR_R	or 	%r8, %r10, %r19
	.word 0xa208c00c  ! 156: AND_R	and 	%r3, %r12, %r17
	.word 0xba02247c  ! 156: ADD_I	add 	%r8, 0x047c, %r29
	.word 0xb809400e  ! 156: AND_R	and 	%r5, %r14, %r28
	.word 0xaa00e050  ! 156: ADD_I	add 	%r3, 0x0050, %r21
	.word 0xbc01c00e  ! 156: ADD_R	add 	%r7, %r14, %r30
	.word 0xbe10c00a  ! 156: OR_R	or 	%r3, %r10, %r31
	.word 0xae012e3b  ! 156: ADD_I	add 	%r4, 0x0e3b, %r23
	.word 0xb208ee5d  ! 156: AND_I	and 	%r3, 0x0e5d, %r25
	.word 0xb802000a  ! 156: ADD_R	add 	%r8, %r10, %r28
	.word 0xa401e929  ! 156: ADD_I	add 	%r7, 0x0929, %r18
	.word 0xae12232a  ! 156: OR_I	or 	%r8, 0x032a, %r23
	.word 0xaa09242b  ! 156: AND_I	and 	%r4, 0x042b, %r21
	.word 0xb20a2068  ! 156: AND_I	and 	%r8, 0x0068, %r25
	.word 0xa811400b  ! 156: OR_R	or 	%r5, %r11, %r20
	.word 0xb001c00c  ! 156: ADD_R	add 	%r7, %r12, %r24
	.word 0xa8092776  ! 156: AND_I	and 	%r4, 0x0776, %r20
	.word 0xbc112f47  ! 156: OR_I	or 	%r4, 0x0f47, %r30
	.word 0xb009400f  ! 156: AND_R	and 	%r5, %r15, %r24
	.word 0xa40961f2  ! 156: AND_I	and 	%r5, 0x01f2, %r18
	.word 0xa411a113  ! 156: OR_I	or 	%r6, 0x0113, %r18
	.word 0xb601000d  ! 156: ADD_R	add 	%r4, %r13, %r27
	.word 0xa808e6a2  ! 156: AND_I	and 	%r3, 0x06a2, %r20
	.word 0xa80965bc  ! 156: AND_I	and 	%r5, 0x05bc, %r20
	.word 0xb801000a  ! 156: ADD_R	add 	%r4, %r10, %r28
	.word 0xa6016fe6  ! 156: ADD_I	add 	%r5, 0x0fe6, %r19
	.word 0xa409800e  ! 156: AND_R	and 	%r6, %r14, %r18
	.word 0xa609c00e  ! 156: AND_R	and 	%r7, %r14, %r19
	.word 0xae11000b  ! 156: OR_R	or 	%r4, %r11, %r23
	.word 0xae01a06e  ! 156: ADD_I	add 	%r6, 0x006e, %r23
	.word 0xa8090009  ! 156: AND_R	and 	%r4, %r9, %r20
	.word 0xa210e226  ! 156: OR_I	or 	%r3, 0x0226, %r17
	.word 0xbc08c00d  ! 156: AND_R	and 	%r3, %r13, %r30
	.word 0xa6022f80  ! 156: ADD_I	add 	%r8, 0x0f80, %r19
	.word 0xae10ea91  ! 156: OR_I	or 	%r3, 0x0a91, %r23
	.word 0xa200c009  ! 156: ADD_R	add 	%r3, %r9, %r17
	.word 0xb40a000b  ! 156: AND_R	and 	%r8, %r11, %r26
	.word 0xb211681a  ! 156: OR_I	or 	%r5, 0x081a, %r25
	.word 0xb011400c  ! 156: OR_R	or 	%r5, %r12, %r24
	.word 0xa41123c3  ! 156: OR_I	or 	%r4, 0x03c3, %r18
	.word 0xb801a869  ! 156: ADD_I	add 	%r6, 0x0869, %r28
	.word 0xa800c00a  ! 156: ADD_R	add 	%r3, %r10, %r20
	.word 0xa209400d  ! 156: AND_R	and 	%r5, %r13, %r17
	.word 0xb402000c  ! 156: ADD_R	add 	%r8, %r12, %r26
	.word 0xbe116335  ! 156: OR_I	or 	%r5, 0x0335, %r31
	.word 0xbe00c00b  ! 156: ADD_R	add 	%r3, %r11, %r31
	.word 0xb6116ee4  ! 156: OR_I	or 	%r5, 0x0ee4, %r27
	.word 0xb200c00f  ! 156: ADD_R	add 	%r3, %r15, %r25
	.word 0xae01000d  ! 156: ADD_R	add 	%r4, %r13, %r23
	.word 0xbc10c00f  ! 156: OR_R	or 	%r3, %r15, %r30
	.word 0xac09000a  ! 156: AND_R	and 	%r4, %r10, %r22
	.word 0xb409e9d0  ! 156: AND_I	and 	%r7, 0x09d0, %r26
	.word 0xac01c009  ! 156: ADD_R	add 	%r7, %r9, %r22
	.word 0xb011637e  ! 156: OR_I	or 	%r5, 0x037e, %r24
	.word 0xa410c00e  ! 156: OR_R	or 	%r3, %r14, %r18
	.word 0xa811000e  ! 156: OR_R	or 	%r4, %r14, %r20
	.word 0xb411e467  ! 156: OR_I	or 	%r7, 0x0467, %r26
	.word 0xb401c00b  ! 156: ADD_R	add 	%r7, %r11, %r26
	.word 0xb611e109  ! 156: OR_I	or 	%r7, 0x0109, %r27
	.word 0xba11400c  ! 156: OR_R	or 	%r5, %r12, %r29
	.word 0xa21160ea  ! 156: OR_I	or 	%r5, 0x00ea, %r17
	.word 0xa411aa50  ! 156: OR_I	or 	%r6, 0x0a50, %r18
	.word 0xb209400f  ! 156: AND_R	and 	%r5, %r15, %r25
	.word 0xbe11800f  ! 156: OR_R	or 	%r6, %r15, %r31
	.word 0xaa01a3d1  ! 156: ADD_I	add 	%r6, 0x03d1, %r21
	.word 0xb411000a  ! 156: OR_R	or 	%r4, %r10, %r26
	.word 0xa801000f  ! 156: ADD_R	add 	%r4, %r15, %r20
	.word 0xb809400e  ! 156: AND_R	and 	%r5, %r14, %r28
	.word 0xbe01c00e  ! 156: ADD_R	add 	%r7, %r14, %r31
	.word 0xb601000b  ! 156: ADD_R	add 	%r4, %r11, %r27
	.word 0xa609ea58  ! 156: AND_I	and 	%r7, 0x0a58, %r19
	.word 0xb210e9e5  ! 156: OR_I	or 	%r3, 0x09e5, %r25
	.word 0xbe12000d  ! 156: OR_R	or 	%r8, %r13, %r31
	.word 0xae122949  ! 156: OR_I	or 	%r8, 0x0949, %r23
	.word 0xb209215f  ! 156: AND_I	and 	%r4, 0x015f, %r25
	.word 0xba0a2165  ! 156: AND_I	and 	%r8, 0x0165, %r29
	.word 0xba01400d  ! 156: ADD_R	add 	%r5, %r13, %r29
	.word 0xac09000f  ! 156: AND_R	and 	%r4, %r15, %r22
	.word 0xae0228ee  ! 156: ADD_I	add 	%r8, 0x08ee, %r23
	.word 0xbe09400d  ! 156: AND_R	and 	%r5, %r13, %r31
	.word 0xaa01a5b2  ! 156: ADD_I	add 	%r6, 0x05b2, %r21
	.word 0xaa092602  ! 156: AND_I	and 	%r4, 0x0602, %r21
	.word 0xbe0a000d  ! 156: AND_R	and 	%r8, %r13, %r31
	.word 0xa600c00b  ! 156: ADD_R	add 	%r3, %r11, %r19
	.word 0xa21161b1  ! 156: OR_I	or 	%r5, 0x01b1, %r17
	.word 0xb009400f  ! 156: AND_R	and 	%r5, %r15, %r24
	.word 0xb011800b  ! 156: OR_R	or 	%r6, %r11, %r24
	.word 0xb011400b  ! 156: OR_R	or 	%r5, %r11, %r24
	.word 0xb608c00a  ! 156: AND_R	and 	%r3, %r10, %r27
	.word 0xaa01c009  ! 156: ADD_R	add 	%r7, %r9, %r21
	.word 0xa208e9d9  ! 156: AND_I	and 	%r3, 0x09d9, %r17
	.word 0xa2010009  ! 156: ADD_R	add 	%r4, %r9, %r17
	.word 0xbc0a28c6  ! 156: AND_I	and 	%r8, 0x08c6, %r30
	.word 0xa409000e  ! 156: AND_R	and 	%r4, %r14, %r18
	.word 0xa4016b4c  ! 156: ADD_I	add 	%r5, 0x0b4c, %r18
	.word 0xa811400b  ! 156: OR_R	or 	%r5, %r11, %r20
	.word 0xbc01e47d  ! 156: ADD_I	add 	%r7, 0x047d, %r30
	.word 0xa801c00a  ! 156: ADD_R	add 	%r7, %r10, %r20
	.word 0xa4016b4c  ! 156: ADD_I	add 	%r5, 0x0b4c, %r18
	.word 0xb609800b  ! 156: AND_R	and 	%r6, %r11, %r27
	.word 0xae11400c  ! 156: OR_R	or 	%r5, %r12, %r23
	.word 0xb801000d  ! 156: ADD_R	add 	%r4, %r13, %r28
	.word 0xba0929f0  ! 156: AND_I	and 	%r4, 0x09f0, %r29
	.word 0xaa01c00f  ! 156: ADD_R	add 	%r7, %r15, %r21
	.word 0xb600e0bd  ! 156: ADD_I	add 	%r3, 0x00bd, %r27
	.word 0xb2012244  ! 156: ADD_I	add 	%r4, 0x0244, %r25
	.word 0xae112c88  ! 156: OR_I	or 	%r4, 0x0c88, %r23
	.word 0xaa022f55  ! 156: ADD_I	add 	%r8, 0x0f55, %r21
	.word 0xb209000f  ! 156: AND_R	and 	%r4, %r15, %r25
	.word 0xb801000e  ! 156: ADD_R	add 	%r4, %r14, %r28
	.word 0xb600e928  ! 156: ADD_I	add 	%r3, 0x0928, %r27
	.word 0xbc092ce5  ! 156: AND_I	and 	%r4, 0x0ce5, %r30
	.word 0xa2096902  ! 156: AND_I	and 	%r5, 0x0902, %r17
	.word 0xbc10c00e  ! 156: OR_R	or 	%r3, %r14, %r30
	.word 0xb400e24f  ! 156: ADD_I	add 	%r3, 0x024f, %r26
	.word 0xbe10ea46  ! 156: OR_I	or 	%r3, 0x0a46, %r31
	.word 0xac01e4fe  ! 156: ADD_I	add 	%r7, 0x04fe, %r22
	.word 0xbe116a7e  ! 156: OR_I	or 	%r5, 0x0a7e, %r31
	.word 0xbe00c00a  ! 156: ADD_R	add 	%r3, %r10, %r31
	.word 0xaa110009  ! 156: OR_R	or 	%r4, %r9, %r21
	.word 0xb4022481  ! 156: ADD_I	add 	%r8, 0x0481, %r26
	.word 0xbe10ef27  ! 156: OR_I	or 	%r3, 0x0f27, %r31
	.word 0xa601800a  ! 156: ADD_R	add 	%r6, %r10, %r19
	.word 0xb208c00b  ! 156: AND_R	and 	%r3, %r11, %r25
	.word 0xb608c00a  ! 156: AND_R	and 	%r3, %r10, %r27
	.word 0xb801e329  ! 156: ADD_I	add 	%r7, 0x0329, %r28
	.word 0xa611610d  ! 156: OR_I	or 	%r5, 0x010d, %r19
	.word 0xb611ef5a  ! 156: OR_I	or 	%r7, 0x0f5a, %r27
	.word 0xa609c00d  ! 156: AND_R	and 	%r7, %r13, %r19
	.word 0xb809ead0  ! 156: AND_I	and 	%r7, 0x0ad0, %r28
	.word 0xaa01292d  ! 156: ADD_I	add 	%r4, 0x092d, %r21
	.word 0xb8018009  ! 156: ADD_R	add 	%r6, %r9, %r28
	.word 0xae0128e0  ! 156: ADD_I	add 	%r4, 0x08e0, %r23
	.word 0xae09aaff  ! 156: AND_I	and 	%r6, 0x0aff, %r23
	.word 0xae10e4ea  ! 156: OR_I	or 	%r3, 0x04ea, %r23
	.word 0xb21164c6  ! 156: OR_I	or 	%r5, 0x04c6, %r25
	.word 0xb609e179  ! 156: AND_I	and 	%r7, 0x0179, %r27
	.word 0xe621a328  ! 156: STW_I	stw	%r19, [%r6 + 0x0328]
	.word 0xfc21e748  ! 156: STW_I	stw	%r30, [%r7 + 0x0748]
	.word 0xe2212c6c  ! 156: STW_I	stw	%r17, [%r4 + 0x0c6c]
	.word 0xee71a760  ! 156: STX_I	stx	%r23, [%r6 + 0x0760]
	.word 0xf2716fe0  ! 156: STX_I	stx	%r25, [%r5 + 0x0fe0]
	.word 0xf221aca8  ! 156: STW_I	stw	%r25, [%r6 + 0x0ca8]
	.word 0xfc712530  ! 156: STX_I	stx	%r30, [%r4 + 0x0530]
	.word 0xee02000a  ! 157: LDUW_R	lduw	[%r8 + %r10], %r23
	.word 0xf6296a3f  ! 158: STB_I	stb	%r27, [%r5 + 0x0a3f]
	.word 0xfa122818  ! 159: LDUH_I	lduh	[%r8 + 0x0818], %r29
	.word 0xbe01400d  ! 159: ADD_R	add 	%r5, %r13, %r31
	.word 0xb41229ea  ! 159: OR_I	or 	%r8, 0x09ea, %r26
	.word 0xaa112404  ! 159: OR_I	or 	%r4, 0x0404, %r21
	bne thr1_loop_12
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_13:
	.word 0xbe014009  ! 165: ADD_R	add 	%r5, %r9, %r31
	.word 0xbc09000b  ! 165: AND_R	and 	%r4, %r11, %r30
	.word 0xb801a182  ! 165: ADD_I	add 	%r6, 0x0182, %r28
	.word 0xa608c00c  ! 165: AND_R	and 	%r3, %r12, %r19
	.word 0xb400ea63  ! 165: ADD_I	add 	%r3, 0x0a63, %r26
	.word 0xb808ea50  ! 165: AND_I	and 	%r3, 0x0a50, %r28
	.word 0xb60a000f  ! 165: AND_R	and 	%r8, %r15, %r27
	.word 0xba09800a  ! 165: AND_R	and 	%r6, %r10, %r29
	.word 0xba1160ba  ! 165: OR_I	or 	%r5, 0x00ba, %r29
	.word 0xa408c00c  ! 165: AND_R	and 	%r3, %r12, %r18
	.word 0xa401c00b  ! 165: ADD_R	add 	%r7, %r11, %r18
	.word 0xbe09a2c0  ! 165: AND_I	and 	%r6, 0x02c0, %r31
	.word 0xb009000d  ! 165: AND_R	and 	%r4, %r13, %r24
	.word 0xb009800d  ! 165: AND_R	and 	%r6, %r13, %r24
	.word 0xb2094009  ! 165: AND_R	and 	%r5, %r9, %r25
	.word 0xba0922be  ! 165: AND_I	and 	%r4, 0x02be, %r29
	.word 0xa2092ecb  ! 165: AND_I	and 	%r4, 0x0ecb, %r17
	.word 0xa601af2a  ! 165: ADD_I	add 	%r6, 0x0f2a, %r19
	.word 0xbc10e3a1  ! 165: OR_I	or 	%r3, 0x03a1, %r30
	.word 0xa6112c87  ! 165: OR_I	or 	%r4, 0x0c87, %r19
	.word 0xa8112822  ! 165: OR_I	or 	%r4, 0x0822, %r20
	.word 0xbc01c00a  ! 165: ADD_R	add 	%r7, %r10, %r30
	.word 0xa601400b  ! 165: ADD_R	add 	%r5, %r11, %r19
	.word 0xb410e540  ! 165: OR_I	or 	%r3, 0x0540, %r26
	.word 0xac00e074  ! 165: ADD_I	add 	%r3, 0x0074, %r22
	.word 0xb00a2579  ! 165: AND_I	and 	%r8, 0x0579, %r24
	.word 0xa609400e  ! 165: AND_R	and 	%r5, %r14, %r19
	.word 0xaa11c00c  ! 165: OR_R	or 	%r7, %r12, %r21
	.word 0xba10c00f  ! 165: OR_R	or 	%r3, %r15, %r29
	.word 0xa6122b34  ! 165: OR_I	or 	%r8, 0x0b34, %r19
	.word 0xa611e9e2  ! 165: OR_I	or 	%r7, 0x09e2, %r19
	.word 0xb012000f  ! 165: OR_R	or 	%r8, %r15, %r24
	.word 0xa609400a  ! 165: AND_R	and 	%r5, %r10, %r19
	.word 0xba02000c  ! 165: ADD_R	add 	%r8, %r12, %r29
	.word 0xae1124be  ! 165: OR_I	or 	%r4, 0x04be, %r23
	.word 0xb209800a  ! 165: AND_R	and 	%r6, %r10, %r25
	.word 0xb2090009  ! 165: AND_R	and 	%r4, %r9, %r25
	.word 0xbc11800b  ! 165: OR_R	or 	%r6, %r11, %r30
	.word 0xb40a25ea  ! 165: AND_I	and 	%r8, 0x05ea, %r26
	.word 0xb4016f5c  ! 165: ADD_I	add 	%r5, 0x0f5c, %r26
	.word 0xbe09a38d  ! 165: AND_I	and 	%r6, 0x038d, %r31
	.word 0xac08eef3  ! 165: AND_I	and 	%r3, 0x0ef3, %r22
	.word 0xbe01e094  ! 165: ADD_I	add 	%r7, 0x0094, %r31
	.word 0xbe01226c  ! 165: ADD_I	add 	%r4, 0x026c, %r31
	.word 0xb011000c  ! 165: OR_R	or 	%r4, %r12, %r24
	.word 0xb812000b  ! 165: OR_R	or 	%r8, %r11, %r28
	.word 0xac10c00d  ! 165: OR_R	or 	%r3, %r13, %r22
	.word 0xaa08ef11  ! 165: AND_I	and 	%r3, 0x0f11, %r21
	.word 0xbc09000a  ! 165: AND_R	and 	%r4, %r10, %r30
	.word 0xa21221a3  ! 165: OR_I	or 	%r8, 0x01a3, %r17
	.word 0xb6090009  ! 165: AND_R	and 	%r4, %r9, %r27
	.word 0xae01ed1a  ! 165: ADD_I	add 	%r7, 0x0d1a, %r23
	.word 0xa200c00a  ! 165: ADD_R	add 	%r3, %r10, %r17
	.word 0xaa01e110  ! 165: ADD_I	add 	%r7, 0x0110, %r21
	.word 0xbe09000e  ! 165: AND_R	and 	%r4, %r14, %r31
	.word 0xb20925e5  ! 165: AND_I	and 	%r4, 0x05e5, %r25
	.word 0xaa0a0009  ! 165: AND_R	and 	%r8, %r9, %r21
	.word 0xa211c00b  ! 165: OR_R	or 	%r7, %r11, %r17
	.word 0xac110009  ! 165: OR_R	or 	%r4, %r9, %r22
	.word 0xbc09800c  ! 165: AND_R	and 	%r6, %r12, %r30
	.word 0xb4116154  ! 165: OR_I	or 	%r5, 0x0154, %r26
	.word 0xbc01800f  ! 165: ADD_R	add 	%r6, %r15, %r30
	.word 0xb609400d  ! 165: AND_R	and 	%r5, %r13, %r27
	.word 0xaa12000a  ! 165: OR_R	or 	%r8, %r10, %r21
	.word 0xa601000e  ! 165: ADD_R	add 	%r4, %r14, %r19
	.word 0xb6022904  ! 165: ADD_I	add 	%r8, 0x0904, %r27
	.word 0xb0096cf5  ! 165: AND_I	and 	%r5, 0x0cf5, %r24
	.word 0xb201e725  ! 165: ADD_I	add 	%r7, 0x0725, %r25
	.word 0xba08c00e  ! 165: AND_R	and 	%r3, %r14, %r29
	.word 0xaa12000c  ! 165: OR_R	or 	%r8, %r12, %r21
	.word 0xb810e5bb  ! 165: OR_I	or 	%r3, 0x05bb, %r28
	.word 0xa40a292f  ! 165: AND_I	and 	%r8, 0x092f, %r18
	.word 0xac092380  ! 165: AND_I	and 	%r4, 0x0380, %r22
	.word 0xae01400a  ! 165: ADD_R	add 	%r5, %r10, %r23
	.word 0xb001234b  ! 165: ADD_I	add 	%r4, 0x034b, %r24
	.word 0xbc02000a  ! 165: ADD_R	add 	%r8, %r10, %r30
	.word 0xa808e41d  ! 165: AND_I	and 	%r3, 0x041d, %r20
	.word 0xa400e6b8  ! 165: ADD_I	add 	%r3, 0x06b8, %r18
	.word 0xbc0a2e14  ! 165: AND_I	and 	%r8, 0x0e14, %r30
	.word 0xb011400e  ! 165: OR_R	or 	%r5, %r14, %r24
	.word 0xb211aaf0  ! 165: OR_I	or 	%r6, 0x0af0, %r25
	.word 0xb401e056  ! 165: ADD_I	add 	%r7, 0x0056, %r26
	.word 0xb009a52f  ! 165: AND_I	and 	%r6, 0x052f, %r24
	.word 0xac01613b  ! 165: ADD_I	add 	%r5, 0x013b, %r22
	.word 0xaa09660d  ! 165: AND_I	and 	%r5, 0x060d, %r21
	.word 0xa401af94  ! 165: ADD_I	add 	%r6, 0x0f94, %r18
	.word 0xba01c00c  ! 165: ADD_R	add 	%r7, %r12, %r29
	.word 0xb2022a24  ! 165: ADD_I	add 	%r8, 0x0a24, %r25
	.word 0xac01800a  ! 165: ADD_R	add 	%r6, %r10, %r22
	.word 0xba092592  ! 165: AND_I	and 	%r4, 0x0592, %r29
	.word 0xb60929ae  ! 165: AND_I	and 	%r4, 0x09ae, %r27
	.word 0xaa11a9ce  ! 165: OR_I	or 	%r6, 0x09ce, %r21
	.word 0xa809c00a  ! 165: AND_R	and 	%r7, %r10, %r20
	.word 0xaa0a000c  ! 165: AND_R	and 	%r8, %r12, %r21
	.word 0xbe11c009  ! 165: OR_R	or 	%r7, %r9, %r31
	.word 0xac11400d  ! 165: OR_R	or 	%r5, %r13, %r22
	.word 0xba01800a  ! 165: ADD_R	add 	%r6, %r10, %r29
	.word 0xa611800e  ! 165: OR_R	or 	%r6, %r14, %r19
	.word 0xa610efd7  ! 165: OR_I	or 	%r3, 0x0fd7, %r19
	.word 0xa6112645  ! 165: OR_I	or 	%r4, 0x0645, %r19
	.word 0xaa09000f  ! 165: AND_R	and 	%r4, %r15, %r21
	.word 0xae09000e  ! 165: AND_R	and 	%r4, %r14, %r23
	.word 0xaa0968a5  ! 165: AND_I	and 	%r5, 0x08a5, %r21
	.word 0xa8114009  ! 165: OR_R	or 	%r5, %r9, %r20
	.word 0xb412247d  ! 165: OR_I	or 	%r8, 0x047d, %r26
	.word 0xb402246f  ! 165: ADD_I	add 	%r8, 0x046f, %r26
	.word 0xb609c00d  ! 165: AND_R	and 	%r7, %r13, %r27
	.word 0xb000c00f  ! 165: ADD_R	add 	%r3, %r15, %r24
	.word 0xa200c00a  ! 165: ADD_R	add 	%r3, %r10, %r17
	.word 0xa2022589  ! 165: ADD_I	add 	%r8, 0x0589, %r17
	.word 0xaa11000b  ! 165: OR_R	or 	%r4, %r11, %r21
	.word 0xaa122514  ! 165: OR_I	or 	%r8, 0x0514, %r21
	.word 0xac114009  ! 165: OR_R	or 	%r5, %r9, %r22
	.word 0xb208c00d  ! 165: AND_R	and 	%r3, %r13, %r25
	.word 0xbe01a297  ! 165: ADD_I	add 	%r6, 0x0297, %r31
	.word 0xb611c00d  ! 165: OR_R	or 	%r7, %r13, %r27
	.word 0xa809000d  ! 165: AND_R	and 	%r4, %r13, %r20
	.word 0xb611400f  ! 165: OR_R	or 	%r5, %r15, %r27
	.word 0xba096577  ! 165: AND_I	and 	%r5, 0x0577, %r29
	.word 0xac00c00c  ! 165: ADD_R	add 	%r3, %r12, %r22
	.word 0xac09e280  ! 165: AND_I	and 	%r7, 0x0280, %r22
	.word 0xbe09400f  ! 165: AND_R	and 	%r5, %r15, %r31
	.word 0xbc01ae30  ! 165: ADD_I	add 	%r6, 0x0e30, %r30
	.word 0xba1160dc  ! 165: OR_I	or 	%r5, 0x00dc, %r29
	.word 0xa2010009  ! 165: ADD_R	add 	%r4, %r9, %r17
	.word 0xbe10c00c  ! 165: OR_R	or 	%r3, %r12, %r31
	.word 0xac11c00e  ! 165: OR_R	or 	%r7, %r14, %r22
	.word 0xb401ac5a  ! 165: ADD_I	add 	%r6, 0x0c5a, %r26
	.word 0xb801e5b1  ! 165: ADD_I	add 	%r7, 0x05b1, %r28
	.word 0xba01000b  ! 165: ADD_R	add 	%r4, %r11, %r29
	.word 0xb408e747  ! 165: AND_I	and 	%r3, 0x0747, %r26
	.word 0xb209000e  ! 165: AND_R	and 	%r4, %r14, %r25
	.word 0xb6096fc8  ! 165: AND_I	and 	%r5, 0x0fc8, %r27
	.word 0xb209800d  ! 165: AND_R	and 	%r6, %r13, %r25
	.word 0xa610e242  ! 165: OR_I	or 	%r3, 0x0242, %r19
	.word 0xb40a22d4  ! 165: AND_I	and 	%r8, 0x02d4, %r26
	.word 0xa409000d  ! 165: AND_R	and 	%r4, %r13, %r18
	.word 0xb209400c  ! 165: AND_R	and 	%r5, %r12, %r25
	.word 0xa408e25e  ! 165: AND_I	and 	%r3, 0x025e, %r18
	.word 0xbc0924c4  ! 165: AND_I	and 	%r4, 0x04c4, %r30
	.word 0xb2098009  ! 165: AND_R	and 	%r6, %r9, %r25
	.word 0xa209000a  ! 165: AND_R	and 	%r4, %r10, %r17
	.word 0xb60a000a  ! 165: AND_R	and 	%r8, %r10, %r27
	.word 0xa2110009  ! 165: OR_R	or 	%r4, %r9, %r17
	.word 0xbe11c00e  ! 165: OR_R	or 	%r7, %r14, %r31
	.word 0xaa118009  ! 165: OR_R	or 	%r6, %r9, %r21
	.word 0xb000ec02  ! 165: ADD_I	add 	%r3, 0x0c02, %r24
	.word 0xbc00c00f  ! 165: ADD_R	add 	%r3, %r15, %r30
	.word 0xb0112078  ! 165: OR_I	or 	%r4, 0x0078, %r24
	.word 0xae01ea25  ! 165: ADD_I	add 	%r7, 0x0a25, %r23
	.word 0xbe02000b  ! 165: ADD_R	add 	%r8, %r11, %r31
	.word 0xa411400f  ! 165: OR_R	or 	%r5, %r15, %r18
	.word 0xb609e1b4  ! 165: AND_I	and 	%r7, 0x01b4, %r27
	.word 0xb0122ae5  ! 165: OR_I	or 	%r8, 0x0ae5, %r24
	.word 0xb2022d9e  ! 165: ADD_I	add 	%r8, 0x0d9e, %r25
	.word 0xb01220b9  ! 165: OR_I	or 	%r8, 0x00b9, %r24
	.word 0xb6096f76  ! 165: AND_I	and 	%r5, 0x0f76, %r27
	.word 0xac09400b  ! 165: AND_R	and 	%r5, %r11, %r22
	.word 0xac01ae74  ! 165: ADD_I	add 	%r6, 0x0e74, %r22
	.word 0xa800c00c  ! 165: ADD_R	add 	%r3, %r12, %r20
	.word 0xb609efaf  ! 165: AND_I	and 	%r7, 0x0faf, %r27
	.word 0xa408c00c  ! 165: AND_R	and 	%r3, %r12, %r18
	.word 0xa6094009  ! 165: AND_R	and 	%r5, %r9, %r19
	.word 0xb0016b9f  ! 165: ADD_I	add 	%r5, 0x0b9f, %r24
	.word 0xb208eb45  ! 165: AND_I	and 	%r3, 0x0b45, %r25
	.word 0xba096b0d  ! 165: AND_I	and 	%r5, 0x0b0d, %r29
	.word 0xa6016887  ! 165: ADD_I	add 	%r5, 0x0887, %r19
	.word 0xb411400b  ! 165: OR_R	or 	%r5, %r11, %r26
	.word 0xa4016437  ! 165: ADD_I	add 	%r5, 0x0437, %r18
	.word 0xac11400c  ! 165: OR_R	or 	%r5, %r12, %r22
	.word 0xb40223bf  ! 165: ADD_I	add 	%r8, 0x03bf, %r26
	.word 0xa610e4ff  ! 165: OR_I	or 	%r3, 0x04ff, %r19
	.word 0xa8012366  ! 165: ADD_I	add 	%r4, 0x0366, %r20
	.word 0xaa0a000c  ! 165: AND_R	and 	%r8, %r12, %r21
	.word 0xae01ae56  ! 165: ADD_I	add 	%r6, 0x0e56, %r23
	.word 0xb011000f  ! 165: OR_R	or 	%r4, %r15, %r24
	.word 0xaa01ab39  ! 165: ADD_I	add 	%r6, 0x0b39, %r21
	.word 0xa610ee82  ! 165: OR_I	or 	%r3, 0x0e82, %r19
	.word 0xbe08eda8  ! 165: AND_I	and 	%r3, 0x0da8, %r31
	.word 0xba01800c  ! 165: ADD_R	add 	%r6, %r12, %r29
	.word 0xa808efd8  ! 165: AND_I	and 	%r3, 0x0fd8, %r20
	.word 0xb011400e  ! 165: OR_R	or 	%r5, %r14, %r24
	.word 0xbe012fbc  ! 165: ADD_I	add 	%r4, 0x0fbc, %r31
	.word 0xb2012528  ! 165: ADD_I	add 	%r4, 0x0528, %r25
	.word 0xb009a66d  ! 165: AND_I	and 	%r6, 0x066d, %r24
	.word 0xa611a18b  ! 165: OR_I	or 	%r6, 0x018b, %r19
	.word 0xac11000c  ! 165: OR_R	or 	%r4, %r12, %r22
	.word 0xac016f70  ! 165: ADD_I	add 	%r5, 0x0f70, %r22
	.word 0xac10ef22  ! 165: OR_I	or 	%r3, 0x0f22, %r22
	.word 0xba11e117  ! 165: OR_I	or 	%r7, 0x0117, %r29
	.word 0xb808c00c  ! 165: AND_R	and 	%r3, %r12, %r28
	.word 0xf0716ad8  ! 165: STX_I	stx	%r24, [%r5 + 0x0ad8]
	.word 0xe620ed7c  ! 165: STW_I	stw	%r19, [%r3 + 0x0d7c]
	.word 0xe4212d50  ! 165: STW_I	stw	%r18, [%r4 + 0x0d50]
	.word 0xee29609f  ! 165: STB_I	stb	%r23, [%r5 + 0x009f]
	.word 0xe420e13c  ! 165: STW_I	stw	%r18, [%r3 + 0x013c]
IRF_CE_1:
!$EV error(1,expr(@VA(.MAIN.IRF_CE_1), 16, 16), 1,IRF,ce,63,x, x,x,x, x,x,x)
!$EV error(1,expr(@VA(.MAIN.IRF_CE_1), 16, 16), 3,IRF,ce,60,x, x,x,x, x,x,x)
	.word 0xec21adb8  ! 167: STW_I	stw	%r22, [%r6 + 0x0db8]
	.word 0xae010045
	.word 0xfe71ada0  ! 169: STX_I	stx	%r31, [%r6 + 0x0da0]
	.word 0xf620e454  ! 170: STW_I	stw	%r27, [%r3 + 0x0454]
	.word 0x12800003  ! 171: BNE	bne  	<label_0x3>
	.word 0xbc11c00a  ! 171: OR_R	or 	%r7, %r10, %r30
	.word 0xbc022ee0  ! 171: ADD_I	add 	%r8, 0x0ee0, %r30
	.word 0xb8096749  ! 171: AND_I	and 	%r5, 0x0749, %r28
	bne thr1_loop_13
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_14:
	.word 0xb809c00b  ! 177: AND_R	and 	%r7, %r11, %r28
	.word 0xbc11400d  ! 177: OR_R	or 	%r5, %r13, %r30
	.word 0xa211400d  ! 177: OR_R	or 	%r5, %r13, %r17
	.word 0xbe11c009  ! 177: OR_R	or 	%r7, %r9, %r31
	.word 0xa6016a64  ! 177: ADD_I	add 	%r5, 0x0a64, %r19
	.word 0xb8092bbb  ! 177: AND_I	and 	%r4, 0x0bbb, %r28
	.word 0xb808c00c  ! 177: AND_R	and 	%r3, %r12, %r28
	.word 0xa6012bc1  ! 177: ADD_I	add 	%r4, 0x0bc1, %r19
	.word 0xa608c00c  ! 177: AND_R	and 	%r3, %r12, %r19
	.word 0xb80a2683  ! 177: AND_I	and 	%r8, 0x0683, %r28
	.word 0xa2096ee0  ! 177: AND_I	and 	%r5, 0x0ee0, %r17
	.word 0xb20123bf  ! 177: ADD_I	add 	%r4, 0x03bf, %r25
	.word 0xb201c009  ! 177: ADD_R	add 	%r7, %r9, %r25
	.word 0xbc0a000f  ! 177: AND_R	and 	%r8, %r15, %r30
	.word 0xb010c00f  ! 177: OR_R	or 	%r3, %r15, %r24
	.word 0xa6012675  ! 177: ADD_I	add 	%r4, 0x0675, %r19
	.word 0xa4012714  ! 177: ADD_I	add 	%r4, 0x0714, %r18
	.word 0xba02000e  ! 177: ADD_R	add 	%r8, %r14, %r29
	.word 0xa202000c  ! 177: ADD_R	add 	%r8, %r12, %r17
	.word 0xa400c00f  ! 177: ADD_R	add 	%r3, %r15, %r18
	.word 0xb809c00e  ! 177: AND_R	and 	%r7, %r14, %r28
	.word 0xa20a28d4  ! 177: AND_I	and 	%r8, 0x08d4, %r17
	.word 0xb811c00d  ! 177: OR_R	or 	%r7, %r13, %r28
	.word 0xa801800a  ! 177: ADD_R	add 	%r6, %r10, %r20
	.word 0xac11000d  ! 177: OR_R	or 	%r4, %r13, %r22
	.word 0xaa0a2e2d  ! 177: AND_I	and 	%r8, 0x0e2d, %r21
	.word 0xae09800e  ! 177: AND_R	and 	%r6, %r14, %r23
	.word 0xae00eb84  ! 177: ADD_I	add 	%r3, 0x0b84, %r23
	.word 0xa4092642  ! 177: AND_I	and 	%r4, 0x0642, %r18
	.word 0xb209400b  ! 177: AND_R	and 	%r5, %r11, %r25
	.word 0xb2114009  ! 177: OR_R	or 	%r5, %r9, %r25
	.word 0xa80a000d  ! 177: AND_R	and 	%r8, %r13, %r20
	.word 0xb809000b  ! 177: AND_R	and 	%r4, %r11, %r28
	.word 0xbe11000a  ! 177: OR_R	or 	%r4, %r10, %r31
	.word 0xa212000b  ! 177: OR_R	or 	%r8, %r11, %r17
	.word 0xa801400e  ! 177: ADD_R	add 	%r5, %r14, %r20
	.word 0xb201a9ad  ! 177: ADD_I	add 	%r6, 0x09ad, %r25
	.word 0xaa122220  ! 177: OR_I	or 	%r8, 0x0220, %r21
	.word 0xb60964f5  ! 177: AND_I	and 	%r5, 0x04f5, %r27
	.word 0xa608ebe6  ! 177: AND_I	and 	%r3, 0x0be6, %r19
	.word 0xa200e28c  ! 177: ADD_I	add 	%r3, 0x028c, %r17
	.word 0xb609c00d  ! 177: AND_R	and 	%r7, %r13, %r27
	.word 0xa6016158  ! 177: ADD_I	add 	%r5, 0x0158, %r19
	.word 0xba116cf8  ! 177: OR_I	or 	%r5, 0x0cf8, %r29
	.word 0xb40a2320  ! 177: AND_I	and 	%r8, 0x0320, %r26
	.word 0xb801629f  ! 177: ADD_I	add 	%r5, 0x029f, %r28
	.word 0xa609ef2d  ! 177: AND_I	and 	%r7, 0x0f2d, %r19
	.word 0xb408c00c  ! 177: AND_R	and 	%r3, %r12, %r26
	.word 0xb00a000a  ! 177: AND_R	and 	%r8, %r10, %r24
	.word 0xbe092f50  ! 177: AND_I	and 	%r4, 0x0f50, %r31
	.word 0xb2016f0e  ! 177: ADD_I	add 	%r5, 0x0f0e, %r25
	.word 0xb811000e  ! 177: OR_R	or 	%r4, %r14, %r28
	.word 0xb40a000b  ! 177: AND_R	and 	%r8, %r11, %r26
	.word 0xa612000e  ! 177: OR_R	or 	%r8, %r14, %r19
	.word 0xb410eb33  ! 177: OR_I	or 	%r3, 0x0b33, %r26
	.word 0xa601c00c  ! 177: ADD_R	add 	%r7, %r12, %r19
	.word 0xa4116c83  ! 177: OR_I	or 	%r5, 0x0c83, %r18
	.word 0xb40167d6  ! 177: ADD_I	add 	%r5, 0x07d6, %r26
	.word 0xba09a121  ! 177: AND_I	and 	%r6, 0x0121, %r29
	.word 0xae022655  ! 177: ADD_I	add 	%r8, 0x0655, %r23
	.word 0xae122fe8  ! 177: OR_I	or 	%r8, 0x0fe8, %r23
	.word 0xbe09e21b  ! 177: AND_I	and 	%r7, 0x021b, %r31
	.word 0xae10c00e  ! 177: OR_R	or 	%r3, %r14, %r23
	.word 0xa209a7b3  ! 177: AND_I	and 	%r6, 0x07b3, %r17
	.word 0xbe01000b  ! 177: ADD_R	add 	%r4, %r11, %r31
	.word 0xb411216b  ! 177: OR_I	or 	%r4, 0x016b, %r26
	.word 0xac092ff8  ! 177: AND_I	and 	%r4, 0x0ff8, %r22
	.word 0xb010c00a  ! 177: OR_R	or 	%r3, %r10, %r24
	.word 0xac10c00e  ! 177: OR_R	or 	%r3, %r14, %r22
	.word 0xb811400b  ! 177: OR_R	or 	%r5, %r11, %r28
	.word 0xa810c00e  ! 177: OR_R	or 	%r3, %r14, %r20
	.word 0xa80163d0  ! 177: ADD_I	add 	%r5, 0x03d0, %r20
	.word 0xa801400d  ! 177: ADD_R	add 	%r5, %r13, %r20
	.word 0xb601a783  ! 177: ADD_I	add 	%r6, 0x0783, %r27
	.word 0xb60a000e  ! 177: AND_R	and 	%r8, %r14, %r27
	.word 0xac01650f  ! 177: ADD_I	add 	%r5, 0x050f, %r22
	.word 0xa608c009  ! 177: AND_R	and 	%r3, %r9, %r19
	.word 0xae116cdb  ! 177: OR_I	or 	%r5, 0x0cdb, %r23
	.word 0xb401e468  ! 177: ADD_I	add 	%r7, 0x0468, %r26
	.word 0xba0a2fd9  ! 177: AND_I	and 	%r8, 0x0fd9, %r29
	.word 0xaa110009  ! 177: OR_R	or 	%r4, %r9, %r21
	.word 0xb20a000d  ! 177: AND_R	and 	%r8, %r13, %r25
	.word 0xa809ed33  ! 177: AND_I	and 	%r7, 0x0d33, %r20
	.word 0xae01000b  ! 177: ADD_R	add 	%r4, %r11, %r23
	.word 0xa409c00f  ! 177: AND_R	and 	%r7, %r15, %r18
	.word 0xac01000c  ! 177: ADD_R	add 	%r4, %r12, %r22
	.word 0xb408e3b7  ! 177: AND_I	and 	%r3, 0x03b7, %r26
	.word 0xb011e677  ! 177: OR_I	or 	%r7, 0x0677, %r24
	.word 0xb410e719  ! 177: OR_I	or 	%r3, 0x0719, %r26
	.word 0xaa12000d  ! 177: OR_R	or 	%r8, %r13, %r21
	.word 0xa60920d1  ! 177: AND_I	and 	%r4, 0x00d1, %r19
	.word 0xa200ee70  ! 177: ADD_I	add 	%r3, 0x0e70, %r17
	.word 0xa8092ebc  ! 177: AND_I	and 	%r4, 0x0ebc, %r20
	.word 0xb0110009  ! 177: OR_R	or 	%r4, %r9, %r24
	.word 0xb808e264  ! 177: AND_I	and 	%r3, 0x0264, %r28
	.word 0xa809c00e  ! 177: AND_R	and 	%r7, %r14, %r20
	.word 0xb011e0a4  ! 177: OR_I	or 	%r7, 0x00a4, %r24
	.word 0xa811400a  ! 177: OR_R	or 	%r5, %r10, %r20
	.word 0xaa02000a  ! 177: ADD_R	add 	%r8, %r10, %r21
	.word 0xac11800e  ! 177: OR_R	or 	%r6, %r14, %r22
	.word 0xba11c00f  ! 177: OR_R	or 	%r7, %r15, %r29
	.word 0xae08c00b  ! 177: AND_R	and 	%r3, %r11, %r23
	.word 0xb801ed87  ! 177: ADD_I	add 	%r7, 0x0d87, %r28
	.word 0xa609800a  ! 177: AND_R	and 	%r6, %r10, %r19
	.word 0xba01c009  ! 177: ADD_R	add 	%r7, %r9, %r29
	.word 0xb009c00f  ! 177: AND_R	and 	%r7, %r15, %r24
	.word 0xbc096393  ! 177: AND_I	and 	%r5, 0x0393, %r30
	.word 0xa801400a  ! 177: ADD_R	add 	%r5, %r10, %r20
	.word 0xa4116541  ! 177: OR_I	or 	%r5, 0x0541, %r18
	.word 0xae116b78  ! 177: OR_I	or 	%r5, 0x0b78, %r23
	.word 0xba11000e  ! 177: OR_R	or 	%r4, %r14, %r29
	.word 0xb412000d  ! 177: OR_R	or 	%r8, %r13, %r26
	.word 0xa201c00f  ! 177: ADD_R	add 	%r7, %r15, %r17
	.word 0xb609400f  ! 177: AND_R	and 	%r5, %r15, %r27
	.word 0xa811000b  ! 177: OR_R	or 	%r4, %r11, %r20
	.word 0xb009000d  ! 177: AND_R	and 	%r4, %r13, %r24
	.word 0xbe10e04f  ! 177: OR_I	or 	%r3, 0x004f, %r31
	.word 0xac11e4ed  ! 177: OR_I	or 	%r7, 0x04ed, %r22
	.word 0xb810ec27  ! 177: OR_I	or 	%r3, 0x0c27, %r28
	.word 0xaa0221bd  ! 177: ADD_I	add 	%r8, 0x01bd, %r21
	.word 0xa209c00d  ! 177: AND_R	and 	%r7, %r13, %r17
	.word 0xaa122910  ! 177: OR_I	or 	%r8, 0x0910, %r21
	.word 0xb601ac91  ! 177: ADD_I	add 	%r6, 0x0c91, %r27
	.word 0xa60a20ad  ! 177: AND_I	and 	%r8, 0x00ad, %r19
	.word 0xaa02000e  ! 177: ADD_R	add 	%r8, %r14, %r21
	.word 0xba11400b  ! 177: OR_R	or 	%r5, %r11, %r29
	.word 0xb609c00c  ! 177: AND_R	and 	%r7, %r12, %r27
	.word 0xac11a454  ! 177: OR_I	or 	%r6, 0x0454, %r22
	.word 0xba0229de  ! 177: ADD_I	add 	%r8, 0x09de, %r29
	.word 0xae11a637  ! 177: OR_I	or 	%r6, 0x0637, %r23
	.word 0xaa122a57  ! 177: OR_I	or 	%r8, 0x0a57, %r21
	.word 0xbe09800f  ! 177: AND_R	and 	%r6, %r15, %r31
	.word 0xb411800c  ! 177: OR_R	or 	%r6, %r12, %r26
	.word 0xb201a71e  ! 177: ADD_I	add 	%r6, 0x071e, %r25
	.word 0xb611266e  ! 177: OR_I	or 	%r4, 0x066e, %r27
	.word 0xb40a2d27  ! 177: AND_I	and 	%r8, 0x0d27, %r26
	.word 0xa6096dd8  ! 177: AND_I	and 	%r5, 0x0dd8, %r19
	.word 0xb2118009  ! 177: OR_R	or 	%r6, %r9, %r25
	.word 0xb6092c6e  ! 177: AND_I	and 	%r4, 0x0c6e, %r27
	.word 0xbc10e680  ! 177: OR_I	or 	%r3, 0x0680, %r30
	.word 0xa210e9d6  ! 177: OR_I	or 	%r3, 0x09d6, %r17
	.word 0xb810e6df  ! 177: OR_I	or 	%r3, 0x06df, %r28
	.word 0xbc1225af  ! 177: OR_I	or 	%r8, 0x05af, %r30
	.word 0xa60a2df3  ! 177: AND_I	and 	%r8, 0x0df3, %r19
	.word 0xa201e7fc  ! 177: ADD_I	add 	%r7, 0x07fc, %r17
	.word 0xbc00c00e  ! 177: ADD_R	add 	%r3, %r14, %r30
	.word 0xae11400a  ! 177: OR_R	or 	%r5, %r10, %r23
	.word 0xb001e61a  ! 177: ADD_I	add 	%r7, 0x061a, %r24
	.word 0xbe01000c  ! 177: ADD_R	add 	%r4, %r12, %r31
	.word 0xae11e6c0  ! 177: OR_I	or 	%r7, 0x06c0, %r23
	.word 0xa409a628  ! 177: AND_I	and 	%r6, 0x0628, %r18
	.word 0xa410c009  ! 177: OR_R	or 	%r3, %r9, %r18
	.word 0xb4022c9c  ! 177: ADD_I	add 	%r8, 0x0c9c, %r26
	.word 0xaa11ec54  ! 177: OR_I	or 	%r7, 0x0c54, %r21
	.word 0xba11c00e  ! 177: OR_R	or 	%r7, %r14, %r29
	.word 0xb01160a7  ! 177: OR_I	or 	%r5, 0x00a7, %r24
	.word 0xba0a2e9f  ! 177: AND_I	and 	%r8, 0x0e9f, %r29
	.word 0xa20165c4  ! 177: ADD_I	add 	%r5, 0x05c4, %r17
	.word 0xb211ab42  ! 177: OR_I	or 	%r6, 0x0b42, %r25
	.word 0xbc11a955  ! 177: OR_I	or 	%r6, 0x0955, %r30
	.word 0xba09e74d  ! 177: AND_I	and 	%r7, 0x074d, %r29
	.word 0xa601400c  ! 177: ADD_R	add 	%r5, %r12, %r19
	.word 0xaa096a91  ! 177: AND_I	and 	%r5, 0x0a91, %r21
	.word 0xb60a000f  ! 177: AND_R	and 	%r8, %r15, %r27
	.word 0xa409000b  ! 177: AND_R	and 	%r4, %r11, %r18
	.word 0xac01c00e  ! 177: ADD_R	add 	%r7, %r14, %r22
	.word 0xbe0a000f  ! 177: AND_R	and 	%r8, %r15, %r31
	.word 0xa40a000b  ! 177: AND_R	and 	%r8, %r11, %r18
	.word 0xa809000c  ! 177: AND_R	and 	%r4, %r12, %r20
	.word 0xaa012a67  ! 177: ADD_I	add 	%r4, 0x0a67, %r21
	.word 0xba11eca0  ! 177: OR_I	or 	%r7, 0x0ca0, %r29
	.word 0xb209a414  ! 177: AND_I	and 	%r6, 0x0414, %r25
	.word 0xbe116c2d  ! 177: OR_I	or 	%r5, 0x0c2d, %r31
	.word 0xb411c00d  ! 177: OR_R	or 	%r7, %r13, %r26
	.word 0xb611e351  ! 177: OR_I	or 	%r7, 0x0351, %r27
	.word 0xb001800b  ! 177: ADD_R	add 	%r6, %r11, %r24
	.word 0xb211a236  ! 177: OR_I	or 	%r6, 0x0236, %r25
	.word 0xb000c00c  ! 177: ADD_R	add 	%r3, %r12, %r24
	.word 0xbe0163b9  ! 177: ADD_I	add 	%r5, 0x03b9, %r31
	.word 0xbc0169c4  ! 177: ADD_I	add 	%r5, 0x09c4, %r30
	.word 0xb001657e  ! 177: ADD_I	add 	%r5, 0x057e, %r24
	.word 0xa411000b  ! 177: OR_R	or 	%r4, %r11, %r18
	.word 0xb210c00c  ! 177: OR_R	or 	%r3, %r12, %r25
	.word 0xa2110009  ! 177: OR_R	or 	%r4, %r9, %r17
	.word 0xb200e38a  ! 177: ADD_I	add 	%r3, 0x038a, %r25
	.word 0xae122bdc  ! 177: OR_I	or 	%r8, 0x0bdc, %r23
	.word 0xae11c009  ! 177: OR_R	or 	%r7, %r9, %r23
	.word 0xb61220f0  ! 177: OR_I	or 	%r8, 0x00f0, %r27
	.word 0xaa120009  ! 177: OR_R	or 	%r8, %r9, %r21
	.word 0xb609400b  ! 177: AND_R	and 	%r5, %r11, %r27
	.word 0xbc01000d  ! 177: ADD_R	add 	%r4, %r13, %r30
	.word 0xe4312d54  ! 177: STH_I	sth	%r18, [%r4 + 0x0d54]
	.word 0xf821e334  ! 177: STW_I	stw	%r28, [%r7 + 0x0334]
	.word 0xec296adb  ! 177: STB_I	stb	%r22, [%r5 + 0x0adb]
	.word 0xe429e942  ! 177: STB_I	stb	%r18, [%r7 + 0x0942]
	.word 0xfa316d56  ! 177: STH_I	sth	%r29, [%r5 + 0x0d56]
	.word 0xfc31ab70  ! 178: STH_I	sth	%r30, [%r6 + 0x0b70]
	.word 0xa531100d  ! 179: SRLX_R	srlx	%r4, %r13, %r18
	.word 0xfc22260c  ! 180: STW_I	stw	%r30, [%r8 + 0x060c]
	.word 0xf9212828  ! 181: STF_I	st	%f28, [0x0828, %r4]
	setx  0x0000000000000050, %r16, %r11
	.word 0xb600c009  ! 182: ADD_R	add 	%r3, %r9, %r27
	.word 0xae016961  ! 182: ADD_I	add 	%r5, 0x0961, %r23
	.word 0xaa10c009  ! 182: OR_R	or 	%r3, %r9, %r21
	bne thr1_loop_14
	subcc %g1, 0x1, %g1
!Hi Prashant: store_chunk_1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr1_loop_15:
	.word 0xac11c00a  ! 188: OR_R	or 	%r7, %r10, %r22
	.word 0xb211400e  ! 188: OR_R	or 	%r5, %r14, %r25
	.word 0xbe01ee08  ! 188: ADD_I	add 	%r7, 0x0e08, %r31
	.word 0xb600e44d  ! 188: ADD_I	add 	%r3, 0x044d, %r27
	.word 0xba00c00b  ! 188: ADD_R	add 	%r3, %r11, %r29
	.word 0xae10c00a  ! 188: OR_R	or 	%r3, %r10, %r23
	.word 0xa809800f  ! 188: AND_R	and 	%r6, %r15, %r20
	.word 0xb201800d  ! 188: ADD_R	add 	%r6, %r13, %r25
	.word 0xb2112d4d  ! 188: OR_I	or 	%r4, 0x0d4d, %r25
	.word 0xac12000d  ! 188: OR_R	or 	%r8, %r13, %r22
	.word 0xae09000a  ! 188: AND_R	and 	%r4, %r10, %r23
	.word 0xa400e87c  ! 188: ADD_I	add 	%r3, 0x087c, %r18
	.word 0xac1121cf  ! 188: OR_I	or 	%r4, 0x01cf, %r22
	.word 0xb00a000a  ! 188: AND_R	and 	%r8, %r10, %r24
	.word 0xb210c00b  ! 188: OR_R	or 	%r3, %r11, %r25
	.word 0xa20a2016  ! 188: AND_I	and 	%r8, 0x0016, %r17
	.word 0xb011000c  ! 188: OR_R	or 	%r4, %r12, %r24
	.word 0xa6122a8b  ! 188: OR_I	or 	%r8, 0x0a8b, %r19
	.word 0xbe096591  ! 188: AND_I	and 	%r5, 0x0591, %r31
	.word 0xb8012e08  ! 188: ADD_I	add 	%r4, 0x0e08, %r28
	.word 0xba09a92e  ! 188: AND_I	and 	%r6, 0x092e, %r29
	.word 0xbc122b96  ! 188: OR_I	or 	%r8, 0x0b96, %r30
	.word 0xa4012c7c  ! 188: ADD_I	add 	%r4, 0x0c7c, %r18
	.word 0xa8020009  ! 188: ADD_R	add 	%r8, %r9, %r20
	.word 0xa20965f4  ! 188: AND_I	and 	%r5, 0x05f4, %r17
	.word 0xae08e5c2  ! 188: AND_I	and 	%r3, 0x05c2, %r23
	.word 0xa608ed42  ! 188: AND_I	and 	%r3, 0x0d42, %r19
	.word 0xa201aa82  ! 188: ADD_I	add 	%r6, 0x0a82, %r17
	.word 0xbe09800d  ! 188: AND_R	and 	%r6, %r13, %r31
	.word 0xa401c00a  ! 188: ADD_R	add 	%r7, %r10, %r18
	.word 0xbc08c00f  ! 188: AND_R	and 	%r3, %r15, %r30
	.word 0xb601400a  ! 188: ADD_R	add 	%r5, %r10, %r27
	.word 0xb208e136  ! 188: AND_I	and 	%r3, 0x0136, %r25
	.word 0xae09e2c1  ! 188: AND_I	and 	%r7, 0x02c1, %r23
	.word 0xa201c00d  ! 188: ADD_R	add 	%r7, %r13, %r17
	.word 0xae09e055  ! 188: AND_I	and 	%r7, 0x0055, %r23
	.word 0xae11000c  ! 188: OR_R	or 	%r4, %r12, %r23
	.word 0xb401c00d  ! 188: ADD_R	add 	%r7, %r13, %r26
	.word 0xa811e00f  ! 188: OR_I	or 	%r7, 0x000f, %r20
	.word 0xbe09400e  ! 188: AND_R	and 	%r5, %r14, %r31
	.word 0xbe092b3c  ! 188: AND_I	and 	%r4, 0x0b3c, %r31
	.word 0xa800ed37  ! 188: ADD_I	add 	%r3, 0x0d37, %r20
	.word 0xbc10c00f  ! 188: OR_R	or 	%r3, %r15, %r30
	.word 0xac12000e  ! 188: OR_R	or 	%r8, %r14, %r22
	.word 0xac0a000c  ! 188: AND_R	and 	%r8, %r12, %r22
	.word 0xac096836  ! 188: AND_I	and 	%r5, 0x0836, %r22
	.word 0xaa11c00b  ! 188: OR_R	or 	%r7, %r11, %r21
	.word 0xba09400c  ! 188: AND_R	and 	%r5, %r12, %r29
	.word 0xbc11400d  ! 188: OR_R	or 	%r5, %r13, %r30
	.word 0xb801a521  ! 188: ADD_I	add 	%r6, 0x0521, %r28
	.word 0xba114009  ! 188: OR_R	or 	%r5, %r9, %r29
	.word 0xb001c00f  ! 188: ADD_R	add 	%r7, %r15, %r24
	.word 0xb4112d3a  ! 188: OR_I	or 	%r4, 0x0d3a, %r26
	.word 0xa811800c  ! 188: OR_R	or 	%r6, %r12, %r20
	.word 0xbc0a2955  ! 188: AND_I	and 	%r8, 0x0955, %r30
	.word 0xaa09e038  ! 188: AND_I	and 	%r7, 0x0038, %r21
	.word 0xa209252d  ! 188: AND_I	and 	%r4, 0x052d, %r17
	.word 0xaa092abc  ! 188: AND_I	and 	%r4, 0x0abc, %r21
	.word 0xa211800e  ! 188: OR_R	or 	%r6, %r14, %r17
	.word 0xa60a000b  ! 188: AND_R	and 	%r8, %r11, %r19
	.word 0xb8122c92  ! 188: OR_I	or 	%r8, 0x0c92, %r28
	.word 0xaa01a503  ! 188: ADD_I	add 	%r6, 0x0503, %r21
	.word 0xaa08ebd7  ! 188: AND_I	and 	%r3, 0x0bd7, %r21
	.word 0xa2092621  ! 188: AND_I	and 	%r4, 0x0621, %r17
	.word 0xb011c009  ! 188: OR_R	or 	%r7, %r9, %r24
	.word 0xba11c00d  ! 188: OR_R	or 	%r7, %r13, %r29
	.word 0xb00a000c  ! 188: AND_R	and 	%r8, %r12, %r24
	.word 0xbe11800c  ! 188: OR_R	or 	%r6, %r12, %r31
	.word 0xaa09c00e  ! 188: AND_R	and 	%r7, %r14, %r21
	.word 0xb400c00a  ! 188: ADD_R	add 	%r3, %r10, %r26
	.word 0xbc08c00b  ! 188: AND_R	and 	%r3, %r11, %r30
	.word 0xa210c009  ! 188: OR_R	or 	%r3, %r9, %r17
	.word 0xae012b3d  ! 188: ADD_I	add 	%r4, 0x0b3d, %r23
	.word 0xb809c00e  ! 188: AND_R	and 	%r7, %r14, %r28
	.word 0xac00c00c  ! 188: ADD_R	add 	%r3, %r12, %r22
	.word 0xb411c009  ! 188: OR_R	or 	%r7, %r9, %r26
	.word 0xb011c00d  ! 188: OR_R	or 	%r7, %r13, %r24
	.word 0xaa01c00b  ! 188: ADD_R	add 	%r7, %r11, %r21
	.word 0xa408c00d  ! 188: AND_R	and 	%r3, %r13, %r18
	.word 0xb411e91d  ! 188: OR_I	or 	%r7, 0x091d, %r26
	.word 0xaa10ef4c  ! 188: OR_I	or 	%r3, 0x0f4c, %r21
	.word 0xba09c009  ! 188: AND_R	and 	%r7, %r9, %r29
	.word 0xbc116907  ! 188: OR_I	or 	%r5, 0x0907, %r30
	.word 0xbc08e474  ! 188: AND_I	and 	%r3, 0x0474, %r30
	.word 0xbe02000c  ! 188: ADD_R	add 	%r8, %r12, %r31
	.word 0xa811e89e  ! 188: OR_I	or 	%r7, 0x089e, %r20
	.word 0xa811c00a  ! 188: OR_R	or 	%r7, %r10, %r20
	.word 0xbc11abfc  ! 188: OR_I	or 	%r6, 0x0bfc, %r30
	.word 0xb801e11b  ! 188: ADD_I	add 	%r7, 0x011b, %r28
	.word 0xb011204b  ! 188: OR_I	or 	%r4, 0x004b, %r24
	.word 0xa40a000e  ! 188: AND_R	and 	%r8, %r14, %r18
	.word 0xa801000b  ! 188: ADD_R	add 	%r4, %r11, %r20
	.word 0xb801a9ef  ! 188: ADD_I	add 	%r6, 0x09ef, %r28
	.word 0xb4096376  ! 188: AND_I	and 	%r5, 0x0376, %r26
	.word 0xba09400d  ! 188: AND_R	and 	%r5, %r13, %r29
	.word 0xac01eee4  ! 188: ADD_I	add 	%r7, 0x0ee4, %r22
	.word 0xb4092366  ! 188: AND_I	and 	%r4, 0x0366, %r26
	.word 0xa412000d  ! 188: OR_R	or 	%r8, %r13, %r18
	.word 0xbc08eb38  ! 188: AND_I	and 	%r3, 0x0b38, %r30
	.word 0xa20a000f  ! 188: AND_R	and 	%r8, %r15, %r17
	.word 0xb0096920  ! 188: AND_I	and 	%r5, 0x0920, %r24
	.word 0xb0112ac6  ! 188: OR_I	or 	%r4, 0x0ac6, %r24
	.word 0xba10c00d  ! 188: OR_R	or 	%r3, %r13, %r29
	.word 0xa809400e  ! 188: AND_R	and 	%r5, %r14, %r20
	.word 0xb001c00b  ! 188: ADD_R	add 	%r7, %r11, %r24
	.word 0xb212000d  ! 188: OR_R	or 	%r8, %r13, %r25
	.word 0xa60125b2  ! 188: ADD_I	add 	%r4, 0x05b2, %r19
	.word 0xbc01c009  ! 188: ADD_R	add 	%r7, %r9, %r30
	.word 0xa401e704  ! 188: ADD_I	add 	%r7, 0x0704, %r18
	.word 0xae01e621  ! 188: ADD_I	add 	%r7, 0x0621, %r23
	.word 0xac0a000c  ! 188: AND_R	and 	%r8, %r12, %r22
	.word 0xa209400b  ! 188: AND_R	and 	%r5, %r11, %r17
	.word 0xbc11235f  ! 188: OR_I	or 	%r4, 0x035f, %r30
	.word 0xb801000d  ! 188: ADD_R	add 	%r4, %r13, %r28
	.word 0xac12000c  ! 188: OR_R	or 	%r8, %r12, %r22
	.word 0xac01adaf  ! 188: ADD_I	add 	%r6, 0x0daf, %r22
	.word 0xba0162b0  ! 188: ADD_I	add 	%r5, 0x02b0, %r29
	.word 0xb801e7e7  ! 188: ADD_I	add 	%r7, 0x07e7, %r28
	.word 0xb010edc9  ! 188: OR_I	or 	%r3, 0x0dc9, %r24
	.word 0xaa01ec23  ! 188: ADD_I	add 	%r7, 0x0c23, %r21
	.word 0xac122442  ! 188: OR_I	or 	%r8, 0x0442, %r22
	.word 0xac09400c  ! 188: AND_R	and 	%r5, %r12, %r22
	.word 0xb611400c  ! 188: OR_R	or 	%r5, %r12, %r27
	.word 0xb409000e  ! 188: AND_R	and 	%r4, %r14, %r26
	.word 0xa4116713  ! 188: OR_I	or 	%r5, 0x0713, %r18
	.word 0xaa096b36  ! 188: AND_I	and 	%r5, 0x0b36, %r21
	.word 0xa8122374  ! 188: OR_I	or 	%r8, 0x0374, %r20
	.word 0xba114009  ! 188: OR_R	or 	%r5, %r9, %r29
	.word 0xae0960e2  ! 188: AND_I	and 	%r5, 0x00e2, %r23
	.word 0xac01c00b  ! 188: ADD_R	add 	%r7, %r11, %r22
	.word 0xa21163d5  ! 188: OR_I	or 	%r5, 0x03d5, %r17
	.word 0xaa01eb04  ! 188: ADD_I	add 	%r7, 0x0b04, %r21
	.word 0xa210e2a2  ! 188: OR_I	or 	%r3, 0x02a2, %r17
	.word 0xb210c00b  ! 188: OR_R	or 	%r3, %r11, %r25
	.word 0xb2014009  ! 188: ADD_R	add 	%r5, %r9, %r25
	.word 0xa4096f26  ! 188: AND_I	and 	%r5, 0x0f26, %r18
	.word 0xb009619f  ! 188: AND_I	and 	%r5, 0x019f, %r24
	.word 0xbc01800d  ! 188: ADD_R	add 	%r6, %r13, %r30
	.word 0xbc11695c  ! 188: OR_I	or 	%r5, 0x095c, %r30
	.word 0xaa09800d  ! 188: AND_R	and 	%r6, %r13, %r21
	.word 0xaa09400d  ! 188: AND_R	and 	%r5, %r13, %r21
	.word 0xa811800e  ! 188: OR_R	or 	%r6, %r14, %r20
	.word 0xb802000b  ! 188: ADD_R	add 	%r8, %r11, %r28
	.word 0xa401e3f8  ! 188: ADD_I	add 	%r7, 0x03f8, %r18
	.word 0xb811a349  ! 188: OR_I	or 	%r6, 0x0349, %r28
	.word 0xba0a0009  ! 188: AND_R	and 	%r8, %r9, %r29
	.word 0xba09000b  ! 188: AND_R	and 	%r4, %r11, %r29
	.word 0xb001400a  ! 188: ADD_R	add 	%r5, %r10, %r24
	.word 0xb001800e  ! 188: ADD_R	add 	%r6, %r14, %r24
	.word 0xbe090009  ! 188: AND_R	and 	%r4, %r9, %r31
	.word 0xba10eddd  ! 188: OR_I	or 	%r3, 0x0ddd, %r29
	.word 0xa611c009  ! 188: OR_R	or 	%r7, %r9, %r19
	.word 0xb411c009  ! 188: OR_R	or 	%r7, %r9, %r26
	.word 0xbc116802  ! 188: OR_I	or 	%r5, 0x0802, %r30
	.word 0xb611c009  ! 188: OR_R	or 	%r7, %r9, %r27
	.word 0xa401800d  ! 188: ADD_R	add 	%r6, %r13, %r18
	.word 0xb801c00e  ! 188: ADD_R	add 	%r7, %r14, %r28
	.word 0xb801800a  ! 188: ADD_R	add 	%r6, %r10, %r28
	.word 0xb4116eba  ! 188: OR_I	or 	%r5, 0x0eba, %r26
	.word 0xba0a2a7a  ! 188: AND_I	and 	%r8, 0x0a7a, %r29
	.word 0xaa0a2b2c  ! 188: AND_I	and 	%r8, 0x0b2c, %r21
	.word 0xa409e6cb  ! 188: AND_I	and 	%r7, 0x06cb, %r18
	.word 0xa201c00c  ! 188: ADD_R	add 	%r7, %r12, %r17
	.word 0xb2012c98  ! 188: ADD_I	add 	%r4, 0x0c98, %r25
	.word 0xb001800f  ! 188: ADD_R	add 	%r6, %r15, %r24
	.word 0xb810e933  ! 188: OR_I	or 	%r3, 0x0933, %r28
	.word 0xb812000b  ! 188: OR_R	or 	%r8, %r11, %r28
	.word 0xba0929a7  ! 188: AND_I	and 	%r4, 0x09a7, %r29
	.word 0xbe0128c7  ! 188: ADD_I	add 	%r4, 0x08c7, %r31
	.word 0xb40a000f  ! 188: AND_R	and 	%r8, %r15, %r26
	.word 0xbc09000b  ! 188: AND_R	and 	%r4, %r11, %r30
	.word 0xbe08c00d  ! 188: AND_R	and 	%r3, %r13, %r31
	.word 0xbc10e4cb  ! 188: OR_I	or 	%r3, 0x04cb, %r30
	.word 0xaa096d33  ! 188: AND_I	and 	%r5, 0x0d33, %r21
	.word 0xa409000b  ! 188: AND_R	and 	%r4, %r11, %r18
	.word 0xac01400c  ! 188: ADD_R	add 	%r5, %r12, %r22
	.word 0xbc0963bc  ! 188: AND_I	and 	%r5, 0x03bc, %r30
	.word 0xb409e7f4  ! 188: AND_I	and 	%r7, 0x07f4, %r26
	.word 0xbc096920  ! 188: AND_I	and 	%r5, 0x0920, %r30
	.word 0xb60123de  ! 188: ADD_I	add 	%r4, 0x03de, %r27
	.word 0xb811800c  ! 188: OR_R	or 	%r6, %r12, %r28
	.word 0xae022549  ! 188: ADD_I	add 	%r8, 0x0549, %r23
	.word 0xbc022c0d  ! 188: ADD_I	add 	%r8, 0x0c0d, %r30
	.word 0xa801000b  ! 188: ADD_R	add 	%r4, %r11, %r20
	.word 0xbe10c00b  ! 188: OR_R	or 	%r3, %r11, %r31
	.word 0xa409c009  ! 188: AND_R	and 	%r7, %r9, %r18
	.word 0xbe09c009  ! 188: AND_R	and 	%r7, %r9, %r31
	.word 0xba01e334  ! 188: ADD_I	add 	%r7, 0x0334, %r29
	.word 0xb612000d  ! 188: OR_R	or 	%r8, %r13, %r27
	.word 0xbe09400d  ! 188: AND_R	and 	%r5, %r13, %r31
	.word 0xa402000d  ! 188: ADD_R	add 	%r8, %r13, %r18
	.word 0xa611800b  ! 188: OR_R	or 	%r6, %r11, %r19
	.word 0xa401ae6b  ! 188: ADD_I	add 	%r6, 0x0e6b, %r18
	.word 0xba10c00c  ! 188: OR_R	or 	%r3, %r12, %r29
	.word 0xa408ea4d  ! 188: AND_I	and 	%r3, 0x0a4d, %r18
	.word 0xae09e079  ! 188: AND_I	and 	%r7, 0x0079, %r23
	.word 0xba1220a7  ! 188: OR_I	or 	%r8, 0x00a7, %r29
	.word 0xac08e69f  ! 188: AND_I	and 	%r3, 0x069f, %r22
	.word 0xa611400b  ! 188: OR_R	or 	%r5, %r11, %r19
	.word 0xbe02000e  ! 188: ADD_R	add 	%r8, %r14, %r31
	.word 0xb611e4ba  ! 188: OR_I	or 	%r7, 0x04ba, %r27
	.word 0xba10e9a8  ! 188: OR_I	or 	%r3, 0x09a8, %r29
	.word 0xa209ab34  ! 188: AND_I	and 	%r6, 0x0b34, %r17
	.word 0xa4022ce9  ! 188: ADD_I	add 	%r8, 0x0ce9, %r18
	.word 0xb210ecb5  ! 188: OR_I	or 	%r3, 0x0cb5, %r25
	.word 0xa20226b0  ! 188: ADD_I	add 	%r8, 0x06b0, %r17
	.word 0xb200c00c  ! 188: ADD_R	add 	%r3, %r12, %r25
	.word 0xac012876  ! 188: ADD_I	add 	%r4, 0x0876, %r22
	.word 0xa811e375  ! 188: OR_I	or 	%r7, 0x0375, %r20
	.word 0xba12000e  ! 188: OR_R	or 	%r8, %r14, %r29
	.word 0xb201400c  ! 188: ADD_R	add 	%r5, %r12, %r25
	.word 0xb208c00a  ! 188: AND_R	and 	%r3, %r10, %r25
	.word 0xb002000a  ! 188: ADD_R	add 	%r8, %r10, %r24
	.word 0xaa0a000f  ! 188: AND_R	and 	%r8, %r15, %r21
	.word 0xa410c00a  ! 188: OR_R	or 	%r3, %r10, %r18
	.word 0xa409a025  ! 188: AND_I	and 	%r6, 0x0025, %r18
	.word 0xba116a3c  ! 188: OR_I	or 	%r5, 0x0a3c, %r29
	.word 0xb8092f87  ! 188: AND_I	and 	%r4, 0x0f87, %r28
	.word 0xba01c00a  ! 188: ADD_R	add 	%r7, %r10, %r29
	.word 0xa209241a  ! 188: AND_I	and 	%r4, 0x041a, %r17
	.word 0xa802000b  ! 188: ADD_R	add 	%r8, %r11, %r20
	.word 0xb601e5bd  ! 188: ADD_I	add 	%r7, 0x05bd, %r27
	.word 0xba12000c  ! 188: OR_R	or 	%r8, %r12, %r29
	.word 0xe428e646  ! 188: STB_I	stb	%r18, [%r3 + 0x0646]
	.word 0xf0222124  ! 188: STW_I	stw	%r24, [%r8 + 0x0124]
	.word 0xe8292fd4  ! 188: STB_I	stb	%r20, [%r4 + 0x0fd4]
	.word 0xfe7227c0  ! 188: STX_I	stx	%r31, [%r8 + 0x07c0]
	.word 0xe630eb14  ! 188: STH_I	sth	%r19, [%r3 + 0x0b14]
	.word 0xfe28e473  ! 190: STB_I	stb	%r31, [%r3 + 0x0473]
	.word 0xae010045
	.word 0xe8322192  ! 192: STH_I	sth	%r20, [%r8 + 0x0192]
	.word 0xf0a16f1c  ! 193: STWA_I	stwa	%r24, [%r5 + 0x0f1c] %asi
	.word 0xaa69a259  ! 194: UDIVX_I	udivx 	%r6, 0x0259, %r21
	.word 0xae11400e  ! 194: OR_R	or 	%r5, %r14, %r23
	.word 0xa21127af  ! 194: OR_I	or 	%r4, 0x07af, %r17
	.word 0xa409000e  ! 194: AND_R	and 	%r4, %r14, %r18
	bne thr1_loop_15
	subcc %g1, 0x1, %g1
	ba	join_lbl_0_0
	nop

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 16, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 24, 16, 16)) -> intp(3, 1, 1)
	nop
	nop
	nop
	ta    T_GOOD_TRAP

.data
	.word  0x13d6593f,0x634556ee,0xec36aed6,0x733b009f
	.word  0x3193bf22,0x5b59d4f4,0x74c6a2b2,0x7c786a52
	.word  0xf1132a2e,0x6a7d9af9,0xda6bfef5,0xbe1c75ee
	.word  0xad33b2c5,0xfa3e1641,0x73187fb7,0x36b8e801
	.word  0x8e53e8b1,0x036fb0fb,0x355b132c,0x05c91f82
	.word  0xd1246e12,0x93c548dc,0x70bab6f8,0x967fc4f6
	.word  0x54f4f7aa,0xbe74855c,0xb36e4927,0x28fb4362
	.word  0xc11dfbc5,0x1bef8434,0x50511b4a,0x0e66703b
	.word  0x08740094,0x10e904b9,0x4c35f42c,0x04837d3d
	.word  0xf612ef0c,0xe017abab,0x347f330e,0xf16e98c1
	.word  0x3810ec2a,0xeab4974c,0x3ae94e5d,0xcb356797
	.word  0xaa8e8406,0x99dbc04b,0xe88d8842,0x495d11cb
	.word  0x05e9f07d,0xff1b6b8e,0x9a1d40f8,0x5f4292a5
	.word  0xeb4c3ff3,0xb04861d4,0x4825eaa0,0xb9efd73d
	.word  0xc092aff2,0xc29c2c25,0x46d6e992,0x1f3179b3
	.word  0xe5484233,0xbd988092,0x2b9db998,0xe4585c1b
	.word  0xc769994a,0x2f8b24cd,0xbb0aa37b,0xebcee418
	.word  0x476aad99,0x13dc2c57,0xaa19dbfb,0x6d36b2ee
	.word  0x7afdbe2b,0x4e3c12cc,0x64fb1740,0x6f1fd37a
	.word  0xe2befa06,0x41d33c8b,0x0028fcaa,0xf2a8f468
	.word  0x7cfbbca2,0x9988029f,0x65ced134,0x1368a818
	.word  0x2d249fc5,0xee4e82cc,0xbe0e18ad,0x81ecc7c3
	.word  0x3c74448a,0xcb2e3267,0xa0ef97e6,0x0e68bd1d
	.word  0xbf40887a,0x612b25a5,0x75196b9b,0x3a4610fd
	.word  0x775c2953,0x68bbf881,0xffe596ab,0xdbe1d75a
	.word  0x32117950,0x61354d86,0x2a1772d5,0x111016bf
	.word  0x99e574ea,0x8d498035,0xe5c21802,0x50c79baf
	.word  0x4c8056f1,0x07f2e6f2,0x574632dc,0x7aeb7629
	.word  0x76d3b81f,0x2d3e22dc,0x5918b83d,0xae8a20f0
	.word  0x6d4fa3e5,0x7a737f9e,0x3ee77617,0x913c49ed
	.word  0x300d061d,0x56752815,0xa66f0240,0x1495bf1d
	.word  0x6bfa9cec,0x2f01ac99,0xf1cb4d32,0x16a153de
	.word  0x828e3148,0x6a697cef,0x0b5ff7c1,0x8235fb2a
	.word  0x50eb98db,0x716d7974,0xe62e49bf,0x98aa40cb
	.word  0xba0ec2fb,0xf376919c,0x7b9a02cf,0x8c813c5b
	.word  0xd1300667,0xc528f3c4,0x34b973b5,0x1aa5dfe6
	.word  0xf16c1d06,0x4946a654,0xcba4c57e,0x6e7c1907
	.word  0xac88eb3c,0x127bca69,0x6b259252,0x9ec75cfc
	.word  0x22cc0897,0xf8d1fdeb,0x48180a9f,0xbfce5e4a
	.word  0xea94ff5c,0x5687f2fc,0x9d2ab03e,0xec85e1c7
	.word  0xf97ae218,0x5edfb816,0x59fc6916,0xfbcc6fc2
	.word  0xe6c56eb3,0xf56c2058,0x994ae23e,0x2de3f689
	.word  0xc0bcbeee,0x59066778,0x2f29bd52,0x2de88b19
	.word  0x5c7f7a94,0x3a783a92,0x85766690,0xe1d4ce00
	.word  0xe559377a,0x26d0e682,0x8f6bc404,0x6538fc15
	.word  0xa64caec4,0xc0c5833e,0xe36d445c,0xda04ecfa
	.word  0x31e5bb43,0xb7b4b2dd,0xdeef84e6,0x4afd933e
	.word  0x6724107b,0xc47cb5d4,0x34105c30,0x6a465f85
	.word  0x50c03529,0x8fca844d,0xbfc66fa9,0xa02e6a6c
	.word  0xe2d98b20,0x2902a965,0x08d0b41c,0xc37939ae
	.word  0x89c99966,0x28adb75f,0xee68818b,0x3595928b
	.word  0x97e59bde,0x0b18ba5c,0xb5a937ea,0x5f2e17b9
	.word  0x951fb77c,0x89d86123,0x1e0536de,0x747115a0
	.word  0xb2b10d57,0x49e3515c,0x636ea6b2,0x362bfbbb
	.word  0x790f7b7d,0x9ed9c4e5,0x3468cf0e,0xe59ae01a
	.word  0x2738c6a7,0xe06a41b7,0x5ca3d958,0xd6b59ea8
	.word  0xdee80dfc,0x5e2c4089,0x0b9fbdc9,0x0cb4a003
	.word  0x8e967a10,0xb8e4c99c,0x199d0111,0xd273ab35
	.word  0x29a477e4,0x12509058,0x47cb7b88,0x530b1d4d
	.word  0xfa405146,0x3287c10d,0xfda7e0da,0xadafe843
	.word  0x7f021e3b,0x8b8f50a9,0x75bef155,0xda4e1fe7
	.word  0xe0f027c8,0xbc9b49ba,0x889522a4,0xe90f6fd4
	.word  0x15e6d8f7,0x3ce5e610,0xdf40b303,0x4a9a2180
	.word  0x4264209e,0xbb19052c,0x53c352bf,0x058c8d35
	.word  0x40d1961e,0x2e23daad,0x08aaab9a,0x35eac7e5
	.word  0xa453a5d9,0xf43e8ae4,0x24f4a6a8,0x1832bf66
	.word  0x4b365d5e,0xe7e6f552,0x64850462,0xbed7cc49
	.word  0xef46f8bc,0xff90837c,0x5010646b,0xd2a7d3e4
	.word  0xbba9f89f,0x73e837ae,0x24807b61,0x1b8129c0
	.word  0x1bdeb176,0x3cb06462,0x3c1501bc,0xc47fdb53
	.word  0x8fe205fd,0xc58366cd,0xf5537938,0xdcfde485
	.word  0x96ac121c,0x50e42f34,0x05de7bff,0x3a1aa18e
	.word  0x51cde4b8,0x4af2686c,0xbf44c076,0x05586ea4
	.word  0x4b17e865,0x7ba5151b,0xde3a6bb3,0x75ef0623
	.word  0xca03c31c,0xf6cf55b5,0x14c060b2,0x8460ba7c
	.word  0x172ada61,0x0885730f,0xfe18f764,0x82c3c1f5
	.word  0x42a3e832,0xcd71fee8,0xf27217c0,0x8eeba724
	.word  0x52a2c87f,0xcaa45032,0x1353eb3c,0x7c678444
	.word  0x228facc3,0x0b705cf2,0x48fdc5d7,0x574cb5d2
	.word  0x4bbd5ea9,0xb3a6da9d,0x7f17b3f7,0xee5c579e
	.word  0x372339b8,0x61277b2f,0x1045fd0b,0x94863f3a
	.word  0x8a8b88a9,0x4f7819a1,0xc89e651f,0x6813fa57
	.word  0x3824dee5,0xe14d48ce,0x0d5fc611,0x5d930bf2
	.word  0xbc44e245,0x967138a0,0x8c61bcdc,0x490689e9
	.word  0x6295db77,0xb4ca0c30,0x446dc07c,0xf2e1ff4b
	.word  0x2b43549d,0x3050b14c,0x5b48fb7b,0xcf2beaa7
	.word  0xb27a7bc8,0x1f08d995,0xa6418907,0xf8cd0126
	.word  0x663a58c3,0x4af3e003,0x73d8163b,0x7b2ad72f
	.word  0x34f0f3ad,0xc8e1b677,0xaaff8b12,0xb2882a9c
	.word  0x004640b1,0x890cb22f,0x37e643b7,0xb59da40d
	.word  0x3ec329a4,0xae803437,0xda5fd396,0x0d985870
	.word  0xd4d031fe,0x1494dc06,0xdb203501,0x7a4efac4
	.word  0x82ff146e,0x72ea9c38,0x19d72208,0x7048f621
	.word  0xe0e2f173,0xe8f62eec,0x874d09ba,0xfeab14fc
	.word  0xb3c2d879,0xa6f80758,0xc47210d0,0xecf99f42
	.word  0x23597f94,0xe8fbba63,0x59780c0f,0xc7f5939c
	.word  0x536ce86f,0x57a013c5,0x00f0c376,0x15eac7c2
	.word  0x3acf10c6,0x7c39b162,0x4b133bed,0x64cccfc7
	.word  0x0f98d199,0x101e768c,0xd31fd7c3,0xe232da72
	.word  0xfd13d257,0x9047a609,0xc092b37b,0x344008db
	.word  0x9d098f25,0xa3d51fc9,0x3b6013c0,0xd6ccbdeb
	.word  0xd03f1d04,0xe8e39b54,0x941f85af,0x7f08adb4
	.word  0x1473145e,0xc4257fb6,0x6d117542,0xa8ce13b6
	.word  0x4dbc0ad0,0xa32aa544,0x233574b1,0xeb5bfb0f
	.word  0xa683bd2d,0xda0dde4c,0x6257810f,0xb476db45
	.word  0xa295e849,0xe51e4ac3,0x473ecf33,0x7bd3d06d
	.word  0x890201d4,0x1b39b06e,0xe9ab372a,0x292588d8
	.word  0xffebfe19,0x27e4c5cd,0x6a8b2122,0x3571ae03
	.word  0x7227d288,0xcf02de01,0x9c501b73,0xe23bcae9
	.word  0xd8692d2e,0xfa4814de,0x4f716a29,0x4b8b3eb2
	.word  0x0d216923,0x5a24d424,0xe0d075ea,0x0f467099
	.word  0x8d9e6bbd,0x56e16734,0xf367f28e,0x37644684
	.word  0x021e7e9a,0x8048dc2d,0x48f3d3a4,0x4d31261b
	.word  0xb882ba64,0xcce2d1f6,0x7652ea28,0xe0546cce
	.word  0xf0723378,0x0df4276a,0x7730c2b9,0xb614ad18
	.word  0x9421eb57,0x0a461acd,0x36a3e6cb,0xa76085f5
	.word  0xd12a31b7,0x000e1ff7,0x8e36b179,0x05a4843b
	.word  0x93ee269f,0xf76a62ae,0x6fd2a9aa,0x9749476b
	.word  0x34e64cbc,0xd20b1dc3,0xd0bf992f,0x075d0ef9
	.word  0xfa68741f,0x5a03faa2,0x816fc7ec,0xf989043c
	.word  0x8314a7fd,0x9b50ecf2,0x7bc2944a,0x778eeb98
	.word  0x6c5dba49,0x7f734f79,0x91c8c254,0x21dcc181
	.word  0xc3f5c275,0xe92e68a6,0xcfb3f3c8,0x640bff9f
	.word  0x54b49a72,0xd65643da,0x7914f224,0x9fae4d65
	.word  0x4456cced,0x3521187d,0x1ceb220f,0xa7f0bc79
	.word  0x3901d34c,0x71c8effa,0x3a724037,0xd9be859c
	.word  0x33669db8,0xa17e00a3,0x7a2aa01a,0xac71fecf
	.word  0x9eddcf04,0xa7c7e4ff,0xafba689b,0x95ac2e37
	.word  0x658ee404,0xd3dcd2d0,0xa2f78d91,0x528b8b42
	.word  0xb476e704,0xc065a446,0x097aa1a4,0xcb097daa
	.word  0x015d0019,0x45ef76c0,0x6eba7fa9,0x16f9a190
	.word  0x3d4b8d9d,0xd28fa5ba,0xb7a62241,0x87783909
	.word  0x4519c205,0xe3ecc1bf,0x29684063,0xa32b2c65
	.word  0x3083632d,0x10793053,0xdac7be1a,0x8bc56ad5
	.word  0xb92e2618,0x1f043ba3,0x68ceabed,0x628ee8b9
	.word  0xa68c6ab3,0x51834076,0xd6537976,0xaa823082
	.word  0x4217e1fe,0x609823eb,0x8e32e354,0xf1c86135
	.word  0x22161c7a,0xabc6e729,0xc7a6d873,0xd1b75402
	.word  0x1d5b1236,0xd8082600,0xbcf07f2b,0x78a553e3
	.word  0x28bb5b6a,0xba6e50b1,0xa0a59137,0xbfecf1dd
	.word  0x93f595b8,0x7403a4a5,0xc43eaf90,0x26b31c05
	.word  0xaff9e1e0,0x0e99e0a0,0x40f7c2d1,0xd818f146
	.word  0xa2268828,0x2cb91c82,0xd6d2b232,0xd8778cb5
	.word  0x66391eb6,0x5638c1ee,0x21e33449,0x605a32eb
	.word  0x7d1d4fe3,0x4cb7b2c7,0xa09ef40a,0x7bbc5b05
	.word  0x03245bf3,0xf64df447,0xbe2b7dff,0xef342add
	.word  0xf4866372,0x04301c9c,0xea84cbbc,0x053fd8af
	.word  0xad847a98,0x2de78c7f,0x46f0e8c5,0x847410ef
	.word  0xe9041237,0x74db7198,0x80c7a134,0xc06a270e
	.word  0x75779622,0x62f663c0,0x1f306b49,0x3917e491
	.word  0x31469315,0xeea035c3,0x7d2d44a8,0x3a509f9c
	.word  0xac011c4a,0xd05dddda,0x63e648ea,0x0cd691d1
	.word  0xfef4e1bb,0x9dd8c506,0x3db4a23f,0x5cdbf400
	.word  0xf1ffd8a4,0x680180ac,0xcc06d8ea,0xe259b294
	.word  0x95167d35,0x464f8c3c,0xa9c6a694,0xf6bc2860
	.word  0x371219ae,0xd796edb7,0xa0d88a52,0x13ff4bc7
	.word  0x9982df54,0x125b10b6,0x69aa2b62,0x7376ebc8
	.word  0xc4772251,0xe850c9dd,0x84e208e3,0xeff15c54
	.word  0x4fe14e2f,0x9025bbc4,0x3dfcbe2c,0x5de1824d
	.word  0x23556b09,0xc92d6dfd,0x8ae3e8e6,0xc50623e9
	.word  0xd71cff94,0xeb4439f5,0xce53315c,0x4b86d1e9
	.word  0xaf5ebd6b,0xc1923d0f,0x2836e21c,0xbaadc127
	.word  0x81976953,0x08f6eac8,0xca124b3e,0x21a8885d
	.word  0x42565b25,0x9e4f6cd3,0x2c91e91d,0xccf30c21
	.word  0xa558b26d,0x1d22bf3a,0x937954f3,0xda129d80
	.word  0x157e4fbf,0x3208c7d2,0x2a16a001,0xecfe8629
	.word  0x606b9e3a,0x3964a297,0xae2c0111,0x9487db3a
	.word  0x3e7f9acd,0x35c954b6,0x2f7d58c3,0x08078c68
	.word  0x90009153,0x1e21db56,0xfbe46712,0xc442d924
	.word  0x2c8119f0,0x99d6be4d,0x976faa35,0x903daeba
	.word  0xfb44f6bd,0x790bb689,0xf0037e6e,0x81cc83e3
	.word  0x897f0fbe,0x8b2a4898,0x82debb51,0xa7599b96
	.word  0x0906c09f,0x5817c31f,0x6ec11257,0x9274981b
	.word  0xdea6858c,0xa3f8ed2e,0xd550aae8,0x93592f16
	.word  0x3c547df4,0x7890f4bc,0x8e716d2f,0x4417c486
	.word  0x873d30a0,0xbf47cfa9,0xea181917,0xcceadf4c
	.word  0x2281853a,0x158fa5e4,0x03a535a4,0x783fe900
	.word  0xa260bccb,0x207676f0,0x949fb0d7,0x52be94f6
	.word  0xaedfb51b,0x2c5d72f9,0x0d835405,0xcbe2f932
	.word  0x14dab50d,0x974ba053,0x0a2b348d,0xfe25f315
	.word  0xc05ffa16,0x99a1a45a,0x6e31fc12,0x34918b2e
	.word  0x2eb52d61,0xf680e59c,0x6605cd89,0xf96b1cdd
	.word  0x7511669d,0x69c39f4f,0x043d8d58,0x80fdf4a8
	.word  0x7c028dcb,0x427b1a88,0x6d9fc939,0xed1f8450
	.word  0x25ce1b9c,0x98f013ef,0xc3aa0b39,0xf00f0f29
	.word  0xe3e62d79,0x974abba6,0xe977601b,0x3cb35ce1
	.word  0x965ab0fe,0x5e931ceb,0xe7cfe536,0x4c1e1902
	.word  0x11a3f56b,0xcb2bb57c,0xddf1dfe3,0x9c6069f9
	.word  0x0827c88c,0x600a80cf,0x873c7f6b,0x3d02ea44
	.word  0x4949f6e7,0x8b99c765,0x0afe1cac,0xc2b89ccd
	.word  0xd5a8d289,0xb950a568,0xc5bddeed,0x2dd84049
	.word  0x5a55fd5e,0xb6b2f216,0xf5ae945e,0xd84ff568
	.word  0x2bd25b53,0x1a62a6a0,0xaa8f8549,0xff853758
	.word  0xe1762f52,0xe2036e95,0x7a632491,0x0d9fe804
	.word  0x2074da98,0x2e733f8e,0x15eaccc1,0x1fba9c24
	.word  0x21f2dd32,0xd73b95f3,0x60e4af3b,0x326236fd
	.word  0x8fbb2a6f,0xb015b28c,0xe59c42e7,0xecb0bf4b
	.word  0x2de36125,0x9dfeb1ec,0x7004812a,0xfc785a94
	.word  0xaa2306ca,0xfa9fd44e,0xbab1b475,0xc5313a75
	.word  0x741a79e7,0xcee16a85,0xd9ed731b,0x9d54fb53
	.word  0x6d31edd0,0xdbd96e6b,0x2d546724,0x26e019b9
	.word  0x52e3ea85,0x297557b7,0x47144363,0x92884256
	.word  0x2c7db22a,0xde20f64e,0xb9e01ddd,0x8c74b3aa
	.word  0x491f4f09,0x7c72522a,0xf35ab015,0x017e25aa
	.word  0xb9261bdd,0xb61aa7ef,0x31c70a3b,0x9352658d
	.word  0xdd9c9254,0x6bf39a32,0xc77f068e,0x9b81e216
	.word  0x897ceb7d,0xf70f620b,0xcb945169,0xfd456164
	.word  0x16cb2cae,0x2533a39c,0xc567ba24,0x77045673
	.word  0x89125d0a,0xb4284f8b,0xa78d8440,0x03a86496
	.word  0xd99b1668,0x15034d7a,0x36055c69,0xbbe98624
	.word  0x19329f36,0x409976cf,0xb3810686,0xa1903a25
	.word  0x22975f29,0x28d2efd1,0xb864b863,0xb35675d5
	.word  0x41bcaede,0xcb2a7d29,0x503ec1d0,0xb5f2c866
	.word  0xc84927b0,0x7b984035,0xc98d8881,0x4441f0d8
	.word  0xf90fa3b0,0x5d8fedbe,0x5f5a1856,0x4210b0a0
	.word  0x97ad153a,0x42b437d2,0xeca9eb92,0xbae48ad0
	.word  0x3d63a229,0x9f182a4a,0x65f7c2f9,0x96f630b0
	.word  0xcde8f5a4,0x57eda26a,0x92e15ccd,0x19e319f1
	.word  0xe0a5a4e1,0x755e547c,0xe97c6cb3,0xa4ffb2be
	.word  0xe4ca10f4,0xb07c17dc,0x2b8ebcea,0xe04f98ce
	.word  0x0b723c5b,0xa3049ce3,0x5a0ba5ec,0xba3649d3
	.word  0xb0865870,0xa7ae8afa,0xd3148627,0x6a9f67df
	.word  0xaa92b410,0x56e18813,0xe5b3c3b9,0x27c514db
	.word  0xdf55a84b,0xfaf9642f,0x5bd62fc9,0x0fb9b381
	.word  0x66ce1dfd,0xef6c5013,0xed431931,0xab9a1e3d
	.word  0x8734b7cb,0x0c6e27df,0xcec92014,0x60bdfe1a
	.word  0xc0b87289,0x73f02f27,0x5e05f40e,0xaff53112
	.word  0x559b754e,0x03d17efd,0x41065c12,0x06dc07bb
	.word  0x3c041496,0xba2b6200,0xc3f69a8d,0xfc4878d8
	.word  0xd8540c12,0x66ca684c,0x3dfc6a71,0xa80ae082
	.word  0x0e0015d9,0x0464aa7b,0x85530416,0x2ebbdc81
	.word  0x3520db2b,0x68969f25,0x636fc038,0x0f420491
	.word  0xfceece94,0xfd2a7d13,0xdafc1b3f,0x29082e16
	.word  0x24df7059,0x1c3cf3e7,0x4831a5b1,0x651112ab
	.word  0x3a9b51c3,0x2fa0ff8e,0xd00cc337,0xe43aa9a6
	.word  0xe13bd5f7,0x69f72238,0x1fdf8b79,0x244a0153
	.word  0x82d34a4a,0xd5746bba,0xf26cae74,0xec033187
	.word  0xf04d25c7,0xd780a5f9,0x47ce5f24,0x14a34e7e
	.word  0xba12de1e,0x37eee137,0x0dd50dde,0xe6545598
	.word  0x1aae3267,0xa8b2cbaf,0x7b9d04bd,0xe9f8f6d6
	.word  0x817e7875,0xee50142e,0x1a3e6091,0x08a1442c
	.word  0x3c761e88,0xf4782951,0xcab33a32,0xa363e0f0
	.word  0x54f60fb4,0x1d27e4b2,0x15d1a815,0xe1f17cc5
	.word  0x29d603cf,0x5cb38a9e,0x36679d37,0xee170759
	.word  0x6874f571,0xe7ac3b57,0xa46242ec,0x4129960b
	.word  0xc1535318,0xf82fefd6,0xaa2bb136,0xa3e50f47
	.word  0x25a35cf0,0x88640778,0xec6a42f8,0x6605a631
	.word  0x16515fdc,0x1495bdb5,0x0ddf3618,0x40ed93e5
	.word  0xf8ba92f1,0xebc3f778,0xbf9a20bf,0x0e2a7eda
	.word  0xe7a687cc,0xb5036612,0x0aacda9b,0xbb7cbdec
	.word  0x3558ffd6,0xe186d940,0xb886a0d7,0x254eecf7
	.word  0x9f6f74d2,0xcc8e3368,0xbc1eb5f6,0xf922287b
	.word  0x6178d679,0xdb66e518,0x341cf4f5,0xbaf35ac0
	.word  0xb8b0f73b,0x973c38d3,0xc69a0e7f,0xbf914443
	.word  0x7ab2de6f,0x6f9cc8ac,0x16c98e76,0xe7b411e4
	.word  0x637d0b0f,0x8aaceb46,0xc983c4b6,0xd26bb6d0



#if 0
!!# /************************************************************
!!# /**
!!# *
!!# * File:         stb8.j
!!# *
!!# * Description:  
!!# * Covers all coverage conditions in ifu_simul_swout that
!!# * involve the store buffer full condition (stb8) except the
!!# * ones that invlove fpod and intd
!!# *
!!# **************************************************************/
!!# 
!!# template main ();
!!# 
!!# %%section c_declarations
!!# 
!!#   int label_cnt = 0;
!!#   int irf_err_cnt = 0;
!!#   int ic_err_cnt = 0;
!!#   int dc_err_cnt = 0;
!!#   int bitnum = 0;
!!#   int i = 0, occ = 0, regid = 0;
!!# 
!!# %%section init
!!# 
!!#   printf ("**********************************\n");
!!# 
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rs1, "{3..8}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rs2, "{9..15}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rd, "{17..31}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Simm13, "13'b0rrrrrrrrrrrr");
!!#   IJ_set_ropr_fld (ijdefault, Fm_align_Simm13, "3'b111");
!!#   IJ_set_ropr_fld (ijdefault, Fm_align_Rd, "1'b1");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Imm_Asi, "{0x80}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Cc1_f2, "1'br");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Cc0_f2, "1'b0");
!!#   IJ_set_ropr_fld (ijdefault, Ft_P, "1'br");
!!#   IJ_set_ropr_fld (ijdefault, Ft_A, "1'br");  
!!#   IJ_set_ropr_fld (ijdefault, Ft_D16, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Disp22, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Disp19, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Disp30, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Cmask, "3'brrr");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Mmask, "4'brrrr");
!!# 
!!#   //Internal asi stores to err regs and data tag
!!#   IJ_set_ropr_fld (Ro_int_asi, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld (Ro_int_asi, Ft_Rs2, "{2}");
!!#   IJ_set_ropr_fld (Ro_int_asi, Ft_Rd, "{0}");
!!#   IJ_set_ropr_fld (Ro_int_asi, Ft_Imm_Asi, "{0x4c,0x4b,0x47}");
!!# 
!!#   IJ_set_ropr_fld (Ro_unaligned_addr, Fm_align_Simm13, "3'b000");
!!#   IJ_set_ropr_fld (Ro_unaligned_addr, Ft_Simm13, "13'b0rrrrrrrrrrr1");
!!# 
!!#   IJ_bind_thread_group(th_0, 0x1);
!!#   IJ_bind_thread_group(th_1, 0x2);
!!#   IJ_bind_thread_group(th_2, 0x4);
!!#   IJ_bind_thread_group(th_3, 0x8);
!!#   IJ_bind_thread_group(th_all, 0xf);
!!# 
!!#   IJ_th_fork (0x2, 0x4, 0x8);
!!# 
!!#   //Keep r16 as the scratch register
!!#   //Initialize Rd
!!#   IJ_set_rvar (reg_rand_init, "64'hrrrrrrrr rrrrrrrr");
!!#   for (i = 17; i < 32; i++) {
!!#      IJ_printf (th_all, "\tsetx  0x%016llrx, %%r1, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   //Initialize Rs2
!!#   IJ_set_rvar (reg_rand_init, "64'h0000000000000rr0");
!!#   for (i = 9; i < 16; i++) {  
!!#     IJ_printf (th_all, "\tsetx  0x%016llrx, %%r1, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   //Initialize Rs1
!!#   for (i = 3; i < 9; i++) {
!!#      IJ_printf (th_all, "\tsetx MAIN_BASE_DATA_VA, %%r1, %%r%d\n", i);
!!#   }
!!# 
!!#   //initialize %r2 for int asi store addresses
!!#   IJ_set_rvar (int_asi_reg_rand_init, "{0x0..0x3ff0}");
!!#   IJ_printf (th_all, "\tsetx  0x%016llrx, %%r1, %%r2\n", int_asi_reg_rand_init);
!!# 
!!#   IJ_printf (th_all, "\twr %%r0, 0x4, %%fprs\n");
!!#   IJ_init_fp_regs (th_all, 4);
!!# 
!!#   IJ_printf (th_all, "\twr  %%r0, 0x80, %%asi\n");
!!# 
!!# //  IJ_set_rvar (ic_dc_err_occ, "{1, 2}");
!!# //  IJ_set_rvar (irf_err_occ, "{1, 3}");
!!# //  IJ_set_rvar (regid, "{9..15}");
!!# 
!!# %%section finish
!!# 
!!#   IJ_th_join (0xf);
!!#   IJ_th_start (Seq_Start, NULL, 2); 
!!# 
!!#   IJ_printf (th_all, "	nop\n");
!!#   IJ_printf (th_all, "	nop\n");
!!#   IJ_printf (th_all, "	nop\n");
!!#   IJ_printf (th_all, "	ta    T_GOOD_TRAP\n\n");
!!# 
!!#   IJ_set_rvar (data_rand_init, "32'hrrrrrrrr");
!!#   IJ_printf (th_all, ".data\n");
!!#   for (i = 0; i < 128; i++) {
!!#     IJ_printf (th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#     IJ_printf (th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#   }
!!# 
!!# %%section diag_ini
!!# #define MAIN_PAGE_HV_ALSO
!!# #define NO_TRAPCHECK
!!# #include "enable_traps.h"
!!# #include "boot.s"
!!# 
!!# !SIMS: -non_shared
!!# !SIMS: +spis
!!# 
!!# .text
!!# .global main
!!# 
!!# main:
!!# 
!!# %%section diag_fini
!!#    
!!# 
!!# %%section grammar
!!# 
!!# inst_block: inst_type
!!#             | inst_block inst_type
!!#             ;
!!# 
!!# inst_type: store_chunk_1 | store_chunk_2
!!# ;
!!# 
!!# store_chunk_1: d0 store_i store_i store_i store_i store_i
!!#      {
!!#         IJ_printf (th_all, "!Hi Prashant: store_chunk_1\n");
!!#         IJ_printf (th_all, "\tset 0x2, %%g1\n");
!!#         IJ_printf (th_all, "\tsubcc %%g1, 0x1, %%g1\n");
!!#         IJ_printf (th_all, ".align 0x20\n");
!!#         IJ_printf (th_0, "thr0_loop_%d:\n",label_cnt);
!!#         IJ_printf (th_1, "thr1_loop_%d:\n",label_cnt);
!!#         IJ_printf (th_2, "thr2_loop_%d:\n",label_cnt);
!!#         IJ_printf (th_3, "thr3_loop_%d:\n",label_cnt);
!!#         i = ((random() % 20 + 10)*8) - 1;  
!!#         IJ_generate_from_token (i, th_all, ijdefault, tADD_R, tADD_I, tAND_R, tAND_I, tOR_R, tOR_I, NULL); 
!!#         IJ_generate_va (th_all, $2, $3, $4, $5, $6);
!!#      } 
!!#      st_irferr_unalgn trpm_alu store_i 
!!#      {
!!#         IJ_generate (th_all, $10);
!!#      }
!!#      store8 inst9 
!!#      {
!!#         IJ_generate_from_token (3, th_all, ijdefault, tADD_R, tADD_I, tAND_R, tAND_I, tOR_R, tOR_I, NULL); 
!!#         IJ_printf (th_0, "\tbne thr0_loop_%d\n",label_cnt);
!!#         IJ_printf (th_1, "\tbne thr1_loop_%d\n",label_cnt);
!!#         IJ_printf (th_2, "\tbne thr2_loop_%d\n",label_cnt);
!!#         IJ_printf (th_3, "\tbne thr3_loop_%d\n",label_cnt);
!!#         IJ_printf (th_all, "\tsubcc %%g1, 0x1, %%g1\n");
!!#         label_cnt++;   
!!#      }
!!# ;
!!# 
!!# store_chunk_2: d1 store_i store_i store_i store_i store_i store_i store_i
!!#      {
!!#         IJ_printf (th_all, "!Hi Prashant: store_chunk_2\n");
!!#         IJ_printf (th_all, "\tset 0x2, %%g1\n");
!!#         IJ_printf (th_all, "\tsubcc %%g1, 0x1, %%g1\n");
!!#         IJ_printf (th_all, ".align 0x20\n");
!!#         IJ_printf (th_0, "thr0_loop_%d:\n",label_cnt);
!!#         IJ_printf (th_1, "thr1_loop_%d:\n",label_cnt);
!!#         IJ_printf (th_2, "thr2_loop_%d:\n",label_cnt);
!!#         IJ_printf (th_3, "thr3_loop_%d:\n",label_cnt);
!!#         i = ((random() % 20 + 10)*8) - 1;  
!!#         IJ_generate_from_token (i, th_all, ijdefault, tADD_R, tADD_I, tAND_R, tAND_I, tOR_R, tOR_I, NULL); 
!!#         IJ_generate_va (th_all, $2, $3, $4, $5, $6, $7, $8);
!!#      }
!!#      dcw2_ldmw store8 inst9
!!#      {
!!#         IJ_generate_from_token (3, th_all, ijdefault, tADD_R, tADD_I, tAND_R, tAND_I, tOR_R, tOR_I, NULL); 
!!#         IJ_printf (th_0, "\tbne thr0_loop_%d\n",label_cnt);
!!#         IJ_printf (th_1, "\tbne thr1_loop_%d\n",label_cnt);
!!#         IJ_printf (th_2, "\tbne thr2_loop_%d\n",label_cnt);
!!#         IJ_printf (th_3, "\tbne thr3_loop_%d\n",label_cnt);
!!#         IJ_printf (th_all, "\tsubcc %%g1, 0x1, %%g1\n");
!!#         label_cnt++;   
!!#      }
!!# ;
!!# 
!!# st_irferr_unalgn: irferr store_i 
!!# 		    {
!!# 		       IJ_generate (th_all, $2);
!!# 		    }
!!#                   | store_i %ropr Ro_unaligned_addr
!!#                     {
!!# 		      IJ_generate (th_all, $1);
!!#                     }
!!#                   | d1 store_i
!!#                     {
!!# 		      IJ_generate (th_all, $2);
!!#                     }
!!# ;
!!# 
!!# store8: st 
!!#            {
!!#               IJ_generate (th_all, $1);
!!#            }
!!#         | icerr st
!!#            {
!!#               IJ_generate (th_all, $2);
!!#            }
!!# ;
!!# 
!!# inst9: alu_err | lop_err | chpriv_err | setx_err
!!# ;
!!# 
!!# alu_err: alu 
!!#            {
!!#               IJ_generate (th_all, $1);
!!#            }
!!#          | icerr alu
!!#            {
!!#               IJ_generate (th_all, $2);
!!#            }
!!# ;
!!# 
!!# lop_err: lop 
!!#            {
!!#               IJ_generate (th_all, $1);
!!#            }
!!#          | icerr lop
!!#            {
!!#               IJ_generate (th_all, $2);
!!#            }
!!# ;
!!# 
!!# chpriv_err: chpriv | icerr chpriv
!!# ;
!!# 
!!# setx_err: setx | icerr setx
!!# ;
!!# 
!!# dcw2_ldmw: load 
!!#              {
!!#                 IJ_generate (th_all, $1);
!!#              }	     
!!#            | dcerr load alu 
!!#              {
!!#                 IJ_generate_va (th_all, $2, $3);
!!#              }
!!# ;
!!# 
!!# st: st_fp | atomic | st_int_asi | st_ext_asi | store_i 
!!# ;
!!# 
!!# icerr: mMETA3
!!# {
!!#    IJ_printf (th_0, "IC_ERR_%d:\n", ic_err_cnt);
!!#    occ = random () % 2 + 1;
!!#    bitnum = random () % 34;
!!#    IJ_printf (th_0, "!$EV error(0,expr(@VA(.MAIN.IC_ERR_%d), 16, 16),%d,IC_DATA,IR,%d,x)\n", ic_err_cnt, occ, bitnum);
!!#    ic_err_cnt++;
!!#    IJ_printf (th_1, "IC_ERR_%d:\n", ic_err_cnt);
!!#    occ = random () % 2 + 1;
!!#    bitnum = random () % 34;
!!#    IJ_printf (th_1, "!$EV error(1,expr(@VA(.MAIN.IC_ERR_%d), 16, 16),%d,IC_DATA,IR,%d,x)\n", ic_err_cnt, occ, bitnum);
!!#    ic_err_cnt++;
!!#    IJ_printf (th_2, "IC_ERR_%d:\n", ic_err_cnt);
!!#    occ = random () % 2 + 1;
!!#    bitnum = random () % 34;
!!#    IJ_printf (th_2, "!$EV error(2,expr(@VA(.MAIN.IC_ERR_%d), 16, 16),%d,IC_DATA,IR,%d,x)\n", ic_err_cnt, occ, bitnum);
!!#    ic_err_cnt++;
!!#    IJ_printf (th_3, "IC_ERR_%d:\n", ic_err_cnt);
!!#    occ = random () % 2 + 1;
!!#    bitnum = random () % 34;
!!#    IJ_printf (th_3, "!$EV error(3,expr(@VA(.MAIN.IC_ERR_%d), 16, 16),%d,IC_DATA,IR,%d,x)\n", ic_err_cnt, occ, bitnum);
!!#    ic_err_cnt++;
!!# }
!!# ;
!!# 
!!# dcerr: mMETA5
!!# {
!!#    IJ_printf (th_0, "DC_ERR_%d:\n", dc_err_cnt);
!!#    occ = random () % 2 + 1;
!!#    bitnum = random () % 72;
!!#    IJ_printf (th_0, "!$EV error(0,expr(@VA(.MAIN.DC_ERR_%d), 16, 16),%d,DC_DATA,%d)\n", dc_err_cnt, occ, bitnum);
!!#    dc_err_cnt++;
!!#    IJ_printf (th_1, "DC_ERR_%d:\n", dc_err_cnt);
!!#    occ = random () % 2 + 1;
!!#    bitnum = random () % 34;
!!#    IJ_printf (th_1, "!$EV error(1,expr(@VA(.MAIN.DC_ERR_%d), 16, 16),%d,DC_DATA,%d)\n", dc_err_cnt, occ, bitnum);
!!#    dc_err_cnt++;
!!#    IJ_printf (th_2, "DC_ERR_%d:\n", dc_err_cnt);
!!#    occ = random () % 2 + 1;
!!#    bitnum = random () % 34;
!!#    IJ_printf (th_2, "!$EV error(2,expr(@VA(.MAIN.DC_ERR_%d), 16, 16),%d,DC_DATA,%d)\n", dc_err_cnt, occ, bitnum);
!!#    dc_err_cnt++;
!!#    IJ_printf (th_3, "DC_ERR_%d:\n", dc_err_cnt);
!!#    occ = random () % 2 + 1;
!!#    bitnum = random () % 34;
!!#    IJ_printf (th_3, "!$EV error(3,expr(@VA(.MAIN.DC_ERR_%d), 16, 16),%d,DC_DATA,%d)\n", dc_err_cnt, occ, bitnum);
!!#    dc_err_cnt++;
!!# }
!!# ;
!!# 
!!# irferr: mMETA100
!!# {
!!#      IJ_printf (th_0, "IRF_CE_%d:\n", irf_err_cnt);
!!#      bitnum = random () % 72;
!!#      IJ_printf (th_0, "!$EV error(0,expr(@VA(.MAIN.IRF_CE_%d), 16, 16), 1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      bitnum = random () % 72;
!!#      IJ_printf (th_0, "!$EV error(0,expr(@VA(.MAIN.IRF_CE_%d), 16, 16), 3,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      irf_err_cnt++;
!!#      IJ_printf (th_1, "IRF_CE_%d:\n", irf_err_cnt);
!!#      bitnum = random () % 72;
!!#      IJ_printf (th_1, "!$EV error(1,expr(@VA(.MAIN.IRF_CE_%d), 16, 16), 1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      bitnum = random () % 72;
!!#      IJ_printf (th_1, "!$EV error(1,expr(@VA(.MAIN.IRF_CE_%d), 16, 16), 3,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      irf_err_cnt++;
!!#      IJ_printf (th_2, "IRF_CE_%d:\n", irf_err_cnt);
!!#      bitnum = random () % 72;
!!#      IJ_printf (th_2, "!$EV error(2,expr(@VA(.MAIN.IRF_CE_%d), 16, 16), 1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      bitnum = random () % 72;
!!#      IJ_printf (th_2, "!$EV error(2,expr(@VA(.MAIN.IRF_CE_%d), 16, 16), 3,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      irf_err_cnt++;
!!#      IJ_printf (th_3, "IRF_CE_%d:\n", irf_err_cnt);
!!#      bitnum = random () % 72;
!!#      IJ_printf (th_3, "!$EV error(3,expr(@VA(.MAIN.IRF_CE_%d), 16, 16), 1,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      bitnum = random () % 72;
!!#      IJ_printf (th_3, "!$EV error(3,expr(@VA(.MAIN.IRF_CE_%d), 16, 16), 3,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, bitnum);
!!#      irf_err_cnt++;
!!# }
!!# ;
!!# 
!!# trpm_alu: alu 
!!#             { 
!!#               IJ_generate (th_all, $1);
!!#             }
!!#           | trpm
!!# ;
!!# 
!!# chpriv: ch_hpriv | ch_spriv
!!# ;
!!# 
!!# ch_hpriv: mMETA1
!!# { 
!!#   IJ_printf (th_all, "\tta T_CHANGE_HPRIV !To allow ASI writes to D-I caches\n");
!!# }
!!# ;
!!# 
!!# ch_spriv: mMETA2
!!# {
!!#   IJ_printf (th_all, "\tta T_CHANGE_PRIV\n");  
!!# }
!!# ;
!!# 
!!# lop: mul | div | fpop | load | asi_load | st_ext_asi | st_int_asi 
!!#      | br | membar | atomic | flush | prefetch
!!# ;
!!# 
!!# fpop:st_fp | arith_fp
!!# ;
!!# 
!!# mul: tMULX_R | tMULX_I | tUMUL_R | tUMUL_I | tSMUL_R | tSMUL_I | tUMULcc_R 
!!#      | tUMULcc_I | tSMULcc_R | tSMULcc_I | tMULScc_R | tMULScc_I
!!# ;
!!# 
!!# div: tUDIV_I | tUDIV_R | tSDIV_I | tSDIV_R | tSDIVX_R | tSDIVX_I | tUDIVX_R 
!!#      | tUDIVX_I | tUDIVcc_I | tUDIVcc_R | tSDIVcc_I | tSDIVcc_R
!!# ;
!!# 
!!# load: tLDSB_R | tLDSB_I | tLDSH_R | tLDSH_I | tLDSW_R | tLDSW_I | tLDUB_R 
!!#       | tLDUB_I | tLDUH_R | tLDUH_I | tLDUW_R | tLDUW_I | tLDX_R | tLDX_I 
!!#       | tLDD_R | tLDD_I 
!!# ;
!!# 
!!# asi_load: tLDSBA_R | tLDSBA_I | tLDSHA_R | tLDSHA_I | tLDSWA_R | tLDSWA_I 
!!#           | tLDUBA_R | tLDUBA_I | tLDUHA_R | tLDUHA_I | tLDUWA_R | tLDUWA_I 
!!#           | tLDXA_R | tLDXA_I | tLDDA_R | tLDDA_I 
!!# ;
!!# 
!!# br: tBA | tBN | tBNE | tBE | tBG | tBLE | tBGE | tBL | tBGU | 
!!#     tBLEU | tBCC | tBCS | tBPOS | tBNEG | tBVC | tBVS | tBRZ |
!!#     tBRLEZ | tBRLZ | tBRNZ | tBRGZ | tBRGEZ | tCALL 
!!# ;
!!# 
!!# membar: tMEMBAR | tSTBAR
!!# ;
!!# 
!!# atomic: tCASA_R | tCASA_I | tCASXA_R | tCASXA_I | tLDSTUBA_I | tLDSTUB_I 
!!#         | tLDSTUB_R | tLDSTUBA_R | tSWAP_I | tSWAP_R | tSWAPA_I | tSWAPA_R
!!# ;
!!# 
!!# st_fp: tSTF_R | tSTF_I | tSTDF_I | tSTDF_R
!!# ;
!!# 
!!# arith_fp: tFADDs | tFSUBs | tFMULs | tFDIVs
!!# ;
!!# 
!!# prefetch: tPREFETCH_I | tPREFETCH_R | tPREFETCHA_I | tPREFETCHA_R
!!# ;
!!# 
!!# flush: tFLUSH_I | tFLUSH_R
!!# ;
!!# 
!!# setx: mMETA4
!!# {
!!#   regid = random () % 7 + 9;
!!#   IJ_printf (th_all, "\tsetx  0x%016llrx, %%r16, %%r%d\n", reg_rand_init, regid);
!!#   if (regid % 2 == 0) {
!!#     IJ_printf (th_all, "\tsetx  0x%016llrx, %%r16, %%r2\n", int_asi_reg_rand_init);
!!#   }
!!# }
!!# ;
!!# 
!!# store_i: tSTB_I | tSTH_I | tSTW_I | tSTX_I 
!!# ;
!!# 
!!# st_ext_asi: tSTBA_R | tSTHA_R | tSTWA_R | tSTXA_R | tSTDA_R | 
!!#             tSTBA_I | tSTHA_I | tSTWA_I | tSTXA_I | tSTDA_I
!!# ;
!!# 
!!# st_int_asi: d2 tSTXA_R %ropr Ro_int_asi 
!!# {$$ = $2}
!!# ;
!!# 
!!# trpm: mMETA6
!!# {
!!#   IJ_printf (th_all, "\t.word 0xae010045\n");
!!# }
!!# ;
!!# 
!!# alu: tADD_R | tADD_I | tAND_R | tAND_I | tANDN_R | tANDN_I 
!!#      | tOR_R | tOR_I | tORN_R | tORN_I | tXOR_R | tXOR_I 
!!#      | tXNOR_R | tXNOR_I | tMOVR_R | tMOVR_I | tSLL_R | tSLL_I 
!!#      | tSRL_R | tSRL_I | tSRA_R | tSRA_I | tSLLX_R | tSLLX_I 
!!#      | tSRLX_R | tSRLX_I | tSRAX_R | tSRAX_I | tSUB_R | tSUB_I 
!!#      | tSUBC_R | tSUBC_I 
!!# ;
!!# 
!!# d0: mMETA0
!!# ;
!!# 
!!# d1: mMETA7
!!# ;
!!# 
!!# d2: mMETA8
!!# ;
!!# 
!!# %%
!!# endtemplate
#endif

