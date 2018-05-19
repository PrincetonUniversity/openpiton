// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3685.s
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
   random seed:	891326904
   Jal stb9b.j:	
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

	ta	%icc, T_RD_THID
! fork: source strm = 0xffffffff; target strm = 0x1
	cmp	%o1, 0
	setx	fork_lbl_0_1, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	setx  0x550706cfb018f0b1, %r16, %r17
	setx  0x73ba75aec4a648dd, %r16, %r18
	setx  0xaf1d740590a547b4, %r16, %r19
	setx  0x60a962694845009c, %r16, %r20
	setx  0xabd49018789679e2, %r16, %r21
	setx  0x429a63a300c022ba, %r16, %r22
	setx  0x6ff11085393f33ae, %r16, %r23
	setx  0xd735fc35ba7ad600, %r16, %r24
	setx  0x1cb8025743678a6e, %r16, %r25
	setx  0x7c698a882eeba89e, %r16, %r26
	setx  0x1654066c6500e850, %r16, %r27
	setx  0x7ccd0c707eb90a8b, %r16, %r28
	setx  0x7378c7158f466896, %r16, %r29
	setx  0x10096010af05d6da, %r16, %r30
	setx  0x1ca9f4d9bea413bc, %r16, %r31
	setx  0x0000000000000200, %r16, %r9
	setx  0x0000000000000d40, %r16, %r10
	setx  0x0000000000000d10, %r16, %r11
	setx  0x0000000000000030, %r16, %r12
	setx  0x00000000000003e0, %r16, %r13
	setx  0x00000000000006a0, %r16, %r14
	setx  0x0000000000000340, %r16, %r15
	setx MAIN_BASE_DATA_VA, %r16, %r3
	setx MAIN_BASE_DATA_VA, %r16, %r4
	setx MAIN_BASE_DATA_VA, %r16, %r5
	setx MAIN_BASE_DATA_VA, %r16, %r6
	setx MAIN_BASE_DATA_VA, %r16, %r7
	setx MAIN_BASE_DATA_VA, %r16, %r8
	setx  0x0000000000001098, %r16, %r2
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
	ta T_CHANGE_HPRIV !To allow ASI writes to D-I caches
	wr  %r0, 0x80, %asi
!Generating store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_0:
	.word 0xb610c00f  ! 9: OR_R	or 	%r3, %r15, %r27
	.word 0xac00c00b  ! 9: ADD_R	add 	%r3, %r11, %r22
	.word 0xb401400d  ! 9: ADD_R	add 	%r5, %r13, %r26
	.word 0xae0a25fb  ! 9: AND_I	and 	%r8, 0x05fb, %r23
	.word 0xa409691d  ! 9: AND_I	and 	%r5, 0x091d, %r18
	.word 0xb011400c  ! 9: OR_R	or 	%r5, %r12, %r24
	.word 0xba098009  ! 9: AND_R	and 	%r6, %r9, %r29
	.word 0xa401800a  ! 9: ADD_R	add 	%r6, %r10, %r18
	.word 0xb811c00c  ! 9: OR_R	or 	%r7, %r12, %r28
	.word 0xbc02000c  ! 9: ADD_R	add 	%r8, %r12, %r30
	.word 0xba092213  ! 9: AND_I	and 	%r4, 0x0213, %r29
	.word 0xaa022c68  ! 9: ADD_I	add 	%r8, 0x0c68, %r21
	.word 0xb411e594  ! 9: OR_I	or 	%r7, 0x0594, %r26
	.word 0xaa10e0d5  ! 9: OR_I	or 	%r3, 0x00d5, %r21
	.word 0xac01c00f  ! 9: ADD_R	add 	%r7, %r15, %r22
	.word 0xaa11c00f  ! 9: OR_R	or 	%r7, %r15, %r21
	.word 0xb4116de9  ! 9: OR_I	or 	%r5, 0x0de9, %r26
	.word 0xa209400d  ! 9: AND_R	and 	%r5, %r13, %r17
	.word 0xba09c00b  ! 9: AND_R	and 	%r7, %r11, %r29
	.word 0xa401000d  ! 9: ADD_R	add 	%r4, %r13, %r18
	.word 0xa802000f  ! 9: ADD_R	add 	%r8, %r15, %r20
	.word 0xb0116686  ! 9: OR_I	or 	%r5, 0x0686, %r24
	.word 0xb209ef32  ! 9: AND_I	and 	%r7, 0x0f32, %r25
	.word 0xa2092698  ! 9: AND_I	and 	%r4, 0x0698, %r17
	.word 0xa2092216  ! 9: AND_I	and 	%r4, 0x0216, %r17
	.word 0xb60a2e01  ! 9: AND_I	and 	%r8, 0x0e01, %r27
	.word 0xa8112ef8  ! 9: OR_I	or 	%r4, 0x0ef8, %r20
	.word 0xac11a740  ! 9: OR_I	or 	%r6, 0x0740, %r22
	.word 0xb001aa72  ! 9: ADD_I	add 	%r6, 0x0a72, %r24
	.word 0xa200ec9e  ! 9: ADD_I	add 	%r3, 0x0c9e, %r17
	.word 0xac0a2614  ! 9: AND_I	and 	%r8, 0x0614, %r22
	.word 0xb612000e  ! 9: OR_R	or 	%r8, %r14, %r27
	.word 0xb410c009  ! 9: OR_R	or 	%r3, %r9, %r26
	.word 0xa21223e2  ! 9: OR_I	or 	%r8, 0x03e2, %r17
	.word 0xbc11400f  ! 9: OR_R	or 	%r5, %r15, %r30
	.word 0xa408e9cc  ! 9: AND_I	and 	%r3, 0x09cc, %r18
	.word 0xae01400b  ! 9: ADD_R	add 	%r5, %r11, %r23
	.word 0xb002000f  ! 9: ADD_R	add 	%r8, %r15, %r24
	.word 0xac10c00d  ! 9: OR_R	or 	%r3, %r13, %r22
	.word 0xb0010009  ! 9: ADD_R	add 	%r4, %r9, %r24
	.word 0xaa11c009  ! 9: OR_R	or 	%r7, %r9, %r21
	.word 0xbc10c00d  ! 9: OR_R	or 	%r3, %r13, %r30
	.word 0xa401c00a  ! 9: ADD_R	add 	%r7, %r10, %r18
	.word 0xae09e29d  ! 9: AND_I	and 	%r7, 0x029d, %r23
	.word 0xae10c00c  ! 9: OR_R	or 	%r3, %r12, %r23
	.word 0xaa122347  ! 9: OR_I	or 	%r8, 0x0347, %r21
	.word 0xbc09ea7f  ! 9: AND_I	and 	%r7, 0x0a7f, %r30
	.word 0xaa01000f  ! 9: ADD_R	add 	%r4, %r15, %r21
	.word 0xb611800e  ! 9: OR_R	or 	%r6, %r14, %r27
	.word 0xa809c009  ! 9: AND_R	and 	%r7, %r9, %r20
	.word 0xb010ec49  ! 9: OR_I	or 	%r3, 0x0c49, %r24
	.word 0xb8096972  ! 9: AND_I	and 	%r5, 0x0972, %r28
	.word 0xb012236f  ! 9: OR_I	or 	%r8, 0x036f, %r24
	.word 0xb211000f  ! 9: OR_R	or 	%r4, %r15, %r25
	.word 0xae09c00b  ! 9: AND_R	and 	%r7, %r11, %r23
	.word 0xa611800c  ! 9: OR_R	or 	%r6, %r12, %r19
	.word 0xa601000d  ! 9: ADD_R	add 	%r4, %r13, %r19
	.word 0xa611e53b  ! 9: OR_I	or 	%r7, 0x053b, %r19
	.word 0xbe10efb5  ! 9: OR_I	or 	%r3, 0x0fb5, %r31
	.word 0xbe0120d1  ! 9: ADD_I	add 	%r4, 0x00d1, %r31
	.word 0xa801400c  ! 9: ADD_R	add 	%r5, %r12, %r20
	.word 0xaa10e21d  ! 9: OR_I	or 	%r3, 0x021d, %r21
	.word 0xbe11e3c7  ! 9: OR_I	or 	%r7, 0x03c7, %r31
	.word 0xbc11a218  ! 9: OR_I	or 	%r6, 0x0218, %r30
	.word 0xa211e45f  ! 9: OR_I	or 	%r7, 0x045f, %r17
	.word 0xa812000f  ! 9: OR_R	or 	%r8, %r15, %r20
	.word 0xb00223bd  ! 9: ADD_I	add 	%r8, 0x03bd, %r24
	.word 0xb6122eac  ! 9: OR_I	or 	%r8, 0x0eac, %r27
	.word 0xae11c00b  ! 9: OR_R	or 	%r7, %r11, %r23
	.word 0xb8096d9a  ! 9: AND_I	and 	%r5, 0x0d9a, %r28
	.word 0xb609000a  ! 9: AND_R	and 	%r4, %r10, %r27
	.word 0xb812000c  ! 9: OR_R	or 	%r8, %r12, %r28
	.word 0xa808c009  ! 9: AND_R	and 	%r3, %r9, %r20
	.word 0xba0a29e5  ! 9: AND_I	and 	%r8, 0x09e5, %r29
	.word 0xa211400a  ! 9: OR_R	or 	%r5, %r10, %r17
	.word 0xa811e490  ! 9: OR_I	or 	%r7, 0x0490, %r20
	.word 0xac01a22c  ! 9: ADD_I	add 	%r6, 0x022c, %r22
	.word 0xb001800d  ! 9: ADD_R	add 	%r6, %r13, %r24
	.word 0xa2116d56  ! 9: OR_I	or 	%r5, 0x0d56, %r17
	.word 0xb8022f19  ! 9: ADD_I	add 	%r8, 0x0f19, %r28
	.word 0xb40a293b  ! 9: AND_I	and 	%r8, 0x093b, %r26
	.word 0xbe02000b  ! 9: ADD_R	add 	%r8, %r11, %r31
	.word 0xa2096eba  ! 9: AND_I	and 	%r5, 0x0eba, %r17
	.word 0xa200e867  ! 9: ADD_I	add 	%r3, 0x0867, %r17
	.word 0xbe01e69d  ! 9: ADD_I	add 	%r7, 0x069d, %r31
	.word 0xa608c009  ! 9: AND_R	and 	%r3, %r9, %r19
	.word 0xb0096d7c  ! 9: AND_I	and 	%r5, 0x0d7c, %r24
	.word 0xaa11209a  ! 9: OR_I	or 	%r4, 0x009a, %r21
	.word 0xb6018009  ! 9: ADD_R	add 	%r6, %r9, %r27
	.word 0xa609ea2c  ! 9: AND_I	and 	%r7, 0x0a2c, %r19
	.word 0xa4022136  ! 9: ADD_I	add 	%r8, 0x0136, %r18
	.word 0xa609e15f  ! 9: AND_I	and 	%r7, 0x015f, %r19
	.word 0xac012520  ! 9: ADD_I	add 	%r4, 0x0520, %r22
	.word 0xbe0a000e  ! 9: AND_R	and 	%r8, %r14, %r31
	.word 0xe4712d50  ! 9: STX_I	stx	%r18, [%r4 + 0x0d50]
	.word 0xfa316220  ! 9: STH_I	sth	%r29, [%r5 + 0x0220]
	.word 0xfe21af7c  ! 9: STW_I	stw	%r31, [%r6 + 0x0f7c]
	.word 0xec70ee60  ! 9: STX_I	stx	%r22, [%r3 + 0x0e60]
	.word 0xfa31a5fe  ! 9: STH_I	sth	%r29, [%r6 + 0x05fe]
	.word 0xe4716510  ! 9: STX_I	stx	%r18, [%r5 + 0x0510]
	.word 0xec71a188  ! 9: STX_I	stx	%r22, [%r6 + 0x0188]
	.word 0xe270ed20  ! 9: STX_I	stx	%r17, [%r3 + 0x0d20]
thr0_dc_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_0), 16, 16),2,DC_DATA,0)
	.word 0xe211400d  ! 11: LDUH_R	lduh	[%r5 + %r13], %r17
	.word 0xa2396d27  ! 12: XNOR_I	xnor 	%r5, 0x0d27, %r17
	.word 0xc0f00962  ! 14: STXA_R	stxa	%r0, [%r0 + %r2] 0x4b
	.word 0xb651c00c  ! 15: UMUL_R	umul 	%r7, %r12, %r27
	.word 0xa601ecc3  ! 15: ADD_I	add 	%r7, 0x0cc3, %r19
	.word 0xa8122771  ! 15: OR_I	or 	%r8, 0x0771, %r20
	.word 0xb409400c  ! 15: AND_R	and 	%r5, %r12, %r26
	bne thr0_loop_0
	subcc %g1, 0x1, %g1
!Generating store chunk 1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_1:
	.word 0xb001000a  ! 22: ADD_R	add 	%r4, %r10, %r24
	.word 0xae00c009  ! 22: ADD_R	add 	%r3, %r9, %r23
	.word 0xbe01400d  ! 22: ADD_R	add 	%r5, %r13, %r31
	.word 0xb401000a  ! 22: ADD_R	add 	%r4, %r10, %r26
	.word 0xbe09000d  ! 22: AND_R	and 	%r4, %r13, %r31
	.word 0xae09800e  ! 22: AND_R	and 	%r6, %r14, %r23
	.word 0xbc112481  ! 22: OR_I	or 	%r4, 0x0481, %r30
	.word 0xac09800b  ! 22: AND_R	and 	%r6, %r11, %r22
	.word 0xbc09637d  ! 22: AND_I	and 	%r5, 0x037d, %r30
	.word 0xb402000d  ! 22: ADD_R	add 	%r8, %r13, %r26
	.word 0xac10c00a  ! 22: OR_R	or 	%r3, %r10, %r22
	.word 0xb809800e  ! 22: AND_R	and 	%r6, %r14, %r28
	.word 0xa600c00b  ! 22: ADD_R	add 	%r3, %r11, %r19
	.word 0xb410c00f  ! 22: OR_R	or 	%r3, %r15, %r26
	.word 0xbe11e7b4  ! 22: OR_I	or 	%r7, 0x07b4, %r31
	.word 0xa209c00a  ! 22: AND_R	and 	%r7, %r10, %r17
	.word 0xa410c00b  ! 22: OR_R	or 	%r3, %r11, %r18
	.word 0xba116f91  ! 22: OR_I	or 	%r5, 0x0f91, %r29
	.word 0xba00c00f  ! 22: ADD_R	add 	%r3, %r15, %r29
	.word 0xa609e8af  ! 22: AND_I	and 	%r7, 0x08af, %r19
	.word 0xa612000c  ! 22: OR_R	or 	%r8, %r12, %r19
	.word 0xb40a000a  ! 22: AND_R	and 	%r8, %r10, %r26
	.word 0xba08c00c  ! 22: AND_R	and 	%r3, %r12, %r29
	.word 0xba00e3b2  ! 22: ADD_I	add 	%r3, 0x03b2, %r29
	.word 0xb80a26ff  ! 22: AND_I	and 	%r8, 0x06ff, %r28
	.word 0xa409800e  ! 22: AND_R	and 	%r6, %r14, %r18
	.word 0xaa11c00c  ! 22: OR_R	or 	%r7, %r12, %r21
	.word 0xa409c00c  ! 22: AND_R	and 	%r7, %r12, %r18
	.word 0xa601e75b  ! 22: ADD_I	add 	%r7, 0x075b, %r19
	.word 0xa600eb86  ! 22: ADD_I	add 	%r3, 0x0b86, %r19
	.word 0xa40164ac  ! 22: ADD_I	add 	%r5, 0x04ac, %r18
	.word 0xac11800f  ! 22: OR_R	or 	%r6, %r15, %r22
	.word 0xb20925e5  ! 22: AND_I	and 	%r4, 0x05e5, %r25
	.word 0xaa09e483  ! 22: AND_I	and 	%r7, 0x0483, %r21
	.word 0xa610ea83  ! 22: OR_I	or 	%r3, 0x0a83, %r19
	.word 0xa609400e  ! 22: AND_R	and 	%r5, %r14, %r19
	.word 0xbc09400c  ! 22: AND_R	and 	%r5, %r12, %r30
	.word 0xa8118009  ! 22: OR_R	or 	%r6, %r9, %r20
	.word 0xa810ef8e  ! 22: OR_I	or 	%r3, 0x0f8e, %r20
	.word 0xae09400b  ! 22: AND_R	and 	%r5, %r11, %r23
	.word 0xb601000f  ! 22: ADD_R	add 	%r4, %r15, %r27
	.word 0xbc11000a  ! 22: OR_R	or 	%r4, %r10, %r30
	.word 0xa202000a  ! 22: ADD_R	add 	%r8, %r10, %r17
	.word 0xba01c00c  ! 22: ADD_R	add 	%r7, %r12, %r29
	.word 0xac11000f  ! 22: OR_R	or 	%r4, %r15, %r22
	.word 0xb61166cd  ! 22: OR_I	or 	%r5, 0x06cd, %r27
	.word 0xb609800d  ! 22: AND_R	and 	%r6, %r13, %r27
	.word 0xba09ee9d  ! 22: AND_I	and 	%r7, 0x0e9d, %r29
	.word 0xaa10ea16  ! 22: OR_I	or 	%r3, 0x0a16, %r21
	.word 0xae09800b  ! 22: AND_R	and 	%r6, %r11, %r23
	.word 0xb400ed0f  ! 22: ADD_I	add 	%r3, 0x0d0f, %r26
	.word 0xac09000c  ! 22: AND_R	and 	%r4, %r12, %r22
	.word 0xbe1166b5  ! 22: OR_I	or 	%r5, 0x06b5, %r31
	.word 0xac016ce3  ! 22: ADD_I	add 	%r5, 0x0ce3, %r22
	.word 0xa202000a  ! 22: ADD_R	add 	%r8, %r10, %r17
	.word 0xb809000f  ! 22: AND_R	and 	%r4, %r15, %r28
	.word 0xb809800f  ! 22: AND_R	and 	%r6, %r15, %r28
	.word 0xa211e6e4  ! 22: OR_I	or 	%r7, 0x06e4, %r17
	.word 0xa611400a  ! 22: OR_R	or 	%r5, %r10, %r19
	.word 0xa600ee6a  ! 22: ADD_I	add 	%r3, 0x0e6a, %r19
	.word 0xbe11c00f  ! 22: OR_R	or 	%r7, %r15, %r31
	.word 0xa412000d  ! 22: OR_R	or 	%r8, %r13, %r18
	.word 0xae09000d  ! 22: AND_R	and 	%r4, %r13, %r23
	.word 0xb008c00a  ! 22: AND_R	and 	%r3, %r10, %r24
	.word 0xae016968  ! 22: ADD_I	add 	%r5, 0x0968, %r23
	.word 0xa8022216  ! 22: ADD_I	add 	%r8, 0x0216, %r20
	.word 0xa411800d  ! 22: OR_R	or 	%r6, %r13, %r18
	.word 0xba096d3a  ! 22: AND_I	and 	%r5, 0x0d3a, %r29
	.word 0xbc0a0009  ! 22: AND_R	and 	%r8, %r9, %r30
	.word 0xb80a000d  ! 22: AND_R	and 	%r8, %r13, %r28
	.word 0xa410c00f  ! 22: OR_R	or 	%r3, %r15, %r18
	.word 0xa60123db  ! 22: ADD_I	add 	%r4, 0x03db, %r19
	.word 0xb601ea36  ! 22: ADD_I	add 	%r7, 0x0a36, %r27
	.word 0xac09000d  ! 22: AND_R	and 	%r4, %r13, %r22
	.word 0xba00e510  ! 22: ADD_I	add 	%r3, 0x0510, %r29
	.word 0xb001400b  ! 22: ADD_R	add 	%r5, %r11, %r24
	.word 0xac022495  ! 22: ADD_I	add 	%r8, 0x0495, %r22
	.word 0xaa016bd6  ! 22: ADD_I	add 	%r5, 0x0bd6, %r21
	.word 0xa811eebf  ! 22: OR_I	or 	%r7, 0x0ebf, %r20
	.word 0xac0a000c  ! 22: AND_R	and 	%r8, %r12, %r22
	.word 0xa4020009  ! 22: ADD_R	add 	%r8, %r9, %r18
	.word 0xa811000e  ! 22: OR_R	or 	%r4, %r14, %r20
	.word 0xba09400b  ! 22: AND_R	and 	%r5, %r11, %r29
	.word 0xb210c00e  ! 22: OR_R	or 	%r3, %r14, %r25
	.word 0xa600c00e  ! 22: ADD_R	add 	%r3, %r14, %r19
	.word 0xa811800f  ! 22: OR_R	or 	%r6, %r15, %r20
	.word 0xb008efcb  ! 22: AND_I	and 	%r3, 0x0fcb, %r24
	.word 0xa211000e  ! 22: OR_R	or 	%r4, %r14, %r17
	.word 0xa801400c  ! 22: ADD_R	add 	%r5, %r12, %r20
	.word 0xb41127cc  ! 22: OR_I	or 	%r4, 0x07cc, %r26
	.word 0xa611a550  ! 22: OR_I	or 	%r6, 0x0550, %r19
	.word 0xb401800f  ! 22: ADD_R	add 	%r6, %r15, %r26
	.word 0xb809800a  ! 22: AND_R	and 	%r6, %r10, %r28
	.word 0xa801e728  ! 22: ADD_I	add 	%r7, 0x0728, %r20
	.word 0xa209c00d  ! 22: AND_R	and 	%r7, %r13, %r17
	.word 0xe471e228  ! 22: STX_I	stx	%r18, [%r7 + 0x0228]
	.word 0xe6222044  ! 22: STW_I	stw	%r19, [%r8 + 0x0044]
	.word 0xfc21ad98  ! 22: STW_I	stw	%r30, [%r6 + 0x0d98]
	.word 0xe220e3b8  ! 22: STW_I	stw	%r17, [%r3 + 0x03b8]
	.word 0xe428ef7e  ! 22: STB_I	stb	%r18, [%r3 + 0x0f7e]
	.word 0xe8222dc0  ! 22: STW_I	stw	%r20, [%r8 + 0x0dc0]
thr0_irf_ce_0:
!$EV error(0,expr(@VA(.MAIN.thr0_irf_ce_0), 16, 16),1,IRF,ce,54,x, x,x,x, x,x,x)
	.word 0xe8322ed5  ! 25: STH_I	sth	%r20, [%r8 + 0x0ed5]
	.word 0xae010045
	.word 0xe221290c  ! 27: STW_I	stw	%r17, [%r4 + 0x090c]
	.word 0xc0f008e2  ! 29: STXA_R	stxa	%r0, [%r0 + %r2] 0x47
	.word 0xe73923f8  ! 31: STDF_I	std	%f19, [0x03f8, %r4]
	.word 0xba120009  ! 31: OR_R	or 	%r8, %r9, %r29
	.word 0xb001400b  ! 31: ADD_R	add 	%r5, %r11, %r24
	.word 0xb4022947  ! 31: ADD_I	add 	%r8, 0x0947, %r26
	bne thr0_loop_1
	subcc %g1, 0x1, %g1
!Generating store_chunk_3
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_2:
	.word 0xa409c00d  ! 41: AND_R	and 	%r7, %r13, %r18
	.word 0xa4122015  ! 41: OR_I	or 	%r8, 0x0015, %r18
	.word 0xb808e630  ! 41: AND_I	and 	%r3, 0x0630, %r28
	.word 0xa811eb04  ! 41: OR_I	or 	%r7, 0x0b04, %r20
	.word 0xae01a647  ! 41: ADD_I	add 	%r6, 0x0647, %r23
	.word 0xb009400c  ! 41: AND_R	and 	%r5, %r12, %r24
	.word 0xb011400e  ! 41: OR_R	or 	%r5, %r14, %r24
	.word 0xba11a000  ! 41: OR_I	or 	%r6, 0x0000, %r29
	.word 0xa208e2e1  ! 41: AND_I	and 	%r3, 0x02e1, %r17
	.word 0xb801a84b  ! 41: ADD_I	add 	%r6, 0x084b, %r28
	.word 0xb401000f  ! 41: ADD_R	add 	%r4, %r15, %r26
	.word 0xba11255c  ! 41: OR_I	or 	%r4, 0x055c, %r29
	.word 0xb80227f4  ! 41: ADD_I	add 	%r8, 0x07f4, %r28
	.word 0xbc0a207a  ! 41: AND_I	and 	%r8, 0x007a, %r30
	.word 0xa401c00f  ! 41: ADD_R	add 	%r7, %r15, %r18
	.word 0xa611800f  ! 41: OR_R	or 	%r6, %r15, %r19
	.word 0xaa122502  ! 41: OR_I	or 	%r8, 0x0502, %r21
	.word 0xac01ef8e  ! 41: ADD_I	add 	%r7, 0x0f8e, %r22
	.word 0xae10c00f  ! 41: OR_R	or 	%r3, %r15, %r23
	.word 0xa211e4b6  ! 41: OR_I	or 	%r7, 0x04b6, %r17
	.word 0xb011a815  ! 41: OR_I	or 	%r6, 0x0815, %r24
	.word 0xa800ea37  ! 41: ADD_I	add 	%r3, 0x0a37, %r20
	.word 0xae092bc7  ! 41: AND_I	and 	%r4, 0x0bc7, %r23
	.word 0xb009400b  ! 41: AND_R	and 	%r5, %r11, %r24
	.word 0xb612000d  ! 41: OR_R	or 	%r8, %r13, %r27
	.word 0xb410e89e  ! 41: OR_I	or 	%r3, 0x089e, %r26
	.word 0xb00a2b9a  ! 41: AND_I	and 	%r8, 0x0b9a, %r24
	.word 0xba01000c  ! 41: ADD_R	add 	%r4, %r12, %r29
	.word 0xac0a000c  ! 41: AND_R	and 	%r8, %r12, %r22
	.word 0xb401400b  ! 41: ADD_R	add 	%r5, %r11, %r26
	.word 0xb609800d  ! 41: AND_R	and 	%r6, %r13, %r27
	.word 0xb201000a  ! 41: ADD_R	add 	%r4, %r10, %r25
	.word 0xb411000d  ! 41: OR_R	or 	%r4, %r13, %r26
	.word 0xa200e775  ! 41: ADD_I	add 	%r3, 0x0775, %r17
	.word 0xaa09800f  ! 41: AND_R	and 	%r6, %r15, %r21
	.word 0xb209efbf  ! 41: AND_I	and 	%r7, 0x0fbf, %r25
	.word 0xa81167f4  ! 41: OR_I	or 	%r5, 0x07f4, %r20
	.word 0xba11800b  ! 41: OR_R	or 	%r6, %r11, %r29
	.word 0xa409c00a  ! 41: AND_R	and 	%r7, %r10, %r18
	.word 0xbc11af73  ! 41: OR_I	or 	%r6, 0x0f73, %r30
	.word 0xa401222b  ! 41: ADD_I	add 	%r4, 0x022b, %r18
	.word 0xb8112127  ! 41: OR_I	or 	%r4, 0x0127, %r28
	.word 0xa811ac24  ! 41: OR_I	or 	%r6, 0x0c24, %r20
	.word 0xa80a0009  ! 41: AND_R	and 	%r8, %r9, %r20
	.word 0xaa0a261a  ! 41: AND_I	and 	%r8, 0x061a, %r21
	.word 0xa8122c3f  ! 41: OR_I	or 	%r8, 0x0c3f, %r20
	.word 0xb601634e  ! 41: ADD_I	add 	%r5, 0x034e, %r27
	.word 0xb601e17b  ! 41: ADD_I	add 	%r7, 0x017b, %r27
	.word 0xb809000a  ! 41: AND_R	and 	%r4, %r10, %r28
	.word 0xa408eb59  ! 41: AND_I	and 	%r3, 0x0b59, %r18
	.word 0xae11c00f  ! 41: OR_R	or 	%r7, %r15, %r23
	.word 0xa60a2e44  ! 41: AND_I	and 	%r8, 0x0e44, %r19
	.word 0xb009ea6a  ! 41: AND_I	and 	%r7, 0x0a6a, %r24
	.word 0xa609000c  ! 41: AND_R	and 	%r4, %r12, %r19
	.word 0xba0120fe  ! 41: ADD_I	add 	%r4, 0x00fe, %r29
	.word 0xa401c00e  ! 41: ADD_R	add 	%r7, %r14, %r18
	.word 0xb600c00e  ! 41: ADD_R	add 	%r3, %r14, %r27
	.word 0xbc09ab9f  ! 41: AND_I	and 	%r6, 0x0b9f, %r30
	.word 0xb209281e  ! 41: AND_I	and 	%r4, 0x081e, %r25
	.word 0xac012776  ! 41: ADD_I	add 	%r4, 0x0776, %r22
	.word 0xa80a2c8c  ! 41: AND_I	and 	%r8, 0x0c8c, %r20
	.word 0xae01a887  ! 41: ADD_I	add 	%r6, 0x0887, %r23
	.word 0xbe11400a  ! 41: OR_R	or 	%r5, %r10, %r31
	.word 0xb001800a  ! 41: ADD_R	add 	%r6, %r10, %r24
	.word 0xa4016fd8  ! 41: ADD_I	add 	%r5, 0x0fd8, %r18
	.word 0xba11c00b  ! 41: OR_R	or 	%r7, %r11, %r29
	.word 0xbc10ec44  ! 41: OR_I	or 	%r3, 0x0c44, %r30
	.word 0xb211eb02  ! 41: OR_I	or 	%r7, 0x0b02, %r25
	.word 0xa209e439  ! 41: AND_I	and 	%r7, 0x0439, %r17
	.word 0xa211400b  ! 41: OR_R	or 	%r5, %r11, %r17
	.word 0xaa10c00c  ! 41: OR_R	or 	%r3, %r12, %r21
	.word 0xa610ee6b  ! 41: OR_I	or 	%r3, 0x0e6b, %r19
	.word 0xbe01c009  ! 41: ADD_R	add 	%r7, %r9, %r31
	.word 0xb811400f  ! 41: OR_R	or 	%r5, %r15, %r28
	.word 0xa809eb4c  ! 41: AND_I	and 	%r7, 0x0b4c, %r20
	.word 0xbe09000b  ! 41: AND_R	and 	%r4, %r11, %r31
	.word 0xb80a216d  ! 41: AND_I	and 	%r8, 0x016d, %r28
	.word 0xa809000e  ! 41: AND_R	and 	%r4, %r14, %r20
	.word 0xb211800d  ! 41: OR_R	or 	%r6, %r13, %r25
	.word 0xaa0a2188  ! 41: AND_I	and 	%r8, 0x0188, %r21
	.word 0xa201ef6a  ! 41: ADD_I	add 	%r7, 0x0f6a, %r17
	.word 0xb011800c  ! 41: OR_R	or 	%r6, %r12, %r24
	.word 0xa209c00a  ! 41: AND_R	and 	%r7, %r10, %r17
	.word 0xb001800f  ! 41: ADD_R	add 	%r6, %r15, %r24
	.word 0xb208c00c  ! 41: AND_R	and 	%r3, %r12, %r25
	.word 0xba11800d  ! 41: OR_R	or 	%r6, %r13, %r29
	.word 0xa602000a  ! 41: ADD_R	add 	%r8, %r10, %r19
	.word 0xb0020009  ! 41: ADD_R	add 	%r8, %r9, %r24
	.word 0xb80a2864  ! 41: AND_I	and 	%r8, 0x0864, %r28
	.word 0xa4096015  ! 41: AND_I	and 	%r5, 0x0015, %r18
	.word 0xbc016bda  ! 41: ADD_I	add 	%r5, 0x0bda, %r30
	.word 0xa801000f  ! 41: ADD_R	add 	%r4, %r15, %r20
	.word 0xae012832  ! 41: ADD_I	add 	%r4, 0x0832, %r23
	.word 0xa600c00c  ! 41: ADD_R	add 	%r3, %r12, %r19
	.word 0xb810c00f  ! 41: OR_R	or 	%r3, %r15, %r28
	.word 0xea31e192  ! 41: STH_I	sth	%r21, [%r7 + 0x0192]
	.word 0xf031e5f0  ! 41: STH_I	sth	%r24, [%r7 + 0x05f0]
	.word 0xec312676  ! 41: STH_I	sth	%r22, [%r4 + 0x0676]
	.word 0xfa722778  ! 41: STX_I	stx	%r29, [%r8 + 0x0778]
	.word 0xf22123f4  ! 41: STW_I	stw	%r25, [%r4 + 0x03f4]
	.word 0xec716aa8  ! 41: STX_I	stx	%r22, [%r5 + 0x0aa8]
	.word 0xec29a813  ! 41: STB_I	stb	%r22, [%r6 + 0x0813]
	.word 0xe421ad54  ! 41: STW_I	stw	%r18, [%r6 + 0x0d54]
	.word 0xf050c00d  ! 41: LDSH_R	ldsh	[%r3 + %r13], %r24
thr0_ic_err_0:
!$EV error(0,expr(@VA(.MAIN.thr0_ic_err_0), 16, 16),2,IC_DATA,NIR,x,26)
	.word 0xc0f00962  ! 44: STXA_R	stxa	%r0, [%r0 + %r2] 0x4b
	.word 0xb008c009  ! 45: AND_R	and 	%r3, %r9, %r24
	.word 0xa808e875  ! 45: AND_I	and 	%r3, 0x0875, %r20
	.word 0xa408e44f  ! 45: AND_I	and 	%r3, 0x044f, %r18
	setx  0x0000000000000fd0, %r16, %r9
	bne thr0_loop_2
	subcc %g1, 0x1, %g1
!Generating store_chunk_3
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_3:
	.word 0xa4022af6  ! 55: ADD_I	add 	%r8, 0x0af6, %r18
	.word 0xac0a000c  ! 55: AND_R	and 	%r8, %r12, %r22
	.word 0xbc116bd6  ! 55: OR_I	or 	%r5, 0x0bd6, %r30
	.word 0xb4116f19  ! 55: OR_I	or 	%r5, 0x0f19, %r26
	.word 0xae01ec30  ! 55: ADD_I	add 	%r7, 0x0c30, %r23
	.word 0xac11400a  ! 55: OR_R	or 	%r5, %r10, %r22
	.word 0xb802000d  ! 55: ADD_R	add 	%r8, %r13, %r28
	.word 0xb809a4f5  ! 55: AND_I	and 	%r6, 0x04f5, %r28
	.word 0xbc122c4b  ! 55: OR_I	or 	%r8, 0x0c4b, %r30
	.word 0xa611ed8a  ! 55: OR_I	or 	%r7, 0x0d8a, %r19
	.word 0xae01000c  ! 55: ADD_R	add 	%r4, %r12, %r23
	.word 0xb002223d  ! 55: ADD_I	add 	%r8, 0x023d, %r24
	.word 0xa201e8a9  ! 55: ADD_I	add 	%r7, 0x08a9, %r17
	.word 0xba12000f  ! 55: OR_R	or 	%r8, %r15, %r29
	.word 0xa812000f  ! 55: OR_R	or 	%r8, %r15, %r20
	.word 0xac00ebc3  ! 55: ADD_I	add 	%r3, 0x0bc3, %r22
	.word 0xb211c00d  ! 55: OR_R	or 	%r7, %r13, %r25
	.word 0xac110009  ! 55: OR_R	or 	%r4, %r9, %r22
	.word 0xbc110009  ! 55: OR_R	or 	%r4, %r9, %r30
	.word 0xa8116dd5  ! 55: OR_I	or 	%r5, 0x0dd5, %r20
	.word 0xb009000a  ! 55: AND_R	and 	%r4, %r10, %r24
	.word 0xa212000c  ! 55: OR_R	or 	%r8, %r12, %r17
	.word 0xaa02000b  ! 55: ADD_R	add 	%r8, %r11, %r21
	.word 0xb408e885  ! 55: AND_I	and 	%r3, 0x0885, %r26
	.word 0xa60165e1  ! 55: ADD_I	add 	%r5, 0x05e1, %r19
	.word 0xa409800f  ! 55: AND_R	and 	%r6, %r15, %r18
	.word 0xae0a000b  ! 55: AND_R	and 	%r8, %r11, %r23
	.word 0xba00e207  ! 55: ADD_I	add 	%r3, 0x0207, %r29
	.word 0xac11000d  ! 55: OR_R	or 	%r4, %r13, %r22
	.word 0xa409400d  ! 55: AND_R	and 	%r5, %r13, %r18
	.word 0xaa10c00f  ! 55: OR_R	or 	%r3, %r15, %r21
	.word 0xb8010009  ! 55: ADD_R	add 	%r4, %r9, %r28
	.word 0xbc00e04f  ! 55: ADD_I	add 	%r3, 0x004f, %r30
	.word 0xa601800a  ! 55: ADD_R	add 	%r6, %r10, %r19
	.word 0xa610eea6  ! 55: OR_I	or 	%r3, 0x0ea6, %r19
	.word 0xb001000d  ! 55: ADD_R	add 	%r4, %r13, %r24
	.word 0xbc11c00f  ! 55: OR_R	or 	%r7, %r15, %r30
	.word 0xb610c00e  ! 55: OR_R	or 	%r3, %r14, %r27
	.word 0xa401e4a5  ! 55: ADD_I	add 	%r7, 0x04a5, %r18
	.word 0xac092e40  ! 55: AND_I	and 	%r4, 0x0e40, %r22
	.word 0xac01000f  ! 55: ADD_R	add 	%r4, %r15, %r22
	.word 0xb611a8da  ! 55: OR_I	or 	%r6, 0x08da, %r27
	.word 0xa608c00c  ! 55: AND_R	and 	%r3, %r12, %r19
	.word 0xb209800b  ! 55: AND_R	and 	%r6, %r11, %r25
	.word 0xa401000a  ! 55: ADD_R	add 	%r4, %r10, %r18
	.word 0xa409c00f  ! 55: AND_R	and 	%r7, %r15, %r18
	.word 0xbc09a49a  ! 55: AND_I	and 	%r6, 0x049a, %r30
	.word 0xbc122952  ! 55: OR_I	or 	%r8, 0x0952, %r30
	.word 0xb40166aa  ! 55: ADD_I	add 	%r5, 0x06aa, %r26
	.word 0xa601eb32  ! 55: ADD_I	add 	%r7, 0x0b32, %r19
	.word 0xa201400b  ! 55: ADD_R	add 	%r5, %r11, %r17
	.word 0xba09680a  ! 55: AND_I	and 	%r5, 0x080a, %r29
	.word 0xb20a2e8f  ! 55: AND_I	and 	%r8, 0x0e8f, %r25
	.word 0xbe012dc7  ! 55: ADD_I	add 	%r4, 0x0dc7, %r31
	.word 0xa411800a  ! 55: OR_R	or 	%r6, %r10, %r18
	.word 0xa20a28ba  ! 55: AND_I	and 	%r8, 0x08ba, %r17
	.word 0xac01c00e  ! 55: ADD_R	add 	%r7, %r14, %r22
	.word 0xba0120ea  ! 55: ADD_I	add 	%r4, 0x00ea, %r29
	.word 0xb811400c  ! 55: OR_R	or 	%r5, %r12, %r28
	.word 0xa401000d  ! 55: ADD_R	add 	%r4, %r13, %r18
	.word 0xb40a000c  ! 55: AND_R	and 	%r8, %r12, %r26
	.word 0xb80929e6  ! 55: AND_I	and 	%r4, 0x09e6, %r28
	.word 0xae0924c9  ! 55: AND_I	and 	%r4, 0x04c9, %r23
	.word 0xac0960b1  ! 55: AND_I	and 	%r5, 0x00b1, %r22
	.word 0xb4014009  ! 55: ADD_R	add 	%r5, %r9, %r26
	.word 0xa409a595  ! 55: AND_I	and 	%r6, 0x0595, %r18
	.word 0xb211400f  ! 55: OR_R	or 	%r5, %r15, %r25
	.word 0xbe00ea73  ! 55: ADD_I	add 	%r3, 0x0a73, %r31
	.word 0xb01127bd  ! 55: OR_I	or 	%r4, 0x07bd, %r24
	.word 0xa210e1ad  ! 55: OR_I	or 	%r3, 0x01ad, %r17
	.word 0xba0a2a43  ! 55: AND_I	and 	%r8, 0x0a43, %r29
	.word 0xb801a9a0  ! 55: ADD_I	add 	%r6, 0x09a0, %r28
	.word 0xb612000c  ! 55: OR_R	or 	%r8, %r12, %r27
	.word 0xb411c00f  ! 55: OR_R	or 	%r7, %r15, %r26
	.word 0xb808ecf7  ! 55: AND_I	and 	%r3, 0x0cf7, %r28
	.word 0xb802000f  ! 55: ADD_R	add 	%r8, %r15, %r28
	.word 0xaa09c009  ! 55: AND_R	and 	%r7, %r9, %r21
	.word 0xa20a000f  ! 55: AND_R	and 	%r8, %r15, %r17
	.word 0xa400c00e  ! 55: ADD_R	add 	%r3, %r14, %r18
	.word 0xba01000f  ! 55: ADD_R	add 	%r4, %r15, %r29
	.word 0xae09a35d  ! 55: AND_I	and 	%r6, 0x035d, %r23
	.word 0xbe01000c  ! 55: ADD_R	add 	%r4, %r12, %r31
	.word 0xae092476  ! 55: AND_I	and 	%r4, 0x0476, %r23
	.word 0xac11a5f6  ! 55: OR_I	or 	%r6, 0x05f6, %r22
	.word 0xbe09e6c0  ! 55: AND_I	and 	%r7, 0x06c0, %r31
	.word 0xb40a23c0  ! 55: AND_I	and 	%r8, 0x03c0, %r26
	.word 0xb201800e  ! 55: ADD_R	add 	%r6, %r14, %r25
	.word 0xbc01ea3e  ! 55: ADD_I	add 	%r7, 0x0a3e, %r30
	.word 0xba00e5b7  ! 55: ADD_I	add 	%r3, 0x05b7, %r29
	.word 0xbe00e012  ! 55: ADD_I	add 	%r3, 0x0012, %r31
	.word 0xb6010009  ! 55: ADD_R	add 	%r4, %r9, %r27
	.word 0xba0a000d  ! 55: AND_R	and 	%r8, %r13, %r29
	.word 0xb011000f  ! 55: OR_R	or 	%r4, %r15, %r24
	.word 0xa601400f  ! 55: ADD_R	add 	%r5, %r15, %r19
	.word 0xb809000f  ! 55: AND_R	and 	%r4, %r15, %r28
	.word 0xb2116cad  ! 55: OR_I	or 	%r5, 0x0cad, %r25
	.word 0xb011e7b5  ! 55: OR_I	or 	%r7, 0x07b5, %r24
	.word 0xa411000c  ! 55: OR_R	or 	%r4, %r12, %r18
	.word 0xb411400e  ! 55: OR_R	or 	%r5, %r14, %r26
	.word 0xae11e69d  ! 55: OR_I	or 	%r7, 0x069d, %r23
	.word 0xac10e7b4  ! 55: OR_I	or 	%r3, 0x07b4, %r22
	.word 0xa2092fd0  ! 55: AND_I	and 	%r4, 0x0fd0, %r17
	.word 0xb809800f  ! 55: AND_R	and 	%r6, %r15, %r28
	.word 0xa608c009  ! 55: AND_R	and 	%r3, %r9, %r19
	.word 0xba11e394  ! 55: OR_I	or 	%r7, 0x0394, %r29
	.word 0xb21220ae  ! 55: OR_I	or 	%r8, 0x00ae, %r25
	.word 0xac09e2b7  ! 55: AND_I	and 	%r7, 0x02b7, %r22
	.word 0xa409400a  ! 55: AND_R	and 	%r5, %r10, %r18
	.word 0xb201400b  ! 55: ADD_R	add 	%r5, %r11, %r25
	.word 0xbe09800d  ! 55: AND_R	and 	%r6, %r13, %r31
	.word 0xb001ae37  ! 55: ADD_I	add 	%r6, 0x0e37, %r24
	.word 0xb811400f  ! 55: OR_R	or 	%r5, %r15, %r28
	.word 0xa60a245e  ! 55: AND_I	and 	%r8, 0x045e, %r19
	.word 0xa811632b  ! 55: OR_I	or 	%r5, 0x032b, %r20
	.word 0xaa09c009  ! 55: AND_R	and 	%r7, %r9, %r21
	.word 0xa601400d  ! 55: ADD_R	add 	%r5, %r13, %r19
	.word 0xb410e362  ! 55: OR_I	or 	%r3, 0x0362, %r26
	.word 0xae016684  ! 55: ADD_I	add 	%r5, 0x0684, %r23
	.word 0xb001c00f  ! 55: ADD_R	add 	%r7, %r15, %r24
	.word 0xf630ee84  ! 55: STH_I	sth	%r27, [%r3 + 0x0e84]
	.word 0xe628ee08  ! 55: STB_I	stb	%r19, [%r3 + 0x0e08]
	.word 0xf021ad04  ! 55: STW_I	stw	%r24, [%r6 + 0x0d04]
	.word 0xe27168d8  ! 55: STX_I	stx	%r17, [%r5 + 0x08d8]
	.word 0xf83168a6  ! 55: STH_I	sth	%r28, [%r5 + 0x08a6]
	.word 0xe829a738  ! 55: STB_I	stb	%r20, [%r6 + 0x0738]
	.word 0xf431a3e4  ! 55: STH_I	sth	%r26, [%r6 + 0x03e4]
	.word 0xe630ea9a  ! 55: STH_I	sth	%r19, [%r3 + 0x0a9a]
	.word 0xfc49400b  ! 55: LDSB_R	ldsb	[%r5 + %r11], %r30
	.word 0xc0f00962  ! 57: STXA_R	stxa	%r0, [%r0 + %r2] 0x4b
	.word 0xfd396a9b  ! 59: STDF_I	std	%f30, [0x0a9b, %r5]
	.word 0xba09000d  ! 59: AND_R	and 	%r4, %r13, %r29
	.word 0xaa016280  ! 59: ADD_I	add 	%r5, 0x0280, %r21
	setx  0x0000000000000c10, %r16, %r9
	bne thr0_loop_3
	subcc %g1, 0x1, %g1
!Generating store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_4:
	.word 0xac00e2ee  ! 68: ADD_I	add 	%r3, 0x02ee, %r22
	.word 0xbe09a888  ! 68: AND_I	and 	%r6, 0x0888, %r31
	.word 0xb808c00c  ! 68: AND_R	and 	%r3, %r12, %r28
	.word 0xa81169a5  ! 68: OR_I	or 	%r5, 0x09a5, %r20
	.word 0xb612000c  ! 68: OR_R	or 	%r8, %r12, %r27
	.word 0xae09af7b  ! 68: AND_I	and 	%r6, 0x0f7b, %r23
	.word 0xa411800d  ! 68: OR_R	or 	%r6, %r13, %r18
	.word 0xb409c00a  ! 68: AND_R	and 	%r7, %r10, %r26
	.word 0xbc10ede4  ! 68: OR_I	or 	%r3, 0x0de4, %r30
	.word 0xa802200b  ! 68: ADD_I	add 	%r8, 0x000b, %r20
	.word 0xac10c00d  ! 68: OR_R	or 	%r3, %r13, %r22
	.word 0xa208eeed  ! 68: AND_I	and 	%r3, 0x0eed, %r17
	.word 0xb20a0009  ! 68: AND_R	and 	%r8, %r9, %r25
	.word 0xb608c00d  ! 68: AND_R	and 	%r3, %r13, %r27
	.word 0xb00a000b  ! 68: AND_R	and 	%r8, %r11, %r24
	.word 0xb211400e  ! 68: OR_R	or 	%r5, %r14, %r25
	.word 0xa209800c  ! 68: AND_R	and 	%r6, %r12, %r17
	.word 0xb610c00d  ! 68: OR_R	or 	%r3, %r13, %r27
	.word 0xa809a2a0  ! 68: AND_I	and 	%r6, 0x02a0, %r20
	.word 0xbe01400d  ! 68: ADD_R	add 	%r5, %r13, %r31
	.word 0xa801400a  ! 68: ADD_R	add 	%r5, %r10, %r20
	.word 0xba016ed4  ! 68: ADD_I	add 	%r5, 0x0ed4, %r29
	.word 0xb211400d  ! 68: OR_R	or 	%r5, %r13, %r25
	.word 0xa811c00f  ! 68: OR_R	or 	%r7, %r15, %r20
	.word 0xa611e5cd  ! 68: OR_I	or 	%r7, 0x05cd, %r19
	.word 0xb601ebbd  ! 68: ADD_I	add 	%r7, 0x0bbd, %r27
	.word 0xa4010009  ! 68: ADD_R	add 	%r4, %r9, %r18
	.word 0xa6112850  ! 68: OR_I	or 	%r4, 0x0850, %r19
	.word 0xa401a97b  ! 68: ADD_I	add 	%r6, 0x097b, %r18
	.word 0xaa11aa8e  ! 68: OR_I	or 	%r6, 0x0a8e, %r21
	.word 0xae01800e  ! 68: ADD_R	add 	%r6, %r14, %r23
	.word 0xa201000e  ! 68: ADD_R	add 	%r4, %r14, %r17
	.word 0xbc022537  ! 68: ADD_I	add 	%r8, 0x0537, %r30
	.word 0xac1227a5  ! 68: OR_I	or 	%r8, 0x07a5, %r22
	.word 0xba00c00d  ! 68: ADD_R	add 	%r3, %r13, %r29
	.word 0xa810c00b  ! 68: OR_R	or 	%r3, %r11, %r20
	.word 0xa400c00a  ! 68: ADD_R	add 	%r3, %r10, %r18
	.word 0xa611a1ba  ! 68: OR_I	or 	%r6, 0x01ba, %r19
	.word 0xb400c009  ! 68: ADD_R	add 	%r3, %r9, %r26
	.word 0xba0163d7  ! 68: ADD_I	add 	%r5, 0x03d7, %r29
	.word 0xaa01800d  ! 68: ADD_R	add 	%r6, %r13, %r21
	.word 0xae0164cc  ! 68: ADD_I	add 	%r5, 0x04cc, %r23
	.word 0xb811400c  ! 68: OR_R	or 	%r5, %r12, %r28
	.word 0xb810c009  ! 68: OR_R	or 	%r3, %r9, %r28
	.word 0xac11e438  ! 68: OR_I	or 	%r7, 0x0438, %r22
	.word 0xa408eafa  ! 68: AND_I	and 	%r3, 0x0afa, %r18
	.word 0xbe122863  ! 68: OR_I	or 	%r8, 0x0863, %r31
	.word 0xaa12000c  ! 68: OR_R	or 	%r8, %r12, %r21
	.word 0xb210e00c  ! 68: OR_I	or 	%r3, 0x000c, %r25
	.word 0xba11400a  ! 68: OR_R	or 	%r5, %r10, %r29
	.word 0xbc0128a2  ! 68: ADD_I	add 	%r4, 0x08a2, %r30
	.word 0xbe0a000b  ! 68: AND_R	and 	%r8, %r11, %r31
	.word 0xb601c00e  ! 68: ADD_R	add 	%r7, %r14, %r27
	.word 0xbc11400e  ! 68: OR_R	or 	%r5, %r14, %r30
	.word 0xbe1122fc  ! 68: OR_I	or 	%r4, 0x02fc, %r31
	.word 0xa409000d  ! 68: AND_R	and 	%r4, %r13, %r18
	.word 0xb8022a4a  ! 68: ADD_I	add 	%r8, 0x0a4a, %r28
	.word 0xb010c00b  ! 68: OR_R	or 	%r3, %r11, %r24
	.word 0xac11eecd  ! 68: OR_I	or 	%r7, 0x0ecd, %r22
	.word 0xba00e307  ! 68: ADD_I	add 	%r3, 0x0307, %r29
	.word 0xa20224f7  ! 68: ADD_I	add 	%r8, 0x04f7, %r17
	.word 0xa8096dd0  ! 68: AND_I	and 	%r5, 0x0dd0, %r20
	.word 0xa4096d76  ! 68: AND_I	and 	%r5, 0x0d76, %r18
	.word 0xb210ecef  ! 68: OR_I	or 	%r3, 0x0cef, %r25
	.word 0xae116308  ! 68: OR_I	or 	%r5, 0x0308, %r23
	.word 0xa60a2487  ! 68: AND_I	and 	%r8, 0x0487, %r19
	.word 0xa411263d  ! 68: OR_I	or 	%r4, 0x063d, %r18
	.word 0xaa0a0009  ! 68: AND_R	and 	%r8, %r9, %r21
	.word 0xa8018009  ! 68: ADD_R	add 	%r6, %r9, %r20
	.word 0xb4114009  ! 68: OR_R	or 	%r5, %r9, %r26
	.word 0xbe0a000d  ! 68: AND_R	and 	%r8, %r13, %r31
	.word 0xb008ef7d  ! 68: AND_I	and 	%r3, 0x0f7d, %r24
	.word 0xa210c00a  ! 68: OR_R	or 	%r3, %r10, %r17
	.word 0xa401800e  ! 68: ADD_R	add 	%r6, %r14, %r18
	.word 0xb200eddd  ! 68: ADD_I	add 	%r3, 0x0ddd, %r25
	.word 0xaa08e6b9  ! 68: AND_I	and 	%r3, 0x06b9, %r21
	.word 0xac11000f  ! 68: OR_R	or 	%r4, %r15, %r22
	.word 0xa202000c  ! 68: ADD_R	add 	%r8, %r12, %r17
	.word 0xea20eab4  ! 68: STW_I	stw	%r21, [%r3 + 0x0ab4]
	.word 0xf8712438  ! 68: STX_I	stx	%r28, [%r4 + 0x0438]
	.word 0xfc21af44  ! 68: STW_I	stw	%r30, [%r6 + 0x0f44]
	.word 0xfe222908  ! 68: STW_I	stw	%r31, [%r8 + 0x0908]
	.word 0xf87127a8  ! 68: STX_I	stx	%r28, [%r4 + 0x07a8]
	.word 0xee292879  ! 68: STB_I	stb	%r23, [%r4 + 0x0879]
	.word 0xf270eb38  ! 68: STX_I	stx	%r25, [%r3 + 0x0b38]
	.word 0xee7121d8  ! 68: STX_I	stx	%r23, [%r4 + 0x01d8]
thr0_dc_err_1:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_1), 16, 16),2,DC_DATA,39)
	.word 0xe459800f  ! 70: LDX_R	ldx	[%r6 + %r15], %r18
	.word 0xa529b001  ! 71: SLLX_I	sllx	%r6, 0x0001, %r18
	.word 0xc0f00982  ! 73: STXA_R	stxa	%r0, [%r0 + %r2] 0x4c
	.word 0xb3292001  ! 74: SLL_I	sll 	%r4, 0x0001, %r25
	.word 0xb201e00e  ! 74: ADD_I	add 	%r7, 0x000e, %r25
	.word 0xac12000b  ! 74: OR_R	or 	%r8, %r11, %r22
	.word 0xb611c00e  ! 74: OR_R	or 	%r7, %r14, %r27
	bne thr0_loop_4
	subcc %g1, 0x1, %g1
!Generating store_chunk_2
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_5:
	.word 0xa60a2f2a  ! 83: AND_I	and 	%r8, 0x0f2a, %r19
	.word 0xba096eee  ! 83: AND_I	and 	%r5, 0x0eee, %r29
	.word 0xaa09c00c  ! 83: AND_R	and 	%r7, %r12, %r21
	.word 0xb00169a0  ! 83: ADD_I	add 	%r5, 0x09a0, %r24
	.word 0xb20169b4  ! 83: ADD_I	add 	%r5, 0x09b4, %r25
	.word 0xa4016344  ! 83: ADD_I	add 	%r5, 0x0344, %r18
	.word 0xb401400b  ! 83: ADD_R	add 	%r5, %r11, %r26
	.word 0xa208efc9  ! 83: AND_I	and 	%r3, 0x0fc9, %r17
	.word 0xaa08c00f  ! 83: AND_R	and 	%r3, %r15, %r21
	.word 0xb0094009  ! 83: AND_R	and 	%r5, %r9, %r24
	.word 0xbc09000c  ! 83: AND_R	and 	%r4, %r12, %r30
	.word 0xa209400e  ! 83: AND_R	and 	%r5, %r14, %r17
	.word 0xaa092c25  ! 83: AND_I	and 	%r4, 0x0c25, %r21
	.word 0xaa022ae1  ! 83: ADD_I	add 	%r8, 0x0ae1, %r21
	.word 0xa20126f1  ! 83: ADD_I	add 	%r4, 0x06f1, %r17
	.word 0xa410c00c  ! 83: OR_R	or 	%r3, %r12, %r18
	.word 0xa611c00f  ! 83: OR_R	or 	%r7, %r15, %r19
	.word 0xa2112ed2  ! 83: OR_I	or 	%r4, 0x0ed2, %r17
	.word 0xaa11c00e  ! 83: OR_R	or 	%r7, %r14, %r21
	.word 0xb40166c0  ! 83: ADD_I	add 	%r5, 0x06c0, %r26
	.word 0xbe02000d  ! 83: ADD_R	add 	%r8, %r13, %r31
	.word 0xa401800a  ! 83: ADD_R	add 	%r6, %r10, %r18
	.word 0xb800c00a  ! 83: ADD_R	add 	%r3, %r10, %r28
	.word 0xb810e8e0  ! 83: OR_I	or 	%r3, 0x08e0, %r28
	.word 0xb60a000b  ! 83: AND_R	and 	%r8, %r11, %r27
	.word 0xaa08e4a0  ! 83: AND_I	and 	%r3, 0x04a0, %r21
	.word 0xa802000d  ! 83: ADD_R	add 	%r8, %r13, %r20
	.word 0xb20229ce  ! 83: ADD_I	add 	%r8, 0x09ce, %r25
	.word 0xb400ee2f  ! 83: ADD_I	add 	%r3, 0x0e2f, %r26
	.word 0xba014009  ! 83: ADD_R	add 	%r5, %r9, %r29
	.word 0xb201e3dd  ! 83: ADD_I	add 	%r7, 0x03dd, %r25
	.word 0xae01c00a  ! 83: ADD_R	add 	%r7, %r10, %r23
	.word 0xb810c00a  ! 83: OR_R	or 	%r3, %r10, %r28
	.word 0xbe11c00e  ! 83: OR_R	or 	%r7, %r14, %r31
	.word 0xa601c00b  ! 83: ADD_R	add 	%r7, %r11, %r19
	.word 0xb011ac73  ! 83: OR_I	or 	%r6, 0x0c73, %r24
	.word 0xb202000c  ! 83: ADD_R	add 	%r8, %r12, %r25
	.word 0xa20220b1  ! 83: ADD_I	add 	%r8, 0x00b1, %r17
	.word 0xb80a000b  ! 83: AND_R	and 	%r8, %r11, %r28
	.word 0xb801e2c9  ! 83: ADD_I	add 	%r7, 0x02c9, %r28
	.word 0xb401c00a  ! 83: ADD_R	add 	%r7, %r10, %r26
	.word 0xbe08c00b  ! 83: AND_R	and 	%r3, %r11, %r31
	.word 0xb4022087  ! 83: ADD_I	add 	%r8, 0x0087, %r26
	.word 0xba09279d  ! 83: AND_I	and 	%r4, 0x079d, %r29
	.word 0xb808c00d  ! 83: AND_R	and 	%r3, %r13, %r28
	.word 0xbe09800d  ! 83: AND_R	and 	%r6, %r13, %r31
	.word 0xbc11ef3e  ! 83: OR_I	or 	%r7, 0x0f3e, %r30
	.word 0xa210c00b  ! 83: OR_R	or 	%r3, %r11, %r17
	.word 0xac09400b  ! 83: AND_R	and 	%r5, %r11, %r22
	.word 0xa209657c  ! 83: AND_I	and 	%r5, 0x057c, %r17
	.word 0xa209400b  ! 83: AND_R	and 	%r5, %r11, %r17
	.word 0xb2116bc7  ! 83: OR_I	or 	%r5, 0x0bc7, %r25
	.word 0xac11800e  ! 83: OR_R	or 	%r6, %r14, %r22
	.word 0xae12000b  ! 83: OR_R	or 	%r8, %r11, %r23
	.word 0xb408c00a  ! 83: AND_R	and 	%r3, %r10, %r26
	.word 0xb008e3aa  ! 83: AND_I	and 	%r3, 0x03aa, %r24
	.word 0xbc09000b  ! 83: AND_R	and 	%r4, %r11, %r30
	.word 0xbc11400d  ! 83: OR_R	or 	%r5, %r13, %r30
	.word 0xac0a2d4f  ! 83: AND_I	and 	%r8, 0x0d4f, %r22
	.word 0xaa112498  ! 83: OR_I	or 	%r4, 0x0498, %r21
	.word 0xae11c00a  ! 83: OR_R	or 	%r7, %r10, %r23
	.word 0xbe10e42d  ! 83: OR_I	or 	%r3, 0x042d, %r31
	.word 0xae11c00b  ! 83: OR_R	or 	%r7, %r11, %r23
	.word 0xac00c00c  ! 83: ADD_R	add 	%r3, %r12, %r22
	.word 0xa809000a  ! 83: AND_R	and 	%r4, %r10, %r20
	.word 0xba11e159  ! 83: OR_I	or 	%r7, 0x0159, %r29
	.word 0xa2022e38  ! 83: ADD_I	add 	%r8, 0x0e38, %r17
	.word 0xac11c00e  ! 83: OR_R	or 	%r7, %r14, %r22
	.word 0xb609eaae  ! 83: AND_I	and 	%r7, 0x0aae, %r27
	.word 0xaa11ad61  ! 83: OR_I	or 	%r6, 0x0d61, %r21
	.word 0xb809a30b  ! 83: AND_I	and 	%r6, 0x030b, %r28
	.word 0xa609800a  ! 83: AND_R	and 	%r6, %r10, %r19
	.word 0xb208c00b  ! 83: AND_R	and 	%r3, %r11, %r25
	.word 0xbe09e0d1  ! 83: AND_I	and 	%r7, 0x00d1, %r31
	.word 0xa409000b  ! 83: AND_R	and 	%r4, %r11, %r18
	.word 0xb608ef29  ! 83: AND_I	and 	%r3, 0x0f29, %r27
	.word 0xb40a000a  ! 83: AND_R	and 	%r8, %r10, %r26
	.word 0xb20927e9  ! 83: AND_I	and 	%r4, 0x07e9, %r25
	.word 0xae08c009  ! 83: AND_R	and 	%r3, %r9, %r23
	.word 0xa4120009  ! 83: OR_R	or 	%r8, %r9, %r18
	.word 0xbc092f2a  ! 83: AND_I	and 	%r4, 0x0f2a, %r30
	.word 0xaa0a000b  ! 83: AND_R	and 	%r8, %r11, %r21
	.word 0xba11000f  ! 83: OR_R	or 	%r4, %r15, %r29
	.word 0xa411800f  ! 83: OR_R	or 	%r6, %r15, %r18
	.word 0xae09c00d  ! 83: AND_R	and 	%r7, %r13, %r23
	.word 0xb211e986  ! 83: OR_I	or 	%r7, 0x0986, %r25
	.word 0xba09800e  ! 83: AND_R	and 	%r6, %r14, %r29
	.word 0xb401800a  ! 83: ADD_R	add 	%r6, %r10, %r26
	.word 0xaa116174  ! 83: OR_I	or 	%r5, 0x0174, %r21
	.word 0xb2012e13  ! 83: ADD_I	add 	%r4, 0x0e13, %r25
	.word 0xa801800d  ! 83: ADD_R	add 	%r6, %r13, %r20
	.word 0xac02000d  ! 83: ADD_R	add 	%r8, %r13, %r22
	.word 0xb409800a  ! 83: AND_R	and 	%r6, %r10, %r26
	.word 0xb401253d  ! 83: ADD_I	add 	%r4, 0x053d, %r26
	.word 0xae09e7d7  ! 83: AND_I	and 	%r7, 0x07d7, %r23
	.word 0xa809a278  ! 83: AND_I	and 	%r6, 0x0278, %r20
	.word 0xb410e8e4  ! 83: OR_I	or 	%r3, 0x08e4, %r26
	.word 0xa402000f  ! 83: ADD_R	add 	%r8, %r15, %r18
	.word 0xba11800b  ! 83: OR_R	or 	%r6, %r11, %r29
	.word 0xb2092946  ! 83: AND_I	and 	%r4, 0x0946, %r25
	.word 0xae098009  ! 83: AND_R	and 	%r6, %r9, %r23
	.word 0xac096f48  ! 83: AND_I	and 	%r5, 0x0f48, %r22
	.word 0xa40a22dd  ! 83: AND_I	and 	%r8, 0x02dd, %r18
	.word 0xa401c00f  ! 83: ADD_R	add 	%r7, %r15, %r18
	.word 0xbe0129e8  ! 83: ADD_I	add 	%r4, 0x09e8, %r31
	.word 0xb4120009  ! 83: OR_R	or 	%r8, %r9, %r26
	.word 0xbe01c00a  ! 83: ADD_R	add 	%r7, %r10, %r31
	.word 0xb601ab07  ! 83: ADD_I	add 	%r6, 0x0b07, %r27
	.word 0xa809ad15  ! 83: AND_I	and 	%r6, 0x0d15, %r20
	.word 0xa6012180  ! 83: ADD_I	add 	%r4, 0x0180, %r19
	.word 0xb808c00d  ! 83: AND_R	and 	%r3, %r13, %r28
	.word 0xa6012c3a  ! 83: ADD_I	add 	%r4, 0x0c3a, %r19
	.word 0xbe11800e  ! 83: OR_R	or 	%r6, %r14, %r31
	.word 0xaa09c00d  ! 83: AND_R	and 	%r7, %r13, %r21
	.word 0xa808c00d  ! 83: AND_R	and 	%r3, %r13, %r20
	.word 0xa2092580  ! 83: AND_I	and 	%r4, 0x0580, %r17
	.word 0xba0a2cda  ! 83: AND_I	and 	%r8, 0x0cda, %r29
	.word 0xb611400a  ! 83: OR_R	or 	%r5, %r10, %r27
	.word 0xb40a27e4  ! 83: AND_I	and 	%r8, 0x07e4, %r26
	.word 0xa608c00e  ! 83: AND_R	and 	%r3, %r14, %r19
	.word 0xb41165fe  ! 83: OR_I	or 	%r5, 0x05fe, %r26
	.word 0xbe09400c  ! 83: AND_R	and 	%r5, %r12, %r31
	.word 0xbc01ed48  ! 83: ADD_I	add 	%r7, 0x0d48, %r30
	.word 0xb402000c  ! 83: ADD_R	add 	%r8, %r12, %r26
	.word 0xbe09000b  ! 83: AND_R	and 	%r4, %r11, %r31
	.word 0xa600e067  ! 83: ADD_I	add 	%r3, 0x0067, %r19
	.word 0xa811c009  ! 83: OR_R	or 	%r7, %r9, %r20
	.word 0xb40a000b  ! 83: AND_R	and 	%r8, %r11, %r26
	.word 0xa809800a  ! 83: AND_R	and 	%r6, %r10, %r20
	.word 0xb609800a  ! 83: AND_R	and 	%r6, %r10, %r27
	.word 0xaa016a68  ! 83: ADD_I	add 	%r5, 0x0a68, %r21
	.word 0xb8122947  ! 83: OR_I	or 	%r8, 0x0947, %r28
	.word 0xb201c00b  ! 83: ADD_R	add 	%r7, %r11, %r25
	.word 0xae08ef14  ! 83: AND_I	and 	%r3, 0x0f14, %r23
	.word 0xa610c00a  ! 83: OR_R	or 	%r3, %r10, %r19
	.word 0xb408ef57  ! 83: AND_I	and 	%r3, 0x0f57, %r26
	.word 0xbe118009  ! 83: OR_R	or 	%r6, %r9, %r31
	.word 0xb0022bc6  ! 83: ADD_I	add 	%r8, 0x0bc6, %r24
	.word 0xbc09000b  ! 83: AND_R	and 	%r4, %r11, %r30
	.word 0xae11c00c  ! 83: OR_R	or 	%r7, %r12, %r23
	.word 0xb409e78b  ! 83: AND_I	and 	%r7, 0x078b, %r26
	.word 0xba00ebd4  ! 83: ADD_I	add 	%r3, 0x0bd4, %r29
	.word 0xba09aa74  ! 83: AND_I	and 	%r6, 0x0a74, %r29
	.word 0xb402258c  ! 83: ADD_I	add 	%r8, 0x058c, %r26
	.word 0xa4122ff6  ! 83: OR_I	or 	%r8, 0x0ff6, %r18
	.word 0xb001e62a  ! 83: ADD_I	add 	%r7, 0x062a, %r24
	.word 0xa609000e  ! 83: AND_R	and 	%r4, %r14, %r19
	.word 0xb409e4de  ! 83: AND_I	and 	%r7, 0x04de, %r26
	.word 0xbe09604e  ! 83: AND_I	and 	%r5, 0x004e, %r31
	.word 0xaa09eab3  ! 83: AND_I	and 	%r7, 0x0ab3, %r21
	.word 0xb410c00c  ! 83: OR_R	or 	%r3, %r12, %r26
	.word 0xa6092318  ! 83: AND_I	and 	%r4, 0x0318, %r19
	.word 0xbe09800b  ! 83: AND_R	and 	%r6, %r11, %r31
	.word 0xa409ef63  ! 83: AND_I	and 	%r7, 0x0f63, %r18
	.word 0xac00ed6c  ! 83: ADD_I	add 	%r3, 0x0d6c, %r22
	.word 0xbc00e52c  ! 83: ADD_I	add 	%r3, 0x052c, %r30
	.word 0xb2110009  ! 83: OR_R	or 	%r4, %r9, %r25
	.word 0xbc09c009  ! 83: AND_R	and 	%r7, %r9, %r30
	.word 0xf429ed44  ! 83: STB_I	stb	%r26, [%r7 + 0x0d44]
	.word 0xe621a1d4  ! 83: STW_I	stw	%r19, [%r6 + 0x01d4]
	.word 0xfe28ef08  ! 83: STB_I	stb	%r31, [%r3 + 0x0f08]
	.word 0xe6212714  ! 83: STW_I	stw	%r19, [%r4 + 0x0714]
	.word 0xe221e664  ! 83: STW_I	stw	%r17, [%r7 + 0x0664]
	.word 0xec316af0  ! 83: STH_I	sth	%r22, [%r5 + 0x0af0]
	.word 0xe2212290  ! 83: STW_I	stw	%r17, [%r4 + 0x0290]
	.word 0xe231e396  ! 83: STH_I	sth	%r17, [%r7 + 0x0396]
thr0_dc_err_2:
!$EV error(0,expr(@VA(.MAIN.thr0_dc_err_2), 16, 16),2,DC_DATA,27)
	.word 0xfc09400f  ! 85: LDUB_R	ldub	[%r5 + %r15], %r30
	.word 0xbc116397  ! 86: OR_I	or 	%r5, 0x0397, %r30
	.word 0xe268c00f  ! 87: LDSTUB_R	ldstub	%r17, [%r3 + %r15]
	setx  0x0000000000000b30, %r16, %r13
	.word 0xb211400a  ! 88: OR_R	or 	%r5, %r10, %r25
	.word 0xa209800f  ! 88: AND_R	and 	%r6, %r15, %r17
	.word 0xac09000e  ! 88: AND_R	and 	%r4, %r14, %r22
	bne thr0_loop_5
	subcc %g1, 0x1, %g1
!Generating store chunk 1
	set 0x2, %g1
	subcc %g1, 0x1, %g1
.align 0x20
thr0_loop_6:
	.word 0xae01400f  ! 95: ADD_R	add 	%r5, %r15, %r23
	.word 0xb809800f  ! 95: AND_R	and 	%r6, %r15, %r28
	.word 0xbe00e819  ! 95: ADD_I	add 	%r3, 0x0819, %r31
	.word 0xb809ecaa  ! 95: AND_I	and 	%r7, 0x0caa, %r28
	.word 0xaa02204b  ! 95: ADD_I	add 	%r8, 0x004b, %r21
	.word 0xb811c00f  ! 95: OR_R	or 	%r7, %r15, %r28
	.word 0xaa0a000f  ! 95: AND_R	and 	%r8, %r15, %r21
	.word 0xae09aa8a  ! 95: AND_I	and 	%r6, 0x0a8a, %r23
	.word 0xb811400f  ! 95: OR_R	or 	%r5, %r15, %r28
	.word 0xbc11000f  ! 95: OR_R	or 	%r4, %r15, %r30
	.word 0xa4116a80  ! 95: OR_I	or 	%r5, 0x0a80, %r18
	.word 0xb010c00e  ! 95: OR_R	or 	%r3, %r14, %r24
	.word 0xa401c009  ! 95: ADD_R	add 	%r7, %r9, %r18
	.word 0xbc11000b  ! 95: OR_R	or 	%r4, %r11, %r30
	.word 0xb00164fe  ! 95: ADD_I	add 	%r5, 0x04fe, %r24
	.word 0xbc116a54  ! 95: OR_I	or 	%r5, 0x0a54, %r30
	.word 0xb009600d  ! 95: AND_I	and 	%r5, 0x000d, %r24
	.word 0xb809800c  ! 95: AND_R	and 	%r6, %r12, %r28
	.word 0xa412000c  ! 95: OR_R	or 	%r8, %r12, %r18
	.word 0xae11c00b  ! 95: OR_R	or 	%r7, %r11, %r23
	.word 0xa408c00e  ! 95: AND_R	and 	%r3, %r14, %r18
	.word 0xb001e0f6  ! 95: ADD_I	add 	%r7, 0x00f6, %r24
	.word 0xba022b72  ! 95: ADD_I	add 	%r8, 0x0b72, %r29
	.word 0xa6022c0f  ! 95: ADD_I	add 	%r8, 0x0c0f, %r19
	.word 0xb209800c  ! 95: AND_R	and 	%r6, %r12, %r25
	.word 0xb4016b7d  ! 95: ADD_I	add 	%r5, 0x0b7d, %r26
	.word 0xb41122c1  ! 95: OR_I	or 	%r4, 0x02c1, %r26
	.word 0xa211e9d0  ! 95: OR_I	or 	%r7, 0x09d0, %r17
	.word 0xb809652b  ! 95: AND_I	and 	%r5, 0x052b, %r28
	.word 0xbe116396  ! 95: OR_I	or 	%r5, 0x0396, %r31
	.word 0xaa11400c  ! 95: OR_R	or 	%r5, %r12, %r21
	.word 0xbe09800d  ! 95: AND_R	and 	%r6, %r13, %r31
	.word 0xb409e45b  ! 95: AND_I	and 	%r7, 0x045b, %r26
	.word 0xbe11e655  ! 95: OR_I	or 	%r7, 0x0655, %r31
	.word 0xa4116e73  ! 95: OR_I	or 	%r5, 0x0e73, %r18
	.word 0xa20a000d  ! 95: AND_R	and 	%r8, %r13, %r17
	.word 0xb801c00c  ! 95: ADD_R	add 	%r7, %r12, %r28
	.word 0xbc10c00b  ! 95: OR_R	or 	%r3, %r11, %r30
	.word 0xba0229e5  ! 95: ADD_I	add 	%r8, 0x09e5, %r29
	.word 0xb611e06e  ! 95: OR_I	or 	%r7, 0x006e, %r27
	.word 0xae11400b  ! 95: OR_R	or 	%r5, %r11, %r23
	.word 0xae016be5  ! 95: ADD_I	add 	%r5, 0x0be5, %r23
	.word 0xa400e913  ! 95: ADD_I	add 	%r3, 0x0913, %r18
	.word 0xbc01800e  ! 95: ADD_R	add 	%r6, %r14, %r30
	.word 0xb2090009  ! 95: AND_R	and 	%r4, %r9, %r25
	.word 0xb208ee09  ! 95: AND_I	and 	%r3, 0x0e09, %r25
	.word 0xb60a000c  ! 95: AND_R	and 	%r8, %r12, %r27
	.word 0xa609c009  ! 95: AND_R	and 	%r7, %r9, %r19
	.word 0xb210e0fe  ! 95: OR_I	or 	%r3, 0x00fe, %r25
	.word 0xac01c00e  ! 95: ADD_R	add 	%r7, %r14, %r22
	.word 0xbe110009  ! 95: OR_R	or 	%r4, %r9, %r31
	.word 0xa40a000a  ! 95: AND_R	and 	%r8, %r10, %r18
	.word 0xb009e78e  ! 95: AND_I	and 	%r7, 0x078e, %r24
	.word 0xba0a2466  ! 95: AND_I	and 	%r8, 0x0466, %r29
	.word 0xa201e2b1  ! 95: ADD_I	add 	%r7, 0x02b1, %r17
	.word 0xbc09ede4  ! 95: AND_I	and 	%r7, 0x0de4, %r30
	.word 0xbe09000c  ! 95: AND_R	and 	%r4, %r12, %r31
	.word 0xb011c00a  ! 95: OR_R	or 	%r7, %r10, %r24
	.word 0xb611800e  ! 95: OR_R	or 	%r6, %r14, %r27
	.word 0xa20929d0  ! 95: AND_I	and 	%r4, 0x09d0, %r17
	.word 0xb41226a9  ! 95: OR_I	or 	%r8, 0x06a9, %r26
	.word 0xba09c00f  ! 95: AND_R	and 	%r7, %r15, %r29
	.word 0xac10c00b  ! 95: OR_R	or 	%r3, %r11, %r22
	.word 0xb601a6e8  ! 95: ADD_I	add 	%r6, 0x06e8, %r27
	.word 0xac016138  ! 95: ADD_I	add 	%r5, 0x0138, %r22
	.word 0xac08e656  ! 95: AND_I	and 	%r3, 0x0656, %r22
	.word 0xbc116efb  ! 95: OR_I	or 	%r5, 0x0efb, %r30
	.word 0xa411abdf  ! 95: OR_I	or 	%r6, 0x0bdf, %r18
	.word 0xb0096f2b  ! 95: AND_I	and 	%r5, 0x0f2b, %r24
	.word 0xbe01ae1f  ! 95: ADD_I	add 	%r6, 0x0e1f, %r31
	.word 0xb0112121  ! 95: OR_I	or 	%r4, 0x0121, %r24
	.word 0xbe11a21d  ! 95: OR_I	or 	%r6, 0x021d, %r31
	.word 0xa209abf7  ! 95: AND_I	and 	%r6, 0x0bf7, %r17
	.word 0xa800c00a  ! 95: ADD_R	add 	%r3, %r10, %r20
	.word 0xba096190  ! 95: AND_I	and 	%r5, 0x0190, %r29
	.word 0xbc0a26ee  ! 95: AND_I	and 	%r8, 0x06ee, %r30
	.word 0xa811000d  ! 95: OR_R	or 	%r4, %r13, %r20
	.word 0xb001c00c  ! 95: ADD_R	add 	%r7, %r12, %r24
	.word 0xa4114009  ! 95: OR_R	or 	%r5, %r9, %r18
	.word 0xa211400f  ! 95: OR_R	or 	%r5, %r15, %r17
	.word 0xba0224de  ! 95: ADD_I	add 	%r8, 0x04de, %r29
	.word 0xa601800e  ! 95: ADD_R	add 	%r6, %r14, %r19
	.word 0xae018009  ! 95: ADD_R	add 	%r6, %r9, %r23
	.word 0xaa114009  ! 95: OR_R	or 	%r5, %r9, %r21
	.word 0xba01000e  ! 95: ADD_R	add 	%r4, %r14, %r29
	.word 0xa4122437  ! 95: OR_I	or 	%r8, 0x0437, %r18
	.word 0xbe09c00e  ! 95: AND_R	and 	%r7, %r14, %r31
	.word 0xb011800b  ! 95: OR_R	or 	%r6, %r11, %r24
	.word 0xb202293a  ! 95: ADD_I	add 	%r8, 0x093a, %r25
	.word 0xaa09400a  ! 95: AND_R	and 	%r5, %r10, %r21
	.word 0xa8092e1c  ! 95: AND_I	and 	%r4, 0x0e1c, %r20
	.word 0xb0022236  ! 95: ADD_I	add 	%r8, 0x0236, %r24
	.word 0xac096ba8  ! 95: AND_I	and 	%r5, 0x0ba8, %r22
	.word 0xa608c00a  ! 95: AND_R	and 	%r3, %r10, %r19
	.word 0xb201800b  ! 95: ADD_R	add 	%r6, %r11, %r25
	.word 0xee2222c0  ! 95: STW_I	stw	%r23, [%r8 + 0x02c0]
	.word 0xf4292897  ! 95: STB_I	stb	%r26, [%r4 + 0x0897]
	.word 0xf22221d8  ! 95: STW_I	stw	%r25, [%r8 + 0x01d8]
	.word 0xfc29e934  ! 95: STB_I	stb	%r30, [%r7 + 0x0934]
	.word 0xf23124dc  ! 95: STH_I	sth	%r25, [%r4 + 0x04dc]
	.word 0xea31e00a  ! 95: STH_I	sth	%r21, [%r7 + 0x000a]
	.word 0xea29e75b  ! 97: STB_I	stb	%r21, [%r7 + 0x075b]
	.word 0xae010045
	.word 0xfa20ea50  ! 99: STW_I	stw	%r29, [%r3 + 0x0a50]

join_lbl_0_0:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ta    T_GOOD_TRAP

.data
	.word  0x358c407d,0x44a332d3,0xbbe4b98b,0xc2f14336
	.word  0xe1e5d490,0x2dc53f8f,0x051d41f2,0xbc67c9ee
	.word  0x5fcf2542,0x196cf713,0x162f725b,0x574cb01b
	.word  0x7e862714,0xf858b457,0x9d0cb52a,0x064b17a6
	.word  0x49827ae5,0x3e40f09b,0x3ab6f411,0x92de0145
	.word  0x5d025495,0x2c24f663,0xb9419e18,0x21f15ac4
	.word  0xd4250cb1,0xd8ff1aef,0x35c3b102,0x7565132b
	.word  0x2aba62db,0x3c04854f,0xcafcee06,0x70df165f
	.word  0xf4023435,0x5a7a73b2,0xe4cb9bd8,0x699433f7
	.word  0xc5483749,0xe06cfa25,0x1dfd70d2,0x12676724
	.word  0x38bb8241,0xeb3ff59d,0x8b410c95,0x2d05059e
	.word  0xffa4f6df,0x81b3a9ae,0x17786b84,0x343bbedf
	.word  0x0084d1c4,0xf4a22033,0x22b5d94e,0x1006ebbe
	.word  0x6262e873,0xa558c2a0,0x5c064276,0xa1d517eb
	.word  0x8f395bd1,0x29578255,0x127539a9,0x1ddb0584
	.word  0x44d2f894,0xf3af1ce8,0x60afc251,0x883054a8
	.word  0xf639dff4,0xf5e453d6,0x82303ccc,0x10015f7f
	.word  0xfa9cca73,0xd40b1a4d,0x43803c9b,0x5cc1c439
	.word  0xefc76642,0xf4667976,0x79d28d92,0x1a77129b
	.word  0x650e21fd,0x8ff6d882,0x09c93613,0x5842eb48
	.word  0xe8063db8,0x20031d88,0xc85c5d1a,0xdb8e9d80
	.word  0xaaa138f1,0x345ac4d0,0xd321fe43,0x397a928e
	.word  0xeeab44bd,0xc2ed4c84,0xa638edab,0x931c628e
	.word  0x08b2eca2,0x03b146e3,0x046b8dc5,0x28062971
	.word  0xa5404431,0x3652c316,0x3c992f0e,0xc4e6a74c
	.word  0x50157328,0xfdabe834,0xcf9623ee,0x602f1e7c
	.word  0xe0908937,0x8a7f6f43,0xb88b477b,0xa9e1dc53
	.word  0xb385644c,0x7d9f16ef,0x3bf3c75d,0x09c2cf6e
	.word  0x680acb6b,0x7c629a4d,0xecb54bc0,0x8f40e569
	.word  0xd592093b,0xd4502a9e,0x715fa087,0xab8cdcbf
	.word  0x6d917672,0x80e7a7f3,0xf047b596,0x233d6aeb
	.word  0x18b2abaa,0x07fc102b,0xdabb53be,0xbbf93dc3
	.word  0x7e436632,0x05189e18,0x30b78e53,0x5cc33ba3
	.word  0x1c6080be,0x968c2d4e,0x5c4d2a62,0xe4a3ce15
	.word  0x3aaaee42,0xef806a4c,0x7792d6f4,0xd8f98c5a
	.word  0x90f4e487,0xd3e7e003,0xcbae12ef,0xe52276be
	.word  0x2d951744,0xd3aa9b70,0x7c43c2ec,0x5717a14e
	.word  0x9e6a1d2a,0xa11ddb2d,0x7f8adb38,0x31d80dd3
	.word  0xf62c0087,0x3ce8b937,0x0c9856d4,0xf6d1eb88
	.word  0x22515b6b,0x7a753b5e,0xb0ed3242,0x37f325d4
	.word  0xfc074946,0x26f39acc,0x8e3c9057,0x70a6f0c7
	.word  0xf97530db,0xb9146d58,0x3e2c8118,0x466e4a70
	.word  0x534ccde2,0xb1f510b9,0xe3a60b14,0x25ccd70b
	.word  0x6b2e2286,0xb55ca8ec,0xe839415b,0x0ac07255
	.word  0x7a0f6422,0x6e6dfade,0xa9c3fee6,0xe21696ce
	.word  0xb2eb6507,0x52afb955,0x573f1e63,0x7815955e
	.word  0x74f99415,0x3262c5eb,0xdcd05c14,0xb5e2dfa1
	.word  0xfe990c21,0xed27e534,0xb29c8cc9,0x0b2857e0
	.word  0x50a255e8,0x8cb2aa1c,0x3a5f9704,0xa7ad9fb4
	.word  0xdf0914c3,0x3b6294ea,0xc6c3acd4,0x4f4bcc22
	.word  0xc7b7aa97,0xdbe45543,0x236cac9c,0xaa9a937f
	.word  0x3e0a5493,0x44beb9c4,0xbafc8eb9,0xc0114fef
	.word  0x078e41ba,0xa360a366,0x7d13fdd2,0x4302f71e
	.word  0xe9210e19,0x487b98c5,0x8ee7c19e,0x06cae4a9
	.word  0xce56e393,0x84499b8a,0x9d80f3eb,0xc7f61464
	.word  0xf02fc5ac,0x14d98e6d,0x0ce1ba12,0x4e4bd0ab
	.word  0xce4b3faa,0xeed7f13a,0xb669647f,0xb474b1ad
	.word  0xe1579347,0x81a6d15c,0xde6b4148,0xaf4bc926
	.word  0xbbc2295c,0x05130f1c,0xe3c41bb3,0x583a8f37
	.word  0x8764303d,0x2c313034,0x88bebc6d,0xff2b3cdd
	.word  0xc592060d,0x934e75f0,0x1c100d27,0xc6ec9417
	.word  0x212ff787,0x99c77da4,0x36460798,0xf3d8d29b
	.word  0x122649f5,0x542a0c6b,0x3a4fe88c,0xae31f5ef
	.word  0xa4fc121e,0x953e0bbc,0xb660e6a0,0xcbe3bc76
	.word  0xbcc67078,0x1a7f5cec,0xcaad9b1a,0x2c59d374
	.word  0xb654b5ea,0x71ec1f99,0xeaae09e6,0x8e0e1edd
	.word  0xbf6ba47d,0x5cab0fd4,0x2626c0b4,0x5359c6f2
	.word  0x16d0a568,0x723892dd,0x82316ba1,0xfcd4fd78
	.word  0x96aa391f,0x8f28b30a,0xacaa9fef,0xedc91a63
	.word  0x2ce54f06,0x04583c9c,0xc6023fe8,0x0937ba5b
	.word  0xc5981e7c,0x4bb0afa8,0x9578195d,0x67a231b1
	.word  0x093ea1f6,0x23717093,0xe1311a95,0x8b18d4ca
	.word  0xc64536da,0x51be1add,0xf3d1e61f,0xd70891e9
	.word  0x282654f3,0x720538f3,0x8c9178ea,0x65c336f1
	.word  0xe3e17381,0xd8c1ecf9,0x121d7da9,0xf0fcde8c
	.word  0x5ccc6035,0xf17456f2,0x8b95c9b5,0x6e5035c1
	.word  0xb353ffd3,0x63c96406,0xb87fa57d,0xb26237b0
	.word  0x857f5756,0x90e1edd5,0x70aca72a,0x18d1cf23
	.word  0x1be052d2,0x555425c8,0x4e6701b5,0x79d05b7f
	.word  0x89492b76,0x9e4091c6,0x1665e5ac,0xe1f4530a
	.word  0x8a0ab5ea,0xd54fc400,0xd099ed4a,0x9cf3d8bd
	.word  0x2136192b,0xfee22863,0x1ecdab6c,0x1375608b
	.word  0x5055b40f,0xe5b2f9f6,0x98019746,0x791395a2
	.word  0xc314eaf8,0x4e7db34b,0x2bdf8ae3,0x04b7d5f2
	.word  0xbafd0667,0x4fbec2fd,0x0c188f74,0x36603b92
	.word  0xcf018d43,0xd0a8bc77,0xea6b111c,0x708b9ed2
	.word  0x9a5ee4fa,0x886d0276,0x083c456e,0xae80d74e
	.word  0x33b7844a,0x499ae8e1,0x400ed9a8,0xe1eb9db2
	.word  0x196181fd,0xdfd11771,0xad8b91b0,0x9efda2a4
	.word  0x50133c2b,0x299e3357,0xaadf3e41,0xb9f67281
	.word  0xdd4e3369,0xa6d9d784,0x5f16b56f,0xe9322176
	.word  0x942b5144,0x0778f11e,0xda505dec,0xc766f222
	.word  0x84b9c768,0x90c0648e,0xf82e274d,0x815a61f5
	.word  0x6efbb475,0x4c2ad0ca,0x1489f5c3,0x6f8b8017
	.word  0xccbc84bf,0x5a2be05b,0x3f04a3de,0x79587b2f
	.word  0xe87235b5,0xeb6183f0,0x8ac4b7de,0x73a14e2b
	.word  0x0c66da25,0xdeb6deec,0x39fa3230,0xa97d1a07
	.word  0x7861734c,0x3e245115,0x5ff1a4ea,0xeb8230a6
	.word  0x90ebd75e,0x0ab09fac,0x41124af9,0x89e922fc
	.word  0x71db44cd,0x1c66a937,0x88425da0,0x27c345bd
	.word  0xd536a920,0x2883a4c1,0xa569b3ed,0xb9ed1648
	.word  0x12120ccd,0x2ab5c77c,0xb618f13e,0x752768d6
	.word  0x47c61da2,0x58c7d359,0x53745b22,0xaf3eb66f
	.word  0x4384b9b9,0xd8560e37,0x5bf3e537,0x30a4b1aa
	.word  0xb36964f8,0xb9307c92,0xfd8e5378,0x140b6f9a
	.word  0x86b62fe7,0xab6630ef,0xaae8d7e0,0x01e1bc71
	.word  0x0780b81e,0x4852ce36,0xe4bc9d9c,0xc42670e2
	.word  0x9014f9d0,0x408036ce,0x231ea4d5,0x08a93a53
	.word  0xf9a4ffe6,0xb6f7ffbf,0x0cfe61c9,0x77a19339
	.word  0x5c413360,0xda6f1b9d,0x6df78ccc,0x33852b05
	.word  0x3755be92,0x60af2d09,0x76c2f7f0,0xd78747bc
	.word  0x0ab256e3,0xae17912f,0x89311b1f,0xee23d1e2
	.word  0xa1c10c40,0x4dc28a07,0x4ec9d882,0x4953c9ae
	.word  0xcdfe26b4,0x6451d0f1,0x08db6c4f,0x3efe7727
	.word  0xb24f84db,0xacccea1f,0x8391c155,0x613a5403
	.word  0xee6d52c4,0x0492f2bd,0x62424642,0x15825671
	.word  0xa0eb2de0,0xd2f4e8bc,0x6fb42748,0xe05fed9e
	.word  0x790696f4,0x4cf1a394,0x2652923c,0x5f50a2e1
	.word  0xea2ce711,0x94dfadd5,0x2d4f68e4,0x79d7e690
	.word  0x52482a36,0x12f6a66c,0x49c7fdd1,0xcfbd1af3
	.word  0x422112cb,0xe4698ff8,0x983e0a16,0x1bf75101
	.word  0xd3983200,0xb25a77a3,0x4a109897,0x7017a77b
	.word  0xe2e013a1,0x21217663,0xf552259b,0x9fda8a88
	.word  0x3c4a85e9,0x25ef0b3b,0x9b6e0064,0xb7f75fd3
	.word  0x5c48f30e,0x7ffd68d2,0x6370d14a,0xce0c8d24
	.word  0x965ce345,0x3cdfff28,0xe7006ba2,0x05040d6a
	.word  0xb485b451,0xa0cf4f6f,0xb33869bf,0xf4677c2a
	.word  0x7d1dc4a6,0x1508e364,0x4e6db9f0,0x848e683c
	.word  0xe02d7092,0x8fbb92d2,0x72720bee,0xe34653cf
	.word  0x60ef4c0f,0xca906de9,0x85b81117,0xf3d49700
	.word  0x48d04c03,0xd463c3a3,0xf5877877,0x5c1f4001
	.word  0xe252c4c9,0x6dba14ad,0x38d432c8,0x00f90185
	.word  0xc5e586da,0x89c461dc,0x1c998391,0x9cd09e39
	.word  0x686e9f23,0x0c378ee8,0xd622527d,0xfcdb2487
	.word  0xeab9d4c0,0xd5de104e,0xad8aa523,0xfcff923e
	.word  0xcc43524d,0xd3836e11,0xa09859e5,0xc5b34951
	.word  0x959c71c5,0x2f51e7a7,0x8b1dc2a7,0xd2489de9
	.word  0xa8c9ade8,0x69b8225f,0x9773a472,0x28e64846
	.word  0x769821a8,0xfdb4c301,0x8df6ec86,0xc7bb2006
	.word  0x40c8e07c,0xcb152de5,0xb9f88bca,0x4d06234c
	.word  0x13dc7092,0xccaf035e,0xd99b3b9d,0x7b55768e
	.word  0xccec8a8a,0x5ca644d9,0x65d7d835,0x79a5ddf0
	.word  0x513f488c,0x17d37777,0x5df4b99c,0x510fa269
	.word  0x59e6fce2,0x8b7fa162,0xc713759b,0x12f400e2
	.word  0xe71fce0a,0xf4d97607,0xf7c140e7,0x05a787d7
	.word  0x89d18fe1,0x7cb270b2,0xa5807266,0xb62c8ac6
	.word  0xc6cf706c,0x9aece414,0x3ae474d6,0xc26b107b
	.word  0x3af606c8,0x1812dd51,0x6b999583,0xafec6106
	.word  0x751e2833,0x1118d5b5,0xa8060684,0x83eaf7de
	.word  0x97446e7f,0x61acf09a,0x3487aca6,0x4ddb7efd
	.word  0xba32146e,0x7e46e1b3,0xb68218b9,0x12b6858c
	.word  0x42a92a30,0x42040644,0x574a56ed,0xd1c1aec1
	.word  0xa56881ac,0xa8c9075f,0x0c09c2ed,0x6610d2e0
	.word  0x989eb139,0x377d5a46,0x7de00bf3,0x44290ee6
	.word  0x4d97706d,0x1712be7b,0xe8ef24f5,0x59f017df
	.word  0xe9031348,0xcd4076a5,0x17d03d0c,0x4fd0619a
	.word  0xf9e29b19,0x92fc472f,0x19ce781c,0x01291645
	.word  0x5ac7c291,0x55285546,0x5aa56620,0x59b3b4ff
	.word  0xdd65926f,0x4704dbde,0xf55521b7,0x3b33786d
	.word  0xd54a0103,0x98b89cd7,0xe9a92693,0xb8d18479
	.word  0x58fa6418,0x376d2d4e,0xd94bdea7,0xf64cde5f
	.word  0x8313cf24,0x5aea3dde,0xc32f6b18,0x251e4b45
	.word  0x3b4aad43,0x01fe492c,0xe6e274a9,0x516e39f5
	.word  0xe43389d4,0x5a64a40d,0x03c515b9,0xedc3fdc3
	.word  0xa90306f3,0x3b1ee233,0xde8cfa27,0xb2b248a7
	.word  0x61a1c854,0x6ecc51e1,0xfc5c37b6,0x6b86468d
	.word  0x478297f6,0xebf4e8b5,0x84d43c8f,0x31df65a9
	.word  0xfce1e31b,0xd8180ca0,0x3ac7dc81,0xb77f8b08
	.word  0x0c4b35c7,0x44fe4b02,0xc690fe3a,0x9ab2a194
	.word  0xb4b9a97b,0x2ea52e54,0x004d78f6,0xbdde9b23
	.word  0x8988df32,0x3e976446,0x9addb654,0xabe0c77b
	.word  0xcba69d26,0xdf3f32b8,0xc6a556e9,0x9fb00c87
	.word  0x5ea44623,0xe773e27e,0xd4a58934,0x28c26f46
	.word  0xd99217d6,0x2751a0ed,0x36e6214c,0x9b7a23f7
	.word  0x31adaaf8,0x0c951840,0x75aa81ae,0xd37dbb85
	.word  0xb47b5a40,0x3276dc50,0x9f842713,0x8b29e4e1
	.word  0x962ac589,0x2871d787,0xc714394c,0xada4cba9
	.word  0x52781352,0x8dec3a5f,0xeab9eaf3,0xc0b36e6d
	.word  0x8d7a118a,0xb3cd66c7,0x6bb767ee,0xe979f98b
	.word  0x714dbe8b,0x19e1b064,0x6bc32a6c,0xb6f90f4a
	.word  0xe8bf1da9,0x478a5e2d,0x3ca26ccf,0x3970c4fe
	.word  0x7cca486b,0xa8c05713,0x21c739c8,0x7611bd7e
	.word  0xdff07539,0xbb60bd8b,0xe3ba7908,0xb40dda18
	.word  0xe1a78ea1,0x49fe7a53,0x437bf5cb,0x59eaaa47
	.word  0x57ab6f01,0x9b98d6e7,0xf6b1985f,0x53ae25d5
	.word  0x96dcf48b,0xff8772f5,0x3208e6ed,0x98c8fb7b
	.word  0xdc12ad04,0x8b69e518,0x881e7128,0xc55682f8
	.word  0xbcd1abb6,0xdc67194d,0xe2ffc3e3,0x77a406d0
	.word  0x409a6671,0xc2a54f92,0x9cbc2ead,0xe2d96429
	.word  0x48b7809a,0x3e646b27,0x6e143bfb,0xfcc84453
	.word  0xe17e0359,0x7b9d180d,0xa333ba8f,0x185d83db
	.word  0x16b5bbb3,0xec6296a9,0xc0a8222c,0xe9d24fd3
	.word  0xe8bcafb3,0x8340a5d3,0x68bae82d,0xc828e122
	.word  0x72e0c5c7,0x59c66796,0x05bd24b3,0x65a08b56
	.word  0x79fb997b,0xa2f9af8a,0xaf67428d,0x4e923a30
	.word  0xee67fe77,0x7ace89a9,0xc0e41d31,0x10a0a22b
	.word  0xcc3070d3,0xbf88e8ee,0xafde9f83,0xe18f2402
	.word  0x147f1f73,0x321b36fe,0xa2357fea,0x8a679655
	.word  0xf36eabb2,0x609cc889,0x39900c7e,0x298ad184
	.word  0x2c10344d,0xd6fb66c6,0x935e2fda,0xff77747a
	.word  0x06e32946,0x4f6731d6,0xfbd04c1e,0x3a91c855
	.word  0xae4287dc,0xeb9f5719,0x640053cb,0xdf5f609f
	.word  0x70ed1cd7,0x7c923c07,0x2c94defb,0x8a340672
	.word  0xc21f9e9c,0x290eedaa,0x20fedeb1,0x60c60548
	.word  0xfbaea03a,0x9f33fd8b,0x865fc114,0x88eaa0cd
	.word  0x822b149c,0x1bbe18ae,0xac5b3337,0x86c31803
	.word  0x77357f0f,0x762490cc,0xcc46a0e3,0x69a0b663
	.word  0x1a0ba506,0x61aa1ca4,0x60113a0a,0x9fc45da6
	.word  0x86d234a9,0x528b178f,0x78c09398,0x520adf5d
	.word  0x4e503037,0x2618b6a4,0x43977bac,0xeb5e90d0
	.word  0x2561e3cf,0x8d5c2897,0x6e0b2965,0xf396990f
	.word  0x16e64216,0xff69f8c6,0x745b6d2f,0xce7a9708
	.word  0x4e6da704,0x226af60e,0x3468b5d8,0xb2262e1b
	.word  0xfdfac078,0x1b46902c,0x8dd1a836,0xe184de63
	.word  0xaa5f9d8b,0xa9ce9cc1,0x5f861cf5,0x03096e70
	.word  0x34d2ad50,0x81816c1f,0x9afc0f4f,0xfaf1e466
	.word  0x8026d835,0xf4dae91e,0xdd5196dc,0x12096b7f
	.word  0x58c40c62,0xad7c2795,0x124d2c18,0xcfae42d5
	.word  0xcf88bc21,0x39fd44c1,0x58cdbd91,0xdcb33cfe
	.word  0x3a544fca,0xdde63d51,0x109cc4a6,0x986a145d
	.word  0x7946160f,0x44c505d9,0x0898cc8b,0xa7479576
	.word  0x8cb51a65,0xbc36ad38,0xe836d79d,0xa769edec
	.word  0x23755098,0xc77922ec,0x84dde9b3,0x403ff45f
	.word  0x2a71cbfa,0xc56be41b,0x5dddb261,0x8c27338c
	.word  0x06610236,0xcae566d2,0x6103b667,0xfc786e98
	.word  0x6d12b601,0xadca9070,0xbff78e12,0x465af1e5
	.word  0x13f9bdde,0x84d2b6ea,0xf7bdaf64,0xba90886d
	.word  0x7d34c637,0xa31e163b,0x89b517c7,0x8801538f
	.word  0x29bdbd78,0xf18da52f,0x3eaed569,0x72abd35d
	.word  0x21676aa2,0x06cc692e,0x9d7708cc,0x778d2b45
	.word  0x4cf93f81,0x9060150a,0x6babd18f,0x4e2aa432
	.word  0xf55e877e,0x91e383b3,0x2b0b5222,0x7e941e3f
	.word  0xcc832519,0xa2d87b39,0x74eccb3a,0xc30a1ab0
	.word  0xfc431c06,0xb5a4f58c,0x40ff5023,0xacc464a6
	.word  0x760aebb0,0x4abcc90a,0x490baddd,0x07c5130e
	.word  0xd7f97ea1,0x7cbcbd37,0x3b80806a,0x17567fad
	.word  0x836607f2,0xe1876e80,0x95b95f5e,0x68fe59b0
	.word  0x2be5c440,0x3cd59586,0xe4d440dd,0x8ebc7cab
	.word  0x6f2c9028,0x53c9ca04,0x330d7dcb,0xc635d6b8
	.word  0x292d04b1,0x03c78277,0xfb248e3d,0x9012816d
	.word  0x638a6eb2,0x399817ec,0x0a463305,0x06e42d6b
	.word  0xc9236fae,0x31cf73f6,0x3def1fc7,0xcb4d45be
	.word  0xfaf82505,0x47a55e2c,0xa6558fab,0x6ded87cf
	.word  0x34eb959a,0xa25b0974,0xbe723225,0x15aa4913
	.word  0x0e590821,0xec9433ac,0xc8f73ab1,0xe33bf7e1
	.word  0x7d25a73a,0xcd3efe4c,0x629cd7ff,0x6b569cc2
	.word  0xeec1c432,0x6ba9adf8,0x16d78ccc,0x6e1b9c98
	.word  0x37f27926,0x561d2f94,0x3e66e402,0x755ebb4e
	.word  0x40d143e5,0x3dc8bf18,0x616a67ed,0x8bc904f7
	.word  0x3abbdf51,0xca269ac2,0x7dc51e59,0x9029e9fe
	.word  0xa2104358,0x4390a610,0x435512da,0xbfd1c453
	.word  0xba01c873,0x08059941,0xe6ef03fe,0xb579fc10
	.word  0x61a1dbd4,0x0e7eb42a,0x884a78d4,0x4308017e
	.word  0x9768e053,0x693ce125,0xd858b0c0,0x5266954d
	.word  0x775fcfa1,0x0b73601f,0xeb8ab20b,0xa8e8ac9b
	.word  0x6dee2189,0xfcce6ec1,0xeb35eb04,0x65e60921



#if 0
!!# /*
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!# 
!!#   int label_cnt = 0;
!!#   int irf_err_cnt = 0;
!!#   int ic_err_cnt = 0;
!!#   int dc_err_cnt = 0;
!!#   int bitnum = 0, bitnum2 = 0;
!!#   int i = 0, occ = 0, regid = 0;
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
!!#   printf ("**********************************\n");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 35, ijdefault, Ft_Rs1, "{3..8}");
!!#   IJ_set_ropr_fld ("diag.j", 36, ijdefault, Ft_Rs2, "{9..15}");
!!#   IJ_set_ropr_fld ("diag.j", 37, ijdefault, Ft_Rd, "{17..31}");
!!#   IJ_set_ropr_fld ("diag.j", 38, ijdefault, Ft_Simm13, "13'b0rrrrrrrrrrrr");
!!#   IJ_set_ropr_fld ("diag.j", 39, ijdefault, Fm_align_Simm13, "3'b111");
!!#   IJ_set_ropr_fld ("diag.j", 40, ijdefault, Fm_align_Rd, "1'b1");
!!#   IJ_set_ropr_fld ("diag.j", 41, ijdefault, Ft_Imm_Asi, "{0x80}");
!!#   IJ_set_ropr_fld ("diag.j", 42, ijdefault, Ft_Cc1_f2, "1'br");
!!#   IJ_set_ropr_fld ("diag.j", 43, ijdefault, Ft_Cc0_f2, "1'b0");
!!#   IJ_set_ropr_fld ("diag.j", 44, ijdefault, Ft_P, "1'br");
!!#   IJ_set_ropr_fld ("diag.j", 45, ijdefault, Ft_A, "1'br");  
!!#   IJ_set_ropr_fld ("diag.j", 46, ijdefault, Ft_D16, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 47, ijdefault, Ft_Disp22, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 48, ijdefault, Ft_Disp19, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 49, ijdefault, Ft_Disp30, "{0x1, 0x3}");
!!#   IJ_set_ropr_fld ("diag.j", 50, ijdefault, Ft_Cmask, "3'brrr");
!!#   IJ_set_ropr_fld ("diag.j", 51, ijdefault, Ft_Mmask, "4'brrrr");
!!# 
!!#   //Internal asi stores to err regs and data tag
!!#   IJ_set_ropr_fld ("diag.j", 54, Ro_int_asi, Ft_Rs1, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 55, Ro_int_asi, Ft_Rs2, "{2}");
!!#   IJ_set_ropr_fld ("diag.j", 56, Ro_int_asi, Ft_Rd, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 57, Ro_int_asi, Ft_Imm_Asi, "{0x4c,0x4b,0x47}");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 59, Ro_unaligned_addr, Fm_align_Simm13, "3'b000");
!!#   IJ_set_ropr_fld ("diag.j", 60, Ro_unaligned_addr, Ft_Simm13, "13'b0rrrrrrrrrrr1");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 62, Ro_dcerr, Ft_Rs2, "{10}");
!!#   IJ_set_ropr_fld ("diag.j", 63, Ro_ldmiss, Ft_Rs2, "{9}");
!!# 
!!#   IJ_bind_thread_group("diag.j", 65, th_all, 0x1);
!!# 
!!#   IJ_th_fork_group ("diag.j", 75, th_all);
!!# 
!!#   //Keep r16 as the scratch register
!!#   //Initialize Rd
!!#   IJ_set_rvar ("diag.j", 79, reg_rand_init, "64'hrrrrrrrr rrrrrrrr");
!!#   for (i = 17; i < 32; i++) {
!!#      IJ_printf ("diag.j", 81, th_all, "\tsetx  0x%016llrx, %%r16, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   //Initialize Rs2
!!#   IJ_set_rvar ("diag.j", 85, reg_rand_init, "64'h0000000000000rr0");
!!#   for (i = 9; i < 16; i++) {  
!!#     IJ_printf ("diag.j", 87, th_all, "\tsetx  0x%016llrx, %%r16, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   //Initialize Rs1
!!#   for (i = 3; i < 9; i++) {
!!#      IJ_printf ("diag.j", 92, th_all, "\tsetx MAIN_BASE_DATA_VA, %%r16, %%r%d\n", i);
!!#   }
!!# 
!!#   //initialize %r2 for int asi store addresses
!!#   IJ_set_rvar ("diag.j", 96, int_asi_reg_rand_init, "{0x0..0x3ff0}");
!!#   IJ_printf ("diag.j", 97, th_all, "\tsetx  0x%016llrx, %%r16, %%r2\n", int_asi_reg_rand_init);
!!# 
!!#   IJ_printf ("diag.j", 99, th_all, "\twr %%r0, 0x4, %%fprs\n");
!!#   IJ_init_fp_regs ("diag.j", 100, th_all, 4);
!!#   IJ_printf ("diag.j", 101, th_all, "\tta T_CHANGE_HPRIV !To allow ASI writes to D-I caches\n");
!!#   IJ_printf ("diag.j", 102, th_all, "\twr  %%r0, 0x80, %%asi\n");
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#   IJ_th_join ("diag.j", 106,0xf);
!!#   IJ_th_start ("diag.j", 107,Seq_Start, NULL, 2); 
!!# 
!!#   IJ_printf ("diag.j", 109, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 110, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 111, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 112, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 113, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 114, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 115, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 116, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 117, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 118, th_all, "	ta    T_GOOD_TRAP\n\n");
!!# 
!!#   IJ_set_rvar ("diag.j", 120, data_rand_init, "32'hrrrrrrrr");
!!#   IJ_printf ("diag.j", 121, th_all, ".data\n");
!!#   for (i = 0; i < 128; i++) {
!!#     IJ_printf ("diag.j", 123, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#     IJ_printf ("diag.j", 124, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
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
!!#             | inst_block inst_type
!!#             ;
!!# 
!!# inst_type: store_chunk_1 | store_chunk_2 | store_chunk_3
!!# ;
!!# 
!!# store_chunk_1: d0 store_i store_i store_i store_i store_i store_i
!!#      {
!!#         IJ_printf ("diag.j", 154, th_all, "!Generating store chunk 1\n");
!!#         IJ_printf ("diag.j", 155, th_all, "\tset 0x2, %%g1\n");
!!#         IJ_printf ("diag.j", 156, th_all, "\tsubcc %%g1, 0x1, %%g1\n");
!!#         IJ_printf ("diag.j", 157, th_all, ".align 0x20\n");
!!#         IJ_printf ("diag.j", 158, th_all, "thr%y_loop_%d:\n",label_cnt);
!!#         i = ((random() % 20 + 10)*8) - 1;  
!!#         IJ_generate_from_token ("diag.j", 160,i, th_all, ijdefault, tADD_R, tADD_I, tAND_R, tAND_I, tOR_R, tOR_I, -1);; 
!!#         IJ_generate_va ("diag.j", 161,th_all, $2, $3, $4, $5, $6, $7, -1);;
!!#      } 
!!#      st_irferr_unalgn trpm_alu store_i 
!!#      {
!!#         IJ_generate ("diag.j", 165, th_all, $11);
!!#      }
!!#      store9 inst10 
!!#      {
!!#         IJ_generate_from_token ("diag.j", 169,3, th_all, ijdefault, tADD_R, tADD_I, tAND_R, tAND_I, tOR_R, tOR_I, -1);; 
!!#         IJ_printf ("diag.j", 170, th_all, "\tbne thr%y_loop_%d\n",label_cnt);
!!#         IJ_printf ("diag.j", 171, th_all, "\tsubcc %%g1, 0x1, %%g1\n");
!!#         label_cnt++;   
!!#      }
!!# ;
!!# 
!!# store_chunk_2: d1 store_i store_i store_i store_i store_i store_i store_i store_i
!!#      {
!!#         IJ_printf ("diag.j", 178, th_all, "!Generating store_chunk_2\n");
!!#         IJ_printf ("diag.j", 179, th_all, "\tset 0x2, %%g1\n");
!!#         IJ_printf ("diag.j", 180, th_all, "\tsubcc %%g1, 0x1, %%g1\n");
!!#         IJ_printf ("diag.j", 181, th_all, ".align 0x20\n");
!!#         IJ_printf ("diag.j", 182, th_all, "thr%y_loop_%d:\n",label_cnt);
!!#         i = ((random() % 20 + 10)*8) - 2;  
!!#         IJ_generate_from_token ("diag.j", 184,i, th_all, ijdefault, tADD_R, tADD_I, tAND_R, tAND_I, tOR_R, tOR_I, -1);; 
!!#         IJ_generate_va ("diag.j", 185,th_all, $2, $3, $4, $5, $6, $7, $8, $9, -1);;
!!#      }
!!#      dcw2 store9 inst10
!!#      {
!!#         IJ_generate_from_token ("diag.j", 189,3, th_all, ijdefault, tADD_R, tADD_I, tAND_R, tAND_I, tOR_R, tOR_I, -1);; 
!!#         IJ_printf ("diag.j", 190, th_all, "\tbne thr%y_loop_%d\n",label_cnt);
!!#         IJ_printf ("diag.j", 191, th_all, "\tsubcc %%g1, 0x1, %%g1\n");
!!#         label_cnt++;   
!!#      }
!!# ;
!!# 
!!# store_chunk_3: d2 store_i store_i store_i store_i store_i store_i store_i store_i load_r %ropr  Ro_ldmiss
!!#      {
!!#         IJ_printf ("diag.j", 198, th_all, "!Generating store_chunk_3\n");
!!#         IJ_printf ("diag.j", 199, th_all, "\tset 0x2, %%g1\n");
!!#         IJ_printf ("diag.j", 200, th_all, "\tsubcc %%g1, 0x1, %%g1\n");
!!#         IJ_printf ("diag.j", 201, th_all, ".align 0x20\n");
!!#         IJ_printf ("diag.j", 202, th_all, "thr%y_loop_%d:\n",label_cnt);
!!#         i = ((random() % 20 + 10)*8) - 1;  
!!#         IJ_generate_from_token ("diag.j", 204,i, th_all, ijdefault, tADD_R, tADD_I, tAND_R, tAND_I, tOR_R, tOR_I, -1);; 
!!#         IJ_generate_va ("diag.j", 205,th_all, $2, $3, $4, $5, $6, $7, $8, $9, $10, -1);;
!!#      }
!!#      store9 inst10
!!#      {
!!#         IJ_generate_from_token ("diag.j", 209,2, th_all, ijdefault, tADD_R, tADD_I, tAND_R, tAND_I, tOR_R, tOR_I, -1);; 
!!#         IJ_printf ("diag.j", 210, th_all, "\tsetx  0x%016llrx, %%r16, %%r9\n", reg_rand_init);  
!!#         IJ_printf ("diag.j", 211, th_all, "\tbne thr%y_loop_%d\n",label_cnt);
!!#         IJ_printf ("diag.j", 212, th_all, "\tsubcc %%g1, 0x1, %%g1\n");
!!#         label_cnt++;   
!!#      }
!!# ;
!!# 
!!# st_irferr_unalgn: irferr store_i 
!!# 		    {
!!# 		       IJ_generate ("diag.j", 219, th_all, $2);
!!# 		    }
!!#                   | d5 store_i %ropr  Ro_unaligned_addr
!!#                     {
!!# 		      IJ_generate ("diag.j", 223, th_all, $2);
!!#                     }
!!#                   | d4 store_i
!!#                     {
!!# 		      IJ_generate ("diag.j", 227, th_all, $2);
!!#                     }
!!# 		  | d6 irferr store_i  %ropr  Ro_unaligned_addr
!!#                     {
!!# 		      IJ_generate ("diag.j", 231, th_all, $3);
!!#                     }
!!# ;
!!# 
!!# store9: st 
!!#            {
!!#               IJ_generate ("diag.j", 237, th_all, $1);
!!#            }
!!#         | icerr_2 st
!!#            {
!!#               IJ_generate ("diag.j", 241, th_all, $2);
!!#            }
!!# ;
!!# 
!!# inst10: alu 
!!#         {IJ_generate ("diag.j", 246, th_all, $1);}
!!#        | lop 
!!#         {IJ_generate ("diag.j", 248, th_all, $1);}
!!#        | setx
!!#         {IJ_generate ("diag.j", 250, th_all, $1);}
!!# ;
!!# 
!!# dcw2: dcerr load_r %ropr  Ro_dcerr
!!#       {
!!#          IJ_generate ("diag.j", 255, th_all, $2);
!!#       } alu 
!!#       {
!!# 	 IJ_generate ("diag.j", 258, th_all, $4);
!!#       }
!!# ;
!!# 
!!# st: st_fp | atomic | st_int_asi | st_ext_asi | store_i 
!!# ;
!!# 
!!# icerr_2: mMETA3
!!# {
!!#    IJ_printf ("diag.j", 267, th_all, "thr%y_ic_err_%d:\n", ic_err_cnt);
!!#    i = random () % 3;
!!#    if (i == 0) {
!!# //      IJ_printf (th_all, "!ic err IR\n");
!!#       bitnum = random () % 34;
!!#       IJ_printf ("diag.j", 272, th_all, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),2,IC_DATA,IR,%d,x)\n", ic_err_cnt,bitnum);
!!#    } else if (i == 1) {
!!# //      IJ_printf (th_all, "!ic err NIR\n");
!!#       bitnum = random () % 34;
!!#       IJ_printf ("diag.j", 276, th_all, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),2,IC_DATA,NIR,x,%d)\n", ic_err_cnt,bitnum);
!!#    } else {
!!# //      IJ_printf (th_all, "!ic err IR_NIR\n");
!!#       bitnum = random () % 34;
!!#       bitnum2 = random () % 34;
!!#       IJ_printf ("diag.j", 281, th_all, "!$EV error(%y,expr(@VA(.MAIN.thr%y_ic_err_%d), 16, 16),2,IC_DATA,IR_NIR,%d,%d)\n", ic_err_cnt,bitnum,bitnum2);
!!#    }
!!#    ic_err_cnt++;
!!# }
!!# ;
!!# 
!!# dcerr: mMETA5
!!# {
!!#    IJ_printf ("diag.j", 289, th_all, "thr%y_dc_err_%d:\n", dc_err_cnt);
!!#    bitnum = random () % 72;
!!#    IJ_printf ("diag.j", 291, th_all, "!$EV error(%y,expr(@VA(.MAIN.thr%y_dc_err_%d), 16, 16),2,DC_DATA,%d)\n", dc_err_cnt,bitnum);
!!#    dc_err_cnt++;
!!# }
!!# ;
!!# 
!!# irferr: mMETA100
!!# {
!!#      IJ_printf ("diag.j", 298, th_all, "thr%y_irf_ce_%d:\n", irf_err_cnt);
!!# //     bitnum = random () % 72;
!!#      bitnum = random () % 70;
!!#      occ = random () % 2 + 1;
!!#      IJ_printf ("diag.j", 302, th_all, "!$EV error(%y,expr(@VA(.MAIN.thr%y_irf_ce_%d), 16, 16),%d,IRF,ce,%d,x, x,x,x, x,x,x)\n", irf_err_cnt, occ, bitnum);
!!#      irf_err_cnt++;
!!# }
!!# ;
!!# 
!!# trpm_alu: d25 alu 
!!#             { 
!!#               IJ_generate ("diag.j", 309, th_all, $2);
!!#             }
!!#           | trpm
!!# ;
!!# 
!!# lop: mul | div | fpop | load | asi_load | br | membar | flush | prefetch
!!# ;
!!# 
!!# fpop:d60 st_fp 
!!#        {$$ = $2}
!!#      | arith_fp
!!# ;
!!# 
!!# mul: tMULX_R | tMULX_I | tUMUL_R | tUMUL_I | tSMUL_R | tSMUL_I 
!!# ;
!!# 
!!# div: tUDIV_I | tUDIV_R | tSDIV_I | tSDIV_R | tSDIVX_R | tSDIVX_I | tUDIVX_R 
!!#      | tUDIVX_I 
!!# ;
!!# 
!!# load: load_i | load_r
!!# ;
!!# 
!!# load_r: tLDSB_R  | tLDSH_R | tLDSW_R | tLDUB_R | tLDUH_R | tLDUW_R | tLDX_R | tLDD_R 
!!# ;
!!# 
!!# load_i: tLDSB_I  | tLDSH_I | tLDSW_I | tLDUB_I | tLDUH_I | tLDUW_I | tLDX_I | tLDD_I 
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
!!#   regid = random () % 5 + 11;
!!#   IJ_printf ("diag.j", 370, th_all, "\tsetx  0x%016llrx, %%r16, %%r%d\n", reg_rand_init, regid);
!!#   if (regid % 2 == 0) {
!!#     IJ_printf ("diag.j", 372, th_all, "\tsetx  0x%016llrx, %%r16, %%r2\n", int_asi_reg_rand_init);
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
!!# st_int_asi: d3 tSTXA_R %ropr  Ro_int_asi 
!!# {$$ = $2}
!!# ;
!!# 
!!# trpm: mMETA6
!!# {
!!#   IJ_printf ("diag.j", 390, th_all, "\t.word 0xae010045\n");
!!# }
!!# ;
!!# 
!!# alu: tADD_R | tADD_I | tAND_R | tAND_I | tANDN_R | tANDN_I 
!!#      | tOR_R | tOR_I | tORN_R | tORN_I | tXOR_R | tXOR_I 
!!#      | tXNOR_R | tXNOR_I | tMOVR_R | tMOVR_I | tSLL_R | tSLL_I 
!!#      | tSRL_R | tSRL_I | tSRA_R | tSRA_I | tSLLX_R | tSLLX_I 
!!#      | tSRLX_R | tSRLX_I | tSRAX_R | tSRAX_I | tSUB_R | tSUB_I 
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
!!# d3: mMETA9
!!# ;
!!# 
!!# d4: mMETA10
!!# ;
!!# 
!!# d5: mMETA11
!!# ;
!!# 
!!# d6: mMETA12
!!# ;
!!# 
!!# d25: mMETA25000
!!# ;
!!# 
!!# d60: mMETA60
!!# ;
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

